module FetchBuffer(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [39:0] io_enq_bits_pc,
  input  [39:0] io_enq_bits_next_pc,
  input         io_enq_bits_edge_inst_0,
  input  [31:0] io_enq_bits_insts_0,
  input  [31:0] io_enq_bits_insts_1,
  input  [31:0] io_enq_bits_insts_2,
  input  [31:0] io_enq_bits_insts_3,
  input  [31:0] io_enq_bits_exp_insts_0,
  input  [31:0] io_enq_bits_exp_insts_1,
  input  [31:0] io_enq_bits_exp_insts_2,
  input  [31:0] io_enq_bits_exp_insts_3,
  input         io_enq_bits_sfbs_0,
  input         io_enq_bits_sfbs_1,
  input         io_enq_bits_sfbs_2,
  input         io_enq_bits_sfbs_3,
  input  [7:0]  io_enq_bits_sfb_masks_0,
  input  [7:0]  io_enq_bits_sfb_masks_1,
  input  [7:0]  io_enq_bits_sfb_masks_2,
  input  [7:0]  io_enq_bits_sfb_masks_3,
  input  [3:0]  io_enq_bits_sfb_dests_0,
  input  [3:0]  io_enq_bits_sfb_dests_1,
  input  [3:0]  io_enq_bits_sfb_dests_2,
  input  [3:0]  io_enq_bits_sfb_dests_3,
  input         io_enq_bits_shadowable_mask_0,
  input         io_enq_bits_shadowable_mask_1,
  input         io_enq_bits_shadowable_mask_2,
  input         io_enq_bits_shadowable_mask_3,
  input         io_enq_bits_shadowed_mask_0,
  input         io_enq_bits_shadowed_mask_1,
  input         io_enq_bits_shadowed_mask_2,
  input         io_enq_bits_shadowed_mask_3,
  input         io_enq_bits_cfi_idx_valid,
  input  [1:0]  io_enq_bits_cfi_idx_bits,
  input  [2:0]  io_enq_bits_cfi_type,
  input         io_enq_bits_cfi_is_call,
  input         io_enq_bits_cfi_is_ret,
  input         io_enq_bits_cfi_npc_plus4,
  input  [39:0] io_enq_bits_ras_top,
  input  [4:0]  io_enq_bits_ftq_idx,
  input  [3:0]  io_enq_bits_mask,
  input  [3:0]  io_enq_bits_br_mask,
  input  [15:0] io_enq_bits_ghist_old_history,
  input         io_enq_bits_ghist_current_saw_branch_not_taken,
  input         io_enq_bits_ghist_new_saw_branch_not_taken,
  input         io_enq_bits_ghist_new_saw_branch_taken,
  input  [4:0]  io_enq_bits_ghist_ras_idx,
  input         io_enq_bits_lhist_0,
  input         io_enq_bits_xcpt_pf_if,
  input         io_enq_bits_xcpt_ae_if,
  input         io_enq_bits_bp_debug_if_oh_0,
  input         io_enq_bits_bp_debug_if_oh_1,
  input         io_enq_bits_bp_debug_if_oh_2,
  input         io_enq_bits_bp_debug_if_oh_3,
  input         io_enq_bits_bp_xcpt_if_oh_0,
  input         io_enq_bits_bp_xcpt_if_oh_1,
  input         io_enq_bits_bp_xcpt_if_oh_2,
  input         io_enq_bits_bp_xcpt_if_oh_3,
  input         io_enq_bits_end_half_valid,
  input  [15:0] io_enq_bits_end_half_bits,
  input  [44:0] io_enq_bits_bpd_meta_0,
  input  [1:0]  io_enq_bits_fsrc,
  input  [1:0]  io_enq_bits_tsrc,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_uops_0_valid,
  output        io_deq_bits_uops_0_bits_switch,
  output        io_deq_bits_uops_0_bits_switch_off,
  output        io_deq_bits_uops_0_bits_is_unicore,
  output [2:0]  io_deq_bits_uops_0_bits_shift,
  output [1:0]  io_deq_bits_uops_0_bits_lrs3_rtype,
  output        io_deq_bits_uops_0_bits_rflag,
  output        io_deq_bits_uops_0_bits_wflag,
  output [3:0]  io_deq_bits_uops_0_bits_prflag,
  output [3:0]  io_deq_bits_uops_0_bits_pwflag,
  output        io_deq_bits_uops_0_bits_pflag_busy,
  output [3:0]  io_deq_bits_uops_0_bits_stale_pflag,
  output [3:0]  io_deq_bits_uops_0_bits_op1_sel,
  output [3:0]  io_deq_bits_uops_0_bits_op2_sel,
  output [5:0]  io_deq_bits_uops_0_bits_split_num,
  output [5:0]  io_deq_bits_uops_0_bits_self_index,
  output [5:0]  io_deq_bits_uops_0_bits_rob_inst_idx,
  output [5:0]  io_deq_bits_uops_0_bits_address_num,
  output [6:0]  io_deq_bits_uops_0_bits_uopc,
  output [31:0] io_deq_bits_uops_0_bits_inst,
  output [31:0] io_deq_bits_uops_0_bits_debug_inst,
  output        io_deq_bits_uops_0_bits_is_rvc,
  output [39:0] io_deq_bits_uops_0_bits_debug_pc,
  output [2:0]  io_deq_bits_uops_0_bits_iq_type,
  output [9:0]  io_deq_bits_uops_0_bits_fu_code,
  output [3:0]  io_deq_bits_uops_0_bits_ctrl_br_type,
  output [1:0]  io_deq_bits_uops_0_bits_ctrl_op1_sel,
  output [2:0]  io_deq_bits_uops_0_bits_ctrl_op2_sel,
  output [2:0]  io_deq_bits_uops_0_bits_ctrl_imm_sel,
  output [3:0]  io_deq_bits_uops_0_bits_ctrl_op_fcn,
  output        io_deq_bits_uops_0_bits_ctrl_fcn_dw,
  output [2:0]  io_deq_bits_uops_0_bits_ctrl_csr_cmd,
  output        io_deq_bits_uops_0_bits_ctrl_is_load,
  output        io_deq_bits_uops_0_bits_ctrl_is_sta,
  output        io_deq_bits_uops_0_bits_ctrl_is_std,
  output [1:0]  io_deq_bits_uops_0_bits_ctrl_op3_sel,
  output [1:0]  io_deq_bits_uops_0_bits_iw_state,
  output        io_deq_bits_uops_0_bits_iw_p1_poisoned,
  output        io_deq_bits_uops_0_bits_iw_p2_poisoned,
  output        io_deq_bits_uops_0_bits_is_br,
  output        io_deq_bits_uops_0_bits_is_jalr,
  output        io_deq_bits_uops_0_bits_is_jal,
  output        io_deq_bits_uops_0_bits_is_sfb,
  output [11:0] io_deq_bits_uops_0_bits_br_mask,
  output [3:0]  io_deq_bits_uops_0_bits_br_tag,
  output [4:0]  io_deq_bits_uops_0_bits_ftq_idx,
  output        io_deq_bits_uops_0_bits_edge_inst,
  output [5:0]  io_deq_bits_uops_0_bits_pc_lob,
  output        io_deq_bits_uops_0_bits_taken,
  output [19:0] io_deq_bits_uops_0_bits_imm_packed,
  output [11:0] io_deq_bits_uops_0_bits_csr_addr,
  output [5:0]  io_deq_bits_uops_0_bits_rob_idx,
  output [4:0]  io_deq_bits_uops_0_bits_ldq_idx,
  output [4:0]  io_deq_bits_uops_0_bits_stq_idx,
  output [1:0]  io_deq_bits_uops_0_bits_rxq_idx,
  output [6:0]  io_deq_bits_uops_0_bits_pdst,
  output [6:0]  io_deq_bits_uops_0_bits_prs1,
  output [6:0]  io_deq_bits_uops_0_bits_prs2,
  output [6:0]  io_deq_bits_uops_0_bits_prs3,
  output [4:0]  io_deq_bits_uops_0_bits_ppred,
  output        io_deq_bits_uops_0_bits_prs1_busy,
  output        io_deq_bits_uops_0_bits_prs2_busy,
  output        io_deq_bits_uops_0_bits_prs3_busy,
  output        io_deq_bits_uops_0_bits_ppred_busy,
  output [6:0]  io_deq_bits_uops_0_bits_stale_pdst,
  output        io_deq_bits_uops_0_bits_exception,
  output [63:0] io_deq_bits_uops_0_bits_exc_cause,
  output        io_deq_bits_uops_0_bits_bypassable,
  output [4:0]  io_deq_bits_uops_0_bits_mem_cmd,
  output [1:0]  io_deq_bits_uops_0_bits_mem_size,
  output        io_deq_bits_uops_0_bits_mem_signed,
  output        io_deq_bits_uops_0_bits_is_fence,
  output        io_deq_bits_uops_0_bits_is_fencei,
  output        io_deq_bits_uops_0_bits_is_amo,
  output        io_deq_bits_uops_0_bits_uses_ldq,
  output        io_deq_bits_uops_0_bits_uses_stq,
  output        io_deq_bits_uops_0_bits_is_sys_pc2epc,
  output        io_deq_bits_uops_0_bits_is_unique,
  output        io_deq_bits_uops_0_bits_flush_on_commit,
  output        io_deq_bits_uops_0_bits_ldst_is_rs1,
  output [5:0]  io_deq_bits_uops_0_bits_ldst,
  output [5:0]  io_deq_bits_uops_0_bits_lrs1,
  output [5:0]  io_deq_bits_uops_0_bits_lrs2,
  output [5:0]  io_deq_bits_uops_0_bits_lrs3,
  output        io_deq_bits_uops_0_bits_ldst_val,
  output [1:0]  io_deq_bits_uops_0_bits_dst_rtype,
  output [1:0]  io_deq_bits_uops_0_bits_lrs1_rtype,
  output [1:0]  io_deq_bits_uops_0_bits_lrs2_rtype,
  output        io_deq_bits_uops_0_bits_frs3_en,
  output        io_deq_bits_uops_0_bits_fp_val,
  output        io_deq_bits_uops_0_bits_fp_single,
  output        io_deq_bits_uops_0_bits_xcpt_pf_if,
  output        io_deq_bits_uops_0_bits_xcpt_ae_if,
  output        io_deq_bits_uops_0_bits_xcpt_ma_if,
  output        io_deq_bits_uops_0_bits_bp_debug_if,
  output        io_deq_bits_uops_0_bits_bp_xcpt_if,
  output [1:0]  io_deq_bits_uops_0_bits_debug_fsrc,
  output [1:0]  io_deq_bits_uops_0_bits_debug_tsrc,
  output        io_deq_bits_uops_1_valid,
  output        io_deq_bits_uops_1_bits_switch,
  output        io_deq_bits_uops_1_bits_switch_off,
  output        io_deq_bits_uops_1_bits_is_unicore,
  output [2:0]  io_deq_bits_uops_1_bits_shift,
  output [1:0]  io_deq_bits_uops_1_bits_lrs3_rtype,
  output        io_deq_bits_uops_1_bits_rflag,
  output        io_deq_bits_uops_1_bits_wflag,
  output [3:0]  io_deq_bits_uops_1_bits_prflag,
  output [3:0]  io_deq_bits_uops_1_bits_pwflag,
  output        io_deq_bits_uops_1_bits_pflag_busy,
  output [3:0]  io_deq_bits_uops_1_bits_stale_pflag,
  output [3:0]  io_deq_bits_uops_1_bits_op1_sel,
  output [3:0]  io_deq_bits_uops_1_bits_op2_sel,
  output [5:0]  io_deq_bits_uops_1_bits_split_num,
  output [5:0]  io_deq_bits_uops_1_bits_self_index,
  output [5:0]  io_deq_bits_uops_1_bits_rob_inst_idx,
  output [5:0]  io_deq_bits_uops_1_bits_address_num,
  output [6:0]  io_deq_bits_uops_1_bits_uopc,
  output [31:0] io_deq_bits_uops_1_bits_inst,
  output [31:0] io_deq_bits_uops_1_bits_debug_inst,
  output        io_deq_bits_uops_1_bits_is_rvc,
  output [39:0] io_deq_bits_uops_1_bits_debug_pc,
  output [2:0]  io_deq_bits_uops_1_bits_iq_type,
  output [9:0]  io_deq_bits_uops_1_bits_fu_code,
  output [3:0]  io_deq_bits_uops_1_bits_ctrl_br_type,
  output [1:0]  io_deq_bits_uops_1_bits_ctrl_op1_sel,
  output [2:0]  io_deq_bits_uops_1_bits_ctrl_op2_sel,
  output [2:0]  io_deq_bits_uops_1_bits_ctrl_imm_sel,
  output [3:0]  io_deq_bits_uops_1_bits_ctrl_op_fcn,
  output        io_deq_bits_uops_1_bits_ctrl_fcn_dw,
  output [2:0]  io_deq_bits_uops_1_bits_ctrl_csr_cmd,
  output        io_deq_bits_uops_1_bits_ctrl_is_load,
  output        io_deq_bits_uops_1_bits_ctrl_is_sta,
  output        io_deq_bits_uops_1_bits_ctrl_is_std,
  output [1:0]  io_deq_bits_uops_1_bits_ctrl_op3_sel,
  output [1:0]  io_deq_bits_uops_1_bits_iw_state,
  output        io_deq_bits_uops_1_bits_iw_p1_poisoned,
  output        io_deq_bits_uops_1_bits_iw_p2_poisoned,
  output        io_deq_bits_uops_1_bits_is_br,
  output        io_deq_bits_uops_1_bits_is_jalr,
  output        io_deq_bits_uops_1_bits_is_jal,
  output        io_deq_bits_uops_1_bits_is_sfb,
  output [11:0] io_deq_bits_uops_1_bits_br_mask,
  output [3:0]  io_deq_bits_uops_1_bits_br_tag,
  output [4:0]  io_deq_bits_uops_1_bits_ftq_idx,
  output        io_deq_bits_uops_1_bits_edge_inst,
  output [5:0]  io_deq_bits_uops_1_bits_pc_lob,
  output        io_deq_bits_uops_1_bits_taken,
  output [19:0] io_deq_bits_uops_1_bits_imm_packed,
  output [11:0] io_deq_bits_uops_1_bits_csr_addr,
  output [5:0]  io_deq_bits_uops_1_bits_rob_idx,
  output [4:0]  io_deq_bits_uops_1_bits_ldq_idx,
  output [4:0]  io_deq_bits_uops_1_bits_stq_idx,
  output [1:0]  io_deq_bits_uops_1_bits_rxq_idx,
  output [6:0]  io_deq_bits_uops_1_bits_pdst,
  output [6:0]  io_deq_bits_uops_1_bits_prs1,
  output [6:0]  io_deq_bits_uops_1_bits_prs2,
  output [6:0]  io_deq_bits_uops_1_bits_prs3,
  output [4:0]  io_deq_bits_uops_1_bits_ppred,
  output        io_deq_bits_uops_1_bits_prs1_busy,
  output        io_deq_bits_uops_1_bits_prs2_busy,
  output        io_deq_bits_uops_1_bits_prs3_busy,
  output        io_deq_bits_uops_1_bits_ppred_busy,
  output [6:0]  io_deq_bits_uops_1_bits_stale_pdst,
  output        io_deq_bits_uops_1_bits_exception,
  output [63:0] io_deq_bits_uops_1_bits_exc_cause,
  output        io_deq_bits_uops_1_bits_bypassable,
  output [4:0]  io_deq_bits_uops_1_bits_mem_cmd,
  output [1:0]  io_deq_bits_uops_1_bits_mem_size,
  output        io_deq_bits_uops_1_bits_mem_signed,
  output        io_deq_bits_uops_1_bits_is_fence,
  output        io_deq_bits_uops_1_bits_is_fencei,
  output        io_deq_bits_uops_1_bits_is_amo,
  output        io_deq_bits_uops_1_bits_uses_ldq,
  output        io_deq_bits_uops_1_bits_uses_stq,
  output        io_deq_bits_uops_1_bits_is_sys_pc2epc,
  output        io_deq_bits_uops_1_bits_is_unique,
  output        io_deq_bits_uops_1_bits_flush_on_commit,
  output        io_deq_bits_uops_1_bits_ldst_is_rs1,
  output [5:0]  io_deq_bits_uops_1_bits_ldst,
  output [5:0]  io_deq_bits_uops_1_bits_lrs1,
  output [5:0]  io_deq_bits_uops_1_bits_lrs2,
  output [5:0]  io_deq_bits_uops_1_bits_lrs3,
  output        io_deq_bits_uops_1_bits_ldst_val,
  output [1:0]  io_deq_bits_uops_1_bits_dst_rtype,
  output [1:0]  io_deq_bits_uops_1_bits_lrs1_rtype,
  output [1:0]  io_deq_bits_uops_1_bits_lrs2_rtype,
  output        io_deq_bits_uops_1_bits_frs3_en,
  output        io_deq_bits_uops_1_bits_fp_val,
  output        io_deq_bits_uops_1_bits_fp_single,
  output        io_deq_bits_uops_1_bits_xcpt_pf_if,
  output        io_deq_bits_uops_1_bits_xcpt_ae_if,
  output        io_deq_bits_uops_1_bits_xcpt_ma_if,
  output        io_deq_bits_uops_1_bits_bp_debug_if,
  output        io_deq_bits_uops_1_bits_bp_xcpt_if,
  output [1:0]  io_deq_bits_uops_1_bits_debug_fsrc,
  output [1:0]  io_deq_bits_uops_1_bits_debug_tsrc,
  input         io_clear
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
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
  reg [63:0] _RAND_17;
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
  reg [63:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [63:0] _RAND_45;
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
  reg [63:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [63:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [63:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [63:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [63:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [63:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [63:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [63:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [63:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [63:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
  reg [31:0] _RAND_192;
  reg [31:0] _RAND_193;
  reg [31:0] _RAND_194;
  reg [31:0] _RAND_195;
  reg [31:0] _RAND_196;
  reg [31:0] _RAND_197;
  reg [31:0] _RAND_198;
  reg [63:0] _RAND_199;
  reg [31:0] _RAND_200;
  reg [31:0] _RAND_201;
  reg [31:0] _RAND_202;
  reg [31:0] _RAND_203;
  reg [31:0] _RAND_204;
  reg [31:0] _RAND_205;
  reg [31:0] _RAND_206;
  reg [31:0] _RAND_207;
  reg [31:0] _RAND_208;
  reg [31:0] _RAND_209;
  reg [31:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [63:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] fb_uop_ram_0_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_0_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_0_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_0_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_0_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_0_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_0_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_0_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_0_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_0_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_0_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_0_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_0_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_0_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_1_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_1_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_1_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_1_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_1_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_1_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_1_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_1_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_1_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_1_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_1_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_1_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_1_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_1_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_2_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_2_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_2_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_2_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_2_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_2_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_2_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_2_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_2_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_2_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_2_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_2_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_2_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_2_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_3_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_3_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_3_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_3_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_3_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_3_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_3_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_3_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_3_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_3_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_3_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_3_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_3_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_3_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_4_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_4_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_4_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_4_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_4_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_4_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_4_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_4_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_4_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_4_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_4_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_4_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_4_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_4_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_5_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_5_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_5_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_5_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_5_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_5_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_5_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_5_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_5_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_5_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_5_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_5_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_5_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_5_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_6_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_6_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_6_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_6_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_6_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_6_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_6_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_6_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_6_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_6_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_6_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_6_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_6_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_6_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_7_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_7_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_7_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_7_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_7_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_7_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_7_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_7_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_7_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_7_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_7_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_7_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_7_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_7_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_8_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_8_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_8_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_8_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_8_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_8_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_8_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_8_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_8_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_8_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_8_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_8_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_8_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_8_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_9_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_9_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_9_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_9_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_9_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_9_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_9_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_9_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_9_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_9_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_9_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_9_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_9_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_9_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_10_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_10_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_10_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_10_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_10_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_10_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_10_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_10_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_10_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_10_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_10_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_10_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_10_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_10_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_11_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_11_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_11_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_11_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_11_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_11_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_11_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_11_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_11_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_11_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_11_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_11_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_11_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_11_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_12_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_12_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_12_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_12_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_12_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_12_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_12_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_12_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_12_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_12_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_12_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_12_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_12_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_12_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_13_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_13_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_13_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_13_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_13_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_13_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_13_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_13_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_13_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_13_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_13_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_13_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_13_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_13_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_14_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_14_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_14_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_14_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_14_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_14_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_14_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_14_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_14_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_14_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_14_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_14_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_14_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_14_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_15_inst; // @[fetch-buffer.scala 57:16]
  reg [31:0] fb_uop_ram_15_debug_inst; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_15_is_rvc; // @[fetch-buffer.scala 57:16]
  reg [39:0] fb_uop_ram_15_debug_pc; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_15_is_sfb; // @[fetch-buffer.scala 57:16]
  reg [4:0] fb_uop_ram_15_ftq_idx; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_15_edge_inst; // @[fetch-buffer.scala 57:16]
  reg [5:0] fb_uop_ram_15_pc_lob; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_15_taken; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_15_xcpt_pf_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_15_xcpt_ae_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_15_bp_debug_if; // @[fetch-buffer.scala 57:16]
  reg  fb_uop_ram_15_bp_xcpt_if; // @[fetch-buffer.scala 57:16]
  reg [1:0] fb_uop_ram_15_debug_fsrc; // @[fetch-buffer.scala 57:16]
  reg [7:0] head; // @[fetch-buffer.scala 61:21]
  reg [15:0] tail; // @[fetch-buffer.scala 62:21]
  reg  maybe_full; // @[fetch-buffer.scala 64:27]
  wire [14:0] hi = tail[14:0]; // @[fetch-buffer.scala 75:11]
  wire  lo = tail[15]; // @[fetch-buffer.scala 75:24]
  wire [15:0] _T = {hi,lo}; // @[Cat.scala 30:58]
  wire [7:0] _T_17 = {_T[14],_T[12],_T[10],_T[8],_T[6],_T[4],_T[2],_T[0]}; // @[fetch-buffer.scala 79:63]
  wire [13:0] hi_2 = tail[13:0]; // @[fetch-buffer.scala 75:11]
  wire [1:0] lo_2 = tail[15:14]; // @[fetch-buffer.scala 75:24]
  wire [15:0] _T_18 = {hi_2,lo_2}; // @[Cat.scala 30:58]
  wire [7:0] _T_35 = {_T_18[14],_T_18[12],_T_18[10],_T_18[8],_T_18[6],_T_18[4],_T_18[2],_T_18[0]}; // @[fetch-buffer.scala 79:63]
  wire [12:0] hi_4 = tail[12:0]; // @[fetch-buffer.scala 75:11]
  wire [2:0] lo_4 = tail[15:13]; // @[fetch-buffer.scala 75:24]
  wire [15:0] _T_36 = {hi_4,lo_4}; // @[Cat.scala 30:58]
  wire [7:0] _T_53 = {_T_36[14],_T_36[12],_T_36[10],_T_36[8],_T_36[6],_T_36[4],_T_36[2],_T_36[0]}; // @[fetch-buffer.scala 79:63]
  wire [7:0] _T_54 = head & _T_17; // @[fetch-buffer.scala 79:88]
  wire [7:0] _T_55 = head & _T_35; // @[fetch-buffer.scala 79:88]
  wire [7:0] _T_56 = head & _T_53; // @[fetch-buffer.scala 79:88]
  wire [7:0] _T_57 = _T_54 | _T_55; // @[fetch-buffer.scala 79:104]
  wire [7:0] _T_58 = _T_57 | _T_56; // @[fetch-buffer.scala 79:104]
  wire  might_hit_head = |_T_58; // @[fetch-buffer.scala 79:108]
  wire [7:0] _T_75 = {tail[14],tail[12],tail[10],tail[8],tail[6],tail[4],tail[2],tail[0]}; // @[fetch-buffer.scala 81:29]
  wire [7:0] _T_76 = _T_75 & head; // @[fetch-buffer.scala 81:36]
  wire  at_head = |_T_76; // @[fetch-buffer.scala 81:44]
  wire  do_enq = ~(at_head & maybe_full | might_hit_head); // @[fetch-buffer.scala 82:16]
  wire [39:0] _T_79 = ~io_enq_bits_pc; // @[frontend.scala 161:33]
  wire [39:0] _T_80 = _T_79 | 40'h7; // @[frontend.scala 161:39]
  wire [39:0] _T_81 = ~_T_80; // @[frontend.scala 161:31]
  wire [40:0] _T_82 = {{1'd0}, _T_81}; // @[fetch-buffer.scala 95:43]
  wire  in_mask_0 = io_enq_valid & io_enq_bits_mask[0]; // @[fetch-buffer.scala 98:49]
  wire  in_uops_0_is_sfb = io_enq_bits_sfbs_0 | io_enq_bits_shadowed_mask_0; // @[fetch-buffer.scala 103:56]
  wire [39:0] _T_93 = _T_82[39:0] - 40'h2; // @[fetch-buffer.scala 107:81]
  wire [39:0] in_uops_0_debug_pc = io_enq_bits_edge_inst_0 ? _T_93 : _T_82[39:0]; // @[fetch-buffer.scala 106:41 fetch-buffer.scala 107:32 fetch-buffer.scala 100:33]
  wire [39:0] _GEN_1 = io_enq_bits_edge_inst_0 ? _T_82[39:0] : _T_82[39:0]; // @[fetch-buffer.scala 106:41 fetch-buffer.scala 108:32 fetch-buffer.scala 101:33]
  wire  in_uops_0_is_rvc = io_enq_bits_insts_0[1:0] != 2'h3; // @[fetch-buffer.scala 115:62]
  wire  in_uops_0_taken = io_enq_bits_cfi_idx_bits == 2'h0 & io_enq_bits_cfi_idx_valid; // @[fetch-buffer.scala 116:69]
  wire [39:0] in_uops_1_debug_pc = _T_81 + 40'h2; // @[fetch-buffer.scala 95:43]
  wire  in_mask_1 = io_enq_valid & io_enq_bits_mask[1]; // @[fetch-buffer.scala 98:49]
  wire  in_uops_1_is_sfb = io_enq_bits_sfbs_1 | io_enq_bits_shadowed_mask_1; // @[fetch-buffer.scala 103:56]
  wire  in_uops_1_is_rvc = io_enq_bits_insts_1[1:0] != 2'h3; // @[fetch-buffer.scala 115:62]
  wire  in_uops_1_taken = io_enq_bits_cfi_idx_bits == 2'h1 & io_enq_bits_cfi_idx_valid; // @[fetch-buffer.scala 116:69]
  wire [39:0] in_uops_2_debug_pc = _T_81 + 40'h4; // @[fetch-buffer.scala 95:43]
  wire  in_mask_2 = io_enq_valid & io_enq_bits_mask[2]; // @[fetch-buffer.scala 98:49]
  wire  in_uops_2_is_sfb = io_enq_bits_sfbs_2 | io_enq_bits_shadowed_mask_2; // @[fetch-buffer.scala 103:56]
  wire  in_uops_2_is_rvc = io_enq_bits_insts_2[1:0] != 2'h3; // @[fetch-buffer.scala 115:62]
  wire  in_uops_2_taken = io_enq_bits_cfi_idx_bits == 2'h2 & io_enq_bits_cfi_idx_valid; // @[fetch-buffer.scala 116:69]
  wire [39:0] in_uops_3_debug_pc = _T_81 + 40'h6; // @[fetch-buffer.scala 95:43]
  wire  in_mask_3 = io_enq_valid & io_enq_bits_mask[3]; // @[fetch-buffer.scala 98:49]
  wire  in_uops_3_is_sfb = io_enq_bits_sfbs_3 | io_enq_bits_shadowed_mask_3; // @[fetch-buffer.scala 103:56]
  wire  in_uops_3_is_rvc = io_enq_bits_insts_3[1:0] != 2'h3; // @[fetch-buffer.scala 115:62]
  wire  in_uops_3_taken = io_enq_bits_cfi_idx_bits == 2'h3 & io_enq_bits_cfi_idx_valid; // @[fetch-buffer.scala 116:69]
  wire [15:0] enq_idxs_1 = in_mask_0 ? _T : tail; // @[fetch-buffer.scala 138:18]
  wire [14:0] hi_8 = enq_idxs_1[14:0]; // @[fetch-buffer.scala 132:12]
  wire  lo_8 = enq_idxs_1[15]; // @[fetch-buffer.scala 132:24]
  wire [15:0] _T_141 = {hi_8,lo_8}; // @[Cat.scala 30:58]
  wire [15:0] enq_idxs_2 = in_mask_1 ? _T_141 : enq_idxs_1; // @[fetch-buffer.scala 138:18]
  wire [14:0] hi_9 = enq_idxs_2[14:0]; // @[fetch-buffer.scala 132:12]
  wire  lo_9 = enq_idxs_2[15]; // @[fetch-buffer.scala 132:24]
  wire [15:0] _T_143 = {hi_9,lo_9}; // @[Cat.scala 30:58]
  wire [15:0] enq_idxs_3 = in_mask_2 ? _T_143 : enq_idxs_2; // @[fetch-buffer.scala 138:18]
  wire [14:0] hi_10 = enq_idxs_3[14:0]; // @[fetch-buffer.scala 132:12]
  wire  lo_10 = enq_idxs_3[15]; // @[fetch-buffer.scala 132:24]
  wire [15:0] _T_145 = {hi_10,lo_10}; // @[Cat.scala 30:58]
  wire [5:0] in_uops_0_pc_lob = _GEN_1[5:0]; // @[fetch-buffer.scala 88:21]
  wire [5:0] in_uops_1_pc_lob = in_uops_1_debug_pc[5:0]; // @[fetch-buffer.scala 88:21 fetch-buffer.scala 101:33]
  wire [5:0] in_uops_2_pc_lob = in_uops_2_debug_pc[5:0]; // @[fetch-buffer.scala 88:21 fetch-buffer.scala 101:33]
  wire [5:0] in_uops_3_pc_lob = in_uops_3_debug_pc[5:0]; // @[fetch-buffer.scala 88:21 fetch-buffer.scala 101:33]
  wire  _T_341 = head[0] & ~maybe_full; // @[fetch-buffer.scala 155:45]
  wire  _T_349 = head[1] & ~maybe_full; // @[fetch-buffer.scala 155:45]
  wire  _T_357 = head[2] & ~maybe_full; // @[fetch-buffer.scala 155:45]
  wire  _T_365 = head[3] & ~maybe_full; // @[fetch-buffer.scala 155:45]
  wire  _T_373 = head[4] & ~maybe_full; // @[fetch-buffer.scala 155:45]
  wire  _T_381 = head[5] & ~maybe_full; // @[fetch-buffer.scala 155:45]
  wire  _T_389 = head[6] & ~maybe_full; // @[fetch-buffer.scala 155:45]
  wire  _T_397 = head[7] & ~maybe_full; // @[fetch-buffer.scala 155:45]
  wire [7:0] lo_11 = {head[3],_T_365,head[2],_T_357,head[1],_T_349,head[0],_T_341}; // @[fetch-buffer.scala 155:90]
  wire [15:0] _T_402 = {head[7],_T_397,head[6],_T_389,head[5],_T_381,head[4],_T_373,lo_11}; // @[fetch-buffer.scala 155:90]
  wire [15:0] tail_collisions = _T_402 & tail; // @[fetch-buffer.scala 155:97]
  wire [1:0] _T_411 = tail_collisions[1:0] | tail_collisions[3:2]; // @[fetch-buffer.scala 156:112]
  wire [1:0] _T_412 = _T_411 | tail_collisions[5:4]; // @[fetch-buffer.scala 156:112]
  wire [1:0] _T_413 = _T_412 | tail_collisions[7:6]; // @[fetch-buffer.scala 156:112]
  wire [1:0] _T_414 = _T_413 | tail_collisions[9:8]; // @[fetch-buffer.scala 156:112]
  wire [1:0] _T_415 = _T_414 | tail_collisions[11:10]; // @[fetch-buffer.scala 156:112]
  wire [1:0] _T_416 = _T_415 | tail_collisions[13:12]; // @[fetch-buffer.scala 156:112]
  wire [1:0] slot_will_hit_tail = _T_416 | tail_collisions[15:14]; // @[fetch-buffer.scala 156:112]
  wire  will_hit_tail = |slot_will_hit_tail; // @[fetch-buffer.scala 157:42]
  wire  do_deq = io_deq_ready & ~will_hit_tail; // @[fetch-buffer.scala 159:29]
  wire [2:0] _T_418 = {{1'd0}, slot_will_hit_tail}; // @[util.scala 455:30]
  wire [2:0] _T_420 = {slot_will_hit_tail, 1'h0}; // @[util.scala 455:30]
  wire [1:0] _T_422 = _T_418[1:0] | _T_420[1:0]; // @[util.scala 455:54]
  wire [1:0] _T_423 = ~_T_422; // @[fetch-buffer.scala 161:21]
  wire  deq_valids_0 = _T_423[0]; // @[fetch-buffer.scala 161:53]
  wire  deq_valids_1 = _T_423[1]; // @[fetch-buffer.scala 161:53]
  wire [1:0] _T_447 = head[0] ? fb_uop_ram_0_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_448 = head[1] ? fb_uop_ram_2_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_449 = head[2] ? fb_uop_ram_4_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_450 = head[3] ? fb_uop_ram_6_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_451 = head[4] ? fb_uop_ram_8_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_452 = head[5] ? fb_uop_ram_10_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_453 = head[6] ? fb_uop_ram_12_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_454 = head[7] ? fb_uop_ram_14_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_455 = _T_447 | _T_448; // @[Mux.scala 27:72]
  wire [1:0] _T_456 = _T_455 | _T_449; // @[Mux.scala 27:72]
  wire [1:0] _T_457 = _T_456 | _T_450; // @[Mux.scala 27:72]
  wire [1:0] _T_458 = _T_457 | _T_451; // @[Mux.scala 27:72]
  wire [1:0] _T_459 = _T_458 | _T_452; // @[Mux.scala 27:72]
  wire [1:0] _T_460 = _T_459 | _T_453; // @[Mux.scala 27:72]
  wire [5:0] _T_1182 = head[0] ? fb_uop_ram_0_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_1183 = head[1] ? fb_uop_ram_2_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_1184 = head[2] ? fb_uop_ram_4_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_1185 = head[3] ? fb_uop_ram_6_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_1186 = head[4] ? fb_uop_ram_8_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_1187 = head[5] ? fb_uop_ram_10_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_1188 = head[6] ? fb_uop_ram_12_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_1189 = head[7] ? fb_uop_ram_14_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_1190 = _T_1182 | _T_1183; // @[Mux.scala 27:72]
  wire [5:0] _T_1191 = _T_1190 | _T_1184; // @[Mux.scala 27:72]
  wire [5:0] _T_1192 = _T_1191 | _T_1185; // @[Mux.scala 27:72]
  wire [5:0] _T_1193 = _T_1192 | _T_1186; // @[Mux.scala 27:72]
  wire [5:0] _T_1194 = _T_1193 | _T_1187; // @[Mux.scala 27:72]
  wire [5:0] _T_1195 = _T_1194 | _T_1188; // @[Mux.scala 27:72]
  wire [4:0] _T_1212 = head[0] ? fb_uop_ram_0_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1213 = head[1] ? fb_uop_ram_2_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1214 = head[2] ? fb_uop_ram_4_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1215 = head[3] ? fb_uop_ram_6_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1216 = head[4] ? fb_uop_ram_8_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1217 = head[5] ? fb_uop_ram_10_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1218 = head[6] ? fb_uop_ram_12_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1219 = head[7] ? fb_uop_ram_14_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_1220 = _T_1212 | _T_1213; // @[Mux.scala 27:72]
  wire [4:0] _T_1221 = _T_1220 | _T_1214; // @[Mux.scala 27:72]
  wire [4:0] _T_1222 = _T_1221 | _T_1215; // @[Mux.scala 27:72]
  wire [4:0] _T_1223 = _T_1222 | _T_1216; // @[Mux.scala 27:72]
  wire [4:0] _T_1224 = _T_1223 | _T_1217; // @[Mux.scala 27:72]
  wire [4:0] _T_1225 = _T_1224 | _T_1218; // @[Mux.scala 27:72]
  wire [39:0] _T_1557 = head[0] ? fb_uop_ram_0_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_1558 = head[1] ? fb_uop_ram_2_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_1559 = head[2] ? fb_uop_ram_4_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_1560 = head[3] ? fb_uop_ram_6_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_1561 = head[4] ? fb_uop_ram_8_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_1562 = head[5] ? fb_uop_ram_10_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_1563 = head[6] ? fb_uop_ram_12_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_1564 = head[7] ? fb_uop_ram_14_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_1565 = _T_1557 | _T_1558; // @[Mux.scala 27:72]
  wire [39:0] _T_1566 = _T_1565 | _T_1559; // @[Mux.scala 27:72]
  wire [39:0] _T_1567 = _T_1566 | _T_1560; // @[Mux.scala 27:72]
  wire [39:0] _T_1568 = _T_1567 | _T_1561; // @[Mux.scala 27:72]
  wire [39:0] _T_1569 = _T_1568 | _T_1562; // @[Mux.scala 27:72]
  wire [39:0] _T_1570 = _T_1569 | _T_1563; // @[Mux.scala 27:72]
  wire [31:0] _T_1587 = head[0] ? fb_uop_ram_0_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1588 = head[1] ? fb_uop_ram_2_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1589 = head[2] ? fb_uop_ram_4_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1590 = head[3] ? fb_uop_ram_6_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1591 = head[4] ? fb_uop_ram_8_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1592 = head[5] ? fb_uop_ram_10_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1593 = head[6] ? fb_uop_ram_12_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1594 = head[7] ? fb_uop_ram_14_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1595 = _T_1587 | _T_1588; // @[Mux.scala 27:72]
  wire [31:0] _T_1596 = _T_1595 | _T_1589; // @[Mux.scala 27:72]
  wire [31:0] _T_1597 = _T_1596 | _T_1590; // @[Mux.scala 27:72]
  wire [31:0] _T_1598 = _T_1597 | _T_1591; // @[Mux.scala 27:72]
  wire [31:0] _T_1599 = _T_1598 | _T_1592; // @[Mux.scala 27:72]
  wire [31:0] _T_1600 = _T_1599 | _T_1593; // @[Mux.scala 27:72]
  wire [31:0] _T_1602 = head[0] ? fb_uop_ram_0_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1603 = head[1] ? fb_uop_ram_2_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1604 = head[2] ? fb_uop_ram_4_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1605 = head[3] ? fb_uop_ram_6_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1606 = head[4] ? fb_uop_ram_8_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1607 = head[5] ? fb_uop_ram_10_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1608 = head[6] ? fb_uop_ram_12_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1609 = head[7] ? fb_uop_ram_14_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_1610 = _T_1602 | _T_1603; // @[Mux.scala 27:72]
  wire [31:0] _T_1611 = _T_1610 | _T_1604; // @[Mux.scala 27:72]
  wire [31:0] _T_1612 = _T_1611 | _T_1605; // @[Mux.scala 27:72]
  wire [31:0] _T_1613 = _T_1612 | _T_1606; // @[Mux.scala 27:72]
  wire [31:0] _T_1614 = _T_1613 | _T_1607; // @[Mux.scala 27:72]
  wire [31:0] _T_1615 = _T_1614 | _T_1608; // @[Mux.scala 27:72]
  wire [1:0] _T_1902 = head[0] ? fb_uop_ram_1_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1903 = head[1] ? fb_uop_ram_3_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1904 = head[2] ? fb_uop_ram_5_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1905 = head[3] ? fb_uop_ram_7_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1906 = head[4] ? fb_uop_ram_9_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1907 = head[5] ? fb_uop_ram_11_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1908 = head[6] ? fb_uop_ram_13_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1909 = head[7] ? fb_uop_ram_15_debug_fsrc : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_1910 = _T_1902 | _T_1903; // @[Mux.scala 27:72]
  wire [1:0] _T_1911 = _T_1910 | _T_1904; // @[Mux.scala 27:72]
  wire [1:0] _T_1912 = _T_1911 | _T_1905; // @[Mux.scala 27:72]
  wire [1:0] _T_1913 = _T_1912 | _T_1906; // @[Mux.scala 27:72]
  wire [1:0] _T_1914 = _T_1913 | _T_1907; // @[Mux.scala 27:72]
  wire [1:0] _T_1915 = _T_1914 | _T_1908; // @[Mux.scala 27:72]
  wire [5:0] _T_2637 = head[0] ? fb_uop_ram_1_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_2638 = head[1] ? fb_uop_ram_3_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_2639 = head[2] ? fb_uop_ram_5_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_2640 = head[3] ? fb_uop_ram_7_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_2641 = head[4] ? fb_uop_ram_9_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_2642 = head[5] ? fb_uop_ram_11_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_2643 = head[6] ? fb_uop_ram_13_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_2644 = head[7] ? fb_uop_ram_15_pc_lob : 6'h0; // @[Mux.scala 27:72]
  wire [5:0] _T_2645 = _T_2637 | _T_2638; // @[Mux.scala 27:72]
  wire [5:0] _T_2646 = _T_2645 | _T_2639; // @[Mux.scala 27:72]
  wire [5:0] _T_2647 = _T_2646 | _T_2640; // @[Mux.scala 27:72]
  wire [5:0] _T_2648 = _T_2647 | _T_2641; // @[Mux.scala 27:72]
  wire [5:0] _T_2649 = _T_2648 | _T_2642; // @[Mux.scala 27:72]
  wire [5:0] _T_2650 = _T_2649 | _T_2643; // @[Mux.scala 27:72]
  wire [4:0] _T_2667 = head[0] ? fb_uop_ram_1_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_2668 = head[1] ? fb_uop_ram_3_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_2669 = head[2] ? fb_uop_ram_5_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_2670 = head[3] ? fb_uop_ram_7_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_2671 = head[4] ? fb_uop_ram_9_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_2672 = head[5] ? fb_uop_ram_11_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_2673 = head[6] ? fb_uop_ram_13_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_2674 = head[7] ? fb_uop_ram_15_ftq_idx : 5'h0; // @[Mux.scala 27:72]
  wire [4:0] _T_2675 = _T_2667 | _T_2668; // @[Mux.scala 27:72]
  wire [4:0] _T_2676 = _T_2675 | _T_2669; // @[Mux.scala 27:72]
  wire [4:0] _T_2677 = _T_2676 | _T_2670; // @[Mux.scala 27:72]
  wire [4:0] _T_2678 = _T_2677 | _T_2671; // @[Mux.scala 27:72]
  wire [4:0] _T_2679 = _T_2678 | _T_2672; // @[Mux.scala 27:72]
  wire [4:0] _T_2680 = _T_2679 | _T_2673; // @[Mux.scala 27:72]
  wire [39:0] _T_3012 = head[0] ? fb_uop_ram_1_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_3013 = head[1] ? fb_uop_ram_3_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_3014 = head[2] ? fb_uop_ram_5_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_3015 = head[3] ? fb_uop_ram_7_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_3016 = head[4] ? fb_uop_ram_9_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_3017 = head[5] ? fb_uop_ram_11_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_3018 = head[6] ? fb_uop_ram_13_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_3019 = head[7] ? fb_uop_ram_15_debug_pc : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _T_3020 = _T_3012 | _T_3013; // @[Mux.scala 27:72]
  wire [39:0] _T_3021 = _T_3020 | _T_3014; // @[Mux.scala 27:72]
  wire [39:0] _T_3022 = _T_3021 | _T_3015; // @[Mux.scala 27:72]
  wire [39:0] _T_3023 = _T_3022 | _T_3016; // @[Mux.scala 27:72]
  wire [39:0] _T_3024 = _T_3023 | _T_3017; // @[Mux.scala 27:72]
  wire [39:0] _T_3025 = _T_3024 | _T_3018; // @[Mux.scala 27:72]
  wire [31:0] _T_3042 = head[0] ? fb_uop_ram_1_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3043 = head[1] ? fb_uop_ram_3_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3044 = head[2] ? fb_uop_ram_5_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3045 = head[3] ? fb_uop_ram_7_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3046 = head[4] ? fb_uop_ram_9_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3047 = head[5] ? fb_uop_ram_11_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3048 = head[6] ? fb_uop_ram_13_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3049 = head[7] ? fb_uop_ram_15_debug_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3050 = _T_3042 | _T_3043; // @[Mux.scala 27:72]
  wire [31:0] _T_3051 = _T_3050 | _T_3044; // @[Mux.scala 27:72]
  wire [31:0] _T_3052 = _T_3051 | _T_3045; // @[Mux.scala 27:72]
  wire [31:0] _T_3053 = _T_3052 | _T_3046; // @[Mux.scala 27:72]
  wire [31:0] _T_3054 = _T_3053 | _T_3047; // @[Mux.scala 27:72]
  wire [31:0] _T_3055 = _T_3054 | _T_3048; // @[Mux.scala 27:72]
  wire [31:0] _T_3057 = head[0] ? fb_uop_ram_1_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3058 = head[1] ? fb_uop_ram_3_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3059 = head[2] ? fb_uop_ram_5_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3060 = head[3] ? fb_uop_ram_7_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3061 = head[4] ? fb_uop_ram_9_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3062 = head[5] ? fb_uop_ram_11_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3063 = head[6] ? fb_uop_ram_13_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3064 = head[7] ? fb_uop_ram_15_inst : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_3065 = _T_3057 | _T_3058; // @[Mux.scala 27:72]
  wire [31:0] _T_3066 = _T_3065 | _T_3059; // @[Mux.scala 27:72]
  wire [31:0] _T_3067 = _T_3066 | _T_3060; // @[Mux.scala 27:72]
  wire [31:0] _T_3068 = _T_3067 | _T_3061; // @[Mux.scala 27:72]
  wire [31:0] _T_3069 = _T_3068 | _T_3062; // @[Mux.scala 27:72]
  wire [31:0] _T_3070 = _T_3069 | _T_3063; // @[Mux.scala 27:72]
  wire  _GEN_6211 = in_mask_0 | in_mask_1 | in_mask_2 | in_mask_3 | maybe_full; // @[fetch-buffer.scala 178:33 fetch-buffer.scala 179:18 fetch-buffer.scala 64:27]
  wire [6:0] hi_12 = head[6:0]; // @[fetch-buffer.scala 132:12]
  wire [7:0] _T_3346 = {hi_12,head[7]}; // @[Cat.scala 30:58]
  assign io_enq_ready = ~(at_head & maybe_full | might_hit_head); // @[fetch-buffer.scala 82:16]
  assign io_deq_valid = deq_valids_0 | deq_valids_1; // @[fetch-buffer.scala 170:38]
  assign io_deq_bits_uops_0_valid = reset ? 1'h0 : deq_valids_0; // @[fetch-buffer.scala 195:23 fetch-buffer.scala 196:41 fetch-buffer.scala 168:72]
  assign io_deq_bits_uops_0_bits_switch = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_switch_off = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_is_unicore = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_shift = 3'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_lrs3_rtype = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_rflag = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_wflag = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_prflag = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_pwflag = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_pflag_busy = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_stale_pflag = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_op1_sel = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_op2_sel = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_split_num = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_self_index = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_rob_inst_idx = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_address_num = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_uopc = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_inst = _T_1615 | _T_1609; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_debug_inst = _T_1600 | _T_1594; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_is_rvc = head[0] & fb_uop_ram_0_is_rvc | head[1] & fb_uop_ram_2_is_rvc | head[2] &
    fb_uop_ram_4_is_rvc | head[3] & fb_uop_ram_6_is_rvc | head[4] & fb_uop_ram_8_is_rvc | head[5] & fb_uop_ram_10_is_rvc
     | head[6] & fb_uop_ram_12_is_rvc | head[7] & fb_uop_ram_14_is_rvc; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_debug_pc = _T_1570 | _T_1564; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_iq_type = 3'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_fu_code = 10'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ctrl_br_type = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ctrl_op1_sel = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ctrl_op2_sel = 3'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ctrl_imm_sel = 3'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ctrl_op_fcn = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ctrl_fcn_dw = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ctrl_csr_cmd = 3'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ctrl_is_load = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ctrl_is_sta = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ctrl_is_std = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ctrl_op3_sel = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_iw_state = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_iw_p1_poisoned = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_iw_p2_poisoned = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_is_br = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_is_jalr = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_is_jal = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_is_sfb = head[0] & fb_uop_ram_0_is_sfb | head[1] & fb_uop_ram_2_is_sfb | head[2] &
    fb_uop_ram_4_is_sfb | head[3] & fb_uop_ram_6_is_sfb | head[4] & fb_uop_ram_8_is_sfb | head[5] & fb_uop_ram_10_is_sfb
     | head[6] & fb_uop_ram_12_is_sfb | head[7] & fb_uop_ram_14_is_sfb; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_br_mask = 12'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_br_tag = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ftq_idx = _T_1225 | _T_1219; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_edge_inst = head[0] & fb_uop_ram_0_edge_inst | head[1] & fb_uop_ram_2_edge_inst | head[
    2] & fb_uop_ram_4_edge_inst | head[3] & fb_uop_ram_6_edge_inst | head[4] & fb_uop_ram_8_edge_inst | head[5] &
    fb_uop_ram_10_edge_inst | head[6] & fb_uop_ram_12_edge_inst | head[7] & fb_uop_ram_14_edge_inst; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_pc_lob = _T_1195 | _T_1189; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_taken = head[0] & fb_uop_ram_0_taken | head[1] & fb_uop_ram_2_taken | head[2] &
    fb_uop_ram_4_taken | head[3] & fb_uop_ram_6_taken | head[4] & fb_uop_ram_8_taken | head[5] & fb_uop_ram_10_taken |
    head[6] & fb_uop_ram_12_taken | head[7] & fb_uop_ram_14_taken; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_imm_packed = 20'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_csr_addr = 12'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_rob_idx = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ldq_idx = 5'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_stq_idx = 5'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_rxq_idx = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_pdst = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_prs1 = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_prs2 = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_prs3 = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ppred = 5'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_prs1_busy = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_prs2_busy = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_prs3_busy = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ppred_busy = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_stale_pdst = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_exception = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_exc_cause = 64'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_bypassable = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_mem_cmd = 5'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_mem_size = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_mem_signed = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_is_fence = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_is_fencei = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_is_amo = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_uses_ldq = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_uses_stq = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_is_sys_pc2epc = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_is_unique = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_flush_on_commit = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ldst_is_rs1 = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ldst = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_lrs1 = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_lrs2 = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_lrs3 = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_ldst_val = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_dst_rtype = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_lrs1_rtype = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_lrs2_rtype = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_frs3_en = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_fp_val = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_fp_single = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_xcpt_pf_if = head[0] & fb_uop_ram_0_xcpt_pf_if | head[1] & fb_uop_ram_2_xcpt_pf_if |
    head[2] & fb_uop_ram_4_xcpt_pf_if | head[3] & fb_uop_ram_6_xcpt_pf_if | head[4] & fb_uop_ram_8_xcpt_pf_if | head[5]
     & fb_uop_ram_10_xcpt_pf_if | head[6] & fb_uop_ram_12_xcpt_pf_if | head[7] & fb_uop_ram_14_xcpt_pf_if; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_xcpt_ae_if = head[0] & fb_uop_ram_0_xcpt_ae_if | head[1] & fb_uop_ram_2_xcpt_ae_if |
    head[2] & fb_uop_ram_4_xcpt_ae_if | head[3] & fb_uop_ram_6_xcpt_ae_if | head[4] & fb_uop_ram_8_xcpt_ae_if | head[5]
     & fb_uop_ram_10_xcpt_ae_if | head[6] & fb_uop_ram_12_xcpt_ae_if | head[7] & fb_uop_ram_14_xcpt_ae_if; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_xcpt_ma_if = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_bp_debug_if = head[0] & fb_uop_ram_0_bp_debug_if | head[1] & fb_uop_ram_2_bp_debug_if
     | head[2] & fb_uop_ram_4_bp_debug_if | head[3] & fb_uop_ram_6_bp_debug_if | head[4] & fb_uop_ram_8_bp_debug_if |
    head[5] & fb_uop_ram_10_bp_debug_if | head[6] & fb_uop_ram_12_bp_debug_if | head[7] & fb_uop_ram_14_bp_debug_if; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_bp_xcpt_if = head[0] & fb_uop_ram_0_bp_xcpt_if | head[1] & fb_uop_ram_2_bp_xcpt_if |
    head[2] & fb_uop_ram_4_bp_xcpt_if | head[3] & fb_uop_ram_6_bp_xcpt_if | head[4] & fb_uop_ram_8_bp_xcpt_if | head[5]
     & fb_uop_ram_10_bp_xcpt_if | head[6] & fb_uop_ram_12_bp_xcpt_if | head[7] & fb_uop_ram_14_bp_xcpt_if; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_debug_fsrc = _T_460 | _T_454; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_0_bits_debug_tsrc = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_valid = reset ? 1'h0 : deq_valids_1; // @[fetch-buffer.scala 195:23 fetch-buffer.scala 196:41 fetch-buffer.scala 168:72]
  assign io_deq_bits_uops_1_bits_switch = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_switch_off = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_is_unicore = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_shift = 3'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_lrs3_rtype = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_rflag = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_wflag = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_prflag = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_pwflag = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_pflag_busy = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_stale_pflag = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_op1_sel = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_op2_sel = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_split_num = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_self_index = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_rob_inst_idx = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_address_num = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_uopc = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_inst = _T_3070 | _T_3064; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_debug_inst = _T_3055 | _T_3049; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_is_rvc = head[0] & fb_uop_ram_1_is_rvc | head[1] & fb_uop_ram_3_is_rvc | head[2] &
    fb_uop_ram_5_is_rvc | head[3] & fb_uop_ram_7_is_rvc | head[4] & fb_uop_ram_9_is_rvc | head[5] & fb_uop_ram_11_is_rvc
     | head[6] & fb_uop_ram_13_is_rvc | head[7] & fb_uop_ram_15_is_rvc; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_debug_pc = _T_3025 | _T_3019; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_iq_type = 3'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_fu_code = 10'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ctrl_br_type = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ctrl_op1_sel = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ctrl_op2_sel = 3'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ctrl_imm_sel = 3'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ctrl_op_fcn = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ctrl_fcn_dw = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ctrl_csr_cmd = 3'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ctrl_is_load = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ctrl_is_sta = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ctrl_is_std = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ctrl_op3_sel = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_iw_state = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_iw_p1_poisoned = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_iw_p2_poisoned = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_is_br = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_is_jalr = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_is_jal = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_is_sfb = head[0] & fb_uop_ram_1_is_sfb | head[1] & fb_uop_ram_3_is_sfb | head[2] &
    fb_uop_ram_5_is_sfb | head[3] & fb_uop_ram_7_is_sfb | head[4] & fb_uop_ram_9_is_sfb | head[5] & fb_uop_ram_11_is_sfb
     | head[6] & fb_uop_ram_13_is_sfb | head[7] & fb_uop_ram_15_is_sfb; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_br_mask = 12'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_br_tag = 4'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ftq_idx = _T_2680 | _T_2674; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_edge_inst = head[0] & fb_uop_ram_1_edge_inst | head[1] & fb_uop_ram_3_edge_inst | head[
    2] & fb_uop_ram_5_edge_inst | head[3] & fb_uop_ram_7_edge_inst | head[4] & fb_uop_ram_9_edge_inst | head[5] &
    fb_uop_ram_11_edge_inst | head[6] & fb_uop_ram_13_edge_inst | head[7] & fb_uop_ram_15_edge_inst; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_pc_lob = _T_2650 | _T_2644; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_taken = head[0] & fb_uop_ram_1_taken | head[1] & fb_uop_ram_3_taken | head[2] &
    fb_uop_ram_5_taken | head[3] & fb_uop_ram_7_taken | head[4] & fb_uop_ram_9_taken | head[5] & fb_uop_ram_11_taken |
    head[6] & fb_uop_ram_13_taken | head[7] & fb_uop_ram_15_taken; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_imm_packed = 20'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_csr_addr = 12'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_rob_idx = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ldq_idx = 5'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_stq_idx = 5'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_rxq_idx = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_pdst = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_prs1 = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_prs2 = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_prs3 = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ppred = 5'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_prs1_busy = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_prs2_busy = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_prs3_busy = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ppred_busy = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_stale_pdst = 7'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_exception = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_exc_cause = 64'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_bypassable = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_mem_cmd = 5'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_mem_size = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_mem_signed = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_is_fence = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_is_fencei = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_is_amo = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_uses_ldq = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_uses_stq = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_is_sys_pc2epc = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_is_unique = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_flush_on_commit = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ldst_is_rs1 = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ldst = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_lrs1 = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_lrs2 = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_lrs3 = 6'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_ldst_val = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_dst_rtype = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_lrs1_rtype = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_lrs2_rtype = 2'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_frs3_en = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_fp_val = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_fp_single = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_xcpt_pf_if = head[0] & fb_uop_ram_1_xcpt_pf_if | head[1] & fb_uop_ram_3_xcpt_pf_if |
    head[2] & fb_uop_ram_5_xcpt_pf_if | head[3] & fb_uop_ram_7_xcpt_pf_if | head[4] & fb_uop_ram_9_xcpt_pf_if | head[5]
     & fb_uop_ram_11_xcpt_pf_if | head[6] & fb_uop_ram_13_xcpt_pf_if | head[7] & fb_uop_ram_15_xcpt_pf_if; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_xcpt_ae_if = head[0] & fb_uop_ram_1_xcpt_ae_if | head[1] & fb_uop_ram_3_xcpt_ae_if |
    head[2] & fb_uop_ram_5_xcpt_ae_if | head[3] & fb_uop_ram_7_xcpt_ae_if | head[4] & fb_uop_ram_9_xcpt_ae_if | head[5]
     & fb_uop_ram_11_xcpt_ae_if | head[6] & fb_uop_ram_13_xcpt_ae_if | head[7] & fb_uop_ram_15_xcpt_ae_if; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_xcpt_ma_if = 1'h0; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_bp_debug_if = head[0] & fb_uop_ram_1_bp_debug_if | head[1] & fb_uop_ram_3_bp_debug_if
     | head[2] & fb_uop_ram_5_bp_debug_if | head[3] & fb_uop_ram_7_bp_debug_if | head[4] & fb_uop_ram_9_bp_debug_if |
    head[5] & fb_uop_ram_11_bp_debug_if | head[6] & fb_uop_ram_13_bp_debug_if | head[7] & fb_uop_ram_15_bp_debug_if; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_bp_xcpt_if = head[0] & fb_uop_ram_1_bp_xcpt_if | head[1] & fb_uop_ram_3_bp_xcpt_if |
    head[2] & fb_uop_ram_5_bp_xcpt_if | head[3] & fb_uop_ram_7_bp_xcpt_if | head[4] & fb_uop_ram_9_bp_xcpt_if | head[5]
     & fb_uop_ram_11_bp_xcpt_if | head[6] & fb_uop_ram_13_bp_xcpt_if | head[7] & fb_uop_ram_15_bp_xcpt_if; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_debug_fsrc = _T_1915 | _T_1909; // @[Mux.scala 27:72]
  assign io_deq_bits_uops_1_bits_debug_tsrc = 2'h0; // @[Mux.scala 27:72]
  always @(posedge clock) begin
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[0]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_0_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[1]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_1_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[2]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_2_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[3]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_3_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[4]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_4_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[5]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_5_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[6]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_6_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[7]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_7_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[8]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_8_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[9]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_9_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[10]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_10_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[11]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_11_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[12]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_12_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[13]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_13_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & enq_idxs_3[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & enq_idxs_2[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & enq_idxs_1[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & tail[14]) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_14_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_is_rvc <= in_uops_3_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_is_rvc <= in_uops_2_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_is_rvc <= in_uops_1_is_rvc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_is_rvc <= in_uops_0_is_rvc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_pc <= in_uops_3_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_pc <= in_uops_2_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_pc <= in_uops_1_debug_pc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_pc <= in_uops_0_debug_pc; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_is_sfb <= in_uops_3_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_is_sfb <= in_uops_2_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_is_sfb <= in_uops_1_is_sfb; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_is_sfb <= in_uops_0_is_sfb; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_ftq_idx <= io_enq_bits_ftq_idx; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_edge_inst <= 1'h0; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_edge_inst <= io_enq_bits_edge_inst_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_pc_lob <= in_uops_3_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_pc_lob <= in_uops_2_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_pc_lob <= in_uops_1_pc_lob; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_pc_lob <= in_uops_0_pc_lob; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_taken <= in_uops_3_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_taken <= in_uops_2_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_taken <= in_uops_1_taken; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_taken <= in_uops_0_taken; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_xcpt_pf_if <= io_enq_bits_xcpt_pf_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_xcpt_ae_if <= io_enq_bits_xcpt_ae_if; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0; // @[fetch-buffer.scala 145:16]
    end
    if (do_enq & in_mask_3 & lo_10) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_2 & lo_9) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_1 & lo_8) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end else if (do_enq & in_mask_0 & lo) begin // @[fetch-buffer.scala 144:53]
      fb_uop_ram_15_debug_fsrc <= io_enq_bits_fsrc; // @[fetch-buffer.scala 145:16]
    end
    if (reset) begin // @[fetch-buffer.scala 61:21]
      head <= 8'h1; // @[fetch-buffer.scala 61:21]
    end else if (io_clear) begin // @[fetch-buffer.scala 188:19]
      head <= 8'h1; // @[fetch-buffer.scala 189:10]
    end else if (do_deq) begin // @[fetch-buffer.scala 183:17]
      head <= _T_3346; // @[fetch-buffer.scala 184:10]
    end
    if (reset) begin // @[fetch-buffer.scala 62:21]
      tail <= 16'h1; // @[fetch-buffer.scala 62:21]
    end else if (io_clear) begin // @[fetch-buffer.scala 188:19]
      tail <= 16'h1; // @[fetch-buffer.scala 190:10]
    end else if (do_enq) begin // @[fetch-buffer.scala 176:17]
      if (in_mask_3) begin // @[fetch-buffer.scala 138:18]
        tail <= _T_145;
      end else begin
        tail <= enq_idxs_3;
      end
    end
    if (reset) begin // @[fetch-buffer.scala 64:27]
      maybe_full <= 1'h0; // @[fetch-buffer.scala 64:27]
    end else if (io_clear) begin // @[fetch-buffer.scala 188:19]
      maybe_full <= 1'h0; // @[fetch-buffer.scala 191:16]
    end else if (do_deq) begin // @[fetch-buffer.scala 183:17]
      maybe_full <= 1'h0; // @[fetch-buffer.scala 185:16]
    end else if (do_enq) begin // @[fetch-buffer.scala 176:17]
      maybe_full <= _GEN_6211;
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
  fb_uop_ram_0_inst = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  fb_uop_ram_0_debug_inst = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  fb_uop_ram_0_is_rvc = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  fb_uop_ram_0_debug_pc = _RAND_3[39:0];
  _RAND_4 = {1{`RANDOM}};
  fb_uop_ram_0_is_sfb = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  fb_uop_ram_0_ftq_idx = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  fb_uop_ram_0_edge_inst = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  fb_uop_ram_0_pc_lob = _RAND_7[5:0];
  _RAND_8 = {1{`RANDOM}};
  fb_uop_ram_0_taken = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  fb_uop_ram_0_xcpt_pf_if = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  fb_uop_ram_0_xcpt_ae_if = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  fb_uop_ram_0_bp_debug_if = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  fb_uop_ram_0_bp_xcpt_if = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  fb_uop_ram_0_debug_fsrc = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  fb_uop_ram_1_inst = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  fb_uop_ram_1_debug_inst = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  fb_uop_ram_1_is_rvc = _RAND_16[0:0];
  _RAND_17 = {2{`RANDOM}};
  fb_uop_ram_1_debug_pc = _RAND_17[39:0];
  _RAND_18 = {1{`RANDOM}};
  fb_uop_ram_1_is_sfb = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  fb_uop_ram_1_ftq_idx = _RAND_19[4:0];
  _RAND_20 = {1{`RANDOM}};
  fb_uop_ram_1_edge_inst = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  fb_uop_ram_1_pc_lob = _RAND_21[5:0];
  _RAND_22 = {1{`RANDOM}};
  fb_uop_ram_1_taken = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  fb_uop_ram_1_xcpt_pf_if = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  fb_uop_ram_1_xcpt_ae_if = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  fb_uop_ram_1_bp_debug_if = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  fb_uop_ram_1_bp_xcpt_if = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  fb_uop_ram_1_debug_fsrc = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  fb_uop_ram_2_inst = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  fb_uop_ram_2_debug_inst = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  fb_uop_ram_2_is_rvc = _RAND_30[0:0];
  _RAND_31 = {2{`RANDOM}};
  fb_uop_ram_2_debug_pc = _RAND_31[39:0];
  _RAND_32 = {1{`RANDOM}};
  fb_uop_ram_2_is_sfb = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  fb_uop_ram_2_ftq_idx = _RAND_33[4:0];
  _RAND_34 = {1{`RANDOM}};
  fb_uop_ram_2_edge_inst = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  fb_uop_ram_2_pc_lob = _RAND_35[5:0];
  _RAND_36 = {1{`RANDOM}};
  fb_uop_ram_2_taken = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  fb_uop_ram_2_xcpt_pf_if = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  fb_uop_ram_2_xcpt_ae_if = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  fb_uop_ram_2_bp_debug_if = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  fb_uop_ram_2_bp_xcpt_if = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  fb_uop_ram_2_debug_fsrc = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  fb_uop_ram_3_inst = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  fb_uop_ram_3_debug_inst = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  fb_uop_ram_3_is_rvc = _RAND_44[0:0];
  _RAND_45 = {2{`RANDOM}};
  fb_uop_ram_3_debug_pc = _RAND_45[39:0];
  _RAND_46 = {1{`RANDOM}};
  fb_uop_ram_3_is_sfb = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  fb_uop_ram_3_ftq_idx = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  fb_uop_ram_3_edge_inst = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  fb_uop_ram_3_pc_lob = _RAND_49[5:0];
  _RAND_50 = {1{`RANDOM}};
  fb_uop_ram_3_taken = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  fb_uop_ram_3_xcpt_pf_if = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  fb_uop_ram_3_xcpt_ae_if = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  fb_uop_ram_3_bp_debug_if = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  fb_uop_ram_3_bp_xcpt_if = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  fb_uop_ram_3_debug_fsrc = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  fb_uop_ram_4_inst = _RAND_56[31:0];
  _RAND_57 = {1{`RANDOM}};
  fb_uop_ram_4_debug_inst = _RAND_57[31:0];
  _RAND_58 = {1{`RANDOM}};
  fb_uop_ram_4_is_rvc = _RAND_58[0:0];
  _RAND_59 = {2{`RANDOM}};
  fb_uop_ram_4_debug_pc = _RAND_59[39:0];
  _RAND_60 = {1{`RANDOM}};
  fb_uop_ram_4_is_sfb = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  fb_uop_ram_4_ftq_idx = _RAND_61[4:0];
  _RAND_62 = {1{`RANDOM}};
  fb_uop_ram_4_edge_inst = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  fb_uop_ram_4_pc_lob = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  fb_uop_ram_4_taken = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  fb_uop_ram_4_xcpt_pf_if = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  fb_uop_ram_4_xcpt_ae_if = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  fb_uop_ram_4_bp_debug_if = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  fb_uop_ram_4_bp_xcpt_if = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  fb_uop_ram_4_debug_fsrc = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  fb_uop_ram_5_inst = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  fb_uop_ram_5_debug_inst = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  fb_uop_ram_5_is_rvc = _RAND_72[0:0];
  _RAND_73 = {2{`RANDOM}};
  fb_uop_ram_5_debug_pc = _RAND_73[39:0];
  _RAND_74 = {1{`RANDOM}};
  fb_uop_ram_5_is_sfb = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  fb_uop_ram_5_ftq_idx = _RAND_75[4:0];
  _RAND_76 = {1{`RANDOM}};
  fb_uop_ram_5_edge_inst = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  fb_uop_ram_5_pc_lob = _RAND_77[5:0];
  _RAND_78 = {1{`RANDOM}};
  fb_uop_ram_5_taken = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  fb_uop_ram_5_xcpt_pf_if = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  fb_uop_ram_5_xcpt_ae_if = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  fb_uop_ram_5_bp_debug_if = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  fb_uop_ram_5_bp_xcpt_if = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  fb_uop_ram_5_debug_fsrc = _RAND_83[1:0];
  _RAND_84 = {1{`RANDOM}};
  fb_uop_ram_6_inst = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  fb_uop_ram_6_debug_inst = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  fb_uop_ram_6_is_rvc = _RAND_86[0:0];
  _RAND_87 = {2{`RANDOM}};
  fb_uop_ram_6_debug_pc = _RAND_87[39:0];
  _RAND_88 = {1{`RANDOM}};
  fb_uop_ram_6_is_sfb = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  fb_uop_ram_6_ftq_idx = _RAND_89[4:0];
  _RAND_90 = {1{`RANDOM}};
  fb_uop_ram_6_edge_inst = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  fb_uop_ram_6_pc_lob = _RAND_91[5:0];
  _RAND_92 = {1{`RANDOM}};
  fb_uop_ram_6_taken = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  fb_uop_ram_6_xcpt_pf_if = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  fb_uop_ram_6_xcpt_ae_if = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  fb_uop_ram_6_bp_debug_if = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  fb_uop_ram_6_bp_xcpt_if = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  fb_uop_ram_6_debug_fsrc = _RAND_97[1:0];
  _RAND_98 = {1{`RANDOM}};
  fb_uop_ram_7_inst = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  fb_uop_ram_7_debug_inst = _RAND_99[31:0];
  _RAND_100 = {1{`RANDOM}};
  fb_uop_ram_7_is_rvc = _RAND_100[0:0];
  _RAND_101 = {2{`RANDOM}};
  fb_uop_ram_7_debug_pc = _RAND_101[39:0];
  _RAND_102 = {1{`RANDOM}};
  fb_uop_ram_7_is_sfb = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  fb_uop_ram_7_ftq_idx = _RAND_103[4:0];
  _RAND_104 = {1{`RANDOM}};
  fb_uop_ram_7_edge_inst = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  fb_uop_ram_7_pc_lob = _RAND_105[5:0];
  _RAND_106 = {1{`RANDOM}};
  fb_uop_ram_7_taken = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  fb_uop_ram_7_xcpt_pf_if = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  fb_uop_ram_7_xcpt_ae_if = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  fb_uop_ram_7_bp_debug_if = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  fb_uop_ram_7_bp_xcpt_if = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  fb_uop_ram_7_debug_fsrc = _RAND_111[1:0];
  _RAND_112 = {1{`RANDOM}};
  fb_uop_ram_8_inst = _RAND_112[31:0];
  _RAND_113 = {1{`RANDOM}};
  fb_uop_ram_8_debug_inst = _RAND_113[31:0];
  _RAND_114 = {1{`RANDOM}};
  fb_uop_ram_8_is_rvc = _RAND_114[0:0];
  _RAND_115 = {2{`RANDOM}};
  fb_uop_ram_8_debug_pc = _RAND_115[39:0];
  _RAND_116 = {1{`RANDOM}};
  fb_uop_ram_8_is_sfb = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  fb_uop_ram_8_ftq_idx = _RAND_117[4:0];
  _RAND_118 = {1{`RANDOM}};
  fb_uop_ram_8_edge_inst = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  fb_uop_ram_8_pc_lob = _RAND_119[5:0];
  _RAND_120 = {1{`RANDOM}};
  fb_uop_ram_8_taken = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  fb_uop_ram_8_xcpt_pf_if = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  fb_uop_ram_8_xcpt_ae_if = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  fb_uop_ram_8_bp_debug_if = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  fb_uop_ram_8_bp_xcpt_if = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  fb_uop_ram_8_debug_fsrc = _RAND_125[1:0];
  _RAND_126 = {1{`RANDOM}};
  fb_uop_ram_9_inst = _RAND_126[31:0];
  _RAND_127 = {1{`RANDOM}};
  fb_uop_ram_9_debug_inst = _RAND_127[31:0];
  _RAND_128 = {1{`RANDOM}};
  fb_uop_ram_9_is_rvc = _RAND_128[0:0];
  _RAND_129 = {2{`RANDOM}};
  fb_uop_ram_9_debug_pc = _RAND_129[39:0];
  _RAND_130 = {1{`RANDOM}};
  fb_uop_ram_9_is_sfb = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  fb_uop_ram_9_ftq_idx = _RAND_131[4:0];
  _RAND_132 = {1{`RANDOM}};
  fb_uop_ram_9_edge_inst = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  fb_uop_ram_9_pc_lob = _RAND_133[5:0];
  _RAND_134 = {1{`RANDOM}};
  fb_uop_ram_9_taken = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  fb_uop_ram_9_xcpt_pf_if = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  fb_uop_ram_9_xcpt_ae_if = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  fb_uop_ram_9_bp_debug_if = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  fb_uop_ram_9_bp_xcpt_if = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  fb_uop_ram_9_debug_fsrc = _RAND_139[1:0];
  _RAND_140 = {1{`RANDOM}};
  fb_uop_ram_10_inst = _RAND_140[31:0];
  _RAND_141 = {1{`RANDOM}};
  fb_uop_ram_10_debug_inst = _RAND_141[31:0];
  _RAND_142 = {1{`RANDOM}};
  fb_uop_ram_10_is_rvc = _RAND_142[0:0];
  _RAND_143 = {2{`RANDOM}};
  fb_uop_ram_10_debug_pc = _RAND_143[39:0];
  _RAND_144 = {1{`RANDOM}};
  fb_uop_ram_10_is_sfb = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  fb_uop_ram_10_ftq_idx = _RAND_145[4:0];
  _RAND_146 = {1{`RANDOM}};
  fb_uop_ram_10_edge_inst = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  fb_uop_ram_10_pc_lob = _RAND_147[5:0];
  _RAND_148 = {1{`RANDOM}};
  fb_uop_ram_10_taken = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  fb_uop_ram_10_xcpt_pf_if = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  fb_uop_ram_10_xcpt_ae_if = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  fb_uop_ram_10_bp_debug_if = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  fb_uop_ram_10_bp_xcpt_if = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  fb_uop_ram_10_debug_fsrc = _RAND_153[1:0];
  _RAND_154 = {1{`RANDOM}};
  fb_uop_ram_11_inst = _RAND_154[31:0];
  _RAND_155 = {1{`RANDOM}};
  fb_uop_ram_11_debug_inst = _RAND_155[31:0];
  _RAND_156 = {1{`RANDOM}};
  fb_uop_ram_11_is_rvc = _RAND_156[0:0];
  _RAND_157 = {2{`RANDOM}};
  fb_uop_ram_11_debug_pc = _RAND_157[39:0];
  _RAND_158 = {1{`RANDOM}};
  fb_uop_ram_11_is_sfb = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  fb_uop_ram_11_ftq_idx = _RAND_159[4:0];
  _RAND_160 = {1{`RANDOM}};
  fb_uop_ram_11_edge_inst = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  fb_uop_ram_11_pc_lob = _RAND_161[5:0];
  _RAND_162 = {1{`RANDOM}};
  fb_uop_ram_11_taken = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  fb_uop_ram_11_xcpt_pf_if = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  fb_uop_ram_11_xcpt_ae_if = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  fb_uop_ram_11_bp_debug_if = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  fb_uop_ram_11_bp_xcpt_if = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  fb_uop_ram_11_debug_fsrc = _RAND_167[1:0];
  _RAND_168 = {1{`RANDOM}};
  fb_uop_ram_12_inst = _RAND_168[31:0];
  _RAND_169 = {1{`RANDOM}};
  fb_uop_ram_12_debug_inst = _RAND_169[31:0];
  _RAND_170 = {1{`RANDOM}};
  fb_uop_ram_12_is_rvc = _RAND_170[0:0];
  _RAND_171 = {2{`RANDOM}};
  fb_uop_ram_12_debug_pc = _RAND_171[39:0];
  _RAND_172 = {1{`RANDOM}};
  fb_uop_ram_12_is_sfb = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  fb_uop_ram_12_ftq_idx = _RAND_173[4:0];
  _RAND_174 = {1{`RANDOM}};
  fb_uop_ram_12_edge_inst = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  fb_uop_ram_12_pc_lob = _RAND_175[5:0];
  _RAND_176 = {1{`RANDOM}};
  fb_uop_ram_12_taken = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  fb_uop_ram_12_xcpt_pf_if = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  fb_uop_ram_12_xcpt_ae_if = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  fb_uop_ram_12_bp_debug_if = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  fb_uop_ram_12_bp_xcpt_if = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  fb_uop_ram_12_debug_fsrc = _RAND_181[1:0];
  _RAND_182 = {1{`RANDOM}};
  fb_uop_ram_13_inst = _RAND_182[31:0];
  _RAND_183 = {1{`RANDOM}};
  fb_uop_ram_13_debug_inst = _RAND_183[31:0];
  _RAND_184 = {1{`RANDOM}};
  fb_uop_ram_13_is_rvc = _RAND_184[0:0];
  _RAND_185 = {2{`RANDOM}};
  fb_uop_ram_13_debug_pc = _RAND_185[39:0];
  _RAND_186 = {1{`RANDOM}};
  fb_uop_ram_13_is_sfb = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  fb_uop_ram_13_ftq_idx = _RAND_187[4:0];
  _RAND_188 = {1{`RANDOM}};
  fb_uop_ram_13_edge_inst = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  fb_uop_ram_13_pc_lob = _RAND_189[5:0];
  _RAND_190 = {1{`RANDOM}};
  fb_uop_ram_13_taken = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  fb_uop_ram_13_xcpt_pf_if = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  fb_uop_ram_13_xcpt_ae_if = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  fb_uop_ram_13_bp_debug_if = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  fb_uop_ram_13_bp_xcpt_if = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  fb_uop_ram_13_debug_fsrc = _RAND_195[1:0];
  _RAND_196 = {1{`RANDOM}};
  fb_uop_ram_14_inst = _RAND_196[31:0];
  _RAND_197 = {1{`RANDOM}};
  fb_uop_ram_14_debug_inst = _RAND_197[31:0];
  _RAND_198 = {1{`RANDOM}};
  fb_uop_ram_14_is_rvc = _RAND_198[0:0];
  _RAND_199 = {2{`RANDOM}};
  fb_uop_ram_14_debug_pc = _RAND_199[39:0];
  _RAND_200 = {1{`RANDOM}};
  fb_uop_ram_14_is_sfb = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  fb_uop_ram_14_ftq_idx = _RAND_201[4:0];
  _RAND_202 = {1{`RANDOM}};
  fb_uop_ram_14_edge_inst = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  fb_uop_ram_14_pc_lob = _RAND_203[5:0];
  _RAND_204 = {1{`RANDOM}};
  fb_uop_ram_14_taken = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  fb_uop_ram_14_xcpt_pf_if = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  fb_uop_ram_14_xcpt_ae_if = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  fb_uop_ram_14_bp_debug_if = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  fb_uop_ram_14_bp_xcpt_if = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  fb_uop_ram_14_debug_fsrc = _RAND_209[1:0];
  _RAND_210 = {1{`RANDOM}};
  fb_uop_ram_15_inst = _RAND_210[31:0];
  _RAND_211 = {1{`RANDOM}};
  fb_uop_ram_15_debug_inst = _RAND_211[31:0];
  _RAND_212 = {1{`RANDOM}};
  fb_uop_ram_15_is_rvc = _RAND_212[0:0];
  _RAND_213 = {2{`RANDOM}};
  fb_uop_ram_15_debug_pc = _RAND_213[39:0];
  _RAND_214 = {1{`RANDOM}};
  fb_uop_ram_15_is_sfb = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  fb_uop_ram_15_ftq_idx = _RAND_215[4:0];
  _RAND_216 = {1{`RANDOM}};
  fb_uop_ram_15_edge_inst = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  fb_uop_ram_15_pc_lob = _RAND_217[5:0];
  _RAND_218 = {1{`RANDOM}};
  fb_uop_ram_15_taken = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  fb_uop_ram_15_xcpt_pf_if = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  fb_uop_ram_15_xcpt_ae_if = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  fb_uop_ram_15_bp_debug_if = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  fb_uop_ram_15_bp_xcpt_if = _RAND_222[0:0];
  _RAND_223 = {1{`RANDOM}};
  fb_uop_ram_15_debug_fsrc = _RAND_223[1:0];
  _RAND_224 = {1{`RANDOM}};
  head = _RAND_224[7:0];
  _RAND_225 = {1{`RANDOM}};
  tail = _RAND_225[15:0];
  _RAND_226 = {1{`RANDOM}};
  maybe_full = _RAND_226[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
