module PredRenameStage(
  input         clock,
  input         reset,
  output        io_ren_stalls_0,
  output        io_ren_stalls_1,
  input         io_kill,
  input         io_flush_table,
  input         io_dec_fire_0,
  input         io_dec_fire_1,
  input  [6:0]  io_dec_uops_0_uopc,
  input  [31:0] io_dec_uops_0_inst,
  input  [31:0] io_dec_uops_0_debug_inst,
  input         io_dec_uops_0_is_rvc,
  input  [39:0] io_dec_uops_0_debug_pc,
  input  [2:0]  io_dec_uops_0_iq_type,
  input  [9:0]  io_dec_uops_0_fu_code,
  input  [3:0]  io_dec_uops_0_ctrl_br_type,
  input  [1:0]  io_dec_uops_0_ctrl_op1_sel,
  input  [2:0]  io_dec_uops_0_ctrl_op2_sel,
  input  [2:0]  io_dec_uops_0_ctrl_imm_sel,
  input  [3:0]  io_dec_uops_0_ctrl_op_fcn,
  input         io_dec_uops_0_ctrl_fcn_dw,
  input  [2:0]  io_dec_uops_0_ctrl_csr_cmd,
  input         io_dec_uops_0_ctrl_is_load,
  input         io_dec_uops_0_ctrl_is_sta,
  input         io_dec_uops_0_ctrl_is_std,
  input  [1:0]  io_dec_uops_0_iw_state,
  input         io_dec_uops_0_iw_p1_poisoned,
  input         io_dec_uops_0_iw_p2_poisoned,
  input         io_dec_uops_0_is_br,
  input         io_dec_uops_0_is_jalr,
  input         io_dec_uops_0_is_jal,
  input         io_dec_uops_0_is_sfb,
  input  [11:0] io_dec_uops_0_br_mask,
  input  [3:0]  io_dec_uops_0_br_tag,
  input  [4:0]  io_dec_uops_0_ftq_idx,
  input         io_dec_uops_0_edge_inst,
  input  [5:0]  io_dec_uops_0_pc_lob,
  input         io_dec_uops_0_taken,
  input  [19:0] io_dec_uops_0_imm_packed,
  input  [11:0] io_dec_uops_0_csr_addr,
  input  [5:0]  io_dec_uops_0_rob_idx,
  input  [3:0]  io_dec_uops_0_ldq_idx,
  input  [3:0]  io_dec_uops_0_stq_idx,
  input  [1:0]  io_dec_uops_0_rxq_idx,
  input  [5:0]  io_dec_uops_0_pdst,
  input  [5:0]  io_dec_uops_0_prs1,
  input  [5:0]  io_dec_uops_0_prs2,
  input  [5:0]  io_dec_uops_0_prs3,
  input  [4:0]  io_dec_uops_0_ppred,
  input         io_dec_uops_0_prs1_busy,
  input         io_dec_uops_0_prs2_busy,
  input         io_dec_uops_0_prs3_busy,
  input         io_dec_uops_0_ppred_busy,
  input  [5:0]  io_dec_uops_0_stale_pdst,
  input         io_dec_uops_0_exception,
  input  [63:0] io_dec_uops_0_exc_cause,
  input         io_dec_uops_0_bypassable,
  input  [4:0]  io_dec_uops_0_mem_cmd,
  input  [1:0]  io_dec_uops_0_mem_size,
  input         io_dec_uops_0_mem_signed,
  input         io_dec_uops_0_is_fence,
  input         io_dec_uops_0_is_fencei,
  input         io_dec_uops_0_is_amo,
  input         io_dec_uops_0_uses_ldq,
  input         io_dec_uops_0_uses_stq,
  input         io_dec_uops_0_is_sys_pc2epc,
  input         io_dec_uops_0_is_unique,
  input         io_dec_uops_0_flush_on_commit,
  input         io_dec_uops_0_ldst_is_rs1,
  input  [5:0]  io_dec_uops_0_ldst,
  input  [5:0]  io_dec_uops_0_lrs1,
  input  [5:0]  io_dec_uops_0_lrs2,
  input  [5:0]  io_dec_uops_0_lrs3,
  input         io_dec_uops_0_ldst_val,
  input  [1:0]  io_dec_uops_0_dst_rtype,
  input  [1:0]  io_dec_uops_0_lrs1_rtype,
  input  [1:0]  io_dec_uops_0_lrs2_rtype,
  input         io_dec_uops_0_frs3_en,
  input         io_dec_uops_0_fp_val,
  input         io_dec_uops_0_fp_single,
  input         io_dec_uops_0_xcpt_pf_if,
  input         io_dec_uops_0_xcpt_ae_if,
  input         io_dec_uops_0_xcpt_ma_if,
  input         io_dec_uops_0_bp_debug_if,
  input         io_dec_uops_0_bp_xcpt_if,
  input  [1:0]  io_dec_uops_0_debug_fsrc,
  input  [1:0]  io_dec_uops_0_debug_tsrc,
  input  [6:0]  io_dec_uops_1_uopc,
  input  [31:0] io_dec_uops_1_inst,
  input  [31:0] io_dec_uops_1_debug_inst,
  input         io_dec_uops_1_is_rvc,
  input  [39:0] io_dec_uops_1_debug_pc,
  input  [2:0]  io_dec_uops_1_iq_type,
  input  [9:0]  io_dec_uops_1_fu_code,
  input  [3:0]  io_dec_uops_1_ctrl_br_type,
  input  [1:0]  io_dec_uops_1_ctrl_op1_sel,
  input  [2:0]  io_dec_uops_1_ctrl_op2_sel,
  input  [2:0]  io_dec_uops_1_ctrl_imm_sel,
  input  [3:0]  io_dec_uops_1_ctrl_op_fcn,
  input         io_dec_uops_1_ctrl_fcn_dw,
  input  [2:0]  io_dec_uops_1_ctrl_csr_cmd,
  input         io_dec_uops_1_ctrl_is_load,
  input         io_dec_uops_1_ctrl_is_sta,
  input         io_dec_uops_1_ctrl_is_std,
  input  [1:0]  io_dec_uops_1_iw_state,
  input         io_dec_uops_1_iw_p1_poisoned,
  input         io_dec_uops_1_iw_p2_poisoned,
  input         io_dec_uops_1_is_br,
  input         io_dec_uops_1_is_jalr,
  input         io_dec_uops_1_is_jal,
  input         io_dec_uops_1_is_sfb,
  input  [11:0] io_dec_uops_1_br_mask,
  input  [3:0]  io_dec_uops_1_br_tag,
  input  [4:0]  io_dec_uops_1_ftq_idx,
  input         io_dec_uops_1_edge_inst,
  input  [5:0]  io_dec_uops_1_pc_lob,
  input         io_dec_uops_1_taken,
  input  [19:0] io_dec_uops_1_imm_packed,
  input  [11:0] io_dec_uops_1_csr_addr,
  input  [5:0]  io_dec_uops_1_rob_idx,
  input  [3:0]  io_dec_uops_1_ldq_idx,
  input  [3:0]  io_dec_uops_1_stq_idx,
  input  [1:0]  io_dec_uops_1_rxq_idx,
  input  [5:0]  io_dec_uops_1_pdst,
  input  [5:0]  io_dec_uops_1_prs1,
  input  [5:0]  io_dec_uops_1_prs2,
  input  [5:0]  io_dec_uops_1_prs3,
  input  [4:0]  io_dec_uops_1_ppred,
  input         io_dec_uops_1_prs1_busy,
  input         io_dec_uops_1_prs2_busy,
  input         io_dec_uops_1_prs3_busy,
  input         io_dec_uops_1_ppred_busy,
  input  [5:0]  io_dec_uops_1_stale_pdst,
  input         io_dec_uops_1_exception,
  input  [63:0] io_dec_uops_1_exc_cause,
  input         io_dec_uops_1_bypassable,
  input  [4:0]  io_dec_uops_1_mem_cmd,
  input  [1:0]  io_dec_uops_1_mem_size,
  input         io_dec_uops_1_mem_signed,
  input         io_dec_uops_1_is_fence,
  input         io_dec_uops_1_is_fencei,
  input         io_dec_uops_1_is_amo,
  input         io_dec_uops_1_uses_ldq,
  input         io_dec_uops_1_uses_stq,
  input         io_dec_uops_1_is_sys_pc2epc,
  input         io_dec_uops_1_is_unique,
  input         io_dec_uops_1_flush_on_commit,
  input         io_dec_uops_1_ldst_is_rs1,
  input  [5:0]  io_dec_uops_1_ldst,
  input  [5:0]  io_dec_uops_1_lrs1,
  input  [5:0]  io_dec_uops_1_lrs2,
  input  [5:0]  io_dec_uops_1_lrs3,
  input         io_dec_uops_1_ldst_val,
  input  [1:0]  io_dec_uops_1_dst_rtype,
  input  [1:0]  io_dec_uops_1_lrs1_rtype,
  input  [1:0]  io_dec_uops_1_lrs2_rtype,
  input         io_dec_uops_1_frs3_en,
  input         io_dec_uops_1_fp_val,
  input         io_dec_uops_1_fp_single,
  input         io_dec_uops_1_xcpt_pf_if,
  input         io_dec_uops_1_xcpt_ae_if,
  input         io_dec_uops_1_xcpt_ma_if,
  input         io_dec_uops_1_bp_debug_if,
  input         io_dec_uops_1_bp_xcpt_if,
  input  [1:0]  io_dec_uops_1_debug_fsrc,
  input  [1:0]  io_dec_uops_1_debug_tsrc,
  output        io_ren2_mask_0,
  output        io_ren2_mask_1,
  output [6:0]  io_ren2_uops_0_uopc,
  output [31:0] io_ren2_uops_0_inst,
  output [31:0] io_ren2_uops_0_debug_inst,
  output        io_ren2_uops_0_is_rvc,
  output [39:0] io_ren2_uops_0_debug_pc,
  output [2:0]  io_ren2_uops_0_iq_type,
  output [9:0]  io_ren2_uops_0_fu_code,
  output [3:0]  io_ren2_uops_0_ctrl_br_type,
  output [1:0]  io_ren2_uops_0_ctrl_op1_sel,
  output [2:0]  io_ren2_uops_0_ctrl_op2_sel,
  output [2:0]  io_ren2_uops_0_ctrl_imm_sel,
  output [3:0]  io_ren2_uops_0_ctrl_op_fcn,
  output        io_ren2_uops_0_ctrl_fcn_dw,
  output [2:0]  io_ren2_uops_0_ctrl_csr_cmd,
  output        io_ren2_uops_0_ctrl_is_load,
  output        io_ren2_uops_0_ctrl_is_sta,
  output        io_ren2_uops_0_ctrl_is_std,
  output [1:0]  io_ren2_uops_0_iw_state,
  output        io_ren2_uops_0_iw_p1_poisoned,
  output        io_ren2_uops_0_iw_p2_poisoned,
  output        io_ren2_uops_0_is_br,
  output        io_ren2_uops_0_is_jalr,
  output        io_ren2_uops_0_is_jal,
  output        io_ren2_uops_0_is_sfb,
  output [11:0] io_ren2_uops_0_br_mask,
  output [3:0]  io_ren2_uops_0_br_tag,
  output [4:0]  io_ren2_uops_0_ftq_idx,
  output        io_ren2_uops_0_edge_inst,
  output [5:0]  io_ren2_uops_0_pc_lob,
  output        io_ren2_uops_0_taken,
  output [19:0] io_ren2_uops_0_imm_packed,
  output [11:0] io_ren2_uops_0_csr_addr,
  output [5:0]  io_ren2_uops_0_rob_idx,
  output [3:0]  io_ren2_uops_0_ldq_idx,
  output [3:0]  io_ren2_uops_0_stq_idx,
  output [1:0]  io_ren2_uops_0_rxq_idx,
  output [5:0]  io_ren2_uops_0_pdst,
  output [5:0]  io_ren2_uops_0_prs1,
  output [5:0]  io_ren2_uops_0_prs2,
  output [5:0]  io_ren2_uops_0_prs3,
  output [4:0]  io_ren2_uops_0_ppred,
  output        io_ren2_uops_0_prs1_busy,
  output        io_ren2_uops_0_prs2_busy,
  output        io_ren2_uops_0_prs3_busy,
  output        io_ren2_uops_0_ppred_busy,
  output [5:0]  io_ren2_uops_0_stale_pdst,
  output        io_ren2_uops_0_exception,
  output [63:0] io_ren2_uops_0_exc_cause,
  output        io_ren2_uops_0_bypassable,
  output [4:0]  io_ren2_uops_0_mem_cmd,
  output [1:0]  io_ren2_uops_0_mem_size,
  output        io_ren2_uops_0_mem_signed,
  output        io_ren2_uops_0_is_fence,
  output        io_ren2_uops_0_is_fencei,
  output        io_ren2_uops_0_is_amo,
  output        io_ren2_uops_0_uses_ldq,
  output        io_ren2_uops_0_uses_stq,
  output        io_ren2_uops_0_is_sys_pc2epc,
  output        io_ren2_uops_0_is_unique,
  output        io_ren2_uops_0_flush_on_commit,
  output        io_ren2_uops_0_ldst_is_rs1,
  output [5:0]  io_ren2_uops_0_ldst,
  output [5:0]  io_ren2_uops_0_lrs1,
  output [5:0]  io_ren2_uops_0_lrs2,
  output [5:0]  io_ren2_uops_0_lrs3,
  output        io_ren2_uops_0_ldst_val,
  output [1:0]  io_ren2_uops_0_dst_rtype,
  output [1:0]  io_ren2_uops_0_lrs1_rtype,
  output [1:0]  io_ren2_uops_0_lrs2_rtype,
  output        io_ren2_uops_0_frs3_en,
  output        io_ren2_uops_0_fp_val,
  output        io_ren2_uops_0_fp_single,
  output        io_ren2_uops_0_xcpt_pf_if,
  output        io_ren2_uops_0_xcpt_ae_if,
  output        io_ren2_uops_0_xcpt_ma_if,
  output        io_ren2_uops_0_bp_debug_if,
  output        io_ren2_uops_0_bp_xcpt_if,
  output [1:0]  io_ren2_uops_0_debug_fsrc,
  output [1:0]  io_ren2_uops_0_debug_tsrc,
  output [6:0]  io_ren2_uops_1_uopc,
  output [31:0] io_ren2_uops_1_inst,
  output [31:0] io_ren2_uops_1_debug_inst,
  output        io_ren2_uops_1_is_rvc,
  output [39:0] io_ren2_uops_1_debug_pc,
  output [2:0]  io_ren2_uops_1_iq_type,
  output [9:0]  io_ren2_uops_1_fu_code,
  output [3:0]  io_ren2_uops_1_ctrl_br_type,
  output [1:0]  io_ren2_uops_1_ctrl_op1_sel,
  output [2:0]  io_ren2_uops_1_ctrl_op2_sel,
  output [2:0]  io_ren2_uops_1_ctrl_imm_sel,
  output [3:0]  io_ren2_uops_1_ctrl_op_fcn,
  output        io_ren2_uops_1_ctrl_fcn_dw,
  output [2:0]  io_ren2_uops_1_ctrl_csr_cmd,
  output        io_ren2_uops_1_ctrl_is_load,
  output        io_ren2_uops_1_ctrl_is_sta,
  output        io_ren2_uops_1_ctrl_is_std,
  output [1:0]  io_ren2_uops_1_iw_state,
  output        io_ren2_uops_1_iw_p1_poisoned,
  output        io_ren2_uops_1_iw_p2_poisoned,
  output        io_ren2_uops_1_is_br,
  output        io_ren2_uops_1_is_jalr,
  output        io_ren2_uops_1_is_jal,
  output        io_ren2_uops_1_is_sfb,
  output [11:0] io_ren2_uops_1_br_mask,
  output [3:0]  io_ren2_uops_1_br_tag,
  output [4:0]  io_ren2_uops_1_ftq_idx,
  output        io_ren2_uops_1_edge_inst,
  output [5:0]  io_ren2_uops_1_pc_lob,
  output        io_ren2_uops_1_taken,
  output [19:0] io_ren2_uops_1_imm_packed,
  output [11:0] io_ren2_uops_1_csr_addr,
  output [5:0]  io_ren2_uops_1_rob_idx,
  output [3:0]  io_ren2_uops_1_ldq_idx,
  output [3:0]  io_ren2_uops_1_stq_idx,
  output [1:0]  io_ren2_uops_1_rxq_idx,
  output [5:0]  io_ren2_uops_1_pdst,
  output [5:0]  io_ren2_uops_1_prs1,
  output [5:0]  io_ren2_uops_1_prs2,
  output [5:0]  io_ren2_uops_1_prs3,
  output [4:0]  io_ren2_uops_1_ppred,
  output        io_ren2_uops_1_prs1_busy,
  output        io_ren2_uops_1_prs2_busy,
  output        io_ren2_uops_1_prs3_busy,
  output        io_ren2_uops_1_ppred_busy,
  output [5:0]  io_ren2_uops_1_stale_pdst,
  output        io_ren2_uops_1_exception,
  output [63:0] io_ren2_uops_1_exc_cause,
  output        io_ren2_uops_1_bypassable,
  output [4:0]  io_ren2_uops_1_mem_cmd,
  output [1:0]  io_ren2_uops_1_mem_size,
  output        io_ren2_uops_1_mem_signed,
  output        io_ren2_uops_1_is_fence,
  output        io_ren2_uops_1_is_fencei,
  output        io_ren2_uops_1_is_amo,
  output        io_ren2_uops_1_uses_ldq,
  output        io_ren2_uops_1_uses_stq,
  output        io_ren2_uops_1_is_sys_pc2epc,
  output        io_ren2_uops_1_is_unique,
  output        io_ren2_uops_1_flush_on_commit,
  output        io_ren2_uops_1_ldst_is_rs1,
  output [5:0]  io_ren2_uops_1_ldst,
  output [5:0]  io_ren2_uops_1_lrs1,
  output [5:0]  io_ren2_uops_1_lrs2,
  output [5:0]  io_ren2_uops_1_lrs3,
  output        io_ren2_uops_1_ldst_val,
  output [1:0]  io_ren2_uops_1_dst_rtype,
  output [1:0]  io_ren2_uops_1_lrs1_rtype,
  output [1:0]  io_ren2_uops_1_lrs2_rtype,
  output        io_ren2_uops_1_frs3_en,
  output        io_ren2_uops_1_fp_val,
  output        io_ren2_uops_1_fp_single,
  output        io_ren2_uops_1_xcpt_pf_if,
  output        io_ren2_uops_1_xcpt_ae_if,
  output        io_ren2_uops_1_xcpt_ma_if,
  output        io_ren2_uops_1_bp_debug_if,
  output        io_ren2_uops_1_bp_xcpt_if,
  output [1:0]  io_ren2_uops_1_debug_fsrc,
  output [1:0]  io_ren2_uops_1_debug_tsrc,
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
  input         io_dis_fire_0,
  input         io_dis_fire_1,
  input         io_dis_ready,
  input         io_wakeups_0_valid,
  input  [6:0]  io_wakeups_0_bits_uop_uopc,
  input  [31:0] io_wakeups_0_bits_uop_inst,
  input  [31:0] io_wakeups_0_bits_uop_debug_inst,
  input         io_wakeups_0_bits_uop_is_rvc,
  input  [39:0] io_wakeups_0_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_0_bits_uop_iq_type,
  input  [9:0]  io_wakeups_0_bits_uop_fu_code,
  input  [3:0]  io_wakeups_0_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_0_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_0_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_0_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_0_bits_uop_ctrl_op_fcn,
  input         io_wakeups_0_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_0_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_0_bits_uop_ctrl_is_load,
  input         io_wakeups_0_bits_uop_ctrl_is_sta,
  input         io_wakeups_0_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_0_bits_uop_iw_state,
  input         io_wakeups_0_bits_uop_iw_p1_poisoned,
  input         io_wakeups_0_bits_uop_iw_p2_poisoned,
  input         io_wakeups_0_bits_uop_is_br,
  input         io_wakeups_0_bits_uop_is_jalr,
  input         io_wakeups_0_bits_uop_is_jal,
  input         io_wakeups_0_bits_uop_is_sfb,
  input  [11:0] io_wakeups_0_bits_uop_br_mask,
  input  [3:0]  io_wakeups_0_bits_uop_br_tag,
  input  [4:0]  io_wakeups_0_bits_uop_ftq_idx,
  input         io_wakeups_0_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_0_bits_uop_pc_lob,
  input         io_wakeups_0_bits_uop_taken,
  input  [19:0] io_wakeups_0_bits_uop_imm_packed,
  input  [11:0] io_wakeups_0_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_0_bits_uop_rob_idx,
  input  [3:0]  io_wakeups_0_bits_uop_ldq_idx,
  input  [3:0]  io_wakeups_0_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_0_bits_uop_rxq_idx,
  input  [5:0]  io_wakeups_0_bits_uop_pdst,
  input  [5:0]  io_wakeups_0_bits_uop_prs1,
  input  [5:0]  io_wakeups_0_bits_uop_prs2,
  input  [5:0]  io_wakeups_0_bits_uop_prs3,
  input  [4:0]  io_wakeups_0_bits_uop_ppred,
  input         io_wakeups_0_bits_uop_prs1_busy,
  input         io_wakeups_0_bits_uop_prs2_busy,
  input         io_wakeups_0_bits_uop_prs3_busy,
  input         io_wakeups_0_bits_uop_ppred_busy,
  input  [5:0]  io_wakeups_0_bits_uop_stale_pdst,
  input         io_wakeups_0_bits_uop_exception,
  input  [63:0] io_wakeups_0_bits_uop_exc_cause,
  input         io_wakeups_0_bits_uop_bypassable,
  input  [4:0]  io_wakeups_0_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_0_bits_uop_mem_size,
  input         io_wakeups_0_bits_uop_mem_signed,
  input         io_wakeups_0_bits_uop_is_fence,
  input         io_wakeups_0_bits_uop_is_fencei,
  input         io_wakeups_0_bits_uop_is_amo,
  input         io_wakeups_0_bits_uop_uses_ldq,
  input         io_wakeups_0_bits_uop_uses_stq,
  input         io_wakeups_0_bits_uop_is_sys_pc2epc,
  input         io_wakeups_0_bits_uop_is_unique,
  input         io_wakeups_0_bits_uop_flush_on_commit,
  input         io_wakeups_0_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_0_bits_uop_ldst,
  input  [5:0]  io_wakeups_0_bits_uop_lrs1,
  input  [5:0]  io_wakeups_0_bits_uop_lrs2,
  input  [5:0]  io_wakeups_0_bits_uop_lrs3,
  input         io_wakeups_0_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_0_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_0_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_0_bits_uop_lrs2_rtype,
  input         io_wakeups_0_bits_uop_frs3_en,
  input         io_wakeups_0_bits_uop_fp_val,
  input         io_wakeups_0_bits_uop_fp_single,
  input         io_wakeups_0_bits_uop_xcpt_pf_if,
  input         io_wakeups_0_bits_uop_xcpt_ae_if,
  input         io_wakeups_0_bits_uop_xcpt_ma_if,
  input         io_wakeups_0_bits_uop_bp_debug_if,
  input         io_wakeups_0_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_0_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_0_bits_uop_debug_tsrc,
  input  [63:0] io_wakeups_0_bits_data,
  input         io_wakeups_0_bits_predicated,
  input         io_wakeups_0_bits_fflags_valid,
  input  [6:0]  io_wakeups_0_bits_fflags_bits_uop_uopc,
  input  [31:0] io_wakeups_0_bits_fflags_bits_uop_inst,
  input  [31:0] io_wakeups_0_bits_fflags_bits_uop_debug_inst,
  input         io_wakeups_0_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_wakeups_0_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_wakeups_0_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_wakeups_0_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_wakeups_0_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_wakeups_0_bits_fflags_bits_uop_ctrl_is_load,
  input         io_wakeups_0_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_wakeups_0_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_iw_state,
  input         io_wakeups_0_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_wakeups_0_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_wakeups_0_bits_fflags_bits_uop_is_br,
  input         io_wakeups_0_bits_fflags_bits_uop_is_jalr,
  input         io_wakeups_0_bits_fflags_bits_uop_is_jal,
  input         io_wakeups_0_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_wakeups_0_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_wakeups_0_bits_fflags_bits_uop_ftq_idx,
  input         io_wakeups_0_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_pc_lob,
  input         io_wakeups_0_bits_fflags_bits_uop_taken,
  input  [19:0] io_wakeups_0_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_wakeups_0_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_rob_idx,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_ldq_idx,
  input  [3:0]  io_wakeups_0_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_rxq_idx,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_pdst,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_prs1,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_prs2,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_wakeups_0_bits_fflags_bits_uop_ppred,
  input         io_wakeups_0_bits_fflags_bits_uop_prs1_busy,
  input         io_wakeups_0_bits_fflags_bits_uop_prs2_busy,
  input         io_wakeups_0_bits_fflags_bits_uop_prs3_busy,
  input         io_wakeups_0_bits_fflags_bits_uop_ppred_busy,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_stale_pdst,
  input         io_wakeups_0_bits_fflags_bits_uop_exception,
  input  [63:0] io_wakeups_0_bits_fflags_bits_uop_exc_cause,
  input         io_wakeups_0_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_wakeups_0_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_mem_size,
  input         io_wakeups_0_bits_fflags_bits_uop_mem_signed,
  input         io_wakeups_0_bits_fflags_bits_uop_is_fence,
  input         io_wakeups_0_bits_fflags_bits_uop_is_fencei,
  input         io_wakeups_0_bits_fflags_bits_uop_is_amo,
  input         io_wakeups_0_bits_fflags_bits_uop_uses_ldq,
  input         io_wakeups_0_bits_fflags_bits_uop_uses_stq,
  input         io_wakeups_0_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_wakeups_0_bits_fflags_bits_uop_is_unique,
  input         io_wakeups_0_bits_fflags_bits_uop_flush_on_commit,
  input         io_wakeups_0_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_wakeups_0_bits_fflags_bits_uop_lrs3,
  input         io_wakeups_0_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_lrs2_rtype,
  input         io_wakeups_0_bits_fflags_bits_uop_frs3_en,
  input         io_wakeups_0_bits_fflags_bits_uop_fp_val,
  input         io_wakeups_0_bits_fflags_bits_uop_fp_single,
  input         io_wakeups_0_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_wakeups_0_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_wakeups_0_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_wakeups_0_bits_fflags_bits_uop_bp_debug_if,
  input         io_wakeups_0_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_wakeups_0_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_wakeups_0_bits_fflags_bits_flags,
  input         io_com_valids_0,
  input         io_com_valids_1,
  input  [6:0]  io_com_uops_0_uopc,
  input  [31:0] io_com_uops_0_inst,
  input  [31:0] io_com_uops_0_debug_inst,
  input         io_com_uops_0_is_rvc,
  input  [39:0] io_com_uops_0_debug_pc,
  input  [2:0]  io_com_uops_0_iq_type,
  input  [9:0]  io_com_uops_0_fu_code,
  input  [3:0]  io_com_uops_0_ctrl_br_type,
  input  [1:0]  io_com_uops_0_ctrl_op1_sel,
  input  [2:0]  io_com_uops_0_ctrl_op2_sel,
  input  [2:0]  io_com_uops_0_ctrl_imm_sel,
  input  [3:0]  io_com_uops_0_ctrl_op_fcn,
  input         io_com_uops_0_ctrl_fcn_dw,
  input  [2:0]  io_com_uops_0_ctrl_csr_cmd,
  input         io_com_uops_0_ctrl_is_load,
  input         io_com_uops_0_ctrl_is_sta,
  input         io_com_uops_0_ctrl_is_std,
  input  [1:0]  io_com_uops_0_iw_state,
  input         io_com_uops_0_iw_p1_poisoned,
  input         io_com_uops_0_iw_p2_poisoned,
  input         io_com_uops_0_is_br,
  input         io_com_uops_0_is_jalr,
  input         io_com_uops_0_is_jal,
  input         io_com_uops_0_is_sfb,
  input  [11:0] io_com_uops_0_br_mask,
  input  [3:0]  io_com_uops_0_br_tag,
  input  [4:0]  io_com_uops_0_ftq_idx,
  input         io_com_uops_0_edge_inst,
  input  [5:0]  io_com_uops_0_pc_lob,
  input         io_com_uops_0_taken,
  input  [19:0] io_com_uops_0_imm_packed,
  input  [11:0] io_com_uops_0_csr_addr,
  input  [5:0]  io_com_uops_0_rob_idx,
  input  [3:0]  io_com_uops_0_ldq_idx,
  input  [3:0]  io_com_uops_0_stq_idx,
  input  [1:0]  io_com_uops_0_rxq_idx,
  input  [5:0]  io_com_uops_0_pdst,
  input  [5:0]  io_com_uops_0_prs1,
  input  [5:0]  io_com_uops_0_prs2,
  input  [5:0]  io_com_uops_0_prs3,
  input  [4:0]  io_com_uops_0_ppred,
  input         io_com_uops_0_prs1_busy,
  input         io_com_uops_0_prs2_busy,
  input         io_com_uops_0_prs3_busy,
  input         io_com_uops_0_ppred_busy,
  input  [5:0]  io_com_uops_0_stale_pdst,
  input         io_com_uops_0_exception,
  input  [63:0] io_com_uops_0_exc_cause,
  input         io_com_uops_0_bypassable,
  input  [4:0]  io_com_uops_0_mem_cmd,
  input  [1:0]  io_com_uops_0_mem_size,
  input         io_com_uops_0_mem_signed,
  input         io_com_uops_0_is_fence,
  input         io_com_uops_0_is_fencei,
  input         io_com_uops_0_is_amo,
  input         io_com_uops_0_uses_ldq,
  input         io_com_uops_0_uses_stq,
  input         io_com_uops_0_is_sys_pc2epc,
  input         io_com_uops_0_is_unique,
  input         io_com_uops_0_flush_on_commit,
  input         io_com_uops_0_ldst_is_rs1,
  input  [5:0]  io_com_uops_0_ldst,
  input  [5:0]  io_com_uops_0_lrs1,
  input  [5:0]  io_com_uops_0_lrs2,
  input  [5:0]  io_com_uops_0_lrs3,
  input         io_com_uops_0_ldst_val,
  input  [1:0]  io_com_uops_0_dst_rtype,
  input  [1:0]  io_com_uops_0_lrs1_rtype,
  input  [1:0]  io_com_uops_0_lrs2_rtype,
  input         io_com_uops_0_frs3_en,
  input         io_com_uops_0_fp_val,
  input         io_com_uops_0_fp_single,
  input         io_com_uops_0_xcpt_pf_if,
  input         io_com_uops_0_xcpt_ae_if,
  input         io_com_uops_0_xcpt_ma_if,
  input         io_com_uops_0_bp_debug_if,
  input         io_com_uops_0_bp_xcpt_if,
  input  [1:0]  io_com_uops_0_debug_fsrc,
  input  [1:0]  io_com_uops_0_debug_tsrc,
  input  [6:0]  io_com_uops_1_uopc,
  input  [31:0] io_com_uops_1_inst,
  input  [31:0] io_com_uops_1_debug_inst,
  input         io_com_uops_1_is_rvc,
  input  [39:0] io_com_uops_1_debug_pc,
  input  [2:0]  io_com_uops_1_iq_type,
  input  [9:0]  io_com_uops_1_fu_code,
  input  [3:0]  io_com_uops_1_ctrl_br_type,
  input  [1:0]  io_com_uops_1_ctrl_op1_sel,
  input  [2:0]  io_com_uops_1_ctrl_op2_sel,
  input  [2:0]  io_com_uops_1_ctrl_imm_sel,
  input  [3:0]  io_com_uops_1_ctrl_op_fcn,
  input         io_com_uops_1_ctrl_fcn_dw,
  input  [2:0]  io_com_uops_1_ctrl_csr_cmd,
  input         io_com_uops_1_ctrl_is_load,
  input         io_com_uops_1_ctrl_is_sta,
  input         io_com_uops_1_ctrl_is_std,
  input  [1:0]  io_com_uops_1_iw_state,
  input         io_com_uops_1_iw_p1_poisoned,
  input         io_com_uops_1_iw_p2_poisoned,
  input         io_com_uops_1_is_br,
  input         io_com_uops_1_is_jalr,
  input         io_com_uops_1_is_jal,
  input         io_com_uops_1_is_sfb,
  input  [11:0] io_com_uops_1_br_mask,
  input  [3:0]  io_com_uops_1_br_tag,
  input  [4:0]  io_com_uops_1_ftq_idx,
  input         io_com_uops_1_edge_inst,
  input  [5:0]  io_com_uops_1_pc_lob,
  input         io_com_uops_1_taken,
  input  [19:0] io_com_uops_1_imm_packed,
  input  [11:0] io_com_uops_1_csr_addr,
  input  [5:0]  io_com_uops_1_rob_idx,
  input  [3:0]  io_com_uops_1_ldq_idx,
  input  [3:0]  io_com_uops_1_stq_idx,
  input  [1:0]  io_com_uops_1_rxq_idx,
  input  [5:0]  io_com_uops_1_pdst,
  input  [5:0]  io_com_uops_1_prs1,
  input  [5:0]  io_com_uops_1_prs2,
  input  [5:0]  io_com_uops_1_prs3,
  input  [4:0]  io_com_uops_1_ppred,
  input         io_com_uops_1_prs1_busy,
  input         io_com_uops_1_prs2_busy,
  input         io_com_uops_1_prs3_busy,
  input         io_com_uops_1_ppred_busy,
  input  [5:0]  io_com_uops_1_stale_pdst,
  input         io_com_uops_1_exception,
  input  [63:0] io_com_uops_1_exc_cause,
  input         io_com_uops_1_bypassable,
  input  [4:0]  io_com_uops_1_mem_cmd,
  input  [1:0]  io_com_uops_1_mem_size,
  input         io_com_uops_1_mem_signed,
  input         io_com_uops_1_is_fence,
  input         io_com_uops_1_is_fencei,
  input         io_com_uops_1_is_amo,
  input         io_com_uops_1_uses_ldq,
  input         io_com_uops_1_uses_stq,
  input         io_com_uops_1_is_sys_pc2epc,
  input         io_com_uops_1_is_unique,
  input         io_com_uops_1_flush_on_commit,
  input         io_com_uops_1_ldst_is_rs1,
  input  [5:0]  io_com_uops_1_ldst,
  input  [5:0]  io_com_uops_1_lrs1,
  input  [5:0]  io_com_uops_1_lrs2,
  input  [5:0]  io_com_uops_1_lrs3,
  input         io_com_uops_1_ldst_val,
  input  [1:0]  io_com_uops_1_dst_rtype,
  input  [1:0]  io_com_uops_1_lrs1_rtype,
  input  [1:0]  io_com_uops_1_lrs2_rtype,
  input         io_com_uops_1_frs3_en,
  input         io_com_uops_1_fp_val,
  input         io_com_uops_1_fp_single,
  input         io_com_uops_1_xcpt_pf_if,
  input         io_com_uops_1_xcpt_ae_if,
  input         io_com_uops_1_xcpt_ma_if,
  input         io_com_uops_1_bp_debug_if,
  input         io_com_uops_1_bp_xcpt_if,
  input  [1:0]  io_com_uops_1_debug_fsrc,
  input  [1:0]  io_com_uops_1_debug_tsrc,
  input         io_rbk_valids_0,
  input         io_rbk_valids_1,
  input         io_rollback,
  input         io_debug_rob_empty,
  output [31:0] io_debug_freelist,
  output [31:0] io_debug_isprlist,
  output [31:0] io_debug_busytable
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
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [63:0] _RAND_85;
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
  reg [63:0] _RAND_128;
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
`endif // RANDOMIZE_REG_INIT
  reg  REG; // @[rename-stage.scala 120:27]
  reg [6:0] REG_1_uopc; // @[rename-stage.scala 121:23]
  reg [31:0] REG_1_inst; // @[rename-stage.scala 121:23]
  reg [31:0] REG_1_debug_inst; // @[rename-stage.scala 121:23]
  reg  REG_1_is_rvc; // @[rename-stage.scala 121:23]
  reg [39:0] REG_1_debug_pc; // @[rename-stage.scala 121:23]
  reg [2:0] REG_1_iq_type; // @[rename-stage.scala 121:23]
  reg [9:0] REG_1_fu_code; // @[rename-stage.scala 121:23]
  reg [3:0] REG_1_ctrl_br_type; // @[rename-stage.scala 121:23]
  reg [1:0] REG_1_ctrl_op1_sel; // @[rename-stage.scala 121:23]
  reg [2:0] REG_1_ctrl_op2_sel; // @[rename-stage.scala 121:23]
  reg [2:0] REG_1_ctrl_imm_sel; // @[rename-stage.scala 121:23]
  reg [3:0] REG_1_ctrl_op_fcn; // @[rename-stage.scala 121:23]
  reg  REG_1_ctrl_fcn_dw; // @[rename-stage.scala 121:23]
  reg [2:0] REG_1_ctrl_csr_cmd; // @[rename-stage.scala 121:23]
  reg  REG_1_ctrl_is_load; // @[rename-stage.scala 121:23]
  reg  REG_1_ctrl_is_sta; // @[rename-stage.scala 121:23]
  reg  REG_1_ctrl_is_std; // @[rename-stage.scala 121:23]
  reg [1:0] REG_1_iw_state; // @[rename-stage.scala 121:23]
  reg  REG_1_iw_p1_poisoned; // @[rename-stage.scala 121:23]
  reg  REG_1_iw_p2_poisoned; // @[rename-stage.scala 121:23]
  reg  REG_1_is_br; // @[rename-stage.scala 121:23]
  reg  REG_1_is_jalr; // @[rename-stage.scala 121:23]
  reg  REG_1_is_jal; // @[rename-stage.scala 121:23]
  reg  REG_1_is_sfb; // @[rename-stage.scala 121:23]
  reg [11:0] REG_1_br_mask; // @[rename-stage.scala 121:23]
  reg [3:0] REG_1_br_tag; // @[rename-stage.scala 121:23]
  reg [4:0] REG_1_ftq_idx; // @[rename-stage.scala 121:23]
  reg  REG_1_edge_inst; // @[rename-stage.scala 121:23]
  reg [5:0] REG_1_pc_lob; // @[rename-stage.scala 121:23]
  reg  REG_1_taken; // @[rename-stage.scala 121:23]
  reg [19:0] REG_1_imm_packed; // @[rename-stage.scala 121:23]
  reg [11:0] REG_1_csr_addr; // @[rename-stage.scala 121:23]
  reg [5:0] REG_1_rob_idx; // @[rename-stage.scala 121:23]
  reg [3:0] REG_1_ldq_idx; // @[rename-stage.scala 121:23]
  reg [3:0] REG_1_stq_idx; // @[rename-stage.scala 121:23]
  reg [1:0] REG_1_rxq_idx; // @[rename-stage.scala 121:23]
  reg [5:0] REG_1_pdst; // @[rename-stage.scala 121:23]
  reg [5:0] REG_1_prs1; // @[rename-stage.scala 121:23]
  reg [5:0] REG_1_prs2; // @[rename-stage.scala 121:23]
  reg [5:0] REG_1_prs3; // @[rename-stage.scala 121:23]
  reg [4:0] REG_1_ppred; // @[rename-stage.scala 121:23]
  reg  REG_1_prs1_busy; // @[rename-stage.scala 121:23]
  reg  REG_1_prs2_busy; // @[rename-stage.scala 121:23]
  reg  REG_1_prs3_busy; // @[rename-stage.scala 121:23]
  reg  REG_1_ppred_busy; // @[rename-stage.scala 121:23]
  reg [5:0] REG_1_stale_pdst; // @[rename-stage.scala 121:23]
  reg  REG_1_exception; // @[rename-stage.scala 121:23]
  reg [63:0] REG_1_exc_cause; // @[rename-stage.scala 121:23]
  reg  REG_1_bypassable; // @[rename-stage.scala 121:23]
  reg [4:0] REG_1_mem_cmd; // @[rename-stage.scala 121:23]
  reg [1:0] REG_1_mem_size; // @[rename-stage.scala 121:23]
  reg  REG_1_mem_signed; // @[rename-stage.scala 121:23]
  reg  REG_1_is_fence; // @[rename-stage.scala 121:23]
  reg  REG_1_is_fencei; // @[rename-stage.scala 121:23]
  reg  REG_1_is_amo; // @[rename-stage.scala 121:23]
  reg  REG_1_uses_ldq; // @[rename-stage.scala 121:23]
  reg  REG_1_uses_stq; // @[rename-stage.scala 121:23]
  reg  REG_1_is_sys_pc2epc; // @[rename-stage.scala 121:23]
  reg  REG_1_is_unique; // @[rename-stage.scala 121:23]
  reg  REG_1_flush_on_commit; // @[rename-stage.scala 121:23]
  reg  REG_1_ldst_is_rs1; // @[rename-stage.scala 121:23]
  reg [5:0] REG_1_ldst; // @[rename-stage.scala 121:23]
  reg [5:0] REG_1_lrs1; // @[rename-stage.scala 121:23]
  reg [5:0] REG_1_lrs2; // @[rename-stage.scala 121:23]
  reg [5:0] REG_1_lrs3; // @[rename-stage.scala 121:23]
  reg  REG_1_ldst_val; // @[rename-stage.scala 121:23]
  reg [1:0] REG_1_dst_rtype; // @[rename-stage.scala 121:23]
  reg [1:0] REG_1_lrs1_rtype; // @[rename-stage.scala 121:23]
  reg [1:0] REG_1_lrs2_rtype; // @[rename-stage.scala 121:23]
  reg  REG_1_frs3_en; // @[rename-stage.scala 121:23]
  reg  REG_1_fp_val; // @[rename-stage.scala 121:23]
  reg  REG_1_fp_single; // @[rename-stage.scala 121:23]
  reg  REG_1_xcpt_pf_if; // @[rename-stage.scala 121:23]
  reg  REG_1_xcpt_ae_if; // @[rename-stage.scala 121:23]
  reg  REG_1_xcpt_ma_if; // @[rename-stage.scala 121:23]
  reg  REG_1_bp_debug_if; // @[rename-stage.scala 121:23]
  reg  REG_1_bp_xcpt_if; // @[rename-stage.scala 121:23]
  reg [1:0] REG_1_debug_fsrc; // @[rename-stage.scala 121:23]
  reg [1:0] REG_1_debug_tsrc; // @[rename-stage.scala 121:23]
  wire [11:0] _GEN_55 = io_dis_ready ? io_dec_uops_0_br_mask : REG_1_br_mask; // @[rename-stage.scala 128:30 rename-stage.scala 130:16 rename-stage.scala 133:16]
  wire [11:0] _GEN_135 = io_kill ? REG_1_br_mask : _GEN_55; // @[rename-stage.scala 126:20 rename-stage.scala 124:14]
  wire [11:0] _T_2 = ~io_brupdate_b1_resolve_mask; // @[util.scala 74:37]
  reg  REG_2; // @[rename-stage.scala 120:27]
  reg [6:0] REG_3_uopc; // @[rename-stage.scala 121:23]
  reg [31:0] REG_3_inst; // @[rename-stage.scala 121:23]
  reg [31:0] REG_3_debug_inst; // @[rename-stage.scala 121:23]
  reg  REG_3_is_rvc; // @[rename-stage.scala 121:23]
  reg [39:0] REG_3_debug_pc; // @[rename-stage.scala 121:23]
  reg [2:0] REG_3_iq_type; // @[rename-stage.scala 121:23]
  reg [9:0] REG_3_fu_code; // @[rename-stage.scala 121:23]
  reg [3:0] REG_3_ctrl_br_type; // @[rename-stage.scala 121:23]
  reg [1:0] REG_3_ctrl_op1_sel; // @[rename-stage.scala 121:23]
  reg [2:0] REG_3_ctrl_op2_sel; // @[rename-stage.scala 121:23]
  reg [2:0] REG_3_ctrl_imm_sel; // @[rename-stage.scala 121:23]
  reg [3:0] REG_3_ctrl_op_fcn; // @[rename-stage.scala 121:23]
  reg  REG_3_ctrl_fcn_dw; // @[rename-stage.scala 121:23]
  reg [2:0] REG_3_ctrl_csr_cmd; // @[rename-stage.scala 121:23]
  reg  REG_3_ctrl_is_load; // @[rename-stage.scala 121:23]
  reg  REG_3_ctrl_is_sta; // @[rename-stage.scala 121:23]
  reg  REG_3_ctrl_is_std; // @[rename-stage.scala 121:23]
  reg [1:0] REG_3_iw_state; // @[rename-stage.scala 121:23]
  reg  REG_3_iw_p1_poisoned; // @[rename-stage.scala 121:23]
  reg  REG_3_iw_p2_poisoned; // @[rename-stage.scala 121:23]
  reg  REG_3_is_br; // @[rename-stage.scala 121:23]
  reg  REG_3_is_jalr; // @[rename-stage.scala 121:23]
  reg  REG_3_is_jal; // @[rename-stage.scala 121:23]
  reg  REG_3_is_sfb; // @[rename-stage.scala 121:23]
  reg [11:0] REG_3_br_mask; // @[rename-stage.scala 121:23]
  reg [3:0] REG_3_br_tag; // @[rename-stage.scala 121:23]
  reg [4:0] REG_3_ftq_idx; // @[rename-stage.scala 121:23]
  reg  REG_3_edge_inst; // @[rename-stage.scala 121:23]
  reg [5:0] REG_3_pc_lob; // @[rename-stage.scala 121:23]
  reg  REG_3_taken; // @[rename-stage.scala 121:23]
  reg [19:0] REG_3_imm_packed; // @[rename-stage.scala 121:23]
  reg [11:0] REG_3_csr_addr; // @[rename-stage.scala 121:23]
  reg [5:0] REG_3_rob_idx; // @[rename-stage.scala 121:23]
  reg [3:0] REG_3_ldq_idx; // @[rename-stage.scala 121:23]
  reg [3:0] REG_3_stq_idx; // @[rename-stage.scala 121:23]
  reg [1:0] REG_3_rxq_idx; // @[rename-stage.scala 121:23]
  reg [5:0] REG_3_pdst; // @[rename-stage.scala 121:23]
  reg [5:0] REG_3_prs1; // @[rename-stage.scala 121:23]
  reg [5:0] REG_3_prs2; // @[rename-stage.scala 121:23]
  reg [5:0] REG_3_prs3; // @[rename-stage.scala 121:23]
  reg [4:0] REG_3_ppred; // @[rename-stage.scala 121:23]
  reg  REG_3_prs1_busy; // @[rename-stage.scala 121:23]
  reg  REG_3_prs2_busy; // @[rename-stage.scala 121:23]
  reg  REG_3_prs3_busy; // @[rename-stage.scala 121:23]
  reg  REG_3_ppred_busy; // @[rename-stage.scala 121:23]
  reg [5:0] REG_3_stale_pdst; // @[rename-stage.scala 121:23]
  reg  REG_3_exception; // @[rename-stage.scala 121:23]
  reg [63:0] REG_3_exc_cause; // @[rename-stage.scala 121:23]
  reg  REG_3_bypassable; // @[rename-stage.scala 121:23]
  reg [4:0] REG_3_mem_cmd; // @[rename-stage.scala 121:23]
  reg [1:0] REG_3_mem_size; // @[rename-stage.scala 121:23]
  reg  REG_3_mem_signed; // @[rename-stage.scala 121:23]
  reg  REG_3_is_fence; // @[rename-stage.scala 121:23]
  reg  REG_3_is_fencei; // @[rename-stage.scala 121:23]
  reg  REG_3_is_amo; // @[rename-stage.scala 121:23]
  reg  REG_3_uses_ldq; // @[rename-stage.scala 121:23]
  reg  REG_3_uses_stq; // @[rename-stage.scala 121:23]
  reg  REG_3_is_sys_pc2epc; // @[rename-stage.scala 121:23]
  reg  REG_3_is_unique; // @[rename-stage.scala 121:23]
  reg  REG_3_flush_on_commit; // @[rename-stage.scala 121:23]
  reg  REG_3_ldst_is_rs1; // @[rename-stage.scala 121:23]
  reg [5:0] REG_3_ldst; // @[rename-stage.scala 121:23]
  reg [5:0] REG_3_lrs1; // @[rename-stage.scala 121:23]
  reg [5:0] REG_3_lrs2; // @[rename-stage.scala 121:23]
  reg [5:0] REG_3_lrs3; // @[rename-stage.scala 121:23]
  reg  REG_3_ldst_val; // @[rename-stage.scala 121:23]
  reg [1:0] REG_3_dst_rtype; // @[rename-stage.scala 121:23]
  reg [1:0] REG_3_lrs1_rtype; // @[rename-stage.scala 121:23]
  reg [1:0] REG_3_lrs2_rtype; // @[rename-stage.scala 121:23]
  reg  REG_3_frs3_en; // @[rename-stage.scala 121:23]
  reg  REG_3_fp_val; // @[rename-stage.scala 121:23]
  reg  REG_3_fp_single; // @[rename-stage.scala 121:23]
  reg  REG_3_xcpt_pf_if; // @[rename-stage.scala 121:23]
  reg  REG_3_xcpt_ae_if; // @[rename-stage.scala 121:23]
  reg  REG_3_xcpt_ma_if; // @[rename-stage.scala 121:23]
  reg  REG_3_bp_debug_if; // @[rename-stage.scala 121:23]
  reg  REG_3_bp_xcpt_if; // @[rename-stage.scala 121:23]
  reg [1:0] REG_3_debug_fsrc; // @[rename-stage.scala 121:23]
  reg [1:0] REG_3_debug_tsrc; // @[rename-stage.scala 121:23]
  wire [11:0] _GEN_215 = io_dis_ready ? io_dec_uops_1_br_mask : REG_3_br_mask; // @[rename-stage.scala 128:30 rename-stage.scala 130:16 rename-stage.scala 133:16]
  wire [11:0] _GEN_295 = io_kill ? REG_3_br_mask : _GEN_215; // @[rename-stage.scala 126:20 rename-stage.scala 124:14]
  assign io_ren_stalls_0 = 1'h0;
  assign io_ren_stalls_1 = 1'h0;
  assign io_ren2_mask_0 = REG; // @[rename-stage.scala 106:29 rename-stage.scala 138:20]
  assign io_ren2_mask_1 = REG_2; // @[rename-stage.scala 106:29 rename-stage.scala 138:20]
  assign io_ren2_uops_0_uopc = REG_1_uopc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_inst = REG_1_inst; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_debug_inst = REG_1_debug_inst; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_is_rvc = REG_1_is_rvc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_debug_pc = REG_1_debug_pc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_iq_type = REG_1_iq_type; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_fu_code = REG_1_fu_code; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ctrl_br_type = REG_1_ctrl_br_type; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ctrl_op1_sel = REG_1_ctrl_op1_sel; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ctrl_op2_sel = REG_1_ctrl_op2_sel; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ctrl_imm_sel = REG_1_ctrl_imm_sel; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ctrl_op_fcn = REG_1_ctrl_op_fcn; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ctrl_fcn_dw = REG_1_ctrl_fcn_dw; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ctrl_csr_cmd = REG_1_ctrl_csr_cmd; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ctrl_is_load = REG_1_ctrl_is_load; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ctrl_is_sta = REG_1_ctrl_is_sta; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ctrl_is_std = REG_1_ctrl_is_std; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_iw_state = REG_1_iw_state; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_iw_p1_poisoned = REG_1_iw_p1_poisoned; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_iw_p2_poisoned = REG_1_iw_p2_poisoned; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_is_br = REG_1_is_br; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_is_jalr = REG_1_is_jalr; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_is_jal = REG_1_is_jal; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_is_sfb = REG_1_is_sfb; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_br_mask = REG_1_br_mask; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_br_tag = REG_1_br_tag; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ftq_idx = REG_1_ftq_idx; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_edge_inst = REG_1_edge_inst; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_pc_lob = REG_1_pc_lob; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_taken = REG_1_taken; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_imm_packed = REG_1_imm_packed; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_csr_addr = REG_1_csr_addr; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_rob_idx = REG_1_rob_idx; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ldq_idx = REG_1_ldq_idx; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_stq_idx = REG_1_stq_idx; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_rxq_idx = REG_1_rxq_idx; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_pdst = REG_1_pdst; // @[rename-stage.scala 401:22 rename-stage.scala 402:28 rename-stage.scala 395:21]
  assign io_ren2_uops_0_prs1 = REG_1_prs1; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_prs2 = REG_1_prs2; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_prs3 = REG_1_prs3; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ppred = REG_1_ppred; // @[rename-stage.scala 407:26 rename-stage.scala 408:29 rename-stage.scala 395:21]
  assign io_ren2_uops_0_prs1_busy = REG_1_prs1_busy; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_prs2_busy = REG_1_prs2_busy; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_prs3_busy = REG_1_prs3_busy; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ppred_busy = REG_1_ppred_busy; // @[rename-stage.scala 407:26 rename-stage.scala 409:34 rename-stage.scala 395:21]
  assign io_ren2_uops_0_stale_pdst = REG_1_stale_pdst; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_exception = REG_1_exception; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_exc_cause = REG_1_exc_cause; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_bypassable = REG_1_bypassable; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_mem_cmd = REG_1_mem_cmd; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_mem_size = REG_1_mem_size; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_mem_signed = REG_1_mem_signed; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_is_fence = REG_1_is_fence; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_is_fencei = REG_1_is_fencei; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_is_amo = REG_1_is_amo; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_uses_ldq = REG_1_uses_ldq; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_uses_stq = REG_1_uses_stq; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_is_sys_pc2epc = REG_1_is_sys_pc2epc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_is_unique = REG_1_is_unique; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_flush_on_commit = REG_1_flush_on_commit; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ldst_is_rs1 = REG_1_ldst_is_rs1; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ldst = REG_1_ldst; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_lrs1 = REG_1_lrs1; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_lrs2 = REG_1_lrs2; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_lrs3 = REG_1_lrs3; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_ldst_val = REG_1_ldst_val; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_dst_rtype = REG_1_dst_rtype; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_lrs1_rtype = REG_1_lrs1_rtype; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_lrs2_rtype = REG_1_lrs2_rtype; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_frs3_en = REG_1_frs3_en; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_fp_val = REG_1_fp_val; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_fp_single = REG_1_fp_single; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_xcpt_pf_if = REG_1_xcpt_pf_if; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_xcpt_ae_if = REG_1_xcpt_ae_if; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_xcpt_ma_if = REG_1_xcpt_ma_if; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_bp_debug_if = REG_1_bp_debug_if; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_bp_xcpt_if = REG_1_bp_xcpt_if; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_debug_fsrc = REG_1_debug_fsrc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_0_debug_tsrc = REG_1_debug_tsrc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_uopc = REG_3_uopc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_inst = REG_3_inst; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_debug_inst = REG_3_debug_inst; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_is_rvc = REG_3_is_rvc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_debug_pc = REG_3_debug_pc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_iq_type = REG_3_iq_type; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_fu_code = REG_3_fu_code; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ctrl_br_type = REG_3_ctrl_br_type; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ctrl_op1_sel = REG_3_ctrl_op1_sel; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ctrl_op2_sel = REG_3_ctrl_op2_sel; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ctrl_imm_sel = REG_3_ctrl_imm_sel; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ctrl_op_fcn = REG_3_ctrl_op_fcn; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ctrl_fcn_dw = REG_3_ctrl_fcn_dw; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ctrl_csr_cmd = REG_3_ctrl_csr_cmd; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ctrl_is_load = REG_3_ctrl_is_load; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ctrl_is_sta = REG_3_ctrl_is_sta; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ctrl_is_std = REG_3_ctrl_is_std; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_iw_state = REG_3_iw_state; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_iw_p1_poisoned = REG_3_iw_p1_poisoned; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_iw_p2_poisoned = REG_3_iw_p2_poisoned; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_is_br = REG_3_is_br; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_is_jalr = REG_3_is_jalr; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_is_jal = REG_3_is_jal; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_is_sfb = REG_3_is_sfb; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_br_mask = REG_3_br_mask; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_br_tag = REG_3_br_tag; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ftq_idx = REG_3_ftq_idx; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_edge_inst = REG_3_edge_inst; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_pc_lob = REG_3_pc_lob; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_taken = REG_3_taken; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_imm_packed = REG_3_imm_packed; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_csr_addr = REG_3_csr_addr; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_rob_idx = REG_3_rob_idx; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ldq_idx = REG_3_ldq_idx; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_stq_idx = REG_3_stq_idx; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_rxq_idx = REG_3_rxq_idx; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_pdst = REG_3_pdst; // @[rename-stage.scala 401:22 rename-stage.scala 402:28 rename-stage.scala 395:21]
  assign io_ren2_uops_1_prs1 = REG_3_prs1; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_prs2 = REG_3_prs2; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_prs3 = REG_3_prs3; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ppred = REG_3_ppred; // @[rename-stage.scala 407:26 rename-stage.scala 408:29 rename-stage.scala 395:21]
  assign io_ren2_uops_1_prs1_busy = REG_3_prs1_busy; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_prs2_busy = REG_3_prs2_busy; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_prs3_busy = REG_3_prs3_busy; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ppred_busy = REG_3_ppred_busy; // @[rename-stage.scala 407:26 rename-stage.scala 409:34 rename-stage.scala 395:21]
  assign io_ren2_uops_1_stale_pdst = REG_3_stale_pdst; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_exception = REG_3_exception; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_exc_cause = REG_3_exc_cause; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_bypassable = REG_3_bypassable; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_mem_cmd = REG_3_mem_cmd; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_mem_size = REG_3_mem_size; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_mem_signed = REG_3_mem_signed; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_is_fence = REG_3_is_fence; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_is_fencei = REG_3_is_fencei; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_is_amo = REG_3_is_amo; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_uses_ldq = REG_3_uses_ldq; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_uses_stq = REG_3_uses_stq; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_is_sys_pc2epc = REG_3_is_sys_pc2epc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_is_unique = REG_3_is_unique; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_flush_on_commit = REG_3_flush_on_commit; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ldst_is_rs1 = REG_3_ldst_is_rs1; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ldst = REG_3_ldst; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_lrs1 = REG_3_lrs1; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_lrs2 = REG_3_lrs2; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_lrs3 = REG_3_lrs3; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_ldst_val = REG_3_ldst_val; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_dst_rtype = REG_3_dst_rtype; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_lrs1_rtype = REG_3_lrs1_rtype; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_lrs2_rtype = REG_3_lrs2_rtype; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_frs3_en = REG_3_frs3_en; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_fp_val = REG_3_fp_val; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_fp_single = REG_3_fp_single; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_xcpt_pf_if = REG_3_xcpt_pf_if; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_xcpt_ae_if = REG_3_xcpt_ae_if; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_xcpt_ma_if = REG_3_xcpt_ma_if; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_bp_debug_if = REG_3_bp_debug_if; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_bp_xcpt_if = REG_3_bp_xcpt_if; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_debug_fsrc = REG_3_debug_fsrc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_ren2_uops_1_debug_tsrc = REG_3_debug_tsrc; // @[rename-stage.scala 107:29 rename-stage.scala 139:20]
  assign io_debug_freelist = 32'h0;
  assign io_debug_isprlist = 32'h0;
  assign io_debug_busytable = 32'h0;
  always @(posedge clock) begin
    if (reset) begin // @[rename-stage.scala 120:27]
      REG <= 1'h0; // @[rename-stage.scala 120:27]
    end else if (io_kill) begin // @[rename-stage.scala 126:20]
      REG <= 1'h0; // @[rename-stage.scala 127:15]
    end else if (io_dis_ready) begin // @[rename-stage.scala 128:30]
      REG <= io_dec_fire_0; // @[rename-stage.scala 129:15]
    end else begin
      REG <= REG & ~io_dis_fire_0; // @[rename-stage.scala 132:15]
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_uopc <= io_dec_uops_0_uopc; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_inst <= io_dec_uops_0_inst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_debug_inst <= io_dec_uops_0_debug_inst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_is_rvc <= io_dec_uops_0_is_rvc; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_debug_pc <= io_dec_uops_0_debug_pc; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_iq_type <= io_dec_uops_0_iq_type; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_fu_code <= io_dec_uops_0_fu_code; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ctrl_br_type <= io_dec_uops_0_ctrl_br_type; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ctrl_op1_sel <= io_dec_uops_0_ctrl_op1_sel; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ctrl_op2_sel <= io_dec_uops_0_ctrl_op2_sel; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ctrl_imm_sel <= io_dec_uops_0_ctrl_imm_sel; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ctrl_op_fcn <= io_dec_uops_0_ctrl_op_fcn; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ctrl_fcn_dw <= io_dec_uops_0_ctrl_fcn_dw; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ctrl_csr_cmd <= io_dec_uops_0_ctrl_csr_cmd; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ctrl_is_load <= io_dec_uops_0_ctrl_is_load; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ctrl_is_sta <= io_dec_uops_0_ctrl_is_sta; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ctrl_is_std <= io_dec_uops_0_ctrl_is_std; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_iw_state <= io_dec_uops_0_iw_state; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_iw_p1_poisoned <= io_dec_uops_0_iw_p1_poisoned; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_iw_p2_poisoned <= io_dec_uops_0_iw_p2_poisoned; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_is_br <= io_dec_uops_0_is_br; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_is_jalr <= io_dec_uops_0_is_jalr; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_is_jal <= io_dec_uops_0_is_jal; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_is_sfb <= io_dec_uops_0_is_sfb; // @[rename-stage.scala 130:16]
      end
    end
    REG_1_br_mask <= _GEN_135 & _T_2; // @[util.scala 74:35]
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_br_tag <= io_dec_uops_0_br_tag; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ftq_idx <= io_dec_uops_0_ftq_idx; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_edge_inst <= io_dec_uops_0_edge_inst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_pc_lob <= io_dec_uops_0_pc_lob; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_taken <= io_dec_uops_0_taken; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_imm_packed <= io_dec_uops_0_imm_packed; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_csr_addr <= io_dec_uops_0_csr_addr; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_rob_idx <= io_dec_uops_0_rob_idx; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ldq_idx <= io_dec_uops_0_ldq_idx; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_stq_idx <= io_dec_uops_0_stq_idx; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_rxq_idx <= io_dec_uops_0_rxq_idx; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_pdst <= io_dec_uops_0_pdst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_prs1 <= io_dec_uops_0_prs1; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_prs2 <= io_dec_uops_0_prs2; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_prs3 <= io_dec_uops_0_prs3; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ppred <= io_dec_uops_0_ppred; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_prs1_busy <= io_dec_uops_0_prs1_busy; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_prs2_busy <= io_dec_uops_0_prs2_busy; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_prs3_busy <= io_dec_uops_0_prs3_busy; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ppred_busy <= io_dec_uops_0_ppred_busy; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_stale_pdst <= io_dec_uops_0_stale_pdst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_exception <= io_dec_uops_0_exception; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_exc_cause <= io_dec_uops_0_exc_cause; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_bypassable <= io_dec_uops_0_bypassable; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_mem_cmd <= io_dec_uops_0_mem_cmd; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_mem_size <= io_dec_uops_0_mem_size; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_mem_signed <= io_dec_uops_0_mem_signed; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_is_fence <= io_dec_uops_0_is_fence; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_is_fencei <= io_dec_uops_0_is_fencei; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_is_amo <= io_dec_uops_0_is_amo; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_uses_ldq <= io_dec_uops_0_uses_ldq; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_uses_stq <= io_dec_uops_0_uses_stq; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_is_sys_pc2epc <= io_dec_uops_0_is_sys_pc2epc; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_is_unique <= io_dec_uops_0_is_unique; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_flush_on_commit <= io_dec_uops_0_flush_on_commit; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ldst_is_rs1 <= io_dec_uops_0_ldst_is_rs1; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ldst <= io_dec_uops_0_ldst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_lrs1 <= io_dec_uops_0_lrs1; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_lrs2 <= io_dec_uops_0_lrs2; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_lrs3 <= io_dec_uops_0_lrs3; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_ldst_val <= io_dec_uops_0_ldst_val; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_dst_rtype <= io_dec_uops_0_dst_rtype; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_lrs1_rtype <= io_dec_uops_0_lrs1_rtype; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_lrs2_rtype <= io_dec_uops_0_lrs2_rtype; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_frs3_en <= io_dec_uops_0_frs3_en; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_fp_val <= io_dec_uops_0_fp_val; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_fp_single <= io_dec_uops_0_fp_single; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_xcpt_pf_if <= io_dec_uops_0_xcpt_pf_if; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_xcpt_ae_if <= io_dec_uops_0_xcpt_ae_if; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_xcpt_ma_if <= io_dec_uops_0_xcpt_ma_if; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_bp_debug_if <= io_dec_uops_0_bp_debug_if; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_bp_xcpt_if <= io_dec_uops_0_bp_xcpt_if; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_debug_fsrc <= io_dec_uops_0_debug_fsrc; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_1_debug_tsrc <= io_dec_uops_0_debug_tsrc; // @[rename-stage.scala 130:16]
      end
    end
    if (reset) begin // @[rename-stage.scala 120:27]
      REG_2 <= 1'h0; // @[rename-stage.scala 120:27]
    end else if (io_kill) begin // @[rename-stage.scala 126:20]
      REG_2 <= 1'h0; // @[rename-stage.scala 127:15]
    end else if (io_dis_ready) begin // @[rename-stage.scala 128:30]
      REG_2 <= io_dec_fire_1; // @[rename-stage.scala 129:15]
    end else begin
      REG_2 <= REG_2 & ~io_dis_fire_1; // @[rename-stage.scala 132:15]
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_uopc <= io_dec_uops_1_uopc; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_inst <= io_dec_uops_1_inst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_debug_inst <= io_dec_uops_1_debug_inst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_is_rvc <= io_dec_uops_1_is_rvc; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_debug_pc <= io_dec_uops_1_debug_pc; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_iq_type <= io_dec_uops_1_iq_type; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_fu_code <= io_dec_uops_1_fu_code; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ctrl_br_type <= io_dec_uops_1_ctrl_br_type; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ctrl_op1_sel <= io_dec_uops_1_ctrl_op1_sel; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ctrl_op2_sel <= io_dec_uops_1_ctrl_op2_sel; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ctrl_imm_sel <= io_dec_uops_1_ctrl_imm_sel; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ctrl_op_fcn <= io_dec_uops_1_ctrl_op_fcn; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ctrl_fcn_dw <= io_dec_uops_1_ctrl_fcn_dw; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ctrl_csr_cmd <= io_dec_uops_1_ctrl_csr_cmd; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ctrl_is_load <= io_dec_uops_1_ctrl_is_load; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ctrl_is_sta <= io_dec_uops_1_ctrl_is_sta; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ctrl_is_std <= io_dec_uops_1_ctrl_is_std; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_iw_state <= io_dec_uops_1_iw_state; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_iw_p1_poisoned <= io_dec_uops_1_iw_p1_poisoned; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_iw_p2_poisoned <= io_dec_uops_1_iw_p2_poisoned; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_is_br <= io_dec_uops_1_is_br; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_is_jalr <= io_dec_uops_1_is_jalr; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_is_jal <= io_dec_uops_1_is_jal; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_is_sfb <= io_dec_uops_1_is_sfb; // @[rename-stage.scala 130:16]
      end
    end
    REG_3_br_mask <= _GEN_295 & _T_2; // @[util.scala 74:35]
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_br_tag <= io_dec_uops_1_br_tag; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ftq_idx <= io_dec_uops_1_ftq_idx; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_edge_inst <= io_dec_uops_1_edge_inst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_pc_lob <= io_dec_uops_1_pc_lob; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_taken <= io_dec_uops_1_taken; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_imm_packed <= io_dec_uops_1_imm_packed; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_csr_addr <= io_dec_uops_1_csr_addr; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_rob_idx <= io_dec_uops_1_rob_idx; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ldq_idx <= io_dec_uops_1_ldq_idx; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_stq_idx <= io_dec_uops_1_stq_idx; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_rxq_idx <= io_dec_uops_1_rxq_idx; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_pdst <= io_dec_uops_1_pdst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_prs1 <= io_dec_uops_1_prs1; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_prs2 <= io_dec_uops_1_prs2; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_prs3 <= io_dec_uops_1_prs3; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ppred <= io_dec_uops_1_ppred; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_prs1_busy <= io_dec_uops_1_prs1_busy; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_prs2_busy <= io_dec_uops_1_prs2_busy; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_prs3_busy <= io_dec_uops_1_prs3_busy; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ppred_busy <= io_dec_uops_1_ppred_busy; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_stale_pdst <= io_dec_uops_1_stale_pdst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_exception <= io_dec_uops_1_exception; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_exc_cause <= io_dec_uops_1_exc_cause; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_bypassable <= io_dec_uops_1_bypassable; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_mem_cmd <= io_dec_uops_1_mem_cmd; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_mem_size <= io_dec_uops_1_mem_size; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_mem_signed <= io_dec_uops_1_mem_signed; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_is_fence <= io_dec_uops_1_is_fence; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_is_fencei <= io_dec_uops_1_is_fencei; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_is_amo <= io_dec_uops_1_is_amo; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_uses_ldq <= io_dec_uops_1_uses_ldq; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_uses_stq <= io_dec_uops_1_uses_stq; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_is_sys_pc2epc <= io_dec_uops_1_is_sys_pc2epc; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_is_unique <= io_dec_uops_1_is_unique; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_flush_on_commit <= io_dec_uops_1_flush_on_commit; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ldst_is_rs1 <= io_dec_uops_1_ldst_is_rs1; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ldst <= io_dec_uops_1_ldst; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_lrs1 <= io_dec_uops_1_lrs1; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_lrs2 <= io_dec_uops_1_lrs2; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_lrs3 <= io_dec_uops_1_lrs3; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_ldst_val <= io_dec_uops_1_ldst_val; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_dst_rtype <= io_dec_uops_1_dst_rtype; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_lrs1_rtype <= io_dec_uops_1_lrs1_rtype; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_lrs2_rtype <= io_dec_uops_1_lrs2_rtype; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_frs3_en <= io_dec_uops_1_frs3_en; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_fp_val <= io_dec_uops_1_fp_val; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_fp_single <= io_dec_uops_1_fp_single; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_xcpt_pf_if <= io_dec_uops_1_xcpt_pf_if; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_xcpt_ae_if <= io_dec_uops_1_xcpt_ae_if; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_xcpt_ma_if <= io_dec_uops_1_xcpt_ma_if; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_bp_debug_if <= io_dec_uops_1_bp_debug_if; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_bp_xcpt_if <= io_dec_uops_1_bp_xcpt_if; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_debug_fsrc <= io_dec_uops_1_debug_fsrc; // @[rename-stage.scala 130:16]
      end
    end
    if (!(io_kill)) begin // @[rename-stage.scala 126:20]
      if (io_dis_ready) begin // @[rename-stage.scala 128:30]
        REG_3_debug_tsrc <= io_dec_uops_1_debug_tsrc; // @[rename-stage.scala 130:16]
      end
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
  REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  REG_1_uopc = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  REG_1_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  REG_1_debug_inst = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  REG_1_is_rvc = _RAND_4[0:0];
  _RAND_5 = {2{`RANDOM}};
  REG_1_debug_pc = _RAND_5[39:0];
  _RAND_6 = {1{`RANDOM}};
  REG_1_iq_type = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  REG_1_fu_code = _RAND_7[9:0];
  _RAND_8 = {1{`RANDOM}};
  REG_1_ctrl_br_type = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  REG_1_ctrl_op1_sel = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  REG_1_ctrl_op2_sel = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  REG_1_ctrl_imm_sel = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  REG_1_ctrl_op_fcn = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  REG_1_ctrl_fcn_dw = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  REG_1_ctrl_csr_cmd = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  REG_1_ctrl_is_load = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  REG_1_ctrl_is_sta = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  REG_1_ctrl_is_std = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  REG_1_iw_state = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  REG_1_iw_p1_poisoned = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  REG_1_iw_p2_poisoned = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  REG_1_is_br = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  REG_1_is_jalr = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  REG_1_is_jal = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  REG_1_is_sfb = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  REG_1_br_mask = _RAND_25[11:0];
  _RAND_26 = {1{`RANDOM}};
  REG_1_br_tag = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  REG_1_ftq_idx = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  REG_1_edge_inst = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  REG_1_pc_lob = _RAND_29[5:0];
  _RAND_30 = {1{`RANDOM}};
  REG_1_taken = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  REG_1_imm_packed = _RAND_31[19:0];
  _RAND_32 = {1{`RANDOM}};
  REG_1_csr_addr = _RAND_32[11:0];
  _RAND_33 = {1{`RANDOM}};
  REG_1_rob_idx = _RAND_33[5:0];
  _RAND_34 = {1{`RANDOM}};
  REG_1_ldq_idx = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  REG_1_stq_idx = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  REG_1_rxq_idx = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  REG_1_pdst = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  REG_1_prs1 = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  REG_1_prs2 = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  REG_1_prs3 = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  REG_1_ppred = _RAND_41[4:0];
  _RAND_42 = {1{`RANDOM}};
  REG_1_prs1_busy = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  REG_1_prs2_busy = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  REG_1_prs3_busy = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  REG_1_ppred_busy = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  REG_1_stale_pdst = _RAND_46[5:0];
  _RAND_47 = {1{`RANDOM}};
  REG_1_exception = _RAND_47[0:0];
  _RAND_48 = {2{`RANDOM}};
  REG_1_exc_cause = _RAND_48[63:0];
  _RAND_49 = {1{`RANDOM}};
  REG_1_bypassable = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  REG_1_mem_cmd = _RAND_50[4:0];
  _RAND_51 = {1{`RANDOM}};
  REG_1_mem_size = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  REG_1_mem_signed = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  REG_1_is_fence = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  REG_1_is_fencei = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  REG_1_is_amo = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  REG_1_uses_ldq = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  REG_1_uses_stq = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  REG_1_is_sys_pc2epc = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  REG_1_is_unique = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  REG_1_flush_on_commit = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  REG_1_ldst_is_rs1 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  REG_1_ldst = _RAND_62[5:0];
  _RAND_63 = {1{`RANDOM}};
  REG_1_lrs1 = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  REG_1_lrs2 = _RAND_64[5:0];
  _RAND_65 = {1{`RANDOM}};
  REG_1_lrs3 = _RAND_65[5:0];
  _RAND_66 = {1{`RANDOM}};
  REG_1_ldst_val = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  REG_1_dst_rtype = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  REG_1_lrs1_rtype = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  REG_1_lrs2_rtype = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  REG_1_frs3_en = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  REG_1_fp_val = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  REG_1_fp_single = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  REG_1_xcpt_pf_if = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  REG_1_xcpt_ae_if = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  REG_1_xcpt_ma_if = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  REG_1_bp_debug_if = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  REG_1_bp_xcpt_if = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  REG_1_debug_fsrc = _RAND_78[1:0];
  _RAND_79 = {1{`RANDOM}};
  REG_1_debug_tsrc = _RAND_79[1:0];
  _RAND_80 = {1{`RANDOM}};
  REG_2 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  REG_3_uopc = _RAND_81[6:0];
  _RAND_82 = {1{`RANDOM}};
  REG_3_inst = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  REG_3_debug_inst = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  REG_3_is_rvc = _RAND_84[0:0];
  _RAND_85 = {2{`RANDOM}};
  REG_3_debug_pc = _RAND_85[39:0];
  _RAND_86 = {1{`RANDOM}};
  REG_3_iq_type = _RAND_86[2:0];
  _RAND_87 = {1{`RANDOM}};
  REG_3_fu_code = _RAND_87[9:0];
  _RAND_88 = {1{`RANDOM}};
  REG_3_ctrl_br_type = _RAND_88[3:0];
  _RAND_89 = {1{`RANDOM}};
  REG_3_ctrl_op1_sel = _RAND_89[1:0];
  _RAND_90 = {1{`RANDOM}};
  REG_3_ctrl_op2_sel = _RAND_90[2:0];
  _RAND_91 = {1{`RANDOM}};
  REG_3_ctrl_imm_sel = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  REG_3_ctrl_op_fcn = _RAND_92[3:0];
  _RAND_93 = {1{`RANDOM}};
  REG_3_ctrl_fcn_dw = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  REG_3_ctrl_csr_cmd = _RAND_94[2:0];
  _RAND_95 = {1{`RANDOM}};
  REG_3_ctrl_is_load = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  REG_3_ctrl_is_sta = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  REG_3_ctrl_is_std = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  REG_3_iw_state = _RAND_98[1:0];
  _RAND_99 = {1{`RANDOM}};
  REG_3_iw_p1_poisoned = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  REG_3_iw_p2_poisoned = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  REG_3_is_br = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  REG_3_is_jalr = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  REG_3_is_jal = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  REG_3_is_sfb = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  REG_3_br_mask = _RAND_105[11:0];
  _RAND_106 = {1{`RANDOM}};
  REG_3_br_tag = _RAND_106[3:0];
  _RAND_107 = {1{`RANDOM}};
  REG_3_ftq_idx = _RAND_107[4:0];
  _RAND_108 = {1{`RANDOM}};
  REG_3_edge_inst = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  REG_3_pc_lob = _RAND_109[5:0];
  _RAND_110 = {1{`RANDOM}};
  REG_3_taken = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  REG_3_imm_packed = _RAND_111[19:0];
  _RAND_112 = {1{`RANDOM}};
  REG_3_csr_addr = _RAND_112[11:0];
  _RAND_113 = {1{`RANDOM}};
  REG_3_rob_idx = _RAND_113[5:0];
  _RAND_114 = {1{`RANDOM}};
  REG_3_ldq_idx = _RAND_114[3:0];
  _RAND_115 = {1{`RANDOM}};
  REG_3_stq_idx = _RAND_115[3:0];
  _RAND_116 = {1{`RANDOM}};
  REG_3_rxq_idx = _RAND_116[1:0];
  _RAND_117 = {1{`RANDOM}};
  REG_3_pdst = _RAND_117[5:0];
  _RAND_118 = {1{`RANDOM}};
  REG_3_prs1 = _RAND_118[5:0];
  _RAND_119 = {1{`RANDOM}};
  REG_3_prs2 = _RAND_119[5:0];
  _RAND_120 = {1{`RANDOM}};
  REG_3_prs3 = _RAND_120[5:0];
  _RAND_121 = {1{`RANDOM}};
  REG_3_ppred = _RAND_121[4:0];
  _RAND_122 = {1{`RANDOM}};
  REG_3_prs1_busy = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  REG_3_prs2_busy = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  REG_3_prs3_busy = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  REG_3_ppred_busy = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  REG_3_stale_pdst = _RAND_126[5:0];
  _RAND_127 = {1{`RANDOM}};
  REG_3_exception = _RAND_127[0:0];
  _RAND_128 = {2{`RANDOM}};
  REG_3_exc_cause = _RAND_128[63:0];
  _RAND_129 = {1{`RANDOM}};
  REG_3_bypassable = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  REG_3_mem_cmd = _RAND_130[4:0];
  _RAND_131 = {1{`RANDOM}};
  REG_3_mem_size = _RAND_131[1:0];
  _RAND_132 = {1{`RANDOM}};
  REG_3_mem_signed = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  REG_3_is_fence = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  REG_3_is_fencei = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  REG_3_is_amo = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  REG_3_uses_ldq = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  REG_3_uses_stq = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  REG_3_is_sys_pc2epc = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  REG_3_is_unique = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  REG_3_flush_on_commit = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  REG_3_ldst_is_rs1 = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  REG_3_ldst = _RAND_142[5:0];
  _RAND_143 = {1{`RANDOM}};
  REG_3_lrs1 = _RAND_143[5:0];
  _RAND_144 = {1{`RANDOM}};
  REG_3_lrs2 = _RAND_144[5:0];
  _RAND_145 = {1{`RANDOM}};
  REG_3_lrs3 = _RAND_145[5:0];
  _RAND_146 = {1{`RANDOM}};
  REG_3_ldst_val = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  REG_3_dst_rtype = _RAND_147[1:0];
  _RAND_148 = {1{`RANDOM}};
  REG_3_lrs1_rtype = _RAND_148[1:0];
  _RAND_149 = {1{`RANDOM}};
  REG_3_lrs2_rtype = _RAND_149[1:0];
  _RAND_150 = {1{`RANDOM}};
  REG_3_frs3_en = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  REG_3_fp_val = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  REG_3_fp_single = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  REG_3_xcpt_pf_if = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  REG_3_xcpt_ae_if = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  REG_3_xcpt_ma_if = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  REG_3_bp_debug_if = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  REG_3_bp_xcpt_if = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  REG_3_debug_fsrc = _RAND_158[1:0];
  _RAND_159 = {1{`RANDOM}};
  REG_3_debug_tsrc = _RAND_159[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
