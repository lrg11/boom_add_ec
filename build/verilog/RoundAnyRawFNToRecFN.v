module RoundAnyRawFNToRecFN(
  input         io_invalidExc,
  input         io_infiniteExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [8:0]  io_in_sExp,
  input  [64:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  input         io_detectTininess,
  output [32:0] io_out,
  output [4:0]  io_exceptionFlags
);
  wire  roundingMode_near_even = io_roundingMode == 3'h0; // @[RoundAnyRawFNToRecFN.scala 88:53]
  wire  roundingMode_min = io_roundingMode == 3'h2; // @[RoundAnyRawFNToRecFN.scala 90:53]
  wire  roundingMode_max = io_roundingMode == 3'h3; // @[RoundAnyRawFNToRecFN.scala 91:53]
  wire  roundingMode_near_maxMag = io_roundingMode == 3'h4; // @[RoundAnyRawFNToRecFN.scala 92:53]
  wire  roundingMode_odd = io_roundingMode == 3'h6; // @[RoundAnyRawFNToRecFN.scala 93:53]
  wire  roundMagUp = roundingMode_min & io_in_sign | roundingMode_max & ~io_in_sign; // @[RoundAnyRawFNToRecFN.scala 96:42]
  wire [9:0] _sAdjustedExp_T = $signed(io_in_sExp) + 9'sh80; // @[RoundAnyRawFNToRecFN.scala 102:25]
  wire [9:0] sAdjustedExp = {1'b0,$signed(_sAdjustedExp_T[8:0])}; // @[RoundAnyRawFNToRecFN.scala 104:31]
  wire [25:0] adjustedSig_hi = io_in_sig[64:39]; // @[RoundAnyRawFNToRecFN.scala 114:26]
  wire  adjustedSig_lo = |io_in_sig[38:0]; // @[RoundAnyRawFNToRecFN.scala 115:60]
  wire [26:0] adjustedSig = {adjustedSig_hi,adjustedSig_lo}; // @[Cat.scala 30:58]
  wire [26:0] _roundPosBit_T = adjustedSig & 27'h2; // @[RoundAnyRawFNToRecFN.scala 162:40]
  wire  roundPosBit = |_roundPosBit_T; // @[RoundAnyRawFNToRecFN.scala 162:56]
  wire [26:0] _anyRoundExtra_T = adjustedSig & 27'h1; // @[RoundAnyRawFNToRecFN.scala 163:42]
  wire  anyRoundExtra = |_anyRoundExtra_T; // @[RoundAnyRawFNToRecFN.scala 163:62]
  wire  anyRound = roundPosBit | anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 164:36]
  wire  _roundIncr_T_1 = (roundingMode_near_even | roundingMode_near_maxMag) & roundPosBit; // @[RoundAnyRawFNToRecFN.scala 167:67]
  wire  _roundIncr_T_2 = roundMagUp & anyRound; // @[RoundAnyRawFNToRecFN.scala 169:29]
  wire  roundIncr = _roundIncr_T_1 | _roundIncr_T_2; // @[RoundAnyRawFNToRecFN.scala 168:31]
  wire [26:0] _roundedSig_T = adjustedSig | 27'h3; // @[RoundAnyRawFNToRecFN.scala 172:32]
  wire [25:0] _roundedSig_T_2 = _roundedSig_T[26:2] + 25'h1; // @[RoundAnyRawFNToRecFN.scala 172:49]
  wire  _roundedSig_T_4 = ~anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 174:30]
  wire [25:0] _roundedSig_T_7 = roundingMode_near_even & roundPosBit & _roundedSig_T_4 ? 26'h1 : 26'h0; // @[RoundAnyRawFNToRecFN.scala 173:25]
  wire [25:0] _roundedSig_T_8 = ~_roundedSig_T_7; // @[RoundAnyRawFNToRecFN.scala 173:21]
  wire [25:0] _roundedSig_T_9 = _roundedSig_T_2 & _roundedSig_T_8; // @[RoundAnyRawFNToRecFN.scala 172:61]
  wire [26:0] _roundedSig_T_11 = adjustedSig & 27'h7fffffc; // @[RoundAnyRawFNToRecFN.scala 178:30]
  wire [25:0] _roundedSig_T_15 = roundingMode_odd & anyRound ? 26'h1 : 26'h0; // @[RoundAnyRawFNToRecFN.scala 179:24]
  wire [25:0] _GEN_0 = {{1'd0}, _roundedSig_T_11[26:2]}; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [25:0] _roundedSig_T_16 = _GEN_0 | _roundedSig_T_15; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [25:0] roundedSig = roundIncr ? _roundedSig_T_9 : _roundedSig_T_16; // @[RoundAnyRawFNToRecFN.scala 171:16]
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[25:24])}; // @[RoundAnyRawFNToRecFN.scala 183:69]
  wire [9:0] _GEN_1 = {{7{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1}; // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [10:0] sRoundedExp = $signed(sAdjustedExp) + $signed(_GEN_1); // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [8:0] common_expOut = sRoundedExp[8:0]; // @[RoundAnyRawFNToRecFN.scala 185:37]
  wire [22:0] common_fractOut = roundedSig[22:0]; // @[RoundAnyRawFNToRecFN.scala 189:27]
  wire  isNaNOut = io_invalidExc | io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 233:34]
  wire  notNaN_isSpecialInfOut = io_infiniteExc | io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 234:49]
  wire  commonCase = ~isNaNOut & ~notNaN_isSpecialInfOut & ~io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 235:61]
  wire  inexact = commonCase & anyRound; // @[RoundAnyRawFNToRecFN.scala 238:43]
  wire  signOut = isNaNOut ? 1'h0 : io_in_sign; // @[RoundAnyRawFNToRecFN.scala 248:22]
  wire [8:0] _expOut_T_1 = io_in_isZero ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 251:18]
  wire [8:0] _expOut_T_2 = ~_expOut_T_1; // @[RoundAnyRawFNToRecFN.scala 251:14]
  wire [8:0] _expOut_T_3 = common_expOut & _expOut_T_2; // @[RoundAnyRawFNToRecFN.scala 250:24]
  wire [8:0] _expOut_T_11 = notNaN_isSpecialInfOut ? 9'h40 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 263:18]
  wire [8:0] _expOut_T_12 = ~_expOut_T_11; // @[RoundAnyRawFNToRecFN.scala 263:14]
  wire [8:0] _expOut_T_13 = _expOut_T_3 & _expOut_T_12; // @[RoundAnyRawFNToRecFN.scala 262:17]
  wire [8:0] _expOut_T_18 = notNaN_isSpecialInfOut ? 9'h180 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 275:16]
  wire [8:0] _expOut_T_19 = _expOut_T_13 | _expOut_T_18; // @[RoundAnyRawFNToRecFN.scala 274:15]
  wire [8:0] _expOut_T_20 = isNaNOut ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 276:16]
  wire [8:0] expOut = _expOut_T_19 | _expOut_T_20; // @[RoundAnyRawFNToRecFN.scala 275:77]
  wire [22:0] _fractOut_T_2 = isNaNOut ? 23'h400000 : 23'h0; // @[RoundAnyRawFNToRecFN.scala 279:16]
  wire [22:0] fractOut = isNaNOut | io_in_isZero ? _fractOut_T_2 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 278:12]
  wire [9:0] io_out_hi = {signOut,expOut}; // @[Cat.scala 30:58]
  wire [1:0] io_exceptionFlags_lo = {1'h0,inexact}; // @[Cat.scala 30:58]
  wire [2:0] io_exceptionFlags_hi = {io_invalidExc,io_infiniteExc,1'h0}; // @[Cat.scala 30:58]
  assign io_out = {io_out_hi,fractOut}; // @[Cat.scala 30:58]
  assign io_exceptionFlags = {io_exceptionFlags_hi,io_exceptionFlags_lo}; // @[Cat.scala 30:58]
endmodule
