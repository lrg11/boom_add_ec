module TLInterconnectCoupler_2(
  input         clock,
  input         reset,
  output        auto_widget_in_a_ready,
  input         auto_widget_in_a_valid,
  input  [2:0]  auto_widget_in_a_bits_opcode,
  input  [2:0]  auto_widget_in_a_bits_param,
  input  [2:0]  auto_widget_in_a_bits_size,
  input  [3:0]  auto_widget_in_a_bits_source,
  input  [31:0] auto_widget_in_a_bits_address,
  input  [7:0]  auto_widget_in_a_bits_mask,
  input  [63:0] auto_widget_in_a_bits_data,
  input         auto_widget_in_a_bits_corrupt,
  input         auto_widget_in_b_ready,
  output        auto_widget_in_b_valid,
  output [2:0]  auto_widget_in_b_bits_opcode,
  output [1:0]  auto_widget_in_b_bits_param,
  output [2:0]  auto_widget_in_b_bits_size,
  output [3:0]  auto_widget_in_b_bits_source,
  output [31:0] auto_widget_in_b_bits_address,
  output [7:0]  auto_widget_in_b_bits_mask,
  output [63:0] auto_widget_in_b_bits_data,
  output        auto_widget_in_b_bits_corrupt,
  output        auto_widget_in_c_ready,
  input         auto_widget_in_c_valid,
  input  [2:0]  auto_widget_in_c_bits_opcode,
  input  [2:0]  auto_widget_in_c_bits_param,
  input  [2:0]  auto_widget_in_c_bits_size,
  input  [3:0]  auto_widget_in_c_bits_source,
  input  [31:0] auto_widget_in_c_bits_address,
  input  [63:0] auto_widget_in_c_bits_data,
  input         auto_widget_in_c_bits_corrupt,
  input         auto_widget_in_d_ready,
  output        auto_widget_in_d_valid,
  output [2:0]  auto_widget_in_d_bits_opcode,
  output [1:0]  auto_widget_in_d_bits_param,
  output [2:0]  auto_widget_in_d_bits_size,
  output [3:0]  auto_widget_in_d_bits_source,
  output [1:0]  auto_widget_in_d_bits_sink,
  output        auto_widget_in_d_bits_denied,
  output [63:0] auto_widget_in_d_bits_data,
  output        auto_widget_in_d_bits_corrupt,
  output        auto_widget_in_e_ready,
  input         auto_widget_in_e_valid,
  input  [1:0]  auto_widget_in_e_bits_sink,
  input         auto_widget_out_a_ready,
  output        auto_widget_out_a_valid,
  output [2:0]  auto_widget_out_a_bits_opcode,
  output [2:0]  auto_widget_out_a_bits_param,
  output [2:0]  auto_widget_out_a_bits_size,
  output [3:0]  auto_widget_out_a_bits_source,
  output [31:0] auto_widget_out_a_bits_address,
  output [7:0]  auto_widget_out_a_bits_mask,
  output [63:0] auto_widget_out_a_bits_data,
  output        auto_widget_out_a_bits_corrupt,
  output        auto_widget_out_b_ready,
  input         auto_widget_out_b_valid,
  input  [2:0]  auto_widget_out_b_bits_opcode,
  input  [1:0]  auto_widget_out_b_bits_param,
  input  [2:0]  auto_widget_out_b_bits_size,
  input  [3:0]  auto_widget_out_b_bits_source,
  input  [31:0] auto_widget_out_b_bits_address,
  input  [7:0]  auto_widget_out_b_bits_mask,
  input  [63:0] auto_widget_out_b_bits_data,
  input         auto_widget_out_b_bits_corrupt,
  input         auto_widget_out_c_ready,
  output        auto_widget_out_c_valid,
  output [2:0]  auto_widget_out_c_bits_opcode,
  output [2:0]  auto_widget_out_c_bits_param,
  output [2:0]  auto_widget_out_c_bits_size,
  output [3:0]  auto_widget_out_c_bits_source,
  output [31:0] auto_widget_out_c_bits_address,
  output [63:0] auto_widget_out_c_bits_data,
  output        auto_widget_out_c_bits_corrupt,
  output        auto_widget_out_d_ready,
  input         auto_widget_out_d_valid,
  input  [2:0]  auto_widget_out_d_bits_opcode,
  input  [1:0]  auto_widget_out_d_bits_param,
  input  [2:0]  auto_widget_out_d_bits_size,
  input  [3:0]  auto_widget_out_d_bits_source,
  input  [1:0]  auto_widget_out_d_bits_sink,
  input         auto_widget_out_d_bits_denied,
  input  [63:0] auto_widget_out_d_bits_data,
  input         auto_widget_out_d_bits_corrupt,
  input         auto_widget_out_e_ready,
  output        auto_widget_out_e_valid,
  output [1:0]  auto_widget_out_e_bits_sink
);
  wire  widget_clock; // @[WidthWidget.scala 212:28]
  wire  widget_reset; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_a_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_a_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_a_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_a_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_a_bits_size; // @[WidthWidget.scala 212:28]
  wire [3:0] widget_auto_in_a_bits_source; // @[WidthWidget.scala 212:28]
  wire [31:0] widget_auto_in_a_bits_address; // @[WidthWidget.scala 212:28]
  wire [7:0] widget_auto_in_a_bits_mask; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_in_a_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_a_bits_corrupt; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_b_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_b_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_b_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [1:0] widget_auto_in_b_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_b_bits_size; // @[WidthWidget.scala 212:28]
  wire [3:0] widget_auto_in_b_bits_source; // @[WidthWidget.scala 212:28]
  wire [31:0] widget_auto_in_b_bits_address; // @[WidthWidget.scala 212:28]
  wire [7:0] widget_auto_in_b_bits_mask; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_in_b_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_b_bits_corrupt; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_c_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_c_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_c_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_c_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_c_bits_size; // @[WidthWidget.scala 212:28]
  wire [3:0] widget_auto_in_c_bits_source; // @[WidthWidget.scala 212:28]
  wire [31:0] widget_auto_in_c_bits_address; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_in_c_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_c_bits_corrupt; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_d_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_d_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_d_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [1:0] widget_auto_in_d_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_in_d_bits_size; // @[WidthWidget.scala 212:28]
  wire [3:0] widget_auto_in_d_bits_source; // @[WidthWidget.scala 212:28]
  wire [1:0] widget_auto_in_d_bits_sink; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_d_bits_denied; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_in_d_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_d_bits_corrupt; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_e_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_in_e_valid; // @[WidthWidget.scala 212:28]
  wire [1:0] widget_auto_in_e_bits_sink; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_a_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_a_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_a_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_a_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_a_bits_size; // @[WidthWidget.scala 212:28]
  wire [3:0] widget_auto_out_a_bits_source; // @[WidthWidget.scala 212:28]
  wire [31:0] widget_auto_out_a_bits_address; // @[WidthWidget.scala 212:28]
  wire [7:0] widget_auto_out_a_bits_mask; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_out_a_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_a_bits_corrupt; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_b_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_b_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_b_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [1:0] widget_auto_out_b_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_b_bits_size; // @[WidthWidget.scala 212:28]
  wire [3:0] widget_auto_out_b_bits_source; // @[WidthWidget.scala 212:28]
  wire [31:0] widget_auto_out_b_bits_address; // @[WidthWidget.scala 212:28]
  wire [7:0] widget_auto_out_b_bits_mask; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_out_b_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_b_bits_corrupt; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_c_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_c_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_c_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_c_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_c_bits_size; // @[WidthWidget.scala 212:28]
  wire [3:0] widget_auto_out_c_bits_source; // @[WidthWidget.scala 212:28]
  wire [31:0] widget_auto_out_c_bits_address; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_out_c_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_c_bits_corrupt; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_d_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_d_valid; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_d_bits_opcode; // @[WidthWidget.scala 212:28]
  wire [1:0] widget_auto_out_d_bits_param; // @[WidthWidget.scala 212:28]
  wire [2:0] widget_auto_out_d_bits_size; // @[WidthWidget.scala 212:28]
  wire [3:0] widget_auto_out_d_bits_source; // @[WidthWidget.scala 212:28]
  wire [1:0] widget_auto_out_d_bits_sink; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_d_bits_denied; // @[WidthWidget.scala 212:28]
  wire [63:0] widget_auto_out_d_bits_data; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_d_bits_corrupt; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_e_ready; // @[WidthWidget.scala 212:28]
  wire  widget_auto_out_e_valid; // @[WidthWidget.scala 212:28]
  wire [1:0] widget_auto_out_e_bits_sink; // @[WidthWidget.scala 212:28]
  TLWidthWidget_2 widget ( // @[WidthWidget.scala 212:28]
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
    .auto_in_b_ready(widget_auto_in_b_ready),
    .auto_in_b_valid(widget_auto_in_b_valid),
    .auto_in_b_bits_opcode(widget_auto_in_b_bits_opcode),
    .auto_in_b_bits_param(widget_auto_in_b_bits_param),
    .auto_in_b_bits_size(widget_auto_in_b_bits_size),
    .auto_in_b_bits_source(widget_auto_in_b_bits_source),
    .auto_in_b_bits_address(widget_auto_in_b_bits_address),
    .auto_in_b_bits_mask(widget_auto_in_b_bits_mask),
    .auto_in_b_bits_data(widget_auto_in_b_bits_data),
    .auto_in_b_bits_corrupt(widget_auto_in_b_bits_corrupt),
    .auto_in_c_ready(widget_auto_in_c_ready),
    .auto_in_c_valid(widget_auto_in_c_valid),
    .auto_in_c_bits_opcode(widget_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(widget_auto_in_c_bits_param),
    .auto_in_c_bits_size(widget_auto_in_c_bits_size),
    .auto_in_c_bits_source(widget_auto_in_c_bits_source),
    .auto_in_c_bits_address(widget_auto_in_c_bits_address),
    .auto_in_c_bits_data(widget_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(widget_auto_in_c_bits_corrupt),
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
    .auto_in_e_ready(widget_auto_in_e_ready),
    .auto_in_e_valid(widget_auto_in_e_valid),
    .auto_in_e_bits_sink(widget_auto_in_e_bits_sink),
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
    .auto_out_b_ready(widget_auto_out_b_ready),
    .auto_out_b_valid(widget_auto_out_b_valid),
    .auto_out_b_bits_opcode(widget_auto_out_b_bits_opcode),
    .auto_out_b_bits_param(widget_auto_out_b_bits_param),
    .auto_out_b_bits_size(widget_auto_out_b_bits_size),
    .auto_out_b_bits_source(widget_auto_out_b_bits_source),
    .auto_out_b_bits_address(widget_auto_out_b_bits_address),
    .auto_out_b_bits_mask(widget_auto_out_b_bits_mask),
    .auto_out_b_bits_data(widget_auto_out_b_bits_data),
    .auto_out_b_bits_corrupt(widget_auto_out_b_bits_corrupt),
    .auto_out_c_ready(widget_auto_out_c_ready),
    .auto_out_c_valid(widget_auto_out_c_valid),
    .auto_out_c_bits_opcode(widget_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(widget_auto_out_c_bits_param),
    .auto_out_c_bits_size(widget_auto_out_c_bits_size),
    .auto_out_c_bits_source(widget_auto_out_c_bits_source),
    .auto_out_c_bits_address(widget_auto_out_c_bits_address),
    .auto_out_c_bits_data(widget_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt(widget_auto_out_c_bits_corrupt),
    .auto_out_d_ready(widget_auto_out_d_ready),
    .auto_out_d_valid(widget_auto_out_d_valid),
    .auto_out_d_bits_opcode(widget_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(widget_auto_out_d_bits_param),
    .auto_out_d_bits_size(widget_auto_out_d_bits_size),
    .auto_out_d_bits_source(widget_auto_out_d_bits_source),
    .auto_out_d_bits_sink(widget_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(widget_auto_out_d_bits_denied),
    .auto_out_d_bits_data(widget_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(widget_auto_out_d_bits_corrupt),
    .auto_out_e_ready(widget_auto_out_e_ready),
    .auto_out_e_valid(widget_auto_out_e_valid),
    .auto_out_e_bits_sink(widget_auto_out_e_bits_sink)
  );
  assign auto_widget_in_a_ready = widget_auto_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_widget_in_b_valid = widget_auto_in_b_valid; // @[LazyModule.scala 309:16]
  assign auto_widget_in_b_bits_opcode = widget_auto_in_b_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_widget_in_b_bits_param = widget_auto_in_b_bits_param; // @[LazyModule.scala 309:16]
  assign auto_widget_in_b_bits_size = widget_auto_in_b_bits_size; // @[LazyModule.scala 309:16]
  assign auto_widget_in_b_bits_source = widget_auto_in_b_bits_source; // @[LazyModule.scala 309:16]
  assign auto_widget_in_b_bits_address = widget_auto_in_b_bits_address; // @[LazyModule.scala 309:16]
  assign auto_widget_in_b_bits_mask = widget_auto_in_b_bits_mask; // @[LazyModule.scala 309:16]
  assign auto_widget_in_b_bits_data = widget_auto_in_b_bits_data; // @[LazyModule.scala 309:16]
  assign auto_widget_in_b_bits_corrupt = widget_auto_in_b_bits_corrupt; // @[LazyModule.scala 309:16]
  assign auto_widget_in_c_ready = widget_auto_in_c_ready; // @[LazyModule.scala 309:16]
  assign auto_widget_in_d_valid = widget_auto_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_widget_in_d_bits_opcode = widget_auto_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_widget_in_d_bits_param = widget_auto_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_widget_in_d_bits_size = widget_auto_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_widget_in_d_bits_source = widget_auto_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_widget_in_d_bits_sink = widget_auto_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_widget_in_d_bits_denied = widget_auto_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_widget_in_d_bits_data = widget_auto_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_widget_in_d_bits_corrupt = widget_auto_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign auto_widget_in_e_ready = widget_auto_in_e_ready; // @[LazyModule.scala 309:16]
  assign auto_widget_out_a_valid = widget_auto_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_widget_out_a_bits_opcode = widget_auto_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_widget_out_a_bits_param = widget_auto_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_widget_out_a_bits_size = widget_auto_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_widget_out_a_bits_source = widget_auto_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_widget_out_a_bits_address = widget_auto_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_widget_out_a_bits_mask = widget_auto_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_widget_out_a_bits_data = widget_auto_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_widget_out_a_bits_corrupt = widget_auto_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_widget_out_b_ready = widget_auto_out_b_ready; // @[LazyModule.scala 311:12]
  assign auto_widget_out_c_valid = widget_auto_out_c_valid; // @[LazyModule.scala 311:12]
  assign auto_widget_out_c_bits_opcode = widget_auto_out_c_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_widget_out_c_bits_param = widget_auto_out_c_bits_param; // @[LazyModule.scala 311:12]
  assign auto_widget_out_c_bits_size = widget_auto_out_c_bits_size; // @[LazyModule.scala 311:12]
  assign auto_widget_out_c_bits_source = widget_auto_out_c_bits_source; // @[LazyModule.scala 311:12]
  assign auto_widget_out_c_bits_address = widget_auto_out_c_bits_address; // @[LazyModule.scala 311:12]
  assign auto_widget_out_c_bits_data = widget_auto_out_c_bits_data; // @[LazyModule.scala 311:12]
  assign auto_widget_out_c_bits_corrupt = widget_auto_out_c_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_widget_out_d_ready = widget_auto_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_widget_out_e_valid = widget_auto_out_e_valid; // @[LazyModule.scala 311:12]
  assign auto_widget_out_e_bits_sink = widget_auto_out_e_bits_sink; // @[LazyModule.scala 311:12]
  assign widget_clock = clock;
  assign widget_reset = reset;
  assign widget_auto_in_a_valid = auto_widget_in_a_valid; // @[LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_opcode = auto_widget_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_param = auto_widget_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_size = auto_widget_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_source = auto_widget_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_address = auto_widget_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_mask = auto_widget_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_data = auto_widget_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign widget_auto_in_a_bits_corrupt = auto_widget_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign widget_auto_in_b_ready = auto_widget_in_b_ready; // @[LazyModule.scala 309:16]
  assign widget_auto_in_c_valid = auto_widget_in_c_valid; // @[LazyModule.scala 309:16]
  assign widget_auto_in_c_bits_opcode = auto_widget_in_c_bits_opcode; // @[LazyModule.scala 309:16]
  assign widget_auto_in_c_bits_param = auto_widget_in_c_bits_param; // @[LazyModule.scala 309:16]
  assign widget_auto_in_c_bits_size = auto_widget_in_c_bits_size; // @[LazyModule.scala 309:16]
  assign widget_auto_in_c_bits_source = auto_widget_in_c_bits_source; // @[LazyModule.scala 309:16]
  assign widget_auto_in_c_bits_address = auto_widget_in_c_bits_address; // @[LazyModule.scala 309:16]
  assign widget_auto_in_c_bits_data = auto_widget_in_c_bits_data; // @[LazyModule.scala 309:16]
  assign widget_auto_in_c_bits_corrupt = auto_widget_in_c_bits_corrupt; // @[LazyModule.scala 309:16]
  assign widget_auto_in_d_ready = auto_widget_in_d_ready; // @[LazyModule.scala 309:16]
  assign widget_auto_in_e_valid = auto_widget_in_e_valid; // @[LazyModule.scala 309:16]
  assign widget_auto_in_e_bits_sink = auto_widget_in_e_bits_sink; // @[LazyModule.scala 309:16]
  assign widget_auto_out_a_ready = auto_widget_out_a_ready; // @[LazyModule.scala 311:12]
  assign widget_auto_out_b_valid = auto_widget_out_b_valid; // @[LazyModule.scala 311:12]
  assign widget_auto_out_b_bits_opcode = auto_widget_out_b_bits_opcode; // @[LazyModule.scala 311:12]
  assign widget_auto_out_b_bits_param = auto_widget_out_b_bits_param; // @[LazyModule.scala 311:12]
  assign widget_auto_out_b_bits_size = auto_widget_out_b_bits_size; // @[LazyModule.scala 311:12]
  assign widget_auto_out_b_bits_source = auto_widget_out_b_bits_source; // @[LazyModule.scala 311:12]
  assign widget_auto_out_b_bits_address = auto_widget_out_b_bits_address; // @[LazyModule.scala 311:12]
  assign widget_auto_out_b_bits_mask = auto_widget_out_b_bits_mask; // @[LazyModule.scala 311:12]
  assign widget_auto_out_b_bits_data = auto_widget_out_b_bits_data; // @[LazyModule.scala 311:12]
  assign widget_auto_out_b_bits_corrupt = auto_widget_out_b_bits_corrupt; // @[LazyModule.scala 311:12]
  assign widget_auto_out_c_ready = auto_widget_out_c_ready; // @[LazyModule.scala 311:12]
  assign widget_auto_out_d_valid = auto_widget_out_d_valid; // @[LazyModule.scala 311:12]
  assign widget_auto_out_d_bits_opcode = auto_widget_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign widget_auto_out_d_bits_param = auto_widget_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign widget_auto_out_d_bits_size = auto_widget_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign widget_auto_out_d_bits_source = auto_widget_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign widget_auto_out_d_bits_sink = auto_widget_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign widget_auto_out_d_bits_denied = auto_widget_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign widget_auto_out_d_bits_data = auto_widget_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign widget_auto_out_d_bits_corrupt = auto_widget_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign widget_auto_out_e_ready = auto_widget_out_e_ready; // @[LazyModule.scala 311:12]
endmodule
