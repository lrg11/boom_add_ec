module TLBusBypass(
  input         clock,
  input         reset,
  input         auto_node_out_out_a_ready,
  output        auto_node_out_out_a_valid,
  output [2:0]  auto_node_out_out_a_bits_opcode,
  output [2:0]  auto_node_out_out_a_bits_param,
  output [1:0]  auto_node_out_out_a_bits_size,
  output        auto_node_out_out_a_bits_source,
  output [8:0]  auto_node_out_out_a_bits_address,
  output [3:0]  auto_node_out_out_a_bits_mask,
  output [31:0] auto_node_out_out_a_bits_data,
  output        auto_node_out_out_a_bits_corrupt,
  output        auto_node_out_out_d_ready,
  input         auto_node_out_out_d_valid,
  input  [2:0]  auto_node_out_out_d_bits_opcode,
  input  [1:0]  auto_node_out_out_d_bits_param,
  input  [1:0]  auto_node_out_out_d_bits_size,
  input         auto_node_out_out_d_bits_source,
  input         auto_node_out_out_d_bits_sink,
  input         auto_node_out_out_d_bits_denied,
  input  [31:0] auto_node_out_out_d_bits_data,
  input         auto_node_out_out_d_bits_corrupt,
  output        auto_node_in_in_a_ready,
  input         auto_node_in_in_a_valid,
  input  [2:0]  auto_node_in_in_a_bits_opcode,
  input  [2:0]  auto_node_in_in_a_bits_param,
  input  [1:0]  auto_node_in_in_a_bits_size,
  input         auto_node_in_in_a_bits_source,
  input  [8:0]  auto_node_in_in_a_bits_address,
  input  [3:0]  auto_node_in_in_a_bits_mask,
  input  [31:0] auto_node_in_in_a_bits_data,
  input         auto_node_in_in_a_bits_corrupt,
  input         auto_node_in_in_d_ready,
  output        auto_node_in_in_d_valid,
  output [2:0]  auto_node_in_in_d_bits_opcode,
  output [1:0]  auto_node_in_in_d_bits_param,
  output [1:0]  auto_node_in_in_d_bits_size,
  output        auto_node_in_in_d_bits_source,
  output        auto_node_in_in_d_bits_sink,
  output        auto_node_in_in_d_bits_denied,
  output [31:0] auto_node_in_in_d_bits_data,
  output        auto_node_in_in_d_bits_corrupt,
  input         io_bypass
);
  wire  bar_clock; // @[BusBypass.scala 17:33]
  wire  bar_reset; // @[BusBypass.scala 17:33]
  wire  bar_auto_in_a_ready; // @[BusBypass.scala 17:33]
  wire  bar_auto_in_a_valid; // @[BusBypass.scala 17:33]
  wire [2:0] bar_auto_in_a_bits_opcode; // @[BusBypass.scala 17:33]
  wire [2:0] bar_auto_in_a_bits_param; // @[BusBypass.scala 17:33]
  wire [1:0] bar_auto_in_a_bits_size; // @[BusBypass.scala 17:33]
  wire  bar_auto_in_a_bits_source; // @[BusBypass.scala 17:33]
  wire [8:0] bar_auto_in_a_bits_address; // @[BusBypass.scala 17:33]
  wire [3:0] bar_auto_in_a_bits_mask; // @[BusBypass.scala 17:33]
  wire [31:0] bar_auto_in_a_bits_data; // @[BusBypass.scala 17:33]
  wire  bar_auto_in_a_bits_corrupt; // @[BusBypass.scala 17:33]
  wire  bar_auto_in_d_ready; // @[BusBypass.scala 17:33]
  wire  bar_auto_in_d_valid; // @[BusBypass.scala 17:33]
  wire [2:0] bar_auto_in_d_bits_opcode; // @[BusBypass.scala 17:33]
  wire [1:0] bar_auto_in_d_bits_param; // @[BusBypass.scala 17:33]
  wire [1:0] bar_auto_in_d_bits_size; // @[BusBypass.scala 17:33]
  wire  bar_auto_in_d_bits_source; // @[BusBypass.scala 17:33]
  wire  bar_auto_in_d_bits_sink; // @[BusBypass.scala 17:33]
  wire  bar_auto_in_d_bits_denied; // @[BusBypass.scala 17:33]
  wire [31:0] bar_auto_in_d_bits_data; // @[BusBypass.scala 17:33]
  wire  bar_auto_in_d_bits_corrupt; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_1_a_ready; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_1_a_valid; // @[BusBypass.scala 17:33]
  wire [2:0] bar_auto_out_1_a_bits_opcode; // @[BusBypass.scala 17:33]
  wire [2:0] bar_auto_out_1_a_bits_param; // @[BusBypass.scala 17:33]
  wire [1:0] bar_auto_out_1_a_bits_size; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_1_a_bits_source; // @[BusBypass.scala 17:33]
  wire [8:0] bar_auto_out_1_a_bits_address; // @[BusBypass.scala 17:33]
  wire [3:0] bar_auto_out_1_a_bits_mask; // @[BusBypass.scala 17:33]
  wire [31:0] bar_auto_out_1_a_bits_data; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_1_a_bits_corrupt; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_1_d_ready; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_1_d_valid; // @[BusBypass.scala 17:33]
  wire [2:0] bar_auto_out_1_d_bits_opcode; // @[BusBypass.scala 17:33]
  wire [1:0] bar_auto_out_1_d_bits_param; // @[BusBypass.scala 17:33]
  wire [1:0] bar_auto_out_1_d_bits_size; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_1_d_bits_source; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_1_d_bits_sink; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_1_d_bits_denied; // @[BusBypass.scala 17:33]
  wire [31:0] bar_auto_out_1_d_bits_data; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_1_d_bits_corrupt; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_0_a_ready; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_0_a_valid; // @[BusBypass.scala 17:33]
  wire [2:0] bar_auto_out_0_a_bits_opcode; // @[BusBypass.scala 17:33]
  wire [2:0] bar_auto_out_0_a_bits_param; // @[BusBypass.scala 17:33]
  wire [1:0] bar_auto_out_0_a_bits_size; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_0_a_bits_source; // @[BusBypass.scala 17:33]
  wire [127:0] bar_auto_out_0_a_bits_address; // @[BusBypass.scala 17:33]
  wire [3:0] bar_auto_out_0_a_bits_mask; // @[BusBypass.scala 17:33]
  wire [31:0] bar_auto_out_0_a_bits_data; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_0_a_bits_corrupt; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_0_d_ready; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_0_d_valid; // @[BusBypass.scala 17:33]
  wire [2:0] bar_auto_out_0_d_bits_opcode; // @[BusBypass.scala 17:33]
  wire [1:0] bar_auto_out_0_d_bits_param; // @[BusBypass.scala 17:33]
  wire [1:0] bar_auto_out_0_d_bits_size; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_0_d_bits_source; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_0_d_bits_sink; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_0_d_bits_denied; // @[BusBypass.scala 17:33]
  wire [31:0] bar_auto_out_0_d_bits_data; // @[BusBypass.scala 17:33]
  wire  bar_auto_out_0_d_bits_corrupt; // @[BusBypass.scala 17:33]
  wire  bar_io_bypass; // @[BusBypass.scala 17:33]
  wire  bar_io_pending; // @[BusBypass.scala 17:33]
  wire  error_clock; // @[BusBypass.scala 27:40]
  wire  error_reset; // @[BusBypass.scala 27:40]
  wire  error_auto_in_a_ready; // @[BusBypass.scala 27:40]
  wire  error_auto_in_a_valid; // @[BusBypass.scala 27:40]
  wire [2:0] error_auto_in_a_bits_opcode; // @[BusBypass.scala 27:40]
  wire [2:0] error_auto_in_a_bits_param; // @[BusBypass.scala 27:40]
  wire [1:0] error_auto_in_a_bits_size; // @[BusBypass.scala 27:40]
  wire  error_auto_in_a_bits_source; // @[BusBypass.scala 27:40]
  wire [127:0] error_auto_in_a_bits_address; // @[BusBypass.scala 27:40]
  wire [3:0] error_auto_in_a_bits_mask; // @[BusBypass.scala 27:40]
  wire [31:0] error_auto_in_a_bits_data; // @[BusBypass.scala 27:40]
  wire  error_auto_in_a_bits_corrupt; // @[BusBypass.scala 27:40]
  wire  error_auto_in_d_ready; // @[BusBypass.scala 27:40]
  wire  error_auto_in_d_valid; // @[BusBypass.scala 27:40]
  wire [2:0] error_auto_in_d_bits_opcode; // @[BusBypass.scala 27:40]
  wire [1:0] error_auto_in_d_bits_param; // @[BusBypass.scala 27:40]
  wire [1:0] error_auto_in_d_bits_size; // @[BusBypass.scala 27:40]
  wire  error_auto_in_d_bits_source; // @[BusBypass.scala 27:40]
  wire  error_auto_in_d_bits_sink; // @[BusBypass.scala 27:40]
  wire  error_auto_in_d_bits_denied; // @[BusBypass.scala 27:40]
  wire [31:0] error_auto_in_d_bits_data; // @[BusBypass.scala 27:40]
  wire  error_auto_in_d_bits_corrupt; // @[BusBypass.scala 27:40]
  TLBusBypassBar bar ( // @[BusBypass.scala 17:33]
    .clock(bar_clock),
    .reset(bar_reset),
    .auto_in_a_ready(bar_auto_in_a_ready),
    .auto_in_a_valid(bar_auto_in_a_valid),
    .auto_in_a_bits_opcode(bar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(bar_auto_in_a_bits_param),
    .auto_in_a_bits_size(bar_auto_in_a_bits_size),
    .auto_in_a_bits_source(bar_auto_in_a_bits_source),
    .auto_in_a_bits_address(bar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(bar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(bar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(bar_auto_in_a_bits_corrupt),
    .auto_in_d_ready(bar_auto_in_d_ready),
    .auto_in_d_valid(bar_auto_in_d_valid),
    .auto_in_d_bits_opcode(bar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(bar_auto_in_d_bits_param),
    .auto_in_d_bits_size(bar_auto_in_d_bits_size),
    .auto_in_d_bits_source(bar_auto_in_d_bits_source),
    .auto_in_d_bits_sink(bar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(bar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(bar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(bar_auto_in_d_bits_corrupt),
    .auto_out_1_a_ready(bar_auto_out_1_a_ready),
    .auto_out_1_a_valid(bar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(bar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(bar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(bar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(bar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(bar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(bar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(bar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(bar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready(bar_auto_out_1_d_ready),
    .auto_out_1_d_valid(bar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(bar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(bar_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(bar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(bar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_sink(bar_auto_out_1_d_bits_sink),
    .auto_out_1_d_bits_denied(bar_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(bar_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(bar_auto_out_1_d_bits_corrupt),
    .auto_out_0_a_ready(bar_auto_out_0_a_ready),
    .auto_out_0_a_valid(bar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(bar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(bar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(bar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(bar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(bar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(bar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(bar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(bar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(bar_auto_out_0_d_ready),
    .auto_out_0_d_valid(bar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(bar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(bar_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(bar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(bar_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(bar_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(bar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(bar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(bar_auto_out_0_d_bits_corrupt),
    .io_bypass(bar_io_bypass),
    .io_pending(bar_io_pending)
  );
  TLError_1 error ( // @[BusBypass.scala 27:40]
    .clock(error_clock),
    .reset(error_reset),
    .auto_in_a_ready(error_auto_in_a_ready),
    .auto_in_a_valid(error_auto_in_a_valid),
    .auto_in_a_bits_opcode(error_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(error_auto_in_a_bits_param),
    .auto_in_a_bits_size(error_auto_in_a_bits_size),
    .auto_in_a_bits_source(error_auto_in_a_bits_source),
    .auto_in_a_bits_address(error_auto_in_a_bits_address),
    .auto_in_a_bits_mask(error_auto_in_a_bits_mask),
    .auto_in_a_bits_data(error_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(error_auto_in_a_bits_corrupt),
    .auto_in_d_ready(error_auto_in_d_ready),
    .auto_in_d_valid(error_auto_in_d_valid),
    .auto_in_d_bits_opcode(error_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(error_auto_in_d_bits_param),
    .auto_in_d_bits_size(error_auto_in_d_bits_size),
    .auto_in_d_bits_source(error_auto_in_d_bits_source),
    .auto_in_d_bits_sink(error_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(error_auto_in_d_bits_denied),
    .auto_in_d_bits_data(error_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(error_auto_in_d_bits_corrupt)
  );
  assign auto_node_out_out_a_valid = bar_auto_out_1_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_node_out_out_a_bits_opcode = bar_auto_out_1_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_node_out_out_a_bits_param = bar_auto_out_1_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_node_out_out_a_bits_size = bar_auto_out_1_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_node_out_out_a_bits_source = bar_auto_out_1_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_node_out_out_a_bits_address = bar_auto_out_1_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_node_out_out_a_bits_mask = bar_auto_out_1_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_node_out_out_a_bits_data = bar_auto_out_1_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_node_out_out_a_bits_corrupt = bar_auto_out_1_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_node_out_out_d_ready = bar_auto_out_1_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_node_in_in_a_ready = bar_auto_in_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_node_in_in_d_valid = bar_auto_in_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_node_in_in_d_bits_opcode = bar_auto_in_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_node_in_in_d_bits_param = bar_auto_in_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_node_in_in_d_bits_size = bar_auto_in_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_node_in_in_d_bits_source = bar_auto_in_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_node_in_in_d_bits_sink = bar_auto_in_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_node_in_in_d_bits_denied = bar_auto_in_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_node_in_in_d_bits_data = bar_auto_in_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_node_in_in_d_bits_corrupt = bar_auto_in_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign bar_clock = clock;
  assign bar_reset = reset;
  assign bar_auto_in_a_valid = auto_node_in_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bar_auto_in_a_bits_opcode = auto_node_in_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bar_auto_in_a_bits_param = auto_node_in_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bar_auto_in_a_bits_size = auto_node_in_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bar_auto_in_a_bits_source = auto_node_in_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bar_auto_in_a_bits_address = auto_node_in_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bar_auto_in_a_bits_mask = auto_node_in_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bar_auto_in_a_bits_data = auto_node_in_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bar_auto_in_a_bits_corrupt = auto_node_in_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bar_auto_in_d_ready = auto_node_in_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bar_auto_out_1_a_ready = auto_node_out_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bar_auto_out_1_d_valid = auto_node_out_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bar_auto_out_1_d_bits_opcode = auto_node_out_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bar_auto_out_1_d_bits_param = auto_node_out_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bar_auto_out_1_d_bits_size = auto_node_out_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bar_auto_out_1_d_bits_source = auto_node_out_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bar_auto_out_1_d_bits_sink = auto_node_out_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bar_auto_out_1_d_bits_denied = auto_node_out_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bar_auto_out_1_d_bits_data = auto_node_out_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bar_auto_out_1_d_bits_corrupt = auto_node_out_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bar_auto_out_0_a_ready = error_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign bar_auto_out_0_d_valid = error_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign bar_auto_out_0_d_bits_opcode = error_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign bar_auto_out_0_d_bits_param = error_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign bar_auto_out_0_d_bits_size = error_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign bar_auto_out_0_d_bits_source = error_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign bar_auto_out_0_d_bits_sink = error_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign bar_auto_out_0_d_bits_denied = error_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign bar_auto_out_0_d_bits_data = error_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign bar_auto_out_0_d_bits_corrupt = error_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign bar_io_bypass = io_bypass; // @[BusBypass.scala 44:26]
  assign error_clock = clock;
  assign error_reset = reset;
  assign error_auto_in_a_valid = bar_auto_out_0_a_valid; // @[LazyModule.scala 298:16]
  assign error_auto_in_a_bits_opcode = bar_auto_out_0_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign error_auto_in_a_bits_param = bar_auto_out_0_a_bits_param; // @[LazyModule.scala 298:16]
  assign error_auto_in_a_bits_size = bar_auto_out_0_a_bits_size; // @[LazyModule.scala 298:16]
  assign error_auto_in_a_bits_source = bar_auto_out_0_a_bits_source; // @[LazyModule.scala 298:16]
  assign error_auto_in_a_bits_address = bar_auto_out_0_a_bits_address; // @[LazyModule.scala 298:16]
  assign error_auto_in_a_bits_mask = bar_auto_out_0_a_bits_mask; // @[LazyModule.scala 298:16]
  assign error_auto_in_a_bits_data = bar_auto_out_0_a_bits_data; // @[LazyModule.scala 298:16]
  assign error_auto_in_a_bits_corrupt = bar_auto_out_0_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign error_auto_in_d_ready = bar_auto_out_0_d_ready; // @[LazyModule.scala 298:16]
endmodule
