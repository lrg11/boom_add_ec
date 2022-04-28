module CoherenceManagerWrapper(
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready,
  output        auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param,
  output [2:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size,
  output [5:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source,
  output [31:0] auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address,
  output [7:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask,
  output [63:0] auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt,
  output        auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready,
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_param,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size,
  input  [5:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source,
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_sink,
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt,
  output        auto_coherent_jbar_in_a_ready,
  input         auto_coherent_jbar_in_a_valid,
  input  [2:0]  auto_coherent_jbar_in_a_bits_opcode,
  input  [2:0]  auto_coherent_jbar_in_a_bits_param,
  input  [2:0]  auto_coherent_jbar_in_a_bits_size,
  input  [3:0]  auto_coherent_jbar_in_a_bits_source,
  input  [31:0] auto_coherent_jbar_in_a_bits_address,
  input  [7:0]  auto_coherent_jbar_in_a_bits_mask,
  input  [63:0] auto_coherent_jbar_in_a_bits_data,
  input         auto_coherent_jbar_in_a_bits_corrupt,
  input         auto_coherent_jbar_in_b_ready,
  output        auto_coherent_jbar_in_b_valid,
  output [2:0]  auto_coherent_jbar_in_b_bits_opcode,
  output [1:0]  auto_coherent_jbar_in_b_bits_param,
  output [2:0]  auto_coherent_jbar_in_b_bits_size,
  output [3:0]  auto_coherent_jbar_in_b_bits_source,
  output [31:0] auto_coherent_jbar_in_b_bits_address,
  output [7:0]  auto_coherent_jbar_in_b_bits_mask,
  output [63:0] auto_coherent_jbar_in_b_bits_data,
  output        auto_coherent_jbar_in_b_bits_corrupt,
  output        auto_coherent_jbar_in_c_ready,
  input         auto_coherent_jbar_in_c_valid,
  input  [2:0]  auto_coherent_jbar_in_c_bits_opcode,
  input  [2:0]  auto_coherent_jbar_in_c_bits_param,
  input  [2:0]  auto_coherent_jbar_in_c_bits_size,
  input  [3:0]  auto_coherent_jbar_in_c_bits_source,
  input  [31:0] auto_coherent_jbar_in_c_bits_address,
  input  [63:0] auto_coherent_jbar_in_c_bits_data,
  input         auto_coherent_jbar_in_c_bits_corrupt,
  input         auto_coherent_jbar_in_d_ready,
  output        auto_coherent_jbar_in_d_valid,
  output [2:0]  auto_coherent_jbar_in_d_bits_opcode,
  output [1:0]  auto_coherent_jbar_in_d_bits_param,
  output [2:0]  auto_coherent_jbar_in_d_bits_size,
  output [3:0]  auto_coherent_jbar_in_d_bits_source,
  output [1:0]  auto_coherent_jbar_in_d_bits_sink,
  output        auto_coherent_jbar_in_d_bits_denied,
  output [63:0] auto_coherent_jbar_in_d_bits_data,
  output        auto_coherent_jbar_in_d_bits_corrupt,
  output        auto_coherent_jbar_in_e_ready,
  input         auto_coherent_jbar_in_e_valid,
  input  [1:0]  auto_coherent_jbar_in_e_bits_sink,
  input         auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock,
  input         auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset,
  output        clock,
  output        reset
);
  wire  subsystem_l2_clock_groups_auto_in_member_subsystem_l2_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_l2_clock_groups_auto_in_member_subsystem_l2_0_reset; // @[BusWrapper.scala 40:48]
  wire  subsystem_l2_clock_groups_auto_out_member_subsystem_l2_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_l2_clock_groups_auto_out_member_subsystem_l2_0_reset; // @[BusWrapper.scala 40:48]
  wire  clockGroup_auto_in_member_subsystem_l2_0_clock; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_in_member_subsystem_l2_0_reset; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_out_clock; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_out_reset; // @[BusWrapper.scala 41:38]
  wire  fixedClockNode_auto_in_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_in_reset; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_reset; // @[ClockGroup.scala 106:107]
  wire  broadcast_clock; // @[BundleBridge.scala 196:31]
  wire  broadcast_reset; // @[BundleBridge.scala 196:31]
  wire  broadcast_1_clock; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_reset; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_a_ready; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_a_valid; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_in_a_bits_opcode; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_in_a_bits_param; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_in_a_bits_size; // @[BankedL2Params.scala 81:24]
  wire [3:0] broadcast_1_auto_in_a_bits_source; // @[BankedL2Params.scala 81:24]
  wire [31:0] broadcast_1_auto_in_a_bits_address; // @[BankedL2Params.scala 81:24]
  wire [7:0] broadcast_1_auto_in_a_bits_mask; // @[BankedL2Params.scala 81:24]
  wire [63:0] broadcast_1_auto_in_a_bits_data; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_a_bits_corrupt; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_b_ready; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_b_valid; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_in_b_bits_opcode; // @[BankedL2Params.scala 81:24]
  wire [1:0] broadcast_1_auto_in_b_bits_param; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_in_b_bits_size; // @[BankedL2Params.scala 81:24]
  wire [3:0] broadcast_1_auto_in_b_bits_source; // @[BankedL2Params.scala 81:24]
  wire [31:0] broadcast_1_auto_in_b_bits_address; // @[BankedL2Params.scala 81:24]
  wire [7:0] broadcast_1_auto_in_b_bits_mask; // @[BankedL2Params.scala 81:24]
  wire [63:0] broadcast_1_auto_in_b_bits_data; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_b_bits_corrupt; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_c_ready; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_c_valid; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_in_c_bits_opcode; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_in_c_bits_param; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_in_c_bits_size; // @[BankedL2Params.scala 81:24]
  wire [3:0] broadcast_1_auto_in_c_bits_source; // @[BankedL2Params.scala 81:24]
  wire [31:0] broadcast_1_auto_in_c_bits_address; // @[BankedL2Params.scala 81:24]
  wire [63:0] broadcast_1_auto_in_c_bits_data; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_c_bits_corrupt; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_d_ready; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_d_valid; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_in_d_bits_opcode; // @[BankedL2Params.scala 81:24]
  wire [1:0] broadcast_1_auto_in_d_bits_param; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_in_d_bits_size; // @[BankedL2Params.scala 81:24]
  wire [3:0] broadcast_1_auto_in_d_bits_source; // @[BankedL2Params.scala 81:24]
  wire [1:0] broadcast_1_auto_in_d_bits_sink; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_d_bits_denied; // @[BankedL2Params.scala 81:24]
  wire [63:0] broadcast_1_auto_in_d_bits_data; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_d_bits_corrupt; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_e_ready; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_in_e_valid; // @[BankedL2Params.scala 81:24]
  wire [1:0] broadcast_1_auto_in_e_bits_sink; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_out_a_ready; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_out_a_valid; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_out_a_bits_opcode; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_out_a_bits_param; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_out_a_bits_size; // @[BankedL2Params.scala 81:24]
  wire [5:0] broadcast_1_auto_out_a_bits_source; // @[BankedL2Params.scala 81:24]
  wire [31:0] broadcast_1_auto_out_a_bits_address; // @[BankedL2Params.scala 81:24]
  wire [7:0] broadcast_1_auto_out_a_bits_mask; // @[BankedL2Params.scala 81:24]
  wire [63:0] broadcast_1_auto_out_a_bits_data; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_out_a_bits_corrupt; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_out_d_ready; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_out_d_valid; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_out_d_bits_opcode; // @[BankedL2Params.scala 81:24]
  wire [1:0] broadcast_1_auto_out_d_bits_param; // @[BankedL2Params.scala 81:24]
  wire [2:0] broadcast_1_auto_out_d_bits_size; // @[BankedL2Params.scala 81:24]
  wire [5:0] broadcast_1_auto_out_d_bits_source; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_out_d_bits_sink; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_out_d_bits_denied; // @[BankedL2Params.scala 81:24]
  wire [63:0] broadcast_1_auto_out_d_bits_data; // @[BankedL2Params.scala 81:24]
  wire  broadcast_1_auto_out_d_bits_corrupt; // @[BankedL2Params.scala 81:24]
  wire  coherent_jbar_clock; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_reset; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_a_ready; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_a_valid; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_in_a_bits_opcode; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_in_a_bits_param; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_in_a_bits_size; // @[BankedL2Params.scala 58:41]
  wire [3:0] coherent_jbar_auto_in_a_bits_source; // @[BankedL2Params.scala 58:41]
  wire [31:0] coherent_jbar_auto_in_a_bits_address; // @[BankedL2Params.scala 58:41]
  wire [7:0] coherent_jbar_auto_in_a_bits_mask; // @[BankedL2Params.scala 58:41]
  wire [63:0] coherent_jbar_auto_in_a_bits_data; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_a_bits_corrupt; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_b_ready; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_b_valid; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_in_b_bits_opcode; // @[BankedL2Params.scala 58:41]
  wire [1:0] coherent_jbar_auto_in_b_bits_param; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_in_b_bits_size; // @[BankedL2Params.scala 58:41]
  wire [3:0] coherent_jbar_auto_in_b_bits_source; // @[BankedL2Params.scala 58:41]
  wire [31:0] coherent_jbar_auto_in_b_bits_address; // @[BankedL2Params.scala 58:41]
  wire [7:0] coherent_jbar_auto_in_b_bits_mask; // @[BankedL2Params.scala 58:41]
  wire [63:0] coherent_jbar_auto_in_b_bits_data; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_b_bits_corrupt; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_c_ready; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_c_valid; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_in_c_bits_opcode; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_in_c_bits_param; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_in_c_bits_size; // @[BankedL2Params.scala 58:41]
  wire [3:0] coherent_jbar_auto_in_c_bits_source; // @[BankedL2Params.scala 58:41]
  wire [31:0] coherent_jbar_auto_in_c_bits_address; // @[BankedL2Params.scala 58:41]
  wire [63:0] coherent_jbar_auto_in_c_bits_data; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_c_bits_corrupt; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_d_ready; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_d_valid; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_in_d_bits_opcode; // @[BankedL2Params.scala 58:41]
  wire [1:0] coherent_jbar_auto_in_d_bits_param; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_in_d_bits_size; // @[BankedL2Params.scala 58:41]
  wire [3:0] coherent_jbar_auto_in_d_bits_source; // @[BankedL2Params.scala 58:41]
  wire [1:0] coherent_jbar_auto_in_d_bits_sink; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_d_bits_denied; // @[BankedL2Params.scala 58:41]
  wire [63:0] coherent_jbar_auto_in_d_bits_data; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_d_bits_corrupt; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_e_ready; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_in_e_valid; // @[BankedL2Params.scala 58:41]
  wire [1:0] coherent_jbar_auto_in_e_bits_sink; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_a_ready; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_a_valid; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_out_a_bits_opcode; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_out_a_bits_param; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_out_a_bits_size; // @[BankedL2Params.scala 58:41]
  wire [3:0] coherent_jbar_auto_out_a_bits_source; // @[BankedL2Params.scala 58:41]
  wire [31:0] coherent_jbar_auto_out_a_bits_address; // @[BankedL2Params.scala 58:41]
  wire [7:0] coherent_jbar_auto_out_a_bits_mask; // @[BankedL2Params.scala 58:41]
  wire [63:0] coherent_jbar_auto_out_a_bits_data; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_a_bits_corrupt; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_b_ready; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_b_valid; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_out_b_bits_opcode; // @[BankedL2Params.scala 58:41]
  wire [1:0] coherent_jbar_auto_out_b_bits_param; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_out_b_bits_size; // @[BankedL2Params.scala 58:41]
  wire [3:0] coherent_jbar_auto_out_b_bits_source; // @[BankedL2Params.scala 58:41]
  wire [31:0] coherent_jbar_auto_out_b_bits_address; // @[BankedL2Params.scala 58:41]
  wire [7:0] coherent_jbar_auto_out_b_bits_mask; // @[BankedL2Params.scala 58:41]
  wire [63:0] coherent_jbar_auto_out_b_bits_data; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_b_bits_corrupt; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_c_ready; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_c_valid; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_out_c_bits_opcode; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_out_c_bits_param; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_out_c_bits_size; // @[BankedL2Params.scala 58:41]
  wire [3:0] coherent_jbar_auto_out_c_bits_source; // @[BankedL2Params.scala 58:41]
  wire [31:0] coherent_jbar_auto_out_c_bits_address; // @[BankedL2Params.scala 58:41]
  wire [63:0] coherent_jbar_auto_out_c_bits_data; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_c_bits_corrupt; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_d_ready; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_d_valid; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_out_d_bits_opcode; // @[BankedL2Params.scala 58:41]
  wire [1:0] coherent_jbar_auto_out_d_bits_param; // @[BankedL2Params.scala 58:41]
  wire [2:0] coherent_jbar_auto_out_d_bits_size; // @[BankedL2Params.scala 58:41]
  wire [3:0] coherent_jbar_auto_out_d_bits_source; // @[BankedL2Params.scala 58:41]
  wire [1:0] coherent_jbar_auto_out_d_bits_sink; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_d_bits_denied; // @[BankedL2Params.scala 58:41]
  wire [63:0] coherent_jbar_auto_out_d_bits_data; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_d_bits_corrupt; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_e_ready; // @[BankedL2Params.scala 58:41]
  wire  coherent_jbar_auto_out_e_valid; // @[BankedL2Params.scala 58:41]
  wire [1:0] coherent_jbar_auto_out_e_bits_sink; // @[BankedL2Params.scala 58:41]
  wire  binder_clock; // @[BankBinder.scala 67:28]
  wire  binder_reset; // @[BankBinder.scala 67:28]
  wire  binder_auto_in_a_ready; // @[BankBinder.scala 67:28]
  wire  binder_auto_in_a_valid; // @[BankBinder.scala 67:28]
  wire [2:0] binder_auto_in_a_bits_opcode; // @[BankBinder.scala 67:28]
  wire [2:0] binder_auto_in_a_bits_param; // @[BankBinder.scala 67:28]
  wire [2:0] binder_auto_in_a_bits_size; // @[BankBinder.scala 67:28]
  wire [5:0] binder_auto_in_a_bits_source; // @[BankBinder.scala 67:28]
  wire [31:0] binder_auto_in_a_bits_address; // @[BankBinder.scala 67:28]
  wire [7:0] binder_auto_in_a_bits_mask; // @[BankBinder.scala 67:28]
  wire [63:0] binder_auto_in_a_bits_data; // @[BankBinder.scala 67:28]
  wire  binder_auto_in_a_bits_corrupt; // @[BankBinder.scala 67:28]
  wire  binder_auto_in_d_ready; // @[BankBinder.scala 67:28]
  wire  binder_auto_in_d_valid; // @[BankBinder.scala 67:28]
  wire [2:0] binder_auto_in_d_bits_opcode; // @[BankBinder.scala 67:28]
  wire [1:0] binder_auto_in_d_bits_param; // @[BankBinder.scala 67:28]
  wire [2:0] binder_auto_in_d_bits_size; // @[BankBinder.scala 67:28]
  wire [5:0] binder_auto_in_d_bits_source; // @[BankBinder.scala 67:28]
  wire  binder_auto_in_d_bits_sink; // @[BankBinder.scala 67:28]
  wire  binder_auto_in_d_bits_denied; // @[BankBinder.scala 67:28]
  wire [63:0] binder_auto_in_d_bits_data; // @[BankBinder.scala 67:28]
  wire  binder_auto_in_d_bits_corrupt; // @[BankBinder.scala 67:28]
  wire  binder_auto_out_a_ready; // @[BankBinder.scala 67:28]
  wire  binder_auto_out_a_valid; // @[BankBinder.scala 67:28]
  wire [2:0] binder_auto_out_a_bits_opcode; // @[BankBinder.scala 67:28]
  wire [2:0] binder_auto_out_a_bits_param; // @[BankBinder.scala 67:28]
  wire [2:0] binder_auto_out_a_bits_size; // @[BankBinder.scala 67:28]
  wire [5:0] binder_auto_out_a_bits_source; // @[BankBinder.scala 67:28]
  wire [31:0] binder_auto_out_a_bits_address; // @[BankBinder.scala 67:28]
  wire [7:0] binder_auto_out_a_bits_mask; // @[BankBinder.scala 67:28]
  wire [63:0] binder_auto_out_a_bits_data; // @[BankBinder.scala 67:28]
  wire  binder_auto_out_a_bits_corrupt; // @[BankBinder.scala 67:28]
  wire  binder_auto_out_d_ready; // @[BankBinder.scala 67:28]
  wire  binder_auto_out_d_valid; // @[BankBinder.scala 67:28]
  wire [2:0] binder_auto_out_d_bits_opcode; // @[BankBinder.scala 67:28]
  wire [1:0] binder_auto_out_d_bits_param; // @[BankBinder.scala 67:28]
  wire [2:0] binder_auto_out_d_bits_size; // @[BankBinder.scala 67:28]
  wire [5:0] binder_auto_out_d_bits_source; // @[BankBinder.scala 67:28]
  wire  binder_auto_out_d_bits_sink; // @[BankBinder.scala 67:28]
  wire  binder_auto_out_d_bits_denied; // @[BankBinder.scala 67:28]
  wire [63:0] binder_auto_out_d_bits_data; // @[BankBinder.scala 67:28]
  wire  binder_auto_out_d_bits_corrupt; // @[BankBinder.scala 67:28]
  wire  coupler_to_bus_named_subsystem_mbus_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [5:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [5:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [5:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [5:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  ClockGroupAggregator_5 subsystem_l2_clock_groups ( // @[BusWrapper.scala 40:48]
    .auto_in_member_subsystem_l2_0_clock(subsystem_l2_clock_groups_auto_in_member_subsystem_l2_0_clock),
    .auto_in_member_subsystem_l2_0_reset(subsystem_l2_clock_groups_auto_in_member_subsystem_l2_0_reset),
    .auto_out_member_subsystem_l2_0_clock(subsystem_l2_clock_groups_auto_out_member_subsystem_l2_0_clock),
    .auto_out_member_subsystem_l2_0_reset(subsystem_l2_clock_groups_auto_out_member_subsystem_l2_0_reset)
  );
  ClockGroup_5 clockGroup ( // @[BusWrapper.scala 41:38]
    .auto_in_member_subsystem_l2_0_clock(clockGroup_auto_in_member_subsystem_l2_0_clock),
    .auto_in_member_subsystem_l2_0_reset(clockGroup_auto_in_member_subsystem_l2_0_reset),
    .auto_out_clock(clockGroup_auto_out_clock),
    .auto_out_reset(clockGroup_auto_out_reset)
  );
  FixedClockBroadcast_5 fixedClockNode ( // @[ClockGroup.scala 106:107]
    .auto_in_clock(fixedClockNode_auto_in_clock),
    .auto_in_reset(fixedClockNode_auto_in_reset),
    .auto_out_clock(fixedClockNode_auto_out_clock),
    .auto_out_reset(fixedClockNode_auto_out_reset)
  );
  BundleBridgeNexus broadcast ( // @[BundleBridge.scala 196:31]
    .clock(broadcast_clock),
    .reset(broadcast_reset)
  );
  TLBroadcast broadcast_1 ( // @[BankedL2Params.scala 81:24]
    .clock(broadcast_1_clock),
    .reset(broadcast_1_reset),
    .auto_in_a_ready(broadcast_1_auto_in_a_ready),
    .auto_in_a_valid(broadcast_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(broadcast_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(broadcast_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(broadcast_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(broadcast_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(broadcast_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(broadcast_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(broadcast_1_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(broadcast_1_auto_in_a_bits_corrupt),
    .auto_in_b_ready(broadcast_1_auto_in_b_ready),
    .auto_in_b_valid(broadcast_1_auto_in_b_valid),
    .auto_in_b_bits_opcode(broadcast_1_auto_in_b_bits_opcode),
    .auto_in_b_bits_param(broadcast_1_auto_in_b_bits_param),
    .auto_in_b_bits_size(broadcast_1_auto_in_b_bits_size),
    .auto_in_b_bits_source(broadcast_1_auto_in_b_bits_source),
    .auto_in_b_bits_address(broadcast_1_auto_in_b_bits_address),
    .auto_in_b_bits_mask(broadcast_1_auto_in_b_bits_mask),
    .auto_in_b_bits_data(broadcast_1_auto_in_b_bits_data),
    .auto_in_b_bits_corrupt(broadcast_1_auto_in_b_bits_corrupt),
    .auto_in_c_ready(broadcast_1_auto_in_c_ready),
    .auto_in_c_valid(broadcast_1_auto_in_c_valid),
    .auto_in_c_bits_opcode(broadcast_1_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(broadcast_1_auto_in_c_bits_param),
    .auto_in_c_bits_size(broadcast_1_auto_in_c_bits_size),
    .auto_in_c_bits_source(broadcast_1_auto_in_c_bits_source),
    .auto_in_c_bits_address(broadcast_1_auto_in_c_bits_address),
    .auto_in_c_bits_data(broadcast_1_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(broadcast_1_auto_in_c_bits_corrupt),
    .auto_in_d_ready(broadcast_1_auto_in_d_ready),
    .auto_in_d_valid(broadcast_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(broadcast_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(broadcast_1_auto_in_d_bits_param),
    .auto_in_d_bits_size(broadcast_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(broadcast_1_auto_in_d_bits_source),
    .auto_in_d_bits_sink(broadcast_1_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(broadcast_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(broadcast_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(broadcast_1_auto_in_d_bits_corrupt),
    .auto_in_e_ready(broadcast_1_auto_in_e_ready),
    .auto_in_e_valid(broadcast_1_auto_in_e_valid),
    .auto_in_e_bits_sink(broadcast_1_auto_in_e_bits_sink),
    .auto_out_a_ready(broadcast_1_auto_out_a_ready),
    .auto_out_a_valid(broadcast_1_auto_out_a_valid),
    .auto_out_a_bits_opcode(broadcast_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(broadcast_1_auto_out_a_bits_param),
    .auto_out_a_bits_size(broadcast_1_auto_out_a_bits_size),
    .auto_out_a_bits_source(broadcast_1_auto_out_a_bits_source),
    .auto_out_a_bits_address(broadcast_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask(broadcast_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data(broadcast_1_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(broadcast_1_auto_out_a_bits_corrupt),
    .auto_out_d_ready(broadcast_1_auto_out_d_ready),
    .auto_out_d_valid(broadcast_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(broadcast_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(broadcast_1_auto_out_d_bits_param),
    .auto_out_d_bits_size(broadcast_1_auto_out_d_bits_size),
    .auto_out_d_bits_source(broadcast_1_auto_out_d_bits_source),
    .auto_out_d_bits_sink(broadcast_1_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(broadcast_1_auto_out_d_bits_denied),
    .auto_out_d_bits_data(broadcast_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(broadcast_1_auto_out_d_bits_corrupt)
  );
  TLJbar coherent_jbar ( // @[BankedL2Params.scala 58:41]
    .clock(coherent_jbar_clock),
    .reset(coherent_jbar_reset),
    .auto_in_a_ready(coherent_jbar_auto_in_a_ready),
    .auto_in_a_valid(coherent_jbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(coherent_jbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(coherent_jbar_auto_in_a_bits_param),
    .auto_in_a_bits_size(coherent_jbar_auto_in_a_bits_size),
    .auto_in_a_bits_source(coherent_jbar_auto_in_a_bits_source),
    .auto_in_a_bits_address(coherent_jbar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(coherent_jbar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(coherent_jbar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(coherent_jbar_auto_in_a_bits_corrupt),
    .auto_in_b_ready(coherent_jbar_auto_in_b_ready),
    .auto_in_b_valid(coherent_jbar_auto_in_b_valid),
    .auto_in_b_bits_opcode(coherent_jbar_auto_in_b_bits_opcode),
    .auto_in_b_bits_param(coherent_jbar_auto_in_b_bits_param),
    .auto_in_b_bits_size(coherent_jbar_auto_in_b_bits_size),
    .auto_in_b_bits_source(coherent_jbar_auto_in_b_bits_source),
    .auto_in_b_bits_address(coherent_jbar_auto_in_b_bits_address),
    .auto_in_b_bits_mask(coherent_jbar_auto_in_b_bits_mask),
    .auto_in_b_bits_data(coherent_jbar_auto_in_b_bits_data),
    .auto_in_b_bits_corrupt(coherent_jbar_auto_in_b_bits_corrupt),
    .auto_in_c_ready(coherent_jbar_auto_in_c_ready),
    .auto_in_c_valid(coherent_jbar_auto_in_c_valid),
    .auto_in_c_bits_opcode(coherent_jbar_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(coherent_jbar_auto_in_c_bits_param),
    .auto_in_c_bits_size(coherent_jbar_auto_in_c_bits_size),
    .auto_in_c_bits_source(coherent_jbar_auto_in_c_bits_source),
    .auto_in_c_bits_address(coherent_jbar_auto_in_c_bits_address),
    .auto_in_c_bits_data(coherent_jbar_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(coherent_jbar_auto_in_c_bits_corrupt),
    .auto_in_d_ready(coherent_jbar_auto_in_d_ready),
    .auto_in_d_valid(coherent_jbar_auto_in_d_valid),
    .auto_in_d_bits_opcode(coherent_jbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(coherent_jbar_auto_in_d_bits_param),
    .auto_in_d_bits_size(coherent_jbar_auto_in_d_bits_size),
    .auto_in_d_bits_source(coherent_jbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink(coherent_jbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(coherent_jbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(coherent_jbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(coherent_jbar_auto_in_d_bits_corrupt),
    .auto_in_e_ready(coherent_jbar_auto_in_e_ready),
    .auto_in_e_valid(coherent_jbar_auto_in_e_valid),
    .auto_in_e_bits_sink(coherent_jbar_auto_in_e_bits_sink),
    .auto_out_a_ready(coherent_jbar_auto_out_a_ready),
    .auto_out_a_valid(coherent_jbar_auto_out_a_valid),
    .auto_out_a_bits_opcode(coherent_jbar_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(coherent_jbar_auto_out_a_bits_param),
    .auto_out_a_bits_size(coherent_jbar_auto_out_a_bits_size),
    .auto_out_a_bits_source(coherent_jbar_auto_out_a_bits_source),
    .auto_out_a_bits_address(coherent_jbar_auto_out_a_bits_address),
    .auto_out_a_bits_mask(coherent_jbar_auto_out_a_bits_mask),
    .auto_out_a_bits_data(coherent_jbar_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(coherent_jbar_auto_out_a_bits_corrupt),
    .auto_out_b_ready(coherent_jbar_auto_out_b_ready),
    .auto_out_b_valid(coherent_jbar_auto_out_b_valid),
    .auto_out_b_bits_opcode(coherent_jbar_auto_out_b_bits_opcode),
    .auto_out_b_bits_param(coherent_jbar_auto_out_b_bits_param),
    .auto_out_b_bits_size(coherent_jbar_auto_out_b_bits_size),
    .auto_out_b_bits_source(coherent_jbar_auto_out_b_bits_source),
    .auto_out_b_bits_address(coherent_jbar_auto_out_b_bits_address),
    .auto_out_b_bits_mask(coherent_jbar_auto_out_b_bits_mask),
    .auto_out_b_bits_data(coherent_jbar_auto_out_b_bits_data),
    .auto_out_b_bits_corrupt(coherent_jbar_auto_out_b_bits_corrupt),
    .auto_out_c_ready(coherent_jbar_auto_out_c_ready),
    .auto_out_c_valid(coherent_jbar_auto_out_c_valid),
    .auto_out_c_bits_opcode(coherent_jbar_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(coherent_jbar_auto_out_c_bits_param),
    .auto_out_c_bits_size(coherent_jbar_auto_out_c_bits_size),
    .auto_out_c_bits_source(coherent_jbar_auto_out_c_bits_source),
    .auto_out_c_bits_address(coherent_jbar_auto_out_c_bits_address),
    .auto_out_c_bits_data(coherent_jbar_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt(coherent_jbar_auto_out_c_bits_corrupt),
    .auto_out_d_ready(coherent_jbar_auto_out_d_ready),
    .auto_out_d_valid(coherent_jbar_auto_out_d_valid),
    .auto_out_d_bits_opcode(coherent_jbar_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(coherent_jbar_auto_out_d_bits_param),
    .auto_out_d_bits_size(coherent_jbar_auto_out_d_bits_size),
    .auto_out_d_bits_source(coherent_jbar_auto_out_d_bits_source),
    .auto_out_d_bits_sink(coherent_jbar_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(coherent_jbar_auto_out_d_bits_denied),
    .auto_out_d_bits_data(coherent_jbar_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(coherent_jbar_auto_out_d_bits_corrupt),
    .auto_out_e_ready(coherent_jbar_auto_out_e_ready),
    .auto_out_e_valid(coherent_jbar_auto_out_e_valid),
    .auto_out_e_bits_sink(coherent_jbar_auto_out_e_bits_sink)
  );
  BankBinder binder ( // @[BankBinder.scala 67:28]
    .clock(binder_clock),
    .reset(binder_reset),
    .auto_in_a_ready(binder_auto_in_a_ready),
    .auto_in_a_valid(binder_auto_in_a_valid),
    .auto_in_a_bits_opcode(binder_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(binder_auto_in_a_bits_param),
    .auto_in_a_bits_size(binder_auto_in_a_bits_size),
    .auto_in_a_bits_source(binder_auto_in_a_bits_source),
    .auto_in_a_bits_address(binder_auto_in_a_bits_address),
    .auto_in_a_bits_mask(binder_auto_in_a_bits_mask),
    .auto_in_a_bits_data(binder_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(binder_auto_in_a_bits_corrupt),
    .auto_in_d_ready(binder_auto_in_d_ready),
    .auto_in_d_valid(binder_auto_in_d_valid),
    .auto_in_d_bits_opcode(binder_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(binder_auto_in_d_bits_param),
    .auto_in_d_bits_size(binder_auto_in_d_bits_size),
    .auto_in_d_bits_source(binder_auto_in_d_bits_source),
    .auto_in_d_bits_sink(binder_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(binder_auto_in_d_bits_denied),
    .auto_in_d_bits_data(binder_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(binder_auto_in_d_bits_corrupt),
    .auto_out_a_ready(binder_auto_out_a_ready),
    .auto_out_a_valid(binder_auto_out_a_valid),
    .auto_out_a_bits_opcode(binder_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(binder_auto_out_a_bits_param),
    .auto_out_a_bits_size(binder_auto_out_a_bits_size),
    .auto_out_a_bits_source(binder_auto_out_a_bits_source),
    .auto_out_a_bits_address(binder_auto_out_a_bits_address),
    .auto_out_a_bits_mask(binder_auto_out_a_bits_mask),
    .auto_out_a_bits_data(binder_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(binder_auto_out_a_bits_corrupt),
    .auto_out_d_ready(binder_auto_out_d_ready),
    .auto_out_d_valid(binder_auto_out_d_valid),
    .auto_out_d_bits_opcode(binder_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(binder_auto_out_d_bits_param),
    .auto_out_d_bits_size(binder_auto_out_d_bits_size),
    .auto_out_d_bits_source(binder_auto_out_d_bits_source),
    .auto_out_d_bits_sink(binder_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(binder_auto_out_d_bits_denied),
    .auto_out_d_bits_data(binder_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(binder_auto_out_d_bits_corrupt)
  );
  TLInterconnectCoupler_18 coupler_to_bus_named_subsystem_mbus ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_bus_named_subsystem_mbus_clock),
    .reset(coupler_to_bus_named_subsystem_mbus_reset),
    .auto_widget_in_a_ready(coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_ready),
    .auto_widget_in_a_valid(coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_valid),
    .auto_widget_in_a_bits_opcode(coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_opcode),
    .auto_widget_in_a_bits_param(coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_param),
    .auto_widget_in_a_bits_size(coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_size),
    .auto_widget_in_a_bits_source(coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_source),
    .auto_widget_in_a_bits_address(coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_address),
    .auto_widget_in_a_bits_mask(coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_mask),
    .auto_widget_in_a_bits_data(coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_data),
    .auto_widget_in_a_bits_corrupt(coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_corrupt),
    .auto_widget_in_d_ready(coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_ready),
    .auto_widget_in_d_valid(coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_valid),
    .auto_widget_in_d_bits_opcode(coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_opcode),
    .auto_widget_in_d_bits_param(coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_param),
    .auto_widget_in_d_bits_size(coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_size),
    .auto_widget_in_d_bits_source(coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_source),
    .auto_widget_in_d_bits_sink(coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_sink),
    .auto_widget_in_d_bits_denied(coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_denied),
    .auto_widget_in_d_bits_data(coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_data),
    .auto_widget_in_d_bits_corrupt(coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_corrupt),
    .auto_bus_xing_out_a_ready(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_ready),
    .auto_bus_xing_out_a_valid(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_valid),
    .auto_bus_xing_out_a_bits_opcode(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_opcode),
    .auto_bus_xing_out_a_bits_param(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_param),
    .auto_bus_xing_out_a_bits_size(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_size),
    .auto_bus_xing_out_a_bits_source(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_source),
    .auto_bus_xing_out_a_bits_address(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_address),
    .auto_bus_xing_out_a_bits_mask(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_mask),
    .auto_bus_xing_out_a_bits_data(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_data),
    .auto_bus_xing_out_a_bits_corrupt(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_corrupt),
    .auto_bus_xing_out_d_ready(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_ready),
    .auto_bus_xing_out_d_valid(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_valid),
    .auto_bus_xing_out_d_bits_opcode(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_opcode),
    .auto_bus_xing_out_d_bits_param(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_param),
    .auto_bus_xing_out_d_bits_size(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_size),
    .auto_bus_xing_out_d_bits_source(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_source),
    .auto_bus_xing_out_d_bits_sink(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_sink),
    .auto_bus_xing_out_d_bits_denied(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_denied),
    .auto_bus_xing_out_d_bits_data(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_data),
    .auto_bus_xing_out_d_bits_corrupt(coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_corrupt)
  );
  assign auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid =
    coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode =
    coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param =
    coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size =
    coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source =
    coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address =
    coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask =
    coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data =
    coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt =
    coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready =
    coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_coherent_jbar_in_a_ready = coherent_jbar_auto_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_b_valid = coherent_jbar_auto_in_b_valid; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_b_bits_opcode = coherent_jbar_auto_in_b_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_b_bits_param = coherent_jbar_auto_in_b_bits_param; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_b_bits_size = coherent_jbar_auto_in_b_bits_size; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_b_bits_source = coherent_jbar_auto_in_b_bits_source; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_b_bits_address = coherent_jbar_auto_in_b_bits_address; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_b_bits_mask = coherent_jbar_auto_in_b_bits_mask; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_b_bits_data = coherent_jbar_auto_in_b_bits_data; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_b_bits_corrupt = coherent_jbar_auto_in_b_bits_corrupt; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_c_ready = coherent_jbar_auto_in_c_ready; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_d_valid = coherent_jbar_auto_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_d_bits_opcode = coherent_jbar_auto_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_d_bits_param = coherent_jbar_auto_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_d_bits_size = coherent_jbar_auto_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_d_bits_source = coherent_jbar_auto_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_d_bits_sink = coherent_jbar_auto_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_d_bits_denied = coherent_jbar_auto_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_d_bits_data = coherent_jbar_auto_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_d_bits_corrupt = coherent_jbar_auto_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign auto_coherent_jbar_in_e_ready = coherent_jbar_auto_in_e_ready; // @[LazyModule.scala 309:16]
  assign clock = fixedClockNode_auto_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign reset = fixedClockNode_auto_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_l2_clock_groups_auto_in_member_subsystem_l2_0_clock =
    auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_l2_clock_groups_auto_in_member_subsystem_l2_0_reset =
    auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset; // @[LazyModule.scala 309:16]
  assign clockGroup_auto_in_member_subsystem_l2_0_clock = subsystem_l2_clock_groups_auto_out_member_subsystem_l2_0_clock
    ; // @[LazyModule.scala 298:16]
  assign clockGroup_auto_in_member_subsystem_l2_0_reset = subsystem_l2_clock_groups_auto_out_member_subsystem_l2_0_reset
    ; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_clock = clockGroup_auto_out_clock; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_reset = clockGroup_auto_out_reset; // @[LazyModule.scala 298:16]
  assign broadcast_clock = fixedClockNode_auto_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign broadcast_reset = fixedClockNode_auto_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign broadcast_1_clock = fixedClockNode_auto_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign broadcast_1_reset = fixedClockNode_auto_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign broadcast_1_auto_in_a_valid = coherent_jbar_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_a_bits_opcode = coherent_jbar_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_a_bits_param = coherent_jbar_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_a_bits_size = coherent_jbar_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_a_bits_source = coherent_jbar_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_a_bits_address = coherent_jbar_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_a_bits_mask = coherent_jbar_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_a_bits_data = coherent_jbar_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_a_bits_corrupt = coherent_jbar_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_b_ready = coherent_jbar_auto_out_b_ready; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_c_valid = coherent_jbar_auto_out_c_valid; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_c_bits_opcode = coherent_jbar_auto_out_c_bits_opcode; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_c_bits_param = coherent_jbar_auto_out_c_bits_param; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_c_bits_size = coherent_jbar_auto_out_c_bits_size; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_c_bits_source = coherent_jbar_auto_out_c_bits_source; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_c_bits_address = coherent_jbar_auto_out_c_bits_address; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_c_bits_data = coherent_jbar_auto_out_c_bits_data; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_c_bits_corrupt = coherent_jbar_auto_out_c_bits_corrupt; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_d_ready = coherent_jbar_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_e_valid = coherent_jbar_auto_out_e_valid; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_in_e_bits_sink = coherent_jbar_auto_out_e_bits_sink; // @[LazyModule.scala 296:16]
  assign broadcast_1_auto_out_a_ready = binder_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign broadcast_1_auto_out_d_valid = binder_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign broadcast_1_auto_out_d_bits_opcode = binder_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign broadcast_1_auto_out_d_bits_param = binder_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign broadcast_1_auto_out_d_bits_size = binder_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign broadcast_1_auto_out_d_bits_source = binder_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign broadcast_1_auto_out_d_bits_sink = binder_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign broadcast_1_auto_out_d_bits_denied = binder_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign broadcast_1_auto_out_d_bits_data = binder_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign broadcast_1_auto_out_d_bits_corrupt = binder_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coherent_jbar_clock = fixedClockNode_auto_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coherent_jbar_reset = fixedClockNode_auto_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coherent_jbar_auto_in_a_valid = auto_coherent_jbar_in_a_valid; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_a_bits_opcode = auto_coherent_jbar_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_a_bits_param = auto_coherent_jbar_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_a_bits_size = auto_coherent_jbar_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_a_bits_source = auto_coherent_jbar_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_a_bits_address = auto_coherent_jbar_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_a_bits_mask = auto_coherent_jbar_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_a_bits_data = auto_coherent_jbar_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_a_bits_corrupt = auto_coherent_jbar_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_b_ready = auto_coherent_jbar_in_b_ready; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_c_valid = auto_coherent_jbar_in_c_valid; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_c_bits_opcode = auto_coherent_jbar_in_c_bits_opcode; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_c_bits_param = auto_coherent_jbar_in_c_bits_param; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_c_bits_size = auto_coherent_jbar_in_c_bits_size; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_c_bits_source = auto_coherent_jbar_in_c_bits_source; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_c_bits_address = auto_coherent_jbar_in_c_bits_address; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_c_bits_data = auto_coherent_jbar_in_c_bits_data; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_c_bits_corrupt = auto_coherent_jbar_in_c_bits_corrupt; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_d_ready = auto_coherent_jbar_in_d_ready; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_e_valid = auto_coherent_jbar_in_e_valid; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_in_e_bits_sink = auto_coherent_jbar_in_e_bits_sink; // @[LazyModule.scala 309:16]
  assign coherent_jbar_auto_out_a_ready = broadcast_1_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_b_valid = broadcast_1_auto_in_b_valid; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_b_bits_opcode = broadcast_1_auto_in_b_bits_opcode; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_b_bits_param = broadcast_1_auto_in_b_bits_param; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_b_bits_size = broadcast_1_auto_in_b_bits_size; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_b_bits_source = broadcast_1_auto_in_b_bits_source; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_b_bits_address = broadcast_1_auto_in_b_bits_address; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_b_bits_mask = broadcast_1_auto_in_b_bits_mask; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_b_bits_data = broadcast_1_auto_in_b_bits_data; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_b_bits_corrupt = broadcast_1_auto_in_b_bits_corrupt; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_c_ready = broadcast_1_auto_in_c_ready; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_d_valid = broadcast_1_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_d_bits_opcode = broadcast_1_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_d_bits_param = broadcast_1_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_d_bits_size = broadcast_1_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_d_bits_source = broadcast_1_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_d_bits_sink = broadcast_1_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_d_bits_denied = broadcast_1_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_d_bits_data = broadcast_1_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_d_bits_corrupt = broadcast_1_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign coherent_jbar_auto_out_e_ready = broadcast_1_auto_in_e_ready; // @[LazyModule.scala 296:16]
  assign binder_clock = fixedClockNode_auto_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign binder_reset = fixedClockNode_auto_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign binder_auto_in_a_valid = broadcast_1_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign binder_auto_in_a_bits_opcode = broadcast_1_auto_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign binder_auto_in_a_bits_param = broadcast_1_auto_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign binder_auto_in_a_bits_size = broadcast_1_auto_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign binder_auto_in_a_bits_source = broadcast_1_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign binder_auto_in_a_bits_address = broadcast_1_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign binder_auto_in_a_bits_mask = broadcast_1_auto_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign binder_auto_in_a_bits_data = broadcast_1_auto_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign binder_auto_in_a_bits_corrupt = broadcast_1_auto_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign binder_auto_in_d_ready = broadcast_1_auto_out_d_ready; // @[LazyModule.scala 298:16]
  assign binder_auto_out_a_ready = coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_ready; // @[LazyModule.scala 298:16]
  assign binder_auto_out_d_valid = coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_valid; // @[LazyModule.scala 298:16]
  assign binder_auto_out_d_bits_opcode = coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign binder_auto_out_d_bits_param = coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign binder_auto_out_d_bits_size = coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign binder_auto_out_d_bits_source = coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign binder_auto_out_d_bits_sink = coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign binder_auto_out_d_bits_denied = coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign binder_auto_out_d_bits_data = coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign binder_auto_out_d_bits_corrupt = coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_mbus_clock = fixedClockNode_auto_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bus_named_subsystem_mbus_reset = fixedClockNode_auto_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_valid = binder_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_opcode = binder_auto_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_param = binder_auto_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_size = binder_auto_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_source = binder_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_address = binder_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_mask = binder_auto_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_data = binder_auto_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_mbus_auto_widget_in_a_bits_corrupt = binder_auto_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_mbus_auto_widget_in_d_ready = binder_auto_out_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_a_ready =
    auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_valid =
    auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_opcode =
    auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_param =
    auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_size =
    auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_source =
    auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_sink =
    auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_denied =
    auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_data =
    auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_mbus_auto_bus_xing_out_d_bits_corrupt =
    auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
endmodule
