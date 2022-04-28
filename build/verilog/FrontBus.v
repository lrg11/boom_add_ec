module FrontBus(
  output        auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_ready,
  input         auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_valid,
  input  [2:0]  auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_opcode,
  input  [2:0]  auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_param,
  input  [3:0]  auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_size,
  input         auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_source,
  input  [31:0] auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_address,
  input  [7:0]  auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_mask,
  input  [63:0] auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_data,
  input         auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_corrupt,
  input         auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_ready,
  output        auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_valid,
  output [2:0]  auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_opcode,
  output [1:0]  auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_param,
  output [3:0]  auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_size,
  output        auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_source,
  output [1:0]  auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_sink,
  output        auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_denied,
  output [63:0] auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_data,
  output        auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_corrupt,
  output        auto_fixedClockNode_out_clock,
  output        auto_fixedClockNode_out_reset,
  input         auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock,
  input         auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset,
  input         auto_bus_xing_out_a_ready,
  output        auto_bus_xing_out_a_valid,
  output [2:0]  auto_bus_xing_out_a_bits_opcode,
  output [2:0]  auto_bus_xing_out_a_bits_param,
  output [3:0]  auto_bus_xing_out_a_bits_size,
  output        auto_bus_xing_out_a_bits_source,
  output [31:0] auto_bus_xing_out_a_bits_address,
  output [7:0]  auto_bus_xing_out_a_bits_mask,
  output [63:0] auto_bus_xing_out_a_bits_data,
  output        auto_bus_xing_out_a_bits_corrupt,
  output        auto_bus_xing_out_d_ready,
  input         auto_bus_xing_out_d_valid,
  input  [2:0]  auto_bus_xing_out_d_bits_opcode,
  input  [1:0]  auto_bus_xing_out_d_bits_param,
  input  [3:0]  auto_bus_xing_out_d_bits_size,
  input         auto_bus_xing_out_d_bits_source,
  input  [1:0]  auto_bus_xing_out_d_bits_sink,
  input         auto_bus_xing_out_d_bits_denied,
  input  [63:0] auto_bus_xing_out_d_bits_data,
  input         auto_bus_xing_out_d_bits_corrupt,
  output        clock,
  output        reset
);
  wire  subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_reset; // @[BusWrapper.scala 40:48]
  wire  subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_reset; // @[BusWrapper.scala 40:48]
  wire  clockGroup_auto_in_member_subsystem_fbus_0_clock; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_in_member_subsystem_fbus_0_reset; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_out_clock; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_out_reset; // @[BusWrapper.scala 41:38]
  wire  fixedClockNode_auto_in_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_in_reset; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_1_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_1_reset; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_0_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_0_reset; // @[ClockGroup.scala 106:107]
  wire  broadcast_clock; // @[BundleBridge.scala 196:31]
  wire  broadcast_reset; // @[BundleBridge.scala 196:31]
  wire  subsystem_fbus_xbar_clock; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_reset; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_in_a_ready; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_in_a_valid; // @[BusWrapper.scala 357:32]
  wire [2:0] subsystem_fbus_xbar_auto_in_a_bits_opcode; // @[BusWrapper.scala 357:32]
  wire [2:0] subsystem_fbus_xbar_auto_in_a_bits_param; // @[BusWrapper.scala 357:32]
  wire [3:0] subsystem_fbus_xbar_auto_in_a_bits_size; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_in_a_bits_source; // @[BusWrapper.scala 357:32]
  wire [31:0] subsystem_fbus_xbar_auto_in_a_bits_address; // @[BusWrapper.scala 357:32]
  wire [7:0] subsystem_fbus_xbar_auto_in_a_bits_mask; // @[BusWrapper.scala 357:32]
  wire [63:0] subsystem_fbus_xbar_auto_in_a_bits_data; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_in_a_bits_corrupt; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_in_d_ready; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_in_d_valid; // @[BusWrapper.scala 357:32]
  wire [2:0] subsystem_fbus_xbar_auto_in_d_bits_opcode; // @[BusWrapper.scala 357:32]
  wire [1:0] subsystem_fbus_xbar_auto_in_d_bits_param; // @[BusWrapper.scala 357:32]
  wire [3:0] subsystem_fbus_xbar_auto_in_d_bits_size; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_in_d_bits_source; // @[BusWrapper.scala 357:32]
  wire [1:0] subsystem_fbus_xbar_auto_in_d_bits_sink; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_in_d_bits_denied; // @[BusWrapper.scala 357:32]
  wire [63:0] subsystem_fbus_xbar_auto_in_d_bits_data; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_in_d_bits_corrupt; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_out_a_ready; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_out_a_valid; // @[BusWrapper.scala 357:32]
  wire [2:0] subsystem_fbus_xbar_auto_out_a_bits_opcode; // @[BusWrapper.scala 357:32]
  wire [2:0] subsystem_fbus_xbar_auto_out_a_bits_param; // @[BusWrapper.scala 357:32]
  wire [3:0] subsystem_fbus_xbar_auto_out_a_bits_size; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_out_a_bits_source; // @[BusWrapper.scala 357:32]
  wire [31:0] subsystem_fbus_xbar_auto_out_a_bits_address; // @[BusWrapper.scala 357:32]
  wire [7:0] subsystem_fbus_xbar_auto_out_a_bits_mask; // @[BusWrapper.scala 357:32]
  wire [63:0] subsystem_fbus_xbar_auto_out_a_bits_data; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_out_a_bits_corrupt; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_out_d_ready; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_out_d_valid; // @[BusWrapper.scala 357:32]
  wire [2:0] subsystem_fbus_xbar_auto_out_d_bits_opcode; // @[BusWrapper.scala 357:32]
  wire [1:0] subsystem_fbus_xbar_auto_out_d_bits_param; // @[BusWrapper.scala 357:32]
  wire [3:0] subsystem_fbus_xbar_auto_out_d_bits_size; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_out_d_bits_source; // @[BusWrapper.scala 357:32]
  wire [1:0] subsystem_fbus_xbar_auto_out_d_bits_sink; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_out_d_bits_denied; // @[BusWrapper.scala 357:32]
  wire [63:0] subsystem_fbus_xbar_auto_out_d_bits_data; // @[BusWrapper.scala 357:32]
  wire  subsystem_fbus_xbar_auto_out_d_bits_corrupt; // @[BusWrapper.scala 357:32]
  wire  buffer_clock; // @[Buffer.scala 68:28]
  wire  buffer_reset; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  coupler_from_port_named_serial_tl_ctrl_clock; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_reset; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  ClockGroupAggregator_2 subsystem_fbus_clock_groups ( // @[BusWrapper.scala 40:48]
    .auto_in_member_subsystem_fbus_0_clock(subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_clock),
    .auto_in_member_subsystem_fbus_0_reset(subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_reset),
    .auto_out_member_subsystem_fbus_0_clock(subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_clock),
    .auto_out_member_subsystem_fbus_0_reset(subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_reset)
  );
  ClockGroup_2 clockGroup ( // @[BusWrapper.scala 41:38]
    .auto_in_member_subsystem_fbus_0_clock(clockGroup_auto_in_member_subsystem_fbus_0_clock),
    .auto_in_member_subsystem_fbus_0_reset(clockGroup_auto_in_member_subsystem_fbus_0_reset),
    .auto_out_clock(clockGroup_auto_out_clock),
    .auto_out_reset(clockGroup_auto_out_reset)
  );
  FixedClockBroadcast_2 fixedClockNode ( // @[ClockGroup.scala 106:107]
    .auto_in_clock(fixedClockNode_auto_in_clock),
    .auto_in_reset(fixedClockNode_auto_in_reset),
    .auto_out_1_clock(fixedClockNode_auto_out_1_clock),
    .auto_out_1_reset(fixedClockNode_auto_out_1_reset),
    .auto_out_0_clock(fixedClockNode_auto_out_0_clock),
    .auto_out_0_reset(fixedClockNode_auto_out_0_reset)
  );
  BundleBridgeNexus broadcast ( // @[BundleBridge.scala 196:31]
    .clock(broadcast_clock),
    .reset(broadcast_reset)
  );
  TLXbar_3 subsystem_fbus_xbar ( // @[BusWrapper.scala 357:32]
    .clock(subsystem_fbus_xbar_clock),
    .reset(subsystem_fbus_xbar_reset),
    .auto_in_a_ready(subsystem_fbus_xbar_auto_in_a_ready),
    .auto_in_a_valid(subsystem_fbus_xbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(subsystem_fbus_xbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(subsystem_fbus_xbar_auto_in_a_bits_param),
    .auto_in_a_bits_size(subsystem_fbus_xbar_auto_in_a_bits_size),
    .auto_in_a_bits_source(subsystem_fbus_xbar_auto_in_a_bits_source),
    .auto_in_a_bits_address(subsystem_fbus_xbar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(subsystem_fbus_xbar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(subsystem_fbus_xbar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(subsystem_fbus_xbar_auto_in_a_bits_corrupt),
    .auto_in_d_ready(subsystem_fbus_xbar_auto_in_d_ready),
    .auto_in_d_valid(subsystem_fbus_xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode(subsystem_fbus_xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(subsystem_fbus_xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size(subsystem_fbus_xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source(subsystem_fbus_xbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink(subsystem_fbus_xbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(subsystem_fbus_xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(subsystem_fbus_xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(subsystem_fbus_xbar_auto_in_d_bits_corrupt),
    .auto_out_a_ready(subsystem_fbus_xbar_auto_out_a_ready),
    .auto_out_a_valid(subsystem_fbus_xbar_auto_out_a_valid),
    .auto_out_a_bits_opcode(subsystem_fbus_xbar_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(subsystem_fbus_xbar_auto_out_a_bits_param),
    .auto_out_a_bits_size(subsystem_fbus_xbar_auto_out_a_bits_size),
    .auto_out_a_bits_source(subsystem_fbus_xbar_auto_out_a_bits_source),
    .auto_out_a_bits_address(subsystem_fbus_xbar_auto_out_a_bits_address),
    .auto_out_a_bits_mask(subsystem_fbus_xbar_auto_out_a_bits_mask),
    .auto_out_a_bits_data(subsystem_fbus_xbar_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(subsystem_fbus_xbar_auto_out_a_bits_corrupt),
    .auto_out_d_ready(subsystem_fbus_xbar_auto_out_d_ready),
    .auto_out_d_valid(subsystem_fbus_xbar_auto_out_d_valid),
    .auto_out_d_bits_opcode(subsystem_fbus_xbar_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(subsystem_fbus_xbar_auto_out_d_bits_param),
    .auto_out_d_bits_size(subsystem_fbus_xbar_auto_out_d_bits_size),
    .auto_out_d_bits_source(subsystem_fbus_xbar_auto_out_d_bits_source),
    .auto_out_d_bits_sink(subsystem_fbus_xbar_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(subsystem_fbus_xbar_auto_out_d_bits_denied),
    .auto_out_d_bits_data(subsystem_fbus_xbar_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(subsystem_fbus_xbar_auto_out_d_bits_corrupt)
  );
  TLBuffer_5 buffer ( // @[Buffer.scala 68:28]
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
  TLInterconnectCoupler_7 coupler_from_port_named_serial_tl_ctrl ( // @[LazyModule.scala 432:27]
    .clock(coupler_from_port_named_serial_tl_ctrl_clock),
    .reset(coupler_from_port_named_serial_tl_ctrl_reset),
    .auto_buffer_in_a_ready(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_data(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_data),
    .auto_buffer_in_a_bits_corrupt(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt(coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_corrupt),
    .auto_tl_out_a_ready(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_ready),
    .auto_tl_out_a_valid(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_valid),
    .auto_tl_out_a_bits_opcode(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_opcode),
    .auto_tl_out_a_bits_param(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_param),
    .auto_tl_out_a_bits_size(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_size),
    .auto_tl_out_a_bits_source(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_source),
    .auto_tl_out_a_bits_address(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_address),
    .auto_tl_out_a_bits_mask(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_mask),
    .auto_tl_out_a_bits_data(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_data),
    .auto_tl_out_a_bits_corrupt(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_corrupt),
    .auto_tl_out_d_ready(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_ready),
    .auto_tl_out_d_valid(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_valid),
    .auto_tl_out_d_bits_opcode(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_opcode),
    .auto_tl_out_d_bits_param(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_param),
    .auto_tl_out_d_bits_size(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_size),
    .auto_tl_out_d_bits_source(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_source),
    .auto_tl_out_d_bits_sink(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_sink),
    .auto_tl_out_d_bits_denied(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_denied),
    .auto_tl_out_d_bits_data(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_data),
    .auto_tl_out_d_bits_corrupt(coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_corrupt)
  );
  assign auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_ready =
    coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_valid =
    coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_opcode =
    coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_param =
    coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_size =
    coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_source =
    coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_sink =
    coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_denied =
    coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_data =
    coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_corrupt =
    coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign auto_fixedClockNode_out_clock = fixedClockNode_auto_out_1_clock; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_reset = fixedClockNode_auto_out_1_reset; // @[LazyModule.scala 311:12]
  assign auto_bus_xing_out_a_valid = buffer_auto_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_bus_xing_out_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_bus_xing_out_a_bits_param = buffer_auto_out_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_bus_xing_out_a_bits_size = buffer_auto_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_bus_xing_out_a_bits_source = buffer_auto_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_bus_xing_out_a_bits_address = buffer_auto_out_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_bus_xing_out_a_bits_mask = buffer_auto_out_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_bus_xing_out_a_bits_data = buffer_auto_out_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_bus_xing_out_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_bus_xing_out_d_ready = buffer_auto_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_clock =
    auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_reset =
    auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset; // @[LazyModule.scala 309:16]
  assign clockGroup_auto_in_member_subsystem_fbus_0_clock =
    subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_clock; // @[LazyModule.scala 298:16]
  assign clockGroup_auto_in_member_subsystem_fbus_0_reset =
    subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_reset; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_clock = clockGroup_auto_out_clock; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_reset = clockGroup_auto_out_reset; // @[LazyModule.scala 298:16]
  assign broadcast_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign broadcast_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_auto_in_a_valid = coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_valid; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_auto_in_a_bits_opcode = coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_auto_in_a_bits_param = coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_auto_in_a_bits_size = coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_auto_in_a_bits_source = coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_auto_in_a_bits_address = coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_auto_in_a_bits_mask = coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_auto_in_a_bits_data = coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_auto_in_a_bits_corrupt = coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_auto_in_d_ready = coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_ready; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_xbar_auto_out_a_ready = buffer_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_xbar_auto_out_d_valid = buffer_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_xbar_auto_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_xbar_auto_out_d_bits_param = buffer_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_xbar_auto_out_d_bits_size = buffer_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_xbar_auto_out_d_bits_source = buffer_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_xbar_auto_out_d_bits_sink = buffer_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_xbar_auto_out_d_bits_denied = buffer_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_xbar_auto_out_d_bits_data = buffer_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_xbar_auto_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_auto_in_a_valid = subsystem_fbus_xbar_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_opcode = subsystem_fbus_xbar_auto_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_param = subsystem_fbus_xbar_auto_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_size = subsystem_fbus_xbar_auto_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_source = subsystem_fbus_xbar_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_address = subsystem_fbus_xbar_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_mask = subsystem_fbus_xbar_auto_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_data = subsystem_fbus_xbar_auto_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_corrupt = subsystem_fbus_xbar_auto_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_d_ready = subsystem_fbus_xbar_auto_out_d_ready; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_a_ready = auto_bus_xing_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_valid = auto_bus_xing_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_opcode = auto_bus_xing_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_param = auto_bus_xing_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_size = auto_bus_xing_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_source = auto_bus_xing_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_sink = auto_bus_xing_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_denied = auto_bus_xing_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_data = auto_bus_xing_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_d_bits_corrupt = auto_bus_xing_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign coupler_from_port_named_serial_tl_ctrl_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_from_port_named_serial_tl_ctrl_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_valid =
    auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_valid; // @[LazyModule.scala 309:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_opcode =
    auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_param =
    auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_size =
    auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_source =
    auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_address =
    auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_mask =
    auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_data =
    auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_a_bits_corrupt =
    auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_buffer_in_d_ready =
    auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_ready; // @[LazyModule.scala 309:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_tl_out_a_ready = subsystem_fbus_xbar_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_valid = subsystem_fbus_xbar_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_opcode = subsystem_fbus_xbar_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_param = subsystem_fbus_xbar_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_size = subsystem_fbus_xbar_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_source = subsystem_fbus_xbar_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_sink = subsystem_fbus_xbar_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_denied = subsystem_fbus_xbar_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_data = subsystem_fbus_xbar_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_serial_tl_ctrl_auto_tl_out_d_bits_corrupt = subsystem_fbus_xbar_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
endmodule
