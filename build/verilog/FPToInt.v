module FPToInt(
  input         clock,
  input         reset,
  input         io_in_valid,
  input         io_in_bits_ldst,
  input         io_in_bits_wen,
  input         io_in_bits_ren1,
  input         io_in_bits_ren2,
  input         io_in_bits_ren3,
  input         io_in_bits_swap12,
  input         io_in_bits_swap23,
  input  [1:0]  io_in_bits_typeTagIn,
  input  [1:0]  io_in_bits_typeTagOut,
  input         io_in_bits_fromint,
  input         io_in_bits_toint,
  input         io_in_bits_fastpipe,
  input         io_in_bits_fma,
  input         io_in_bits_div,
  input         io_in_bits_sqrt,
  input         io_in_bits_wflags,
  input  [2:0]  io_in_bits_rm,
  input  [1:0]  io_in_bits_fmaCmd,
  input  [1:0]  io_in_bits_typ,
  input  [1:0]  io_in_bits_fmt,
  input  [64:0] io_in_bits_in1,
  input  [64:0] io_in_bits_in2,
  input  [64:0] io_in_bits_in3,
  output        io_out_valid,
  output        io_out_bits_in_ldst,
  output        io_out_bits_in_wen,
  output        io_out_bits_in_ren1,
  output        io_out_bits_in_ren2,
  output        io_out_bits_in_ren3,
  output        io_out_bits_in_swap12,
  output        io_out_bits_in_swap23,
  output [1:0]  io_out_bits_in_typeTagIn,
  output [1:0]  io_out_bits_in_typeTagOut,
  output        io_out_bits_in_fromint,
  output        io_out_bits_in_toint,
  output        io_out_bits_in_fastpipe,
  output        io_out_bits_in_fma,
  output        io_out_bits_in_div,
  output        io_out_bits_in_sqrt,
  output        io_out_bits_in_wflags,
  output [2:0]  io_out_bits_in_rm,
  output [1:0]  io_out_bits_in_fmaCmd,
  output [1:0]  io_out_bits_in_typ,
  output [1:0]  io_out_bits_in_fmt,
  output [64:0] io_out_bits_in_in1,
  output [64:0] io_out_bits_in_in2,
  output [64:0] io_out_bits_in_in3,
  output        io_out_bits_lt,
  output [63:0] io_out_bits_store,
  output [63:0] io_out_bits_toint,
  output [4:0]  io_out_bits_exc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [95:0] _RAND_20;
  reg [95:0] _RAND_21;
  reg [95:0] _RAND_22;
  reg [31:0] _RAND_23;
`endif // RANDOMIZE_REG_INIT
  wire [64:0] dcmp_io_a; // @[FPU.scala 465:20]
  wire [64:0] dcmp_io_b; // @[FPU.scala 465:20]
  wire  dcmp_io_signaling; // @[FPU.scala 465:20]
  wire  dcmp_io_lt; // @[FPU.scala 465:20]
  wire  dcmp_io_eq; // @[FPU.scala 465:20]
  wire  dcmp_io_gt; // @[FPU.scala 465:20]
  wire [4:0] dcmp_io_exceptionFlags; // @[FPU.scala 465:20]
  wire [64:0] conv_io_in; // @[FPU.scala 493:24]
  wire [2:0] conv_io_roundingMode; // @[FPU.scala 493:24]
  wire  conv_io_signedOut; // @[FPU.scala 493:24]
  wire [63:0] conv_io_out; // @[FPU.scala 493:24]
  wire [2:0] conv_io_intExceptionFlags; // @[FPU.scala 493:24]
  wire [64:0] narrow_io_in; // @[FPU.scala 503:30]
  wire [2:0] narrow_io_roundingMode; // @[FPU.scala 503:30]
  wire  narrow_io_signedOut; // @[FPU.scala 503:30]
  wire [31:0] narrow_io_out; // @[FPU.scala 503:30]
  wire [2:0] narrow_io_intExceptionFlags; // @[FPU.scala 503:30]
  reg  in_ldst; // @[Reg.scala 15:16]
  reg  in_wen; // @[Reg.scala 15:16]
  reg  in_ren1; // @[Reg.scala 15:16]
  reg  in_ren2; // @[Reg.scala 15:16]
  reg  in_ren3; // @[Reg.scala 15:16]
  reg  in_swap12; // @[Reg.scala 15:16]
  reg  in_swap23; // @[Reg.scala 15:16]
  reg [1:0] in_typeTagIn; // @[Reg.scala 15:16]
  reg [1:0] in_typeTagOut; // @[Reg.scala 15:16]
  reg  in_fromint; // @[Reg.scala 15:16]
  reg  in_toint; // @[Reg.scala 15:16]
  reg  in_fastpipe; // @[Reg.scala 15:16]
  reg  in_fma; // @[Reg.scala 15:16]
  reg  in_div; // @[Reg.scala 15:16]
  reg  in_sqrt; // @[Reg.scala 15:16]
  reg  in_wflags; // @[Reg.scala 15:16]
  reg [2:0] in_rm; // @[Reg.scala 15:16]
  reg [1:0] in_fmaCmd; // @[Reg.scala 15:16]
  reg [1:0] in_typ; // @[Reg.scala 15:16]
  reg [1:0] in_fmt; // @[Reg.scala 15:16]
  reg [64:0] in_in1; // @[Reg.scala 15:16]
  reg [64:0] in_in2; // @[Reg.scala 15:16]
  reg [64:0] in_in3; // @[Reg.scala 15:16]
  reg  valid; // @[FPU.scala 463:18]
  wire [11:0] store_unrecoded_rawIn_exp = in_in1[63:52]; // @[rawFloatFromRecFN.scala 50:21]
  wire  store_unrecoded_rawIn_isZero = store_unrecoded_rawIn_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  store_unrecoded_rawIn_isSpecial = store_unrecoded_rawIn_exp[11:10] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  store_unrecoded_rawIn__isNaN = store_unrecoded_rawIn_isSpecial & store_unrecoded_rawIn_exp[9]; // @[rawFloatFromRecFN.scala 55:33]
  wire  store_unrecoded_rawIn__isInf = store_unrecoded_rawIn_isSpecial & ~store_unrecoded_rawIn_exp[9]; // @[rawFloatFromRecFN.scala 56:33]
  wire  store_unrecoded_rawIn__sign = in_in1[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] store_unrecoded_rawIn__sExp = {1'b0,$signed(store_unrecoded_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  store_unrecoded_rawIn_out_sig_hi_lo = ~store_unrecoded_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] store_unrecoded_rawIn_out_sig_lo = in_in1[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [53:0] store_unrecoded_rawIn__sig = {1'h0,store_unrecoded_rawIn_out_sig_hi_lo,store_unrecoded_rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire  store_unrecoded_isSubnormal = $signed(store_unrecoded_rawIn__sExp) < 13'sh402; // @[fNFromRecFN.scala 50:39]
  wire [5:0] store_unrecoded_denormShiftDist = 6'h1 - store_unrecoded_rawIn__sExp[5:0]; // @[fNFromRecFN.scala 51:39]
  wire [52:0] _store_unrecoded_denormFract_T_1 = store_unrecoded_rawIn__sig[53:1] >> store_unrecoded_denormShiftDist; // @[fNFromRecFN.scala 52:42]
  wire [51:0] store_unrecoded_denormFract = _store_unrecoded_denormFract_T_1[51:0]; // @[fNFromRecFN.scala 52:60]
  wire [10:0] _store_unrecoded_expOut_T_2 = store_unrecoded_rawIn__sExp[10:0] - 11'h401; // @[fNFromRecFN.scala 57:45]
  wire [10:0] _store_unrecoded_expOut_T_3 = store_unrecoded_isSubnormal ? 11'h0 : _store_unrecoded_expOut_T_2; // @[fNFromRecFN.scala 55:16]
  wire  _store_unrecoded_expOut_T_4 = store_unrecoded_rawIn__isNaN | store_unrecoded_rawIn__isInf; // @[fNFromRecFN.scala 59:44]
  wire [10:0] _store_unrecoded_expOut_T_6 = _store_unrecoded_expOut_T_4 ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [10:0] store_unrecoded_hi_lo = _store_unrecoded_expOut_T_3 | _store_unrecoded_expOut_T_6; // @[fNFromRecFN.scala 59:15]
  wire [51:0] _store_unrecoded_fractOut_T_1 = store_unrecoded_rawIn__isInf ? 52'h0 : store_unrecoded_rawIn__sig[51:0]; // @[fNFromRecFN.scala 63:20]
  wire [51:0] store_unrecoded_lo = store_unrecoded_isSubnormal ? store_unrecoded_denormFract :
    _store_unrecoded_fractOut_T_1; // @[fNFromRecFN.scala 61:16]
  wire [63:0] store_unrecoded = {store_unrecoded_rawIn__sign,store_unrecoded_hi_lo,store_unrecoded_lo}; // @[Cat.scala 30:58]
  wire  store_prevRecoded_hi_hi = in_in1[31]; // @[FPU.scala 437:10]
  wire  store_prevRecoded_hi_lo = in_in1[52]; // @[FPU.scala 438:10]
  wire [30:0] store_prevRecoded_lo = in_in1[30:0]; // @[FPU.scala 439:10]
  wire [32:0] store_prevRecoded = {store_prevRecoded_hi_hi,store_prevRecoded_hi_lo,store_prevRecoded_lo}; // @[Cat.scala 30:58]
  wire [8:0] store_prevUnrecoded_rawIn_exp = store_prevRecoded[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  store_prevUnrecoded_rawIn_isZero = store_prevUnrecoded_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  store_prevUnrecoded_rawIn_isSpecial = store_prevUnrecoded_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  store_prevUnrecoded_rawIn__isNaN = store_prevUnrecoded_rawIn_isSpecial & store_prevUnrecoded_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  wire  store_prevUnrecoded_rawIn__isInf = store_prevUnrecoded_rawIn_isSpecial & ~store_prevUnrecoded_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  store_prevUnrecoded_rawIn__sign = store_prevRecoded[32]; // @[rawFloatFromRecFN.scala 58:25]
  wire [9:0] store_prevUnrecoded_rawIn__sExp = {1'b0,$signed(store_prevUnrecoded_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  store_prevUnrecoded_rawIn_out_sig_hi_lo = ~store_prevUnrecoded_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [22:0] store_prevUnrecoded_rawIn_out_sig_lo = store_prevRecoded[22:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [24:0] store_prevUnrecoded_rawIn__sig = {1'h0,store_prevUnrecoded_rawIn_out_sig_hi_lo,
    store_prevUnrecoded_rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire  store_prevUnrecoded_isSubnormal = $signed(store_prevUnrecoded_rawIn__sExp) < 10'sh82; // @[fNFromRecFN.scala 50:39]
  wire [4:0] store_prevUnrecoded_denormShiftDist = 5'h1 - store_prevUnrecoded_rawIn__sExp[4:0]; // @[fNFromRecFN.scala 51:39]
  wire [23:0] _store_prevUnrecoded_denormFract_T_1 = store_prevUnrecoded_rawIn__sig[24:1] >>
    store_prevUnrecoded_denormShiftDist; // @[fNFromRecFN.scala 52:42]
  wire [22:0] store_prevUnrecoded_denormFract = _store_prevUnrecoded_denormFract_T_1[22:0]; // @[fNFromRecFN.scala 52:60]
  wire [7:0] _store_prevUnrecoded_expOut_T_2 = store_prevUnrecoded_rawIn__sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 57:45]
  wire [7:0] _store_prevUnrecoded_expOut_T_3 = store_prevUnrecoded_isSubnormal ? 8'h0 : _store_prevUnrecoded_expOut_T_2; // @[fNFromRecFN.scala 55:16]
  wire  _store_prevUnrecoded_expOut_T_4 = store_prevUnrecoded_rawIn__isNaN | store_prevUnrecoded_rawIn__isInf; // @[fNFromRecFN.scala 59:44]
  wire [7:0] _store_prevUnrecoded_expOut_T_6 = _store_prevUnrecoded_expOut_T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] store_prevUnrecoded_hi_lo = _store_prevUnrecoded_expOut_T_3 | _store_prevUnrecoded_expOut_T_6; // @[fNFromRecFN.scala 59:15]
  wire [22:0] _store_prevUnrecoded_fractOut_T_1 = store_prevUnrecoded_rawIn__isInf ? 23'h0 :
    store_prevUnrecoded_rawIn__sig[22:0]; // @[fNFromRecFN.scala 63:20]
  wire [22:0] store_prevUnrecoded_lo = store_prevUnrecoded_isSubnormal ? store_prevUnrecoded_denormFract :
    _store_prevUnrecoded_fractOut_T_1; // @[fNFromRecFN.scala 61:16]
  wire [31:0] store_prevUnrecoded = {store_prevUnrecoded_rawIn__sign,store_prevUnrecoded_hi_lo,store_prevUnrecoded_lo}; // @[Cat.scala 30:58]
  wire [31:0] store_hi = store_unrecoded[63:32]; // @[FPU.scala 441:21]
  wire  _store_T_1 = &in_in1[63:61]; // @[FPU.scala 243:56]
  wire [31:0] store_lo = _store_T_1 ? store_prevUnrecoded : store_unrecoded[31:0]; // @[FPU.scala 441:44]
  wire [63:0] _store_T_3 = {store_hi,store_lo}; // @[Cat.scala 30:58]
  wire [31:0] store_hi_1 = _store_T_3[31:0]; // @[FPU.scala 472:104]
  wire [63:0] _store_T_4 = {store_hi_1,store_hi_1}; // @[Cat.scala 30:58]
  wire  store_truncIdx = in_typeTagOut[0]; // @[package.scala 31:49]
  wire [63:0] store = store_truncIdx ? _store_T_3 : _store_T_4; // @[package.scala 32:76]
  wire  intType_x6 = in_fmt[0]; // @[FPU.scala 474:35]
  wire  cvtType = in_typ[1]; // @[package.scala 154:13]
  wire  io_out_bits_exc_hi_hi_1 = conv_io_intExceptionFlags[2] | narrow_io_intExceptionFlags[1]; // @[FPU.scala 510:54]
  wire [31:0] toint_hi = conv_io_out[63:32]; // @[FPU.scala 511:53]
  wire  excSign = store_unrecoded_rawIn__sign & ~_store_T_1; // @[FPU.scala 508:59]
  wire  excOut_hi = conv_io_signedOut == excSign; // @[FPU.scala 509:46]
  wire  _excOut_T = ~excSign; // @[FPU.scala 509:69]
  wire [30:0] excOut_lo = _excOut_T ? 31'h7fffffff : 31'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _toint_T_10 = {toint_hi,excOut_hi,excOut_lo}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_25 = io_out_bits_exc_hi_hi_1 ? _toint_T_10 : conv_io_out; // @[FPU.scala 511:26 FPU.scala 511:34 FPU.scala 497:13]
  wire [63:0] _GEN_26 = ~cvtType ? _GEN_25 : conv_io_out; // @[FPU.scala 502:30 FPU.scala 497:13]
  wire [2:0] _toint_T_3 = ~in_rm; // @[FPU.scala 486:15]
  wire [1:0] _toint_T_4 = {dcmp_io_lt,dcmp_io_eq}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_34 = {{1'd0}, _toint_T_4}; // @[FPU.scala 486:22]
  wire [2:0] _toint_T_5 = _toint_T_3 & _GEN_34; // @[FPU.scala 486:22]
  wire [63:0] _toint_T_8 = {store[63:32], 32'h0}; // @[FPU.scala 486:77]
  wire [63:0] _GEN_35 = {{63'd0}, |_toint_T_5}; // @[FPU.scala 486:57]
  wire [63:0] _toint_T_9 = _GEN_35 | _toint_T_8; // @[FPU.scala 486:57]
  wire [63:0] _GEN_29 = ~in_ren2 ? _GEN_26 : _toint_T_9; // @[FPU.scala 490:21 FPU.scala 486:11]
  wire  classify_out_hi_hi_hi_hi_1 = _store_T_1 & in_in1[51]; // @[FPU.scala 259:24]
  wire  classify_out_hi_hi_hi_lo_1 = _store_T_1 & ~in_in1[51]; // @[FPU.scala 258:24]
  wire [1:0] classify_out_codeHi_1 = in_in1[63:62]; // @[FPU.scala 249:22]
  wire  classify_out_isSpecial_1 = classify_out_codeHi_1 == 2'h3; // @[FPU.scala 250:28]
  wire  classify_out_isInf_1 = classify_out_isSpecial_1 & ~in_in1[61]; // @[FPU.scala 256:27]
  wire  _classify_out_T_6 = ~store_unrecoded_rawIn__sign; // @[FPU.scala 261:34]
  wire  classify_out_hi_hi_lo_1 = classify_out_isInf_1 & ~store_unrecoded_rawIn__sign; // @[FPU.scala 261:31]
  wire  _classify_out_isNormal_T_4 = classify_out_codeHi_1 == 2'h1; // @[FPU.scala 254:27]
  wire  classify_out_isHighSubnormalIn_1 = in_in1[61:52] < 10'h2; // @[FPU.scala 252:55]
  wire  classify_out_isNormal_1 = classify_out_codeHi_1 == 2'h1 & ~classify_out_isHighSubnormalIn_1 |
    classify_out_codeHi_1 == 2'h2; // @[FPU.scala 254:61]
  wire  classify_out_hi_lo_hi_1 = classify_out_isNormal_1 & ~store_unrecoded_rawIn__sign; // @[FPU.scala 261:50]
  wire  classify_out_isSubnormal_1 = in_in1[63:61] == 3'h1 | _classify_out_isNormal_T_4 &
    classify_out_isHighSubnormalIn_1; // @[FPU.scala 253:40]
  wire  classify_out_hi_lo_lo_1 = classify_out_isSubnormal_1 & _classify_out_T_6; // @[FPU.scala 262:21]
  wire  classify_out_isZero_1 = in_in1[63:61] == 3'h0; // @[FPU.scala 255:23]
  wire  classify_out_lo_hi_hi_hi_1 = classify_out_isZero_1 & _classify_out_T_6; // @[FPU.scala 262:38]
  wire  classify_out_lo_hi_hi_lo_1 = classify_out_isZero_1 & store_unrecoded_rawIn__sign; // @[FPU.scala 262:55]
  wire  classify_out_lo_hi_lo_1 = classify_out_isSubnormal_1 & store_unrecoded_rawIn__sign; // @[FPU.scala 263:21]
  wire  classify_out_lo_lo_hi_1 = classify_out_isNormal_1 & store_unrecoded_rawIn__sign; // @[FPU.scala 263:39]
  wire  classify_out_lo_lo_lo_1 = classify_out_isInf_1 & store_unrecoded_rawIn__sign; // @[FPU.scala 263:54]
  wire [9:0] _classify_out_T_10 = {classify_out_hi_hi_hi_hi_1,classify_out_hi_hi_hi_lo_1,classify_out_hi_hi_lo_1,
    classify_out_hi_lo_hi_1,classify_out_hi_lo_lo_1,classify_out_lo_hi_hi_hi_1,classify_out_lo_hi_hi_lo_1,
    classify_out_lo_hi_lo_1,classify_out_lo_lo_hi_1,classify_out_lo_lo_lo_1}; // @[Cat.scala 30:58]
  wire [11:0] _classify_out_expOut_commonCase_T_1 = store_unrecoded_rawIn_exp + 12'h100; // @[FPU.scala 274:31]
  wire [11:0] classify_out_expOut_commonCase = _classify_out_expOut_commonCase_T_1 - 12'h800; // @[FPU.scala 274:48]
  wire [5:0] classify_out_expOut_lo = classify_out_expOut_commonCase[5:0]; // @[FPU.scala 275:65]
  wire [8:0] _classify_out_expOut_T_3 = {store_unrecoded_rawIn_exp[11:9],classify_out_expOut_lo}; // @[Cat.scala 30:58]
  wire [8:0] classify_out_hi_lo = store_unrecoded_rawIn_isZero | store_unrecoded_rawIn_exp[11:9] >= 3'h6 ?
    _classify_out_expOut_T_3 : classify_out_expOut_commonCase[8:0]; // @[FPU.scala 275:10]
  wire [75:0] _classify_out_fractOut_T = {store_unrecoded_rawIn_out_sig_lo, 24'h0}; // @[FPU.scala 271:28]
  wire [22:0] classify_out_lo = _classify_out_fractOut_T[75:53]; // @[FPU.scala 271:38]
  wire [32:0] _classify_out_T = {store_unrecoded_rawIn__sign,classify_out_hi_lo,classify_out_lo}; // @[Cat.scala 30:58]
  wire [2:0] classify_out_code = _classify_out_T[31:29]; // @[FPU.scala 248:17]
  wire  classify_out_isNaN = &classify_out_code; // @[FPU.scala 257:22]
  wire  classify_out_hi_hi_hi_hi = classify_out_isNaN & _classify_out_T[22]; // @[FPU.scala 259:24]
  wire  classify_out_hi_hi_hi_lo = classify_out_isNaN & ~_classify_out_T[22]; // @[FPU.scala 258:24]
  wire [1:0] classify_out_codeHi = classify_out_code[2:1]; // @[FPU.scala 249:22]
  wire  classify_out_isSpecial = classify_out_codeHi == 2'h3; // @[FPU.scala 250:28]
  wire  classify_out_isInf = classify_out_isSpecial & ~classify_out_code[0]; // @[FPU.scala 256:27]
  wire  classify_out_sign = _classify_out_T[32]; // @[FPU.scala 247:17]
  wire  _classify_out_T_1 = ~classify_out_sign; // @[FPU.scala 261:34]
  wire  classify_out_hi_hi_lo = classify_out_isInf & ~classify_out_sign; // @[FPU.scala 261:31]
  wire  _classify_out_isNormal_T = classify_out_codeHi == 2'h1; // @[FPU.scala 254:27]
  wire  classify_out_isHighSubnormalIn = _classify_out_T[29:23] < 7'h2; // @[FPU.scala 252:55]
  wire  classify_out_isNormal = classify_out_codeHi == 2'h1 & ~classify_out_isHighSubnormalIn | classify_out_codeHi == 2'h2
    ; // @[FPU.scala 254:61]
  wire  classify_out_hi_lo_hi = classify_out_isNormal & ~classify_out_sign; // @[FPU.scala 261:50]
  wire  classify_out_isSubnormal = classify_out_code == 3'h1 | _classify_out_isNormal_T & classify_out_isHighSubnormalIn
    ; // @[FPU.scala 253:40]
  wire  classify_out_hi_lo_lo = classify_out_isSubnormal & _classify_out_T_1; // @[FPU.scala 262:21]
  wire  classify_out_isZero = classify_out_code == 3'h0; // @[FPU.scala 255:23]
  wire  classify_out_lo_hi_hi_hi = classify_out_isZero & _classify_out_T_1; // @[FPU.scala 262:38]
  wire  classify_out_lo_hi_hi_lo = classify_out_isZero & classify_out_sign; // @[FPU.scala 262:55]
  wire  classify_out_lo_hi_lo = classify_out_isSubnormal & classify_out_sign; // @[FPU.scala 263:21]
  wire  classify_out_lo_lo_hi = classify_out_isNormal & classify_out_sign; // @[FPU.scala 263:39]
  wire  classify_out_lo_lo_lo = classify_out_isInf & classify_out_sign; // @[FPU.scala 263:54]
  wire [9:0] _classify_out_T_5 = {classify_out_hi_hi_hi_hi,classify_out_hi_hi_hi_lo,classify_out_hi_hi_lo,
    classify_out_hi_lo_hi,classify_out_hi_lo_lo,classify_out_lo_hi_hi_hi,classify_out_lo_hi_hi_lo,classify_out_lo_hi_lo,
    classify_out_lo_lo_hi,classify_out_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [9:0] classify_out = store_truncIdx ? _classify_out_T_10 : _classify_out_T_5; // @[package.scala 32:76]
  wire [63:0] _GEN_36 = {{54'd0}, classify_out}; // @[FPU.scala 481:27]
  wire [63:0] _toint_T_2 = _GEN_36 | _toint_T_8; // @[FPU.scala 481:27]
  wire [63:0] _GEN_23 = in_rm[0] ? _toint_T_2 : store; // @[FPU.scala 479:19 FPU.scala 481:11]
  wire [63:0] toint = in_wflags ? _GEN_29 : _GEN_23; // @[FPU.scala 485:20]
  wire [31:0] io_out_bits_toint_lo = toint[31:0]; // @[FPU.scala 476:59]
  wire [31:0] io_out_bits_toint_hi = io_out_bits_toint_lo[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _io_out_bits_toint_T_2 = {io_out_bits_toint_hi,io_out_bits_toint_lo}; // @[Cat.scala 30:58]
  wire  _GEN_28 = ~in_ren2 & cvtType; // @[FPU.scala 490:21 FPU.scala 492:15 FPU.scala 488:13]
  wire  _GEN_24 = in_rm[0] ? 1'h0 : intType_x6; // @[FPU.scala 479:19 FPU.scala 482:13]
  wire  intType = in_wflags ? _GEN_28 : _GEN_24; // @[FPU.scala 485:20]
  wire  io_out_bits_exc_hi_hi = |conv_io_intExceptionFlags[2:1]; // @[FPU.scala 498:62]
  wire  io_out_bits_exc_lo = conv_io_intExceptionFlags[0]; // @[FPU.scala 498:104]
  wire [4:0] _io_out_bits_exc_T_1 = {io_out_bits_exc_hi_hi,3'h0,io_out_bits_exc_lo}; // @[Cat.scala 30:58]
  wire  io_out_bits_exc_lo_1 = ~io_out_bits_exc_hi_hi_1 & io_out_bits_exc_lo; // @[FPU.scala 512:64]
  wire [4:0] _io_out_bits_exc_T_4 = {io_out_bits_exc_hi_hi_1,3'h0,io_out_bits_exc_lo_1}; // @[Cat.scala 30:58]
  wire [4:0] _GEN_27 = ~cvtType ? _io_out_bits_exc_T_4 : _io_out_bits_exc_T_1; // @[FPU.scala 502:30 FPU.scala 512:27 FPU.scala 498:23]
  wire [4:0] _GEN_30 = ~in_ren2 ? _GEN_27 : dcmp_io_exceptionFlags; // @[FPU.scala 490:21 FPU.scala 487:21]
  CompareRecFN dcmp ( // @[FPU.scala 465:20]
    .io_a(dcmp_io_a),
    .io_b(dcmp_io_b),
    .io_signaling(dcmp_io_signaling),
    .io_lt(dcmp_io_lt),
    .io_eq(dcmp_io_eq),
    .io_gt(dcmp_io_gt),
    .io_exceptionFlags(dcmp_io_exceptionFlags)
  );
  RecFNToIN conv ( // @[FPU.scala 493:24]
    .io_in(conv_io_in),
    .io_roundingMode(conv_io_roundingMode),
    .io_signedOut(conv_io_signedOut),
    .io_out(conv_io_out),
    .io_intExceptionFlags(conv_io_intExceptionFlags)
  );
  RecFNToIN_1 narrow ( // @[FPU.scala 503:30]
    .io_in(narrow_io_in),
    .io_roundingMode(narrow_io_roundingMode),
    .io_signedOut(narrow_io_signedOut),
    .io_out(narrow_io_out),
    .io_intExceptionFlags(narrow_io_intExceptionFlags)
  );
  assign io_out_valid = valid; // @[FPU.scala 518:16]
  assign io_out_bits_in_ldst = in_ldst; // @[FPU.scala 520:18]
  assign io_out_bits_in_wen = in_wen; // @[FPU.scala 520:18]
  assign io_out_bits_in_ren1 = in_ren1; // @[FPU.scala 520:18]
  assign io_out_bits_in_ren2 = in_ren2; // @[FPU.scala 520:18]
  assign io_out_bits_in_ren3 = in_ren3; // @[FPU.scala 520:18]
  assign io_out_bits_in_swap12 = in_swap12; // @[FPU.scala 520:18]
  assign io_out_bits_in_swap23 = in_swap23; // @[FPU.scala 520:18]
  assign io_out_bits_in_typeTagIn = in_typeTagIn; // @[FPU.scala 520:18]
  assign io_out_bits_in_typeTagOut = in_typeTagOut; // @[FPU.scala 520:18]
  assign io_out_bits_in_fromint = in_fromint; // @[FPU.scala 520:18]
  assign io_out_bits_in_toint = in_toint; // @[FPU.scala 520:18]
  assign io_out_bits_in_fastpipe = in_fastpipe; // @[FPU.scala 520:18]
  assign io_out_bits_in_fma = in_fma; // @[FPU.scala 520:18]
  assign io_out_bits_in_div = in_div; // @[FPU.scala 520:18]
  assign io_out_bits_in_sqrt = in_sqrt; // @[FPU.scala 520:18]
  assign io_out_bits_in_wflags = in_wflags; // @[FPU.scala 520:18]
  assign io_out_bits_in_rm = in_rm; // @[FPU.scala 520:18]
  assign io_out_bits_in_fmaCmd = in_fmaCmd; // @[FPU.scala 520:18]
  assign io_out_bits_in_typ = in_typ; // @[FPU.scala 520:18]
  assign io_out_bits_in_fmt = in_fmt; // @[FPU.scala 520:18]
  assign io_out_bits_in_in1 = in_in1; // @[FPU.scala 520:18]
  assign io_out_bits_in_in2 = in_in2; // @[FPU.scala 520:18]
  assign io_out_bits_in_in3 = in_in3; // @[FPU.scala 520:18]
  assign io_out_bits_lt = dcmp_io_lt | $signed(dcmp_io_a) < 65'sh0 & $signed(dcmp_io_b) >= 65'sh0; // @[FPU.scala 519:32]
  assign io_out_bits_store = store_truncIdx ? _store_T_3 : _store_T_4; // @[package.scala 32:76]
  assign io_out_bits_toint = intType ? toint : _io_out_bits_toint_T_2; // @[package.scala 32:76]
  assign io_out_bits_exc = in_wflags ? _GEN_30 : 5'h0; // @[FPU.scala 485:20 FPU.scala 477:19]
  assign dcmp_io_a = in_in1; // @[FPU.scala 466:13]
  assign dcmp_io_b = in_in2; // @[FPU.scala 467:13]
  assign dcmp_io_signaling = ~in_rm[1]; // @[FPU.scala 468:24]
  assign conv_io_in = in_in1; // @[FPU.scala 494:18]
  assign conv_io_roundingMode = in_rm; // @[FPU.scala 495:28]
  assign conv_io_signedOut = ~in_typ[0]; // @[FPU.scala 496:28]
  assign narrow_io_in = in_in1; // @[FPU.scala 504:24]
  assign narrow_io_roundingMode = in_rm; // @[FPU.scala 505:34]
  assign narrow_io_signedOut = ~in_typ[0]; // @[FPU.scala 506:34]
  always @(posedge clock) begin
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_ldst <= io_in_bits_ldst; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_wen <= io_in_bits_wen; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_ren1 <= io_in_bits_ren1; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_ren2 <= io_in_bits_ren2; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_ren3 <= io_in_bits_ren3; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_swap12 <= io_in_bits_swap12; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_swap23 <= io_in_bits_swap23; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_typeTagIn <= io_in_bits_typeTagIn; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_typeTagOut <= io_in_bits_typeTagOut; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_fromint <= io_in_bits_fromint; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_toint <= io_in_bits_toint; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_fastpipe <= io_in_bits_fastpipe; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_fma <= io_in_bits_fma; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_div <= io_in_bits_div; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_sqrt <= io_in_bits_sqrt; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_wflags <= io_in_bits_wflags; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_rm <= io_in_bits_rm; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_fmaCmd <= io_in_bits_fmaCmd; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_typ <= io_in_bits_typ; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_fmt <= io_in_bits_fmt; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_in1 <= io_in_bits_in1; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_in2 <= io_in_bits_in2; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_in3 <= io_in_bits_in3; // @[Reg.scala 16:23]
    end
    valid <= io_in_valid; // @[FPU.scala 463:18]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  in_ldst = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  in_wen = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  in_ren1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  in_ren2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  in_ren3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  in_swap12 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  in_swap23 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  in_typeTagIn = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  in_typeTagOut = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  in_fromint = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  in_toint = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  in_fastpipe = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  in_fma = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  in_div = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  in_sqrt = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  in_wflags = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  in_rm = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  in_fmaCmd = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  in_typ = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  in_fmt = _RAND_19[1:0];
  _RAND_20 = {3{`RANDOM}};
  in_in1 = _RAND_20[64:0];
  _RAND_21 = {3{`RANDOM}};
  in_in2 = _RAND_21[64:0];
  _RAND_22 = {3{`RANDOM}};
  in_in3 = _RAND_22[64:0];
  _RAND_23 = {1{`RANDOM}};
  valid = _RAND_23[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
