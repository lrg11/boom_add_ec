module RegisterRead(
  input         clock,
  input         reset,
  input         io_iss_valids_0,
  input  [6:0]  io_iss_uops_0_uopc,
  input  [31:0] io_iss_uops_0_inst,
  input  [31:0] io_iss_uops_0_debug_inst,
  input         io_iss_uops_0_is_rvc,
  input  [39:0] io_iss_uops_0_debug_pc,
  input  [2:0]  io_iss_uops_0_iq_type,
  input  [9:0]  io_iss_uops_0_fu_code,
  input  [3:0]  io_iss_uops_0_ctrl_br_type,
  input  [1:0]  io_iss_uops_0_ctrl_op1_sel,
  input  [2:0]  io_iss_uops_0_ctrl_op2_sel,
  input  [2:0]  io_iss_uops_0_ctrl_imm_sel,
  input  [3:0]  io_iss_uops_0_ctrl_op_fcn,
  input         io_iss_uops_0_ctrl_fcn_dw,
  input  [2:0]  io_iss_uops_0_ctrl_csr_cmd,
  input         io_iss_uops_0_ctrl_is_load,
  input         io_iss_uops_0_ctrl_is_sta,
  input         io_iss_uops_0_ctrl_is_std,
  input  [1:0]  io_iss_uops_0_iw_state,
  input         io_iss_uops_0_iw_p1_poisoned,
  input         io_iss_uops_0_iw_p2_poisoned,
  input         io_iss_uops_0_is_br,
  input         io_iss_uops_0_is_jalr,
  input         io_iss_uops_0_is_jal,
  input         io_iss_uops_0_is_sfb,
  input  [11:0] io_iss_uops_0_br_mask,
  input  [3:0]  io_iss_uops_0_br_tag,
  input  [4:0]  io_iss_uops_0_ftq_idx,
  input         io_iss_uops_0_edge_inst,
  input  [5:0]  io_iss_uops_0_pc_lob,
  input         io_iss_uops_0_taken,
  input  [19:0] io_iss_uops_0_imm_packed,
  input  [11:0] io_iss_uops_0_csr_addr,
  input  [5:0]  io_iss_uops_0_rob_idx,
  input  [3:0]  io_iss_uops_0_ldq_idx,
  input  [3:0]  io_iss_uops_0_stq_idx,
  input  [1:0]  io_iss_uops_0_rxq_idx,
  input  [5:0]  io_iss_uops_0_pdst,
  input  [5:0]  io_iss_uops_0_prs1,
  input  [5:0]  io_iss_uops_0_prs2,
  input  [5:0]  io_iss_uops_0_prs3,
  input  [4:0]  io_iss_uops_0_ppred,
  input         io_iss_uops_0_prs1_busy,
  input         io_iss_uops_0_prs2_busy,
  input         io_iss_uops_0_prs3_busy,
  input         io_iss_uops_0_ppred_busy,
  input  [5:0]  io_iss_uops_0_stale_pdst,
  input         io_iss_uops_0_exception,
  input  [63:0] io_iss_uops_0_exc_cause,
  input         io_iss_uops_0_bypassable,
  input  [4:0]  io_iss_uops_0_mem_cmd,
  input  [1:0]  io_iss_uops_0_mem_size,
  input         io_iss_uops_0_mem_signed,
  input         io_iss_uops_0_is_fence,
  input         io_iss_uops_0_is_fencei,
  input         io_iss_uops_0_is_amo,
  input         io_iss_uops_0_uses_ldq,
  input         io_iss_uops_0_uses_stq,
  input         io_iss_uops_0_is_sys_pc2epc,
  input         io_iss_uops_0_is_unique,
  input         io_iss_uops_0_flush_on_commit,
  input         io_iss_uops_0_ldst_is_rs1,
  input  [5:0]  io_iss_uops_0_ldst,
  input  [5:0]  io_iss_uops_0_lrs1,
  input  [5:0]  io_iss_uops_0_lrs2,
  input  [5:0]  io_iss_uops_0_lrs3,
  input         io_iss_uops_0_ldst_val,
  input  [1:0]  io_iss_uops_0_dst_rtype,
  input  [1:0]  io_iss_uops_0_lrs1_rtype,
  input  [1:0]  io_iss_uops_0_lrs2_rtype,
  input         io_iss_uops_0_frs3_en,
  input         io_iss_uops_0_fp_val,
  input         io_iss_uops_0_fp_single,
  input         io_iss_uops_0_xcpt_pf_if,
  input         io_iss_uops_0_xcpt_ae_if,
  input         io_iss_uops_0_xcpt_ma_if,
  input         io_iss_uops_0_bp_debug_if,
  input         io_iss_uops_0_bp_xcpt_if,
  input  [1:0]  io_iss_uops_0_debug_fsrc,
  input  [1:0]  io_iss_uops_0_debug_tsrc,
  output [5:0]  io_rf_read_ports_0_addr,
  input  [64:0] io_rf_read_ports_0_data,
  output [5:0]  io_rf_read_ports_1_addr,
  input  [64:0] io_rf_read_ports_1_data,
  output [5:0]  io_rf_read_ports_2_addr,
  input  [64:0] io_rf_read_ports_2_data,
  output [4:0]  io_prf_read_ports_0_addr,
  input         io_prf_read_ports_0_data,
  input         io_exe_reqs_0_ready,
  output        io_exe_reqs_0_valid,
  output [6:0]  io_exe_reqs_0_bits_uop_uopc,
  output [31:0] io_exe_reqs_0_bits_uop_inst,
  output [31:0] io_exe_reqs_0_bits_uop_debug_inst,
  output        io_exe_reqs_0_bits_uop_is_rvc,
  output [39:0] io_exe_reqs_0_bits_uop_debug_pc,
  output [2:0]  io_exe_reqs_0_bits_uop_iq_type,
  output [9:0]  io_exe_reqs_0_bits_uop_fu_code,
  output [3:0]  io_exe_reqs_0_bits_uop_ctrl_br_type,
  output [1:0]  io_exe_reqs_0_bits_uop_ctrl_op1_sel,
  output [2:0]  io_exe_reqs_0_bits_uop_ctrl_op2_sel,
  output [2:0]  io_exe_reqs_0_bits_uop_ctrl_imm_sel,
  output [3:0]  io_exe_reqs_0_bits_uop_ctrl_op_fcn,
  output        io_exe_reqs_0_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_exe_reqs_0_bits_uop_ctrl_csr_cmd,
  output        io_exe_reqs_0_bits_uop_ctrl_is_load,
  output        io_exe_reqs_0_bits_uop_ctrl_is_sta,
  output        io_exe_reqs_0_bits_uop_ctrl_is_std,
  output [1:0]  io_exe_reqs_0_bits_uop_iw_state,
  output        io_exe_reqs_0_bits_uop_iw_p1_poisoned,
  output        io_exe_reqs_0_bits_uop_iw_p2_poisoned,
  output        io_exe_reqs_0_bits_uop_is_br,
  output        io_exe_reqs_0_bits_uop_is_jalr,
  output        io_exe_reqs_0_bits_uop_is_jal,
  output        io_exe_reqs_0_bits_uop_is_sfb,
  output [11:0] io_exe_reqs_0_bits_uop_br_mask,
  output [3:0]  io_exe_reqs_0_bits_uop_br_tag,
  output [4:0]  io_exe_reqs_0_bits_uop_ftq_idx,
  output        io_exe_reqs_0_bits_uop_edge_inst,
  output [5:0]  io_exe_reqs_0_bits_uop_pc_lob,
  output        io_exe_reqs_0_bits_uop_taken,
  output [19:0] io_exe_reqs_0_bits_uop_imm_packed,
  output [11:0] io_exe_reqs_0_bits_uop_csr_addr,
  output [5:0]  io_exe_reqs_0_bits_uop_rob_idx,
  output [3:0]  io_exe_reqs_0_bits_uop_ldq_idx,
  output [3:0]  io_exe_reqs_0_bits_uop_stq_idx,
  output [1:0]  io_exe_reqs_0_bits_uop_rxq_idx,
  output [5:0]  io_exe_reqs_0_bits_uop_pdst,
  output [5:0]  io_exe_reqs_0_bits_uop_prs1,
  output [5:0]  io_exe_reqs_0_bits_uop_prs2,
  output [5:0]  io_exe_reqs_0_bits_uop_prs3,
  output [4:0]  io_exe_reqs_0_bits_uop_ppred,
  output        io_exe_reqs_0_bits_uop_prs1_busy,
  output        io_exe_reqs_0_bits_uop_prs2_busy,
  output        io_exe_reqs_0_bits_uop_prs3_busy,
  output        io_exe_reqs_0_bits_uop_ppred_busy,
  output [5:0]  io_exe_reqs_0_bits_uop_stale_pdst,
  output        io_exe_reqs_0_bits_uop_exception,
  output [63:0] io_exe_reqs_0_bits_uop_exc_cause,
  output        io_exe_reqs_0_bits_uop_bypassable,
  output [4:0]  io_exe_reqs_0_bits_uop_mem_cmd,
  output [1:0]  io_exe_reqs_0_bits_uop_mem_size,
  output        io_exe_reqs_0_bits_uop_mem_signed,
  output        io_exe_reqs_0_bits_uop_is_fence,
  output        io_exe_reqs_0_bits_uop_is_fencei,
  output        io_exe_reqs_0_bits_uop_is_amo,
  output        io_exe_reqs_0_bits_uop_uses_ldq,
  output        io_exe_reqs_0_bits_uop_uses_stq,
  output        io_exe_reqs_0_bits_uop_is_sys_pc2epc,
  output        io_exe_reqs_0_bits_uop_is_unique,
  output        io_exe_reqs_0_bits_uop_flush_on_commit,
  output        io_exe_reqs_0_bits_uop_ldst_is_rs1,
  output [5:0]  io_exe_reqs_0_bits_uop_ldst,
  output [5:0]  io_exe_reqs_0_bits_uop_lrs1,
  output [5:0]  io_exe_reqs_0_bits_uop_lrs2,
  output [5:0]  io_exe_reqs_0_bits_uop_lrs3,
  output        io_exe_reqs_0_bits_uop_ldst_val,
  output [1:0]  io_exe_reqs_0_bits_uop_dst_rtype,
  output [1:0]  io_exe_reqs_0_bits_uop_lrs1_rtype,
  output [1:0]  io_exe_reqs_0_bits_uop_lrs2_rtype,
  output        io_exe_reqs_0_bits_uop_frs3_en,
  output        io_exe_reqs_0_bits_uop_fp_val,
  output        io_exe_reqs_0_bits_uop_fp_single,
  output        io_exe_reqs_0_bits_uop_xcpt_pf_if,
  output        io_exe_reqs_0_bits_uop_xcpt_ae_if,
  output        io_exe_reqs_0_bits_uop_xcpt_ma_if,
  output        io_exe_reqs_0_bits_uop_bp_debug_if,
  output        io_exe_reqs_0_bits_uop_bp_xcpt_if,
  output [1:0]  io_exe_reqs_0_bits_uop_debug_fsrc,
  output [1:0]  io_exe_reqs_0_bits_uop_debug_tsrc,
  output [64:0] io_exe_reqs_0_bits_rs1_data,
  output [64:0] io_exe_reqs_0_bits_rs2_data,
  output [64:0] io_exe_reqs_0_bits_rs3_data,
  output        io_exe_reqs_0_bits_pred_data,
  output        io_exe_reqs_0_bits_kill,
  input         io_kill,
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
  input  [20:0] io_brupdate_b2_target_offset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
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
  reg [63:0] _RAND_48;
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
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [95:0] _RAND_80;
  reg [95:0] _RAND_81;
  reg [95:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [63:0] _RAND_88;
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
  reg [63:0] _RAND_131;
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
`endif // RANDOMIZE_REG_INIT
  wire  RegisterReadDecode_clock; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_reset; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_valid; // @[register-read.scala 80:33]
  wire [6:0] RegisterReadDecode_io_iss_uop_uopc; // @[register-read.scala 80:33]
  wire [31:0] RegisterReadDecode_io_iss_uop_inst; // @[register-read.scala 80:33]
  wire [31:0] RegisterReadDecode_io_iss_uop_debug_inst; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_is_rvc; // @[register-read.scala 80:33]
  wire [39:0] RegisterReadDecode_io_iss_uop_debug_pc; // @[register-read.scala 80:33]
  wire [2:0] RegisterReadDecode_io_iss_uop_iq_type; // @[register-read.scala 80:33]
  wire [9:0] RegisterReadDecode_io_iss_uop_fu_code; // @[register-read.scala 80:33]
  wire [3:0] RegisterReadDecode_io_iss_uop_ctrl_br_type; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_iss_uop_ctrl_op1_sel; // @[register-read.scala 80:33]
  wire [2:0] RegisterReadDecode_io_iss_uop_ctrl_op2_sel; // @[register-read.scala 80:33]
  wire [2:0] RegisterReadDecode_io_iss_uop_ctrl_imm_sel; // @[register-read.scala 80:33]
  wire [3:0] RegisterReadDecode_io_iss_uop_ctrl_op_fcn; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_ctrl_fcn_dw; // @[register-read.scala 80:33]
  wire [2:0] RegisterReadDecode_io_iss_uop_ctrl_csr_cmd; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_ctrl_is_load; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_ctrl_is_sta; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_ctrl_is_std; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_iss_uop_iw_state; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_iw_p1_poisoned; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_iw_p2_poisoned; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_is_br; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_is_jalr; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_is_jal; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_is_sfb; // @[register-read.scala 80:33]
  wire [11:0] RegisterReadDecode_io_iss_uop_br_mask; // @[register-read.scala 80:33]
  wire [3:0] RegisterReadDecode_io_iss_uop_br_tag; // @[register-read.scala 80:33]
  wire [4:0] RegisterReadDecode_io_iss_uop_ftq_idx; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_edge_inst; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_iss_uop_pc_lob; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_taken; // @[register-read.scala 80:33]
  wire [19:0] RegisterReadDecode_io_iss_uop_imm_packed; // @[register-read.scala 80:33]
  wire [11:0] RegisterReadDecode_io_iss_uop_csr_addr; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_iss_uop_rob_idx; // @[register-read.scala 80:33]
  wire [3:0] RegisterReadDecode_io_iss_uop_ldq_idx; // @[register-read.scala 80:33]
  wire [3:0] RegisterReadDecode_io_iss_uop_stq_idx; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_iss_uop_rxq_idx; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_iss_uop_pdst; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_iss_uop_prs1; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_iss_uop_prs2; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_iss_uop_prs3; // @[register-read.scala 80:33]
  wire [4:0] RegisterReadDecode_io_iss_uop_ppred; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_prs1_busy; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_prs2_busy; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_prs3_busy; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_ppred_busy; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_iss_uop_stale_pdst; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_exception; // @[register-read.scala 80:33]
  wire [63:0] RegisterReadDecode_io_iss_uop_exc_cause; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_bypassable; // @[register-read.scala 80:33]
  wire [4:0] RegisterReadDecode_io_iss_uop_mem_cmd; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_iss_uop_mem_size; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_mem_signed; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_is_fence; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_is_fencei; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_is_amo; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_uses_ldq; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_uses_stq; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_is_sys_pc2epc; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_is_unique; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_flush_on_commit; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_ldst_is_rs1; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_iss_uop_ldst; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_iss_uop_lrs1; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_iss_uop_lrs2; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_iss_uop_lrs3; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_ldst_val; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_iss_uop_dst_rtype; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_iss_uop_lrs1_rtype; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_iss_uop_lrs2_rtype; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_frs3_en; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_fp_val; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_fp_single; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_xcpt_pf_if; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_xcpt_ae_if; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_xcpt_ma_if; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_bp_debug_if; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_iss_uop_bp_xcpt_if; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_iss_uop_debug_fsrc; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_iss_uop_debug_tsrc; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_valid; // @[register-read.scala 80:33]
  wire [6:0] RegisterReadDecode_io_rrd_uop_uopc; // @[register-read.scala 80:33]
  wire [31:0] RegisterReadDecode_io_rrd_uop_inst; // @[register-read.scala 80:33]
  wire [31:0] RegisterReadDecode_io_rrd_uop_debug_inst; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_is_rvc; // @[register-read.scala 80:33]
  wire [39:0] RegisterReadDecode_io_rrd_uop_debug_pc; // @[register-read.scala 80:33]
  wire [2:0] RegisterReadDecode_io_rrd_uop_iq_type; // @[register-read.scala 80:33]
  wire [9:0] RegisterReadDecode_io_rrd_uop_fu_code; // @[register-read.scala 80:33]
  wire [3:0] RegisterReadDecode_io_rrd_uop_ctrl_br_type; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_rrd_uop_ctrl_op1_sel; // @[register-read.scala 80:33]
  wire [2:0] RegisterReadDecode_io_rrd_uop_ctrl_op2_sel; // @[register-read.scala 80:33]
  wire [2:0] RegisterReadDecode_io_rrd_uop_ctrl_imm_sel; // @[register-read.scala 80:33]
  wire [3:0] RegisterReadDecode_io_rrd_uop_ctrl_op_fcn; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_ctrl_fcn_dw; // @[register-read.scala 80:33]
  wire [2:0] RegisterReadDecode_io_rrd_uop_ctrl_csr_cmd; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_ctrl_is_load; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_ctrl_is_sta; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_ctrl_is_std; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_rrd_uop_iw_state; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_iw_p1_poisoned; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_iw_p2_poisoned; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_is_br; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_is_jalr; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_is_jal; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_is_sfb; // @[register-read.scala 80:33]
  wire [11:0] RegisterReadDecode_io_rrd_uop_br_mask; // @[register-read.scala 80:33]
  wire [3:0] RegisterReadDecode_io_rrd_uop_br_tag; // @[register-read.scala 80:33]
  wire [4:0] RegisterReadDecode_io_rrd_uop_ftq_idx; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_edge_inst; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_rrd_uop_pc_lob; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_taken; // @[register-read.scala 80:33]
  wire [19:0] RegisterReadDecode_io_rrd_uop_imm_packed; // @[register-read.scala 80:33]
  wire [11:0] RegisterReadDecode_io_rrd_uop_csr_addr; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_rrd_uop_rob_idx; // @[register-read.scala 80:33]
  wire [3:0] RegisterReadDecode_io_rrd_uop_ldq_idx; // @[register-read.scala 80:33]
  wire [3:0] RegisterReadDecode_io_rrd_uop_stq_idx; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_rrd_uop_rxq_idx; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_rrd_uop_pdst; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_rrd_uop_prs1; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_rrd_uop_prs2; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_rrd_uop_prs3; // @[register-read.scala 80:33]
  wire [4:0] RegisterReadDecode_io_rrd_uop_ppred; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_prs1_busy; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_prs2_busy; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_prs3_busy; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_ppred_busy; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_rrd_uop_stale_pdst; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_exception; // @[register-read.scala 80:33]
  wire [63:0] RegisterReadDecode_io_rrd_uop_exc_cause; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_bypassable; // @[register-read.scala 80:33]
  wire [4:0] RegisterReadDecode_io_rrd_uop_mem_cmd; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_rrd_uop_mem_size; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_mem_signed; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_is_fence; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_is_fencei; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_is_amo; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_uses_ldq; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_uses_stq; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_is_sys_pc2epc; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_is_unique; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_flush_on_commit; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_ldst_is_rs1; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_rrd_uop_ldst; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_rrd_uop_lrs1; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_rrd_uop_lrs2; // @[register-read.scala 80:33]
  wire [5:0] RegisterReadDecode_io_rrd_uop_lrs3; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_ldst_val; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_rrd_uop_dst_rtype; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_rrd_uop_lrs1_rtype; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_rrd_uop_lrs2_rtype; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_frs3_en; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_fp_val; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_fp_single; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_xcpt_pf_if; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_xcpt_ae_if; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_xcpt_ma_if; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_bp_debug_if; // @[register-read.scala 80:33]
  wire  RegisterReadDecode_io_rrd_uop_bp_xcpt_if; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_rrd_uop_debug_fsrc; // @[register-read.scala 80:33]
  wire [1:0] RegisterReadDecode_io_rrd_uop_debug_tsrc; // @[register-read.scala 80:33]
  reg  exe_reg_valids_0; // @[register-read.scala 69:33]
  reg [6:0] exe_reg_uops_0_uopc; // @[register-read.scala 70:29]
  reg [31:0] exe_reg_uops_0_inst; // @[register-read.scala 70:29]
  reg [31:0] exe_reg_uops_0_debug_inst; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_is_rvc; // @[register-read.scala 70:29]
  reg [39:0] exe_reg_uops_0_debug_pc; // @[register-read.scala 70:29]
  reg [2:0] exe_reg_uops_0_iq_type; // @[register-read.scala 70:29]
  reg [9:0] exe_reg_uops_0_fu_code; // @[register-read.scala 70:29]
  reg [3:0] exe_reg_uops_0_ctrl_br_type; // @[register-read.scala 70:29]
  reg [1:0] exe_reg_uops_0_ctrl_op1_sel; // @[register-read.scala 70:29]
  reg [2:0] exe_reg_uops_0_ctrl_op2_sel; // @[register-read.scala 70:29]
  reg [2:0] exe_reg_uops_0_ctrl_imm_sel; // @[register-read.scala 70:29]
  reg [3:0] exe_reg_uops_0_ctrl_op_fcn; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_ctrl_fcn_dw; // @[register-read.scala 70:29]
  reg [2:0] exe_reg_uops_0_ctrl_csr_cmd; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_ctrl_is_load; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_ctrl_is_sta; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_ctrl_is_std; // @[register-read.scala 70:29]
  reg [1:0] exe_reg_uops_0_iw_state; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_iw_p1_poisoned; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_iw_p2_poisoned; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_is_br; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_is_jalr; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_is_jal; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_is_sfb; // @[register-read.scala 70:29]
  reg [11:0] exe_reg_uops_0_br_mask; // @[register-read.scala 70:29]
  reg [3:0] exe_reg_uops_0_br_tag; // @[register-read.scala 70:29]
  reg [4:0] exe_reg_uops_0_ftq_idx; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_edge_inst; // @[register-read.scala 70:29]
  reg [5:0] exe_reg_uops_0_pc_lob; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_taken; // @[register-read.scala 70:29]
  reg [19:0] exe_reg_uops_0_imm_packed; // @[register-read.scala 70:29]
  reg [11:0] exe_reg_uops_0_csr_addr; // @[register-read.scala 70:29]
  reg [5:0] exe_reg_uops_0_rob_idx; // @[register-read.scala 70:29]
  reg [3:0] exe_reg_uops_0_ldq_idx; // @[register-read.scala 70:29]
  reg [3:0] exe_reg_uops_0_stq_idx; // @[register-read.scala 70:29]
  reg [1:0] exe_reg_uops_0_rxq_idx; // @[register-read.scala 70:29]
  reg [5:0] exe_reg_uops_0_pdst; // @[register-read.scala 70:29]
  reg [5:0] exe_reg_uops_0_prs1; // @[register-read.scala 70:29]
  reg [5:0] exe_reg_uops_0_prs2; // @[register-read.scala 70:29]
  reg [5:0] exe_reg_uops_0_prs3; // @[register-read.scala 70:29]
  reg [4:0] exe_reg_uops_0_ppred; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_prs1_busy; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_prs2_busy; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_prs3_busy; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_ppred_busy; // @[register-read.scala 70:29]
  reg [5:0] exe_reg_uops_0_stale_pdst; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_exception; // @[register-read.scala 70:29]
  reg [63:0] exe_reg_uops_0_exc_cause; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_bypassable; // @[register-read.scala 70:29]
  reg [4:0] exe_reg_uops_0_mem_cmd; // @[register-read.scala 70:29]
  reg [1:0] exe_reg_uops_0_mem_size; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_mem_signed; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_is_fence; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_is_fencei; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_is_amo; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_uses_ldq; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_uses_stq; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_is_sys_pc2epc; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_is_unique; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_flush_on_commit; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_ldst_is_rs1; // @[register-read.scala 70:29]
  reg [5:0] exe_reg_uops_0_ldst; // @[register-read.scala 70:29]
  reg [5:0] exe_reg_uops_0_lrs1; // @[register-read.scala 70:29]
  reg [5:0] exe_reg_uops_0_lrs2; // @[register-read.scala 70:29]
  reg [5:0] exe_reg_uops_0_lrs3; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_ldst_val; // @[register-read.scala 70:29]
  reg [1:0] exe_reg_uops_0_dst_rtype; // @[register-read.scala 70:29]
  reg [1:0] exe_reg_uops_0_lrs1_rtype; // @[register-read.scala 70:29]
  reg [1:0] exe_reg_uops_0_lrs2_rtype; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_frs3_en; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_fp_val; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_fp_single; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_xcpt_pf_if; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_xcpt_ae_if; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_xcpt_ma_if; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_bp_debug_if; // @[register-read.scala 70:29]
  reg  exe_reg_uops_0_bp_xcpt_if; // @[register-read.scala 70:29]
  reg [1:0] exe_reg_uops_0_debug_fsrc; // @[register-read.scala 70:29]
  reg [1:0] exe_reg_uops_0_debug_tsrc; // @[register-read.scala 70:29]
  reg [64:0] exe_reg_rs1_data_0; // @[register-read.scala 71:29]
  reg [64:0] exe_reg_rs2_data_0; // @[register-read.scala 72:29]
  reg [64:0] exe_reg_rs3_data_0; // @[register-read.scala 73:29]
  wire [11:0] _T = io_brupdate_b1_mispredict_mask & RegisterReadDecode_io_rrd_uop_br_mask; // @[util.scala 118:51]
  wire  _T_1 = _T != 12'h0; // @[util.scala 118:59]
  wire  _T_2 = ~_T_1; // @[register-read.scala 85:17]
  reg  REG; // @[register-read.scala 84:29]
  wire [11:0] _T_4 = ~io_brupdate_b1_resolve_mask; // @[util.scala 74:37]
  reg [6:0] REG_1_uopc; // @[register-read.scala 86:29]
  reg [31:0] REG_1_inst; // @[register-read.scala 86:29]
  reg [31:0] REG_1_debug_inst; // @[register-read.scala 86:29]
  reg  REG_1_is_rvc; // @[register-read.scala 86:29]
  reg [39:0] REG_1_debug_pc; // @[register-read.scala 86:29]
  reg [2:0] REG_1_iq_type; // @[register-read.scala 86:29]
  reg [9:0] REG_1_fu_code; // @[register-read.scala 86:29]
  reg [3:0] REG_1_ctrl_br_type; // @[register-read.scala 86:29]
  reg [1:0] REG_1_ctrl_op1_sel; // @[register-read.scala 86:29]
  reg [2:0] REG_1_ctrl_op2_sel; // @[register-read.scala 86:29]
  reg [2:0] REG_1_ctrl_imm_sel; // @[register-read.scala 86:29]
  reg [3:0] REG_1_ctrl_op_fcn; // @[register-read.scala 86:29]
  reg  REG_1_ctrl_fcn_dw; // @[register-read.scala 86:29]
  reg [2:0] REG_1_ctrl_csr_cmd; // @[register-read.scala 86:29]
  reg  REG_1_ctrl_is_load; // @[register-read.scala 86:29]
  reg  REG_1_ctrl_is_sta; // @[register-read.scala 86:29]
  reg  REG_1_ctrl_is_std; // @[register-read.scala 86:29]
  reg [1:0] REG_1_iw_state; // @[register-read.scala 86:29]
  reg  REG_1_iw_p1_poisoned; // @[register-read.scala 86:29]
  reg  REG_1_iw_p2_poisoned; // @[register-read.scala 86:29]
  reg  REG_1_is_br; // @[register-read.scala 86:29]
  reg  REG_1_is_jalr; // @[register-read.scala 86:29]
  reg  REG_1_is_jal; // @[register-read.scala 86:29]
  reg  REG_1_is_sfb; // @[register-read.scala 86:29]
  reg [11:0] REG_1_br_mask; // @[register-read.scala 86:29]
  reg [3:0] REG_1_br_tag; // @[register-read.scala 86:29]
  reg [4:0] REG_1_ftq_idx; // @[register-read.scala 86:29]
  reg  REG_1_edge_inst; // @[register-read.scala 86:29]
  reg [5:0] REG_1_pc_lob; // @[register-read.scala 86:29]
  reg  REG_1_taken; // @[register-read.scala 86:29]
  reg [19:0] REG_1_imm_packed; // @[register-read.scala 86:29]
  reg [11:0] REG_1_csr_addr; // @[register-read.scala 86:29]
  reg [5:0] REG_1_rob_idx; // @[register-read.scala 86:29]
  reg [3:0] REG_1_ldq_idx; // @[register-read.scala 86:29]
  reg [3:0] REG_1_stq_idx; // @[register-read.scala 86:29]
  reg [1:0] REG_1_rxq_idx; // @[register-read.scala 86:29]
  reg [5:0] REG_1_pdst; // @[register-read.scala 86:29]
  reg [5:0] REG_1_prs1; // @[register-read.scala 86:29]
  reg [5:0] REG_1_prs2; // @[register-read.scala 86:29]
  reg [5:0] REG_1_prs3; // @[register-read.scala 86:29]
  reg [4:0] REG_1_ppred; // @[register-read.scala 86:29]
  reg  REG_1_prs1_busy; // @[register-read.scala 86:29]
  reg  REG_1_prs2_busy; // @[register-read.scala 86:29]
  reg  REG_1_prs3_busy; // @[register-read.scala 86:29]
  reg  REG_1_ppred_busy; // @[register-read.scala 86:29]
  reg [5:0] REG_1_stale_pdst; // @[register-read.scala 86:29]
  reg  REG_1_exception; // @[register-read.scala 86:29]
  reg [63:0] REG_1_exc_cause; // @[register-read.scala 86:29]
  reg  REG_1_bypassable; // @[register-read.scala 86:29]
  reg [4:0] REG_1_mem_cmd; // @[register-read.scala 86:29]
  reg [1:0] REG_1_mem_size; // @[register-read.scala 86:29]
  reg  REG_1_mem_signed; // @[register-read.scala 86:29]
  reg  REG_1_is_fence; // @[register-read.scala 86:29]
  reg  REG_1_is_fencei; // @[register-read.scala 86:29]
  reg  REG_1_is_amo; // @[register-read.scala 86:29]
  reg  REG_1_uses_ldq; // @[register-read.scala 86:29]
  reg  REG_1_uses_stq; // @[register-read.scala 86:29]
  reg  REG_1_is_sys_pc2epc; // @[register-read.scala 86:29]
  reg  REG_1_is_unique; // @[register-read.scala 86:29]
  reg  REG_1_flush_on_commit; // @[register-read.scala 86:29]
  reg  REG_1_ldst_is_rs1; // @[register-read.scala 86:29]
  reg [5:0] REG_1_ldst; // @[register-read.scala 86:29]
  reg [5:0] REG_1_lrs1; // @[register-read.scala 86:29]
  reg [5:0] REG_1_lrs2; // @[register-read.scala 86:29]
  reg [5:0] REG_1_lrs3; // @[register-read.scala 86:29]
  reg  REG_1_ldst_val; // @[register-read.scala 86:29]
  reg [1:0] REG_1_dst_rtype; // @[register-read.scala 86:29]
  reg [1:0] REG_1_lrs1_rtype; // @[register-read.scala 86:29]
  reg [1:0] REG_1_lrs2_rtype; // @[register-read.scala 86:29]
  reg  REG_1_frs3_en; // @[register-read.scala 86:29]
  reg  REG_1_fp_val; // @[register-read.scala 86:29]
  reg  REG_1_fp_single; // @[register-read.scala 86:29]
  reg  REG_1_xcpt_pf_if; // @[register-read.scala 86:29]
  reg  REG_1_xcpt_ae_if; // @[register-read.scala 86:29]
  reg  REG_1_xcpt_ma_if; // @[register-read.scala 86:29]
  reg  REG_1_bp_debug_if; // @[register-read.scala 86:29]
  reg  REG_1_bp_xcpt_if; // @[register-read.scala 86:29]
  reg [1:0] REG_1_debug_fsrc; // @[register-read.scala 86:29]
  reg [1:0] REG_1_debug_tsrc; // @[register-read.scala 86:29]
  reg  REG_2; // @[register-read.scala 124:57]
  reg  REG_3; // @[register-read.scala 125:57]
  reg  REG_4; // @[register-read.scala 126:57]
  wire [11:0] _T_12 = io_brupdate_b1_mispredict_mask & REG_1_br_mask; // @[util.scala 118:51]
  wire  _T_13 = _T_12 != 12'h0; // @[util.scala 118:59]
  wire  _T_14 = io_kill | _T_13; // @[register-read.scala 130:28]
  RegisterReadDecode RegisterReadDecode ( // @[register-read.scala 80:33]
    .clock(RegisterReadDecode_clock),
    .reset(RegisterReadDecode_reset),
    .io_iss_valid(RegisterReadDecode_io_iss_valid),
    .io_iss_uop_uopc(RegisterReadDecode_io_iss_uop_uopc),
    .io_iss_uop_inst(RegisterReadDecode_io_iss_uop_inst),
    .io_iss_uop_debug_inst(RegisterReadDecode_io_iss_uop_debug_inst),
    .io_iss_uop_is_rvc(RegisterReadDecode_io_iss_uop_is_rvc),
    .io_iss_uop_debug_pc(RegisterReadDecode_io_iss_uop_debug_pc),
    .io_iss_uop_iq_type(RegisterReadDecode_io_iss_uop_iq_type),
    .io_iss_uop_fu_code(RegisterReadDecode_io_iss_uop_fu_code),
    .io_iss_uop_ctrl_br_type(RegisterReadDecode_io_iss_uop_ctrl_br_type),
    .io_iss_uop_ctrl_op1_sel(RegisterReadDecode_io_iss_uop_ctrl_op1_sel),
    .io_iss_uop_ctrl_op2_sel(RegisterReadDecode_io_iss_uop_ctrl_op2_sel),
    .io_iss_uop_ctrl_imm_sel(RegisterReadDecode_io_iss_uop_ctrl_imm_sel),
    .io_iss_uop_ctrl_op_fcn(RegisterReadDecode_io_iss_uop_ctrl_op_fcn),
    .io_iss_uop_ctrl_fcn_dw(RegisterReadDecode_io_iss_uop_ctrl_fcn_dw),
    .io_iss_uop_ctrl_csr_cmd(RegisterReadDecode_io_iss_uop_ctrl_csr_cmd),
    .io_iss_uop_ctrl_is_load(RegisterReadDecode_io_iss_uop_ctrl_is_load),
    .io_iss_uop_ctrl_is_sta(RegisterReadDecode_io_iss_uop_ctrl_is_sta),
    .io_iss_uop_ctrl_is_std(RegisterReadDecode_io_iss_uop_ctrl_is_std),
    .io_iss_uop_iw_state(RegisterReadDecode_io_iss_uop_iw_state),
    .io_iss_uop_iw_p1_poisoned(RegisterReadDecode_io_iss_uop_iw_p1_poisoned),
    .io_iss_uop_iw_p2_poisoned(RegisterReadDecode_io_iss_uop_iw_p2_poisoned),
    .io_iss_uop_is_br(RegisterReadDecode_io_iss_uop_is_br),
    .io_iss_uop_is_jalr(RegisterReadDecode_io_iss_uop_is_jalr),
    .io_iss_uop_is_jal(RegisterReadDecode_io_iss_uop_is_jal),
    .io_iss_uop_is_sfb(RegisterReadDecode_io_iss_uop_is_sfb),
    .io_iss_uop_br_mask(RegisterReadDecode_io_iss_uop_br_mask),
    .io_iss_uop_br_tag(RegisterReadDecode_io_iss_uop_br_tag),
    .io_iss_uop_ftq_idx(RegisterReadDecode_io_iss_uop_ftq_idx),
    .io_iss_uop_edge_inst(RegisterReadDecode_io_iss_uop_edge_inst),
    .io_iss_uop_pc_lob(RegisterReadDecode_io_iss_uop_pc_lob),
    .io_iss_uop_taken(RegisterReadDecode_io_iss_uop_taken),
    .io_iss_uop_imm_packed(RegisterReadDecode_io_iss_uop_imm_packed),
    .io_iss_uop_csr_addr(RegisterReadDecode_io_iss_uop_csr_addr),
    .io_iss_uop_rob_idx(RegisterReadDecode_io_iss_uop_rob_idx),
    .io_iss_uop_ldq_idx(RegisterReadDecode_io_iss_uop_ldq_idx),
    .io_iss_uop_stq_idx(RegisterReadDecode_io_iss_uop_stq_idx),
    .io_iss_uop_rxq_idx(RegisterReadDecode_io_iss_uop_rxq_idx),
    .io_iss_uop_pdst(RegisterReadDecode_io_iss_uop_pdst),
    .io_iss_uop_prs1(RegisterReadDecode_io_iss_uop_prs1),
    .io_iss_uop_prs2(RegisterReadDecode_io_iss_uop_prs2),
    .io_iss_uop_prs3(RegisterReadDecode_io_iss_uop_prs3),
    .io_iss_uop_ppred(RegisterReadDecode_io_iss_uop_ppred),
    .io_iss_uop_prs1_busy(RegisterReadDecode_io_iss_uop_prs1_busy),
    .io_iss_uop_prs2_busy(RegisterReadDecode_io_iss_uop_prs2_busy),
    .io_iss_uop_prs3_busy(RegisterReadDecode_io_iss_uop_prs3_busy),
    .io_iss_uop_ppred_busy(RegisterReadDecode_io_iss_uop_ppred_busy),
    .io_iss_uop_stale_pdst(RegisterReadDecode_io_iss_uop_stale_pdst),
    .io_iss_uop_exception(RegisterReadDecode_io_iss_uop_exception),
    .io_iss_uop_exc_cause(RegisterReadDecode_io_iss_uop_exc_cause),
    .io_iss_uop_bypassable(RegisterReadDecode_io_iss_uop_bypassable),
    .io_iss_uop_mem_cmd(RegisterReadDecode_io_iss_uop_mem_cmd),
    .io_iss_uop_mem_size(RegisterReadDecode_io_iss_uop_mem_size),
    .io_iss_uop_mem_signed(RegisterReadDecode_io_iss_uop_mem_signed),
    .io_iss_uop_is_fence(RegisterReadDecode_io_iss_uop_is_fence),
    .io_iss_uop_is_fencei(RegisterReadDecode_io_iss_uop_is_fencei),
    .io_iss_uop_is_amo(RegisterReadDecode_io_iss_uop_is_amo),
    .io_iss_uop_uses_ldq(RegisterReadDecode_io_iss_uop_uses_ldq),
    .io_iss_uop_uses_stq(RegisterReadDecode_io_iss_uop_uses_stq),
    .io_iss_uop_is_sys_pc2epc(RegisterReadDecode_io_iss_uop_is_sys_pc2epc),
    .io_iss_uop_is_unique(RegisterReadDecode_io_iss_uop_is_unique),
    .io_iss_uop_flush_on_commit(RegisterReadDecode_io_iss_uop_flush_on_commit),
    .io_iss_uop_ldst_is_rs1(RegisterReadDecode_io_iss_uop_ldst_is_rs1),
    .io_iss_uop_ldst(RegisterReadDecode_io_iss_uop_ldst),
    .io_iss_uop_lrs1(RegisterReadDecode_io_iss_uop_lrs1),
    .io_iss_uop_lrs2(RegisterReadDecode_io_iss_uop_lrs2),
    .io_iss_uop_lrs3(RegisterReadDecode_io_iss_uop_lrs3),
    .io_iss_uop_ldst_val(RegisterReadDecode_io_iss_uop_ldst_val),
    .io_iss_uop_dst_rtype(RegisterReadDecode_io_iss_uop_dst_rtype),
    .io_iss_uop_lrs1_rtype(RegisterReadDecode_io_iss_uop_lrs1_rtype),
    .io_iss_uop_lrs2_rtype(RegisterReadDecode_io_iss_uop_lrs2_rtype),
    .io_iss_uop_frs3_en(RegisterReadDecode_io_iss_uop_frs3_en),
    .io_iss_uop_fp_val(RegisterReadDecode_io_iss_uop_fp_val),
    .io_iss_uop_fp_single(RegisterReadDecode_io_iss_uop_fp_single),
    .io_iss_uop_xcpt_pf_if(RegisterReadDecode_io_iss_uop_xcpt_pf_if),
    .io_iss_uop_xcpt_ae_if(RegisterReadDecode_io_iss_uop_xcpt_ae_if),
    .io_iss_uop_xcpt_ma_if(RegisterReadDecode_io_iss_uop_xcpt_ma_if),
    .io_iss_uop_bp_debug_if(RegisterReadDecode_io_iss_uop_bp_debug_if),
    .io_iss_uop_bp_xcpt_if(RegisterReadDecode_io_iss_uop_bp_xcpt_if),
    .io_iss_uop_debug_fsrc(RegisterReadDecode_io_iss_uop_debug_fsrc),
    .io_iss_uop_debug_tsrc(RegisterReadDecode_io_iss_uop_debug_tsrc),
    .io_rrd_valid(RegisterReadDecode_io_rrd_valid),
    .io_rrd_uop_uopc(RegisterReadDecode_io_rrd_uop_uopc),
    .io_rrd_uop_inst(RegisterReadDecode_io_rrd_uop_inst),
    .io_rrd_uop_debug_inst(RegisterReadDecode_io_rrd_uop_debug_inst),
    .io_rrd_uop_is_rvc(RegisterReadDecode_io_rrd_uop_is_rvc),
    .io_rrd_uop_debug_pc(RegisterReadDecode_io_rrd_uop_debug_pc),
    .io_rrd_uop_iq_type(RegisterReadDecode_io_rrd_uop_iq_type),
    .io_rrd_uop_fu_code(RegisterReadDecode_io_rrd_uop_fu_code),
    .io_rrd_uop_ctrl_br_type(RegisterReadDecode_io_rrd_uop_ctrl_br_type),
    .io_rrd_uop_ctrl_op1_sel(RegisterReadDecode_io_rrd_uop_ctrl_op1_sel),
    .io_rrd_uop_ctrl_op2_sel(RegisterReadDecode_io_rrd_uop_ctrl_op2_sel),
    .io_rrd_uop_ctrl_imm_sel(RegisterReadDecode_io_rrd_uop_ctrl_imm_sel),
    .io_rrd_uop_ctrl_op_fcn(RegisterReadDecode_io_rrd_uop_ctrl_op_fcn),
    .io_rrd_uop_ctrl_fcn_dw(RegisterReadDecode_io_rrd_uop_ctrl_fcn_dw),
    .io_rrd_uop_ctrl_csr_cmd(RegisterReadDecode_io_rrd_uop_ctrl_csr_cmd),
    .io_rrd_uop_ctrl_is_load(RegisterReadDecode_io_rrd_uop_ctrl_is_load),
    .io_rrd_uop_ctrl_is_sta(RegisterReadDecode_io_rrd_uop_ctrl_is_sta),
    .io_rrd_uop_ctrl_is_std(RegisterReadDecode_io_rrd_uop_ctrl_is_std),
    .io_rrd_uop_iw_state(RegisterReadDecode_io_rrd_uop_iw_state),
    .io_rrd_uop_iw_p1_poisoned(RegisterReadDecode_io_rrd_uop_iw_p1_poisoned),
    .io_rrd_uop_iw_p2_poisoned(RegisterReadDecode_io_rrd_uop_iw_p2_poisoned),
    .io_rrd_uop_is_br(RegisterReadDecode_io_rrd_uop_is_br),
    .io_rrd_uop_is_jalr(RegisterReadDecode_io_rrd_uop_is_jalr),
    .io_rrd_uop_is_jal(RegisterReadDecode_io_rrd_uop_is_jal),
    .io_rrd_uop_is_sfb(RegisterReadDecode_io_rrd_uop_is_sfb),
    .io_rrd_uop_br_mask(RegisterReadDecode_io_rrd_uop_br_mask),
    .io_rrd_uop_br_tag(RegisterReadDecode_io_rrd_uop_br_tag),
    .io_rrd_uop_ftq_idx(RegisterReadDecode_io_rrd_uop_ftq_idx),
    .io_rrd_uop_edge_inst(RegisterReadDecode_io_rrd_uop_edge_inst),
    .io_rrd_uop_pc_lob(RegisterReadDecode_io_rrd_uop_pc_lob),
    .io_rrd_uop_taken(RegisterReadDecode_io_rrd_uop_taken),
    .io_rrd_uop_imm_packed(RegisterReadDecode_io_rrd_uop_imm_packed),
    .io_rrd_uop_csr_addr(RegisterReadDecode_io_rrd_uop_csr_addr),
    .io_rrd_uop_rob_idx(RegisterReadDecode_io_rrd_uop_rob_idx),
    .io_rrd_uop_ldq_idx(RegisterReadDecode_io_rrd_uop_ldq_idx),
    .io_rrd_uop_stq_idx(RegisterReadDecode_io_rrd_uop_stq_idx),
    .io_rrd_uop_rxq_idx(RegisterReadDecode_io_rrd_uop_rxq_idx),
    .io_rrd_uop_pdst(RegisterReadDecode_io_rrd_uop_pdst),
    .io_rrd_uop_prs1(RegisterReadDecode_io_rrd_uop_prs1),
    .io_rrd_uop_prs2(RegisterReadDecode_io_rrd_uop_prs2),
    .io_rrd_uop_prs3(RegisterReadDecode_io_rrd_uop_prs3),
    .io_rrd_uop_ppred(RegisterReadDecode_io_rrd_uop_ppred),
    .io_rrd_uop_prs1_busy(RegisterReadDecode_io_rrd_uop_prs1_busy),
    .io_rrd_uop_prs2_busy(RegisterReadDecode_io_rrd_uop_prs2_busy),
    .io_rrd_uop_prs3_busy(RegisterReadDecode_io_rrd_uop_prs3_busy),
    .io_rrd_uop_ppred_busy(RegisterReadDecode_io_rrd_uop_ppred_busy),
    .io_rrd_uop_stale_pdst(RegisterReadDecode_io_rrd_uop_stale_pdst),
    .io_rrd_uop_exception(RegisterReadDecode_io_rrd_uop_exception),
    .io_rrd_uop_exc_cause(RegisterReadDecode_io_rrd_uop_exc_cause),
    .io_rrd_uop_bypassable(RegisterReadDecode_io_rrd_uop_bypassable),
    .io_rrd_uop_mem_cmd(RegisterReadDecode_io_rrd_uop_mem_cmd),
    .io_rrd_uop_mem_size(RegisterReadDecode_io_rrd_uop_mem_size),
    .io_rrd_uop_mem_signed(RegisterReadDecode_io_rrd_uop_mem_signed),
    .io_rrd_uop_is_fence(RegisterReadDecode_io_rrd_uop_is_fence),
    .io_rrd_uop_is_fencei(RegisterReadDecode_io_rrd_uop_is_fencei),
    .io_rrd_uop_is_amo(RegisterReadDecode_io_rrd_uop_is_amo),
    .io_rrd_uop_uses_ldq(RegisterReadDecode_io_rrd_uop_uses_ldq),
    .io_rrd_uop_uses_stq(RegisterReadDecode_io_rrd_uop_uses_stq),
    .io_rrd_uop_is_sys_pc2epc(RegisterReadDecode_io_rrd_uop_is_sys_pc2epc),
    .io_rrd_uop_is_unique(RegisterReadDecode_io_rrd_uop_is_unique),
    .io_rrd_uop_flush_on_commit(RegisterReadDecode_io_rrd_uop_flush_on_commit),
    .io_rrd_uop_ldst_is_rs1(RegisterReadDecode_io_rrd_uop_ldst_is_rs1),
    .io_rrd_uop_ldst(RegisterReadDecode_io_rrd_uop_ldst),
    .io_rrd_uop_lrs1(RegisterReadDecode_io_rrd_uop_lrs1),
    .io_rrd_uop_lrs2(RegisterReadDecode_io_rrd_uop_lrs2),
    .io_rrd_uop_lrs3(RegisterReadDecode_io_rrd_uop_lrs3),
    .io_rrd_uop_ldst_val(RegisterReadDecode_io_rrd_uop_ldst_val),
    .io_rrd_uop_dst_rtype(RegisterReadDecode_io_rrd_uop_dst_rtype),
    .io_rrd_uop_lrs1_rtype(RegisterReadDecode_io_rrd_uop_lrs1_rtype),
    .io_rrd_uop_lrs2_rtype(RegisterReadDecode_io_rrd_uop_lrs2_rtype),
    .io_rrd_uop_frs3_en(RegisterReadDecode_io_rrd_uop_frs3_en),
    .io_rrd_uop_fp_val(RegisterReadDecode_io_rrd_uop_fp_val),
    .io_rrd_uop_fp_single(RegisterReadDecode_io_rrd_uop_fp_single),
    .io_rrd_uop_xcpt_pf_if(RegisterReadDecode_io_rrd_uop_xcpt_pf_if),
    .io_rrd_uop_xcpt_ae_if(RegisterReadDecode_io_rrd_uop_xcpt_ae_if),
    .io_rrd_uop_xcpt_ma_if(RegisterReadDecode_io_rrd_uop_xcpt_ma_if),
    .io_rrd_uop_bp_debug_if(RegisterReadDecode_io_rrd_uop_bp_debug_if),
    .io_rrd_uop_bp_xcpt_if(RegisterReadDecode_io_rrd_uop_bp_xcpt_if),
    .io_rrd_uop_debug_fsrc(RegisterReadDecode_io_rrd_uop_debug_fsrc),
    .io_rrd_uop_debug_tsrc(RegisterReadDecode_io_rrd_uop_debug_tsrc)
  );
  assign io_rf_read_ports_0_addr = io_iss_uops_0_prs1; // @[register-read.scala 118:56]
  assign io_rf_read_ports_1_addr = io_iss_uops_0_prs2; // @[register-read.scala 119:56]
  assign io_rf_read_ports_2_addr = io_iss_uops_0_prs3; // @[register-read.scala 120:56]
  assign io_prf_read_ports_0_addr = 5'h0;
  assign io_exe_reqs_0_valid = exe_reg_valids_0; // @[register-read.scala 212:29]
  assign io_exe_reqs_0_bits_uop_uopc = exe_reg_uops_0_uopc; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_inst = exe_reg_uops_0_inst; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_debug_inst = exe_reg_uops_0_debug_inst; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_is_rvc = exe_reg_uops_0_is_rvc; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_debug_pc = exe_reg_uops_0_debug_pc; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_iq_type = exe_reg_uops_0_iq_type; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_fu_code = exe_reg_uops_0_fu_code; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ctrl_br_type = exe_reg_uops_0_ctrl_br_type; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ctrl_op1_sel = exe_reg_uops_0_ctrl_op1_sel; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ctrl_op2_sel = exe_reg_uops_0_ctrl_op2_sel; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ctrl_imm_sel = exe_reg_uops_0_ctrl_imm_sel; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ctrl_op_fcn = exe_reg_uops_0_ctrl_op_fcn; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ctrl_fcn_dw = exe_reg_uops_0_ctrl_fcn_dw; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ctrl_csr_cmd = exe_reg_uops_0_ctrl_csr_cmd; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ctrl_is_load = exe_reg_uops_0_ctrl_is_load; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ctrl_is_sta = exe_reg_uops_0_ctrl_is_sta; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ctrl_is_std = exe_reg_uops_0_ctrl_is_std; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_iw_state = exe_reg_uops_0_iw_state; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_iw_p1_poisoned = exe_reg_uops_0_iw_p1_poisoned; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_iw_p2_poisoned = exe_reg_uops_0_iw_p2_poisoned; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_is_br = exe_reg_uops_0_is_br; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_is_jalr = exe_reg_uops_0_is_jalr; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_is_jal = exe_reg_uops_0_is_jal; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_is_sfb = exe_reg_uops_0_is_sfb; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_br_mask = exe_reg_uops_0_br_mask; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_br_tag = exe_reg_uops_0_br_tag; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ftq_idx = exe_reg_uops_0_ftq_idx; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_edge_inst = exe_reg_uops_0_edge_inst; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_pc_lob = exe_reg_uops_0_pc_lob; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_taken = exe_reg_uops_0_taken; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_imm_packed = exe_reg_uops_0_imm_packed; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_csr_addr = exe_reg_uops_0_csr_addr; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_rob_idx = exe_reg_uops_0_rob_idx; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ldq_idx = exe_reg_uops_0_ldq_idx; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_stq_idx = exe_reg_uops_0_stq_idx; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_rxq_idx = exe_reg_uops_0_rxq_idx; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_pdst = exe_reg_uops_0_pdst; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_prs1 = exe_reg_uops_0_prs1; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_prs2 = exe_reg_uops_0_prs2; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_prs3 = exe_reg_uops_0_prs3; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ppred = exe_reg_uops_0_ppred; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_prs1_busy = exe_reg_uops_0_prs1_busy; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_prs2_busy = exe_reg_uops_0_prs2_busy; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_prs3_busy = exe_reg_uops_0_prs3_busy; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ppred_busy = exe_reg_uops_0_ppred_busy; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_stale_pdst = exe_reg_uops_0_stale_pdst; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_exception = exe_reg_uops_0_exception; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_exc_cause = exe_reg_uops_0_exc_cause; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_bypassable = exe_reg_uops_0_bypassable; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_mem_cmd = exe_reg_uops_0_mem_cmd; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_mem_size = exe_reg_uops_0_mem_size; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_mem_signed = exe_reg_uops_0_mem_signed; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_is_fence = exe_reg_uops_0_is_fence; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_is_fencei = exe_reg_uops_0_is_fencei; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_is_amo = exe_reg_uops_0_is_amo; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_uses_ldq = exe_reg_uops_0_uses_ldq; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_uses_stq = exe_reg_uops_0_uses_stq; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_is_sys_pc2epc = exe_reg_uops_0_is_sys_pc2epc; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_is_unique = exe_reg_uops_0_is_unique; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_flush_on_commit = exe_reg_uops_0_flush_on_commit; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ldst_is_rs1 = exe_reg_uops_0_ldst_is_rs1; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ldst = exe_reg_uops_0_ldst; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_lrs1 = exe_reg_uops_0_lrs1; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_lrs2 = exe_reg_uops_0_lrs2; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_lrs3 = exe_reg_uops_0_lrs3; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_ldst_val = exe_reg_uops_0_ldst_val; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_dst_rtype = exe_reg_uops_0_dst_rtype; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_lrs1_rtype = exe_reg_uops_0_lrs1_rtype; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_lrs2_rtype = exe_reg_uops_0_lrs2_rtype; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_frs3_en = exe_reg_uops_0_frs3_en; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_fp_val = exe_reg_uops_0_fp_val; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_fp_single = exe_reg_uops_0_fp_single; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_xcpt_pf_if = exe_reg_uops_0_xcpt_pf_if; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_xcpt_ae_if = exe_reg_uops_0_xcpt_ae_if; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_xcpt_ma_if = exe_reg_uops_0_xcpt_ma_if; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_bp_debug_if = exe_reg_uops_0_bp_debug_if; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_bp_xcpt_if = exe_reg_uops_0_bp_xcpt_if; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_debug_fsrc = exe_reg_uops_0_debug_fsrc; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_uop_debug_tsrc = exe_reg_uops_0_debug_tsrc; // @[register-read.scala 213:29]
  assign io_exe_reqs_0_bits_rs1_data = exe_reg_rs1_data_0; // @[register-read.scala 214:56]
  assign io_exe_reqs_0_bits_rs2_data = exe_reg_rs2_data_0; // @[register-read.scala 215:56]
  assign io_exe_reqs_0_bits_rs3_data = exe_reg_rs3_data_0; // @[register-read.scala 216:56]
  assign io_exe_reqs_0_bits_pred_data = 1'h0;
  assign io_exe_reqs_0_bits_kill = 1'h0;
  assign RegisterReadDecode_clock = clock;
  assign RegisterReadDecode_reset = reset;
  assign RegisterReadDecode_io_iss_valid = io_iss_valids_0; // @[register-read.scala 81:34]
  assign RegisterReadDecode_io_iss_uop_uopc = io_iss_uops_0_uopc; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_inst = io_iss_uops_0_inst; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_debug_inst = io_iss_uops_0_debug_inst; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_is_rvc = io_iss_uops_0_is_rvc; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_debug_pc = io_iss_uops_0_debug_pc; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_iq_type = io_iss_uops_0_iq_type; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_fu_code = io_iss_uops_0_fu_code; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ctrl_br_type = io_iss_uops_0_ctrl_br_type; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ctrl_op1_sel = io_iss_uops_0_ctrl_op1_sel; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ctrl_op2_sel = io_iss_uops_0_ctrl_op2_sel; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ctrl_imm_sel = io_iss_uops_0_ctrl_imm_sel; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ctrl_op_fcn = io_iss_uops_0_ctrl_op_fcn; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ctrl_fcn_dw = io_iss_uops_0_ctrl_fcn_dw; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ctrl_csr_cmd = io_iss_uops_0_ctrl_csr_cmd; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ctrl_is_load = io_iss_uops_0_ctrl_is_load; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ctrl_is_sta = io_iss_uops_0_ctrl_is_sta; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ctrl_is_std = io_iss_uops_0_ctrl_is_std; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_iw_state = io_iss_uops_0_iw_state; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_iw_p1_poisoned = io_iss_uops_0_iw_p1_poisoned; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_iw_p2_poisoned = io_iss_uops_0_iw_p2_poisoned; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_is_br = io_iss_uops_0_is_br; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_is_jalr = io_iss_uops_0_is_jalr; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_is_jal = io_iss_uops_0_is_jal; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_is_sfb = io_iss_uops_0_is_sfb; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_br_mask = io_iss_uops_0_br_mask; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_br_tag = io_iss_uops_0_br_tag; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ftq_idx = io_iss_uops_0_ftq_idx; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_edge_inst = io_iss_uops_0_edge_inst; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_pc_lob = io_iss_uops_0_pc_lob; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_taken = io_iss_uops_0_taken; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_imm_packed = io_iss_uops_0_imm_packed; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_csr_addr = io_iss_uops_0_csr_addr; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_rob_idx = io_iss_uops_0_rob_idx; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ldq_idx = io_iss_uops_0_ldq_idx; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_stq_idx = io_iss_uops_0_stq_idx; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_rxq_idx = io_iss_uops_0_rxq_idx; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_pdst = io_iss_uops_0_pdst; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_prs1 = io_iss_uops_0_prs1; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_prs2 = io_iss_uops_0_prs2; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_prs3 = io_iss_uops_0_prs3; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ppred = io_iss_uops_0_ppred; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_prs1_busy = io_iss_uops_0_prs1_busy; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_prs2_busy = io_iss_uops_0_prs2_busy; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_prs3_busy = io_iss_uops_0_prs3_busy; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ppred_busy = io_iss_uops_0_ppred_busy; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_stale_pdst = io_iss_uops_0_stale_pdst; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_exception = io_iss_uops_0_exception; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_exc_cause = io_iss_uops_0_exc_cause; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_bypassable = io_iss_uops_0_bypassable; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_mem_cmd = io_iss_uops_0_mem_cmd; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_mem_size = io_iss_uops_0_mem_size; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_mem_signed = io_iss_uops_0_mem_signed; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_is_fence = io_iss_uops_0_is_fence; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_is_fencei = io_iss_uops_0_is_fencei; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_is_amo = io_iss_uops_0_is_amo; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_uses_ldq = io_iss_uops_0_uses_ldq; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_uses_stq = io_iss_uops_0_uses_stq; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_is_sys_pc2epc = io_iss_uops_0_is_sys_pc2epc; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_is_unique = io_iss_uops_0_is_unique; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_flush_on_commit = io_iss_uops_0_flush_on_commit; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ldst_is_rs1 = io_iss_uops_0_ldst_is_rs1; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ldst = io_iss_uops_0_ldst; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_lrs1 = io_iss_uops_0_lrs1; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_lrs2 = io_iss_uops_0_lrs2; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_lrs3 = io_iss_uops_0_lrs3; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_ldst_val = io_iss_uops_0_ldst_val; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_dst_rtype = io_iss_uops_0_dst_rtype; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_lrs1_rtype = io_iss_uops_0_lrs1_rtype; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_lrs2_rtype = io_iss_uops_0_lrs2_rtype; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_frs3_en = io_iss_uops_0_frs3_en; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_fp_val = io_iss_uops_0_fp_val; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_fp_single = io_iss_uops_0_fp_single; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_xcpt_pf_if = io_iss_uops_0_xcpt_pf_if; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_xcpt_ae_if = io_iss_uops_0_xcpt_ae_if; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_xcpt_ma_if = io_iss_uops_0_xcpt_ma_if; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_bp_debug_if = io_iss_uops_0_bp_debug_if; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_bp_xcpt_if = io_iss_uops_0_bp_xcpt_if; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_debug_fsrc = io_iss_uops_0_debug_fsrc; // @[register-read.scala 82:34]
  assign RegisterReadDecode_io_iss_uop_debug_tsrc = io_iss_uops_0_debug_tsrc; // @[register-read.scala 82:34]
  always @(posedge clock) begin
    if (reset) begin // @[register-read.scala 69:33]
      exe_reg_valids_0 <= 1'h0; // @[register-read.scala 69:33]
    end else if (_T_14) begin // @[register-read.scala 132:29]
      exe_reg_valids_0 <= 1'h0;
    end else begin
      exe_reg_valids_0 <= REG;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_uopc <= 7'h0;
    end else begin
      exe_reg_uops_0_uopc <= REG_1_uopc;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_inst <= 32'h0;
    end else begin
      exe_reg_uops_0_inst <= REG_1_inst;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_debug_inst <= 32'h0;
    end else begin
      exe_reg_uops_0_debug_inst <= REG_1_debug_inst;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_is_rvc <= 1'h0;
    end else begin
      exe_reg_uops_0_is_rvc <= REG_1_is_rvc;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_debug_pc <= 40'h0;
    end else begin
      exe_reg_uops_0_debug_pc <= REG_1_debug_pc;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_iq_type <= 3'h0;
    end else begin
      exe_reg_uops_0_iq_type <= REG_1_iq_type;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_fu_code <= 10'h0;
    end else begin
      exe_reg_uops_0_fu_code <= REG_1_fu_code;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ctrl_br_type <= 4'h0;
    end else begin
      exe_reg_uops_0_ctrl_br_type <= REG_1_ctrl_br_type;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ctrl_op1_sel <= 2'h0;
    end else begin
      exe_reg_uops_0_ctrl_op1_sel <= REG_1_ctrl_op1_sel;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ctrl_op2_sel <= 3'h0;
    end else begin
      exe_reg_uops_0_ctrl_op2_sel <= REG_1_ctrl_op2_sel;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ctrl_imm_sel <= 3'h0;
    end else begin
      exe_reg_uops_0_ctrl_imm_sel <= REG_1_ctrl_imm_sel;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ctrl_op_fcn <= 4'h0;
    end else begin
      exe_reg_uops_0_ctrl_op_fcn <= REG_1_ctrl_op_fcn;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ctrl_fcn_dw <= 1'h0;
    end else begin
      exe_reg_uops_0_ctrl_fcn_dw <= REG_1_ctrl_fcn_dw;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ctrl_csr_cmd <= 3'h0;
    end else begin
      exe_reg_uops_0_ctrl_csr_cmd <= REG_1_ctrl_csr_cmd;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ctrl_is_load <= 1'h0;
    end else begin
      exe_reg_uops_0_ctrl_is_load <= REG_1_ctrl_is_load;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ctrl_is_sta <= 1'h0;
    end else begin
      exe_reg_uops_0_ctrl_is_sta <= REG_1_ctrl_is_sta;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ctrl_is_std <= 1'h0;
    end else begin
      exe_reg_uops_0_ctrl_is_std <= REG_1_ctrl_is_std;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_iw_state <= 2'h0;
    end else begin
      exe_reg_uops_0_iw_state <= REG_1_iw_state;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_iw_p1_poisoned <= 1'h0;
    end else begin
      exe_reg_uops_0_iw_p1_poisoned <= REG_1_iw_p1_poisoned;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_iw_p2_poisoned <= 1'h0;
    end else begin
      exe_reg_uops_0_iw_p2_poisoned <= REG_1_iw_p2_poisoned;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_is_br <= 1'h0;
    end else begin
      exe_reg_uops_0_is_br <= REG_1_is_br;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_is_jalr <= 1'h0;
    end else begin
      exe_reg_uops_0_is_jalr <= REG_1_is_jalr;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_is_jal <= 1'h0;
    end else begin
      exe_reg_uops_0_is_jal <= REG_1_is_jal;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_is_sfb <= 1'h0;
    end else begin
      exe_reg_uops_0_is_sfb <= REG_1_is_sfb;
    end
    exe_reg_uops_0_br_mask <= REG_1_br_mask & _T_4; // @[util.scala 85:25]
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_br_tag <= 4'h0;
    end else begin
      exe_reg_uops_0_br_tag <= REG_1_br_tag;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ftq_idx <= 5'h0;
    end else begin
      exe_reg_uops_0_ftq_idx <= REG_1_ftq_idx;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_edge_inst <= 1'h0;
    end else begin
      exe_reg_uops_0_edge_inst <= REG_1_edge_inst;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_pc_lob <= 6'h0;
    end else begin
      exe_reg_uops_0_pc_lob <= REG_1_pc_lob;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_taken <= 1'h0;
    end else begin
      exe_reg_uops_0_taken <= REG_1_taken;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_imm_packed <= 20'h0;
    end else begin
      exe_reg_uops_0_imm_packed <= REG_1_imm_packed;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_csr_addr <= 12'h0;
    end else begin
      exe_reg_uops_0_csr_addr <= REG_1_csr_addr;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_rob_idx <= 6'h0;
    end else begin
      exe_reg_uops_0_rob_idx <= REG_1_rob_idx;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ldq_idx <= 4'h0;
    end else begin
      exe_reg_uops_0_ldq_idx <= REG_1_ldq_idx;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_stq_idx <= 4'h0;
    end else begin
      exe_reg_uops_0_stq_idx <= REG_1_stq_idx;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_rxq_idx <= 2'h0;
    end else begin
      exe_reg_uops_0_rxq_idx <= REG_1_rxq_idx;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_pdst <= 6'h0;
    end else begin
      exe_reg_uops_0_pdst <= REG_1_pdst;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_prs1 <= 6'h0;
    end else begin
      exe_reg_uops_0_prs1 <= REG_1_prs1;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_prs2 <= 6'h0;
    end else begin
      exe_reg_uops_0_prs2 <= REG_1_prs2;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_prs3 <= 6'h0;
    end else begin
      exe_reg_uops_0_prs3 <= REG_1_prs3;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ppred <= 5'h0;
    end else begin
      exe_reg_uops_0_ppred <= REG_1_ppred;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_prs1_busy <= 1'h0;
    end else begin
      exe_reg_uops_0_prs1_busy <= REG_1_prs1_busy;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_prs2_busy <= 1'h0;
    end else begin
      exe_reg_uops_0_prs2_busy <= REG_1_prs2_busy;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_prs3_busy <= 1'h0;
    end else begin
      exe_reg_uops_0_prs3_busy <= REG_1_prs3_busy;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ppred_busy <= 1'h0;
    end else begin
      exe_reg_uops_0_ppred_busy <= REG_1_ppred_busy;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_stale_pdst <= 6'h0;
    end else begin
      exe_reg_uops_0_stale_pdst <= REG_1_stale_pdst;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_exception <= 1'h0;
    end else begin
      exe_reg_uops_0_exception <= REG_1_exception;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_exc_cause <= 64'h0;
    end else begin
      exe_reg_uops_0_exc_cause <= REG_1_exc_cause;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_bypassable <= 1'h0;
    end else begin
      exe_reg_uops_0_bypassable <= REG_1_bypassable;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_mem_cmd <= 5'h0;
    end else begin
      exe_reg_uops_0_mem_cmd <= REG_1_mem_cmd;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_mem_size <= 2'h0;
    end else begin
      exe_reg_uops_0_mem_size <= REG_1_mem_size;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_mem_signed <= 1'h0;
    end else begin
      exe_reg_uops_0_mem_signed <= REG_1_mem_signed;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_is_fence <= 1'h0;
    end else begin
      exe_reg_uops_0_is_fence <= REG_1_is_fence;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_is_fencei <= 1'h0;
    end else begin
      exe_reg_uops_0_is_fencei <= REG_1_is_fencei;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_is_amo <= 1'h0;
    end else begin
      exe_reg_uops_0_is_amo <= REG_1_is_amo;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_uses_ldq <= 1'h0;
    end else begin
      exe_reg_uops_0_uses_ldq <= REG_1_uses_ldq;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_uses_stq <= 1'h0;
    end else begin
      exe_reg_uops_0_uses_stq <= REG_1_uses_stq;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_is_sys_pc2epc <= 1'h0;
    end else begin
      exe_reg_uops_0_is_sys_pc2epc <= REG_1_is_sys_pc2epc;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_is_unique <= 1'h0;
    end else begin
      exe_reg_uops_0_is_unique <= REG_1_is_unique;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_flush_on_commit <= 1'h0;
    end else begin
      exe_reg_uops_0_flush_on_commit <= REG_1_flush_on_commit;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ldst_is_rs1 <= 1'h0;
    end else begin
      exe_reg_uops_0_ldst_is_rs1 <= REG_1_ldst_is_rs1;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ldst <= 6'h0;
    end else begin
      exe_reg_uops_0_ldst <= REG_1_ldst;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_lrs1 <= 6'h0;
    end else begin
      exe_reg_uops_0_lrs1 <= REG_1_lrs1;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_lrs2 <= 6'h0;
    end else begin
      exe_reg_uops_0_lrs2 <= REG_1_lrs2;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_lrs3 <= 6'h0;
    end else begin
      exe_reg_uops_0_lrs3 <= REG_1_lrs3;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_ldst_val <= 1'h0;
    end else begin
      exe_reg_uops_0_ldst_val <= REG_1_ldst_val;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_dst_rtype <= 2'h2;
    end else begin
      exe_reg_uops_0_dst_rtype <= REG_1_dst_rtype;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_lrs1_rtype <= 2'h0;
    end else begin
      exe_reg_uops_0_lrs1_rtype <= REG_1_lrs1_rtype;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_lrs2_rtype <= 2'h0;
    end else begin
      exe_reg_uops_0_lrs2_rtype <= REG_1_lrs2_rtype;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_frs3_en <= 1'h0;
    end else begin
      exe_reg_uops_0_frs3_en <= REG_1_frs3_en;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_fp_val <= 1'h0;
    end else begin
      exe_reg_uops_0_fp_val <= REG_1_fp_val;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_fp_single <= 1'h0;
    end else begin
      exe_reg_uops_0_fp_single <= REG_1_fp_single;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_xcpt_pf_if <= 1'h0;
    end else begin
      exe_reg_uops_0_xcpt_pf_if <= REG_1_xcpt_pf_if;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_xcpt_ae_if <= 1'h0;
    end else begin
      exe_reg_uops_0_xcpt_ae_if <= REG_1_xcpt_ae_if;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_xcpt_ma_if <= 1'h0;
    end else begin
      exe_reg_uops_0_xcpt_ma_if <= REG_1_xcpt_ma_if;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_bp_debug_if <= 1'h0;
    end else begin
      exe_reg_uops_0_bp_debug_if <= REG_1_bp_debug_if;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_bp_xcpt_if <= 1'h0;
    end else begin
      exe_reg_uops_0_bp_xcpt_if <= REG_1_bp_xcpt_if;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_debug_fsrc <= 2'h0;
    end else begin
      exe_reg_uops_0_debug_fsrc <= REG_1_debug_fsrc;
    end
    if (_T_14) begin // @[register-read.scala 134:29]
      exe_reg_uops_0_debug_tsrc <= 2'h0;
    end else begin
      exe_reg_uops_0_debug_tsrc <= REG_1_debug_tsrc;
    end
    if (REG_2) begin // @[register-read.scala 124:49]
      exe_reg_rs1_data_0 <= 65'h0;
    end else begin
      exe_reg_rs1_data_0 <= io_rf_read_ports_0_data;
    end
    if (REG_3) begin // @[register-read.scala 125:49]
      exe_reg_rs2_data_0 <= 65'h0;
    end else begin
      exe_reg_rs2_data_0 <= io_rf_read_ports_1_data;
    end
    if (REG_4) begin // @[register-read.scala 126:49]
      exe_reg_rs3_data_0 <= 65'h0;
    end else begin
      exe_reg_rs3_data_0 <= io_rf_read_ports_2_data;
    end
    REG <= RegisterReadDecode_io_rrd_valid & _T_2; // @[register-read.scala 84:59]
    REG_1_uopc <= RegisterReadDecode_io_rrd_uop_uopc; // @[register-read.scala 86:29]
    REG_1_inst <= RegisterReadDecode_io_rrd_uop_inst; // @[register-read.scala 86:29]
    REG_1_debug_inst <= RegisterReadDecode_io_rrd_uop_debug_inst; // @[register-read.scala 86:29]
    REG_1_is_rvc <= RegisterReadDecode_io_rrd_uop_is_rvc; // @[register-read.scala 86:29]
    REG_1_debug_pc <= RegisterReadDecode_io_rrd_uop_debug_pc; // @[register-read.scala 86:29]
    REG_1_iq_type <= RegisterReadDecode_io_rrd_uop_iq_type; // @[register-read.scala 86:29]
    REG_1_fu_code <= RegisterReadDecode_io_rrd_uop_fu_code; // @[register-read.scala 86:29]
    REG_1_ctrl_br_type <= RegisterReadDecode_io_rrd_uop_ctrl_br_type; // @[register-read.scala 86:29]
    REG_1_ctrl_op1_sel <= RegisterReadDecode_io_rrd_uop_ctrl_op1_sel; // @[register-read.scala 86:29]
    REG_1_ctrl_op2_sel <= RegisterReadDecode_io_rrd_uop_ctrl_op2_sel; // @[register-read.scala 86:29]
    REG_1_ctrl_imm_sel <= RegisterReadDecode_io_rrd_uop_ctrl_imm_sel; // @[register-read.scala 86:29]
    REG_1_ctrl_op_fcn <= RegisterReadDecode_io_rrd_uop_ctrl_op_fcn; // @[register-read.scala 86:29]
    REG_1_ctrl_fcn_dw <= RegisterReadDecode_io_rrd_uop_ctrl_fcn_dw; // @[register-read.scala 86:29]
    REG_1_ctrl_csr_cmd <= RegisterReadDecode_io_rrd_uop_ctrl_csr_cmd; // @[register-read.scala 86:29]
    REG_1_ctrl_is_load <= RegisterReadDecode_io_rrd_uop_ctrl_is_load; // @[register-read.scala 86:29]
    REG_1_ctrl_is_sta <= RegisterReadDecode_io_rrd_uop_ctrl_is_sta; // @[register-read.scala 86:29]
    REG_1_ctrl_is_std <= RegisterReadDecode_io_rrd_uop_ctrl_is_std; // @[register-read.scala 86:29]
    REG_1_iw_state <= RegisterReadDecode_io_rrd_uop_iw_state; // @[register-read.scala 86:29]
    REG_1_iw_p1_poisoned <= RegisterReadDecode_io_rrd_uop_iw_p1_poisoned; // @[register-read.scala 86:29]
    REG_1_iw_p2_poisoned <= RegisterReadDecode_io_rrd_uop_iw_p2_poisoned; // @[register-read.scala 86:29]
    REG_1_is_br <= RegisterReadDecode_io_rrd_uop_is_br; // @[register-read.scala 86:29]
    REG_1_is_jalr <= RegisterReadDecode_io_rrd_uop_is_jalr; // @[register-read.scala 86:29]
    REG_1_is_jal <= RegisterReadDecode_io_rrd_uop_is_jal; // @[register-read.scala 86:29]
    REG_1_is_sfb <= RegisterReadDecode_io_rrd_uop_is_sfb; // @[register-read.scala 86:29]
    REG_1_br_mask <= RegisterReadDecode_io_rrd_uop_br_mask & _T_4; // @[util.scala 74:35]
    REG_1_br_tag <= RegisterReadDecode_io_rrd_uop_br_tag; // @[register-read.scala 86:29]
    REG_1_ftq_idx <= RegisterReadDecode_io_rrd_uop_ftq_idx; // @[register-read.scala 86:29]
    REG_1_edge_inst <= RegisterReadDecode_io_rrd_uop_edge_inst; // @[register-read.scala 86:29]
    REG_1_pc_lob <= RegisterReadDecode_io_rrd_uop_pc_lob; // @[register-read.scala 86:29]
    REG_1_taken <= RegisterReadDecode_io_rrd_uop_taken; // @[register-read.scala 86:29]
    REG_1_imm_packed <= RegisterReadDecode_io_rrd_uop_imm_packed; // @[register-read.scala 86:29]
    REG_1_csr_addr <= RegisterReadDecode_io_rrd_uop_csr_addr; // @[register-read.scala 86:29]
    REG_1_rob_idx <= RegisterReadDecode_io_rrd_uop_rob_idx; // @[register-read.scala 86:29]
    REG_1_ldq_idx <= RegisterReadDecode_io_rrd_uop_ldq_idx; // @[register-read.scala 86:29]
    REG_1_stq_idx <= RegisterReadDecode_io_rrd_uop_stq_idx; // @[register-read.scala 86:29]
    REG_1_rxq_idx <= RegisterReadDecode_io_rrd_uop_rxq_idx; // @[register-read.scala 86:29]
    REG_1_pdst <= RegisterReadDecode_io_rrd_uop_pdst; // @[register-read.scala 86:29]
    REG_1_prs1 <= RegisterReadDecode_io_rrd_uop_prs1; // @[register-read.scala 86:29]
    REG_1_prs2 <= RegisterReadDecode_io_rrd_uop_prs2; // @[register-read.scala 86:29]
    REG_1_prs3 <= RegisterReadDecode_io_rrd_uop_prs3; // @[register-read.scala 86:29]
    REG_1_ppred <= RegisterReadDecode_io_rrd_uop_ppred; // @[register-read.scala 86:29]
    REG_1_prs1_busy <= RegisterReadDecode_io_rrd_uop_prs1_busy; // @[register-read.scala 86:29]
    REG_1_prs2_busy <= RegisterReadDecode_io_rrd_uop_prs2_busy; // @[register-read.scala 86:29]
    REG_1_prs3_busy <= RegisterReadDecode_io_rrd_uop_prs3_busy; // @[register-read.scala 86:29]
    REG_1_ppred_busy <= RegisterReadDecode_io_rrd_uop_ppred_busy; // @[register-read.scala 86:29]
    REG_1_stale_pdst <= RegisterReadDecode_io_rrd_uop_stale_pdst; // @[register-read.scala 86:29]
    REG_1_exception <= RegisterReadDecode_io_rrd_uop_exception; // @[register-read.scala 86:29]
    REG_1_exc_cause <= RegisterReadDecode_io_rrd_uop_exc_cause; // @[register-read.scala 86:29]
    REG_1_bypassable <= RegisterReadDecode_io_rrd_uop_bypassable; // @[register-read.scala 86:29]
    REG_1_mem_cmd <= RegisterReadDecode_io_rrd_uop_mem_cmd; // @[register-read.scala 86:29]
    REG_1_mem_size <= RegisterReadDecode_io_rrd_uop_mem_size; // @[register-read.scala 86:29]
    REG_1_mem_signed <= RegisterReadDecode_io_rrd_uop_mem_signed; // @[register-read.scala 86:29]
    REG_1_is_fence <= RegisterReadDecode_io_rrd_uop_is_fence; // @[register-read.scala 86:29]
    REG_1_is_fencei <= RegisterReadDecode_io_rrd_uop_is_fencei; // @[register-read.scala 86:29]
    REG_1_is_amo <= RegisterReadDecode_io_rrd_uop_is_amo; // @[register-read.scala 86:29]
    REG_1_uses_ldq <= RegisterReadDecode_io_rrd_uop_uses_ldq; // @[register-read.scala 86:29]
    REG_1_uses_stq <= RegisterReadDecode_io_rrd_uop_uses_stq; // @[register-read.scala 86:29]
    REG_1_is_sys_pc2epc <= RegisterReadDecode_io_rrd_uop_is_sys_pc2epc; // @[register-read.scala 86:29]
    REG_1_is_unique <= RegisterReadDecode_io_rrd_uop_is_unique; // @[register-read.scala 86:29]
    REG_1_flush_on_commit <= RegisterReadDecode_io_rrd_uop_flush_on_commit; // @[register-read.scala 86:29]
    REG_1_ldst_is_rs1 <= RegisterReadDecode_io_rrd_uop_ldst_is_rs1; // @[register-read.scala 86:29]
    REG_1_ldst <= RegisterReadDecode_io_rrd_uop_ldst; // @[register-read.scala 86:29]
    REG_1_lrs1 <= RegisterReadDecode_io_rrd_uop_lrs1; // @[register-read.scala 86:29]
    REG_1_lrs2 <= RegisterReadDecode_io_rrd_uop_lrs2; // @[register-read.scala 86:29]
    REG_1_lrs3 <= RegisterReadDecode_io_rrd_uop_lrs3; // @[register-read.scala 86:29]
    REG_1_ldst_val <= RegisterReadDecode_io_rrd_uop_ldst_val; // @[register-read.scala 86:29]
    REG_1_dst_rtype <= RegisterReadDecode_io_rrd_uop_dst_rtype; // @[register-read.scala 86:29]
    REG_1_lrs1_rtype <= RegisterReadDecode_io_rrd_uop_lrs1_rtype; // @[register-read.scala 86:29]
    REG_1_lrs2_rtype <= RegisterReadDecode_io_rrd_uop_lrs2_rtype; // @[register-read.scala 86:29]
    REG_1_frs3_en <= RegisterReadDecode_io_rrd_uop_frs3_en; // @[register-read.scala 86:29]
    REG_1_fp_val <= RegisterReadDecode_io_rrd_uop_fp_val; // @[register-read.scala 86:29]
    REG_1_fp_single <= RegisterReadDecode_io_rrd_uop_fp_single; // @[register-read.scala 86:29]
    REG_1_xcpt_pf_if <= RegisterReadDecode_io_rrd_uop_xcpt_pf_if; // @[register-read.scala 86:29]
    REG_1_xcpt_ae_if <= RegisterReadDecode_io_rrd_uop_xcpt_ae_if; // @[register-read.scala 86:29]
    REG_1_xcpt_ma_if <= RegisterReadDecode_io_rrd_uop_xcpt_ma_if; // @[register-read.scala 86:29]
    REG_1_bp_debug_if <= RegisterReadDecode_io_rrd_uop_bp_debug_if; // @[register-read.scala 86:29]
    REG_1_bp_xcpt_if <= RegisterReadDecode_io_rrd_uop_bp_xcpt_if; // @[register-read.scala 86:29]
    REG_1_debug_fsrc <= RegisterReadDecode_io_rrd_uop_debug_fsrc; // @[register-read.scala 86:29]
    REG_1_debug_tsrc <= RegisterReadDecode_io_rrd_uop_debug_tsrc; // @[register-read.scala 86:29]
    REG_2 <= io_iss_uops_0_prs1 == 6'h0; // @[register-read.scala 124:67]
    REG_3 <= io_iss_uops_0_prs2 == 6'h0; // @[register-read.scala 125:67]
    REG_4 <= io_iss_uops_0_prs3 == 6'h0; // @[register-read.scala 126:67]
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
  exe_reg_valids_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  exe_reg_uops_0_uopc = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  exe_reg_uops_0_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  exe_reg_uops_0_debug_inst = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  exe_reg_uops_0_is_rvc = _RAND_4[0:0];
  _RAND_5 = {2{`RANDOM}};
  exe_reg_uops_0_debug_pc = _RAND_5[39:0];
  _RAND_6 = {1{`RANDOM}};
  exe_reg_uops_0_iq_type = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  exe_reg_uops_0_fu_code = _RAND_7[9:0];
  _RAND_8 = {1{`RANDOM}};
  exe_reg_uops_0_ctrl_br_type = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  exe_reg_uops_0_ctrl_op1_sel = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  exe_reg_uops_0_ctrl_op2_sel = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  exe_reg_uops_0_ctrl_imm_sel = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  exe_reg_uops_0_ctrl_op_fcn = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  exe_reg_uops_0_ctrl_fcn_dw = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  exe_reg_uops_0_ctrl_csr_cmd = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  exe_reg_uops_0_ctrl_is_load = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  exe_reg_uops_0_ctrl_is_sta = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  exe_reg_uops_0_ctrl_is_std = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  exe_reg_uops_0_iw_state = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  exe_reg_uops_0_iw_p1_poisoned = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  exe_reg_uops_0_iw_p2_poisoned = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  exe_reg_uops_0_is_br = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  exe_reg_uops_0_is_jalr = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  exe_reg_uops_0_is_jal = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  exe_reg_uops_0_is_sfb = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  exe_reg_uops_0_br_mask = _RAND_25[11:0];
  _RAND_26 = {1{`RANDOM}};
  exe_reg_uops_0_br_tag = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  exe_reg_uops_0_ftq_idx = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  exe_reg_uops_0_edge_inst = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  exe_reg_uops_0_pc_lob = _RAND_29[5:0];
  _RAND_30 = {1{`RANDOM}};
  exe_reg_uops_0_taken = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  exe_reg_uops_0_imm_packed = _RAND_31[19:0];
  _RAND_32 = {1{`RANDOM}};
  exe_reg_uops_0_csr_addr = _RAND_32[11:0];
  _RAND_33 = {1{`RANDOM}};
  exe_reg_uops_0_rob_idx = _RAND_33[5:0];
  _RAND_34 = {1{`RANDOM}};
  exe_reg_uops_0_ldq_idx = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  exe_reg_uops_0_stq_idx = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  exe_reg_uops_0_rxq_idx = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  exe_reg_uops_0_pdst = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  exe_reg_uops_0_prs1 = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  exe_reg_uops_0_prs2 = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  exe_reg_uops_0_prs3 = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  exe_reg_uops_0_ppred = _RAND_41[4:0];
  _RAND_42 = {1{`RANDOM}};
  exe_reg_uops_0_prs1_busy = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  exe_reg_uops_0_prs2_busy = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  exe_reg_uops_0_prs3_busy = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  exe_reg_uops_0_ppred_busy = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  exe_reg_uops_0_stale_pdst = _RAND_46[5:0];
  _RAND_47 = {1{`RANDOM}};
  exe_reg_uops_0_exception = _RAND_47[0:0];
  _RAND_48 = {2{`RANDOM}};
  exe_reg_uops_0_exc_cause = _RAND_48[63:0];
  _RAND_49 = {1{`RANDOM}};
  exe_reg_uops_0_bypassable = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  exe_reg_uops_0_mem_cmd = _RAND_50[4:0];
  _RAND_51 = {1{`RANDOM}};
  exe_reg_uops_0_mem_size = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  exe_reg_uops_0_mem_signed = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  exe_reg_uops_0_is_fence = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  exe_reg_uops_0_is_fencei = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  exe_reg_uops_0_is_amo = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  exe_reg_uops_0_uses_ldq = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  exe_reg_uops_0_uses_stq = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  exe_reg_uops_0_is_sys_pc2epc = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  exe_reg_uops_0_is_unique = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  exe_reg_uops_0_flush_on_commit = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  exe_reg_uops_0_ldst_is_rs1 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  exe_reg_uops_0_ldst = _RAND_62[5:0];
  _RAND_63 = {1{`RANDOM}};
  exe_reg_uops_0_lrs1 = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  exe_reg_uops_0_lrs2 = _RAND_64[5:0];
  _RAND_65 = {1{`RANDOM}};
  exe_reg_uops_0_lrs3 = _RAND_65[5:0];
  _RAND_66 = {1{`RANDOM}};
  exe_reg_uops_0_ldst_val = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  exe_reg_uops_0_dst_rtype = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  exe_reg_uops_0_lrs1_rtype = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  exe_reg_uops_0_lrs2_rtype = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  exe_reg_uops_0_frs3_en = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  exe_reg_uops_0_fp_val = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  exe_reg_uops_0_fp_single = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  exe_reg_uops_0_xcpt_pf_if = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  exe_reg_uops_0_xcpt_ae_if = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  exe_reg_uops_0_xcpt_ma_if = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  exe_reg_uops_0_bp_debug_if = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  exe_reg_uops_0_bp_xcpt_if = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  exe_reg_uops_0_debug_fsrc = _RAND_78[1:0];
  _RAND_79 = {1{`RANDOM}};
  exe_reg_uops_0_debug_tsrc = _RAND_79[1:0];
  _RAND_80 = {3{`RANDOM}};
  exe_reg_rs1_data_0 = _RAND_80[64:0];
  _RAND_81 = {3{`RANDOM}};
  exe_reg_rs2_data_0 = _RAND_81[64:0];
  _RAND_82 = {3{`RANDOM}};
  exe_reg_rs3_data_0 = _RAND_82[64:0];
  _RAND_83 = {1{`RANDOM}};
  REG = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  REG_1_uopc = _RAND_84[6:0];
  _RAND_85 = {1{`RANDOM}};
  REG_1_inst = _RAND_85[31:0];
  _RAND_86 = {1{`RANDOM}};
  REG_1_debug_inst = _RAND_86[31:0];
  _RAND_87 = {1{`RANDOM}};
  REG_1_is_rvc = _RAND_87[0:0];
  _RAND_88 = {2{`RANDOM}};
  REG_1_debug_pc = _RAND_88[39:0];
  _RAND_89 = {1{`RANDOM}};
  REG_1_iq_type = _RAND_89[2:0];
  _RAND_90 = {1{`RANDOM}};
  REG_1_fu_code = _RAND_90[9:0];
  _RAND_91 = {1{`RANDOM}};
  REG_1_ctrl_br_type = _RAND_91[3:0];
  _RAND_92 = {1{`RANDOM}};
  REG_1_ctrl_op1_sel = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  REG_1_ctrl_op2_sel = _RAND_93[2:0];
  _RAND_94 = {1{`RANDOM}};
  REG_1_ctrl_imm_sel = _RAND_94[2:0];
  _RAND_95 = {1{`RANDOM}};
  REG_1_ctrl_op_fcn = _RAND_95[3:0];
  _RAND_96 = {1{`RANDOM}};
  REG_1_ctrl_fcn_dw = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  REG_1_ctrl_csr_cmd = _RAND_97[2:0];
  _RAND_98 = {1{`RANDOM}};
  REG_1_ctrl_is_load = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  REG_1_ctrl_is_sta = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  REG_1_ctrl_is_std = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  REG_1_iw_state = _RAND_101[1:0];
  _RAND_102 = {1{`RANDOM}};
  REG_1_iw_p1_poisoned = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  REG_1_iw_p2_poisoned = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  REG_1_is_br = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  REG_1_is_jalr = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  REG_1_is_jal = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  REG_1_is_sfb = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  REG_1_br_mask = _RAND_108[11:0];
  _RAND_109 = {1{`RANDOM}};
  REG_1_br_tag = _RAND_109[3:0];
  _RAND_110 = {1{`RANDOM}};
  REG_1_ftq_idx = _RAND_110[4:0];
  _RAND_111 = {1{`RANDOM}};
  REG_1_edge_inst = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  REG_1_pc_lob = _RAND_112[5:0];
  _RAND_113 = {1{`RANDOM}};
  REG_1_taken = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  REG_1_imm_packed = _RAND_114[19:0];
  _RAND_115 = {1{`RANDOM}};
  REG_1_csr_addr = _RAND_115[11:0];
  _RAND_116 = {1{`RANDOM}};
  REG_1_rob_idx = _RAND_116[5:0];
  _RAND_117 = {1{`RANDOM}};
  REG_1_ldq_idx = _RAND_117[3:0];
  _RAND_118 = {1{`RANDOM}};
  REG_1_stq_idx = _RAND_118[3:0];
  _RAND_119 = {1{`RANDOM}};
  REG_1_rxq_idx = _RAND_119[1:0];
  _RAND_120 = {1{`RANDOM}};
  REG_1_pdst = _RAND_120[5:0];
  _RAND_121 = {1{`RANDOM}};
  REG_1_prs1 = _RAND_121[5:0];
  _RAND_122 = {1{`RANDOM}};
  REG_1_prs2 = _RAND_122[5:0];
  _RAND_123 = {1{`RANDOM}};
  REG_1_prs3 = _RAND_123[5:0];
  _RAND_124 = {1{`RANDOM}};
  REG_1_ppred = _RAND_124[4:0];
  _RAND_125 = {1{`RANDOM}};
  REG_1_prs1_busy = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  REG_1_prs2_busy = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  REG_1_prs3_busy = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  REG_1_ppred_busy = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  REG_1_stale_pdst = _RAND_129[5:0];
  _RAND_130 = {1{`RANDOM}};
  REG_1_exception = _RAND_130[0:0];
  _RAND_131 = {2{`RANDOM}};
  REG_1_exc_cause = _RAND_131[63:0];
  _RAND_132 = {1{`RANDOM}};
  REG_1_bypassable = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  REG_1_mem_cmd = _RAND_133[4:0];
  _RAND_134 = {1{`RANDOM}};
  REG_1_mem_size = _RAND_134[1:0];
  _RAND_135 = {1{`RANDOM}};
  REG_1_mem_signed = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  REG_1_is_fence = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  REG_1_is_fencei = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  REG_1_is_amo = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  REG_1_uses_ldq = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  REG_1_uses_stq = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  REG_1_is_sys_pc2epc = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  REG_1_is_unique = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  REG_1_flush_on_commit = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  REG_1_ldst_is_rs1 = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  REG_1_ldst = _RAND_145[5:0];
  _RAND_146 = {1{`RANDOM}};
  REG_1_lrs1 = _RAND_146[5:0];
  _RAND_147 = {1{`RANDOM}};
  REG_1_lrs2 = _RAND_147[5:0];
  _RAND_148 = {1{`RANDOM}};
  REG_1_lrs3 = _RAND_148[5:0];
  _RAND_149 = {1{`RANDOM}};
  REG_1_ldst_val = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  REG_1_dst_rtype = _RAND_150[1:0];
  _RAND_151 = {1{`RANDOM}};
  REG_1_lrs1_rtype = _RAND_151[1:0];
  _RAND_152 = {1{`RANDOM}};
  REG_1_lrs2_rtype = _RAND_152[1:0];
  _RAND_153 = {1{`RANDOM}};
  REG_1_frs3_en = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  REG_1_fp_val = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  REG_1_fp_single = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  REG_1_xcpt_pf_if = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  REG_1_xcpt_ae_if = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  REG_1_xcpt_ma_if = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  REG_1_bp_debug_if = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  REG_1_bp_xcpt_if = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  REG_1_debug_fsrc = _RAND_161[1:0];
  _RAND_162 = {1{`RANDOM}};
  REG_1_debug_tsrc = _RAND_162[1:0];
  _RAND_163 = {1{`RANDOM}};
  REG_2 = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  REG_3 = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  REG_4 = _RAND_165[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
