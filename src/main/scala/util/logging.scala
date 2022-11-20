//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Logger for Debugging
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

package boom.util

import chisel3._
import freechips.rocketchip.util.WideCounter
import scala.reflect.runtime.universe._

package object logging {
  /**
   * Object for generating debug logs.
   *
   * Suggested naming conventions:
   *
   * 1. Instructions: `"inst" -> inst.toHex`.
   *
   * 2. Program counter: `"pc" -> pc.toHex`.
   */
  object dbg  // scalastyle:ignore
  {
    def apply(dps: LoggablePair*): Unit = {
      // TODO: `WideCounter` mey initialize additional registers
      val modName = Module.currentModule.map(_.name).getOrElse("<global>")
      val lastTrace = new Exception().getStackTrace()(1)
      val sourcePosition = s"${lastTrace.getFileName}:${lastTrace.getLineNumber}"
      val items = LoggableTuple("module", modName) +:
                  LoggableTuple("source", sourcePosition) +:
                  LoggableTuple("cycle", WideCounter(32).value) +:
                  dps
      printf(PString("{") +
        Printables(items.flatMap(i => Seq(i.toKeyValue, PString(","))).dropRight(1)) +
        PString("}\n"))
    }
  }

  /**
   * Formats for logging `chisel3.Bits`.
   */
  object BitsFormats extends Enumeration
  {
    type BitsFormat = Value

    val Dec, Hex, Bin = Value
  }

  /**
   * Represents objects that can be casted between `BitFormats`.
   */
  sealed trait HasBitsFormats
  {
    def toDec: HasBitsFormats
    def toHex: HasBitsFormats
    def toBin: HasBitsFormats
  }

  /**
   * Represents a loggable object.
   */
  sealed trait Loggable
  {
    def toPrintable: Printable
  }

  /**
   * Represents a loggable key-value pairs.
   */
  sealed trait LoggablePair extends Loggable
  {
    def key: Printable
    def value: Loggable

    override def toPrintable: Printable = value.toPrintable

    def toKeyValue: Printable = key + PString(":") + value.toPrintable
  }

  /**
   * Wrapper for tuples.
   */
  case class LoggableTuple(tuple: (String, Loggable)) extends LoggablePair {
    override def key: Printable = PString(escape(tuple._1))
    override def value: Loggable = tuple._2
  }

  /**
   * Wrapper for `chisel3.Bits`.
   */
  case class LoggableBits(bits: Bits, fmt: BitsFormats.BitsFormat)
    extends LoggablePair with HasBitsFormats
  {
    override def key: Printable = PString("\"") + Name(bits) + PString("\"")
    override def value: Loggable = this

    override def toPrintable: Printable = fmt match {
      case BitsFormats.Dec => Decimal(bits)
      case BitsFormats.Hex => PString("\"0x") + Hexadecimal(bits) + PString("\"")
      case BitsFormats.Bin => PString("\"0b") + Binary(bits) + PString("\"")
    }

    override def toDec: LoggableBits = LoggableBits(bits, BitsFormats.Dec)
    override def toHex: LoggableBits = LoggableBits(bits, BitsFormats.Hex)
    override def toBin: LoggableBits = LoggableBits(bits, BitsFormats.Bin)
  }

  /**
   * Wrapper for strings.
   */
  case class LoggableString(str: String) extends Loggable
  {
    override def toPrintable: Printable = PString(escape(str))
  }

  /**
   * Wrapper for sequences.
   */
  case class LoggableSeq[T <: Bits](seq: Seq[T], fmt: BitsFormats.BitsFormat)
    extends Loggable with HasBitsFormats
  {
    override def toPrintable: Printable = seqToPrintable(seq, fmt)

    override def toDec: LoggableSeq[T] = LoggableSeq(seq, BitsFormats.Dec)
    override def toHex: LoggableSeq[T] = LoggableSeq(seq, BitsFormats.Hex)
    override def toBin: LoggableSeq[T] = LoggableSeq(seq, BitsFormats.Bin)
  }

  /**
   * Wrapper for `chisel3.Vec`.
   */
  case class LoggableVec[T <: Bits](vec: Vec[T], fmt: BitsFormats.BitsFormat)
    extends LoggablePair with HasBitsFormats
  {
    override def key: Printable = PString("\"") + Name(vec) + PString("\"")
    override def value: Loggable = this

    override def toPrintable: Printable = seqToPrintable(vec, fmt)

    override def toDec: LoggableVec[T] = LoggableVec(vec, BitsFormats.Dec)
    override def toHex: LoggableVec[T] = LoggableVec(vec, BitsFormats.Hex)
    override def toBin: LoggableVec[T] = LoggableVec(vec, BitsFormats.Bin)
  }

  /**
   * Implicit conversions for `Debuggable`s.
   */
  import scala.language.implicitConversions
  implicit def bitsToLoggable(b: Bits): LoggableBits = LoggableBits(b, BitsFormats.Dec)
  implicit def tupleToLoggable(t: (String, Loggable)): LoggableTuple = LoggableTuple(t)
  implicit def stringToLoggable(s: String): LoggableString = LoggableString(s)
  implicit def seqToLoggable[T <: Bits](s: Seq[T]): LoggableSeq[T] = LoggableSeq(s, BitsFormats.Dec)
  implicit def vecToLoggable[T <: Bits](v: Vec[T]): LoggableVec[T] = LoggableVec(v, BitsFormats.Dec)
  implicit def sbToLoggable(t: (String, Bits)): LoggableTuple = LoggableTuple((t._1, t._2))
  implicit def siToLoggable(t: (String, Int)): LoggableTuple = LoggableTuple((t._1, t._2.U))
  implicit def sStrToLoggable(t: (String, String)): LoggableTuple = LoggableTuple((t._1, t._2))
  implicit def sSeqToLoggable[T <: Bits](t: (String, Seq[T])): LoggableTuple = LoggableTuple((t._1, t._2))
  implicit def sVecToLoggable[T <: Bits](t: (String, Vec[T])): LoggableTuple = LoggableTuple((t._1, t._2))

  /**
   * Escapes a specific string.
   * @param str input raw string
   * @return escaped string
   */
  private def escape(str: String): String = Literal(Constant(str)).toString

  /**
   * Converts a sequence of chisel3 bits to `Printable`.
   * @param seq the bits sequence
   * @param fmt print format of bits
   * @tparam T type of bits
   * @return a printable object
   */
  private def seqToPrintable[T <: Bits](seq: Seq[T], fmt: BitsFormats.BitsFormat): Printable =
    if (seq.isEmpty) PString("[]")
    else PString("[") +
      Printables(seq
        .flatMap(i => Seq(LoggableBits(i, fmt).toPrintable, PString(",")))
        .dropRight(1)) +
      PString("]")
}
