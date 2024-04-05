module BranchKillableQueue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [6:0]  io_enq_bits_uop_uopc,
  input  [31:0] io_enq_bits_uop_inst,
  input  [31:0] io_enq_bits_uop_debug_inst,
  input         io_enq_bits_uop_is_rvc,
  input  [39:0] io_enq_bits_uop_debug_pc,
  input  [2:0]  io_enq_bits_uop_iq_type,
  input  [9:0]  io_enq_bits_uop_fu_code,
  input  [3:0]  io_enq_bits_uop_ctrl_br_type,
  input  [1:0]  io_enq_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_enq_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_enq_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_enq_bits_uop_ctrl_op_fcn,
  input         io_enq_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_enq_bits_uop_ctrl_csr_cmd,
  input         io_enq_bits_uop_ctrl_is_load,
  input         io_enq_bits_uop_ctrl_is_sta,
  input         io_enq_bits_uop_ctrl_is_std,
  input  [1:0]  io_enq_bits_uop_iw_state,
  input         io_enq_bits_uop_iw_p1_poisoned,
  input         io_enq_bits_uop_iw_p2_poisoned,
  input         io_enq_bits_uop_is_br,
  input         io_enq_bits_uop_is_jalr,
  input         io_enq_bits_uop_is_jal,
  input         io_enq_bits_uop_is_sfb,
  input  [11:0] io_enq_bits_uop_br_mask,
  input  [3:0]  io_enq_bits_uop_br_tag,
  input  [4:0]  io_enq_bits_uop_ftq_idx,
  input         io_enq_bits_uop_edge_inst,
  input  [5:0]  io_enq_bits_uop_pc_lob,
  input         io_enq_bits_uop_taken,
  input  [19:0] io_enq_bits_uop_imm_packed,
  input  [11:0] io_enq_bits_uop_csr_addr,
  input  [5:0]  io_enq_bits_uop_rob_idx,
  input  [3:0]  io_enq_bits_uop_ldq_idx,
  input  [3:0]  io_enq_bits_uop_stq_idx,
  input  [1:0]  io_enq_bits_uop_rxq_idx,
  input  [5:0]  io_enq_bits_uop_pdst,
  input  [5:0]  io_enq_bits_uop_prs1,
  input  [5:0]  io_enq_bits_uop_prs2,
  input  [5:0]  io_enq_bits_uop_prs3,
  input  [4:0]  io_enq_bits_uop_ppred,
  input         io_enq_bits_uop_prs1_busy,
  input         io_enq_bits_uop_prs2_busy,
  input         io_enq_bits_uop_prs3_busy,
  input         io_enq_bits_uop_ppred_busy,
  input  [5:0]  io_enq_bits_uop_stale_pdst,
  input         io_enq_bits_uop_exception,
  input  [63:0] io_enq_bits_uop_exc_cause,
  input         io_enq_bits_uop_bypassable,
  input  [4:0]  io_enq_bits_uop_mem_cmd,
  input  [1:0]  io_enq_bits_uop_mem_size,
  input         io_enq_bits_uop_mem_signed,
  input         io_enq_bits_uop_is_fence,
  input         io_enq_bits_uop_is_fencei,
  input         io_enq_bits_uop_is_amo,
  input         io_enq_bits_uop_uses_ldq,
  input         io_enq_bits_uop_uses_stq,
  input         io_enq_bits_uop_is_sys_pc2epc,
  input         io_enq_bits_uop_is_unique,
  input         io_enq_bits_uop_flush_on_commit,
  input         io_enq_bits_uop_ldst_is_rs1,
  input  [5:0]  io_enq_bits_uop_ldst,
  input  [5:0]  io_enq_bits_uop_lrs1,
  input  [5:0]  io_enq_bits_uop_lrs2,
  input  [5:0]  io_enq_bits_uop_lrs3,
  input         io_enq_bits_uop_ldst_val,
  input  [1:0]  io_enq_bits_uop_dst_rtype,
  input  [1:0]  io_enq_bits_uop_lrs1_rtype,
  input  [1:0]  io_enq_bits_uop_lrs2_rtype,
  input         io_enq_bits_uop_frs3_en,
  input         io_enq_bits_uop_fp_val,
  input         io_enq_bits_uop_fp_single,
  input         io_enq_bits_uop_xcpt_pf_if,
  input         io_enq_bits_uop_xcpt_ae_if,
  input         io_enq_bits_uop_xcpt_ma_if,
  input         io_enq_bits_uop_bp_debug_if,
  input         io_enq_bits_uop_bp_xcpt_if,
  input  [1:0]  io_enq_bits_uop_debug_fsrc,
  input  [1:0]  io_enq_bits_uop_debug_tsrc,
  input  [39:0] io_enq_bits_addr,
  input  [63:0] io_enq_bits_data,
  input         io_enq_bits_is_hella,
  input         io_enq_bits_tag_match,
  input  [1:0]  io_enq_bits_old_meta_coh_state,
  input  [19:0] io_enq_bits_old_meta_tag,
  input  [3:0]  io_enq_bits_way_en,
  input  [4:0]  io_enq_bits_sdq_id,
  input         io_deq_ready,
  output        io_deq_valid,
  output [6:0]  io_deq_bits_uop_uopc,
  output [31:0] io_deq_bits_uop_inst,
  output [31:0] io_deq_bits_uop_debug_inst,
  output        io_deq_bits_uop_is_rvc,
  output [39:0] io_deq_bits_uop_debug_pc,
  output [2:0]  io_deq_bits_uop_iq_type,
  output [9:0]  io_deq_bits_uop_fu_code,
  output [3:0]  io_deq_bits_uop_ctrl_br_type,
  output [1:0]  io_deq_bits_uop_ctrl_op1_sel,
  output [2:0]  io_deq_bits_uop_ctrl_op2_sel,
  output [2:0]  io_deq_bits_uop_ctrl_imm_sel,
  output [3:0]  io_deq_bits_uop_ctrl_op_fcn,
  output        io_deq_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_deq_bits_uop_ctrl_csr_cmd,
  output        io_deq_bits_uop_ctrl_is_load,
  output        io_deq_bits_uop_ctrl_is_sta,
  output        io_deq_bits_uop_ctrl_is_std,
  output [1:0]  io_deq_bits_uop_iw_state,
  output        io_deq_bits_uop_iw_p1_poisoned,
  output        io_deq_bits_uop_iw_p2_poisoned,
  output        io_deq_bits_uop_is_br,
  output        io_deq_bits_uop_is_jalr,
  output        io_deq_bits_uop_is_jal,
  output        io_deq_bits_uop_is_sfb,
  output [11:0] io_deq_bits_uop_br_mask,
  output [3:0]  io_deq_bits_uop_br_tag,
  output [4:0]  io_deq_bits_uop_ftq_idx,
  output        io_deq_bits_uop_edge_inst,
  output [5:0]  io_deq_bits_uop_pc_lob,
  output        io_deq_bits_uop_taken,
  output [19:0] io_deq_bits_uop_imm_packed,
  output [11:0] io_deq_bits_uop_csr_addr,
  output [5:0]  io_deq_bits_uop_rob_idx,
  output [3:0]  io_deq_bits_uop_ldq_idx,
  output [3:0]  io_deq_bits_uop_stq_idx,
  output [1:0]  io_deq_bits_uop_rxq_idx,
  output [5:0]  io_deq_bits_uop_pdst,
  output [5:0]  io_deq_bits_uop_prs1,
  output [5:0]  io_deq_bits_uop_prs2,
  output [5:0]  io_deq_bits_uop_prs3,
  output [4:0]  io_deq_bits_uop_ppred,
  output        io_deq_bits_uop_prs1_busy,
  output        io_deq_bits_uop_prs2_busy,
  output        io_deq_bits_uop_prs3_busy,
  output        io_deq_bits_uop_ppred_busy,
  output [5:0]  io_deq_bits_uop_stale_pdst,
  output        io_deq_bits_uop_exception,
  output [63:0] io_deq_bits_uop_exc_cause,
  output        io_deq_bits_uop_bypassable,
  output [4:0]  io_deq_bits_uop_mem_cmd,
  output [1:0]  io_deq_bits_uop_mem_size,
  output        io_deq_bits_uop_mem_signed,
  output        io_deq_bits_uop_is_fence,
  output        io_deq_bits_uop_is_fencei,
  output        io_deq_bits_uop_is_amo,
  output        io_deq_bits_uop_uses_ldq,
  output        io_deq_bits_uop_uses_stq,
  output        io_deq_bits_uop_is_sys_pc2epc,
  output        io_deq_bits_uop_is_unique,
  output        io_deq_bits_uop_flush_on_commit,
  output        io_deq_bits_uop_ldst_is_rs1,
  output [5:0]  io_deq_bits_uop_ldst,
  output [5:0]  io_deq_bits_uop_lrs1,
  output [5:0]  io_deq_bits_uop_lrs2,
  output [5:0]  io_deq_bits_uop_lrs3,
  output        io_deq_bits_uop_ldst_val,
  output [1:0]  io_deq_bits_uop_dst_rtype,
  output [1:0]  io_deq_bits_uop_lrs1_rtype,
  output [1:0]  io_deq_bits_uop_lrs2_rtype,
  output        io_deq_bits_uop_frs3_en,
  output        io_deq_bits_uop_fp_val,
  output        io_deq_bits_uop_fp_single,
  output        io_deq_bits_uop_xcpt_pf_if,
  output        io_deq_bits_uop_xcpt_ae_if,
  output        io_deq_bits_uop_xcpt_ma_if,
  output        io_deq_bits_uop_bp_debug_if,
  output        io_deq_bits_uop_bp_xcpt_if,
  output [1:0]  io_deq_bits_uop_debug_fsrc,
  output [1:0]  io_deq_bits_uop_debug_tsrc,
  output [39:0] io_deq_bits_addr,
  output [63:0] io_deq_bits_data,
  output        io_deq_bits_is_hella,
  output        io_deq_bits_tag_match,
  output [1:0]  io_deq_bits_old_meta_coh_state,
  output [19:0] io_deq_bits_old_meta_tag,
  output [3:0]  io_deq_bits_way_en,
  output [4:0]  io_deq_bits_sdq_id,
  input  [11:0] io_brupdate_b1_resolve_mask,
  input  [11:0] io_brupdate_b1_mispredict_mask,
  input  [6:0]  io_brupdate_b2_uop_uopc,
  input  [31:0] io_brupdate_b2_uop_inst,
  input  [31:0] io_brupdate_b2_uop_debug_inst,
  input         io_brupdate_b2_uop_is_rvc,
  input  [39:0] io_brupdate_b2_uop_debug_pc,
  input  [2:0]  io_brupdate_b2_uop_iq_type,
  input  [9:0]  io_brupdate_b2_uop_fu_code,
  input  [3:0]  io_brupdate_b2_uop_ctrl_br_type,
  input  [1:0]  io_brupdate_b2_uop_ctrl_op1_sel,
  input  [2:0]  io_brupdate_b2_uop_ctrl_op2_sel,
  input  [2:0]  io_brupdate_b2_uop_ctrl_imm_sel,
  input  [3:0]  io_brupdate_b2_uop_ctrl_op_fcn,
  input         io_brupdate_b2_uop_ctrl_fcn_dw,
  input  [2:0]  io_brupdate_b2_uop_ctrl_csr_cmd,
  input         io_brupdate_b2_uop_ctrl_is_load,
  input         io_brupdate_b2_uop_ctrl_is_sta,
  input         io_brupdate_b2_uop_ctrl_is_std,
  input  [1:0]  io_brupdate_b2_uop_iw_state,
  input         io_brupdate_b2_uop_iw_p1_poisoned,
  input         io_brupdate_b2_uop_iw_p2_poisoned,
  input         io_brupdate_b2_uop_is_br,
  input         io_brupdate_b2_uop_is_jalr,
  input         io_brupdate_b2_uop_is_jal,
  input         io_brupdate_b2_uop_is_sfb,
  input  [11:0] io_brupdate_b2_uop_br_mask,
  input  [3:0]  io_brupdate_b2_uop_br_tag,
  input  [4:0]  io_brupdate_b2_uop_ftq_idx,
  input         io_brupdate_b2_uop_edge_inst,
  input  [5:0]  io_brupdate_b2_uop_pc_lob,
  input         io_brupdate_b2_uop_taken,
  input  [19:0] io_brupdate_b2_uop_imm_packed,
  input  [11:0] io_brupdate_b2_uop_csr_addr,
  input  [5:0]  io_brupdate_b2_uop_rob_idx,
  input  [3:0]  io_brupdate_b2_uop_ldq_idx,
  input  [3:0]  io_brupdate_b2_uop_stq_idx,
  input  [1:0]  io_brupdate_b2_uop_rxq_idx,
  input  [5:0]  io_brupdate_b2_uop_pdst,
  input  [5:0]  io_brupdate_b2_uop_prs1,
  input  [5:0]  io_brupdate_b2_uop_prs2,
  input  [5:0]  io_brupdate_b2_uop_prs3,
  input  [4:0]  io_brupdate_b2_uop_ppred,
  input         io_brupdate_b2_uop_prs1_busy,
  input         io_brupdate_b2_uop_prs2_busy,
  input         io_brupdate_b2_uop_prs3_busy,
  input         io_brupdate_b2_uop_ppred_busy,
  input  [5:0]  io_brupdate_b2_uop_stale_pdst,
  input         io_brupdate_b2_uop_exception,
  input  [63:0] io_brupdate_b2_uop_exc_cause,
  input         io_brupdate_b2_uop_bypassable,
  input  [4:0]  io_brupdate_b2_uop_mem_cmd,
  input  [1:0]  io_brupdate_b2_uop_mem_size,
  input         io_brupdate_b2_uop_mem_signed,
  input         io_brupdate_b2_uop_is_fence,
  input         io_brupdate_b2_uop_is_fencei,
  input         io_brupdate_b2_uop_is_amo,
  input         io_brupdate_b2_uop_uses_ldq,
  input         io_brupdate_b2_uop_uses_stq,
  input         io_brupdate_b2_uop_is_sys_pc2epc,
  input         io_brupdate_b2_uop_is_unique,
  input         io_brupdate_b2_uop_flush_on_commit,
  input         io_brupdate_b2_uop_ldst_is_rs1,
  input  [5:0]  io_brupdate_b2_uop_ldst,
  input  [5:0]  io_brupdate_b2_uop_lrs1,
  input  [5:0]  io_brupdate_b2_uop_lrs2,
  input  [5:0]  io_brupdate_b2_uop_lrs3,
  input         io_brupdate_b2_uop_ldst_val,
  input  [1:0]  io_brupdate_b2_uop_dst_rtype,
  input  [1:0]  io_brupdate_b2_uop_lrs1_rtype,
  input  [1:0]  io_brupdate_b2_uop_lrs2_rtype,
  input         io_brupdate_b2_uop_frs3_en,
  input         io_brupdate_b2_uop_fp_val,
  input         io_brupdate_b2_uop_fp_single,
  input         io_brupdate_b2_uop_xcpt_pf_if,
  input         io_brupdate_b2_uop_xcpt_ae_if,
  input         io_brupdate_b2_uop_xcpt_ma_if,
  input         io_brupdate_b2_uop_bp_debug_if,
  input         io_brupdate_b2_uop_bp_xcpt_if,
  input  [1:0]  io_brupdate_b2_uop_debug_fsrc,
  input  [1:0]  io_brupdate_b2_uop_debug_tsrc,
  input         io_brupdate_b2_valid,
  input         io_brupdate_b2_mispredict,
  input         io_brupdate_b2_taken,
  input  [2:0]  io_brupdate_b2_cfi_type,
  input  [1:0]  io_brupdate_b2_pc_sel,
  input  [39:0] io_brupdate_b2_jalr_target,
  input  [20:0] io_brupdate_b2_target_offset,
  input         io_flush,
  output        io_empty,
  output [3:0]  io_count
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
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
  reg [63:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
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
  reg [31:0] _RAND_59;
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
  reg [63:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
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
  reg [31:0] _RAND_87;
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
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [63:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
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
  reg [31:0] _RAND_126;
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
  reg [31:0] _RAND_138;
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
  reg [31:0] _RAND_162;
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
  reg [31:0] _RAND_198;
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
  reg [31:0] _RAND_210;
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
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [31:0] _RAND_225;
  reg [31:0] _RAND_226;
  reg [31:0] _RAND_227;
  reg [31:0] _RAND_228;
  reg [63:0] _RAND_229;
  reg [31:0] _RAND_230;
  reg [31:0] _RAND_231;
  reg [31:0] _RAND_232;
  reg [31:0] _RAND_233;
  reg [31:0] _RAND_234;
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
  reg [31:0] _RAND_246;
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
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [63:0] _RAND_265;
  reg [31:0] _RAND_266;
  reg [31:0] _RAND_267;
  reg [31:0] _RAND_268;
  reg [31:0] _RAND_269;
  reg [31:0] _RAND_270;
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
  reg [31:0] _RAND_282;
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
  reg [31:0] _RAND_294;
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
  reg [31:0] _RAND_306;
  reg [31:0] _RAND_307;
  reg [63:0] _RAND_308;
  reg [31:0] _RAND_309;
  reg [31:0] _RAND_310;
  reg [31:0] _RAND_311;
  reg [31:0] _RAND_312;
  reg [31:0] _RAND_313;
  reg [31:0] _RAND_314;
  reg [31:0] _RAND_315;
  reg [31:0] _RAND_316;
  reg [31:0] _RAND_317;
  reg [31:0] _RAND_318;
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
  reg [31:0] _RAND_330;
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
  reg [31:0] _RAND_342;
  reg [31:0] _RAND_343;
  reg [63:0] _RAND_344;
  reg [31:0] _RAND_345;
  reg [31:0] _RAND_346;
  reg [31:0] _RAND_347;
  reg [31:0] _RAND_348;
  reg [31:0] _RAND_349;
  reg [31:0] _RAND_350;
  reg [31:0] _RAND_351;
  reg [31:0] _RAND_352;
  reg [31:0] _RAND_353;
  reg [31:0] _RAND_354;
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
  reg [31:0] _RAND_366;
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
  reg [31:0] _RAND_378;
  reg [31:0] _RAND_379;
  reg [31:0] _RAND_380;
  reg [31:0] _RAND_381;
  reg [31:0] _RAND_382;
  reg [31:0] _RAND_383;
  reg [31:0] _RAND_384;
  reg [31:0] _RAND_385;
  reg [31:0] _RAND_386;
  reg [63:0] _RAND_387;
  reg [31:0] _RAND_388;
  reg [31:0] _RAND_389;
  reg [31:0] _RAND_390;
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
  reg [31:0] _RAND_402;
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
  reg [31:0] _RAND_414;
  reg [31:0] _RAND_415;
  reg [31:0] _RAND_416;
  reg [31:0] _RAND_417;
  reg [31:0] _RAND_418;
  reg [31:0] _RAND_419;
  reg [31:0] _RAND_420;
  reg [31:0] _RAND_421;
  reg [31:0] _RAND_422;
  reg [63:0] _RAND_423;
  reg [31:0] _RAND_424;
  reg [31:0] _RAND_425;
  reg [31:0] _RAND_426;
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
  reg [31:0] _RAND_438;
  reg [31:0] _RAND_439;
  reg [31:0] _RAND_440;
  reg [31:0] _RAND_441;
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
  reg [31:0] _RAND_452;
  reg [31:0] _RAND_453;
  reg [31:0] _RAND_454;
  reg [31:0] _RAND_455;
  reg [31:0] _RAND_456;
  reg [31:0] _RAND_457;
  reg [31:0] _RAND_458;
  reg [31:0] _RAND_459;
  reg [31:0] _RAND_460;
  reg [31:0] _RAND_461;
  reg [31:0] _RAND_462;
  reg [31:0] _RAND_463;
  reg [31:0] _RAND_464;
  reg [31:0] _RAND_465;
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
  reg [31:0] _RAND_494;
  reg [31:0] _RAND_495;
  reg [31:0] _RAND_496;
  reg [31:0] _RAND_497;
  reg [31:0] _RAND_498;
  reg [31:0] _RAND_499;
  reg [31:0] _RAND_500;
  reg [31:0] _RAND_501;
  reg [63:0] _RAND_502;
  reg [31:0] _RAND_503;
  reg [31:0] _RAND_504;
  reg [31:0] _RAND_505;
  reg [31:0] _RAND_506;
  reg [31:0] _RAND_507;
  reg [31:0] _RAND_508;
  reg [31:0] _RAND_509;
  reg [31:0] _RAND_510;
  reg [31:0] _RAND_511;
  reg [31:0] _RAND_512;
  reg [31:0] _RAND_513;
  reg [31:0] _RAND_514;
  reg [31:0] _RAND_515;
  reg [31:0] _RAND_516;
  reg [31:0] _RAND_517;
  reg [31:0] _RAND_518;
  reg [31:0] _RAND_519;
  reg [31:0] _RAND_520;
  reg [31:0] _RAND_521;
  reg [31:0] _RAND_522;
  reg [31:0] _RAND_523;
  reg [31:0] _RAND_524;
  reg [31:0] _RAND_525;
  reg [31:0] _RAND_526;
  reg [31:0] _RAND_527;
  reg [31:0] _RAND_528;
  reg [31:0] _RAND_529;
  reg [31:0] _RAND_530;
  reg [31:0] _RAND_531;
  reg [31:0] _RAND_532;
  reg [31:0] _RAND_533;
  reg [31:0] _RAND_534;
  reg [31:0] _RAND_535;
  reg [31:0] _RAND_536;
  reg [31:0] _RAND_537;
  reg [31:0] _RAND_538;
  reg [31:0] _RAND_539;
  reg [31:0] _RAND_540;
  reg [31:0] _RAND_541;
  reg [31:0] _RAND_542;
  reg [31:0] _RAND_543;
  reg [31:0] _RAND_544;
  reg [63:0] _RAND_545;
  reg [31:0] _RAND_546;
  reg [31:0] _RAND_547;
  reg [31:0] _RAND_548;
  reg [31:0] _RAND_549;
  reg [31:0] _RAND_550;
  reg [31:0] _RAND_551;
  reg [31:0] _RAND_552;
  reg [31:0] _RAND_553;
  reg [31:0] _RAND_554;
  reg [31:0] _RAND_555;
  reg [31:0] _RAND_556;
  reg [31:0] _RAND_557;
  reg [31:0] _RAND_558;
  reg [31:0] _RAND_559;
  reg [31:0] _RAND_560;
  reg [31:0] _RAND_561;
  reg [31:0] _RAND_562;
  reg [31:0] _RAND_563;
  reg [31:0] _RAND_564;
  reg [31:0] _RAND_565;
  reg [31:0] _RAND_566;
  reg [31:0] _RAND_567;
  reg [31:0] _RAND_568;
  reg [31:0] _RAND_569;
  reg [31:0] _RAND_570;
  reg [31:0] _RAND_571;
  reg [31:0] _RAND_572;
  reg [31:0] _RAND_573;
  reg [31:0] _RAND_574;
  reg [31:0] _RAND_575;
  reg [31:0] _RAND_576;
  reg [31:0] _RAND_577;
  reg [31:0] _RAND_578;
  reg [31:0] _RAND_579;
  reg [31:0] _RAND_580;
  reg [63:0] _RAND_581;
  reg [31:0] _RAND_582;
  reg [31:0] _RAND_583;
  reg [31:0] _RAND_584;
  reg [31:0] _RAND_585;
  reg [31:0] _RAND_586;
  reg [31:0] _RAND_587;
  reg [31:0] _RAND_588;
  reg [31:0] _RAND_589;
  reg [31:0] _RAND_590;
  reg [31:0] _RAND_591;
  reg [31:0] _RAND_592;
  reg [31:0] _RAND_593;
  reg [31:0] _RAND_594;
  reg [31:0] _RAND_595;
  reg [31:0] _RAND_596;
  reg [31:0] _RAND_597;
  reg [31:0] _RAND_598;
  reg [31:0] _RAND_599;
  reg [31:0] _RAND_600;
  reg [31:0] _RAND_601;
  reg [31:0] _RAND_602;
  reg [31:0] _RAND_603;
  reg [31:0] _RAND_604;
  reg [31:0] _RAND_605;
  reg [31:0] _RAND_606;
  reg [31:0] _RAND_607;
  reg [31:0] _RAND_608;
  reg [31:0] _RAND_609;
  reg [31:0] _RAND_610;
  reg [31:0] _RAND_611;
  reg [31:0] _RAND_612;
  reg [31:0] _RAND_613;
  reg [31:0] _RAND_614;
  reg [31:0] _RAND_615;
  reg [31:0] _RAND_616;
  reg [31:0] _RAND_617;
  reg [31:0] _RAND_618;
  reg [31:0] _RAND_619;
  reg [31:0] _RAND_620;
  reg [31:0] _RAND_621;
  reg [31:0] _RAND_622;
  reg [31:0] _RAND_623;
  reg [63:0] _RAND_624;
  reg [31:0] _RAND_625;
  reg [31:0] _RAND_626;
  reg [31:0] _RAND_627;
  reg [31:0] _RAND_628;
  reg [31:0] _RAND_629;
  reg [31:0] _RAND_630;
  reg [31:0] _RAND_631;
  reg [31:0] _RAND_632;
  reg [31:0] _RAND_633;
  reg [31:0] _RAND_634;
  reg [31:0] _RAND_635;
  reg [31:0] _RAND_636;
  reg [31:0] _RAND_637;
  reg [31:0] _RAND_638;
  reg [31:0] _RAND_639;
  reg [31:0] _RAND_640;
  reg [31:0] _RAND_641;
  reg [31:0] _RAND_642;
  reg [31:0] _RAND_643;
  reg [31:0] _RAND_644;
  reg [31:0] _RAND_645;
  reg [31:0] _RAND_646;
  reg [31:0] _RAND_647;
  reg [31:0] _RAND_648;
  reg [31:0] _RAND_649;
  reg [31:0] _RAND_650;
  reg [31:0] _RAND_651;
  reg [31:0] _RAND_652;
  reg [31:0] _RAND_653;
  reg [31:0] _RAND_654;
  reg [31:0] _RAND_655;
  reg [31:0] _RAND_656;
  reg [31:0] _RAND_657;
  reg [31:0] _RAND_658;
  reg [31:0] _RAND_659;
  reg [63:0] _RAND_660;
  reg [31:0] _RAND_661;
  reg [31:0] _RAND_662;
  reg [31:0] _RAND_663;
  reg [31:0] _RAND_664;
  reg [31:0] _RAND_665;
  reg [31:0] _RAND_666;
  reg [31:0] _RAND_667;
  reg [31:0] _RAND_668;
  reg [31:0] _RAND_669;
  reg [31:0] _RAND_670;
  reg [31:0] _RAND_671;
  reg [31:0] _RAND_672;
  reg [31:0] _RAND_673;
  reg [31:0] _RAND_674;
  reg [31:0] _RAND_675;
  reg [31:0] _RAND_676;
  reg [31:0] _RAND_677;
  reg [31:0] _RAND_678;
  reg [31:0] _RAND_679;
  reg [31:0] _RAND_680;
  reg [31:0] _RAND_681;
  reg [31:0] _RAND_682;
  reg [31:0] _RAND_683;
  reg [31:0] _RAND_684;
  reg [31:0] _RAND_685;
  reg [31:0] _RAND_686;
  reg [31:0] _RAND_687;
  reg [31:0] _RAND_688;
  reg [31:0] _RAND_689;
  reg [31:0] _RAND_690;
  reg [31:0] _RAND_691;
  reg [31:0] _RAND_692;
  reg [31:0] _RAND_693;
  reg [31:0] _RAND_694;
  reg [31:0] _RAND_695;
  reg [31:0] _RAND_696;
  reg [31:0] _RAND_697;
  reg [31:0] _RAND_698;
  reg [31:0] _RAND_699;
  reg [31:0] _RAND_700;
  reg [31:0] _RAND_701;
  reg [31:0] _RAND_702;
  reg [63:0] _RAND_703;
  reg [31:0] _RAND_704;
  reg [31:0] _RAND_705;
  reg [31:0] _RAND_706;
  reg [31:0] _RAND_707;
  reg [31:0] _RAND_708;
  reg [31:0] _RAND_709;
  reg [31:0] _RAND_710;
  reg [31:0] _RAND_711;
  reg [31:0] _RAND_712;
  reg [31:0] _RAND_713;
  reg [31:0] _RAND_714;
  reg [31:0] _RAND_715;
  reg [31:0] _RAND_716;
  reg [31:0] _RAND_717;
  reg [31:0] _RAND_718;
  reg [31:0] _RAND_719;
  reg [31:0] _RAND_720;
  reg [31:0] _RAND_721;
  reg [31:0] _RAND_722;
  reg [31:0] _RAND_723;
  reg [31:0] _RAND_724;
  reg [31:0] _RAND_725;
  reg [31:0] _RAND_726;
  reg [31:0] _RAND_727;
  reg [31:0] _RAND_728;
  reg [31:0] _RAND_729;
  reg [31:0] _RAND_730;
  reg [31:0] _RAND_731;
  reg [31:0] _RAND_732;
  reg [31:0] _RAND_733;
  reg [31:0] _RAND_734;
  reg [31:0] _RAND_735;
  reg [31:0] _RAND_736;
  reg [31:0] _RAND_737;
  reg [31:0] _RAND_738;
  reg [63:0] _RAND_739;
  reg [31:0] _RAND_740;
  reg [31:0] _RAND_741;
  reg [31:0] _RAND_742;
  reg [31:0] _RAND_743;
  reg [31:0] _RAND_744;
  reg [31:0] _RAND_745;
  reg [31:0] _RAND_746;
  reg [31:0] _RAND_747;
  reg [31:0] _RAND_748;
  reg [31:0] _RAND_749;
  reg [31:0] _RAND_750;
  reg [31:0] _RAND_751;
  reg [31:0] _RAND_752;
  reg [31:0] _RAND_753;
  reg [31:0] _RAND_754;
  reg [31:0] _RAND_755;
  reg [31:0] _RAND_756;
  reg [31:0] _RAND_757;
  reg [31:0] _RAND_758;
  reg [31:0] _RAND_759;
  reg [31:0] _RAND_760;
  reg [31:0] _RAND_761;
  reg [31:0] _RAND_762;
  reg [31:0] _RAND_763;
  reg [31:0] _RAND_764;
  reg [31:0] _RAND_765;
  reg [31:0] _RAND_766;
  reg [31:0] _RAND_767;
  reg [31:0] _RAND_768;
  reg [31:0] _RAND_769;
  reg [31:0] _RAND_770;
  reg [31:0] _RAND_771;
  reg [31:0] _RAND_772;
  reg [31:0] _RAND_773;
  reg [31:0] _RAND_774;
  reg [31:0] _RAND_775;
  reg [31:0] _RAND_776;
  reg [31:0] _RAND_777;
  reg [31:0] _RAND_778;
  reg [31:0] _RAND_779;
  reg [31:0] _RAND_780;
  reg [31:0] _RAND_781;
  reg [63:0] _RAND_782;
  reg [31:0] _RAND_783;
  reg [31:0] _RAND_784;
  reg [31:0] _RAND_785;
  reg [31:0] _RAND_786;
  reg [31:0] _RAND_787;
  reg [31:0] _RAND_788;
  reg [31:0] _RAND_789;
  reg [31:0] _RAND_790;
  reg [31:0] _RAND_791;
  reg [31:0] _RAND_792;
  reg [31:0] _RAND_793;
  reg [31:0] _RAND_794;
  reg [31:0] _RAND_795;
  reg [31:0] _RAND_796;
  reg [31:0] _RAND_797;
  reg [31:0] _RAND_798;
  reg [31:0] _RAND_799;
  reg [31:0] _RAND_800;
  reg [31:0] _RAND_801;
  reg [31:0] _RAND_802;
  reg [31:0] _RAND_803;
  reg [31:0] _RAND_804;
  reg [31:0] _RAND_805;
  reg [31:0] _RAND_806;
  reg [31:0] _RAND_807;
  reg [31:0] _RAND_808;
  reg [31:0] _RAND_809;
  reg [31:0] _RAND_810;
  reg [31:0] _RAND_811;
  reg [31:0] _RAND_812;
  reg [31:0] _RAND_813;
  reg [31:0] _RAND_814;
  reg [31:0] _RAND_815;
  reg [31:0] _RAND_816;
  reg [31:0] _RAND_817;
  reg [63:0] _RAND_818;
  reg [31:0] _RAND_819;
  reg [31:0] _RAND_820;
  reg [31:0] _RAND_821;
  reg [31:0] _RAND_822;
  reg [31:0] _RAND_823;
  reg [31:0] _RAND_824;
  reg [31:0] _RAND_825;
  reg [31:0] _RAND_826;
  reg [31:0] _RAND_827;
  reg [31:0] _RAND_828;
  reg [31:0] _RAND_829;
  reg [31:0] _RAND_830;
  reg [31:0] _RAND_831;
  reg [31:0] _RAND_832;
  reg [31:0] _RAND_833;
  reg [31:0] _RAND_834;
  reg [31:0] _RAND_835;
  reg [31:0] _RAND_836;
  reg [31:0] _RAND_837;
  reg [31:0] _RAND_838;
  reg [31:0] _RAND_839;
  reg [31:0] _RAND_840;
  reg [31:0] _RAND_841;
  reg [31:0] _RAND_842;
  reg [31:0] _RAND_843;
  reg [31:0] _RAND_844;
  reg [31:0] _RAND_845;
  reg [31:0] _RAND_846;
  reg [31:0] _RAND_847;
  reg [31:0] _RAND_848;
  reg [31:0] _RAND_849;
  reg [31:0] _RAND_850;
  reg [31:0] _RAND_851;
  reg [31:0] _RAND_852;
  reg [31:0] _RAND_853;
  reg [31:0] _RAND_854;
  reg [31:0] _RAND_855;
  reg [31:0] _RAND_856;
  reg [31:0] _RAND_857;
  reg [31:0] _RAND_858;
  reg [31:0] _RAND_859;
  reg [31:0] _RAND_860;
  reg [63:0] _RAND_861;
  reg [31:0] _RAND_862;
  reg [31:0] _RAND_863;
  reg [31:0] _RAND_864;
  reg [31:0] _RAND_865;
  reg [31:0] _RAND_866;
  reg [31:0] _RAND_867;
  reg [31:0] _RAND_868;
  reg [31:0] _RAND_869;
  reg [31:0] _RAND_870;
  reg [31:0] _RAND_871;
  reg [31:0] _RAND_872;
  reg [31:0] _RAND_873;
  reg [31:0] _RAND_874;
  reg [31:0] _RAND_875;
  reg [31:0] _RAND_876;
  reg [31:0] _RAND_877;
  reg [31:0] _RAND_878;
  reg [31:0] _RAND_879;
  reg [31:0] _RAND_880;
  reg [31:0] _RAND_881;
  reg [31:0] _RAND_882;
  reg [31:0] _RAND_883;
  reg [31:0] _RAND_884;
  reg [31:0] _RAND_885;
  reg [31:0] _RAND_886;
  reg [31:0] _RAND_887;
  reg [31:0] _RAND_888;
  reg [31:0] _RAND_889;
  reg [31:0] _RAND_890;
  reg [31:0] _RAND_891;
  reg [31:0] _RAND_892;
  reg [31:0] _RAND_893;
  reg [31:0] _RAND_894;
  reg [31:0] _RAND_895;
  reg [31:0] _RAND_896;
  reg [63:0] _RAND_897;
  reg [31:0] _RAND_898;
  reg [31:0] _RAND_899;
  reg [31:0] _RAND_900;
  reg [31:0] _RAND_901;
  reg [31:0] _RAND_902;
  reg [31:0] _RAND_903;
  reg [31:0] _RAND_904;
  reg [31:0] _RAND_905;
  reg [31:0] _RAND_906;
  reg [31:0] _RAND_907;
  reg [31:0] _RAND_908;
  reg [31:0] _RAND_909;
  reg [31:0] _RAND_910;
  reg [31:0] _RAND_911;
  reg [31:0] _RAND_912;
  reg [31:0] _RAND_913;
  reg [31:0] _RAND_914;
  reg [31:0] _RAND_915;
  reg [31:0] _RAND_916;
  reg [31:0] _RAND_917;
  reg [31:0] _RAND_918;
  reg [31:0] _RAND_919;
  reg [31:0] _RAND_920;
  reg [31:0] _RAND_921;
  reg [31:0] _RAND_922;
  reg [31:0] _RAND_923;
  reg [31:0] _RAND_924;
  reg [31:0] _RAND_925;
  reg [31:0] _RAND_926;
  reg [31:0] _RAND_927;
  reg [31:0] _RAND_928;
  reg [31:0] _RAND_929;
  reg [31:0] _RAND_930;
  reg [31:0] _RAND_931;
  reg [31:0] _RAND_932;
  reg [31:0] _RAND_933;
  reg [31:0] _RAND_934;
  reg [31:0] _RAND_935;
  reg [31:0] _RAND_936;
  reg [31:0] _RAND_937;
  reg [31:0] _RAND_938;
  reg [31:0] _RAND_939;
  reg [63:0] _RAND_940;
  reg [31:0] _RAND_941;
  reg [31:0] _RAND_942;
  reg [31:0] _RAND_943;
  reg [31:0] _RAND_944;
  reg [31:0] _RAND_945;
  reg [31:0] _RAND_946;
  reg [31:0] _RAND_947;
  reg [31:0] _RAND_948;
  reg [31:0] _RAND_949;
  reg [31:0] _RAND_950;
  reg [31:0] _RAND_951;
  reg [31:0] _RAND_952;
  reg [31:0] _RAND_953;
  reg [31:0] _RAND_954;
  reg [31:0] _RAND_955;
  reg [31:0] _RAND_956;
  reg [31:0] _RAND_957;
  reg [31:0] _RAND_958;
  reg [31:0] _RAND_959;
  reg [31:0] _RAND_960;
  reg [31:0] _RAND_961;
  reg [31:0] _RAND_962;
  reg [31:0] _RAND_963;
  reg [31:0] _RAND_964;
  reg [31:0] _RAND_965;
  reg [31:0] _RAND_966;
  reg [31:0] _RAND_967;
  reg [31:0] _RAND_968;
  reg [31:0] _RAND_969;
  reg [31:0] _RAND_970;
  reg [31:0] _RAND_971;
  reg [31:0] _RAND_972;
  reg [31:0] _RAND_973;
  reg [31:0] _RAND_974;
  reg [31:0] _RAND_975;
  reg [63:0] _RAND_976;
  reg [31:0] _RAND_977;
  reg [31:0] _RAND_978;
  reg [31:0] _RAND_979;
  reg [31:0] _RAND_980;
  reg [31:0] _RAND_981;
  reg [31:0] _RAND_982;
  reg [31:0] _RAND_983;
  reg [31:0] _RAND_984;
  reg [31:0] _RAND_985;
  reg [31:0] _RAND_986;
  reg [31:0] _RAND_987;
  reg [31:0] _RAND_988;
  reg [31:0] _RAND_989;
  reg [31:0] _RAND_990;
  reg [31:0] _RAND_991;
  reg [31:0] _RAND_992;
  reg [31:0] _RAND_993;
  reg [31:0] _RAND_994;
  reg [31:0] _RAND_995;
  reg [31:0] _RAND_996;
  reg [31:0] _RAND_997;
  reg [31:0] _RAND_998;
  reg [31:0] _RAND_999;
  reg [31:0] _RAND_1000;
  reg [31:0] _RAND_1001;
  reg [31:0] _RAND_1002;
  reg [31:0] _RAND_1003;
  reg [31:0] _RAND_1004;
  reg [31:0] _RAND_1005;
  reg [31:0] _RAND_1006;
  reg [31:0] _RAND_1007;
  reg [31:0] _RAND_1008;
  reg [31:0] _RAND_1009;
  reg [31:0] _RAND_1010;
  reg [31:0] _RAND_1011;
  reg [31:0] _RAND_1012;
  reg [31:0] _RAND_1013;
  reg [31:0] _RAND_1014;
  reg [31:0] _RAND_1015;
  reg [31:0] _RAND_1016;
  reg [31:0] _RAND_1017;
  reg [31:0] _RAND_1018;
  reg [63:0] _RAND_1019;
  reg [31:0] _RAND_1020;
  reg [31:0] _RAND_1021;
  reg [31:0] _RAND_1022;
  reg [31:0] _RAND_1023;
  reg [31:0] _RAND_1024;
  reg [31:0] _RAND_1025;
  reg [31:0] _RAND_1026;
  reg [31:0] _RAND_1027;
  reg [31:0] _RAND_1028;
  reg [31:0] _RAND_1029;
  reg [31:0] _RAND_1030;
  reg [31:0] _RAND_1031;
  reg [31:0] _RAND_1032;
  reg [31:0] _RAND_1033;
  reg [31:0] _RAND_1034;
  reg [31:0] _RAND_1035;
  reg [31:0] _RAND_1036;
  reg [31:0] _RAND_1037;
  reg [31:0] _RAND_1038;
  reg [31:0] _RAND_1039;
  reg [31:0] _RAND_1040;
  reg [31:0] _RAND_1041;
  reg [31:0] _RAND_1042;
  reg [31:0] _RAND_1043;
  reg [31:0] _RAND_1044;
  reg [31:0] _RAND_1045;
  reg [31:0] _RAND_1046;
  reg [31:0] _RAND_1047;
  reg [31:0] _RAND_1048;
  reg [31:0] _RAND_1049;
  reg [31:0] _RAND_1050;
  reg [31:0] _RAND_1051;
  reg [31:0] _RAND_1052;
  reg [31:0] _RAND_1053;
  reg [31:0] _RAND_1054;
  reg [63:0] _RAND_1055;
  reg [31:0] _RAND_1056;
  reg [31:0] _RAND_1057;
  reg [31:0] _RAND_1058;
  reg [31:0] _RAND_1059;
  reg [31:0] _RAND_1060;
  reg [31:0] _RAND_1061;
  reg [31:0] _RAND_1062;
  reg [31:0] _RAND_1063;
  reg [31:0] _RAND_1064;
  reg [31:0] _RAND_1065;
  reg [31:0] _RAND_1066;
  reg [31:0] _RAND_1067;
  reg [31:0] _RAND_1068;
  reg [31:0] _RAND_1069;
  reg [31:0] _RAND_1070;
  reg [31:0] _RAND_1071;
  reg [31:0] _RAND_1072;
  reg [31:0] _RAND_1073;
  reg [31:0] _RAND_1074;
  reg [31:0] _RAND_1075;
  reg [31:0] _RAND_1076;
  reg [31:0] _RAND_1077;
  reg [31:0] _RAND_1078;
  reg [31:0] _RAND_1079;
  reg [31:0] _RAND_1080;
  reg [31:0] _RAND_1081;
  reg [31:0] _RAND_1082;
  reg [31:0] _RAND_1083;
  reg [31:0] _RAND_1084;
  reg [31:0] _RAND_1085;
  reg [31:0] _RAND_1086;
  reg [31:0] _RAND_1087;
  reg [31:0] _RAND_1088;
  reg [31:0] _RAND_1089;
  reg [31:0] _RAND_1090;
  reg [31:0] _RAND_1091;
  reg [31:0] _RAND_1092;
  reg [31:0] _RAND_1093;
  reg [31:0] _RAND_1094;
  reg [31:0] _RAND_1095;
  reg [31:0] _RAND_1096;
  reg [31:0] _RAND_1097;
  reg [63:0] _RAND_1098;
  reg [31:0] _RAND_1099;
  reg [31:0] _RAND_1100;
  reg [31:0] _RAND_1101;
  reg [31:0] _RAND_1102;
  reg [31:0] _RAND_1103;
  reg [31:0] _RAND_1104;
  reg [31:0] _RAND_1105;
  reg [31:0] _RAND_1106;
  reg [31:0] _RAND_1107;
  reg [31:0] _RAND_1108;
  reg [31:0] _RAND_1109;
  reg [31:0] _RAND_1110;
  reg [31:0] _RAND_1111;
  reg [31:0] _RAND_1112;
  reg [31:0] _RAND_1113;
  reg [31:0] _RAND_1114;
  reg [31:0] _RAND_1115;
  reg [31:0] _RAND_1116;
  reg [31:0] _RAND_1117;
  reg [31:0] _RAND_1118;
  reg [31:0] _RAND_1119;
  reg [31:0] _RAND_1120;
  reg [31:0] _RAND_1121;
  reg [31:0] _RAND_1122;
  reg [31:0] _RAND_1123;
  reg [31:0] _RAND_1124;
  reg [31:0] _RAND_1125;
  reg [31:0] _RAND_1126;
  reg [31:0] _RAND_1127;
  reg [31:0] _RAND_1128;
  reg [31:0] _RAND_1129;
  reg [31:0] _RAND_1130;
  reg [31:0] _RAND_1131;
  reg [31:0] _RAND_1132;
  reg [31:0] _RAND_1133;
  reg [63:0] _RAND_1134;
  reg [31:0] _RAND_1135;
  reg [31:0] _RAND_1136;
  reg [31:0] _RAND_1137;
  reg [31:0] _RAND_1138;
  reg [31:0] _RAND_1139;
  reg [31:0] _RAND_1140;
  reg [31:0] _RAND_1141;
  reg [31:0] _RAND_1142;
  reg [31:0] _RAND_1143;
  reg [31:0] _RAND_1144;
  reg [31:0] _RAND_1145;
  reg [31:0] _RAND_1146;
  reg [31:0] _RAND_1147;
  reg [31:0] _RAND_1148;
  reg [31:0] _RAND_1149;
  reg [31:0] _RAND_1150;
  reg [31:0] _RAND_1151;
  reg [31:0] _RAND_1152;
  reg [31:0] _RAND_1153;
  reg [31:0] _RAND_1154;
  reg [31:0] _RAND_1155;
  reg [31:0] _RAND_1156;
  reg [31:0] _RAND_1157;
  reg [31:0] _RAND_1158;
  reg [31:0] _RAND_1159;
  reg [31:0] _RAND_1160;
  reg [31:0] _RAND_1161;
  reg [31:0] _RAND_1162;
  reg [31:0] _RAND_1163;
  reg [31:0] _RAND_1164;
  reg [31:0] _RAND_1165;
  reg [31:0] _RAND_1166;
  reg [31:0] _RAND_1167;
  reg [31:0] _RAND_1168;
  reg [31:0] _RAND_1169;
  reg [31:0] _RAND_1170;
  reg [31:0] _RAND_1171;
  reg [31:0] _RAND_1172;
  reg [31:0] _RAND_1173;
  reg [31:0] _RAND_1174;
  reg [31:0] _RAND_1175;
  reg [31:0] _RAND_1176;
  reg [63:0] _RAND_1177;
  reg [31:0] _RAND_1178;
  reg [31:0] _RAND_1179;
  reg [31:0] _RAND_1180;
  reg [31:0] _RAND_1181;
  reg [31:0] _RAND_1182;
  reg [31:0] _RAND_1183;
  reg [31:0] _RAND_1184;
  reg [31:0] _RAND_1185;
  reg [31:0] _RAND_1186;
  reg [31:0] _RAND_1187;
  reg [31:0] _RAND_1188;
  reg [31:0] _RAND_1189;
  reg [31:0] _RAND_1190;
  reg [31:0] _RAND_1191;
  reg [31:0] _RAND_1192;
  reg [31:0] _RAND_1193;
  reg [31:0] _RAND_1194;
  reg [31:0] _RAND_1195;
  reg [31:0] _RAND_1196;
  reg [31:0] _RAND_1197;
  reg [31:0] _RAND_1198;
  reg [31:0] _RAND_1199;
  reg [31:0] _RAND_1200;
  reg [31:0] _RAND_1201;
  reg [31:0] _RAND_1202;
  reg [31:0] _RAND_1203;
  reg [31:0] _RAND_1204;
  reg [31:0] _RAND_1205;
  reg [31:0] _RAND_1206;
  reg [31:0] _RAND_1207;
  reg [31:0] _RAND_1208;
  reg [31:0] _RAND_1209;
  reg [31:0] _RAND_1210;
  reg [31:0] _RAND_1211;
  reg [31:0] _RAND_1212;
  reg [63:0] _RAND_1213;
  reg [31:0] _RAND_1214;
  reg [31:0] _RAND_1215;
  reg [31:0] _RAND_1216;
  reg [31:0] _RAND_1217;
  reg [31:0] _RAND_1218;
  reg [31:0] _RAND_1219;
  reg [31:0] _RAND_1220;
  reg [31:0] _RAND_1221;
  reg [31:0] _RAND_1222;
  reg [31:0] _RAND_1223;
  reg [31:0] _RAND_1224;
  reg [31:0] _RAND_1225;
  reg [31:0] _RAND_1226;
  reg [31:0] _RAND_1227;
  reg [31:0] _RAND_1228;
  reg [31:0] _RAND_1229;
  reg [31:0] _RAND_1230;
  reg [31:0] _RAND_1231;
  reg [31:0] _RAND_1232;
  reg [31:0] _RAND_1233;
  reg [31:0] _RAND_1234;
  reg [31:0] _RAND_1235;
  reg [31:0] _RAND_1236;
  reg [31:0] _RAND_1237;
  reg [31:0] _RAND_1238;
  reg [31:0] _RAND_1239;
  reg [31:0] _RAND_1240;
  reg [31:0] _RAND_1241;
  reg [31:0] _RAND_1242;
  reg [31:0] _RAND_1243;
  reg [31:0] _RAND_1244;
  reg [31:0] _RAND_1245;
  reg [31:0] _RAND_1246;
  reg [31:0] _RAND_1247;
  reg [31:0] _RAND_1248;
  reg [31:0] _RAND_1249;
  reg [31:0] _RAND_1250;
  reg [31:0] _RAND_1251;
  reg [31:0] _RAND_1252;
  reg [31:0] _RAND_1253;
  reg [31:0] _RAND_1254;
  reg [31:0] _RAND_1255;
  reg [63:0] _RAND_1256;
  reg [31:0] _RAND_1257;
  reg [31:0] _RAND_1258;
  reg [31:0] _RAND_1259;
  reg [31:0] _RAND_1260;
  reg [31:0] _RAND_1261;
  reg [31:0] _RAND_1262;
  reg [31:0] _RAND_1263;
  reg [31:0] _RAND_1264;
  reg [31:0] _RAND_1265;
  reg [31:0] _RAND_1266;
  reg [31:0] _RAND_1267;
  reg [31:0] _RAND_1268;
  reg [31:0] _RAND_1269;
  reg [31:0] _RAND_1270;
  reg [31:0] _RAND_1271;
  reg [31:0] _RAND_1272;
  reg [31:0] _RAND_1273;
  reg [31:0] _RAND_1274;
  reg [31:0] _RAND_1275;
  reg [31:0] _RAND_1276;
  reg [31:0] _RAND_1277;
  reg [31:0] _RAND_1278;
  reg [31:0] _RAND_1279;
  reg [31:0] _RAND_1280;
  reg [31:0] _RAND_1281;
  reg [31:0] _RAND_1282;
  reg [31:0] _RAND_1283;
  reg [31:0] _RAND_1284;
  reg [31:0] _RAND_1285;
  reg [31:0] _RAND_1286;
  reg [31:0] _RAND_1287;
  reg [31:0] _RAND_1288;
  reg [31:0] _RAND_1289;
  reg [31:0] _RAND_1290;
`endif // RANDOMIZE_REG_INIT
  reg [39:0] ram_addr [0:15]; // @[util.scala 464:20]
  wire [39:0] ram_addr_MPORT_1_data; // @[util.scala 464:20]
  wire [3:0] ram_addr_MPORT_1_addr; // @[util.scala 464:20]
  wire [39:0] ram_addr_MPORT_data; // @[util.scala 464:20]
  wire [3:0] ram_addr_MPORT_addr; // @[util.scala 464:20]
  wire  ram_addr_MPORT_mask; // @[util.scala 464:20]
  wire  ram_addr_MPORT_en; // @[util.scala 464:20]
  reg [63:0] ram_data [0:15]; // @[util.scala 464:20]
  wire [63:0] ram_data_MPORT_1_data; // @[util.scala 464:20]
  wire [3:0] ram_data_MPORT_1_addr; // @[util.scala 464:20]
  wire [63:0] ram_data_MPORT_data; // @[util.scala 464:20]
  wire [3:0] ram_data_MPORT_addr; // @[util.scala 464:20]
  wire  ram_data_MPORT_mask; // @[util.scala 464:20]
  wire  ram_data_MPORT_en; // @[util.scala 464:20]
  reg  ram_is_hella [0:15]; // @[util.scala 464:20]
  wire  ram_is_hella_MPORT_1_data; // @[util.scala 464:20]
  wire [3:0] ram_is_hella_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_is_hella_MPORT_data; // @[util.scala 464:20]
  wire [3:0] ram_is_hella_MPORT_addr; // @[util.scala 464:20]
  wire  ram_is_hella_MPORT_mask; // @[util.scala 464:20]
  wire  ram_is_hella_MPORT_en; // @[util.scala 464:20]
  reg  ram_tag_match [0:15]; // @[util.scala 464:20]
  wire  ram_tag_match_MPORT_1_data; // @[util.scala 464:20]
  wire [3:0] ram_tag_match_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_tag_match_MPORT_data; // @[util.scala 464:20]
  wire [3:0] ram_tag_match_MPORT_addr; // @[util.scala 464:20]
  wire  ram_tag_match_MPORT_mask; // @[util.scala 464:20]
  wire  ram_tag_match_MPORT_en; // @[util.scala 464:20]
  reg [1:0] ram_old_meta_coh_state [0:15]; // @[util.scala 464:20]
  wire [1:0] ram_old_meta_coh_state_MPORT_1_data; // @[util.scala 464:20]
  wire [3:0] ram_old_meta_coh_state_MPORT_1_addr; // @[util.scala 464:20]
  wire [1:0] ram_old_meta_coh_state_MPORT_data; // @[util.scala 464:20]
  wire [3:0] ram_old_meta_coh_state_MPORT_addr; // @[util.scala 464:20]
  wire  ram_old_meta_coh_state_MPORT_mask; // @[util.scala 464:20]
  wire  ram_old_meta_coh_state_MPORT_en; // @[util.scala 464:20]
  reg [19:0] ram_old_meta_tag [0:15]; // @[util.scala 464:20]
  wire [19:0] ram_old_meta_tag_MPORT_1_data; // @[util.scala 464:20]
  wire [3:0] ram_old_meta_tag_MPORT_1_addr; // @[util.scala 464:20]
  wire [19:0] ram_old_meta_tag_MPORT_data; // @[util.scala 464:20]
  wire [3:0] ram_old_meta_tag_MPORT_addr; // @[util.scala 464:20]
  wire  ram_old_meta_tag_MPORT_mask; // @[util.scala 464:20]
  wire  ram_old_meta_tag_MPORT_en; // @[util.scala 464:20]
  reg [3:0] ram_way_en [0:15]; // @[util.scala 464:20]
  wire [3:0] ram_way_en_MPORT_1_data; // @[util.scala 464:20]
  wire [3:0] ram_way_en_MPORT_1_addr; // @[util.scala 464:20]
  wire [3:0] ram_way_en_MPORT_data; // @[util.scala 464:20]
  wire [3:0] ram_way_en_MPORT_addr; // @[util.scala 464:20]
  wire  ram_way_en_MPORT_mask; // @[util.scala 464:20]
  wire  ram_way_en_MPORT_en; // @[util.scala 464:20]
  reg [4:0] ram_sdq_id [0:15]; // @[util.scala 464:20]
  wire [4:0] ram_sdq_id_MPORT_1_data; // @[util.scala 464:20]
  wire [3:0] ram_sdq_id_MPORT_1_addr; // @[util.scala 464:20]
  wire [4:0] ram_sdq_id_MPORT_data; // @[util.scala 464:20]
  wire [3:0] ram_sdq_id_MPORT_addr; // @[util.scala 464:20]
  wire  ram_sdq_id_MPORT_mask; // @[util.scala 464:20]
  wire  ram_sdq_id_MPORT_en; // @[util.scala 464:20]
  reg  valids_0; // @[util.scala 465:24]
  reg  valids_1; // @[util.scala 465:24]
  reg  valids_2; // @[util.scala 465:24]
  reg  valids_3; // @[util.scala 465:24]
  reg  valids_4; // @[util.scala 465:24]
  reg  valids_5; // @[util.scala 465:24]
  reg  valids_6; // @[util.scala 465:24]
  reg  valids_7; // @[util.scala 465:24]
  reg  valids_8; // @[util.scala 465:24]
  reg  valids_9; // @[util.scala 465:24]
  reg  valids_10; // @[util.scala 465:24]
  reg  valids_11; // @[util.scala 465:24]
  reg  valids_12; // @[util.scala 465:24]
  reg  valids_13; // @[util.scala 465:24]
  reg  valids_14; // @[util.scala 465:24]
  reg  valids_15; // @[util.scala 465:24]
  reg [6:0] uops_0_uopc; // @[util.scala 466:20]
  reg [31:0] uops_0_inst; // @[util.scala 466:20]
  reg [31:0] uops_0_debug_inst; // @[util.scala 466:20]
  reg  uops_0_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_0_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_0_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_0_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_0_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_0_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_0_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_0_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_0_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_0_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_0_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_0_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_0_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_0_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_0_iw_state; // @[util.scala 466:20]
  reg  uops_0_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_0_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_0_is_br; // @[util.scala 466:20]
  reg  uops_0_is_jalr; // @[util.scala 466:20]
  reg  uops_0_is_jal; // @[util.scala 466:20]
  reg  uops_0_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_0_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_0_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_0_ftq_idx; // @[util.scala 466:20]
  reg  uops_0_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_0_pc_lob; // @[util.scala 466:20]
  reg  uops_0_taken; // @[util.scala 466:20]
  reg [19:0] uops_0_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_0_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_0_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_0_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_0_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_0_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_0_pdst; // @[util.scala 466:20]
  reg [5:0] uops_0_prs1; // @[util.scala 466:20]
  reg [5:0] uops_0_prs2; // @[util.scala 466:20]
  reg [5:0] uops_0_prs3; // @[util.scala 466:20]
  reg [4:0] uops_0_ppred; // @[util.scala 466:20]
  reg  uops_0_prs1_busy; // @[util.scala 466:20]
  reg  uops_0_prs2_busy; // @[util.scala 466:20]
  reg  uops_0_prs3_busy; // @[util.scala 466:20]
  reg  uops_0_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_0_stale_pdst; // @[util.scala 466:20]
  reg  uops_0_exception; // @[util.scala 466:20]
  reg [63:0] uops_0_exc_cause; // @[util.scala 466:20]
  reg  uops_0_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_0_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_0_mem_size; // @[util.scala 466:20]
  reg  uops_0_mem_signed; // @[util.scala 466:20]
  reg  uops_0_is_fence; // @[util.scala 466:20]
  reg  uops_0_is_fencei; // @[util.scala 466:20]
  reg  uops_0_is_amo; // @[util.scala 466:20]
  reg  uops_0_uses_ldq; // @[util.scala 466:20]
  reg  uops_0_uses_stq; // @[util.scala 466:20]
  reg  uops_0_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_0_is_unique; // @[util.scala 466:20]
  reg  uops_0_flush_on_commit; // @[util.scala 466:20]
  reg  uops_0_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_0_ldst; // @[util.scala 466:20]
  reg [5:0] uops_0_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_0_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_0_lrs3; // @[util.scala 466:20]
  reg  uops_0_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_0_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_0_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_0_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_0_frs3_en; // @[util.scala 466:20]
  reg  uops_0_fp_val; // @[util.scala 466:20]
  reg  uops_0_fp_single; // @[util.scala 466:20]
  reg  uops_0_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_0_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_0_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_0_bp_debug_if; // @[util.scala 466:20]
  reg  uops_0_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_0_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_0_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_1_uopc; // @[util.scala 466:20]
  reg [31:0] uops_1_inst; // @[util.scala 466:20]
  reg [31:0] uops_1_debug_inst; // @[util.scala 466:20]
  reg  uops_1_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_1_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_1_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_1_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_1_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_1_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_1_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_1_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_1_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_1_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_1_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_1_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_1_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_1_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_1_iw_state; // @[util.scala 466:20]
  reg  uops_1_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_1_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_1_is_br; // @[util.scala 466:20]
  reg  uops_1_is_jalr; // @[util.scala 466:20]
  reg  uops_1_is_jal; // @[util.scala 466:20]
  reg  uops_1_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_1_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_1_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_1_ftq_idx; // @[util.scala 466:20]
  reg  uops_1_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_1_pc_lob; // @[util.scala 466:20]
  reg  uops_1_taken; // @[util.scala 466:20]
  reg [19:0] uops_1_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_1_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_1_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_1_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_1_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_1_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_1_pdst; // @[util.scala 466:20]
  reg [5:0] uops_1_prs1; // @[util.scala 466:20]
  reg [5:0] uops_1_prs2; // @[util.scala 466:20]
  reg [5:0] uops_1_prs3; // @[util.scala 466:20]
  reg [4:0] uops_1_ppred; // @[util.scala 466:20]
  reg  uops_1_prs1_busy; // @[util.scala 466:20]
  reg  uops_1_prs2_busy; // @[util.scala 466:20]
  reg  uops_1_prs3_busy; // @[util.scala 466:20]
  reg  uops_1_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_1_stale_pdst; // @[util.scala 466:20]
  reg  uops_1_exception; // @[util.scala 466:20]
  reg [63:0] uops_1_exc_cause; // @[util.scala 466:20]
  reg  uops_1_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_1_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_1_mem_size; // @[util.scala 466:20]
  reg  uops_1_mem_signed; // @[util.scala 466:20]
  reg  uops_1_is_fence; // @[util.scala 466:20]
  reg  uops_1_is_fencei; // @[util.scala 466:20]
  reg  uops_1_is_amo; // @[util.scala 466:20]
  reg  uops_1_uses_ldq; // @[util.scala 466:20]
  reg  uops_1_uses_stq; // @[util.scala 466:20]
  reg  uops_1_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_1_is_unique; // @[util.scala 466:20]
  reg  uops_1_flush_on_commit; // @[util.scala 466:20]
  reg  uops_1_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_1_ldst; // @[util.scala 466:20]
  reg [5:0] uops_1_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_1_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_1_lrs3; // @[util.scala 466:20]
  reg  uops_1_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_1_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_1_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_1_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_1_frs3_en; // @[util.scala 466:20]
  reg  uops_1_fp_val; // @[util.scala 466:20]
  reg  uops_1_fp_single; // @[util.scala 466:20]
  reg  uops_1_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_1_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_1_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_1_bp_debug_if; // @[util.scala 466:20]
  reg  uops_1_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_1_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_1_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_2_uopc; // @[util.scala 466:20]
  reg [31:0] uops_2_inst; // @[util.scala 466:20]
  reg [31:0] uops_2_debug_inst; // @[util.scala 466:20]
  reg  uops_2_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_2_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_2_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_2_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_2_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_2_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_2_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_2_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_2_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_2_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_2_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_2_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_2_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_2_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_2_iw_state; // @[util.scala 466:20]
  reg  uops_2_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_2_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_2_is_br; // @[util.scala 466:20]
  reg  uops_2_is_jalr; // @[util.scala 466:20]
  reg  uops_2_is_jal; // @[util.scala 466:20]
  reg  uops_2_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_2_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_2_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_2_ftq_idx; // @[util.scala 466:20]
  reg  uops_2_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_2_pc_lob; // @[util.scala 466:20]
  reg  uops_2_taken; // @[util.scala 466:20]
  reg [19:0] uops_2_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_2_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_2_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_2_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_2_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_2_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_2_pdst; // @[util.scala 466:20]
  reg [5:0] uops_2_prs1; // @[util.scala 466:20]
  reg [5:0] uops_2_prs2; // @[util.scala 466:20]
  reg [5:0] uops_2_prs3; // @[util.scala 466:20]
  reg [4:0] uops_2_ppred; // @[util.scala 466:20]
  reg  uops_2_prs1_busy; // @[util.scala 466:20]
  reg  uops_2_prs2_busy; // @[util.scala 466:20]
  reg  uops_2_prs3_busy; // @[util.scala 466:20]
  reg  uops_2_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_2_stale_pdst; // @[util.scala 466:20]
  reg  uops_2_exception; // @[util.scala 466:20]
  reg [63:0] uops_2_exc_cause; // @[util.scala 466:20]
  reg  uops_2_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_2_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_2_mem_size; // @[util.scala 466:20]
  reg  uops_2_mem_signed; // @[util.scala 466:20]
  reg  uops_2_is_fence; // @[util.scala 466:20]
  reg  uops_2_is_fencei; // @[util.scala 466:20]
  reg  uops_2_is_amo; // @[util.scala 466:20]
  reg  uops_2_uses_ldq; // @[util.scala 466:20]
  reg  uops_2_uses_stq; // @[util.scala 466:20]
  reg  uops_2_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_2_is_unique; // @[util.scala 466:20]
  reg  uops_2_flush_on_commit; // @[util.scala 466:20]
  reg  uops_2_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_2_ldst; // @[util.scala 466:20]
  reg [5:0] uops_2_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_2_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_2_lrs3; // @[util.scala 466:20]
  reg  uops_2_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_2_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_2_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_2_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_2_frs3_en; // @[util.scala 466:20]
  reg  uops_2_fp_val; // @[util.scala 466:20]
  reg  uops_2_fp_single; // @[util.scala 466:20]
  reg  uops_2_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_2_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_2_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_2_bp_debug_if; // @[util.scala 466:20]
  reg  uops_2_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_2_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_2_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_3_uopc; // @[util.scala 466:20]
  reg [31:0] uops_3_inst; // @[util.scala 466:20]
  reg [31:0] uops_3_debug_inst; // @[util.scala 466:20]
  reg  uops_3_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_3_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_3_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_3_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_3_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_3_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_3_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_3_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_3_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_3_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_3_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_3_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_3_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_3_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_3_iw_state; // @[util.scala 466:20]
  reg  uops_3_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_3_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_3_is_br; // @[util.scala 466:20]
  reg  uops_3_is_jalr; // @[util.scala 466:20]
  reg  uops_3_is_jal; // @[util.scala 466:20]
  reg  uops_3_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_3_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_3_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_3_ftq_idx; // @[util.scala 466:20]
  reg  uops_3_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_3_pc_lob; // @[util.scala 466:20]
  reg  uops_3_taken; // @[util.scala 466:20]
  reg [19:0] uops_3_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_3_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_3_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_3_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_3_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_3_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_3_pdst; // @[util.scala 466:20]
  reg [5:0] uops_3_prs1; // @[util.scala 466:20]
  reg [5:0] uops_3_prs2; // @[util.scala 466:20]
  reg [5:0] uops_3_prs3; // @[util.scala 466:20]
  reg [4:0] uops_3_ppred; // @[util.scala 466:20]
  reg  uops_3_prs1_busy; // @[util.scala 466:20]
  reg  uops_3_prs2_busy; // @[util.scala 466:20]
  reg  uops_3_prs3_busy; // @[util.scala 466:20]
  reg  uops_3_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_3_stale_pdst; // @[util.scala 466:20]
  reg  uops_3_exception; // @[util.scala 466:20]
  reg [63:0] uops_3_exc_cause; // @[util.scala 466:20]
  reg  uops_3_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_3_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_3_mem_size; // @[util.scala 466:20]
  reg  uops_3_mem_signed; // @[util.scala 466:20]
  reg  uops_3_is_fence; // @[util.scala 466:20]
  reg  uops_3_is_fencei; // @[util.scala 466:20]
  reg  uops_3_is_amo; // @[util.scala 466:20]
  reg  uops_3_uses_ldq; // @[util.scala 466:20]
  reg  uops_3_uses_stq; // @[util.scala 466:20]
  reg  uops_3_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_3_is_unique; // @[util.scala 466:20]
  reg  uops_3_flush_on_commit; // @[util.scala 466:20]
  reg  uops_3_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_3_ldst; // @[util.scala 466:20]
  reg [5:0] uops_3_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_3_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_3_lrs3; // @[util.scala 466:20]
  reg  uops_3_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_3_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_3_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_3_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_3_frs3_en; // @[util.scala 466:20]
  reg  uops_3_fp_val; // @[util.scala 466:20]
  reg  uops_3_fp_single; // @[util.scala 466:20]
  reg  uops_3_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_3_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_3_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_3_bp_debug_if; // @[util.scala 466:20]
  reg  uops_3_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_3_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_3_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_4_uopc; // @[util.scala 466:20]
  reg [31:0] uops_4_inst; // @[util.scala 466:20]
  reg [31:0] uops_4_debug_inst; // @[util.scala 466:20]
  reg  uops_4_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_4_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_4_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_4_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_4_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_4_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_4_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_4_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_4_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_4_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_4_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_4_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_4_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_4_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_4_iw_state; // @[util.scala 466:20]
  reg  uops_4_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_4_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_4_is_br; // @[util.scala 466:20]
  reg  uops_4_is_jalr; // @[util.scala 466:20]
  reg  uops_4_is_jal; // @[util.scala 466:20]
  reg  uops_4_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_4_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_4_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_4_ftq_idx; // @[util.scala 466:20]
  reg  uops_4_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_4_pc_lob; // @[util.scala 466:20]
  reg  uops_4_taken; // @[util.scala 466:20]
  reg [19:0] uops_4_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_4_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_4_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_4_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_4_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_4_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_4_pdst; // @[util.scala 466:20]
  reg [5:0] uops_4_prs1; // @[util.scala 466:20]
  reg [5:0] uops_4_prs2; // @[util.scala 466:20]
  reg [5:0] uops_4_prs3; // @[util.scala 466:20]
  reg [4:0] uops_4_ppred; // @[util.scala 466:20]
  reg  uops_4_prs1_busy; // @[util.scala 466:20]
  reg  uops_4_prs2_busy; // @[util.scala 466:20]
  reg  uops_4_prs3_busy; // @[util.scala 466:20]
  reg  uops_4_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_4_stale_pdst; // @[util.scala 466:20]
  reg  uops_4_exception; // @[util.scala 466:20]
  reg [63:0] uops_4_exc_cause; // @[util.scala 466:20]
  reg  uops_4_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_4_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_4_mem_size; // @[util.scala 466:20]
  reg  uops_4_mem_signed; // @[util.scala 466:20]
  reg  uops_4_is_fence; // @[util.scala 466:20]
  reg  uops_4_is_fencei; // @[util.scala 466:20]
  reg  uops_4_is_amo; // @[util.scala 466:20]
  reg  uops_4_uses_ldq; // @[util.scala 466:20]
  reg  uops_4_uses_stq; // @[util.scala 466:20]
  reg  uops_4_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_4_is_unique; // @[util.scala 466:20]
  reg  uops_4_flush_on_commit; // @[util.scala 466:20]
  reg  uops_4_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_4_ldst; // @[util.scala 466:20]
  reg [5:0] uops_4_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_4_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_4_lrs3; // @[util.scala 466:20]
  reg  uops_4_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_4_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_4_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_4_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_4_frs3_en; // @[util.scala 466:20]
  reg  uops_4_fp_val; // @[util.scala 466:20]
  reg  uops_4_fp_single; // @[util.scala 466:20]
  reg  uops_4_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_4_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_4_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_4_bp_debug_if; // @[util.scala 466:20]
  reg  uops_4_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_4_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_4_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_5_uopc; // @[util.scala 466:20]
  reg [31:0] uops_5_inst; // @[util.scala 466:20]
  reg [31:0] uops_5_debug_inst; // @[util.scala 466:20]
  reg  uops_5_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_5_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_5_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_5_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_5_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_5_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_5_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_5_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_5_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_5_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_5_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_5_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_5_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_5_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_5_iw_state; // @[util.scala 466:20]
  reg  uops_5_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_5_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_5_is_br; // @[util.scala 466:20]
  reg  uops_5_is_jalr; // @[util.scala 466:20]
  reg  uops_5_is_jal; // @[util.scala 466:20]
  reg  uops_5_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_5_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_5_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_5_ftq_idx; // @[util.scala 466:20]
  reg  uops_5_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_5_pc_lob; // @[util.scala 466:20]
  reg  uops_5_taken; // @[util.scala 466:20]
  reg [19:0] uops_5_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_5_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_5_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_5_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_5_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_5_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_5_pdst; // @[util.scala 466:20]
  reg [5:0] uops_5_prs1; // @[util.scala 466:20]
  reg [5:0] uops_5_prs2; // @[util.scala 466:20]
  reg [5:0] uops_5_prs3; // @[util.scala 466:20]
  reg [4:0] uops_5_ppred; // @[util.scala 466:20]
  reg  uops_5_prs1_busy; // @[util.scala 466:20]
  reg  uops_5_prs2_busy; // @[util.scala 466:20]
  reg  uops_5_prs3_busy; // @[util.scala 466:20]
  reg  uops_5_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_5_stale_pdst; // @[util.scala 466:20]
  reg  uops_5_exception; // @[util.scala 466:20]
  reg [63:0] uops_5_exc_cause; // @[util.scala 466:20]
  reg  uops_5_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_5_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_5_mem_size; // @[util.scala 466:20]
  reg  uops_5_mem_signed; // @[util.scala 466:20]
  reg  uops_5_is_fence; // @[util.scala 466:20]
  reg  uops_5_is_fencei; // @[util.scala 466:20]
  reg  uops_5_is_amo; // @[util.scala 466:20]
  reg  uops_5_uses_ldq; // @[util.scala 466:20]
  reg  uops_5_uses_stq; // @[util.scala 466:20]
  reg  uops_5_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_5_is_unique; // @[util.scala 466:20]
  reg  uops_5_flush_on_commit; // @[util.scala 466:20]
  reg  uops_5_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_5_ldst; // @[util.scala 466:20]
  reg [5:0] uops_5_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_5_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_5_lrs3; // @[util.scala 466:20]
  reg  uops_5_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_5_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_5_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_5_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_5_frs3_en; // @[util.scala 466:20]
  reg  uops_5_fp_val; // @[util.scala 466:20]
  reg  uops_5_fp_single; // @[util.scala 466:20]
  reg  uops_5_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_5_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_5_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_5_bp_debug_if; // @[util.scala 466:20]
  reg  uops_5_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_5_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_5_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_6_uopc; // @[util.scala 466:20]
  reg [31:0] uops_6_inst; // @[util.scala 466:20]
  reg [31:0] uops_6_debug_inst; // @[util.scala 466:20]
  reg  uops_6_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_6_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_6_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_6_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_6_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_6_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_6_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_6_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_6_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_6_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_6_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_6_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_6_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_6_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_6_iw_state; // @[util.scala 466:20]
  reg  uops_6_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_6_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_6_is_br; // @[util.scala 466:20]
  reg  uops_6_is_jalr; // @[util.scala 466:20]
  reg  uops_6_is_jal; // @[util.scala 466:20]
  reg  uops_6_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_6_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_6_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_6_ftq_idx; // @[util.scala 466:20]
  reg  uops_6_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_6_pc_lob; // @[util.scala 466:20]
  reg  uops_6_taken; // @[util.scala 466:20]
  reg [19:0] uops_6_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_6_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_6_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_6_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_6_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_6_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_6_pdst; // @[util.scala 466:20]
  reg [5:0] uops_6_prs1; // @[util.scala 466:20]
  reg [5:0] uops_6_prs2; // @[util.scala 466:20]
  reg [5:0] uops_6_prs3; // @[util.scala 466:20]
  reg [4:0] uops_6_ppred; // @[util.scala 466:20]
  reg  uops_6_prs1_busy; // @[util.scala 466:20]
  reg  uops_6_prs2_busy; // @[util.scala 466:20]
  reg  uops_6_prs3_busy; // @[util.scala 466:20]
  reg  uops_6_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_6_stale_pdst; // @[util.scala 466:20]
  reg  uops_6_exception; // @[util.scala 466:20]
  reg [63:0] uops_6_exc_cause; // @[util.scala 466:20]
  reg  uops_6_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_6_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_6_mem_size; // @[util.scala 466:20]
  reg  uops_6_mem_signed; // @[util.scala 466:20]
  reg  uops_6_is_fence; // @[util.scala 466:20]
  reg  uops_6_is_fencei; // @[util.scala 466:20]
  reg  uops_6_is_amo; // @[util.scala 466:20]
  reg  uops_6_uses_ldq; // @[util.scala 466:20]
  reg  uops_6_uses_stq; // @[util.scala 466:20]
  reg  uops_6_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_6_is_unique; // @[util.scala 466:20]
  reg  uops_6_flush_on_commit; // @[util.scala 466:20]
  reg  uops_6_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_6_ldst; // @[util.scala 466:20]
  reg [5:0] uops_6_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_6_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_6_lrs3; // @[util.scala 466:20]
  reg  uops_6_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_6_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_6_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_6_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_6_frs3_en; // @[util.scala 466:20]
  reg  uops_6_fp_val; // @[util.scala 466:20]
  reg  uops_6_fp_single; // @[util.scala 466:20]
  reg  uops_6_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_6_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_6_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_6_bp_debug_if; // @[util.scala 466:20]
  reg  uops_6_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_6_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_6_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_7_uopc; // @[util.scala 466:20]
  reg [31:0] uops_7_inst; // @[util.scala 466:20]
  reg [31:0] uops_7_debug_inst; // @[util.scala 466:20]
  reg  uops_7_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_7_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_7_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_7_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_7_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_7_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_7_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_7_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_7_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_7_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_7_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_7_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_7_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_7_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_7_iw_state; // @[util.scala 466:20]
  reg  uops_7_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_7_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_7_is_br; // @[util.scala 466:20]
  reg  uops_7_is_jalr; // @[util.scala 466:20]
  reg  uops_7_is_jal; // @[util.scala 466:20]
  reg  uops_7_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_7_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_7_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_7_ftq_idx; // @[util.scala 466:20]
  reg  uops_7_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_7_pc_lob; // @[util.scala 466:20]
  reg  uops_7_taken; // @[util.scala 466:20]
  reg [19:0] uops_7_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_7_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_7_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_7_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_7_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_7_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_7_pdst; // @[util.scala 466:20]
  reg [5:0] uops_7_prs1; // @[util.scala 466:20]
  reg [5:0] uops_7_prs2; // @[util.scala 466:20]
  reg [5:0] uops_7_prs3; // @[util.scala 466:20]
  reg [4:0] uops_7_ppred; // @[util.scala 466:20]
  reg  uops_7_prs1_busy; // @[util.scala 466:20]
  reg  uops_7_prs2_busy; // @[util.scala 466:20]
  reg  uops_7_prs3_busy; // @[util.scala 466:20]
  reg  uops_7_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_7_stale_pdst; // @[util.scala 466:20]
  reg  uops_7_exception; // @[util.scala 466:20]
  reg [63:0] uops_7_exc_cause; // @[util.scala 466:20]
  reg  uops_7_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_7_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_7_mem_size; // @[util.scala 466:20]
  reg  uops_7_mem_signed; // @[util.scala 466:20]
  reg  uops_7_is_fence; // @[util.scala 466:20]
  reg  uops_7_is_fencei; // @[util.scala 466:20]
  reg  uops_7_is_amo; // @[util.scala 466:20]
  reg  uops_7_uses_ldq; // @[util.scala 466:20]
  reg  uops_7_uses_stq; // @[util.scala 466:20]
  reg  uops_7_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_7_is_unique; // @[util.scala 466:20]
  reg  uops_7_flush_on_commit; // @[util.scala 466:20]
  reg  uops_7_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_7_ldst; // @[util.scala 466:20]
  reg [5:0] uops_7_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_7_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_7_lrs3; // @[util.scala 466:20]
  reg  uops_7_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_7_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_7_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_7_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_7_frs3_en; // @[util.scala 466:20]
  reg  uops_7_fp_val; // @[util.scala 466:20]
  reg  uops_7_fp_single; // @[util.scala 466:20]
  reg  uops_7_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_7_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_7_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_7_bp_debug_if; // @[util.scala 466:20]
  reg  uops_7_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_7_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_7_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_8_uopc; // @[util.scala 466:20]
  reg [31:0] uops_8_inst; // @[util.scala 466:20]
  reg [31:0] uops_8_debug_inst; // @[util.scala 466:20]
  reg  uops_8_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_8_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_8_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_8_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_8_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_8_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_8_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_8_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_8_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_8_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_8_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_8_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_8_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_8_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_8_iw_state; // @[util.scala 466:20]
  reg  uops_8_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_8_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_8_is_br; // @[util.scala 466:20]
  reg  uops_8_is_jalr; // @[util.scala 466:20]
  reg  uops_8_is_jal; // @[util.scala 466:20]
  reg  uops_8_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_8_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_8_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_8_ftq_idx; // @[util.scala 466:20]
  reg  uops_8_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_8_pc_lob; // @[util.scala 466:20]
  reg  uops_8_taken; // @[util.scala 466:20]
  reg [19:0] uops_8_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_8_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_8_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_8_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_8_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_8_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_8_pdst; // @[util.scala 466:20]
  reg [5:0] uops_8_prs1; // @[util.scala 466:20]
  reg [5:0] uops_8_prs2; // @[util.scala 466:20]
  reg [5:0] uops_8_prs3; // @[util.scala 466:20]
  reg [4:0] uops_8_ppred; // @[util.scala 466:20]
  reg  uops_8_prs1_busy; // @[util.scala 466:20]
  reg  uops_8_prs2_busy; // @[util.scala 466:20]
  reg  uops_8_prs3_busy; // @[util.scala 466:20]
  reg  uops_8_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_8_stale_pdst; // @[util.scala 466:20]
  reg  uops_8_exception; // @[util.scala 466:20]
  reg [63:0] uops_8_exc_cause; // @[util.scala 466:20]
  reg  uops_8_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_8_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_8_mem_size; // @[util.scala 466:20]
  reg  uops_8_mem_signed; // @[util.scala 466:20]
  reg  uops_8_is_fence; // @[util.scala 466:20]
  reg  uops_8_is_fencei; // @[util.scala 466:20]
  reg  uops_8_is_amo; // @[util.scala 466:20]
  reg  uops_8_uses_ldq; // @[util.scala 466:20]
  reg  uops_8_uses_stq; // @[util.scala 466:20]
  reg  uops_8_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_8_is_unique; // @[util.scala 466:20]
  reg  uops_8_flush_on_commit; // @[util.scala 466:20]
  reg  uops_8_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_8_ldst; // @[util.scala 466:20]
  reg [5:0] uops_8_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_8_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_8_lrs3; // @[util.scala 466:20]
  reg  uops_8_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_8_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_8_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_8_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_8_frs3_en; // @[util.scala 466:20]
  reg  uops_8_fp_val; // @[util.scala 466:20]
  reg  uops_8_fp_single; // @[util.scala 466:20]
  reg  uops_8_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_8_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_8_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_8_bp_debug_if; // @[util.scala 466:20]
  reg  uops_8_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_8_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_8_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_9_uopc; // @[util.scala 466:20]
  reg [31:0] uops_9_inst; // @[util.scala 466:20]
  reg [31:0] uops_9_debug_inst; // @[util.scala 466:20]
  reg  uops_9_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_9_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_9_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_9_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_9_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_9_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_9_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_9_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_9_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_9_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_9_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_9_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_9_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_9_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_9_iw_state; // @[util.scala 466:20]
  reg  uops_9_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_9_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_9_is_br; // @[util.scala 466:20]
  reg  uops_9_is_jalr; // @[util.scala 466:20]
  reg  uops_9_is_jal; // @[util.scala 466:20]
  reg  uops_9_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_9_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_9_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_9_ftq_idx; // @[util.scala 466:20]
  reg  uops_9_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_9_pc_lob; // @[util.scala 466:20]
  reg  uops_9_taken; // @[util.scala 466:20]
  reg [19:0] uops_9_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_9_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_9_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_9_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_9_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_9_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_9_pdst; // @[util.scala 466:20]
  reg [5:0] uops_9_prs1; // @[util.scala 466:20]
  reg [5:0] uops_9_prs2; // @[util.scala 466:20]
  reg [5:0] uops_9_prs3; // @[util.scala 466:20]
  reg [4:0] uops_9_ppred; // @[util.scala 466:20]
  reg  uops_9_prs1_busy; // @[util.scala 466:20]
  reg  uops_9_prs2_busy; // @[util.scala 466:20]
  reg  uops_9_prs3_busy; // @[util.scala 466:20]
  reg  uops_9_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_9_stale_pdst; // @[util.scala 466:20]
  reg  uops_9_exception; // @[util.scala 466:20]
  reg [63:0] uops_9_exc_cause; // @[util.scala 466:20]
  reg  uops_9_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_9_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_9_mem_size; // @[util.scala 466:20]
  reg  uops_9_mem_signed; // @[util.scala 466:20]
  reg  uops_9_is_fence; // @[util.scala 466:20]
  reg  uops_9_is_fencei; // @[util.scala 466:20]
  reg  uops_9_is_amo; // @[util.scala 466:20]
  reg  uops_9_uses_ldq; // @[util.scala 466:20]
  reg  uops_9_uses_stq; // @[util.scala 466:20]
  reg  uops_9_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_9_is_unique; // @[util.scala 466:20]
  reg  uops_9_flush_on_commit; // @[util.scala 466:20]
  reg  uops_9_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_9_ldst; // @[util.scala 466:20]
  reg [5:0] uops_9_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_9_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_9_lrs3; // @[util.scala 466:20]
  reg  uops_9_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_9_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_9_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_9_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_9_frs3_en; // @[util.scala 466:20]
  reg  uops_9_fp_val; // @[util.scala 466:20]
  reg  uops_9_fp_single; // @[util.scala 466:20]
  reg  uops_9_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_9_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_9_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_9_bp_debug_if; // @[util.scala 466:20]
  reg  uops_9_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_9_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_9_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_10_uopc; // @[util.scala 466:20]
  reg [31:0] uops_10_inst; // @[util.scala 466:20]
  reg [31:0] uops_10_debug_inst; // @[util.scala 466:20]
  reg  uops_10_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_10_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_10_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_10_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_10_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_10_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_10_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_10_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_10_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_10_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_10_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_10_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_10_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_10_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_10_iw_state; // @[util.scala 466:20]
  reg  uops_10_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_10_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_10_is_br; // @[util.scala 466:20]
  reg  uops_10_is_jalr; // @[util.scala 466:20]
  reg  uops_10_is_jal; // @[util.scala 466:20]
  reg  uops_10_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_10_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_10_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_10_ftq_idx; // @[util.scala 466:20]
  reg  uops_10_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_10_pc_lob; // @[util.scala 466:20]
  reg  uops_10_taken; // @[util.scala 466:20]
  reg [19:0] uops_10_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_10_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_10_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_10_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_10_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_10_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_10_pdst; // @[util.scala 466:20]
  reg [5:0] uops_10_prs1; // @[util.scala 466:20]
  reg [5:0] uops_10_prs2; // @[util.scala 466:20]
  reg [5:0] uops_10_prs3; // @[util.scala 466:20]
  reg [4:0] uops_10_ppred; // @[util.scala 466:20]
  reg  uops_10_prs1_busy; // @[util.scala 466:20]
  reg  uops_10_prs2_busy; // @[util.scala 466:20]
  reg  uops_10_prs3_busy; // @[util.scala 466:20]
  reg  uops_10_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_10_stale_pdst; // @[util.scala 466:20]
  reg  uops_10_exception; // @[util.scala 466:20]
  reg [63:0] uops_10_exc_cause; // @[util.scala 466:20]
  reg  uops_10_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_10_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_10_mem_size; // @[util.scala 466:20]
  reg  uops_10_mem_signed; // @[util.scala 466:20]
  reg  uops_10_is_fence; // @[util.scala 466:20]
  reg  uops_10_is_fencei; // @[util.scala 466:20]
  reg  uops_10_is_amo; // @[util.scala 466:20]
  reg  uops_10_uses_ldq; // @[util.scala 466:20]
  reg  uops_10_uses_stq; // @[util.scala 466:20]
  reg  uops_10_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_10_is_unique; // @[util.scala 466:20]
  reg  uops_10_flush_on_commit; // @[util.scala 466:20]
  reg  uops_10_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_10_ldst; // @[util.scala 466:20]
  reg [5:0] uops_10_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_10_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_10_lrs3; // @[util.scala 466:20]
  reg  uops_10_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_10_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_10_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_10_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_10_frs3_en; // @[util.scala 466:20]
  reg  uops_10_fp_val; // @[util.scala 466:20]
  reg  uops_10_fp_single; // @[util.scala 466:20]
  reg  uops_10_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_10_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_10_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_10_bp_debug_if; // @[util.scala 466:20]
  reg  uops_10_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_10_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_10_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_11_uopc; // @[util.scala 466:20]
  reg [31:0] uops_11_inst; // @[util.scala 466:20]
  reg [31:0] uops_11_debug_inst; // @[util.scala 466:20]
  reg  uops_11_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_11_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_11_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_11_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_11_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_11_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_11_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_11_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_11_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_11_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_11_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_11_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_11_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_11_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_11_iw_state; // @[util.scala 466:20]
  reg  uops_11_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_11_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_11_is_br; // @[util.scala 466:20]
  reg  uops_11_is_jalr; // @[util.scala 466:20]
  reg  uops_11_is_jal; // @[util.scala 466:20]
  reg  uops_11_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_11_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_11_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_11_ftq_idx; // @[util.scala 466:20]
  reg  uops_11_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_11_pc_lob; // @[util.scala 466:20]
  reg  uops_11_taken; // @[util.scala 466:20]
  reg [19:0] uops_11_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_11_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_11_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_11_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_11_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_11_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_11_pdst; // @[util.scala 466:20]
  reg [5:0] uops_11_prs1; // @[util.scala 466:20]
  reg [5:0] uops_11_prs2; // @[util.scala 466:20]
  reg [5:0] uops_11_prs3; // @[util.scala 466:20]
  reg [4:0] uops_11_ppred; // @[util.scala 466:20]
  reg  uops_11_prs1_busy; // @[util.scala 466:20]
  reg  uops_11_prs2_busy; // @[util.scala 466:20]
  reg  uops_11_prs3_busy; // @[util.scala 466:20]
  reg  uops_11_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_11_stale_pdst; // @[util.scala 466:20]
  reg  uops_11_exception; // @[util.scala 466:20]
  reg [63:0] uops_11_exc_cause; // @[util.scala 466:20]
  reg  uops_11_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_11_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_11_mem_size; // @[util.scala 466:20]
  reg  uops_11_mem_signed; // @[util.scala 466:20]
  reg  uops_11_is_fence; // @[util.scala 466:20]
  reg  uops_11_is_fencei; // @[util.scala 466:20]
  reg  uops_11_is_amo; // @[util.scala 466:20]
  reg  uops_11_uses_ldq; // @[util.scala 466:20]
  reg  uops_11_uses_stq; // @[util.scala 466:20]
  reg  uops_11_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_11_is_unique; // @[util.scala 466:20]
  reg  uops_11_flush_on_commit; // @[util.scala 466:20]
  reg  uops_11_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_11_ldst; // @[util.scala 466:20]
  reg [5:0] uops_11_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_11_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_11_lrs3; // @[util.scala 466:20]
  reg  uops_11_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_11_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_11_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_11_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_11_frs3_en; // @[util.scala 466:20]
  reg  uops_11_fp_val; // @[util.scala 466:20]
  reg  uops_11_fp_single; // @[util.scala 466:20]
  reg  uops_11_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_11_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_11_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_11_bp_debug_if; // @[util.scala 466:20]
  reg  uops_11_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_11_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_11_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_12_uopc; // @[util.scala 466:20]
  reg [31:0] uops_12_inst; // @[util.scala 466:20]
  reg [31:0] uops_12_debug_inst; // @[util.scala 466:20]
  reg  uops_12_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_12_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_12_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_12_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_12_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_12_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_12_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_12_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_12_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_12_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_12_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_12_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_12_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_12_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_12_iw_state; // @[util.scala 466:20]
  reg  uops_12_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_12_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_12_is_br; // @[util.scala 466:20]
  reg  uops_12_is_jalr; // @[util.scala 466:20]
  reg  uops_12_is_jal; // @[util.scala 466:20]
  reg  uops_12_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_12_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_12_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_12_ftq_idx; // @[util.scala 466:20]
  reg  uops_12_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_12_pc_lob; // @[util.scala 466:20]
  reg  uops_12_taken; // @[util.scala 466:20]
  reg [19:0] uops_12_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_12_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_12_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_12_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_12_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_12_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_12_pdst; // @[util.scala 466:20]
  reg [5:0] uops_12_prs1; // @[util.scala 466:20]
  reg [5:0] uops_12_prs2; // @[util.scala 466:20]
  reg [5:0] uops_12_prs3; // @[util.scala 466:20]
  reg [4:0] uops_12_ppred; // @[util.scala 466:20]
  reg  uops_12_prs1_busy; // @[util.scala 466:20]
  reg  uops_12_prs2_busy; // @[util.scala 466:20]
  reg  uops_12_prs3_busy; // @[util.scala 466:20]
  reg  uops_12_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_12_stale_pdst; // @[util.scala 466:20]
  reg  uops_12_exception; // @[util.scala 466:20]
  reg [63:0] uops_12_exc_cause; // @[util.scala 466:20]
  reg  uops_12_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_12_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_12_mem_size; // @[util.scala 466:20]
  reg  uops_12_mem_signed; // @[util.scala 466:20]
  reg  uops_12_is_fence; // @[util.scala 466:20]
  reg  uops_12_is_fencei; // @[util.scala 466:20]
  reg  uops_12_is_amo; // @[util.scala 466:20]
  reg  uops_12_uses_ldq; // @[util.scala 466:20]
  reg  uops_12_uses_stq; // @[util.scala 466:20]
  reg  uops_12_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_12_is_unique; // @[util.scala 466:20]
  reg  uops_12_flush_on_commit; // @[util.scala 466:20]
  reg  uops_12_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_12_ldst; // @[util.scala 466:20]
  reg [5:0] uops_12_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_12_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_12_lrs3; // @[util.scala 466:20]
  reg  uops_12_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_12_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_12_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_12_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_12_frs3_en; // @[util.scala 466:20]
  reg  uops_12_fp_val; // @[util.scala 466:20]
  reg  uops_12_fp_single; // @[util.scala 466:20]
  reg  uops_12_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_12_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_12_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_12_bp_debug_if; // @[util.scala 466:20]
  reg  uops_12_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_12_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_12_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_13_uopc; // @[util.scala 466:20]
  reg [31:0] uops_13_inst; // @[util.scala 466:20]
  reg [31:0] uops_13_debug_inst; // @[util.scala 466:20]
  reg  uops_13_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_13_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_13_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_13_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_13_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_13_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_13_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_13_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_13_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_13_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_13_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_13_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_13_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_13_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_13_iw_state; // @[util.scala 466:20]
  reg  uops_13_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_13_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_13_is_br; // @[util.scala 466:20]
  reg  uops_13_is_jalr; // @[util.scala 466:20]
  reg  uops_13_is_jal; // @[util.scala 466:20]
  reg  uops_13_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_13_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_13_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_13_ftq_idx; // @[util.scala 466:20]
  reg  uops_13_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_13_pc_lob; // @[util.scala 466:20]
  reg  uops_13_taken; // @[util.scala 466:20]
  reg [19:0] uops_13_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_13_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_13_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_13_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_13_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_13_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_13_pdst; // @[util.scala 466:20]
  reg [5:0] uops_13_prs1; // @[util.scala 466:20]
  reg [5:0] uops_13_prs2; // @[util.scala 466:20]
  reg [5:0] uops_13_prs3; // @[util.scala 466:20]
  reg [4:0] uops_13_ppred; // @[util.scala 466:20]
  reg  uops_13_prs1_busy; // @[util.scala 466:20]
  reg  uops_13_prs2_busy; // @[util.scala 466:20]
  reg  uops_13_prs3_busy; // @[util.scala 466:20]
  reg  uops_13_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_13_stale_pdst; // @[util.scala 466:20]
  reg  uops_13_exception; // @[util.scala 466:20]
  reg [63:0] uops_13_exc_cause; // @[util.scala 466:20]
  reg  uops_13_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_13_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_13_mem_size; // @[util.scala 466:20]
  reg  uops_13_mem_signed; // @[util.scala 466:20]
  reg  uops_13_is_fence; // @[util.scala 466:20]
  reg  uops_13_is_fencei; // @[util.scala 466:20]
  reg  uops_13_is_amo; // @[util.scala 466:20]
  reg  uops_13_uses_ldq; // @[util.scala 466:20]
  reg  uops_13_uses_stq; // @[util.scala 466:20]
  reg  uops_13_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_13_is_unique; // @[util.scala 466:20]
  reg  uops_13_flush_on_commit; // @[util.scala 466:20]
  reg  uops_13_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_13_ldst; // @[util.scala 466:20]
  reg [5:0] uops_13_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_13_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_13_lrs3; // @[util.scala 466:20]
  reg  uops_13_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_13_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_13_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_13_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_13_frs3_en; // @[util.scala 466:20]
  reg  uops_13_fp_val; // @[util.scala 466:20]
  reg  uops_13_fp_single; // @[util.scala 466:20]
  reg  uops_13_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_13_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_13_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_13_bp_debug_if; // @[util.scala 466:20]
  reg  uops_13_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_13_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_13_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_14_uopc; // @[util.scala 466:20]
  reg [31:0] uops_14_inst; // @[util.scala 466:20]
  reg [31:0] uops_14_debug_inst; // @[util.scala 466:20]
  reg  uops_14_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_14_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_14_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_14_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_14_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_14_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_14_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_14_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_14_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_14_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_14_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_14_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_14_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_14_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_14_iw_state; // @[util.scala 466:20]
  reg  uops_14_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_14_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_14_is_br; // @[util.scala 466:20]
  reg  uops_14_is_jalr; // @[util.scala 466:20]
  reg  uops_14_is_jal; // @[util.scala 466:20]
  reg  uops_14_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_14_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_14_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_14_ftq_idx; // @[util.scala 466:20]
  reg  uops_14_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_14_pc_lob; // @[util.scala 466:20]
  reg  uops_14_taken; // @[util.scala 466:20]
  reg [19:0] uops_14_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_14_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_14_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_14_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_14_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_14_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_14_pdst; // @[util.scala 466:20]
  reg [5:0] uops_14_prs1; // @[util.scala 466:20]
  reg [5:0] uops_14_prs2; // @[util.scala 466:20]
  reg [5:0] uops_14_prs3; // @[util.scala 466:20]
  reg [4:0] uops_14_ppred; // @[util.scala 466:20]
  reg  uops_14_prs1_busy; // @[util.scala 466:20]
  reg  uops_14_prs2_busy; // @[util.scala 466:20]
  reg  uops_14_prs3_busy; // @[util.scala 466:20]
  reg  uops_14_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_14_stale_pdst; // @[util.scala 466:20]
  reg  uops_14_exception; // @[util.scala 466:20]
  reg [63:0] uops_14_exc_cause; // @[util.scala 466:20]
  reg  uops_14_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_14_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_14_mem_size; // @[util.scala 466:20]
  reg  uops_14_mem_signed; // @[util.scala 466:20]
  reg  uops_14_is_fence; // @[util.scala 466:20]
  reg  uops_14_is_fencei; // @[util.scala 466:20]
  reg  uops_14_is_amo; // @[util.scala 466:20]
  reg  uops_14_uses_ldq; // @[util.scala 466:20]
  reg  uops_14_uses_stq; // @[util.scala 466:20]
  reg  uops_14_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_14_is_unique; // @[util.scala 466:20]
  reg  uops_14_flush_on_commit; // @[util.scala 466:20]
  reg  uops_14_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_14_ldst; // @[util.scala 466:20]
  reg [5:0] uops_14_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_14_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_14_lrs3; // @[util.scala 466:20]
  reg  uops_14_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_14_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_14_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_14_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_14_frs3_en; // @[util.scala 466:20]
  reg  uops_14_fp_val; // @[util.scala 466:20]
  reg  uops_14_fp_single; // @[util.scala 466:20]
  reg  uops_14_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_14_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_14_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_14_bp_debug_if; // @[util.scala 466:20]
  reg  uops_14_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_14_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_14_debug_tsrc; // @[util.scala 466:20]
  reg [6:0] uops_15_uopc; // @[util.scala 466:20]
  reg [31:0] uops_15_inst; // @[util.scala 466:20]
  reg [31:0] uops_15_debug_inst; // @[util.scala 466:20]
  reg  uops_15_is_rvc; // @[util.scala 466:20]
  reg [39:0] uops_15_debug_pc; // @[util.scala 466:20]
  reg [2:0] uops_15_iq_type; // @[util.scala 466:20]
  reg [9:0] uops_15_fu_code; // @[util.scala 466:20]
  reg [3:0] uops_15_ctrl_br_type; // @[util.scala 466:20]
  reg [1:0] uops_15_ctrl_op1_sel; // @[util.scala 466:20]
  reg [2:0] uops_15_ctrl_op2_sel; // @[util.scala 466:20]
  reg [2:0] uops_15_ctrl_imm_sel; // @[util.scala 466:20]
  reg [3:0] uops_15_ctrl_op_fcn; // @[util.scala 466:20]
  reg  uops_15_ctrl_fcn_dw; // @[util.scala 466:20]
  reg [2:0] uops_15_ctrl_csr_cmd; // @[util.scala 466:20]
  reg  uops_15_ctrl_is_load; // @[util.scala 466:20]
  reg  uops_15_ctrl_is_sta; // @[util.scala 466:20]
  reg  uops_15_ctrl_is_std; // @[util.scala 466:20]
  reg [1:0] uops_15_iw_state; // @[util.scala 466:20]
  reg  uops_15_iw_p1_poisoned; // @[util.scala 466:20]
  reg  uops_15_iw_p2_poisoned; // @[util.scala 466:20]
  reg  uops_15_is_br; // @[util.scala 466:20]
  reg  uops_15_is_jalr; // @[util.scala 466:20]
  reg  uops_15_is_jal; // @[util.scala 466:20]
  reg  uops_15_is_sfb; // @[util.scala 466:20]
  reg [11:0] uops_15_br_mask; // @[util.scala 466:20]
  reg [3:0] uops_15_br_tag; // @[util.scala 466:20]
  reg [4:0] uops_15_ftq_idx; // @[util.scala 466:20]
  reg  uops_15_edge_inst; // @[util.scala 466:20]
  reg [5:0] uops_15_pc_lob; // @[util.scala 466:20]
  reg  uops_15_taken; // @[util.scala 466:20]
  reg [19:0] uops_15_imm_packed; // @[util.scala 466:20]
  reg [11:0] uops_15_csr_addr; // @[util.scala 466:20]
  reg [5:0] uops_15_rob_idx; // @[util.scala 466:20]
  reg [3:0] uops_15_ldq_idx; // @[util.scala 466:20]
  reg [3:0] uops_15_stq_idx; // @[util.scala 466:20]
  reg [1:0] uops_15_rxq_idx; // @[util.scala 466:20]
  reg [5:0] uops_15_pdst; // @[util.scala 466:20]
  reg [5:0] uops_15_prs1; // @[util.scala 466:20]
  reg [5:0] uops_15_prs2; // @[util.scala 466:20]
  reg [5:0] uops_15_prs3; // @[util.scala 466:20]
  reg [4:0] uops_15_ppred; // @[util.scala 466:20]
  reg  uops_15_prs1_busy; // @[util.scala 466:20]
  reg  uops_15_prs2_busy; // @[util.scala 466:20]
  reg  uops_15_prs3_busy; // @[util.scala 466:20]
  reg  uops_15_ppred_busy; // @[util.scala 466:20]
  reg [5:0] uops_15_stale_pdst; // @[util.scala 466:20]
  reg  uops_15_exception; // @[util.scala 466:20]
  reg [63:0] uops_15_exc_cause; // @[util.scala 466:20]
  reg  uops_15_bypassable; // @[util.scala 466:20]
  reg [4:0] uops_15_mem_cmd; // @[util.scala 466:20]
  reg [1:0] uops_15_mem_size; // @[util.scala 466:20]
  reg  uops_15_mem_signed; // @[util.scala 466:20]
  reg  uops_15_is_fence; // @[util.scala 466:20]
  reg  uops_15_is_fencei; // @[util.scala 466:20]
  reg  uops_15_is_amo; // @[util.scala 466:20]
  reg  uops_15_uses_ldq; // @[util.scala 466:20]
  reg  uops_15_uses_stq; // @[util.scala 466:20]
  reg  uops_15_is_sys_pc2epc; // @[util.scala 466:20]
  reg  uops_15_is_unique; // @[util.scala 466:20]
  reg  uops_15_flush_on_commit; // @[util.scala 466:20]
  reg  uops_15_ldst_is_rs1; // @[util.scala 466:20]
  reg [5:0] uops_15_ldst; // @[util.scala 466:20]
  reg [5:0] uops_15_lrs1; // @[util.scala 466:20]
  reg [5:0] uops_15_lrs2; // @[util.scala 466:20]
  reg [5:0] uops_15_lrs3; // @[util.scala 466:20]
  reg  uops_15_ldst_val; // @[util.scala 466:20]
  reg [1:0] uops_15_dst_rtype; // @[util.scala 466:20]
  reg [1:0] uops_15_lrs1_rtype; // @[util.scala 466:20]
  reg [1:0] uops_15_lrs2_rtype; // @[util.scala 466:20]
  reg  uops_15_frs3_en; // @[util.scala 466:20]
  reg  uops_15_fp_val; // @[util.scala 466:20]
  reg  uops_15_fp_single; // @[util.scala 466:20]
  reg  uops_15_xcpt_pf_if; // @[util.scala 466:20]
  reg  uops_15_xcpt_ae_if; // @[util.scala 466:20]
  reg  uops_15_xcpt_ma_if; // @[util.scala 466:20]
  reg  uops_15_bp_debug_if; // @[util.scala 466:20]
  reg  uops_15_bp_xcpt_if; // @[util.scala 466:20]
  reg [1:0] uops_15_debug_fsrc; // @[util.scala 466:20]
  reg [1:0] uops_15_debug_tsrc; // @[util.scala 466:20]
  reg [3:0] value; // @[Counter.scala 60:40]
  reg [3:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[util.scala 470:27]
  wire  ptr_match = value == value_1; // @[util.scala 472:33]
  wire  full = ptr_match & maybe_full; // @[util.scala 474:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_1 = 4'h1 == value_1 ? valids_1 : valids_0; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_2 = 4'h2 == value_1 ? valids_2 : _GEN_1; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_3 = 4'h3 == value_1 ? valids_3 : _GEN_2; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_4 = 4'h4 == value_1 ? valids_4 : _GEN_3; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_5 = 4'h5 == value_1 ? valids_5 : _GEN_4; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_6 = 4'h6 == value_1 ? valids_6 : _GEN_5; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_7 = 4'h7 == value_1 ? valids_7 : _GEN_6; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_8 = 4'h8 == value_1 ? valids_8 : _GEN_7; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_9 = 4'h9 == value_1 ? valids_9 : _GEN_8; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_10 = 4'ha == value_1 ? valids_10 : _GEN_9; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_11 = 4'hb == value_1 ? valids_11 : _GEN_10; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_12 = 4'hc == value_1 ? valids_12 : _GEN_11; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_13 = 4'hd == value_1 ? valids_13 : _GEN_12; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_14 = 4'he == value_1 ? valids_14 : _GEN_13; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_15 = 4'hf == value_1 ? valids_15 : _GEN_14; // @[util.scala 476:42 util.scala 476:42]
  wire  _T_5 = ~io_empty; // @[util.scala 476:69]
  wire  do_deq = (io_deq_ready | ~_GEN_15) & ~io_empty; // @[util.scala 476:66]
  wire [11:0] _T_7 = io_brupdate_b1_mispredict_mask & uops_0_br_mask; // @[util.scala 118:51]
  wire  _T_8 = _T_7 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_14 = ~io_brupdate_b1_resolve_mask; // @[util.scala 89:23]
  wire [11:0] _T_15 = uops_0_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_16 = valids_0 ? _T_15 : uops_0_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_16 = io_brupdate_b1_mispredict_mask & uops_1_br_mask; // @[util.scala 118:51]
  wire  _T_17 = _T_16 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_24 = uops_1_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_17 = valids_1 ? _T_24 : uops_1_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_25 = io_brupdate_b1_mispredict_mask & uops_2_br_mask; // @[util.scala 118:51]
  wire  _T_26 = _T_25 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_33 = uops_2_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_18 = valids_2 ? _T_33 : uops_2_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_34 = io_brupdate_b1_mispredict_mask & uops_3_br_mask; // @[util.scala 118:51]
  wire  _T_35 = _T_34 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_42 = uops_3_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_19 = valids_3 ? _T_42 : uops_3_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_43 = io_brupdate_b1_mispredict_mask & uops_4_br_mask; // @[util.scala 118:51]
  wire  _T_44 = _T_43 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_51 = uops_4_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_20 = valids_4 ? _T_51 : uops_4_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_52 = io_brupdate_b1_mispredict_mask & uops_5_br_mask; // @[util.scala 118:51]
  wire  _T_53 = _T_52 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_60 = uops_5_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_21 = valids_5 ? _T_60 : uops_5_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_61 = io_brupdate_b1_mispredict_mask & uops_6_br_mask; // @[util.scala 118:51]
  wire  _T_62 = _T_61 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_69 = uops_6_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_22 = valids_6 ? _T_69 : uops_6_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_70 = io_brupdate_b1_mispredict_mask & uops_7_br_mask; // @[util.scala 118:51]
  wire  _T_71 = _T_70 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_78 = uops_7_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_23 = valids_7 ? _T_78 : uops_7_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_79 = io_brupdate_b1_mispredict_mask & uops_8_br_mask; // @[util.scala 118:51]
  wire  _T_80 = _T_79 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_87 = uops_8_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_24 = valids_8 ? _T_87 : uops_8_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_88 = io_brupdate_b1_mispredict_mask & uops_9_br_mask; // @[util.scala 118:51]
  wire  _T_89 = _T_88 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_96 = uops_9_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_25 = valids_9 ? _T_96 : uops_9_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_97 = io_brupdate_b1_mispredict_mask & uops_10_br_mask; // @[util.scala 118:51]
  wire  _T_98 = _T_97 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_105 = uops_10_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_26 = valids_10 ? _T_105 : uops_10_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_106 = io_brupdate_b1_mispredict_mask & uops_11_br_mask; // @[util.scala 118:51]
  wire  _T_107 = _T_106 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_114 = uops_11_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_27 = valids_11 ? _T_114 : uops_11_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_115 = io_brupdate_b1_mispredict_mask & uops_12_br_mask; // @[util.scala 118:51]
  wire  _T_116 = _T_115 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_123 = uops_12_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_28 = valids_12 ? _T_123 : uops_12_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_124 = io_brupdate_b1_mispredict_mask & uops_13_br_mask; // @[util.scala 118:51]
  wire  _T_125 = _T_124 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_132 = uops_13_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_29 = valids_13 ? _T_132 : uops_13_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_133 = io_brupdate_b1_mispredict_mask & uops_14_br_mask; // @[util.scala 118:51]
  wire  _T_134 = _T_133 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_141 = uops_14_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_30 = valids_14 ? _T_141 : uops_14_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_142 = io_brupdate_b1_mispredict_mask & uops_15_br_mask; // @[util.scala 118:51]
  wire  _T_143 = _T_142 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_150 = uops_15_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_31 = valids_15 ? _T_150 : uops_15_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire  _GEN_32 = 4'h0 == value | valids_0 & ~_T_8 & ~(io_flush & uops_0_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_33 = 4'h1 == value | valids_1 & ~_T_17 & ~(io_flush & uops_1_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_34 = 4'h2 == value | valids_2 & ~_T_26 & ~(io_flush & uops_2_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_35 = 4'h3 == value | valids_3 & ~_T_35 & ~(io_flush & uops_3_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_36 = 4'h4 == value | valids_4 & ~_T_44 & ~(io_flush & uops_4_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_37 = 4'h5 == value | valids_5 & ~_T_53 & ~(io_flush & uops_5_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_38 = 4'h6 == value | valids_6 & ~_T_62 & ~(io_flush & uops_6_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_39 = 4'h7 == value | valids_7 & ~_T_71 & ~(io_flush & uops_7_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_40 = 4'h8 == value | valids_8 & ~_T_80 & ~(io_flush & uops_8_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_41 = 4'h9 == value | valids_9 & ~_T_89 & ~(io_flush & uops_9_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_42 = 4'ha == value | valids_10 & ~_T_98 & ~(io_flush & uops_10_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_43 = 4'hb == value | valids_11 & ~_T_107 & ~(io_flush & uops_11_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_44 = 4'hc == value | valids_12 & ~_T_116 & ~(io_flush & uops_12_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_45 = 4'hd == value | valids_13 & ~_T_125 & ~(io_flush & uops_13_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_46 = 4'he == value | valids_14 & ~_T_134 & ~(io_flush & uops_14_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_47 = 4'hf == value | valids_15 & ~_T_143 & ~(io_flush & uops_15_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire [11:0] _T_152 = io_enq_bits_uop_br_mask & _T_14; // @[util.scala 85:25]
  wire [3:0] _value_T_1 = value + 4'h1; // @[Counter.scala 76:24]
  wire  _GEN_1419 = do_enq ? _GEN_32 : valids_0 & ~_T_8 & ~(io_flush & uops_0_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1420 = do_enq ? _GEN_33 : valids_1 & ~_T_17 & ~(io_flush & uops_1_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1421 = do_enq ? _GEN_34 : valids_2 & ~_T_26 & ~(io_flush & uops_2_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1422 = do_enq ? _GEN_35 : valids_3 & ~_T_35 & ~(io_flush & uops_3_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1423 = do_enq ? _GEN_36 : valids_4 & ~_T_44 & ~(io_flush & uops_4_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1424 = do_enq ? _GEN_37 : valids_5 & ~_T_53 & ~(io_flush & uops_5_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1425 = do_enq ? _GEN_38 : valids_6 & ~_T_62 & ~(io_flush & uops_6_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1426 = do_enq ? _GEN_39 : valids_7 & ~_T_71 & ~(io_flush & uops_7_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1427 = do_enq ? _GEN_40 : valids_8 & ~_T_80 & ~(io_flush & uops_8_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1428 = do_enq ? _GEN_41 : valids_9 & ~_T_89 & ~(io_flush & uops_9_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1429 = do_enq ? _GEN_42 : valids_10 & ~_T_98 & ~(io_flush & uops_10_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1430 = do_enq ? _GEN_43 : valids_11 & ~_T_107 & ~(io_flush & uops_11_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1431 = do_enq ? _GEN_44 : valids_12 & ~_T_116 & ~(io_flush & uops_12_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1432 = do_enq ? _GEN_45 : valids_13 & ~_T_125 & ~(io_flush & uops_13_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1433 = do_enq ? _GEN_46 : valids_14 & ~_T_134 & ~(io_flush & uops_14_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_1434 = do_enq ? _GEN_47 : valids_15 & ~_T_143 & ~(io_flush & uops_15_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire [3:0] _value_T_3 = value_1 + 4'h1; // @[Counter.scala 76:24]
  wire [1:0] _GEN_2735 = 4'h1 == value_1 ? uops_1_debug_tsrc : uops_0_debug_tsrc; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2736 = 4'h2 == value_1 ? uops_2_debug_tsrc : _GEN_2735; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2737 = 4'h3 == value_1 ? uops_3_debug_tsrc : _GEN_2736; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2738 = 4'h4 == value_1 ? uops_4_debug_tsrc : _GEN_2737; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2739 = 4'h5 == value_1 ? uops_5_debug_tsrc : _GEN_2738; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2740 = 4'h6 == value_1 ? uops_6_debug_tsrc : _GEN_2739; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2741 = 4'h7 == value_1 ? uops_7_debug_tsrc : _GEN_2740; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2742 = 4'h8 == value_1 ? uops_8_debug_tsrc : _GEN_2741; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2743 = 4'h9 == value_1 ? uops_9_debug_tsrc : _GEN_2742; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2744 = 4'ha == value_1 ? uops_10_debug_tsrc : _GEN_2743; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2745 = 4'hb == value_1 ? uops_11_debug_tsrc : _GEN_2744; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2746 = 4'hc == value_1 ? uops_12_debug_tsrc : _GEN_2745; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2747 = 4'hd == value_1 ? uops_13_debug_tsrc : _GEN_2746; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2748 = 4'he == value_1 ? uops_14_debug_tsrc : _GEN_2747; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2751 = 4'h1 == value_1 ? uops_1_debug_fsrc : uops_0_debug_fsrc; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2752 = 4'h2 == value_1 ? uops_2_debug_fsrc : _GEN_2751; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2753 = 4'h3 == value_1 ? uops_3_debug_fsrc : _GEN_2752; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2754 = 4'h4 == value_1 ? uops_4_debug_fsrc : _GEN_2753; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2755 = 4'h5 == value_1 ? uops_5_debug_fsrc : _GEN_2754; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2756 = 4'h6 == value_1 ? uops_6_debug_fsrc : _GEN_2755; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2757 = 4'h7 == value_1 ? uops_7_debug_fsrc : _GEN_2756; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2758 = 4'h8 == value_1 ? uops_8_debug_fsrc : _GEN_2757; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2759 = 4'h9 == value_1 ? uops_9_debug_fsrc : _GEN_2758; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2760 = 4'ha == value_1 ? uops_10_debug_fsrc : _GEN_2759; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2761 = 4'hb == value_1 ? uops_11_debug_fsrc : _GEN_2760; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2762 = 4'hc == value_1 ? uops_12_debug_fsrc : _GEN_2761; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2763 = 4'hd == value_1 ? uops_13_debug_fsrc : _GEN_2762; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2764 = 4'he == value_1 ? uops_14_debug_fsrc : _GEN_2763; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2767 = 4'h1 == value_1 ? uops_1_bp_xcpt_if : uops_0_bp_xcpt_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2768 = 4'h2 == value_1 ? uops_2_bp_xcpt_if : _GEN_2767; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2769 = 4'h3 == value_1 ? uops_3_bp_xcpt_if : _GEN_2768; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2770 = 4'h4 == value_1 ? uops_4_bp_xcpt_if : _GEN_2769; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2771 = 4'h5 == value_1 ? uops_5_bp_xcpt_if : _GEN_2770; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2772 = 4'h6 == value_1 ? uops_6_bp_xcpt_if : _GEN_2771; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2773 = 4'h7 == value_1 ? uops_7_bp_xcpt_if : _GEN_2772; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2774 = 4'h8 == value_1 ? uops_8_bp_xcpt_if : _GEN_2773; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2775 = 4'h9 == value_1 ? uops_9_bp_xcpt_if : _GEN_2774; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2776 = 4'ha == value_1 ? uops_10_bp_xcpt_if : _GEN_2775; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2777 = 4'hb == value_1 ? uops_11_bp_xcpt_if : _GEN_2776; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2778 = 4'hc == value_1 ? uops_12_bp_xcpt_if : _GEN_2777; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2779 = 4'hd == value_1 ? uops_13_bp_xcpt_if : _GEN_2778; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2780 = 4'he == value_1 ? uops_14_bp_xcpt_if : _GEN_2779; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2783 = 4'h1 == value_1 ? uops_1_bp_debug_if : uops_0_bp_debug_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2784 = 4'h2 == value_1 ? uops_2_bp_debug_if : _GEN_2783; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2785 = 4'h3 == value_1 ? uops_3_bp_debug_if : _GEN_2784; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2786 = 4'h4 == value_1 ? uops_4_bp_debug_if : _GEN_2785; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2787 = 4'h5 == value_1 ? uops_5_bp_debug_if : _GEN_2786; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2788 = 4'h6 == value_1 ? uops_6_bp_debug_if : _GEN_2787; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2789 = 4'h7 == value_1 ? uops_7_bp_debug_if : _GEN_2788; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2790 = 4'h8 == value_1 ? uops_8_bp_debug_if : _GEN_2789; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2791 = 4'h9 == value_1 ? uops_9_bp_debug_if : _GEN_2790; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2792 = 4'ha == value_1 ? uops_10_bp_debug_if : _GEN_2791; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2793 = 4'hb == value_1 ? uops_11_bp_debug_if : _GEN_2792; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2794 = 4'hc == value_1 ? uops_12_bp_debug_if : _GEN_2793; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2795 = 4'hd == value_1 ? uops_13_bp_debug_if : _GEN_2794; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2796 = 4'he == value_1 ? uops_14_bp_debug_if : _GEN_2795; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2799 = 4'h1 == value_1 ? uops_1_xcpt_ma_if : uops_0_xcpt_ma_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2800 = 4'h2 == value_1 ? uops_2_xcpt_ma_if : _GEN_2799; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2801 = 4'h3 == value_1 ? uops_3_xcpt_ma_if : _GEN_2800; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2802 = 4'h4 == value_1 ? uops_4_xcpt_ma_if : _GEN_2801; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2803 = 4'h5 == value_1 ? uops_5_xcpt_ma_if : _GEN_2802; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2804 = 4'h6 == value_1 ? uops_6_xcpt_ma_if : _GEN_2803; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2805 = 4'h7 == value_1 ? uops_7_xcpt_ma_if : _GEN_2804; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2806 = 4'h8 == value_1 ? uops_8_xcpt_ma_if : _GEN_2805; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2807 = 4'h9 == value_1 ? uops_9_xcpt_ma_if : _GEN_2806; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2808 = 4'ha == value_1 ? uops_10_xcpt_ma_if : _GEN_2807; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2809 = 4'hb == value_1 ? uops_11_xcpt_ma_if : _GEN_2808; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2810 = 4'hc == value_1 ? uops_12_xcpt_ma_if : _GEN_2809; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2811 = 4'hd == value_1 ? uops_13_xcpt_ma_if : _GEN_2810; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2812 = 4'he == value_1 ? uops_14_xcpt_ma_if : _GEN_2811; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2815 = 4'h1 == value_1 ? uops_1_xcpt_ae_if : uops_0_xcpt_ae_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2816 = 4'h2 == value_1 ? uops_2_xcpt_ae_if : _GEN_2815; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2817 = 4'h3 == value_1 ? uops_3_xcpt_ae_if : _GEN_2816; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2818 = 4'h4 == value_1 ? uops_4_xcpt_ae_if : _GEN_2817; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2819 = 4'h5 == value_1 ? uops_5_xcpt_ae_if : _GEN_2818; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2820 = 4'h6 == value_1 ? uops_6_xcpt_ae_if : _GEN_2819; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2821 = 4'h7 == value_1 ? uops_7_xcpt_ae_if : _GEN_2820; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2822 = 4'h8 == value_1 ? uops_8_xcpt_ae_if : _GEN_2821; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2823 = 4'h9 == value_1 ? uops_9_xcpt_ae_if : _GEN_2822; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2824 = 4'ha == value_1 ? uops_10_xcpt_ae_if : _GEN_2823; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2825 = 4'hb == value_1 ? uops_11_xcpt_ae_if : _GEN_2824; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2826 = 4'hc == value_1 ? uops_12_xcpt_ae_if : _GEN_2825; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2827 = 4'hd == value_1 ? uops_13_xcpt_ae_if : _GEN_2826; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2828 = 4'he == value_1 ? uops_14_xcpt_ae_if : _GEN_2827; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2831 = 4'h1 == value_1 ? uops_1_xcpt_pf_if : uops_0_xcpt_pf_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2832 = 4'h2 == value_1 ? uops_2_xcpt_pf_if : _GEN_2831; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2833 = 4'h3 == value_1 ? uops_3_xcpt_pf_if : _GEN_2832; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2834 = 4'h4 == value_1 ? uops_4_xcpt_pf_if : _GEN_2833; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2835 = 4'h5 == value_1 ? uops_5_xcpt_pf_if : _GEN_2834; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2836 = 4'h6 == value_1 ? uops_6_xcpt_pf_if : _GEN_2835; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2837 = 4'h7 == value_1 ? uops_7_xcpt_pf_if : _GEN_2836; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2838 = 4'h8 == value_1 ? uops_8_xcpt_pf_if : _GEN_2837; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2839 = 4'h9 == value_1 ? uops_9_xcpt_pf_if : _GEN_2838; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2840 = 4'ha == value_1 ? uops_10_xcpt_pf_if : _GEN_2839; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2841 = 4'hb == value_1 ? uops_11_xcpt_pf_if : _GEN_2840; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2842 = 4'hc == value_1 ? uops_12_xcpt_pf_if : _GEN_2841; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2843 = 4'hd == value_1 ? uops_13_xcpt_pf_if : _GEN_2842; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2844 = 4'he == value_1 ? uops_14_xcpt_pf_if : _GEN_2843; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2847 = 4'h1 == value_1 ? uops_1_fp_single : uops_0_fp_single; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2848 = 4'h2 == value_1 ? uops_2_fp_single : _GEN_2847; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2849 = 4'h3 == value_1 ? uops_3_fp_single : _GEN_2848; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2850 = 4'h4 == value_1 ? uops_4_fp_single : _GEN_2849; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2851 = 4'h5 == value_1 ? uops_5_fp_single : _GEN_2850; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2852 = 4'h6 == value_1 ? uops_6_fp_single : _GEN_2851; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2853 = 4'h7 == value_1 ? uops_7_fp_single : _GEN_2852; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2854 = 4'h8 == value_1 ? uops_8_fp_single : _GEN_2853; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2855 = 4'h9 == value_1 ? uops_9_fp_single : _GEN_2854; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2856 = 4'ha == value_1 ? uops_10_fp_single : _GEN_2855; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2857 = 4'hb == value_1 ? uops_11_fp_single : _GEN_2856; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2858 = 4'hc == value_1 ? uops_12_fp_single : _GEN_2857; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2859 = 4'hd == value_1 ? uops_13_fp_single : _GEN_2858; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2860 = 4'he == value_1 ? uops_14_fp_single : _GEN_2859; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2863 = 4'h1 == value_1 ? uops_1_fp_val : uops_0_fp_val; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2864 = 4'h2 == value_1 ? uops_2_fp_val : _GEN_2863; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2865 = 4'h3 == value_1 ? uops_3_fp_val : _GEN_2864; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2866 = 4'h4 == value_1 ? uops_4_fp_val : _GEN_2865; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2867 = 4'h5 == value_1 ? uops_5_fp_val : _GEN_2866; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2868 = 4'h6 == value_1 ? uops_6_fp_val : _GEN_2867; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2869 = 4'h7 == value_1 ? uops_7_fp_val : _GEN_2868; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2870 = 4'h8 == value_1 ? uops_8_fp_val : _GEN_2869; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2871 = 4'h9 == value_1 ? uops_9_fp_val : _GEN_2870; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2872 = 4'ha == value_1 ? uops_10_fp_val : _GEN_2871; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2873 = 4'hb == value_1 ? uops_11_fp_val : _GEN_2872; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2874 = 4'hc == value_1 ? uops_12_fp_val : _GEN_2873; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2875 = 4'hd == value_1 ? uops_13_fp_val : _GEN_2874; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2876 = 4'he == value_1 ? uops_14_fp_val : _GEN_2875; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2879 = 4'h1 == value_1 ? uops_1_frs3_en : uops_0_frs3_en; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2880 = 4'h2 == value_1 ? uops_2_frs3_en : _GEN_2879; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2881 = 4'h3 == value_1 ? uops_3_frs3_en : _GEN_2880; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2882 = 4'h4 == value_1 ? uops_4_frs3_en : _GEN_2881; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2883 = 4'h5 == value_1 ? uops_5_frs3_en : _GEN_2882; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2884 = 4'h6 == value_1 ? uops_6_frs3_en : _GEN_2883; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2885 = 4'h7 == value_1 ? uops_7_frs3_en : _GEN_2884; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2886 = 4'h8 == value_1 ? uops_8_frs3_en : _GEN_2885; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2887 = 4'h9 == value_1 ? uops_9_frs3_en : _GEN_2886; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2888 = 4'ha == value_1 ? uops_10_frs3_en : _GEN_2887; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2889 = 4'hb == value_1 ? uops_11_frs3_en : _GEN_2888; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2890 = 4'hc == value_1 ? uops_12_frs3_en : _GEN_2889; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2891 = 4'hd == value_1 ? uops_13_frs3_en : _GEN_2890; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2892 = 4'he == value_1 ? uops_14_frs3_en : _GEN_2891; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2895 = 4'h1 == value_1 ? uops_1_lrs2_rtype : uops_0_lrs2_rtype; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2896 = 4'h2 == value_1 ? uops_2_lrs2_rtype : _GEN_2895; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2897 = 4'h3 == value_1 ? uops_3_lrs2_rtype : _GEN_2896; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2898 = 4'h4 == value_1 ? uops_4_lrs2_rtype : _GEN_2897; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2899 = 4'h5 == value_1 ? uops_5_lrs2_rtype : _GEN_2898; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2900 = 4'h6 == value_1 ? uops_6_lrs2_rtype : _GEN_2899; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2901 = 4'h7 == value_1 ? uops_7_lrs2_rtype : _GEN_2900; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2902 = 4'h8 == value_1 ? uops_8_lrs2_rtype : _GEN_2901; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2903 = 4'h9 == value_1 ? uops_9_lrs2_rtype : _GEN_2902; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2904 = 4'ha == value_1 ? uops_10_lrs2_rtype : _GEN_2903; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2905 = 4'hb == value_1 ? uops_11_lrs2_rtype : _GEN_2904; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2906 = 4'hc == value_1 ? uops_12_lrs2_rtype : _GEN_2905; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2907 = 4'hd == value_1 ? uops_13_lrs2_rtype : _GEN_2906; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2908 = 4'he == value_1 ? uops_14_lrs2_rtype : _GEN_2907; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2911 = 4'h1 == value_1 ? uops_1_lrs1_rtype : uops_0_lrs1_rtype; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2912 = 4'h2 == value_1 ? uops_2_lrs1_rtype : _GEN_2911; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2913 = 4'h3 == value_1 ? uops_3_lrs1_rtype : _GEN_2912; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2914 = 4'h4 == value_1 ? uops_4_lrs1_rtype : _GEN_2913; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2915 = 4'h5 == value_1 ? uops_5_lrs1_rtype : _GEN_2914; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2916 = 4'h6 == value_1 ? uops_6_lrs1_rtype : _GEN_2915; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2917 = 4'h7 == value_1 ? uops_7_lrs1_rtype : _GEN_2916; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2918 = 4'h8 == value_1 ? uops_8_lrs1_rtype : _GEN_2917; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2919 = 4'h9 == value_1 ? uops_9_lrs1_rtype : _GEN_2918; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2920 = 4'ha == value_1 ? uops_10_lrs1_rtype : _GEN_2919; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2921 = 4'hb == value_1 ? uops_11_lrs1_rtype : _GEN_2920; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2922 = 4'hc == value_1 ? uops_12_lrs1_rtype : _GEN_2921; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2923 = 4'hd == value_1 ? uops_13_lrs1_rtype : _GEN_2922; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2924 = 4'he == value_1 ? uops_14_lrs1_rtype : _GEN_2923; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2927 = 4'h1 == value_1 ? uops_1_dst_rtype : uops_0_dst_rtype; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2928 = 4'h2 == value_1 ? uops_2_dst_rtype : _GEN_2927; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2929 = 4'h3 == value_1 ? uops_3_dst_rtype : _GEN_2928; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2930 = 4'h4 == value_1 ? uops_4_dst_rtype : _GEN_2929; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2931 = 4'h5 == value_1 ? uops_5_dst_rtype : _GEN_2930; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2932 = 4'h6 == value_1 ? uops_6_dst_rtype : _GEN_2931; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2933 = 4'h7 == value_1 ? uops_7_dst_rtype : _GEN_2932; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2934 = 4'h8 == value_1 ? uops_8_dst_rtype : _GEN_2933; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2935 = 4'h9 == value_1 ? uops_9_dst_rtype : _GEN_2934; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2936 = 4'ha == value_1 ? uops_10_dst_rtype : _GEN_2935; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2937 = 4'hb == value_1 ? uops_11_dst_rtype : _GEN_2936; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2938 = 4'hc == value_1 ? uops_12_dst_rtype : _GEN_2937; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2939 = 4'hd == value_1 ? uops_13_dst_rtype : _GEN_2938; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_2940 = 4'he == value_1 ? uops_14_dst_rtype : _GEN_2939; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2943 = 4'h1 == value_1 ? uops_1_ldst_val : uops_0_ldst_val; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2944 = 4'h2 == value_1 ? uops_2_ldst_val : _GEN_2943; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2945 = 4'h3 == value_1 ? uops_3_ldst_val : _GEN_2944; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2946 = 4'h4 == value_1 ? uops_4_ldst_val : _GEN_2945; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2947 = 4'h5 == value_1 ? uops_5_ldst_val : _GEN_2946; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2948 = 4'h6 == value_1 ? uops_6_ldst_val : _GEN_2947; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2949 = 4'h7 == value_1 ? uops_7_ldst_val : _GEN_2948; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2950 = 4'h8 == value_1 ? uops_8_ldst_val : _GEN_2949; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2951 = 4'h9 == value_1 ? uops_9_ldst_val : _GEN_2950; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2952 = 4'ha == value_1 ? uops_10_ldst_val : _GEN_2951; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2953 = 4'hb == value_1 ? uops_11_ldst_val : _GEN_2952; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2954 = 4'hc == value_1 ? uops_12_ldst_val : _GEN_2953; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2955 = 4'hd == value_1 ? uops_13_ldst_val : _GEN_2954; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_2956 = 4'he == value_1 ? uops_14_ldst_val : _GEN_2955; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2959 = 4'h1 == value_1 ? uops_1_lrs3 : uops_0_lrs3; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2960 = 4'h2 == value_1 ? uops_2_lrs3 : _GEN_2959; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2961 = 4'h3 == value_1 ? uops_3_lrs3 : _GEN_2960; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2962 = 4'h4 == value_1 ? uops_4_lrs3 : _GEN_2961; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2963 = 4'h5 == value_1 ? uops_5_lrs3 : _GEN_2962; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2964 = 4'h6 == value_1 ? uops_6_lrs3 : _GEN_2963; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2965 = 4'h7 == value_1 ? uops_7_lrs3 : _GEN_2964; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2966 = 4'h8 == value_1 ? uops_8_lrs3 : _GEN_2965; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2967 = 4'h9 == value_1 ? uops_9_lrs3 : _GEN_2966; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2968 = 4'ha == value_1 ? uops_10_lrs3 : _GEN_2967; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2969 = 4'hb == value_1 ? uops_11_lrs3 : _GEN_2968; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2970 = 4'hc == value_1 ? uops_12_lrs3 : _GEN_2969; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2971 = 4'hd == value_1 ? uops_13_lrs3 : _GEN_2970; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2972 = 4'he == value_1 ? uops_14_lrs3 : _GEN_2971; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2975 = 4'h1 == value_1 ? uops_1_lrs2 : uops_0_lrs2; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2976 = 4'h2 == value_1 ? uops_2_lrs2 : _GEN_2975; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2977 = 4'h3 == value_1 ? uops_3_lrs2 : _GEN_2976; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2978 = 4'h4 == value_1 ? uops_4_lrs2 : _GEN_2977; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2979 = 4'h5 == value_1 ? uops_5_lrs2 : _GEN_2978; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2980 = 4'h6 == value_1 ? uops_6_lrs2 : _GEN_2979; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2981 = 4'h7 == value_1 ? uops_7_lrs2 : _GEN_2980; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2982 = 4'h8 == value_1 ? uops_8_lrs2 : _GEN_2981; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2983 = 4'h9 == value_1 ? uops_9_lrs2 : _GEN_2982; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2984 = 4'ha == value_1 ? uops_10_lrs2 : _GEN_2983; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2985 = 4'hb == value_1 ? uops_11_lrs2 : _GEN_2984; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2986 = 4'hc == value_1 ? uops_12_lrs2 : _GEN_2985; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2987 = 4'hd == value_1 ? uops_13_lrs2 : _GEN_2986; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2988 = 4'he == value_1 ? uops_14_lrs2 : _GEN_2987; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2991 = 4'h1 == value_1 ? uops_1_lrs1 : uops_0_lrs1; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2992 = 4'h2 == value_1 ? uops_2_lrs1 : _GEN_2991; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2993 = 4'h3 == value_1 ? uops_3_lrs1 : _GEN_2992; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2994 = 4'h4 == value_1 ? uops_4_lrs1 : _GEN_2993; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2995 = 4'h5 == value_1 ? uops_5_lrs1 : _GEN_2994; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2996 = 4'h6 == value_1 ? uops_6_lrs1 : _GEN_2995; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2997 = 4'h7 == value_1 ? uops_7_lrs1 : _GEN_2996; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2998 = 4'h8 == value_1 ? uops_8_lrs1 : _GEN_2997; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_2999 = 4'h9 == value_1 ? uops_9_lrs1 : _GEN_2998; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3000 = 4'ha == value_1 ? uops_10_lrs1 : _GEN_2999; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3001 = 4'hb == value_1 ? uops_11_lrs1 : _GEN_3000; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3002 = 4'hc == value_1 ? uops_12_lrs1 : _GEN_3001; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3003 = 4'hd == value_1 ? uops_13_lrs1 : _GEN_3002; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3004 = 4'he == value_1 ? uops_14_lrs1 : _GEN_3003; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3007 = 4'h1 == value_1 ? uops_1_ldst : uops_0_ldst; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3008 = 4'h2 == value_1 ? uops_2_ldst : _GEN_3007; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3009 = 4'h3 == value_1 ? uops_3_ldst : _GEN_3008; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3010 = 4'h4 == value_1 ? uops_4_ldst : _GEN_3009; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3011 = 4'h5 == value_1 ? uops_5_ldst : _GEN_3010; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3012 = 4'h6 == value_1 ? uops_6_ldst : _GEN_3011; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3013 = 4'h7 == value_1 ? uops_7_ldst : _GEN_3012; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3014 = 4'h8 == value_1 ? uops_8_ldst : _GEN_3013; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3015 = 4'h9 == value_1 ? uops_9_ldst : _GEN_3014; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3016 = 4'ha == value_1 ? uops_10_ldst : _GEN_3015; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3017 = 4'hb == value_1 ? uops_11_ldst : _GEN_3016; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3018 = 4'hc == value_1 ? uops_12_ldst : _GEN_3017; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3019 = 4'hd == value_1 ? uops_13_ldst : _GEN_3018; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3020 = 4'he == value_1 ? uops_14_ldst : _GEN_3019; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3023 = 4'h1 == value_1 ? uops_1_ldst_is_rs1 : uops_0_ldst_is_rs1; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3024 = 4'h2 == value_1 ? uops_2_ldst_is_rs1 : _GEN_3023; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3025 = 4'h3 == value_1 ? uops_3_ldst_is_rs1 : _GEN_3024; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3026 = 4'h4 == value_1 ? uops_4_ldst_is_rs1 : _GEN_3025; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3027 = 4'h5 == value_1 ? uops_5_ldst_is_rs1 : _GEN_3026; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3028 = 4'h6 == value_1 ? uops_6_ldst_is_rs1 : _GEN_3027; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3029 = 4'h7 == value_1 ? uops_7_ldst_is_rs1 : _GEN_3028; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3030 = 4'h8 == value_1 ? uops_8_ldst_is_rs1 : _GEN_3029; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3031 = 4'h9 == value_1 ? uops_9_ldst_is_rs1 : _GEN_3030; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3032 = 4'ha == value_1 ? uops_10_ldst_is_rs1 : _GEN_3031; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3033 = 4'hb == value_1 ? uops_11_ldst_is_rs1 : _GEN_3032; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3034 = 4'hc == value_1 ? uops_12_ldst_is_rs1 : _GEN_3033; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3035 = 4'hd == value_1 ? uops_13_ldst_is_rs1 : _GEN_3034; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3036 = 4'he == value_1 ? uops_14_ldst_is_rs1 : _GEN_3035; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3039 = 4'h1 == value_1 ? uops_1_flush_on_commit : uops_0_flush_on_commit; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3040 = 4'h2 == value_1 ? uops_2_flush_on_commit : _GEN_3039; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3041 = 4'h3 == value_1 ? uops_3_flush_on_commit : _GEN_3040; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3042 = 4'h4 == value_1 ? uops_4_flush_on_commit : _GEN_3041; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3043 = 4'h5 == value_1 ? uops_5_flush_on_commit : _GEN_3042; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3044 = 4'h6 == value_1 ? uops_6_flush_on_commit : _GEN_3043; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3045 = 4'h7 == value_1 ? uops_7_flush_on_commit : _GEN_3044; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3046 = 4'h8 == value_1 ? uops_8_flush_on_commit : _GEN_3045; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3047 = 4'h9 == value_1 ? uops_9_flush_on_commit : _GEN_3046; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3048 = 4'ha == value_1 ? uops_10_flush_on_commit : _GEN_3047; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3049 = 4'hb == value_1 ? uops_11_flush_on_commit : _GEN_3048; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3050 = 4'hc == value_1 ? uops_12_flush_on_commit : _GEN_3049; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3051 = 4'hd == value_1 ? uops_13_flush_on_commit : _GEN_3050; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3052 = 4'he == value_1 ? uops_14_flush_on_commit : _GEN_3051; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3055 = 4'h1 == value_1 ? uops_1_is_unique : uops_0_is_unique; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3056 = 4'h2 == value_1 ? uops_2_is_unique : _GEN_3055; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3057 = 4'h3 == value_1 ? uops_3_is_unique : _GEN_3056; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3058 = 4'h4 == value_1 ? uops_4_is_unique : _GEN_3057; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3059 = 4'h5 == value_1 ? uops_5_is_unique : _GEN_3058; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3060 = 4'h6 == value_1 ? uops_6_is_unique : _GEN_3059; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3061 = 4'h7 == value_1 ? uops_7_is_unique : _GEN_3060; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3062 = 4'h8 == value_1 ? uops_8_is_unique : _GEN_3061; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3063 = 4'h9 == value_1 ? uops_9_is_unique : _GEN_3062; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3064 = 4'ha == value_1 ? uops_10_is_unique : _GEN_3063; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3065 = 4'hb == value_1 ? uops_11_is_unique : _GEN_3064; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3066 = 4'hc == value_1 ? uops_12_is_unique : _GEN_3065; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3067 = 4'hd == value_1 ? uops_13_is_unique : _GEN_3066; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3068 = 4'he == value_1 ? uops_14_is_unique : _GEN_3067; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3071 = 4'h1 == value_1 ? uops_1_is_sys_pc2epc : uops_0_is_sys_pc2epc; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3072 = 4'h2 == value_1 ? uops_2_is_sys_pc2epc : _GEN_3071; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3073 = 4'h3 == value_1 ? uops_3_is_sys_pc2epc : _GEN_3072; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3074 = 4'h4 == value_1 ? uops_4_is_sys_pc2epc : _GEN_3073; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3075 = 4'h5 == value_1 ? uops_5_is_sys_pc2epc : _GEN_3074; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3076 = 4'h6 == value_1 ? uops_6_is_sys_pc2epc : _GEN_3075; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3077 = 4'h7 == value_1 ? uops_7_is_sys_pc2epc : _GEN_3076; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3078 = 4'h8 == value_1 ? uops_8_is_sys_pc2epc : _GEN_3077; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3079 = 4'h9 == value_1 ? uops_9_is_sys_pc2epc : _GEN_3078; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3080 = 4'ha == value_1 ? uops_10_is_sys_pc2epc : _GEN_3079; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3081 = 4'hb == value_1 ? uops_11_is_sys_pc2epc : _GEN_3080; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3082 = 4'hc == value_1 ? uops_12_is_sys_pc2epc : _GEN_3081; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3083 = 4'hd == value_1 ? uops_13_is_sys_pc2epc : _GEN_3082; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3084 = 4'he == value_1 ? uops_14_is_sys_pc2epc : _GEN_3083; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3087 = 4'h1 == value_1 ? uops_1_uses_stq : uops_0_uses_stq; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3088 = 4'h2 == value_1 ? uops_2_uses_stq : _GEN_3087; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3089 = 4'h3 == value_1 ? uops_3_uses_stq : _GEN_3088; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3090 = 4'h4 == value_1 ? uops_4_uses_stq : _GEN_3089; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3091 = 4'h5 == value_1 ? uops_5_uses_stq : _GEN_3090; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3092 = 4'h6 == value_1 ? uops_6_uses_stq : _GEN_3091; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3093 = 4'h7 == value_1 ? uops_7_uses_stq : _GEN_3092; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3094 = 4'h8 == value_1 ? uops_8_uses_stq : _GEN_3093; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3095 = 4'h9 == value_1 ? uops_9_uses_stq : _GEN_3094; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3096 = 4'ha == value_1 ? uops_10_uses_stq : _GEN_3095; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3097 = 4'hb == value_1 ? uops_11_uses_stq : _GEN_3096; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3098 = 4'hc == value_1 ? uops_12_uses_stq : _GEN_3097; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3099 = 4'hd == value_1 ? uops_13_uses_stq : _GEN_3098; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3100 = 4'he == value_1 ? uops_14_uses_stq : _GEN_3099; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3103 = 4'h1 == value_1 ? uops_1_uses_ldq : uops_0_uses_ldq; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3104 = 4'h2 == value_1 ? uops_2_uses_ldq : _GEN_3103; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3105 = 4'h3 == value_1 ? uops_3_uses_ldq : _GEN_3104; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3106 = 4'h4 == value_1 ? uops_4_uses_ldq : _GEN_3105; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3107 = 4'h5 == value_1 ? uops_5_uses_ldq : _GEN_3106; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3108 = 4'h6 == value_1 ? uops_6_uses_ldq : _GEN_3107; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3109 = 4'h7 == value_1 ? uops_7_uses_ldq : _GEN_3108; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3110 = 4'h8 == value_1 ? uops_8_uses_ldq : _GEN_3109; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3111 = 4'h9 == value_1 ? uops_9_uses_ldq : _GEN_3110; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3112 = 4'ha == value_1 ? uops_10_uses_ldq : _GEN_3111; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3113 = 4'hb == value_1 ? uops_11_uses_ldq : _GEN_3112; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3114 = 4'hc == value_1 ? uops_12_uses_ldq : _GEN_3113; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3115 = 4'hd == value_1 ? uops_13_uses_ldq : _GEN_3114; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3116 = 4'he == value_1 ? uops_14_uses_ldq : _GEN_3115; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_uses_ldq = 4'hf == value_1 ? uops_15_uses_ldq : _GEN_3116; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3119 = 4'h1 == value_1 ? uops_1_is_amo : uops_0_is_amo; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3120 = 4'h2 == value_1 ? uops_2_is_amo : _GEN_3119; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3121 = 4'h3 == value_1 ? uops_3_is_amo : _GEN_3120; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3122 = 4'h4 == value_1 ? uops_4_is_amo : _GEN_3121; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3123 = 4'h5 == value_1 ? uops_5_is_amo : _GEN_3122; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3124 = 4'h6 == value_1 ? uops_6_is_amo : _GEN_3123; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3125 = 4'h7 == value_1 ? uops_7_is_amo : _GEN_3124; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3126 = 4'h8 == value_1 ? uops_8_is_amo : _GEN_3125; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3127 = 4'h9 == value_1 ? uops_9_is_amo : _GEN_3126; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3128 = 4'ha == value_1 ? uops_10_is_amo : _GEN_3127; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3129 = 4'hb == value_1 ? uops_11_is_amo : _GEN_3128; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3130 = 4'hc == value_1 ? uops_12_is_amo : _GEN_3129; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3131 = 4'hd == value_1 ? uops_13_is_amo : _GEN_3130; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3132 = 4'he == value_1 ? uops_14_is_amo : _GEN_3131; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3135 = 4'h1 == value_1 ? uops_1_is_fencei : uops_0_is_fencei; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3136 = 4'h2 == value_1 ? uops_2_is_fencei : _GEN_3135; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3137 = 4'h3 == value_1 ? uops_3_is_fencei : _GEN_3136; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3138 = 4'h4 == value_1 ? uops_4_is_fencei : _GEN_3137; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3139 = 4'h5 == value_1 ? uops_5_is_fencei : _GEN_3138; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3140 = 4'h6 == value_1 ? uops_6_is_fencei : _GEN_3139; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3141 = 4'h7 == value_1 ? uops_7_is_fencei : _GEN_3140; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3142 = 4'h8 == value_1 ? uops_8_is_fencei : _GEN_3141; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3143 = 4'h9 == value_1 ? uops_9_is_fencei : _GEN_3142; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3144 = 4'ha == value_1 ? uops_10_is_fencei : _GEN_3143; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3145 = 4'hb == value_1 ? uops_11_is_fencei : _GEN_3144; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3146 = 4'hc == value_1 ? uops_12_is_fencei : _GEN_3145; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3147 = 4'hd == value_1 ? uops_13_is_fencei : _GEN_3146; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3148 = 4'he == value_1 ? uops_14_is_fencei : _GEN_3147; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3151 = 4'h1 == value_1 ? uops_1_is_fence : uops_0_is_fence; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3152 = 4'h2 == value_1 ? uops_2_is_fence : _GEN_3151; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3153 = 4'h3 == value_1 ? uops_3_is_fence : _GEN_3152; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3154 = 4'h4 == value_1 ? uops_4_is_fence : _GEN_3153; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3155 = 4'h5 == value_1 ? uops_5_is_fence : _GEN_3154; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3156 = 4'h6 == value_1 ? uops_6_is_fence : _GEN_3155; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3157 = 4'h7 == value_1 ? uops_7_is_fence : _GEN_3156; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3158 = 4'h8 == value_1 ? uops_8_is_fence : _GEN_3157; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3159 = 4'h9 == value_1 ? uops_9_is_fence : _GEN_3158; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3160 = 4'ha == value_1 ? uops_10_is_fence : _GEN_3159; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3161 = 4'hb == value_1 ? uops_11_is_fence : _GEN_3160; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3162 = 4'hc == value_1 ? uops_12_is_fence : _GEN_3161; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3163 = 4'hd == value_1 ? uops_13_is_fence : _GEN_3162; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3164 = 4'he == value_1 ? uops_14_is_fence : _GEN_3163; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3167 = 4'h1 == value_1 ? uops_1_mem_signed : uops_0_mem_signed; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3168 = 4'h2 == value_1 ? uops_2_mem_signed : _GEN_3167; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3169 = 4'h3 == value_1 ? uops_3_mem_signed : _GEN_3168; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3170 = 4'h4 == value_1 ? uops_4_mem_signed : _GEN_3169; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3171 = 4'h5 == value_1 ? uops_5_mem_signed : _GEN_3170; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3172 = 4'h6 == value_1 ? uops_6_mem_signed : _GEN_3171; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3173 = 4'h7 == value_1 ? uops_7_mem_signed : _GEN_3172; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3174 = 4'h8 == value_1 ? uops_8_mem_signed : _GEN_3173; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3175 = 4'h9 == value_1 ? uops_9_mem_signed : _GEN_3174; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3176 = 4'ha == value_1 ? uops_10_mem_signed : _GEN_3175; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3177 = 4'hb == value_1 ? uops_11_mem_signed : _GEN_3176; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3178 = 4'hc == value_1 ? uops_12_mem_signed : _GEN_3177; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3179 = 4'hd == value_1 ? uops_13_mem_signed : _GEN_3178; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3180 = 4'he == value_1 ? uops_14_mem_signed : _GEN_3179; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3183 = 4'h1 == value_1 ? uops_1_mem_size : uops_0_mem_size; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3184 = 4'h2 == value_1 ? uops_2_mem_size : _GEN_3183; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3185 = 4'h3 == value_1 ? uops_3_mem_size : _GEN_3184; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3186 = 4'h4 == value_1 ? uops_4_mem_size : _GEN_3185; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3187 = 4'h5 == value_1 ? uops_5_mem_size : _GEN_3186; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3188 = 4'h6 == value_1 ? uops_6_mem_size : _GEN_3187; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3189 = 4'h7 == value_1 ? uops_7_mem_size : _GEN_3188; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3190 = 4'h8 == value_1 ? uops_8_mem_size : _GEN_3189; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3191 = 4'h9 == value_1 ? uops_9_mem_size : _GEN_3190; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3192 = 4'ha == value_1 ? uops_10_mem_size : _GEN_3191; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3193 = 4'hb == value_1 ? uops_11_mem_size : _GEN_3192; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3194 = 4'hc == value_1 ? uops_12_mem_size : _GEN_3193; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3195 = 4'hd == value_1 ? uops_13_mem_size : _GEN_3194; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3196 = 4'he == value_1 ? uops_14_mem_size : _GEN_3195; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3199 = 4'h1 == value_1 ? uops_1_mem_cmd : uops_0_mem_cmd; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3200 = 4'h2 == value_1 ? uops_2_mem_cmd : _GEN_3199; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3201 = 4'h3 == value_1 ? uops_3_mem_cmd : _GEN_3200; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3202 = 4'h4 == value_1 ? uops_4_mem_cmd : _GEN_3201; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3203 = 4'h5 == value_1 ? uops_5_mem_cmd : _GEN_3202; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3204 = 4'h6 == value_1 ? uops_6_mem_cmd : _GEN_3203; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3205 = 4'h7 == value_1 ? uops_7_mem_cmd : _GEN_3204; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3206 = 4'h8 == value_1 ? uops_8_mem_cmd : _GEN_3205; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3207 = 4'h9 == value_1 ? uops_9_mem_cmd : _GEN_3206; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3208 = 4'ha == value_1 ? uops_10_mem_cmd : _GEN_3207; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3209 = 4'hb == value_1 ? uops_11_mem_cmd : _GEN_3208; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3210 = 4'hc == value_1 ? uops_12_mem_cmd : _GEN_3209; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3211 = 4'hd == value_1 ? uops_13_mem_cmd : _GEN_3210; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3212 = 4'he == value_1 ? uops_14_mem_cmd : _GEN_3211; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3215 = 4'h1 == value_1 ? uops_1_bypassable : uops_0_bypassable; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3216 = 4'h2 == value_1 ? uops_2_bypassable : _GEN_3215; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3217 = 4'h3 == value_1 ? uops_3_bypassable : _GEN_3216; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3218 = 4'h4 == value_1 ? uops_4_bypassable : _GEN_3217; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3219 = 4'h5 == value_1 ? uops_5_bypassable : _GEN_3218; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3220 = 4'h6 == value_1 ? uops_6_bypassable : _GEN_3219; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3221 = 4'h7 == value_1 ? uops_7_bypassable : _GEN_3220; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3222 = 4'h8 == value_1 ? uops_8_bypassable : _GEN_3221; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3223 = 4'h9 == value_1 ? uops_9_bypassable : _GEN_3222; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3224 = 4'ha == value_1 ? uops_10_bypassable : _GEN_3223; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3225 = 4'hb == value_1 ? uops_11_bypassable : _GEN_3224; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3226 = 4'hc == value_1 ? uops_12_bypassable : _GEN_3225; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3227 = 4'hd == value_1 ? uops_13_bypassable : _GEN_3226; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3228 = 4'he == value_1 ? uops_14_bypassable : _GEN_3227; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3231 = 4'h1 == value_1 ? uops_1_exc_cause : uops_0_exc_cause; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3232 = 4'h2 == value_1 ? uops_2_exc_cause : _GEN_3231; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3233 = 4'h3 == value_1 ? uops_3_exc_cause : _GEN_3232; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3234 = 4'h4 == value_1 ? uops_4_exc_cause : _GEN_3233; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3235 = 4'h5 == value_1 ? uops_5_exc_cause : _GEN_3234; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3236 = 4'h6 == value_1 ? uops_6_exc_cause : _GEN_3235; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3237 = 4'h7 == value_1 ? uops_7_exc_cause : _GEN_3236; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3238 = 4'h8 == value_1 ? uops_8_exc_cause : _GEN_3237; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3239 = 4'h9 == value_1 ? uops_9_exc_cause : _GEN_3238; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3240 = 4'ha == value_1 ? uops_10_exc_cause : _GEN_3239; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3241 = 4'hb == value_1 ? uops_11_exc_cause : _GEN_3240; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3242 = 4'hc == value_1 ? uops_12_exc_cause : _GEN_3241; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3243 = 4'hd == value_1 ? uops_13_exc_cause : _GEN_3242; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_3244 = 4'he == value_1 ? uops_14_exc_cause : _GEN_3243; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3247 = 4'h1 == value_1 ? uops_1_exception : uops_0_exception; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3248 = 4'h2 == value_1 ? uops_2_exception : _GEN_3247; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3249 = 4'h3 == value_1 ? uops_3_exception : _GEN_3248; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3250 = 4'h4 == value_1 ? uops_4_exception : _GEN_3249; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3251 = 4'h5 == value_1 ? uops_5_exception : _GEN_3250; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3252 = 4'h6 == value_1 ? uops_6_exception : _GEN_3251; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3253 = 4'h7 == value_1 ? uops_7_exception : _GEN_3252; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3254 = 4'h8 == value_1 ? uops_8_exception : _GEN_3253; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3255 = 4'h9 == value_1 ? uops_9_exception : _GEN_3254; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3256 = 4'ha == value_1 ? uops_10_exception : _GEN_3255; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3257 = 4'hb == value_1 ? uops_11_exception : _GEN_3256; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3258 = 4'hc == value_1 ? uops_12_exception : _GEN_3257; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3259 = 4'hd == value_1 ? uops_13_exception : _GEN_3258; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3260 = 4'he == value_1 ? uops_14_exception : _GEN_3259; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3263 = 4'h1 == value_1 ? uops_1_stale_pdst : uops_0_stale_pdst; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3264 = 4'h2 == value_1 ? uops_2_stale_pdst : _GEN_3263; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3265 = 4'h3 == value_1 ? uops_3_stale_pdst : _GEN_3264; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3266 = 4'h4 == value_1 ? uops_4_stale_pdst : _GEN_3265; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3267 = 4'h5 == value_1 ? uops_5_stale_pdst : _GEN_3266; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3268 = 4'h6 == value_1 ? uops_6_stale_pdst : _GEN_3267; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3269 = 4'h7 == value_1 ? uops_7_stale_pdst : _GEN_3268; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3270 = 4'h8 == value_1 ? uops_8_stale_pdst : _GEN_3269; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3271 = 4'h9 == value_1 ? uops_9_stale_pdst : _GEN_3270; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3272 = 4'ha == value_1 ? uops_10_stale_pdst : _GEN_3271; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3273 = 4'hb == value_1 ? uops_11_stale_pdst : _GEN_3272; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3274 = 4'hc == value_1 ? uops_12_stale_pdst : _GEN_3273; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3275 = 4'hd == value_1 ? uops_13_stale_pdst : _GEN_3274; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3276 = 4'he == value_1 ? uops_14_stale_pdst : _GEN_3275; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3279 = 4'h1 == value_1 ? uops_1_ppred_busy : uops_0_ppred_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3280 = 4'h2 == value_1 ? uops_2_ppred_busy : _GEN_3279; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3281 = 4'h3 == value_1 ? uops_3_ppred_busy : _GEN_3280; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3282 = 4'h4 == value_1 ? uops_4_ppred_busy : _GEN_3281; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3283 = 4'h5 == value_1 ? uops_5_ppred_busy : _GEN_3282; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3284 = 4'h6 == value_1 ? uops_6_ppred_busy : _GEN_3283; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3285 = 4'h7 == value_1 ? uops_7_ppred_busy : _GEN_3284; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3286 = 4'h8 == value_1 ? uops_8_ppred_busy : _GEN_3285; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3287 = 4'h9 == value_1 ? uops_9_ppred_busy : _GEN_3286; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3288 = 4'ha == value_1 ? uops_10_ppred_busy : _GEN_3287; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3289 = 4'hb == value_1 ? uops_11_ppred_busy : _GEN_3288; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3290 = 4'hc == value_1 ? uops_12_ppred_busy : _GEN_3289; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3291 = 4'hd == value_1 ? uops_13_ppred_busy : _GEN_3290; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3292 = 4'he == value_1 ? uops_14_ppred_busy : _GEN_3291; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3295 = 4'h1 == value_1 ? uops_1_prs3_busy : uops_0_prs3_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3296 = 4'h2 == value_1 ? uops_2_prs3_busy : _GEN_3295; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3297 = 4'h3 == value_1 ? uops_3_prs3_busy : _GEN_3296; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3298 = 4'h4 == value_1 ? uops_4_prs3_busy : _GEN_3297; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3299 = 4'h5 == value_1 ? uops_5_prs3_busy : _GEN_3298; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3300 = 4'h6 == value_1 ? uops_6_prs3_busy : _GEN_3299; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3301 = 4'h7 == value_1 ? uops_7_prs3_busy : _GEN_3300; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3302 = 4'h8 == value_1 ? uops_8_prs3_busy : _GEN_3301; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3303 = 4'h9 == value_1 ? uops_9_prs3_busy : _GEN_3302; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3304 = 4'ha == value_1 ? uops_10_prs3_busy : _GEN_3303; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3305 = 4'hb == value_1 ? uops_11_prs3_busy : _GEN_3304; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3306 = 4'hc == value_1 ? uops_12_prs3_busy : _GEN_3305; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3307 = 4'hd == value_1 ? uops_13_prs3_busy : _GEN_3306; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3308 = 4'he == value_1 ? uops_14_prs3_busy : _GEN_3307; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3311 = 4'h1 == value_1 ? uops_1_prs2_busy : uops_0_prs2_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3312 = 4'h2 == value_1 ? uops_2_prs2_busy : _GEN_3311; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3313 = 4'h3 == value_1 ? uops_3_prs2_busy : _GEN_3312; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3314 = 4'h4 == value_1 ? uops_4_prs2_busy : _GEN_3313; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3315 = 4'h5 == value_1 ? uops_5_prs2_busy : _GEN_3314; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3316 = 4'h6 == value_1 ? uops_6_prs2_busy : _GEN_3315; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3317 = 4'h7 == value_1 ? uops_7_prs2_busy : _GEN_3316; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3318 = 4'h8 == value_1 ? uops_8_prs2_busy : _GEN_3317; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3319 = 4'h9 == value_1 ? uops_9_prs2_busy : _GEN_3318; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3320 = 4'ha == value_1 ? uops_10_prs2_busy : _GEN_3319; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3321 = 4'hb == value_1 ? uops_11_prs2_busy : _GEN_3320; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3322 = 4'hc == value_1 ? uops_12_prs2_busy : _GEN_3321; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3323 = 4'hd == value_1 ? uops_13_prs2_busy : _GEN_3322; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3324 = 4'he == value_1 ? uops_14_prs2_busy : _GEN_3323; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3327 = 4'h1 == value_1 ? uops_1_prs1_busy : uops_0_prs1_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3328 = 4'h2 == value_1 ? uops_2_prs1_busy : _GEN_3327; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3329 = 4'h3 == value_1 ? uops_3_prs1_busy : _GEN_3328; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3330 = 4'h4 == value_1 ? uops_4_prs1_busy : _GEN_3329; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3331 = 4'h5 == value_1 ? uops_5_prs1_busy : _GEN_3330; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3332 = 4'h6 == value_1 ? uops_6_prs1_busy : _GEN_3331; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3333 = 4'h7 == value_1 ? uops_7_prs1_busy : _GEN_3332; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3334 = 4'h8 == value_1 ? uops_8_prs1_busy : _GEN_3333; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3335 = 4'h9 == value_1 ? uops_9_prs1_busy : _GEN_3334; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3336 = 4'ha == value_1 ? uops_10_prs1_busy : _GEN_3335; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3337 = 4'hb == value_1 ? uops_11_prs1_busy : _GEN_3336; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3338 = 4'hc == value_1 ? uops_12_prs1_busy : _GEN_3337; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3339 = 4'hd == value_1 ? uops_13_prs1_busy : _GEN_3338; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3340 = 4'he == value_1 ? uops_14_prs1_busy : _GEN_3339; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3343 = 4'h1 == value_1 ? uops_1_ppred : uops_0_ppred; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3344 = 4'h2 == value_1 ? uops_2_ppred : _GEN_3343; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3345 = 4'h3 == value_1 ? uops_3_ppred : _GEN_3344; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3346 = 4'h4 == value_1 ? uops_4_ppred : _GEN_3345; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3347 = 4'h5 == value_1 ? uops_5_ppred : _GEN_3346; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3348 = 4'h6 == value_1 ? uops_6_ppred : _GEN_3347; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3349 = 4'h7 == value_1 ? uops_7_ppred : _GEN_3348; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3350 = 4'h8 == value_1 ? uops_8_ppred : _GEN_3349; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3351 = 4'h9 == value_1 ? uops_9_ppred : _GEN_3350; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3352 = 4'ha == value_1 ? uops_10_ppred : _GEN_3351; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3353 = 4'hb == value_1 ? uops_11_ppred : _GEN_3352; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3354 = 4'hc == value_1 ? uops_12_ppred : _GEN_3353; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3355 = 4'hd == value_1 ? uops_13_ppred : _GEN_3354; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3356 = 4'he == value_1 ? uops_14_ppred : _GEN_3355; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3359 = 4'h1 == value_1 ? uops_1_prs3 : uops_0_prs3; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3360 = 4'h2 == value_1 ? uops_2_prs3 : _GEN_3359; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3361 = 4'h3 == value_1 ? uops_3_prs3 : _GEN_3360; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3362 = 4'h4 == value_1 ? uops_4_prs3 : _GEN_3361; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3363 = 4'h5 == value_1 ? uops_5_prs3 : _GEN_3362; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3364 = 4'h6 == value_1 ? uops_6_prs3 : _GEN_3363; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3365 = 4'h7 == value_1 ? uops_7_prs3 : _GEN_3364; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3366 = 4'h8 == value_1 ? uops_8_prs3 : _GEN_3365; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3367 = 4'h9 == value_1 ? uops_9_prs3 : _GEN_3366; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3368 = 4'ha == value_1 ? uops_10_prs3 : _GEN_3367; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3369 = 4'hb == value_1 ? uops_11_prs3 : _GEN_3368; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3370 = 4'hc == value_1 ? uops_12_prs3 : _GEN_3369; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3371 = 4'hd == value_1 ? uops_13_prs3 : _GEN_3370; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3372 = 4'he == value_1 ? uops_14_prs3 : _GEN_3371; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3375 = 4'h1 == value_1 ? uops_1_prs2 : uops_0_prs2; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3376 = 4'h2 == value_1 ? uops_2_prs2 : _GEN_3375; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3377 = 4'h3 == value_1 ? uops_3_prs2 : _GEN_3376; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3378 = 4'h4 == value_1 ? uops_4_prs2 : _GEN_3377; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3379 = 4'h5 == value_1 ? uops_5_prs2 : _GEN_3378; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3380 = 4'h6 == value_1 ? uops_6_prs2 : _GEN_3379; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3381 = 4'h7 == value_1 ? uops_7_prs2 : _GEN_3380; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3382 = 4'h8 == value_1 ? uops_8_prs2 : _GEN_3381; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3383 = 4'h9 == value_1 ? uops_9_prs2 : _GEN_3382; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3384 = 4'ha == value_1 ? uops_10_prs2 : _GEN_3383; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3385 = 4'hb == value_1 ? uops_11_prs2 : _GEN_3384; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3386 = 4'hc == value_1 ? uops_12_prs2 : _GEN_3385; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3387 = 4'hd == value_1 ? uops_13_prs2 : _GEN_3386; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3388 = 4'he == value_1 ? uops_14_prs2 : _GEN_3387; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3391 = 4'h1 == value_1 ? uops_1_prs1 : uops_0_prs1; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3392 = 4'h2 == value_1 ? uops_2_prs1 : _GEN_3391; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3393 = 4'h3 == value_1 ? uops_3_prs1 : _GEN_3392; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3394 = 4'h4 == value_1 ? uops_4_prs1 : _GEN_3393; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3395 = 4'h5 == value_1 ? uops_5_prs1 : _GEN_3394; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3396 = 4'h6 == value_1 ? uops_6_prs1 : _GEN_3395; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3397 = 4'h7 == value_1 ? uops_7_prs1 : _GEN_3396; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3398 = 4'h8 == value_1 ? uops_8_prs1 : _GEN_3397; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3399 = 4'h9 == value_1 ? uops_9_prs1 : _GEN_3398; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3400 = 4'ha == value_1 ? uops_10_prs1 : _GEN_3399; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3401 = 4'hb == value_1 ? uops_11_prs1 : _GEN_3400; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3402 = 4'hc == value_1 ? uops_12_prs1 : _GEN_3401; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3403 = 4'hd == value_1 ? uops_13_prs1 : _GEN_3402; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3404 = 4'he == value_1 ? uops_14_prs1 : _GEN_3403; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3407 = 4'h1 == value_1 ? uops_1_pdst : uops_0_pdst; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3408 = 4'h2 == value_1 ? uops_2_pdst : _GEN_3407; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3409 = 4'h3 == value_1 ? uops_3_pdst : _GEN_3408; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3410 = 4'h4 == value_1 ? uops_4_pdst : _GEN_3409; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3411 = 4'h5 == value_1 ? uops_5_pdst : _GEN_3410; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3412 = 4'h6 == value_1 ? uops_6_pdst : _GEN_3411; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3413 = 4'h7 == value_1 ? uops_7_pdst : _GEN_3412; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3414 = 4'h8 == value_1 ? uops_8_pdst : _GEN_3413; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3415 = 4'h9 == value_1 ? uops_9_pdst : _GEN_3414; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3416 = 4'ha == value_1 ? uops_10_pdst : _GEN_3415; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3417 = 4'hb == value_1 ? uops_11_pdst : _GEN_3416; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3418 = 4'hc == value_1 ? uops_12_pdst : _GEN_3417; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3419 = 4'hd == value_1 ? uops_13_pdst : _GEN_3418; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3420 = 4'he == value_1 ? uops_14_pdst : _GEN_3419; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3423 = 4'h1 == value_1 ? uops_1_rxq_idx : uops_0_rxq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3424 = 4'h2 == value_1 ? uops_2_rxq_idx : _GEN_3423; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3425 = 4'h3 == value_1 ? uops_3_rxq_idx : _GEN_3424; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3426 = 4'h4 == value_1 ? uops_4_rxq_idx : _GEN_3425; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3427 = 4'h5 == value_1 ? uops_5_rxq_idx : _GEN_3426; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3428 = 4'h6 == value_1 ? uops_6_rxq_idx : _GEN_3427; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3429 = 4'h7 == value_1 ? uops_7_rxq_idx : _GEN_3428; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3430 = 4'h8 == value_1 ? uops_8_rxq_idx : _GEN_3429; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3431 = 4'h9 == value_1 ? uops_9_rxq_idx : _GEN_3430; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3432 = 4'ha == value_1 ? uops_10_rxq_idx : _GEN_3431; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3433 = 4'hb == value_1 ? uops_11_rxq_idx : _GEN_3432; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3434 = 4'hc == value_1 ? uops_12_rxq_idx : _GEN_3433; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3435 = 4'hd == value_1 ? uops_13_rxq_idx : _GEN_3434; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3436 = 4'he == value_1 ? uops_14_rxq_idx : _GEN_3435; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3439 = 4'h1 == value_1 ? uops_1_stq_idx : uops_0_stq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3440 = 4'h2 == value_1 ? uops_2_stq_idx : _GEN_3439; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3441 = 4'h3 == value_1 ? uops_3_stq_idx : _GEN_3440; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3442 = 4'h4 == value_1 ? uops_4_stq_idx : _GEN_3441; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3443 = 4'h5 == value_1 ? uops_5_stq_idx : _GEN_3442; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3444 = 4'h6 == value_1 ? uops_6_stq_idx : _GEN_3443; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3445 = 4'h7 == value_1 ? uops_7_stq_idx : _GEN_3444; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3446 = 4'h8 == value_1 ? uops_8_stq_idx : _GEN_3445; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3447 = 4'h9 == value_1 ? uops_9_stq_idx : _GEN_3446; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3448 = 4'ha == value_1 ? uops_10_stq_idx : _GEN_3447; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3449 = 4'hb == value_1 ? uops_11_stq_idx : _GEN_3448; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3450 = 4'hc == value_1 ? uops_12_stq_idx : _GEN_3449; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3451 = 4'hd == value_1 ? uops_13_stq_idx : _GEN_3450; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3452 = 4'he == value_1 ? uops_14_stq_idx : _GEN_3451; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3455 = 4'h1 == value_1 ? uops_1_ldq_idx : uops_0_ldq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3456 = 4'h2 == value_1 ? uops_2_ldq_idx : _GEN_3455; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3457 = 4'h3 == value_1 ? uops_3_ldq_idx : _GEN_3456; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3458 = 4'h4 == value_1 ? uops_4_ldq_idx : _GEN_3457; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3459 = 4'h5 == value_1 ? uops_5_ldq_idx : _GEN_3458; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3460 = 4'h6 == value_1 ? uops_6_ldq_idx : _GEN_3459; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3461 = 4'h7 == value_1 ? uops_7_ldq_idx : _GEN_3460; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3462 = 4'h8 == value_1 ? uops_8_ldq_idx : _GEN_3461; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3463 = 4'h9 == value_1 ? uops_9_ldq_idx : _GEN_3462; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3464 = 4'ha == value_1 ? uops_10_ldq_idx : _GEN_3463; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3465 = 4'hb == value_1 ? uops_11_ldq_idx : _GEN_3464; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3466 = 4'hc == value_1 ? uops_12_ldq_idx : _GEN_3465; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3467 = 4'hd == value_1 ? uops_13_ldq_idx : _GEN_3466; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3468 = 4'he == value_1 ? uops_14_ldq_idx : _GEN_3467; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3471 = 4'h1 == value_1 ? uops_1_rob_idx : uops_0_rob_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3472 = 4'h2 == value_1 ? uops_2_rob_idx : _GEN_3471; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3473 = 4'h3 == value_1 ? uops_3_rob_idx : _GEN_3472; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3474 = 4'h4 == value_1 ? uops_4_rob_idx : _GEN_3473; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3475 = 4'h5 == value_1 ? uops_5_rob_idx : _GEN_3474; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3476 = 4'h6 == value_1 ? uops_6_rob_idx : _GEN_3475; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3477 = 4'h7 == value_1 ? uops_7_rob_idx : _GEN_3476; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3478 = 4'h8 == value_1 ? uops_8_rob_idx : _GEN_3477; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3479 = 4'h9 == value_1 ? uops_9_rob_idx : _GEN_3478; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3480 = 4'ha == value_1 ? uops_10_rob_idx : _GEN_3479; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3481 = 4'hb == value_1 ? uops_11_rob_idx : _GEN_3480; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3482 = 4'hc == value_1 ? uops_12_rob_idx : _GEN_3481; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3483 = 4'hd == value_1 ? uops_13_rob_idx : _GEN_3482; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3484 = 4'he == value_1 ? uops_14_rob_idx : _GEN_3483; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3487 = 4'h1 == value_1 ? uops_1_csr_addr : uops_0_csr_addr; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3488 = 4'h2 == value_1 ? uops_2_csr_addr : _GEN_3487; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3489 = 4'h3 == value_1 ? uops_3_csr_addr : _GEN_3488; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3490 = 4'h4 == value_1 ? uops_4_csr_addr : _GEN_3489; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3491 = 4'h5 == value_1 ? uops_5_csr_addr : _GEN_3490; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3492 = 4'h6 == value_1 ? uops_6_csr_addr : _GEN_3491; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3493 = 4'h7 == value_1 ? uops_7_csr_addr : _GEN_3492; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3494 = 4'h8 == value_1 ? uops_8_csr_addr : _GEN_3493; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3495 = 4'h9 == value_1 ? uops_9_csr_addr : _GEN_3494; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3496 = 4'ha == value_1 ? uops_10_csr_addr : _GEN_3495; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3497 = 4'hb == value_1 ? uops_11_csr_addr : _GEN_3496; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3498 = 4'hc == value_1 ? uops_12_csr_addr : _GEN_3497; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3499 = 4'hd == value_1 ? uops_13_csr_addr : _GEN_3498; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3500 = 4'he == value_1 ? uops_14_csr_addr : _GEN_3499; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3503 = 4'h1 == value_1 ? uops_1_imm_packed : uops_0_imm_packed; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3504 = 4'h2 == value_1 ? uops_2_imm_packed : _GEN_3503; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3505 = 4'h3 == value_1 ? uops_3_imm_packed : _GEN_3504; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3506 = 4'h4 == value_1 ? uops_4_imm_packed : _GEN_3505; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3507 = 4'h5 == value_1 ? uops_5_imm_packed : _GEN_3506; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3508 = 4'h6 == value_1 ? uops_6_imm_packed : _GEN_3507; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3509 = 4'h7 == value_1 ? uops_7_imm_packed : _GEN_3508; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3510 = 4'h8 == value_1 ? uops_8_imm_packed : _GEN_3509; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3511 = 4'h9 == value_1 ? uops_9_imm_packed : _GEN_3510; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3512 = 4'ha == value_1 ? uops_10_imm_packed : _GEN_3511; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3513 = 4'hb == value_1 ? uops_11_imm_packed : _GEN_3512; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3514 = 4'hc == value_1 ? uops_12_imm_packed : _GEN_3513; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3515 = 4'hd == value_1 ? uops_13_imm_packed : _GEN_3514; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_3516 = 4'he == value_1 ? uops_14_imm_packed : _GEN_3515; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3519 = 4'h1 == value_1 ? uops_1_taken : uops_0_taken; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3520 = 4'h2 == value_1 ? uops_2_taken : _GEN_3519; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3521 = 4'h3 == value_1 ? uops_3_taken : _GEN_3520; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3522 = 4'h4 == value_1 ? uops_4_taken : _GEN_3521; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3523 = 4'h5 == value_1 ? uops_5_taken : _GEN_3522; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3524 = 4'h6 == value_1 ? uops_6_taken : _GEN_3523; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3525 = 4'h7 == value_1 ? uops_7_taken : _GEN_3524; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3526 = 4'h8 == value_1 ? uops_8_taken : _GEN_3525; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3527 = 4'h9 == value_1 ? uops_9_taken : _GEN_3526; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3528 = 4'ha == value_1 ? uops_10_taken : _GEN_3527; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3529 = 4'hb == value_1 ? uops_11_taken : _GEN_3528; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3530 = 4'hc == value_1 ? uops_12_taken : _GEN_3529; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3531 = 4'hd == value_1 ? uops_13_taken : _GEN_3530; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3532 = 4'he == value_1 ? uops_14_taken : _GEN_3531; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3535 = 4'h1 == value_1 ? uops_1_pc_lob : uops_0_pc_lob; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3536 = 4'h2 == value_1 ? uops_2_pc_lob : _GEN_3535; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3537 = 4'h3 == value_1 ? uops_3_pc_lob : _GEN_3536; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3538 = 4'h4 == value_1 ? uops_4_pc_lob : _GEN_3537; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3539 = 4'h5 == value_1 ? uops_5_pc_lob : _GEN_3538; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3540 = 4'h6 == value_1 ? uops_6_pc_lob : _GEN_3539; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3541 = 4'h7 == value_1 ? uops_7_pc_lob : _GEN_3540; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3542 = 4'h8 == value_1 ? uops_8_pc_lob : _GEN_3541; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3543 = 4'h9 == value_1 ? uops_9_pc_lob : _GEN_3542; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3544 = 4'ha == value_1 ? uops_10_pc_lob : _GEN_3543; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3545 = 4'hb == value_1 ? uops_11_pc_lob : _GEN_3544; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3546 = 4'hc == value_1 ? uops_12_pc_lob : _GEN_3545; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3547 = 4'hd == value_1 ? uops_13_pc_lob : _GEN_3546; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_3548 = 4'he == value_1 ? uops_14_pc_lob : _GEN_3547; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3551 = 4'h1 == value_1 ? uops_1_edge_inst : uops_0_edge_inst; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3552 = 4'h2 == value_1 ? uops_2_edge_inst : _GEN_3551; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3553 = 4'h3 == value_1 ? uops_3_edge_inst : _GEN_3552; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3554 = 4'h4 == value_1 ? uops_4_edge_inst : _GEN_3553; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3555 = 4'h5 == value_1 ? uops_5_edge_inst : _GEN_3554; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3556 = 4'h6 == value_1 ? uops_6_edge_inst : _GEN_3555; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3557 = 4'h7 == value_1 ? uops_7_edge_inst : _GEN_3556; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3558 = 4'h8 == value_1 ? uops_8_edge_inst : _GEN_3557; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3559 = 4'h9 == value_1 ? uops_9_edge_inst : _GEN_3558; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3560 = 4'ha == value_1 ? uops_10_edge_inst : _GEN_3559; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3561 = 4'hb == value_1 ? uops_11_edge_inst : _GEN_3560; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3562 = 4'hc == value_1 ? uops_12_edge_inst : _GEN_3561; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3563 = 4'hd == value_1 ? uops_13_edge_inst : _GEN_3562; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3564 = 4'he == value_1 ? uops_14_edge_inst : _GEN_3563; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3567 = 4'h1 == value_1 ? uops_1_ftq_idx : uops_0_ftq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3568 = 4'h2 == value_1 ? uops_2_ftq_idx : _GEN_3567; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3569 = 4'h3 == value_1 ? uops_3_ftq_idx : _GEN_3568; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3570 = 4'h4 == value_1 ? uops_4_ftq_idx : _GEN_3569; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3571 = 4'h5 == value_1 ? uops_5_ftq_idx : _GEN_3570; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3572 = 4'h6 == value_1 ? uops_6_ftq_idx : _GEN_3571; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3573 = 4'h7 == value_1 ? uops_7_ftq_idx : _GEN_3572; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3574 = 4'h8 == value_1 ? uops_8_ftq_idx : _GEN_3573; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3575 = 4'h9 == value_1 ? uops_9_ftq_idx : _GEN_3574; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3576 = 4'ha == value_1 ? uops_10_ftq_idx : _GEN_3575; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3577 = 4'hb == value_1 ? uops_11_ftq_idx : _GEN_3576; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3578 = 4'hc == value_1 ? uops_12_ftq_idx : _GEN_3577; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3579 = 4'hd == value_1 ? uops_13_ftq_idx : _GEN_3578; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_3580 = 4'he == value_1 ? uops_14_ftq_idx : _GEN_3579; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3583 = 4'h1 == value_1 ? uops_1_br_tag : uops_0_br_tag; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3584 = 4'h2 == value_1 ? uops_2_br_tag : _GEN_3583; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3585 = 4'h3 == value_1 ? uops_3_br_tag : _GEN_3584; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3586 = 4'h4 == value_1 ? uops_4_br_tag : _GEN_3585; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3587 = 4'h5 == value_1 ? uops_5_br_tag : _GEN_3586; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3588 = 4'h6 == value_1 ? uops_6_br_tag : _GEN_3587; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3589 = 4'h7 == value_1 ? uops_7_br_tag : _GEN_3588; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3590 = 4'h8 == value_1 ? uops_8_br_tag : _GEN_3589; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3591 = 4'h9 == value_1 ? uops_9_br_tag : _GEN_3590; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3592 = 4'ha == value_1 ? uops_10_br_tag : _GEN_3591; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3593 = 4'hb == value_1 ? uops_11_br_tag : _GEN_3592; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3594 = 4'hc == value_1 ? uops_12_br_tag : _GEN_3593; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3595 = 4'hd == value_1 ? uops_13_br_tag : _GEN_3594; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3596 = 4'he == value_1 ? uops_14_br_tag : _GEN_3595; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3599 = 4'h1 == value_1 ? uops_1_br_mask : uops_0_br_mask; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3600 = 4'h2 == value_1 ? uops_2_br_mask : _GEN_3599; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3601 = 4'h3 == value_1 ? uops_3_br_mask : _GEN_3600; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3602 = 4'h4 == value_1 ? uops_4_br_mask : _GEN_3601; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3603 = 4'h5 == value_1 ? uops_5_br_mask : _GEN_3602; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3604 = 4'h6 == value_1 ? uops_6_br_mask : _GEN_3603; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3605 = 4'h7 == value_1 ? uops_7_br_mask : _GEN_3604; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3606 = 4'h8 == value_1 ? uops_8_br_mask : _GEN_3605; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3607 = 4'h9 == value_1 ? uops_9_br_mask : _GEN_3606; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3608 = 4'ha == value_1 ? uops_10_br_mask : _GEN_3607; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3609 = 4'hb == value_1 ? uops_11_br_mask : _GEN_3608; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3610 = 4'hc == value_1 ? uops_12_br_mask : _GEN_3609; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3611 = 4'hd == value_1 ? uops_13_br_mask : _GEN_3610; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_3612 = 4'he == value_1 ? uops_14_br_mask : _GEN_3611; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] out_uop_br_mask = 4'hf == value_1 ? uops_15_br_mask : _GEN_3612; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3615 = 4'h1 == value_1 ? uops_1_is_sfb : uops_0_is_sfb; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3616 = 4'h2 == value_1 ? uops_2_is_sfb : _GEN_3615; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3617 = 4'h3 == value_1 ? uops_3_is_sfb : _GEN_3616; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3618 = 4'h4 == value_1 ? uops_4_is_sfb : _GEN_3617; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3619 = 4'h5 == value_1 ? uops_5_is_sfb : _GEN_3618; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3620 = 4'h6 == value_1 ? uops_6_is_sfb : _GEN_3619; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3621 = 4'h7 == value_1 ? uops_7_is_sfb : _GEN_3620; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3622 = 4'h8 == value_1 ? uops_8_is_sfb : _GEN_3621; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3623 = 4'h9 == value_1 ? uops_9_is_sfb : _GEN_3622; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3624 = 4'ha == value_1 ? uops_10_is_sfb : _GEN_3623; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3625 = 4'hb == value_1 ? uops_11_is_sfb : _GEN_3624; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3626 = 4'hc == value_1 ? uops_12_is_sfb : _GEN_3625; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3627 = 4'hd == value_1 ? uops_13_is_sfb : _GEN_3626; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3628 = 4'he == value_1 ? uops_14_is_sfb : _GEN_3627; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3631 = 4'h1 == value_1 ? uops_1_is_jal : uops_0_is_jal; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3632 = 4'h2 == value_1 ? uops_2_is_jal : _GEN_3631; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3633 = 4'h3 == value_1 ? uops_3_is_jal : _GEN_3632; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3634 = 4'h4 == value_1 ? uops_4_is_jal : _GEN_3633; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3635 = 4'h5 == value_1 ? uops_5_is_jal : _GEN_3634; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3636 = 4'h6 == value_1 ? uops_6_is_jal : _GEN_3635; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3637 = 4'h7 == value_1 ? uops_7_is_jal : _GEN_3636; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3638 = 4'h8 == value_1 ? uops_8_is_jal : _GEN_3637; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3639 = 4'h9 == value_1 ? uops_9_is_jal : _GEN_3638; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3640 = 4'ha == value_1 ? uops_10_is_jal : _GEN_3639; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3641 = 4'hb == value_1 ? uops_11_is_jal : _GEN_3640; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3642 = 4'hc == value_1 ? uops_12_is_jal : _GEN_3641; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3643 = 4'hd == value_1 ? uops_13_is_jal : _GEN_3642; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3644 = 4'he == value_1 ? uops_14_is_jal : _GEN_3643; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3647 = 4'h1 == value_1 ? uops_1_is_jalr : uops_0_is_jalr; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3648 = 4'h2 == value_1 ? uops_2_is_jalr : _GEN_3647; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3649 = 4'h3 == value_1 ? uops_3_is_jalr : _GEN_3648; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3650 = 4'h4 == value_1 ? uops_4_is_jalr : _GEN_3649; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3651 = 4'h5 == value_1 ? uops_5_is_jalr : _GEN_3650; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3652 = 4'h6 == value_1 ? uops_6_is_jalr : _GEN_3651; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3653 = 4'h7 == value_1 ? uops_7_is_jalr : _GEN_3652; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3654 = 4'h8 == value_1 ? uops_8_is_jalr : _GEN_3653; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3655 = 4'h9 == value_1 ? uops_9_is_jalr : _GEN_3654; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3656 = 4'ha == value_1 ? uops_10_is_jalr : _GEN_3655; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3657 = 4'hb == value_1 ? uops_11_is_jalr : _GEN_3656; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3658 = 4'hc == value_1 ? uops_12_is_jalr : _GEN_3657; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3659 = 4'hd == value_1 ? uops_13_is_jalr : _GEN_3658; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3660 = 4'he == value_1 ? uops_14_is_jalr : _GEN_3659; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3663 = 4'h1 == value_1 ? uops_1_is_br : uops_0_is_br; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3664 = 4'h2 == value_1 ? uops_2_is_br : _GEN_3663; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3665 = 4'h3 == value_1 ? uops_3_is_br : _GEN_3664; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3666 = 4'h4 == value_1 ? uops_4_is_br : _GEN_3665; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3667 = 4'h5 == value_1 ? uops_5_is_br : _GEN_3666; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3668 = 4'h6 == value_1 ? uops_6_is_br : _GEN_3667; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3669 = 4'h7 == value_1 ? uops_7_is_br : _GEN_3668; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3670 = 4'h8 == value_1 ? uops_8_is_br : _GEN_3669; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3671 = 4'h9 == value_1 ? uops_9_is_br : _GEN_3670; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3672 = 4'ha == value_1 ? uops_10_is_br : _GEN_3671; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3673 = 4'hb == value_1 ? uops_11_is_br : _GEN_3672; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3674 = 4'hc == value_1 ? uops_12_is_br : _GEN_3673; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3675 = 4'hd == value_1 ? uops_13_is_br : _GEN_3674; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3676 = 4'he == value_1 ? uops_14_is_br : _GEN_3675; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3679 = 4'h1 == value_1 ? uops_1_iw_p2_poisoned : uops_0_iw_p2_poisoned; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3680 = 4'h2 == value_1 ? uops_2_iw_p2_poisoned : _GEN_3679; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3681 = 4'h3 == value_1 ? uops_3_iw_p2_poisoned : _GEN_3680; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3682 = 4'h4 == value_1 ? uops_4_iw_p2_poisoned : _GEN_3681; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3683 = 4'h5 == value_1 ? uops_5_iw_p2_poisoned : _GEN_3682; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3684 = 4'h6 == value_1 ? uops_6_iw_p2_poisoned : _GEN_3683; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3685 = 4'h7 == value_1 ? uops_7_iw_p2_poisoned : _GEN_3684; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3686 = 4'h8 == value_1 ? uops_8_iw_p2_poisoned : _GEN_3685; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3687 = 4'h9 == value_1 ? uops_9_iw_p2_poisoned : _GEN_3686; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3688 = 4'ha == value_1 ? uops_10_iw_p2_poisoned : _GEN_3687; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3689 = 4'hb == value_1 ? uops_11_iw_p2_poisoned : _GEN_3688; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3690 = 4'hc == value_1 ? uops_12_iw_p2_poisoned : _GEN_3689; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3691 = 4'hd == value_1 ? uops_13_iw_p2_poisoned : _GEN_3690; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3692 = 4'he == value_1 ? uops_14_iw_p2_poisoned : _GEN_3691; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3695 = 4'h1 == value_1 ? uops_1_iw_p1_poisoned : uops_0_iw_p1_poisoned; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3696 = 4'h2 == value_1 ? uops_2_iw_p1_poisoned : _GEN_3695; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3697 = 4'h3 == value_1 ? uops_3_iw_p1_poisoned : _GEN_3696; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3698 = 4'h4 == value_1 ? uops_4_iw_p1_poisoned : _GEN_3697; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3699 = 4'h5 == value_1 ? uops_5_iw_p1_poisoned : _GEN_3698; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3700 = 4'h6 == value_1 ? uops_6_iw_p1_poisoned : _GEN_3699; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3701 = 4'h7 == value_1 ? uops_7_iw_p1_poisoned : _GEN_3700; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3702 = 4'h8 == value_1 ? uops_8_iw_p1_poisoned : _GEN_3701; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3703 = 4'h9 == value_1 ? uops_9_iw_p1_poisoned : _GEN_3702; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3704 = 4'ha == value_1 ? uops_10_iw_p1_poisoned : _GEN_3703; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3705 = 4'hb == value_1 ? uops_11_iw_p1_poisoned : _GEN_3704; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3706 = 4'hc == value_1 ? uops_12_iw_p1_poisoned : _GEN_3705; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3707 = 4'hd == value_1 ? uops_13_iw_p1_poisoned : _GEN_3706; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3708 = 4'he == value_1 ? uops_14_iw_p1_poisoned : _GEN_3707; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3711 = 4'h1 == value_1 ? uops_1_iw_state : uops_0_iw_state; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3712 = 4'h2 == value_1 ? uops_2_iw_state : _GEN_3711; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3713 = 4'h3 == value_1 ? uops_3_iw_state : _GEN_3712; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3714 = 4'h4 == value_1 ? uops_4_iw_state : _GEN_3713; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3715 = 4'h5 == value_1 ? uops_5_iw_state : _GEN_3714; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3716 = 4'h6 == value_1 ? uops_6_iw_state : _GEN_3715; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3717 = 4'h7 == value_1 ? uops_7_iw_state : _GEN_3716; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3718 = 4'h8 == value_1 ? uops_8_iw_state : _GEN_3717; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3719 = 4'h9 == value_1 ? uops_9_iw_state : _GEN_3718; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3720 = 4'ha == value_1 ? uops_10_iw_state : _GEN_3719; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3721 = 4'hb == value_1 ? uops_11_iw_state : _GEN_3720; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3722 = 4'hc == value_1 ? uops_12_iw_state : _GEN_3721; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3723 = 4'hd == value_1 ? uops_13_iw_state : _GEN_3722; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3724 = 4'he == value_1 ? uops_14_iw_state : _GEN_3723; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3727 = 4'h1 == value_1 ? uops_1_ctrl_is_std : uops_0_ctrl_is_std; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3728 = 4'h2 == value_1 ? uops_2_ctrl_is_std : _GEN_3727; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3729 = 4'h3 == value_1 ? uops_3_ctrl_is_std : _GEN_3728; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3730 = 4'h4 == value_1 ? uops_4_ctrl_is_std : _GEN_3729; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3731 = 4'h5 == value_1 ? uops_5_ctrl_is_std : _GEN_3730; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3732 = 4'h6 == value_1 ? uops_6_ctrl_is_std : _GEN_3731; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3733 = 4'h7 == value_1 ? uops_7_ctrl_is_std : _GEN_3732; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3734 = 4'h8 == value_1 ? uops_8_ctrl_is_std : _GEN_3733; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3735 = 4'h9 == value_1 ? uops_9_ctrl_is_std : _GEN_3734; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3736 = 4'ha == value_1 ? uops_10_ctrl_is_std : _GEN_3735; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3737 = 4'hb == value_1 ? uops_11_ctrl_is_std : _GEN_3736; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3738 = 4'hc == value_1 ? uops_12_ctrl_is_std : _GEN_3737; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3739 = 4'hd == value_1 ? uops_13_ctrl_is_std : _GEN_3738; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3740 = 4'he == value_1 ? uops_14_ctrl_is_std : _GEN_3739; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3743 = 4'h1 == value_1 ? uops_1_ctrl_is_sta : uops_0_ctrl_is_sta; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3744 = 4'h2 == value_1 ? uops_2_ctrl_is_sta : _GEN_3743; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3745 = 4'h3 == value_1 ? uops_3_ctrl_is_sta : _GEN_3744; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3746 = 4'h4 == value_1 ? uops_4_ctrl_is_sta : _GEN_3745; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3747 = 4'h5 == value_1 ? uops_5_ctrl_is_sta : _GEN_3746; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3748 = 4'h6 == value_1 ? uops_6_ctrl_is_sta : _GEN_3747; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3749 = 4'h7 == value_1 ? uops_7_ctrl_is_sta : _GEN_3748; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3750 = 4'h8 == value_1 ? uops_8_ctrl_is_sta : _GEN_3749; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3751 = 4'h9 == value_1 ? uops_9_ctrl_is_sta : _GEN_3750; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3752 = 4'ha == value_1 ? uops_10_ctrl_is_sta : _GEN_3751; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3753 = 4'hb == value_1 ? uops_11_ctrl_is_sta : _GEN_3752; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3754 = 4'hc == value_1 ? uops_12_ctrl_is_sta : _GEN_3753; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3755 = 4'hd == value_1 ? uops_13_ctrl_is_sta : _GEN_3754; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3756 = 4'he == value_1 ? uops_14_ctrl_is_sta : _GEN_3755; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3759 = 4'h1 == value_1 ? uops_1_ctrl_is_load : uops_0_ctrl_is_load; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3760 = 4'h2 == value_1 ? uops_2_ctrl_is_load : _GEN_3759; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3761 = 4'h3 == value_1 ? uops_3_ctrl_is_load : _GEN_3760; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3762 = 4'h4 == value_1 ? uops_4_ctrl_is_load : _GEN_3761; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3763 = 4'h5 == value_1 ? uops_5_ctrl_is_load : _GEN_3762; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3764 = 4'h6 == value_1 ? uops_6_ctrl_is_load : _GEN_3763; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3765 = 4'h7 == value_1 ? uops_7_ctrl_is_load : _GEN_3764; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3766 = 4'h8 == value_1 ? uops_8_ctrl_is_load : _GEN_3765; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3767 = 4'h9 == value_1 ? uops_9_ctrl_is_load : _GEN_3766; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3768 = 4'ha == value_1 ? uops_10_ctrl_is_load : _GEN_3767; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3769 = 4'hb == value_1 ? uops_11_ctrl_is_load : _GEN_3768; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3770 = 4'hc == value_1 ? uops_12_ctrl_is_load : _GEN_3769; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3771 = 4'hd == value_1 ? uops_13_ctrl_is_load : _GEN_3770; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3772 = 4'he == value_1 ? uops_14_ctrl_is_load : _GEN_3771; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3775 = 4'h1 == value_1 ? uops_1_ctrl_csr_cmd : uops_0_ctrl_csr_cmd; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3776 = 4'h2 == value_1 ? uops_2_ctrl_csr_cmd : _GEN_3775; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3777 = 4'h3 == value_1 ? uops_3_ctrl_csr_cmd : _GEN_3776; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3778 = 4'h4 == value_1 ? uops_4_ctrl_csr_cmd : _GEN_3777; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3779 = 4'h5 == value_1 ? uops_5_ctrl_csr_cmd : _GEN_3778; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3780 = 4'h6 == value_1 ? uops_6_ctrl_csr_cmd : _GEN_3779; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3781 = 4'h7 == value_1 ? uops_7_ctrl_csr_cmd : _GEN_3780; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3782 = 4'h8 == value_1 ? uops_8_ctrl_csr_cmd : _GEN_3781; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3783 = 4'h9 == value_1 ? uops_9_ctrl_csr_cmd : _GEN_3782; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3784 = 4'ha == value_1 ? uops_10_ctrl_csr_cmd : _GEN_3783; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3785 = 4'hb == value_1 ? uops_11_ctrl_csr_cmd : _GEN_3784; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3786 = 4'hc == value_1 ? uops_12_ctrl_csr_cmd : _GEN_3785; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3787 = 4'hd == value_1 ? uops_13_ctrl_csr_cmd : _GEN_3786; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3788 = 4'he == value_1 ? uops_14_ctrl_csr_cmd : _GEN_3787; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3791 = 4'h1 == value_1 ? uops_1_ctrl_fcn_dw : uops_0_ctrl_fcn_dw; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3792 = 4'h2 == value_1 ? uops_2_ctrl_fcn_dw : _GEN_3791; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3793 = 4'h3 == value_1 ? uops_3_ctrl_fcn_dw : _GEN_3792; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3794 = 4'h4 == value_1 ? uops_4_ctrl_fcn_dw : _GEN_3793; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3795 = 4'h5 == value_1 ? uops_5_ctrl_fcn_dw : _GEN_3794; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3796 = 4'h6 == value_1 ? uops_6_ctrl_fcn_dw : _GEN_3795; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3797 = 4'h7 == value_1 ? uops_7_ctrl_fcn_dw : _GEN_3796; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3798 = 4'h8 == value_1 ? uops_8_ctrl_fcn_dw : _GEN_3797; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3799 = 4'h9 == value_1 ? uops_9_ctrl_fcn_dw : _GEN_3798; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3800 = 4'ha == value_1 ? uops_10_ctrl_fcn_dw : _GEN_3799; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3801 = 4'hb == value_1 ? uops_11_ctrl_fcn_dw : _GEN_3800; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3802 = 4'hc == value_1 ? uops_12_ctrl_fcn_dw : _GEN_3801; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3803 = 4'hd == value_1 ? uops_13_ctrl_fcn_dw : _GEN_3802; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3804 = 4'he == value_1 ? uops_14_ctrl_fcn_dw : _GEN_3803; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3807 = 4'h1 == value_1 ? uops_1_ctrl_op_fcn : uops_0_ctrl_op_fcn; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3808 = 4'h2 == value_1 ? uops_2_ctrl_op_fcn : _GEN_3807; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3809 = 4'h3 == value_1 ? uops_3_ctrl_op_fcn : _GEN_3808; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3810 = 4'h4 == value_1 ? uops_4_ctrl_op_fcn : _GEN_3809; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3811 = 4'h5 == value_1 ? uops_5_ctrl_op_fcn : _GEN_3810; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3812 = 4'h6 == value_1 ? uops_6_ctrl_op_fcn : _GEN_3811; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3813 = 4'h7 == value_1 ? uops_7_ctrl_op_fcn : _GEN_3812; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3814 = 4'h8 == value_1 ? uops_8_ctrl_op_fcn : _GEN_3813; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3815 = 4'h9 == value_1 ? uops_9_ctrl_op_fcn : _GEN_3814; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3816 = 4'ha == value_1 ? uops_10_ctrl_op_fcn : _GEN_3815; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3817 = 4'hb == value_1 ? uops_11_ctrl_op_fcn : _GEN_3816; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3818 = 4'hc == value_1 ? uops_12_ctrl_op_fcn : _GEN_3817; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3819 = 4'hd == value_1 ? uops_13_ctrl_op_fcn : _GEN_3818; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3820 = 4'he == value_1 ? uops_14_ctrl_op_fcn : _GEN_3819; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3823 = 4'h1 == value_1 ? uops_1_ctrl_imm_sel : uops_0_ctrl_imm_sel; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3824 = 4'h2 == value_1 ? uops_2_ctrl_imm_sel : _GEN_3823; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3825 = 4'h3 == value_1 ? uops_3_ctrl_imm_sel : _GEN_3824; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3826 = 4'h4 == value_1 ? uops_4_ctrl_imm_sel : _GEN_3825; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3827 = 4'h5 == value_1 ? uops_5_ctrl_imm_sel : _GEN_3826; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3828 = 4'h6 == value_1 ? uops_6_ctrl_imm_sel : _GEN_3827; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3829 = 4'h7 == value_1 ? uops_7_ctrl_imm_sel : _GEN_3828; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3830 = 4'h8 == value_1 ? uops_8_ctrl_imm_sel : _GEN_3829; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3831 = 4'h9 == value_1 ? uops_9_ctrl_imm_sel : _GEN_3830; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3832 = 4'ha == value_1 ? uops_10_ctrl_imm_sel : _GEN_3831; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3833 = 4'hb == value_1 ? uops_11_ctrl_imm_sel : _GEN_3832; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3834 = 4'hc == value_1 ? uops_12_ctrl_imm_sel : _GEN_3833; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3835 = 4'hd == value_1 ? uops_13_ctrl_imm_sel : _GEN_3834; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3836 = 4'he == value_1 ? uops_14_ctrl_imm_sel : _GEN_3835; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3839 = 4'h1 == value_1 ? uops_1_ctrl_op2_sel : uops_0_ctrl_op2_sel; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3840 = 4'h2 == value_1 ? uops_2_ctrl_op2_sel : _GEN_3839; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3841 = 4'h3 == value_1 ? uops_3_ctrl_op2_sel : _GEN_3840; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3842 = 4'h4 == value_1 ? uops_4_ctrl_op2_sel : _GEN_3841; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3843 = 4'h5 == value_1 ? uops_5_ctrl_op2_sel : _GEN_3842; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3844 = 4'h6 == value_1 ? uops_6_ctrl_op2_sel : _GEN_3843; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3845 = 4'h7 == value_1 ? uops_7_ctrl_op2_sel : _GEN_3844; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3846 = 4'h8 == value_1 ? uops_8_ctrl_op2_sel : _GEN_3845; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3847 = 4'h9 == value_1 ? uops_9_ctrl_op2_sel : _GEN_3846; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3848 = 4'ha == value_1 ? uops_10_ctrl_op2_sel : _GEN_3847; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3849 = 4'hb == value_1 ? uops_11_ctrl_op2_sel : _GEN_3848; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3850 = 4'hc == value_1 ? uops_12_ctrl_op2_sel : _GEN_3849; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3851 = 4'hd == value_1 ? uops_13_ctrl_op2_sel : _GEN_3850; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3852 = 4'he == value_1 ? uops_14_ctrl_op2_sel : _GEN_3851; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3855 = 4'h1 == value_1 ? uops_1_ctrl_op1_sel : uops_0_ctrl_op1_sel; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3856 = 4'h2 == value_1 ? uops_2_ctrl_op1_sel : _GEN_3855; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3857 = 4'h3 == value_1 ? uops_3_ctrl_op1_sel : _GEN_3856; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3858 = 4'h4 == value_1 ? uops_4_ctrl_op1_sel : _GEN_3857; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3859 = 4'h5 == value_1 ? uops_5_ctrl_op1_sel : _GEN_3858; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3860 = 4'h6 == value_1 ? uops_6_ctrl_op1_sel : _GEN_3859; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3861 = 4'h7 == value_1 ? uops_7_ctrl_op1_sel : _GEN_3860; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3862 = 4'h8 == value_1 ? uops_8_ctrl_op1_sel : _GEN_3861; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3863 = 4'h9 == value_1 ? uops_9_ctrl_op1_sel : _GEN_3862; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3864 = 4'ha == value_1 ? uops_10_ctrl_op1_sel : _GEN_3863; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3865 = 4'hb == value_1 ? uops_11_ctrl_op1_sel : _GEN_3864; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3866 = 4'hc == value_1 ? uops_12_ctrl_op1_sel : _GEN_3865; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3867 = 4'hd == value_1 ? uops_13_ctrl_op1_sel : _GEN_3866; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_3868 = 4'he == value_1 ? uops_14_ctrl_op1_sel : _GEN_3867; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3871 = 4'h1 == value_1 ? uops_1_ctrl_br_type : uops_0_ctrl_br_type; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3872 = 4'h2 == value_1 ? uops_2_ctrl_br_type : _GEN_3871; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3873 = 4'h3 == value_1 ? uops_3_ctrl_br_type : _GEN_3872; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3874 = 4'h4 == value_1 ? uops_4_ctrl_br_type : _GEN_3873; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3875 = 4'h5 == value_1 ? uops_5_ctrl_br_type : _GEN_3874; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3876 = 4'h6 == value_1 ? uops_6_ctrl_br_type : _GEN_3875; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3877 = 4'h7 == value_1 ? uops_7_ctrl_br_type : _GEN_3876; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3878 = 4'h8 == value_1 ? uops_8_ctrl_br_type : _GEN_3877; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3879 = 4'h9 == value_1 ? uops_9_ctrl_br_type : _GEN_3878; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3880 = 4'ha == value_1 ? uops_10_ctrl_br_type : _GEN_3879; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3881 = 4'hb == value_1 ? uops_11_ctrl_br_type : _GEN_3880; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3882 = 4'hc == value_1 ? uops_12_ctrl_br_type : _GEN_3881; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3883 = 4'hd == value_1 ? uops_13_ctrl_br_type : _GEN_3882; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_3884 = 4'he == value_1 ? uops_14_ctrl_br_type : _GEN_3883; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3887 = 4'h1 == value_1 ? uops_1_fu_code : uops_0_fu_code; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3888 = 4'h2 == value_1 ? uops_2_fu_code : _GEN_3887; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3889 = 4'h3 == value_1 ? uops_3_fu_code : _GEN_3888; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3890 = 4'h4 == value_1 ? uops_4_fu_code : _GEN_3889; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3891 = 4'h5 == value_1 ? uops_5_fu_code : _GEN_3890; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3892 = 4'h6 == value_1 ? uops_6_fu_code : _GEN_3891; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3893 = 4'h7 == value_1 ? uops_7_fu_code : _GEN_3892; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3894 = 4'h8 == value_1 ? uops_8_fu_code : _GEN_3893; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3895 = 4'h9 == value_1 ? uops_9_fu_code : _GEN_3894; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3896 = 4'ha == value_1 ? uops_10_fu_code : _GEN_3895; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3897 = 4'hb == value_1 ? uops_11_fu_code : _GEN_3896; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3898 = 4'hc == value_1 ? uops_12_fu_code : _GEN_3897; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3899 = 4'hd == value_1 ? uops_13_fu_code : _GEN_3898; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_3900 = 4'he == value_1 ? uops_14_fu_code : _GEN_3899; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3903 = 4'h1 == value_1 ? uops_1_iq_type : uops_0_iq_type; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3904 = 4'h2 == value_1 ? uops_2_iq_type : _GEN_3903; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3905 = 4'h3 == value_1 ? uops_3_iq_type : _GEN_3904; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3906 = 4'h4 == value_1 ? uops_4_iq_type : _GEN_3905; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3907 = 4'h5 == value_1 ? uops_5_iq_type : _GEN_3906; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3908 = 4'h6 == value_1 ? uops_6_iq_type : _GEN_3907; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3909 = 4'h7 == value_1 ? uops_7_iq_type : _GEN_3908; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3910 = 4'h8 == value_1 ? uops_8_iq_type : _GEN_3909; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3911 = 4'h9 == value_1 ? uops_9_iq_type : _GEN_3910; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3912 = 4'ha == value_1 ? uops_10_iq_type : _GEN_3911; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3913 = 4'hb == value_1 ? uops_11_iq_type : _GEN_3912; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3914 = 4'hc == value_1 ? uops_12_iq_type : _GEN_3913; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3915 = 4'hd == value_1 ? uops_13_iq_type : _GEN_3914; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_3916 = 4'he == value_1 ? uops_14_iq_type : _GEN_3915; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3919 = 4'h1 == value_1 ? uops_1_debug_pc : uops_0_debug_pc; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3920 = 4'h2 == value_1 ? uops_2_debug_pc : _GEN_3919; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3921 = 4'h3 == value_1 ? uops_3_debug_pc : _GEN_3920; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3922 = 4'h4 == value_1 ? uops_4_debug_pc : _GEN_3921; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3923 = 4'h5 == value_1 ? uops_5_debug_pc : _GEN_3922; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3924 = 4'h6 == value_1 ? uops_6_debug_pc : _GEN_3923; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3925 = 4'h7 == value_1 ? uops_7_debug_pc : _GEN_3924; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3926 = 4'h8 == value_1 ? uops_8_debug_pc : _GEN_3925; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3927 = 4'h9 == value_1 ? uops_9_debug_pc : _GEN_3926; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3928 = 4'ha == value_1 ? uops_10_debug_pc : _GEN_3927; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3929 = 4'hb == value_1 ? uops_11_debug_pc : _GEN_3928; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3930 = 4'hc == value_1 ? uops_12_debug_pc : _GEN_3929; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3931 = 4'hd == value_1 ? uops_13_debug_pc : _GEN_3930; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_3932 = 4'he == value_1 ? uops_14_debug_pc : _GEN_3931; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3935 = 4'h1 == value_1 ? uops_1_is_rvc : uops_0_is_rvc; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3936 = 4'h2 == value_1 ? uops_2_is_rvc : _GEN_3935; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3937 = 4'h3 == value_1 ? uops_3_is_rvc : _GEN_3936; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3938 = 4'h4 == value_1 ? uops_4_is_rvc : _GEN_3937; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3939 = 4'h5 == value_1 ? uops_5_is_rvc : _GEN_3938; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3940 = 4'h6 == value_1 ? uops_6_is_rvc : _GEN_3939; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3941 = 4'h7 == value_1 ? uops_7_is_rvc : _GEN_3940; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3942 = 4'h8 == value_1 ? uops_8_is_rvc : _GEN_3941; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3943 = 4'h9 == value_1 ? uops_9_is_rvc : _GEN_3942; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3944 = 4'ha == value_1 ? uops_10_is_rvc : _GEN_3943; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3945 = 4'hb == value_1 ? uops_11_is_rvc : _GEN_3944; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3946 = 4'hc == value_1 ? uops_12_is_rvc : _GEN_3945; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3947 = 4'hd == value_1 ? uops_13_is_rvc : _GEN_3946; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_3948 = 4'he == value_1 ? uops_14_is_rvc : _GEN_3947; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3951 = 4'h1 == value_1 ? uops_1_debug_inst : uops_0_debug_inst; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3952 = 4'h2 == value_1 ? uops_2_debug_inst : _GEN_3951; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3953 = 4'h3 == value_1 ? uops_3_debug_inst : _GEN_3952; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3954 = 4'h4 == value_1 ? uops_4_debug_inst : _GEN_3953; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3955 = 4'h5 == value_1 ? uops_5_debug_inst : _GEN_3954; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3956 = 4'h6 == value_1 ? uops_6_debug_inst : _GEN_3955; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3957 = 4'h7 == value_1 ? uops_7_debug_inst : _GEN_3956; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3958 = 4'h8 == value_1 ? uops_8_debug_inst : _GEN_3957; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3959 = 4'h9 == value_1 ? uops_9_debug_inst : _GEN_3958; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3960 = 4'ha == value_1 ? uops_10_debug_inst : _GEN_3959; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3961 = 4'hb == value_1 ? uops_11_debug_inst : _GEN_3960; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3962 = 4'hc == value_1 ? uops_12_debug_inst : _GEN_3961; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3963 = 4'hd == value_1 ? uops_13_debug_inst : _GEN_3962; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3964 = 4'he == value_1 ? uops_14_debug_inst : _GEN_3963; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3967 = 4'h1 == value_1 ? uops_1_inst : uops_0_inst; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3968 = 4'h2 == value_1 ? uops_2_inst : _GEN_3967; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3969 = 4'h3 == value_1 ? uops_3_inst : _GEN_3968; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3970 = 4'h4 == value_1 ? uops_4_inst : _GEN_3969; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3971 = 4'h5 == value_1 ? uops_5_inst : _GEN_3970; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3972 = 4'h6 == value_1 ? uops_6_inst : _GEN_3971; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3973 = 4'h7 == value_1 ? uops_7_inst : _GEN_3972; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3974 = 4'h8 == value_1 ? uops_8_inst : _GEN_3973; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3975 = 4'h9 == value_1 ? uops_9_inst : _GEN_3974; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3976 = 4'ha == value_1 ? uops_10_inst : _GEN_3975; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3977 = 4'hb == value_1 ? uops_11_inst : _GEN_3976; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3978 = 4'hc == value_1 ? uops_12_inst : _GEN_3977; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3979 = 4'hd == value_1 ? uops_13_inst : _GEN_3978; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_3980 = 4'he == value_1 ? uops_14_inst : _GEN_3979; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3983 = 4'h1 == value_1 ? uops_1_uopc : uops_0_uopc; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3984 = 4'h2 == value_1 ? uops_2_uopc : _GEN_3983; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3985 = 4'h3 == value_1 ? uops_3_uopc : _GEN_3984; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3986 = 4'h4 == value_1 ? uops_4_uopc : _GEN_3985; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3987 = 4'h5 == value_1 ? uops_5_uopc : _GEN_3986; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3988 = 4'h6 == value_1 ? uops_6_uopc : _GEN_3987; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3989 = 4'h7 == value_1 ? uops_7_uopc : _GEN_3988; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3990 = 4'h8 == value_1 ? uops_8_uopc : _GEN_3989; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3991 = 4'h9 == value_1 ? uops_9_uopc : _GEN_3990; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3992 = 4'ha == value_1 ? uops_10_uopc : _GEN_3991; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3993 = 4'hb == value_1 ? uops_11_uopc : _GEN_3992; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3994 = 4'hc == value_1 ? uops_12_uopc : _GEN_3993; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3995 = 4'hd == value_1 ? uops_13_uopc : _GEN_3994; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_3996 = 4'he == value_1 ? uops_14_uopc : _GEN_3995; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _T_157 = io_brupdate_b1_mispredict_mask & out_uop_br_mask; // @[util.scala 118:51]
  wire  _T_158 = _T_157 != 12'h0; // @[util.scala 118:59]
  wire [3:0] lo = value - value_1; // @[util.scala 524:40]
  wire  hi = maybe_full & ptr_match; // @[util.scala 526:32]
  wire [4:0] _T_167 = {hi,lo}; // @[Cat.scala 30:58]
  assign ram_addr_MPORT_1_addr = value_1;
  assign ram_addr_MPORT_1_data = ram_addr[ram_addr_MPORT_1_addr]; // @[util.scala 464:20]
  assign ram_addr_MPORT_data = io_enq_bits_addr;
  assign ram_addr_MPORT_addr = value;
  assign ram_addr_MPORT_mask = 1'h1;
  assign ram_addr_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_data_MPORT_1_addr = value_1;
  assign ram_data_MPORT_1_data = ram_data[ram_data_MPORT_1_addr]; // @[util.scala 464:20]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_is_hella_MPORT_1_addr = value_1;
  assign ram_is_hella_MPORT_1_data = ram_is_hella[ram_is_hella_MPORT_1_addr]; // @[util.scala 464:20]
  assign ram_is_hella_MPORT_data = io_enq_bits_is_hella;
  assign ram_is_hella_MPORT_addr = value;
  assign ram_is_hella_MPORT_mask = 1'h1;
  assign ram_is_hella_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_tag_match_MPORT_1_addr = value_1;
  assign ram_tag_match_MPORT_1_data = ram_tag_match[ram_tag_match_MPORT_1_addr]; // @[util.scala 464:20]
  assign ram_tag_match_MPORT_data = io_enq_bits_tag_match;
  assign ram_tag_match_MPORT_addr = value;
  assign ram_tag_match_MPORT_mask = 1'h1;
  assign ram_tag_match_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_old_meta_coh_state_MPORT_1_addr = value_1;
  assign ram_old_meta_coh_state_MPORT_1_data = ram_old_meta_coh_state[ram_old_meta_coh_state_MPORT_1_addr]; // @[util.scala 464:20]
  assign ram_old_meta_coh_state_MPORT_data = io_enq_bits_old_meta_coh_state;
  assign ram_old_meta_coh_state_MPORT_addr = value;
  assign ram_old_meta_coh_state_MPORT_mask = 1'h1;
  assign ram_old_meta_coh_state_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_old_meta_tag_MPORT_1_addr = value_1;
  assign ram_old_meta_tag_MPORT_1_data = ram_old_meta_tag[ram_old_meta_tag_MPORT_1_addr]; // @[util.scala 464:20]
  assign ram_old_meta_tag_MPORT_data = io_enq_bits_old_meta_tag;
  assign ram_old_meta_tag_MPORT_addr = value;
  assign ram_old_meta_tag_MPORT_mask = 1'h1;
  assign ram_old_meta_tag_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_way_en_MPORT_1_addr = value_1;
  assign ram_way_en_MPORT_1_data = ram_way_en[ram_way_en_MPORT_1_addr]; // @[util.scala 464:20]
  assign ram_way_en_MPORT_data = io_enq_bits_way_en;
  assign ram_way_en_MPORT_addr = value;
  assign ram_way_en_MPORT_mask = 1'h1;
  assign ram_way_en_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_sdq_id_MPORT_1_addr = value_1;
  assign ram_sdq_id_MPORT_1_data = ram_sdq_id[ram_sdq_id_MPORT_1_addr]; // @[util.scala 464:20]
  assign ram_sdq_id_MPORT_data = io_enq_bits_sdq_id;
  assign ram_sdq_id_MPORT_addr = value;
  assign ram_sdq_id_MPORT_mask = 1'h1;
  assign ram_sdq_id_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[util.scala 504:19]
  assign io_deq_valid = _T_5 & _GEN_15 & ~_T_158 & ~(io_flush & out_uop_uses_ldq); // @[util.scala 509:108]
  assign io_deq_bits_uop_uopc = 4'hf == value_1 ? uops_15_uopc : _GEN_3996; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_inst = 4'hf == value_1 ? uops_15_inst : _GEN_3980; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_debug_inst = 4'hf == value_1 ? uops_15_debug_inst : _GEN_3964; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_rvc = 4'hf == value_1 ? uops_15_is_rvc : _GEN_3948; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_debug_pc = 4'hf == value_1 ? uops_15_debug_pc : _GEN_3932; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_iq_type = 4'hf == value_1 ? uops_15_iq_type : _GEN_3916; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_fu_code = 4'hf == value_1 ? uops_15_fu_code : _GEN_3900; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_br_type = 4'hf == value_1 ? uops_15_ctrl_br_type : _GEN_3884; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_op1_sel = 4'hf == value_1 ? uops_15_ctrl_op1_sel : _GEN_3868; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_op2_sel = 4'hf == value_1 ? uops_15_ctrl_op2_sel : _GEN_3852; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_imm_sel = 4'hf == value_1 ? uops_15_ctrl_imm_sel : _GEN_3836; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_op_fcn = 4'hf == value_1 ? uops_15_ctrl_op_fcn : _GEN_3820; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_fcn_dw = 4'hf == value_1 ? uops_15_ctrl_fcn_dw : _GEN_3804; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_csr_cmd = 4'hf == value_1 ? uops_15_ctrl_csr_cmd : _GEN_3788; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_is_load = 4'hf == value_1 ? uops_15_ctrl_is_load : _GEN_3772; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_is_sta = 4'hf == value_1 ? uops_15_ctrl_is_sta : _GEN_3756; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_is_std = 4'hf == value_1 ? uops_15_ctrl_is_std : _GEN_3740; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_iw_state = 4'hf == value_1 ? uops_15_iw_state : _GEN_3724; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_iw_p1_poisoned = 4'hf == value_1 ? uops_15_iw_p1_poisoned : _GEN_3708; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_iw_p2_poisoned = 4'hf == value_1 ? uops_15_iw_p2_poisoned : _GEN_3692; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_br = 4'hf == value_1 ? uops_15_is_br : _GEN_3676; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_jalr = 4'hf == value_1 ? uops_15_is_jalr : _GEN_3660; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_jal = 4'hf == value_1 ? uops_15_is_jal : _GEN_3644; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_sfb = 4'hf == value_1 ? uops_15_is_sfb : _GEN_3628; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_br_mask = out_uop_br_mask & _T_14; // @[util.scala 85:25]
  assign io_deq_bits_uop_br_tag = 4'hf == value_1 ? uops_15_br_tag : _GEN_3596; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ftq_idx = 4'hf == value_1 ? uops_15_ftq_idx : _GEN_3580; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_edge_inst = 4'hf == value_1 ? uops_15_edge_inst : _GEN_3564; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_pc_lob = 4'hf == value_1 ? uops_15_pc_lob : _GEN_3548; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_taken = 4'hf == value_1 ? uops_15_taken : _GEN_3532; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_imm_packed = 4'hf == value_1 ? uops_15_imm_packed : _GEN_3516; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_csr_addr = 4'hf == value_1 ? uops_15_csr_addr : _GEN_3500; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_rob_idx = 4'hf == value_1 ? uops_15_rob_idx : _GEN_3484; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ldq_idx = 4'hf == value_1 ? uops_15_ldq_idx : _GEN_3468; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_stq_idx = 4'hf == value_1 ? uops_15_stq_idx : _GEN_3452; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_rxq_idx = 4'hf == value_1 ? uops_15_rxq_idx : _GEN_3436; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_pdst = 4'hf == value_1 ? uops_15_pdst : _GEN_3420; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs1 = 4'hf == value_1 ? uops_15_prs1 : _GEN_3404; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs2 = 4'hf == value_1 ? uops_15_prs2 : _GEN_3388; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs3 = 4'hf == value_1 ? uops_15_prs3 : _GEN_3372; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ppred = 4'hf == value_1 ? uops_15_ppred : _GEN_3356; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs1_busy = 4'hf == value_1 ? uops_15_prs1_busy : _GEN_3340; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs2_busy = 4'hf == value_1 ? uops_15_prs2_busy : _GEN_3324; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs3_busy = 4'hf == value_1 ? uops_15_prs3_busy : _GEN_3308; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ppred_busy = 4'hf == value_1 ? uops_15_ppred_busy : _GEN_3292; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_stale_pdst = 4'hf == value_1 ? uops_15_stale_pdst : _GEN_3276; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_exception = 4'hf == value_1 ? uops_15_exception : _GEN_3260; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_exc_cause = 4'hf == value_1 ? uops_15_exc_cause : _GEN_3244; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_bypassable = 4'hf == value_1 ? uops_15_bypassable : _GEN_3228; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_mem_cmd = 4'hf == value_1 ? uops_15_mem_cmd : _GEN_3212; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_mem_size = 4'hf == value_1 ? uops_15_mem_size : _GEN_3196; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_mem_signed = 4'hf == value_1 ? uops_15_mem_signed : _GEN_3180; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_fence = 4'hf == value_1 ? uops_15_is_fence : _GEN_3164; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_fencei = 4'hf == value_1 ? uops_15_is_fencei : _GEN_3148; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_amo = 4'hf == value_1 ? uops_15_is_amo : _GEN_3132; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_uses_ldq = 4'hf == value_1 ? uops_15_uses_ldq : _GEN_3116; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_uses_stq = 4'hf == value_1 ? uops_15_uses_stq : _GEN_3100; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_sys_pc2epc = 4'hf == value_1 ? uops_15_is_sys_pc2epc : _GEN_3084; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_unique = 4'hf == value_1 ? uops_15_is_unique : _GEN_3068; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_flush_on_commit = 4'hf == value_1 ? uops_15_flush_on_commit : _GEN_3052; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ldst_is_rs1 = 4'hf == value_1 ? uops_15_ldst_is_rs1 : _GEN_3036; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ldst = 4'hf == value_1 ? uops_15_ldst : _GEN_3020; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_lrs1 = 4'hf == value_1 ? uops_15_lrs1 : _GEN_3004; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_lrs2 = 4'hf == value_1 ? uops_15_lrs2 : _GEN_2988; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_lrs3 = 4'hf == value_1 ? uops_15_lrs3 : _GEN_2972; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ldst_val = 4'hf == value_1 ? uops_15_ldst_val : _GEN_2956; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_dst_rtype = 4'hf == value_1 ? uops_15_dst_rtype : _GEN_2940; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_lrs1_rtype = 4'hf == value_1 ? uops_15_lrs1_rtype : _GEN_2924; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_lrs2_rtype = 4'hf == value_1 ? uops_15_lrs2_rtype : _GEN_2908; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_frs3_en = 4'hf == value_1 ? uops_15_frs3_en : _GEN_2892; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_fp_val = 4'hf == value_1 ? uops_15_fp_val : _GEN_2876; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_fp_single = 4'hf == value_1 ? uops_15_fp_single : _GEN_2860; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_xcpt_pf_if = 4'hf == value_1 ? uops_15_xcpt_pf_if : _GEN_2844; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_xcpt_ae_if = 4'hf == value_1 ? uops_15_xcpt_ae_if : _GEN_2828; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_xcpt_ma_if = 4'hf == value_1 ? uops_15_xcpt_ma_if : _GEN_2812; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_bp_debug_if = 4'hf == value_1 ? uops_15_bp_debug_if : _GEN_2796; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_bp_xcpt_if = 4'hf == value_1 ? uops_15_bp_xcpt_if : _GEN_2780; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_debug_fsrc = 4'hf == value_1 ? uops_15_debug_fsrc : _GEN_2764; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_debug_tsrc = 4'hf == value_1 ? uops_15_debug_tsrc : _GEN_2748; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_addr = ram_addr_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  assign io_deq_bits_data = ram_data_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  assign io_deq_bits_is_hella = ram_is_hella_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  assign io_deq_bits_tag_match = ram_tag_match_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  assign io_deq_bits_old_meta_coh_state = ram_old_meta_coh_state_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  assign io_deq_bits_old_meta_tag = ram_old_meta_tag_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  assign io_deq_bits_way_en = ram_way_en_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  assign io_deq_bits_sdq_id = ram_sdq_id_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  assign io_empty = ptr_match & ~maybe_full; // @[util.scala 473:25]
  assign io_count = _T_167[3:0]; // @[util.scala 526:14]
  always @(posedge clock) begin
    if(ram_addr_MPORT_en & ram_addr_MPORT_mask) begin
      ram_addr[ram_addr_MPORT_addr] <= ram_addr_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_is_hella_MPORT_en & ram_is_hella_MPORT_mask) begin
      ram_is_hella[ram_is_hella_MPORT_addr] <= ram_is_hella_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_tag_match_MPORT_en & ram_tag_match_MPORT_mask) begin
      ram_tag_match[ram_tag_match_MPORT_addr] <= ram_tag_match_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_old_meta_coh_state_MPORT_en & ram_old_meta_coh_state_MPORT_mask) begin
      ram_old_meta_coh_state[ram_old_meta_coh_state_MPORT_addr] <= ram_old_meta_coh_state_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_old_meta_tag_MPORT_en & ram_old_meta_tag_MPORT_mask) begin
      ram_old_meta_tag[ram_old_meta_tag_MPORT_addr] <= ram_old_meta_tag_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_way_en_MPORT_en & ram_way_en_MPORT_mask) begin
      ram_way_en[ram_way_en_MPORT_addr] <= ram_way_en_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_sdq_id_MPORT_en & ram_sdq_id_MPORT_mask) begin
      ram_sdq_id[ram_sdq_id_MPORT_addr] <= ram_sdq_id_MPORT_data; // @[util.scala 464:20]
    end
    if (reset) begin // @[util.scala 465:24]
      valids_0 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'h0 == value_1) begin // @[util.scala 496:27]
        valids_0 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_0 <= _GEN_1419;
      end
    end else begin
      valids_0 <= _GEN_1419;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_1 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'h1 == value_1) begin // @[util.scala 496:27]
        valids_1 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_1 <= _GEN_1420;
      end
    end else begin
      valids_1 <= _GEN_1420;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_2 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'h2 == value_1) begin // @[util.scala 496:27]
        valids_2 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_2 <= _GEN_1421;
      end
    end else begin
      valids_2 <= _GEN_1421;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_3 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'h3 == value_1) begin // @[util.scala 496:27]
        valids_3 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_3 <= _GEN_1422;
      end
    end else begin
      valids_3 <= _GEN_1422;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_4 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'h4 == value_1) begin // @[util.scala 496:27]
        valids_4 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_4 <= _GEN_1423;
      end
    end else begin
      valids_4 <= _GEN_1423;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_5 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'h5 == value_1) begin // @[util.scala 496:27]
        valids_5 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_5 <= _GEN_1424;
      end
    end else begin
      valids_5 <= _GEN_1424;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_6 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'h6 == value_1) begin // @[util.scala 496:27]
        valids_6 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_6 <= _GEN_1425;
      end
    end else begin
      valids_6 <= _GEN_1425;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_7 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'h7 == value_1) begin // @[util.scala 496:27]
        valids_7 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_7 <= _GEN_1426;
      end
    end else begin
      valids_7 <= _GEN_1426;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_8 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'h8 == value_1) begin // @[util.scala 496:27]
        valids_8 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_8 <= _GEN_1427;
      end
    end else begin
      valids_8 <= _GEN_1427;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_9 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'h9 == value_1) begin // @[util.scala 496:27]
        valids_9 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_9 <= _GEN_1428;
      end
    end else begin
      valids_9 <= _GEN_1428;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_10 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'ha == value_1) begin // @[util.scala 496:27]
        valids_10 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_10 <= _GEN_1429;
      end
    end else begin
      valids_10 <= _GEN_1429;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_11 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'hb == value_1) begin // @[util.scala 496:27]
        valids_11 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_11 <= _GEN_1430;
      end
    end else begin
      valids_11 <= _GEN_1430;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_12 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'hc == value_1) begin // @[util.scala 496:27]
        valids_12 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_12 <= _GEN_1431;
      end
    end else begin
      valids_12 <= _GEN_1431;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_13 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'hd == value_1) begin // @[util.scala 496:27]
        valids_13 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_13 <= _GEN_1432;
      end
    end else begin
      valids_13 <= _GEN_1432;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_14 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'he == value_1) begin // @[util.scala 496:27]
        valids_14 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_14 <= _GEN_1433;
      end
    end else begin
      valids_14 <= _GEN_1433;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_15 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (4'hf == value_1) begin // @[util.scala 496:27]
        valids_15 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_15 <= _GEN_1434;
      end
    end else begin
      valids_15 <= _GEN_1434;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 491:33]
        uops_0_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_0_br_mask <= _GEN_16;
      end
    end else begin
      uops_0_br_mask <= _GEN_16;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 491:33]
        uops_1_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_1_br_mask <= _GEN_17;
      end
    end else begin
      uops_1_br_mask <= _GEN_17;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 491:33]
        uops_2_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_2_br_mask <= _GEN_18;
      end
    end else begin
      uops_2_br_mask <= _GEN_18;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 491:33]
        uops_3_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_3_br_mask <= _GEN_19;
      end
    end else begin
      uops_3_br_mask <= _GEN_19;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 491:33]
        uops_4_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_4_br_mask <= _GEN_20;
      end
    end else begin
      uops_4_br_mask <= _GEN_20;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h4 == value) begin // @[util.scala 490:33]
        uops_4_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 491:33]
        uops_5_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_5_br_mask <= _GEN_21;
      end
    end else begin
      uops_5_br_mask <= _GEN_21;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h5 == value) begin // @[util.scala 490:33]
        uops_5_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 491:33]
        uops_6_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_6_br_mask <= _GEN_22;
      end
    end else begin
      uops_6_br_mask <= _GEN_22;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h6 == value) begin // @[util.scala 490:33]
        uops_6_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 491:33]
        uops_7_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_7_br_mask <= _GEN_23;
      end
    end else begin
      uops_7_br_mask <= _GEN_23;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h7 == value) begin // @[util.scala 490:33]
        uops_7_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 491:33]
        uops_8_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_8_br_mask <= _GEN_24;
      end
    end else begin
      uops_8_br_mask <= _GEN_24;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h8 == value) begin // @[util.scala 490:33]
        uops_8_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 491:33]
        uops_9_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_9_br_mask <= _GEN_25;
      end
    end else begin
      uops_9_br_mask <= _GEN_25;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'h9 == value) begin // @[util.scala 490:33]
        uops_9_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 491:33]
        uops_10_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_10_br_mask <= _GEN_26;
      end
    end else begin
      uops_10_br_mask <= _GEN_26;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'ha == value) begin // @[util.scala 490:33]
        uops_10_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 491:33]
        uops_11_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_11_br_mask <= _GEN_27;
      end
    end else begin
      uops_11_br_mask <= _GEN_27;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hb == value) begin // @[util.scala 490:33]
        uops_11_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 491:33]
        uops_12_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_12_br_mask <= _GEN_28;
      end
    end else begin
      uops_12_br_mask <= _GEN_28;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hc == value) begin // @[util.scala 490:33]
        uops_12_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 491:33]
        uops_13_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_13_br_mask <= _GEN_29;
      end
    end else begin
      uops_13_br_mask <= _GEN_29;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hd == value) begin // @[util.scala 490:33]
        uops_13_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 491:33]
        uops_14_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'he == value) begin // @[util.scala 490:33]
        uops_14_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_14_br_mask <= _GEN_30;
      end
    end else begin
      uops_14_br_mask <= _GEN_30;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'he == value) begin // @[util.scala 490:33]
        uops_14_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 491:33]
        uops_15_br_mask <= _T_152; // @[util.scala 491:33]
      end else if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_15_br_mask <= _GEN_31;
      end
    end else begin
      uops_15_br_mask <= _GEN_31;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (4'hf == value) begin // @[util.scala 490:33]
        uops_15_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 4'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[util.scala 487:17]
      value <= _value_T_1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 4'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[util.scala 495:17]
      value_1 <= _value_T_3; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[util.scala 470:27]
      maybe_full <= 1'h0; // @[util.scala 470:27]
    end else if (do_enq != do_deq) begin // @[util.scala 500:28]
      maybe_full <= do_enq; // @[util.scala 501:16]
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
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_addr[initvar] = _RAND_0[39:0];
  _RAND_1 = {2{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_data[initvar] = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_is_hella[initvar] = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_tag_match[initvar] = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_old_meta_coh_state[initvar] = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_old_meta_tag[initvar] = _RAND_5[19:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_way_en[initvar] = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram_sdq_id[initvar] = _RAND_7[4:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  valids_0 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  valids_1 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  valids_2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  valids_3 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  valids_4 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  valids_5 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  valids_6 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  valids_7 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  valids_8 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  valids_9 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  valids_10 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  valids_11 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  valids_12 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  valids_13 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  valids_14 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  valids_15 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  uops_0_uopc = _RAND_24[6:0];
  _RAND_25 = {1{`RANDOM}};
  uops_0_inst = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  uops_0_debug_inst = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  uops_0_is_rvc = _RAND_27[0:0];
  _RAND_28 = {2{`RANDOM}};
  uops_0_debug_pc = _RAND_28[39:0];
  _RAND_29 = {1{`RANDOM}};
  uops_0_iq_type = _RAND_29[2:0];
  _RAND_30 = {1{`RANDOM}};
  uops_0_fu_code = _RAND_30[9:0];
  _RAND_31 = {1{`RANDOM}};
  uops_0_ctrl_br_type = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  uops_0_ctrl_op1_sel = _RAND_32[1:0];
  _RAND_33 = {1{`RANDOM}};
  uops_0_ctrl_op2_sel = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  uops_0_ctrl_imm_sel = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  uops_0_ctrl_op_fcn = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  uops_0_ctrl_fcn_dw = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  uops_0_ctrl_csr_cmd = _RAND_37[2:0];
  _RAND_38 = {1{`RANDOM}};
  uops_0_ctrl_is_load = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  uops_0_ctrl_is_sta = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  uops_0_ctrl_is_std = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  uops_0_iw_state = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  uops_0_iw_p1_poisoned = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  uops_0_iw_p2_poisoned = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  uops_0_is_br = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  uops_0_is_jalr = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  uops_0_is_jal = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  uops_0_is_sfb = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  uops_0_br_mask = _RAND_48[11:0];
  _RAND_49 = {1{`RANDOM}};
  uops_0_br_tag = _RAND_49[3:0];
  _RAND_50 = {1{`RANDOM}};
  uops_0_ftq_idx = _RAND_50[4:0];
  _RAND_51 = {1{`RANDOM}};
  uops_0_edge_inst = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  uops_0_pc_lob = _RAND_52[5:0];
  _RAND_53 = {1{`RANDOM}};
  uops_0_taken = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  uops_0_imm_packed = _RAND_54[19:0];
  _RAND_55 = {1{`RANDOM}};
  uops_0_csr_addr = _RAND_55[11:0];
  _RAND_56 = {1{`RANDOM}};
  uops_0_rob_idx = _RAND_56[5:0];
  _RAND_57 = {1{`RANDOM}};
  uops_0_ldq_idx = _RAND_57[3:0];
  _RAND_58 = {1{`RANDOM}};
  uops_0_stq_idx = _RAND_58[3:0];
  _RAND_59 = {1{`RANDOM}};
  uops_0_rxq_idx = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  uops_0_pdst = _RAND_60[5:0];
  _RAND_61 = {1{`RANDOM}};
  uops_0_prs1 = _RAND_61[5:0];
  _RAND_62 = {1{`RANDOM}};
  uops_0_prs2 = _RAND_62[5:0];
  _RAND_63 = {1{`RANDOM}};
  uops_0_prs3 = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  uops_0_ppred = _RAND_64[4:0];
  _RAND_65 = {1{`RANDOM}};
  uops_0_prs1_busy = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  uops_0_prs2_busy = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  uops_0_prs3_busy = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  uops_0_ppred_busy = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  uops_0_stale_pdst = _RAND_69[5:0];
  _RAND_70 = {1{`RANDOM}};
  uops_0_exception = _RAND_70[0:0];
  _RAND_71 = {2{`RANDOM}};
  uops_0_exc_cause = _RAND_71[63:0];
  _RAND_72 = {1{`RANDOM}};
  uops_0_bypassable = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  uops_0_mem_cmd = _RAND_73[4:0];
  _RAND_74 = {1{`RANDOM}};
  uops_0_mem_size = _RAND_74[1:0];
  _RAND_75 = {1{`RANDOM}};
  uops_0_mem_signed = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  uops_0_is_fence = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  uops_0_is_fencei = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  uops_0_is_amo = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  uops_0_uses_ldq = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  uops_0_uses_stq = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  uops_0_is_sys_pc2epc = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  uops_0_is_unique = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  uops_0_flush_on_commit = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  uops_0_ldst_is_rs1 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  uops_0_ldst = _RAND_85[5:0];
  _RAND_86 = {1{`RANDOM}};
  uops_0_lrs1 = _RAND_86[5:0];
  _RAND_87 = {1{`RANDOM}};
  uops_0_lrs2 = _RAND_87[5:0];
  _RAND_88 = {1{`RANDOM}};
  uops_0_lrs3 = _RAND_88[5:0];
  _RAND_89 = {1{`RANDOM}};
  uops_0_ldst_val = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  uops_0_dst_rtype = _RAND_90[1:0];
  _RAND_91 = {1{`RANDOM}};
  uops_0_lrs1_rtype = _RAND_91[1:0];
  _RAND_92 = {1{`RANDOM}};
  uops_0_lrs2_rtype = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  uops_0_frs3_en = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  uops_0_fp_val = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  uops_0_fp_single = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  uops_0_xcpt_pf_if = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  uops_0_xcpt_ae_if = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  uops_0_xcpt_ma_if = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  uops_0_bp_debug_if = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  uops_0_bp_xcpt_if = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  uops_0_debug_fsrc = _RAND_101[1:0];
  _RAND_102 = {1{`RANDOM}};
  uops_0_debug_tsrc = _RAND_102[1:0];
  _RAND_103 = {1{`RANDOM}};
  uops_1_uopc = _RAND_103[6:0];
  _RAND_104 = {1{`RANDOM}};
  uops_1_inst = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  uops_1_debug_inst = _RAND_105[31:0];
  _RAND_106 = {1{`RANDOM}};
  uops_1_is_rvc = _RAND_106[0:0];
  _RAND_107 = {2{`RANDOM}};
  uops_1_debug_pc = _RAND_107[39:0];
  _RAND_108 = {1{`RANDOM}};
  uops_1_iq_type = _RAND_108[2:0];
  _RAND_109 = {1{`RANDOM}};
  uops_1_fu_code = _RAND_109[9:0];
  _RAND_110 = {1{`RANDOM}};
  uops_1_ctrl_br_type = _RAND_110[3:0];
  _RAND_111 = {1{`RANDOM}};
  uops_1_ctrl_op1_sel = _RAND_111[1:0];
  _RAND_112 = {1{`RANDOM}};
  uops_1_ctrl_op2_sel = _RAND_112[2:0];
  _RAND_113 = {1{`RANDOM}};
  uops_1_ctrl_imm_sel = _RAND_113[2:0];
  _RAND_114 = {1{`RANDOM}};
  uops_1_ctrl_op_fcn = _RAND_114[3:0];
  _RAND_115 = {1{`RANDOM}};
  uops_1_ctrl_fcn_dw = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  uops_1_ctrl_csr_cmd = _RAND_116[2:0];
  _RAND_117 = {1{`RANDOM}};
  uops_1_ctrl_is_load = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  uops_1_ctrl_is_sta = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  uops_1_ctrl_is_std = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  uops_1_iw_state = _RAND_120[1:0];
  _RAND_121 = {1{`RANDOM}};
  uops_1_iw_p1_poisoned = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  uops_1_iw_p2_poisoned = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  uops_1_is_br = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  uops_1_is_jalr = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  uops_1_is_jal = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  uops_1_is_sfb = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  uops_1_br_mask = _RAND_127[11:0];
  _RAND_128 = {1{`RANDOM}};
  uops_1_br_tag = _RAND_128[3:0];
  _RAND_129 = {1{`RANDOM}};
  uops_1_ftq_idx = _RAND_129[4:0];
  _RAND_130 = {1{`RANDOM}};
  uops_1_edge_inst = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  uops_1_pc_lob = _RAND_131[5:0];
  _RAND_132 = {1{`RANDOM}};
  uops_1_taken = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  uops_1_imm_packed = _RAND_133[19:0];
  _RAND_134 = {1{`RANDOM}};
  uops_1_csr_addr = _RAND_134[11:0];
  _RAND_135 = {1{`RANDOM}};
  uops_1_rob_idx = _RAND_135[5:0];
  _RAND_136 = {1{`RANDOM}};
  uops_1_ldq_idx = _RAND_136[3:0];
  _RAND_137 = {1{`RANDOM}};
  uops_1_stq_idx = _RAND_137[3:0];
  _RAND_138 = {1{`RANDOM}};
  uops_1_rxq_idx = _RAND_138[1:0];
  _RAND_139 = {1{`RANDOM}};
  uops_1_pdst = _RAND_139[5:0];
  _RAND_140 = {1{`RANDOM}};
  uops_1_prs1 = _RAND_140[5:0];
  _RAND_141 = {1{`RANDOM}};
  uops_1_prs2 = _RAND_141[5:0];
  _RAND_142 = {1{`RANDOM}};
  uops_1_prs3 = _RAND_142[5:0];
  _RAND_143 = {1{`RANDOM}};
  uops_1_ppred = _RAND_143[4:0];
  _RAND_144 = {1{`RANDOM}};
  uops_1_prs1_busy = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  uops_1_prs2_busy = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  uops_1_prs3_busy = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  uops_1_ppred_busy = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  uops_1_stale_pdst = _RAND_148[5:0];
  _RAND_149 = {1{`RANDOM}};
  uops_1_exception = _RAND_149[0:0];
  _RAND_150 = {2{`RANDOM}};
  uops_1_exc_cause = _RAND_150[63:0];
  _RAND_151 = {1{`RANDOM}};
  uops_1_bypassable = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  uops_1_mem_cmd = _RAND_152[4:0];
  _RAND_153 = {1{`RANDOM}};
  uops_1_mem_size = _RAND_153[1:0];
  _RAND_154 = {1{`RANDOM}};
  uops_1_mem_signed = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  uops_1_is_fence = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  uops_1_is_fencei = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  uops_1_is_amo = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  uops_1_uses_ldq = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  uops_1_uses_stq = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  uops_1_is_sys_pc2epc = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  uops_1_is_unique = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  uops_1_flush_on_commit = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  uops_1_ldst_is_rs1 = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  uops_1_ldst = _RAND_164[5:0];
  _RAND_165 = {1{`RANDOM}};
  uops_1_lrs1 = _RAND_165[5:0];
  _RAND_166 = {1{`RANDOM}};
  uops_1_lrs2 = _RAND_166[5:0];
  _RAND_167 = {1{`RANDOM}};
  uops_1_lrs3 = _RAND_167[5:0];
  _RAND_168 = {1{`RANDOM}};
  uops_1_ldst_val = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  uops_1_dst_rtype = _RAND_169[1:0];
  _RAND_170 = {1{`RANDOM}};
  uops_1_lrs1_rtype = _RAND_170[1:0];
  _RAND_171 = {1{`RANDOM}};
  uops_1_lrs2_rtype = _RAND_171[1:0];
  _RAND_172 = {1{`RANDOM}};
  uops_1_frs3_en = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  uops_1_fp_val = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  uops_1_fp_single = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  uops_1_xcpt_pf_if = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  uops_1_xcpt_ae_if = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  uops_1_xcpt_ma_if = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  uops_1_bp_debug_if = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  uops_1_bp_xcpt_if = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  uops_1_debug_fsrc = _RAND_180[1:0];
  _RAND_181 = {1{`RANDOM}};
  uops_1_debug_tsrc = _RAND_181[1:0];
  _RAND_182 = {1{`RANDOM}};
  uops_2_uopc = _RAND_182[6:0];
  _RAND_183 = {1{`RANDOM}};
  uops_2_inst = _RAND_183[31:0];
  _RAND_184 = {1{`RANDOM}};
  uops_2_debug_inst = _RAND_184[31:0];
  _RAND_185 = {1{`RANDOM}};
  uops_2_is_rvc = _RAND_185[0:0];
  _RAND_186 = {2{`RANDOM}};
  uops_2_debug_pc = _RAND_186[39:0];
  _RAND_187 = {1{`RANDOM}};
  uops_2_iq_type = _RAND_187[2:0];
  _RAND_188 = {1{`RANDOM}};
  uops_2_fu_code = _RAND_188[9:0];
  _RAND_189 = {1{`RANDOM}};
  uops_2_ctrl_br_type = _RAND_189[3:0];
  _RAND_190 = {1{`RANDOM}};
  uops_2_ctrl_op1_sel = _RAND_190[1:0];
  _RAND_191 = {1{`RANDOM}};
  uops_2_ctrl_op2_sel = _RAND_191[2:0];
  _RAND_192 = {1{`RANDOM}};
  uops_2_ctrl_imm_sel = _RAND_192[2:0];
  _RAND_193 = {1{`RANDOM}};
  uops_2_ctrl_op_fcn = _RAND_193[3:0];
  _RAND_194 = {1{`RANDOM}};
  uops_2_ctrl_fcn_dw = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  uops_2_ctrl_csr_cmd = _RAND_195[2:0];
  _RAND_196 = {1{`RANDOM}};
  uops_2_ctrl_is_load = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  uops_2_ctrl_is_sta = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  uops_2_ctrl_is_std = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  uops_2_iw_state = _RAND_199[1:0];
  _RAND_200 = {1{`RANDOM}};
  uops_2_iw_p1_poisoned = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  uops_2_iw_p2_poisoned = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  uops_2_is_br = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  uops_2_is_jalr = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  uops_2_is_jal = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  uops_2_is_sfb = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  uops_2_br_mask = _RAND_206[11:0];
  _RAND_207 = {1{`RANDOM}};
  uops_2_br_tag = _RAND_207[3:0];
  _RAND_208 = {1{`RANDOM}};
  uops_2_ftq_idx = _RAND_208[4:0];
  _RAND_209 = {1{`RANDOM}};
  uops_2_edge_inst = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  uops_2_pc_lob = _RAND_210[5:0];
  _RAND_211 = {1{`RANDOM}};
  uops_2_taken = _RAND_211[0:0];
  _RAND_212 = {1{`RANDOM}};
  uops_2_imm_packed = _RAND_212[19:0];
  _RAND_213 = {1{`RANDOM}};
  uops_2_csr_addr = _RAND_213[11:0];
  _RAND_214 = {1{`RANDOM}};
  uops_2_rob_idx = _RAND_214[5:0];
  _RAND_215 = {1{`RANDOM}};
  uops_2_ldq_idx = _RAND_215[3:0];
  _RAND_216 = {1{`RANDOM}};
  uops_2_stq_idx = _RAND_216[3:0];
  _RAND_217 = {1{`RANDOM}};
  uops_2_rxq_idx = _RAND_217[1:0];
  _RAND_218 = {1{`RANDOM}};
  uops_2_pdst = _RAND_218[5:0];
  _RAND_219 = {1{`RANDOM}};
  uops_2_prs1 = _RAND_219[5:0];
  _RAND_220 = {1{`RANDOM}};
  uops_2_prs2 = _RAND_220[5:0];
  _RAND_221 = {1{`RANDOM}};
  uops_2_prs3 = _RAND_221[5:0];
  _RAND_222 = {1{`RANDOM}};
  uops_2_ppred = _RAND_222[4:0];
  _RAND_223 = {1{`RANDOM}};
  uops_2_prs1_busy = _RAND_223[0:0];
  _RAND_224 = {1{`RANDOM}};
  uops_2_prs2_busy = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  uops_2_prs3_busy = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  uops_2_ppred_busy = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  uops_2_stale_pdst = _RAND_227[5:0];
  _RAND_228 = {1{`RANDOM}};
  uops_2_exception = _RAND_228[0:0];
  _RAND_229 = {2{`RANDOM}};
  uops_2_exc_cause = _RAND_229[63:0];
  _RAND_230 = {1{`RANDOM}};
  uops_2_bypassable = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  uops_2_mem_cmd = _RAND_231[4:0];
  _RAND_232 = {1{`RANDOM}};
  uops_2_mem_size = _RAND_232[1:0];
  _RAND_233 = {1{`RANDOM}};
  uops_2_mem_signed = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  uops_2_is_fence = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  uops_2_is_fencei = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  uops_2_is_amo = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  uops_2_uses_ldq = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  uops_2_uses_stq = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  uops_2_is_sys_pc2epc = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  uops_2_is_unique = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  uops_2_flush_on_commit = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  uops_2_ldst_is_rs1 = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  uops_2_ldst = _RAND_243[5:0];
  _RAND_244 = {1{`RANDOM}};
  uops_2_lrs1 = _RAND_244[5:0];
  _RAND_245 = {1{`RANDOM}};
  uops_2_lrs2 = _RAND_245[5:0];
  _RAND_246 = {1{`RANDOM}};
  uops_2_lrs3 = _RAND_246[5:0];
  _RAND_247 = {1{`RANDOM}};
  uops_2_ldst_val = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  uops_2_dst_rtype = _RAND_248[1:0];
  _RAND_249 = {1{`RANDOM}};
  uops_2_lrs1_rtype = _RAND_249[1:0];
  _RAND_250 = {1{`RANDOM}};
  uops_2_lrs2_rtype = _RAND_250[1:0];
  _RAND_251 = {1{`RANDOM}};
  uops_2_frs3_en = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  uops_2_fp_val = _RAND_252[0:0];
  _RAND_253 = {1{`RANDOM}};
  uops_2_fp_single = _RAND_253[0:0];
  _RAND_254 = {1{`RANDOM}};
  uops_2_xcpt_pf_if = _RAND_254[0:0];
  _RAND_255 = {1{`RANDOM}};
  uops_2_xcpt_ae_if = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  uops_2_xcpt_ma_if = _RAND_256[0:0];
  _RAND_257 = {1{`RANDOM}};
  uops_2_bp_debug_if = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  uops_2_bp_xcpt_if = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  uops_2_debug_fsrc = _RAND_259[1:0];
  _RAND_260 = {1{`RANDOM}};
  uops_2_debug_tsrc = _RAND_260[1:0];
  _RAND_261 = {1{`RANDOM}};
  uops_3_uopc = _RAND_261[6:0];
  _RAND_262 = {1{`RANDOM}};
  uops_3_inst = _RAND_262[31:0];
  _RAND_263 = {1{`RANDOM}};
  uops_3_debug_inst = _RAND_263[31:0];
  _RAND_264 = {1{`RANDOM}};
  uops_3_is_rvc = _RAND_264[0:0];
  _RAND_265 = {2{`RANDOM}};
  uops_3_debug_pc = _RAND_265[39:0];
  _RAND_266 = {1{`RANDOM}};
  uops_3_iq_type = _RAND_266[2:0];
  _RAND_267 = {1{`RANDOM}};
  uops_3_fu_code = _RAND_267[9:0];
  _RAND_268 = {1{`RANDOM}};
  uops_3_ctrl_br_type = _RAND_268[3:0];
  _RAND_269 = {1{`RANDOM}};
  uops_3_ctrl_op1_sel = _RAND_269[1:0];
  _RAND_270 = {1{`RANDOM}};
  uops_3_ctrl_op2_sel = _RAND_270[2:0];
  _RAND_271 = {1{`RANDOM}};
  uops_3_ctrl_imm_sel = _RAND_271[2:0];
  _RAND_272 = {1{`RANDOM}};
  uops_3_ctrl_op_fcn = _RAND_272[3:0];
  _RAND_273 = {1{`RANDOM}};
  uops_3_ctrl_fcn_dw = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  uops_3_ctrl_csr_cmd = _RAND_274[2:0];
  _RAND_275 = {1{`RANDOM}};
  uops_3_ctrl_is_load = _RAND_275[0:0];
  _RAND_276 = {1{`RANDOM}};
  uops_3_ctrl_is_sta = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  uops_3_ctrl_is_std = _RAND_277[0:0];
  _RAND_278 = {1{`RANDOM}};
  uops_3_iw_state = _RAND_278[1:0];
  _RAND_279 = {1{`RANDOM}};
  uops_3_iw_p1_poisoned = _RAND_279[0:0];
  _RAND_280 = {1{`RANDOM}};
  uops_3_iw_p2_poisoned = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  uops_3_is_br = _RAND_281[0:0];
  _RAND_282 = {1{`RANDOM}};
  uops_3_is_jalr = _RAND_282[0:0];
  _RAND_283 = {1{`RANDOM}};
  uops_3_is_jal = _RAND_283[0:0];
  _RAND_284 = {1{`RANDOM}};
  uops_3_is_sfb = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  uops_3_br_mask = _RAND_285[11:0];
  _RAND_286 = {1{`RANDOM}};
  uops_3_br_tag = _RAND_286[3:0];
  _RAND_287 = {1{`RANDOM}};
  uops_3_ftq_idx = _RAND_287[4:0];
  _RAND_288 = {1{`RANDOM}};
  uops_3_edge_inst = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  uops_3_pc_lob = _RAND_289[5:0];
  _RAND_290 = {1{`RANDOM}};
  uops_3_taken = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  uops_3_imm_packed = _RAND_291[19:0];
  _RAND_292 = {1{`RANDOM}};
  uops_3_csr_addr = _RAND_292[11:0];
  _RAND_293 = {1{`RANDOM}};
  uops_3_rob_idx = _RAND_293[5:0];
  _RAND_294 = {1{`RANDOM}};
  uops_3_ldq_idx = _RAND_294[3:0];
  _RAND_295 = {1{`RANDOM}};
  uops_3_stq_idx = _RAND_295[3:0];
  _RAND_296 = {1{`RANDOM}};
  uops_3_rxq_idx = _RAND_296[1:0];
  _RAND_297 = {1{`RANDOM}};
  uops_3_pdst = _RAND_297[5:0];
  _RAND_298 = {1{`RANDOM}};
  uops_3_prs1 = _RAND_298[5:0];
  _RAND_299 = {1{`RANDOM}};
  uops_3_prs2 = _RAND_299[5:0];
  _RAND_300 = {1{`RANDOM}};
  uops_3_prs3 = _RAND_300[5:0];
  _RAND_301 = {1{`RANDOM}};
  uops_3_ppred = _RAND_301[4:0];
  _RAND_302 = {1{`RANDOM}};
  uops_3_prs1_busy = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  uops_3_prs2_busy = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  uops_3_prs3_busy = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  uops_3_ppred_busy = _RAND_305[0:0];
  _RAND_306 = {1{`RANDOM}};
  uops_3_stale_pdst = _RAND_306[5:0];
  _RAND_307 = {1{`RANDOM}};
  uops_3_exception = _RAND_307[0:0];
  _RAND_308 = {2{`RANDOM}};
  uops_3_exc_cause = _RAND_308[63:0];
  _RAND_309 = {1{`RANDOM}};
  uops_3_bypassable = _RAND_309[0:0];
  _RAND_310 = {1{`RANDOM}};
  uops_3_mem_cmd = _RAND_310[4:0];
  _RAND_311 = {1{`RANDOM}};
  uops_3_mem_size = _RAND_311[1:0];
  _RAND_312 = {1{`RANDOM}};
  uops_3_mem_signed = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  uops_3_is_fence = _RAND_313[0:0];
  _RAND_314 = {1{`RANDOM}};
  uops_3_is_fencei = _RAND_314[0:0];
  _RAND_315 = {1{`RANDOM}};
  uops_3_is_amo = _RAND_315[0:0];
  _RAND_316 = {1{`RANDOM}};
  uops_3_uses_ldq = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  uops_3_uses_stq = _RAND_317[0:0];
  _RAND_318 = {1{`RANDOM}};
  uops_3_is_sys_pc2epc = _RAND_318[0:0];
  _RAND_319 = {1{`RANDOM}};
  uops_3_is_unique = _RAND_319[0:0];
  _RAND_320 = {1{`RANDOM}};
  uops_3_flush_on_commit = _RAND_320[0:0];
  _RAND_321 = {1{`RANDOM}};
  uops_3_ldst_is_rs1 = _RAND_321[0:0];
  _RAND_322 = {1{`RANDOM}};
  uops_3_ldst = _RAND_322[5:0];
  _RAND_323 = {1{`RANDOM}};
  uops_3_lrs1 = _RAND_323[5:0];
  _RAND_324 = {1{`RANDOM}};
  uops_3_lrs2 = _RAND_324[5:0];
  _RAND_325 = {1{`RANDOM}};
  uops_3_lrs3 = _RAND_325[5:0];
  _RAND_326 = {1{`RANDOM}};
  uops_3_ldst_val = _RAND_326[0:0];
  _RAND_327 = {1{`RANDOM}};
  uops_3_dst_rtype = _RAND_327[1:0];
  _RAND_328 = {1{`RANDOM}};
  uops_3_lrs1_rtype = _RAND_328[1:0];
  _RAND_329 = {1{`RANDOM}};
  uops_3_lrs2_rtype = _RAND_329[1:0];
  _RAND_330 = {1{`RANDOM}};
  uops_3_frs3_en = _RAND_330[0:0];
  _RAND_331 = {1{`RANDOM}};
  uops_3_fp_val = _RAND_331[0:0];
  _RAND_332 = {1{`RANDOM}};
  uops_3_fp_single = _RAND_332[0:0];
  _RAND_333 = {1{`RANDOM}};
  uops_3_xcpt_pf_if = _RAND_333[0:0];
  _RAND_334 = {1{`RANDOM}};
  uops_3_xcpt_ae_if = _RAND_334[0:0];
  _RAND_335 = {1{`RANDOM}};
  uops_3_xcpt_ma_if = _RAND_335[0:0];
  _RAND_336 = {1{`RANDOM}};
  uops_3_bp_debug_if = _RAND_336[0:0];
  _RAND_337 = {1{`RANDOM}};
  uops_3_bp_xcpt_if = _RAND_337[0:0];
  _RAND_338 = {1{`RANDOM}};
  uops_3_debug_fsrc = _RAND_338[1:0];
  _RAND_339 = {1{`RANDOM}};
  uops_3_debug_tsrc = _RAND_339[1:0];
  _RAND_340 = {1{`RANDOM}};
  uops_4_uopc = _RAND_340[6:0];
  _RAND_341 = {1{`RANDOM}};
  uops_4_inst = _RAND_341[31:0];
  _RAND_342 = {1{`RANDOM}};
  uops_4_debug_inst = _RAND_342[31:0];
  _RAND_343 = {1{`RANDOM}};
  uops_4_is_rvc = _RAND_343[0:0];
  _RAND_344 = {2{`RANDOM}};
  uops_4_debug_pc = _RAND_344[39:0];
  _RAND_345 = {1{`RANDOM}};
  uops_4_iq_type = _RAND_345[2:0];
  _RAND_346 = {1{`RANDOM}};
  uops_4_fu_code = _RAND_346[9:0];
  _RAND_347 = {1{`RANDOM}};
  uops_4_ctrl_br_type = _RAND_347[3:0];
  _RAND_348 = {1{`RANDOM}};
  uops_4_ctrl_op1_sel = _RAND_348[1:0];
  _RAND_349 = {1{`RANDOM}};
  uops_4_ctrl_op2_sel = _RAND_349[2:0];
  _RAND_350 = {1{`RANDOM}};
  uops_4_ctrl_imm_sel = _RAND_350[2:0];
  _RAND_351 = {1{`RANDOM}};
  uops_4_ctrl_op_fcn = _RAND_351[3:0];
  _RAND_352 = {1{`RANDOM}};
  uops_4_ctrl_fcn_dw = _RAND_352[0:0];
  _RAND_353 = {1{`RANDOM}};
  uops_4_ctrl_csr_cmd = _RAND_353[2:0];
  _RAND_354 = {1{`RANDOM}};
  uops_4_ctrl_is_load = _RAND_354[0:0];
  _RAND_355 = {1{`RANDOM}};
  uops_4_ctrl_is_sta = _RAND_355[0:0];
  _RAND_356 = {1{`RANDOM}};
  uops_4_ctrl_is_std = _RAND_356[0:0];
  _RAND_357 = {1{`RANDOM}};
  uops_4_iw_state = _RAND_357[1:0];
  _RAND_358 = {1{`RANDOM}};
  uops_4_iw_p1_poisoned = _RAND_358[0:0];
  _RAND_359 = {1{`RANDOM}};
  uops_4_iw_p2_poisoned = _RAND_359[0:0];
  _RAND_360 = {1{`RANDOM}};
  uops_4_is_br = _RAND_360[0:0];
  _RAND_361 = {1{`RANDOM}};
  uops_4_is_jalr = _RAND_361[0:0];
  _RAND_362 = {1{`RANDOM}};
  uops_4_is_jal = _RAND_362[0:0];
  _RAND_363 = {1{`RANDOM}};
  uops_4_is_sfb = _RAND_363[0:0];
  _RAND_364 = {1{`RANDOM}};
  uops_4_br_mask = _RAND_364[11:0];
  _RAND_365 = {1{`RANDOM}};
  uops_4_br_tag = _RAND_365[3:0];
  _RAND_366 = {1{`RANDOM}};
  uops_4_ftq_idx = _RAND_366[4:0];
  _RAND_367 = {1{`RANDOM}};
  uops_4_edge_inst = _RAND_367[0:0];
  _RAND_368 = {1{`RANDOM}};
  uops_4_pc_lob = _RAND_368[5:0];
  _RAND_369 = {1{`RANDOM}};
  uops_4_taken = _RAND_369[0:0];
  _RAND_370 = {1{`RANDOM}};
  uops_4_imm_packed = _RAND_370[19:0];
  _RAND_371 = {1{`RANDOM}};
  uops_4_csr_addr = _RAND_371[11:0];
  _RAND_372 = {1{`RANDOM}};
  uops_4_rob_idx = _RAND_372[5:0];
  _RAND_373 = {1{`RANDOM}};
  uops_4_ldq_idx = _RAND_373[3:0];
  _RAND_374 = {1{`RANDOM}};
  uops_4_stq_idx = _RAND_374[3:0];
  _RAND_375 = {1{`RANDOM}};
  uops_4_rxq_idx = _RAND_375[1:0];
  _RAND_376 = {1{`RANDOM}};
  uops_4_pdst = _RAND_376[5:0];
  _RAND_377 = {1{`RANDOM}};
  uops_4_prs1 = _RAND_377[5:0];
  _RAND_378 = {1{`RANDOM}};
  uops_4_prs2 = _RAND_378[5:0];
  _RAND_379 = {1{`RANDOM}};
  uops_4_prs3 = _RAND_379[5:0];
  _RAND_380 = {1{`RANDOM}};
  uops_4_ppred = _RAND_380[4:0];
  _RAND_381 = {1{`RANDOM}};
  uops_4_prs1_busy = _RAND_381[0:0];
  _RAND_382 = {1{`RANDOM}};
  uops_4_prs2_busy = _RAND_382[0:0];
  _RAND_383 = {1{`RANDOM}};
  uops_4_prs3_busy = _RAND_383[0:0];
  _RAND_384 = {1{`RANDOM}};
  uops_4_ppred_busy = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  uops_4_stale_pdst = _RAND_385[5:0];
  _RAND_386 = {1{`RANDOM}};
  uops_4_exception = _RAND_386[0:0];
  _RAND_387 = {2{`RANDOM}};
  uops_4_exc_cause = _RAND_387[63:0];
  _RAND_388 = {1{`RANDOM}};
  uops_4_bypassable = _RAND_388[0:0];
  _RAND_389 = {1{`RANDOM}};
  uops_4_mem_cmd = _RAND_389[4:0];
  _RAND_390 = {1{`RANDOM}};
  uops_4_mem_size = _RAND_390[1:0];
  _RAND_391 = {1{`RANDOM}};
  uops_4_mem_signed = _RAND_391[0:0];
  _RAND_392 = {1{`RANDOM}};
  uops_4_is_fence = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  uops_4_is_fencei = _RAND_393[0:0];
  _RAND_394 = {1{`RANDOM}};
  uops_4_is_amo = _RAND_394[0:0];
  _RAND_395 = {1{`RANDOM}};
  uops_4_uses_ldq = _RAND_395[0:0];
  _RAND_396 = {1{`RANDOM}};
  uops_4_uses_stq = _RAND_396[0:0];
  _RAND_397 = {1{`RANDOM}};
  uops_4_is_sys_pc2epc = _RAND_397[0:0];
  _RAND_398 = {1{`RANDOM}};
  uops_4_is_unique = _RAND_398[0:0];
  _RAND_399 = {1{`RANDOM}};
  uops_4_flush_on_commit = _RAND_399[0:0];
  _RAND_400 = {1{`RANDOM}};
  uops_4_ldst_is_rs1 = _RAND_400[0:0];
  _RAND_401 = {1{`RANDOM}};
  uops_4_ldst = _RAND_401[5:0];
  _RAND_402 = {1{`RANDOM}};
  uops_4_lrs1 = _RAND_402[5:0];
  _RAND_403 = {1{`RANDOM}};
  uops_4_lrs2 = _RAND_403[5:0];
  _RAND_404 = {1{`RANDOM}};
  uops_4_lrs3 = _RAND_404[5:0];
  _RAND_405 = {1{`RANDOM}};
  uops_4_ldst_val = _RAND_405[0:0];
  _RAND_406 = {1{`RANDOM}};
  uops_4_dst_rtype = _RAND_406[1:0];
  _RAND_407 = {1{`RANDOM}};
  uops_4_lrs1_rtype = _RAND_407[1:0];
  _RAND_408 = {1{`RANDOM}};
  uops_4_lrs2_rtype = _RAND_408[1:0];
  _RAND_409 = {1{`RANDOM}};
  uops_4_frs3_en = _RAND_409[0:0];
  _RAND_410 = {1{`RANDOM}};
  uops_4_fp_val = _RAND_410[0:0];
  _RAND_411 = {1{`RANDOM}};
  uops_4_fp_single = _RAND_411[0:0];
  _RAND_412 = {1{`RANDOM}};
  uops_4_xcpt_pf_if = _RAND_412[0:0];
  _RAND_413 = {1{`RANDOM}};
  uops_4_xcpt_ae_if = _RAND_413[0:0];
  _RAND_414 = {1{`RANDOM}};
  uops_4_xcpt_ma_if = _RAND_414[0:0];
  _RAND_415 = {1{`RANDOM}};
  uops_4_bp_debug_if = _RAND_415[0:0];
  _RAND_416 = {1{`RANDOM}};
  uops_4_bp_xcpt_if = _RAND_416[0:0];
  _RAND_417 = {1{`RANDOM}};
  uops_4_debug_fsrc = _RAND_417[1:0];
  _RAND_418 = {1{`RANDOM}};
  uops_4_debug_tsrc = _RAND_418[1:0];
  _RAND_419 = {1{`RANDOM}};
  uops_5_uopc = _RAND_419[6:0];
  _RAND_420 = {1{`RANDOM}};
  uops_5_inst = _RAND_420[31:0];
  _RAND_421 = {1{`RANDOM}};
  uops_5_debug_inst = _RAND_421[31:0];
  _RAND_422 = {1{`RANDOM}};
  uops_5_is_rvc = _RAND_422[0:0];
  _RAND_423 = {2{`RANDOM}};
  uops_5_debug_pc = _RAND_423[39:0];
  _RAND_424 = {1{`RANDOM}};
  uops_5_iq_type = _RAND_424[2:0];
  _RAND_425 = {1{`RANDOM}};
  uops_5_fu_code = _RAND_425[9:0];
  _RAND_426 = {1{`RANDOM}};
  uops_5_ctrl_br_type = _RAND_426[3:0];
  _RAND_427 = {1{`RANDOM}};
  uops_5_ctrl_op1_sel = _RAND_427[1:0];
  _RAND_428 = {1{`RANDOM}};
  uops_5_ctrl_op2_sel = _RAND_428[2:0];
  _RAND_429 = {1{`RANDOM}};
  uops_5_ctrl_imm_sel = _RAND_429[2:0];
  _RAND_430 = {1{`RANDOM}};
  uops_5_ctrl_op_fcn = _RAND_430[3:0];
  _RAND_431 = {1{`RANDOM}};
  uops_5_ctrl_fcn_dw = _RAND_431[0:0];
  _RAND_432 = {1{`RANDOM}};
  uops_5_ctrl_csr_cmd = _RAND_432[2:0];
  _RAND_433 = {1{`RANDOM}};
  uops_5_ctrl_is_load = _RAND_433[0:0];
  _RAND_434 = {1{`RANDOM}};
  uops_5_ctrl_is_sta = _RAND_434[0:0];
  _RAND_435 = {1{`RANDOM}};
  uops_5_ctrl_is_std = _RAND_435[0:0];
  _RAND_436 = {1{`RANDOM}};
  uops_5_iw_state = _RAND_436[1:0];
  _RAND_437 = {1{`RANDOM}};
  uops_5_iw_p1_poisoned = _RAND_437[0:0];
  _RAND_438 = {1{`RANDOM}};
  uops_5_iw_p2_poisoned = _RAND_438[0:0];
  _RAND_439 = {1{`RANDOM}};
  uops_5_is_br = _RAND_439[0:0];
  _RAND_440 = {1{`RANDOM}};
  uops_5_is_jalr = _RAND_440[0:0];
  _RAND_441 = {1{`RANDOM}};
  uops_5_is_jal = _RAND_441[0:0];
  _RAND_442 = {1{`RANDOM}};
  uops_5_is_sfb = _RAND_442[0:0];
  _RAND_443 = {1{`RANDOM}};
  uops_5_br_mask = _RAND_443[11:0];
  _RAND_444 = {1{`RANDOM}};
  uops_5_br_tag = _RAND_444[3:0];
  _RAND_445 = {1{`RANDOM}};
  uops_5_ftq_idx = _RAND_445[4:0];
  _RAND_446 = {1{`RANDOM}};
  uops_5_edge_inst = _RAND_446[0:0];
  _RAND_447 = {1{`RANDOM}};
  uops_5_pc_lob = _RAND_447[5:0];
  _RAND_448 = {1{`RANDOM}};
  uops_5_taken = _RAND_448[0:0];
  _RAND_449 = {1{`RANDOM}};
  uops_5_imm_packed = _RAND_449[19:0];
  _RAND_450 = {1{`RANDOM}};
  uops_5_csr_addr = _RAND_450[11:0];
  _RAND_451 = {1{`RANDOM}};
  uops_5_rob_idx = _RAND_451[5:0];
  _RAND_452 = {1{`RANDOM}};
  uops_5_ldq_idx = _RAND_452[3:0];
  _RAND_453 = {1{`RANDOM}};
  uops_5_stq_idx = _RAND_453[3:0];
  _RAND_454 = {1{`RANDOM}};
  uops_5_rxq_idx = _RAND_454[1:0];
  _RAND_455 = {1{`RANDOM}};
  uops_5_pdst = _RAND_455[5:0];
  _RAND_456 = {1{`RANDOM}};
  uops_5_prs1 = _RAND_456[5:0];
  _RAND_457 = {1{`RANDOM}};
  uops_5_prs2 = _RAND_457[5:0];
  _RAND_458 = {1{`RANDOM}};
  uops_5_prs3 = _RAND_458[5:0];
  _RAND_459 = {1{`RANDOM}};
  uops_5_ppred = _RAND_459[4:0];
  _RAND_460 = {1{`RANDOM}};
  uops_5_prs1_busy = _RAND_460[0:0];
  _RAND_461 = {1{`RANDOM}};
  uops_5_prs2_busy = _RAND_461[0:0];
  _RAND_462 = {1{`RANDOM}};
  uops_5_prs3_busy = _RAND_462[0:0];
  _RAND_463 = {1{`RANDOM}};
  uops_5_ppred_busy = _RAND_463[0:0];
  _RAND_464 = {1{`RANDOM}};
  uops_5_stale_pdst = _RAND_464[5:0];
  _RAND_465 = {1{`RANDOM}};
  uops_5_exception = _RAND_465[0:0];
  _RAND_466 = {2{`RANDOM}};
  uops_5_exc_cause = _RAND_466[63:0];
  _RAND_467 = {1{`RANDOM}};
  uops_5_bypassable = _RAND_467[0:0];
  _RAND_468 = {1{`RANDOM}};
  uops_5_mem_cmd = _RAND_468[4:0];
  _RAND_469 = {1{`RANDOM}};
  uops_5_mem_size = _RAND_469[1:0];
  _RAND_470 = {1{`RANDOM}};
  uops_5_mem_signed = _RAND_470[0:0];
  _RAND_471 = {1{`RANDOM}};
  uops_5_is_fence = _RAND_471[0:0];
  _RAND_472 = {1{`RANDOM}};
  uops_5_is_fencei = _RAND_472[0:0];
  _RAND_473 = {1{`RANDOM}};
  uops_5_is_amo = _RAND_473[0:0];
  _RAND_474 = {1{`RANDOM}};
  uops_5_uses_ldq = _RAND_474[0:0];
  _RAND_475 = {1{`RANDOM}};
  uops_5_uses_stq = _RAND_475[0:0];
  _RAND_476 = {1{`RANDOM}};
  uops_5_is_sys_pc2epc = _RAND_476[0:0];
  _RAND_477 = {1{`RANDOM}};
  uops_5_is_unique = _RAND_477[0:0];
  _RAND_478 = {1{`RANDOM}};
  uops_5_flush_on_commit = _RAND_478[0:0];
  _RAND_479 = {1{`RANDOM}};
  uops_5_ldst_is_rs1 = _RAND_479[0:0];
  _RAND_480 = {1{`RANDOM}};
  uops_5_ldst = _RAND_480[5:0];
  _RAND_481 = {1{`RANDOM}};
  uops_5_lrs1 = _RAND_481[5:0];
  _RAND_482 = {1{`RANDOM}};
  uops_5_lrs2 = _RAND_482[5:0];
  _RAND_483 = {1{`RANDOM}};
  uops_5_lrs3 = _RAND_483[5:0];
  _RAND_484 = {1{`RANDOM}};
  uops_5_ldst_val = _RAND_484[0:0];
  _RAND_485 = {1{`RANDOM}};
  uops_5_dst_rtype = _RAND_485[1:0];
  _RAND_486 = {1{`RANDOM}};
  uops_5_lrs1_rtype = _RAND_486[1:0];
  _RAND_487 = {1{`RANDOM}};
  uops_5_lrs2_rtype = _RAND_487[1:0];
  _RAND_488 = {1{`RANDOM}};
  uops_5_frs3_en = _RAND_488[0:0];
  _RAND_489 = {1{`RANDOM}};
  uops_5_fp_val = _RAND_489[0:0];
  _RAND_490 = {1{`RANDOM}};
  uops_5_fp_single = _RAND_490[0:0];
  _RAND_491 = {1{`RANDOM}};
  uops_5_xcpt_pf_if = _RAND_491[0:0];
  _RAND_492 = {1{`RANDOM}};
  uops_5_xcpt_ae_if = _RAND_492[0:0];
  _RAND_493 = {1{`RANDOM}};
  uops_5_xcpt_ma_if = _RAND_493[0:0];
  _RAND_494 = {1{`RANDOM}};
  uops_5_bp_debug_if = _RAND_494[0:0];
  _RAND_495 = {1{`RANDOM}};
  uops_5_bp_xcpt_if = _RAND_495[0:0];
  _RAND_496 = {1{`RANDOM}};
  uops_5_debug_fsrc = _RAND_496[1:0];
  _RAND_497 = {1{`RANDOM}};
  uops_5_debug_tsrc = _RAND_497[1:0];
  _RAND_498 = {1{`RANDOM}};
  uops_6_uopc = _RAND_498[6:0];
  _RAND_499 = {1{`RANDOM}};
  uops_6_inst = _RAND_499[31:0];
  _RAND_500 = {1{`RANDOM}};
  uops_6_debug_inst = _RAND_500[31:0];
  _RAND_501 = {1{`RANDOM}};
  uops_6_is_rvc = _RAND_501[0:0];
  _RAND_502 = {2{`RANDOM}};
  uops_6_debug_pc = _RAND_502[39:0];
  _RAND_503 = {1{`RANDOM}};
  uops_6_iq_type = _RAND_503[2:0];
  _RAND_504 = {1{`RANDOM}};
  uops_6_fu_code = _RAND_504[9:0];
  _RAND_505 = {1{`RANDOM}};
  uops_6_ctrl_br_type = _RAND_505[3:0];
  _RAND_506 = {1{`RANDOM}};
  uops_6_ctrl_op1_sel = _RAND_506[1:0];
  _RAND_507 = {1{`RANDOM}};
  uops_6_ctrl_op2_sel = _RAND_507[2:0];
  _RAND_508 = {1{`RANDOM}};
  uops_6_ctrl_imm_sel = _RAND_508[2:0];
  _RAND_509 = {1{`RANDOM}};
  uops_6_ctrl_op_fcn = _RAND_509[3:0];
  _RAND_510 = {1{`RANDOM}};
  uops_6_ctrl_fcn_dw = _RAND_510[0:0];
  _RAND_511 = {1{`RANDOM}};
  uops_6_ctrl_csr_cmd = _RAND_511[2:0];
  _RAND_512 = {1{`RANDOM}};
  uops_6_ctrl_is_load = _RAND_512[0:0];
  _RAND_513 = {1{`RANDOM}};
  uops_6_ctrl_is_sta = _RAND_513[0:0];
  _RAND_514 = {1{`RANDOM}};
  uops_6_ctrl_is_std = _RAND_514[0:0];
  _RAND_515 = {1{`RANDOM}};
  uops_6_iw_state = _RAND_515[1:0];
  _RAND_516 = {1{`RANDOM}};
  uops_6_iw_p1_poisoned = _RAND_516[0:0];
  _RAND_517 = {1{`RANDOM}};
  uops_6_iw_p2_poisoned = _RAND_517[0:0];
  _RAND_518 = {1{`RANDOM}};
  uops_6_is_br = _RAND_518[0:0];
  _RAND_519 = {1{`RANDOM}};
  uops_6_is_jalr = _RAND_519[0:0];
  _RAND_520 = {1{`RANDOM}};
  uops_6_is_jal = _RAND_520[0:0];
  _RAND_521 = {1{`RANDOM}};
  uops_6_is_sfb = _RAND_521[0:0];
  _RAND_522 = {1{`RANDOM}};
  uops_6_br_mask = _RAND_522[11:0];
  _RAND_523 = {1{`RANDOM}};
  uops_6_br_tag = _RAND_523[3:0];
  _RAND_524 = {1{`RANDOM}};
  uops_6_ftq_idx = _RAND_524[4:0];
  _RAND_525 = {1{`RANDOM}};
  uops_6_edge_inst = _RAND_525[0:0];
  _RAND_526 = {1{`RANDOM}};
  uops_6_pc_lob = _RAND_526[5:0];
  _RAND_527 = {1{`RANDOM}};
  uops_6_taken = _RAND_527[0:0];
  _RAND_528 = {1{`RANDOM}};
  uops_6_imm_packed = _RAND_528[19:0];
  _RAND_529 = {1{`RANDOM}};
  uops_6_csr_addr = _RAND_529[11:0];
  _RAND_530 = {1{`RANDOM}};
  uops_6_rob_idx = _RAND_530[5:0];
  _RAND_531 = {1{`RANDOM}};
  uops_6_ldq_idx = _RAND_531[3:0];
  _RAND_532 = {1{`RANDOM}};
  uops_6_stq_idx = _RAND_532[3:0];
  _RAND_533 = {1{`RANDOM}};
  uops_6_rxq_idx = _RAND_533[1:0];
  _RAND_534 = {1{`RANDOM}};
  uops_6_pdst = _RAND_534[5:0];
  _RAND_535 = {1{`RANDOM}};
  uops_6_prs1 = _RAND_535[5:0];
  _RAND_536 = {1{`RANDOM}};
  uops_6_prs2 = _RAND_536[5:0];
  _RAND_537 = {1{`RANDOM}};
  uops_6_prs3 = _RAND_537[5:0];
  _RAND_538 = {1{`RANDOM}};
  uops_6_ppred = _RAND_538[4:0];
  _RAND_539 = {1{`RANDOM}};
  uops_6_prs1_busy = _RAND_539[0:0];
  _RAND_540 = {1{`RANDOM}};
  uops_6_prs2_busy = _RAND_540[0:0];
  _RAND_541 = {1{`RANDOM}};
  uops_6_prs3_busy = _RAND_541[0:0];
  _RAND_542 = {1{`RANDOM}};
  uops_6_ppred_busy = _RAND_542[0:0];
  _RAND_543 = {1{`RANDOM}};
  uops_6_stale_pdst = _RAND_543[5:0];
  _RAND_544 = {1{`RANDOM}};
  uops_6_exception = _RAND_544[0:0];
  _RAND_545 = {2{`RANDOM}};
  uops_6_exc_cause = _RAND_545[63:0];
  _RAND_546 = {1{`RANDOM}};
  uops_6_bypassable = _RAND_546[0:0];
  _RAND_547 = {1{`RANDOM}};
  uops_6_mem_cmd = _RAND_547[4:0];
  _RAND_548 = {1{`RANDOM}};
  uops_6_mem_size = _RAND_548[1:0];
  _RAND_549 = {1{`RANDOM}};
  uops_6_mem_signed = _RAND_549[0:0];
  _RAND_550 = {1{`RANDOM}};
  uops_6_is_fence = _RAND_550[0:0];
  _RAND_551 = {1{`RANDOM}};
  uops_6_is_fencei = _RAND_551[0:0];
  _RAND_552 = {1{`RANDOM}};
  uops_6_is_amo = _RAND_552[0:0];
  _RAND_553 = {1{`RANDOM}};
  uops_6_uses_ldq = _RAND_553[0:0];
  _RAND_554 = {1{`RANDOM}};
  uops_6_uses_stq = _RAND_554[0:0];
  _RAND_555 = {1{`RANDOM}};
  uops_6_is_sys_pc2epc = _RAND_555[0:0];
  _RAND_556 = {1{`RANDOM}};
  uops_6_is_unique = _RAND_556[0:0];
  _RAND_557 = {1{`RANDOM}};
  uops_6_flush_on_commit = _RAND_557[0:0];
  _RAND_558 = {1{`RANDOM}};
  uops_6_ldst_is_rs1 = _RAND_558[0:0];
  _RAND_559 = {1{`RANDOM}};
  uops_6_ldst = _RAND_559[5:0];
  _RAND_560 = {1{`RANDOM}};
  uops_6_lrs1 = _RAND_560[5:0];
  _RAND_561 = {1{`RANDOM}};
  uops_6_lrs2 = _RAND_561[5:0];
  _RAND_562 = {1{`RANDOM}};
  uops_6_lrs3 = _RAND_562[5:0];
  _RAND_563 = {1{`RANDOM}};
  uops_6_ldst_val = _RAND_563[0:0];
  _RAND_564 = {1{`RANDOM}};
  uops_6_dst_rtype = _RAND_564[1:0];
  _RAND_565 = {1{`RANDOM}};
  uops_6_lrs1_rtype = _RAND_565[1:0];
  _RAND_566 = {1{`RANDOM}};
  uops_6_lrs2_rtype = _RAND_566[1:0];
  _RAND_567 = {1{`RANDOM}};
  uops_6_frs3_en = _RAND_567[0:0];
  _RAND_568 = {1{`RANDOM}};
  uops_6_fp_val = _RAND_568[0:0];
  _RAND_569 = {1{`RANDOM}};
  uops_6_fp_single = _RAND_569[0:0];
  _RAND_570 = {1{`RANDOM}};
  uops_6_xcpt_pf_if = _RAND_570[0:0];
  _RAND_571 = {1{`RANDOM}};
  uops_6_xcpt_ae_if = _RAND_571[0:0];
  _RAND_572 = {1{`RANDOM}};
  uops_6_xcpt_ma_if = _RAND_572[0:0];
  _RAND_573 = {1{`RANDOM}};
  uops_6_bp_debug_if = _RAND_573[0:0];
  _RAND_574 = {1{`RANDOM}};
  uops_6_bp_xcpt_if = _RAND_574[0:0];
  _RAND_575 = {1{`RANDOM}};
  uops_6_debug_fsrc = _RAND_575[1:0];
  _RAND_576 = {1{`RANDOM}};
  uops_6_debug_tsrc = _RAND_576[1:0];
  _RAND_577 = {1{`RANDOM}};
  uops_7_uopc = _RAND_577[6:0];
  _RAND_578 = {1{`RANDOM}};
  uops_7_inst = _RAND_578[31:0];
  _RAND_579 = {1{`RANDOM}};
  uops_7_debug_inst = _RAND_579[31:0];
  _RAND_580 = {1{`RANDOM}};
  uops_7_is_rvc = _RAND_580[0:0];
  _RAND_581 = {2{`RANDOM}};
  uops_7_debug_pc = _RAND_581[39:0];
  _RAND_582 = {1{`RANDOM}};
  uops_7_iq_type = _RAND_582[2:0];
  _RAND_583 = {1{`RANDOM}};
  uops_7_fu_code = _RAND_583[9:0];
  _RAND_584 = {1{`RANDOM}};
  uops_7_ctrl_br_type = _RAND_584[3:0];
  _RAND_585 = {1{`RANDOM}};
  uops_7_ctrl_op1_sel = _RAND_585[1:0];
  _RAND_586 = {1{`RANDOM}};
  uops_7_ctrl_op2_sel = _RAND_586[2:0];
  _RAND_587 = {1{`RANDOM}};
  uops_7_ctrl_imm_sel = _RAND_587[2:0];
  _RAND_588 = {1{`RANDOM}};
  uops_7_ctrl_op_fcn = _RAND_588[3:0];
  _RAND_589 = {1{`RANDOM}};
  uops_7_ctrl_fcn_dw = _RAND_589[0:0];
  _RAND_590 = {1{`RANDOM}};
  uops_7_ctrl_csr_cmd = _RAND_590[2:0];
  _RAND_591 = {1{`RANDOM}};
  uops_7_ctrl_is_load = _RAND_591[0:0];
  _RAND_592 = {1{`RANDOM}};
  uops_7_ctrl_is_sta = _RAND_592[0:0];
  _RAND_593 = {1{`RANDOM}};
  uops_7_ctrl_is_std = _RAND_593[0:0];
  _RAND_594 = {1{`RANDOM}};
  uops_7_iw_state = _RAND_594[1:0];
  _RAND_595 = {1{`RANDOM}};
  uops_7_iw_p1_poisoned = _RAND_595[0:0];
  _RAND_596 = {1{`RANDOM}};
  uops_7_iw_p2_poisoned = _RAND_596[0:0];
  _RAND_597 = {1{`RANDOM}};
  uops_7_is_br = _RAND_597[0:0];
  _RAND_598 = {1{`RANDOM}};
  uops_7_is_jalr = _RAND_598[0:0];
  _RAND_599 = {1{`RANDOM}};
  uops_7_is_jal = _RAND_599[0:0];
  _RAND_600 = {1{`RANDOM}};
  uops_7_is_sfb = _RAND_600[0:0];
  _RAND_601 = {1{`RANDOM}};
  uops_7_br_mask = _RAND_601[11:0];
  _RAND_602 = {1{`RANDOM}};
  uops_7_br_tag = _RAND_602[3:0];
  _RAND_603 = {1{`RANDOM}};
  uops_7_ftq_idx = _RAND_603[4:0];
  _RAND_604 = {1{`RANDOM}};
  uops_7_edge_inst = _RAND_604[0:0];
  _RAND_605 = {1{`RANDOM}};
  uops_7_pc_lob = _RAND_605[5:0];
  _RAND_606 = {1{`RANDOM}};
  uops_7_taken = _RAND_606[0:0];
  _RAND_607 = {1{`RANDOM}};
  uops_7_imm_packed = _RAND_607[19:0];
  _RAND_608 = {1{`RANDOM}};
  uops_7_csr_addr = _RAND_608[11:0];
  _RAND_609 = {1{`RANDOM}};
  uops_7_rob_idx = _RAND_609[5:0];
  _RAND_610 = {1{`RANDOM}};
  uops_7_ldq_idx = _RAND_610[3:0];
  _RAND_611 = {1{`RANDOM}};
  uops_7_stq_idx = _RAND_611[3:0];
  _RAND_612 = {1{`RANDOM}};
  uops_7_rxq_idx = _RAND_612[1:0];
  _RAND_613 = {1{`RANDOM}};
  uops_7_pdst = _RAND_613[5:0];
  _RAND_614 = {1{`RANDOM}};
  uops_7_prs1 = _RAND_614[5:0];
  _RAND_615 = {1{`RANDOM}};
  uops_7_prs2 = _RAND_615[5:0];
  _RAND_616 = {1{`RANDOM}};
  uops_7_prs3 = _RAND_616[5:0];
  _RAND_617 = {1{`RANDOM}};
  uops_7_ppred = _RAND_617[4:0];
  _RAND_618 = {1{`RANDOM}};
  uops_7_prs1_busy = _RAND_618[0:0];
  _RAND_619 = {1{`RANDOM}};
  uops_7_prs2_busy = _RAND_619[0:0];
  _RAND_620 = {1{`RANDOM}};
  uops_7_prs3_busy = _RAND_620[0:0];
  _RAND_621 = {1{`RANDOM}};
  uops_7_ppred_busy = _RAND_621[0:0];
  _RAND_622 = {1{`RANDOM}};
  uops_7_stale_pdst = _RAND_622[5:0];
  _RAND_623 = {1{`RANDOM}};
  uops_7_exception = _RAND_623[0:0];
  _RAND_624 = {2{`RANDOM}};
  uops_7_exc_cause = _RAND_624[63:0];
  _RAND_625 = {1{`RANDOM}};
  uops_7_bypassable = _RAND_625[0:0];
  _RAND_626 = {1{`RANDOM}};
  uops_7_mem_cmd = _RAND_626[4:0];
  _RAND_627 = {1{`RANDOM}};
  uops_7_mem_size = _RAND_627[1:0];
  _RAND_628 = {1{`RANDOM}};
  uops_7_mem_signed = _RAND_628[0:0];
  _RAND_629 = {1{`RANDOM}};
  uops_7_is_fence = _RAND_629[0:0];
  _RAND_630 = {1{`RANDOM}};
  uops_7_is_fencei = _RAND_630[0:0];
  _RAND_631 = {1{`RANDOM}};
  uops_7_is_amo = _RAND_631[0:0];
  _RAND_632 = {1{`RANDOM}};
  uops_7_uses_ldq = _RAND_632[0:0];
  _RAND_633 = {1{`RANDOM}};
  uops_7_uses_stq = _RAND_633[0:0];
  _RAND_634 = {1{`RANDOM}};
  uops_7_is_sys_pc2epc = _RAND_634[0:0];
  _RAND_635 = {1{`RANDOM}};
  uops_7_is_unique = _RAND_635[0:0];
  _RAND_636 = {1{`RANDOM}};
  uops_7_flush_on_commit = _RAND_636[0:0];
  _RAND_637 = {1{`RANDOM}};
  uops_7_ldst_is_rs1 = _RAND_637[0:0];
  _RAND_638 = {1{`RANDOM}};
  uops_7_ldst = _RAND_638[5:0];
  _RAND_639 = {1{`RANDOM}};
  uops_7_lrs1 = _RAND_639[5:0];
  _RAND_640 = {1{`RANDOM}};
  uops_7_lrs2 = _RAND_640[5:0];
  _RAND_641 = {1{`RANDOM}};
  uops_7_lrs3 = _RAND_641[5:0];
  _RAND_642 = {1{`RANDOM}};
  uops_7_ldst_val = _RAND_642[0:0];
  _RAND_643 = {1{`RANDOM}};
  uops_7_dst_rtype = _RAND_643[1:0];
  _RAND_644 = {1{`RANDOM}};
  uops_7_lrs1_rtype = _RAND_644[1:0];
  _RAND_645 = {1{`RANDOM}};
  uops_7_lrs2_rtype = _RAND_645[1:0];
  _RAND_646 = {1{`RANDOM}};
  uops_7_frs3_en = _RAND_646[0:0];
  _RAND_647 = {1{`RANDOM}};
  uops_7_fp_val = _RAND_647[0:0];
  _RAND_648 = {1{`RANDOM}};
  uops_7_fp_single = _RAND_648[0:0];
  _RAND_649 = {1{`RANDOM}};
  uops_7_xcpt_pf_if = _RAND_649[0:0];
  _RAND_650 = {1{`RANDOM}};
  uops_7_xcpt_ae_if = _RAND_650[0:0];
  _RAND_651 = {1{`RANDOM}};
  uops_7_xcpt_ma_if = _RAND_651[0:0];
  _RAND_652 = {1{`RANDOM}};
  uops_7_bp_debug_if = _RAND_652[0:0];
  _RAND_653 = {1{`RANDOM}};
  uops_7_bp_xcpt_if = _RAND_653[0:0];
  _RAND_654 = {1{`RANDOM}};
  uops_7_debug_fsrc = _RAND_654[1:0];
  _RAND_655 = {1{`RANDOM}};
  uops_7_debug_tsrc = _RAND_655[1:0];
  _RAND_656 = {1{`RANDOM}};
  uops_8_uopc = _RAND_656[6:0];
  _RAND_657 = {1{`RANDOM}};
  uops_8_inst = _RAND_657[31:0];
  _RAND_658 = {1{`RANDOM}};
  uops_8_debug_inst = _RAND_658[31:0];
  _RAND_659 = {1{`RANDOM}};
  uops_8_is_rvc = _RAND_659[0:0];
  _RAND_660 = {2{`RANDOM}};
  uops_8_debug_pc = _RAND_660[39:0];
  _RAND_661 = {1{`RANDOM}};
  uops_8_iq_type = _RAND_661[2:0];
  _RAND_662 = {1{`RANDOM}};
  uops_8_fu_code = _RAND_662[9:0];
  _RAND_663 = {1{`RANDOM}};
  uops_8_ctrl_br_type = _RAND_663[3:0];
  _RAND_664 = {1{`RANDOM}};
  uops_8_ctrl_op1_sel = _RAND_664[1:0];
  _RAND_665 = {1{`RANDOM}};
  uops_8_ctrl_op2_sel = _RAND_665[2:0];
  _RAND_666 = {1{`RANDOM}};
  uops_8_ctrl_imm_sel = _RAND_666[2:0];
  _RAND_667 = {1{`RANDOM}};
  uops_8_ctrl_op_fcn = _RAND_667[3:0];
  _RAND_668 = {1{`RANDOM}};
  uops_8_ctrl_fcn_dw = _RAND_668[0:0];
  _RAND_669 = {1{`RANDOM}};
  uops_8_ctrl_csr_cmd = _RAND_669[2:0];
  _RAND_670 = {1{`RANDOM}};
  uops_8_ctrl_is_load = _RAND_670[0:0];
  _RAND_671 = {1{`RANDOM}};
  uops_8_ctrl_is_sta = _RAND_671[0:0];
  _RAND_672 = {1{`RANDOM}};
  uops_8_ctrl_is_std = _RAND_672[0:0];
  _RAND_673 = {1{`RANDOM}};
  uops_8_iw_state = _RAND_673[1:0];
  _RAND_674 = {1{`RANDOM}};
  uops_8_iw_p1_poisoned = _RAND_674[0:0];
  _RAND_675 = {1{`RANDOM}};
  uops_8_iw_p2_poisoned = _RAND_675[0:0];
  _RAND_676 = {1{`RANDOM}};
  uops_8_is_br = _RAND_676[0:0];
  _RAND_677 = {1{`RANDOM}};
  uops_8_is_jalr = _RAND_677[0:0];
  _RAND_678 = {1{`RANDOM}};
  uops_8_is_jal = _RAND_678[0:0];
  _RAND_679 = {1{`RANDOM}};
  uops_8_is_sfb = _RAND_679[0:0];
  _RAND_680 = {1{`RANDOM}};
  uops_8_br_mask = _RAND_680[11:0];
  _RAND_681 = {1{`RANDOM}};
  uops_8_br_tag = _RAND_681[3:0];
  _RAND_682 = {1{`RANDOM}};
  uops_8_ftq_idx = _RAND_682[4:0];
  _RAND_683 = {1{`RANDOM}};
  uops_8_edge_inst = _RAND_683[0:0];
  _RAND_684 = {1{`RANDOM}};
  uops_8_pc_lob = _RAND_684[5:0];
  _RAND_685 = {1{`RANDOM}};
  uops_8_taken = _RAND_685[0:0];
  _RAND_686 = {1{`RANDOM}};
  uops_8_imm_packed = _RAND_686[19:0];
  _RAND_687 = {1{`RANDOM}};
  uops_8_csr_addr = _RAND_687[11:0];
  _RAND_688 = {1{`RANDOM}};
  uops_8_rob_idx = _RAND_688[5:0];
  _RAND_689 = {1{`RANDOM}};
  uops_8_ldq_idx = _RAND_689[3:0];
  _RAND_690 = {1{`RANDOM}};
  uops_8_stq_idx = _RAND_690[3:0];
  _RAND_691 = {1{`RANDOM}};
  uops_8_rxq_idx = _RAND_691[1:0];
  _RAND_692 = {1{`RANDOM}};
  uops_8_pdst = _RAND_692[5:0];
  _RAND_693 = {1{`RANDOM}};
  uops_8_prs1 = _RAND_693[5:0];
  _RAND_694 = {1{`RANDOM}};
  uops_8_prs2 = _RAND_694[5:0];
  _RAND_695 = {1{`RANDOM}};
  uops_8_prs3 = _RAND_695[5:0];
  _RAND_696 = {1{`RANDOM}};
  uops_8_ppred = _RAND_696[4:0];
  _RAND_697 = {1{`RANDOM}};
  uops_8_prs1_busy = _RAND_697[0:0];
  _RAND_698 = {1{`RANDOM}};
  uops_8_prs2_busy = _RAND_698[0:0];
  _RAND_699 = {1{`RANDOM}};
  uops_8_prs3_busy = _RAND_699[0:0];
  _RAND_700 = {1{`RANDOM}};
  uops_8_ppred_busy = _RAND_700[0:0];
  _RAND_701 = {1{`RANDOM}};
  uops_8_stale_pdst = _RAND_701[5:0];
  _RAND_702 = {1{`RANDOM}};
  uops_8_exception = _RAND_702[0:0];
  _RAND_703 = {2{`RANDOM}};
  uops_8_exc_cause = _RAND_703[63:0];
  _RAND_704 = {1{`RANDOM}};
  uops_8_bypassable = _RAND_704[0:0];
  _RAND_705 = {1{`RANDOM}};
  uops_8_mem_cmd = _RAND_705[4:0];
  _RAND_706 = {1{`RANDOM}};
  uops_8_mem_size = _RAND_706[1:0];
  _RAND_707 = {1{`RANDOM}};
  uops_8_mem_signed = _RAND_707[0:0];
  _RAND_708 = {1{`RANDOM}};
  uops_8_is_fence = _RAND_708[0:0];
  _RAND_709 = {1{`RANDOM}};
  uops_8_is_fencei = _RAND_709[0:0];
  _RAND_710 = {1{`RANDOM}};
  uops_8_is_amo = _RAND_710[0:0];
  _RAND_711 = {1{`RANDOM}};
  uops_8_uses_ldq = _RAND_711[0:0];
  _RAND_712 = {1{`RANDOM}};
  uops_8_uses_stq = _RAND_712[0:0];
  _RAND_713 = {1{`RANDOM}};
  uops_8_is_sys_pc2epc = _RAND_713[0:0];
  _RAND_714 = {1{`RANDOM}};
  uops_8_is_unique = _RAND_714[0:0];
  _RAND_715 = {1{`RANDOM}};
  uops_8_flush_on_commit = _RAND_715[0:0];
  _RAND_716 = {1{`RANDOM}};
  uops_8_ldst_is_rs1 = _RAND_716[0:0];
  _RAND_717 = {1{`RANDOM}};
  uops_8_ldst = _RAND_717[5:0];
  _RAND_718 = {1{`RANDOM}};
  uops_8_lrs1 = _RAND_718[5:0];
  _RAND_719 = {1{`RANDOM}};
  uops_8_lrs2 = _RAND_719[5:0];
  _RAND_720 = {1{`RANDOM}};
  uops_8_lrs3 = _RAND_720[5:0];
  _RAND_721 = {1{`RANDOM}};
  uops_8_ldst_val = _RAND_721[0:0];
  _RAND_722 = {1{`RANDOM}};
  uops_8_dst_rtype = _RAND_722[1:0];
  _RAND_723 = {1{`RANDOM}};
  uops_8_lrs1_rtype = _RAND_723[1:0];
  _RAND_724 = {1{`RANDOM}};
  uops_8_lrs2_rtype = _RAND_724[1:0];
  _RAND_725 = {1{`RANDOM}};
  uops_8_frs3_en = _RAND_725[0:0];
  _RAND_726 = {1{`RANDOM}};
  uops_8_fp_val = _RAND_726[0:0];
  _RAND_727 = {1{`RANDOM}};
  uops_8_fp_single = _RAND_727[0:0];
  _RAND_728 = {1{`RANDOM}};
  uops_8_xcpt_pf_if = _RAND_728[0:0];
  _RAND_729 = {1{`RANDOM}};
  uops_8_xcpt_ae_if = _RAND_729[0:0];
  _RAND_730 = {1{`RANDOM}};
  uops_8_xcpt_ma_if = _RAND_730[0:0];
  _RAND_731 = {1{`RANDOM}};
  uops_8_bp_debug_if = _RAND_731[0:0];
  _RAND_732 = {1{`RANDOM}};
  uops_8_bp_xcpt_if = _RAND_732[0:0];
  _RAND_733 = {1{`RANDOM}};
  uops_8_debug_fsrc = _RAND_733[1:0];
  _RAND_734 = {1{`RANDOM}};
  uops_8_debug_tsrc = _RAND_734[1:0];
  _RAND_735 = {1{`RANDOM}};
  uops_9_uopc = _RAND_735[6:0];
  _RAND_736 = {1{`RANDOM}};
  uops_9_inst = _RAND_736[31:0];
  _RAND_737 = {1{`RANDOM}};
  uops_9_debug_inst = _RAND_737[31:0];
  _RAND_738 = {1{`RANDOM}};
  uops_9_is_rvc = _RAND_738[0:0];
  _RAND_739 = {2{`RANDOM}};
  uops_9_debug_pc = _RAND_739[39:0];
  _RAND_740 = {1{`RANDOM}};
  uops_9_iq_type = _RAND_740[2:0];
  _RAND_741 = {1{`RANDOM}};
  uops_9_fu_code = _RAND_741[9:0];
  _RAND_742 = {1{`RANDOM}};
  uops_9_ctrl_br_type = _RAND_742[3:0];
  _RAND_743 = {1{`RANDOM}};
  uops_9_ctrl_op1_sel = _RAND_743[1:0];
  _RAND_744 = {1{`RANDOM}};
  uops_9_ctrl_op2_sel = _RAND_744[2:0];
  _RAND_745 = {1{`RANDOM}};
  uops_9_ctrl_imm_sel = _RAND_745[2:0];
  _RAND_746 = {1{`RANDOM}};
  uops_9_ctrl_op_fcn = _RAND_746[3:0];
  _RAND_747 = {1{`RANDOM}};
  uops_9_ctrl_fcn_dw = _RAND_747[0:0];
  _RAND_748 = {1{`RANDOM}};
  uops_9_ctrl_csr_cmd = _RAND_748[2:0];
  _RAND_749 = {1{`RANDOM}};
  uops_9_ctrl_is_load = _RAND_749[0:0];
  _RAND_750 = {1{`RANDOM}};
  uops_9_ctrl_is_sta = _RAND_750[0:0];
  _RAND_751 = {1{`RANDOM}};
  uops_9_ctrl_is_std = _RAND_751[0:0];
  _RAND_752 = {1{`RANDOM}};
  uops_9_iw_state = _RAND_752[1:0];
  _RAND_753 = {1{`RANDOM}};
  uops_9_iw_p1_poisoned = _RAND_753[0:0];
  _RAND_754 = {1{`RANDOM}};
  uops_9_iw_p2_poisoned = _RAND_754[0:0];
  _RAND_755 = {1{`RANDOM}};
  uops_9_is_br = _RAND_755[0:0];
  _RAND_756 = {1{`RANDOM}};
  uops_9_is_jalr = _RAND_756[0:0];
  _RAND_757 = {1{`RANDOM}};
  uops_9_is_jal = _RAND_757[0:0];
  _RAND_758 = {1{`RANDOM}};
  uops_9_is_sfb = _RAND_758[0:0];
  _RAND_759 = {1{`RANDOM}};
  uops_9_br_mask = _RAND_759[11:0];
  _RAND_760 = {1{`RANDOM}};
  uops_9_br_tag = _RAND_760[3:0];
  _RAND_761 = {1{`RANDOM}};
  uops_9_ftq_idx = _RAND_761[4:0];
  _RAND_762 = {1{`RANDOM}};
  uops_9_edge_inst = _RAND_762[0:0];
  _RAND_763 = {1{`RANDOM}};
  uops_9_pc_lob = _RAND_763[5:0];
  _RAND_764 = {1{`RANDOM}};
  uops_9_taken = _RAND_764[0:0];
  _RAND_765 = {1{`RANDOM}};
  uops_9_imm_packed = _RAND_765[19:0];
  _RAND_766 = {1{`RANDOM}};
  uops_9_csr_addr = _RAND_766[11:0];
  _RAND_767 = {1{`RANDOM}};
  uops_9_rob_idx = _RAND_767[5:0];
  _RAND_768 = {1{`RANDOM}};
  uops_9_ldq_idx = _RAND_768[3:0];
  _RAND_769 = {1{`RANDOM}};
  uops_9_stq_idx = _RAND_769[3:0];
  _RAND_770 = {1{`RANDOM}};
  uops_9_rxq_idx = _RAND_770[1:0];
  _RAND_771 = {1{`RANDOM}};
  uops_9_pdst = _RAND_771[5:0];
  _RAND_772 = {1{`RANDOM}};
  uops_9_prs1 = _RAND_772[5:0];
  _RAND_773 = {1{`RANDOM}};
  uops_9_prs2 = _RAND_773[5:0];
  _RAND_774 = {1{`RANDOM}};
  uops_9_prs3 = _RAND_774[5:0];
  _RAND_775 = {1{`RANDOM}};
  uops_9_ppred = _RAND_775[4:0];
  _RAND_776 = {1{`RANDOM}};
  uops_9_prs1_busy = _RAND_776[0:0];
  _RAND_777 = {1{`RANDOM}};
  uops_9_prs2_busy = _RAND_777[0:0];
  _RAND_778 = {1{`RANDOM}};
  uops_9_prs3_busy = _RAND_778[0:0];
  _RAND_779 = {1{`RANDOM}};
  uops_9_ppred_busy = _RAND_779[0:0];
  _RAND_780 = {1{`RANDOM}};
  uops_9_stale_pdst = _RAND_780[5:0];
  _RAND_781 = {1{`RANDOM}};
  uops_9_exception = _RAND_781[0:0];
  _RAND_782 = {2{`RANDOM}};
  uops_9_exc_cause = _RAND_782[63:0];
  _RAND_783 = {1{`RANDOM}};
  uops_9_bypassable = _RAND_783[0:0];
  _RAND_784 = {1{`RANDOM}};
  uops_9_mem_cmd = _RAND_784[4:0];
  _RAND_785 = {1{`RANDOM}};
  uops_9_mem_size = _RAND_785[1:0];
  _RAND_786 = {1{`RANDOM}};
  uops_9_mem_signed = _RAND_786[0:0];
  _RAND_787 = {1{`RANDOM}};
  uops_9_is_fence = _RAND_787[0:0];
  _RAND_788 = {1{`RANDOM}};
  uops_9_is_fencei = _RAND_788[0:0];
  _RAND_789 = {1{`RANDOM}};
  uops_9_is_amo = _RAND_789[0:0];
  _RAND_790 = {1{`RANDOM}};
  uops_9_uses_ldq = _RAND_790[0:0];
  _RAND_791 = {1{`RANDOM}};
  uops_9_uses_stq = _RAND_791[0:0];
  _RAND_792 = {1{`RANDOM}};
  uops_9_is_sys_pc2epc = _RAND_792[0:0];
  _RAND_793 = {1{`RANDOM}};
  uops_9_is_unique = _RAND_793[0:0];
  _RAND_794 = {1{`RANDOM}};
  uops_9_flush_on_commit = _RAND_794[0:0];
  _RAND_795 = {1{`RANDOM}};
  uops_9_ldst_is_rs1 = _RAND_795[0:0];
  _RAND_796 = {1{`RANDOM}};
  uops_9_ldst = _RAND_796[5:0];
  _RAND_797 = {1{`RANDOM}};
  uops_9_lrs1 = _RAND_797[5:0];
  _RAND_798 = {1{`RANDOM}};
  uops_9_lrs2 = _RAND_798[5:0];
  _RAND_799 = {1{`RANDOM}};
  uops_9_lrs3 = _RAND_799[5:0];
  _RAND_800 = {1{`RANDOM}};
  uops_9_ldst_val = _RAND_800[0:0];
  _RAND_801 = {1{`RANDOM}};
  uops_9_dst_rtype = _RAND_801[1:0];
  _RAND_802 = {1{`RANDOM}};
  uops_9_lrs1_rtype = _RAND_802[1:0];
  _RAND_803 = {1{`RANDOM}};
  uops_9_lrs2_rtype = _RAND_803[1:0];
  _RAND_804 = {1{`RANDOM}};
  uops_9_frs3_en = _RAND_804[0:0];
  _RAND_805 = {1{`RANDOM}};
  uops_9_fp_val = _RAND_805[0:0];
  _RAND_806 = {1{`RANDOM}};
  uops_9_fp_single = _RAND_806[0:0];
  _RAND_807 = {1{`RANDOM}};
  uops_9_xcpt_pf_if = _RAND_807[0:0];
  _RAND_808 = {1{`RANDOM}};
  uops_9_xcpt_ae_if = _RAND_808[0:0];
  _RAND_809 = {1{`RANDOM}};
  uops_9_xcpt_ma_if = _RAND_809[0:0];
  _RAND_810 = {1{`RANDOM}};
  uops_9_bp_debug_if = _RAND_810[0:0];
  _RAND_811 = {1{`RANDOM}};
  uops_9_bp_xcpt_if = _RAND_811[0:0];
  _RAND_812 = {1{`RANDOM}};
  uops_9_debug_fsrc = _RAND_812[1:0];
  _RAND_813 = {1{`RANDOM}};
  uops_9_debug_tsrc = _RAND_813[1:0];
  _RAND_814 = {1{`RANDOM}};
  uops_10_uopc = _RAND_814[6:0];
  _RAND_815 = {1{`RANDOM}};
  uops_10_inst = _RAND_815[31:0];
  _RAND_816 = {1{`RANDOM}};
  uops_10_debug_inst = _RAND_816[31:0];
  _RAND_817 = {1{`RANDOM}};
  uops_10_is_rvc = _RAND_817[0:0];
  _RAND_818 = {2{`RANDOM}};
  uops_10_debug_pc = _RAND_818[39:0];
  _RAND_819 = {1{`RANDOM}};
  uops_10_iq_type = _RAND_819[2:0];
  _RAND_820 = {1{`RANDOM}};
  uops_10_fu_code = _RAND_820[9:0];
  _RAND_821 = {1{`RANDOM}};
  uops_10_ctrl_br_type = _RAND_821[3:0];
  _RAND_822 = {1{`RANDOM}};
  uops_10_ctrl_op1_sel = _RAND_822[1:0];
  _RAND_823 = {1{`RANDOM}};
  uops_10_ctrl_op2_sel = _RAND_823[2:0];
  _RAND_824 = {1{`RANDOM}};
  uops_10_ctrl_imm_sel = _RAND_824[2:0];
  _RAND_825 = {1{`RANDOM}};
  uops_10_ctrl_op_fcn = _RAND_825[3:0];
  _RAND_826 = {1{`RANDOM}};
  uops_10_ctrl_fcn_dw = _RAND_826[0:0];
  _RAND_827 = {1{`RANDOM}};
  uops_10_ctrl_csr_cmd = _RAND_827[2:0];
  _RAND_828 = {1{`RANDOM}};
  uops_10_ctrl_is_load = _RAND_828[0:0];
  _RAND_829 = {1{`RANDOM}};
  uops_10_ctrl_is_sta = _RAND_829[0:0];
  _RAND_830 = {1{`RANDOM}};
  uops_10_ctrl_is_std = _RAND_830[0:0];
  _RAND_831 = {1{`RANDOM}};
  uops_10_iw_state = _RAND_831[1:0];
  _RAND_832 = {1{`RANDOM}};
  uops_10_iw_p1_poisoned = _RAND_832[0:0];
  _RAND_833 = {1{`RANDOM}};
  uops_10_iw_p2_poisoned = _RAND_833[0:0];
  _RAND_834 = {1{`RANDOM}};
  uops_10_is_br = _RAND_834[0:0];
  _RAND_835 = {1{`RANDOM}};
  uops_10_is_jalr = _RAND_835[0:0];
  _RAND_836 = {1{`RANDOM}};
  uops_10_is_jal = _RAND_836[0:0];
  _RAND_837 = {1{`RANDOM}};
  uops_10_is_sfb = _RAND_837[0:0];
  _RAND_838 = {1{`RANDOM}};
  uops_10_br_mask = _RAND_838[11:0];
  _RAND_839 = {1{`RANDOM}};
  uops_10_br_tag = _RAND_839[3:0];
  _RAND_840 = {1{`RANDOM}};
  uops_10_ftq_idx = _RAND_840[4:0];
  _RAND_841 = {1{`RANDOM}};
  uops_10_edge_inst = _RAND_841[0:0];
  _RAND_842 = {1{`RANDOM}};
  uops_10_pc_lob = _RAND_842[5:0];
  _RAND_843 = {1{`RANDOM}};
  uops_10_taken = _RAND_843[0:0];
  _RAND_844 = {1{`RANDOM}};
  uops_10_imm_packed = _RAND_844[19:0];
  _RAND_845 = {1{`RANDOM}};
  uops_10_csr_addr = _RAND_845[11:0];
  _RAND_846 = {1{`RANDOM}};
  uops_10_rob_idx = _RAND_846[5:0];
  _RAND_847 = {1{`RANDOM}};
  uops_10_ldq_idx = _RAND_847[3:0];
  _RAND_848 = {1{`RANDOM}};
  uops_10_stq_idx = _RAND_848[3:0];
  _RAND_849 = {1{`RANDOM}};
  uops_10_rxq_idx = _RAND_849[1:0];
  _RAND_850 = {1{`RANDOM}};
  uops_10_pdst = _RAND_850[5:0];
  _RAND_851 = {1{`RANDOM}};
  uops_10_prs1 = _RAND_851[5:0];
  _RAND_852 = {1{`RANDOM}};
  uops_10_prs2 = _RAND_852[5:0];
  _RAND_853 = {1{`RANDOM}};
  uops_10_prs3 = _RAND_853[5:0];
  _RAND_854 = {1{`RANDOM}};
  uops_10_ppred = _RAND_854[4:0];
  _RAND_855 = {1{`RANDOM}};
  uops_10_prs1_busy = _RAND_855[0:0];
  _RAND_856 = {1{`RANDOM}};
  uops_10_prs2_busy = _RAND_856[0:0];
  _RAND_857 = {1{`RANDOM}};
  uops_10_prs3_busy = _RAND_857[0:0];
  _RAND_858 = {1{`RANDOM}};
  uops_10_ppred_busy = _RAND_858[0:0];
  _RAND_859 = {1{`RANDOM}};
  uops_10_stale_pdst = _RAND_859[5:0];
  _RAND_860 = {1{`RANDOM}};
  uops_10_exception = _RAND_860[0:0];
  _RAND_861 = {2{`RANDOM}};
  uops_10_exc_cause = _RAND_861[63:0];
  _RAND_862 = {1{`RANDOM}};
  uops_10_bypassable = _RAND_862[0:0];
  _RAND_863 = {1{`RANDOM}};
  uops_10_mem_cmd = _RAND_863[4:0];
  _RAND_864 = {1{`RANDOM}};
  uops_10_mem_size = _RAND_864[1:0];
  _RAND_865 = {1{`RANDOM}};
  uops_10_mem_signed = _RAND_865[0:0];
  _RAND_866 = {1{`RANDOM}};
  uops_10_is_fence = _RAND_866[0:0];
  _RAND_867 = {1{`RANDOM}};
  uops_10_is_fencei = _RAND_867[0:0];
  _RAND_868 = {1{`RANDOM}};
  uops_10_is_amo = _RAND_868[0:0];
  _RAND_869 = {1{`RANDOM}};
  uops_10_uses_ldq = _RAND_869[0:0];
  _RAND_870 = {1{`RANDOM}};
  uops_10_uses_stq = _RAND_870[0:0];
  _RAND_871 = {1{`RANDOM}};
  uops_10_is_sys_pc2epc = _RAND_871[0:0];
  _RAND_872 = {1{`RANDOM}};
  uops_10_is_unique = _RAND_872[0:0];
  _RAND_873 = {1{`RANDOM}};
  uops_10_flush_on_commit = _RAND_873[0:0];
  _RAND_874 = {1{`RANDOM}};
  uops_10_ldst_is_rs1 = _RAND_874[0:0];
  _RAND_875 = {1{`RANDOM}};
  uops_10_ldst = _RAND_875[5:0];
  _RAND_876 = {1{`RANDOM}};
  uops_10_lrs1 = _RAND_876[5:0];
  _RAND_877 = {1{`RANDOM}};
  uops_10_lrs2 = _RAND_877[5:0];
  _RAND_878 = {1{`RANDOM}};
  uops_10_lrs3 = _RAND_878[5:0];
  _RAND_879 = {1{`RANDOM}};
  uops_10_ldst_val = _RAND_879[0:0];
  _RAND_880 = {1{`RANDOM}};
  uops_10_dst_rtype = _RAND_880[1:0];
  _RAND_881 = {1{`RANDOM}};
  uops_10_lrs1_rtype = _RAND_881[1:0];
  _RAND_882 = {1{`RANDOM}};
  uops_10_lrs2_rtype = _RAND_882[1:0];
  _RAND_883 = {1{`RANDOM}};
  uops_10_frs3_en = _RAND_883[0:0];
  _RAND_884 = {1{`RANDOM}};
  uops_10_fp_val = _RAND_884[0:0];
  _RAND_885 = {1{`RANDOM}};
  uops_10_fp_single = _RAND_885[0:0];
  _RAND_886 = {1{`RANDOM}};
  uops_10_xcpt_pf_if = _RAND_886[0:0];
  _RAND_887 = {1{`RANDOM}};
  uops_10_xcpt_ae_if = _RAND_887[0:0];
  _RAND_888 = {1{`RANDOM}};
  uops_10_xcpt_ma_if = _RAND_888[0:0];
  _RAND_889 = {1{`RANDOM}};
  uops_10_bp_debug_if = _RAND_889[0:0];
  _RAND_890 = {1{`RANDOM}};
  uops_10_bp_xcpt_if = _RAND_890[0:0];
  _RAND_891 = {1{`RANDOM}};
  uops_10_debug_fsrc = _RAND_891[1:0];
  _RAND_892 = {1{`RANDOM}};
  uops_10_debug_tsrc = _RAND_892[1:0];
  _RAND_893 = {1{`RANDOM}};
  uops_11_uopc = _RAND_893[6:0];
  _RAND_894 = {1{`RANDOM}};
  uops_11_inst = _RAND_894[31:0];
  _RAND_895 = {1{`RANDOM}};
  uops_11_debug_inst = _RAND_895[31:0];
  _RAND_896 = {1{`RANDOM}};
  uops_11_is_rvc = _RAND_896[0:0];
  _RAND_897 = {2{`RANDOM}};
  uops_11_debug_pc = _RAND_897[39:0];
  _RAND_898 = {1{`RANDOM}};
  uops_11_iq_type = _RAND_898[2:0];
  _RAND_899 = {1{`RANDOM}};
  uops_11_fu_code = _RAND_899[9:0];
  _RAND_900 = {1{`RANDOM}};
  uops_11_ctrl_br_type = _RAND_900[3:0];
  _RAND_901 = {1{`RANDOM}};
  uops_11_ctrl_op1_sel = _RAND_901[1:0];
  _RAND_902 = {1{`RANDOM}};
  uops_11_ctrl_op2_sel = _RAND_902[2:0];
  _RAND_903 = {1{`RANDOM}};
  uops_11_ctrl_imm_sel = _RAND_903[2:0];
  _RAND_904 = {1{`RANDOM}};
  uops_11_ctrl_op_fcn = _RAND_904[3:0];
  _RAND_905 = {1{`RANDOM}};
  uops_11_ctrl_fcn_dw = _RAND_905[0:0];
  _RAND_906 = {1{`RANDOM}};
  uops_11_ctrl_csr_cmd = _RAND_906[2:0];
  _RAND_907 = {1{`RANDOM}};
  uops_11_ctrl_is_load = _RAND_907[0:0];
  _RAND_908 = {1{`RANDOM}};
  uops_11_ctrl_is_sta = _RAND_908[0:0];
  _RAND_909 = {1{`RANDOM}};
  uops_11_ctrl_is_std = _RAND_909[0:0];
  _RAND_910 = {1{`RANDOM}};
  uops_11_iw_state = _RAND_910[1:0];
  _RAND_911 = {1{`RANDOM}};
  uops_11_iw_p1_poisoned = _RAND_911[0:0];
  _RAND_912 = {1{`RANDOM}};
  uops_11_iw_p2_poisoned = _RAND_912[0:0];
  _RAND_913 = {1{`RANDOM}};
  uops_11_is_br = _RAND_913[0:0];
  _RAND_914 = {1{`RANDOM}};
  uops_11_is_jalr = _RAND_914[0:0];
  _RAND_915 = {1{`RANDOM}};
  uops_11_is_jal = _RAND_915[0:0];
  _RAND_916 = {1{`RANDOM}};
  uops_11_is_sfb = _RAND_916[0:0];
  _RAND_917 = {1{`RANDOM}};
  uops_11_br_mask = _RAND_917[11:0];
  _RAND_918 = {1{`RANDOM}};
  uops_11_br_tag = _RAND_918[3:0];
  _RAND_919 = {1{`RANDOM}};
  uops_11_ftq_idx = _RAND_919[4:0];
  _RAND_920 = {1{`RANDOM}};
  uops_11_edge_inst = _RAND_920[0:0];
  _RAND_921 = {1{`RANDOM}};
  uops_11_pc_lob = _RAND_921[5:0];
  _RAND_922 = {1{`RANDOM}};
  uops_11_taken = _RAND_922[0:0];
  _RAND_923 = {1{`RANDOM}};
  uops_11_imm_packed = _RAND_923[19:0];
  _RAND_924 = {1{`RANDOM}};
  uops_11_csr_addr = _RAND_924[11:0];
  _RAND_925 = {1{`RANDOM}};
  uops_11_rob_idx = _RAND_925[5:0];
  _RAND_926 = {1{`RANDOM}};
  uops_11_ldq_idx = _RAND_926[3:0];
  _RAND_927 = {1{`RANDOM}};
  uops_11_stq_idx = _RAND_927[3:0];
  _RAND_928 = {1{`RANDOM}};
  uops_11_rxq_idx = _RAND_928[1:0];
  _RAND_929 = {1{`RANDOM}};
  uops_11_pdst = _RAND_929[5:0];
  _RAND_930 = {1{`RANDOM}};
  uops_11_prs1 = _RAND_930[5:0];
  _RAND_931 = {1{`RANDOM}};
  uops_11_prs2 = _RAND_931[5:0];
  _RAND_932 = {1{`RANDOM}};
  uops_11_prs3 = _RAND_932[5:0];
  _RAND_933 = {1{`RANDOM}};
  uops_11_ppred = _RAND_933[4:0];
  _RAND_934 = {1{`RANDOM}};
  uops_11_prs1_busy = _RAND_934[0:0];
  _RAND_935 = {1{`RANDOM}};
  uops_11_prs2_busy = _RAND_935[0:0];
  _RAND_936 = {1{`RANDOM}};
  uops_11_prs3_busy = _RAND_936[0:0];
  _RAND_937 = {1{`RANDOM}};
  uops_11_ppred_busy = _RAND_937[0:0];
  _RAND_938 = {1{`RANDOM}};
  uops_11_stale_pdst = _RAND_938[5:0];
  _RAND_939 = {1{`RANDOM}};
  uops_11_exception = _RAND_939[0:0];
  _RAND_940 = {2{`RANDOM}};
  uops_11_exc_cause = _RAND_940[63:0];
  _RAND_941 = {1{`RANDOM}};
  uops_11_bypassable = _RAND_941[0:0];
  _RAND_942 = {1{`RANDOM}};
  uops_11_mem_cmd = _RAND_942[4:0];
  _RAND_943 = {1{`RANDOM}};
  uops_11_mem_size = _RAND_943[1:0];
  _RAND_944 = {1{`RANDOM}};
  uops_11_mem_signed = _RAND_944[0:0];
  _RAND_945 = {1{`RANDOM}};
  uops_11_is_fence = _RAND_945[0:0];
  _RAND_946 = {1{`RANDOM}};
  uops_11_is_fencei = _RAND_946[0:0];
  _RAND_947 = {1{`RANDOM}};
  uops_11_is_amo = _RAND_947[0:0];
  _RAND_948 = {1{`RANDOM}};
  uops_11_uses_ldq = _RAND_948[0:0];
  _RAND_949 = {1{`RANDOM}};
  uops_11_uses_stq = _RAND_949[0:0];
  _RAND_950 = {1{`RANDOM}};
  uops_11_is_sys_pc2epc = _RAND_950[0:0];
  _RAND_951 = {1{`RANDOM}};
  uops_11_is_unique = _RAND_951[0:0];
  _RAND_952 = {1{`RANDOM}};
  uops_11_flush_on_commit = _RAND_952[0:0];
  _RAND_953 = {1{`RANDOM}};
  uops_11_ldst_is_rs1 = _RAND_953[0:0];
  _RAND_954 = {1{`RANDOM}};
  uops_11_ldst = _RAND_954[5:0];
  _RAND_955 = {1{`RANDOM}};
  uops_11_lrs1 = _RAND_955[5:0];
  _RAND_956 = {1{`RANDOM}};
  uops_11_lrs2 = _RAND_956[5:0];
  _RAND_957 = {1{`RANDOM}};
  uops_11_lrs3 = _RAND_957[5:0];
  _RAND_958 = {1{`RANDOM}};
  uops_11_ldst_val = _RAND_958[0:0];
  _RAND_959 = {1{`RANDOM}};
  uops_11_dst_rtype = _RAND_959[1:0];
  _RAND_960 = {1{`RANDOM}};
  uops_11_lrs1_rtype = _RAND_960[1:0];
  _RAND_961 = {1{`RANDOM}};
  uops_11_lrs2_rtype = _RAND_961[1:0];
  _RAND_962 = {1{`RANDOM}};
  uops_11_frs3_en = _RAND_962[0:0];
  _RAND_963 = {1{`RANDOM}};
  uops_11_fp_val = _RAND_963[0:0];
  _RAND_964 = {1{`RANDOM}};
  uops_11_fp_single = _RAND_964[0:0];
  _RAND_965 = {1{`RANDOM}};
  uops_11_xcpt_pf_if = _RAND_965[0:0];
  _RAND_966 = {1{`RANDOM}};
  uops_11_xcpt_ae_if = _RAND_966[0:0];
  _RAND_967 = {1{`RANDOM}};
  uops_11_xcpt_ma_if = _RAND_967[0:0];
  _RAND_968 = {1{`RANDOM}};
  uops_11_bp_debug_if = _RAND_968[0:0];
  _RAND_969 = {1{`RANDOM}};
  uops_11_bp_xcpt_if = _RAND_969[0:0];
  _RAND_970 = {1{`RANDOM}};
  uops_11_debug_fsrc = _RAND_970[1:0];
  _RAND_971 = {1{`RANDOM}};
  uops_11_debug_tsrc = _RAND_971[1:0];
  _RAND_972 = {1{`RANDOM}};
  uops_12_uopc = _RAND_972[6:0];
  _RAND_973 = {1{`RANDOM}};
  uops_12_inst = _RAND_973[31:0];
  _RAND_974 = {1{`RANDOM}};
  uops_12_debug_inst = _RAND_974[31:0];
  _RAND_975 = {1{`RANDOM}};
  uops_12_is_rvc = _RAND_975[0:0];
  _RAND_976 = {2{`RANDOM}};
  uops_12_debug_pc = _RAND_976[39:0];
  _RAND_977 = {1{`RANDOM}};
  uops_12_iq_type = _RAND_977[2:0];
  _RAND_978 = {1{`RANDOM}};
  uops_12_fu_code = _RAND_978[9:0];
  _RAND_979 = {1{`RANDOM}};
  uops_12_ctrl_br_type = _RAND_979[3:0];
  _RAND_980 = {1{`RANDOM}};
  uops_12_ctrl_op1_sel = _RAND_980[1:0];
  _RAND_981 = {1{`RANDOM}};
  uops_12_ctrl_op2_sel = _RAND_981[2:0];
  _RAND_982 = {1{`RANDOM}};
  uops_12_ctrl_imm_sel = _RAND_982[2:0];
  _RAND_983 = {1{`RANDOM}};
  uops_12_ctrl_op_fcn = _RAND_983[3:0];
  _RAND_984 = {1{`RANDOM}};
  uops_12_ctrl_fcn_dw = _RAND_984[0:0];
  _RAND_985 = {1{`RANDOM}};
  uops_12_ctrl_csr_cmd = _RAND_985[2:0];
  _RAND_986 = {1{`RANDOM}};
  uops_12_ctrl_is_load = _RAND_986[0:0];
  _RAND_987 = {1{`RANDOM}};
  uops_12_ctrl_is_sta = _RAND_987[0:0];
  _RAND_988 = {1{`RANDOM}};
  uops_12_ctrl_is_std = _RAND_988[0:0];
  _RAND_989 = {1{`RANDOM}};
  uops_12_iw_state = _RAND_989[1:0];
  _RAND_990 = {1{`RANDOM}};
  uops_12_iw_p1_poisoned = _RAND_990[0:0];
  _RAND_991 = {1{`RANDOM}};
  uops_12_iw_p2_poisoned = _RAND_991[0:0];
  _RAND_992 = {1{`RANDOM}};
  uops_12_is_br = _RAND_992[0:0];
  _RAND_993 = {1{`RANDOM}};
  uops_12_is_jalr = _RAND_993[0:0];
  _RAND_994 = {1{`RANDOM}};
  uops_12_is_jal = _RAND_994[0:0];
  _RAND_995 = {1{`RANDOM}};
  uops_12_is_sfb = _RAND_995[0:0];
  _RAND_996 = {1{`RANDOM}};
  uops_12_br_mask = _RAND_996[11:0];
  _RAND_997 = {1{`RANDOM}};
  uops_12_br_tag = _RAND_997[3:0];
  _RAND_998 = {1{`RANDOM}};
  uops_12_ftq_idx = _RAND_998[4:0];
  _RAND_999 = {1{`RANDOM}};
  uops_12_edge_inst = _RAND_999[0:0];
  _RAND_1000 = {1{`RANDOM}};
  uops_12_pc_lob = _RAND_1000[5:0];
  _RAND_1001 = {1{`RANDOM}};
  uops_12_taken = _RAND_1001[0:0];
  _RAND_1002 = {1{`RANDOM}};
  uops_12_imm_packed = _RAND_1002[19:0];
  _RAND_1003 = {1{`RANDOM}};
  uops_12_csr_addr = _RAND_1003[11:0];
  _RAND_1004 = {1{`RANDOM}};
  uops_12_rob_idx = _RAND_1004[5:0];
  _RAND_1005 = {1{`RANDOM}};
  uops_12_ldq_idx = _RAND_1005[3:0];
  _RAND_1006 = {1{`RANDOM}};
  uops_12_stq_idx = _RAND_1006[3:0];
  _RAND_1007 = {1{`RANDOM}};
  uops_12_rxq_idx = _RAND_1007[1:0];
  _RAND_1008 = {1{`RANDOM}};
  uops_12_pdst = _RAND_1008[5:0];
  _RAND_1009 = {1{`RANDOM}};
  uops_12_prs1 = _RAND_1009[5:0];
  _RAND_1010 = {1{`RANDOM}};
  uops_12_prs2 = _RAND_1010[5:0];
  _RAND_1011 = {1{`RANDOM}};
  uops_12_prs3 = _RAND_1011[5:0];
  _RAND_1012 = {1{`RANDOM}};
  uops_12_ppred = _RAND_1012[4:0];
  _RAND_1013 = {1{`RANDOM}};
  uops_12_prs1_busy = _RAND_1013[0:0];
  _RAND_1014 = {1{`RANDOM}};
  uops_12_prs2_busy = _RAND_1014[0:0];
  _RAND_1015 = {1{`RANDOM}};
  uops_12_prs3_busy = _RAND_1015[0:0];
  _RAND_1016 = {1{`RANDOM}};
  uops_12_ppred_busy = _RAND_1016[0:0];
  _RAND_1017 = {1{`RANDOM}};
  uops_12_stale_pdst = _RAND_1017[5:0];
  _RAND_1018 = {1{`RANDOM}};
  uops_12_exception = _RAND_1018[0:0];
  _RAND_1019 = {2{`RANDOM}};
  uops_12_exc_cause = _RAND_1019[63:0];
  _RAND_1020 = {1{`RANDOM}};
  uops_12_bypassable = _RAND_1020[0:0];
  _RAND_1021 = {1{`RANDOM}};
  uops_12_mem_cmd = _RAND_1021[4:0];
  _RAND_1022 = {1{`RANDOM}};
  uops_12_mem_size = _RAND_1022[1:0];
  _RAND_1023 = {1{`RANDOM}};
  uops_12_mem_signed = _RAND_1023[0:0];
  _RAND_1024 = {1{`RANDOM}};
  uops_12_is_fence = _RAND_1024[0:0];
  _RAND_1025 = {1{`RANDOM}};
  uops_12_is_fencei = _RAND_1025[0:0];
  _RAND_1026 = {1{`RANDOM}};
  uops_12_is_amo = _RAND_1026[0:0];
  _RAND_1027 = {1{`RANDOM}};
  uops_12_uses_ldq = _RAND_1027[0:0];
  _RAND_1028 = {1{`RANDOM}};
  uops_12_uses_stq = _RAND_1028[0:0];
  _RAND_1029 = {1{`RANDOM}};
  uops_12_is_sys_pc2epc = _RAND_1029[0:0];
  _RAND_1030 = {1{`RANDOM}};
  uops_12_is_unique = _RAND_1030[0:0];
  _RAND_1031 = {1{`RANDOM}};
  uops_12_flush_on_commit = _RAND_1031[0:0];
  _RAND_1032 = {1{`RANDOM}};
  uops_12_ldst_is_rs1 = _RAND_1032[0:0];
  _RAND_1033 = {1{`RANDOM}};
  uops_12_ldst = _RAND_1033[5:0];
  _RAND_1034 = {1{`RANDOM}};
  uops_12_lrs1 = _RAND_1034[5:0];
  _RAND_1035 = {1{`RANDOM}};
  uops_12_lrs2 = _RAND_1035[5:0];
  _RAND_1036 = {1{`RANDOM}};
  uops_12_lrs3 = _RAND_1036[5:0];
  _RAND_1037 = {1{`RANDOM}};
  uops_12_ldst_val = _RAND_1037[0:0];
  _RAND_1038 = {1{`RANDOM}};
  uops_12_dst_rtype = _RAND_1038[1:0];
  _RAND_1039 = {1{`RANDOM}};
  uops_12_lrs1_rtype = _RAND_1039[1:0];
  _RAND_1040 = {1{`RANDOM}};
  uops_12_lrs2_rtype = _RAND_1040[1:0];
  _RAND_1041 = {1{`RANDOM}};
  uops_12_frs3_en = _RAND_1041[0:0];
  _RAND_1042 = {1{`RANDOM}};
  uops_12_fp_val = _RAND_1042[0:0];
  _RAND_1043 = {1{`RANDOM}};
  uops_12_fp_single = _RAND_1043[0:0];
  _RAND_1044 = {1{`RANDOM}};
  uops_12_xcpt_pf_if = _RAND_1044[0:0];
  _RAND_1045 = {1{`RANDOM}};
  uops_12_xcpt_ae_if = _RAND_1045[0:0];
  _RAND_1046 = {1{`RANDOM}};
  uops_12_xcpt_ma_if = _RAND_1046[0:0];
  _RAND_1047 = {1{`RANDOM}};
  uops_12_bp_debug_if = _RAND_1047[0:0];
  _RAND_1048 = {1{`RANDOM}};
  uops_12_bp_xcpt_if = _RAND_1048[0:0];
  _RAND_1049 = {1{`RANDOM}};
  uops_12_debug_fsrc = _RAND_1049[1:0];
  _RAND_1050 = {1{`RANDOM}};
  uops_12_debug_tsrc = _RAND_1050[1:0];
  _RAND_1051 = {1{`RANDOM}};
  uops_13_uopc = _RAND_1051[6:0];
  _RAND_1052 = {1{`RANDOM}};
  uops_13_inst = _RAND_1052[31:0];
  _RAND_1053 = {1{`RANDOM}};
  uops_13_debug_inst = _RAND_1053[31:0];
  _RAND_1054 = {1{`RANDOM}};
  uops_13_is_rvc = _RAND_1054[0:0];
  _RAND_1055 = {2{`RANDOM}};
  uops_13_debug_pc = _RAND_1055[39:0];
  _RAND_1056 = {1{`RANDOM}};
  uops_13_iq_type = _RAND_1056[2:0];
  _RAND_1057 = {1{`RANDOM}};
  uops_13_fu_code = _RAND_1057[9:0];
  _RAND_1058 = {1{`RANDOM}};
  uops_13_ctrl_br_type = _RAND_1058[3:0];
  _RAND_1059 = {1{`RANDOM}};
  uops_13_ctrl_op1_sel = _RAND_1059[1:0];
  _RAND_1060 = {1{`RANDOM}};
  uops_13_ctrl_op2_sel = _RAND_1060[2:0];
  _RAND_1061 = {1{`RANDOM}};
  uops_13_ctrl_imm_sel = _RAND_1061[2:0];
  _RAND_1062 = {1{`RANDOM}};
  uops_13_ctrl_op_fcn = _RAND_1062[3:0];
  _RAND_1063 = {1{`RANDOM}};
  uops_13_ctrl_fcn_dw = _RAND_1063[0:0];
  _RAND_1064 = {1{`RANDOM}};
  uops_13_ctrl_csr_cmd = _RAND_1064[2:0];
  _RAND_1065 = {1{`RANDOM}};
  uops_13_ctrl_is_load = _RAND_1065[0:0];
  _RAND_1066 = {1{`RANDOM}};
  uops_13_ctrl_is_sta = _RAND_1066[0:0];
  _RAND_1067 = {1{`RANDOM}};
  uops_13_ctrl_is_std = _RAND_1067[0:0];
  _RAND_1068 = {1{`RANDOM}};
  uops_13_iw_state = _RAND_1068[1:0];
  _RAND_1069 = {1{`RANDOM}};
  uops_13_iw_p1_poisoned = _RAND_1069[0:0];
  _RAND_1070 = {1{`RANDOM}};
  uops_13_iw_p2_poisoned = _RAND_1070[0:0];
  _RAND_1071 = {1{`RANDOM}};
  uops_13_is_br = _RAND_1071[0:0];
  _RAND_1072 = {1{`RANDOM}};
  uops_13_is_jalr = _RAND_1072[0:0];
  _RAND_1073 = {1{`RANDOM}};
  uops_13_is_jal = _RAND_1073[0:0];
  _RAND_1074 = {1{`RANDOM}};
  uops_13_is_sfb = _RAND_1074[0:0];
  _RAND_1075 = {1{`RANDOM}};
  uops_13_br_mask = _RAND_1075[11:0];
  _RAND_1076 = {1{`RANDOM}};
  uops_13_br_tag = _RAND_1076[3:0];
  _RAND_1077 = {1{`RANDOM}};
  uops_13_ftq_idx = _RAND_1077[4:0];
  _RAND_1078 = {1{`RANDOM}};
  uops_13_edge_inst = _RAND_1078[0:0];
  _RAND_1079 = {1{`RANDOM}};
  uops_13_pc_lob = _RAND_1079[5:0];
  _RAND_1080 = {1{`RANDOM}};
  uops_13_taken = _RAND_1080[0:0];
  _RAND_1081 = {1{`RANDOM}};
  uops_13_imm_packed = _RAND_1081[19:0];
  _RAND_1082 = {1{`RANDOM}};
  uops_13_csr_addr = _RAND_1082[11:0];
  _RAND_1083 = {1{`RANDOM}};
  uops_13_rob_idx = _RAND_1083[5:0];
  _RAND_1084 = {1{`RANDOM}};
  uops_13_ldq_idx = _RAND_1084[3:0];
  _RAND_1085 = {1{`RANDOM}};
  uops_13_stq_idx = _RAND_1085[3:0];
  _RAND_1086 = {1{`RANDOM}};
  uops_13_rxq_idx = _RAND_1086[1:0];
  _RAND_1087 = {1{`RANDOM}};
  uops_13_pdst = _RAND_1087[5:0];
  _RAND_1088 = {1{`RANDOM}};
  uops_13_prs1 = _RAND_1088[5:0];
  _RAND_1089 = {1{`RANDOM}};
  uops_13_prs2 = _RAND_1089[5:0];
  _RAND_1090 = {1{`RANDOM}};
  uops_13_prs3 = _RAND_1090[5:0];
  _RAND_1091 = {1{`RANDOM}};
  uops_13_ppred = _RAND_1091[4:0];
  _RAND_1092 = {1{`RANDOM}};
  uops_13_prs1_busy = _RAND_1092[0:0];
  _RAND_1093 = {1{`RANDOM}};
  uops_13_prs2_busy = _RAND_1093[0:0];
  _RAND_1094 = {1{`RANDOM}};
  uops_13_prs3_busy = _RAND_1094[0:0];
  _RAND_1095 = {1{`RANDOM}};
  uops_13_ppred_busy = _RAND_1095[0:0];
  _RAND_1096 = {1{`RANDOM}};
  uops_13_stale_pdst = _RAND_1096[5:0];
  _RAND_1097 = {1{`RANDOM}};
  uops_13_exception = _RAND_1097[0:0];
  _RAND_1098 = {2{`RANDOM}};
  uops_13_exc_cause = _RAND_1098[63:0];
  _RAND_1099 = {1{`RANDOM}};
  uops_13_bypassable = _RAND_1099[0:0];
  _RAND_1100 = {1{`RANDOM}};
  uops_13_mem_cmd = _RAND_1100[4:0];
  _RAND_1101 = {1{`RANDOM}};
  uops_13_mem_size = _RAND_1101[1:0];
  _RAND_1102 = {1{`RANDOM}};
  uops_13_mem_signed = _RAND_1102[0:0];
  _RAND_1103 = {1{`RANDOM}};
  uops_13_is_fence = _RAND_1103[0:0];
  _RAND_1104 = {1{`RANDOM}};
  uops_13_is_fencei = _RAND_1104[0:0];
  _RAND_1105 = {1{`RANDOM}};
  uops_13_is_amo = _RAND_1105[0:0];
  _RAND_1106 = {1{`RANDOM}};
  uops_13_uses_ldq = _RAND_1106[0:0];
  _RAND_1107 = {1{`RANDOM}};
  uops_13_uses_stq = _RAND_1107[0:0];
  _RAND_1108 = {1{`RANDOM}};
  uops_13_is_sys_pc2epc = _RAND_1108[0:0];
  _RAND_1109 = {1{`RANDOM}};
  uops_13_is_unique = _RAND_1109[0:0];
  _RAND_1110 = {1{`RANDOM}};
  uops_13_flush_on_commit = _RAND_1110[0:0];
  _RAND_1111 = {1{`RANDOM}};
  uops_13_ldst_is_rs1 = _RAND_1111[0:0];
  _RAND_1112 = {1{`RANDOM}};
  uops_13_ldst = _RAND_1112[5:0];
  _RAND_1113 = {1{`RANDOM}};
  uops_13_lrs1 = _RAND_1113[5:0];
  _RAND_1114 = {1{`RANDOM}};
  uops_13_lrs2 = _RAND_1114[5:0];
  _RAND_1115 = {1{`RANDOM}};
  uops_13_lrs3 = _RAND_1115[5:0];
  _RAND_1116 = {1{`RANDOM}};
  uops_13_ldst_val = _RAND_1116[0:0];
  _RAND_1117 = {1{`RANDOM}};
  uops_13_dst_rtype = _RAND_1117[1:0];
  _RAND_1118 = {1{`RANDOM}};
  uops_13_lrs1_rtype = _RAND_1118[1:0];
  _RAND_1119 = {1{`RANDOM}};
  uops_13_lrs2_rtype = _RAND_1119[1:0];
  _RAND_1120 = {1{`RANDOM}};
  uops_13_frs3_en = _RAND_1120[0:0];
  _RAND_1121 = {1{`RANDOM}};
  uops_13_fp_val = _RAND_1121[0:0];
  _RAND_1122 = {1{`RANDOM}};
  uops_13_fp_single = _RAND_1122[0:0];
  _RAND_1123 = {1{`RANDOM}};
  uops_13_xcpt_pf_if = _RAND_1123[0:0];
  _RAND_1124 = {1{`RANDOM}};
  uops_13_xcpt_ae_if = _RAND_1124[0:0];
  _RAND_1125 = {1{`RANDOM}};
  uops_13_xcpt_ma_if = _RAND_1125[0:0];
  _RAND_1126 = {1{`RANDOM}};
  uops_13_bp_debug_if = _RAND_1126[0:0];
  _RAND_1127 = {1{`RANDOM}};
  uops_13_bp_xcpt_if = _RAND_1127[0:0];
  _RAND_1128 = {1{`RANDOM}};
  uops_13_debug_fsrc = _RAND_1128[1:0];
  _RAND_1129 = {1{`RANDOM}};
  uops_13_debug_tsrc = _RAND_1129[1:0];
  _RAND_1130 = {1{`RANDOM}};
  uops_14_uopc = _RAND_1130[6:0];
  _RAND_1131 = {1{`RANDOM}};
  uops_14_inst = _RAND_1131[31:0];
  _RAND_1132 = {1{`RANDOM}};
  uops_14_debug_inst = _RAND_1132[31:0];
  _RAND_1133 = {1{`RANDOM}};
  uops_14_is_rvc = _RAND_1133[0:0];
  _RAND_1134 = {2{`RANDOM}};
  uops_14_debug_pc = _RAND_1134[39:0];
  _RAND_1135 = {1{`RANDOM}};
  uops_14_iq_type = _RAND_1135[2:0];
  _RAND_1136 = {1{`RANDOM}};
  uops_14_fu_code = _RAND_1136[9:0];
  _RAND_1137 = {1{`RANDOM}};
  uops_14_ctrl_br_type = _RAND_1137[3:0];
  _RAND_1138 = {1{`RANDOM}};
  uops_14_ctrl_op1_sel = _RAND_1138[1:0];
  _RAND_1139 = {1{`RANDOM}};
  uops_14_ctrl_op2_sel = _RAND_1139[2:0];
  _RAND_1140 = {1{`RANDOM}};
  uops_14_ctrl_imm_sel = _RAND_1140[2:0];
  _RAND_1141 = {1{`RANDOM}};
  uops_14_ctrl_op_fcn = _RAND_1141[3:0];
  _RAND_1142 = {1{`RANDOM}};
  uops_14_ctrl_fcn_dw = _RAND_1142[0:0];
  _RAND_1143 = {1{`RANDOM}};
  uops_14_ctrl_csr_cmd = _RAND_1143[2:0];
  _RAND_1144 = {1{`RANDOM}};
  uops_14_ctrl_is_load = _RAND_1144[0:0];
  _RAND_1145 = {1{`RANDOM}};
  uops_14_ctrl_is_sta = _RAND_1145[0:0];
  _RAND_1146 = {1{`RANDOM}};
  uops_14_ctrl_is_std = _RAND_1146[0:0];
  _RAND_1147 = {1{`RANDOM}};
  uops_14_iw_state = _RAND_1147[1:0];
  _RAND_1148 = {1{`RANDOM}};
  uops_14_iw_p1_poisoned = _RAND_1148[0:0];
  _RAND_1149 = {1{`RANDOM}};
  uops_14_iw_p2_poisoned = _RAND_1149[0:0];
  _RAND_1150 = {1{`RANDOM}};
  uops_14_is_br = _RAND_1150[0:0];
  _RAND_1151 = {1{`RANDOM}};
  uops_14_is_jalr = _RAND_1151[0:0];
  _RAND_1152 = {1{`RANDOM}};
  uops_14_is_jal = _RAND_1152[0:0];
  _RAND_1153 = {1{`RANDOM}};
  uops_14_is_sfb = _RAND_1153[0:0];
  _RAND_1154 = {1{`RANDOM}};
  uops_14_br_mask = _RAND_1154[11:0];
  _RAND_1155 = {1{`RANDOM}};
  uops_14_br_tag = _RAND_1155[3:0];
  _RAND_1156 = {1{`RANDOM}};
  uops_14_ftq_idx = _RAND_1156[4:0];
  _RAND_1157 = {1{`RANDOM}};
  uops_14_edge_inst = _RAND_1157[0:0];
  _RAND_1158 = {1{`RANDOM}};
  uops_14_pc_lob = _RAND_1158[5:0];
  _RAND_1159 = {1{`RANDOM}};
  uops_14_taken = _RAND_1159[0:0];
  _RAND_1160 = {1{`RANDOM}};
  uops_14_imm_packed = _RAND_1160[19:0];
  _RAND_1161 = {1{`RANDOM}};
  uops_14_csr_addr = _RAND_1161[11:0];
  _RAND_1162 = {1{`RANDOM}};
  uops_14_rob_idx = _RAND_1162[5:0];
  _RAND_1163 = {1{`RANDOM}};
  uops_14_ldq_idx = _RAND_1163[3:0];
  _RAND_1164 = {1{`RANDOM}};
  uops_14_stq_idx = _RAND_1164[3:0];
  _RAND_1165 = {1{`RANDOM}};
  uops_14_rxq_idx = _RAND_1165[1:0];
  _RAND_1166 = {1{`RANDOM}};
  uops_14_pdst = _RAND_1166[5:0];
  _RAND_1167 = {1{`RANDOM}};
  uops_14_prs1 = _RAND_1167[5:0];
  _RAND_1168 = {1{`RANDOM}};
  uops_14_prs2 = _RAND_1168[5:0];
  _RAND_1169 = {1{`RANDOM}};
  uops_14_prs3 = _RAND_1169[5:0];
  _RAND_1170 = {1{`RANDOM}};
  uops_14_ppred = _RAND_1170[4:0];
  _RAND_1171 = {1{`RANDOM}};
  uops_14_prs1_busy = _RAND_1171[0:0];
  _RAND_1172 = {1{`RANDOM}};
  uops_14_prs2_busy = _RAND_1172[0:0];
  _RAND_1173 = {1{`RANDOM}};
  uops_14_prs3_busy = _RAND_1173[0:0];
  _RAND_1174 = {1{`RANDOM}};
  uops_14_ppred_busy = _RAND_1174[0:0];
  _RAND_1175 = {1{`RANDOM}};
  uops_14_stale_pdst = _RAND_1175[5:0];
  _RAND_1176 = {1{`RANDOM}};
  uops_14_exception = _RAND_1176[0:0];
  _RAND_1177 = {2{`RANDOM}};
  uops_14_exc_cause = _RAND_1177[63:0];
  _RAND_1178 = {1{`RANDOM}};
  uops_14_bypassable = _RAND_1178[0:0];
  _RAND_1179 = {1{`RANDOM}};
  uops_14_mem_cmd = _RAND_1179[4:0];
  _RAND_1180 = {1{`RANDOM}};
  uops_14_mem_size = _RAND_1180[1:0];
  _RAND_1181 = {1{`RANDOM}};
  uops_14_mem_signed = _RAND_1181[0:0];
  _RAND_1182 = {1{`RANDOM}};
  uops_14_is_fence = _RAND_1182[0:0];
  _RAND_1183 = {1{`RANDOM}};
  uops_14_is_fencei = _RAND_1183[0:0];
  _RAND_1184 = {1{`RANDOM}};
  uops_14_is_amo = _RAND_1184[0:0];
  _RAND_1185 = {1{`RANDOM}};
  uops_14_uses_ldq = _RAND_1185[0:0];
  _RAND_1186 = {1{`RANDOM}};
  uops_14_uses_stq = _RAND_1186[0:0];
  _RAND_1187 = {1{`RANDOM}};
  uops_14_is_sys_pc2epc = _RAND_1187[0:0];
  _RAND_1188 = {1{`RANDOM}};
  uops_14_is_unique = _RAND_1188[0:0];
  _RAND_1189 = {1{`RANDOM}};
  uops_14_flush_on_commit = _RAND_1189[0:0];
  _RAND_1190 = {1{`RANDOM}};
  uops_14_ldst_is_rs1 = _RAND_1190[0:0];
  _RAND_1191 = {1{`RANDOM}};
  uops_14_ldst = _RAND_1191[5:0];
  _RAND_1192 = {1{`RANDOM}};
  uops_14_lrs1 = _RAND_1192[5:0];
  _RAND_1193 = {1{`RANDOM}};
  uops_14_lrs2 = _RAND_1193[5:0];
  _RAND_1194 = {1{`RANDOM}};
  uops_14_lrs3 = _RAND_1194[5:0];
  _RAND_1195 = {1{`RANDOM}};
  uops_14_ldst_val = _RAND_1195[0:0];
  _RAND_1196 = {1{`RANDOM}};
  uops_14_dst_rtype = _RAND_1196[1:0];
  _RAND_1197 = {1{`RANDOM}};
  uops_14_lrs1_rtype = _RAND_1197[1:0];
  _RAND_1198 = {1{`RANDOM}};
  uops_14_lrs2_rtype = _RAND_1198[1:0];
  _RAND_1199 = {1{`RANDOM}};
  uops_14_frs3_en = _RAND_1199[0:0];
  _RAND_1200 = {1{`RANDOM}};
  uops_14_fp_val = _RAND_1200[0:0];
  _RAND_1201 = {1{`RANDOM}};
  uops_14_fp_single = _RAND_1201[0:0];
  _RAND_1202 = {1{`RANDOM}};
  uops_14_xcpt_pf_if = _RAND_1202[0:0];
  _RAND_1203 = {1{`RANDOM}};
  uops_14_xcpt_ae_if = _RAND_1203[0:0];
  _RAND_1204 = {1{`RANDOM}};
  uops_14_xcpt_ma_if = _RAND_1204[0:0];
  _RAND_1205 = {1{`RANDOM}};
  uops_14_bp_debug_if = _RAND_1205[0:0];
  _RAND_1206 = {1{`RANDOM}};
  uops_14_bp_xcpt_if = _RAND_1206[0:0];
  _RAND_1207 = {1{`RANDOM}};
  uops_14_debug_fsrc = _RAND_1207[1:0];
  _RAND_1208 = {1{`RANDOM}};
  uops_14_debug_tsrc = _RAND_1208[1:0];
  _RAND_1209 = {1{`RANDOM}};
  uops_15_uopc = _RAND_1209[6:0];
  _RAND_1210 = {1{`RANDOM}};
  uops_15_inst = _RAND_1210[31:0];
  _RAND_1211 = {1{`RANDOM}};
  uops_15_debug_inst = _RAND_1211[31:0];
  _RAND_1212 = {1{`RANDOM}};
  uops_15_is_rvc = _RAND_1212[0:0];
  _RAND_1213 = {2{`RANDOM}};
  uops_15_debug_pc = _RAND_1213[39:0];
  _RAND_1214 = {1{`RANDOM}};
  uops_15_iq_type = _RAND_1214[2:0];
  _RAND_1215 = {1{`RANDOM}};
  uops_15_fu_code = _RAND_1215[9:0];
  _RAND_1216 = {1{`RANDOM}};
  uops_15_ctrl_br_type = _RAND_1216[3:0];
  _RAND_1217 = {1{`RANDOM}};
  uops_15_ctrl_op1_sel = _RAND_1217[1:0];
  _RAND_1218 = {1{`RANDOM}};
  uops_15_ctrl_op2_sel = _RAND_1218[2:0];
  _RAND_1219 = {1{`RANDOM}};
  uops_15_ctrl_imm_sel = _RAND_1219[2:0];
  _RAND_1220 = {1{`RANDOM}};
  uops_15_ctrl_op_fcn = _RAND_1220[3:0];
  _RAND_1221 = {1{`RANDOM}};
  uops_15_ctrl_fcn_dw = _RAND_1221[0:0];
  _RAND_1222 = {1{`RANDOM}};
  uops_15_ctrl_csr_cmd = _RAND_1222[2:0];
  _RAND_1223 = {1{`RANDOM}};
  uops_15_ctrl_is_load = _RAND_1223[0:0];
  _RAND_1224 = {1{`RANDOM}};
  uops_15_ctrl_is_sta = _RAND_1224[0:0];
  _RAND_1225 = {1{`RANDOM}};
  uops_15_ctrl_is_std = _RAND_1225[0:0];
  _RAND_1226 = {1{`RANDOM}};
  uops_15_iw_state = _RAND_1226[1:0];
  _RAND_1227 = {1{`RANDOM}};
  uops_15_iw_p1_poisoned = _RAND_1227[0:0];
  _RAND_1228 = {1{`RANDOM}};
  uops_15_iw_p2_poisoned = _RAND_1228[0:0];
  _RAND_1229 = {1{`RANDOM}};
  uops_15_is_br = _RAND_1229[0:0];
  _RAND_1230 = {1{`RANDOM}};
  uops_15_is_jalr = _RAND_1230[0:0];
  _RAND_1231 = {1{`RANDOM}};
  uops_15_is_jal = _RAND_1231[0:0];
  _RAND_1232 = {1{`RANDOM}};
  uops_15_is_sfb = _RAND_1232[0:0];
  _RAND_1233 = {1{`RANDOM}};
  uops_15_br_mask = _RAND_1233[11:0];
  _RAND_1234 = {1{`RANDOM}};
  uops_15_br_tag = _RAND_1234[3:0];
  _RAND_1235 = {1{`RANDOM}};
  uops_15_ftq_idx = _RAND_1235[4:0];
  _RAND_1236 = {1{`RANDOM}};
  uops_15_edge_inst = _RAND_1236[0:0];
  _RAND_1237 = {1{`RANDOM}};
  uops_15_pc_lob = _RAND_1237[5:0];
  _RAND_1238 = {1{`RANDOM}};
  uops_15_taken = _RAND_1238[0:0];
  _RAND_1239 = {1{`RANDOM}};
  uops_15_imm_packed = _RAND_1239[19:0];
  _RAND_1240 = {1{`RANDOM}};
  uops_15_csr_addr = _RAND_1240[11:0];
  _RAND_1241 = {1{`RANDOM}};
  uops_15_rob_idx = _RAND_1241[5:0];
  _RAND_1242 = {1{`RANDOM}};
  uops_15_ldq_idx = _RAND_1242[3:0];
  _RAND_1243 = {1{`RANDOM}};
  uops_15_stq_idx = _RAND_1243[3:0];
  _RAND_1244 = {1{`RANDOM}};
  uops_15_rxq_idx = _RAND_1244[1:0];
  _RAND_1245 = {1{`RANDOM}};
  uops_15_pdst = _RAND_1245[5:0];
  _RAND_1246 = {1{`RANDOM}};
  uops_15_prs1 = _RAND_1246[5:0];
  _RAND_1247 = {1{`RANDOM}};
  uops_15_prs2 = _RAND_1247[5:0];
  _RAND_1248 = {1{`RANDOM}};
  uops_15_prs3 = _RAND_1248[5:0];
  _RAND_1249 = {1{`RANDOM}};
  uops_15_ppred = _RAND_1249[4:0];
  _RAND_1250 = {1{`RANDOM}};
  uops_15_prs1_busy = _RAND_1250[0:0];
  _RAND_1251 = {1{`RANDOM}};
  uops_15_prs2_busy = _RAND_1251[0:0];
  _RAND_1252 = {1{`RANDOM}};
  uops_15_prs3_busy = _RAND_1252[0:0];
  _RAND_1253 = {1{`RANDOM}};
  uops_15_ppred_busy = _RAND_1253[0:0];
  _RAND_1254 = {1{`RANDOM}};
  uops_15_stale_pdst = _RAND_1254[5:0];
  _RAND_1255 = {1{`RANDOM}};
  uops_15_exception = _RAND_1255[0:0];
  _RAND_1256 = {2{`RANDOM}};
  uops_15_exc_cause = _RAND_1256[63:0];
  _RAND_1257 = {1{`RANDOM}};
  uops_15_bypassable = _RAND_1257[0:0];
  _RAND_1258 = {1{`RANDOM}};
  uops_15_mem_cmd = _RAND_1258[4:0];
  _RAND_1259 = {1{`RANDOM}};
  uops_15_mem_size = _RAND_1259[1:0];
  _RAND_1260 = {1{`RANDOM}};
  uops_15_mem_signed = _RAND_1260[0:0];
  _RAND_1261 = {1{`RANDOM}};
  uops_15_is_fence = _RAND_1261[0:0];
  _RAND_1262 = {1{`RANDOM}};
  uops_15_is_fencei = _RAND_1262[0:0];
  _RAND_1263 = {1{`RANDOM}};
  uops_15_is_amo = _RAND_1263[0:0];
  _RAND_1264 = {1{`RANDOM}};
  uops_15_uses_ldq = _RAND_1264[0:0];
  _RAND_1265 = {1{`RANDOM}};
  uops_15_uses_stq = _RAND_1265[0:0];
  _RAND_1266 = {1{`RANDOM}};
  uops_15_is_sys_pc2epc = _RAND_1266[0:0];
  _RAND_1267 = {1{`RANDOM}};
  uops_15_is_unique = _RAND_1267[0:0];
  _RAND_1268 = {1{`RANDOM}};
  uops_15_flush_on_commit = _RAND_1268[0:0];
  _RAND_1269 = {1{`RANDOM}};
  uops_15_ldst_is_rs1 = _RAND_1269[0:0];
  _RAND_1270 = {1{`RANDOM}};
  uops_15_ldst = _RAND_1270[5:0];
  _RAND_1271 = {1{`RANDOM}};
  uops_15_lrs1 = _RAND_1271[5:0];
  _RAND_1272 = {1{`RANDOM}};
  uops_15_lrs2 = _RAND_1272[5:0];
  _RAND_1273 = {1{`RANDOM}};
  uops_15_lrs3 = _RAND_1273[5:0];
  _RAND_1274 = {1{`RANDOM}};
  uops_15_ldst_val = _RAND_1274[0:0];
  _RAND_1275 = {1{`RANDOM}};
  uops_15_dst_rtype = _RAND_1275[1:0];
  _RAND_1276 = {1{`RANDOM}};
  uops_15_lrs1_rtype = _RAND_1276[1:0];
  _RAND_1277 = {1{`RANDOM}};
  uops_15_lrs2_rtype = _RAND_1277[1:0];
  _RAND_1278 = {1{`RANDOM}};
  uops_15_frs3_en = _RAND_1278[0:0];
  _RAND_1279 = {1{`RANDOM}};
  uops_15_fp_val = _RAND_1279[0:0];
  _RAND_1280 = {1{`RANDOM}};
  uops_15_fp_single = _RAND_1280[0:0];
  _RAND_1281 = {1{`RANDOM}};
  uops_15_xcpt_pf_if = _RAND_1281[0:0];
  _RAND_1282 = {1{`RANDOM}};
  uops_15_xcpt_ae_if = _RAND_1282[0:0];
  _RAND_1283 = {1{`RANDOM}};
  uops_15_xcpt_ma_if = _RAND_1283[0:0];
  _RAND_1284 = {1{`RANDOM}};
  uops_15_bp_debug_if = _RAND_1284[0:0];
  _RAND_1285 = {1{`RANDOM}};
  uops_15_bp_xcpt_if = _RAND_1285[0:0];
  _RAND_1286 = {1{`RANDOM}};
  uops_15_debug_fsrc = _RAND_1286[1:0];
  _RAND_1287 = {1{`RANDOM}};
  uops_15_debug_tsrc = _RAND_1287[1:0];
  _RAND_1288 = {1{`RANDOM}};
  value = _RAND_1288[3:0];
  _RAND_1289 = {1{`RANDOM}};
  value_1 = _RAND_1289[3:0];
  _RAND_1290 = {1{`RANDOM}};
  maybe_full = _RAND_1290[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
