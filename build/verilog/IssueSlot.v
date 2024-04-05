module IssueSlot(
  input         clock,
  input         reset,
  output        io_valid,
  output        io_will_be_valid,
  output        io_request,
  output        io_request_hp,
  input         io_grant,
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
  input         io_kill,
  input         io_clear,
  input         io_ldspec_miss,
  input         io_wakeup_ports_0_valid,
  input  [5:0]  io_wakeup_ports_0_bits_pdst,
  input         io_wakeup_ports_0_bits_poisoned,
  input         io_wakeup_ports_1_valid,
  input  [5:0]  io_wakeup_ports_1_bits_pdst,
  input         io_wakeup_ports_1_bits_poisoned,
  input         io_pred_wakeup_port_valid,
  input  [4:0]  io_pred_wakeup_port_bits,
  input         io_spec_ld_wakeup_0_valid,
  input  [5:0]  io_spec_ld_wakeup_0_bits,
  input         io_in_uop_valid,
  input  [6:0]  io_in_uop_bits_uopc,
  input  [31:0] io_in_uop_bits_inst,
  input  [31:0] io_in_uop_bits_debug_inst,
  input         io_in_uop_bits_is_rvc,
  input  [39:0] io_in_uop_bits_debug_pc,
  input  [2:0]  io_in_uop_bits_iq_type,
  input  [9:0]  io_in_uop_bits_fu_code,
  input  [3:0]  io_in_uop_bits_ctrl_br_type,
  input  [1:0]  io_in_uop_bits_ctrl_op1_sel,
  input  [2:0]  io_in_uop_bits_ctrl_op2_sel,
  input  [2:0]  io_in_uop_bits_ctrl_imm_sel,
  input  [3:0]  io_in_uop_bits_ctrl_op_fcn,
  input         io_in_uop_bits_ctrl_fcn_dw,
  input  [2:0]  io_in_uop_bits_ctrl_csr_cmd,
  input         io_in_uop_bits_ctrl_is_load,
  input         io_in_uop_bits_ctrl_is_sta,
  input         io_in_uop_bits_ctrl_is_std,
  input  [1:0]  io_in_uop_bits_iw_state,
  input         io_in_uop_bits_iw_p1_poisoned,
  input         io_in_uop_bits_iw_p2_poisoned,
  input         io_in_uop_bits_is_br,
  input         io_in_uop_bits_is_jalr,
  input         io_in_uop_bits_is_jal,
  input         io_in_uop_bits_is_sfb,
  input  [11:0] io_in_uop_bits_br_mask,
  input  [3:0]  io_in_uop_bits_br_tag,
  input  [4:0]  io_in_uop_bits_ftq_idx,
  input         io_in_uop_bits_edge_inst,
  input  [5:0]  io_in_uop_bits_pc_lob,
  input         io_in_uop_bits_taken,
  input  [19:0] io_in_uop_bits_imm_packed,
  input  [11:0] io_in_uop_bits_csr_addr,
  input  [5:0]  io_in_uop_bits_rob_idx,
  input  [3:0]  io_in_uop_bits_ldq_idx,
  input  [3:0]  io_in_uop_bits_stq_idx,
  input  [1:0]  io_in_uop_bits_rxq_idx,
  input  [5:0]  io_in_uop_bits_pdst,
  input  [5:0]  io_in_uop_bits_prs1,
  input  [5:0]  io_in_uop_bits_prs2,
  input  [5:0]  io_in_uop_bits_prs3,
  input  [4:0]  io_in_uop_bits_ppred,
  input         io_in_uop_bits_prs1_busy,
  input         io_in_uop_bits_prs2_busy,
  input         io_in_uop_bits_prs3_busy,
  input         io_in_uop_bits_ppred_busy,
  input  [5:0]  io_in_uop_bits_stale_pdst,
  input         io_in_uop_bits_exception,
  input  [63:0] io_in_uop_bits_exc_cause,
  input         io_in_uop_bits_bypassable,
  input  [4:0]  io_in_uop_bits_mem_cmd,
  input  [1:0]  io_in_uop_bits_mem_size,
  input         io_in_uop_bits_mem_signed,
  input         io_in_uop_bits_is_fence,
  input         io_in_uop_bits_is_fencei,
  input         io_in_uop_bits_is_amo,
  input         io_in_uop_bits_uses_ldq,
  input         io_in_uop_bits_uses_stq,
  input         io_in_uop_bits_is_sys_pc2epc,
  input         io_in_uop_bits_is_unique,
  input         io_in_uop_bits_flush_on_commit,
  input         io_in_uop_bits_ldst_is_rs1,
  input  [5:0]  io_in_uop_bits_ldst,
  input  [5:0]  io_in_uop_bits_lrs1,
  input  [5:0]  io_in_uop_bits_lrs2,
  input  [5:0]  io_in_uop_bits_lrs3,
  input         io_in_uop_bits_ldst_val,
  input  [1:0]  io_in_uop_bits_dst_rtype,
  input  [1:0]  io_in_uop_bits_lrs1_rtype,
  input  [1:0]  io_in_uop_bits_lrs2_rtype,
  input         io_in_uop_bits_frs3_en,
  input         io_in_uop_bits_fp_val,
  input         io_in_uop_bits_fp_single,
  input         io_in_uop_bits_xcpt_pf_if,
  input         io_in_uop_bits_xcpt_ae_if,
  input         io_in_uop_bits_xcpt_ma_if,
  input         io_in_uop_bits_bp_debug_if,
  input         io_in_uop_bits_bp_xcpt_if,
  input  [1:0]  io_in_uop_bits_debug_fsrc,
  input  [1:0]  io_in_uop_bits_debug_tsrc,
  output [6:0]  io_out_uop_uopc,
  output [31:0] io_out_uop_inst,
  output [31:0] io_out_uop_debug_inst,
  output        io_out_uop_is_rvc,
  output [39:0] io_out_uop_debug_pc,
  output [2:0]  io_out_uop_iq_type,
  output [9:0]  io_out_uop_fu_code,
  output [3:0]  io_out_uop_ctrl_br_type,
  output [1:0]  io_out_uop_ctrl_op1_sel,
  output [2:0]  io_out_uop_ctrl_op2_sel,
  output [2:0]  io_out_uop_ctrl_imm_sel,
  output [3:0]  io_out_uop_ctrl_op_fcn,
  output        io_out_uop_ctrl_fcn_dw,
  output [2:0]  io_out_uop_ctrl_csr_cmd,
  output        io_out_uop_ctrl_is_load,
  output        io_out_uop_ctrl_is_sta,
  output        io_out_uop_ctrl_is_std,
  output [1:0]  io_out_uop_iw_state,
  output        io_out_uop_iw_p1_poisoned,
  output        io_out_uop_iw_p2_poisoned,
  output        io_out_uop_is_br,
  output        io_out_uop_is_jalr,
  output        io_out_uop_is_jal,
  output        io_out_uop_is_sfb,
  output [11:0] io_out_uop_br_mask,
  output [3:0]  io_out_uop_br_tag,
  output [4:0]  io_out_uop_ftq_idx,
  output        io_out_uop_edge_inst,
  output [5:0]  io_out_uop_pc_lob,
  output        io_out_uop_taken,
  output [19:0] io_out_uop_imm_packed,
  output [11:0] io_out_uop_csr_addr,
  output [5:0]  io_out_uop_rob_idx,
  output [3:0]  io_out_uop_ldq_idx,
  output [3:0]  io_out_uop_stq_idx,
  output [1:0]  io_out_uop_rxq_idx,
  output [5:0]  io_out_uop_pdst,
  output [5:0]  io_out_uop_prs1,
  output [5:0]  io_out_uop_prs2,
  output [5:0]  io_out_uop_prs3,
  output [4:0]  io_out_uop_ppred,
  output        io_out_uop_prs1_busy,
  output        io_out_uop_prs2_busy,
  output        io_out_uop_prs3_busy,
  output        io_out_uop_ppred_busy,
  output [5:0]  io_out_uop_stale_pdst,
  output        io_out_uop_exception,
  output [63:0] io_out_uop_exc_cause,
  output        io_out_uop_bypassable,
  output [4:0]  io_out_uop_mem_cmd,
  output [1:0]  io_out_uop_mem_size,
  output        io_out_uop_mem_signed,
  output        io_out_uop_is_fence,
  output        io_out_uop_is_fencei,
  output        io_out_uop_is_amo,
  output        io_out_uop_uses_ldq,
  output        io_out_uop_uses_stq,
  output        io_out_uop_is_sys_pc2epc,
  output        io_out_uop_is_unique,
  output        io_out_uop_flush_on_commit,
  output        io_out_uop_ldst_is_rs1,
  output [5:0]  io_out_uop_ldst,
  output [5:0]  io_out_uop_lrs1,
  output [5:0]  io_out_uop_lrs2,
  output [5:0]  io_out_uop_lrs3,
  output        io_out_uop_ldst_val,
  output [1:0]  io_out_uop_dst_rtype,
  output [1:0]  io_out_uop_lrs1_rtype,
  output [1:0]  io_out_uop_lrs2_rtype,
  output        io_out_uop_frs3_en,
  output        io_out_uop_fp_val,
  output        io_out_uop_fp_single,
  output        io_out_uop_xcpt_pf_if,
  output        io_out_uop_xcpt_ae_if,
  output        io_out_uop_xcpt_ma_if,
  output        io_out_uop_bp_debug_if,
  output        io_out_uop_bp_xcpt_if,
  output [1:0]  io_out_uop_debug_fsrc,
  output [1:0]  io_out_uop_debug_tsrc,
  output [6:0]  io_uop_uopc,
  output [31:0] io_uop_inst,
  output [31:0] io_uop_debug_inst,
  output        io_uop_is_rvc,
  output [39:0] io_uop_debug_pc,
  output [2:0]  io_uop_iq_type,
  output [9:0]  io_uop_fu_code,
  output [3:0]  io_uop_ctrl_br_type,
  output [1:0]  io_uop_ctrl_op1_sel,
  output [2:0]  io_uop_ctrl_op2_sel,
  output [2:0]  io_uop_ctrl_imm_sel,
  output [3:0]  io_uop_ctrl_op_fcn,
  output        io_uop_ctrl_fcn_dw,
  output [2:0]  io_uop_ctrl_csr_cmd,
  output        io_uop_ctrl_is_load,
  output        io_uop_ctrl_is_sta,
  output        io_uop_ctrl_is_std,
  output [1:0]  io_uop_iw_state,
  output        io_uop_iw_p1_poisoned,
  output        io_uop_iw_p2_poisoned,
  output        io_uop_is_br,
  output        io_uop_is_jalr,
  output        io_uop_is_jal,
  output        io_uop_is_sfb,
  output [11:0] io_uop_br_mask,
  output [3:0]  io_uop_br_tag,
  output [4:0]  io_uop_ftq_idx,
  output        io_uop_edge_inst,
  output [5:0]  io_uop_pc_lob,
  output        io_uop_taken,
  output [19:0] io_uop_imm_packed,
  output [11:0] io_uop_csr_addr,
  output [5:0]  io_uop_rob_idx,
  output [3:0]  io_uop_ldq_idx,
  output [3:0]  io_uop_stq_idx,
  output [1:0]  io_uop_rxq_idx,
  output [5:0]  io_uop_pdst,
  output [5:0]  io_uop_prs1,
  output [5:0]  io_uop_prs2,
  output [5:0]  io_uop_prs3,
  output [4:0]  io_uop_ppred,
  output        io_uop_prs1_busy,
  output        io_uop_prs2_busy,
  output        io_uop_prs3_busy,
  output        io_uop_ppred_busy,
  output [5:0]  io_uop_stale_pdst,
  output        io_uop_exception,
  output [63:0] io_uop_exc_cause,
  output        io_uop_bypassable,
  output [4:0]  io_uop_mem_cmd,
  output [1:0]  io_uop_mem_size,
  output        io_uop_mem_signed,
  output        io_uop_is_fence,
  output        io_uop_is_fencei,
  output        io_uop_is_amo,
  output        io_uop_uses_ldq,
  output        io_uop_uses_stq,
  output        io_uop_is_sys_pc2epc,
  output        io_uop_is_unique,
  output        io_uop_flush_on_commit,
  output        io_uop_ldst_is_rs1,
  output [5:0]  io_uop_ldst,
  output [5:0]  io_uop_lrs1,
  output [5:0]  io_uop_lrs2,
  output [5:0]  io_uop_lrs3,
  output        io_uop_ldst_val,
  output [1:0]  io_uop_dst_rtype,
  output [1:0]  io_uop_lrs1_rtype,
  output [1:0]  io_uop_lrs2_rtype,
  output        io_uop_frs3_en,
  output        io_uop_fp_val,
  output        io_uop_fp_single,
  output        io_uop_xcpt_pf_if,
  output        io_uop_xcpt_ae_if,
  output        io_uop_xcpt_ma_if,
  output        io_uop_bp_debug_if,
  output        io_uop_bp_xcpt_if,
  output [1:0]  io_uop_debug_fsrc,
  output [1:0]  io_uop_debug_tsrc,
  output        io_debug_p1,
  output        io_debug_p2,
  output        io_debug_p3,
  output        io_debug_ppred,
  output [1:0]  io_debug_state
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
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
  reg [63:0] _RAND_52;
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
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[issue-slot.scala 86:22]
  reg  p1; // @[issue-slot.scala 87:22]
  reg  p2; // @[issue-slot.scala 88:22]
  reg  p3; // @[issue-slot.scala 89:22]
  reg  ppred; // @[issue-slot.scala 90:22]
  reg  p1_poisoned; // @[issue-slot.scala 95:28]
  reg  p2_poisoned; // @[issue-slot.scala 96:28]
  wire  next_p1_poisoned = io_in_uop_valid ? io_in_uop_bits_iw_p1_poisoned : p1_poisoned; // @[issue-slot.scala 99:29]
  wire  next_p2_poisoned = io_in_uop_valid ? io_in_uop_bits_iw_p2_poisoned : p2_poisoned; // @[issue-slot.scala 100:29]
  reg [6:0] slot_uop_uopc; // @[issue-slot.scala 102:25]
  reg [31:0] slot_uop_inst; // @[issue-slot.scala 102:25]
  reg [31:0] slot_uop_debug_inst; // @[issue-slot.scala 102:25]
  reg  slot_uop_is_rvc; // @[issue-slot.scala 102:25]
  reg [39:0] slot_uop_debug_pc; // @[issue-slot.scala 102:25]
  reg [2:0] slot_uop_iq_type; // @[issue-slot.scala 102:25]
  reg [9:0] slot_uop_fu_code; // @[issue-slot.scala 102:25]
  reg [3:0] slot_uop_ctrl_br_type; // @[issue-slot.scala 102:25]
  reg [1:0] slot_uop_ctrl_op1_sel; // @[issue-slot.scala 102:25]
  reg [2:0] slot_uop_ctrl_op2_sel; // @[issue-slot.scala 102:25]
  reg [2:0] slot_uop_ctrl_imm_sel; // @[issue-slot.scala 102:25]
  reg [3:0] slot_uop_ctrl_op_fcn; // @[issue-slot.scala 102:25]
  reg  slot_uop_ctrl_fcn_dw; // @[issue-slot.scala 102:25]
  reg [2:0] slot_uop_ctrl_csr_cmd; // @[issue-slot.scala 102:25]
  reg  slot_uop_ctrl_is_load; // @[issue-slot.scala 102:25]
  reg  slot_uop_ctrl_is_sta; // @[issue-slot.scala 102:25]
  reg  slot_uop_ctrl_is_std; // @[issue-slot.scala 102:25]
  reg [1:0] slot_uop_iw_state; // @[issue-slot.scala 102:25]
  reg  slot_uop_is_br; // @[issue-slot.scala 102:25]
  reg  slot_uop_is_jalr; // @[issue-slot.scala 102:25]
  reg  slot_uop_is_jal; // @[issue-slot.scala 102:25]
  reg  slot_uop_is_sfb; // @[issue-slot.scala 102:25]
  reg [11:0] slot_uop_br_mask; // @[issue-slot.scala 102:25]
  reg [3:0] slot_uop_br_tag; // @[issue-slot.scala 102:25]
  reg [4:0] slot_uop_ftq_idx; // @[issue-slot.scala 102:25]
  reg  slot_uop_edge_inst; // @[issue-slot.scala 102:25]
  reg [5:0] slot_uop_pc_lob; // @[issue-slot.scala 102:25]
  reg  slot_uop_taken; // @[issue-slot.scala 102:25]
  reg [19:0] slot_uop_imm_packed; // @[issue-slot.scala 102:25]
  reg [11:0] slot_uop_csr_addr; // @[issue-slot.scala 102:25]
  reg [5:0] slot_uop_rob_idx; // @[issue-slot.scala 102:25]
  reg [3:0] slot_uop_ldq_idx; // @[issue-slot.scala 102:25]
  reg [3:0] slot_uop_stq_idx; // @[issue-slot.scala 102:25]
  reg [1:0] slot_uop_rxq_idx; // @[issue-slot.scala 102:25]
  reg [5:0] slot_uop_pdst; // @[issue-slot.scala 102:25]
  reg [5:0] slot_uop_prs1; // @[issue-slot.scala 102:25]
  reg [5:0] slot_uop_prs2; // @[issue-slot.scala 102:25]
  reg [5:0] slot_uop_prs3; // @[issue-slot.scala 102:25]
  reg [4:0] slot_uop_ppred; // @[issue-slot.scala 102:25]
  reg  slot_uop_prs1_busy; // @[issue-slot.scala 102:25]
  reg  slot_uop_prs2_busy; // @[issue-slot.scala 102:25]
  reg  slot_uop_prs3_busy; // @[issue-slot.scala 102:25]
  reg  slot_uop_ppred_busy; // @[issue-slot.scala 102:25]
  reg [5:0] slot_uop_stale_pdst; // @[issue-slot.scala 102:25]
  reg  slot_uop_exception; // @[issue-slot.scala 102:25]
  reg [63:0] slot_uop_exc_cause; // @[issue-slot.scala 102:25]
  reg  slot_uop_bypassable; // @[issue-slot.scala 102:25]
  reg [4:0] slot_uop_mem_cmd; // @[issue-slot.scala 102:25]
  reg [1:0] slot_uop_mem_size; // @[issue-slot.scala 102:25]
  reg  slot_uop_mem_signed; // @[issue-slot.scala 102:25]
  reg  slot_uop_is_fence; // @[issue-slot.scala 102:25]
  reg  slot_uop_is_fencei; // @[issue-slot.scala 102:25]
  reg  slot_uop_is_amo; // @[issue-slot.scala 102:25]
  reg  slot_uop_uses_ldq; // @[issue-slot.scala 102:25]
  reg  slot_uop_uses_stq; // @[issue-slot.scala 102:25]
  reg  slot_uop_is_sys_pc2epc; // @[issue-slot.scala 102:25]
  reg  slot_uop_is_unique; // @[issue-slot.scala 102:25]
  reg  slot_uop_flush_on_commit; // @[issue-slot.scala 102:25]
  reg  slot_uop_ldst_is_rs1; // @[issue-slot.scala 102:25]
  reg [5:0] slot_uop_ldst; // @[issue-slot.scala 102:25]
  reg [5:0] slot_uop_lrs1; // @[issue-slot.scala 102:25]
  reg [5:0] slot_uop_lrs2; // @[issue-slot.scala 102:25]
  reg [5:0] slot_uop_lrs3; // @[issue-slot.scala 102:25]
  reg  slot_uop_ldst_val; // @[issue-slot.scala 102:25]
  reg [1:0] slot_uop_dst_rtype; // @[issue-slot.scala 102:25]
  reg [1:0] slot_uop_lrs1_rtype; // @[issue-slot.scala 102:25]
  reg [1:0] slot_uop_lrs2_rtype; // @[issue-slot.scala 102:25]
  reg  slot_uop_frs3_en; // @[issue-slot.scala 102:25]
  reg  slot_uop_fp_val; // @[issue-slot.scala 102:25]
  reg  slot_uop_fp_single; // @[issue-slot.scala 102:25]
  reg  slot_uop_xcpt_pf_if; // @[issue-slot.scala 102:25]
  reg  slot_uop_xcpt_ae_if; // @[issue-slot.scala 102:25]
  reg  slot_uop_xcpt_ma_if; // @[issue-slot.scala 102:25]
  reg  slot_uop_bp_debug_if; // @[issue-slot.scala 102:25]
  reg  slot_uop_bp_xcpt_if; // @[issue-slot.scala 102:25]
  reg [1:0] slot_uop_debug_fsrc; // @[issue-slot.scala 102:25]
  reg [1:0] slot_uop_debug_tsrc; // @[issue-slot.scala 102:25]
  wire [5:0] next_uop_prs1 = io_in_uop_valid ? io_in_uop_bits_prs1 : slot_uop_prs1; // @[issue-slot.scala 103:21]
  wire [5:0] next_uop_prs2 = io_in_uop_valid ? io_in_uop_bits_prs2 : slot_uop_prs2; // @[issue-slot.scala 103:21]
  wire [5:0] next_uop_prs3 = io_in_uop_valid ? io_in_uop_bits_prs3 : slot_uop_prs3; // @[issue-slot.scala 103:21]
  wire [4:0] next_uop_ppred = io_in_uop_valid ? io_in_uop_bits_ppred : slot_uop_ppred; // @[issue-slot.scala 103:21]
  wire [1:0] next_uop_lrs1_rtype = io_in_uop_valid ? io_in_uop_bits_lrs1_rtype : slot_uop_lrs1_rtype; // @[issue-slot.scala 103:21]
  wire [1:0] next_uop_lrs2_rtype = io_in_uop_valid ? io_in_uop_bits_lrs2_rtype : slot_uop_lrs2_rtype; // @[issue-slot.scala 103:21]
  wire [11:0] _T_73 = io_brupdate_b1_mispredict_mask & slot_uop_br_mask; // @[util.scala 118:51]
  wire  _T_74 = _T_73 != 12'h0; // @[util.scala 118:59]
  wire  _T = state == 2'h1; // @[issue-slot.scala 133:36]
  wire  _T_2 = state == 2'h2; // @[issue-slot.scala 134:25]
  wire  _T_3 = io_grant & state == 2'h2; // @[issue-slot.scala 134:15]
  wire  _T_6 = io_grant & state == 2'h2 & p1 & p2 & ppred; // @[issue-slot.scala 134:52]
  wire  _T_7 = io_grant & state == 2'h1 | _T_6; // @[issue-slot.scala 133:52]
  wire  _T_10 = ~(io_ldspec_miss & (p1_poisoned | p2_poisoned)); // @[issue-slot.scala 136:11]
  wire [1:0] _GEN_3 = ~(io_ldspec_miss & (p1_poisoned | p2_poisoned)) ? 2'h0 : state; // @[issue-slot.scala 136:62 issue-slot.scala 137:18 issue-slot.scala 126:14]
  wire [1:0] _GEN_7 = _T_10 ? 2'h1 : state; // @[issue-slot.scala 140:62 issue-slot.scala 141:18 issue-slot.scala 126:14]
  wire [1:0] _GEN_11 = _T_3 ? _GEN_7 : state; // @[issue-slot.scala 139:51 issue-slot.scala 126:14]
  wire [1:0] _GEN_15 = _T_7 ? _GEN_3 : _GEN_11; // @[issue-slot.scala 134:63]
  wire [1:0] _GEN_19 = io_kill ? 2'h0 : _GEN_15; // @[issue-slot.scala 131:18 issue-slot.scala 132:16]
  wire [1:0] next_state = _T_74 ? 2'h0 : _GEN_19; // @[issue-slot.scala 231:50 issue-slot.scala 232:16]
  wire [6:0] _GEN_4 = p1 ? 7'h3 : slot_uop_uopc; // @[issue-slot.scala 142:17 issue-slot.scala 143:23 issue-slot.scala 102:25]
  wire [1:0] _GEN_5 = p1 ? 2'h2 : slot_uop_lrs1_rtype; // @[issue-slot.scala 142:17 issue-slot.scala 145:29 issue-slot.scala 102:25]
  wire [1:0] _GEN_6 = p1 ? slot_uop_lrs2_rtype : 2'h2; // @[issue-slot.scala 142:17 issue-slot.scala 102:25 issue-slot.scala 148:29]
  wire [6:0] _GEN_8 = _T_10 ? _GEN_4 : slot_uop_uopc; // @[issue-slot.scala 140:62 issue-slot.scala 102:25]
  wire [1:0] _GEN_9 = _T_10 ? _GEN_5 : slot_uop_lrs1_rtype; // @[issue-slot.scala 140:62 issue-slot.scala 102:25]
  wire [1:0] _GEN_10 = _T_10 ? _GEN_6 : slot_uop_lrs2_rtype; // @[issue-slot.scala 140:62 issue-slot.scala 102:25]
  wire [6:0] _GEN_12 = _T_3 ? _GEN_8 : slot_uop_uopc; // @[issue-slot.scala 139:51 issue-slot.scala 102:25]
  wire [1:0] _GEN_13 = _T_3 ? _GEN_9 : slot_uop_lrs1_rtype; // @[issue-slot.scala 139:51 issue-slot.scala 102:25]
  wire [1:0] _GEN_14 = _T_3 ? _GEN_10 : slot_uop_lrs2_rtype; // @[issue-slot.scala 139:51 issue-slot.scala 102:25]
  wire [6:0] _GEN_16 = _T_7 ? slot_uop_uopc : _GEN_12; // @[issue-slot.scala 134:63 issue-slot.scala 102:25]
  wire [1:0] _GEN_17 = _T_7 ? slot_uop_lrs1_rtype : _GEN_13; // @[issue-slot.scala 134:63 issue-slot.scala 102:25]
  wire [1:0] _GEN_18 = _T_7 ? slot_uop_lrs2_rtype : _GEN_14; // @[issue-slot.scala 134:63 issue-slot.scala 102:25]
  wire  _T_16 = state == 2'h0; // @[issue-slot.scala 78:26]
  wire  _GEN_102 = io_in_uop_valid ? ~io_in_uop_bits_prs1_busy : p1; // @[issue-slot.scala 168:26 issue-slot.scala 169:8 issue-slot.scala 87:22]
  wire  _GEN_103 = io_in_uop_valid ? ~io_in_uop_bits_prs2_busy : p2; // @[issue-slot.scala 168:26 issue-slot.scala 170:8 issue-slot.scala 88:22]
  wire  _GEN_104 = io_in_uop_valid ? ~io_in_uop_bits_prs3_busy : p3; // @[issue-slot.scala 168:26 issue-slot.scala 171:8 issue-slot.scala 89:22]
  wire  _GEN_105 = io_in_uop_valid ? ~io_in_uop_bits_ppred_busy : ppred; // @[issue-slot.scala 168:26 issue-slot.scala 172:11 issue-slot.scala 90:22]
  wire  _T_26 = io_ldspec_miss & next_p1_poisoned; // @[issue-slot.scala 175:24]
  wire  _GEN_106 = io_ldspec_miss & next_p1_poisoned ? 1'h0 : _GEN_102; // @[issue-slot.scala 175:45 issue-slot.scala 177:8]
  wire  _T_31 = io_ldspec_miss & next_p2_poisoned; // @[issue-slot.scala 179:24]
  wire  _GEN_107 = io_ldspec_miss & next_p2_poisoned ? 1'h0 : _GEN_103; // @[issue-slot.scala 179:45 issue-slot.scala 181:8]
  wire  _T_36 = io_wakeup_ports_0_bits_pdst == next_uop_prs1; // @[issue-slot.scala 186:40]
  wire  _T_37 = io_wakeup_ports_0_valid & _T_36; // @[issue-slot.scala 185:36]
  wire  _T_38 = io_wakeup_ports_0_bits_pdst == next_uop_prs2; // @[issue-slot.scala 190:40]
  wire  _T_39 = io_wakeup_ports_0_valid & _T_38; // @[issue-slot.scala 189:36]
  wire  _T_40 = io_wakeup_ports_0_bits_pdst == next_uop_prs3; // @[issue-slot.scala 194:40]
  wire  _T_41 = io_wakeup_ports_0_valid & _T_40; // @[issue-slot.scala 193:36]
  wire  _T_42 = io_wakeup_ports_1_bits_pdst == next_uop_prs1; // @[issue-slot.scala 186:40]
  wire  _T_43 = io_wakeup_ports_1_valid & _T_42; // @[issue-slot.scala 185:36]
  wire  _GEN_111 = _T_43 | (_T_37 | _GEN_106); // @[issue-slot.scala 186:60 issue-slot.scala 187:10]
  wire  _T_44 = io_wakeup_ports_1_bits_pdst == next_uop_prs2; // @[issue-slot.scala 190:40]
  wire  _T_45 = io_wakeup_ports_1_valid & _T_44; // @[issue-slot.scala 189:36]
  wire  _GEN_112 = _T_45 | (_T_39 | _GEN_107); // @[issue-slot.scala 190:60 issue-slot.scala 191:10]
  wire  _T_46 = io_wakeup_ports_1_bits_pdst == next_uop_prs3; // @[issue-slot.scala 194:40]
  wire  _T_47 = io_wakeup_ports_1_valid & _T_46; // @[issue-slot.scala 193:36]
  wire  _GEN_113 = _T_47 | (_T_41 | _GEN_104); // @[issue-slot.scala 194:60 issue-slot.scala 195:10]
  wire  _GEN_114 = io_pred_wakeup_port_valid & io_pred_wakeup_port_bits == next_uop_ppred | _GEN_105; // @[issue-slot.scala 198:83 issue-slot.scala 199:11]
  wire  _T_56 = io_spec_ld_wakeup_0_bits == next_uop_prs1; // @[issue-slot.scala 210:33]
  wire  _T_57 = io_spec_ld_wakeup_0_valid & _T_56; // @[issue-slot.scala 209:38]
  wire  _T_58 = next_uop_lrs1_rtype == 2'h0; // @[issue-slot.scala 211:27]
  wire  _T_59 = _T_57 & _T_58; // @[issue-slot.scala 210:51]
  wire  _GEN_115 = _T_59 | _GEN_111; // @[issue-slot.scala 211:39 issue-slot.scala 212:10]
  wire  _T_64 = io_spec_ld_wakeup_0_bits == next_uop_prs2; // @[issue-slot.scala 217:33]
  wire  _T_65 = io_spec_ld_wakeup_0_valid & _T_64; // @[issue-slot.scala 216:38]
  wire  _T_66 = next_uop_lrs2_rtype == 2'h0; // @[issue-slot.scala 218:27]
  wire  _T_67 = _T_65 & _T_66; // @[issue-slot.scala 217:51]
  wire  _GEN_117 = _T_67 | _GEN_112; // @[issue-slot.scala 218:39 issue-slot.scala 219:10]
  wire [11:0] _T_72 = ~io_brupdate_b1_resolve_mask; // @[util.scala 85:27]
  wire [11:0] next_br_mask = slot_uop_br_mask & _T_72; // @[util.scala 85:25]
  wire  _T_76 = state != 2'h0; // @[issue-slot.scala 79:24]
  wire  _T_81 = ~io_kill; // @[issue-slot.scala 241:56]
  wire  high_priority = slot_uop_is_br | slot_uop_is_jal | slot_uop_is_jalr; // @[issue-slot.scala 242:57]
  wire  _T_86 = p1 & p2; // @[issue-slot.scala 246:22]
  wire  _GEN_121 = _T_2 & ((p1 | p2) & ppred & _T_81); // @[issue-slot.scala 247:37 issue-slot.scala 248:16 issue-slot.scala 250:16]
  wire  may_vacate = io_grant & (_T | _T_2 & p1 & p2 & ppred); // @[issue-slot.scala 260:29]
  wire [6:0] _GEN_123 = p2 & ppred ? 7'h3 : slot_uop_uopc; // @[issue-slot.scala 283:31 issue-slot.scala 284:19 issue-slot.scala 255:10]
  wire [1:0] _GEN_124 = p2 & ppred ? 2'h2 : slot_uop_lrs1_rtype; // @[issue-slot.scala 283:31 issue-slot.scala 285:25 issue-slot.scala 255:10]
  wire [6:0] _GEN_125 = p1 & ppred ? slot_uop_uopc : _GEN_123; // @[issue-slot.scala 280:31 issue-slot.scala 281:19]
  wire [1:0] _GEN_126 = p1 & ppred ? 2'h2 : slot_uop_lrs2_rtype; // @[issue-slot.scala 280:31 issue-slot.scala 282:25 issue-slot.scala 255:10]
  wire [1:0] _GEN_127 = p1 & ppred ? slot_uop_lrs1_rtype : _GEN_124; // @[issue-slot.scala 280:31 issue-slot.scala 255:10]
  wire [6:0] _GEN_128 = _T_86 & ppred ? slot_uop_uopc : _GEN_125; // @[issue-slot.scala 278:30 issue-slot.scala 255:10]
  wire [1:0] _GEN_129 = _T_86 & ppred ? slot_uop_lrs2_rtype : _GEN_126; // @[issue-slot.scala 278:30 issue-slot.scala 255:10]
  wire [1:0] _GEN_130 = _T_86 & ppred ? slot_uop_lrs1_rtype : _GEN_127; // @[issue-slot.scala 278:30 issue-slot.scala 255:10]
  assign io_valid = state != 2'h0; // @[issue-slot.scala 79:24]
  assign io_will_be_valid = _T_76 & ~(may_vacate & _T_10); // @[issue-slot.scala 262:32]
  assign io_request = _T ? p1 & p2 & p3 & ppred & _T_81 : _GEN_121; // @[issue-slot.scala 245:30 issue-slot.scala 246:16]
  assign io_request_hp = io_request & high_priority; // @[issue-slot.scala 243:31]
  assign io_out_uop_uopc = io_kill ? slot_uop_uopc : _GEN_16; // @[issue-slot.scala 131:18 issue-slot.scala 102:25]
  assign io_out_uop_inst = slot_uop_inst; // @[issue-slot.scala 264:25]
  assign io_out_uop_debug_inst = slot_uop_debug_inst; // @[issue-slot.scala 264:25]
  assign io_out_uop_is_rvc = slot_uop_is_rvc; // @[issue-slot.scala 264:25]
  assign io_out_uop_debug_pc = slot_uop_debug_pc; // @[issue-slot.scala 264:25]
  assign io_out_uop_iq_type = slot_uop_iq_type; // @[issue-slot.scala 264:25]
  assign io_out_uop_fu_code = slot_uop_fu_code; // @[issue-slot.scala 264:25]
  assign io_out_uop_ctrl_br_type = slot_uop_ctrl_br_type; // @[issue-slot.scala 264:25]
  assign io_out_uop_ctrl_op1_sel = slot_uop_ctrl_op1_sel; // @[issue-slot.scala 264:25]
  assign io_out_uop_ctrl_op2_sel = slot_uop_ctrl_op2_sel; // @[issue-slot.scala 264:25]
  assign io_out_uop_ctrl_imm_sel = slot_uop_ctrl_imm_sel; // @[issue-slot.scala 264:25]
  assign io_out_uop_ctrl_op_fcn = slot_uop_ctrl_op_fcn; // @[issue-slot.scala 264:25]
  assign io_out_uop_ctrl_fcn_dw = slot_uop_ctrl_fcn_dw; // @[issue-slot.scala 264:25]
  assign io_out_uop_ctrl_csr_cmd = slot_uop_ctrl_csr_cmd; // @[issue-slot.scala 264:25]
  assign io_out_uop_ctrl_is_load = slot_uop_ctrl_is_load; // @[issue-slot.scala 264:25]
  assign io_out_uop_ctrl_is_sta = slot_uop_ctrl_is_sta; // @[issue-slot.scala 264:25]
  assign io_out_uop_ctrl_is_std = slot_uop_ctrl_is_std; // @[issue-slot.scala 264:25]
  assign io_out_uop_iw_state = _T_74 ? 2'h0 : _GEN_19; // @[issue-slot.scala 231:50 issue-slot.scala 232:16]
  assign io_out_uop_iw_p1_poisoned = p1_poisoned; // @[issue-slot.scala 274:29]
  assign io_out_uop_iw_p2_poisoned = p2_poisoned; // @[issue-slot.scala 275:29]
  assign io_out_uop_is_br = slot_uop_is_br; // @[issue-slot.scala 264:25]
  assign io_out_uop_is_jalr = slot_uop_is_jalr; // @[issue-slot.scala 264:25]
  assign io_out_uop_is_jal = slot_uop_is_jal; // @[issue-slot.scala 264:25]
  assign io_out_uop_is_sfb = slot_uop_is_sfb; // @[issue-slot.scala 264:25]
  assign io_out_uop_br_mask = slot_uop_br_mask & _T_72; // @[util.scala 85:25]
  assign io_out_uop_br_tag = slot_uop_br_tag; // @[issue-slot.scala 264:25]
  assign io_out_uop_ftq_idx = slot_uop_ftq_idx; // @[issue-slot.scala 264:25]
  assign io_out_uop_edge_inst = slot_uop_edge_inst; // @[issue-slot.scala 264:25]
  assign io_out_uop_pc_lob = slot_uop_pc_lob; // @[issue-slot.scala 264:25]
  assign io_out_uop_taken = slot_uop_taken; // @[issue-slot.scala 264:25]
  assign io_out_uop_imm_packed = slot_uop_imm_packed; // @[issue-slot.scala 264:25]
  assign io_out_uop_csr_addr = slot_uop_csr_addr; // @[issue-slot.scala 264:25]
  assign io_out_uop_rob_idx = slot_uop_rob_idx; // @[issue-slot.scala 264:25]
  assign io_out_uop_ldq_idx = slot_uop_ldq_idx; // @[issue-slot.scala 264:25]
  assign io_out_uop_stq_idx = slot_uop_stq_idx; // @[issue-slot.scala 264:25]
  assign io_out_uop_rxq_idx = slot_uop_rxq_idx; // @[issue-slot.scala 264:25]
  assign io_out_uop_pdst = slot_uop_pdst; // @[issue-slot.scala 264:25]
  assign io_out_uop_prs1 = slot_uop_prs1; // @[issue-slot.scala 264:25]
  assign io_out_uop_prs2 = slot_uop_prs2; // @[issue-slot.scala 264:25]
  assign io_out_uop_prs3 = slot_uop_prs3; // @[issue-slot.scala 264:25]
  assign io_out_uop_ppred = slot_uop_ppred; // @[issue-slot.scala 264:25]
  assign io_out_uop_prs1_busy = ~p1; // @[issue-slot.scala 270:28]
  assign io_out_uop_prs2_busy = ~p2; // @[issue-slot.scala 271:28]
  assign io_out_uop_prs3_busy = ~p3; // @[issue-slot.scala 272:28]
  assign io_out_uop_ppred_busy = ~ppred; // @[issue-slot.scala 273:28]
  assign io_out_uop_stale_pdst = slot_uop_stale_pdst; // @[issue-slot.scala 264:25]
  assign io_out_uop_exception = slot_uop_exception; // @[issue-slot.scala 264:25]
  assign io_out_uop_exc_cause = slot_uop_exc_cause; // @[issue-slot.scala 264:25]
  assign io_out_uop_bypassable = slot_uop_bypassable; // @[issue-slot.scala 264:25]
  assign io_out_uop_mem_cmd = slot_uop_mem_cmd; // @[issue-slot.scala 264:25]
  assign io_out_uop_mem_size = slot_uop_mem_size; // @[issue-slot.scala 264:25]
  assign io_out_uop_mem_signed = slot_uop_mem_signed; // @[issue-slot.scala 264:25]
  assign io_out_uop_is_fence = slot_uop_is_fence; // @[issue-slot.scala 264:25]
  assign io_out_uop_is_fencei = slot_uop_is_fencei; // @[issue-slot.scala 264:25]
  assign io_out_uop_is_amo = slot_uop_is_amo; // @[issue-slot.scala 264:25]
  assign io_out_uop_uses_ldq = slot_uop_uses_ldq; // @[issue-slot.scala 264:25]
  assign io_out_uop_uses_stq = slot_uop_uses_stq; // @[issue-slot.scala 264:25]
  assign io_out_uop_is_sys_pc2epc = slot_uop_is_sys_pc2epc; // @[issue-slot.scala 264:25]
  assign io_out_uop_is_unique = slot_uop_is_unique; // @[issue-slot.scala 264:25]
  assign io_out_uop_flush_on_commit = slot_uop_flush_on_commit; // @[issue-slot.scala 264:25]
  assign io_out_uop_ldst_is_rs1 = slot_uop_ldst_is_rs1; // @[issue-slot.scala 264:25]
  assign io_out_uop_ldst = slot_uop_ldst; // @[issue-slot.scala 264:25]
  assign io_out_uop_lrs1 = slot_uop_lrs1; // @[issue-slot.scala 264:25]
  assign io_out_uop_lrs2 = slot_uop_lrs2; // @[issue-slot.scala 264:25]
  assign io_out_uop_lrs3 = slot_uop_lrs3; // @[issue-slot.scala 264:25]
  assign io_out_uop_ldst_val = slot_uop_ldst_val; // @[issue-slot.scala 264:25]
  assign io_out_uop_dst_rtype = slot_uop_dst_rtype; // @[issue-slot.scala 264:25]
  assign io_out_uop_lrs1_rtype = io_kill ? slot_uop_lrs1_rtype : _GEN_17; // @[issue-slot.scala 131:18 issue-slot.scala 102:25]
  assign io_out_uop_lrs2_rtype = io_kill ? slot_uop_lrs2_rtype : _GEN_18; // @[issue-slot.scala 131:18 issue-slot.scala 102:25]
  assign io_out_uop_frs3_en = slot_uop_frs3_en; // @[issue-slot.scala 264:25]
  assign io_out_uop_fp_val = slot_uop_fp_val; // @[issue-slot.scala 264:25]
  assign io_out_uop_fp_single = slot_uop_fp_single; // @[issue-slot.scala 264:25]
  assign io_out_uop_xcpt_pf_if = slot_uop_xcpt_pf_if; // @[issue-slot.scala 264:25]
  assign io_out_uop_xcpt_ae_if = slot_uop_xcpt_ae_if; // @[issue-slot.scala 264:25]
  assign io_out_uop_xcpt_ma_if = slot_uop_xcpt_ma_if; // @[issue-slot.scala 264:25]
  assign io_out_uop_bp_debug_if = slot_uop_bp_debug_if; // @[issue-slot.scala 264:25]
  assign io_out_uop_bp_xcpt_if = slot_uop_bp_xcpt_if; // @[issue-slot.scala 264:25]
  assign io_out_uop_debug_fsrc = slot_uop_debug_fsrc; // @[issue-slot.scala 264:25]
  assign io_out_uop_debug_tsrc = slot_uop_debug_tsrc; // @[issue-slot.scala 264:25]
  assign io_uop_uopc = _T_2 ? _GEN_128 : slot_uop_uopc; // @[issue-slot.scala 277:30 issue-slot.scala 255:10]
  assign io_uop_inst = slot_uop_inst; // @[issue-slot.scala 255:10]
  assign io_uop_debug_inst = slot_uop_debug_inst; // @[issue-slot.scala 255:10]
  assign io_uop_is_rvc = slot_uop_is_rvc; // @[issue-slot.scala 255:10]
  assign io_uop_debug_pc = slot_uop_debug_pc; // @[issue-slot.scala 255:10]
  assign io_uop_iq_type = slot_uop_iq_type; // @[issue-slot.scala 255:10]
  assign io_uop_fu_code = slot_uop_fu_code; // @[issue-slot.scala 255:10]
  assign io_uop_ctrl_br_type = slot_uop_ctrl_br_type; // @[issue-slot.scala 255:10]
  assign io_uop_ctrl_op1_sel = slot_uop_ctrl_op1_sel; // @[issue-slot.scala 255:10]
  assign io_uop_ctrl_op2_sel = slot_uop_ctrl_op2_sel; // @[issue-slot.scala 255:10]
  assign io_uop_ctrl_imm_sel = slot_uop_ctrl_imm_sel; // @[issue-slot.scala 255:10]
  assign io_uop_ctrl_op_fcn = slot_uop_ctrl_op_fcn; // @[issue-slot.scala 255:10]
  assign io_uop_ctrl_fcn_dw = slot_uop_ctrl_fcn_dw; // @[issue-slot.scala 255:10]
  assign io_uop_ctrl_csr_cmd = slot_uop_ctrl_csr_cmd; // @[issue-slot.scala 255:10]
  assign io_uop_ctrl_is_load = slot_uop_ctrl_is_load; // @[issue-slot.scala 255:10]
  assign io_uop_ctrl_is_sta = slot_uop_ctrl_is_sta; // @[issue-slot.scala 255:10]
  assign io_uop_ctrl_is_std = slot_uop_ctrl_is_std; // @[issue-slot.scala 255:10]
  assign io_uop_iw_state = slot_uop_iw_state; // @[issue-slot.scala 255:10]
  assign io_uop_iw_p1_poisoned = p1_poisoned; // @[issue-slot.scala 256:25]
  assign io_uop_iw_p2_poisoned = p2_poisoned; // @[issue-slot.scala 257:25]
  assign io_uop_is_br = slot_uop_is_br; // @[issue-slot.scala 255:10]
  assign io_uop_is_jalr = slot_uop_is_jalr; // @[issue-slot.scala 255:10]
  assign io_uop_is_jal = slot_uop_is_jal; // @[issue-slot.scala 255:10]
  assign io_uop_is_sfb = slot_uop_is_sfb; // @[issue-slot.scala 255:10]
  assign io_uop_br_mask = slot_uop_br_mask; // @[issue-slot.scala 255:10]
  assign io_uop_br_tag = slot_uop_br_tag; // @[issue-slot.scala 255:10]
  assign io_uop_ftq_idx = slot_uop_ftq_idx; // @[issue-slot.scala 255:10]
  assign io_uop_edge_inst = slot_uop_edge_inst; // @[issue-slot.scala 255:10]
  assign io_uop_pc_lob = slot_uop_pc_lob; // @[issue-slot.scala 255:10]
  assign io_uop_taken = slot_uop_taken; // @[issue-slot.scala 255:10]
  assign io_uop_imm_packed = slot_uop_imm_packed; // @[issue-slot.scala 255:10]
  assign io_uop_csr_addr = slot_uop_csr_addr; // @[issue-slot.scala 255:10]
  assign io_uop_rob_idx = slot_uop_rob_idx; // @[issue-slot.scala 255:10]
  assign io_uop_ldq_idx = slot_uop_ldq_idx; // @[issue-slot.scala 255:10]
  assign io_uop_stq_idx = slot_uop_stq_idx; // @[issue-slot.scala 255:10]
  assign io_uop_rxq_idx = slot_uop_rxq_idx; // @[issue-slot.scala 255:10]
  assign io_uop_pdst = slot_uop_pdst; // @[issue-slot.scala 255:10]
  assign io_uop_prs1 = slot_uop_prs1; // @[issue-slot.scala 255:10]
  assign io_uop_prs2 = slot_uop_prs2; // @[issue-slot.scala 255:10]
  assign io_uop_prs3 = slot_uop_prs3; // @[issue-slot.scala 255:10]
  assign io_uop_ppred = slot_uop_ppred; // @[issue-slot.scala 255:10]
  assign io_uop_prs1_busy = slot_uop_prs1_busy; // @[issue-slot.scala 255:10]
  assign io_uop_prs2_busy = slot_uop_prs2_busy; // @[issue-slot.scala 255:10]
  assign io_uop_prs3_busy = slot_uop_prs3_busy; // @[issue-slot.scala 255:10]
  assign io_uop_ppred_busy = slot_uop_ppred_busy; // @[issue-slot.scala 255:10]
  assign io_uop_stale_pdst = slot_uop_stale_pdst; // @[issue-slot.scala 255:10]
  assign io_uop_exception = slot_uop_exception; // @[issue-slot.scala 255:10]
  assign io_uop_exc_cause = slot_uop_exc_cause; // @[issue-slot.scala 255:10]
  assign io_uop_bypassable = slot_uop_bypassable; // @[issue-slot.scala 255:10]
  assign io_uop_mem_cmd = slot_uop_mem_cmd; // @[issue-slot.scala 255:10]
  assign io_uop_mem_size = slot_uop_mem_size; // @[issue-slot.scala 255:10]
  assign io_uop_mem_signed = slot_uop_mem_signed; // @[issue-slot.scala 255:10]
  assign io_uop_is_fence = slot_uop_is_fence; // @[issue-slot.scala 255:10]
  assign io_uop_is_fencei = slot_uop_is_fencei; // @[issue-slot.scala 255:10]
  assign io_uop_is_amo = slot_uop_is_amo; // @[issue-slot.scala 255:10]
  assign io_uop_uses_ldq = slot_uop_uses_ldq; // @[issue-slot.scala 255:10]
  assign io_uop_uses_stq = slot_uop_uses_stq; // @[issue-slot.scala 255:10]
  assign io_uop_is_sys_pc2epc = slot_uop_is_sys_pc2epc; // @[issue-slot.scala 255:10]
  assign io_uop_is_unique = slot_uop_is_unique; // @[issue-slot.scala 255:10]
  assign io_uop_flush_on_commit = slot_uop_flush_on_commit; // @[issue-slot.scala 255:10]
  assign io_uop_ldst_is_rs1 = slot_uop_ldst_is_rs1; // @[issue-slot.scala 255:10]
  assign io_uop_ldst = slot_uop_ldst; // @[issue-slot.scala 255:10]
  assign io_uop_lrs1 = slot_uop_lrs1; // @[issue-slot.scala 255:10]
  assign io_uop_lrs2 = slot_uop_lrs2; // @[issue-slot.scala 255:10]
  assign io_uop_lrs3 = slot_uop_lrs3; // @[issue-slot.scala 255:10]
  assign io_uop_ldst_val = slot_uop_ldst_val; // @[issue-slot.scala 255:10]
  assign io_uop_dst_rtype = slot_uop_dst_rtype; // @[issue-slot.scala 255:10]
  assign io_uop_lrs1_rtype = _T_2 ? _GEN_130 : slot_uop_lrs1_rtype; // @[issue-slot.scala 277:30 issue-slot.scala 255:10]
  assign io_uop_lrs2_rtype = _T_2 ? _GEN_129 : slot_uop_lrs2_rtype; // @[issue-slot.scala 277:30 issue-slot.scala 255:10]
  assign io_uop_frs3_en = slot_uop_frs3_en; // @[issue-slot.scala 255:10]
  assign io_uop_fp_val = slot_uop_fp_val; // @[issue-slot.scala 255:10]
  assign io_uop_fp_single = slot_uop_fp_single; // @[issue-slot.scala 255:10]
  assign io_uop_xcpt_pf_if = slot_uop_xcpt_pf_if; // @[issue-slot.scala 255:10]
  assign io_uop_xcpt_ae_if = slot_uop_xcpt_ae_if; // @[issue-slot.scala 255:10]
  assign io_uop_xcpt_ma_if = slot_uop_xcpt_ma_if; // @[issue-slot.scala 255:10]
  assign io_uop_bp_debug_if = slot_uop_bp_debug_if; // @[issue-slot.scala 255:10]
  assign io_uop_bp_xcpt_if = slot_uop_bp_xcpt_if; // @[issue-slot.scala 255:10]
  assign io_uop_debug_fsrc = slot_uop_debug_fsrc; // @[issue-slot.scala 255:10]
  assign io_uop_debug_tsrc = slot_uop_debug_tsrc; // @[issue-slot.scala 255:10]
  assign io_debug_p1 = p1; // @[issue-slot.scala 290:15]
  assign io_debug_p2 = p2; // @[issue-slot.scala 291:15]
  assign io_debug_p3 = p3; // @[issue-slot.scala 292:15]
  assign io_debug_ppred = ppred; // @[issue-slot.scala 293:18]
  assign io_debug_state = state; // @[issue-slot.scala 294:18]
  always @(posedge clock) begin
    if (reset) begin // @[issue-slot.scala 86:22]
      state <= 2'h0; // @[issue-slot.scala 86:22]
    end else if (io_kill) begin // @[issue-slot.scala 110:18]
      state <= 2'h0; // @[issue-slot.scala 111:11]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 112:33]
      state <= io_in_uop_bits_iw_state; // @[issue-slot.scala 113:11]
    end else if (io_clear) begin // @[issue-slot.scala 114:26]
      state <= 2'h0; // @[issue-slot.scala 115:11]
    end else begin
      state <= next_state; // @[issue-slot.scala 117:11]
    end
    if (reset) begin // @[issue-slot.scala 87:22]
      p1 <= 1'h0; // @[issue-slot.scala 87:22]
    end else begin
      p1 <= _GEN_115;
    end
    if (reset) begin // @[issue-slot.scala 88:22]
      p2 <= 1'h0; // @[issue-slot.scala 88:22]
    end else begin
      p2 <= _GEN_117;
    end
    if (reset) begin // @[issue-slot.scala 89:22]
      p3 <= 1'h0; // @[issue-slot.scala 89:22]
    end else begin
      p3 <= _GEN_113;
    end
    if (reset) begin // @[issue-slot.scala 90:22]
      ppred <= 1'h0; // @[issue-slot.scala 90:22]
    end else begin
      ppred <= _GEN_114;
    end
    if (reset) begin // @[issue-slot.scala 95:28]
      p1_poisoned <= 1'h0; // @[issue-slot.scala 95:28]
    end else begin
      p1_poisoned <= _T_59;
    end
    if (reset) begin // @[issue-slot.scala 96:28]
      p2_poisoned <= 1'h0; // @[issue-slot.scala 96:28]
    end else begin
      p2_poisoned <= _T_67;
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_uopc <= 7'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_uopc <= io_in_uop_bits_uopc; // @[issue-slot.scala 155:14]
    end else if (!(io_kill)) begin // @[issue-slot.scala 131:18]
      if (!(_T_7)) begin // @[issue-slot.scala 134:63]
        slot_uop_uopc <= _GEN_12;
      end
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_inst <= io_in_uop_bits_inst; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_debug_inst <= io_in_uop_bits_debug_inst; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_is_rvc <= io_in_uop_bits_is_rvc; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_debug_pc <= io_in_uop_bits_debug_pc; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_iq_type <= io_in_uop_bits_iq_type; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_fu_code <= io_in_uop_bits_fu_code; // @[issue-slot.scala 155:14]
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_ctrl_br_type <= 4'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_ctrl_br_type <= io_in_uop_bits_ctrl_br_type;
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_ctrl_op1_sel <= 2'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_ctrl_op1_sel <= io_in_uop_bits_ctrl_op1_sel;
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_ctrl_op2_sel <= 3'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_ctrl_op2_sel <= io_in_uop_bits_ctrl_op2_sel;
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_ctrl_imm_sel <= 3'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_ctrl_imm_sel <= io_in_uop_bits_ctrl_imm_sel;
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_ctrl_op_fcn <= 4'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_ctrl_op_fcn <= io_in_uop_bits_ctrl_op_fcn;
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_ctrl_fcn_dw <= 1'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_ctrl_fcn_dw <= io_in_uop_bits_ctrl_fcn_dw;
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_ctrl_csr_cmd <= 3'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_ctrl_csr_cmd <= io_in_uop_bits_ctrl_csr_cmd;
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_ctrl_is_load <= 1'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_ctrl_is_load <= io_in_uop_bits_ctrl_is_load;
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_ctrl_is_sta <= 1'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_ctrl_is_sta <= io_in_uop_bits_ctrl_is_sta;
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_ctrl_is_std <= 1'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_ctrl_is_std <= io_in_uop_bits_ctrl_is_std;
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_iw_state <= io_in_uop_bits_iw_state; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_is_br <= io_in_uop_bits_is_br; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_is_jalr <= io_in_uop_bits_is_jalr; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_is_jal <= io_in_uop_bits_is_jal; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_is_sfb <= io_in_uop_bits_is_sfb; // @[issue-slot.scala 155:14]
    end
    if (~io_in_uop_valid) begin // @[issue-slot.scala 235:27]
      slot_uop_br_mask <= next_br_mask; // @[issue-slot.scala 236:22]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_br_mask <= io_in_uop_bits_br_mask;
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_br_tag <= io_in_uop_bits_br_tag; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_ftq_idx <= io_in_uop_bits_ftq_idx; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_edge_inst <= io_in_uop_bits_edge_inst; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_pc_lob <= io_in_uop_bits_pc_lob; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_taken <= io_in_uop_bits_taken; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_imm_packed <= io_in_uop_bits_imm_packed; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_csr_addr <= io_in_uop_bits_csr_addr; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_rob_idx <= io_in_uop_bits_rob_idx; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_ldq_idx <= io_in_uop_bits_ldq_idx; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_stq_idx <= io_in_uop_bits_stq_idx; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_rxq_idx <= io_in_uop_bits_rxq_idx; // @[issue-slot.scala 155:14]
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_pdst <= 6'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_pdst <= io_in_uop_bits_pdst;
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_prs1 <= io_in_uop_bits_prs1; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_prs2 <= io_in_uop_bits_prs2; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_prs3 <= io_in_uop_bits_prs3; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_ppred <= io_in_uop_bits_ppred; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_prs1_busy <= io_in_uop_bits_prs1_busy; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_prs2_busy <= io_in_uop_bits_prs2_busy; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_prs3_busy <= io_in_uop_bits_prs3_busy; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_ppred_busy <= io_in_uop_bits_ppred_busy; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_stale_pdst <= io_in_uop_bits_stale_pdst; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_exception <= io_in_uop_bits_exception; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_exc_cause <= io_in_uop_bits_exc_cause; // @[issue-slot.scala 155:14]
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_bypassable <= 1'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_bypassable <= io_in_uop_bits_bypassable;
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_mem_cmd <= io_in_uop_bits_mem_cmd; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_mem_size <= io_in_uop_bits_mem_size; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_mem_signed <= io_in_uop_bits_mem_signed; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_is_fence <= io_in_uop_bits_is_fence; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_is_fencei <= io_in_uop_bits_is_fencei; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_is_amo <= io_in_uop_bits_is_amo; // @[issue-slot.scala 155:14]
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_uses_ldq <= 1'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_uses_ldq <= io_in_uop_bits_uses_ldq;
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_uses_stq <= 1'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_uses_stq <= io_in_uop_bits_uses_stq;
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_is_sys_pc2epc <= io_in_uop_bits_is_sys_pc2epc; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_is_unique <= io_in_uop_bits_is_unique; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_flush_on_commit <= io_in_uop_bits_flush_on_commit; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_ldst_is_rs1 <= io_in_uop_bits_ldst_is_rs1; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_ldst <= io_in_uop_bits_ldst; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_lrs1 <= io_in_uop_bits_lrs1; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_lrs2 <= io_in_uop_bits_lrs2; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_lrs3 <= io_in_uop_bits_lrs3; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_ldst_val <= io_in_uop_bits_ldst_val; // @[issue-slot.scala 155:14]
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_dst_rtype <= 2'h2; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_dst_rtype <= io_in_uop_bits_dst_rtype;
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_lrs1_rtype <= io_in_uop_bits_lrs1_rtype; // @[issue-slot.scala 155:14]
    end else if (!(io_kill)) begin // @[issue-slot.scala 131:18]
      if (!(_T_7)) begin // @[issue-slot.scala 134:63]
        if (_T_3) begin // @[issue-slot.scala 139:51]
          slot_uop_lrs1_rtype <= _GEN_9;
        end
      end
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_lrs2_rtype <= io_in_uop_bits_lrs2_rtype; // @[issue-slot.scala 155:14]
    end else if (!(io_kill)) begin // @[issue-slot.scala 131:18]
      if (!(_T_7)) begin // @[issue-slot.scala 134:63]
        if (_T_3) begin // @[issue-slot.scala 139:51]
          slot_uop_lrs2_rtype <= _GEN_10;
        end
      end
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_frs3_en <= io_in_uop_bits_frs3_en; // @[issue-slot.scala 155:14]
    end
    if (reset) begin // @[issue-slot.scala 102:25]
      slot_uop_fp_val <= 1'h0; // @[issue-slot.scala 102:25]
    end else if (io_in_uop_valid) begin // @[issue-slot.scala 103:21]
      slot_uop_fp_val <= io_in_uop_bits_fp_val;
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_fp_single <= io_in_uop_bits_fp_single; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_xcpt_pf_if <= io_in_uop_bits_xcpt_pf_if; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_xcpt_ae_if <= io_in_uop_bits_xcpt_ae_if; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_xcpt_ma_if <= io_in_uop_bits_xcpt_ma_if; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_bp_debug_if <= io_in_uop_bits_bp_debug_if; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_bp_xcpt_if <= io_in_uop_bits_bp_xcpt_if; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_debug_fsrc <= io_in_uop_bits_debug_fsrc; // @[issue-slot.scala 155:14]
    end
    if (io_in_uop_valid) begin // @[issue-slot.scala 154:26]
      slot_uop_debug_tsrc <= io_in_uop_bits_debug_tsrc; // @[issue-slot.scala 155:14]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_uop_valid & ~(_T_16 | io_clear | io_kill | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: trying to overwrite a valid issue slot.\n    at issue-slot.scala:156 assert (is_invalid || io.clear || io.kill, \"trying to overwrite a valid issue slot.\")\n"
            ); // @[issue-slot.scala 156:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_uop_valid & ~(_T_16 | io_clear | io_kill | reset)) begin
          $fatal; // @[issue-slot.scala 156:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_26 & ~(next_uop_prs1 != 6'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Poison bit can't be set for prs1=x0!\n    at issue-slot.scala:176 assert(next_uop.prs1 =/= 0.U, \"Poison bit can't be set for prs1=x0!\")\n"
            ); // @[issue-slot.scala 176:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_26 & ~(next_uop_prs1 != 6'h0 | reset)) begin
          $fatal; // @[issue-slot.scala 176:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_31 & ~(next_uop_prs2 != 6'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Poison bit can't be set for prs2=x0!\n    at issue-slot.scala:180 assert(next_uop.prs2 =/= 0.U, \"Poison bit can't be set for prs2=x0!\")\n"
            ); // @[issue-slot.scala 180:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_31 & ~(next_uop_prs2 != 6'h0 | reset)) begin
          $fatal; // @[issue-slot.scala 180:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(io_spec_ld_wakeup_0_valid & io_spec_ld_wakeup_0_bits == 6'h0) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Loads to x0 should never speculatively wakeup other instructions\n    at issue-slot.scala:203 assert (!(io.spec_ld_wakeup(w).valid && io.spec_ld_wakeup(w).bits === 0.U),\n"
            ); // @[issue-slot.scala 203:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_spec_ld_wakeup_0_valid & io_spec_ld_wakeup_0_bits == 6'h0) | reset)) begin
          $fatal; // @[issue-slot.scala 203:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_59 & ~(~next_p1_poisoned | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at issue-slot.scala:214 assert (!next_p1_poisoned)\n"); // @[issue-slot.scala 214:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_59 & ~(~next_p1_poisoned | reset)) begin
          $fatal; // @[issue-slot.scala 214:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_67 & ~(~next_p2_poisoned | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at issue-slot.scala:221 assert (!next_p2_poisoned)\n"); // @[issue-slot.scala 221:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_67 & ~(~next_p2_poisoned | reset)) begin
          $fatal; // @[issue-slot.scala 221:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
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
  state = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  p1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  p2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  p3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ppred = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  p1_poisoned = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  p2_poisoned = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  slot_uop_uopc = _RAND_7[6:0];
  _RAND_8 = {1{`RANDOM}};
  slot_uop_inst = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  slot_uop_debug_inst = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  slot_uop_is_rvc = _RAND_10[0:0];
  _RAND_11 = {2{`RANDOM}};
  slot_uop_debug_pc = _RAND_11[39:0];
  _RAND_12 = {1{`RANDOM}};
  slot_uop_iq_type = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  slot_uop_fu_code = _RAND_13[9:0];
  _RAND_14 = {1{`RANDOM}};
  slot_uop_ctrl_br_type = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  slot_uop_ctrl_op1_sel = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  slot_uop_ctrl_op2_sel = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  slot_uop_ctrl_imm_sel = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  slot_uop_ctrl_op_fcn = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  slot_uop_ctrl_fcn_dw = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  slot_uop_ctrl_csr_cmd = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  slot_uop_ctrl_is_load = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  slot_uop_ctrl_is_sta = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  slot_uop_ctrl_is_std = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  slot_uop_iw_state = _RAND_24[1:0];
  _RAND_25 = {1{`RANDOM}};
  slot_uop_is_br = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  slot_uop_is_jalr = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  slot_uop_is_jal = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  slot_uop_is_sfb = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  slot_uop_br_mask = _RAND_29[11:0];
  _RAND_30 = {1{`RANDOM}};
  slot_uop_br_tag = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  slot_uop_ftq_idx = _RAND_31[4:0];
  _RAND_32 = {1{`RANDOM}};
  slot_uop_edge_inst = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  slot_uop_pc_lob = _RAND_33[5:0];
  _RAND_34 = {1{`RANDOM}};
  slot_uop_taken = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  slot_uop_imm_packed = _RAND_35[19:0];
  _RAND_36 = {1{`RANDOM}};
  slot_uop_csr_addr = _RAND_36[11:0];
  _RAND_37 = {1{`RANDOM}};
  slot_uop_rob_idx = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  slot_uop_ldq_idx = _RAND_38[3:0];
  _RAND_39 = {1{`RANDOM}};
  slot_uop_stq_idx = _RAND_39[3:0];
  _RAND_40 = {1{`RANDOM}};
  slot_uop_rxq_idx = _RAND_40[1:0];
  _RAND_41 = {1{`RANDOM}};
  slot_uop_pdst = _RAND_41[5:0];
  _RAND_42 = {1{`RANDOM}};
  slot_uop_prs1 = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  slot_uop_prs2 = _RAND_43[5:0];
  _RAND_44 = {1{`RANDOM}};
  slot_uop_prs3 = _RAND_44[5:0];
  _RAND_45 = {1{`RANDOM}};
  slot_uop_ppred = _RAND_45[4:0];
  _RAND_46 = {1{`RANDOM}};
  slot_uop_prs1_busy = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  slot_uop_prs2_busy = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  slot_uop_prs3_busy = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  slot_uop_ppred_busy = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  slot_uop_stale_pdst = _RAND_50[5:0];
  _RAND_51 = {1{`RANDOM}};
  slot_uop_exception = _RAND_51[0:0];
  _RAND_52 = {2{`RANDOM}};
  slot_uop_exc_cause = _RAND_52[63:0];
  _RAND_53 = {1{`RANDOM}};
  slot_uop_bypassable = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  slot_uop_mem_cmd = _RAND_54[4:0];
  _RAND_55 = {1{`RANDOM}};
  slot_uop_mem_size = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  slot_uop_mem_signed = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  slot_uop_is_fence = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  slot_uop_is_fencei = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  slot_uop_is_amo = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  slot_uop_uses_ldq = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  slot_uop_uses_stq = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  slot_uop_is_sys_pc2epc = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  slot_uop_is_unique = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  slot_uop_flush_on_commit = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  slot_uop_ldst_is_rs1 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  slot_uop_ldst = _RAND_66[5:0];
  _RAND_67 = {1{`RANDOM}};
  slot_uop_lrs1 = _RAND_67[5:0];
  _RAND_68 = {1{`RANDOM}};
  slot_uop_lrs2 = _RAND_68[5:0];
  _RAND_69 = {1{`RANDOM}};
  slot_uop_lrs3 = _RAND_69[5:0];
  _RAND_70 = {1{`RANDOM}};
  slot_uop_ldst_val = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  slot_uop_dst_rtype = _RAND_71[1:0];
  _RAND_72 = {1{`RANDOM}};
  slot_uop_lrs1_rtype = _RAND_72[1:0];
  _RAND_73 = {1{`RANDOM}};
  slot_uop_lrs2_rtype = _RAND_73[1:0];
  _RAND_74 = {1{`RANDOM}};
  slot_uop_frs3_en = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  slot_uop_fp_val = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  slot_uop_fp_single = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  slot_uop_xcpt_pf_if = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  slot_uop_xcpt_ae_if = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  slot_uop_xcpt_ma_if = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  slot_uop_bp_debug_if = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  slot_uop_bp_xcpt_if = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  slot_uop_debug_fsrc = _RAND_82[1:0];
  _RAND_83 = {1{`RANDOM}};
  slot_uop_debug_tsrc = _RAND_83[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
