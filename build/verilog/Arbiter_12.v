module Arbiter_12(
  input         clock,
  input         reset,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [3:0]  io_in_0_bits_req_0_way_en,
  input  [11:0] io_in_0_bits_req_0_addr,
  input         io_in_0_bits_valid_0,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [3:0]  io_in_1_bits_req_0_way_en,
  input  [11:0] io_in_1_bits_req_0_addr,
  input         io_in_1_bits_valid_0,
  output        io_in_2_ready,
  input         io_in_2_valid,
  input  [3:0]  io_in_2_bits_req_0_way_en,
  input  [11:0] io_in_2_bits_req_0_addr,
  input         io_in_2_bits_valid_0,
  input         io_out_ready,
  output        io_out_valid,
  output [3:0]  io_out_bits_req_0_way_en,
  output [11:0] io_out_bits_req_0_addr,
  output        io_out_bits_valid_0,
  output [1:0]  io_chosen
);
  wire [1:0] _GEN_0 = io_in_1_valid ? 2'h1 : 2'h2; // @[Arbiter.scala 126:27 Arbiter.scala 127:17 Arbiter.scala 123:13]
  wire  _GEN_1 = io_in_1_valid ? io_in_1_bits_valid_0 : io_in_2_bits_valid_0; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  wire [11:0] _GEN_2 = io_in_1_valid ? io_in_1_bits_req_0_addr : io_in_2_bits_req_0_addr; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  wire [3:0] _GEN_3 = io_in_1_valid ? io_in_1_bits_req_0_way_en : io_in_2_bits_req_0_way_en; // @[Arbiter.scala 126:27 Arbiter.scala 128:19 Arbiter.scala 124:15]
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 31:78]
  wire  grant_2 = ~(io_in_0_valid | io_in_1_valid); // @[Arbiter.scala 31:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 134:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 134:19]
  assign io_in_2_ready = grant_2 & io_out_ready; // @[Arbiter.scala 134:19]
  assign io_out_valid = ~grant_2 | io_in_2_valid; // @[Arbiter.scala 135:31]
  assign io_out_bits_req_0_way_en = io_in_0_valid ? io_in_0_bits_req_0_way_en : _GEN_3; // @[Arbiter.scala 126:27 Arbiter.scala 128:19]
  assign io_out_bits_req_0_addr = io_in_0_valid ? io_in_0_bits_req_0_addr : _GEN_2; // @[Arbiter.scala 126:27 Arbiter.scala 128:19]
  assign io_out_bits_valid_0 = io_in_0_valid ? io_in_0_bits_valid_0 : _GEN_1; // @[Arbiter.scala 126:27 Arbiter.scala 128:19]
  assign io_chosen = io_in_0_valid ? 2'h0 : _GEN_0; // @[Arbiter.scala 126:27 Arbiter.scala 127:17]
endmodule
