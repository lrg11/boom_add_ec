module TLInterconnectCoupler_6(
  input         clock,
  input         reset,
  output        auto_buffer_in_a_ready,
  input         auto_buffer_in_a_valid,
  input  [2:0]  auto_buffer_in_a_bits_opcode,
  input  [2:0]  auto_buffer_in_a_bits_param,
  input  [2:0]  auto_buffer_in_a_bits_size,
  input  [4:0]  auto_buffer_in_a_bits_source,
  input  [20:0] auto_buffer_in_a_bits_address,
  input  [7:0]  auto_buffer_in_a_bits_mask,
  input  [63:0] auto_buffer_in_a_bits_data,
  input         auto_buffer_in_a_bits_corrupt,
  input         auto_buffer_in_d_ready,
  output        auto_buffer_in_d_valid,
  output [2:0]  auto_buffer_in_d_bits_opcode,
  output [1:0]  auto_buffer_in_d_bits_param,
  output [2:0]  auto_buffer_in_d_bits_size,
  output [4:0]  auto_buffer_in_d_bits_source,
  output        auto_buffer_in_d_bits_sink,
  output        auto_buffer_in_d_bits_denied,
  output [63:0] auto_buffer_in_d_bits_data,
  output        auto_buffer_in_d_bits_corrupt,
  input         auto_buffer_out_a_ready,
  output        auto_buffer_out_a_valid,
  output [2:0]  auto_buffer_out_a_bits_opcode,
  output [2:0]  auto_buffer_out_a_bits_param,
  output [1:0]  auto_buffer_out_a_bits_size,
  output [8:0]  auto_buffer_out_a_bits_source,
  output [20:0] auto_buffer_out_a_bits_address,
  output [7:0]  auto_buffer_out_a_bits_mask,
  output [63:0] auto_buffer_out_a_bits_data,
  output        auto_buffer_out_a_bits_corrupt,
  output        auto_buffer_out_d_ready,
  input         auto_buffer_out_d_valid,
  input  [2:0]  auto_buffer_out_d_bits_opcode,
  input  [1:0]  auto_buffer_out_d_bits_param,
  input  [1:0]  auto_buffer_out_d_bits_size,
  input  [8:0]  auto_buffer_out_d_bits_source,
  input         auto_buffer_out_d_bits_sink,
  input         auto_buffer_out_d_bits_denied,
  input  [63:0] auto_buffer_out_d_bits_data,
  input         auto_buffer_out_d_bits_corrupt
);
  wire  buffer_clock; // @[Buffer.scala 68:28]
  wire  buffer_reset; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [8:0] buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [20:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [8:0] buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [8:0] buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [20:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [8:0] buffer_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  fragmenter_clock; // @[Fragmenter.scala 333:34]
  wire  fragmenter_reset; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_a_ready; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_a_valid; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_in_a_bits_opcode; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_in_a_bits_param; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_in_a_bits_size; // @[Fragmenter.scala 333:34]
  wire [4:0] fragmenter_auto_in_a_bits_source; // @[Fragmenter.scala 333:34]
  wire [20:0] fragmenter_auto_in_a_bits_address; // @[Fragmenter.scala 333:34]
  wire [7:0] fragmenter_auto_in_a_bits_mask; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_auto_in_a_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_a_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_d_ready; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_d_valid; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_in_d_bits_opcode; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_auto_in_d_bits_param; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_in_d_bits_size; // @[Fragmenter.scala 333:34]
  wire [4:0] fragmenter_auto_in_d_bits_source; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_d_bits_sink; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_d_bits_denied; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_auto_in_d_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_d_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_a_ready; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_a_valid; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_out_a_bits_opcode; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_out_a_bits_param; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_auto_out_a_bits_size; // @[Fragmenter.scala 333:34]
  wire [8:0] fragmenter_auto_out_a_bits_source; // @[Fragmenter.scala 333:34]
  wire [20:0] fragmenter_auto_out_a_bits_address; // @[Fragmenter.scala 333:34]
  wire [7:0] fragmenter_auto_out_a_bits_mask; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_auto_out_a_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_a_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_d_ready; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_d_valid; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_out_d_bits_opcode; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_auto_out_d_bits_param; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_auto_out_d_bits_size; // @[Fragmenter.scala 333:34]
  wire [8:0] fragmenter_auto_out_d_bits_source; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_d_bits_sink; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_d_bits_denied; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_auto_out_d_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_d_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  buffer_1_clock; // @[Buffer.scala 68:28]
  wire  buffer_1_reset; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_1_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [20:0] buffer_1_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_1_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_1_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [20:0] buffer_1_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_1_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  TLBuffer_3 buffer ( // @[Buffer.scala 68:28]
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
  TLFragmenter_2 fragmenter ( // @[Fragmenter.scala 333:34]
    .clock(fragmenter_clock),
    .reset(fragmenter_reset),
    .auto_in_a_ready(fragmenter_auto_in_a_ready),
    .auto_in_a_valid(fragmenter_auto_in_a_valid),
    .auto_in_a_bits_opcode(fragmenter_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(fragmenter_auto_in_a_bits_param),
    .auto_in_a_bits_size(fragmenter_auto_in_a_bits_size),
    .auto_in_a_bits_source(fragmenter_auto_in_a_bits_source),
    .auto_in_a_bits_address(fragmenter_auto_in_a_bits_address),
    .auto_in_a_bits_mask(fragmenter_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fragmenter_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(fragmenter_auto_in_a_bits_corrupt),
    .auto_in_d_ready(fragmenter_auto_in_d_ready),
    .auto_in_d_valid(fragmenter_auto_in_d_valid),
    .auto_in_d_bits_opcode(fragmenter_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(fragmenter_auto_in_d_bits_param),
    .auto_in_d_bits_size(fragmenter_auto_in_d_bits_size),
    .auto_in_d_bits_source(fragmenter_auto_in_d_bits_source),
    .auto_in_d_bits_sink(fragmenter_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(fragmenter_auto_in_d_bits_denied),
    .auto_in_d_bits_data(fragmenter_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(fragmenter_auto_in_d_bits_corrupt),
    .auto_out_a_ready(fragmenter_auto_out_a_ready),
    .auto_out_a_valid(fragmenter_auto_out_a_valid),
    .auto_out_a_bits_opcode(fragmenter_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(fragmenter_auto_out_a_bits_param),
    .auto_out_a_bits_size(fragmenter_auto_out_a_bits_size),
    .auto_out_a_bits_source(fragmenter_auto_out_a_bits_source),
    .auto_out_a_bits_address(fragmenter_auto_out_a_bits_address),
    .auto_out_a_bits_mask(fragmenter_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fragmenter_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(fragmenter_auto_out_a_bits_corrupt),
    .auto_out_d_ready(fragmenter_auto_out_d_ready),
    .auto_out_d_valid(fragmenter_auto_out_d_valid),
    .auto_out_d_bits_opcode(fragmenter_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(fragmenter_auto_out_d_bits_param),
    .auto_out_d_bits_size(fragmenter_auto_out_d_bits_size),
    .auto_out_d_bits_source(fragmenter_auto_out_d_bits_source),
    .auto_out_d_bits_sink(fragmenter_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(fragmenter_auto_out_d_bits_denied),
    .auto_out_d_bits_data(fragmenter_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(fragmenter_auto_out_d_bits_corrupt)
  );
  TLBuffer_4 buffer_1 ( // @[Buffer.scala 68:28]
    .clock(buffer_1_clock),
    .reset(buffer_1_reset),
    .auto_in_a_ready(buffer_1_auto_in_a_ready),
    .auto_in_a_valid(buffer_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_1_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(buffer_1_auto_in_a_bits_corrupt),
    .auto_in_d_ready(buffer_1_auto_in_d_ready),
    .auto_in_d_valid(buffer_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_1_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_1_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_1_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_1_auto_in_d_bits_corrupt),
    .auto_out_a_ready(buffer_1_auto_out_a_ready),
    .auto_out_a_valid(buffer_1_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_1_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_1_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_1_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_1_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_1_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_1_auto_out_d_ready),
    .auto_out_d_valid(buffer_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_1_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_1_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_1_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_1_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_1_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_1_auto_out_d_bits_corrupt)
  );
  assign auto_buffer_in_a_ready = buffer_1_auto_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_valid = buffer_1_auto_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_opcode = buffer_1_auto_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_param = buffer_1_auto_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_size = buffer_1_auto_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_source = buffer_1_auto_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_sink = buffer_1_auto_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_denied = buffer_1_auto_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_data = buffer_1_auto_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_buffer_in_d_bits_corrupt = buffer_1_auto_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign auto_buffer_out_a_valid = buffer_auto_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_buffer_out_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_buffer_out_a_bits_param = buffer_auto_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_buffer_out_a_bits_size = buffer_auto_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_buffer_out_a_bits_source = buffer_auto_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_buffer_out_a_bits_address = buffer_auto_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_buffer_out_a_bits_mask = buffer_auto_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_buffer_out_a_bits_data = buffer_auto_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_buffer_out_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_buffer_out_d_ready = buffer_auto_out_d_ready; // @[LazyModule.scala 311:12]
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_auto_in_a_valid = fragmenter_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_opcode = fragmenter_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_param = fragmenter_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_size = fragmenter_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_source = fragmenter_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_address = fragmenter_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_mask = fragmenter_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_data = fragmenter_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_corrupt = fragmenter_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_d_ready = fragmenter_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_a_ready = auto_buffer_out_a_ready; // @[LazyModule.scala 311:12]
  assign buffer_auto_out_d_valid = auto_buffer_out_d_valid; // @[LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_opcode = auto_buffer_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_param = auto_buffer_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_size = auto_buffer_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_source = auto_buffer_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_sink = auto_buffer_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_denied = auto_buffer_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_data = auto_buffer_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_corrupt = auto_buffer_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign fragmenter_clock = clock;
  assign fragmenter_reset = reset;
  assign fragmenter_auto_in_a_valid = buffer_1_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_in_a_bits_opcode = buffer_1_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_in_a_bits_param = buffer_1_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_in_a_bits_size = buffer_1_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_in_a_bits_source = buffer_1_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_in_a_bits_address = buffer_1_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_in_a_bits_mask = buffer_1_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_in_a_bits_data = buffer_1_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_in_a_bits_corrupt = buffer_1_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_in_d_ready = buffer_1_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_out_a_ready = buffer_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_out_d_valid = buffer_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_out_d_bits_param = buffer_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_out_d_bits_size = buffer_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_out_d_bits_source = buffer_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_out_d_bits_sink = buffer_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_out_d_bits_denied = buffer_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_out_d_bits_data = buffer_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign fragmenter_auto_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign buffer_1_clock = clock;
  assign buffer_1_reset = reset;
  assign buffer_1_auto_in_a_valid = auto_buffer_in_a_valid; // @[LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_opcode = auto_buffer_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_param = auto_buffer_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_size = auto_buffer_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_source = auto_buffer_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_address = auto_buffer_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_mask = auto_buffer_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_data = auto_buffer_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_corrupt = auto_buffer_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign buffer_1_auto_in_d_ready = auto_buffer_in_d_ready; // @[LazyModule.scala 309:16]
  assign buffer_1_auto_out_a_ready = fragmenter_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_valid = fragmenter_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_opcode = fragmenter_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_param = fragmenter_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_size = fragmenter_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_source = fragmenter_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_sink = fragmenter_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_denied = fragmenter_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_data = fragmenter_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_corrupt = fragmenter_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
endmodule
