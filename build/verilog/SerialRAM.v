module SerialRAM(
  input         clock,
  input         reset,
  input         io_ser_in_ready,
  output        io_ser_in_valid,
  output [3:0]  io_ser_in_bits,
  output        io_ser_out_ready,
  input         io_ser_out_valid,
  input  [3:0]  io_ser_out_bits,
  output        io_tsi_ser_in_ready,
  input         io_tsi_ser_in_valid,
  input  [31:0] io_tsi_ser_in_bits,
  input         io_tsi_ser_out_ready,
  output        io_tsi_ser_out_valid,
  output [31:0] io_tsi_ser_out_bits
);
  wire  adapter_clock; // @[SerialAdapter.scala 446:27]
  wire  adapter_reset; // @[SerialAdapter.scala 446:27]
  wire  adapter_auto_out_a_ready; // @[SerialAdapter.scala 446:27]
  wire  adapter_auto_out_a_valid; // @[SerialAdapter.scala 446:27]
  wire [2:0] adapter_auto_out_a_bits_opcode; // @[SerialAdapter.scala 446:27]
  wire [2:0] adapter_auto_out_a_bits_param; // @[SerialAdapter.scala 446:27]
  wire [3:0] adapter_auto_out_a_bits_size; // @[SerialAdapter.scala 446:27]
  wire  adapter_auto_out_a_bits_source; // @[SerialAdapter.scala 446:27]
  wire [31:0] adapter_auto_out_a_bits_address; // @[SerialAdapter.scala 446:27]
  wire [7:0] adapter_auto_out_a_bits_mask; // @[SerialAdapter.scala 446:27]
  wire [63:0] adapter_auto_out_a_bits_data; // @[SerialAdapter.scala 446:27]
  wire  adapter_auto_out_a_bits_corrupt; // @[SerialAdapter.scala 446:27]
  wire  adapter_auto_out_d_ready; // @[SerialAdapter.scala 446:27]
  wire  adapter_auto_out_d_valid; // @[SerialAdapter.scala 446:27]
  wire [2:0] adapter_auto_out_d_bits_opcode; // @[SerialAdapter.scala 446:27]
  wire [1:0] adapter_auto_out_d_bits_param; // @[SerialAdapter.scala 446:27]
  wire [3:0] adapter_auto_out_d_bits_size; // @[SerialAdapter.scala 446:27]
  wire  adapter_auto_out_d_bits_source; // @[SerialAdapter.scala 446:27]
  wire [1:0] adapter_auto_out_d_bits_sink; // @[SerialAdapter.scala 446:27]
  wire  adapter_auto_out_d_bits_denied; // @[SerialAdapter.scala 446:27]
  wire [63:0] adapter_auto_out_d_bits_data; // @[SerialAdapter.scala 446:27]
  wire  adapter_auto_out_d_bits_corrupt; // @[SerialAdapter.scala 446:27]
  wire  adapter_io_serial_in_ready; // @[SerialAdapter.scala 446:27]
  wire  adapter_io_serial_in_valid; // @[SerialAdapter.scala 446:27]
  wire [31:0] adapter_io_serial_in_bits; // @[SerialAdapter.scala 446:27]
  wire  adapter_io_serial_out_ready; // @[SerialAdapter.scala 446:27]
  wire  adapter_io_serial_out_valid; // @[SerialAdapter.scala 446:27]
  wire [31:0] adapter_io_serial_out_bits; // @[SerialAdapter.scala 446:27]
  wire  serdesser_clock; // @[SerialAdapter.scala 447:29]
  wire  serdesser_reset; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_manager_in_a_ready; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_manager_in_a_valid; // @[SerialAdapter.scala 447:29]
  wire [2:0] serdesser_auto_manager_in_a_bits_opcode; // @[SerialAdapter.scala 447:29]
  wire [2:0] serdesser_auto_manager_in_a_bits_param; // @[SerialAdapter.scala 447:29]
  wire [3:0] serdesser_auto_manager_in_a_bits_size; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_manager_in_a_bits_source; // @[SerialAdapter.scala 447:29]
  wire [31:0] serdesser_auto_manager_in_a_bits_address; // @[SerialAdapter.scala 447:29]
  wire [7:0] serdesser_auto_manager_in_a_bits_mask; // @[SerialAdapter.scala 447:29]
  wire [63:0] serdesser_auto_manager_in_a_bits_data; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_manager_in_a_bits_corrupt; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_manager_in_d_ready; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_manager_in_d_valid; // @[SerialAdapter.scala 447:29]
  wire [2:0] serdesser_auto_manager_in_d_bits_opcode; // @[SerialAdapter.scala 447:29]
  wire [1:0] serdesser_auto_manager_in_d_bits_param; // @[SerialAdapter.scala 447:29]
  wire [3:0] serdesser_auto_manager_in_d_bits_size; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_manager_in_d_bits_source; // @[SerialAdapter.scala 447:29]
  wire [1:0] serdesser_auto_manager_in_d_bits_sink; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_manager_in_d_bits_denied; // @[SerialAdapter.scala 447:29]
  wire [63:0] serdesser_auto_manager_in_d_bits_data; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_manager_in_d_bits_corrupt; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_client_out_a_ready; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_client_out_a_valid; // @[SerialAdapter.scala 447:29]
  wire [2:0] serdesser_auto_client_out_a_bits_opcode; // @[SerialAdapter.scala 447:29]
  wire [2:0] serdesser_auto_client_out_a_bits_param; // @[SerialAdapter.scala 447:29]
  wire [2:0] serdesser_auto_client_out_a_bits_size; // @[SerialAdapter.scala 447:29]
  wire [3:0] serdesser_auto_client_out_a_bits_source; // @[SerialAdapter.scala 447:29]
  wire [28:0] serdesser_auto_client_out_a_bits_address; // @[SerialAdapter.scala 447:29]
  wire [7:0] serdesser_auto_client_out_a_bits_mask; // @[SerialAdapter.scala 447:29]
  wire [63:0] serdesser_auto_client_out_a_bits_data; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_client_out_a_bits_corrupt; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_client_out_d_ready; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_client_out_d_valid; // @[SerialAdapter.scala 447:29]
  wire [2:0] serdesser_auto_client_out_d_bits_opcode; // @[SerialAdapter.scala 447:29]
  wire [1:0] serdesser_auto_client_out_d_bits_param; // @[SerialAdapter.scala 447:29]
  wire [2:0] serdesser_auto_client_out_d_bits_size; // @[SerialAdapter.scala 447:29]
  wire [3:0] serdesser_auto_client_out_d_bits_source; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_client_out_d_bits_sink; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_client_out_d_bits_denied; // @[SerialAdapter.scala 447:29]
  wire [63:0] serdesser_auto_client_out_d_bits_data; // @[SerialAdapter.scala 447:29]
  wire  serdesser_auto_client_out_d_bits_corrupt; // @[SerialAdapter.scala 447:29]
  wire  serdesser_io_ser_in_ready; // @[SerialAdapter.scala 447:29]
  wire  serdesser_io_ser_in_valid; // @[SerialAdapter.scala 447:29]
  wire [3:0] serdesser_io_ser_in_bits; // @[SerialAdapter.scala 447:29]
  wire  serdesser_io_ser_out_ready; // @[SerialAdapter.scala 447:29]
  wire  serdesser_io_ser_out_valid; // @[SerialAdapter.scala 447:29]
  wire [3:0] serdesser_io_ser_out_bits; // @[SerialAdapter.scala 447:29]
  wire  srams_clock; // @[SerialAdapter.scala 454:15]
  wire  srams_reset; // @[SerialAdapter.scala 454:15]
  wire  srams_auto_in_a_ready; // @[SerialAdapter.scala 454:15]
  wire  srams_auto_in_a_valid; // @[SerialAdapter.scala 454:15]
  wire [2:0] srams_auto_in_a_bits_opcode; // @[SerialAdapter.scala 454:15]
  wire [2:0] srams_auto_in_a_bits_param; // @[SerialAdapter.scala 454:15]
  wire [1:0] srams_auto_in_a_bits_size; // @[SerialAdapter.scala 454:15]
  wire [7:0] srams_auto_in_a_bits_source; // @[SerialAdapter.scala 454:15]
  wire [28:0] srams_auto_in_a_bits_address; // @[SerialAdapter.scala 454:15]
  wire [7:0] srams_auto_in_a_bits_mask; // @[SerialAdapter.scala 454:15]
  wire [63:0] srams_auto_in_a_bits_data; // @[SerialAdapter.scala 454:15]
  wire  srams_auto_in_a_bits_corrupt; // @[SerialAdapter.scala 454:15]
  wire  srams_auto_in_d_ready; // @[SerialAdapter.scala 454:15]
  wire  srams_auto_in_d_valid; // @[SerialAdapter.scala 454:15]
  wire [2:0] srams_auto_in_d_bits_opcode; // @[SerialAdapter.scala 454:15]
  wire [1:0] srams_auto_in_d_bits_param; // @[SerialAdapter.scala 454:15]
  wire [1:0] srams_auto_in_d_bits_size; // @[SerialAdapter.scala 454:15]
  wire [7:0] srams_auto_in_d_bits_source; // @[SerialAdapter.scala 454:15]
  wire  srams_auto_in_d_bits_sink; // @[SerialAdapter.scala 454:15]
  wire  srams_auto_in_d_bits_denied; // @[SerialAdapter.scala 454:15]
  wire [63:0] srams_auto_in_d_bits_data; // @[SerialAdapter.scala 454:15]
  wire  srams_auto_in_d_bits_corrupt; // @[SerialAdapter.scala 454:15]
  wire  rom_clock; // @[SerialAdapter.scala 433:25]
  wire  rom_reset; // @[SerialAdapter.scala 433:25]
  wire  rom_auto_in_a_ready; // @[SerialAdapter.scala 433:25]
  wire  rom_auto_in_a_valid; // @[SerialAdapter.scala 433:25]
  wire [2:0] rom_auto_in_a_bits_opcode; // @[SerialAdapter.scala 433:25]
  wire [2:0] rom_auto_in_a_bits_param; // @[SerialAdapter.scala 433:25]
  wire [1:0] rom_auto_in_a_bits_size; // @[SerialAdapter.scala 433:25]
  wire [7:0] rom_auto_in_a_bits_source; // @[SerialAdapter.scala 433:25]
  wire [17:0] rom_auto_in_a_bits_address; // @[SerialAdapter.scala 433:25]
  wire [7:0] rom_auto_in_a_bits_mask; // @[SerialAdapter.scala 433:25]
  wire [63:0] rom_auto_in_a_bits_data; // @[SerialAdapter.scala 433:25]
  wire  rom_auto_in_a_bits_corrupt; // @[SerialAdapter.scala 433:25]
  wire  rom_auto_in_d_ready; // @[SerialAdapter.scala 433:25]
  wire  rom_auto_in_d_valid; // @[SerialAdapter.scala 433:25]
  wire [2:0] rom_auto_in_d_bits_opcode; // @[SerialAdapter.scala 433:25]
  wire [1:0] rom_auto_in_d_bits_param; // @[SerialAdapter.scala 433:25]
  wire [1:0] rom_auto_in_d_bits_size; // @[SerialAdapter.scala 433:25]
  wire [7:0] rom_auto_in_d_bits_source; // @[SerialAdapter.scala 433:25]
  wire  rom_auto_in_d_bits_sink; // @[SerialAdapter.scala 433:25]
  wire  rom_auto_in_d_bits_denied; // @[SerialAdapter.scala 433:25]
  wire [63:0] rom_auto_in_d_bits_data; // @[SerialAdapter.scala 433:25]
  wire  rom_auto_in_d_bits_corrupt; // @[SerialAdapter.scala 433:25]
  wire  xbar_clock; // @[Xbar.scala 142:26]
  wire  xbar_reset; // @[Xbar.scala 142:26]
  wire  xbar_auto_in_a_ready; // @[Xbar.scala 142:26]
  wire  xbar_auto_in_a_valid; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_in_a_bits_opcode; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_in_a_bits_param; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_in_a_bits_size; // @[Xbar.scala 142:26]
  wire [3:0] xbar_auto_in_a_bits_source; // @[Xbar.scala 142:26]
  wire [28:0] xbar_auto_in_a_bits_address; // @[Xbar.scala 142:26]
  wire [7:0] xbar_auto_in_a_bits_mask; // @[Xbar.scala 142:26]
  wire [63:0] xbar_auto_in_a_bits_data; // @[Xbar.scala 142:26]
  wire  xbar_auto_in_a_bits_corrupt; // @[Xbar.scala 142:26]
  wire  xbar_auto_in_d_ready; // @[Xbar.scala 142:26]
  wire  xbar_auto_in_d_valid; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_in_d_bits_opcode; // @[Xbar.scala 142:26]
  wire [1:0] xbar_auto_in_d_bits_param; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_in_d_bits_size; // @[Xbar.scala 142:26]
  wire [3:0] xbar_auto_in_d_bits_source; // @[Xbar.scala 142:26]
  wire  xbar_auto_in_d_bits_sink; // @[Xbar.scala 142:26]
  wire  xbar_auto_in_d_bits_denied; // @[Xbar.scala 142:26]
  wire [63:0] xbar_auto_in_d_bits_data; // @[Xbar.scala 142:26]
  wire  xbar_auto_in_d_bits_corrupt; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_1_a_ready; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_1_a_valid; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_out_1_a_bits_opcode; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_out_1_a_bits_param; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_out_1_a_bits_size; // @[Xbar.scala 142:26]
  wire [3:0] xbar_auto_out_1_a_bits_source; // @[Xbar.scala 142:26]
  wire [17:0] xbar_auto_out_1_a_bits_address; // @[Xbar.scala 142:26]
  wire [7:0] xbar_auto_out_1_a_bits_mask; // @[Xbar.scala 142:26]
  wire [63:0] xbar_auto_out_1_a_bits_data; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_1_a_bits_corrupt; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_1_d_ready; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_1_d_valid; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_out_1_d_bits_opcode; // @[Xbar.scala 142:26]
  wire [1:0] xbar_auto_out_1_d_bits_param; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_out_1_d_bits_size; // @[Xbar.scala 142:26]
  wire [3:0] xbar_auto_out_1_d_bits_source; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_1_d_bits_sink; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_1_d_bits_denied; // @[Xbar.scala 142:26]
  wire [63:0] xbar_auto_out_1_d_bits_data; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_1_d_bits_corrupt; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_0_a_ready; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_0_a_valid; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_out_0_a_bits_opcode; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_out_0_a_bits_param; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_out_0_a_bits_size; // @[Xbar.scala 142:26]
  wire [3:0] xbar_auto_out_0_a_bits_source; // @[Xbar.scala 142:26]
  wire [28:0] xbar_auto_out_0_a_bits_address; // @[Xbar.scala 142:26]
  wire [7:0] xbar_auto_out_0_a_bits_mask; // @[Xbar.scala 142:26]
  wire [63:0] xbar_auto_out_0_a_bits_data; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_0_a_bits_corrupt; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_0_d_ready; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_0_d_valid; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_out_0_d_bits_opcode; // @[Xbar.scala 142:26]
  wire [1:0] xbar_auto_out_0_d_bits_param; // @[Xbar.scala 142:26]
  wire [2:0] xbar_auto_out_0_d_bits_size; // @[Xbar.scala 142:26]
  wire [3:0] xbar_auto_out_0_d_bits_source; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_0_d_bits_sink; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_0_d_bits_denied; // @[Xbar.scala 142:26]
  wire [63:0] xbar_auto_out_0_d_bits_data; // @[Xbar.scala 142:26]
  wire  xbar_auto_out_0_d_bits_corrupt; // @[Xbar.scala 142:26]
  wire  buffer_clock; // @[Buffer.scala 68:28]
  wire  buffer_reset; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [28:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [28:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_d_bits_source; // @[Buffer.scala 68:28]
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
  wire [3:0] fragmenter_auto_in_a_bits_source; // @[Fragmenter.scala 333:34]
  wire [28:0] fragmenter_auto_in_a_bits_address; // @[Fragmenter.scala 333:34]
  wire [7:0] fragmenter_auto_in_a_bits_mask; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_auto_in_a_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_a_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_d_ready; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_d_valid; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_in_d_bits_opcode; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_auto_in_d_bits_param; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_in_d_bits_size; // @[Fragmenter.scala 333:34]
  wire [3:0] fragmenter_auto_in_d_bits_source; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_d_bits_sink; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_d_bits_denied; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_auto_in_d_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_in_d_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_a_ready; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_a_valid; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_out_a_bits_opcode; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_out_a_bits_param; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_auto_out_a_bits_size; // @[Fragmenter.scala 333:34]
  wire [7:0] fragmenter_auto_out_a_bits_source; // @[Fragmenter.scala 333:34]
  wire [28:0] fragmenter_auto_out_a_bits_address; // @[Fragmenter.scala 333:34]
  wire [7:0] fragmenter_auto_out_a_bits_mask; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_auto_out_a_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_a_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_d_ready; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_d_valid; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_auto_out_d_bits_opcode; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_auto_out_d_bits_param; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_auto_out_d_bits_size; // @[Fragmenter.scala 333:34]
  wire [7:0] fragmenter_auto_out_d_bits_source; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_d_bits_sink; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_d_bits_denied; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_auto_out_d_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_auto_out_d_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_clock; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_reset; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_in_a_ready; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_in_a_valid; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_1_auto_in_a_bits_opcode; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_1_auto_in_a_bits_param; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_1_auto_in_a_bits_size; // @[Fragmenter.scala 333:34]
  wire [3:0] fragmenter_1_auto_in_a_bits_source; // @[Fragmenter.scala 333:34]
  wire [17:0] fragmenter_1_auto_in_a_bits_address; // @[Fragmenter.scala 333:34]
  wire [7:0] fragmenter_1_auto_in_a_bits_mask; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_1_auto_in_a_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_in_a_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_in_d_ready; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_in_d_valid; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_1_auto_in_d_bits_opcode; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_1_auto_in_d_bits_param; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_1_auto_in_d_bits_size; // @[Fragmenter.scala 333:34]
  wire [3:0] fragmenter_1_auto_in_d_bits_source; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_in_d_bits_sink; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_in_d_bits_denied; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_1_auto_in_d_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_in_d_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_out_a_ready; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_out_a_valid; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_1_auto_out_a_bits_opcode; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_1_auto_out_a_bits_param; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_1_auto_out_a_bits_size; // @[Fragmenter.scala 333:34]
  wire [7:0] fragmenter_1_auto_out_a_bits_source; // @[Fragmenter.scala 333:34]
  wire [17:0] fragmenter_1_auto_out_a_bits_address; // @[Fragmenter.scala 333:34]
  wire [7:0] fragmenter_1_auto_out_a_bits_mask; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_1_auto_out_a_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_out_a_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_out_d_ready; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_out_d_valid; // @[Fragmenter.scala 333:34]
  wire [2:0] fragmenter_1_auto_out_d_bits_opcode; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_1_auto_out_d_bits_param; // @[Fragmenter.scala 333:34]
  wire [1:0] fragmenter_1_auto_out_d_bits_size; // @[Fragmenter.scala 333:34]
  wire [7:0] fragmenter_1_auto_out_d_bits_source; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_out_d_bits_sink; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_out_d_bits_denied; // @[Fragmenter.scala 333:34]
  wire [63:0] fragmenter_1_auto_out_d_bits_data; // @[Fragmenter.scala 333:34]
  wire  fragmenter_1_auto_out_d_bits_corrupt; // @[Fragmenter.scala 333:34]
  wire  buffer_1_clock; // @[Buffer.scala 68:28]
  wire  buffer_1_reset; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  SerialAdapter adapter ( // @[SerialAdapter.scala 446:27]
    .clock(adapter_clock),
    .reset(adapter_reset),
    .auto_out_a_ready(adapter_auto_out_a_ready),
    .auto_out_a_valid(adapter_auto_out_a_valid),
    .auto_out_a_bits_opcode(adapter_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(adapter_auto_out_a_bits_param),
    .auto_out_a_bits_size(adapter_auto_out_a_bits_size),
    .auto_out_a_bits_source(adapter_auto_out_a_bits_source),
    .auto_out_a_bits_address(adapter_auto_out_a_bits_address),
    .auto_out_a_bits_mask(adapter_auto_out_a_bits_mask),
    .auto_out_a_bits_data(adapter_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(adapter_auto_out_a_bits_corrupt),
    .auto_out_d_ready(adapter_auto_out_d_ready),
    .auto_out_d_valid(adapter_auto_out_d_valid),
    .auto_out_d_bits_opcode(adapter_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(adapter_auto_out_d_bits_param),
    .auto_out_d_bits_size(adapter_auto_out_d_bits_size),
    .auto_out_d_bits_source(adapter_auto_out_d_bits_source),
    .auto_out_d_bits_sink(adapter_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(adapter_auto_out_d_bits_denied),
    .auto_out_d_bits_data(adapter_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(adapter_auto_out_d_bits_corrupt),
    .io_serial_in_ready(adapter_io_serial_in_ready),
    .io_serial_in_valid(adapter_io_serial_in_valid),
    .io_serial_in_bits(adapter_io_serial_in_bits),
    .io_serial_out_ready(adapter_io_serial_out_ready),
    .io_serial_out_valid(adapter_io_serial_out_valid),
    .io_serial_out_bits(adapter_io_serial_out_bits)
  );
  TLSerdesser_1 serdesser ( // @[SerialAdapter.scala 447:29]
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
  TLRAM srams ( // @[SerialAdapter.scala 454:15]
    .clock(srams_clock),
    .reset(srams_reset),
    .auto_in_a_ready(srams_auto_in_a_ready),
    .auto_in_a_valid(srams_auto_in_a_valid),
    .auto_in_a_bits_opcode(srams_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(srams_auto_in_a_bits_param),
    .auto_in_a_bits_size(srams_auto_in_a_bits_size),
    .auto_in_a_bits_source(srams_auto_in_a_bits_source),
    .auto_in_a_bits_address(srams_auto_in_a_bits_address),
    .auto_in_a_bits_mask(srams_auto_in_a_bits_mask),
    .auto_in_a_bits_data(srams_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(srams_auto_in_a_bits_corrupt),
    .auto_in_d_ready(srams_auto_in_d_ready),
    .auto_in_d_valid(srams_auto_in_d_valid),
    .auto_in_d_bits_opcode(srams_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(srams_auto_in_d_bits_param),
    .auto_in_d_bits_size(srams_auto_in_d_bits_size),
    .auto_in_d_bits_source(srams_auto_in_d_bits_source),
    .auto_in_d_bits_sink(srams_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(srams_auto_in_d_bits_denied),
    .auto_in_d_bits_data(srams_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(srams_auto_in_d_bits_corrupt)
  );
  TLROM_1 rom ( // @[SerialAdapter.scala 433:25]
    .clock(rom_clock),
    .reset(rom_reset),
    .auto_in_a_ready(rom_auto_in_a_ready),
    .auto_in_a_valid(rom_auto_in_a_valid),
    .auto_in_a_bits_opcode(rom_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(rom_auto_in_a_bits_param),
    .auto_in_a_bits_size(rom_auto_in_a_bits_size),
    .auto_in_a_bits_source(rom_auto_in_a_bits_source),
    .auto_in_a_bits_address(rom_auto_in_a_bits_address),
    .auto_in_a_bits_mask(rom_auto_in_a_bits_mask),
    .auto_in_a_bits_data(rom_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(rom_auto_in_a_bits_corrupt),
    .auto_in_d_ready(rom_auto_in_d_ready),
    .auto_in_d_valid(rom_auto_in_d_valid),
    .auto_in_d_bits_opcode(rom_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(rom_auto_in_d_bits_param),
    .auto_in_d_bits_size(rom_auto_in_d_bits_size),
    .auto_in_d_bits_source(rom_auto_in_d_bits_source),
    .auto_in_d_bits_sink(rom_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(rom_auto_in_d_bits_denied),
    .auto_in_d_bits_data(rom_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(rom_auto_in_d_bits_corrupt)
  );
  TLXbar_10 xbar ( // @[Xbar.scala 142:26]
    .clock(xbar_clock),
    .reset(xbar_reset),
    .auto_in_a_ready(xbar_auto_in_a_ready),
    .auto_in_a_valid(xbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(xbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(xbar_auto_in_a_bits_param),
    .auto_in_a_bits_size(xbar_auto_in_a_bits_size),
    .auto_in_a_bits_source(xbar_auto_in_a_bits_source),
    .auto_in_a_bits_address(xbar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(xbar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(xbar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(xbar_auto_in_a_bits_corrupt),
    .auto_in_d_ready(xbar_auto_in_d_ready),
    .auto_in_d_valid(xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode(xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size(xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source(xbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink(xbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(xbar_auto_in_d_bits_corrupt),
    .auto_out_1_a_ready(xbar_auto_out_1_a_ready),
    .auto_out_1_a_valid(xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(xbar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready(xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid(xbar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(xbar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(xbar_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(xbar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(xbar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_sink(xbar_auto_out_1_d_bits_sink),
    .auto_out_1_d_bits_denied(xbar_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(xbar_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(xbar_auto_out_1_d_bits_corrupt),
    .auto_out_0_a_ready(xbar_auto_out_0_a_ready),
    .auto_out_0_a_valid(xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid(xbar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(xbar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(xbar_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(xbar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(xbar_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(xbar_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(xbar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(xbar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(xbar_auto_out_0_d_bits_corrupt)
  );
  TLBuffer_18 buffer ( // @[Buffer.scala 68:28]
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
  TLFragmenter_7 fragmenter ( // @[Fragmenter.scala 333:34]
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
  TLFragmenter_8 fragmenter_1 ( // @[Fragmenter.scala 333:34]
    .clock(fragmenter_1_clock),
    .reset(fragmenter_1_reset),
    .auto_in_a_ready(fragmenter_1_auto_in_a_ready),
    .auto_in_a_valid(fragmenter_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(fragmenter_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(fragmenter_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(fragmenter_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(fragmenter_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(fragmenter_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(fragmenter_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fragmenter_1_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(fragmenter_1_auto_in_a_bits_corrupt),
    .auto_in_d_ready(fragmenter_1_auto_in_d_ready),
    .auto_in_d_valid(fragmenter_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(fragmenter_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(fragmenter_1_auto_in_d_bits_param),
    .auto_in_d_bits_size(fragmenter_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(fragmenter_1_auto_in_d_bits_source),
    .auto_in_d_bits_sink(fragmenter_1_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(fragmenter_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(fragmenter_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(fragmenter_1_auto_in_d_bits_corrupt),
    .auto_out_a_ready(fragmenter_1_auto_out_a_ready),
    .auto_out_a_valid(fragmenter_1_auto_out_a_valid),
    .auto_out_a_bits_opcode(fragmenter_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(fragmenter_1_auto_out_a_bits_param),
    .auto_out_a_bits_size(fragmenter_1_auto_out_a_bits_size),
    .auto_out_a_bits_source(fragmenter_1_auto_out_a_bits_source),
    .auto_out_a_bits_address(fragmenter_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask(fragmenter_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fragmenter_1_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(fragmenter_1_auto_out_a_bits_corrupt),
    .auto_out_d_ready(fragmenter_1_auto_out_d_ready),
    .auto_out_d_valid(fragmenter_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(fragmenter_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(fragmenter_1_auto_out_d_bits_param),
    .auto_out_d_bits_size(fragmenter_1_auto_out_d_bits_size),
    .auto_out_d_bits_source(fragmenter_1_auto_out_d_bits_source),
    .auto_out_d_bits_sink(fragmenter_1_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(fragmenter_1_auto_out_d_bits_denied),
    .auto_out_d_bits_data(fragmenter_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(fragmenter_1_auto_out_d_bits_corrupt)
  );
  TLBuffer_19 buffer_1 ( // @[Buffer.scala 68:28]
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
  assign io_ser_in_valid = serdesser_io_ser_out_valid; // @[SerialAdapter.scala 476:15]
  assign io_ser_in_bits = serdesser_io_ser_out_bits; // @[SerialAdapter.scala 476:15]
  assign io_ser_out_ready = serdesser_io_ser_in_ready; // @[SerialAdapter.scala 475:32]
  assign io_tsi_ser_in_ready = adapter_io_serial_in_ready; // @[SerialAdapter.scala 477:16]
  assign io_tsi_ser_out_valid = adapter_io_serial_out_valid; // @[SerialAdapter.scala 477:16]
  assign io_tsi_ser_out_bits = adapter_io_serial_out_bits; // @[SerialAdapter.scala 477:16]
  assign adapter_clock = clock;
  assign adapter_reset = reset;
  assign adapter_auto_out_a_ready = buffer_1_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign adapter_auto_out_d_valid = buffer_1_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign adapter_auto_out_d_bits_opcode = buffer_1_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign adapter_auto_out_d_bits_param = buffer_1_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign adapter_auto_out_d_bits_size = buffer_1_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign adapter_auto_out_d_bits_source = buffer_1_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign adapter_auto_out_d_bits_sink = buffer_1_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign adapter_auto_out_d_bits_denied = buffer_1_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign adapter_auto_out_d_bits_data = buffer_1_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign adapter_auto_out_d_bits_corrupt = buffer_1_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign adapter_io_serial_in_valid = io_tsi_ser_in_valid; // @[SerialAdapter.scala 477:16]
  assign adapter_io_serial_in_bits = io_tsi_ser_in_bits; // @[SerialAdapter.scala 477:16]
  assign adapter_io_serial_out_ready = io_tsi_ser_out_ready; // @[SerialAdapter.scala 477:16]
  assign serdesser_clock = clock;
  assign serdesser_reset = reset;
  assign serdesser_auto_manager_in_a_valid = buffer_1_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_opcode = buffer_1_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_param = buffer_1_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_size = buffer_1_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_source = buffer_1_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_address = buffer_1_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_mask = buffer_1_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_data = buffer_1_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_a_bits_corrupt = buffer_1_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign serdesser_auto_manager_in_d_ready = buffer_1_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign serdesser_auto_client_out_a_ready = xbar_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign serdesser_auto_client_out_d_valid = xbar_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign serdesser_auto_client_out_d_bits_opcode = xbar_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign serdesser_auto_client_out_d_bits_param = xbar_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign serdesser_auto_client_out_d_bits_size = xbar_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign serdesser_auto_client_out_d_bits_source = xbar_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign serdesser_auto_client_out_d_bits_sink = xbar_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign serdesser_auto_client_out_d_bits_denied = xbar_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign serdesser_auto_client_out_d_bits_data = xbar_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign serdesser_auto_client_out_d_bits_corrupt = xbar_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign serdesser_io_ser_in_valid = io_ser_out_valid; // @[SerialAdapter.scala 475:32]
  assign serdesser_io_ser_in_bits = io_ser_out_bits; // @[SerialAdapter.scala 475:32]
  assign serdesser_io_ser_out_ready = io_ser_in_ready; // @[SerialAdapter.scala 476:15]
  assign srams_clock = clock;
  assign srams_reset = reset;
  assign srams_auto_in_a_valid = buffer_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign srams_auto_in_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign srams_auto_in_a_bits_param = buffer_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign srams_auto_in_a_bits_size = buffer_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign srams_auto_in_a_bits_source = buffer_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign srams_auto_in_a_bits_address = buffer_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign srams_auto_in_a_bits_mask = buffer_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign srams_auto_in_a_bits_data = buffer_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign srams_auto_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign srams_auto_in_d_ready = buffer_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign rom_clock = clock;
  assign rom_reset = reset;
  assign rom_auto_in_a_valid = fragmenter_1_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign rom_auto_in_a_bits_opcode = fragmenter_1_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign rom_auto_in_a_bits_param = fragmenter_1_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign rom_auto_in_a_bits_size = fragmenter_1_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign rom_auto_in_a_bits_source = fragmenter_1_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign rom_auto_in_a_bits_address = fragmenter_1_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign rom_auto_in_a_bits_mask = fragmenter_1_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign rom_auto_in_a_bits_data = fragmenter_1_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign rom_auto_in_a_bits_corrupt = fragmenter_1_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign rom_auto_in_d_ready = fragmenter_1_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign xbar_clock = clock;
  assign xbar_reset = reset;
  assign xbar_auto_in_a_valid = serdesser_auto_client_out_a_valid; // @[LazyModule.scala 298:16]
  assign xbar_auto_in_a_bits_opcode = serdesser_auto_client_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign xbar_auto_in_a_bits_param = serdesser_auto_client_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign xbar_auto_in_a_bits_size = serdesser_auto_client_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign xbar_auto_in_a_bits_source = serdesser_auto_client_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign xbar_auto_in_a_bits_address = serdesser_auto_client_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign xbar_auto_in_a_bits_mask = serdesser_auto_client_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign xbar_auto_in_a_bits_data = serdesser_auto_client_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign xbar_auto_in_a_bits_corrupt = serdesser_auto_client_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign xbar_auto_in_d_ready = serdesser_auto_client_out_d_ready; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_1_a_ready = fragmenter_1_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_1_d_valid = fragmenter_1_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_1_d_bits_opcode = fragmenter_1_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_1_d_bits_param = fragmenter_1_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_1_d_bits_size = fragmenter_1_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_1_d_bits_source = fragmenter_1_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_1_d_bits_sink = fragmenter_1_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_1_d_bits_denied = fragmenter_1_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_1_d_bits_data = fragmenter_1_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_1_d_bits_corrupt = fragmenter_1_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_0_a_ready = fragmenter_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_0_d_valid = fragmenter_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_0_d_bits_opcode = fragmenter_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_0_d_bits_param = fragmenter_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_0_d_bits_size = fragmenter_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_0_d_bits_source = fragmenter_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_0_d_bits_sink = fragmenter_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_0_d_bits_denied = fragmenter_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_0_d_bits_data = fragmenter_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign xbar_auto_out_0_d_bits_corrupt = fragmenter_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
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
  assign buffer_auto_out_a_ready = srams_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_valid = srams_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_opcode = srams_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_param = srams_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_size = srams_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_source = srams_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_sink = srams_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_denied = srams_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_data = srams_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_corrupt = srams_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign fragmenter_clock = clock;
  assign fragmenter_reset = reset;
  assign fragmenter_auto_in_a_valid = xbar_auto_out_0_a_valid; // @[LazyModule.scala 298:16]
  assign fragmenter_auto_in_a_bits_opcode = xbar_auto_out_0_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign fragmenter_auto_in_a_bits_param = xbar_auto_out_0_a_bits_param; // @[LazyModule.scala 298:16]
  assign fragmenter_auto_in_a_bits_size = xbar_auto_out_0_a_bits_size; // @[LazyModule.scala 298:16]
  assign fragmenter_auto_in_a_bits_source = xbar_auto_out_0_a_bits_source; // @[LazyModule.scala 298:16]
  assign fragmenter_auto_in_a_bits_address = xbar_auto_out_0_a_bits_address; // @[LazyModule.scala 298:16]
  assign fragmenter_auto_in_a_bits_mask = xbar_auto_out_0_a_bits_mask; // @[LazyModule.scala 298:16]
  assign fragmenter_auto_in_a_bits_data = xbar_auto_out_0_a_bits_data; // @[LazyModule.scala 298:16]
  assign fragmenter_auto_in_a_bits_corrupt = xbar_auto_out_0_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign fragmenter_auto_in_d_ready = xbar_auto_out_0_d_ready; // @[LazyModule.scala 298:16]
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
  assign fragmenter_1_clock = clock;
  assign fragmenter_1_reset = reset;
  assign fragmenter_1_auto_in_a_valid = xbar_auto_out_1_a_valid; // @[LazyModule.scala 298:16]
  assign fragmenter_1_auto_in_a_bits_opcode = xbar_auto_out_1_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign fragmenter_1_auto_in_a_bits_param = xbar_auto_out_1_a_bits_param; // @[LazyModule.scala 298:16]
  assign fragmenter_1_auto_in_a_bits_size = xbar_auto_out_1_a_bits_size; // @[LazyModule.scala 298:16]
  assign fragmenter_1_auto_in_a_bits_source = xbar_auto_out_1_a_bits_source; // @[LazyModule.scala 298:16]
  assign fragmenter_1_auto_in_a_bits_address = xbar_auto_out_1_a_bits_address; // @[LazyModule.scala 298:16]
  assign fragmenter_1_auto_in_a_bits_mask = xbar_auto_out_1_a_bits_mask; // @[LazyModule.scala 298:16]
  assign fragmenter_1_auto_in_a_bits_data = xbar_auto_out_1_a_bits_data; // @[LazyModule.scala 298:16]
  assign fragmenter_1_auto_in_a_bits_corrupt = xbar_auto_out_1_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign fragmenter_1_auto_in_d_ready = xbar_auto_out_1_d_ready; // @[LazyModule.scala 298:16]
  assign fragmenter_1_auto_out_a_ready = rom_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign fragmenter_1_auto_out_d_valid = rom_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign fragmenter_1_auto_out_d_bits_opcode = rom_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign fragmenter_1_auto_out_d_bits_param = rom_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign fragmenter_1_auto_out_d_bits_size = rom_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign fragmenter_1_auto_out_d_bits_source = rom_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign fragmenter_1_auto_out_d_bits_sink = rom_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign fragmenter_1_auto_out_d_bits_denied = rom_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign fragmenter_1_auto_out_d_bits_data = rom_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign fragmenter_1_auto_out_d_bits_corrupt = rom_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign buffer_1_clock = clock;
  assign buffer_1_reset = reset;
  assign buffer_1_auto_in_a_valid = adapter_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_opcode = adapter_auto_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_param = adapter_auto_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_size = adapter_auto_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_source = adapter_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_address = adapter_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_mask = adapter_auto_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_data = adapter_auto_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_corrupt = adapter_auto_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_d_ready = adapter_auto_out_d_ready; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_out_a_ready = serdesser_auto_manager_in_a_ready; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_valid = serdesser_auto_manager_in_d_valid; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_opcode = serdesser_auto_manager_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_param = serdesser_auto_manager_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_size = serdesser_auto_manager_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_source = serdesser_auto_manager_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_sink = serdesser_auto_manager_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_denied = serdesser_auto_manager_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_data = serdesser_auto_manager_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_corrupt = serdesser_auto_manager_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
endmodule
