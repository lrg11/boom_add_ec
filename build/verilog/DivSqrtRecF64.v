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
  output        io_outValid_div,
  output        io_outValid_sqrt,
  output [64:0] io_out,
  output [4:0]  io_exceptionFlags
);
  wire  ds_clock; // @[DivSqrtRecF64.scala 60:20]
  wire  ds_reset; // @[DivSqrtRecF64.scala 60:20]
  wire  ds_io_inReady_div; // @[DivSqrtRecF64.scala 60:20]
  wire  ds_io_inReady_sqrt; // @[DivSqrtRecF64.scala 60:20]
  wire  ds_io_inValid; // @[DivSqrtRecF64.scala 60:20]
  wire  ds_io_sqrtOp; // @[DivSqrtRecF64.scala 60:20]
  wire [64:0] ds_io_a; // @[DivSqrtRecF64.scala 60:20]
  wire [64:0] ds_io_b; // @[DivSqrtRecF64.scala 60:20]
  wire [2:0] ds_io_roundingMode; // @[DivSqrtRecF64.scala 60:20]
  wire  ds_io_detectTininess; // @[DivSqrtRecF64.scala 60:20]
  wire [3:0] ds_io_usingMulAdd; // @[DivSqrtRecF64.scala 60:20]
  wire  ds_io_latchMulAddA_0; // @[DivSqrtRecF64.scala 60:20]
  wire [53:0] ds_io_mulAddA_0; // @[DivSqrtRecF64.scala 60:20]
  wire  ds_io_latchMulAddB_0; // @[DivSqrtRecF64.scala 60:20]
  wire [53:0] ds_io_mulAddB_0; // @[DivSqrtRecF64.scala 60:20]
  wire [104:0] ds_io_mulAddC_2; // @[DivSqrtRecF64.scala 60:20]
  wire [104:0] ds_io_mulAddResult_3; // @[DivSqrtRecF64.scala 60:20]
  wire  ds_io_outValid_div; // @[DivSqrtRecF64.scala 60:20]
  wire  ds_io_outValid_sqrt; // @[DivSqrtRecF64.scala 60:20]
  wire [64:0] ds_io_out; // @[DivSqrtRecF64.scala 60:20]
  wire [4:0] ds_io_exceptionFlags; // @[DivSqrtRecF64.scala 60:20]
  wire  mul_clock; // @[DivSqrtRecF64.scala 75:21]
  wire  mul_reset; // @[DivSqrtRecF64.scala 75:21]
  wire  mul_io_val_s0; // @[DivSqrtRecF64.scala 75:21]
  wire  mul_io_latch_a_s0; // @[DivSqrtRecF64.scala 75:21]
  wire [53:0] mul_io_a_s0; // @[DivSqrtRecF64.scala 75:21]
  wire  mul_io_latch_b_s0; // @[DivSqrtRecF64.scala 75:21]
  wire [53:0] mul_io_b_s0; // @[DivSqrtRecF64.scala 75:21]
  wire [104:0] mul_io_c_s2; // @[DivSqrtRecF64.scala 75:21]
  wire [104:0] mul_io_result_s3; // @[DivSqrtRecF64.scala 75:21]
  DivSqrtRecF64_mulAddZ31 ds ( // @[DivSqrtRecF64.scala 60:20]
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
  Mul54 mul ( // @[DivSqrtRecF64.scala 75:21]
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
  assign io_inReady_div = ds_io_inReady_div; // @[DivSqrtRecF64.scala 62:23]
  assign io_inReady_sqrt = ds_io_inReady_sqrt; // @[DivSqrtRecF64.scala 63:23]
  assign io_outValid_div = ds_io_outValid_div; // @[DivSqrtRecF64.scala 70:23]
  assign io_outValid_sqrt = ds_io_outValid_sqrt; // @[DivSqrtRecF64.scala 71:23]
  assign io_out = ds_io_out; // @[DivSqrtRecF64.scala 72:23]
  assign io_exceptionFlags = ds_io_exceptionFlags; // @[DivSqrtRecF64.scala 73:23]
  assign ds_clock = clock;
  assign ds_reset = reset;
  assign ds_io_inValid = io_inValid; // @[DivSqrtRecF64.scala 64:26]
  assign ds_io_sqrtOp = io_sqrtOp; // @[DivSqrtRecF64.scala 65:26]
  assign ds_io_a = io_a; // @[DivSqrtRecF64.scala 66:26]
  assign ds_io_b = io_b; // @[DivSqrtRecF64.scala 67:26]
  assign ds_io_roundingMode = io_roundingMode; // @[DivSqrtRecF64.scala 68:26]
  assign ds_io_detectTininess = io_detectTininess; // @[DivSqrtRecF64.scala 69:26]
  assign ds_io_mulAddResult_3 = mul_io_result_s3; // @[DivSqrtRecF64.scala 83:26]
  assign mul_clock = clock;
  assign mul_reset = reset;
  assign mul_io_val_s0 = ds_io_usingMulAdd[0]; // @[DivSqrtRecF64.scala 77:43]
  assign mul_io_latch_a_s0 = ds_io_latchMulAddA_0; // @[DivSqrtRecF64.scala 78:23]
  assign mul_io_a_s0 = ds_io_mulAddA_0; // @[DivSqrtRecF64.scala 79:23]
  assign mul_io_latch_b_s0 = ds_io_latchMulAddB_0; // @[DivSqrtRecF64.scala 80:23]
  assign mul_io_b_s0 = ds_io_mulAddB_0; // @[DivSqrtRecF64.scala 81:23]
  assign mul_io_c_s2 = ds_io_mulAddC_2; // @[DivSqrtRecF64.scala 82:23]
endmodule
