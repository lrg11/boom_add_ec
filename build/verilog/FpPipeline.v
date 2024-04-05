module FpPipeline(
  input         clock,
  input         reset,
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
  input         io_flush_pipeline,
  input  [2:0]  io_fcsr_rm,
  input         io_status_debug,
  input         io_status_cease,
  input         io_status_wfi,
  input  [31:0] io_status_isa,
  input  [1:0]  io_status_dprv,
  input  [1:0]  io_status_prv,
  input         io_status_sd,
  input  [26:0] io_status_zero2,
  input  [1:0]  io_status_sxl,
  input  [1:0]  io_status_uxl,
  input         io_status_sd_rv32,
  input  [7:0]  io_status_zero1,
  input         io_status_tsr,
  input         io_status_tw,
  input         io_status_tvm,
  input         io_status_mxr,
  input         io_status_sum,
  input         io_status_mprv,
  input  [1:0]  io_status_xs,
  input  [1:0]  io_status_fs,
  input  [1:0]  io_status_mpp,
  input  [1:0]  io_status_vs,
  input         io_status_spp,
  input         io_status_mpie,
  input         io_status_hpie,
  input         io_status_spie,
  input         io_status_upie,
  input         io_status_mie,
  input         io_status_hie,
  input         io_status_sie,
  input         io_status_uie,
  output        io_dis_uops_0_ready,
  input         io_dis_uops_0_valid,
  input  [6:0]  io_dis_uops_0_bits_uopc,
  input  [31:0] io_dis_uops_0_bits_inst,
  input  [31:0] io_dis_uops_0_bits_debug_inst,
  input         io_dis_uops_0_bits_is_rvc,
  input  [39:0] io_dis_uops_0_bits_debug_pc,
  input  [2:0]  io_dis_uops_0_bits_iq_type,
  input  [9:0]  io_dis_uops_0_bits_fu_code,
  input  [3:0]  io_dis_uops_0_bits_ctrl_br_type,
  input  [1:0]  io_dis_uops_0_bits_ctrl_op1_sel,
  input  [2:0]  io_dis_uops_0_bits_ctrl_op2_sel,
  input  [2:0]  io_dis_uops_0_bits_ctrl_imm_sel,
  input  [3:0]  io_dis_uops_0_bits_ctrl_op_fcn,
  input         io_dis_uops_0_bits_ctrl_fcn_dw,
  input  [2:0]  io_dis_uops_0_bits_ctrl_csr_cmd,
  input         io_dis_uops_0_bits_ctrl_is_load,
  input         io_dis_uops_0_bits_ctrl_is_sta,
  input         io_dis_uops_0_bits_ctrl_is_std,
  input  [1:0]  io_dis_uops_0_bits_iw_state,
  input         io_dis_uops_0_bits_iw_p1_poisoned,
  input         io_dis_uops_0_bits_iw_p2_poisoned,
  input         io_dis_uops_0_bits_is_br,
  input         io_dis_uops_0_bits_is_jalr,
  input         io_dis_uops_0_bits_is_jal,
  input         io_dis_uops_0_bits_is_sfb,
  input  [11:0] io_dis_uops_0_bits_br_mask,
  input  [3:0]  io_dis_uops_0_bits_br_tag,
  input  [4:0]  io_dis_uops_0_bits_ftq_idx,
  input         io_dis_uops_0_bits_edge_inst,
  input  [5:0]  io_dis_uops_0_bits_pc_lob,
  input         io_dis_uops_0_bits_taken,
  input  [19:0] io_dis_uops_0_bits_imm_packed,
  input  [11:0] io_dis_uops_0_bits_csr_addr,
  input  [5:0]  io_dis_uops_0_bits_rob_idx,
  input  [3:0]  io_dis_uops_0_bits_ldq_idx,
  input  [3:0]  io_dis_uops_0_bits_stq_idx,
  input  [1:0]  io_dis_uops_0_bits_rxq_idx,
  input  [5:0]  io_dis_uops_0_bits_pdst,
  input  [5:0]  io_dis_uops_0_bits_prs1,
  input  [5:0]  io_dis_uops_0_bits_prs2,
  input  [5:0]  io_dis_uops_0_bits_prs3,
  input  [4:0]  io_dis_uops_0_bits_ppred,
  input         io_dis_uops_0_bits_prs1_busy,
  input         io_dis_uops_0_bits_prs2_busy,
  input         io_dis_uops_0_bits_prs3_busy,
  input         io_dis_uops_0_bits_ppred_busy,
  input  [5:0]  io_dis_uops_0_bits_stale_pdst,
  input         io_dis_uops_0_bits_exception,
  input  [63:0] io_dis_uops_0_bits_exc_cause,
  input         io_dis_uops_0_bits_bypassable,
  input  [4:0]  io_dis_uops_0_bits_mem_cmd,
  input  [1:0]  io_dis_uops_0_bits_mem_size,
  input         io_dis_uops_0_bits_mem_signed,
  input         io_dis_uops_0_bits_is_fence,
  input         io_dis_uops_0_bits_is_fencei,
  input         io_dis_uops_0_bits_is_amo,
  input         io_dis_uops_0_bits_uses_ldq,
  input         io_dis_uops_0_bits_uses_stq,
  input         io_dis_uops_0_bits_is_sys_pc2epc,
  input         io_dis_uops_0_bits_is_unique,
  input         io_dis_uops_0_bits_flush_on_commit,
  input         io_dis_uops_0_bits_ldst_is_rs1,
  input  [5:0]  io_dis_uops_0_bits_ldst,
  input  [5:0]  io_dis_uops_0_bits_lrs1,
  input  [5:0]  io_dis_uops_0_bits_lrs2,
  input  [5:0]  io_dis_uops_0_bits_lrs3,
  input         io_dis_uops_0_bits_ldst_val,
  input  [1:0]  io_dis_uops_0_bits_dst_rtype,
  input  [1:0]  io_dis_uops_0_bits_lrs1_rtype,
  input  [1:0]  io_dis_uops_0_bits_lrs2_rtype,
  input         io_dis_uops_0_bits_frs3_en,
  input         io_dis_uops_0_bits_fp_val,
  input         io_dis_uops_0_bits_fp_single,
  input         io_dis_uops_0_bits_xcpt_pf_if,
  input         io_dis_uops_0_bits_xcpt_ae_if,
  input         io_dis_uops_0_bits_xcpt_ma_if,
  input         io_dis_uops_0_bits_bp_debug_if,
  input         io_dis_uops_0_bits_bp_xcpt_if,
  input  [1:0]  io_dis_uops_0_bits_debug_fsrc,
  input  [1:0]  io_dis_uops_0_bits_debug_tsrc,
  output        io_dis_uops_1_ready,
  input         io_dis_uops_1_valid,
  input  [6:0]  io_dis_uops_1_bits_uopc,
  input  [31:0] io_dis_uops_1_bits_inst,
  input  [31:0] io_dis_uops_1_bits_debug_inst,
  input         io_dis_uops_1_bits_is_rvc,
  input  [39:0] io_dis_uops_1_bits_debug_pc,
  input  [2:0]  io_dis_uops_1_bits_iq_type,
  input  [9:0]  io_dis_uops_1_bits_fu_code,
  input  [3:0]  io_dis_uops_1_bits_ctrl_br_type,
  input  [1:0]  io_dis_uops_1_bits_ctrl_op1_sel,
  input  [2:0]  io_dis_uops_1_bits_ctrl_op2_sel,
  input  [2:0]  io_dis_uops_1_bits_ctrl_imm_sel,
  input  [3:0]  io_dis_uops_1_bits_ctrl_op_fcn,
  input         io_dis_uops_1_bits_ctrl_fcn_dw,
  input  [2:0]  io_dis_uops_1_bits_ctrl_csr_cmd,
  input         io_dis_uops_1_bits_ctrl_is_load,
  input         io_dis_uops_1_bits_ctrl_is_sta,
  input         io_dis_uops_1_bits_ctrl_is_std,
  input  [1:0]  io_dis_uops_1_bits_iw_state,
  input         io_dis_uops_1_bits_iw_p1_poisoned,
  input         io_dis_uops_1_bits_iw_p2_poisoned,
  input         io_dis_uops_1_bits_is_br,
  input         io_dis_uops_1_bits_is_jalr,
  input         io_dis_uops_1_bits_is_jal,
  input         io_dis_uops_1_bits_is_sfb,
  input  [11:0] io_dis_uops_1_bits_br_mask,
  input  [3:0]  io_dis_uops_1_bits_br_tag,
  input  [4:0]  io_dis_uops_1_bits_ftq_idx,
  input         io_dis_uops_1_bits_edge_inst,
  input  [5:0]  io_dis_uops_1_bits_pc_lob,
  input         io_dis_uops_1_bits_taken,
  input  [19:0] io_dis_uops_1_bits_imm_packed,
  input  [11:0] io_dis_uops_1_bits_csr_addr,
  input  [5:0]  io_dis_uops_1_bits_rob_idx,
  input  [3:0]  io_dis_uops_1_bits_ldq_idx,
  input  [3:0]  io_dis_uops_1_bits_stq_idx,
  input  [1:0]  io_dis_uops_1_bits_rxq_idx,
  input  [5:0]  io_dis_uops_1_bits_pdst,
  input  [5:0]  io_dis_uops_1_bits_prs1,
  input  [5:0]  io_dis_uops_1_bits_prs2,
  input  [5:0]  io_dis_uops_1_bits_prs3,
  input  [4:0]  io_dis_uops_1_bits_ppred,
  input         io_dis_uops_1_bits_prs1_busy,
  input         io_dis_uops_1_bits_prs2_busy,
  input         io_dis_uops_1_bits_prs3_busy,
  input         io_dis_uops_1_bits_ppred_busy,
  input  [5:0]  io_dis_uops_1_bits_stale_pdst,
  input         io_dis_uops_1_bits_exception,
  input  [63:0] io_dis_uops_1_bits_exc_cause,
  input         io_dis_uops_1_bits_bypassable,
  input  [4:0]  io_dis_uops_1_bits_mem_cmd,
  input  [1:0]  io_dis_uops_1_bits_mem_size,
  input         io_dis_uops_1_bits_mem_signed,
  input         io_dis_uops_1_bits_is_fence,
  input         io_dis_uops_1_bits_is_fencei,
  input         io_dis_uops_1_bits_is_amo,
  input         io_dis_uops_1_bits_uses_ldq,
  input         io_dis_uops_1_bits_uses_stq,
  input         io_dis_uops_1_bits_is_sys_pc2epc,
  input         io_dis_uops_1_bits_is_unique,
  input         io_dis_uops_1_bits_flush_on_commit,
  input         io_dis_uops_1_bits_ldst_is_rs1,
  input  [5:0]  io_dis_uops_1_bits_ldst,
  input  [5:0]  io_dis_uops_1_bits_lrs1,
  input  [5:0]  io_dis_uops_1_bits_lrs2,
  input  [5:0]  io_dis_uops_1_bits_lrs3,
  input         io_dis_uops_1_bits_ldst_val,
  input  [1:0]  io_dis_uops_1_bits_dst_rtype,
  input  [1:0]  io_dis_uops_1_bits_lrs1_rtype,
  input  [1:0]  io_dis_uops_1_bits_lrs2_rtype,
  input         io_dis_uops_1_bits_frs3_en,
  input         io_dis_uops_1_bits_fp_val,
  input         io_dis_uops_1_bits_fp_single,
  input         io_dis_uops_1_bits_xcpt_pf_if,
  input         io_dis_uops_1_bits_xcpt_ae_if,
  input         io_dis_uops_1_bits_xcpt_ma_if,
  input         io_dis_uops_1_bits_bp_debug_if,
  input         io_dis_uops_1_bits_bp_xcpt_if,
  input  [1:0]  io_dis_uops_1_bits_debug_fsrc,
  input  [1:0]  io_dis_uops_1_bits_debug_tsrc,
  output        io_ll_wports_0_ready,
  input         io_ll_wports_0_valid,
  input  [6:0]  io_ll_wports_0_bits_uop_uopc,
  input  [31:0] io_ll_wports_0_bits_uop_inst,
  input  [31:0] io_ll_wports_0_bits_uop_debug_inst,
  input         io_ll_wports_0_bits_uop_is_rvc,
  input  [39:0] io_ll_wports_0_bits_uop_debug_pc,
  input  [2:0]  io_ll_wports_0_bits_uop_iq_type,
  input  [9:0]  io_ll_wports_0_bits_uop_fu_code,
  input  [3:0]  io_ll_wports_0_bits_uop_ctrl_br_type,
  input  [1:0]  io_ll_wports_0_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_ll_wports_0_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_ll_wports_0_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_ll_wports_0_bits_uop_ctrl_op_fcn,
  input         io_ll_wports_0_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_ll_wports_0_bits_uop_ctrl_csr_cmd,
  input         io_ll_wports_0_bits_uop_ctrl_is_load,
  input         io_ll_wports_0_bits_uop_ctrl_is_sta,
  input         io_ll_wports_0_bits_uop_ctrl_is_std,
  input  [1:0]  io_ll_wports_0_bits_uop_iw_state,
  input         io_ll_wports_0_bits_uop_iw_p1_poisoned,
  input         io_ll_wports_0_bits_uop_iw_p2_poisoned,
  input         io_ll_wports_0_bits_uop_is_br,
  input         io_ll_wports_0_bits_uop_is_jalr,
  input         io_ll_wports_0_bits_uop_is_jal,
  input         io_ll_wports_0_bits_uop_is_sfb,
  input  [11:0] io_ll_wports_0_bits_uop_br_mask,
  input  [3:0]  io_ll_wports_0_bits_uop_br_tag,
  input  [4:0]  io_ll_wports_0_bits_uop_ftq_idx,
  input         io_ll_wports_0_bits_uop_edge_inst,
  input  [5:0]  io_ll_wports_0_bits_uop_pc_lob,
  input         io_ll_wports_0_bits_uop_taken,
  input  [19:0] io_ll_wports_0_bits_uop_imm_packed,
  input  [11:0] io_ll_wports_0_bits_uop_csr_addr,
  input  [5:0]  io_ll_wports_0_bits_uop_rob_idx,
  input  [3:0]  io_ll_wports_0_bits_uop_ldq_idx,
  input  [3:0]  io_ll_wports_0_bits_uop_stq_idx,
  input  [1:0]  io_ll_wports_0_bits_uop_rxq_idx,
  input  [5:0]  io_ll_wports_0_bits_uop_pdst,
  input  [5:0]  io_ll_wports_0_bits_uop_prs1,
  input  [5:0]  io_ll_wports_0_bits_uop_prs2,
  input  [5:0]  io_ll_wports_0_bits_uop_prs3,
  input  [4:0]  io_ll_wports_0_bits_uop_ppred,
  input         io_ll_wports_0_bits_uop_prs1_busy,
  input         io_ll_wports_0_bits_uop_prs2_busy,
  input         io_ll_wports_0_bits_uop_prs3_busy,
  input         io_ll_wports_0_bits_uop_ppred_busy,
  input  [5:0]  io_ll_wports_0_bits_uop_stale_pdst,
  input         io_ll_wports_0_bits_uop_exception,
  input  [63:0] io_ll_wports_0_bits_uop_exc_cause,
  input         io_ll_wports_0_bits_uop_bypassable,
  input  [4:0]  io_ll_wports_0_bits_uop_mem_cmd,
  input  [1:0]  io_ll_wports_0_bits_uop_mem_size,
  input         io_ll_wports_0_bits_uop_mem_signed,
  input         io_ll_wports_0_bits_uop_is_fence,
  input         io_ll_wports_0_bits_uop_is_fencei,
  input         io_ll_wports_0_bits_uop_is_amo,
  input         io_ll_wports_0_bits_uop_uses_ldq,
  input         io_ll_wports_0_bits_uop_uses_stq,
  input         io_ll_wports_0_bits_uop_is_sys_pc2epc,
  input         io_ll_wports_0_bits_uop_is_unique,
  input         io_ll_wports_0_bits_uop_flush_on_commit,
  input         io_ll_wports_0_bits_uop_ldst_is_rs1,
  input  [5:0]  io_ll_wports_0_bits_uop_ldst,
  input  [5:0]  io_ll_wports_0_bits_uop_lrs1,
  input  [5:0]  io_ll_wports_0_bits_uop_lrs2,
  input  [5:0]  io_ll_wports_0_bits_uop_lrs3,
  input         io_ll_wports_0_bits_uop_ldst_val,
  input  [1:0]  io_ll_wports_0_bits_uop_dst_rtype,
  input  [1:0]  io_ll_wports_0_bits_uop_lrs1_rtype,
  input  [1:0]  io_ll_wports_0_bits_uop_lrs2_rtype,
  input         io_ll_wports_0_bits_uop_frs3_en,
  input         io_ll_wports_0_bits_uop_fp_val,
  input         io_ll_wports_0_bits_uop_fp_single,
  input         io_ll_wports_0_bits_uop_xcpt_pf_if,
  input         io_ll_wports_0_bits_uop_xcpt_ae_if,
  input         io_ll_wports_0_bits_uop_xcpt_ma_if,
  input         io_ll_wports_0_bits_uop_bp_debug_if,
  input         io_ll_wports_0_bits_uop_bp_xcpt_if,
  input  [1:0]  io_ll_wports_0_bits_uop_debug_fsrc,
  input  [1:0]  io_ll_wports_0_bits_uop_debug_tsrc,
  input  [64:0] io_ll_wports_0_bits_data,
  input         io_ll_wports_0_bits_predicated,
  input         io_ll_wports_0_bits_fflags_valid,
  input  [6:0]  io_ll_wports_0_bits_fflags_bits_uop_uopc,
  input  [31:0] io_ll_wports_0_bits_fflags_bits_uop_inst,
  input  [31:0] io_ll_wports_0_bits_fflags_bits_uop_debug_inst,
  input         io_ll_wports_0_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_ll_wports_0_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_ll_wports_0_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_ll_wports_0_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_ll_wports_0_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_ll_wports_0_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_ll_wports_0_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_ll_wports_0_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_ll_wports_0_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_ll_wports_0_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_ll_wports_0_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_ll_wports_0_bits_fflags_bits_uop_ctrl_is_load,
  input         io_ll_wports_0_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_ll_wports_0_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_ll_wports_0_bits_fflags_bits_uop_iw_state,
  input         io_ll_wports_0_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_ll_wports_0_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_ll_wports_0_bits_fflags_bits_uop_is_br,
  input         io_ll_wports_0_bits_fflags_bits_uop_is_jalr,
  input         io_ll_wports_0_bits_fflags_bits_uop_is_jal,
  input         io_ll_wports_0_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_ll_wports_0_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_ll_wports_0_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_ll_wports_0_bits_fflags_bits_uop_ftq_idx,
  input         io_ll_wports_0_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_ll_wports_0_bits_fflags_bits_uop_pc_lob,
  input         io_ll_wports_0_bits_fflags_bits_uop_taken,
  input  [19:0] io_ll_wports_0_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_ll_wports_0_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_ll_wports_0_bits_fflags_bits_uop_rob_idx,
  input  [3:0]  io_ll_wports_0_bits_fflags_bits_uop_ldq_idx,
  input  [3:0]  io_ll_wports_0_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_ll_wports_0_bits_fflags_bits_uop_rxq_idx,
  input  [5:0]  io_ll_wports_0_bits_fflags_bits_uop_pdst,
  input  [5:0]  io_ll_wports_0_bits_fflags_bits_uop_prs1,
  input  [5:0]  io_ll_wports_0_bits_fflags_bits_uop_prs2,
  input  [5:0]  io_ll_wports_0_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_ll_wports_0_bits_fflags_bits_uop_ppred,
  input         io_ll_wports_0_bits_fflags_bits_uop_prs1_busy,
  input         io_ll_wports_0_bits_fflags_bits_uop_prs2_busy,
  input         io_ll_wports_0_bits_fflags_bits_uop_prs3_busy,
  input         io_ll_wports_0_bits_fflags_bits_uop_ppred_busy,
  input  [5:0]  io_ll_wports_0_bits_fflags_bits_uop_stale_pdst,
  input         io_ll_wports_0_bits_fflags_bits_uop_exception,
  input  [63:0] io_ll_wports_0_bits_fflags_bits_uop_exc_cause,
  input         io_ll_wports_0_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_ll_wports_0_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_ll_wports_0_bits_fflags_bits_uop_mem_size,
  input         io_ll_wports_0_bits_fflags_bits_uop_mem_signed,
  input         io_ll_wports_0_bits_fflags_bits_uop_is_fence,
  input         io_ll_wports_0_bits_fflags_bits_uop_is_fencei,
  input         io_ll_wports_0_bits_fflags_bits_uop_is_amo,
  input         io_ll_wports_0_bits_fflags_bits_uop_uses_ldq,
  input         io_ll_wports_0_bits_fflags_bits_uop_uses_stq,
  input         io_ll_wports_0_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_ll_wports_0_bits_fflags_bits_uop_is_unique,
  input         io_ll_wports_0_bits_fflags_bits_uop_flush_on_commit,
  input         io_ll_wports_0_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_ll_wports_0_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_ll_wports_0_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_ll_wports_0_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_ll_wports_0_bits_fflags_bits_uop_lrs3,
  input         io_ll_wports_0_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_ll_wports_0_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_ll_wports_0_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_ll_wports_0_bits_fflags_bits_uop_lrs2_rtype,
  input         io_ll_wports_0_bits_fflags_bits_uop_frs3_en,
  input         io_ll_wports_0_bits_fflags_bits_uop_fp_val,
  input         io_ll_wports_0_bits_fflags_bits_uop_fp_single,
  input         io_ll_wports_0_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_ll_wports_0_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_ll_wports_0_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_ll_wports_0_bits_fflags_bits_uop_bp_debug_if,
  input         io_ll_wports_0_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_ll_wports_0_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_ll_wports_0_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_ll_wports_0_bits_fflags_bits_flags,
  output        io_from_int_ready,
  input         io_from_int_valid,
  input  [6:0]  io_from_int_bits_uop_uopc,
  input  [31:0] io_from_int_bits_uop_inst,
  input  [31:0] io_from_int_bits_uop_debug_inst,
  input         io_from_int_bits_uop_is_rvc,
  input  [39:0] io_from_int_bits_uop_debug_pc,
  input  [2:0]  io_from_int_bits_uop_iq_type,
  input  [9:0]  io_from_int_bits_uop_fu_code,
  input  [3:0]  io_from_int_bits_uop_ctrl_br_type,
  input  [1:0]  io_from_int_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_from_int_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_from_int_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_from_int_bits_uop_ctrl_op_fcn,
  input         io_from_int_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_from_int_bits_uop_ctrl_csr_cmd,
  input         io_from_int_bits_uop_ctrl_is_load,
  input         io_from_int_bits_uop_ctrl_is_sta,
  input         io_from_int_bits_uop_ctrl_is_std,
  input  [1:0]  io_from_int_bits_uop_iw_state,
  input         io_from_int_bits_uop_iw_p1_poisoned,
  input         io_from_int_bits_uop_iw_p2_poisoned,
  input         io_from_int_bits_uop_is_br,
  input         io_from_int_bits_uop_is_jalr,
  input         io_from_int_bits_uop_is_jal,
  input         io_from_int_bits_uop_is_sfb,
  input  [11:0] io_from_int_bits_uop_br_mask,
  input  [3:0]  io_from_int_bits_uop_br_tag,
  input  [4:0]  io_from_int_bits_uop_ftq_idx,
  input         io_from_int_bits_uop_edge_inst,
  input  [5:0]  io_from_int_bits_uop_pc_lob,
  input         io_from_int_bits_uop_taken,
  input  [19:0] io_from_int_bits_uop_imm_packed,
  input  [11:0] io_from_int_bits_uop_csr_addr,
  input  [5:0]  io_from_int_bits_uop_rob_idx,
  input  [3:0]  io_from_int_bits_uop_ldq_idx,
  input  [3:0]  io_from_int_bits_uop_stq_idx,
  input  [1:0]  io_from_int_bits_uop_rxq_idx,
  input  [5:0]  io_from_int_bits_uop_pdst,
  input  [5:0]  io_from_int_bits_uop_prs1,
  input  [5:0]  io_from_int_bits_uop_prs2,
  input  [5:0]  io_from_int_bits_uop_prs3,
  input  [4:0]  io_from_int_bits_uop_ppred,
  input         io_from_int_bits_uop_prs1_busy,
  input         io_from_int_bits_uop_prs2_busy,
  input         io_from_int_bits_uop_prs3_busy,
  input         io_from_int_bits_uop_ppred_busy,
  input  [5:0]  io_from_int_bits_uop_stale_pdst,
  input         io_from_int_bits_uop_exception,
  input  [63:0] io_from_int_bits_uop_exc_cause,
  input         io_from_int_bits_uop_bypassable,
  input  [4:0]  io_from_int_bits_uop_mem_cmd,
  input  [1:0]  io_from_int_bits_uop_mem_size,
  input         io_from_int_bits_uop_mem_signed,
  input         io_from_int_bits_uop_is_fence,
  input         io_from_int_bits_uop_is_fencei,
  input         io_from_int_bits_uop_is_amo,
  input         io_from_int_bits_uop_uses_ldq,
  input         io_from_int_bits_uop_uses_stq,
  input         io_from_int_bits_uop_is_sys_pc2epc,
  input         io_from_int_bits_uop_is_unique,
  input         io_from_int_bits_uop_flush_on_commit,
  input         io_from_int_bits_uop_ldst_is_rs1,
  input  [5:0]  io_from_int_bits_uop_ldst,
  input  [5:0]  io_from_int_bits_uop_lrs1,
  input  [5:0]  io_from_int_bits_uop_lrs2,
  input  [5:0]  io_from_int_bits_uop_lrs3,
  input         io_from_int_bits_uop_ldst_val,
  input  [1:0]  io_from_int_bits_uop_dst_rtype,
  input  [1:0]  io_from_int_bits_uop_lrs1_rtype,
  input  [1:0]  io_from_int_bits_uop_lrs2_rtype,
  input         io_from_int_bits_uop_frs3_en,
  input         io_from_int_bits_uop_fp_val,
  input         io_from_int_bits_uop_fp_single,
  input         io_from_int_bits_uop_xcpt_pf_if,
  input         io_from_int_bits_uop_xcpt_ae_if,
  input         io_from_int_bits_uop_xcpt_ma_if,
  input         io_from_int_bits_uop_bp_debug_if,
  input         io_from_int_bits_uop_bp_xcpt_if,
  input  [1:0]  io_from_int_bits_uop_debug_fsrc,
  input  [1:0]  io_from_int_bits_uop_debug_tsrc,
  input  [64:0] io_from_int_bits_data,
  input         io_from_int_bits_predicated,
  input         io_from_int_bits_fflags_valid,
  input  [6:0]  io_from_int_bits_fflags_bits_uop_uopc,
  input  [31:0] io_from_int_bits_fflags_bits_uop_inst,
  input  [31:0] io_from_int_bits_fflags_bits_uop_debug_inst,
  input         io_from_int_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_from_int_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_from_int_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_from_int_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_from_int_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_from_int_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_from_int_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_from_int_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_from_int_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_from_int_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_from_int_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_from_int_bits_fflags_bits_uop_ctrl_is_load,
  input         io_from_int_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_from_int_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_from_int_bits_fflags_bits_uop_iw_state,
  input         io_from_int_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_from_int_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_from_int_bits_fflags_bits_uop_is_br,
  input         io_from_int_bits_fflags_bits_uop_is_jalr,
  input         io_from_int_bits_fflags_bits_uop_is_jal,
  input         io_from_int_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_from_int_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_from_int_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_from_int_bits_fflags_bits_uop_ftq_idx,
  input         io_from_int_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_from_int_bits_fflags_bits_uop_pc_lob,
  input         io_from_int_bits_fflags_bits_uop_taken,
  input  [19:0] io_from_int_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_from_int_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_from_int_bits_fflags_bits_uop_rob_idx,
  input  [3:0]  io_from_int_bits_fflags_bits_uop_ldq_idx,
  input  [3:0]  io_from_int_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_from_int_bits_fflags_bits_uop_rxq_idx,
  input  [5:0]  io_from_int_bits_fflags_bits_uop_pdst,
  input  [5:0]  io_from_int_bits_fflags_bits_uop_prs1,
  input  [5:0]  io_from_int_bits_fflags_bits_uop_prs2,
  input  [5:0]  io_from_int_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_from_int_bits_fflags_bits_uop_ppred,
  input         io_from_int_bits_fflags_bits_uop_prs1_busy,
  input         io_from_int_bits_fflags_bits_uop_prs2_busy,
  input         io_from_int_bits_fflags_bits_uop_prs3_busy,
  input         io_from_int_bits_fflags_bits_uop_ppred_busy,
  input  [5:0]  io_from_int_bits_fflags_bits_uop_stale_pdst,
  input         io_from_int_bits_fflags_bits_uop_exception,
  input  [63:0] io_from_int_bits_fflags_bits_uop_exc_cause,
  input         io_from_int_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_from_int_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_from_int_bits_fflags_bits_uop_mem_size,
  input         io_from_int_bits_fflags_bits_uop_mem_signed,
  input         io_from_int_bits_fflags_bits_uop_is_fence,
  input         io_from_int_bits_fflags_bits_uop_is_fencei,
  input         io_from_int_bits_fflags_bits_uop_is_amo,
  input         io_from_int_bits_fflags_bits_uop_uses_ldq,
  input         io_from_int_bits_fflags_bits_uop_uses_stq,
  input         io_from_int_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_from_int_bits_fflags_bits_uop_is_unique,
  input         io_from_int_bits_fflags_bits_uop_flush_on_commit,
  input         io_from_int_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_from_int_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_from_int_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_from_int_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_from_int_bits_fflags_bits_uop_lrs3,
  input         io_from_int_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_from_int_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_from_int_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_from_int_bits_fflags_bits_uop_lrs2_rtype,
  input         io_from_int_bits_fflags_bits_uop_frs3_en,
  input         io_from_int_bits_fflags_bits_uop_fp_val,
  input         io_from_int_bits_fflags_bits_uop_fp_single,
  input         io_from_int_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_from_int_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_from_int_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_from_int_bits_fflags_bits_uop_bp_debug_if,
  input         io_from_int_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_from_int_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_from_int_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_from_int_bits_fflags_bits_flags,
  input         io_to_sdq_ready,
  output        io_to_sdq_valid,
  output [6:0]  io_to_sdq_bits_uop_uopc,
  output [31:0] io_to_sdq_bits_uop_inst,
  output [31:0] io_to_sdq_bits_uop_debug_inst,
  output        io_to_sdq_bits_uop_is_rvc,
  output [39:0] io_to_sdq_bits_uop_debug_pc,
  output [2:0]  io_to_sdq_bits_uop_iq_type,
  output [9:0]  io_to_sdq_bits_uop_fu_code,
  output [3:0]  io_to_sdq_bits_uop_ctrl_br_type,
  output [1:0]  io_to_sdq_bits_uop_ctrl_op1_sel,
  output [2:0]  io_to_sdq_bits_uop_ctrl_op2_sel,
  output [2:0]  io_to_sdq_bits_uop_ctrl_imm_sel,
  output [3:0]  io_to_sdq_bits_uop_ctrl_op_fcn,
  output        io_to_sdq_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_to_sdq_bits_uop_ctrl_csr_cmd,
  output        io_to_sdq_bits_uop_ctrl_is_load,
  output        io_to_sdq_bits_uop_ctrl_is_sta,
  output        io_to_sdq_bits_uop_ctrl_is_std,
  output [1:0]  io_to_sdq_bits_uop_iw_state,
  output        io_to_sdq_bits_uop_iw_p1_poisoned,
  output        io_to_sdq_bits_uop_iw_p2_poisoned,
  output        io_to_sdq_bits_uop_is_br,
  output        io_to_sdq_bits_uop_is_jalr,
  output        io_to_sdq_bits_uop_is_jal,
  output        io_to_sdq_bits_uop_is_sfb,
  output [11:0] io_to_sdq_bits_uop_br_mask,
  output [3:0]  io_to_sdq_bits_uop_br_tag,
  output [4:0]  io_to_sdq_bits_uop_ftq_idx,
  output        io_to_sdq_bits_uop_edge_inst,
  output [5:0]  io_to_sdq_bits_uop_pc_lob,
  output        io_to_sdq_bits_uop_taken,
  output [19:0] io_to_sdq_bits_uop_imm_packed,
  output [11:0] io_to_sdq_bits_uop_csr_addr,
  output [5:0]  io_to_sdq_bits_uop_rob_idx,
  output [3:0]  io_to_sdq_bits_uop_ldq_idx,
  output [3:0]  io_to_sdq_bits_uop_stq_idx,
  output [1:0]  io_to_sdq_bits_uop_rxq_idx,
  output [5:0]  io_to_sdq_bits_uop_pdst,
  output [5:0]  io_to_sdq_bits_uop_prs1,
  output [5:0]  io_to_sdq_bits_uop_prs2,
  output [5:0]  io_to_sdq_bits_uop_prs3,
  output [4:0]  io_to_sdq_bits_uop_ppred,
  output        io_to_sdq_bits_uop_prs1_busy,
  output        io_to_sdq_bits_uop_prs2_busy,
  output        io_to_sdq_bits_uop_prs3_busy,
  output        io_to_sdq_bits_uop_ppred_busy,
  output [5:0]  io_to_sdq_bits_uop_stale_pdst,
  output        io_to_sdq_bits_uop_exception,
  output [63:0] io_to_sdq_bits_uop_exc_cause,
  output        io_to_sdq_bits_uop_bypassable,
  output [4:0]  io_to_sdq_bits_uop_mem_cmd,
  output [1:0]  io_to_sdq_bits_uop_mem_size,
  output        io_to_sdq_bits_uop_mem_signed,
  output        io_to_sdq_bits_uop_is_fence,
  output        io_to_sdq_bits_uop_is_fencei,
  output        io_to_sdq_bits_uop_is_amo,
  output        io_to_sdq_bits_uop_uses_ldq,
  output        io_to_sdq_bits_uop_uses_stq,
  output        io_to_sdq_bits_uop_is_sys_pc2epc,
  output        io_to_sdq_bits_uop_is_unique,
  output        io_to_sdq_bits_uop_flush_on_commit,
  output        io_to_sdq_bits_uop_ldst_is_rs1,
  output [5:0]  io_to_sdq_bits_uop_ldst,
  output [5:0]  io_to_sdq_bits_uop_lrs1,
  output [5:0]  io_to_sdq_bits_uop_lrs2,
  output [5:0]  io_to_sdq_bits_uop_lrs3,
  output        io_to_sdq_bits_uop_ldst_val,
  output [1:0]  io_to_sdq_bits_uop_dst_rtype,
  output [1:0]  io_to_sdq_bits_uop_lrs1_rtype,
  output [1:0]  io_to_sdq_bits_uop_lrs2_rtype,
  output        io_to_sdq_bits_uop_frs3_en,
  output        io_to_sdq_bits_uop_fp_val,
  output        io_to_sdq_bits_uop_fp_single,
  output        io_to_sdq_bits_uop_xcpt_pf_if,
  output        io_to_sdq_bits_uop_xcpt_ae_if,
  output        io_to_sdq_bits_uop_xcpt_ma_if,
  output        io_to_sdq_bits_uop_bp_debug_if,
  output        io_to_sdq_bits_uop_bp_xcpt_if,
  output [1:0]  io_to_sdq_bits_uop_debug_fsrc,
  output [1:0]  io_to_sdq_bits_uop_debug_tsrc,
  output [63:0] io_to_sdq_bits_data,
  output        io_to_sdq_bits_predicated,
  output        io_to_sdq_bits_fflags_valid,
  output [6:0]  io_to_sdq_bits_fflags_bits_uop_uopc,
  output [31:0] io_to_sdq_bits_fflags_bits_uop_inst,
  output [31:0] io_to_sdq_bits_fflags_bits_uop_debug_inst,
  output        io_to_sdq_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_to_sdq_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_to_sdq_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_to_sdq_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_to_sdq_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_to_sdq_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_to_sdq_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_to_sdq_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_to_sdq_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_to_sdq_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_to_sdq_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_to_sdq_bits_fflags_bits_uop_ctrl_is_load,
  output        io_to_sdq_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_to_sdq_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_to_sdq_bits_fflags_bits_uop_iw_state,
  output        io_to_sdq_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_to_sdq_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_to_sdq_bits_fflags_bits_uop_is_br,
  output        io_to_sdq_bits_fflags_bits_uop_is_jalr,
  output        io_to_sdq_bits_fflags_bits_uop_is_jal,
  output        io_to_sdq_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_to_sdq_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_to_sdq_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_to_sdq_bits_fflags_bits_uop_ftq_idx,
  output        io_to_sdq_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_to_sdq_bits_fflags_bits_uop_pc_lob,
  output        io_to_sdq_bits_fflags_bits_uop_taken,
  output [19:0] io_to_sdq_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_to_sdq_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_to_sdq_bits_fflags_bits_uop_rob_idx,
  output [3:0]  io_to_sdq_bits_fflags_bits_uop_ldq_idx,
  output [3:0]  io_to_sdq_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_to_sdq_bits_fflags_bits_uop_rxq_idx,
  output [5:0]  io_to_sdq_bits_fflags_bits_uop_pdst,
  output [5:0]  io_to_sdq_bits_fflags_bits_uop_prs1,
  output [5:0]  io_to_sdq_bits_fflags_bits_uop_prs2,
  output [5:0]  io_to_sdq_bits_fflags_bits_uop_prs3,
  output [4:0]  io_to_sdq_bits_fflags_bits_uop_ppred,
  output        io_to_sdq_bits_fflags_bits_uop_prs1_busy,
  output        io_to_sdq_bits_fflags_bits_uop_prs2_busy,
  output        io_to_sdq_bits_fflags_bits_uop_prs3_busy,
  output        io_to_sdq_bits_fflags_bits_uop_ppred_busy,
  output [5:0]  io_to_sdq_bits_fflags_bits_uop_stale_pdst,
  output        io_to_sdq_bits_fflags_bits_uop_exception,
  output [63:0] io_to_sdq_bits_fflags_bits_uop_exc_cause,
  output        io_to_sdq_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_to_sdq_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_to_sdq_bits_fflags_bits_uop_mem_size,
  output        io_to_sdq_bits_fflags_bits_uop_mem_signed,
  output        io_to_sdq_bits_fflags_bits_uop_is_fence,
  output        io_to_sdq_bits_fflags_bits_uop_is_fencei,
  output        io_to_sdq_bits_fflags_bits_uop_is_amo,
  output        io_to_sdq_bits_fflags_bits_uop_uses_ldq,
  output        io_to_sdq_bits_fflags_bits_uop_uses_stq,
  output        io_to_sdq_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_to_sdq_bits_fflags_bits_uop_is_unique,
  output        io_to_sdq_bits_fflags_bits_uop_flush_on_commit,
  output        io_to_sdq_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_to_sdq_bits_fflags_bits_uop_ldst,
  output [5:0]  io_to_sdq_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_to_sdq_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_to_sdq_bits_fflags_bits_uop_lrs3,
  output        io_to_sdq_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_to_sdq_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_to_sdq_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_to_sdq_bits_fflags_bits_uop_lrs2_rtype,
  output        io_to_sdq_bits_fflags_bits_uop_frs3_en,
  output        io_to_sdq_bits_fflags_bits_uop_fp_val,
  output        io_to_sdq_bits_fflags_bits_uop_fp_single,
  output        io_to_sdq_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_to_sdq_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_to_sdq_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_to_sdq_bits_fflags_bits_uop_bp_debug_if,
  output        io_to_sdq_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_to_sdq_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_to_sdq_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_to_sdq_bits_fflags_bits_flags,
  input         io_to_int_ready,
  output        io_to_int_valid,
  output [6:0]  io_to_int_bits_uop_uopc,
  output [31:0] io_to_int_bits_uop_inst,
  output [31:0] io_to_int_bits_uop_debug_inst,
  output        io_to_int_bits_uop_is_rvc,
  output [39:0] io_to_int_bits_uop_debug_pc,
  output [2:0]  io_to_int_bits_uop_iq_type,
  output [9:0]  io_to_int_bits_uop_fu_code,
  output [3:0]  io_to_int_bits_uop_ctrl_br_type,
  output [1:0]  io_to_int_bits_uop_ctrl_op1_sel,
  output [2:0]  io_to_int_bits_uop_ctrl_op2_sel,
  output [2:0]  io_to_int_bits_uop_ctrl_imm_sel,
  output [3:0]  io_to_int_bits_uop_ctrl_op_fcn,
  output        io_to_int_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_to_int_bits_uop_ctrl_csr_cmd,
  output        io_to_int_bits_uop_ctrl_is_load,
  output        io_to_int_bits_uop_ctrl_is_sta,
  output        io_to_int_bits_uop_ctrl_is_std,
  output [1:0]  io_to_int_bits_uop_iw_state,
  output        io_to_int_bits_uop_iw_p1_poisoned,
  output        io_to_int_bits_uop_iw_p2_poisoned,
  output        io_to_int_bits_uop_is_br,
  output        io_to_int_bits_uop_is_jalr,
  output        io_to_int_bits_uop_is_jal,
  output        io_to_int_bits_uop_is_sfb,
  output [11:0] io_to_int_bits_uop_br_mask,
  output [3:0]  io_to_int_bits_uop_br_tag,
  output [4:0]  io_to_int_bits_uop_ftq_idx,
  output        io_to_int_bits_uop_edge_inst,
  output [5:0]  io_to_int_bits_uop_pc_lob,
  output        io_to_int_bits_uop_taken,
  output [19:0] io_to_int_bits_uop_imm_packed,
  output [11:0] io_to_int_bits_uop_csr_addr,
  output [5:0]  io_to_int_bits_uop_rob_idx,
  output [3:0]  io_to_int_bits_uop_ldq_idx,
  output [3:0]  io_to_int_bits_uop_stq_idx,
  output [1:0]  io_to_int_bits_uop_rxq_idx,
  output [5:0]  io_to_int_bits_uop_pdst,
  output [5:0]  io_to_int_bits_uop_prs1,
  output [5:0]  io_to_int_bits_uop_prs2,
  output [5:0]  io_to_int_bits_uop_prs3,
  output [4:0]  io_to_int_bits_uop_ppred,
  output        io_to_int_bits_uop_prs1_busy,
  output        io_to_int_bits_uop_prs2_busy,
  output        io_to_int_bits_uop_prs3_busy,
  output        io_to_int_bits_uop_ppred_busy,
  output [5:0]  io_to_int_bits_uop_stale_pdst,
  output        io_to_int_bits_uop_exception,
  output [63:0] io_to_int_bits_uop_exc_cause,
  output        io_to_int_bits_uop_bypassable,
  output [4:0]  io_to_int_bits_uop_mem_cmd,
  output [1:0]  io_to_int_bits_uop_mem_size,
  output        io_to_int_bits_uop_mem_signed,
  output        io_to_int_bits_uop_is_fence,
  output        io_to_int_bits_uop_is_fencei,
  output        io_to_int_bits_uop_is_amo,
  output        io_to_int_bits_uop_uses_ldq,
  output        io_to_int_bits_uop_uses_stq,
  output        io_to_int_bits_uop_is_sys_pc2epc,
  output        io_to_int_bits_uop_is_unique,
  output        io_to_int_bits_uop_flush_on_commit,
  output        io_to_int_bits_uop_ldst_is_rs1,
  output [5:0]  io_to_int_bits_uop_ldst,
  output [5:0]  io_to_int_bits_uop_lrs1,
  output [5:0]  io_to_int_bits_uop_lrs2,
  output [5:0]  io_to_int_bits_uop_lrs3,
  output        io_to_int_bits_uop_ldst_val,
  output [1:0]  io_to_int_bits_uop_dst_rtype,
  output [1:0]  io_to_int_bits_uop_lrs1_rtype,
  output [1:0]  io_to_int_bits_uop_lrs2_rtype,
  output        io_to_int_bits_uop_frs3_en,
  output        io_to_int_bits_uop_fp_val,
  output        io_to_int_bits_uop_fp_single,
  output        io_to_int_bits_uop_xcpt_pf_if,
  output        io_to_int_bits_uop_xcpt_ae_if,
  output        io_to_int_bits_uop_xcpt_ma_if,
  output        io_to_int_bits_uop_bp_debug_if,
  output        io_to_int_bits_uop_bp_xcpt_if,
  output [1:0]  io_to_int_bits_uop_debug_fsrc,
  output [1:0]  io_to_int_bits_uop_debug_tsrc,
  output [63:0] io_to_int_bits_data,
  output        io_to_int_bits_predicated,
  output        io_to_int_bits_fflags_valid,
  output [6:0]  io_to_int_bits_fflags_bits_uop_uopc,
  output [31:0] io_to_int_bits_fflags_bits_uop_inst,
  output [31:0] io_to_int_bits_fflags_bits_uop_debug_inst,
  output        io_to_int_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_to_int_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_to_int_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_to_int_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_to_int_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_to_int_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_to_int_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_to_int_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_to_int_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_to_int_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_to_int_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_to_int_bits_fflags_bits_uop_ctrl_is_load,
  output        io_to_int_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_to_int_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_to_int_bits_fflags_bits_uop_iw_state,
  output        io_to_int_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_to_int_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_to_int_bits_fflags_bits_uop_is_br,
  output        io_to_int_bits_fflags_bits_uop_is_jalr,
  output        io_to_int_bits_fflags_bits_uop_is_jal,
  output        io_to_int_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_to_int_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_to_int_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_to_int_bits_fflags_bits_uop_ftq_idx,
  output        io_to_int_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_to_int_bits_fflags_bits_uop_pc_lob,
  output        io_to_int_bits_fflags_bits_uop_taken,
  output [19:0] io_to_int_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_to_int_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_to_int_bits_fflags_bits_uop_rob_idx,
  output [3:0]  io_to_int_bits_fflags_bits_uop_ldq_idx,
  output [3:0]  io_to_int_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_to_int_bits_fflags_bits_uop_rxq_idx,
  output [5:0]  io_to_int_bits_fflags_bits_uop_pdst,
  output [5:0]  io_to_int_bits_fflags_bits_uop_prs1,
  output [5:0]  io_to_int_bits_fflags_bits_uop_prs2,
  output [5:0]  io_to_int_bits_fflags_bits_uop_prs3,
  output [4:0]  io_to_int_bits_fflags_bits_uop_ppred,
  output        io_to_int_bits_fflags_bits_uop_prs1_busy,
  output        io_to_int_bits_fflags_bits_uop_prs2_busy,
  output        io_to_int_bits_fflags_bits_uop_prs3_busy,
  output        io_to_int_bits_fflags_bits_uop_ppred_busy,
  output [5:0]  io_to_int_bits_fflags_bits_uop_stale_pdst,
  output        io_to_int_bits_fflags_bits_uop_exception,
  output [63:0] io_to_int_bits_fflags_bits_uop_exc_cause,
  output        io_to_int_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_to_int_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_to_int_bits_fflags_bits_uop_mem_size,
  output        io_to_int_bits_fflags_bits_uop_mem_signed,
  output        io_to_int_bits_fflags_bits_uop_is_fence,
  output        io_to_int_bits_fflags_bits_uop_is_fencei,
  output        io_to_int_bits_fflags_bits_uop_is_amo,
  output        io_to_int_bits_fflags_bits_uop_uses_ldq,
  output        io_to_int_bits_fflags_bits_uop_uses_stq,
  output        io_to_int_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_to_int_bits_fflags_bits_uop_is_unique,
  output        io_to_int_bits_fflags_bits_uop_flush_on_commit,
  output        io_to_int_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_to_int_bits_fflags_bits_uop_ldst,
  output [5:0]  io_to_int_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_to_int_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_to_int_bits_fflags_bits_uop_lrs3,
  output        io_to_int_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_to_int_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_to_int_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_to_int_bits_fflags_bits_uop_lrs2_rtype,
  output        io_to_int_bits_fflags_bits_uop_frs3_en,
  output        io_to_int_bits_fflags_bits_uop_fp_val,
  output        io_to_int_bits_fflags_bits_uop_fp_single,
  output        io_to_int_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_to_int_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_to_int_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_to_int_bits_fflags_bits_uop_bp_debug_if,
  output        io_to_int_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_to_int_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_to_int_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_to_int_bits_fflags_bits_flags,
  output        io_wakeups_0_valid,
  output [6:0]  io_wakeups_0_bits_uop_uopc,
  output [31:0] io_wakeups_0_bits_uop_inst,
  output [31:0] io_wakeups_0_bits_uop_debug_inst,
  output        io_wakeups_0_bits_uop_is_rvc,
  output [39:0] io_wakeups_0_bits_uop_debug_pc,
  output [2:0]  io_wakeups_0_bits_uop_iq_type,
  output [9:0]  io_wakeups_0_bits_uop_fu_code,
  output [3:0]  io_wakeups_0_bits_uop_ctrl_br_type,
  output [1:0]  io_wakeups_0_bits_uop_ctrl_op1_sel,
  output [2:0]  io_wakeups_0_bits_uop_ctrl_op2_sel,
  output [2:0]  io_wakeups_0_bits_uop_ctrl_imm_sel,
  output [3:0]  io_wakeups_0_bits_uop_ctrl_op_fcn,
  output        io_wakeups_0_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_wakeups_0_bits_uop_ctrl_csr_cmd,
  output        io_wakeups_0_bits_uop_ctrl_is_load,
  output        io_wakeups_0_bits_uop_ctrl_is_sta,
  output        io_wakeups_0_bits_uop_ctrl_is_std,
  output [1:0]  io_wakeups_0_bits_uop_iw_state,
  output        io_wakeups_0_bits_uop_iw_p1_poisoned,
  output        io_wakeups_0_bits_uop_iw_p2_poisoned,
  output        io_wakeups_0_bits_uop_is_br,
  output        io_wakeups_0_bits_uop_is_jalr,
  output        io_wakeups_0_bits_uop_is_jal,
  output        io_wakeups_0_bits_uop_is_sfb,
  output [11:0] io_wakeups_0_bits_uop_br_mask,
  output [3:0]  io_wakeups_0_bits_uop_br_tag,
  output [4:0]  io_wakeups_0_bits_uop_ftq_idx,
  output        io_wakeups_0_bits_uop_edge_inst,
  output [5:0]  io_wakeups_0_bits_uop_pc_lob,
  output        io_wakeups_0_bits_uop_taken,
  output [19:0] io_wakeups_0_bits_uop_imm_packed,
  output [11:0] io_wakeups_0_bits_uop_csr_addr,
  output [5:0]  io_wakeups_0_bits_uop_rob_idx,
  output [3:0]  io_wakeups_0_bits_uop_ldq_idx,
  output [3:0]  io_wakeups_0_bits_uop_stq_idx,
  output [1:0]  io_wakeups_0_bits_uop_rxq_idx,
  output [5:0]  io_wakeups_0_bits_uop_pdst,
  output [5:0]  io_wakeups_0_bits_uop_prs1,
  output [5:0]  io_wakeups_0_bits_uop_prs2,
  output [5:0]  io_wakeups_0_bits_uop_prs3,
  output [4:0]  io_wakeups_0_bits_uop_ppred,
  output        io_wakeups_0_bits_uop_prs1_busy,
  output        io_wakeups_0_bits_uop_prs2_busy,
  output        io_wakeups_0_bits_uop_prs3_busy,
  output        io_wakeups_0_bits_uop_ppred_busy,
  output [5:0]  io_wakeups_0_bits_uop_stale_pdst,
  output        io_wakeups_0_bits_uop_exception,
  output [63:0] io_wakeups_0_bits_uop_exc_cause,
  output        io_wakeups_0_bits_uop_bypassable,
  output [4:0]  io_wakeups_0_bits_uop_mem_cmd,
  output [1:0]  io_wakeups_0_bits_uop_mem_size,
  output        io_wakeups_0_bits_uop_mem_signed,
  output        io_wakeups_0_bits_uop_is_fence,
  output        io_wakeups_0_bits_uop_is_fencei,
  output        io_wakeups_0_bits_uop_is_amo,
  output        io_wakeups_0_bits_uop_uses_ldq,
  output        io_wakeups_0_bits_uop_uses_stq,
  output        io_wakeups_0_bits_uop_is_sys_pc2epc,
  output        io_wakeups_0_bits_uop_is_unique,
  output        io_wakeups_0_bits_uop_flush_on_commit,
  output        io_wakeups_0_bits_uop_ldst_is_rs1,
  output [5:0]  io_wakeups_0_bits_uop_ldst,
  output [5:0]  io_wakeups_0_bits_uop_lrs1,
  output [5:0]  io_wakeups_0_bits_uop_lrs2,
  output [5:0]  io_wakeups_0_bits_uop_lrs3,
  output        io_wakeups_0_bits_uop_ldst_val,
  output [1:0]  io_wakeups_0_bits_uop_dst_rtype,
  output [1:0]  io_wakeups_0_bits_uop_lrs1_rtype,
  output [1:0]  io_wakeups_0_bits_uop_lrs2_rtype,
  output        io_wakeups_0_bits_uop_frs3_en,
  output        io_wakeups_0_bits_uop_fp_val,
  output        io_wakeups_0_bits_uop_fp_single,
  output        io_wakeups_0_bits_uop_xcpt_pf_if,
  output        io_wakeups_0_bits_uop_xcpt_ae_if,
  output        io_wakeups_0_bits_uop_xcpt_ma_if,
  output        io_wakeups_0_bits_uop_bp_debug_if,
  output        io_wakeups_0_bits_uop_bp_xcpt_if,
  output [1:0]  io_wakeups_0_bits_uop_debug_fsrc,
  output [1:0]  io_wakeups_0_bits_uop_debug_tsrc,
  output [64:0] io_wakeups_0_bits_data,
  output        io_wakeups_0_bits_predicated,
  output        io_wakeups_0_bits_fflags_valid,
  output [6:0]  io_wakeups_0_bits_fflags_bits_uop_uopc,
  output [31:0] io_wakeups_0_bits_fflags_bits_uop_inst,
  output [31:0] io_wakeups_0_bits_fflags_bits_uop_debug_inst,
  output        io_wakeups_0_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_wakeups_0_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_wakeups_0_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_wakeups_0_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_wakeups_0_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_wakeups_0_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_wakeups_0_bits_fflags_bits_uop_ctrl_is_load,
  output        io_wakeups_0_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_wakeups_0_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_wakeups_0_bits_fflags_bits_uop_iw_state,
  output        io_wakeups_0_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_wakeups_0_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_wakeups_0_bits_fflags_bits_uop_is_br,
  output        io_wakeups_0_bits_fflags_bits_uop_is_jalr,
  output        io_wakeups_0_bits_fflags_bits_uop_is_jal,
  output        io_wakeups_0_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_wakeups_0_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_wakeups_0_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_wakeups_0_bits_fflags_bits_uop_ftq_idx,
  output        io_wakeups_0_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_wakeups_0_bits_fflags_bits_uop_pc_lob,
  output        io_wakeups_0_bits_fflags_bits_uop_taken,
  output [19:0] io_wakeups_0_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_wakeups_0_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_wakeups_0_bits_fflags_bits_uop_rob_idx,
  output [3:0]  io_wakeups_0_bits_fflags_bits_uop_ldq_idx,
  output [3:0]  io_wakeups_0_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_wakeups_0_bits_fflags_bits_uop_rxq_idx,
  output [5:0]  io_wakeups_0_bits_fflags_bits_uop_pdst,
  output [5:0]  io_wakeups_0_bits_fflags_bits_uop_prs1,
  output [5:0]  io_wakeups_0_bits_fflags_bits_uop_prs2,
  output [5:0]  io_wakeups_0_bits_fflags_bits_uop_prs3,
  output [4:0]  io_wakeups_0_bits_fflags_bits_uop_ppred,
  output        io_wakeups_0_bits_fflags_bits_uop_prs1_busy,
  output        io_wakeups_0_bits_fflags_bits_uop_prs2_busy,
  output        io_wakeups_0_bits_fflags_bits_uop_prs3_busy,
  output        io_wakeups_0_bits_fflags_bits_uop_ppred_busy,
  output [5:0]  io_wakeups_0_bits_fflags_bits_uop_stale_pdst,
  output        io_wakeups_0_bits_fflags_bits_uop_exception,
  output [63:0] io_wakeups_0_bits_fflags_bits_uop_exc_cause,
  output        io_wakeups_0_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_wakeups_0_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_wakeups_0_bits_fflags_bits_uop_mem_size,
  output        io_wakeups_0_bits_fflags_bits_uop_mem_signed,
  output        io_wakeups_0_bits_fflags_bits_uop_is_fence,
  output        io_wakeups_0_bits_fflags_bits_uop_is_fencei,
  output        io_wakeups_0_bits_fflags_bits_uop_is_amo,
  output        io_wakeups_0_bits_fflags_bits_uop_uses_ldq,
  output        io_wakeups_0_bits_fflags_bits_uop_uses_stq,
  output        io_wakeups_0_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_wakeups_0_bits_fflags_bits_uop_is_unique,
  output        io_wakeups_0_bits_fflags_bits_uop_flush_on_commit,
  output        io_wakeups_0_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_wakeups_0_bits_fflags_bits_uop_ldst,
  output [5:0]  io_wakeups_0_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_wakeups_0_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_wakeups_0_bits_fflags_bits_uop_lrs3,
  output        io_wakeups_0_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_wakeups_0_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_wakeups_0_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_wakeups_0_bits_fflags_bits_uop_lrs2_rtype,
  output        io_wakeups_0_bits_fflags_bits_uop_frs3_en,
  output        io_wakeups_0_bits_fflags_bits_uop_fp_val,
  output        io_wakeups_0_bits_fflags_bits_uop_fp_single,
  output        io_wakeups_0_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_wakeups_0_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_wakeups_0_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_wakeups_0_bits_fflags_bits_uop_bp_debug_if,
  output        io_wakeups_0_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_wakeups_0_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_wakeups_0_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_wakeups_0_bits_fflags_bits_flags,
  output        io_wakeups_1_valid,
  output [6:0]  io_wakeups_1_bits_uop_uopc,
  output [31:0] io_wakeups_1_bits_uop_inst,
  output [31:0] io_wakeups_1_bits_uop_debug_inst,
  output        io_wakeups_1_bits_uop_is_rvc,
  output [39:0] io_wakeups_1_bits_uop_debug_pc,
  output [2:0]  io_wakeups_1_bits_uop_iq_type,
  output [9:0]  io_wakeups_1_bits_uop_fu_code,
  output [3:0]  io_wakeups_1_bits_uop_ctrl_br_type,
  output [1:0]  io_wakeups_1_bits_uop_ctrl_op1_sel,
  output [2:0]  io_wakeups_1_bits_uop_ctrl_op2_sel,
  output [2:0]  io_wakeups_1_bits_uop_ctrl_imm_sel,
  output [3:0]  io_wakeups_1_bits_uop_ctrl_op_fcn,
  output        io_wakeups_1_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_wakeups_1_bits_uop_ctrl_csr_cmd,
  output        io_wakeups_1_bits_uop_ctrl_is_load,
  output        io_wakeups_1_bits_uop_ctrl_is_sta,
  output        io_wakeups_1_bits_uop_ctrl_is_std,
  output [1:0]  io_wakeups_1_bits_uop_iw_state,
  output        io_wakeups_1_bits_uop_iw_p1_poisoned,
  output        io_wakeups_1_bits_uop_iw_p2_poisoned,
  output        io_wakeups_1_bits_uop_is_br,
  output        io_wakeups_1_bits_uop_is_jalr,
  output        io_wakeups_1_bits_uop_is_jal,
  output        io_wakeups_1_bits_uop_is_sfb,
  output [11:0] io_wakeups_1_bits_uop_br_mask,
  output [3:0]  io_wakeups_1_bits_uop_br_tag,
  output [4:0]  io_wakeups_1_bits_uop_ftq_idx,
  output        io_wakeups_1_bits_uop_edge_inst,
  output [5:0]  io_wakeups_1_bits_uop_pc_lob,
  output        io_wakeups_1_bits_uop_taken,
  output [19:0] io_wakeups_1_bits_uop_imm_packed,
  output [11:0] io_wakeups_1_bits_uop_csr_addr,
  output [5:0]  io_wakeups_1_bits_uop_rob_idx,
  output [3:0]  io_wakeups_1_bits_uop_ldq_idx,
  output [3:0]  io_wakeups_1_bits_uop_stq_idx,
  output [1:0]  io_wakeups_1_bits_uop_rxq_idx,
  output [5:0]  io_wakeups_1_bits_uop_pdst,
  output [5:0]  io_wakeups_1_bits_uop_prs1,
  output [5:0]  io_wakeups_1_bits_uop_prs2,
  output [5:0]  io_wakeups_1_bits_uop_prs3,
  output [4:0]  io_wakeups_1_bits_uop_ppred,
  output        io_wakeups_1_bits_uop_prs1_busy,
  output        io_wakeups_1_bits_uop_prs2_busy,
  output        io_wakeups_1_bits_uop_prs3_busy,
  output        io_wakeups_1_bits_uop_ppred_busy,
  output [5:0]  io_wakeups_1_bits_uop_stale_pdst,
  output        io_wakeups_1_bits_uop_exception,
  output [63:0] io_wakeups_1_bits_uop_exc_cause,
  output        io_wakeups_1_bits_uop_bypassable,
  output [4:0]  io_wakeups_1_bits_uop_mem_cmd,
  output [1:0]  io_wakeups_1_bits_uop_mem_size,
  output        io_wakeups_1_bits_uop_mem_signed,
  output        io_wakeups_1_bits_uop_is_fence,
  output        io_wakeups_1_bits_uop_is_fencei,
  output        io_wakeups_1_bits_uop_is_amo,
  output        io_wakeups_1_bits_uop_uses_ldq,
  output        io_wakeups_1_bits_uop_uses_stq,
  output        io_wakeups_1_bits_uop_is_sys_pc2epc,
  output        io_wakeups_1_bits_uop_is_unique,
  output        io_wakeups_1_bits_uop_flush_on_commit,
  output        io_wakeups_1_bits_uop_ldst_is_rs1,
  output [5:0]  io_wakeups_1_bits_uop_ldst,
  output [5:0]  io_wakeups_1_bits_uop_lrs1,
  output [5:0]  io_wakeups_1_bits_uop_lrs2,
  output [5:0]  io_wakeups_1_bits_uop_lrs3,
  output        io_wakeups_1_bits_uop_ldst_val,
  output [1:0]  io_wakeups_1_bits_uop_dst_rtype,
  output [1:0]  io_wakeups_1_bits_uop_lrs1_rtype,
  output [1:0]  io_wakeups_1_bits_uop_lrs2_rtype,
  output        io_wakeups_1_bits_uop_frs3_en,
  output        io_wakeups_1_bits_uop_fp_val,
  output        io_wakeups_1_bits_uop_fp_single,
  output        io_wakeups_1_bits_uop_xcpt_pf_if,
  output        io_wakeups_1_bits_uop_xcpt_ae_if,
  output        io_wakeups_1_bits_uop_xcpt_ma_if,
  output        io_wakeups_1_bits_uop_bp_debug_if,
  output        io_wakeups_1_bits_uop_bp_xcpt_if,
  output [1:0]  io_wakeups_1_bits_uop_debug_fsrc,
  output [1:0]  io_wakeups_1_bits_uop_debug_tsrc,
  output [64:0] io_wakeups_1_bits_data,
  output        io_wakeups_1_bits_predicated,
  output        io_wakeups_1_bits_fflags_valid,
  output [6:0]  io_wakeups_1_bits_fflags_bits_uop_uopc,
  output [31:0] io_wakeups_1_bits_fflags_bits_uop_inst,
  output [31:0] io_wakeups_1_bits_fflags_bits_uop_debug_inst,
  output        io_wakeups_1_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_wakeups_1_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_wakeups_1_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_wakeups_1_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_wakeups_1_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_wakeups_1_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_wakeups_1_bits_fflags_bits_uop_ctrl_is_load,
  output        io_wakeups_1_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_wakeups_1_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_wakeups_1_bits_fflags_bits_uop_iw_state,
  output        io_wakeups_1_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_wakeups_1_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_wakeups_1_bits_fflags_bits_uop_is_br,
  output        io_wakeups_1_bits_fflags_bits_uop_is_jalr,
  output        io_wakeups_1_bits_fflags_bits_uop_is_jal,
  output        io_wakeups_1_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_wakeups_1_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_wakeups_1_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_wakeups_1_bits_fflags_bits_uop_ftq_idx,
  output        io_wakeups_1_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_wakeups_1_bits_fflags_bits_uop_pc_lob,
  output        io_wakeups_1_bits_fflags_bits_uop_taken,
  output [19:0] io_wakeups_1_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_wakeups_1_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_wakeups_1_bits_fflags_bits_uop_rob_idx,
  output [3:0]  io_wakeups_1_bits_fflags_bits_uop_ldq_idx,
  output [3:0]  io_wakeups_1_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_wakeups_1_bits_fflags_bits_uop_rxq_idx,
  output [5:0]  io_wakeups_1_bits_fflags_bits_uop_pdst,
  output [5:0]  io_wakeups_1_bits_fflags_bits_uop_prs1,
  output [5:0]  io_wakeups_1_bits_fflags_bits_uop_prs2,
  output [5:0]  io_wakeups_1_bits_fflags_bits_uop_prs3,
  output [4:0]  io_wakeups_1_bits_fflags_bits_uop_ppred,
  output        io_wakeups_1_bits_fflags_bits_uop_prs1_busy,
  output        io_wakeups_1_bits_fflags_bits_uop_prs2_busy,
  output        io_wakeups_1_bits_fflags_bits_uop_prs3_busy,
  output        io_wakeups_1_bits_fflags_bits_uop_ppred_busy,
  output [5:0]  io_wakeups_1_bits_fflags_bits_uop_stale_pdst,
  output        io_wakeups_1_bits_fflags_bits_uop_exception,
  output [63:0] io_wakeups_1_bits_fflags_bits_uop_exc_cause,
  output        io_wakeups_1_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_wakeups_1_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_wakeups_1_bits_fflags_bits_uop_mem_size,
  output        io_wakeups_1_bits_fflags_bits_uop_mem_signed,
  output        io_wakeups_1_bits_fflags_bits_uop_is_fence,
  output        io_wakeups_1_bits_fflags_bits_uop_is_fencei,
  output        io_wakeups_1_bits_fflags_bits_uop_is_amo,
  output        io_wakeups_1_bits_fflags_bits_uop_uses_ldq,
  output        io_wakeups_1_bits_fflags_bits_uop_uses_stq,
  output        io_wakeups_1_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_wakeups_1_bits_fflags_bits_uop_is_unique,
  output        io_wakeups_1_bits_fflags_bits_uop_flush_on_commit,
  output        io_wakeups_1_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_wakeups_1_bits_fflags_bits_uop_ldst,
  output [5:0]  io_wakeups_1_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_wakeups_1_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_wakeups_1_bits_fflags_bits_uop_lrs3,
  output        io_wakeups_1_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_wakeups_1_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_wakeups_1_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_wakeups_1_bits_fflags_bits_uop_lrs2_rtype,
  output        io_wakeups_1_bits_fflags_bits_uop_frs3_en,
  output        io_wakeups_1_bits_fflags_bits_uop_fp_val,
  output        io_wakeups_1_bits_fflags_bits_uop_fp_single,
  output        io_wakeups_1_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_wakeups_1_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_wakeups_1_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_wakeups_1_bits_fflags_bits_uop_bp_debug_if,
  output        io_wakeups_1_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_wakeups_1_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_wakeups_1_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_wakeups_1_bits_fflags_bits_flags,
  input         io_wb_valids_0,
  input         io_wb_valids_1,
  input  [5:0]  io_wb_pdsts_0,
  input  [5:0]  io_wb_pdsts_1,
  input  [63:0] io_debug_tsc_reg,
  output [64:0] io_debug_wb_wdata_0,
  output [64:0] io_debug_wb_wdata_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [95:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  fpiu_unit_clock; // @[execution-units.scala 131:32]
  wire  fpiu_unit_reset; // @[execution-units.scala 131:32]
  wire [9:0] fpiu_unit_io_fu_types; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_ready; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_valid; // @[execution-units.scala 131:32]
  wire [6:0] fpiu_unit_io_req_bits_uop_uopc; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_req_bits_uop_inst; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_req_bits_uop_debug_inst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_is_rvc; // @[execution-units.scala 131:32]
  wire [39:0] fpiu_unit_io_req_bits_uop_debug_pc; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_req_bits_uop_iq_type; // @[execution-units.scala 131:32]
  wire [9:0] fpiu_unit_io_req_bits_uop_fu_code; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_req_bits_uop_ctrl_br_type; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_req_bits_uop_ctrl_op1_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_req_bits_uop_ctrl_op2_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_req_bits_uop_ctrl_imm_sel; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_req_bits_uop_ctrl_op_fcn; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_ctrl_fcn_dw; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_req_bits_uop_ctrl_csr_cmd; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_ctrl_is_load; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_ctrl_is_sta; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_ctrl_is_std; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_req_bits_uop_iw_state; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_iw_p1_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_iw_p2_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_is_br; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_is_jalr; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_is_jal; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_is_sfb; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_req_bits_uop_br_mask; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_req_bits_uop_br_tag; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_req_bits_uop_ftq_idx; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_edge_inst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_req_bits_uop_pc_lob; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_taken; // @[execution-units.scala 131:32]
  wire [19:0] fpiu_unit_io_req_bits_uop_imm_packed; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_req_bits_uop_csr_addr; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_req_bits_uop_rob_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_req_bits_uop_ldq_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_req_bits_uop_stq_idx; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_req_bits_uop_rxq_idx; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_req_bits_uop_pdst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_req_bits_uop_prs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_req_bits_uop_prs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_req_bits_uop_prs3; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_req_bits_uop_ppred; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_prs1_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_prs2_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_prs3_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_ppred_busy; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_req_bits_uop_stale_pdst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_exception; // @[execution-units.scala 131:32]
  wire [63:0] fpiu_unit_io_req_bits_uop_exc_cause; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_bypassable; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_req_bits_uop_mem_cmd; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_req_bits_uop_mem_size; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_mem_signed; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_is_fence; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_is_fencei; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_is_amo; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_uses_ldq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_uses_stq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_is_sys_pc2epc; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_is_unique; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_flush_on_commit; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_ldst_is_rs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_req_bits_uop_ldst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_req_bits_uop_lrs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_req_bits_uop_lrs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_req_bits_uop_lrs3; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_ldst_val; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_req_bits_uop_dst_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_req_bits_uop_lrs1_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_req_bits_uop_lrs2_rtype; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_frs3_en; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_fp_val; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_fp_single; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_xcpt_pf_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_xcpt_ae_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_xcpt_ma_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_bp_debug_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_uop_bp_xcpt_if; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_req_bits_uop_debug_fsrc; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_req_bits_uop_debug_tsrc; // @[execution-units.scala 131:32]
  wire [64:0] fpiu_unit_io_req_bits_rs1_data; // @[execution-units.scala 131:32]
  wire [64:0] fpiu_unit_io_req_bits_rs2_data; // @[execution-units.scala 131:32]
  wire [64:0] fpiu_unit_io_req_bits_rs3_data; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_pred_data; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_req_bits_kill; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_ready; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_valid; // @[execution-units.scala 131:32]
  wire [6:0] fpiu_unit_io_fresp_bits_uop_uopc; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_fresp_bits_uop_inst; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_fresp_bits_uop_debug_inst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_is_rvc; // @[execution-units.scala 131:32]
  wire [39:0] fpiu_unit_io_fresp_bits_uop_debug_pc; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_fresp_bits_uop_iq_type; // @[execution-units.scala 131:32]
  wire [9:0] fpiu_unit_io_fresp_bits_uop_fu_code; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_fresp_bits_uop_ctrl_br_type; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_uop_ctrl_op1_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_fresp_bits_uop_ctrl_op2_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_fresp_bits_uop_ctrl_imm_sel; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_fresp_bits_uop_ctrl_op_fcn; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_ctrl_fcn_dw; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_fresp_bits_uop_ctrl_csr_cmd; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_ctrl_is_load; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_ctrl_is_sta; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_ctrl_is_std; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_uop_iw_state; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_iw_p1_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_iw_p2_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_is_br; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_is_jalr; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_is_jal; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_is_sfb; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_fresp_bits_uop_br_mask; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_fresp_bits_uop_br_tag; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_fresp_bits_uop_ftq_idx; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_edge_inst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_uop_pc_lob; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_taken; // @[execution-units.scala 131:32]
  wire [19:0] fpiu_unit_io_fresp_bits_uop_imm_packed; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_fresp_bits_uop_csr_addr; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_uop_rob_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_fresp_bits_uop_ldq_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_fresp_bits_uop_stq_idx; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_uop_rxq_idx; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_uop_pdst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_uop_prs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_uop_prs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_uop_prs3; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_fresp_bits_uop_ppred; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_prs1_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_prs2_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_prs3_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_ppred_busy; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_uop_stale_pdst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_exception; // @[execution-units.scala 131:32]
  wire [63:0] fpiu_unit_io_fresp_bits_uop_exc_cause; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_bypassable; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_fresp_bits_uop_mem_cmd; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_uop_mem_size; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_mem_signed; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_is_fence; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_is_fencei; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_is_amo; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_uses_ldq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_uses_stq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_is_sys_pc2epc; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_is_unique; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_flush_on_commit; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_ldst_is_rs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_uop_ldst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_uop_lrs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_uop_lrs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_uop_lrs3; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_ldst_val; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_uop_dst_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_uop_lrs1_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_uop_lrs2_rtype; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_frs3_en; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_fp_val; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_fp_single; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_xcpt_pf_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_xcpt_ae_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_xcpt_ma_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_bp_debug_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_uop_bp_xcpt_if; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_uop_debug_fsrc; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_uop_debug_tsrc; // @[execution-units.scala 131:32]
  wire [64:0] fpiu_unit_io_fresp_bits_data; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_predicated; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_valid; // @[execution-units.scala 131:32]
  wire [6:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_uopc; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_inst; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_inst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_is_rvc; // @[execution-units.scala 131:32]
  wire [39:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_pc; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_iq_type; // @[execution-units.scala 131:32]
  wire [9:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_fu_code; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_iw_state; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_is_br; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_is_jalr; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_is_jal; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_is_sfb; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_br_mask; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_br_tag; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_ftq_idx; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_edge_inst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_pc_lob; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_taken; // @[execution-units.scala 131:32]
  wire [19:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_imm_packed; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_csr_addr; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_rob_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_ldq_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_stq_idx; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_rxq_idx; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_pdst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_prs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_prs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_prs3; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_ppred; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_prs1_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_prs2_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_prs3_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_ppred_busy; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_stale_pdst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_exception; // @[execution-units.scala 131:32]
  wire [63:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_exc_cause; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_bypassable; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_mem_cmd; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_mem_size; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_mem_signed; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_is_fence; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_is_fencei; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_is_amo; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_uses_ldq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_uses_stq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_is_unique; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_flush_on_commit; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_ldst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs3; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_ldst_val; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_dst_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_frs3_en; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_fp_val; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_fp_single; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_bp_debug_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_fresp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_fsrc; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_tsrc; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_fresp_bits_fflags_bits_flags; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_ready; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_valid; // @[execution-units.scala 131:32]
  wire [6:0] fpiu_unit_io_ll_iresp_bits_uop_uopc; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_ll_iresp_bits_uop_inst; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_ll_iresp_bits_uop_debug_inst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_is_rvc; // @[execution-units.scala 131:32]
  wire [39:0] fpiu_unit_io_ll_iresp_bits_uop_debug_pc; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_ll_iresp_bits_uop_iq_type; // @[execution-units.scala 131:32]
  wire [9:0] fpiu_unit_io_ll_iresp_bits_uop_fu_code; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_ll_iresp_bits_uop_ctrl_br_type; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_uop_ctrl_op1_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_ll_iresp_bits_uop_ctrl_op2_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_ll_iresp_bits_uop_ctrl_imm_sel; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_ll_iresp_bits_uop_ctrl_op_fcn; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_ctrl_fcn_dw; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_ll_iresp_bits_uop_ctrl_csr_cmd; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_load; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_sta; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_std; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_uop_iw_state; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_iw_p1_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_iw_p2_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_is_br; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_is_jalr; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_is_jal; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_is_sfb; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_ll_iresp_bits_uop_br_mask; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_ll_iresp_bits_uop_br_tag; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_ll_iresp_bits_uop_ftq_idx; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_edge_inst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_uop_pc_lob; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_taken; // @[execution-units.scala 131:32]
  wire [19:0] fpiu_unit_io_ll_iresp_bits_uop_imm_packed; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_ll_iresp_bits_uop_csr_addr; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_uop_rob_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_ll_iresp_bits_uop_ldq_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_ll_iresp_bits_uop_stq_idx; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_uop_rxq_idx; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_uop_pdst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_uop_prs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_uop_prs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_uop_prs3; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_ll_iresp_bits_uop_ppred; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_prs1_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_prs2_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_prs3_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_ppred_busy; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_uop_stale_pdst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_exception; // @[execution-units.scala 131:32]
  wire [63:0] fpiu_unit_io_ll_iresp_bits_uop_exc_cause; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_bypassable; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_ll_iresp_bits_uop_mem_cmd; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_uop_mem_size; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_mem_signed; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_is_fence; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_is_fencei; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_is_amo; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_uses_ldq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_uses_stq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_is_sys_pc2epc; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_is_unique; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_flush_on_commit; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_ldst_is_rs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_uop_ldst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_uop_lrs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_uop_lrs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_uop_lrs3; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_ldst_val; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_uop_dst_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_uop_lrs1_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_uop_lrs2_rtype; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_frs3_en; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_fp_val; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_fp_single; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_xcpt_pf_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_xcpt_ae_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_xcpt_ma_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_bp_debug_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_uop_bp_xcpt_if; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_uop_debug_fsrc; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_uop_debug_tsrc; // @[execution-units.scala 131:32]
  wire [64:0] fpiu_unit_io_ll_iresp_bits_data; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_predicated; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_valid; // @[execution-units.scala 131:32]
  wire [6:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uopc; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_inst; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_inst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_rvc; // @[execution-units.scala 131:32]
  wire [39:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_pc; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iq_type; // @[execution-units.scala 131:32]
  wire [9:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fu_code; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_state; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_br; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_jalr; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_jal; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_sfb; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_br_mask; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_br_tag; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ftq_idx; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_edge_inst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_pc_lob; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_taken; // @[execution-units.scala 131:32]
  wire [19:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_imm_packed; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_csr_addr; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_rob_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldq_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_stq_idx; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_rxq_idx; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_pdst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs3; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ppred; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs1_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs2_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs3_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ppred_busy; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_stale_pdst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_exception; // @[execution-units.scala 131:32]
  wire [63:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_exc_cause; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bypassable; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_cmd; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_size; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_signed; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_fence; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_fencei; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_amo; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uses_ldq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uses_stq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_unique; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_flush_on_commit; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs3; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst_val; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_dst_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_frs3_en; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fp_val; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fp_single; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bp_debug_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_fsrc; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_tsrc; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_ll_iresp_bits_fflags_bits_flags; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_brupdate_b1_resolve_mask; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_brupdate_b1_mispredict_mask; // @[execution-units.scala 131:32]
  wire [6:0] fpiu_unit_io_brupdate_b2_uop_uopc; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_brupdate_b2_uop_inst; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_brupdate_b2_uop_debug_inst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_is_rvc; // @[execution-units.scala 131:32]
  wire [39:0] fpiu_unit_io_brupdate_b2_uop_debug_pc; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_brupdate_b2_uop_iq_type; // @[execution-units.scala 131:32]
  wire [9:0] fpiu_unit_io_brupdate_b2_uop_fu_code; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_brupdate_b2_uop_ctrl_br_type; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_ctrl_is_load; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_ctrl_is_std; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_brupdate_b2_uop_iw_state; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_is_br; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_is_jalr; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_is_jal; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_is_sfb; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_brupdate_b2_uop_br_mask; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_brupdate_b2_uop_br_tag; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_brupdate_b2_uop_ftq_idx; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_edge_inst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_brupdate_b2_uop_pc_lob; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_taken; // @[execution-units.scala 131:32]
  wire [19:0] fpiu_unit_io_brupdate_b2_uop_imm_packed; // @[execution-units.scala 131:32]
  wire [11:0] fpiu_unit_io_brupdate_b2_uop_csr_addr; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_brupdate_b2_uop_rob_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_brupdate_b2_uop_ldq_idx; // @[execution-units.scala 131:32]
  wire [3:0] fpiu_unit_io_brupdate_b2_uop_stq_idx; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_brupdate_b2_uop_rxq_idx; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_brupdate_b2_uop_pdst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_brupdate_b2_uop_prs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_brupdate_b2_uop_prs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_brupdate_b2_uop_prs3; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_brupdate_b2_uop_ppred; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_prs1_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_prs2_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_prs3_busy; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_ppred_busy; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_brupdate_b2_uop_stale_pdst; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_exception; // @[execution-units.scala 131:32]
  wire [63:0] fpiu_unit_io_brupdate_b2_uop_exc_cause; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_bypassable; // @[execution-units.scala 131:32]
  wire [4:0] fpiu_unit_io_brupdate_b2_uop_mem_cmd; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_brupdate_b2_uop_mem_size; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_mem_signed; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_is_fence; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_is_fencei; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_is_amo; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_uses_ldq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_uses_stq; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_is_unique; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_flush_on_commit; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_brupdate_b2_uop_ldst; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_brupdate_b2_uop_lrs1; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_brupdate_b2_uop_lrs2; // @[execution-units.scala 131:32]
  wire [5:0] fpiu_unit_io_brupdate_b2_uop_lrs3; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_ldst_val; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_brupdate_b2_uop_dst_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_brupdate_b2_uop_lrs1_rtype; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_brupdate_b2_uop_lrs2_rtype; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_frs3_en; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_fp_val; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_fp_single; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_bp_debug_if; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_brupdate_b2_uop_debug_fsrc; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_brupdate_b2_uop_debug_tsrc; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_valid; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_mispredict; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_brupdate_b2_taken; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_brupdate_b2_cfi_type; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_brupdate_b2_pc_sel; // @[execution-units.scala 131:32]
  wire [39:0] fpiu_unit_io_brupdate_b2_jalr_target; // @[execution-units.scala 131:32]
  wire [20:0] fpiu_unit_io_brupdate_b2_target_offset; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_debug; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_cease; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_wfi; // @[execution-units.scala 131:32]
  wire [31:0] fpiu_unit_io_status_isa; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_status_dprv; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_status_prv; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_sd; // @[execution-units.scala 131:32]
  wire [26:0] fpiu_unit_io_status_zero2; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_status_sxl; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_status_uxl; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_sd_rv32; // @[execution-units.scala 131:32]
  wire [7:0] fpiu_unit_io_status_zero1; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_tsr; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_tw; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_tvm; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_mxr; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_sum; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_mprv; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_status_xs; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_status_fs; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_status_mpp; // @[execution-units.scala 131:32]
  wire [1:0] fpiu_unit_io_status_vs; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_spp; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_mpie; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_hpie; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_spie; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_upie; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_mie; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_hie; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_sie; // @[execution-units.scala 131:32]
  wire  fpiu_unit_io_status_uie; // @[execution-units.scala 131:32]
  wire [2:0] fpiu_unit_io_fcsr_rm; // @[execution-units.scala 131:32]
  wire  fp_issue_unit_clock; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_reset; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_ready; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_valid; // @[fp-pipeline.scala 62:30]
  wire [6:0] fp_issue_unit_io_dis_uops_0_bits_uopc; // @[fp-pipeline.scala 62:30]
  wire [31:0] fp_issue_unit_io_dis_uops_0_bits_inst; // @[fp-pipeline.scala 62:30]
  wire [31:0] fp_issue_unit_io_dis_uops_0_bits_debug_inst; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_is_rvc; // @[fp-pipeline.scala 62:30]
  wire [39:0] fp_issue_unit_io_dis_uops_0_bits_debug_pc; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_dis_uops_0_bits_iq_type; // @[fp-pipeline.scala 62:30]
  wire [9:0] fp_issue_unit_io_dis_uops_0_bits_fu_code; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_dis_uops_0_bits_ctrl_br_type; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_0_bits_ctrl_op1_sel; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_dis_uops_0_bits_ctrl_op2_sel; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_dis_uops_0_bits_ctrl_imm_sel; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_dis_uops_0_bits_ctrl_op_fcn; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_ctrl_fcn_dw; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_dis_uops_0_bits_ctrl_csr_cmd; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_ctrl_is_load; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_ctrl_is_sta; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_ctrl_is_std; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_0_bits_iw_state; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_iw_p1_poisoned; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_iw_p2_poisoned; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_is_br; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_is_jalr; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_is_jal; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_is_sfb; // @[fp-pipeline.scala 62:30]
  wire [11:0] fp_issue_unit_io_dis_uops_0_bits_br_mask; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_dis_uops_0_bits_br_tag; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_dis_uops_0_bits_ftq_idx; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_edge_inst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_0_bits_pc_lob; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_taken; // @[fp-pipeline.scala 62:30]
  wire [19:0] fp_issue_unit_io_dis_uops_0_bits_imm_packed; // @[fp-pipeline.scala 62:30]
  wire [11:0] fp_issue_unit_io_dis_uops_0_bits_csr_addr; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_0_bits_rob_idx; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_dis_uops_0_bits_ldq_idx; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_dis_uops_0_bits_stq_idx; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_0_bits_rxq_idx; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_0_bits_pdst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_0_bits_prs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_0_bits_prs2; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_0_bits_prs3; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_dis_uops_0_bits_ppred; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_prs1_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_prs2_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_prs3_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_ppred_busy; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_0_bits_stale_pdst; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_exception; // @[fp-pipeline.scala 62:30]
  wire [63:0] fp_issue_unit_io_dis_uops_0_bits_exc_cause; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_bypassable; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_dis_uops_0_bits_mem_cmd; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_0_bits_mem_size; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_mem_signed; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_is_fence; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_is_fencei; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_is_amo; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_uses_ldq; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_uses_stq; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_is_sys_pc2epc; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_is_unique; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_flush_on_commit; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_ldst_is_rs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_0_bits_ldst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_0_bits_lrs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_0_bits_lrs2; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_0_bits_lrs3; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_ldst_val; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_0_bits_dst_rtype; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_0_bits_lrs1_rtype; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_0_bits_lrs2_rtype; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_frs3_en; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_fp_val; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_fp_single; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_xcpt_pf_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_xcpt_ae_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_xcpt_ma_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_bp_debug_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_0_bits_bp_xcpt_if; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_0_bits_debug_fsrc; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_0_bits_debug_tsrc; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_ready; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_valid; // @[fp-pipeline.scala 62:30]
  wire [6:0] fp_issue_unit_io_dis_uops_1_bits_uopc; // @[fp-pipeline.scala 62:30]
  wire [31:0] fp_issue_unit_io_dis_uops_1_bits_inst; // @[fp-pipeline.scala 62:30]
  wire [31:0] fp_issue_unit_io_dis_uops_1_bits_debug_inst; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_is_rvc; // @[fp-pipeline.scala 62:30]
  wire [39:0] fp_issue_unit_io_dis_uops_1_bits_debug_pc; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_dis_uops_1_bits_iq_type; // @[fp-pipeline.scala 62:30]
  wire [9:0] fp_issue_unit_io_dis_uops_1_bits_fu_code; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_dis_uops_1_bits_ctrl_br_type; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_1_bits_ctrl_op1_sel; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_dis_uops_1_bits_ctrl_op2_sel; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_dis_uops_1_bits_ctrl_imm_sel; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_dis_uops_1_bits_ctrl_op_fcn; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_ctrl_fcn_dw; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_dis_uops_1_bits_ctrl_csr_cmd; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_ctrl_is_load; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_ctrl_is_sta; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_ctrl_is_std; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_1_bits_iw_state; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_iw_p1_poisoned; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_iw_p2_poisoned; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_is_br; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_is_jalr; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_is_jal; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_is_sfb; // @[fp-pipeline.scala 62:30]
  wire [11:0] fp_issue_unit_io_dis_uops_1_bits_br_mask; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_dis_uops_1_bits_br_tag; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_dis_uops_1_bits_ftq_idx; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_edge_inst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_1_bits_pc_lob; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_taken; // @[fp-pipeline.scala 62:30]
  wire [19:0] fp_issue_unit_io_dis_uops_1_bits_imm_packed; // @[fp-pipeline.scala 62:30]
  wire [11:0] fp_issue_unit_io_dis_uops_1_bits_csr_addr; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_1_bits_rob_idx; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_dis_uops_1_bits_ldq_idx; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_dis_uops_1_bits_stq_idx; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_1_bits_rxq_idx; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_1_bits_pdst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_1_bits_prs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_1_bits_prs2; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_1_bits_prs3; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_dis_uops_1_bits_ppred; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_prs1_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_prs2_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_prs3_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_ppred_busy; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_1_bits_stale_pdst; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_exception; // @[fp-pipeline.scala 62:30]
  wire [63:0] fp_issue_unit_io_dis_uops_1_bits_exc_cause; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_bypassable; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_dis_uops_1_bits_mem_cmd; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_1_bits_mem_size; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_mem_signed; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_is_fence; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_is_fencei; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_is_amo; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_uses_ldq; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_uses_stq; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_is_sys_pc2epc; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_is_unique; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_flush_on_commit; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_ldst_is_rs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_1_bits_ldst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_1_bits_lrs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_1_bits_lrs2; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_dis_uops_1_bits_lrs3; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_ldst_val; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_1_bits_dst_rtype; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_1_bits_lrs1_rtype; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_1_bits_lrs2_rtype; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_frs3_en; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_fp_val; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_fp_single; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_xcpt_pf_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_xcpt_ae_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_xcpt_ma_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_bp_debug_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_dis_uops_1_bits_bp_xcpt_if; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_1_bits_debug_fsrc; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_dis_uops_1_bits_debug_tsrc; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_valids_0; // @[fp-pipeline.scala 62:30]
  wire [6:0] fp_issue_unit_io_iss_uops_0_uopc; // @[fp-pipeline.scala 62:30]
  wire [31:0] fp_issue_unit_io_iss_uops_0_inst; // @[fp-pipeline.scala 62:30]
  wire [31:0] fp_issue_unit_io_iss_uops_0_debug_inst; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_is_rvc; // @[fp-pipeline.scala 62:30]
  wire [39:0] fp_issue_unit_io_iss_uops_0_debug_pc; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_iss_uops_0_iq_type; // @[fp-pipeline.scala 62:30]
  wire [9:0] fp_issue_unit_io_iss_uops_0_fu_code; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_iss_uops_0_ctrl_br_type; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_iss_uops_0_ctrl_op1_sel; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_iss_uops_0_ctrl_op2_sel; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_iss_uops_0_ctrl_imm_sel; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_iss_uops_0_ctrl_op_fcn; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_ctrl_fcn_dw; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_iss_uops_0_ctrl_csr_cmd; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_ctrl_is_load; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_ctrl_is_sta; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_ctrl_is_std; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_iss_uops_0_iw_state; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_iw_p1_poisoned; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_iw_p2_poisoned; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_is_br; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_is_jalr; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_is_jal; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_is_sfb; // @[fp-pipeline.scala 62:30]
  wire [11:0] fp_issue_unit_io_iss_uops_0_br_mask; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_iss_uops_0_br_tag; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_iss_uops_0_ftq_idx; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_edge_inst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_iss_uops_0_pc_lob; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_taken; // @[fp-pipeline.scala 62:30]
  wire [19:0] fp_issue_unit_io_iss_uops_0_imm_packed; // @[fp-pipeline.scala 62:30]
  wire [11:0] fp_issue_unit_io_iss_uops_0_csr_addr; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_iss_uops_0_rob_idx; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_iss_uops_0_ldq_idx; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_iss_uops_0_stq_idx; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_iss_uops_0_rxq_idx; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_iss_uops_0_pdst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_iss_uops_0_prs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_iss_uops_0_prs2; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_iss_uops_0_prs3; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_iss_uops_0_ppred; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_prs1_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_prs2_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_prs3_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_ppred_busy; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_iss_uops_0_stale_pdst; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_exception; // @[fp-pipeline.scala 62:30]
  wire [63:0] fp_issue_unit_io_iss_uops_0_exc_cause; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_bypassable; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_iss_uops_0_mem_cmd; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_iss_uops_0_mem_size; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_mem_signed; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_is_fence; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_is_fencei; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_is_amo; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_uses_ldq; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_uses_stq; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_is_sys_pc2epc; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_is_unique; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_flush_on_commit; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_ldst_is_rs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_iss_uops_0_ldst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_iss_uops_0_lrs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_iss_uops_0_lrs2; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_iss_uops_0_lrs3; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_ldst_val; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_iss_uops_0_dst_rtype; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_iss_uops_0_lrs1_rtype; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_iss_uops_0_lrs2_rtype; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_frs3_en; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_fp_val; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_fp_single; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_xcpt_pf_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_xcpt_ae_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_xcpt_ma_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_bp_debug_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_iss_uops_0_bp_xcpt_if; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_iss_uops_0_debug_fsrc; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_iss_uops_0_debug_tsrc; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_wakeup_ports_0_valid; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_wakeup_ports_0_bits_pdst; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_wakeup_ports_0_bits_poisoned; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_wakeup_ports_1_valid; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_wakeup_ports_1_bits_pdst; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_wakeup_ports_1_bits_poisoned; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_pred_wakeup_port_valid; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_pred_wakeup_port_bits; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_spec_ld_wakeup_0_valid; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_spec_ld_wakeup_0_bits; // @[fp-pipeline.scala 62:30]
  wire [9:0] fp_issue_unit_io_fu_types_0; // @[fp-pipeline.scala 62:30]
  wire [11:0] fp_issue_unit_io_brupdate_b1_resolve_mask; // @[fp-pipeline.scala 62:30]
  wire [11:0] fp_issue_unit_io_brupdate_b1_mispredict_mask; // @[fp-pipeline.scala 62:30]
  wire [6:0] fp_issue_unit_io_brupdate_b2_uop_uopc; // @[fp-pipeline.scala 62:30]
  wire [31:0] fp_issue_unit_io_brupdate_b2_uop_inst; // @[fp-pipeline.scala 62:30]
  wire [31:0] fp_issue_unit_io_brupdate_b2_uop_debug_inst; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_is_rvc; // @[fp-pipeline.scala 62:30]
  wire [39:0] fp_issue_unit_io_brupdate_b2_uop_debug_pc; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_brupdate_b2_uop_iq_type; // @[fp-pipeline.scala 62:30]
  wire [9:0] fp_issue_unit_io_brupdate_b2_uop_fu_code; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_brupdate_b2_uop_ctrl_br_type; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_brupdate_b2_uop_ctrl_op1_sel; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_brupdate_b2_uop_ctrl_op2_sel; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_brupdate_b2_uop_ctrl_imm_sel; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_brupdate_b2_uop_ctrl_op_fcn; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_brupdate_b2_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_ctrl_is_load; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_ctrl_is_sta; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_ctrl_is_std; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_brupdate_b2_uop_iw_state; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_iw_p1_poisoned; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_iw_p2_poisoned; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_is_br; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_is_jalr; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_is_jal; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_is_sfb; // @[fp-pipeline.scala 62:30]
  wire [11:0] fp_issue_unit_io_brupdate_b2_uop_br_mask; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_brupdate_b2_uop_br_tag; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_brupdate_b2_uop_ftq_idx; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_edge_inst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_brupdate_b2_uop_pc_lob; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_taken; // @[fp-pipeline.scala 62:30]
  wire [19:0] fp_issue_unit_io_brupdate_b2_uop_imm_packed; // @[fp-pipeline.scala 62:30]
  wire [11:0] fp_issue_unit_io_brupdate_b2_uop_csr_addr; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_brupdate_b2_uop_rob_idx; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_brupdate_b2_uop_ldq_idx; // @[fp-pipeline.scala 62:30]
  wire [3:0] fp_issue_unit_io_brupdate_b2_uop_stq_idx; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_brupdate_b2_uop_rxq_idx; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_brupdate_b2_uop_pdst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_brupdate_b2_uop_prs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_brupdate_b2_uop_prs2; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_brupdate_b2_uop_prs3; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_brupdate_b2_uop_ppred; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_prs1_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_prs2_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_prs3_busy; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_ppred_busy; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_brupdate_b2_uop_stale_pdst; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_exception; // @[fp-pipeline.scala 62:30]
  wire [63:0] fp_issue_unit_io_brupdate_b2_uop_exc_cause; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_bypassable; // @[fp-pipeline.scala 62:30]
  wire [4:0] fp_issue_unit_io_brupdate_b2_uop_mem_cmd; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_brupdate_b2_uop_mem_size; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_mem_signed; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_is_fence; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_is_fencei; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_is_amo; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_uses_ldq; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_uses_stq; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_is_sys_pc2epc; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_is_unique; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_flush_on_commit; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_ldst_is_rs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_brupdate_b2_uop_ldst; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_brupdate_b2_uop_lrs1; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_brupdate_b2_uop_lrs2; // @[fp-pipeline.scala 62:30]
  wire [5:0] fp_issue_unit_io_brupdate_b2_uop_lrs3; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_ldst_val; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_brupdate_b2_uop_dst_rtype; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_brupdate_b2_uop_lrs1_rtype; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_brupdate_b2_uop_lrs2_rtype; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_frs3_en; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_fp_val; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_fp_single; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_xcpt_pf_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_xcpt_ae_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_xcpt_ma_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_bp_debug_if; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_uop_bp_xcpt_if; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_brupdate_b2_uop_debug_fsrc; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_brupdate_b2_uop_debug_tsrc; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_valid; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_mispredict; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_brupdate_b2_taken; // @[fp-pipeline.scala 62:30]
  wire [2:0] fp_issue_unit_io_brupdate_b2_cfi_type; // @[fp-pipeline.scala 62:30]
  wire [1:0] fp_issue_unit_io_brupdate_b2_pc_sel; // @[fp-pipeline.scala 62:30]
  wire [39:0] fp_issue_unit_io_brupdate_b2_jalr_target; // @[fp-pipeline.scala 62:30]
  wire [20:0] fp_issue_unit_io_brupdate_b2_target_offset; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_flush_pipeline; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_ld_miss; // @[fp-pipeline.scala 62:30]
  wire  fp_issue_unit_io_event_empty; // @[fp-pipeline.scala 62:30]
  wire [63:0] fp_issue_unit_io_tsc_reg; // @[fp-pipeline.scala 62:30]
  wire  fregfile_clock; // @[fp-pipeline.scala 66:30]
  wire  fregfile_reset; // @[fp-pipeline.scala 66:30]
  wire [5:0] fregfile_io_read_ports_0_addr; // @[fp-pipeline.scala 66:30]
  wire [64:0] fregfile_io_read_ports_0_data; // @[fp-pipeline.scala 66:30]
  wire [5:0] fregfile_io_read_ports_1_addr; // @[fp-pipeline.scala 66:30]
  wire [64:0] fregfile_io_read_ports_1_data; // @[fp-pipeline.scala 66:30]
  wire [5:0] fregfile_io_read_ports_2_addr; // @[fp-pipeline.scala 66:30]
  wire [64:0] fregfile_io_read_ports_2_data; // @[fp-pipeline.scala 66:30]
  wire  fregfile_io_write_ports_0_valid; // @[fp-pipeline.scala 66:30]
  wire [5:0] fregfile_io_write_ports_0_bits_addr; // @[fp-pipeline.scala 66:30]
  wire [64:0] fregfile_io_write_ports_0_bits_data; // @[fp-pipeline.scala 66:30]
  wire  fregfile_io_write_ports_1_valid; // @[fp-pipeline.scala 66:30]
  wire [5:0] fregfile_io_write_ports_1_bits_addr; // @[fp-pipeline.scala 66:30]
  wire [64:0] fregfile_io_write_ports_1_bits_data; // @[fp-pipeline.scala 66:30]
  wire  fregister_read_clock; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_reset; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_valids_0; // @[fp-pipeline.scala 73:30]
  wire [6:0] fregister_read_io_iss_uops_0_uopc; // @[fp-pipeline.scala 73:30]
  wire [31:0] fregister_read_io_iss_uops_0_inst; // @[fp-pipeline.scala 73:30]
  wire [31:0] fregister_read_io_iss_uops_0_debug_inst; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_is_rvc; // @[fp-pipeline.scala 73:30]
  wire [39:0] fregister_read_io_iss_uops_0_debug_pc; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_iss_uops_0_iq_type; // @[fp-pipeline.scala 73:30]
  wire [9:0] fregister_read_io_iss_uops_0_fu_code; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_iss_uops_0_ctrl_br_type; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_iss_uops_0_ctrl_op1_sel; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_iss_uops_0_ctrl_op2_sel; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_iss_uops_0_ctrl_imm_sel; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_iss_uops_0_ctrl_op_fcn; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_ctrl_fcn_dw; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_iss_uops_0_ctrl_csr_cmd; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_ctrl_is_load; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_ctrl_is_sta; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_ctrl_is_std; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_iss_uops_0_iw_state; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_iw_p1_poisoned; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_iw_p2_poisoned; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_is_br; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_is_jalr; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_is_jal; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_is_sfb; // @[fp-pipeline.scala 73:30]
  wire [11:0] fregister_read_io_iss_uops_0_br_mask; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_iss_uops_0_br_tag; // @[fp-pipeline.scala 73:30]
  wire [4:0] fregister_read_io_iss_uops_0_ftq_idx; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_edge_inst; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_iss_uops_0_pc_lob; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_taken; // @[fp-pipeline.scala 73:30]
  wire [19:0] fregister_read_io_iss_uops_0_imm_packed; // @[fp-pipeline.scala 73:30]
  wire [11:0] fregister_read_io_iss_uops_0_csr_addr; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_iss_uops_0_rob_idx; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_iss_uops_0_ldq_idx; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_iss_uops_0_stq_idx; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_iss_uops_0_rxq_idx; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_iss_uops_0_pdst; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_iss_uops_0_prs1; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_iss_uops_0_prs2; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_iss_uops_0_prs3; // @[fp-pipeline.scala 73:30]
  wire [4:0] fregister_read_io_iss_uops_0_ppred; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_prs1_busy; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_prs2_busy; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_prs3_busy; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_ppred_busy; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_iss_uops_0_stale_pdst; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_exception; // @[fp-pipeline.scala 73:30]
  wire [63:0] fregister_read_io_iss_uops_0_exc_cause; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_bypassable; // @[fp-pipeline.scala 73:30]
  wire [4:0] fregister_read_io_iss_uops_0_mem_cmd; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_iss_uops_0_mem_size; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_mem_signed; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_is_fence; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_is_fencei; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_is_amo; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_uses_ldq; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_uses_stq; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_is_sys_pc2epc; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_is_unique; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_flush_on_commit; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_ldst_is_rs1; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_iss_uops_0_ldst; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_iss_uops_0_lrs1; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_iss_uops_0_lrs2; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_iss_uops_0_lrs3; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_ldst_val; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_iss_uops_0_dst_rtype; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_iss_uops_0_lrs1_rtype; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_iss_uops_0_lrs2_rtype; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_frs3_en; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_fp_val; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_fp_single; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_xcpt_pf_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_xcpt_ae_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_xcpt_ma_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_bp_debug_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_iss_uops_0_bp_xcpt_if; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_iss_uops_0_debug_fsrc; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_iss_uops_0_debug_tsrc; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_rf_read_ports_0_addr; // @[fp-pipeline.scala 73:30]
  wire [64:0] fregister_read_io_rf_read_ports_0_data; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_rf_read_ports_1_addr; // @[fp-pipeline.scala 73:30]
  wire [64:0] fregister_read_io_rf_read_ports_1_data; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_rf_read_ports_2_addr; // @[fp-pipeline.scala 73:30]
  wire [64:0] fregister_read_io_rf_read_ports_2_data; // @[fp-pipeline.scala 73:30]
  wire [4:0] fregister_read_io_prf_read_ports_0_addr; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_prf_read_ports_0_data; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_ready; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_valid; // @[fp-pipeline.scala 73:30]
  wire [6:0] fregister_read_io_exe_reqs_0_bits_uop_uopc; // @[fp-pipeline.scala 73:30]
  wire [31:0] fregister_read_io_exe_reqs_0_bits_uop_inst; // @[fp-pipeline.scala 73:30]
  wire [31:0] fregister_read_io_exe_reqs_0_bits_uop_debug_inst; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_is_rvc; // @[fp-pipeline.scala 73:30]
  wire [39:0] fregister_read_io_exe_reqs_0_bits_uop_debug_pc; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_exe_reqs_0_bits_uop_iq_type; // @[fp-pipeline.scala 73:30]
  wire [9:0] fregister_read_io_exe_reqs_0_bits_uop_fu_code; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_exe_reqs_0_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_exe_reqs_0_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_exe_reqs_0_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_exe_reqs_0_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_exe_reqs_0_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_exe_reqs_0_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_exe_reqs_0_bits_uop_iw_state; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_is_br; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_is_jalr; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_is_jal; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_is_sfb; // @[fp-pipeline.scala 73:30]
  wire [11:0] fregister_read_io_exe_reqs_0_bits_uop_br_mask; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_exe_reqs_0_bits_uop_br_tag; // @[fp-pipeline.scala 73:30]
  wire [4:0] fregister_read_io_exe_reqs_0_bits_uop_ftq_idx; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_edge_inst; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_exe_reqs_0_bits_uop_pc_lob; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_taken; // @[fp-pipeline.scala 73:30]
  wire [19:0] fregister_read_io_exe_reqs_0_bits_uop_imm_packed; // @[fp-pipeline.scala 73:30]
  wire [11:0] fregister_read_io_exe_reqs_0_bits_uop_csr_addr; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_exe_reqs_0_bits_uop_rob_idx; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_exe_reqs_0_bits_uop_ldq_idx; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_exe_reqs_0_bits_uop_stq_idx; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_exe_reqs_0_bits_uop_rxq_idx; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_exe_reqs_0_bits_uop_pdst; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_exe_reqs_0_bits_uop_prs1; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_exe_reqs_0_bits_uop_prs2; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_exe_reqs_0_bits_uop_prs3; // @[fp-pipeline.scala 73:30]
  wire [4:0] fregister_read_io_exe_reqs_0_bits_uop_ppred; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_prs1_busy; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_prs2_busy; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_prs3_busy; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_ppred_busy; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_exe_reqs_0_bits_uop_stale_pdst; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_exception; // @[fp-pipeline.scala 73:30]
  wire [63:0] fregister_read_io_exe_reqs_0_bits_uop_exc_cause; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_bypassable; // @[fp-pipeline.scala 73:30]
  wire [4:0] fregister_read_io_exe_reqs_0_bits_uop_mem_cmd; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_exe_reqs_0_bits_uop_mem_size; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_mem_signed; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_is_fence; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_is_fencei; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_is_amo; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_uses_ldq; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_uses_stq; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_is_unique; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_flush_on_commit; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_exe_reqs_0_bits_uop_ldst; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_exe_reqs_0_bits_uop_lrs1; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_exe_reqs_0_bits_uop_lrs2; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_exe_reqs_0_bits_uop_lrs3; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_ldst_val; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_exe_reqs_0_bits_uop_dst_rtype; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_exe_reqs_0_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_exe_reqs_0_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_frs3_en; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_fp_val; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_fp_single; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_bp_debug_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_exe_reqs_0_bits_uop_debug_fsrc; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_exe_reqs_0_bits_uop_debug_tsrc; // @[fp-pipeline.scala 73:30]
  wire [64:0] fregister_read_io_exe_reqs_0_bits_rs1_data; // @[fp-pipeline.scala 73:30]
  wire [64:0] fregister_read_io_exe_reqs_0_bits_rs2_data; // @[fp-pipeline.scala 73:30]
  wire [64:0] fregister_read_io_exe_reqs_0_bits_rs3_data; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_pred_data; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_exe_reqs_0_bits_kill; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_kill; // @[fp-pipeline.scala 73:30]
  wire [11:0] fregister_read_io_brupdate_b1_resolve_mask; // @[fp-pipeline.scala 73:30]
  wire [11:0] fregister_read_io_brupdate_b1_mispredict_mask; // @[fp-pipeline.scala 73:30]
  wire [6:0] fregister_read_io_brupdate_b2_uop_uopc; // @[fp-pipeline.scala 73:30]
  wire [31:0] fregister_read_io_brupdate_b2_uop_inst; // @[fp-pipeline.scala 73:30]
  wire [31:0] fregister_read_io_brupdate_b2_uop_debug_inst; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_is_rvc; // @[fp-pipeline.scala 73:30]
  wire [39:0] fregister_read_io_brupdate_b2_uop_debug_pc; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_brupdate_b2_uop_iq_type; // @[fp-pipeline.scala 73:30]
  wire [9:0] fregister_read_io_brupdate_b2_uop_fu_code; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_brupdate_b2_uop_ctrl_br_type; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_brupdate_b2_uop_ctrl_op1_sel; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_brupdate_b2_uop_ctrl_op2_sel; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_brupdate_b2_uop_ctrl_imm_sel; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_brupdate_b2_uop_ctrl_op_fcn; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_brupdate_b2_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_ctrl_is_load; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_ctrl_is_sta; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_ctrl_is_std; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_brupdate_b2_uop_iw_state; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_iw_p1_poisoned; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_iw_p2_poisoned; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_is_br; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_is_jalr; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_is_jal; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_is_sfb; // @[fp-pipeline.scala 73:30]
  wire [11:0] fregister_read_io_brupdate_b2_uop_br_mask; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_brupdate_b2_uop_br_tag; // @[fp-pipeline.scala 73:30]
  wire [4:0] fregister_read_io_brupdate_b2_uop_ftq_idx; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_edge_inst; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_brupdate_b2_uop_pc_lob; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_taken; // @[fp-pipeline.scala 73:30]
  wire [19:0] fregister_read_io_brupdate_b2_uop_imm_packed; // @[fp-pipeline.scala 73:30]
  wire [11:0] fregister_read_io_brupdate_b2_uop_csr_addr; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_brupdate_b2_uop_rob_idx; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_brupdate_b2_uop_ldq_idx; // @[fp-pipeline.scala 73:30]
  wire [3:0] fregister_read_io_brupdate_b2_uop_stq_idx; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_brupdate_b2_uop_rxq_idx; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_brupdate_b2_uop_pdst; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_brupdate_b2_uop_prs1; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_brupdate_b2_uop_prs2; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_brupdate_b2_uop_prs3; // @[fp-pipeline.scala 73:30]
  wire [4:0] fregister_read_io_brupdate_b2_uop_ppred; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_prs1_busy; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_prs2_busy; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_prs3_busy; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_ppred_busy; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_brupdate_b2_uop_stale_pdst; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_exception; // @[fp-pipeline.scala 73:30]
  wire [63:0] fregister_read_io_brupdate_b2_uop_exc_cause; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_bypassable; // @[fp-pipeline.scala 73:30]
  wire [4:0] fregister_read_io_brupdate_b2_uop_mem_cmd; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_brupdate_b2_uop_mem_size; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_mem_signed; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_is_fence; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_is_fencei; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_is_amo; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_uses_ldq; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_uses_stq; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_is_sys_pc2epc; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_is_unique; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_flush_on_commit; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_ldst_is_rs1; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_brupdate_b2_uop_ldst; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_brupdate_b2_uop_lrs1; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_brupdate_b2_uop_lrs2; // @[fp-pipeline.scala 73:30]
  wire [5:0] fregister_read_io_brupdate_b2_uop_lrs3; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_ldst_val; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_brupdate_b2_uop_dst_rtype; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_brupdate_b2_uop_lrs1_rtype; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_brupdate_b2_uop_lrs2_rtype; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_frs3_en; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_fp_val; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_fp_single; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_xcpt_pf_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_xcpt_ae_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_xcpt_ma_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_bp_debug_if; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_uop_bp_xcpt_if; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_brupdate_b2_uop_debug_fsrc; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_brupdate_b2_uop_debug_tsrc; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_valid; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_mispredict; // @[fp-pipeline.scala 73:30]
  wire  fregister_read_io_brupdate_b2_taken; // @[fp-pipeline.scala 73:30]
  wire [2:0] fregister_read_io_brupdate_b2_cfi_type; // @[fp-pipeline.scala 73:30]
  wire [1:0] fregister_read_io_brupdate_b2_pc_sel; // @[fp-pipeline.scala 73:30]
  wire [39:0] fregister_read_io_brupdate_b2_jalr_target; // @[fp-pipeline.scala 73:30]
  wire [20:0] fregister_read_io_brupdate_b2_target_offset; // @[fp-pipeline.scala 73:30]
  wire  ll_wbarb_clock; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_reset; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_ready; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_valid; // @[fp-pipeline.scala 170:24]
  wire [6:0] ll_wbarb_io_in_0_bits_uop_uopc; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_in_0_bits_uop_inst; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_in_0_bits_uop_debug_inst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_is_rvc; // @[fp-pipeline.scala 170:24]
  wire [39:0] ll_wbarb_io_in_0_bits_uop_debug_pc; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_0_bits_uop_iq_type; // @[fp-pipeline.scala 170:24]
  wire [9:0] ll_wbarb_io_in_0_bits_uop_fu_code; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_0_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_0_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_0_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_0_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_0_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_uop_iw_state; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_is_br; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_is_jalr; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_is_jal; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_is_sfb; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_in_0_bits_uop_br_mask; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_0_bits_uop_br_tag; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_0_bits_uop_ftq_idx; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_edge_inst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_uop_pc_lob; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_taken; // @[fp-pipeline.scala 170:24]
  wire [19:0] ll_wbarb_io_in_0_bits_uop_imm_packed; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_in_0_bits_uop_csr_addr; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_uop_rob_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_0_bits_uop_ldq_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_0_bits_uop_stq_idx; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_uop_rxq_idx; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_uop_pdst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_uop_prs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_uop_prs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_uop_prs3; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_0_bits_uop_ppred; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_prs1_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_prs2_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_prs3_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_ppred_busy; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_uop_stale_pdst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_exception; // @[fp-pipeline.scala 170:24]
  wire [63:0] ll_wbarb_io_in_0_bits_uop_exc_cause; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_bypassable; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_0_bits_uop_mem_cmd; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_uop_mem_size; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_mem_signed; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_is_fence; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_is_fencei; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_is_amo; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_uses_ldq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_uses_stq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_is_unique; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_flush_on_commit; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_uop_ldst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_uop_lrs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_uop_lrs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_uop_lrs3; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_ldst_val; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_uop_dst_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_frs3_en; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_fp_val; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_fp_single; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_bp_debug_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_uop_debug_fsrc; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_uop_debug_tsrc; // @[fp-pipeline.scala 170:24]
  wire [64:0] ll_wbarb_io_in_0_bits_data; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_predicated; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_valid; // @[fp-pipeline.scala 170:24]
  wire [6:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_uopc; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_inst; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_inst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_is_rvc; // @[fp-pipeline.scala 170:24]
  wire [39:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_pc; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_iq_type; // @[fp-pipeline.scala 170:24]
  wire [9:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_fu_code; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_iw_state; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_is_br; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_is_jalr; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_is_jal; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_is_sfb; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_br_mask; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_br_tag; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_ftq_idx; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_edge_inst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_pc_lob; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_taken; // @[fp-pipeline.scala 170:24]
  wire [19:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_imm_packed; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_csr_addr; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_rob_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_ldq_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_stq_idx; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_rxq_idx; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_pdst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_prs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_prs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_prs3; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_ppred; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_prs1_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_prs2_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_prs3_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_ppred_busy; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_stale_pdst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_exception; // @[fp-pipeline.scala 170:24]
  wire [63:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_exc_cause; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_bypassable; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_mem_cmd; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_mem_size; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_mem_signed; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_is_fence; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_is_fencei; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_is_amo; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_uses_ldq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_uses_stq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_is_unique; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_flush_on_commit; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_ldst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs3; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_ldst_val; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_dst_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_frs3_en; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_fp_val; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_fp_single; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_bp_debug_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_0_bits_fflags_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_fsrc; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_tsrc; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_0_bits_fflags_bits_flags; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_ready; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_valid; // @[fp-pipeline.scala 170:24]
  wire [6:0] ll_wbarb_io_in_1_bits_uop_uopc; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_in_1_bits_uop_inst; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_in_1_bits_uop_debug_inst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_is_rvc; // @[fp-pipeline.scala 170:24]
  wire [39:0] ll_wbarb_io_in_1_bits_uop_debug_pc; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_1_bits_uop_iq_type; // @[fp-pipeline.scala 170:24]
  wire [9:0] ll_wbarb_io_in_1_bits_uop_fu_code; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_1_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_1_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_1_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_1_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_1_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_uop_iw_state; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_is_br; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_is_jalr; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_is_jal; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_is_sfb; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_in_1_bits_uop_br_mask; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_1_bits_uop_br_tag; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_1_bits_uop_ftq_idx; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_edge_inst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_uop_pc_lob; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_taken; // @[fp-pipeline.scala 170:24]
  wire [19:0] ll_wbarb_io_in_1_bits_uop_imm_packed; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_in_1_bits_uop_csr_addr; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_uop_rob_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_1_bits_uop_ldq_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_1_bits_uop_stq_idx; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_uop_rxq_idx; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_uop_pdst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_uop_prs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_uop_prs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_uop_prs3; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_1_bits_uop_ppred; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_prs1_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_prs2_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_prs3_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_ppred_busy; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_uop_stale_pdst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_exception; // @[fp-pipeline.scala 170:24]
  wire [63:0] ll_wbarb_io_in_1_bits_uop_exc_cause; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_bypassable; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_1_bits_uop_mem_cmd; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_uop_mem_size; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_mem_signed; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_is_fence; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_is_fencei; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_is_amo; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_uses_ldq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_uses_stq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_is_unique; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_flush_on_commit; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_uop_ldst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_uop_lrs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_uop_lrs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_uop_lrs3; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_ldst_val; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_uop_dst_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_frs3_en; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_fp_val; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_fp_single; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_bp_debug_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_uop_debug_fsrc; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_uop_debug_tsrc; // @[fp-pipeline.scala 170:24]
  wire [64:0] ll_wbarb_io_in_1_bits_data; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_predicated; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_valid; // @[fp-pipeline.scala 170:24]
  wire [6:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_uopc; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_inst; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_inst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_is_rvc; // @[fp-pipeline.scala 170:24]
  wire [39:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_pc; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_iq_type; // @[fp-pipeline.scala 170:24]
  wire [9:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_fu_code; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_iw_state; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_is_br; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_is_jalr; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_is_jal; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_is_sfb; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_br_mask; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_br_tag; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_ftq_idx; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_edge_inst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_pc_lob; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_taken; // @[fp-pipeline.scala 170:24]
  wire [19:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_imm_packed; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_csr_addr; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_rob_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_ldq_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_stq_idx; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_rxq_idx; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_pdst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_prs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_prs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_prs3; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_ppred; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_prs1_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_prs2_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_prs3_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_ppred_busy; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_stale_pdst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_exception; // @[fp-pipeline.scala 170:24]
  wire [63:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_exc_cause; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_bypassable; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_mem_cmd; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_mem_size; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_mem_signed; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_is_fence; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_is_fencei; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_is_amo; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_uses_ldq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_uses_stq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_is_unique; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_flush_on_commit; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_ldst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs3; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_ldst_val; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_dst_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_frs3_en; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_fp_val; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_fp_single; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_bp_debug_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_in_1_bits_fflags_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_fsrc; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_tsrc; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_in_1_bits_fflags_bits_flags; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_ready; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_valid; // @[fp-pipeline.scala 170:24]
  wire [6:0] ll_wbarb_io_out_bits_uop_uopc; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_out_bits_uop_inst; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_out_bits_uop_debug_inst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_is_rvc; // @[fp-pipeline.scala 170:24]
  wire [39:0] ll_wbarb_io_out_bits_uop_debug_pc; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_out_bits_uop_iq_type; // @[fp-pipeline.scala 170:24]
  wire [9:0] ll_wbarb_io_out_bits_uop_fu_code; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_out_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_out_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_out_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_out_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_out_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_uop_iw_state; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_is_br; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_is_jalr; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_is_jal; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_is_sfb; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_out_bits_uop_br_mask; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_out_bits_uop_br_tag; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_out_bits_uop_ftq_idx; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_edge_inst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_uop_pc_lob; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_taken; // @[fp-pipeline.scala 170:24]
  wire [19:0] ll_wbarb_io_out_bits_uop_imm_packed; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_out_bits_uop_csr_addr; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_uop_rob_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_out_bits_uop_ldq_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_out_bits_uop_stq_idx; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_uop_rxq_idx; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_uop_pdst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_uop_prs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_uop_prs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_uop_prs3; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_out_bits_uop_ppred; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_prs1_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_prs2_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_prs3_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_ppred_busy; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_uop_stale_pdst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_exception; // @[fp-pipeline.scala 170:24]
  wire [63:0] ll_wbarb_io_out_bits_uop_exc_cause; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_bypassable; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_out_bits_uop_mem_cmd; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_uop_mem_size; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_mem_signed; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_is_fence; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_is_fencei; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_is_amo; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_uses_ldq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_uses_stq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_is_unique; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_flush_on_commit; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_uop_ldst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_uop_lrs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_uop_lrs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_uop_lrs3; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_ldst_val; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_uop_dst_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_frs3_en; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_fp_val; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_fp_single; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_bp_debug_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_uop_debug_fsrc; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_uop_debug_tsrc; // @[fp-pipeline.scala 170:24]
  wire [64:0] ll_wbarb_io_out_bits_data; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_predicated; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_valid; // @[fp-pipeline.scala 170:24]
  wire [6:0] ll_wbarb_io_out_bits_fflags_bits_uop_uopc; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_out_bits_fflags_bits_uop_inst; // @[fp-pipeline.scala 170:24]
  wire [31:0] ll_wbarb_io_out_bits_fflags_bits_uop_debug_inst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_is_rvc; // @[fp-pipeline.scala 170:24]
  wire [39:0] ll_wbarb_io_out_bits_fflags_bits_uop_debug_pc; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_out_bits_fflags_bits_uop_iq_type; // @[fp-pipeline.scala 170:24]
  wire [9:0] ll_wbarb_io_out_bits_fflags_bits_uop_fu_code; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 170:24]
  wire [2:0] ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_fflags_bits_uop_iw_state; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_is_br; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_is_jalr; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_is_jal; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_is_sfb; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_out_bits_fflags_bits_uop_br_mask; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_out_bits_fflags_bits_uop_br_tag; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_out_bits_fflags_bits_uop_ftq_idx; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_edge_inst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_fflags_bits_uop_pc_lob; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_taken; // @[fp-pipeline.scala 170:24]
  wire [19:0] ll_wbarb_io_out_bits_fflags_bits_uop_imm_packed; // @[fp-pipeline.scala 170:24]
  wire [11:0] ll_wbarb_io_out_bits_fflags_bits_uop_csr_addr; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_fflags_bits_uop_rob_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_out_bits_fflags_bits_uop_ldq_idx; // @[fp-pipeline.scala 170:24]
  wire [3:0] ll_wbarb_io_out_bits_fflags_bits_uop_stq_idx; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_fflags_bits_uop_rxq_idx; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_fflags_bits_uop_pdst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_fflags_bits_uop_prs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_fflags_bits_uop_prs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_fflags_bits_uop_prs3; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_out_bits_fflags_bits_uop_ppred; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_prs1_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_prs2_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_prs3_busy; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_ppred_busy; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_fflags_bits_uop_stale_pdst; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_exception; // @[fp-pipeline.scala 170:24]
  wire [63:0] ll_wbarb_io_out_bits_fflags_bits_uop_exc_cause; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_bypassable; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_out_bits_fflags_bits_uop_mem_cmd; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_fflags_bits_uop_mem_size; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_mem_signed; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_is_fence; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_is_fencei; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_is_amo; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_uses_ldq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_uses_stq; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_is_unique; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_flush_on_commit; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_fflags_bits_uop_ldst; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_fflags_bits_uop_lrs1; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_fflags_bits_uop_lrs2; // @[fp-pipeline.scala 170:24]
  wire [5:0] ll_wbarb_io_out_bits_fflags_bits_uop_lrs3; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_ldst_val; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_fflags_bits_uop_dst_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_fflags_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_fflags_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_frs3_en; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_fp_val; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_fp_single; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_bp_debug_if; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_out_bits_fflags_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_fflags_bits_uop_debug_fsrc; // @[fp-pipeline.scala 170:24]
  wire [1:0] ll_wbarb_io_out_bits_fflags_bits_uop_debug_tsrc; // @[fp-pipeline.scala 170:24]
  wire [4:0] ll_wbarb_io_out_bits_fflags_bits_flags; // @[fp-pipeline.scala 170:24]
  wire  ll_wbarb_io_chosen; // @[fp-pipeline.scala 170:24]
  wire [9:0] iss_uops_0_fu_code = fp_issue_unit_io_iss_uops_0_fu_code; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  wire [9:0] _T = iss_uops_0_fu_code & 10'h80; // @[micro-op.scala 154:40]
  wire  _T_1 = _T != 10'h0; // @[micro-op.scala 154:47]
  wire  iss_valids_0 = fp_issue_unit_io_iss_valids_0; // @[fp-pipeline.scala 88:24 fp-pipeline.scala 118:19]
  wire  _T_2 = iss_valids_0 & _T_1; // @[fp-pipeline.scala 123:39]
  wire [9:0] _T_3 = _T_2 ? 10'h80 : 10'h0; // @[fp-pipeline.scala 124:41]
  reg [9:0] REG; // @[fp-pipeline.scala 124:36]
  wire  _T_6 = io_ll_wports_0_bits_uop_mem_size != 2'h2; // @[fp-pipeline.scala 176:75]
  wire [63:0] _T_8 = _T_6 ? 64'h0 : 64'hffffffff00000000; // @[package.scala 32:76]
  wire [64:0] _GEN_0 = {{1'd0}, _T_8}; // @[FPU.scala 426:23]
  wire [64:0] _T_9 = _GEN_0 | io_ll_wports_0_bits_data; // @[FPU.scala 426:23]
  wire  rawIn_sign = _T_9[63]; // @[rawFloatFromFN.scala 46:22]
  wire [10:0] rawIn_expIn = _T_9[62:52]; // @[rawFloatFromFN.scala 47:23]
  wire [51:0] rawIn_fractIn = _T_9[51:0]; // @[rawFloatFromFN.scala 48:25]
  wire  rawIn_isZeroExpIn = rawIn_expIn == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  rawIn_isZeroFractIn = rawIn_fractIn == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _rawIn_normDist_T_52 = rawIn_fractIn[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_53 = rawIn_fractIn[2] ? 6'h31 : _rawIn_normDist_T_52; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_54 = rawIn_fractIn[3] ? 6'h30 : _rawIn_normDist_T_53; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_55 = rawIn_fractIn[4] ? 6'h2f : _rawIn_normDist_T_54; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_56 = rawIn_fractIn[5] ? 6'h2e : _rawIn_normDist_T_55; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_57 = rawIn_fractIn[6] ? 6'h2d : _rawIn_normDist_T_56; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_58 = rawIn_fractIn[7] ? 6'h2c : _rawIn_normDist_T_57; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_59 = rawIn_fractIn[8] ? 6'h2b : _rawIn_normDist_T_58; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_60 = rawIn_fractIn[9] ? 6'h2a : _rawIn_normDist_T_59; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_61 = rawIn_fractIn[10] ? 6'h29 : _rawIn_normDist_T_60; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_62 = rawIn_fractIn[11] ? 6'h28 : _rawIn_normDist_T_61; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_63 = rawIn_fractIn[12] ? 6'h27 : _rawIn_normDist_T_62; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_64 = rawIn_fractIn[13] ? 6'h26 : _rawIn_normDist_T_63; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_65 = rawIn_fractIn[14] ? 6'h25 : _rawIn_normDist_T_64; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_66 = rawIn_fractIn[15] ? 6'h24 : _rawIn_normDist_T_65; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_67 = rawIn_fractIn[16] ? 6'h23 : _rawIn_normDist_T_66; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_68 = rawIn_fractIn[17] ? 6'h22 : _rawIn_normDist_T_67; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_69 = rawIn_fractIn[18] ? 6'h21 : _rawIn_normDist_T_68; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_70 = rawIn_fractIn[19] ? 6'h20 : _rawIn_normDist_T_69; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_71 = rawIn_fractIn[20] ? 6'h1f : _rawIn_normDist_T_70; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_72 = rawIn_fractIn[21] ? 6'h1e : _rawIn_normDist_T_71; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_73 = rawIn_fractIn[22] ? 6'h1d : _rawIn_normDist_T_72; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_74 = rawIn_fractIn[23] ? 6'h1c : _rawIn_normDist_T_73; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_75 = rawIn_fractIn[24] ? 6'h1b : _rawIn_normDist_T_74; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_76 = rawIn_fractIn[25] ? 6'h1a : _rawIn_normDist_T_75; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_77 = rawIn_fractIn[26] ? 6'h19 : _rawIn_normDist_T_76; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_78 = rawIn_fractIn[27] ? 6'h18 : _rawIn_normDist_T_77; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_79 = rawIn_fractIn[28] ? 6'h17 : _rawIn_normDist_T_78; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_80 = rawIn_fractIn[29] ? 6'h16 : _rawIn_normDist_T_79; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_81 = rawIn_fractIn[30] ? 6'h15 : _rawIn_normDist_T_80; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_82 = rawIn_fractIn[31] ? 6'h14 : _rawIn_normDist_T_81; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_83 = rawIn_fractIn[32] ? 6'h13 : _rawIn_normDist_T_82; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_84 = rawIn_fractIn[33] ? 6'h12 : _rawIn_normDist_T_83; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_85 = rawIn_fractIn[34] ? 6'h11 : _rawIn_normDist_T_84; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_86 = rawIn_fractIn[35] ? 6'h10 : _rawIn_normDist_T_85; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_87 = rawIn_fractIn[36] ? 6'hf : _rawIn_normDist_T_86; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_88 = rawIn_fractIn[37] ? 6'he : _rawIn_normDist_T_87; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_89 = rawIn_fractIn[38] ? 6'hd : _rawIn_normDist_T_88; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_90 = rawIn_fractIn[39] ? 6'hc : _rawIn_normDist_T_89; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_91 = rawIn_fractIn[40] ? 6'hb : _rawIn_normDist_T_90; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_92 = rawIn_fractIn[41] ? 6'ha : _rawIn_normDist_T_91; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_93 = rawIn_fractIn[42] ? 6'h9 : _rawIn_normDist_T_92; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_94 = rawIn_fractIn[43] ? 6'h8 : _rawIn_normDist_T_93; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_95 = rawIn_fractIn[44] ? 6'h7 : _rawIn_normDist_T_94; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_96 = rawIn_fractIn[45] ? 6'h6 : _rawIn_normDist_T_95; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_97 = rawIn_fractIn[46] ? 6'h5 : _rawIn_normDist_T_96; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_98 = rawIn_fractIn[47] ? 6'h4 : _rawIn_normDist_T_97; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_99 = rawIn_fractIn[48] ? 6'h3 : _rawIn_normDist_T_98; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_100 = rawIn_fractIn[49] ? 6'h2 : _rawIn_normDist_T_99; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_101 = rawIn_fractIn[50] ? 6'h1 : _rawIn_normDist_T_100; // @[Mux.scala 47:69]
  wire [5:0] rawIn_normDist = rawIn_fractIn[51] ? 6'h0 : _rawIn_normDist_T_101; // @[Mux.scala 47:69]
  wire [114:0] _GEN_1 = {{63'd0}, rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _rawIn_subnormFract_T = _GEN_1 << rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] rawIn_subnormFract = {_rawIn_subnormFract_T[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_2 = {{6'd0}, rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _rawIn_adjustedExp_T = _GEN_2 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _rawIn_adjustedExp_T_1 = rawIn_isZeroExpIn ? _rawIn_adjustedExp_T : {{1'd0}, rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _rawIn_adjustedExp_T_2 = rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_3 = {{9'd0}, _rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _rawIn_adjustedExp_T_3 = 11'h400 | _GEN_3; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_4 = {{1'd0}, _rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] rawIn_adjustedExp = _rawIn_adjustedExp_T_1 + _GEN_4; // @[rawFloatFromFN.scala 59:15]
  wire  rawIn_isZero = rawIn_isZeroExpIn & rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  rawIn_isSpecial = rawIn_adjustedExp[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  rawIn__isNaN = rawIn_isSpecial & ~rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] rawIn__sExp = {1'b0,$signed(rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  rawIn_out_sig_hi_lo = ~rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] rawIn_out_sig_lo = rawIn_isZeroExpIn ? rawIn_subnormFract : rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] rawIn__sig = {1'h0,rawIn_out_sig_hi_lo,rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire [2:0] _T_11 = rawIn_isZero ? 3'h0 : rawIn__sExp[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_5 = {{2'd0}, rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] hi_lo = _T_11 | _GEN_5; // @[recFNFromFN.scala 48:79]
  wire [8:0] lo_hi = rawIn__sExp[8:0]; // @[recFNFromFN.scala 50:23]
  wire [51:0] lo_lo = rawIn__sig[51:0]; // @[recFNFromFN.scala 51:22]
  wire [64:0] _T_13 = {rawIn_sign,hi_lo,lo_hi,lo_lo}; // @[Cat.scala 30:58]
  wire  rawIn_sign_1 = _T_9[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] rawIn_expIn_1 = _T_9[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] rawIn_fractIn_1 = _T_9[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  rawIn_isZeroExpIn_1 = rawIn_expIn_1 == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  rawIn_isZeroFractIn_1 = rawIn_fractIn_1 == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _rawIn_normDist_T_125 = rawIn_fractIn_1[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_126 = rawIn_fractIn_1[2] ? 5'h14 : _rawIn_normDist_T_125; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_127 = rawIn_fractIn_1[3] ? 5'h13 : _rawIn_normDist_T_126; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_128 = rawIn_fractIn_1[4] ? 5'h12 : _rawIn_normDist_T_127; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_129 = rawIn_fractIn_1[5] ? 5'h11 : _rawIn_normDist_T_128; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_130 = rawIn_fractIn_1[6] ? 5'h10 : _rawIn_normDist_T_129; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_131 = rawIn_fractIn_1[7] ? 5'hf : _rawIn_normDist_T_130; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_132 = rawIn_fractIn_1[8] ? 5'he : _rawIn_normDist_T_131; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_133 = rawIn_fractIn_1[9] ? 5'hd : _rawIn_normDist_T_132; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_134 = rawIn_fractIn_1[10] ? 5'hc : _rawIn_normDist_T_133; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_135 = rawIn_fractIn_1[11] ? 5'hb : _rawIn_normDist_T_134; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_136 = rawIn_fractIn_1[12] ? 5'ha : _rawIn_normDist_T_135; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_137 = rawIn_fractIn_1[13] ? 5'h9 : _rawIn_normDist_T_136; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_138 = rawIn_fractIn_1[14] ? 5'h8 : _rawIn_normDist_T_137; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_139 = rawIn_fractIn_1[15] ? 5'h7 : _rawIn_normDist_T_138; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_140 = rawIn_fractIn_1[16] ? 5'h6 : _rawIn_normDist_T_139; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_141 = rawIn_fractIn_1[17] ? 5'h5 : _rawIn_normDist_T_140; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_142 = rawIn_fractIn_1[18] ? 5'h4 : _rawIn_normDist_T_141; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_143 = rawIn_fractIn_1[19] ? 5'h3 : _rawIn_normDist_T_142; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_144 = rawIn_fractIn_1[20] ? 5'h2 : _rawIn_normDist_T_143; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_145 = rawIn_fractIn_1[21] ? 5'h1 : _rawIn_normDist_T_144; // @[Mux.scala 47:69]
  wire [4:0] rawIn_normDist_1 = rawIn_fractIn_1[22] ? 5'h0 : _rawIn_normDist_T_145; // @[Mux.scala 47:69]
  wire [53:0] _GEN_6 = {{31'd0}, rawIn_fractIn_1}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _rawIn_subnormFract_T_2 = _GEN_6 << rawIn_normDist_1; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] rawIn_subnormFract_1 = {_rawIn_subnormFract_T_2[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_7 = {{4'd0}, rawIn_normDist_1}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _rawIn_adjustedExp_T_5 = _GEN_7 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _rawIn_adjustedExp_T_6 = rawIn_isZeroExpIn_1 ? _rawIn_adjustedExp_T_5 : {{1'd0}, rawIn_expIn_1}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _rawIn_adjustedExp_T_7 = rawIn_isZeroExpIn_1 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_8 = {{6'd0}, _rawIn_adjustedExp_T_7}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _rawIn_adjustedExp_T_8 = 8'h80 | _GEN_8; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_9 = {{1'd0}, _rawIn_adjustedExp_T_8}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] rawIn_adjustedExp_1 = _rawIn_adjustedExp_T_6 + _GEN_9; // @[rawFloatFromFN.scala 59:15]
  wire  rawIn_isZero_1 = rawIn_isZeroExpIn_1 & rawIn_isZeroFractIn_1; // @[rawFloatFromFN.scala 62:34]
  wire  rawIn_isSpecial_1 = rawIn_adjustedExp_1[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  rawIn_1_isNaN = rawIn_isSpecial_1 & ~rawIn_isZeroFractIn_1; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] rawIn_1_sExp = {1'b0,$signed(rawIn_adjustedExp_1)}; // @[rawFloatFromFN.scala 70:48]
  wire  rawIn_out_sig_hi_lo_1 = ~rawIn_isZero_1; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] rawIn_out_sig_lo_1 = rawIn_isZeroExpIn_1 ? rawIn_subnormFract_1 : rawIn_fractIn_1; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] rawIn_1_sig = {1'h0,rawIn_out_sig_hi_lo_1,rawIn_out_sig_lo_1}; // @[Cat.scala 30:58]
  wire [2:0] _T_15 = rawIn_isZero_1 ? 3'h0 : rawIn_1_sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_10 = {{2'd0}, rawIn_1_isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] hi_lo_1 = _T_15 | _GEN_10; // @[recFNFromFN.scala 48:79]
  wire [5:0] lo_hi_1 = rawIn_1_sExp[5:0]; // @[recFNFromFN.scala 50:23]
  wire [22:0] lo_lo_1 = rawIn_1_sig[22:0]; // @[recFNFromFN.scala 51:22]
  wire [32:0] _T_17 = {rawIn_sign_1,hi_lo_1,lo_hi_1,lo_lo_1}; // @[Cat.scala 30:58]
  wire [3:0] swizzledNaN_hi_hi_hi = _T_13[64:61]; // @[FPU.scala 332:8]
  wire  swizzledNaN_hi_hi_lo = &_T_13[51:32]; // @[FPU.scala 333:42]
  wire [6:0] swizzledNaN_hi_lo_hi = _T_13[59:53]; // @[FPU.scala 334:8]
  wire  swizzledNaN_hi_lo_lo = _T_17[31]; // @[FPU.scala 335:8]
  wire  swizzledNaN_lo_hi_lo = _T_17[32]; // @[FPU.scala 337:8]
  wire [30:0] swizzledNaN_lo_lo = _T_17[30:0]; // @[FPU.scala 338:8]
  wire [64:0] swizzledNaN = {swizzledNaN_hi_hi_hi,swizzledNaN_hi_hi_lo,swizzledNaN_hi_lo_hi,swizzledNaN_hi_lo_lo,_T_13[
    51:32],swizzledNaN_lo_hi_lo,swizzledNaN_lo_lo}; // @[Cat.scala 30:58]
  wire  _T_19 = &_T_13[63:61]; // @[FPU.scala 243:56]
  reg  REG_1_valid; // @[fp-pipeline.scala 185:40]
  reg [5:0] REG_1_bits_addr; // @[fp-pipeline.scala 185:40]
  reg [64:0] REG_1_bits_data; // @[fp-pipeline.scala 185:40]
  wire  _T_26 = io_from_int_bits_uop_dst_rtype != 2'h2; // @[micro-op.scala 149:36]
  wire  _T_32 = fpiu_unit_io_fresp_bits_uop_dst_rtype != 2'h2; // @[micro-op.scala 149:36]
  wire  _T_41 = fpiu_unit_io_fresp_bits_uop_dst_rtype == 2'h1; // @[fp-pipeline.scala 206:47]
  wire  fpiu_is_sdq = fpiu_unit_io_ll_iresp_bits_uop_uopc == 7'h2; // @[fp-pipeline.scala 214:57]
  wire  _T_45 = fpiu_unit_io_ll_iresp_ready & fpiu_unit_io_ll_iresp_valid; // @[Decoupled.scala 40:37]
  wire [11:0] unrecoded_rawIn_exp = io_wakeups_0_bits_data[63:52]; // @[rawFloatFromRecFN.scala 50:21]
  wire  unrecoded_rawIn_isZero = unrecoded_rawIn_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  unrecoded_rawIn_isSpecial = unrecoded_rawIn_exp[11:10] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  unrecoded_rawIn__isNaN = unrecoded_rawIn_isSpecial & unrecoded_rawIn_exp[9]; // @[rawFloatFromRecFN.scala 55:33]
  wire  unrecoded_rawIn__isInf = unrecoded_rawIn_isSpecial & ~unrecoded_rawIn_exp[9]; // @[rawFloatFromRecFN.scala 56:33]
  wire  unrecoded_rawIn__sign = io_wakeups_0_bits_data[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] unrecoded_rawIn__sExp = {1'b0,$signed(unrecoded_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  unrecoded_rawIn_out_sig_hi_lo = ~unrecoded_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] unrecoded_rawIn_out_sig_lo = io_wakeups_0_bits_data[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [53:0] unrecoded_rawIn__sig = {1'h0,unrecoded_rawIn_out_sig_hi_lo,unrecoded_rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire  unrecoded_isSubnormal = $signed(unrecoded_rawIn__sExp) < 13'sh402; // @[fNFromRecFN.scala 50:39]
  wire [5:0] unrecoded_denormShiftDist = 6'h1 - unrecoded_rawIn__sExp[5:0]; // @[fNFromRecFN.scala 51:39]
  wire [52:0] _unrecoded_denormFract_T_1 = unrecoded_rawIn__sig[53:1] >> unrecoded_denormShiftDist; // @[fNFromRecFN.scala 52:42]
  wire [51:0] unrecoded_denormFract = _unrecoded_denormFract_T_1[51:0]; // @[fNFromRecFN.scala 52:60]
  wire [10:0] _unrecoded_expOut_T_2 = unrecoded_rawIn__sExp[10:0] - 11'h401; // @[fNFromRecFN.scala 57:45]
  wire [10:0] _unrecoded_expOut_T_3 = unrecoded_isSubnormal ? 11'h0 : _unrecoded_expOut_T_2; // @[fNFromRecFN.scala 55:16]
  wire  _unrecoded_expOut_T_4 = unrecoded_rawIn__isNaN | unrecoded_rawIn__isInf; // @[fNFromRecFN.scala 59:44]
  wire [10:0] _unrecoded_expOut_T_6 = _unrecoded_expOut_T_4 ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [10:0] unrecoded_hi_lo = _unrecoded_expOut_T_3 | _unrecoded_expOut_T_6; // @[fNFromRecFN.scala 59:15]
  wire [51:0] _unrecoded_fractOut_T_1 = unrecoded_rawIn__isInf ? 52'h0 : unrecoded_rawIn__sig[51:0]; // @[fNFromRecFN.scala 63:20]
  wire [51:0] unrecoded_lo = unrecoded_isSubnormal ? unrecoded_denormFract : _unrecoded_fractOut_T_1; // @[fNFromRecFN.scala 61:16]
  wire [63:0] unrecoded = {unrecoded_rawIn__sign,unrecoded_hi_lo,unrecoded_lo}; // @[Cat.scala 30:58]
  wire  prevRecoded_hi_hi = io_wakeups_0_bits_data[31]; // @[FPU.scala 437:10]
  wire  prevRecoded_hi_lo = io_wakeups_0_bits_data[52]; // @[FPU.scala 438:10]
  wire [30:0] prevRecoded_lo = io_wakeups_0_bits_data[30:0]; // @[FPU.scala 439:10]
  wire [32:0] prevRecoded = {prevRecoded_hi_hi,prevRecoded_hi_lo,prevRecoded_lo}; // @[Cat.scala 30:58]
  wire [8:0] prevUnrecoded_rawIn_exp = prevRecoded[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  prevUnrecoded_rawIn_isZero = prevUnrecoded_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  prevUnrecoded_rawIn_isSpecial = prevUnrecoded_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  prevUnrecoded_rawIn__isNaN = prevUnrecoded_rawIn_isSpecial & prevUnrecoded_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  wire  prevUnrecoded_rawIn__isInf = prevUnrecoded_rawIn_isSpecial & ~prevUnrecoded_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  prevUnrecoded_rawIn__sign = prevRecoded[32]; // @[rawFloatFromRecFN.scala 58:25]
  wire [9:0] prevUnrecoded_rawIn__sExp = {1'b0,$signed(prevUnrecoded_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  prevUnrecoded_rawIn_out_sig_hi_lo = ~prevUnrecoded_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [22:0] prevUnrecoded_rawIn_out_sig_lo = prevRecoded[22:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [24:0] prevUnrecoded_rawIn__sig = {1'h0,prevUnrecoded_rawIn_out_sig_hi_lo,prevUnrecoded_rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire  prevUnrecoded_isSubnormal = $signed(prevUnrecoded_rawIn__sExp) < 10'sh82; // @[fNFromRecFN.scala 50:39]
  wire [4:0] prevUnrecoded_denormShiftDist = 5'h1 - prevUnrecoded_rawIn__sExp[4:0]; // @[fNFromRecFN.scala 51:39]
  wire [23:0] _prevUnrecoded_denormFract_T_1 = prevUnrecoded_rawIn__sig[24:1] >> prevUnrecoded_denormShiftDist; // @[fNFromRecFN.scala 52:42]
  wire [22:0] prevUnrecoded_denormFract = _prevUnrecoded_denormFract_T_1[22:0]; // @[fNFromRecFN.scala 52:60]
  wire [7:0] _prevUnrecoded_expOut_T_2 = prevUnrecoded_rawIn__sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 57:45]
  wire [7:0] _prevUnrecoded_expOut_T_3 = prevUnrecoded_isSubnormal ? 8'h0 : _prevUnrecoded_expOut_T_2; // @[fNFromRecFN.scala 55:16]
  wire  _prevUnrecoded_expOut_T_4 = prevUnrecoded_rawIn__isNaN | prevUnrecoded_rawIn__isInf; // @[fNFromRecFN.scala 59:44]
  wire [7:0] _prevUnrecoded_expOut_T_6 = _prevUnrecoded_expOut_T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] prevUnrecoded_hi_lo = _prevUnrecoded_expOut_T_3 | _prevUnrecoded_expOut_T_6; // @[fNFromRecFN.scala 59:15]
  wire [22:0] _prevUnrecoded_fractOut_T_1 = prevUnrecoded_rawIn__isInf ? 23'h0 : prevUnrecoded_rawIn__sig[22:0]; // @[fNFromRecFN.scala 63:20]
  wire [22:0] prevUnrecoded_lo = prevUnrecoded_isSubnormal ? prevUnrecoded_denormFract : _prevUnrecoded_fractOut_T_1; // @[fNFromRecFN.scala 61:16]
  wire [31:0] prevUnrecoded = {prevUnrecoded_rawIn__sign,prevUnrecoded_hi_lo,prevUnrecoded_lo}; // @[Cat.scala 30:58]
  wire [31:0] hi_2 = unrecoded[63:32]; // @[FPU.scala 441:21]
  wire  _T_69 = &io_wakeups_0_bits_data[63:61]; // @[FPU.scala 243:56]
  wire [31:0] lo_2 = _T_69 ? prevUnrecoded : unrecoded[31:0]; // @[FPU.scala 441:44]
  wire [63:0] _T_71 = {hi_2,lo_2}; // @[Cat.scala 30:58]
  wire [11:0] unrecoded_rawIn_exp_1 = io_wakeups_1_bits_data[63:52]; // @[rawFloatFromRecFN.scala 50:21]
  wire  unrecoded_rawIn_isZero_1 = unrecoded_rawIn_exp_1[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  unrecoded_rawIn_isSpecial_1 = unrecoded_rawIn_exp_1[11:10] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  unrecoded_rawIn_1_isNaN = unrecoded_rawIn_isSpecial_1 & unrecoded_rawIn_exp_1[9]; // @[rawFloatFromRecFN.scala 55:33]
  wire  unrecoded_rawIn_1_isInf = unrecoded_rawIn_isSpecial_1 & ~unrecoded_rawIn_exp_1[9]; // @[rawFloatFromRecFN.scala 56:33]
  wire  unrecoded_rawIn_1_sign = io_wakeups_1_bits_data[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] unrecoded_rawIn_1_sExp = {1'b0,$signed(unrecoded_rawIn_exp_1)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  unrecoded_rawIn_out_sig_hi_lo_1 = ~unrecoded_rawIn_isZero_1; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] unrecoded_rawIn_out_sig_lo_1 = io_wakeups_1_bits_data[51:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [53:0] unrecoded_rawIn_1_sig = {1'h0,unrecoded_rawIn_out_sig_hi_lo_1,unrecoded_rawIn_out_sig_lo_1}; // @[Cat.scala 30:58]
  wire  unrecoded_isSubnormal_1 = $signed(unrecoded_rawIn_1_sExp) < 13'sh402; // @[fNFromRecFN.scala 50:39]
  wire [5:0] unrecoded_denormShiftDist_1 = 6'h1 - unrecoded_rawIn_1_sExp[5:0]; // @[fNFromRecFN.scala 51:39]
  wire [52:0] _unrecoded_denormFract_T_3 = unrecoded_rawIn_1_sig[53:1] >> unrecoded_denormShiftDist_1; // @[fNFromRecFN.scala 52:42]
  wire [51:0] unrecoded_denormFract_1 = _unrecoded_denormFract_T_3[51:0]; // @[fNFromRecFN.scala 52:60]
  wire [10:0] _unrecoded_expOut_T_9 = unrecoded_rawIn_1_sExp[10:0] - 11'h401; // @[fNFromRecFN.scala 57:45]
  wire [10:0] _unrecoded_expOut_T_10 = unrecoded_isSubnormal_1 ? 11'h0 : _unrecoded_expOut_T_9; // @[fNFromRecFN.scala 55:16]
  wire  _unrecoded_expOut_T_11 = unrecoded_rawIn_1_isNaN | unrecoded_rawIn_1_isInf; // @[fNFromRecFN.scala 59:44]
  wire [10:0] _unrecoded_expOut_T_13 = _unrecoded_expOut_T_11 ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [10:0] unrecoded_hi_lo_1 = _unrecoded_expOut_T_10 | _unrecoded_expOut_T_13; // @[fNFromRecFN.scala 59:15]
  wire [51:0] _unrecoded_fractOut_T_3 = unrecoded_rawIn_1_isInf ? 52'h0 : unrecoded_rawIn_1_sig[51:0]; // @[fNFromRecFN.scala 63:20]
  wire [51:0] unrecoded_lo_1 = unrecoded_isSubnormal_1 ? unrecoded_denormFract_1 : _unrecoded_fractOut_T_3; // @[fNFromRecFN.scala 61:16]
  wire [63:0] unrecoded_1 = {unrecoded_rawIn_1_sign,unrecoded_hi_lo_1,unrecoded_lo_1}; // @[Cat.scala 30:58]
  wire  prevRecoded_hi_hi_1 = io_wakeups_1_bits_data[31]; // @[FPU.scala 437:10]
  wire  prevRecoded_hi_lo_1 = io_wakeups_1_bits_data[52]; // @[FPU.scala 438:10]
  wire [30:0] prevRecoded_lo_1 = io_wakeups_1_bits_data[30:0]; // @[FPU.scala 439:10]
  wire [32:0] prevRecoded_1 = {prevRecoded_hi_hi_1,prevRecoded_hi_lo_1,prevRecoded_lo_1}; // @[Cat.scala 30:58]
  wire [8:0] prevUnrecoded_rawIn_exp_1 = prevRecoded_1[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  prevUnrecoded_rawIn_isZero_1 = prevUnrecoded_rawIn_exp_1[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  prevUnrecoded_rawIn_isSpecial_1 = prevUnrecoded_rawIn_exp_1[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  prevUnrecoded_rawIn_1_isNaN = prevUnrecoded_rawIn_isSpecial_1 & prevUnrecoded_rawIn_exp_1[6]; // @[rawFloatFromRecFN.scala 55:33]
  wire  prevUnrecoded_rawIn_1_isInf = prevUnrecoded_rawIn_isSpecial_1 & ~prevUnrecoded_rawIn_exp_1[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  prevUnrecoded_rawIn_1_sign = prevRecoded_1[32]; // @[rawFloatFromRecFN.scala 58:25]
  wire [9:0] prevUnrecoded_rawIn_1_sExp = {1'b0,$signed(prevUnrecoded_rawIn_exp_1)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  prevUnrecoded_rawIn_out_sig_hi_lo_1 = ~prevUnrecoded_rawIn_isZero_1; // @[rawFloatFromRecFN.scala 60:39]
  wire [22:0] prevUnrecoded_rawIn_out_sig_lo_1 = prevRecoded_1[22:0]; // @[rawFloatFromRecFN.scala 60:51]
  wire [24:0] prevUnrecoded_rawIn_1_sig = {1'h0,prevUnrecoded_rawIn_out_sig_hi_lo_1,prevUnrecoded_rawIn_out_sig_lo_1}; // @[Cat.scala 30:58]
  wire  prevUnrecoded_isSubnormal_1 = $signed(prevUnrecoded_rawIn_1_sExp) < 10'sh82; // @[fNFromRecFN.scala 50:39]
  wire [4:0] prevUnrecoded_denormShiftDist_1 = 5'h1 - prevUnrecoded_rawIn_1_sExp[4:0]; // @[fNFromRecFN.scala 51:39]
  wire [23:0] _prevUnrecoded_denormFract_T_3 = prevUnrecoded_rawIn_1_sig[24:1] >> prevUnrecoded_denormShiftDist_1; // @[fNFromRecFN.scala 52:42]
  wire [22:0] prevUnrecoded_denormFract_1 = _prevUnrecoded_denormFract_T_3[22:0]; // @[fNFromRecFN.scala 52:60]
  wire [7:0] _prevUnrecoded_expOut_T_9 = prevUnrecoded_rawIn_1_sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 57:45]
  wire [7:0] _prevUnrecoded_expOut_T_10 = prevUnrecoded_isSubnormal_1 ? 8'h0 : _prevUnrecoded_expOut_T_9; // @[fNFromRecFN.scala 55:16]
  wire  _prevUnrecoded_expOut_T_11 = prevUnrecoded_rawIn_1_isNaN | prevUnrecoded_rawIn_1_isInf; // @[fNFromRecFN.scala 59:44]
  wire [7:0] _prevUnrecoded_expOut_T_13 = _prevUnrecoded_expOut_T_11 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] prevUnrecoded_hi_lo_1 = _prevUnrecoded_expOut_T_10 | _prevUnrecoded_expOut_T_13; // @[fNFromRecFN.scala 59:15]
  wire [22:0] _prevUnrecoded_fractOut_T_3 = prevUnrecoded_rawIn_1_isInf ? 23'h0 : prevUnrecoded_rawIn_1_sig[22:0]; // @[fNFromRecFN.scala 63:20]
  wire [22:0] prevUnrecoded_lo_1 = prevUnrecoded_isSubnormal_1 ? prevUnrecoded_denormFract_1 :
    _prevUnrecoded_fractOut_T_3; // @[fNFromRecFN.scala 61:16]
  wire [31:0] prevUnrecoded_1 = {prevUnrecoded_rawIn_1_sign,prevUnrecoded_hi_lo_1,prevUnrecoded_lo_1}; // @[Cat.scala 30:58]
  wire [31:0] hi_3 = unrecoded_1[63:32]; // @[FPU.scala 441:21]
  wire  _T_73 = &io_wakeups_1_bits_data[63:61]; // @[FPU.scala 243:56]
  wire [31:0] lo_3 = _T_73 ? prevUnrecoded_1 : unrecoded_1[31:0]; // @[FPU.scala 441:44]
  wire [63:0] _T_75 = {hi_3,lo_3}; // @[Cat.scala 30:58]
  FPUExeUnit fpiu_unit ( // @[execution-units.scala 131:32]
    .clock(fpiu_unit_clock),
    .reset(fpiu_unit_reset),
    .io_fu_types(fpiu_unit_io_fu_types),
    .io_req_ready(fpiu_unit_io_req_ready),
    .io_req_valid(fpiu_unit_io_req_valid),
    .io_req_bits_uop_uopc(fpiu_unit_io_req_bits_uop_uopc),
    .io_req_bits_uop_inst(fpiu_unit_io_req_bits_uop_inst),
    .io_req_bits_uop_debug_inst(fpiu_unit_io_req_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc(fpiu_unit_io_req_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc(fpiu_unit_io_req_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type(fpiu_unit_io_req_bits_uop_iq_type),
    .io_req_bits_uop_fu_code(fpiu_unit_io_req_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type(fpiu_unit_io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel(fpiu_unit_io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel(fpiu_unit_io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel(fpiu_unit_io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn(fpiu_unit_io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw(fpiu_unit_io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd(fpiu_unit_io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load(fpiu_unit_io_req_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta(fpiu_unit_io_req_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std(fpiu_unit_io_req_bits_uop_ctrl_is_std),
    .io_req_bits_uop_iw_state(fpiu_unit_io_req_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned(fpiu_unit_io_req_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned(fpiu_unit_io_req_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br(fpiu_unit_io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr(fpiu_unit_io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal(fpiu_unit_io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb(fpiu_unit_io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask(fpiu_unit_io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag(fpiu_unit_io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx(fpiu_unit_io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst(fpiu_unit_io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob(fpiu_unit_io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken(fpiu_unit_io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed(fpiu_unit_io_req_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr(fpiu_unit_io_req_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx(fpiu_unit_io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx(fpiu_unit_io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx(fpiu_unit_io_req_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx(fpiu_unit_io_req_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst(fpiu_unit_io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1(fpiu_unit_io_req_bits_uop_prs1),
    .io_req_bits_uop_prs2(fpiu_unit_io_req_bits_uop_prs2),
    .io_req_bits_uop_prs3(fpiu_unit_io_req_bits_uop_prs3),
    .io_req_bits_uop_ppred(fpiu_unit_io_req_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy(fpiu_unit_io_req_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy(fpiu_unit_io_req_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy(fpiu_unit_io_req_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy(fpiu_unit_io_req_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst(fpiu_unit_io_req_bits_uop_stale_pdst),
    .io_req_bits_uop_exception(fpiu_unit_io_req_bits_uop_exception),
    .io_req_bits_uop_exc_cause(fpiu_unit_io_req_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable(fpiu_unit_io_req_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd(fpiu_unit_io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size(fpiu_unit_io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed(fpiu_unit_io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence(fpiu_unit_io_req_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei(fpiu_unit_io_req_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo(fpiu_unit_io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq(fpiu_unit_io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq(fpiu_unit_io_req_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc(fpiu_unit_io_req_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique(fpiu_unit_io_req_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit(fpiu_unit_io_req_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1(fpiu_unit_io_req_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst(fpiu_unit_io_req_bits_uop_ldst),
    .io_req_bits_uop_lrs1(fpiu_unit_io_req_bits_uop_lrs1),
    .io_req_bits_uop_lrs2(fpiu_unit_io_req_bits_uop_lrs2),
    .io_req_bits_uop_lrs3(fpiu_unit_io_req_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val(fpiu_unit_io_req_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype(fpiu_unit_io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype(fpiu_unit_io_req_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype(fpiu_unit_io_req_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en(fpiu_unit_io_req_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val(fpiu_unit_io_req_bits_uop_fp_val),
    .io_req_bits_uop_fp_single(fpiu_unit_io_req_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if(fpiu_unit_io_req_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if(fpiu_unit_io_req_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if(fpiu_unit_io_req_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if(fpiu_unit_io_req_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if(fpiu_unit_io_req_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc(fpiu_unit_io_req_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc(fpiu_unit_io_req_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data(fpiu_unit_io_req_bits_rs1_data),
    .io_req_bits_rs2_data(fpiu_unit_io_req_bits_rs2_data),
    .io_req_bits_rs3_data(fpiu_unit_io_req_bits_rs3_data),
    .io_req_bits_pred_data(fpiu_unit_io_req_bits_pred_data),
    .io_req_bits_kill(fpiu_unit_io_req_bits_kill),
    .io_fresp_ready(fpiu_unit_io_fresp_ready),
    .io_fresp_valid(fpiu_unit_io_fresp_valid),
    .io_fresp_bits_uop_uopc(fpiu_unit_io_fresp_bits_uop_uopc),
    .io_fresp_bits_uop_inst(fpiu_unit_io_fresp_bits_uop_inst),
    .io_fresp_bits_uop_debug_inst(fpiu_unit_io_fresp_bits_uop_debug_inst),
    .io_fresp_bits_uop_is_rvc(fpiu_unit_io_fresp_bits_uop_is_rvc),
    .io_fresp_bits_uop_debug_pc(fpiu_unit_io_fresp_bits_uop_debug_pc),
    .io_fresp_bits_uop_iq_type(fpiu_unit_io_fresp_bits_uop_iq_type),
    .io_fresp_bits_uop_fu_code(fpiu_unit_io_fresp_bits_uop_fu_code),
    .io_fresp_bits_uop_ctrl_br_type(fpiu_unit_io_fresp_bits_uop_ctrl_br_type),
    .io_fresp_bits_uop_ctrl_op1_sel(fpiu_unit_io_fresp_bits_uop_ctrl_op1_sel),
    .io_fresp_bits_uop_ctrl_op2_sel(fpiu_unit_io_fresp_bits_uop_ctrl_op2_sel),
    .io_fresp_bits_uop_ctrl_imm_sel(fpiu_unit_io_fresp_bits_uop_ctrl_imm_sel),
    .io_fresp_bits_uop_ctrl_op_fcn(fpiu_unit_io_fresp_bits_uop_ctrl_op_fcn),
    .io_fresp_bits_uop_ctrl_fcn_dw(fpiu_unit_io_fresp_bits_uop_ctrl_fcn_dw),
    .io_fresp_bits_uop_ctrl_csr_cmd(fpiu_unit_io_fresp_bits_uop_ctrl_csr_cmd),
    .io_fresp_bits_uop_ctrl_is_load(fpiu_unit_io_fresp_bits_uop_ctrl_is_load),
    .io_fresp_bits_uop_ctrl_is_sta(fpiu_unit_io_fresp_bits_uop_ctrl_is_sta),
    .io_fresp_bits_uop_ctrl_is_std(fpiu_unit_io_fresp_bits_uop_ctrl_is_std),
    .io_fresp_bits_uop_iw_state(fpiu_unit_io_fresp_bits_uop_iw_state),
    .io_fresp_bits_uop_iw_p1_poisoned(fpiu_unit_io_fresp_bits_uop_iw_p1_poisoned),
    .io_fresp_bits_uop_iw_p2_poisoned(fpiu_unit_io_fresp_bits_uop_iw_p2_poisoned),
    .io_fresp_bits_uop_is_br(fpiu_unit_io_fresp_bits_uop_is_br),
    .io_fresp_bits_uop_is_jalr(fpiu_unit_io_fresp_bits_uop_is_jalr),
    .io_fresp_bits_uop_is_jal(fpiu_unit_io_fresp_bits_uop_is_jal),
    .io_fresp_bits_uop_is_sfb(fpiu_unit_io_fresp_bits_uop_is_sfb),
    .io_fresp_bits_uop_br_mask(fpiu_unit_io_fresp_bits_uop_br_mask),
    .io_fresp_bits_uop_br_tag(fpiu_unit_io_fresp_bits_uop_br_tag),
    .io_fresp_bits_uop_ftq_idx(fpiu_unit_io_fresp_bits_uop_ftq_idx),
    .io_fresp_bits_uop_edge_inst(fpiu_unit_io_fresp_bits_uop_edge_inst),
    .io_fresp_bits_uop_pc_lob(fpiu_unit_io_fresp_bits_uop_pc_lob),
    .io_fresp_bits_uop_taken(fpiu_unit_io_fresp_bits_uop_taken),
    .io_fresp_bits_uop_imm_packed(fpiu_unit_io_fresp_bits_uop_imm_packed),
    .io_fresp_bits_uop_csr_addr(fpiu_unit_io_fresp_bits_uop_csr_addr),
    .io_fresp_bits_uop_rob_idx(fpiu_unit_io_fresp_bits_uop_rob_idx),
    .io_fresp_bits_uop_ldq_idx(fpiu_unit_io_fresp_bits_uop_ldq_idx),
    .io_fresp_bits_uop_stq_idx(fpiu_unit_io_fresp_bits_uop_stq_idx),
    .io_fresp_bits_uop_rxq_idx(fpiu_unit_io_fresp_bits_uop_rxq_idx),
    .io_fresp_bits_uop_pdst(fpiu_unit_io_fresp_bits_uop_pdst),
    .io_fresp_bits_uop_prs1(fpiu_unit_io_fresp_bits_uop_prs1),
    .io_fresp_bits_uop_prs2(fpiu_unit_io_fresp_bits_uop_prs2),
    .io_fresp_bits_uop_prs3(fpiu_unit_io_fresp_bits_uop_prs3),
    .io_fresp_bits_uop_ppred(fpiu_unit_io_fresp_bits_uop_ppred),
    .io_fresp_bits_uop_prs1_busy(fpiu_unit_io_fresp_bits_uop_prs1_busy),
    .io_fresp_bits_uop_prs2_busy(fpiu_unit_io_fresp_bits_uop_prs2_busy),
    .io_fresp_bits_uop_prs3_busy(fpiu_unit_io_fresp_bits_uop_prs3_busy),
    .io_fresp_bits_uop_ppred_busy(fpiu_unit_io_fresp_bits_uop_ppred_busy),
    .io_fresp_bits_uop_stale_pdst(fpiu_unit_io_fresp_bits_uop_stale_pdst),
    .io_fresp_bits_uop_exception(fpiu_unit_io_fresp_bits_uop_exception),
    .io_fresp_bits_uop_exc_cause(fpiu_unit_io_fresp_bits_uop_exc_cause),
    .io_fresp_bits_uop_bypassable(fpiu_unit_io_fresp_bits_uop_bypassable),
    .io_fresp_bits_uop_mem_cmd(fpiu_unit_io_fresp_bits_uop_mem_cmd),
    .io_fresp_bits_uop_mem_size(fpiu_unit_io_fresp_bits_uop_mem_size),
    .io_fresp_bits_uop_mem_signed(fpiu_unit_io_fresp_bits_uop_mem_signed),
    .io_fresp_bits_uop_is_fence(fpiu_unit_io_fresp_bits_uop_is_fence),
    .io_fresp_bits_uop_is_fencei(fpiu_unit_io_fresp_bits_uop_is_fencei),
    .io_fresp_bits_uop_is_amo(fpiu_unit_io_fresp_bits_uop_is_amo),
    .io_fresp_bits_uop_uses_ldq(fpiu_unit_io_fresp_bits_uop_uses_ldq),
    .io_fresp_bits_uop_uses_stq(fpiu_unit_io_fresp_bits_uop_uses_stq),
    .io_fresp_bits_uop_is_sys_pc2epc(fpiu_unit_io_fresp_bits_uop_is_sys_pc2epc),
    .io_fresp_bits_uop_is_unique(fpiu_unit_io_fresp_bits_uop_is_unique),
    .io_fresp_bits_uop_flush_on_commit(fpiu_unit_io_fresp_bits_uop_flush_on_commit),
    .io_fresp_bits_uop_ldst_is_rs1(fpiu_unit_io_fresp_bits_uop_ldst_is_rs1),
    .io_fresp_bits_uop_ldst(fpiu_unit_io_fresp_bits_uop_ldst),
    .io_fresp_bits_uop_lrs1(fpiu_unit_io_fresp_bits_uop_lrs1),
    .io_fresp_bits_uop_lrs2(fpiu_unit_io_fresp_bits_uop_lrs2),
    .io_fresp_bits_uop_lrs3(fpiu_unit_io_fresp_bits_uop_lrs3),
    .io_fresp_bits_uop_ldst_val(fpiu_unit_io_fresp_bits_uop_ldst_val),
    .io_fresp_bits_uop_dst_rtype(fpiu_unit_io_fresp_bits_uop_dst_rtype),
    .io_fresp_bits_uop_lrs1_rtype(fpiu_unit_io_fresp_bits_uop_lrs1_rtype),
    .io_fresp_bits_uop_lrs2_rtype(fpiu_unit_io_fresp_bits_uop_lrs2_rtype),
    .io_fresp_bits_uop_frs3_en(fpiu_unit_io_fresp_bits_uop_frs3_en),
    .io_fresp_bits_uop_fp_val(fpiu_unit_io_fresp_bits_uop_fp_val),
    .io_fresp_bits_uop_fp_single(fpiu_unit_io_fresp_bits_uop_fp_single),
    .io_fresp_bits_uop_xcpt_pf_if(fpiu_unit_io_fresp_bits_uop_xcpt_pf_if),
    .io_fresp_bits_uop_xcpt_ae_if(fpiu_unit_io_fresp_bits_uop_xcpt_ae_if),
    .io_fresp_bits_uop_xcpt_ma_if(fpiu_unit_io_fresp_bits_uop_xcpt_ma_if),
    .io_fresp_bits_uop_bp_debug_if(fpiu_unit_io_fresp_bits_uop_bp_debug_if),
    .io_fresp_bits_uop_bp_xcpt_if(fpiu_unit_io_fresp_bits_uop_bp_xcpt_if),
    .io_fresp_bits_uop_debug_fsrc(fpiu_unit_io_fresp_bits_uop_debug_fsrc),
    .io_fresp_bits_uop_debug_tsrc(fpiu_unit_io_fresp_bits_uop_debug_tsrc),
    .io_fresp_bits_data(fpiu_unit_io_fresp_bits_data),
    .io_fresp_bits_predicated(fpiu_unit_io_fresp_bits_predicated),
    .io_fresp_bits_fflags_valid(fpiu_unit_io_fresp_bits_fflags_valid),
    .io_fresp_bits_fflags_bits_uop_uopc(fpiu_unit_io_fresp_bits_fflags_bits_uop_uopc),
    .io_fresp_bits_fflags_bits_uop_inst(fpiu_unit_io_fresp_bits_fflags_bits_uop_inst),
    .io_fresp_bits_fflags_bits_uop_debug_inst(fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_inst),
    .io_fresp_bits_fflags_bits_uop_is_rvc(fpiu_unit_io_fresp_bits_fflags_bits_uop_is_rvc),
    .io_fresp_bits_fflags_bits_uop_debug_pc(fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_pc),
    .io_fresp_bits_fflags_bits_uop_iq_type(fpiu_unit_io_fresp_bits_fflags_bits_uop_iq_type),
    .io_fresp_bits_fflags_bits_uop_fu_code(fpiu_unit_io_fresp_bits_fflags_bits_uop_fu_code),
    .io_fresp_bits_fflags_bits_uop_ctrl_br_type(fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_br_type),
    .io_fresp_bits_fflags_bits_uop_ctrl_op1_sel(fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_fresp_bits_fflags_bits_uop_ctrl_op2_sel(fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_fresp_bits_fflags_bits_uop_ctrl_imm_sel(fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_fresp_bits_fflags_bits_uop_ctrl_op_fcn(fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_fresp_bits_fflags_bits_uop_ctrl_fcn_dw(fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_fresp_bits_fflags_bits_uop_ctrl_csr_cmd(fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_fresp_bits_fflags_bits_uop_ctrl_is_load(fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_is_load),
    .io_fresp_bits_fflags_bits_uop_ctrl_is_sta(fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_fresp_bits_fflags_bits_uop_ctrl_is_std(fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_is_std),
    .io_fresp_bits_fflags_bits_uop_iw_state(fpiu_unit_io_fresp_bits_fflags_bits_uop_iw_state),
    .io_fresp_bits_fflags_bits_uop_iw_p1_poisoned(fpiu_unit_io_fresp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_fresp_bits_fflags_bits_uop_iw_p2_poisoned(fpiu_unit_io_fresp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_fresp_bits_fflags_bits_uop_is_br(fpiu_unit_io_fresp_bits_fflags_bits_uop_is_br),
    .io_fresp_bits_fflags_bits_uop_is_jalr(fpiu_unit_io_fresp_bits_fflags_bits_uop_is_jalr),
    .io_fresp_bits_fflags_bits_uop_is_jal(fpiu_unit_io_fresp_bits_fflags_bits_uop_is_jal),
    .io_fresp_bits_fflags_bits_uop_is_sfb(fpiu_unit_io_fresp_bits_fflags_bits_uop_is_sfb),
    .io_fresp_bits_fflags_bits_uop_br_mask(fpiu_unit_io_fresp_bits_fflags_bits_uop_br_mask),
    .io_fresp_bits_fflags_bits_uop_br_tag(fpiu_unit_io_fresp_bits_fflags_bits_uop_br_tag),
    .io_fresp_bits_fflags_bits_uop_ftq_idx(fpiu_unit_io_fresp_bits_fflags_bits_uop_ftq_idx),
    .io_fresp_bits_fflags_bits_uop_edge_inst(fpiu_unit_io_fresp_bits_fflags_bits_uop_edge_inst),
    .io_fresp_bits_fflags_bits_uop_pc_lob(fpiu_unit_io_fresp_bits_fflags_bits_uop_pc_lob),
    .io_fresp_bits_fflags_bits_uop_taken(fpiu_unit_io_fresp_bits_fflags_bits_uop_taken),
    .io_fresp_bits_fflags_bits_uop_imm_packed(fpiu_unit_io_fresp_bits_fflags_bits_uop_imm_packed),
    .io_fresp_bits_fflags_bits_uop_csr_addr(fpiu_unit_io_fresp_bits_fflags_bits_uop_csr_addr),
    .io_fresp_bits_fflags_bits_uop_rob_idx(fpiu_unit_io_fresp_bits_fflags_bits_uop_rob_idx),
    .io_fresp_bits_fflags_bits_uop_ldq_idx(fpiu_unit_io_fresp_bits_fflags_bits_uop_ldq_idx),
    .io_fresp_bits_fflags_bits_uop_stq_idx(fpiu_unit_io_fresp_bits_fflags_bits_uop_stq_idx),
    .io_fresp_bits_fflags_bits_uop_rxq_idx(fpiu_unit_io_fresp_bits_fflags_bits_uop_rxq_idx),
    .io_fresp_bits_fflags_bits_uop_pdst(fpiu_unit_io_fresp_bits_fflags_bits_uop_pdst),
    .io_fresp_bits_fflags_bits_uop_prs1(fpiu_unit_io_fresp_bits_fflags_bits_uop_prs1),
    .io_fresp_bits_fflags_bits_uop_prs2(fpiu_unit_io_fresp_bits_fflags_bits_uop_prs2),
    .io_fresp_bits_fflags_bits_uop_prs3(fpiu_unit_io_fresp_bits_fflags_bits_uop_prs3),
    .io_fresp_bits_fflags_bits_uop_ppred(fpiu_unit_io_fresp_bits_fflags_bits_uop_ppred),
    .io_fresp_bits_fflags_bits_uop_prs1_busy(fpiu_unit_io_fresp_bits_fflags_bits_uop_prs1_busy),
    .io_fresp_bits_fflags_bits_uop_prs2_busy(fpiu_unit_io_fresp_bits_fflags_bits_uop_prs2_busy),
    .io_fresp_bits_fflags_bits_uop_prs3_busy(fpiu_unit_io_fresp_bits_fflags_bits_uop_prs3_busy),
    .io_fresp_bits_fflags_bits_uop_ppred_busy(fpiu_unit_io_fresp_bits_fflags_bits_uop_ppred_busy),
    .io_fresp_bits_fflags_bits_uop_stale_pdst(fpiu_unit_io_fresp_bits_fflags_bits_uop_stale_pdst),
    .io_fresp_bits_fflags_bits_uop_exception(fpiu_unit_io_fresp_bits_fflags_bits_uop_exception),
    .io_fresp_bits_fflags_bits_uop_exc_cause(fpiu_unit_io_fresp_bits_fflags_bits_uop_exc_cause),
    .io_fresp_bits_fflags_bits_uop_bypassable(fpiu_unit_io_fresp_bits_fflags_bits_uop_bypassable),
    .io_fresp_bits_fflags_bits_uop_mem_cmd(fpiu_unit_io_fresp_bits_fflags_bits_uop_mem_cmd),
    .io_fresp_bits_fflags_bits_uop_mem_size(fpiu_unit_io_fresp_bits_fflags_bits_uop_mem_size),
    .io_fresp_bits_fflags_bits_uop_mem_signed(fpiu_unit_io_fresp_bits_fflags_bits_uop_mem_signed),
    .io_fresp_bits_fflags_bits_uop_is_fence(fpiu_unit_io_fresp_bits_fflags_bits_uop_is_fence),
    .io_fresp_bits_fflags_bits_uop_is_fencei(fpiu_unit_io_fresp_bits_fflags_bits_uop_is_fencei),
    .io_fresp_bits_fflags_bits_uop_is_amo(fpiu_unit_io_fresp_bits_fflags_bits_uop_is_amo),
    .io_fresp_bits_fflags_bits_uop_uses_ldq(fpiu_unit_io_fresp_bits_fflags_bits_uop_uses_ldq),
    .io_fresp_bits_fflags_bits_uop_uses_stq(fpiu_unit_io_fresp_bits_fflags_bits_uop_uses_stq),
    .io_fresp_bits_fflags_bits_uop_is_sys_pc2epc(fpiu_unit_io_fresp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_fresp_bits_fflags_bits_uop_is_unique(fpiu_unit_io_fresp_bits_fflags_bits_uop_is_unique),
    .io_fresp_bits_fflags_bits_uop_flush_on_commit(fpiu_unit_io_fresp_bits_fflags_bits_uop_flush_on_commit),
    .io_fresp_bits_fflags_bits_uop_ldst_is_rs1(fpiu_unit_io_fresp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_fresp_bits_fflags_bits_uop_ldst(fpiu_unit_io_fresp_bits_fflags_bits_uop_ldst),
    .io_fresp_bits_fflags_bits_uop_lrs1(fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs1),
    .io_fresp_bits_fflags_bits_uop_lrs2(fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs2),
    .io_fresp_bits_fflags_bits_uop_lrs3(fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs3),
    .io_fresp_bits_fflags_bits_uop_ldst_val(fpiu_unit_io_fresp_bits_fflags_bits_uop_ldst_val),
    .io_fresp_bits_fflags_bits_uop_dst_rtype(fpiu_unit_io_fresp_bits_fflags_bits_uop_dst_rtype),
    .io_fresp_bits_fflags_bits_uop_lrs1_rtype(fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs1_rtype),
    .io_fresp_bits_fflags_bits_uop_lrs2_rtype(fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs2_rtype),
    .io_fresp_bits_fflags_bits_uop_frs3_en(fpiu_unit_io_fresp_bits_fflags_bits_uop_frs3_en),
    .io_fresp_bits_fflags_bits_uop_fp_val(fpiu_unit_io_fresp_bits_fflags_bits_uop_fp_val),
    .io_fresp_bits_fflags_bits_uop_fp_single(fpiu_unit_io_fresp_bits_fflags_bits_uop_fp_single),
    .io_fresp_bits_fflags_bits_uop_xcpt_pf_if(fpiu_unit_io_fresp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_fresp_bits_fflags_bits_uop_xcpt_ae_if(fpiu_unit_io_fresp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_fresp_bits_fflags_bits_uop_xcpt_ma_if(fpiu_unit_io_fresp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_fresp_bits_fflags_bits_uop_bp_debug_if(fpiu_unit_io_fresp_bits_fflags_bits_uop_bp_debug_if),
    .io_fresp_bits_fflags_bits_uop_bp_xcpt_if(fpiu_unit_io_fresp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_fresp_bits_fflags_bits_uop_debug_fsrc(fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_fsrc),
    .io_fresp_bits_fflags_bits_uop_debug_tsrc(fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_tsrc),
    .io_fresp_bits_fflags_bits_flags(fpiu_unit_io_fresp_bits_fflags_bits_flags),
    .io_ll_iresp_ready(fpiu_unit_io_ll_iresp_ready),
    .io_ll_iresp_valid(fpiu_unit_io_ll_iresp_valid),
    .io_ll_iresp_bits_uop_uopc(fpiu_unit_io_ll_iresp_bits_uop_uopc),
    .io_ll_iresp_bits_uop_inst(fpiu_unit_io_ll_iresp_bits_uop_inst),
    .io_ll_iresp_bits_uop_debug_inst(fpiu_unit_io_ll_iresp_bits_uop_debug_inst),
    .io_ll_iresp_bits_uop_is_rvc(fpiu_unit_io_ll_iresp_bits_uop_is_rvc),
    .io_ll_iresp_bits_uop_debug_pc(fpiu_unit_io_ll_iresp_bits_uop_debug_pc),
    .io_ll_iresp_bits_uop_iq_type(fpiu_unit_io_ll_iresp_bits_uop_iq_type),
    .io_ll_iresp_bits_uop_fu_code(fpiu_unit_io_ll_iresp_bits_uop_fu_code),
    .io_ll_iresp_bits_uop_ctrl_br_type(fpiu_unit_io_ll_iresp_bits_uop_ctrl_br_type),
    .io_ll_iresp_bits_uop_ctrl_op1_sel(fpiu_unit_io_ll_iresp_bits_uop_ctrl_op1_sel),
    .io_ll_iresp_bits_uop_ctrl_op2_sel(fpiu_unit_io_ll_iresp_bits_uop_ctrl_op2_sel),
    .io_ll_iresp_bits_uop_ctrl_imm_sel(fpiu_unit_io_ll_iresp_bits_uop_ctrl_imm_sel),
    .io_ll_iresp_bits_uop_ctrl_op_fcn(fpiu_unit_io_ll_iresp_bits_uop_ctrl_op_fcn),
    .io_ll_iresp_bits_uop_ctrl_fcn_dw(fpiu_unit_io_ll_iresp_bits_uop_ctrl_fcn_dw),
    .io_ll_iresp_bits_uop_ctrl_csr_cmd(fpiu_unit_io_ll_iresp_bits_uop_ctrl_csr_cmd),
    .io_ll_iresp_bits_uop_ctrl_is_load(fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_load),
    .io_ll_iresp_bits_uop_ctrl_is_sta(fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_sta),
    .io_ll_iresp_bits_uop_ctrl_is_std(fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_std),
    .io_ll_iresp_bits_uop_iw_state(fpiu_unit_io_ll_iresp_bits_uop_iw_state),
    .io_ll_iresp_bits_uop_iw_p1_poisoned(fpiu_unit_io_ll_iresp_bits_uop_iw_p1_poisoned),
    .io_ll_iresp_bits_uop_iw_p2_poisoned(fpiu_unit_io_ll_iresp_bits_uop_iw_p2_poisoned),
    .io_ll_iresp_bits_uop_is_br(fpiu_unit_io_ll_iresp_bits_uop_is_br),
    .io_ll_iresp_bits_uop_is_jalr(fpiu_unit_io_ll_iresp_bits_uop_is_jalr),
    .io_ll_iresp_bits_uop_is_jal(fpiu_unit_io_ll_iresp_bits_uop_is_jal),
    .io_ll_iresp_bits_uop_is_sfb(fpiu_unit_io_ll_iresp_bits_uop_is_sfb),
    .io_ll_iresp_bits_uop_br_mask(fpiu_unit_io_ll_iresp_bits_uop_br_mask),
    .io_ll_iresp_bits_uop_br_tag(fpiu_unit_io_ll_iresp_bits_uop_br_tag),
    .io_ll_iresp_bits_uop_ftq_idx(fpiu_unit_io_ll_iresp_bits_uop_ftq_idx),
    .io_ll_iresp_bits_uop_edge_inst(fpiu_unit_io_ll_iresp_bits_uop_edge_inst),
    .io_ll_iresp_bits_uop_pc_lob(fpiu_unit_io_ll_iresp_bits_uop_pc_lob),
    .io_ll_iresp_bits_uop_taken(fpiu_unit_io_ll_iresp_bits_uop_taken),
    .io_ll_iresp_bits_uop_imm_packed(fpiu_unit_io_ll_iresp_bits_uop_imm_packed),
    .io_ll_iresp_bits_uop_csr_addr(fpiu_unit_io_ll_iresp_bits_uop_csr_addr),
    .io_ll_iresp_bits_uop_rob_idx(fpiu_unit_io_ll_iresp_bits_uop_rob_idx),
    .io_ll_iresp_bits_uop_ldq_idx(fpiu_unit_io_ll_iresp_bits_uop_ldq_idx),
    .io_ll_iresp_bits_uop_stq_idx(fpiu_unit_io_ll_iresp_bits_uop_stq_idx),
    .io_ll_iresp_bits_uop_rxq_idx(fpiu_unit_io_ll_iresp_bits_uop_rxq_idx),
    .io_ll_iresp_bits_uop_pdst(fpiu_unit_io_ll_iresp_bits_uop_pdst),
    .io_ll_iresp_bits_uop_prs1(fpiu_unit_io_ll_iresp_bits_uop_prs1),
    .io_ll_iresp_bits_uop_prs2(fpiu_unit_io_ll_iresp_bits_uop_prs2),
    .io_ll_iresp_bits_uop_prs3(fpiu_unit_io_ll_iresp_bits_uop_prs3),
    .io_ll_iresp_bits_uop_ppred(fpiu_unit_io_ll_iresp_bits_uop_ppred),
    .io_ll_iresp_bits_uop_prs1_busy(fpiu_unit_io_ll_iresp_bits_uop_prs1_busy),
    .io_ll_iresp_bits_uop_prs2_busy(fpiu_unit_io_ll_iresp_bits_uop_prs2_busy),
    .io_ll_iresp_bits_uop_prs3_busy(fpiu_unit_io_ll_iresp_bits_uop_prs3_busy),
    .io_ll_iresp_bits_uop_ppred_busy(fpiu_unit_io_ll_iresp_bits_uop_ppred_busy),
    .io_ll_iresp_bits_uop_stale_pdst(fpiu_unit_io_ll_iresp_bits_uop_stale_pdst),
    .io_ll_iresp_bits_uop_exception(fpiu_unit_io_ll_iresp_bits_uop_exception),
    .io_ll_iresp_bits_uop_exc_cause(fpiu_unit_io_ll_iresp_bits_uop_exc_cause),
    .io_ll_iresp_bits_uop_bypassable(fpiu_unit_io_ll_iresp_bits_uop_bypassable),
    .io_ll_iresp_bits_uop_mem_cmd(fpiu_unit_io_ll_iresp_bits_uop_mem_cmd),
    .io_ll_iresp_bits_uop_mem_size(fpiu_unit_io_ll_iresp_bits_uop_mem_size),
    .io_ll_iresp_bits_uop_mem_signed(fpiu_unit_io_ll_iresp_bits_uop_mem_signed),
    .io_ll_iresp_bits_uop_is_fence(fpiu_unit_io_ll_iresp_bits_uop_is_fence),
    .io_ll_iresp_bits_uop_is_fencei(fpiu_unit_io_ll_iresp_bits_uop_is_fencei),
    .io_ll_iresp_bits_uop_is_amo(fpiu_unit_io_ll_iresp_bits_uop_is_amo),
    .io_ll_iresp_bits_uop_uses_ldq(fpiu_unit_io_ll_iresp_bits_uop_uses_ldq),
    .io_ll_iresp_bits_uop_uses_stq(fpiu_unit_io_ll_iresp_bits_uop_uses_stq),
    .io_ll_iresp_bits_uop_is_sys_pc2epc(fpiu_unit_io_ll_iresp_bits_uop_is_sys_pc2epc),
    .io_ll_iresp_bits_uop_is_unique(fpiu_unit_io_ll_iresp_bits_uop_is_unique),
    .io_ll_iresp_bits_uop_flush_on_commit(fpiu_unit_io_ll_iresp_bits_uop_flush_on_commit),
    .io_ll_iresp_bits_uop_ldst_is_rs1(fpiu_unit_io_ll_iresp_bits_uop_ldst_is_rs1),
    .io_ll_iresp_bits_uop_ldst(fpiu_unit_io_ll_iresp_bits_uop_ldst),
    .io_ll_iresp_bits_uop_lrs1(fpiu_unit_io_ll_iresp_bits_uop_lrs1),
    .io_ll_iresp_bits_uop_lrs2(fpiu_unit_io_ll_iresp_bits_uop_lrs2),
    .io_ll_iresp_bits_uop_lrs3(fpiu_unit_io_ll_iresp_bits_uop_lrs3),
    .io_ll_iresp_bits_uop_ldst_val(fpiu_unit_io_ll_iresp_bits_uop_ldst_val),
    .io_ll_iresp_bits_uop_dst_rtype(fpiu_unit_io_ll_iresp_bits_uop_dst_rtype),
    .io_ll_iresp_bits_uop_lrs1_rtype(fpiu_unit_io_ll_iresp_bits_uop_lrs1_rtype),
    .io_ll_iresp_bits_uop_lrs2_rtype(fpiu_unit_io_ll_iresp_bits_uop_lrs2_rtype),
    .io_ll_iresp_bits_uop_frs3_en(fpiu_unit_io_ll_iresp_bits_uop_frs3_en),
    .io_ll_iresp_bits_uop_fp_val(fpiu_unit_io_ll_iresp_bits_uop_fp_val),
    .io_ll_iresp_bits_uop_fp_single(fpiu_unit_io_ll_iresp_bits_uop_fp_single),
    .io_ll_iresp_bits_uop_xcpt_pf_if(fpiu_unit_io_ll_iresp_bits_uop_xcpt_pf_if),
    .io_ll_iresp_bits_uop_xcpt_ae_if(fpiu_unit_io_ll_iresp_bits_uop_xcpt_ae_if),
    .io_ll_iresp_bits_uop_xcpt_ma_if(fpiu_unit_io_ll_iresp_bits_uop_xcpt_ma_if),
    .io_ll_iresp_bits_uop_bp_debug_if(fpiu_unit_io_ll_iresp_bits_uop_bp_debug_if),
    .io_ll_iresp_bits_uop_bp_xcpt_if(fpiu_unit_io_ll_iresp_bits_uop_bp_xcpt_if),
    .io_ll_iresp_bits_uop_debug_fsrc(fpiu_unit_io_ll_iresp_bits_uop_debug_fsrc),
    .io_ll_iresp_bits_uop_debug_tsrc(fpiu_unit_io_ll_iresp_bits_uop_debug_tsrc),
    .io_ll_iresp_bits_data(fpiu_unit_io_ll_iresp_bits_data),
    .io_ll_iresp_bits_predicated(fpiu_unit_io_ll_iresp_bits_predicated),
    .io_ll_iresp_bits_fflags_valid(fpiu_unit_io_ll_iresp_bits_fflags_valid),
    .io_ll_iresp_bits_fflags_bits_uop_uopc(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uopc),
    .io_ll_iresp_bits_fflags_bits_uop_inst(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_inst),
    .io_ll_iresp_bits_fflags_bits_uop_debug_inst(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_inst),
    .io_ll_iresp_bits_fflags_bits_uop_is_rvc(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_rvc),
    .io_ll_iresp_bits_fflags_bits_uop_debug_pc(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_pc),
    .io_ll_iresp_bits_fflags_bits_uop_iq_type(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iq_type),
    .io_ll_iresp_bits_fflags_bits_uop_fu_code(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fu_code),
    .io_ll_iresp_bits_fflags_bits_uop_ctrl_br_type(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_br_type),
    .io_ll_iresp_bits_fflags_bits_uop_ctrl_op1_sel(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_ll_iresp_bits_fflags_bits_uop_ctrl_op2_sel(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_ll_iresp_bits_fflags_bits_uop_ctrl_imm_sel(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_ll_iresp_bits_fflags_bits_uop_ctrl_op_fcn(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_ll_iresp_bits_fflags_bits_uop_ctrl_fcn_dw(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_ll_iresp_bits_fflags_bits_uop_ctrl_csr_cmd(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_ll_iresp_bits_fflags_bits_uop_ctrl_is_load(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_load),
    .io_ll_iresp_bits_fflags_bits_uop_ctrl_is_sta(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_ll_iresp_bits_fflags_bits_uop_ctrl_is_std(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_std),
    .io_ll_iresp_bits_fflags_bits_uop_iw_state(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_state),
    .io_ll_iresp_bits_fflags_bits_uop_iw_p1_poisoned(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_ll_iresp_bits_fflags_bits_uop_iw_p2_poisoned(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_ll_iresp_bits_fflags_bits_uop_is_br(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_br),
    .io_ll_iresp_bits_fflags_bits_uop_is_jalr(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_jalr),
    .io_ll_iresp_bits_fflags_bits_uop_is_jal(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_jal),
    .io_ll_iresp_bits_fflags_bits_uop_is_sfb(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_sfb),
    .io_ll_iresp_bits_fflags_bits_uop_br_mask(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_br_mask),
    .io_ll_iresp_bits_fflags_bits_uop_br_tag(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_br_tag),
    .io_ll_iresp_bits_fflags_bits_uop_ftq_idx(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ftq_idx),
    .io_ll_iresp_bits_fflags_bits_uop_edge_inst(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_edge_inst),
    .io_ll_iresp_bits_fflags_bits_uop_pc_lob(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_pc_lob),
    .io_ll_iresp_bits_fflags_bits_uop_taken(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_taken),
    .io_ll_iresp_bits_fflags_bits_uop_imm_packed(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_imm_packed),
    .io_ll_iresp_bits_fflags_bits_uop_csr_addr(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_csr_addr),
    .io_ll_iresp_bits_fflags_bits_uop_rob_idx(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_rob_idx),
    .io_ll_iresp_bits_fflags_bits_uop_ldq_idx(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldq_idx),
    .io_ll_iresp_bits_fflags_bits_uop_stq_idx(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_stq_idx),
    .io_ll_iresp_bits_fflags_bits_uop_rxq_idx(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_rxq_idx),
    .io_ll_iresp_bits_fflags_bits_uop_pdst(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_pdst),
    .io_ll_iresp_bits_fflags_bits_uop_prs1(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs1),
    .io_ll_iresp_bits_fflags_bits_uop_prs2(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs2),
    .io_ll_iresp_bits_fflags_bits_uop_prs3(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs3),
    .io_ll_iresp_bits_fflags_bits_uop_ppred(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ppred),
    .io_ll_iresp_bits_fflags_bits_uop_prs1_busy(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs1_busy),
    .io_ll_iresp_bits_fflags_bits_uop_prs2_busy(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs2_busy),
    .io_ll_iresp_bits_fflags_bits_uop_prs3_busy(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs3_busy),
    .io_ll_iresp_bits_fflags_bits_uop_ppred_busy(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ppred_busy),
    .io_ll_iresp_bits_fflags_bits_uop_stale_pdst(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_stale_pdst),
    .io_ll_iresp_bits_fflags_bits_uop_exception(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_exception),
    .io_ll_iresp_bits_fflags_bits_uop_exc_cause(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_exc_cause),
    .io_ll_iresp_bits_fflags_bits_uop_bypassable(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bypassable),
    .io_ll_iresp_bits_fflags_bits_uop_mem_cmd(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_cmd),
    .io_ll_iresp_bits_fflags_bits_uop_mem_size(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_size),
    .io_ll_iresp_bits_fflags_bits_uop_mem_signed(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_signed),
    .io_ll_iresp_bits_fflags_bits_uop_is_fence(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_fence),
    .io_ll_iresp_bits_fflags_bits_uop_is_fencei(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_fencei),
    .io_ll_iresp_bits_fflags_bits_uop_is_amo(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_amo),
    .io_ll_iresp_bits_fflags_bits_uop_uses_ldq(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uses_ldq),
    .io_ll_iresp_bits_fflags_bits_uop_uses_stq(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uses_stq),
    .io_ll_iresp_bits_fflags_bits_uop_is_sys_pc2epc(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_ll_iresp_bits_fflags_bits_uop_is_unique(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_unique),
    .io_ll_iresp_bits_fflags_bits_uop_flush_on_commit(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_flush_on_commit),
    .io_ll_iresp_bits_fflags_bits_uop_ldst_is_rs1(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_ll_iresp_bits_fflags_bits_uop_ldst(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst),
    .io_ll_iresp_bits_fflags_bits_uop_lrs1(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs1),
    .io_ll_iresp_bits_fflags_bits_uop_lrs2(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs2),
    .io_ll_iresp_bits_fflags_bits_uop_lrs3(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs3),
    .io_ll_iresp_bits_fflags_bits_uop_ldst_val(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst_val),
    .io_ll_iresp_bits_fflags_bits_uop_dst_rtype(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_dst_rtype),
    .io_ll_iresp_bits_fflags_bits_uop_lrs1_rtype(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs1_rtype),
    .io_ll_iresp_bits_fflags_bits_uop_lrs2_rtype(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs2_rtype),
    .io_ll_iresp_bits_fflags_bits_uop_frs3_en(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_frs3_en),
    .io_ll_iresp_bits_fflags_bits_uop_fp_val(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fp_val),
    .io_ll_iresp_bits_fflags_bits_uop_fp_single(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fp_single),
    .io_ll_iresp_bits_fflags_bits_uop_xcpt_pf_if(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_ll_iresp_bits_fflags_bits_uop_xcpt_ae_if(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_ll_iresp_bits_fflags_bits_uop_xcpt_ma_if(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_ll_iresp_bits_fflags_bits_uop_bp_debug_if(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bp_debug_if),
    .io_ll_iresp_bits_fflags_bits_uop_bp_xcpt_if(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_ll_iresp_bits_fflags_bits_uop_debug_fsrc(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_fsrc),
    .io_ll_iresp_bits_fflags_bits_uop_debug_tsrc(fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_tsrc),
    .io_ll_iresp_bits_fflags_bits_flags(fpiu_unit_io_ll_iresp_bits_fflags_bits_flags),
    .io_brupdate_b1_resolve_mask(fpiu_unit_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(fpiu_unit_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(fpiu_unit_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(fpiu_unit_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(fpiu_unit_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(fpiu_unit_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(fpiu_unit_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(fpiu_unit_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(fpiu_unit_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(fpiu_unit_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(fpiu_unit_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(fpiu_unit_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(fpiu_unit_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(fpiu_unit_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(fpiu_unit_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(fpiu_unit_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(fpiu_unit_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(fpiu_unit_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(fpiu_unit_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(fpiu_unit_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(fpiu_unit_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(fpiu_unit_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(fpiu_unit_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(fpiu_unit_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(fpiu_unit_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(fpiu_unit_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(fpiu_unit_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(fpiu_unit_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(fpiu_unit_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(fpiu_unit_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(fpiu_unit_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(fpiu_unit_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(fpiu_unit_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(fpiu_unit_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(fpiu_unit_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(fpiu_unit_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(fpiu_unit_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(fpiu_unit_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(fpiu_unit_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(fpiu_unit_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(fpiu_unit_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(fpiu_unit_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(fpiu_unit_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(fpiu_unit_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(fpiu_unit_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(fpiu_unit_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(fpiu_unit_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(fpiu_unit_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(fpiu_unit_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(fpiu_unit_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(fpiu_unit_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(fpiu_unit_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(fpiu_unit_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(fpiu_unit_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(fpiu_unit_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(fpiu_unit_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(fpiu_unit_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(fpiu_unit_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(fpiu_unit_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(fpiu_unit_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(fpiu_unit_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(fpiu_unit_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(fpiu_unit_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(fpiu_unit_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(fpiu_unit_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(fpiu_unit_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(fpiu_unit_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(fpiu_unit_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(fpiu_unit_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(fpiu_unit_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(fpiu_unit_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(fpiu_unit_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(fpiu_unit_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(fpiu_unit_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(fpiu_unit_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(fpiu_unit_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(fpiu_unit_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(fpiu_unit_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(fpiu_unit_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(fpiu_unit_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(fpiu_unit_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(fpiu_unit_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(fpiu_unit_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(fpiu_unit_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(fpiu_unit_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(fpiu_unit_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(fpiu_unit_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(fpiu_unit_io_brupdate_b2_target_offset),
    .io_status_debug(fpiu_unit_io_status_debug),
    .io_status_cease(fpiu_unit_io_status_cease),
    .io_status_wfi(fpiu_unit_io_status_wfi),
    .io_status_isa(fpiu_unit_io_status_isa),
    .io_status_dprv(fpiu_unit_io_status_dprv),
    .io_status_prv(fpiu_unit_io_status_prv),
    .io_status_sd(fpiu_unit_io_status_sd),
    .io_status_zero2(fpiu_unit_io_status_zero2),
    .io_status_sxl(fpiu_unit_io_status_sxl),
    .io_status_uxl(fpiu_unit_io_status_uxl),
    .io_status_sd_rv32(fpiu_unit_io_status_sd_rv32),
    .io_status_zero1(fpiu_unit_io_status_zero1),
    .io_status_tsr(fpiu_unit_io_status_tsr),
    .io_status_tw(fpiu_unit_io_status_tw),
    .io_status_tvm(fpiu_unit_io_status_tvm),
    .io_status_mxr(fpiu_unit_io_status_mxr),
    .io_status_sum(fpiu_unit_io_status_sum),
    .io_status_mprv(fpiu_unit_io_status_mprv),
    .io_status_xs(fpiu_unit_io_status_xs),
    .io_status_fs(fpiu_unit_io_status_fs),
    .io_status_mpp(fpiu_unit_io_status_mpp),
    .io_status_vs(fpiu_unit_io_status_vs),
    .io_status_spp(fpiu_unit_io_status_spp),
    .io_status_mpie(fpiu_unit_io_status_mpie),
    .io_status_hpie(fpiu_unit_io_status_hpie),
    .io_status_spie(fpiu_unit_io_status_spie),
    .io_status_upie(fpiu_unit_io_status_upie),
    .io_status_mie(fpiu_unit_io_status_mie),
    .io_status_hie(fpiu_unit_io_status_hie),
    .io_status_sie(fpiu_unit_io_status_sie),
    .io_status_uie(fpiu_unit_io_status_uie),
    .io_fcsr_rm(fpiu_unit_io_fcsr_rm)
  );
  IssueUnitCollapsing fp_issue_unit ( // @[fp-pipeline.scala 62:30]
    .clock(fp_issue_unit_clock),
    .reset(fp_issue_unit_reset),
    .io_dis_uops_0_ready(fp_issue_unit_io_dis_uops_0_ready),
    .io_dis_uops_0_valid(fp_issue_unit_io_dis_uops_0_valid),
    .io_dis_uops_0_bits_uopc(fp_issue_unit_io_dis_uops_0_bits_uopc),
    .io_dis_uops_0_bits_inst(fp_issue_unit_io_dis_uops_0_bits_inst),
    .io_dis_uops_0_bits_debug_inst(fp_issue_unit_io_dis_uops_0_bits_debug_inst),
    .io_dis_uops_0_bits_is_rvc(fp_issue_unit_io_dis_uops_0_bits_is_rvc),
    .io_dis_uops_0_bits_debug_pc(fp_issue_unit_io_dis_uops_0_bits_debug_pc),
    .io_dis_uops_0_bits_iq_type(fp_issue_unit_io_dis_uops_0_bits_iq_type),
    .io_dis_uops_0_bits_fu_code(fp_issue_unit_io_dis_uops_0_bits_fu_code),
    .io_dis_uops_0_bits_ctrl_br_type(fp_issue_unit_io_dis_uops_0_bits_ctrl_br_type),
    .io_dis_uops_0_bits_ctrl_op1_sel(fp_issue_unit_io_dis_uops_0_bits_ctrl_op1_sel),
    .io_dis_uops_0_bits_ctrl_op2_sel(fp_issue_unit_io_dis_uops_0_bits_ctrl_op2_sel),
    .io_dis_uops_0_bits_ctrl_imm_sel(fp_issue_unit_io_dis_uops_0_bits_ctrl_imm_sel),
    .io_dis_uops_0_bits_ctrl_op_fcn(fp_issue_unit_io_dis_uops_0_bits_ctrl_op_fcn),
    .io_dis_uops_0_bits_ctrl_fcn_dw(fp_issue_unit_io_dis_uops_0_bits_ctrl_fcn_dw),
    .io_dis_uops_0_bits_ctrl_csr_cmd(fp_issue_unit_io_dis_uops_0_bits_ctrl_csr_cmd),
    .io_dis_uops_0_bits_ctrl_is_load(fp_issue_unit_io_dis_uops_0_bits_ctrl_is_load),
    .io_dis_uops_0_bits_ctrl_is_sta(fp_issue_unit_io_dis_uops_0_bits_ctrl_is_sta),
    .io_dis_uops_0_bits_ctrl_is_std(fp_issue_unit_io_dis_uops_0_bits_ctrl_is_std),
    .io_dis_uops_0_bits_iw_state(fp_issue_unit_io_dis_uops_0_bits_iw_state),
    .io_dis_uops_0_bits_iw_p1_poisoned(fp_issue_unit_io_dis_uops_0_bits_iw_p1_poisoned),
    .io_dis_uops_0_bits_iw_p2_poisoned(fp_issue_unit_io_dis_uops_0_bits_iw_p2_poisoned),
    .io_dis_uops_0_bits_is_br(fp_issue_unit_io_dis_uops_0_bits_is_br),
    .io_dis_uops_0_bits_is_jalr(fp_issue_unit_io_dis_uops_0_bits_is_jalr),
    .io_dis_uops_0_bits_is_jal(fp_issue_unit_io_dis_uops_0_bits_is_jal),
    .io_dis_uops_0_bits_is_sfb(fp_issue_unit_io_dis_uops_0_bits_is_sfb),
    .io_dis_uops_0_bits_br_mask(fp_issue_unit_io_dis_uops_0_bits_br_mask),
    .io_dis_uops_0_bits_br_tag(fp_issue_unit_io_dis_uops_0_bits_br_tag),
    .io_dis_uops_0_bits_ftq_idx(fp_issue_unit_io_dis_uops_0_bits_ftq_idx),
    .io_dis_uops_0_bits_edge_inst(fp_issue_unit_io_dis_uops_0_bits_edge_inst),
    .io_dis_uops_0_bits_pc_lob(fp_issue_unit_io_dis_uops_0_bits_pc_lob),
    .io_dis_uops_0_bits_taken(fp_issue_unit_io_dis_uops_0_bits_taken),
    .io_dis_uops_0_bits_imm_packed(fp_issue_unit_io_dis_uops_0_bits_imm_packed),
    .io_dis_uops_0_bits_csr_addr(fp_issue_unit_io_dis_uops_0_bits_csr_addr),
    .io_dis_uops_0_bits_rob_idx(fp_issue_unit_io_dis_uops_0_bits_rob_idx),
    .io_dis_uops_0_bits_ldq_idx(fp_issue_unit_io_dis_uops_0_bits_ldq_idx),
    .io_dis_uops_0_bits_stq_idx(fp_issue_unit_io_dis_uops_0_bits_stq_idx),
    .io_dis_uops_0_bits_rxq_idx(fp_issue_unit_io_dis_uops_0_bits_rxq_idx),
    .io_dis_uops_0_bits_pdst(fp_issue_unit_io_dis_uops_0_bits_pdst),
    .io_dis_uops_0_bits_prs1(fp_issue_unit_io_dis_uops_0_bits_prs1),
    .io_dis_uops_0_bits_prs2(fp_issue_unit_io_dis_uops_0_bits_prs2),
    .io_dis_uops_0_bits_prs3(fp_issue_unit_io_dis_uops_0_bits_prs3),
    .io_dis_uops_0_bits_ppred(fp_issue_unit_io_dis_uops_0_bits_ppred),
    .io_dis_uops_0_bits_prs1_busy(fp_issue_unit_io_dis_uops_0_bits_prs1_busy),
    .io_dis_uops_0_bits_prs2_busy(fp_issue_unit_io_dis_uops_0_bits_prs2_busy),
    .io_dis_uops_0_bits_prs3_busy(fp_issue_unit_io_dis_uops_0_bits_prs3_busy),
    .io_dis_uops_0_bits_ppred_busy(fp_issue_unit_io_dis_uops_0_bits_ppred_busy),
    .io_dis_uops_0_bits_stale_pdst(fp_issue_unit_io_dis_uops_0_bits_stale_pdst),
    .io_dis_uops_0_bits_exception(fp_issue_unit_io_dis_uops_0_bits_exception),
    .io_dis_uops_0_bits_exc_cause(fp_issue_unit_io_dis_uops_0_bits_exc_cause),
    .io_dis_uops_0_bits_bypassable(fp_issue_unit_io_dis_uops_0_bits_bypassable),
    .io_dis_uops_0_bits_mem_cmd(fp_issue_unit_io_dis_uops_0_bits_mem_cmd),
    .io_dis_uops_0_bits_mem_size(fp_issue_unit_io_dis_uops_0_bits_mem_size),
    .io_dis_uops_0_bits_mem_signed(fp_issue_unit_io_dis_uops_0_bits_mem_signed),
    .io_dis_uops_0_bits_is_fence(fp_issue_unit_io_dis_uops_0_bits_is_fence),
    .io_dis_uops_0_bits_is_fencei(fp_issue_unit_io_dis_uops_0_bits_is_fencei),
    .io_dis_uops_0_bits_is_amo(fp_issue_unit_io_dis_uops_0_bits_is_amo),
    .io_dis_uops_0_bits_uses_ldq(fp_issue_unit_io_dis_uops_0_bits_uses_ldq),
    .io_dis_uops_0_bits_uses_stq(fp_issue_unit_io_dis_uops_0_bits_uses_stq),
    .io_dis_uops_0_bits_is_sys_pc2epc(fp_issue_unit_io_dis_uops_0_bits_is_sys_pc2epc),
    .io_dis_uops_0_bits_is_unique(fp_issue_unit_io_dis_uops_0_bits_is_unique),
    .io_dis_uops_0_bits_flush_on_commit(fp_issue_unit_io_dis_uops_0_bits_flush_on_commit),
    .io_dis_uops_0_bits_ldst_is_rs1(fp_issue_unit_io_dis_uops_0_bits_ldst_is_rs1),
    .io_dis_uops_0_bits_ldst(fp_issue_unit_io_dis_uops_0_bits_ldst),
    .io_dis_uops_0_bits_lrs1(fp_issue_unit_io_dis_uops_0_bits_lrs1),
    .io_dis_uops_0_bits_lrs2(fp_issue_unit_io_dis_uops_0_bits_lrs2),
    .io_dis_uops_0_bits_lrs3(fp_issue_unit_io_dis_uops_0_bits_lrs3),
    .io_dis_uops_0_bits_ldst_val(fp_issue_unit_io_dis_uops_0_bits_ldst_val),
    .io_dis_uops_0_bits_dst_rtype(fp_issue_unit_io_dis_uops_0_bits_dst_rtype),
    .io_dis_uops_0_bits_lrs1_rtype(fp_issue_unit_io_dis_uops_0_bits_lrs1_rtype),
    .io_dis_uops_0_bits_lrs2_rtype(fp_issue_unit_io_dis_uops_0_bits_lrs2_rtype),
    .io_dis_uops_0_bits_frs3_en(fp_issue_unit_io_dis_uops_0_bits_frs3_en),
    .io_dis_uops_0_bits_fp_val(fp_issue_unit_io_dis_uops_0_bits_fp_val),
    .io_dis_uops_0_bits_fp_single(fp_issue_unit_io_dis_uops_0_bits_fp_single),
    .io_dis_uops_0_bits_xcpt_pf_if(fp_issue_unit_io_dis_uops_0_bits_xcpt_pf_if),
    .io_dis_uops_0_bits_xcpt_ae_if(fp_issue_unit_io_dis_uops_0_bits_xcpt_ae_if),
    .io_dis_uops_0_bits_xcpt_ma_if(fp_issue_unit_io_dis_uops_0_bits_xcpt_ma_if),
    .io_dis_uops_0_bits_bp_debug_if(fp_issue_unit_io_dis_uops_0_bits_bp_debug_if),
    .io_dis_uops_0_bits_bp_xcpt_if(fp_issue_unit_io_dis_uops_0_bits_bp_xcpt_if),
    .io_dis_uops_0_bits_debug_fsrc(fp_issue_unit_io_dis_uops_0_bits_debug_fsrc),
    .io_dis_uops_0_bits_debug_tsrc(fp_issue_unit_io_dis_uops_0_bits_debug_tsrc),
    .io_dis_uops_1_ready(fp_issue_unit_io_dis_uops_1_ready),
    .io_dis_uops_1_valid(fp_issue_unit_io_dis_uops_1_valid),
    .io_dis_uops_1_bits_uopc(fp_issue_unit_io_dis_uops_1_bits_uopc),
    .io_dis_uops_1_bits_inst(fp_issue_unit_io_dis_uops_1_bits_inst),
    .io_dis_uops_1_bits_debug_inst(fp_issue_unit_io_dis_uops_1_bits_debug_inst),
    .io_dis_uops_1_bits_is_rvc(fp_issue_unit_io_dis_uops_1_bits_is_rvc),
    .io_dis_uops_1_bits_debug_pc(fp_issue_unit_io_dis_uops_1_bits_debug_pc),
    .io_dis_uops_1_bits_iq_type(fp_issue_unit_io_dis_uops_1_bits_iq_type),
    .io_dis_uops_1_bits_fu_code(fp_issue_unit_io_dis_uops_1_bits_fu_code),
    .io_dis_uops_1_bits_ctrl_br_type(fp_issue_unit_io_dis_uops_1_bits_ctrl_br_type),
    .io_dis_uops_1_bits_ctrl_op1_sel(fp_issue_unit_io_dis_uops_1_bits_ctrl_op1_sel),
    .io_dis_uops_1_bits_ctrl_op2_sel(fp_issue_unit_io_dis_uops_1_bits_ctrl_op2_sel),
    .io_dis_uops_1_bits_ctrl_imm_sel(fp_issue_unit_io_dis_uops_1_bits_ctrl_imm_sel),
    .io_dis_uops_1_bits_ctrl_op_fcn(fp_issue_unit_io_dis_uops_1_bits_ctrl_op_fcn),
    .io_dis_uops_1_bits_ctrl_fcn_dw(fp_issue_unit_io_dis_uops_1_bits_ctrl_fcn_dw),
    .io_dis_uops_1_bits_ctrl_csr_cmd(fp_issue_unit_io_dis_uops_1_bits_ctrl_csr_cmd),
    .io_dis_uops_1_bits_ctrl_is_load(fp_issue_unit_io_dis_uops_1_bits_ctrl_is_load),
    .io_dis_uops_1_bits_ctrl_is_sta(fp_issue_unit_io_dis_uops_1_bits_ctrl_is_sta),
    .io_dis_uops_1_bits_ctrl_is_std(fp_issue_unit_io_dis_uops_1_bits_ctrl_is_std),
    .io_dis_uops_1_bits_iw_state(fp_issue_unit_io_dis_uops_1_bits_iw_state),
    .io_dis_uops_1_bits_iw_p1_poisoned(fp_issue_unit_io_dis_uops_1_bits_iw_p1_poisoned),
    .io_dis_uops_1_bits_iw_p2_poisoned(fp_issue_unit_io_dis_uops_1_bits_iw_p2_poisoned),
    .io_dis_uops_1_bits_is_br(fp_issue_unit_io_dis_uops_1_bits_is_br),
    .io_dis_uops_1_bits_is_jalr(fp_issue_unit_io_dis_uops_1_bits_is_jalr),
    .io_dis_uops_1_bits_is_jal(fp_issue_unit_io_dis_uops_1_bits_is_jal),
    .io_dis_uops_1_bits_is_sfb(fp_issue_unit_io_dis_uops_1_bits_is_sfb),
    .io_dis_uops_1_bits_br_mask(fp_issue_unit_io_dis_uops_1_bits_br_mask),
    .io_dis_uops_1_bits_br_tag(fp_issue_unit_io_dis_uops_1_bits_br_tag),
    .io_dis_uops_1_bits_ftq_idx(fp_issue_unit_io_dis_uops_1_bits_ftq_idx),
    .io_dis_uops_1_bits_edge_inst(fp_issue_unit_io_dis_uops_1_bits_edge_inst),
    .io_dis_uops_1_bits_pc_lob(fp_issue_unit_io_dis_uops_1_bits_pc_lob),
    .io_dis_uops_1_bits_taken(fp_issue_unit_io_dis_uops_1_bits_taken),
    .io_dis_uops_1_bits_imm_packed(fp_issue_unit_io_dis_uops_1_bits_imm_packed),
    .io_dis_uops_1_bits_csr_addr(fp_issue_unit_io_dis_uops_1_bits_csr_addr),
    .io_dis_uops_1_bits_rob_idx(fp_issue_unit_io_dis_uops_1_bits_rob_idx),
    .io_dis_uops_1_bits_ldq_idx(fp_issue_unit_io_dis_uops_1_bits_ldq_idx),
    .io_dis_uops_1_bits_stq_idx(fp_issue_unit_io_dis_uops_1_bits_stq_idx),
    .io_dis_uops_1_bits_rxq_idx(fp_issue_unit_io_dis_uops_1_bits_rxq_idx),
    .io_dis_uops_1_bits_pdst(fp_issue_unit_io_dis_uops_1_bits_pdst),
    .io_dis_uops_1_bits_prs1(fp_issue_unit_io_dis_uops_1_bits_prs1),
    .io_dis_uops_1_bits_prs2(fp_issue_unit_io_dis_uops_1_bits_prs2),
    .io_dis_uops_1_bits_prs3(fp_issue_unit_io_dis_uops_1_bits_prs3),
    .io_dis_uops_1_bits_ppred(fp_issue_unit_io_dis_uops_1_bits_ppred),
    .io_dis_uops_1_bits_prs1_busy(fp_issue_unit_io_dis_uops_1_bits_prs1_busy),
    .io_dis_uops_1_bits_prs2_busy(fp_issue_unit_io_dis_uops_1_bits_prs2_busy),
    .io_dis_uops_1_bits_prs3_busy(fp_issue_unit_io_dis_uops_1_bits_prs3_busy),
    .io_dis_uops_1_bits_ppred_busy(fp_issue_unit_io_dis_uops_1_bits_ppred_busy),
    .io_dis_uops_1_bits_stale_pdst(fp_issue_unit_io_dis_uops_1_bits_stale_pdst),
    .io_dis_uops_1_bits_exception(fp_issue_unit_io_dis_uops_1_bits_exception),
    .io_dis_uops_1_bits_exc_cause(fp_issue_unit_io_dis_uops_1_bits_exc_cause),
    .io_dis_uops_1_bits_bypassable(fp_issue_unit_io_dis_uops_1_bits_bypassable),
    .io_dis_uops_1_bits_mem_cmd(fp_issue_unit_io_dis_uops_1_bits_mem_cmd),
    .io_dis_uops_1_bits_mem_size(fp_issue_unit_io_dis_uops_1_bits_mem_size),
    .io_dis_uops_1_bits_mem_signed(fp_issue_unit_io_dis_uops_1_bits_mem_signed),
    .io_dis_uops_1_bits_is_fence(fp_issue_unit_io_dis_uops_1_bits_is_fence),
    .io_dis_uops_1_bits_is_fencei(fp_issue_unit_io_dis_uops_1_bits_is_fencei),
    .io_dis_uops_1_bits_is_amo(fp_issue_unit_io_dis_uops_1_bits_is_amo),
    .io_dis_uops_1_bits_uses_ldq(fp_issue_unit_io_dis_uops_1_bits_uses_ldq),
    .io_dis_uops_1_bits_uses_stq(fp_issue_unit_io_dis_uops_1_bits_uses_stq),
    .io_dis_uops_1_bits_is_sys_pc2epc(fp_issue_unit_io_dis_uops_1_bits_is_sys_pc2epc),
    .io_dis_uops_1_bits_is_unique(fp_issue_unit_io_dis_uops_1_bits_is_unique),
    .io_dis_uops_1_bits_flush_on_commit(fp_issue_unit_io_dis_uops_1_bits_flush_on_commit),
    .io_dis_uops_1_bits_ldst_is_rs1(fp_issue_unit_io_dis_uops_1_bits_ldst_is_rs1),
    .io_dis_uops_1_bits_ldst(fp_issue_unit_io_dis_uops_1_bits_ldst),
    .io_dis_uops_1_bits_lrs1(fp_issue_unit_io_dis_uops_1_bits_lrs1),
    .io_dis_uops_1_bits_lrs2(fp_issue_unit_io_dis_uops_1_bits_lrs2),
    .io_dis_uops_1_bits_lrs3(fp_issue_unit_io_dis_uops_1_bits_lrs3),
    .io_dis_uops_1_bits_ldst_val(fp_issue_unit_io_dis_uops_1_bits_ldst_val),
    .io_dis_uops_1_bits_dst_rtype(fp_issue_unit_io_dis_uops_1_bits_dst_rtype),
    .io_dis_uops_1_bits_lrs1_rtype(fp_issue_unit_io_dis_uops_1_bits_lrs1_rtype),
    .io_dis_uops_1_bits_lrs2_rtype(fp_issue_unit_io_dis_uops_1_bits_lrs2_rtype),
    .io_dis_uops_1_bits_frs3_en(fp_issue_unit_io_dis_uops_1_bits_frs3_en),
    .io_dis_uops_1_bits_fp_val(fp_issue_unit_io_dis_uops_1_bits_fp_val),
    .io_dis_uops_1_bits_fp_single(fp_issue_unit_io_dis_uops_1_bits_fp_single),
    .io_dis_uops_1_bits_xcpt_pf_if(fp_issue_unit_io_dis_uops_1_bits_xcpt_pf_if),
    .io_dis_uops_1_bits_xcpt_ae_if(fp_issue_unit_io_dis_uops_1_bits_xcpt_ae_if),
    .io_dis_uops_1_bits_xcpt_ma_if(fp_issue_unit_io_dis_uops_1_bits_xcpt_ma_if),
    .io_dis_uops_1_bits_bp_debug_if(fp_issue_unit_io_dis_uops_1_bits_bp_debug_if),
    .io_dis_uops_1_bits_bp_xcpt_if(fp_issue_unit_io_dis_uops_1_bits_bp_xcpt_if),
    .io_dis_uops_1_bits_debug_fsrc(fp_issue_unit_io_dis_uops_1_bits_debug_fsrc),
    .io_dis_uops_1_bits_debug_tsrc(fp_issue_unit_io_dis_uops_1_bits_debug_tsrc),
    .io_iss_valids_0(fp_issue_unit_io_iss_valids_0),
    .io_iss_uops_0_uopc(fp_issue_unit_io_iss_uops_0_uopc),
    .io_iss_uops_0_inst(fp_issue_unit_io_iss_uops_0_inst),
    .io_iss_uops_0_debug_inst(fp_issue_unit_io_iss_uops_0_debug_inst),
    .io_iss_uops_0_is_rvc(fp_issue_unit_io_iss_uops_0_is_rvc),
    .io_iss_uops_0_debug_pc(fp_issue_unit_io_iss_uops_0_debug_pc),
    .io_iss_uops_0_iq_type(fp_issue_unit_io_iss_uops_0_iq_type),
    .io_iss_uops_0_fu_code(fp_issue_unit_io_iss_uops_0_fu_code),
    .io_iss_uops_0_ctrl_br_type(fp_issue_unit_io_iss_uops_0_ctrl_br_type),
    .io_iss_uops_0_ctrl_op1_sel(fp_issue_unit_io_iss_uops_0_ctrl_op1_sel),
    .io_iss_uops_0_ctrl_op2_sel(fp_issue_unit_io_iss_uops_0_ctrl_op2_sel),
    .io_iss_uops_0_ctrl_imm_sel(fp_issue_unit_io_iss_uops_0_ctrl_imm_sel),
    .io_iss_uops_0_ctrl_op_fcn(fp_issue_unit_io_iss_uops_0_ctrl_op_fcn),
    .io_iss_uops_0_ctrl_fcn_dw(fp_issue_unit_io_iss_uops_0_ctrl_fcn_dw),
    .io_iss_uops_0_ctrl_csr_cmd(fp_issue_unit_io_iss_uops_0_ctrl_csr_cmd),
    .io_iss_uops_0_ctrl_is_load(fp_issue_unit_io_iss_uops_0_ctrl_is_load),
    .io_iss_uops_0_ctrl_is_sta(fp_issue_unit_io_iss_uops_0_ctrl_is_sta),
    .io_iss_uops_0_ctrl_is_std(fp_issue_unit_io_iss_uops_0_ctrl_is_std),
    .io_iss_uops_0_iw_state(fp_issue_unit_io_iss_uops_0_iw_state),
    .io_iss_uops_0_iw_p1_poisoned(fp_issue_unit_io_iss_uops_0_iw_p1_poisoned),
    .io_iss_uops_0_iw_p2_poisoned(fp_issue_unit_io_iss_uops_0_iw_p2_poisoned),
    .io_iss_uops_0_is_br(fp_issue_unit_io_iss_uops_0_is_br),
    .io_iss_uops_0_is_jalr(fp_issue_unit_io_iss_uops_0_is_jalr),
    .io_iss_uops_0_is_jal(fp_issue_unit_io_iss_uops_0_is_jal),
    .io_iss_uops_0_is_sfb(fp_issue_unit_io_iss_uops_0_is_sfb),
    .io_iss_uops_0_br_mask(fp_issue_unit_io_iss_uops_0_br_mask),
    .io_iss_uops_0_br_tag(fp_issue_unit_io_iss_uops_0_br_tag),
    .io_iss_uops_0_ftq_idx(fp_issue_unit_io_iss_uops_0_ftq_idx),
    .io_iss_uops_0_edge_inst(fp_issue_unit_io_iss_uops_0_edge_inst),
    .io_iss_uops_0_pc_lob(fp_issue_unit_io_iss_uops_0_pc_lob),
    .io_iss_uops_0_taken(fp_issue_unit_io_iss_uops_0_taken),
    .io_iss_uops_0_imm_packed(fp_issue_unit_io_iss_uops_0_imm_packed),
    .io_iss_uops_0_csr_addr(fp_issue_unit_io_iss_uops_0_csr_addr),
    .io_iss_uops_0_rob_idx(fp_issue_unit_io_iss_uops_0_rob_idx),
    .io_iss_uops_0_ldq_idx(fp_issue_unit_io_iss_uops_0_ldq_idx),
    .io_iss_uops_0_stq_idx(fp_issue_unit_io_iss_uops_0_stq_idx),
    .io_iss_uops_0_rxq_idx(fp_issue_unit_io_iss_uops_0_rxq_idx),
    .io_iss_uops_0_pdst(fp_issue_unit_io_iss_uops_0_pdst),
    .io_iss_uops_0_prs1(fp_issue_unit_io_iss_uops_0_prs1),
    .io_iss_uops_0_prs2(fp_issue_unit_io_iss_uops_0_prs2),
    .io_iss_uops_0_prs3(fp_issue_unit_io_iss_uops_0_prs3),
    .io_iss_uops_0_ppred(fp_issue_unit_io_iss_uops_0_ppred),
    .io_iss_uops_0_prs1_busy(fp_issue_unit_io_iss_uops_0_prs1_busy),
    .io_iss_uops_0_prs2_busy(fp_issue_unit_io_iss_uops_0_prs2_busy),
    .io_iss_uops_0_prs3_busy(fp_issue_unit_io_iss_uops_0_prs3_busy),
    .io_iss_uops_0_ppred_busy(fp_issue_unit_io_iss_uops_0_ppred_busy),
    .io_iss_uops_0_stale_pdst(fp_issue_unit_io_iss_uops_0_stale_pdst),
    .io_iss_uops_0_exception(fp_issue_unit_io_iss_uops_0_exception),
    .io_iss_uops_0_exc_cause(fp_issue_unit_io_iss_uops_0_exc_cause),
    .io_iss_uops_0_bypassable(fp_issue_unit_io_iss_uops_0_bypassable),
    .io_iss_uops_0_mem_cmd(fp_issue_unit_io_iss_uops_0_mem_cmd),
    .io_iss_uops_0_mem_size(fp_issue_unit_io_iss_uops_0_mem_size),
    .io_iss_uops_0_mem_signed(fp_issue_unit_io_iss_uops_0_mem_signed),
    .io_iss_uops_0_is_fence(fp_issue_unit_io_iss_uops_0_is_fence),
    .io_iss_uops_0_is_fencei(fp_issue_unit_io_iss_uops_0_is_fencei),
    .io_iss_uops_0_is_amo(fp_issue_unit_io_iss_uops_0_is_amo),
    .io_iss_uops_0_uses_ldq(fp_issue_unit_io_iss_uops_0_uses_ldq),
    .io_iss_uops_0_uses_stq(fp_issue_unit_io_iss_uops_0_uses_stq),
    .io_iss_uops_0_is_sys_pc2epc(fp_issue_unit_io_iss_uops_0_is_sys_pc2epc),
    .io_iss_uops_0_is_unique(fp_issue_unit_io_iss_uops_0_is_unique),
    .io_iss_uops_0_flush_on_commit(fp_issue_unit_io_iss_uops_0_flush_on_commit),
    .io_iss_uops_0_ldst_is_rs1(fp_issue_unit_io_iss_uops_0_ldst_is_rs1),
    .io_iss_uops_0_ldst(fp_issue_unit_io_iss_uops_0_ldst),
    .io_iss_uops_0_lrs1(fp_issue_unit_io_iss_uops_0_lrs1),
    .io_iss_uops_0_lrs2(fp_issue_unit_io_iss_uops_0_lrs2),
    .io_iss_uops_0_lrs3(fp_issue_unit_io_iss_uops_0_lrs3),
    .io_iss_uops_0_ldst_val(fp_issue_unit_io_iss_uops_0_ldst_val),
    .io_iss_uops_0_dst_rtype(fp_issue_unit_io_iss_uops_0_dst_rtype),
    .io_iss_uops_0_lrs1_rtype(fp_issue_unit_io_iss_uops_0_lrs1_rtype),
    .io_iss_uops_0_lrs2_rtype(fp_issue_unit_io_iss_uops_0_lrs2_rtype),
    .io_iss_uops_0_frs3_en(fp_issue_unit_io_iss_uops_0_frs3_en),
    .io_iss_uops_0_fp_val(fp_issue_unit_io_iss_uops_0_fp_val),
    .io_iss_uops_0_fp_single(fp_issue_unit_io_iss_uops_0_fp_single),
    .io_iss_uops_0_xcpt_pf_if(fp_issue_unit_io_iss_uops_0_xcpt_pf_if),
    .io_iss_uops_0_xcpt_ae_if(fp_issue_unit_io_iss_uops_0_xcpt_ae_if),
    .io_iss_uops_0_xcpt_ma_if(fp_issue_unit_io_iss_uops_0_xcpt_ma_if),
    .io_iss_uops_0_bp_debug_if(fp_issue_unit_io_iss_uops_0_bp_debug_if),
    .io_iss_uops_0_bp_xcpt_if(fp_issue_unit_io_iss_uops_0_bp_xcpt_if),
    .io_iss_uops_0_debug_fsrc(fp_issue_unit_io_iss_uops_0_debug_fsrc),
    .io_iss_uops_0_debug_tsrc(fp_issue_unit_io_iss_uops_0_debug_tsrc),
    .io_wakeup_ports_0_valid(fp_issue_unit_io_wakeup_ports_0_valid),
    .io_wakeup_ports_0_bits_pdst(fp_issue_unit_io_wakeup_ports_0_bits_pdst),
    .io_wakeup_ports_0_bits_poisoned(fp_issue_unit_io_wakeup_ports_0_bits_poisoned),
    .io_wakeup_ports_1_valid(fp_issue_unit_io_wakeup_ports_1_valid),
    .io_wakeup_ports_1_bits_pdst(fp_issue_unit_io_wakeup_ports_1_bits_pdst),
    .io_wakeup_ports_1_bits_poisoned(fp_issue_unit_io_wakeup_ports_1_bits_poisoned),
    .io_pred_wakeup_port_valid(fp_issue_unit_io_pred_wakeup_port_valid),
    .io_pred_wakeup_port_bits(fp_issue_unit_io_pred_wakeup_port_bits),
    .io_spec_ld_wakeup_0_valid(fp_issue_unit_io_spec_ld_wakeup_0_valid),
    .io_spec_ld_wakeup_0_bits(fp_issue_unit_io_spec_ld_wakeup_0_bits),
    .io_fu_types_0(fp_issue_unit_io_fu_types_0),
    .io_brupdate_b1_resolve_mask(fp_issue_unit_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(fp_issue_unit_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(fp_issue_unit_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(fp_issue_unit_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(fp_issue_unit_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(fp_issue_unit_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(fp_issue_unit_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(fp_issue_unit_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(fp_issue_unit_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(fp_issue_unit_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(fp_issue_unit_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(fp_issue_unit_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(fp_issue_unit_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(fp_issue_unit_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(fp_issue_unit_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(fp_issue_unit_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(fp_issue_unit_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(fp_issue_unit_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(fp_issue_unit_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(fp_issue_unit_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(fp_issue_unit_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(fp_issue_unit_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(fp_issue_unit_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(fp_issue_unit_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(fp_issue_unit_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(fp_issue_unit_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(fp_issue_unit_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(fp_issue_unit_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(fp_issue_unit_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(fp_issue_unit_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(fp_issue_unit_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(fp_issue_unit_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(fp_issue_unit_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(fp_issue_unit_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(fp_issue_unit_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(fp_issue_unit_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(fp_issue_unit_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(fp_issue_unit_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(fp_issue_unit_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(fp_issue_unit_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(fp_issue_unit_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(fp_issue_unit_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(fp_issue_unit_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(fp_issue_unit_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(fp_issue_unit_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(fp_issue_unit_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(fp_issue_unit_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(fp_issue_unit_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(fp_issue_unit_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(fp_issue_unit_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(fp_issue_unit_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(fp_issue_unit_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(fp_issue_unit_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(fp_issue_unit_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(fp_issue_unit_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(fp_issue_unit_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(fp_issue_unit_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(fp_issue_unit_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(fp_issue_unit_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(fp_issue_unit_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(fp_issue_unit_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(fp_issue_unit_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(fp_issue_unit_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(fp_issue_unit_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(fp_issue_unit_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(fp_issue_unit_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(fp_issue_unit_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(fp_issue_unit_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(fp_issue_unit_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(fp_issue_unit_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(fp_issue_unit_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(fp_issue_unit_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(fp_issue_unit_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(fp_issue_unit_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(fp_issue_unit_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(fp_issue_unit_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(fp_issue_unit_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(fp_issue_unit_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(fp_issue_unit_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(fp_issue_unit_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(fp_issue_unit_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(fp_issue_unit_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(fp_issue_unit_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(fp_issue_unit_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(fp_issue_unit_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(fp_issue_unit_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(fp_issue_unit_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(fp_issue_unit_io_brupdate_b2_target_offset),
    .io_flush_pipeline(fp_issue_unit_io_flush_pipeline),
    .io_ld_miss(fp_issue_unit_io_ld_miss),
    .io_event_empty(fp_issue_unit_io_event_empty),
    .io_tsc_reg(fp_issue_unit_io_tsc_reg)
  );
  RegisterFileSynthesizable fregfile ( // @[fp-pipeline.scala 66:30]
    .clock(fregfile_clock),
    .reset(fregfile_reset),
    .io_read_ports_0_addr(fregfile_io_read_ports_0_addr),
    .io_read_ports_0_data(fregfile_io_read_ports_0_data),
    .io_read_ports_1_addr(fregfile_io_read_ports_1_addr),
    .io_read_ports_1_data(fregfile_io_read_ports_1_data),
    .io_read_ports_2_addr(fregfile_io_read_ports_2_addr),
    .io_read_ports_2_data(fregfile_io_read_ports_2_data),
    .io_write_ports_0_valid(fregfile_io_write_ports_0_valid),
    .io_write_ports_0_bits_addr(fregfile_io_write_ports_0_bits_addr),
    .io_write_ports_0_bits_data(fregfile_io_write_ports_0_bits_data),
    .io_write_ports_1_valid(fregfile_io_write_ports_1_valid),
    .io_write_ports_1_bits_addr(fregfile_io_write_ports_1_bits_addr),
    .io_write_ports_1_bits_data(fregfile_io_write_ports_1_bits_data)
  );
  RegisterRead fregister_read ( // @[fp-pipeline.scala 73:30]
    .clock(fregister_read_clock),
    .reset(fregister_read_reset),
    .io_iss_valids_0(fregister_read_io_iss_valids_0),
    .io_iss_uops_0_uopc(fregister_read_io_iss_uops_0_uopc),
    .io_iss_uops_0_inst(fregister_read_io_iss_uops_0_inst),
    .io_iss_uops_0_debug_inst(fregister_read_io_iss_uops_0_debug_inst),
    .io_iss_uops_0_is_rvc(fregister_read_io_iss_uops_0_is_rvc),
    .io_iss_uops_0_debug_pc(fregister_read_io_iss_uops_0_debug_pc),
    .io_iss_uops_0_iq_type(fregister_read_io_iss_uops_0_iq_type),
    .io_iss_uops_0_fu_code(fregister_read_io_iss_uops_0_fu_code),
    .io_iss_uops_0_ctrl_br_type(fregister_read_io_iss_uops_0_ctrl_br_type),
    .io_iss_uops_0_ctrl_op1_sel(fregister_read_io_iss_uops_0_ctrl_op1_sel),
    .io_iss_uops_0_ctrl_op2_sel(fregister_read_io_iss_uops_0_ctrl_op2_sel),
    .io_iss_uops_0_ctrl_imm_sel(fregister_read_io_iss_uops_0_ctrl_imm_sel),
    .io_iss_uops_0_ctrl_op_fcn(fregister_read_io_iss_uops_0_ctrl_op_fcn),
    .io_iss_uops_0_ctrl_fcn_dw(fregister_read_io_iss_uops_0_ctrl_fcn_dw),
    .io_iss_uops_0_ctrl_csr_cmd(fregister_read_io_iss_uops_0_ctrl_csr_cmd),
    .io_iss_uops_0_ctrl_is_load(fregister_read_io_iss_uops_0_ctrl_is_load),
    .io_iss_uops_0_ctrl_is_sta(fregister_read_io_iss_uops_0_ctrl_is_sta),
    .io_iss_uops_0_ctrl_is_std(fregister_read_io_iss_uops_0_ctrl_is_std),
    .io_iss_uops_0_iw_state(fregister_read_io_iss_uops_0_iw_state),
    .io_iss_uops_0_iw_p1_poisoned(fregister_read_io_iss_uops_0_iw_p1_poisoned),
    .io_iss_uops_0_iw_p2_poisoned(fregister_read_io_iss_uops_0_iw_p2_poisoned),
    .io_iss_uops_0_is_br(fregister_read_io_iss_uops_0_is_br),
    .io_iss_uops_0_is_jalr(fregister_read_io_iss_uops_0_is_jalr),
    .io_iss_uops_0_is_jal(fregister_read_io_iss_uops_0_is_jal),
    .io_iss_uops_0_is_sfb(fregister_read_io_iss_uops_0_is_sfb),
    .io_iss_uops_0_br_mask(fregister_read_io_iss_uops_0_br_mask),
    .io_iss_uops_0_br_tag(fregister_read_io_iss_uops_0_br_tag),
    .io_iss_uops_0_ftq_idx(fregister_read_io_iss_uops_0_ftq_idx),
    .io_iss_uops_0_edge_inst(fregister_read_io_iss_uops_0_edge_inst),
    .io_iss_uops_0_pc_lob(fregister_read_io_iss_uops_0_pc_lob),
    .io_iss_uops_0_taken(fregister_read_io_iss_uops_0_taken),
    .io_iss_uops_0_imm_packed(fregister_read_io_iss_uops_0_imm_packed),
    .io_iss_uops_0_csr_addr(fregister_read_io_iss_uops_0_csr_addr),
    .io_iss_uops_0_rob_idx(fregister_read_io_iss_uops_0_rob_idx),
    .io_iss_uops_0_ldq_idx(fregister_read_io_iss_uops_0_ldq_idx),
    .io_iss_uops_0_stq_idx(fregister_read_io_iss_uops_0_stq_idx),
    .io_iss_uops_0_rxq_idx(fregister_read_io_iss_uops_0_rxq_idx),
    .io_iss_uops_0_pdst(fregister_read_io_iss_uops_0_pdst),
    .io_iss_uops_0_prs1(fregister_read_io_iss_uops_0_prs1),
    .io_iss_uops_0_prs2(fregister_read_io_iss_uops_0_prs2),
    .io_iss_uops_0_prs3(fregister_read_io_iss_uops_0_prs3),
    .io_iss_uops_0_ppred(fregister_read_io_iss_uops_0_ppred),
    .io_iss_uops_0_prs1_busy(fregister_read_io_iss_uops_0_prs1_busy),
    .io_iss_uops_0_prs2_busy(fregister_read_io_iss_uops_0_prs2_busy),
    .io_iss_uops_0_prs3_busy(fregister_read_io_iss_uops_0_prs3_busy),
    .io_iss_uops_0_ppred_busy(fregister_read_io_iss_uops_0_ppred_busy),
    .io_iss_uops_0_stale_pdst(fregister_read_io_iss_uops_0_stale_pdst),
    .io_iss_uops_0_exception(fregister_read_io_iss_uops_0_exception),
    .io_iss_uops_0_exc_cause(fregister_read_io_iss_uops_0_exc_cause),
    .io_iss_uops_0_bypassable(fregister_read_io_iss_uops_0_bypassable),
    .io_iss_uops_0_mem_cmd(fregister_read_io_iss_uops_0_mem_cmd),
    .io_iss_uops_0_mem_size(fregister_read_io_iss_uops_0_mem_size),
    .io_iss_uops_0_mem_signed(fregister_read_io_iss_uops_0_mem_signed),
    .io_iss_uops_0_is_fence(fregister_read_io_iss_uops_0_is_fence),
    .io_iss_uops_0_is_fencei(fregister_read_io_iss_uops_0_is_fencei),
    .io_iss_uops_0_is_amo(fregister_read_io_iss_uops_0_is_amo),
    .io_iss_uops_0_uses_ldq(fregister_read_io_iss_uops_0_uses_ldq),
    .io_iss_uops_0_uses_stq(fregister_read_io_iss_uops_0_uses_stq),
    .io_iss_uops_0_is_sys_pc2epc(fregister_read_io_iss_uops_0_is_sys_pc2epc),
    .io_iss_uops_0_is_unique(fregister_read_io_iss_uops_0_is_unique),
    .io_iss_uops_0_flush_on_commit(fregister_read_io_iss_uops_0_flush_on_commit),
    .io_iss_uops_0_ldst_is_rs1(fregister_read_io_iss_uops_0_ldst_is_rs1),
    .io_iss_uops_0_ldst(fregister_read_io_iss_uops_0_ldst),
    .io_iss_uops_0_lrs1(fregister_read_io_iss_uops_0_lrs1),
    .io_iss_uops_0_lrs2(fregister_read_io_iss_uops_0_lrs2),
    .io_iss_uops_0_lrs3(fregister_read_io_iss_uops_0_lrs3),
    .io_iss_uops_0_ldst_val(fregister_read_io_iss_uops_0_ldst_val),
    .io_iss_uops_0_dst_rtype(fregister_read_io_iss_uops_0_dst_rtype),
    .io_iss_uops_0_lrs1_rtype(fregister_read_io_iss_uops_0_lrs1_rtype),
    .io_iss_uops_0_lrs2_rtype(fregister_read_io_iss_uops_0_lrs2_rtype),
    .io_iss_uops_0_frs3_en(fregister_read_io_iss_uops_0_frs3_en),
    .io_iss_uops_0_fp_val(fregister_read_io_iss_uops_0_fp_val),
    .io_iss_uops_0_fp_single(fregister_read_io_iss_uops_0_fp_single),
    .io_iss_uops_0_xcpt_pf_if(fregister_read_io_iss_uops_0_xcpt_pf_if),
    .io_iss_uops_0_xcpt_ae_if(fregister_read_io_iss_uops_0_xcpt_ae_if),
    .io_iss_uops_0_xcpt_ma_if(fregister_read_io_iss_uops_0_xcpt_ma_if),
    .io_iss_uops_0_bp_debug_if(fregister_read_io_iss_uops_0_bp_debug_if),
    .io_iss_uops_0_bp_xcpt_if(fregister_read_io_iss_uops_0_bp_xcpt_if),
    .io_iss_uops_0_debug_fsrc(fregister_read_io_iss_uops_0_debug_fsrc),
    .io_iss_uops_0_debug_tsrc(fregister_read_io_iss_uops_0_debug_tsrc),
    .io_rf_read_ports_0_addr(fregister_read_io_rf_read_ports_0_addr),
    .io_rf_read_ports_0_data(fregister_read_io_rf_read_ports_0_data),
    .io_rf_read_ports_1_addr(fregister_read_io_rf_read_ports_1_addr),
    .io_rf_read_ports_1_data(fregister_read_io_rf_read_ports_1_data),
    .io_rf_read_ports_2_addr(fregister_read_io_rf_read_ports_2_addr),
    .io_rf_read_ports_2_data(fregister_read_io_rf_read_ports_2_data),
    .io_prf_read_ports_0_addr(fregister_read_io_prf_read_ports_0_addr),
    .io_prf_read_ports_0_data(fregister_read_io_prf_read_ports_0_data),
    .io_exe_reqs_0_ready(fregister_read_io_exe_reqs_0_ready),
    .io_exe_reqs_0_valid(fregister_read_io_exe_reqs_0_valid),
    .io_exe_reqs_0_bits_uop_uopc(fregister_read_io_exe_reqs_0_bits_uop_uopc),
    .io_exe_reqs_0_bits_uop_inst(fregister_read_io_exe_reqs_0_bits_uop_inst),
    .io_exe_reqs_0_bits_uop_debug_inst(fregister_read_io_exe_reqs_0_bits_uop_debug_inst),
    .io_exe_reqs_0_bits_uop_is_rvc(fregister_read_io_exe_reqs_0_bits_uop_is_rvc),
    .io_exe_reqs_0_bits_uop_debug_pc(fregister_read_io_exe_reqs_0_bits_uop_debug_pc),
    .io_exe_reqs_0_bits_uop_iq_type(fregister_read_io_exe_reqs_0_bits_uop_iq_type),
    .io_exe_reqs_0_bits_uop_fu_code(fregister_read_io_exe_reqs_0_bits_uop_fu_code),
    .io_exe_reqs_0_bits_uop_ctrl_br_type(fregister_read_io_exe_reqs_0_bits_uop_ctrl_br_type),
    .io_exe_reqs_0_bits_uop_ctrl_op1_sel(fregister_read_io_exe_reqs_0_bits_uop_ctrl_op1_sel),
    .io_exe_reqs_0_bits_uop_ctrl_op2_sel(fregister_read_io_exe_reqs_0_bits_uop_ctrl_op2_sel),
    .io_exe_reqs_0_bits_uop_ctrl_imm_sel(fregister_read_io_exe_reqs_0_bits_uop_ctrl_imm_sel),
    .io_exe_reqs_0_bits_uop_ctrl_op_fcn(fregister_read_io_exe_reqs_0_bits_uop_ctrl_op_fcn),
    .io_exe_reqs_0_bits_uop_ctrl_fcn_dw(fregister_read_io_exe_reqs_0_bits_uop_ctrl_fcn_dw),
    .io_exe_reqs_0_bits_uop_ctrl_csr_cmd(fregister_read_io_exe_reqs_0_bits_uop_ctrl_csr_cmd),
    .io_exe_reqs_0_bits_uop_ctrl_is_load(fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_load),
    .io_exe_reqs_0_bits_uop_ctrl_is_sta(fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_sta),
    .io_exe_reqs_0_bits_uop_ctrl_is_std(fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_std),
    .io_exe_reqs_0_bits_uop_iw_state(fregister_read_io_exe_reqs_0_bits_uop_iw_state),
    .io_exe_reqs_0_bits_uop_iw_p1_poisoned(fregister_read_io_exe_reqs_0_bits_uop_iw_p1_poisoned),
    .io_exe_reqs_0_bits_uop_iw_p2_poisoned(fregister_read_io_exe_reqs_0_bits_uop_iw_p2_poisoned),
    .io_exe_reqs_0_bits_uop_is_br(fregister_read_io_exe_reqs_0_bits_uop_is_br),
    .io_exe_reqs_0_bits_uop_is_jalr(fregister_read_io_exe_reqs_0_bits_uop_is_jalr),
    .io_exe_reqs_0_bits_uop_is_jal(fregister_read_io_exe_reqs_0_bits_uop_is_jal),
    .io_exe_reqs_0_bits_uop_is_sfb(fregister_read_io_exe_reqs_0_bits_uop_is_sfb),
    .io_exe_reqs_0_bits_uop_br_mask(fregister_read_io_exe_reqs_0_bits_uop_br_mask),
    .io_exe_reqs_0_bits_uop_br_tag(fregister_read_io_exe_reqs_0_bits_uop_br_tag),
    .io_exe_reqs_0_bits_uop_ftq_idx(fregister_read_io_exe_reqs_0_bits_uop_ftq_idx),
    .io_exe_reqs_0_bits_uop_edge_inst(fregister_read_io_exe_reqs_0_bits_uop_edge_inst),
    .io_exe_reqs_0_bits_uop_pc_lob(fregister_read_io_exe_reqs_0_bits_uop_pc_lob),
    .io_exe_reqs_0_bits_uop_taken(fregister_read_io_exe_reqs_0_bits_uop_taken),
    .io_exe_reqs_0_bits_uop_imm_packed(fregister_read_io_exe_reqs_0_bits_uop_imm_packed),
    .io_exe_reqs_0_bits_uop_csr_addr(fregister_read_io_exe_reqs_0_bits_uop_csr_addr),
    .io_exe_reqs_0_bits_uop_rob_idx(fregister_read_io_exe_reqs_0_bits_uop_rob_idx),
    .io_exe_reqs_0_bits_uop_ldq_idx(fregister_read_io_exe_reqs_0_bits_uop_ldq_idx),
    .io_exe_reqs_0_bits_uop_stq_idx(fregister_read_io_exe_reqs_0_bits_uop_stq_idx),
    .io_exe_reqs_0_bits_uop_rxq_idx(fregister_read_io_exe_reqs_0_bits_uop_rxq_idx),
    .io_exe_reqs_0_bits_uop_pdst(fregister_read_io_exe_reqs_0_bits_uop_pdst),
    .io_exe_reqs_0_bits_uop_prs1(fregister_read_io_exe_reqs_0_bits_uop_prs1),
    .io_exe_reqs_0_bits_uop_prs2(fregister_read_io_exe_reqs_0_bits_uop_prs2),
    .io_exe_reqs_0_bits_uop_prs3(fregister_read_io_exe_reqs_0_bits_uop_prs3),
    .io_exe_reqs_0_bits_uop_ppred(fregister_read_io_exe_reqs_0_bits_uop_ppred),
    .io_exe_reqs_0_bits_uop_prs1_busy(fregister_read_io_exe_reqs_0_bits_uop_prs1_busy),
    .io_exe_reqs_0_bits_uop_prs2_busy(fregister_read_io_exe_reqs_0_bits_uop_prs2_busy),
    .io_exe_reqs_0_bits_uop_prs3_busy(fregister_read_io_exe_reqs_0_bits_uop_prs3_busy),
    .io_exe_reqs_0_bits_uop_ppred_busy(fregister_read_io_exe_reqs_0_bits_uop_ppred_busy),
    .io_exe_reqs_0_bits_uop_stale_pdst(fregister_read_io_exe_reqs_0_bits_uop_stale_pdst),
    .io_exe_reqs_0_bits_uop_exception(fregister_read_io_exe_reqs_0_bits_uop_exception),
    .io_exe_reqs_0_bits_uop_exc_cause(fregister_read_io_exe_reqs_0_bits_uop_exc_cause),
    .io_exe_reqs_0_bits_uop_bypassable(fregister_read_io_exe_reqs_0_bits_uop_bypassable),
    .io_exe_reqs_0_bits_uop_mem_cmd(fregister_read_io_exe_reqs_0_bits_uop_mem_cmd),
    .io_exe_reqs_0_bits_uop_mem_size(fregister_read_io_exe_reqs_0_bits_uop_mem_size),
    .io_exe_reqs_0_bits_uop_mem_signed(fregister_read_io_exe_reqs_0_bits_uop_mem_signed),
    .io_exe_reqs_0_bits_uop_is_fence(fregister_read_io_exe_reqs_0_bits_uop_is_fence),
    .io_exe_reqs_0_bits_uop_is_fencei(fregister_read_io_exe_reqs_0_bits_uop_is_fencei),
    .io_exe_reqs_0_bits_uop_is_amo(fregister_read_io_exe_reqs_0_bits_uop_is_amo),
    .io_exe_reqs_0_bits_uop_uses_ldq(fregister_read_io_exe_reqs_0_bits_uop_uses_ldq),
    .io_exe_reqs_0_bits_uop_uses_stq(fregister_read_io_exe_reqs_0_bits_uop_uses_stq),
    .io_exe_reqs_0_bits_uop_is_sys_pc2epc(fregister_read_io_exe_reqs_0_bits_uop_is_sys_pc2epc),
    .io_exe_reqs_0_bits_uop_is_unique(fregister_read_io_exe_reqs_0_bits_uop_is_unique),
    .io_exe_reqs_0_bits_uop_flush_on_commit(fregister_read_io_exe_reqs_0_bits_uop_flush_on_commit),
    .io_exe_reqs_0_bits_uop_ldst_is_rs1(fregister_read_io_exe_reqs_0_bits_uop_ldst_is_rs1),
    .io_exe_reqs_0_bits_uop_ldst(fregister_read_io_exe_reqs_0_bits_uop_ldst),
    .io_exe_reqs_0_bits_uop_lrs1(fregister_read_io_exe_reqs_0_bits_uop_lrs1),
    .io_exe_reqs_0_bits_uop_lrs2(fregister_read_io_exe_reqs_0_bits_uop_lrs2),
    .io_exe_reqs_0_bits_uop_lrs3(fregister_read_io_exe_reqs_0_bits_uop_lrs3),
    .io_exe_reqs_0_bits_uop_ldst_val(fregister_read_io_exe_reqs_0_bits_uop_ldst_val),
    .io_exe_reqs_0_bits_uop_dst_rtype(fregister_read_io_exe_reqs_0_bits_uop_dst_rtype),
    .io_exe_reqs_0_bits_uop_lrs1_rtype(fregister_read_io_exe_reqs_0_bits_uop_lrs1_rtype),
    .io_exe_reqs_0_bits_uop_lrs2_rtype(fregister_read_io_exe_reqs_0_bits_uop_lrs2_rtype),
    .io_exe_reqs_0_bits_uop_frs3_en(fregister_read_io_exe_reqs_0_bits_uop_frs3_en),
    .io_exe_reqs_0_bits_uop_fp_val(fregister_read_io_exe_reqs_0_bits_uop_fp_val),
    .io_exe_reqs_0_bits_uop_fp_single(fregister_read_io_exe_reqs_0_bits_uop_fp_single),
    .io_exe_reqs_0_bits_uop_xcpt_pf_if(fregister_read_io_exe_reqs_0_bits_uop_xcpt_pf_if),
    .io_exe_reqs_0_bits_uop_xcpt_ae_if(fregister_read_io_exe_reqs_0_bits_uop_xcpt_ae_if),
    .io_exe_reqs_0_bits_uop_xcpt_ma_if(fregister_read_io_exe_reqs_0_bits_uop_xcpt_ma_if),
    .io_exe_reqs_0_bits_uop_bp_debug_if(fregister_read_io_exe_reqs_0_bits_uop_bp_debug_if),
    .io_exe_reqs_0_bits_uop_bp_xcpt_if(fregister_read_io_exe_reqs_0_bits_uop_bp_xcpt_if),
    .io_exe_reqs_0_bits_uop_debug_fsrc(fregister_read_io_exe_reqs_0_bits_uop_debug_fsrc),
    .io_exe_reqs_0_bits_uop_debug_tsrc(fregister_read_io_exe_reqs_0_bits_uop_debug_tsrc),
    .io_exe_reqs_0_bits_rs1_data(fregister_read_io_exe_reqs_0_bits_rs1_data),
    .io_exe_reqs_0_bits_rs2_data(fregister_read_io_exe_reqs_0_bits_rs2_data),
    .io_exe_reqs_0_bits_rs3_data(fregister_read_io_exe_reqs_0_bits_rs3_data),
    .io_exe_reqs_0_bits_pred_data(fregister_read_io_exe_reqs_0_bits_pred_data),
    .io_exe_reqs_0_bits_kill(fregister_read_io_exe_reqs_0_bits_kill),
    .io_kill(fregister_read_io_kill),
    .io_brupdate_b1_resolve_mask(fregister_read_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(fregister_read_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(fregister_read_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(fregister_read_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(fregister_read_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(fregister_read_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(fregister_read_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(fregister_read_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(fregister_read_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(fregister_read_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(fregister_read_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(fregister_read_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(fregister_read_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(fregister_read_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(fregister_read_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(fregister_read_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(fregister_read_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(fregister_read_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(fregister_read_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(fregister_read_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(fregister_read_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(fregister_read_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(fregister_read_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(fregister_read_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(fregister_read_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(fregister_read_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(fregister_read_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(fregister_read_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(fregister_read_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(fregister_read_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(fregister_read_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(fregister_read_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(fregister_read_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(fregister_read_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(fregister_read_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(fregister_read_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(fregister_read_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(fregister_read_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(fregister_read_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(fregister_read_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(fregister_read_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(fregister_read_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(fregister_read_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(fregister_read_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(fregister_read_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(fregister_read_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(fregister_read_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(fregister_read_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(fregister_read_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(fregister_read_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(fregister_read_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(fregister_read_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(fregister_read_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(fregister_read_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(fregister_read_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(fregister_read_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(fregister_read_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(fregister_read_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(fregister_read_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(fregister_read_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(fregister_read_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(fregister_read_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(fregister_read_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(fregister_read_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(fregister_read_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(fregister_read_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(fregister_read_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(fregister_read_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(fregister_read_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(fregister_read_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(fregister_read_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(fregister_read_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(fregister_read_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(fregister_read_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(fregister_read_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(fregister_read_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(fregister_read_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(fregister_read_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(fregister_read_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(fregister_read_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(fregister_read_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(fregister_read_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(fregister_read_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(fregister_read_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(fregister_read_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(fregister_read_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(fregister_read_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(fregister_read_io_brupdate_b2_target_offset)
  );
  Arbiter_16 ll_wbarb ( // @[fp-pipeline.scala 170:24]
    .clock(ll_wbarb_clock),
    .reset(ll_wbarb_reset),
    .io_in_0_ready(ll_wbarb_io_in_0_ready),
    .io_in_0_valid(ll_wbarb_io_in_0_valid),
    .io_in_0_bits_uop_uopc(ll_wbarb_io_in_0_bits_uop_uopc),
    .io_in_0_bits_uop_inst(ll_wbarb_io_in_0_bits_uop_inst),
    .io_in_0_bits_uop_debug_inst(ll_wbarb_io_in_0_bits_uop_debug_inst),
    .io_in_0_bits_uop_is_rvc(ll_wbarb_io_in_0_bits_uop_is_rvc),
    .io_in_0_bits_uop_debug_pc(ll_wbarb_io_in_0_bits_uop_debug_pc),
    .io_in_0_bits_uop_iq_type(ll_wbarb_io_in_0_bits_uop_iq_type),
    .io_in_0_bits_uop_fu_code(ll_wbarb_io_in_0_bits_uop_fu_code),
    .io_in_0_bits_uop_ctrl_br_type(ll_wbarb_io_in_0_bits_uop_ctrl_br_type),
    .io_in_0_bits_uop_ctrl_op1_sel(ll_wbarb_io_in_0_bits_uop_ctrl_op1_sel),
    .io_in_0_bits_uop_ctrl_op2_sel(ll_wbarb_io_in_0_bits_uop_ctrl_op2_sel),
    .io_in_0_bits_uop_ctrl_imm_sel(ll_wbarb_io_in_0_bits_uop_ctrl_imm_sel),
    .io_in_0_bits_uop_ctrl_op_fcn(ll_wbarb_io_in_0_bits_uop_ctrl_op_fcn),
    .io_in_0_bits_uop_ctrl_fcn_dw(ll_wbarb_io_in_0_bits_uop_ctrl_fcn_dw),
    .io_in_0_bits_uop_ctrl_csr_cmd(ll_wbarb_io_in_0_bits_uop_ctrl_csr_cmd),
    .io_in_0_bits_uop_ctrl_is_load(ll_wbarb_io_in_0_bits_uop_ctrl_is_load),
    .io_in_0_bits_uop_ctrl_is_sta(ll_wbarb_io_in_0_bits_uop_ctrl_is_sta),
    .io_in_0_bits_uop_ctrl_is_std(ll_wbarb_io_in_0_bits_uop_ctrl_is_std),
    .io_in_0_bits_uop_iw_state(ll_wbarb_io_in_0_bits_uop_iw_state),
    .io_in_0_bits_uop_iw_p1_poisoned(ll_wbarb_io_in_0_bits_uop_iw_p1_poisoned),
    .io_in_0_bits_uop_iw_p2_poisoned(ll_wbarb_io_in_0_bits_uop_iw_p2_poisoned),
    .io_in_0_bits_uop_is_br(ll_wbarb_io_in_0_bits_uop_is_br),
    .io_in_0_bits_uop_is_jalr(ll_wbarb_io_in_0_bits_uop_is_jalr),
    .io_in_0_bits_uop_is_jal(ll_wbarb_io_in_0_bits_uop_is_jal),
    .io_in_0_bits_uop_is_sfb(ll_wbarb_io_in_0_bits_uop_is_sfb),
    .io_in_0_bits_uop_br_mask(ll_wbarb_io_in_0_bits_uop_br_mask),
    .io_in_0_bits_uop_br_tag(ll_wbarb_io_in_0_bits_uop_br_tag),
    .io_in_0_bits_uop_ftq_idx(ll_wbarb_io_in_0_bits_uop_ftq_idx),
    .io_in_0_bits_uop_edge_inst(ll_wbarb_io_in_0_bits_uop_edge_inst),
    .io_in_0_bits_uop_pc_lob(ll_wbarb_io_in_0_bits_uop_pc_lob),
    .io_in_0_bits_uop_taken(ll_wbarb_io_in_0_bits_uop_taken),
    .io_in_0_bits_uop_imm_packed(ll_wbarb_io_in_0_bits_uop_imm_packed),
    .io_in_0_bits_uop_csr_addr(ll_wbarb_io_in_0_bits_uop_csr_addr),
    .io_in_0_bits_uop_rob_idx(ll_wbarb_io_in_0_bits_uop_rob_idx),
    .io_in_0_bits_uop_ldq_idx(ll_wbarb_io_in_0_bits_uop_ldq_idx),
    .io_in_0_bits_uop_stq_idx(ll_wbarb_io_in_0_bits_uop_stq_idx),
    .io_in_0_bits_uop_rxq_idx(ll_wbarb_io_in_0_bits_uop_rxq_idx),
    .io_in_0_bits_uop_pdst(ll_wbarb_io_in_0_bits_uop_pdst),
    .io_in_0_bits_uop_prs1(ll_wbarb_io_in_0_bits_uop_prs1),
    .io_in_0_bits_uop_prs2(ll_wbarb_io_in_0_bits_uop_prs2),
    .io_in_0_bits_uop_prs3(ll_wbarb_io_in_0_bits_uop_prs3),
    .io_in_0_bits_uop_ppred(ll_wbarb_io_in_0_bits_uop_ppred),
    .io_in_0_bits_uop_prs1_busy(ll_wbarb_io_in_0_bits_uop_prs1_busy),
    .io_in_0_bits_uop_prs2_busy(ll_wbarb_io_in_0_bits_uop_prs2_busy),
    .io_in_0_bits_uop_prs3_busy(ll_wbarb_io_in_0_bits_uop_prs3_busy),
    .io_in_0_bits_uop_ppred_busy(ll_wbarb_io_in_0_bits_uop_ppred_busy),
    .io_in_0_bits_uop_stale_pdst(ll_wbarb_io_in_0_bits_uop_stale_pdst),
    .io_in_0_bits_uop_exception(ll_wbarb_io_in_0_bits_uop_exception),
    .io_in_0_bits_uop_exc_cause(ll_wbarb_io_in_0_bits_uop_exc_cause),
    .io_in_0_bits_uop_bypassable(ll_wbarb_io_in_0_bits_uop_bypassable),
    .io_in_0_bits_uop_mem_cmd(ll_wbarb_io_in_0_bits_uop_mem_cmd),
    .io_in_0_bits_uop_mem_size(ll_wbarb_io_in_0_bits_uop_mem_size),
    .io_in_0_bits_uop_mem_signed(ll_wbarb_io_in_0_bits_uop_mem_signed),
    .io_in_0_bits_uop_is_fence(ll_wbarb_io_in_0_bits_uop_is_fence),
    .io_in_0_bits_uop_is_fencei(ll_wbarb_io_in_0_bits_uop_is_fencei),
    .io_in_0_bits_uop_is_amo(ll_wbarb_io_in_0_bits_uop_is_amo),
    .io_in_0_bits_uop_uses_ldq(ll_wbarb_io_in_0_bits_uop_uses_ldq),
    .io_in_0_bits_uop_uses_stq(ll_wbarb_io_in_0_bits_uop_uses_stq),
    .io_in_0_bits_uop_is_sys_pc2epc(ll_wbarb_io_in_0_bits_uop_is_sys_pc2epc),
    .io_in_0_bits_uop_is_unique(ll_wbarb_io_in_0_bits_uop_is_unique),
    .io_in_0_bits_uop_flush_on_commit(ll_wbarb_io_in_0_bits_uop_flush_on_commit),
    .io_in_0_bits_uop_ldst_is_rs1(ll_wbarb_io_in_0_bits_uop_ldst_is_rs1),
    .io_in_0_bits_uop_ldst(ll_wbarb_io_in_0_bits_uop_ldst),
    .io_in_0_bits_uop_lrs1(ll_wbarb_io_in_0_bits_uop_lrs1),
    .io_in_0_bits_uop_lrs2(ll_wbarb_io_in_0_bits_uop_lrs2),
    .io_in_0_bits_uop_lrs3(ll_wbarb_io_in_0_bits_uop_lrs3),
    .io_in_0_bits_uop_ldst_val(ll_wbarb_io_in_0_bits_uop_ldst_val),
    .io_in_0_bits_uop_dst_rtype(ll_wbarb_io_in_0_bits_uop_dst_rtype),
    .io_in_0_bits_uop_lrs1_rtype(ll_wbarb_io_in_0_bits_uop_lrs1_rtype),
    .io_in_0_bits_uop_lrs2_rtype(ll_wbarb_io_in_0_bits_uop_lrs2_rtype),
    .io_in_0_bits_uop_frs3_en(ll_wbarb_io_in_0_bits_uop_frs3_en),
    .io_in_0_bits_uop_fp_val(ll_wbarb_io_in_0_bits_uop_fp_val),
    .io_in_0_bits_uop_fp_single(ll_wbarb_io_in_0_bits_uop_fp_single),
    .io_in_0_bits_uop_xcpt_pf_if(ll_wbarb_io_in_0_bits_uop_xcpt_pf_if),
    .io_in_0_bits_uop_xcpt_ae_if(ll_wbarb_io_in_0_bits_uop_xcpt_ae_if),
    .io_in_0_bits_uop_xcpt_ma_if(ll_wbarb_io_in_0_bits_uop_xcpt_ma_if),
    .io_in_0_bits_uop_bp_debug_if(ll_wbarb_io_in_0_bits_uop_bp_debug_if),
    .io_in_0_bits_uop_bp_xcpt_if(ll_wbarb_io_in_0_bits_uop_bp_xcpt_if),
    .io_in_0_bits_uop_debug_fsrc(ll_wbarb_io_in_0_bits_uop_debug_fsrc),
    .io_in_0_bits_uop_debug_tsrc(ll_wbarb_io_in_0_bits_uop_debug_tsrc),
    .io_in_0_bits_data(ll_wbarb_io_in_0_bits_data),
    .io_in_0_bits_predicated(ll_wbarb_io_in_0_bits_predicated),
    .io_in_0_bits_fflags_valid(ll_wbarb_io_in_0_bits_fflags_valid),
    .io_in_0_bits_fflags_bits_uop_uopc(ll_wbarb_io_in_0_bits_fflags_bits_uop_uopc),
    .io_in_0_bits_fflags_bits_uop_inst(ll_wbarb_io_in_0_bits_fflags_bits_uop_inst),
    .io_in_0_bits_fflags_bits_uop_debug_inst(ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_inst),
    .io_in_0_bits_fflags_bits_uop_is_rvc(ll_wbarb_io_in_0_bits_fflags_bits_uop_is_rvc),
    .io_in_0_bits_fflags_bits_uop_debug_pc(ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_pc),
    .io_in_0_bits_fflags_bits_uop_iq_type(ll_wbarb_io_in_0_bits_fflags_bits_uop_iq_type),
    .io_in_0_bits_fflags_bits_uop_fu_code(ll_wbarb_io_in_0_bits_fflags_bits_uop_fu_code),
    .io_in_0_bits_fflags_bits_uop_ctrl_br_type(ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_br_type),
    .io_in_0_bits_fflags_bits_uop_ctrl_op1_sel(ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_in_0_bits_fflags_bits_uop_ctrl_op2_sel(ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_in_0_bits_fflags_bits_uop_ctrl_imm_sel(ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_in_0_bits_fflags_bits_uop_ctrl_op_fcn(ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_in_0_bits_fflags_bits_uop_ctrl_fcn_dw(ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_in_0_bits_fflags_bits_uop_ctrl_csr_cmd(ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_in_0_bits_fflags_bits_uop_ctrl_is_load(ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_is_load),
    .io_in_0_bits_fflags_bits_uop_ctrl_is_sta(ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_is_sta),
    .io_in_0_bits_fflags_bits_uop_ctrl_is_std(ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_is_std),
    .io_in_0_bits_fflags_bits_uop_iw_state(ll_wbarb_io_in_0_bits_fflags_bits_uop_iw_state),
    .io_in_0_bits_fflags_bits_uop_iw_p1_poisoned(ll_wbarb_io_in_0_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_in_0_bits_fflags_bits_uop_iw_p2_poisoned(ll_wbarb_io_in_0_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_in_0_bits_fflags_bits_uop_is_br(ll_wbarb_io_in_0_bits_fflags_bits_uop_is_br),
    .io_in_0_bits_fflags_bits_uop_is_jalr(ll_wbarb_io_in_0_bits_fflags_bits_uop_is_jalr),
    .io_in_0_bits_fflags_bits_uop_is_jal(ll_wbarb_io_in_0_bits_fflags_bits_uop_is_jal),
    .io_in_0_bits_fflags_bits_uop_is_sfb(ll_wbarb_io_in_0_bits_fflags_bits_uop_is_sfb),
    .io_in_0_bits_fflags_bits_uop_br_mask(ll_wbarb_io_in_0_bits_fflags_bits_uop_br_mask),
    .io_in_0_bits_fflags_bits_uop_br_tag(ll_wbarb_io_in_0_bits_fflags_bits_uop_br_tag),
    .io_in_0_bits_fflags_bits_uop_ftq_idx(ll_wbarb_io_in_0_bits_fflags_bits_uop_ftq_idx),
    .io_in_0_bits_fflags_bits_uop_edge_inst(ll_wbarb_io_in_0_bits_fflags_bits_uop_edge_inst),
    .io_in_0_bits_fflags_bits_uop_pc_lob(ll_wbarb_io_in_0_bits_fflags_bits_uop_pc_lob),
    .io_in_0_bits_fflags_bits_uop_taken(ll_wbarb_io_in_0_bits_fflags_bits_uop_taken),
    .io_in_0_bits_fflags_bits_uop_imm_packed(ll_wbarb_io_in_0_bits_fflags_bits_uop_imm_packed),
    .io_in_0_bits_fflags_bits_uop_csr_addr(ll_wbarb_io_in_0_bits_fflags_bits_uop_csr_addr),
    .io_in_0_bits_fflags_bits_uop_rob_idx(ll_wbarb_io_in_0_bits_fflags_bits_uop_rob_idx),
    .io_in_0_bits_fflags_bits_uop_ldq_idx(ll_wbarb_io_in_0_bits_fflags_bits_uop_ldq_idx),
    .io_in_0_bits_fflags_bits_uop_stq_idx(ll_wbarb_io_in_0_bits_fflags_bits_uop_stq_idx),
    .io_in_0_bits_fflags_bits_uop_rxq_idx(ll_wbarb_io_in_0_bits_fflags_bits_uop_rxq_idx),
    .io_in_0_bits_fflags_bits_uop_pdst(ll_wbarb_io_in_0_bits_fflags_bits_uop_pdst),
    .io_in_0_bits_fflags_bits_uop_prs1(ll_wbarb_io_in_0_bits_fflags_bits_uop_prs1),
    .io_in_0_bits_fflags_bits_uop_prs2(ll_wbarb_io_in_0_bits_fflags_bits_uop_prs2),
    .io_in_0_bits_fflags_bits_uop_prs3(ll_wbarb_io_in_0_bits_fflags_bits_uop_prs3),
    .io_in_0_bits_fflags_bits_uop_ppred(ll_wbarb_io_in_0_bits_fflags_bits_uop_ppred),
    .io_in_0_bits_fflags_bits_uop_prs1_busy(ll_wbarb_io_in_0_bits_fflags_bits_uop_prs1_busy),
    .io_in_0_bits_fflags_bits_uop_prs2_busy(ll_wbarb_io_in_0_bits_fflags_bits_uop_prs2_busy),
    .io_in_0_bits_fflags_bits_uop_prs3_busy(ll_wbarb_io_in_0_bits_fflags_bits_uop_prs3_busy),
    .io_in_0_bits_fflags_bits_uop_ppred_busy(ll_wbarb_io_in_0_bits_fflags_bits_uop_ppred_busy),
    .io_in_0_bits_fflags_bits_uop_stale_pdst(ll_wbarb_io_in_0_bits_fflags_bits_uop_stale_pdst),
    .io_in_0_bits_fflags_bits_uop_exception(ll_wbarb_io_in_0_bits_fflags_bits_uop_exception),
    .io_in_0_bits_fflags_bits_uop_exc_cause(ll_wbarb_io_in_0_bits_fflags_bits_uop_exc_cause),
    .io_in_0_bits_fflags_bits_uop_bypassable(ll_wbarb_io_in_0_bits_fflags_bits_uop_bypassable),
    .io_in_0_bits_fflags_bits_uop_mem_cmd(ll_wbarb_io_in_0_bits_fflags_bits_uop_mem_cmd),
    .io_in_0_bits_fflags_bits_uop_mem_size(ll_wbarb_io_in_0_bits_fflags_bits_uop_mem_size),
    .io_in_0_bits_fflags_bits_uop_mem_signed(ll_wbarb_io_in_0_bits_fflags_bits_uop_mem_signed),
    .io_in_0_bits_fflags_bits_uop_is_fence(ll_wbarb_io_in_0_bits_fflags_bits_uop_is_fence),
    .io_in_0_bits_fflags_bits_uop_is_fencei(ll_wbarb_io_in_0_bits_fflags_bits_uop_is_fencei),
    .io_in_0_bits_fflags_bits_uop_is_amo(ll_wbarb_io_in_0_bits_fflags_bits_uop_is_amo),
    .io_in_0_bits_fflags_bits_uop_uses_ldq(ll_wbarb_io_in_0_bits_fflags_bits_uop_uses_ldq),
    .io_in_0_bits_fflags_bits_uop_uses_stq(ll_wbarb_io_in_0_bits_fflags_bits_uop_uses_stq),
    .io_in_0_bits_fflags_bits_uop_is_sys_pc2epc(ll_wbarb_io_in_0_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_in_0_bits_fflags_bits_uop_is_unique(ll_wbarb_io_in_0_bits_fflags_bits_uop_is_unique),
    .io_in_0_bits_fflags_bits_uop_flush_on_commit(ll_wbarb_io_in_0_bits_fflags_bits_uop_flush_on_commit),
    .io_in_0_bits_fflags_bits_uop_ldst_is_rs1(ll_wbarb_io_in_0_bits_fflags_bits_uop_ldst_is_rs1),
    .io_in_0_bits_fflags_bits_uop_ldst(ll_wbarb_io_in_0_bits_fflags_bits_uop_ldst),
    .io_in_0_bits_fflags_bits_uop_lrs1(ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs1),
    .io_in_0_bits_fflags_bits_uop_lrs2(ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs2),
    .io_in_0_bits_fflags_bits_uop_lrs3(ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs3),
    .io_in_0_bits_fflags_bits_uop_ldst_val(ll_wbarb_io_in_0_bits_fflags_bits_uop_ldst_val),
    .io_in_0_bits_fflags_bits_uop_dst_rtype(ll_wbarb_io_in_0_bits_fflags_bits_uop_dst_rtype),
    .io_in_0_bits_fflags_bits_uop_lrs1_rtype(ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs1_rtype),
    .io_in_0_bits_fflags_bits_uop_lrs2_rtype(ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs2_rtype),
    .io_in_0_bits_fflags_bits_uop_frs3_en(ll_wbarb_io_in_0_bits_fflags_bits_uop_frs3_en),
    .io_in_0_bits_fflags_bits_uop_fp_val(ll_wbarb_io_in_0_bits_fflags_bits_uop_fp_val),
    .io_in_0_bits_fflags_bits_uop_fp_single(ll_wbarb_io_in_0_bits_fflags_bits_uop_fp_single),
    .io_in_0_bits_fflags_bits_uop_xcpt_pf_if(ll_wbarb_io_in_0_bits_fflags_bits_uop_xcpt_pf_if),
    .io_in_0_bits_fflags_bits_uop_xcpt_ae_if(ll_wbarb_io_in_0_bits_fflags_bits_uop_xcpt_ae_if),
    .io_in_0_bits_fflags_bits_uop_xcpt_ma_if(ll_wbarb_io_in_0_bits_fflags_bits_uop_xcpt_ma_if),
    .io_in_0_bits_fflags_bits_uop_bp_debug_if(ll_wbarb_io_in_0_bits_fflags_bits_uop_bp_debug_if),
    .io_in_0_bits_fflags_bits_uop_bp_xcpt_if(ll_wbarb_io_in_0_bits_fflags_bits_uop_bp_xcpt_if),
    .io_in_0_bits_fflags_bits_uop_debug_fsrc(ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_fsrc),
    .io_in_0_bits_fflags_bits_uop_debug_tsrc(ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_tsrc),
    .io_in_0_bits_fflags_bits_flags(ll_wbarb_io_in_0_bits_fflags_bits_flags),
    .io_in_1_ready(ll_wbarb_io_in_1_ready),
    .io_in_1_valid(ll_wbarb_io_in_1_valid),
    .io_in_1_bits_uop_uopc(ll_wbarb_io_in_1_bits_uop_uopc),
    .io_in_1_bits_uop_inst(ll_wbarb_io_in_1_bits_uop_inst),
    .io_in_1_bits_uop_debug_inst(ll_wbarb_io_in_1_bits_uop_debug_inst),
    .io_in_1_bits_uop_is_rvc(ll_wbarb_io_in_1_bits_uop_is_rvc),
    .io_in_1_bits_uop_debug_pc(ll_wbarb_io_in_1_bits_uop_debug_pc),
    .io_in_1_bits_uop_iq_type(ll_wbarb_io_in_1_bits_uop_iq_type),
    .io_in_1_bits_uop_fu_code(ll_wbarb_io_in_1_bits_uop_fu_code),
    .io_in_1_bits_uop_ctrl_br_type(ll_wbarb_io_in_1_bits_uop_ctrl_br_type),
    .io_in_1_bits_uop_ctrl_op1_sel(ll_wbarb_io_in_1_bits_uop_ctrl_op1_sel),
    .io_in_1_bits_uop_ctrl_op2_sel(ll_wbarb_io_in_1_bits_uop_ctrl_op2_sel),
    .io_in_1_bits_uop_ctrl_imm_sel(ll_wbarb_io_in_1_bits_uop_ctrl_imm_sel),
    .io_in_1_bits_uop_ctrl_op_fcn(ll_wbarb_io_in_1_bits_uop_ctrl_op_fcn),
    .io_in_1_bits_uop_ctrl_fcn_dw(ll_wbarb_io_in_1_bits_uop_ctrl_fcn_dw),
    .io_in_1_bits_uop_ctrl_csr_cmd(ll_wbarb_io_in_1_bits_uop_ctrl_csr_cmd),
    .io_in_1_bits_uop_ctrl_is_load(ll_wbarb_io_in_1_bits_uop_ctrl_is_load),
    .io_in_1_bits_uop_ctrl_is_sta(ll_wbarb_io_in_1_bits_uop_ctrl_is_sta),
    .io_in_1_bits_uop_ctrl_is_std(ll_wbarb_io_in_1_bits_uop_ctrl_is_std),
    .io_in_1_bits_uop_iw_state(ll_wbarb_io_in_1_bits_uop_iw_state),
    .io_in_1_bits_uop_iw_p1_poisoned(ll_wbarb_io_in_1_bits_uop_iw_p1_poisoned),
    .io_in_1_bits_uop_iw_p2_poisoned(ll_wbarb_io_in_1_bits_uop_iw_p2_poisoned),
    .io_in_1_bits_uop_is_br(ll_wbarb_io_in_1_bits_uop_is_br),
    .io_in_1_bits_uop_is_jalr(ll_wbarb_io_in_1_bits_uop_is_jalr),
    .io_in_1_bits_uop_is_jal(ll_wbarb_io_in_1_bits_uop_is_jal),
    .io_in_1_bits_uop_is_sfb(ll_wbarb_io_in_1_bits_uop_is_sfb),
    .io_in_1_bits_uop_br_mask(ll_wbarb_io_in_1_bits_uop_br_mask),
    .io_in_1_bits_uop_br_tag(ll_wbarb_io_in_1_bits_uop_br_tag),
    .io_in_1_bits_uop_ftq_idx(ll_wbarb_io_in_1_bits_uop_ftq_idx),
    .io_in_1_bits_uop_edge_inst(ll_wbarb_io_in_1_bits_uop_edge_inst),
    .io_in_1_bits_uop_pc_lob(ll_wbarb_io_in_1_bits_uop_pc_lob),
    .io_in_1_bits_uop_taken(ll_wbarb_io_in_1_bits_uop_taken),
    .io_in_1_bits_uop_imm_packed(ll_wbarb_io_in_1_bits_uop_imm_packed),
    .io_in_1_bits_uop_csr_addr(ll_wbarb_io_in_1_bits_uop_csr_addr),
    .io_in_1_bits_uop_rob_idx(ll_wbarb_io_in_1_bits_uop_rob_idx),
    .io_in_1_bits_uop_ldq_idx(ll_wbarb_io_in_1_bits_uop_ldq_idx),
    .io_in_1_bits_uop_stq_idx(ll_wbarb_io_in_1_bits_uop_stq_idx),
    .io_in_1_bits_uop_rxq_idx(ll_wbarb_io_in_1_bits_uop_rxq_idx),
    .io_in_1_bits_uop_pdst(ll_wbarb_io_in_1_bits_uop_pdst),
    .io_in_1_bits_uop_prs1(ll_wbarb_io_in_1_bits_uop_prs1),
    .io_in_1_bits_uop_prs2(ll_wbarb_io_in_1_bits_uop_prs2),
    .io_in_1_bits_uop_prs3(ll_wbarb_io_in_1_bits_uop_prs3),
    .io_in_1_bits_uop_ppred(ll_wbarb_io_in_1_bits_uop_ppred),
    .io_in_1_bits_uop_prs1_busy(ll_wbarb_io_in_1_bits_uop_prs1_busy),
    .io_in_1_bits_uop_prs2_busy(ll_wbarb_io_in_1_bits_uop_prs2_busy),
    .io_in_1_bits_uop_prs3_busy(ll_wbarb_io_in_1_bits_uop_prs3_busy),
    .io_in_1_bits_uop_ppred_busy(ll_wbarb_io_in_1_bits_uop_ppred_busy),
    .io_in_1_bits_uop_stale_pdst(ll_wbarb_io_in_1_bits_uop_stale_pdst),
    .io_in_1_bits_uop_exception(ll_wbarb_io_in_1_bits_uop_exception),
    .io_in_1_bits_uop_exc_cause(ll_wbarb_io_in_1_bits_uop_exc_cause),
    .io_in_1_bits_uop_bypassable(ll_wbarb_io_in_1_bits_uop_bypassable),
    .io_in_1_bits_uop_mem_cmd(ll_wbarb_io_in_1_bits_uop_mem_cmd),
    .io_in_1_bits_uop_mem_size(ll_wbarb_io_in_1_bits_uop_mem_size),
    .io_in_1_bits_uop_mem_signed(ll_wbarb_io_in_1_bits_uop_mem_signed),
    .io_in_1_bits_uop_is_fence(ll_wbarb_io_in_1_bits_uop_is_fence),
    .io_in_1_bits_uop_is_fencei(ll_wbarb_io_in_1_bits_uop_is_fencei),
    .io_in_1_bits_uop_is_amo(ll_wbarb_io_in_1_bits_uop_is_amo),
    .io_in_1_bits_uop_uses_ldq(ll_wbarb_io_in_1_bits_uop_uses_ldq),
    .io_in_1_bits_uop_uses_stq(ll_wbarb_io_in_1_bits_uop_uses_stq),
    .io_in_1_bits_uop_is_sys_pc2epc(ll_wbarb_io_in_1_bits_uop_is_sys_pc2epc),
    .io_in_1_bits_uop_is_unique(ll_wbarb_io_in_1_bits_uop_is_unique),
    .io_in_1_bits_uop_flush_on_commit(ll_wbarb_io_in_1_bits_uop_flush_on_commit),
    .io_in_1_bits_uop_ldst_is_rs1(ll_wbarb_io_in_1_bits_uop_ldst_is_rs1),
    .io_in_1_bits_uop_ldst(ll_wbarb_io_in_1_bits_uop_ldst),
    .io_in_1_bits_uop_lrs1(ll_wbarb_io_in_1_bits_uop_lrs1),
    .io_in_1_bits_uop_lrs2(ll_wbarb_io_in_1_bits_uop_lrs2),
    .io_in_1_bits_uop_lrs3(ll_wbarb_io_in_1_bits_uop_lrs3),
    .io_in_1_bits_uop_ldst_val(ll_wbarb_io_in_1_bits_uop_ldst_val),
    .io_in_1_bits_uop_dst_rtype(ll_wbarb_io_in_1_bits_uop_dst_rtype),
    .io_in_1_bits_uop_lrs1_rtype(ll_wbarb_io_in_1_bits_uop_lrs1_rtype),
    .io_in_1_bits_uop_lrs2_rtype(ll_wbarb_io_in_1_bits_uop_lrs2_rtype),
    .io_in_1_bits_uop_frs3_en(ll_wbarb_io_in_1_bits_uop_frs3_en),
    .io_in_1_bits_uop_fp_val(ll_wbarb_io_in_1_bits_uop_fp_val),
    .io_in_1_bits_uop_fp_single(ll_wbarb_io_in_1_bits_uop_fp_single),
    .io_in_1_bits_uop_xcpt_pf_if(ll_wbarb_io_in_1_bits_uop_xcpt_pf_if),
    .io_in_1_bits_uop_xcpt_ae_if(ll_wbarb_io_in_1_bits_uop_xcpt_ae_if),
    .io_in_1_bits_uop_xcpt_ma_if(ll_wbarb_io_in_1_bits_uop_xcpt_ma_if),
    .io_in_1_bits_uop_bp_debug_if(ll_wbarb_io_in_1_bits_uop_bp_debug_if),
    .io_in_1_bits_uop_bp_xcpt_if(ll_wbarb_io_in_1_bits_uop_bp_xcpt_if),
    .io_in_1_bits_uop_debug_fsrc(ll_wbarb_io_in_1_bits_uop_debug_fsrc),
    .io_in_1_bits_uop_debug_tsrc(ll_wbarb_io_in_1_bits_uop_debug_tsrc),
    .io_in_1_bits_data(ll_wbarb_io_in_1_bits_data),
    .io_in_1_bits_predicated(ll_wbarb_io_in_1_bits_predicated),
    .io_in_1_bits_fflags_valid(ll_wbarb_io_in_1_bits_fflags_valid),
    .io_in_1_bits_fflags_bits_uop_uopc(ll_wbarb_io_in_1_bits_fflags_bits_uop_uopc),
    .io_in_1_bits_fflags_bits_uop_inst(ll_wbarb_io_in_1_bits_fflags_bits_uop_inst),
    .io_in_1_bits_fflags_bits_uop_debug_inst(ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_inst),
    .io_in_1_bits_fflags_bits_uop_is_rvc(ll_wbarb_io_in_1_bits_fflags_bits_uop_is_rvc),
    .io_in_1_bits_fflags_bits_uop_debug_pc(ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_pc),
    .io_in_1_bits_fflags_bits_uop_iq_type(ll_wbarb_io_in_1_bits_fflags_bits_uop_iq_type),
    .io_in_1_bits_fflags_bits_uop_fu_code(ll_wbarb_io_in_1_bits_fflags_bits_uop_fu_code),
    .io_in_1_bits_fflags_bits_uop_ctrl_br_type(ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_br_type),
    .io_in_1_bits_fflags_bits_uop_ctrl_op1_sel(ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_in_1_bits_fflags_bits_uop_ctrl_op2_sel(ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_in_1_bits_fflags_bits_uop_ctrl_imm_sel(ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_in_1_bits_fflags_bits_uop_ctrl_op_fcn(ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_in_1_bits_fflags_bits_uop_ctrl_fcn_dw(ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_in_1_bits_fflags_bits_uop_ctrl_csr_cmd(ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_in_1_bits_fflags_bits_uop_ctrl_is_load(ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_is_load),
    .io_in_1_bits_fflags_bits_uop_ctrl_is_sta(ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_is_sta),
    .io_in_1_bits_fflags_bits_uop_ctrl_is_std(ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_is_std),
    .io_in_1_bits_fflags_bits_uop_iw_state(ll_wbarb_io_in_1_bits_fflags_bits_uop_iw_state),
    .io_in_1_bits_fflags_bits_uop_iw_p1_poisoned(ll_wbarb_io_in_1_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_in_1_bits_fflags_bits_uop_iw_p2_poisoned(ll_wbarb_io_in_1_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_in_1_bits_fflags_bits_uop_is_br(ll_wbarb_io_in_1_bits_fflags_bits_uop_is_br),
    .io_in_1_bits_fflags_bits_uop_is_jalr(ll_wbarb_io_in_1_bits_fflags_bits_uop_is_jalr),
    .io_in_1_bits_fflags_bits_uop_is_jal(ll_wbarb_io_in_1_bits_fflags_bits_uop_is_jal),
    .io_in_1_bits_fflags_bits_uop_is_sfb(ll_wbarb_io_in_1_bits_fflags_bits_uop_is_sfb),
    .io_in_1_bits_fflags_bits_uop_br_mask(ll_wbarb_io_in_1_bits_fflags_bits_uop_br_mask),
    .io_in_1_bits_fflags_bits_uop_br_tag(ll_wbarb_io_in_1_bits_fflags_bits_uop_br_tag),
    .io_in_1_bits_fflags_bits_uop_ftq_idx(ll_wbarb_io_in_1_bits_fflags_bits_uop_ftq_idx),
    .io_in_1_bits_fflags_bits_uop_edge_inst(ll_wbarb_io_in_1_bits_fflags_bits_uop_edge_inst),
    .io_in_1_bits_fflags_bits_uop_pc_lob(ll_wbarb_io_in_1_bits_fflags_bits_uop_pc_lob),
    .io_in_1_bits_fflags_bits_uop_taken(ll_wbarb_io_in_1_bits_fflags_bits_uop_taken),
    .io_in_1_bits_fflags_bits_uop_imm_packed(ll_wbarb_io_in_1_bits_fflags_bits_uop_imm_packed),
    .io_in_1_bits_fflags_bits_uop_csr_addr(ll_wbarb_io_in_1_bits_fflags_bits_uop_csr_addr),
    .io_in_1_bits_fflags_bits_uop_rob_idx(ll_wbarb_io_in_1_bits_fflags_bits_uop_rob_idx),
    .io_in_1_bits_fflags_bits_uop_ldq_idx(ll_wbarb_io_in_1_bits_fflags_bits_uop_ldq_idx),
    .io_in_1_bits_fflags_bits_uop_stq_idx(ll_wbarb_io_in_1_bits_fflags_bits_uop_stq_idx),
    .io_in_1_bits_fflags_bits_uop_rxq_idx(ll_wbarb_io_in_1_bits_fflags_bits_uop_rxq_idx),
    .io_in_1_bits_fflags_bits_uop_pdst(ll_wbarb_io_in_1_bits_fflags_bits_uop_pdst),
    .io_in_1_bits_fflags_bits_uop_prs1(ll_wbarb_io_in_1_bits_fflags_bits_uop_prs1),
    .io_in_1_bits_fflags_bits_uop_prs2(ll_wbarb_io_in_1_bits_fflags_bits_uop_prs2),
    .io_in_1_bits_fflags_bits_uop_prs3(ll_wbarb_io_in_1_bits_fflags_bits_uop_prs3),
    .io_in_1_bits_fflags_bits_uop_ppred(ll_wbarb_io_in_1_bits_fflags_bits_uop_ppred),
    .io_in_1_bits_fflags_bits_uop_prs1_busy(ll_wbarb_io_in_1_bits_fflags_bits_uop_prs1_busy),
    .io_in_1_bits_fflags_bits_uop_prs2_busy(ll_wbarb_io_in_1_bits_fflags_bits_uop_prs2_busy),
    .io_in_1_bits_fflags_bits_uop_prs3_busy(ll_wbarb_io_in_1_bits_fflags_bits_uop_prs3_busy),
    .io_in_1_bits_fflags_bits_uop_ppred_busy(ll_wbarb_io_in_1_bits_fflags_bits_uop_ppred_busy),
    .io_in_1_bits_fflags_bits_uop_stale_pdst(ll_wbarb_io_in_1_bits_fflags_bits_uop_stale_pdst),
    .io_in_1_bits_fflags_bits_uop_exception(ll_wbarb_io_in_1_bits_fflags_bits_uop_exception),
    .io_in_1_bits_fflags_bits_uop_exc_cause(ll_wbarb_io_in_1_bits_fflags_bits_uop_exc_cause),
    .io_in_1_bits_fflags_bits_uop_bypassable(ll_wbarb_io_in_1_bits_fflags_bits_uop_bypassable),
    .io_in_1_bits_fflags_bits_uop_mem_cmd(ll_wbarb_io_in_1_bits_fflags_bits_uop_mem_cmd),
    .io_in_1_bits_fflags_bits_uop_mem_size(ll_wbarb_io_in_1_bits_fflags_bits_uop_mem_size),
    .io_in_1_bits_fflags_bits_uop_mem_signed(ll_wbarb_io_in_1_bits_fflags_bits_uop_mem_signed),
    .io_in_1_bits_fflags_bits_uop_is_fence(ll_wbarb_io_in_1_bits_fflags_bits_uop_is_fence),
    .io_in_1_bits_fflags_bits_uop_is_fencei(ll_wbarb_io_in_1_bits_fflags_bits_uop_is_fencei),
    .io_in_1_bits_fflags_bits_uop_is_amo(ll_wbarb_io_in_1_bits_fflags_bits_uop_is_amo),
    .io_in_1_bits_fflags_bits_uop_uses_ldq(ll_wbarb_io_in_1_bits_fflags_bits_uop_uses_ldq),
    .io_in_1_bits_fflags_bits_uop_uses_stq(ll_wbarb_io_in_1_bits_fflags_bits_uop_uses_stq),
    .io_in_1_bits_fflags_bits_uop_is_sys_pc2epc(ll_wbarb_io_in_1_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_in_1_bits_fflags_bits_uop_is_unique(ll_wbarb_io_in_1_bits_fflags_bits_uop_is_unique),
    .io_in_1_bits_fflags_bits_uop_flush_on_commit(ll_wbarb_io_in_1_bits_fflags_bits_uop_flush_on_commit),
    .io_in_1_bits_fflags_bits_uop_ldst_is_rs1(ll_wbarb_io_in_1_bits_fflags_bits_uop_ldst_is_rs1),
    .io_in_1_bits_fflags_bits_uop_ldst(ll_wbarb_io_in_1_bits_fflags_bits_uop_ldst),
    .io_in_1_bits_fflags_bits_uop_lrs1(ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs1),
    .io_in_1_bits_fflags_bits_uop_lrs2(ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs2),
    .io_in_1_bits_fflags_bits_uop_lrs3(ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs3),
    .io_in_1_bits_fflags_bits_uop_ldst_val(ll_wbarb_io_in_1_bits_fflags_bits_uop_ldst_val),
    .io_in_1_bits_fflags_bits_uop_dst_rtype(ll_wbarb_io_in_1_bits_fflags_bits_uop_dst_rtype),
    .io_in_1_bits_fflags_bits_uop_lrs1_rtype(ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs1_rtype),
    .io_in_1_bits_fflags_bits_uop_lrs2_rtype(ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs2_rtype),
    .io_in_1_bits_fflags_bits_uop_frs3_en(ll_wbarb_io_in_1_bits_fflags_bits_uop_frs3_en),
    .io_in_1_bits_fflags_bits_uop_fp_val(ll_wbarb_io_in_1_bits_fflags_bits_uop_fp_val),
    .io_in_1_bits_fflags_bits_uop_fp_single(ll_wbarb_io_in_1_bits_fflags_bits_uop_fp_single),
    .io_in_1_bits_fflags_bits_uop_xcpt_pf_if(ll_wbarb_io_in_1_bits_fflags_bits_uop_xcpt_pf_if),
    .io_in_1_bits_fflags_bits_uop_xcpt_ae_if(ll_wbarb_io_in_1_bits_fflags_bits_uop_xcpt_ae_if),
    .io_in_1_bits_fflags_bits_uop_xcpt_ma_if(ll_wbarb_io_in_1_bits_fflags_bits_uop_xcpt_ma_if),
    .io_in_1_bits_fflags_bits_uop_bp_debug_if(ll_wbarb_io_in_1_bits_fflags_bits_uop_bp_debug_if),
    .io_in_1_bits_fflags_bits_uop_bp_xcpt_if(ll_wbarb_io_in_1_bits_fflags_bits_uop_bp_xcpt_if),
    .io_in_1_bits_fflags_bits_uop_debug_fsrc(ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_fsrc),
    .io_in_1_bits_fflags_bits_uop_debug_tsrc(ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_tsrc),
    .io_in_1_bits_fflags_bits_flags(ll_wbarb_io_in_1_bits_fflags_bits_flags),
    .io_out_ready(ll_wbarb_io_out_ready),
    .io_out_valid(ll_wbarb_io_out_valid),
    .io_out_bits_uop_uopc(ll_wbarb_io_out_bits_uop_uopc),
    .io_out_bits_uop_inst(ll_wbarb_io_out_bits_uop_inst),
    .io_out_bits_uop_debug_inst(ll_wbarb_io_out_bits_uop_debug_inst),
    .io_out_bits_uop_is_rvc(ll_wbarb_io_out_bits_uop_is_rvc),
    .io_out_bits_uop_debug_pc(ll_wbarb_io_out_bits_uop_debug_pc),
    .io_out_bits_uop_iq_type(ll_wbarb_io_out_bits_uop_iq_type),
    .io_out_bits_uop_fu_code(ll_wbarb_io_out_bits_uop_fu_code),
    .io_out_bits_uop_ctrl_br_type(ll_wbarb_io_out_bits_uop_ctrl_br_type),
    .io_out_bits_uop_ctrl_op1_sel(ll_wbarb_io_out_bits_uop_ctrl_op1_sel),
    .io_out_bits_uop_ctrl_op2_sel(ll_wbarb_io_out_bits_uop_ctrl_op2_sel),
    .io_out_bits_uop_ctrl_imm_sel(ll_wbarb_io_out_bits_uop_ctrl_imm_sel),
    .io_out_bits_uop_ctrl_op_fcn(ll_wbarb_io_out_bits_uop_ctrl_op_fcn),
    .io_out_bits_uop_ctrl_fcn_dw(ll_wbarb_io_out_bits_uop_ctrl_fcn_dw),
    .io_out_bits_uop_ctrl_csr_cmd(ll_wbarb_io_out_bits_uop_ctrl_csr_cmd),
    .io_out_bits_uop_ctrl_is_load(ll_wbarb_io_out_bits_uop_ctrl_is_load),
    .io_out_bits_uop_ctrl_is_sta(ll_wbarb_io_out_bits_uop_ctrl_is_sta),
    .io_out_bits_uop_ctrl_is_std(ll_wbarb_io_out_bits_uop_ctrl_is_std),
    .io_out_bits_uop_iw_state(ll_wbarb_io_out_bits_uop_iw_state),
    .io_out_bits_uop_iw_p1_poisoned(ll_wbarb_io_out_bits_uop_iw_p1_poisoned),
    .io_out_bits_uop_iw_p2_poisoned(ll_wbarb_io_out_bits_uop_iw_p2_poisoned),
    .io_out_bits_uop_is_br(ll_wbarb_io_out_bits_uop_is_br),
    .io_out_bits_uop_is_jalr(ll_wbarb_io_out_bits_uop_is_jalr),
    .io_out_bits_uop_is_jal(ll_wbarb_io_out_bits_uop_is_jal),
    .io_out_bits_uop_is_sfb(ll_wbarb_io_out_bits_uop_is_sfb),
    .io_out_bits_uop_br_mask(ll_wbarb_io_out_bits_uop_br_mask),
    .io_out_bits_uop_br_tag(ll_wbarb_io_out_bits_uop_br_tag),
    .io_out_bits_uop_ftq_idx(ll_wbarb_io_out_bits_uop_ftq_idx),
    .io_out_bits_uop_edge_inst(ll_wbarb_io_out_bits_uop_edge_inst),
    .io_out_bits_uop_pc_lob(ll_wbarb_io_out_bits_uop_pc_lob),
    .io_out_bits_uop_taken(ll_wbarb_io_out_bits_uop_taken),
    .io_out_bits_uop_imm_packed(ll_wbarb_io_out_bits_uop_imm_packed),
    .io_out_bits_uop_csr_addr(ll_wbarb_io_out_bits_uop_csr_addr),
    .io_out_bits_uop_rob_idx(ll_wbarb_io_out_bits_uop_rob_idx),
    .io_out_bits_uop_ldq_idx(ll_wbarb_io_out_bits_uop_ldq_idx),
    .io_out_bits_uop_stq_idx(ll_wbarb_io_out_bits_uop_stq_idx),
    .io_out_bits_uop_rxq_idx(ll_wbarb_io_out_bits_uop_rxq_idx),
    .io_out_bits_uop_pdst(ll_wbarb_io_out_bits_uop_pdst),
    .io_out_bits_uop_prs1(ll_wbarb_io_out_bits_uop_prs1),
    .io_out_bits_uop_prs2(ll_wbarb_io_out_bits_uop_prs2),
    .io_out_bits_uop_prs3(ll_wbarb_io_out_bits_uop_prs3),
    .io_out_bits_uop_ppred(ll_wbarb_io_out_bits_uop_ppred),
    .io_out_bits_uop_prs1_busy(ll_wbarb_io_out_bits_uop_prs1_busy),
    .io_out_bits_uop_prs2_busy(ll_wbarb_io_out_bits_uop_prs2_busy),
    .io_out_bits_uop_prs3_busy(ll_wbarb_io_out_bits_uop_prs3_busy),
    .io_out_bits_uop_ppred_busy(ll_wbarb_io_out_bits_uop_ppred_busy),
    .io_out_bits_uop_stale_pdst(ll_wbarb_io_out_bits_uop_stale_pdst),
    .io_out_bits_uop_exception(ll_wbarb_io_out_bits_uop_exception),
    .io_out_bits_uop_exc_cause(ll_wbarb_io_out_bits_uop_exc_cause),
    .io_out_bits_uop_bypassable(ll_wbarb_io_out_bits_uop_bypassable),
    .io_out_bits_uop_mem_cmd(ll_wbarb_io_out_bits_uop_mem_cmd),
    .io_out_bits_uop_mem_size(ll_wbarb_io_out_bits_uop_mem_size),
    .io_out_bits_uop_mem_signed(ll_wbarb_io_out_bits_uop_mem_signed),
    .io_out_bits_uop_is_fence(ll_wbarb_io_out_bits_uop_is_fence),
    .io_out_bits_uop_is_fencei(ll_wbarb_io_out_bits_uop_is_fencei),
    .io_out_bits_uop_is_amo(ll_wbarb_io_out_bits_uop_is_amo),
    .io_out_bits_uop_uses_ldq(ll_wbarb_io_out_bits_uop_uses_ldq),
    .io_out_bits_uop_uses_stq(ll_wbarb_io_out_bits_uop_uses_stq),
    .io_out_bits_uop_is_sys_pc2epc(ll_wbarb_io_out_bits_uop_is_sys_pc2epc),
    .io_out_bits_uop_is_unique(ll_wbarb_io_out_bits_uop_is_unique),
    .io_out_bits_uop_flush_on_commit(ll_wbarb_io_out_bits_uop_flush_on_commit),
    .io_out_bits_uop_ldst_is_rs1(ll_wbarb_io_out_bits_uop_ldst_is_rs1),
    .io_out_bits_uop_ldst(ll_wbarb_io_out_bits_uop_ldst),
    .io_out_bits_uop_lrs1(ll_wbarb_io_out_bits_uop_lrs1),
    .io_out_bits_uop_lrs2(ll_wbarb_io_out_bits_uop_lrs2),
    .io_out_bits_uop_lrs3(ll_wbarb_io_out_bits_uop_lrs3),
    .io_out_bits_uop_ldst_val(ll_wbarb_io_out_bits_uop_ldst_val),
    .io_out_bits_uop_dst_rtype(ll_wbarb_io_out_bits_uop_dst_rtype),
    .io_out_bits_uop_lrs1_rtype(ll_wbarb_io_out_bits_uop_lrs1_rtype),
    .io_out_bits_uop_lrs2_rtype(ll_wbarb_io_out_bits_uop_lrs2_rtype),
    .io_out_bits_uop_frs3_en(ll_wbarb_io_out_bits_uop_frs3_en),
    .io_out_bits_uop_fp_val(ll_wbarb_io_out_bits_uop_fp_val),
    .io_out_bits_uop_fp_single(ll_wbarb_io_out_bits_uop_fp_single),
    .io_out_bits_uop_xcpt_pf_if(ll_wbarb_io_out_bits_uop_xcpt_pf_if),
    .io_out_bits_uop_xcpt_ae_if(ll_wbarb_io_out_bits_uop_xcpt_ae_if),
    .io_out_bits_uop_xcpt_ma_if(ll_wbarb_io_out_bits_uop_xcpt_ma_if),
    .io_out_bits_uop_bp_debug_if(ll_wbarb_io_out_bits_uop_bp_debug_if),
    .io_out_bits_uop_bp_xcpt_if(ll_wbarb_io_out_bits_uop_bp_xcpt_if),
    .io_out_bits_uop_debug_fsrc(ll_wbarb_io_out_bits_uop_debug_fsrc),
    .io_out_bits_uop_debug_tsrc(ll_wbarb_io_out_bits_uop_debug_tsrc),
    .io_out_bits_data(ll_wbarb_io_out_bits_data),
    .io_out_bits_predicated(ll_wbarb_io_out_bits_predicated),
    .io_out_bits_fflags_valid(ll_wbarb_io_out_bits_fflags_valid),
    .io_out_bits_fflags_bits_uop_uopc(ll_wbarb_io_out_bits_fflags_bits_uop_uopc),
    .io_out_bits_fflags_bits_uop_inst(ll_wbarb_io_out_bits_fflags_bits_uop_inst),
    .io_out_bits_fflags_bits_uop_debug_inst(ll_wbarb_io_out_bits_fflags_bits_uop_debug_inst),
    .io_out_bits_fflags_bits_uop_is_rvc(ll_wbarb_io_out_bits_fflags_bits_uop_is_rvc),
    .io_out_bits_fflags_bits_uop_debug_pc(ll_wbarb_io_out_bits_fflags_bits_uop_debug_pc),
    .io_out_bits_fflags_bits_uop_iq_type(ll_wbarb_io_out_bits_fflags_bits_uop_iq_type),
    .io_out_bits_fflags_bits_uop_fu_code(ll_wbarb_io_out_bits_fflags_bits_uop_fu_code),
    .io_out_bits_fflags_bits_uop_ctrl_br_type(ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_br_type),
    .io_out_bits_fflags_bits_uop_ctrl_op1_sel(ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_out_bits_fflags_bits_uop_ctrl_op2_sel(ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_out_bits_fflags_bits_uop_ctrl_imm_sel(ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_out_bits_fflags_bits_uop_ctrl_op_fcn(ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_out_bits_fflags_bits_uop_ctrl_fcn_dw(ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_out_bits_fflags_bits_uop_ctrl_csr_cmd(ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_out_bits_fflags_bits_uop_ctrl_is_load(ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_is_load),
    .io_out_bits_fflags_bits_uop_ctrl_is_sta(ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_is_sta),
    .io_out_bits_fflags_bits_uop_ctrl_is_std(ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_is_std),
    .io_out_bits_fflags_bits_uop_iw_state(ll_wbarb_io_out_bits_fflags_bits_uop_iw_state),
    .io_out_bits_fflags_bits_uop_iw_p1_poisoned(ll_wbarb_io_out_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_out_bits_fflags_bits_uop_iw_p2_poisoned(ll_wbarb_io_out_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_out_bits_fflags_bits_uop_is_br(ll_wbarb_io_out_bits_fflags_bits_uop_is_br),
    .io_out_bits_fflags_bits_uop_is_jalr(ll_wbarb_io_out_bits_fflags_bits_uop_is_jalr),
    .io_out_bits_fflags_bits_uop_is_jal(ll_wbarb_io_out_bits_fflags_bits_uop_is_jal),
    .io_out_bits_fflags_bits_uop_is_sfb(ll_wbarb_io_out_bits_fflags_bits_uop_is_sfb),
    .io_out_bits_fflags_bits_uop_br_mask(ll_wbarb_io_out_bits_fflags_bits_uop_br_mask),
    .io_out_bits_fflags_bits_uop_br_tag(ll_wbarb_io_out_bits_fflags_bits_uop_br_tag),
    .io_out_bits_fflags_bits_uop_ftq_idx(ll_wbarb_io_out_bits_fflags_bits_uop_ftq_idx),
    .io_out_bits_fflags_bits_uop_edge_inst(ll_wbarb_io_out_bits_fflags_bits_uop_edge_inst),
    .io_out_bits_fflags_bits_uop_pc_lob(ll_wbarb_io_out_bits_fflags_bits_uop_pc_lob),
    .io_out_bits_fflags_bits_uop_taken(ll_wbarb_io_out_bits_fflags_bits_uop_taken),
    .io_out_bits_fflags_bits_uop_imm_packed(ll_wbarb_io_out_bits_fflags_bits_uop_imm_packed),
    .io_out_bits_fflags_bits_uop_csr_addr(ll_wbarb_io_out_bits_fflags_bits_uop_csr_addr),
    .io_out_bits_fflags_bits_uop_rob_idx(ll_wbarb_io_out_bits_fflags_bits_uop_rob_idx),
    .io_out_bits_fflags_bits_uop_ldq_idx(ll_wbarb_io_out_bits_fflags_bits_uop_ldq_idx),
    .io_out_bits_fflags_bits_uop_stq_idx(ll_wbarb_io_out_bits_fflags_bits_uop_stq_idx),
    .io_out_bits_fflags_bits_uop_rxq_idx(ll_wbarb_io_out_bits_fflags_bits_uop_rxq_idx),
    .io_out_bits_fflags_bits_uop_pdst(ll_wbarb_io_out_bits_fflags_bits_uop_pdst),
    .io_out_bits_fflags_bits_uop_prs1(ll_wbarb_io_out_bits_fflags_bits_uop_prs1),
    .io_out_bits_fflags_bits_uop_prs2(ll_wbarb_io_out_bits_fflags_bits_uop_prs2),
    .io_out_bits_fflags_bits_uop_prs3(ll_wbarb_io_out_bits_fflags_bits_uop_prs3),
    .io_out_bits_fflags_bits_uop_ppred(ll_wbarb_io_out_bits_fflags_bits_uop_ppred),
    .io_out_bits_fflags_bits_uop_prs1_busy(ll_wbarb_io_out_bits_fflags_bits_uop_prs1_busy),
    .io_out_bits_fflags_bits_uop_prs2_busy(ll_wbarb_io_out_bits_fflags_bits_uop_prs2_busy),
    .io_out_bits_fflags_bits_uop_prs3_busy(ll_wbarb_io_out_bits_fflags_bits_uop_prs3_busy),
    .io_out_bits_fflags_bits_uop_ppred_busy(ll_wbarb_io_out_bits_fflags_bits_uop_ppred_busy),
    .io_out_bits_fflags_bits_uop_stale_pdst(ll_wbarb_io_out_bits_fflags_bits_uop_stale_pdst),
    .io_out_bits_fflags_bits_uop_exception(ll_wbarb_io_out_bits_fflags_bits_uop_exception),
    .io_out_bits_fflags_bits_uop_exc_cause(ll_wbarb_io_out_bits_fflags_bits_uop_exc_cause),
    .io_out_bits_fflags_bits_uop_bypassable(ll_wbarb_io_out_bits_fflags_bits_uop_bypassable),
    .io_out_bits_fflags_bits_uop_mem_cmd(ll_wbarb_io_out_bits_fflags_bits_uop_mem_cmd),
    .io_out_bits_fflags_bits_uop_mem_size(ll_wbarb_io_out_bits_fflags_bits_uop_mem_size),
    .io_out_bits_fflags_bits_uop_mem_signed(ll_wbarb_io_out_bits_fflags_bits_uop_mem_signed),
    .io_out_bits_fflags_bits_uop_is_fence(ll_wbarb_io_out_bits_fflags_bits_uop_is_fence),
    .io_out_bits_fflags_bits_uop_is_fencei(ll_wbarb_io_out_bits_fflags_bits_uop_is_fencei),
    .io_out_bits_fflags_bits_uop_is_amo(ll_wbarb_io_out_bits_fflags_bits_uop_is_amo),
    .io_out_bits_fflags_bits_uop_uses_ldq(ll_wbarb_io_out_bits_fflags_bits_uop_uses_ldq),
    .io_out_bits_fflags_bits_uop_uses_stq(ll_wbarb_io_out_bits_fflags_bits_uop_uses_stq),
    .io_out_bits_fflags_bits_uop_is_sys_pc2epc(ll_wbarb_io_out_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_out_bits_fflags_bits_uop_is_unique(ll_wbarb_io_out_bits_fflags_bits_uop_is_unique),
    .io_out_bits_fflags_bits_uop_flush_on_commit(ll_wbarb_io_out_bits_fflags_bits_uop_flush_on_commit),
    .io_out_bits_fflags_bits_uop_ldst_is_rs1(ll_wbarb_io_out_bits_fflags_bits_uop_ldst_is_rs1),
    .io_out_bits_fflags_bits_uop_ldst(ll_wbarb_io_out_bits_fflags_bits_uop_ldst),
    .io_out_bits_fflags_bits_uop_lrs1(ll_wbarb_io_out_bits_fflags_bits_uop_lrs1),
    .io_out_bits_fflags_bits_uop_lrs2(ll_wbarb_io_out_bits_fflags_bits_uop_lrs2),
    .io_out_bits_fflags_bits_uop_lrs3(ll_wbarb_io_out_bits_fflags_bits_uop_lrs3),
    .io_out_bits_fflags_bits_uop_ldst_val(ll_wbarb_io_out_bits_fflags_bits_uop_ldst_val),
    .io_out_bits_fflags_bits_uop_dst_rtype(ll_wbarb_io_out_bits_fflags_bits_uop_dst_rtype),
    .io_out_bits_fflags_bits_uop_lrs1_rtype(ll_wbarb_io_out_bits_fflags_bits_uop_lrs1_rtype),
    .io_out_bits_fflags_bits_uop_lrs2_rtype(ll_wbarb_io_out_bits_fflags_bits_uop_lrs2_rtype),
    .io_out_bits_fflags_bits_uop_frs3_en(ll_wbarb_io_out_bits_fflags_bits_uop_frs3_en),
    .io_out_bits_fflags_bits_uop_fp_val(ll_wbarb_io_out_bits_fflags_bits_uop_fp_val),
    .io_out_bits_fflags_bits_uop_fp_single(ll_wbarb_io_out_bits_fflags_bits_uop_fp_single),
    .io_out_bits_fflags_bits_uop_xcpt_pf_if(ll_wbarb_io_out_bits_fflags_bits_uop_xcpt_pf_if),
    .io_out_bits_fflags_bits_uop_xcpt_ae_if(ll_wbarb_io_out_bits_fflags_bits_uop_xcpt_ae_if),
    .io_out_bits_fflags_bits_uop_xcpt_ma_if(ll_wbarb_io_out_bits_fflags_bits_uop_xcpt_ma_if),
    .io_out_bits_fflags_bits_uop_bp_debug_if(ll_wbarb_io_out_bits_fflags_bits_uop_bp_debug_if),
    .io_out_bits_fflags_bits_uop_bp_xcpt_if(ll_wbarb_io_out_bits_fflags_bits_uop_bp_xcpt_if),
    .io_out_bits_fflags_bits_uop_debug_fsrc(ll_wbarb_io_out_bits_fflags_bits_uop_debug_fsrc),
    .io_out_bits_fflags_bits_uop_debug_tsrc(ll_wbarb_io_out_bits_fflags_bits_uop_debug_tsrc),
    .io_out_bits_fflags_bits_flags(ll_wbarb_io_out_bits_fflags_bits_flags),
    .io_chosen(ll_wbarb_io_chosen)
  );
  assign io_dis_uops_0_ready = fp_issue_unit_io_dis_uops_0_ready; // @[fp-pipeline.scala 109:31]
  assign io_dis_uops_1_ready = fp_issue_unit_io_dis_uops_1_ready; // @[fp-pipeline.scala 109:31]
  assign io_ll_wports_0_ready = ll_wbarb_io_in_0_ready; // @[fp-pipeline.scala 174:21]
  assign io_from_int_ready = ll_wbarb_io_in_1_ready; // @[fp-pipeline.scala 179:21]
  assign io_to_sdq_valid = _T_45 & fpiu_is_sdq; // @[fp-pipeline.scala 216:51]
  assign io_to_sdq_bits_uop_uopc = fpiu_unit_io_ll_iresp_bits_uop_uopc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_inst = fpiu_unit_io_ll_iresp_bits_uop_inst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_debug_inst = fpiu_unit_io_ll_iresp_bits_uop_debug_inst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_is_rvc = fpiu_unit_io_ll_iresp_bits_uop_is_rvc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_debug_pc = fpiu_unit_io_ll_iresp_bits_uop_debug_pc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_iq_type = fpiu_unit_io_ll_iresp_bits_uop_iq_type; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_fu_code = fpiu_unit_io_ll_iresp_bits_uop_fu_code; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ctrl_br_type = fpiu_unit_io_ll_iresp_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ctrl_op1_sel = fpiu_unit_io_ll_iresp_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ctrl_op2_sel = fpiu_unit_io_ll_iresp_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ctrl_imm_sel = fpiu_unit_io_ll_iresp_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ctrl_op_fcn = fpiu_unit_io_ll_iresp_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ctrl_fcn_dw = fpiu_unit_io_ll_iresp_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ctrl_csr_cmd = fpiu_unit_io_ll_iresp_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ctrl_is_load = fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ctrl_is_sta = fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ctrl_is_std = fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_iw_state = fpiu_unit_io_ll_iresp_bits_uop_iw_state; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_iw_p1_poisoned = fpiu_unit_io_ll_iresp_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_iw_p2_poisoned = fpiu_unit_io_ll_iresp_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_is_br = fpiu_unit_io_ll_iresp_bits_uop_is_br; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_is_jalr = fpiu_unit_io_ll_iresp_bits_uop_is_jalr; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_is_jal = fpiu_unit_io_ll_iresp_bits_uop_is_jal; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_is_sfb = fpiu_unit_io_ll_iresp_bits_uop_is_sfb; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_br_mask = fpiu_unit_io_ll_iresp_bits_uop_br_mask; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_br_tag = fpiu_unit_io_ll_iresp_bits_uop_br_tag; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ftq_idx = fpiu_unit_io_ll_iresp_bits_uop_ftq_idx; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_edge_inst = fpiu_unit_io_ll_iresp_bits_uop_edge_inst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_pc_lob = fpiu_unit_io_ll_iresp_bits_uop_pc_lob; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_taken = fpiu_unit_io_ll_iresp_bits_uop_taken; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_imm_packed = fpiu_unit_io_ll_iresp_bits_uop_imm_packed; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_csr_addr = fpiu_unit_io_ll_iresp_bits_uop_csr_addr; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_rob_idx = fpiu_unit_io_ll_iresp_bits_uop_rob_idx; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ldq_idx = fpiu_unit_io_ll_iresp_bits_uop_ldq_idx; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_stq_idx = fpiu_unit_io_ll_iresp_bits_uop_stq_idx; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_rxq_idx = fpiu_unit_io_ll_iresp_bits_uop_rxq_idx; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_pdst = fpiu_unit_io_ll_iresp_bits_uop_pdst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_prs1 = fpiu_unit_io_ll_iresp_bits_uop_prs1; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_prs2 = fpiu_unit_io_ll_iresp_bits_uop_prs2; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_prs3 = fpiu_unit_io_ll_iresp_bits_uop_prs3; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ppred = fpiu_unit_io_ll_iresp_bits_uop_ppred; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_prs1_busy = fpiu_unit_io_ll_iresp_bits_uop_prs1_busy; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_prs2_busy = fpiu_unit_io_ll_iresp_bits_uop_prs2_busy; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_prs3_busy = fpiu_unit_io_ll_iresp_bits_uop_prs3_busy; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ppred_busy = fpiu_unit_io_ll_iresp_bits_uop_ppred_busy; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_stale_pdst = fpiu_unit_io_ll_iresp_bits_uop_stale_pdst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_exception = fpiu_unit_io_ll_iresp_bits_uop_exception; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_exc_cause = fpiu_unit_io_ll_iresp_bits_uop_exc_cause; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_bypassable = fpiu_unit_io_ll_iresp_bits_uop_bypassable; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_mem_cmd = fpiu_unit_io_ll_iresp_bits_uop_mem_cmd; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_mem_size = fpiu_unit_io_ll_iresp_bits_uop_mem_size; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_mem_signed = fpiu_unit_io_ll_iresp_bits_uop_mem_signed; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_is_fence = fpiu_unit_io_ll_iresp_bits_uop_is_fence; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_is_fencei = fpiu_unit_io_ll_iresp_bits_uop_is_fencei; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_is_amo = fpiu_unit_io_ll_iresp_bits_uop_is_amo; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_uses_ldq = fpiu_unit_io_ll_iresp_bits_uop_uses_ldq; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_uses_stq = fpiu_unit_io_ll_iresp_bits_uop_uses_stq; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_is_sys_pc2epc = fpiu_unit_io_ll_iresp_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_is_unique = fpiu_unit_io_ll_iresp_bits_uop_is_unique; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_flush_on_commit = fpiu_unit_io_ll_iresp_bits_uop_flush_on_commit; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ldst_is_rs1 = fpiu_unit_io_ll_iresp_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ldst = fpiu_unit_io_ll_iresp_bits_uop_ldst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_lrs1 = fpiu_unit_io_ll_iresp_bits_uop_lrs1; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_lrs2 = fpiu_unit_io_ll_iresp_bits_uop_lrs2; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_lrs3 = fpiu_unit_io_ll_iresp_bits_uop_lrs3; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_ldst_val = fpiu_unit_io_ll_iresp_bits_uop_ldst_val; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_dst_rtype = fpiu_unit_io_ll_iresp_bits_uop_dst_rtype; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_lrs1_rtype = fpiu_unit_io_ll_iresp_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_lrs2_rtype = fpiu_unit_io_ll_iresp_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_frs3_en = fpiu_unit_io_ll_iresp_bits_uop_frs3_en; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_fp_val = fpiu_unit_io_ll_iresp_bits_uop_fp_val; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_fp_single = fpiu_unit_io_ll_iresp_bits_uop_fp_single; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_xcpt_pf_if = fpiu_unit_io_ll_iresp_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_xcpt_ae_if = fpiu_unit_io_ll_iresp_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_xcpt_ma_if = fpiu_unit_io_ll_iresp_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_bp_debug_if = fpiu_unit_io_ll_iresp_bits_uop_bp_debug_if; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_bp_xcpt_if = fpiu_unit_io_ll_iresp_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_debug_fsrc = fpiu_unit_io_ll_iresp_bits_uop_debug_fsrc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_uop_debug_tsrc = fpiu_unit_io_ll_iresp_bits_uop_debug_tsrc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_data = fpiu_unit_io_ll_iresp_bits_data[63:0]; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_predicated = fpiu_unit_io_ll_iresp_bits_predicated; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_valid = fpiu_unit_io_ll_iresp_bits_fflags_valid; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_uopc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uopc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_inst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_inst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_debug_inst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_inst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_is_rvc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_rvc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_debug_pc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_pc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_iq_type = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iq_type; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_fu_code = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fu_code; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ctrl_br_type = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ctrl_op1_sel = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ctrl_op2_sel = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ctrl_imm_sel = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ctrl_op_fcn = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ctrl_fcn_dw = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ctrl_csr_cmd = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ctrl_is_load = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ctrl_is_sta = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ctrl_is_std = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_iw_state = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_state; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_iw_p1_poisoned = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_iw_p2_poisoned = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_is_br = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_br; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_is_jalr = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_jalr; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_is_jal = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_jal; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_is_sfb = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_sfb; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_br_mask = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_br_mask; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_br_tag = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_br_tag; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ftq_idx = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ftq_idx; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_edge_inst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_edge_inst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_pc_lob = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_pc_lob; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_taken = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_taken; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_imm_packed = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_imm_packed; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_csr_addr = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_csr_addr; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_rob_idx = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_rob_idx; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ldq_idx = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldq_idx; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_stq_idx = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_stq_idx; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_rxq_idx = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_rxq_idx; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_pdst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_pdst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_prs1 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs1; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_prs2 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs2; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_prs3 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs3; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ppred = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ppred; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_prs1_busy = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs1_busy; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_prs2_busy = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs2_busy; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_prs3_busy = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs3_busy; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ppred_busy = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ppred_busy; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_stale_pdst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_stale_pdst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_exception = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_exception; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_exc_cause = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_exc_cause; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_bypassable = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bypassable; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_mem_cmd = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_cmd; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_mem_size = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_size; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_mem_signed = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_signed; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_is_fence = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_fence; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_is_fencei = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_fencei; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_is_amo = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_amo; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_uses_ldq = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uses_ldq; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_uses_stq = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uses_stq; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_is_sys_pc2epc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_is_unique = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_unique; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_flush_on_commit = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_flush_on_commit; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ldst_is_rs1 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ldst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_lrs1 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs1; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_lrs2 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs2; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_lrs3 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs3; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_ldst_val = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst_val; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_dst_rtype = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_dst_rtype; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_lrs1_rtype = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_lrs2_rtype = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_frs3_en = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_frs3_en; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_fp_val = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fp_val; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_fp_single = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fp_single; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_xcpt_pf_if = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_xcpt_ae_if = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_xcpt_ma_if = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_bp_debug_if = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bp_debug_if; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_bp_xcpt_if = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_debug_fsrc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_fsrc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_uop_debug_tsrc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_tsrc; // @[fp-pipeline.scala 218:19]
  assign io_to_sdq_bits_fflags_bits_flags = fpiu_unit_io_ll_iresp_bits_fflags_bits_flags; // @[fp-pipeline.scala 218:19]
  assign io_to_int_valid = _T_45 & ~fpiu_is_sdq; // @[fp-pipeline.scala 215:51]
  assign io_to_int_bits_uop_uopc = fpiu_unit_io_ll_iresp_bits_uop_uopc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_inst = fpiu_unit_io_ll_iresp_bits_uop_inst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_debug_inst = fpiu_unit_io_ll_iresp_bits_uop_debug_inst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_is_rvc = fpiu_unit_io_ll_iresp_bits_uop_is_rvc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_debug_pc = fpiu_unit_io_ll_iresp_bits_uop_debug_pc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_iq_type = fpiu_unit_io_ll_iresp_bits_uop_iq_type; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_fu_code = fpiu_unit_io_ll_iresp_bits_uop_fu_code; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ctrl_br_type = fpiu_unit_io_ll_iresp_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ctrl_op1_sel = fpiu_unit_io_ll_iresp_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ctrl_op2_sel = fpiu_unit_io_ll_iresp_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ctrl_imm_sel = fpiu_unit_io_ll_iresp_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ctrl_op_fcn = fpiu_unit_io_ll_iresp_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ctrl_fcn_dw = fpiu_unit_io_ll_iresp_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ctrl_csr_cmd = fpiu_unit_io_ll_iresp_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ctrl_is_load = fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ctrl_is_sta = fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ctrl_is_std = fpiu_unit_io_ll_iresp_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_iw_state = fpiu_unit_io_ll_iresp_bits_uop_iw_state; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_iw_p1_poisoned = fpiu_unit_io_ll_iresp_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_iw_p2_poisoned = fpiu_unit_io_ll_iresp_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_is_br = fpiu_unit_io_ll_iresp_bits_uop_is_br; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_is_jalr = fpiu_unit_io_ll_iresp_bits_uop_is_jalr; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_is_jal = fpiu_unit_io_ll_iresp_bits_uop_is_jal; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_is_sfb = fpiu_unit_io_ll_iresp_bits_uop_is_sfb; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_br_mask = fpiu_unit_io_ll_iresp_bits_uop_br_mask; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_br_tag = fpiu_unit_io_ll_iresp_bits_uop_br_tag; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ftq_idx = fpiu_unit_io_ll_iresp_bits_uop_ftq_idx; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_edge_inst = fpiu_unit_io_ll_iresp_bits_uop_edge_inst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_pc_lob = fpiu_unit_io_ll_iresp_bits_uop_pc_lob; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_taken = fpiu_unit_io_ll_iresp_bits_uop_taken; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_imm_packed = fpiu_unit_io_ll_iresp_bits_uop_imm_packed; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_csr_addr = fpiu_unit_io_ll_iresp_bits_uop_csr_addr; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_rob_idx = fpiu_unit_io_ll_iresp_bits_uop_rob_idx; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ldq_idx = fpiu_unit_io_ll_iresp_bits_uop_ldq_idx; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_stq_idx = fpiu_unit_io_ll_iresp_bits_uop_stq_idx; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_rxq_idx = fpiu_unit_io_ll_iresp_bits_uop_rxq_idx; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_pdst = fpiu_unit_io_ll_iresp_bits_uop_pdst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_prs1 = fpiu_unit_io_ll_iresp_bits_uop_prs1; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_prs2 = fpiu_unit_io_ll_iresp_bits_uop_prs2; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_prs3 = fpiu_unit_io_ll_iresp_bits_uop_prs3; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ppred = fpiu_unit_io_ll_iresp_bits_uop_ppred; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_prs1_busy = fpiu_unit_io_ll_iresp_bits_uop_prs1_busy; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_prs2_busy = fpiu_unit_io_ll_iresp_bits_uop_prs2_busy; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_prs3_busy = fpiu_unit_io_ll_iresp_bits_uop_prs3_busy; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ppred_busy = fpiu_unit_io_ll_iresp_bits_uop_ppred_busy; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_stale_pdst = fpiu_unit_io_ll_iresp_bits_uop_stale_pdst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_exception = fpiu_unit_io_ll_iresp_bits_uop_exception; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_exc_cause = fpiu_unit_io_ll_iresp_bits_uop_exc_cause; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_bypassable = fpiu_unit_io_ll_iresp_bits_uop_bypassable; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_mem_cmd = fpiu_unit_io_ll_iresp_bits_uop_mem_cmd; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_mem_size = fpiu_unit_io_ll_iresp_bits_uop_mem_size; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_mem_signed = fpiu_unit_io_ll_iresp_bits_uop_mem_signed; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_is_fence = fpiu_unit_io_ll_iresp_bits_uop_is_fence; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_is_fencei = fpiu_unit_io_ll_iresp_bits_uop_is_fencei; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_is_amo = fpiu_unit_io_ll_iresp_bits_uop_is_amo; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_uses_ldq = fpiu_unit_io_ll_iresp_bits_uop_uses_ldq; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_uses_stq = fpiu_unit_io_ll_iresp_bits_uop_uses_stq; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_is_sys_pc2epc = fpiu_unit_io_ll_iresp_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_is_unique = fpiu_unit_io_ll_iresp_bits_uop_is_unique; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_flush_on_commit = fpiu_unit_io_ll_iresp_bits_uop_flush_on_commit; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ldst_is_rs1 = fpiu_unit_io_ll_iresp_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ldst = fpiu_unit_io_ll_iresp_bits_uop_ldst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_lrs1 = fpiu_unit_io_ll_iresp_bits_uop_lrs1; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_lrs2 = fpiu_unit_io_ll_iresp_bits_uop_lrs2; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_lrs3 = fpiu_unit_io_ll_iresp_bits_uop_lrs3; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_ldst_val = fpiu_unit_io_ll_iresp_bits_uop_ldst_val; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_dst_rtype = fpiu_unit_io_ll_iresp_bits_uop_dst_rtype; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_lrs1_rtype = fpiu_unit_io_ll_iresp_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_lrs2_rtype = fpiu_unit_io_ll_iresp_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_frs3_en = fpiu_unit_io_ll_iresp_bits_uop_frs3_en; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_fp_val = fpiu_unit_io_ll_iresp_bits_uop_fp_val; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_fp_single = fpiu_unit_io_ll_iresp_bits_uop_fp_single; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_xcpt_pf_if = fpiu_unit_io_ll_iresp_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_xcpt_ae_if = fpiu_unit_io_ll_iresp_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_xcpt_ma_if = fpiu_unit_io_ll_iresp_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_bp_debug_if = fpiu_unit_io_ll_iresp_bits_uop_bp_debug_if; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_bp_xcpt_if = fpiu_unit_io_ll_iresp_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_debug_fsrc = fpiu_unit_io_ll_iresp_bits_uop_debug_fsrc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_uop_debug_tsrc = fpiu_unit_io_ll_iresp_bits_uop_debug_tsrc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_data = fpiu_unit_io_ll_iresp_bits_data[63:0]; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_predicated = fpiu_unit_io_ll_iresp_bits_predicated; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_valid = fpiu_unit_io_ll_iresp_bits_fflags_valid; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_uopc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uopc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_inst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_inst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_debug_inst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_inst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_is_rvc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_rvc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_debug_pc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_pc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_iq_type = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iq_type; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_fu_code = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fu_code; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ctrl_br_type = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ctrl_op1_sel = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ctrl_op2_sel = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ctrl_imm_sel = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ctrl_op_fcn = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ctrl_fcn_dw = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ctrl_csr_cmd = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ctrl_is_load = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ctrl_is_sta = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ctrl_is_std = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_iw_state = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_state; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_iw_p1_poisoned = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_iw_p2_poisoned = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_is_br = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_br; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_is_jalr = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_jalr; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_is_jal = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_jal; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_is_sfb = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_sfb; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_br_mask = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_br_mask; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_br_tag = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_br_tag; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ftq_idx = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ftq_idx; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_edge_inst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_edge_inst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_pc_lob = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_pc_lob; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_taken = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_taken; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_imm_packed = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_imm_packed; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_csr_addr = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_csr_addr; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_rob_idx = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_rob_idx; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ldq_idx = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldq_idx; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_stq_idx = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_stq_idx; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_rxq_idx = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_rxq_idx; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_pdst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_pdst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_prs1 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs1; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_prs2 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs2; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_prs3 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs3; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ppred = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ppred; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_prs1_busy = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs1_busy; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_prs2_busy = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs2_busy; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_prs3_busy = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_prs3_busy; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ppred_busy = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ppred_busy; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_stale_pdst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_stale_pdst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_exception = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_exception; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_exc_cause = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_exc_cause; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_bypassable = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bypassable; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_mem_cmd = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_cmd; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_mem_size = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_size; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_mem_signed = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_mem_signed; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_is_fence = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_fence; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_is_fencei = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_fencei; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_is_amo = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_amo; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_uses_ldq = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uses_ldq; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_uses_stq = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_uses_stq; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_is_sys_pc2epc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_is_unique = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_is_unique; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_flush_on_commit = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_flush_on_commit; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ldst_is_rs1 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ldst = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_lrs1 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs1; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_lrs2 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs2; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_lrs3 = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs3; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_ldst_val = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_ldst_val; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_dst_rtype = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_dst_rtype; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_lrs1_rtype = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_lrs2_rtype = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_frs3_en = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_frs3_en; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_fp_val = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fp_val; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_fp_single = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_fp_single; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_xcpt_pf_if = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_xcpt_ae_if = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_xcpt_ma_if = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_bp_debug_if = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bp_debug_if; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_bp_xcpt_if = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_debug_fsrc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_fsrc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_uop_debug_tsrc = fpiu_unit_io_ll_iresp_bits_fflags_bits_uop_debug_tsrc; // @[fp-pipeline.scala 217:19]
  assign io_to_int_bits_fflags_bits_flags = fpiu_unit_io_ll_iresp_bits_fflags_bits_flags; // @[fp-pipeline.scala 217:19]
  assign io_wakeups_0_valid = ll_wbarb_io_out_valid; // @[fp-pipeline.scala 227:23]
  assign io_wakeups_0_bits_uop_uopc = ll_wbarb_io_out_bits_uop_uopc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_inst = ll_wbarb_io_out_bits_uop_inst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_debug_inst = ll_wbarb_io_out_bits_uop_debug_inst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_is_rvc = ll_wbarb_io_out_bits_uop_is_rvc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_debug_pc = ll_wbarb_io_out_bits_uop_debug_pc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_iq_type = ll_wbarb_io_out_bits_uop_iq_type; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_fu_code = ll_wbarb_io_out_bits_uop_fu_code; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ctrl_br_type = ll_wbarb_io_out_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ctrl_op1_sel = ll_wbarb_io_out_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ctrl_op2_sel = ll_wbarb_io_out_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ctrl_imm_sel = ll_wbarb_io_out_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ctrl_op_fcn = ll_wbarb_io_out_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ctrl_fcn_dw = ll_wbarb_io_out_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ctrl_csr_cmd = ll_wbarb_io_out_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ctrl_is_load = ll_wbarb_io_out_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ctrl_is_sta = ll_wbarb_io_out_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ctrl_is_std = ll_wbarb_io_out_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_iw_state = ll_wbarb_io_out_bits_uop_iw_state; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_iw_p1_poisoned = ll_wbarb_io_out_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_iw_p2_poisoned = ll_wbarb_io_out_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_is_br = ll_wbarb_io_out_bits_uop_is_br; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_is_jalr = ll_wbarb_io_out_bits_uop_is_jalr; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_is_jal = ll_wbarb_io_out_bits_uop_is_jal; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_is_sfb = ll_wbarb_io_out_bits_uop_is_sfb; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_br_mask = ll_wbarb_io_out_bits_uop_br_mask; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_br_tag = ll_wbarb_io_out_bits_uop_br_tag; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ftq_idx = ll_wbarb_io_out_bits_uop_ftq_idx; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_edge_inst = ll_wbarb_io_out_bits_uop_edge_inst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_pc_lob = ll_wbarb_io_out_bits_uop_pc_lob; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_taken = ll_wbarb_io_out_bits_uop_taken; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_imm_packed = ll_wbarb_io_out_bits_uop_imm_packed; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_csr_addr = ll_wbarb_io_out_bits_uop_csr_addr; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_rob_idx = ll_wbarb_io_out_bits_uop_rob_idx; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ldq_idx = ll_wbarb_io_out_bits_uop_ldq_idx; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_stq_idx = ll_wbarb_io_out_bits_uop_stq_idx; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_rxq_idx = ll_wbarb_io_out_bits_uop_rxq_idx; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_pdst = ll_wbarb_io_out_bits_uop_pdst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_prs1 = ll_wbarb_io_out_bits_uop_prs1; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_prs2 = ll_wbarb_io_out_bits_uop_prs2; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_prs3 = ll_wbarb_io_out_bits_uop_prs3; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ppred = ll_wbarb_io_out_bits_uop_ppred; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_prs1_busy = ll_wbarb_io_out_bits_uop_prs1_busy; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_prs2_busy = ll_wbarb_io_out_bits_uop_prs2_busy; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_prs3_busy = ll_wbarb_io_out_bits_uop_prs3_busy; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ppred_busy = ll_wbarb_io_out_bits_uop_ppred_busy; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_stale_pdst = ll_wbarb_io_out_bits_uop_stale_pdst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_exception = ll_wbarb_io_out_bits_uop_exception; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_exc_cause = ll_wbarb_io_out_bits_uop_exc_cause; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_bypassable = ll_wbarb_io_out_bits_uop_bypassable; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_mem_cmd = ll_wbarb_io_out_bits_uop_mem_cmd; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_mem_size = ll_wbarb_io_out_bits_uop_mem_size; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_mem_signed = ll_wbarb_io_out_bits_uop_mem_signed; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_is_fence = ll_wbarb_io_out_bits_uop_is_fence; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_is_fencei = ll_wbarb_io_out_bits_uop_is_fencei; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_is_amo = ll_wbarb_io_out_bits_uop_is_amo; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_uses_ldq = ll_wbarb_io_out_bits_uop_uses_ldq; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_uses_stq = ll_wbarb_io_out_bits_uop_uses_stq; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_is_sys_pc2epc = ll_wbarb_io_out_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_is_unique = ll_wbarb_io_out_bits_uop_is_unique; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_flush_on_commit = ll_wbarb_io_out_bits_uop_flush_on_commit; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ldst_is_rs1 = ll_wbarb_io_out_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ldst = ll_wbarb_io_out_bits_uop_ldst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_lrs1 = ll_wbarb_io_out_bits_uop_lrs1; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_lrs2 = ll_wbarb_io_out_bits_uop_lrs2; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_lrs3 = ll_wbarb_io_out_bits_uop_lrs3; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_ldst_val = ll_wbarb_io_out_bits_uop_ldst_val; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_dst_rtype = ll_wbarb_io_out_bits_uop_dst_rtype; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_lrs1_rtype = ll_wbarb_io_out_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_lrs2_rtype = ll_wbarb_io_out_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_frs3_en = ll_wbarb_io_out_bits_uop_frs3_en; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_fp_val = ll_wbarb_io_out_bits_uop_fp_val; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_fp_single = ll_wbarb_io_out_bits_uop_fp_single; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_xcpt_pf_if = ll_wbarb_io_out_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_xcpt_ae_if = ll_wbarb_io_out_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_xcpt_ma_if = ll_wbarb_io_out_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_bp_debug_if = ll_wbarb_io_out_bits_uop_bp_debug_if; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_bp_xcpt_if = ll_wbarb_io_out_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_debug_fsrc = ll_wbarb_io_out_bits_uop_debug_fsrc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_uop_debug_tsrc = ll_wbarb_io_out_bits_uop_debug_tsrc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_data = ll_wbarb_io_out_bits_data; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_predicated = ll_wbarb_io_out_bits_predicated; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_valid = ll_wbarb_io_out_bits_fflags_valid; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_uopc = ll_wbarb_io_out_bits_fflags_bits_uop_uopc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_inst = ll_wbarb_io_out_bits_fflags_bits_uop_inst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_debug_inst = ll_wbarb_io_out_bits_fflags_bits_uop_debug_inst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_is_rvc = ll_wbarb_io_out_bits_fflags_bits_uop_is_rvc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_debug_pc = ll_wbarb_io_out_bits_fflags_bits_uop_debug_pc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_iq_type = ll_wbarb_io_out_bits_fflags_bits_uop_iq_type; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_fu_code = ll_wbarb_io_out_bits_fflags_bits_uop_fu_code; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ctrl_br_type = ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ctrl_op1_sel = ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ctrl_op2_sel = ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ctrl_imm_sel = ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ctrl_op_fcn = ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ctrl_fcn_dw = ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ctrl_csr_cmd = ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ctrl_is_load = ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ctrl_is_sta = ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ctrl_is_std = ll_wbarb_io_out_bits_fflags_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_iw_state = ll_wbarb_io_out_bits_fflags_bits_uop_iw_state; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_iw_p1_poisoned = ll_wbarb_io_out_bits_fflags_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_iw_p2_poisoned = ll_wbarb_io_out_bits_fflags_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_is_br = ll_wbarb_io_out_bits_fflags_bits_uop_is_br; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_is_jalr = ll_wbarb_io_out_bits_fflags_bits_uop_is_jalr; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_is_jal = ll_wbarb_io_out_bits_fflags_bits_uop_is_jal; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_is_sfb = ll_wbarb_io_out_bits_fflags_bits_uop_is_sfb; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_br_mask = ll_wbarb_io_out_bits_fflags_bits_uop_br_mask; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_br_tag = ll_wbarb_io_out_bits_fflags_bits_uop_br_tag; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ftq_idx = ll_wbarb_io_out_bits_fflags_bits_uop_ftq_idx; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_edge_inst = ll_wbarb_io_out_bits_fflags_bits_uop_edge_inst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_pc_lob = ll_wbarb_io_out_bits_fflags_bits_uop_pc_lob; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_taken = ll_wbarb_io_out_bits_fflags_bits_uop_taken; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_imm_packed = ll_wbarb_io_out_bits_fflags_bits_uop_imm_packed; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_csr_addr = ll_wbarb_io_out_bits_fflags_bits_uop_csr_addr; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_rob_idx = ll_wbarb_io_out_bits_fflags_bits_uop_rob_idx; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ldq_idx = ll_wbarb_io_out_bits_fflags_bits_uop_ldq_idx; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_stq_idx = ll_wbarb_io_out_bits_fflags_bits_uop_stq_idx; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_rxq_idx = ll_wbarb_io_out_bits_fflags_bits_uop_rxq_idx; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_pdst = ll_wbarb_io_out_bits_fflags_bits_uop_pdst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_prs1 = ll_wbarb_io_out_bits_fflags_bits_uop_prs1; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_prs2 = ll_wbarb_io_out_bits_fflags_bits_uop_prs2; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_prs3 = ll_wbarb_io_out_bits_fflags_bits_uop_prs3; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ppred = ll_wbarb_io_out_bits_fflags_bits_uop_ppred; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_prs1_busy = ll_wbarb_io_out_bits_fflags_bits_uop_prs1_busy; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_prs2_busy = ll_wbarb_io_out_bits_fflags_bits_uop_prs2_busy; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_prs3_busy = ll_wbarb_io_out_bits_fflags_bits_uop_prs3_busy; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ppred_busy = ll_wbarb_io_out_bits_fflags_bits_uop_ppred_busy; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_stale_pdst = ll_wbarb_io_out_bits_fflags_bits_uop_stale_pdst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_exception = ll_wbarb_io_out_bits_fflags_bits_uop_exception; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_exc_cause = ll_wbarb_io_out_bits_fflags_bits_uop_exc_cause; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_bypassable = ll_wbarb_io_out_bits_fflags_bits_uop_bypassable; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_mem_cmd = ll_wbarb_io_out_bits_fflags_bits_uop_mem_cmd; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_mem_size = ll_wbarb_io_out_bits_fflags_bits_uop_mem_size; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_mem_signed = ll_wbarb_io_out_bits_fflags_bits_uop_mem_signed; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_is_fence = ll_wbarb_io_out_bits_fflags_bits_uop_is_fence; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_is_fencei = ll_wbarb_io_out_bits_fflags_bits_uop_is_fencei; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_is_amo = ll_wbarb_io_out_bits_fflags_bits_uop_is_amo; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_uses_ldq = ll_wbarb_io_out_bits_fflags_bits_uop_uses_ldq; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_uses_stq = ll_wbarb_io_out_bits_fflags_bits_uop_uses_stq; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_is_sys_pc2epc = ll_wbarb_io_out_bits_fflags_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_is_unique = ll_wbarb_io_out_bits_fflags_bits_uop_is_unique; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_flush_on_commit = ll_wbarb_io_out_bits_fflags_bits_uop_flush_on_commit; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ldst_is_rs1 = ll_wbarb_io_out_bits_fflags_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ldst = ll_wbarb_io_out_bits_fflags_bits_uop_ldst; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_lrs1 = ll_wbarb_io_out_bits_fflags_bits_uop_lrs1; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_lrs2 = ll_wbarb_io_out_bits_fflags_bits_uop_lrs2; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_lrs3 = ll_wbarb_io_out_bits_fflags_bits_uop_lrs3; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_ldst_val = ll_wbarb_io_out_bits_fflags_bits_uop_ldst_val; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_dst_rtype = ll_wbarb_io_out_bits_fflags_bits_uop_dst_rtype; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_lrs1_rtype = ll_wbarb_io_out_bits_fflags_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_lrs2_rtype = ll_wbarb_io_out_bits_fflags_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_frs3_en = ll_wbarb_io_out_bits_fflags_bits_uop_frs3_en; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_fp_val = ll_wbarb_io_out_bits_fflags_bits_uop_fp_val; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_fp_single = ll_wbarb_io_out_bits_fflags_bits_uop_fp_single; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_xcpt_pf_if = ll_wbarb_io_out_bits_fflags_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_xcpt_ae_if = ll_wbarb_io_out_bits_fflags_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_xcpt_ma_if = ll_wbarb_io_out_bits_fflags_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_bp_debug_if = ll_wbarb_io_out_bits_fflags_bits_uop_bp_debug_if; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_bp_xcpt_if = ll_wbarb_io_out_bits_fflags_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_debug_fsrc = ll_wbarb_io_out_bits_fflags_bits_uop_debug_fsrc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_uop_debug_tsrc = ll_wbarb_io_out_bits_fflags_bits_uop_debug_tsrc; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_0_bits_fflags_bits_flags = ll_wbarb_io_out_bits_fflags_bits_flags; // @[fp-pipeline.scala 228:22]
  assign io_wakeups_1_valid = fpiu_unit_io_fresp_valid & _T_41; // @[fp-pipeline.scala 243:37]
  assign io_wakeups_1_bits_uop_uopc = fpiu_unit_io_fresp_bits_uop_uopc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_inst = fpiu_unit_io_fresp_bits_uop_inst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_debug_inst = fpiu_unit_io_fresp_bits_uop_debug_inst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_is_rvc = fpiu_unit_io_fresp_bits_uop_is_rvc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_debug_pc = fpiu_unit_io_fresp_bits_uop_debug_pc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_iq_type = fpiu_unit_io_fresp_bits_uop_iq_type; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_fu_code = fpiu_unit_io_fresp_bits_uop_fu_code; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ctrl_br_type = fpiu_unit_io_fresp_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ctrl_op1_sel = fpiu_unit_io_fresp_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ctrl_op2_sel = fpiu_unit_io_fresp_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ctrl_imm_sel = fpiu_unit_io_fresp_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ctrl_op_fcn = fpiu_unit_io_fresp_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ctrl_fcn_dw = fpiu_unit_io_fresp_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ctrl_csr_cmd = fpiu_unit_io_fresp_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ctrl_is_load = fpiu_unit_io_fresp_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ctrl_is_sta = fpiu_unit_io_fresp_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ctrl_is_std = fpiu_unit_io_fresp_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_iw_state = fpiu_unit_io_fresp_bits_uop_iw_state; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_iw_p1_poisoned = fpiu_unit_io_fresp_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_iw_p2_poisoned = fpiu_unit_io_fresp_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_is_br = fpiu_unit_io_fresp_bits_uop_is_br; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_is_jalr = fpiu_unit_io_fresp_bits_uop_is_jalr; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_is_jal = fpiu_unit_io_fresp_bits_uop_is_jal; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_is_sfb = fpiu_unit_io_fresp_bits_uop_is_sfb; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_br_mask = fpiu_unit_io_fresp_bits_uop_br_mask; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_br_tag = fpiu_unit_io_fresp_bits_uop_br_tag; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ftq_idx = fpiu_unit_io_fresp_bits_uop_ftq_idx; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_edge_inst = fpiu_unit_io_fresp_bits_uop_edge_inst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_pc_lob = fpiu_unit_io_fresp_bits_uop_pc_lob; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_taken = fpiu_unit_io_fresp_bits_uop_taken; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_imm_packed = fpiu_unit_io_fresp_bits_uop_imm_packed; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_csr_addr = fpiu_unit_io_fresp_bits_uop_csr_addr; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_rob_idx = fpiu_unit_io_fresp_bits_uop_rob_idx; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ldq_idx = fpiu_unit_io_fresp_bits_uop_ldq_idx; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_stq_idx = fpiu_unit_io_fresp_bits_uop_stq_idx; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_rxq_idx = fpiu_unit_io_fresp_bits_uop_rxq_idx; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_pdst = fpiu_unit_io_fresp_bits_uop_pdst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_prs1 = fpiu_unit_io_fresp_bits_uop_prs1; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_prs2 = fpiu_unit_io_fresp_bits_uop_prs2; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_prs3 = fpiu_unit_io_fresp_bits_uop_prs3; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ppred = fpiu_unit_io_fresp_bits_uop_ppred; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_prs1_busy = fpiu_unit_io_fresp_bits_uop_prs1_busy; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_prs2_busy = fpiu_unit_io_fresp_bits_uop_prs2_busy; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_prs3_busy = fpiu_unit_io_fresp_bits_uop_prs3_busy; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ppred_busy = fpiu_unit_io_fresp_bits_uop_ppred_busy; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_stale_pdst = fpiu_unit_io_fresp_bits_uop_stale_pdst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_exception = fpiu_unit_io_fresp_bits_uop_exception; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_exc_cause = fpiu_unit_io_fresp_bits_uop_exc_cause; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_bypassable = fpiu_unit_io_fresp_bits_uop_bypassable; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_mem_cmd = fpiu_unit_io_fresp_bits_uop_mem_cmd; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_mem_size = fpiu_unit_io_fresp_bits_uop_mem_size; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_mem_signed = fpiu_unit_io_fresp_bits_uop_mem_signed; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_is_fence = fpiu_unit_io_fresp_bits_uop_is_fence; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_is_fencei = fpiu_unit_io_fresp_bits_uop_is_fencei; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_is_amo = fpiu_unit_io_fresp_bits_uop_is_amo; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_uses_ldq = fpiu_unit_io_fresp_bits_uop_uses_ldq; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_uses_stq = fpiu_unit_io_fresp_bits_uop_uses_stq; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_is_sys_pc2epc = fpiu_unit_io_fresp_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_is_unique = fpiu_unit_io_fresp_bits_uop_is_unique; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_flush_on_commit = fpiu_unit_io_fresp_bits_uop_flush_on_commit; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ldst_is_rs1 = fpiu_unit_io_fresp_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ldst = fpiu_unit_io_fresp_bits_uop_ldst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_lrs1 = fpiu_unit_io_fresp_bits_uop_lrs1; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_lrs2 = fpiu_unit_io_fresp_bits_uop_lrs2; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_lrs3 = fpiu_unit_io_fresp_bits_uop_lrs3; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_ldst_val = fpiu_unit_io_fresp_bits_uop_ldst_val; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_dst_rtype = fpiu_unit_io_fresp_bits_uop_dst_rtype; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_lrs1_rtype = fpiu_unit_io_fresp_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_lrs2_rtype = fpiu_unit_io_fresp_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_frs3_en = fpiu_unit_io_fresp_bits_uop_frs3_en; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_fp_val = fpiu_unit_io_fresp_bits_uop_fp_val; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_fp_single = fpiu_unit_io_fresp_bits_uop_fp_single; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_xcpt_pf_if = fpiu_unit_io_fresp_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_xcpt_ae_if = fpiu_unit_io_fresp_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_xcpt_ma_if = fpiu_unit_io_fresp_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_bp_debug_if = fpiu_unit_io_fresp_bits_uop_bp_debug_if; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_bp_xcpt_if = fpiu_unit_io_fresp_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_debug_fsrc = fpiu_unit_io_fresp_bits_uop_debug_fsrc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_uop_debug_tsrc = fpiu_unit_io_fresp_bits_uop_debug_tsrc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_data = fpiu_unit_io_fresp_bits_data; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_predicated = fpiu_unit_io_fresp_bits_predicated; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_valid = fpiu_unit_io_fresp_bits_fflags_valid; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_uopc = fpiu_unit_io_fresp_bits_fflags_bits_uop_uopc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_inst = fpiu_unit_io_fresp_bits_fflags_bits_uop_inst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_debug_inst = fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_inst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_is_rvc = fpiu_unit_io_fresp_bits_fflags_bits_uop_is_rvc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_debug_pc = fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_pc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_iq_type = fpiu_unit_io_fresp_bits_fflags_bits_uop_iq_type; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_fu_code = fpiu_unit_io_fresp_bits_fflags_bits_uop_fu_code; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ctrl_br_type = fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ctrl_op1_sel = fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ctrl_op2_sel = fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ctrl_imm_sel = fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ctrl_op_fcn = fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ctrl_fcn_dw = fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ctrl_csr_cmd = fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ctrl_is_load = fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ctrl_is_sta = fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ctrl_is_std = fpiu_unit_io_fresp_bits_fflags_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_iw_state = fpiu_unit_io_fresp_bits_fflags_bits_uop_iw_state; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_iw_p1_poisoned = fpiu_unit_io_fresp_bits_fflags_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_iw_p2_poisoned = fpiu_unit_io_fresp_bits_fflags_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_is_br = fpiu_unit_io_fresp_bits_fflags_bits_uop_is_br; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_is_jalr = fpiu_unit_io_fresp_bits_fflags_bits_uop_is_jalr; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_is_jal = fpiu_unit_io_fresp_bits_fflags_bits_uop_is_jal; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_is_sfb = fpiu_unit_io_fresp_bits_fflags_bits_uop_is_sfb; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_br_mask = fpiu_unit_io_fresp_bits_fflags_bits_uop_br_mask; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_br_tag = fpiu_unit_io_fresp_bits_fflags_bits_uop_br_tag; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ftq_idx = fpiu_unit_io_fresp_bits_fflags_bits_uop_ftq_idx; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_edge_inst = fpiu_unit_io_fresp_bits_fflags_bits_uop_edge_inst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_pc_lob = fpiu_unit_io_fresp_bits_fflags_bits_uop_pc_lob; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_taken = fpiu_unit_io_fresp_bits_fflags_bits_uop_taken; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_imm_packed = fpiu_unit_io_fresp_bits_fflags_bits_uop_imm_packed; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_csr_addr = fpiu_unit_io_fresp_bits_fflags_bits_uop_csr_addr; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_rob_idx = fpiu_unit_io_fresp_bits_fflags_bits_uop_rob_idx; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ldq_idx = fpiu_unit_io_fresp_bits_fflags_bits_uop_ldq_idx; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_stq_idx = fpiu_unit_io_fresp_bits_fflags_bits_uop_stq_idx; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_rxq_idx = fpiu_unit_io_fresp_bits_fflags_bits_uop_rxq_idx; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_pdst = fpiu_unit_io_fresp_bits_fflags_bits_uop_pdst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_prs1 = fpiu_unit_io_fresp_bits_fflags_bits_uop_prs1; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_prs2 = fpiu_unit_io_fresp_bits_fflags_bits_uop_prs2; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_prs3 = fpiu_unit_io_fresp_bits_fflags_bits_uop_prs3; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ppred = fpiu_unit_io_fresp_bits_fflags_bits_uop_ppred; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_prs1_busy = fpiu_unit_io_fresp_bits_fflags_bits_uop_prs1_busy; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_prs2_busy = fpiu_unit_io_fresp_bits_fflags_bits_uop_prs2_busy; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_prs3_busy = fpiu_unit_io_fresp_bits_fflags_bits_uop_prs3_busy; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ppred_busy = fpiu_unit_io_fresp_bits_fflags_bits_uop_ppred_busy; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_stale_pdst = fpiu_unit_io_fresp_bits_fflags_bits_uop_stale_pdst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_exception = fpiu_unit_io_fresp_bits_fflags_bits_uop_exception; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_exc_cause = fpiu_unit_io_fresp_bits_fflags_bits_uop_exc_cause; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_bypassable = fpiu_unit_io_fresp_bits_fflags_bits_uop_bypassable; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_mem_cmd = fpiu_unit_io_fresp_bits_fflags_bits_uop_mem_cmd; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_mem_size = fpiu_unit_io_fresp_bits_fflags_bits_uop_mem_size; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_mem_signed = fpiu_unit_io_fresp_bits_fflags_bits_uop_mem_signed; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_is_fence = fpiu_unit_io_fresp_bits_fflags_bits_uop_is_fence; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_is_fencei = fpiu_unit_io_fresp_bits_fflags_bits_uop_is_fencei; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_is_amo = fpiu_unit_io_fresp_bits_fflags_bits_uop_is_amo; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_uses_ldq = fpiu_unit_io_fresp_bits_fflags_bits_uop_uses_ldq; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_uses_stq = fpiu_unit_io_fresp_bits_fflags_bits_uop_uses_stq; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_is_sys_pc2epc = fpiu_unit_io_fresp_bits_fflags_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_is_unique = fpiu_unit_io_fresp_bits_fflags_bits_uop_is_unique; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_flush_on_commit = fpiu_unit_io_fresp_bits_fflags_bits_uop_flush_on_commit; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ldst_is_rs1 = fpiu_unit_io_fresp_bits_fflags_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ldst = fpiu_unit_io_fresp_bits_fflags_bits_uop_ldst; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_lrs1 = fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs1; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_lrs2 = fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs2; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_lrs3 = fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs3; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_ldst_val = fpiu_unit_io_fresp_bits_fflags_bits_uop_ldst_val; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_dst_rtype = fpiu_unit_io_fresp_bits_fflags_bits_uop_dst_rtype; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_lrs1_rtype = fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_lrs2_rtype = fpiu_unit_io_fresp_bits_fflags_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_frs3_en = fpiu_unit_io_fresp_bits_fflags_bits_uop_frs3_en; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_fp_val = fpiu_unit_io_fresp_bits_fflags_bits_uop_fp_val; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_fp_single = fpiu_unit_io_fresp_bits_fflags_bits_uop_fp_single; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_xcpt_pf_if = fpiu_unit_io_fresp_bits_fflags_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_xcpt_ae_if = fpiu_unit_io_fresp_bits_fflags_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_xcpt_ma_if = fpiu_unit_io_fresp_bits_fflags_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_bp_debug_if = fpiu_unit_io_fresp_bits_fflags_bits_uop_bp_debug_if; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_bp_xcpt_if = fpiu_unit_io_fresp_bits_fflags_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_debug_fsrc = fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_fsrc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_uop_debug_tsrc = fpiu_unit_io_fresp_bits_fflags_bits_uop_debug_tsrc; // @[fp-pipeline.scala 244:18]
  assign io_wakeups_1_bits_fflags_bits_flags = fpiu_unit_io_fresp_bits_fflags_bits_flags; // @[fp-pipeline.scala 244:18]
  assign io_debug_wb_wdata_0 = {{1'd0}, _T_71}; // @[Cat.scala 30:58]
  assign io_debug_wb_wdata_1 = {{1'd0}, _T_75}; // @[Cat.scala 30:58]
  assign fpiu_unit_clock = clock;
  assign fpiu_unit_reset = reset;
  assign fpiu_unit_io_req_valid = fregister_read_io_exe_reqs_0_valid; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_uopc = fregister_read_io_exe_reqs_0_bits_uop_uopc; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_inst = fregister_read_io_exe_reqs_0_bits_uop_inst; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_debug_inst = fregister_read_io_exe_reqs_0_bits_uop_debug_inst; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_is_rvc = fregister_read_io_exe_reqs_0_bits_uop_is_rvc; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_debug_pc = fregister_read_io_exe_reqs_0_bits_uop_debug_pc; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_iq_type = fregister_read_io_exe_reqs_0_bits_uop_iq_type; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_fu_code = fregister_read_io_exe_reqs_0_bits_uop_fu_code; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ctrl_br_type = fregister_read_io_exe_reqs_0_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ctrl_op1_sel = fregister_read_io_exe_reqs_0_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ctrl_op2_sel = fregister_read_io_exe_reqs_0_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ctrl_imm_sel = fregister_read_io_exe_reqs_0_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ctrl_op_fcn = fregister_read_io_exe_reqs_0_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ctrl_fcn_dw = fregister_read_io_exe_reqs_0_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ctrl_csr_cmd = fregister_read_io_exe_reqs_0_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ctrl_is_load = fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ctrl_is_sta = fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ctrl_is_std = fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_iw_state = fregister_read_io_exe_reqs_0_bits_uop_iw_state; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_iw_p1_poisoned = fregister_read_io_exe_reqs_0_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_iw_p2_poisoned = fregister_read_io_exe_reqs_0_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_is_br = fregister_read_io_exe_reqs_0_bits_uop_is_br; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_is_jalr = fregister_read_io_exe_reqs_0_bits_uop_is_jalr; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_is_jal = fregister_read_io_exe_reqs_0_bits_uop_is_jal; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_is_sfb = fregister_read_io_exe_reqs_0_bits_uop_is_sfb; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_br_mask = fregister_read_io_exe_reqs_0_bits_uop_br_mask; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_br_tag = fregister_read_io_exe_reqs_0_bits_uop_br_tag; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ftq_idx = fregister_read_io_exe_reqs_0_bits_uop_ftq_idx; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_edge_inst = fregister_read_io_exe_reqs_0_bits_uop_edge_inst; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_pc_lob = fregister_read_io_exe_reqs_0_bits_uop_pc_lob; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_taken = fregister_read_io_exe_reqs_0_bits_uop_taken; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_imm_packed = fregister_read_io_exe_reqs_0_bits_uop_imm_packed; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_csr_addr = fregister_read_io_exe_reqs_0_bits_uop_csr_addr; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_rob_idx = fregister_read_io_exe_reqs_0_bits_uop_rob_idx; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ldq_idx = fregister_read_io_exe_reqs_0_bits_uop_ldq_idx; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_stq_idx = fregister_read_io_exe_reqs_0_bits_uop_stq_idx; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_rxq_idx = fregister_read_io_exe_reqs_0_bits_uop_rxq_idx; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_pdst = fregister_read_io_exe_reqs_0_bits_uop_pdst; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_prs1 = fregister_read_io_exe_reqs_0_bits_uop_prs1; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_prs2 = fregister_read_io_exe_reqs_0_bits_uop_prs2; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_prs3 = fregister_read_io_exe_reqs_0_bits_uop_prs3; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ppred = fregister_read_io_exe_reqs_0_bits_uop_ppred; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_prs1_busy = fregister_read_io_exe_reqs_0_bits_uop_prs1_busy; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_prs2_busy = fregister_read_io_exe_reqs_0_bits_uop_prs2_busy; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_prs3_busy = fregister_read_io_exe_reqs_0_bits_uop_prs3_busy; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ppred_busy = fregister_read_io_exe_reqs_0_bits_uop_ppred_busy; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_stale_pdst = fregister_read_io_exe_reqs_0_bits_uop_stale_pdst; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_exception = fregister_read_io_exe_reqs_0_bits_uop_exception; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_exc_cause = fregister_read_io_exe_reqs_0_bits_uop_exc_cause; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_bypassable = fregister_read_io_exe_reqs_0_bits_uop_bypassable; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_mem_cmd = fregister_read_io_exe_reqs_0_bits_uop_mem_cmd; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_mem_size = fregister_read_io_exe_reqs_0_bits_uop_mem_size; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_mem_signed = fregister_read_io_exe_reqs_0_bits_uop_mem_signed; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_is_fence = fregister_read_io_exe_reqs_0_bits_uop_is_fence; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_is_fencei = fregister_read_io_exe_reqs_0_bits_uop_is_fencei; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_is_amo = fregister_read_io_exe_reqs_0_bits_uop_is_amo; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_uses_ldq = fregister_read_io_exe_reqs_0_bits_uop_uses_ldq; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_uses_stq = fregister_read_io_exe_reqs_0_bits_uop_uses_stq; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_is_sys_pc2epc = fregister_read_io_exe_reqs_0_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_is_unique = fregister_read_io_exe_reqs_0_bits_uop_is_unique; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_flush_on_commit = fregister_read_io_exe_reqs_0_bits_uop_flush_on_commit; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ldst_is_rs1 = fregister_read_io_exe_reqs_0_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ldst = fregister_read_io_exe_reqs_0_bits_uop_ldst; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_lrs1 = fregister_read_io_exe_reqs_0_bits_uop_lrs1; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_lrs2 = fregister_read_io_exe_reqs_0_bits_uop_lrs2; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_lrs3 = fregister_read_io_exe_reqs_0_bits_uop_lrs3; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_ldst_val = fregister_read_io_exe_reqs_0_bits_uop_ldst_val; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_dst_rtype = fregister_read_io_exe_reqs_0_bits_uop_dst_rtype; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_lrs1_rtype = fregister_read_io_exe_reqs_0_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_lrs2_rtype = fregister_read_io_exe_reqs_0_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_frs3_en = fregister_read_io_exe_reqs_0_bits_uop_frs3_en; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_fp_val = fregister_read_io_exe_reqs_0_bits_uop_fp_val; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_fp_single = fregister_read_io_exe_reqs_0_bits_uop_fp_single; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_xcpt_pf_if = fregister_read_io_exe_reqs_0_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_xcpt_ae_if = fregister_read_io_exe_reqs_0_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_xcpt_ma_if = fregister_read_io_exe_reqs_0_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_bp_debug_if = fregister_read_io_exe_reqs_0_bits_uop_bp_debug_if; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_bp_xcpt_if = fregister_read_io_exe_reqs_0_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_debug_fsrc = fregister_read_io_exe_reqs_0_bits_uop_debug_fsrc; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_uop_debug_tsrc = fregister_read_io_exe_reqs_0_bits_uop_debug_tsrc; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_rs1_data = fregister_read_io_exe_reqs_0_bits_rs1_data; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_rs2_data = fregister_read_io_exe_reqs_0_bits_rs2_data; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_rs3_data = fregister_read_io_exe_reqs_0_bits_rs3_data; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_pred_data = fregister_read_io_exe_reqs_0_bits_pred_data; // @[fp-pipeline.scala 161:15]
  assign fpiu_unit_io_req_bits_kill = io_flush_pipeline; // @[fp-pipeline.scala 267:35]
  assign fpiu_unit_io_fresp_ready = 1'h1; // @[fp-pipeline.scala 202:48]
  assign fpiu_unit_io_ll_iresp_ready = io_to_sdq_ready & io_to_int_ready; // @[fp-pipeline.scala 219:50]
  assign fpiu_unit_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[fp-pipeline.scala 158:31]
  assign fpiu_unit_io_status_debug = io_status_debug; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_cease = io_status_cease; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_wfi = io_status_wfi; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_isa = io_status_isa; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_dprv = io_status_dprv; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_prv = io_status_prv; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_sd = io_status_sd; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_zero2 = io_status_zero2; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_sxl = io_status_sxl; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_uxl = io_status_uxl; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_sd_rv32 = io_status_sd_rv32; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_zero1 = io_status_zero1; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_tsr = io_status_tsr; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_tw = io_status_tw; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_tvm = io_status_tvm; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_mxr = io_status_mxr; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_sum = io_status_sum; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_mprv = io_status_mprv; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_xs = io_status_xs; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_fs = io_status_fs; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_mpp = io_status_mpp; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_vs = io_status_vs; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_spp = io_status_spp; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_mpie = io_status_mpie; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_hpie = io_status_hpie; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_spie = io_status_spie; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_upie = io_status_upie; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_mie = io_status_mie; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_hie = io_status_hie; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_sie = io_status_sie; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_status_uie = io_status_uie; // @[fp-pipeline.scala 259:29]
  assign fpiu_unit_io_fcsr_rm = io_fcsr_rm; // @[fp-pipeline.scala 258:30]
  assign fp_issue_unit_clock = clock;
  assign fp_issue_unit_reset = reset;
  assign fp_issue_unit_io_dis_uops_0_valid = io_dis_uops_0_valid; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_uopc = io_dis_uops_0_bits_uopc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_inst = io_dis_uops_0_bits_inst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_debug_inst = io_dis_uops_0_bits_debug_inst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_is_rvc = io_dis_uops_0_bits_is_rvc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_debug_pc = io_dis_uops_0_bits_debug_pc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_iq_type = io_dis_uops_0_bits_iq_type; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_fu_code = io_dis_uops_0_bits_fu_code; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ctrl_br_type = io_dis_uops_0_bits_ctrl_br_type; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ctrl_op1_sel = io_dis_uops_0_bits_ctrl_op1_sel; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ctrl_op2_sel = io_dis_uops_0_bits_ctrl_op2_sel; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ctrl_imm_sel = io_dis_uops_0_bits_ctrl_imm_sel; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ctrl_op_fcn = io_dis_uops_0_bits_ctrl_op_fcn; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ctrl_fcn_dw = io_dis_uops_0_bits_ctrl_fcn_dw; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ctrl_csr_cmd = io_dis_uops_0_bits_ctrl_csr_cmd; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ctrl_is_load = io_dis_uops_0_bits_ctrl_is_load; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ctrl_is_sta = io_dis_uops_0_bits_ctrl_is_sta; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ctrl_is_std = io_dis_uops_0_bits_ctrl_is_std; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_iw_state = io_dis_uops_0_bits_iw_state; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_iw_p1_poisoned = io_dis_uops_0_bits_iw_p1_poisoned; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_iw_p2_poisoned = io_dis_uops_0_bits_iw_p2_poisoned; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_is_br = io_dis_uops_0_bits_is_br; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_is_jalr = io_dis_uops_0_bits_is_jalr; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_is_jal = io_dis_uops_0_bits_is_jal; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_is_sfb = io_dis_uops_0_bits_is_sfb; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_br_mask = io_dis_uops_0_bits_br_mask; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_br_tag = io_dis_uops_0_bits_br_tag; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ftq_idx = io_dis_uops_0_bits_ftq_idx; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_edge_inst = io_dis_uops_0_bits_edge_inst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_pc_lob = io_dis_uops_0_bits_pc_lob; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_taken = io_dis_uops_0_bits_taken; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_imm_packed = io_dis_uops_0_bits_imm_packed; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_csr_addr = io_dis_uops_0_bits_csr_addr; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_rob_idx = io_dis_uops_0_bits_rob_idx; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ldq_idx = io_dis_uops_0_bits_ldq_idx; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_stq_idx = io_dis_uops_0_bits_stq_idx; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_rxq_idx = io_dis_uops_0_bits_rxq_idx; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_pdst = io_dis_uops_0_bits_pdst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_prs1 = io_dis_uops_0_bits_prs1; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_prs2 = io_dis_uops_0_bits_prs2; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_prs3 = io_dis_uops_0_bits_prs3; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ppred = io_dis_uops_0_bits_ppred; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_prs1_busy = io_dis_uops_0_bits_prs1_busy; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_prs2_busy = io_dis_uops_0_bits_prs2_busy; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_prs3_busy = io_dis_uops_0_bits_prs3_busy; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ppred_busy = io_dis_uops_0_bits_ppred_busy; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_stale_pdst = io_dis_uops_0_bits_stale_pdst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_exception = io_dis_uops_0_bits_exception; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_exc_cause = io_dis_uops_0_bits_exc_cause; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_bypassable = io_dis_uops_0_bits_bypassable; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_mem_cmd = io_dis_uops_0_bits_mem_cmd; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_mem_size = io_dis_uops_0_bits_mem_size; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_mem_signed = io_dis_uops_0_bits_mem_signed; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_is_fence = io_dis_uops_0_bits_is_fence; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_is_fencei = io_dis_uops_0_bits_is_fencei; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_is_amo = io_dis_uops_0_bits_is_amo; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_uses_ldq = io_dis_uops_0_bits_uses_ldq; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_uses_stq = io_dis_uops_0_bits_uses_stq; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_is_sys_pc2epc = io_dis_uops_0_bits_is_sys_pc2epc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_is_unique = io_dis_uops_0_bits_is_unique; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_flush_on_commit = io_dis_uops_0_bits_flush_on_commit; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ldst_is_rs1 = io_dis_uops_0_bits_ldst_is_rs1; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ldst = io_dis_uops_0_bits_ldst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_lrs1 = io_dis_uops_0_bits_lrs1; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_lrs2 = io_dis_uops_0_bits_lrs2; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_lrs3 = io_dis_uops_0_bits_lrs3; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_ldst_val = io_dis_uops_0_bits_ldst_val; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_dst_rtype = io_dis_uops_0_bits_dst_rtype; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_lrs1_rtype = io_dis_uops_0_bits_lrs1_rtype; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_lrs2_rtype = io_dis_uops_0_bits_lrs2_rtype; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_frs3_en = io_dis_uops_0_bits_frs3_en; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_fp_val = io_dis_uops_0_bits_fp_val; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_fp_single = io_dis_uops_0_bits_fp_single; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_xcpt_pf_if = io_dis_uops_0_bits_xcpt_pf_if; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_xcpt_ae_if = io_dis_uops_0_bits_xcpt_ae_if; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_xcpt_ma_if = io_dis_uops_0_bits_xcpt_ma_if; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_bp_debug_if = io_dis_uops_0_bits_bp_debug_if; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_bp_xcpt_if = io_dis_uops_0_bits_bp_xcpt_if; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_debug_fsrc = io_dis_uops_0_bits_debug_fsrc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_0_bits_debug_tsrc = io_dis_uops_0_bits_debug_tsrc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_valid = io_dis_uops_1_valid; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_uopc = io_dis_uops_1_bits_uopc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_inst = io_dis_uops_1_bits_inst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_debug_inst = io_dis_uops_1_bits_debug_inst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_is_rvc = io_dis_uops_1_bits_is_rvc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_debug_pc = io_dis_uops_1_bits_debug_pc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_iq_type = io_dis_uops_1_bits_iq_type; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_fu_code = io_dis_uops_1_bits_fu_code; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ctrl_br_type = io_dis_uops_1_bits_ctrl_br_type; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ctrl_op1_sel = io_dis_uops_1_bits_ctrl_op1_sel; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ctrl_op2_sel = io_dis_uops_1_bits_ctrl_op2_sel; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ctrl_imm_sel = io_dis_uops_1_bits_ctrl_imm_sel; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ctrl_op_fcn = io_dis_uops_1_bits_ctrl_op_fcn; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ctrl_fcn_dw = io_dis_uops_1_bits_ctrl_fcn_dw; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ctrl_csr_cmd = io_dis_uops_1_bits_ctrl_csr_cmd; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ctrl_is_load = io_dis_uops_1_bits_ctrl_is_load; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ctrl_is_sta = io_dis_uops_1_bits_ctrl_is_sta; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ctrl_is_std = io_dis_uops_1_bits_ctrl_is_std; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_iw_state = io_dis_uops_1_bits_iw_state; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_iw_p1_poisoned = io_dis_uops_1_bits_iw_p1_poisoned; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_iw_p2_poisoned = io_dis_uops_1_bits_iw_p2_poisoned; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_is_br = io_dis_uops_1_bits_is_br; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_is_jalr = io_dis_uops_1_bits_is_jalr; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_is_jal = io_dis_uops_1_bits_is_jal; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_is_sfb = io_dis_uops_1_bits_is_sfb; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_br_mask = io_dis_uops_1_bits_br_mask; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_br_tag = io_dis_uops_1_bits_br_tag; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ftq_idx = io_dis_uops_1_bits_ftq_idx; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_edge_inst = io_dis_uops_1_bits_edge_inst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_pc_lob = io_dis_uops_1_bits_pc_lob; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_taken = io_dis_uops_1_bits_taken; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_imm_packed = io_dis_uops_1_bits_imm_packed; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_csr_addr = io_dis_uops_1_bits_csr_addr; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_rob_idx = io_dis_uops_1_bits_rob_idx; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ldq_idx = io_dis_uops_1_bits_ldq_idx; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_stq_idx = io_dis_uops_1_bits_stq_idx; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_rxq_idx = io_dis_uops_1_bits_rxq_idx; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_pdst = io_dis_uops_1_bits_pdst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_prs1 = io_dis_uops_1_bits_prs1; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_prs2 = io_dis_uops_1_bits_prs2; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_prs3 = io_dis_uops_1_bits_prs3; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ppred = io_dis_uops_1_bits_ppred; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_prs1_busy = io_dis_uops_1_bits_prs1_busy; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_prs2_busy = io_dis_uops_1_bits_prs2_busy; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_prs3_busy = io_dis_uops_1_bits_prs3_busy; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ppred_busy = io_dis_uops_1_bits_ppred_busy; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_stale_pdst = io_dis_uops_1_bits_stale_pdst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_exception = io_dis_uops_1_bits_exception; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_exc_cause = io_dis_uops_1_bits_exc_cause; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_bypassable = io_dis_uops_1_bits_bypassable; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_mem_cmd = io_dis_uops_1_bits_mem_cmd; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_mem_size = io_dis_uops_1_bits_mem_size; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_mem_signed = io_dis_uops_1_bits_mem_signed; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_is_fence = io_dis_uops_1_bits_is_fence; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_is_fencei = io_dis_uops_1_bits_is_fencei; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_is_amo = io_dis_uops_1_bits_is_amo; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_uses_ldq = io_dis_uops_1_bits_uses_ldq; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_uses_stq = io_dis_uops_1_bits_uses_stq; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_is_sys_pc2epc = io_dis_uops_1_bits_is_sys_pc2epc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_is_unique = io_dis_uops_1_bits_is_unique; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_flush_on_commit = io_dis_uops_1_bits_flush_on_commit; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ldst_is_rs1 = io_dis_uops_1_bits_ldst_is_rs1; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ldst = io_dis_uops_1_bits_ldst; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_lrs1 = io_dis_uops_1_bits_lrs1; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_lrs2 = io_dis_uops_1_bits_lrs2; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_lrs3 = io_dis_uops_1_bits_lrs3; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_ldst_val = io_dis_uops_1_bits_ldst_val; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_dst_rtype = io_dis_uops_1_bits_dst_rtype; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_lrs1_rtype = io_dis_uops_1_bits_lrs1_rtype; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_lrs2_rtype = io_dis_uops_1_bits_lrs2_rtype; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_frs3_en = io_dis_uops_1_bits_frs3_en; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_fp_val = io_dis_uops_1_bits_fp_val; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_fp_single = io_dis_uops_1_bits_fp_single; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_xcpt_pf_if = io_dis_uops_1_bits_xcpt_pf_if; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_xcpt_ae_if = io_dis_uops_1_bits_xcpt_ae_if; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_xcpt_ma_if = io_dis_uops_1_bits_xcpt_ma_if; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_bp_debug_if = io_dis_uops_1_bits_bp_debug_if; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_bp_xcpt_if = io_dis_uops_1_bits_bp_xcpt_if; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_debug_fsrc = io_dis_uops_1_bits_debug_fsrc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_dis_uops_1_bits_debug_tsrc = io_dis_uops_1_bits_debug_tsrc; // @[fp-pipeline.scala 109:31]
  assign fp_issue_unit_io_wakeup_ports_0_valid = io_wakeups_0_valid; // @[fp-pipeline.scala 133:24]
  assign fp_issue_unit_io_wakeup_ports_0_bits_pdst = io_wakeups_0_bits_uop_pdst; // @[fp-pipeline.scala 134:29]
  assign fp_issue_unit_io_wakeup_ports_0_bits_poisoned = 1'h0; // @[fp-pipeline.scala 135:32]
  assign fp_issue_unit_io_wakeup_ports_1_valid = io_wakeups_1_valid; // @[fp-pipeline.scala 133:24]
  assign fp_issue_unit_io_wakeup_ports_1_bits_pdst = io_wakeups_1_bits_uop_pdst; // @[fp-pipeline.scala 134:29]
  assign fp_issue_unit_io_wakeup_ports_1_bits_poisoned = 1'h0; // @[fp-pipeline.scala 135:32]
  assign fp_issue_unit_io_pred_wakeup_port_valid = 1'h0; // @[fp-pipeline.scala 137:40]
  assign fp_issue_unit_io_pred_wakeup_port_bits = 5'h0;
  assign fp_issue_unit_io_spec_ld_wakeup_0_valid = 1'h0; // @[fp-pipeline.scala 96:43]
  assign fp_issue_unit_io_spec_ld_wakeup_0_bits = 6'h0; // @[fp-pipeline.scala 97:42]
  assign fp_issue_unit_io_fu_types_0 = fpiu_unit_io_fu_types & REG; // @[fp-pipeline.scala 124:27]
  assign fp_issue_unit_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[fp-pipeline.scala 92:26]
  assign fp_issue_unit_io_flush_pipeline = io_flush_pipeline; // @[fp-pipeline.scala 93:32]
  assign fp_issue_unit_io_ld_miss = 1'h0; // @[fp-pipeline.scala 99:25]
  assign fp_issue_unit_io_tsc_reg = io_debug_tsc_reg; // @[fp-pipeline.scala 91:25]
  assign fregfile_clock = clock;
  assign fregfile_reset = reset;
  assign fregfile_io_read_ports_0_addr = fregister_read_io_rf_read_ports_0_addr; // @[fp-pipeline.scala 145:35]
  assign fregfile_io_read_ports_1_addr = fregister_read_io_rf_read_ports_1_addr; // @[fp-pipeline.scala 145:35]
  assign fregfile_io_read_ports_2_addr = fregister_read_io_rf_read_ports_2_addr; // @[fp-pipeline.scala 145:35]
  assign fregfile_io_write_ports_0_valid = REG_1_valid; // @[fp-pipeline.scala 185:30]
  assign fregfile_io_write_ports_0_bits_addr = REG_1_bits_addr; // @[fp-pipeline.scala 185:30]
  assign fregfile_io_write_ports_0_bits_data = REG_1_bits_data; // @[fp-pipeline.scala 185:30]
  assign fregfile_io_write_ports_1_valid = fpiu_unit_io_fresp_valid & _T_32; // @[fp-pipeline.scala 199:69]
  assign fregfile_io_write_ports_1_bits_addr = fpiu_unit_io_fresp_bits_uop_pdst; // @[fp-pipeline.scala 200:48]
  assign fregfile_io_write_ports_1_bits_data = fpiu_unit_io_fresp_bits_data; // @[fp-pipeline.scala 201:48]
  assign fregister_read_clock = clock;
  assign fregister_read_reset = reset;
  assign fregister_read_io_iss_valids_0 = fp_issue_unit_io_iss_valids_0; // @[fp-pipeline.scala 88:24 fp-pipeline.scala 118:19]
  assign fregister_read_io_iss_uops_0_uopc = fp_issue_unit_io_iss_uops_0_uopc; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_inst = fp_issue_unit_io_iss_uops_0_inst; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_debug_inst = fp_issue_unit_io_iss_uops_0_debug_inst; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_is_rvc = fp_issue_unit_io_iss_uops_0_is_rvc; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_debug_pc = fp_issue_unit_io_iss_uops_0_debug_pc; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_iq_type = fp_issue_unit_io_iss_uops_0_iq_type; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_fu_code = fp_issue_unit_io_iss_uops_0_fu_code; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ctrl_br_type = fp_issue_unit_io_iss_uops_0_ctrl_br_type; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ctrl_op1_sel = fp_issue_unit_io_iss_uops_0_ctrl_op1_sel; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ctrl_op2_sel = fp_issue_unit_io_iss_uops_0_ctrl_op2_sel; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ctrl_imm_sel = fp_issue_unit_io_iss_uops_0_ctrl_imm_sel; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ctrl_op_fcn = fp_issue_unit_io_iss_uops_0_ctrl_op_fcn; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ctrl_fcn_dw = fp_issue_unit_io_iss_uops_0_ctrl_fcn_dw; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ctrl_csr_cmd = fp_issue_unit_io_iss_uops_0_ctrl_csr_cmd; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ctrl_is_load = fp_issue_unit_io_iss_uops_0_ctrl_is_load; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ctrl_is_sta = fp_issue_unit_io_iss_uops_0_ctrl_is_sta; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ctrl_is_std = fp_issue_unit_io_iss_uops_0_ctrl_is_std; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_iw_state = fp_issue_unit_io_iss_uops_0_iw_state; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_iw_p1_poisoned = fp_issue_unit_io_iss_uops_0_iw_p1_poisoned; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_iw_p2_poisoned = fp_issue_unit_io_iss_uops_0_iw_p2_poisoned; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_is_br = fp_issue_unit_io_iss_uops_0_is_br; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_is_jalr = fp_issue_unit_io_iss_uops_0_is_jalr; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_is_jal = fp_issue_unit_io_iss_uops_0_is_jal; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_is_sfb = fp_issue_unit_io_iss_uops_0_is_sfb; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_br_mask = fp_issue_unit_io_iss_uops_0_br_mask; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_br_tag = fp_issue_unit_io_iss_uops_0_br_tag; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ftq_idx = fp_issue_unit_io_iss_uops_0_ftq_idx; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_edge_inst = fp_issue_unit_io_iss_uops_0_edge_inst; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_pc_lob = fp_issue_unit_io_iss_uops_0_pc_lob; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_taken = fp_issue_unit_io_iss_uops_0_taken; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_imm_packed = fp_issue_unit_io_iss_uops_0_imm_packed; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_csr_addr = fp_issue_unit_io_iss_uops_0_csr_addr; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_rob_idx = fp_issue_unit_io_iss_uops_0_rob_idx; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ldq_idx = fp_issue_unit_io_iss_uops_0_ldq_idx; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_stq_idx = fp_issue_unit_io_iss_uops_0_stq_idx; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_rxq_idx = fp_issue_unit_io_iss_uops_0_rxq_idx; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_pdst = fp_issue_unit_io_iss_uops_0_pdst; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_prs1 = fp_issue_unit_io_iss_uops_0_prs1; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_prs2 = fp_issue_unit_io_iss_uops_0_prs2; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_prs3 = fp_issue_unit_io_iss_uops_0_prs3; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ppred = fp_issue_unit_io_iss_uops_0_ppred; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_prs1_busy = fp_issue_unit_io_iss_uops_0_prs1_busy; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_prs2_busy = fp_issue_unit_io_iss_uops_0_prs2_busy; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_prs3_busy = fp_issue_unit_io_iss_uops_0_prs3_busy; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ppred_busy = fp_issue_unit_io_iss_uops_0_ppred_busy; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_stale_pdst = fp_issue_unit_io_iss_uops_0_stale_pdst; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_exception = fp_issue_unit_io_iss_uops_0_exception; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_exc_cause = fp_issue_unit_io_iss_uops_0_exc_cause; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_bypassable = fp_issue_unit_io_iss_uops_0_bypassable; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_mem_cmd = fp_issue_unit_io_iss_uops_0_mem_cmd; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_mem_size = fp_issue_unit_io_iss_uops_0_mem_size; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_mem_signed = fp_issue_unit_io_iss_uops_0_mem_signed; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_is_fence = fp_issue_unit_io_iss_uops_0_is_fence; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_is_fencei = fp_issue_unit_io_iss_uops_0_is_fencei; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_is_amo = fp_issue_unit_io_iss_uops_0_is_amo; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_uses_ldq = fp_issue_unit_io_iss_uops_0_uses_ldq; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_uses_stq = fp_issue_unit_io_iss_uops_0_uses_stq; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_is_sys_pc2epc = fp_issue_unit_io_iss_uops_0_is_sys_pc2epc; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_is_unique = fp_issue_unit_io_iss_uops_0_is_unique; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_flush_on_commit = fp_issue_unit_io_iss_uops_0_flush_on_commit; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ldst_is_rs1 = fp_issue_unit_io_iss_uops_0_ldst_is_rs1; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ldst = fp_issue_unit_io_iss_uops_0_ldst; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_lrs1 = fp_issue_unit_io_iss_uops_0_lrs1; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_lrs2 = fp_issue_unit_io_iss_uops_0_lrs2; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_lrs3 = fp_issue_unit_io_iss_uops_0_lrs3; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_ldst_val = fp_issue_unit_io_iss_uops_0_ldst_val; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_dst_rtype = fp_issue_unit_io_iss_uops_0_dst_rtype; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_lrs1_rtype = fp_issue_unit_io_iss_uops_0_lrs1_rtype; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_lrs2_rtype = fp_issue_unit_io_iss_uops_0_lrs2_rtype; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_frs3_en = fp_issue_unit_io_iss_uops_0_frs3_en; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_fp_val = fp_issue_unit_io_iss_uops_0_fp_val; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_fp_single = fp_issue_unit_io_iss_uops_0_fp_single; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_xcpt_pf_if = fp_issue_unit_io_iss_uops_0_xcpt_pf_if; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_xcpt_ae_if = fp_issue_unit_io_iss_uops_0_xcpt_ae_if; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_xcpt_ma_if = fp_issue_unit_io_iss_uops_0_xcpt_ma_if; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_bp_debug_if = fp_issue_unit_io_iss_uops_0_bp_debug_if; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_bp_xcpt_if = fp_issue_unit_io_iss_uops_0_bp_xcpt_if; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_debug_fsrc = fp_issue_unit_io_iss_uops_0_debug_fsrc; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_iss_uops_0_debug_tsrc = fp_issue_unit_io_iss_uops_0_debug_tsrc; // @[fp-pipeline.scala 89:24 fp-pipeline.scala 119:17]
  assign fregister_read_io_rf_read_ports_0_data = fregfile_io_read_ports_0_data; // @[fp-pipeline.scala 145:35]
  assign fregister_read_io_rf_read_ports_1_data = fregfile_io_read_ports_1_data; // @[fp-pipeline.scala 145:35]
  assign fregister_read_io_rf_read_ports_2_data = fregfile_io_read_ports_2_data; // @[fp-pipeline.scala 145:35]
  assign fregister_read_io_prf_read_ports_0_data = 1'h0; // @[fp-pipeline.scala 146:60]
  assign fregister_read_io_exe_reqs_0_ready = fpiu_unit_io_req_ready; // @[fp-pipeline.scala 161:15]
  assign fregister_read_io_kill = io_flush_pipeline; // @[fp-pipeline.scala 152:26]
  assign fregister_read_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[fp-pipeline.scala 151:30]
  assign fregister_read_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[fp-pipeline.scala 151:30]
  assign ll_wbarb_clock = clock;
  assign ll_wbarb_reset = reset;
  assign ll_wbarb_io_in_0_valid = io_ll_wports_0_valid; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_uopc = io_ll_wports_0_bits_uop_uopc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_inst = io_ll_wports_0_bits_uop_inst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_debug_inst = io_ll_wports_0_bits_uop_debug_inst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_is_rvc = io_ll_wports_0_bits_uop_is_rvc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_debug_pc = io_ll_wports_0_bits_uop_debug_pc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_iq_type = io_ll_wports_0_bits_uop_iq_type; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_fu_code = io_ll_wports_0_bits_uop_fu_code; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ctrl_br_type = io_ll_wports_0_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ctrl_op1_sel = io_ll_wports_0_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ctrl_op2_sel = io_ll_wports_0_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ctrl_imm_sel = io_ll_wports_0_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ctrl_op_fcn = io_ll_wports_0_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ctrl_fcn_dw = io_ll_wports_0_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ctrl_csr_cmd = io_ll_wports_0_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ctrl_is_load = io_ll_wports_0_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ctrl_is_sta = io_ll_wports_0_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ctrl_is_std = io_ll_wports_0_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_iw_state = io_ll_wports_0_bits_uop_iw_state; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_iw_p1_poisoned = io_ll_wports_0_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_iw_p2_poisoned = io_ll_wports_0_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_is_br = io_ll_wports_0_bits_uop_is_br; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_is_jalr = io_ll_wports_0_bits_uop_is_jalr; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_is_jal = io_ll_wports_0_bits_uop_is_jal; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_is_sfb = io_ll_wports_0_bits_uop_is_sfb; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_br_mask = io_ll_wports_0_bits_uop_br_mask; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_br_tag = io_ll_wports_0_bits_uop_br_tag; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ftq_idx = io_ll_wports_0_bits_uop_ftq_idx; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_edge_inst = io_ll_wports_0_bits_uop_edge_inst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_pc_lob = io_ll_wports_0_bits_uop_pc_lob; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_taken = io_ll_wports_0_bits_uop_taken; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_imm_packed = io_ll_wports_0_bits_uop_imm_packed; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_csr_addr = io_ll_wports_0_bits_uop_csr_addr; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_rob_idx = io_ll_wports_0_bits_uop_rob_idx; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ldq_idx = io_ll_wports_0_bits_uop_ldq_idx; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_stq_idx = io_ll_wports_0_bits_uop_stq_idx; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_rxq_idx = io_ll_wports_0_bits_uop_rxq_idx; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_pdst = io_ll_wports_0_bits_uop_pdst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_prs1 = io_ll_wports_0_bits_uop_prs1; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_prs2 = io_ll_wports_0_bits_uop_prs2; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_prs3 = io_ll_wports_0_bits_uop_prs3; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ppred = io_ll_wports_0_bits_uop_ppred; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_prs1_busy = io_ll_wports_0_bits_uop_prs1_busy; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_prs2_busy = io_ll_wports_0_bits_uop_prs2_busy; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_prs3_busy = io_ll_wports_0_bits_uop_prs3_busy; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ppred_busy = io_ll_wports_0_bits_uop_ppred_busy; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_stale_pdst = io_ll_wports_0_bits_uop_stale_pdst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_exception = io_ll_wports_0_bits_uop_exception; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_exc_cause = io_ll_wports_0_bits_uop_exc_cause; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_bypassable = io_ll_wports_0_bits_uop_bypassable; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_mem_cmd = io_ll_wports_0_bits_uop_mem_cmd; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_mem_size = io_ll_wports_0_bits_uop_mem_size; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_mem_signed = io_ll_wports_0_bits_uop_mem_signed; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_is_fence = io_ll_wports_0_bits_uop_is_fence; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_is_fencei = io_ll_wports_0_bits_uop_is_fencei; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_is_amo = io_ll_wports_0_bits_uop_is_amo; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_uses_ldq = io_ll_wports_0_bits_uop_uses_ldq; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_uses_stq = io_ll_wports_0_bits_uop_uses_stq; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_is_sys_pc2epc = io_ll_wports_0_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_is_unique = io_ll_wports_0_bits_uop_is_unique; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_flush_on_commit = io_ll_wports_0_bits_uop_flush_on_commit; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ldst_is_rs1 = io_ll_wports_0_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ldst = io_ll_wports_0_bits_uop_ldst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_lrs1 = io_ll_wports_0_bits_uop_lrs1; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_lrs2 = io_ll_wports_0_bits_uop_lrs2; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_lrs3 = io_ll_wports_0_bits_uop_lrs3; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_ldst_val = io_ll_wports_0_bits_uop_ldst_val; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_dst_rtype = io_ll_wports_0_bits_uop_dst_rtype; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_lrs1_rtype = io_ll_wports_0_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_lrs2_rtype = io_ll_wports_0_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_frs3_en = io_ll_wports_0_bits_uop_frs3_en; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_fp_val = io_ll_wports_0_bits_uop_fp_val; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_fp_single = io_ll_wports_0_bits_uop_fp_single; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_xcpt_pf_if = io_ll_wports_0_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_xcpt_ae_if = io_ll_wports_0_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_xcpt_ma_if = io_ll_wports_0_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_bp_debug_if = io_ll_wports_0_bits_uop_bp_debug_if; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_bp_xcpt_if = io_ll_wports_0_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_debug_fsrc = io_ll_wports_0_bits_uop_debug_fsrc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_uop_debug_tsrc = io_ll_wports_0_bits_uop_debug_tsrc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_data = _T_19 ? swizzledNaN : _T_13; // @[FPU.scala 339:8]
  assign ll_wbarb_io_in_0_bits_predicated = io_ll_wports_0_bits_predicated; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_valid = io_ll_wports_0_bits_fflags_valid; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_uopc = io_ll_wports_0_bits_fflags_bits_uop_uopc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_inst = io_ll_wports_0_bits_fflags_bits_uop_inst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_inst = io_ll_wports_0_bits_fflags_bits_uop_debug_inst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_is_rvc = io_ll_wports_0_bits_fflags_bits_uop_is_rvc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_pc = io_ll_wports_0_bits_fflags_bits_uop_debug_pc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_iq_type = io_ll_wports_0_bits_fflags_bits_uop_iq_type; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_fu_code = io_ll_wports_0_bits_fflags_bits_uop_fu_code; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_br_type = io_ll_wports_0_bits_fflags_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_op1_sel = io_ll_wports_0_bits_fflags_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_op2_sel = io_ll_wports_0_bits_fflags_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_imm_sel = io_ll_wports_0_bits_fflags_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_op_fcn = io_ll_wports_0_bits_fflags_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_fcn_dw = io_ll_wports_0_bits_fflags_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_csr_cmd = io_ll_wports_0_bits_fflags_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_is_load = io_ll_wports_0_bits_fflags_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_is_sta = io_ll_wports_0_bits_fflags_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ctrl_is_std = io_ll_wports_0_bits_fflags_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_iw_state = io_ll_wports_0_bits_fflags_bits_uop_iw_state; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_iw_p1_poisoned = io_ll_wports_0_bits_fflags_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_iw_p2_poisoned = io_ll_wports_0_bits_fflags_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_is_br = io_ll_wports_0_bits_fflags_bits_uop_is_br; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_is_jalr = io_ll_wports_0_bits_fflags_bits_uop_is_jalr; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_is_jal = io_ll_wports_0_bits_fflags_bits_uop_is_jal; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_is_sfb = io_ll_wports_0_bits_fflags_bits_uop_is_sfb; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_br_mask = io_ll_wports_0_bits_fflags_bits_uop_br_mask; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_br_tag = io_ll_wports_0_bits_fflags_bits_uop_br_tag; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ftq_idx = io_ll_wports_0_bits_fflags_bits_uop_ftq_idx; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_edge_inst = io_ll_wports_0_bits_fflags_bits_uop_edge_inst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_pc_lob = io_ll_wports_0_bits_fflags_bits_uop_pc_lob; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_taken = io_ll_wports_0_bits_fflags_bits_uop_taken; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_imm_packed = io_ll_wports_0_bits_fflags_bits_uop_imm_packed; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_csr_addr = io_ll_wports_0_bits_fflags_bits_uop_csr_addr; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_rob_idx = io_ll_wports_0_bits_fflags_bits_uop_rob_idx; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ldq_idx = io_ll_wports_0_bits_fflags_bits_uop_ldq_idx; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_stq_idx = io_ll_wports_0_bits_fflags_bits_uop_stq_idx; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_rxq_idx = io_ll_wports_0_bits_fflags_bits_uop_rxq_idx; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_pdst = io_ll_wports_0_bits_fflags_bits_uop_pdst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_prs1 = io_ll_wports_0_bits_fflags_bits_uop_prs1; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_prs2 = io_ll_wports_0_bits_fflags_bits_uop_prs2; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_prs3 = io_ll_wports_0_bits_fflags_bits_uop_prs3; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ppred = io_ll_wports_0_bits_fflags_bits_uop_ppred; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_prs1_busy = io_ll_wports_0_bits_fflags_bits_uop_prs1_busy; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_prs2_busy = io_ll_wports_0_bits_fflags_bits_uop_prs2_busy; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_prs3_busy = io_ll_wports_0_bits_fflags_bits_uop_prs3_busy; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ppred_busy = io_ll_wports_0_bits_fflags_bits_uop_ppred_busy; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_stale_pdst = io_ll_wports_0_bits_fflags_bits_uop_stale_pdst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_exception = io_ll_wports_0_bits_fflags_bits_uop_exception; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_exc_cause = io_ll_wports_0_bits_fflags_bits_uop_exc_cause; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_bypassable = io_ll_wports_0_bits_fflags_bits_uop_bypassable; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_mem_cmd = io_ll_wports_0_bits_fflags_bits_uop_mem_cmd; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_mem_size = io_ll_wports_0_bits_fflags_bits_uop_mem_size; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_mem_signed = io_ll_wports_0_bits_fflags_bits_uop_mem_signed; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_is_fence = io_ll_wports_0_bits_fflags_bits_uop_is_fence; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_is_fencei = io_ll_wports_0_bits_fflags_bits_uop_is_fencei; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_is_amo = io_ll_wports_0_bits_fflags_bits_uop_is_amo; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_uses_ldq = io_ll_wports_0_bits_fflags_bits_uop_uses_ldq; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_uses_stq = io_ll_wports_0_bits_fflags_bits_uop_uses_stq; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_is_sys_pc2epc = io_ll_wports_0_bits_fflags_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_is_unique = io_ll_wports_0_bits_fflags_bits_uop_is_unique; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_flush_on_commit = io_ll_wports_0_bits_fflags_bits_uop_flush_on_commit; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ldst_is_rs1 = io_ll_wports_0_bits_fflags_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ldst = io_ll_wports_0_bits_fflags_bits_uop_ldst; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs1 = io_ll_wports_0_bits_fflags_bits_uop_lrs1; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs2 = io_ll_wports_0_bits_fflags_bits_uop_lrs2; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs3 = io_ll_wports_0_bits_fflags_bits_uop_lrs3; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_ldst_val = io_ll_wports_0_bits_fflags_bits_uop_ldst_val; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_dst_rtype = io_ll_wports_0_bits_fflags_bits_uop_dst_rtype; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs1_rtype = io_ll_wports_0_bits_fflags_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_lrs2_rtype = io_ll_wports_0_bits_fflags_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_frs3_en = io_ll_wports_0_bits_fflags_bits_uop_frs3_en; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_fp_val = io_ll_wports_0_bits_fflags_bits_uop_fp_val; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_fp_single = io_ll_wports_0_bits_fflags_bits_uop_fp_single; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_xcpt_pf_if = io_ll_wports_0_bits_fflags_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_xcpt_ae_if = io_ll_wports_0_bits_fflags_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_xcpt_ma_if = io_ll_wports_0_bits_fflags_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_bp_debug_if = io_ll_wports_0_bits_fflags_bits_uop_bp_debug_if; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_bp_xcpt_if = io_ll_wports_0_bits_fflags_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_fsrc = io_ll_wports_0_bits_fflags_bits_uop_debug_fsrc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_uop_debug_tsrc = io_ll_wports_0_bits_fflags_bits_uop_debug_tsrc; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_0_bits_fflags_bits_flags = io_ll_wports_0_bits_fflags_bits_flags; // @[fp-pipeline.scala 174:21]
  assign ll_wbarb_io_in_1_valid = io_from_int_valid; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_uopc = io_from_int_bits_uop_uopc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_inst = io_from_int_bits_uop_inst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_debug_inst = io_from_int_bits_uop_debug_inst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_is_rvc = io_from_int_bits_uop_is_rvc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_debug_pc = io_from_int_bits_uop_debug_pc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_iq_type = io_from_int_bits_uop_iq_type; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_fu_code = io_from_int_bits_uop_fu_code; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ctrl_br_type = io_from_int_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ctrl_op1_sel = io_from_int_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ctrl_op2_sel = io_from_int_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ctrl_imm_sel = io_from_int_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ctrl_op_fcn = io_from_int_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ctrl_fcn_dw = io_from_int_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ctrl_csr_cmd = io_from_int_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ctrl_is_load = io_from_int_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ctrl_is_sta = io_from_int_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ctrl_is_std = io_from_int_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_iw_state = io_from_int_bits_uop_iw_state; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_iw_p1_poisoned = io_from_int_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_iw_p2_poisoned = io_from_int_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_is_br = io_from_int_bits_uop_is_br; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_is_jalr = io_from_int_bits_uop_is_jalr; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_is_jal = io_from_int_bits_uop_is_jal; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_is_sfb = io_from_int_bits_uop_is_sfb; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_br_mask = io_from_int_bits_uop_br_mask; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_br_tag = io_from_int_bits_uop_br_tag; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ftq_idx = io_from_int_bits_uop_ftq_idx; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_edge_inst = io_from_int_bits_uop_edge_inst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_pc_lob = io_from_int_bits_uop_pc_lob; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_taken = io_from_int_bits_uop_taken; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_imm_packed = io_from_int_bits_uop_imm_packed; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_csr_addr = io_from_int_bits_uop_csr_addr; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_rob_idx = io_from_int_bits_uop_rob_idx; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ldq_idx = io_from_int_bits_uop_ldq_idx; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_stq_idx = io_from_int_bits_uop_stq_idx; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_rxq_idx = io_from_int_bits_uop_rxq_idx; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_pdst = io_from_int_bits_uop_pdst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_prs1 = io_from_int_bits_uop_prs1; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_prs2 = io_from_int_bits_uop_prs2; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_prs3 = io_from_int_bits_uop_prs3; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ppred = io_from_int_bits_uop_ppred; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_prs1_busy = io_from_int_bits_uop_prs1_busy; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_prs2_busy = io_from_int_bits_uop_prs2_busy; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_prs3_busy = io_from_int_bits_uop_prs3_busy; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ppred_busy = io_from_int_bits_uop_ppred_busy; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_stale_pdst = io_from_int_bits_uop_stale_pdst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_exception = io_from_int_bits_uop_exception; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_exc_cause = io_from_int_bits_uop_exc_cause; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_bypassable = io_from_int_bits_uop_bypassable; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_mem_cmd = io_from_int_bits_uop_mem_cmd; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_mem_size = io_from_int_bits_uop_mem_size; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_mem_signed = io_from_int_bits_uop_mem_signed; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_is_fence = io_from_int_bits_uop_is_fence; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_is_fencei = io_from_int_bits_uop_is_fencei; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_is_amo = io_from_int_bits_uop_is_amo; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_uses_ldq = io_from_int_bits_uop_uses_ldq; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_uses_stq = io_from_int_bits_uop_uses_stq; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_is_sys_pc2epc = io_from_int_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_is_unique = io_from_int_bits_uop_is_unique; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_flush_on_commit = io_from_int_bits_uop_flush_on_commit; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ldst_is_rs1 = io_from_int_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ldst = io_from_int_bits_uop_ldst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_lrs1 = io_from_int_bits_uop_lrs1; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_lrs2 = io_from_int_bits_uop_lrs2; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_lrs3 = io_from_int_bits_uop_lrs3; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_ldst_val = io_from_int_bits_uop_ldst_val; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_dst_rtype = io_from_int_bits_uop_dst_rtype; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_lrs1_rtype = io_from_int_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_lrs2_rtype = io_from_int_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_frs3_en = io_from_int_bits_uop_frs3_en; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_fp_val = io_from_int_bits_uop_fp_val; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_fp_single = io_from_int_bits_uop_fp_single; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_xcpt_pf_if = io_from_int_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_xcpt_ae_if = io_from_int_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_xcpt_ma_if = io_from_int_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_bp_debug_if = io_from_int_bits_uop_bp_debug_if; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_bp_xcpt_if = io_from_int_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_debug_fsrc = io_from_int_bits_uop_debug_fsrc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_uop_debug_tsrc = io_from_int_bits_uop_debug_tsrc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_data = io_from_int_bits_data; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_predicated = io_from_int_bits_predicated; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_valid = io_from_int_bits_fflags_valid; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_uopc = io_from_int_bits_fflags_bits_uop_uopc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_inst = io_from_int_bits_fflags_bits_uop_inst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_inst = io_from_int_bits_fflags_bits_uop_debug_inst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_is_rvc = io_from_int_bits_fflags_bits_uop_is_rvc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_pc = io_from_int_bits_fflags_bits_uop_debug_pc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_iq_type = io_from_int_bits_fflags_bits_uop_iq_type; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_fu_code = io_from_int_bits_fflags_bits_uop_fu_code; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_br_type = io_from_int_bits_fflags_bits_uop_ctrl_br_type; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_op1_sel = io_from_int_bits_fflags_bits_uop_ctrl_op1_sel; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_op2_sel = io_from_int_bits_fflags_bits_uop_ctrl_op2_sel; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_imm_sel = io_from_int_bits_fflags_bits_uop_ctrl_imm_sel; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_op_fcn = io_from_int_bits_fflags_bits_uop_ctrl_op_fcn; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_fcn_dw = io_from_int_bits_fflags_bits_uop_ctrl_fcn_dw; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_csr_cmd = io_from_int_bits_fflags_bits_uop_ctrl_csr_cmd; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_is_load = io_from_int_bits_fflags_bits_uop_ctrl_is_load; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_is_sta = io_from_int_bits_fflags_bits_uop_ctrl_is_sta; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ctrl_is_std = io_from_int_bits_fflags_bits_uop_ctrl_is_std; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_iw_state = io_from_int_bits_fflags_bits_uop_iw_state; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_iw_p1_poisoned = io_from_int_bits_fflags_bits_uop_iw_p1_poisoned; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_iw_p2_poisoned = io_from_int_bits_fflags_bits_uop_iw_p2_poisoned; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_is_br = io_from_int_bits_fflags_bits_uop_is_br; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_is_jalr = io_from_int_bits_fflags_bits_uop_is_jalr; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_is_jal = io_from_int_bits_fflags_bits_uop_is_jal; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_is_sfb = io_from_int_bits_fflags_bits_uop_is_sfb; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_br_mask = io_from_int_bits_fflags_bits_uop_br_mask; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_br_tag = io_from_int_bits_fflags_bits_uop_br_tag; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ftq_idx = io_from_int_bits_fflags_bits_uop_ftq_idx; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_edge_inst = io_from_int_bits_fflags_bits_uop_edge_inst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_pc_lob = io_from_int_bits_fflags_bits_uop_pc_lob; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_taken = io_from_int_bits_fflags_bits_uop_taken; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_imm_packed = io_from_int_bits_fflags_bits_uop_imm_packed; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_csr_addr = io_from_int_bits_fflags_bits_uop_csr_addr; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_rob_idx = io_from_int_bits_fflags_bits_uop_rob_idx; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ldq_idx = io_from_int_bits_fflags_bits_uop_ldq_idx; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_stq_idx = io_from_int_bits_fflags_bits_uop_stq_idx; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_rxq_idx = io_from_int_bits_fflags_bits_uop_rxq_idx; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_pdst = io_from_int_bits_fflags_bits_uop_pdst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_prs1 = io_from_int_bits_fflags_bits_uop_prs1; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_prs2 = io_from_int_bits_fflags_bits_uop_prs2; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_prs3 = io_from_int_bits_fflags_bits_uop_prs3; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ppred = io_from_int_bits_fflags_bits_uop_ppred; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_prs1_busy = io_from_int_bits_fflags_bits_uop_prs1_busy; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_prs2_busy = io_from_int_bits_fflags_bits_uop_prs2_busy; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_prs3_busy = io_from_int_bits_fflags_bits_uop_prs3_busy; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ppred_busy = io_from_int_bits_fflags_bits_uop_ppred_busy; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_stale_pdst = io_from_int_bits_fflags_bits_uop_stale_pdst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_exception = io_from_int_bits_fflags_bits_uop_exception; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_exc_cause = io_from_int_bits_fflags_bits_uop_exc_cause; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_bypassable = io_from_int_bits_fflags_bits_uop_bypassable; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_mem_cmd = io_from_int_bits_fflags_bits_uop_mem_cmd; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_mem_size = io_from_int_bits_fflags_bits_uop_mem_size; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_mem_signed = io_from_int_bits_fflags_bits_uop_mem_signed; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_is_fence = io_from_int_bits_fflags_bits_uop_is_fence; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_is_fencei = io_from_int_bits_fflags_bits_uop_is_fencei; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_is_amo = io_from_int_bits_fflags_bits_uop_is_amo; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_uses_ldq = io_from_int_bits_fflags_bits_uop_uses_ldq; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_uses_stq = io_from_int_bits_fflags_bits_uop_uses_stq; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_is_sys_pc2epc = io_from_int_bits_fflags_bits_uop_is_sys_pc2epc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_is_unique = io_from_int_bits_fflags_bits_uop_is_unique; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_flush_on_commit = io_from_int_bits_fflags_bits_uop_flush_on_commit; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ldst_is_rs1 = io_from_int_bits_fflags_bits_uop_ldst_is_rs1; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ldst = io_from_int_bits_fflags_bits_uop_ldst; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs1 = io_from_int_bits_fflags_bits_uop_lrs1; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs2 = io_from_int_bits_fflags_bits_uop_lrs2; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs3 = io_from_int_bits_fflags_bits_uop_lrs3; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_ldst_val = io_from_int_bits_fflags_bits_uop_ldst_val; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_dst_rtype = io_from_int_bits_fflags_bits_uop_dst_rtype; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs1_rtype = io_from_int_bits_fflags_bits_uop_lrs1_rtype; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_lrs2_rtype = io_from_int_bits_fflags_bits_uop_lrs2_rtype; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_frs3_en = io_from_int_bits_fflags_bits_uop_frs3_en; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_fp_val = io_from_int_bits_fflags_bits_uop_fp_val; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_fp_single = io_from_int_bits_fflags_bits_uop_fp_single; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_xcpt_pf_if = io_from_int_bits_fflags_bits_uop_xcpt_pf_if; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_xcpt_ae_if = io_from_int_bits_fflags_bits_uop_xcpt_ae_if; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_xcpt_ma_if = io_from_int_bits_fflags_bits_uop_xcpt_ma_if; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_bp_debug_if = io_from_int_bits_fflags_bits_uop_bp_debug_if; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_bp_xcpt_if = io_from_int_bits_fflags_bits_uop_bp_xcpt_if; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_fsrc = io_from_int_bits_fflags_bits_uop_debug_fsrc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_uop_debug_tsrc = io_from_int_bits_fflags_bits_uop_debug_tsrc; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_in_1_bits_fflags_bits_flags = io_from_int_bits_fflags_bits_flags; // @[fp-pipeline.scala 179:21]
  assign ll_wbarb_io_out_ready = 1'h1; // @[fp-pipeline.scala 229:25]
  always @(posedge clock) begin
    REG <= ~_T_3; // @[fp-pipeline.scala 124:37]
    REG_1_valid <= ll_wbarb_io_out_valid & ll_wbarb_io_out_bits_uop_dst_rtype == 2'h1; // @[regfile.scala 57:35]
    REG_1_bits_addr <= ll_wbarb_io_out_bits_uop_pdst; // @[regfile.scala 55:22 regfile.scala 58:22]
    REG_1_bits_data <= ll_wbarb_io_out_bits_data; // @[regfile.scala 55:22 regfile.scala 59:22]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(ll_wbarb_io_in_0_ready | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at fp-pipeline.scala:187 assert (ll_wbarb.io.in(0).ready) // never backpressure the memory unit.\n"
            ); // @[fp-pipeline.scala 187:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(ll_wbarb_io_in_0_ready | reset)) begin
          $fatal; // @[fp-pipeline.scala 187:10]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_from_int_valid & ~(_T_26 & io_from_int_bits_uop_dst_rtype == 2'h1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at fp-pipeline.scala:188 when (ifpu_resp.valid) { assert (ifpu_resp.bits.uop.rf_wen && ifpu_resp.bits.uop.dst_rtype === RT_FLT) }\n"
            ); // @[fp-pipeline.scala 188:35]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_from_int_valid & ~(_T_26 & io_from_int_bits_uop_dst_rtype == 2'h1 | reset)) begin
          $fatal; // @[fp-pipeline.scala 188:35]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (fpiu_unit_io_fresp_valid & ~(fpiu_unit_io_fresp_ready | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: No backpressuring the FPU\n    at fp-pipeline.scala:204 assert(eu.io.fresp.ready, \"No backpressuring the FPU\")\n"
            ); // @[fp-pipeline.scala 204:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (fpiu_unit_io_fresp_valid & ~(fpiu_unit_io_fresp_ready | reset)) begin
          $fatal; // @[fp-pipeline.scala 204:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (fpiu_unit_io_fresp_valid & ~(_T_32 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: rf_wen must be high here\n    at fp-pipeline.scala:205 assert(eu.io.fresp.bits.uop.rf_wen, \"rf_wen must be high here\")\n"
            ); // @[fp-pipeline.scala 205:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (fpiu_unit_io_fresp_valid & ~(_T_32 | reset)) begin
          $fatal; // @[fp-pipeline.scala 205:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (fpiu_unit_io_fresp_valid & ~(fpiu_unit_io_fresp_bits_uop_dst_rtype == 2'h1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: wb type must be FLT for fpu\n    at fp-pipeline.scala:206 assert(eu.io.fresp.bits.uop.dst_rtype === RT_FLT, \"wb type must be FLT for fpu\")\n"
            ); // @[fp-pipeline.scala 206:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (fpiu_unit_io_fresp_valid & ~(fpiu_unit_io_fresp_bits_uop_dst_rtype == 2'h1 | reset)) begin
          $fatal; // @[fp-pipeline.scala 206:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(fpiu_unit_io_fresp_valid & fpiu_unit_io_fresp_bits_uop_uses_ldq) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at fp-pipeline.scala:248 assert(!(exe_resp.valid && wb_uop.uses_ldq))\n"); // @[fp-pipeline.scala 248:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(fpiu_unit_io_fresp_valid & fpiu_unit_io_fresp_bits_uop_uses_ldq) | reset)) begin
          $fatal; // @[fp-pipeline.scala 248:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(fpiu_unit_io_fresp_valid & fpiu_unit_io_fresp_bits_uop_uses_stq) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at fp-pipeline.scala:249 assert(!(exe_resp.valid && wb_uop.uses_stq))\n"); // @[fp-pipeline.scala 249:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(fpiu_unit_io_fresp_valid & fpiu_unit_io_fresp_bits_uop_uses_stq) | reset)) begin
          $fatal; // @[fp-pipeline.scala 249:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(fpiu_unit_io_fresp_valid & fpiu_unit_io_fresp_bits_uop_is_amo) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at fp-pipeline.scala:250 assert(!(exe_resp.valid && wb_uop.is_amo))\n"); // @[fp-pipeline.scala 250:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(fpiu_unit_io_fresp_valid & fpiu_unit_io_fresp_bits_uop_is_amo) | reset)) begin
          $fatal; // @[fp-pipeline.scala 250:13]
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
  REG = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  REG_1_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  REG_1_bits_addr = _RAND_2[5:0];
  _RAND_3 = {3{`RANDOM}};
  REG_1_bits_data = _RAND_3[64:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
