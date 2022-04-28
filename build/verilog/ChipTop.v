module ChipTop(
  input         jtag_TCK,
  input         jtag_TMS,
  input         jtag_TDI,
  output        jtag_TDO,
  output        serial_tl_clock,
  output        serial_tl_bits_in_ready,
  input         serial_tl_bits_in_valid,
  input  [3:0]  serial_tl_bits_in_bits,
  input         serial_tl_bits_out_ready,
  output        serial_tl_bits_out_valid,
  output [3:0]  serial_tl_bits_out_bits,
  input         custom_boot,
  output        axi4_mem_0_clock,
  output        axi4_mem_0_reset,
  input         axi4_mem_0_bits_aw_ready,
  output        axi4_mem_0_bits_aw_valid,
  output [3:0]  axi4_mem_0_bits_aw_bits_id,
  output [31:0] axi4_mem_0_bits_aw_bits_addr,
  output [7:0]  axi4_mem_0_bits_aw_bits_len,
  output [2:0]  axi4_mem_0_bits_aw_bits_size,
  output [1:0]  axi4_mem_0_bits_aw_bits_burst,
  output        axi4_mem_0_bits_aw_bits_lock,
  output [3:0]  axi4_mem_0_bits_aw_bits_cache,
  output [2:0]  axi4_mem_0_bits_aw_bits_prot,
  output [3:0]  axi4_mem_0_bits_aw_bits_qos,
  input         axi4_mem_0_bits_w_ready,
  output        axi4_mem_0_bits_w_valid,
  output [63:0] axi4_mem_0_bits_w_bits_data,
  output [7:0]  axi4_mem_0_bits_w_bits_strb,
  output        axi4_mem_0_bits_w_bits_last,
  output        axi4_mem_0_bits_b_ready,
  input         axi4_mem_0_bits_b_valid,
  input  [3:0]  axi4_mem_0_bits_b_bits_id,
  input  [1:0]  axi4_mem_0_bits_b_bits_resp,
  input         axi4_mem_0_bits_ar_ready,
  output        axi4_mem_0_bits_ar_valid,
  output [3:0]  axi4_mem_0_bits_ar_bits_id,
  output [31:0] axi4_mem_0_bits_ar_bits_addr,
  output [7:0]  axi4_mem_0_bits_ar_bits_len,
  output [2:0]  axi4_mem_0_bits_ar_bits_size,
  output [1:0]  axi4_mem_0_bits_ar_bits_burst,
  output        axi4_mem_0_bits_ar_bits_lock,
  output [3:0]  axi4_mem_0_bits_ar_bits_cache,
  output [2:0]  axi4_mem_0_bits_ar_bits_prot,
  output [3:0]  axi4_mem_0_bits_ar_bits_qos,
  output        axi4_mem_0_bits_r_ready,
  input         axi4_mem_0_bits_r_valid,
  input  [3:0]  axi4_mem_0_bits_r_bits_id,
  input  [63:0] axi4_mem_0_bits_r_bits_data,
  input  [1:0]  axi4_mem_0_bits_r_bits_resp,
  input         axi4_mem_0_bits_r_bits_last,
  output        uart_0_txd,
  input         uart_0_rxd,
  input         reset,
  input         clock
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  system_clock; // @[ChipTop.scala 32:35]
  wire  system_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_async_reset_sink_in_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_async_reset_sink_in_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_mbus_fixedClockNode_out_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_mbus_fixedClockNode_out_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_cbus_fixedClockNode_out_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_cbus_fixedClockNode_out_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock; // @[ChipTop.scala 32:35]
  wire  system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_aw_ready; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_aw_valid; // @[ChipTop.scala 32:35]
  wire [3:0] system_mem_axi4_0_aw_bits_id; // @[ChipTop.scala 32:35]
  wire [31:0] system_mem_axi4_0_aw_bits_addr; // @[ChipTop.scala 32:35]
  wire [7:0] system_mem_axi4_0_aw_bits_len; // @[ChipTop.scala 32:35]
  wire [2:0] system_mem_axi4_0_aw_bits_size; // @[ChipTop.scala 32:35]
  wire [1:0] system_mem_axi4_0_aw_bits_burst; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_aw_bits_lock; // @[ChipTop.scala 32:35]
  wire [3:0] system_mem_axi4_0_aw_bits_cache; // @[ChipTop.scala 32:35]
  wire [2:0] system_mem_axi4_0_aw_bits_prot; // @[ChipTop.scala 32:35]
  wire [3:0] system_mem_axi4_0_aw_bits_qos; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_w_ready; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_w_valid; // @[ChipTop.scala 32:35]
  wire [63:0] system_mem_axi4_0_w_bits_data; // @[ChipTop.scala 32:35]
  wire [7:0] system_mem_axi4_0_w_bits_strb; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_w_bits_last; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_b_ready; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_b_valid; // @[ChipTop.scala 32:35]
  wire [3:0] system_mem_axi4_0_b_bits_id; // @[ChipTop.scala 32:35]
  wire [1:0] system_mem_axi4_0_b_bits_resp; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_ar_ready; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_ar_valid; // @[ChipTop.scala 32:35]
  wire [3:0] system_mem_axi4_0_ar_bits_id; // @[ChipTop.scala 32:35]
  wire [31:0] system_mem_axi4_0_ar_bits_addr; // @[ChipTop.scala 32:35]
  wire [7:0] system_mem_axi4_0_ar_bits_len; // @[ChipTop.scala 32:35]
  wire [2:0] system_mem_axi4_0_ar_bits_size; // @[ChipTop.scala 32:35]
  wire [1:0] system_mem_axi4_0_ar_bits_burst; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_ar_bits_lock; // @[ChipTop.scala 32:35]
  wire [3:0] system_mem_axi4_0_ar_bits_cache; // @[ChipTop.scala 32:35]
  wire [2:0] system_mem_axi4_0_ar_bits_prot; // @[ChipTop.scala 32:35]
  wire [3:0] system_mem_axi4_0_ar_bits_qos; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_r_ready; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_r_valid; // @[ChipTop.scala 32:35]
  wire [3:0] system_mem_axi4_0_r_bits_id; // @[ChipTop.scala 32:35]
  wire [63:0] system_mem_axi4_0_r_bits_data; // @[ChipTop.scala 32:35]
  wire [1:0] system_mem_axi4_0_r_bits_resp; // @[ChipTop.scala 32:35]
  wire  system_mem_axi4_0_r_bits_last; // @[ChipTop.scala 32:35]
  wire  system_custom_boot; // @[ChipTop.scala 32:35]
  wire  system_serial_tl_clock; // @[ChipTop.scala 32:35]
  wire  system_serial_tl_bits_in_ready; // @[ChipTop.scala 32:35]
  wire  system_serial_tl_bits_in_valid; // @[ChipTop.scala 32:35]
  wire [3:0] system_serial_tl_bits_in_bits; // @[ChipTop.scala 32:35]
  wire  system_serial_tl_bits_out_ready; // @[ChipTop.scala 32:35]
  wire  system_serial_tl_bits_out_valid; // @[ChipTop.scala 32:35]
  wire [3:0] system_serial_tl_bits_out_bits; // @[ChipTop.scala 32:35]
  wire  system_resetctrl_hartIsInReset_0; // @[ChipTop.scala 32:35]
  wire  system_debug_clock; // @[ChipTop.scala 32:35]
  wire  system_debug_reset; // @[ChipTop.scala 32:35]
  wire  system_debug_systemjtag_jtag_TCK; // @[ChipTop.scala 32:35]
  wire  system_debug_systemjtag_jtag_TMS; // @[ChipTop.scala 32:35]
  wire  system_debug_systemjtag_jtag_TDI; // @[ChipTop.scala 32:35]
  wire  system_debug_systemjtag_jtag_TDO_data; // @[ChipTop.scala 32:35]
  wire  system_debug_systemjtag_jtag_TDO_driven; // @[ChipTop.scala 32:35]
  wire  system_debug_systemjtag_reset; // @[ChipTop.scala 32:35]
  wire [10:0] system_debug_systemjtag_mfr_id; // @[ChipTop.scala 32:35]
  wire [15:0] system_debug_systemjtag_part_number; // @[ChipTop.scala 32:35]
  wire [3:0] system_debug_systemjtag_version; // @[ChipTop.scala 32:35]
  wire  system_debug_ndreset; // @[ChipTop.scala 32:35]
  wire  system_debug_dmactive; // @[ChipTop.scala 32:35]
  wire  system_debug_dmactiveAck; // @[ChipTop.scala 32:35]
  wire  system_uart_0_txd; // @[ChipTop.scala 32:35]
  wire  system_uart_0_rxd; // @[ChipTop.scala 32:35]
  wire  aggregator_auto_in_member_allClocks_subsystem_cbus_0_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_subsystem_cbus_0_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_subsystem_mbus_0_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_subsystem_mbus_0_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_subsystem_fbus_0_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_subsystem_fbus_0_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_subsystem_pbus_0_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_subsystem_pbus_0_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_subsystem_sbus_1_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_subsystem_sbus_1_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_subsystem_sbus_0_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_subsystem_sbus_0_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_implicit_clock_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_in_member_allClocks_implicit_clock_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_5_member_subsystem_cbus_subsystem_cbus_0_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_5_member_subsystem_cbus_subsystem_cbus_0_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_4_member_subsystem_mbus_subsystem_mbus_0_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_4_member_subsystem_mbus_subsystem_mbus_0_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_1_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_1_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_reset; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_clock; // @[Clocks.scala 79:32]
  wire  aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_reset; // @[Clocks.scala 79:32]
  wire  dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_clock; // @[ClockGroup.scala 32:69]
  wire  dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_reset; // @[ClockGroup.scala 32:69]
  wire  dividerOnlyClockGenerator_auto_out_clock; // @[ClockGroup.scala 32:69]
  wire  dividerOnlyClockGenerator_auto_out_reset; // @[ClockGroup.scala 32:69]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_4_member_subsystem_cbus_subsystem_cbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_4_member_subsystem_cbus_subsystem_cbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_mbus_subsystem_mbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_mbus_subsystem_mbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_1_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_1_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_4_member_subsystem_cbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_4_member_subsystem_cbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_mbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_mbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_1_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_1_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_clock; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_reset; // @[ClockGroupNamePrefixer.scala 32:15]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_in_clock; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_in_reset; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_clock; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_reset; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_clock; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_reset; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_clock; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_reset; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_clock; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_reset; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_clock; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_reset; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_clock; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_reset; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_clock; // @[Clocks.scala 90:45]
  wire  dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_reset; // @[Clocks.scala 90:45]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_mbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_mbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_1_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_1_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_mbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_mbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_1_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_1_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset; // @[ClockGroupNamePrefixer.scala 68:15]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_mbus_0_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_mbus_0_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_1_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_1_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_mbus_0_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_mbus_0_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_1_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_1_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_reset; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_clock; // @[ResetSynchronizer.scala 42:69]
  wire  dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_reset; // @[ResetSynchronizer.scala 42:69]
  wire  asyncResetBroadcast_auto_in_clock; // @[ClockGroup.scala 106:107]
  wire  asyncResetBroadcast_auto_in_reset; // @[ClockGroup.scala 106:107]
  wire  asyncResetBroadcast_auto_out_clock; // @[ClockGroup.scala 106:107]
  wire  asyncResetBroadcast_auto_out_reset; // @[ClockGroup.scala 106:107]
  wire  system_debug_systemjtag_reset_catcher_clock; // @[ResetCatchAndSync.scala 39:28]
  wire  system_debug_systemjtag_reset_catcher_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  system_debug_systemjtag_reset_catcher_io_sync_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  system_debug_systemjtag_reset_catcher_io_psd_test_mode; // @[ResetCatchAndSync.scala 39:28]
  wire  system_debug_systemjtag_reset_catcher_io_psd_test_mode_reset; // @[ResetCatchAndSync.scala 39:28]
  wire  debug_reset_syncd_debug_reset_sync_clock; // @[ShiftReg.scala 45:23]
  wire  debug_reset_syncd_debug_reset_sync_reset; // @[ShiftReg.scala 45:23]
  wire  debug_reset_syncd_debug_reset_sync_io_d; // @[ShiftReg.scala 45:23]
  wire  debug_reset_syncd_debug_reset_sync_io_q; // @[ShiftReg.scala 45:23]
  wire  dmactiveAck_dmactiveAck_clock; // @[ShiftReg.scala 45:23]
  wire  dmactiveAck_dmactiveAck_reset; // @[ShiftReg.scala 45:23]
  wire  dmactiveAck_dmactiveAck_io_d; // @[ShiftReg.scala 45:23]
  wire  dmactiveAck_dmactiveAck_io_q; // @[ShiftReg.scala 45:23]
  wire  gated_clock_debug_clock_gate_in; // @[ClockGate.scala 24:20]
  wire  gated_clock_debug_clock_gate_test_en; // @[ClockGate.scala 24:20]
  wire  gated_clock_debug_clock_gate_en; // @[ClockGate.scala 24:20]
  wire  gated_clock_debug_clock_gate_out; // @[ClockGate.scala 24:20]
  wire  iocell_jtag_TDO_pad; // @[IOCell.scala 112:24]
  wire  iocell_jtag_TDO_o; // @[IOCell.scala 112:24]
  wire  iocell_jtag_TDO_oe; // @[IOCell.scala 112:24]
  wire  iocell_jtag_TDI_pad; // @[IOCell.scala 111:23]
  wire  iocell_jtag_TDI_i; // @[IOCell.scala 111:23]
  wire  iocell_jtag_TDI_ie; // @[IOCell.scala 111:23]
  wire  iocell_jtag_TMS_pad; // @[IOCell.scala 111:23]
  wire  iocell_jtag_TMS_i; // @[IOCell.scala 111:23]
  wire  iocell_jtag_TMS_ie; // @[IOCell.scala 111:23]
  wire  iocell_jtag_TCK_pad; // @[IOCell.scala 111:23]
  wire  iocell_jtag_TCK_i; // @[IOCell.scala 111:23]
  wire  iocell_jtag_TCK_ie; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_out_bits_pad; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_bits_o; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_bits_oe; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_bits_1_pad; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_bits_1_o; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_bits_1_oe; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_bits_2_pad; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_bits_2_o; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_bits_2_oe; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_bits_3_pad; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_bits_3_o; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_bits_3_oe; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_valid_pad; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_valid_o; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_valid_oe; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_out_ready_pad; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_out_ready_i; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_out_ready_ie; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_pad; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_i; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_ie; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_1_pad; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_1_i; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_1_ie; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_2_pad; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_2_i; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_2_ie; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_3_pad; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_3_i; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_bits_3_ie; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_valid_pad; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_valid_i; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_valid_ie; // @[IOCell.scala 111:23]
  wire  iocell_serial_tl_bits_in_ready_pad; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_in_ready_o; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_bits_in_ready_oe; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_clock_pad; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_clock_o; // @[IOCell.scala 112:24]
  wire  iocell_serial_tl_clock_oe; // @[IOCell.scala 112:24]
  wire  iocell_custom_boot_pad; // @[IOCell.scala 111:23]
  wire  iocell_custom_boot_i; // @[IOCell.scala 111:23]
  wire  iocell_custom_boot_ie; // @[IOCell.scala 111:23]
  wire  iocell_uart_0_rxd_pad; // @[IOCell.scala 111:23]
  wire  iocell_uart_0_rxd_i; // @[IOCell.scala 111:23]
  wire  iocell_uart_0_rxd_ie; // @[IOCell.scala 111:23]
  wire  iocell_uart_0_txd_pad; // @[IOCell.scala 112:24]
  wire  iocell_uart_0_txd_o; // @[IOCell.scala 112:24]
  wire  iocell_uart_0_txd_oe; // @[IOCell.scala 112:24]
  wire  iocell_reset_pad; // @[IOCell.scala 111:23]
  wire  iocell_reset_i; // @[IOCell.scala 111:23]
  wire  iocell_reset_ie; // @[IOCell.scala 111:23]
  wire  iocell_clock_pad; // @[IOCell.scala 111:23]
  wire  iocell_clock_i; // @[IOCell.scala 111:23]
  wire  iocell_clock_ie; // @[IOCell.scala 111:23]
  wire  _debug_reset_syncd_WIRE = debug_reset_syncd_debug_reset_sync_io_q; // @[ShiftReg.scala 48:24 ShiftReg.scala 48:24]
  wire  _T = ~_debug_reset_syncd_WIRE; // @[Periphery.scala 297:38]
  wire  bundleIn_0_clock = system_auto_subsystem_cbus_fixedClockNode_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  reg  clock_en; // @[Periphery.scala 299:29]
  wire [1:0] serial_tl_bits_out_bits_lo = {iocell_serial_tl_bits_out_bits_1_pad,iocell_serial_tl_bits_out_bits_pad}; // @[Cat.scala 30:58]
  wire [1:0] serial_tl_bits_out_bits_hi = {iocell_serial_tl_bits_out_bits_3_pad,iocell_serial_tl_bits_out_bits_2_pad}; // @[Cat.scala 30:58]
  wire [1:0] system_serial_tl_bits_in_bits_lo = {iocell_serial_tl_bits_in_bits_1_i,iocell_serial_tl_bits_in_bits_i}; // @[Cat.scala 30:58]
  wire [1:0] system_serial_tl_bits_in_bits_hi = {iocell_serial_tl_bits_in_bits_3_i,iocell_serial_tl_bits_in_bits_2_i}; // @[Cat.scala 30:58]
  DigitalTop system ( // @[ChipTop.scala 32:35]
    .clock(system_clock),
    .reset(system_reset),
    .auto_domain_resetCtrl_async_reset_sink_in_clock(system_auto_domain_resetCtrl_async_reset_sink_in_clock),
    .auto_domain_resetCtrl_async_reset_sink_in_reset(system_auto_domain_resetCtrl_async_reset_sink_in_reset),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock),
    .auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock),
    .auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset(
      system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset),
    .auto_subsystem_mbus_fixedClockNode_out_clock(system_auto_subsystem_mbus_fixedClockNode_out_clock),
    .auto_subsystem_mbus_fixedClockNode_out_reset(system_auto_subsystem_mbus_fixedClockNode_out_reset),
    .auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock(
      system_auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock),
    .auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset(
      system_auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset),
    .auto_subsystem_cbus_fixedClockNode_out_clock(system_auto_subsystem_cbus_fixedClockNode_out_clock),
    .auto_subsystem_cbus_fixedClockNode_out_reset(system_auto_subsystem_cbus_fixedClockNode_out_reset),
    .auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock(
      system_auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock),
    .auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset(
      system_auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset),
    .auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock(
      system_auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock),
    .auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset(
      system_auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset),
    .auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock(
      system_auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset(
      system_auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock(
      system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock),
    .auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset(
      system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset),
    .auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock(
      system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock),
    .auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset(
      system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset),
    .mem_axi4_0_aw_ready(system_mem_axi4_0_aw_ready),
    .mem_axi4_0_aw_valid(system_mem_axi4_0_aw_valid),
    .mem_axi4_0_aw_bits_id(system_mem_axi4_0_aw_bits_id),
    .mem_axi4_0_aw_bits_addr(system_mem_axi4_0_aw_bits_addr),
    .mem_axi4_0_aw_bits_len(system_mem_axi4_0_aw_bits_len),
    .mem_axi4_0_aw_bits_size(system_mem_axi4_0_aw_bits_size),
    .mem_axi4_0_aw_bits_burst(system_mem_axi4_0_aw_bits_burst),
    .mem_axi4_0_aw_bits_lock(system_mem_axi4_0_aw_bits_lock),
    .mem_axi4_0_aw_bits_cache(system_mem_axi4_0_aw_bits_cache),
    .mem_axi4_0_aw_bits_prot(system_mem_axi4_0_aw_bits_prot),
    .mem_axi4_0_aw_bits_qos(system_mem_axi4_0_aw_bits_qos),
    .mem_axi4_0_w_ready(system_mem_axi4_0_w_ready),
    .mem_axi4_0_w_valid(system_mem_axi4_0_w_valid),
    .mem_axi4_0_w_bits_data(system_mem_axi4_0_w_bits_data),
    .mem_axi4_0_w_bits_strb(system_mem_axi4_0_w_bits_strb),
    .mem_axi4_0_w_bits_last(system_mem_axi4_0_w_bits_last),
    .mem_axi4_0_b_ready(system_mem_axi4_0_b_ready),
    .mem_axi4_0_b_valid(system_mem_axi4_0_b_valid),
    .mem_axi4_0_b_bits_id(system_mem_axi4_0_b_bits_id),
    .mem_axi4_0_b_bits_resp(system_mem_axi4_0_b_bits_resp),
    .mem_axi4_0_ar_ready(system_mem_axi4_0_ar_ready),
    .mem_axi4_0_ar_valid(system_mem_axi4_0_ar_valid),
    .mem_axi4_0_ar_bits_id(system_mem_axi4_0_ar_bits_id),
    .mem_axi4_0_ar_bits_addr(system_mem_axi4_0_ar_bits_addr),
    .mem_axi4_0_ar_bits_len(system_mem_axi4_0_ar_bits_len),
    .mem_axi4_0_ar_bits_size(system_mem_axi4_0_ar_bits_size),
    .mem_axi4_0_ar_bits_burst(system_mem_axi4_0_ar_bits_burst),
    .mem_axi4_0_ar_bits_lock(system_mem_axi4_0_ar_bits_lock),
    .mem_axi4_0_ar_bits_cache(system_mem_axi4_0_ar_bits_cache),
    .mem_axi4_0_ar_bits_prot(system_mem_axi4_0_ar_bits_prot),
    .mem_axi4_0_ar_bits_qos(system_mem_axi4_0_ar_bits_qos),
    .mem_axi4_0_r_ready(system_mem_axi4_0_r_ready),
    .mem_axi4_0_r_valid(system_mem_axi4_0_r_valid),
    .mem_axi4_0_r_bits_id(system_mem_axi4_0_r_bits_id),
    .mem_axi4_0_r_bits_data(system_mem_axi4_0_r_bits_data),
    .mem_axi4_0_r_bits_resp(system_mem_axi4_0_r_bits_resp),
    .mem_axi4_0_r_bits_last(system_mem_axi4_0_r_bits_last),
    .custom_boot(system_custom_boot),
    .serial_tl_clock(system_serial_tl_clock),
    .serial_tl_bits_in_ready(system_serial_tl_bits_in_ready),
    .serial_tl_bits_in_valid(system_serial_tl_bits_in_valid),
    .serial_tl_bits_in_bits(system_serial_tl_bits_in_bits),
    .serial_tl_bits_out_ready(system_serial_tl_bits_out_ready),
    .serial_tl_bits_out_valid(system_serial_tl_bits_out_valid),
    .serial_tl_bits_out_bits(system_serial_tl_bits_out_bits),
    .resetctrl_hartIsInReset_0(system_resetctrl_hartIsInReset_0),
    .debug_clock(system_debug_clock),
    .debug_reset(system_debug_reset),
    .debug_systemjtag_jtag_TCK(system_debug_systemjtag_jtag_TCK),
    .debug_systemjtag_jtag_TMS(system_debug_systemjtag_jtag_TMS),
    .debug_systemjtag_jtag_TDI(system_debug_systemjtag_jtag_TDI),
    .debug_systemjtag_jtag_TDO_data(system_debug_systemjtag_jtag_TDO_data),
    .debug_systemjtag_jtag_TDO_driven(system_debug_systemjtag_jtag_TDO_driven),
    .debug_systemjtag_reset(system_debug_systemjtag_reset),
    .debug_systemjtag_mfr_id(system_debug_systemjtag_mfr_id),
    .debug_systemjtag_part_number(system_debug_systemjtag_part_number),
    .debug_systemjtag_version(system_debug_systemjtag_version),
    .debug_ndreset(system_debug_ndreset),
    .debug_dmactive(system_debug_dmactive),
    .debug_dmactiveAck(system_debug_dmactiveAck),
    .uart_0_txd(system_uart_0_txd),
    .uart_0_rxd(system_uart_0_rxd)
  );
  ClockGroupAggregator_6 aggregator ( // @[Clocks.scala 79:32]
    .auto_in_member_allClocks_subsystem_cbus_0_clock(aggregator_auto_in_member_allClocks_subsystem_cbus_0_clock),
    .auto_in_member_allClocks_subsystem_cbus_0_reset(aggregator_auto_in_member_allClocks_subsystem_cbus_0_reset),
    .auto_in_member_allClocks_subsystem_mbus_0_clock(aggregator_auto_in_member_allClocks_subsystem_mbus_0_clock),
    .auto_in_member_allClocks_subsystem_mbus_0_reset(aggregator_auto_in_member_allClocks_subsystem_mbus_0_reset),
    .auto_in_member_allClocks_subsystem_fbus_0_clock(aggregator_auto_in_member_allClocks_subsystem_fbus_0_clock),
    .auto_in_member_allClocks_subsystem_fbus_0_reset(aggregator_auto_in_member_allClocks_subsystem_fbus_0_reset),
    .auto_in_member_allClocks_subsystem_pbus_0_clock(aggregator_auto_in_member_allClocks_subsystem_pbus_0_clock),
    .auto_in_member_allClocks_subsystem_pbus_0_reset(aggregator_auto_in_member_allClocks_subsystem_pbus_0_reset),
    .auto_in_member_allClocks_subsystem_sbus_1_clock(aggregator_auto_in_member_allClocks_subsystem_sbus_1_clock),
    .auto_in_member_allClocks_subsystem_sbus_1_reset(aggregator_auto_in_member_allClocks_subsystem_sbus_1_reset),
    .auto_in_member_allClocks_subsystem_sbus_0_clock(aggregator_auto_in_member_allClocks_subsystem_sbus_0_clock),
    .auto_in_member_allClocks_subsystem_sbus_0_reset(aggregator_auto_in_member_allClocks_subsystem_sbus_0_reset),
    .auto_in_member_allClocks_implicit_clock_clock(aggregator_auto_in_member_allClocks_implicit_clock_clock),
    .auto_in_member_allClocks_implicit_clock_reset(aggregator_auto_in_member_allClocks_implicit_clock_reset),
    .auto_out_5_member_subsystem_cbus_subsystem_cbus_0_clock(
      aggregator_auto_out_5_member_subsystem_cbus_subsystem_cbus_0_clock),
    .auto_out_5_member_subsystem_cbus_subsystem_cbus_0_reset(
      aggregator_auto_out_5_member_subsystem_cbus_subsystem_cbus_0_reset),
    .auto_out_4_member_subsystem_mbus_subsystem_mbus_0_clock(
      aggregator_auto_out_4_member_subsystem_mbus_subsystem_mbus_0_clock),
    .auto_out_4_member_subsystem_mbus_subsystem_mbus_0_reset(
      aggregator_auto_out_4_member_subsystem_mbus_subsystem_mbus_0_reset),
    .auto_out_3_member_subsystem_fbus_subsystem_fbus_0_clock(
      aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_clock),
    .auto_out_3_member_subsystem_fbus_subsystem_fbus_0_reset(
      aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_reset),
    .auto_out_2_member_subsystem_pbus_subsystem_pbus_0_clock(
      aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_clock),
    .auto_out_2_member_subsystem_pbus_subsystem_pbus_0_reset(
      aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_reset),
    .auto_out_1_member_subsystem_sbus_subsystem_sbus_1_clock(
      aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_1_clock),
    .auto_out_1_member_subsystem_sbus_subsystem_sbus_1_reset(
      aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_1_reset),
    .auto_out_1_member_subsystem_sbus_subsystem_sbus_0_clock(
      aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_clock),
    .auto_out_1_member_subsystem_sbus_subsystem_sbus_0_reset(
      aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_reset),
    .auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_clock(
      aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_clock),
    .auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_reset(
      aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_reset)
  );
  ClockGroup_6 dividerOnlyClockGenerator ( // @[ClockGroup.scala 32:69]
    .auto_in_member_dividerOnlyClockGenerator_implicit_clock_clock(
      dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_clock),
    .auto_in_member_dividerOnlyClockGenerator_implicit_clock_reset(
      dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_reset),
    .auto_out_clock(dividerOnlyClockGenerator_auto_out_clock),
    .auto_out_reset(dividerOnlyClockGenerator_auto_out_reset)
  );
  ClockGroupParameterModifier dividerOnlyClockGenerator_1 ( // @[ClockGroupNamePrefixer.scala 32:15]
    .auto_divider_only_clock_generator_in_4_member_subsystem_cbus_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_4_member_subsystem_cbus_subsystem_cbus_0_clock),
    .auto_divider_only_clock_generator_in_4_member_subsystem_cbus_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_4_member_subsystem_cbus_subsystem_cbus_0_reset),
    .auto_divider_only_clock_generator_in_3_member_subsystem_mbus_subsystem_mbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_mbus_subsystem_mbus_0_clock),
    .auto_divider_only_clock_generator_in_3_member_subsystem_mbus_subsystem_mbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_mbus_subsystem_mbus_0_reset),
    .auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_clock),
    .auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_reset),
    .auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_clock),
    .auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_reset),
    .auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_1_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_1_clock),
    .auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_1_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_1_reset),
    .auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_clock),
    .auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_reset),
    .auto_divider_only_clock_generator_out_4_member_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_4_member_subsystem_cbus_0_clock),
    .auto_divider_only_clock_generator_out_4_member_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_4_member_subsystem_cbus_0_reset),
    .auto_divider_only_clock_generator_out_3_member_subsystem_mbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_mbus_0_clock),
    .auto_divider_only_clock_generator_out_3_member_subsystem_mbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_mbus_0_reset),
    .auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_clock),
    .auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_reset),
    .auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_clock),
    .auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_reset),
    .auto_divider_only_clock_generator_out_0_member_subsystem_sbus_1_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_1_clock),
    .auto_divider_only_clock_generator_out_0_member_subsystem_sbus_1_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_1_reset),
    .auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_clock),
    .auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_reset)
  );
  DividerOnlyClockGenerator dividerOnlyClkGenerator ( // @[Clocks.scala 90:45]
    .auto_divider_only_clk_generator_in_clock(dividerOnlyClkGenerator_auto_divider_only_clk_generator_in_clock),
    .auto_divider_only_clk_generator_in_reset(dividerOnlyClkGenerator_auto_divider_only_clk_generator_in_reset),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_clock(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_reset(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_clock(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_clock),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_reset(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_reset),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_clock(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_reset(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_clock(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_reset(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_clock(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_clock),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_reset(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_reset),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_clock(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_reset(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_reset),
    .auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_clock(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_clock),
    .auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_reset(
      dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_reset)
  );
  ClockGroupParameterModifier_1 dividerOnlyClockGenerator_2 ( // @[ClockGroupNamePrefixer.scala 68:15]
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_reset),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_mbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_mbus_0_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_mbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_mbus_0_reset),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_reset),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_reset),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_1_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_1_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_1_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_1_reset),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_reset),
    .auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_clock),
    .auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_mbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_mbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_mbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_mbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_1_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_1_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_1_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_1_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset),
    .auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock),
    .auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset(
      dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset)
  );
  ClockGroupResetSynchronizer dividerOnlyClockGenerator_3 ( // @[ResetSynchronizer.scala 42:69]
    .auto_in_member_allClocks_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_clock),
    .auto_in_member_allClocks_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_reset),
    .auto_in_member_allClocks_subsystem_mbus_0_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_mbus_0_clock),
    .auto_in_member_allClocks_subsystem_mbus_0_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_mbus_0_reset),
    .auto_in_member_allClocks_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_clock),
    .auto_in_member_allClocks_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_reset),
    .auto_in_member_allClocks_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_clock),
    .auto_in_member_allClocks_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_reset),
    .auto_in_member_allClocks_subsystem_sbus_1_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_1_clock),
    .auto_in_member_allClocks_subsystem_sbus_1_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_1_reset),
    .auto_in_member_allClocks_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_clock),
    .auto_in_member_allClocks_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_reset),
    .auto_in_member_allClocks_implicit_clock_clock(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_clock),
    .auto_in_member_allClocks_implicit_clock_reset(
      dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_reset),
    .auto_out_member_allClocks_subsystem_cbus_0_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_out_member_allClocks_subsystem_cbus_0_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_out_member_allClocks_subsystem_mbus_0_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_mbus_0_clock),
    .auto_out_member_allClocks_subsystem_mbus_0_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_mbus_0_reset),
    .auto_out_member_allClocks_subsystem_fbus_0_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_out_member_allClocks_subsystem_fbus_0_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_out_member_allClocks_subsystem_pbus_0_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_out_member_allClocks_subsystem_pbus_0_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_out_member_allClocks_subsystem_sbus_1_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_1_clock),
    .auto_out_member_allClocks_subsystem_sbus_1_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_1_reset),
    .auto_out_member_allClocks_subsystem_sbus_0_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_out_member_allClocks_subsystem_sbus_0_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_reset),
    .auto_out_member_allClocks_implicit_clock_clock(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_clock),
    .auto_out_member_allClocks_implicit_clock_reset(
      dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_reset)
  );
  FixedClockBroadcast_7 asyncResetBroadcast ( // @[ClockGroup.scala 106:107]
    .auto_in_clock(asyncResetBroadcast_auto_in_clock),
    .auto_in_reset(asyncResetBroadcast_auto_in_reset),
    .auto_out_clock(asyncResetBroadcast_auto_out_clock),
    .auto_out_reset(asyncResetBroadcast_auto_out_reset)
  );
  ResetCatchAndSync_d3 system_debug_systemjtag_reset_catcher ( // @[ResetCatchAndSync.scala 39:28]
    .clock(system_debug_systemjtag_reset_catcher_clock),
    .reset(system_debug_systemjtag_reset_catcher_reset),
    .io_sync_reset(system_debug_systemjtag_reset_catcher_io_sync_reset),
    .io_psd_test_mode(system_debug_systemjtag_reset_catcher_io_psd_test_mode),
    .io_psd_test_mode_reset(system_debug_systemjtag_reset_catcher_io_psd_test_mode_reset)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 debug_reset_syncd_debug_reset_sync ( // @[ShiftReg.scala 45:23]
    .clock(debug_reset_syncd_debug_reset_sync_clock),
    .reset(debug_reset_syncd_debug_reset_sync_reset),
    .io_d(debug_reset_syncd_debug_reset_sync_io_d),
    .io_q(debug_reset_syncd_debug_reset_sync_io_q)
  );
  ResetSynchronizerShiftReg_w1_d3_i0 dmactiveAck_dmactiveAck ( // @[ShiftReg.scala 45:23]
    .clock(dmactiveAck_dmactiveAck_clock),
    .reset(dmactiveAck_dmactiveAck_reset),
    .io_d(dmactiveAck_dmactiveAck_io_d),
    .io_q(dmactiveAck_dmactiveAck_io_q)
  );
  EICG_wrapper gated_clock_debug_clock_gate ( // @[ClockGate.scala 24:20]
    .in(gated_clock_debug_clock_gate_in),
    .test_en(gated_clock_debug_clock_gate_test_en),
    .en(gated_clock_debug_clock_gate_en),
    .out(gated_clock_debug_clock_gate_out)
  );
  GenericDigitalOutIOCell iocell_jtag_TDO ( // @[IOCell.scala 112:24]
    .pad(iocell_jtag_TDO_pad),
    .o(iocell_jtag_TDO_o),
    .oe(iocell_jtag_TDO_oe)
  );
  GenericDigitalInIOCell iocell_jtag_TDI ( // @[IOCell.scala 111:23]
    .pad(iocell_jtag_TDI_pad),
    .i(iocell_jtag_TDI_i),
    .ie(iocell_jtag_TDI_ie)
  );
  GenericDigitalInIOCell iocell_jtag_TMS ( // @[IOCell.scala 111:23]
    .pad(iocell_jtag_TMS_pad),
    .i(iocell_jtag_TMS_i),
    .ie(iocell_jtag_TMS_ie)
  );
  GenericDigitalInIOCell iocell_jtag_TCK ( // @[IOCell.scala 111:23]
    .pad(iocell_jtag_TCK_pad),
    .i(iocell_jtag_TCK_i),
    .ie(iocell_jtag_TCK_ie)
  );
  GenericDigitalOutIOCell iocell_serial_tl_bits_out_bits ( // @[IOCell.scala 112:24]
    .pad(iocell_serial_tl_bits_out_bits_pad),
    .o(iocell_serial_tl_bits_out_bits_o),
    .oe(iocell_serial_tl_bits_out_bits_oe)
  );
  GenericDigitalOutIOCell iocell_serial_tl_bits_out_bits_1 ( // @[IOCell.scala 112:24]
    .pad(iocell_serial_tl_bits_out_bits_1_pad),
    .o(iocell_serial_tl_bits_out_bits_1_o),
    .oe(iocell_serial_tl_bits_out_bits_1_oe)
  );
  GenericDigitalOutIOCell iocell_serial_tl_bits_out_bits_2 ( // @[IOCell.scala 112:24]
    .pad(iocell_serial_tl_bits_out_bits_2_pad),
    .o(iocell_serial_tl_bits_out_bits_2_o),
    .oe(iocell_serial_tl_bits_out_bits_2_oe)
  );
  GenericDigitalOutIOCell iocell_serial_tl_bits_out_bits_3 ( // @[IOCell.scala 112:24]
    .pad(iocell_serial_tl_bits_out_bits_3_pad),
    .o(iocell_serial_tl_bits_out_bits_3_o),
    .oe(iocell_serial_tl_bits_out_bits_3_oe)
  );
  GenericDigitalOutIOCell iocell_serial_tl_bits_out_valid ( // @[IOCell.scala 112:24]
    .pad(iocell_serial_tl_bits_out_valid_pad),
    .o(iocell_serial_tl_bits_out_valid_o),
    .oe(iocell_serial_tl_bits_out_valid_oe)
  );
  GenericDigitalInIOCell iocell_serial_tl_bits_out_ready ( // @[IOCell.scala 111:23]
    .pad(iocell_serial_tl_bits_out_ready_pad),
    .i(iocell_serial_tl_bits_out_ready_i),
    .ie(iocell_serial_tl_bits_out_ready_ie)
  );
  GenericDigitalInIOCell iocell_serial_tl_bits_in_bits ( // @[IOCell.scala 111:23]
    .pad(iocell_serial_tl_bits_in_bits_pad),
    .i(iocell_serial_tl_bits_in_bits_i),
    .ie(iocell_serial_tl_bits_in_bits_ie)
  );
  GenericDigitalInIOCell iocell_serial_tl_bits_in_bits_1 ( // @[IOCell.scala 111:23]
    .pad(iocell_serial_tl_bits_in_bits_1_pad),
    .i(iocell_serial_tl_bits_in_bits_1_i),
    .ie(iocell_serial_tl_bits_in_bits_1_ie)
  );
  GenericDigitalInIOCell iocell_serial_tl_bits_in_bits_2 ( // @[IOCell.scala 111:23]
    .pad(iocell_serial_tl_bits_in_bits_2_pad),
    .i(iocell_serial_tl_bits_in_bits_2_i),
    .ie(iocell_serial_tl_bits_in_bits_2_ie)
  );
  GenericDigitalInIOCell iocell_serial_tl_bits_in_bits_3 ( // @[IOCell.scala 111:23]
    .pad(iocell_serial_tl_bits_in_bits_3_pad),
    .i(iocell_serial_tl_bits_in_bits_3_i),
    .ie(iocell_serial_tl_bits_in_bits_3_ie)
  );
  GenericDigitalInIOCell iocell_serial_tl_bits_in_valid ( // @[IOCell.scala 111:23]
    .pad(iocell_serial_tl_bits_in_valid_pad),
    .i(iocell_serial_tl_bits_in_valid_i),
    .ie(iocell_serial_tl_bits_in_valid_ie)
  );
  GenericDigitalOutIOCell iocell_serial_tl_bits_in_ready ( // @[IOCell.scala 112:24]
    .pad(iocell_serial_tl_bits_in_ready_pad),
    .o(iocell_serial_tl_bits_in_ready_o),
    .oe(iocell_serial_tl_bits_in_ready_oe)
  );
  GenericDigitalOutIOCell iocell_serial_tl_clock ( // @[IOCell.scala 112:24]
    .pad(iocell_serial_tl_clock_pad),
    .o(iocell_serial_tl_clock_o),
    .oe(iocell_serial_tl_clock_oe)
  );
  GenericDigitalInIOCell iocell_custom_boot ( // @[IOCell.scala 111:23]
    .pad(iocell_custom_boot_pad),
    .i(iocell_custom_boot_i),
    .ie(iocell_custom_boot_ie)
  );
  GenericDigitalInIOCell iocell_uart_0_rxd ( // @[IOCell.scala 111:23]
    .pad(iocell_uart_0_rxd_pad),
    .i(iocell_uart_0_rxd_i),
    .ie(iocell_uart_0_rxd_ie)
  );
  GenericDigitalOutIOCell iocell_uart_0_txd ( // @[IOCell.scala 112:24]
    .pad(iocell_uart_0_txd_pad),
    .o(iocell_uart_0_txd_o),
    .oe(iocell_uart_0_txd_oe)
  );
  GenericDigitalInIOCell iocell_reset ( // @[IOCell.scala 111:23]
    .pad(iocell_reset_pad),
    .i(iocell_reset_i),
    .ie(iocell_reset_ie)
  );
  GenericDigitalInIOCell iocell_clock ( // @[IOCell.scala 111:23]
    .pad(iocell_clock_pad),
    .i(iocell_clock_i),
    .ie(iocell_clock_ie)
  );
  assign jtag_TDO = iocell_jtag_TDO_pad; // @[IOCell.scala 239:25]
  assign serial_tl_clock = iocell_serial_tl_clock_pad; // @[IOCell.scala 179:61]
  assign serial_tl_bits_in_ready = iocell_serial_tl_bits_in_ready_pad; // @[IOCell.scala 239:25]
  assign serial_tl_bits_out_valid = iocell_serial_tl_bits_out_valid_pad; // @[IOCell.scala 239:25]
  assign serial_tl_bits_out_bits = {serial_tl_bits_out_bits_hi,serial_tl_bits_out_bits_lo}; // @[Cat.scala 30:58]
  assign axi4_mem_0_clock = system_auto_subsystem_mbus_fixedClockNode_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign axi4_mem_0_reset = system_auto_subsystem_mbus_fixedClockNode_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign axi4_mem_0_bits_aw_valid = system_mem_axi4_0_aw_valid; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_aw_bits_id = system_mem_axi4_0_aw_bits_id; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_aw_bits_addr = system_mem_axi4_0_aw_bits_addr; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_aw_bits_len = system_mem_axi4_0_aw_bits_len; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_aw_bits_size = system_mem_axi4_0_aw_bits_size; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_aw_bits_burst = system_mem_axi4_0_aw_bits_burst; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_aw_bits_lock = system_mem_axi4_0_aw_bits_lock; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_aw_bits_cache = system_mem_axi4_0_aw_bits_cache; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_aw_bits_prot = system_mem_axi4_0_aw_bits_prot; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_aw_bits_qos = system_mem_axi4_0_aw_bits_qos; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_w_valid = system_mem_axi4_0_w_valid; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_w_bits_data = system_mem_axi4_0_w_bits_data; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_w_bits_strb = system_mem_axi4_0_w_bits_strb; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_w_bits_last = system_mem_axi4_0_w_bits_last; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_b_ready = system_mem_axi4_0_b_ready; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_ar_valid = system_mem_axi4_0_ar_valid; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_ar_bits_id = system_mem_axi4_0_ar_bits_id; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_ar_bits_addr = system_mem_axi4_0_ar_bits_addr; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_ar_bits_len = system_mem_axi4_0_ar_bits_len; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_ar_bits_size = system_mem_axi4_0_ar_bits_size; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_ar_bits_burst = system_mem_axi4_0_ar_bits_burst; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_ar_bits_lock = system_mem_axi4_0_ar_bits_lock; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_ar_bits_cache = system_mem_axi4_0_ar_bits_cache; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_ar_bits_prot = system_mem_axi4_0_ar_bits_prot; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_ar_bits_qos = system_mem_axi4_0_ar_bits_qos; // @[IOBinders.scala 283:16]
  assign axi4_mem_0_bits_r_ready = system_mem_axi4_0_r_ready; // @[IOBinders.scala 283:16]
  assign uart_0_txd = iocell_uart_0_txd_pad; // @[IOCell.scala 239:25]
  assign system_clock = dividerOnlyClockGenerator_auto_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign system_reset = dividerOnlyClockGenerator_auto_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_async_reset_sink_in_clock = asyncResetBroadcast_auto_out_clock; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_async_reset_sink_in_reset = asyncResetBroadcast_auto_out_reset; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_clock =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_clock; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_cbus_0_reset =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_cbus_0_reset; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_clock =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_clock; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_mbus_0_reset =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_mbus_0_reset; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_clock =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_clock; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_fbus_0_reset =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_fbus_0_reset; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_clock =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_clock; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_pbus_0_reset =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_pbus_0_reset; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_clock =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_clock; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_1_reset =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_1_reset; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_clock =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_clock; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_subsystem_sbus_0_reset =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_subsystem_sbus_0_reset; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_clock =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_clock; // @[LazyModule.scala 296:16]
  assign system_auto_domain_resetCtrl_tile_reset_provider_in_member_allClocks_implicit_clock_reset =
    dividerOnlyClkGenerator_auto_divider_only_clk_generator_out_member_allClocks_implicit_clock_reset; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_mbus_0_clock; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_mbus_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_3_member_subsystem_mbus_0_reset; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_4_member_subsystem_cbus_0_clock; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_cbus_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_4_member_subsystem_cbus_0_reset; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_clock; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_fbus_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_2_member_subsystem_fbus_0_reset; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_clock; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_pbus_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_1_member_subsystem_pbus_0_reset; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_1_clock; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_1_reset; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_clock; // @[LazyModule.scala 296:16]
  assign system_auto_subsystem_sbus_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset =
    dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_out_0_member_subsystem_sbus_0_reset; // @[LazyModule.scala 296:16]
  assign system_mem_axi4_0_aw_ready = axi4_mem_0_bits_aw_ready; // @[IOBinders.scala 283:16]
  assign system_mem_axi4_0_w_ready = axi4_mem_0_bits_w_ready; // @[IOBinders.scala 283:16]
  assign system_mem_axi4_0_b_valid = axi4_mem_0_bits_b_valid; // @[IOBinders.scala 283:16]
  assign system_mem_axi4_0_b_bits_id = axi4_mem_0_bits_b_bits_id; // @[IOBinders.scala 283:16]
  assign system_mem_axi4_0_b_bits_resp = axi4_mem_0_bits_b_bits_resp; // @[IOBinders.scala 283:16]
  assign system_mem_axi4_0_ar_ready = axi4_mem_0_bits_ar_ready; // @[IOBinders.scala 283:16]
  assign system_mem_axi4_0_r_valid = axi4_mem_0_bits_r_valid; // @[IOBinders.scala 283:16]
  assign system_mem_axi4_0_r_bits_id = axi4_mem_0_bits_r_bits_id; // @[IOBinders.scala 283:16]
  assign system_mem_axi4_0_r_bits_data = axi4_mem_0_bits_r_bits_data; // @[IOBinders.scala 283:16]
  assign system_mem_axi4_0_r_bits_resp = axi4_mem_0_bits_r_bits_resp; // @[IOBinders.scala 283:16]
  assign system_mem_axi4_0_r_bits_last = axi4_mem_0_bits_r_bits_last; // @[IOBinders.scala 283:16]
  assign system_custom_boot = iocell_custom_boot_i; // @[IOCell.scala 224:26]
  assign system_serial_tl_bits_in_valid = iocell_serial_tl_bits_in_valid_i; // @[IOCell.scala 224:26]
  assign system_serial_tl_bits_in_bits = {system_serial_tl_bits_in_bits_hi,system_serial_tl_bits_in_bits_lo}; // @[Cat.scala 30:58]
  assign system_serial_tl_bits_out_ready = iocell_serial_tl_bits_out_ready_i; // @[IOCell.scala 224:26]
  assign system_resetctrl_hartIsInReset_0 = system_auto_subsystem_cbus_fixedClockNode_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign system_debug_clock = gated_clock_debug_clock_gate_out; // @[Periphery.scala 303:19]
  assign system_debug_reset = ~_debug_reset_syncd_WIRE; // @[Periphery.scala 291:40]
  assign system_debug_systemjtag_jtag_TCK = iocell_jtag_TCK_i; // @[IOCell.scala 179:61]
  assign system_debug_systemjtag_jtag_TMS = iocell_jtag_TMS_i; // @[IOBinders.scala 246:31 IOCell.scala 224:26]
  assign system_debug_systemjtag_jtag_TDI = iocell_jtag_TDI_i; // @[IOBinders.scala 246:31 IOCell.scala 224:26]
  assign system_debug_systemjtag_reset = system_debug_systemjtag_reset_catcher_io_sync_reset; // @[IOBinders.scala 232:21]
  assign system_debug_systemjtag_mfr_id = 11'h0; // @[IOBinders.scala 233:22]
  assign system_debug_systemjtag_part_number = 16'h0; // @[IOBinders.scala 234:27]
  assign system_debug_systemjtag_version = 4'h0; // @[IOBinders.scala 235:23]
  assign system_debug_dmactiveAck = dmactiveAck_dmactiveAck_io_q; // @[ShiftReg.scala 48:24 ShiftReg.scala 48:24]
  assign system_uart_0_rxd = iocell_uart_0_rxd_i; // @[IOCell.scala 224:26]
  assign aggregator_auto_in_member_allClocks_subsystem_cbus_0_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_clock; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_subsystem_cbus_0_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_cbus_0_reset; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_subsystem_mbus_0_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_mbus_0_clock; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_subsystem_mbus_0_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_mbus_0_reset; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_subsystem_fbus_0_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_clock; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_subsystem_fbus_0_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_fbus_0_reset; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_subsystem_pbus_0_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_clock; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_subsystem_pbus_0_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_pbus_0_reset; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_subsystem_sbus_1_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_1_clock; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_subsystem_sbus_1_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_1_reset; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_subsystem_sbus_0_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_clock; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_subsystem_sbus_0_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_subsystem_sbus_0_reset; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_implicit_clock_clock =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_clock; // @[LazyModule.scala 296:16]
  assign aggregator_auto_in_member_allClocks_implicit_clock_reset =
    dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_out_member_allClocks_implicit_clock_reset; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_clock =
    aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_auto_in_member_dividerOnlyClockGenerator_implicit_clock_reset =
    aggregator_auto_out_0_member_dividerOnlyClockGenerator_implicit_clock_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_4_member_subsystem_cbus_subsystem_cbus_0_clock
     = aggregator_auto_out_5_member_subsystem_cbus_subsystem_cbus_0_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_4_member_subsystem_cbus_subsystem_cbus_0_reset
     = aggregator_auto_out_5_member_subsystem_cbus_subsystem_cbus_0_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_mbus_subsystem_mbus_0_clock
     = aggregator_auto_out_4_member_subsystem_mbus_subsystem_mbus_0_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_3_member_subsystem_mbus_subsystem_mbus_0_reset
     = aggregator_auto_out_4_member_subsystem_mbus_subsystem_mbus_0_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_clock
     = aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_2_member_subsystem_fbus_subsystem_fbus_0_reset
     = aggregator_auto_out_3_member_subsystem_fbus_subsystem_fbus_0_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_clock
     = aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_1_member_subsystem_pbus_subsystem_pbus_0_reset
     = aggregator_auto_out_2_member_subsystem_pbus_subsystem_pbus_0_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_1_clock
     = aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_1_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_1_reset
     = aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_1_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_clock
     = aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_1_auto_divider_only_clock_generator_in_0_member_subsystem_sbus_subsystem_sbus_0_reset
     = aggregator_auto_out_1_member_subsystem_sbus_subsystem_sbus_0_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClkGenerator_auto_divider_only_clk_generator_in_clock = iocell_clock_i; // @[IOCell.scala 179:61]
  assign dividerOnlyClkGenerator_auto_divider_only_clk_generator_in_reset = iocell_reset_i; // @[IOCell.scala 180:64]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_clock; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_cbus_0_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_cbus_0_reset; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_mbus_0_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_mbus_0_clock; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_mbus_0_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_mbus_0_reset; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_clock; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_fbus_0_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_fbus_0_reset; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_clock; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_pbus_0_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_pbus_0_reset; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_1_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_1_clock; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_1_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_1_reset; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_clock; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_subsystem_sbus_0_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_subsystem_sbus_0_reset; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_clock =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_clock; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_2_auto_divider_only_clock_generator_in_member_allClocks_implicit_clock_reset =
    dividerOnlyClockGenerator_3_auto_out_member_allClocks_implicit_clock_reset; // @[LazyModule.scala 296:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_clock =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_cbus_0_reset =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_cbus_0_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_mbus_0_clock =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_mbus_0_reset =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_mbus_0_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_clock =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_fbus_0_reset =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_fbus_0_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_clock =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_pbus_0_reset =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_pbus_0_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_1_clock =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_1_reset =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_1_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_clock =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_subsystem_sbus_0_reset =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_subsystem_sbus_0_reset; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_clock =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_clock; // @[LazyModule.scala 298:16]
  assign dividerOnlyClockGenerator_3_auto_in_member_allClocks_implicit_clock_reset =
    system_auto_domain_resetCtrl_tile_reset_provider_out_member_allClocks_implicit_clock_reset; // @[LazyModule.scala 298:16]
  assign asyncResetBroadcast_auto_in_clock = 1'h0; // @[Clocks.scala 116:28]
  assign asyncResetBroadcast_auto_in_reset = iocell_reset_i; // @[IOCell.scala 180:64]
  assign system_debug_systemjtag_reset_catcher_clock = system_debug_systemjtag_jtag_TCK;
  assign system_debug_systemjtag_reset_catcher_reset = system_auto_subsystem_cbus_fixedClockNode_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign system_debug_systemjtag_reset_catcher_io_psd_test_mode = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign system_debug_systemjtag_reset_catcher_io_psd_test_mode_reset = 1'h0; // @[ResetCatchAndSync.scala 41:71 ResetCatchAndSync.scala 41:71]
  assign debug_reset_syncd_debug_reset_sync_clock = system_auto_subsystem_cbus_fixedClockNode_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign debug_reset_syncd_debug_reset_sync_reset = system_debug_systemjtag_reset; // @[Periphery.scala 282:38]
  assign debug_reset_syncd_debug_reset_sync_io_d = 1'h1; // @[ShiftReg.scala 47:16]
  assign dmactiveAck_dmactiveAck_clock = system_auto_subsystem_cbus_fixedClockNode_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign dmactiveAck_dmactiveAck_reset = ~_debug_reset_syncd_WIRE; // @[Periphery.scala 297:38]
  assign dmactiveAck_dmactiveAck_io_d = system_debug_dmactive; // @[ShiftReg.scala 47:16]
  assign gated_clock_debug_clock_gate_in = system_auto_subsystem_cbus_fixedClockNode_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign gated_clock_debug_clock_gate_test_en = 1'h0; // @[ClockGate.scala 27:19]
  assign gated_clock_debug_clock_gate_en = clock_en; // @[ClockGate.scala 28:14]
  assign iocell_jtag_TDO_o = system_debug_systemjtag_jtag_TDO_data; // @[IOBinders.scala 246:31 IOBinders.scala 250:25]
  assign iocell_jtag_TDO_oe = 1'h1; // @[IOCell.scala 235:30]
  assign iocell_jtag_TDI_pad = jtag_TDI; // @[IOCell.scala 213:39]
  assign iocell_jtag_TDI_ie = 1'h1; // @[IOCell.scala 220:30]
  assign iocell_jtag_TMS_pad = jtag_TMS; // @[IOCell.scala 213:39]
  assign iocell_jtag_TMS_ie = 1'h1; // @[IOCell.scala 220:30]
  assign iocell_jtag_TCK_pad = jtag_TCK; // @[IOCell.scala 179:44]
  assign iocell_jtag_TCK_ie = 1'h1; // @[IOCell.scala 164:24]
  assign iocell_serial_tl_bits_out_bits_o = system_serial_tl_bits_out_bits[0]; // @[IOCell.scala 228:40]
  assign iocell_serial_tl_bits_out_bits_oe = 1'h1; // @[IOCell.scala 235:30]
  assign iocell_serial_tl_bits_out_bits_1_o = system_serial_tl_bits_out_bits[1]; // @[IOCell.scala 228:40]
  assign iocell_serial_tl_bits_out_bits_1_oe = 1'h1; // @[IOCell.scala 235:30]
  assign iocell_serial_tl_bits_out_bits_2_o = system_serial_tl_bits_out_bits[2]; // @[IOCell.scala 228:40]
  assign iocell_serial_tl_bits_out_bits_2_oe = 1'h1; // @[IOCell.scala 235:30]
  assign iocell_serial_tl_bits_out_bits_3_o = system_serial_tl_bits_out_bits[3]; // @[IOCell.scala 228:40]
  assign iocell_serial_tl_bits_out_bits_3_oe = 1'h1; // @[IOCell.scala 235:30]
  assign iocell_serial_tl_bits_out_valid_o = system_serial_tl_bits_out_valid; // @[IOCell.scala 228:40]
  assign iocell_serial_tl_bits_out_valid_oe = 1'h1; // @[IOCell.scala 235:30]
  assign iocell_serial_tl_bits_out_ready_pad = serial_tl_bits_out_ready; // @[IOCell.scala 213:39]
  assign iocell_serial_tl_bits_out_ready_ie = 1'h1; // @[IOCell.scala 220:30]
  assign iocell_serial_tl_bits_in_bits_pad = serial_tl_bits_in_bits[0]; // @[IOCell.scala 213:39]
  assign iocell_serial_tl_bits_in_bits_ie = 1'h1; // @[IOCell.scala 220:30]
  assign iocell_serial_tl_bits_in_bits_1_pad = serial_tl_bits_in_bits[1]; // @[IOCell.scala 213:39]
  assign iocell_serial_tl_bits_in_bits_1_ie = 1'h1; // @[IOCell.scala 220:30]
  assign iocell_serial_tl_bits_in_bits_2_pad = serial_tl_bits_in_bits[2]; // @[IOCell.scala 213:39]
  assign iocell_serial_tl_bits_in_bits_2_ie = 1'h1; // @[IOCell.scala 220:30]
  assign iocell_serial_tl_bits_in_bits_3_pad = serial_tl_bits_in_bits[3]; // @[IOCell.scala 213:39]
  assign iocell_serial_tl_bits_in_bits_3_ie = 1'h1; // @[IOCell.scala 220:30]
  assign iocell_serial_tl_bits_in_valid_pad = serial_tl_bits_in_valid; // @[IOCell.scala 213:39]
  assign iocell_serial_tl_bits_in_valid_ie = 1'h1; // @[IOCell.scala 220:30]
  assign iocell_serial_tl_bits_in_ready_o = system_serial_tl_bits_in_ready; // @[IOCell.scala 228:40]
  assign iocell_serial_tl_bits_in_ready_oe = 1'h1; // @[IOCell.scala 235:30]
  assign iocell_serial_tl_clock_o = system_serial_tl_clock; // @[IOCell.scala 179:44]
  assign iocell_serial_tl_clock_oe = 1'h1; // @[IOCell.scala 172:24]
  assign iocell_custom_boot_pad = custom_boot; // @[IOCell.scala 213:39]
  assign iocell_custom_boot_ie = 1'h1; // @[IOCell.scala 220:30]
  assign iocell_uart_0_rxd_pad = uart_0_rxd; // @[IOCell.scala 213:39]
  assign iocell_uart_0_rxd_ie = 1'h1; // @[IOCell.scala 220:30]
  assign iocell_uart_0_txd_o = system_uart_0_txd; // @[IOCell.scala 228:40]
  assign iocell_uart_0_txd_oe = 1'h1; // @[IOCell.scala 235:30]
  assign iocell_reset_pad = reset; // @[IOCell.scala 180:54]
  assign iocell_reset_ie = 1'h1; // @[IOCell.scala 164:24]
  assign iocell_clock_pad = clock; // @[IOCell.scala 179:44]
  assign iocell_clock_ie = 1'h1; // @[IOCell.scala 164:24]
  always @(posedge bundleIn_0_clock or posedge _T) begin
    if (_T) begin
      clock_en <= 1'h1;
    end else begin
      clock_en <= dmactiveAck_dmactiveAck_io_q;
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
  clock_en = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T) begin
    clock_en = 1'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
