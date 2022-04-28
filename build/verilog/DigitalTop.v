module DigitalTop(
  input         clock,
  input         reset,
  input         auto_domain_resetCtrl_async_reset_sink_in_clock,
  input         auto_domain_resetCtrl_async_reset_sink_in_reset,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock,
  input         auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock,
  output        auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset,
  output        auto_subsystem_mbus_fixedClockNode_out_clock,
  output        auto_subsystem_mbus_fixedClockNode_out_reset,
  input         auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock,
  input         auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset,
  output        auto_subsystem_cbus_fixedClockNode_out_clock,
  output        auto_subsystem_cbus_fixedClockNode_out_reset,
  input         auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock,
  input         auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset,
  input         auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock,
  input         auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset,
  input         auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock,
  input         auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset,
  input         auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock,
  input         auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset,
  input         auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock,
  input         auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset,
  input         mem_axi4_0_aw_ready,
  output        mem_axi4_0_aw_valid,
  output [3:0]  mem_axi4_0_aw_bits_id,
  output [31:0] mem_axi4_0_aw_bits_addr,
  output [7:0]  mem_axi4_0_aw_bits_len,
  output [2:0]  mem_axi4_0_aw_bits_size,
  output [1:0]  mem_axi4_0_aw_bits_burst,
  output        mem_axi4_0_aw_bits_lock,
  output [3:0]  mem_axi4_0_aw_bits_cache,
  output [2:0]  mem_axi4_0_aw_bits_prot,
  output [3:0]  mem_axi4_0_aw_bits_qos,
  input         mem_axi4_0_w_ready,
  output        mem_axi4_0_w_valid,
  output [63:0] mem_axi4_0_w_bits_data,
  output [7:0]  mem_axi4_0_w_bits_strb,
  output        mem_axi4_0_w_bits_last,
  output        mem_axi4_0_b_ready,
  input         mem_axi4_0_b_valid,
  input  [3:0]  mem_axi4_0_b_bits_id,
  input  [1:0]  mem_axi4_0_b_bits_resp,
  input         mem_axi4_0_ar_ready,
  output        mem_axi4_0_ar_valid,
  output [3:0]  mem_axi4_0_ar_bits_id,
  output [31:0] mem_axi4_0_ar_bits_addr,
  output [7:0]  mem_axi4_0_ar_bits_len,
  output [2:0]  mem_axi4_0_ar_bits_size,
  output [1:0]  mem_axi4_0_ar_bits_burst,
  output        mem_axi4_0_ar_bits_lock,
  output [3:0]  mem_axi4_0_ar_bits_cache,
  output [2:0]  mem_axi4_0_ar_bits_prot,
  output [3:0]  mem_axi4_0_ar_bits_qos,
  output        mem_axi4_0_r_ready,
  input         mem_axi4_0_r_valid,
  input  [3:0]  mem_axi4_0_r_bits_id,
  input  [63:0] mem_axi4_0_r_bits_data,
  input  [1:0]  mem_axi4_0_r_bits_resp,
  input         mem_axi4_0_r_bits_last,
  input         custom_boot,
  output        serial_tl_clock,
  output        serial_tl_bits_in_ready,
  input         serial_tl_bits_in_valid,
  input  [3:0]  serial_tl_bits_in_bits,
  input         serial_tl_bits_out_ready,
  output        serial_tl_bits_out_valid,
  output [3:0]  serial_tl_bits_out_bits,
  input         resetctrl_hartIsInReset_0,
  input         debug_clock,
  input         debug_reset,
  input         debug_systemjtag_jtag_TCK,
  input         debug_systemjtag_jtag_TMS,
  input         debug_systemjtag_jtag_TDI,
  output        debug_systemjtag_jtag_TDO_data,
  output        debug_systemjtag_jtag_TDO_driven,
  input         debug_systemjtag_reset,
  input  [10:0] debug_systemjtag_mfr_id,
  input  [15:0] debug_systemjtag_part_number,
  input  [3:0]  debug_systemjtag_version,
  output        debug_ndreset,
  output        debug_dmactive,
  input         debug_dmactiveAck,
  output        uart_0_txd,
  input         uart_0_rxd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  ibus_auto_int_bus_int_in_0; // @[BaseSubsystem.scala 50:24]
  wire  ibus_auto_int_bus_int_out_0; // @[BaseSubsystem.scala 50:24]
  wire  ibus_auto_clock_in_clock; // @[BaseSubsystem.scala 50:24]
  wire  ibus_auto_clock_in_reset; // @[BaseSubsystem.scala 50:24]
  wire  ibus_clock; // @[BaseSubsystem.scala 50:24]
  wire  ibus_reset; // @[BaseSubsystem.scala 50:24]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_size; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_address; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_mask; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_opcode; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_size; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_mask; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_size; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_address; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_valid; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_opcode; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_size; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_mask; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source; // @[SystemBus.scala 24:26]
  wire [30:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_fixedClockNode_out_1_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_fixedClockNode_out_1_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_fixedClockNode_out_0_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_fixedClockNode_out_0_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [20:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_sink; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_denied; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [30:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_sink; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_denied; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_fixedClockNode_out_1_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_fixedClockNode_out_1_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_fixedClockNode_out_0_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_fixedClockNode_out_0_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_bus_xing_in_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_bus_xing_in_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_pbus_auto_bus_xing_in_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_pbus_auto_bus_xing_in_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_pbus_auto_bus_xing_in_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [4:0] subsystem_pbus_auto_bus_xing_in_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [30:0] subsystem_pbus_auto_bus_xing_in_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_pbus_auto_bus_xing_in_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_pbus_auto_bus_xing_in_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_bus_xing_in_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_bus_xing_in_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_bus_xing_in_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_pbus_auto_bus_xing_in_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_pbus_auto_bus_xing_in_d_bits_param; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_pbus_auto_bus_xing_in_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [4:0] subsystem_pbus_auto_bus_xing_in_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_bus_xing_in_d_bits_sink; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_bus_xing_in_d_bits_denied; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_pbus_auto_bus_xing_in_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_bus_xing_in_d_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_ready; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_valid; // @[FrontBus.scala 22:26]
  wire [2:0] subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_opcode; // @[FrontBus.scala 22:26]
  wire [2:0] subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_param; // @[FrontBus.scala 22:26]
  wire [3:0] subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_size; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_source; // @[FrontBus.scala 22:26]
  wire [31:0] subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_address; // @[FrontBus.scala 22:26]
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_mask; // @[FrontBus.scala 22:26]
  wire [63:0] subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_data; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_corrupt; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_ready; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_valid; // @[FrontBus.scala 22:26]
  wire [2:0] subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_opcode; // @[FrontBus.scala 22:26]
  wire [1:0] subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_param; // @[FrontBus.scala 22:26]
  wire [3:0] subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_size; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_source; // @[FrontBus.scala 22:26]
  wire [1:0] subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_sink; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_denied; // @[FrontBus.scala 22:26]
  wire [63:0] subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_data; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_corrupt; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_fixedClockNode_out_clock; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_fixedClockNode_out_reset; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_bus_xing_out_a_ready; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_bus_xing_out_a_valid; // @[FrontBus.scala 22:26]
  wire [2:0] subsystem_fbus_auto_bus_xing_out_a_bits_opcode; // @[FrontBus.scala 22:26]
  wire [2:0] subsystem_fbus_auto_bus_xing_out_a_bits_param; // @[FrontBus.scala 22:26]
  wire [3:0] subsystem_fbus_auto_bus_xing_out_a_bits_size; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_source; // @[FrontBus.scala 22:26]
  wire [31:0] subsystem_fbus_auto_bus_xing_out_a_bits_address; // @[FrontBus.scala 22:26]
  wire [7:0] subsystem_fbus_auto_bus_xing_out_a_bits_mask; // @[FrontBus.scala 22:26]
  wire [63:0] subsystem_fbus_auto_bus_xing_out_a_bits_data; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_corrupt; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_bus_xing_out_d_ready; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_bus_xing_out_d_valid; // @[FrontBus.scala 22:26]
  wire [2:0] subsystem_fbus_auto_bus_xing_out_d_bits_opcode; // @[FrontBus.scala 22:26]
  wire [1:0] subsystem_fbus_auto_bus_xing_out_d_bits_param; // @[FrontBus.scala 22:26]
  wire [3:0] subsystem_fbus_auto_bus_xing_out_d_bits_size; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_bus_xing_out_d_bits_source; // @[FrontBus.scala 22:26]
  wire [1:0] subsystem_fbus_auto_bus_xing_out_d_bits_sink; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_bus_xing_out_d_bits_denied; // @[FrontBus.scala 22:26]
  wire [63:0] subsystem_fbus_auto_bus_xing_out_d_bits_data; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_auto_bus_xing_out_d_bits_corrupt; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_clock; // @[FrontBus.scala 22:26]
  wire  subsystem_fbus_reset; // @[FrontBus.scala 22:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [16:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_sink; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_denied; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [11:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_sink; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_denied; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [25:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_sink; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_denied; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [27:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_sink; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_denied; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [4:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [30:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [4:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_3_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_3_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_2_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_2_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_1_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_1_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_0_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_0_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_bus_xing_in_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_bus_xing_in_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [3:0] subsystem_cbus_auto_bus_xing_in_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [3:0] subsystem_cbus_auto_bus_xing_in_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [30:0] subsystem_cbus_auto_bus_xing_in_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_cbus_auto_bus_xing_in_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_bus_xing_in_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_bus_xing_in_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_bus_xing_in_d_bits_param; // @[PeripheryBus.scala 31:26]
  wire [3:0] subsystem_cbus_auto_bus_xing_in_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [3:0] subsystem_cbus_auto_bus_xing_in_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_d_bits_sink; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_d_bits_denied; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_bus_xing_in_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_d_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_custom_boot; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_valid; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_opcode; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_param; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_size; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_source; // @[MemoryBus.scala 25:26]
  wire [28:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_address; // @[MemoryBus.scala 25:26]
  wire [7:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_mask; // @[MemoryBus.scala 25:26]
  wire [63:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_data; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_corrupt; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_valid; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_opcode; // @[MemoryBus.scala 25:26]
  wire [1:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_param; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_size; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_source; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_sink; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_denied; // @[MemoryBus.scala 25:26]
  wire [63:0] subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_data; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_corrupt; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id; // @[MemoryBus.scala 25:26]
  wire [31:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr; // @[MemoryBus.scala 25:26]
  wire [7:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size; // @[MemoryBus.scala 25:26]
  wire [1:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid; // @[MemoryBus.scala 25:26]
  wire [63:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data; // @[MemoryBus.scala 25:26]
  wire [7:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id; // @[MemoryBus.scala 25:26]
  wire [1:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id; // @[MemoryBus.scala 25:26]
  wire [31:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr; // @[MemoryBus.scala 25:26]
  wire [7:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size; // @[MemoryBus.scala 25:26]
  wire [1:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id; // @[MemoryBus.scala 25:26]
  wire [63:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data; // @[MemoryBus.scala 25:26]
  wire [1:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_fixedClockNode_out_clock; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_fixedClockNode_out_reset; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_valid; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_bus_xing_in_a_bits_opcode; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_bus_xing_in_a_bits_param; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_bus_xing_in_a_bits_size; // @[MemoryBus.scala 25:26]
  wire [5:0] subsystem_mbus_auto_bus_xing_in_a_bits_source; // @[MemoryBus.scala 25:26]
  wire [31:0] subsystem_mbus_auto_bus_xing_in_a_bits_address; // @[MemoryBus.scala 25:26]
  wire [7:0] subsystem_mbus_auto_bus_xing_in_a_bits_mask; // @[MemoryBus.scala 25:26]
  wire [63:0] subsystem_mbus_auto_bus_xing_in_a_bits_data; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_bits_corrupt; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_d_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_d_valid; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_bus_xing_in_d_bits_opcode; // @[MemoryBus.scala 25:26]
  wire [1:0] subsystem_mbus_auto_bus_xing_in_d_bits_param; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_bus_xing_in_d_bits_size; // @[MemoryBus.scala 25:26]
  wire [5:0] subsystem_mbus_auto_bus_xing_in_d_bits_source; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_d_bits_sink; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_d_bits_denied; // @[MemoryBus.scala 25:26]
  wire [63:0] subsystem_mbus_auto_bus_xing_in_d_bits_data; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_d_bits_corrupt; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_clock; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_reset; // @[MemoryBus.scala 25:26]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size; // @[BankedL2Params.scala 47:31]
  wire [5:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source; // @[BankedL2Params.scala 47:31]
  wire [31:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address; // @[BankedL2Params.scala 47:31]
  wire [7:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask; // @[BankedL2Params.scala 47:31]
  wire [63:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode; // @[BankedL2Params.scala 47:31]
  wire [1:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_param; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size; // @[BankedL2Params.scala 47:31]
  wire [5:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_sink; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied; // @[BankedL2Params.scala 47:31]
  wire [63:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_valid; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_opcode; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_param; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_size; // @[BankedL2Params.scala 47:31]
  wire [3:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_source; // @[BankedL2Params.scala 47:31]
  wire [31:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_address; // @[BankedL2Params.scala 47:31]
  wire [7:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_mask; // @[BankedL2Params.scala 47:31]
  wire [63:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_data; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_corrupt; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_b_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_b_valid; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_opcode; // @[BankedL2Params.scala 47:31]
  wire [1:0] subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_param; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_size; // @[BankedL2Params.scala 47:31]
  wire [3:0] subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_source; // @[BankedL2Params.scala 47:31]
  wire [31:0] subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_address; // @[BankedL2Params.scala 47:31]
  wire [7:0] subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_mask; // @[BankedL2Params.scala 47:31]
  wire [63:0] subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_data; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_corrupt; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_c_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_c_valid; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_opcode; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_param; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_size; // @[BankedL2Params.scala 47:31]
  wire [3:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_source; // @[BankedL2Params.scala 47:31]
  wire [31:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_address; // @[BankedL2Params.scala 47:31]
  wire [63:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_data; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_corrupt; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_d_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_d_valid; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_opcode; // @[BankedL2Params.scala 47:31]
  wire [1:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_param; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_size; // @[BankedL2Params.scala 47:31]
  wire [3:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_source; // @[BankedL2Params.scala 47:31]
  wire [1:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_sink; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_denied; // @[BankedL2Params.scala 47:31]
  wire [63:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_data; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_corrupt; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_e_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_e_valid; // @[BankedL2Params.scala 47:31]
  wire [1:0] subsystem_l2_wrapper_auto_coherent_jbar_in_e_bits_sink; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_clock; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_reset; // @[BankedL2Params.scala 47:31]
  wire  tile_prci_domain_auto_intsink_in_sync_0; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_valid; // @[HasTiles.scala 252:38]
  wire [39:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_iaddr; // @[HasTiles.scala 252:38]
  wire [31:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_insn; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_priv; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_exception; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_interrupt; // @[HasTiles.scala 252:38]
  wire [63:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_cause; // @[HasTiles.scala 252:38]
  wire [39:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_tval; // @[HasTiles.scala 252:38]
  wire [63:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_wdata; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_valid; // @[HasTiles.scala 252:38]
  wire [39:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_iaddr; // @[HasTiles.scala 252:38]
  wire [31:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_insn; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_priv; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_exception; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_interrupt; // @[HasTiles.scala 252:38]
  wire [63:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_cause; // @[HasTiles.scala 252:38]
  wire [39:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_tval; // @[HasTiles.scala 252:38]
  wire [63:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_wdata; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_rnmi; // @[HasTiles.scala 252:38]
  wire [31:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_rnmi_interrupt_vector; // @[HasTiles.scala 252:38]
  wire [31:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_rnmi_exception_vector; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_unmi; // @[HasTiles.scala 252:38]
  wire [31:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_unmi_interrupt_vector; // @[HasTiles.scala 252:38]
  wire [31:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_unmi_exception_vector; // @[HasTiles.scala 252:38]
  wire [31:0] tile_prci_domain_auto_tile_reset_domain_boom_tile_reset_vector_in; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tile_reset_domain_boom_tile_hartid_in; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_int_out_clock_xing_out_2_sync_0; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_int_out_clock_xing_out_1_sync_0; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_int_out_clock_xing_out_0_sync_0; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_int_in_clock_xing_in_2_sync_0; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_int_in_clock_xing_in_1_sync_0; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_int_in_clock_xing_in_0_sync_0; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_int_in_clock_xing_in_0_sync_1; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_a_ready; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_a_valid; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param; // @[HasTiles.scala 252:38]
  wire [3:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source; // @[HasTiles.scala 252:38]
  wire [31:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address; // @[HasTiles.scala 252:38]
  wire [7:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask; // @[HasTiles.scala 252:38]
  wire [63:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_b_ready; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_b_valid; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_opcode; // @[HasTiles.scala 252:38]
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_param; // @[HasTiles.scala 252:38]
  wire [3:0] tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_size; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_source; // @[HasTiles.scala 252:38]
  wire [31:0] tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_address; // @[HasTiles.scala 252:38]
  wire [7:0] tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_mask; // @[HasTiles.scala 252:38]
  wire [63:0] tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_data; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_corrupt; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_c_ready; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_c_valid; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param; // @[HasTiles.scala 252:38]
  wire [3:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source; // @[HasTiles.scala 252:38]
  wire [31:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address; // @[HasTiles.scala 252:38]
  wire [63:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_ready; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_valid; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_opcode; // @[HasTiles.scala 252:38]
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_param; // @[HasTiles.scala 252:38]
  wire [3:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_size; // @[HasTiles.scala 252:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_source; // @[HasTiles.scala 252:38]
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_sink; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_denied; // @[HasTiles.scala 252:38]
  wire [63:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_data; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_corrupt; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_e_ready; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_e_valid; // @[HasTiles.scala 252:38]
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tap_clock_in_clock; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_auto_tap_clock_in_reset; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_clock; // @[HasTiles.scala 252:38]
  wire  tile_prci_domain_reset; // @[HasTiles.scala 252:38]
  wire  plicDomainWrapper_auto_plic_int_in_0; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_plic_int_out_1_0; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_plic_int_out_0_0; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_plic_in_a_ready; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_plic_in_a_valid; // @[Plic.scala 359:39]
  wire [2:0] plicDomainWrapper_auto_plic_in_a_bits_opcode; // @[Plic.scala 359:39]
  wire [2:0] plicDomainWrapper_auto_plic_in_a_bits_param; // @[Plic.scala 359:39]
  wire [1:0] plicDomainWrapper_auto_plic_in_a_bits_size; // @[Plic.scala 359:39]
  wire [8:0] plicDomainWrapper_auto_plic_in_a_bits_source; // @[Plic.scala 359:39]
  wire [27:0] plicDomainWrapper_auto_plic_in_a_bits_address; // @[Plic.scala 359:39]
  wire [7:0] plicDomainWrapper_auto_plic_in_a_bits_mask; // @[Plic.scala 359:39]
  wire [63:0] plicDomainWrapper_auto_plic_in_a_bits_data; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_plic_in_a_bits_corrupt; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_plic_in_d_ready; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_plic_in_d_valid; // @[Plic.scala 359:39]
  wire [2:0] plicDomainWrapper_auto_plic_in_d_bits_opcode; // @[Plic.scala 359:39]
  wire [1:0] plicDomainWrapper_auto_plic_in_d_bits_param; // @[Plic.scala 359:39]
  wire [1:0] plicDomainWrapper_auto_plic_in_d_bits_size; // @[Plic.scala 359:39]
  wire [8:0] plicDomainWrapper_auto_plic_in_d_bits_source; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_plic_in_d_bits_sink; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_plic_in_d_bits_denied; // @[Plic.scala 359:39]
  wire [63:0] plicDomainWrapper_auto_plic_in_d_bits_data; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_plic_in_d_bits_corrupt; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_clock_in_clock; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_auto_clock_in_reset; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_clock; // @[Plic.scala 359:39]
  wire  plicDomainWrapper_reset; // @[Plic.scala 359:39]
  wire  clint_clock; // @[CLINT.scala 109:27]
  wire  clint_reset; // @[CLINT.scala 109:27]
  wire  clint_auto_int_out_0; // @[CLINT.scala 109:27]
  wire  clint_auto_int_out_1; // @[CLINT.scala 109:27]
  wire  clint_auto_in_a_ready; // @[CLINT.scala 109:27]
  wire  clint_auto_in_a_valid; // @[CLINT.scala 109:27]
  wire [2:0] clint_auto_in_a_bits_opcode; // @[CLINT.scala 109:27]
  wire [2:0] clint_auto_in_a_bits_param; // @[CLINT.scala 109:27]
  wire [1:0] clint_auto_in_a_bits_size; // @[CLINT.scala 109:27]
  wire [8:0] clint_auto_in_a_bits_source; // @[CLINT.scala 109:27]
  wire [25:0] clint_auto_in_a_bits_address; // @[CLINT.scala 109:27]
  wire [7:0] clint_auto_in_a_bits_mask; // @[CLINT.scala 109:27]
  wire [63:0] clint_auto_in_a_bits_data; // @[CLINT.scala 109:27]
  wire  clint_auto_in_a_bits_corrupt; // @[CLINT.scala 109:27]
  wire  clint_auto_in_d_ready; // @[CLINT.scala 109:27]
  wire  clint_auto_in_d_valid; // @[CLINT.scala 109:27]
  wire [2:0] clint_auto_in_d_bits_opcode; // @[CLINT.scala 109:27]
  wire [1:0] clint_auto_in_d_bits_param; // @[CLINT.scala 109:27]
  wire [1:0] clint_auto_in_d_bits_size; // @[CLINT.scala 109:27]
  wire [8:0] clint_auto_in_d_bits_source; // @[CLINT.scala 109:27]
  wire  clint_auto_in_d_bits_sink; // @[CLINT.scala 109:27]
  wire  clint_auto_in_d_bits_denied; // @[CLINT.scala 109:27]
  wire [63:0] clint_auto_in_d_bits_data; // @[CLINT.scala 109:27]
  wire  clint_auto_in_d_bits_corrupt; // @[CLINT.scala 109:27]
  wire  clint_io_rtcTick; // @[CLINT.scala 109:27]
  wire  debugCustomXbarOpt_clock; // @[Periphery.scala 76:70]
  wire  debugCustomXbarOpt_reset; // @[Periphery.scala 76:70]
  wire  debugCustomXbarOpt_auto_out_addr; // @[Periphery.scala 76:70]
  wire  debugCustomXbarOpt_auto_out_ready; // @[Periphery.scala 76:70]
  wire  debugCustomXbarOpt_auto_out_valid; // @[Periphery.scala 76:70]
  wire  debug_1_auto_dmInner_dmInner_custom_in_addr; // @[Periphery.scala 84:27]
  wire  debug_1_auto_dmInner_dmInner_custom_in_ready; // @[Periphery.scala 84:27]
  wire  debug_1_auto_dmInner_dmInner_custom_in_valid; // @[Periphery.scala 84:27]
  wire  debug_1_auto_dmInner_dmInner_tl_in_a_ready; // @[Periphery.scala 84:27]
  wire  debug_1_auto_dmInner_dmInner_tl_in_a_valid; // @[Periphery.scala 84:27]
  wire [2:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_opcode; // @[Periphery.scala 84:27]
  wire [2:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_param; // @[Periphery.scala 84:27]
  wire [1:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_size; // @[Periphery.scala 84:27]
  wire [8:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_source; // @[Periphery.scala 84:27]
  wire [11:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_address; // @[Periphery.scala 84:27]
  wire [7:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_mask; // @[Periphery.scala 84:27]
  wire [63:0] debug_1_auto_dmInner_dmInner_tl_in_a_bits_data; // @[Periphery.scala 84:27]
  wire  debug_1_auto_dmInner_dmInner_tl_in_a_bits_corrupt; // @[Periphery.scala 84:27]
  wire  debug_1_auto_dmInner_dmInner_tl_in_d_ready; // @[Periphery.scala 84:27]
  wire  debug_1_auto_dmInner_dmInner_tl_in_d_valid; // @[Periphery.scala 84:27]
  wire [2:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_opcode; // @[Periphery.scala 84:27]
  wire [1:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_param; // @[Periphery.scala 84:27]
  wire [1:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_size; // @[Periphery.scala 84:27]
  wire [8:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_source; // @[Periphery.scala 84:27]
  wire  debug_1_auto_dmInner_dmInner_tl_in_d_bits_sink; // @[Periphery.scala 84:27]
  wire  debug_1_auto_dmInner_dmInner_tl_in_d_bits_denied; // @[Periphery.scala 84:27]
  wire [63:0] debug_1_auto_dmInner_dmInner_tl_in_d_bits_data; // @[Periphery.scala 84:27]
  wire  debug_1_auto_dmInner_dmInner_tl_in_d_bits_corrupt; // @[Periphery.scala 84:27]
  wire  debug_1_auto_dmOuter_intsource_out_sync_0; // @[Periphery.scala 84:27]
  wire  debug_1_io_debug_clock; // @[Periphery.scala 84:27]
  wire  debug_1_io_debug_reset; // @[Periphery.scala 84:27]
  wire  debug_1_io_tl_clock; // @[Periphery.scala 84:27]
  wire  debug_1_io_tl_reset; // @[Periphery.scala 84:27]
  wire  debug_1_io_ctrl_debugUnavail_0; // @[Periphery.scala 84:27]
  wire  debug_1_io_ctrl_ndreset; // @[Periphery.scala 84:27]
  wire  debug_1_io_ctrl_dmactive; // @[Periphery.scala 84:27]
  wire  debug_1_io_ctrl_dmactiveAck; // @[Periphery.scala 84:27]
  wire  debug_1_io_dmi_dmi_req_ready; // @[Periphery.scala 84:27]
  wire  debug_1_io_dmi_dmi_req_valid; // @[Periphery.scala 84:27]
  wire [6:0] debug_1_io_dmi_dmi_req_bits_addr; // @[Periphery.scala 84:27]
  wire [31:0] debug_1_io_dmi_dmi_req_bits_data; // @[Periphery.scala 84:27]
  wire [1:0] debug_1_io_dmi_dmi_req_bits_op; // @[Periphery.scala 84:27]
  wire  debug_1_io_dmi_dmi_resp_ready; // @[Periphery.scala 84:27]
  wire  debug_1_io_dmi_dmi_resp_valid; // @[Periphery.scala 84:27]
  wire [31:0] debug_1_io_dmi_dmi_resp_bits_data; // @[Periphery.scala 84:27]
  wire [1:0] debug_1_io_dmi_dmi_resp_bits_resp; // @[Periphery.scala 84:27]
  wire  debug_1_io_dmi_dmiClock; // @[Periphery.scala 84:27]
  wire  debug_1_io_dmi_dmiReset; // @[Periphery.scala 84:27]
  wire  debug_1_io_hartIsInReset_0; // @[Periphery.scala 84:27]
  wire  xbar_clock; // @[Xbar.scala 30:26]
  wire  xbar_reset; // @[Xbar.scala 30:26]
  wire  xbar_auto_int_in_0; // @[Xbar.scala 30:26]
  wire  xbar_auto_int_out_0; // @[Xbar.scala 30:26]
  wire  xbar_1_clock; // @[Xbar.scala 30:26]
  wire  xbar_1_reset; // @[Xbar.scala 30:26]
  wire  xbar_1_auto_int_in_0; // @[Xbar.scala 30:26]
  wire  xbar_1_auto_int_out_0; // @[Xbar.scala 30:26]
  wire  xbar_2_clock; // @[Xbar.scala 30:26]
  wire  xbar_2_reset; // @[Xbar.scala 30:26]
  wire  xbar_2_auto_int_in_0; // @[Xbar.scala 30:26]
  wire  xbar_2_auto_int_out_0; // @[Xbar.scala 30:26]
  wire  tileHartIdNexusNode_clock; // @[HasTiles.scala 159:39]
  wire  tileHartIdNexusNode_reset; // @[HasTiles.scala 159:39]
  wire  tileHartIdNexusNode_auto_out; // @[HasTiles.scala 159:39]
  wire  broadcast_clock; // @[BundleBridge.scala 196:31]
  wire  broadcast_reset; // @[BundleBridge.scala 196:31]
  wire [31:0] broadcast_auto_in; // @[BundleBridge.scala 196:31]
  wire [31:0] broadcast_auto_out; // @[BundleBridge.scala 196:31]
  wire  intsource_clock; // @[Crossing.scala 26:31]
  wire  intsource_reset; // @[Crossing.scala 26:31]
  wire  intsource_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_auto_in_1; // @[Crossing.scala 26:31]
  wire  intsource_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  intsource_auto_out_sync_1; // @[Crossing.scala 26:31]
  wire  intsource_1_clock; // @[Crossing.scala 26:31]
  wire  intsource_1_reset; // @[Crossing.scala 26:31]
  wire  intsource_1_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_1_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  intsource_2_clock; // @[Crossing.scala 26:31]
  wire  intsource_2_reset; // @[Crossing.scala 26:31]
  wire  intsource_2_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_2_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  intsink_clock; // @[Crossing.scala 94:29]
  wire  intsink_reset; // @[Crossing.scala 94:29]
  wire  intsink_1_clock; // @[Crossing.scala 94:29]
  wire  intsink_1_reset; // @[Crossing.scala 94:29]
  wire  intsink_1_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_1_auto_out_0; // @[Crossing.scala 94:29]
  wire  intsink_2_clock; // @[Crossing.scala 94:29]
  wire  intsink_2_reset; // @[Crossing.scala 94:29]
  wire  intsink_2_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_2_auto_out_0; // @[Crossing.scala 94:29]
  wire  intsink_3_clock; // @[Crossing.scala 94:29]
  wire  intsink_3_reset; // @[Crossing.scala 94:29]
  wire  intsink_3_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_3_auto_out_0; // @[Crossing.scala 94:29]
  wire  bootROMDomainWrapper_auto_bootrom_in_a_ready; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_bootrom_in_a_valid; // @[BootROM.scala 70:42]
  wire [2:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_opcode; // @[BootROM.scala 70:42]
  wire [2:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_param; // @[BootROM.scala 70:42]
  wire [1:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_size; // @[BootROM.scala 70:42]
  wire [8:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_source; // @[BootROM.scala 70:42]
  wire [16:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_address; // @[BootROM.scala 70:42]
  wire [7:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_mask; // @[BootROM.scala 70:42]
  wire [63:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_data; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_bootrom_in_a_bits_corrupt; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_bootrom_in_d_ready; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_bootrom_in_d_valid; // @[BootROM.scala 70:42]
  wire [2:0] bootROMDomainWrapper_auto_bootrom_in_d_bits_opcode; // @[BootROM.scala 70:42]
  wire [1:0] bootROMDomainWrapper_auto_bootrom_in_d_bits_param; // @[BootROM.scala 70:42]
  wire [1:0] bootROMDomainWrapper_auto_bootrom_in_d_bits_size; // @[BootROM.scala 70:42]
  wire [8:0] bootROMDomainWrapper_auto_bootrom_in_d_bits_source; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_bootrom_in_d_bits_sink; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_bootrom_in_d_bits_denied; // @[BootROM.scala 70:42]
  wire [63:0] bootROMDomainWrapper_auto_bootrom_in_d_bits_data; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_bootrom_in_d_bits_corrupt; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_clock_in_clock; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_clock_in_reset; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_clock; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_reset; // @[BootROM.scala 70:42]
  wire  domain_auto_serdesser_client_out_a_ready; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_serdesser_client_out_a_valid; // @[SerialAdapter.scala 373:28]
  wire [2:0] domain_auto_serdesser_client_out_a_bits_opcode; // @[SerialAdapter.scala 373:28]
  wire [2:0] domain_auto_serdesser_client_out_a_bits_param; // @[SerialAdapter.scala 373:28]
  wire [3:0] domain_auto_serdesser_client_out_a_bits_size; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_serdesser_client_out_a_bits_source; // @[SerialAdapter.scala 373:28]
  wire [31:0] domain_auto_serdesser_client_out_a_bits_address; // @[SerialAdapter.scala 373:28]
  wire [7:0] domain_auto_serdesser_client_out_a_bits_mask; // @[SerialAdapter.scala 373:28]
  wire [63:0] domain_auto_serdesser_client_out_a_bits_data; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_serdesser_client_out_a_bits_corrupt; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_serdesser_client_out_d_ready; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_serdesser_client_out_d_valid; // @[SerialAdapter.scala 373:28]
  wire [2:0] domain_auto_serdesser_client_out_d_bits_opcode; // @[SerialAdapter.scala 373:28]
  wire [1:0] domain_auto_serdesser_client_out_d_bits_param; // @[SerialAdapter.scala 373:28]
  wire [3:0] domain_auto_serdesser_client_out_d_bits_size; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_serdesser_client_out_d_bits_source; // @[SerialAdapter.scala 373:28]
  wire [1:0] domain_auto_serdesser_client_out_d_bits_sink; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_serdesser_client_out_d_bits_denied; // @[SerialAdapter.scala 373:28]
  wire [63:0] domain_auto_serdesser_client_out_d_bits_data; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_serdesser_client_out_d_bits_corrupt; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_tlserial_manager_crossing_in_a_ready; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_tlserial_manager_crossing_in_a_valid; // @[SerialAdapter.scala 373:28]
  wire [2:0] domain_auto_tlserial_manager_crossing_in_a_bits_opcode; // @[SerialAdapter.scala 373:28]
  wire [2:0] domain_auto_tlserial_manager_crossing_in_a_bits_param; // @[SerialAdapter.scala 373:28]
  wire [2:0] domain_auto_tlserial_manager_crossing_in_a_bits_size; // @[SerialAdapter.scala 373:28]
  wire [3:0] domain_auto_tlserial_manager_crossing_in_a_bits_source; // @[SerialAdapter.scala 373:28]
  wire [28:0] domain_auto_tlserial_manager_crossing_in_a_bits_address; // @[SerialAdapter.scala 373:28]
  wire [7:0] domain_auto_tlserial_manager_crossing_in_a_bits_mask; // @[SerialAdapter.scala 373:28]
  wire [63:0] domain_auto_tlserial_manager_crossing_in_a_bits_data; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_tlserial_manager_crossing_in_a_bits_corrupt; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_tlserial_manager_crossing_in_d_ready; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_tlserial_manager_crossing_in_d_valid; // @[SerialAdapter.scala 373:28]
  wire [2:0] domain_auto_tlserial_manager_crossing_in_d_bits_opcode; // @[SerialAdapter.scala 373:28]
  wire [1:0] domain_auto_tlserial_manager_crossing_in_d_bits_param; // @[SerialAdapter.scala 373:28]
  wire [2:0] domain_auto_tlserial_manager_crossing_in_d_bits_size; // @[SerialAdapter.scala 373:28]
  wire [3:0] domain_auto_tlserial_manager_crossing_in_d_bits_source; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_tlserial_manager_crossing_in_d_bits_sink; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_tlserial_manager_crossing_in_d_bits_denied; // @[SerialAdapter.scala 373:28]
  wire [63:0] domain_auto_tlserial_manager_crossing_in_d_bits_data; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_tlserial_manager_crossing_in_d_bits_corrupt; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_clock_in_clock; // @[SerialAdapter.scala 373:28]
  wire  domain_auto_clock_in_reset; // @[SerialAdapter.scala 373:28]
  wire  domain_serial_tl_in_ready; // @[SerialAdapter.scala 373:28]
  wire  domain_serial_tl_in_valid; // @[SerialAdapter.scala 373:28]
  wire [3:0] domain_serial_tl_in_bits; // @[SerialAdapter.scala 373:28]
  wire  domain_serial_tl_out_ready; // @[SerialAdapter.scala 373:28]
  wire  domain_serial_tl_out_valid; // @[SerialAdapter.scala 373:28]
  wire [3:0] domain_serial_tl_out_bits; // @[SerialAdapter.scala 373:28]
  wire  domain_clock; // @[SerialAdapter.scala 373:28]
  wire  domain_reset; // @[SerialAdapter.scala 373:28]
  wire  uartClockDomainWrapper_auto_uart_0_int_xing_out_sync_0; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_uart_0_control_xing_in_a_ready; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_uart_0_control_xing_in_a_valid; // @[UART.scala 242:44]
  wire [2:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_opcode; // @[UART.scala 242:44]
  wire [2:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_param; // @[UART.scala 242:44]
  wire [1:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_size; // @[UART.scala 242:44]
  wire [8:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_source; // @[UART.scala 242:44]
  wire [30:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_address; // @[UART.scala 242:44]
  wire [7:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_mask; // @[UART.scala 242:44]
  wire [63:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_data; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_corrupt; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_uart_0_control_xing_in_d_ready; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_uart_0_control_xing_in_d_valid; // @[UART.scala 242:44]
  wire [2:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_opcode; // @[UART.scala 242:44]
  wire [1:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_param; // @[UART.scala 242:44]
  wire [1:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_size; // @[UART.scala 242:44]
  wire [8:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_source; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_sink; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_denied; // @[UART.scala 242:44]
  wire [63:0] uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_data; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_corrupt; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_uart_0_io_out_txd; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_uart_0_io_out_rxd; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_clock_in_clock; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_auto_clock_in_reset; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_clock; // @[UART.scala 242:44]
  wire  uartClockDomainWrapper_reset; // @[UART.scala 242:44]
  wire  intsink_4_clock; // @[Crossing.scala 94:29]
  wire  intsink_4_reset; // @[Crossing.scala 94:29]
  wire  intsink_4_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_4_auto_out_0; // @[Crossing.scala 94:29]
  wire  domain_1_auto_resetCtrl_async_reset_sink_in_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_async_reset_sink_in_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_in_a_ready; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_in_a_valid; // @[TileResetCtrl.scala 23:34]
  wire [2:0] domain_1_auto_resetCtrl_in_a_bits_opcode; // @[TileResetCtrl.scala 23:34]
  wire [2:0] domain_1_auto_resetCtrl_in_a_bits_param; // @[TileResetCtrl.scala 23:34]
  wire [1:0] domain_1_auto_resetCtrl_in_a_bits_size; // @[TileResetCtrl.scala 23:34]
  wire [8:0] domain_1_auto_resetCtrl_in_a_bits_source; // @[TileResetCtrl.scala 23:34]
  wire [20:0] domain_1_auto_resetCtrl_in_a_bits_address; // @[TileResetCtrl.scala 23:34]
  wire [7:0] domain_1_auto_resetCtrl_in_a_bits_mask; // @[TileResetCtrl.scala 23:34]
  wire [63:0] domain_1_auto_resetCtrl_in_a_bits_data; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_in_a_bits_corrupt; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_in_d_ready; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_in_d_valid; // @[TileResetCtrl.scala 23:34]
  wire [2:0] domain_1_auto_resetCtrl_in_d_bits_opcode; // @[TileResetCtrl.scala 23:34]
  wire [1:0] domain_1_auto_resetCtrl_in_d_bits_param; // @[TileResetCtrl.scala 23:34]
  wire [1:0] domain_1_auto_resetCtrl_in_d_bits_size; // @[TileResetCtrl.scala 23:34]
  wire [8:0] domain_1_auto_resetCtrl_in_d_bits_source; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_in_d_bits_sink; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_in_d_bits_denied; // @[TileResetCtrl.scala 23:34]
  wire [63:0] domain_1_auto_resetCtrl_in_d_bits_data; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_resetCtrl_in_d_bits_corrupt; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_clock_in_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_auto_clock_in_reset; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_clock; // @[TileResetCtrl.scala 23:34]
  wire  domain_1_reset; // @[TileResetCtrl.scala 23:34]
  wire  dtm_io_jtag_clock; // @[Periphery.scala 161:21]
  wire  dtm_io_jtag_reset; // @[Periphery.scala 161:21]
  wire  dtm_io_dmi_req_ready; // @[Periphery.scala 161:21]
  wire  dtm_io_dmi_req_valid; // @[Periphery.scala 161:21]
  wire [6:0] dtm_io_dmi_req_bits_addr; // @[Periphery.scala 161:21]
  wire [31:0] dtm_io_dmi_req_bits_data; // @[Periphery.scala 161:21]
  wire [1:0] dtm_io_dmi_req_bits_op; // @[Periphery.scala 161:21]
  wire  dtm_io_dmi_resp_ready; // @[Periphery.scala 161:21]
  wire  dtm_io_dmi_resp_valid; // @[Periphery.scala 161:21]
  wire [31:0] dtm_io_dmi_resp_bits_data; // @[Periphery.scala 161:21]
  wire [1:0] dtm_io_dmi_resp_bits_resp; // @[Periphery.scala 161:21]
  wire  dtm_io_jtag_TCK; // @[Periphery.scala 161:21]
  wire  dtm_io_jtag_TMS; // @[Periphery.scala 161:21]
  wire  dtm_io_jtag_TDI; // @[Periphery.scala 161:21]
  wire  dtm_io_jtag_TDO_data; // @[Periphery.scala 161:21]
  wire  dtm_io_jtag_TDO_driven; // @[Periphery.scala 161:21]
  wire [10:0] dtm_io_jtag_mfr_id; // @[Periphery.scala 161:21]
  wire [15:0] dtm_io_jtag_part_number; // @[Periphery.scala 161:21]
  wire [3:0] dtm_io_jtag_version; // @[Periphery.scala 161:21]
  wire  dtm_rf_reset; // @[Periphery.scala 161:21]
  reg [6:0] int_rtc_tick_value; // @[Counter.scala 60:40]
  wire  int_rtc_tick_wrap_wrap = int_rtc_tick_value == 7'h63; // @[Counter.scala 72:24]
  wire [6:0] _int_rtc_tick_wrap_value_T_1 = int_rtc_tick_value + 7'h1; // @[Counter.scala 76:24]
  InterruptBusWrapper ibus ( // @[BaseSubsystem.scala 50:24]
    .auto_int_bus_int_in_0(ibus_auto_int_bus_int_in_0),
    .auto_int_bus_int_out_0(ibus_auto_int_bus_int_out_0),
    .auto_clock_in_clock(ibus_auto_clock_in_clock),
    .auto_clock_in_reset(ibus_auto_clock_in_reset),
    .clock(ibus_clock),
    .reset(ibus_reset)
  );
  SystemBus subsystem_sbus ( // @[SystemBus.scala 24:26]
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_valid(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_valid),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_opcode(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_opcode),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_param(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_param),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_size(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_size),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_source(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_source),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_address(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_address),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_mask(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_mask),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_data(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_data),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_corrupt(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_corrupt),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_ready(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_ready),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_opcode(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_opcode),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_size(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_size),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_source(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_source),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_mask(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_mask),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_data(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_data),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_corrupt(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_corrupt),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_valid(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_valid),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_opcode(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_opcode),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_param(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_param),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_size(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_size),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_source(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_source),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_address(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_address),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_data(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_data),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_corrupt(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_corrupt),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_ready(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_ready),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_ready(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_ready),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_valid(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_valid),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_bits_sink(
      subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_bits_sink),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_size),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_source),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_mask(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_mask),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_data),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_e_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt),
    .auto_fixedClockNode_out_1_clock(subsystem_sbus_auto_fixedClockNode_out_1_clock),
    .auto_fixedClockNode_out_1_reset(subsystem_sbus_auto_fixedClockNode_out_1_reset),
    .auto_fixedClockNode_out_0_clock(subsystem_sbus_auto_fixedClockNode_out_0_clock),
    .auto_fixedClockNode_out_0_reset(subsystem_sbus_auto_fixedClockNode_out_0_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset),
    .auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock),
    .auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset),
    .clock(subsystem_sbus_clock),
    .reset(subsystem_sbus_reset)
  );
  PeripheryBus subsystem_pbus ( // @[PeripheryBus.scala 31:26]
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_ready(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_ready),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_valid(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_valid),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_opcode(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_opcode),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_param(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_param),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_size(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_size),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_source(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_source),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_address(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_address),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_mask(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_mask),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_data(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_data),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_corrupt(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_corrupt),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_ready(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_ready),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_valid(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_valid),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_opcode(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_opcode),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_param(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_param),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_size(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_size),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_source(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_source),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_sink(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_sink),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_denied(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_denied),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_data(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_data),
    .auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_corrupt(
      subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_corrupt),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_ready(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_ready),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_valid(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_valid),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_opcode(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_opcode),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_param(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_param),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_size(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_size),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_source(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_source),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_address(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_address),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_mask(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_mask),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_data(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_data),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_corrupt(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_corrupt),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_ready(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_ready),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_valid(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_valid),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_opcode(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_opcode),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_param(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_param),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_size(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_size),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_source(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_source),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_sink(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_sink),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_denied(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_denied),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_data(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_data),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_corrupt(
      subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_corrupt),
    .auto_fixedClockNode_out_1_clock(subsystem_pbus_auto_fixedClockNode_out_1_clock),
    .auto_fixedClockNode_out_1_reset(subsystem_pbus_auto_fixedClockNode_out_1_reset),
    .auto_fixedClockNode_out_0_clock(subsystem_pbus_auto_fixedClockNode_out_0_clock),
    .auto_fixedClockNode_out_0_reset(subsystem_pbus_auto_fixedClockNode_out_0_reset),
    .auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock(
      subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset(
      subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .auto_bus_xing_in_a_ready(subsystem_pbus_auto_bus_xing_in_a_ready),
    .auto_bus_xing_in_a_valid(subsystem_pbus_auto_bus_xing_in_a_valid),
    .auto_bus_xing_in_a_bits_opcode(subsystem_pbus_auto_bus_xing_in_a_bits_opcode),
    .auto_bus_xing_in_a_bits_param(subsystem_pbus_auto_bus_xing_in_a_bits_param),
    .auto_bus_xing_in_a_bits_size(subsystem_pbus_auto_bus_xing_in_a_bits_size),
    .auto_bus_xing_in_a_bits_source(subsystem_pbus_auto_bus_xing_in_a_bits_source),
    .auto_bus_xing_in_a_bits_address(subsystem_pbus_auto_bus_xing_in_a_bits_address),
    .auto_bus_xing_in_a_bits_mask(subsystem_pbus_auto_bus_xing_in_a_bits_mask),
    .auto_bus_xing_in_a_bits_data(subsystem_pbus_auto_bus_xing_in_a_bits_data),
    .auto_bus_xing_in_a_bits_corrupt(subsystem_pbus_auto_bus_xing_in_a_bits_corrupt),
    .auto_bus_xing_in_d_ready(subsystem_pbus_auto_bus_xing_in_d_ready),
    .auto_bus_xing_in_d_valid(subsystem_pbus_auto_bus_xing_in_d_valid),
    .auto_bus_xing_in_d_bits_opcode(subsystem_pbus_auto_bus_xing_in_d_bits_opcode),
    .auto_bus_xing_in_d_bits_param(subsystem_pbus_auto_bus_xing_in_d_bits_param),
    .auto_bus_xing_in_d_bits_size(subsystem_pbus_auto_bus_xing_in_d_bits_size),
    .auto_bus_xing_in_d_bits_source(subsystem_pbus_auto_bus_xing_in_d_bits_source),
    .auto_bus_xing_in_d_bits_sink(subsystem_pbus_auto_bus_xing_in_d_bits_sink),
    .auto_bus_xing_in_d_bits_denied(subsystem_pbus_auto_bus_xing_in_d_bits_denied),
    .auto_bus_xing_in_d_bits_data(subsystem_pbus_auto_bus_xing_in_d_bits_data),
    .auto_bus_xing_in_d_bits_corrupt(subsystem_pbus_auto_bus_xing_in_d_bits_corrupt),
    .clock(subsystem_pbus_clock),
    .reset(subsystem_pbus_reset)
  );
  FrontBus subsystem_fbus ( // @[FrontBus.scala 22:26]
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_ready(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_ready),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_valid(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_valid),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_opcode(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_opcode),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_param(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_param),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_size(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_size),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_source(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_source),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_address(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_address),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_mask(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_mask),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_data(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_data),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_corrupt(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_corrupt),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_ready(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_ready),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_valid(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_valid),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_opcode(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_opcode),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_param(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_param),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_size(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_size),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_source(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_source),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_sink(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_sink),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_denied(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_denied),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_data(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_data),
    .auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_corrupt(
      subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_corrupt),
    .auto_fixedClockNode_out_clock(subsystem_fbus_auto_fixedClockNode_out_clock),
    .auto_fixedClockNode_out_reset(subsystem_fbus_auto_fixedClockNode_out_reset),
    .auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock(
      subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock),
    .auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset(
      subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset),
    .auto_bus_xing_out_a_ready(subsystem_fbus_auto_bus_xing_out_a_ready),
    .auto_bus_xing_out_a_valid(subsystem_fbus_auto_bus_xing_out_a_valid),
    .auto_bus_xing_out_a_bits_opcode(subsystem_fbus_auto_bus_xing_out_a_bits_opcode),
    .auto_bus_xing_out_a_bits_param(subsystem_fbus_auto_bus_xing_out_a_bits_param),
    .auto_bus_xing_out_a_bits_size(subsystem_fbus_auto_bus_xing_out_a_bits_size),
    .auto_bus_xing_out_a_bits_source(subsystem_fbus_auto_bus_xing_out_a_bits_source),
    .auto_bus_xing_out_a_bits_address(subsystem_fbus_auto_bus_xing_out_a_bits_address),
    .auto_bus_xing_out_a_bits_mask(subsystem_fbus_auto_bus_xing_out_a_bits_mask),
    .auto_bus_xing_out_a_bits_data(subsystem_fbus_auto_bus_xing_out_a_bits_data),
    .auto_bus_xing_out_a_bits_corrupt(subsystem_fbus_auto_bus_xing_out_a_bits_corrupt),
    .auto_bus_xing_out_d_ready(subsystem_fbus_auto_bus_xing_out_d_ready),
    .auto_bus_xing_out_d_valid(subsystem_fbus_auto_bus_xing_out_d_valid),
    .auto_bus_xing_out_d_bits_opcode(subsystem_fbus_auto_bus_xing_out_d_bits_opcode),
    .auto_bus_xing_out_d_bits_param(subsystem_fbus_auto_bus_xing_out_d_bits_param),
    .auto_bus_xing_out_d_bits_size(subsystem_fbus_auto_bus_xing_out_d_bits_size),
    .auto_bus_xing_out_d_bits_source(subsystem_fbus_auto_bus_xing_out_d_bits_source),
    .auto_bus_xing_out_d_bits_sink(subsystem_fbus_auto_bus_xing_out_d_bits_sink),
    .auto_bus_xing_out_d_bits_denied(subsystem_fbus_auto_bus_xing_out_d_bits_denied),
    .auto_bus_xing_out_d_bits_data(subsystem_fbus_auto_bus_xing_out_d_bits_data),
    .auto_bus_xing_out_d_bits_corrupt(subsystem_fbus_auto_bus_xing_out_d_bits_corrupt),
    .clock(subsystem_fbus_clock),
    .reset(subsystem_fbus_reset)
  );
  PeripheryBus_1 subsystem_cbus ( // @[PeripheryBus.scala 31:26]
    .auto_coupler_to_bootrom_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready),
    .auto_coupler_to_bootrom_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_param(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_size(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_source(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_mask(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_data(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_data),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_bootrom_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready),
    .auto_coupler_to_bootrom_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_opcode(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_param(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_param),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_size(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_source(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_sink(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_sink),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_denied(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_denied),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_data(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_corrupt(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_corrupt),
    .auto_coupler_to_debug_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_ready),
    .auto_coupler_to_debug_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid),
    .auto_coupler_to_debug_fragmenter_out_a_bits_opcode(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_debug_fragmenter_out_a_bits_param(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param)
      ,
    .auto_coupler_to_debug_fragmenter_out_a_bits_size(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size),
    .auto_coupler_to_debug_fragmenter_out_a_bits_source(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source),
    .auto_coupler_to_debug_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address),
    .auto_coupler_to_debug_fragmenter_out_a_bits_mask(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask),
    .auto_coupler_to_debug_fragmenter_out_a_bits_data(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data),
    .auto_coupler_to_debug_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_debug_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready),
    .auto_coupler_to_debug_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_valid),
    .auto_coupler_to_debug_fragmenter_out_d_bits_opcode(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_debug_fragmenter_out_d_bits_param(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_param)
      ,
    .auto_coupler_to_debug_fragmenter_out_d_bits_size(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size),
    .auto_coupler_to_debug_fragmenter_out_d_bits_source(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source),
    .auto_coupler_to_debug_fragmenter_out_d_bits_sink(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_sink),
    .auto_coupler_to_debug_fragmenter_out_d_bits_denied(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_denied),
    .auto_coupler_to_debug_fragmenter_out_d_bits_data(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data),
    .auto_coupler_to_debug_fragmenter_out_d_bits_corrupt(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_corrupt),
    .auto_coupler_to_clint_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_ready),
    .auto_coupler_to_clint_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid),
    .auto_coupler_to_clint_fragmenter_out_a_bits_opcode(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_clint_fragmenter_out_a_bits_param(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param)
      ,
    .auto_coupler_to_clint_fragmenter_out_a_bits_size(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size),
    .auto_coupler_to_clint_fragmenter_out_a_bits_source(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source),
    .auto_coupler_to_clint_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address),
    .auto_coupler_to_clint_fragmenter_out_a_bits_mask(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask),
    .auto_coupler_to_clint_fragmenter_out_a_bits_data(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data),
    .auto_coupler_to_clint_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_clint_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready),
    .auto_coupler_to_clint_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_valid),
    .auto_coupler_to_clint_fragmenter_out_d_bits_opcode(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_clint_fragmenter_out_d_bits_param(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_param)
      ,
    .auto_coupler_to_clint_fragmenter_out_d_bits_size(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size),
    .auto_coupler_to_clint_fragmenter_out_d_bits_source(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source),
    .auto_coupler_to_clint_fragmenter_out_d_bits_sink(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_sink),
    .auto_coupler_to_clint_fragmenter_out_d_bits_denied(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_denied),
    .auto_coupler_to_clint_fragmenter_out_d_bits_data(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data),
    .auto_coupler_to_clint_fragmenter_out_d_bits_corrupt(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_corrupt),
    .auto_coupler_to_plic_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_ready),
    .auto_coupler_to_plic_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid),
    .auto_coupler_to_plic_fragmenter_out_a_bits_opcode(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode)
      ,
    .auto_coupler_to_plic_fragmenter_out_a_bits_param(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param),
    .auto_coupler_to_plic_fragmenter_out_a_bits_size(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size),
    .auto_coupler_to_plic_fragmenter_out_a_bits_source(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source)
      ,
    .auto_coupler_to_plic_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address),
    .auto_coupler_to_plic_fragmenter_out_a_bits_mask(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask),
    .auto_coupler_to_plic_fragmenter_out_a_bits_data(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data),
    .auto_coupler_to_plic_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_plic_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready),
    .auto_coupler_to_plic_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_valid),
    .auto_coupler_to_plic_fragmenter_out_d_bits_opcode(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode)
      ,
    .auto_coupler_to_plic_fragmenter_out_d_bits_param(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_param),
    .auto_coupler_to_plic_fragmenter_out_d_bits_size(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size),
    .auto_coupler_to_plic_fragmenter_out_d_bits_source(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source)
      ,
    .auto_coupler_to_plic_fragmenter_out_d_bits_sink(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_sink),
    .auto_coupler_to_plic_fragmenter_out_d_bits_denied(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_denied)
      ,
    .auto_coupler_to_plic_fragmenter_out_d_bits_data(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data),
    .auto_coupler_to_plic_fragmenter_out_d_bits_corrupt(
      subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_ready(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_ready),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_valid(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_valid),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt(
      subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt),
    .auto_fixedClockNode_out_3_clock(subsystem_cbus_auto_fixedClockNode_out_3_clock),
    .auto_fixedClockNode_out_3_reset(subsystem_cbus_auto_fixedClockNode_out_3_reset),
    .auto_fixedClockNode_out_2_clock(subsystem_cbus_auto_fixedClockNode_out_2_clock),
    .auto_fixedClockNode_out_2_reset(subsystem_cbus_auto_fixedClockNode_out_2_reset),
    .auto_fixedClockNode_out_1_clock(subsystem_cbus_auto_fixedClockNode_out_1_clock),
    .auto_fixedClockNode_out_1_reset(subsystem_cbus_auto_fixedClockNode_out_1_reset),
    .auto_fixedClockNode_out_0_clock(subsystem_cbus_auto_fixedClockNode_out_0_clock),
    .auto_fixedClockNode_out_0_reset(subsystem_cbus_auto_fixedClockNode_out_0_reset),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset),
    .auto_bus_xing_in_a_ready(subsystem_cbus_auto_bus_xing_in_a_ready),
    .auto_bus_xing_in_a_valid(subsystem_cbus_auto_bus_xing_in_a_valid),
    .auto_bus_xing_in_a_bits_opcode(subsystem_cbus_auto_bus_xing_in_a_bits_opcode),
    .auto_bus_xing_in_a_bits_param(subsystem_cbus_auto_bus_xing_in_a_bits_param),
    .auto_bus_xing_in_a_bits_size(subsystem_cbus_auto_bus_xing_in_a_bits_size),
    .auto_bus_xing_in_a_bits_source(subsystem_cbus_auto_bus_xing_in_a_bits_source),
    .auto_bus_xing_in_a_bits_address(subsystem_cbus_auto_bus_xing_in_a_bits_address),
    .auto_bus_xing_in_a_bits_mask(subsystem_cbus_auto_bus_xing_in_a_bits_mask),
    .auto_bus_xing_in_a_bits_data(subsystem_cbus_auto_bus_xing_in_a_bits_data),
    .auto_bus_xing_in_a_bits_corrupt(subsystem_cbus_auto_bus_xing_in_a_bits_corrupt),
    .auto_bus_xing_in_d_ready(subsystem_cbus_auto_bus_xing_in_d_ready),
    .auto_bus_xing_in_d_valid(subsystem_cbus_auto_bus_xing_in_d_valid),
    .auto_bus_xing_in_d_bits_opcode(subsystem_cbus_auto_bus_xing_in_d_bits_opcode),
    .auto_bus_xing_in_d_bits_param(subsystem_cbus_auto_bus_xing_in_d_bits_param),
    .auto_bus_xing_in_d_bits_size(subsystem_cbus_auto_bus_xing_in_d_bits_size),
    .auto_bus_xing_in_d_bits_source(subsystem_cbus_auto_bus_xing_in_d_bits_source),
    .auto_bus_xing_in_d_bits_sink(subsystem_cbus_auto_bus_xing_in_d_bits_sink),
    .auto_bus_xing_in_d_bits_denied(subsystem_cbus_auto_bus_xing_in_d_bits_denied),
    .auto_bus_xing_in_d_bits_data(subsystem_cbus_auto_bus_xing_in_d_bits_data),
    .auto_bus_xing_in_d_bits_corrupt(subsystem_cbus_auto_bus_xing_in_d_bits_corrupt),
    .custom_boot(subsystem_cbus_custom_boot),
    .clock(subsystem_cbus_clock),
    .reset(subsystem_cbus_reset)
  );
  MemoryBus subsystem_mbus ( // @[MemoryBus.scala 25:26]
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_ready(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_ready),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_valid(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_valid),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_opcode(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_opcode),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_param(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_param),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_size(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_size),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_source(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_source),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_address(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_address),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_mask(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_mask),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_data(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_data),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_corrupt(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_corrupt),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_ready(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_ready),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_valid(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_valid),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_opcode(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_opcode),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_param(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_param),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_size(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_size),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_source(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_source),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_sink(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_sink),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_denied(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_denied),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_data(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_data),
    .auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_corrupt(
      subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_corrupt),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last),
    .auto_fixedClockNode_out_clock(subsystem_mbus_auto_fixedClockNode_out_clock),
    .auto_fixedClockNode_out_reset(subsystem_mbus_auto_fixedClockNode_out_reset),
    .auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock(
      subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock),
    .auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset(
      subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset),
    .auto_bus_xing_in_a_ready(subsystem_mbus_auto_bus_xing_in_a_ready),
    .auto_bus_xing_in_a_valid(subsystem_mbus_auto_bus_xing_in_a_valid),
    .auto_bus_xing_in_a_bits_opcode(subsystem_mbus_auto_bus_xing_in_a_bits_opcode),
    .auto_bus_xing_in_a_bits_param(subsystem_mbus_auto_bus_xing_in_a_bits_param),
    .auto_bus_xing_in_a_bits_size(subsystem_mbus_auto_bus_xing_in_a_bits_size),
    .auto_bus_xing_in_a_bits_source(subsystem_mbus_auto_bus_xing_in_a_bits_source),
    .auto_bus_xing_in_a_bits_address(subsystem_mbus_auto_bus_xing_in_a_bits_address),
    .auto_bus_xing_in_a_bits_mask(subsystem_mbus_auto_bus_xing_in_a_bits_mask),
    .auto_bus_xing_in_a_bits_data(subsystem_mbus_auto_bus_xing_in_a_bits_data),
    .auto_bus_xing_in_a_bits_corrupt(subsystem_mbus_auto_bus_xing_in_a_bits_corrupt),
    .auto_bus_xing_in_d_ready(subsystem_mbus_auto_bus_xing_in_d_ready),
    .auto_bus_xing_in_d_valid(subsystem_mbus_auto_bus_xing_in_d_valid),
    .auto_bus_xing_in_d_bits_opcode(subsystem_mbus_auto_bus_xing_in_d_bits_opcode),
    .auto_bus_xing_in_d_bits_param(subsystem_mbus_auto_bus_xing_in_d_bits_param),
    .auto_bus_xing_in_d_bits_size(subsystem_mbus_auto_bus_xing_in_d_bits_size),
    .auto_bus_xing_in_d_bits_source(subsystem_mbus_auto_bus_xing_in_d_bits_source),
    .auto_bus_xing_in_d_bits_sink(subsystem_mbus_auto_bus_xing_in_d_bits_sink),
    .auto_bus_xing_in_d_bits_denied(subsystem_mbus_auto_bus_xing_in_d_bits_denied),
    .auto_bus_xing_in_d_bits_data(subsystem_mbus_auto_bus_xing_in_d_bits_data),
    .auto_bus_xing_in_d_bits_corrupt(subsystem_mbus_auto_bus_xing_in_d_bits_corrupt),
    .clock(subsystem_mbus_clock),
    .reset(subsystem_mbus_reset)
  );
  CoherenceManagerWrapper subsystem_l2_wrapper ( // @[BankedL2Params.scala 47:31]
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_param(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_sink(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt),
    .auto_coherent_jbar_in_a_ready(subsystem_l2_wrapper_auto_coherent_jbar_in_a_ready),
    .auto_coherent_jbar_in_a_valid(subsystem_l2_wrapper_auto_coherent_jbar_in_a_valid),
    .auto_coherent_jbar_in_a_bits_opcode(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_opcode),
    .auto_coherent_jbar_in_a_bits_param(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_param),
    .auto_coherent_jbar_in_a_bits_size(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_size),
    .auto_coherent_jbar_in_a_bits_source(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_source),
    .auto_coherent_jbar_in_a_bits_address(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_address),
    .auto_coherent_jbar_in_a_bits_mask(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_mask),
    .auto_coherent_jbar_in_a_bits_data(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_data),
    .auto_coherent_jbar_in_a_bits_corrupt(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_corrupt),
    .auto_coherent_jbar_in_b_ready(subsystem_l2_wrapper_auto_coherent_jbar_in_b_ready),
    .auto_coherent_jbar_in_b_valid(subsystem_l2_wrapper_auto_coherent_jbar_in_b_valid),
    .auto_coherent_jbar_in_b_bits_opcode(subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_opcode),
    .auto_coherent_jbar_in_b_bits_param(subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_param),
    .auto_coherent_jbar_in_b_bits_size(subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_size),
    .auto_coherent_jbar_in_b_bits_source(subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_source),
    .auto_coherent_jbar_in_b_bits_address(subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_address),
    .auto_coherent_jbar_in_b_bits_mask(subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_mask),
    .auto_coherent_jbar_in_b_bits_data(subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_data),
    .auto_coherent_jbar_in_b_bits_corrupt(subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_corrupt),
    .auto_coherent_jbar_in_c_ready(subsystem_l2_wrapper_auto_coherent_jbar_in_c_ready),
    .auto_coherent_jbar_in_c_valid(subsystem_l2_wrapper_auto_coherent_jbar_in_c_valid),
    .auto_coherent_jbar_in_c_bits_opcode(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_opcode),
    .auto_coherent_jbar_in_c_bits_param(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_param),
    .auto_coherent_jbar_in_c_bits_size(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_size),
    .auto_coherent_jbar_in_c_bits_source(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_source),
    .auto_coherent_jbar_in_c_bits_address(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_address),
    .auto_coherent_jbar_in_c_bits_data(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_data),
    .auto_coherent_jbar_in_c_bits_corrupt(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_corrupt),
    .auto_coherent_jbar_in_d_ready(subsystem_l2_wrapper_auto_coherent_jbar_in_d_ready),
    .auto_coherent_jbar_in_d_valid(subsystem_l2_wrapper_auto_coherent_jbar_in_d_valid),
    .auto_coherent_jbar_in_d_bits_opcode(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_opcode),
    .auto_coherent_jbar_in_d_bits_param(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_param),
    .auto_coherent_jbar_in_d_bits_size(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_size),
    .auto_coherent_jbar_in_d_bits_source(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_source),
    .auto_coherent_jbar_in_d_bits_sink(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_sink),
    .auto_coherent_jbar_in_d_bits_denied(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_denied),
    .auto_coherent_jbar_in_d_bits_data(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_data),
    .auto_coherent_jbar_in_d_bits_corrupt(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_corrupt),
    .auto_coherent_jbar_in_e_ready(subsystem_l2_wrapper_auto_coherent_jbar_in_e_ready),
    .auto_coherent_jbar_in_e_valid(subsystem_l2_wrapper_auto_coherent_jbar_in_e_valid),
    .auto_coherent_jbar_in_e_bits_sink(subsystem_l2_wrapper_auto_coherent_jbar_in_e_bits_sink),
    .auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock(
      subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock),
    .auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset(
      subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset),
    .clock(subsystem_l2_wrapper_clock),
    .reset(subsystem_l2_wrapper_reset)
  );
  TilePRCIDomain tile_prci_domain ( // @[HasTiles.scala 252:38]
    .auto_intsink_in_sync_0(tile_prci_domain_auto_intsink_in_sync_0),
    .auto_tile_reset_domain_boom_tile_trace_out_0_valid(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_valid),
    .auto_tile_reset_domain_boom_tile_trace_out_0_iaddr(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_iaddr),
    .auto_tile_reset_domain_boom_tile_trace_out_0_insn(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_insn),
    .auto_tile_reset_domain_boom_tile_trace_out_0_priv(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_priv),
    .auto_tile_reset_domain_boom_tile_trace_out_0_exception(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_exception),
    .auto_tile_reset_domain_boom_tile_trace_out_0_interrupt(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_interrupt),
    .auto_tile_reset_domain_boom_tile_trace_out_0_cause(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_cause),
    .auto_tile_reset_domain_boom_tile_trace_out_0_tval(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_tval),
    .auto_tile_reset_domain_boom_tile_trace_out_0_wdata(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_0_wdata),
    .auto_tile_reset_domain_boom_tile_trace_out_1_valid(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_valid),
    .auto_tile_reset_domain_boom_tile_trace_out_1_iaddr(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_iaddr),
    .auto_tile_reset_domain_boom_tile_trace_out_1_insn(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_insn),
    .auto_tile_reset_domain_boom_tile_trace_out_1_priv(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_priv),
    .auto_tile_reset_domain_boom_tile_trace_out_1_exception(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_exception),
    .auto_tile_reset_domain_boom_tile_trace_out_1_interrupt(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_interrupt),
    .auto_tile_reset_domain_boom_tile_trace_out_1_cause(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_cause),
    .auto_tile_reset_domain_boom_tile_trace_out_1_tval(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_tval),
    .auto_tile_reset_domain_boom_tile_trace_out_1_wdata(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_trace_out_1_wdata),
    .auto_tile_reset_domain_boom_tile_nmi_in_rnmi(tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_rnmi),
    .auto_tile_reset_domain_boom_tile_nmi_in_rnmi_interrupt_vector(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_rnmi_interrupt_vector),
    .auto_tile_reset_domain_boom_tile_nmi_in_rnmi_exception_vector(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_rnmi_exception_vector),
    .auto_tile_reset_domain_boom_tile_nmi_in_unmi(tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_unmi),
    .auto_tile_reset_domain_boom_tile_nmi_in_unmi_interrupt_vector(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_unmi_interrupt_vector),
    .auto_tile_reset_domain_boom_tile_nmi_in_unmi_exception_vector(
      tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_unmi_exception_vector),
    .auto_tile_reset_domain_boom_tile_reset_vector_in(tile_prci_domain_auto_tile_reset_domain_boom_tile_reset_vector_in)
      ,
    .auto_tile_reset_domain_boom_tile_hartid_in(tile_prci_domain_auto_tile_reset_domain_boom_tile_hartid_in),
    .auto_int_out_clock_xing_out_2_sync_0(tile_prci_domain_auto_int_out_clock_xing_out_2_sync_0),
    .auto_int_out_clock_xing_out_1_sync_0(tile_prci_domain_auto_int_out_clock_xing_out_1_sync_0),
    .auto_int_out_clock_xing_out_0_sync_0(tile_prci_domain_auto_int_out_clock_xing_out_0_sync_0),
    .auto_int_in_clock_xing_in_2_sync_0(tile_prci_domain_auto_int_in_clock_xing_in_2_sync_0),
    .auto_int_in_clock_xing_in_1_sync_0(tile_prci_domain_auto_int_in_clock_xing_in_1_sync_0),
    .auto_int_in_clock_xing_in_0_sync_0(tile_prci_domain_auto_int_in_clock_xing_in_0_sync_0),
    .auto_int_in_clock_xing_in_0_sync_1(tile_prci_domain_auto_int_in_clock_xing_in_0_sync_1),
    .auto_tl_master_clock_xing_out_a_ready(tile_prci_domain_auto_tl_master_clock_xing_out_a_ready),
    .auto_tl_master_clock_xing_out_a_valid(tile_prci_domain_auto_tl_master_clock_xing_out_a_valid),
    .auto_tl_master_clock_xing_out_a_bits_opcode(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode),
    .auto_tl_master_clock_xing_out_a_bits_param(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param),
    .auto_tl_master_clock_xing_out_a_bits_size(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size),
    .auto_tl_master_clock_xing_out_a_bits_source(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source),
    .auto_tl_master_clock_xing_out_a_bits_address(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address),
    .auto_tl_master_clock_xing_out_a_bits_mask(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask),
    .auto_tl_master_clock_xing_out_a_bits_data(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data),
    .auto_tl_master_clock_xing_out_a_bits_corrupt(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt),
    .auto_tl_master_clock_xing_out_b_ready(tile_prci_domain_auto_tl_master_clock_xing_out_b_ready),
    .auto_tl_master_clock_xing_out_b_valid(tile_prci_domain_auto_tl_master_clock_xing_out_b_valid),
    .auto_tl_master_clock_xing_out_b_bits_opcode(tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_opcode),
    .auto_tl_master_clock_xing_out_b_bits_param(tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_param),
    .auto_tl_master_clock_xing_out_b_bits_size(tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_size),
    .auto_tl_master_clock_xing_out_b_bits_source(tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_source),
    .auto_tl_master_clock_xing_out_b_bits_address(tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_address),
    .auto_tl_master_clock_xing_out_b_bits_mask(tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_mask),
    .auto_tl_master_clock_xing_out_b_bits_data(tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_data),
    .auto_tl_master_clock_xing_out_b_bits_corrupt(tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_corrupt),
    .auto_tl_master_clock_xing_out_c_ready(tile_prci_domain_auto_tl_master_clock_xing_out_c_ready),
    .auto_tl_master_clock_xing_out_c_valid(tile_prci_domain_auto_tl_master_clock_xing_out_c_valid),
    .auto_tl_master_clock_xing_out_c_bits_opcode(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode),
    .auto_tl_master_clock_xing_out_c_bits_param(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param),
    .auto_tl_master_clock_xing_out_c_bits_size(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size),
    .auto_tl_master_clock_xing_out_c_bits_source(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source),
    .auto_tl_master_clock_xing_out_c_bits_address(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address),
    .auto_tl_master_clock_xing_out_c_bits_data(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data),
    .auto_tl_master_clock_xing_out_c_bits_corrupt(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt),
    .auto_tl_master_clock_xing_out_d_ready(tile_prci_domain_auto_tl_master_clock_xing_out_d_ready),
    .auto_tl_master_clock_xing_out_d_valid(tile_prci_domain_auto_tl_master_clock_xing_out_d_valid),
    .auto_tl_master_clock_xing_out_d_bits_opcode(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_opcode),
    .auto_tl_master_clock_xing_out_d_bits_param(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_param),
    .auto_tl_master_clock_xing_out_d_bits_size(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_size),
    .auto_tl_master_clock_xing_out_d_bits_source(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_source),
    .auto_tl_master_clock_xing_out_d_bits_sink(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_sink),
    .auto_tl_master_clock_xing_out_d_bits_denied(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_denied),
    .auto_tl_master_clock_xing_out_d_bits_data(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_data),
    .auto_tl_master_clock_xing_out_d_bits_corrupt(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_corrupt),
    .auto_tl_master_clock_xing_out_e_ready(tile_prci_domain_auto_tl_master_clock_xing_out_e_ready),
    .auto_tl_master_clock_xing_out_e_valid(tile_prci_domain_auto_tl_master_clock_xing_out_e_valid),
    .auto_tl_master_clock_xing_out_e_bits_sink(tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink),
    .auto_tap_clock_in_clock(tile_prci_domain_auto_tap_clock_in_clock),
    .auto_tap_clock_in_reset(tile_prci_domain_auto_tap_clock_in_reset),
    .clock(tile_prci_domain_clock),
    .reset(tile_prci_domain_reset)
  );
  ClockSinkDomain plicDomainWrapper ( // @[Plic.scala 359:39]
    .auto_plic_int_in_0(plicDomainWrapper_auto_plic_int_in_0),
    .auto_plic_int_out_1_0(plicDomainWrapper_auto_plic_int_out_1_0),
    .auto_plic_int_out_0_0(plicDomainWrapper_auto_plic_int_out_0_0),
    .auto_plic_in_a_ready(plicDomainWrapper_auto_plic_in_a_ready),
    .auto_plic_in_a_valid(plicDomainWrapper_auto_plic_in_a_valid),
    .auto_plic_in_a_bits_opcode(plicDomainWrapper_auto_plic_in_a_bits_opcode),
    .auto_plic_in_a_bits_param(plicDomainWrapper_auto_plic_in_a_bits_param),
    .auto_plic_in_a_bits_size(plicDomainWrapper_auto_plic_in_a_bits_size),
    .auto_plic_in_a_bits_source(plicDomainWrapper_auto_plic_in_a_bits_source),
    .auto_plic_in_a_bits_address(plicDomainWrapper_auto_plic_in_a_bits_address),
    .auto_plic_in_a_bits_mask(plicDomainWrapper_auto_plic_in_a_bits_mask),
    .auto_plic_in_a_bits_data(plicDomainWrapper_auto_plic_in_a_bits_data),
    .auto_plic_in_a_bits_corrupt(plicDomainWrapper_auto_plic_in_a_bits_corrupt),
    .auto_plic_in_d_ready(plicDomainWrapper_auto_plic_in_d_ready),
    .auto_plic_in_d_valid(plicDomainWrapper_auto_plic_in_d_valid),
    .auto_plic_in_d_bits_opcode(plicDomainWrapper_auto_plic_in_d_bits_opcode),
    .auto_plic_in_d_bits_param(plicDomainWrapper_auto_plic_in_d_bits_param),
    .auto_plic_in_d_bits_size(plicDomainWrapper_auto_plic_in_d_bits_size),
    .auto_plic_in_d_bits_source(plicDomainWrapper_auto_plic_in_d_bits_source),
    .auto_plic_in_d_bits_sink(plicDomainWrapper_auto_plic_in_d_bits_sink),
    .auto_plic_in_d_bits_denied(plicDomainWrapper_auto_plic_in_d_bits_denied),
    .auto_plic_in_d_bits_data(plicDomainWrapper_auto_plic_in_d_bits_data),
    .auto_plic_in_d_bits_corrupt(plicDomainWrapper_auto_plic_in_d_bits_corrupt),
    .auto_clock_in_clock(plicDomainWrapper_auto_clock_in_clock),
    .auto_clock_in_reset(plicDomainWrapper_auto_clock_in_reset),
    .clock(plicDomainWrapper_clock),
    .reset(plicDomainWrapper_reset)
  );
  CLINT clint ( // @[CLINT.scala 109:27]
    .clock(clint_clock),
    .reset(clint_reset),
    .auto_int_out_0(clint_auto_int_out_0),
    .auto_int_out_1(clint_auto_int_out_1),
    .auto_in_a_ready(clint_auto_in_a_ready),
    .auto_in_a_valid(clint_auto_in_a_valid),
    .auto_in_a_bits_opcode(clint_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(clint_auto_in_a_bits_param),
    .auto_in_a_bits_size(clint_auto_in_a_bits_size),
    .auto_in_a_bits_source(clint_auto_in_a_bits_source),
    .auto_in_a_bits_address(clint_auto_in_a_bits_address),
    .auto_in_a_bits_mask(clint_auto_in_a_bits_mask),
    .auto_in_a_bits_data(clint_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(clint_auto_in_a_bits_corrupt),
    .auto_in_d_ready(clint_auto_in_d_ready),
    .auto_in_d_valid(clint_auto_in_d_valid),
    .auto_in_d_bits_opcode(clint_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(clint_auto_in_d_bits_param),
    .auto_in_d_bits_size(clint_auto_in_d_bits_size),
    .auto_in_d_bits_source(clint_auto_in_d_bits_source),
    .auto_in_d_bits_sink(clint_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(clint_auto_in_d_bits_denied),
    .auto_in_d_bits_data(clint_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(clint_auto_in_d_bits_corrupt),
    .io_rtcTick(clint_io_rtcTick)
  );
  DebugCustomXbar debugCustomXbarOpt ( // @[Periphery.scala 76:70]
    .clock(debugCustomXbarOpt_clock),
    .reset(debugCustomXbarOpt_reset),
    .auto_out_addr(debugCustomXbarOpt_auto_out_addr),
    .auto_out_ready(debugCustomXbarOpt_auto_out_ready),
    .auto_out_valid(debugCustomXbarOpt_auto_out_valid)
  );
  TLDebugModule debug_1 ( // @[Periphery.scala 84:27]
    .auto_dmInner_dmInner_custom_in_addr(debug_1_auto_dmInner_dmInner_custom_in_addr),
    .auto_dmInner_dmInner_custom_in_ready(debug_1_auto_dmInner_dmInner_custom_in_ready),
    .auto_dmInner_dmInner_custom_in_valid(debug_1_auto_dmInner_dmInner_custom_in_valid),
    .auto_dmInner_dmInner_tl_in_a_ready(debug_1_auto_dmInner_dmInner_tl_in_a_ready),
    .auto_dmInner_dmInner_tl_in_a_valid(debug_1_auto_dmInner_dmInner_tl_in_a_valid),
    .auto_dmInner_dmInner_tl_in_a_bits_opcode(debug_1_auto_dmInner_dmInner_tl_in_a_bits_opcode),
    .auto_dmInner_dmInner_tl_in_a_bits_param(debug_1_auto_dmInner_dmInner_tl_in_a_bits_param),
    .auto_dmInner_dmInner_tl_in_a_bits_size(debug_1_auto_dmInner_dmInner_tl_in_a_bits_size),
    .auto_dmInner_dmInner_tl_in_a_bits_source(debug_1_auto_dmInner_dmInner_tl_in_a_bits_source),
    .auto_dmInner_dmInner_tl_in_a_bits_address(debug_1_auto_dmInner_dmInner_tl_in_a_bits_address),
    .auto_dmInner_dmInner_tl_in_a_bits_mask(debug_1_auto_dmInner_dmInner_tl_in_a_bits_mask),
    .auto_dmInner_dmInner_tl_in_a_bits_data(debug_1_auto_dmInner_dmInner_tl_in_a_bits_data),
    .auto_dmInner_dmInner_tl_in_a_bits_corrupt(debug_1_auto_dmInner_dmInner_tl_in_a_bits_corrupt),
    .auto_dmInner_dmInner_tl_in_d_ready(debug_1_auto_dmInner_dmInner_tl_in_d_ready),
    .auto_dmInner_dmInner_tl_in_d_valid(debug_1_auto_dmInner_dmInner_tl_in_d_valid),
    .auto_dmInner_dmInner_tl_in_d_bits_opcode(debug_1_auto_dmInner_dmInner_tl_in_d_bits_opcode),
    .auto_dmInner_dmInner_tl_in_d_bits_param(debug_1_auto_dmInner_dmInner_tl_in_d_bits_param),
    .auto_dmInner_dmInner_tl_in_d_bits_size(debug_1_auto_dmInner_dmInner_tl_in_d_bits_size),
    .auto_dmInner_dmInner_tl_in_d_bits_source(debug_1_auto_dmInner_dmInner_tl_in_d_bits_source),
    .auto_dmInner_dmInner_tl_in_d_bits_sink(debug_1_auto_dmInner_dmInner_tl_in_d_bits_sink),
    .auto_dmInner_dmInner_tl_in_d_bits_denied(debug_1_auto_dmInner_dmInner_tl_in_d_bits_denied),
    .auto_dmInner_dmInner_tl_in_d_bits_data(debug_1_auto_dmInner_dmInner_tl_in_d_bits_data),
    .auto_dmInner_dmInner_tl_in_d_bits_corrupt(debug_1_auto_dmInner_dmInner_tl_in_d_bits_corrupt),
    .auto_dmOuter_intsource_out_sync_0(debug_1_auto_dmOuter_intsource_out_sync_0),
    .io_debug_clock(debug_1_io_debug_clock),
    .io_debug_reset(debug_1_io_debug_reset),
    .io_tl_clock(debug_1_io_tl_clock),
    .io_tl_reset(debug_1_io_tl_reset),
    .io_ctrl_debugUnavail_0(debug_1_io_ctrl_debugUnavail_0),
    .io_ctrl_ndreset(debug_1_io_ctrl_ndreset),
    .io_ctrl_dmactive(debug_1_io_ctrl_dmactive),
    .io_ctrl_dmactiveAck(debug_1_io_ctrl_dmactiveAck),
    .io_dmi_dmi_req_ready(debug_1_io_dmi_dmi_req_ready),
    .io_dmi_dmi_req_valid(debug_1_io_dmi_dmi_req_valid),
    .io_dmi_dmi_req_bits_addr(debug_1_io_dmi_dmi_req_bits_addr),
    .io_dmi_dmi_req_bits_data(debug_1_io_dmi_dmi_req_bits_data),
    .io_dmi_dmi_req_bits_op(debug_1_io_dmi_dmi_req_bits_op),
    .io_dmi_dmi_resp_ready(debug_1_io_dmi_dmi_resp_ready),
    .io_dmi_dmi_resp_valid(debug_1_io_dmi_dmi_resp_valid),
    .io_dmi_dmi_resp_bits_data(debug_1_io_dmi_dmi_resp_bits_data),
    .io_dmi_dmi_resp_bits_resp(debug_1_io_dmi_dmi_resp_bits_resp),
    .io_dmi_dmiClock(debug_1_io_dmi_dmiClock),
    .io_dmi_dmiReset(debug_1_io_dmi_dmiReset),
    .io_hartIsInReset_0(debug_1_io_hartIsInReset_0)
  );
  IntXbar xbar ( // @[Xbar.scala 30:26]
    .clock(xbar_clock),
    .reset(xbar_reset),
    .auto_int_in_0(xbar_auto_int_in_0),
    .auto_int_out_0(xbar_auto_int_out_0)
  );
  IntXbar xbar_1 ( // @[Xbar.scala 30:26]
    .clock(xbar_1_clock),
    .reset(xbar_1_reset),
    .auto_int_in_0(xbar_1_auto_int_in_0),
    .auto_int_out_0(xbar_1_auto_int_out_0)
  );
  IntXbar xbar_2 ( // @[Xbar.scala 30:26]
    .clock(xbar_2_clock),
    .reset(xbar_2_reset),
    .auto_int_in_0(xbar_2_auto_int_in_0),
    .auto_int_out_0(xbar_2_auto_int_out_0)
  );
  BundleBridgeNexus_16 tileHartIdNexusNode ( // @[HasTiles.scala 159:39]
    .clock(tileHartIdNexusNode_clock),
    .reset(tileHartIdNexusNode_reset),
    .auto_out(tileHartIdNexusNode_auto_out)
  );
  BundleBridgeNexus_17 broadcast ( // @[BundleBridge.scala 196:31]
    .clock(broadcast_clock),
    .reset(broadcast_reset),
    .auto_in(broadcast_auto_in),
    .auto_out(broadcast_auto_out)
  );
  IntSyncCrossingSource_5 intsource ( // @[Crossing.scala 26:31]
    .clock(intsource_clock),
    .reset(intsource_reset),
    .auto_in_0(intsource_auto_in_0),
    .auto_in_1(intsource_auto_in_1),
    .auto_out_sync_0(intsource_auto_out_sync_0),
    .auto_out_sync_1(intsource_auto_out_sync_1)
  );
  IntSyncCrossingSource_1 intsource_1 ( // @[Crossing.scala 26:31]
    .clock(intsource_1_clock),
    .reset(intsource_1_reset),
    .auto_in_0(intsource_1_auto_in_0),
    .auto_out_sync_0(intsource_1_auto_out_sync_0)
  );
  IntSyncCrossingSource_1 intsource_2 ( // @[Crossing.scala 26:31]
    .clock(intsource_2_clock),
    .reset(intsource_2_reset),
    .auto_in_0(intsource_2_auto_in_0),
    .auto_out_sync_0(intsource_2_auto_out_sync_0)
  );
  BundleBridgeNexus intsink ( // @[Crossing.scala 94:29]
    .clock(intsink_clock),
    .reset(intsink_reset)
  );
  IntSyncSyncCrossingSink_1 intsink_1 ( // @[Crossing.scala 94:29]
    .clock(intsink_1_clock),
    .reset(intsink_1_reset),
    .auto_in_sync_0(intsink_1_auto_in_sync_0),
    .auto_out_0(intsink_1_auto_out_0)
  );
  IntSyncSyncCrossingSink_1 intsink_2 ( // @[Crossing.scala 94:29]
    .clock(intsink_2_clock),
    .reset(intsink_2_reset),
    .auto_in_sync_0(intsink_2_auto_in_sync_0),
    .auto_out_0(intsink_2_auto_out_0)
  );
  IntSyncSyncCrossingSink_1 intsink_3 ( // @[Crossing.scala 94:29]
    .clock(intsink_3_clock),
    .reset(intsink_3_reset),
    .auto_in_sync_0(intsink_3_auto_in_sync_0),
    .auto_out_0(intsink_3_auto_out_0)
  );
  ClockSinkDomain_1 bootROMDomainWrapper ( // @[BootROM.scala 70:42]
    .auto_bootrom_in_a_ready(bootROMDomainWrapper_auto_bootrom_in_a_ready),
    .auto_bootrom_in_a_valid(bootROMDomainWrapper_auto_bootrom_in_a_valid),
    .auto_bootrom_in_a_bits_opcode(bootROMDomainWrapper_auto_bootrom_in_a_bits_opcode),
    .auto_bootrom_in_a_bits_param(bootROMDomainWrapper_auto_bootrom_in_a_bits_param),
    .auto_bootrom_in_a_bits_size(bootROMDomainWrapper_auto_bootrom_in_a_bits_size),
    .auto_bootrom_in_a_bits_source(bootROMDomainWrapper_auto_bootrom_in_a_bits_source),
    .auto_bootrom_in_a_bits_address(bootROMDomainWrapper_auto_bootrom_in_a_bits_address),
    .auto_bootrom_in_a_bits_mask(bootROMDomainWrapper_auto_bootrom_in_a_bits_mask),
    .auto_bootrom_in_a_bits_data(bootROMDomainWrapper_auto_bootrom_in_a_bits_data),
    .auto_bootrom_in_a_bits_corrupt(bootROMDomainWrapper_auto_bootrom_in_a_bits_corrupt),
    .auto_bootrom_in_d_ready(bootROMDomainWrapper_auto_bootrom_in_d_ready),
    .auto_bootrom_in_d_valid(bootROMDomainWrapper_auto_bootrom_in_d_valid),
    .auto_bootrom_in_d_bits_opcode(bootROMDomainWrapper_auto_bootrom_in_d_bits_opcode),
    .auto_bootrom_in_d_bits_param(bootROMDomainWrapper_auto_bootrom_in_d_bits_param),
    .auto_bootrom_in_d_bits_size(bootROMDomainWrapper_auto_bootrom_in_d_bits_size),
    .auto_bootrom_in_d_bits_source(bootROMDomainWrapper_auto_bootrom_in_d_bits_source),
    .auto_bootrom_in_d_bits_sink(bootROMDomainWrapper_auto_bootrom_in_d_bits_sink),
    .auto_bootrom_in_d_bits_denied(bootROMDomainWrapper_auto_bootrom_in_d_bits_denied),
    .auto_bootrom_in_d_bits_data(bootROMDomainWrapper_auto_bootrom_in_d_bits_data),
    .auto_bootrom_in_d_bits_corrupt(bootROMDomainWrapper_auto_bootrom_in_d_bits_corrupt),
    .auto_clock_in_clock(bootROMDomainWrapper_auto_clock_in_clock),
    .auto_clock_in_reset(bootROMDomainWrapper_auto_clock_in_reset),
    .clock(bootROMDomainWrapper_clock),
    .reset(bootROMDomainWrapper_reset)
  );
  ClockSinkDomain_2 domain ( // @[SerialAdapter.scala 373:28]
    .auto_serdesser_client_out_a_ready(domain_auto_serdesser_client_out_a_ready),
    .auto_serdesser_client_out_a_valid(domain_auto_serdesser_client_out_a_valid),
    .auto_serdesser_client_out_a_bits_opcode(domain_auto_serdesser_client_out_a_bits_opcode),
    .auto_serdesser_client_out_a_bits_param(domain_auto_serdesser_client_out_a_bits_param),
    .auto_serdesser_client_out_a_bits_size(domain_auto_serdesser_client_out_a_bits_size),
    .auto_serdesser_client_out_a_bits_source(domain_auto_serdesser_client_out_a_bits_source),
    .auto_serdesser_client_out_a_bits_address(domain_auto_serdesser_client_out_a_bits_address),
    .auto_serdesser_client_out_a_bits_mask(domain_auto_serdesser_client_out_a_bits_mask),
    .auto_serdesser_client_out_a_bits_data(domain_auto_serdesser_client_out_a_bits_data),
    .auto_serdesser_client_out_a_bits_corrupt(domain_auto_serdesser_client_out_a_bits_corrupt),
    .auto_serdesser_client_out_d_ready(domain_auto_serdesser_client_out_d_ready),
    .auto_serdesser_client_out_d_valid(domain_auto_serdesser_client_out_d_valid),
    .auto_serdesser_client_out_d_bits_opcode(domain_auto_serdesser_client_out_d_bits_opcode),
    .auto_serdesser_client_out_d_bits_param(domain_auto_serdesser_client_out_d_bits_param),
    .auto_serdesser_client_out_d_bits_size(domain_auto_serdesser_client_out_d_bits_size),
    .auto_serdesser_client_out_d_bits_source(domain_auto_serdesser_client_out_d_bits_source),
    .auto_serdesser_client_out_d_bits_sink(domain_auto_serdesser_client_out_d_bits_sink),
    .auto_serdesser_client_out_d_bits_denied(domain_auto_serdesser_client_out_d_bits_denied),
    .auto_serdesser_client_out_d_bits_data(domain_auto_serdesser_client_out_d_bits_data),
    .auto_serdesser_client_out_d_bits_corrupt(domain_auto_serdesser_client_out_d_bits_corrupt),
    .auto_tlserial_manager_crossing_in_a_ready(domain_auto_tlserial_manager_crossing_in_a_ready),
    .auto_tlserial_manager_crossing_in_a_valid(domain_auto_tlserial_manager_crossing_in_a_valid),
    .auto_tlserial_manager_crossing_in_a_bits_opcode(domain_auto_tlserial_manager_crossing_in_a_bits_opcode),
    .auto_tlserial_manager_crossing_in_a_bits_param(domain_auto_tlserial_manager_crossing_in_a_bits_param),
    .auto_tlserial_manager_crossing_in_a_bits_size(domain_auto_tlserial_manager_crossing_in_a_bits_size),
    .auto_tlserial_manager_crossing_in_a_bits_source(domain_auto_tlserial_manager_crossing_in_a_bits_source),
    .auto_tlserial_manager_crossing_in_a_bits_address(domain_auto_tlserial_manager_crossing_in_a_bits_address),
    .auto_tlserial_manager_crossing_in_a_bits_mask(domain_auto_tlserial_manager_crossing_in_a_bits_mask),
    .auto_tlserial_manager_crossing_in_a_bits_data(domain_auto_tlserial_manager_crossing_in_a_bits_data),
    .auto_tlserial_manager_crossing_in_a_bits_corrupt(domain_auto_tlserial_manager_crossing_in_a_bits_corrupt),
    .auto_tlserial_manager_crossing_in_d_ready(domain_auto_tlserial_manager_crossing_in_d_ready),
    .auto_tlserial_manager_crossing_in_d_valid(domain_auto_tlserial_manager_crossing_in_d_valid),
    .auto_tlserial_manager_crossing_in_d_bits_opcode(domain_auto_tlserial_manager_crossing_in_d_bits_opcode),
    .auto_tlserial_manager_crossing_in_d_bits_param(domain_auto_tlserial_manager_crossing_in_d_bits_param),
    .auto_tlserial_manager_crossing_in_d_bits_size(domain_auto_tlserial_manager_crossing_in_d_bits_size),
    .auto_tlserial_manager_crossing_in_d_bits_source(domain_auto_tlserial_manager_crossing_in_d_bits_source),
    .auto_tlserial_manager_crossing_in_d_bits_sink(domain_auto_tlserial_manager_crossing_in_d_bits_sink),
    .auto_tlserial_manager_crossing_in_d_bits_denied(domain_auto_tlserial_manager_crossing_in_d_bits_denied),
    .auto_tlserial_manager_crossing_in_d_bits_data(domain_auto_tlserial_manager_crossing_in_d_bits_data),
    .auto_tlserial_manager_crossing_in_d_bits_corrupt(domain_auto_tlserial_manager_crossing_in_d_bits_corrupt),
    .auto_clock_in_clock(domain_auto_clock_in_clock),
    .auto_clock_in_reset(domain_auto_clock_in_reset),
    .serial_tl_in_ready(domain_serial_tl_in_ready),
    .serial_tl_in_valid(domain_serial_tl_in_valid),
    .serial_tl_in_bits(domain_serial_tl_in_bits),
    .serial_tl_out_ready(domain_serial_tl_out_ready),
    .serial_tl_out_valid(domain_serial_tl_out_valid),
    .serial_tl_out_bits(domain_serial_tl_out_bits),
    .clock(domain_clock),
    .reset(domain_reset)
  );
  ClockSinkDomain_3 uartClockDomainWrapper ( // @[UART.scala 242:44]
    .auto_uart_0_int_xing_out_sync_0(uartClockDomainWrapper_auto_uart_0_int_xing_out_sync_0),
    .auto_uart_0_control_xing_in_a_ready(uartClockDomainWrapper_auto_uart_0_control_xing_in_a_ready),
    .auto_uart_0_control_xing_in_a_valid(uartClockDomainWrapper_auto_uart_0_control_xing_in_a_valid),
    .auto_uart_0_control_xing_in_a_bits_opcode(uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_opcode),
    .auto_uart_0_control_xing_in_a_bits_param(uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_param),
    .auto_uart_0_control_xing_in_a_bits_size(uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_size),
    .auto_uart_0_control_xing_in_a_bits_source(uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_source),
    .auto_uart_0_control_xing_in_a_bits_address(uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_address),
    .auto_uart_0_control_xing_in_a_bits_mask(uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_mask),
    .auto_uart_0_control_xing_in_a_bits_data(uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_data),
    .auto_uart_0_control_xing_in_a_bits_corrupt(uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_corrupt),
    .auto_uart_0_control_xing_in_d_ready(uartClockDomainWrapper_auto_uart_0_control_xing_in_d_ready),
    .auto_uart_0_control_xing_in_d_valid(uartClockDomainWrapper_auto_uart_0_control_xing_in_d_valid),
    .auto_uart_0_control_xing_in_d_bits_opcode(uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_opcode),
    .auto_uart_0_control_xing_in_d_bits_param(uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_param),
    .auto_uart_0_control_xing_in_d_bits_size(uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_size),
    .auto_uart_0_control_xing_in_d_bits_source(uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_source),
    .auto_uart_0_control_xing_in_d_bits_sink(uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_sink),
    .auto_uart_0_control_xing_in_d_bits_denied(uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_denied),
    .auto_uart_0_control_xing_in_d_bits_data(uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_data),
    .auto_uart_0_control_xing_in_d_bits_corrupt(uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_corrupt),
    .auto_uart_0_io_out_txd(uartClockDomainWrapper_auto_uart_0_io_out_txd),
    .auto_uart_0_io_out_rxd(uartClockDomainWrapper_auto_uart_0_io_out_rxd),
    .auto_clock_in_clock(uartClockDomainWrapper_auto_clock_in_clock),
    .auto_clock_in_reset(uartClockDomainWrapper_auto_clock_in_reset),
    .clock(uartClockDomainWrapper_clock),
    .reset(uartClockDomainWrapper_reset)
  );
  IntSyncSyncCrossingSink_1 intsink_4 ( // @[Crossing.scala 94:29]
    .clock(intsink_4_clock),
    .reset(intsink_4_reset),
    .auto_in_sync_0(intsink_4_auto_in_sync_0),
    .auto_out_0(intsink_4_auto_out_0)
  );
  ClockSinkDomain_4 domain_1 ( // @[TileResetCtrl.scala 23:34]
    .auto_resetCtrl_async_reset_sink_in_clock(domain_1_auto_resetCtrl_async_reset_sink_in_clock),
    .auto_resetCtrl_async_reset_sink_in_reset(domain_1_auto_resetCtrl_async_reset_sink_in_reset),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock),
    .auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock),
    .auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset(
      domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset),
    .auto_resetCtrl_in_a_ready(domain_1_auto_resetCtrl_in_a_ready),
    .auto_resetCtrl_in_a_valid(domain_1_auto_resetCtrl_in_a_valid),
    .auto_resetCtrl_in_a_bits_opcode(domain_1_auto_resetCtrl_in_a_bits_opcode),
    .auto_resetCtrl_in_a_bits_param(domain_1_auto_resetCtrl_in_a_bits_param),
    .auto_resetCtrl_in_a_bits_size(domain_1_auto_resetCtrl_in_a_bits_size),
    .auto_resetCtrl_in_a_bits_source(domain_1_auto_resetCtrl_in_a_bits_source),
    .auto_resetCtrl_in_a_bits_address(domain_1_auto_resetCtrl_in_a_bits_address),
    .auto_resetCtrl_in_a_bits_mask(domain_1_auto_resetCtrl_in_a_bits_mask),
    .auto_resetCtrl_in_a_bits_data(domain_1_auto_resetCtrl_in_a_bits_data),
    .auto_resetCtrl_in_a_bits_corrupt(domain_1_auto_resetCtrl_in_a_bits_corrupt),
    .auto_resetCtrl_in_d_ready(domain_1_auto_resetCtrl_in_d_ready),
    .auto_resetCtrl_in_d_valid(domain_1_auto_resetCtrl_in_d_valid),
    .auto_resetCtrl_in_d_bits_opcode(domain_1_auto_resetCtrl_in_d_bits_opcode),
    .auto_resetCtrl_in_d_bits_param(domain_1_auto_resetCtrl_in_d_bits_param),
    .auto_resetCtrl_in_d_bits_size(domain_1_auto_resetCtrl_in_d_bits_size),
    .auto_resetCtrl_in_d_bits_source(domain_1_auto_resetCtrl_in_d_bits_source),
    .auto_resetCtrl_in_d_bits_sink(domain_1_auto_resetCtrl_in_d_bits_sink),
    .auto_resetCtrl_in_d_bits_denied(domain_1_auto_resetCtrl_in_d_bits_denied),
    .auto_resetCtrl_in_d_bits_data(domain_1_auto_resetCtrl_in_d_bits_data),
    .auto_resetCtrl_in_d_bits_corrupt(domain_1_auto_resetCtrl_in_d_bits_corrupt),
    .auto_clock_in_clock(domain_1_auto_clock_in_clock),
    .auto_clock_in_reset(domain_1_auto_clock_in_reset),
    .clock(domain_1_clock),
    .reset(domain_1_reset)
  );
  DebugTransportModuleJTAG dtm ( // @[Periphery.scala 161:21]
    .io_jtag_clock(dtm_io_jtag_clock),
    .io_jtag_reset(dtm_io_jtag_reset),
    .io_dmi_req_ready(dtm_io_dmi_req_ready),
    .io_dmi_req_valid(dtm_io_dmi_req_valid),
    .io_dmi_req_bits_addr(dtm_io_dmi_req_bits_addr),
    .io_dmi_req_bits_data(dtm_io_dmi_req_bits_data),
    .io_dmi_req_bits_op(dtm_io_dmi_req_bits_op),
    .io_dmi_resp_ready(dtm_io_dmi_resp_ready),
    .io_dmi_resp_valid(dtm_io_dmi_resp_valid),
    .io_dmi_resp_bits_data(dtm_io_dmi_resp_bits_data),
    .io_dmi_resp_bits_resp(dtm_io_dmi_resp_bits_resp),
    .io_jtag_TCK(dtm_io_jtag_TCK),
    .io_jtag_TMS(dtm_io_jtag_TMS),
    .io_jtag_TDI(dtm_io_jtag_TDI),
    .io_jtag_TDO_data(dtm_io_jtag_TDO_data),
    .io_jtag_TDO_driven(dtm_io_jtag_TDO_driven),
    .io_jtag_mfr_id(dtm_io_jtag_mfr_id),
    .io_jtag_part_number(dtm_io_jtag_part_number),
    .io_jtag_version(dtm_io_jtag_version),
    .rf_reset(dtm_rf_reset)
  );
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock; // @[LazyModule.scala 311:12]
  assign auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset =
    domain_1_auto_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset; // @[LazyModule.scala 311:12]
  assign auto_subsystem_mbus_fixedClockNode_out_clock = subsystem_mbus_auto_fixedClockNode_out_clock; // @[LazyModule.scala 311:12]
  assign auto_subsystem_mbus_fixedClockNode_out_reset = subsystem_mbus_auto_fixedClockNode_out_reset; // @[LazyModule.scala 311:12]
  assign auto_subsystem_cbus_fixedClockNode_out_clock = subsystem_cbus_auto_fixedClockNode_out_3_clock; // @[LazyModule.scala 311:12]
  assign auto_subsystem_cbus_fixedClockNode_out_reset = subsystem_cbus_auto_fixedClockNode_out_3_reset; // @[LazyModule.scala 311:12]
  assign mem_axi4_0_aw_valid = subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_id =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_addr =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_len =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_size =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_burst =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_lock =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_cache =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_prot =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_qos =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_w_valid = subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_w_bits_data =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_w_bits_strb =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_w_bits_last =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_b_ready = subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_valid = subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_id =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_addr =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_len =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_size =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_burst =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_lock =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_cache =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_prot =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_qos =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_r_ready = subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign serial_tl_clock = domain_clock; // @[SerialAdapter.scala 408:22]
  assign serial_tl_bits_in_ready = domain_serial_tl_in_ready; // @[SerialAdapter.scala 407:21]
  assign serial_tl_bits_out_valid = domain_serial_tl_out_valid; // @[SerialAdapter.scala 407:21]
  assign serial_tl_bits_out_bits = domain_serial_tl_out_bits; // @[SerialAdapter.scala 407:21]
  assign debug_systemjtag_jtag_TDO_data = dtm_io_jtag_TDO_data; // @[Periphery.scala 162:17]
  assign debug_systemjtag_jtag_TDO_driven = dtm_io_jtag_TDO_driven; // @[Periphery.scala 162:17]
  assign debug_ndreset = debug_1_io_ctrl_ndreset; // @[Periphery.scala 146:19]
  assign debug_dmactive = debug_1_io_ctrl_dmactive; // @[Periphery.scala 147:20]
  assign uart_0_txd = uartClockDomainWrapper_auto_uart_0_io_out_txd; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign ibus_auto_int_bus_int_in_0 = intsink_4_auto_out_0; // @[LazyModule.scala 296:16]
  assign ibus_auto_clock_in_clock = subsystem_sbus_auto_fixedClockNode_out_0_clock; // @[LazyModule.scala 296:16]
  assign ibus_auto_clock_in_reset = subsystem_sbus_auto_fixedClockNode_out_0_reset; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_valid =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_valid; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_opcode =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_param =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_size =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_source =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_address =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_mask =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_data =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_corrupt =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_ready =
    tile_prci_domain_auto_tl_master_clock_xing_out_b_ready; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_valid =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_valid; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_opcode =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_param =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_size =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_source =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_address =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_data =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_corrupt =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_ready =
    tile_prci_domain_auto_tl_master_clock_xing_out_d_ready; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_valid =
    tile_prci_domain_auto_tl_master_clock_xing_out_e_valid; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_bits_sink =
    tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready =
    subsystem_l2_wrapper_auto_coherent_jbar_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_valid; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_opcode =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_size =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_source =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_address; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_mask =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_mask; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_data =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_corrupt =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready =
    subsystem_l2_wrapper_auto_coherent_jbar_in_c_ready; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_ready =
    subsystem_l2_wrapper_auto_coherent_jbar_in_e_ready; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid =
    subsystem_fbus_auto_bus_xing_out_a_valid; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode =
    subsystem_fbus_auto_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param =
    subsystem_fbus_auto_bus_xing_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size =
    subsystem_fbus_auto_bus_xing_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source =
    subsystem_fbus_auto_bus_xing_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address =
    subsystem_fbus_auto_bus_xing_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask =
    subsystem_fbus_auto_bus_xing_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data =
    subsystem_fbus_auto_bus_xing_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt =
    subsystem_fbus_auto_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready =
    subsystem_fbus_auto_bus_xing_out_d_ready; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready =
    subsystem_cbus_auto_bus_xing_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid =
    subsystem_cbus_auto_bus_xing_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode =
    subsystem_cbus_auto_bus_xing_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param =
    subsystem_cbus_auto_bus_xing_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size =
    subsystem_cbus_auto_bus_xing_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source =
    subsystem_cbus_auto_bus_xing_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink =
    subsystem_cbus_auto_bus_xing_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied =
    subsystem_cbus_auto_bus_xing_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data =
    subsystem_cbus_auto_bus_xing_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt =
    subsystem_cbus_auto_bus_xing_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock =
    auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock; // @[LazyModule.scala 309:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset =
    auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset; // @[LazyModule.scala 309:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock =
    auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset =
    auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset; // @[LazyModule.scala 309:16]
  assign subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_ready =
    domain_1_auto_resetCtrl_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_valid =
    domain_1_auto_resetCtrl_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_opcode =
    domain_1_auto_resetCtrl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_param =
    domain_1_auto_resetCtrl_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_size =
    domain_1_auto_resetCtrl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_source =
    domain_1_auto_resetCtrl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_sink =
    domain_1_auto_resetCtrl_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_denied =
    domain_1_auto_resetCtrl_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_data =
    domain_1_auto_resetCtrl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_bits_corrupt =
    domain_1_auto_resetCtrl_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_ready =
    uartClockDomainWrapper_auto_uart_0_control_xing_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_valid =
    uartClockDomainWrapper_auto_uart_0_control_xing_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_opcode =
    uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_param =
    uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_size =
    uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_source =
    uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_sink =
    uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_denied =
    uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_data =
    uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_corrupt =
    uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock =
    auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset =
    auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset; // @[LazyModule.scala 309:16]
  assign subsystem_pbus_auto_bus_xing_in_a_valid =
    subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid; // @[LazyModule.scala 296:16]
  assign subsystem_pbus_auto_bus_xing_in_a_bits_opcode =
    subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_pbus_auto_bus_xing_in_a_bits_param =
    subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_pbus_auto_bus_xing_in_a_bits_size =
    subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_pbus_auto_bus_xing_in_a_bits_source =
    subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_pbus_auto_bus_xing_in_a_bits_address =
    subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_pbus_auto_bus_xing_in_a_bits_mask =
    subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign subsystem_pbus_auto_bus_xing_in_a_bits_data =
    subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_pbus_auto_bus_xing_in_a_bits_corrupt =
    subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_pbus_auto_bus_xing_in_d_ready =
    subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_valid =
    domain_auto_serdesser_client_out_a_valid; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_opcode =
    domain_auto_serdesser_client_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_param =
    domain_auto_serdesser_client_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_size =
    domain_auto_serdesser_client_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_source =
    domain_auto_serdesser_client_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_address =
    domain_auto_serdesser_client_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_mask =
    domain_auto_serdesser_client_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_data =
    domain_auto_serdesser_client_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_bits_corrupt =
    domain_auto_serdesser_client_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_ready =
    domain_auto_serdesser_client_out_d_ready; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock =
    auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset =
    auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_bus_xing_out_a_ready =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_valid =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_opcode =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_param =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_size =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_source =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_sink =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_denied =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_data =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_corrupt =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready = bootROMDomainWrapper_auto_bootrom_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid = bootROMDomainWrapper_auto_bootrom_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_opcode =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_param =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_sink =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_denied =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_corrupt =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_ready = debug_1_auto_dmInner_dmInner_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_valid = debug_1_auto_dmInner_dmInner_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode =
    debug_1_auto_dmInner_dmInner_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_param =
    debug_1_auto_dmInner_dmInner_tl_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size =
    debug_1_auto_dmInner_dmInner_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source =
    debug_1_auto_dmInner_dmInner_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_sink =
    debug_1_auto_dmInner_dmInner_tl_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_denied =
    debug_1_auto_dmInner_dmInner_tl_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data =
    debug_1_auto_dmInner_dmInner_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_corrupt =
    debug_1_auto_dmInner_dmInner_tl_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_ready = clint_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_valid = clint_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode = clint_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_param = clint_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size = clint_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source = clint_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_sink = clint_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_denied = clint_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data = clint_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_corrupt = clint_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_ready = plicDomainWrapper_auto_plic_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_valid = plicDomainWrapper_auto_plic_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode = plicDomainWrapper_auto_plic_in_d_bits_opcode
    ; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_param = plicDomainWrapper_auto_plic_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size = plicDomainWrapper_auto_plic_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source = plicDomainWrapper_auto_plic_in_d_bits_source
    ; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_sink = plicDomainWrapper_auto_plic_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_denied = plicDomainWrapper_auto_plic_in_d_bits_denied
    ; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data = plicDomainWrapper_auto_plic_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_corrupt =
    plicDomainWrapper_auto_plic_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_ready =
    subsystem_pbus_auto_bus_xing_in_a_ready; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_valid =
    subsystem_pbus_auto_bus_xing_in_d_valid; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode =
    subsystem_pbus_auto_bus_xing_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param =
    subsystem_pbus_auto_bus_xing_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size =
    subsystem_pbus_auto_bus_xing_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source =
    subsystem_pbus_auto_bus_xing_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink =
    subsystem_pbus_auto_bus_xing_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied =
    subsystem_pbus_auto_bus_xing_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data =
    subsystem_pbus_auto_bus_xing_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt =
    subsystem_pbus_auto_bus_xing_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock =
    auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset =
    auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset; // @[LazyModule.scala 309:16]
  assign subsystem_cbus_auto_bus_xing_in_a_valid =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_opcode =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_param =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_size =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_source =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_address =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_mask =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_data =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_corrupt =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_d_ready =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_custom_boot = custom_boot; // @[CustomBootPin.scala 81:16]
  assign subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_ready =
    domain_auto_tlserial_manager_crossing_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_valid =
    domain_auto_tlserial_manager_crossing_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_opcode =
    domain_auto_tlserial_manager_crossing_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_param =
    domain_auto_tlserial_manager_crossing_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_size =
    domain_auto_tlserial_manager_crossing_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_source =
    domain_auto_tlserial_manager_crossing_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_sink =
    domain_auto_tlserial_manager_crossing_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_denied =
    domain_auto_tlserial_manager_crossing_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_data =
    domain_auto_tlserial_manager_crossing_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_bits_corrupt =
    domain_auto_tlserial_manager_crossing_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready = mem_axi4_0_aw_ready; // @[Nodes.scala 1210:84 Nodes.scala 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready = mem_axi4_0_w_ready; // @[Nodes.scala 1210:84 Nodes.scala 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid = mem_axi4_0_b_valid; // @[Nodes.scala 1210:84 Nodes.scala 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id = mem_axi4_0_b_bits_id; // @[Nodes.scala 1210:84 Nodes.scala 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp =
    mem_axi4_0_b_bits_resp; // @[Nodes.scala 1210:84 Nodes.scala 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready = mem_axi4_0_ar_ready; // @[Nodes.scala 1210:84 Nodes.scala 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid = mem_axi4_0_r_valid; // @[Nodes.scala 1210:84 Nodes.scala 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id = mem_axi4_0_r_bits_id; // @[Nodes.scala 1210:84 Nodes.scala 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data =
    mem_axi4_0_r_bits_data; // @[Nodes.scala 1210:84 Nodes.scala 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp =
    mem_axi4_0_r_bits_resp; // @[Nodes.scala 1210:84 Nodes.scala 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last =
    mem_axi4_0_r_bits_last; // @[Nodes.scala 1210:84 Nodes.scala 1694:56]
  assign subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock =
    auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset =
    auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset; // @[LazyModule.scala 309:16]
  assign subsystem_mbus_auto_bus_xing_in_a_valid =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_opcode =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_param =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_size =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_source =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_address =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_mask =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_data =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_corrupt =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_d_ready =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready =
    subsystem_mbus_auto_bus_xing_in_a_ready; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid =
    subsystem_mbus_auto_bus_xing_in_d_valid; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode =
    subsystem_mbus_auto_bus_xing_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_param =
    subsystem_mbus_auto_bus_xing_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size =
    subsystem_mbus_auto_bus_xing_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source =
    subsystem_mbus_auto_bus_xing_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_sink =
    subsystem_mbus_auto_bus_xing_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied =
    subsystem_mbus_auto_bus_xing_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data =
    subsystem_mbus_auto_bus_xing_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt =
    subsystem_mbus_auto_bus_xing_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_valid =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_opcode =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_param =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_size =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_source =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_address =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_mask =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_data =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_corrupt =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_b_ready =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_valid =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_opcode =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_param =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_size =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_source =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_address =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_data =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_corrupt =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_d_ready =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_e_valid =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_e_bits_sink =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset; // @[LazyModule.scala 298:16]
  assign tile_prci_domain_auto_intsink_in_sync_0 = debug_1_auto_dmOuter_intsource_out_sync_0; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_rnmi = 1'h0; // @[LazyModule.scala 298:16]
  assign tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_rnmi_interrupt_vector = 32'h0; // @[LazyModule.scala 298:16]
  assign tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_rnmi_exception_vector = 32'h0; // @[LazyModule.scala 298:16]
  assign tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_unmi = 1'h0; // @[LazyModule.scala 298:16]
  assign tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_unmi_interrupt_vector = 32'h0; // @[LazyModule.scala 298:16]
  assign tile_prci_domain_auto_tile_reset_domain_boom_tile_nmi_in_unmi_exception_vector = 32'h0; // @[LazyModule.scala 298:16]
  assign tile_prci_domain_auto_tile_reset_domain_boom_tile_reset_vector_in = broadcast_auto_out; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tile_reset_domain_boom_tile_hartid_in = tileHartIdNexusNode_auto_out; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_int_in_clock_xing_in_2_sync_0 = intsource_2_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign tile_prci_domain_auto_int_in_clock_xing_in_1_sync_0 = intsource_1_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign tile_prci_domain_auto_int_in_clock_xing_in_0_sync_0 = intsource_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign tile_prci_domain_auto_int_in_clock_xing_in_0_sync_1 = intsource_auto_out_sync_1; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_a_ready =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_valid =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_opcode =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_opcode; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_param =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_size =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_size; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_source =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_source; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_address =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_mask =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_mask; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_data =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_data; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_corrupt =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_corrupt; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_c_ready =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_valid =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_opcode =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_param =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_size =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_source =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_sink =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_denied =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_data =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_corrupt =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_e_ready =
    subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_ready; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tap_clock_in_clock = subsystem_sbus_auto_fixedClockNode_out_1_clock; // @[LazyModule.scala 298:16]
  assign tile_prci_domain_auto_tap_clock_in_reset = subsystem_sbus_auto_fixedClockNode_out_1_reset; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_int_in_0 = ibus_auto_int_bus_int_out_0; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_valid = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_opcode = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode
    ; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_param = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_size = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_source = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source
    ; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_address =
    subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_mask = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_data = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_corrupt =
    subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_d_ready = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_clock_in_clock = subsystem_cbus_auto_fixedClockNode_out_0_clock; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_clock_in_reset = subsystem_cbus_auto_fixedClockNode_out_0_reset; // @[LazyModule.scala 298:16]
  assign clint_clock = subsystem_cbus_clock; // @[CLINT.scala 115:26]
  assign clint_reset = subsystem_cbus_reset; // @[CLINT.scala 116:26]
  assign clint_auto_in_a_valid = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_opcode = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_param = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_size = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_source = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_address = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_mask = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_data = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_corrupt = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign clint_auto_in_d_ready = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready; // @[LazyModule.scala 298:16]
  assign clint_io_rtcTick = int_rtc_tick_value == 7'h63; // @[Counter.scala 72:24]
  assign debugCustomXbarOpt_clock = clock;
  assign debugCustomXbarOpt_reset = reset;
  assign debugCustomXbarOpt_auto_out_addr = debug_1_auto_dmInner_dmInner_custom_in_addr; // @[LazyModule.scala 298:16]
  assign debugCustomXbarOpt_auto_out_valid = debug_1_auto_dmInner_dmInner_custom_in_valid; // @[LazyModule.scala 298:16]
  assign debug_1_auto_dmInner_dmInner_custom_in_ready = debugCustomXbarOpt_auto_out_ready; // @[LazyModule.scala 298:16]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_valid = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid; // @[LazyModule.scala 298:16]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_opcode =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_param =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_size =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_source =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_address =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_mask =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_data =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign debug_1_auto_dmInner_dmInner_tl_in_a_bits_corrupt =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign debug_1_auto_dmInner_dmInner_tl_in_d_ready = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready; // @[LazyModule.scala 298:16]
  assign debug_1_io_debug_clock = debug_clock; // @[Periphery.scala 144:38]
  assign debug_1_io_debug_reset = debug_reset; // @[Periphery.scala 143:38]
  assign debug_1_io_tl_clock = subsystem_cbus_auto_fixedClockNode_out_1_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign debug_1_io_tl_reset = subsystem_cbus_auto_fixedClockNode_out_1_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign debug_1_io_ctrl_debugUnavail_0 = 1'h0; // @[Periphery.scala 152:56]
  assign debug_1_io_ctrl_dmactiveAck = debug_dmactiveAck; // @[Periphery.scala 148:43]
  assign debug_1_io_dmi_dmi_req_valid = dtm_io_dmi_req_valid; // @[Periphery.scala 174:40]
  assign debug_1_io_dmi_dmi_req_bits_addr = dtm_io_dmi_req_bits_addr; // @[Periphery.scala 174:40]
  assign debug_1_io_dmi_dmi_req_bits_data = dtm_io_dmi_req_bits_data; // @[Periphery.scala 174:40]
  assign debug_1_io_dmi_dmi_req_bits_op = dtm_io_dmi_req_bits_op; // @[Periphery.scala 174:40]
  assign debug_1_io_dmi_dmi_resp_ready = dtm_io_dmi_resp_ready; // @[Periphery.scala 174:40]
  assign debug_1_io_dmi_dmiClock = debug_systemjtag_jtag_TCK; // @[Periphery.scala 175:45]
  assign debug_1_io_dmi_dmiReset = debug_systemjtag_reset; // @[Periphery.scala 176:45]
  assign debug_1_io_hartIsInReset_0 = resetctrl_hartIsInReset_0; // @[Periphery.scala 113:40]
  assign xbar_clock = clock;
  assign xbar_reset = reset;
  assign xbar_auto_int_in_0 = intsink_1_auto_out_0; // @[LazyModule.scala 296:16]
  assign xbar_1_clock = clock;
  assign xbar_1_reset = reset;
  assign xbar_1_auto_int_in_0 = intsink_2_auto_out_0; // @[LazyModule.scala 296:16]
  assign xbar_2_clock = clock;
  assign xbar_2_reset = reset;
  assign xbar_2_auto_int_in_0 = intsink_3_auto_out_0; // @[LazyModule.scala 296:16]
  assign tileHartIdNexusNode_clock = clock;
  assign tileHartIdNexusNode_reset = reset;
  assign broadcast_clock = clock;
  assign broadcast_reset = reset;
  assign broadcast_auto_in = 32'h10040; // @[Nodes.scala 1207:84 BootROM.scala 91:43]
  assign intsource_clock = clock;
  assign intsource_reset = reset;
  assign intsource_auto_in_0 = clint_auto_int_out_0; // @[LazyModule.scala 298:16]
  assign intsource_auto_in_1 = clint_auto_int_out_1; // @[LazyModule.scala 298:16]
  assign intsource_1_clock = clock;
  assign intsource_1_reset = reset;
  assign intsource_1_auto_in_0 = plicDomainWrapper_auto_plic_int_out_0_0; // @[LazyModule.scala 298:16]
  assign intsource_2_clock = clock;
  assign intsource_2_reset = reset;
  assign intsource_2_auto_in_0 = plicDomainWrapper_auto_plic_int_out_1_0; // @[LazyModule.scala 298:16]
  assign intsink_clock = clock;
  assign intsink_reset = reset;
  assign intsink_1_clock = clock;
  assign intsink_1_reset = reset;
  assign intsink_1_auto_in_sync_0 = tile_prci_domain_auto_int_out_clock_xing_out_0_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign intsink_2_clock = clock;
  assign intsink_2_reset = reset;
  assign intsink_2_auto_in_sync_0 = tile_prci_domain_auto_int_out_clock_xing_out_1_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign intsink_3_clock = clock;
  assign intsink_3_reset = reset;
  assign intsink_3_auto_in_sync_0 = tile_prci_domain_auto_int_out_clock_xing_out_2_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_valid = subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_opcode =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_param =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_size =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_source =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_address =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_mask =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_data =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_corrupt =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_d_ready = subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_clock_in_clock = subsystem_cbus_auto_fixedClockNode_out_2_clock; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_clock_in_reset = subsystem_cbus_auto_fixedClockNode_out_2_reset; // @[LazyModule.scala 298:16]
  assign domain_auto_serdesser_client_out_a_ready =
    subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_a_ready; // @[LazyModule.scala 296:16]
  assign domain_auto_serdesser_client_out_d_valid =
    subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_valid; // @[LazyModule.scala 296:16]
  assign domain_auto_serdesser_client_out_d_bits_opcode =
    subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign domain_auto_serdesser_client_out_d_bits_param =
    subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign domain_auto_serdesser_client_out_d_bits_size =
    subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign domain_auto_serdesser_client_out_d_bits_source =
    subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign domain_auto_serdesser_client_out_d_bits_sink =
    subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign domain_auto_serdesser_client_out_d_bits_denied =
    subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign domain_auto_serdesser_client_out_d_bits_data =
    subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign domain_auto_serdesser_client_out_d_bits_corrupt =
    subsystem_fbus_auto_coupler_from_port_named_serial_tl_ctrl_buffer_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign domain_auto_tlserial_manager_crossing_in_a_valid =
    subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_valid; // @[LazyModule.scala 298:16]
  assign domain_auto_tlserial_manager_crossing_in_a_bits_opcode =
    subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign domain_auto_tlserial_manager_crossing_in_a_bits_param =
    subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign domain_auto_tlserial_manager_crossing_in_a_bits_size =
    subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign domain_auto_tlserial_manager_crossing_in_a_bits_source =
    subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign domain_auto_tlserial_manager_crossing_in_a_bits_address =
    subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign domain_auto_tlserial_manager_crossing_in_a_bits_mask =
    subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign domain_auto_tlserial_manager_crossing_in_a_bits_data =
    subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign domain_auto_tlserial_manager_crossing_in_a_bits_corrupt =
    subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign domain_auto_tlserial_manager_crossing_in_d_ready =
    subsystem_mbus_auto_coupler_to_port_named_serial_tl_mem_tlserial_manager_crossing_out_d_ready; // @[LazyModule.scala 298:16]
  assign domain_auto_clock_in_clock = subsystem_fbus_auto_fixedClockNode_out_clock; // @[LazyModule.scala 298:16]
  assign domain_auto_clock_in_reset = subsystem_fbus_auto_fixedClockNode_out_reset; // @[LazyModule.scala 298:16]
  assign domain_serial_tl_in_valid = serial_tl_bits_in_valid; // @[SerialAdapter.scala 407:21]
  assign domain_serial_tl_in_bits = serial_tl_bits_in_bits; // @[SerialAdapter.scala 407:21]
  assign domain_serial_tl_out_ready = serial_tl_bits_out_ready; // @[SerialAdapter.scala 407:21]
  assign uartClockDomainWrapper_auto_uart_0_control_xing_in_a_valid =
    subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_valid; // @[LazyModule.scala 298:16]
  assign uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_opcode =
    subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_param =
    subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_size =
    subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_source =
    subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_address =
    subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_mask =
    subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_data =
    subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign uartClockDomainWrapper_auto_uart_0_control_xing_in_a_bits_corrupt =
    subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign uartClockDomainWrapper_auto_uart_0_control_xing_in_d_ready =
    subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_ready; // @[LazyModule.scala 298:16]
  assign uartClockDomainWrapper_auto_uart_0_io_out_rxd = uart_0_rxd; // @[Nodes.scala 1210:84 BundleBridge.scala 54:8]
  assign uartClockDomainWrapper_auto_clock_in_clock = subsystem_pbus_auto_fixedClockNode_out_0_clock; // @[LazyModule.scala 298:16]
  assign uartClockDomainWrapper_auto_clock_in_reset = subsystem_pbus_auto_fixedClockNode_out_0_reset; // @[LazyModule.scala 298:16]
  assign intsink_4_clock = clock;
  assign intsink_4_reset = reset;
  assign intsink_4_auto_in_sync_0 = uartClockDomainWrapper_auto_uart_0_int_xing_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign domain_1_auto_resetCtrl_async_reset_sink_in_clock = auto_domain_resetCtrl_async_reset_sink_in_clock; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_async_reset_sink_in_reset = auto_domain_resetCtrl_async_reset_sink_in_reset; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset =
    auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset; // @[LazyModule.scala 309:16]
  assign domain_1_auto_resetCtrl_in_a_valid =
    subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_valid; // @[LazyModule.scala 298:16]
  assign domain_1_auto_resetCtrl_in_a_bits_opcode =
    subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign domain_1_auto_resetCtrl_in_a_bits_param =
    subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign domain_1_auto_resetCtrl_in_a_bits_size =
    subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign domain_1_auto_resetCtrl_in_a_bits_source =
    subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign domain_1_auto_resetCtrl_in_a_bits_address =
    subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign domain_1_auto_resetCtrl_in_a_bits_mask =
    subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign domain_1_auto_resetCtrl_in_a_bits_data =
    subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign domain_1_auto_resetCtrl_in_a_bits_corrupt =
    subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign domain_1_auto_resetCtrl_in_d_ready =
    subsystem_pbus_auto_coupler_to_slave_named_tileresetctrl_buffer_out_d_ready; // @[LazyModule.scala 298:16]
  assign domain_1_auto_clock_in_clock = subsystem_pbus_auto_fixedClockNode_out_1_clock; // @[LazyModule.scala 298:16]
  assign domain_1_auto_clock_in_reset = subsystem_pbus_auto_fixedClockNode_out_1_reset; // @[LazyModule.scala 298:16]
  assign dtm_io_jtag_clock = debug_systemjtag_jtag_TCK; // @[Periphery.scala 166:24]
  assign dtm_io_jtag_reset = debug_systemjtag_reset; // @[Periphery.scala 167:24]
  assign dtm_io_dmi_req_ready = debug_1_io_dmi_dmi_req_ready; // @[Periphery.scala 174:40]
  assign dtm_io_dmi_resp_valid = debug_1_io_dmi_dmi_resp_valid; // @[Periphery.scala 174:40]
  assign dtm_io_dmi_resp_bits_data = debug_1_io_dmi_dmi_resp_bits_data; // @[Periphery.scala 174:40]
  assign dtm_io_dmi_resp_bits_resp = debug_1_io_dmi_dmi_resp_bits_resp; // @[Periphery.scala 174:40]
  assign dtm_io_jtag_TCK = debug_systemjtag_jtag_TCK; // @[Periphery.scala 162:17]
  assign dtm_io_jtag_TMS = debug_systemjtag_jtag_TMS; // @[Periphery.scala 162:17]
  assign dtm_io_jtag_TDI = debug_systemjtag_jtag_TDI; // @[Periphery.scala 162:17]
  assign dtm_io_jtag_mfr_id = debug_systemjtag_mfr_id; // @[Periphery.scala 168:24]
  assign dtm_io_jtag_part_number = debug_systemjtag_part_number; // @[Periphery.scala 169:29]
  assign dtm_io_jtag_version = debug_systemjtag_version; // @[Periphery.scala 170:25]
  assign dtm_rf_reset = debug_systemjtag_reset; // @[Periphery.scala 171:18]
  always @(posedge subsystem_pbus_clock) begin
    if (subsystem_pbus_reset) begin // @[Counter.scala 60:40]
      int_rtc_tick_value <= 7'h0; // @[Counter.scala 60:40]
    end else if (int_rtc_tick_wrap_wrap) begin // @[Counter.scala 86:20]
      int_rtc_tick_value <= 7'h0; // @[Counter.scala 86:28]
    end else begin
      int_rtc_tick_value <= _int_rtc_tick_wrap_value_T_1; // @[Counter.scala 76:15]
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
  int_rtc_tick_value = _RAND_0[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
