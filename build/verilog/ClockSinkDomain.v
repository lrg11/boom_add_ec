module ClockSinkDomain(
  input         auto_plic_int_in_0,
  output        auto_plic_int_out_1_0,
  output        auto_plic_int_out_0_0,
  output        auto_plic_in_a_ready,
  input         auto_plic_in_a_valid,
  input  [2:0]  auto_plic_in_a_bits_opcode,
  input  [2:0]  auto_plic_in_a_bits_param,
  input  [1:0]  auto_plic_in_a_bits_size,
  input  [8:0]  auto_plic_in_a_bits_source,
  input  [27:0] auto_plic_in_a_bits_address,
  input  [7:0]  auto_plic_in_a_bits_mask,
  input  [63:0] auto_plic_in_a_bits_data,
  input         auto_plic_in_a_bits_corrupt,
  input         auto_plic_in_d_ready,
  output        auto_plic_in_d_valid,
  output [2:0]  auto_plic_in_d_bits_opcode,
  output [1:0]  auto_plic_in_d_bits_param,
  output [1:0]  auto_plic_in_d_bits_size,
  output [8:0]  auto_plic_in_d_bits_source,
  output        auto_plic_in_d_bits_sink,
  output        auto_plic_in_d_bits_denied,
  output [63:0] auto_plic_in_d_bits_data,
  output        auto_plic_in_d_bits_corrupt,
  input         auto_clock_in_clock,
  input         auto_clock_in_reset,
  output        clock,
  output        reset
);
  wire  plic_clock; // @[Plic.scala 362:46]
  wire  plic_reset; // @[Plic.scala 362:46]
  wire  plic_auto_int_in_0; // @[Plic.scala 362:46]
  wire  plic_auto_int_out_1_0; // @[Plic.scala 362:46]
  wire  plic_auto_int_out_0_0; // @[Plic.scala 362:46]
  wire  plic_auto_in_a_ready; // @[Plic.scala 362:46]
  wire  plic_auto_in_a_valid; // @[Plic.scala 362:46]
  wire [2:0] plic_auto_in_a_bits_opcode; // @[Plic.scala 362:46]
  wire [2:0] plic_auto_in_a_bits_param; // @[Plic.scala 362:46]
  wire [1:0] plic_auto_in_a_bits_size; // @[Plic.scala 362:46]
  wire [8:0] plic_auto_in_a_bits_source; // @[Plic.scala 362:46]
  wire [27:0] plic_auto_in_a_bits_address; // @[Plic.scala 362:46]
  wire [7:0] plic_auto_in_a_bits_mask; // @[Plic.scala 362:46]
  wire [63:0] plic_auto_in_a_bits_data; // @[Plic.scala 362:46]
  wire  plic_auto_in_a_bits_corrupt; // @[Plic.scala 362:46]
  wire  plic_auto_in_d_ready; // @[Plic.scala 362:46]
  wire  plic_auto_in_d_valid; // @[Plic.scala 362:46]
  wire [2:0] plic_auto_in_d_bits_opcode; // @[Plic.scala 362:46]
  wire [1:0] plic_auto_in_d_bits_param; // @[Plic.scala 362:46]
  wire [1:0] plic_auto_in_d_bits_size; // @[Plic.scala 362:46]
  wire [8:0] plic_auto_in_d_bits_source; // @[Plic.scala 362:46]
  wire  plic_auto_in_d_bits_sink; // @[Plic.scala 362:46]
  wire  plic_auto_in_d_bits_denied; // @[Plic.scala 362:46]
  wire [63:0] plic_auto_in_d_bits_data; // @[Plic.scala 362:46]
  wire  plic_auto_in_d_bits_corrupt; // @[Plic.scala 362:46]
  TLPLIC plic ( // @[Plic.scala 362:46]
    .clock(plic_clock),
    .reset(plic_reset),
    .auto_int_in_0(plic_auto_int_in_0),
    .auto_int_out_1_0(plic_auto_int_out_1_0),
    .auto_int_out_0_0(plic_auto_int_out_0_0),
    .auto_in_a_ready(plic_auto_in_a_ready),
    .auto_in_a_valid(plic_auto_in_a_valid),
    .auto_in_a_bits_opcode(plic_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(plic_auto_in_a_bits_param),
    .auto_in_a_bits_size(plic_auto_in_a_bits_size),
    .auto_in_a_bits_source(plic_auto_in_a_bits_source),
    .auto_in_a_bits_address(plic_auto_in_a_bits_address),
    .auto_in_a_bits_mask(plic_auto_in_a_bits_mask),
    .auto_in_a_bits_data(plic_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(plic_auto_in_a_bits_corrupt),
    .auto_in_d_ready(plic_auto_in_d_ready),
    .auto_in_d_valid(plic_auto_in_d_valid),
    .auto_in_d_bits_opcode(plic_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(plic_auto_in_d_bits_param),
    .auto_in_d_bits_size(plic_auto_in_d_bits_size),
    .auto_in_d_bits_source(plic_auto_in_d_bits_source),
    .auto_in_d_bits_sink(plic_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(plic_auto_in_d_bits_denied),
    .auto_in_d_bits_data(plic_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(plic_auto_in_d_bits_corrupt)
  );
  assign auto_plic_int_out_1_0 = plic_auto_int_out_1_0; // @[LazyModule.scala 311:12]
  assign auto_plic_int_out_0_0 = plic_auto_int_out_0_0; // @[LazyModule.scala 311:12]
  assign auto_plic_in_a_ready = plic_auto_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_plic_in_d_valid = plic_auto_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_plic_in_d_bits_opcode = plic_auto_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_plic_in_d_bits_param = plic_auto_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_plic_in_d_bits_size = plic_auto_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_plic_in_d_bits_source = plic_auto_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_plic_in_d_bits_sink = plic_auto_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_plic_in_d_bits_denied = plic_auto_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_plic_in_d_bits_data = plic_auto_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_plic_in_d_bits_corrupt = plic_auto_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign plic_clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign plic_reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign plic_auto_int_in_0 = auto_plic_int_in_0; // @[LazyModule.scala 309:16]
  assign plic_auto_in_a_valid = auto_plic_in_a_valid; // @[LazyModule.scala 309:16]
  assign plic_auto_in_a_bits_opcode = auto_plic_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign plic_auto_in_a_bits_param = auto_plic_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign plic_auto_in_a_bits_size = auto_plic_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign plic_auto_in_a_bits_source = auto_plic_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign plic_auto_in_a_bits_address = auto_plic_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign plic_auto_in_a_bits_mask = auto_plic_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign plic_auto_in_a_bits_data = auto_plic_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign plic_auto_in_a_bits_corrupt = auto_plic_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign plic_auto_in_d_ready = auto_plic_in_d_ready; // @[LazyModule.scala 309:16]
endmodule
