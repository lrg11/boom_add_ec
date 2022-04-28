module ClockSinkDomain_2(
  input         auto_serdesser_client_out_a_ready,
  output        auto_serdesser_client_out_a_valid,
  output [2:0]  auto_serdesser_client_out_a_bits_opcode,
  output [2:0]  auto_serdesser_client_out_a_bits_param,
  output [3:0]  auto_serdesser_client_out_a_bits_size,
  output        auto_serdesser_client_out_a_bits_source,
  output [31:0] auto_serdesser_client_out_a_bits_address,
  output [7:0]  auto_serdesser_client_out_a_bits_mask,
  output [63:0] auto_serdesser_client_out_a_bits_data,
  output        auto_serdesser_client_out_a_bits_corrupt,
  output        auto_serdesser_client_out_d_ready,
  input         auto_serdesser_client_out_d_valid,
  input  [2:0]  auto_serdesser_client_out_d_bits_opcode,
  input  [1:0]  auto_serdesser_client_out_d_bits_param,
  input  [3:0]  auto_serdesser_client_out_d_bits_size,
  input         auto_serdesser_client_out_d_bits_source,
  input  [1:0]  auto_serdesser_client_out_d_bits_sink,
  input         auto_serdesser_client_out_d_bits_denied,
  input  [63:0] auto_serdesser_client_out_d_bits_data,
  input         auto_serdesser_client_out_d_bits_corrupt,
  output        auto_tlserial_manager_crossing_in_a_ready,
  input         auto_tlserial_manager_crossing_in_a_valid,
  input  [2:0]  auto_tlserial_manager_crossing_in_a_bits_opcode,
  input  [2:0]  auto_tlserial_manager_crossing_in_a_bits_param,
  input  [2:0]  auto_tlserial_manager_crossing_in_a_bits_size,
  input  [3:0]  auto_tlserial_manager_crossing_in_a_bits_source,
  input  [28:0] auto_tlserial_manager_crossing_in_a_bits_address,
  input  [7:0]  auto_tlserial_manager_crossing_in_a_bits_mask,
  input  [63:0] auto_tlserial_manager_crossing_in_a_bits_data,
  input         auto_tlserial_manager_crossing_in_a_bits_corrupt,
  input         auto_tlserial_manager_crossing_in_d_ready,
  output        auto_tlserial_manager_crossing_in_d_valid,
  output [2:0]  auto_tlserial_manager_crossing_in_d_bits_opcode,
  output [1:0]  auto_tlserial_manager_crossing_in_d_bits_param,
  output [2:0]  auto_tlserial_manager_crossing_in_d_bits_size,
  output [3:0]  auto_tlserial_manager_crossing_in_d_bits_source,
  output        auto_tlserial_manager_crossing_in_d_bits_sink,
  output        auto_tlserial_manager_crossing_in_d_bits_denied,
  output [63:0] auto_tlserial_manager_crossing_in_d_bits_data,
  output        auto_tlserial_manager_crossing_in_d_bits_corrupt,
  input         auto_clock_in_clock,
  input         auto_clock_in_reset,
  output        serial_tl_in_ready,
  input         serial_tl_in_valid,
  input  [3:0]  serial_tl_in_bits,
  input         serial_tl_out_ready,
  output        serial_tl_out_valid,
  output [3:0]  serial_tl_out_bits,
  output        clock,
  output        reset
);
  wire  serdesser_clock; // @[SerialAdapter.scala 376:40]
  wire  serdesser_reset; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_manager_in_a_ready; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_manager_in_a_valid; // @[SerialAdapter.scala 376:40]
  wire [2:0] serdesser_auto_manager_in_a_bits_opcode; // @[SerialAdapter.scala 376:40]
  wire [2:0] serdesser_auto_manager_in_a_bits_param; // @[SerialAdapter.scala 376:40]
  wire [2:0] serdesser_auto_manager_in_a_bits_size; // @[SerialAdapter.scala 376:40]
  wire [3:0] serdesser_auto_manager_in_a_bits_source; // @[SerialAdapter.scala 376:40]
  wire [28:0] serdesser_auto_manager_in_a_bits_address; // @[SerialAdapter.scala 376:40]
  wire [7:0] serdesser_auto_manager_in_a_bits_mask; // @[SerialAdapter.scala 376:40]
  wire [63:0] serdesser_auto_manager_in_a_bits_data; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_manager_in_a_bits_corrupt; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_manager_in_d_ready; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_manager_in_d_valid; // @[SerialAdapter.scala 376:40]
  wire [2:0] serdesser_auto_manager_in_d_bits_opcode; // @[SerialAdapter.scala 376:40]
  wire [1:0] serdesser_auto_manager_in_d_bits_param; // @[SerialAdapter.scala 376:40]
  wire [2:0] serdesser_auto_manager_in_d_bits_size; // @[SerialAdapter.scala 376:40]
  wire [3:0] serdesser_auto_manager_in_d_bits_source; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_manager_in_d_bits_sink; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_manager_in_d_bits_denied; // @[SerialAdapter.scala 376:40]
  wire [63:0] serdesser_auto_manager_in_d_bits_data; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_manager_in_d_bits_corrupt; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_client_out_a_ready; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_client_out_a_valid; // @[SerialAdapter.scala 376:40]
  wire [2:0] serdesser_auto_client_out_a_bits_opcode; // @[SerialAdapter.scala 376:40]
  wire [2:0] serdesser_auto_client_out_a_bits_param; // @[SerialAdapter.scala 376:40]
  wire [3:0] serdesser_auto_client_out_a_bits_size; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_client_out_a_bits_source; // @[SerialAdapter.scala 376:40]
  wire [31:0] serdesser_auto_client_out_a_bits_address; // @[SerialAdapter.scala 376:40]
  wire [7:0] serdesser_auto_client_out_a_bits_mask; // @[SerialAdapter.scala 376:40]
  wire [63:0] serdesser_auto_client_out_a_bits_data; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_client_out_a_bits_corrupt; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_client_out_d_ready; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_client_out_d_valid; // @[SerialAdapter.scala 376:40]
  wire [2:0] serdesser_auto_client_out_d_bits_opcode; // @[SerialAdapter.scala 376:40]
  wire [1:0] serdesser_auto_client_out_d_bits_param; // @[SerialAdapter.scala 376:40]
  wire [3:0] serdesser_auto_client_out_d_bits_size; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_client_out_d_bits_source; // @[SerialAdapter.scala 376:40]
  wire [1:0] serdesser_auto_client_out_d_bits_sink; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_client_out_d_bits_denied; // @[SerialAdapter.scala 376:40]
  wire [63:0] serdesser_auto_client_out_d_bits_data; // @[SerialAdapter.scala 376:40]
  wire  serdesser_auto_client_out_d_bits_corrupt; // @[SerialAdapter.scala 376:40]
  wire  serdesser_io_ser_in_ready; // @[SerialAdapter.scala 376:40]
  wire  serdesser_io_ser_in_valid; // @[SerialAdapter.scala 376:40]
  wire [3:0] serdesser_io_ser_in_bits; // @[SerialAdapter.scala 376:40]
  wire  serdesser_io_ser_out_ready; // @[SerialAdapter.scala 376:40]
  wire  serdesser_io_ser_out_valid; // @[SerialAdapter.scala 376:40]
  wire [3:0] serdesser_io_ser_out_bits; // @[SerialAdapter.scala 376:40]
  wire  buffer_clock; // @[Buffer.scala 68:28]
  wire  buffer_reset; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [28:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [28:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  TLSerdesser serdesser ( // @[SerialAdapter.scala 376:40]
    .clock(serdesser_clock),
    .reset(serdesser_reset),
    .auto_manager_in_a_ready(serdesser_auto_manager_in_a_ready),
    .auto_manager_in_a_valid(serdesser_auto_manager_in_a_valid),
    .auto_manager_in_a_bits_opcode(serdesser_auto_manager_in_a_bits_opcode),
    .auto_manager_in_a_bits_param(serdesser_auto_manager_in_a_bits_param),
    .auto_manager_in_a_bits_size(serdesser_auto_manager_in_a_bits_size),
    .auto_manager_in_a_bits_source(serdesser_auto_manager_in_a_bits_source),
    .auto_manager_in_a_bits_address(serdesser_auto_manager_in_a_bits_address),
    .auto_manager_in_a_bits_mask(serdesser_auto_manager_in_a_bits_mask),
    .auto_manager_in_a_bits_data(serdesser_auto_manager_in_a_bits_data),
    .auto_manager_in_a_bits_corrupt(serdesser_auto_manager_in_a_bits_corrupt),
    .auto_manager_in_d_ready(serdesser_auto_manager_in_d_ready),
    .auto_manager_in_d_valid(serdesser_auto_manager_in_d_valid),
    .auto_manager_in_d_bits_opcode(serdesser_auto_manager_in_d_bits_opcode),
    .auto_manager_in_d_bits_param(serdesser_auto_manager_in_d_bits_param),
    .auto_manager_in_d_bits_size(serdesser_auto_manager_in_d_bits_size),
    .auto_manager_in_d_bits_source(serdesser_auto_manager_in_d_bits_source),
    .auto_manager_in_d_bits_sink(serdesser_auto_manager_in_d_bits_sink),
    .auto_manager_in_d_bits_denied(serdesser_auto_manager_in_d_bits_denied),
    .auto_manager_in_d_bits_data(serdesser_auto_manager_in_d_bits_data),
    .auto_manager_in_d_bits_corrupt(serdesser_auto_manager_in_d_bits_corrupt),
    .auto_client_out_a_ready(serdesser_auto_client_out_a_ready),
    .auto_client_out_a_valid(serdesser_auto_client_out_a_valid),
    .auto_client_out_a_bits_opcode(serdesser_auto_client_out_a_bits_opcode),
    .auto_client_out_a_bits_param(serdesser_auto_client_out_a_bits_param),
    .auto_client_out_a_bits_size(serdesser_auto_client_out_a_bits_size),
    .auto_client_out_a_bits_source(serdesser_auto_client_out_a_bits_source),
    .auto_client_out_a_bits_address(serdesser_auto_client_out_a_bits_address),
    .auto_client_out_a_bits_mask(serdesser_auto_client_out_a_bits_mask),
    .auto_client_out_a_bits_data(serdesser_auto_client_out_a_bits_data),
    .auto_client_out_a_bits_corrupt(serdesser_auto_client_out_a_bits_corrupt),
    .auto_client_out_d_ready(serdesser_auto_client_out_d_ready),
    .auto_client_out_d_valid(serdesser_auto_client_out_d_valid),
    .auto_client_out_d_bits_opcode(serdesser_auto_client_out_d_bits_opcode),
    .auto_client_out_d_bits_param(serdesser_auto_client_out_d_bits_param),
    .auto_client_out_d_bits_size(serdesser_auto_client_out_d_bits_size),
    .auto_client_out_d_bits_source(serdesser_auto_client_out_d_bits_source),
    .auto_client_out_d_bits_sink(serdesser_auto_client_out_d_bits_sink),
    .auto_client_out_d_bits_denied(serdesser_auto_client_out_d_bits_denied),
    .auto_client_out_d_bits_data(serdesser_auto_client_out_d_bits_data),
    .auto_client_out_d_bits_corrupt(serdesser_auto_client_out_d_bits_corrupt),
    .io_ser_in_ready(serdesser_io_ser_in_ready),
    .io_ser_in_valid(serdesser_io_ser_in_valid),
    .io_ser_in_bits(serdesser_io_ser_in_bits),
    .io_ser_out_ready(serdesser_io_ser_out_ready),
    .io_ser_out_valid(serdesser_io_ser_out_valid),
    .io_ser_out_bits(serdesser_io_ser_out_bits)
  );
  TLBuffer_16 buffer ( // @[Buffer.scala 68:28]
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
  assign auto_serdesser_client_out_a_valid = serdesser_auto_client_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_serdesser_client_out_a_bits_opcode = serdesser_auto_client_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_serdesser_client_out_a_bits_param = serdesser_auto_client_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_serdesser_client_out_a_bits_size = serdesser_auto_client_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_serdesser_client_out_a_bits_source = serdesser_auto_client_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_serdesser_client_out_a_bits_address = serdesser_auto_client_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_serdesser_client_out_a_bits_mask = serdesser_auto_client_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_serdesser_client_out_a_bits_data = serdesser_auto_client_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_serdesser_client_out_a_bits_corrupt = serdesser_auto_client_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_serdesser_client_out_d_ready = serdesser_auto_client_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_tlserial_manager_crossing_in_a_ready = buffer_auto_in_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tlserial_manager_crossing_in_d_valid = buffer_auto_in_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tlserial_manager_crossing_in_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tlserial_manager_crossing_in_d_bits_param = buffer_auto_in_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tlserial_manager_crossing_in_d_bits_size = buffer_auto_in_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tlserial_manager_crossing_in_d_bits_source = buffer_auto_in_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tlserial_manager_crossing_in_d_bits_sink = buffer_auto_in_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tlserial_manager_crossing_in_d_bits_denied = buffer_auto_in_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tlserial_manager_crossing_in_d_bits_data = buffer_auto_in_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_tlserial_manager_crossing_in_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign serial_tl_in_ready = serdesser_io_ser_in_ready; // @[SerialAdapter.scala 397:34]
  assign serial_tl_out_valid = serdesser_io_ser_out_valid; // @[SerialAdapter.scala 396:20]
  assign serial_tl_out_bits = serdesser_io_ser_out_bits; // @[SerialAdapter.scala 396:20]
  assign clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign serdesser_clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign serdesser_reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign serdesser_auto_manager_in_a_valid = buffer_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_param = buffer_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_size = buffer_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_source = buffer_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_address = buffer_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_mask = buffer_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_data = buffer_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_d_ready = buffer_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign serdesser_auto_client_out_a_ready = auto_serdesser_client_out_a_ready; // @[LazyModule.scala 311:12]
  assign serdesser_auto_client_out_d_valid = auto_serdesser_client_out_d_valid; // @[LazyModule.scala 311:12]
  assign serdesser_auto_client_out_d_bits_opcode = auto_serdesser_client_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign serdesser_auto_client_out_d_bits_param = auto_serdesser_client_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign serdesser_auto_client_out_d_bits_size = auto_serdesser_client_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign serdesser_auto_client_out_d_bits_source = auto_serdesser_client_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign serdesser_auto_client_out_d_bits_sink = auto_serdesser_client_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign serdesser_auto_client_out_d_bits_denied = auto_serdesser_client_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign serdesser_auto_client_out_d_bits_data = auto_serdesser_client_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign serdesser_auto_client_out_d_bits_corrupt = auto_serdesser_client_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign serdesser_io_ser_in_valid = serial_tl_in_valid; // @[SerialAdapter.scala 397:34]
  assign serdesser_io_ser_in_bits = serial_tl_in_bits; // @[SerialAdapter.scala 397:34]
  assign serdesser_io_ser_out_ready = serial_tl_out_ready; // @[SerialAdapter.scala 396:20]
  assign buffer_clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_valid = auto_tlserial_manager_crossing_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_opcode = auto_tlserial_manager_crossing_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_param = auto_tlserial_manager_crossing_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_size = auto_tlserial_manager_crossing_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_source = auto_tlserial_manager_crossing_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_address = auto_tlserial_manager_crossing_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_mask = auto_tlserial_manager_crossing_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_data = auto_tlserial_manager_crossing_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_corrupt = auto_tlserial_manager_crossing_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_d_ready = auto_tlserial_manager_crossing_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_a_ready = serdesser_auto_manager_in_a_ready; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_valid = serdesser_auto_manager_in_d_valid; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_opcode = serdesser_auto_manager_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_param = serdesser_auto_manager_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_size = serdesser_auto_manager_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_source = serdesser_auto_manager_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_sink = serdesser_auto_manager_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_denied = serdesser_auto_manager_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_data = serdesser_auto_manager_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_corrupt = serdesser_auto_manager_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
endmodule
