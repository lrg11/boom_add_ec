module MemoryBus(
  input         auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_ready,
  output        auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_valid,
  output [2:0]  auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_param,
  output [2:0]  auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_size,
  output [3:0]  auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_source,
  output [28:0] auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_address,
  output [7:0]  auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_mask,
  output [63:0] auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_data,
  output        auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_corrupt,
  output        auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_ready,
  input         auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_valid,
  input  [2:0]  auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_param,
  input  [2:0]  auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_size,
  input  [3:0]  auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_source,
  input         auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_sink,
  input         auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_denied,
  input  [63:0] auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_data,
  input         auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_corrupt,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id,
  output [31:0] auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr,
  output [7:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len,
  output [2:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size,
  output [1:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache,
  output [2:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid,
  output [63:0] auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data,
  output [7:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid,
  input  [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id,
  input  [1:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id,
  output [31:0] auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr,
  output [7:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len,
  output [2:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size,
  output [1:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache,
  output [2:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot,
  output [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos,
  output        auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid,
  input  [3:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id,
  input  [63:0] auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data,
  input  [1:0]  auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp,
  input         auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last,
  output        auto_fixedClockNode_out_clock,
  output        auto_fixedClockNode_out_reset,
  input         auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock,
  input         auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset,
  output        auto_bus_xing_in_a_ready,
  input         auto_bus_xing_in_a_valid,
  input  [2:0]  auto_bus_xing_in_a_bits_opcode,
  input  [2:0]  auto_bus_xing_in_a_bits_param,
  input  [2:0]  auto_bus_xing_in_a_bits_size,
  input  [5:0]  auto_bus_xing_in_a_bits_source,
  input  [31:0] auto_bus_xing_in_a_bits_address,
  input  [7:0]  auto_bus_xing_in_a_bits_mask,
  input  [63:0] auto_bus_xing_in_a_bits_data,
  input         auto_bus_xing_in_a_bits_corrupt,
  input         auto_bus_xing_in_d_ready,
  output        auto_bus_xing_in_d_valid,
  output [2:0]  auto_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_bus_xing_in_d_bits_param,
  output [2:0]  auto_bus_xing_in_d_bits_size,
  output [5:0]  auto_bus_xing_in_d_bits_source,
  output        auto_bus_xing_in_d_bits_sink,
  output        auto_bus_xing_in_d_bits_denied,
  output [63:0] auto_bus_xing_in_d_bits_data,
  output        auto_bus_xing_in_d_bits_corrupt,
  output        clock,
  output        reset
);
  wire  subsystem_mbus_clock_groups_auto_in_member_subsystem_mbus_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_mbus_clock_groups_auto_in_member_subsystem_mbus_0_reset; // @[BusWrapper.scala 40:48]
  wire  subsystem_mbus_clock_groups_auto_out_member_subsystem_mbus_0_clock; // @[BusWrapper.scala 40:48]
  wire  subsystem_mbus_clock_groups_auto_out_member_subsystem_mbus_0_reset; // @[BusWrapper.scala 40:48]
  wire  clockGroup_auto_in_member_subsystem_mbus_0_clock; // @[BusWrapper.scala 41:38]
  wire  clockGroup_auto_in_member_subsystem_mbus_0_reset; // @[BusWrapper.scala 41:38]
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
  wire  subsystem_mbus_xbar_clock; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_reset; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_in_a_ready; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_in_a_valid; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_in_a_bits_opcode; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_in_a_bits_param; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_in_a_bits_size; // @[MemoryBus.scala 42:32]
  wire [5:0] subsystem_mbus_xbar_auto_in_a_bits_source; // @[MemoryBus.scala 42:32]
  wire [31:0] subsystem_mbus_xbar_auto_in_a_bits_address; // @[MemoryBus.scala 42:32]
  wire [7:0] subsystem_mbus_xbar_auto_in_a_bits_mask; // @[MemoryBus.scala 42:32]
  wire [63:0] subsystem_mbus_xbar_auto_in_a_bits_data; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_in_a_bits_corrupt; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_in_d_ready; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_in_d_valid; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_in_d_bits_opcode; // @[MemoryBus.scala 42:32]
  wire [1:0] subsystem_mbus_xbar_auto_in_d_bits_param; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_in_d_bits_size; // @[MemoryBus.scala 42:32]
  wire [5:0] subsystem_mbus_xbar_auto_in_d_bits_source; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_in_d_bits_sink; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_in_d_bits_denied; // @[MemoryBus.scala 42:32]
  wire [63:0] subsystem_mbus_xbar_auto_in_d_bits_data; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_in_d_bits_corrupt; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_1_a_ready; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_1_a_valid; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_out_1_a_bits_opcode; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_out_1_a_bits_param; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_out_1_a_bits_size; // @[MemoryBus.scala 42:32]
  wire [5:0] subsystem_mbus_xbar_auto_out_1_a_bits_source; // @[MemoryBus.scala 42:32]
  wire [28:0] subsystem_mbus_xbar_auto_out_1_a_bits_address; // @[MemoryBus.scala 42:32]
  wire [7:0] subsystem_mbus_xbar_auto_out_1_a_bits_mask; // @[MemoryBus.scala 42:32]
  wire [63:0] subsystem_mbus_xbar_auto_out_1_a_bits_data; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_1_a_bits_corrupt; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_1_d_ready; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_1_d_valid; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_out_1_d_bits_opcode; // @[MemoryBus.scala 42:32]
  wire [1:0] subsystem_mbus_xbar_auto_out_1_d_bits_param; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_out_1_d_bits_size; // @[MemoryBus.scala 42:32]
  wire [5:0] subsystem_mbus_xbar_auto_out_1_d_bits_source; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_1_d_bits_sink; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_1_d_bits_denied; // @[MemoryBus.scala 42:32]
  wire [63:0] subsystem_mbus_xbar_auto_out_1_d_bits_data; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_1_d_bits_corrupt; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_0_a_ready; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_0_a_valid; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_out_0_a_bits_opcode; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_out_0_a_bits_param; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_out_0_a_bits_size; // @[MemoryBus.scala 42:32]
  wire [5:0] subsystem_mbus_xbar_auto_out_0_a_bits_source; // @[MemoryBus.scala 42:32]
  wire [31:0] subsystem_mbus_xbar_auto_out_0_a_bits_address; // @[MemoryBus.scala 42:32]
  wire [7:0] subsystem_mbus_xbar_auto_out_0_a_bits_mask; // @[MemoryBus.scala 42:32]
  wire [63:0] subsystem_mbus_xbar_auto_out_0_a_bits_data; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_0_a_bits_corrupt; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_0_d_ready; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_0_d_valid; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_out_0_d_bits_opcode; // @[MemoryBus.scala 42:32]
  wire [1:0] subsystem_mbus_xbar_auto_out_0_d_bits_param; // @[MemoryBus.scala 42:32]
  wire [2:0] subsystem_mbus_xbar_auto_out_0_d_bits_size; // @[MemoryBus.scala 42:32]
  wire [5:0] subsystem_mbus_xbar_auto_out_0_d_bits_source; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_0_d_bits_sink; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_0_d_bits_denied; // @[MemoryBus.scala 42:32]
  wire [63:0] subsystem_mbus_xbar_auto_out_0_d_bits_data; // @[MemoryBus.scala 42:32]
  wire  subsystem_mbus_xbar_auto_out_0_d_bits_corrupt; // @[MemoryBus.scala 42:32]
  wire  fixer_clock; // @[FIFOFixer.scala 144:27]
  wire  fixer_reset; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_a_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_a_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_a_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_a_bits_param; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_a_bits_size; // @[FIFOFixer.scala 144:27]
  wire [5:0] fixer_auto_in_a_bits_source; // @[FIFOFixer.scala 144:27]
  wire [31:0] fixer_auto_in_a_bits_address; // @[FIFOFixer.scala 144:27]
  wire [7:0] fixer_auto_in_a_bits_mask; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_in_a_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_a_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_d_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_d_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_d_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_in_d_bits_param; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_in_d_bits_size; // @[FIFOFixer.scala 144:27]
  wire [5:0] fixer_auto_in_d_bits_source; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_d_bits_sink; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_d_bits_denied; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_in_d_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_in_d_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_a_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_a_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_a_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_a_bits_param; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_a_bits_size; // @[FIFOFixer.scala 144:27]
  wire [5:0] fixer_auto_out_a_bits_source; // @[FIFOFixer.scala 144:27]
  wire [31:0] fixer_auto_out_a_bits_address; // @[FIFOFixer.scala 144:27]
  wire [7:0] fixer_auto_out_a_bits_mask; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_out_a_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_a_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_d_ready; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_d_valid; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_d_bits_opcode; // @[FIFOFixer.scala 144:27]
  wire [1:0] fixer_auto_out_d_bits_param; // @[FIFOFixer.scala 144:27]
  wire [2:0] fixer_auto_out_d_bits_size; // @[FIFOFixer.scala 144:27]
  wire [5:0] fixer_auto_out_d_bits_source; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_d_bits_sink; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_d_bits_denied; // @[FIFOFixer.scala 144:27]
  wire [63:0] fixer_auto_out_d_bits_data; // @[FIFOFixer.scala 144:27]
  wire  fixer_auto_out_d_bits_corrupt; // @[FIFOFixer.scala 144:27]
  wire  picker_clock; // @[ProbePicker.scala 65:28]
  wire  picker_reset; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_1_a_ready; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_1_a_valid; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_in_1_a_bits_opcode; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_in_1_a_bits_param; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_in_1_a_bits_size; // @[ProbePicker.scala 65:28]
  wire [5:0] picker_auto_in_1_a_bits_source; // @[ProbePicker.scala 65:28]
  wire [28:0] picker_auto_in_1_a_bits_address; // @[ProbePicker.scala 65:28]
  wire [7:0] picker_auto_in_1_a_bits_mask; // @[ProbePicker.scala 65:28]
  wire [63:0] picker_auto_in_1_a_bits_data; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_1_a_bits_corrupt; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_1_d_ready; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_1_d_valid; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_in_1_d_bits_opcode; // @[ProbePicker.scala 65:28]
  wire [1:0] picker_auto_in_1_d_bits_param; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_in_1_d_bits_size; // @[ProbePicker.scala 65:28]
  wire [5:0] picker_auto_in_1_d_bits_source; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_1_d_bits_sink; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_1_d_bits_denied; // @[ProbePicker.scala 65:28]
  wire [63:0] picker_auto_in_1_d_bits_data; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_1_d_bits_corrupt; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_0_a_ready; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_0_a_valid; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_in_0_a_bits_opcode; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_in_0_a_bits_param; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_in_0_a_bits_size; // @[ProbePicker.scala 65:28]
  wire [5:0] picker_auto_in_0_a_bits_source; // @[ProbePicker.scala 65:28]
  wire [31:0] picker_auto_in_0_a_bits_address; // @[ProbePicker.scala 65:28]
  wire [7:0] picker_auto_in_0_a_bits_mask; // @[ProbePicker.scala 65:28]
  wire [63:0] picker_auto_in_0_a_bits_data; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_0_a_bits_corrupt; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_0_d_ready; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_0_d_valid; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_in_0_d_bits_opcode; // @[ProbePicker.scala 65:28]
  wire [1:0] picker_auto_in_0_d_bits_param; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_in_0_d_bits_size; // @[ProbePicker.scala 65:28]
  wire [5:0] picker_auto_in_0_d_bits_source; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_0_d_bits_sink; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_0_d_bits_denied; // @[ProbePicker.scala 65:28]
  wire [63:0] picker_auto_in_0_d_bits_data; // @[ProbePicker.scala 65:28]
  wire  picker_auto_in_0_d_bits_corrupt; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_1_a_ready; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_1_a_valid; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_out_1_a_bits_opcode; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_out_1_a_bits_param; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_out_1_a_bits_size; // @[ProbePicker.scala 65:28]
  wire [5:0] picker_auto_out_1_a_bits_source; // @[ProbePicker.scala 65:28]
  wire [28:0] picker_auto_out_1_a_bits_address; // @[ProbePicker.scala 65:28]
  wire [7:0] picker_auto_out_1_a_bits_mask; // @[ProbePicker.scala 65:28]
  wire [63:0] picker_auto_out_1_a_bits_data; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_1_a_bits_corrupt; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_1_d_ready; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_1_d_valid; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_out_1_d_bits_opcode; // @[ProbePicker.scala 65:28]
  wire [1:0] picker_auto_out_1_d_bits_param; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_out_1_d_bits_size; // @[ProbePicker.scala 65:28]
  wire [5:0] picker_auto_out_1_d_bits_source; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_1_d_bits_sink; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_1_d_bits_denied; // @[ProbePicker.scala 65:28]
  wire [63:0] picker_auto_out_1_d_bits_data; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_1_d_bits_corrupt; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_0_a_ready; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_0_a_valid; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_out_0_a_bits_opcode; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_out_0_a_bits_param; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_out_0_a_bits_size; // @[ProbePicker.scala 65:28]
  wire [5:0] picker_auto_out_0_a_bits_source; // @[ProbePicker.scala 65:28]
  wire [31:0] picker_auto_out_0_a_bits_address; // @[ProbePicker.scala 65:28]
  wire [7:0] picker_auto_out_0_a_bits_mask; // @[ProbePicker.scala 65:28]
  wire [63:0] picker_auto_out_0_a_bits_data; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_0_a_bits_corrupt; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_0_d_ready; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_0_d_valid; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_out_0_d_bits_opcode; // @[ProbePicker.scala 65:28]
  wire [1:0] picker_auto_out_0_d_bits_param; // @[ProbePicker.scala 65:28]
  wire [2:0] picker_auto_out_0_d_bits_size; // @[ProbePicker.scala 65:28]
  wire [5:0] picker_auto_out_0_d_bits_source; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_0_d_bits_sink; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_0_d_bits_denied; // @[ProbePicker.scala 65:28]
  wire [63:0] picker_auto_out_0_d_bits_data; // @[ProbePicker.scala 65:28]
  wire  picker_auto_out_0_d_bits_corrupt; // @[ProbePicker.scala 65:28]
  wire  buffer_clock; // @[Buffer.scala 68:28]
  wire  buffer_reset; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [5:0] buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [5:0] buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [5:0] buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [5:0] buffer_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  coupler_to_memory_controller_port_named_tl_mem_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_tl_mem_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_valid; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_id; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_addr; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_len; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_size; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_burst; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_lock; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_cache; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_prot; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_qos; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_valid; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_data; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_strb; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_last; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_valid; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_id; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_resp; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_valid; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_id; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_addr; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_len; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_size; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_burst; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_lock; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_cache; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_prot; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_qos; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_valid; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_id; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_data; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_resp; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_last; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [5:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [5:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [28:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [5:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [28:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [5:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  ClockGroupAggregator_4 subsystem_mbus_clock_groups ( // @[BusWrapper.scala 40:48]
    .auto_in_member_subsystem_mbus_0_clock(subsystem_mbus_clock_groups_auto_in_member_subsystem_mbus_0_clock),
    .auto_in_member_subsystem_mbus_0_reset(subsystem_mbus_clock_groups_auto_in_member_subsystem_mbus_0_reset),
    .auto_out_member_subsystem_mbus_0_clock(subsystem_mbus_clock_groups_auto_out_member_subsystem_mbus_0_clock),
    .auto_out_member_subsystem_mbus_0_reset(subsystem_mbus_clock_groups_auto_out_member_subsystem_mbus_0_reset)
  );
  ClockGroup_4 clockGroup ( // @[BusWrapper.scala 41:38]
    .auto_in_member_subsystem_mbus_0_clock(clockGroup_auto_in_member_subsystem_mbus_0_clock),
    .auto_in_member_subsystem_mbus_0_reset(clockGroup_auto_in_member_subsystem_mbus_0_reset),
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
  TLXbar_6 subsystem_mbus_xbar ( // @[MemoryBus.scala 42:32]
    .clock(subsystem_mbus_xbar_clock),
    .reset(subsystem_mbus_xbar_reset),
    .auto_in_a_ready(subsystem_mbus_xbar_auto_in_a_ready),
    .auto_in_a_valid(subsystem_mbus_xbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(subsystem_mbus_xbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(subsystem_mbus_xbar_auto_in_a_bits_param),
    .auto_in_a_bits_size(subsystem_mbus_xbar_auto_in_a_bits_size),
    .auto_in_a_bits_source(subsystem_mbus_xbar_auto_in_a_bits_source),
    .auto_in_a_bits_address(subsystem_mbus_xbar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(subsystem_mbus_xbar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(subsystem_mbus_xbar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(subsystem_mbus_xbar_auto_in_a_bits_corrupt),
    .auto_in_d_ready(subsystem_mbus_xbar_auto_in_d_ready),
    .auto_in_d_valid(subsystem_mbus_xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode(subsystem_mbus_xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(subsystem_mbus_xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size(subsystem_mbus_xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source(subsystem_mbus_xbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink(subsystem_mbus_xbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(subsystem_mbus_xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(subsystem_mbus_xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(subsystem_mbus_xbar_auto_in_d_bits_corrupt),
    .auto_out_1_a_ready(subsystem_mbus_xbar_auto_out_1_a_ready),
    .auto_out_1_a_valid(subsystem_mbus_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(subsystem_mbus_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(subsystem_mbus_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(subsystem_mbus_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(subsystem_mbus_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(subsystem_mbus_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(subsystem_mbus_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(subsystem_mbus_xbar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(subsystem_mbus_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready(subsystem_mbus_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid(subsystem_mbus_xbar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(subsystem_mbus_xbar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(subsystem_mbus_xbar_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(subsystem_mbus_xbar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(subsystem_mbus_xbar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_sink(subsystem_mbus_xbar_auto_out_1_d_bits_sink),
    .auto_out_1_d_bits_denied(subsystem_mbus_xbar_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(subsystem_mbus_xbar_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(subsystem_mbus_xbar_auto_out_1_d_bits_corrupt),
    .auto_out_0_a_ready(subsystem_mbus_xbar_auto_out_0_a_ready),
    .auto_out_0_a_valid(subsystem_mbus_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(subsystem_mbus_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(subsystem_mbus_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(subsystem_mbus_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(subsystem_mbus_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(subsystem_mbus_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(subsystem_mbus_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(subsystem_mbus_xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(subsystem_mbus_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(subsystem_mbus_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid(subsystem_mbus_xbar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(subsystem_mbus_xbar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(subsystem_mbus_xbar_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(subsystem_mbus_xbar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(subsystem_mbus_xbar_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(subsystem_mbus_xbar_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(subsystem_mbus_xbar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(subsystem_mbus_xbar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(subsystem_mbus_xbar_auto_out_0_d_bits_corrupt)
  );
  TLFIFOFixer_3 fixer ( // @[FIFOFixer.scala 144:27]
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
  ProbePicker picker ( // @[ProbePicker.scala 65:28]
    .clock(picker_clock),
    .reset(picker_reset),
    .auto_in_1_a_ready(picker_auto_in_1_a_ready),
    .auto_in_1_a_valid(picker_auto_in_1_a_valid),
    .auto_in_1_a_bits_opcode(picker_auto_in_1_a_bits_opcode),
    .auto_in_1_a_bits_param(picker_auto_in_1_a_bits_param),
    .auto_in_1_a_bits_size(picker_auto_in_1_a_bits_size),
    .auto_in_1_a_bits_source(picker_auto_in_1_a_bits_source),
    .auto_in_1_a_bits_address(picker_auto_in_1_a_bits_address),
    .auto_in_1_a_bits_mask(picker_auto_in_1_a_bits_mask),
    .auto_in_1_a_bits_data(picker_auto_in_1_a_bits_data),
    .auto_in_1_a_bits_corrupt(picker_auto_in_1_a_bits_corrupt),
    .auto_in_1_d_ready(picker_auto_in_1_d_ready),
    .auto_in_1_d_valid(picker_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode(picker_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_param(picker_auto_in_1_d_bits_param),
    .auto_in_1_d_bits_size(picker_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_source(picker_auto_in_1_d_bits_source),
    .auto_in_1_d_bits_sink(picker_auto_in_1_d_bits_sink),
    .auto_in_1_d_bits_denied(picker_auto_in_1_d_bits_denied),
    .auto_in_1_d_bits_data(picker_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt(picker_auto_in_1_d_bits_corrupt),
    .auto_in_0_a_ready(picker_auto_in_0_a_ready),
    .auto_in_0_a_valid(picker_auto_in_0_a_valid),
    .auto_in_0_a_bits_opcode(picker_auto_in_0_a_bits_opcode),
    .auto_in_0_a_bits_param(picker_auto_in_0_a_bits_param),
    .auto_in_0_a_bits_size(picker_auto_in_0_a_bits_size),
    .auto_in_0_a_bits_source(picker_auto_in_0_a_bits_source),
    .auto_in_0_a_bits_address(picker_auto_in_0_a_bits_address),
    .auto_in_0_a_bits_mask(picker_auto_in_0_a_bits_mask),
    .auto_in_0_a_bits_data(picker_auto_in_0_a_bits_data),
    .auto_in_0_a_bits_corrupt(picker_auto_in_0_a_bits_corrupt),
    .auto_in_0_d_ready(picker_auto_in_0_d_ready),
    .auto_in_0_d_valid(picker_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode(picker_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param(picker_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size(picker_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source(picker_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink(picker_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied(picker_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data(picker_auto_in_0_d_bits_data),
    .auto_in_0_d_bits_corrupt(picker_auto_in_0_d_bits_corrupt),
    .auto_out_1_a_ready(picker_auto_out_1_a_ready),
    .auto_out_1_a_valid(picker_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(picker_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(picker_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(picker_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(picker_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(picker_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(picker_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(picker_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(picker_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready(picker_auto_out_1_d_ready),
    .auto_out_1_d_valid(picker_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(picker_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(picker_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(picker_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(picker_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_sink(picker_auto_out_1_d_bits_sink),
    .auto_out_1_d_bits_denied(picker_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_data(picker_auto_out_1_d_bits_data),
    .auto_out_1_d_bits_corrupt(picker_auto_out_1_d_bits_corrupt),
    .auto_out_0_a_ready(picker_auto_out_0_a_ready),
    .auto_out_0_a_valid(picker_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(picker_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(picker_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(picker_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(picker_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(picker_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(picker_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(picker_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(picker_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(picker_auto_out_0_d_ready),
    .auto_out_0_d_valid(picker_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(picker_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(picker_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(picker_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(picker_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(picker_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(picker_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(picker_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(picker_auto_out_0_d_bits_corrupt)
  );
  TLBuffer_10 buffer ( // @[Buffer.scala 68:28]
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
  TLInterconnectCoupler_15 coupler_to_memory_controller_port_named_tl_mem ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_memory_controller_port_named_tl_mem_clock),
    .reset(coupler_to_memory_controller_port_named_tl_mem_reset)
  );
  TLInterconnectCoupler_16 coupler_to_memory_controller_port_named_axi4 ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_memory_controller_port_named_axi4_clock),
    .reset(coupler_to_memory_controller_port_named_axi4_reset),
    .auto_axi4yank_out_aw_ready(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_ready),
    .auto_axi4yank_out_aw_valid(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_valid),
    .auto_axi4yank_out_aw_bits_id(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_id),
    .auto_axi4yank_out_aw_bits_addr(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_addr),
    .auto_axi4yank_out_aw_bits_len(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_len),
    .auto_axi4yank_out_aw_bits_size(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_size),
    .auto_axi4yank_out_aw_bits_burst(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_burst),
    .auto_axi4yank_out_aw_bits_lock(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_lock),
    .auto_axi4yank_out_aw_bits_cache(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_cache),
    .auto_axi4yank_out_aw_bits_prot(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_prot),
    .auto_axi4yank_out_aw_bits_qos(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_qos),
    .auto_axi4yank_out_w_ready(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_ready),
    .auto_axi4yank_out_w_valid(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_valid),
    .auto_axi4yank_out_w_bits_data(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_data),
    .auto_axi4yank_out_w_bits_strb(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_strb),
    .auto_axi4yank_out_w_bits_last(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_last),
    .auto_axi4yank_out_b_ready(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_ready),
    .auto_axi4yank_out_b_valid(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_valid),
    .auto_axi4yank_out_b_bits_id(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_id),
    .auto_axi4yank_out_b_bits_resp(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_resp),
    .auto_axi4yank_out_ar_ready(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_ready),
    .auto_axi4yank_out_ar_valid(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_valid),
    .auto_axi4yank_out_ar_bits_id(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_id),
    .auto_axi4yank_out_ar_bits_addr(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_addr),
    .auto_axi4yank_out_ar_bits_len(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_len),
    .auto_axi4yank_out_ar_bits_size(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_size),
    .auto_axi4yank_out_ar_bits_burst(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_burst),
    .auto_axi4yank_out_ar_bits_lock(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_lock),
    .auto_axi4yank_out_ar_bits_cache(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_cache),
    .auto_axi4yank_out_ar_bits_prot(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_prot),
    .auto_axi4yank_out_ar_bits_qos(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_qos),
    .auto_axi4yank_out_r_ready(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_ready),
    .auto_axi4yank_out_r_valid(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_valid),
    .auto_axi4yank_out_r_bits_id(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_id),
    .auto_axi4yank_out_r_bits_data(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_data),
    .auto_axi4yank_out_r_bits_resp(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_resp),
    .auto_axi4yank_out_r_bits_last(coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_last),
    .auto_tl_in_a_ready(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_sink(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_sink),
    .auto_tl_in_d_bits_denied(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt(coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_17 coupler_to_port_named_serial_tl_mem ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_port_named_serial_tl_mem_clock),
    .reset(coupler_to_port_named_serial_tl_mem_reset),
    .auto_tlserial_manager_crossing_out_a_ready(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_ready),
    .auto_tlserial_manager_crossing_out_a_valid(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_valid),
    .auto_tlserial_manager_crossing_out_a_bits_opcode(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_opcode),
    .auto_tlserial_manager_crossing_out_a_bits_param(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_param),
    .auto_tlserial_manager_crossing_out_a_bits_size(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_size),
    .auto_tlserial_manager_crossing_out_a_bits_source(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_source),
    .auto_tlserial_manager_crossing_out_a_bits_address(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_address),
    .auto_tlserial_manager_crossing_out_a_bits_mask(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_mask),
    .auto_tlserial_manager_crossing_out_a_bits_data(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_data),
    .auto_tlserial_manager_crossing_out_a_bits_corrupt(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_corrupt),
    .auto_tlserial_manager_crossing_out_d_ready(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_ready),
    .auto_tlserial_manager_crossing_out_d_valid(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_valid),
    .auto_tlserial_manager_crossing_out_d_bits_opcode(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_opcode),
    .auto_tlserial_manager_crossing_out_d_bits_param(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_param),
    .auto_tlserial_manager_crossing_out_d_bits_size(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_size),
    .auto_tlserial_manager_crossing_out_d_bits_source(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_source),
    .auto_tlserial_manager_crossing_out_d_bits_sink(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_sink),
    .auto_tlserial_manager_crossing_out_d_bits_denied(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_denied),
    .auto_tlserial_manager_crossing_out_d_bits_data(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_data),
    .auto_tlserial_manager_crossing_out_d_bits_corrupt(
      coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_corrupt),
    .auto_tl_in_a_ready(coupler_to_port_named_serial_tl_mem_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_port_named_serial_tl_mem_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_port_named_serial_tl_mem_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_port_named_serial_tl_mem_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param(coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size(coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_sink(coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_sink),
    .auto_tl_in_d_bits_denied(coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data(coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt(coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_corrupt)
  );
  assign auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_valid =
    coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_opcode =
    coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_param =
    coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_size =
    coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_source =
    coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_address =
    coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_mask =
    coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_data =
    coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_corrupt =
    coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_ready =
    coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_id; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_addr; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_len; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_burst; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_lock; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_cache; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_prot; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_bits_qos; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_strb; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_bits_last; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_id; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_addr; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_len; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_burst; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_lock; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_cache; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_prot; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_bits_qos; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready =
    coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_ready; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_clock = fixedClockNode_auto_out_1_clock; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_reset = fixedClockNode_auto_out_1_reset; // @[LazyModule.scala 311:12]
  assign auto_bus_xing_in_a_ready = buffer_auto_in_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_valid = buffer_auto_in_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_param = buffer_auto_in_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_size = buffer_auto_in_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_source = buffer_auto_in_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_sink = buffer_auto_in_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_denied = buffer_auto_in_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_data = buffer_auto_in_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_mbus_clock_groups_auto_in_member_subsystem_mbus_0_clock =
    auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_mbus_clock_groups_auto_in_member_subsystem_mbus_0_reset =
    auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset; // @[LazyModule.scala 309:16]
  assign clockGroup_auto_in_member_subsystem_mbus_0_clock =
    subsystem_mbus_clock_groups_auto_out_member_subsystem_mbus_0_clock; // @[LazyModule.scala 298:16]
  assign clockGroup_auto_in_member_subsystem_mbus_0_reset =
    subsystem_mbus_clock_groups_auto_out_member_subsystem_mbus_0_reset; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_clock = clockGroup_auto_out_clock; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_reset = clockGroup_auto_out_reset; // @[LazyModule.scala 298:16]
  assign broadcast_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign broadcast_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_auto_in_a_valid = fixer_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_auto_in_a_bits_opcode = fixer_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_auto_in_a_bits_param = fixer_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_auto_in_a_bits_size = fixer_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_auto_in_a_bits_source = fixer_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_auto_in_a_bits_address = fixer_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_auto_in_a_bits_mask = fixer_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_auto_in_a_bits_data = fixer_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_auto_in_a_bits_corrupt = fixer_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_auto_in_d_ready = fixer_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_xbar_auto_out_1_a_ready = picker_auto_in_1_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_1_d_valid = picker_auto_in_1_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_1_d_bits_opcode = picker_auto_in_1_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_1_d_bits_param = picker_auto_in_1_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_1_d_bits_size = picker_auto_in_1_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_1_d_bits_source = picker_auto_in_1_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_1_d_bits_sink = picker_auto_in_1_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_1_d_bits_denied = picker_auto_in_1_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_1_d_bits_data = picker_auto_in_1_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_1_d_bits_corrupt = picker_auto_in_1_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_0_a_ready = picker_auto_in_0_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_0_d_valid = picker_auto_in_0_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_0_d_bits_opcode = picker_auto_in_0_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_0_d_bits_param = picker_auto_in_0_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_0_d_bits_size = picker_auto_in_0_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_0_d_bits_source = picker_auto_in_0_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_0_d_bits_sink = picker_auto_in_0_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_0_d_bits_denied = picker_auto_in_0_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_0_d_bits_data = picker_auto_in_0_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_xbar_auto_out_0_d_bits_corrupt = picker_auto_in_0_d_bits_corrupt; // @[LazyModule.scala 298:16]
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
  assign fixer_auto_out_a_ready = subsystem_mbus_xbar_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_d_valid = subsystem_mbus_xbar_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_d_bits_opcode = subsystem_mbus_xbar_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_d_bits_param = subsystem_mbus_xbar_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_d_bits_size = subsystem_mbus_xbar_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_d_bits_source = subsystem_mbus_xbar_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_d_bits_sink = subsystem_mbus_xbar_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_d_bits_denied = subsystem_mbus_xbar_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_d_bits_data = subsystem_mbus_xbar_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_d_bits_corrupt = subsystem_mbus_xbar_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign picker_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign picker_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign picker_auto_in_1_a_valid = subsystem_mbus_xbar_auto_out_1_a_valid; // @[LazyModule.scala 298:16]
  assign picker_auto_in_1_a_bits_opcode = subsystem_mbus_xbar_auto_out_1_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign picker_auto_in_1_a_bits_param = subsystem_mbus_xbar_auto_out_1_a_bits_param; // @[LazyModule.scala 298:16]
  assign picker_auto_in_1_a_bits_size = subsystem_mbus_xbar_auto_out_1_a_bits_size; // @[LazyModule.scala 298:16]
  assign picker_auto_in_1_a_bits_source = subsystem_mbus_xbar_auto_out_1_a_bits_source; // @[LazyModule.scala 298:16]
  assign picker_auto_in_1_a_bits_address = subsystem_mbus_xbar_auto_out_1_a_bits_address; // @[LazyModule.scala 298:16]
  assign picker_auto_in_1_a_bits_mask = subsystem_mbus_xbar_auto_out_1_a_bits_mask; // @[LazyModule.scala 298:16]
  assign picker_auto_in_1_a_bits_data = subsystem_mbus_xbar_auto_out_1_a_bits_data; // @[LazyModule.scala 298:16]
  assign picker_auto_in_1_a_bits_corrupt = subsystem_mbus_xbar_auto_out_1_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign picker_auto_in_1_d_ready = subsystem_mbus_xbar_auto_out_1_d_ready; // @[LazyModule.scala 298:16]
  assign picker_auto_in_0_a_valid = subsystem_mbus_xbar_auto_out_0_a_valid; // @[LazyModule.scala 298:16]
  assign picker_auto_in_0_a_bits_opcode = subsystem_mbus_xbar_auto_out_0_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign picker_auto_in_0_a_bits_param = subsystem_mbus_xbar_auto_out_0_a_bits_param; // @[LazyModule.scala 298:16]
  assign picker_auto_in_0_a_bits_size = subsystem_mbus_xbar_auto_out_0_a_bits_size; // @[LazyModule.scala 298:16]
  assign picker_auto_in_0_a_bits_source = subsystem_mbus_xbar_auto_out_0_a_bits_source; // @[LazyModule.scala 298:16]
  assign picker_auto_in_0_a_bits_address = subsystem_mbus_xbar_auto_out_0_a_bits_address; // @[LazyModule.scala 298:16]
  assign picker_auto_in_0_a_bits_mask = subsystem_mbus_xbar_auto_out_0_a_bits_mask; // @[LazyModule.scala 298:16]
  assign picker_auto_in_0_a_bits_data = subsystem_mbus_xbar_auto_out_0_a_bits_data; // @[LazyModule.scala 298:16]
  assign picker_auto_in_0_a_bits_corrupt = subsystem_mbus_xbar_auto_out_0_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign picker_auto_in_0_d_ready = subsystem_mbus_xbar_auto_out_0_d_ready; // @[LazyModule.scala 298:16]
  assign picker_auto_out_1_a_ready = coupler_to_port_named_serial_tl_mem_auto_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign picker_auto_out_1_d_valid = coupler_to_port_named_serial_tl_mem_auto_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign picker_auto_out_1_d_bits_opcode = coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign picker_auto_out_1_d_bits_param = coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign picker_auto_out_1_d_bits_size = coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign picker_auto_out_1_d_bits_source = coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign picker_auto_out_1_d_bits_sink = coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign picker_auto_out_1_d_bits_denied = coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign picker_auto_out_1_d_bits_data = coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign picker_auto_out_1_d_bits_corrupt = coupler_to_port_named_serial_tl_mem_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign picker_auto_out_0_a_ready = coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign picker_auto_out_0_d_valid = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign picker_auto_out_0_d_bits_opcode = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign picker_auto_out_0_d_bits_param = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign picker_auto_out_0_d_bits_size = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign picker_auto_out_0_d_bits_source = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign picker_auto_out_0_d_bits_sink = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign picker_auto_out_0_d_bits_denied = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign picker_auto_out_0_d_bits_data = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign picker_auto_out_0_d_bits_corrupt = coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_auto_in_a_valid = auto_bus_xing_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_opcode = auto_bus_xing_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_param = auto_bus_xing_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_size = auto_bus_xing_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_source = auto_bus_xing_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_address = auto_bus_xing_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_mask = auto_bus_xing_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_data = auto_bus_xing_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_corrupt = auto_bus_xing_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_d_ready = auto_bus_xing_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
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
  assign coupler_to_memory_controller_port_named_tl_mem_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_memory_controller_port_named_tl_mem_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_memory_controller_port_named_axi4_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_memory_controller_port_named_axi4_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_aw_ready =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_w_ready =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_valid =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_id =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id; // @[LazyModule.scala 311:12]
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_b_bits_resp =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp; // @[LazyModule.scala 311:12]
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_ar_ready =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_valid =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_id =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id; // @[LazyModule.scala 311:12]
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_data =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_resp =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp; // @[LazyModule.scala 311:12]
  assign coupler_to_memory_controller_port_named_axi4_auto_axi4yank_out_r_bits_last =
    auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last; // @[LazyModule.scala 311:12]
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_valid = picker_auto_out_0_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_opcode = picker_auto_out_0_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_param = picker_auto_out_0_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_size = picker_auto_out_0_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_source = picker_auto_out_0_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_address = picker_auto_out_0_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_mask = picker_auto_out_0_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_data = picker_auto_out_0_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_a_bits_corrupt = picker_auto_out_0_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_memory_controller_port_named_axi4_auto_tl_in_d_ready = picker_auto_out_0_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_port_named_serial_tl_mem_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_port_named_serial_tl_mem_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_a_ready =
    auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_valid =
    auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_opcode =
    auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_param =
    auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_size =
    auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_source =
    auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_sink =
    auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_denied =
    auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_data =
    auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_port_named_serial_tl_mem_auto_tlserial_manager_crossing_out_d_bits_corrupt =
    auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign coupler_to_port_named_serial_tl_mem_auto_tl_in_a_valid = picker_auto_out_1_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_opcode = picker_auto_out_1_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_param = picker_auto_out_1_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_size = picker_auto_out_1_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_source = picker_auto_out_1_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_address = picker_auto_out_1_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_mask = picker_auto_out_1_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_data = picker_auto_out_1_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_port_named_serial_tl_mem_auto_tl_in_a_bits_corrupt = picker_auto_out_1_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_port_named_serial_tl_mem_auto_tl_in_d_ready = picker_auto_out_1_d_ready; // @[LazyModule.scala 298:16]
endmodule
