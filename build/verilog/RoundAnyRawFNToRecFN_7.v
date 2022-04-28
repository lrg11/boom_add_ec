module RoundAnyRawFNToRecFN_7(
  input         io_invalidExc,
  input         io_infiniteExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [9:0]  io_in_sExp,
  input  [24:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  input         io_detectTininess,
  output [64:0] io_out,
  output [4:0]  io_exceptionFlags
);
  wire [11:0] _GEN_0 = {{2{io_in_sExp[9]}},io_in_sExp}; // @[RoundAnyRawFNToRecFN.scala 102:25]
  wire [12:0] _sAdjustedExp_T = $signed(_GEN_0) + 12'sh700; // @[RoundAnyRawFNToRecFN.scala 102:25]
  wire [12:0] sAdjustedExp = {1'b0,$signed(_sAdjustedExp_T[11:0])}; // @[RoundAnyRawFNToRecFN.scala 104:31]
  wire [55:0] adjustedSig = {io_in_sig, 31'h0}; // @[RoundAnyRawFNToRecFN.scala 112:22]
  wire [12:0] _common_expOut_T_1 = {{1'd0}, sAdjustedExp[11:0]}; // @[RoundAnyRawFNToRecFN.scala 134:55]
  wire [11:0] common_expOut = _common_expOut_T_1[11:0]; // @[RoundAnyRawFNToRecFN.scala 134:55]
  wire [51:0] common_fractOut = adjustedSig[53:2]; // @[RoundAnyRawFNToRecFN.scala 138:28]
  wire  isNaNOut = io_invalidExc | io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 233:34]
  wire  notNaN_isSpecialInfOut = io_infiniteExc | io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 234:49]
  wire  signOut = isNaNOut ? 1'h0 : io_in_sign; // @[RoundAnyRawFNToRecFN.scala 248:22]
  wire [11:0] _expOut_T_1 = io_in_isZero ? 12'he00 : 12'h0; // @[RoundAnyRawFNToRecFN.scala 251:18]
  wire [11:0] _expOut_T_2 = ~_expOut_T_1; // @[RoundAnyRawFNToRecFN.scala 251:14]
  wire [11:0] _expOut_T_3 = common_expOut & _expOut_T_2; // @[RoundAnyRawFNToRecFN.scala 250:24]
  wire [11:0] _expOut_T_11 = notNaN_isSpecialInfOut ? 12'h200 : 12'h0; // @[RoundAnyRawFNToRecFN.scala 263:18]
  wire [11:0] _expOut_T_12 = ~_expOut_T_11; // @[RoundAnyRawFNToRecFN.scala 263:14]
  wire [11:0] _expOut_T_13 = _expOut_T_3 & _expOut_T_12; // @[RoundAnyRawFNToRecFN.scala 262:17]
  wire [11:0] _expOut_T_18 = notNaN_isSpecialInfOut ? 12'hc00 : 12'h0; // @[RoundAnyRawFNToRecFN.scala 275:16]
  wire [11:0] _expOut_T_19 = _expOut_T_13 | _expOut_T_18; // @[RoundAnyRawFNToRecFN.scala 274:15]
  wire [11:0] _expOut_T_20 = isNaNOut ? 12'he00 : 12'h0; // @[RoundAnyRawFNToRecFN.scala 276:16]
  wire [11:0] expOut = _expOut_T_19 | _expOut_T_20; // @[RoundAnyRawFNToRecFN.scala 275:77]
  wire [51:0] _fractOut_T_2 = isNaNOut ? 52'h8000000000000 : 52'h0; // @[RoundAnyRawFNToRecFN.scala 279:16]
  wire [51:0] fractOut = isNaNOut | io_in_isZero ? _fractOut_T_2 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 278:12]
  wire [12:0] io_out_hi = {signOut,expOut}; // @[Cat.scala 30:58]
  wire [2:0] io_exceptionFlags_hi = {io_invalidExc,io_infiniteExc,1'h0}; // @[Cat.scala 30:58]
  assign io_out = {io_out_hi,fractOut}; // @[Cat.scala 30:58]
  assign io_exceptionFlags = {io_exceptionFlags_hi,2'h0}; // @[Cat.scala 30:58]
endmodule
