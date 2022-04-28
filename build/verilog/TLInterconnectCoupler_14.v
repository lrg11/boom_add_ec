module TLInterconnectCoupler_14(
  input         clock,
  input         reset,
  output        auto_tl_in_a_ready,
  input         auto_tl_in_a_valid,
  input  [2:0]  auto_tl_in_a_bits_opcode,
  input  [2:0]  auto_tl_in_a_bits_param,
  input  [3:0]  auto_tl_in_a_bits_size,
  input         auto_tl_in_a_bits_source,
  input  [30:0] auto_tl_in_a_bits_address,
  input  [7:0]  auto_tl_in_a_bits_mask,
  input  [63:0] auto_tl_in_a_bits_data,
  input         auto_tl_in_a_bits_corrupt,
  input         auto_tl_in_d_ready,
  output        auto_tl_in_d_valid,
  output [2:0]  auto_tl_in_d_bits_opcode,
  output [1:0]  auto_tl_in_d_bits_param,
  output [3:0]  auto_tl_in_d_bits_size,
  output        auto_tl_in_d_bits_source,
  output        auto_tl_in_d_bits_sink,
  output        auto_tl_in_d_bits_denied,
  output [63:0] auto_tl_in_d_bits_data,
  output        auto_tl_in_d_bits_corrupt,
  input         auto_tl_out_a_ready,
  output        auto_tl_out_a_valid,
  output [2:0]  auto_tl_out_a_bits_opcode,
  output [2:0]  auto_tl_out_a_bits_param,
  output [3:0]  auto_tl_out_a_bits_size,
  output        auto_tl_out_a_bits_source,
  output [30:0] auto_tl_out_a_bits_address,
  output [7:0]  auto_tl_out_a_bits_mask,
  output [63:0] auto_tl_out_a_bits_data,
  output        auto_tl_out_a_bits_corrupt,
  output        auto_tl_out_d_ready,
  input         auto_tl_out_d_valid,
  input  [2:0]  auto_tl_out_d_bits_opcode,
  input  [1:0]  auto_tl_out_d_bits_param,
  input  [3:0]  auto_tl_out_d_bits_size,
  input         auto_tl_out_d_bits_source,
  input         auto_tl_out_d_bits_sink,
  input         auto_tl_out_d_bits_denied,
  input  [63:0] auto_tl_out_d_bits_data,
  input         auto_tl_out_d_bits_corrupt
);
  assign auto_tl_in_a_ready = auto_tl_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_tl_in_d_valid = auto_tl_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_tl_in_d_bits_opcode = auto_tl_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_tl_in_d_bits_param = auto_tl_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_tl_in_d_bits_size = auto_tl_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_tl_in_d_bits_source = auto_tl_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_tl_in_d_bits_sink = auto_tl_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_tl_in_d_bits_denied = auto_tl_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_tl_in_d_bits_data = auto_tl_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_tl_in_d_bits_corrupt = auto_tl_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_tl_out_a_valid = auto_tl_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tl_out_a_bits_opcode = auto_tl_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tl_out_a_bits_param = auto_tl_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tl_out_a_bits_size = auto_tl_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tl_out_a_bits_source = auto_tl_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tl_out_a_bits_address = auto_tl_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tl_out_a_bits_mask = auto_tl_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tl_out_a_bits_data = auto_tl_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tl_out_a_bits_corrupt = auto_tl_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_tl_out_d_ready = auto_tl_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
