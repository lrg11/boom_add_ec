module FPToFP(
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
  output [64:0] io_out_bits_data,
  output [4:0]  io_out_bits_exc,
  output [6:0]  io_out_bits_u_exception,
  output [9:0]  io_out_bits_u_flag,
  output        io_out_bits_u_c,
  input         io_lt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [95:0] _RAND_6;
  reg [95:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [95:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [95:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [95:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
`endif // RANDOMIZE_REG_INIT
  wire [64:0] narrower_io_in; // @[FPU.scala 754:30]
  wire [2:0] narrower_io_roundingMode; // @[FPU.scala 754:30]
  wire  narrower_io_detectTininess; // @[FPU.scala 754:30]
  wire [32:0] narrower_io_out; // @[FPU.scala 754:30]
  wire [4:0] narrower_io_exceptionFlags; // @[FPU.scala 754:30]
  reg  inPipe_valid; // @[Valid.scala 117:22]
  reg  inPipe_bits_ren2; // @[Reg.scala 15:16]
  reg [1:0] inPipe_bits_typeTagOut; // @[Reg.scala 15:16]
  reg  inPipe_bits_wflags; // @[Reg.scala 15:16]
  reg [2:0] inPipe_bits_rm; // @[Reg.scala 15:16]
  reg [1:0] inPipe_bits_fmt; // @[Reg.scala 15:16]
  reg [64:0] inPipe_bits_in1; // @[Reg.scala 15:16]
  reg [64:0] inPipe_bits_in2; // @[Reg.scala 15:16]
  reg [6:0] inPipe_bits_exc_enabled; // @[Reg.scala 15:16]
  wire [64:0] _signNum_T_1 = inPipe_bits_in1 ^ inPipe_bits_in2; // @[FPU.scala 697:48]
  wire [64:0] _signNum_T_3 = ~inPipe_bits_in2; // @[FPU.scala 697:82]
  wire [64:0] _signNum_T_4 = inPipe_bits_rm[0] ? _signNum_T_3 : inPipe_bits_in2; // @[FPU.scala 697:66]
  wire [64:0] signNum = inPipe_bits_rm[1] ? _signNum_T_1 : _signNum_T_4; // @[FPU.scala 697:20]
  wire  fsgnj_hi = signNum[64]; // @[FPU.scala 698:26]
  wire [63:0] fsgnj_lo = inPipe_bits_in1[63:0]; // @[FPU.scala 698:45]
  wire [64:0] fsgnj = {fsgnj_hi,fsgnj_lo}; // @[Cat.scala 30:58]
  wire  u_type_hi_hi = fsgnj[64]; // @[FPU.scala 280:17]
  wire [51:0] u_type_fractIn = fsgnj[51:0]; // @[FPU.scala 281:20]
  wire [11:0] u_type_expIn = fsgnj[63:52]; // @[FPU.scala 282:18]
  wire [75:0] _u_type_fractOut_T = {u_type_fractIn, 24'h0}; // @[FPU.scala 283:28]
  wire [22:0] u_type_lo = _u_type_fractOut_T[75:53]; // @[FPU.scala 283:38]
  wire [2:0] u_type_expOut_hi = u_type_expIn[11:9]; // @[FPU.scala 285:26]
  wire [11:0] _u_type_expOut_commonCase_T_1 = u_type_expIn + 12'h100; // @[FPU.scala 286:31]
  wire [11:0] u_type_expOut_commonCase = _u_type_expOut_commonCase_T_1 - 12'h800; // @[FPU.scala 286:48]
  wire [5:0] u_type_expOut_lo = u_type_expOut_commonCase[5:0]; // @[FPU.scala 287:65]
  wire [8:0] _u_type_expOut_T_3 = {u_type_expOut_hi,u_type_expOut_lo}; // @[Cat.scala 30:58]
  wire [8:0] u_type_hi_lo = u_type_expOut_hi == 3'h0 | u_type_expOut_hi >= 3'h6 ? _u_type_expOut_T_3 :
    u_type_expOut_commonCase[8:0]; // @[FPU.scala 287:10]
  wire [32:0] _u_type_T = {u_type_hi_hi,u_type_hi_lo,u_type_lo}; // @[Cat.scala 30:58]
  wire  u_type_sign = _u_type_T[32]; // @[FPU.scala 259:17]
  wire [2:0] u_type_code = _u_type_T[31:29]; // @[FPU.scala 260:17]
  wire [1:0] u_type_codeHi = u_type_code[2:1]; // @[FPU.scala 261:22]
  wire  u_type_isSpecial = u_type_codeHi == 2'h3; // @[FPU.scala 262:28]
  wire  u_type_isHighSubnormalIn = _u_type_T[29:23] < 7'h2; // @[FPU.scala 264:55]
  wire  _u_type_isSubnormal_T_1 = u_type_codeHi == 2'h1; // @[FPU.scala 265:50]
  wire  u_type_isSubnormal = u_type_code == 3'h1 | u_type_codeHi == 2'h1 & u_type_isHighSubnormalIn; // @[FPU.scala 265:40]
  wire  u_type_isNormal = _u_type_isSubnormal_T_1 & ~u_type_isHighSubnormalIn | u_type_codeHi == 2'h2; // @[FPU.scala 266:61]
  wire  u_type_isZero = u_type_code == 3'h0; // @[FPU.scala 267:23]
  wire  u_type_isInf = u_type_isSpecial & ~u_type_code[0]; // @[FPU.scala 268:27]
  wire  u_type_isNaN = &u_type_code; // @[FPU.scala 269:22]
  wire  u_type_hi_hi_hi_lo = u_type_isNaN & ~_u_type_T[22]; // @[FPU.scala 270:24]
  wire  u_type_hi_hi_hi_hi = u_type_isNaN & _u_type_T[22]; // @[FPU.scala 271:24]
  wire  _u_type_T_1 = ~u_type_sign; // @[FPU.scala 273:34]
  wire  u_type_hi_hi_lo = u_type_isInf & ~u_type_sign; // @[FPU.scala 273:31]
  wire  u_type_hi_lo_hi = u_type_isNormal & ~u_type_sign; // @[FPU.scala 273:50]
  wire  u_type_hi_lo_lo = u_type_isSubnormal & _u_type_T_1; // @[FPU.scala 274:21]
  wire  u_type_lo_hi_hi_hi = u_type_isZero & _u_type_T_1; // @[FPU.scala 274:38]
  wire  u_type_lo_hi_hi_lo = u_type_isZero & u_type_sign; // @[FPU.scala 274:55]
  wire  u_type_lo_hi_lo = u_type_isSubnormal & u_type_sign; // @[FPU.scala 275:21]
  wire  u_type_lo_lo_hi = u_type_isNormal & u_type_sign; // @[FPU.scala 275:39]
  wire  u_type_lo_lo_lo = u_type_isInf & u_type_sign; // @[FPU.scala 275:54]
  wire [9:0] _u_type_T_5 = {u_type_hi_hi_hi_hi,u_type_hi_hi_hi_lo,u_type_hi_hi_lo,u_type_hi_lo_hi,u_type_hi_lo_lo,
    u_type_lo_hi_hi_hi,u_type_lo_hi_hi_lo,u_type_lo_hi_lo,u_type_lo_lo_hi,u_type_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [2:0] u_type_code_1 = fsgnj[63:61]; // @[FPU.scala 260:17]
  wire [1:0] u_type_codeHi_1 = u_type_code_1[2:1]; // @[FPU.scala 261:22]
  wire  u_type_isSpecial_1 = u_type_codeHi_1 == 2'h3; // @[FPU.scala 262:28]
  wire  u_type_isHighSubnormalIn_1 = fsgnj[61:52] < 10'h2; // @[FPU.scala 264:55]
  wire  _u_type_isSubnormal_T_4 = u_type_codeHi_1 == 2'h1; // @[FPU.scala 265:50]
  wire  u_type_isSubnormal_1 = u_type_code_1 == 3'h1 | u_type_codeHi_1 == 2'h1 & u_type_isHighSubnormalIn_1; // @[FPU.scala 265:40]
  wire  u_type_isNormal_1 = _u_type_isSubnormal_T_4 & ~u_type_isHighSubnormalIn_1 | u_type_codeHi_1 == 2'h2; // @[FPU.scala 266:61]
  wire  u_type_isZero_1 = u_type_code_1 == 3'h0; // @[FPU.scala 267:23]
  wire  u_type_isInf_1 = u_type_isSpecial_1 & ~u_type_code_1[0]; // @[FPU.scala 268:27]
  wire  u_type_isNaN_1 = &u_type_code_1; // @[FPU.scala 269:22]
  wire  u_type_hi_hi_hi_lo_1 = u_type_isNaN_1 & ~fsgnj[51]; // @[FPU.scala 270:24]
  wire  u_type_hi_hi_hi_hi_1 = u_type_isNaN_1 & fsgnj[51]; // @[FPU.scala 271:24]
  wire  _u_type_T_6 = ~u_type_hi_hi; // @[FPU.scala 273:34]
  wire  u_type_hi_hi_lo_1 = u_type_isInf_1 & ~u_type_hi_hi; // @[FPU.scala 273:31]
  wire  u_type_hi_lo_hi_1 = u_type_isNormal_1 & ~u_type_hi_hi; // @[FPU.scala 273:50]
  wire  u_type_hi_lo_lo_1 = u_type_isSubnormal_1 & _u_type_T_6; // @[FPU.scala 274:21]
  wire  u_type_lo_hi_hi_hi_1 = u_type_isZero_1 & _u_type_T_6; // @[FPU.scala 274:38]
  wire  u_type_lo_hi_hi_lo_1 = u_type_isZero_1 & u_type_hi_hi; // @[FPU.scala 274:55]
  wire  u_type_lo_hi_lo_1 = u_type_isSubnormal_1 & u_type_hi_hi; // @[FPU.scala 275:21]
  wire  u_type_lo_lo_hi_1 = u_type_isNormal_1 & u_type_hi_hi; // @[FPU.scala 275:39]
  wire  u_type_lo_lo_lo_1 = u_type_isInf_1 & u_type_hi_hi; // @[FPU.scala 275:54]
  wire [9:0] _u_type_T_10 = {u_type_hi_hi_hi_hi_1,u_type_hi_hi_hi_lo_1,u_type_hi_hi_lo_1,u_type_hi_lo_hi_1,
    u_type_hi_lo_lo_1,u_type_lo_hi_hi_hi_1,u_type_lo_hi_hi_lo_1,u_type_lo_hi_lo_1,u_type_lo_lo_hi_1,u_type_lo_lo_lo_1}; // @[Cat.scala 30:58]
  wire  u_type_truncIdx = inPipe_bits_fmt[0]; // @[package.scala 31:49]
  wire [9:0] u_type = u_type_truncIdx ? _u_type_T_10 : _u_type_T_5; // @[package.scala 32:76]
  wire  fsgnjMux_u_flag_hi_hi_lo = u_type[2] | u_type[5]; // @[FPU.scala 709:33]
  wire  _invalid_op_T_1 = &inPipe_bits_in1[63:61]; // @[FPU.scala 255:56]
  wire  _invalid_op_T_4 = _invalid_op_T_1 & ~inPipe_bits_in1[51]; // @[FPU.scala 256:34]
  wire  _invalid_op_T_6 = &inPipe_bits_in2[63:61]; // @[FPU.scala 255:56]
  wire  _invalid_op_T_9 = _invalid_op_T_6 & ~inPipe_bits_in2[51]; // @[FPU.scala 256:34]
  wire  fsgnjMux_u_flag_lo_hi_lo = _invalid_op_T_4 | _invalid_op_T_9; // @[FPU.scala 715:50]
  wire  fsgnjMux_u_flag_lo_lo_lo = u_type[3] | u_type[4]; // @[FPU.scala 716:28]
  wire  fsgnjMux_u_flag_lo_lo_hi = u_type[0] | u_type[7]; // @[FPU.scala 717:27]
  wire [6:0] _fsgnjMux_u_exception_T = {fsgnjMux_u_flag_lo_hi_lo,1'h0,2'h0,2'h0,fsgnjMux_u_flag_hi_hi_lo}; // @[Cat.scala 30:58]
  wire [6:0] fsgnjMux_u_exception = _fsgnjMux_u_exception_T & inPipe_bits_exc_enabled; // @[FPU.scala 719:111]
  wire [9:0] fsgnjMux_u_flag = {2'h0,fsgnjMux_u_flag_hi_hi_lo,2'h0,2'h0,fsgnjMux_u_flag_lo_hi_lo,
    fsgnjMux_u_flag_lo_lo_hi,fsgnjMux_u_flag_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  isNaNOut = _invalid_op_T_1 & _invalid_op_T_6; // @[FPU.scala 728:27]
  wire  isLHS = _invalid_op_T_6 | inPipe_bits_rm[0] != io_lt & ~_invalid_op_T_1; // @[FPU.scala 729:24]
  wire [4:0] _fsgnjMux_exc_T = {fsgnjMux_u_flag_lo_hi_lo, 4'h0}; // @[FPU.scala 730:31]
  wire [64:0] _fsgnjMux_data_T = isLHS ? inPipe_bits_in1 : inPipe_bits_in2; // @[FPU.scala 731:53]
  wire [64:0] _fsgnjMux_data_T_1 = isNaNOut ? 65'he008000000000000 : _fsgnjMux_data_T; // @[FPU.scala 731:25]
  wire [4:0] _GEN_30 = inPipe_bits_wflags ? _fsgnjMux_exc_T : 5'h0; // @[FPU.scala 724:25 FPU.scala 730:18 FPU.scala 701:16]
  wire [64:0] _GEN_31 = inPipe_bits_wflags ? _fsgnjMux_data_T_1 : fsgnj; // @[FPU.scala 724:25 FPU.scala 731:19 FPU.scala 702:17]
  wire  _T = inPipe_bits_typeTagOut == 2'h0; // @[FPU.scala 738:18]
  wire [64:0] widened = _invalid_op_T_1 ? 65'he008000000000000 : inPipe_bits_in1; // @[FPU.scala 746:24]
  wire [64:0] fsgnjMux_data = inPipe_bits_wflags & ~inPipe_bits_ren2 ? widened : _GEN_31; // @[FPU.scala 743:42 FPU.scala 747:21]
  wire [31:0] mux_data_hi = fsgnjMux_data[64:33]; // @[FPU.scala 739:37]
  wire  mux_data_hi_hi = fsgnjMux_data[64]; // @[FPU.scala 280:17]
  wire [51:0] mux_data_fractIn = fsgnjMux_data[51:0]; // @[FPU.scala 281:20]
  wire [11:0] mux_data_expIn = fsgnjMux_data[63:52]; // @[FPU.scala 282:18]
  wire [75:0] _mux_data_fractOut_T = {mux_data_fractIn, 24'h0}; // @[FPU.scala 283:28]
  wire [22:0] mux_data_lo = _mux_data_fractOut_T[75:53]; // @[FPU.scala 283:38]
  wire [2:0] mux_data_expOut_hi = mux_data_expIn[11:9]; // @[FPU.scala 285:26]
  wire [11:0] _mux_data_expOut_commonCase_T_1 = mux_data_expIn + 12'h100; // @[FPU.scala 286:31]
  wire [11:0] mux_data_expOut_commonCase = _mux_data_expOut_commonCase_T_1 - 12'h800; // @[FPU.scala 286:48]
  wire [5:0] mux_data_expOut_lo = mux_data_expOut_commonCase[5:0]; // @[FPU.scala 287:65]
  wire [8:0] _mux_data_expOut_T_3 = {mux_data_expOut_hi,mux_data_expOut_lo}; // @[Cat.scala 30:58]
  wire [8:0] mux_data_hi_lo = mux_data_expOut_hi == 3'h0 | mux_data_expOut_hi >= 3'h6 ? _mux_data_expOut_T_3 :
    mux_data_expOut_commonCase[8:0]; // @[FPU.scala 287:10]
  wire [64:0] _mux_data_T = {mux_data_hi,mux_data_hi_hi,mux_data_hi_lo,mux_data_lo}; // @[Cat.scala 30:58]
  wire [64:0] _GEN_32 = inPipe_bits_typeTagOut == 2'h0 ? _mux_data_T : fsgnjMux_data; // @[FPU.scala 738:34 FPU.scala 739:16]
  wire [4:0] _fsgnjMux_exc_T_6 = {_invalid_op_T_4, 4'h0}; // @[FPU.scala 748:51]
  wire [64:0] _mux_data_T_1 = {mux_data_hi,narrower_io_out}; // @[Cat.scala 30:58]
  wire [4:0] fsgnjMux_exc = inPipe_bits_wflags & ~inPipe_bits_ren2 ? _fsgnjMux_exc_T_6 : _GEN_30; // @[FPU.scala 743:42 FPU.scala 748:20]
  reg  io_out_v; // @[Valid.scala 117:22]
  reg [64:0] io_out_b_data; // @[Reg.scala 15:16]
  reg [4:0] io_out_b_exc; // @[Reg.scala 15:16]
  reg [6:0] io_out_b_u_exception; // @[Reg.scala 15:16]
  reg [9:0] io_out_b_u_flag; // @[Reg.scala 15:16]
  reg  io_out_outPipe_valid; // @[Valid.scala 117:22]
  reg [64:0] io_out_outPipe_bits_data; // @[Reg.scala 15:16]
  reg [4:0] io_out_outPipe_bits_exc; // @[Reg.scala 15:16]
  reg [6:0] io_out_outPipe_bits_u_exception; // @[Reg.scala 15:16]
  reg [9:0] io_out_outPipe_bits_u_flag; // @[Reg.scala 15:16]
  reg  io_out_outPipe_valid_1; // @[Valid.scala 117:22]
  reg [64:0] io_out_outPipe_bits_1_data; // @[Reg.scala 15:16]
  reg [4:0] io_out_outPipe_bits_1_exc; // @[Reg.scala 15:16]
  reg [6:0] io_out_outPipe_bits_1_u_exception; // @[Reg.scala 15:16]
  reg [9:0] io_out_outPipe_bits_1_u_flag; // @[Reg.scala 15:16]
  RecFNToRecFN narrower ( // @[FPU.scala 754:30]
    .io_in(narrower_io_in),
    .io_roundingMode(narrower_io_roundingMode),
    .io_detectTininess(narrower_io_detectTininess),
    .io_out(narrower_io_out),
    .io_exceptionFlags(narrower_io_exceptionFlags)
  );
  assign io_out_valid = io_out_outPipe_valid_1; // @[Valid.scala 112:21 Valid.scala 113:17]
  assign io_out_bits_data = io_out_outPipe_bits_1_data; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_out_bits_exc = io_out_outPipe_bits_1_exc; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_out_bits_u_exception = io_out_outPipe_bits_1_u_exception; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_out_bits_u_flag = io_out_outPipe_bits_1_u_flag; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_out_bits_u_c = 1'h0; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign narrower_io_in = inPipe_bits_in1; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign narrower_io_roundingMode = inPipe_bits_rm; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign narrower_io_detectTininess = 1'h1; // @[FPU.scala 757:36]
  always @(posedge clock) begin
    if (reset) begin // @[Valid.scala 117:22]
      inPipe_valid <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      inPipe_valid <= io_in_valid; // @[Valid.scala 117:22]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_ren2 <= io_in_bits_ren2; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_typeTagOut <= io_in_bits_typeTagOut; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_wflags <= io_in_bits_wflags; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_rm <= io_in_bits_rm; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_fmt <= io_in_bits_fmt; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_in1 <= io_in_bits_in1; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_in2 <= io_in_bits_in2; // @[Reg.scala 16:23]
    end
    if (io_in_valid) begin // @[Reg.scala 16:19]
      inPipe_bits_exc_enabled <= io_in_bits_exc_enabled; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      io_out_v <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      io_out_v <= inPipe_valid; // @[Valid.scala 117:22]
    end
    if (inPipe_valid) begin // @[Reg.scala 16:19]
      if (inPipe_bits_wflags & ~inPipe_bits_ren2) begin // @[FPU.scala 743:42]
        if (_T) begin // @[FPU.scala 753:120]
          io_out_b_data <= _mux_data_T_1; // @[FPU.scala 759:18]
        end else begin
          io_out_b_data <= _GEN_32;
        end
      end else begin
        io_out_b_data <= _GEN_32;
      end
    end
    if (inPipe_valid) begin // @[Reg.scala 16:19]
      if (inPipe_bits_wflags & ~inPipe_bits_ren2) begin // @[FPU.scala 743:42]
        if (_T) begin // @[FPU.scala 753:120]
          io_out_b_exc <= narrower_io_exceptionFlags; // @[FPU.scala 760:17]
        end else begin
          io_out_b_exc <= fsgnjMux_exc;
        end
      end else begin
        io_out_b_exc <= fsgnjMux_exc;
      end
    end
    if (inPipe_valid) begin // @[Reg.scala 16:19]
      io_out_b_u_exception <= fsgnjMux_u_exception; // @[Reg.scala 16:23]
    end
    if (inPipe_valid) begin // @[Reg.scala 16:19]
      io_out_b_u_flag <= fsgnjMux_u_flag; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      io_out_outPipe_valid <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      io_out_outPipe_valid <= io_out_v; // @[Valid.scala 117:22]
    end
    if (io_out_v) begin // @[Reg.scala 16:19]
      io_out_outPipe_bits_data <= io_out_b_data; // @[Reg.scala 16:23]
    end
    if (io_out_v) begin // @[Reg.scala 16:19]
      io_out_outPipe_bits_exc <= io_out_b_exc; // @[Reg.scala 16:23]
    end
    if (io_out_v) begin // @[Reg.scala 16:19]
      io_out_outPipe_bits_u_exception <= io_out_b_u_exception; // @[Reg.scala 16:23]
    end
    if (io_out_v) begin // @[Reg.scala 16:19]
      io_out_outPipe_bits_u_flag <= io_out_b_u_flag; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      io_out_outPipe_valid_1 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      io_out_outPipe_valid_1 <= io_out_outPipe_valid; // @[Valid.scala 117:22]
    end
    if (io_out_outPipe_valid) begin // @[Reg.scala 16:19]
      io_out_outPipe_bits_1_data <= io_out_outPipe_bits_data; // @[Reg.scala 16:23]
    end
    if (io_out_outPipe_valid) begin // @[Reg.scala 16:19]
      io_out_outPipe_bits_1_exc <= io_out_outPipe_bits_exc; // @[Reg.scala 16:23]
    end
    if (io_out_outPipe_valid) begin // @[Reg.scala 16:19]
      io_out_outPipe_bits_1_u_exception <= io_out_outPipe_bits_u_exception; // @[Reg.scala 16:23]
    end
    if (io_out_outPipe_valid) begin // @[Reg.scala 16:19]
      io_out_outPipe_bits_1_u_flag <= io_out_outPipe_bits_u_flag; // @[Reg.scala 16:23]
    end
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
  inPipe_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  inPipe_bits_ren2 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  inPipe_bits_typeTagOut = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  inPipe_bits_wflags = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  inPipe_bits_rm = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  inPipe_bits_fmt = _RAND_5[1:0];
  _RAND_6 = {3{`RANDOM}};
  inPipe_bits_in1 = _RAND_6[64:0];
  _RAND_7 = {3{`RANDOM}};
  inPipe_bits_in2 = _RAND_7[64:0];
  _RAND_8 = {1{`RANDOM}};
  inPipe_bits_exc_enabled = _RAND_8[6:0];
  _RAND_9 = {1{`RANDOM}};
  io_out_v = _RAND_9[0:0];
  _RAND_10 = {3{`RANDOM}};
  io_out_b_data = _RAND_10[64:0];
  _RAND_11 = {1{`RANDOM}};
  io_out_b_exc = _RAND_11[4:0];
  _RAND_12 = {1{`RANDOM}};
  io_out_b_u_exception = _RAND_12[6:0];
  _RAND_13 = {1{`RANDOM}};
  io_out_b_u_flag = _RAND_13[9:0];
  _RAND_14 = {1{`RANDOM}};
  io_out_outPipe_valid = _RAND_14[0:0];
  _RAND_15 = {3{`RANDOM}};
  io_out_outPipe_bits_data = _RAND_15[64:0];
  _RAND_16 = {1{`RANDOM}};
  io_out_outPipe_bits_exc = _RAND_16[4:0];
  _RAND_17 = {1{`RANDOM}};
  io_out_outPipe_bits_u_exception = _RAND_17[6:0];
  _RAND_18 = {1{`RANDOM}};
  io_out_outPipe_bits_u_flag = _RAND_18[9:0];
  _RAND_19 = {1{`RANDOM}};
  io_out_outPipe_valid_1 = _RAND_19[0:0];
  _RAND_20 = {3{`RANDOM}};
  io_out_outPipe_bits_1_data = _RAND_20[64:0];
  _RAND_21 = {1{`RANDOM}};
  io_out_outPipe_bits_1_exc = _RAND_21[4:0];
  _RAND_22 = {1{`RANDOM}};
  io_out_outPipe_bits_1_u_exception = _RAND_22[6:0];
  _RAND_23 = {1{`RANDOM}};
  io_out_outPipe_bits_1_u_flag = _RAND_23[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
