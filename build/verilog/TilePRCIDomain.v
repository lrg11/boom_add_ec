module TilePRCIDomain(
  input         auto_intsink_in_sync_0,
  output        auto_tile_reset_domain_boom_tile_trace_out_0_valid,
  output [39:0] auto_tile_reset_domain_boom_tile_trace_out_0_iaddr,
  output [31:0] auto_tile_reset_domain_boom_tile_trace_out_0_insn,
  output [2:0]  auto_tile_reset_domain_boom_tile_trace_out_0_priv,
  output        auto_tile_reset_domain_boom_tile_trace_out_0_exception,
  output        auto_tile_reset_domain_boom_tile_trace_out_0_interrupt,
  output [63:0] auto_tile_reset_domain_boom_tile_trace_out_0_cause,
  output [39:0] auto_tile_reset_domain_boom_tile_trace_out_0_tval,
  output [63:0] auto_tile_reset_domain_boom_tile_trace_out_0_wdata,
  output        auto_tile_reset_domain_boom_tile_trace_out_1_valid,
  output [39:0] auto_tile_reset_domain_boom_tile_trace_out_1_iaddr,
  output [31:0] auto_tile_reset_domain_boom_tile_trace_out_1_insn,
  output [2:0]  auto_tile_reset_domain_boom_tile_trace_out_1_priv,
  output        auto_tile_reset_domain_boom_tile_trace_out_1_exception,
  output        auto_tile_reset_domain_boom_tile_trace_out_1_interrupt,
  output [63:0] auto_tile_reset_domain_boom_tile_trace_out_1_cause,
  output [39:0] auto_tile_reset_domain_boom_tile_trace_out_1_tval,
  output [63:0] auto_tile_reset_domain_boom_tile_trace_out_1_wdata,
  input         auto_tile_reset_domain_boom_tile_nmi_in_rnmi,
  input  [31:0] auto_tile_reset_domain_boom_tile_nmi_in_rnmi_interrupt_vector,
  input  [31:0] auto_tile_reset_domain_boom_tile_nmi_in_rnmi_exception_vector,
  input         auto_tile_reset_domain_boom_tile_nmi_in_unmi,
  input  [31:0] auto_tile_reset_domain_boom_tile_nmi_in_unmi_interrupt_vector,
  input  [31:0] auto_tile_reset_domain_boom_tile_nmi_in_unmi_exception_vector,
  input  [31:0] auto_tile_reset_domain_boom_tile_reset_vector_in,
  input         auto_tile_reset_domain_boom_tile_hartid_in,
  output        auto_int_out_clock_xing_out_2_sync_0,
  output        auto_int_out_clock_xing_out_1_sync_0,
  output        auto_int_out_clock_xing_out_0_sync_0,
  input         auto_int_in_clock_xing_in_2_sync_0,
  input         auto_int_in_clock_xing_in_1_sync_0,
  input         auto_int_in_clock_xing_in_0_sync_0,
  input         auto_int_in_clock_xing_in_0_sync_1,
  input         auto_tl_master_clock_xing_out_a_ready,
  output        auto_tl_master_clock_xing_out_a_valid,
  output [2:0]  auto_tl_master_clock_xing_out_a_bits_opcode,
  output [2:0]  auto_tl_master_clock_xing_out_a_bits_param,
  output [3:0]  auto_tl_master_clock_xing_out_a_bits_size,
  output [2:0]  auto_tl_master_clock_xing_out_a_bits_source,
  output [31:0] auto_tl_master_clock_xing_out_a_bits_address,
  output [7:0]  auto_tl_master_clock_xing_out_a_bits_mask,
  output [63:0] auto_tl_master_clock_xing_out_a_bits_data,
  output        auto_tl_master_clock_xing_out_a_bits_corrupt,
  output        auto_tl_master_clock_xing_out_b_ready,
  input         auto_tl_master_clock_xing_out_b_valid,
  input  [2:0]  auto_tl_master_clock_xing_out_b_bits_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_b_bits_param,
  input  [3:0]  auto_tl_master_clock_xing_out_b_bits_size,
  input  [2:0]  auto_tl_master_clock_xing_out_b_bits_source,
  input  [31:0] auto_tl_master_clock_xing_out_b_bits_address,
  input  [7:0]  auto_tl_master_clock_xing_out_b_bits_mask,
  input  [63:0] auto_tl_master_clock_xing_out_b_bits_data,
  input         auto_tl_master_clock_xing_out_b_bits_corrupt,
  input         auto_tl_master_clock_xing_out_c_ready,
  output        auto_tl_master_clock_xing_out_c_valid,
  output [2:0]  auto_tl_master_clock_xing_out_c_bits_opcode,
  output [2:0]  auto_tl_master_clock_xing_out_c_bits_param,
  output [3:0]  auto_tl_master_clock_xing_out_c_bits_size,
  output [2:0]  auto_tl_master_clock_xing_out_c_bits_source,
  output [31:0] auto_tl_master_clock_xing_out_c_bits_address,
  output [63:0] auto_tl_master_clock_xing_out_c_bits_data,
  output        auto_tl_master_clock_xing_out_c_bits_corrupt,
  output        auto_tl_master_clock_xing_out_d_ready,
  input         auto_tl_master_clock_xing_out_d_valid,
  input  [2:0]  auto_tl_master_clock_xing_out_d_bits_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_d_bits_param,
  input  [3:0]  auto_tl_master_clock_xing_out_d_bits_size,
  input  [2:0]  auto_tl_master_clock_xing_out_d_bits_source,
  input  [1:0]  auto_tl_master_clock_xing_out_d_bits_sink,
  input         auto_tl_master_clock_xing_out_d_bits_denied,
  input  [63:0] auto_tl_master_clock_xing_out_d_bits_data,
  input         auto_tl_master_clock_xing_out_d_bits_corrupt,
  input         auto_tl_master_clock_xing_out_e_ready,
  output        auto_tl_master_clock_xing_out_e_valid,
  output [1:0]  auto_tl_master_clock_xing_out_e_bits_sink,
  input         auto_tap_clock_in_clock,
  input         auto_tap_clock_in_reset,
  output        clock,
  output        reset
);
  wire  tile_reset_domain_auto_boom_tile_trace_out_0_valid; // @[TilePRCIDomain.scala 45:37]
  wire [39:0] tile_reset_domain_auto_boom_tile_trace_out_0_iaddr; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_trace_out_0_insn; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_trace_out_0_priv; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_trace_out_0_exception; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_trace_out_0_interrupt; // @[TilePRCIDomain.scala 45:37]
  wire [63:0] tile_reset_domain_auto_boom_tile_trace_out_0_cause; // @[TilePRCIDomain.scala 45:37]
  wire [39:0] tile_reset_domain_auto_boom_tile_trace_out_0_tval; // @[TilePRCIDomain.scala 45:37]
  wire [63:0] tile_reset_domain_auto_boom_tile_trace_out_0_wdata; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_trace_out_1_valid; // @[TilePRCIDomain.scala 45:37]
  wire [39:0] tile_reset_domain_auto_boom_tile_trace_out_1_iaddr; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_trace_out_1_insn; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_trace_out_1_priv; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_trace_out_1_exception; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_trace_out_1_interrupt; // @[TilePRCIDomain.scala 45:37]
  wire [63:0] tile_reset_domain_auto_boom_tile_trace_out_1_cause; // @[TilePRCIDomain.scala 45:37]
  wire [39:0] tile_reset_domain_auto_boom_tile_trace_out_1_tval; // @[TilePRCIDomain.scala 45:37]
  wire [63:0] tile_reset_domain_auto_boom_tile_trace_out_1_wdata; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_broadcast_out_0_valid; // @[TilePRCIDomain.scala 45:37]
  wire [39:0] tile_reset_domain_auto_boom_tile_broadcast_out_0_iaddr; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_broadcast_out_0_insn; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_broadcast_out_0_priv; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_broadcast_out_0_exception; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_broadcast_out_0_interrupt; // @[TilePRCIDomain.scala 45:37]
  wire [63:0] tile_reset_domain_auto_boom_tile_broadcast_out_0_cause; // @[TilePRCIDomain.scala 45:37]
  wire [39:0] tile_reset_domain_auto_boom_tile_broadcast_out_0_tval; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_broadcast_out_1_valid; // @[TilePRCIDomain.scala 45:37]
  wire [39:0] tile_reset_domain_auto_boom_tile_broadcast_out_1_iaddr; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_broadcast_out_1_insn; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_broadcast_out_1_priv; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_broadcast_out_1_exception; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_broadcast_out_1_interrupt; // @[TilePRCIDomain.scala 45:37]
  wire [63:0] tile_reset_domain_auto_boom_tile_broadcast_out_1_cause; // @[TilePRCIDomain.scala 45:37]
  wire [39:0] tile_reset_domain_auto_boom_tile_broadcast_out_1_tval; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_wfi_out_0; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_cease_out_0; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_halt_out_0; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_int_local_in_3_0; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_int_local_in_2_0; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_int_local_in_1_0; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_int_local_in_1_1; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_int_local_in_0_0; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_iretire; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_iaddr; // @[TilePRCIDomain.scala 45:37]
  wire [3:0] tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_itype; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_ilastsize; // @[TilePRCIDomain.scala 45:37]
  wire [3:0] tile_reset_domain_auto_boom_tile_trace_core_source_out_priv; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_trace_core_source_out_tval; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_trace_core_source_out_cause; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_nmi_in_rnmi; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_nmi_in_rnmi_interrupt_vector; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_nmi_in_rnmi_exception_vector; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_nmi_in_unmi; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_nmi_in_unmi_interrupt_vector; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_nmi_in_unmi_exception_vector; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_reset_vector_in; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_hartid_in; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_ready; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_valid; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_opcode; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_param; // @[TilePRCIDomain.scala 45:37]
  wire [3:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_size; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_source; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_address; // @[TilePRCIDomain.scala 45:37]
  wire [7:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_mask; // @[TilePRCIDomain.scala 45:37]
  wire [63:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_data; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_corrupt; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_ready; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_valid; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_opcode; // @[TilePRCIDomain.scala 45:37]
  wire [1:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_param; // @[TilePRCIDomain.scala 45:37]
  wire [3:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_size; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_source; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_address; // @[TilePRCIDomain.scala 45:37]
  wire [7:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_mask; // @[TilePRCIDomain.scala 45:37]
  wire [63:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_data; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_corrupt; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_ready; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_valid; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_opcode; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_param; // @[TilePRCIDomain.scala 45:37]
  wire [3:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_size; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_source; // @[TilePRCIDomain.scala 45:37]
  wire [31:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_address; // @[TilePRCIDomain.scala 45:37]
  wire [63:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_data; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_corrupt; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_ready; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_valid; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_opcode; // @[TilePRCIDomain.scala 45:37]
  wire [1:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_param; // @[TilePRCIDomain.scala 45:37]
  wire [3:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_size; // @[TilePRCIDomain.scala 45:37]
  wire [2:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_source; // @[TilePRCIDomain.scala 45:37]
  wire [1:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_sink; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_denied; // @[TilePRCIDomain.scala 45:37]
  wire [63:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_data; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_corrupt; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_e_ready; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_boom_tile_tl_other_masters_out_e_valid; // @[TilePRCIDomain.scala 45:37]
  wire [1:0] tile_reset_domain_auto_boom_tile_tl_other_masters_out_e_bits_sink; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_clock_in_clock; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_auto_clock_in_reset; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_clock; // @[TilePRCIDomain.scala 45:37]
  wire  tile_reset_domain_reset; // @[TilePRCIDomain.scala 45:37]
  wire  clockNode_auto_in_clock; // @[ClockGroup.scala 106:107]
  wire  clockNode_auto_in_reset; // @[ClockGroup.scala 106:107]
  wire  clockNode_auto_out_clock; // @[ClockGroup.scala 106:107]
  wire  clockNode_auto_out_reset; // @[ClockGroup.scala 106:107]
  wire  buffer_clock; // @[Buffer.scala 68:28]
  wire  buffer_reset; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_b_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_b_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_b_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_b_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_b_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_b_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_in_b_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_b_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_b_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_b_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_c_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_c_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_c_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_c_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_c_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_c_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_in_c_bits_address; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_c_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_c_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_e_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_e_valid; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_e_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_b_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_b_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_b_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_b_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_b_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_b_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_out_b_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_b_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_b_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_b_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_c_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_c_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_c_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_c_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_c_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_c_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_auto_out_c_bits_address; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_c_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_c_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_e_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_e_valid; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_e_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_clock; // @[Buffer.scala 68:28]
  wire  buffer_1_reset; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_b_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_b_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_b_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_b_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_b_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_b_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_in_b_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_in_b_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_b_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_b_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_c_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_c_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_c_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_c_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_c_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_c_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_in_c_bits_address; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_c_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_c_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_e_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_e_valid; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_e_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_b_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_b_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_b_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_b_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_b_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_b_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_out_b_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_out_b_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_b_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_b_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_c_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_c_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_c_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_c_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_c_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_c_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_out_c_bits_address; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_c_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_c_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_e_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_e_valid; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_e_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_2_clock; // @[Buffer.scala 68:28]
  wire  buffer_2_reset; // @[Buffer.scala 68:28]
  wire  buffer_3_clock; // @[Buffer.scala 68:28]
  wire  buffer_3_reset; // @[Buffer.scala 68:28]
  wire  intsink_clock; // @[Crossing.scala 74:29]
  wire  intsink_reset; // @[Crossing.scala 74:29]
  wire  intsink_auto_in_sync_0; // @[Crossing.scala 74:29]
  wire  intsink_auto_out_0; // @[Crossing.scala 74:29]
  wire  intsink_1_clock; // @[Crossing.scala 94:29]
  wire  intsink_1_reset; // @[Crossing.scala 94:29]
  wire  intsink_1_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_1_auto_in_sync_1; // @[Crossing.scala 94:29]
  wire  intsink_1_auto_out_0; // @[Crossing.scala 94:29]
  wire  intsink_1_auto_out_1; // @[Crossing.scala 94:29]
  wire  intsink_2_clock; // @[Crossing.scala 94:29]
  wire  intsink_2_reset; // @[Crossing.scala 94:29]
  wire  intsink_2_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_2_auto_out_0; // @[Crossing.scala 94:29]
  wire  intsink_3_clock; // @[Crossing.scala 94:29]
  wire  intsink_3_reset; // @[Crossing.scala 94:29]
  wire  intsink_3_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_3_auto_out_0; // @[Crossing.scala 94:29]
  wire  intsource_clock; // @[Crossing.scala 26:31]
  wire  intsource_reset; // @[Crossing.scala 26:31]
  wire  intsource_1_clock; // @[Crossing.scala 26:31]
  wire  intsource_1_reset; // @[Crossing.scala 26:31]
  wire  intsource_1_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_1_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  intsource_2_clock; // @[Crossing.scala 26:31]
  wire  intsource_2_reset; // @[Crossing.scala 26:31]
  wire  intsource_2_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_2_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  intsource_3_clock; // @[Crossing.scala 26:31]
  wire  intsource_3_reset; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  trace_clock; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire  trace_reset; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire  trace_auto_in_0_valid; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [39:0] trace_auto_in_0_iaddr; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [31:0] trace_auto_in_0_insn; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [2:0] trace_auto_in_0_priv; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire  trace_auto_in_0_exception; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire  trace_auto_in_0_interrupt; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [63:0] trace_auto_in_0_cause; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [39:0] trace_auto_in_0_tval; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire  trace_auto_in_1_valid; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [39:0] trace_auto_in_1_iaddr; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [31:0] trace_auto_in_1_insn; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [2:0] trace_auto_in_1_priv; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire  trace_auto_in_1_exception; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire  trace_auto_in_1_interrupt; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [63:0] trace_auto_in_1_cause; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [39:0] trace_auto_in_1_tval; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire  tracecore_clock; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire  tracecore_reset; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire  tracecore_auto_in_group_0_iretire; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [31:0] tracecore_auto_in_group_0_iaddr; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [3:0] tracecore_auto_in_group_0_itype; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire  tracecore_auto_in_group_0_ilastsize; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [3:0] tracecore_auto_in_priv; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [31:0] tracecore_auto_in_tval; // @[BundleBridgeBlockDuringReset.scala 20:27]
  wire [31:0] tracecore_auto_in_cause; // @[BundleBridgeBlockDuringReset.scala 20:27]
  TileResetDomain tile_reset_domain ( // @[TilePRCIDomain.scala 45:37]
    .auto_boom_tile_trace_out_0_valid(tile_reset_domain_auto_boom_tile_trace_out_0_valid),
    .auto_boom_tile_trace_out_0_iaddr(tile_reset_domain_auto_boom_tile_trace_out_0_iaddr),
    .auto_boom_tile_trace_out_0_insn(tile_reset_domain_auto_boom_tile_trace_out_0_insn),
    .auto_boom_tile_trace_out_0_priv(tile_reset_domain_auto_boom_tile_trace_out_0_priv),
    .auto_boom_tile_trace_out_0_exception(tile_reset_domain_auto_boom_tile_trace_out_0_exception),
    .auto_boom_tile_trace_out_0_interrupt(tile_reset_domain_auto_boom_tile_trace_out_0_interrupt),
    .auto_boom_tile_trace_out_0_cause(tile_reset_domain_auto_boom_tile_trace_out_0_cause),
    .auto_boom_tile_trace_out_0_tval(tile_reset_domain_auto_boom_tile_trace_out_0_tval),
    .auto_boom_tile_trace_out_0_wdata(tile_reset_domain_auto_boom_tile_trace_out_0_wdata),
    .auto_boom_tile_trace_out_1_valid(tile_reset_domain_auto_boom_tile_trace_out_1_valid),
    .auto_boom_tile_trace_out_1_iaddr(tile_reset_domain_auto_boom_tile_trace_out_1_iaddr),
    .auto_boom_tile_trace_out_1_insn(tile_reset_domain_auto_boom_tile_trace_out_1_insn),
    .auto_boom_tile_trace_out_1_priv(tile_reset_domain_auto_boom_tile_trace_out_1_priv),
    .auto_boom_tile_trace_out_1_exception(tile_reset_domain_auto_boom_tile_trace_out_1_exception),
    .auto_boom_tile_trace_out_1_interrupt(tile_reset_domain_auto_boom_tile_trace_out_1_interrupt),
    .auto_boom_tile_trace_out_1_cause(tile_reset_domain_auto_boom_tile_trace_out_1_cause),
    .auto_boom_tile_trace_out_1_tval(tile_reset_domain_auto_boom_tile_trace_out_1_tval),
    .auto_boom_tile_trace_out_1_wdata(tile_reset_domain_auto_boom_tile_trace_out_1_wdata),
    .auto_boom_tile_broadcast_out_0_valid(tile_reset_domain_auto_boom_tile_broadcast_out_0_valid),
    .auto_boom_tile_broadcast_out_0_iaddr(tile_reset_domain_auto_boom_tile_broadcast_out_0_iaddr),
    .auto_boom_tile_broadcast_out_0_insn(tile_reset_domain_auto_boom_tile_broadcast_out_0_insn),
    .auto_boom_tile_broadcast_out_0_priv(tile_reset_domain_auto_boom_tile_broadcast_out_0_priv),
    .auto_boom_tile_broadcast_out_0_exception(tile_reset_domain_auto_boom_tile_broadcast_out_0_exception),
    .auto_boom_tile_broadcast_out_0_interrupt(tile_reset_domain_auto_boom_tile_broadcast_out_0_interrupt),
    .auto_boom_tile_broadcast_out_0_cause(tile_reset_domain_auto_boom_tile_broadcast_out_0_cause),
    .auto_boom_tile_broadcast_out_0_tval(tile_reset_domain_auto_boom_tile_broadcast_out_0_tval),
    .auto_boom_tile_broadcast_out_1_valid(tile_reset_domain_auto_boom_tile_broadcast_out_1_valid),
    .auto_boom_tile_broadcast_out_1_iaddr(tile_reset_domain_auto_boom_tile_broadcast_out_1_iaddr),
    .auto_boom_tile_broadcast_out_1_insn(tile_reset_domain_auto_boom_tile_broadcast_out_1_insn),
    .auto_boom_tile_broadcast_out_1_priv(tile_reset_domain_auto_boom_tile_broadcast_out_1_priv),
    .auto_boom_tile_broadcast_out_1_exception(tile_reset_domain_auto_boom_tile_broadcast_out_1_exception),
    .auto_boom_tile_broadcast_out_1_interrupt(tile_reset_domain_auto_boom_tile_broadcast_out_1_interrupt),
    .auto_boom_tile_broadcast_out_1_cause(tile_reset_domain_auto_boom_tile_broadcast_out_1_cause),
    .auto_boom_tile_broadcast_out_1_tval(tile_reset_domain_auto_boom_tile_broadcast_out_1_tval),
    .auto_boom_tile_wfi_out_0(tile_reset_domain_auto_boom_tile_wfi_out_0),
    .auto_boom_tile_cease_out_0(tile_reset_domain_auto_boom_tile_cease_out_0),
    .auto_boom_tile_halt_out_0(tile_reset_domain_auto_boom_tile_halt_out_0),
    .auto_boom_tile_int_local_in_3_0(tile_reset_domain_auto_boom_tile_int_local_in_3_0),
    .auto_boom_tile_int_local_in_2_0(tile_reset_domain_auto_boom_tile_int_local_in_2_0),
    .auto_boom_tile_int_local_in_1_0(tile_reset_domain_auto_boom_tile_int_local_in_1_0),
    .auto_boom_tile_int_local_in_1_1(tile_reset_domain_auto_boom_tile_int_local_in_1_1),
    .auto_boom_tile_int_local_in_0_0(tile_reset_domain_auto_boom_tile_int_local_in_0_0),
    .auto_boom_tile_trace_core_source_out_group_0_iretire(
      tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_iretire),
    .auto_boom_tile_trace_core_source_out_group_0_iaddr(
      tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_iaddr),
    .auto_boom_tile_trace_core_source_out_group_0_itype(
      tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_itype),
    .auto_boom_tile_trace_core_source_out_group_0_ilastsize(
      tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_ilastsize),
    .auto_boom_tile_trace_core_source_out_priv(tile_reset_domain_auto_boom_tile_trace_core_source_out_priv),
    .auto_boom_tile_trace_core_source_out_tval(tile_reset_domain_auto_boom_tile_trace_core_source_out_tval),
    .auto_boom_tile_trace_core_source_out_cause(tile_reset_domain_auto_boom_tile_trace_core_source_out_cause),
    .auto_boom_tile_nmi_in_rnmi(tile_reset_domain_auto_boom_tile_nmi_in_rnmi),
    .auto_boom_tile_nmi_in_rnmi_interrupt_vector(tile_reset_domain_auto_boom_tile_nmi_in_rnmi_interrupt_vector),
    .auto_boom_tile_nmi_in_rnmi_exception_vector(tile_reset_domain_auto_boom_tile_nmi_in_rnmi_exception_vector),
    .auto_boom_tile_nmi_in_unmi(tile_reset_domain_auto_boom_tile_nmi_in_unmi),
    .auto_boom_tile_nmi_in_unmi_interrupt_vector(tile_reset_domain_auto_boom_tile_nmi_in_unmi_interrupt_vector),
    .auto_boom_tile_nmi_in_unmi_exception_vector(tile_reset_domain_auto_boom_tile_nmi_in_unmi_exception_vector),
    .auto_boom_tile_reset_vector_in(tile_reset_domain_auto_boom_tile_reset_vector_in),
    .auto_boom_tile_hartid_in(tile_reset_domain_auto_boom_tile_hartid_in),
    .auto_boom_tile_tl_other_masters_out_a_ready(tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_ready),
    .auto_boom_tile_tl_other_masters_out_a_valid(tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_valid),
    .auto_boom_tile_tl_other_masters_out_a_bits_opcode(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_opcode),
    .auto_boom_tile_tl_other_masters_out_a_bits_param(tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_param
      ),
    .auto_boom_tile_tl_other_masters_out_a_bits_size(tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_size),
    .auto_boom_tile_tl_other_masters_out_a_bits_source(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_source),
    .auto_boom_tile_tl_other_masters_out_a_bits_address(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_address),
    .auto_boom_tile_tl_other_masters_out_a_bits_mask(tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_mask),
    .auto_boom_tile_tl_other_masters_out_a_bits_data(tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_data),
    .auto_boom_tile_tl_other_masters_out_a_bits_corrupt(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_corrupt),
    .auto_boom_tile_tl_other_masters_out_b_ready(tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_ready),
    .auto_boom_tile_tl_other_masters_out_b_valid(tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_valid),
    .auto_boom_tile_tl_other_masters_out_b_bits_opcode(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_opcode),
    .auto_boom_tile_tl_other_masters_out_b_bits_param(tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_param
      ),
    .auto_boom_tile_tl_other_masters_out_b_bits_size(tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_size),
    .auto_boom_tile_tl_other_masters_out_b_bits_source(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_source),
    .auto_boom_tile_tl_other_masters_out_b_bits_address(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_address),
    .auto_boom_tile_tl_other_masters_out_b_bits_mask(tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_mask),
    .auto_boom_tile_tl_other_masters_out_b_bits_data(tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_data),
    .auto_boom_tile_tl_other_masters_out_b_bits_corrupt(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_corrupt),
    .auto_boom_tile_tl_other_masters_out_c_ready(tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_ready),
    .auto_boom_tile_tl_other_masters_out_c_valid(tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_valid),
    .auto_boom_tile_tl_other_masters_out_c_bits_opcode(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_opcode),
    .auto_boom_tile_tl_other_masters_out_c_bits_param(tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_param
      ),
    .auto_boom_tile_tl_other_masters_out_c_bits_size(tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_size),
    .auto_boom_tile_tl_other_masters_out_c_bits_source(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_source),
    .auto_boom_tile_tl_other_masters_out_c_bits_address(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_address),
    .auto_boom_tile_tl_other_masters_out_c_bits_data(tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_data),
    .auto_boom_tile_tl_other_masters_out_c_bits_corrupt(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_corrupt),
    .auto_boom_tile_tl_other_masters_out_d_ready(tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_ready),
    .auto_boom_tile_tl_other_masters_out_d_valid(tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_valid),
    .auto_boom_tile_tl_other_masters_out_d_bits_opcode(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_opcode),
    .auto_boom_tile_tl_other_masters_out_d_bits_param(tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_param
      ),
    .auto_boom_tile_tl_other_masters_out_d_bits_size(tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_size),
    .auto_boom_tile_tl_other_masters_out_d_bits_source(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_source),
    .auto_boom_tile_tl_other_masters_out_d_bits_sink(tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_sink),
    .auto_boom_tile_tl_other_masters_out_d_bits_denied(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_denied),
    .auto_boom_tile_tl_other_masters_out_d_bits_data(tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_data),
    .auto_boom_tile_tl_other_masters_out_d_bits_corrupt(
      tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_corrupt),
    .auto_boom_tile_tl_other_masters_out_e_ready(tile_reset_domain_auto_boom_tile_tl_other_masters_out_e_ready),
    .auto_boom_tile_tl_other_masters_out_e_valid(tile_reset_domain_auto_boom_tile_tl_other_masters_out_e_valid),
    .auto_boom_tile_tl_other_masters_out_e_bits_sink(tile_reset_domain_auto_boom_tile_tl_other_masters_out_e_bits_sink),
    .auto_clock_in_clock(tile_reset_domain_auto_clock_in_clock),
    .auto_clock_in_reset(tile_reset_domain_auto_clock_in_reset),
    .clock(tile_reset_domain_clock),
    .reset(tile_reset_domain_reset)
  );
  FixedClockBroadcast_5 clockNode ( // @[ClockGroup.scala 106:107]
    .auto_in_clock(clockNode_auto_in_clock),
    .auto_in_reset(clockNode_auto_in_reset),
    .auto_out_clock(clockNode_auto_out_clock),
    .auto_out_reset(clockNode_auto_out_reset)
  );
  TLBuffer_12 buffer ( // @[Buffer.scala 68:28]
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
    .auto_in_b_ready(buffer_auto_in_b_ready),
    .auto_in_b_valid(buffer_auto_in_b_valid),
    .auto_in_b_bits_opcode(buffer_auto_in_b_bits_opcode),
    .auto_in_b_bits_param(buffer_auto_in_b_bits_param),
    .auto_in_b_bits_size(buffer_auto_in_b_bits_size),
    .auto_in_b_bits_source(buffer_auto_in_b_bits_source),
    .auto_in_b_bits_address(buffer_auto_in_b_bits_address),
    .auto_in_b_bits_mask(buffer_auto_in_b_bits_mask),
    .auto_in_b_bits_data(buffer_auto_in_b_bits_data),
    .auto_in_b_bits_corrupt(buffer_auto_in_b_bits_corrupt),
    .auto_in_c_ready(buffer_auto_in_c_ready),
    .auto_in_c_valid(buffer_auto_in_c_valid),
    .auto_in_c_bits_opcode(buffer_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(buffer_auto_in_c_bits_param),
    .auto_in_c_bits_size(buffer_auto_in_c_bits_size),
    .auto_in_c_bits_source(buffer_auto_in_c_bits_source),
    .auto_in_c_bits_address(buffer_auto_in_c_bits_address),
    .auto_in_c_bits_data(buffer_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(buffer_auto_in_c_bits_corrupt),
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
    .auto_in_e_ready(buffer_auto_in_e_ready),
    .auto_in_e_valid(buffer_auto_in_e_valid),
    .auto_in_e_bits_sink(buffer_auto_in_e_bits_sink),
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
    .auto_out_b_ready(buffer_auto_out_b_ready),
    .auto_out_b_valid(buffer_auto_out_b_valid),
    .auto_out_b_bits_opcode(buffer_auto_out_b_bits_opcode),
    .auto_out_b_bits_param(buffer_auto_out_b_bits_param),
    .auto_out_b_bits_size(buffer_auto_out_b_bits_size),
    .auto_out_b_bits_source(buffer_auto_out_b_bits_source),
    .auto_out_b_bits_address(buffer_auto_out_b_bits_address),
    .auto_out_b_bits_mask(buffer_auto_out_b_bits_mask),
    .auto_out_b_bits_data(buffer_auto_out_b_bits_data),
    .auto_out_b_bits_corrupt(buffer_auto_out_b_bits_corrupt),
    .auto_out_c_ready(buffer_auto_out_c_ready),
    .auto_out_c_valid(buffer_auto_out_c_valid),
    .auto_out_c_bits_opcode(buffer_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(buffer_auto_out_c_bits_param),
    .auto_out_c_bits_size(buffer_auto_out_c_bits_size),
    .auto_out_c_bits_source(buffer_auto_out_c_bits_source),
    .auto_out_c_bits_address(buffer_auto_out_c_bits_address),
    .auto_out_c_bits_data(buffer_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt(buffer_auto_out_c_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt),
    .auto_out_e_ready(buffer_auto_out_e_ready),
    .auto_out_e_valid(buffer_auto_out_e_valid),
    .auto_out_e_bits_sink(buffer_auto_out_e_bits_sink)
  );
  TLBuffer_13 buffer_1 ( // @[Buffer.scala 68:28]
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
    .auto_in_b_ready(buffer_1_auto_in_b_ready),
    .auto_in_b_valid(buffer_1_auto_in_b_valid),
    .auto_in_b_bits_opcode(buffer_1_auto_in_b_bits_opcode),
    .auto_in_b_bits_param(buffer_1_auto_in_b_bits_param),
    .auto_in_b_bits_size(buffer_1_auto_in_b_bits_size),
    .auto_in_b_bits_source(buffer_1_auto_in_b_bits_source),
    .auto_in_b_bits_address(buffer_1_auto_in_b_bits_address),
    .auto_in_b_bits_mask(buffer_1_auto_in_b_bits_mask),
    .auto_in_b_bits_data(buffer_1_auto_in_b_bits_data),
    .auto_in_b_bits_corrupt(buffer_1_auto_in_b_bits_corrupt),
    .auto_in_c_ready(buffer_1_auto_in_c_ready),
    .auto_in_c_valid(buffer_1_auto_in_c_valid),
    .auto_in_c_bits_opcode(buffer_1_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(buffer_1_auto_in_c_bits_param),
    .auto_in_c_bits_size(buffer_1_auto_in_c_bits_size),
    .auto_in_c_bits_source(buffer_1_auto_in_c_bits_source),
    .auto_in_c_bits_address(buffer_1_auto_in_c_bits_address),
    .auto_in_c_bits_data(buffer_1_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(buffer_1_auto_in_c_bits_corrupt),
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
    .auto_in_e_ready(buffer_1_auto_in_e_ready),
    .auto_in_e_valid(buffer_1_auto_in_e_valid),
    .auto_in_e_bits_sink(buffer_1_auto_in_e_bits_sink),
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
    .auto_out_b_ready(buffer_1_auto_out_b_ready),
    .auto_out_b_valid(buffer_1_auto_out_b_valid),
    .auto_out_b_bits_opcode(buffer_1_auto_out_b_bits_opcode),
    .auto_out_b_bits_param(buffer_1_auto_out_b_bits_param),
    .auto_out_b_bits_size(buffer_1_auto_out_b_bits_size),
    .auto_out_b_bits_source(buffer_1_auto_out_b_bits_source),
    .auto_out_b_bits_address(buffer_1_auto_out_b_bits_address),
    .auto_out_b_bits_mask(buffer_1_auto_out_b_bits_mask),
    .auto_out_b_bits_data(buffer_1_auto_out_b_bits_data),
    .auto_out_b_bits_corrupt(buffer_1_auto_out_b_bits_corrupt),
    .auto_out_c_ready(buffer_1_auto_out_c_ready),
    .auto_out_c_valid(buffer_1_auto_out_c_valid),
    .auto_out_c_bits_opcode(buffer_1_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(buffer_1_auto_out_c_bits_param),
    .auto_out_c_bits_size(buffer_1_auto_out_c_bits_size),
    .auto_out_c_bits_source(buffer_1_auto_out_c_bits_source),
    .auto_out_c_bits_address(buffer_1_auto_out_c_bits_address),
    .auto_out_c_bits_data(buffer_1_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt(buffer_1_auto_out_c_bits_corrupt),
    .auto_out_d_ready(buffer_1_auto_out_d_ready),
    .auto_out_d_valid(buffer_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_1_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_1_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_1_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_1_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_1_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_1_auto_out_d_bits_corrupt),
    .auto_out_e_ready(buffer_1_auto_out_e_ready),
    .auto_out_e_valid(buffer_1_auto_out_e_valid),
    .auto_out_e_bits_sink(buffer_1_auto_out_e_bits_sink)
  );
  BundleBridgeNexus buffer_2 ( // @[Buffer.scala 68:28]
    .clock(buffer_2_clock),
    .reset(buffer_2_reset)
  );
  BundleBridgeNexus buffer_3 ( // @[Buffer.scala 68:28]
    .clock(buffer_3_clock),
    .reset(buffer_3_reset)
  );
  IntSyncAsyncCrossingSink intsink ( // @[Crossing.scala 74:29]
    .clock(intsink_clock),
    .reset(intsink_reset),
    .auto_in_sync_0(intsink_auto_in_sync_0),
    .auto_out_0(intsink_auto_out_0)
  );
  IntSyncSyncCrossingSink intsink_1 ( // @[Crossing.scala 94:29]
    .clock(intsink_1_clock),
    .reset(intsink_1_reset),
    .auto_in_sync_0(intsink_1_auto_in_sync_0),
    .auto_in_sync_1(intsink_1_auto_in_sync_1),
    .auto_out_0(intsink_1_auto_out_0),
    .auto_out_1(intsink_1_auto_out_1)
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
  BundleBridgeNexus intsource ( // @[Crossing.scala 26:31]
    .clock(intsource_clock),
    .reset(intsource_reset)
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
  IntSyncCrossingSource_1 intsource_3 ( // @[Crossing.scala 26:31]
    .clock(intsource_3_clock),
    .reset(intsource_3_reset),
    .auto_in_0(intsource_3_auto_in_0),
    .auto_out_sync_0(intsource_3_auto_out_sync_0)
  );
  BundleBridgeNexus_14 trace ( // @[BundleBridgeBlockDuringReset.scala 20:27]
    .clock(trace_clock),
    .reset(trace_reset),
    .auto_in_0_valid(trace_auto_in_0_valid),
    .auto_in_0_iaddr(trace_auto_in_0_iaddr),
    .auto_in_0_insn(trace_auto_in_0_insn),
    .auto_in_0_priv(trace_auto_in_0_priv),
    .auto_in_0_exception(trace_auto_in_0_exception),
    .auto_in_0_interrupt(trace_auto_in_0_interrupt),
    .auto_in_0_cause(trace_auto_in_0_cause),
    .auto_in_0_tval(trace_auto_in_0_tval),
    .auto_in_1_valid(trace_auto_in_1_valid),
    .auto_in_1_iaddr(trace_auto_in_1_iaddr),
    .auto_in_1_insn(trace_auto_in_1_insn),
    .auto_in_1_priv(trace_auto_in_1_priv),
    .auto_in_1_exception(trace_auto_in_1_exception),
    .auto_in_1_interrupt(trace_auto_in_1_interrupt),
    .auto_in_1_cause(trace_auto_in_1_cause),
    .auto_in_1_tval(trace_auto_in_1_tval)
  );
  BundleBridgeNexus_15 tracecore ( // @[BundleBridgeBlockDuringReset.scala 20:27]
    .clock(tracecore_clock),
    .reset(tracecore_reset),
    .auto_in_group_0_iretire(tracecore_auto_in_group_0_iretire),
    .auto_in_group_0_iaddr(tracecore_auto_in_group_0_iaddr),
    .auto_in_group_0_itype(tracecore_auto_in_group_0_itype),
    .auto_in_group_0_ilastsize(tracecore_auto_in_group_0_ilastsize),
    .auto_in_priv(tracecore_auto_in_priv),
    .auto_in_tval(tracecore_auto_in_tval),
    .auto_in_cause(tracecore_auto_in_cause)
  );
  assign auto_tile_reset_domain_boom_tile_trace_out_0_valid = tile_reset_domain_auto_boom_tile_trace_out_0_valid; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_0_iaddr = tile_reset_domain_auto_boom_tile_trace_out_0_iaddr; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_0_insn = tile_reset_domain_auto_boom_tile_trace_out_0_insn; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_0_priv = tile_reset_domain_auto_boom_tile_trace_out_0_priv; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_0_exception = tile_reset_domain_auto_boom_tile_trace_out_0_exception
    ; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_0_interrupt = tile_reset_domain_auto_boom_tile_trace_out_0_interrupt
    ; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_0_cause = tile_reset_domain_auto_boom_tile_trace_out_0_cause; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_0_tval = tile_reset_domain_auto_boom_tile_trace_out_0_tval; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_0_wdata = tile_reset_domain_auto_boom_tile_trace_out_0_wdata; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_1_valid = tile_reset_domain_auto_boom_tile_trace_out_1_valid; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_1_iaddr = tile_reset_domain_auto_boom_tile_trace_out_1_iaddr; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_1_insn = tile_reset_domain_auto_boom_tile_trace_out_1_insn; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_1_priv = tile_reset_domain_auto_boom_tile_trace_out_1_priv; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_1_exception = tile_reset_domain_auto_boom_tile_trace_out_1_exception
    ; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_1_interrupt = tile_reset_domain_auto_boom_tile_trace_out_1_interrupt
    ; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_1_cause = tile_reset_domain_auto_boom_tile_trace_out_1_cause; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_1_tval = tile_reset_domain_auto_boom_tile_trace_out_1_tval; // @[LazyModule.scala 311:12]
  assign auto_tile_reset_domain_boom_tile_trace_out_1_wdata = tile_reset_domain_auto_boom_tile_trace_out_1_wdata; // @[LazyModule.scala 311:12]
  assign auto_int_out_clock_xing_out_2_sync_0 = intsource_3_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_int_out_clock_xing_out_1_sync_0 = intsource_2_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_int_out_clock_xing_out_0_sync_0 = intsource_1_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_valid = buffer_1_auto_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_opcode = buffer_1_auto_out_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_param = buffer_1_auto_out_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_size = buffer_1_auto_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_source = buffer_1_auto_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_address = buffer_1_auto_out_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_mask = buffer_1_auto_out_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_data = buffer_1_auto_out_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_corrupt = buffer_1_auto_out_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_b_ready = buffer_1_auto_out_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_valid = buffer_1_auto_out_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_opcode = buffer_1_auto_out_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_param = buffer_1_auto_out_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_size = buffer_1_auto_out_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_source = buffer_1_auto_out_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_address = buffer_1_auto_out_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_data = buffer_1_auto_out_c_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_corrupt = buffer_1_auto_out_c_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_d_ready = buffer_1_auto_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_e_valid = buffer_1_auto_out_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_e_bits_sink = buffer_1_auto_out_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign tile_reset_domain_auto_boom_tile_int_local_in_3_0 = intsink_3_auto_out_0; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_boom_tile_int_local_in_2_0 = intsink_2_auto_out_0; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_boom_tile_int_local_in_1_0 = intsink_1_auto_out_0; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_boom_tile_int_local_in_1_1 = intsink_1_auto_out_1; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_boom_tile_int_local_in_0_0 = intsink_auto_out_0; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_boom_tile_nmi_in_rnmi = auto_tile_reset_domain_boom_tile_nmi_in_rnmi; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_auto_boom_tile_nmi_in_rnmi_interrupt_vector =
    auto_tile_reset_domain_boom_tile_nmi_in_rnmi_interrupt_vector; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_auto_boom_tile_nmi_in_rnmi_exception_vector =
    auto_tile_reset_domain_boom_tile_nmi_in_rnmi_exception_vector; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_auto_boom_tile_nmi_in_unmi = auto_tile_reset_domain_boom_tile_nmi_in_unmi; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_auto_boom_tile_nmi_in_unmi_interrupt_vector =
    auto_tile_reset_domain_boom_tile_nmi_in_unmi_interrupt_vector; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_auto_boom_tile_nmi_in_unmi_exception_vector =
    auto_tile_reset_domain_boom_tile_nmi_in_unmi_exception_vector; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_auto_boom_tile_reset_vector_in = auto_tile_reset_domain_boom_tile_reset_vector_in; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_auto_boom_tile_hartid_in = auto_tile_reset_domain_boom_tile_hartid_in; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_ready = buffer_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_valid = buffer_auto_in_b_valid; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_opcode = buffer_auto_in_b_bits_opcode; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_param = buffer_auto_in_b_bits_param; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_size = buffer_auto_in_b_bits_size; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_source = buffer_auto_in_b_bits_source; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_address = buffer_auto_in_b_bits_address; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_mask = buffer_auto_in_b_bits_mask; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_data = buffer_auto_in_b_bits_data; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_bits_corrupt = buffer_auto_in_b_bits_corrupt; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_ready = buffer_auto_in_c_ready; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_valid = buffer_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_param = buffer_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_size = buffer_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_source = buffer_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_sink = buffer_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_denied = buffer_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_data = buffer_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_boom_tile_tl_other_masters_out_e_ready = buffer_auto_in_e_ready; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_clock_in_clock = clockNode_auto_out_clock; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_clock_in_reset = clockNode_auto_out_reset; // @[LazyModule.scala 296:16]
  assign clockNode_auto_in_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign clockNode_auto_in_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_valid = tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_opcode = tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_param = tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_size = tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_source = tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_address = tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_mask = tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_data = tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_corrupt = tile_reset_domain_auto_boom_tile_tl_other_masters_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_b_ready = tile_reset_domain_auto_boom_tile_tl_other_masters_out_b_ready; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_valid = tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_opcode = tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_param = tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_size = tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_source = tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_address = tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_data = tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_corrupt = tile_reset_domain_auto_boom_tile_tl_other_masters_out_c_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_d_ready = tile_reset_domain_auto_boom_tile_tl_other_masters_out_d_ready; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_e_valid = tile_reset_domain_auto_boom_tile_tl_other_masters_out_e_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_e_bits_sink = tile_reset_domain_auto_boom_tile_tl_other_masters_out_e_bits_sink; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_a_ready = buffer_1_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_valid = buffer_1_auto_in_b_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_opcode = buffer_1_auto_in_b_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_param = buffer_1_auto_in_b_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_size = buffer_1_auto_in_b_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_source = buffer_1_auto_in_b_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_address = buffer_1_auto_in_b_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_mask = buffer_1_auto_in_b_bits_mask; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_data = buffer_1_auto_in_b_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_corrupt = buffer_1_auto_in_b_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_c_ready = buffer_1_auto_in_c_ready; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_valid = buffer_1_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_opcode = buffer_1_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_param = buffer_1_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_size = buffer_1_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_source = buffer_1_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_sink = buffer_1_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_denied = buffer_1_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_data = buffer_1_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_corrupt = buffer_1_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_e_ready = buffer_1_auto_in_e_ready; // @[LazyModule.scala 298:16]
  assign buffer_1_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_valid = buffer_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_param = buffer_auto_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_size = buffer_auto_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_source = buffer_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_address = buffer_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_mask = buffer_auto_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_data = buffer_auto_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_b_ready = buffer_auto_out_b_ready; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_valid = buffer_auto_out_c_valid; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_opcode = buffer_auto_out_c_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_param = buffer_auto_out_c_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_size = buffer_auto_out_c_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_source = buffer_auto_out_c_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_address = buffer_auto_out_c_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_data = buffer_auto_out_c_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_corrupt = buffer_auto_out_c_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_d_ready = buffer_auto_out_d_ready; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_e_valid = buffer_auto_out_e_valid; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_e_bits_sink = buffer_auto_out_e_bits_sink; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_out_a_ready = auto_tl_master_clock_xing_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_valid = auto_tl_master_clock_xing_out_b_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_bits_opcode = auto_tl_master_clock_xing_out_b_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_bits_param = auto_tl_master_clock_xing_out_b_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_bits_size = auto_tl_master_clock_xing_out_b_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_bits_source = auto_tl_master_clock_xing_out_b_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_bits_address = auto_tl_master_clock_xing_out_b_bits_address; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_bits_mask = auto_tl_master_clock_xing_out_b_bits_mask; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_bits_data = auto_tl_master_clock_xing_out_b_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_bits_corrupt = auto_tl_master_clock_xing_out_b_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_c_ready = auto_tl_master_clock_xing_out_c_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_valid = auto_tl_master_clock_xing_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_opcode = auto_tl_master_clock_xing_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_param = auto_tl_master_clock_xing_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_size = auto_tl_master_clock_xing_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_source = auto_tl_master_clock_xing_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_sink = auto_tl_master_clock_xing_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_denied = auto_tl_master_clock_xing_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_data = auto_tl_master_clock_xing_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_corrupt = auto_tl_master_clock_xing_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_e_ready = auto_tl_master_clock_xing_out_e_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_2_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_2_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_3_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_3_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_auto_in_sync_0 = auto_intsink_in_sync_0; // @[LazyModule.scala 309:16]
  assign intsink_1_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_1_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_1_auto_in_sync_0 = auto_int_in_clock_xing_in_0_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_1_auto_in_sync_1 = auto_int_in_clock_xing_in_0_sync_1; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_2_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_2_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_2_auto_in_sync_0 = auto_int_in_clock_xing_in_1_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_3_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_3_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_3_auto_in_sync_0 = auto_int_in_clock_xing_in_2_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_1_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_1_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_1_auto_in_0 = tile_reset_domain_auto_boom_tile_halt_out_0; // @[LazyModule.scala 298:16]
  assign intsource_2_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_2_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_2_auto_in_0 = tile_reset_domain_auto_boom_tile_wfi_out_0; // @[LazyModule.scala 298:16]
  assign intsource_3_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_3_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_3_auto_in_0 = tile_reset_domain_auto_boom_tile_cease_out_0; // @[LazyModule.scala 298:16]
  assign trace_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign trace_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign trace_auto_in_0_valid = tile_reset_domain_auto_boom_tile_broadcast_out_0_valid; // @[LazyModule.scala 298:16]
  assign trace_auto_in_0_iaddr = tile_reset_domain_auto_boom_tile_broadcast_out_0_iaddr; // @[LazyModule.scala 298:16]
  assign trace_auto_in_0_insn = tile_reset_domain_auto_boom_tile_broadcast_out_0_insn; // @[LazyModule.scala 298:16]
  assign trace_auto_in_0_priv = tile_reset_domain_auto_boom_tile_broadcast_out_0_priv; // @[LazyModule.scala 298:16]
  assign trace_auto_in_0_exception = tile_reset_domain_auto_boom_tile_broadcast_out_0_exception; // @[LazyModule.scala 298:16]
  assign trace_auto_in_0_interrupt = tile_reset_domain_auto_boom_tile_broadcast_out_0_interrupt; // @[LazyModule.scala 298:16]
  assign trace_auto_in_0_cause = tile_reset_domain_auto_boom_tile_broadcast_out_0_cause; // @[LazyModule.scala 298:16]
  assign trace_auto_in_0_tval = tile_reset_domain_auto_boom_tile_broadcast_out_0_tval; // @[LazyModule.scala 298:16]
  assign trace_auto_in_1_valid = tile_reset_domain_auto_boom_tile_broadcast_out_1_valid; // @[LazyModule.scala 298:16]
  assign trace_auto_in_1_iaddr = tile_reset_domain_auto_boom_tile_broadcast_out_1_iaddr; // @[LazyModule.scala 298:16]
  assign trace_auto_in_1_insn = tile_reset_domain_auto_boom_tile_broadcast_out_1_insn; // @[LazyModule.scala 298:16]
  assign trace_auto_in_1_priv = tile_reset_domain_auto_boom_tile_broadcast_out_1_priv; // @[LazyModule.scala 298:16]
  assign trace_auto_in_1_exception = tile_reset_domain_auto_boom_tile_broadcast_out_1_exception; // @[LazyModule.scala 298:16]
  assign trace_auto_in_1_interrupt = tile_reset_domain_auto_boom_tile_broadcast_out_1_interrupt; // @[LazyModule.scala 298:16]
  assign trace_auto_in_1_cause = tile_reset_domain_auto_boom_tile_broadcast_out_1_cause; // @[LazyModule.scala 298:16]
  assign trace_auto_in_1_tval = tile_reset_domain_auto_boom_tile_broadcast_out_1_tval; // @[LazyModule.scala 298:16]
  assign tracecore_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign tracecore_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign tracecore_auto_in_group_0_iretire = tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_iretire; // @[LazyModule.scala 298:16]
  assign tracecore_auto_in_group_0_iaddr = tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_iaddr; // @[LazyModule.scala 298:16]
  assign tracecore_auto_in_group_0_itype = tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_itype; // @[LazyModule.scala 298:16]
  assign tracecore_auto_in_group_0_ilastsize = tile_reset_domain_auto_boom_tile_trace_core_source_out_group_0_ilastsize; // @[LazyModule.scala 298:16]
  assign tracecore_auto_in_priv = tile_reset_domain_auto_boom_tile_trace_core_source_out_priv; // @[LazyModule.scala 298:16]
  assign tracecore_auto_in_tval = tile_reset_domain_auto_boom_tile_trace_core_source_out_tval; // @[LazyModule.scala 298:16]
  assign tracecore_auto_in_cause = tile_reset_domain_auto_boom_tile_trace_core_source_out_cause; // @[LazyModule.scala 298:16]
endmodule
