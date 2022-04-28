module ClockSinkDomain_1(
  output        auto_bootrom_in_a_ready,
  input         auto_bootrom_in_a_valid,
  input  [2:0]  auto_bootrom_in_a_bits_opcode,
  input  [2:0]  auto_bootrom_in_a_bits_param,
  input  [1:0]  auto_bootrom_in_a_bits_size,
  input  [8:0]  auto_bootrom_in_a_bits_source,
  input  [16:0] auto_bootrom_in_a_bits_address,
  input  [7:0]  auto_bootrom_in_a_bits_mask,
  input  [63:0] auto_bootrom_in_a_bits_data,
  input         auto_bootrom_in_a_bits_corrupt,
  input         auto_bootrom_in_d_ready,
  output        auto_bootrom_in_d_valid,
  output [2:0]  auto_bootrom_in_d_bits_opcode,
  output [1:0]  auto_bootrom_in_d_bits_param,
  output [1:0]  auto_bootrom_in_d_bits_size,
  output [8:0]  auto_bootrom_in_d_bits_source,
  output        auto_bootrom_in_d_bits_sink,
  output        auto_bootrom_in_d_bits_denied,
  output [63:0] auto_bootrom_in_d_bits_data,
  output        auto_bootrom_in_d_bits_corrupt,
  input         auto_clock_in_clock,
  input         auto_clock_in_reset,
  output        clock,
  output        reset
);
  wire  bootrom_clock; // @[BootROM.scala 81:17]
  wire  bootrom_reset; // @[BootROM.scala 81:17]
  wire  bootrom_auto_in_a_ready; // @[BootROM.scala 81:17]
  wire  bootrom_auto_in_a_valid; // @[BootROM.scala 81:17]
  wire [2:0] bootrom_auto_in_a_bits_opcode; // @[BootROM.scala 81:17]
  wire [2:0] bootrom_auto_in_a_bits_param; // @[BootROM.scala 81:17]
  wire [1:0] bootrom_auto_in_a_bits_size; // @[BootROM.scala 81:17]
  wire [8:0] bootrom_auto_in_a_bits_source; // @[BootROM.scala 81:17]
  wire [16:0] bootrom_auto_in_a_bits_address; // @[BootROM.scala 81:17]
  wire [7:0] bootrom_auto_in_a_bits_mask; // @[BootROM.scala 81:17]
  wire [63:0] bootrom_auto_in_a_bits_data; // @[BootROM.scala 81:17]
  wire  bootrom_auto_in_a_bits_corrupt; // @[BootROM.scala 81:17]
  wire  bootrom_auto_in_d_ready; // @[BootROM.scala 81:17]
  wire  bootrom_auto_in_d_valid; // @[BootROM.scala 81:17]
  wire [2:0] bootrom_auto_in_d_bits_opcode; // @[BootROM.scala 81:17]
  wire [1:0] bootrom_auto_in_d_bits_param; // @[BootROM.scala 81:17]
  wire [1:0] bootrom_auto_in_d_bits_size; // @[BootROM.scala 81:17]
  wire [8:0] bootrom_auto_in_d_bits_source; // @[BootROM.scala 81:17]
  wire  bootrom_auto_in_d_bits_sink; // @[BootROM.scala 81:17]
  wire  bootrom_auto_in_d_bits_denied; // @[BootROM.scala 81:17]
  wire [63:0] bootrom_auto_in_d_bits_data; // @[BootROM.scala 81:17]
  wire  bootrom_auto_in_d_bits_corrupt; // @[BootROM.scala 81:17]
  TLROM bootrom ( // @[BootROM.scala 81:17]
    .clock(bootrom_clock),
    .reset(bootrom_reset),
    .auto_in_a_ready(bootrom_auto_in_a_ready),
    .auto_in_a_valid(bootrom_auto_in_a_valid),
    .auto_in_a_bits_opcode(bootrom_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(bootrom_auto_in_a_bits_param),
    .auto_in_a_bits_size(bootrom_auto_in_a_bits_size),
    .auto_in_a_bits_source(bootrom_auto_in_a_bits_source),
    .auto_in_a_bits_address(bootrom_auto_in_a_bits_address),
    .auto_in_a_bits_mask(bootrom_auto_in_a_bits_mask),
    .auto_in_a_bits_data(bootrom_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(bootrom_auto_in_a_bits_corrupt),
    .auto_in_d_ready(bootrom_auto_in_d_ready),
    .auto_in_d_valid(bootrom_auto_in_d_valid),
    .auto_in_d_bits_opcode(bootrom_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(bootrom_auto_in_d_bits_param),
    .auto_in_d_bits_size(bootrom_auto_in_d_bits_size),
    .auto_in_d_bits_source(bootrom_auto_in_d_bits_source),
    .auto_in_d_bits_sink(bootrom_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(bootrom_auto_in_d_bits_denied),
    .auto_in_d_bits_data(bootrom_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(bootrom_auto_in_d_bits_corrupt)
  );
  assign auto_bootrom_in_a_ready = bootrom_auto_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_bootrom_in_d_valid = bootrom_auto_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_bootrom_in_d_bits_opcode = bootrom_auto_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_bootrom_in_d_bits_param = bootrom_auto_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_bootrom_in_d_bits_size = bootrom_auto_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_bootrom_in_d_bits_source = bootrom_auto_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_bootrom_in_d_bits_sink = bootrom_auto_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_bootrom_in_d_bits_denied = bootrom_auto_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_bootrom_in_d_bits_data = bootrom_auto_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_bootrom_in_d_bits_corrupt = bootrom_auto_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bootrom_clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bootrom_reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bootrom_auto_in_a_valid = auto_bootrom_in_a_valid; // @[LazyModule.scala 309:16]
  assign bootrom_auto_in_a_bits_opcode = auto_bootrom_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign bootrom_auto_in_a_bits_param = auto_bootrom_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign bootrom_auto_in_a_bits_size = auto_bootrom_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign bootrom_auto_in_a_bits_source = auto_bootrom_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign bootrom_auto_in_a_bits_address = auto_bootrom_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign bootrom_auto_in_a_bits_mask = auto_bootrom_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign bootrom_auto_in_a_bits_data = auto_bootrom_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign bootrom_auto_in_a_bits_corrupt = auto_bootrom_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign bootrom_auto_in_d_ready = auto_bootrom_in_d_ready; // @[LazyModule.scala 309:16]
endmodule
