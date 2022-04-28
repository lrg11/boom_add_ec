module DivSqrtRecF64(
  input         clock,
  input         reset,
  output        io_inReady_div,
  output        io_inReady_sqrt,
  input         io_inValid,
  input         io_sqrtOp,
  input  [64:0] io_a,
  input  [64:0] io_b,
  input  [2:0]  io_roundingMode,
  input         io_detectTininess,
  input  [3:0]  io_isSNaN,
  input  [6:0]  io_exc_enabled,
  output        io_outValid_div,
  output        io_outValid_sqrt,
  output [64:0] io_out,
  output [4:0]  io_exceptionFlags,
  output [6:0]  io_u_exception,
  output [9:0]  io_u_flag
);
  wire  ds_clock; // @[DivSqrtRecF64.scala 64:20]
  wire  ds_reset; // @[DivSqrtRecF64.scala 64:20]
  wire  ds_io_inReady_div; // @[DivSqrtRecF64.scala 64:20]
  wire  ds_io_inReady_sqrt; // @[DivSqrtRecF64.scala 64:20]
  wire  ds_io_inValid; // @[DivSqrtRecF64.scala 64:20]
  wire  ds_io_sqrtOp; // @[DivSqrtRecF64.scala 64:20]
  wire [64:0] ds_io_a; // @[DivSqrtRecF64.scala 64:20]
  wire [64:0] ds_io_b; // @[DivSqrtRecF64.scala 64:20]
  wire [2:0] ds_io_roundingMode; // @[DivSqrtRecF64.scala 64:20]
  wire  ds_io_detectTininess; // @[DivSqrtRecF64.scala 64:20]
  wire [3:0] ds_io_usingMulAdd; // @[DivSqrtRecF64.scala 64:20]
  wire  ds_io_latchMulAddA_0; // @[DivSqrtRecF64.scala 64:20]
  wire [53:0] ds_io_mulAddA_0; // @[DivSqrtRecF64.scala 64:20]
  wire  ds_io_latchMulAddB_0; // @[DivSqrtRecF64.scala 64:20]
  wire [53:0] ds_io_mulAddB_0; // @[DivSqrtRecF64.scala 64:20]
  wire [104:0] ds_io_mulAddC_2; // @[DivSqrtRecF64.scala 64:20]
  wire [104:0] ds_io_mulAddResult_3; // @[DivSqrtRecF64.scala 64:20]
  wire  ds_io_outValid_div; // @[DivSqrtRecF64.scala 64:20]
  wire  ds_io_outValid_sqrt; // @[DivSqrtRecF64.scala 64:20]
  wire [64:0] ds_io_out; // @[DivSqrtRecF64.scala 64:20]
  wire [4:0] ds_io_exceptionFlags; // @[DivSqrtRecF64.scala 64:20]
  wire  mul_clock; // @[DivSqrtRecF64.scala 111:21]
  wire  mul_reset; // @[DivSqrtRecF64.scala 111:21]
  wire  mul_io_val_s0; // @[DivSqrtRecF64.scala 111:21]
  wire  mul_io_latch_a_s0; // @[DivSqrtRecF64.scala 111:21]
  wire [53:0] mul_io_a_s0; // @[DivSqrtRecF64.scala 111:21]
  wire  mul_io_latch_b_s0; // @[DivSqrtRecF64.scala 111:21]
  wire [53:0] mul_io_b_s0; // @[DivSqrtRecF64.scala 111:21]
  wire [104:0] mul_io_c_s2; // @[DivSqrtRecF64.scala 111:21]
  wire [104:0] mul_io_result_s3; // @[DivSqrtRecF64.scala 111:21]
  wire [11:0] result_type_rawIn_exp = ds_io_out[63:52]; // @[rawFloatFromRecFN.scala 50:21]
  wire  result_type_rawIn_isZero = result_type_rawIn_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  result_type_rawIn_isSpecial = result_type_rawIn_exp[11:10] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  result_type_rawIn__isNaN = result_type_rawIn_isSpecial & result_type_rawIn_exp[9]; // @[rawFloatFromRecFN.scala 55:33]
  wire  result_type_rawIn__isInf = result_type_rawIn_isSpecial & ~result_type_rawIn_exp[9]; // @[rawFloatFromRecFN.scala 56:33]
  wire  result_type_rawIn__sign = ds_io_out[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] result_type_rawIn__sExp = {1'b0,$signed(result_type_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  result_type_rawIn_out_sig_hi_lo = ~result_type_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] result_type_rawIn_out_sig_lo = ds_io_out[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [53:0] result_type_rawIn__sig = {1'h0,result_type_rawIn_out_sig_hi_lo,result_type_rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire  result_type_hi_hi_hi_lo = result_type_rawIn__isNaN & ~result_type_rawIn__sig[51]; // @[common.scala 81:46]
  wire  result_type_isFiniteNonzero = ~result_type_rawIn__isNaN & ~result_type_rawIn__isInf &
    result_type_rawIn_out_sig_hi_lo; // @[classifyRecFN.scala 50:62]
  wire  result_type_isSubnormal = $signed(result_type_rawIn__sExp) < 13'sh402; // @[classifyRecFN.scala 51:39]
  wire  result_type_hi_hi_hi_hi = result_type_rawIn__isNaN & ~result_type_hi_hi_hi_lo; // @[classifyRecFN.scala 54:25]
  wire  _result_type_T_1 = ~result_type_rawIn__sign; // @[classifyRecFN.scala 56:13]
  wire  result_type_hi_hi_lo = ~result_type_rawIn__sign & result_type_rawIn__isInf; // @[classifyRecFN.scala 56:26]
  wire  _result_type_T_3 = _result_type_T_1 & result_type_isFiniteNonzero; // @[classifyRecFN.scala 57:26]
  wire  _result_type_T_4 = ~result_type_isSubnormal; // @[classifyRecFN.scala 57:48]
  wire  result_type_hi_lo_hi = _result_type_T_1 & result_type_isFiniteNonzero & ~result_type_isSubnormal; // @[classifyRecFN.scala 57:45]
  wire  result_type_hi_lo_lo = _result_type_T_3 & result_type_isSubnormal; // @[classifyRecFN.scala 58:45]
  wire  result_type_lo_hi_hi_hi = _result_type_T_1 & result_type_rawIn_isZero; // @[classifyRecFN.scala 59:26]
  wire  result_type_lo_hi_hi_lo = result_type_rawIn__sign & result_type_rawIn_isZero; // @[classifyRecFN.scala 60:26]
  wire  _result_type_T_8 = result_type_rawIn__sign & result_type_isFiniteNonzero; // @[classifyRecFN.scala 61:26]
  wire  result_type_lo_hi_lo = result_type_rawIn__sign & result_type_isFiniteNonzero & result_type_isSubnormal; // @[classifyRecFN.scala 61:45]
  wire  result_type_lo_lo_hi = _result_type_T_8 & _result_type_T_4; // @[classifyRecFN.scala 62:45]
  wire  result_type_lo_lo_lo = result_type_rawIn__sign & result_type_rawIn__isInf; // @[classifyRecFN.scala 63:26]
  wire [9:0] result_type = {result_type_hi_hi_hi_hi,result_type_hi_hi_hi_lo,result_type_hi_hi_lo,result_type_hi_lo_hi,
    result_type_hi_lo_lo,result_type_lo_hi_hi_hi,result_type_lo_hi_hi_lo,result_type_lo_hi_lo,result_type_lo_lo_hi,
    result_type_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  isRZero = result_type[3] | result_type[4]; // @[DivSqrtRecF64.scala 83:34]
  wire  isRInf = result_type[0] | result_type[7]; // @[DivSqrtRecF64.scala 84:33]
  wire  isInvalidOp = io_isSNaN[0] | io_isSNaN[1]; // @[DivSqrtRecF64.scala 85:35]
  wire  isASubnormal = io_isSNaN[2]; // @[DivSqrtRecF64.scala 86:33]
  wire  isBSubnormal = io_isSNaN[3]; // @[DivSqrtRecF64.scala 87:33]
  wire  isFOverflow = ds_io_exceptionFlags[2]; // @[DivSqrtRecF64.scala 88:43]
  wire  isFUnderflow = ds_io_exceptionFlags[3]; // @[DivSqrtRecF64.scala 89:44]
  wire  isDiv0 = ds_io_exceptionFlags[1]; // @[DivSqrtRecF64.scala 90:38]
  wire  isInexact = ds_io_exceptionFlags[4] & ~isInvalidOp; // @[DivSqrtRecF64.scala 92:45]
  wire  isSubnormal = isASubnormal | isBSubnormal; // @[DivSqrtRecF64.scala 94:36]
  wire [4:0] io_u_flag_lo = {isFOverflow,isFUnderflow,isInvalidOp,isRInf,isRZero}; // @[Cat.scala 30:58]
  wire [4:0] io_u_flag_hi = {isDiv0,1'h0,isSubnormal,1'h0,isInexact}; // @[Cat.scala 30:58]
  wire [6:0] _io_u_exception_T = {isInvalidOp,isDiv0,isFOverflow,isFUnderflow,isInexact,1'h0,isSubnormal}; // @[Cat.scala 30:58]
  DivSqrtRecF64_mulAddZ31 ds ( // @[DivSqrtRecF64.scala 64:20]
    .clock(ds_clock),
    .reset(ds_reset),
    .io_inReady_div(ds_io_inReady_div),
    .io_inReady_sqrt(ds_io_inReady_sqrt),
    .io_inValid(ds_io_inValid),
    .io_sqrtOp(ds_io_sqrtOp),
    .io_a(ds_io_a),
    .io_b(ds_io_b),
    .io_roundingMode(ds_io_roundingMode),
    .io_detectTininess(ds_io_detectTininess),
    .io_usingMulAdd(ds_io_usingMulAdd),
    .io_latchMulAddA_0(ds_io_latchMulAddA_0),
    .io_mulAddA_0(ds_io_mulAddA_0),
    .io_latchMulAddB_0(ds_io_latchMulAddB_0),
    .io_mulAddB_0(ds_io_mulAddB_0),
    .io_mulAddC_2(ds_io_mulAddC_2),
    .io_mulAddResult_3(ds_io_mulAddResult_3),
    .io_outValid_div(ds_io_outValid_div),
    .io_outValid_sqrt(ds_io_outValid_sqrt),
    .io_out(ds_io_out),
    .io_exceptionFlags(ds_io_exceptionFlags)
  );
  Mul54 mul ( // @[DivSqrtRecF64.scala 111:21]
    .clock(mul_clock),
    .reset(mul_reset),
    .io_val_s0(mul_io_val_s0),
    .io_latch_a_s0(mul_io_latch_a_s0),
    .io_a_s0(mul_io_a_s0),
    .io_latch_b_s0(mul_io_latch_b_s0),
    .io_b_s0(mul_io_b_s0),
    .io_c_s2(mul_io_c_s2),
    .io_result_s3(mul_io_result_s3)
  );
  assign io_inReady_div = ds_io_inReady_div; // @[DivSqrtRecF64.scala 66:23]
  assign io_inReady_sqrt = ds_io_inReady_sqrt; // @[DivSqrtRecF64.scala 67:23]
  assign io_outValid_div = ds_io_outValid_div; // @[DivSqrtRecF64.scala 74:23]
  assign io_outValid_sqrt = ds_io_outValid_sqrt; // @[DivSqrtRecF64.scala 75:23]
  assign io_out = ds_io_out; // @[DivSqrtRecF64.scala 76:23]
  assign io_exceptionFlags = ds_io_exceptionFlags; // @[DivSqrtRecF64.scala 77:23]
  assign io_u_exception = _io_u_exception_T & io_exc_enabled; // @[DivSqrtRecF64.scala 96:104]
  assign io_u_flag = {io_u_flag_hi,io_u_flag_lo}; // @[Cat.scala 30:58]
  assign ds_clock = clock;
  assign ds_reset = reset;
  assign ds_io_inValid = io_inValid; // @[DivSqrtRecF64.scala 68:26]
  assign ds_io_sqrtOp = io_sqrtOp; // @[DivSqrtRecF64.scala 69:26]
  assign ds_io_a = io_a; // @[DivSqrtRecF64.scala 70:26]
  assign ds_io_b = io_b; // @[DivSqrtRecF64.scala 71:26]
  assign ds_io_roundingMode = io_roundingMode; // @[DivSqrtRecF64.scala 72:26]
  assign ds_io_detectTininess = io_detectTininess; // @[DivSqrtRecF64.scala 73:26]
  assign ds_io_mulAddResult_3 = mul_io_result_s3; // @[DivSqrtRecF64.scala 119:26]
  assign mul_clock = clock;
  assign mul_reset = reset;
  assign mul_io_val_s0 = ds_io_usingMulAdd[0]; // @[DivSqrtRecF64.scala 113:43]
  assign mul_io_latch_a_s0 = ds_io_latchMulAddA_0; // @[DivSqrtRecF64.scala 114:23]
  assign mul_io_a_s0 = ds_io_mulAddA_0; // @[DivSqrtRecF64.scala 115:23]
  assign mul_io_latch_b_s0 = ds_io_latchMulAddB_0; // @[DivSqrtRecF64.scala 116:23]
  assign mul_io_b_s0 = ds_io_mulAddB_0; // @[DivSqrtRecF64.scala 117:23]
  assign mul_io_c_s2 = ds_io_mulAddC_2; // @[DivSqrtRecF64.scala 118:23]
endmodule
