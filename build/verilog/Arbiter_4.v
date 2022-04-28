module Arbiter_4(
  input         clock,
  input         reset,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [19:0] io_in_0_bits_tag,
  input  [5:0]  io_in_0_bits_idx,
  input  [1:0]  io_in_0_bits_source,
  input  [2:0]  io_in_0_bits_param,
  input         io_in_0_bits_way_en,
  input         io_in_0_bits_voluntary,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [19:0] io_in_1_bits_tag,
  input  [5:0]  io_in_1_bits_idx,
  input  [1:0]  io_in_1_bits_source,
  input  [2:0]  io_in_1_bits_param,
  input         io_in_1_bits_way_en,
  input         io_in_1_bits_voluntary,
  input         io_out_ready,
  output        io_out_valid,
  output [19:0] io_out_bits_tag,
  output [5:0]  io_out_bits_idx,
  output [1:0]  io_out_bits_source,
  output [2:0]  io_out_bits_param,
  output        io_out_bits_way_en,
  output        io_out_bits_voluntary,
  output        io_chosen
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 31:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 134:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 135:31]
  assign io_out_bits_tag = io_in_0_valid ? io_in_0_bits_tag : io_in_1_bits_tag; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_idx = io_in_0_valid ? io_in_0_bits_idx : io_in_1_bits_idx; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_source = io_in_0_valid ? io_in_0_bits_source : io_in_1_bits_source; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_param = io_in_0_valid ? io_in_0_bits_param : io_in_1_bits_param; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_way_en = io_in_0_valid ? io_in_0_bits_way_en : io_in_1_bits_way_en; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_out_bits_voluntary = io_in_0_valid ? io_in_0_bits_voluntary : io_in_1_bits_voluntary; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  assign io_chosen = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 126:27 Arbiter.scala 127:17 Arbiter.scala 123:13]
endmodule
