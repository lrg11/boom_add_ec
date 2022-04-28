module TLInterconnectCoupler_17(
  input         clock,
  input         reset,
  input         auto_tlserial_manager_crossing_out_a_ready,
  output        auto_tlserial_manager_crossing_out_a_valid,
  output [2:0]  auto_tlserial_manager_crossing_out_a_bits_opcode,
  output [2:0]  auto_tlserial_manager_crossing_out_a_bits_param,
  output [2:0]  auto_tlserial_manager_crossing_out_a_bits_size,
  output [3:0]  auto_tlserial_manager_crossing_out_a_bits_source,
  output [28:0] auto_tlserial_manager_crossing_out_a_bits_address,
  output [7:0]  auto_tlserial_manager_crossing_out_a_bits_mask,
  output [63:0] auto_tlserial_manager_crossing_out_a_bits_data,
  output        auto_tlserial_manager_crossing_out_a_bits_corrupt,
  output        auto_tlserial_manager_crossing_out_d_ready,
  input         auto_tlserial_manager_crossing_out_d_valid,
  input  [2:0]  auto_tlserial_manager_crossing_out_d_bits_opcode,
  input  [1:0]  auto_tlserial_manager_crossing_out_d_bits_param,
  input  [2:0]  auto_tlserial_manager_crossing_out_d_bits_size,
  input  [3:0]  auto_tlserial_manager_crossing_out_d_bits_source,
  input         auto_tlserial_manager_crossing_out_d_bits_sink,
  input         auto_tlserial_manager_crossing_out_d_bits_denied,
  input  [63:0] auto_tlserial_manager_crossing_out_d_bits_data,
  input         auto_tlserial_manager_crossing_out_d_bits_corrupt,
  output        auto_tl_in_a_ready,
  input         auto_tl_in_a_valid,
  input  [2:0]  auto_tl_in_a_bits_opcode,
  input  [2:0]  auto_tl_in_a_bits_param,
  input  [2:0]  auto_tl_in_a_bits_size,
  input  [5:0]  auto_tl_in_a_bits_source,
  input  [28:0] auto_tl_in_a_bits_address,
  input  [7:0]  auto_tl_in_a_bits_mask,
  input  [63:0] auto_tl_in_a_bits_data,
  input         auto_tl_in_a_bits_corrupt,
  input         auto_tl_in_d_ready,
  output        auto_tl_in_d_valid,
  output [2:0]  auto_tl_in_d_bits_opcode,
  output [1:0]  auto_tl_in_d_bits_param,
  output [2:0]  auto_tl_in_d_bits_size,
  output [5:0]  auto_tl_in_d_bits_source,
  output        auto_tl_in_d_bits_sink,
  output        auto_tl_in_d_bits_denied,
  output [63:0] auto_tl_in_d_bits_data,
  output        auto_tl_in_d_bits_corrupt
);
  wire  shrinker_clock; // @[SourceShrinker.scala 88:30]
  wire  shrinker_reset; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_in_a_ready; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_in_a_valid; // @[SourceShrinker.scala 88:30]
  wire [2:0] shrinker_auto_in_a_bits_opcode; // @[SourceShrinker.scala 88:30]
  wire [2:0] shrinker_auto_in_a_bits_param; // @[SourceShrinker.scala 88:30]
  wire [2:0] shrinker_auto_in_a_bits_size; // @[SourceShrinker.scala 88:30]
  wire [5:0] shrinker_auto_in_a_bits_source; // @[SourceShrinker.scala 88:30]
  wire [28:0] shrinker_auto_in_a_bits_address; // @[SourceShrinker.scala 88:30]
  wire [7:0] shrinker_auto_in_a_bits_mask; // @[SourceShrinker.scala 88:30]
  wire [63:0] shrinker_auto_in_a_bits_data; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_in_a_bits_corrupt; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_in_d_ready; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_in_d_valid; // @[SourceShrinker.scala 88:30]
  wire [2:0] shrinker_auto_in_d_bits_opcode; // @[SourceShrinker.scala 88:30]
  wire [1:0] shrinker_auto_in_d_bits_param; // @[SourceShrinker.scala 88:30]
  wire [2:0] shrinker_auto_in_d_bits_size; // @[SourceShrinker.scala 88:30]
  wire [5:0] shrinker_auto_in_d_bits_source; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_in_d_bits_sink; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_in_d_bits_denied; // @[SourceShrinker.scala 88:30]
  wire [63:0] shrinker_auto_in_d_bits_data; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_in_d_bits_corrupt; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_out_a_ready; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_out_a_valid; // @[SourceShrinker.scala 88:30]
  wire [2:0] shrinker_auto_out_a_bits_opcode; // @[SourceShrinker.scala 88:30]
  wire [2:0] shrinker_auto_out_a_bits_param; // @[SourceShrinker.scala 88:30]
  wire [2:0] shrinker_auto_out_a_bits_size; // @[SourceShrinker.scala 88:30]
  wire [3:0] shrinker_auto_out_a_bits_source; // @[SourceShrinker.scala 88:30]
  wire [28:0] shrinker_auto_out_a_bits_address; // @[SourceShrinker.scala 88:30]
  wire [7:0] shrinker_auto_out_a_bits_mask; // @[SourceShrinker.scala 88:30]
  wire [63:0] shrinker_auto_out_a_bits_data; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_out_a_bits_corrupt; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_out_d_ready; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_out_d_valid; // @[SourceShrinker.scala 88:30]
  wire [2:0] shrinker_auto_out_d_bits_opcode; // @[SourceShrinker.scala 88:30]
  wire [1:0] shrinker_auto_out_d_bits_param; // @[SourceShrinker.scala 88:30]
  wire [2:0] shrinker_auto_out_d_bits_size; // @[SourceShrinker.scala 88:30]
  wire [3:0] shrinker_auto_out_d_bits_source; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_out_d_bits_sink; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_out_d_bits_denied; // @[SourceShrinker.scala 88:30]
  wire [63:0] shrinker_auto_out_d_bits_data; // @[SourceShrinker.scala 88:30]
  wire  shrinker_auto_out_d_bits_corrupt; // @[SourceShrinker.scala 88:30]
  wire  widget_clock; // @[WidthWidget.scala 212:28]
  wire  widget_reset; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_a_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_a_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_a_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_a_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_a_bits_size; // @[WidthWidget.scala 212:28]
  wire [5:0] widget_auto_in_a_bits_source; // @[WidthWidget.scala 212:28]
  wire [28:0] widget_auto_in_a_bits_address; // @[WidthWidget.scala 212:28]
  wire [7:0] widget_auto_in_a_bits_mask; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_in_a_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_a_bits_corrupt; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_d_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_d_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_d_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [1:0] widget_auto_in_d_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_d_bits_size; // @[WidthWidget.scala 212:28]
  wire [5:0] widget_auto_in_d_bits_source; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_d_bits_sink; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_d_bits_denied; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_in_d_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_d_bits_corrupt; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_a_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_a_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_a_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_a_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_a_bits_size; // @[WidthWidget.scala 212:28]
  wire [5:0] widget_auto_out_a_bits_source; // @[WidthWidget.scala 212:28]
  wire [28:0] widget_auto_out_a_bits_address; // @[WidthWidget.scala 212:28]
  wire [7:0] widget_auto_out_a_bits_mask; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_out_a_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_a_bits_corrupt; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_d_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_d_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_d_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [1:0] widget_auto_out_d_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_d_bits_size; // @[WidthWidget.scala 212:28]
  wire [5:0] widget_auto_out_d_bits_source; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_d_bits_sink; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_d_bits_denied; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_out_d_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_d_bits_corrupt; // @[WidthWidget.scala 212:28]
  TLSourceShrinker_1 shrinker ( // @[SourceShrinker.scala 88:30]
    .clock(shrinker_clock),
    .reset(shrinker_reset),
    .auto_in_a_ready(shrinker_auto_in_a_ready),
    .auto_in_a_valid(shrinker_auto_in_a_valid),
    .auto_in_a_bits_opcode(shrinker_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(shrinker_auto_in_a_bits_param),
    .auto_in_a_bits_size(shrinker_auto_in_a_bits_size),
    .auto_in_a_bits_source(shrinker_auto_in_a_bits_source),
    .auto_in_a_bits_address(shrinker_auto_in_a_bits_address),
    .auto_in_a_bits_mask(shrinker_auto_in_a_bits_mask),
    .auto_in_a_bits_data(shrinker_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(shrinker_auto_in_a_bits_corrupt),
    .auto_in_d_ready(shrinker_auto_in_d_ready),
    .auto_in_d_valid(shrinker_auto_in_d_valid),
    .auto_in_d_bits_opcode(shrinker_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(shrinker_auto_in_d_bits_param),
    .auto_in_d_bits_size(shrinker_auto_in_d_bits_size),
    .auto_in_d_bits_source(shrinker_auto_in_d_bits_source),
    .auto_in_d_bits_sink(shrinker_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(shrinker_auto_in_d_bits_denied),
    .auto_in_d_bits_data(shrinker_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(shrinker_auto_in_d_bits_corrupt),
    .auto_out_a_ready(shrinker_auto_out_a_ready),
    .auto_out_a_valid(shrinker_auto_out_a_valid),
    .auto_out_a_bits_opcode(shrinker_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(shrinker_auto_out_a_bits_param),
    .auto_out_a_bits_size(shrinker_auto_out_a_bits_size),
    .auto_out_a_bits_source(shrinker_auto_out_a_bits_source),
    .auto_out_a_bits_address(shrinker_auto_out_a_bits_address),
    .auto_out_a_bits_mask(shrinker_auto_out_a_bits_mask),
    .auto_out_a_bits_data(shrinker_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(shrinker_auto_out_a_bits_corrupt),
    .auto_out_d_ready(shrinker_auto_out_d_ready),
    .auto_out_d_valid(shrinker_auto_out_d_valid),
    .auto_out_d_bits_opcode(shrinker_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(shrinker_auto_out_d_bits_param),
    .auto_out_d_bits_size(shrinker_auto_out_d_bits_size),
    .auto_out_d_bits_source(shrinker_auto_out_d_bits_source),
    .auto_out_d_bits_sink(shrinker_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(shrinker_auto_out_d_bits_denied),
    .auto_out_d_bits_data(shrinker_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(shrinker_auto_out_d_bits_corrupt)
  );
  TLWidthWidget_7 widget ( // @[WidthWidget.scala 212:28]
    .clock(widget_clock),
    .reset(widget_reset),
    .auto_in_a_ready(widget_auto_in_a_ready),
    .auto_in_a_valid(widget_auto_in_a_valid),
    .auto_in_a_bits_opcode(widget_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(widget_auto_in_a_bits_param),
    .auto_in_a_bits_size(widget_auto_in_a_bits_size),
    .auto_in_a_bits_source(widget_auto_in_a_bits_source),
    .auto_in_a_bits_address(widget_auto_in_a_bits_address),
    .auto_in_a_bits_mask(widget_auto_in_a_bits_mask),
    .auto_in_a_bits_data(widget_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(widget_auto_in_a_bits_corrupt),
    .auto_in_d_ready(widget_auto_in_d_ready),
    .auto_in_d_valid(widget_auto_in_d_valid),
    .auto_in_d_bits_opcode(widget_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(widget_auto_in_d_bits_param),
    .auto_in_d_bits_size(widget_auto_in_d_bits_size),
    .auto_in_d_bits_source(widget_auto_in_d_bits_source),
    .auto_in_d_bits_sink(widget_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(widget_auto_in_d_bits_denied),
    .auto_in_d_bits_data(widget_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(widget_auto_in_d_bits_corrupt),
    .auto_out_a_ready(widget_auto_out_a_ready),
    .auto_out_a_valid(widget_auto_out_a_valid),
    .auto_out_a_bits_opcode(widget_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(widget_auto_out_a_bits_param),
    .auto_out_a_bits_size(widget_auto_out_a_bits_size),
    .auto_out_a_bits_source(widget_auto_out_a_bits_source),
    .auto_out_a_bits_address(widget_auto_out_a_bits_address),
    .auto_out_a_bits_mask(widget_auto_out_a_bits_mask),
    .auto_out_a_bits_data(widget_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(widget_auto_out_a_bits_corrupt),
    .auto_out_d_ready(widget_auto_out_d_ready),
    .auto_out_d_valid(widget_auto_out_d_valid),
    .auto_out_d_bits_opcode(widget_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(widget_auto_out_d_bits_param),
    .auto_out_d_bits_size(widget_auto_out_d_bits_size),
    .auto_out_d_bits_source(widget_auto_out_d_bits_source),
    .auto_out_d_bits_sink(widget_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(widget_auto_out_d_bits_denied),
    .auto_out_d_bits_data(widget_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(widget_auto_out_d_bits_corrupt)
  );
  assign auto_tlserial_manager_crossing_out_a_valid = shrinker_auto_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tlserial_manager_crossing_out_a_bits_opcode = shrinker_auto_out_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tlserial_manager_crossing_out_a_bits_param = shrinker_auto_out_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tlserial_manager_crossing_out_a_bits_size = shrinker_auto_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tlserial_manager_crossing_out_a_bits_source = shrinker_auto_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tlserial_manager_crossing_out_a_bits_address = shrinker_auto_out_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tlserial_manager_crossing_out_a_bits_mask = shrinker_auto_out_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tlserial_manager_crossing_out_a_bits_data = shrinker_auto_out_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tlserial_manager_crossing_out_a_bits_corrupt = shrinker_auto_out_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tlserial_manager_crossing_out_d_ready = shrinker_auto_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_in_a_ready = widget_auto_in_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tl_in_d_valid = widget_auto_in_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tl_in_d_bits_opcode = widget_auto_in_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tl_in_d_bits_param = widget_auto_in_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tl_in_d_bits_size = widget_auto_in_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tl_in_d_bits_source = widget_auto_in_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tl_in_d_bits_sink = widget_auto_in_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tl_in_d_bits_denied = widget_auto_in_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tl_in_d_bits_data = widget_auto_in_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tl_in_d_bits_corrupt = widget_auto_in_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign shrinker_clock = clock;
  assign shrinker_reset = reset;
  assign shrinker_auto_in_a_valid = widget_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign shrinker_auto_in_a_bits_opcode = widget_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign shrinker_auto_in_a_bits_param = widget_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign shrinker_auto_in_a_bits_size = widget_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign shrinker_auto_in_a_bits_source = widget_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign shrinker_auto_in_a_bits_address = widget_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign shrinker_auto_in_a_bits_mask = widget_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign shrinker_auto_in_a_bits_data = widget_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign shrinker_auto_in_a_bits_corrupt = widget_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign shrinker_auto_in_d_ready = widget_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign shrinker_auto_out_a_ready = auto_tlserial_manager_crossing_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign shrinker_auto_out_d_valid = auto_tlserial_manager_crossing_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign shrinker_auto_out_d_bits_opcode = auto_tlserial_manager_crossing_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign shrinker_auto_out_d_bits_param = auto_tlserial_manager_crossing_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign shrinker_auto_out_d_bits_size = auto_tlserial_manager_crossing_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign shrinker_auto_out_d_bits_source = auto_tlserial_manager_crossing_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign shrinker_auto_out_d_bits_sink = auto_tlserial_manager_crossing_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign shrinker_auto_out_d_bits_denied = auto_tlserial_manager_crossing_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign shrinker_auto_out_d_bits_data = auto_tlserial_manager_crossing_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign shrinker_auto_out_d_bits_corrupt = auto_tlserial_manager_crossing_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign widget_clock = clock;
  assign widget_reset = reset;
  assign widget_auto_in_a_valid = auto_tl_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_opcode = auto_tl_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_param = auto_tl_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_size = auto_tl_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_source = auto_tl_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_address = auto_tl_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_mask = auto_tl_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_data = auto_tl_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_corrupt = auto_tl_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign widget_auto_in_d_ready = auto_tl_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign widget_auto_out_a_ready = shrinker_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign widget_auto_out_d_valid = shrinker_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign widget_auto_out_d_bits_opcode = shrinker_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign widget_auto_out_d_bits_param = shrinker_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign widget_auto_out_d_bits_size = shrinker_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign widget_auto_out_d_bits_source = shrinker_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign widget_auto_out_d_bits_sink = shrinker_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign widget_auto_out_d_bits_denied = shrinker_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign widget_auto_out_d_bits_data = shrinker_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign widget_auto_out_d_bits_corrupt = shrinker_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
endmodule
