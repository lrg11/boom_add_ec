module DivSqrtRecF64_mulAddZ31(
  input          clock,
  input          reset,
  output         io_inReady_div,
  output         io_inReady_sqrt,
  input          io_inValid,
  input          io_sqrtOp,
  input  [64:0]  io_a,
  input  [64:0]  io_b,
  input  [2:0]   io_roundingMode,
  input          io_detectTininess,
  output [3:0]   io_usingMulAdd,
  output         io_latchMulAddA_0,
  output [53:0]  io_mulAddA_0,
  output         io_latchMulAddB_0,
  output [53:0]  io_mulAddB_0,
  output [104:0] io_mulAddC_2,
  input  [104:0] io_mulAddResult_3,
  output         io_outValid_div,
  output         io_outValid_sqrt,
  output [64:0]  io_out,
  output [4:0]   io_exceptionFlags
);
  wire  divSqrtRecF64ToRaw_clock; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_reset; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_inReady_div; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_inReady_sqrt; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_inValid; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_sqrtOp; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire [64:0] divSqrtRecF64ToRaw_io_a; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire [64:0] divSqrtRecF64ToRaw_io_b; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire [2:0] divSqrtRecF64ToRaw_io_roundingMode; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire [3:0] divSqrtRecF64ToRaw_io_usingMulAdd; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_latchMulAddA_0; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire [53:0] divSqrtRecF64ToRaw_io_mulAddA_0; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_latchMulAddB_0; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire [53:0] divSqrtRecF64ToRaw_io_mulAddB_0; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire [104:0] divSqrtRecF64ToRaw_io_mulAddC_2; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire [104:0] divSqrtRecF64ToRaw_io_mulAddResult_3; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_rawOutValid_div; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_rawOutValid_sqrt; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire [2:0] divSqrtRecF64ToRaw_io_roundingModeOut; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_invalidExc; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_infiniteExc; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_rawOut_isNaN; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_rawOut_isInf; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_rawOut_isZero; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  divSqrtRecF64ToRaw_io_rawOut_sign; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire [12:0] divSqrtRecF64ToRaw_io_rawOut_sExp; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire [55:0] divSqrtRecF64ToRaw_io_rawOut_sig; // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
  wire  roundRawFNToRecFN_io_invalidExc; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  wire  roundRawFNToRecFN_io_infiniteExc; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  wire  roundRawFNToRecFN_io_in_isInf; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  wire  roundRawFNToRecFN_io_in_isZero; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  wire  roundRawFNToRecFN_io_in_sign; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  wire [12:0] roundRawFNToRecFN_io_in_sExp; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  wire [55:0] roundRawFNToRecFN_io_in_sig; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  wire [2:0] roundRawFNToRecFN_io_roundingMode; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  wire  roundRawFNToRecFN_io_detectTininess; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  wire [64:0] roundRawFNToRecFN_io_out; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  wire [4:0] roundRawFNToRecFN_io_exceptionFlags; // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
  DivSqrtRecF64ToRaw_mulAddZ31 divSqrtRecF64ToRaw ( // @[DivSqrtRecF64_mulAddZ31.scala 750:36]
    .clock(divSqrtRecF64ToRaw_clock),
    .reset(divSqrtRecF64ToRaw_reset),
    .io_inReady_div(divSqrtRecF64ToRaw_io_inReady_div),
    .io_inReady_sqrt(divSqrtRecF64ToRaw_io_inReady_sqrt),
    .io_inValid(divSqrtRecF64ToRaw_io_inValid),
    .io_sqrtOp(divSqrtRecF64ToRaw_io_sqrtOp),
    .io_a(divSqrtRecF64ToRaw_io_a),
    .io_b(divSqrtRecF64ToRaw_io_b),
    .io_roundingMode(divSqrtRecF64ToRaw_io_roundingMode),
    .io_usingMulAdd(divSqrtRecF64ToRaw_io_usingMulAdd),
    .io_latchMulAddA_0(divSqrtRecF64ToRaw_io_latchMulAddA_0),
    .io_mulAddA_0(divSqrtRecF64ToRaw_io_mulAddA_0),
    .io_latchMulAddB_0(divSqrtRecF64ToRaw_io_latchMulAddB_0),
    .io_mulAddB_0(divSqrtRecF64ToRaw_io_mulAddB_0),
    .io_mulAddC_2(divSqrtRecF64ToRaw_io_mulAddC_2),
    .io_mulAddResult_3(divSqrtRecF64ToRaw_io_mulAddResult_3),
    .io_rawOutValid_div(divSqrtRecF64ToRaw_io_rawOutValid_div),
    .io_rawOutValid_sqrt(divSqrtRecF64ToRaw_io_rawOutValid_sqrt),
    .io_roundingModeOut(divSqrtRecF64ToRaw_io_roundingModeOut),
    .io_invalidExc(divSqrtRecF64ToRaw_io_invalidExc),
    .io_infiniteExc(divSqrtRecF64ToRaw_io_infiniteExc),
    .io_rawOut_isNaN(divSqrtRecF64ToRaw_io_rawOut_isNaN),
    .io_rawOut_isInf(divSqrtRecF64ToRaw_io_rawOut_isInf),
    .io_rawOut_isZero(divSqrtRecF64ToRaw_io_rawOut_isZero),
    .io_rawOut_sign(divSqrtRecF64ToRaw_io_rawOut_sign),
    .io_rawOut_sExp(divSqrtRecF64ToRaw_io_rawOut_sExp),
    .io_rawOut_sig(divSqrtRecF64ToRaw_io_rawOut_sig)
  );
  RoundRawFNToRecFN_2 roundRawFNToRecFN ( // @[DivSqrtRecF64_mulAddZ31.scala 774:15]
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_infiniteExc(roundRawFNToRecFN_io_infiniteExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundRawFNToRecFN_io_roundingMode),
    .io_detectTininess(roundRawFNToRecFN_io_detectTininess),
    .io_out(roundRawFNToRecFN_io_out),
    .io_exceptionFlags(roundRawFNToRecFN_io_exceptionFlags)
  );
  assign io_inReady_div = divSqrtRecF64ToRaw_io_inReady_div; // @[DivSqrtRecF64_mulAddZ31.scala 752:21]
  assign io_inReady_sqrt = divSqrtRecF64ToRaw_io_inReady_sqrt; // @[DivSqrtRecF64_mulAddZ31.scala 753:21]
  assign io_usingMulAdd = divSqrtRecF64ToRaw_io_usingMulAdd; // @[DivSqrtRecF64_mulAddZ31.scala 760:23]
  assign io_latchMulAddA_0 = divSqrtRecF64ToRaw_io_latchMulAddA_0; // @[DivSqrtRecF64_mulAddZ31.scala 761:23]
  assign io_mulAddA_0 = divSqrtRecF64ToRaw_io_mulAddA_0; // @[DivSqrtRecF64_mulAddZ31.scala 762:23]
  assign io_latchMulAddB_0 = divSqrtRecF64ToRaw_io_latchMulAddB_0; // @[DivSqrtRecF64_mulAddZ31.scala 763:23]
  assign io_mulAddB_0 = divSqrtRecF64ToRaw_io_mulAddB_0; // @[DivSqrtRecF64_mulAddZ31.scala 764:23]
  assign io_mulAddC_2 = divSqrtRecF64ToRaw_io_mulAddC_2; // @[DivSqrtRecF64_mulAddZ31.scala 765:23]
  assign io_outValid_div = divSqrtRecF64ToRaw_io_rawOutValid_div; // @[DivSqrtRecF64_mulAddZ31.scala 770:22]
  assign io_outValid_sqrt = divSqrtRecF64ToRaw_io_rawOutValid_sqrt; // @[DivSqrtRecF64_mulAddZ31.scala 771:22]
  assign io_out = roundRawFNToRecFN_io_out; // @[DivSqrtRecF64_mulAddZ31.scala 780:23]
  assign io_exceptionFlags = roundRawFNToRecFN_io_exceptionFlags; // @[DivSqrtRecF64_mulAddZ31.scala 781:23]
  assign divSqrtRecF64ToRaw_clock = clock;
  assign divSqrtRecF64ToRaw_reset = reset;
  assign divSqrtRecF64ToRaw_io_inValid = io_inValid; // @[DivSqrtRecF64_mulAddZ31.scala 754:40]
  assign divSqrtRecF64ToRaw_io_sqrtOp = io_sqrtOp; // @[DivSqrtRecF64_mulAddZ31.scala 755:40]
  assign divSqrtRecF64ToRaw_io_a = io_a; // @[DivSqrtRecF64_mulAddZ31.scala 756:40]
  assign divSqrtRecF64ToRaw_io_b = io_b; // @[DivSqrtRecF64_mulAddZ31.scala 757:40]
  assign divSqrtRecF64ToRaw_io_roundingMode = io_roundingMode; // @[DivSqrtRecF64_mulAddZ31.scala 758:40]
  assign divSqrtRecF64ToRaw_io_mulAddResult_3 = io_mulAddResult_3; // @[DivSqrtRecF64_mulAddZ31.scala 766:42]
  assign roundRawFNToRecFN_io_invalidExc = divSqrtRecF64ToRaw_io_invalidExc; // @[DivSqrtRecF64_mulAddZ31.scala 775:39]
  assign roundRawFNToRecFN_io_infiniteExc = divSqrtRecF64ToRaw_io_infiniteExc; // @[DivSqrtRecF64_mulAddZ31.scala 776:39]
  assign roundRawFNToRecFN_io_in_isNaN = divSqrtRecF64ToRaw_io_rawOut_isNaN; // @[DivSqrtRecF64_mulAddZ31.scala 777:39]
  assign roundRawFNToRecFN_io_in_isInf = divSqrtRecF64ToRaw_io_rawOut_isInf; // @[DivSqrtRecF64_mulAddZ31.scala 777:39]
  assign roundRawFNToRecFN_io_in_isZero = divSqrtRecF64ToRaw_io_rawOut_isZero; // @[DivSqrtRecF64_mulAddZ31.scala 777:39]
  assign roundRawFNToRecFN_io_in_sign = divSqrtRecF64ToRaw_io_rawOut_sign; // @[DivSqrtRecF64_mulAddZ31.scala 777:39]
  assign roundRawFNToRecFN_io_in_sExp = divSqrtRecF64ToRaw_io_rawOut_sExp; // @[DivSqrtRecF64_mulAddZ31.scala 777:39]
  assign roundRawFNToRecFN_io_in_sig = divSqrtRecF64ToRaw_io_rawOut_sig; // @[DivSqrtRecF64_mulAddZ31.scala 777:39]
  assign roundRawFNToRecFN_io_roundingMode = divSqrtRecF64ToRaw_io_roundingModeOut; // @[DivSqrtRecF64_mulAddZ31.scala 778:39]
  assign roundRawFNToRecFN_io_detectTininess = io_detectTininess; // @[DivSqrtRecF64_mulAddZ31.scala 779:41]
endmodule
