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
  input         io_in_bits_is_unicore,
  input  [6:0]  io_in_bits_exc_enabled,
  input         io_in_bits_c,
  input  [3:0]  io_in_bits_cond_unicore,
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
  output        io_out_bits_in_is_unicore,
  output [6:0]  io_out_bits_in_exc_enabled,
  output        io_out_bits_in_c,
  output [3:0]  io_out_bits_in_cond_unicore,
  output        io_out_bits_lt,
  output [63:0] io_out_bits_store,
  output [63:0] io_out_bits_toint,
  output [4:0]  io_out_bits_exc,
  output [63:0] io_out_bits_toint_cmp_unicore,
  output [6:0]  io_out_bits_u_exception,
  output [9:0]  io_out_bits_u_flag,
  output        io_out_bits_u_c
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
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
`endif // RANDOMIZE_REG_INIT
  wire [64:0] dcmp_io_a; // @[FPU.scala 482:20]
  wire [64:0] dcmp_io_b; // @[FPU.scala 482:20]
  wire  dcmp_io_signaling; // @[FPU.scala 482:20]
  wire  dcmp_io_lt; // @[FPU.scala 482:20]
  wire  dcmp_io_eq; // @[FPU.scala 482:20]
  wire  dcmp_io_gt; // @[FPU.scala 482:20]
  wire [4:0] dcmp_io_exceptionFlags; // @[FPU.scala 482:20]
  wire  dcmp_io_ordered; // @[FPU.scala 482:20]
  wire [64:0] conv_io_in; // @[FPU.scala 574:24]
  wire [2:0] conv_io_roundingMode; // @[FPU.scala 574:24]
  wire  conv_io_signedOut; // @[FPU.scala 574:24]
  wire [63:0] conv_io_out; // @[FPU.scala 574:24]
  wire [2:0] conv_io_intExceptionFlags; // @[FPU.scala 574:24]
  wire [64:0] narrow_io_in; // @[FPU.scala 584:30]
  wire [2:0] narrow_io_roundingMode; // @[FPU.scala 584:30]
  wire  narrow_io_signedOut; // @[FPU.scala 584:30]
  wire [31:0] narrow_io_out; // @[FPU.scala 584:30]
  wire [2:0] narrow_io_intExceptionFlags; // @[FPU.scala 584:30]
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
  reg  in_is_unicore; // @[Reg.scala 15:16]
  reg [6:0] in_exc_enabled; // @[Reg.scala 15:16]
  reg  in_c; // @[Reg.scala 15:16]
  reg [3:0] in_cond_unicore; // @[Reg.scala 15:16]
  reg  valid; // @[FPU.scala 480:18]
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
  wire  store_prevRecoded_hi_hi = in_in1[31]; // @[FPU.scala 449:10]
  wire  store_prevRecoded_hi_lo = in_in1[52]; // @[FPU.scala 450:10]
  wire [30:0] store_prevRecoded_lo = in_in1[30:0]; // @[FPU.scala 451:10]
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
  wire [31:0] store_hi = store_unrecoded[63:32]; // @[FPU.scala 453:21]
  wire  _store_T_1 = &in_in1[63:61]; // @[FPU.scala 255:56]
  wire [31:0] store_lo = _store_T_1 ? store_prevUnrecoded : store_unrecoded[31:0]; // @[FPU.scala 453:44]
  wire [63:0] _store_T_3 = {store_hi,store_lo}; // @[Cat.scala 30:58]
  wire [31:0] store_hi_1 = _store_T_3[31:0]; // @[FPU.scala 489:104]
  wire [63:0] _store_T_4 = {store_hi_1,store_hi_1}; // @[Cat.scala 30:58]
  wire  store_truncIdx = in_typeTagOut[0]; // @[package.scala 31:49]
  wire [63:0] store = store_truncIdx ? _store_T_3 : _store_T_4; // @[package.scala 32:76]
  wire  intType_x6 = in_fmt[0]; // @[FPU.scala 491:35]
  wire  cvtType = in_typ[1]; // @[package.scala 154:13]
  wire  io_out_bits_exc_hi_hi_1 = conv_io_intExceptionFlags[2] | narrow_io_intExceptionFlags[1]; // @[FPU.scala 591:54]
  wire [31:0] toint_hi = conv_io_out[63:32]; // @[FPU.scala 592:53]
  wire  excSign = store_unrecoded_rawIn__sign & ~_store_T_1; // @[FPU.scala 589:59]
  wire  excOut_hi = conv_io_signedOut == excSign; // @[FPU.scala 590:46]
  wire  _excOut_T = ~excSign; // @[FPU.scala 590:69]
  wire [30:0] excOut_lo = _excOut_T ? 31'h7fffffff : 31'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _toint_T_10 = {toint_hi,excOut_hi,excOut_lo}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_32 = io_out_bits_exc_hi_hi_1 ? _toint_T_10 : conv_io_out; // @[FPU.scala 592:26 FPU.scala 592:34 FPU.scala 578:13]
  wire [63:0] _GEN_36 = ~cvtType ? _GEN_32 : conv_io_out; // @[FPU.scala 583:30 FPU.scala 578:13]
  wire [2:0] _toint_T_3 = ~in_rm; // @[FPU.scala 546:15]
  wire [1:0] _toint_T_4 = {dcmp_io_lt,dcmp_io_eq}; // @[Cat.scala 30:58]
  wire [2:0] _GEN_54 = {{1'd0}, _toint_T_4}; // @[FPU.scala 546:22]
  wire [2:0] _toint_T_5 = _toint_T_3 & _GEN_54; // @[FPU.scala 546:22]
  wire [63:0] _toint_T_8 = {store[63:32], 32'h0}; // @[FPU.scala 546:77]
  wire [63:0] _GEN_55 = {{63'd0}, |_toint_T_5}; // @[FPU.scala 546:57]
  wire [63:0] _toint_T_9 = _GEN_55 | _toint_T_8; // @[FPU.scala 546:57]
  wire [63:0] _GEN_42 = ~in_ren2 ? _GEN_36 : _toint_T_9; // @[FPU.scala 571:21 FPU.scala 546:11]
  wire  classify_out_hi_hi_hi_hi_1 = _store_T_1 & in_in1[51]; // @[FPU.scala 271:24]
  wire  classify_out_hi_hi_hi_lo_1 = _store_T_1 & ~in_in1[51]; // @[FPU.scala 270:24]
  wire [1:0] classify_out_codeHi_1 = in_in1[63:62]; // @[FPU.scala 261:22]
  wire  classify_out_isSpecial_1 = classify_out_codeHi_1 == 2'h3; // @[FPU.scala 262:28]
  wire  classify_out_isInf_1 = classify_out_isSpecial_1 & ~in_in1[61]; // @[FPU.scala 268:27]
  wire  _classify_out_T_6 = ~store_unrecoded_rawIn__sign; // @[FPU.scala 273:34]
  wire  classify_out_hi_hi_lo_1 = classify_out_isInf_1 & ~store_unrecoded_rawIn__sign; // @[FPU.scala 273:31]
  wire  _classify_out_isNormal_T_4 = classify_out_codeHi_1 == 2'h1; // @[FPU.scala 266:27]
  wire  classify_out_isHighSubnormalIn_1 = in_in1[61:52] < 10'h2; // @[FPU.scala 264:55]
  wire  classify_out_isNormal_1 = classify_out_codeHi_1 == 2'h1 & ~classify_out_isHighSubnormalIn_1 |
    classify_out_codeHi_1 == 2'h2; // @[FPU.scala 266:61]
  wire  classify_out_hi_lo_hi_1 = classify_out_isNormal_1 & ~store_unrecoded_rawIn__sign; // @[FPU.scala 273:50]
  wire  classify_out_isSubnormal_1 = in_in1[63:61] == 3'h1 | _classify_out_isNormal_T_4 &
    classify_out_isHighSubnormalIn_1; // @[FPU.scala 265:40]
  wire  classify_out_hi_lo_lo_1 = classify_out_isSubnormal_1 & _classify_out_T_6; // @[FPU.scala 274:21]
  wire  classify_out_isZero_1 = in_in1[63:61] == 3'h0; // @[FPU.scala 267:23]
  wire  classify_out_lo_hi_hi_hi_1 = classify_out_isZero_1 & _classify_out_T_6; // @[FPU.scala 274:38]
  wire  classify_out_lo_hi_hi_lo_1 = classify_out_isZero_1 & store_unrecoded_rawIn__sign; // @[FPU.scala 274:55]
  wire  classify_out_lo_hi_lo_1 = classify_out_isSubnormal_1 & store_unrecoded_rawIn__sign; // @[FPU.scala 275:21]
  wire  classify_out_lo_lo_hi_1 = classify_out_isNormal_1 & store_unrecoded_rawIn__sign; // @[FPU.scala 275:39]
  wire  classify_out_lo_lo_lo_1 = classify_out_isInf_1 & store_unrecoded_rawIn__sign; // @[FPU.scala 275:54]
  wire [9:0] _classify_out_T_10 = {classify_out_hi_hi_hi_hi_1,classify_out_hi_hi_hi_lo_1,classify_out_hi_hi_lo_1,
    classify_out_hi_lo_hi_1,classify_out_hi_lo_lo_1,classify_out_lo_hi_hi_hi_1,classify_out_lo_hi_hi_lo_1,
    classify_out_lo_hi_lo_1,classify_out_lo_lo_hi_1,classify_out_lo_lo_lo_1}; // @[Cat.scala 30:58]
  wire [11:0] _classify_out_expOut_commonCase_T_1 = store_unrecoded_rawIn_exp + 12'h100; // @[FPU.scala 286:31]
  wire [11:0] classify_out_expOut_commonCase = _classify_out_expOut_commonCase_T_1 - 12'h800; // @[FPU.scala 286:48]
  wire [5:0] classify_out_expOut_lo = classify_out_expOut_commonCase[5:0]; // @[FPU.scala 287:65]
  wire [8:0] _classify_out_expOut_T_3 = {store_unrecoded_rawIn_exp[11:9],classify_out_expOut_lo}; // @[Cat.scala 30:58]
  wire [8:0] classify_out_hi_lo = store_unrecoded_rawIn_isZero | store_unrecoded_rawIn_exp[11:9] >= 3'h6 ?
    _classify_out_expOut_T_3 : classify_out_expOut_commonCase[8:0]; // @[FPU.scala 287:10]
  wire [75:0] _classify_out_fractOut_T = {store_unrecoded_rawIn_out_sig_lo, 24'h0}; // @[FPU.scala 283:28]
  wire [22:0] classify_out_lo = _classify_out_fractOut_T[75:53]; // @[FPU.scala 283:38]
  wire [32:0] _classify_out_T = {store_unrecoded_rawIn__sign,classify_out_hi_lo,classify_out_lo}; // @[Cat.scala 30:58]
  wire [2:0] classify_out_code = _classify_out_T[31:29]; // @[FPU.scala 260:17]
  wire  classify_out_isNaN = &classify_out_code; // @[FPU.scala 269:22]
  wire  classify_out_hi_hi_hi_hi = classify_out_isNaN & _classify_out_T[22]; // @[FPU.scala 271:24]
  wire  classify_out_hi_hi_hi_lo = classify_out_isNaN & ~_classify_out_T[22]; // @[FPU.scala 270:24]
  wire [1:0] classify_out_codeHi = classify_out_code[2:1]; // @[FPU.scala 261:22]
  wire  classify_out_isSpecial = classify_out_codeHi == 2'h3; // @[FPU.scala 262:28]
  wire  classify_out_isInf = classify_out_isSpecial & ~classify_out_code[0]; // @[FPU.scala 268:27]
  wire  classify_out_sign = _classify_out_T[32]; // @[FPU.scala 259:17]
  wire  _classify_out_T_1 = ~classify_out_sign; // @[FPU.scala 273:34]
  wire  classify_out_hi_hi_lo = classify_out_isInf & ~classify_out_sign; // @[FPU.scala 273:31]
  wire  _classify_out_isNormal_T = classify_out_codeHi == 2'h1; // @[FPU.scala 266:27]
  wire  classify_out_isHighSubnormalIn = _classify_out_T[29:23] < 7'h2; // @[FPU.scala 264:55]
  wire  classify_out_isNormal = classify_out_codeHi == 2'h1 & ~classify_out_isHighSubnormalIn | classify_out_codeHi == 2'h2
    ; // @[FPU.scala 266:61]
  wire  classify_out_hi_lo_hi = classify_out_isNormal & ~classify_out_sign; // @[FPU.scala 273:50]
  wire  classify_out_isSubnormal = classify_out_code == 3'h1 | _classify_out_isNormal_T & classify_out_isHighSubnormalIn
    ; // @[FPU.scala 265:40]
  wire  classify_out_hi_lo_lo = classify_out_isSubnormal & _classify_out_T_1; // @[FPU.scala 274:21]
  wire  classify_out_isZero = classify_out_code == 3'h0; // @[FPU.scala 267:23]
  wire  classify_out_lo_hi_hi_hi = classify_out_isZero & _classify_out_T_1; // @[FPU.scala 274:38]
  wire  classify_out_lo_hi_hi_lo = classify_out_isZero & classify_out_sign; // @[FPU.scala 274:55]
  wire  classify_out_lo_hi_lo = classify_out_isSubnormal & classify_out_sign; // @[FPU.scala 275:21]
  wire  classify_out_lo_lo_hi = classify_out_isNormal & classify_out_sign; // @[FPU.scala 275:39]
  wire  classify_out_lo_lo_lo = classify_out_isInf & classify_out_sign; // @[FPU.scala 275:54]
  wire [9:0] _classify_out_T_5 = {classify_out_hi_hi_hi_hi,classify_out_hi_hi_hi_lo,classify_out_hi_hi_lo,
    classify_out_hi_lo_hi,classify_out_hi_lo_lo,classify_out_lo_hi_hi_hi,classify_out_lo_hi_hi_lo,classify_out_lo_hi_lo,
    classify_out_lo_lo_hi,classify_out_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [9:0] classify_out = store_truncIdx ? _classify_out_T_10 : _classify_out_T_5; // @[package.scala 32:76]
  wire [63:0] _GEN_56 = {{54'd0}, classify_out}; // @[FPU.scala 520:27]
  wire [63:0] _toint_T_2 = _GEN_56 | _toint_T_8; // @[FPU.scala 520:27]
  wire [63:0] _GEN_30 = in_rm[0] ? _toint_T_2 : store; // @[FPU.scala 518:19 FPU.scala 520:11]
  wire [63:0] toint = in_wflags ? _GEN_42 : _GEN_30; // @[FPU.scala 545:20]
  wire [31:0] io_out_bits_toint_lo = toint[31:0]; // @[FPU.scala 493:59]
  wire [31:0] io_out_bits_toint_hi = io_out_bits_toint_lo[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _io_out_bits_toint_T_2 = {io_out_bits_toint_hi,io_out_bits_toint_lo}; // @[Cat.scala 30:58]
  wire  _GEN_41 = ~in_ren2 & cvtType; // @[FPU.scala 571:21 FPU.scala 573:15 FPU.scala 548:13]
  wire  _GEN_31 = in_rm[0] ? 1'h0 : intType_x6; // @[FPU.scala 518:19 FPU.scala 521:13]
  wire  intType = in_wflags ? _GEN_41 : _GEN_31; // @[FPU.scala 545:20]
  wire [9:0] in1_type = intType_x6 ? _classify_out_T_10 : _classify_out_T_5; // @[package.scala 32:76]
  wire  in2_type_hi_hi = in_in2[64]; // @[FPU.scala 280:17]
  wire [51:0] in2_type_fractIn = in_in2[51:0]; // @[FPU.scala 281:20]
  wire [11:0] in2_type_expIn = in_in2[63:52]; // @[FPU.scala 282:18]
  wire [75:0] _in2_type_fractOut_T = {in2_type_fractIn, 24'h0}; // @[FPU.scala 283:28]
  wire [22:0] in2_type_lo = _in2_type_fractOut_T[75:53]; // @[FPU.scala 283:38]
  wire [2:0] in2_type_expOut_hi = in2_type_expIn[11:9]; // @[FPU.scala 285:26]
  wire [11:0] _in2_type_expOut_commonCase_T_1 = in2_type_expIn + 12'h100; // @[FPU.scala 286:31]
  wire [11:0] in2_type_expOut_commonCase = _in2_type_expOut_commonCase_T_1 - 12'h800; // @[FPU.scala 286:48]
  wire [5:0] in2_type_expOut_lo = in2_type_expOut_commonCase[5:0]; // @[FPU.scala 287:65]
  wire [8:0] _in2_type_expOut_T_3 = {in2_type_expOut_hi,in2_type_expOut_lo}; // @[Cat.scala 30:58]
  wire [8:0] in2_type_hi_lo = in2_type_expOut_hi == 3'h0 | in2_type_expOut_hi >= 3'h6 ? _in2_type_expOut_T_3 :
    in2_type_expOut_commonCase[8:0]; // @[FPU.scala 287:10]
  wire [32:0] _in2_type_T = {in2_type_hi_hi,in2_type_hi_lo,in2_type_lo}; // @[Cat.scala 30:58]
  wire  in2_type_sign = _in2_type_T[32]; // @[FPU.scala 259:17]
  wire [2:0] in2_type_code = _in2_type_T[31:29]; // @[FPU.scala 260:17]
  wire [1:0] in2_type_codeHi = in2_type_code[2:1]; // @[FPU.scala 261:22]
  wire  in2_type_isSpecial = in2_type_codeHi == 2'h3; // @[FPU.scala 262:28]
  wire  in2_type_isHighSubnormalIn = _in2_type_T[29:23] < 7'h2; // @[FPU.scala 264:55]
  wire  _in2_type_isSubnormal_T_1 = in2_type_codeHi == 2'h1; // @[FPU.scala 265:50]
  wire  in2_type_isSubnormal = in2_type_code == 3'h1 | in2_type_codeHi == 2'h1 & in2_type_isHighSubnormalIn; // @[FPU.scala 265:40]
  wire  in2_type_isNormal = _in2_type_isSubnormal_T_1 & ~in2_type_isHighSubnormalIn | in2_type_codeHi == 2'h2; // @[FPU.scala 266:61]
  wire  in2_type_isZero = in2_type_code == 3'h0; // @[FPU.scala 267:23]
  wire  in2_type_isInf = in2_type_isSpecial & ~in2_type_code[0]; // @[FPU.scala 268:27]
  wire  in2_type_isNaN = &in2_type_code; // @[FPU.scala 269:22]
  wire  in2_type_hi_hi_hi_lo = in2_type_isNaN & ~_in2_type_T[22]; // @[FPU.scala 270:24]
  wire  in2_type_hi_hi_hi_hi = in2_type_isNaN & _in2_type_T[22]; // @[FPU.scala 271:24]
  wire  _in2_type_T_1 = ~in2_type_sign; // @[FPU.scala 273:34]
  wire  in2_type_hi_hi_lo = in2_type_isInf & ~in2_type_sign; // @[FPU.scala 273:31]
  wire  in2_type_hi_lo_hi = in2_type_isNormal & ~in2_type_sign; // @[FPU.scala 273:50]
  wire  in2_type_hi_lo_lo = in2_type_isSubnormal & _in2_type_T_1; // @[FPU.scala 274:21]
  wire  in2_type_lo_hi_hi_hi = in2_type_isZero & _in2_type_T_1; // @[FPU.scala 274:38]
  wire  in2_type_lo_hi_hi_lo = in2_type_isZero & in2_type_sign; // @[FPU.scala 274:55]
  wire  in2_type_lo_hi_lo = in2_type_isSubnormal & in2_type_sign; // @[FPU.scala 275:21]
  wire  in2_type_lo_lo_hi = in2_type_isNormal & in2_type_sign; // @[FPU.scala 275:39]
  wire  in2_type_lo_lo_lo = in2_type_isInf & in2_type_sign; // @[FPU.scala 275:54]
  wire [9:0] _in2_type_T_5 = {in2_type_hi_hi_hi_hi,in2_type_hi_hi_hi_lo,in2_type_hi_hi_lo,in2_type_hi_lo_hi,
    in2_type_hi_lo_lo,in2_type_lo_hi_hi_hi,in2_type_lo_hi_hi_lo,in2_type_lo_hi_lo,in2_type_lo_lo_hi,in2_type_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [2:0] in2_type_code_1 = in_in2[63:61]; // @[FPU.scala 260:17]
  wire [1:0] in2_type_codeHi_1 = in2_type_code_1[2:1]; // @[FPU.scala 261:22]
  wire  in2_type_isSpecial_1 = in2_type_codeHi_1 == 2'h3; // @[FPU.scala 262:28]
  wire  in2_type_isHighSubnormalIn_1 = in_in2[61:52] < 10'h2; // @[FPU.scala 264:55]
  wire  _in2_type_isSubnormal_T_4 = in2_type_codeHi_1 == 2'h1; // @[FPU.scala 265:50]
  wire  in2_type_isSubnormal_1 = in2_type_code_1 == 3'h1 | in2_type_codeHi_1 == 2'h1 & in2_type_isHighSubnormalIn_1; // @[FPU.scala 265:40]
  wire  in2_type_isNormal_1 = _in2_type_isSubnormal_T_4 & ~in2_type_isHighSubnormalIn_1 | in2_type_codeHi_1 == 2'h2; // @[FPU.scala 266:61]
  wire  in2_type_isZero_1 = in2_type_code_1 == 3'h0; // @[FPU.scala 267:23]
  wire  in2_type_isInf_1 = in2_type_isSpecial_1 & ~in2_type_code_1[0]; // @[FPU.scala 268:27]
  wire  in2_type_isNaN_1 = &in2_type_code_1; // @[FPU.scala 269:22]
  wire  in2_type_hi_hi_hi_lo_1 = in2_type_isNaN_1 & ~in_in2[51]; // @[FPU.scala 270:24]
  wire  in2_type_hi_hi_hi_hi_1 = in2_type_isNaN_1 & in_in2[51]; // @[FPU.scala 271:24]
  wire  _in2_type_T_6 = ~in2_type_hi_hi; // @[FPU.scala 273:34]
  wire  in2_type_hi_hi_lo_1 = in2_type_isInf_1 & ~in2_type_hi_hi; // @[FPU.scala 273:31]
  wire  in2_type_hi_lo_hi_1 = in2_type_isNormal_1 & ~in2_type_hi_hi; // @[FPU.scala 273:50]
  wire  in2_type_hi_lo_lo_1 = in2_type_isSubnormal_1 & _in2_type_T_6; // @[FPU.scala 274:21]
  wire  in2_type_lo_hi_hi_hi_1 = in2_type_isZero_1 & _in2_type_T_6; // @[FPU.scala 274:38]
  wire  in2_type_lo_hi_hi_lo_1 = in2_type_isZero_1 & in2_type_hi_hi; // @[FPU.scala 274:55]
  wire  in2_type_lo_hi_lo_1 = in2_type_isSubnormal_1 & in2_type_hi_hi; // @[FPU.scala 275:21]
  wire  in2_type_lo_lo_hi_1 = in2_type_isNormal_1 & in2_type_hi_hi; // @[FPU.scala 275:39]
  wire  in2_type_lo_lo_lo_1 = in2_type_isInf_1 & in2_type_hi_hi; // @[FPU.scala 275:54]
  wire [9:0] _in2_type_T_10 = {in2_type_hi_hi_hi_hi_1,in2_type_hi_hi_hi_lo_1,in2_type_hi_hi_lo_1,in2_type_hi_lo_hi_1,
    in2_type_hi_lo_lo_1,in2_type_lo_hi_hi_hi_1,in2_type_lo_hi_hi_lo_1,in2_type_lo_hi_lo_1,in2_type_lo_lo_hi_1,
    in2_type_lo_lo_lo_1}; // @[Cat.scala 30:58]
  wire [9:0] in2_type = intType_x6 ? _in2_type_T_10 : _in2_type_T_5; // @[package.scala 32:76]
  wire  _isSubnormal_T_2 = in1_type[2] | in1_type[5]; // @[FPU.scala 503:35]
  wire  io_out_bits_u_flag_hi_hi_lo = in1_type[2] | in1_type[5] | in2_type[2] | in2_type[5]; // @[FPU.scala 503:65]
  wire  io_out_bits_u_flag_lo_hi_lo = (classify_out_hi_hi_hi_lo_1 | in2_type_hi_hi_hi_lo_1) & in_cond_unicore[3]; // @[FPU.scala 509:73]
  wire [6:0] _io_out_bits_u_exception_T = {io_out_bits_u_flag_lo_hi_lo,1'h0,2'h0,2'h0,io_out_bits_u_flag_hi_hi_lo}; // @[Cat.scala 30:58]
  wire [6:0] _io_out_bits_u_exception_T_1 = _io_out_bits_u_exception_T & in_exc_enabled; // @[FPU.scala 513:114]
  wire [9:0] _io_out_bits_u_flag_T = {2'h0,io_out_bits_u_flag_hi_hi_lo,2'h0,2'h0,io_out_bits_u_flag_lo_hi_lo,2'h0}; // @[Cat.scala 30:58]
  wire  _toint_cmp_unicore_T_2 = ~dcmp_io_ordered; // @[FPU.scala 552:63]
  wire  _toint_cmp_unicore_T_8 = _toint_cmp_unicore_T_2 | dcmp_io_eq; // @[FPU.scala 554:80]
  wire  _toint_cmp_unicore_T_14 = _toint_cmp_unicore_T_2 | dcmp_io_lt; // @[FPU.scala 556:80]
  wire  _toint_cmp_unicore_T_21 = ~dcmp_io_gt; // @[FPU.scala 558:63]
  wire  _toint_cmp_unicore_T_44 = in_cond_unicore == 4'hf & _toint_cmp_unicore_T_21; // @[FPU.scala 566:60]
  wire  _toint_cmp_unicore_T_46 = in_cond_unicore == 4'he & (dcmp_io_lt | dcmp_io_eq) | _toint_cmp_unicore_T_44; // @[FPU.scala 565:30]
  wire  _toint_cmp_unicore_T_47 = in_cond_unicore == 4'hd & _toint_cmp_unicore_T_14 | _toint_cmp_unicore_T_46; // @[FPU.scala 564:30]
  wire  _toint_cmp_unicore_T_48 = in_cond_unicore == 4'hc & dcmp_io_lt | _toint_cmp_unicore_T_47; // @[FPU.scala 563:30]
  wire  _toint_cmp_unicore_T_49 = in_cond_unicore == 4'hb & _toint_cmp_unicore_T_8 | _toint_cmp_unicore_T_48; // @[FPU.scala 562:30]
  wire  _toint_cmp_unicore_T_50 = in_cond_unicore == 4'ha & dcmp_io_eq | _toint_cmp_unicore_T_49; // @[FPU.scala 561:30]
  wire  _toint_cmp_unicore_T_51 = in_cond_unicore == 4'h9 & _toint_cmp_unicore_T_2 | _toint_cmp_unicore_T_50; // @[FPU.scala 560:30]
  wire  _toint_cmp_unicore_T_52 = in_cond_unicore == 4'h8 ? 1'h0 : _toint_cmp_unicore_T_51; // @[FPU.scala 559:30]
  wire  _toint_cmp_unicore_T_53 = in_cond_unicore == 4'h7 & ~dcmp_io_gt | _toint_cmp_unicore_T_52; // @[FPU.scala 558:30]
  wire  _toint_cmp_unicore_T_54 = in_cond_unicore == 4'h6 & (~dcmp_io_eq | dcmp_io_lt) | _toint_cmp_unicore_T_53; // @[FPU.scala 557:30]
  wire  _toint_cmp_unicore_T_55 = in_cond_unicore == 4'h5 & (_toint_cmp_unicore_T_2 | dcmp_io_lt) |
    _toint_cmp_unicore_T_54; // @[FPU.scala 556:30]
  wire  _toint_cmp_unicore_T_56 = in_cond_unicore == 4'h4 & dcmp_io_lt | _toint_cmp_unicore_T_55; // @[FPU.scala 555:30]
  wire  _toint_cmp_unicore_T_57 = in_cond_unicore == 4'h3 & (_toint_cmp_unicore_T_2 | dcmp_io_eq) |
    _toint_cmp_unicore_T_56; // @[FPU.scala 554:30]
  wire  _toint_cmp_unicore_T_58 = in_cond_unicore == 4'h2 & dcmp_io_eq | _toint_cmp_unicore_T_57; // @[FPU.scala 553:30]
  wire  _toint_cmp_unicore_T_59 = in_cond_unicore == 4'h1 & ~dcmp_io_ordered | _toint_cmp_unicore_T_58; // @[FPU.scala 552:30]
  wire  _toint_cmp_unicore_T_60 = in_cond_unicore == 4'h0 ? 1'h0 : _toint_cmp_unicore_T_59; // @[FPU.scala 551:30]
  wire  io_out_bits_exc_hi_hi = |conv_io_intExceptionFlags[2:1]; // @[FPU.scala 579:62]
  wire  io_out_bits_exc_lo = conv_io_intExceptionFlags[0]; // @[FPU.scala 579:104]
  wire [4:0] _io_out_bits_exc_T_1 = {io_out_bits_exc_hi_hi,3'h0,io_out_bits_exc_lo}; // @[Cat.scala 30:58]
  wire  io_out_bits_exc_lo_1 = ~io_out_bits_exc_hi_hi_1 & io_out_bits_exc_lo; // @[FPU.scala 593:64]
  wire [4:0] _io_out_bits_exc_T_4 = {io_out_bits_exc_hi_hi_1,3'h0,io_out_bits_exc_lo_1}; // @[Cat.scala 30:58]
  wire  io_out_bits_u_flag_lo_hi_lo_1 = classify_out_hi_hi_hi_lo_1 | in1_type[0] | in1_type[7]; // @[FPU.scala 606:68]
  wire  io_out_bits_u_flag_lo_lo_lo = in1_type[3] | in1_type[4]; // @[FPU.scala 607:38]
  wire  io_out_bits_u_flag_lo_lo_hi = in1_type[0] | in1_type[7]; // @[FPU.scala 608:37]
  wire  io_out_bits_u_exception_lo_hi_lo = ~io_out_bits_u_flag_lo_hi_lo_1 & io_out_bits_exc_hi_hi_1; // @[FPU.scala 610:142]
  wire [6:0] _io_out_bits_u_exception_T_5 = {io_out_bits_u_flag_lo_hi_lo_1,1'h0,2'h0,io_out_bits_exc_lo_1,
    io_out_bits_u_exception_lo_hi_lo,_isSubnormal_T_2}; // @[Cat.scala 30:58]
  wire [6:0] _io_out_bits_u_exception_T_6 = _io_out_bits_u_exception_T_5 & in_exc_enabled; // @[FPU.scala 610:167]
  wire [9:0] _io_out_bits_u_flag_T_4 = {2'h0,_isSubnormal_T_2,io_out_bits_u_exception_lo_hi_lo,io_out_bits_exc_lo_1,2'h0
    ,io_out_bits_u_flag_lo_hi_lo_1,io_out_bits_u_flag_lo_lo_hi,io_out_bits_u_flag_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [6:0] _GEN_33 = in_is_unicore ? _io_out_bits_u_exception_T_6 : _io_out_bits_u_exception_T_1; // @[FPU.scala 595:31 FPU.scala 610:37]
  wire [9:0] _GEN_34 = in_is_unicore ? _io_out_bits_u_flag_T_4 : _io_out_bits_u_flag_T; // @[FPU.scala 595:31 FPU.scala 611:32]
  wire [4:0] _GEN_37 = ~cvtType ? _io_out_bits_exc_T_4 : _io_out_bits_exc_T_1; // @[FPU.scala 583:30 FPU.scala 593:27 FPU.scala 579:23]
  wire [6:0] _GEN_38 = ~cvtType ? _GEN_33 : _io_out_bits_u_exception_T_1; // @[FPU.scala 583:30]
  wire [9:0] _GEN_39 = ~cvtType ? _GEN_34 : _io_out_bits_u_flag_T; // @[FPU.scala 583:30]
  wire [4:0] _GEN_43 = ~in_ren2 ? _GEN_37 : dcmp_io_exceptionFlags; // @[FPU.scala 571:21 FPU.scala 547:21]
  wire [6:0] _GEN_44 = ~in_ren2 ? _GEN_38 : _io_out_bits_u_exception_T_1; // @[FPU.scala 571:21]
  wire [9:0] _GEN_45 = ~in_ren2 ? _GEN_39 : _io_out_bits_u_flag_T; // @[FPU.scala 571:21]
  CompareRecFN dcmp ( // @[FPU.scala 482:20]
    .io_a(dcmp_io_a),
    .io_b(dcmp_io_b),
    .io_signaling(dcmp_io_signaling),
    .io_lt(dcmp_io_lt),
    .io_eq(dcmp_io_eq),
    .io_gt(dcmp_io_gt),
    .io_exceptionFlags(dcmp_io_exceptionFlags),
    .io_ordered(dcmp_io_ordered)
  );
  RecFNToIN conv ( // @[FPU.scala 574:24]
    .io_in(conv_io_in),
    .io_roundingMode(conv_io_roundingMode),
    .io_signedOut(conv_io_signedOut),
    .io_out(conv_io_out),
    .io_intExceptionFlags(conv_io_intExceptionFlags)
  );
  RecFNToIN_1 narrow ( // @[FPU.scala 584:30]
    .io_in(narrow_io_in),
    .io_roundingMode(narrow_io_roundingMode),
    .io_signedOut(narrow_io_signedOut),
    .io_out(narrow_io_out),
    .io_intExceptionFlags(narrow_io_intExceptionFlags)
  );
  assign io_out_valid = valid; // @[FPU.scala 619:16]
  assign io_out_bits_in_ldst = in_ldst; // @[FPU.scala 621:18]
  assign io_out_bits_in_wen = in_wen; // @[FPU.scala 621:18]
  assign io_out_bits_in_ren1 = in_ren1; // @[FPU.scala 621:18]
  assign io_out_bits_in_ren2 = in_ren2; // @[FPU.scala 621:18]
  assign io_out_bits_in_ren3 = in_ren3; // @[FPU.scala 621:18]
  assign io_out_bits_in_swap12 = in_swap12; // @[FPU.scala 621:18]
  assign io_out_bits_in_swap23 = in_swap23; // @[FPU.scala 621:18]
  assign io_out_bits_in_typeTagIn = in_typeTagIn; // @[FPU.scala 621:18]
  assign io_out_bits_in_typeTagOut = in_typeTagOut; // @[FPU.scala 621:18]
  assign io_out_bits_in_fromint = in_fromint; // @[FPU.scala 621:18]
  assign io_out_bits_in_toint = in_toint; // @[FPU.scala 621:18]
  assign io_out_bits_in_fastpipe = in_fastpipe; // @[FPU.scala 621:18]
  assign io_out_bits_in_fma = in_fma; // @[FPU.scala 621:18]
  assign io_out_bits_in_div = in_div; // @[FPU.scala 621:18]
  assign io_out_bits_in_sqrt = in_sqrt; // @[FPU.scala 621:18]
  assign io_out_bits_in_wflags = in_wflags; // @[FPU.scala 621:18]
  assign io_out_bits_in_rm = in_rm; // @[FPU.scala 621:18]
  assign io_out_bits_in_fmaCmd = in_fmaCmd; // @[FPU.scala 621:18]
  assign io_out_bits_in_typ = in_typ; // @[FPU.scala 621:18]
  assign io_out_bits_in_fmt = in_fmt; // @[FPU.scala 621:18]
  assign io_out_bits_in_in1 = in_in1; // @[FPU.scala 621:18]
  assign io_out_bits_in_in2 = in_in2; // @[FPU.scala 621:18]
  assign io_out_bits_in_in3 = in_in3; // @[FPU.scala 621:18]
  assign io_out_bits_in_is_unicore = in_is_unicore; // @[FPU.scala 621:18]
  assign io_out_bits_in_exc_enabled = in_exc_enabled; // @[FPU.scala 621:18]
  assign io_out_bits_in_c = in_c; // @[FPU.scala 621:18]
  assign io_out_bits_in_cond_unicore = in_cond_unicore; // @[FPU.scala 621:18]
  assign io_out_bits_lt = dcmp_io_lt | $signed(dcmp_io_a) < 65'sh0 & $signed(dcmp_io_b) >= 65'sh0; // @[FPU.scala 620:32]
  assign io_out_bits_store = store_truncIdx ? _store_T_3 : _store_T_4; // @[package.scala 32:76]
  assign io_out_bits_toint = intType ? toint : _io_out_bits_toint_T_2; // @[package.scala 32:76]
  assign io_out_bits_exc = in_wflags ? _GEN_43 : 5'h0; // @[FPU.scala 545:20 FPU.scala 494:19]
  assign io_out_bits_toint_cmp_unicore = in_wflags ? {{63'd0}, _toint_cmp_unicore_T_60} : store; // @[FPU.scala 545:20 FPU.scala 551:23]
  assign io_out_bits_u_exception = in_wflags ? _GEN_44 : _io_out_bits_u_exception_T_1; // @[FPU.scala 545:20]
  assign io_out_bits_u_flag = in_wflags ? _GEN_45 : _io_out_bits_u_flag_T; // @[FPU.scala 545:20]
  assign io_out_bits_u_c = 1'h0; // @[FPU.scala 545:20]
  assign dcmp_io_a = in_in1; // @[FPU.scala 483:13]
  assign dcmp_io_b = in_in2; // @[FPU.scala 484:13]
  assign dcmp_io_signaling = ~in_rm[1]; // @[FPU.scala 485:24]
  assign conv_io_in = in_in1; // @[FPU.scala 575:18]
  assign conv_io_roundingMode = in_rm; // @[FPU.scala 576:28]
  assign conv_io_signedOut = ~in_typ[0]; // @[FPU.scala 577:28]
  assign narrow_io_in = in_in1; // @[FPU.scala 585:24]
  assign narrow_io_roundingMode = in_rm; // @[FPU.scala 586:34]
  assign narrow_io_signedOut = ~in_typ[0]; // @[FPU.scala 587:34]
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
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_is_unicore <= io_in_bits_is_unicore; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_exc_enabled <= io_in_bits_exc_enabled; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_c <= io_in_bits_c; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      in_cond_unicore <= io_in_bits_cond_unicore; // @[Reg.scala 16:23]
    end
    valid <= io_in_valid; // @[FPU.scala 480:18]
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
  in_is_unicore = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  in_exc_enabled = _RAND_24[6:0];
  _RAND_25 = {1{`RANDOM}};
  in_c = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  in_cond_unicore = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  valid = _RAND_27[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
