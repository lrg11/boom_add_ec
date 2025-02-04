module CompareRecFN(
  input  [64:0] io_a,
  input  [64:0] io_b,
  input         io_signaling,
  output        io_lt,
  output        io_eq,
  output        io_gt,
  output [4:0]  io_exceptionFlags,
  output        io_ordered
);
  wire [11:0] rawA_exp = io_a[63:52]; // @[rawFloatFromRecFN.scala 50:21]
  wire  rawA_isZero = rawA_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  rawA_isSpecial = rawA_exp[11:10] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  rawA__isNaN = rawA_isSpecial & rawA_exp[9]; // @[rawFloatFromRecFN.scala 55:33]
  wire  rawA__isInf = rawA_isSpecial & ~rawA_exp[9]; // @[rawFloatFromRecFN.scala 56:33]
  wire  rawA__sign = io_a[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] rawA__sExp = {1'b0,$signed(rawA_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  rawA_out_sig_hi_lo = ~rawA_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] rawA_out_sig_lo = io_a[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [53:0] rawA__sig = {1'h0,rawA_out_sig_hi_lo,rawA_out_sig_lo}; // @[Cat.scala 30:58]
  wire [11:0] rawB_exp = io_b[63:52]; // @[rawFloatFromRecFN.scala 50:21]
  wire  rawB_isZero = rawB_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  rawB_isSpecial = rawB_exp[11:10] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  rawB__isNaN = rawB_isSpecial & rawB_exp[9]; // @[rawFloatFromRecFN.scala 55:33]
  wire  rawB__isInf = rawB_isSpecial & ~rawB_exp[9]; // @[rawFloatFromRecFN.scala 56:33]
  wire  rawB__sign = io_b[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] rawB__sExp = {1'b0,$signed(rawB_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  rawB_out_sig_hi_lo = ~rawB_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] rawB_out_sig_lo = io_b[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [53:0] rawB__sig = {1'h0,rawB_out_sig_hi_lo,rawB_out_sig_lo}; // @[Cat.scala 30:58]
  wire  ordered = ~rawA__isNaN & ~rawB__isNaN; // @[CompareRecFN.scala 59:32]
  wire  bothInfs = rawA__isInf & rawB__isInf; // @[CompareRecFN.scala 60:33]
  wire  bothZeros = rawA_isZero & rawB_isZero; // @[CompareRecFN.scala 61:33]
  wire  eqExps = $signed(rawA__sExp) == $signed(rawB__sExp); // @[CompareRecFN.scala 62:29]
  wire  common_ltMags = $signed(rawA__sExp) < $signed(rawB__sExp) | eqExps & rawA__sig < rawB__sig; // @[CompareRecFN.scala 64:33]
  wire  common_eqMags = eqExps & rawA__sig == rawB__sig; // @[CompareRecFN.scala 65:32]
  wire  _ordered_lt_T_1 = ~rawB__sign; // @[CompareRecFN.scala 69:28]
  wire  _ordered_lt_T_9 = _ordered_lt_T_1 & common_ltMags; // @[CompareRecFN.scala 72:41]
  wire  _ordered_lt_T_10 = rawA__sign & ~common_ltMags & ~common_eqMags | _ordered_lt_T_9; // @[CompareRecFN.scala 71:74]
  wire  _ordered_lt_T_11 = ~bothInfs & _ordered_lt_T_10; // @[CompareRecFN.scala 70:30]
  wire  _ordered_lt_T_12 = rawA__sign & ~rawB__sign | _ordered_lt_T_11; // @[CompareRecFN.scala 69:41]
  wire  ordered_lt = ~bothZeros & _ordered_lt_T_12; // @[CompareRecFN.scala 68:21]
  wire  ordered_eq = bothZeros | rawA__sign == rawB__sign & (bothInfs | common_eqMags); // @[CompareRecFN.scala 74:19]
  wire  _invalid_T_2 = rawA__isNaN & ~rawA__sig[51]; // @[common.scala 81:46]
  wire  _invalid_T_5 = rawB__isNaN & ~rawB__sig[51]; // @[common.scala 81:46]
  wire  _invalid_T_8 = io_signaling & ~ordered; // @[CompareRecFN.scala 78:27]
  wire  invalid = _invalid_T_2 | _invalid_T_5 | _invalid_T_8; // @[CompareRecFN.scala 77:58]
  assign io_lt = ordered & ordered_lt; // @[CompareRecFN.scala 80:22]
  assign io_eq = ordered & ordered_eq; // @[CompareRecFN.scala 81:22]
  assign io_gt = ordered & ~ordered_lt & ~ordered_eq; // @[CompareRecFN.scala 82:38]
  assign io_exceptionFlags = {invalid,4'h0}; // @[Cat.scala 30:58]
  assign io_ordered = ~rawA__isNaN & ~rawB__isNaN; // @[CompareRecFN.scala 59:32]
endmodule
