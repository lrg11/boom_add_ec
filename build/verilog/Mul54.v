module Mul54(
  input          clock,
  input          reset,
  input          io_val_s0,
  input          io_latch_a_s0,
  input  [53:0]  io_a_s0,
  input          io_latch_b_s0,
  input  [53:0]  io_b_s0,
  input  [104:0] io_c_s2,
  output [104:0] io_result_s3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [127:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg  val_s1; // @[DivSqrtRecF64.scala 134:21]
  reg  val_s2; // @[DivSqrtRecF64.scala 135:21]
  reg [53:0] reg_a_s1; // @[DivSqrtRecF64.scala 136:23]
  reg [53:0] reg_b_s1; // @[DivSqrtRecF64.scala 137:23]
  reg [53:0] reg_a_s2; // @[DivSqrtRecF64.scala 138:23]
  reg [53:0] reg_b_s2; // @[DivSqrtRecF64.scala 139:23]
  reg [104:0] reg_result_s3; // @[DivSqrtRecF64.scala 140:28]
  wire [107:0] _reg_result_s3_T = reg_a_s2 * reg_b_s2; // @[DivSqrtRecF64.scala 160:36]
  wire [104:0] _reg_result_s3_T_3 = _reg_result_s3_T[104:0] + io_c_s2; // @[DivSqrtRecF64.scala 160:55]
  assign io_result_s3 = reg_result_s3; // @[DivSqrtRecF64.scala 163:18]
  always @(posedge clock) begin
    val_s1 <= io_val_s0; // @[DivSqrtRecF64.scala 142:12]
    val_s2 <= val_s1; // @[DivSqrtRecF64.scala 143:12]
    if (io_val_s0) begin // @[DivSqrtRecF64.scala 145:22]
      if (io_latch_a_s0) begin // @[DivSqrtRecF64.scala 146:30]
        reg_a_s1 <= io_a_s0; // @[DivSqrtRecF64.scala 147:22]
      end
    end
    if (io_val_s0) begin // @[DivSqrtRecF64.scala 145:22]
      if (io_latch_b_s0) begin // @[DivSqrtRecF64.scala 149:30]
        reg_b_s1 <= io_b_s0; // @[DivSqrtRecF64.scala 150:22]
      end
    end
    if (val_s1) begin // @[DivSqrtRecF64.scala 154:19]
      reg_a_s2 <= reg_a_s1; // @[DivSqrtRecF64.scala 155:18]
    end
    if (val_s1) begin // @[DivSqrtRecF64.scala 154:19]
      reg_b_s2 <= reg_b_s1; // @[DivSqrtRecF64.scala 156:18]
    end
    if (val_s2) begin // @[DivSqrtRecF64.scala 159:19]
      reg_result_s3 <= _reg_result_s3_T_3; // @[DivSqrtRecF64.scala 160:23]
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
  val_s1 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  val_s2 = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  reg_a_s1 = _RAND_2[53:0];
  _RAND_3 = {2{`RANDOM}};
  reg_b_s1 = _RAND_3[53:0];
  _RAND_4 = {2{`RANDOM}};
  reg_a_s2 = _RAND_4[53:0];
  _RAND_5 = {2{`RANDOM}};
  reg_b_s2 = _RAND_5[53:0];
  _RAND_6 = {4{`RANDOM}};
  reg_result_s3 = _RAND_6[104:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
