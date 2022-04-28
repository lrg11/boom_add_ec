module Arbiter_14(
  input         clock,
  input         reset,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [2:0]  io_in_0_bits_opcode,
  input  [2:0]  io_in_0_bits_param,
  input  [3:0]  io_in_0_bits_size,
  input  [1:0]  io_in_0_bits_source,
  input  [31:0] io_in_0_bits_address,
  input  [63:0] io_in_0_bits_data,
  input         io_in_0_bits_corrupt,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [2:0]  io_in_1_bits_opcode,
  input  [2:0]  io_in_1_bits_param,
  input  [3:0]  io_in_1_bits_size,
  input  [1:0]  io_in_1_bits_source,
  input  [31:0] io_in_1_bits_address,
  input  [63:0] io_in_1_bits_data,
  input         io_in_1_bits_corrupt,
  input         io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_opcode,
  output [2:0]  io_out_bits_param,
  output [3:0]  io_out_bits_size,
  output [1:0]  io_out_bits_source,
  output [31:0] io_out_bits_address,
  output [63:0] io_out_bits_data,
  output        io_out_bits_corrupt,
  output        io_chosen
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 31:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 134:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 135:31]
  assign io_out_bits_opcode = io_in_0_valid ? io_in_0_bits_opcode : io_in_1_bits_opcode; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_param = io_in_0_valid ? io_in_0_bits_param : io_in_1_bits_param; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_size = io_in_0_valid ? io_in_0_bits_size : io_in_1_bits_size; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_source = io_in_0_valid ? io_in_0_bits_source : io_in_1_bits_source; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_address = io_in_0_valid ? io_in_0_bits_address : io_in_1_bits_address; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : io_in_1_bits_data; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_corrupt = io_in_0_valid ? io_in_0_bits_corrupt : io_in_1_bits_corrupt; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_chosen = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 126:27 Arbiter.scala 127:17 Arbiter.scala 123:13]
endmodule
