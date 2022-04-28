module MaxPeriodFibonacciLFSR_1(
  input   clock,
  input   reset,
  input   io_seed_valid,
  input   io_seed_bits_0,
  input   io_seed_bits_1,
  input   io_increment,
  output  io_out_0,
  output  io_out_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  state_0; // @[PRNG.scala 47:50]
  reg  state_1; // @[PRNG.scala 47:50]
  wire  _T = state_1 ^ state_0; // @[LFSR.scala 15:41]
  wire  _GEN_0 = io_increment ? _T : state_0; // @[PRNG.scala 61:23 PRNG.scala 62:11 PRNG.scala 47:50]
  wire  _GEN_2 = io_seed_valid ? io_seed_bits_0 : _GEN_0; // @[PRNG.scala 65:25 PRNG.scala 66:11]
  assign io_out_0 = state_0; // @[PRNG.scala 69:10]
  assign io_out_1 = state_1; // @[PRNG.scala 69:10]
  always @(posedge clock) begin
    state_0 <= reset | _GEN_2; // @[PRNG.scala 47:50 PRNG.scala 47:50]
    if (reset) begin // @[PRNG.scala 47:50]
      state_1 <= 1'h0; // @[PRNG.scala 47:50]
    end else if (io_seed_valid) begin // @[PRNG.scala 65:25]
      state_1 <= io_seed_bits_1; // @[PRNG.scala 66:11]
    end else if (io_increment) begin // @[PRNG.scala 61:23]
      state_1 <= state_0; // @[PRNG.scala 62:11]
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
  state_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  state_1 = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
