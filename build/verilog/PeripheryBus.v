module PeripheryBus(
  input         auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_ready,
  output        auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_valid,
  output [2:0]  auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_param,
  output [1:0]  auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_size,
  output [8:0]  auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_source,
  output [20:0] auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_address,
  output [7:0]  auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_mask,
  output [63:0] auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_data,
  output        auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_corrupt,
  output        auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_ready,
  input         auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_valid,
  input  [2:0]  auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_param,
  input  [1:0]  auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_size,
  input  [8:0]  auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_source,
  input         auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_sink,
  input         auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_denied,
  input  [63:0] auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_data,
  input         auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_corrupt,
  input         auto_coupler_to_device_named_uart_0_control_xing_out_a_ready,
  output        auto_coupler_to_device_named_uart_0_control_xing_out_a_valid,
  output [2:0]  auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_param,
  output [1:0]  auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_size,
  output [8:0]  auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_source,
  output [30:0] auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_address,
  output [7:0]  auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_mask,
  output [63:0] auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_data,
  output        auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_corrupt,
  output        auto_coupler_to_device_named_uart_0_control_xing_out_d_ready,
  input         auto_coupler_to_device_named_uart_0_control_xing_out_d_valid,
  input  [2:0]  auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_param,
  input  [1:0]  auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_size,
  input  [8:0]  auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_source,
  input         auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_sink,
  input         auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_denied,
  input  [63:0] auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_data,
  input         auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_corrupt,
  output        auto_fixedClockNode_out_1_clock,
  output        auto_fixedClockNode_out_1_reset,
  output        auto_fixedClockNode_out_0_clock,
  output        auto_fixedClockNode_out_0_reset,
  input         auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock,
  input         auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset,
  output        auto_bus_xing_in_a_ready,
  input         auto_bus_xing_in_a_valid,
  input  [2:0]  auto_bus_xing_in_a_bits_opcode,
  input  [2:0]  auto_bus_xing_in_a_bits_param,
  input  [2:0]  auto_bus_xing_in_a_bits_size,
  input  [4:0]  auto_bus_xing_in_a_bits_source,
  input  [30:0] auto_bus_xing_in_a_bits_address,
  input  [7:0]  auto_bus_xing_in_a_bits_mask,
  input  [63:0] auto_bus_xing_in_a_bits_data,
  input         auto_bus_xing_in_a_bits_corrupt,
  input         auto_bus_xing_in_d_ready,
  output        auto_bus_xing_in_d_valid,
  output [2:0]  auto_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_bus_xing_in_d_bits_param,
  output [2:0]  auto_bus_xing_in_d_bits_size,
  output [4:0]  auto_bus_xing_in_d_bits_source,
  output        auto_bus_xing_in_d_bits_sink,
  output        auto_bus_xing_in_d_bits_denied,
  output [63:0] auto_bus_xing_in_d_bits_data,
  output        auto_bus_xing_in_d_bits_corrupt,
  output        clock,
  output        reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_reset; // @[BusWrapper.scala 40:48]
  wire  subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_reset; // @[BusWrapper.scala 40:48]
  wire  clockGroup_auto_in_member_subsystem_pbus_0_clock; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_in_member_subsystem_pbus_0_reset; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_out_clock; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_out_reset; // @[BusWrapper.scala 41:38]
  wire  fixedClockNode_auto_in_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_in_reset; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_2_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_2_reset; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_1_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_1_reset; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_0_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_0_reset; // @[ClockGroup.scala 106:107]
  wire  broadcast_clock; // @[BundleBridge.scala 196:31]
  wire  broadcast_reset; // @[BundleBridge.scala 196:31]
  wire  fixer_clock; // @[PeripheryBus.scala 47:33]
  wire  fixer_reset; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_a_ready; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_a_valid; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_in_a_bits_opcode; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_in_a_bits_param; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_in_a_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_in_a_bits_source; // @[PeripheryBus.scala 47:33]
  wire [30:0] fixer_auto_in_a_bits_address; // @[PeripheryBus.scala 47:33]
  wire [7:0] fixer_auto_in_a_bits_mask; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_in_a_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_a_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_ready; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_valid; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_in_d_bits_opcode; // @[PeripheryBus.scala 47:33]
  wire [1:0] fixer_auto_in_d_bits_param; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_in_d_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_in_d_bits_source; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_bits_sink; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_bits_denied; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_in_d_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_a_ready; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_a_valid; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_out_a_bits_opcode; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_out_a_bits_param; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_out_a_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_out_a_bits_source; // @[PeripheryBus.scala 47:33]
  wire [30:0] fixer_auto_out_a_bits_address; // @[PeripheryBus.scala 47:33]
  wire [7:0] fixer_auto_out_a_bits_mask; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_out_a_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_a_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_ready; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_valid; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_out_d_bits_opcode; // @[PeripheryBus.scala 47:33]
  wire [1:0] fixer_auto_out_d_bits_param; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_out_d_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_out_d_bits_source; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_bits_sink; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_bits_denied; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_out_d_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  in_xbar_clock; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_reset; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_a_ready; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_a_valid; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_in_a_bits_opcode; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_in_a_bits_param; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_in_a_bits_size; // @[PeripheryBus.scala 49:29]
  wire [4:0] in_xbar_auto_in_a_bits_source; // @[PeripheryBus.scala 49:29]
  wire [30:0] in_xbar_auto_in_a_bits_address; // @[PeripheryBus.scala 49:29]
  wire [7:0] in_xbar_auto_in_a_bits_mask; // @[PeripheryBus.scala 49:29]
  wire [63:0] in_xbar_auto_in_a_bits_data; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_a_bits_corrupt; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_d_ready; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_d_valid; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_in_d_bits_opcode; // @[PeripheryBus.scala 49:29]
  wire [1:0] in_xbar_auto_in_d_bits_param; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_in_d_bits_size; // @[PeripheryBus.scala 49:29]
  wire [4:0] in_xbar_auto_in_d_bits_source; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_d_bits_sink; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_d_bits_denied; // @[PeripheryBus.scala 49:29]
  wire [63:0] in_xbar_auto_in_d_bits_data; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_d_bits_corrupt; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_a_ready; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_a_valid; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_out_a_bits_opcode; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_out_a_bits_param; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_out_a_bits_size; // @[PeripheryBus.scala 49:29]
  wire [4:0] in_xbar_auto_out_a_bits_source; // @[PeripheryBus.scala 49:29]
  wire [30:0] in_xbar_auto_out_a_bits_address; // @[PeripheryBus.scala 49:29]
  wire [7:0] in_xbar_auto_out_a_bits_mask; // @[PeripheryBus.scala 49:29]
  wire [63:0] in_xbar_auto_out_a_bits_data; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_a_bits_corrupt; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_d_ready; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_d_valid; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_out_d_bits_opcode; // @[PeripheryBus.scala 49:29]
  wire [1:0] in_xbar_auto_out_d_bits_param; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_out_d_bits_size; // @[PeripheryBus.scala 49:29]
  wire [4:0] in_xbar_auto_out_d_bits_source; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_d_bits_sink; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_d_bits_denied; // @[PeripheryBus.scala 49:29]
  wire [63:0] in_xbar_auto_out_d_bits_data; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_d_bits_corrupt; // @[PeripheryBus.scala 49:29]
  wire  out_xbar_clock; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_reset; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_in_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_in_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_in_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_in_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [30:0] out_xbar_auto_in_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_in_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_in_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_in_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [1:0] out_xbar_auto_in_d_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_in_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_in_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_bits_sink; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_bits_denied; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_in_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_2_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [20:0] out_xbar_auto_out_2_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_2_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_2_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [1:0] out_xbar_auto_out_2_d_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_2_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_d_bits_sink; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_d_bits_denied; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_2_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_d_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_1_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_1_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_1_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_1_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [30:0] out_xbar_auto_out_1_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_1_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_1_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_1_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [1:0] out_xbar_auto_out_1_d_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_1_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_1_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_d_bits_sink; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_d_bits_denied; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_1_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_d_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_0_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_0_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_0_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_0_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [14:0] out_xbar_auto_out_0_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_0_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_0_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_0_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [1:0] out_xbar_auto_out_0_d_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_0_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_0_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_bits_sink; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_bits_denied; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_0_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  buffer_clock; // @[Buffer.scala 68:28]
  wire  buffer_reset; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [30:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [30:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  atomics_clock; // @[AtomicAutomata.scala 283:29]
  wire  atomics_reset; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_a_ready; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_a_valid; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_in_a_bits_opcode; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_in_a_bits_param; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_in_a_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_in_a_bits_source; // @[AtomicAutomata.scala 283:29]
  wire [30:0] atomics_auto_in_a_bits_address; // @[AtomicAutomata.scala 283:29]
  wire [7:0] atomics_auto_in_a_bits_mask; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_in_a_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_a_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_ready; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_valid; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_in_d_bits_opcode; // @[AtomicAutomata.scala 283:29]
  wire [1:0] atomics_auto_in_d_bits_param; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_in_d_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_in_d_bits_source; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_bits_sink; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_bits_denied; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_in_d_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_a_ready; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_a_valid; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_out_a_bits_opcode; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_out_a_bits_param; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_out_a_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_out_a_bits_source; // @[AtomicAutomata.scala 283:29]
  wire [30:0] atomics_auto_out_a_bits_address; // @[AtomicAutomata.scala 283:29]
  wire [7:0] atomics_auto_out_a_bits_mask; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_out_a_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_a_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_ready; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_valid; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_out_d_bits_opcode; // @[AtomicAutomata.scala 283:29]
  wire [1:0] atomics_auto_out_d_bits_param; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_out_d_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_out_d_bits_source; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_bits_sink; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_bits_denied; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_out_d_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  buffer_1_clock; // @[Buffer.scala 68:28]
  wire  buffer_1_reset; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_1_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [30:0] buffer_1_auto_in_a_bits_address; // @[Buffer.scala 68:28]
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
  wire [30:0] buffer_1_auto_out_a_bits_address; // @[Buffer.scala 68:28]
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
  wire  coupler_to_slave_named_bootaddressreg_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [14:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [14:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_control_xing_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_control_xing_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [30:0] coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_control_xing_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_control_xing_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_device_named_uart_0_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_device_named_uart_0_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_device_named_uart_0_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_device_named_uart_0_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [30:0] coupler_to_device_named_uart_0_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_device_named_uart_0_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_device_named_uart_0_auto_tl_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_device_named_uart_0_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_device_named_uart_0_auto_tl_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_device_named_uart_0_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_device_named_uart_0_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_tl_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_tl_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_device_named_uart_0_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_device_named_uart_0_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [20:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [20:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [14:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  bundleIn_0_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  reg [63:0] REG; // @[BootAddrReg.scala 34:32]
  wire [7:0] oldBytes_0 = REG[7:0]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_1 = REG[15:8]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_2 = REG[23:16]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_3 = REG[31:24]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_4 = REG[39:32]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_5 = REG[47:40]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_6 = REG[55:48]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_7 = REG[63:56]; // @[RegField.scala 151:53]
  wire  bundleIn_0_2_a_valid = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire [2:0] bundleIn_0_2_a_bits_opcode = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire  in_bits_read = bundleIn_0_2_a_bits_opcode == 3'h4; // @[RegisterRouter.scala 68:36]
  wire [14:0] bundleIn_0_2_a_bits_address = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire [8:0] in_bits_index = bundleIn_0_2_a_bits_address[11:3]; // @[RegisterRouter.scala 67:18 RegisterRouter.scala 69:19]
  wire  bundleIn_0_2_d_ready = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire  out_woready_0 = bundleIn_0_2_a_valid & bundleIn_0_2_d_ready & ~in_bits_read & in_bits_index == 9'h0; // @[RegisterRouter.scala 79:24]
  wire [7:0] bundleIn_0_2_a_bits_mask = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire [7:0] out_backMask_hi_hi_hi = bundleIn_0_2_a_bits_mask[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_hi_hi_lo = bundleIn_0_2_a_bits_mask[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_hi_lo_hi = bundleIn_0_2_a_bits_mask[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_hi_lo_lo = bundleIn_0_2_a_bits_mask[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_lo_hi_hi = bundleIn_0_2_a_bits_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_lo_hi_lo = bundleIn_0_2_a_bits_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_lo_lo_hi = bundleIn_0_2_a_bits_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_lo_lo_lo = bundleIn_0_2_a_bits_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] out_backMask = {out_backMask_hi_hi_hi,out_backMask_hi_hi_lo,out_backMask_hi_lo_hi,out_backMask_hi_lo_lo,
    out_backMask_lo_hi_hi,out_backMask_lo_hi_lo,out_backMask_lo_lo_hi,out_backMask_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  out_womask = &out_backMask[7:0]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready = out_woready_0 & out_womask; // @[RegisterRouter.scala 79:24]
  wire  out_womask_1 = &out_backMask[15:8]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_1 = out_woready_0 & out_womask_1; // @[RegisterRouter.scala 79:24]
  wire  out_womask_2 = &out_backMask[23:16]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_2 = out_woready_0 & out_womask_2; // @[RegisterRouter.scala 79:24]
  wire  out_womask_3 = &out_backMask[31:24]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_3 = out_woready_0 & out_womask_3; // @[RegisterRouter.scala 79:24]
  wire  out_womask_4 = &out_backMask[39:32]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_4 = out_woready_0 & out_womask_4; // @[RegisterRouter.scala 79:24]
  wire  out_womask_5 = &out_backMask[47:40]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_5 = out_woready_0 & out_womask_5; // @[RegisterRouter.scala 79:24]
  wire  out_womask_6 = &out_backMask[55:48]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_6 = out_woready_0 & out_womask_6; // @[RegisterRouter.scala 79:24]
  wire  out_womask_7 = &out_backMask[63:56]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_7 = out_woready_0 & out_womask_7; // @[RegisterRouter.scala 79:24]
  wire [63:0] bundleIn_0_2_a_bits_data = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire [7:0] newBytes_1 = out_f_woready_1 ? bundleIn_0_2_a_bits_data[15:8] : oldBytes_1; // @[RegField.scala 158:20 RegField.scala 158:33]
  wire [7:0] newBytes_0 = out_f_woready ? bundleIn_0_2_a_bits_data[7:0] : oldBytes_0; // @[RegField.scala 158:20 RegField.scala 158:33]
  wire [7:0] newBytes_3 = out_f_woready_3 ? bundleIn_0_2_a_bits_data[31:24] : oldBytes_3; // @[RegField.scala 158:20 RegField.scala 158:33]
  wire [7:0] newBytes_2 = out_f_woready_2 ? bundleIn_0_2_a_bits_data[23:16] : oldBytes_2; // @[RegField.scala 158:20 RegField.scala 158:33]
  wire [7:0] newBytes_5 = out_f_woready_5 ? bundleIn_0_2_a_bits_data[47:40] : oldBytes_5; // @[RegField.scala 158:20 RegField.scala 158:33]
  wire [7:0] newBytes_4 = out_f_woready_4 ? bundleIn_0_2_a_bits_data[39:32] : oldBytes_4; // @[RegField.scala 158:20 RegField.scala 158:33]
  wire [7:0] newBytes_7 = out_f_woready_7 ? bundleIn_0_2_a_bits_data[63:56] : oldBytes_7; // @[RegField.scala 158:20 RegField.scala 158:33]
  wire [7:0] newBytes_6 = out_f_woready_6 ? bundleIn_0_2_a_bits_data[55:48] : oldBytes_6; // @[RegField.scala 158:20 RegField.scala 158:33]
  wire [63:0] _T_7 = {newBytes_7,newBytes_6,newBytes_5,newBytes_4,newBytes_3,newBytes_2,newBytes_1,newBytes_0}; // @[RegField.scala 154:52]
  wire [63:0] out_prepend_6 = {oldBytes_7,oldBytes_6,oldBytes_5,oldBytes_4,oldBytes_3,oldBytes_2,oldBytes_1,oldBytes_0}; // @[Cat.scala 30:58]
  wire  bundleIn_0_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  ClockGroupAggregator_1 subsystem_pbus_clock_groups ( // @[BusWrapper.scala 40:48]
    .auto_in_member_subsystem_pbus_0_clock(subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_clock),
    .auto_in_member_subsystem_pbus_0_reset(subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_reset),
    .auto_out_member_subsystem_pbus_0_clock(subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_clock),
    .auto_out_member_subsystem_pbus_0_reset(subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_reset)
  );
  ClockGroup_1 clockGroup ( // @[BusWrapper.scala 41:38]
    .auto_in_member_subsystem_pbus_0_clock(clockGroup_auto_in_member_subsystem_pbus_0_clock),
    .auto_in_member_subsystem_pbus_0_reset(clockGroup_auto_in_member_subsystem_pbus_0_reset),
    .auto_out_clock(clockGroup_auto_out_clock),
    .auto_out_reset(clockGroup_auto_out_reset)
  );
  FixedClockBroadcast fixedClockNode ( // @[ClockGroup.scala 106:107]
    .auto_in_clock(fixedClockNode_auto_in_clock),
    .auto_in_reset(fixedClockNode_auto_in_reset),
    .auto_out_2_clock(fixedClockNode_auto_out_2_clock),
    .auto_out_2_reset(fixedClockNode_auto_out_2_reset),
    .auto_out_1_clock(fixedClockNode_auto_out_1_clock),
    .auto_out_1_reset(fixedClockNode_auto_out_1_reset),
    .auto_out_0_clock(fixedClockNode_auto_out_0_clock),
    .auto_out_0_reset(fixedClockNode_auto_out_0_reset)
  );
  BundleBridgeNexus broadcast ( // @[BundleBridge.scala 196:31]
    .clock(broadcast_clock),
    .reset(broadcast_reset)
  );
  TLFIFOFixer_1 fixer ( // @[PeripheryBus.scala 47:33]
    .clock(fixer_clock),
    .reset(fixer_reset),
    .auto_in_a_ready(fixer_auto_in_a_ready),
    .auto_in_a_valid(fixer_auto_in_a_valid),
    .auto_in_a_bits_opcode(fixer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(fixer_auto_in_a_bits_param),
    .auto_in_a_bits_size(fixer_auto_in_a_bits_size),
    .auto_in_a_bits_source(fixer_auto_in_a_bits_source),
    .auto_in_a_bits_address(fixer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(fixer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fixer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(fixer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(fixer_auto_in_d_ready),
    .auto_in_d_valid(fixer_auto_in_d_valid),
    .auto_in_d_bits_opcode(fixer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(fixer_auto_in_d_bits_param),
    .auto_in_d_bits_size(fixer_auto_in_d_bits_size),
    .auto_in_d_bits_source(fixer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(fixer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(fixer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(fixer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(fixer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(fixer_auto_out_a_ready),
    .auto_out_a_valid(fixer_auto_out_a_valid),
    .auto_out_a_bits_opcode(fixer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(fixer_auto_out_a_bits_param),
    .auto_out_a_bits_size(fixer_auto_out_a_bits_size),
    .auto_out_a_bits_source(fixer_auto_out_a_bits_source),
    .auto_out_a_bits_address(fixer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(fixer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fixer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(fixer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(fixer_auto_out_d_ready),
    .auto_out_d_valid(fixer_auto_out_d_valid),
    .auto_out_d_bits_opcode(fixer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(fixer_auto_out_d_bits_param),
    .auto_out_d_bits_size(fixer_auto_out_d_bits_size),
    .auto_out_d_bits_source(fixer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(fixer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(fixer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(fixer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(fixer_auto_out_d_bits_corrupt)
  );
  TLXbar_1 in_xbar ( // @[PeripheryBus.scala 49:29]
    .clock(in_xbar_clock),
    .reset(in_xbar_reset),
    .auto_in_a_ready(in_xbar_auto_in_a_ready),
    .auto_in_a_valid(in_xbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(in_xbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(in_xbar_auto_in_a_bits_param),
    .auto_in_a_bits_size(in_xbar_auto_in_a_bits_size),
    .auto_in_a_bits_source(in_xbar_auto_in_a_bits_source),
    .auto_in_a_bits_address(in_xbar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(in_xbar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(in_xbar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(in_xbar_auto_in_a_bits_corrupt),
    .auto_in_d_ready(in_xbar_auto_in_d_ready),
    .auto_in_d_valid(in_xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode(in_xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(in_xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size(in_xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source(in_xbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink(in_xbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(in_xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(in_xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(in_xbar_auto_in_d_bits_corrupt),
    .auto_out_a_ready(in_xbar_auto_out_a_ready),
    .auto_out_a_valid(in_xbar_auto_out_a_valid),
    .auto_out_a_bits_opcode(in_xbar_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(in_xbar_auto_out_a_bits_param),
    .auto_out_a_bits_size(in_xbar_auto_out_a_bits_size),
    .auto_out_a_bits_source(in_xbar_auto_out_a_bits_source),
    .auto_out_a_bits_address(in_xbar_auto_out_a_bits_address),
    .auto_out_a_bits_mask(in_xbar_auto_out_a_bits_mask),
    .auto_out_a_bits_data(in_xbar_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(in_xbar_auto_out_a_bits_corrupt),
    .auto_out_d_ready(in_xbar_auto_out_d_ready),
    .auto_out_d_valid(in_xbar_auto_out_d_valid),
    .auto_out_d_bits_opcode(in_xbar_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(in_xbar_auto_out_d_bits_param),
    .auto_out_d_bits_size(in_xbar_auto_out_d_bits_size),
    .auto_out_d_bits_source(in_xbar_auto_out_d_bits_source),
    .auto_out_d_bits_sink(in_xbar_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(in_xbar_auto_out_d_bits_denied),
    .auto_out_d_bits_data(in_xbar_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(in_xbar_auto_out_d_bits_corrupt)
  );
  TLXbar_2 out_xbar ( // @[PeripheryBus.scala 50:30]
    .clock(out_xbar_clock),
    .reset(out_xbar_reset),
    .auto_in_a_ready(out_xbar_auto_in_a_ready),
    .auto_in_a_valid(out_xbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(out_xbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(out_xbar_auto_in_a_bits_param),
    .auto_in_a_bits_size(out_xbar_auto_in_a_bits_size),
    .auto_in_a_bits_source(out_xbar_auto_in_a_bits_source),
    .auto_in_a_bits_address(out_xbar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(out_xbar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(out_xbar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(out_xbar_auto_in_a_bits_corrupt),
    .auto_in_d_ready(out_xbar_auto_in_d_ready),
    .auto_in_d_valid(out_xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode(out_xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(out_xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size(out_xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source(out_xbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink(out_xbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(out_xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(out_xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(out_xbar_auto_in_d_bits_corrupt),
    .auto_out_2_a_ready(out_xbar_auto_out_2_a_ready),
    .auto_out_2_a_valid(out_xbar_auto_out_2_a_valid),
    .auto_out_2_a_bits_opcode(out_xbar_auto_out_2_a_bits_opcode),
    .auto_out_2_a_bits_param(out_xbar_auto_out_2_a_bits_param),
    .auto_out_2_a_bits_size(out_xbar_auto_out_2_a_bits_size),
    .auto_out_2_a_bits_source(out_xbar_auto_out_2_a_bits_source),
    .auto_out_2_a_bits_address(out_xbar_auto_out_2_a_bits_address),
    .auto_out_2_a_bits_mask(out_xbar_auto_out_2_a_bits_mask),
    .auto_out_2_a_bits_data(out_xbar_auto_out_2_a_bits_data),
    .auto_out_2_a_bits_corrupt(out_xbar_auto_out_2_a_bits_corrupt),
    .auto_out_2_d_ready(out_xbar_auto_out_2_d_ready),
    .auto_out_2_d_valid(out_xbar_auto_out_2_d_valid),
    .auto_out_2_d_bits_opcode(out_xbar_auto_out_2_d_bits_opcode),
    .auto_out_2_d_bits_param(out_xbar_auto_out_2_d_bits_param),
    .auto_out_2_d_bits_size(out_xbar_auto_out_2_d_bits_size),
    .auto_out_2_d_bits_source(out_xbar_auto_out_2_d_bits_source),
    .auto_out_2_d_bits_sink(out_xbar_auto_out_2_d_bits_sink),
    .auto_out_2_d_bits_denied(out_xbar_auto_out_2_d_bits_denied),
    .auto_out_2_d_bits_data(out_xbar_auto_out_2_d_bits_data),
    .auto_out_2_d_bits_corrupt(out_xbar_auto_out_2_d_bits_corrupt),
    .auto_out_1_a_ready(out_xbar_auto_out_1_a_ready),
    .auto_out_1_a_valid(out_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(out_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(out_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(out_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(out_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(out_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(out_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(out_xbar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(out_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready(out_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid(out_xbar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(out_xbar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(out_xbar_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(out_xbar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(out_xbar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_sink(out_xbar_auto_out_1_d_bits_sink),
    .auto_out_1_d_bits_denied(out_xbar_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(out_xbar_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(out_xbar_auto_out_1_d_bits_corrupt),
    .auto_out_0_a_ready(out_xbar_auto_out_0_a_ready),
    .auto_out_0_a_valid(out_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(out_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(out_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(out_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(out_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(out_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(out_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(out_xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(out_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(out_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid(out_xbar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(out_xbar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(out_xbar_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(out_xbar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(out_xbar_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(out_xbar_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(out_xbar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(out_xbar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(out_xbar_auto_out_0_d_bits_corrupt)
  );
  TLBuffer buffer ( // @[Buffer.scala 68:28]
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
  TLAtomicAutomata atomics ( // @[AtomicAutomata.scala 283:29]
    .clock(atomics_clock),
    .reset(atomics_reset),
    .auto_in_a_ready(atomics_auto_in_a_ready),
    .auto_in_a_valid(atomics_auto_in_a_valid),
    .auto_in_a_bits_opcode(atomics_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(atomics_auto_in_a_bits_param),
    .auto_in_a_bits_size(atomics_auto_in_a_bits_size),
    .auto_in_a_bits_source(atomics_auto_in_a_bits_source),
    .auto_in_a_bits_address(atomics_auto_in_a_bits_address),
    .auto_in_a_bits_mask(atomics_auto_in_a_bits_mask),
    .auto_in_a_bits_data(atomics_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(atomics_auto_in_a_bits_corrupt),
    .auto_in_d_ready(atomics_auto_in_d_ready),
    .auto_in_d_valid(atomics_auto_in_d_valid),
    .auto_in_d_bits_opcode(atomics_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(atomics_auto_in_d_bits_param),
    .auto_in_d_bits_size(atomics_auto_in_d_bits_size),
    .auto_in_d_bits_source(atomics_auto_in_d_bits_source),
    .auto_in_d_bits_sink(atomics_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(atomics_auto_in_d_bits_denied),
    .auto_in_d_bits_data(atomics_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(atomics_auto_in_d_bits_corrupt),
    .auto_out_a_ready(atomics_auto_out_a_ready),
    .auto_out_a_valid(atomics_auto_out_a_valid),
    .auto_out_a_bits_opcode(atomics_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(atomics_auto_out_a_bits_param),
    .auto_out_a_bits_size(atomics_auto_out_a_bits_size),
    .auto_out_a_bits_source(atomics_auto_out_a_bits_source),
    .auto_out_a_bits_address(atomics_auto_out_a_bits_address),
    .auto_out_a_bits_mask(atomics_auto_out_a_bits_mask),
    .auto_out_a_bits_data(atomics_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(atomics_auto_out_a_bits_corrupt),
    .auto_out_d_ready(atomics_auto_out_d_ready),
    .auto_out_d_valid(atomics_auto_out_d_valid),
    .auto_out_d_bits_opcode(atomics_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(atomics_auto_out_d_bits_param),
    .auto_out_d_bits_size(atomics_auto_out_d_bits_size),
    .auto_out_d_bits_source(atomics_auto_out_d_bits_source),
    .auto_out_d_bits_sink(atomics_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(atomics_auto_out_d_bits_denied),
    .auto_out_d_bits_data(atomics_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(atomics_auto_out_d_bits_corrupt)
  );
  TLBuffer_1 buffer_1 ( // @[Buffer.scala 68:28]
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
  TLInterconnectCoupler_4 coupler_to_slave_named_bootaddressreg ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_slave_named_bootaddressreg_clock),
    .reset(coupler_to_slave_named_bootaddressreg_reset),
    .auto_buffer_in_a_ready(coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_data(coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_data),
    .auto_buffer_in_a_bits_corrupt(coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param(coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size(coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink(coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied(coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data(coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt(coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_corrupt),
    .auto_fragmenter_out_a_ready(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_param(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_param),
    .auto_fragmenter_out_d_bits_size(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_sink(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_sink),
    .auto_fragmenter_out_d_bits_denied(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_denied),
    .auto_fragmenter_out_d_bits_data(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_data),
    .auto_fragmenter_out_d_bits_corrupt(coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_corrupt)
  );
  TLInterconnectCoupler_5 coupler_to_device_named_uart_0 ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_device_named_uart_0_clock),
    .reset(coupler_to_device_named_uart_0_reset),
    .auto_control_xing_out_a_ready(coupler_to_device_named_uart_0_auto_control_xing_out_a_ready),
    .auto_control_xing_out_a_valid(coupler_to_device_named_uart_0_auto_control_xing_out_a_valid),
    .auto_control_xing_out_a_bits_opcode(coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_opcode),
    .auto_control_xing_out_a_bits_param(coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_param),
    .auto_control_xing_out_a_bits_size(coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_size),
    .auto_control_xing_out_a_bits_source(coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_source),
    .auto_control_xing_out_a_bits_address(coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_address),
    .auto_control_xing_out_a_bits_mask(coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_mask),
    .auto_control_xing_out_a_bits_data(coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_data),
    .auto_control_xing_out_a_bits_corrupt(coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_corrupt),
    .auto_control_xing_out_d_ready(coupler_to_device_named_uart_0_auto_control_xing_out_d_ready),
    .auto_control_xing_out_d_valid(coupler_to_device_named_uart_0_auto_control_xing_out_d_valid),
    .auto_control_xing_out_d_bits_opcode(coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_opcode),
    .auto_control_xing_out_d_bits_param(coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_param),
    .auto_control_xing_out_d_bits_size(coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_size),
    .auto_control_xing_out_d_bits_source(coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_source),
    .auto_control_xing_out_d_bits_sink(coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_sink),
    .auto_control_xing_out_d_bits_denied(coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_denied),
    .auto_control_xing_out_d_bits_data(coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_data),
    .auto_control_xing_out_d_bits_corrupt(coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_corrupt),
    .auto_tl_in_a_ready(coupler_to_device_named_uart_0_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_device_named_uart_0_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_device_named_uart_0_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_device_named_uart_0_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_device_named_uart_0_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_device_named_uart_0_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_device_named_uart_0_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_device_named_uart_0_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_device_named_uart_0_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_device_named_uart_0_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_device_named_uart_0_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_device_named_uart_0_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_device_named_uart_0_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param(coupler_to_device_named_uart_0_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size(coupler_to_device_named_uart_0_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_device_named_uart_0_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_sink(coupler_to_device_named_uart_0_auto_tl_in_d_bits_sink),
    .auto_tl_in_d_bits_denied(coupler_to_device_named_uart_0_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data(coupler_to_device_named_uart_0_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt(coupler_to_device_named_uart_0_auto_tl_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_6 coupler_to_slave_named_tileresetctrl ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_slave_named_tileresetctrl_clock),
    .reset(coupler_to_slave_named_tileresetctrl_reset),
    .auto_buffer_in_a_ready(coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_data(coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_data),
    .auto_buffer_in_a_bits_corrupt(coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param(coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size(coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink(coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied(coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data(coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt(coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_corrupt),
    .auto_buffer_out_a_ready(coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_ready),
    .auto_buffer_out_a_valid(coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_valid),
    .auto_buffer_out_a_bits_opcode(coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_opcode),
    .auto_buffer_out_a_bits_param(coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_param),
    .auto_buffer_out_a_bits_size(coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_size),
    .auto_buffer_out_a_bits_source(coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_source),
    .auto_buffer_out_a_bits_address(coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_address),
    .auto_buffer_out_a_bits_mask(coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_mask),
    .auto_buffer_out_a_bits_data(coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_data),
    .auto_buffer_out_a_bits_corrupt(coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_corrupt),
    .auto_buffer_out_d_ready(coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_ready),
    .auto_buffer_out_d_valid(coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_valid),
    .auto_buffer_out_d_bits_opcode(coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_opcode),
    .auto_buffer_out_d_bits_param(coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_param),
    .auto_buffer_out_d_bits_size(coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_size),
    .auto_buffer_out_d_bits_source(coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_source),
    .auto_buffer_out_d_bits_sink(coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_sink),
    .auto_buffer_out_d_bits_denied(coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_denied),
    .auto_buffer_out_d_bits_data(coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_data),
    .auto_buffer_out_d_bits_corrupt(coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_corrupt)
  );
  TLMonitor_13 monitor ( // @[Nodes.scala 24:25]
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
  assign auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_valid =
    coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_opcode =
    coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_param =
    coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_size =
    coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_source =
    coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_address =
    coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_mask =
    coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_data =
    coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_corrupt =
    coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_ready =
    coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_device_named_uart_0_control_xing_out_a_valid =
    coupler_to_device_named_uart_0_auto_control_xing_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_opcode =
    coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_param =
    coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_size =
    coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_source =
    coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_address =
    coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_mask =
    coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_data =
    coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_corrupt =
    coupler_to_device_named_uart_0_auto_control_xing_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_device_named_uart_0_control_xing_out_d_ready =
    coupler_to_device_named_uart_0_auto_control_xing_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_1_clock = fixedClockNode_auto_out_2_clock; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_1_reset = fixedClockNode_auto_out_2_reset; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_0_clock = fixedClockNode_auto_out_1_clock; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_0_reset = fixedClockNode_auto_out_1_reset; // @[LazyModule.scala 311:12]
  assign auto_bus_xing_in_a_ready = buffer_1_auto_in_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_valid = buffer_1_auto_in_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_opcode = buffer_1_auto_in_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_param = buffer_1_auto_in_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_size = buffer_1_auto_in_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_source = buffer_1_auto_in_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_sink = buffer_1_auto_in_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_denied = buffer_1_auto_in_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_data = buffer_1_auto_in_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_corrupt = buffer_1_auto_in_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_clock =
    auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_reset =
    auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset; // @[LazyModule.scala 309:16]
  assign clockGroup_auto_in_member_subsystem_pbus_0_clock =
    subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_clock; // @[LazyModule.scala 298:16]
  assign clockGroup_auto_in_member_subsystem_pbus_0_reset =
    subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_reset; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_clock = clockGroup_auto_out_clock; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_reset = clockGroup_auto_out_reset; // @[LazyModule.scala 298:16]
  assign broadcast_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign broadcast_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign fixer_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign fixer_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign fixer_auto_in_a_valid = buffer_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_param = buffer_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_size = buffer_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_source = buffer_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_address = buffer_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_mask = buffer_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_data = buffer_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_d_ready = buffer_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_a_ready = out_xbar_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_valid = out_xbar_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_opcode = out_xbar_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_param = out_xbar_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_size = out_xbar_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_source = out_xbar_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_sink = out_xbar_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_denied = out_xbar_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_data = out_xbar_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_corrupt = out_xbar_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign in_xbar_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign in_xbar_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_valid = buffer_1_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_opcode = buffer_1_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_param = buffer_1_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_size = buffer_1_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_source = buffer_1_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_address = buffer_1_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_mask = buffer_1_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_data = buffer_1_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_corrupt = buffer_1_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_d_ready = buffer_1_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_out_a_ready = atomics_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_valid = atomics_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_opcode = atomics_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_param = atomics_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_size = atomics_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_source = atomics_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_sink = atomics_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_denied = atomics_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_data = atomics_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_corrupt = atomics_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign out_xbar_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign out_xbar_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign out_xbar_auto_in_a_valid = fixer_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_opcode = fixer_auto_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_param = fixer_auto_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_size = fixer_auto_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_source = fixer_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_address = fixer_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_mask = fixer_auto_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_data = fixer_auto_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_corrupt = fixer_auto_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_d_ready = fixer_auto_out_d_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_a_ready = coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_valid = coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_opcode = coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_param = coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_size = coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_source = coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_sink = coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_denied = coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_data = coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_corrupt = coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_a_ready = coupler_to_device_named_uart_0_auto_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_valid = coupler_to_device_named_uart_0_auto_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_opcode = coupler_to_device_named_uart_0_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_param = coupler_to_device_named_uart_0_auto_tl_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_size = coupler_to_device_named_uart_0_auto_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_source = coupler_to_device_named_uart_0_auto_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_sink = coupler_to_device_named_uart_0_auto_tl_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_denied = coupler_to_device_named_uart_0_auto_tl_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_data = coupler_to_device_named_uart_0_auto_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_corrupt = coupler_to_device_named_uart_0_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_a_ready = coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_valid = coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_opcode = coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_param = coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_size = coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_source = coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_sink = coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_denied = coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_data = coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_corrupt = coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_auto_in_a_valid = atomics_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_opcode = atomics_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_param = atomics_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_size = atomics_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_source = atomics_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_address = atomics_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_mask = atomics_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_data = atomics_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_corrupt = atomics_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_d_ready = atomics_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_a_ready = fixer_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_valid = fixer_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_opcode = fixer_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_param = fixer_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_size = fixer_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_source = fixer_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_sink = fixer_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_denied = fixer_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_data = fixer_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_corrupt = fixer_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign atomics_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign atomics_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign atomics_auto_in_a_valid = in_xbar_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_opcode = in_xbar_auto_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_param = in_xbar_auto_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_size = in_xbar_auto_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_source = in_xbar_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_address = in_xbar_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_mask = in_xbar_auto_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_data = in_xbar_auto_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_corrupt = in_xbar_auto_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_d_ready = in_xbar_auto_out_d_ready; // @[LazyModule.scala 298:16]
  assign atomics_auto_out_a_ready = buffer_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_valid = buffer_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_param = buffer_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_size = buffer_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_source = buffer_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_sink = buffer_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_denied = buffer_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_data = buffer_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign buffer_1_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_1_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_1_auto_in_a_valid = auto_bus_xing_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_opcode = auto_bus_xing_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_param = auto_bus_xing_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_size = auto_bus_xing_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_source = auto_bus_xing_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_address = auto_bus_xing_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_mask = auto_bus_xing_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_data = auto_bus_xing_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_corrupt = auto_bus_xing_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_d_ready = auto_bus_xing_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_out_a_ready = in_xbar_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_valid = in_xbar_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_opcode = in_xbar_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_param = in_xbar_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_size = in_xbar_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_source = in_xbar_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_sink = in_xbar_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_denied = in_xbar_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_data = in_xbar_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_corrupt = in_xbar_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign coupler_to_slave_named_bootaddressreg_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_slave_named_bootaddressreg_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_valid = out_xbar_auto_out_0_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_opcode = out_xbar_auto_out_0_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_param = out_xbar_auto_out_0_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_size = out_xbar_auto_out_0_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_source = out_xbar_auto_out_0_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_address = out_xbar_auto_out_0_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_mask = out_xbar_auto_out_0_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_data = out_xbar_auto_out_0_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_bootaddressreg_auto_buffer_in_a_bits_corrupt = out_xbar_auto_out_0_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_bootaddressreg_auto_buffer_in_d_ready = out_xbar_auto_out_0_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_ready =
    coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_valid =
    coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 94:19]
  assign coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_param = 2'h0; // @[Edges.scala 755:17 Edges.scala 757:15]
  assign coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_size =
    coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_source =
    coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_sink = 1'h0; // @[Edges.scala 755:17 Edges.scala 760:15]
  assign coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_denied = 1'h0; // @[Edges.scala 755:17 Edges.scala 761:15]
  assign coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_data = in_bits_index == 9'h0 ? out_prepend_6
     : 64'h0; // @[RegisterRouter.scala 79:24]
  assign coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_bits_corrupt = 1'h0; // @[Edges.scala 755:17 Edges.scala 763:15]
  assign coupler_to_device_named_uart_0_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_device_named_uart_0_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_device_named_uart_0_auto_control_xing_out_a_ready =
    auto_coupler_to_device_named_uart_0_control_xing_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_device_named_uart_0_auto_control_xing_out_d_valid =
    auto_coupler_to_device_named_uart_0_control_xing_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_opcode =
    auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_param =
    auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_size =
    auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_source =
    auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_sink =
    auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_denied =
    auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_data =
    auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_device_named_uart_0_auto_control_xing_out_d_bits_corrupt =
    auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign coupler_to_device_named_uart_0_auto_tl_in_a_valid = out_xbar_auto_out_1_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_device_named_uart_0_auto_tl_in_a_bits_opcode = out_xbar_auto_out_1_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_device_named_uart_0_auto_tl_in_a_bits_param = out_xbar_auto_out_1_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_device_named_uart_0_auto_tl_in_a_bits_size = out_xbar_auto_out_1_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_device_named_uart_0_auto_tl_in_a_bits_source = out_xbar_auto_out_1_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_device_named_uart_0_auto_tl_in_a_bits_address = out_xbar_auto_out_1_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_device_named_uart_0_auto_tl_in_a_bits_mask = out_xbar_auto_out_1_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_device_named_uart_0_auto_tl_in_a_bits_data = out_xbar_auto_out_1_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_device_named_uart_0_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_1_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_device_named_uart_0_auto_tl_in_d_ready = out_xbar_auto_out_1_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_tileresetctrl_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_slave_named_tileresetctrl_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_valid = out_xbar_auto_out_2_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_opcode = out_xbar_auto_out_2_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_param = out_xbar_auto_out_2_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_size = out_xbar_auto_out_2_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_source = out_xbar_auto_out_2_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_address = out_xbar_auto_out_2_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_mask = out_xbar_auto_out_2_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_data = out_xbar_auto_out_2_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_in_a_bits_corrupt = out_xbar_auto_out_2_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_in_d_ready = out_xbar_auto_out_2_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_out_a_ready =
    auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_valid =
    auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_opcode =
    auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_param =
    auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_size =
    auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_source =
    auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_sink =
    auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_denied =
    auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_data =
    auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_slave_named_tileresetctrl_auto_buffer_out_d_bits_corrupt =
    auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign monitor_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_ready = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_valid = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_opcode = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_param = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_size = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_source = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_address = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_mask = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_data = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_corrupt = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_d_ready = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_d_valid = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 94:19]
  assign monitor_io_in_d_bits_param = 2'h0; // @[Edges.scala 755:17 Edges.scala 757:15]
  assign monitor_io_in_d_bits_size = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_d_bits_source = coupler_to_slave_named_bootaddressreg_auto_fragmenter_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_d_bits_sink = 1'h0; // @[Edges.scala 755:17 Edges.scala 760:15]
  assign monitor_io_in_d_bits_denied = 1'h0; // @[Edges.scala 755:17 Edges.scala 761:15]
  assign monitor_io_in_d_bits_data = in_bits_index == 9'h0 ? out_prepend_6 : 64'h0; // @[RegisterRouter.scala 79:24]
  assign monitor_io_in_d_bits_corrupt = 1'h0; // @[Edges.scala 755:17 Edges.scala 763:15]
  always @(posedge bundleIn_0_clock) begin
    if (bundleIn_0_reset) begin // @[BootAddrReg.scala 34:32]
      REG <= 64'h80000000; // @[BootAddrReg.scala 34:32]
    end else if (out_f_woready | out_f_woready_1 | out_f_woready_2 | out_f_woready_3 | out_f_woready_4 | out_f_woready_5
       | out_f_woready_6 | out_f_woready_7) begin // @[RegField.scala 154:34]
      REG <= _T_7; // @[RegField.scala 154:40]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  REG = _RAND_0[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
