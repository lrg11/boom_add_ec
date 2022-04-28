module TLFIFOFixer_1(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [2:0]  auto_in_a_bits_size,
  input  [4:0]  auto_in_a_bits_source,
  input  [30:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [2:0]  auto_in_d_bits_size,
  output [4:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [2:0]  auto_out_a_bits_size,
  output [4:0]  auto_out_a_bits_source,
  output [30:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [2:0]  auto_out_d_bits_size,
  input  [4:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
);
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [4:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [30:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [4:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  TLMonitor_4 monitor ( // @[Nodes.scala 24:25]
    .clock(monitor_clock),
    .reset(monitor_reset),
    .io_in_a_ready(monitor_io_in_a_ready),
    .io_in_a_valid(monitor_io_in_a_valid),
    .io_in_a_bits_opcode(monitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(monitor_io_in_a_bits_param),
    .io_in_a_bits_size(monitor_io_in_a_bits_size),
    .io_in_a_bits_source(monitor_io_in_a_bits_source),
    .io_in_a_bits_address(monitor_io_in_a_bits_address),
    .io_in_a_bits_mask(monitor_io_in_a_bits_mask),
    .io_in_a_bits_data(monitor_io_in_a_bits_data),
    .io_in_a_bits_corrupt(monitor_io_in_a_bits_corrupt),
    .io_in_d_ready(monitor_io_in_d_ready),
    .io_in_d_valid(monitor_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(monitor_io_in_d_bits_param),
    .io_in_d_bits_size(monitor_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_io_in_d_bits_source),
    .io_in_d_bits_sink(monitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(monitor_io_in_d_bits_denied),
    .io_in_d_bits_data(monitor_io_in_d_bits_data),
    .io_in_d_bits_corrupt(monitor_io_in_d_bits_corrupt)
  );
  assign auto_in_a_ready = auto_out_a_ready; // @[FIFOFixer.scala 88:33]
  assign auto_in_d_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_out_a_valid = auto_in_a_valid; // @[FIFOFixer.scala 87:33]
  assign auto_out_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_out_a_ready; // @[FIFOFixer.scala 88:33]
  assign monitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
endmodule
