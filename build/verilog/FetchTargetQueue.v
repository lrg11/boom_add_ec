module FetchTargetQueue(
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
  output [4:0]   io_enq_idx,
  input          io_deq_valid,
  input  [4:0]   io_deq_bits,
  input  [4:0]   io_get_ftq_pc_0_ftq_idx,
  output         io_get_ftq_pc_0_entry_cfi_idx_valid,
  output [1:0]   io_get_ftq_pc_0_entry_cfi_idx_bits,
  output         io_get_ftq_pc_0_entry_cfi_taken,
  output         io_get_ftq_pc_0_entry_cfi_mispredicted,
  output [2:0]   io_get_ftq_pc_0_entry_cfi_type,
  output [3:0]   io_get_ftq_pc_0_entry_br_mask,
  output         io_get_ftq_pc_0_entry_cfi_is_call,
  output         io_get_ftq_pc_0_entry_cfi_is_ret,
  output         io_get_ftq_pc_0_entry_cfi_npc_plus4,
  output [39:0]  io_get_ftq_pc_0_entry_ras_top,
  output [4:0]   io_get_ftq_pc_0_entry_ras_idx,
  output         io_get_ftq_pc_0_entry_start_bank,
  output [63:0]  io_get_ftq_pc_0_ghist_old_history,
  output         io_get_ftq_pc_0_ghist_current_saw_branch_not_taken,
  output         io_get_ftq_pc_0_ghist_new_saw_branch_not_taken,
  output         io_get_ftq_pc_0_ghist_new_saw_branch_taken,
  output [4:0]   io_get_ftq_pc_0_ghist_ras_idx,
  output [39:0]  io_get_ftq_pc_0_pc,
  output [39:0]  io_get_ftq_pc_0_com_pc,
  output         io_get_ftq_pc_0_next_val,
  output [39:0]  io_get_ftq_pc_0_next_pc,
  input  [4:0]   io_get_ftq_pc_1_ftq_idx,
  output         io_get_ftq_pc_1_entry_cfi_idx_valid,
  output [1:0]   io_get_ftq_pc_1_entry_cfi_idx_bits,
  output         io_get_ftq_pc_1_entry_cfi_taken,
  output         io_get_ftq_pc_1_entry_cfi_mispredicted,
  output [2:0]   io_get_ftq_pc_1_entry_cfi_type,
  output [3:0]   io_get_ftq_pc_1_entry_br_mask,
  output         io_get_ftq_pc_1_entry_cfi_is_call,
  output         io_get_ftq_pc_1_entry_cfi_is_ret,
  output         io_get_ftq_pc_1_entry_cfi_npc_plus4,
  output [39:0]  io_get_ftq_pc_1_entry_ras_top,
  output [4:0]   io_get_ftq_pc_1_entry_ras_idx,
  output         io_get_ftq_pc_1_entry_start_bank,
  output [63:0]  io_get_ftq_pc_1_ghist_old_history,
  output         io_get_ftq_pc_1_ghist_current_saw_branch_not_taken,
  output         io_get_ftq_pc_1_ghist_new_saw_branch_not_taken,
  output         io_get_ftq_pc_1_ghist_new_saw_branch_taken,
  output [4:0]   io_get_ftq_pc_1_ghist_ras_idx,
  output [39:0]  io_get_ftq_pc_1_pc,
  output [39:0]  io_get_ftq_pc_1_com_pc,
  output         io_get_ftq_pc_1_next_val,
  output [39:0]  io_get_ftq_pc_1_next_pc,
  input  [4:0]   io_debug_ftq_idx_0,
  input  [4:0]   io_debug_ftq_idx_1,
  output [39:0]  io_debug_fetch_pc_0,
  output [39:0]  io_debug_fetch_pc_1,
  input          io_redirect_valid,
  input  [4:0]   io_redirect_bits,
  input  [11:0]  io_brupdate_b1_resolve_mask,
  input  [11:0]  io_brupdate_b1_mispredict_mask,
  input  [6:0]   io_brupdate_b2_uop_uopc,
  input  [31:0]  io_brupdate_b2_uop_inst,
  input  [31:0]  io_brupdate_b2_uop_debug_inst,
  input          io_brupdate_b2_uop_is_rvc,
  input  [39:0]  io_brupdate_b2_uop_debug_pc,
  input  [2:0]   io_brupdate_b2_uop_iq_type,
  input  [9:0]   io_brupdate_b2_uop_fu_code,
  input  [3:0]   io_brupdate_b2_uop_ctrl_br_type,
  input  [1:0]   io_brupdate_b2_uop_ctrl_op1_sel,
  input  [2:0]   io_brupdate_b2_uop_ctrl_op2_sel,
  input  [2:0]   io_brupdate_b2_uop_ctrl_imm_sel,
  input  [3:0]   io_brupdate_b2_uop_ctrl_op_fcn,
  input          io_brupdate_b2_uop_ctrl_fcn_dw,
  input  [2:0]   io_brupdate_b2_uop_ctrl_csr_cmd,
  input          io_brupdate_b2_uop_ctrl_is_load,
  input          io_brupdate_b2_uop_ctrl_is_sta,
  input          io_brupdate_b2_uop_ctrl_is_std,
  input  [1:0]   io_brupdate_b2_uop_iw_state,
  input          io_brupdate_b2_uop_iw_p1_poisoned,
  input          io_brupdate_b2_uop_iw_p2_poisoned,
  input          io_brupdate_b2_uop_is_br,
  input          io_brupdate_b2_uop_is_jalr,
  input          io_brupdate_b2_uop_is_jal,
  input          io_brupdate_b2_uop_is_sfb,
  input  [11:0]  io_brupdate_b2_uop_br_mask,
  input  [3:0]   io_brupdate_b2_uop_br_tag,
  input  [4:0]   io_brupdate_b2_uop_ftq_idx,
  input          io_brupdate_b2_uop_edge_inst,
  input  [5:0]   io_brupdate_b2_uop_pc_lob,
  input          io_brupdate_b2_uop_taken,
  input  [19:0]  io_brupdate_b2_uop_imm_packed,
  input  [11:0]  io_brupdate_b2_uop_csr_addr,
  input  [5:0]   io_brupdate_b2_uop_rob_idx,
  input  [3:0]   io_brupdate_b2_uop_ldq_idx,
  input  [3:0]   io_brupdate_b2_uop_stq_idx,
  input  [1:0]   io_brupdate_b2_uop_rxq_idx,
  input  [5:0]   io_brupdate_b2_uop_pdst,
  input  [5:0]   io_brupdate_b2_uop_prs1,
  input  [5:0]   io_brupdate_b2_uop_prs2,
  input  [5:0]   io_brupdate_b2_uop_prs3,
  input  [4:0]   io_brupdate_b2_uop_ppred,
  input          io_brupdate_b2_uop_prs1_busy,
  input          io_brupdate_b2_uop_prs2_busy,
  input          io_brupdate_b2_uop_prs3_busy,
  input          io_brupdate_b2_uop_ppred_busy,
  input  [5:0]   io_brupdate_b2_uop_stale_pdst,
  input          io_brupdate_b2_uop_exception,
  input  [63:0]  io_brupdate_b2_uop_exc_cause,
  input          io_brupdate_b2_uop_bypassable,
  input  [4:0]   io_brupdate_b2_uop_mem_cmd,
  input  [1:0]   io_brupdate_b2_uop_mem_size,
  input          io_brupdate_b2_uop_mem_signed,
  input          io_brupdate_b2_uop_is_fence,
  input          io_brupdate_b2_uop_is_fencei,
  input          io_brupdate_b2_uop_is_amo,
  input          io_brupdate_b2_uop_uses_ldq,
  input          io_brupdate_b2_uop_uses_stq,
  input          io_brupdate_b2_uop_is_sys_pc2epc,
  input          io_brupdate_b2_uop_is_unique,
  input          io_brupdate_b2_uop_flush_on_commit,
  input          io_brupdate_b2_uop_ldst_is_rs1,
  input  [5:0]   io_brupdate_b2_uop_ldst,
  input  [5:0]   io_brupdate_b2_uop_lrs1,
  input  [5:0]   io_brupdate_b2_uop_lrs2,
  input  [5:0]   io_brupdate_b2_uop_lrs3,
  input          io_brupdate_b2_uop_ldst_val,
  input  [1:0]   io_brupdate_b2_uop_dst_rtype,
  input  [1:0]   io_brupdate_b2_uop_lrs1_rtype,
  input  [1:0]   io_brupdate_b2_uop_lrs2_rtype,
  input          io_brupdate_b2_uop_frs3_en,
  input          io_brupdate_b2_uop_fp_val,
  input          io_brupdate_b2_uop_fp_single,
  input          io_brupdate_b2_uop_xcpt_pf_if,
  input          io_brupdate_b2_uop_xcpt_ae_if,
  input          io_brupdate_b2_uop_xcpt_ma_if,
  input          io_brupdate_b2_uop_bp_debug_if,
  input          io_brupdate_b2_uop_bp_xcpt_if,
  input  [1:0]   io_brupdate_b2_uop_debug_fsrc,
  input  [1:0]   io_brupdate_b2_uop_debug_tsrc,
  input          io_brupdate_b2_valid,
  input          io_brupdate_b2_mispredict,
  input          io_brupdate_b2_taken,
  input  [2:0]   io_brupdate_b2_cfi_type,
  input  [1:0]   io_brupdate_b2_pc_sel,
  input  [39:0]  io_brupdate_b2_jalr_target,
  input  [20:0]  io_brupdate_b2_target_offset,
  output         io_bpdupdate_valid,
  output         io_bpdupdate_bits_is_mispredict_update,
  output         io_bpdupdate_bits_is_repair_update,
  output [3:0]   io_bpdupdate_bits_btb_mispredicts,
  output [39:0]  io_bpdupdate_bits_pc,
  output [3:0]   io_bpdupdate_bits_br_mask,
  output         io_bpdupdate_bits_cfi_idx_valid,
  output [1:0]   io_bpdupdate_bits_cfi_idx_bits,
  output         io_bpdupdate_bits_cfi_taken,
  output         io_bpdupdate_bits_cfi_mispredicted,
  output         io_bpdupdate_bits_cfi_is_br,
  output         io_bpdupdate_bits_cfi_is_jal,
  output         io_bpdupdate_bits_cfi_is_jalr,
  output [63:0]  io_bpdupdate_bits_ghist_old_history,
  output         io_bpdupdate_bits_ghist_current_saw_branch_not_taken,
  output         io_bpdupdate_bits_ghist_new_saw_branch_not_taken,
  output         io_bpdupdate_bits_ghist_new_saw_branch_taken,
  output [4:0]   io_bpdupdate_bits_ghist_ras_idx,
  output         io_bpdupdate_bits_lhist_0,
  output [39:0]  io_bpdupdate_bits_target,
  output [119:0] io_bpdupdate_bits_meta_0,
  output         io_ras_update,
  output [4:0]   io_ras_update_idx,
  output [39:0]  io_ras_update_pc
);
`ifdef RANDOMIZE_MEM_INIT
  reg [127:0] _RAND_0;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_12;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [63:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [63:0] _RAND_32;
  reg [63:0] _RAND_33;
  reg [63:0] _RAND_34;
  reg [63:0] _RAND_35;
  reg [63:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [63:0] _RAND_41;
  reg [63:0] _RAND_42;
  reg [63:0] _RAND_43;
  reg [63:0] _RAND_44;
  reg [63:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [63:0] _RAND_50;
  reg [63:0] _RAND_51;
  reg [63:0] _RAND_52;
  reg [63:0] _RAND_53;
  reg [63:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [63:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [63:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [63:0] _RAND_90;
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
  reg [31:0] _RAND_101;
  reg [63:0] _RAND_102;
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
  reg [63:0] _RAND_114;
  reg [31:0] _RAND_115;
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
  reg [63:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [63:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [63:0] _RAND_150;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [63:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [31:0] _RAND_171;
  reg [31:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [63:0] _RAND_174;
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
  reg [31:0] _RAND_185;
  reg [63:0] _RAND_186;
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
  reg [63:0] _RAND_198;
  reg [31:0] _RAND_199;
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
  reg [63:0] _RAND_210;
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [63:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [31:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [63:0] _RAND_234;
  reg [31:0] _RAND_235;
  reg [31:0] _RAND_236;
  reg [31:0] _RAND_237;
  reg [31:0] _RAND_238;
  reg [31:0] _RAND_239;
  reg [31:0] _RAND_240;
  reg [31:0] _RAND_241;
  reg [31:0] _RAND_242;
  reg [31:0] _RAND_243;
  reg [31:0] _RAND_244;
  reg [31:0] _RAND_245;
  reg [63:0] _RAND_246;
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [63:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [31:0] _RAND_265;
  reg [31:0] _RAND_266;
  reg [31:0] _RAND_267;
  reg [31:0] _RAND_268;
  reg [31:0] _RAND_269;
  reg [63:0] _RAND_270;
  reg [31:0] _RAND_271;
  reg [31:0] _RAND_272;
  reg [31:0] _RAND_273;
  reg [31:0] _RAND_274;
  reg [31:0] _RAND_275;
  reg [31:0] _RAND_276;
  reg [31:0] _RAND_277;
  reg [31:0] _RAND_278;
  reg [31:0] _RAND_279;
  reg [31:0] _RAND_280;
  reg [31:0] _RAND_281;
  reg [63:0] _RAND_282;
  reg [31:0] _RAND_283;
  reg [31:0] _RAND_284;
  reg [31:0] _RAND_285;
  reg [31:0] _RAND_286;
  reg [31:0] _RAND_287;
  reg [31:0] _RAND_288;
  reg [31:0] _RAND_289;
  reg [31:0] _RAND_290;
  reg [31:0] _RAND_291;
  reg [31:0] _RAND_292;
  reg [31:0] _RAND_293;
  reg [63:0] _RAND_294;
  reg [31:0] _RAND_295;
  reg [31:0] _RAND_296;
  reg [31:0] _RAND_297;
  reg [31:0] _RAND_298;
  reg [31:0] _RAND_299;
  reg [31:0] _RAND_300;
  reg [31:0] _RAND_301;
  reg [31:0] _RAND_302;
  reg [31:0] _RAND_303;
  reg [31:0] _RAND_304;
  reg [31:0] _RAND_305;
  reg [63:0] _RAND_306;
  reg [31:0] _RAND_307;
  reg [31:0] _RAND_308;
  reg [31:0] _RAND_309;
  reg [31:0] _RAND_310;
  reg [31:0] _RAND_311;
  reg [31:0] _RAND_312;
  reg [31:0] _RAND_313;
  reg [31:0] _RAND_314;
  reg [31:0] _RAND_315;
  reg [31:0] _RAND_316;
  reg [31:0] _RAND_317;
  reg [63:0] _RAND_318;
  reg [31:0] _RAND_319;
  reg [31:0] _RAND_320;
  reg [31:0] _RAND_321;
  reg [31:0] _RAND_322;
  reg [31:0] _RAND_323;
  reg [31:0] _RAND_324;
  reg [31:0] _RAND_325;
  reg [31:0] _RAND_326;
  reg [31:0] _RAND_327;
  reg [31:0] _RAND_328;
  reg [31:0] _RAND_329;
  reg [63:0] _RAND_330;
  reg [31:0] _RAND_331;
  reg [31:0] _RAND_332;
  reg [31:0] _RAND_333;
  reg [31:0] _RAND_334;
  reg [31:0] _RAND_335;
  reg [31:0] _RAND_336;
  reg [31:0] _RAND_337;
  reg [31:0] _RAND_338;
  reg [31:0] _RAND_339;
  reg [31:0] _RAND_340;
  reg [31:0] _RAND_341;
  reg [63:0] _RAND_342;
  reg [31:0] _RAND_343;
  reg [31:0] _RAND_344;
  reg [31:0] _RAND_345;
  reg [31:0] _RAND_346;
  reg [31:0] _RAND_347;
  reg [31:0] _RAND_348;
  reg [31:0] _RAND_349;
  reg [31:0] _RAND_350;
  reg [31:0] _RAND_351;
  reg [31:0] _RAND_352;
  reg [31:0] _RAND_353;
  reg [63:0] _RAND_354;
  reg [31:0] _RAND_355;
  reg [31:0] _RAND_356;
  reg [31:0] _RAND_357;
  reg [31:0] _RAND_358;
  reg [31:0] _RAND_359;
  reg [31:0] _RAND_360;
  reg [31:0] _RAND_361;
  reg [31:0] _RAND_362;
  reg [31:0] _RAND_363;
  reg [31:0] _RAND_364;
  reg [31:0] _RAND_365;
  reg [63:0] _RAND_366;
  reg [31:0] _RAND_367;
  reg [31:0] _RAND_368;
  reg [31:0] _RAND_369;
  reg [31:0] _RAND_370;
  reg [31:0] _RAND_371;
  reg [31:0] _RAND_372;
  reg [31:0] _RAND_373;
  reg [31:0] _RAND_374;
  reg [31:0] _RAND_375;
  reg [31:0] _RAND_376;
  reg [31:0] _RAND_377;
  reg [63:0] _RAND_378;
  reg [31:0] _RAND_379;
  reg [31:0] _RAND_380;
  reg [31:0] _RAND_381;
  reg [31:0] _RAND_382;
  reg [31:0] _RAND_383;
  reg [31:0] _RAND_384;
  reg [31:0] _RAND_385;
  reg [31:0] _RAND_386;
  reg [31:0] _RAND_387;
  reg [31:0] _RAND_388;
  reg [31:0] _RAND_389;
  reg [63:0] _RAND_390;
  reg [31:0] _RAND_391;
  reg [31:0] _RAND_392;
  reg [31:0] _RAND_393;
  reg [31:0] _RAND_394;
  reg [31:0] _RAND_395;
  reg [31:0] _RAND_396;
  reg [31:0] _RAND_397;
  reg [31:0] _RAND_398;
  reg [31:0] _RAND_399;
  reg [31:0] _RAND_400;
  reg [31:0] _RAND_401;
  reg [63:0] _RAND_402;
  reg [31:0] _RAND_403;
  reg [31:0] _RAND_404;
  reg [31:0] _RAND_405;
  reg [31:0] _RAND_406;
  reg [31:0] _RAND_407;
  reg [31:0] _RAND_408;
  reg [31:0] _RAND_409;
  reg [31:0] _RAND_410;
  reg [31:0] _RAND_411;
  reg [31:0] _RAND_412;
  reg [31:0] _RAND_413;
  reg [63:0] _RAND_414;
  reg [31:0] _RAND_415;
  reg [31:0] _RAND_416;
  reg [31:0] _RAND_417;
  reg [31:0] _RAND_418;
  reg [31:0] _RAND_419;
  reg [31:0] _RAND_420;
  reg [31:0] _RAND_421;
  reg [31:0] _RAND_422;
  reg [31:0] _RAND_423;
  reg [31:0] _RAND_424;
  reg [31:0] _RAND_425;
  reg [63:0] _RAND_426;
  reg [31:0] _RAND_427;
  reg [31:0] _RAND_428;
  reg [31:0] _RAND_429;
  reg [31:0] _RAND_430;
  reg [31:0] _RAND_431;
  reg [31:0] _RAND_432;
  reg [31:0] _RAND_433;
  reg [31:0] _RAND_434;
  reg [31:0] _RAND_435;
  reg [31:0] _RAND_436;
  reg [31:0] _RAND_437;
  reg [63:0] _RAND_438;
  reg [31:0] _RAND_439;
  reg [31:0] _RAND_440;
  reg [63:0] _RAND_441;
  reg [31:0] _RAND_442;
  reg [31:0] _RAND_443;
  reg [31:0] _RAND_444;
  reg [31:0] _RAND_445;
  reg [31:0] _RAND_446;
  reg [31:0] _RAND_447;
  reg [31:0] _RAND_448;
  reg [31:0] _RAND_449;
  reg [31:0] _RAND_450;
  reg [31:0] _RAND_451;
  reg [63:0] _RAND_452;
  reg [31:0] _RAND_453;
  reg [31:0] _RAND_454;
  reg [31:0] _RAND_455;
  reg [31:0] _RAND_456;
  reg [31:0] _RAND_457;
  reg [63:0] _RAND_458;
  reg [31:0] _RAND_459;
  reg [31:0] _RAND_460;
  reg [31:0] _RAND_461;
  reg [31:0] _RAND_462;
  reg [31:0] _RAND_463;
  reg [31:0] _RAND_464;
  reg [63:0] _RAND_465;
  reg [63:0] _RAND_466;
  reg [31:0] _RAND_467;
  reg [31:0] _RAND_468;
  reg [31:0] _RAND_469;
  reg [31:0] _RAND_470;
  reg [31:0] _RAND_471;
  reg [31:0] _RAND_472;
  reg [31:0] _RAND_473;
  reg [31:0] _RAND_474;
  reg [31:0] _RAND_475;
  reg [31:0] _RAND_476;
  reg [31:0] _RAND_477;
  reg [31:0] _RAND_478;
  reg [31:0] _RAND_479;
  reg [31:0] _RAND_480;
  reg [31:0] _RAND_481;
  reg [31:0] _RAND_482;
  reg [31:0] _RAND_483;
  reg [31:0] _RAND_484;
  reg [31:0] _RAND_485;
  reg [31:0] _RAND_486;
  reg [31:0] _RAND_487;
  reg [31:0] _RAND_488;
  reg [31:0] _RAND_489;
  reg [31:0] _RAND_490;
  reg [31:0] _RAND_491;
  reg [31:0] _RAND_492;
  reg [31:0] _RAND_493;
  reg [63:0] _RAND_494;
  reg [31:0] _RAND_495;
  reg [31:0] _RAND_496;
  reg [31:0] _RAND_497;
  reg [31:0] _RAND_498;
  reg [31:0] _RAND_499;
  reg [31:0] _RAND_500;
  reg [31:0] _RAND_501;
  reg [31:0] _RAND_502;
  reg [31:0] _RAND_503;
  reg [31:0] _RAND_504;
  reg [31:0] _RAND_505;
  reg [63:0] _RAND_506;
  reg [31:0] _RAND_507;
  reg [31:0] _RAND_508;
  reg [63:0] _RAND_509;
  reg [63:0] _RAND_510;
  reg [31:0] _RAND_511;
  reg [63:0] _RAND_512;
  reg [31:0] _RAND_513;
  reg [31:0] _RAND_514;
  reg [31:0] _RAND_515;
  reg [31:0] _RAND_516;
  reg [31:0] _RAND_517;
  reg [31:0] _RAND_518;
  reg [31:0] _RAND_519;
  reg [31:0] _RAND_520;
  reg [31:0] _RAND_521;
  reg [63:0] _RAND_522;
  reg [31:0] _RAND_523;
  reg [31:0] _RAND_524;
  reg [63:0] _RAND_525;
  reg [63:0] _RAND_526;
  reg [31:0] _RAND_527;
  reg [63:0] _RAND_528;
  reg [63:0] _RAND_529;
  reg [63:0] _RAND_530;
`endif // RANDOMIZE_REG_INIT
  reg [119:0] meta_0 [0:31]; // @[fetch-target-queue.scala 142:29]
  wire [119:0] meta_0_bpd_meta_data; // @[fetch-target-queue.scala 142:29]
  wire [4:0] meta_0_bpd_meta_addr; // @[fetch-target-queue.scala 142:29]
  wire [119:0] meta_0_MPORT_2_data; // @[fetch-target-queue.scala 142:29]
  wire [4:0] meta_0_MPORT_2_addr; // @[fetch-target-queue.scala 142:29]
  wire  meta_0_MPORT_2_mask; // @[fetch-target-queue.scala 142:29]
  wire  meta_0_MPORT_2_en; // @[fetch-target-queue.scala 142:29]
  reg [4:0] meta_0_bpd_meta_addr_pipe_0;
  reg [63:0] ghist_0_old_history [0:31]; // @[fetch-target-queue.scala 144:43]
  wire [63:0] ghist_0_old_history_bpd_ghist_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_old_history_bpd_ghist_addr; // @[fetch-target-queue.scala 144:43]
  wire [63:0] ghist_0_old_history_MPORT_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_old_history_MPORT_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_old_history_MPORT_mask; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_old_history_MPORT_en; // @[fetch-target-queue.scala 144:43]
  reg [4:0] ghist_0_old_history_bpd_ghist_addr_pipe_0;
  reg  ghist_0_current_saw_branch_not_taken [0:31]; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_current_saw_branch_not_taken_bpd_ghist_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_current_saw_branch_not_taken_bpd_ghist_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_current_saw_branch_not_taken_MPORT_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_current_saw_branch_not_taken_MPORT_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_current_saw_branch_not_taken_MPORT_mask; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_current_saw_branch_not_taken_MPORT_en; // @[fetch-target-queue.scala 144:43]
  reg [4:0] ghist_0_current_saw_branch_not_taken_bpd_ghist_addr_pipe_0;
  reg  ghist_0_new_saw_branch_not_taken [0:31]; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_new_saw_branch_not_taken_bpd_ghist_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_new_saw_branch_not_taken_bpd_ghist_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_new_saw_branch_not_taken_MPORT_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_new_saw_branch_not_taken_MPORT_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_new_saw_branch_not_taken_MPORT_mask; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_new_saw_branch_not_taken_MPORT_en; // @[fetch-target-queue.scala 144:43]
  reg [4:0] ghist_0_new_saw_branch_not_taken_bpd_ghist_addr_pipe_0;
  reg  ghist_0_new_saw_branch_taken [0:31]; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_new_saw_branch_taken_bpd_ghist_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_new_saw_branch_taken_bpd_ghist_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_new_saw_branch_taken_MPORT_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_new_saw_branch_taken_MPORT_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_new_saw_branch_taken_MPORT_mask; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_new_saw_branch_taken_MPORT_en; // @[fetch-target-queue.scala 144:43]
  reg [4:0] ghist_0_new_saw_branch_taken_bpd_ghist_addr_pipe_0;
  reg [4:0] ghist_0_ras_idx [0:31]; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_ras_idx_bpd_ghist_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_ras_idx_bpd_ghist_addr; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_ras_idx_MPORT_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_0_ras_idx_MPORT_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_ras_idx_MPORT_mask; // @[fetch-target-queue.scala 144:43]
  wire  ghist_0_ras_idx_MPORT_en; // @[fetch-target-queue.scala 144:43]
  reg [4:0] ghist_0_ras_idx_bpd_ghist_addr_pipe_0;
  reg [63:0] ghist_1_old_history [0:31]; // @[fetch-target-queue.scala 144:43]
  wire [63:0] ghist_1_old_history_MPORT_3_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_old_history_MPORT_3_addr; // @[fetch-target-queue.scala 144:43]
  wire [63:0] ghist_1_old_history_MPORT_1_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_old_history_MPORT_1_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_old_history_MPORT_1_mask; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_old_history_MPORT_1_en; // @[fetch-target-queue.scala 144:43]
  reg [4:0] ghist_1_old_history_MPORT_3_addr_pipe_0;
  reg  ghist_1_current_saw_branch_not_taken [0:31]; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_current_saw_branch_not_taken_MPORT_3_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_current_saw_branch_not_taken_MPORT_3_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_current_saw_branch_not_taken_MPORT_1_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_current_saw_branch_not_taken_MPORT_1_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_current_saw_branch_not_taken_MPORT_1_mask; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_current_saw_branch_not_taken_MPORT_1_en; // @[fetch-target-queue.scala 144:43]
  reg [4:0] ghist_1_current_saw_branch_not_taken_MPORT_3_addr_pipe_0;
  reg  ghist_1_new_saw_branch_not_taken [0:31]; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_new_saw_branch_not_taken_MPORT_3_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_new_saw_branch_not_taken_MPORT_3_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_new_saw_branch_not_taken_MPORT_1_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_new_saw_branch_not_taken_MPORT_1_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_new_saw_branch_not_taken_MPORT_1_mask; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_new_saw_branch_not_taken_MPORT_1_en; // @[fetch-target-queue.scala 144:43]
  reg [4:0] ghist_1_new_saw_branch_not_taken_MPORT_3_addr_pipe_0;
  reg  ghist_1_new_saw_branch_taken [0:31]; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_new_saw_branch_taken_MPORT_3_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_new_saw_branch_taken_MPORT_3_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_new_saw_branch_taken_MPORT_1_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_new_saw_branch_taken_MPORT_1_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_new_saw_branch_taken_MPORT_1_mask; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_new_saw_branch_taken_MPORT_1_en; // @[fetch-target-queue.scala 144:43]
  reg [4:0] ghist_1_new_saw_branch_taken_MPORT_3_addr_pipe_0;
  reg [4:0] ghist_1_ras_idx [0:31]; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_ras_idx_MPORT_3_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_ras_idx_MPORT_3_addr; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_ras_idx_MPORT_1_data; // @[fetch-target-queue.scala 144:43]
  wire [4:0] ghist_1_ras_idx_MPORT_1_addr; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_ras_idx_MPORT_1_mask; // @[fetch-target-queue.scala 144:43]
  wire  ghist_1_ras_idx_MPORT_1_en; // @[fetch-target-queue.scala 144:43]
  reg [4:0] ghist_1_ras_idx_MPORT_3_addr_pipe_0;
  reg [4:0] bpd_ptr; // @[fetch-target-queue.scala 133:27]
  reg [4:0] deq_ptr; // @[fetch-target-queue.scala 134:27]
  reg [4:0] enq_ptr; // @[fetch-target-queue.scala 135:27]
  wire [4:0] _T_1 = enq_ptr + 5'h1; // @[util.scala 203:14]
  wire [4:0] _T_4 = _T_1 + 5'h1; // @[util.scala 203:14]
  wire  _T_10 = _T_1 == bpd_ptr; // @[fetch-target-queue.scala 138:46]
  wire  full = _T_4 == bpd_ptr | _T_10; // @[fetch-target-queue.scala 137:81]
  reg [39:0] pcs_0; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_1; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_2; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_3; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_4; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_5; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_6; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_7; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_8; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_9; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_10; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_11; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_12; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_13; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_14; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_15; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_16; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_17; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_18; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_19; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_20; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_21; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_22; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_23; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_24; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_25; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_26; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_27; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_28; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_29; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_30; // @[fetch-target-queue.scala 141:21]
  reg [39:0] pcs_31; // @[fetch-target-queue.scala 141:21]
  reg  ram_0_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_0_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_0_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_0_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_0_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_0_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_0_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_0_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_0_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_0_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_0_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_0_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_1_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_1_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_1_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_1_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_1_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_1_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_1_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_1_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_1_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_1_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_1_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_1_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_2_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_2_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_2_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_2_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_2_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_2_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_2_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_2_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_2_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_2_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_2_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_2_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_3_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_3_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_3_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_3_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_3_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_3_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_3_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_3_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_3_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_3_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_3_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_3_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_4_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_4_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_4_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_4_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_4_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_4_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_4_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_4_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_4_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_4_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_4_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_4_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_5_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_5_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_5_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_5_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_5_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_5_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_5_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_5_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_5_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_5_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_5_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_5_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_6_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_6_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_6_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_6_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_6_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_6_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_6_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_6_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_6_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_6_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_6_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_6_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_7_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_7_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_7_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_7_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_7_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_7_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_7_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_7_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_7_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_7_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_7_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_7_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_8_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_8_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_8_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_8_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_8_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_8_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_8_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_8_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_8_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_8_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_8_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_8_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_9_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_9_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_9_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_9_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_9_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_9_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_9_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_9_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_9_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_9_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_9_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_9_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_10_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_10_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_10_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_10_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_10_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_10_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_10_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_10_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_10_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_10_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_10_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_10_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_11_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_11_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_11_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_11_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_11_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_11_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_11_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_11_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_11_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_11_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_11_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_11_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_12_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_12_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_12_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_12_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_12_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_12_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_12_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_12_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_12_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_12_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_12_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_12_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_13_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_13_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_13_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_13_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_13_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_13_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_13_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_13_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_13_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_13_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_13_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_13_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_14_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_14_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_14_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_14_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_14_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_14_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_14_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_14_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_14_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_14_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_14_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_14_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_15_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_15_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_15_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_15_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_15_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_15_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_15_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_15_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_15_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_15_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_15_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_15_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_16_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_16_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_16_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_16_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_16_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_16_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_16_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_16_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_16_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_16_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_16_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_16_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_17_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_17_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_17_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_17_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_17_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_17_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_17_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_17_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_17_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_17_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_17_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_17_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_18_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_18_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_18_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_18_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_18_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_18_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_18_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_18_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_18_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_18_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_18_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_18_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_19_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_19_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_19_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_19_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_19_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_19_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_19_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_19_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_19_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_19_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_19_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_19_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_20_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_20_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_20_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_20_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_20_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_20_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_20_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_20_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_20_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_20_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_20_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_20_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_21_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_21_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_21_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_21_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_21_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_21_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_21_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_21_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_21_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_21_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_21_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_21_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_22_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_22_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_22_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_22_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_22_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_22_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_22_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_22_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_22_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_22_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_22_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_22_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_23_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_23_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_23_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_23_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_23_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_23_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_23_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_23_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_23_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_23_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_23_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_23_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_24_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_24_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_24_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_24_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_24_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_24_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_24_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_24_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_24_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_24_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_24_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_24_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_25_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_25_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_25_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_25_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_25_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_25_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_25_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_25_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_25_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_25_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_25_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_25_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_26_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_26_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_26_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_26_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_26_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_26_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_26_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_26_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_26_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_26_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_26_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_26_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_27_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_27_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_27_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_27_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_27_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_27_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_27_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_27_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_27_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_27_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_27_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_27_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_28_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_28_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_28_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_28_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_28_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_28_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_28_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_28_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_28_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_28_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_28_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_28_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_29_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_29_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_29_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_29_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_29_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_29_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_29_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_29_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_29_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_29_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_29_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_29_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_30_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_30_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_30_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_30_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_30_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_30_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_30_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_30_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_30_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_30_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_30_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_30_start_bank; // @[fetch-target-queue.scala 143:21]
  reg  ram_31_cfi_idx_valid; // @[fetch-target-queue.scala 143:21]
  reg [1:0] ram_31_cfi_idx_bits; // @[fetch-target-queue.scala 143:21]
  reg  ram_31_cfi_taken; // @[fetch-target-queue.scala 143:21]
  reg  ram_31_cfi_mispredicted; // @[fetch-target-queue.scala 143:21]
  reg [2:0] ram_31_cfi_type; // @[fetch-target-queue.scala 143:21]
  reg [3:0] ram_31_br_mask; // @[fetch-target-queue.scala 143:21]
  reg  ram_31_cfi_is_call; // @[fetch-target-queue.scala 143:21]
  reg  ram_31_cfi_is_ret; // @[fetch-target-queue.scala 143:21]
  reg  ram_31_cfi_npc_plus4; // @[fetch-target-queue.scala 143:21]
  reg [39:0] ram_31_ras_top; // @[fetch-target-queue.scala 143:21]
  reg [4:0] ram_31_ras_idx; // @[fetch-target-queue.scala 143:21]
  reg  ram_31_start_bank; // @[fetch-target-queue.scala 143:21]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  reg [63:0] prev_ghist_old_history; // @[fetch-target-queue.scala 155:27]
  reg  prev_ghist_current_saw_branch_not_taken; // @[fetch-target-queue.scala 155:27]
  reg [4:0] prev_ghist_ras_idx; // @[fetch-target-queue.scala 155:27]
  reg  prev_entry_cfi_idx_valid; // @[fetch-target-queue.scala 156:27]
  reg [1:0] prev_entry_cfi_idx_bits; // @[fetch-target-queue.scala 156:27]
  reg  prev_entry_cfi_taken; // @[fetch-target-queue.scala 156:27]
  reg [3:0] prev_entry_br_mask; // @[fetch-target-queue.scala 156:27]
  reg  prev_entry_cfi_is_call; // @[fetch-target-queue.scala 156:27]
  reg  prev_entry_cfi_is_ret; // @[fetch-target-queue.scala 156:27]
  wire [3:0] _T_11 = io_enq_bits_br_mask & io_enq_bits_mask; // @[fetch-target-queue.scala 175:52]
  wire [3:0] _T_12 = prev_entry_br_mask >> prev_entry_cfi_idx_bits; // @[fetch-target-queue.scala 183:27]
  wire [3:0] _T_15 = 4'h1 << prev_entry_cfi_idx_bits; // @[OneHot.scala 58:35]
  wire [3:0] _T_17 = {{1'd0}, _T_15[3:1]}; // @[util.scala 373:29]
  wire [3:0] _T_18 = {{2'd0}, _T_15[3:2]}; // @[util.scala 373:29]
  wire [3:0] _T_19 = {{3'd0}, _T_15[3]}; // @[util.scala 373:29]
  wire [3:0] _T_20 = _T_15 | _T_17; // @[util.scala 373:45]
  wire [3:0] _T_21 = _T_20 | _T_18; // @[util.scala 373:45]
  wire [3:0] _T_22 = _T_21 | _T_19; // @[util.scala 373:45]
  wire  _T_23 = _T_12[0] & prev_entry_cfi_taken; // @[frontend.scala 91:84]
  wire [3:0] _T_24 = _T_12[0] & prev_entry_cfi_taken ? _T_15 : 4'h0; // @[frontend.scala 91:73]
  wire [3:0] _T_25 = ~_T_24; // @[frontend.scala 91:69]
  wire [3:0] _T_26 = _T_22 & _T_25; // @[frontend.scala 91:67]
  wire [3:0] _T_28 = prev_entry_cfi_idx_valid ? _T_26 : 4'hf; // @[frontend.scala 90:44]
  wire [3:0] _T_29 = prev_entry_br_mask & _T_28; // @[frontend.scala 90:39]
  wire  _T_31 = _T_29 != 4'h0 | prev_ghist_current_saw_branch_not_taken; // @[frontend.scala 98:61]
  wire [64:0] _T_34 = {prev_ghist_old_history, 1'h0}; // @[frontend.scala 99:91]
  wire [64:0] _T_35 = _T_34 | 65'h1; // @[frontend.scala 99:96]
  wire [64:0] _T_37 = _T_31 ? _T_34 : {{1'd0}, prev_ghist_old_history}; // @[frontend.scala 100:37]
  wire [64:0] _T_38 = _T_23 & prev_entry_cfi_idx_valid ? _T_35 : _T_37; // @[frontend.scala 99:37]
  wire [4:0] _T_41 = prev_ghist_ras_idx + 5'h1; // @[util.scala 203:14]
  wire [4:0] _T_45 = prev_ghist_ras_idx - 5'h1; // @[util.scala 220:14]
  wire [4:0] _T_47 = prev_entry_cfi_idx_valid & prev_entry_cfi_is_ret ? _T_45 : prev_ghist_ras_idx; // @[frontend.scala 125:31]
  wire [4:0] _T_48 = prev_entry_cfi_idx_valid & prev_entry_cfi_is_call ? _T_41 : _T_47; // @[frontend.scala 124:31]
  wire [63:0] _T_49_old_history = io_enq_bits_ghist_current_saw_branch_not_taken ? io_enq_bits_ghist_old_history : _T_38
    [63:0]; // @[fetch-target-queue.scala 178:24]
  wire [4:0] _T_49_ras_idx = io_enq_bits_ghist_current_saw_branch_not_taken ? io_enq_bits_ghist_ras_idx : _T_48; // @[fetch-target-queue.scala 178:24]
  wire  _GEN_32 = 5'h0 == enq_ptr ? 1'h0 : ram_0_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_33 = 5'h1 == enq_ptr ? 1'h0 : ram_1_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_34 = 5'h2 == enq_ptr ? 1'h0 : ram_2_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_35 = 5'h3 == enq_ptr ? 1'h0 : ram_3_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_36 = 5'h4 == enq_ptr ? 1'h0 : ram_4_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_37 = 5'h5 == enq_ptr ? 1'h0 : ram_5_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_38 = 5'h6 == enq_ptr ? 1'h0 : ram_6_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_39 = 5'h7 == enq_ptr ? 1'h0 : ram_7_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_40 = 5'h8 == enq_ptr ? 1'h0 : ram_8_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_41 = 5'h9 == enq_ptr ? 1'h0 : ram_9_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_42 = 5'ha == enq_ptr ? 1'h0 : ram_10_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_43 = 5'hb == enq_ptr ? 1'h0 : ram_11_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_44 = 5'hc == enq_ptr ? 1'h0 : ram_12_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_45 = 5'hd == enq_ptr ? 1'h0 : ram_13_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_46 = 5'he == enq_ptr ? 1'h0 : ram_14_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_47 = 5'hf == enq_ptr ? 1'h0 : ram_15_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_48 = 5'h10 == enq_ptr ? 1'h0 : ram_16_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_49 = 5'h11 == enq_ptr ? 1'h0 : ram_17_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_50 = 5'h12 == enq_ptr ? 1'h0 : ram_18_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_51 = 5'h13 == enq_ptr ? 1'h0 : ram_19_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_52 = 5'h14 == enq_ptr ? 1'h0 : ram_20_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_53 = 5'h15 == enq_ptr ? 1'h0 : ram_21_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_54 = 5'h16 == enq_ptr ? 1'h0 : ram_22_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_55 = 5'h17 == enq_ptr ? 1'h0 : ram_23_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_56 = 5'h18 == enq_ptr ? 1'h0 : ram_24_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_57 = 5'h19 == enq_ptr ? 1'h0 : ram_25_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_58 = 5'h1a == enq_ptr ? 1'h0 : ram_26_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_59 = 5'h1b == enq_ptr ? 1'h0 : ram_27_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_60 = 5'h1c == enq_ptr ? 1'h0 : ram_28_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_61 = 5'h1d == enq_ptr ? 1'h0 : ram_29_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_62 = 5'h1e == enq_ptr ? 1'h0 : ram_30_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_63 = 5'h1f == enq_ptr ? 1'h0 : ram_31_start_bank; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_64 = 5'h0 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_0_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_65 = 5'h1 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_1_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_66 = 5'h2 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_2_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_67 = 5'h3 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_3_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_68 = 5'h4 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_4_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_69 = 5'h5 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_5_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_70 = 5'h6 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_6_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_71 = 5'h7 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_7_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_72 = 5'h8 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_8_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_73 = 5'h9 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_9_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_74 = 5'ha == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_10_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_75 = 5'hb == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_11_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_76 = 5'hc == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_12_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_77 = 5'hd == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_13_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_78 = 5'he == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_14_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_79 = 5'hf == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_15_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_80 = 5'h10 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_16_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_81 = 5'h11 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_17_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_82 = 5'h12 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_18_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_83 = 5'h13 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_19_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_84 = 5'h14 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_20_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_85 = 5'h15 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_21_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_86 = 5'h16 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_22_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_87 = 5'h17 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_23_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_88 = 5'h18 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_24_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_89 = 5'h19 == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_25_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_90 = 5'h1a == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_26_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_91 = 5'h1b == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_27_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_92 = 5'h1c == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_28_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_93 = 5'h1d == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_29_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_94 = 5'h1e == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_30_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_95 = 5'h1f == enq_ptr ? io_enq_bits_ghist_ras_idx : ram_31_ras_idx; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_96 = 5'h0 == enq_ptr ? io_enq_bits_ras_top : ram_0_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_97 = 5'h1 == enq_ptr ? io_enq_bits_ras_top : ram_1_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_98 = 5'h2 == enq_ptr ? io_enq_bits_ras_top : ram_2_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_99 = 5'h3 == enq_ptr ? io_enq_bits_ras_top : ram_3_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_100 = 5'h4 == enq_ptr ? io_enq_bits_ras_top : ram_4_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_101 = 5'h5 == enq_ptr ? io_enq_bits_ras_top : ram_5_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_102 = 5'h6 == enq_ptr ? io_enq_bits_ras_top : ram_6_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_103 = 5'h7 == enq_ptr ? io_enq_bits_ras_top : ram_7_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_104 = 5'h8 == enq_ptr ? io_enq_bits_ras_top : ram_8_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_105 = 5'h9 == enq_ptr ? io_enq_bits_ras_top : ram_9_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_106 = 5'ha == enq_ptr ? io_enq_bits_ras_top : ram_10_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_107 = 5'hb == enq_ptr ? io_enq_bits_ras_top : ram_11_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_108 = 5'hc == enq_ptr ? io_enq_bits_ras_top : ram_12_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_109 = 5'hd == enq_ptr ? io_enq_bits_ras_top : ram_13_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_110 = 5'he == enq_ptr ? io_enq_bits_ras_top : ram_14_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_111 = 5'hf == enq_ptr ? io_enq_bits_ras_top : ram_15_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_112 = 5'h10 == enq_ptr ? io_enq_bits_ras_top : ram_16_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_113 = 5'h11 == enq_ptr ? io_enq_bits_ras_top : ram_17_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_114 = 5'h12 == enq_ptr ? io_enq_bits_ras_top : ram_18_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_115 = 5'h13 == enq_ptr ? io_enq_bits_ras_top : ram_19_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_116 = 5'h14 == enq_ptr ? io_enq_bits_ras_top : ram_20_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_117 = 5'h15 == enq_ptr ? io_enq_bits_ras_top : ram_21_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_118 = 5'h16 == enq_ptr ? io_enq_bits_ras_top : ram_22_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_119 = 5'h17 == enq_ptr ? io_enq_bits_ras_top : ram_23_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_120 = 5'h18 == enq_ptr ? io_enq_bits_ras_top : ram_24_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_121 = 5'h19 == enq_ptr ? io_enq_bits_ras_top : ram_25_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_122 = 5'h1a == enq_ptr ? io_enq_bits_ras_top : ram_26_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_123 = 5'h1b == enq_ptr ? io_enq_bits_ras_top : ram_27_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_124 = 5'h1c == enq_ptr ? io_enq_bits_ras_top : ram_28_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_125 = 5'h1d == enq_ptr ? io_enq_bits_ras_top : ram_29_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_126 = 5'h1e == enq_ptr ? io_enq_bits_ras_top : ram_30_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_127 = 5'h1f == enq_ptr ? io_enq_bits_ras_top : ram_31_ras_top; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_128 = 5'h0 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_0_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_129 = 5'h1 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_1_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_130 = 5'h2 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_2_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_131 = 5'h3 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_3_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_132 = 5'h4 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_4_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_133 = 5'h5 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_5_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_134 = 5'h6 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_6_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_135 = 5'h7 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_7_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_136 = 5'h8 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_8_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_137 = 5'h9 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_9_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_138 = 5'ha == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_10_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_139 = 5'hb == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_11_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_140 = 5'hc == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_12_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_141 = 5'hd == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_13_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_142 = 5'he == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_14_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_143 = 5'hf == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_15_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_144 = 5'h10 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_16_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_145 = 5'h11 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_17_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_146 = 5'h12 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_18_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_147 = 5'h13 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_19_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_148 = 5'h14 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_20_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_149 = 5'h15 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_21_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_150 = 5'h16 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_22_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_151 = 5'h17 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_23_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_152 = 5'h18 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_24_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_153 = 5'h19 == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_25_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_154 = 5'h1a == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_26_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_155 = 5'h1b == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_27_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_156 = 5'h1c == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_28_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_157 = 5'h1d == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_29_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_158 = 5'h1e == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_30_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_159 = 5'h1f == enq_ptr ? io_enq_bits_cfi_npc_plus4 : ram_31_cfi_npc_plus4; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_160 = 5'h0 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_0_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_161 = 5'h1 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_1_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_162 = 5'h2 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_2_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_163 = 5'h3 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_3_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_164 = 5'h4 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_4_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_165 = 5'h5 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_5_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_166 = 5'h6 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_6_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_167 = 5'h7 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_7_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_168 = 5'h8 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_8_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_169 = 5'h9 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_9_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_170 = 5'ha == enq_ptr ? io_enq_bits_cfi_is_ret : ram_10_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_171 = 5'hb == enq_ptr ? io_enq_bits_cfi_is_ret : ram_11_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_172 = 5'hc == enq_ptr ? io_enq_bits_cfi_is_ret : ram_12_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_173 = 5'hd == enq_ptr ? io_enq_bits_cfi_is_ret : ram_13_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_174 = 5'he == enq_ptr ? io_enq_bits_cfi_is_ret : ram_14_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_175 = 5'hf == enq_ptr ? io_enq_bits_cfi_is_ret : ram_15_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_176 = 5'h10 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_16_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_177 = 5'h11 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_17_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_178 = 5'h12 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_18_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_179 = 5'h13 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_19_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_180 = 5'h14 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_20_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_181 = 5'h15 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_21_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_182 = 5'h16 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_22_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_183 = 5'h17 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_23_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_184 = 5'h18 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_24_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_185 = 5'h19 == enq_ptr ? io_enq_bits_cfi_is_ret : ram_25_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_186 = 5'h1a == enq_ptr ? io_enq_bits_cfi_is_ret : ram_26_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_187 = 5'h1b == enq_ptr ? io_enq_bits_cfi_is_ret : ram_27_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_188 = 5'h1c == enq_ptr ? io_enq_bits_cfi_is_ret : ram_28_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_189 = 5'h1d == enq_ptr ? io_enq_bits_cfi_is_ret : ram_29_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_190 = 5'h1e == enq_ptr ? io_enq_bits_cfi_is_ret : ram_30_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_191 = 5'h1f == enq_ptr ? io_enq_bits_cfi_is_ret : ram_31_cfi_is_ret; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_192 = 5'h0 == enq_ptr ? io_enq_bits_cfi_is_call : ram_0_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_193 = 5'h1 == enq_ptr ? io_enq_bits_cfi_is_call : ram_1_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_194 = 5'h2 == enq_ptr ? io_enq_bits_cfi_is_call : ram_2_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_195 = 5'h3 == enq_ptr ? io_enq_bits_cfi_is_call : ram_3_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_196 = 5'h4 == enq_ptr ? io_enq_bits_cfi_is_call : ram_4_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_197 = 5'h5 == enq_ptr ? io_enq_bits_cfi_is_call : ram_5_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_198 = 5'h6 == enq_ptr ? io_enq_bits_cfi_is_call : ram_6_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_199 = 5'h7 == enq_ptr ? io_enq_bits_cfi_is_call : ram_7_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_200 = 5'h8 == enq_ptr ? io_enq_bits_cfi_is_call : ram_8_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_201 = 5'h9 == enq_ptr ? io_enq_bits_cfi_is_call : ram_9_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_202 = 5'ha == enq_ptr ? io_enq_bits_cfi_is_call : ram_10_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_203 = 5'hb == enq_ptr ? io_enq_bits_cfi_is_call : ram_11_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_204 = 5'hc == enq_ptr ? io_enq_bits_cfi_is_call : ram_12_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_205 = 5'hd == enq_ptr ? io_enq_bits_cfi_is_call : ram_13_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_206 = 5'he == enq_ptr ? io_enq_bits_cfi_is_call : ram_14_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_207 = 5'hf == enq_ptr ? io_enq_bits_cfi_is_call : ram_15_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_208 = 5'h10 == enq_ptr ? io_enq_bits_cfi_is_call : ram_16_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_209 = 5'h11 == enq_ptr ? io_enq_bits_cfi_is_call : ram_17_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_210 = 5'h12 == enq_ptr ? io_enq_bits_cfi_is_call : ram_18_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_211 = 5'h13 == enq_ptr ? io_enq_bits_cfi_is_call : ram_19_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_212 = 5'h14 == enq_ptr ? io_enq_bits_cfi_is_call : ram_20_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_213 = 5'h15 == enq_ptr ? io_enq_bits_cfi_is_call : ram_21_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_214 = 5'h16 == enq_ptr ? io_enq_bits_cfi_is_call : ram_22_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_215 = 5'h17 == enq_ptr ? io_enq_bits_cfi_is_call : ram_23_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_216 = 5'h18 == enq_ptr ? io_enq_bits_cfi_is_call : ram_24_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_217 = 5'h19 == enq_ptr ? io_enq_bits_cfi_is_call : ram_25_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_218 = 5'h1a == enq_ptr ? io_enq_bits_cfi_is_call : ram_26_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_219 = 5'h1b == enq_ptr ? io_enq_bits_cfi_is_call : ram_27_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_220 = 5'h1c == enq_ptr ? io_enq_bits_cfi_is_call : ram_28_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_221 = 5'h1d == enq_ptr ? io_enq_bits_cfi_is_call : ram_29_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_222 = 5'h1e == enq_ptr ? io_enq_bits_cfi_is_call : ram_30_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_223 = 5'h1f == enq_ptr ? io_enq_bits_cfi_is_call : ram_31_cfi_is_call; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_224 = 5'h0 == enq_ptr ? _T_11 : ram_0_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_225 = 5'h1 == enq_ptr ? _T_11 : ram_1_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_226 = 5'h2 == enq_ptr ? _T_11 : ram_2_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_227 = 5'h3 == enq_ptr ? _T_11 : ram_3_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_228 = 5'h4 == enq_ptr ? _T_11 : ram_4_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_229 = 5'h5 == enq_ptr ? _T_11 : ram_5_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_230 = 5'h6 == enq_ptr ? _T_11 : ram_6_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_231 = 5'h7 == enq_ptr ? _T_11 : ram_7_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_232 = 5'h8 == enq_ptr ? _T_11 : ram_8_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_233 = 5'h9 == enq_ptr ? _T_11 : ram_9_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_234 = 5'ha == enq_ptr ? _T_11 : ram_10_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_235 = 5'hb == enq_ptr ? _T_11 : ram_11_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_236 = 5'hc == enq_ptr ? _T_11 : ram_12_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_237 = 5'hd == enq_ptr ? _T_11 : ram_13_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_238 = 5'he == enq_ptr ? _T_11 : ram_14_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_239 = 5'hf == enq_ptr ? _T_11 : ram_15_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_240 = 5'h10 == enq_ptr ? _T_11 : ram_16_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_241 = 5'h11 == enq_ptr ? _T_11 : ram_17_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_242 = 5'h12 == enq_ptr ? _T_11 : ram_18_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_243 = 5'h13 == enq_ptr ? _T_11 : ram_19_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_244 = 5'h14 == enq_ptr ? _T_11 : ram_20_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_245 = 5'h15 == enq_ptr ? _T_11 : ram_21_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_246 = 5'h16 == enq_ptr ? _T_11 : ram_22_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_247 = 5'h17 == enq_ptr ? _T_11 : ram_23_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_248 = 5'h18 == enq_ptr ? _T_11 : ram_24_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_249 = 5'h19 == enq_ptr ? _T_11 : ram_25_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_250 = 5'h1a == enq_ptr ? _T_11 : ram_26_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_251 = 5'h1b == enq_ptr ? _T_11 : ram_27_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_252 = 5'h1c == enq_ptr ? _T_11 : ram_28_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_253 = 5'h1d == enq_ptr ? _T_11 : ram_29_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_254 = 5'h1e == enq_ptr ? _T_11 : ram_30_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_255 = 5'h1f == enq_ptr ? _T_11 : ram_31_br_mask; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_256 = 5'h0 == enq_ptr ? io_enq_bits_cfi_type : ram_0_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_257 = 5'h1 == enq_ptr ? io_enq_bits_cfi_type : ram_1_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_258 = 5'h2 == enq_ptr ? io_enq_bits_cfi_type : ram_2_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_259 = 5'h3 == enq_ptr ? io_enq_bits_cfi_type : ram_3_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_260 = 5'h4 == enq_ptr ? io_enq_bits_cfi_type : ram_4_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_261 = 5'h5 == enq_ptr ? io_enq_bits_cfi_type : ram_5_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_262 = 5'h6 == enq_ptr ? io_enq_bits_cfi_type : ram_6_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_263 = 5'h7 == enq_ptr ? io_enq_bits_cfi_type : ram_7_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_264 = 5'h8 == enq_ptr ? io_enq_bits_cfi_type : ram_8_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_265 = 5'h9 == enq_ptr ? io_enq_bits_cfi_type : ram_9_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_266 = 5'ha == enq_ptr ? io_enq_bits_cfi_type : ram_10_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_267 = 5'hb == enq_ptr ? io_enq_bits_cfi_type : ram_11_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_268 = 5'hc == enq_ptr ? io_enq_bits_cfi_type : ram_12_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_269 = 5'hd == enq_ptr ? io_enq_bits_cfi_type : ram_13_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_270 = 5'he == enq_ptr ? io_enq_bits_cfi_type : ram_14_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_271 = 5'hf == enq_ptr ? io_enq_bits_cfi_type : ram_15_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_272 = 5'h10 == enq_ptr ? io_enq_bits_cfi_type : ram_16_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_273 = 5'h11 == enq_ptr ? io_enq_bits_cfi_type : ram_17_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_274 = 5'h12 == enq_ptr ? io_enq_bits_cfi_type : ram_18_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_275 = 5'h13 == enq_ptr ? io_enq_bits_cfi_type : ram_19_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_276 = 5'h14 == enq_ptr ? io_enq_bits_cfi_type : ram_20_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_277 = 5'h15 == enq_ptr ? io_enq_bits_cfi_type : ram_21_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_278 = 5'h16 == enq_ptr ? io_enq_bits_cfi_type : ram_22_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_279 = 5'h17 == enq_ptr ? io_enq_bits_cfi_type : ram_23_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_280 = 5'h18 == enq_ptr ? io_enq_bits_cfi_type : ram_24_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_281 = 5'h19 == enq_ptr ? io_enq_bits_cfi_type : ram_25_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_282 = 5'h1a == enq_ptr ? io_enq_bits_cfi_type : ram_26_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_283 = 5'h1b == enq_ptr ? io_enq_bits_cfi_type : ram_27_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_284 = 5'h1c == enq_ptr ? io_enq_bits_cfi_type : ram_28_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_285 = 5'h1d == enq_ptr ? io_enq_bits_cfi_type : ram_29_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_286 = 5'h1e == enq_ptr ? io_enq_bits_cfi_type : ram_30_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_287 = 5'h1f == enq_ptr ? io_enq_bits_cfi_type : ram_31_cfi_type; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_288 = 5'h0 == enq_ptr ? 1'h0 : ram_0_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_289 = 5'h1 == enq_ptr ? 1'h0 : ram_1_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_290 = 5'h2 == enq_ptr ? 1'h0 : ram_2_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_291 = 5'h3 == enq_ptr ? 1'h0 : ram_3_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_292 = 5'h4 == enq_ptr ? 1'h0 : ram_4_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_293 = 5'h5 == enq_ptr ? 1'h0 : ram_5_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_294 = 5'h6 == enq_ptr ? 1'h0 : ram_6_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_295 = 5'h7 == enq_ptr ? 1'h0 : ram_7_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_296 = 5'h8 == enq_ptr ? 1'h0 : ram_8_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_297 = 5'h9 == enq_ptr ? 1'h0 : ram_9_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_298 = 5'ha == enq_ptr ? 1'h0 : ram_10_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_299 = 5'hb == enq_ptr ? 1'h0 : ram_11_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_300 = 5'hc == enq_ptr ? 1'h0 : ram_12_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_301 = 5'hd == enq_ptr ? 1'h0 : ram_13_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_302 = 5'he == enq_ptr ? 1'h0 : ram_14_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_303 = 5'hf == enq_ptr ? 1'h0 : ram_15_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_304 = 5'h10 == enq_ptr ? 1'h0 : ram_16_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_305 = 5'h11 == enq_ptr ? 1'h0 : ram_17_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_306 = 5'h12 == enq_ptr ? 1'h0 : ram_18_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_307 = 5'h13 == enq_ptr ? 1'h0 : ram_19_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_308 = 5'h14 == enq_ptr ? 1'h0 : ram_20_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_309 = 5'h15 == enq_ptr ? 1'h0 : ram_21_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_310 = 5'h16 == enq_ptr ? 1'h0 : ram_22_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_311 = 5'h17 == enq_ptr ? 1'h0 : ram_23_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_312 = 5'h18 == enq_ptr ? 1'h0 : ram_24_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_313 = 5'h19 == enq_ptr ? 1'h0 : ram_25_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_314 = 5'h1a == enq_ptr ? 1'h0 : ram_26_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_315 = 5'h1b == enq_ptr ? 1'h0 : ram_27_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_316 = 5'h1c == enq_ptr ? 1'h0 : ram_28_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_317 = 5'h1d == enq_ptr ? 1'h0 : ram_29_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_318 = 5'h1e == enq_ptr ? 1'h0 : ram_30_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_319 = 5'h1f == enq_ptr ? 1'h0 : ram_31_cfi_mispredicted; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_320 = 5'h0 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_0_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_321 = 5'h1 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_1_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_322 = 5'h2 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_2_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_323 = 5'h3 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_3_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_324 = 5'h4 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_4_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_325 = 5'h5 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_5_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_326 = 5'h6 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_6_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_327 = 5'h7 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_7_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_328 = 5'h8 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_8_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_329 = 5'h9 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_9_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_330 = 5'ha == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_10_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_331 = 5'hb == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_11_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_332 = 5'hc == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_12_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_333 = 5'hd == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_13_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_334 = 5'he == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_14_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_335 = 5'hf == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_15_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_336 = 5'h10 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_16_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_337 = 5'h11 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_17_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_338 = 5'h12 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_18_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_339 = 5'h13 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_19_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_340 = 5'h14 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_20_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_341 = 5'h15 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_21_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_342 = 5'h16 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_22_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_343 = 5'h17 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_23_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_344 = 5'h18 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_24_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_345 = 5'h19 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_25_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_346 = 5'h1a == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_26_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_347 = 5'h1b == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_27_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_348 = 5'h1c == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_28_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_349 = 5'h1d == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_29_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_350 = 5'h1e == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_30_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_351 = 5'h1f == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_31_cfi_taken; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_352 = 5'h0 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_0_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_353 = 5'h1 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_1_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_354 = 5'h2 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_2_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_355 = 5'h3 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_3_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_356 = 5'h4 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_4_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_357 = 5'h5 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_5_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_358 = 5'h6 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_6_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_359 = 5'h7 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_7_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_360 = 5'h8 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_8_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_361 = 5'h9 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_9_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_362 = 5'ha == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_10_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_363 = 5'hb == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_11_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_364 = 5'hc == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_12_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_365 = 5'hd == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_13_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_366 = 5'he == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_14_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_367 = 5'hf == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_15_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_368 = 5'h10 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_16_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_369 = 5'h11 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_17_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_370 = 5'h12 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_18_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_371 = 5'h13 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_19_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_372 = 5'h14 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_20_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_373 = 5'h15 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_21_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_374 = 5'h16 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_22_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_375 = 5'h17 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_23_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_376 = 5'h18 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_24_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_377 = 5'h19 == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_25_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_378 = 5'h1a == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_26_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_379 = 5'h1b == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_27_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_380 = 5'h1c == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_28_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_381 = 5'h1d == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_29_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_382 = 5'h1e == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_30_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_383 = 5'h1f == enq_ptr ? io_enq_bits_cfi_idx_bits : ram_31_cfi_idx_bits; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_384 = 5'h0 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_0_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_385 = 5'h1 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_1_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_386 = 5'h2 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_2_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_387 = 5'h3 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_3_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_388 = 5'h4 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_4_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_389 = 5'h5 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_5_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_390 = 5'h6 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_6_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_391 = 5'h7 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_7_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_392 = 5'h8 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_8_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_393 = 5'h9 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_9_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_394 = 5'ha == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_10_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_395 = 5'hb == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_11_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_396 = 5'hc == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_12_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_397 = 5'hd == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_13_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_398 = 5'he == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_14_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_399 = 5'hf == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_15_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_400 = 5'h10 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_16_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_401 = 5'h11 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_17_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_402 = 5'h12 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_18_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_403 = 5'h13 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_19_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_404 = 5'h14 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_20_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_405 = 5'h15 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_21_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_406 = 5'h16 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_22_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_407 = 5'h17 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_23_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_408 = 5'h18 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_24_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_409 = 5'h19 == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_25_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_410 = 5'h1a == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_26_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_411 = 5'h1b == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_27_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_412 = 5'h1c == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_28_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_413 = 5'h1d == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_29_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_414 = 5'h1e == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_30_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_415 = 5'h1f == enq_ptr ? io_enq_bits_cfi_idx_valid : ram_31_cfi_idx_valid; // @[fetch-target-queue.scala 195:18 fetch-target-queue.scala 195:18 fetch-target-queue.scala 143:21]
  wire  _GEN_458 = do_enq ? _GEN_32 : ram_0_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_459 = do_enq ? _GEN_33 : ram_1_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_460 = do_enq ? _GEN_34 : ram_2_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_461 = do_enq ? _GEN_35 : ram_3_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_462 = do_enq ? _GEN_36 : ram_4_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_463 = do_enq ? _GEN_37 : ram_5_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_464 = do_enq ? _GEN_38 : ram_6_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_465 = do_enq ? _GEN_39 : ram_7_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_466 = do_enq ? _GEN_40 : ram_8_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_467 = do_enq ? _GEN_41 : ram_9_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_468 = do_enq ? _GEN_42 : ram_10_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_469 = do_enq ? _GEN_43 : ram_11_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_470 = do_enq ? _GEN_44 : ram_12_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_471 = do_enq ? _GEN_45 : ram_13_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_472 = do_enq ? _GEN_46 : ram_14_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_473 = do_enq ? _GEN_47 : ram_15_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_474 = do_enq ? _GEN_48 : ram_16_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_475 = do_enq ? _GEN_49 : ram_17_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_476 = do_enq ? _GEN_50 : ram_18_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_477 = do_enq ? _GEN_51 : ram_19_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_478 = do_enq ? _GEN_52 : ram_20_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_479 = do_enq ? _GEN_53 : ram_21_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_480 = do_enq ? _GEN_54 : ram_22_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_481 = do_enq ? _GEN_55 : ram_23_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_482 = do_enq ? _GEN_56 : ram_24_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_483 = do_enq ? _GEN_57 : ram_25_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_484 = do_enq ? _GEN_58 : ram_26_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_485 = do_enq ? _GEN_59 : ram_27_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_486 = do_enq ? _GEN_60 : ram_28_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_487 = do_enq ? _GEN_61 : ram_29_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_488 = do_enq ? _GEN_62 : ram_30_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_489 = do_enq ? _GEN_63 : ram_31_start_bank; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_490 = do_enq ? _GEN_64 : ram_0_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_491 = do_enq ? _GEN_65 : ram_1_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_492 = do_enq ? _GEN_66 : ram_2_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_493 = do_enq ? _GEN_67 : ram_3_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_494 = do_enq ? _GEN_68 : ram_4_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_495 = do_enq ? _GEN_69 : ram_5_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_496 = do_enq ? _GEN_70 : ram_6_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_497 = do_enq ? _GEN_71 : ram_7_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_498 = do_enq ? _GEN_72 : ram_8_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_499 = do_enq ? _GEN_73 : ram_9_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_500 = do_enq ? _GEN_74 : ram_10_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_501 = do_enq ? _GEN_75 : ram_11_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_502 = do_enq ? _GEN_76 : ram_12_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_503 = do_enq ? _GEN_77 : ram_13_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_504 = do_enq ? _GEN_78 : ram_14_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_505 = do_enq ? _GEN_79 : ram_15_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_506 = do_enq ? _GEN_80 : ram_16_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_507 = do_enq ? _GEN_81 : ram_17_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_508 = do_enq ? _GEN_82 : ram_18_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_509 = do_enq ? _GEN_83 : ram_19_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_510 = do_enq ? _GEN_84 : ram_20_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_511 = do_enq ? _GEN_85 : ram_21_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_512 = do_enq ? _GEN_86 : ram_22_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_513 = do_enq ? _GEN_87 : ram_23_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_514 = do_enq ? _GEN_88 : ram_24_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_515 = do_enq ? _GEN_89 : ram_25_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_516 = do_enq ? _GEN_90 : ram_26_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_517 = do_enq ? _GEN_91 : ram_27_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_518 = do_enq ? _GEN_92 : ram_28_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_519 = do_enq ? _GEN_93 : ram_29_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_520 = do_enq ? _GEN_94 : ram_30_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [4:0] _GEN_521 = do_enq ? _GEN_95 : ram_31_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_522 = do_enq ? _GEN_96 : ram_0_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_523 = do_enq ? _GEN_97 : ram_1_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_524 = do_enq ? _GEN_98 : ram_2_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_525 = do_enq ? _GEN_99 : ram_3_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_526 = do_enq ? _GEN_100 : ram_4_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_527 = do_enq ? _GEN_101 : ram_5_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_528 = do_enq ? _GEN_102 : ram_6_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_529 = do_enq ? _GEN_103 : ram_7_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_530 = do_enq ? _GEN_104 : ram_8_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_531 = do_enq ? _GEN_105 : ram_9_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_532 = do_enq ? _GEN_106 : ram_10_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_533 = do_enq ? _GEN_107 : ram_11_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_534 = do_enq ? _GEN_108 : ram_12_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_535 = do_enq ? _GEN_109 : ram_13_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_536 = do_enq ? _GEN_110 : ram_14_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_537 = do_enq ? _GEN_111 : ram_15_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_538 = do_enq ? _GEN_112 : ram_16_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_539 = do_enq ? _GEN_113 : ram_17_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_540 = do_enq ? _GEN_114 : ram_18_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_541 = do_enq ? _GEN_115 : ram_19_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_542 = do_enq ? _GEN_116 : ram_20_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_543 = do_enq ? _GEN_117 : ram_21_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_544 = do_enq ? _GEN_118 : ram_22_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_545 = do_enq ? _GEN_119 : ram_23_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_546 = do_enq ? _GEN_120 : ram_24_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_547 = do_enq ? _GEN_121 : ram_25_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_548 = do_enq ? _GEN_122 : ram_26_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_549 = do_enq ? _GEN_123 : ram_27_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_550 = do_enq ? _GEN_124 : ram_28_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_551 = do_enq ? _GEN_125 : ram_29_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_552 = do_enq ? _GEN_126 : ram_30_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [39:0] _GEN_553 = do_enq ? _GEN_127 : ram_31_ras_top; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_554 = do_enq ? _GEN_128 : ram_0_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_555 = do_enq ? _GEN_129 : ram_1_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_556 = do_enq ? _GEN_130 : ram_2_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_557 = do_enq ? _GEN_131 : ram_3_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_558 = do_enq ? _GEN_132 : ram_4_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_559 = do_enq ? _GEN_133 : ram_5_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_560 = do_enq ? _GEN_134 : ram_6_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_561 = do_enq ? _GEN_135 : ram_7_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_562 = do_enq ? _GEN_136 : ram_8_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_563 = do_enq ? _GEN_137 : ram_9_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_564 = do_enq ? _GEN_138 : ram_10_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_565 = do_enq ? _GEN_139 : ram_11_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_566 = do_enq ? _GEN_140 : ram_12_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_567 = do_enq ? _GEN_141 : ram_13_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_568 = do_enq ? _GEN_142 : ram_14_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_569 = do_enq ? _GEN_143 : ram_15_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_570 = do_enq ? _GEN_144 : ram_16_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_571 = do_enq ? _GEN_145 : ram_17_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_572 = do_enq ? _GEN_146 : ram_18_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_573 = do_enq ? _GEN_147 : ram_19_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_574 = do_enq ? _GEN_148 : ram_20_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_575 = do_enq ? _GEN_149 : ram_21_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_576 = do_enq ? _GEN_150 : ram_22_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_577 = do_enq ? _GEN_151 : ram_23_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_578 = do_enq ? _GEN_152 : ram_24_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_579 = do_enq ? _GEN_153 : ram_25_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_580 = do_enq ? _GEN_154 : ram_26_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_581 = do_enq ? _GEN_155 : ram_27_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_582 = do_enq ? _GEN_156 : ram_28_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_583 = do_enq ? _GEN_157 : ram_29_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_584 = do_enq ? _GEN_158 : ram_30_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_585 = do_enq ? _GEN_159 : ram_31_cfi_npc_plus4; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_586 = do_enq ? _GEN_160 : ram_0_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_587 = do_enq ? _GEN_161 : ram_1_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_588 = do_enq ? _GEN_162 : ram_2_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_589 = do_enq ? _GEN_163 : ram_3_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_590 = do_enq ? _GEN_164 : ram_4_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_591 = do_enq ? _GEN_165 : ram_5_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_592 = do_enq ? _GEN_166 : ram_6_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_593 = do_enq ? _GEN_167 : ram_7_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_594 = do_enq ? _GEN_168 : ram_8_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_595 = do_enq ? _GEN_169 : ram_9_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_596 = do_enq ? _GEN_170 : ram_10_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_597 = do_enq ? _GEN_171 : ram_11_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_598 = do_enq ? _GEN_172 : ram_12_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_599 = do_enq ? _GEN_173 : ram_13_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_600 = do_enq ? _GEN_174 : ram_14_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_601 = do_enq ? _GEN_175 : ram_15_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_602 = do_enq ? _GEN_176 : ram_16_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_603 = do_enq ? _GEN_177 : ram_17_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_604 = do_enq ? _GEN_178 : ram_18_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_605 = do_enq ? _GEN_179 : ram_19_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_606 = do_enq ? _GEN_180 : ram_20_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_607 = do_enq ? _GEN_181 : ram_21_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_608 = do_enq ? _GEN_182 : ram_22_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_609 = do_enq ? _GEN_183 : ram_23_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_610 = do_enq ? _GEN_184 : ram_24_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_611 = do_enq ? _GEN_185 : ram_25_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_612 = do_enq ? _GEN_186 : ram_26_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_613 = do_enq ? _GEN_187 : ram_27_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_614 = do_enq ? _GEN_188 : ram_28_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_615 = do_enq ? _GEN_189 : ram_29_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_616 = do_enq ? _GEN_190 : ram_30_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_617 = do_enq ? _GEN_191 : ram_31_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_618 = do_enq ? _GEN_192 : ram_0_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_619 = do_enq ? _GEN_193 : ram_1_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_620 = do_enq ? _GEN_194 : ram_2_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_621 = do_enq ? _GEN_195 : ram_3_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_622 = do_enq ? _GEN_196 : ram_4_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_623 = do_enq ? _GEN_197 : ram_5_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_624 = do_enq ? _GEN_198 : ram_6_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_625 = do_enq ? _GEN_199 : ram_7_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_626 = do_enq ? _GEN_200 : ram_8_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_627 = do_enq ? _GEN_201 : ram_9_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_628 = do_enq ? _GEN_202 : ram_10_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_629 = do_enq ? _GEN_203 : ram_11_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_630 = do_enq ? _GEN_204 : ram_12_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_631 = do_enq ? _GEN_205 : ram_13_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_632 = do_enq ? _GEN_206 : ram_14_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_633 = do_enq ? _GEN_207 : ram_15_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_634 = do_enq ? _GEN_208 : ram_16_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_635 = do_enq ? _GEN_209 : ram_17_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_636 = do_enq ? _GEN_210 : ram_18_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_637 = do_enq ? _GEN_211 : ram_19_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_638 = do_enq ? _GEN_212 : ram_20_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_639 = do_enq ? _GEN_213 : ram_21_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_640 = do_enq ? _GEN_214 : ram_22_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_641 = do_enq ? _GEN_215 : ram_23_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_642 = do_enq ? _GEN_216 : ram_24_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_643 = do_enq ? _GEN_217 : ram_25_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_644 = do_enq ? _GEN_218 : ram_26_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_645 = do_enq ? _GEN_219 : ram_27_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_646 = do_enq ? _GEN_220 : ram_28_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_647 = do_enq ? _GEN_221 : ram_29_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_648 = do_enq ? _GEN_222 : ram_30_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_649 = do_enq ? _GEN_223 : ram_31_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_650 = do_enq ? _GEN_224 : ram_0_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_651 = do_enq ? _GEN_225 : ram_1_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_652 = do_enq ? _GEN_226 : ram_2_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_653 = do_enq ? _GEN_227 : ram_3_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_654 = do_enq ? _GEN_228 : ram_4_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_655 = do_enq ? _GEN_229 : ram_5_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_656 = do_enq ? _GEN_230 : ram_6_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_657 = do_enq ? _GEN_231 : ram_7_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_658 = do_enq ? _GEN_232 : ram_8_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_659 = do_enq ? _GEN_233 : ram_9_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_660 = do_enq ? _GEN_234 : ram_10_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_661 = do_enq ? _GEN_235 : ram_11_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_662 = do_enq ? _GEN_236 : ram_12_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_663 = do_enq ? _GEN_237 : ram_13_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_664 = do_enq ? _GEN_238 : ram_14_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_665 = do_enq ? _GEN_239 : ram_15_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_666 = do_enq ? _GEN_240 : ram_16_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_667 = do_enq ? _GEN_241 : ram_17_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_668 = do_enq ? _GEN_242 : ram_18_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_669 = do_enq ? _GEN_243 : ram_19_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_670 = do_enq ? _GEN_244 : ram_20_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_671 = do_enq ? _GEN_245 : ram_21_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_672 = do_enq ? _GEN_246 : ram_22_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_673 = do_enq ? _GEN_247 : ram_23_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_674 = do_enq ? _GEN_248 : ram_24_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_675 = do_enq ? _GEN_249 : ram_25_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_676 = do_enq ? _GEN_250 : ram_26_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_677 = do_enq ? _GEN_251 : ram_27_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_678 = do_enq ? _GEN_252 : ram_28_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_679 = do_enq ? _GEN_253 : ram_29_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_680 = do_enq ? _GEN_254 : ram_30_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [3:0] _GEN_681 = do_enq ? _GEN_255 : ram_31_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_682 = do_enq ? _GEN_256 : ram_0_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_683 = do_enq ? _GEN_257 : ram_1_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_684 = do_enq ? _GEN_258 : ram_2_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_685 = do_enq ? _GEN_259 : ram_3_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_686 = do_enq ? _GEN_260 : ram_4_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_687 = do_enq ? _GEN_261 : ram_5_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_688 = do_enq ? _GEN_262 : ram_6_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_689 = do_enq ? _GEN_263 : ram_7_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_690 = do_enq ? _GEN_264 : ram_8_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_691 = do_enq ? _GEN_265 : ram_9_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_692 = do_enq ? _GEN_266 : ram_10_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_693 = do_enq ? _GEN_267 : ram_11_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_694 = do_enq ? _GEN_268 : ram_12_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_695 = do_enq ? _GEN_269 : ram_13_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_696 = do_enq ? _GEN_270 : ram_14_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_697 = do_enq ? _GEN_271 : ram_15_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_698 = do_enq ? _GEN_272 : ram_16_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_699 = do_enq ? _GEN_273 : ram_17_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_700 = do_enq ? _GEN_274 : ram_18_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_701 = do_enq ? _GEN_275 : ram_19_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_702 = do_enq ? _GEN_276 : ram_20_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_703 = do_enq ? _GEN_277 : ram_21_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_704 = do_enq ? _GEN_278 : ram_22_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_705 = do_enq ? _GEN_279 : ram_23_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_706 = do_enq ? _GEN_280 : ram_24_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_707 = do_enq ? _GEN_281 : ram_25_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_708 = do_enq ? _GEN_282 : ram_26_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_709 = do_enq ? _GEN_283 : ram_27_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_710 = do_enq ? _GEN_284 : ram_28_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_711 = do_enq ? _GEN_285 : ram_29_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_712 = do_enq ? _GEN_286 : ram_30_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [2:0] _GEN_713 = do_enq ? _GEN_287 : ram_31_cfi_type; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_714 = do_enq ? _GEN_288 : ram_0_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_715 = do_enq ? _GEN_289 : ram_1_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_716 = do_enq ? _GEN_290 : ram_2_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_717 = do_enq ? _GEN_291 : ram_3_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_718 = do_enq ? _GEN_292 : ram_4_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_719 = do_enq ? _GEN_293 : ram_5_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_720 = do_enq ? _GEN_294 : ram_6_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_721 = do_enq ? _GEN_295 : ram_7_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_722 = do_enq ? _GEN_296 : ram_8_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_723 = do_enq ? _GEN_297 : ram_9_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_724 = do_enq ? _GEN_298 : ram_10_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_725 = do_enq ? _GEN_299 : ram_11_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_726 = do_enq ? _GEN_300 : ram_12_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_727 = do_enq ? _GEN_301 : ram_13_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_728 = do_enq ? _GEN_302 : ram_14_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_729 = do_enq ? _GEN_303 : ram_15_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_730 = do_enq ? _GEN_304 : ram_16_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_731 = do_enq ? _GEN_305 : ram_17_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_732 = do_enq ? _GEN_306 : ram_18_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_733 = do_enq ? _GEN_307 : ram_19_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_734 = do_enq ? _GEN_308 : ram_20_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_735 = do_enq ? _GEN_309 : ram_21_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_736 = do_enq ? _GEN_310 : ram_22_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_737 = do_enq ? _GEN_311 : ram_23_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_738 = do_enq ? _GEN_312 : ram_24_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_739 = do_enq ? _GEN_313 : ram_25_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_740 = do_enq ? _GEN_314 : ram_26_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_741 = do_enq ? _GEN_315 : ram_27_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_742 = do_enq ? _GEN_316 : ram_28_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_743 = do_enq ? _GEN_317 : ram_29_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_744 = do_enq ? _GEN_318 : ram_30_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_745 = do_enq ? _GEN_319 : ram_31_cfi_mispredicted; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_746 = do_enq ? _GEN_320 : ram_0_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_747 = do_enq ? _GEN_321 : ram_1_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_748 = do_enq ? _GEN_322 : ram_2_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_749 = do_enq ? _GEN_323 : ram_3_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_750 = do_enq ? _GEN_324 : ram_4_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_751 = do_enq ? _GEN_325 : ram_5_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_752 = do_enq ? _GEN_326 : ram_6_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_753 = do_enq ? _GEN_327 : ram_7_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_754 = do_enq ? _GEN_328 : ram_8_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_755 = do_enq ? _GEN_329 : ram_9_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_756 = do_enq ? _GEN_330 : ram_10_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_757 = do_enq ? _GEN_331 : ram_11_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_758 = do_enq ? _GEN_332 : ram_12_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_759 = do_enq ? _GEN_333 : ram_13_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_760 = do_enq ? _GEN_334 : ram_14_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_761 = do_enq ? _GEN_335 : ram_15_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_762 = do_enq ? _GEN_336 : ram_16_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_763 = do_enq ? _GEN_337 : ram_17_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_764 = do_enq ? _GEN_338 : ram_18_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_765 = do_enq ? _GEN_339 : ram_19_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_766 = do_enq ? _GEN_340 : ram_20_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_767 = do_enq ? _GEN_341 : ram_21_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_768 = do_enq ? _GEN_342 : ram_22_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_769 = do_enq ? _GEN_343 : ram_23_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_770 = do_enq ? _GEN_344 : ram_24_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_771 = do_enq ? _GEN_345 : ram_25_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_772 = do_enq ? _GEN_346 : ram_26_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_773 = do_enq ? _GEN_347 : ram_27_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_774 = do_enq ? _GEN_348 : ram_28_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_775 = do_enq ? _GEN_349 : ram_29_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_776 = do_enq ? _GEN_350 : ram_30_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_777 = do_enq ? _GEN_351 : ram_31_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_778 = do_enq ? _GEN_352 : ram_0_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_779 = do_enq ? _GEN_353 : ram_1_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_780 = do_enq ? _GEN_354 : ram_2_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_781 = do_enq ? _GEN_355 : ram_3_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_782 = do_enq ? _GEN_356 : ram_4_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_783 = do_enq ? _GEN_357 : ram_5_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_784 = do_enq ? _GEN_358 : ram_6_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_785 = do_enq ? _GEN_359 : ram_7_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_786 = do_enq ? _GEN_360 : ram_8_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_787 = do_enq ? _GEN_361 : ram_9_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_788 = do_enq ? _GEN_362 : ram_10_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_789 = do_enq ? _GEN_363 : ram_11_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_790 = do_enq ? _GEN_364 : ram_12_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_791 = do_enq ? _GEN_365 : ram_13_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_792 = do_enq ? _GEN_366 : ram_14_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_793 = do_enq ? _GEN_367 : ram_15_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_794 = do_enq ? _GEN_368 : ram_16_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_795 = do_enq ? _GEN_369 : ram_17_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_796 = do_enq ? _GEN_370 : ram_18_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_797 = do_enq ? _GEN_371 : ram_19_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_798 = do_enq ? _GEN_372 : ram_20_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_799 = do_enq ? _GEN_373 : ram_21_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_800 = do_enq ? _GEN_374 : ram_22_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_801 = do_enq ? _GEN_375 : ram_23_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_802 = do_enq ? _GEN_376 : ram_24_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_803 = do_enq ? _GEN_377 : ram_25_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_804 = do_enq ? _GEN_378 : ram_26_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_805 = do_enq ? _GEN_379 : ram_27_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_806 = do_enq ? _GEN_380 : ram_28_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_807 = do_enq ? _GEN_381 : ram_29_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_808 = do_enq ? _GEN_382 : ram_30_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire [1:0] _GEN_809 = do_enq ? _GEN_383 : ram_31_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_810 = do_enq ? _GEN_384 : ram_0_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_811 = do_enq ? _GEN_385 : ram_1_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_812 = do_enq ? _GEN_386 : ram_2_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_813 = do_enq ? _GEN_387 : ram_3_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_814 = do_enq ? _GEN_388 : ram_4_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_815 = do_enq ? _GEN_389 : ram_5_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_816 = do_enq ? _GEN_390 : ram_6_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_817 = do_enq ? _GEN_391 : ram_7_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_818 = do_enq ? _GEN_392 : ram_8_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_819 = do_enq ? _GEN_393 : ram_9_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_820 = do_enq ? _GEN_394 : ram_10_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_821 = do_enq ? _GEN_395 : ram_11_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_822 = do_enq ? _GEN_396 : ram_12_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_823 = do_enq ? _GEN_397 : ram_13_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_824 = do_enq ? _GEN_398 : ram_14_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_825 = do_enq ? _GEN_399 : ram_15_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_826 = do_enq ? _GEN_400 : ram_16_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_827 = do_enq ? _GEN_401 : ram_17_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_828 = do_enq ? _GEN_402 : ram_18_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_829 = do_enq ? _GEN_403 : ram_19_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_830 = do_enq ? _GEN_404 : ram_20_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_831 = do_enq ? _GEN_405 : ram_21_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_832 = do_enq ? _GEN_406 : ram_22_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_833 = do_enq ? _GEN_407 : ram_23_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_834 = do_enq ? _GEN_408 : ram_24_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_835 = do_enq ? _GEN_409 : ram_25_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_836 = do_enq ? _GEN_410 : ram_26_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_837 = do_enq ? _GEN_411 : ram_27_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_838 = do_enq ? _GEN_412 : ram_28_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_839 = do_enq ? _GEN_413 : ram_29_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_840 = do_enq ? _GEN_414 : ram_30_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_841 = do_enq ? _GEN_415 : ram_31_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 143:21]
  wire  _GEN_847 = do_enq ? io_enq_bits_cfi_is_ret : prev_entry_cfi_is_ret; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 198:16 fetch-target-queue.scala 156:27]
  wire  _GEN_848 = do_enq ? io_enq_bits_cfi_is_call : prev_entry_cfi_is_call; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 198:16 fetch-target-queue.scala 156:27]
  wire [3:0] _GEN_849 = do_enq ? _T_11 : prev_entry_br_mask; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 198:16 fetch-target-queue.scala 156:27]
  wire  _GEN_852 = do_enq ? io_enq_bits_cfi_idx_valid : prev_entry_cfi_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 198:16 fetch-target-queue.scala 156:27]
  wire [1:0] _GEN_853 = do_enq ? io_enq_bits_cfi_idx_bits : prev_entry_cfi_idx_bits; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 198:16 fetch-target-queue.scala 156:27]
  wire  _GEN_854 = do_enq ? io_enq_bits_cfi_idx_valid : prev_entry_cfi_idx_valid; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 198:16 fetch-target-queue.scala 156:27]
  wire [4:0] _GEN_855 = do_enq ? _T_49_ras_idx : prev_ghist_ras_idx; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 199:16 fetch-target-queue.scala 155:27]
  wire  _GEN_858 = do_enq ? io_enq_bits_ghist_current_saw_branch_not_taken : prev_ghist_current_saw_branch_not_taken; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 199:16 fetch-target-queue.scala 155:27]
  wire [63:0] _GEN_859 = do_enq ? _T_49_old_history : prev_ghist_old_history; // @[fetch-target-queue.scala 158:17 fetch-target-queue.scala 199:16 fetch-target-queue.scala 155:27]
  wire [4:0] _GEN_861 = io_deq_valid ? io_deq_bits : deq_ptr; // @[fetch-target-queue.scala 209:23 fetch-target-queue.scala 210:13 fetch-target-queue.scala 134:27]
  reg  first_empty; // @[fetch-target-queue.scala 214:28]
  reg  REG; // @[fetch-target-queue.scala 222:31]
  reg [39:0] REG_1; // @[fetch-target-queue.scala 223:31]
  reg [4:0] REG_2; // @[fetch-target-queue.scala 224:31]
  reg  bpd_update_mispredict; // @[fetch-target-queue.scala 226:38]
  reg  bpd_update_repair; // @[fetch-target-queue.scala 227:34]
  reg [4:0] bpd_repair_idx; // @[fetch-target-queue.scala 228:27]
  reg [4:0] bpd_end_idx; // @[fetch-target-queue.scala 229:24]
  reg [39:0] bpd_repair_pc; // @[fetch-target-queue.scala 230:26]
  wire [4:0] _T_54 = bpd_update_repair | bpd_update_mispredict ? bpd_repair_idx : bpd_ptr; // @[fetch-target-queue.scala 233:8]
  wire [4:0] bpd_idx = io_redirect_valid ? io_redirect_bits : _T_54; // @[fetch-target-queue.scala 232:20]
  reg  bpd_entry_cfi_idx_valid; // @[fetch-target-queue.scala 234:26]
  reg [1:0] bpd_entry_cfi_idx_bits; // @[fetch-target-queue.scala 234:26]
  reg  bpd_entry_cfi_taken; // @[fetch-target-queue.scala 234:26]
  reg  bpd_entry_cfi_mispredicted; // @[fetch-target-queue.scala 234:26]
  reg [2:0] bpd_entry_cfi_type; // @[fetch-target-queue.scala 234:26]
  reg [3:0] bpd_entry_br_mask; // @[fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1055 = 5'h1 == bpd_idx ? ram_1_br_mask : ram_0_br_mask; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1056 = 5'h2 == bpd_idx ? ram_2_br_mask : _GEN_1055; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1057 = 5'h3 == bpd_idx ? ram_3_br_mask : _GEN_1056; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1058 = 5'h4 == bpd_idx ? ram_4_br_mask : _GEN_1057; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1059 = 5'h5 == bpd_idx ? ram_5_br_mask : _GEN_1058; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1060 = 5'h6 == bpd_idx ? ram_6_br_mask : _GEN_1059; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1061 = 5'h7 == bpd_idx ? ram_7_br_mask : _GEN_1060; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1062 = 5'h8 == bpd_idx ? ram_8_br_mask : _GEN_1061; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1063 = 5'h9 == bpd_idx ? ram_9_br_mask : _GEN_1062; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1064 = 5'ha == bpd_idx ? ram_10_br_mask : _GEN_1063; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1065 = 5'hb == bpd_idx ? ram_11_br_mask : _GEN_1064; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1066 = 5'hc == bpd_idx ? ram_12_br_mask : _GEN_1065; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1067 = 5'hd == bpd_idx ? ram_13_br_mask : _GEN_1066; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1068 = 5'he == bpd_idx ? ram_14_br_mask : _GEN_1067; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1069 = 5'hf == bpd_idx ? ram_15_br_mask : _GEN_1068; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1070 = 5'h10 == bpd_idx ? ram_16_br_mask : _GEN_1069; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1071 = 5'h11 == bpd_idx ? ram_17_br_mask : _GEN_1070; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1072 = 5'h12 == bpd_idx ? ram_18_br_mask : _GEN_1071; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1073 = 5'h13 == bpd_idx ? ram_19_br_mask : _GEN_1072; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1074 = 5'h14 == bpd_idx ? ram_20_br_mask : _GEN_1073; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1075 = 5'h15 == bpd_idx ? ram_21_br_mask : _GEN_1074; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1076 = 5'h16 == bpd_idx ? ram_22_br_mask : _GEN_1075; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1077 = 5'h17 == bpd_idx ? ram_23_br_mask : _GEN_1076; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1078 = 5'h18 == bpd_idx ? ram_24_br_mask : _GEN_1077; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1079 = 5'h19 == bpd_idx ? ram_25_br_mask : _GEN_1078; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1080 = 5'h1a == bpd_idx ? ram_26_br_mask : _GEN_1079; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [3:0] _GEN_1081 = 5'h1b == bpd_idx ? ram_27_br_mask : _GEN_1080; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1087 = 5'h1 == bpd_idx ? ram_1_cfi_type : ram_0_cfi_type; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1088 = 5'h2 == bpd_idx ? ram_2_cfi_type : _GEN_1087; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1089 = 5'h3 == bpd_idx ? ram_3_cfi_type : _GEN_1088; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1090 = 5'h4 == bpd_idx ? ram_4_cfi_type : _GEN_1089; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1091 = 5'h5 == bpd_idx ? ram_5_cfi_type : _GEN_1090; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1092 = 5'h6 == bpd_idx ? ram_6_cfi_type : _GEN_1091; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1093 = 5'h7 == bpd_idx ? ram_7_cfi_type : _GEN_1092; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1094 = 5'h8 == bpd_idx ? ram_8_cfi_type : _GEN_1093; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1095 = 5'h9 == bpd_idx ? ram_9_cfi_type : _GEN_1094; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1096 = 5'ha == bpd_idx ? ram_10_cfi_type : _GEN_1095; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1097 = 5'hb == bpd_idx ? ram_11_cfi_type : _GEN_1096; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1098 = 5'hc == bpd_idx ? ram_12_cfi_type : _GEN_1097; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1099 = 5'hd == bpd_idx ? ram_13_cfi_type : _GEN_1098; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1100 = 5'he == bpd_idx ? ram_14_cfi_type : _GEN_1099; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1101 = 5'hf == bpd_idx ? ram_15_cfi_type : _GEN_1100; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1102 = 5'h10 == bpd_idx ? ram_16_cfi_type : _GEN_1101; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1103 = 5'h11 == bpd_idx ? ram_17_cfi_type : _GEN_1102; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1104 = 5'h12 == bpd_idx ? ram_18_cfi_type : _GEN_1103; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1105 = 5'h13 == bpd_idx ? ram_19_cfi_type : _GEN_1104; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1106 = 5'h14 == bpd_idx ? ram_20_cfi_type : _GEN_1105; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1107 = 5'h15 == bpd_idx ? ram_21_cfi_type : _GEN_1106; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1108 = 5'h16 == bpd_idx ? ram_22_cfi_type : _GEN_1107; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1109 = 5'h17 == bpd_idx ? ram_23_cfi_type : _GEN_1108; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1110 = 5'h18 == bpd_idx ? ram_24_cfi_type : _GEN_1109; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1111 = 5'h19 == bpd_idx ? ram_25_cfi_type : _GEN_1110; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1112 = 5'h1a == bpd_idx ? ram_26_cfi_type : _GEN_1111; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [2:0] _GEN_1113 = 5'h1b == bpd_idx ? ram_27_cfi_type : _GEN_1112; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1119 = 5'h1 == bpd_idx ? ram_1_cfi_mispredicted : ram_0_cfi_mispredicted; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1120 = 5'h2 == bpd_idx ? ram_2_cfi_mispredicted : _GEN_1119; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1121 = 5'h3 == bpd_idx ? ram_3_cfi_mispredicted : _GEN_1120; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1122 = 5'h4 == bpd_idx ? ram_4_cfi_mispredicted : _GEN_1121; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1123 = 5'h5 == bpd_idx ? ram_5_cfi_mispredicted : _GEN_1122; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1124 = 5'h6 == bpd_idx ? ram_6_cfi_mispredicted : _GEN_1123; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1125 = 5'h7 == bpd_idx ? ram_7_cfi_mispredicted : _GEN_1124; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1126 = 5'h8 == bpd_idx ? ram_8_cfi_mispredicted : _GEN_1125; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1127 = 5'h9 == bpd_idx ? ram_9_cfi_mispredicted : _GEN_1126; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1128 = 5'ha == bpd_idx ? ram_10_cfi_mispredicted : _GEN_1127; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1129 = 5'hb == bpd_idx ? ram_11_cfi_mispredicted : _GEN_1128; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1130 = 5'hc == bpd_idx ? ram_12_cfi_mispredicted : _GEN_1129; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1131 = 5'hd == bpd_idx ? ram_13_cfi_mispredicted : _GEN_1130; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1132 = 5'he == bpd_idx ? ram_14_cfi_mispredicted : _GEN_1131; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1133 = 5'hf == bpd_idx ? ram_15_cfi_mispredicted : _GEN_1132; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1134 = 5'h10 == bpd_idx ? ram_16_cfi_mispredicted : _GEN_1133; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1135 = 5'h11 == bpd_idx ? ram_17_cfi_mispredicted : _GEN_1134; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1136 = 5'h12 == bpd_idx ? ram_18_cfi_mispredicted : _GEN_1135; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1137 = 5'h13 == bpd_idx ? ram_19_cfi_mispredicted : _GEN_1136; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1138 = 5'h14 == bpd_idx ? ram_20_cfi_mispredicted : _GEN_1137; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1139 = 5'h15 == bpd_idx ? ram_21_cfi_mispredicted : _GEN_1138; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1140 = 5'h16 == bpd_idx ? ram_22_cfi_mispredicted : _GEN_1139; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1141 = 5'h17 == bpd_idx ? ram_23_cfi_mispredicted : _GEN_1140; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1142 = 5'h18 == bpd_idx ? ram_24_cfi_mispredicted : _GEN_1141; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1143 = 5'h19 == bpd_idx ? ram_25_cfi_mispredicted : _GEN_1142; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1144 = 5'h1a == bpd_idx ? ram_26_cfi_mispredicted : _GEN_1143; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1145 = 5'h1b == bpd_idx ? ram_27_cfi_mispredicted : _GEN_1144; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1151 = 5'h1 == bpd_idx ? ram_1_cfi_taken : ram_0_cfi_taken; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1152 = 5'h2 == bpd_idx ? ram_2_cfi_taken : _GEN_1151; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1153 = 5'h3 == bpd_idx ? ram_3_cfi_taken : _GEN_1152; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1154 = 5'h4 == bpd_idx ? ram_4_cfi_taken : _GEN_1153; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1155 = 5'h5 == bpd_idx ? ram_5_cfi_taken : _GEN_1154; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1156 = 5'h6 == bpd_idx ? ram_6_cfi_taken : _GEN_1155; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1157 = 5'h7 == bpd_idx ? ram_7_cfi_taken : _GEN_1156; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1158 = 5'h8 == bpd_idx ? ram_8_cfi_taken : _GEN_1157; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1159 = 5'h9 == bpd_idx ? ram_9_cfi_taken : _GEN_1158; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1160 = 5'ha == bpd_idx ? ram_10_cfi_taken : _GEN_1159; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1161 = 5'hb == bpd_idx ? ram_11_cfi_taken : _GEN_1160; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1162 = 5'hc == bpd_idx ? ram_12_cfi_taken : _GEN_1161; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1163 = 5'hd == bpd_idx ? ram_13_cfi_taken : _GEN_1162; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1164 = 5'he == bpd_idx ? ram_14_cfi_taken : _GEN_1163; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1165 = 5'hf == bpd_idx ? ram_15_cfi_taken : _GEN_1164; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1166 = 5'h10 == bpd_idx ? ram_16_cfi_taken : _GEN_1165; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1167 = 5'h11 == bpd_idx ? ram_17_cfi_taken : _GEN_1166; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1168 = 5'h12 == bpd_idx ? ram_18_cfi_taken : _GEN_1167; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1169 = 5'h13 == bpd_idx ? ram_19_cfi_taken : _GEN_1168; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1170 = 5'h14 == bpd_idx ? ram_20_cfi_taken : _GEN_1169; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1171 = 5'h15 == bpd_idx ? ram_21_cfi_taken : _GEN_1170; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1172 = 5'h16 == bpd_idx ? ram_22_cfi_taken : _GEN_1171; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1173 = 5'h17 == bpd_idx ? ram_23_cfi_taken : _GEN_1172; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1174 = 5'h18 == bpd_idx ? ram_24_cfi_taken : _GEN_1173; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1175 = 5'h19 == bpd_idx ? ram_25_cfi_taken : _GEN_1174; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1176 = 5'h1a == bpd_idx ? ram_26_cfi_taken : _GEN_1175; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1177 = 5'h1b == bpd_idx ? ram_27_cfi_taken : _GEN_1176; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1183 = 5'h1 == bpd_idx ? ram_1_cfi_idx_bits : ram_0_cfi_idx_bits; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1184 = 5'h2 == bpd_idx ? ram_2_cfi_idx_bits : _GEN_1183; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1185 = 5'h3 == bpd_idx ? ram_3_cfi_idx_bits : _GEN_1184; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1186 = 5'h4 == bpd_idx ? ram_4_cfi_idx_bits : _GEN_1185; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1187 = 5'h5 == bpd_idx ? ram_5_cfi_idx_bits : _GEN_1186; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1188 = 5'h6 == bpd_idx ? ram_6_cfi_idx_bits : _GEN_1187; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1189 = 5'h7 == bpd_idx ? ram_7_cfi_idx_bits : _GEN_1188; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1190 = 5'h8 == bpd_idx ? ram_8_cfi_idx_bits : _GEN_1189; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1191 = 5'h9 == bpd_idx ? ram_9_cfi_idx_bits : _GEN_1190; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1192 = 5'ha == bpd_idx ? ram_10_cfi_idx_bits : _GEN_1191; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1193 = 5'hb == bpd_idx ? ram_11_cfi_idx_bits : _GEN_1192; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1194 = 5'hc == bpd_idx ? ram_12_cfi_idx_bits : _GEN_1193; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1195 = 5'hd == bpd_idx ? ram_13_cfi_idx_bits : _GEN_1194; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1196 = 5'he == bpd_idx ? ram_14_cfi_idx_bits : _GEN_1195; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1197 = 5'hf == bpd_idx ? ram_15_cfi_idx_bits : _GEN_1196; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1198 = 5'h10 == bpd_idx ? ram_16_cfi_idx_bits : _GEN_1197; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1199 = 5'h11 == bpd_idx ? ram_17_cfi_idx_bits : _GEN_1198; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1200 = 5'h12 == bpd_idx ? ram_18_cfi_idx_bits : _GEN_1199; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1201 = 5'h13 == bpd_idx ? ram_19_cfi_idx_bits : _GEN_1200; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1202 = 5'h14 == bpd_idx ? ram_20_cfi_idx_bits : _GEN_1201; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1203 = 5'h15 == bpd_idx ? ram_21_cfi_idx_bits : _GEN_1202; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1204 = 5'h16 == bpd_idx ? ram_22_cfi_idx_bits : _GEN_1203; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1205 = 5'h17 == bpd_idx ? ram_23_cfi_idx_bits : _GEN_1204; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1206 = 5'h18 == bpd_idx ? ram_24_cfi_idx_bits : _GEN_1205; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1207 = 5'h19 == bpd_idx ? ram_25_cfi_idx_bits : _GEN_1206; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1208 = 5'h1a == bpd_idx ? ram_26_cfi_idx_bits : _GEN_1207; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire [1:0] _GEN_1209 = 5'h1b == bpd_idx ? ram_27_cfi_idx_bits : _GEN_1208; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1215 = 5'h1 == bpd_idx ? ram_1_cfi_idx_valid : ram_0_cfi_idx_valid; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1216 = 5'h2 == bpd_idx ? ram_2_cfi_idx_valid : _GEN_1215; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1217 = 5'h3 == bpd_idx ? ram_3_cfi_idx_valid : _GEN_1216; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1218 = 5'h4 == bpd_idx ? ram_4_cfi_idx_valid : _GEN_1217; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1219 = 5'h5 == bpd_idx ? ram_5_cfi_idx_valid : _GEN_1218; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1220 = 5'h6 == bpd_idx ? ram_6_cfi_idx_valid : _GEN_1219; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1221 = 5'h7 == bpd_idx ? ram_7_cfi_idx_valid : _GEN_1220; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1222 = 5'h8 == bpd_idx ? ram_8_cfi_idx_valid : _GEN_1221; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1223 = 5'h9 == bpd_idx ? ram_9_cfi_idx_valid : _GEN_1222; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1224 = 5'ha == bpd_idx ? ram_10_cfi_idx_valid : _GEN_1223; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1225 = 5'hb == bpd_idx ? ram_11_cfi_idx_valid : _GEN_1224; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1226 = 5'hc == bpd_idx ? ram_12_cfi_idx_valid : _GEN_1225; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1227 = 5'hd == bpd_idx ? ram_13_cfi_idx_valid : _GEN_1226; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1228 = 5'he == bpd_idx ? ram_14_cfi_idx_valid : _GEN_1227; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1229 = 5'hf == bpd_idx ? ram_15_cfi_idx_valid : _GEN_1228; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1230 = 5'h10 == bpd_idx ? ram_16_cfi_idx_valid : _GEN_1229; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1231 = 5'h11 == bpd_idx ? ram_17_cfi_idx_valid : _GEN_1230; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1232 = 5'h12 == bpd_idx ? ram_18_cfi_idx_valid : _GEN_1231; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1233 = 5'h13 == bpd_idx ? ram_19_cfi_idx_valid : _GEN_1232; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1234 = 5'h14 == bpd_idx ? ram_20_cfi_idx_valid : _GEN_1233; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1235 = 5'h15 == bpd_idx ? ram_21_cfi_idx_valid : _GEN_1234; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1236 = 5'h16 == bpd_idx ? ram_22_cfi_idx_valid : _GEN_1235; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1237 = 5'h17 == bpd_idx ? ram_23_cfi_idx_valid : _GEN_1236; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1238 = 5'h18 == bpd_idx ? ram_24_cfi_idx_valid : _GEN_1237; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1239 = 5'h19 == bpd_idx ? ram_25_cfi_idx_valid : _GEN_1238; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1240 = 5'h1a == bpd_idx ? ram_26_cfi_idx_valid : _GEN_1239; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  wire  _GEN_1241 = 5'h1b == bpd_idx ? ram_27_cfi_idx_valid : _GEN_1240; // @[fetch-target-queue.scala 234:26 fetch-target-queue.scala 234:26]
  reg [39:0] bpd_pc; // @[fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1252 = 5'h1 == bpd_idx ? pcs_1 : pcs_0; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1253 = 5'h2 == bpd_idx ? pcs_2 : _GEN_1252; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1254 = 5'h3 == bpd_idx ? pcs_3 : _GEN_1253; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1255 = 5'h4 == bpd_idx ? pcs_4 : _GEN_1254; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1256 = 5'h5 == bpd_idx ? pcs_5 : _GEN_1255; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1257 = 5'h6 == bpd_idx ? pcs_6 : _GEN_1256; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1258 = 5'h7 == bpd_idx ? pcs_7 : _GEN_1257; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1259 = 5'h8 == bpd_idx ? pcs_8 : _GEN_1258; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1260 = 5'h9 == bpd_idx ? pcs_9 : _GEN_1259; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1261 = 5'ha == bpd_idx ? pcs_10 : _GEN_1260; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1262 = 5'hb == bpd_idx ? pcs_11 : _GEN_1261; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1263 = 5'hc == bpd_idx ? pcs_12 : _GEN_1262; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1264 = 5'hd == bpd_idx ? pcs_13 : _GEN_1263; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1265 = 5'he == bpd_idx ? pcs_14 : _GEN_1264; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1266 = 5'hf == bpd_idx ? pcs_15 : _GEN_1265; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1267 = 5'h10 == bpd_idx ? pcs_16 : _GEN_1266; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1268 = 5'h11 == bpd_idx ? pcs_17 : _GEN_1267; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1269 = 5'h12 == bpd_idx ? pcs_18 : _GEN_1268; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1270 = 5'h13 == bpd_idx ? pcs_19 : _GEN_1269; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1271 = 5'h14 == bpd_idx ? pcs_20 : _GEN_1270; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1272 = 5'h15 == bpd_idx ? pcs_21 : _GEN_1271; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1273 = 5'h16 == bpd_idx ? pcs_22 : _GEN_1272; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1274 = 5'h17 == bpd_idx ? pcs_23 : _GEN_1273; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1275 = 5'h18 == bpd_idx ? pcs_24 : _GEN_1274; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1276 = 5'h19 == bpd_idx ? pcs_25 : _GEN_1275; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1277 = 5'h1a == bpd_idx ? pcs_26 : _GEN_1276; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [39:0] _GEN_1278 = 5'h1b == bpd_idx ? pcs_27 : _GEN_1277; // @[fetch-target-queue.scala 242:26 fetch-target-queue.scala 242:26]
  wire [4:0] _T_60 = bpd_idx + 5'h1; // @[util.scala 203:14]
  reg [39:0] bpd_target; // @[fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1284 = 5'h1 == _T_60 ? pcs_1 : pcs_0; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1285 = 5'h2 == _T_60 ? pcs_2 : _GEN_1284; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1286 = 5'h3 == _T_60 ? pcs_3 : _GEN_1285; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1287 = 5'h4 == _T_60 ? pcs_4 : _GEN_1286; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1288 = 5'h5 == _T_60 ? pcs_5 : _GEN_1287; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1289 = 5'h6 == _T_60 ? pcs_6 : _GEN_1288; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1290 = 5'h7 == _T_60 ? pcs_7 : _GEN_1289; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1291 = 5'h8 == _T_60 ? pcs_8 : _GEN_1290; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1292 = 5'h9 == _T_60 ? pcs_9 : _GEN_1291; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1293 = 5'ha == _T_60 ? pcs_10 : _GEN_1292; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1294 = 5'hb == _T_60 ? pcs_11 : _GEN_1293; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1295 = 5'hc == _T_60 ? pcs_12 : _GEN_1294; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1296 = 5'hd == _T_60 ? pcs_13 : _GEN_1295; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1297 = 5'he == _T_60 ? pcs_14 : _GEN_1296; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1298 = 5'hf == _T_60 ? pcs_15 : _GEN_1297; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1299 = 5'h10 == _T_60 ? pcs_16 : _GEN_1298; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1300 = 5'h11 == _T_60 ? pcs_17 : _GEN_1299; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1301 = 5'h12 == _T_60 ? pcs_18 : _GEN_1300; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1302 = 5'h13 == _T_60 ? pcs_19 : _GEN_1301; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1303 = 5'h14 == _T_60 ? pcs_20 : _GEN_1302; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1304 = 5'h15 == _T_60 ? pcs_21 : _GEN_1303; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1305 = 5'h16 == _T_60 ? pcs_22 : _GEN_1304; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1306 = 5'h17 == _T_60 ? pcs_23 : _GEN_1305; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1307 = 5'h18 == _T_60 ? pcs_24 : _GEN_1306; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1308 = 5'h19 == _T_60 ? pcs_25 : _GEN_1307; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1309 = 5'h1a == _T_60 ? pcs_26 : _GEN_1308; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  wire [39:0] _GEN_1310 = 5'h1b == _T_60 ? pcs_27 : _GEN_1309; // @[fetch-target-queue.scala 243:27 fetch-target-queue.scala 243:27]
  reg  REG_3; // @[fetch-target-queue.scala 248:23]
  reg [4:0] REG_4; // @[fetch-target-queue.scala 250:37]
  reg [4:0] REG_5; // @[fetch-target-queue.scala 251:37]
  wire [4:0] _T_63 = bpd_repair_idx + 5'h1; // @[util.scala 203:14]
  reg  REG_6; // @[fetch-target-queue.scala 256:44]
  wire  _T_76 = bpd_pc == bpd_repair_pc; // @[fetch-target-queue.scala 262:14]
  wire  _T_77 = _T_63 == bpd_end_idx | _T_76; // @[fetch-target-queue.scala 261:64]
  wire  _GEN_1315 = _T_77 ? 1'h0 : bpd_update_repair; // @[fetch-target-queue.scala 262:34 fetch-target-queue.scala 263:25 fetch-target-queue.scala 227:34]
  wire [4:0] _GEN_1316 = bpd_update_repair ? _T_63 : bpd_repair_idx; // @[fetch-target-queue.scala 259:35 fetch-target-queue.scala 260:27 fetch-target-queue.scala 228:27]
  wire  _GEN_1317 = bpd_update_repair ? _GEN_1315 : bpd_update_repair; // @[fetch-target-queue.scala 259:35 fetch-target-queue.scala 227:34]
  wire  _GEN_1320 = bpd_update_repair & REG_6 ? bpd_update_repair : _GEN_1317; // @[fetch-target-queue.scala 256:69 fetch-target-queue.scala 227:34]
  wire  _GEN_1321 = bpd_update_mispredict ? 1'h0 : bpd_update_mispredict; // @[fetch-target-queue.scala 252:39 fetch-target-queue.scala 253:27 fetch-target-queue.scala 226:38]
  wire  _GEN_1322 = bpd_update_mispredict | _GEN_1320; // @[fetch-target-queue.scala 252:39 fetch-target-queue.scala 254:27]
  wire  _GEN_1325 = REG_3 | _GEN_1321; // @[fetch-target-queue.scala 248:52 fetch-target-queue.scala 249:27]
  wire  _T_79 = ~bpd_update_repair; // @[fetch-target-queue.scala 270:31]
  wire  _T_80 = ~bpd_update_mispredict & _T_79; // @[fetch-target-queue.scala 269:54]
  wire  _T_81 = bpd_ptr != deq_ptr; // @[fetch-target-queue.scala 271:40]
  wire  _T_82 = _T_80 & _T_81; // @[fetch-target-queue.scala 270:50]
  wire [4:0] _T_84 = bpd_ptr + 5'h1; // @[util.scala 203:14]
  wire  _T_86 = enq_ptr != _T_84; // @[fetch-target-queue.scala 272:40]
  wire  _T_87 = _T_82 & _T_86; // @[fetch-target-queue.scala 271:52]
  wire  _T_88 = ~io_brupdate_b2_mispredict; // @[fetch-target-queue.scala 273:31]
  wire  _T_89 = _T_87 & _T_88; // @[fetch-target-queue.scala 272:74]
  wire  _T_90 = ~io_redirect_valid; // @[fetch-target-queue.scala 274:31]
  wire  _T_91 = _T_89 & _T_90; // @[fetch-target-queue.scala 273:58]
  reg  REG_7; // @[fetch-target-queue.scala 274:61]
  wire  do_commit_update = _T_91 & ~REG_7; // @[fetch-target-queue.scala 274:50]
  reg  REG_8; // @[fetch-target-queue.scala 278:16]
  wire  _T_95 = bpd_pc != bpd_repair_pc; // @[fetch-target-queue.scala 280:31]
  wire  _T_98 = bpd_entry_cfi_idx_valid | bpd_entry_br_mask != 4'h0; // @[fetch-target-queue.scala 283:53]
  wire  _T_99 = ~first_empty & _T_98; // @[fetch-target-queue.scala 282:41]
  reg  REG_9; // @[fetch-target-queue.scala 284:37]
  wire  _T_102 = ~(REG_9 & ~_T_95); // @[fetch-target-queue.scala 284:28]
  wire  _T_103 = _T_99 & _T_102; // @[fetch-target-queue.scala 283:83]
  reg  REG_10; // @[fetch-target-queue.scala 285:54]
  reg  REG_11; // @[fetch-target-queue.scala 286:54]
  wire [3:0] _T_104 = 4'h1 << bpd_entry_cfi_idx_bits; // @[OneHot.scala 58:35]
  wire [3:0] _T_106 = {{1'd0}, _T_104[3:1]}; // @[util.scala 373:29]
  wire [3:0] _T_107 = {{2'd0}, _T_104[3:2]}; // @[util.scala 373:29]
  wire [3:0] _T_108 = {{3'd0}, _T_104[3]}; // @[util.scala 373:29]
  wire [3:0] _T_109 = _T_104 | _T_106; // @[util.scala 373:45]
  wire [3:0] _T_110 = _T_109 | _T_107; // @[util.scala 373:45]
  wire [3:0] _T_111 = _T_110 | _T_108; // @[util.scala 373:45]
  wire [3:0] _T_112 = _T_111 & bpd_entry_br_mask; // @[fetch-target-queue.scala 290:36]
  wire [3:0] _T_114 = bpd_entry_br_mask >> bpd_entry_cfi_idx_bits; // @[fetch-target-queue.scala 295:54]
  wire  _GEN_1355 = REG_8 ? 1'h0 : first_empty; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 301:17 fetch-target-queue.scala 214:28]
  reg  REG_12; // @[fetch-target-queue.scala 308:26]
  wire  _GEN_1358 = 5'h1 == io_redirect_bits ? ram_1_start_bank : ram_0_start_bank; // @[]
  wire  _GEN_1359 = 5'h2 == io_redirect_bits ? ram_2_start_bank : _GEN_1358; // @[]
  wire  _GEN_1360 = 5'h3 == io_redirect_bits ? ram_3_start_bank : _GEN_1359; // @[]
  wire  _GEN_1361 = 5'h4 == io_redirect_bits ? ram_4_start_bank : _GEN_1360; // @[]
  wire  _GEN_1362 = 5'h5 == io_redirect_bits ? ram_5_start_bank : _GEN_1361; // @[]
  wire  _GEN_1363 = 5'h6 == io_redirect_bits ? ram_6_start_bank : _GEN_1362; // @[]
  wire  _GEN_1364 = 5'h7 == io_redirect_bits ? ram_7_start_bank : _GEN_1363; // @[]
  wire  _GEN_1365 = 5'h8 == io_redirect_bits ? ram_8_start_bank : _GEN_1364; // @[]
  wire  _GEN_1366 = 5'h9 == io_redirect_bits ? ram_9_start_bank : _GEN_1365; // @[]
  wire  _GEN_1367 = 5'ha == io_redirect_bits ? ram_10_start_bank : _GEN_1366; // @[]
  wire  _GEN_1368 = 5'hb == io_redirect_bits ? ram_11_start_bank : _GEN_1367; // @[]
  wire  _GEN_1369 = 5'hc == io_redirect_bits ? ram_12_start_bank : _GEN_1368; // @[]
  wire  _GEN_1370 = 5'hd == io_redirect_bits ? ram_13_start_bank : _GEN_1369; // @[]
  wire  _GEN_1371 = 5'he == io_redirect_bits ? ram_14_start_bank : _GEN_1370; // @[]
  wire  _GEN_1372 = 5'hf == io_redirect_bits ? ram_15_start_bank : _GEN_1371; // @[]
  wire  _GEN_1373 = 5'h10 == io_redirect_bits ? ram_16_start_bank : _GEN_1372; // @[]
  wire  _GEN_1374 = 5'h11 == io_redirect_bits ? ram_17_start_bank : _GEN_1373; // @[]
  wire  _GEN_1375 = 5'h12 == io_redirect_bits ? ram_18_start_bank : _GEN_1374; // @[]
  wire  _GEN_1376 = 5'h13 == io_redirect_bits ? ram_19_start_bank : _GEN_1375; // @[]
  wire  _GEN_1377 = 5'h14 == io_redirect_bits ? ram_20_start_bank : _GEN_1376; // @[]
  wire  _GEN_1378 = 5'h15 == io_redirect_bits ? ram_21_start_bank : _GEN_1377; // @[]
  wire  _GEN_1379 = 5'h16 == io_redirect_bits ? ram_22_start_bank : _GEN_1378; // @[]
  wire  _GEN_1380 = 5'h17 == io_redirect_bits ? ram_23_start_bank : _GEN_1379; // @[]
  wire  _GEN_1381 = 5'h18 == io_redirect_bits ? ram_24_start_bank : _GEN_1380; // @[]
  wire  _GEN_1382 = 5'h19 == io_redirect_bits ? ram_25_start_bank : _GEN_1381; // @[]
  wire  _GEN_1383 = 5'h1a == io_redirect_bits ? ram_26_start_bank : _GEN_1382; // @[]
  wire  _GEN_1384 = 5'h1b == io_redirect_bits ? ram_27_start_bank : _GEN_1383; // @[]
  wire  _GEN_1385 = 5'h1c == io_redirect_bits ? ram_28_start_bank : _GEN_1384; // @[]
  wire  _GEN_1386 = 5'h1d == io_redirect_bits ? ram_29_start_bank : _GEN_1385; // @[]
  wire  _GEN_1387 = 5'h1e == io_redirect_bits ? ram_30_start_bank : _GEN_1386; // @[]
  wire  redirect_new_entry_start_bank = 5'h1f == io_redirect_bits ? ram_31_start_bank : _GEN_1387; // @[]
  wire [4:0] _GEN_1390 = 5'h1 == io_redirect_bits ? ram_1_ras_idx : ram_0_ras_idx; // @[]
  wire [4:0] _GEN_1391 = 5'h2 == io_redirect_bits ? ram_2_ras_idx : _GEN_1390; // @[]
  wire [4:0] _GEN_1392 = 5'h3 == io_redirect_bits ? ram_3_ras_idx : _GEN_1391; // @[]
  wire [4:0] _GEN_1393 = 5'h4 == io_redirect_bits ? ram_4_ras_idx : _GEN_1392; // @[]
  wire [4:0] _GEN_1394 = 5'h5 == io_redirect_bits ? ram_5_ras_idx : _GEN_1393; // @[]
  wire [4:0] _GEN_1395 = 5'h6 == io_redirect_bits ? ram_6_ras_idx : _GEN_1394; // @[]
  wire [4:0] _GEN_1396 = 5'h7 == io_redirect_bits ? ram_7_ras_idx : _GEN_1395; // @[]
  wire [4:0] _GEN_1397 = 5'h8 == io_redirect_bits ? ram_8_ras_idx : _GEN_1396; // @[]
  wire [4:0] _GEN_1398 = 5'h9 == io_redirect_bits ? ram_9_ras_idx : _GEN_1397; // @[]
  wire [4:0] _GEN_1399 = 5'ha == io_redirect_bits ? ram_10_ras_idx : _GEN_1398; // @[]
  wire [4:0] _GEN_1400 = 5'hb == io_redirect_bits ? ram_11_ras_idx : _GEN_1399; // @[]
  wire [4:0] _GEN_1401 = 5'hc == io_redirect_bits ? ram_12_ras_idx : _GEN_1400; // @[]
  wire [4:0] _GEN_1402 = 5'hd == io_redirect_bits ? ram_13_ras_idx : _GEN_1401; // @[]
  wire [4:0] _GEN_1403 = 5'he == io_redirect_bits ? ram_14_ras_idx : _GEN_1402; // @[]
  wire [4:0] _GEN_1404 = 5'hf == io_redirect_bits ? ram_15_ras_idx : _GEN_1403; // @[]
  wire [4:0] _GEN_1405 = 5'h10 == io_redirect_bits ? ram_16_ras_idx : _GEN_1404; // @[]
  wire [4:0] _GEN_1406 = 5'h11 == io_redirect_bits ? ram_17_ras_idx : _GEN_1405; // @[]
  wire [4:0] _GEN_1407 = 5'h12 == io_redirect_bits ? ram_18_ras_idx : _GEN_1406; // @[]
  wire [4:0] _GEN_1408 = 5'h13 == io_redirect_bits ? ram_19_ras_idx : _GEN_1407; // @[]
  wire [4:0] _GEN_1409 = 5'h14 == io_redirect_bits ? ram_20_ras_idx : _GEN_1408; // @[]
  wire [4:0] _GEN_1410 = 5'h15 == io_redirect_bits ? ram_21_ras_idx : _GEN_1409; // @[]
  wire [4:0] _GEN_1411 = 5'h16 == io_redirect_bits ? ram_22_ras_idx : _GEN_1410; // @[]
  wire [4:0] _GEN_1412 = 5'h17 == io_redirect_bits ? ram_23_ras_idx : _GEN_1411; // @[]
  wire [4:0] _GEN_1413 = 5'h18 == io_redirect_bits ? ram_24_ras_idx : _GEN_1412; // @[]
  wire [4:0] _GEN_1414 = 5'h19 == io_redirect_bits ? ram_25_ras_idx : _GEN_1413; // @[]
  wire [4:0] _GEN_1415 = 5'h1a == io_redirect_bits ? ram_26_ras_idx : _GEN_1414; // @[]
  wire [4:0] _GEN_1416 = 5'h1b == io_redirect_bits ? ram_27_ras_idx : _GEN_1415; // @[]
  wire [4:0] _GEN_1417 = 5'h1c == io_redirect_bits ? ram_28_ras_idx : _GEN_1416; // @[]
  wire [39:0] _GEN_1422 = 5'h1 == io_redirect_bits ? ram_1_ras_top : ram_0_ras_top; // @[]
  wire [39:0] _GEN_1423 = 5'h2 == io_redirect_bits ? ram_2_ras_top : _GEN_1422; // @[]
  wire [39:0] _GEN_1424 = 5'h3 == io_redirect_bits ? ram_3_ras_top : _GEN_1423; // @[]
  wire [39:0] _GEN_1425 = 5'h4 == io_redirect_bits ? ram_4_ras_top : _GEN_1424; // @[]
  wire [39:0] _GEN_1426 = 5'h5 == io_redirect_bits ? ram_5_ras_top : _GEN_1425; // @[]
  wire [39:0] _GEN_1427 = 5'h6 == io_redirect_bits ? ram_6_ras_top : _GEN_1426; // @[]
  wire [39:0] _GEN_1428 = 5'h7 == io_redirect_bits ? ram_7_ras_top : _GEN_1427; // @[]
  wire [39:0] _GEN_1429 = 5'h8 == io_redirect_bits ? ram_8_ras_top : _GEN_1428; // @[]
  wire [39:0] _GEN_1430 = 5'h9 == io_redirect_bits ? ram_9_ras_top : _GEN_1429; // @[]
  wire [39:0] _GEN_1431 = 5'ha == io_redirect_bits ? ram_10_ras_top : _GEN_1430; // @[]
  wire [39:0] _GEN_1432 = 5'hb == io_redirect_bits ? ram_11_ras_top : _GEN_1431; // @[]
  wire [39:0] _GEN_1433 = 5'hc == io_redirect_bits ? ram_12_ras_top : _GEN_1432; // @[]
  wire [39:0] _GEN_1434 = 5'hd == io_redirect_bits ? ram_13_ras_top : _GEN_1433; // @[]
  wire [39:0] _GEN_1435 = 5'he == io_redirect_bits ? ram_14_ras_top : _GEN_1434; // @[]
  wire [39:0] _GEN_1436 = 5'hf == io_redirect_bits ? ram_15_ras_top : _GEN_1435; // @[]
  wire [39:0] _GEN_1437 = 5'h10 == io_redirect_bits ? ram_16_ras_top : _GEN_1436; // @[]
  wire [39:0] _GEN_1438 = 5'h11 == io_redirect_bits ? ram_17_ras_top : _GEN_1437; // @[]
  wire [39:0] _GEN_1439 = 5'h12 == io_redirect_bits ? ram_18_ras_top : _GEN_1438; // @[]
  wire [39:0] _GEN_1440 = 5'h13 == io_redirect_bits ? ram_19_ras_top : _GEN_1439; // @[]
  wire [39:0] _GEN_1441 = 5'h14 == io_redirect_bits ? ram_20_ras_top : _GEN_1440; // @[]
  wire [39:0] _GEN_1442 = 5'h15 == io_redirect_bits ? ram_21_ras_top : _GEN_1441; // @[]
  wire [39:0] _GEN_1443 = 5'h16 == io_redirect_bits ? ram_22_ras_top : _GEN_1442; // @[]
  wire [39:0] _GEN_1444 = 5'h17 == io_redirect_bits ? ram_23_ras_top : _GEN_1443; // @[]
  wire [39:0] _GEN_1445 = 5'h18 == io_redirect_bits ? ram_24_ras_top : _GEN_1444; // @[]
  wire [39:0] _GEN_1446 = 5'h19 == io_redirect_bits ? ram_25_ras_top : _GEN_1445; // @[]
  wire [39:0] _GEN_1447 = 5'h1a == io_redirect_bits ? ram_26_ras_top : _GEN_1446; // @[]
  wire [39:0] _GEN_1448 = 5'h1b == io_redirect_bits ? ram_27_ras_top : _GEN_1447; // @[]
  wire [39:0] _GEN_1449 = 5'h1c == io_redirect_bits ? ram_28_ras_top : _GEN_1448; // @[]
  wire  _GEN_1454 = 5'h1 == io_redirect_bits ? ram_1_cfi_npc_plus4 : ram_0_cfi_npc_plus4; // @[]
  wire  _GEN_1455 = 5'h2 == io_redirect_bits ? ram_2_cfi_npc_plus4 : _GEN_1454; // @[]
  wire  _GEN_1456 = 5'h3 == io_redirect_bits ? ram_3_cfi_npc_plus4 : _GEN_1455; // @[]
  wire  _GEN_1457 = 5'h4 == io_redirect_bits ? ram_4_cfi_npc_plus4 : _GEN_1456; // @[]
  wire  _GEN_1458 = 5'h5 == io_redirect_bits ? ram_5_cfi_npc_plus4 : _GEN_1457; // @[]
  wire  _GEN_1459 = 5'h6 == io_redirect_bits ? ram_6_cfi_npc_plus4 : _GEN_1458; // @[]
  wire  _GEN_1460 = 5'h7 == io_redirect_bits ? ram_7_cfi_npc_plus4 : _GEN_1459; // @[]
  wire  _GEN_1461 = 5'h8 == io_redirect_bits ? ram_8_cfi_npc_plus4 : _GEN_1460; // @[]
  wire  _GEN_1462 = 5'h9 == io_redirect_bits ? ram_9_cfi_npc_plus4 : _GEN_1461; // @[]
  wire  _GEN_1463 = 5'ha == io_redirect_bits ? ram_10_cfi_npc_plus4 : _GEN_1462; // @[]
  wire  _GEN_1464 = 5'hb == io_redirect_bits ? ram_11_cfi_npc_plus4 : _GEN_1463; // @[]
  wire  _GEN_1465 = 5'hc == io_redirect_bits ? ram_12_cfi_npc_plus4 : _GEN_1464; // @[]
  wire  _GEN_1466 = 5'hd == io_redirect_bits ? ram_13_cfi_npc_plus4 : _GEN_1465; // @[]
  wire  _GEN_1467 = 5'he == io_redirect_bits ? ram_14_cfi_npc_plus4 : _GEN_1466; // @[]
  wire  _GEN_1468 = 5'hf == io_redirect_bits ? ram_15_cfi_npc_plus4 : _GEN_1467; // @[]
  wire  _GEN_1469 = 5'h10 == io_redirect_bits ? ram_16_cfi_npc_plus4 : _GEN_1468; // @[]
  wire  _GEN_1470 = 5'h11 == io_redirect_bits ? ram_17_cfi_npc_plus4 : _GEN_1469; // @[]
  wire  _GEN_1471 = 5'h12 == io_redirect_bits ? ram_18_cfi_npc_plus4 : _GEN_1470; // @[]
  wire  _GEN_1472 = 5'h13 == io_redirect_bits ? ram_19_cfi_npc_plus4 : _GEN_1471; // @[]
  wire  _GEN_1473 = 5'h14 == io_redirect_bits ? ram_20_cfi_npc_plus4 : _GEN_1472; // @[]
  wire  _GEN_1474 = 5'h15 == io_redirect_bits ? ram_21_cfi_npc_plus4 : _GEN_1473; // @[]
  wire  _GEN_1475 = 5'h16 == io_redirect_bits ? ram_22_cfi_npc_plus4 : _GEN_1474; // @[]
  wire  _GEN_1476 = 5'h17 == io_redirect_bits ? ram_23_cfi_npc_plus4 : _GEN_1475; // @[]
  wire  _GEN_1477 = 5'h18 == io_redirect_bits ? ram_24_cfi_npc_plus4 : _GEN_1476; // @[]
  wire  _GEN_1478 = 5'h19 == io_redirect_bits ? ram_25_cfi_npc_plus4 : _GEN_1477; // @[]
  wire  _GEN_1479 = 5'h1a == io_redirect_bits ? ram_26_cfi_npc_plus4 : _GEN_1478; // @[]
  wire  _GEN_1480 = 5'h1b == io_redirect_bits ? ram_27_cfi_npc_plus4 : _GEN_1479; // @[]
  wire  _GEN_1486 = 5'h1 == io_redirect_bits ? ram_1_cfi_is_ret : ram_0_cfi_is_ret; // @[]
  wire  _GEN_1487 = 5'h2 == io_redirect_bits ? ram_2_cfi_is_ret : _GEN_1486; // @[]
  wire  _GEN_1488 = 5'h3 == io_redirect_bits ? ram_3_cfi_is_ret : _GEN_1487; // @[]
  wire  _GEN_1489 = 5'h4 == io_redirect_bits ? ram_4_cfi_is_ret : _GEN_1488; // @[]
  wire  _GEN_1490 = 5'h5 == io_redirect_bits ? ram_5_cfi_is_ret : _GEN_1489; // @[]
  wire  _GEN_1491 = 5'h6 == io_redirect_bits ? ram_6_cfi_is_ret : _GEN_1490; // @[]
  wire  _GEN_1492 = 5'h7 == io_redirect_bits ? ram_7_cfi_is_ret : _GEN_1491; // @[]
  wire  _GEN_1493 = 5'h8 == io_redirect_bits ? ram_8_cfi_is_ret : _GEN_1492; // @[]
  wire  _GEN_1494 = 5'h9 == io_redirect_bits ? ram_9_cfi_is_ret : _GEN_1493; // @[]
  wire  _GEN_1495 = 5'ha == io_redirect_bits ? ram_10_cfi_is_ret : _GEN_1494; // @[]
  wire  _GEN_1496 = 5'hb == io_redirect_bits ? ram_11_cfi_is_ret : _GEN_1495; // @[]
  wire  _GEN_1497 = 5'hc == io_redirect_bits ? ram_12_cfi_is_ret : _GEN_1496; // @[]
  wire  _GEN_1498 = 5'hd == io_redirect_bits ? ram_13_cfi_is_ret : _GEN_1497; // @[]
  wire  _GEN_1499 = 5'he == io_redirect_bits ? ram_14_cfi_is_ret : _GEN_1498; // @[]
  wire  _GEN_1500 = 5'hf == io_redirect_bits ? ram_15_cfi_is_ret : _GEN_1499; // @[]
  wire  _GEN_1501 = 5'h10 == io_redirect_bits ? ram_16_cfi_is_ret : _GEN_1500; // @[]
  wire  _GEN_1502 = 5'h11 == io_redirect_bits ? ram_17_cfi_is_ret : _GEN_1501; // @[]
  wire  _GEN_1503 = 5'h12 == io_redirect_bits ? ram_18_cfi_is_ret : _GEN_1502; // @[]
  wire  _GEN_1504 = 5'h13 == io_redirect_bits ? ram_19_cfi_is_ret : _GEN_1503; // @[]
  wire  _GEN_1505 = 5'h14 == io_redirect_bits ? ram_20_cfi_is_ret : _GEN_1504; // @[]
  wire  _GEN_1506 = 5'h15 == io_redirect_bits ? ram_21_cfi_is_ret : _GEN_1505; // @[]
  wire  _GEN_1507 = 5'h16 == io_redirect_bits ? ram_22_cfi_is_ret : _GEN_1506; // @[]
  wire  _GEN_1508 = 5'h17 == io_redirect_bits ? ram_23_cfi_is_ret : _GEN_1507; // @[]
  wire  _GEN_1509 = 5'h18 == io_redirect_bits ? ram_24_cfi_is_ret : _GEN_1508; // @[]
  wire  _GEN_1510 = 5'h19 == io_redirect_bits ? ram_25_cfi_is_ret : _GEN_1509; // @[]
  wire  _GEN_1511 = 5'h1a == io_redirect_bits ? ram_26_cfi_is_ret : _GEN_1510; // @[]
  wire  _GEN_1512 = 5'h1b == io_redirect_bits ? ram_27_cfi_is_ret : _GEN_1511; // @[]
  wire  _GEN_1513 = 5'h1c == io_redirect_bits ? ram_28_cfi_is_ret : _GEN_1512; // @[]
  wire  _GEN_1514 = 5'h1d == io_redirect_bits ? ram_29_cfi_is_ret : _GEN_1513; // @[]
  wire  _GEN_1515 = 5'h1e == io_redirect_bits ? ram_30_cfi_is_ret : _GEN_1514; // @[]
  wire  _GEN_1516 = 5'h1f == io_redirect_bits ? ram_31_cfi_is_ret : _GEN_1515; // @[]
  wire  _GEN_1518 = 5'h1 == io_redirect_bits ? ram_1_cfi_is_call : ram_0_cfi_is_call; // @[]
  wire  _GEN_1519 = 5'h2 == io_redirect_bits ? ram_2_cfi_is_call : _GEN_1518; // @[]
  wire  _GEN_1520 = 5'h3 == io_redirect_bits ? ram_3_cfi_is_call : _GEN_1519; // @[]
  wire  _GEN_1521 = 5'h4 == io_redirect_bits ? ram_4_cfi_is_call : _GEN_1520; // @[]
  wire  _GEN_1522 = 5'h5 == io_redirect_bits ? ram_5_cfi_is_call : _GEN_1521; // @[]
  wire  _GEN_1523 = 5'h6 == io_redirect_bits ? ram_6_cfi_is_call : _GEN_1522; // @[]
  wire  _GEN_1524 = 5'h7 == io_redirect_bits ? ram_7_cfi_is_call : _GEN_1523; // @[]
  wire  _GEN_1525 = 5'h8 == io_redirect_bits ? ram_8_cfi_is_call : _GEN_1524; // @[]
  wire  _GEN_1526 = 5'h9 == io_redirect_bits ? ram_9_cfi_is_call : _GEN_1525; // @[]
  wire  _GEN_1527 = 5'ha == io_redirect_bits ? ram_10_cfi_is_call : _GEN_1526; // @[]
  wire  _GEN_1528 = 5'hb == io_redirect_bits ? ram_11_cfi_is_call : _GEN_1527; // @[]
  wire  _GEN_1529 = 5'hc == io_redirect_bits ? ram_12_cfi_is_call : _GEN_1528; // @[]
  wire  _GEN_1530 = 5'hd == io_redirect_bits ? ram_13_cfi_is_call : _GEN_1529; // @[]
  wire  _GEN_1531 = 5'he == io_redirect_bits ? ram_14_cfi_is_call : _GEN_1530; // @[]
  wire  _GEN_1532 = 5'hf == io_redirect_bits ? ram_15_cfi_is_call : _GEN_1531; // @[]
  wire  _GEN_1533 = 5'h10 == io_redirect_bits ? ram_16_cfi_is_call : _GEN_1532; // @[]
  wire  _GEN_1534 = 5'h11 == io_redirect_bits ? ram_17_cfi_is_call : _GEN_1533; // @[]
  wire  _GEN_1535 = 5'h12 == io_redirect_bits ? ram_18_cfi_is_call : _GEN_1534; // @[]
  wire  _GEN_1536 = 5'h13 == io_redirect_bits ? ram_19_cfi_is_call : _GEN_1535; // @[]
  wire  _GEN_1537 = 5'h14 == io_redirect_bits ? ram_20_cfi_is_call : _GEN_1536; // @[]
  wire  _GEN_1538 = 5'h15 == io_redirect_bits ? ram_21_cfi_is_call : _GEN_1537; // @[]
  wire  _GEN_1539 = 5'h16 == io_redirect_bits ? ram_22_cfi_is_call : _GEN_1538; // @[]
  wire  _GEN_1540 = 5'h17 == io_redirect_bits ? ram_23_cfi_is_call : _GEN_1539; // @[]
  wire  _GEN_1541 = 5'h18 == io_redirect_bits ? ram_24_cfi_is_call : _GEN_1540; // @[]
  wire  _GEN_1542 = 5'h19 == io_redirect_bits ? ram_25_cfi_is_call : _GEN_1541; // @[]
  wire  _GEN_1543 = 5'h1a == io_redirect_bits ? ram_26_cfi_is_call : _GEN_1542; // @[]
  wire  _GEN_1544 = 5'h1b == io_redirect_bits ? ram_27_cfi_is_call : _GEN_1543; // @[]
  wire  _GEN_1545 = 5'h1c == io_redirect_bits ? ram_28_cfi_is_call : _GEN_1544; // @[]
  wire  _GEN_1546 = 5'h1d == io_redirect_bits ? ram_29_cfi_is_call : _GEN_1545; // @[]
  wire  _GEN_1547 = 5'h1e == io_redirect_bits ? ram_30_cfi_is_call : _GEN_1546; // @[]
  wire  _GEN_1548 = 5'h1f == io_redirect_bits ? ram_31_cfi_is_call : _GEN_1547; // @[]
  wire [3:0] _GEN_1550 = 5'h1 == io_redirect_bits ? ram_1_br_mask : ram_0_br_mask; // @[]
  wire [3:0] _GEN_1551 = 5'h2 == io_redirect_bits ? ram_2_br_mask : _GEN_1550; // @[]
  wire [3:0] _GEN_1552 = 5'h3 == io_redirect_bits ? ram_3_br_mask : _GEN_1551; // @[]
  wire [3:0] _GEN_1553 = 5'h4 == io_redirect_bits ? ram_4_br_mask : _GEN_1552; // @[]
  wire [3:0] _GEN_1554 = 5'h5 == io_redirect_bits ? ram_5_br_mask : _GEN_1553; // @[]
  wire [3:0] _GEN_1555 = 5'h6 == io_redirect_bits ? ram_6_br_mask : _GEN_1554; // @[]
  wire [3:0] _GEN_1556 = 5'h7 == io_redirect_bits ? ram_7_br_mask : _GEN_1555; // @[]
  wire [3:0] _GEN_1557 = 5'h8 == io_redirect_bits ? ram_8_br_mask : _GEN_1556; // @[]
  wire [3:0] _GEN_1558 = 5'h9 == io_redirect_bits ? ram_9_br_mask : _GEN_1557; // @[]
  wire [3:0] _GEN_1559 = 5'ha == io_redirect_bits ? ram_10_br_mask : _GEN_1558; // @[]
  wire [3:0] _GEN_1560 = 5'hb == io_redirect_bits ? ram_11_br_mask : _GEN_1559; // @[]
  wire [3:0] _GEN_1561 = 5'hc == io_redirect_bits ? ram_12_br_mask : _GEN_1560; // @[]
  wire [3:0] _GEN_1562 = 5'hd == io_redirect_bits ? ram_13_br_mask : _GEN_1561; // @[]
  wire [3:0] _GEN_1563 = 5'he == io_redirect_bits ? ram_14_br_mask : _GEN_1562; // @[]
  wire [3:0] _GEN_1564 = 5'hf == io_redirect_bits ? ram_15_br_mask : _GEN_1563; // @[]
  wire [3:0] _GEN_1565 = 5'h10 == io_redirect_bits ? ram_16_br_mask : _GEN_1564; // @[]
  wire [3:0] _GEN_1566 = 5'h11 == io_redirect_bits ? ram_17_br_mask : _GEN_1565; // @[]
  wire [3:0] _GEN_1567 = 5'h12 == io_redirect_bits ? ram_18_br_mask : _GEN_1566; // @[]
  wire [3:0] _GEN_1568 = 5'h13 == io_redirect_bits ? ram_19_br_mask : _GEN_1567; // @[]
  wire [3:0] _GEN_1569 = 5'h14 == io_redirect_bits ? ram_20_br_mask : _GEN_1568; // @[]
  wire [3:0] _GEN_1570 = 5'h15 == io_redirect_bits ? ram_21_br_mask : _GEN_1569; // @[]
  wire [3:0] _GEN_1571 = 5'h16 == io_redirect_bits ? ram_22_br_mask : _GEN_1570; // @[]
  wire [3:0] _GEN_1572 = 5'h17 == io_redirect_bits ? ram_23_br_mask : _GEN_1571; // @[]
  wire [3:0] _GEN_1573 = 5'h18 == io_redirect_bits ? ram_24_br_mask : _GEN_1572; // @[]
  wire [3:0] _GEN_1574 = 5'h19 == io_redirect_bits ? ram_25_br_mask : _GEN_1573; // @[]
  wire [3:0] _GEN_1575 = 5'h1a == io_redirect_bits ? ram_26_br_mask : _GEN_1574; // @[]
  wire [3:0] _GEN_1576 = 5'h1b == io_redirect_bits ? ram_27_br_mask : _GEN_1575; // @[]
  wire [2:0] _GEN_1582 = 5'h1 == io_redirect_bits ? ram_1_cfi_type : ram_0_cfi_type; // @[]
  wire [2:0] _GEN_1583 = 5'h2 == io_redirect_bits ? ram_2_cfi_type : _GEN_1582; // @[]
  wire [2:0] _GEN_1584 = 5'h3 == io_redirect_bits ? ram_3_cfi_type : _GEN_1583; // @[]
  wire [2:0] _GEN_1585 = 5'h4 == io_redirect_bits ? ram_4_cfi_type : _GEN_1584; // @[]
  wire [2:0] _GEN_1586 = 5'h5 == io_redirect_bits ? ram_5_cfi_type : _GEN_1585; // @[]
  wire [2:0] _GEN_1587 = 5'h6 == io_redirect_bits ? ram_6_cfi_type : _GEN_1586; // @[]
  wire [2:0] _GEN_1588 = 5'h7 == io_redirect_bits ? ram_7_cfi_type : _GEN_1587; // @[]
  wire [2:0] _GEN_1589 = 5'h8 == io_redirect_bits ? ram_8_cfi_type : _GEN_1588; // @[]
  wire [2:0] _GEN_1590 = 5'h9 == io_redirect_bits ? ram_9_cfi_type : _GEN_1589; // @[]
  wire [2:0] _GEN_1591 = 5'ha == io_redirect_bits ? ram_10_cfi_type : _GEN_1590; // @[]
  wire [2:0] _GEN_1592 = 5'hb == io_redirect_bits ? ram_11_cfi_type : _GEN_1591; // @[]
  wire [2:0] _GEN_1593 = 5'hc == io_redirect_bits ? ram_12_cfi_type : _GEN_1592; // @[]
  wire [2:0] _GEN_1594 = 5'hd == io_redirect_bits ? ram_13_cfi_type : _GEN_1593; // @[]
  wire [2:0] _GEN_1595 = 5'he == io_redirect_bits ? ram_14_cfi_type : _GEN_1594; // @[]
  wire [2:0] _GEN_1596 = 5'hf == io_redirect_bits ? ram_15_cfi_type : _GEN_1595; // @[]
  wire [2:0] _GEN_1597 = 5'h10 == io_redirect_bits ? ram_16_cfi_type : _GEN_1596; // @[]
  wire [2:0] _GEN_1598 = 5'h11 == io_redirect_bits ? ram_17_cfi_type : _GEN_1597; // @[]
  wire [2:0] _GEN_1599 = 5'h12 == io_redirect_bits ? ram_18_cfi_type : _GEN_1598; // @[]
  wire [2:0] _GEN_1600 = 5'h13 == io_redirect_bits ? ram_19_cfi_type : _GEN_1599; // @[]
  wire [2:0] _GEN_1601 = 5'h14 == io_redirect_bits ? ram_20_cfi_type : _GEN_1600; // @[]
  wire [2:0] _GEN_1602 = 5'h15 == io_redirect_bits ? ram_21_cfi_type : _GEN_1601; // @[]
  wire [2:0] _GEN_1603 = 5'h16 == io_redirect_bits ? ram_22_cfi_type : _GEN_1602; // @[]
  wire [2:0] _GEN_1604 = 5'h17 == io_redirect_bits ? ram_23_cfi_type : _GEN_1603; // @[]
  wire [2:0] _GEN_1605 = 5'h18 == io_redirect_bits ? ram_24_cfi_type : _GEN_1604; // @[]
  wire [2:0] _GEN_1606 = 5'h19 == io_redirect_bits ? ram_25_cfi_type : _GEN_1605; // @[]
  wire [2:0] _GEN_1607 = 5'h1a == io_redirect_bits ? ram_26_cfi_type : _GEN_1606; // @[]
  wire [2:0] _GEN_1608 = 5'h1b == io_redirect_bits ? ram_27_cfi_type : _GEN_1607; // @[]
  wire  _GEN_1614 = 5'h1 == io_redirect_bits ? ram_1_cfi_mispredicted : ram_0_cfi_mispredicted; // @[]
  wire  _GEN_1615 = 5'h2 == io_redirect_bits ? ram_2_cfi_mispredicted : _GEN_1614; // @[]
  wire  _GEN_1616 = 5'h3 == io_redirect_bits ? ram_3_cfi_mispredicted : _GEN_1615; // @[]
  wire  _GEN_1617 = 5'h4 == io_redirect_bits ? ram_4_cfi_mispredicted : _GEN_1616; // @[]
  wire  _GEN_1618 = 5'h5 == io_redirect_bits ? ram_5_cfi_mispredicted : _GEN_1617; // @[]
  wire  _GEN_1619 = 5'h6 == io_redirect_bits ? ram_6_cfi_mispredicted : _GEN_1618; // @[]
  wire  _GEN_1620 = 5'h7 == io_redirect_bits ? ram_7_cfi_mispredicted : _GEN_1619; // @[]
  wire  _GEN_1621 = 5'h8 == io_redirect_bits ? ram_8_cfi_mispredicted : _GEN_1620; // @[]
  wire  _GEN_1622 = 5'h9 == io_redirect_bits ? ram_9_cfi_mispredicted : _GEN_1621; // @[]
  wire  _GEN_1623 = 5'ha == io_redirect_bits ? ram_10_cfi_mispredicted : _GEN_1622; // @[]
  wire  _GEN_1624 = 5'hb == io_redirect_bits ? ram_11_cfi_mispredicted : _GEN_1623; // @[]
  wire  _GEN_1625 = 5'hc == io_redirect_bits ? ram_12_cfi_mispredicted : _GEN_1624; // @[]
  wire  _GEN_1626 = 5'hd == io_redirect_bits ? ram_13_cfi_mispredicted : _GEN_1625; // @[]
  wire  _GEN_1627 = 5'he == io_redirect_bits ? ram_14_cfi_mispredicted : _GEN_1626; // @[]
  wire  _GEN_1628 = 5'hf == io_redirect_bits ? ram_15_cfi_mispredicted : _GEN_1627; // @[]
  wire  _GEN_1629 = 5'h10 == io_redirect_bits ? ram_16_cfi_mispredicted : _GEN_1628; // @[]
  wire  _GEN_1630 = 5'h11 == io_redirect_bits ? ram_17_cfi_mispredicted : _GEN_1629; // @[]
  wire  _GEN_1631 = 5'h12 == io_redirect_bits ? ram_18_cfi_mispredicted : _GEN_1630; // @[]
  wire  _GEN_1632 = 5'h13 == io_redirect_bits ? ram_19_cfi_mispredicted : _GEN_1631; // @[]
  wire  _GEN_1633 = 5'h14 == io_redirect_bits ? ram_20_cfi_mispredicted : _GEN_1632; // @[]
  wire  _GEN_1634 = 5'h15 == io_redirect_bits ? ram_21_cfi_mispredicted : _GEN_1633; // @[]
  wire  _GEN_1635 = 5'h16 == io_redirect_bits ? ram_22_cfi_mispredicted : _GEN_1634; // @[]
  wire  _GEN_1636 = 5'h17 == io_redirect_bits ? ram_23_cfi_mispredicted : _GEN_1635; // @[]
  wire  _GEN_1637 = 5'h18 == io_redirect_bits ? ram_24_cfi_mispredicted : _GEN_1636; // @[]
  wire  _GEN_1638 = 5'h19 == io_redirect_bits ? ram_25_cfi_mispredicted : _GEN_1637; // @[]
  wire  _GEN_1639 = 5'h1a == io_redirect_bits ? ram_26_cfi_mispredicted : _GEN_1638; // @[]
  wire  _GEN_1640 = 5'h1b == io_redirect_bits ? ram_27_cfi_mispredicted : _GEN_1639; // @[]
  wire  _GEN_1641 = 5'h1c == io_redirect_bits ? ram_28_cfi_mispredicted : _GEN_1640; // @[]
  wire  _GEN_1642 = 5'h1d == io_redirect_bits ? ram_29_cfi_mispredicted : _GEN_1641; // @[]
  wire  _GEN_1643 = 5'h1e == io_redirect_bits ? ram_30_cfi_mispredicted : _GEN_1642; // @[]
  wire  _GEN_1644 = 5'h1f == io_redirect_bits ? ram_31_cfi_mispredicted : _GEN_1643; // @[]
  wire  _GEN_1646 = 5'h1 == io_redirect_bits ? ram_1_cfi_taken : ram_0_cfi_taken; // @[]
  wire  _GEN_1647 = 5'h2 == io_redirect_bits ? ram_2_cfi_taken : _GEN_1646; // @[]
  wire  _GEN_1648 = 5'h3 == io_redirect_bits ? ram_3_cfi_taken : _GEN_1647; // @[]
  wire  _GEN_1649 = 5'h4 == io_redirect_bits ? ram_4_cfi_taken : _GEN_1648; // @[]
  wire  _GEN_1650 = 5'h5 == io_redirect_bits ? ram_5_cfi_taken : _GEN_1649; // @[]
  wire  _GEN_1651 = 5'h6 == io_redirect_bits ? ram_6_cfi_taken : _GEN_1650; // @[]
  wire  _GEN_1652 = 5'h7 == io_redirect_bits ? ram_7_cfi_taken : _GEN_1651; // @[]
  wire  _GEN_1653 = 5'h8 == io_redirect_bits ? ram_8_cfi_taken : _GEN_1652; // @[]
  wire  _GEN_1654 = 5'h9 == io_redirect_bits ? ram_9_cfi_taken : _GEN_1653; // @[]
  wire  _GEN_1655 = 5'ha == io_redirect_bits ? ram_10_cfi_taken : _GEN_1654; // @[]
  wire  _GEN_1656 = 5'hb == io_redirect_bits ? ram_11_cfi_taken : _GEN_1655; // @[]
  wire  _GEN_1657 = 5'hc == io_redirect_bits ? ram_12_cfi_taken : _GEN_1656; // @[]
  wire  _GEN_1658 = 5'hd == io_redirect_bits ? ram_13_cfi_taken : _GEN_1657; // @[]
  wire  _GEN_1659 = 5'he == io_redirect_bits ? ram_14_cfi_taken : _GEN_1658; // @[]
  wire  _GEN_1660 = 5'hf == io_redirect_bits ? ram_15_cfi_taken : _GEN_1659; // @[]
  wire  _GEN_1661 = 5'h10 == io_redirect_bits ? ram_16_cfi_taken : _GEN_1660; // @[]
  wire  _GEN_1662 = 5'h11 == io_redirect_bits ? ram_17_cfi_taken : _GEN_1661; // @[]
  wire  _GEN_1663 = 5'h12 == io_redirect_bits ? ram_18_cfi_taken : _GEN_1662; // @[]
  wire  _GEN_1664 = 5'h13 == io_redirect_bits ? ram_19_cfi_taken : _GEN_1663; // @[]
  wire  _GEN_1665 = 5'h14 == io_redirect_bits ? ram_20_cfi_taken : _GEN_1664; // @[]
  wire  _GEN_1666 = 5'h15 == io_redirect_bits ? ram_21_cfi_taken : _GEN_1665; // @[]
  wire  _GEN_1667 = 5'h16 == io_redirect_bits ? ram_22_cfi_taken : _GEN_1666; // @[]
  wire  _GEN_1668 = 5'h17 == io_redirect_bits ? ram_23_cfi_taken : _GEN_1667; // @[]
  wire  _GEN_1669 = 5'h18 == io_redirect_bits ? ram_24_cfi_taken : _GEN_1668; // @[]
  wire  _GEN_1670 = 5'h19 == io_redirect_bits ? ram_25_cfi_taken : _GEN_1669; // @[]
  wire  _GEN_1671 = 5'h1a == io_redirect_bits ? ram_26_cfi_taken : _GEN_1670; // @[]
  wire  _GEN_1672 = 5'h1b == io_redirect_bits ? ram_27_cfi_taken : _GEN_1671; // @[]
  wire  _GEN_1673 = 5'h1c == io_redirect_bits ? ram_28_cfi_taken : _GEN_1672; // @[]
  wire  _GEN_1674 = 5'h1d == io_redirect_bits ? ram_29_cfi_taken : _GEN_1673; // @[]
  wire  _GEN_1675 = 5'h1e == io_redirect_bits ? ram_30_cfi_taken : _GEN_1674; // @[]
  wire  _GEN_1676 = 5'h1f == io_redirect_bits ? ram_31_cfi_taken : _GEN_1675; // @[]
  wire [1:0] _GEN_1678 = 5'h1 == io_redirect_bits ? ram_1_cfi_idx_bits : ram_0_cfi_idx_bits; // @[]
  wire [1:0] _GEN_1679 = 5'h2 == io_redirect_bits ? ram_2_cfi_idx_bits : _GEN_1678; // @[]
  wire [1:0] _GEN_1680 = 5'h3 == io_redirect_bits ? ram_3_cfi_idx_bits : _GEN_1679; // @[]
  wire [1:0] _GEN_1681 = 5'h4 == io_redirect_bits ? ram_4_cfi_idx_bits : _GEN_1680; // @[]
  wire [1:0] _GEN_1682 = 5'h5 == io_redirect_bits ? ram_5_cfi_idx_bits : _GEN_1681; // @[]
  wire [1:0] _GEN_1683 = 5'h6 == io_redirect_bits ? ram_6_cfi_idx_bits : _GEN_1682; // @[]
  wire [1:0] _GEN_1684 = 5'h7 == io_redirect_bits ? ram_7_cfi_idx_bits : _GEN_1683; // @[]
  wire [1:0] _GEN_1685 = 5'h8 == io_redirect_bits ? ram_8_cfi_idx_bits : _GEN_1684; // @[]
  wire [1:0] _GEN_1686 = 5'h9 == io_redirect_bits ? ram_9_cfi_idx_bits : _GEN_1685; // @[]
  wire [1:0] _GEN_1687 = 5'ha == io_redirect_bits ? ram_10_cfi_idx_bits : _GEN_1686; // @[]
  wire [1:0] _GEN_1688 = 5'hb == io_redirect_bits ? ram_11_cfi_idx_bits : _GEN_1687; // @[]
  wire [1:0] _GEN_1689 = 5'hc == io_redirect_bits ? ram_12_cfi_idx_bits : _GEN_1688; // @[]
  wire [1:0] _GEN_1690 = 5'hd == io_redirect_bits ? ram_13_cfi_idx_bits : _GEN_1689; // @[]
  wire [1:0] _GEN_1691 = 5'he == io_redirect_bits ? ram_14_cfi_idx_bits : _GEN_1690; // @[]
  wire [1:0] _GEN_1692 = 5'hf == io_redirect_bits ? ram_15_cfi_idx_bits : _GEN_1691; // @[]
  wire [1:0] _GEN_1693 = 5'h10 == io_redirect_bits ? ram_16_cfi_idx_bits : _GEN_1692; // @[]
  wire [1:0] _GEN_1694 = 5'h11 == io_redirect_bits ? ram_17_cfi_idx_bits : _GEN_1693; // @[]
  wire [1:0] _GEN_1695 = 5'h12 == io_redirect_bits ? ram_18_cfi_idx_bits : _GEN_1694; // @[]
  wire [1:0] _GEN_1696 = 5'h13 == io_redirect_bits ? ram_19_cfi_idx_bits : _GEN_1695; // @[]
  wire [1:0] _GEN_1697 = 5'h14 == io_redirect_bits ? ram_20_cfi_idx_bits : _GEN_1696; // @[]
  wire [1:0] _GEN_1698 = 5'h15 == io_redirect_bits ? ram_21_cfi_idx_bits : _GEN_1697; // @[]
  wire [1:0] _GEN_1699 = 5'h16 == io_redirect_bits ? ram_22_cfi_idx_bits : _GEN_1698; // @[]
  wire [1:0] _GEN_1700 = 5'h17 == io_redirect_bits ? ram_23_cfi_idx_bits : _GEN_1699; // @[]
  wire [1:0] _GEN_1701 = 5'h18 == io_redirect_bits ? ram_24_cfi_idx_bits : _GEN_1700; // @[]
  wire [1:0] _GEN_1702 = 5'h19 == io_redirect_bits ? ram_25_cfi_idx_bits : _GEN_1701; // @[]
  wire [1:0] _GEN_1703 = 5'h1a == io_redirect_bits ? ram_26_cfi_idx_bits : _GEN_1702; // @[]
  wire [1:0] _GEN_1704 = 5'h1b == io_redirect_bits ? ram_27_cfi_idx_bits : _GEN_1703; // @[]
  wire [1:0] _GEN_1705 = 5'h1c == io_redirect_bits ? ram_28_cfi_idx_bits : _GEN_1704; // @[]
  wire [1:0] _GEN_1706 = 5'h1d == io_redirect_bits ? ram_29_cfi_idx_bits : _GEN_1705; // @[]
  wire [1:0] _GEN_1707 = 5'h1e == io_redirect_bits ? ram_30_cfi_idx_bits : _GEN_1706; // @[]
  wire [1:0] _GEN_1708 = 5'h1f == io_redirect_bits ? ram_31_cfi_idx_bits : _GEN_1707; // @[]
  wire  _GEN_1710 = 5'h1 == io_redirect_bits ? ram_1_cfi_idx_valid : ram_0_cfi_idx_valid; // @[]
  wire  _GEN_1711 = 5'h2 == io_redirect_bits ? ram_2_cfi_idx_valid : _GEN_1710; // @[]
  wire  _GEN_1712 = 5'h3 == io_redirect_bits ? ram_3_cfi_idx_valid : _GEN_1711; // @[]
  wire  _GEN_1713 = 5'h4 == io_redirect_bits ? ram_4_cfi_idx_valid : _GEN_1712; // @[]
  wire  _GEN_1714 = 5'h5 == io_redirect_bits ? ram_5_cfi_idx_valid : _GEN_1713; // @[]
  wire  _GEN_1715 = 5'h6 == io_redirect_bits ? ram_6_cfi_idx_valid : _GEN_1714; // @[]
  wire  _GEN_1716 = 5'h7 == io_redirect_bits ? ram_7_cfi_idx_valid : _GEN_1715; // @[]
  wire  _GEN_1717 = 5'h8 == io_redirect_bits ? ram_8_cfi_idx_valid : _GEN_1716; // @[]
  wire  _GEN_1718 = 5'h9 == io_redirect_bits ? ram_9_cfi_idx_valid : _GEN_1717; // @[]
  wire  _GEN_1719 = 5'ha == io_redirect_bits ? ram_10_cfi_idx_valid : _GEN_1718; // @[]
  wire  _GEN_1720 = 5'hb == io_redirect_bits ? ram_11_cfi_idx_valid : _GEN_1719; // @[]
  wire  _GEN_1721 = 5'hc == io_redirect_bits ? ram_12_cfi_idx_valid : _GEN_1720; // @[]
  wire  _GEN_1722 = 5'hd == io_redirect_bits ? ram_13_cfi_idx_valid : _GEN_1721; // @[]
  wire  _GEN_1723 = 5'he == io_redirect_bits ? ram_14_cfi_idx_valid : _GEN_1722; // @[]
  wire  _GEN_1724 = 5'hf == io_redirect_bits ? ram_15_cfi_idx_valid : _GEN_1723; // @[]
  wire  _GEN_1725 = 5'h10 == io_redirect_bits ? ram_16_cfi_idx_valid : _GEN_1724; // @[]
  wire  _GEN_1726 = 5'h11 == io_redirect_bits ? ram_17_cfi_idx_valid : _GEN_1725; // @[]
  wire  _GEN_1727 = 5'h12 == io_redirect_bits ? ram_18_cfi_idx_valid : _GEN_1726; // @[]
  wire  _GEN_1728 = 5'h13 == io_redirect_bits ? ram_19_cfi_idx_valid : _GEN_1727; // @[]
  wire  _GEN_1729 = 5'h14 == io_redirect_bits ? ram_20_cfi_idx_valid : _GEN_1728; // @[]
  wire  _GEN_1730 = 5'h15 == io_redirect_bits ? ram_21_cfi_idx_valid : _GEN_1729; // @[]
  wire  _GEN_1731 = 5'h16 == io_redirect_bits ? ram_22_cfi_idx_valid : _GEN_1730; // @[]
  wire  _GEN_1732 = 5'h17 == io_redirect_bits ? ram_23_cfi_idx_valid : _GEN_1731; // @[]
  wire  _GEN_1733 = 5'h18 == io_redirect_bits ? ram_24_cfi_idx_valid : _GEN_1732; // @[]
  wire  _GEN_1734 = 5'h19 == io_redirect_bits ? ram_25_cfi_idx_valid : _GEN_1733; // @[]
  wire  _GEN_1735 = 5'h1a == io_redirect_bits ? ram_26_cfi_idx_valid : _GEN_1734; // @[]
  wire  _GEN_1736 = 5'h1b == io_redirect_bits ? ram_27_cfi_idx_valid : _GEN_1735; // @[]
  wire  _GEN_1737 = 5'h1c == io_redirect_bits ? ram_28_cfi_idx_valid : _GEN_1736; // @[]
  wire  _GEN_1738 = 5'h1d == io_redirect_bits ? ram_29_cfi_idx_valid : _GEN_1737; // @[]
  wire  _GEN_1739 = 5'h1e == io_redirect_bits ? ram_30_cfi_idx_valid : _GEN_1738; // @[]
  wire  _GEN_1740 = 5'h1f == io_redirect_bits ? ram_31_cfi_idx_valid : _GEN_1739; // @[]
  wire [4:0] _T_125 = io_redirect_bits + 5'h1; // @[util.scala 203:14]
  wire [3:0] _T_129 = redirect_new_entry_start_bank ? 4'h8 : 4'h0; // @[fetch-target-queue.scala 319:10]
  wire [5:0] _GEN_3977 = {{2'd0}, _T_129}; // @[fetch-target-queue.scala 318:50]
  wire [5:0] _T_130 = io_brupdate_b2_uop_pc_lob ^ _GEN_3977; // @[fetch-target-queue.scala 318:50]
  wire  _T_132 = _GEN_1708 == _T_130[2:1]; // @[fetch-target-queue.scala 324:104]
  wire  _GEN_1741 = io_brupdate_b2_mispredict | _GEN_1740; // @[fetch-target-queue.scala 317:38 fetch-target-queue.scala 320:43]
  wire  _GEN_1743 = io_brupdate_b2_mispredict | _GEN_1644; // @[fetch-target-queue.scala 317:38 fetch-target-queue.scala 322:43]
  reg  REG_13; // @[fetch-target-queue.scala 332:23]
  reg  REG_14_cfi_idx_valid; // @[fetch-target-queue.scala 333:26]
  reg [1:0] REG_14_cfi_idx_bits; // @[fetch-target-queue.scala 333:26]
  reg  REG_14_cfi_taken; // @[fetch-target-queue.scala 333:26]
  reg [3:0] REG_14_br_mask; // @[fetch-target-queue.scala 333:26]
  reg  REG_14_cfi_is_call; // @[fetch-target-queue.scala 333:26]
  reg  REG_14_cfi_is_ret; // @[fetch-target-queue.scala 333:26]
  reg [4:0] REG_15; // @[fetch-target-queue.scala 337:16]
  reg  REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:46]
  reg [1:0] REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:46]
  reg  REG_16_cfi_taken; // @[fetch-target-queue.scala 337:46]
  reg  REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:46]
  reg [2:0] REG_16_cfi_type; // @[fetch-target-queue.scala 337:46]
  reg [3:0] REG_16_br_mask; // @[fetch-target-queue.scala 337:46]
  reg  REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:46]
  reg  REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:46]
  reg  REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:46]
  reg [39:0] REG_16_ras_top; // @[fetch-target-queue.scala 337:46]
  reg [4:0] REG_16_ras_idx; // @[fetch-target-queue.scala 337:46]
  reg  REG_16_start_bank; // @[fetch-target-queue.scala 337:46]
  wire [4:0] _T_139 = io_get_ftq_pc_0_ftq_idx + 5'h1; // @[util.scala 203:14]
  wire  _T_143 = _T_139 == enq_ptr & do_enq; // @[fetch-target-queue.scala 347:46]
  wire [39:0] _GEN_2946 = 5'h1 == _T_139 ? pcs_1 : pcs_0; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2947 = 5'h2 == _T_139 ? pcs_2 : _GEN_2946; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2948 = 5'h3 == _T_139 ? pcs_3 : _GEN_2947; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2949 = 5'h4 == _T_139 ? pcs_4 : _GEN_2948; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2950 = 5'h5 == _T_139 ? pcs_5 : _GEN_2949; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2951 = 5'h6 == _T_139 ? pcs_6 : _GEN_2950; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2952 = 5'h7 == _T_139 ? pcs_7 : _GEN_2951; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2953 = 5'h8 == _T_139 ? pcs_8 : _GEN_2952; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2954 = 5'h9 == _T_139 ? pcs_9 : _GEN_2953; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2955 = 5'ha == _T_139 ? pcs_10 : _GEN_2954; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2956 = 5'hb == _T_139 ? pcs_11 : _GEN_2955; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2957 = 5'hc == _T_139 ? pcs_12 : _GEN_2956; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2958 = 5'hd == _T_139 ? pcs_13 : _GEN_2957; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2959 = 5'he == _T_139 ? pcs_14 : _GEN_2958; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2960 = 5'hf == _T_139 ? pcs_15 : _GEN_2959; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2961 = 5'h10 == _T_139 ? pcs_16 : _GEN_2960; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2962 = 5'h11 == _T_139 ? pcs_17 : _GEN_2961; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2963 = 5'h12 == _T_139 ? pcs_18 : _GEN_2962; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2964 = 5'h13 == _T_139 ? pcs_19 : _GEN_2963; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2965 = 5'h14 == _T_139 ? pcs_20 : _GEN_2964; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2966 = 5'h15 == _T_139 ? pcs_21 : _GEN_2965; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2967 = 5'h16 == _T_139 ? pcs_22 : _GEN_2966; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2968 = 5'h17 == _T_139 ? pcs_23 : _GEN_2967; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2969 = 5'h18 == _T_139 ? pcs_24 : _GEN_2968; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2970 = 5'h19 == _T_139 ? pcs_25 : _GEN_2969; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2971 = 5'h1a == _T_139 ? pcs_26 : _GEN_2970; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2972 = 5'h1b == _T_139 ? pcs_27 : _GEN_2971; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_2973 = 5'h1c == _T_139 ? pcs_28 : _GEN_2972; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  reg  REG_17_cfi_idx_valid; // @[fetch-target-queue.scala 351:42]
  reg [1:0] REG_17_cfi_idx_bits; // @[fetch-target-queue.scala 351:42]
  reg  REG_17_cfi_taken; // @[fetch-target-queue.scala 351:42]
  reg  REG_17_cfi_mispredicted; // @[fetch-target-queue.scala 351:42]
  reg [2:0] REG_17_cfi_type; // @[fetch-target-queue.scala 351:42]
  reg [3:0] REG_17_br_mask; // @[fetch-target-queue.scala 351:42]
  reg  REG_17_cfi_is_call; // @[fetch-target-queue.scala 351:42]
  reg  REG_17_cfi_is_ret; // @[fetch-target-queue.scala 351:42]
  reg  REG_17_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42]
  reg [39:0] REG_17_ras_top; // @[fetch-target-queue.scala 351:42]
  reg [4:0] REG_17_ras_idx; // @[fetch-target-queue.scala 351:42]
  reg  REG_17_start_bank; // @[fetch-target-queue.scala 351:42]
  wire  _GEN_2978 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_start_bank : ram_0_start_bank; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2979 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_start_bank : _GEN_2978; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2980 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_start_bank : _GEN_2979; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2981 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_start_bank : _GEN_2980; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2982 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_start_bank : _GEN_2981; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2983 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_start_bank : _GEN_2982; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2984 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_start_bank : _GEN_2983; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2985 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_start_bank : _GEN_2984; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2986 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_start_bank : _GEN_2985; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2987 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_start_bank : _GEN_2986; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2988 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_start_bank : _GEN_2987; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2989 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_start_bank : _GEN_2988; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2990 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_start_bank : _GEN_2989; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2991 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_start_bank : _GEN_2990; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2992 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_start_bank : _GEN_2991; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2993 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_start_bank : _GEN_2992; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2994 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_start_bank : _GEN_2993; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2995 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_start_bank : _GEN_2994; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2996 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_start_bank : _GEN_2995; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2997 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_start_bank : _GEN_2996; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2998 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_start_bank : _GEN_2997; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_2999 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_start_bank : _GEN_2998; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3000 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_start_bank : _GEN_2999; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3001 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_start_bank : _GEN_3000; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3002 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_start_bank : _GEN_3001; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3003 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_start_bank : _GEN_3002; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3004 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_start_bank : _GEN_3003; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3010 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_ras_idx : ram_0_ras_idx; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3011 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_ras_idx : _GEN_3010; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3012 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_ras_idx : _GEN_3011; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3013 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_ras_idx : _GEN_3012; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3014 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_ras_idx : _GEN_3013; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3015 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_ras_idx : _GEN_3014; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3016 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_ras_idx : _GEN_3015; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3017 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_ras_idx : _GEN_3016; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3018 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_ras_idx : _GEN_3017; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3019 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_ras_idx : _GEN_3018; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3020 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_ras_idx : _GEN_3019; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3021 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_ras_idx : _GEN_3020; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3022 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_ras_idx : _GEN_3021; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3023 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_ras_idx : _GEN_3022; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3024 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_ras_idx : _GEN_3023; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3025 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_ras_idx : _GEN_3024; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3026 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_ras_idx : _GEN_3025; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3027 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_ras_idx : _GEN_3026; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3028 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_ras_idx : _GEN_3027; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3029 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_ras_idx : _GEN_3028; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3030 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_ras_idx : _GEN_3029; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3031 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_ras_idx : _GEN_3030; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3032 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_ras_idx : _GEN_3031; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3033 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_ras_idx : _GEN_3032; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3034 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_ras_idx : _GEN_3033; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3035 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_ras_idx : _GEN_3034; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3036 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_ras_idx : _GEN_3035; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3042 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_ras_top : ram_0_ras_top; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3043 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_ras_top : _GEN_3042; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3044 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_ras_top : _GEN_3043; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3045 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_ras_top : _GEN_3044; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3046 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_ras_top : _GEN_3045; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3047 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_ras_top : _GEN_3046; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3048 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_ras_top : _GEN_3047; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3049 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_ras_top : _GEN_3048; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3050 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_ras_top : _GEN_3049; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3051 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_ras_top : _GEN_3050; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3052 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_ras_top : _GEN_3051; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3053 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_ras_top : _GEN_3052; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3054 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_ras_top : _GEN_3053; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3055 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_ras_top : _GEN_3054; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3056 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_ras_top : _GEN_3055; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3057 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_ras_top : _GEN_3056; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3058 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_ras_top : _GEN_3057; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3059 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_ras_top : _GEN_3058; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3060 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_ras_top : _GEN_3059; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3061 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_ras_top : _GEN_3060; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3062 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_ras_top : _GEN_3061; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3063 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_ras_top : _GEN_3062; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3064 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_ras_top : _GEN_3063; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3065 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_ras_top : _GEN_3064; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3066 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_ras_top : _GEN_3065; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3067 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_ras_top : _GEN_3066; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3068 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_ras_top : _GEN_3067; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3074 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_cfi_npc_plus4 : ram_0_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3075 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_cfi_npc_plus4 : _GEN_3074; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3076 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_cfi_npc_plus4 : _GEN_3075; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3077 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_cfi_npc_plus4 : _GEN_3076; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3078 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_cfi_npc_plus4 : _GEN_3077; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3079 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_cfi_npc_plus4 : _GEN_3078; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3080 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_cfi_npc_plus4 : _GEN_3079; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3081 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_cfi_npc_plus4 : _GEN_3080; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3082 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_cfi_npc_plus4 : _GEN_3081; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3083 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_cfi_npc_plus4 : _GEN_3082; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3084 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_cfi_npc_plus4 : _GEN_3083; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3085 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_cfi_npc_plus4 : _GEN_3084; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3086 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_cfi_npc_plus4 : _GEN_3085; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3087 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_cfi_npc_plus4 : _GEN_3086; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3088 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_cfi_npc_plus4 : _GEN_3087; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3089 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_cfi_npc_plus4 : _GEN_3088; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3090 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_cfi_npc_plus4 : _GEN_3089; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3091 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_cfi_npc_plus4 : _GEN_3090; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3092 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_cfi_npc_plus4 : _GEN_3091; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3093 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_cfi_npc_plus4 : _GEN_3092; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3094 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_cfi_npc_plus4 : _GEN_3093; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3095 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_cfi_npc_plus4 : _GEN_3094; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3096 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_cfi_npc_plus4 : _GEN_3095; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3097 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_cfi_npc_plus4 : _GEN_3096; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3098 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_cfi_npc_plus4 : _GEN_3097; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3099 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_cfi_npc_plus4 : _GEN_3098; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3100 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_cfi_npc_plus4 : _GEN_3099; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3106 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_cfi_is_ret : ram_0_cfi_is_ret; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3107 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_cfi_is_ret : _GEN_3106; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3108 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_cfi_is_ret : _GEN_3107; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3109 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_cfi_is_ret : _GEN_3108; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3110 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_cfi_is_ret : _GEN_3109; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3111 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_cfi_is_ret : _GEN_3110; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3112 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_cfi_is_ret : _GEN_3111; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3113 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_cfi_is_ret : _GEN_3112; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3114 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_cfi_is_ret : _GEN_3113; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3115 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_cfi_is_ret : _GEN_3114; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3116 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_cfi_is_ret : _GEN_3115; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3117 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_cfi_is_ret : _GEN_3116; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3118 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_cfi_is_ret : _GEN_3117; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3119 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_cfi_is_ret : _GEN_3118; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3120 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_cfi_is_ret : _GEN_3119; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3121 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_cfi_is_ret : _GEN_3120; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3122 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_cfi_is_ret : _GEN_3121; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3123 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_cfi_is_ret : _GEN_3122; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3124 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_cfi_is_ret : _GEN_3123; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3125 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_cfi_is_ret : _GEN_3124; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3126 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_cfi_is_ret : _GEN_3125; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3127 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_cfi_is_ret : _GEN_3126; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3128 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_cfi_is_ret : _GEN_3127; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3129 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_cfi_is_ret : _GEN_3128; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3130 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_cfi_is_ret : _GEN_3129; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3131 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_cfi_is_ret : _GEN_3130; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3132 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_cfi_is_ret : _GEN_3131; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3138 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_cfi_is_call : ram_0_cfi_is_call; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3139 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_cfi_is_call : _GEN_3138; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3140 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_cfi_is_call : _GEN_3139; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3141 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_cfi_is_call : _GEN_3140; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3142 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_cfi_is_call : _GEN_3141; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3143 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_cfi_is_call : _GEN_3142; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3144 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_cfi_is_call : _GEN_3143; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3145 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_cfi_is_call : _GEN_3144; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3146 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_cfi_is_call : _GEN_3145; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3147 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_cfi_is_call : _GEN_3146; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3148 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_cfi_is_call : _GEN_3147; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3149 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_cfi_is_call : _GEN_3148; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3150 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_cfi_is_call : _GEN_3149; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3151 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_cfi_is_call : _GEN_3150; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3152 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_cfi_is_call : _GEN_3151; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3153 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_cfi_is_call : _GEN_3152; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3154 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_cfi_is_call : _GEN_3153; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3155 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_cfi_is_call : _GEN_3154; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3156 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_cfi_is_call : _GEN_3155; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3157 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_cfi_is_call : _GEN_3156; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3158 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_cfi_is_call : _GEN_3157; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3159 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_cfi_is_call : _GEN_3158; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3160 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_cfi_is_call : _GEN_3159; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3161 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_cfi_is_call : _GEN_3160; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3162 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_cfi_is_call : _GEN_3161; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3163 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_cfi_is_call : _GEN_3162; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3164 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_cfi_is_call : _GEN_3163; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3170 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_br_mask : ram_0_br_mask; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3171 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_br_mask : _GEN_3170; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3172 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_br_mask : _GEN_3171; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3173 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_br_mask : _GEN_3172; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3174 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_br_mask : _GEN_3173; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3175 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_br_mask : _GEN_3174; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3176 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_br_mask : _GEN_3175; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3177 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_br_mask : _GEN_3176; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3178 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_br_mask : _GEN_3177; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3179 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_br_mask : _GEN_3178; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3180 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_br_mask : _GEN_3179; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3181 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_br_mask : _GEN_3180; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3182 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_br_mask : _GEN_3181; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3183 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_br_mask : _GEN_3182; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3184 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_br_mask : _GEN_3183; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3185 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_br_mask : _GEN_3184; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3186 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_br_mask : _GEN_3185; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3187 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_br_mask : _GEN_3186; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3188 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_br_mask : _GEN_3187; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3189 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_br_mask : _GEN_3188; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3190 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_br_mask : _GEN_3189; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3191 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_br_mask : _GEN_3190; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3192 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_br_mask : _GEN_3191; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3193 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_br_mask : _GEN_3192; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3194 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_br_mask : _GEN_3193; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3195 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_br_mask : _GEN_3194; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3196 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_br_mask : _GEN_3195; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3202 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_cfi_type : ram_0_cfi_type; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3203 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_cfi_type : _GEN_3202; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3204 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_cfi_type : _GEN_3203; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3205 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_cfi_type : _GEN_3204; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3206 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_cfi_type : _GEN_3205; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3207 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_cfi_type : _GEN_3206; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3208 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_cfi_type : _GEN_3207; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3209 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_cfi_type : _GEN_3208; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3210 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_cfi_type : _GEN_3209; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3211 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_cfi_type : _GEN_3210; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3212 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_cfi_type : _GEN_3211; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3213 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_cfi_type : _GEN_3212; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3214 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_cfi_type : _GEN_3213; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3215 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_cfi_type : _GEN_3214; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3216 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_cfi_type : _GEN_3215; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3217 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_cfi_type : _GEN_3216; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3218 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_cfi_type : _GEN_3217; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3219 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_cfi_type : _GEN_3218; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3220 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_cfi_type : _GEN_3219; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3221 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_cfi_type : _GEN_3220; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3222 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_cfi_type : _GEN_3221; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3223 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_cfi_type : _GEN_3222; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3224 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_cfi_type : _GEN_3223; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3225 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_cfi_type : _GEN_3224; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3226 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_cfi_type : _GEN_3225; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3227 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_cfi_type : _GEN_3226; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3228 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_cfi_type : _GEN_3227; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3234 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_cfi_mispredicted : ram_0_cfi_mispredicted; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3235 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_cfi_mispredicted : _GEN_3234; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3236 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_cfi_mispredicted : _GEN_3235; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3237 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_cfi_mispredicted : _GEN_3236; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3238 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_cfi_mispredicted : _GEN_3237; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3239 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_cfi_mispredicted : _GEN_3238; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3240 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_cfi_mispredicted : _GEN_3239; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3241 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_cfi_mispredicted : _GEN_3240; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3242 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_cfi_mispredicted : _GEN_3241; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3243 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_cfi_mispredicted : _GEN_3242; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3244 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_cfi_mispredicted : _GEN_3243; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3245 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_cfi_mispredicted : _GEN_3244; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3246 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_cfi_mispredicted : _GEN_3245; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3247 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_cfi_mispredicted : _GEN_3246; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3248 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_cfi_mispredicted : _GEN_3247; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3249 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_cfi_mispredicted : _GEN_3248; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3250 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_cfi_mispredicted : _GEN_3249; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3251 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_cfi_mispredicted : _GEN_3250; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3252 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_cfi_mispredicted : _GEN_3251; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3253 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_cfi_mispredicted : _GEN_3252; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3254 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_cfi_mispredicted : _GEN_3253; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3255 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_cfi_mispredicted : _GEN_3254; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3256 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_cfi_mispredicted : _GEN_3255; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3257 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_cfi_mispredicted : _GEN_3256; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3258 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_cfi_mispredicted : _GEN_3257; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3259 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_cfi_mispredicted : _GEN_3258; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3260 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_cfi_mispredicted : _GEN_3259; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3266 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_cfi_taken : ram_0_cfi_taken; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3267 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_cfi_taken : _GEN_3266; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3268 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_cfi_taken : _GEN_3267; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3269 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_cfi_taken : _GEN_3268; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3270 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_cfi_taken : _GEN_3269; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3271 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_cfi_taken : _GEN_3270; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3272 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_cfi_taken : _GEN_3271; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3273 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_cfi_taken : _GEN_3272; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3274 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_cfi_taken : _GEN_3273; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3275 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_cfi_taken : _GEN_3274; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3276 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_cfi_taken : _GEN_3275; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3277 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_cfi_taken : _GEN_3276; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3278 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_cfi_taken : _GEN_3277; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3279 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_cfi_taken : _GEN_3278; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3280 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_cfi_taken : _GEN_3279; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3281 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_cfi_taken : _GEN_3280; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3282 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_cfi_taken : _GEN_3281; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3283 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_cfi_taken : _GEN_3282; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3284 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_cfi_taken : _GEN_3283; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3285 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_cfi_taken : _GEN_3284; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3286 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_cfi_taken : _GEN_3285; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3287 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_cfi_taken : _GEN_3286; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3288 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_cfi_taken : _GEN_3287; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3289 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_cfi_taken : _GEN_3288; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3290 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_cfi_taken : _GEN_3289; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3291 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_cfi_taken : _GEN_3290; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3292 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_cfi_taken : _GEN_3291; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3298 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_cfi_idx_bits : ram_0_cfi_idx_bits; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3299 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_cfi_idx_bits : _GEN_3298; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3300 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_cfi_idx_bits : _GEN_3299; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3301 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_cfi_idx_bits : _GEN_3300; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3302 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_cfi_idx_bits : _GEN_3301; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3303 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_cfi_idx_bits : _GEN_3302; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3304 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_cfi_idx_bits : _GEN_3303; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3305 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_cfi_idx_bits : _GEN_3304; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3306 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_cfi_idx_bits : _GEN_3305; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3307 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_cfi_idx_bits : _GEN_3306; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3308 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_cfi_idx_bits : _GEN_3307; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3309 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_cfi_idx_bits : _GEN_3308; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3310 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_cfi_idx_bits : _GEN_3309; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3311 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_cfi_idx_bits : _GEN_3310; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3312 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_cfi_idx_bits : _GEN_3311; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3313 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_cfi_idx_bits : _GEN_3312; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3314 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_cfi_idx_bits : _GEN_3313; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3315 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_cfi_idx_bits : _GEN_3314; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3316 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_cfi_idx_bits : _GEN_3315; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3317 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_cfi_idx_bits : _GEN_3316; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3318 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_cfi_idx_bits : _GEN_3317; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3319 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_cfi_idx_bits : _GEN_3318; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3320 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_cfi_idx_bits : _GEN_3319; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3321 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_cfi_idx_bits : _GEN_3320; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3322 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_cfi_idx_bits : _GEN_3321; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3323 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_cfi_idx_bits : _GEN_3322; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3324 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_cfi_idx_bits : _GEN_3323; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3330 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? ram_1_cfi_idx_valid : ram_0_cfi_idx_valid; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3331 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? ram_2_cfi_idx_valid : _GEN_3330; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3332 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? ram_3_cfi_idx_valid : _GEN_3331; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3333 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? ram_4_cfi_idx_valid : _GEN_3332; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3334 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? ram_5_cfi_idx_valid : _GEN_3333; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3335 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? ram_6_cfi_idx_valid : _GEN_3334; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3336 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? ram_7_cfi_idx_valid : _GEN_3335; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3337 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? ram_8_cfi_idx_valid : _GEN_3336; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3338 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? ram_9_cfi_idx_valid : _GEN_3337; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3339 = 5'ha == io_get_ftq_pc_0_ftq_idx ? ram_10_cfi_idx_valid : _GEN_3338; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3340 = 5'hb == io_get_ftq_pc_0_ftq_idx ? ram_11_cfi_idx_valid : _GEN_3339; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3341 = 5'hc == io_get_ftq_pc_0_ftq_idx ? ram_12_cfi_idx_valid : _GEN_3340; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3342 = 5'hd == io_get_ftq_pc_0_ftq_idx ? ram_13_cfi_idx_valid : _GEN_3341; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3343 = 5'he == io_get_ftq_pc_0_ftq_idx ? ram_14_cfi_idx_valid : _GEN_3342; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3344 = 5'hf == io_get_ftq_pc_0_ftq_idx ? ram_15_cfi_idx_valid : _GEN_3343; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3345 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? ram_16_cfi_idx_valid : _GEN_3344; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3346 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? ram_17_cfi_idx_valid : _GEN_3345; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3347 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? ram_18_cfi_idx_valid : _GEN_3346; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3348 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? ram_19_cfi_idx_valid : _GEN_3347; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3349 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? ram_20_cfi_idx_valid : _GEN_3348; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3350 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? ram_21_cfi_idx_valid : _GEN_3349; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3351 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? ram_22_cfi_idx_valid : _GEN_3350; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3352 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? ram_23_cfi_idx_valid : _GEN_3351; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3353 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? ram_24_cfi_idx_valid : _GEN_3352; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3354 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? ram_25_cfi_idx_valid : _GEN_3353; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3355 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? ram_26_cfi_idx_valid : _GEN_3354; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3356 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? ram_27_cfi_idx_valid : _GEN_3355; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  reg [39:0] REG_18; // @[fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3362 = 5'h1 == io_get_ftq_pc_0_ftq_idx ? pcs_1 : pcs_0; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3363 = 5'h2 == io_get_ftq_pc_0_ftq_idx ? pcs_2 : _GEN_3362; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3364 = 5'h3 == io_get_ftq_pc_0_ftq_idx ? pcs_3 : _GEN_3363; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3365 = 5'h4 == io_get_ftq_pc_0_ftq_idx ? pcs_4 : _GEN_3364; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3366 = 5'h5 == io_get_ftq_pc_0_ftq_idx ? pcs_5 : _GEN_3365; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3367 = 5'h6 == io_get_ftq_pc_0_ftq_idx ? pcs_6 : _GEN_3366; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3368 = 5'h7 == io_get_ftq_pc_0_ftq_idx ? pcs_7 : _GEN_3367; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3369 = 5'h8 == io_get_ftq_pc_0_ftq_idx ? pcs_8 : _GEN_3368; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3370 = 5'h9 == io_get_ftq_pc_0_ftq_idx ? pcs_9 : _GEN_3369; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3371 = 5'ha == io_get_ftq_pc_0_ftq_idx ? pcs_10 : _GEN_3370; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3372 = 5'hb == io_get_ftq_pc_0_ftq_idx ? pcs_11 : _GEN_3371; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3373 = 5'hc == io_get_ftq_pc_0_ftq_idx ? pcs_12 : _GEN_3372; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3374 = 5'hd == io_get_ftq_pc_0_ftq_idx ? pcs_13 : _GEN_3373; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3375 = 5'he == io_get_ftq_pc_0_ftq_idx ? pcs_14 : _GEN_3374; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3376 = 5'hf == io_get_ftq_pc_0_ftq_idx ? pcs_15 : _GEN_3375; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3377 = 5'h10 == io_get_ftq_pc_0_ftq_idx ? pcs_16 : _GEN_3376; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3378 = 5'h11 == io_get_ftq_pc_0_ftq_idx ? pcs_17 : _GEN_3377; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3379 = 5'h12 == io_get_ftq_pc_0_ftq_idx ? pcs_18 : _GEN_3378; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3380 = 5'h13 == io_get_ftq_pc_0_ftq_idx ? pcs_19 : _GEN_3379; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3381 = 5'h14 == io_get_ftq_pc_0_ftq_idx ? pcs_20 : _GEN_3380; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3382 = 5'h15 == io_get_ftq_pc_0_ftq_idx ? pcs_21 : _GEN_3381; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3383 = 5'h16 == io_get_ftq_pc_0_ftq_idx ? pcs_22 : _GEN_3382; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3384 = 5'h17 == io_get_ftq_pc_0_ftq_idx ? pcs_23 : _GEN_3383; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3385 = 5'h18 == io_get_ftq_pc_0_ftq_idx ? pcs_24 : _GEN_3384; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3386 = 5'h19 == io_get_ftq_pc_0_ftq_idx ? pcs_25 : _GEN_3385; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3387 = 5'h1a == io_get_ftq_pc_0_ftq_idx ? pcs_26 : _GEN_3386; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3388 = 5'h1b == io_get_ftq_pc_0_ftq_idx ? pcs_27 : _GEN_3387; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  reg [39:0] REG_19; // @[fetch-target-queue.scala 357:42]
  reg  REG_20; // @[fetch-target-queue.scala 358:42]
  reg [39:0] REG_21; // @[fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3394 = 5'h1 == _GEN_861 ? pcs_1 : pcs_0; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3395 = 5'h2 == _GEN_861 ? pcs_2 : _GEN_3394; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3396 = 5'h3 == _GEN_861 ? pcs_3 : _GEN_3395; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3397 = 5'h4 == _GEN_861 ? pcs_4 : _GEN_3396; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3398 = 5'h5 == _GEN_861 ? pcs_5 : _GEN_3397; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3399 = 5'h6 == _GEN_861 ? pcs_6 : _GEN_3398; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3400 = 5'h7 == _GEN_861 ? pcs_7 : _GEN_3399; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3401 = 5'h8 == _GEN_861 ? pcs_8 : _GEN_3400; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3402 = 5'h9 == _GEN_861 ? pcs_9 : _GEN_3401; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3403 = 5'ha == _GEN_861 ? pcs_10 : _GEN_3402; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3404 = 5'hb == _GEN_861 ? pcs_11 : _GEN_3403; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3405 = 5'hc == _GEN_861 ? pcs_12 : _GEN_3404; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3406 = 5'hd == _GEN_861 ? pcs_13 : _GEN_3405; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3407 = 5'he == _GEN_861 ? pcs_14 : _GEN_3406; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3408 = 5'hf == _GEN_861 ? pcs_15 : _GEN_3407; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3409 = 5'h10 == _GEN_861 ? pcs_16 : _GEN_3408; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3410 = 5'h11 == _GEN_861 ? pcs_17 : _GEN_3409; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3411 = 5'h12 == _GEN_861 ? pcs_18 : _GEN_3410; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3412 = 5'h13 == _GEN_861 ? pcs_19 : _GEN_3411; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3413 = 5'h14 == _GEN_861 ? pcs_20 : _GEN_3412; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3414 = 5'h15 == _GEN_861 ? pcs_21 : _GEN_3413; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3415 = 5'h16 == _GEN_861 ? pcs_22 : _GEN_3414; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3416 = 5'h17 == _GEN_861 ? pcs_23 : _GEN_3415; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3417 = 5'h18 == _GEN_861 ? pcs_24 : _GEN_3416; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3418 = 5'h19 == _GEN_861 ? pcs_25 : _GEN_3417; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3419 = 5'h1a == _GEN_861 ? pcs_26 : _GEN_3418; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [39:0] _GEN_3420 = 5'h1b == _GEN_861 ? pcs_27 : _GEN_3419; // @[fetch-target-queue.scala 359:42 fetch-target-queue.scala 359:42]
  wire [4:0] _T_149 = io_get_ftq_pc_1_ftq_idx + 5'h1; // @[util.scala 203:14]
  wire  _T_153 = _T_149 == enq_ptr & do_enq; // @[fetch-target-queue.scala 347:46]
  wire [39:0] _GEN_3426 = 5'h1 == _T_149 ? pcs_1 : pcs_0; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3427 = 5'h2 == _T_149 ? pcs_2 : _GEN_3426; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3428 = 5'h3 == _T_149 ? pcs_3 : _GEN_3427; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3429 = 5'h4 == _T_149 ? pcs_4 : _GEN_3428; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3430 = 5'h5 == _T_149 ? pcs_5 : _GEN_3429; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3431 = 5'h6 == _T_149 ? pcs_6 : _GEN_3430; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3432 = 5'h7 == _T_149 ? pcs_7 : _GEN_3431; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3433 = 5'h8 == _T_149 ? pcs_8 : _GEN_3432; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3434 = 5'h9 == _T_149 ? pcs_9 : _GEN_3433; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3435 = 5'ha == _T_149 ? pcs_10 : _GEN_3434; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3436 = 5'hb == _T_149 ? pcs_11 : _GEN_3435; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3437 = 5'hc == _T_149 ? pcs_12 : _GEN_3436; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3438 = 5'hd == _T_149 ? pcs_13 : _GEN_3437; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3439 = 5'he == _T_149 ? pcs_14 : _GEN_3438; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3440 = 5'hf == _T_149 ? pcs_15 : _GEN_3439; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3441 = 5'h10 == _T_149 ? pcs_16 : _GEN_3440; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3442 = 5'h11 == _T_149 ? pcs_17 : _GEN_3441; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3443 = 5'h12 == _T_149 ? pcs_18 : _GEN_3442; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3444 = 5'h13 == _T_149 ? pcs_19 : _GEN_3443; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3445 = 5'h14 == _T_149 ? pcs_20 : _GEN_3444; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3446 = 5'h15 == _T_149 ? pcs_21 : _GEN_3445; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3447 = 5'h16 == _T_149 ? pcs_22 : _GEN_3446; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3448 = 5'h17 == _T_149 ? pcs_23 : _GEN_3447; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3449 = 5'h18 == _T_149 ? pcs_24 : _GEN_3448; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3450 = 5'h19 == _T_149 ? pcs_25 : _GEN_3449; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3451 = 5'h1a == _T_149 ? pcs_26 : _GEN_3450; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3452 = 5'h1b == _T_149 ? pcs_27 : _GEN_3451; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  wire [39:0] _GEN_3453 = 5'h1c == _T_149 ? pcs_28 : _GEN_3452; // @[fetch-target-queue.scala 348:22 fetch-target-queue.scala 348:22]
  reg  REG_22_cfi_idx_valid; // @[fetch-target-queue.scala 351:42]
  reg [1:0] REG_22_cfi_idx_bits; // @[fetch-target-queue.scala 351:42]
  reg  REG_22_cfi_taken; // @[fetch-target-queue.scala 351:42]
  reg  REG_22_cfi_mispredicted; // @[fetch-target-queue.scala 351:42]
  reg [2:0] REG_22_cfi_type; // @[fetch-target-queue.scala 351:42]
  reg [3:0] REG_22_br_mask; // @[fetch-target-queue.scala 351:42]
  reg  REG_22_cfi_is_call; // @[fetch-target-queue.scala 351:42]
  reg  REG_22_cfi_is_ret; // @[fetch-target-queue.scala 351:42]
  reg  REG_22_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42]
  reg [39:0] REG_22_ras_top; // @[fetch-target-queue.scala 351:42]
  reg [4:0] REG_22_ras_idx; // @[fetch-target-queue.scala 351:42]
  reg  REG_22_start_bank; // @[fetch-target-queue.scala 351:42]
  wire  _GEN_3458 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_start_bank : ram_0_start_bank; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3459 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_start_bank : _GEN_3458; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3460 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_start_bank : _GEN_3459; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3461 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_start_bank : _GEN_3460; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3462 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_start_bank : _GEN_3461; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3463 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_start_bank : _GEN_3462; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3464 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_start_bank : _GEN_3463; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3465 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_start_bank : _GEN_3464; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3466 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_start_bank : _GEN_3465; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3467 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_start_bank : _GEN_3466; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3468 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_start_bank : _GEN_3467; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3469 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_start_bank : _GEN_3468; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3470 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_start_bank : _GEN_3469; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3471 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_start_bank : _GEN_3470; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3472 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_start_bank : _GEN_3471; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3473 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_start_bank : _GEN_3472; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3474 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_start_bank : _GEN_3473; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3475 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_start_bank : _GEN_3474; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3476 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_start_bank : _GEN_3475; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3477 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_start_bank : _GEN_3476; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3478 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_start_bank : _GEN_3477; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3479 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_start_bank : _GEN_3478; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3480 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_start_bank : _GEN_3479; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3481 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_start_bank : _GEN_3480; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3482 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_start_bank : _GEN_3481; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3483 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_start_bank : _GEN_3482; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3484 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_start_bank : _GEN_3483; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3490 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_ras_idx : ram_0_ras_idx; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3491 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_ras_idx : _GEN_3490; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3492 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_ras_idx : _GEN_3491; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3493 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_ras_idx : _GEN_3492; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3494 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_ras_idx : _GEN_3493; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3495 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_ras_idx : _GEN_3494; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3496 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_ras_idx : _GEN_3495; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3497 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_ras_idx : _GEN_3496; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3498 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_ras_idx : _GEN_3497; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3499 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_ras_idx : _GEN_3498; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3500 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_ras_idx : _GEN_3499; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3501 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_ras_idx : _GEN_3500; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3502 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_ras_idx : _GEN_3501; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3503 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_ras_idx : _GEN_3502; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3504 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_ras_idx : _GEN_3503; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3505 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_ras_idx : _GEN_3504; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3506 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_ras_idx : _GEN_3505; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3507 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_ras_idx : _GEN_3506; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3508 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_ras_idx : _GEN_3507; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3509 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_ras_idx : _GEN_3508; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3510 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_ras_idx : _GEN_3509; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3511 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_ras_idx : _GEN_3510; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3512 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_ras_idx : _GEN_3511; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3513 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_ras_idx : _GEN_3512; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3514 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_ras_idx : _GEN_3513; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3515 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_ras_idx : _GEN_3514; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [4:0] _GEN_3516 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_ras_idx : _GEN_3515; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3522 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_ras_top : ram_0_ras_top; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3523 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_ras_top : _GEN_3522; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3524 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_ras_top : _GEN_3523; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3525 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_ras_top : _GEN_3524; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3526 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_ras_top : _GEN_3525; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3527 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_ras_top : _GEN_3526; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3528 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_ras_top : _GEN_3527; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3529 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_ras_top : _GEN_3528; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3530 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_ras_top : _GEN_3529; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3531 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_ras_top : _GEN_3530; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3532 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_ras_top : _GEN_3531; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3533 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_ras_top : _GEN_3532; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3534 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_ras_top : _GEN_3533; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3535 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_ras_top : _GEN_3534; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3536 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_ras_top : _GEN_3535; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3537 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_ras_top : _GEN_3536; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3538 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_ras_top : _GEN_3537; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3539 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_ras_top : _GEN_3538; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3540 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_ras_top : _GEN_3539; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3541 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_ras_top : _GEN_3540; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3542 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_ras_top : _GEN_3541; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3543 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_ras_top : _GEN_3542; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3544 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_ras_top : _GEN_3543; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3545 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_ras_top : _GEN_3544; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3546 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_ras_top : _GEN_3545; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3547 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_ras_top : _GEN_3546; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [39:0] _GEN_3548 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_ras_top : _GEN_3547; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3554 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_cfi_npc_plus4 : ram_0_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3555 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_cfi_npc_plus4 : _GEN_3554; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3556 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_cfi_npc_plus4 : _GEN_3555; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3557 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_cfi_npc_plus4 : _GEN_3556; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3558 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_cfi_npc_plus4 : _GEN_3557; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3559 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_cfi_npc_plus4 : _GEN_3558; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3560 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_cfi_npc_plus4 : _GEN_3559; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3561 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_cfi_npc_plus4 : _GEN_3560; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3562 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_cfi_npc_plus4 : _GEN_3561; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3563 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_cfi_npc_plus4 : _GEN_3562; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3564 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_cfi_npc_plus4 : _GEN_3563; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3565 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_cfi_npc_plus4 : _GEN_3564; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3566 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_cfi_npc_plus4 : _GEN_3565; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3567 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_cfi_npc_plus4 : _GEN_3566; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3568 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_cfi_npc_plus4 : _GEN_3567; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3569 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_cfi_npc_plus4 : _GEN_3568; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3570 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_cfi_npc_plus4 : _GEN_3569; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3571 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_cfi_npc_plus4 : _GEN_3570; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3572 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_cfi_npc_plus4 : _GEN_3571; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3573 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_cfi_npc_plus4 : _GEN_3572; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3574 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_cfi_npc_plus4 : _GEN_3573; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3575 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_cfi_npc_plus4 : _GEN_3574; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3576 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_cfi_npc_plus4 : _GEN_3575; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3577 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_cfi_npc_plus4 : _GEN_3576; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3578 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_cfi_npc_plus4 : _GEN_3577; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3579 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_cfi_npc_plus4 : _GEN_3578; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3580 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_cfi_npc_plus4 : _GEN_3579; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3586 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_cfi_is_ret : ram_0_cfi_is_ret; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3587 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_cfi_is_ret : _GEN_3586; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3588 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_cfi_is_ret : _GEN_3587; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3589 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_cfi_is_ret : _GEN_3588; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3590 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_cfi_is_ret : _GEN_3589; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3591 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_cfi_is_ret : _GEN_3590; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3592 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_cfi_is_ret : _GEN_3591; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3593 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_cfi_is_ret : _GEN_3592; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3594 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_cfi_is_ret : _GEN_3593; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3595 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_cfi_is_ret : _GEN_3594; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3596 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_cfi_is_ret : _GEN_3595; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3597 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_cfi_is_ret : _GEN_3596; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3598 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_cfi_is_ret : _GEN_3597; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3599 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_cfi_is_ret : _GEN_3598; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3600 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_cfi_is_ret : _GEN_3599; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3601 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_cfi_is_ret : _GEN_3600; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3602 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_cfi_is_ret : _GEN_3601; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3603 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_cfi_is_ret : _GEN_3602; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3604 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_cfi_is_ret : _GEN_3603; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3605 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_cfi_is_ret : _GEN_3604; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3606 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_cfi_is_ret : _GEN_3605; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3607 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_cfi_is_ret : _GEN_3606; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3608 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_cfi_is_ret : _GEN_3607; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3609 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_cfi_is_ret : _GEN_3608; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3610 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_cfi_is_ret : _GEN_3609; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3611 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_cfi_is_ret : _GEN_3610; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3612 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_cfi_is_ret : _GEN_3611; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3618 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_cfi_is_call : ram_0_cfi_is_call; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3619 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_cfi_is_call : _GEN_3618; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3620 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_cfi_is_call : _GEN_3619; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3621 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_cfi_is_call : _GEN_3620; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3622 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_cfi_is_call : _GEN_3621; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3623 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_cfi_is_call : _GEN_3622; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3624 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_cfi_is_call : _GEN_3623; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3625 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_cfi_is_call : _GEN_3624; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3626 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_cfi_is_call : _GEN_3625; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3627 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_cfi_is_call : _GEN_3626; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3628 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_cfi_is_call : _GEN_3627; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3629 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_cfi_is_call : _GEN_3628; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3630 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_cfi_is_call : _GEN_3629; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3631 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_cfi_is_call : _GEN_3630; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3632 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_cfi_is_call : _GEN_3631; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3633 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_cfi_is_call : _GEN_3632; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3634 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_cfi_is_call : _GEN_3633; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3635 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_cfi_is_call : _GEN_3634; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3636 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_cfi_is_call : _GEN_3635; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3637 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_cfi_is_call : _GEN_3636; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3638 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_cfi_is_call : _GEN_3637; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3639 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_cfi_is_call : _GEN_3638; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3640 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_cfi_is_call : _GEN_3639; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3641 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_cfi_is_call : _GEN_3640; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3642 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_cfi_is_call : _GEN_3641; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3643 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_cfi_is_call : _GEN_3642; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3644 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_cfi_is_call : _GEN_3643; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3650 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_br_mask : ram_0_br_mask; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3651 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_br_mask : _GEN_3650; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3652 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_br_mask : _GEN_3651; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3653 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_br_mask : _GEN_3652; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3654 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_br_mask : _GEN_3653; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3655 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_br_mask : _GEN_3654; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3656 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_br_mask : _GEN_3655; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3657 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_br_mask : _GEN_3656; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3658 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_br_mask : _GEN_3657; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3659 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_br_mask : _GEN_3658; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3660 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_br_mask : _GEN_3659; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3661 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_br_mask : _GEN_3660; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3662 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_br_mask : _GEN_3661; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3663 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_br_mask : _GEN_3662; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3664 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_br_mask : _GEN_3663; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3665 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_br_mask : _GEN_3664; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3666 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_br_mask : _GEN_3665; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3667 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_br_mask : _GEN_3666; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3668 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_br_mask : _GEN_3667; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3669 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_br_mask : _GEN_3668; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3670 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_br_mask : _GEN_3669; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3671 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_br_mask : _GEN_3670; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3672 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_br_mask : _GEN_3671; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3673 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_br_mask : _GEN_3672; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3674 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_br_mask : _GEN_3673; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3675 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_br_mask : _GEN_3674; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [3:0] _GEN_3676 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_br_mask : _GEN_3675; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3682 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_cfi_type : ram_0_cfi_type; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3683 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_cfi_type : _GEN_3682; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3684 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_cfi_type : _GEN_3683; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3685 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_cfi_type : _GEN_3684; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3686 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_cfi_type : _GEN_3685; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3687 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_cfi_type : _GEN_3686; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3688 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_cfi_type : _GEN_3687; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3689 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_cfi_type : _GEN_3688; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3690 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_cfi_type : _GEN_3689; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3691 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_cfi_type : _GEN_3690; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3692 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_cfi_type : _GEN_3691; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3693 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_cfi_type : _GEN_3692; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3694 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_cfi_type : _GEN_3693; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3695 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_cfi_type : _GEN_3694; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3696 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_cfi_type : _GEN_3695; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3697 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_cfi_type : _GEN_3696; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3698 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_cfi_type : _GEN_3697; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3699 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_cfi_type : _GEN_3698; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3700 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_cfi_type : _GEN_3699; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3701 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_cfi_type : _GEN_3700; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3702 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_cfi_type : _GEN_3701; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3703 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_cfi_type : _GEN_3702; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3704 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_cfi_type : _GEN_3703; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3705 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_cfi_type : _GEN_3704; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3706 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_cfi_type : _GEN_3705; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3707 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_cfi_type : _GEN_3706; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [2:0] _GEN_3708 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_cfi_type : _GEN_3707; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3714 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_cfi_mispredicted : ram_0_cfi_mispredicted; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3715 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_cfi_mispredicted : _GEN_3714; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3716 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_cfi_mispredicted : _GEN_3715; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3717 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_cfi_mispredicted : _GEN_3716; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3718 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_cfi_mispredicted : _GEN_3717; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3719 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_cfi_mispredicted : _GEN_3718; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3720 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_cfi_mispredicted : _GEN_3719; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3721 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_cfi_mispredicted : _GEN_3720; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3722 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_cfi_mispredicted : _GEN_3721; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3723 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_cfi_mispredicted : _GEN_3722; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3724 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_cfi_mispredicted : _GEN_3723; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3725 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_cfi_mispredicted : _GEN_3724; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3726 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_cfi_mispredicted : _GEN_3725; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3727 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_cfi_mispredicted : _GEN_3726; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3728 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_cfi_mispredicted : _GEN_3727; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3729 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_cfi_mispredicted : _GEN_3728; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3730 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_cfi_mispredicted : _GEN_3729; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3731 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_cfi_mispredicted : _GEN_3730; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3732 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_cfi_mispredicted : _GEN_3731; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3733 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_cfi_mispredicted : _GEN_3732; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3734 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_cfi_mispredicted : _GEN_3733; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3735 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_cfi_mispredicted : _GEN_3734; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3736 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_cfi_mispredicted : _GEN_3735; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3737 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_cfi_mispredicted : _GEN_3736; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3738 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_cfi_mispredicted : _GEN_3737; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3739 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_cfi_mispredicted : _GEN_3738; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3740 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_cfi_mispredicted : _GEN_3739; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3746 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_cfi_taken : ram_0_cfi_taken; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3747 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_cfi_taken : _GEN_3746; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3748 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_cfi_taken : _GEN_3747; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3749 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_cfi_taken : _GEN_3748; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3750 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_cfi_taken : _GEN_3749; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3751 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_cfi_taken : _GEN_3750; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3752 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_cfi_taken : _GEN_3751; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3753 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_cfi_taken : _GEN_3752; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3754 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_cfi_taken : _GEN_3753; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3755 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_cfi_taken : _GEN_3754; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3756 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_cfi_taken : _GEN_3755; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3757 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_cfi_taken : _GEN_3756; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3758 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_cfi_taken : _GEN_3757; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3759 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_cfi_taken : _GEN_3758; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3760 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_cfi_taken : _GEN_3759; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3761 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_cfi_taken : _GEN_3760; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3762 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_cfi_taken : _GEN_3761; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3763 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_cfi_taken : _GEN_3762; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3764 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_cfi_taken : _GEN_3763; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3765 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_cfi_taken : _GEN_3764; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3766 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_cfi_taken : _GEN_3765; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3767 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_cfi_taken : _GEN_3766; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3768 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_cfi_taken : _GEN_3767; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3769 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_cfi_taken : _GEN_3768; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3770 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_cfi_taken : _GEN_3769; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3771 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_cfi_taken : _GEN_3770; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3772 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_cfi_taken : _GEN_3771; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3778 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_cfi_idx_bits : ram_0_cfi_idx_bits; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3779 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_cfi_idx_bits : _GEN_3778; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3780 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_cfi_idx_bits : _GEN_3779; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3781 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_cfi_idx_bits : _GEN_3780; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3782 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_cfi_idx_bits : _GEN_3781; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3783 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_cfi_idx_bits : _GEN_3782; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3784 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_cfi_idx_bits : _GEN_3783; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3785 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_cfi_idx_bits : _GEN_3784; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3786 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_cfi_idx_bits : _GEN_3785; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3787 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_cfi_idx_bits : _GEN_3786; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3788 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_cfi_idx_bits : _GEN_3787; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3789 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_cfi_idx_bits : _GEN_3788; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3790 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_cfi_idx_bits : _GEN_3789; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3791 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_cfi_idx_bits : _GEN_3790; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3792 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_cfi_idx_bits : _GEN_3791; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3793 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_cfi_idx_bits : _GEN_3792; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3794 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_cfi_idx_bits : _GEN_3793; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3795 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_cfi_idx_bits : _GEN_3794; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3796 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_cfi_idx_bits : _GEN_3795; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3797 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_cfi_idx_bits : _GEN_3796; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3798 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_cfi_idx_bits : _GEN_3797; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3799 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_cfi_idx_bits : _GEN_3798; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3800 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_cfi_idx_bits : _GEN_3799; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3801 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_cfi_idx_bits : _GEN_3800; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3802 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_cfi_idx_bits : _GEN_3801; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3803 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_cfi_idx_bits : _GEN_3802; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire [1:0] _GEN_3804 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_cfi_idx_bits : _GEN_3803; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3810 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? ram_1_cfi_idx_valid : ram_0_cfi_idx_valid; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3811 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? ram_2_cfi_idx_valid : _GEN_3810; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3812 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? ram_3_cfi_idx_valid : _GEN_3811; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3813 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? ram_4_cfi_idx_valid : _GEN_3812; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3814 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? ram_5_cfi_idx_valid : _GEN_3813; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3815 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? ram_6_cfi_idx_valid : _GEN_3814; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3816 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? ram_7_cfi_idx_valid : _GEN_3815; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3817 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? ram_8_cfi_idx_valid : _GEN_3816; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3818 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? ram_9_cfi_idx_valid : _GEN_3817; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3819 = 5'ha == io_get_ftq_pc_1_ftq_idx ? ram_10_cfi_idx_valid : _GEN_3818; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3820 = 5'hb == io_get_ftq_pc_1_ftq_idx ? ram_11_cfi_idx_valid : _GEN_3819; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3821 = 5'hc == io_get_ftq_pc_1_ftq_idx ? ram_12_cfi_idx_valid : _GEN_3820; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3822 = 5'hd == io_get_ftq_pc_1_ftq_idx ? ram_13_cfi_idx_valid : _GEN_3821; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3823 = 5'he == io_get_ftq_pc_1_ftq_idx ? ram_14_cfi_idx_valid : _GEN_3822; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3824 = 5'hf == io_get_ftq_pc_1_ftq_idx ? ram_15_cfi_idx_valid : _GEN_3823; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3825 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? ram_16_cfi_idx_valid : _GEN_3824; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3826 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? ram_17_cfi_idx_valid : _GEN_3825; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3827 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? ram_18_cfi_idx_valid : _GEN_3826; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3828 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? ram_19_cfi_idx_valid : _GEN_3827; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3829 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? ram_20_cfi_idx_valid : _GEN_3828; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3830 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? ram_21_cfi_idx_valid : _GEN_3829; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3831 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? ram_22_cfi_idx_valid : _GEN_3830; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3832 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? ram_23_cfi_idx_valid : _GEN_3831; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3833 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? ram_24_cfi_idx_valid : _GEN_3832; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3834 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? ram_25_cfi_idx_valid : _GEN_3833; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3835 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? ram_26_cfi_idx_valid : _GEN_3834; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  wire  _GEN_3836 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? ram_27_cfi_idx_valid : _GEN_3835; // @[fetch-target-queue.scala 351:42 fetch-target-queue.scala 351:42]
  reg [39:0] REG_23; // @[fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3844 = 5'h1 == io_get_ftq_pc_1_ftq_idx ? pcs_1 : pcs_0; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3845 = 5'h2 == io_get_ftq_pc_1_ftq_idx ? pcs_2 : _GEN_3844; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3846 = 5'h3 == io_get_ftq_pc_1_ftq_idx ? pcs_3 : _GEN_3845; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3847 = 5'h4 == io_get_ftq_pc_1_ftq_idx ? pcs_4 : _GEN_3846; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3848 = 5'h5 == io_get_ftq_pc_1_ftq_idx ? pcs_5 : _GEN_3847; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3849 = 5'h6 == io_get_ftq_pc_1_ftq_idx ? pcs_6 : _GEN_3848; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3850 = 5'h7 == io_get_ftq_pc_1_ftq_idx ? pcs_7 : _GEN_3849; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3851 = 5'h8 == io_get_ftq_pc_1_ftq_idx ? pcs_8 : _GEN_3850; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3852 = 5'h9 == io_get_ftq_pc_1_ftq_idx ? pcs_9 : _GEN_3851; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3853 = 5'ha == io_get_ftq_pc_1_ftq_idx ? pcs_10 : _GEN_3852; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3854 = 5'hb == io_get_ftq_pc_1_ftq_idx ? pcs_11 : _GEN_3853; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3855 = 5'hc == io_get_ftq_pc_1_ftq_idx ? pcs_12 : _GEN_3854; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3856 = 5'hd == io_get_ftq_pc_1_ftq_idx ? pcs_13 : _GEN_3855; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3857 = 5'he == io_get_ftq_pc_1_ftq_idx ? pcs_14 : _GEN_3856; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3858 = 5'hf == io_get_ftq_pc_1_ftq_idx ? pcs_15 : _GEN_3857; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3859 = 5'h10 == io_get_ftq_pc_1_ftq_idx ? pcs_16 : _GEN_3858; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3860 = 5'h11 == io_get_ftq_pc_1_ftq_idx ? pcs_17 : _GEN_3859; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3861 = 5'h12 == io_get_ftq_pc_1_ftq_idx ? pcs_18 : _GEN_3860; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3862 = 5'h13 == io_get_ftq_pc_1_ftq_idx ? pcs_19 : _GEN_3861; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3863 = 5'h14 == io_get_ftq_pc_1_ftq_idx ? pcs_20 : _GEN_3862; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3864 = 5'h15 == io_get_ftq_pc_1_ftq_idx ? pcs_21 : _GEN_3863; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3865 = 5'h16 == io_get_ftq_pc_1_ftq_idx ? pcs_22 : _GEN_3864; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3866 = 5'h17 == io_get_ftq_pc_1_ftq_idx ? pcs_23 : _GEN_3865; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3867 = 5'h18 == io_get_ftq_pc_1_ftq_idx ? pcs_24 : _GEN_3866; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3868 = 5'h19 == io_get_ftq_pc_1_ftq_idx ? pcs_25 : _GEN_3867; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3869 = 5'h1a == io_get_ftq_pc_1_ftq_idx ? pcs_26 : _GEN_3868; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  wire [39:0] _GEN_3870 = 5'h1b == io_get_ftq_pc_1_ftq_idx ? pcs_27 : _GEN_3869; // @[fetch-target-queue.scala 356:42 fetch-target-queue.scala 356:42]
  reg [39:0] REG_24; // @[fetch-target-queue.scala 357:42]
  reg  REG_25; // @[fetch-target-queue.scala 358:42]
  reg [39:0] REG_26; // @[fetch-target-queue.scala 359:42]
  reg [39:0] REG_27; // @[fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3908 = 5'h1 == io_debug_ftq_idx_0 ? pcs_1 : pcs_0; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3909 = 5'h2 == io_debug_ftq_idx_0 ? pcs_2 : _GEN_3908; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3910 = 5'h3 == io_debug_ftq_idx_0 ? pcs_3 : _GEN_3909; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3911 = 5'h4 == io_debug_ftq_idx_0 ? pcs_4 : _GEN_3910; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3912 = 5'h5 == io_debug_ftq_idx_0 ? pcs_5 : _GEN_3911; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3913 = 5'h6 == io_debug_ftq_idx_0 ? pcs_6 : _GEN_3912; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3914 = 5'h7 == io_debug_ftq_idx_0 ? pcs_7 : _GEN_3913; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3915 = 5'h8 == io_debug_ftq_idx_0 ? pcs_8 : _GEN_3914; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3916 = 5'h9 == io_debug_ftq_idx_0 ? pcs_9 : _GEN_3915; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3917 = 5'ha == io_debug_ftq_idx_0 ? pcs_10 : _GEN_3916; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3918 = 5'hb == io_debug_ftq_idx_0 ? pcs_11 : _GEN_3917; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3919 = 5'hc == io_debug_ftq_idx_0 ? pcs_12 : _GEN_3918; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3920 = 5'hd == io_debug_ftq_idx_0 ? pcs_13 : _GEN_3919; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3921 = 5'he == io_debug_ftq_idx_0 ? pcs_14 : _GEN_3920; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3922 = 5'hf == io_debug_ftq_idx_0 ? pcs_15 : _GEN_3921; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3923 = 5'h10 == io_debug_ftq_idx_0 ? pcs_16 : _GEN_3922; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3924 = 5'h11 == io_debug_ftq_idx_0 ? pcs_17 : _GEN_3923; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3925 = 5'h12 == io_debug_ftq_idx_0 ? pcs_18 : _GEN_3924; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3926 = 5'h13 == io_debug_ftq_idx_0 ? pcs_19 : _GEN_3925; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3927 = 5'h14 == io_debug_ftq_idx_0 ? pcs_20 : _GEN_3926; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3928 = 5'h15 == io_debug_ftq_idx_0 ? pcs_21 : _GEN_3927; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3929 = 5'h16 == io_debug_ftq_idx_0 ? pcs_22 : _GEN_3928; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3930 = 5'h17 == io_debug_ftq_idx_0 ? pcs_23 : _GEN_3929; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3931 = 5'h18 == io_debug_ftq_idx_0 ? pcs_24 : _GEN_3930; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3932 = 5'h19 == io_debug_ftq_idx_0 ? pcs_25 : _GEN_3931; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3933 = 5'h1a == io_debug_ftq_idx_0 ? pcs_26 : _GEN_3932; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3934 = 5'h1b == io_debug_ftq_idx_0 ? pcs_27 : _GEN_3933; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  reg [39:0] REG_28; // @[fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3940 = 5'h1 == io_debug_ftq_idx_1 ? pcs_1 : pcs_0; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3941 = 5'h2 == io_debug_ftq_idx_1 ? pcs_2 : _GEN_3940; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3942 = 5'h3 == io_debug_ftq_idx_1 ? pcs_3 : _GEN_3941; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3943 = 5'h4 == io_debug_ftq_idx_1 ? pcs_4 : _GEN_3942; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3944 = 5'h5 == io_debug_ftq_idx_1 ? pcs_5 : _GEN_3943; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3945 = 5'h6 == io_debug_ftq_idx_1 ? pcs_6 : _GEN_3944; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3946 = 5'h7 == io_debug_ftq_idx_1 ? pcs_7 : _GEN_3945; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3947 = 5'h8 == io_debug_ftq_idx_1 ? pcs_8 : _GEN_3946; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3948 = 5'h9 == io_debug_ftq_idx_1 ? pcs_9 : _GEN_3947; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3949 = 5'ha == io_debug_ftq_idx_1 ? pcs_10 : _GEN_3948; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3950 = 5'hb == io_debug_ftq_idx_1 ? pcs_11 : _GEN_3949; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3951 = 5'hc == io_debug_ftq_idx_1 ? pcs_12 : _GEN_3950; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3952 = 5'hd == io_debug_ftq_idx_1 ? pcs_13 : _GEN_3951; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3953 = 5'he == io_debug_ftq_idx_1 ? pcs_14 : _GEN_3952; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3954 = 5'hf == io_debug_ftq_idx_1 ? pcs_15 : _GEN_3953; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3955 = 5'h10 == io_debug_ftq_idx_1 ? pcs_16 : _GEN_3954; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3956 = 5'h11 == io_debug_ftq_idx_1 ? pcs_17 : _GEN_3955; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3957 = 5'h12 == io_debug_ftq_idx_1 ? pcs_18 : _GEN_3956; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3958 = 5'h13 == io_debug_ftq_idx_1 ? pcs_19 : _GEN_3957; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3959 = 5'h14 == io_debug_ftq_idx_1 ? pcs_20 : _GEN_3958; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3960 = 5'h15 == io_debug_ftq_idx_1 ? pcs_21 : _GEN_3959; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3961 = 5'h16 == io_debug_ftq_idx_1 ? pcs_22 : _GEN_3960; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3962 = 5'h17 == io_debug_ftq_idx_1 ? pcs_23 : _GEN_3961; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3963 = 5'h18 == io_debug_ftq_idx_1 ? pcs_24 : _GEN_3962; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3964 = 5'h19 == io_debug_ftq_idx_1 ? pcs_25 : _GEN_3963; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3965 = 5'h1a == io_debug_ftq_idx_1 ? pcs_26 : _GEN_3964; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  wire [39:0] _GEN_3966 = 5'h1b == io_debug_ftq_idx_1 ? pcs_27 : _GEN_3965; // @[fetch-target-queue.scala 363:36 fetch-target-queue.scala 363:36]
  assign meta_0_bpd_meta_addr = meta_0_bpd_meta_addr_pipe_0;
  assign meta_0_bpd_meta_data = meta_0[meta_0_bpd_meta_addr]; // @[fetch-target-queue.scala 142:29]
  assign meta_0_MPORT_2_data = io_enq_bits_bpd_meta_0;
  assign meta_0_MPORT_2_addr = enq_ptr;
  assign meta_0_MPORT_2_mask = 1'h1;
  assign meta_0_MPORT_2_en = io_enq_ready & io_enq_valid;
  assign ghist_0_old_history_bpd_ghist_addr = ghist_0_old_history_bpd_ghist_addr_pipe_0;
  assign ghist_0_old_history_bpd_ghist_data = ghist_0_old_history[ghist_0_old_history_bpd_ghist_addr]; // @[fetch-target-queue.scala 144:43]
  assign ghist_0_old_history_MPORT_data = io_enq_bits_ghist_current_saw_branch_not_taken ? io_enq_bits_ghist_old_history
     : _T_38[63:0];
  assign ghist_0_old_history_MPORT_addr = enq_ptr;
  assign ghist_0_old_history_MPORT_mask = 1'h1;
  assign ghist_0_old_history_MPORT_en = io_enq_ready & io_enq_valid;
  assign ghist_0_current_saw_branch_not_taken_bpd_ghist_addr =
    ghist_0_current_saw_branch_not_taken_bpd_ghist_addr_pipe_0;
  assign ghist_0_current_saw_branch_not_taken_bpd_ghist_data =
    ghist_0_current_saw_branch_not_taken[ghist_0_current_saw_branch_not_taken_bpd_ghist_addr]; // @[fetch-target-queue.scala 144:43]
  assign ghist_0_current_saw_branch_not_taken_MPORT_data = io_enq_bits_ghist_current_saw_branch_not_taken;
  assign ghist_0_current_saw_branch_not_taken_MPORT_addr = enq_ptr;
  assign ghist_0_current_saw_branch_not_taken_MPORT_mask = 1'h1;
  assign ghist_0_current_saw_branch_not_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ghist_0_new_saw_branch_not_taken_bpd_ghist_addr = ghist_0_new_saw_branch_not_taken_bpd_ghist_addr_pipe_0;
  assign ghist_0_new_saw_branch_not_taken_bpd_ghist_data =
    ghist_0_new_saw_branch_not_taken[ghist_0_new_saw_branch_not_taken_bpd_ghist_addr]; // @[fetch-target-queue.scala 144:43]
  assign ghist_0_new_saw_branch_not_taken_MPORT_data = io_enq_bits_ghist_current_saw_branch_not_taken &
    io_enq_bits_ghist_new_saw_branch_not_taken;
  assign ghist_0_new_saw_branch_not_taken_MPORT_addr = enq_ptr;
  assign ghist_0_new_saw_branch_not_taken_MPORT_mask = 1'h1;
  assign ghist_0_new_saw_branch_not_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ghist_0_new_saw_branch_taken_bpd_ghist_addr = ghist_0_new_saw_branch_taken_bpd_ghist_addr_pipe_0;
  assign ghist_0_new_saw_branch_taken_bpd_ghist_data =
    ghist_0_new_saw_branch_taken[ghist_0_new_saw_branch_taken_bpd_ghist_addr]; // @[fetch-target-queue.scala 144:43]
  assign ghist_0_new_saw_branch_taken_MPORT_data = io_enq_bits_ghist_current_saw_branch_not_taken &
    io_enq_bits_ghist_new_saw_branch_taken;
  assign ghist_0_new_saw_branch_taken_MPORT_addr = enq_ptr;
  assign ghist_0_new_saw_branch_taken_MPORT_mask = 1'h1;
  assign ghist_0_new_saw_branch_taken_MPORT_en = io_enq_ready & io_enq_valid;
  assign ghist_0_ras_idx_bpd_ghist_addr = ghist_0_ras_idx_bpd_ghist_addr_pipe_0;
  assign ghist_0_ras_idx_bpd_ghist_data = ghist_0_ras_idx[ghist_0_ras_idx_bpd_ghist_addr]; // @[fetch-target-queue.scala 144:43]
  assign ghist_0_ras_idx_MPORT_data = io_enq_bits_ghist_current_saw_branch_not_taken ? io_enq_bits_ghist_ras_idx : _T_48
    ;
  assign ghist_0_ras_idx_MPORT_addr = enq_ptr;
  assign ghist_0_ras_idx_MPORT_mask = 1'h1;
  assign ghist_0_ras_idx_MPORT_en = io_enq_ready & io_enq_valid;
  assign ghist_1_old_history_MPORT_3_addr = ghist_1_old_history_MPORT_3_addr_pipe_0;
  assign ghist_1_old_history_MPORT_3_data = ghist_1_old_history[ghist_1_old_history_MPORT_3_addr]; // @[fetch-target-queue.scala 144:43]
  assign ghist_1_old_history_MPORT_1_data = io_enq_bits_ghist_current_saw_branch_not_taken ?
    io_enq_bits_ghist_old_history : _T_38[63:0];
  assign ghist_1_old_history_MPORT_1_addr = enq_ptr;
  assign ghist_1_old_history_MPORT_1_mask = 1'h1;
  assign ghist_1_old_history_MPORT_1_en = io_enq_ready & io_enq_valid;
  assign ghist_1_current_saw_branch_not_taken_MPORT_3_addr = ghist_1_current_saw_branch_not_taken_MPORT_3_addr_pipe_0;
  assign ghist_1_current_saw_branch_not_taken_MPORT_3_data =
    ghist_1_current_saw_branch_not_taken[ghist_1_current_saw_branch_not_taken_MPORT_3_addr]; // @[fetch-target-queue.scala 144:43]
  assign ghist_1_current_saw_branch_not_taken_MPORT_1_data = io_enq_bits_ghist_current_saw_branch_not_taken;
  assign ghist_1_current_saw_branch_not_taken_MPORT_1_addr = enq_ptr;
  assign ghist_1_current_saw_branch_not_taken_MPORT_1_mask = 1'h1;
  assign ghist_1_current_saw_branch_not_taken_MPORT_1_en = io_enq_ready & io_enq_valid;
  assign ghist_1_new_saw_branch_not_taken_MPORT_3_addr = ghist_1_new_saw_branch_not_taken_MPORT_3_addr_pipe_0;
  assign ghist_1_new_saw_branch_not_taken_MPORT_3_data =
    ghist_1_new_saw_branch_not_taken[ghist_1_new_saw_branch_not_taken_MPORT_3_addr]; // @[fetch-target-queue.scala 144:43]
  assign ghist_1_new_saw_branch_not_taken_MPORT_1_data = io_enq_bits_ghist_current_saw_branch_not_taken &
    io_enq_bits_ghist_new_saw_branch_not_taken;
  assign ghist_1_new_saw_branch_not_taken_MPORT_1_addr = enq_ptr;
  assign ghist_1_new_saw_branch_not_taken_MPORT_1_mask = 1'h1;
  assign ghist_1_new_saw_branch_not_taken_MPORT_1_en = io_enq_ready & io_enq_valid;
  assign ghist_1_new_saw_branch_taken_MPORT_3_addr = ghist_1_new_saw_branch_taken_MPORT_3_addr_pipe_0;
  assign ghist_1_new_saw_branch_taken_MPORT_3_data =
    ghist_1_new_saw_branch_taken[ghist_1_new_saw_branch_taken_MPORT_3_addr]; // @[fetch-target-queue.scala 144:43]
  assign ghist_1_new_saw_branch_taken_MPORT_1_data = io_enq_bits_ghist_current_saw_branch_not_taken &
    io_enq_bits_ghist_new_saw_branch_taken;
  assign ghist_1_new_saw_branch_taken_MPORT_1_addr = enq_ptr;
  assign ghist_1_new_saw_branch_taken_MPORT_1_mask = 1'h1;
  assign ghist_1_new_saw_branch_taken_MPORT_1_en = io_enq_ready & io_enq_valid;
  assign ghist_1_ras_idx_MPORT_3_addr = ghist_1_ras_idx_MPORT_3_addr_pipe_0;
  assign ghist_1_ras_idx_MPORT_3_data = ghist_1_ras_idx[ghist_1_ras_idx_MPORT_3_addr]; // @[fetch-target-queue.scala 144:43]
  assign ghist_1_ras_idx_MPORT_1_data = io_enq_bits_ghist_current_saw_branch_not_taken ? io_enq_bits_ghist_ras_idx :
    _T_48;
  assign ghist_1_ras_idx_MPORT_1_addr = enq_ptr;
  assign ghist_1_ras_idx_MPORT_1_mask = 1'h1;
  assign ghist_1_ras_idx_MPORT_1_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = REG_12; // @[fetch-target-queue.scala 308:16]
  assign io_enq_idx = enq_ptr; // @[fetch-target-queue.scala 204:14]
  assign io_get_ftq_pc_0_entry_cfi_idx_valid = REG_17_cfi_idx_valid; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_entry_cfi_idx_bits = REG_17_cfi_idx_bits; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_entry_cfi_taken = REG_17_cfi_taken; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_entry_cfi_mispredicted = REG_17_cfi_mispredicted; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_entry_cfi_type = REG_17_cfi_type; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_entry_br_mask = REG_17_br_mask; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_entry_cfi_is_call = REG_17_cfi_is_call; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_entry_cfi_is_ret = REG_17_cfi_is_ret; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_entry_cfi_npc_plus4 = REG_17_cfi_npc_plus4; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_entry_ras_top = REG_17_ras_top; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_entry_ras_idx = REG_17_ras_idx; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_entry_start_bank = REG_17_start_bank; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_0_ghist_old_history = 64'h0;
  assign io_get_ftq_pc_0_ghist_current_saw_branch_not_taken = 1'h0;
  assign io_get_ftq_pc_0_ghist_new_saw_branch_not_taken = 1'h0;
  assign io_get_ftq_pc_0_ghist_new_saw_branch_taken = 1'h0;
  assign io_get_ftq_pc_0_ghist_ras_idx = 5'h0;
  assign io_get_ftq_pc_0_pc = REG_18; // @[fetch-target-queue.scala 356:32]
  assign io_get_ftq_pc_0_com_pc = REG_21; // @[fetch-target-queue.scala 359:32]
  assign io_get_ftq_pc_0_next_val = REG_20; // @[fetch-target-queue.scala 358:32]
  assign io_get_ftq_pc_0_next_pc = REG_19; // @[fetch-target-queue.scala 357:32]
  assign io_get_ftq_pc_1_entry_cfi_idx_valid = REG_22_cfi_idx_valid; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_entry_cfi_idx_bits = REG_22_cfi_idx_bits; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_entry_cfi_taken = REG_22_cfi_taken; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_entry_cfi_mispredicted = REG_22_cfi_mispredicted; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_entry_cfi_type = REG_22_cfi_type; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_entry_br_mask = REG_22_br_mask; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_entry_cfi_is_call = REG_22_cfi_is_call; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_entry_cfi_is_ret = REG_22_cfi_is_ret; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_entry_cfi_npc_plus4 = REG_22_cfi_npc_plus4; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_entry_ras_top = REG_22_ras_top; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_entry_ras_idx = REG_22_ras_idx; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_entry_start_bank = REG_22_start_bank; // @[fetch-target-queue.scala 351:32]
  assign io_get_ftq_pc_1_ghist_old_history = ghist_1_old_history_MPORT_3_data; // @[fetch-target-queue.scala 353:32]
  assign io_get_ftq_pc_1_ghist_current_saw_branch_not_taken = ghist_1_current_saw_branch_not_taken_MPORT_3_data; // @[fetch-target-queue.scala 353:32]
  assign io_get_ftq_pc_1_ghist_new_saw_branch_not_taken = ghist_1_new_saw_branch_not_taken_MPORT_3_data; // @[fetch-target-queue.scala 353:32]
  assign io_get_ftq_pc_1_ghist_new_saw_branch_taken = ghist_1_new_saw_branch_taken_MPORT_3_data; // @[fetch-target-queue.scala 353:32]
  assign io_get_ftq_pc_1_ghist_ras_idx = ghist_1_ras_idx_MPORT_3_data; // @[fetch-target-queue.scala 353:32]
  assign io_get_ftq_pc_1_pc = REG_23; // @[fetch-target-queue.scala 356:32]
  assign io_get_ftq_pc_1_com_pc = REG_26; // @[fetch-target-queue.scala 359:32]
  assign io_get_ftq_pc_1_next_val = REG_25; // @[fetch-target-queue.scala 358:32]
  assign io_get_ftq_pc_1_next_pc = REG_24; // @[fetch-target-queue.scala 357:32]
  assign io_debug_fetch_pc_0 = REG_27; // @[fetch-target-queue.scala 363:26]
  assign io_debug_fetch_pc_1 = REG_28; // @[fetch-target-queue.scala 363:26]
  assign io_bpdupdate_valid = REG_8 & _T_103; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 282:24 fetch-target-queue.scala 206:22]
  assign io_bpdupdate_bits_is_mispredict_update = REG_10; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 285:44]
  assign io_bpdupdate_bits_is_repair_update = REG_11; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 286:44]
  assign io_bpdupdate_bits_btb_mispredicts = 4'h0; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 288:39]
  assign io_bpdupdate_bits_pc = bpd_pc; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 287:31]
  assign io_bpdupdate_bits_br_mask = bpd_entry_cfi_idx_valid ? _T_112 : bpd_entry_br_mask; // @[fetch-target-queue.scala 289:37]
  assign io_bpdupdate_bits_cfi_idx_valid = bpd_entry_cfi_idx_valid; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 291:31]
  assign io_bpdupdate_bits_cfi_idx_bits = bpd_entry_cfi_idx_bits; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 291:31]
  assign io_bpdupdate_bits_cfi_taken = bpd_entry_cfi_taken; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 293:34]
  assign io_bpdupdate_bits_cfi_mispredicted = bpd_entry_cfi_mispredicted; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 292:40]
  assign io_bpdupdate_bits_cfi_is_br = _T_114[0]; // @[fetch-target-queue.scala 295:54]
  assign io_bpdupdate_bits_cfi_is_jal = bpd_entry_cfi_type == 3'h2 | bpd_entry_cfi_type == 3'h3; // @[fetch-target-queue.scala 296:68]
  assign io_bpdupdate_bits_cfi_is_jalr = 1'h0;
  assign io_bpdupdate_bits_ghist_old_history = ghist_0_old_history_bpd_ghist_data; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 297:34]
  assign io_bpdupdate_bits_ghist_current_saw_branch_not_taken = ghist_0_current_saw_branch_not_taken_bpd_ghist_data; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 297:34]
  assign io_bpdupdate_bits_ghist_new_saw_branch_not_taken = ghist_0_new_saw_branch_not_taken_bpd_ghist_data; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 297:34]
  assign io_bpdupdate_bits_ghist_new_saw_branch_taken = ghist_0_new_saw_branch_taken_bpd_ghist_data; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 297:34]
  assign io_bpdupdate_bits_ghist_ras_idx = ghist_0_ras_idx_bpd_ghist_data; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 297:34]
  assign io_bpdupdate_bits_lhist_0 = 1'h0; // @[fetch-target-queue.scala 239:12 fetch-target-queue.scala 239:12]
  assign io_bpdupdate_bits_target = bpd_target; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 294:34]
  assign io_bpdupdate_bits_meta_0 = meta_0_bpd_meta_data; // @[fetch-target-queue.scala 278:80 fetch-target-queue.scala 299:34]
  assign io_ras_update = REG; // @[fetch-target-queue.scala 222:21]
  assign io_ras_update_idx = REG_2; // @[fetch-target-queue.scala 224:21]
  assign io_ras_update_pc = REG_1; // @[fetch-target-queue.scala 223:21]
  always @(posedge clock) begin
    if(meta_0_MPORT_2_en & meta_0_MPORT_2_mask) begin
      meta_0[meta_0_MPORT_2_addr] <= meta_0_MPORT_2_data; // @[fetch-target-queue.scala 142:29]
    end
    if (io_redirect_valid) begin
      meta_0_bpd_meta_addr_pipe_0 <= io_redirect_bits;
    end else if (bpd_update_repair | bpd_update_mispredict) begin // @[fetch-target-queue.scala 233:8]
      meta_0_bpd_meta_addr_pipe_0 <= bpd_repair_idx;
    end else begin
      meta_0_bpd_meta_addr_pipe_0 <= bpd_ptr;
    end
    if(ghist_0_old_history_MPORT_en & ghist_0_old_history_MPORT_mask) begin
      ghist_0_old_history[ghist_0_old_history_MPORT_addr] <= ghist_0_old_history_MPORT_data; // @[fetch-target-queue.scala 144:43]
    end
    if (io_redirect_valid) begin
      ghist_0_old_history_bpd_ghist_addr_pipe_0 <= io_redirect_bits;
    end else if (bpd_update_repair | bpd_update_mispredict) begin // @[fetch-target-queue.scala 233:8]
      ghist_0_old_history_bpd_ghist_addr_pipe_0 <= bpd_repair_idx;
    end else begin
      ghist_0_old_history_bpd_ghist_addr_pipe_0 <= bpd_ptr;
    end
    if(ghist_0_current_saw_branch_not_taken_MPORT_en & ghist_0_current_saw_branch_not_taken_MPORT_mask) begin
      ghist_0_current_saw_branch_not_taken[ghist_0_current_saw_branch_not_taken_MPORT_addr] <=
        ghist_0_current_saw_branch_not_taken_MPORT_data; // @[fetch-target-queue.scala 144:43]
    end
    if (io_redirect_valid) begin
      ghist_0_current_saw_branch_not_taken_bpd_ghist_addr_pipe_0 <= io_redirect_bits;
    end else if (bpd_update_repair | bpd_update_mispredict) begin // @[fetch-target-queue.scala 233:8]
      ghist_0_current_saw_branch_not_taken_bpd_ghist_addr_pipe_0 <= bpd_repair_idx;
    end else begin
      ghist_0_current_saw_branch_not_taken_bpd_ghist_addr_pipe_0 <= bpd_ptr;
    end
    if(ghist_0_new_saw_branch_not_taken_MPORT_en & ghist_0_new_saw_branch_not_taken_MPORT_mask) begin
      ghist_0_new_saw_branch_not_taken[ghist_0_new_saw_branch_not_taken_MPORT_addr] <=
        ghist_0_new_saw_branch_not_taken_MPORT_data; // @[fetch-target-queue.scala 144:43]
    end
    if (io_redirect_valid) begin
      ghist_0_new_saw_branch_not_taken_bpd_ghist_addr_pipe_0 <= io_redirect_bits;
    end else if (bpd_update_repair | bpd_update_mispredict) begin // @[fetch-target-queue.scala 233:8]
      ghist_0_new_saw_branch_not_taken_bpd_ghist_addr_pipe_0 <= bpd_repair_idx;
    end else begin
      ghist_0_new_saw_branch_not_taken_bpd_ghist_addr_pipe_0 <= bpd_ptr;
    end
    if(ghist_0_new_saw_branch_taken_MPORT_en & ghist_0_new_saw_branch_taken_MPORT_mask) begin
      ghist_0_new_saw_branch_taken[ghist_0_new_saw_branch_taken_MPORT_addr] <= ghist_0_new_saw_branch_taken_MPORT_data; // @[fetch-target-queue.scala 144:43]
    end
    if (io_redirect_valid) begin
      ghist_0_new_saw_branch_taken_bpd_ghist_addr_pipe_0 <= io_redirect_bits;
    end else if (bpd_update_repair | bpd_update_mispredict) begin // @[fetch-target-queue.scala 233:8]
      ghist_0_new_saw_branch_taken_bpd_ghist_addr_pipe_0 <= bpd_repair_idx;
    end else begin
      ghist_0_new_saw_branch_taken_bpd_ghist_addr_pipe_0 <= bpd_ptr;
    end
    if(ghist_0_ras_idx_MPORT_en & ghist_0_ras_idx_MPORT_mask) begin
      ghist_0_ras_idx[ghist_0_ras_idx_MPORT_addr] <= ghist_0_ras_idx_MPORT_data; // @[fetch-target-queue.scala 144:43]
    end
    if (io_redirect_valid) begin
      ghist_0_ras_idx_bpd_ghist_addr_pipe_0 <= io_redirect_bits;
    end else if (bpd_update_repair | bpd_update_mispredict) begin // @[fetch-target-queue.scala 233:8]
      ghist_0_ras_idx_bpd_ghist_addr_pipe_0 <= bpd_repair_idx;
    end else begin
      ghist_0_ras_idx_bpd_ghist_addr_pipe_0 <= bpd_ptr;
    end
    if(ghist_1_old_history_MPORT_1_en & ghist_1_old_history_MPORT_1_mask) begin
      ghist_1_old_history[ghist_1_old_history_MPORT_1_addr] <= ghist_1_old_history_MPORT_1_data; // @[fetch-target-queue.scala 144:43]
    end
    ghist_1_old_history_MPORT_3_addr_pipe_0 <= io_get_ftq_pc_1_ftq_idx;
    if(ghist_1_current_saw_branch_not_taken_MPORT_1_en & ghist_1_current_saw_branch_not_taken_MPORT_1_mask) begin
      ghist_1_current_saw_branch_not_taken[ghist_1_current_saw_branch_not_taken_MPORT_1_addr] <=
        ghist_1_current_saw_branch_not_taken_MPORT_1_data; // @[fetch-target-queue.scala 144:43]
    end
    ghist_1_current_saw_branch_not_taken_MPORT_3_addr_pipe_0 <= io_get_ftq_pc_1_ftq_idx;
    if(ghist_1_new_saw_branch_not_taken_MPORT_1_en & ghist_1_new_saw_branch_not_taken_MPORT_1_mask) begin
      ghist_1_new_saw_branch_not_taken[ghist_1_new_saw_branch_not_taken_MPORT_1_addr] <=
        ghist_1_new_saw_branch_not_taken_MPORT_1_data; // @[fetch-target-queue.scala 144:43]
    end
    ghist_1_new_saw_branch_not_taken_MPORT_3_addr_pipe_0 <= io_get_ftq_pc_1_ftq_idx;
    if(ghist_1_new_saw_branch_taken_MPORT_1_en & ghist_1_new_saw_branch_taken_MPORT_1_mask) begin
      ghist_1_new_saw_branch_taken[ghist_1_new_saw_branch_taken_MPORT_1_addr] <=
        ghist_1_new_saw_branch_taken_MPORT_1_data; // @[fetch-target-queue.scala 144:43]
    end
    ghist_1_new_saw_branch_taken_MPORT_3_addr_pipe_0 <= io_get_ftq_pc_1_ftq_idx;
    if(ghist_1_ras_idx_MPORT_1_en & ghist_1_ras_idx_MPORT_1_mask) begin
      ghist_1_ras_idx[ghist_1_ras_idx_MPORT_1_addr] <= ghist_1_ras_idx_MPORT_1_data; // @[fetch-target-queue.scala 144:43]
    end
    ghist_1_ras_idx_MPORT_3_addr_pipe_0 <= io_get_ftq_pc_1_ftq_idx;
    if (reset) begin // @[fetch-target-queue.scala 133:27]
      bpd_ptr <= 5'h0; // @[fetch-target-queue.scala 133:27]
    end else if (do_commit_update) begin // @[fetch-target-queue.scala 304:27]
      bpd_ptr <= _T_84; // @[fetch-target-queue.scala 305:13]
    end
    if (reset) begin // @[fetch-target-queue.scala 134:27]
      deq_ptr <= 5'h0; // @[fetch-target-queue.scala 134:27]
    end else if (io_deq_valid) begin // @[fetch-target-queue.scala 209:23]
      deq_ptr <= io_deq_bits; // @[fetch-target-queue.scala 210:13]
    end
    if (reset) begin // @[fetch-target-queue.scala 135:27]
      enq_ptr <= 5'h1; // @[fetch-target-queue.scala 135:27]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      enq_ptr <= _T_125; // @[fetch-target-queue.scala 315:16]
    end else if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      enq_ptr <= _T_1; // @[fetch-target-queue.scala 201:13]
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h0 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_0 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h1 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_1 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h2 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_2 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h3 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_3 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h4 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_4 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h5 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_5 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h6 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_6 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h7 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_7 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h8 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_8 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h9 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_9 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'ha == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_10 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'hb == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_11 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'hc == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_12 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'hd == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_13 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'he == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_14 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'hf == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_15 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h10 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_16 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h11 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_17 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h12 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_18 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h13 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_19 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h14 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_20 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h15 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_21 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h16 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_22 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h17 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_23 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h18 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_24 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h19 == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_25 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h1a == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_26 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h1b == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_27 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h1c == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_28 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h1d == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_29 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h1e == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_30 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (do_enq) begin // @[fetch-target-queue.scala 158:17]
      if (5'h1f == enq_ptr) begin // @[fetch-target-queue.scala 160:28]
        pcs_31 <= io_enq_bits_pc; // @[fetch-target-queue.scala 160:28]
      end
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_cfi_idx_valid <= _GEN_810;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_cfi_idx_valid <= _GEN_810;
      end
    end else begin
      ram_0_cfi_idx_valid <= _GEN_810;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_cfi_idx_bits <= _GEN_778;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_cfi_idx_bits <= _GEN_778;
      end
    end else begin
      ram_0_cfi_idx_bits <= _GEN_778;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_cfi_taken <= _GEN_746;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_cfi_taken <= _GEN_746;
      end
    end else begin
      ram_0_cfi_taken <= _GEN_746;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_cfi_mispredicted <= _GEN_714;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_cfi_mispredicted <= _GEN_714;
      end
    end else begin
      ram_0_cfi_mispredicted <= _GEN_714;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_cfi_type <= _GEN_682;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_cfi_type <= _GEN_682;
      end
    end else begin
      ram_0_cfi_type <= _GEN_682;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_br_mask <= _GEN_650;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_br_mask <= _GEN_650;
      end
    end else begin
      ram_0_br_mask <= _GEN_650;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_cfi_is_call <= _GEN_618;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_cfi_is_call <= _GEN_618;
      end
    end else begin
      ram_0_cfi_is_call <= _GEN_618;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_cfi_is_ret <= _GEN_586;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_cfi_is_ret <= _GEN_586;
      end
    end else begin
      ram_0_cfi_is_ret <= _GEN_586;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_cfi_npc_plus4 <= _GEN_554;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_cfi_npc_plus4 <= _GEN_554;
      end
    end else begin
      ram_0_cfi_npc_plus4 <= _GEN_554;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_ras_top <= _GEN_522;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_ras_top <= _GEN_522;
      end
    end else begin
      ram_0_ras_top <= _GEN_522;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_ras_idx <= _GEN_490;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_ras_idx <= _GEN_490;
      end
    end else begin
      ram_0_ras_idx <= _GEN_490;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_0_start_bank <= _GEN_458;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h0 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_0_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_0_start_bank <= _GEN_458;
      end
    end else begin
      ram_0_start_bank <= _GEN_458;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_cfi_idx_valid <= _GEN_811;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_cfi_idx_valid <= _GEN_811;
      end
    end else begin
      ram_1_cfi_idx_valid <= _GEN_811;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_cfi_idx_bits <= _GEN_779;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_cfi_idx_bits <= _GEN_779;
      end
    end else begin
      ram_1_cfi_idx_bits <= _GEN_779;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_cfi_taken <= _GEN_747;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_cfi_taken <= _GEN_747;
      end
    end else begin
      ram_1_cfi_taken <= _GEN_747;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_cfi_mispredicted <= _GEN_715;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_cfi_mispredicted <= _GEN_715;
      end
    end else begin
      ram_1_cfi_mispredicted <= _GEN_715;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_cfi_type <= _GEN_683;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_cfi_type <= _GEN_683;
      end
    end else begin
      ram_1_cfi_type <= _GEN_683;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_br_mask <= _GEN_651;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_br_mask <= _GEN_651;
      end
    end else begin
      ram_1_br_mask <= _GEN_651;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_cfi_is_call <= _GEN_619;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_cfi_is_call <= _GEN_619;
      end
    end else begin
      ram_1_cfi_is_call <= _GEN_619;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_cfi_is_ret <= _GEN_587;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_cfi_is_ret <= _GEN_587;
      end
    end else begin
      ram_1_cfi_is_ret <= _GEN_587;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_cfi_npc_plus4 <= _GEN_555;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_cfi_npc_plus4 <= _GEN_555;
      end
    end else begin
      ram_1_cfi_npc_plus4 <= _GEN_555;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_ras_top <= _GEN_523;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_ras_top <= _GEN_523;
      end
    end else begin
      ram_1_ras_top <= _GEN_523;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_ras_idx <= _GEN_491;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_ras_idx <= _GEN_491;
      end
    end else begin
      ram_1_ras_idx <= _GEN_491;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_1_start_bank <= _GEN_459;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_1_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_1_start_bank <= _GEN_459;
      end
    end else begin
      ram_1_start_bank <= _GEN_459;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_cfi_idx_valid <= _GEN_812;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_cfi_idx_valid <= _GEN_812;
      end
    end else begin
      ram_2_cfi_idx_valid <= _GEN_812;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_cfi_idx_bits <= _GEN_780;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_cfi_idx_bits <= _GEN_780;
      end
    end else begin
      ram_2_cfi_idx_bits <= _GEN_780;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_cfi_taken <= _GEN_748;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_cfi_taken <= _GEN_748;
      end
    end else begin
      ram_2_cfi_taken <= _GEN_748;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_cfi_mispredicted <= _GEN_716;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_cfi_mispredicted <= _GEN_716;
      end
    end else begin
      ram_2_cfi_mispredicted <= _GEN_716;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_cfi_type <= _GEN_684;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_cfi_type <= _GEN_684;
      end
    end else begin
      ram_2_cfi_type <= _GEN_684;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_br_mask <= _GEN_652;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_br_mask <= _GEN_652;
      end
    end else begin
      ram_2_br_mask <= _GEN_652;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_cfi_is_call <= _GEN_620;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_cfi_is_call <= _GEN_620;
      end
    end else begin
      ram_2_cfi_is_call <= _GEN_620;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_cfi_is_ret <= _GEN_588;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_cfi_is_ret <= _GEN_588;
      end
    end else begin
      ram_2_cfi_is_ret <= _GEN_588;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_cfi_npc_plus4 <= _GEN_556;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_cfi_npc_plus4 <= _GEN_556;
      end
    end else begin
      ram_2_cfi_npc_plus4 <= _GEN_556;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_ras_top <= _GEN_524;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_ras_top <= _GEN_524;
      end
    end else begin
      ram_2_ras_top <= _GEN_524;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_ras_idx <= _GEN_492;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_ras_idx <= _GEN_492;
      end
    end else begin
      ram_2_ras_idx <= _GEN_492;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_2_start_bank <= _GEN_460;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h2 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_2_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_2_start_bank <= _GEN_460;
      end
    end else begin
      ram_2_start_bank <= _GEN_460;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_cfi_idx_valid <= _GEN_813;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_cfi_idx_valid <= _GEN_813;
      end
    end else begin
      ram_3_cfi_idx_valid <= _GEN_813;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_cfi_idx_bits <= _GEN_781;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_cfi_idx_bits <= _GEN_781;
      end
    end else begin
      ram_3_cfi_idx_bits <= _GEN_781;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_cfi_taken <= _GEN_749;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_cfi_taken <= _GEN_749;
      end
    end else begin
      ram_3_cfi_taken <= _GEN_749;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_cfi_mispredicted <= _GEN_717;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_cfi_mispredicted <= _GEN_717;
      end
    end else begin
      ram_3_cfi_mispredicted <= _GEN_717;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_cfi_type <= _GEN_685;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_cfi_type <= _GEN_685;
      end
    end else begin
      ram_3_cfi_type <= _GEN_685;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_br_mask <= _GEN_653;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_br_mask <= _GEN_653;
      end
    end else begin
      ram_3_br_mask <= _GEN_653;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_cfi_is_call <= _GEN_621;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_cfi_is_call <= _GEN_621;
      end
    end else begin
      ram_3_cfi_is_call <= _GEN_621;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_cfi_is_ret <= _GEN_589;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_cfi_is_ret <= _GEN_589;
      end
    end else begin
      ram_3_cfi_is_ret <= _GEN_589;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_cfi_npc_plus4 <= _GEN_557;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_cfi_npc_plus4 <= _GEN_557;
      end
    end else begin
      ram_3_cfi_npc_plus4 <= _GEN_557;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_ras_top <= _GEN_525;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_ras_top <= _GEN_525;
      end
    end else begin
      ram_3_ras_top <= _GEN_525;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_ras_idx <= _GEN_493;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_ras_idx <= _GEN_493;
      end
    end else begin
      ram_3_ras_idx <= _GEN_493;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_3_start_bank <= _GEN_461;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h3 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_3_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_3_start_bank <= _GEN_461;
      end
    end else begin
      ram_3_start_bank <= _GEN_461;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_cfi_idx_valid <= _GEN_814;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_cfi_idx_valid <= _GEN_814;
      end
    end else begin
      ram_4_cfi_idx_valid <= _GEN_814;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_cfi_idx_bits <= _GEN_782;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_cfi_idx_bits <= _GEN_782;
      end
    end else begin
      ram_4_cfi_idx_bits <= _GEN_782;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_cfi_taken <= _GEN_750;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_cfi_taken <= _GEN_750;
      end
    end else begin
      ram_4_cfi_taken <= _GEN_750;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_cfi_mispredicted <= _GEN_718;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_cfi_mispredicted <= _GEN_718;
      end
    end else begin
      ram_4_cfi_mispredicted <= _GEN_718;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_cfi_type <= _GEN_686;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_cfi_type <= _GEN_686;
      end
    end else begin
      ram_4_cfi_type <= _GEN_686;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_br_mask <= _GEN_654;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_br_mask <= _GEN_654;
      end
    end else begin
      ram_4_br_mask <= _GEN_654;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_cfi_is_call <= _GEN_622;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_cfi_is_call <= _GEN_622;
      end
    end else begin
      ram_4_cfi_is_call <= _GEN_622;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_cfi_is_ret <= _GEN_590;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_cfi_is_ret <= _GEN_590;
      end
    end else begin
      ram_4_cfi_is_ret <= _GEN_590;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_cfi_npc_plus4 <= _GEN_558;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_cfi_npc_plus4 <= _GEN_558;
      end
    end else begin
      ram_4_cfi_npc_plus4 <= _GEN_558;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_ras_top <= _GEN_526;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_ras_top <= _GEN_526;
      end
    end else begin
      ram_4_ras_top <= _GEN_526;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_ras_idx <= _GEN_494;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_ras_idx <= _GEN_494;
      end
    end else begin
      ram_4_ras_idx <= _GEN_494;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_4_start_bank <= _GEN_462;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h4 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_4_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_4_start_bank <= _GEN_462;
      end
    end else begin
      ram_4_start_bank <= _GEN_462;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_cfi_idx_valid <= _GEN_815;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_cfi_idx_valid <= _GEN_815;
      end
    end else begin
      ram_5_cfi_idx_valid <= _GEN_815;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_cfi_idx_bits <= _GEN_783;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_cfi_idx_bits <= _GEN_783;
      end
    end else begin
      ram_5_cfi_idx_bits <= _GEN_783;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_cfi_taken <= _GEN_751;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_cfi_taken <= _GEN_751;
      end
    end else begin
      ram_5_cfi_taken <= _GEN_751;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_cfi_mispredicted <= _GEN_719;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_cfi_mispredicted <= _GEN_719;
      end
    end else begin
      ram_5_cfi_mispredicted <= _GEN_719;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_cfi_type <= _GEN_687;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_cfi_type <= _GEN_687;
      end
    end else begin
      ram_5_cfi_type <= _GEN_687;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_br_mask <= _GEN_655;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_br_mask <= _GEN_655;
      end
    end else begin
      ram_5_br_mask <= _GEN_655;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_cfi_is_call <= _GEN_623;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_cfi_is_call <= _GEN_623;
      end
    end else begin
      ram_5_cfi_is_call <= _GEN_623;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_cfi_is_ret <= _GEN_591;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_cfi_is_ret <= _GEN_591;
      end
    end else begin
      ram_5_cfi_is_ret <= _GEN_591;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_cfi_npc_plus4 <= _GEN_559;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_cfi_npc_plus4 <= _GEN_559;
      end
    end else begin
      ram_5_cfi_npc_plus4 <= _GEN_559;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_ras_top <= _GEN_527;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_ras_top <= _GEN_527;
      end
    end else begin
      ram_5_ras_top <= _GEN_527;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_ras_idx <= _GEN_495;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_ras_idx <= _GEN_495;
      end
    end else begin
      ram_5_ras_idx <= _GEN_495;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_5_start_bank <= _GEN_463;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h5 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_5_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_5_start_bank <= _GEN_463;
      end
    end else begin
      ram_5_start_bank <= _GEN_463;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_cfi_idx_valid <= _GEN_816;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_cfi_idx_valid <= _GEN_816;
      end
    end else begin
      ram_6_cfi_idx_valid <= _GEN_816;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_cfi_idx_bits <= _GEN_784;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_cfi_idx_bits <= _GEN_784;
      end
    end else begin
      ram_6_cfi_idx_bits <= _GEN_784;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_cfi_taken <= _GEN_752;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_cfi_taken <= _GEN_752;
      end
    end else begin
      ram_6_cfi_taken <= _GEN_752;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_cfi_mispredicted <= _GEN_720;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_cfi_mispredicted <= _GEN_720;
      end
    end else begin
      ram_6_cfi_mispredicted <= _GEN_720;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_cfi_type <= _GEN_688;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_cfi_type <= _GEN_688;
      end
    end else begin
      ram_6_cfi_type <= _GEN_688;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_br_mask <= _GEN_656;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_br_mask <= _GEN_656;
      end
    end else begin
      ram_6_br_mask <= _GEN_656;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_cfi_is_call <= _GEN_624;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_cfi_is_call <= _GEN_624;
      end
    end else begin
      ram_6_cfi_is_call <= _GEN_624;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_cfi_is_ret <= _GEN_592;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_cfi_is_ret <= _GEN_592;
      end
    end else begin
      ram_6_cfi_is_ret <= _GEN_592;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_cfi_npc_plus4 <= _GEN_560;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_cfi_npc_plus4 <= _GEN_560;
      end
    end else begin
      ram_6_cfi_npc_plus4 <= _GEN_560;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_ras_top <= _GEN_528;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_ras_top <= _GEN_528;
      end
    end else begin
      ram_6_ras_top <= _GEN_528;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_ras_idx <= _GEN_496;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_ras_idx <= _GEN_496;
      end
    end else begin
      ram_6_ras_idx <= _GEN_496;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_6_start_bank <= _GEN_464;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h6 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_6_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_6_start_bank <= _GEN_464;
      end
    end else begin
      ram_6_start_bank <= _GEN_464;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_cfi_idx_valid <= _GEN_817;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_cfi_idx_valid <= _GEN_817;
      end
    end else begin
      ram_7_cfi_idx_valid <= _GEN_817;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_cfi_idx_bits <= _GEN_785;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_cfi_idx_bits <= _GEN_785;
      end
    end else begin
      ram_7_cfi_idx_bits <= _GEN_785;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_cfi_taken <= _GEN_753;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_cfi_taken <= _GEN_753;
      end
    end else begin
      ram_7_cfi_taken <= _GEN_753;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_cfi_mispredicted <= _GEN_721;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_cfi_mispredicted <= _GEN_721;
      end
    end else begin
      ram_7_cfi_mispredicted <= _GEN_721;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_cfi_type <= _GEN_689;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_cfi_type <= _GEN_689;
      end
    end else begin
      ram_7_cfi_type <= _GEN_689;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_br_mask <= _GEN_657;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_br_mask <= _GEN_657;
      end
    end else begin
      ram_7_br_mask <= _GEN_657;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_cfi_is_call <= _GEN_625;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_cfi_is_call <= _GEN_625;
      end
    end else begin
      ram_7_cfi_is_call <= _GEN_625;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_cfi_is_ret <= _GEN_593;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_cfi_is_ret <= _GEN_593;
      end
    end else begin
      ram_7_cfi_is_ret <= _GEN_593;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_cfi_npc_plus4 <= _GEN_561;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_cfi_npc_plus4 <= _GEN_561;
      end
    end else begin
      ram_7_cfi_npc_plus4 <= _GEN_561;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_ras_top <= _GEN_529;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_ras_top <= _GEN_529;
      end
    end else begin
      ram_7_ras_top <= _GEN_529;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_ras_idx <= _GEN_497;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_ras_idx <= _GEN_497;
      end
    end else begin
      ram_7_ras_idx <= _GEN_497;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_7_start_bank <= _GEN_465;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h7 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_7_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_7_start_bank <= _GEN_465;
      end
    end else begin
      ram_7_start_bank <= _GEN_465;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_cfi_idx_valid <= _GEN_818;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_cfi_idx_valid <= _GEN_818;
      end
    end else begin
      ram_8_cfi_idx_valid <= _GEN_818;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_cfi_idx_bits <= _GEN_786;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_cfi_idx_bits <= _GEN_786;
      end
    end else begin
      ram_8_cfi_idx_bits <= _GEN_786;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_cfi_taken <= _GEN_754;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_cfi_taken <= _GEN_754;
      end
    end else begin
      ram_8_cfi_taken <= _GEN_754;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_cfi_mispredicted <= _GEN_722;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_cfi_mispredicted <= _GEN_722;
      end
    end else begin
      ram_8_cfi_mispredicted <= _GEN_722;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_cfi_type <= _GEN_690;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_cfi_type <= _GEN_690;
      end
    end else begin
      ram_8_cfi_type <= _GEN_690;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_br_mask <= _GEN_658;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_br_mask <= _GEN_658;
      end
    end else begin
      ram_8_br_mask <= _GEN_658;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_cfi_is_call <= _GEN_626;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_cfi_is_call <= _GEN_626;
      end
    end else begin
      ram_8_cfi_is_call <= _GEN_626;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_cfi_is_ret <= _GEN_594;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_cfi_is_ret <= _GEN_594;
      end
    end else begin
      ram_8_cfi_is_ret <= _GEN_594;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_cfi_npc_plus4 <= _GEN_562;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_cfi_npc_plus4 <= _GEN_562;
      end
    end else begin
      ram_8_cfi_npc_plus4 <= _GEN_562;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_ras_top <= _GEN_530;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_ras_top <= _GEN_530;
      end
    end else begin
      ram_8_ras_top <= _GEN_530;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_ras_idx <= _GEN_498;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_ras_idx <= _GEN_498;
      end
    end else begin
      ram_8_ras_idx <= _GEN_498;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_8_start_bank <= _GEN_466;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h8 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_8_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_8_start_bank <= _GEN_466;
      end
    end else begin
      ram_8_start_bank <= _GEN_466;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_cfi_idx_valid <= _GEN_819;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_cfi_idx_valid <= _GEN_819;
      end
    end else begin
      ram_9_cfi_idx_valid <= _GEN_819;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_cfi_idx_bits <= _GEN_787;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_cfi_idx_bits <= _GEN_787;
      end
    end else begin
      ram_9_cfi_idx_bits <= _GEN_787;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_cfi_taken <= _GEN_755;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_cfi_taken <= _GEN_755;
      end
    end else begin
      ram_9_cfi_taken <= _GEN_755;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_cfi_mispredicted <= _GEN_723;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_cfi_mispredicted <= _GEN_723;
      end
    end else begin
      ram_9_cfi_mispredicted <= _GEN_723;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_cfi_type <= _GEN_691;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_cfi_type <= _GEN_691;
      end
    end else begin
      ram_9_cfi_type <= _GEN_691;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_br_mask <= _GEN_659;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_br_mask <= _GEN_659;
      end
    end else begin
      ram_9_br_mask <= _GEN_659;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_cfi_is_call <= _GEN_627;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_cfi_is_call <= _GEN_627;
      end
    end else begin
      ram_9_cfi_is_call <= _GEN_627;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_cfi_is_ret <= _GEN_595;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_cfi_is_ret <= _GEN_595;
      end
    end else begin
      ram_9_cfi_is_ret <= _GEN_595;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_cfi_npc_plus4 <= _GEN_563;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_cfi_npc_plus4 <= _GEN_563;
      end
    end else begin
      ram_9_cfi_npc_plus4 <= _GEN_563;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_ras_top <= _GEN_531;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_ras_top <= _GEN_531;
      end
    end else begin
      ram_9_ras_top <= _GEN_531;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_ras_idx <= _GEN_499;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_ras_idx <= _GEN_499;
      end
    end else begin
      ram_9_ras_idx <= _GEN_499;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_9_start_bank <= _GEN_467;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h9 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_9_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_9_start_bank <= _GEN_467;
      end
    end else begin
      ram_9_start_bank <= _GEN_467;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_cfi_idx_valid <= _GEN_820;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_cfi_idx_valid <= _GEN_820;
      end
    end else begin
      ram_10_cfi_idx_valid <= _GEN_820;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_cfi_idx_bits <= _GEN_788;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_cfi_idx_bits <= _GEN_788;
      end
    end else begin
      ram_10_cfi_idx_bits <= _GEN_788;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_cfi_taken <= _GEN_756;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_cfi_taken <= _GEN_756;
      end
    end else begin
      ram_10_cfi_taken <= _GEN_756;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_cfi_mispredicted <= _GEN_724;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_cfi_mispredicted <= _GEN_724;
      end
    end else begin
      ram_10_cfi_mispredicted <= _GEN_724;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_cfi_type <= _GEN_692;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_cfi_type <= _GEN_692;
      end
    end else begin
      ram_10_cfi_type <= _GEN_692;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_br_mask <= _GEN_660;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_br_mask <= _GEN_660;
      end
    end else begin
      ram_10_br_mask <= _GEN_660;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_cfi_is_call <= _GEN_628;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_cfi_is_call <= _GEN_628;
      end
    end else begin
      ram_10_cfi_is_call <= _GEN_628;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_cfi_is_ret <= _GEN_596;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_cfi_is_ret <= _GEN_596;
      end
    end else begin
      ram_10_cfi_is_ret <= _GEN_596;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_cfi_npc_plus4 <= _GEN_564;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_cfi_npc_plus4 <= _GEN_564;
      end
    end else begin
      ram_10_cfi_npc_plus4 <= _GEN_564;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_ras_top <= _GEN_532;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_ras_top <= _GEN_532;
      end
    end else begin
      ram_10_ras_top <= _GEN_532;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_ras_idx <= _GEN_500;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_ras_idx <= _GEN_500;
      end
    end else begin
      ram_10_ras_idx <= _GEN_500;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_10_start_bank <= _GEN_468;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'ha == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_10_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_10_start_bank <= _GEN_468;
      end
    end else begin
      ram_10_start_bank <= _GEN_468;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_cfi_idx_valid <= _GEN_821;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_cfi_idx_valid <= _GEN_821;
      end
    end else begin
      ram_11_cfi_idx_valid <= _GEN_821;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_cfi_idx_bits <= _GEN_789;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_cfi_idx_bits <= _GEN_789;
      end
    end else begin
      ram_11_cfi_idx_bits <= _GEN_789;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_cfi_taken <= _GEN_757;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_cfi_taken <= _GEN_757;
      end
    end else begin
      ram_11_cfi_taken <= _GEN_757;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_cfi_mispredicted <= _GEN_725;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_cfi_mispredicted <= _GEN_725;
      end
    end else begin
      ram_11_cfi_mispredicted <= _GEN_725;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_cfi_type <= _GEN_693;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_cfi_type <= _GEN_693;
      end
    end else begin
      ram_11_cfi_type <= _GEN_693;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_br_mask <= _GEN_661;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_br_mask <= _GEN_661;
      end
    end else begin
      ram_11_br_mask <= _GEN_661;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_cfi_is_call <= _GEN_629;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_cfi_is_call <= _GEN_629;
      end
    end else begin
      ram_11_cfi_is_call <= _GEN_629;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_cfi_is_ret <= _GEN_597;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_cfi_is_ret <= _GEN_597;
      end
    end else begin
      ram_11_cfi_is_ret <= _GEN_597;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_cfi_npc_plus4 <= _GEN_565;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_cfi_npc_plus4 <= _GEN_565;
      end
    end else begin
      ram_11_cfi_npc_plus4 <= _GEN_565;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_ras_top <= _GEN_533;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_ras_top <= _GEN_533;
      end
    end else begin
      ram_11_ras_top <= _GEN_533;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_ras_idx <= _GEN_501;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_ras_idx <= _GEN_501;
      end
    end else begin
      ram_11_ras_idx <= _GEN_501;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_11_start_bank <= _GEN_469;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hb == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_11_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_11_start_bank <= _GEN_469;
      end
    end else begin
      ram_11_start_bank <= _GEN_469;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_cfi_idx_valid <= _GEN_822;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_cfi_idx_valid <= _GEN_822;
      end
    end else begin
      ram_12_cfi_idx_valid <= _GEN_822;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_cfi_idx_bits <= _GEN_790;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_cfi_idx_bits <= _GEN_790;
      end
    end else begin
      ram_12_cfi_idx_bits <= _GEN_790;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_cfi_taken <= _GEN_758;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_cfi_taken <= _GEN_758;
      end
    end else begin
      ram_12_cfi_taken <= _GEN_758;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_cfi_mispredicted <= _GEN_726;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_cfi_mispredicted <= _GEN_726;
      end
    end else begin
      ram_12_cfi_mispredicted <= _GEN_726;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_cfi_type <= _GEN_694;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_cfi_type <= _GEN_694;
      end
    end else begin
      ram_12_cfi_type <= _GEN_694;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_br_mask <= _GEN_662;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_br_mask <= _GEN_662;
      end
    end else begin
      ram_12_br_mask <= _GEN_662;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_cfi_is_call <= _GEN_630;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_cfi_is_call <= _GEN_630;
      end
    end else begin
      ram_12_cfi_is_call <= _GEN_630;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_cfi_is_ret <= _GEN_598;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_cfi_is_ret <= _GEN_598;
      end
    end else begin
      ram_12_cfi_is_ret <= _GEN_598;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_cfi_npc_plus4 <= _GEN_566;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_cfi_npc_plus4 <= _GEN_566;
      end
    end else begin
      ram_12_cfi_npc_plus4 <= _GEN_566;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_ras_top <= _GEN_534;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_ras_top <= _GEN_534;
      end
    end else begin
      ram_12_ras_top <= _GEN_534;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_ras_idx <= _GEN_502;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_ras_idx <= _GEN_502;
      end
    end else begin
      ram_12_ras_idx <= _GEN_502;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_12_start_bank <= _GEN_470;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hc == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_12_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_12_start_bank <= _GEN_470;
      end
    end else begin
      ram_12_start_bank <= _GEN_470;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_cfi_idx_valid <= _GEN_823;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_cfi_idx_valid <= _GEN_823;
      end
    end else begin
      ram_13_cfi_idx_valid <= _GEN_823;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_cfi_idx_bits <= _GEN_791;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_cfi_idx_bits <= _GEN_791;
      end
    end else begin
      ram_13_cfi_idx_bits <= _GEN_791;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_cfi_taken <= _GEN_759;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_cfi_taken <= _GEN_759;
      end
    end else begin
      ram_13_cfi_taken <= _GEN_759;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_cfi_mispredicted <= _GEN_727;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_cfi_mispredicted <= _GEN_727;
      end
    end else begin
      ram_13_cfi_mispredicted <= _GEN_727;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_cfi_type <= _GEN_695;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_cfi_type <= _GEN_695;
      end
    end else begin
      ram_13_cfi_type <= _GEN_695;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_br_mask <= _GEN_663;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_br_mask <= _GEN_663;
      end
    end else begin
      ram_13_br_mask <= _GEN_663;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_cfi_is_call <= _GEN_631;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_cfi_is_call <= _GEN_631;
      end
    end else begin
      ram_13_cfi_is_call <= _GEN_631;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_cfi_is_ret <= _GEN_599;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_cfi_is_ret <= _GEN_599;
      end
    end else begin
      ram_13_cfi_is_ret <= _GEN_599;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_cfi_npc_plus4 <= _GEN_567;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_cfi_npc_plus4 <= _GEN_567;
      end
    end else begin
      ram_13_cfi_npc_plus4 <= _GEN_567;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_ras_top <= _GEN_535;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_ras_top <= _GEN_535;
      end
    end else begin
      ram_13_ras_top <= _GEN_535;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_ras_idx <= _GEN_503;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_ras_idx <= _GEN_503;
      end
    end else begin
      ram_13_ras_idx <= _GEN_503;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_13_start_bank <= _GEN_471;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hd == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_13_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_13_start_bank <= _GEN_471;
      end
    end else begin
      ram_13_start_bank <= _GEN_471;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_cfi_idx_valid <= _GEN_824;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_cfi_idx_valid <= _GEN_824;
      end
    end else begin
      ram_14_cfi_idx_valid <= _GEN_824;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_cfi_idx_bits <= _GEN_792;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_cfi_idx_bits <= _GEN_792;
      end
    end else begin
      ram_14_cfi_idx_bits <= _GEN_792;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_cfi_taken <= _GEN_760;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_cfi_taken <= _GEN_760;
      end
    end else begin
      ram_14_cfi_taken <= _GEN_760;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_cfi_mispredicted <= _GEN_728;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_cfi_mispredicted <= _GEN_728;
      end
    end else begin
      ram_14_cfi_mispredicted <= _GEN_728;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_cfi_type <= _GEN_696;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_cfi_type <= _GEN_696;
      end
    end else begin
      ram_14_cfi_type <= _GEN_696;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_br_mask <= _GEN_664;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_br_mask <= _GEN_664;
      end
    end else begin
      ram_14_br_mask <= _GEN_664;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_cfi_is_call <= _GEN_632;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_cfi_is_call <= _GEN_632;
      end
    end else begin
      ram_14_cfi_is_call <= _GEN_632;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_cfi_is_ret <= _GEN_600;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_cfi_is_ret <= _GEN_600;
      end
    end else begin
      ram_14_cfi_is_ret <= _GEN_600;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_cfi_npc_plus4 <= _GEN_568;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_cfi_npc_plus4 <= _GEN_568;
      end
    end else begin
      ram_14_cfi_npc_plus4 <= _GEN_568;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_ras_top <= _GEN_536;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_ras_top <= _GEN_536;
      end
    end else begin
      ram_14_ras_top <= _GEN_536;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_ras_idx <= _GEN_504;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_ras_idx <= _GEN_504;
      end
    end else begin
      ram_14_ras_idx <= _GEN_504;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_14_start_bank <= _GEN_472;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'he == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_14_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_14_start_bank <= _GEN_472;
      end
    end else begin
      ram_14_start_bank <= _GEN_472;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_cfi_idx_valid <= _GEN_825;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_cfi_idx_valid <= _GEN_825;
      end
    end else begin
      ram_15_cfi_idx_valid <= _GEN_825;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_cfi_idx_bits <= _GEN_793;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_cfi_idx_bits <= _GEN_793;
      end
    end else begin
      ram_15_cfi_idx_bits <= _GEN_793;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_cfi_taken <= _GEN_761;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_cfi_taken <= _GEN_761;
      end
    end else begin
      ram_15_cfi_taken <= _GEN_761;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_cfi_mispredicted <= _GEN_729;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_cfi_mispredicted <= _GEN_729;
      end
    end else begin
      ram_15_cfi_mispredicted <= _GEN_729;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_cfi_type <= _GEN_697;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_cfi_type <= _GEN_697;
      end
    end else begin
      ram_15_cfi_type <= _GEN_697;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_br_mask <= _GEN_665;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_br_mask <= _GEN_665;
      end
    end else begin
      ram_15_br_mask <= _GEN_665;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_cfi_is_call <= _GEN_633;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_cfi_is_call <= _GEN_633;
      end
    end else begin
      ram_15_cfi_is_call <= _GEN_633;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_cfi_is_ret <= _GEN_601;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_cfi_is_ret <= _GEN_601;
      end
    end else begin
      ram_15_cfi_is_ret <= _GEN_601;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_cfi_npc_plus4 <= _GEN_569;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_cfi_npc_plus4 <= _GEN_569;
      end
    end else begin
      ram_15_cfi_npc_plus4 <= _GEN_569;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_ras_top <= _GEN_537;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_ras_top <= _GEN_537;
      end
    end else begin
      ram_15_ras_top <= _GEN_537;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_ras_idx <= _GEN_505;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_ras_idx <= _GEN_505;
      end
    end else begin
      ram_15_ras_idx <= _GEN_505;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_15_start_bank <= _GEN_473;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'hf == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_15_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_15_start_bank <= _GEN_473;
      end
    end else begin
      ram_15_start_bank <= _GEN_473;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_cfi_idx_valid <= _GEN_826;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_cfi_idx_valid <= _GEN_826;
      end
    end else begin
      ram_16_cfi_idx_valid <= _GEN_826;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_cfi_idx_bits <= _GEN_794;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_cfi_idx_bits <= _GEN_794;
      end
    end else begin
      ram_16_cfi_idx_bits <= _GEN_794;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_cfi_taken <= _GEN_762;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_cfi_taken <= _GEN_762;
      end
    end else begin
      ram_16_cfi_taken <= _GEN_762;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_cfi_mispredicted <= _GEN_730;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_cfi_mispredicted <= _GEN_730;
      end
    end else begin
      ram_16_cfi_mispredicted <= _GEN_730;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_cfi_type <= _GEN_698;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_cfi_type <= _GEN_698;
      end
    end else begin
      ram_16_cfi_type <= _GEN_698;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_br_mask <= _GEN_666;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_br_mask <= _GEN_666;
      end
    end else begin
      ram_16_br_mask <= _GEN_666;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_cfi_is_call <= _GEN_634;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_cfi_is_call <= _GEN_634;
      end
    end else begin
      ram_16_cfi_is_call <= _GEN_634;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_cfi_is_ret <= _GEN_602;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_cfi_is_ret <= _GEN_602;
      end
    end else begin
      ram_16_cfi_is_ret <= _GEN_602;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_cfi_npc_plus4 <= _GEN_570;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_cfi_npc_plus4 <= _GEN_570;
      end
    end else begin
      ram_16_cfi_npc_plus4 <= _GEN_570;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_ras_top <= _GEN_538;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_ras_top <= _GEN_538;
      end
    end else begin
      ram_16_ras_top <= _GEN_538;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_ras_idx <= _GEN_506;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_ras_idx <= _GEN_506;
      end
    end else begin
      ram_16_ras_idx <= _GEN_506;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_16_start_bank <= _GEN_474;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h10 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_16_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_16_start_bank <= _GEN_474;
      end
    end else begin
      ram_16_start_bank <= _GEN_474;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_cfi_idx_valid <= _GEN_827;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_cfi_idx_valid <= _GEN_827;
      end
    end else begin
      ram_17_cfi_idx_valid <= _GEN_827;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_cfi_idx_bits <= _GEN_795;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_cfi_idx_bits <= _GEN_795;
      end
    end else begin
      ram_17_cfi_idx_bits <= _GEN_795;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_cfi_taken <= _GEN_763;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_cfi_taken <= _GEN_763;
      end
    end else begin
      ram_17_cfi_taken <= _GEN_763;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_cfi_mispredicted <= _GEN_731;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_cfi_mispredicted <= _GEN_731;
      end
    end else begin
      ram_17_cfi_mispredicted <= _GEN_731;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_cfi_type <= _GEN_699;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_cfi_type <= _GEN_699;
      end
    end else begin
      ram_17_cfi_type <= _GEN_699;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_br_mask <= _GEN_667;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_br_mask <= _GEN_667;
      end
    end else begin
      ram_17_br_mask <= _GEN_667;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_cfi_is_call <= _GEN_635;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_cfi_is_call <= _GEN_635;
      end
    end else begin
      ram_17_cfi_is_call <= _GEN_635;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_cfi_is_ret <= _GEN_603;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_cfi_is_ret <= _GEN_603;
      end
    end else begin
      ram_17_cfi_is_ret <= _GEN_603;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_cfi_npc_plus4 <= _GEN_571;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_cfi_npc_plus4 <= _GEN_571;
      end
    end else begin
      ram_17_cfi_npc_plus4 <= _GEN_571;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_ras_top <= _GEN_539;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_ras_top <= _GEN_539;
      end
    end else begin
      ram_17_ras_top <= _GEN_539;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_ras_idx <= _GEN_507;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_ras_idx <= _GEN_507;
      end
    end else begin
      ram_17_ras_idx <= _GEN_507;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_17_start_bank <= _GEN_475;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h11 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_17_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_17_start_bank <= _GEN_475;
      end
    end else begin
      ram_17_start_bank <= _GEN_475;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_cfi_idx_valid <= _GEN_828;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_cfi_idx_valid <= _GEN_828;
      end
    end else begin
      ram_18_cfi_idx_valid <= _GEN_828;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_cfi_idx_bits <= _GEN_796;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_cfi_idx_bits <= _GEN_796;
      end
    end else begin
      ram_18_cfi_idx_bits <= _GEN_796;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_cfi_taken <= _GEN_764;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_cfi_taken <= _GEN_764;
      end
    end else begin
      ram_18_cfi_taken <= _GEN_764;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_cfi_mispredicted <= _GEN_732;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_cfi_mispredicted <= _GEN_732;
      end
    end else begin
      ram_18_cfi_mispredicted <= _GEN_732;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_cfi_type <= _GEN_700;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_cfi_type <= _GEN_700;
      end
    end else begin
      ram_18_cfi_type <= _GEN_700;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_br_mask <= _GEN_668;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_br_mask <= _GEN_668;
      end
    end else begin
      ram_18_br_mask <= _GEN_668;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_cfi_is_call <= _GEN_636;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_cfi_is_call <= _GEN_636;
      end
    end else begin
      ram_18_cfi_is_call <= _GEN_636;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_cfi_is_ret <= _GEN_604;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_cfi_is_ret <= _GEN_604;
      end
    end else begin
      ram_18_cfi_is_ret <= _GEN_604;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_cfi_npc_plus4 <= _GEN_572;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_cfi_npc_plus4 <= _GEN_572;
      end
    end else begin
      ram_18_cfi_npc_plus4 <= _GEN_572;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_ras_top <= _GEN_540;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_ras_top <= _GEN_540;
      end
    end else begin
      ram_18_ras_top <= _GEN_540;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_ras_idx <= _GEN_508;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_ras_idx <= _GEN_508;
      end
    end else begin
      ram_18_ras_idx <= _GEN_508;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_18_start_bank <= _GEN_476;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h12 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_18_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_18_start_bank <= _GEN_476;
      end
    end else begin
      ram_18_start_bank <= _GEN_476;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_cfi_idx_valid <= _GEN_829;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_cfi_idx_valid <= _GEN_829;
      end
    end else begin
      ram_19_cfi_idx_valid <= _GEN_829;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_cfi_idx_bits <= _GEN_797;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_cfi_idx_bits <= _GEN_797;
      end
    end else begin
      ram_19_cfi_idx_bits <= _GEN_797;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_cfi_taken <= _GEN_765;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_cfi_taken <= _GEN_765;
      end
    end else begin
      ram_19_cfi_taken <= _GEN_765;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_cfi_mispredicted <= _GEN_733;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_cfi_mispredicted <= _GEN_733;
      end
    end else begin
      ram_19_cfi_mispredicted <= _GEN_733;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_cfi_type <= _GEN_701;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_cfi_type <= _GEN_701;
      end
    end else begin
      ram_19_cfi_type <= _GEN_701;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_br_mask <= _GEN_669;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_br_mask <= _GEN_669;
      end
    end else begin
      ram_19_br_mask <= _GEN_669;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_cfi_is_call <= _GEN_637;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_cfi_is_call <= _GEN_637;
      end
    end else begin
      ram_19_cfi_is_call <= _GEN_637;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_cfi_is_ret <= _GEN_605;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_cfi_is_ret <= _GEN_605;
      end
    end else begin
      ram_19_cfi_is_ret <= _GEN_605;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_cfi_npc_plus4 <= _GEN_573;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_cfi_npc_plus4 <= _GEN_573;
      end
    end else begin
      ram_19_cfi_npc_plus4 <= _GEN_573;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_ras_top <= _GEN_541;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_ras_top <= _GEN_541;
      end
    end else begin
      ram_19_ras_top <= _GEN_541;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_ras_idx <= _GEN_509;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_ras_idx <= _GEN_509;
      end
    end else begin
      ram_19_ras_idx <= _GEN_509;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_19_start_bank <= _GEN_477;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h13 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_19_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_19_start_bank <= _GEN_477;
      end
    end else begin
      ram_19_start_bank <= _GEN_477;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_cfi_idx_valid <= _GEN_830;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_cfi_idx_valid <= _GEN_830;
      end
    end else begin
      ram_20_cfi_idx_valid <= _GEN_830;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_cfi_idx_bits <= _GEN_798;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_cfi_idx_bits <= _GEN_798;
      end
    end else begin
      ram_20_cfi_idx_bits <= _GEN_798;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_cfi_taken <= _GEN_766;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_cfi_taken <= _GEN_766;
      end
    end else begin
      ram_20_cfi_taken <= _GEN_766;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_cfi_mispredicted <= _GEN_734;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_cfi_mispredicted <= _GEN_734;
      end
    end else begin
      ram_20_cfi_mispredicted <= _GEN_734;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_cfi_type <= _GEN_702;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_cfi_type <= _GEN_702;
      end
    end else begin
      ram_20_cfi_type <= _GEN_702;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_br_mask <= _GEN_670;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_br_mask <= _GEN_670;
      end
    end else begin
      ram_20_br_mask <= _GEN_670;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_cfi_is_call <= _GEN_638;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_cfi_is_call <= _GEN_638;
      end
    end else begin
      ram_20_cfi_is_call <= _GEN_638;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_cfi_is_ret <= _GEN_606;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_cfi_is_ret <= _GEN_606;
      end
    end else begin
      ram_20_cfi_is_ret <= _GEN_606;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_cfi_npc_plus4 <= _GEN_574;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_cfi_npc_plus4 <= _GEN_574;
      end
    end else begin
      ram_20_cfi_npc_plus4 <= _GEN_574;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_ras_top <= _GEN_542;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_ras_top <= _GEN_542;
      end
    end else begin
      ram_20_ras_top <= _GEN_542;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_ras_idx <= _GEN_510;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_ras_idx <= _GEN_510;
      end
    end else begin
      ram_20_ras_idx <= _GEN_510;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_20_start_bank <= _GEN_478;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h14 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_20_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_20_start_bank <= _GEN_478;
      end
    end else begin
      ram_20_start_bank <= _GEN_478;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_cfi_idx_valid <= _GEN_831;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_cfi_idx_valid <= _GEN_831;
      end
    end else begin
      ram_21_cfi_idx_valid <= _GEN_831;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_cfi_idx_bits <= _GEN_799;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_cfi_idx_bits <= _GEN_799;
      end
    end else begin
      ram_21_cfi_idx_bits <= _GEN_799;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_cfi_taken <= _GEN_767;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_cfi_taken <= _GEN_767;
      end
    end else begin
      ram_21_cfi_taken <= _GEN_767;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_cfi_mispredicted <= _GEN_735;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_cfi_mispredicted <= _GEN_735;
      end
    end else begin
      ram_21_cfi_mispredicted <= _GEN_735;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_cfi_type <= _GEN_703;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_cfi_type <= _GEN_703;
      end
    end else begin
      ram_21_cfi_type <= _GEN_703;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_br_mask <= _GEN_671;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_br_mask <= _GEN_671;
      end
    end else begin
      ram_21_br_mask <= _GEN_671;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_cfi_is_call <= _GEN_639;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_cfi_is_call <= _GEN_639;
      end
    end else begin
      ram_21_cfi_is_call <= _GEN_639;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_cfi_is_ret <= _GEN_607;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_cfi_is_ret <= _GEN_607;
      end
    end else begin
      ram_21_cfi_is_ret <= _GEN_607;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_cfi_npc_plus4 <= _GEN_575;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_cfi_npc_plus4 <= _GEN_575;
      end
    end else begin
      ram_21_cfi_npc_plus4 <= _GEN_575;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_ras_top <= _GEN_543;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_ras_top <= _GEN_543;
      end
    end else begin
      ram_21_ras_top <= _GEN_543;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_ras_idx <= _GEN_511;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_ras_idx <= _GEN_511;
      end
    end else begin
      ram_21_ras_idx <= _GEN_511;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_21_start_bank <= _GEN_479;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h15 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_21_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_21_start_bank <= _GEN_479;
      end
    end else begin
      ram_21_start_bank <= _GEN_479;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_cfi_idx_valid <= _GEN_832;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_cfi_idx_valid <= _GEN_832;
      end
    end else begin
      ram_22_cfi_idx_valid <= _GEN_832;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_cfi_idx_bits <= _GEN_800;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_cfi_idx_bits <= _GEN_800;
      end
    end else begin
      ram_22_cfi_idx_bits <= _GEN_800;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_cfi_taken <= _GEN_768;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_cfi_taken <= _GEN_768;
      end
    end else begin
      ram_22_cfi_taken <= _GEN_768;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_cfi_mispredicted <= _GEN_736;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_cfi_mispredicted <= _GEN_736;
      end
    end else begin
      ram_22_cfi_mispredicted <= _GEN_736;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_cfi_type <= _GEN_704;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_cfi_type <= _GEN_704;
      end
    end else begin
      ram_22_cfi_type <= _GEN_704;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_br_mask <= _GEN_672;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_br_mask <= _GEN_672;
      end
    end else begin
      ram_22_br_mask <= _GEN_672;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_cfi_is_call <= _GEN_640;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_cfi_is_call <= _GEN_640;
      end
    end else begin
      ram_22_cfi_is_call <= _GEN_640;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_cfi_is_ret <= _GEN_608;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_cfi_is_ret <= _GEN_608;
      end
    end else begin
      ram_22_cfi_is_ret <= _GEN_608;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_cfi_npc_plus4 <= _GEN_576;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_cfi_npc_plus4 <= _GEN_576;
      end
    end else begin
      ram_22_cfi_npc_plus4 <= _GEN_576;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_ras_top <= _GEN_544;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_ras_top <= _GEN_544;
      end
    end else begin
      ram_22_ras_top <= _GEN_544;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_ras_idx <= _GEN_512;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_ras_idx <= _GEN_512;
      end
    end else begin
      ram_22_ras_idx <= _GEN_512;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_22_start_bank <= _GEN_480;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h16 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_22_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_22_start_bank <= _GEN_480;
      end
    end else begin
      ram_22_start_bank <= _GEN_480;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_cfi_idx_valid <= _GEN_833;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_cfi_idx_valid <= _GEN_833;
      end
    end else begin
      ram_23_cfi_idx_valid <= _GEN_833;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_cfi_idx_bits <= _GEN_801;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_cfi_idx_bits <= _GEN_801;
      end
    end else begin
      ram_23_cfi_idx_bits <= _GEN_801;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_cfi_taken <= _GEN_769;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_cfi_taken <= _GEN_769;
      end
    end else begin
      ram_23_cfi_taken <= _GEN_769;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_cfi_mispredicted <= _GEN_737;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_cfi_mispredicted <= _GEN_737;
      end
    end else begin
      ram_23_cfi_mispredicted <= _GEN_737;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_cfi_type <= _GEN_705;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_cfi_type <= _GEN_705;
      end
    end else begin
      ram_23_cfi_type <= _GEN_705;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_br_mask <= _GEN_673;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_br_mask <= _GEN_673;
      end
    end else begin
      ram_23_br_mask <= _GEN_673;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_cfi_is_call <= _GEN_641;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_cfi_is_call <= _GEN_641;
      end
    end else begin
      ram_23_cfi_is_call <= _GEN_641;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_cfi_is_ret <= _GEN_609;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_cfi_is_ret <= _GEN_609;
      end
    end else begin
      ram_23_cfi_is_ret <= _GEN_609;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_cfi_npc_plus4 <= _GEN_577;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_cfi_npc_plus4 <= _GEN_577;
      end
    end else begin
      ram_23_cfi_npc_plus4 <= _GEN_577;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_ras_top <= _GEN_545;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_ras_top <= _GEN_545;
      end
    end else begin
      ram_23_ras_top <= _GEN_545;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_ras_idx <= _GEN_513;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_ras_idx <= _GEN_513;
      end
    end else begin
      ram_23_ras_idx <= _GEN_513;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_23_start_bank <= _GEN_481;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h17 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_23_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_23_start_bank <= _GEN_481;
      end
    end else begin
      ram_23_start_bank <= _GEN_481;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_cfi_idx_valid <= _GEN_834;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_cfi_idx_valid <= _GEN_834;
      end
    end else begin
      ram_24_cfi_idx_valid <= _GEN_834;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_cfi_idx_bits <= _GEN_802;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_cfi_idx_bits <= _GEN_802;
      end
    end else begin
      ram_24_cfi_idx_bits <= _GEN_802;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_cfi_taken <= _GEN_770;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_cfi_taken <= _GEN_770;
      end
    end else begin
      ram_24_cfi_taken <= _GEN_770;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_cfi_mispredicted <= _GEN_738;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_cfi_mispredicted <= _GEN_738;
      end
    end else begin
      ram_24_cfi_mispredicted <= _GEN_738;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_cfi_type <= _GEN_706;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_cfi_type <= _GEN_706;
      end
    end else begin
      ram_24_cfi_type <= _GEN_706;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_br_mask <= _GEN_674;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_br_mask <= _GEN_674;
      end
    end else begin
      ram_24_br_mask <= _GEN_674;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_cfi_is_call <= _GEN_642;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_cfi_is_call <= _GEN_642;
      end
    end else begin
      ram_24_cfi_is_call <= _GEN_642;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_cfi_is_ret <= _GEN_610;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_cfi_is_ret <= _GEN_610;
      end
    end else begin
      ram_24_cfi_is_ret <= _GEN_610;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_cfi_npc_plus4 <= _GEN_578;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_cfi_npc_plus4 <= _GEN_578;
      end
    end else begin
      ram_24_cfi_npc_plus4 <= _GEN_578;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_ras_top <= _GEN_546;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_ras_top <= _GEN_546;
      end
    end else begin
      ram_24_ras_top <= _GEN_546;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_ras_idx <= _GEN_514;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_ras_idx <= _GEN_514;
      end
    end else begin
      ram_24_ras_idx <= _GEN_514;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_24_start_bank <= _GEN_482;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h18 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_24_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_24_start_bank <= _GEN_482;
      end
    end else begin
      ram_24_start_bank <= _GEN_482;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_cfi_idx_valid <= _GEN_835;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_cfi_idx_valid <= _GEN_835;
      end
    end else begin
      ram_25_cfi_idx_valid <= _GEN_835;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_cfi_idx_bits <= _GEN_803;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_cfi_idx_bits <= _GEN_803;
      end
    end else begin
      ram_25_cfi_idx_bits <= _GEN_803;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_cfi_taken <= _GEN_771;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_cfi_taken <= _GEN_771;
      end
    end else begin
      ram_25_cfi_taken <= _GEN_771;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_cfi_mispredicted <= _GEN_739;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_cfi_mispredicted <= _GEN_739;
      end
    end else begin
      ram_25_cfi_mispredicted <= _GEN_739;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_cfi_type <= _GEN_707;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_cfi_type <= _GEN_707;
      end
    end else begin
      ram_25_cfi_type <= _GEN_707;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_br_mask <= _GEN_675;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_br_mask <= _GEN_675;
      end
    end else begin
      ram_25_br_mask <= _GEN_675;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_cfi_is_call <= _GEN_643;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_cfi_is_call <= _GEN_643;
      end
    end else begin
      ram_25_cfi_is_call <= _GEN_643;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_cfi_is_ret <= _GEN_611;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_cfi_is_ret <= _GEN_611;
      end
    end else begin
      ram_25_cfi_is_ret <= _GEN_611;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_cfi_npc_plus4 <= _GEN_579;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_cfi_npc_plus4 <= _GEN_579;
      end
    end else begin
      ram_25_cfi_npc_plus4 <= _GEN_579;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_ras_top <= _GEN_547;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_ras_top <= _GEN_547;
      end
    end else begin
      ram_25_ras_top <= _GEN_547;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_ras_idx <= _GEN_515;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_ras_idx <= _GEN_515;
      end
    end else begin
      ram_25_ras_idx <= _GEN_515;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_25_start_bank <= _GEN_483;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h19 == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_25_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_25_start_bank <= _GEN_483;
      end
    end else begin
      ram_25_start_bank <= _GEN_483;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_cfi_idx_valid <= _GEN_836;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_cfi_idx_valid <= _GEN_836;
      end
    end else begin
      ram_26_cfi_idx_valid <= _GEN_836;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_cfi_idx_bits <= _GEN_804;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_cfi_idx_bits <= _GEN_804;
      end
    end else begin
      ram_26_cfi_idx_bits <= _GEN_804;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_cfi_taken <= _GEN_772;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_cfi_taken <= _GEN_772;
      end
    end else begin
      ram_26_cfi_taken <= _GEN_772;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_cfi_mispredicted <= _GEN_740;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_cfi_mispredicted <= _GEN_740;
      end
    end else begin
      ram_26_cfi_mispredicted <= _GEN_740;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_cfi_type <= _GEN_708;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_cfi_type <= _GEN_708;
      end
    end else begin
      ram_26_cfi_type <= _GEN_708;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_br_mask <= _GEN_676;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_br_mask <= _GEN_676;
      end
    end else begin
      ram_26_br_mask <= _GEN_676;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_cfi_is_call <= _GEN_644;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_cfi_is_call <= _GEN_644;
      end
    end else begin
      ram_26_cfi_is_call <= _GEN_644;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_cfi_is_ret <= _GEN_612;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_cfi_is_ret <= _GEN_612;
      end
    end else begin
      ram_26_cfi_is_ret <= _GEN_612;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_cfi_npc_plus4 <= _GEN_580;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_cfi_npc_plus4 <= _GEN_580;
      end
    end else begin
      ram_26_cfi_npc_plus4 <= _GEN_580;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_ras_top <= _GEN_548;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_ras_top <= _GEN_548;
      end
    end else begin
      ram_26_ras_top <= _GEN_548;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_ras_idx <= _GEN_516;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_ras_idx <= _GEN_516;
      end
    end else begin
      ram_26_ras_idx <= _GEN_516;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_26_start_bank <= _GEN_484;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1a == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_26_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_26_start_bank <= _GEN_484;
      end
    end else begin
      ram_26_start_bank <= _GEN_484;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_cfi_idx_valid <= _GEN_837;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_cfi_idx_valid <= _GEN_837;
      end
    end else begin
      ram_27_cfi_idx_valid <= _GEN_837;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_cfi_idx_bits <= _GEN_805;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_cfi_idx_bits <= _GEN_805;
      end
    end else begin
      ram_27_cfi_idx_bits <= _GEN_805;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_cfi_taken <= _GEN_773;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_cfi_taken <= _GEN_773;
      end
    end else begin
      ram_27_cfi_taken <= _GEN_773;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_cfi_mispredicted <= _GEN_741;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_cfi_mispredicted <= _GEN_741;
      end
    end else begin
      ram_27_cfi_mispredicted <= _GEN_741;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_cfi_type <= _GEN_709;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_cfi_type <= _GEN_709;
      end
    end else begin
      ram_27_cfi_type <= _GEN_709;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_br_mask <= _GEN_677;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_br_mask <= _GEN_677;
      end
    end else begin
      ram_27_br_mask <= _GEN_677;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_cfi_is_call <= _GEN_645;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_cfi_is_call <= _GEN_645;
      end
    end else begin
      ram_27_cfi_is_call <= _GEN_645;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_cfi_is_ret <= _GEN_613;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_cfi_is_ret <= _GEN_613;
      end
    end else begin
      ram_27_cfi_is_ret <= _GEN_613;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_cfi_npc_plus4 <= _GEN_581;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_cfi_npc_plus4 <= _GEN_581;
      end
    end else begin
      ram_27_cfi_npc_plus4 <= _GEN_581;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_ras_top <= _GEN_549;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_ras_top <= _GEN_549;
      end
    end else begin
      ram_27_ras_top <= _GEN_549;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_ras_idx <= _GEN_517;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_ras_idx <= _GEN_517;
      end
    end else begin
      ram_27_ras_idx <= _GEN_517;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_27_start_bank <= _GEN_485;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1b == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_27_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_27_start_bank <= _GEN_485;
      end
    end else begin
      ram_27_start_bank <= _GEN_485;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_cfi_idx_valid <= _GEN_838;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_cfi_idx_valid <= _GEN_838;
      end
    end else begin
      ram_28_cfi_idx_valid <= _GEN_838;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_cfi_idx_bits <= _GEN_806;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_cfi_idx_bits <= _GEN_806;
      end
    end else begin
      ram_28_cfi_idx_bits <= _GEN_806;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_cfi_taken <= _GEN_774;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_cfi_taken <= _GEN_774;
      end
    end else begin
      ram_28_cfi_taken <= _GEN_774;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_cfi_mispredicted <= _GEN_742;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_cfi_mispredicted <= _GEN_742;
      end
    end else begin
      ram_28_cfi_mispredicted <= _GEN_742;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_cfi_type <= _GEN_710;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_cfi_type <= _GEN_710;
      end
    end else begin
      ram_28_cfi_type <= _GEN_710;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_br_mask <= _GEN_678;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_br_mask <= _GEN_678;
      end
    end else begin
      ram_28_br_mask <= _GEN_678;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_cfi_is_call <= _GEN_646;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_cfi_is_call <= _GEN_646;
      end
    end else begin
      ram_28_cfi_is_call <= _GEN_646;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_cfi_is_ret <= _GEN_614;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_cfi_is_ret <= _GEN_614;
      end
    end else begin
      ram_28_cfi_is_ret <= _GEN_614;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_cfi_npc_plus4 <= _GEN_582;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_cfi_npc_plus4 <= _GEN_582;
      end
    end else begin
      ram_28_cfi_npc_plus4 <= _GEN_582;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_ras_top <= _GEN_550;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_ras_top <= _GEN_550;
      end
    end else begin
      ram_28_ras_top <= _GEN_550;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_ras_idx <= _GEN_518;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_ras_idx <= _GEN_518;
      end
    end else begin
      ram_28_ras_idx <= _GEN_518;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_28_start_bank <= _GEN_486;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1c == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_28_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_28_start_bank <= _GEN_486;
      end
    end else begin
      ram_28_start_bank <= _GEN_486;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_cfi_idx_valid <= _GEN_839;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_cfi_idx_valid <= _GEN_839;
      end
    end else begin
      ram_29_cfi_idx_valid <= _GEN_839;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_cfi_idx_bits <= _GEN_807;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_cfi_idx_bits <= _GEN_807;
      end
    end else begin
      ram_29_cfi_idx_bits <= _GEN_807;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_cfi_taken <= _GEN_775;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_cfi_taken <= _GEN_775;
      end
    end else begin
      ram_29_cfi_taken <= _GEN_775;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_cfi_mispredicted <= _GEN_743;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_cfi_mispredicted <= _GEN_743;
      end
    end else begin
      ram_29_cfi_mispredicted <= _GEN_743;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_cfi_type <= _GEN_711;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_cfi_type <= _GEN_711;
      end
    end else begin
      ram_29_cfi_type <= _GEN_711;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_br_mask <= _GEN_679;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_br_mask <= _GEN_679;
      end
    end else begin
      ram_29_br_mask <= _GEN_679;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_cfi_is_call <= _GEN_647;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_cfi_is_call <= _GEN_647;
      end
    end else begin
      ram_29_cfi_is_call <= _GEN_647;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_cfi_is_ret <= _GEN_615;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_cfi_is_ret <= _GEN_615;
      end
    end else begin
      ram_29_cfi_is_ret <= _GEN_615;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_cfi_npc_plus4 <= _GEN_583;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_cfi_npc_plus4 <= _GEN_583;
      end
    end else begin
      ram_29_cfi_npc_plus4 <= _GEN_583;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_ras_top <= _GEN_551;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_ras_top <= _GEN_551;
      end
    end else begin
      ram_29_ras_top <= _GEN_551;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_ras_idx <= _GEN_519;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_ras_idx <= _GEN_519;
      end
    end else begin
      ram_29_ras_idx <= _GEN_519;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_29_start_bank <= _GEN_487;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1d == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_29_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_29_start_bank <= _GEN_487;
      end
    end else begin
      ram_29_start_bank <= _GEN_487;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_cfi_idx_valid <= _GEN_840;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_cfi_idx_valid <= _GEN_840;
      end
    end else begin
      ram_30_cfi_idx_valid <= _GEN_840;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_cfi_idx_bits <= _GEN_808;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_cfi_idx_bits <= _GEN_808;
      end
    end else begin
      ram_30_cfi_idx_bits <= _GEN_808;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_cfi_taken <= _GEN_776;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_cfi_taken <= _GEN_776;
      end
    end else begin
      ram_30_cfi_taken <= _GEN_776;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_cfi_mispredicted <= _GEN_744;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_cfi_mispredicted <= _GEN_744;
      end
    end else begin
      ram_30_cfi_mispredicted <= _GEN_744;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_cfi_type <= _GEN_712;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_cfi_type <= _GEN_712;
      end
    end else begin
      ram_30_cfi_type <= _GEN_712;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_br_mask <= _GEN_680;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_br_mask <= _GEN_680;
      end
    end else begin
      ram_30_br_mask <= _GEN_680;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_cfi_is_call <= _GEN_648;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_cfi_is_call <= _GEN_648;
      end
    end else begin
      ram_30_cfi_is_call <= _GEN_648;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_cfi_is_ret <= _GEN_616;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_cfi_is_ret <= _GEN_616;
      end
    end else begin
      ram_30_cfi_is_ret <= _GEN_616;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_cfi_npc_plus4 <= _GEN_584;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_cfi_npc_plus4 <= _GEN_584;
      end
    end else begin
      ram_30_cfi_npc_plus4 <= _GEN_584;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_ras_top <= _GEN_552;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_ras_top <= _GEN_552;
      end
    end else begin
      ram_30_ras_top <= _GEN_552;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_ras_idx <= _GEN_520;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_ras_idx <= _GEN_520;
      end
    end else begin
      ram_30_ras_idx <= _GEN_520;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_30_start_bank <= _GEN_488;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1e == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_30_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_30_start_bank <= _GEN_488;
      end
    end else begin
      ram_30_start_bank <= _GEN_488;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_cfi_idx_valid <= _GEN_841;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_cfi_idx_valid <= REG_16_cfi_idx_valid; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_cfi_idx_valid <= _GEN_841;
      end
    end else begin
      ram_31_cfi_idx_valid <= _GEN_841;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_cfi_idx_bits <= _GEN_809;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_cfi_idx_bits <= REG_16_cfi_idx_bits; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_cfi_idx_bits <= _GEN_809;
      end
    end else begin
      ram_31_cfi_idx_bits <= _GEN_809;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_cfi_taken <= _GEN_777;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_cfi_taken <= REG_16_cfi_taken; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_cfi_taken <= _GEN_777;
      end
    end else begin
      ram_31_cfi_taken <= _GEN_777;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_cfi_mispredicted <= _GEN_745;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_cfi_mispredicted <= REG_16_cfi_mispredicted; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_cfi_mispredicted <= _GEN_745;
      end
    end else begin
      ram_31_cfi_mispredicted <= _GEN_745;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_cfi_type <= _GEN_713;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_cfi_type <= REG_16_cfi_type; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_cfi_type <= _GEN_713;
      end
    end else begin
      ram_31_cfi_type <= _GEN_713;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_br_mask <= _GEN_681;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_br_mask <= REG_16_br_mask; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_br_mask <= _GEN_681;
      end
    end else begin
      ram_31_br_mask <= _GEN_681;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_cfi_is_call <= _GEN_649;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_cfi_is_call <= REG_16_cfi_is_call; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_cfi_is_call <= _GEN_649;
      end
    end else begin
      ram_31_cfi_is_call <= _GEN_649;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_cfi_is_ret <= _GEN_617;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_cfi_is_ret <= REG_16_cfi_is_ret; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_cfi_is_ret <= _GEN_617;
      end
    end else begin
      ram_31_cfi_is_ret <= _GEN_617;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_cfi_npc_plus4 <= _GEN_585;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_cfi_npc_plus4 <= REG_16_cfi_npc_plus4; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_cfi_npc_plus4 <= _GEN_585;
      end
    end else begin
      ram_31_cfi_npc_plus4 <= _GEN_585;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_ras_top <= _GEN_553;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_ras_top <= REG_16_ras_top; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_ras_top <= _GEN_553;
      end
    end else begin
      ram_31_ras_top <= _GEN_553;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_ras_idx <= _GEN_521;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_ras_idx <= REG_16_ras_idx; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_ras_idx <= _GEN_521;
      end
    end else begin
      ram_31_ras_idx <= _GEN_521;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      ram_31_start_bank <= _GEN_489;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      if (5'h1f == REG_15) begin // @[fetch-target-queue.scala 337:36]
        ram_31_start_bank <= REG_16_start_bank; // @[fetch-target-queue.scala 337:36]
      end else begin
        ram_31_start_bank <= _GEN_489;
      end
    end else begin
      ram_31_start_bank <= _GEN_489;
    end
    if (reset) begin // @[fetch-target-queue.scala 155:27]
      prev_ghist_old_history <= 64'h0; // @[fetch-target-queue.scala 155:27]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      prev_ghist_old_history <= _GEN_859;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      prev_ghist_old_history <= ghist_0_old_history_bpd_ghist_data; // @[fetch-target-queue.scala 334:16]
    end else begin
      prev_ghist_old_history <= _GEN_859;
    end
    if (reset) begin // @[fetch-target-queue.scala 155:27]
      prev_ghist_current_saw_branch_not_taken <= 1'h0; // @[fetch-target-queue.scala 155:27]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      prev_ghist_current_saw_branch_not_taken <= _GEN_858;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      prev_ghist_current_saw_branch_not_taken <= ghist_0_current_saw_branch_not_taken_bpd_ghist_data; // @[fetch-target-queue.scala 334:16]
    end else begin
      prev_ghist_current_saw_branch_not_taken <= _GEN_858;
    end
    if (reset) begin // @[fetch-target-queue.scala 155:27]
      prev_ghist_ras_idx <= 5'h0; // @[fetch-target-queue.scala 155:27]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      prev_ghist_ras_idx <= _GEN_855;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      prev_ghist_ras_idx <= ghist_0_ras_idx_bpd_ghist_data; // @[fetch-target-queue.scala 334:16]
    end else begin
      prev_ghist_ras_idx <= _GEN_855;
    end
    if (reset) begin // @[fetch-target-queue.scala 156:27]
      prev_entry_cfi_idx_valid <= 1'h0; // @[fetch-target-queue.scala 156:27]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      prev_entry_cfi_idx_valid <= _GEN_854;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      prev_entry_cfi_idx_valid <= REG_14_cfi_idx_valid; // @[fetch-target-queue.scala 333:16]
    end else begin
      prev_entry_cfi_idx_valid <= _GEN_854;
    end
    if (reset) begin // @[fetch-target-queue.scala 156:27]
      prev_entry_cfi_idx_bits <= 2'h0; // @[fetch-target-queue.scala 156:27]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      prev_entry_cfi_idx_bits <= _GEN_853;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      prev_entry_cfi_idx_bits <= REG_14_cfi_idx_bits; // @[fetch-target-queue.scala 333:16]
    end else begin
      prev_entry_cfi_idx_bits <= _GEN_853;
    end
    if (reset) begin // @[fetch-target-queue.scala 156:27]
      prev_entry_cfi_taken <= 1'h0; // @[fetch-target-queue.scala 156:27]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      prev_entry_cfi_taken <= _GEN_852;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      prev_entry_cfi_taken <= REG_14_cfi_taken; // @[fetch-target-queue.scala 333:16]
    end else begin
      prev_entry_cfi_taken <= _GEN_852;
    end
    if (reset) begin // @[fetch-target-queue.scala 156:27]
      prev_entry_br_mask <= 4'h0; // @[fetch-target-queue.scala 156:27]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      prev_entry_br_mask <= _GEN_849;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      prev_entry_br_mask <= REG_14_br_mask; // @[fetch-target-queue.scala 333:16]
    end else begin
      prev_entry_br_mask <= _GEN_849;
    end
    if (reset) begin // @[fetch-target-queue.scala 156:27]
      prev_entry_cfi_is_call <= 1'h0; // @[fetch-target-queue.scala 156:27]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      prev_entry_cfi_is_call <= _GEN_848;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      prev_entry_cfi_is_call <= REG_14_cfi_is_call; // @[fetch-target-queue.scala 333:16]
    end else begin
      prev_entry_cfi_is_call <= _GEN_848;
    end
    if (reset) begin // @[fetch-target-queue.scala 156:27]
      prev_entry_cfi_is_ret <= 1'h0; // @[fetch-target-queue.scala 156:27]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      prev_entry_cfi_is_ret <= _GEN_847;
    end else if (REG_13) begin // @[fetch-target-queue.scala 332:44]
      prev_entry_cfi_is_ret <= REG_14_cfi_is_ret; // @[fetch-target-queue.scala 333:16]
    end else begin
      prev_entry_cfi_is_ret <= _GEN_847;
    end
    first_empty <= reset | _GEN_1355; // @[fetch-target-queue.scala 214:28 fetch-target-queue.scala 214:28]
    REG <= io_redirect_valid; // @[fetch-target-queue.scala 314:28 fetch-target-queue.scala 328:20]
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      if (5'h1f == io_redirect_bits) begin
        REG_1 <= ram_31_ras_top;
      end else if (5'h1e == io_redirect_bits) begin
        REG_1 <= ram_30_ras_top;
      end else if (5'h1d == io_redirect_bits) begin
        REG_1 <= ram_29_ras_top;
      end else begin
        REG_1 <= _GEN_1449;
      end
    end else begin
      REG_1 <= 40'h0;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      if (5'h1f == io_redirect_bits) begin
        REG_2 <= ram_31_ras_idx;
      end else if (5'h1e == io_redirect_bits) begin
        REG_2 <= ram_30_ras_idx;
      end else if (5'h1d == io_redirect_bits) begin
        REG_2 <= ram_29_ras_idx;
      end else begin
        REG_2 <= _GEN_1417;
      end
    end else begin
      REG_2 <= 5'h0;
    end
    if (reset) begin // @[fetch-target-queue.scala 226:38]
      bpd_update_mispredict <= 1'h0; // @[fetch-target-queue.scala 226:38]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 245:28]
      bpd_update_mispredict <= 1'h0; // @[fetch-target-queue.scala 246:27]
    end else begin
      bpd_update_mispredict <= _GEN_1325;
    end
    if (reset) begin // @[fetch-target-queue.scala 227:34]
      bpd_update_repair <= 1'h0; // @[fetch-target-queue.scala 227:34]
    end else if (io_redirect_valid) begin // @[fetch-target-queue.scala 245:28]
      bpd_update_repair <= 1'h0; // @[fetch-target-queue.scala 247:27]
    end else if (!(REG_3)) begin // @[fetch-target-queue.scala 248:52]
      bpd_update_repair <= _GEN_1322;
    end
    if (!(io_redirect_valid)) begin // @[fetch-target-queue.scala 245:28]
      if (REG_3) begin // @[fetch-target-queue.scala 248:52]
        bpd_repair_idx <= REG_4; // @[fetch-target-queue.scala 250:27]
      end else if (bpd_update_mispredict) begin // @[fetch-target-queue.scala 252:39]
        bpd_repair_idx <= _T_63; // @[fetch-target-queue.scala 255:27]
      end else if (bpd_update_repair & REG_6) begin // @[fetch-target-queue.scala 256:69]
        bpd_repair_idx <= _T_63; // @[fetch-target-queue.scala 258:27]
      end else begin
        bpd_repair_idx <= _GEN_1316;
      end
    end
    if (!(io_redirect_valid)) begin // @[fetch-target-queue.scala 245:28]
      if (REG_3) begin // @[fetch-target-queue.scala 248:52]
        bpd_end_idx <= REG_5; // @[fetch-target-queue.scala 251:27]
      end
    end
    if (!(io_redirect_valid)) begin // @[fetch-target-queue.scala 245:28]
      if (!(REG_3)) begin // @[fetch-target-queue.scala 248:52]
        if (!(bpd_update_mispredict)) begin // @[fetch-target-queue.scala 252:39]
          if (bpd_update_repair & REG_6) begin // @[fetch-target-queue.scala 256:69]
            bpd_repair_pc <= bpd_pc; // @[fetch-target-queue.scala 257:27]
          end
        end
      end
    end
    if (5'h1f == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_idx_valid <= ram_31_cfi_idx_valid; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1e == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_idx_valid <= ram_30_cfi_idx_valid; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1d == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_idx_valid <= ram_29_cfi_idx_valid; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1c == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_idx_valid <= ram_28_cfi_idx_valid; // @[fetch-target-queue.scala 234:26]
    end else begin
      bpd_entry_cfi_idx_valid <= _GEN_1241;
    end
    if (5'h1f == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_idx_bits <= ram_31_cfi_idx_bits; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1e == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_idx_bits <= ram_30_cfi_idx_bits; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1d == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_idx_bits <= ram_29_cfi_idx_bits; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1c == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_idx_bits <= ram_28_cfi_idx_bits; // @[fetch-target-queue.scala 234:26]
    end else begin
      bpd_entry_cfi_idx_bits <= _GEN_1209;
    end
    if (5'h1f == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_taken <= ram_31_cfi_taken; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1e == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_taken <= ram_30_cfi_taken; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1d == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_taken <= ram_29_cfi_taken; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1c == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_taken <= ram_28_cfi_taken; // @[fetch-target-queue.scala 234:26]
    end else begin
      bpd_entry_cfi_taken <= _GEN_1177;
    end
    if (5'h1f == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_mispredicted <= ram_31_cfi_mispredicted; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1e == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_mispredicted <= ram_30_cfi_mispredicted; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1d == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_mispredicted <= ram_29_cfi_mispredicted; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1c == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_mispredicted <= ram_28_cfi_mispredicted; // @[fetch-target-queue.scala 234:26]
    end else begin
      bpd_entry_cfi_mispredicted <= _GEN_1145;
    end
    if (5'h1f == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_type <= ram_31_cfi_type; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1e == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_type <= ram_30_cfi_type; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1d == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_type <= ram_29_cfi_type; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1c == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_cfi_type <= ram_28_cfi_type; // @[fetch-target-queue.scala 234:26]
    end else begin
      bpd_entry_cfi_type <= _GEN_1113;
    end
    if (5'h1f == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_br_mask <= ram_31_br_mask; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1e == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_br_mask <= ram_30_br_mask; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1d == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_br_mask <= ram_29_br_mask; // @[fetch-target-queue.scala 234:26]
    end else if (5'h1c == bpd_idx) begin // @[fetch-target-queue.scala 234:26]
      bpd_entry_br_mask <= ram_28_br_mask; // @[fetch-target-queue.scala 234:26]
    end else begin
      bpd_entry_br_mask <= _GEN_1081;
    end
    if (5'h1f == bpd_idx) begin // @[fetch-target-queue.scala 242:26]
      bpd_pc <= pcs_31; // @[fetch-target-queue.scala 242:26]
    end else if (5'h1e == bpd_idx) begin // @[fetch-target-queue.scala 242:26]
      bpd_pc <= pcs_30; // @[fetch-target-queue.scala 242:26]
    end else if (5'h1d == bpd_idx) begin // @[fetch-target-queue.scala 242:26]
      bpd_pc <= pcs_29; // @[fetch-target-queue.scala 242:26]
    end else if (5'h1c == bpd_idx) begin // @[fetch-target-queue.scala 242:26]
      bpd_pc <= pcs_28; // @[fetch-target-queue.scala 242:26]
    end else begin
      bpd_pc <= _GEN_1278;
    end
    if (5'h1f == _T_60) begin // @[fetch-target-queue.scala 243:27]
      bpd_target <= pcs_31; // @[fetch-target-queue.scala 243:27]
    end else if (5'h1e == _T_60) begin // @[fetch-target-queue.scala 243:27]
      bpd_target <= pcs_30; // @[fetch-target-queue.scala 243:27]
    end else if (5'h1d == _T_60) begin // @[fetch-target-queue.scala 243:27]
      bpd_target <= pcs_29; // @[fetch-target-queue.scala 243:27]
    end else if (5'h1c == _T_60) begin // @[fetch-target-queue.scala 243:27]
      bpd_target <= pcs_28; // @[fetch-target-queue.scala 243:27]
    end else begin
      bpd_target <= _GEN_1310;
    end
    REG_3 <= io_brupdate_b2_mispredict; // @[fetch-target-queue.scala 248:23]
    REG_4 <= io_brupdate_b2_uop_ftq_idx; // @[fetch-target-queue.scala 250:37]
    REG_5 <= enq_ptr; // @[fetch-target-queue.scala 251:37]
    REG_6 <= bpd_update_mispredict; // @[fetch-target-queue.scala 256:44]
    REG_7 <= io_redirect_valid; // @[fetch-target-queue.scala 274:61]
    REG_8 <= do_commit_update | bpd_update_repair | bpd_update_mispredict; // @[fetch-target-queue.scala 278:54]
    REG_9 <= bpd_update_repair; // @[fetch-target-queue.scala 284:37]
    REG_10 <= bpd_update_mispredict; // @[fetch-target-queue.scala 285:54]
    REG_11 <= bpd_update_repair; // @[fetch-target-queue.scala 286:54]
    REG_12 <= ~full | do_commit_update; // @[fetch-target-queue.scala 308:33]
    REG_13 <= io_redirect_valid; // @[fetch-target-queue.scala 332:23]
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      REG_14_cfi_idx_valid <= _GEN_1741;
    end else if (5'h1f == io_redirect_bits) begin
      REG_14_cfi_idx_valid <= ram_31_cfi_idx_valid;
    end else if (5'h1e == io_redirect_bits) begin
      REG_14_cfi_idx_valid <= ram_30_cfi_idx_valid;
    end else if (5'h1d == io_redirect_bits) begin
      REG_14_cfi_idx_valid <= ram_29_cfi_idx_valid;
    end else begin
      REG_14_cfi_idx_valid <= _GEN_1737;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      if (io_brupdate_b2_mispredict) begin // @[fetch-target-queue.scala 317:38]
        REG_14_cfi_idx_bits <= _T_130[2:1]; // @[fetch-target-queue.scala 321:43]
      end else begin
        REG_14_cfi_idx_bits <= _GEN_1708;
      end
    end else begin
      REG_14_cfi_idx_bits <= _GEN_1708;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      if (io_brupdate_b2_mispredict) begin // @[fetch-target-queue.scala 317:38]
        REG_14_cfi_taken <= io_brupdate_b2_taken; // @[fetch-target-queue.scala 323:43]
      end else begin
        REG_14_cfi_taken <= _GEN_1676;
      end
    end else begin
      REG_14_cfi_taken <= _GEN_1676;
    end
    if (5'h1f == io_redirect_bits) begin
      REG_14_br_mask <= ram_31_br_mask;
    end else if (5'h1e == io_redirect_bits) begin
      REG_14_br_mask <= ram_30_br_mask;
    end else if (5'h1d == io_redirect_bits) begin
      REG_14_br_mask <= ram_29_br_mask;
    end else if (5'h1c == io_redirect_bits) begin
      REG_14_br_mask <= ram_28_br_mask;
    end else begin
      REG_14_br_mask <= _GEN_1576;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      if (io_brupdate_b2_mispredict) begin // @[fetch-target-queue.scala 317:38]
        REG_14_cfi_is_call <= _GEN_1548 & _GEN_1708 == _T_130[2:1]; // @[fetch-target-queue.scala 324:43]
      end else begin
        REG_14_cfi_is_call <= _GEN_1548;
      end
    end else begin
      REG_14_cfi_is_call <= _GEN_1548;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      if (io_brupdate_b2_mispredict) begin // @[fetch-target-queue.scala 317:38]
        REG_14_cfi_is_ret <= _GEN_1516 & _T_132; // @[fetch-target-queue.scala 325:43]
      end else begin
        REG_14_cfi_is_ret <= _GEN_1516;
      end
    end else begin
      REG_14_cfi_is_ret <= _GEN_1516;
    end
    REG_15 <= io_redirect_bits; // @[fetch-target-queue.scala 337:16]
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      REG_16_cfi_idx_valid <= _GEN_1741;
    end else if (5'h1f == io_redirect_bits) begin
      REG_16_cfi_idx_valid <= ram_31_cfi_idx_valid;
    end else if (5'h1e == io_redirect_bits) begin
      REG_16_cfi_idx_valid <= ram_30_cfi_idx_valid;
    end else if (5'h1d == io_redirect_bits) begin
      REG_16_cfi_idx_valid <= ram_29_cfi_idx_valid;
    end else begin
      REG_16_cfi_idx_valid <= _GEN_1737;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      if (io_brupdate_b2_mispredict) begin // @[fetch-target-queue.scala 317:38]
        REG_16_cfi_idx_bits <= _T_130[2:1]; // @[fetch-target-queue.scala 321:43]
      end else begin
        REG_16_cfi_idx_bits <= _GEN_1708;
      end
    end else begin
      REG_16_cfi_idx_bits <= _GEN_1708;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      if (io_brupdate_b2_mispredict) begin // @[fetch-target-queue.scala 317:38]
        REG_16_cfi_taken <= io_brupdate_b2_taken; // @[fetch-target-queue.scala 323:43]
      end else begin
        REG_16_cfi_taken <= _GEN_1676;
      end
    end else begin
      REG_16_cfi_taken <= _GEN_1676;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      REG_16_cfi_mispredicted <= _GEN_1743;
    end else if (5'h1f == io_redirect_bits) begin
      REG_16_cfi_mispredicted <= ram_31_cfi_mispredicted;
    end else if (5'h1e == io_redirect_bits) begin
      REG_16_cfi_mispredicted <= ram_30_cfi_mispredicted;
    end else if (5'h1d == io_redirect_bits) begin
      REG_16_cfi_mispredicted <= ram_29_cfi_mispredicted;
    end else begin
      REG_16_cfi_mispredicted <= _GEN_1641;
    end
    if (5'h1f == io_redirect_bits) begin
      REG_16_cfi_type <= ram_31_cfi_type;
    end else if (5'h1e == io_redirect_bits) begin
      REG_16_cfi_type <= ram_30_cfi_type;
    end else if (5'h1d == io_redirect_bits) begin
      REG_16_cfi_type <= ram_29_cfi_type;
    end else if (5'h1c == io_redirect_bits) begin
      REG_16_cfi_type <= ram_28_cfi_type;
    end else begin
      REG_16_cfi_type <= _GEN_1608;
    end
    if (5'h1f == io_redirect_bits) begin
      REG_16_br_mask <= ram_31_br_mask;
    end else if (5'h1e == io_redirect_bits) begin
      REG_16_br_mask <= ram_30_br_mask;
    end else if (5'h1d == io_redirect_bits) begin
      REG_16_br_mask <= ram_29_br_mask;
    end else if (5'h1c == io_redirect_bits) begin
      REG_16_br_mask <= ram_28_br_mask;
    end else begin
      REG_16_br_mask <= _GEN_1576;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      if (io_brupdate_b2_mispredict) begin // @[fetch-target-queue.scala 317:38]
        REG_16_cfi_is_call <= _GEN_1548 & _GEN_1708 == _T_130[2:1]; // @[fetch-target-queue.scala 324:43]
      end else begin
        REG_16_cfi_is_call <= _GEN_1548;
      end
    end else begin
      REG_16_cfi_is_call <= _GEN_1548;
    end
    if (io_redirect_valid) begin // @[fetch-target-queue.scala 314:28]
      if (io_brupdate_b2_mispredict) begin // @[fetch-target-queue.scala 317:38]
        REG_16_cfi_is_ret <= _GEN_1516 & _T_132; // @[fetch-target-queue.scala 325:43]
      end else begin
        REG_16_cfi_is_ret <= _GEN_1516;
      end
    end else begin
      REG_16_cfi_is_ret <= _GEN_1516;
    end
    if (5'h1f == io_redirect_bits) begin
      REG_16_cfi_npc_plus4 <= ram_31_cfi_npc_plus4;
    end else if (5'h1e == io_redirect_bits) begin
      REG_16_cfi_npc_plus4 <= ram_30_cfi_npc_plus4;
    end else if (5'h1d == io_redirect_bits) begin
      REG_16_cfi_npc_plus4 <= ram_29_cfi_npc_plus4;
    end else if (5'h1c == io_redirect_bits) begin
      REG_16_cfi_npc_plus4 <= ram_28_cfi_npc_plus4;
    end else begin
      REG_16_cfi_npc_plus4 <= _GEN_1480;
    end
    if (5'h1f == io_redirect_bits) begin
      REG_16_ras_top <= ram_31_ras_top;
    end else if (5'h1e == io_redirect_bits) begin
      REG_16_ras_top <= ram_30_ras_top;
    end else if (5'h1d == io_redirect_bits) begin
      REG_16_ras_top <= ram_29_ras_top;
    end else if (5'h1c == io_redirect_bits) begin
      REG_16_ras_top <= ram_28_ras_top;
    end else begin
      REG_16_ras_top <= _GEN_1448;
    end
    if (5'h1f == io_redirect_bits) begin
      REG_16_ras_idx <= ram_31_ras_idx;
    end else if (5'h1e == io_redirect_bits) begin
      REG_16_ras_idx <= ram_30_ras_idx;
    end else if (5'h1d == io_redirect_bits) begin
      REG_16_ras_idx <= ram_29_ras_idx;
    end else if (5'h1c == io_redirect_bits) begin
      REG_16_ras_idx <= ram_28_ras_idx;
    end else begin
      REG_16_ras_idx <= _GEN_1416;
    end
    if (5'h1f == io_redirect_bits) begin
      REG_16_start_bank <= ram_31_start_bank;
    end else if (5'h1e == io_redirect_bits) begin
      REG_16_start_bank <= ram_30_start_bank;
    end else if (5'h1d == io_redirect_bits) begin
      REG_16_start_bank <= ram_29_start_bank;
    end else if (5'h1c == io_redirect_bits) begin
      REG_16_start_bank <= ram_28_start_bank;
    end else begin
      REG_16_start_bank <= _GEN_1384;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_idx_valid <= ram_31_cfi_idx_valid; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_idx_valid <= ram_30_cfi_idx_valid; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_idx_valid <= ram_29_cfi_idx_valid; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_idx_valid <= ram_28_cfi_idx_valid; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_cfi_idx_valid <= _GEN_3356;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_idx_bits <= ram_31_cfi_idx_bits; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_idx_bits <= ram_30_cfi_idx_bits; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_idx_bits <= ram_29_cfi_idx_bits; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_idx_bits <= ram_28_cfi_idx_bits; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_cfi_idx_bits <= _GEN_3324;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_taken <= ram_31_cfi_taken; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_taken <= ram_30_cfi_taken; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_taken <= ram_29_cfi_taken; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_taken <= ram_28_cfi_taken; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_cfi_taken <= _GEN_3292;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_mispredicted <= ram_31_cfi_mispredicted; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_mispredicted <= ram_30_cfi_mispredicted; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_mispredicted <= ram_29_cfi_mispredicted; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_mispredicted <= ram_28_cfi_mispredicted; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_cfi_mispredicted <= _GEN_3260;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_type <= ram_31_cfi_type; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_type <= ram_30_cfi_type; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_type <= ram_29_cfi_type; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_type <= ram_28_cfi_type; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_cfi_type <= _GEN_3228;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_br_mask <= ram_31_br_mask; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_br_mask <= ram_30_br_mask; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_br_mask <= ram_29_br_mask; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_br_mask <= ram_28_br_mask; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_br_mask <= _GEN_3196;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_is_call <= ram_31_cfi_is_call; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_is_call <= ram_30_cfi_is_call; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_is_call <= ram_29_cfi_is_call; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_is_call <= ram_28_cfi_is_call; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_cfi_is_call <= _GEN_3164;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_is_ret <= ram_31_cfi_is_ret; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_is_ret <= ram_30_cfi_is_ret; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_is_ret <= ram_29_cfi_is_ret; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_is_ret <= ram_28_cfi_is_ret; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_cfi_is_ret <= _GEN_3132;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_npc_plus4 <= ram_31_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_npc_plus4 <= ram_30_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_npc_plus4 <= ram_29_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_cfi_npc_plus4 <= ram_28_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_cfi_npc_plus4 <= _GEN_3100;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_ras_top <= ram_31_ras_top; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_ras_top <= ram_30_ras_top; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_ras_top <= ram_29_ras_top; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_ras_top <= ram_28_ras_top; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_ras_top <= _GEN_3068;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_ras_idx <= ram_31_ras_idx; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_ras_idx <= ram_30_ras_idx; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_ras_idx <= ram_29_ras_idx; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_ras_idx <= ram_28_ras_idx; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_ras_idx <= _GEN_3036;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_start_bank <= ram_31_start_bank; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_start_bank <= ram_30_start_bank; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_start_bank <= ram_29_start_bank; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_17_start_bank <= ram_28_start_bank; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_17_start_bank <= _GEN_3004;
    end
    if (5'h1f == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 356:42]
      REG_18 <= pcs_31; // @[fetch-target-queue.scala 356:42]
    end else if (5'h1e == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 356:42]
      REG_18 <= pcs_30; // @[fetch-target-queue.scala 356:42]
    end else if (5'h1d == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 356:42]
      REG_18 <= pcs_29; // @[fetch-target-queue.scala 356:42]
    end else if (5'h1c == io_get_ftq_pc_0_ftq_idx) begin // @[fetch-target-queue.scala 356:42]
      REG_18 <= pcs_28; // @[fetch-target-queue.scala 356:42]
    end else begin
      REG_18 <= _GEN_3388;
    end
    if (_T_143) begin // @[fetch-target-queue.scala 348:22]
      REG_19 <= io_enq_bits_pc;
    end else if (5'h1f == _T_139) begin // @[fetch-target-queue.scala 348:22]
      REG_19 <= pcs_31; // @[fetch-target-queue.scala 348:22]
    end else if (5'h1e == _T_139) begin // @[fetch-target-queue.scala 348:22]
      REG_19 <= pcs_30; // @[fetch-target-queue.scala 348:22]
    end else if (5'h1d == _T_139) begin // @[fetch-target-queue.scala 348:22]
      REG_19 <= pcs_29; // @[fetch-target-queue.scala 348:22]
    end else begin
      REG_19 <= _GEN_2973;
    end
    REG_20 <= _T_139 != enq_ptr | _T_143; // @[fetch-target-queue.scala 358:64]
    if (5'h1f == _GEN_861) begin // @[fetch-target-queue.scala 359:42]
      REG_21 <= pcs_31; // @[fetch-target-queue.scala 359:42]
    end else if (5'h1e == _GEN_861) begin // @[fetch-target-queue.scala 359:42]
      REG_21 <= pcs_30; // @[fetch-target-queue.scala 359:42]
    end else if (5'h1d == _GEN_861) begin // @[fetch-target-queue.scala 359:42]
      REG_21 <= pcs_29; // @[fetch-target-queue.scala 359:42]
    end else if (5'h1c == _GEN_861) begin // @[fetch-target-queue.scala 359:42]
      REG_21 <= pcs_28; // @[fetch-target-queue.scala 359:42]
    end else begin
      REG_21 <= _GEN_3420;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_idx_valid <= ram_31_cfi_idx_valid; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_idx_valid <= ram_30_cfi_idx_valid; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_idx_valid <= ram_29_cfi_idx_valid; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_idx_valid <= ram_28_cfi_idx_valid; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_cfi_idx_valid <= _GEN_3836;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_idx_bits <= ram_31_cfi_idx_bits; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_idx_bits <= ram_30_cfi_idx_bits; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_idx_bits <= ram_29_cfi_idx_bits; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_idx_bits <= ram_28_cfi_idx_bits; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_cfi_idx_bits <= _GEN_3804;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_taken <= ram_31_cfi_taken; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_taken <= ram_30_cfi_taken; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_taken <= ram_29_cfi_taken; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_taken <= ram_28_cfi_taken; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_cfi_taken <= _GEN_3772;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_mispredicted <= ram_31_cfi_mispredicted; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_mispredicted <= ram_30_cfi_mispredicted; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_mispredicted <= ram_29_cfi_mispredicted; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_mispredicted <= ram_28_cfi_mispredicted; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_cfi_mispredicted <= _GEN_3740;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_type <= ram_31_cfi_type; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_type <= ram_30_cfi_type; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_type <= ram_29_cfi_type; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_type <= ram_28_cfi_type; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_cfi_type <= _GEN_3708;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_br_mask <= ram_31_br_mask; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_br_mask <= ram_30_br_mask; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_br_mask <= ram_29_br_mask; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_br_mask <= ram_28_br_mask; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_br_mask <= _GEN_3676;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_is_call <= ram_31_cfi_is_call; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_is_call <= ram_30_cfi_is_call; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_is_call <= ram_29_cfi_is_call; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_is_call <= ram_28_cfi_is_call; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_cfi_is_call <= _GEN_3644;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_is_ret <= ram_31_cfi_is_ret; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_is_ret <= ram_30_cfi_is_ret; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_is_ret <= ram_29_cfi_is_ret; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_is_ret <= ram_28_cfi_is_ret; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_cfi_is_ret <= _GEN_3612;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_npc_plus4 <= ram_31_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_npc_plus4 <= ram_30_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_npc_plus4 <= ram_29_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_cfi_npc_plus4 <= ram_28_cfi_npc_plus4; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_cfi_npc_plus4 <= _GEN_3580;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_ras_top <= ram_31_ras_top; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_ras_top <= ram_30_ras_top; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_ras_top <= ram_29_ras_top; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_ras_top <= ram_28_ras_top; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_ras_top <= _GEN_3548;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_ras_idx <= ram_31_ras_idx; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_ras_idx <= ram_30_ras_idx; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_ras_idx <= ram_29_ras_idx; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_ras_idx <= ram_28_ras_idx; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_ras_idx <= _GEN_3516;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_start_bank <= ram_31_start_bank; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_start_bank <= ram_30_start_bank; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_start_bank <= ram_29_start_bank; // @[fetch-target-queue.scala 351:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 351:42]
      REG_22_start_bank <= ram_28_start_bank; // @[fetch-target-queue.scala 351:42]
    end else begin
      REG_22_start_bank <= _GEN_3484;
    end
    if (5'h1f == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 356:42]
      REG_23 <= pcs_31; // @[fetch-target-queue.scala 356:42]
    end else if (5'h1e == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 356:42]
      REG_23 <= pcs_30; // @[fetch-target-queue.scala 356:42]
    end else if (5'h1d == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 356:42]
      REG_23 <= pcs_29; // @[fetch-target-queue.scala 356:42]
    end else if (5'h1c == io_get_ftq_pc_1_ftq_idx) begin // @[fetch-target-queue.scala 356:42]
      REG_23 <= pcs_28; // @[fetch-target-queue.scala 356:42]
    end else begin
      REG_23 <= _GEN_3870;
    end
    if (_T_153) begin // @[fetch-target-queue.scala 348:22]
      REG_24 <= io_enq_bits_pc;
    end else if (5'h1f == _T_149) begin // @[fetch-target-queue.scala 348:22]
      REG_24 <= pcs_31; // @[fetch-target-queue.scala 348:22]
    end else if (5'h1e == _T_149) begin // @[fetch-target-queue.scala 348:22]
      REG_24 <= pcs_30; // @[fetch-target-queue.scala 348:22]
    end else if (5'h1d == _T_149) begin // @[fetch-target-queue.scala 348:22]
      REG_24 <= pcs_29; // @[fetch-target-queue.scala 348:22]
    end else begin
      REG_24 <= _GEN_3453;
    end
    REG_25 <= _T_149 != enq_ptr | _T_153; // @[fetch-target-queue.scala 358:64]
    if (5'h1f == _GEN_861) begin // @[fetch-target-queue.scala 359:42]
      REG_26 <= pcs_31; // @[fetch-target-queue.scala 359:42]
    end else if (5'h1e == _GEN_861) begin // @[fetch-target-queue.scala 359:42]
      REG_26 <= pcs_30; // @[fetch-target-queue.scala 359:42]
    end else if (5'h1d == _GEN_861) begin // @[fetch-target-queue.scala 359:42]
      REG_26 <= pcs_29; // @[fetch-target-queue.scala 359:42]
    end else if (5'h1c == _GEN_861) begin // @[fetch-target-queue.scala 359:42]
      REG_26 <= pcs_28; // @[fetch-target-queue.scala 359:42]
    end else begin
      REG_26 <= _GEN_3420;
    end
    if (5'h1f == io_debug_ftq_idx_0) begin // @[fetch-target-queue.scala 363:36]
      REG_27 <= pcs_31; // @[fetch-target-queue.scala 363:36]
    end else if (5'h1e == io_debug_ftq_idx_0) begin // @[fetch-target-queue.scala 363:36]
      REG_27 <= pcs_30; // @[fetch-target-queue.scala 363:36]
    end else if (5'h1d == io_debug_ftq_idx_0) begin // @[fetch-target-queue.scala 363:36]
      REG_27 <= pcs_29; // @[fetch-target-queue.scala 363:36]
    end else if (5'h1c == io_debug_ftq_idx_0) begin // @[fetch-target-queue.scala 363:36]
      REG_27 <= pcs_28; // @[fetch-target-queue.scala 363:36]
    end else begin
      REG_27 <= _GEN_3934;
    end
    if (5'h1f == io_debug_ftq_idx_1) begin // @[fetch-target-queue.scala 363:36]
      REG_28 <= pcs_31; // @[fetch-target-queue.scala 363:36]
    end else if (5'h1e == io_debug_ftq_idx_1) begin // @[fetch-target-queue.scala 363:36]
      REG_28 <= pcs_30; // @[fetch-target-queue.scala 363:36]
    end else if (5'h1d == io_debug_ftq_idx_1) begin // @[fetch-target-queue.scala 363:36]
      REG_28 <= pcs_29; // @[fetch-target-queue.scala 363:36]
    end else if (5'h1c == io_debug_ftq_idx_1) begin // @[fetch-target-queue.scala 363:36]
      REG_28 <= pcs_28; // @[fetch-target-queue.scala 363:36]
    end else begin
      REG_28 <= _GEN_3966;
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
  _RAND_0 = {4{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    meta_0[initvar] = _RAND_0[119:0];
  _RAND_2 = {2{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ghist_0_old_history[initvar] = _RAND_2[63:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ghist_0_current_saw_branch_not_taken[initvar] = _RAND_4[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ghist_0_new_saw_branch_not_taken[initvar] = _RAND_6[0:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ghist_0_new_saw_branch_taken[initvar] = _RAND_8[0:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ghist_0_ras_idx[initvar] = _RAND_10[4:0];
  _RAND_12 = {2{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ghist_1_old_history[initvar] = _RAND_12[63:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ghist_1_current_saw_branch_not_taken[initvar] = _RAND_14[0:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ghist_1_new_saw_branch_not_taken[initvar] = _RAND_16[0:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ghist_1_new_saw_branch_taken[initvar] = _RAND_18[0:0];
  _RAND_20 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ghist_1_ras_idx[initvar] = _RAND_20[4:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  meta_0_bpd_meta_addr_pipe_0 = _RAND_1[4:0];
  _RAND_3 = {1{`RANDOM}};
  ghist_0_old_history_bpd_ghist_addr_pipe_0 = _RAND_3[4:0];
  _RAND_5 = {1{`RANDOM}};
  ghist_0_current_saw_branch_not_taken_bpd_ghist_addr_pipe_0 = _RAND_5[4:0];
  _RAND_7 = {1{`RANDOM}};
  ghist_0_new_saw_branch_not_taken_bpd_ghist_addr_pipe_0 = _RAND_7[4:0];
  _RAND_9 = {1{`RANDOM}};
  ghist_0_new_saw_branch_taken_bpd_ghist_addr_pipe_0 = _RAND_9[4:0];
  _RAND_11 = {1{`RANDOM}};
  ghist_0_ras_idx_bpd_ghist_addr_pipe_0 = _RAND_11[4:0];
  _RAND_13 = {1{`RANDOM}};
  ghist_1_old_history_MPORT_3_addr_pipe_0 = _RAND_13[4:0];
  _RAND_15 = {1{`RANDOM}};
  ghist_1_current_saw_branch_not_taken_MPORT_3_addr_pipe_0 = _RAND_15[4:0];
  _RAND_17 = {1{`RANDOM}};
  ghist_1_new_saw_branch_not_taken_MPORT_3_addr_pipe_0 = _RAND_17[4:0];
  _RAND_19 = {1{`RANDOM}};
  ghist_1_new_saw_branch_taken_MPORT_3_addr_pipe_0 = _RAND_19[4:0];
  _RAND_21 = {1{`RANDOM}};
  ghist_1_ras_idx_MPORT_3_addr_pipe_0 = _RAND_21[4:0];
  _RAND_22 = {1{`RANDOM}};
  bpd_ptr = _RAND_22[4:0];
  _RAND_23 = {1{`RANDOM}};
  deq_ptr = _RAND_23[4:0];
  _RAND_24 = {1{`RANDOM}};
  enq_ptr = _RAND_24[4:0];
  _RAND_25 = {2{`RANDOM}};
  pcs_0 = _RAND_25[39:0];
  _RAND_26 = {2{`RANDOM}};
  pcs_1 = _RAND_26[39:0];
  _RAND_27 = {2{`RANDOM}};
  pcs_2 = _RAND_27[39:0];
  _RAND_28 = {2{`RANDOM}};
  pcs_3 = _RAND_28[39:0];
  _RAND_29 = {2{`RANDOM}};
  pcs_4 = _RAND_29[39:0];
  _RAND_30 = {2{`RANDOM}};
  pcs_5 = _RAND_30[39:0];
  _RAND_31 = {2{`RANDOM}};
  pcs_6 = _RAND_31[39:0];
  _RAND_32 = {2{`RANDOM}};
  pcs_7 = _RAND_32[39:0];
  _RAND_33 = {2{`RANDOM}};
  pcs_8 = _RAND_33[39:0];
  _RAND_34 = {2{`RANDOM}};
  pcs_9 = _RAND_34[39:0];
  _RAND_35 = {2{`RANDOM}};
  pcs_10 = _RAND_35[39:0];
  _RAND_36 = {2{`RANDOM}};
  pcs_11 = _RAND_36[39:0];
  _RAND_37 = {2{`RANDOM}};
  pcs_12 = _RAND_37[39:0];
  _RAND_38 = {2{`RANDOM}};
  pcs_13 = _RAND_38[39:0];
  _RAND_39 = {2{`RANDOM}};
  pcs_14 = _RAND_39[39:0];
  _RAND_40 = {2{`RANDOM}};
  pcs_15 = _RAND_40[39:0];
  _RAND_41 = {2{`RANDOM}};
  pcs_16 = _RAND_41[39:0];
  _RAND_42 = {2{`RANDOM}};
  pcs_17 = _RAND_42[39:0];
  _RAND_43 = {2{`RANDOM}};
  pcs_18 = _RAND_43[39:0];
  _RAND_44 = {2{`RANDOM}};
  pcs_19 = _RAND_44[39:0];
  _RAND_45 = {2{`RANDOM}};
  pcs_20 = _RAND_45[39:0];
  _RAND_46 = {2{`RANDOM}};
  pcs_21 = _RAND_46[39:0];
  _RAND_47 = {2{`RANDOM}};
  pcs_22 = _RAND_47[39:0];
  _RAND_48 = {2{`RANDOM}};
  pcs_23 = _RAND_48[39:0];
  _RAND_49 = {2{`RANDOM}};
  pcs_24 = _RAND_49[39:0];
  _RAND_50 = {2{`RANDOM}};
  pcs_25 = _RAND_50[39:0];
  _RAND_51 = {2{`RANDOM}};
  pcs_26 = _RAND_51[39:0];
  _RAND_52 = {2{`RANDOM}};
  pcs_27 = _RAND_52[39:0];
  _RAND_53 = {2{`RANDOM}};
  pcs_28 = _RAND_53[39:0];
  _RAND_54 = {2{`RANDOM}};
  pcs_29 = _RAND_54[39:0];
  _RAND_55 = {2{`RANDOM}};
  pcs_30 = _RAND_55[39:0];
  _RAND_56 = {2{`RANDOM}};
  pcs_31 = _RAND_56[39:0];
  _RAND_57 = {1{`RANDOM}};
  ram_0_cfi_idx_valid = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  ram_0_cfi_idx_bits = _RAND_58[1:0];
  _RAND_59 = {1{`RANDOM}};
  ram_0_cfi_taken = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  ram_0_cfi_mispredicted = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  ram_0_cfi_type = _RAND_61[2:0];
  _RAND_62 = {1{`RANDOM}};
  ram_0_br_mask = _RAND_62[3:0];
  _RAND_63 = {1{`RANDOM}};
  ram_0_cfi_is_call = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  ram_0_cfi_is_ret = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  ram_0_cfi_npc_plus4 = _RAND_65[0:0];
  _RAND_66 = {2{`RANDOM}};
  ram_0_ras_top = _RAND_66[39:0];
  _RAND_67 = {1{`RANDOM}};
  ram_0_ras_idx = _RAND_67[4:0];
  _RAND_68 = {1{`RANDOM}};
  ram_0_start_bank = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  ram_1_cfi_idx_valid = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  ram_1_cfi_idx_bits = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  ram_1_cfi_taken = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  ram_1_cfi_mispredicted = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  ram_1_cfi_type = _RAND_73[2:0];
  _RAND_74 = {1{`RANDOM}};
  ram_1_br_mask = _RAND_74[3:0];
  _RAND_75 = {1{`RANDOM}};
  ram_1_cfi_is_call = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  ram_1_cfi_is_ret = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  ram_1_cfi_npc_plus4 = _RAND_77[0:0];
  _RAND_78 = {2{`RANDOM}};
  ram_1_ras_top = _RAND_78[39:0];
  _RAND_79 = {1{`RANDOM}};
  ram_1_ras_idx = _RAND_79[4:0];
  _RAND_80 = {1{`RANDOM}};
  ram_1_start_bank = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  ram_2_cfi_idx_valid = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  ram_2_cfi_idx_bits = _RAND_82[1:0];
  _RAND_83 = {1{`RANDOM}};
  ram_2_cfi_taken = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  ram_2_cfi_mispredicted = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  ram_2_cfi_type = _RAND_85[2:0];
  _RAND_86 = {1{`RANDOM}};
  ram_2_br_mask = _RAND_86[3:0];
  _RAND_87 = {1{`RANDOM}};
  ram_2_cfi_is_call = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  ram_2_cfi_is_ret = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  ram_2_cfi_npc_plus4 = _RAND_89[0:0];
  _RAND_90 = {2{`RANDOM}};
  ram_2_ras_top = _RAND_90[39:0];
  _RAND_91 = {1{`RANDOM}};
  ram_2_ras_idx = _RAND_91[4:0];
  _RAND_92 = {1{`RANDOM}};
  ram_2_start_bank = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  ram_3_cfi_idx_valid = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  ram_3_cfi_idx_bits = _RAND_94[1:0];
  _RAND_95 = {1{`RANDOM}};
  ram_3_cfi_taken = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  ram_3_cfi_mispredicted = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  ram_3_cfi_type = _RAND_97[2:0];
  _RAND_98 = {1{`RANDOM}};
  ram_3_br_mask = _RAND_98[3:0];
  _RAND_99 = {1{`RANDOM}};
  ram_3_cfi_is_call = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  ram_3_cfi_is_ret = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  ram_3_cfi_npc_plus4 = _RAND_101[0:0];
  _RAND_102 = {2{`RANDOM}};
  ram_3_ras_top = _RAND_102[39:0];
  _RAND_103 = {1{`RANDOM}};
  ram_3_ras_idx = _RAND_103[4:0];
  _RAND_104 = {1{`RANDOM}};
  ram_3_start_bank = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  ram_4_cfi_idx_valid = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  ram_4_cfi_idx_bits = _RAND_106[1:0];
  _RAND_107 = {1{`RANDOM}};
  ram_4_cfi_taken = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  ram_4_cfi_mispredicted = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  ram_4_cfi_type = _RAND_109[2:0];
  _RAND_110 = {1{`RANDOM}};
  ram_4_br_mask = _RAND_110[3:0];
  _RAND_111 = {1{`RANDOM}};
  ram_4_cfi_is_call = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  ram_4_cfi_is_ret = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  ram_4_cfi_npc_plus4 = _RAND_113[0:0];
  _RAND_114 = {2{`RANDOM}};
  ram_4_ras_top = _RAND_114[39:0];
  _RAND_115 = {1{`RANDOM}};
  ram_4_ras_idx = _RAND_115[4:0];
  _RAND_116 = {1{`RANDOM}};
  ram_4_start_bank = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  ram_5_cfi_idx_valid = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  ram_5_cfi_idx_bits = _RAND_118[1:0];
  _RAND_119 = {1{`RANDOM}};
  ram_5_cfi_taken = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  ram_5_cfi_mispredicted = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  ram_5_cfi_type = _RAND_121[2:0];
  _RAND_122 = {1{`RANDOM}};
  ram_5_br_mask = _RAND_122[3:0];
  _RAND_123 = {1{`RANDOM}};
  ram_5_cfi_is_call = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  ram_5_cfi_is_ret = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  ram_5_cfi_npc_plus4 = _RAND_125[0:0];
  _RAND_126 = {2{`RANDOM}};
  ram_5_ras_top = _RAND_126[39:0];
  _RAND_127 = {1{`RANDOM}};
  ram_5_ras_idx = _RAND_127[4:0];
  _RAND_128 = {1{`RANDOM}};
  ram_5_start_bank = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  ram_6_cfi_idx_valid = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  ram_6_cfi_idx_bits = _RAND_130[1:0];
  _RAND_131 = {1{`RANDOM}};
  ram_6_cfi_taken = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  ram_6_cfi_mispredicted = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  ram_6_cfi_type = _RAND_133[2:0];
  _RAND_134 = {1{`RANDOM}};
  ram_6_br_mask = _RAND_134[3:0];
  _RAND_135 = {1{`RANDOM}};
  ram_6_cfi_is_call = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  ram_6_cfi_is_ret = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  ram_6_cfi_npc_plus4 = _RAND_137[0:0];
  _RAND_138 = {2{`RANDOM}};
  ram_6_ras_top = _RAND_138[39:0];
  _RAND_139 = {1{`RANDOM}};
  ram_6_ras_idx = _RAND_139[4:0];
  _RAND_140 = {1{`RANDOM}};
  ram_6_start_bank = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  ram_7_cfi_idx_valid = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  ram_7_cfi_idx_bits = _RAND_142[1:0];
  _RAND_143 = {1{`RANDOM}};
  ram_7_cfi_taken = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  ram_7_cfi_mispredicted = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  ram_7_cfi_type = _RAND_145[2:0];
  _RAND_146 = {1{`RANDOM}};
  ram_7_br_mask = _RAND_146[3:0];
  _RAND_147 = {1{`RANDOM}};
  ram_7_cfi_is_call = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  ram_7_cfi_is_ret = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  ram_7_cfi_npc_plus4 = _RAND_149[0:0];
  _RAND_150 = {2{`RANDOM}};
  ram_7_ras_top = _RAND_150[39:0];
  _RAND_151 = {1{`RANDOM}};
  ram_7_ras_idx = _RAND_151[4:0];
  _RAND_152 = {1{`RANDOM}};
  ram_7_start_bank = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  ram_8_cfi_idx_valid = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  ram_8_cfi_idx_bits = _RAND_154[1:0];
  _RAND_155 = {1{`RANDOM}};
  ram_8_cfi_taken = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  ram_8_cfi_mispredicted = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  ram_8_cfi_type = _RAND_157[2:0];
  _RAND_158 = {1{`RANDOM}};
  ram_8_br_mask = _RAND_158[3:0];
  _RAND_159 = {1{`RANDOM}};
  ram_8_cfi_is_call = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  ram_8_cfi_is_ret = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  ram_8_cfi_npc_plus4 = _RAND_161[0:0];
  _RAND_162 = {2{`RANDOM}};
  ram_8_ras_top = _RAND_162[39:0];
  _RAND_163 = {1{`RANDOM}};
  ram_8_ras_idx = _RAND_163[4:0];
  _RAND_164 = {1{`RANDOM}};
  ram_8_start_bank = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  ram_9_cfi_idx_valid = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  ram_9_cfi_idx_bits = _RAND_166[1:0];
  _RAND_167 = {1{`RANDOM}};
  ram_9_cfi_taken = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  ram_9_cfi_mispredicted = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  ram_9_cfi_type = _RAND_169[2:0];
  _RAND_170 = {1{`RANDOM}};
  ram_9_br_mask = _RAND_170[3:0];
  _RAND_171 = {1{`RANDOM}};
  ram_9_cfi_is_call = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  ram_9_cfi_is_ret = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  ram_9_cfi_npc_plus4 = _RAND_173[0:0];
  _RAND_174 = {2{`RANDOM}};
  ram_9_ras_top = _RAND_174[39:0];
  _RAND_175 = {1{`RANDOM}};
  ram_9_ras_idx = _RAND_175[4:0];
  _RAND_176 = {1{`RANDOM}};
  ram_9_start_bank = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  ram_10_cfi_idx_valid = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  ram_10_cfi_idx_bits = _RAND_178[1:0];
  _RAND_179 = {1{`RANDOM}};
  ram_10_cfi_taken = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  ram_10_cfi_mispredicted = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  ram_10_cfi_type = _RAND_181[2:0];
  _RAND_182 = {1{`RANDOM}};
  ram_10_br_mask = _RAND_182[3:0];
  _RAND_183 = {1{`RANDOM}};
  ram_10_cfi_is_call = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  ram_10_cfi_is_ret = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  ram_10_cfi_npc_plus4 = _RAND_185[0:0];
  _RAND_186 = {2{`RANDOM}};
  ram_10_ras_top = _RAND_186[39:0];
  _RAND_187 = {1{`RANDOM}};
  ram_10_ras_idx = _RAND_187[4:0];
  _RAND_188 = {1{`RANDOM}};
  ram_10_start_bank = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  ram_11_cfi_idx_valid = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  ram_11_cfi_idx_bits = _RAND_190[1:0];
  _RAND_191 = {1{`RANDOM}};
  ram_11_cfi_taken = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  ram_11_cfi_mispredicted = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  ram_11_cfi_type = _RAND_193[2:0];
  _RAND_194 = {1{`RANDOM}};
  ram_11_br_mask = _RAND_194[3:0];
  _RAND_195 = {1{`RANDOM}};
  ram_11_cfi_is_call = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  ram_11_cfi_is_ret = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  ram_11_cfi_npc_plus4 = _RAND_197[0:0];
  _RAND_198 = {2{`RANDOM}};
  ram_11_ras_top = _RAND_198[39:0];
  _RAND_199 = {1{`RANDOM}};
  ram_11_ras_idx = _RAND_199[4:0];
  _RAND_200 = {1{`RANDOM}};
  ram_11_start_bank = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  ram_12_cfi_idx_valid = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  ram_12_cfi_idx_bits = _RAND_202[1:0];
  _RAND_203 = {1{`RANDOM}};
  ram_12_cfi_taken = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  ram_12_cfi_mispredicted = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  ram_12_cfi_type = _RAND_205[2:0];
  _RAND_206 = {1{`RANDOM}};
  ram_12_br_mask = _RAND_206[3:0];
  _RAND_207 = {1{`RANDOM}};
  ram_12_cfi_is_call = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  ram_12_cfi_is_ret = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  ram_12_cfi_npc_plus4 = _RAND_209[0:0];
  _RAND_210 = {2{`RANDOM}};
  ram_12_ras_top = _RAND_210[39:0];
  _RAND_211 = {1{`RANDOM}};
  ram_12_ras_idx = _RAND_211[4:0];
  _RAND_212 = {1{`RANDOM}};
  ram_12_start_bank = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  ram_13_cfi_idx_valid = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  ram_13_cfi_idx_bits = _RAND_214[1:0];
  _RAND_215 = {1{`RANDOM}};
  ram_13_cfi_taken = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  ram_13_cfi_mispredicted = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  ram_13_cfi_type = _RAND_217[2:0];
  _RAND_218 = {1{`RANDOM}};
  ram_13_br_mask = _RAND_218[3:0];
  _RAND_219 = {1{`RANDOM}};
  ram_13_cfi_is_call = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  ram_13_cfi_is_ret = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  ram_13_cfi_npc_plus4 = _RAND_221[0:0];
  _RAND_222 = {2{`RANDOM}};
  ram_13_ras_top = _RAND_222[39:0];
  _RAND_223 = {1{`RANDOM}};
  ram_13_ras_idx = _RAND_223[4:0];
  _RAND_224 = {1{`RANDOM}};
  ram_13_start_bank = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  ram_14_cfi_idx_valid = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  ram_14_cfi_idx_bits = _RAND_226[1:0];
  _RAND_227 = {1{`RANDOM}};
  ram_14_cfi_taken = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  ram_14_cfi_mispredicted = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  ram_14_cfi_type = _RAND_229[2:0];
  _RAND_230 = {1{`RANDOM}};
  ram_14_br_mask = _RAND_230[3:0];
  _RAND_231 = {1{`RANDOM}};
  ram_14_cfi_is_call = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  ram_14_cfi_is_ret = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  ram_14_cfi_npc_plus4 = _RAND_233[0:0];
  _RAND_234 = {2{`RANDOM}};
  ram_14_ras_top = _RAND_234[39:0];
  _RAND_235 = {1{`RANDOM}};
  ram_14_ras_idx = _RAND_235[4:0];
  _RAND_236 = {1{`RANDOM}};
  ram_14_start_bank = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  ram_15_cfi_idx_valid = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  ram_15_cfi_idx_bits = _RAND_238[1:0];
  _RAND_239 = {1{`RANDOM}};
  ram_15_cfi_taken = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  ram_15_cfi_mispredicted = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  ram_15_cfi_type = _RAND_241[2:0];
  _RAND_242 = {1{`RANDOM}};
  ram_15_br_mask = _RAND_242[3:0];
  _RAND_243 = {1{`RANDOM}};
  ram_15_cfi_is_call = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  ram_15_cfi_is_ret = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  ram_15_cfi_npc_plus4 = _RAND_245[0:0];
  _RAND_246 = {2{`RANDOM}};
  ram_15_ras_top = _RAND_246[39:0];
  _RAND_247 = {1{`RANDOM}};
  ram_15_ras_idx = _RAND_247[4:0];
  _RAND_248 = {1{`RANDOM}};
  ram_15_start_bank = _RAND_248[0:0];
  _RAND_249 = {1{`RANDOM}};
  ram_16_cfi_idx_valid = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  ram_16_cfi_idx_bits = _RAND_250[1:0];
  _RAND_251 = {1{`RANDOM}};
  ram_16_cfi_taken = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  ram_16_cfi_mispredicted = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  ram_16_cfi_type = _RAND_253[2:0];
  _RAND_254 = {1{`RANDOM}};
  ram_16_br_mask = _RAND_254[3:0];
  _RAND_255 = {1{`RANDOM}};
  ram_16_cfi_is_call = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  ram_16_cfi_is_ret = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  ram_16_cfi_npc_plus4 = _RAND_257[0:0];
  _RAND_258 = {2{`RANDOM}};
  ram_16_ras_top = _RAND_258[39:0];
  _RAND_259 = {1{`RANDOM}};
  ram_16_ras_idx = _RAND_259[4:0];
  _RAND_260 = {1{`RANDOM}};
  ram_16_start_bank = _RAND_260[0:0];
  _RAND_261 = {1{`RANDOM}};
  ram_17_cfi_idx_valid = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  ram_17_cfi_idx_bits = _RAND_262[1:0];
  _RAND_263 = {1{`RANDOM}};
  ram_17_cfi_taken = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  ram_17_cfi_mispredicted = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  ram_17_cfi_type = _RAND_265[2:0];
  _RAND_266 = {1{`RANDOM}};
  ram_17_br_mask = _RAND_266[3:0];
  _RAND_267 = {1{`RANDOM}};
  ram_17_cfi_is_call = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  ram_17_cfi_is_ret = _RAND_268[0:0];
  _RAND_269 = {1{`RANDOM}};
  ram_17_cfi_npc_plus4 = _RAND_269[0:0];
  _RAND_270 = {2{`RANDOM}};
  ram_17_ras_top = _RAND_270[39:0];
  _RAND_271 = {1{`RANDOM}};
  ram_17_ras_idx = _RAND_271[4:0];
  _RAND_272 = {1{`RANDOM}};
  ram_17_start_bank = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  ram_18_cfi_idx_valid = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  ram_18_cfi_idx_bits = _RAND_274[1:0];
  _RAND_275 = {1{`RANDOM}};
  ram_18_cfi_taken = _RAND_275[0:0];
  _RAND_276 = {1{`RANDOM}};
  ram_18_cfi_mispredicted = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  ram_18_cfi_type = _RAND_277[2:0];
  _RAND_278 = {1{`RANDOM}};
  ram_18_br_mask = _RAND_278[3:0];
  _RAND_279 = {1{`RANDOM}};
  ram_18_cfi_is_call = _RAND_279[0:0];
  _RAND_280 = {1{`RANDOM}};
  ram_18_cfi_is_ret = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  ram_18_cfi_npc_plus4 = _RAND_281[0:0];
  _RAND_282 = {2{`RANDOM}};
  ram_18_ras_top = _RAND_282[39:0];
  _RAND_283 = {1{`RANDOM}};
  ram_18_ras_idx = _RAND_283[4:0];
  _RAND_284 = {1{`RANDOM}};
  ram_18_start_bank = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  ram_19_cfi_idx_valid = _RAND_285[0:0];
  _RAND_286 = {1{`RANDOM}};
  ram_19_cfi_idx_bits = _RAND_286[1:0];
  _RAND_287 = {1{`RANDOM}};
  ram_19_cfi_taken = _RAND_287[0:0];
  _RAND_288 = {1{`RANDOM}};
  ram_19_cfi_mispredicted = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  ram_19_cfi_type = _RAND_289[2:0];
  _RAND_290 = {1{`RANDOM}};
  ram_19_br_mask = _RAND_290[3:0];
  _RAND_291 = {1{`RANDOM}};
  ram_19_cfi_is_call = _RAND_291[0:0];
  _RAND_292 = {1{`RANDOM}};
  ram_19_cfi_is_ret = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  ram_19_cfi_npc_plus4 = _RAND_293[0:0];
  _RAND_294 = {2{`RANDOM}};
  ram_19_ras_top = _RAND_294[39:0];
  _RAND_295 = {1{`RANDOM}};
  ram_19_ras_idx = _RAND_295[4:0];
  _RAND_296 = {1{`RANDOM}};
  ram_19_start_bank = _RAND_296[0:0];
  _RAND_297 = {1{`RANDOM}};
  ram_20_cfi_idx_valid = _RAND_297[0:0];
  _RAND_298 = {1{`RANDOM}};
  ram_20_cfi_idx_bits = _RAND_298[1:0];
  _RAND_299 = {1{`RANDOM}};
  ram_20_cfi_taken = _RAND_299[0:0];
  _RAND_300 = {1{`RANDOM}};
  ram_20_cfi_mispredicted = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  ram_20_cfi_type = _RAND_301[2:0];
  _RAND_302 = {1{`RANDOM}};
  ram_20_br_mask = _RAND_302[3:0];
  _RAND_303 = {1{`RANDOM}};
  ram_20_cfi_is_call = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  ram_20_cfi_is_ret = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  ram_20_cfi_npc_plus4 = _RAND_305[0:0];
  _RAND_306 = {2{`RANDOM}};
  ram_20_ras_top = _RAND_306[39:0];
  _RAND_307 = {1{`RANDOM}};
  ram_20_ras_idx = _RAND_307[4:0];
  _RAND_308 = {1{`RANDOM}};
  ram_20_start_bank = _RAND_308[0:0];
  _RAND_309 = {1{`RANDOM}};
  ram_21_cfi_idx_valid = _RAND_309[0:0];
  _RAND_310 = {1{`RANDOM}};
  ram_21_cfi_idx_bits = _RAND_310[1:0];
  _RAND_311 = {1{`RANDOM}};
  ram_21_cfi_taken = _RAND_311[0:0];
  _RAND_312 = {1{`RANDOM}};
  ram_21_cfi_mispredicted = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  ram_21_cfi_type = _RAND_313[2:0];
  _RAND_314 = {1{`RANDOM}};
  ram_21_br_mask = _RAND_314[3:0];
  _RAND_315 = {1{`RANDOM}};
  ram_21_cfi_is_call = _RAND_315[0:0];
  _RAND_316 = {1{`RANDOM}};
  ram_21_cfi_is_ret = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  ram_21_cfi_npc_plus4 = _RAND_317[0:0];
  _RAND_318 = {2{`RANDOM}};
  ram_21_ras_top = _RAND_318[39:0];
  _RAND_319 = {1{`RANDOM}};
  ram_21_ras_idx = _RAND_319[4:0];
  _RAND_320 = {1{`RANDOM}};
  ram_21_start_bank = _RAND_320[0:0];
  _RAND_321 = {1{`RANDOM}};
  ram_22_cfi_idx_valid = _RAND_321[0:0];
  _RAND_322 = {1{`RANDOM}};
  ram_22_cfi_idx_bits = _RAND_322[1:0];
  _RAND_323 = {1{`RANDOM}};
  ram_22_cfi_taken = _RAND_323[0:0];
  _RAND_324 = {1{`RANDOM}};
  ram_22_cfi_mispredicted = _RAND_324[0:0];
  _RAND_325 = {1{`RANDOM}};
  ram_22_cfi_type = _RAND_325[2:0];
  _RAND_326 = {1{`RANDOM}};
  ram_22_br_mask = _RAND_326[3:0];
  _RAND_327 = {1{`RANDOM}};
  ram_22_cfi_is_call = _RAND_327[0:0];
  _RAND_328 = {1{`RANDOM}};
  ram_22_cfi_is_ret = _RAND_328[0:0];
  _RAND_329 = {1{`RANDOM}};
  ram_22_cfi_npc_plus4 = _RAND_329[0:0];
  _RAND_330 = {2{`RANDOM}};
  ram_22_ras_top = _RAND_330[39:0];
  _RAND_331 = {1{`RANDOM}};
  ram_22_ras_idx = _RAND_331[4:0];
  _RAND_332 = {1{`RANDOM}};
  ram_22_start_bank = _RAND_332[0:0];
  _RAND_333 = {1{`RANDOM}};
  ram_23_cfi_idx_valid = _RAND_333[0:0];
  _RAND_334 = {1{`RANDOM}};
  ram_23_cfi_idx_bits = _RAND_334[1:0];
  _RAND_335 = {1{`RANDOM}};
  ram_23_cfi_taken = _RAND_335[0:0];
  _RAND_336 = {1{`RANDOM}};
  ram_23_cfi_mispredicted = _RAND_336[0:0];
  _RAND_337 = {1{`RANDOM}};
  ram_23_cfi_type = _RAND_337[2:0];
  _RAND_338 = {1{`RANDOM}};
  ram_23_br_mask = _RAND_338[3:0];
  _RAND_339 = {1{`RANDOM}};
  ram_23_cfi_is_call = _RAND_339[0:0];
  _RAND_340 = {1{`RANDOM}};
  ram_23_cfi_is_ret = _RAND_340[0:0];
  _RAND_341 = {1{`RANDOM}};
  ram_23_cfi_npc_plus4 = _RAND_341[0:0];
  _RAND_342 = {2{`RANDOM}};
  ram_23_ras_top = _RAND_342[39:0];
  _RAND_343 = {1{`RANDOM}};
  ram_23_ras_idx = _RAND_343[4:0];
  _RAND_344 = {1{`RANDOM}};
  ram_23_start_bank = _RAND_344[0:0];
  _RAND_345 = {1{`RANDOM}};
  ram_24_cfi_idx_valid = _RAND_345[0:0];
  _RAND_346 = {1{`RANDOM}};
  ram_24_cfi_idx_bits = _RAND_346[1:0];
  _RAND_347 = {1{`RANDOM}};
  ram_24_cfi_taken = _RAND_347[0:0];
  _RAND_348 = {1{`RANDOM}};
  ram_24_cfi_mispredicted = _RAND_348[0:0];
  _RAND_349 = {1{`RANDOM}};
  ram_24_cfi_type = _RAND_349[2:0];
  _RAND_350 = {1{`RANDOM}};
  ram_24_br_mask = _RAND_350[3:0];
  _RAND_351 = {1{`RANDOM}};
  ram_24_cfi_is_call = _RAND_351[0:0];
  _RAND_352 = {1{`RANDOM}};
  ram_24_cfi_is_ret = _RAND_352[0:0];
  _RAND_353 = {1{`RANDOM}};
  ram_24_cfi_npc_plus4 = _RAND_353[0:0];
  _RAND_354 = {2{`RANDOM}};
  ram_24_ras_top = _RAND_354[39:0];
  _RAND_355 = {1{`RANDOM}};
  ram_24_ras_idx = _RAND_355[4:0];
  _RAND_356 = {1{`RANDOM}};
  ram_24_start_bank = _RAND_356[0:0];
  _RAND_357 = {1{`RANDOM}};
  ram_25_cfi_idx_valid = _RAND_357[0:0];
  _RAND_358 = {1{`RANDOM}};
  ram_25_cfi_idx_bits = _RAND_358[1:0];
  _RAND_359 = {1{`RANDOM}};
  ram_25_cfi_taken = _RAND_359[0:0];
  _RAND_360 = {1{`RANDOM}};
  ram_25_cfi_mispredicted = _RAND_360[0:0];
  _RAND_361 = {1{`RANDOM}};
  ram_25_cfi_type = _RAND_361[2:0];
  _RAND_362 = {1{`RANDOM}};
  ram_25_br_mask = _RAND_362[3:0];
  _RAND_363 = {1{`RANDOM}};
  ram_25_cfi_is_call = _RAND_363[0:0];
  _RAND_364 = {1{`RANDOM}};
  ram_25_cfi_is_ret = _RAND_364[0:0];
  _RAND_365 = {1{`RANDOM}};
  ram_25_cfi_npc_plus4 = _RAND_365[0:0];
  _RAND_366 = {2{`RANDOM}};
  ram_25_ras_top = _RAND_366[39:0];
  _RAND_367 = {1{`RANDOM}};
  ram_25_ras_idx = _RAND_367[4:0];
  _RAND_368 = {1{`RANDOM}};
  ram_25_start_bank = _RAND_368[0:0];
  _RAND_369 = {1{`RANDOM}};
  ram_26_cfi_idx_valid = _RAND_369[0:0];
  _RAND_370 = {1{`RANDOM}};
  ram_26_cfi_idx_bits = _RAND_370[1:0];
  _RAND_371 = {1{`RANDOM}};
  ram_26_cfi_taken = _RAND_371[0:0];
  _RAND_372 = {1{`RANDOM}};
  ram_26_cfi_mispredicted = _RAND_372[0:0];
  _RAND_373 = {1{`RANDOM}};
  ram_26_cfi_type = _RAND_373[2:0];
  _RAND_374 = {1{`RANDOM}};
  ram_26_br_mask = _RAND_374[3:0];
  _RAND_375 = {1{`RANDOM}};
  ram_26_cfi_is_call = _RAND_375[0:0];
  _RAND_376 = {1{`RANDOM}};
  ram_26_cfi_is_ret = _RAND_376[0:0];
  _RAND_377 = {1{`RANDOM}};
  ram_26_cfi_npc_plus4 = _RAND_377[0:0];
  _RAND_378 = {2{`RANDOM}};
  ram_26_ras_top = _RAND_378[39:0];
  _RAND_379 = {1{`RANDOM}};
  ram_26_ras_idx = _RAND_379[4:0];
  _RAND_380 = {1{`RANDOM}};
  ram_26_start_bank = _RAND_380[0:0];
  _RAND_381 = {1{`RANDOM}};
  ram_27_cfi_idx_valid = _RAND_381[0:0];
  _RAND_382 = {1{`RANDOM}};
  ram_27_cfi_idx_bits = _RAND_382[1:0];
  _RAND_383 = {1{`RANDOM}};
  ram_27_cfi_taken = _RAND_383[0:0];
  _RAND_384 = {1{`RANDOM}};
  ram_27_cfi_mispredicted = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  ram_27_cfi_type = _RAND_385[2:0];
  _RAND_386 = {1{`RANDOM}};
  ram_27_br_mask = _RAND_386[3:0];
  _RAND_387 = {1{`RANDOM}};
  ram_27_cfi_is_call = _RAND_387[0:0];
  _RAND_388 = {1{`RANDOM}};
  ram_27_cfi_is_ret = _RAND_388[0:0];
  _RAND_389 = {1{`RANDOM}};
  ram_27_cfi_npc_plus4 = _RAND_389[0:0];
  _RAND_390 = {2{`RANDOM}};
  ram_27_ras_top = _RAND_390[39:0];
  _RAND_391 = {1{`RANDOM}};
  ram_27_ras_idx = _RAND_391[4:0];
  _RAND_392 = {1{`RANDOM}};
  ram_27_start_bank = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  ram_28_cfi_idx_valid = _RAND_393[0:0];
  _RAND_394 = {1{`RANDOM}};
  ram_28_cfi_idx_bits = _RAND_394[1:0];
  _RAND_395 = {1{`RANDOM}};
  ram_28_cfi_taken = _RAND_395[0:0];
  _RAND_396 = {1{`RANDOM}};
  ram_28_cfi_mispredicted = _RAND_396[0:0];
  _RAND_397 = {1{`RANDOM}};
  ram_28_cfi_type = _RAND_397[2:0];
  _RAND_398 = {1{`RANDOM}};
  ram_28_br_mask = _RAND_398[3:0];
  _RAND_399 = {1{`RANDOM}};
  ram_28_cfi_is_call = _RAND_399[0:0];
  _RAND_400 = {1{`RANDOM}};
  ram_28_cfi_is_ret = _RAND_400[0:0];
  _RAND_401 = {1{`RANDOM}};
  ram_28_cfi_npc_plus4 = _RAND_401[0:0];
  _RAND_402 = {2{`RANDOM}};
  ram_28_ras_top = _RAND_402[39:0];
  _RAND_403 = {1{`RANDOM}};
  ram_28_ras_idx = _RAND_403[4:0];
  _RAND_404 = {1{`RANDOM}};
  ram_28_start_bank = _RAND_404[0:0];
  _RAND_405 = {1{`RANDOM}};
  ram_29_cfi_idx_valid = _RAND_405[0:0];
  _RAND_406 = {1{`RANDOM}};
  ram_29_cfi_idx_bits = _RAND_406[1:0];
  _RAND_407 = {1{`RANDOM}};
  ram_29_cfi_taken = _RAND_407[0:0];
  _RAND_408 = {1{`RANDOM}};
  ram_29_cfi_mispredicted = _RAND_408[0:0];
  _RAND_409 = {1{`RANDOM}};
  ram_29_cfi_type = _RAND_409[2:0];
  _RAND_410 = {1{`RANDOM}};
  ram_29_br_mask = _RAND_410[3:0];
  _RAND_411 = {1{`RANDOM}};
  ram_29_cfi_is_call = _RAND_411[0:0];
  _RAND_412 = {1{`RANDOM}};
  ram_29_cfi_is_ret = _RAND_412[0:0];
  _RAND_413 = {1{`RANDOM}};
  ram_29_cfi_npc_plus4 = _RAND_413[0:0];
  _RAND_414 = {2{`RANDOM}};
  ram_29_ras_top = _RAND_414[39:0];
  _RAND_415 = {1{`RANDOM}};
  ram_29_ras_idx = _RAND_415[4:0];
  _RAND_416 = {1{`RANDOM}};
  ram_29_start_bank = _RAND_416[0:0];
  _RAND_417 = {1{`RANDOM}};
  ram_30_cfi_idx_valid = _RAND_417[0:0];
  _RAND_418 = {1{`RANDOM}};
  ram_30_cfi_idx_bits = _RAND_418[1:0];
  _RAND_419 = {1{`RANDOM}};
  ram_30_cfi_taken = _RAND_419[0:0];
  _RAND_420 = {1{`RANDOM}};
  ram_30_cfi_mispredicted = _RAND_420[0:0];
  _RAND_421 = {1{`RANDOM}};
  ram_30_cfi_type = _RAND_421[2:0];
  _RAND_422 = {1{`RANDOM}};
  ram_30_br_mask = _RAND_422[3:0];
  _RAND_423 = {1{`RANDOM}};
  ram_30_cfi_is_call = _RAND_423[0:0];
  _RAND_424 = {1{`RANDOM}};
  ram_30_cfi_is_ret = _RAND_424[0:0];
  _RAND_425 = {1{`RANDOM}};
  ram_30_cfi_npc_plus4 = _RAND_425[0:0];
  _RAND_426 = {2{`RANDOM}};
  ram_30_ras_top = _RAND_426[39:0];
  _RAND_427 = {1{`RANDOM}};
  ram_30_ras_idx = _RAND_427[4:0];
  _RAND_428 = {1{`RANDOM}};
  ram_30_start_bank = _RAND_428[0:0];
  _RAND_429 = {1{`RANDOM}};
  ram_31_cfi_idx_valid = _RAND_429[0:0];
  _RAND_430 = {1{`RANDOM}};
  ram_31_cfi_idx_bits = _RAND_430[1:0];
  _RAND_431 = {1{`RANDOM}};
  ram_31_cfi_taken = _RAND_431[0:0];
  _RAND_432 = {1{`RANDOM}};
  ram_31_cfi_mispredicted = _RAND_432[0:0];
  _RAND_433 = {1{`RANDOM}};
  ram_31_cfi_type = _RAND_433[2:0];
  _RAND_434 = {1{`RANDOM}};
  ram_31_br_mask = _RAND_434[3:0];
  _RAND_435 = {1{`RANDOM}};
  ram_31_cfi_is_call = _RAND_435[0:0];
  _RAND_436 = {1{`RANDOM}};
  ram_31_cfi_is_ret = _RAND_436[0:0];
  _RAND_437 = {1{`RANDOM}};
  ram_31_cfi_npc_plus4 = _RAND_437[0:0];
  _RAND_438 = {2{`RANDOM}};
  ram_31_ras_top = _RAND_438[39:0];
  _RAND_439 = {1{`RANDOM}};
  ram_31_ras_idx = _RAND_439[4:0];
  _RAND_440 = {1{`RANDOM}};
  ram_31_start_bank = _RAND_440[0:0];
  _RAND_441 = {2{`RANDOM}};
  prev_ghist_old_history = _RAND_441[63:0];
  _RAND_442 = {1{`RANDOM}};
  prev_ghist_current_saw_branch_not_taken = _RAND_442[0:0];
  _RAND_443 = {1{`RANDOM}};
  prev_ghist_ras_idx = _RAND_443[4:0];
  _RAND_444 = {1{`RANDOM}};
  prev_entry_cfi_idx_valid = _RAND_444[0:0];
  _RAND_445 = {1{`RANDOM}};
  prev_entry_cfi_idx_bits = _RAND_445[1:0];
  _RAND_446 = {1{`RANDOM}};
  prev_entry_cfi_taken = _RAND_446[0:0];
  _RAND_447 = {1{`RANDOM}};
  prev_entry_br_mask = _RAND_447[3:0];
  _RAND_448 = {1{`RANDOM}};
  prev_entry_cfi_is_call = _RAND_448[0:0];
  _RAND_449 = {1{`RANDOM}};
  prev_entry_cfi_is_ret = _RAND_449[0:0];
  _RAND_450 = {1{`RANDOM}};
  first_empty = _RAND_450[0:0];
  _RAND_451 = {1{`RANDOM}};
  REG = _RAND_451[0:0];
  _RAND_452 = {2{`RANDOM}};
  REG_1 = _RAND_452[39:0];
  _RAND_453 = {1{`RANDOM}};
  REG_2 = _RAND_453[4:0];
  _RAND_454 = {1{`RANDOM}};
  bpd_update_mispredict = _RAND_454[0:0];
  _RAND_455 = {1{`RANDOM}};
  bpd_update_repair = _RAND_455[0:0];
  _RAND_456 = {1{`RANDOM}};
  bpd_repair_idx = _RAND_456[4:0];
  _RAND_457 = {1{`RANDOM}};
  bpd_end_idx = _RAND_457[4:0];
  _RAND_458 = {2{`RANDOM}};
  bpd_repair_pc = _RAND_458[39:0];
  _RAND_459 = {1{`RANDOM}};
  bpd_entry_cfi_idx_valid = _RAND_459[0:0];
  _RAND_460 = {1{`RANDOM}};
  bpd_entry_cfi_idx_bits = _RAND_460[1:0];
  _RAND_461 = {1{`RANDOM}};
  bpd_entry_cfi_taken = _RAND_461[0:0];
  _RAND_462 = {1{`RANDOM}};
  bpd_entry_cfi_mispredicted = _RAND_462[0:0];
  _RAND_463 = {1{`RANDOM}};
  bpd_entry_cfi_type = _RAND_463[2:0];
  _RAND_464 = {1{`RANDOM}};
  bpd_entry_br_mask = _RAND_464[3:0];
  _RAND_465 = {2{`RANDOM}};
  bpd_pc = _RAND_465[39:0];
  _RAND_466 = {2{`RANDOM}};
  bpd_target = _RAND_466[39:0];
  _RAND_467 = {1{`RANDOM}};
  REG_3 = _RAND_467[0:0];
  _RAND_468 = {1{`RANDOM}};
  REG_4 = _RAND_468[4:0];
  _RAND_469 = {1{`RANDOM}};
  REG_5 = _RAND_469[4:0];
  _RAND_470 = {1{`RANDOM}};
  REG_6 = _RAND_470[0:0];
  _RAND_471 = {1{`RANDOM}};
  REG_7 = _RAND_471[0:0];
  _RAND_472 = {1{`RANDOM}};
  REG_8 = _RAND_472[0:0];
  _RAND_473 = {1{`RANDOM}};
  REG_9 = _RAND_473[0:0];
  _RAND_474 = {1{`RANDOM}};
  REG_10 = _RAND_474[0:0];
  _RAND_475 = {1{`RANDOM}};
  REG_11 = _RAND_475[0:0];
  _RAND_476 = {1{`RANDOM}};
  REG_12 = _RAND_476[0:0];
  _RAND_477 = {1{`RANDOM}};
  REG_13 = _RAND_477[0:0];
  _RAND_478 = {1{`RANDOM}};
  REG_14_cfi_idx_valid = _RAND_478[0:0];
  _RAND_479 = {1{`RANDOM}};
  REG_14_cfi_idx_bits = _RAND_479[1:0];
  _RAND_480 = {1{`RANDOM}};
  REG_14_cfi_taken = _RAND_480[0:0];
  _RAND_481 = {1{`RANDOM}};
  REG_14_br_mask = _RAND_481[3:0];
  _RAND_482 = {1{`RANDOM}};
  REG_14_cfi_is_call = _RAND_482[0:0];
  _RAND_483 = {1{`RANDOM}};
  REG_14_cfi_is_ret = _RAND_483[0:0];
  _RAND_484 = {1{`RANDOM}};
  REG_15 = _RAND_484[4:0];
  _RAND_485 = {1{`RANDOM}};
  REG_16_cfi_idx_valid = _RAND_485[0:0];
  _RAND_486 = {1{`RANDOM}};
  REG_16_cfi_idx_bits = _RAND_486[1:0];
  _RAND_487 = {1{`RANDOM}};
  REG_16_cfi_taken = _RAND_487[0:0];
  _RAND_488 = {1{`RANDOM}};
  REG_16_cfi_mispredicted = _RAND_488[0:0];
  _RAND_489 = {1{`RANDOM}};
  REG_16_cfi_type = _RAND_489[2:0];
  _RAND_490 = {1{`RANDOM}};
  REG_16_br_mask = _RAND_490[3:0];
  _RAND_491 = {1{`RANDOM}};
  REG_16_cfi_is_call = _RAND_491[0:0];
  _RAND_492 = {1{`RANDOM}};
  REG_16_cfi_is_ret = _RAND_492[0:0];
  _RAND_493 = {1{`RANDOM}};
  REG_16_cfi_npc_plus4 = _RAND_493[0:0];
  _RAND_494 = {2{`RANDOM}};
  REG_16_ras_top = _RAND_494[39:0];
  _RAND_495 = {1{`RANDOM}};
  REG_16_ras_idx = _RAND_495[4:0];
  _RAND_496 = {1{`RANDOM}};
  REG_16_start_bank = _RAND_496[0:0];
  _RAND_497 = {1{`RANDOM}};
  REG_17_cfi_idx_valid = _RAND_497[0:0];
  _RAND_498 = {1{`RANDOM}};
  REG_17_cfi_idx_bits = _RAND_498[1:0];
  _RAND_499 = {1{`RANDOM}};
  REG_17_cfi_taken = _RAND_499[0:0];
  _RAND_500 = {1{`RANDOM}};
  REG_17_cfi_mispredicted = _RAND_500[0:0];
  _RAND_501 = {1{`RANDOM}};
  REG_17_cfi_type = _RAND_501[2:0];
  _RAND_502 = {1{`RANDOM}};
  REG_17_br_mask = _RAND_502[3:0];
  _RAND_503 = {1{`RANDOM}};
  REG_17_cfi_is_call = _RAND_503[0:0];
  _RAND_504 = {1{`RANDOM}};
  REG_17_cfi_is_ret = _RAND_504[0:0];
  _RAND_505 = {1{`RANDOM}};
  REG_17_cfi_npc_plus4 = _RAND_505[0:0];
  _RAND_506 = {2{`RANDOM}};
  REG_17_ras_top = _RAND_506[39:0];
  _RAND_507 = {1{`RANDOM}};
  REG_17_ras_idx = _RAND_507[4:0];
  _RAND_508 = {1{`RANDOM}};
  REG_17_start_bank = _RAND_508[0:0];
  _RAND_509 = {2{`RANDOM}};
  REG_18 = _RAND_509[39:0];
  _RAND_510 = {2{`RANDOM}};
  REG_19 = _RAND_510[39:0];
  _RAND_511 = {1{`RANDOM}};
  REG_20 = _RAND_511[0:0];
  _RAND_512 = {2{`RANDOM}};
  REG_21 = _RAND_512[39:0];
  _RAND_513 = {1{`RANDOM}};
  REG_22_cfi_idx_valid = _RAND_513[0:0];
  _RAND_514 = {1{`RANDOM}};
  REG_22_cfi_idx_bits = _RAND_514[1:0];
  _RAND_515 = {1{`RANDOM}};
  REG_22_cfi_taken = _RAND_515[0:0];
  _RAND_516 = {1{`RANDOM}};
  REG_22_cfi_mispredicted = _RAND_516[0:0];
  _RAND_517 = {1{`RANDOM}};
  REG_22_cfi_type = _RAND_517[2:0];
  _RAND_518 = {1{`RANDOM}};
  REG_22_br_mask = _RAND_518[3:0];
  _RAND_519 = {1{`RANDOM}};
  REG_22_cfi_is_call = _RAND_519[0:0];
  _RAND_520 = {1{`RANDOM}};
  REG_22_cfi_is_ret = _RAND_520[0:0];
  _RAND_521 = {1{`RANDOM}};
  REG_22_cfi_npc_plus4 = _RAND_521[0:0];
  _RAND_522 = {2{`RANDOM}};
  REG_22_ras_top = _RAND_522[39:0];
  _RAND_523 = {1{`RANDOM}};
  REG_22_ras_idx = _RAND_523[4:0];
  _RAND_524 = {1{`RANDOM}};
  REG_22_start_bank = _RAND_524[0:0];
  _RAND_525 = {2{`RANDOM}};
  REG_23 = _RAND_525[39:0];
  _RAND_526 = {2{`RANDOM}};
  REG_24 = _RAND_526[39:0];
  _RAND_527 = {1{`RANDOM}};
  REG_25 = _RAND_527[0:0];
  _RAND_528 = {2{`RANDOM}};
  REG_26 = _RAND_528[39:0];
  _RAND_529 = {2{`RANDOM}};
  REG_27 = _RAND_529[39:0];
  _RAND_530 = {2{`RANDOM}};
  REG_28 = _RAND_530[39:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
