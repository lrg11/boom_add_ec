module Arbiter_19(
  input        clock,
  input        reset,
  output       io_in_0_ready,
  input        io_in_0_valid,
  input  [4:0] io_in_0_bits,
  output       io_in_1_ready,
  input        io_in_1_valid,
  input  [4:0] io_in_1_bits,
  output       io_in_2_ready,
  input        io_in_2_valid,
  input  [4:0] io_in_2_bits,
  input        io_out_ready,
  output       io_out_valid,
  output [4:0] io_out_bits,
  output [1:0] io_chosen
);
  wire [1:0] _GEN_0 = io_in_1_valid ? 2'h1 : 2'h2; // @[Arbiter.scala 126:27 Arbiter.scala 127:17 Arbiter.scala 123:13]
  wire [4:0] _GEN_1 = io_in_1_valid ? io_in_1_bits : io_in_2_bits; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 31:78]
  wire  grant_2 = ~(io_in_0_valid | io_in_1_valid); // @[Arbiter.scala 31:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 134:19]
  assign io_in_2_ready = grant_2 & io_out_ready; // @[Arbiter.scala 134:19]
  assign io_out_valid = ~grant_2 | io_in_2_valid; // @[Arbiter.scala 135:31]
  assign io_out_bits = io_in_0_valid ? io_in_0_bits : _GEN_1; // @[Arbiter.scala 126:27 Arbiter.scala 128:19]
  assign io_chosen = io_in_0_valid ? 2'h0 : _GEN_0; // @[Arbiter.scala 126:27 Arbiter.scala 127:17]
endmodule
