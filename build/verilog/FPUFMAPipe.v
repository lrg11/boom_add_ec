module FPUFMAPipe(
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
  output        io_out_bits_u_c
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [95:0] _RAND_4;
  reg [95:0] _RAND_5;
  reg [95:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [95:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  wire  fma_clock; // @[FPU.scala 872:19]
  wire  fma_reset; // @[FPU.scala 872:19]
  wire  fma_io_validin; // @[FPU.scala 872:19]
  wire [1:0] fma_io_op; // @[FPU.scala 872:19]
  wire [64:0] fma_io_a; // @[FPU.scala 872:19]
  wire [64:0] fma_io_b; // @[FPU.scala 872:19]
  wire [64:0] fma_io_c; // @[FPU.scala 872:19]
  wire [2:0] fma_io_roundingMode; // @[FPU.scala 872:19]
  wire  fma_io_detectTininess; // @[FPU.scala 872:19]
  wire [64:0] fma_io_out; // @[FPU.scala 872:19]
  wire [4:0] fma_io_exceptionFlags; // @[FPU.scala 872:19]
  wire  fma_io_validout; // @[FPU.scala 872:19]
  reg  valid; // @[FPU.scala 860:18]
  reg  in_swap23; // @[FPU.scala 861:15]
  reg [2:0] in_rm; // @[FPU.scala 861:15]
  reg [1:0] in_fmaCmd; // @[FPU.scala 861:15]
  reg [64:0] in_in1; // @[FPU.scala 861:15]
  reg [64:0] in_in2; // @[FPU.scala 861:15]
  reg [64:0] in_in3; // @[FPU.scala 861:15]
  reg [6:0] in_exc_enabled; // @[FPU.scala 861:15]
  wire [64:0] _zero_T = io_in_bits_in1 ^ io_in_bits_in2; // @[FPU.scala 864:32]
  wire [64:0] zero = _zero_T & 65'h10000000000000000; // @[FPU.scala 864:50]
  wire [64:0] res_data_maskedNaN = fma_io_out & 65'h1efefffffffffffff; // @[FPU.scala 420:25]
  wire  _res_data_T_1 = &fma_io_out[63:61]; // @[FPU.scala 255:56]
  wire [64:0] res_data = _res_data_T_1 ? res_data_maskedNaN : fma_io_out; // @[FPU.scala 421:10]
  wire  u_type_sign = res_data[64]; // @[FPU.scala 259:17]
  wire [2:0] u_type_code = res_data[63:61]; // @[FPU.scala 260:17]
  wire [1:0] u_type_codeHi = u_type_code[2:1]; // @[FPU.scala 261:22]
  wire  u_type_isSpecial = u_type_codeHi == 2'h3; // @[FPU.scala 262:28]
  wire  u_type_isHighSubnormalIn = res_data[61:52] < 10'h2; // @[FPU.scala 264:55]
  wire  _u_type_isSubnormal_T_1 = u_type_codeHi == 2'h1; // @[FPU.scala 265:50]
  wire  u_type_isSubnormal = u_type_code == 3'h1 | u_type_codeHi == 2'h1 & u_type_isHighSubnormalIn; // @[FPU.scala 265:40]
  wire  u_type_isNormal = _u_type_isSubnormal_T_1 & ~u_type_isHighSubnormalIn | u_type_codeHi == 2'h2; // @[FPU.scala 266:61]
  wire  u_type_isZero = u_type_code == 3'h0; // @[FPU.scala 267:23]
  wire  u_type_isInf = u_type_isSpecial & ~u_type_code[0]; // @[FPU.scala 268:27]
  wire  u_type_isNaN = &u_type_code; // @[FPU.scala 269:22]
  wire  u_type_hi_hi_hi_lo = u_type_isNaN & ~res_data[51]; // @[FPU.scala 270:24]
  wire  u_type_hi_hi_hi_hi = u_type_isNaN & res_data[51]; // @[FPU.scala 271:24]
  wire  _u_type_T = ~u_type_sign; // @[FPU.scala 273:34]
  wire  u_type_hi_hi_lo = u_type_isInf & ~u_type_sign; // @[FPU.scala 273:31]
  wire  u_type_hi_lo_hi = u_type_isNormal & ~u_type_sign; // @[FPU.scala 273:50]
  wire  u_type_hi_lo_lo = u_type_isSubnormal & _u_type_T; // @[FPU.scala 274:21]
  wire  u_type_lo_hi_hi_hi = u_type_isZero & _u_type_T; // @[FPU.scala 274:38]
  wire  u_type_lo_hi_hi_lo = u_type_isZero & u_type_sign; // @[FPU.scala 274:55]
  wire  u_type_lo_hi_lo = u_type_isSubnormal & u_type_sign; // @[FPU.scala 275:21]
  wire  u_type_lo_lo_hi = u_type_isNormal & u_type_sign; // @[FPU.scala 275:39]
  wire  u_type_lo_lo_lo = u_type_isInf & u_type_sign; // @[FPU.scala 275:54]
  wire [9:0] u_type = {u_type_hi_hi_hi_hi,u_type_hi_hi_hi_lo,u_type_hi_hi_lo,u_type_hi_lo_hi,u_type_hi_lo_lo,
    u_type_lo_hi_hi_hi,u_type_lo_hi_hi_lo,u_type_lo_hi_lo,u_type_lo_lo_hi,u_type_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  u_type1_sign = in_in1[64]; // @[FPU.scala 259:17]
  wire [2:0] u_type1_code = in_in1[63:61]; // @[FPU.scala 260:17]
  wire [1:0] u_type1_codeHi = u_type1_code[2:1]; // @[FPU.scala 261:22]
  wire  u_type1_isSpecial = u_type1_codeHi == 2'h3; // @[FPU.scala 262:28]
  wire  u_type1_isHighSubnormalIn = in_in1[61:52] < 10'h2; // @[FPU.scala 264:55]
  wire  _u_type1_isSubnormal_T_1 = u_type1_codeHi == 2'h1; // @[FPU.scala 265:50]
  wire  u_type1_isSubnormal = u_type1_code == 3'h1 | u_type1_codeHi == 2'h1 & u_type1_isHighSubnormalIn; // @[FPU.scala 265:40]
  wire  u_type1_isNormal = _u_type1_isSubnormal_T_1 & ~u_type1_isHighSubnormalIn | u_type1_codeHi == 2'h2; // @[FPU.scala 266:61]
  wire  u_type1_isZero = u_type1_code == 3'h0; // @[FPU.scala 267:23]
  wire  u_type1_isInf = u_type1_isSpecial & ~u_type1_code[0]; // @[FPU.scala 268:27]
  wire  u_type1_isNaN = &u_type1_code; // @[FPU.scala 269:22]
  wire  u_type1_hi_hi_hi_lo = u_type1_isNaN & ~in_in1[51]; // @[FPU.scala 270:24]
  wire  u_type1_hi_hi_hi_hi = u_type1_isNaN & in_in1[51]; // @[FPU.scala 271:24]
  wire  _u_type1_T = ~u_type1_sign; // @[FPU.scala 273:34]
  wire  u_type1_hi_hi_lo = u_type1_isInf & ~u_type1_sign; // @[FPU.scala 273:31]
  wire  u_type1_hi_lo_hi = u_type1_isNormal & ~u_type1_sign; // @[FPU.scala 273:50]
  wire  u_type1_hi_lo_lo = u_type1_isSubnormal & _u_type1_T; // @[FPU.scala 274:21]
  wire  u_type1_lo_hi_hi_hi = u_type1_isZero & _u_type1_T; // @[FPU.scala 274:38]
  wire  u_type1_lo_hi_hi_lo = u_type1_isZero & u_type1_sign; // @[FPU.scala 274:55]
  wire  u_type1_lo_hi_lo = u_type1_isSubnormal & u_type1_sign; // @[FPU.scala 275:21]
  wire  u_type1_lo_lo_hi = u_type1_isNormal & u_type1_sign; // @[FPU.scala 275:39]
  wire  u_type1_lo_lo_lo = u_type1_isInf & u_type1_sign; // @[FPU.scala 275:54]
  wire [9:0] u_type1 = {u_type1_hi_hi_hi_hi,u_type1_hi_hi_hi_lo,u_type1_hi_hi_lo,u_type1_hi_lo_hi,u_type1_hi_lo_lo,
    u_type1_lo_hi_hi_hi,u_type1_lo_hi_hi_lo,u_type1_lo_hi_lo,u_type1_lo_lo_hi,u_type1_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  u_type2_sign = in_in2[64]; // @[FPU.scala 259:17]
  wire [2:0] u_type2_code = in_in2[63:61]; // @[FPU.scala 260:17]
  wire [1:0] u_type2_codeHi = u_type2_code[2:1]; // @[FPU.scala 261:22]
  wire  u_type2_isSpecial = u_type2_codeHi == 2'h3; // @[FPU.scala 262:28]
  wire  u_type2_isHighSubnormalIn = in_in2[61:52] < 10'h2; // @[FPU.scala 264:55]
  wire  _u_type2_isSubnormal_T_1 = u_type2_codeHi == 2'h1; // @[FPU.scala 265:50]
  wire  u_type2_isSubnormal = u_type2_code == 3'h1 | u_type2_codeHi == 2'h1 & u_type2_isHighSubnormalIn; // @[FPU.scala 265:40]
  wire  u_type2_isNormal = _u_type2_isSubnormal_T_1 & ~u_type2_isHighSubnormalIn | u_type2_codeHi == 2'h2; // @[FPU.scala 266:61]
  wire  u_type2_isZero = u_type2_code == 3'h0; // @[FPU.scala 267:23]
  wire  u_type2_isInf = u_type2_isSpecial & ~u_type2_code[0]; // @[FPU.scala 268:27]
  wire  u_type2_isNaN = &u_type2_code; // @[FPU.scala 269:22]
  wire  u_type2_hi_hi_hi_lo = u_type2_isNaN & ~in_in2[51]; // @[FPU.scala 270:24]
  wire  u_type2_hi_hi_hi_hi = u_type2_isNaN & in_in2[51]; // @[FPU.scala 271:24]
  wire  _u_type2_T = ~u_type2_sign; // @[FPU.scala 273:34]
  wire  u_type2_hi_hi_lo = u_type2_isInf & ~u_type2_sign; // @[FPU.scala 273:31]
  wire  u_type2_hi_lo_hi = u_type2_isNormal & ~u_type2_sign; // @[FPU.scala 273:50]
  wire  u_type2_hi_lo_lo = u_type2_isSubnormal & _u_type2_T; // @[FPU.scala 274:21]
  wire  u_type2_lo_hi_hi_hi = u_type2_isZero & _u_type2_T; // @[FPU.scala 274:38]
  wire  u_type2_lo_hi_hi_lo = u_type2_isZero & u_type2_sign; // @[FPU.scala 274:55]
  wire  u_type2_lo_hi_lo = u_type2_isSubnormal & u_type2_sign; // @[FPU.scala 275:21]
  wire  u_type2_lo_lo_hi = u_type2_isNormal & u_type2_sign; // @[FPU.scala 275:39]
  wire  u_type2_lo_lo_lo = u_type2_isInf & u_type2_sign; // @[FPU.scala 275:54]
  wire [9:0] u_type2 = {u_type2_hi_hi_hi_hi,u_type2_hi_hi_hi_lo,u_type2_hi_hi_lo,u_type2_hi_lo_hi,u_type2_hi_lo_lo,
    u_type2_lo_hi_hi_hi,u_type2_lo_hi_hi_lo,u_type2_lo_hi_lo,u_type2_lo_lo_hi,u_type2_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  u_type3_sign = in_in3[64]; // @[FPU.scala 259:17]
  wire [2:0] u_type3_code = in_in3[63:61]; // @[FPU.scala 260:17]
  wire [1:0] u_type3_codeHi = u_type3_code[2:1]; // @[FPU.scala 261:22]
  wire  u_type3_isSpecial = u_type3_codeHi == 2'h3; // @[FPU.scala 262:28]
  wire  u_type3_isHighSubnormalIn = in_in3[61:52] < 10'h2; // @[FPU.scala 264:55]
  wire  _u_type3_isSubnormal_T_1 = u_type3_codeHi == 2'h1; // @[FPU.scala 265:50]
  wire  u_type3_isSubnormal = u_type3_code == 3'h1 | u_type3_codeHi == 2'h1 & u_type3_isHighSubnormalIn; // @[FPU.scala 265:40]
  wire  u_type3_isNormal = _u_type3_isSubnormal_T_1 & ~u_type3_isHighSubnormalIn | u_type3_codeHi == 2'h2; // @[FPU.scala 266:61]
  wire  u_type3_isZero = u_type3_code == 3'h0; // @[FPU.scala 267:23]
  wire  u_type3_isInf = u_type3_isSpecial & ~u_type3_code[0]; // @[FPU.scala 268:27]
  wire  u_type3_isNaN = &u_type3_code; // @[FPU.scala 269:22]
  wire  u_type3_hi_hi_hi_lo = u_type3_isNaN & ~in_in3[51]; // @[FPU.scala 270:24]
  wire  u_type3_hi_hi_hi_hi = u_type3_isNaN & in_in3[51]; // @[FPU.scala 271:24]
  wire  _u_type3_T = ~u_type3_sign; // @[FPU.scala 273:34]
  wire  u_type3_hi_hi_lo = u_type3_isInf & ~u_type3_sign; // @[FPU.scala 273:31]
  wire  u_type3_hi_lo_hi = u_type3_isNormal & ~u_type3_sign; // @[FPU.scala 273:50]
  wire  u_type3_hi_lo_lo = u_type3_isSubnormal & _u_type3_T; // @[FPU.scala 274:21]
  wire  u_type3_lo_hi_hi_hi = u_type3_isZero & _u_type3_T; // @[FPU.scala 274:38]
  wire  u_type3_lo_hi_hi_lo = u_type3_isZero & u_type3_sign; // @[FPU.scala 274:55]
  wire  u_type3_lo_hi_lo = u_type3_isSubnormal & u_type3_sign; // @[FPU.scala 275:21]
  wire  u_type3_lo_lo_hi = u_type3_isNormal & u_type3_sign; // @[FPU.scala 275:39]
  wire  u_type3_lo_lo_lo = u_type3_isInf & u_type3_sign; // @[FPU.scala 275:54]
  wire [9:0] u_type3 = {u_type3_hi_hi_hi_hi,u_type3_hi_hi_hi_lo,u_type3_hi_hi_lo,u_type3_hi_lo_hi,u_type3_hi_lo_lo,
    u_type3_lo_hi_hi_hi,u_type3_lo_hi_hi_lo,u_type3_lo_hi_lo,u_type3_lo_lo_hi,u_type3_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  hasSNaN = u_type1_hi_hi_hi_lo | u_type2_hi_hi_hi_lo | u_type3_hi_hi_hi_lo; // @[FPU.scala 892:52]
  wire  res_u_flag_lo_lo_lo = u_type[3] | u_type[4]; // @[FPU.scala 894:28]
  wire  res_u_flag_lo_lo_hi = u_type[0] | u_type[7]; // @[FPU.scala 895:28]
  wire  isInf1 = u_type1[0] | u_type1[7]; // @[FPU.scala 897:29]
  wire  isInf2 = u_type2[0] | u_type2[7]; // @[FPU.scala 898:29]
  wire  res_u_flag_lo_hi_hi_lo = fma_io_exceptionFlags[1]; // @[FPU.scala 903:42]
  wire  res_u_flag_lo_hi_hi_hi = fma_io_exceptionFlags[2]; // @[FPU.scala 904:43]
  wire  res_u_flag_hi_hi_lo = u_type1[2] | u_type1[5] | u_type2[2] | u_type2[5] | u_type3[2] | u_type3[5]; // @[FPU.scala 908:84]
  wire  res_u_flag_hi_lo_lo = fma_io_exceptionFlags[0] & ~res_u_flag_hi_hi_lo & ~hasSNaN; // @[FPU.scala 909:60]
  wire  PInf_NInf = u_type1[0] & u_type3[7]; // @[FPU.scala 917:35]
  wire  NInf_PInf = u_type1[7] & u_type3[0]; // @[FPU.scala 918:35]
  wire  res_u_flag_lo_hi_lo = hasSNaN | PInf_NInf | NInf_PInf; // @[FPU.scala 919:50]
  wire [6:0] _res_u_exception_T = {res_u_flag_lo_hi_lo,1'h0,res_u_flag_lo_hi_hi_hi,res_u_flag_lo_hi_hi_lo,
    res_u_flag_hi_lo_lo,1'h0,res_u_flag_hi_hi_lo}; // @[Cat.scala 30:58]
  wire [6:0] _res_u_exception_T_1 = _res_u_exception_T & in_exc_enabled; // @[FPU.scala 920:114]
  wire [9:0] _res_u_flag_T = {2'h0,res_u_flag_hi_hi_lo,1'h0,res_u_flag_hi_lo_lo,res_u_flag_lo_hi_hi_hi,
    res_u_flag_lo_hi_hi_lo,res_u_flag_lo_hi_lo,res_u_flag_lo_lo_hi,res_u_flag_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  isZero1 = u_type1[3] | u_type1[4]; // @[FPU.scala 925:34]
  wire  isZero2 = u_type2[3] | u_type2[4]; // @[FPU.scala 926:34]
  wire  zero_inf = isZero1 & isInf2; // @[FPU.scala 927:32]
  wire  inf_zero = isInf1 & isZero2; // @[FPU.scala 928:31]
  wire  res_u_flag_lo_hi_lo_1 = hasSNaN | zero_inf | inf_zero; // @[FPU.scala 929:49]
  wire [6:0] _res_u_exception_T_2 = {res_u_flag_lo_hi_lo_1,1'h0,res_u_flag_lo_hi_hi_hi,res_u_flag_lo_hi_hi_lo,
    res_u_flag_hi_lo_lo,1'h0,res_u_flag_hi_hi_lo}; // @[Cat.scala 30:58]
  wire [6:0] _res_u_exception_T_3 = _res_u_exception_T_2 & in_exc_enabled; // @[FPU.scala 930:114]
  wire [9:0] _res_u_flag_T_1 = {2'h0,res_u_flag_hi_hi_lo,1'h0,res_u_flag_hi_lo_lo,res_u_flag_lo_hi_hi_hi,
    res_u_flag_lo_hi_hi_lo,res_u_flag_lo_hi_lo_1,res_u_flag_lo_lo_hi,res_u_flag_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  res_u_flag_lo_hi_lo_2 = hasSNaN | u_type1[0] & u_type3[0]; // @[FPU.scala 935:38]
  wire [6:0] _res_u_exception_T_4 = {res_u_flag_lo_hi_lo_2,1'h0,res_u_flag_lo_hi_hi_hi,res_u_flag_lo_hi_hi_lo,
    res_u_flag_hi_lo_lo,1'h0,res_u_flag_hi_hi_lo}; // @[Cat.scala 30:58]
  wire [6:0] _res_u_exception_T_5 = _res_u_exception_T_4 & in_exc_enabled; // @[FPU.scala 936:114]
  wire [9:0] _res_u_flag_T_2 = {2'h0,res_u_flag_hi_hi_lo,1'h0,res_u_flag_hi_lo_lo,res_u_flag_lo_hi_hi_hi,
    res_u_flag_lo_hi_hi_lo,res_u_flag_lo_hi_lo_2,res_u_flag_lo_lo_hi,res_u_flag_lo_lo_lo}; // @[Cat.scala 30:58]
  reg  io_out_v; // @[Valid.scala 117:22]
  reg [64:0] io_out_b_data; // @[Reg.scala 15:16]
  reg [4:0] io_out_b_exc; // @[Reg.scala 15:16]
  reg [6:0] io_out_b_u_exception; // @[Reg.scala 15:16]
  reg [9:0] io_out_b_u_flag; // @[Reg.scala 15:16]
  wire [4:0] res_exc = fma_io_exceptionFlags; // @[FPU.scala 881:17 FPU.scala 883:11]
  MulAddRecFNPipe fma ( // @[FPU.scala 872:19]
    .clock(fma_clock),
    .reset(fma_reset),
    .io_validin(fma_io_validin),
    .io_op(fma_io_op),
    .io_a(fma_io_a),
    .io_b(fma_io_b),
    .io_c(fma_io_c),
    .io_roundingMode(fma_io_roundingMode),
    .io_detectTininess(fma_io_detectTininess),
    .io_out(fma_io_out),
    .io_exceptionFlags(fma_io_exceptionFlags),
    .io_validout(fma_io_validout)
  );
  assign io_out_valid = io_out_v; // @[Valid.scala 112:21 Valid.scala 113:17]
  assign io_out_bits_data = io_out_b_data; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_out_bits_exc = io_out_b_exc; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_out_bits_u_exception = io_out_b_u_exception; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_out_bits_u_flag = io_out_b_u_flag; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_out_bits_u_c = 1'h0; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign fma_clock = clock;
  assign fma_reset = reset;
  assign fma_io_validin = valid; // @[FPU.scala 873:18]
  assign fma_io_op = in_fmaCmd; // @[FPU.scala 874:13]
  assign fma_io_a = in_in1; // @[FPU.scala 877:12]
  assign fma_io_b = in_in2; // @[FPU.scala 878:12]
  assign fma_io_c = in_in3; // @[FPU.scala 879:12]
  assign fma_io_roundingMode = in_rm; // @[FPU.scala 875:23]
  assign fma_io_detectTininess = 1'h1; // @[FPU.scala 876:25]
  always @(posedge clock) begin
    valid <= io_in_valid; // @[FPU.scala 860:18]
    if (io_in_valid) begin // @[FPU.scala 862:22]
      in_swap23 <= io_in_bits_swap23; // @[FPU.scala 867:8]
    end
    if (io_in_valid) begin // @[FPU.scala 862:22]
      in_rm <= io_in_bits_rm; // @[FPU.scala 867:8]
    end
    if (io_in_valid) begin // @[FPU.scala 862:22]
      in_fmaCmd <= io_in_bits_fmaCmd; // @[FPU.scala 867:8]
    end
    if (io_in_valid) begin // @[FPU.scala 862:22]
      in_in1 <= io_in_bits_in1; // @[FPU.scala 867:8]
    end
    if (io_in_valid) begin // @[FPU.scala 862:22]
      if (io_in_bits_swap23) begin // @[FPU.scala 868:23]
        in_in2 <= 65'h8000000000000000; // @[FPU.scala 868:32]
      end else begin
        in_in2 <= io_in_bits_in2; // @[FPU.scala 867:8]
      end
    end
    if (io_in_valid) begin // @[FPU.scala 862:22]
      if (~(io_in_bits_ren3 | io_in_bits_swap23)) begin // @[FPU.scala 869:37]
        in_in3 <= zero; // @[FPU.scala 869:46]
      end else begin
        in_in3 <= io_in_bits_in3; // @[FPU.scala 867:8]
      end
    end
    if (io_in_valid) begin // @[FPU.scala 862:22]
      in_exc_enabled <= io_in_bits_exc_enabled; // @[FPU.scala 867:8]
    end
    if (reset) begin // @[Valid.scala 117:22]
      io_out_v <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      io_out_v <= fma_io_validout; // @[Valid.scala 117:22]
    end
    if (fma_io_validout) begin // @[Reg.scala 16:19]
      if (_res_data_T_1) begin // @[FPU.scala 421:10]
        io_out_b_data <= res_data_maskedNaN;
      end else begin
        io_out_b_data <= fma_io_out;
      end
    end
    if (fma_io_validout) begin // @[Reg.scala 16:19]
      io_out_b_exc <= res_exc; // @[Reg.scala 16:23]
    end
    if (fma_io_validout) begin // @[Reg.scala 16:19]
      if (in_fmaCmd == 2'h0) begin // @[FPU.scala 915:26]
        if (in_swap23) begin // @[FPU.scala 916:28]
          io_out_b_u_exception <= _res_u_exception_T_1; // @[FPU.scala 920:25]
        end else begin
          io_out_b_u_exception <= _res_u_exception_T_3;
        end
      end else begin
        io_out_b_u_exception <= _res_u_exception_T_5;
      end
    end
    if (fma_io_validout) begin // @[Reg.scala 16:19]
      if (in_fmaCmd == 2'h0) begin // @[FPU.scala 915:26]
        if (in_swap23) begin // @[FPU.scala 916:28]
          io_out_b_u_flag <= _res_u_flag_T; // @[FPU.scala 921:20]
        end else begin
          io_out_b_u_flag <= _res_u_flag_T_1;
        end
      end else begin
        io_out_b_u_flag <= _res_u_flag_T_2;
      end
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
  valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  in_swap23 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  in_rm = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  in_fmaCmd = _RAND_3[1:0];
  _RAND_4 = {3{`RANDOM}};
  in_in1 = _RAND_4[64:0];
  _RAND_5 = {3{`RANDOM}};
  in_in2 = _RAND_5[64:0];
  _RAND_6 = {3{`RANDOM}};
  in_in3 = _RAND_6[64:0];
  _RAND_7 = {1{`RANDOM}};
  in_exc_enabled = _RAND_7[6:0];
  _RAND_8 = {1{`RANDOM}};
  io_out_v = _RAND_8[0:0];
  _RAND_9 = {3{`RANDOM}};
  io_out_b_data = _RAND_9[64:0];
  _RAND_10 = {1{`RANDOM}};
  io_out_b_exc = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  io_out_b_u_exception = _RAND_11[6:0];
  _RAND_12 = {1{`RANDOM}};
  io_out_b_u_flag = _RAND_12[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
