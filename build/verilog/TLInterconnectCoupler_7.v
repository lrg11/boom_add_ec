module TLInterconnectCoupler_7(
  input         clock,
  input         reset,
  output        auto_buffer_in_a_ready,
  input         auto_buffer_in_a_valid,
  input  [2:0]  auto_buffer_in_a_bits_opcode,
  input  [2:0]  auto_buffer_in_a_bits_param,
  input  [3:0]  auto_buffer_in_a_bits_size,
  input         auto_buffer_in_a_bits_source,
  input  [31:0] auto_buffer_in_a_bits_address,
  input  [7:0]  auto_buffer_in_a_bits_mask,
  input  [63:0] auto_buffer_in_a_bits_data,
  input         auto_buffer_in_a_bits_corrupt,
  input         auto_buffer_in_d_ready,
  output        auto_buffer_in_d_valid,
  output [2:0]  auto_buffer_in_d_bits_opcode,
  output [1:0]  auto_buffer_in_d_bits_param,
  output [3:0]  auto_buffer_in_d_bits_size,
  output        auto_buffer_in_d_bits_source,
  output [1:0]  auto_buffer_in_d_bits_sink,
  output        auto_buffer_in_d_bits_denied,
  output [63:0] auto_buffer_in_d_bits_data,
  output        auto_buffer_in_d_bits_corrupt,
  input         auto_tl_out_a_ready,
  output        auto_tl_out_a_valid,
  output [2:0]  auto_tl_out_a_bits_opcode,
  output [2:0]  auto_tl_out_a_bits_param,
  output [3:0]  auto_tl_out_a_bits_size,
  output        auto_tl_out_a_bits_source,
  output [31:0] auto_tl_out_a_bits_address,
  output [7:0]  auto_tl_out_a_bits_mask,
  output [63:0] auto_tl_out_a_bits_data,
  output        auto_tl_out_a_bits_corrupt,
  output        auto_tl_out_d_ready,
  input         auto_tl_out_d_valid,
  input  [2:0]  auto_tl_out_d_bits_opcode,
  input  [1:0]  auto_tl_out_d_bits_param,
  input  [3:0]  auto_tl_out_d_bits_size,
  input         auto_tl_out_d_bits_source,
  input  [1:0]  auto_tl_out_d_bits_sink,
  input         auto_tl_out_d_bits_denied,
  input  [63:0] auto_tl_out_d_bits_data,
  input         auto_tl_out_d_bits_corrupt
);
  wire  buffer_clock; // @[Buffer.scala 68:28]
  wire  buffer_reset; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  TLBuffer_6 buffer ( // @[Buffer.scala 68:28]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt)
  );
  assign auto_buffer_in_a_ready = buffer_auto_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_valid = buffer_auto_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_param = buffer_auto_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_size = buffer_auto_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_source = buffer_auto_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_sink = buffer_auto_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_denied = buffer_auto_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_data = buffer_auto_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign auto_tl_out_a_valid = buffer_auto_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_out_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_out_a_bits_param = buffer_auto_out_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_out_a_bits_size = buffer_auto_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_out_a_bits_source = buffer_auto_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_out_a_bits_address = buffer_auto_out_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_out_a_bits_mask = buffer_auto_out_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_out_a_bits_data = buffer_auto_out_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_out_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_out_d_ready = buffer_auto_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_auto_in_a_valid = auto_buffer_in_a_valid; // @[LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_opcode = auto_buffer_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_param = auto_buffer_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_size = auto_buffer_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_source = auto_buffer_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_address = auto_buffer_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_mask = auto_buffer_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_data = auto_buffer_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_corrupt = auto_buffer_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign buffer_auto_in_d_ready = auto_buffer_in_d_ready; // @[LazyModule.scala 309:16]
  assign buffer_auto_out_a_ready = auto_tl_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_valid = auto_tl_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_opcode = auto_tl_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_param = auto_tl_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_size = auto_tl_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_source = auto_tl_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_sink = auto_tl_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_denied = auto_tl_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_data = auto_tl_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_corrupt = auto_tl_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
endmodule
