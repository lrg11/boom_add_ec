module BranchKillableQueue_2(
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
  input  [63:0] io_enq_bits_data,
  input         io_enq_bits_is_hella,
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
  output [63:0] io_deq_bits_data,
  output        io_deq_bits_is_hella,
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
  output [1:0]  io_count
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
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
  reg [63:0] _RAND_53;
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
  reg [31:0] _RAND_71;
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
  reg [63:0] _RAND_89;
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
  reg [31:0] _RAND_107;
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
  reg [63:0] _RAND_132;
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
  reg [31:0] _RAND_150;
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
  reg [63:0] _RAND_168;
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
  reg [63:0] _RAND_211;
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
  reg [31:0] _RAND_229;
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
  reg [63:0] _RAND_247;
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
  reg [31:0] _RAND_265;
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
  reg [63:0] _RAND_290;
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
  reg [31:0] _RAND_318;
  reg [31:0] _RAND_319;
  reg [31:0] _RAND_320;
  reg [31:0] _RAND_321;
  reg [31:0] _RAND_322;
  reg [31:0] _RAND_323;
  reg [31:0] _RAND_324;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram_data [0:3]; // @[util.scala 464:20]
  wire [63:0] ram_data_MPORT_1_data; // @[util.scala 464:20]
  wire [1:0] ram_data_MPORT_1_addr; // @[util.scala 464:20]
  wire [63:0] ram_data_MPORT_data; // @[util.scala 464:20]
  wire [1:0] ram_data_MPORT_addr; // @[util.scala 464:20]
  wire  ram_data_MPORT_mask; // @[util.scala 464:20]
  wire  ram_data_MPORT_en; // @[util.scala 464:20]
  reg  ram_is_hella [0:3]; // @[util.scala 464:20]
  wire  ram_is_hella_MPORT_1_data; // @[util.scala 464:20]
  wire [1:0] ram_is_hella_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_is_hella_MPORT_data; // @[util.scala 464:20]
  wire [1:0] ram_is_hella_MPORT_addr; // @[util.scala 464:20]
  wire  ram_is_hella_MPORT_mask; // @[util.scala 464:20]
  wire  ram_is_hella_MPORT_en; // @[util.scala 464:20]
  reg  valids_0; // @[util.scala 465:24]
  reg  valids_1; // @[util.scala 465:24]
  reg  valids_2; // @[util.scala 465:24]
  reg  valids_3; // @[util.scala 465:24]
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
  reg [1:0] value; // @[Counter.scala 60:40]
  reg [1:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[util.scala 470:27]
  wire  ptr_match = value == value_1; // @[util.scala 472:33]
  wire  full = ptr_match & maybe_full; // @[util.scala 474:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_1 = 2'h1 == value_1 ? valids_1 : valids_0; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_2 = 2'h2 == value_1 ? valids_2 : _GEN_1; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_3 = 2'h3 == value_1 ? valids_3 : _GEN_2; // @[util.scala 476:42 util.scala 476:42]
  wire  _T_5 = ~io_empty; // @[util.scala 476:69]
  wire  do_deq = (io_deq_ready | ~_GEN_3) & ~io_empty; // @[util.scala 476:66]
  wire [11:0] _T_7 = io_brupdate_b1_mispredict_mask & uops_0_br_mask; // @[util.scala 118:51]
  wire  _T_8 = _T_7 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_14 = ~io_brupdate_b1_resolve_mask; // @[util.scala 89:23]
  wire [11:0] _T_15 = uops_0_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_4 = valids_0 ? _T_15 : uops_0_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_16 = io_brupdate_b1_mispredict_mask & uops_1_br_mask; // @[util.scala 118:51]
  wire  _T_17 = _T_16 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_24 = uops_1_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_5 = valids_1 ? _T_24 : uops_1_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_25 = io_brupdate_b1_mispredict_mask & uops_2_br_mask; // @[util.scala 118:51]
  wire  _T_26 = _T_25 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_33 = uops_2_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_6 = valids_2 ? _T_33 : uops_2_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_34 = io_brupdate_b1_mispredict_mask & uops_3_br_mask; // @[util.scala 118:51]
  wire  _T_35 = _T_34 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_42 = uops_3_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_7 = valids_3 ? _T_42 : uops_3_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire  _GEN_8 = 2'h0 == value | valids_0 & ~_T_8 & ~(io_flush & uops_0_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_9 = 2'h1 == value | valids_1 & ~_T_17 & ~(io_flush & uops_1_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_10 = 2'h2 == value | valids_2 & ~_T_26 & ~(io_flush & uops_2_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_11 = 2'h3 == value | valids_3 & ~_T_35 & ~(io_flush & uops_3_uses_ldq); // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire [11:0] _T_44 = io_enq_bits_uop_br_mask & _T_14; // @[util.scala 85:25]
  wire [1:0] _value_T_1 = value + 2'h1; // @[Counter.scala 76:24]
  wire  _GEN_417 = do_enq ? _GEN_8 : valids_0 & ~_T_8 & ~(io_flush & uops_0_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_418 = do_enq ? _GEN_9 : valids_1 & ~_T_17 & ~(io_flush & uops_1_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_419 = do_enq ? _GEN_10 : valids_2 & ~_T_26 & ~(io_flush & uops_2_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_420 = do_enq ? _GEN_11 : valids_3 & ~_T_35 & ~(io_flush & uops_3_uses_ldq); // @[util.scala 487:17 util.scala 481:16]
  wire [1:0] _value_T_3 = value_1 + 2'h1; // @[Counter.scala 76:24]
  wire [1:0] _GEN_749 = 2'h1 == value_1 ? uops_1_debug_tsrc : uops_0_debug_tsrc; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_750 = 2'h2 == value_1 ? uops_2_debug_tsrc : _GEN_749; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_753 = 2'h1 == value_1 ? uops_1_debug_fsrc : uops_0_debug_fsrc; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_754 = 2'h2 == value_1 ? uops_2_debug_fsrc : _GEN_753; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_757 = 2'h1 == value_1 ? uops_1_bp_xcpt_if : uops_0_bp_xcpt_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_758 = 2'h2 == value_1 ? uops_2_bp_xcpt_if : _GEN_757; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_761 = 2'h1 == value_1 ? uops_1_bp_debug_if : uops_0_bp_debug_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_762 = 2'h2 == value_1 ? uops_2_bp_debug_if : _GEN_761; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_765 = 2'h1 == value_1 ? uops_1_xcpt_ma_if : uops_0_xcpt_ma_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_766 = 2'h2 == value_1 ? uops_2_xcpt_ma_if : _GEN_765; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_769 = 2'h1 == value_1 ? uops_1_xcpt_ae_if : uops_0_xcpt_ae_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_770 = 2'h2 == value_1 ? uops_2_xcpt_ae_if : _GEN_769; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_773 = 2'h1 == value_1 ? uops_1_xcpt_pf_if : uops_0_xcpt_pf_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_774 = 2'h2 == value_1 ? uops_2_xcpt_pf_if : _GEN_773; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_777 = 2'h1 == value_1 ? uops_1_fp_single : uops_0_fp_single; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_778 = 2'h2 == value_1 ? uops_2_fp_single : _GEN_777; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_781 = 2'h1 == value_1 ? uops_1_fp_val : uops_0_fp_val; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_782 = 2'h2 == value_1 ? uops_2_fp_val : _GEN_781; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_785 = 2'h1 == value_1 ? uops_1_frs3_en : uops_0_frs3_en; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_786 = 2'h2 == value_1 ? uops_2_frs3_en : _GEN_785; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_789 = 2'h1 == value_1 ? uops_1_lrs2_rtype : uops_0_lrs2_rtype; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_790 = 2'h2 == value_1 ? uops_2_lrs2_rtype : _GEN_789; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_793 = 2'h1 == value_1 ? uops_1_lrs1_rtype : uops_0_lrs1_rtype; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_794 = 2'h2 == value_1 ? uops_2_lrs1_rtype : _GEN_793; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_797 = 2'h1 == value_1 ? uops_1_dst_rtype : uops_0_dst_rtype; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_798 = 2'h2 == value_1 ? uops_2_dst_rtype : _GEN_797; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_801 = 2'h1 == value_1 ? uops_1_ldst_val : uops_0_ldst_val; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_802 = 2'h2 == value_1 ? uops_2_ldst_val : _GEN_801; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_805 = 2'h1 == value_1 ? uops_1_lrs3 : uops_0_lrs3; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_806 = 2'h2 == value_1 ? uops_2_lrs3 : _GEN_805; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_809 = 2'h1 == value_1 ? uops_1_lrs2 : uops_0_lrs2; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_810 = 2'h2 == value_1 ? uops_2_lrs2 : _GEN_809; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_813 = 2'h1 == value_1 ? uops_1_lrs1 : uops_0_lrs1; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_814 = 2'h2 == value_1 ? uops_2_lrs1 : _GEN_813; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_817 = 2'h1 == value_1 ? uops_1_ldst : uops_0_ldst; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_818 = 2'h2 == value_1 ? uops_2_ldst : _GEN_817; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_821 = 2'h1 == value_1 ? uops_1_ldst_is_rs1 : uops_0_ldst_is_rs1; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_822 = 2'h2 == value_1 ? uops_2_ldst_is_rs1 : _GEN_821; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_825 = 2'h1 == value_1 ? uops_1_flush_on_commit : uops_0_flush_on_commit; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_826 = 2'h2 == value_1 ? uops_2_flush_on_commit : _GEN_825; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_829 = 2'h1 == value_1 ? uops_1_is_unique : uops_0_is_unique; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_830 = 2'h2 == value_1 ? uops_2_is_unique : _GEN_829; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_833 = 2'h1 == value_1 ? uops_1_is_sys_pc2epc : uops_0_is_sys_pc2epc; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_834 = 2'h2 == value_1 ? uops_2_is_sys_pc2epc : _GEN_833; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_837 = 2'h1 == value_1 ? uops_1_uses_stq : uops_0_uses_stq; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_838 = 2'h2 == value_1 ? uops_2_uses_stq : _GEN_837; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_841 = 2'h1 == value_1 ? uops_1_uses_ldq : uops_0_uses_ldq; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_842 = 2'h2 == value_1 ? uops_2_uses_ldq : _GEN_841; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_uses_ldq = 2'h3 == value_1 ? uops_3_uses_ldq : _GEN_842; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_845 = 2'h1 == value_1 ? uops_1_is_amo : uops_0_is_amo; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_846 = 2'h2 == value_1 ? uops_2_is_amo : _GEN_845; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_849 = 2'h1 == value_1 ? uops_1_is_fencei : uops_0_is_fencei; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_850 = 2'h2 == value_1 ? uops_2_is_fencei : _GEN_849; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_853 = 2'h1 == value_1 ? uops_1_is_fence : uops_0_is_fence; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_854 = 2'h2 == value_1 ? uops_2_is_fence : _GEN_853; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_857 = 2'h1 == value_1 ? uops_1_mem_signed : uops_0_mem_signed; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_858 = 2'h2 == value_1 ? uops_2_mem_signed : _GEN_857; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_861 = 2'h1 == value_1 ? uops_1_mem_size : uops_0_mem_size; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_862 = 2'h2 == value_1 ? uops_2_mem_size : _GEN_861; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_865 = 2'h1 == value_1 ? uops_1_mem_cmd : uops_0_mem_cmd; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_866 = 2'h2 == value_1 ? uops_2_mem_cmd : _GEN_865; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_869 = 2'h1 == value_1 ? uops_1_bypassable : uops_0_bypassable; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_870 = 2'h2 == value_1 ? uops_2_bypassable : _GEN_869; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_873 = 2'h1 == value_1 ? uops_1_exc_cause : uops_0_exc_cause; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_874 = 2'h2 == value_1 ? uops_2_exc_cause : _GEN_873; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_877 = 2'h1 == value_1 ? uops_1_exception : uops_0_exception; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_878 = 2'h2 == value_1 ? uops_2_exception : _GEN_877; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_881 = 2'h1 == value_1 ? uops_1_stale_pdst : uops_0_stale_pdst; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_882 = 2'h2 == value_1 ? uops_2_stale_pdst : _GEN_881; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_885 = 2'h1 == value_1 ? uops_1_ppred_busy : uops_0_ppred_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_886 = 2'h2 == value_1 ? uops_2_ppred_busy : _GEN_885; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_889 = 2'h1 == value_1 ? uops_1_prs3_busy : uops_0_prs3_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_890 = 2'h2 == value_1 ? uops_2_prs3_busy : _GEN_889; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_893 = 2'h1 == value_1 ? uops_1_prs2_busy : uops_0_prs2_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_894 = 2'h2 == value_1 ? uops_2_prs2_busy : _GEN_893; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_897 = 2'h1 == value_1 ? uops_1_prs1_busy : uops_0_prs1_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_898 = 2'h2 == value_1 ? uops_2_prs1_busy : _GEN_897; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_901 = 2'h1 == value_1 ? uops_1_ppred : uops_0_ppred; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_902 = 2'h2 == value_1 ? uops_2_ppred : _GEN_901; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_905 = 2'h1 == value_1 ? uops_1_prs3 : uops_0_prs3; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_906 = 2'h2 == value_1 ? uops_2_prs3 : _GEN_905; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_909 = 2'h1 == value_1 ? uops_1_prs2 : uops_0_prs2; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_910 = 2'h2 == value_1 ? uops_2_prs2 : _GEN_909; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_913 = 2'h1 == value_1 ? uops_1_prs1 : uops_0_prs1; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_914 = 2'h2 == value_1 ? uops_2_prs1 : _GEN_913; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_917 = 2'h1 == value_1 ? uops_1_pdst : uops_0_pdst; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_918 = 2'h2 == value_1 ? uops_2_pdst : _GEN_917; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_921 = 2'h1 == value_1 ? uops_1_rxq_idx : uops_0_rxq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_922 = 2'h2 == value_1 ? uops_2_rxq_idx : _GEN_921; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_925 = 2'h1 == value_1 ? uops_1_stq_idx : uops_0_stq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_926 = 2'h2 == value_1 ? uops_2_stq_idx : _GEN_925; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_929 = 2'h1 == value_1 ? uops_1_ldq_idx : uops_0_ldq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_930 = 2'h2 == value_1 ? uops_2_ldq_idx : _GEN_929; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_933 = 2'h1 == value_1 ? uops_1_rob_idx : uops_0_rob_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_934 = 2'h2 == value_1 ? uops_2_rob_idx : _GEN_933; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_937 = 2'h1 == value_1 ? uops_1_csr_addr : uops_0_csr_addr; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_938 = 2'h2 == value_1 ? uops_2_csr_addr : _GEN_937; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_941 = 2'h1 == value_1 ? uops_1_imm_packed : uops_0_imm_packed; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_942 = 2'h2 == value_1 ? uops_2_imm_packed : _GEN_941; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_945 = 2'h1 == value_1 ? uops_1_taken : uops_0_taken; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_946 = 2'h2 == value_1 ? uops_2_taken : _GEN_945; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_949 = 2'h1 == value_1 ? uops_1_pc_lob : uops_0_pc_lob; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_950 = 2'h2 == value_1 ? uops_2_pc_lob : _GEN_949; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_953 = 2'h1 == value_1 ? uops_1_edge_inst : uops_0_edge_inst; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_954 = 2'h2 == value_1 ? uops_2_edge_inst : _GEN_953; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_957 = 2'h1 == value_1 ? uops_1_ftq_idx : uops_0_ftq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_958 = 2'h2 == value_1 ? uops_2_ftq_idx : _GEN_957; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_961 = 2'h1 == value_1 ? uops_1_br_tag : uops_0_br_tag; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_962 = 2'h2 == value_1 ? uops_2_br_tag : _GEN_961; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_965 = 2'h1 == value_1 ? uops_1_br_mask : uops_0_br_mask; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_966 = 2'h2 == value_1 ? uops_2_br_mask : _GEN_965; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] out_uop_br_mask = 2'h3 == value_1 ? uops_3_br_mask : _GEN_966; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_969 = 2'h1 == value_1 ? uops_1_is_sfb : uops_0_is_sfb; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_970 = 2'h2 == value_1 ? uops_2_is_sfb : _GEN_969; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_973 = 2'h1 == value_1 ? uops_1_is_jal : uops_0_is_jal; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_974 = 2'h2 == value_1 ? uops_2_is_jal : _GEN_973; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_977 = 2'h1 == value_1 ? uops_1_is_jalr : uops_0_is_jalr; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_978 = 2'h2 == value_1 ? uops_2_is_jalr : _GEN_977; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_981 = 2'h1 == value_1 ? uops_1_is_br : uops_0_is_br; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_982 = 2'h2 == value_1 ? uops_2_is_br : _GEN_981; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_985 = 2'h1 == value_1 ? uops_1_iw_p2_poisoned : uops_0_iw_p2_poisoned; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_986 = 2'h2 == value_1 ? uops_2_iw_p2_poisoned : _GEN_985; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_989 = 2'h1 == value_1 ? uops_1_iw_p1_poisoned : uops_0_iw_p1_poisoned; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_990 = 2'h2 == value_1 ? uops_2_iw_p1_poisoned : _GEN_989; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_993 = 2'h1 == value_1 ? uops_1_iw_state : uops_0_iw_state; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_994 = 2'h2 == value_1 ? uops_2_iw_state : _GEN_993; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_997 = 2'h1 == value_1 ? uops_1_ctrl_is_std : uops_0_ctrl_is_std; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_998 = 2'h2 == value_1 ? uops_2_ctrl_is_std : _GEN_997; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1001 = 2'h1 == value_1 ? uops_1_ctrl_is_sta : uops_0_ctrl_is_sta; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1002 = 2'h2 == value_1 ? uops_2_ctrl_is_sta : _GEN_1001; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1005 = 2'h1 == value_1 ? uops_1_ctrl_is_load : uops_0_ctrl_is_load; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1006 = 2'h2 == value_1 ? uops_2_ctrl_is_load : _GEN_1005; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1009 = 2'h1 == value_1 ? uops_1_ctrl_csr_cmd : uops_0_ctrl_csr_cmd; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1010 = 2'h2 == value_1 ? uops_2_ctrl_csr_cmd : _GEN_1009; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1013 = 2'h1 == value_1 ? uops_1_ctrl_fcn_dw : uops_0_ctrl_fcn_dw; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1014 = 2'h2 == value_1 ? uops_2_ctrl_fcn_dw : _GEN_1013; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1017 = 2'h1 == value_1 ? uops_1_ctrl_op_fcn : uops_0_ctrl_op_fcn; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1018 = 2'h2 == value_1 ? uops_2_ctrl_op_fcn : _GEN_1017; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1021 = 2'h1 == value_1 ? uops_1_ctrl_imm_sel : uops_0_ctrl_imm_sel; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1022 = 2'h2 == value_1 ? uops_2_ctrl_imm_sel : _GEN_1021; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1025 = 2'h1 == value_1 ? uops_1_ctrl_op2_sel : uops_0_ctrl_op2_sel; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1026 = 2'h2 == value_1 ? uops_2_ctrl_op2_sel : _GEN_1025; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1029 = 2'h1 == value_1 ? uops_1_ctrl_op1_sel : uops_0_ctrl_op1_sel; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1030 = 2'h2 == value_1 ? uops_2_ctrl_op1_sel : _GEN_1029; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1033 = 2'h1 == value_1 ? uops_1_ctrl_br_type : uops_0_ctrl_br_type; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1034 = 2'h2 == value_1 ? uops_2_ctrl_br_type : _GEN_1033; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_1037 = 2'h1 == value_1 ? uops_1_fu_code : uops_0_fu_code; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_1038 = 2'h2 == value_1 ? uops_2_fu_code : _GEN_1037; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1041 = 2'h1 == value_1 ? uops_1_iq_type : uops_0_iq_type; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1042 = 2'h2 == value_1 ? uops_2_iq_type : _GEN_1041; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_1045 = 2'h1 == value_1 ? uops_1_debug_pc : uops_0_debug_pc; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_1046 = 2'h2 == value_1 ? uops_2_debug_pc : _GEN_1045; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1049 = 2'h1 == value_1 ? uops_1_is_rvc : uops_0_is_rvc; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1050 = 2'h2 == value_1 ? uops_2_is_rvc : _GEN_1049; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1053 = 2'h1 == value_1 ? uops_1_debug_inst : uops_0_debug_inst; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1054 = 2'h2 == value_1 ? uops_2_debug_inst : _GEN_1053; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1057 = 2'h1 == value_1 ? uops_1_inst : uops_0_inst; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1058 = 2'h2 == value_1 ? uops_2_inst : _GEN_1057; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_1061 = 2'h1 == value_1 ? uops_1_uopc : uops_0_uopc; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_1062 = 2'h2 == value_1 ? uops_2_uopc : _GEN_1061; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _T_49 = io_brupdate_b1_mispredict_mask & out_uop_br_mask; // @[util.scala 118:51]
  wire  _T_50 = _T_49 != 12'h0; // @[util.scala 118:59]
  wire [1:0] lo = value - value_1; // @[util.scala 524:40]
  wire  hi = maybe_full & ptr_match; // @[util.scala 526:32]
  wire [2:0] _T_59 = {hi,lo}; // @[Cat.scala 30:58]
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
  assign io_enq_ready = ~full; // @[util.scala 504:19]
  assign io_deq_valid = _T_5 & _GEN_3 & ~_T_50 & ~(io_flush & out_uop_uses_ldq); // @[util.scala 509:108]
  assign io_deq_bits_uop_uopc = 2'h3 == value_1 ? uops_3_uopc : _GEN_1062; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_inst = 2'h3 == value_1 ? uops_3_inst : _GEN_1058; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_debug_inst = 2'h3 == value_1 ? uops_3_debug_inst : _GEN_1054; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_rvc = 2'h3 == value_1 ? uops_3_is_rvc : _GEN_1050; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_debug_pc = 2'h3 == value_1 ? uops_3_debug_pc : _GEN_1046; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_iq_type = 2'h3 == value_1 ? uops_3_iq_type : _GEN_1042; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_fu_code = 2'h3 == value_1 ? uops_3_fu_code : _GEN_1038; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_br_type = 2'h3 == value_1 ? uops_3_ctrl_br_type : _GEN_1034; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_op1_sel = 2'h3 == value_1 ? uops_3_ctrl_op1_sel : _GEN_1030; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_op2_sel = 2'h3 == value_1 ? uops_3_ctrl_op2_sel : _GEN_1026; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_imm_sel = 2'h3 == value_1 ? uops_3_ctrl_imm_sel : _GEN_1022; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_op_fcn = 2'h3 == value_1 ? uops_3_ctrl_op_fcn : _GEN_1018; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_fcn_dw = 2'h3 == value_1 ? uops_3_ctrl_fcn_dw : _GEN_1014; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_csr_cmd = 2'h3 == value_1 ? uops_3_ctrl_csr_cmd : _GEN_1010; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_is_load = 2'h3 == value_1 ? uops_3_ctrl_is_load : _GEN_1006; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_is_sta = 2'h3 == value_1 ? uops_3_ctrl_is_sta : _GEN_1002; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ctrl_is_std = 2'h3 == value_1 ? uops_3_ctrl_is_std : _GEN_998; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_iw_state = 2'h3 == value_1 ? uops_3_iw_state : _GEN_994; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_iw_p1_poisoned = 2'h3 == value_1 ? uops_3_iw_p1_poisoned : _GEN_990; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_iw_p2_poisoned = 2'h3 == value_1 ? uops_3_iw_p2_poisoned : _GEN_986; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_br = 2'h3 == value_1 ? uops_3_is_br : _GEN_982; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_jalr = 2'h3 == value_1 ? uops_3_is_jalr : _GEN_978; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_jal = 2'h3 == value_1 ? uops_3_is_jal : _GEN_974; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_sfb = 2'h3 == value_1 ? uops_3_is_sfb : _GEN_970; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_br_mask = out_uop_br_mask & _T_14; // @[util.scala 85:25]
  assign io_deq_bits_uop_br_tag = 2'h3 == value_1 ? uops_3_br_tag : _GEN_962; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ftq_idx = 2'h3 == value_1 ? uops_3_ftq_idx : _GEN_958; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_edge_inst = 2'h3 == value_1 ? uops_3_edge_inst : _GEN_954; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_pc_lob = 2'h3 == value_1 ? uops_3_pc_lob : _GEN_950; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_taken = 2'h3 == value_1 ? uops_3_taken : _GEN_946; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_imm_packed = 2'h3 == value_1 ? uops_3_imm_packed : _GEN_942; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_csr_addr = 2'h3 == value_1 ? uops_3_csr_addr : _GEN_938; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_rob_idx = 2'h3 == value_1 ? uops_3_rob_idx : _GEN_934; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ldq_idx = 2'h3 == value_1 ? uops_3_ldq_idx : _GEN_930; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_stq_idx = 2'h3 == value_1 ? uops_3_stq_idx : _GEN_926; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_rxq_idx = 2'h3 == value_1 ? uops_3_rxq_idx : _GEN_922; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_pdst = 2'h3 == value_1 ? uops_3_pdst : _GEN_918; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs1 = 2'h3 == value_1 ? uops_3_prs1 : _GEN_914; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs2 = 2'h3 == value_1 ? uops_3_prs2 : _GEN_910; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs3 = 2'h3 == value_1 ? uops_3_prs3 : _GEN_906; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ppred = 2'h3 == value_1 ? uops_3_ppred : _GEN_902; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs1_busy = 2'h3 == value_1 ? uops_3_prs1_busy : _GEN_898; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs2_busy = 2'h3 == value_1 ? uops_3_prs2_busy : _GEN_894; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_prs3_busy = 2'h3 == value_1 ? uops_3_prs3_busy : _GEN_890; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ppred_busy = 2'h3 == value_1 ? uops_3_ppred_busy : _GEN_886; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_stale_pdst = 2'h3 == value_1 ? uops_3_stale_pdst : _GEN_882; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_exception = 2'h3 == value_1 ? uops_3_exception : _GEN_878; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_exc_cause = 2'h3 == value_1 ? uops_3_exc_cause : _GEN_874; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_bypassable = 2'h3 == value_1 ? uops_3_bypassable : _GEN_870; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_mem_cmd = 2'h3 == value_1 ? uops_3_mem_cmd : _GEN_866; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_mem_size = 2'h3 == value_1 ? uops_3_mem_size : _GEN_862; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_mem_signed = 2'h3 == value_1 ? uops_3_mem_signed : _GEN_858; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_fence = 2'h3 == value_1 ? uops_3_is_fence : _GEN_854; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_fencei = 2'h3 == value_1 ? uops_3_is_fencei : _GEN_850; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_amo = 2'h3 == value_1 ? uops_3_is_amo : _GEN_846; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_uses_ldq = 2'h3 == value_1 ? uops_3_uses_ldq : _GEN_842; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_uses_stq = 2'h3 == value_1 ? uops_3_uses_stq : _GEN_838; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_sys_pc2epc = 2'h3 == value_1 ? uops_3_is_sys_pc2epc : _GEN_834; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_is_unique = 2'h3 == value_1 ? uops_3_is_unique : _GEN_830; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_flush_on_commit = 2'h3 == value_1 ? uops_3_flush_on_commit : _GEN_826; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ldst_is_rs1 = 2'h3 == value_1 ? uops_3_ldst_is_rs1 : _GEN_822; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ldst = 2'h3 == value_1 ? uops_3_ldst : _GEN_818; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_lrs1 = 2'h3 == value_1 ? uops_3_lrs1 : _GEN_814; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_lrs2 = 2'h3 == value_1 ? uops_3_lrs2 : _GEN_810; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_lrs3 = 2'h3 == value_1 ? uops_3_lrs3 : _GEN_806; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_ldst_val = 2'h3 == value_1 ? uops_3_ldst_val : _GEN_802; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_dst_rtype = 2'h3 == value_1 ? uops_3_dst_rtype : _GEN_798; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_lrs1_rtype = 2'h3 == value_1 ? uops_3_lrs1_rtype : _GEN_794; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_lrs2_rtype = 2'h3 == value_1 ? uops_3_lrs2_rtype : _GEN_790; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_frs3_en = 2'h3 == value_1 ? uops_3_frs3_en : _GEN_786; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_fp_val = 2'h3 == value_1 ? uops_3_fp_val : _GEN_782; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_fp_single = 2'h3 == value_1 ? uops_3_fp_single : _GEN_778; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_xcpt_pf_if = 2'h3 == value_1 ? uops_3_xcpt_pf_if : _GEN_774; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_xcpt_ae_if = 2'h3 == value_1 ? uops_3_xcpt_ae_if : _GEN_770; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_xcpt_ma_if = 2'h3 == value_1 ? uops_3_xcpt_ma_if : _GEN_766; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_bp_debug_if = 2'h3 == value_1 ? uops_3_bp_debug_if : _GEN_762; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_bp_xcpt_if = 2'h3 == value_1 ? uops_3_bp_xcpt_if : _GEN_758; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_debug_fsrc = 2'h3 == value_1 ? uops_3_debug_fsrc : _GEN_754; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_uop_debug_tsrc = 2'h3 == value_1 ? uops_3_debug_tsrc : _GEN_750; // @[util.scala 508:19 util.scala 508:19]
  assign io_deq_bits_data = ram_data_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  assign io_deq_bits_is_hella = ram_is_hella_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  assign io_empty = ptr_match & ~maybe_full; // @[util.scala 473:25]
  assign io_count = _T_59[1:0]; // @[util.scala 526:14]
  always @(posedge clock) begin
    if(ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_is_hella_MPORT_en & ram_is_hella_MPORT_mask) begin
      ram_is_hella[ram_is_hella_MPORT_addr] <= ram_is_hella_MPORT_data; // @[util.scala 464:20]
    end
    if (reset) begin // @[util.scala 465:24]
      valids_0 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (2'h0 == value_1) begin // @[util.scala 496:27]
        valids_0 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_0 <= _GEN_417;
      end
    end else begin
      valids_0 <= _GEN_417;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_1 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (2'h1 == value_1) begin // @[util.scala 496:27]
        valids_1 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_1 <= _GEN_418;
      end
    end else begin
      valids_1 <= _GEN_418;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_2 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (2'h2 == value_1) begin // @[util.scala 496:27]
        valids_2 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_2 <= _GEN_419;
      end
    end else begin
      valids_2 <= _GEN_419;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_3 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (2'h3 == value_1) begin // @[util.scala 496:27]
        valids_3 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_3 <= _GEN_420;
      end
    end else begin
      valids_3 <= _GEN_420;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 491:33]
        uops_0_br_mask <= _T_44; // @[util.scala 491:33]
      end else if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_0_br_mask <= _GEN_4;
      end
    end else begin
      uops_0_br_mask <= _GEN_4;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 491:33]
        uops_1_br_mask <= _T_44; // @[util.scala 491:33]
      end else if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_1_br_mask <= _GEN_5;
      end
    end else begin
      uops_1_br_mask <= _GEN_5;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 491:33]
        uops_2_br_mask <= _T_44; // @[util.scala 491:33]
      end else if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_2_br_mask <= _GEN_6;
      end
    end else begin
      uops_2_br_mask <= _GEN_6;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 491:33]
        uops_3_br_mask <= _T_44; // @[util.scala 491:33]
      end else if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_3_br_mask <= _GEN_7;
      end
    end else begin
      uops_3_br_mask <= _GEN_7;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (2'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 2'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[util.scala 487:17]
      value <= _value_T_1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 2'h0; // @[Counter.scala 60:40]
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
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_is_hella[initvar] = _RAND_1[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  valids_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  valids_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  valids_2 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  valids_3 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  uops_0_uopc = _RAND_6[6:0];
  _RAND_7 = {1{`RANDOM}};
  uops_0_inst = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  uops_0_debug_inst = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  uops_0_is_rvc = _RAND_9[0:0];
  _RAND_10 = {2{`RANDOM}};
  uops_0_debug_pc = _RAND_10[39:0];
  _RAND_11 = {1{`RANDOM}};
  uops_0_iq_type = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  uops_0_fu_code = _RAND_12[9:0];
  _RAND_13 = {1{`RANDOM}};
  uops_0_ctrl_br_type = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  uops_0_ctrl_op1_sel = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  uops_0_ctrl_op2_sel = _RAND_15[2:0];
  _RAND_16 = {1{`RANDOM}};
  uops_0_ctrl_imm_sel = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  uops_0_ctrl_op_fcn = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  uops_0_ctrl_fcn_dw = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  uops_0_ctrl_csr_cmd = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  uops_0_ctrl_is_load = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  uops_0_ctrl_is_sta = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  uops_0_ctrl_is_std = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  uops_0_iw_state = _RAND_23[1:0];
  _RAND_24 = {1{`RANDOM}};
  uops_0_iw_p1_poisoned = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  uops_0_iw_p2_poisoned = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  uops_0_is_br = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  uops_0_is_jalr = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  uops_0_is_jal = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  uops_0_is_sfb = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  uops_0_br_mask = _RAND_30[11:0];
  _RAND_31 = {1{`RANDOM}};
  uops_0_br_tag = _RAND_31[3:0];
  _RAND_32 = {1{`RANDOM}};
  uops_0_ftq_idx = _RAND_32[4:0];
  _RAND_33 = {1{`RANDOM}};
  uops_0_edge_inst = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  uops_0_pc_lob = _RAND_34[5:0];
  _RAND_35 = {1{`RANDOM}};
  uops_0_taken = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  uops_0_imm_packed = _RAND_36[19:0];
  _RAND_37 = {1{`RANDOM}};
  uops_0_csr_addr = _RAND_37[11:0];
  _RAND_38 = {1{`RANDOM}};
  uops_0_rob_idx = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  uops_0_ldq_idx = _RAND_39[3:0];
  _RAND_40 = {1{`RANDOM}};
  uops_0_stq_idx = _RAND_40[3:0];
  _RAND_41 = {1{`RANDOM}};
  uops_0_rxq_idx = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  uops_0_pdst = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  uops_0_prs1 = _RAND_43[5:0];
  _RAND_44 = {1{`RANDOM}};
  uops_0_prs2 = _RAND_44[5:0];
  _RAND_45 = {1{`RANDOM}};
  uops_0_prs3 = _RAND_45[5:0];
  _RAND_46 = {1{`RANDOM}};
  uops_0_ppred = _RAND_46[4:0];
  _RAND_47 = {1{`RANDOM}};
  uops_0_prs1_busy = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  uops_0_prs2_busy = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  uops_0_prs3_busy = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  uops_0_ppred_busy = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  uops_0_stale_pdst = _RAND_51[5:0];
  _RAND_52 = {1{`RANDOM}};
  uops_0_exception = _RAND_52[0:0];
  _RAND_53 = {2{`RANDOM}};
  uops_0_exc_cause = _RAND_53[63:0];
  _RAND_54 = {1{`RANDOM}};
  uops_0_bypassable = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  uops_0_mem_cmd = _RAND_55[4:0];
  _RAND_56 = {1{`RANDOM}};
  uops_0_mem_size = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  uops_0_mem_signed = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  uops_0_is_fence = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  uops_0_is_fencei = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  uops_0_is_amo = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  uops_0_uses_ldq = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  uops_0_uses_stq = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  uops_0_is_sys_pc2epc = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  uops_0_is_unique = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  uops_0_flush_on_commit = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  uops_0_ldst_is_rs1 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  uops_0_ldst = _RAND_67[5:0];
  _RAND_68 = {1{`RANDOM}};
  uops_0_lrs1 = _RAND_68[5:0];
  _RAND_69 = {1{`RANDOM}};
  uops_0_lrs2 = _RAND_69[5:0];
  _RAND_70 = {1{`RANDOM}};
  uops_0_lrs3 = _RAND_70[5:0];
  _RAND_71 = {1{`RANDOM}};
  uops_0_ldst_val = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  uops_0_dst_rtype = _RAND_72[1:0];
  _RAND_73 = {1{`RANDOM}};
  uops_0_lrs1_rtype = _RAND_73[1:0];
  _RAND_74 = {1{`RANDOM}};
  uops_0_lrs2_rtype = _RAND_74[1:0];
  _RAND_75 = {1{`RANDOM}};
  uops_0_frs3_en = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  uops_0_fp_val = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  uops_0_fp_single = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  uops_0_xcpt_pf_if = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  uops_0_xcpt_ae_if = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  uops_0_xcpt_ma_if = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  uops_0_bp_debug_if = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  uops_0_bp_xcpt_if = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  uops_0_debug_fsrc = _RAND_83[1:0];
  _RAND_84 = {1{`RANDOM}};
  uops_0_debug_tsrc = _RAND_84[1:0];
  _RAND_85 = {1{`RANDOM}};
  uops_1_uopc = _RAND_85[6:0];
  _RAND_86 = {1{`RANDOM}};
  uops_1_inst = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  uops_1_debug_inst = _RAND_87[31:0];
  _RAND_88 = {1{`RANDOM}};
  uops_1_is_rvc = _RAND_88[0:0];
  _RAND_89 = {2{`RANDOM}};
  uops_1_debug_pc = _RAND_89[39:0];
  _RAND_90 = {1{`RANDOM}};
  uops_1_iq_type = _RAND_90[2:0];
  _RAND_91 = {1{`RANDOM}};
  uops_1_fu_code = _RAND_91[9:0];
  _RAND_92 = {1{`RANDOM}};
  uops_1_ctrl_br_type = _RAND_92[3:0];
  _RAND_93 = {1{`RANDOM}};
  uops_1_ctrl_op1_sel = _RAND_93[1:0];
  _RAND_94 = {1{`RANDOM}};
  uops_1_ctrl_op2_sel = _RAND_94[2:0];
  _RAND_95 = {1{`RANDOM}};
  uops_1_ctrl_imm_sel = _RAND_95[2:0];
  _RAND_96 = {1{`RANDOM}};
  uops_1_ctrl_op_fcn = _RAND_96[3:0];
  _RAND_97 = {1{`RANDOM}};
  uops_1_ctrl_fcn_dw = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  uops_1_ctrl_csr_cmd = _RAND_98[2:0];
  _RAND_99 = {1{`RANDOM}};
  uops_1_ctrl_is_load = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  uops_1_ctrl_is_sta = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  uops_1_ctrl_is_std = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  uops_1_iw_state = _RAND_102[1:0];
  _RAND_103 = {1{`RANDOM}};
  uops_1_iw_p1_poisoned = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  uops_1_iw_p2_poisoned = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  uops_1_is_br = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  uops_1_is_jalr = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  uops_1_is_jal = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  uops_1_is_sfb = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  uops_1_br_mask = _RAND_109[11:0];
  _RAND_110 = {1{`RANDOM}};
  uops_1_br_tag = _RAND_110[3:0];
  _RAND_111 = {1{`RANDOM}};
  uops_1_ftq_idx = _RAND_111[4:0];
  _RAND_112 = {1{`RANDOM}};
  uops_1_edge_inst = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  uops_1_pc_lob = _RAND_113[5:0];
  _RAND_114 = {1{`RANDOM}};
  uops_1_taken = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  uops_1_imm_packed = _RAND_115[19:0];
  _RAND_116 = {1{`RANDOM}};
  uops_1_csr_addr = _RAND_116[11:0];
  _RAND_117 = {1{`RANDOM}};
  uops_1_rob_idx = _RAND_117[5:0];
  _RAND_118 = {1{`RANDOM}};
  uops_1_ldq_idx = _RAND_118[3:0];
  _RAND_119 = {1{`RANDOM}};
  uops_1_stq_idx = _RAND_119[3:0];
  _RAND_120 = {1{`RANDOM}};
  uops_1_rxq_idx = _RAND_120[1:0];
  _RAND_121 = {1{`RANDOM}};
  uops_1_pdst = _RAND_121[5:0];
  _RAND_122 = {1{`RANDOM}};
  uops_1_prs1 = _RAND_122[5:0];
  _RAND_123 = {1{`RANDOM}};
  uops_1_prs2 = _RAND_123[5:0];
  _RAND_124 = {1{`RANDOM}};
  uops_1_prs3 = _RAND_124[5:0];
  _RAND_125 = {1{`RANDOM}};
  uops_1_ppred = _RAND_125[4:0];
  _RAND_126 = {1{`RANDOM}};
  uops_1_prs1_busy = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  uops_1_prs2_busy = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  uops_1_prs3_busy = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  uops_1_ppred_busy = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  uops_1_stale_pdst = _RAND_130[5:0];
  _RAND_131 = {1{`RANDOM}};
  uops_1_exception = _RAND_131[0:0];
  _RAND_132 = {2{`RANDOM}};
  uops_1_exc_cause = _RAND_132[63:0];
  _RAND_133 = {1{`RANDOM}};
  uops_1_bypassable = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  uops_1_mem_cmd = _RAND_134[4:0];
  _RAND_135 = {1{`RANDOM}};
  uops_1_mem_size = _RAND_135[1:0];
  _RAND_136 = {1{`RANDOM}};
  uops_1_mem_signed = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  uops_1_is_fence = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  uops_1_is_fencei = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  uops_1_is_amo = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  uops_1_uses_ldq = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  uops_1_uses_stq = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  uops_1_is_sys_pc2epc = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  uops_1_is_unique = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  uops_1_flush_on_commit = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  uops_1_ldst_is_rs1 = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  uops_1_ldst = _RAND_146[5:0];
  _RAND_147 = {1{`RANDOM}};
  uops_1_lrs1 = _RAND_147[5:0];
  _RAND_148 = {1{`RANDOM}};
  uops_1_lrs2 = _RAND_148[5:0];
  _RAND_149 = {1{`RANDOM}};
  uops_1_lrs3 = _RAND_149[5:0];
  _RAND_150 = {1{`RANDOM}};
  uops_1_ldst_val = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  uops_1_dst_rtype = _RAND_151[1:0];
  _RAND_152 = {1{`RANDOM}};
  uops_1_lrs1_rtype = _RAND_152[1:0];
  _RAND_153 = {1{`RANDOM}};
  uops_1_lrs2_rtype = _RAND_153[1:0];
  _RAND_154 = {1{`RANDOM}};
  uops_1_frs3_en = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  uops_1_fp_val = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  uops_1_fp_single = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  uops_1_xcpt_pf_if = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  uops_1_xcpt_ae_if = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  uops_1_xcpt_ma_if = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  uops_1_bp_debug_if = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  uops_1_bp_xcpt_if = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  uops_1_debug_fsrc = _RAND_162[1:0];
  _RAND_163 = {1{`RANDOM}};
  uops_1_debug_tsrc = _RAND_163[1:0];
  _RAND_164 = {1{`RANDOM}};
  uops_2_uopc = _RAND_164[6:0];
  _RAND_165 = {1{`RANDOM}};
  uops_2_inst = _RAND_165[31:0];
  _RAND_166 = {1{`RANDOM}};
  uops_2_debug_inst = _RAND_166[31:0];
  _RAND_167 = {1{`RANDOM}};
  uops_2_is_rvc = _RAND_167[0:0];
  _RAND_168 = {2{`RANDOM}};
  uops_2_debug_pc = _RAND_168[39:0];
  _RAND_169 = {1{`RANDOM}};
  uops_2_iq_type = _RAND_169[2:0];
  _RAND_170 = {1{`RANDOM}};
  uops_2_fu_code = _RAND_170[9:0];
  _RAND_171 = {1{`RANDOM}};
  uops_2_ctrl_br_type = _RAND_171[3:0];
  _RAND_172 = {1{`RANDOM}};
  uops_2_ctrl_op1_sel = _RAND_172[1:0];
  _RAND_173 = {1{`RANDOM}};
  uops_2_ctrl_op2_sel = _RAND_173[2:0];
  _RAND_174 = {1{`RANDOM}};
  uops_2_ctrl_imm_sel = _RAND_174[2:0];
  _RAND_175 = {1{`RANDOM}};
  uops_2_ctrl_op_fcn = _RAND_175[3:0];
  _RAND_176 = {1{`RANDOM}};
  uops_2_ctrl_fcn_dw = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  uops_2_ctrl_csr_cmd = _RAND_177[2:0];
  _RAND_178 = {1{`RANDOM}};
  uops_2_ctrl_is_load = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  uops_2_ctrl_is_sta = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  uops_2_ctrl_is_std = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  uops_2_iw_state = _RAND_181[1:0];
  _RAND_182 = {1{`RANDOM}};
  uops_2_iw_p1_poisoned = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  uops_2_iw_p2_poisoned = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  uops_2_is_br = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  uops_2_is_jalr = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  uops_2_is_jal = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  uops_2_is_sfb = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  uops_2_br_mask = _RAND_188[11:0];
  _RAND_189 = {1{`RANDOM}};
  uops_2_br_tag = _RAND_189[3:0];
  _RAND_190 = {1{`RANDOM}};
  uops_2_ftq_idx = _RAND_190[4:0];
  _RAND_191 = {1{`RANDOM}};
  uops_2_edge_inst = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  uops_2_pc_lob = _RAND_192[5:0];
  _RAND_193 = {1{`RANDOM}};
  uops_2_taken = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  uops_2_imm_packed = _RAND_194[19:0];
  _RAND_195 = {1{`RANDOM}};
  uops_2_csr_addr = _RAND_195[11:0];
  _RAND_196 = {1{`RANDOM}};
  uops_2_rob_idx = _RAND_196[5:0];
  _RAND_197 = {1{`RANDOM}};
  uops_2_ldq_idx = _RAND_197[3:0];
  _RAND_198 = {1{`RANDOM}};
  uops_2_stq_idx = _RAND_198[3:0];
  _RAND_199 = {1{`RANDOM}};
  uops_2_rxq_idx = _RAND_199[1:0];
  _RAND_200 = {1{`RANDOM}};
  uops_2_pdst = _RAND_200[5:0];
  _RAND_201 = {1{`RANDOM}};
  uops_2_prs1 = _RAND_201[5:0];
  _RAND_202 = {1{`RANDOM}};
  uops_2_prs2 = _RAND_202[5:0];
  _RAND_203 = {1{`RANDOM}};
  uops_2_prs3 = _RAND_203[5:0];
  _RAND_204 = {1{`RANDOM}};
  uops_2_ppred = _RAND_204[4:0];
  _RAND_205 = {1{`RANDOM}};
  uops_2_prs1_busy = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  uops_2_prs2_busy = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  uops_2_prs3_busy = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  uops_2_ppred_busy = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  uops_2_stale_pdst = _RAND_209[5:0];
  _RAND_210 = {1{`RANDOM}};
  uops_2_exception = _RAND_210[0:0];
  _RAND_211 = {2{`RANDOM}};
  uops_2_exc_cause = _RAND_211[63:0];
  _RAND_212 = {1{`RANDOM}};
  uops_2_bypassable = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  uops_2_mem_cmd = _RAND_213[4:0];
  _RAND_214 = {1{`RANDOM}};
  uops_2_mem_size = _RAND_214[1:0];
  _RAND_215 = {1{`RANDOM}};
  uops_2_mem_signed = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  uops_2_is_fence = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  uops_2_is_fencei = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  uops_2_is_amo = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  uops_2_uses_ldq = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  uops_2_uses_stq = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  uops_2_is_sys_pc2epc = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  uops_2_is_unique = _RAND_222[0:0];
  _RAND_223 = {1{`RANDOM}};
  uops_2_flush_on_commit = _RAND_223[0:0];
  _RAND_224 = {1{`RANDOM}};
  uops_2_ldst_is_rs1 = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  uops_2_ldst = _RAND_225[5:0];
  _RAND_226 = {1{`RANDOM}};
  uops_2_lrs1 = _RAND_226[5:0];
  _RAND_227 = {1{`RANDOM}};
  uops_2_lrs2 = _RAND_227[5:0];
  _RAND_228 = {1{`RANDOM}};
  uops_2_lrs3 = _RAND_228[5:0];
  _RAND_229 = {1{`RANDOM}};
  uops_2_ldst_val = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  uops_2_dst_rtype = _RAND_230[1:0];
  _RAND_231 = {1{`RANDOM}};
  uops_2_lrs1_rtype = _RAND_231[1:0];
  _RAND_232 = {1{`RANDOM}};
  uops_2_lrs2_rtype = _RAND_232[1:0];
  _RAND_233 = {1{`RANDOM}};
  uops_2_frs3_en = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  uops_2_fp_val = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  uops_2_fp_single = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  uops_2_xcpt_pf_if = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  uops_2_xcpt_ae_if = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  uops_2_xcpt_ma_if = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  uops_2_bp_debug_if = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  uops_2_bp_xcpt_if = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  uops_2_debug_fsrc = _RAND_241[1:0];
  _RAND_242 = {1{`RANDOM}};
  uops_2_debug_tsrc = _RAND_242[1:0];
  _RAND_243 = {1{`RANDOM}};
  uops_3_uopc = _RAND_243[6:0];
  _RAND_244 = {1{`RANDOM}};
  uops_3_inst = _RAND_244[31:0];
  _RAND_245 = {1{`RANDOM}};
  uops_3_debug_inst = _RAND_245[31:0];
  _RAND_246 = {1{`RANDOM}};
  uops_3_is_rvc = _RAND_246[0:0];
  _RAND_247 = {2{`RANDOM}};
  uops_3_debug_pc = _RAND_247[39:0];
  _RAND_248 = {1{`RANDOM}};
  uops_3_iq_type = _RAND_248[2:0];
  _RAND_249 = {1{`RANDOM}};
  uops_3_fu_code = _RAND_249[9:0];
  _RAND_250 = {1{`RANDOM}};
  uops_3_ctrl_br_type = _RAND_250[3:0];
  _RAND_251 = {1{`RANDOM}};
  uops_3_ctrl_op1_sel = _RAND_251[1:0];
  _RAND_252 = {1{`RANDOM}};
  uops_3_ctrl_op2_sel = _RAND_252[2:0];
  _RAND_253 = {1{`RANDOM}};
  uops_3_ctrl_imm_sel = _RAND_253[2:0];
  _RAND_254 = {1{`RANDOM}};
  uops_3_ctrl_op_fcn = _RAND_254[3:0];
  _RAND_255 = {1{`RANDOM}};
  uops_3_ctrl_fcn_dw = _RAND_255[0:0];
  _RAND_256 = {1{`RANDOM}};
  uops_3_ctrl_csr_cmd = _RAND_256[2:0];
  _RAND_257 = {1{`RANDOM}};
  uops_3_ctrl_is_load = _RAND_257[0:0];
  _RAND_258 = {1{`RANDOM}};
  uops_3_ctrl_is_sta = _RAND_258[0:0];
  _RAND_259 = {1{`RANDOM}};
  uops_3_ctrl_is_std = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  uops_3_iw_state = _RAND_260[1:0];
  _RAND_261 = {1{`RANDOM}};
  uops_3_iw_p1_poisoned = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  uops_3_iw_p2_poisoned = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  uops_3_is_br = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  uops_3_is_jalr = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  uops_3_is_jal = _RAND_265[0:0];
  _RAND_266 = {1{`RANDOM}};
  uops_3_is_sfb = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  uops_3_br_mask = _RAND_267[11:0];
  _RAND_268 = {1{`RANDOM}};
  uops_3_br_tag = _RAND_268[3:0];
  _RAND_269 = {1{`RANDOM}};
  uops_3_ftq_idx = _RAND_269[4:0];
  _RAND_270 = {1{`RANDOM}};
  uops_3_edge_inst = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  uops_3_pc_lob = _RAND_271[5:0];
  _RAND_272 = {1{`RANDOM}};
  uops_3_taken = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  uops_3_imm_packed = _RAND_273[19:0];
  _RAND_274 = {1{`RANDOM}};
  uops_3_csr_addr = _RAND_274[11:0];
  _RAND_275 = {1{`RANDOM}};
  uops_3_rob_idx = _RAND_275[5:0];
  _RAND_276 = {1{`RANDOM}};
  uops_3_ldq_idx = _RAND_276[3:0];
  _RAND_277 = {1{`RANDOM}};
  uops_3_stq_idx = _RAND_277[3:0];
  _RAND_278 = {1{`RANDOM}};
  uops_3_rxq_idx = _RAND_278[1:0];
  _RAND_279 = {1{`RANDOM}};
  uops_3_pdst = _RAND_279[5:0];
  _RAND_280 = {1{`RANDOM}};
  uops_3_prs1 = _RAND_280[5:0];
  _RAND_281 = {1{`RANDOM}};
  uops_3_prs2 = _RAND_281[5:0];
  _RAND_282 = {1{`RANDOM}};
  uops_3_prs3 = _RAND_282[5:0];
  _RAND_283 = {1{`RANDOM}};
  uops_3_ppred = _RAND_283[4:0];
  _RAND_284 = {1{`RANDOM}};
  uops_3_prs1_busy = _RAND_284[0:0];
  _RAND_285 = {1{`RANDOM}};
  uops_3_prs2_busy = _RAND_285[0:0];
  _RAND_286 = {1{`RANDOM}};
  uops_3_prs3_busy = _RAND_286[0:0];
  _RAND_287 = {1{`RANDOM}};
  uops_3_ppred_busy = _RAND_287[0:0];
  _RAND_288 = {1{`RANDOM}};
  uops_3_stale_pdst = _RAND_288[5:0];
  _RAND_289 = {1{`RANDOM}};
  uops_3_exception = _RAND_289[0:0];
  _RAND_290 = {2{`RANDOM}};
  uops_3_exc_cause = _RAND_290[63:0];
  _RAND_291 = {1{`RANDOM}};
  uops_3_bypassable = _RAND_291[0:0];
  _RAND_292 = {1{`RANDOM}};
  uops_3_mem_cmd = _RAND_292[4:0];
  _RAND_293 = {1{`RANDOM}};
  uops_3_mem_size = _RAND_293[1:0];
  _RAND_294 = {1{`RANDOM}};
  uops_3_mem_signed = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  uops_3_is_fence = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  uops_3_is_fencei = _RAND_296[0:0];
  _RAND_297 = {1{`RANDOM}};
  uops_3_is_amo = _RAND_297[0:0];
  _RAND_298 = {1{`RANDOM}};
  uops_3_uses_ldq = _RAND_298[0:0];
  _RAND_299 = {1{`RANDOM}};
  uops_3_uses_stq = _RAND_299[0:0];
  _RAND_300 = {1{`RANDOM}};
  uops_3_is_sys_pc2epc = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  uops_3_is_unique = _RAND_301[0:0];
  _RAND_302 = {1{`RANDOM}};
  uops_3_flush_on_commit = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  uops_3_ldst_is_rs1 = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  uops_3_ldst = _RAND_304[5:0];
  _RAND_305 = {1{`RANDOM}};
  uops_3_lrs1 = _RAND_305[5:0];
  _RAND_306 = {1{`RANDOM}};
  uops_3_lrs2 = _RAND_306[5:0];
  _RAND_307 = {1{`RANDOM}};
  uops_3_lrs3 = _RAND_307[5:0];
  _RAND_308 = {1{`RANDOM}};
  uops_3_ldst_val = _RAND_308[0:0];
  _RAND_309 = {1{`RANDOM}};
  uops_3_dst_rtype = _RAND_309[1:0];
  _RAND_310 = {1{`RANDOM}};
  uops_3_lrs1_rtype = _RAND_310[1:0];
  _RAND_311 = {1{`RANDOM}};
  uops_3_lrs2_rtype = _RAND_311[1:0];
  _RAND_312 = {1{`RANDOM}};
  uops_3_frs3_en = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  uops_3_fp_val = _RAND_313[0:0];
  _RAND_314 = {1{`RANDOM}};
  uops_3_fp_single = _RAND_314[0:0];
  _RAND_315 = {1{`RANDOM}};
  uops_3_xcpt_pf_if = _RAND_315[0:0];
  _RAND_316 = {1{`RANDOM}};
  uops_3_xcpt_ae_if = _RAND_316[0:0];
  _RAND_317 = {1{`RANDOM}};
  uops_3_xcpt_ma_if = _RAND_317[0:0];
  _RAND_318 = {1{`RANDOM}};
  uops_3_bp_debug_if = _RAND_318[0:0];
  _RAND_319 = {1{`RANDOM}};
  uops_3_bp_xcpt_if = _RAND_319[0:0];
  _RAND_320 = {1{`RANDOM}};
  uops_3_debug_fsrc = _RAND_320[1:0];
  _RAND_321 = {1{`RANDOM}};
  uops_3_debug_tsrc = _RAND_321[1:0];
  _RAND_322 = {1{`RANDOM}};
  value = _RAND_322[1:0];
  _RAND_323 = {1{`RANDOM}};
  value_1 = _RAND_323[1:0];
  _RAND_324 = {1{`RANDOM}};
  maybe_full = _RAND_324[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
