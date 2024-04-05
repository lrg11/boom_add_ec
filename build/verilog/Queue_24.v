module Queue_24(
  input          clock,
  input          reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [39:0]  io_enq_bits_pc,
  input  [39:0]  io_enq_bits_next_pc,
  input          io_enq_bits_edge_inst_0,
  input  [31:0]  io_enq_bits_insts_0,
  input  [31:0]  io_enq_bits_insts_1,
  input  [31:0]  io_enq_bits_insts_2,
  input  [31:0]  io_enq_bits_insts_3,
  input  [31:0]  io_enq_bits_exp_insts_0,
  input  [31:0]  io_enq_bits_exp_insts_1,
  input  [31:0]  io_enq_bits_exp_insts_2,
  input  [31:0]  io_enq_bits_exp_insts_3,
  input          io_enq_bits_sfbs_0,
  input          io_enq_bits_sfbs_1,
  input          io_enq_bits_sfbs_2,
  input          io_enq_bits_sfbs_3,
  input  [7:0]   io_enq_bits_sfb_masks_0,
  input  [7:0]   io_enq_bits_sfb_masks_1,
  input  [7:0]   io_enq_bits_sfb_masks_2,
  input  [7:0]   io_enq_bits_sfb_masks_3,
  input  [3:0]   io_enq_bits_sfb_dests_0,
  input  [3:0]   io_enq_bits_sfb_dests_1,
  input  [3:0]   io_enq_bits_sfb_dests_2,
  input  [3:0]   io_enq_bits_sfb_dests_3,
  input          io_enq_bits_shadowable_mask_0,
  input          io_enq_bits_shadowable_mask_1,
  input          io_enq_bits_shadowable_mask_2,
  input          io_enq_bits_shadowable_mask_3,
  input          io_enq_bits_shadowed_mask_0,
  input          io_enq_bits_shadowed_mask_1,
  input          io_enq_bits_shadowed_mask_2,
  input          io_enq_bits_shadowed_mask_3,
  input          io_enq_bits_cfi_idx_valid,
  input  [1:0]   io_enq_bits_cfi_idx_bits,
  input  [2:0]   io_enq_bits_cfi_type,
  input          io_enq_bits_cfi_is_call,
  input          io_enq_bits_cfi_is_ret,
  input          io_enq_bits_cfi_npc_plus4,
  input  [39:0]  io_enq_bits_ras_top,
  input  [4:0]   io_enq_bits_ftq_idx,
  input  [3:0]   io_enq_bits_mask,
  input  [3:0]   io_enq_bits_br_mask,
  input  [63:0]  io_enq_bits_ghist_old_history,
  input          io_enq_bits_ghist_current_saw_branch_not_taken,
  input          io_enq_bits_ghist_new_saw_branch_not_taken,
  input          io_enq_bits_ghist_new_saw_branch_taken,
  input  [4:0]   io_enq_bits_ghist_ras_idx,
  input          io_enq_bits_lhist_0,
  input          io_enq_bits_xcpt_pf_if,
  input          io_enq_bits_xcpt_ae_if,
  input          io_enq_bits_bp_debug_if_oh_0,
  input          io_enq_bits_bp_debug_if_oh_1,
  input          io_enq_bits_bp_debug_if_oh_2,
  input          io_enq_bits_bp_debug_if_oh_3,
  input          io_enq_bits_bp_xcpt_if_oh_0,
  input          io_enq_bits_bp_xcpt_if_oh_1,
  input          io_enq_bits_bp_xcpt_if_oh_2,
  input          io_enq_bits_bp_xcpt_if_oh_3,
  input          io_enq_bits_end_half_valid,
  input  [15:0]  io_enq_bits_end_half_bits,
  input  [119:0] io_enq_bits_bpd_meta_0,
  input  [1:0]   io_enq_bits_fsrc,
  input  [1:0]   io_enq_bits_tsrc,
  input          io_deq_ready,
  output         io_deq_valid,
  output [39:0]  io_deq_bits_pc,
  output [39:0]  io_deq_bits_next_pc,
  output         io_deq_bits_edge_inst_0,
  output [31:0]  io_deq_bits_insts_0,
  output [31:0]  io_deq_bits_insts_1,
  output [31:0]  io_deq_bits_insts_2,
  output [31:0]  io_deq_bits_insts_3,
  output [31:0]  io_deq_bits_exp_insts_0,
  output [31:0]  io_deq_bits_exp_insts_1,
  output [31:0]  io_deq_bits_exp_insts_2,
  output [31:0]  io_deq_bits_exp_insts_3,
  output         io_deq_bits_sfbs_0,
  output         io_deq_bits_sfbs_1,
  output         io_deq_bits_sfbs_2,
  output         io_deq_bits_sfbs_3,
  output [7:0]   io_deq_bits_sfb_masks_0,
  output [7:0]   io_deq_bits_sfb_masks_1,
  output [7:0]   io_deq_bits_sfb_masks_2,
  output [7:0]   io_deq_bits_sfb_masks_3,
  output [3:0]   io_deq_bits_sfb_dests_0,
  output [3:0]   io_deq_bits_sfb_dests_1,
  output [3:0]   io_deq_bits_sfb_dests_2,
  output [3:0]   io_deq_bits_sfb_dests_3,
  output         io_deq_bits_shadowable_mask_0,
  output         io_deq_bits_shadowable_mask_1,
  output         io_deq_bits_shadowable_mask_2,
  output         io_deq_bits_shadowable_mask_3,
  output         io_deq_bits_shadowed_mask_0,
  output         io_deq_bits_shadowed_mask_1,
  output         io_deq_bits_shadowed_mask_2,
  output         io_deq_bits_shadowed_mask_3,
  output         io_deq_bits_cfi_idx_valid,
  output [1:0]   io_deq_bits_cfi_idx_bits,
  output [2:0]   io_deq_bits_cfi_type,
  output         io_deq_bits_cfi_is_call,
  output         io_deq_bits_cfi_is_ret,
  output         io_deq_bits_cfi_npc_plus4,
  output [39:0]  io_deq_bits_ras_top,
  output [4:0]   io_deq_bits_ftq_idx,
  output [3:0]   io_deq_bits_mask,
  output [3:0]   io_deq_bits_br_mask,
  output [63:0]  io_deq_bits_ghist_old_history,
  output         io_deq_bits_ghist_current_saw_branch_not_taken,
  output         io_deq_bits_ghist_new_saw_branch_not_taken,
  output         io_deq_bits_ghist_new_saw_branch_taken,
  output [4:0]   io_deq_bits_ghist_ras_idx,
  output         io_deq_bits_lhist_0,
  output         io_deq_bits_xcpt_pf_if,
  output         io_deq_bits_xcpt_ae_if,
  output         io_deq_bits_bp_debug_if_oh_0,
  output         io_deq_bits_bp_debug_if_oh_1,
  output         io_deq_bits_bp_debug_if_oh_2,
  output         io_deq_bits_bp_debug_if_oh_3,
  output         io_deq_bits_bp_xcpt_if_oh_0,
  output         io_deq_bits_bp_xcpt_if_oh_1,
  output         io_deq_bits_bp_xcpt_if_oh_2,
  output         io_deq_bits_bp_xcpt_if_oh_3,
  output         io_deq_bits_end_half_valid,
  output [15:0]  io_deq_bits_end_half_bits,
  output [119:0] io_deq_bits_bpd_meta_0,
  output [1:0]   io_deq_bits_fsrc,
  output [1:0]   io_deq_bits_tsrc,
  output         io_count
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [127:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_62;
`endif // RANDOMIZE_REG_INIT
  reg [39:0] ram_pc [0:0]; // @[Decoupled.scala 218:16]
  wire [39:0] ram_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_pc_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [39:0] ram_pc_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_pc_MPORT_en; // @[Decoupled.scala 218:16]
  reg [39:0] ram_next_pc [0:0]; // @[Decoupled.scala 218:16]
  wire [39:0] ram_next_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_next_pc_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [39:0] ram_next_pc_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_next_pc_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_next_pc_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_next_pc_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_edge_inst_0 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_edge_inst_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_edge_inst_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_edge_inst_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_edge_inst_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_edge_inst_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_edge_inst_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg [31:0] ram_insts_0 [0:0]; // @[Decoupled.scala 218:16]
  wire [31:0] ram_insts_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_insts_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [31:0] ram_insts_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_insts_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_insts_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_insts_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg [31:0] ram_insts_1 [0:0]; // @[Decoupled.scala 218:16]
  wire [31:0] ram_insts_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_insts_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [31:0] ram_insts_1_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_insts_1_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_insts_1_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_insts_1_MPORT_en; // @[Decoupled.scala 218:16]
  reg [31:0] ram_insts_2 [0:0]; // @[Decoupled.scala 218:16]
  wire [31:0] ram_insts_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_insts_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [31:0] ram_insts_2_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_insts_2_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_insts_2_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_insts_2_MPORT_en; // @[Decoupled.scala 218:16]
  reg [31:0] ram_insts_3 [0:0]; // @[Decoupled.scala 218:16]
  wire [31:0] ram_insts_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_insts_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [31:0] ram_insts_3_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_insts_3_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_insts_3_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_insts_3_MPORT_en; // @[Decoupled.scala 218:16]
  reg [31:0] ram_exp_insts_0 [0:0]; // @[Decoupled.scala 218:16]
  wire [31:0] ram_exp_insts_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [31:0] ram_exp_insts_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg [31:0] ram_exp_insts_1 [0:0]; // @[Decoupled.scala 218:16]
  wire [31:0] ram_exp_insts_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [31:0] ram_exp_insts_1_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_1_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_1_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_1_MPORT_en; // @[Decoupled.scala 218:16]
  reg [31:0] ram_exp_insts_2 [0:0]; // @[Decoupled.scala 218:16]
  wire [31:0] ram_exp_insts_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [31:0] ram_exp_insts_2_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_2_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_2_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_2_MPORT_en; // @[Decoupled.scala 218:16]
  reg [31:0] ram_exp_insts_3 [0:0]; // @[Decoupled.scala 218:16]
  wire [31:0] ram_exp_insts_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [31:0] ram_exp_insts_3_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_3_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_3_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_exp_insts_3_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_sfbs_0 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_sfbs_1 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_1_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_1_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_1_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_1_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_sfbs_2 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_2_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_2_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_2_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_2_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_sfbs_3 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_3_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_3_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_3_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfbs_3_MPORT_en; // @[Decoupled.scala 218:16]
  reg [7:0] ram_sfb_masks_0 [0:0]; // @[Decoupled.scala 218:16]
  wire [7:0] ram_sfb_masks_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [7:0] ram_sfb_masks_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg [7:0] ram_sfb_masks_1 [0:0]; // @[Decoupled.scala 218:16]
  wire [7:0] ram_sfb_masks_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [7:0] ram_sfb_masks_1_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_1_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_1_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_1_MPORT_en; // @[Decoupled.scala 218:16]
  reg [7:0] ram_sfb_masks_2 [0:0]; // @[Decoupled.scala 218:16]
  wire [7:0] ram_sfb_masks_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [7:0] ram_sfb_masks_2_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_2_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_2_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_2_MPORT_en; // @[Decoupled.scala 218:16]
  reg [7:0] ram_sfb_masks_3 [0:0]; // @[Decoupled.scala 218:16]
  wire [7:0] ram_sfb_masks_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [7:0] ram_sfb_masks_3_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_3_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_3_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfb_masks_3_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] ram_sfb_dests_0 [0:0]; // @[Decoupled.scala 218:16]
  wire [3:0] ram_sfb_dests_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [3:0] ram_sfb_dests_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] ram_sfb_dests_1 [0:0]; // @[Decoupled.scala 218:16]
  wire [3:0] ram_sfb_dests_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [3:0] ram_sfb_dests_1_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_1_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_1_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_1_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] ram_sfb_dests_2 [0:0]; // @[Decoupled.scala 218:16]
  wire [3:0] ram_sfb_dests_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [3:0] ram_sfb_dests_2_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_2_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_2_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_2_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] ram_sfb_dests_3 [0:0]; // @[Decoupled.scala 218:16]
  wire [3:0] ram_sfb_dests_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [3:0] ram_sfb_dests_3_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_3_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_3_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_sfb_dests_3_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_shadowable_mask_0 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_shadowable_mask_1 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_1_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_1_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_1_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_1_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_shadowable_mask_2 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_2_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_2_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_2_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_2_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_shadowable_mask_3 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_3_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_3_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_3_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_shadowable_mask_3_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_shadowed_mask_0 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_shadowed_mask_1 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_1_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_1_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_1_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_1_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_shadowed_mask_2 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_2_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_2_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_2_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_2_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_shadowed_mask_3 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_3_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_3_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_3_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_shadowed_mask_3_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_cfi_idx_valid [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_valid_MPORT_en; // @[Decoupled.scala 218:16]
  reg [1:0] ram_cfi_idx_bits [0:0]; // @[Decoupled.scala 218:16]
  wire [1:0] ram_cfi_idx_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_bits_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [1:0] ram_cfi_idx_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_bits_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_idx_bits_MPORT_en; // @[Decoupled.scala 218:16]
  reg [2:0] ram_cfi_type [0:0]; // @[Decoupled.scala 218:16]
  wire [2:0] ram_cfi_type_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_type_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [2:0] ram_cfi_type_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_type_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_type_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_type_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_cfi_is_call [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_call_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_call_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_call_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_call_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_call_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_call_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_cfi_is_ret [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_ret_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_ret_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_ret_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_ret_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_ret_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_is_ret_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_cfi_npc_plus4 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_cfi_npc_plus4_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_npc_plus4_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_npc_plus4_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_cfi_npc_plus4_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_cfi_npc_plus4_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_cfi_npc_plus4_MPORT_en; // @[Decoupled.scala 218:16]
  reg [39:0] ram_ras_top [0:0]; // @[Decoupled.scala 218:16]
  wire [39:0] ram_ras_top_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ras_top_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [39:0] ram_ras_top_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ras_top_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ras_top_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ras_top_MPORT_en; // @[Decoupled.scala 218:16]
  reg [4:0] ram_ftq_idx [0:0]; // @[Decoupled.scala 218:16]
  wire [4:0] ram_ftq_idx_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ftq_idx_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [4:0] ram_ftq_idx_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ftq_idx_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ftq_idx_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ftq_idx_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] ram_mask [0:0]; // @[Decoupled.scala 218:16]
  wire [3:0] ram_mask_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_mask_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [3:0] ram_mask_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_mask_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_mask_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_mask_MPORT_en; // @[Decoupled.scala 218:16]
  reg [3:0] ram_br_mask [0:0]; // @[Decoupled.scala 218:16]
  wire [3:0] ram_br_mask_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_br_mask_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [3:0] ram_br_mask_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_br_mask_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_br_mask_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_br_mask_MPORT_en; // @[Decoupled.scala 218:16]
  reg [63:0] ram_ghist_old_history [0:0]; // @[Decoupled.scala 218:16]
  wire [63:0] ram_ghist_old_history_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [63:0] ram_ghist_old_history_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_old_history_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_ghist_current_saw_branch_not_taken [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_current_saw_branch_not_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_ghist_new_saw_branch_not_taken [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_not_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_ghist_new_saw_branch_taken [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_new_saw_branch_taken_MPORT_en; // @[Decoupled.scala 218:16]
  reg [4:0] ram_ghist_ras_idx [0:0]; // @[Decoupled.scala 218:16]
  wire [4:0] ram_ghist_ras_idx_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [4:0] ram_ghist_ras_idx_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_ghist_ras_idx_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_lhist_0 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_lhist_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_xcpt_pf_if [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_if_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_if_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_if_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_if_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_if_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_pf_if_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_xcpt_ae_if [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_if_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_if_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_if_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_if_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_if_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_xcpt_ae_if_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_bp_debug_if_oh_0 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_bp_debug_if_oh_1 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_1_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_1_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_1_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_1_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_bp_debug_if_oh_2 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_2_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_2_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_2_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_2_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_bp_debug_if_oh_3 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_3_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_3_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_3_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_bp_debug_if_oh_3_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_bp_xcpt_if_oh_0 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_bp_xcpt_if_oh_1 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_1_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_1_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_1_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_1_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_bp_xcpt_if_oh_2 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_2_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_2_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_2_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_2_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_bp_xcpt_if_oh_3 [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_3_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_3_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_3_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_bp_xcpt_if_oh_3_MPORT_en; // @[Decoupled.scala 218:16]
  reg  ram_end_half_valid [0:0]; // @[Decoupled.scala 218:16]
  wire  ram_end_half_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_end_half_valid_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_end_half_valid_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_end_half_valid_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_end_half_valid_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_end_half_valid_MPORT_en; // @[Decoupled.scala 218:16]
  reg [15:0] ram_end_half_bits [0:0]; // @[Decoupled.scala 218:16]
  wire [15:0] ram_end_half_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_end_half_bits_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [15:0] ram_end_half_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_end_half_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_end_half_bits_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_end_half_bits_MPORT_en; // @[Decoupled.scala 218:16]
  reg [119:0] ram_bpd_meta_0 [0:0]; // @[Decoupled.scala 218:16]
  wire [119:0] ram_bpd_meta_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bpd_meta_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [119:0] ram_bpd_meta_0_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_bpd_meta_0_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_bpd_meta_0_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_bpd_meta_0_MPORT_en; // @[Decoupled.scala 218:16]
  reg [1:0] ram_fsrc [0:0]; // @[Decoupled.scala 218:16]
  wire [1:0] ram_fsrc_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_fsrc_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [1:0] ram_fsrc_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_fsrc_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_fsrc_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_fsrc_MPORT_en; // @[Decoupled.scala 218:16]
  reg [1:0] ram_tsrc [0:0]; // @[Decoupled.scala 218:16]
  wire [1:0] ram_tsrc_io_deq_bits_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_tsrc_io_deq_bits_MPORT_addr; // @[Decoupled.scala 218:16]
  wire [1:0] ram_tsrc_MPORT_data; // @[Decoupled.scala 218:16]
  wire  ram_tsrc_MPORT_addr; // @[Decoupled.scala 218:16]
  wire  ram_tsrc_MPORT_mask; // @[Decoupled.scala 218:16]
  wire  ram_tsrc_MPORT_en; // @[Decoupled.scala 218:16]
  reg  maybe_full; // @[Decoupled.scala 221:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 224:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 40:37]
  assign ram_pc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_pc_io_deq_bits_MPORT_data = ram_pc[ram_pc_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_pc_MPORT_data = io_enq_bits_pc;
  assign ram_pc_MPORT_addr = 1'h0;
  assign ram_pc_MPORT_mask = 1'h1;
  assign ram_pc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_next_pc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_next_pc_io_deq_bits_MPORT_data = ram_next_pc[ram_next_pc_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_next_pc_MPORT_data = io_enq_bits_next_pc;
  assign ram_next_pc_MPORT_addr = 1'h0;
  assign ram_next_pc_MPORT_mask = 1'h1;
  assign ram_next_pc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_edge_inst_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_edge_inst_0_io_deq_bits_MPORT_data = ram_edge_inst_0[ram_edge_inst_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_edge_inst_0_MPORT_data = io_enq_bits_edge_inst_0;
  assign ram_edge_inst_0_MPORT_addr = 1'h0;
  assign ram_edge_inst_0_MPORT_mask = 1'h1;
  assign ram_edge_inst_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_insts_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_insts_0_io_deq_bits_MPORT_data = ram_insts_0[ram_insts_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_insts_0_MPORT_data = io_enq_bits_insts_0;
  assign ram_insts_0_MPORT_addr = 1'h0;
  assign ram_insts_0_MPORT_mask = 1'h1;
  assign ram_insts_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_insts_1_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_insts_1_io_deq_bits_MPORT_data = ram_insts_1[ram_insts_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_insts_1_MPORT_data = io_enq_bits_insts_1;
  assign ram_insts_1_MPORT_addr = 1'h0;
  assign ram_insts_1_MPORT_mask = 1'h1;
  assign ram_insts_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_insts_2_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_insts_2_io_deq_bits_MPORT_data = ram_insts_2[ram_insts_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_insts_2_MPORT_data = io_enq_bits_insts_2;
  assign ram_insts_2_MPORT_addr = 1'h0;
  assign ram_insts_2_MPORT_mask = 1'h1;
  assign ram_insts_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_insts_3_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_insts_3_io_deq_bits_MPORT_data = ram_insts_3[ram_insts_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_insts_3_MPORT_data = io_enq_bits_insts_3;
  assign ram_insts_3_MPORT_addr = 1'h0;
  assign ram_insts_3_MPORT_mask = 1'h1;
  assign ram_insts_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_exp_insts_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_exp_insts_0_io_deq_bits_MPORT_data = ram_exp_insts_0[ram_exp_insts_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_exp_insts_0_MPORT_data = io_enq_bits_exp_insts_0;
  assign ram_exp_insts_0_MPORT_addr = 1'h0;
  assign ram_exp_insts_0_MPORT_mask = 1'h1;
  assign ram_exp_insts_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_exp_insts_1_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_exp_insts_1_io_deq_bits_MPORT_data = ram_exp_insts_1[ram_exp_insts_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_exp_insts_1_MPORT_data = io_enq_bits_exp_insts_1;
  assign ram_exp_insts_1_MPORT_addr = 1'h0;
  assign ram_exp_insts_1_MPORT_mask = 1'h1;
  assign ram_exp_insts_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_exp_insts_2_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_exp_insts_2_io_deq_bits_MPORT_data = ram_exp_insts_2[ram_exp_insts_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_exp_insts_2_MPORT_data = io_enq_bits_exp_insts_2;
  assign ram_exp_insts_2_MPORT_addr = 1'h0;
  assign ram_exp_insts_2_MPORT_mask = 1'h1;
  assign ram_exp_insts_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_exp_insts_3_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_exp_insts_3_io_deq_bits_MPORT_data = ram_exp_insts_3[ram_exp_insts_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_exp_insts_3_MPORT_data = io_enq_bits_exp_insts_3;
  assign ram_exp_insts_3_MPORT_addr = 1'h0;
  assign ram_exp_insts_3_MPORT_mask = 1'h1;
  assign ram_exp_insts_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfbs_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfbs_0_io_deq_bits_MPORT_data = ram_sfbs_0[ram_sfbs_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfbs_0_MPORT_data = io_enq_bits_sfbs_0;
  assign ram_sfbs_0_MPORT_addr = 1'h0;
  assign ram_sfbs_0_MPORT_mask = 1'h1;
  assign ram_sfbs_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfbs_1_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfbs_1_io_deq_bits_MPORT_data = ram_sfbs_1[ram_sfbs_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfbs_1_MPORT_data = io_enq_bits_sfbs_1;
  assign ram_sfbs_1_MPORT_addr = 1'h0;
  assign ram_sfbs_1_MPORT_mask = 1'h1;
  assign ram_sfbs_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfbs_2_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfbs_2_io_deq_bits_MPORT_data = ram_sfbs_2[ram_sfbs_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfbs_2_MPORT_data = io_enq_bits_sfbs_2;
  assign ram_sfbs_2_MPORT_addr = 1'h0;
  assign ram_sfbs_2_MPORT_mask = 1'h1;
  assign ram_sfbs_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfbs_3_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfbs_3_io_deq_bits_MPORT_data = ram_sfbs_3[ram_sfbs_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfbs_3_MPORT_data = io_enq_bits_sfbs_3;
  assign ram_sfbs_3_MPORT_addr = 1'h0;
  assign ram_sfbs_3_MPORT_mask = 1'h1;
  assign ram_sfbs_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfb_masks_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfb_masks_0_io_deq_bits_MPORT_data = ram_sfb_masks_0[ram_sfb_masks_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfb_masks_0_MPORT_data = io_enq_bits_sfb_masks_0;
  assign ram_sfb_masks_0_MPORT_addr = 1'h0;
  assign ram_sfb_masks_0_MPORT_mask = 1'h1;
  assign ram_sfb_masks_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfb_masks_1_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfb_masks_1_io_deq_bits_MPORT_data = ram_sfb_masks_1[ram_sfb_masks_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfb_masks_1_MPORT_data = io_enq_bits_sfb_masks_1;
  assign ram_sfb_masks_1_MPORT_addr = 1'h0;
  assign ram_sfb_masks_1_MPORT_mask = 1'h1;
  assign ram_sfb_masks_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfb_masks_2_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfb_masks_2_io_deq_bits_MPORT_data = ram_sfb_masks_2[ram_sfb_masks_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfb_masks_2_MPORT_data = io_enq_bits_sfb_masks_2;
  assign ram_sfb_masks_2_MPORT_addr = 1'h0;
  assign ram_sfb_masks_2_MPORT_mask = 1'h1;
  assign ram_sfb_masks_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfb_masks_3_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfb_masks_3_io_deq_bits_MPORT_data = ram_sfb_masks_3[ram_sfb_masks_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfb_masks_3_MPORT_data = io_enq_bits_sfb_masks_3;
  assign ram_sfb_masks_3_MPORT_addr = 1'h0;
  assign ram_sfb_masks_3_MPORT_mask = 1'h1;
  assign ram_sfb_masks_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfb_dests_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfb_dests_0_io_deq_bits_MPORT_data = ram_sfb_dests_0[ram_sfb_dests_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfb_dests_0_MPORT_data = io_enq_bits_sfb_dests_0;
  assign ram_sfb_dests_0_MPORT_addr = 1'h0;
  assign ram_sfb_dests_0_MPORT_mask = 1'h1;
  assign ram_sfb_dests_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfb_dests_1_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfb_dests_1_io_deq_bits_MPORT_data = ram_sfb_dests_1[ram_sfb_dests_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfb_dests_1_MPORT_data = io_enq_bits_sfb_dests_1;
  assign ram_sfb_dests_1_MPORT_addr = 1'h0;
  assign ram_sfb_dests_1_MPORT_mask = 1'h1;
  assign ram_sfb_dests_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfb_dests_2_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfb_dests_2_io_deq_bits_MPORT_data = ram_sfb_dests_2[ram_sfb_dests_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfb_dests_2_MPORT_data = io_enq_bits_sfb_dests_2;
  assign ram_sfb_dests_2_MPORT_addr = 1'h0;
  assign ram_sfb_dests_2_MPORT_mask = 1'h1;
  assign ram_sfb_dests_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sfb_dests_3_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_sfb_dests_3_io_deq_bits_MPORT_data = ram_sfb_dests_3[ram_sfb_dests_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_sfb_dests_3_MPORT_data = io_enq_bits_sfb_dests_3;
  assign ram_sfb_dests_3_MPORT_addr = 1'h0;
  assign ram_sfb_dests_3_MPORT_mask = 1'h1;
  assign ram_sfb_dests_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_shadowable_mask_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_shadowable_mask_0_io_deq_bits_MPORT_data =
    ram_shadowable_mask_0[ram_shadowable_mask_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_shadowable_mask_0_MPORT_data = io_enq_bits_shadowable_mask_0;
  assign ram_shadowable_mask_0_MPORT_addr = 1'h0;
  assign ram_shadowable_mask_0_MPORT_mask = 1'h1;
  assign ram_shadowable_mask_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_shadowable_mask_1_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_shadowable_mask_1_io_deq_bits_MPORT_data =
    ram_shadowable_mask_1[ram_shadowable_mask_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_shadowable_mask_1_MPORT_data = io_enq_bits_shadowable_mask_1;
  assign ram_shadowable_mask_1_MPORT_addr = 1'h0;
  assign ram_shadowable_mask_1_MPORT_mask = 1'h1;
  assign ram_shadowable_mask_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_shadowable_mask_2_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_shadowable_mask_2_io_deq_bits_MPORT_data =
    ram_shadowable_mask_2[ram_shadowable_mask_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_shadowable_mask_2_MPORT_data = io_enq_bits_shadowable_mask_2;
  assign ram_shadowable_mask_2_MPORT_addr = 1'h0;
  assign ram_shadowable_mask_2_MPORT_mask = 1'h1;
  assign ram_shadowable_mask_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_shadowable_mask_3_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_shadowable_mask_3_io_deq_bits_MPORT_data =
    ram_shadowable_mask_3[ram_shadowable_mask_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_shadowable_mask_3_MPORT_data = io_enq_bits_shadowable_mask_3;
  assign ram_shadowable_mask_3_MPORT_addr = 1'h0;
  assign ram_shadowable_mask_3_MPORT_mask = 1'h1;
  assign ram_shadowable_mask_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_shadowed_mask_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_shadowed_mask_0_io_deq_bits_MPORT_data = ram_shadowed_mask_0[ram_shadowed_mask_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_shadowed_mask_0_MPORT_data = io_enq_bits_shadowed_mask_0;
  assign ram_shadowed_mask_0_MPORT_addr = 1'h0;
  assign ram_shadowed_mask_0_MPORT_mask = 1'h1;
  assign ram_shadowed_mask_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_shadowed_mask_1_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_shadowed_mask_1_io_deq_bits_MPORT_data = ram_shadowed_mask_1[ram_shadowed_mask_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_shadowed_mask_1_MPORT_data = io_enq_bits_shadowed_mask_1;
  assign ram_shadowed_mask_1_MPORT_addr = 1'h0;
  assign ram_shadowed_mask_1_MPORT_mask = 1'h1;
  assign ram_shadowed_mask_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_shadowed_mask_2_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_shadowed_mask_2_io_deq_bits_MPORT_data = ram_shadowed_mask_2[ram_shadowed_mask_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_shadowed_mask_2_MPORT_data = io_enq_bits_shadowed_mask_2;
  assign ram_shadowed_mask_2_MPORT_addr = 1'h0;
  assign ram_shadowed_mask_2_MPORT_mask = 1'h1;
  assign ram_shadowed_mask_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_shadowed_mask_3_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_shadowed_mask_3_io_deq_bits_MPORT_data = ram_shadowed_mask_3[ram_shadowed_mask_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_shadowed_mask_3_MPORT_data = io_enq_bits_shadowed_mask_3;
  assign ram_shadowed_mask_3_MPORT_addr = 1'h0;
  assign ram_shadowed_mask_3_MPORT_mask = 1'h1;
  assign ram_shadowed_mask_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_idx_valid_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_cfi_idx_valid_io_deq_bits_MPORT_data = ram_cfi_idx_valid[ram_cfi_idx_valid_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_idx_valid_MPORT_data = io_enq_bits_cfi_idx_valid;
  assign ram_cfi_idx_valid_MPORT_addr = 1'h0;
  assign ram_cfi_idx_valid_MPORT_mask = 1'h1;
  assign ram_cfi_idx_valid_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_idx_bits_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_cfi_idx_bits_io_deq_bits_MPORT_data = ram_cfi_idx_bits[ram_cfi_idx_bits_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_idx_bits_MPORT_data = io_enq_bits_cfi_idx_bits;
  assign ram_cfi_idx_bits_MPORT_addr = 1'h0;
  assign ram_cfi_idx_bits_MPORT_mask = 1'h1;
  assign ram_cfi_idx_bits_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_type_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_cfi_type_io_deq_bits_MPORT_data = ram_cfi_type[ram_cfi_type_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_type_MPORT_data = io_enq_bits_cfi_type;
  assign ram_cfi_type_MPORT_addr = 1'h0;
  assign ram_cfi_type_MPORT_mask = 1'h1;
  assign ram_cfi_type_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_is_call_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_cfi_is_call_io_deq_bits_MPORT_data = ram_cfi_is_call[ram_cfi_is_call_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_is_call_MPORT_data = io_enq_bits_cfi_is_call;
  assign ram_cfi_is_call_MPORT_addr = 1'h0;
  assign ram_cfi_is_call_MPORT_mask = 1'h1;
  assign ram_cfi_is_call_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_is_ret_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_cfi_is_ret_io_deq_bits_MPORT_data = ram_cfi_is_ret[ram_cfi_is_ret_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_is_ret_MPORT_data = io_enq_bits_cfi_is_ret;
  assign ram_cfi_is_ret_MPORT_addr = 1'h0;
  assign ram_cfi_is_ret_MPORT_mask = 1'h1;
  assign ram_cfi_is_ret_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_cfi_npc_plus4_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_cfi_npc_plus4_io_deq_bits_MPORT_data = ram_cfi_npc_plus4[ram_cfi_npc_plus4_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_cfi_npc_plus4_MPORT_data = io_enq_bits_cfi_npc_plus4;
  assign ram_cfi_npc_plus4_MPORT_addr = 1'h0;
  assign ram_cfi_npc_plus4_MPORT_mask = 1'h1;
  assign ram_cfi_npc_plus4_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ras_top_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ras_top_io_deq_bits_MPORT_data = ram_ras_top[ram_ras_top_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ras_top_MPORT_data = io_enq_bits_ras_top;
  assign ram_ras_top_MPORT_addr = 1'h0;
  assign ram_ras_top_MPORT_mask = 1'h1;
  assign ram_ras_top_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ftq_idx_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ftq_idx_io_deq_bits_MPORT_data = ram_ftq_idx[ram_ftq_idx_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ftq_idx_MPORT_data = io_enq_bits_ftq_idx;
  assign ram_ftq_idx_MPORT_addr = 1'h0;
  assign ram_ftq_idx_MPORT_mask = 1'h1;
  assign ram_ftq_idx_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_mask_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_mask_io_deq_bits_MPORT_data = ram_mask[ram_mask_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_mask_MPORT_data = io_enq_bits_mask;
  assign ram_mask_MPORT_addr = 1'h0;
  assign ram_mask_MPORT_mask = 1'h1;
  assign ram_mask_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_br_mask_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_br_mask_io_deq_bits_MPORT_data = ram_br_mask[ram_br_mask_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_br_mask_MPORT_data = io_enq_bits_br_mask;
  assign ram_br_mask_MPORT_addr = 1'h0;
  assign ram_br_mask_MPORT_mask = 1'h1;
  assign ram_br_mask_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_old_history_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ghist_old_history_io_deq_bits_MPORT_data =
    ram_ghist_old_history[ram_ghist_old_history_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_old_history_MPORT_data = io_enq_bits_ghist_old_history;
  assign ram_ghist_old_history_MPORT_addr = 1'h0;
  assign ram_ghist_old_history_MPORT_mask = 1'h1;
  assign ram_ghist_old_history_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_data =
    ram_ghist_current_saw_branch_not_taken[ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_current_saw_branch_not_taken_MPORT_data = io_enq_bits_ghist_current_saw_branch_not_taken;
  assign ram_ghist_current_saw_branch_not_taken_MPORT_addr = 1'h0;
  assign ram_ghist_current_saw_branch_not_taken_MPORT_mask = 1'h1;
  assign ram_ghist_current_saw_branch_not_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_data =
    ram_ghist_new_saw_branch_not_taken[ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_new_saw_branch_not_taken_MPORT_data = io_enq_bits_ghist_new_saw_branch_not_taken;
  assign ram_ghist_new_saw_branch_not_taken_MPORT_addr = 1'h0;
  assign ram_ghist_new_saw_branch_not_taken_MPORT_mask = 1'h1;
  assign ram_ghist_new_saw_branch_not_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_data =
    ram_ghist_new_saw_branch_taken[ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_new_saw_branch_taken_MPORT_data = io_enq_bits_ghist_new_saw_branch_taken;
  assign ram_ghist_new_saw_branch_taken_MPORT_addr = 1'h0;
  assign ram_ghist_new_saw_branch_taken_MPORT_mask = 1'h1;
  assign ram_ghist_new_saw_branch_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_ghist_ras_idx_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_ghist_ras_idx_io_deq_bits_MPORT_data = ram_ghist_ras_idx[ram_ghist_ras_idx_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_ghist_ras_idx_MPORT_data = io_enq_bits_ghist_ras_idx;
  assign ram_ghist_ras_idx_MPORT_addr = 1'h0;
  assign ram_ghist_ras_idx_MPORT_mask = 1'h1;
  assign ram_ghist_ras_idx_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_lhist_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_lhist_0_io_deq_bits_MPORT_data = ram_lhist_0[ram_lhist_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_lhist_0_MPORT_data = io_enq_bits_lhist_0;
  assign ram_lhist_0_MPORT_addr = 1'h0;
  assign ram_lhist_0_MPORT_mask = 1'h1;
  assign ram_lhist_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_xcpt_pf_if_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_xcpt_pf_if_io_deq_bits_MPORT_data = ram_xcpt_pf_if[ram_xcpt_pf_if_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_xcpt_pf_if_MPORT_data = io_enq_bits_xcpt_pf_if;
  assign ram_xcpt_pf_if_MPORT_addr = 1'h0;
  assign ram_xcpt_pf_if_MPORT_mask = 1'h1;
  assign ram_xcpt_pf_if_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_xcpt_ae_if_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_xcpt_ae_if_io_deq_bits_MPORT_data = ram_xcpt_ae_if[ram_xcpt_ae_if_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_xcpt_ae_if_MPORT_data = io_enq_bits_xcpt_ae_if;
  assign ram_xcpt_ae_if_MPORT_addr = 1'h0;
  assign ram_xcpt_ae_if_MPORT_mask = 1'h1;
  assign ram_xcpt_ae_if_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_bp_debug_if_oh_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_bp_debug_if_oh_0_io_deq_bits_MPORT_data = ram_bp_debug_if_oh_0[ram_bp_debug_if_oh_0_io_deq_bits_MPORT_addr]
    ; // @[Decoupled.scala 218:16]
  assign ram_bp_debug_if_oh_0_MPORT_data = io_enq_bits_bp_debug_if_oh_0;
  assign ram_bp_debug_if_oh_0_MPORT_addr = 1'h0;
  assign ram_bp_debug_if_oh_0_MPORT_mask = 1'h1;
  assign ram_bp_debug_if_oh_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_bp_debug_if_oh_1_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_bp_debug_if_oh_1_io_deq_bits_MPORT_data = ram_bp_debug_if_oh_1[ram_bp_debug_if_oh_1_io_deq_bits_MPORT_addr]
    ; // @[Decoupled.scala 218:16]
  assign ram_bp_debug_if_oh_1_MPORT_data = io_enq_bits_bp_debug_if_oh_1;
  assign ram_bp_debug_if_oh_1_MPORT_addr = 1'h0;
  assign ram_bp_debug_if_oh_1_MPORT_mask = 1'h1;
  assign ram_bp_debug_if_oh_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_bp_debug_if_oh_2_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_bp_debug_if_oh_2_io_deq_bits_MPORT_data = ram_bp_debug_if_oh_2[ram_bp_debug_if_oh_2_io_deq_bits_MPORT_addr]
    ; // @[Decoupled.scala 218:16]
  assign ram_bp_debug_if_oh_2_MPORT_data = io_enq_bits_bp_debug_if_oh_2;
  assign ram_bp_debug_if_oh_2_MPORT_addr = 1'h0;
  assign ram_bp_debug_if_oh_2_MPORT_mask = 1'h1;
  assign ram_bp_debug_if_oh_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_bp_debug_if_oh_3_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_bp_debug_if_oh_3_io_deq_bits_MPORT_data = ram_bp_debug_if_oh_3[ram_bp_debug_if_oh_3_io_deq_bits_MPORT_addr]
    ; // @[Decoupled.scala 218:16]
  assign ram_bp_debug_if_oh_3_MPORT_data = io_enq_bits_bp_debug_if_oh_3;
  assign ram_bp_debug_if_oh_3_MPORT_addr = 1'h0;
  assign ram_bp_debug_if_oh_3_MPORT_mask = 1'h1;
  assign ram_bp_debug_if_oh_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_bp_xcpt_if_oh_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_bp_xcpt_if_oh_0_io_deq_bits_MPORT_data = ram_bp_xcpt_if_oh_0[ram_bp_xcpt_if_oh_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_bp_xcpt_if_oh_0_MPORT_data = io_enq_bits_bp_xcpt_if_oh_0;
  assign ram_bp_xcpt_if_oh_0_MPORT_addr = 1'h0;
  assign ram_bp_xcpt_if_oh_0_MPORT_mask = 1'h1;
  assign ram_bp_xcpt_if_oh_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_bp_xcpt_if_oh_1_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_bp_xcpt_if_oh_1_io_deq_bits_MPORT_data = ram_bp_xcpt_if_oh_1[ram_bp_xcpt_if_oh_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_bp_xcpt_if_oh_1_MPORT_data = io_enq_bits_bp_xcpt_if_oh_1;
  assign ram_bp_xcpt_if_oh_1_MPORT_addr = 1'h0;
  assign ram_bp_xcpt_if_oh_1_MPORT_mask = 1'h1;
  assign ram_bp_xcpt_if_oh_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_bp_xcpt_if_oh_2_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_bp_xcpt_if_oh_2_io_deq_bits_MPORT_data = ram_bp_xcpt_if_oh_2[ram_bp_xcpt_if_oh_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_bp_xcpt_if_oh_2_MPORT_data = io_enq_bits_bp_xcpt_if_oh_2;
  assign ram_bp_xcpt_if_oh_2_MPORT_addr = 1'h0;
  assign ram_bp_xcpt_if_oh_2_MPORT_mask = 1'h1;
  assign ram_bp_xcpt_if_oh_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_bp_xcpt_if_oh_3_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_bp_xcpt_if_oh_3_io_deq_bits_MPORT_data = ram_bp_xcpt_if_oh_3[ram_bp_xcpt_if_oh_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_bp_xcpt_if_oh_3_MPORT_data = io_enq_bits_bp_xcpt_if_oh_3;
  assign ram_bp_xcpt_if_oh_3_MPORT_addr = 1'h0;
  assign ram_bp_xcpt_if_oh_3_MPORT_mask = 1'h1;
  assign ram_bp_xcpt_if_oh_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_end_half_valid_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_end_half_valid_io_deq_bits_MPORT_data = ram_end_half_valid[ram_end_half_valid_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_end_half_valid_MPORT_data = io_enq_bits_end_half_valid;
  assign ram_end_half_valid_MPORT_addr = 1'h0;
  assign ram_end_half_valid_MPORT_mask = 1'h1;
  assign ram_end_half_valid_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_end_half_bits_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_end_half_bits_io_deq_bits_MPORT_data = ram_end_half_bits[ram_end_half_bits_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_end_half_bits_MPORT_data = io_enq_bits_end_half_bits;
  assign ram_end_half_bits_MPORT_addr = 1'h0;
  assign ram_end_half_bits_MPORT_mask = 1'h1;
  assign ram_end_half_bits_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_bpd_meta_0_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_bpd_meta_0_io_deq_bits_MPORT_data = ram_bpd_meta_0[ram_bpd_meta_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_bpd_meta_0_MPORT_data = io_enq_bits_bpd_meta_0;
  assign ram_bpd_meta_0_MPORT_addr = 1'h0;
  assign ram_bpd_meta_0_MPORT_mask = 1'h1;
  assign ram_bpd_meta_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_fsrc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_fsrc_io_deq_bits_MPORT_data = ram_fsrc[ram_fsrc_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_fsrc_MPORT_data = io_enq_bits_fsrc;
  assign ram_fsrc_MPORT_addr = 1'h0;
  assign ram_fsrc_MPORT_mask = 1'h1;
  assign ram_fsrc_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_tsrc_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_tsrc_io_deq_bits_MPORT_data = ram_tsrc[ram_tsrc_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 218:16]
  assign ram_tsrc_MPORT_data = io_enq_bits_tsrc;
  assign ram_tsrc_MPORT_addr = 1'h0;
  assign ram_tsrc_MPORT_mask = 1'h1;
  assign ram_tsrc_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = io_deq_ready | empty; // @[Decoupled.scala 254:25 Decoupled.scala 254:40 Decoupled.scala 241:16]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 240:19]
  assign io_deq_bits_pc = ram_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_next_pc = ram_next_pc_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_edge_inst_0 = ram_edge_inst_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_insts_0 = ram_insts_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_insts_1 = ram_insts_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_insts_2 = ram_insts_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_insts_3 = ram_insts_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_exp_insts_0 = ram_exp_insts_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_exp_insts_1 = ram_exp_insts_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_exp_insts_2 = ram_exp_insts_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_exp_insts_3 = ram_exp_insts_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfbs_0 = ram_sfbs_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfbs_1 = ram_sfbs_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfbs_2 = ram_sfbs_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfbs_3 = ram_sfbs_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfb_masks_0 = ram_sfb_masks_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfb_masks_1 = ram_sfb_masks_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfb_masks_2 = ram_sfb_masks_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfb_masks_3 = ram_sfb_masks_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfb_dests_0 = ram_sfb_dests_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfb_dests_1 = ram_sfb_dests_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfb_dests_2 = ram_sfb_dests_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_sfb_dests_3 = ram_sfb_dests_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_shadowable_mask_0 = ram_shadowable_mask_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_shadowable_mask_1 = ram_shadowable_mask_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_shadowable_mask_2 = ram_shadowable_mask_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_shadowable_mask_3 = ram_shadowable_mask_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_shadowed_mask_0 = ram_shadowed_mask_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_shadowed_mask_1 = ram_shadowed_mask_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_shadowed_mask_2 = ram_shadowed_mask_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_shadowed_mask_3 = ram_shadowed_mask_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_idx_valid = ram_cfi_idx_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_idx_bits = ram_cfi_idx_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_type = ram_cfi_type_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_is_call = ram_cfi_is_call_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_is_ret = ram_cfi_is_ret_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_cfi_npc_plus4 = ram_cfi_npc_plus4_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ras_top = ram_ras_top_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ftq_idx = ram_ftq_idx_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_mask = ram_mask_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_br_mask = ram_br_mask_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_old_history = ram_ghist_old_history_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_current_saw_branch_not_taken = ram_ghist_current_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_new_saw_branch_not_taken = ram_ghist_new_saw_branch_not_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_new_saw_branch_taken = ram_ghist_new_saw_branch_taken_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_ghist_ras_idx = ram_ghist_ras_idx_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_lhist_0 = ram_lhist_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_xcpt_pf_if = ram_xcpt_pf_if_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_xcpt_ae_if = ram_xcpt_ae_if_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_bp_debug_if_oh_0 = ram_bp_debug_if_oh_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_bp_debug_if_oh_1 = ram_bp_debug_if_oh_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_bp_debug_if_oh_2 = ram_bp_debug_if_oh_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_bp_debug_if_oh_3 = ram_bp_debug_if_oh_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_bp_xcpt_if_oh_0 = ram_bp_xcpt_if_oh_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_bp_xcpt_if_oh_1 = ram_bp_xcpt_if_oh_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_bp_xcpt_if_oh_2 = ram_bp_xcpt_if_oh_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_bp_xcpt_if_oh_3 = ram_bp_xcpt_if_oh_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_end_half_valid = ram_end_half_valid_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_end_half_bits = ram_end_half_bits_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_bpd_meta_0 = ram_bpd_meta_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_fsrc = ram_fsrc_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_deq_bits_tsrc = ram_tsrc_io_deq_bits_MPORT_data; // @[Decoupled.scala 242:15]
  assign io_count = maybe_full; // @[Decoupled.scala 259:62]
  always @(posedge clock) begin
    if(ram_pc_MPORT_en & ram_pc_MPORT_mask) begin
      ram_pc[ram_pc_MPORT_addr] <= ram_pc_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_next_pc_MPORT_en & ram_next_pc_MPORT_mask) begin
      ram_next_pc[ram_next_pc_MPORT_addr] <= ram_next_pc_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_edge_inst_0_MPORT_en & ram_edge_inst_0_MPORT_mask) begin
      ram_edge_inst_0[ram_edge_inst_0_MPORT_addr] <= ram_edge_inst_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_insts_0_MPORT_en & ram_insts_0_MPORT_mask) begin
      ram_insts_0[ram_insts_0_MPORT_addr] <= ram_insts_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_insts_1_MPORT_en & ram_insts_1_MPORT_mask) begin
      ram_insts_1[ram_insts_1_MPORT_addr] <= ram_insts_1_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_insts_2_MPORT_en & ram_insts_2_MPORT_mask) begin
      ram_insts_2[ram_insts_2_MPORT_addr] <= ram_insts_2_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_insts_3_MPORT_en & ram_insts_3_MPORT_mask) begin
      ram_insts_3[ram_insts_3_MPORT_addr] <= ram_insts_3_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_exp_insts_0_MPORT_en & ram_exp_insts_0_MPORT_mask) begin
      ram_exp_insts_0[ram_exp_insts_0_MPORT_addr] <= ram_exp_insts_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_exp_insts_1_MPORT_en & ram_exp_insts_1_MPORT_mask) begin
      ram_exp_insts_1[ram_exp_insts_1_MPORT_addr] <= ram_exp_insts_1_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_exp_insts_2_MPORT_en & ram_exp_insts_2_MPORT_mask) begin
      ram_exp_insts_2[ram_exp_insts_2_MPORT_addr] <= ram_exp_insts_2_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_exp_insts_3_MPORT_en & ram_exp_insts_3_MPORT_mask) begin
      ram_exp_insts_3[ram_exp_insts_3_MPORT_addr] <= ram_exp_insts_3_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfbs_0_MPORT_en & ram_sfbs_0_MPORT_mask) begin
      ram_sfbs_0[ram_sfbs_0_MPORT_addr] <= ram_sfbs_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfbs_1_MPORT_en & ram_sfbs_1_MPORT_mask) begin
      ram_sfbs_1[ram_sfbs_1_MPORT_addr] <= ram_sfbs_1_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfbs_2_MPORT_en & ram_sfbs_2_MPORT_mask) begin
      ram_sfbs_2[ram_sfbs_2_MPORT_addr] <= ram_sfbs_2_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfbs_3_MPORT_en & ram_sfbs_3_MPORT_mask) begin
      ram_sfbs_3[ram_sfbs_3_MPORT_addr] <= ram_sfbs_3_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfb_masks_0_MPORT_en & ram_sfb_masks_0_MPORT_mask) begin
      ram_sfb_masks_0[ram_sfb_masks_0_MPORT_addr] <= ram_sfb_masks_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfb_masks_1_MPORT_en & ram_sfb_masks_1_MPORT_mask) begin
      ram_sfb_masks_1[ram_sfb_masks_1_MPORT_addr] <= ram_sfb_masks_1_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfb_masks_2_MPORT_en & ram_sfb_masks_2_MPORT_mask) begin
      ram_sfb_masks_2[ram_sfb_masks_2_MPORT_addr] <= ram_sfb_masks_2_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfb_masks_3_MPORT_en & ram_sfb_masks_3_MPORT_mask) begin
      ram_sfb_masks_3[ram_sfb_masks_3_MPORT_addr] <= ram_sfb_masks_3_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfb_dests_0_MPORT_en & ram_sfb_dests_0_MPORT_mask) begin
      ram_sfb_dests_0[ram_sfb_dests_0_MPORT_addr] <= ram_sfb_dests_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfb_dests_1_MPORT_en & ram_sfb_dests_1_MPORT_mask) begin
      ram_sfb_dests_1[ram_sfb_dests_1_MPORT_addr] <= ram_sfb_dests_1_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfb_dests_2_MPORT_en & ram_sfb_dests_2_MPORT_mask) begin
      ram_sfb_dests_2[ram_sfb_dests_2_MPORT_addr] <= ram_sfb_dests_2_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_sfb_dests_3_MPORT_en & ram_sfb_dests_3_MPORT_mask) begin
      ram_sfb_dests_3[ram_sfb_dests_3_MPORT_addr] <= ram_sfb_dests_3_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_shadowable_mask_0_MPORT_en & ram_shadowable_mask_0_MPORT_mask) begin
      ram_shadowable_mask_0[ram_shadowable_mask_0_MPORT_addr] <= ram_shadowable_mask_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_shadowable_mask_1_MPORT_en & ram_shadowable_mask_1_MPORT_mask) begin
      ram_shadowable_mask_1[ram_shadowable_mask_1_MPORT_addr] <= ram_shadowable_mask_1_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_shadowable_mask_2_MPORT_en & ram_shadowable_mask_2_MPORT_mask) begin
      ram_shadowable_mask_2[ram_shadowable_mask_2_MPORT_addr] <= ram_shadowable_mask_2_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_shadowable_mask_3_MPORT_en & ram_shadowable_mask_3_MPORT_mask) begin
      ram_shadowable_mask_3[ram_shadowable_mask_3_MPORT_addr] <= ram_shadowable_mask_3_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_shadowed_mask_0_MPORT_en & ram_shadowed_mask_0_MPORT_mask) begin
      ram_shadowed_mask_0[ram_shadowed_mask_0_MPORT_addr] <= ram_shadowed_mask_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_shadowed_mask_1_MPORT_en & ram_shadowed_mask_1_MPORT_mask) begin
      ram_shadowed_mask_1[ram_shadowed_mask_1_MPORT_addr] <= ram_shadowed_mask_1_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_shadowed_mask_2_MPORT_en & ram_shadowed_mask_2_MPORT_mask) begin
      ram_shadowed_mask_2[ram_shadowed_mask_2_MPORT_addr] <= ram_shadowed_mask_2_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_shadowed_mask_3_MPORT_en & ram_shadowed_mask_3_MPORT_mask) begin
      ram_shadowed_mask_3[ram_shadowed_mask_3_MPORT_addr] <= ram_shadowed_mask_3_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_idx_valid_MPORT_en & ram_cfi_idx_valid_MPORT_mask) begin
      ram_cfi_idx_valid[ram_cfi_idx_valid_MPORT_addr] <= ram_cfi_idx_valid_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_idx_bits_MPORT_en & ram_cfi_idx_bits_MPORT_mask) begin
      ram_cfi_idx_bits[ram_cfi_idx_bits_MPORT_addr] <= ram_cfi_idx_bits_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_type_MPORT_en & ram_cfi_type_MPORT_mask) begin
      ram_cfi_type[ram_cfi_type_MPORT_addr] <= ram_cfi_type_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_is_call_MPORT_en & ram_cfi_is_call_MPORT_mask) begin
      ram_cfi_is_call[ram_cfi_is_call_MPORT_addr] <= ram_cfi_is_call_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_is_ret_MPORT_en & ram_cfi_is_ret_MPORT_mask) begin
      ram_cfi_is_ret[ram_cfi_is_ret_MPORT_addr] <= ram_cfi_is_ret_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_cfi_npc_plus4_MPORT_en & ram_cfi_npc_plus4_MPORT_mask) begin
      ram_cfi_npc_plus4[ram_cfi_npc_plus4_MPORT_addr] <= ram_cfi_npc_plus4_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ras_top_MPORT_en & ram_ras_top_MPORT_mask) begin
      ram_ras_top[ram_ras_top_MPORT_addr] <= ram_ras_top_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ftq_idx_MPORT_en & ram_ftq_idx_MPORT_mask) begin
      ram_ftq_idx[ram_ftq_idx_MPORT_addr] <= ram_ftq_idx_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_mask_MPORT_en & ram_mask_MPORT_mask) begin
      ram_mask[ram_mask_MPORT_addr] <= ram_mask_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_br_mask_MPORT_en & ram_br_mask_MPORT_mask) begin
      ram_br_mask[ram_br_mask_MPORT_addr] <= ram_br_mask_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ghist_old_history_MPORT_en & ram_ghist_old_history_MPORT_mask) begin
      ram_ghist_old_history[ram_ghist_old_history_MPORT_addr] <= ram_ghist_old_history_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ghist_current_saw_branch_not_taken_MPORT_en & ram_ghist_current_saw_branch_not_taken_MPORT_mask) begin
      ram_ghist_current_saw_branch_not_taken[ram_ghist_current_saw_branch_not_taken_MPORT_addr] <=
        ram_ghist_current_saw_branch_not_taken_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ghist_new_saw_branch_not_taken_MPORT_en & ram_ghist_new_saw_branch_not_taken_MPORT_mask) begin
      ram_ghist_new_saw_branch_not_taken[ram_ghist_new_saw_branch_not_taken_MPORT_addr] <=
        ram_ghist_new_saw_branch_not_taken_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ghist_new_saw_branch_taken_MPORT_en & ram_ghist_new_saw_branch_taken_MPORT_mask) begin
      ram_ghist_new_saw_branch_taken[ram_ghist_new_saw_branch_taken_MPORT_addr] <=
        ram_ghist_new_saw_branch_taken_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_ghist_ras_idx_MPORT_en & ram_ghist_ras_idx_MPORT_mask) begin
      ram_ghist_ras_idx[ram_ghist_ras_idx_MPORT_addr] <= ram_ghist_ras_idx_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_lhist_0_MPORT_en & ram_lhist_0_MPORT_mask) begin
      ram_lhist_0[ram_lhist_0_MPORT_addr] <= ram_lhist_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_xcpt_pf_if_MPORT_en & ram_xcpt_pf_if_MPORT_mask) begin
      ram_xcpt_pf_if[ram_xcpt_pf_if_MPORT_addr] <= ram_xcpt_pf_if_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_xcpt_ae_if_MPORT_en & ram_xcpt_ae_if_MPORT_mask) begin
      ram_xcpt_ae_if[ram_xcpt_ae_if_MPORT_addr] <= ram_xcpt_ae_if_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_bp_debug_if_oh_0_MPORT_en & ram_bp_debug_if_oh_0_MPORT_mask) begin
      ram_bp_debug_if_oh_0[ram_bp_debug_if_oh_0_MPORT_addr] <= ram_bp_debug_if_oh_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_bp_debug_if_oh_1_MPORT_en & ram_bp_debug_if_oh_1_MPORT_mask) begin
      ram_bp_debug_if_oh_1[ram_bp_debug_if_oh_1_MPORT_addr] <= ram_bp_debug_if_oh_1_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_bp_debug_if_oh_2_MPORT_en & ram_bp_debug_if_oh_2_MPORT_mask) begin
      ram_bp_debug_if_oh_2[ram_bp_debug_if_oh_2_MPORT_addr] <= ram_bp_debug_if_oh_2_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_bp_debug_if_oh_3_MPORT_en & ram_bp_debug_if_oh_3_MPORT_mask) begin
      ram_bp_debug_if_oh_3[ram_bp_debug_if_oh_3_MPORT_addr] <= ram_bp_debug_if_oh_3_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_bp_xcpt_if_oh_0_MPORT_en & ram_bp_xcpt_if_oh_0_MPORT_mask) begin
      ram_bp_xcpt_if_oh_0[ram_bp_xcpt_if_oh_0_MPORT_addr] <= ram_bp_xcpt_if_oh_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_bp_xcpt_if_oh_1_MPORT_en & ram_bp_xcpt_if_oh_1_MPORT_mask) begin
      ram_bp_xcpt_if_oh_1[ram_bp_xcpt_if_oh_1_MPORT_addr] <= ram_bp_xcpt_if_oh_1_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_bp_xcpt_if_oh_2_MPORT_en & ram_bp_xcpt_if_oh_2_MPORT_mask) begin
      ram_bp_xcpt_if_oh_2[ram_bp_xcpt_if_oh_2_MPORT_addr] <= ram_bp_xcpt_if_oh_2_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_bp_xcpt_if_oh_3_MPORT_en & ram_bp_xcpt_if_oh_3_MPORT_mask) begin
      ram_bp_xcpt_if_oh_3[ram_bp_xcpt_if_oh_3_MPORT_addr] <= ram_bp_xcpt_if_oh_3_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_end_half_valid_MPORT_en & ram_end_half_valid_MPORT_mask) begin
      ram_end_half_valid[ram_end_half_valid_MPORT_addr] <= ram_end_half_valid_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_end_half_bits_MPORT_en & ram_end_half_bits_MPORT_mask) begin
      ram_end_half_bits[ram_end_half_bits_MPORT_addr] <= ram_end_half_bits_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_bpd_meta_0_MPORT_en & ram_bpd_meta_0_MPORT_mask) begin
      ram_bpd_meta_0[ram_bpd_meta_0_MPORT_addr] <= ram_bpd_meta_0_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_fsrc_MPORT_en & ram_fsrc_MPORT_mask) begin
      ram_fsrc[ram_fsrc_MPORT_addr] <= ram_fsrc_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if(ram_tsrc_MPORT_en & ram_tsrc_MPORT_mask) begin
      ram_tsrc[ram_tsrc_MPORT_addr] <= ram_tsrc_MPORT_data; // @[Decoupled.scala 218:16]
    end
    if (reset) begin // @[Decoupled.scala 221:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 221:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 236:28]
      maybe_full <= do_enq; // @[Decoupled.scala 237:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_pc[initvar] = _RAND_0[39:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_next_pc[initvar] = _RAND_1[39:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_edge_inst_0[initvar] = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_insts_0[initvar] = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_insts_1[initvar] = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_insts_2[initvar] = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_insts_3[initvar] = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_exp_insts_0[initvar] = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_exp_insts_1[initvar] = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_exp_insts_2[initvar] = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_exp_insts_3[initvar] = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfbs_0[initvar] = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfbs_1[initvar] = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfbs_2[initvar] = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfbs_3[initvar] = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfb_masks_0[initvar] = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfb_masks_1[initvar] = _RAND_16[7:0];
  _RAND_17 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfb_masks_2[initvar] = _RAND_17[7:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfb_masks_3[initvar] = _RAND_18[7:0];
  _RAND_19 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfb_dests_0[initvar] = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfb_dests_1[initvar] = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfb_dests_2[initvar] = _RAND_21[3:0];
  _RAND_22 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_sfb_dests_3[initvar] = _RAND_22[3:0];
  _RAND_23 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_shadowable_mask_0[initvar] = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_shadowable_mask_1[initvar] = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_shadowable_mask_2[initvar] = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_shadowable_mask_3[initvar] = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_shadowed_mask_0[initvar] = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_shadowed_mask_1[initvar] = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_shadowed_mask_2[initvar] = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_shadowed_mask_3[initvar] = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_cfi_idx_valid[initvar] = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_cfi_idx_bits[initvar] = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_cfi_type[initvar] = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_cfi_is_call[initvar] = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_cfi_is_ret[initvar] = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_cfi_npc_plus4[initvar] = _RAND_36[0:0];
  _RAND_37 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ras_top[initvar] = _RAND_37[39:0];
  _RAND_38 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ftq_idx[initvar] = _RAND_38[4:0];
  _RAND_39 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_mask[initvar] = _RAND_39[3:0];
  _RAND_40 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_br_mask[initvar] = _RAND_40[3:0];
  _RAND_41 = {2{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ghist_old_history[initvar] = _RAND_41[63:0];
  _RAND_42 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ghist_current_saw_branch_not_taken[initvar] = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ghist_new_saw_branch_not_taken[initvar] = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ghist_new_saw_branch_taken[initvar] = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_ghist_ras_idx[initvar] = _RAND_45[4:0];
  _RAND_46 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_lhist_0[initvar] = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_xcpt_pf_if[initvar] = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_xcpt_ae_if[initvar] = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_bp_debug_if_oh_0[initvar] = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_bp_debug_if_oh_1[initvar] = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_bp_debug_if_oh_2[initvar] = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_bp_debug_if_oh_3[initvar] = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_bp_xcpt_if_oh_0[initvar] = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_bp_xcpt_if_oh_1[initvar] = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_bp_xcpt_if_oh_2[initvar] = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_bp_xcpt_if_oh_3[initvar] = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_end_half_valid[initvar] = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_end_half_bits[initvar] = _RAND_58[15:0];
  _RAND_59 = {4{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_bpd_meta_0[initvar] = _RAND_59[119:0];
  _RAND_60 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_fsrc[initvar] = _RAND_60[1:0];
  _RAND_61 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_tsrc[initvar] = _RAND_61[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{`RANDOM}};
  maybe_full = _RAND_62[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
