module SystemBus(
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_valid,
  input  [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_opcode,
  input  [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_param,
  input  [3:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_size,
  input  [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_source,
  input  [31:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_address,
  input  [7:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_mask,
  input  [63:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_data,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_corrupt,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_ready,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid,
  output [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_opcode,
  output [1:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param,
  output [3:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_size,
  output [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_source,
  output [31:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address,
  output [7:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_mask,
  output [63:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_data,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_corrupt,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_valid,
  input  [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_opcode,
  input  [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_param,
  input  [3:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_size,
  input  [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_source,
  input  [31:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_address,
  input  [63:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_data,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_corrupt,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_ready,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid,
  output [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode,
  output [1:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param,
  output [3:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size,
  output [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source,
  output [1:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied,
  output [63:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_ready,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_valid,
  input  [1:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_bits_sink,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param,
  output [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size,
  output [3:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source,
  output [31:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address,
  output [7:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask,
  output [63:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_size,
  input  [3:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_source,
  input  [31:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address,
  input  [7:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_mask,
  input  [63:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_data,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_corrupt,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode,
  output [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param,
  output [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size,
  output [3:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source,
  output [31:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address,
  output [63:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size,
  input  [3:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_e_ready,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid,
  output [1:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid,
  input  [2:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode,
  input  [2:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param,
  input  [3:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source,
  input  [31:0] auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address,
  input  [7:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask,
  input  [63:0] auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid,
  output [2:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param,
  output [3:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source,
  output [1:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied,
  output [63:0] auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready,
  output        auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param,
  output [3:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size,
  output [3:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source,
  output [30:0] auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address,
  output [7:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask,
  output [63:0] auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt,
  output        auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param,
  input  [3:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size,
  input  [3:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt,
  output        auto_fixedClockNode_out_1_clock,
  output        auto_fixedClockNode_out_1_reset,
  output        auto_fixedClockNode_out_0_clock,
  output        auto_fixedClockNode_out_0_reset,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset,
  output        auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock,
  output        auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset,
  output        clock,
  output        reset
);
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_reset; // @[BusWrapper.scala 40:48]
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_reset; // @[BusWrapper.scala 40:48]
  wire  subsystem_sbus_clock_groups_auto_out_1_member_subsystem_l2_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_sbus_clock_groups_auto_out_1_member_subsystem_l2_0_reset; // @[BusWrapper.scala 40:48]
  wire  subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_reset; // @[BusWrapper.scala 40:48]
  wire  clockGroup_auto_in_member_subsystem_sbus_0_clock; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_in_member_subsystem_sbus_0_reset; // @[BusWrapper.scala 41:38]
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
  wire  system_bus_xbar_clock; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_reset; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_a_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_a_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_1_a_bits_opcode; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_1_a_bits_param; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_in_1_a_bits_size; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_1_a_bits_source; // @[SystemBus.scala 40:43]
  wire [31:0] system_bus_xbar_auto_in_1_a_bits_address; // @[SystemBus.scala 40:43]
  wire [7:0] system_bus_xbar_auto_in_1_a_bits_mask; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_in_1_a_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_a_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_b_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_b_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_1_b_bits_opcode; // @[SystemBus.scala 40:43]
  wire [1:0] system_bus_xbar_auto_in_1_b_bits_param; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_in_1_b_bits_size; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_1_b_bits_source; // @[SystemBus.scala 40:43]
  wire [31:0] system_bus_xbar_auto_in_1_b_bits_address; // @[SystemBus.scala 40:43]
  wire [7:0] system_bus_xbar_auto_in_1_b_bits_mask; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_in_1_b_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_b_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_c_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_c_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_1_c_bits_opcode; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_1_c_bits_param; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_in_1_c_bits_size; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_1_c_bits_source; // @[SystemBus.scala 40:43]
  wire [31:0] system_bus_xbar_auto_in_1_c_bits_address; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_in_1_c_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_c_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_d_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_d_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_1_d_bits_opcode; // @[SystemBus.scala 40:43]
  wire [1:0] system_bus_xbar_auto_in_1_d_bits_param; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_in_1_d_bits_size; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_1_d_bits_source; // @[SystemBus.scala 40:43]
  wire [1:0] system_bus_xbar_auto_in_1_d_bits_sink; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_d_bits_denied; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_in_1_d_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_d_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_e_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_1_e_valid; // @[SystemBus.scala 40:43]
  wire [1:0] system_bus_xbar_auto_in_1_e_bits_sink; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_0_a_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_0_a_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_0_a_bits_opcode; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_0_a_bits_param; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_in_0_a_bits_size; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_0_a_bits_source; // @[SystemBus.scala 40:43]
  wire [31:0] system_bus_xbar_auto_in_0_a_bits_address; // @[SystemBus.scala 40:43]
  wire [7:0] system_bus_xbar_auto_in_0_a_bits_mask; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_in_0_a_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_0_a_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_0_d_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_0_d_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_in_0_d_bits_opcode; // @[SystemBus.scala 40:43]
  wire [1:0] system_bus_xbar_auto_in_0_d_bits_param; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_in_0_d_bits_size; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_0_d_bits_source; // @[SystemBus.scala 40:43]
  wire [1:0] system_bus_xbar_auto_in_0_d_bits_sink; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_0_d_bits_denied; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_in_0_d_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_in_0_d_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_a_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_a_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_1_a_bits_opcode; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_1_a_bits_param; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_1_a_bits_size; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_out_1_a_bits_source; // @[SystemBus.scala 40:43]
  wire [31:0] system_bus_xbar_auto_out_1_a_bits_address; // @[SystemBus.scala 40:43]
  wire [7:0] system_bus_xbar_auto_out_1_a_bits_mask; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_out_1_a_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_a_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_b_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_b_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_1_b_bits_opcode; // @[SystemBus.scala 40:43]
  wire [1:0] system_bus_xbar_auto_out_1_b_bits_param; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_1_b_bits_size; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_out_1_b_bits_source; // @[SystemBus.scala 40:43]
  wire [31:0] system_bus_xbar_auto_out_1_b_bits_address; // @[SystemBus.scala 40:43]
  wire [7:0] system_bus_xbar_auto_out_1_b_bits_mask; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_out_1_b_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_b_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_c_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_c_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_1_c_bits_opcode; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_1_c_bits_param; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_1_c_bits_size; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_out_1_c_bits_source; // @[SystemBus.scala 40:43]
  wire [31:0] system_bus_xbar_auto_out_1_c_bits_address; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_out_1_c_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_c_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_d_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_d_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_1_d_bits_opcode; // @[SystemBus.scala 40:43]
  wire [1:0] system_bus_xbar_auto_out_1_d_bits_param; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_1_d_bits_size; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_out_1_d_bits_source; // @[SystemBus.scala 40:43]
  wire [1:0] system_bus_xbar_auto_out_1_d_bits_sink; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_d_bits_denied; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_out_1_d_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_d_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_e_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_1_e_valid; // @[SystemBus.scala 40:43]
  wire [1:0] system_bus_xbar_auto_out_1_e_bits_sink; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_0_a_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_0_a_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_0_a_bits_opcode; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_0_a_bits_param; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_out_0_a_bits_size; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_out_0_a_bits_source; // @[SystemBus.scala 40:43]
  wire [30:0] system_bus_xbar_auto_out_0_a_bits_address; // @[SystemBus.scala 40:43]
  wire [7:0] system_bus_xbar_auto_out_0_a_bits_mask; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_out_0_a_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_0_a_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_0_d_ready; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_0_d_valid; // @[SystemBus.scala 40:43]
  wire [2:0] system_bus_xbar_auto_out_0_d_bits_opcode; // @[SystemBus.scala 40:43]
  wire [1:0] system_bus_xbar_auto_out_0_d_bits_param; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_out_0_d_bits_size; // @[SystemBus.scala 40:43]
  wire [3:0] system_bus_xbar_auto_out_0_d_bits_source; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_0_d_bits_sink; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_0_d_bits_denied; // @[SystemBus.scala 40:43]
  wire [63:0] system_bus_xbar_auto_out_0_d_bits_data; // @[SystemBus.scala 40:43]
  wire  system_bus_xbar_auto_out_0_d_bits_corrupt; // @[SystemBus.scala 40:43]
  wire  fixer_clock; // @[FIFOFixer.scala 144:27]
  wire  fixer_reset; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_a_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_a_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_1_a_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_1_a_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_in_1_a_bits_size; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_1_a_bits_source; // @[FIFOFixer.scala 144:27]
  wire [31:0] fixer_auto_in_1_a_bits_address; // @[FIFOFixer.scala 144:27]
  wire [7:0] fixer_auto_in_1_a_bits_mask; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_in_1_a_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_a_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_b_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_b_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_1_b_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_in_1_b_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_in_1_b_bits_size; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_1_b_bits_source; // @[FIFOFixer.scala 144:27]
  wire [31:0] fixer_auto_in_1_b_bits_address; // @[FIFOFixer.scala 144:27]
  wire [7:0] fixer_auto_in_1_b_bits_mask; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_in_1_b_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_b_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_c_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_c_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_1_c_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_1_c_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_in_1_c_bits_size; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_1_c_bits_source; // @[FIFOFixer.scala 144:27]
  wire [31:0] fixer_auto_in_1_c_bits_address; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_in_1_c_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_c_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_d_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_d_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_1_d_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_in_1_d_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_in_1_d_bits_size; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_1_d_bits_source; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_in_1_d_bits_sink; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_d_bits_denied; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_in_1_d_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_d_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_e_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_1_e_valid; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_in_1_e_bits_sink; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_0_a_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_0_a_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_0_a_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_0_a_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_in_0_a_bits_size; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_0_a_bits_source; // @[FIFOFixer.scala 144:27]
  wire [31:0] fixer_auto_in_0_a_bits_address; // @[FIFOFixer.scala 144:27]
  wire [7:0] fixer_auto_in_0_a_bits_mask; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_in_0_a_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_0_a_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_0_d_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_0_d_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_0_d_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_in_0_d_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_in_0_d_bits_size; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_0_d_bits_source; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_in_0_d_bits_sink; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_0_d_bits_denied; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_in_0_d_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_0_d_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_a_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_a_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_1_a_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_1_a_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_out_1_a_bits_size; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_1_a_bits_source; // @[FIFOFixer.scala 144:27]
  wire [31:0] fixer_auto_out_1_a_bits_address; // @[FIFOFixer.scala 144:27]
  wire [7:0] fixer_auto_out_1_a_bits_mask; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_out_1_a_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_a_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_b_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_b_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_1_b_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_out_1_b_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_out_1_b_bits_size; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_1_b_bits_source; // @[FIFOFixer.scala 144:27]
  wire [31:0] fixer_auto_out_1_b_bits_address; // @[FIFOFixer.scala 144:27]
  wire [7:0] fixer_auto_out_1_b_bits_mask; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_out_1_b_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_b_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_c_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_c_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_1_c_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_1_c_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_out_1_c_bits_size; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_1_c_bits_source; // @[FIFOFixer.scala 144:27]
  wire [31:0] fixer_auto_out_1_c_bits_address; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_out_1_c_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_c_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_d_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_d_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_1_d_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_out_1_d_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_out_1_d_bits_size; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_1_d_bits_source; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_out_1_d_bits_sink; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_d_bits_denied; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_out_1_d_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_d_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_e_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_1_e_valid; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_out_1_e_bits_sink; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_0_a_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_0_a_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_0_a_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_0_a_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_out_0_a_bits_size; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_0_a_bits_source; // @[FIFOFixer.scala 144:27]
  wire [31:0] fixer_auto_out_0_a_bits_address; // @[FIFOFixer.scala 144:27]
  wire [7:0] fixer_auto_out_0_a_bits_mask; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_out_0_a_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_0_a_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_0_d_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_0_d_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_0_d_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_out_0_d_bits_param; // @[FIFOFixer.scala 144:27]
  wire [3:0] fixer_auto_out_0_d_bits_size; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_0_d_bits_source; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_out_0_d_bits_sink; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_0_d_bits_denied; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_out_0_d_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_0_d_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  coupler_to_bus_named_subsystem_cbus_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [30:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [30:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_clock; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_reset; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_b_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_b_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_c_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_c_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_address; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_e_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_in_e_valid; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_l2_auto_widget_in_e_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_b_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_b_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_c_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_c_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_address; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_e_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_l2_auto_widget_out_e_valid; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_l2_auto_widget_out_e_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_clock; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_reset; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_size; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_size; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_address; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_e_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_master_clock_xing_in_e_valid; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_boom_tile_auto_tl_master_clock_xing_in_e_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_boom_tile_auto_tl_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_from_boom_tile_auto_tl_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_from_boom_tile_auto_tl_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_boom_tile_auto_tl_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_b_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_b_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_out_b_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_boom_tile_auto_tl_out_b_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_boom_tile_auto_tl_out_b_bits_size; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_out_b_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_from_boom_tile_auto_tl_out_b_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_from_boom_tile_auto_tl_out_b_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_boom_tile_auto_tl_out_b_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_b_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_c_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_c_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_out_c_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_out_c_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_boom_tile_auto_tl_out_c_bits_size; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_out_c_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_from_boom_tile_auto_tl_out_c_bits_address; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_boom_tile_auto_tl_out_c_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_c_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_boom_tile_auto_tl_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_boom_tile_auto_tl_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_boom_tile_auto_tl_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_boom_tile_auto_tl_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_boom_tile_auto_tl_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_e_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_boom_tile_auto_tl_out_e_valid; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_boom_tile_auto_tl_out_e_bits_sink; // @[LazyModule.scala 432:27]
  ClockGroupAggregator subsystem_sbus_clock_groups ( // @[BusWrapper.scala 40:48]
    .auto_in_member_subsystem_sbus_1_clock(subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_clock),
    .auto_in_member_subsystem_sbus_1_reset(subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_reset),
    .auto_in_member_subsystem_sbus_0_clock(subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_clock),
    .auto_in_member_subsystem_sbus_0_reset(subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_reset),
    .auto_out_1_member_subsystem_l2_0_clock(subsystem_sbus_clock_groups_auto_out_1_member_subsystem_l2_0_clock),
    .auto_out_1_member_subsystem_l2_0_reset(subsystem_sbus_clock_groups_auto_out_1_member_subsystem_l2_0_reset),
    .auto_out_0_member_subsystem_sbus_0_clock(subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_clock),
    .auto_out_0_member_subsystem_sbus_0_reset(subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_reset)
  );
  ClockGroup clockGroup ( // @[BusWrapper.scala 41:38]
    .auto_in_member_subsystem_sbus_0_clock(clockGroup_auto_in_member_subsystem_sbus_0_clock),
    .auto_in_member_subsystem_sbus_0_reset(clockGroup_auto_in_member_subsystem_sbus_0_reset),
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
  TLXbar system_bus_xbar ( // @[SystemBus.scala 40:43]
    .clock(system_bus_xbar_clock),
    .reset(system_bus_xbar_reset),
    .auto_in_1_a_ready(system_bus_xbar_auto_in_1_a_ready),
    .auto_in_1_a_valid(system_bus_xbar_auto_in_1_a_valid),
    .auto_in_1_a_bits_opcode(system_bus_xbar_auto_in_1_a_bits_opcode),
    .auto_in_1_a_bits_param(system_bus_xbar_auto_in_1_a_bits_param),
    .auto_in_1_a_bits_size(system_bus_xbar_auto_in_1_a_bits_size),
    .auto_in_1_a_bits_source(system_bus_xbar_auto_in_1_a_bits_source),
    .auto_in_1_a_bits_address(system_bus_xbar_auto_in_1_a_bits_address),
    .auto_in_1_a_bits_mask(system_bus_xbar_auto_in_1_a_bits_mask),
    .auto_in_1_a_bits_data(system_bus_xbar_auto_in_1_a_bits_data),
    .auto_in_1_a_bits_corrupt(system_bus_xbar_auto_in_1_a_bits_corrupt),
    .auto_in_1_b_ready(system_bus_xbar_auto_in_1_b_ready),
    .auto_in_1_b_valid(system_bus_xbar_auto_in_1_b_valid),
    .auto_in_1_b_bits_opcode(system_bus_xbar_auto_in_1_b_bits_opcode),
    .auto_in_1_b_bits_param(system_bus_xbar_auto_in_1_b_bits_param),
    .auto_in_1_b_bits_size(system_bus_xbar_auto_in_1_b_bits_size),
    .auto_in_1_b_bits_source(system_bus_xbar_auto_in_1_b_bits_source),
    .auto_in_1_b_bits_address(system_bus_xbar_auto_in_1_b_bits_address),
    .auto_in_1_b_bits_mask(system_bus_xbar_auto_in_1_b_bits_mask),
    .auto_in_1_b_bits_data(system_bus_xbar_auto_in_1_b_bits_data),
    .auto_in_1_b_bits_corrupt(system_bus_xbar_auto_in_1_b_bits_corrupt),
    .auto_in_1_c_ready(system_bus_xbar_auto_in_1_c_ready),
    .auto_in_1_c_valid(system_bus_xbar_auto_in_1_c_valid),
    .auto_in_1_c_bits_opcode(system_bus_xbar_auto_in_1_c_bits_opcode),
    .auto_in_1_c_bits_param(system_bus_xbar_auto_in_1_c_bits_param),
    .auto_in_1_c_bits_size(system_bus_xbar_auto_in_1_c_bits_size),
    .auto_in_1_c_bits_source(system_bus_xbar_auto_in_1_c_bits_source),
    .auto_in_1_c_bits_address(system_bus_xbar_auto_in_1_c_bits_address),
    .auto_in_1_c_bits_data(system_bus_xbar_auto_in_1_c_bits_data),
    .auto_in_1_c_bits_corrupt(system_bus_xbar_auto_in_1_c_bits_corrupt),
    .auto_in_1_d_ready(system_bus_xbar_auto_in_1_d_ready),
    .auto_in_1_d_valid(system_bus_xbar_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode(system_bus_xbar_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_param(system_bus_xbar_auto_in_1_d_bits_param),
    .auto_in_1_d_bits_size(system_bus_xbar_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_source(system_bus_xbar_auto_in_1_d_bits_source),
    .auto_in_1_d_bits_sink(system_bus_xbar_auto_in_1_d_bits_sink),
    .auto_in_1_d_bits_denied(system_bus_xbar_auto_in_1_d_bits_denied),
    .auto_in_1_d_bits_data(system_bus_xbar_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt(system_bus_xbar_auto_in_1_d_bits_corrupt),
    .auto_in_1_e_ready(system_bus_xbar_auto_in_1_e_ready),
    .auto_in_1_e_valid(system_bus_xbar_auto_in_1_e_valid),
    .auto_in_1_e_bits_sink(system_bus_xbar_auto_in_1_e_bits_sink),
    .auto_in_0_a_ready(system_bus_xbar_auto_in_0_a_ready),
    .auto_in_0_a_valid(system_bus_xbar_auto_in_0_a_valid),
    .auto_in_0_a_bits_opcode(system_bus_xbar_auto_in_0_a_bits_opcode),
    .auto_in_0_a_bits_param(system_bus_xbar_auto_in_0_a_bits_param),
    .auto_in_0_a_bits_size(system_bus_xbar_auto_in_0_a_bits_size),
    .auto_in_0_a_bits_source(system_bus_xbar_auto_in_0_a_bits_source),
    .auto_in_0_a_bits_address(system_bus_xbar_auto_in_0_a_bits_address),
    .auto_in_0_a_bits_mask(system_bus_xbar_auto_in_0_a_bits_mask),
    .auto_in_0_a_bits_data(system_bus_xbar_auto_in_0_a_bits_data),
    .auto_in_0_a_bits_corrupt(system_bus_xbar_auto_in_0_a_bits_corrupt),
    .auto_in_0_d_ready(system_bus_xbar_auto_in_0_d_ready),
    .auto_in_0_d_valid(system_bus_xbar_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode(system_bus_xbar_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param(system_bus_xbar_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size(system_bus_xbar_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source(system_bus_xbar_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink(system_bus_xbar_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied(system_bus_xbar_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data(system_bus_xbar_auto_in_0_d_bits_data),
    .auto_in_0_d_bits_corrupt(system_bus_xbar_auto_in_0_d_bits_corrupt),
    .auto_out_1_a_ready(system_bus_xbar_auto_out_1_a_ready),
    .auto_out_1_a_valid(system_bus_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(system_bus_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(system_bus_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(system_bus_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(system_bus_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(system_bus_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(system_bus_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(system_bus_xbar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(system_bus_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_b_ready(system_bus_xbar_auto_out_1_b_ready),
    .auto_out_1_b_valid(system_bus_xbar_auto_out_1_b_valid),
    .auto_out_1_b_bits_opcode(system_bus_xbar_auto_out_1_b_bits_opcode),
    .auto_out_1_b_bits_param(system_bus_xbar_auto_out_1_b_bits_param),
    .auto_out_1_b_bits_size(system_bus_xbar_auto_out_1_b_bits_size),
    .auto_out_1_b_bits_source(system_bus_xbar_auto_out_1_b_bits_source),
    .auto_out_1_b_bits_address(system_bus_xbar_auto_out_1_b_bits_address),
    .auto_out_1_b_bits_mask(system_bus_xbar_auto_out_1_b_bits_mask),
    .auto_out_1_b_bits_data(system_bus_xbar_auto_out_1_b_bits_data),
    .auto_out_1_b_bits_corrupt(system_bus_xbar_auto_out_1_b_bits_corrupt),
    .auto_out_1_c_ready(system_bus_xbar_auto_out_1_c_ready),
    .auto_out_1_c_valid(system_bus_xbar_auto_out_1_c_valid),
    .auto_out_1_c_bits_opcode(system_bus_xbar_auto_out_1_c_bits_opcode),
    .auto_out_1_c_bits_param(system_bus_xbar_auto_out_1_c_bits_param),
    .auto_out_1_c_bits_size(system_bus_xbar_auto_out_1_c_bits_size),
    .auto_out_1_c_bits_source(system_bus_xbar_auto_out_1_c_bits_source),
    .auto_out_1_c_bits_address(system_bus_xbar_auto_out_1_c_bits_address),
    .auto_out_1_c_bits_data(system_bus_xbar_auto_out_1_c_bits_data),
    .auto_out_1_c_bits_corrupt(system_bus_xbar_auto_out_1_c_bits_corrupt),
    .auto_out_1_d_ready(system_bus_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid(system_bus_xbar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(system_bus_xbar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(system_bus_xbar_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(system_bus_xbar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(system_bus_xbar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_sink(system_bus_xbar_auto_out_1_d_bits_sink),
    .auto_out_1_d_bits_denied(system_bus_xbar_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(system_bus_xbar_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(system_bus_xbar_auto_out_1_d_bits_corrupt),
    .auto_out_1_e_ready(system_bus_xbar_auto_out_1_e_ready),
    .auto_out_1_e_valid(system_bus_xbar_auto_out_1_e_valid),
    .auto_out_1_e_bits_sink(system_bus_xbar_auto_out_1_e_bits_sink),
    .auto_out_0_a_ready(system_bus_xbar_auto_out_0_a_ready),
    .auto_out_0_a_valid(system_bus_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(system_bus_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(system_bus_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(system_bus_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(system_bus_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(system_bus_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(system_bus_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(system_bus_xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(system_bus_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(system_bus_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid(system_bus_xbar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(system_bus_xbar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(system_bus_xbar_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(system_bus_xbar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(system_bus_xbar_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(system_bus_xbar_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(system_bus_xbar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(system_bus_xbar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(system_bus_xbar_auto_out_0_d_bits_corrupt)
  );
  TLFIFOFixer fixer ( // @[FIFOFixer.scala 144:27]
    .clock(fixer_clock),
    .reset(fixer_reset),
    .auto_in_1_a_ready(fixer_auto_in_1_a_ready),
    .auto_in_1_a_valid(fixer_auto_in_1_a_valid),
    .auto_in_1_a_bits_opcode(fixer_auto_in_1_a_bits_opcode),
    .auto_in_1_a_bits_param(fixer_auto_in_1_a_bits_param),
    .auto_in_1_a_bits_size(fixer_auto_in_1_a_bits_size),
    .auto_in_1_a_bits_source(fixer_auto_in_1_a_bits_source),
    .auto_in_1_a_bits_address(fixer_auto_in_1_a_bits_address),
    .auto_in_1_a_bits_mask(fixer_auto_in_1_a_bits_mask),
    .auto_in_1_a_bits_data(fixer_auto_in_1_a_bits_data),
    .auto_in_1_a_bits_corrupt(fixer_auto_in_1_a_bits_corrupt),
    .auto_in_1_b_ready(fixer_auto_in_1_b_ready),
    .auto_in_1_b_valid(fixer_auto_in_1_b_valid),
    .auto_in_1_b_bits_opcode(fixer_auto_in_1_b_bits_opcode),
    .auto_in_1_b_bits_param(fixer_auto_in_1_b_bits_param),
    .auto_in_1_b_bits_size(fixer_auto_in_1_b_bits_size),
    .auto_in_1_b_bits_source(fixer_auto_in_1_b_bits_source),
    .auto_in_1_b_bits_address(fixer_auto_in_1_b_bits_address),
    .auto_in_1_b_bits_mask(fixer_auto_in_1_b_bits_mask),
    .auto_in_1_b_bits_data(fixer_auto_in_1_b_bits_data),
    .auto_in_1_b_bits_corrupt(fixer_auto_in_1_b_bits_corrupt),
    .auto_in_1_c_ready(fixer_auto_in_1_c_ready),
    .auto_in_1_c_valid(fixer_auto_in_1_c_valid),
    .auto_in_1_c_bits_opcode(fixer_auto_in_1_c_bits_opcode),
    .auto_in_1_c_bits_param(fixer_auto_in_1_c_bits_param),
    .auto_in_1_c_bits_size(fixer_auto_in_1_c_bits_size),
    .auto_in_1_c_bits_source(fixer_auto_in_1_c_bits_source),
    .auto_in_1_c_bits_address(fixer_auto_in_1_c_bits_address),
    .auto_in_1_c_bits_data(fixer_auto_in_1_c_bits_data),
    .auto_in_1_c_bits_corrupt(fixer_auto_in_1_c_bits_corrupt),
    .auto_in_1_d_ready(fixer_auto_in_1_d_ready),
    .auto_in_1_d_valid(fixer_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode(fixer_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_param(fixer_auto_in_1_d_bits_param),
    .auto_in_1_d_bits_size(fixer_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_source(fixer_auto_in_1_d_bits_source),
    .auto_in_1_d_bits_sink(fixer_auto_in_1_d_bits_sink),
    .auto_in_1_d_bits_denied(fixer_auto_in_1_d_bits_denied),
    .auto_in_1_d_bits_data(fixer_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt(fixer_auto_in_1_d_bits_corrupt),
    .auto_in_1_e_ready(fixer_auto_in_1_e_ready),
    .auto_in_1_e_valid(fixer_auto_in_1_e_valid),
    .auto_in_1_e_bits_sink(fixer_auto_in_1_e_bits_sink),
    .auto_in_0_a_ready(fixer_auto_in_0_a_ready),
    .auto_in_0_a_valid(fixer_auto_in_0_a_valid),
    .auto_in_0_a_bits_opcode(fixer_auto_in_0_a_bits_opcode),
    .auto_in_0_a_bits_param(fixer_auto_in_0_a_bits_param),
    .auto_in_0_a_bits_size(fixer_auto_in_0_a_bits_size),
    .auto_in_0_a_bits_source(fixer_auto_in_0_a_bits_source),
    .auto_in_0_a_bits_address(fixer_auto_in_0_a_bits_address),
    .auto_in_0_a_bits_mask(fixer_auto_in_0_a_bits_mask),
    .auto_in_0_a_bits_data(fixer_auto_in_0_a_bits_data),
    .auto_in_0_a_bits_corrupt(fixer_auto_in_0_a_bits_corrupt),
    .auto_in_0_d_ready(fixer_auto_in_0_d_ready),
    .auto_in_0_d_valid(fixer_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode(fixer_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param(fixer_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size(fixer_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source(fixer_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink(fixer_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied(fixer_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data(fixer_auto_in_0_d_bits_data),
    .auto_in_0_d_bits_corrupt(fixer_auto_in_0_d_bits_corrupt),
    .auto_out_1_a_ready(fixer_auto_out_1_a_ready),
    .auto_out_1_a_valid(fixer_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(fixer_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(fixer_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(fixer_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(fixer_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(fixer_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(fixer_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(fixer_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(fixer_auto_out_1_a_bits_corrupt),
    .auto_out_1_b_ready(fixer_auto_out_1_b_ready),
    .auto_out_1_b_valid(fixer_auto_out_1_b_valid),
    .auto_out_1_b_bits_opcode(fixer_auto_out_1_b_bits_opcode),
    .auto_out_1_b_bits_param(fixer_auto_out_1_b_bits_param),
    .auto_out_1_b_bits_size(fixer_auto_out_1_b_bits_size),
    .auto_out_1_b_bits_source(fixer_auto_out_1_b_bits_source),
    .auto_out_1_b_bits_address(fixer_auto_out_1_b_bits_address),
    .auto_out_1_b_bits_mask(fixer_auto_out_1_b_bits_mask),
    .auto_out_1_b_bits_data(fixer_auto_out_1_b_bits_data),
    .auto_out_1_b_bits_corrupt(fixer_auto_out_1_b_bits_corrupt),
    .auto_out_1_c_ready(fixer_auto_out_1_c_ready),
    .auto_out_1_c_valid(fixer_auto_out_1_c_valid),
    .auto_out_1_c_bits_opcode(fixer_auto_out_1_c_bits_opcode),
    .auto_out_1_c_bits_param(fixer_auto_out_1_c_bits_param),
    .auto_out_1_c_bits_size(fixer_auto_out_1_c_bits_size),
    .auto_out_1_c_bits_source(fixer_auto_out_1_c_bits_source),
    .auto_out_1_c_bits_address(fixer_auto_out_1_c_bits_address),
    .auto_out_1_c_bits_data(fixer_auto_out_1_c_bits_data),
    .auto_out_1_c_bits_corrupt(fixer_auto_out_1_c_bits_corrupt),
    .auto_out_1_d_ready(fixer_auto_out_1_d_ready),
    .auto_out_1_d_valid(fixer_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(fixer_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(fixer_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(fixer_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(fixer_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_sink(fixer_auto_out_1_d_bits_sink),
    .auto_out_1_d_bits_denied(fixer_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(fixer_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(fixer_auto_out_1_d_bits_corrupt),
    .auto_out_1_e_ready(fixer_auto_out_1_e_ready),
    .auto_out_1_e_valid(fixer_auto_out_1_e_valid),
    .auto_out_1_e_bits_sink(fixer_auto_out_1_e_bits_sink),
    .auto_out_0_a_ready(fixer_auto_out_0_a_ready),
    .auto_out_0_a_valid(fixer_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(fixer_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(fixer_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(fixer_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(fixer_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(fixer_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(fixer_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(fixer_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(fixer_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(fixer_auto_out_0_d_ready),
    .auto_out_0_d_valid(fixer_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(fixer_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(fixer_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(fixer_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(fixer_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(fixer_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(fixer_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(fixer_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(fixer_auto_out_0_d_bits_corrupt)
  );
  TLInterconnectCoupler coupler_to_bus_named_subsystem_cbus ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_bus_named_subsystem_cbus_clock),
    .reset(coupler_to_bus_named_subsystem_cbus_reset),
    .auto_widget_in_a_ready(coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_ready),
    .auto_widget_in_a_valid(coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_valid),
    .auto_widget_in_a_bits_opcode(coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_opcode),
    .auto_widget_in_a_bits_param(coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_param),
    .auto_widget_in_a_bits_size(coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_size),
    .auto_widget_in_a_bits_source(coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_source),
    .auto_widget_in_a_bits_address(coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_address),
    .auto_widget_in_a_bits_mask(coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_mask),
    .auto_widget_in_a_bits_data(coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_data),
    .auto_widget_in_a_bits_corrupt(coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_corrupt),
    .auto_widget_in_d_ready(coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_ready),
    .auto_widget_in_d_valid(coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_valid),
    .auto_widget_in_d_bits_opcode(coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_opcode),
    .auto_widget_in_d_bits_param(coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_param),
    .auto_widget_in_d_bits_size(coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_size),
    .auto_widget_in_d_bits_source(coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_source),
    .auto_widget_in_d_bits_sink(coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_sink),
    .auto_widget_in_d_bits_denied(coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_denied),
    .auto_widget_in_d_bits_data(coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_data),
    .auto_widget_in_d_bits_corrupt(coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_corrupt),
    .auto_bus_xing_out_a_ready(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_ready),
    .auto_bus_xing_out_a_valid(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_valid),
    .auto_bus_xing_out_a_bits_opcode(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_opcode),
    .auto_bus_xing_out_a_bits_param(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_param),
    .auto_bus_xing_out_a_bits_size(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_size),
    .auto_bus_xing_out_a_bits_source(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_source),
    .auto_bus_xing_out_a_bits_address(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_address),
    .auto_bus_xing_out_a_bits_mask(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_mask),
    .auto_bus_xing_out_a_bits_data(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_data),
    .auto_bus_xing_out_a_bits_corrupt(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_corrupt),
    .auto_bus_xing_out_d_ready(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_ready),
    .auto_bus_xing_out_d_valid(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_valid),
    .auto_bus_xing_out_d_bits_opcode(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_opcode),
    .auto_bus_xing_out_d_bits_param(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_param),
    .auto_bus_xing_out_d_bits_size(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_size),
    .auto_bus_xing_out_d_bits_source(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_source),
    .auto_bus_xing_out_d_bits_sink(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_sink),
    .auto_bus_xing_out_d_bits_denied(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_denied),
    .auto_bus_xing_out_d_bits_data(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_data),
    .auto_bus_xing_out_d_bits_corrupt(coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_corrupt)
  );
  TLInterconnectCoupler_1 coupler_from_bus_named_subsystem_fbus ( // @[LazyModule.scala 432:27]
    .clock(coupler_from_bus_named_subsystem_fbus_clock),
    .reset(coupler_from_bus_named_subsystem_fbus_reset),
    .auto_widget_out_a_ready(coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_ready),
    .auto_widget_out_a_valid(coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_valid),
    .auto_widget_out_a_bits_opcode(coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_opcode),
    .auto_widget_out_a_bits_param(coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_param),
    .auto_widget_out_a_bits_size(coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_size),
    .auto_widget_out_a_bits_source(coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_source),
    .auto_widget_out_a_bits_address(coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_address),
    .auto_widget_out_a_bits_mask(coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_mask),
    .auto_widget_out_a_bits_data(coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_data),
    .auto_widget_out_a_bits_corrupt(coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_corrupt),
    .auto_widget_out_d_ready(coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_ready),
    .auto_widget_out_d_valid(coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_valid),
    .auto_widget_out_d_bits_opcode(coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_opcode),
    .auto_widget_out_d_bits_param(coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_param),
    .auto_widget_out_d_bits_size(coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_size),
    .auto_widget_out_d_bits_source(coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_source),
    .auto_widget_out_d_bits_sink(coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_sink),
    .auto_widget_out_d_bits_denied(coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_denied),
    .auto_widget_out_d_bits_data(coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_data),
    .auto_widget_out_d_bits_corrupt(coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_corrupt),
    .auto_bus_xing_in_a_ready(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_ready),
    .auto_bus_xing_in_a_valid(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_valid),
    .auto_bus_xing_in_a_bits_opcode(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_opcode),
    .auto_bus_xing_in_a_bits_param(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_param),
    .auto_bus_xing_in_a_bits_size(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_size),
    .auto_bus_xing_in_a_bits_source(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_source),
    .auto_bus_xing_in_a_bits_address(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_address),
    .auto_bus_xing_in_a_bits_mask(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_mask),
    .auto_bus_xing_in_a_bits_data(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_data),
    .auto_bus_xing_in_a_bits_corrupt(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_corrupt),
    .auto_bus_xing_in_d_ready(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_ready),
    .auto_bus_xing_in_d_valid(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_valid),
    .auto_bus_xing_in_d_bits_opcode(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_opcode),
    .auto_bus_xing_in_d_bits_param(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_param),
    .auto_bus_xing_in_d_bits_size(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_size),
    .auto_bus_xing_in_d_bits_source(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_source),
    .auto_bus_xing_in_d_bits_sink(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_sink),
    .auto_bus_xing_in_d_bits_denied(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_denied),
    .auto_bus_xing_in_d_bits_data(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_data),
    .auto_bus_xing_in_d_bits_corrupt(coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_2 coupler_to_bus_named_subsystem_l2 ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_bus_named_subsystem_l2_clock),
    .reset(coupler_to_bus_named_subsystem_l2_reset),
    .auto_widget_in_a_ready(coupler_to_bus_named_subsystem_l2_auto_widget_in_a_ready),
    .auto_widget_in_a_valid(coupler_to_bus_named_subsystem_l2_auto_widget_in_a_valid),
    .auto_widget_in_a_bits_opcode(coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_opcode),
    .auto_widget_in_a_bits_param(coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_param),
    .auto_widget_in_a_bits_size(coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_size),
    .auto_widget_in_a_bits_source(coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_source),
    .auto_widget_in_a_bits_address(coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_address),
    .auto_widget_in_a_bits_mask(coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_mask),
    .auto_widget_in_a_bits_data(coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_data),
    .auto_widget_in_a_bits_corrupt(coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_corrupt),
    .auto_widget_in_b_ready(coupler_to_bus_named_subsystem_l2_auto_widget_in_b_ready),
    .auto_widget_in_b_valid(coupler_to_bus_named_subsystem_l2_auto_widget_in_b_valid),
    .auto_widget_in_b_bits_opcode(coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_opcode),
    .auto_widget_in_b_bits_param(coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_param),
    .auto_widget_in_b_bits_size(coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_size),
    .auto_widget_in_b_bits_source(coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_source),
    .auto_widget_in_b_bits_address(coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_address),
    .auto_widget_in_b_bits_mask(coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_mask),
    .auto_widget_in_b_bits_data(coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_data),
    .auto_widget_in_b_bits_corrupt(coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_corrupt),
    .auto_widget_in_c_ready(coupler_to_bus_named_subsystem_l2_auto_widget_in_c_ready),
    .auto_widget_in_c_valid(coupler_to_bus_named_subsystem_l2_auto_widget_in_c_valid),
    .auto_widget_in_c_bits_opcode(coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_opcode),
    .auto_widget_in_c_bits_param(coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_param),
    .auto_widget_in_c_bits_size(coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_size),
    .auto_widget_in_c_bits_source(coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_source),
    .auto_widget_in_c_bits_address(coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_address),
    .auto_widget_in_c_bits_data(coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_data),
    .auto_widget_in_c_bits_corrupt(coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_corrupt),
    .auto_widget_in_d_ready(coupler_to_bus_named_subsystem_l2_auto_widget_in_d_ready),
    .auto_widget_in_d_valid(coupler_to_bus_named_subsystem_l2_auto_widget_in_d_valid),
    .auto_widget_in_d_bits_opcode(coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_opcode),
    .auto_widget_in_d_bits_param(coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_param),
    .auto_widget_in_d_bits_size(coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_size),
    .auto_widget_in_d_bits_source(coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_source),
    .auto_widget_in_d_bits_sink(coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_sink),
    .auto_widget_in_d_bits_denied(coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_denied),
    .auto_widget_in_d_bits_data(coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_data),
    .auto_widget_in_d_bits_corrupt(coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_corrupt),
    .auto_widget_in_e_ready(coupler_to_bus_named_subsystem_l2_auto_widget_in_e_ready),
    .auto_widget_in_e_valid(coupler_to_bus_named_subsystem_l2_auto_widget_in_e_valid),
    .auto_widget_in_e_bits_sink(coupler_to_bus_named_subsystem_l2_auto_widget_in_e_bits_sink),
    .auto_widget_out_a_ready(coupler_to_bus_named_subsystem_l2_auto_widget_out_a_ready),
    .auto_widget_out_a_valid(coupler_to_bus_named_subsystem_l2_auto_widget_out_a_valid),
    .auto_widget_out_a_bits_opcode(coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_opcode),
    .auto_widget_out_a_bits_param(coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_param),
    .auto_widget_out_a_bits_size(coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_size),
    .auto_widget_out_a_bits_source(coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_source),
    .auto_widget_out_a_bits_address(coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_address),
    .auto_widget_out_a_bits_mask(coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_mask),
    .auto_widget_out_a_bits_data(coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_data),
    .auto_widget_out_a_bits_corrupt(coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_corrupt),
    .auto_widget_out_b_ready(coupler_to_bus_named_subsystem_l2_auto_widget_out_b_ready),
    .auto_widget_out_b_valid(coupler_to_bus_named_subsystem_l2_auto_widget_out_b_valid),
    .auto_widget_out_b_bits_opcode(coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_opcode),
    .auto_widget_out_b_bits_param(coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_param),
    .auto_widget_out_b_bits_size(coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_size),
    .auto_widget_out_b_bits_source(coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_source),
    .auto_widget_out_b_bits_address(coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_address),
    .auto_widget_out_b_bits_mask(coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_mask),
    .auto_widget_out_b_bits_data(coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_data),
    .auto_widget_out_b_bits_corrupt(coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_corrupt),
    .auto_widget_out_c_ready(coupler_to_bus_named_subsystem_l2_auto_widget_out_c_ready),
    .auto_widget_out_c_valid(coupler_to_bus_named_subsystem_l2_auto_widget_out_c_valid),
    .auto_widget_out_c_bits_opcode(coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_opcode),
    .auto_widget_out_c_bits_param(coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_param),
    .auto_widget_out_c_bits_size(coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_size),
    .auto_widget_out_c_bits_source(coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_source),
    .auto_widget_out_c_bits_address(coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_address),
    .auto_widget_out_c_bits_data(coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_data),
    .auto_widget_out_c_bits_corrupt(coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_corrupt),
    .auto_widget_out_d_ready(coupler_to_bus_named_subsystem_l2_auto_widget_out_d_ready),
    .auto_widget_out_d_valid(coupler_to_bus_named_subsystem_l2_auto_widget_out_d_valid),
    .auto_widget_out_d_bits_opcode(coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_opcode),
    .auto_widget_out_d_bits_param(coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_param),
    .auto_widget_out_d_bits_size(coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_size),
    .auto_widget_out_d_bits_source(coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_source),
    .auto_widget_out_d_bits_sink(coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_sink),
    .auto_widget_out_d_bits_denied(coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_denied),
    .auto_widget_out_d_bits_data(coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_data),
    .auto_widget_out_d_bits_corrupt(coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_corrupt),
    .auto_widget_out_e_ready(coupler_to_bus_named_subsystem_l2_auto_widget_out_e_ready),
    .auto_widget_out_e_valid(coupler_to_bus_named_subsystem_l2_auto_widget_out_e_valid),
    .auto_widget_out_e_bits_sink(coupler_to_bus_named_subsystem_l2_auto_widget_out_e_bits_sink)
  );
  TLInterconnectCoupler_3 coupler_from_boom_tile ( // @[LazyModule.scala 432:27]
    .clock(coupler_from_boom_tile_clock),
    .reset(coupler_from_boom_tile_reset),
    .auto_tl_master_clock_xing_in_a_ready(coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_ready),
    .auto_tl_master_clock_xing_in_a_valid(coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_valid),
    .auto_tl_master_clock_xing_in_a_bits_opcode(coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_opcode),
    .auto_tl_master_clock_xing_in_a_bits_param(coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_param),
    .auto_tl_master_clock_xing_in_a_bits_size(coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_size),
    .auto_tl_master_clock_xing_in_a_bits_source(coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_source),
    .auto_tl_master_clock_xing_in_a_bits_address(coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_address),
    .auto_tl_master_clock_xing_in_a_bits_mask(coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_mask),
    .auto_tl_master_clock_xing_in_a_bits_data(coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_data),
    .auto_tl_master_clock_xing_in_a_bits_corrupt(coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_corrupt),
    .auto_tl_master_clock_xing_in_b_ready(coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_ready),
    .auto_tl_master_clock_xing_in_b_valid(coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_valid),
    .auto_tl_master_clock_xing_in_b_bits_opcode(coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_opcode),
    .auto_tl_master_clock_xing_in_b_bits_param(coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_param),
    .auto_tl_master_clock_xing_in_b_bits_size(coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_size),
    .auto_tl_master_clock_xing_in_b_bits_source(coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_source),
    .auto_tl_master_clock_xing_in_b_bits_address(coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_address),
    .auto_tl_master_clock_xing_in_b_bits_mask(coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_mask),
    .auto_tl_master_clock_xing_in_b_bits_data(coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_data),
    .auto_tl_master_clock_xing_in_b_bits_corrupt(coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_corrupt),
    .auto_tl_master_clock_xing_in_c_ready(coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_ready),
    .auto_tl_master_clock_xing_in_c_valid(coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_valid),
    .auto_tl_master_clock_xing_in_c_bits_opcode(coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_opcode),
    .auto_tl_master_clock_xing_in_c_bits_param(coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_param),
    .auto_tl_master_clock_xing_in_c_bits_size(coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_size),
    .auto_tl_master_clock_xing_in_c_bits_source(coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_source),
    .auto_tl_master_clock_xing_in_c_bits_address(coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_address),
    .auto_tl_master_clock_xing_in_c_bits_data(coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_data),
    .auto_tl_master_clock_xing_in_c_bits_corrupt(coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_corrupt),
    .auto_tl_master_clock_xing_in_d_ready(coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_ready),
    .auto_tl_master_clock_xing_in_d_valid(coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_valid),
    .auto_tl_master_clock_xing_in_d_bits_opcode(coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_opcode),
    .auto_tl_master_clock_xing_in_d_bits_param(coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_param),
    .auto_tl_master_clock_xing_in_d_bits_size(coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_size),
    .auto_tl_master_clock_xing_in_d_bits_source(coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_source),
    .auto_tl_master_clock_xing_in_d_bits_sink(coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_sink),
    .auto_tl_master_clock_xing_in_d_bits_denied(coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_denied),
    .auto_tl_master_clock_xing_in_d_bits_data(coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_data),
    .auto_tl_master_clock_xing_in_d_bits_corrupt(coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_corrupt),
    .auto_tl_master_clock_xing_in_e_ready(coupler_from_boom_tile_auto_tl_master_clock_xing_in_e_ready),
    .auto_tl_master_clock_xing_in_e_valid(coupler_from_boom_tile_auto_tl_master_clock_xing_in_e_valid),
    .auto_tl_master_clock_xing_in_e_bits_sink(coupler_from_boom_tile_auto_tl_master_clock_xing_in_e_bits_sink),
    .auto_tl_out_a_ready(coupler_from_boom_tile_auto_tl_out_a_ready),
    .auto_tl_out_a_valid(coupler_from_boom_tile_auto_tl_out_a_valid),
    .auto_tl_out_a_bits_opcode(coupler_from_boom_tile_auto_tl_out_a_bits_opcode),
    .auto_tl_out_a_bits_param(coupler_from_boom_tile_auto_tl_out_a_bits_param),
    .auto_tl_out_a_bits_size(coupler_from_boom_tile_auto_tl_out_a_bits_size),
    .auto_tl_out_a_bits_source(coupler_from_boom_tile_auto_tl_out_a_bits_source),
    .auto_tl_out_a_bits_address(coupler_from_boom_tile_auto_tl_out_a_bits_address),
    .auto_tl_out_a_bits_mask(coupler_from_boom_tile_auto_tl_out_a_bits_mask),
    .auto_tl_out_a_bits_data(coupler_from_boom_tile_auto_tl_out_a_bits_data),
    .auto_tl_out_a_bits_corrupt(coupler_from_boom_tile_auto_tl_out_a_bits_corrupt),
    .auto_tl_out_b_ready(coupler_from_boom_tile_auto_tl_out_b_ready),
    .auto_tl_out_b_valid(coupler_from_boom_tile_auto_tl_out_b_valid),
    .auto_tl_out_b_bits_opcode(coupler_from_boom_tile_auto_tl_out_b_bits_opcode),
    .auto_tl_out_b_bits_param(coupler_from_boom_tile_auto_tl_out_b_bits_param),
    .auto_tl_out_b_bits_size(coupler_from_boom_tile_auto_tl_out_b_bits_size),
    .auto_tl_out_b_bits_source(coupler_from_boom_tile_auto_tl_out_b_bits_source),
    .auto_tl_out_b_bits_address(coupler_from_boom_tile_auto_tl_out_b_bits_address),
    .auto_tl_out_b_bits_mask(coupler_from_boom_tile_auto_tl_out_b_bits_mask),
    .auto_tl_out_b_bits_data(coupler_from_boom_tile_auto_tl_out_b_bits_data),
    .auto_tl_out_b_bits_corrupt(coupler_from_boom_tile_auto_tl_out_b_bits_corrupt),
    .auto_tl_out_c_ready(coupler_from_boom_tile_auto_tl_out_c_ready),
    .auto_tl_out_c_valid(coupler_from_boom_tile_auto_tl_out_c_valid),
    .auto_tl_out_c_bits_opcode(coupler_from_boom_tile_auto_tl_out_c_bits_opcode),
    .auto_tl_out_c_bits_param(coupler_from_boom_tile_auto_tl_out_c_bits_param),
    .auto_tl_out_c_bits_size(coupler_from_boom_tile_auto_tl_out_c_bits_size),
    .auto_tl_out_c_bits_source(coupler_from_boom_tile_auto_tl_out_c_bits_source),
    .auto_tl_out_c_bits_address(coupler_from_boom_tile_auto_tl_out_c_bits_address),
    .auto_tl_out_c_bits_data(coupler_from_boom_tile_auto_tl_out_c_bits_data),
    .auto_tl_out_c_bits_corrupt(coupler_from_boom_tile_auto_tl_out_c_bits_corrupt),
    .auto_tl_out_d_ready(coupler_from_boom_tile_auto_tl_out_d_ready),
    .auto_tl_out_d_valid(coupler_from_boom_tile_auto_tl_out_d_valid),
    .auto_tl_out_d_bits_opcode(coupler_from_boom_tile_auto_tl_out_d_bits_opcode),
    .auto_tl_out_d_bits_param(coupler_from_boom_tile_auto_tl_out_d_bits_param),
    .auto_tl_out_d_bits_size(coupler_from_boom_tile_auto_tl_out_d_bits_size),
    .auto_tl_out_d_bits_source(coupler_from_boom_tile_auto_tl_out_d_bits_source),
    .auto_tl_out_d_bits_sink(coupler_from_boom_tile_auto_tl_out_d_bits_sink),
    .auto_tl_out_d_bits_denied(coupler_from_boom_tile_auto_tl_out_d_bits_denied),
    .auto_tl_out_d_bits_data(coupler_from_boom_tile_auto_tl_out_d_bits_data),
    .auto_tl_out_d_bits_corrupt(coupler_from_boom_tile_auto_tl_out_d_bits_corrupt),
    .auto_tl_out_e_ready(coupler_from_boom_tile_auto_tl_out_e_ready),
    .auto_tl_out_e_valid(coupler_from_boom_tile_auto_tl_out_e_valid),
    .auto_tl_out_e_bits_sink(coupler_from_boom_tile_auto_tl_out_e_bits_sink)
  );
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_valid; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_opcode =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_param; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_size =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_size; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_source =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_source; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_address; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_mask =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_mask; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_data =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_data; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_corrupt =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_bits_corrupt; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_ready; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_ready =
    coupler_from_boom_tile_auto_tl_master_clock_xing_in_e_ready; // @[LazyModule.scala 309:16]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_b_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_c_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_c_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_e_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink =
    coupler_to_bus_named_subsystem_l2_auto_widget_out_e_bits_sink; // @[LazyModule.scala 311:12]
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt =
    coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready =
    coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_1_clock = fixedClockNode_auto_out_2_clock; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_1_reset = fixedClockNode_auto_out_2_reset; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_0_clock = fixedClockNode_auto_out_1_clock; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_0_reset = fixedClockNode_auto_out_1_reset; // @[LazyModule.scala 311:12]
  assign auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock =
    subsystem_sbus_clock_groups_auto_out_1_member_subsystem_l2_0_clock; // @[LazyModule.scala 311:12]
  assign auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset =
    subsystem_sbus_clock_groups_auto_out_1_member_subsystem_l2_0_reset; // @[LazyModule.scala 311:12]
  assign clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_clock =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock; // @[LazyModule.scala 309:16]
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_1_reset =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset; // @[LazyModule.scala 309:16]
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_clock =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_sbus_clock_groups_auto_in_member_subsystem_sbus_0_reset =
    auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset; // @[LazyModule.scala 309:16]
  assign clockGroup_auto_in_member_subsystem_sbus_0_clock =
    subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_clock; // @[LazyModule.scala 298:16]
  assign clockGroup_auto_in_member_subsystem_sbus_0_reset =
    subsystem_sbus_clock_groups_auto_out_0_member_subsystem_sbus_0_reset; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_clock = clockGroup_auto_out_clock; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_reset = clockGroup_auto_out_reset; // @[LazyModule.scala 298:16]
  assign broadcast_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign broadcast_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign system_bus_xbar_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign system_bus_xbar_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_a_valid = fixer_auto_out_1_a_valid; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_a_bits_opcode = fixer_auto_out_1_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_a_bits_param = fixer_auto_out_1_a_bits_param; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_a_bits_size = fixer_auto_out_1_a_bits_size; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_a_bits_source = fixer_auto_out_1_a_bits_source; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_a_bits_address = fixer_auto_out_1_a_bits_address; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_a_bits_mask = fixer_auto_out_1_a_bits_mask; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_a_bits_data = fixer_auto_out_1_a_bits_data; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_a_bits_corrupt = fixer_auto_out_1_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_b_ready = fixer_auto_out_1_b_ready; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_c_valid = fixer_auto_out_1_c_valid; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_c_bits_opcode = fixer_auto_out_1_c_bits_opcode; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_c_bits_param = fixer_auto_out_1_c_bits_param; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_c_bits_size = fixer_auto_out_1_c_bits_size; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_c_bits_source = fixer_auto_out_1_c_bits_source; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_c_bits_address = fixer_auto_out_1_c_bits_address; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_c_bits_data = fixer_auto_out_1_c_bits_data; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_c_bits_corrupt = fixer_auto_out_1_c_bits_corrupt; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_d_ready = fixer_auto_out_1_d_ready; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_e_valid = fixer_auto_out_1_e_valid; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_1_e_bits_sink = fixer_auto_out_1_e_bits_sink; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_0_a_valid = fixer_auto_out_0_a_valid; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_0_a_bits_opcode = fixer_auto_out_0_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_0_a_bits_param = fixer_auto_out_0_a_bits_param; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_0_a_bits_size = fixer_auto_out_0_a_bits_size; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_0_a_bits_source = fixer_auto_out_0_a_bits_source; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_0_a_bits_address = fixer_auto_out_0_a_bits_address; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_0_a_bits_mask = fixer_auto_out_0_a_bits_mask; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_0_a_bits_data = fixer_auto_out_0_a_bits_data; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_0_a_bits_corrupt = fixer_auto_out_0_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_in_0_d_ready = fixer_auto_out_0_d_ready; // @[LazyModule.scala 296:16]
  assign system_bus_xbar_auto_out_1_a_ready = coupler_to_bus_named_subsystem_l2_auto_widget_in_a_ready; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_b_valid = coupler_to_bus_named_subsystem_l2_auto_widget_in_b_valid; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_b_bits_opcode = coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_opcode; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_b_bits_param = coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_param; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_b_bits_size = coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_size; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_b_bits_source = coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_source; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_b_bits_address = coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_address; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_b_bits_mask = coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_mask; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_b_bits_data = coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_data; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_b_bits_corrupt = coupler_to_bus_named_subsystem_l2_auto_widget_in_b_bits_corrupt; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_c_ready = coupler_to_bus_named_subsystem_l2_auto_widget_in_c_ready; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_d_valid = coupler_to_bus_named_subsystem_l2_auto_widget_in_d_valid; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_d_bits_opcode = coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_d_bits_param = coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_d_bits_size = coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_d_bits_source = coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_d_bits_sink = coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_d_bits_denied = coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_d_bits_data = coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_d_bits_corrupt = coupler_to_bus_named_subsystem_l2_auto_widget_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_1_e_ready = coupler_to_bus_named_subsystem_l2_auto_widget_in_e_ready; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_0_a_ready = coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_ready; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_0_d_valid = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_valid; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_0_d_bits_opcode = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_0_d_bits_param = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_0_d_bits_size = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_0_d_bits_source = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_0_d_bits_sink = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_0_d_bits_denied = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_0_d_bits_data = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign system_bus_xbar_auto_out_0_d_bits_corrupt = coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign fixer_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign fixer_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign fixer_auto_in_1_a_valid = coupler_from_boom_tile_auto_tl_out_a_valid; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_a_bits_opcode = coupler_from_boom_tile_auto_tl_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_a_bits_param = coupler_from_boom_tile_auto_tl_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_a_bits_size = coupler_from_boom_tile_auto_tl_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_a_bits_source = coupler_from_boom_tile_auto_tl_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_a_bits_address = coupler_from_boom_tile_auto_tl_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_a_bits_mask = coupler_from_boom_tile_auto_tl_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_a_bits_data = coupler_from_boom_tile_auto_tl_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_a_bits_corrupt = coupler_from_boom_tile_auto_tl_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_b_ready = coupler_from_boom_tile_auto_tl_out_b_ready; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_c_valid = coupler_from_boom_tile_auto_tl_out_c_valid; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_c_bits_opcode = coupler_from_boom_tile_auto_tl_out_c_bits_opcode; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_c_bits_param = coupler_from_boom_tile_auto_tl_out_c_bits_param; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_c_bits_size = coupler_from_boom_tile_auto_tl_out_c_bits_size; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_c_bits_source = coupler_from_boom_tile_auto_tl_out_c_bits_source; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_c_bits_address = coupler_from_boom_tile_auto_tl_out_c_bits_address; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_c_bits_data = coupler_from_boom_tile_auto_tl_out_c_bits_data; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_c_bits_corrupt = coupler_from_boom_tile_auto_tl_out_c_bits_corrupt; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_d_ready = coupler_from_boom_tile_auto_tl_out_d_ready; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_e_valid = coupler_from_boom_tile_auto_tl_out_e_valid; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_1_e_bits_sink = coupler_from_boom_tile_auto_tl_out_e_bits_sink; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_0_a_valid = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_valid; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_0_a_bits_opcode = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_0_a_bits_param = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_0_a_bits_size = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_0_a_bits_source = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_0_a_bits_address = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_0_a_bits_mask = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_0_a_bits_data = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_0_a_bits_corrupt = coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_0_d_ready = coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_ready; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_a_ready = system_bus_xbar_auto_in_1_a_ready; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_b_valid = system_bus_xbar_auto_in_1_b_valid; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_b_bits_opcode = system_bus_xbar_auto_in_1_b_bits_opcode; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_b_bits_param = system_bus_xbar_auto_in_1_b_bits_param; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_b_bits_size = system_bus_xbar_auto_in_1_b_bits_size; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_b_bits_source = system_bus_xbar_auto_in_1_b_bits_source; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_b_bits_address = system_bus_xbar_auto_in_1_b_bits_address; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_b_bits_mask = system_bus_xbar_auto_in_1_b_bits_mask; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_b_bits_data = system_bus_xbar_auto_in_1_b_bits_data; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_b_bits_corrupt = system_bus_xbar_auto_in_1_b_bits_corrupt; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_c_ready = system_bus_xbar_auto_in_1_c_ready; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_d_valid = system_bus_xbar_auto_in_1_d_valid; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_d_bits_opcode = system_bus_xbar_auto_in_1_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_d_bits_param = system_bus_xbar_auto_in_1_d_bits_param; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_d_bits_size = system_bus_xbar_auto_in_1_d_bits_size; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_d_bits_source = system_bus_xbar_auto_in_1_d_bits_source; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_d_bits_sink = system_bus_xbar_auto_in_1_d_bits_sink; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_d_bits_denied = system_bus_xbar_auto_in_1_d_bits_denied; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_d_bits_data = system_bus_xbar_auto_in_1_d_bits_data; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_d_bits_corrupt = system_bus_xbar_auto_in_1_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_1_e_ready = system_bus_xbar_auto_in_1_e_ready; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_0_a_ready = system_bus_xbar_auto_in_0_a_ready; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_0_d_valid = system_bus_xbar_auto_in_0_d_valid; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_0_d_bits_opcode = system_bus_xbar_auto_in_0_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_0_d_bits_param = system_bus_xbar_auto_in_0_d_bits_param; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_0_d_bits_size = system_bus_xbar_auto_in_0_d_bits_size; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_0_d_bits_source = system_bus_xbar_auto_in_0_d_bits_source; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_0_d_bits_sink = system_bus_xbar_auto_in_0_d_bits_sink; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_0_d_bits_denied = system_bus_xbar_auto_in_0_d_bits_denied; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_0_d_bits_data = system_bus_xbar_auto_in_0_d_bits_data; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_0_d_bits_corrupt = system_bus_xbar_auto_in_0_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign coupler_to_bus_named_subsystem_cbus_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bus_named_subsystem_cbus_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_valid = system_bus_xbar_auto_out_0_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_opcode = system_bus_xbar_auto_out_0_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_param = system_bus_xbar_auto_out_0_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_size = system_bus_xbar_auto_out_0_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_source = system_bus_xbar_auto_out_0_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_address = system_bus_xbar_auto_out_0_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_mask = system_bus_xbar_auto_out_0_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_data = system_bus_xbar_auto_out_0_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_a_bits_corrupt = system_bus_xbar_auto_out_0_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_cbus_auto_widget_in_d_ready = system_bus_xbar_auto_out_0_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_a_ready =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_valid =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_opcode =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_param =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_size =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_source =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_sink =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_denied =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_data =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_cbus_auto_bus_xing_out_d_bits_corrupt =
    auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign coupler_from_bus_named_subsystem_fbus_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_a_ready = fixer_auto_in_0_a_ready; // @[LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_valid = fixer_auto_in_0_d_valid; // @[LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_opcode = fixer_auto_in_0_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_param = fixer_auto_in_0_d_bits_param; // @[LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_size = fixer_auto_in_0_d_bits_size; // @[LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_source = fixer_auto_in_0_d_bits_source; // @[LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_sink = fixer_auto_in_0_d_bits_sink; // @[LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_denied = fixer_auto_in_0_d_bits_denied; // @[LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_data = fixer_auto_in_0_d_bits_data; // @[LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_widget_out_d_bits_corrupt = fixer_auto_in_0_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_valid =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid; // @[LazyModule.scala 309:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_opcode =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_param =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_size =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_source =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_address =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_mask =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_data =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_a_bits_corrupt =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign coupler_from_bus_named_subsystem_fbus_auto_bus_xing_in_d_ready =
    auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready; // @[LazyModule.scala 309:16]
  assign coupler_to_bus_named_subsystem_l2_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bus_named_subsystem_l2_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_a_valid = system_bus_xbar_auto_out_1_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_opcode = system_bus_xbar_auto_out_1_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_param = system_bus_xbar_auto_out_1_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_size = system_bus_xbar_auto_out_1_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_source = system_bus_xbar_auto_out_1_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_address = system_bus_xbar_auto_out_1_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_mask = system_bus_xbar_auto_out_1_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_data = system_bus_xbar_auto_out_1_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_a_bits_corrupt = system_bus_xbar_auto_out_1_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_b_ready = system_bus_xbar_auto_out_1_b_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_c_valid = system_bus_xbar_auto_out_1_c_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_opcode = system_bus_xbar_auto_out_1_c_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_param = system_bus_xbar_auto_out_1_c_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_size = system_bus_xbar_auto_out_1_c_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_source = system_bus_xbar_auto_out_1_c_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_address = system_bus_xbar_auto_out_1_c_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_data = system_bus_xbar_auto_out_1_c_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_c_bits_corrupt = system_bus_xbar_auto_out_1_c_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_d_ready = system_bus_xbar_auto_out_1_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_e_valid = system_bus_xbar_auto_out_1_e_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_in_e_bits_sink = system_bus_xbar_auto_out_1_e_bits_sink; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_a_ready =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_b_valid =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_opcode =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_param =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_size =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_source =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_address =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_mask =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_mask; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_data =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_b_bits_corrupt =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_corrupt; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_c_ready =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_d_valid =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_opcode =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_param =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_size =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_source =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_sink =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_denied =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_data =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_d_bits_corrupt =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_l2_auto_widget_out_e_ready =
    auto_coupler_to_bus_named_subsystem_l2_widget_out_e_ready; // @[LazyModule.scala 311:12]
  assign coupler_from_boom_tile_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_from_boom_tile_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_valid =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_valid; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_opcode =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_param =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_size =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_source =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_address =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_mask =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_data =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_a_bits_corrupt =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_b_ready =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_ready; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_valid =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_valid; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_opcode =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_opcode; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_param =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_param; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_size =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_size; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_source =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_source; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_address =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_address; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_data =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_data; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_c_bits_corrupt =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_corrupt; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_d_ready =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_ready; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_e_valid =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_valid; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_master_clock_xing_in_e_bits_sink =
    auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_bits_sink; // @[LazyModule.scala 309:16]
  assign coupler_from_boom_tile_auto_tl_out_a_ready = fixer_auto_in_1_a_ready; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_b_valid = fixer_auto_in_1_b_valid; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_b_bits_opcode = fixer_auto_in_1_b_bits_opcode; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_b_bits_param = fixer_auto_in_1_b_bits_param; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_b_bits_size = fixer_auto_in_1_b_bits_size; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_b_bits_source = fixer_auto_in_1_b_bits_source; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_b_bits_address = fixer_auto_in_1_b_bits_address; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_b_bits_mask = fixer_auto_in_1_b_bits_mask; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_b_bits_data = fixer_auto_in_1_b_bits_data; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_b_bits_corrupt = fixer_auto_in_1_b_bits_corrupt; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_c_ready = fixer_auto_in_1_c_ready; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_d_valid = fixer_auto_in_1_d_valid; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_d_bits_opcode = fixer_auto_in_1_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_d_bits_param = fixer_auto_in_1_d_bits_param; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_d_bits_size = fixer_auto_in_1_d_bits_size; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_d_bits_source = fixer_auto_in_1_d_bits_source; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_d_bits_sink = fixer_auto_in_1_d_bits_sink; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_d_bits_denied = fixer_auto_in_1_d_bits_denied; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_d_bits_data = fixer_auto_in_1_d_bits_data; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_d_bits_corrupt = fixer_auto_in_1_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign coupler_from_boom_tile_auto_tl_out_e_ready = fixer_auto_in_1_e_ready; // @[LazyModule.scala 296:16]
endmodule
