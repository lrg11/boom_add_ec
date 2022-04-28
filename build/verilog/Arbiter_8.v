module Arbiter_8(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input   io_in_0_bits,
  input   io_out_ready,
  output  io_out_valid,
  output  io_out_bits
);
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:19]
  assign io_out_valid = io_in_0_valid; // @[Arbiter.scala 135:31]
  assign io_out_bits = io_in_0_bits; // @[Arbiter.scala 124:15]
endmodule
