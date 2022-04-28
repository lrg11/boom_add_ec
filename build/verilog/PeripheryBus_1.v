module PeripheryBus_1(
  input         auto_coupler_to_bootrom_fragmenter_out_a_ready,
  output        auto_coupler_to_bootrom_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_size,
  output [8:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_source,
  output [16:0] auto_coupler_to_bootrom_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_bootrom_fragmenter_out_a_bits_data,
  output        auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_bootrom_fragmenter_out_d_ready,
  input         auto_coupler_to_bootrom_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_bootrom_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bootrom_fragmenter_out_d_bits_param,
  input  [1:0]  auto_coupler_to_bootrom_fragmenter_out_d_bits_size,
  input  [8:0]  auto_coupler_to_bootrom_fragmenter_out_d_bits_source,
  input         auto_coupler_to_bootrom_fragmenter_out_d_bits_sink,
  input         auto_coupler_to_bootrom_fragmenter_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bootrom_fragmenter_out_d_bits_data,
  input         auto_coupler_to_bootrom_fragmenter_out_d_bits_corrupt,
  input         auto_coupler_to_debug_fragmenter_out_a_ready,
  output        auto_coupler_to_debug_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_debug_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_debug_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_debug_fragmenter_out_a_bits_size,
  output [8:0]  auto_coupler_to_debug_fragmenter_out_a_bits_source,
  output [11:0] auto_coupler_to_debug_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_debug_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_debug_fragmenter_out_a_bits_data,
  output        auto_coupler_to_debug_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_debug_fragmenter_out_d_ready,
  input         auto_coupler_to_debug_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_debug_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_debug_fragmenter_out_d_bits_param,
  input  [1:0]  auto_coupler_to_debug_fragmenter_out_d_bits_size,
  input  [8:0]  auto_coupler_to_debug_fragmenter_out_d_bits_source,
  input         auto_coupler_to_debug_fragmenter_out_d_bits_sink,
  input         auto_coupler_to_debug_fragmenter_out_d_bits_denied,
  input  [63:0] auto_coupler_to_debug_fragmenter_out_d_bits_data,
  input         auto_coupler_to_debug_fragmenter_out_d_bits_corrupt,
  input         auto_coupler_to_clint_fragmenter_out_a_ready,
  output        auto_coupler_to_clint_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_clint_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_clint_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_clint_fragmenter_out_a_bits_size,
  output [8:0]  auto_coupler_to_clint_fragmenter_out_a_bits_source,
  output [25:0] auto_coupler_to_clint_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_clint_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_clint_fragmenter_out_a_bits_data,
  output        auto_coupler_to_clint_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_clint_fragmenter_out_d_ready,
  input         auto_coupler_to_clint_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_clint_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_clint_fragmenter_out_d_bits_param,
  input  [1:0]  auto_coupler_to_clint_fragmenter_out_d_bits_size,
  input  [8:0]  auto_coupler_to_clint_fragmenter_out_d_bits_source,
  input         auto_coupler_to_clint_fragmenter_out_d_bits_sink,
  input         auto_coupler_to_clint_fragmenter_out_d_bits_denied,
  input  [63:0] auto_coupler_to_clint_fragmenter_out_d_bits_data,
  input         auto_coupler_to_clint_fragmenter_out_d_bits_corrupt,
  input         auto_coupler_to_plic_fragmenter_out_a_ready,
  output        auto_coupler_to_plic_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_plic_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_plic_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_plic_fragmenter_out_a_bits_size,
  output [8:0]  auto_coupler_to_plic_fragmenter_out_a_bits_source,
  output [27:0] auto_coupler_to_plic_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_plic_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_plic_fragmenter_out_a_bits_data,
  output        auto_coupler_to_plic_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_plic_fragmenter_out_d_ready,
  input         auto_coupler_to_plic_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_plic_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_plic_fragmenter_out_d_bits_param,
  input  [1:0]  auto_coupler_to_plic_fragmenter_out_d_bits_size,
  input  [8:0]  auto_coupler_to_plic_fragmenter_out_d_bits_source,
  input         auto_coupler_to_plic_fragmenter_out_d_bits_sink,
  input         auto_coupler_to_plic_fragmenter_out_d_bits_denied,
  input  [63:0] auto_coupler_to_plic_fragmenter_out_d_bits_data,
  input         auto_coupler_to_plic_fragmenter_out_d_bits_corrupt,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_ready,
  output        auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param,
  output [2:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size,
  output [4:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source,
  output [30:0] auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address,
  output [7:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask,
  output [63:0] auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt,
  output        auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size,
  input  [4:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt,
  output        auto_fixedClockNode_out_3_clock,
  output        auto_fixedClockNode_out_3_reset,
  output        auto_fixedClockNode_out_2_clock,
  output        auto_fixedClockNode_out_2_reset,
  output        auto_fixedClockNode_out_1_clock,
  output        auto_fixedClockNode_out_1_reset,
  output        auto_fixedClockNode_out_0_clock,
  output        auto_fixedClockNode_out_0_reset,
  input         auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock,
  input         auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset,
  output        auto_bus_xing_in_a_ready,
  input         auto_bus_xing_in_a_valid,
  input  [2:0]  auto_bus_xing_in_a_bits_opcode,
  input  [2:0]  auto_bus_xing_in_a_bits_param,
  input  [3:0]  auto_bus_xing_in_a_bits_size,
  input  [3:0]  auto_bus_xing_in_a_bits_source,
  input  [30:0] auto_bus_xing_in_a_bits_address,
  input  [7:0]  auto_bus_xing_in_a_bits_mask,
  input  [63:0] auto_bus_xing_in_a_bits_data,
  input         auto_bus_xing_in_a_bits_corrupt,
  input         auto_bus_xing_in_d_ready,
  output        auto_bus_xing_in_d_valid,
  output [2:0]  auto_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_bus_xing_in_d_bits_param,
  output [3:0]  auto_bus_xing_in_d_bits_size,
  output [3:0]  auto_bus_xing_in_d_bits_source,
  output        auto_bus_xing_in_d_bits_sink,
  output        auto_bus_xing_in_d_bits_denied,
  output [63:0] auto_bus_xing_in_d_bits_data,
  output        auto_bus_xing_in_d_bits_corrupt,
  input         custom_boot,
  output        clock,
  output        reset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_reset; // @[BusWrapper.scala 40:48]
  wire  subsystem_cbus_clock_groups_auto_out_member_subsystem_cbus_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_cbus_clock_groups_auto_out_member_subsystem_cbus_0_reset; // @[BusWrapper.scala 40:48]
  wire  clockGroup_auto_in_member_subsystem_cbus_0_clock; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_in_member_subsystem_cbus_0_reset; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_out_clock; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_out_reset; // @[BusWrapper.scala 41:38]
  wire  fixedClockNode_auto_in_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_in_reset; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_4_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_4_reset; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_3_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_3_reset; // @[ClockGroup.scala 106:107]
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
  wire [3:0] fixer_auto_in_a_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_in_a_bits_source; // @[PeripheryBus.scala 47:33]
  wire [30:0] fixer_auto_in_a_bits_address; // @[PeripheryBus.scala 47:33]
  wire [7:0] fixer_auto_in_a_bits_mask; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_in_a_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_a_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_ready; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_valid; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_in_d_bits_opcode; // @[PeripheryBus.scala 47:33]
  wire [1:0] fixer_auto_in_d_bits_param; // @[PeripheryBus.scala 47:33]
  wire [3:0] fixer_auto_in_d_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_in_d_bits_source; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_bits_sink; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_bits_denied; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_in_d_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_a_ready; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_a_valid; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_out_a_bits_opcode; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_out_a_bits_param; // @[PeripheryBus.scala 47:33]
  wire [3:0] fixer_auto_out_a_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_out_a_bits_source; // @[PeripheryBus.scala 47:33]
  wire [30:0] fixer_auto_out_a_bits_address; // @[PeripheryBus.scala 47:33]
  wire [7:0] fixer_auto_out_a_bits_mask; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_out_a_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_a_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_ready; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_valid; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_out_d_bits_opcode; // @[PeripheryBus.scala 47:33]
  wire [1:0] fixer_auto_out_d_bits_param; // @[PeripheryBus.scala 47:33]
  wire [3:0] fixer_auto_out_d_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_out_d_bits_source; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_bits_sink; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_bits_denied; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_out_d_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  in_xbar_clock; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_reset; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_1_a_ready; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_1_a_valid; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_in_1_a_bits_opcode; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_in_1_a_bits_param; // @[PeripheryBus.scala 49:29]
  wire [3:0] in_xbar_auto_in_1_a_bits_size; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_1_a_bits_source; // @[PeripheryBus.scala 49:29]
  wire [30:0] in_xbar_auto_in_1_a_bits_address; // @[PeripheryBus.scala 49:29]
  wire [7:0] in_xbar_auto_in_1_a_bits_mask; // @[PeripheryBus.scala 49:29]
  wire [63:0] in_xbar_auto_in_1_a_bits_data; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_1_a_bits_corrupt; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_1_d_ready; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_1_d_valid; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_in_1_d_bits_opcode; // @[PeripheryBus.scala 49:29]
  wire [1:0] in_xbar_auto_in_1_d_bits_param; // @[PeripheryBus.scala 49:29]
  wire [3:0] in_xbar_auto_in_1_d_bits_size; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_1_d_bits_source; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_1_d_bits_sink; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_1_d_bits_denied; // @[PeripheryBus.scala 49:29]
  wire [63:0] in_xbar_auto_in_1_d_bits_data; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_1_d_bits_corrupt; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_0_a_ready; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_0_a_valid; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_in_0_a_bits_opcode; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_in_0_a_bits_param; // @[PeripheryBus.scala 49:29]
  wire [3:0] in_xbar_auto_in_0_a_bits_size; // @[PeripheryBus.scala 49:29]
  wire [3:0] in_xbar_auto_in_0_a_bits_source; // @[PeripheryBus.scala 49:29]
  wire [30:0] in_xbar_auto_in_0_a_bits_address; // @[PeripheryBus.scala 49:29]
  wire [7:0] in_xbar_auto_in_0_a_bits_mask; // @[PeripheryBus.scala 49:29]
  wire [63:0] in_xbar_auto_in_0_a_bits_data; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_0_a_bits_corrupt; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_0_d_ready; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_0_d_valid; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_in_0_d_bits_opcode; // @[PeripheryBus.scala 49:29]
  wire [1:0] in_xbar_auto_in_0_d_bits_param; // @[PeripheryBus.scala 49:29]
  wire [3:0] in_xbar_auto_in_0_d_bits_size; // @[PeripheryBus.scala 49:29]
  wire [3:0] in_xbar_auto_in_0_d_bits_source; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_0_d_bits_sink; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_0_d_bits_denied; // @[PeripheryBus.scala 49:29]
  wire [63:0] in_xbar_auto_in_0_d_bits_data; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_in_0_d_bits_corrupt; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_a_ready; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_a_valid; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_out_a_bits_opcode; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_out_a_bits_param; // @[PeripheryBus.scala 49:29]
  wire [3:0] in_xbar_auto_out_a_bits_size; // @[PeripheryBus.scala 49:29]
  wire [4:0] in_xbar_auto_out_a_bits_source; // @[PeripheryBus.scala 49:29]
  wire [30:0] in_xbar_auto_out_a_bits_address; // @[PeripheryBus.scala 49:29]
  wire [7:0] in_xbar_auto_out_a_bits_mask; // @[PeripheryBus.scala 49:29]
  wire [63:0] in_xbar_auto_out_a_bits_data; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_a_bits_corrupt; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_d_ready; // @[PeripheryBus.scala 49:29]
  wire  in_xbar_auto_out_d_valid; // @[PeripheryBus.scala 49:29]
  wire [2:0] in_xbar_auto_out_d_bits_opcode; // @[PeripheryBus.scala 49:29]
  wire [1:0] in_xbar_auto_out_d_bits_param; // @[PeripheryBus.scala 49:29]
  wire [3:0] in_xbar_auto_out_d_bits_size; // @[PeripheryBus.scala 49:29]
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
  wire [3:0] out_xbar_auto_in_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_in_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [30:0] out_xbar_auto_in_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_in_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_in_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_in_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [1:0] out_xbar_auto_in_d_bits_param; // @[PeripheryBus.scala 50:30]
  wire [3:0] out_xbar_auto_in_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_in_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_bits_sink; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_bits_denied; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_in_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_5_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_5_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_5_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_5_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_5_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_5_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [16:0] out_xbar_auto_out_5_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_5_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_5_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_5_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_5_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_5_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_5_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [1:0] out_xbar_auto_out_5_d_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_5_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_5_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_5_d_bits_sink; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_5_d_bits_denied; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_5_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_5_d_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_4_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_4_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_4_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_4_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [11:0] out_xbar_auto_out_4_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_4_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_4_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_4_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [1:0] out_xbar_auto_out_4_d_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_4_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_4_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_d_bits_sink; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_d_bits_denied; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_4_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_d_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_3_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_3_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_3_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_3_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [25:0] out_xbar_auto_out_3_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_3_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_3_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_3_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [1:0] out_xbar_auto_out_3_d_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_3_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_3_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_d_bits_sink; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_d_bits_denied; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_3_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_d_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_2_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [27:0] out_xbar_auto_out_2_a_bits_address; // @[PeripheryBus.scala 50:30]
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
  wire [3:0] out_xbar_auto_out_0_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_0_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [13:0] out_xbar_auto_out_0_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_0_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_0_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_0_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [1:0] out_xbar_auto_out_0_d_bits_param; // @[PeripheryBus.scala 50:30]
  wire [3:0] out_xbar_auto_out_0_d_bits_size; // @[PeripheryBus.scala 50:30]
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
  wire [3:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [30:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [30:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
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
  wire [3:0] atomics_auto_in_a_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_in_a_bits_source; // @[AtomicAutomata.scala 283:29]
  wire [30:0] atomics_auto_in_a_bits_address; // @[AtomicAutomata.scala 283:29]
  wire [7:0] atomics_auto_in_a_bits_mask; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_in_a_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_a_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_ready; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_valid; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_in_d_bits_opcode; // @[AtomicAutomata.scala 283:29]
  wire [1:0] atomics_auto_in_d_bits_param; // @[AtomicAutomata.scala 283:29]
  wire [3:0] atomics_auto_in_d_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_in_d_bits_source; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_bits_sink; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_bits_denied; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_in_d_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_a_ready; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_a_valid; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_out_a_bits_opcode; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_out_a_bits_param; // @[AtomicAutomata.scala 283:29]
  wire [3:0] atomics_auto_out_a_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_out_a_bits_source; // @[AtomicAutomata.scala 283:29]
  wire [30:0] atomics_auto_out_a_bits_address; // @[AtomicAutomata.scala 283:29]
  wire [7:0] atomics_auto_out_a_bits_mask; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_out_a_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_a_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_ready; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_valid; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_out_d_bits_opcode; // @[AtomicAutomata.scala 283:29]
  wire [1:0] atomics_auto_out_d_bits_param; // @[AtomicAutomata.scala 283:29]
  wire [3:0] atomics_auto_out_d_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_out_d_bits_source; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_bits_sink; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_bits_denied; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_out_d_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  wrapped_error_device_clock; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_reset; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_a_ready; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] wrapped_error_device_auto_buffer_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] wrapped_error_device_auto_buffer_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] wrapped_error_device_auto_buffer_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] wrapped_error_device_auto_buffer_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [13:0] wrapped_error_device_auto_buffer_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] wrapped_error_device_auto_buffer_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] wrapped_error_device_auto_buffer_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_d_ready; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] wrapped_error_device_auto_buffer_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] wrapped_error_device_auto_buffer_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] wrapped_error_device_auto_buffer_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] wrapped_error_device_auto_buffer_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] wrapped_error_device_auto_buffer_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  buffer_1_clock; // @[Buffer.scala 68:28]
  wire  buffer_1_reset; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [30:0] buffer_1_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [30:0] buffer_1_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  coupler_to_bus_named_subsystem_pbus_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [30:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [30:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_plic_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_plic_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [27:0] coupler_to_plic_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_plic_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_plic_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_plic_auto_fragmenter_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_plic_auto_fragmenter_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_plic_auto_fragmenter_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_plic_auto_fragmenter_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_plic_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [27:0] coupler_to_plic_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_plic_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_plic_auto_tl_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_plic_auto_tl_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_plic_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_plic_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_clint_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_clint_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [25:0] coupler_to_clint_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_clint_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_clint_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_clint_auto_fragmenter_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_clint_auto_fragmenter_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_clint_auto_fragmenter_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_clint_auto_fragmenter_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_clint_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [25:0] coupler_to_clint_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_clint_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_clint_auto_tl_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_clint_auto_tl_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_clint_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_clint_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_debug_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_debug_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [11:0] coupler_to_debug_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_debug_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_debug_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_debug_auto_fragmenter_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_debug_auto_fragmenter_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_debug_auto_fragmenter_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_debug_auto_fragmenter_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_debug_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [11:0] coupler_to_debug_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_debug_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_debug_auto_tl_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_debug_auto_tl_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_debug_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_debug_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_boom_tile_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_boom_tile_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [16:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bootrom_auto_fragmenter_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bootrom_auto_fragmenter_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_bootrom_auto_fragmenter_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bootrom_auto_fragmenter_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_bootrom_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [16:0] coupler_to_bootrom_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bootrom_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bootrom_auto_tl_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bootrom_auto_tl_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_bootrom_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bootrom_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_clock; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_reset; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [30:0] coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [30:0] coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  bundleIn_0_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  reg [2:0] REG; // @[CustomBootPin.scala 46:28]
  wire  _T = 3'h0 == REG; // @[Conditional.scala 37:30]
  wire  _T_1 = 3'h1 == REG; // @[Conditional.scala 37:30]
  wire  bundleOut_0_1_a_ready = coupler_from_port_named_custom_boot_pin_auto_tl_in_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  wire  _T_3 = 3'h2 == REG; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h3 == REG; // @[Conditional.scala 37:30]
  wire  _GEN_19 = _T_3 ? 1'h0 : _T_5; // @[Conditional.scala 39:67 CustomBootPin.scala 47:20]
  wire  _GEN_28 = _T_1 | _GEN_19; // @[Conditional.scala 39:67 CustomBootPin.scala 53:24]
  wire  bundleOut_0_1_a_valid = _T ? 1'h0 : _GEN_28; // @[Conditional.scala 40:58 CustomBootPin.scala 47:20]
  wire  _T_2 = bundleOut_0_1_a_ready & bundleOut_0_1_a_valid; // @[Decoupled.scala 40:37]
  wire  bundleOut_0_1_d_valid = coupler_from_port_named_custom_boot_pin_auto_tl_in_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  wire [2:0] _GEN_2 = bundleOut_0_1_d_valid ? 3'h3 : REG; // @[CustomBootPin.scala 62:60 CustomBootPin.scala 62:68 CustomBootPin.scala 46:28]
  wire [2:0] _GEN_3 = _T_2 ? 3'h4 : REG; // @[CustomBootPin.scala 71:32 CustomBootPin.scala 71:40 CustomBootPin.scala 46:28]
  wire  _T_7 = 3'h4 == REG; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_4 = bundleOut_0_1_d_valid ? 3'h5 : REG; // @[CustomBootPin.scala 73:52 CustomBootPin.scala 73:60 CustomBootPin.scala 46:28]
  wire  _T_9 = 3'h5 == REG; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_5 = ~custom_boot ? 3'h0 : REG; // @[CustomBootPin.scala 74:43 CustomBootPin.scala 74:51 CustomBootPin.scala 46:28]
  wire [2:0] _GEN_6 = _T_9 ? _GEN_5 : REG; // @[Conditional.scala 39:67 CustomBootPin.scala 46:28]
  wire [2:0] _GEN_7 = _T_7 ? _GEN_4 : _GEN_6; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_17 = _T_5 ? _GEN_3 : _GEN_7; // @[Conditional.scala 39:67]
  wire  bundleIn_0_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  ClockGroupAggregator_3 subsystem_cbus_clock_groups ( // @[BusWrapper.scala 40:48]
    .auto_in_member_subsystem_cbus_0_clock(subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_clock),
    .auto_in_member_subsystem_cbus_0_reset(subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_reset),
    .auto_out_member_subsystem_cbus_0_clock(subsystem_cbus_clock_groups_auto_out_member_subsystem_cbus_0_clock),
    .auto_out_member_subsystem_cbus_0_reset(subsystem_cbus_clock_groups_auto_out_member_subsystem_cbus_0_reset)
  );
  ClockGroup_3 clockGroup ( // @[BusWrapper.scala 41:38]
    .auto_in_member_subsystem_cbus_0_clock(clockGroup_auto_in_member_subsystem_cbus_0_clock),
    .auto_in_member_subsystem_cbus_0_reset(clockGroup_auto_in_member_subsystem_cbus_0_reset),
    .auto_out_clock(clockGroup_auto_out_clock),
    .auto_out_reset(clockGroup_auto_out_reset)
  );
  FixedClockBroadcast_3 fixedClockNode ( // @[ClockGroup.scala 106:107]
    .auto_in_clock(fixedClockNode_auto_in_clock),
    .auto_in_reset(fixedClockNode_auto_in_reset),
    .auto_out_4_clock(fixedClockNode_auto_out_4_clock),
    .auto_out_4_reset(fixedClockNode_auto_out_4_reset),
    .auto_out_3_clock(fixedClockNode_auto_out_3_clock),
    .auto_out_3_reset(fixedClockNode_auto_out_3_reset),
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
  TLFIFOFixer_2 fixer ( // @[PeripheryBus.scala 47:33]
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
  TLXbar_4 in_xbar ( // @[PeripheryBus.scala 49:29]
    .clock(in_xbar_clock),
    .reset(in_xbar_reset),
    .auto_in_1_a_ready(in_xbar_auto_in_1_a_ready),
    .auto_in_1_a_valid(in_xbar_auto_in_1_a_valid),
    .auto_in_1_a_bits_opcode(in_xbar_auto_in_1_a_bits_opcode),
    .auto_in_1_a_bits_param(in_xbar_auto_in_1_a_bits_param),
    .auto_in_1_a_bits_size(in_xbar_auto_in_1_a_bits_size),
    .auto_in_1_a_bits_source(in_xbar_auto_in_1_a_bits_source),
    .auto_in_1_a_bits_address(in_xbar_auto_in_1_a_bits_address),
    .auto_in_1_a_bits_mask(in_xbar_auto_in_1_a_bits_mask),
    .auto_in_1_a_bits_data(in_xbar_auto_in_1_a_bits_data),
    .auto_in_1_a_bits_corrupt(in_xbar_auto_in_1_a_bits_corrupt),
    .auto_in_1_d_ready(in_xbar_auto_in_1_d_ready),
    .auto_in_1_d_valid(in_xbar_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode(in_xbar_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_param(in_xbar_auto_in_1_d_bits_param),
    .auto_in_1_d_bits_size(in_xbar_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_source(in_xbar_auto_in_1_d_bits_source),
    .auto_in_1_d_bits_sink(in_xbar_auto_in_1_d_bits_sink),
    .auto_in_1_d_bits_denied(in_xbar_auto_in_1_d_bits_denied),
    .auto_in_1_d_bits_data(in_xbar_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt(in_xbar_auto_in_1_d_bits_corrupt),
    .auto_in_0_a_ready(in_xbar_auto_in_0_a_ready),
    .auto_in_0_a_valid(in_xbar_auto_in_0_a_valid),
    .auto_in_0_a_bits_opcode(in_xbar_auto_in_0_a_bits_opcode),
    .auto_in_0_a_bits_param(in_xbar_auto_in_0_a_bits_param),
    .auto_in_0_a_bits_size(in_xbar_auto_in_0_a_bits_size),
    .auto_in_0_a_bits_source(in_xbar_auto_in_0_a_bits_source),
    .auto_in_0_a_bits_address(in_xbar_auto_in_0_a_bits_address),
    .auto_in_0_a_bits_mask(in_xbar_auto_in_0_a_bits_mask),
    .auto_in_0_a_bits_data(in_xbar_auto_in_0_a_bits_data),
    .auto_in_0_a_bits_corrupt(in_xbar_auto_in_0_a_bits_corrupt),
    .auto_in_0_d_ready(in_xbar_auto_in_0_d_ready),
    .auto_in_0_d_valid(in_xbar_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode(in_xbar_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param(in_xbar_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size(in_xbar_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source(in_xbar_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink(in_xbar_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied(in_xbar_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data(in_xbar_auto_in_0_d_bits_data),
    .auto_in_0_d_bits_corrupt(in_xbar_auto_in_0_d_bits_corrupt),
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
  TLXbar_5 out_xbar ( // @[PeripheryBus.scala 50:30]
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
    .auto_out_5_a_ready(out_xbar_auto_out_5_a_ready),
    .auto_out_5_a_valid(out_xbar_auto_out_5_a_valid),
    .auto_out_5_a_bits_opcode(out_xbar_auto_out_5_a_bits_opcode),
    .auto_out_5_a_bits_param(out_xbar_auto_out_5_a_bits_param),
    .auto_out_5_a_bits_size(out_xbar_auto_out_5_a_bits_size),
    .auto_out_5_a_bits_source(out_xbar_auto_out_5_a_bits_source),
    .auto_out_5_a_bits_address(out_xbar_auto_out_5_a_bits_address),
    .auto_out_5_a_bits_mask(out_xbar_auto_out_5_a_bits_mask),
    .auto_out_5_a_bits_data(out_xbar_auto_out_5_a_bits_data),
    .auto_out_5_a_bits_corrupt(out_xbar_auto_out_5_a_bits_corrupt),
    .auto_out_5_d_ready(out_xbar_auto_out_5_d_ready),
    .auto_out_5_d_valid(out_xbar_auto_out_5_d_valid),
    .auto_out_5_d_bits_opcode(out_xbar_auto_out_5_d_bits_opcode),
    .auto_out_5_d_bits_param(out_xbar_auto_out_5_d_bits_param),
    .auto_out_5_d_bits_size(out_xbar_auto_out_5_d_bits_size),
    .auto_out_5_d_bits_source(out_xbar_auto_out_5_d_bits_source),
    .auto_out_5_d_bits_sink(out_xbar_auto_out_5_d_bits_sink),
    .auto_out_5_d_bits_denied(out_xbar_auto_out_5_d_bits_denied),
    .auto_out_5_d_bits_data(out_xbar_auto_out_5_d_bits_data),
    .auto_out_5_d_bits_corrupt(out_xbar_auto_out_5_d_bits_corrupt),
    .auto_out_4_a_ready(out_xbar_auto_out_4_a_ready),
    .auto_out_4_a_valid(out_xbar_auto_out_4_a_valid),
    .auto_out_4_a_bits_opcode(out_xbar_auto_out_4_a_bits_opcode),
    .auto_out_4_a_bits_param(out_xbar_auto_out_4_a_bits_param),
    .auto_out_4_a_bits_size(out_xbar_auto_out_4_a_bits_size),
    .auto_out_4_a_bits_source(out_xbar_auto_out_4_a_bits_source),
    .auto_out_4_a_bits_address(out_xbar_auto_out_4_a_bits_address),
    .auto_out_4_a_bits_mask(out_xbar_auto_out_4_a_bits_mask),
    .auto_out_4_a_bits_data(out_xbar_auto_out_4_a_bits_data),
    .auto_out_4_a_bits_corrupt(out_xbar_auto_out_4_a_bits_corrupt),
    .auto_out_4_d_ready(out_xbar_auto_out_4_d_ready),
    .auto_out_4_d_valid(out_xbar_auto_out_4_d_valid),
    .auto_out_4_d_bits_opcode(out_xbar_auto_out_4_d_bits_opcode),
    .auto_out_4_d_bits_param(out_xbar_auto_out_4_d_bits_param),
    .auto_out_4_d_bits_size(out_xbar_auto_out_4_d_bits_size),
    .auto_out_4_d_bits_source(out_xbar_auto_out_4_d_bits_source),
    .auto_out_4_d_bits_sink(out_xbar_auto_out_4_d_bits_sink),
    .auto_out_4_d_bits_denied(out_xbar_auto_out_4_d_bits_denied),
    .auto_out_4_d_bits_data(out_xbar_auto_out_4_d_bits_data),
    .auto_out_4_d_bits_corrupt(out_xbar_auto_out_4_d_bits_corrupt),
    .auto_out_3_a_ready(out_xbar_auto_out_3_a_ready),
    .auto_out_3_a_valid(out_xbar_auto_out_3_a_valid),
    .auto_out_3_a_bits_opcode(out_xbar_auto_out_3_a_bits_opcode),
    .auto_out_3_a_bits_param(out_xbar_auto_out_3_a_bits_param),
    .auto_out_3_a_bits_size(out_xbar_auto_out_3_a_bits_size),
    .auto_out_3_a_bits_source(out_xbar_auto_out_3_a_bits_source),
    .auto_out_3_a_bits_address(out_xbar_auto_out_3_a_bits_address),
    .auto_out_3_a_bits_mask(out_xbar_auto_out_3_a_bits_mask),
    .auto_out_3_a_bits_data(out_xbar_auto_out_3_a_bits_data),
    .auto_out_3_a_bits_corrupt(out_xbar_auto_out_3_a_bits_corrupt),
    .auto_out_3_d_ready(out_xbar_auto_out_3_d_ready),
    .auto_out_3_d_valid(out_xbar_auto_out_3_d_valid),
    .auto_out_3_d_bits_opcode(out_xbar_auto_out_3_d_bits_opcode),
    .auto_out_3_d_bits_param(out_xbar_auto_out_3_d_bits_param),
    .auto_out_3_d_bits_size(out_xbar_auto_out_3_d_bits_size),
    .auto_out_3_d_bits_source(out_xbar_auto_out_3_d_bits_source),
    .auto_out_3_d_bits_sink(out_xbar_auto_out_3_d_bits_sink),
    .auto_out_3_d_bits_denied(out_xbar_auto_out_3_d_bits_denied),
    .auto_out_3_d_bits_data(out_xbar_auto_out_3_d_bits_data),
    .auto_out_3_d_bits_corrupt(out_xbar_auto_out_3_d_bits_corrupt),
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
  TLBuffer_7 buffer ( // @[Buffer.scala 68:28]
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
  TLAtomicAutomata_1 atomics ( // @[AtomicAutomata.scala 283:29]
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
  ErrorDeviceWrapper wrapped_error_device ( // @[LazyModule.scala 432:27]
    .clock(wrapped_error_device_clock),
    .reset(wrapped_error_device_reset),
    .auto_buffer_in_a_ready(wrapped_error_device_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(wrapped_error_device_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(wrapped_error_device_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(wrapped_error_device_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(wrapped_error_device_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(wrapped_error_device_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(wrapped_error_device_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(wrapped_error_device_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_data(wrapped_error_device_auto_buffer_in_a_bits_data),
    .auto_buffer_in_a_bits_corrupt(wrapped_error_device_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(wrapped_error_device_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(wrapped_error_device_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(wrapped_error_device_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param(wrapped_error_device_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size(wrapped_error_device_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(wrapped_error_device_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink(wrapped_error_device_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied(wrapped_error_device_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data(wrapped_error_device_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt(wrapped_error_device_auto_buffer_in_d_bits_corrupt)
  );
  TLBuffer_9 buffer_1 ( // @[Buffer.scala 68:28]
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
  TLInterconnectCoupler_8 coupler_to_bus_named_subsystem_pbus ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_bus_named_subsystem_pbus_clock),
    .reset(coupler_to_bus_named_subsystem_pbus_reset),
    .auto_widget_in_a_ready(coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_ready),
    .auto_widget_in_a_valid(coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_valid),
    .auto_widget_in_a_bits_opcode(coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_opcode),
    .auto_widget_in_a_bits_param(coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_param),
    .auto_widget_in_a_bits_size(coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_size),
    .auto_widget_in_a_bits_source(coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_source),
    .auto_widget_in_a_bits_address(coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_address),
    .auto_widget_in_a_bits_mask(coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_mask),
    .auto_widget_in_a_bits_data(coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_data),
    .auto_widget_in_a_bits_corrupt(coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_corrupt),
    .auto_widget_in_d_ready(coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_ready),
    .auto_widget_in_d_valid(coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_valid),
    .auto_widget_in_d_bits_opcode(coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_opcode),
    .auto_widget_in_d_bits_param(coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_param),
    .auto_widget_in_d_bits_size(coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_size),
    .auto_widget_in_d_bits_source(coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_source),
    .auto_widget_in_d_bits_sink(coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_sink),
    .auto_widget_in_d_bits_denied(coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_denied),
    .auto_widget_in_d_bits_data(coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_data),
    .auto_widget_in_d_bits_corrupt(coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_corrupt),
    .auto_bus_xing_out_a_ready(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_ready),
    .auto_bus_xing_out_a_valid(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_valid),
    .auto_bus_xing_out_a_bits_opcode(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_opcode),
    .auto_bus_xing_out_a_bits_param(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_param),
    .auto_bus_xing_out_a_bits_size(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_size),
    .auto_bus_xing_out_a_bits_source(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_source),
    .auto_bus_xing_out_a_bits_address(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_address),
    .auto_bus_xing_out_a_bits_mask(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_mask),
    .auto_bus_xing_out_a_bits_data(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_data),
    .auto_bus_xing_out_a_bits_corrupt(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_corrupt),
    .auto_bus_xing_out_d_ready(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_ready),
    .auto_bus_xing_out_d_valid(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_valid),
    .auto_bus_xing_out_d_bits_opcode(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_opcode),
    .auto_bus_xing_out_d_bits_param(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_param),
    .auto_bus_xing_out_d_bits_size(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_size),
    .auto_bus_xing_out_d_bits_source(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_source),
    .auto_bus_xing_out_d_bits_sink(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_sink),
    .auto_bus_xing_out_d_bits_denied(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_denied),
    .auto_bus_xing_out_d_bits_data(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_data),
    .auto_bus_xing_out_d_bits_corrupt(coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_corrupt)
  );
  TLInterconnectCoupler_9 coupler_to_plic ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_plic_clock),
    .reset(coupler_to_plic_reset),
    .auto_fragmenter_out_a_ready(coupler_to_plic_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_plic_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_plic_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_plic_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_plic_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_plic_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_plic_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_plic_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_plic_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_plic_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_plic_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_plic_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_plic_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_param(coupler_to_plic_auto_fragmenter_out_d_bits_param),
    .auto_fragmenter_out_d_bits_size(coupler_to_plic_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_plic_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_sink(coupler_to_plic_auto_fragmenter_out_d_bits_sink),
    .auto_fragmenter_out_d_bits_denied(coupler_to_plic_auto_fragmenter_out_d_bits_denied),
    .auto_fragmenter_out_d_bits_data(coupler_to_plic_auto_fragmenter_out_d_bits_data),
    .auto_fragmenter_out_d_bits_corrupt(coupler_to_plic_auto_fragmenter_out_d_bits_corrupt),
    .auto_tl_in_a_ready(coupler_to_plic_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_plic_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_plic_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_plic_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_plic_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_plic_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_plic_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_plic_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_plic_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_plic_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_plic_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_plic_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_plic_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param(coupler_to_plic_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size(coupler_to_plic_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_plic_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_sink(coupler_to_plic_auto_tl_in_d_bits_sink),
    .auto_tl_in_d_bits_denied(coupler_to_plic_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data(coupler_to_plic_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt(coupler_to_plic_auto_tl_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_10 coupler_to_clint ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_clint_clock),
    .reset(coupler_to_clint_reset),
    .auto_fragmenter_out_a_ready(coupler_to_clint_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_clint_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_clint_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_clint_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_clint_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_clint_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_clint_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_clint_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_clint_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_clint_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_clint_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_clint_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_clint_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_param(coupler_to_clint_auto_fragmenter_out_d_bits_param),
    .auto_fragmenter_out_d_bits_size(coupler_to_clint_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_clint_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_sink(coupler_to_clint_auto_fragmenter_out_d_bits_sink),
    .auto_fragmenter_out_d_bits_denied(coupler_to_clint_auto_fragmenter_out_d_bits_denied),
    .auto_fragmenter_out_d_bits_data(coupler_to_clint_auto_fragmenter_out_d_bits_data),
    .auto_fragmenter_out_d_bits_corrupt(coupler_to_clint_auto_fragmenter_out_d_bits_corrupt),
    .auto_tl_in_a_ready(coupler_to_clint_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_clint_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_clint_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_clint_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_clint_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_clint_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_clint_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_clint_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_clint_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_clint_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_clint_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_clint_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_clint_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param(coupler_to_clint_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size(coupler_to_clint_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_clint_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_sink(coupler_to_clint_auto_tl_in_d_bits_sink),
    .auto_tl_in_d_bits_denied(coupler_to_clint_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data(coupler_to_clint_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt(coupler_to_clint_auto_tl_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_11 coupler_to_debug ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_debug_clock),
    .reset(coupler_to_debug_reset),
    .auto_fragmenter_out_a_ready(coupler_to_debug_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_debug_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_debug_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_debug_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_debug_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_debug_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_debug_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_debug_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_debug_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_debug_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_debug_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_debug_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_debug_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_param(coupler_to_debug_auto_fragmenter_out_d_bits_param),
    .auto_fragmenter_out_d_bits_size(coupler_to_debug_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_debug_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_sink(coupler_to_debug_auto_fragmenter_out_d_bits_sink),
    .auto_fragmenter_out_d_bits_denied(coupler_to_debug_auto_fragmenter_out_d_bits_denied),
    .auto_fragmenter_out_d_bits_data(coupler_to_debug_auto_fragmenter_out_d_bits_data),
    .auto_fragmenter_out_d_bits_corrupt(coupler_to_debug_auto_fragmenter_out_d_bits_corrupt),
    .auto_tl_in_a_ready(coupler_to_debug_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_debug_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_debug_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_debug_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_debug_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_debug_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_debug_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_debug_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_debug_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_debug_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_debug_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_debug_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_debug_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param(coupler_to_debug_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size(coupler_to_debug_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_debug_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_sink(coupler_to_debug_auto_tl_in_d_bits_sink),
    .auto_tl_in_d_bits_denied(coupler_to_debug_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data(coupler_to_debug_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt(coupler_to_debug_auto_tl_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_12 coupler_to_boom_tile ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_boom_tile_clock),
    .reset(coupler_to_boom_tile_reset)
  );
  TLInterconnectCoupler_13 coupler_to_bootrom ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_bootrom_clock),
    .reset(coupler_to_bootrom_reset),
    .auto_fragmenter_out_a_ready(coupler_to_bootrom_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_bootrom_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_bootrom_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_bootrom_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_bootrom_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_bootrom_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_bootrom_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_bootrom_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_bootrom_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_bootrom_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_bootrom_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_bootrom_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_bootrom_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_param(coupler_to_bootrom_auto_fragmenter_out_d_bits_param),
    .auto_fragmenter_out_d_bits_size(coupler_to_bootrom_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_bootrom_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_sink(coupler_to_bootrom_auto_fragmenter_out_d_bits_sink),
    .auto_fragmenter_out_d_bits_denied(coupler_to_bootrom_auto_fragmenter_out_d_bits_denied),
    .auto_fragmenter_out_d_bits_data(coupler_to_bootrom_auto_fragmenter_out_d_bits_data),
    .auto_fragmenter_out_d_bits_corrupt(coupler_to_bootrom_auto_fragmenter_out_d_bits_corrupt),
    .auto_tl_in_a_ready(coupler_to_bootrom_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_bootrom_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_bootrom_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_bootrom_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_bootrom_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_bootrom_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_bootrom_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_bootrom_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_bootrom_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_bootrom_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_bootrom_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_bootrom_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_bootrom_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param(coupler_to_bootrom_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size(coupler_to_bootrom_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_bootrom_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_sink(coupler_to_bootrom_auto_tl_in_d_bits_sink),
    .auto_tl_in_d_bits_denied(coupler_to_bootrom_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data(coupler_to_bootrom_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt(coupler_to_bootrom_auto_tl_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_14 coupler_from_port_named_custom_boot_pin ( // @[LazyModule.scala 432:27]
    .clock(coupler_from_port_named_custom_boot_pin_clock),
    .reset(coupler_from_port_named_custom_boot_pin_reset),
    .auto_tl_in_a_ready(coupler_from_port_named_custom_boot_pin_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_from_port_named_custom_boot_pin_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_from_port_named_custom_boot_pin_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_from_port_named_custom_boot_pin_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param(coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size(coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_sink(coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_sink),
    .auto_tl_in_d_bits_denied(coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data(coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt(coupler_from_port_named_custom_boot_pin_auto_tl_in_d_bits_corrupt),
    .auto_tl_out_a_ready(coupler_from_port_named_custom_boot_pin_auto_tl_out_a_ready),
    .auto_tl_out_a_valid(coupler_from_port_named_custom_boot_pin_auto_tl_out_a_valid),
    .auto_tl_out_a_bits_opcode(coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_opcode),
    .auto_tl_out_a_bits_param(coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_param),
    .auto_tl_out_a_bits_size(coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_size),
    .auto_tl_out_a_bits_source(coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_source),
    .auto_tl_out_a_bits_address(coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_address),
    .auto_tl_out_a_bits_mask(coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_mask),
    .auto_tl_out_a_bits_data(coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_data),
    .auto_tl_out_a_bits_corrupt(coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_corrupt),
    .auto_tl_out_d_ready(coupler_from_port_named_custom_boot_pin_auto_tl_out_d_ready),
    .auto_tl_out_d_valid(coupler_from_port_named_custom_boot_pin_auto_tl_out_d_valid),
    .auto_tl_out_d_bits_opcode(coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_opcode),
    .auto_tl_out_d_bits_param(coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_param),
    .auto_tl_out_d_bits_size(coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_size),
    .auto_tl_out_d_bits_source(coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_source),
    .auto_tl_out_d_bits_sink(coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_sink),
    .auto_tl_out_d_bits_denied(coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_denied),
    .auto_tl_out_d_bits_data(coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_data),
    .auto_tl_out_d_bits_corrupt(coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_corrupt)
  );
  assign auto_coupler_to_bootrom_fragmenter_out_a_valid = coupler_to_bootrom_auto_fragmenter_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode = coupler_to_bootrom_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_param = coupler_to_bootrom_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_size = coupler_to_bootrom_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_source = coupler_to_bootrom_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_address = coupler_to_bootrom_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_mask = coupler_to_bootrom_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_data = coupler_to_bootrom_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt = coupler_to_bootrom_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_d_ready = coupler_to_bootrom_auto_fragmenter_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_valid = coupler_to_debug_auto_fragmenter_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_opcode = coupler_to_debug_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_param = coupler_to_debug_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_size = coupler_to_debug_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_source = coupler_to_debug_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_address = coupler_to_debug_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_mask = coupler_to_debug_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_data = coupler_to_debug_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_corrupt = coupler_to_debug_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_d_ready = coupler_to_debug_auto_fragmenter_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_valid = coupler_to_clint_auto_fragmenter_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_opcode = coupler_to_clint_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_param = coupler_to_clint_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_size = coupler_to_clint_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_source = coupler_to_clint_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_address = coupler_to_clint_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_mask = coupler_to_clint_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_data = coupler_to_clint_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_corrupt = coupler_to_clint_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_d_ready = coupler_to_clint_auto_fragmenter_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_valid = coupler_to_plic_auto_fragmenter_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_opcode = coupler_to_plic_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_param = coupler_to_plic_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_size = coupler_to_plic_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_source = coupler_to_plic_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_address = coupler_to_plic_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_mask = coupler_to_plic_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_data = coupler_to_plic_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_corrupt = coupler_to_plic_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_d_ready = coupler_to_plic_auto_fragmenter_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid =
    coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode =
    coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param =
    coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size =
    coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source =
    coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address =
    coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask =
    coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data =
    coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt =
    coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready =
    coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_3_clock = fixedClockNode_auto_out_4_clock; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_3_reset = fixedClockNode_auto_out_4_reset; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_2_clock = fixedClockNode_auto_out_3_clock; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_2_reset = fixedClockNode_auto_out_3_reset; // @[LazyModule.scala 311:12]
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
  assign subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_clock =
    auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_reset =
    auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset; // @[LazyModule.scala 309:16]
  assign clockGroup_auto_in_member_subsystem_cbus_0_clock =
    subsystem_cbus_clock_groups_auto_out_member_subsystem_cbus_0_clock; // @[LazyModule.scala 298:16]
  assign clockGroup_auto_in_member_subsystem_cbus_0_reset =
    subsystem_cbus_clock_groups_auto_out_member_subsystem_cbus_0_reset; // @[LazyModule.scala 298:16]
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
  assign in_xbar_auto_in_1_a_valid = coupler_from_port_named_custom_boot_pin_auto_tl_out_a_valid; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_1_a_bits_opcode = coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_1_a_bits_param = coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_1_a_bits_size = coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_1_a_bits_source = coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_1_a_bits_address = coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_1_a_bits_mask = coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_1_a_bits_data = coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_1_a_bits_corrupt = coupler_from_port_named_custom_boot_pin_auto_tl_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_1_d_ready = coupler_from_port_named_custom_boot_pin_auto_tl_out_d_ready; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_0_a_valid = buffer_1_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_0_a_bits_opcode = buffer_1_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_0_a_bits_param = buffer_1_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_0_a_bits_size = buffer_1_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_0_a_bits_source = buffer_1_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_0_a_bits_address = buffer_1_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_0_a_bits_mask = buffer_1_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_0_a_bits_data = buffer_1_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_0_a_bits_corrupt = buffer_1_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_0_d_ready = buffer_1_auto_out_d_ready; // @[LazyModule.scala 296:16]
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
  assign out_xbar_auto_out_5_a_ready = coupler_to_bootrom_auto_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_5_d_valid = coupler_to_bootrom_auto_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_5_d_bits_opcode = coupler_to_bootrom_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_5_d_bits_param = coupler_to_bootrom_auto_tl_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_5_d_bits_size = coupler_to_bootrom_auto_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_5_d_bits_source = coupler_to_bootrom_auto_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_5_d_bits_sink = coupler_to_bootrom_auto_tl_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_5_d_bits_denied = coupler_to_bootrom_auto_tl_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_5_d_bits_data = coupler_to_bootrom_auto_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_5_d_bits_corrupt = coupler_to_bootrom_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_a_ready = coupler_to_debug_auto_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_valid = coupler_to_debug_auto_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_bits_opcode = coupler_to_debug_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_bits_param = coupler_to_debug_auto_tl_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_bits_size = coupler_to_debug_auto_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_bits_source = coupler_to_debug_auto_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_bits_sink = coupler_to_debug_auto_tl_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_bits_denied = coupler_to_debug_auto_tl_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_bits_data = coupler_to_debug_auto_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_bits_corrupt = coupler_to_debug_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_a_ready = coupler_to_clint_auto_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_valid = coupler_to_clint_auto_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_opcode = coupler_to_clint_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_param = coupler_to_clint_auto_tl_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_size = coupler_to_clint_auto_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_source = coupler_to_clint_auto_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_sink = coupler_to_clint_auto_tl_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_denied = coupler_to_clint_auto_tl_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_data = coupler_to_clint_auto_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_corrupt = coupler_to_clint_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_a_ready = coupler_to_plic_auto_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_valid = coupler_to_plic_auto_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_opcode = coupler_to_plic_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_param = coupler_to_plic_auto_tl_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_size = coupler_to_plic_auto_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_source = coupler_to_plic_auto_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_sink = coupler_to_plic_auto_tl_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_denied = coupler_to_plic_auto_tl_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_data = coupler_to_plic_auto_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_corrupt = coupler_to_plic_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_a_ready = coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_valid = coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_opcode = coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_param = coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_size = coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_source = coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_sink = coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_denied = coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_data = coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_corrupt = coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_a_ready = wrapped_error_device_auto_buffer_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_valid = wrapped_error_device_auto_buffer_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_opcode = wrapped_error_device_auto_buffer_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_param = wrapped_error_device_auto_buffer_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_size = wrapped_error_device_auto_buffer_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_source = wrapped_error_device_auto_buffer_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_sink = wrapped_error_device_auto_buffer_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_denied = wrapped_error_device_auto_buffer_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_data = wrapped_error_device_auto_buffer_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_corrupt = wrapped_error_device_auto_buffer_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
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
  assign wrapped_error_device_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign wrapped_error_device_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign wrapped_error_device_auto_buffer_in_a_valid = out_xbar_auto_out_0_a_valid; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_opcode = out_xbar_auto_out_0_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_param = out_xbar_auto_out_0_a_bits_param; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_size = out_xbar_auto_out_0_a_bits_size; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_source = out_xbar_auto_out_0_a_bits_source; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_address = out_xbar_auto_out_0_a_bits_address; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_mask = out_xbar_auto_out_0_a_bits_mask; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_data = out_xbar_auto_out_0_a_bits_data; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_corrupt = out_xbar_auto_out_0_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_d_ready = out_xbar_auto_out_0_d_ready; // @[LazyModule.scala 298:16]
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
  assign buffer_1_auto_out_a_ready = in_xbar_auto_in_0_a_ready; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_valid = in_xbar_auto_in_0_d_valid; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_opcode = in_xbar_auto_in_0_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_param = in_xbar_auto_in_0_d_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_size = in_xbar_auto_in_0_d_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_source = in_xbar_auto_in_0_d_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_sink = in_xbar_auto_in_0_d_bits_sink; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_denied = in_xbar_auto_in_0_d_bits_denied; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_data = in_xbar_auto_in_0_d_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_corrupt = in_xbar_auto_in_0_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign coupler_to_bus_named_subsystem_pbus_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bus_named_subsystem_pbus_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_valid = out_xbar_auto_out_1_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_opcode = out_xbar_auto_out_1_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_param = out_xbar_auto_out_1_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_size = out_xbar_auto_out_1_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_source = out_xbar_auto_out_1_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_address = out_xbar_auto_out_1_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_mask = out_xbar_auto_out_1_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_data = out_xbar_auto_out_1_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_pbus_auto_widget_in_a_bits_corrupt = out_xbar_auto_out_1_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_pbus_auto_widget_in_d_ready = out_xbar_auto_out_1_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_a_ready =
    auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_valid =
    auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_opcode =
    auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_param =
    auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_size =
    auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_source =
    auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_sink =
    auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_denied =
    auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_data =
    auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_bus_named_subsystem_pbus_auto_bus_xing_out_d_bits_corrupt =
    auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_plic_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_plic_auto_fragmenter_out_a_ready = auto_coupler_to_plic_fragmenter_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_valid = auto_coupler_to_plic_fragmenter_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_plic_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_param = auto_coupler_to_plic_fragmenter_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_size = auto_coupler_to_plic_fragmenter_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_source = auto_coupler_to_plic_fragmenter_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_sink = auto_coupler_to_plic_fragmenter_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_denied = auto_coupler_to_plic_fragmenter_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_data = auto_coupler_to_plic_fragmenter_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_corrupt = auto_coupler_to_plic_fragmenter_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_tl_in_a_valid = out_xbar_auto_out_2_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_opcode = out_xbar_auto_out_2_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_param = out_xbar_auto_out_2_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_size = out_xbar_auto_out_2_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_source = out_xbar_auto_out_2_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_address = out_xbar_auto_out_2_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_mask = out_xbar_auto_out_2_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_data = out_xbar_auto_out_2_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_2_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_d_ready = out_xbar_auto_out_2_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_clint_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_clint_auto_fragmenter_out_a_ready = auto_coupler_to_clint_fragmenter_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_valid = auto_coupler_to_clint_fragmenter_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_clint_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_param = auto_coupler_to_clint_fragmenter_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_size = auto_coupler_to_clint_fragmenter_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_source = auto_coupler_to_clint_fragmenter_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_sink = auto_coupler_to_clint_fragmenter_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_denied = auto_coupler_to_clint_fragmenter_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_data = auto_coupler_to_clint_fragmenter_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_corrupt = auto_coupler_to_clint_fragmenter_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_tl_in_a_valid = out_xbar_auto_out_3_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_opcode = out_xbar_auto_out_3_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_param = out_xbar_auto_out_3_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_size = out_xbar_auto_out_3_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_source = out_xbar_auto_out_3_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_address = out_xbar_auto_out_3_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_mask = out_xbar_auto_out_3_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_data = out_xbar_auto_out_3_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_3_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_d_ready = out_xbar_auto_out_3_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_debug_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_debug_auto_fragmenter_out_a_ready = auto_coupler_to_debug_fragmenter_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_valid = auto_coupler_to_debug_fragmenter_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_debug_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_param = auto_coupler_to_debug_fragmenter_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_size = auto_coupler_to_debug_fragmenter_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_source = auto_coupler_to_debug_fragmenter_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_sink = auto_coupler_to_debug_fragmenter_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_denied = auto_coupler_to_debug_fragmenter_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_data = auto_coupler_to_debug_fragmenter_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_corrupt = auto_coupler_to_debug_fragmenter_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_tl_in_a_valid = out_xbar_auto_out_4_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_opcode = out_xbar_auto_out_4_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_param = out_xbar_auto_out_4_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_size = out_xbar_auto_out_4_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_source = out_xbar_auto_out_4_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_address = out_xbar_auto_out_4_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_mask = out_xbar_auto_out_4_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_data = out_xbar_auto_out_4_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_4_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_d_ready = out_xbar_auto_out_4_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_boom_tile_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_boom_tile_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bootrom_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bootrom_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bootrom_auto_fragmenter_out_a_ready = auto_coupler_to_bootrom_fragmenter_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_valid = auto_coupler_to_bootrom_fragmenter_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_bootrom_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_param = auto_coupler_to_bootrom_fragmenter_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_size = auto_coupler_to_bootrom_fragmenter_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_source = auto_coupler_to_bootrom_fragmenter_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_sink = auto_coupler_to_bootrom_fragmenter_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_denied = auto_coupler_to_bootrom_fragmenter_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_data = auto_coupler_to_bootrom_fragmenter_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_corrupt = auto_coupler_to_bootrom_fragmenter_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_tl_in_a_valid = out_xbar_auto_out_5_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_opcode = out_xbar_auto_out_5_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_param = out_xbar_auto_out_5_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_size = out_xbar_auto_out_5_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_source = out_xbar_auto_out_5_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_address = out_xbar_auto_out_5_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_mask = out_xbar_auto_out_5_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_data = out_xbar_auto_out_5_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_5_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_d_ready = out_xbar_auto_out_5_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_from_port_named_custom_boot_pin_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_from_port_named_custom_boot_pin_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_in_a_valid = _T ? 1'h0 : _GEN_28; // @[Conditional.scala 40:58 CustomBootPin.scala 47:20]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_opcode = 3'h0; // @[Conditional.scala 39:67 CustomBootPin.scala 54:23]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_param = 3'h0; // @[Conditional.scala 39:67 CustomBootPin.scala 54:23]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_size = 4'h2; // @[Conditional.scala 39:67 CustomBootPin.scala 54:23]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_source = 1'h0; // @[Conditional.scala 39:67 CustomBootPin.scala 54:23]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_address = _T_1 ? 31'h4000 : 31'h2000000; // @[Conditional.scala 39:67 CustomBootPin.scala 54:23]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_mask = 8'hf; // @[Conditional.scala 39:67 CustomBootPin.scala 54:23]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_data = _T_1 ? 64'h80000000 : 64'h1; // @[Conditional.scala 39:67 CustomBootPin.scala 54:23]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_in_a_bits_corrupt = 1'h0; // @[Conditional.scala 39:67 CustomBootPin.scala 54:23]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_in_d_ready = 1'h1; // @[Nodes.scala 1207:84 CustomBootPin.scala 49:20]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_out_a_ready = in_xbar_auto_in_1_a_ready; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_out_d_valid = in_xbar_auto_in_1_d_valid; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_opcode = in_xbar_auto_in_1_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_param = in_xbar_auto_in_1_d_bits_param; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_size = in_xbar_auto_in_1_d_bits_size; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_source = in_xbar_auto_in_1_d_bits_source; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_sink = in_xbar_auto_in_1_d_bits_sink; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_denied = in_xbar_auto_in_1_d_bits_denied; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_data = in_xbar_auto_in_1_d_bits_data; // @[LazyModule.scala 296:16]
  assign coupler_from_port_named_custom_boot_pin_auto_tl_out_d_bits_corrupt = in_xbar_auto_in_1_d_bits_corrupt; // @[LazyModule.scala 296:16]
  always @(posedge bundleIn_0_clock) begin
    if (bundleIn_0_reset) begin // @[CustomBootPin.scala 46:28]
      REG <= 3'h0; // @[CustomBootPin.scala 46:28]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (custom_boot) begin // @[CustomBootPin.scala 51:46]
        REG <= 3'h1; // @[CustomBootPin.scala 51:54]
      end
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      if (_T_2) begin // @[CustomBootPin.scala 60:32]
        REG <= 3'h2; // @[CustomBootPin.scala 60:40]
      end
    end else if (_T_3) begin // @[Conditional.scala 39:67]
      REG <= _GEN_2;
    end else begin
      REG <= _GEN_17;
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
  _RAND_0 = {1{`RANDOM}};
  REG = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
