module FPUExeUnit(
  input         clock,
  input         reset,
  output [9:0]  io_fu_types,
  output        io_req_ready,
  input         io_req_valid,
  input  [6:0]  io_req_bits_uop_uopc,
  input  [31:0] io_req_bits_uop_inst,
  input  [31:0] io_req_bits_uop_debug_inst,
  input         io_req_bits_uop_is_rvc,
  input  [39:0] io_req_bits_uop_debug_pc,
  input  [2:0]  io_req_bits_uop_iq_type,
  input  [9:0]  io_req_bits_uop_fu_code,
  input  [3:0]  io_req_bits_uop_ctrl_br_type,
  input  [1:0]  io_req_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_req_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_req_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_req_bits_uop_ctrl_op_fcn,
  input         io_req_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_req_bits_uop_ctrl_csr_cmd,
  input         io_req_bits_uop_ctrl_is_load,
  input         io_req_bits_uop_ctrl_is_sta,
  input         io_req_bits_uop_ctrl_is_std,
  input  [1:0]  io_req_bits_uop_iw_state,
  input         io_req_bits_uop_iw_p1_poisoned,
  input         io_req_bits_uop_iw_p2_poisoned,
  input         io_req_bits_uop_is_br,
  input         io_req_bits_uop_is_jalr,
  input         io_req_bits_uop_is_jal,
  input         io_req_bits_uop_is_sfb,
  input  [11:0] io_req_bits_uop_br_mask,
  input  [3:0]  io_req_bits_uop_br_tag,
  input  [4:0]  io_req_bits_uop_ftq_idx,
  input         io_req_bits_uop_edge_inst,
  input  [5:0]  io_req_bits_uop_pc_lob,
  input         io_req_bits_uop_taken,
  input  [19:0] io_req_bits_uop_imm_packed,
  input  [11:0] io_req_bits_uop_csr_addr,
  input  [5:0]  io_req_bits_uop_rob_idx,
  input  [3:0]  io_req_bits_uop_ldq_idx,
  input  [3:0]  io_req_bits_uop_stq_idx,
  input  [1:0]  io_req_bits_uop_rxq_idx,
  input  [5:0]  io_req_bits_uop_pdst,
  input  [5:0]  io_req_bits_uop_prs1,
  input  [5:0]  io_req_bits_uop_prs2,
  input  [5:0]  io_req_bits_uop_prs3,
  input  [4:0]  io_req_bits_uop_ppred,
  input         io_req_bits_uop_prs1_busy,
  input         io_req_bits_uop_prs2_busy,
  input         io_req_bits_uop_prs3_busy,
  input         io_req_bits_uop_ppred_busy,
  input  [5:0]  io_req_bits_uop_stale_pdst,
  input         io_req_bits_uop_exception,
  input  [63:0] io_req_bits_uop_exc_cause,
  input         io_req_bits_uop_bypassable,
  input  [4:0]  io_req_bits_uop_mem_cmd,
  input  [1:0]  io_req_bits_uop_mem_size,
  input         io_req_bits_uop_mem_signed,
  input         io_req_bits_uop_is_fence,
  input         io_req_bits_uop_is_fencei,
  input         io_req_bits_uop_is_amo,
  input         io_req_bits_uop_uses_ldq,
  input         io_req_bits_uop_uses_stq,
  input         io_req_bits_uop_is_sys_pc2epc,
  input         io_req_bits_uop_is_unique,
  input         io_req_bits_uop_flush_on_commit,
  input         io_req_bits_uop_ldst_is_rs1,
  input  [5:0]  io_req_bits_uop_ldst,
  input  [5:0]  io_req_bits_uop_lrs1,
  input  [5:0]  io_req_bits_uop_lrs2,
  input  [5:0]  io_req_bits_uop_lrs3,
  input         io_req_bits_uop_ldst_val,
  input  [1:0]  io_req_bits_uop_dst_rtype,
  input  [1:0]  io_req_bits_uop_lrs1_rtype,
  input  [1:0]  io_req_bits_uop_lrs2_rtype,
  input         io_req_bits_uop_frs3_en,
  input         io_req_bits_uop_fp_val,
  input         io_req_bits_uop_fp_single,
  input         io_req_bits_uop_xcpt_pf_if,
  input         io_req_bits_uop_xcpt_ae_if,
  input         io_req_bits_uop_xcpt_ma_if,
  input         io_req_bits_uop_bp_debug_if,
  input         io_req_bits_uop_bp_xcpt_if,
  input  [1:0]  io_req_bits_uop_debug_fsrc,
  input  [1:0]  io_req_bits_uop_debug_tsrc,
  input  [64:0] io_req_bits_rs1_data,
  input  [64:0] io_req_bits_rs2_data,
  input  [64:0] io_req_bits_rs3_data,
  input         io_req_bits_pred_data,
  input         io_req_bits_kill,
  input         io_fresp_ready,
  output        io_fresp_valid,
  output [6:0]  io_fresp_bits_uop_uopc,
  output [31:0] io_fresp_bits_uop_inst,
  output [31:0] io_fresp_bits_uop_debug_inst,
  output        io_fresp_bits_uop_is_rvc,
  output [39:0] io_fresp_bits_uop_debug_pc,
  output [2:0]  io_fresp_bits_uop_iq_type,
  output [9:0]  io_fresp_bits_uop_fu_code,
  output [3:0]  io_fresp_bits_uop_ctrl_br_type,
  output [1:0]  io_fresp_bits_uop_ctrl_op1_sel,
  output [2:0]  io_fresp_bits_uop_ctrl_op2_sel,
  output [2:0]  io_fresp_bits_uop_ctrl_imm_sel,
  output [3:0]  io_fresp_bits_uop_ctrl_op_fcn,
  output        io_fresp_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_fresp_bits_uop_ctrl_csr_cmd,
  output        io_fresp_bits_uop_ctrl_is_load,
  output        io_fresp_bits_uop_ctrl_is_sta,
  output        io_fresp_bits_uop_ctrl_is_std,
  output [1:0]  io_fresp_bits_uop_iw_state,
  output        io_fresp_bits_uop_iw_p1_poisoned,
  output        io_fresp_bits_uop_iw_p2_poisoned,
  output        io_fresp_bits_uop_is_br,
  output        io_fresp_bits_uop_is_jalr,
  output        io_fresp_bits_uop_is_jal,
  output        io_fresp_bits_uop_is_sfb,
  output [11:0] io_fresp_bits_uop_br_mask,
  output [3:0]  io_fresp_bits_uop_br_tag,
  output [4:0]  io_fresp_bits_uop_ftq_idx,
  output        io_fresp_bits_uop_edge_inst,
  output [5:0]  io_fresp_bits_uop_pc_lob,
  output        io_fresp_bits_uop_taken,
  output [19:0] io_fresp_bits_uop_imm_packed,
  output [11:0] io_fresp_bits_uop_csr_addr,
  output [5:0]  io_fresp_bits_uop_rob_idx,
  output [3:0]  io_fresp_bits_uop_ldq_idx,
  output [3:0]  io_fresp_bits_uop_stq_idx,
  output [1:0]  io_fresp_bits_uop_rxq_idx,
  output [5:0]  io_fresp_bits_uop_pdst,
  output [5:0]  io_fresp_bits_uop_prs1,
  output [5:0]  io_fresp_bits_uop_prs2,
  output [5:0]  io_fresp_bits_uop_prs3,
  output [4:0]  io_fresp_bits_uop_ppred,
  output        io_fresp_bits_uop_prs1_busy,
  output        io_fresp_bits_uop_prs2_busy,
  output        io_fresp_bits_uop_prs3_busy,
  output        io_fresp_bits_uop_ppred_busy,
  output [5:0]  io_fresp_bits_uop_stale_pdst,
  output        io_fresp_bits_uop_exception,
  output [63:0] io_fresp_bits_uop_exc_cause,
  output        io_fresp_bits_uop_bypassable,
  output [4:0]  io_fresp_bits_uop_mem_cmd,
  output [1:0]  io_fresp_bits_uop_mem_size,
  output        io_fresp_bits_uop_mem_signed,
  output        io_fresp_bits_uop_is_fence,
  output        io_fresp_bits_uop_is_fencei,
  output        io_fresp_bits_uop_is_amo,
  output        io_fresp_bits_uop_uses_ldq,
  output        io_fresp_bits_uop_uses_stq,
  output        io_fresp_bits_uop_is_sys_pc2epc,
  output        io_fresp_bits_uop_is_unique,
  output        io_fresp_bits_uop_flush_on_commit,
  output        io_fresp_bits_uop_ldst_is_rs1,
  output [5:0]  io_fresp_bits_uop_ldst,
  output [5:0]  io_fresp_bits_uop_lrs1,
  output [5:0]  io_fresp_bits_uop_lrs2,
  output [5:0]  io_fresp_bits_uop_lrs3,
  output        io_fresp_bits_uop_ldst_val,
  output [1:0]  io_fresp_bits_uop_dst_rtype,
  output [1:0]  io_fresp_bits_uop_lrs1_rtype,
  output [1:0]  io_fresp_bits_uop_lrs2_rtype,
  output        io_fresp_bits_uop_frs3_en,
  output        io_fresp_bits_uop_fp_val,
  output        io_fresp_bits_uop_fp_single,
  output        io_fresp_bits_uop_xcpt_pf_if,
  output        io_fresp_bits_uop_xcpt_ae_if,
  output        io_fresp_bits_uop_xcpt_ma_if,
  output        io_fresp_bits_uop_bp_debug_if,
  output        io_fresp_bits_uop_bp_xcpt_if,
  output [1:0]  io_fresp_bits_uop_debug_fsrc,
  output [1:0]  io_fresp_bits_uop_debug_tsrc,
  output [64:0] io_fresp_bits_data,
  output        io_fresp_bits_predicated,
  output        io_fresp_bits_fflags_valid,
  output [6:0]  io_fresp_bits_fflags_bits_uop_uopc,
  output [31:0] io_fresp_bits_fflags_bits_uop_inst,
  output [31:0] io_fresp_bits_fflags_bits_uop_debug_inst,
  output        io_fresp_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_fresp_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_fresp_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_fresp_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_fresp_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_fresp_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_fresp_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_fresp_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_fresp_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_fresp_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_fresp_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_fresp_bits_fflags_bits_uop_ctrl_is_load,
  output        io_fresp_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_fresp_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_fresp_bits_fflags_bits_uop_iw_state,
  output        io_fresp_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_fresp_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_fresp_bits_fflags_bits_uop_is_br,
  output        io_fresp_bits_fflags_bits_uop_is_jalr,
  output        io_fresp_bits_fflags_bits_uop_is_jal,
  output        io_fresp_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_fresp_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_fresp_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_fresp_bits_fflags_bits_uop_ftq_idx,
  output        io_fresp_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_fresp_bits_fflags_bits_uop_pc_lob,
  output        io_fresp_bits_fflags_bits_uop_taken,
  output [19:0] io_fresp_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_fresp_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_fresp_bits_fflags_bits_uop_rob_idx,
  output [3:0]  io_fresp_bits_fflags_bits_uop_ldq_idx,
  output [3:0]  io_fresp_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_fresp_bits_fflags_bits_uop_rxq_idx,
  output [5:0]  io_fresp_bits_fflags_bits_uop_pdst,
  output [5:0]  io_fresp_bits_fflags_bits_uop_prs1,
  output [5:0]  io_fresp_bits_fflags_bits_uop_prs2,
  output [5:0]  io_fresp_bits_fflags_bits_uop_prs3,
  output [4:0]  io_fresp_bits_fflags_bits_uop_ppred,
  output        io_fresp_bits_fflags_bits_uop_prs1_busy,
  output        io_fresp_bits_fflags_bits_uop_prs2_busy,
  output        io_fresp_bits_fflags_bits_uop_prs3_busy,
  output        io_fresp_bits_fflags_bits_uop_ppred_busy,
  output [5:0]  io_fresp_bits_fflags_bits_uop_stale_pdst,
  output        io_fresp_bits_fflags_bits_uop_exception,
  output [63:0] io_fresp_bits_fflags_bits_uop_exc_cause,
  output        io_fresp_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_fresp_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_fresp_bits_fflags_bits_uop_mem_size,
  output        io_fresp_bits_fflags_bits_uop_mem_signed,
  output        io_fresp_bits_fflags_bits_uop_is_fence,
  output        io_fresp_bits_fflags_bits_uop_is_fencei,
  output        io_fresp_bits_fflags_bits_uop_is_amo,
  output        io_fresp_bits_fflags_bits_uop_uses_ldq,
  output        io_fresp_bits_fflags_bits_uop_uses_stq,
  output        io_fresp_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_fresp_bits_fflags_bits_uop_is_unique,
  output        io_fresp_bits_fflags_bits_uop_flush_on_commit,
  output        io_fresp_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_fresp_bits_fflags_bits_uop_ldst,
  output [5:0]  io_fresp_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_fresp_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_fresp_bits_fflags_bits_uop_lrs3,
  output        io_fresp_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_fresp_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_fresp_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_fresp_bits_fflags_bits_uop_lrs2_rtype,
  output        io_fresp_bits_fflags_bits_uop_frs3_en,
  output        io_fresp_bits_fflags_bits_uop_fp_val,
  output        io_fresp_bits_fflags_bits_uop_fp_single,
  output        io_fresp_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_fresp_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_fresp_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_fresp_bits_fflags_bits_uop_bp_debug_if,
  output        io_fresp_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_fresp_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_fresp_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_fresp_bits_fflags_bits_flags,
  input         io_ll_iresp_ready,
  output        io_ll_iresp_valid,
  output [6:0]  io_ll_iresp_bits_uop_uopc,
  output [31:0] io_ll_iresp_bits_uop_inst,
  output [31:0] io_ll_iresp_bits_uop_debug_inst,
  output        io_ll_iresp_bits_uop_is_rvc,
  output [39:0] io_ll_iresp_bits_uop_debug_pc,
  output [2:0]  io_ll_iresp_bits_uop_iq_type,
  output [9:0]  io_ll_iresp_bits_uop_fu_code,
  output [3:0]  io_ll_iresp_bits_uop_ctrl_br_type,
  output [1:0]  io_ll_iresp_bits_uop_ctrl_op1_sel,
  output [2:0]  io_ll_iresp_bits_uop_ctrl_op2_sel,
  output [2:0]  io_ll_iresp_bits_uop_ctrl_imm_sel,
  output [3:0]  io_ll_iresp_bits_uop_ctrl_op_fcn,
  output        io_ll_iresp_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_ll_iresp_bits_uop_ctrl_csr_cmd,
  output        io_ll_iresp_bits_uop_ctrl_is_load,
  output        io_ll_iresp_bits_uop_ctrl_is_sta,
  output        io_ll_iresp_bits_uop_ctrl_is_std,
  output [1:0]  io_ll_iresp_bits_uop_iw_state,
  output        io_ll_iresp_bits_uop_iw_p1_poisoned,
  output        io_ll_iresp_bits_uop_iw_p2_poisoned,
  output        io_ll_iresp_bits_uop_is_br,
  output        io_ll_iresp_bits_uop_is_jalr,
  output        io_ll_iresp_bits_uop_is_jal,
  output        io_ll_iresp_bits_uop_is_sfb,
  output [11:0] io_ll_iresp_bits_uop_br_mask,
  output [3:0]  io_ll_iresp_bits_uop_br_tag,
  output [4:0]  io_ll_iresp_bits_uop_ftq_idx,
  output        io_ll_iresp_bits_uop_edge_inst,
  output [5:0]  io_ll_iresp_bits_uop_pc_lob,
  output        io_ll_iresp_bits_uop_taken,
  output [19:0] io_ll_iresp_bits_uop_imm_packed,
  output [11:0] io_ll_iresp_bits_uop_csr_addr,
  output [5:0]  io_ll_iresp_bits_uop_rob_idx,
  output [3:0]  io_ll_iresp_bits_uop_ldq_idx,
  output [3:0]  io_ll_iresp_bits_uop_stq_idx,
  output [1:0]  io_ll_iresp_bits_uop_rxq_idx,
  output [5:0]  io_ll_iresp_bits_uop_pdst,
  output [5:0]  io_ll_iresp_bits_uop_prs1,
  output [5:0]  io_ll_iresp_bits_uop_prs2,
  output [5:0]  io_ll_iresp_bits_uop_prs3,
  output [4:0]  io_ll_iresp_bits_uop_ppred,
  output        io_ll_iresp_bits_uop_prs1_busy,
  output        io_ll_iresp_bits_uop_prs2_busy,
  output        io_ll_iresp_bits_uop_prs3_busy,
  output        io_ll_iresp_bits_uop_ppred_busy,
  output [5:0]  io_ll_iresp_bits_uop_stale_pdst,
  output        io_ll_iresp_bits_uop_exception,
  output [63:0] io_ll_iresp_bits_uop_exc_cause,
  output        io_ll_iresp_bits_uop_bypassable,
  output [4:0]  io_ll_iresp_bits_uop_mem_cmd,
  output [1:0]  io_ll_iresp_bits_uop_mem_size,
  output        io_ll_iresp_bits_uop_mem_signed,
  output        io_ll_iresp_bits_uop_is_fence,
  output        io_ll_iresp_bits_uop_is_fencei,
  output        io_ll_iresp_bits_uop_is_amo,
  output        io_ll_iresp_bits_uop_uses_ldq,
  output        io_ll_iresp_bits_uop_uses_stq,
  output        io_ll_iresp_bits_uop_is_sys_pc2epc,
  output        io_ll_iresp_bits_uop_is_unique,
  output        io_ll_iresp_bits_uop_flush_on_commit,
  output        io_ll_iresp_bits_uop_ldst_is_rs1,
  output [5:0]  io_ll_iresp_bits_uop_ldst,
  output [5:0]  io_ll_iresp_bits_uop_lrs1,
  output [5:0]  io_ll_iresp_bits_uop_lrs2,
  output [5:0]  io_ll_iresp_bits_uop_lrs3,
  output        io_ll_iresp_bits_uop_ldst_val,
  output [1:0]  io_ll_iresp_bits_uop_dst_rtype,
  output [1:0]  io_ll_iresp_bits_uop_lrs1_rtype,
  output [1:0]  io_ll_iresp_bits_uop_lrs2_rtype,
  output        io_ll_iresp_bits_uop_frs3_en,
  output        io_ll_iresp_bits_uop_fp_val,
  output        io_ll_iresp_bits_uop_fp_single,
  output        io_ll_iresp_bits_uop_xcpt_pf_if,
  output        io_ll_iresp_bits_uop_xcpt_ae_if,
  output        io_ll_iresp_bits_uop_xcpt_ma_if,
  output        io_ll_iresp_bits_uop_bp_debug_if,
  output        io_ll_iresp_bits_uop_bp_xcpt_if,
  output [1:0]  io_ll_iresp_bits_uop_debug_fsrc,
  output [1:0]  io_ll_iresp_bits_uop_debug_tsrc,
  output [64:0] io_ll_iresp_bits_data,
  output        io_ll_iresp_bits_predicated,
  output        io_ll_iresp_bits_fflags_valid,
  output [6:0]  io_ll_iresp_bits_fflags_bits_uop_uopc,
  output [31:0] io_ll_iresp_bits_fflags_bits_uop_inst,
  output [31:0] io_ll_iresp_bits_fflags_bits_uop_debug_inst,
  output        io_ll_iresp_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_ll_iresp_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_ll_iresp_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_ll_iresp_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_ll_iresp_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_ll_iresp_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_ll_iresp_bits_fflags_bits_uop_ctrl_is_load,
  output        io_ll_iresp_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_ll_iresp_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_iw_state,
  output        io_ll_iresp_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_ll_iresp_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_ll_iresp_bits_fflags_bits_uop_is_br,
  output        io_ll_iresp_bits_fflags_bits_uop_is_jalr,
  output        io_ll_iresp_bits_fflags_bits_uop_is_jal,
  output        io_ll_iresp_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_ll_iresp_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_ll_iresp_bits_fflags_bits_uop_ftq_idx,
  output        io_ll_iresp_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_pc_lob,
  output        io_ll_iresp_bits_fflags_bits_uop_taken,
  output [19:0] io_ll_iresp_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_ll_iresp_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_rob_idx,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_ldq_idx,
  output [3:0]  io_ll_iresp_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_rxq_idx,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_pdst,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_prs1,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_prs2,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_prs3,
  output [4:0]  io_ll_iresp_bits_fflags_bits_uop_ppred,
  output        io_ll_iresp_bits_fflags_bits_uop_prs1_busy,
  output        io_ll_iresp_bits_fflags_bits_uop_prs2_busy,
  output        io_ll_iresp_bits_fflags_bits_uop_prs3_busy,
  output        io_ll_iresp_bits_fflags_bits_uop_ppred_busy,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_stale_pdst,
  output        io_ll_iresp_bits_fflags_bits_uop_exception,
  output [63:0] io_ll_iresp_bits_fflags_bits_uop_exc_cause,
  output        io_ll_iresp_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_ll_iresp_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_mem_size,
  output        io_ll_iresp_bits_fflags_bits_uop_mem_signed,
  output        io_ll_iresp_bits_fflags_bits_uop_is_fence,
  output        io_ll_iresp_bits_fflags_bits_uop_is_fencei,
  output        io_ll_iresp_bits_fflags_bits_uop_is_amo,
  output        io_ll_iresp_bits_fflags_bits_uop_uses_ldq,
  output        io_ll_iresp_bits_fflags_bits_uop_uses_stq,
  output        io_ll_iresp_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_ll_iresp_bits_fflags_bits_uop_is_unique,
  output        io_ll_iresp_bits_fflags_bits_uop_flush_on_commit,
  output        io_ll_iresp_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_ldst,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_ll_iresp_bits_fflags_bits_uop_lrs3,
  output        io_ll_iresp_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_lrs2_rtype,
  output        io_ll_iresp_bits_fflags_bits_uop_frs3_en,
  output        io_ll_iresp_bits_fflags_bits_uop_fp_val,
  output        io_ll_iresp_bits_fflags_bits_uop_fp_single,
  output        io_ll_iresp_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_ll_iresp_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_ll_iresp_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_ll_iresp_bits_fflags_bits_uop_bp_debug_if,
  output        io_ll_iresp_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_ll_iresp_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_ll_iresp_bits_fflags_bits_flags,
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
  input  [2:0]  io_fcsr_rm
);
  wire  fpu_clock; // @[execution-unit.scala 468:17]
  wire  fpu_reset; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_ready; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_valid; // @[execution-unit.scala 468:17]
  wire [6:0] fpu_io_req_bits_uop_uopc; // @[execution-unit.scala 468:17]
  wire [31:0] fpu_io_req_bits_uop_inst; // @[execution-unit.scala 468:17]
  wire [31:0] fpu_io_req_bits_uop_debug_inst; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_is_rvc; // @[execution-unit.scala 468:17]
  wire [39:0] fpu_io_req_bits_uop_debug_pc; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_req_bits_uop_iq_type; // @[execution-unit.scala 468:17]
  wire [9:0] fpu_io_req_bits_uop_fu_code; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_req_bits_uop_iw_state; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_is_br; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_is_jalr; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_is_jal; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_is_sfb; // @[execution-unit.scala 468:17]
  wire [11:0] fpu_io_req_bits_uop_br_mask; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_req_bits_uop_br_tag; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_req_bits_uop_ftq_idx; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_edge_inst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_req_bits_uop_pc_lob; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_taken; // @[execution-unit.scala 468:17]
  wire [19:0] fpu_io_req_bits_uop_imm_packed; // @[execution-unit.scala 468:17]
  wire [11:0] fpu_io_req_bits_uop_csr_addr; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_req_bits_uop_rob_idx; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_req_bits_uop_ldq_idx; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_req_bits_uop_stq_idx; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_req_bits_uop_rxq_idx; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_req_bits_uop_pdst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_req_bits_uop_prs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_req_bits_uop_prs2; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_req_bits_uop_prs3; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_req_bits_uop_ppred; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_prs1_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_prs2_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_prs3_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_ppred_busy; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_req_bits_uop_stale_pdst; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_exception; // @[execution-unit.scala 468:17]
  wire [63:0] fpu_io_req_bits_uop_exc_cause; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_bypassable; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_req_bits_uop_mem_cmd; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_req_bits_uop_mem_size; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_mem_signed; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_is_fence; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_is_fencei; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_is_amo; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_uses_ldq; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_uses_stq; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_is_unique; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_req_bits_uop_ldst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_req_bits_uop_lrs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_req_bits_uop_lrs2; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_req_bits_uop_lrs3; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_ldst_val; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_req_bits_uop_dst_rtype; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_frs3_en; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_fp_val; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_fp_single; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 468:17]
  wire [64:0] fpu_io_req_bits_rs1_data; // @[execution-unit.scala 468:17]
  wire [64:0] fpu_io_req_bits_rs2_data; // @[execution-unit.scala 468:17]
  wire [64:0] fpu_io_req_bits_rs3_data; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_pred_data; // @[execution-unit.scala 468:17]
  wire  fpu_io_req_bits_kill; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_ready; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_valid; // @[execution-unit.scala 468:17]
  wire [6:0] fpu_io_resp_bits_uop_uopc; // @[execution-unit.scala 468:17]
  wire [31:0] fpu_io_resp_bits_uop_inst; // @[execution-unit.scala 468:17]
  wire [31:0] fpu_io_resp_bits_uop_debug_inst; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_is_rvc; // @[execution-unit.scala 468:17]
  wire [39:0] fpu_io_resp_bits_uop_debug_pc; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_resp_bits_uop_iq_type; // @[execution-unit.scala 468:17]
  wire [9:0] fpu_io_resp_bits_uop_fu_code; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_resp_bits_uop_ctrl_br_type; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_resp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_resp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_resp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_ctrl_is_load; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_ctrl_is_std; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_uop_iw_state; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_is_br; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_is_jalr; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_is_jal; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_is_sfb; // @[execution-unit.scala 468:17]
  wire [11:0] fpu_io_resp_bits_uop_br_mask; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_resp_bits_uop_br_tag; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_resp_bits_uop_ftq_idx; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_edge_inst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_uop_pc_lob; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_taken; // @[execution-unit.scala 468:17]
  wire [19:0] fpu_io_resp_bits_uop_imm_packed; // @[execution-unit.scala 468:17]
  wire [11:0] fpu_io_resp_bits_uop_csr_addr; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_uop_rob_idx; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_resp_bits_uop_ldq_idx; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_resp_bits_uop_stq_idx; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_uop_rxq_idx; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_uop_pdst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_uop_prs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_uop_prs2; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_uop_prs3; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_resp_bits_uop_ppred; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_prs1_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_prs2_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_prs3_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_ppred_busy; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_uop_stale_pdst; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_exception; // @[execution-unit.scala 468:17]
  wire [63:0] fpu_io_resp_bits_uop_exc_cause; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_bypassable; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_resp_bits_uop_mem_cmd; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_uop_mem_size; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_mem_signed; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_is_fence; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_is_fencei; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_is_amo; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_uses_ldq; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_uses_stq; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_is_unique; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_flush_on_commit; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_uop_ldst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_uop_lrs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_uop_lrs2; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_uop_lrs3; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_ldst_val; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_uop_dst_rtype; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_uop_lrs1_rtype; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_uop_lrs2_rtype; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_frs3_en; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_fp_val; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_fp_single; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_bp_debug_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_uop_debug_fsrc; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_uop_debug_tsrc; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_predicated; // @[execution-unit.scala 468:17]
  wire [64:0] fpu_io_resp_bits_data; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_valid; // @[execution-unit.scala 468:17]
  wire [6:0] fpu_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 468:17]
  wire [31:0] fpu_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 468:17]
  wire [31:0] fpu_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 468:17]
  wire [39:0] fpu_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 468:17]
  wire [9:0] fpu_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 468:17]
  wire [11:0] fpu_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 468:17]
  wire [19:0] fpu_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 468:17]
  wire [11:0] fpu_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 468:17]
  wire [63:0] fpu_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 468:17]
  wire [39:0] fpu_io_resp_bits_addr; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_mxcpt_valid; // @[execution-unit.scala 468:17]
  wire [16:0] fpu_io_resp_bits_mxcpt_bits; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_sfence_valid; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_sfence_bits_rs1; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_sfence_bits_rs2; // @[execution-unit.scala 468:17]
  wire [38:0] fpu_io_resp_bits_sfence_bits_addr; // @[execution-unit.scala 468:17]
  wire  fpu_io_resp_bits_sfence_bits_asid; // @[execution-unit.scala 468:17]
  wire [11:0] fpu_io_brupdate_b1_resolve_mask; // @[execution-unit.scala 468:17]
  wire [11:0] fpu_io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 468:17]
  wire [6:0] fpu_io_brupdate_b2_uop_uopc; // @[execution-unit.scala 468:17]
  wire [31:0] fpu_io_brupdate_b2_uop_inst; // @[execution-unit.scala 468:17]
  wire [31:0] fpu_io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 468:17]
  wire [39:0] fpu_io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 468:17]
  wire [9:0] fpu_io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_is_br; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 468:17]
  wire [11:0] fpu_io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_taken; // @[execution-unit.scala 468:17]
  wire [19:0] fpu_io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 468:17]
  wire [11:0] fpu_io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 468:17]
  wire [3:0] fpu_io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_brupdate_b2_uop_pdst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_brupdate_b2_uop_prs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_brupdate_b2_uop_prs2; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_brupdate_b2_uop_prs3; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_brupdate_b2_uop_ppred; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_exception; // @[execution-unit.scala 468:17]
  wire [63:0] fpu_io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 468:17]
  wire [4:0] fpu_io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_brupdate_b2_uop_ldst; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 468:17]
  wire [5:0] fpu_io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_valid; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_mispredict; // @[execution-unit.scala 468:17]
  wire  fpu_io_brupdate_b2_taken; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_brupdate_b2_cfi_type; // @[execution-unit.scala 468:17]
  wire [1:0] fpu_io_brupdate_b2_pc_sel; // @[execution-unit.scala 468:17]
  wire [39:0] fpu_io_brupdate_b2_jalr_target; // @[execution-unit.scala 468:17]
  wire [20:0] fpu_io_brupdate_b2_target_offset; // @[execution-unit.scala 468:17]
  wire [2:0] fpu_io_fcsr_rm; // @[execution-unit.scala 468:17]
  wire  fdivsqrt_clock; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_reset; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_ready; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_valid; // @[execution-unit.scala 493:22]
  wire [6:0] fdivsqrt_io_req_bits_uop_uopc; // @[execution-unit.scala 493:22]
  wire [31:0] fdivsqrt_io_req_bits_uop_inst; // @[execution-unit.scala 493:22]
  wire [31:0] fdivsqrt_io_req_bits_uop_debug_inst; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_is_rvc; // @[execution-unit.scala 493:22]
  wire [39:0] fdivsqrt_io_req_bits_uop_debug_pc; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_req_bits_uop_iq_type; // @[execution-unit.scala 493:22]
  wire [9:0] fdivsqrt_io_req_bits_uop_fu_code; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_req_bits_uop_iw_state; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_is_br; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_is_jalr; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_is_jal; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_is_sfb; // @[execution-unit.scala 493:22]
  wire [11:0] fdivsqrt_io_req_bits_uop_br_mask; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_req_bits_uop_br_tag; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_req_bits_uop_ftq_idx; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_edge_inst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_req_bits_uop_pc_lob; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_taken; // @[execution-unit.scala 493:22]
  wire [19:0] fdivsqrt_io_req_bits_uop_imm_packed; // @[execution-unit.scala 493:22]
  wire [11:0] fdivsqrt_io_req_bits_uop_csr_addr; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_req_bits_uop_rob_idx; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_req_bits_uop_ldq_idx; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_req_bits_uop_stq_idx; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_req_bits_uop_rxq_idx; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_req_bits_uop_pdst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_req_bits_uop_prs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_req_bits_uop_prs2; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_req_bits_uop_prs3; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_req_bits_uop_ppred; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_prs1_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_prs2_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_prs3_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_ppred_busy; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_req_bits_uop_stale_pdst; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_exception; // @[execution-unit.scala 493:22]
  wire [63:0] fdivsqrt_io_req_bits_uop_exc_cause; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_bypassable; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_req_bits_uop_mem_cmd; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_req_bits_uop_mem_size; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_mem_signed; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_is_fence; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_is_fencei; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_is_amo; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_uses_ldq; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_uses_stq; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_is_unique; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_req_bits_uop_ldst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_req_bits_uop_lrs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_req_bits_uop_lrs2; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_req_bits_uop_lrs3; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_ldst_val; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_req_bits_uop_dst_rtype; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_frs3_en; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_fp_val; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_fp_single; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 493:22]
  wire [64:0] fdivsqrt_io_req_bits_rs1_data; // @[execution-unit.scala 493:22]
  wire [64:0] fdivsqrt_io_req_bits_rs2_data; // @[execution-unit.scala 493:22]
  wire [64:0] fdivsqrt_io_req_bits_rs3_data; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_pred_data; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_req_bits_kill; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_ready; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_valid; // @[execution-unit.scala 493:22]
  wire [6:0] fdivsqrt_io_resp_bits_uop_uopc; // @[execution-unit.scala 493:22]
  wire [31:0] fdivsqrt_io_resp_bits_uop_inst; // @[execution-unit.scala 493:22]
  wire [31:0] fdivsqrt_io_resp_bits_uop_debug_inst; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_is_rvc; // @[execution-unit.scala 493:22]
  wire [39:0] fdivsqrt_io_resp_bits_uop_debug_pc; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_resp_bits_uop_iq_type; // @[execution-unit.scala 493:22]
  wire [9:0] fdivsqrt_io_resp_bits_uop_fu_code; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_resp_bits_uop_ctrl_br_type; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_resp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_resp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_resp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_ctrl_is_load; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_ctrl_is_std; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_uop_iw_state; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_is_br; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_is_jalr; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_is_jal; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_is_sfb; // @[execution-unit.scala 493:22]
  wire [11:0] fdivsqrt_io_resp_bits_uop_br_mask; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_resp_bits_uop_br_tag; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_resp_bits_uop_ftq_idx; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_edge_inst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_uop_pc_lob; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_taken; // @[execution-unit.scala 493:22]
  wire [19:0] fdivsqrt_io_resp_bits_uop_imm_packed; // @[execution-unit.scala 493:22]
  wire [11:0] fdivsqrt_io_resp_bits_uop_csr_addr; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_uop_rob_idx; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_resp_bits_uop_ldq_idx; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_resp_bits_uop_stq_idx; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_uop_rxq_idx; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_uop_pdst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_uop_prs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_uop_prs2; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_uop_prs3; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_resp_bits_uop_ppred; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_prs1_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_prs2_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_prs3_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_ppred_busy; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_uop_stale_pdst; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_exception; // @[execution-unit.scala 493:22]
  wire [63:0] fdivsqrt_io_resp_bits_uop_exc_cause; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_bypassable; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_resp_bits_uop_mem_cmd; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_uop_mem_size; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_mem_signed; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_is_fence; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_is_fencei; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_is_amo; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_uses_ldq; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_uses_stq; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_is_unique; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_flush_on_commit; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_uop_ldst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_uop_lrs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_uop_lrs2; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_uop_lrs3; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_ldst_val; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_uop_dst_rtype; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_uop_lrs1_rtype; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_uop_lrs2_rtype; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_frs3_en; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_fp_val; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_fp_single; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_bp_debug_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_uop_debug_fsrc; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_uop_debug_tsrc; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_predicated; // @[execution-unit.scala 493:22]
  wire [64:0] fdivsqrt_io_resp_bits_data; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_valid; // @[execution-unit.scala 493:22]
  wire [6:0] fdivsqrt_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 493:22]
  wire [31:0] fdivsqrt_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 493:22]
  wire [31:0] fdivsqrt_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 493:22]
  wire [39:0] fdivsqrt_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 493:22]
  wire [9:0] fdivsqrt_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 493:22]
  wire [11:0] fdivsqrt_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 493:22]
  wire [19:0] fdivsqrt_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 493:22]
  wire [11:0] fdivsqrt_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 493:22]
  wire [63:0] fdivsqrt_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 493:22]
  wire [39:0] fdivsqrt_io_resp_bits_addr; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_mxcpt_valid; // @[execution-unit.scala 493:22]
  wire [16:0] fdivsqrt_io_resp_bits_mxcpt_bits; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_sfence_valid; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_sfence_bits_rs1; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_sfence_bits_rs2; // @[execution-unit.scala 493:22]
  wire [38:0] fdivsqrt_io_resp_bits_sfence_bits_addr; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_resp_bits_sfence_bits_asid; // @[execution-unit.scala 493:22]
  wire [11:0] fdivsqrt_io_brupdate_b1_resolve_mask; // @[execution-unit.scala 493:22]
  wire [11:0] fdivsqrt_io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 493:22]
  wire [6:0] fdivsqrt_io_brupdate_b2_uop_uopc; // @[execution-unit.scala 493:22]
  wire [31:0] fdivsqrt_io_brupdate_b2_uop_inst; // @[execution-unit.scala 493:22]
  wire [31:0] fdivsqrt_io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 493:22]
  wire [39:0] fdivsqrt_io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 493:22]
  wire [9:0] fdivsqrt_io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_is_br; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 493:22]
  wire [11:0] fdivsqrt_io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_taken; // @[execution-unit.scala 493:22]
  wire [19:0] fdivsqrt_io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 493:22]
  wire [11:0] fdivsqrt_io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 493:22]
  wire [3:0] fdivsqrt_io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_brupdate_b2_uop_pdst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_brupdate_b2_uop_prs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_brupdate_b2_uop_prs2; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_brupdate_b2_uop_prs3; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_brupdate_b2_uop_ppred; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_exception; // @[execution-unit.scala 493:22]
  wire [63:0] fdivsqrt_io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 493:22]
  wire [4:0] fdivsqrt_io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_brupdate_b2_uop_ldst; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 493:22]
  wire [5:0] fdivsqrt_io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_valid; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_mispredict; // @[execution-unit.scala 493:22]
  wire  fdivsqrt_io_brupdate_b2_taken; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_brupdate_b2_cfi_type; // @[execution-unit.scala 493:22]
  wire [1:0] fdivsqrt_io_brupdate_b2_pc_sel; // @[execution-unit.scala 493:22]
  wire [39:0] fdivsqrt_io_brupdate_b2_jalr_target; // @[execution-unit.scala 493:22]
  wire [20:0] fdivsqrt_io_brupdate_b2_target_offset; // @[execution-unit.scala 493:22]
  wire [2:0] fdivsqrt_io_fcsr_rm; // @[execution-unit.scala 493:22]
  wire  BranchKillableQueue_clock; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_reset; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_ready; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_valid; // @[execution-unit.scala 528:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_uop_uopc; // @[execution-unit.scala 528:23]
  wire [31:0] BranchKillableQueue_io_enq_bits_uop_inst; // @[execution-unit.scala 528:23]
  wire [31:0] BranchKillableQueue_io_enq_bits_uop_debug_inst; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_rvc; // @[execution-unit.scala 528:23]
  wire [39:0] BranchKillableQueue_io_enq_bits_uop_debug_pc; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_uop_iq_type; // @[execution-unit.scala 528:23]
  wire [9:0] BranchKillableQueue_io_enq_bits_uop_fu_code; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_ctrl_br_type; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ctrl_is_load; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ctrl_is_sta; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ctrl_is_std; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_iw_state; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_br; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_jalr; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_jal; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_sfb; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_enq_bits_uop_br_mask; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_br_tag; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_uop_ftq_idx; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_edge_inst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_pc_lob; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_taken; // @[execution-unit.scala 528:23]
  wire [19:0] BranchKillableQueue_io_enq_bits_uop_imm_packed; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_enq_bits_uop_csr_addr; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_rob_idx; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_ldq_idx; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_uop_stq_idx; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_rxq_idx; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_pdst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_prs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_prs2; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_prs3; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_uop_ppred; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_prs1_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_prs2_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_prs3_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ppred_busy; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_stale_pdst; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_exception; // @[execution-unit.scala 528:23]
  wire [63:0] BranchKillableQueue_io_enq_bits_uop_exc_cause; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_bypassable; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_uop_mem_cmd; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_mem_size; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_mem_signed; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_fence; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_fencei; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_amo; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_uses_ldq; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_uses_stq; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_is_unique; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_flush_on_commit; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ldst_is_rs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_ldst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_lrs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_lrs2; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_uop_lrs3; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_ldst_val; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_dst_rtype; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_lrs1_rtype; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_lrs2_rtype; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_frs3_en; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_fp_val; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_fp_single; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_xcpt_pf_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_xcpt_ae_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_xcpt_ma_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_bp_debug_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_uop_bp_xcpt_if; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_debug_fsrc; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_uop_debug_tsrc; // @[execution-unit.scala 528:23]
  wire [64:0] BranchKillableQueue_io_enq_bits_data; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_predicated; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_valid; // @[execution-unit.scala 528:23]
  wire [6:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 528:23]
  wire [31:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_inst; // @[execution-unit.scala 528:23]
  wire [31:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 528:23]
  wire [39:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 528:23]
  wire [9:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_taken; // @[execution-unit.scala 528:23]
  wire [19:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_exception; // @[execution-unit.scala 528:23]
  wire [63:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_enq_bits_fflags_bits_flags; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_ready; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_valid; // @[execution-unit.scala 528:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_uop_uopc; // @[execution-unit.scala 528:23]
  wire [31:0] BranchKillableQueue_io_deq_bits_uop_inst; // @[execution-unit.scala 528:23]
  wire [31:0] BranchKillableQueue_io_deq_bits_uop_debug_inst; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_rvc; // @[execution-unit.scala 528:23]
  wire [39:0] BranchKillableQueue_io_deq_bits_uop_debug_pc; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_uop_iq_type; // @[execution-unit.scala 528:23]
  wire [9:0] BranchKillableQueue_io_deq_bits_uop_fu_code; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_ctrl_br_type; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ctrl_is_load; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ctrl_is_sta; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ctrl_is_std; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_iw_state; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_br; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_jalr; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_jal; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_sfb; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_deq_bits_uop_br_mask; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_br_tag; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_uop_ftq_idx; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_edge_inst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_pc_lob; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_taken; // @[execution-unit.scala 528:23]
  wire [19:0] BranchKillableQueue_io_deq_bits_uop_imm_packed; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_deq_bits_uop_csr_addr; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_rob_idx; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_ldq_idx; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_uop_stq_idx; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_rxq_idx; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_pdst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_prs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_prs2; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_prs3; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_uop_ppred; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_prs1_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_prs2_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_prs3_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ppred_busy; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_stale_pdst; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_exception; // @[execution-unit.scala 528:23]
  wire [63:0] BranchKillableQueue_io_deq_bits_uop_exc_cause; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_bypassable; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_uop_mem_cmd; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_mem_size; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_mem_signed; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_fence; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_fencei; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_amo; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_uses_ldq; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_uses_stq; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_is_unique; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_flush_on_commit; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ldst_is_rs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_ldst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_lrs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_lrs2; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_uop_lrs3; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_ldst_val; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_dst_rtype; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_lrs1_rtype; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_lrs2_rtype; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_frs3_en; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_fp_val; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_fp_single; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_xcpt_pf_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_xcpt_ae_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_xcpt_ma_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_bp_debug_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_uop_bp_xcpt_if; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_debug_fsrc; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_uop_debug_tsrc; // @[execution-unit.scala 528:23]
  wire [64:0] BranchKillableQueue_io_deq_bits_data; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_predicated; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_valid; // @[execution-unit.scala 528:23]
  wire [6:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 528:23]
  wire [31:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_inst; // @[execution-unit.scala 528:23]
  wire [31:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 528:23]
  wire [39:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 528:23]
  wire [9:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_taken; // @[execution-unit.scala 528:23]
  wire [19:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_exception; // @[execution-unit.scala 528:23]
  wire [63:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_deq_bits_fflags_bits_flags; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_brupdate_b1_resolve_mask; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 528:23]
  wire [6:0] BranchKillableQueue_io_brupdate_b2_uop_uopc; // @[execution-unit.scala 528:23]
  wire [31:0] BranchKillableQueue_io_brupdate_b2_uop_inst; // @[execution-unit.scala 528:23]
  wire [31:0] BranchKillableQueue_io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 528:23]
  wire [39:0] BranchKillableQueue_io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 528:23]
  wire [9:0] BranchKillableQueue_io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_br; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_taken; // @[execution-unit.scala 528:23]
  wire [19:0] BranchKillableQueue_io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 528:23]
  wire [11:0] BranchKillableQueue_io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 528:23]
  wire [3:0] BranchKillableQueue_io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_pdst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_prs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_prs2; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_prs3; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_brupdate_b2_uop_ppred; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_exception; // @[execution-unit.scala 528:23]
  wire [63:0] BranchKillableQueue_io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 528:23]
  wire [4:0] BranchKillableQueue_io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_ldst; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 528:23]
  wire [5:0] BranchKillableQueue_io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_valid; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_mispredict; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_brupdate_b2_taken; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_brupdate_b2_cfi_type; // @[execution-unit.scala 528:23]
  wire [1:0] BranchKillableQueue_io_brupdate_b2_pc_sel; // @[execution-unit.scala 528:23]
  wire [39:0] BranchKillableQueue_io_brupdate_b2_jalr_target; // @[execution-unit.scala 528:23]
  wire [20:0] BranchKillableQueue_io_brupdate_b2_target_offset; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_flush; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_io_empty; // @[execution-unit.scala 528:23]
  wire [2:0] BranchKillableQueue_io_count; // @[execution-unit.scala 528:23]
  wire  BranchKillableQueue_1_clock; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_reset; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_ready; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_valid; // @[execution-unit.scala 542:24]
  wire [6:0] BranchKillableQueue_1_io_enq_bits_uop_uopc; // @[execution-unit.scala 542:24]
  wire [31:0] BranchKillableQueue_1_io_enq_bits_uop_inst; // @[execution-unit.scala 542:24]
  wire [31:0] BranchKillableQueue_1_io_enq_bits_uop_debug_inst; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_is_rvc; // @[execution-unit.scala 542:24]
  wire [39:0] BranchKillableQueue_1_io_enq_bits_uop_debug_pc; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_enq_bits_uop_iq_type; // @[execution-unit.scala 542:24]
  wire [9:0] BranchKillableQueue_1_io_enq_bits_uop_fu_code; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_enq_bits_uop_ctrl_br_type; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_enq_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_enq_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_enq_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_enq_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_ctrl_is_load; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_ctrl_is_sta; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_ctrl_is_std; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_uop_iw_state; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_is_br; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_is_jalr; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_is_jal; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_is_sfb; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_enq_bits_uop_br_mask; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_enq_bits_uop_br_tag; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_enq_bits_uop_ftq_idx; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_edge_inst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_uop_pc_lob; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_taken; // @[execution-unit.scala 542:24]
  wire [19:0] BranchKillableQueue_1_io_enq_bits_uop_imm_packed; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_enq_bits_uop_csr_addr; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_uop_rob_idx; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_enq_bits_uop_ldq_idx; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_enq_bits_uop_stq_idx; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_uop_rxq_idx; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_uop_pdst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_uop_prs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_uop_prs2; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_uop_prs3; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_enq_bits_uop_ppred; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_prs1_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_prs2_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_prs3_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_ppred_busy; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_uop_stale_pdst; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_exception; // @[execution-unit.scala 542:24]
  wire [63:0] BranchKillableQueue_1_io_enq_bits_uop_exc_cause; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_bypassable; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_enq_bits_uop_mem_cmd; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_uop_mem_size; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_mem_signed; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_is_fence; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_is_fencei; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_is_amo; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_uses_ldq; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_uses_stq; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_is_unique; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_flush_on_commit; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_ldst_is_rs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_uop_ldst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_uop_lrs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_uop_lrs2; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_uop_lrs3; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_ldst_val; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_uop_dst_rtype; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_uop_lrs1_rtype; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_uop_lrs2_rtype; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_frs3_en; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_fp_val; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_fp_single; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_xcpt_pf_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_xcpt_ae_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_xcpt_ma_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_bp_debug_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_uop_bp_xcpt_if; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_uop_debug_fsrc; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_uop_debug_tsrc; // @[execution-unit.scala 542:24]
  wire [64:0] BranchKillableQueue_1_io_enq_bits_data; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_predicated; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_valid; // @[execution-unit.scala 542:24]
  wire [6:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 542:24]
  wire [31:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_inst; // @[execution-unit.scala 542:24]
  wire [31:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 542:24]
  wire [39:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 542:24]
  wire [9:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_taken; // @[execution-unit.scala 542:24]
  wire [19:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_exception; // @[execution-unit.scala 542:24]
  wire [63:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_enq_bits_fflags_bits_flags; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_ready; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_valid; // @[execution-unit.scala 542:24]
  wire [6:0] BranchKillableQueue_1_io_deq_bits_uop_uopc; // @[execution-unit.scala 542:24]
  wire [31:0] BranchKillableQueue_1_io_deq_bits_uop_inst; // @[execution-unit.scala 542:24]
  wire [31:0] BranchKillableQueue_1_io_deq_bits_uop_debug_inst; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_is_rvc; // @[execution-unit.scala 542:24]
  wire [39:0] BranchKillableQueue_1_io_deq_bits_uop_debug_pc; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_deq_bits_uop_iq_type; // @[execution-unit.scala 542:24]
  wire [9:0] BranchKillableQueue_1_io_deq_bits_uop_fu_code; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_deq_bits_uop_ctrl_br_type; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_deq_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_deq_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_deq_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_deq_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_ctrl_is_load; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_ctrl_is_sta; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_ctrl_is_std; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_uop_iw_state; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_is_br; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_is_jalr; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_is_jal; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_is_sfb; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_deq_bits_uop_br_mask; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_deq_bits_uop_br_tag; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_deq_bits_uop_ftq_idx; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_edge_inst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_uop_pc_lob; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_taken; // @[execution-unit.scala 542:24]
  wire [19:0] BranchKillableQueue_1_io_deq_bits_uop_imm_packed; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_deq_bits_uop_csr_addr; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_uop_rob_idx; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_deq_bits_uop_ldq_idx; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_deq_bits_uop_stq_idx; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_uop_rxq_idx; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_uop_pdst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_uop_prs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_uop_prs2; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_uop_prs3; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_deq_bits_uop_ppred; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_prs1_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_prs2_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_prs3_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_ppred_busy; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_uop_stale_pdst; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_exception; // @[execution-unit.scala 542:24]
  wire [63:0] BranchKillableQueue_1_io_deq_bits_uop_exc_cause; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_bypassable; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_deq_bits_uop_mem_cmd; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_uop_mem_size; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_mem_signed; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_is_fence; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_is_fencei; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_is_amo; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_uses_ldq; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_uses_stq; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_is_unique; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_flush_on_commit; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_ldst_is_rs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_uop_ldst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_uop_lrs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_uop_lrs2; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_uop_lrs3; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_ldst_val; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_uop_dst_rtype; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_uop_lrs1_rtype; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_uop_lrs2_rtype; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_frs3_en; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_fp_val; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_fp_single; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_xcpt_pf_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_xcpt_ae_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_xcpt_ma_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_bp_debug_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_uop_bp_xcpt_if; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_uop_debug_fsrc; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_uop_debug_tsrc; // @[execution-unit.scala 542:24]
  wire [64:0] BranchKillableQueue_1_io_deq_bits_data; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_predicated; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_valid; // @[execution-unit.scala 542:24]
  wire [6:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 542:24]
  wire [31:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_inst; // @[execution-unit.scala 542:24]
  wire [31:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 542:24]
  wire [39:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 542:24]
  wire [9:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_taken; // @[execution-unit.scala 542:24]
  wire [19:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_exception; // @[execution-unit.scala 542:24]
  wire [63:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_deq_bits_fflags_bits_flags; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_brupdate_b1_resolve_mask; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 542:24]
  wire [6:0] BranchKillableQueue_1_io_brupdate_b2_uop_uopc; // @[execution-unit.scala 542:24]
  wire [31:0] BranchKillableQueue_1_io_brupdate_b2_uop_inst; // @[execution-unit.scala 542:24]
  wire [31:0] BranchKillableQueue_1_io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 542:24]
  wire [39:0] BranchKillableQueue_1_io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 542:24]
  wire [9:0] BranchKillableQueue_1_io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_is_br; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_taken; // @[execution-unit.scala 542:24]
  wire [19:0] BranchKillableQueue_1_io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 542:24]
  wire [11:0] BranchKillableQueue_1_io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 542:24]
  wire [3:0] BranchKillableQueue_1_io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_brupdate_b2_uop_pdst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_brupdate_b2_uop_prs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_brupdate_b2_uop_prs2; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_brupdate_b2_uop_prs3; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_brupdate_b2_uop_ppred; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_exception; // @[execution-unit.scala 542:24]
  wire [63:0] BranchKillableQueue_1_io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 542:24]
  wire [4:0] BranchKillableQueue_1_io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_brupdate_b2_uop_ldst; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 542:24]
  wire [5:0] BranchKillableQueue_1_io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_valid; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_mispredict; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_brupdate_b2_taken; // @[execution-unit.scala 542:24]
  wire [2:0] BranchKillableQueue_1_io_brupdate_b2_cfi_type; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_brupdate_b2_pc_sel; // @[execution-unit.scala 542:24]
  wire [39:0] BranchKillableQueue_1_io_brupdate_b2_jalr_target; // @[execution-unit.scala 542:24]
  wire [20:0] BranchKillableQueue_1_io_brupdate_b2_target_offset; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_flush; // @[execution-unit.scala 542:24]
  wire  BranchKillableQueue_1_io_empty; // @[execution-unit.scala 542:24]
  wire [1:0] BranchKillableQueue_1_io_count; // @[execution-unit.scala 542:24]
  wire  Arbiter_clock; // @[execution-unit.scala 554:26]
  wire  Arbiter_reset; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_ready; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_valid; // @[execution-unit.scala 554:26]
  wire [6:0] Arbiter_io_in_0_bits_uop_uopc; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_in_0_bits_uop_inst; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_in_0_bits_uop_debug_inst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_is_rvc; // @[execution-unit.scala 554:26]
  wire [39:0] Arbiter_io_in_0_bits_uop_debug_pc; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_0_bits_uop_iq_type; // @[execution-unit.scala 554:26]
  wire [9:0] Arbiter_io_in_0_bits_uop_fu_code; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_0_bits_uop_ctrl_br_type; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_0_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_0_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_0_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_0_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_ctrl_is_load; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_ctrl_is_sta; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_ctrl_is_std; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_uop_iw_state; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_is_br; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_is_jalr; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_is_jal; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_is_sfb; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_in_0_bits_uop_br_mask; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_0_bits_uop_br_tag; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_0_bits_uop_ftq_idx; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_edge_inst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_uop_pc_lob; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_taken; // @[execution-unit.scala 554:26]
  wire [19:0] Arbiter_io_in_0_bits_uop_imm_packed; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_in_0_bits_uop_csr_addr; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_uop_rob_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_0_bits_uop_ldq_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_0_bits_uop_stq_idx; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_uop_rxq_idx; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_uop_pdst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_uop_prs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_uop_prs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_uop_prs3; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_0_bits_uop_ppred; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_prs1_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_prs2_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_prs3_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_ppred_busy; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_uop_stale_pdst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_exception; // @[execution-unit.scala 554:26]
  wire [63:0] Arbiter_io_in_0_bits_uop_exc_cause; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_bypassable; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_0_bits_uop_mem_cmd; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_uop_mem_size; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_mem_signed; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_is_fence; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_is_fencei; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_is_amo; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_uses_ldq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_uses_stq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_is_unique; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_flush_on_commit; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_ldst_is_rs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_uop_ldst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_uop_lrs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_uop_lrs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_uop_lrs3; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_ldst_val; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_uop_dst_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_uop_lrs1_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_uop_lrs2_rtype; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_frs3_en; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_fp_val; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_fp_single; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_xcpt_pf_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_xcpt_ae_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_xcpt_ma_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_bp_debug_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_uop_bp_xcpt_if; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_uop_debug_fsrc; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_uop_debug_tsrc; // @[execution-unit.scala 554:26]
  wire [64:0] Arbiter_io_in_0_bits_data; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_predicated; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_valid; // @[execution-unit.scala 554:26]
  wire [6:0] Arbiter_io_in_0_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_in_0_bits_fflags_bits_uop_inst; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_in_0_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 554:26]
  wire [39:0] Arbiter_io_in_0_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_0_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 554:26]
  wire [9:0] Arbiter_io_in_0_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_in_0_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_0_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_0_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_taken; // @[execution-unit.scala 554:26]
  wire [19:0] Arbiter_io_in_0_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_in_0_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_0_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_0_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_0_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_exception; // @[execution-unit.scala 554:26]
  wire [63:0] Arbiter_io_in_0_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_0_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_0_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_0_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_0_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_0_bits_fflags_bits_flags; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_ready; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_valid; // @[execution-unit.scala 554:26]
  wire [6:0] Arbiter_io_in_1_bits_uop_uopc; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_in_1_bits_uop_inst; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_in_1_bits_uop_debug_inst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_is_rvc; // @[execution-unit.scala 554:26]
  wire [39:0] Arbiter_io_in_1_bits_uop_debug_pc; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_1_bits_uop_iq_type; // @[execution-unit.scala 554:26]
  wire [9:0] Arbiter_io_in_1_bits_uop_fu_code; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_1_bits_uop_ctrl_br_type; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_1_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_1_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_1_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_1_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_ctrl_is_load; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_ctrl_is_sta; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_ctrl_is_std; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_uop_iw_state; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_is_br; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_is_jalr; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_is_jal; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_is_sfb; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_in_1_bits_uop_br_mask; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_1_bits_uop_br_tag; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_1_bits_uop_ftq_idx; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_edge_inst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_uop_pc_lob; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_taken; // @[execution-unit.scala 554:26]
  wire [19:0] Arbiter_io_in_1_bits_uop_imm_packed; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_in_1_bits_uop_csr_addr; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_uop_rob_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_1_bits_uop_ldq_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_1_bits_uop_stq_idx; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_uop_rxq_idx; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_uop_pdst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_uop_prs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_uop_prs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_uop_prs3; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_1_bits_uop_ppred; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_prs1_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_prs2_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_prs3_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_ppred_busy; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_uop_stale_pdst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_exception; // @[execution-unit.scala 554:26]
  wire [63:0] Arbiter_io_in_1_bits_uop_exc_cause; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_bypassable; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_1_bits_uop_mem_cmd; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_uop_mem_size; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_mem_signed; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_is_fence; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_is_fencei; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_is_amo; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_uses_ldq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_uses_stq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_is_unique; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_flush_on_commit; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_ldst_is_rs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_uop_ldst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_uop_lrs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_uop_lrs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_uop_lrs3; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_ldst_val; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_uop_dst_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_uop_lrs1_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_uop_lrs2_rtype; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_frs3_en; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_fp_val; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_fp_single; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_xcpt_pf_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_xcpt_ae_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_xcpt_ma_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_bp_debug_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_uop_bp_xcpt_if; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_uop_debug_fsrc; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_uop_debug_tsrc; // @[execution-unit.scala 554:26]
  wire [64:0] Arbiter_io_in_1_bits_data; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_predicated; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_valid; // @[execution-unit.scala 554:26]
  wire [6:0] Arbiter_io_in_1_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_in_1_bits_fflags_bits_uop_inst; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_in_1_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 554:26]
  wire [39:0] Arbiter_io_in_1_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_1_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 554:26]
  wire [9:0] Arbiter_io_in_1_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_in_1_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_1_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_1_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_taken; // @[execution-unit.scala 554:26]
  wire [19:0] Arbiter_io_in_1_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_in_1_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_1_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_in_1_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_1_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_exception; // @[execution-unit.scala 554:26]
  wire [63:0] Arbiter_io_in_1_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_1_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_in_1_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_in_1_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_in_1_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_in_1_bits_fflags_bits_flags; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_ready; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_valid; // @[execution-unit.scala 554:26]
  wire [6:0] Arbiter_io_out_bits_uop_uopc; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_out_bits_uop_inst; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_out_bits_uop_debug_inst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_is_rvc; // @[execution-unit.scala 554:26]
  wire [39:0] Arbiter_io_out_bits_uop_debug_pc; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_out_bits_uop_iq_type; // @[execution-unit.scala 554:26]
  wire [9:0] Arbiter_io_out_bits_uop_fu_code; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_out_bits_uop_ctrl_br_type; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_out_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_out_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_out_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_out_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_ctrl_is_load; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_ctrl_is_sta; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_ctrl_is_std; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_uop_iw_state; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_is_br; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_is_jalr; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_is_jal; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_is_sfb; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_out_bits_uop_br_mask; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_out_bits_uop_br_tag; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_out_bits_uop_ftq_idx; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_edge_inst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_uop_pc_lob; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_taken; // @[execution-unit.scala 554:26]
  wire [19:0] Arbiter_io_out_bits_uop_imm_packed; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_out_bits_uop_csr_addr; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_uop_rob_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_out_bits_uop_ldq_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_out_bits_uop_stq_idx; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_uop_rxq_idx; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_uop_pdst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_uop_prs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_uop_prs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_uop_prs3; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_out_bits_uop_ppred; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_prs1_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_prs2_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_prs3_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_ppred_busy; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_uop_stale_pdst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_exception; // @[execution-unit.scala 554:26]
  wire [63:0] Arbiter_io_out_bits_uop_exc_cause; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_bypassable; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_out_bits_uop_mem_cmd; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_uop_mem_size; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_mem_signed; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_is_fence; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_is_fencei; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_is_amo; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_uses_ldq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_uses_stq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_is_unique; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_flush_on_commit; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_ldst_is_rs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_uop_ldst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_uop_lrs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_uop_lrs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_uop_lrs3; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_ldst_val; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_uop_dst_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_uop_lrs1_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_uop_lrs2_rtype; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_frs3_en; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_fp_val; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_fp_single; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_xcpt_pf_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_xcpt_ae_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_xcpt_ma_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_bp_debug_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_uop_bp_xcpt_if; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_uop_debug_fsrc; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_uop_debug_tsrc; // @[execution-unit.scala 554:26]
  wire [64:0] Arbiter_io_out_bits_data; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_predicated; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_valid; // @[execution-unit.scala 554:26]
  wire [6:0] Arbiter_io_out_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_out_bits_fflags_bits_uop_inst; // @[execution-unit.scala 554:26]
  wire [31:0] Arbiter_io_out_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 554:26]
  wire [39:0] Arbiter_io_out_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_out_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 554:26]
  wire [9:0] Arbiter_io_out_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_out_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_out_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_out_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_out_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 554:26]
  wire [2:0] Arbiter_io_out_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_out_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_out_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_out_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_taken; // @[execution-unit.scala 554:26]
  wire [19:0] Arbiter_io_out_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 554:26]
  wire [11:0] Arbiter_io_out_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_out_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 554:26]
  wire [3:0] Arbiter_io_out_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_out_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_exception; // @[execution-unit.scala 554:26]
  wire [63:0] Arbiter_io_out_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_out_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 554:26]
  wire [5:0] Arbiter_io_out_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_out_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 554:26]
  wire [1:0] Arbiter_io_out_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 554:26]
  wire [4:0] Arbiter_io_out_bits_fflags_bits_flags; // @[execution-unit.scala 554:26]
  wire  Arbiter_io_chosen; // @[execution-unit.scala 554:26]
  wire [9:0] _T_23 = io_req_bits_uop_fu_code & 10'h80; // @[micro-op.scala 154:40]
  wire  _T_24 = _T_23 != 10'h0; // @[micro-op.scala 154:47]
  wire  fdiv_busy = ~fdivsqrt_io_req_ready | io_req_valid & _T_24; // @[execution-unit.scala 507:41]
  wire [9:0] _T_6 = ~fdiv_busy ? 10'h80 : 10'h0; // @[execution-unit.scala 459:21]
  wire [9:0] _T_7 = 10'h40 | _T_6; // @[execution-unit.scala 458:45]
  wire  fpiu_busy = ~(BranchKillableQueue_io_empty & BranchKillableQueue_1_io_empty); // @[execution-unit.scala 559:18]
  wire [9:0] _T_10 = ~fpiu_busy ? 10'h200 : 10'h0; // @[execution-unit.scala 460:21]
  wire [9:0] _T_12 = io_req_bits_uop_fu_code & 10'h40; // @[micro-op.scala 154:40]
  wire  _T_13 = _T_12 != 10'h0; // @[micro-op.scala 154:47]
  wire [9:0] _T_14 = io_req_bits_uop_fu_code & 10'h200; // @[micro-op.scala 154:40]
  wire  _T_15 = _T_14 != 10'h0; // @[micro-op.scala 154:47]
  wire  _T_16 = _T_13 | _T_15; // @[execution-unit.scala 470:69]
  wire [9:0] _T_28 = fpu_io_resp_bits_uop_fu_code & 10'h200; // @[micro-op.scala 154:40]
  wire  _T_29 = _T_28 != 10'h0; // @[micro-op.scala 154:47]
  wire  _T_30 = fpu_io_resp_valid & _T_29; // @[execution-unit.scala 517:47]
  wire  _T_31 = ~(fpu_io_resp_valid & _T_29); // @[execution-unit.scala 517:27]
  wire  fpu_resp_val = fpu_io_resp_valid;
  wire  fpu_resp_fflags_valid = fpu_io_resp_bits_fflags_valid; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_valid = fdivsqrt_io_resp_bits_fflags_valid; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [6:0] fpu_resp_fflags_bits_uop_uopc = fpu_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [6:0] fdiv_resp_fflags_bits_uop_uopc = fdivsqrt_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [31:0] fpu_resp_fflags_bits_uop_inst = fpu_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [31:0] fdiv_resp_fflags_bits_uop_inst = fdivsqrt_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [31:0] fpu_resp_fflags_bits_uop_debug_inst = fpu_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [31:0] fdiv_resp_fflags_bits_uop_debug_inst = fdivsqrt_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_is_rvc = fpu_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_is_rvc = fdivsqrt_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [39:0] fpu_resp_fflags_bits_uop_debug_pc = fpu_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [39:0] fdiv_resp_fflags_bits_uop_debug_pc = fdivsqrt_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [2:0] fpu_resp_fflags_bits_uop_iq_type = fpu_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [2:0] fdiv_resp_fflags_bits_uop_iq_type = fdivsqrt_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [9:0] fpu_resp_fflags_bits_uop_fu_code = fpu_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [9:0] fdiv_resp_fflags_bits_uop_fu_code = fdivsqrt_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [3:0] fpu_resp_fflags_bits_uop_ctrl_br_type = fpu_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [3:0] fdiv_resp_fflags_bits_uop_ctrl_br_type = fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [1:0] fpu_resp_fflags_bits_uop_ctrl_op1_sel = fpu_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [1:0] fdiv_resp_fflags_bits_uop_ctrl_op1_sel = fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [2:0] fpu_resp_fflags_bits_uop_ctrl_op2_sel = fpu_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [2:0] fdiv_resp_fflags_bits_uop_ctrl_op2_sel = fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [2:0] fpu_resp_fflags_bits_uop_ctrl_imm_sel = fpu_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [2:0] fdiv_resp_fflags_bits_uop_ctrl_imm_sel = fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [3:0] fpu_resp_fflags_bits_uop_ctrl_op_fcn = fpu_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [3:0] fdiv_resp_fflags_bits_uop_ctrl_op_fcn = fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_ctrl_fcn_dw = fpu_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_ctrl_fcn_dw = fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [2:0] fpu_resp_fflags_bits_uop_ctrl_csr_cmd = fpu_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [2:0] fdiv_resp_fflags_bits_uop_ctrl_csr_cmd = fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_ctrl_is_load = fpu_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_ctrl_is_load = fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_ctrl_is_sta = fpu_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_ctrl_is_sta = fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_ctrl_is_std = fpu_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_ctrl_is_std = fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [1:0] fpu_resp_fflags_bits_uop_iw_state = fpu_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [1:0] fdiv_resp_fflags_bits_uop_iw_state = fdivsqrt_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_iw_p1_poisoned = fpu_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_iw_p1_poisoned = fdivsqrt_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_iw_p2_poisoned = fpu_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_iw_p2_poisoned = fdivsqrt_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_is_br = fpu_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_is_br = fdivsqrt_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_is_jalr = fpu_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_is_jalr = fdivsqrt_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_is_jal = fpu_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_is_jal = fdivsqrt_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_is_sfb = fpu_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_is_sfb = fdivsqrt_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [11:0] fpu_resp_fflags_bits_uop_br_mask = fpu_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [11:0] fdiv_resp_fflags_bits_uop_br_mask = fdivsqrt_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [3:0] fpu_resp_fflags_bits_uop_br_tag = fpu_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [3:0] fdiv_resp_fflags_bits_uop_br_tag = fdivsqrt_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [4:0] fpu_resp_fflags_bits_uop_ftq_idx = fpu_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [4:0] fdiv_resp_fflags_bits_uop_ftq_idx = fdivsqrt_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_edge_inst = fpu_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_edge_inst = fdivsqrt_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [5:0] fpu_resp_fflags_bits_uop_pc_lob = fpu_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [5:0] fdiv_resp_fflags_bits_uop_pc_lob = fdivsqrt_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_taken = fpu_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_taken = fdivsqrt_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [19:0] fpu_resp_fflags_bits_uop_imm_packed = fpu_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [19:0] fdiv_resp_fflags_bits_uop_imm_packed = fdivsqrt_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [11:0] fpu_resp_fflags_bits_uop_csr_addr = fpu_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [11:0] fdiv_resp_fflags_bits_uop_csr_addr = fdivsqrt_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [5:0] fpu_resp_fflags_bits_uop_rob_idx = fpu_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [5:0] fdiv_resp_fflags_bits_uop_rob_idx = fdivsqrt_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [3:0] fpu_resp_fflags_bits_uop_ldq_idx = fpu_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [3:0] fdiv_resp_fflags_bits_uop_ldq_idx = fdivsqrt_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [3:0] fpu_resp_fflags_bits_uop_stq_idx = fpu_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [3:0] fdiv_resp_fflags_bits_uop_stq_idx = fdivsqrt_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [1:0] fpu_resp_fflags_bits_uop_rxq_idx = fpu_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [1:0] fdiv_resp_fflags_bits_uop_rxq_idx = fdivsqrt_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [5:0] fpu_resp_fflags_bits_uop_pdst = fpu_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [5:0] fdiv_resp_fflags_bits_uop_pdst = fdivsqrt_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [5:0] fpu_resp_fflags_bits_uop_prs1 = fpu_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [5:0] fdiv_resp_fflags_bits_uop_prs1 = fdivsqrt_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [5:0] fpu_resp_fflags_bits_uop_prs2 = fpu_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [5:0] fdiv_resp_fflags_bits_uop_prs2 = fdivsqrt_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [5:0] fpu_resp_fflags_bits_uop_prs3 = fpu_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [5:0] fdiv_resp_fflags_bits_uop_prs3 = fdivsqrt_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [4:0] fpu_resp_fflags_bits_uop_ppred = fpu_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [4:0] fdiv_resp_fflags_bits_uop_ppred = fdivsqrt_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_prs1_busy = fpu_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_prs1_busy = fdivsqrt_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_prs2_busy = fpu_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_prs2_busy = fdivsqrt_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_prs3_busy = fpu_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_prs3_busy = fdivsqrt_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_ppred_busy = fpu_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_ppred_busy = fdivsqrt_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [5:0] fpu_resp_fflags_bits_uop_stale_pdst = fpu_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [5:0] fdiv_resp_fflags_bits_uop_stale_pdst = fdivsqrt_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_exception = fpu_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_exception = fdivsqrt_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [63:0] fpu_resp_fflags_bits_uop_exc_cause = fpu_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [63:0] fdiv_resp_fflags_bits_uop_exc_cause = fdivsqrt_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_bypassable = fpu_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_bypassable = fdivsqrt_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [4:0] fpu_resp_fflags_bits_uop_mem_cmd = fpu_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [4:0] fdiv_resp_fflags_bits_uop_mem_cmd = fdivsqrt_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [1:0] fpu_resp_fflags_bits_uop_mem_size = fpu_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [1:0] fdiv_resp_fflags_bits_uop_mem_size = fdivsqrt_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_mem_signed = fpu_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_mem_signed = fdivsqrt_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_is_fence = fpu_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_is_fence = fdivsqrt_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_is_fencei = fpu_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_is_fencei = fdivsqrt_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_is_amo = fpu_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_is_amo = fdivsqrt_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_uses_ldq = fpu_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_uses_ldq = fdivsqrt_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_uses_stq = fpu_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_uses_stq = fdivsqrt_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_is_sys_pc2epc = fpu_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_is_sys_pc2epc = fdivsqrt_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_is_unique = fpu_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_is_unique = fdivsqrt_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_flush_on_commit = fpu_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_flush_on_commit = fdivsqrt_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_ldst_is_rs1 = fpu_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_ldst_is_rs1 = fdivsqrt_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [5:0] fpu_resp_fflags_bits_uop_ldst = fpu_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [5:0] fdiv_resp_fflags_bits_uop_ldst = fdivsqrt_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [5:0] fpu_resp_fflags_bits_uop_lrs1 = fpu_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [5:0] fdiv_resp_fflags_bits_uop_lrs1 = fdivsqrt_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [5:0] fpu_resp_fflags_bits_uop_lrs2 = fpu_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [5:0] fdiv_resp_fflags_bits_uop_lrs2 = fdivsqrt_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [5:0] fpu_resp_fflags_bits_uop_lrs3 = fpu_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [5:0] fdiv_resp_fflags_bits_uop_lrs3 = fdivsqrt_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_ldst_val = fpu_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_ldst_val = fdivsqrt_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [1:0] fpu_resp_fflags_bits_uop_dst_rtype = fpu_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [1:0] fdiv_resp_fflags_bits_uop_dst_rtype = fdivsqrt_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [1:0] fpu_resp_fflags_bits_uop_lrs1_rtype = fpu_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [1:0] fdiv_resp_fflags_bits_uop_lrs1_rtype = fdivsqrt_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [1:0] fpu_resp_fflags_bits_uop_lrs2_rtype = fpu_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [1:0] fdiv_resp_fflags_bits_uop_lrs2_rtype = fdivsqrt_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_frs3_en = fpu_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_frs3_en = fdivsqrt_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_fp_val = fpu_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_fp_val = fdivsqrt_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_fp_single = fpu_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_fp_single = fdivsqrt_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_xcpt_pf_if = fpu_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_xcpt_pf_if = fdivsqrt_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_xcpt_ae_if = fpu_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_xcpt_ae_if = fdivsqrt_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_xcpt_ma_if = fpu_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_xcpt_ma_if = fdivsqrt_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_bp_debug_if = fpu_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_bp_debug_if = fdivsqrt_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  fpu_resp_fflags_bits_uop_bp_xcpt_if = fpu_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire  fdiv_resp_fflags_bits_uop_bp_xcpt_if = fdivsqrt_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [1:0] fpu_resp_fflags_bits_uop_debug_fsrc = fpu_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [1:0] fdiv_resp_fflags_bits_uop_debug_fsrc = fdivsqrt_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [1:0] fpu_resp_fflags_bits_uop_debug_tsrc = fpu_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [1:0] fdiv_resp_fflags_bits_uop_debug_tsrc = fdivsqrt_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire [4:0] fpu_resp_fflags_bits_flags = fpu_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 465:29 execution-unit.scala 482:30]
  wire [4:0] fdiv_resp_fflags_bits_flags = fdivsqrt_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 489:30 execution-unit.scala 509:22]
  wire  _T_39 = fpu_io_resp_bits_uop_uopc != 7'h2; // @[execution-unit.scala 532:60]
  wire [11:0] _T_46 = io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask; // @[util.scala 118:51]
  wire  _T_47 = _T_46 != 12'h0; // @[util.scala 118:59]
  wire [11:0] unrecoded_rawIn_exp = io_req_bits_rs2_data[63:52]; // @[rawFloatFromRecFN.scala 50:21]
  wire  unrecoded_rawIn_isZero = unrecoded_rawIn_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  unrecoded_rawIn_isSpecial = unrecoded_rawIn_exp[11:10] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  unrecoded_rawIn__isNaN = unrecoded_rawIn_isSpecial & unrecoded_rawIn_exp[9]; // @[rawFloatFromRecFN.scala 55:33]
  wire  unrecoded_rawIn__isInf = unrecoded_rawIn_isSpecial & ~unrecoded_rawIn_exp[9]; // @[rawFloatFromRecFN.scala 56:33]
  wire  unrecoded_rawIn__sign = io_req_bits_rs2_data[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] unrecoded_rawIn__sExp = {1'b0,$signed(unrecoded_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  unrecoded_rawIn_out_sig_hi_lo = ~unrecoded_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] unrecoded_rawIn_out_sig_lo = io_req_bits_rs2_data[51:0]; // @[rawFloatFromRecFN.scala 60:51]
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
  wire  prevRecoded_hi_hi = io_req_bits_rs2_data[31]; // @[FPU.scala 437:10]
  wire  prevRecoded_hi_lo = io_req_bits_rs2_data[52]; // @[FPU.scala 438:10]
  wire [30:0] prevRecoded_lo = io_req_bits_rs2_data[30:0]; // @[FPU.scala 439:10]
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
  wire [31:0] hi = unrecoded[63:32]; // @[FPU.scala 441:21]
  wire  _T_51 = &io_req_bits_rs2_data[63:61]; // @[FPU.scala 243:56]
  wire [31:0] lo = _T_51 ? prevUnrecoded : unrecoded[31:0]; // @[FPU.scala 441:44]
  wire [63:0] _T_53 = {hi,lo}; // @[Cat.scala 30:58]
  FPUUnit fpu ( // @[execution-unit.scala 468:17]
    .clock(fpu_clock),
    .reset(fpu_reset),
    .io_req_ready(fpu_io_req_ready),
    .io_req_valid(fpu_io_req_valid),
    .io_req_bits_uop_uopc(fpu_io_req_bits_uop_uopc),
    .io_req_bits_uop_inst(fpu_io_req_bits_uop_inst),
    .io_req_bits_uop_debug_inst(fpu_io_req_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc(fpu_io_req_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc(fpu_io_req_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type(fpu_io_req_bits_uop_iq_type),
    .io_req_bits_uop_fu_code(fpu_io_req_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type(fpu_io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel(fpu_io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel(fpu_io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel(fpu_io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn(fpu_io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw(fpu_io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd(fpu_io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load(fpu_io_req_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta(fpu_io_req_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std(fpu_io_req_bits_uop_ctrl_is_std),
    .io_req_bits_uop_iw_state(fpu_io_req_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned(fpu_io_req_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned(fpu_io_req_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br(fpu_io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr(fpu_io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal(fpu_io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb(fpu_io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask(fpu_io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag(fpu_io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx(fpu_io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst(fpu_io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob(fpu_io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken(fpu_io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed(fpu_io_req_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr(fpu_io_req_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx(fpu_io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx(fpu_io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx(fpu_io_req_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx(fpu_io_req_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst(fpu_io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1(fpu_io_req_bits_uop_prs1),
    .io_req_bits_uop_prs2(fpu_io_req_bits_uop_prs2),
    .io_req_bits_uop_prs3(fpu_io_req_bits_uop_prs3),
    .io_req_bits_uop_ppred(fpu_io_req_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy(fpu_io_req_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy(fpu_io_req_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy(fpu_io_req_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy(fpu_io_req_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst(fpu_io_req_bits_uop_stale_pdst),
    .io_req_bits_uop_exception(fpu_io_req_bits_uop_exception),
    .io_req_bits_uop_exc_cause(fpu_io_req_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable(fpu_io_req_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd(fpu_io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size(fpu_io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed(fpu_io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence(fpu_io_req_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei(fpu_io_req_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo(fpu_io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq(fpu_io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq(fpu_io_req_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc(fpu_io_req_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique(fpu_io_req_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit(fpu_io_req_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1(fpu_io_req_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst(fpu_io_req_bits_uop_ldst),
    .io_req_bits_uop_lrs1(fpu_io_req_bits_uop_lrs1),
    .io_req_bits_uop_lrs2(fpu_io_req_bits_uop_lrs2),
    .io_req_bits_uop_lrs3(fpu_io_req_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val(fpu_io_req_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype(fpu_io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype(fpu_io_req_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype(fpu_io_req_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en(fpu_io_req_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val(fpu_io_req_bits_uop_fp_val),
    .io_req_bits_uop_fp_single(fpu_io_req_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if(fpu_io_req_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if(fpu_io_req_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if(fpu_io_req_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if(fpu_io_req_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if(fpu_io_req_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc(fpu_io_req_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc(fpu_io_req_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data(fpu_io_req_bits_rs1_data),
    .io_req_bits_rs2_data(fpu_io_req_bits_rs2_data),
    .io_req_bits_rs3_data(fpu_io_req_bits_rs3_data),
    .io_req_bits_pred_data(fpu_io_req_bits_pred_data),
    .io_req_bits_kill(fpu_io_req_bits_kill),
    .io_resp_ready(fpu_io_resp_ready),
    .io_resp_valid(fpu_io_resp_valid),
    .io_resp_bits_uop_uopc(fpu_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(fpu_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(fpu_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(fpu_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(fpu_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(fpu_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(fpu_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(fpu_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(fpu_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(fpu_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(fpu_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(fpu_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(fpu_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(fpu_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(fpu_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(fpu_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(fpu_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state(fpu_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(fpu_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(fpu_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(fpu_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(fpu_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(fpu_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(fpu_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(fpu_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(fpu_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(fpu_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(fpu_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(fpu_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(fpu_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(fpu_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(fpu_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(fpu_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(fpu_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(fpu_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(fpu_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(fpu_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(fpu_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(fpu_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(fpu_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(fpu_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(fpu_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(fpu_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(fpu_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(fpu_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(fpu_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(fpu_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(fpu_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(fpu_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(fpu_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(fpu_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(fpu_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(fpu_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(fpu_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(fpu_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(fpu_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(fpu_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(fpu_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(fpu_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(fpu_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(fpu_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(fpu_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(fpu_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(fpu_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(fpu_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(fpu_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(fpu_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(fpu_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(fpu_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(fpu_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(fpu_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(fpu_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(fpu_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(fpu_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(fpu_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(fpu_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(fpu_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(fpu_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(fpu_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_predicated(fpu_io_resp_bits_predicated),
    .io_resp_bits_data(fpu_io_resp_bits_data),
    .io_resp_bits_fflags_valid(fpu_io_resp_bits_fflags_valid),
    .io_resp_bits_fflags_bits_uop_uopc(fpu_io_resp_bits_fflags_bits_uop_uopc),
    .io_resp_bits_fflags_bits_uop_inst(fpu_io_resp_bits_fflags_bits_uop_inst),
    .io_resp_bits_fflags_bits_uop_debug_inst(fpu_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_resp_bits_fflags_bits_uop_is_rvc(fpu_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_resp_bits_fflags_bits_uop_debug_pc(fpu_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_resp_bits_fflags_bits_uop_iq_type(fpu_io_resp_bits_fflags_bits_uop_iq_type),
    .io_resp_bits_fflags_bits_uop_fu_code(fpu_io_resp_bits_fflags_bits_uop_fu_code),
    .io_resp_bits_fflags_bits_uop_ctrl_br_type(fpu_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_resp_bits_fflags_bits_uop_ctrl_op1_sel(fpu_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op2_sel(fpu_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_imm_sel(fpu_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op_fcn(fpu_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflags_bits_uop_ctrl_fcn_dw(fpu_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflags_bits_uop_ctrl_csr_cmd(fpu_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflags_bits_uop_ctrl_is_load(fpu_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_resp_bits_fflags_bits_uop_ctrl_is_sta(fpu_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflags_bits_uop_ctrl_is_std(fpu_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_resp_bits_fflags_bits_uop_iw_state(fpu_io_resp_bits_fflags_bits_uop_iw_state),
    .io_resp_bits_fflags_bits_uop_iw_p1_poisoned(fpu_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflags_bits_uop_iw_p2_poisoned(fpu_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflags_bits_uop_is_br(fpu_io_resp_bits_fflags_bits_uop_is_br),
    .io_resp_bits_fflags_bits_uop_is_jalr(fpu_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_resp_bits_fflags_bits_uop_is_jal(fpu_io_resp_bits_fflags_bits_uop_is_jal),
    .io_resp_bits_fflags_bits_uop_is_sfb(fpu_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_resp_bits_fflags_bits_uop_br_mask(fpu_io_resp_bits_fflags_bits_uop_br_mask),
    .io_resp_bits_fflags_bits_uop_br_tag(fpu_io_resp_bits_fflags_bits_uop_br_tag),
    .io_resp_bits_fflags_bits_uop_ftq_idx(fpu_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_resp_bits_fflags_bits_uop_edge_inst(fpu_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_resp_bits_fflags_bits_uop_pc_lob(fpu_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_resp_bits_fflags_bits_uop_taken(fpu_io_resp_bits_fflags_bits_uop_taken),
    .io_resp_bits_fflags_bits_uop_imm_packed(fpu_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_resp_bits_fflags_bits_uop_csr_addr(fpu_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_resp_bits_fflags_bits_uop_rob_idx(fpu_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_resp_bits_fflags_bits_uop_ldq_idx(fpu_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_resp_bits_fflags_bits_uop_stq_idx(fpu_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_resp_bits_fflags_bits_uop_rxq_idx(fpu_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_resp_bits_fflags_bits_uop_pdst(fpu_io_resp_bits_fflags_bits_uop_pdst),
    .io_resp_bits_fflags_bits_uop_prs1(fpu_io_resp_bits_fflags_bits_uop_prs1),
    .io_resp_bits_fflags_bits_uop_prs2(fpu_io_resp_bits_fflags_bits_uop_prs2),
    .io_resp_bits_fflags_bits_uop_prs3(fpu_io_resp_bits_fflags_bits_uop_prs3),
    .io_resp_bits_fflags_bits_uop_ppred(fpu_io_resp_bits_fflags_bits_uop_ppred),
    .io_resp_bits_fflags_bits_uop_prs1_busy(fpu_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_resp_bits_fflags_bits_uop_prs2_busy(fpu_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_resp_bits_fflags_bits_uop_prs3_busy(fpu_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_resp_bits_fflags_bits_uop_ppred_busy(fpu_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_resp_bits_fflags_bits_uop_stale_pdst(fpu_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_resp_bits_fflags_bits_uop_exception(fpu_io_resp_bits_fflags_bits_uop_exception),
    .io_resp_bits_fflags_bits_uop_exc_cause(fpu_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_resp_bits_fflags_bits_uop_bypassable(fpu_io_resp_bits_fflags_bits_uop_bypassable),
    .io_resp_bits_fflags_bits_uop_mem_cmd(fpu_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_resp_bits_fflags_bits_uop_mem_size(fpu_io_resp_bits_fflags_bits_uop_mem_size),
    .io_resp_bits_fflags_bits_uop_mem_signed(fpu_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_resp_bits_fflags_bits_uop_is_fence(fpu_io_resp_bits_fflags_bits_uop_is_fence),
    .io_resp_bits_fflags_bits_uop_is_fencei(fpu_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_resp_bits_fflags_bits_uop_is_amo(fpu_io_resp_bits_fflags_bits_uop_is_amo),
    .io_resp_bits_fflags_bits_uop_uses_ldq(fpu_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_resp_bits_fflags_bits_uop_uses_stq(fpu_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_resp_bits_fflags_bits_uop_is_sys_pc2epc(fpu_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflags_bits_uop_is_unique(fpu_io_resp_bits_fflags_bits_uop_is_unique),
    .io_resp_bits_fflags_bits_uop_flush_on_commit(fpu_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_resp_bits_fflags_bits_uop_ldst_is_rs1(fpu_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflags_bits_uop_ldst(fpu_io_resp_bits_fflags_bits_uop_ldst),
    .io_resp_bits_fflags_bits_uop_lrs1(fpu_io_resp_bits_fflags_bits_uop_lrs1),
    .io_resp_bits_fflags_bits_uop_lrs2(fpu_io_resp_bits_fflags_bits_uop_lrs2),
    .io_resp_bits_fflags_bits_uop_lrs3(fpu_io_resp_bits_fflags_bits_uop_lrs3),
    .io_resp_bits_fflags_bits_uop_ldst_val(fpu_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_resp_bits_fflags_bits_uop_dst_rtype(fpu_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_resp_bits_fflags_bits_uop_lrs1_rtype(fpu_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_resp_bits_fflags_bits_uop_lrs2_rtype(fpu_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_resp_bits_fflags_bits_uop_frs3_en(fpu_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_resp_bits_fflags_bits_uop_fp_val(fpu_io_resp_bits_fflags_bits_uop_fp_val),
    .io_resp_bits_fflags_bits_uop_fp_single(fpu_io_resp_bits_fflags_bits_uop_fp_single),
    .io_resp_bits_fflags_bits_uop_xcpt_pf_if(fpu_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ae_if(fpu_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ma_if(fpu_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflags_bits_uop_bp_debug_if(fpu_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_resp_bits_fflags_bits_uop_bp_xcpt_if(fpu_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflags_bits_uop_debug_fsrc(fpu_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_resp_bits_fflags_bits_uop_debug_tsrc(fpu_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_resp_bits_fflags_bits_flags(fpu_io_resp_bits_fflags_bits_flags),
    .io_resp_bits_addr(fpu_io_resp_bits_addr),
    .io_resp_bits_mxcpt_valid(fpu_io_resp_bits_mxcpt_valid),
    .io_resp_bits_mxcpt_bits(fpu_io_resp_bits_mxcpt_bits),
    .io_resp_bits_sfence_valid(fpu_io_resp_bits_sfence_valid),
    .io_resp_bits_sfence_bits_rs1(fpu_io_resp_bits_sfence_bits_rs1),
    .io_resp_bits_sfence_bits_rs2(fpu_io_resp_bits_sfence_bits_rs2),
    .io_resp_bits_sfence_bits_addr(fpu_io_resp_bits_sfence_bits_addr),
    .io_resp_bits_sfence_bits_asid(fpu_io_resp_bits_sfence_bits_asid),
    .io_brupdate_b1_resolve_mask(fpu_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(fpu_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(fpu_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(fpu_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(fpu_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(fpu_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(fpu_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(fpu_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(fpu_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(fpu_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(fpu_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(fpu_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(fpu_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(fpu_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(fpu_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(fpu_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(fpu_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(fpu_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(fpu_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(fpu_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(fpu_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(fpu_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(fpu_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(fpu_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(fpu_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(fpu_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(fpu_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(fpu_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(fpu_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(fpu_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(fpu_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(fpu_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(fpu_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(fpu_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(fpu_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(fpu_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(fpu_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(fpu_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(fpu_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(fpu_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(fpu_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(fpu_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(fpu_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(fpu_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(fpu_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(fpu_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(fpu_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(fpu_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(fpu_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(fpu_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(fpu_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(fpu_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(fpu_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(fpu_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(fpu_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(fpu_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(fpu_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(fpu_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(fpu_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(fpu_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(fpu_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(fpu_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(fpu_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(fpu_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(fpu_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(fpu_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(fpu_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(fpu_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(fpu_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(fpu_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(fpu_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(fpu_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(fpu_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(fpu_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(fpu_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(fpu_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(fpu_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(fpu_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(fpu_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(fpu_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(fpu_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(fpu_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(fpu_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(fpu_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(fpu_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(fpu_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(fpu_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(fpu_io_brupdate_b2_target_offset),
    .io_fcsr_rm(fpu_io_fcsr_rm)
  );
  FDivSqrtUnit fdivsqrt ( // @[execution-unit.scala 493:22]
    .clock(fdivsqrt_clock),
    .reset(fdivsqrt_reset),
    .io_req_ready(fdivsqrt_io_req_ready),
    .io_req_valid(fdivsqrt_io_req_valid),
    .io_req_bits_uop_uopc(fdivsqrt_io_req_bits_uop_uopc),
    .io_req_bits_uop_inst(fdivsqrt_io_req_bits_uop_inst),
    .io_req_bits_uop_debug_inst(fdivsqrt_io_req_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc(fdivsqrt_io_req_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc(fdivsqrt_io_req_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type(fdivsqrt_io_req_bits_uop_iq_type),
    .io_req_bits_uop_fu_code(fdivsqrt_io_req_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type(fdivsqrt_io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel(fdivsqrt_io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel(fdivsqrt_io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel(fdivsqrt_io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn(fdivsqrt_io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw(fdivsqrt_io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd(fdivsqrt_io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load(fdivsqrt_io_req_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta(fdivsqrt_io_req_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std(fdivsqrt_io_req_bits_uop_ctrl_is_std),
    .io_req_bits_uop_iw_state(fdivsqrt_io_req_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned(fdivsqrt_io_req_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned(fdivsqrt_io_req_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br(fdivsqrt_io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr(fdivsqrt_io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal(fdivsqrt_io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb(fdivsqrt_io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask(fdivsqrt_io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag(fdivsqrt_io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx(fdivsqrt_io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst(fdivsqrt_io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob(fdivsqrt_io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken(fdivsqrt_io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed(fdivsqrt_io_req_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr(fdivsqrt_io_req_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx(fdivsqrt_io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx(fdivsqrt_io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx(fdivsqrt_io_req_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx(fdivsqrt_io_req_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst(fdivsqrt_io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1(fdivsqrt_io_req_bits_uop_prs1),
    .io_req_bits_uop_prs2(fdivsqrt_io_req_bits_uop_prs2),
    .io_req_bits_uop_prs3(fdivsqrt_io_req_bits_uop_prs3),
    .io_req_bits_uop_ppred(fdivsqrt_io_req_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy(fdivsqrt_io_req_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy(fdivsqrt_io_req_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy(fdivsqrt_io_req_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy(fdivsqrt_io_req_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst(fdivsqrt_io_req_bits_uop_stale_pdst),
    .io_req_bits_uop_exception(fdivsqrt_io_req_bits_uop_exception),
    .io_req_bits_uop_exc_cause(fdivsqrt_io_req_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable(fdivsqrt_io_req_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd(fdivsqrt_io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size(fdivsqrt_io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed(fdivsqrt_io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence(fdivsqrt_io_req_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei(fdivsqrt_io_req_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo(fdivsqrt_io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq(fdivsqrt_io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq(fdivsqrt_io_req_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc(fdivsqrt_io_req_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique(fdivsqrt_io_req_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit(fdivsqrt_io_req_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1(fdivsqrt_io_req_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst(fdivsqrt_io_req_bits_uop_ldst),
    .io_req_bits_uop_lrs1(fdivsqrt_io_req_bits_uop_lrs1),
    .io_req_bits_uop_lrs2(fdivsqrt_io_req_bits_uop_lrs2),
    .io_req_bits_uop_lrs3(fdivsqrt_io_req_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val(fdivsqrt_io_req_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype(fdivsqrt_io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype(fdivsqrt_io_req_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype(fdivsqrt_io_req_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en(fdivsqrt_io_req_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val(fdivsqrt_io_req_bits_uop_fp_val),
    .io_req_bits_uop_fp_single(fdivsqrt_io_req_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if(fdivsqrt_io_req_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if(fdivsqrt_io_req_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if(fdivsqrt_io_req_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if(fdivsqrt_io_req_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if(fdivsqrt_io_req_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc(fdivsqrt_io_req_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc(fdivsqrt_io_req_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data(fdivsqrt_io_req_bits_rs1_data),
    .io_req_bits_rs2_data(fdivsqrt_io_req_bits_rs2_data),
    .io_req_bits_rs3_data(fdivsqrt_io_req_bits_rs3_data),
    .io_req_bits_pred_data(fdivsqrt_io_req_bits_pred_data),
    .io_req_bits_kill(fdivsqrt_io_req_bits_kill),
    .io_resp_ready(fdivsqrt_io_resp_ready),
    .io_resp_valid(fdivsqrt_io_resp_valid),
    .io_resp_bits_uop_uopc(fdivsqrt_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(fdivsqrt_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(fdivsqrt_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(fdivsqrt_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(fdivsqrt_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(fdivsqrt_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(fdivsqrt_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(fdivsqrt_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(fdivsqrt_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(fdivsqrt_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(fdivsqrt_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(fdivsqrt_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(fdivsqrt_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(fdivsqrt_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(fdivsqrt_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(fdivsqrt_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(fdivsqrt_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state(fdivsqrt_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(fdivsqrt_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(fdivsqrt_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(fdivsqrt_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(fdivsqrt_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(fdivsqrt_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(fdivsqrt_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(fdivsqrt_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(fdivsqrt_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(fdivsqrt_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(fdivsqrt_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(fdivsqrt_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(fdivsqrt_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(fdivsqrt_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(fdivsqrt_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(fdivsqrt_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(fdivsqrt_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(fdivsqrt_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(fdivsqrt_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(fdivsqrt_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(fdivsqrt_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(fdivsqrt_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(fdivsqrt_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(fdivsqrt_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(fdivsqrt_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(fdivsqrt_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(fdivsqrt_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(fdivsqrt_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(fdivsqrt_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(fdivsqrt_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(fdivsqrt_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(fdivsqrt_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(fdivsqrt_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(fdivsqrt_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(fdivsqrt_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(fdivsqrt_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(fdivsqrt_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(fdivsqrt_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(fdivsqrt_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(fdivsqrt_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(fdivsqrt_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(fdivsqrt_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(fdivsqrt_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(fdivsqrt_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(fdivsqrt_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(fdivsqrt_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(fdivsqrt_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(fdivsqrt_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(fdivsqrt_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(fdivsqrt_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(fdivsqrt_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(fdivsqrt_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(fdivsqrt_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(fdivsqrt_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(fdivsqrt_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(fdivsqrt_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(fdivsqrt_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(fdivsqrt_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(fdivsqrt_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(fdivsqrt_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(fdivsqrt_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(fdivsqrt_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_predicated(fdivsqrt_io_resp_bits_predicated),
    .io_resp_bits_data(fdivsqrt_io_resp_bits_data),
    .io_resp_bits_fflags_valid(fdivsqrt_io_resp_bits_fflags_valid),
    .io_resp_bits_fflags_bits_uop_uopc(fdivsqrt_io_resp_bits_fflags_bits_uop_uopc),
    .io_resp_bits_fflags_bits_uop_inst(fdivsqrt_io_resp_bits_fflags_bits_uop_inst),
    .io_resp_bits_fflags_bits_uop_debug_inst(fdivsqrt_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_resp_bits_fflags_bits_uop_is_rvc(fdivsqrt_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_resp_bits_fflags_bits_uop_debug_pc(fdivsqrt_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_resp_bits_fflags_bits_uop_iq_type(fdivsqrt_io_resp_bits_fflags_bits_uop_iq_type),
    .io_resp_bits_fflags_bits_uop_fu_code(fdivsqrt_io_resp_bits_fflags_bits_uop_fu_code),
    .io_resp_bits_fflags_bits_uop_ctrl_br_type(fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_resp_bits_fflags_bits_uop_ctrl_op1_sel(fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op2_sel(fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_imm_sel(fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op_fcn(fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflags_bits_uop_ctrl_fcn_dw(fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflags_bits_uop_ctrl_csr_cmd(fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflags_bits_uop_ctrl_is_load(fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_resp_bits_fflags_bits_uop_ctrl_is_sta(fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflags_bits_uop_ctrl_is_std(fdivsqrt_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_resp_bits_fflags_bits_uop_iw_state(fdivsqrt_io_resp_bits_fflags_bits_uop_iw_state),
    .io_resp_bits_fflags_bits_uop_iw_p1_poisoned(fdivsqrt_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflags_bits_uop_iw_p2_poisoned(fdivsqrt_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflags_bits_uop_is_br(fdivsqrt_io_resp_bits_fflags_bits_uop_is_br),
    .io_resp_bits_fflags_bits_uop_is_jalr(fdivsqrt_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_resp_bits_fflags_bits_uop_is_jal(fdivsqrt_io_resp_bits_fflags_bits_uop_is_jal),
    .io_resp_bits_fflags_bits_uop_is_sfb(fdivsqrt_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_resp_bits_fflags_bits_uop_br_mask(fdivsqrt_io_resp_bits_fflags_bits_uop_br_mask),
    .io_resp_bits_fflags_bits_uop_br_tag(fdivsqrt_io_resp_bits_fflags_bits_uop_br_tag),
    .io_resp_bits_fflags_bits_uop_ftq_idx(fdivsqrt_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_resp_bits_fflags_bits_uop_edge_inst(fdivsqrt_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_resp_bits_fflags_bits_uop_pc_lob(fdivsqrt_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_resp_bits_fflags_bits_uop_taken(fdivsqrt_io_resp_bits_fflags_bits_uop_taken),
    .io_resp_bits_fflags_bits_uop_imm_packed(fdivsqrt_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_resp_bits_fflags_bits_uop_csr_addr(fdivsqrt_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_resp_bits_fflags_bits_uop_rob_idx(fdivsqrt_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_resp_bits_fflags_bits_uop_ldq_idx(fdivsqrt_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_resp_bits_fflags_bits_uop_stq_idx(fdivsqrt_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_resp_bits_fflags_bits_uop_rxq_idx(fdivsqrt_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_resp_bits_fflags_bits_uop_pdst(fdivsqrt_io_resp_bits_fflags_bits_uop_pdst),
    .io_resp_bits_fflags_bits_uop_prs1(fdivsqrt_io_resp_bits_fflags_bits_uop_prs1),
    .io_resp_bits_fflags_bits_uop_prs2(fdivsqrt_io_resp_bits_fflags_bits_uop_prs2),
    .io_resp_bits_fflags_bits_uop_prs3(fdivsqrt_io_resp_bits_fflags_bits_uop_prs3),
    .io_resp_bits_fflags_bits_uop_ppred(fdivsqrt_io_resp_bits_fflags_bits_uop_ppred),
    .io_resp_bits_fflags_bits_uop_prs1_busy(fdivsqrt_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_resp_bits_fflags_bits_uop_prs2_busy(fdivsqrt_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_resp_bits_fflags_bits_uop_prs3_busy(fdivsqrt_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_resp_bits_fflags_bits_uop_ppred_busy(fdivsqrt_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_resp_bits_fflags_bits_uop_stale_pdst(fdivsqrt_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_resp_bits_fflags_bits_uop_exception(fdivsqrt_io_resp_bits_fflags_bits_uop_exception),
    .io_resp_bits_fflags_bits_uop_exc_cause(fdivsqrt_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_resp_bits_fflags_bits_uop_bypassable(fdivsqrt_io_resp_bits_fflags_bits_uop_bypassable),
    .io_resp_bits_fflags_bits_uop_mem_cmd(fdivsqrt_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_resp_bits_fflags_bits_uop_mem_size(fdivsqrt_io_resp_bits_fflags_bits_uop_mem_size),
    .io_resp_bits_fflags_bits_uop_mem_signed(fdivsqrt_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_resp_bits_fflags_bits_uop_is_fence(fdivsqrt_io_resp_bits_fflags_bits_uop_is_fence),
    .io_resp_bits_fflags_bits_uop_is_fencei(fdivsqrt_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_resp_bits_fflags_bits_uop_is_amo(fdivsqrt_io_resp_bits_fflags_bits_uop_is_amo),
    .io_resp_bits_fflags_bits_uop_uses_ldq(fdivsqrt_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_resp_bits_fflags_bits_uop_uses_stq(fdivsqrt_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_resp_bits_fflags_bits_uop_is_sys_pc2epc(fdivsqrt_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflags_bits_uop_is_unique(fdivsqrt_io_resp_bits_fflags_bits_uop_is_unique),
    .io_resp_bits_fflags_bits_uop_flush_on_commit(fdivsqrt_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_resp_bits_fflags_bits_uop_ldst_is_rs1(fdivsqrt_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflags_bits_uop_ldst(fdivsqrt_io_resp_bits_fflags_bits_uop_ldst),
    .io_resp_bits_fflags_bits_uop_lrs1(fdivsqrt_io_resp_bits_fflags_bits_uop_lrs1),
    .io_resp_bits_fflags_bits_uop_lrs2(fdivsqrt_io_resp_bits_fflags_bits_uop_lrs2),
    .io_resp_bits_fflags_bits_uop_lrs3(fdivsqrt_io_resp_bits_fflags_bits_uop_lrs3),
    .io_resp_bits_fflags_bits_uop_ldst_val(fdivsqrt_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_resp_bits_fflags_bits_uop_dst_rtype(fdivsqrt_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_resp_bits_fflags_bits_uop_lrs1_rtype(fdivsqrt_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_resp_bits_fflags_bits_uop_lrs2_rtype(fdivsqrt_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_resp_bits_fflags_bits_uop_frs3_en(fdivsqrt_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_resp_bits_fflags_bits_uop_fp_val(fdivsqrt_io_resp_bits_fflags_bits_uop_fp_val),
    .io_resp_bits_fflags_bits_uop_fp_single(fdivsqrt_io_resp_bits_fflags_bits_uop_fp_single),
    .io_resp_bits_fflags_bits_uop_xcpt_pf_if(fdivsqrt_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ae_if(fdivsqrt_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ma_if(fdivsqrt_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflags_bits_uop_bp_debug_if(fdivsqrt_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_resp_bits_fflags_bits_uop_bp_xcpt_if(fdivsqrt_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflags_bits_uop_debug_fsrc(fdivsqrt_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_resp_bits_fflags_bits_uop_debug_tsrc(fdivsqrt_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_resp_bits_fflags_bits_flags(fdivsqrt_io_resp_bits_fflags_bits_flags),
    .io_resp_bits_addr(fdivsqrt_io_resp_bits_addr),
    .io_resp_bits_mxcpt_valid(fdivsqrt_io_resp_bits_mxcpt_valid),
    .io_resp_bits_mxcpt_bits(fdivsqrt_io_resp_bits_mxcpt_bits),
    .io_resp_bits_sfence_valid(fdivsqrt_io_resp_bits_sfence_valid),
    .io_resp_bits_sfence_bits_rs1(fdivsqrt_io_resp_bits_sfence_bits_rs1),
    .io_resp_bits_sfence_bits_rs2(fdivsqrt_io_resp_bits_sfence_bits_rs2),
    .io_resp_bits_sfence_bits_addr(fdivsqrt_io_resp_bits_sfence_bits_addr),
    .io_resp_bits_sfence_bits_asid(fdivsqrt_io_resp_bits_sfence_bits_asid),
    .io_brupdate_b1_resolve_mask(fdivsqrt_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(fdivsqrt_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(fdivsqrt_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(fdivsqrt_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(fdivsqrt_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(fdivsqrt_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(fdivsqrt_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(fdivsqrt_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(fdivsqrt_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(fdivsqrt_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(fdivsqrt_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(fdivsqrt_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(fdivsqrt_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(fdivsqrt_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(fdivsqrt_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(fdivsqrt_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(fdivsqrt_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(fdivsqrt_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(fdivsqrt_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(fdivsqrt_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(fdivsqrt_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(fdivsqrt_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(fdivsqrt_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(fdivsqrt_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(fdivsqrt_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(fdivsqrt_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(fdivsqrt_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(fdivsqrt_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(fdivsqrt_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(fdivsqrt_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(fdivsqrt_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(fdivsqrt_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(fdivsqrt_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(fdivsqrt_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(fdivsqrt_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(fdivsqrt_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(fdivsqrt_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(fdivsqrt_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(fdivsqrt_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(fdivsqrt_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(fdivsqrt_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(fdivsqrt_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(fdivsqrt_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(fdivsqrt_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(fdivsqrt_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(fdivsqrt_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(fdivsqrt_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(fdivsqrt_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(fdivsqrt_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(fdivsqrt_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(fdivsqrt_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(fdivsqrt_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(fdivsqrt_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(fdivsqrt_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(fdivsqrt_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(fdivsqrt_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(fdivsqrt_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(fdivsqrt_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(fdivsqrt_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(fdivsqrt_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(fdivsqrt_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(fdivsqrt_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(fdivsqrt_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(fdivsqrt_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(fdivsqrt_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(fdivsqrt_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(fdivsqrt_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(fdivsqrt_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(fdivsqrt_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(fdivsqrt_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(fdivsqrt_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(fdivsqrt_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(fdivsqrt_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(fdivsqrt_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(fdivsqrt_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(fdivsqrt_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(fdivsqrt_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(fdivsqrt_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(fdivsqrt_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(fdivsqrt_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(fdivsqrt_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(fdivsqrt_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(fdivsqrt_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(fdivsqrt_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(fdivsqrt_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(fdivsqrt_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(fdivsqrt_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(fdivsqrt_io_brupdate_b2_target_offset),
    .io_fcsr_rm(fdivsqrt_io_fcsr_rm)
  );
  BranchKillableQueue_4 BranchKillableQueue ( // @[execution-unit.scala 528:23]
    .clock(BranchKillableQueue_clock),
    .reset(BranchKillableQueue_reset),
    .io_enq_ready(BranchKillableQueue_io_enq_ready),
    .io_enq_valid(BranchKillableQueue_io_enq_valid),
    .io_enq_bits_uop_uopc(BranchKillableQueue_io_enq_bits_uop_uopc),
    .io_enq_bits_uop_inst(BranchKillableQueue_io_enq_bits_uop_inst),
    .io_enq_bits_uop_debug_inst(BranchKillableQueue_io_enq_bits_uop_debug_inst),
    .io_enq_bits_uop_is_rvc(BranchKillableQueue_io_enq_bits_uop_is_rvc),
    .io_enq_bits_uop_debug_pc(BranchKillableQueue_io_enq_bits_uop_debug_pc),
    .io_enq_bits_uop_iq_type(BranchKillableQueue_io_enq_bits_uop_iq_type),
    .io_enq_bits_uop_fu_code(BranchKillableQueue_io_enq_bits_uop_fu_code),
    .io_enq_bits_uop_ctrl_br_type(BranchKillableQueue_io_enq_bits_uop_ctrl_br_type),
    .io_enq_bits_uop_ctrl_op1_sel(BranchKillableQueue_io_enq_bits_uop_ctrl_op1_sel),
    .io_enq_bits_uop_ctrl_op2_sel(BranchKillableQueue_io_enq_bits_uop_ctrl_op2_sel),
    .io_enq_bits_uop_ctrl_imm_sel(BranchKillableQueue_io_enq_bits_uop_ctrl_imm_sel),
    .io_enq_bits_uop_ctrl_op_fcn(BranchKillableQueue_io_enq_bits_uop_ctrl_op_fcn),
    .io_enq_bits_uop_ctrl_fcn_dw(BranchKillableQueue_io_enq_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_uop_ctrl_csr_cmd(BranchKillableQueue_io_enq_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_uop_ctrl_is_load(BranchKillableQueue_io_enq_bits_uop_ctrl_is_load),
    .io_enq_bits_uop_ctrl_is_sta(BranchKillableQueue_io_enq_bits_uop_ctrl_is_sta),
    .io_enq_bits_uop_ctrl_is_std(BranchKillableQueue_io_enq_bits_uop_ctrl_is_std),
    .io_enq_bits_uop_iw_state(BranchKillableQueue_io_enq_bits_uop_iw_state),
    .io_enq_bits_uop_iw_p1_poisoned(BranchKillableQueue_io_enq_bits_uop_iw_p1_poisoned),
    .io_enq_bits_uop_iw_p2_poisoned(BranchKillableQueue_io_enq_bits_uop_iw_p2_poisoned),
    .io_enq_bits_uop_is_br(BranchKillableQueue_io_enq_bits_uop_is_br),
    .io_enq_bits_uop_is_jalr(BranchKillableQueue_io_enq_bits_uop_is_jalr),
    .io_enq_bits_uop_is_jal(BranchKillableQueue_io_enq_bits_uop_is_jal),
    .io_enq_bits_uop_is_sfb(BranchKillableQueue_io_enq_bits_uop_is_sfb),
    .io_enq_bits_uop_br_mask(BranchKillableQueue_io_enq_bits_uop_br_mask),
    .io_enq_bits_uop_br_tag(BranchKillableQueue_io_enq_bits_uop_br_tag),
    .io_enq_bits_uop_ftq_idx(BranchKillableQueue_io_enq_bits_uop_ftq_idx),
    .io_enq_bits_uop_edge_inst(BranchKillableQueue_io_enq_bits_uop_edge_inst),
    .io_enq_bits_uop_pc_lob(BranchKillableQueue_io_enq_bits_uop_pc_lob),
    .io_enq_bits_uop_taken(BranchKillableQueue_io_enq_bits_uop_taken),
    .io_enq_bits_uop_imm_packed(BranchKillableQueue_io_enq_bits_uop_imm_packed),
    .io_enq_bits_uop_csr_addr(BranchKillableQueue_io_enq_bits_uop_csr_addr),
    .io_enq_bits_uop_rob_idx(BranchKillableQueue_io_enq_bits_uop_rob_idx),
    .io_enq_bits_uop_ldq_idx(BranchKillableQueue_io_enq_bits_uop_ldq_idx),
    .io_enq_bits_uop_stq_idx(BranchKillableQueue_io_enq_bits_uop_stq_idx),
    .io_enq_bits_uop_rxq_idx(BranchKillableQueue_io_enq_bits_uop_rxq_idx),
    .io_enq_bits_uop_pdst(BranchKillableQueue_io_enq_bits_uop_pdst),
    .io_enq_bits_uop_prs1(BranchKillableQueue_io_enq_bits_uop_prs1),
    .io_enq_bits_uop_prs2(BranchKillableQueue_io_enq_bits_uop_prs2),
    .io_enq_bits_uop_prs3(BranchKillableQueue_io_enq_bits_uop_prs3),
    .io_enq_bits_uop_ppred(BranchKillableQueue_io_enq_bits_uop_ppred),
    .io_enq_bits_uop_prs1_busy(BranchKillableQueue_io_enq_bits_uop_prs1_busy),
    .io_enq_bits_uop_prs2_busy(BranchKillableQueue_io_enq_bits_uop_prs2_busy),
    .io_enq_bits_uop_prs3_busy(BranchKillableQueue_io_enq_bits_uop_prs3_busy),
    .io_enq_bits_uop_ppred_busy(BranchKillableQueue_io_enq_bits_uop_ppred_busy),
    .io_enq_bits_uop_stale_pdst(BranchKillableQueue_io_enq_bits_uop_stale_pdst),
    .io_enq_bits_uop_exception(BranchKillableQueue_io_enq_bits_uop_exception),
    .io_enq_bits_uop_exc_cause(BranchKillableQueue_io_enq_bits_uop_exc_cause),
    .io_enq_bits_uop_bypassable(BranchKillableQueue_io_enq_bits_uop_bypassable),
    .io_enq_bits_uop_mem_cmd(BranchKillableQueue_io_enq_bits_uop_mem_cmd),
    .io_enq_bits_uop_mem_size(BranchKillableQueue_io_enq_bits_uop_mem_size),
    .io_enq_bits_uop_mem_signed(BranchKillableQueue_io_enq_bits_uop_mem_signed),
    .io_enq_bits_uop_is_fence(BranchKillableQueue_io_enq_bits_uop_is_fence),
    .io_enq_bits_uop_is_fencei(BranchKillableQueue_io_enq_bits_uop_is_fencei),
    .io_enq_bits_uop_is_amo(BranchKillableQueue_io_enq_bits_uop_is_amo),
    .io_enq_bits_uop_uses_ldq(BranchKillableQueue_io_enq_bits_uop_uses_ldq),
    .io_enq_bits_uop_uses_stq(BranchKillableQueue_io_enq_bits_uop_uses_stq),
    .io_enq_bits_uop_is_sys_pc2epc(BranchKillableQueue_io_enq_bits_uop_is_sys_pc2epc),
    .io_enq_bits_uop_is_unique(BranchKillableQueue_io_enq_bits_uop_is_unique),
    .io_enq_bits_uop_flush_on_commit(BranchKillableQueue_io_enq_bits_uop_flush_on_commit),
    .io_enq_bits_uop_ldst_is_rs1(BranchKillableQueue_io_enq_bits_uop_ldst_is_rs1),
    .io_enq_bits_uop_ldst(BranchKillableQueue_io_enq_bits_uop_ldst),
    .io_enq_bits_uop_lrs1(BranchKillableQueue_io_enq_bits_uop_lrs1),
    .io_enq_bits_uop_lrs2(BranchKillableQueue_io_enq_bits_uop_lrs2),
    .io_enq_bits_uop_lrs3(BranchKillableQueue_io_enq_bits_uop_lrs3),
    .io_enq_bits_uop_ldst_val(BranchKillableQueue_io_enq_bits_uop_ldst_val),
    .io_enq_bits_uop_dst_rtype(BranchKillableQueue_io_enq_bits_uop_dst_rtype),
    .io_enq_bits_uop_lrs1_rtype(BranchKillableQueue_io_enq_bits_uop_lrs1_rtype),
    .io_enq_bits_uop_lrs2_rtype(BranchKillableQueue_io_enq_bits_uop_lrs2_rtype),
    .io_enq_bits_uop_frs3_en(BranchKillableQueue_io_enq_bits_uop_frs3_en),
    .io_enq_bits_uop_fp_val(BranchKillableQueue_io_enq_bits_uop_fp_val),
    .io_enq_bits_uop_fp_single(BranchKillableQueue_io_enq_bits_uop_fp_single),
    .io_enq_bits_uop_xcpt_pf_if(BranchKillableQueue_io_enq_bits_uop_xcpt_pf_if),
    .io_enq_bits_uop_xcpt_ae_if(BranchKillableQueue_io_enq_bits_uop_xcpt_ae_if),
    .io_enq_bits_uop_xcpt_ma_if(BranchKillableQueue_io_enq_bits_uop_xcpt_ma_if),
    .io_enq_bits_uop_bp_debug_if(BranchKillableQueue_io_enq_bits_uop_bp_debug_if),
    .io_enq_bits_uop_bp_xcpt_if(BranchKillableQueue_io_enq_bits_uop_bp_xcpt_if),
    .io_enq_bits_uop_debug_fsrc(BranchKillableQueue_io_enq_bits_uop_debug_fsrc),
    .io_enq_bits_uop_debug_tsrc(BranchKillableQueue_io_enq_bits_uop_debug_tsrc),
    .io_enq_bits_data(BranchKillableQueue_io_enq_bits_data),
    .io_enq_bits_predicated(BranchKillableQueue_io_enq_bits_predicated),
    .io_enq_bits_fflags_valid(BranchKillableQueue_io_enq_bits_fflags_valid),
    .io_enq_bits_fflags_bits_uop_uopc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_uopc),
    .io_enq_bits_fflags_bits_uop_inst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_inst),
    .io_enq_bits_fflags_bits_uop_debug_inst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_inst),
    .io_enq_bits_fflags_bits_uop_is_rvc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_rvc),
    .io_enq_bits_fflags_bits_uop_debug_pc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_pc),
    .io_enq_bits_fflags_bits_uop_iq_type(BranchKillableQueue_io_enq_bits_fflags_bits_uop_iq_type),
    .io_enq_bits_fflags_bits_uop_fu_code(BranchKillableQueue_io_enq_bits_fflags_bits_uop_fu_code),
    .io_enq_bits_fflags_bits_uop_ctrl_br_type(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_br_type),
    .io_enq_bits_fflags_bits_uop_ctrl_op1_sel(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_op2_sel(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_imm_sel(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_op_fcn(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_enq_bits_fflags_bits_uop_ctrl_fcn_dw(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_fflags_bits_uop_ctrl_csr_cmd(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_fflags_bits_uop_ctrl_is_load(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_load),
    .io_enq_bits_fflags_bits_uop_ctrl_is_sta(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_sta),
    .io_enq_bits_fflags_bits_uop_ctrl_is_std(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_std),
    .io_enq_bits_fflags_bits_uop_iw_state(BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_state),
    .io_enq_bits_fflags_bits_uop_iw_p1_poisoned(BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_enq_bits_fflags_bits_uop_iw_p2_poisoned(BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_enq_bits_fflags_bits_uop_is_br(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_br),
    .io_enq_bits_fflags_bits_uop_is_jalr(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jalr),
    .io_enq_bits_fflags_bits_uop_is_jal(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jal),
    .io_enq_bits_fflags_bits_uop_is_sfb(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sfb),
    .io_enq_bits_fflags_bits_uop_br_mask(BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_mask),
    .io_enq_bits_fflags_bits_uop_br_tag(BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_tag),
    .io_enq_bits_fflags_bits_uop_ftq_idx(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ftq_idx),
    .io_enq_bits_fflags_bits_uop_edge_inst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_edge_inst),
    .io_enq_bits_fflags_bits_uop_pc_lob(BranchKillableQueue_io_enq_bits_fflags_bits_uop_pc_lob),
    .io_enq_bits_fflags_bits_uop_taken(BranchKillableQueue_io_enq_bits_fflags_bits_uop_taken),
    .io_enq_bits_fflags_bits_uop_imm_packed(BranchKillableQueue_io_enq_bits_fflags_bits_uop_imm_packed),
    .io_enq_bits_fflags_bits_uop_csr_addr(BranchKillableQueue_io_enq_bits_fflags_bits_uop_csr_addr),
    .io_enq_bits_fflags_bits_uop_rob_idx(BranchKillableQueue_io_enq_bits_fflags_bits_uop_rob_idx),
    .io_enq_bits_fflags_bits_uop_ldq_idx(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldq_idx),
    .io_enq_bits_fflags_bits_uop_stq_idx(BranchKillableQueue_io_enq_bits_fflags_bits_uop_stq_idx),
    .io_enq_bits_fflags_bits_uop_rxq_idx(BranchKillableQueue_io_enq_bits_fflags_bits_uop_rxq_idx),
    .io_enq_bits_fflags_bits_uop_pdst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_pdst),
    .io_enq_bits_fflags_bits_uop_prs1(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1),
    .io_enq_bits_fflags_bits_uop_prs2(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2),
    .io_enq_bits_fflags_bits_uop_prs3(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3),
    .io_enq_bits_fflags_bits_uop_ppred(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred),
    .io_enq_bits_fflags_bits_uop_prs1_busy(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1_busy),
    .io_enq_bits_fflags_bits_uop_prs2_busy(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2_busy),
    .io_enq_bits_fflags_bits_uop_prs3_busy(BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3_busy),
    .io_enq_bits_fflags_bits_uop_ppred_busy(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred_busy),
    .io_enq_bits_fflags_bits_uop_stale_pdst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_stale_pdst),
    .io_enq_bits_fflags_bits_uop_exception(BranchKillableQueue_io_enq_bits_fflags_bits_uop_exception),
    .io_enq_bits_fflags_bits_uop_exc_cause(BranchKillableQueue_io_enq_bits_fflags_bits_uop_exc_cause),
    .io_enq_bits_fflags_bits_uop_bypassable(BranchKillableQueue_io_enq_bits_fflags_bits_uop_bypassable),
    .io_enq_bits_fflags_bits_uop_mem_cmd(BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_cmd),
    .io_enq_bits_fflags_bits_uop_mem_size(BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_size),
    .io_enq_bits_fflags_bits_uop_mem_signed(BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_signed),
    .io_enq_bits_fflags_bits_uop_is_fence(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fence),
    .io_enq_bits_fflags_bits_uop_is_fencei(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fencei),
    .io_enq_bits_fflags_bits_uop_is_amo(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_amo),
    .io_enq_bits_fflags_bits_uop_uses_ldq(BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_ldq),
    .io_enq_bits_fflags_bits_uop_uses_stq(BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_stq),
    .io_enq_bits_fflags_bits_uop_is_sys_pc2epc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_enq_bits_fflags_bits_uop_is_unique(BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_unique),
    .io_enq_bits_fflags_bits_uop_flush_on_commit(BranchKillableQueue_io_enq_bits_fflags_bits_uop_flush_on_commit),
    .io_enq_bits_fflags_bits_uop_ldst_is_rs1(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_is_rs1),
    .io_enq_bits_fflags_bits_uop_ldst(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst),
    .io_enq_bits_fflags_bits_uop_lrs1(BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1),
    .io_enq_bits_fflags_bits_uop_lrs2(BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2),
    .io_enq_bits_fflags_bits_uop_lrs3(BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs3),
    .io_enq_bits_fflags_bits_uop_ldst_val(BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_val),
    .io_enq_bits_fflags_bits_uop_dst_rtype(BranchKillableQueue_io_enq_bits_fflags_bits_uop_dst_rtype),
    .io_enq_bits_fflags_bits_uop_lrs1_rtype(BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1_rtype),
    .io_enq_bits_fflags_bits_uop_lrs2_rtype(BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2_rtype),
    .io_enq_bits_fflags_bits_uop_frs3_en(BranchKillableQueue_io_enq_bits_fflags_bits_uop_frs3_en),
    .io_enq_bits_fflags_bits_uop_fp_val(BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_val),
    .io_enq_bits_fflags_bits_uop_fp_single(BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_single),
    .io_enq_bits_fflags_bits_uop_xcpt_pf_if(BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_pf_if),
    .io_enq_bits_fflags_bits_uop_xcpt_ae_if(BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ae_if),
    .io_enq_bits_fflags_bits_uop_xcpt_ma_if(BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ma_if),
    .io_enq_bits_fflags_bits_uop_bp_debug_if(BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_debug_if),
    .io_enq_bits_fflags_bits_uop_bp_xcpt_if(BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_xcpt_if),
    .io_enq_bits_fflags_bits_uop_debug_fsrc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_fsrc),
    .io_enq_bits_fflags_bits_uop_debug_tsrc(BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_tsrc),
    .io_enq_bits_fflags_bits_flags(BranchKillableQueue_io_enq_bits_fflags_bits_flags),
    .io_deq_ready(BranchKillableQueue_io_deq_ready),
    .io_deq_valid(BranchKillableQueue_io_deq_valid),
    .io_deq_bits_uop_uopc(BranchKillableQueue_io_deq_bits_uop_uopc),
    .io_deq_bits_uop_inst(BranchKillableQueue_io_deq_bits_uop_inst),
    .io_deq_bits_uop_debug_inst(BranchKillableQueue_io_deq_bits_uop_debug_inst),
    .io_deq_bits_uop_is_rvc(BranchKillableQueue_io_deq_bits_uop_is_rvc),
    .io_deq_bits_uop_debug_pc(BranchKillableQueue_io_deq_bits_uop_debug_pc),
    .io_deq_bits_uop_iq_type(BranchKillableQueue_io_deq_bits_uop_iq_type),
    .io_deq_bits_uop_fu_code(BranchKillableQueue_io_deq_bits_uop_fu_code),
    .io_deq_bits_uop_ctrl_br_type(BranchKillableQueue_io_deq_bits_uop_ctrl_br_type),
    .io_deq_bits_uop_ctrl_op1_sel(BranchKillableQueue_io_deq_bits_uop_ctrl_op1_sel),
    .io_deq_bits_uop_ctrl_op2_sel(BranchKillableQueue_io_deq_bits_uop_ctrl_op2_sel),
    .io_deq_bits_uop_ctrl_imm_sel(BranchKillableQueue_io_deq_bits_uop_ctrl_imm_sel),
    .io_deq_bits_uop_ctrl_op_fcn(BranchKillableQueue_io_deq_bits_uop_ctrl_op_fcn),
    .io_deq_bits_uop_ctrl_fcn_dw(BranchKillableQueue_io_deq_bits_uop_ctrl_fcn_dw),
    .io_deq_bits_uop_ctrl_csr_cmd(BranchKillableQueue_io_deq_bits_uop_ctrl_csr_cmd),
    .io_deq_bits_uop_ctrl_is_load(BranchKillableQueue_io_deq_bits_uop_ctrl_is_load),
    .io_deq_bits_uop_ctrl_is_sta(BranchKillableQueue_io_deq_bits_uop_ctrl_is_sta),
    .io_deq_bits_uop_ctrl_is_std(BranchKillableQueue_io_deq_bits_uop_ctrl_is_std),
    .io_deq_bits_uop_iw_state(BranchKillableQueue_io_deq_bits_uop_iw_state),
    .io_deq_bits_uop_iw_p1_poisoned(BranchKillableQueue_io_deq_bits_uop_iw_p1_poisoned),
    .io_deq_bits_uop_iw_p2_poisoned(BranchKillableQueue_io_deq_bits_uop_iw_p2_poisoned),
    .io_deq_bits_uop_is_br(BranchKillableQueue_io_deq_bits_uop_is_br),
    .io_deq_bits_uop_is_jalr(BranchKillableQueue_io_deq_bits_uop_is_jalr),
    .io_deq_bits_uop_is_jal(BranchKillableQueue_io_deq_bits_uop_is_jal),
    .io_deq_bits_uop_is_sfb(BranchKillableQueue_io_deq_bits_uop_is_sfb),
    .io_deq_bits_uop_br_mask(BranchKillableQueue_io_deq_bits_uop_br_mask),
    .io_deq_bits_uop_br_tag(BranchKillableQueue_io_deq_bits_uop_br_tag),
    .io_deq_bits_uop_ftq_idx(BranchKillableQueue_io_deq_bits_uop_ftq_idx),
    .io_deq_bits_uop_edge_inst(BranchKillableQueue_io_deq_bits_uop_edge_inst),
    .io_deq_bits_uop_pc_lob(BranchKillableQueue_io_deq_bits_uop_pc_lob),
    .io_deq_bits_uop_taken(BranchKillableQueue_io_deq_bits_uop_taken),
    .io_deq_bits_uop_imm_packed(BranchKillableQueue_io_deq_bits_uop_imm_packed),
    .io_deq_bits_uop_csr_addr(BranchKillableQueue_io_deq_bits_uop_csr_addr),
    .io_deq_bits_uop_rob_idx(BranchKillableQueue_io_deq_bits_uop_rob_idx),
    .io_deq_bits_uop_ldq_idx(BranchKillableQueue_io_deq_bits_uop_ldq_idx),
    .io_deq_bits_uop_stq_idx(BranchKillableQueue_io_deq_bits_uop_stq_idx),
    .io_deq_bits_uop_rxq_idx(BranchKillableQueue_io_deq_bits_uop_rxq_idx),
    .io_deq_bits_uop_pdst(BranchKillableQueue_io_deq_bits_uop_pdst),
    .io_deq_bits_uop_prs1(BranchKillableQueue_io_deq_bits_uop_prs1),
    .io_deq_bits_uop_prs2(BranchKillableQueue_io_deq_bits_uop_prs2),
    .io_deq_bits_uop_prs3(BranchKillableQueue_io_deq_bits_uop_prs3),
    .io_deq_bits_uop_ppred(BranchKillableQueue_io_deq_bits_uop_ppred),
    .io_deq_bits_uop_prs1_busy(BranchKillableQueue_io_deq_bits_uop_prs1_busy),
    .io_deq_bits_uop_prs2_busy(BranchKillableQueue_io_deq_bits_uop_prs2_busy),
    .io_deq_bits_uop_prs3_busy(BranchKillableQueue_io_deq_bits_uop_prs3_busy),
    .io_deq_bits_uop_ppred_busy(BranchKillableQueue_io_deq_bits_uop_ppred_busy),
    .io_deq_bits_uop_stale_pdst(BranchKillableQueue_io_deq_bits_uop_stale_pdst),
    .io_deq_bits_uop_exception(BranchKillableQueue_io_deq_bits_uop_exception),
    .io_deq_bits_uop_exc_cause(BranchKillableQueue_io_deq_bits_uop_exc_cause),
    .io_deq_bits_uop_bypassable(BranchKillableQueue_io_deq_bits_uop_bypassable),
    .io_deq_bits_uop_mem_cmd(BranchKillableQueue_io_deq_bits_uop_mem_cmd),
    .io_deq_bits_uop_mem_size(BranchKillableQueue_io_deq_bits_uop_mem_size),
    .io_deq_bits_uop_mem_signed(BranchKillableQueue_io_deq_bits_uop_mem_signed),
    .io_deq_bits_uop_is_fence(BranchKillableQueue_io_deq_bits_uop_is_fence),
    .io_deq_bits_uop_is_fencei(BranchKillableQueue_io_deq_bits_uop_is_fencei),
    .io_deq_bits_uop_is_amo(BranchKillableQueue_io_deq_bits_uop_is_amo),
    .io_deq_bits_uop_uses_ldq(BranchKillableQueue_io_deq_bits_uop_uses_ldq),
    .io_deq_bits_uop_uses_stq(BranchKillableQueue_io_deq_bits_uop_uses_stq),
    .io_deq_bits_uop_is_sys_pc2epc(BranchKillableQueue_io_deq_bits_uop_is_sys_pc2epc),
    .io_deq_bits_uop_is_unique(BranchKillableQueue_io_deq_bits_uop_is_unique),
    .io_deq_bits_uop_flush_on_commit(BranchKillableQueue_io_deq_bits_uop_flush_on_commit),
    .io_deq_bits_uop_ldst_is_rs1(BranchKillableQueue_io_deq_bits_uop_ldst_is_rs1),
    .io_deq_bits_uop_ldst(BranchKillableQueue_io_deq_bits_uop_ldst),
    .io_deq_bits_uop_lrs1(BranchKillableQueue_io_deq_bits_uop_lrs1),
    .io_deq_bits_uop_lrs2(BranchKillableQueue_io_deq_bits_uop_lrs2),
    .io_deq_bits_uop_lrs3(BranchKillableQueue_io_deq_bits_uop_lrs3),
    .io_deq_bits_uop_ldst_val(BranchKillableQueue_io_deq_bits_uop_ldst_val),
    .io_deq_bits_uop_dst_rtype(BranchKillableQueue_io_deq_bits_uop_dst_rtype),
    .io_deq_bits_uop_lrs1_rtype(BranchKillableQueue_io_deq_bits_uop_lrs1_rtype),
    .io_deq_bits_uop_lrs2_rtype(BranchKillableQueue_io_deq_bits_uop_lrs2_rtype),
    .io_deq_bits_uop_frs3_en(BranchKillableQueue_io_deq_bits_uop_frs3_en),
    .io_deq_bits_uop_fp_val(BranchKillableQueue_io_deq_bits_uop_fp_val),
    .io_deq_bits_uop_fp_single(BranchKillableQueue_io_deq_bits_uop_fp_single),
    .io_deq_bits_uop_xcpt_pf_if(BranchKillableQueue_io_deq_bits_uop_xcpt_pf_if),
    .io_deq_bits_uop_xcpt_ae_if(BranchKillableQueue_io_deq_bits_uop_xcpt_ae_if),
    .io_deq_bits_uop_xcpt_ma_if(BranchKillableQueue_io_deq_bits_uop_xcpt_ma_if),
    .io_deq_bits_uop_bp_debug_if(BranchKillableQueue_io_deq_bits_uop_bp_debug_if),
    .io_deq_bits_uop_bp_xcpt_if(BranchKillableQueue_io_deq_bits_uop_bp_xcpt_if),
    .io_deq_bits_uop_debug_fsrc(BranchKillableQueue_io_deq_bits_uop_debug_fsrc),
    .io_deq_bits_uop_debug_tsrc(BranchKillableQueue_io_deq_bits_uop_debug_tsrc),
    .io_deq_bits_data(BranchKillableQueue_io_deq_bits_data),
    .io_deq_bits_predicated(BranchKillableQueue_io_deq_bits_predicated),
    .io_deq_bits_fflags_valid(BranchKillableQueue_io_deq_bits_fflags_valid),
    .io_deq_bits_fflags_bits_uop_uopc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_uopc),
    .io_deq_bits_fflags_bits_uop_inst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_inst),
    .io_deq_bits_fflags_bits_uop_debug_inst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_inst),
    .io_deq_bits_fflags_bits_uop_is_rvc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_rvc),
    .io_deq_bits_fflags_bits_uop_debug_pc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_pc),
    .io_deq_bits_fflags_bits_uop_iq_type(BranchKillableQueue_io_deq_bits_fflags_bits_uop_iq_type),
    .io_deq_bits_fflags_bits_uop_fu_code(BranchKillableQueue_io_deq_bits_fflags_bits_uop_fu_code),
    .io_deq_bits_fflags_bits_uop_ctrl_br_type(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_br_type),
    .io_deq_bits_fflags_bits_uop_ctrl_op1_sel(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_deq_bits_fflags_bits_uop_ctrl_op2_sel(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_deq_bits_fflags_bits_uop_ctrl_imm_sel(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_deq_bits_fflags_bits_uop_ctrl_op_fcn(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_deq_bits_fflags_bits_uop_ctrl_fcn_dw(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_deq_bits_fflags_bits_uop_ctrl_csr_cmd(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_deq_bits_fflags_bits_uop_ctrl_is_load(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_load),
    .io_deq_bits_fflags_bits_uop_ctrl_is_sta(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_sta),
    .io_deq_bits_fflags_bits_uop_ctrl_is_std(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_std),
    .io_deq_bits_fflags_bits_uop_iw_state(BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_state),
    .io_deq_bits_fflags_bits_uop_iw_p1_poisoned(BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_deq_bits_fflags_bits_uop_iw_p2_poisoned(BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_deq_bits_fflags_bits_uop_is_br(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_br),
    .io_deq_bits_fflags_bits_uop_is_jalr(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jalr),
    .io_deq_bits_fflags_bits_uop_is_jal(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jal),
    .io_deq_bits_fflags_bits_uop_is_sfb(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sfb),
    .io_deq_bits_fflags_bits_uop_br_mask(BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_mask),
    .io_deq_bits_fflags_bits_uop_br_tag(BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_tag),
    .io_deq_bits_fflags_bits_uop_ftq_idx(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ftq_idx),
    .io_deq_bits_fflags_bits_uop_edge_inst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_edge_inst),
    .io_deq_bits_fflags_bits_uop_pc_lob(BranchKillableQueue_io_deq_bits_fflags_bits_uop_pc_lob),
    .io_deq_bits_fflags_bits_uop_taken(BranchKillableQueue_io_deq_bits_fflags_bits_uop_taken),
    .io_deq_bits_fflags_bits_uop_imm_packed(BranchKillableQueue_io_deq_bits_fflags_bits_uop_imm_packed),
    .io_deq_bits_fflags_bits_uop_csr_addr(BranchKillableQueue_io_deq_bits_fflags_bits_uop_csr_addr),
    .io_deq_bits_fflags_bits_uop_rob_idx(BranchKillableQueue_io_deq_bits_fflags_bits_uop_rob_idx),
    .io_deq_bits_fflags_bits_uop_ldq_idx(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldq_idx),
    .io_deq_bits_fflags_bits_uop_stq_idx(BranchKillableQueue_io_deq_bits_fflags_bits_uop_stq_idx),
    .io_deq_bits_fflags_bits_uop_rxq_idx(BranchKillableQueue_io_deq_bits_fflags_bits_uop_rxq_idx),
    .io_deq_bits_fflags_bits_uop_pdst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_pdst),
    .io_deq_bits_fflags_bits_uop_prs1(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1),
    .io_deq_bits_fflags_bits_uop_prs2(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2),
    .io_deq_bits_fflags_bits_uop_prs3(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3),
    .io_deq_bits_fflags_bits_uop_ppred(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred),
    .io_deq_bits_fflags_bits_uop_prs1_busy(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1_busy),
    .io_deq_bits_fflags_bits_uop_prs2_busy(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2_busy),
    .io_deq_bits_fflags_bits_uop_prs3_busy(BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3_busy),
    .io_deq_bits_fflags_bits_uop_ppred_busy(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred_busy),
    .io_deq_bits_fflags_bits_uop_stale_pdst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_stale_pdst),
    .io_deq_bits_fflags_bits_uop_exception(BranchKillableQueue_io_deq_bits_fflags_bits_uop_exception),
    .io_deq_bits_fflags_bits_uop_exc_cause(BranchKillableQueue_io_deq_bits_fflags_bits_uop_exc_cause),
    .io_deq_bits_fflags_bits_uop_bypassable(BranchKillableQueue_io_deq_bits_fflags_bits_uop_bypassable),
    .io_deq_bits_fflags_bits_uop_mem_cmd(BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_cmd),
    .io_deq_bits_fflags_bits_uop_mem_size(BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_size),
    .io_deq_bits_fflags_bits_uop_mem_signed(BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_signed),
    .io_deq_bits_fflags_bits_uop_is_fence(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fence),
    .io_deq_bits_fflags_bits_uop_is_fencei(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fencei),
    .io_deq_bits_fflags_bits_uop_is_amo(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_amo),
    .io_deq_bits_fflags_bits_uop_uses_ldq(BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_ldq),
    .io_deq_bits_fflags_bits_uop_uses_stq(BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_stq),
    .io_deq_bits_fflags_bits_uop_is_sys_pc2epc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_deq_bits_fflags_bits_uop_is_unique(BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_unique),
    .io_deq_bits_fflags_bits_uop_flush_on_commit(BranchKillableQueue_io_deq_bits_fflags_bits_uop_flush_on_commit),
    .io_deq_bits_fflags_bits_uop_ldst_is_rs1(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_is_rs1),
    .io_deq_bits_fflags_bits_uop_ldst(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst),
    .io_deq_bits_fflags_bits_uop_lrs1(BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1),
    .io_deq_bits_fflags_bits_uop_lrs2(BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2),
    .io_deq_bits_fflags_bits_uop_lrs3(BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs3),
    .io_deq_bits_fflags_bits_uop_ldst_val(BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_val),
    .io_deq_bits_fflags_bits_uop_dst_rtype(BranchKillableQueue_io_deq_bits_fflags_bits_uop_dst_rtype),
    .io_deq_bits_fflags_bits_uop_lrs1_rtype(BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1_rtype),
    .io_deq_bits_fflags_bits_uop_lrs2_rtype(BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2_rtype),
    .io_deq_bits_fflags_bits_uop_frs3_en(BranchKillableQueue_io_deq_bits_fflags_bits_uop_frs3_en),
    .io_deq_bits_fflags_bits_uop_fp_val(BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_val),
    .io_deq_bits_fflags_bits_uop_fp_single(BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_single),
    .io_deq_bits_fflags_bits_uop_xcpt_pf_if(BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_pf_if),
    .io_deq_bits_fflags_bits_uop_xcpt_ae_if(BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ae_if),
    .io_deq_bits_fflags_bits_uop_xcpt_ma_if(BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ma_if),
    .io_deq_bits_fflags_bits_uop_bp_debug_if(BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_debug_if),
    .io_deq_bits_fflags_bits_uop_bp_xcpt_if(BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_xcpt_if),
    .io_deq_bits_fflags_bits_uop_debug_fsrc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_fsrc),
    .io_deq_bits_fflags_bits_uop_debug_tsrc(BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_tsrc),
    .io_deq_bits_fflags_bits_flags(BranchKillableQueue_io_deq_bits_fflags_bits_flags),
    .io_brupdate_b1_resolve_mask(BranchKillableQueue_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(BranchKillableQueue_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(BranchKillableQueue_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(BranchKillableQueue_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(BranchKillableQueue_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(BranchKillableQueue_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(BranchKillableQueue_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(BranchKillableQueue_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(BranchKillableQueue_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(BranchKillableQueue_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(BranchKillableQueue_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(BranchKillableQueue_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(BranchKillableQueue_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(BranchKillableQueue_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(BranchKillableQueue_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(BranchKillableQueue_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(BranchKillableQueue_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(BranchKillableQueue_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(BranchKillableQueue_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(BranchKillableQueue_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(BranchKillableQueue_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(BranchKillableQueue_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(BranchKillableQueue_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(BranchKillableQueue_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(BranchKillableQueue_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(BranchKillableQueue_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(BranchKillableQueue_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(BranchKillableQueue_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(BranchKillableQueue_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(BranchKillableQueue_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(BranchKillableQueue_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(BranchKillableQueue_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(BranchKillableQueue_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(BranchKillableQueue_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(BranchKillableQueue_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(BranchKillableQueue_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(BranchKillableQueue_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(BranchKillableQueue_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(BranchKillableQueue_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(BranchKillableQueue_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(BranchKillableQueue_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(BranchKillableQueue_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(BranchKillableQueue_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(BranchKillableQueue_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(BranchKillableQueue_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(BranchKillableQueue_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(BranchKillableQueue_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(BranchKillableQueue_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(BranchKillableQueue_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(BranchKillableQueue_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(BranchKillableQueue_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(BranchKillableQueue_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(BranchKillableQueue_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(BranchKillableQueue_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(BranchKillableQueue_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(BranchKillableQueue_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(BranchKillableQueue_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(BranchKillableQueue_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(BranchKillableQueue_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(BranchKillableQueue_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(BranchKillableQueue_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(BranchKillableQueue_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(BranchKillableQueue_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(BranchKillableQueue_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(BranchKillableQueue_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(BranchKillableQueue_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(BranchKillableQueue_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(BranchKillableQueue_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(BranchKillableQueue_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(BranchKillableQueue_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(BranchKillableQueue_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(BranchKillableQueue_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(BranchKillableQueue_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(BranchKillableQueue_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(BranchKillableQueue_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(BranchKillableQueue_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(BranchKillableQueue_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(BranchKillableQueue_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(BranchKillableQueue_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(BranchKillableQueue_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(BranchKillableQueue_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(BranchKillableQueue_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(BranchKillableQueue_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(BranchKillableQueue_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(BranchKillableQueue_io_brupdate_b2_target_offset),
    .io_flush(BranchKillableQueue_io_flush),
    .io_empty(BranchKillableQueue_io_empty),
    .io_count(BranchKillableQueue_io_count)
  );
  BranchKillableQueue_5 BranchKillableQueue_1 ( // @[execution-unit.scala 542:24]
    .clock(BranchKillableQueue_1_clock),
    .reset(BranchKillableQueue_1_reset),
    .io_enq_ready(BranchKillableQueue_1_io_enq_ready),
    .io_enq_valid(BranchKillableQueue_1_io_enq_valid),
    .io_enq_bits_uop_uopc(BranchKillableQueue_1_io_enq_bits_uop_uopc),
    .io_enq_bits_uop_inst(BranchKillableQueue_1_io_enq_bits_uop_inst),
    .io_enq_bits_uop_debug_inst(BranchKillableQueue_1_io_enq_bits_uop_debug_inst),
    .io_enq_bits_uop_is_rvc(BranchKillableQueue_1_io_enq_bits_uop_is_rvc),
    .io_enq_bits_uop_debug_pc(BranchKillableQueue_1_io_enq_bits_uop_debug_pc),
    .io_enq_bits_uop_iq_type(BranchKillableQueue_1_io_enq_bits_uop_iq_type),
    .io_enq_bits_uop_fu_code(BranchKillableQueue_1_io_enq_bits_uop_fu_code),
    .io_enq_bits_uop_ctrl_br_type(BranchKillableQueue_1_io_enq_bits_uop_ctrl_br_type),
    .io_enq_bits_uop_ctrl_op1_sel(BranchKillableQueue_1_io_enq_bits_uop_ctrl_op1_sel),
    .io_enq_bits_uop_ctrl_op2_sel(BranchKillableQueue_1_io_enq_bits_uop_ctrl_op2_sel),
    .io_enq_bits_uop_ctrl_imm_sel(BranchKillableQueue_1_io_enq_bits_uop_ctrl_imm_sel),
    .io_enq_bits_uop_ctrl_op_fcn(BranchKillableQueue_1_io_enq_bits_uop_ctrl_op_fcn),
    .io_enq_bits_uop_ctrl_fcn_dw(BranchKillableQueue_1_io_enq_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_uop_ctrl_csr_cmd(BranchKillableQueue_1_io_enq_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_uop_ctrl_is_load(BranchKillableQueue_1_io_enq_bits_uop_ctrl_is_load),
    .io_enq_bits_uop_ctrl_is_sta(BranchKillableQueue_1_io_enq_bits_uop_ctrl_is_sta),
    .io_enq_bits_uop_ctrl_is_std(BranchKillableQueue_1_io_enq_bits_uop_ctrl_is_std),
    .io_enq_bits_uop_iw_state(BranchKillableQueue_1_io_enq_bits_uop_iw_state),
    .io_enq_bits_uop_iw_p1_poisoned(BranchKillableQueue_1_io_enq_bits_uop_iw_p1_poisoned),
    .io_enq_bits_uop_iw_p2_poisoned(BranchKillableQueue_1_io_enq_bits_uop_iw_p2_poisoned),
    .io_enq_bits_uop_is_br(BranchKillableQueue_1_io_enq_bits_uop_is_br),
    .io_enq_bits_uop_is_jalr(BranchKillableQueue_1_io_enq_bits_uop_is_jalr),
    .io_enq_bits_uop_is_jal(BranchKillableQueue_1_io_enq_bits_uop_is_jal),
    .io_enq_bits_uop_is_sfb(BranchKillableQueue_1_io_enq_bits_uop_is_sfb),
    .io_enq_bits_uop_br_mask(BranchKillableQueue_1_io_enq_bits_uop_br_mask),
    .io_enq_bits_uop_br_tag(BranchKillableQueue_1_io_enq_bits_uop_br_tag),
    .io_enq_bits_uop_ftq_idx(BranchKillableQueue_1_io_enq_bits_uop_ftq_idx),
    .io_enq_bits_uop_edge_inst(BranchKillableQueue_1_io_enq_bits_uop_edge_inst),
    .io_enq_bits_uop_pc_lob(BranchKillableQueue_1_io_enq_bits_uop_pc_lob),
    .io_enq_bits_uop_taken(BranchKillableQueue_1_io_enq_bits_uop_taken),
    .io_enq_bits_uop_imm_packed(BranchKillableQueue_1_io_enq_bits_uop_imm_packed),
    .io_enq_bits_uop_csr_addr(BranchKillableQueue_1_io_enq_bits_uop_csr_addr),
    .io_enq_bits_uop_rob_idx(BranchKillableQueue_1_io_enq_bits_uop_rob_idx),
    .io_enq_bits_uop_ldq_idx(BranchKillableQueue_1_io_enq_bits_uop_ldq_idx),
    .io_enq_bits_uop_stq_idx(BranchKillableQueue_1_io_enq_bits_uop_stq_idx),
    .io_enq_bits_uop_rxq_idx(BranchKillableQueue_1_io_enq_bits_uop_rxq_idx),
    .io_enq_bits_uop_pdst(BranchKillableQueue_1_io_enq_bits_uop_pdst),
    .io_enq_bits_uop_prs1(BranchKillableQueue_1_io_enq_bits_uop_prs1),
    .io_enq_bits_uop_prs2(BranchKillableQueue_1_io_enq_bits_uop_prs2),
    .io_enq_bits_uop_prs3(BranchKillableQueue_1_io_enq_bits_uop_prs3),
    .io_enq_bits_uop_ppred(BranchKillableQueue_1_io_enq_bits_uop_ppred),
    .io_enq_bits_uop_prs1_busy(BranchKillableQueue_1_io_enq_bits_uop_prs1_busy),
    .io_enq_bits_uop_prs2_busy(BranchKillableQueue_1_io_enq_bits_uop_prs2_busy),
    .io_enq_bits_uop_prs3_busy(BranchKillableQueue_1_io_enq_bits_uop_prs3_busy),
    .io_enq_bits_uop_ppred_busy(BranchKillableQueue_1_io_enq_bits_uop_ppred_busy),
    .io_enq_bits_uop_stale_pdst(BranchKillableQueue_1_io_enq_bits_uop_stale_pdst),
    .io_enq_bits_uop_exception(BranchKillableQueue_1_io_enq_bits_uop_exception),
    .io_enq_bits_uop_exc_cause(BranchKillableQueue_1_io_enq_bits_uop_exc_cause),
    .io_enq_bits_uop_bypassable(BranchKillableQueue_1_io_enq_bits_uop_bypassable),
    .io_enq_bits_uop_mem_cmd(BranchKillableQueue_1_io_enq_bits_uop_mem_cmd),
    .io_enq_bits_uop_mem_size(BranchKillableQueue_1_io_enq_bits_uop_mem_size),
    .io_enq_bits_uop_mem_signed(BranchKillableQueue_1_io_enq_bits_uop_mem_signed),
    .io_enq_bits_uop_is_fence(BranchKillableQueue_1_io_enq_bits_uop_is_fence),
    .io_enq_bits_uop_is_fencei(BranchKillableQueue_1_io_enq_bits_uop_is_fencei),
    .io_enq_bits_uop_is_amo(BranchKillableQueue_1_io_enq_bits_uop_is_amo),
    .io_enq_bits_uop_uses_ldq(BranchKillableQueue_1_io_enq_bits_uop_uses_ldq),
    .io_enq_bits_uop_uses_stq(BranchKillableQueue_1_io_enq_bits_uop_uses_stq),
    .io_enq_bits_uop_is_sys_pc2epc(BranchKillableQueue_1_io_enq_bits_uop_is_sys_pc2epc),
    .io_enq_bits_uop_is_unique(BranchKillableQueue_1_io_enq_bits_uop_is_unique),
    .io_enq_bits_uop_flush_on_commit(BranchKillableQueue_1_io_enq_bits_uop_flush_on_commit),
    .io_enq_bits_uop_ldst_is_rs1(BranchKillableQueue_1_io_enq_bits_uop_ldst_is_rs1),
    .io_enq_bits_uop_ldst(BranchKillableQueue_1_io_enq_bits_uop_ldst),
    .io_enq_bits_uop_lrs1(BranchKillableQueue_1_io_enq_bits_uop_lrs1),
    .io_enq_bits_uop_lrs2(BranchKillableQueue_1_io_enq_bits_uop_lrs2),
    .io_enq_bits_uop_lrs3(BranchKillableQueue_1_io_enq_bits_uop_lrs3),
    .io_enq_bits_uop_ldst_val(BranchKillableQueue_1_io_enq_bits_uop_ldst_val),
    .io_enq_bits_uop_dst_rtype(BranchKillableQueue_1_io_enq_bits_uop_dst_rtype),
    .io_enq_bits_uop_lrs1_rtype(BranchKillableQueue_1_io_enq_bits_uop_lrs1_rtype),
    .io_enq_bits_uop_lrs2_rtype(BranchKillableQueue_1_io_enq_bits_uop_lrs2_rtype),
    .io_enq_bits_uop_frs3_en(BranchKillableQueue_1_io_enq_bits_uop_frs3_en),
    .io_enq_bits_uop_fp_val(BranchKillableQueue_1_io_enq_bits_uop_fp_val),
    .io_enq_bits_uop_fp_single(BranchKillableQueue_1_io_enq_bits_uop_fp_single),
    .io_enq_bits_uop_xcpt_pf_if(BranchKillableQueue_1_io_enq_bits_uop_xcpt_pf_if),
    .io_enq_bits_uop_xcpt_ae_if(BranchKillableQueue_1_io_enq_bits_uop_xcpt_ae_if),
    .io_enq_bits_uop_xcpt_ma_if(BranchKillableQueue_1_io_enq_bits_uop_xcpt_ma_if),
    .io_enq_bits_uop_bp_debug_if(BranchKillableQueue_1_io_enq_bits_uop_bp_debug_if),
    .io_enq_bits_uop_bp_xcpt_if(BranchKillableQueue_1_io_enq_bits_uop_bp_xcpt_if),
    .io_enq_bits_uop_debug_fsrc(BranchKillableQueue_1_io_enq_bits_uop_debug_fsrc),
    .io_enq_bits_uop_debug_tsrc(BranchKillableQueue_1_io_enq_bits_uop_debug_tsrc),
    .io_enq_bits_data(BranchKillableQueue_1_io_enq_bits_data),
    .io_enq_bits_predicated(BranchKillableQueue_1_io_enq_bits_predicated),
    .io_enq_bits_fflags_valid(BranchKillableQueue_1_io_enq_bits_fflags_valid),
    .io_enq_bits_fflags_bits_uop_uopc(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_uopc),
    .io_enq_bits_fflags_bits_uop_inst(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_inst),
    .io_enq_bits_fflags_bits_uop_debug_inst(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_inst),
    .io_enq_bits_fflags_bits_uop_is_rvc(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_rvc),
    .io_enq_bits_fflags_bits_uop_debug_pc(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_pc),
    .io_enq_bits_fflags_bits_uop_iq_type(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iq_type),
    .io_enq_bits_fflags_bits_uop_fu_code(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_fu_code),
    .io_enq_bits_fflags_bits_uop_ctrl_br_type(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_br_type),
    .io_enq_bits_fflags_bits_uop_ctrl_op1_sel(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_op2_sel(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_imm_sel(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_op_fcn(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_enq_bits_fflags_bits_uop_ctrl_fcn_dw(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_fflags_bits_uop_ctrl_csr_cmd(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_fflags_bits_uop_ctrl_is_load(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_is_load),
    .io_enq_bits_fflags_bits_uop_ctrl_is_sta(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_is_sta),
    .io_enq_bits_fflags_bits_uop_ctrl_is_std(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_is_std),
    .io_enq_bits_fflags_bits_uop_iw_state(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iw_state),
    .io_enq_bits_fflags_bits_uop_iw_p1_poisoned(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_enq_bits_fflags_bits_uop_iw_p2_poisoned(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_enq_bits_fflags_bits_uop_is_br(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_br),
    .io_enq_bits_fflags_bits_uop_is_jalr(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_jalr),
    .io_enq_bits_fflags_bits_uop_is_jal(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_jal),
    .io_enq_bits_fflags_bits_uop_is_sfb(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_sfb),
    .io_enq_bits_fflags_bits_uop_br_mask(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_br_mask),
    .io_enq_bits_fflags_bits_uop_br_tag(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_br_tag),
    .io_enq_bits_fflags_bits_uop_ftq_idx(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ftq_idx),
    .io_enq_bits_fflags_bits_uop_edge_inst(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_edge_inst),
    .io_enq_bits_fflags_bits_uop_pc_lob(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_pc_lob),
    .io_enq_bits_fflags_bits_uop_taken(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_taken),
    .io_enq_bits_fflags_bits_uop_imm_packed(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_imm_packed),
    .io_enq_bits_fflags_bits_uop_csr_addr(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_csr_addr),
    .io_enq_bits_fflags_bits_uop_rob_idx(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_rob_idx),
    .io_enq_bits_fflags_bits_uop_ldq_idx(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldq_idx),
    .io_enq_bits_fflags_bits_uop_stq_idx(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_stq_idx),
    .io_enq_bits_fflags_bits_uop_rxq_idx(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_rxq_idx),
    .io_enq_bits_fflags_bits_uop_pdst(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_pdst),
    .io_enq_bits_fflags_bits_uop_prs1(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs1),
    .io_enq_bits_fflags_bits_uop_prs2(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs2),
    .io_enq_bits_fflags_bits_uop_prs3(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs3),
    .io_enq_bits_fflags_bits_uop_ppred(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ppred),
    .io_enq_bits_fflags_bits_uop_prs1_busy(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs1_busy),
    .io_enq_bits_fflags_bits_uop_prs2_busy(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs2_busy),
    .io_enq_bits_fflags_bits_uop_prs3_busy(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs3_busy),
    .io_enq_bits_fflags_bits_uop_ppred_busy(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ppred_busy),
    .io_enq_bits_fflags_bits_uop_stale_pdst(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_stale_pdst),
    .io_enq_bits_fflags_bits_uop_exception(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_exception),
    .io_enq_bits_fflags_bits_uop_exc_cause(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_exc_cause),
    .io_enq_bits_fflags_bits_uop_bypassable(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_bypassable),
    .io_enq_bits_fflags_bits_uop_mem_cmd(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_mem_cmd),
    .io_enq_bits_fflags_bits_uop_mem_size(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_mem_size),
    .io_enq_bits_fflags_bits_uop_mem_signed(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_mem_signed),
    .io_enq_bits_fflags_bits_uop_is_fence(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_fence),
    .io_enq_bits_fflags_bits_uop_is_fencei(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_fencei),
    .io_enq_bits_fflags_bits_uop_is_amo(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_amo),
    .io_enq_bits_fflags_bits_uop_uses_ldq(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_uses_ldq),
    .io_enq_bits_fflags_bits_uop_uses_stq(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_uses_stq),
    .io_enq_bits_fflags_bits_uop_is_sys_pc2epc(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_enq_bits_fflags_bits_uop_is_unique(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_unique),
    .io_enq_bits_fflags_bits_uop_flush_on_commit(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_flush_on_commit),
    .io_enq_bits_fflags_bits_uop_ldst_is_rs1(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldst_is_rs1),
    .io_enq_bits_fflags_bits_uop_ldst(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldst),
    .io_enq_bits_fflags_bits_uop_lrs1(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs1),
    .io_enq_bits_fflags_bits_uop_lrs2(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs2),
    .io_enq_bits_fflags_bits_uop_lrs3(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs3),
    .io_enq_bits_fflags_bits_uop_ldst_val(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldst_val),
    .io_enq_bits_fflags_bits_uop_dst_rtype(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_dst_rtype),
    .io_enq_bits_fflags_bits_uop_lrs1_rtype(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs1_rtype),
    .io_enq_bits_fflags_bits_uop_lrs2_rtype(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs2_rtype),
    .io_enq_bits_fflags_bits_uop_frs3_en(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_frs3_en),
    .io_enq_bits_fflags_bits_uop_fp_val(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_fp_val),
    .io_enq_bits_fflags_bits_uop_fp_single(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_fp_single),
    .io_enq_bits_fflags_bits_uop_xcpt_pf_if(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_xcpt_pf_if),
    .io_enq_bits_fflags_bits_uop_xcpt_ae_if(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_xcpt_ae_if),
    .io_enq_bits_fflags_bits_uop_xcpt_ma_if(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_xcpt_ma_if),
    .io_enq_bits_fflags_bits_uop_bp_debug_if(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_bp_debug_if),
    .io_enq_bits_fflags_bits_uop_bp_xcpt_if(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_bp_xcpt_if),
    .io_enq_bits_fflags_bits_uop_debug_fsrc(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_fsrc),
    .io_enq_bits_fflags_bits_uop_debug_tsrc(BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_tsrc),
    .io_enq_bits_fflags_bits_flags(BranchKillableQueue_1_io_enq_bits_fflags_bits_flags),
    .io_deq_ready(BranchKillableQueue_1_io_deq_ready),
    .io_deq_valid(BranchKillableQueue_1_io_deq_valid),
    .io_deq_bits_uop_uopc(BranchKillableQueue_1_io_deq_bits_uop_uopc),
    .io_deq_bits_uop_inst(BranchKillableQueue_1_io_deq_bits_uop_inst),
    .io_deq_bits_uop_debug_inst(BranchKillableQueue_1_io_deq_bits_uop_debug_inst),
    .io_deq_bits_uop_is_rvc(BranchKillableQueue_1_io_deq_bits_uop_is_rvc),
    .io_deq_bits_uop_debug_pc(BranchKillableQueue_1_io_deq_bits_uop_debug_pc),
    .io_deq_bits_uop_iq_type(BranchKillableQueue_1_io_deq_bits_uop_iq_type),
    .io_deq_bits_uop_fu_code(BranchKillableQueue_1_io_deq_bits_uop_fu_code),
    .io_deq_bits_uop_ctrl_br_type(BranchKillableQueue_1_io_deq_bits_uop_ctrl_br_type),
    .io_deq_bits_uop_ctrl_op1_sel(BranchKillableQueue_1_io_deq_bits_uop_ctrl_op1_sel),
    .io_deq_bits_uop_ctrl_op2_sel(BranchKillableQueue_1_io_deq_bits_uop_ctrl_op2_sel),
    .io_deq_bits_uop_ctrl_imm_sel(BranchKillableQueue_1_io_deq_bits_uop_ctrl_imm_sel),
    .io_deq_bits_uop_ctrl_op_fcn(BranchKillableQueue_1_io_deq_bits_uop_ctrl_op_fcn),
    .io_deq_bits_uop_ctrl_fcn_dw(BranchKillableQueue_1_io_deq_bits_uop_ctrl_fcn_dw),
    .io_deq_bits_uop_ctrl_csr_cmd(BranchKillableQueue_1_io_deq_bits_uop_ctrl_csr_cmd),
    .io_deq_bits_uop_ctrl_is_load(BranchKillableQueue_1_io_deq_bits_uop_ctrl_is_load),
    .io_deq_bits_uop_ctrl_is_sta(BranchKillableQueue_1_io_deq_bits_uop_ctrl_is_sta),
    .io_deq_bits_uop_ctrl_is_std(BranchKillableQueue_1_io_deq_bits_uop_ctrl_is_std),
    .io_deq_bits_uop_iw_state(BranchKillableQueue_1_io_deq_bits_uop_iw_state),
    .io_deq_bits_uop_iw_p1_poisoned(BranchKillableQueue_1_io_deq_bits_uop_iw_p1_poisoned),
    .io_deq_bits_uop_iw_p2_poisoned(BranchKillableQueue_1_io_deq_bits_uop_iw_p2_poisoned),
    .io_deq_bits_uop_is_br(BranchKillableQueue_1_io_deq_bits_uop_is_br),
    .io_deq_bits_uop_is_jalr(BranchKillableQueue_1_io_deq_bits_uop_is_jalr),
    .io_deq_bits_uop_is_jal(BranchKillableQueue_1_io_deq_bits_uop_is_jal),
    .io_deq_bits_uop_is_sfb(BranchKillableQueue_1_io_deq_bits_uop_is_sfb),
    .io_deq_bits_uop_br_mask(BranchKillableQueue_1_io_deq_bits_uop_br_mask),
    .io_deq_bits_uop_br_tag(BranchKillableQueue_1_io_deq_bits_uop_br_tag),
    .io_deq_bits_uop_ftq_idx(BranchKillableQueue_1_io_deq_bits_uop_ftq_idx),
    .io_deq_bits_uop_edge_inst(BranchKillableQueue_1_io_deq_bits_uop_edge_inst),
    .io_deq_bits_uop_pc_lob(BranchKillableQueue_1_io_deq_bits_uop_pc_lob),
    .io_deq_bits_uop_taken(BranchKillableQueue_1_io_deq_bits_uop_taken),
    .io_deq_bits_uop_imm_packed(BranchKillableQueue_1_io_deq_bits_uop_imm_packed),
    .io_deq_bits_uop_csr_addr(BranchKillableQueue_1_io_deq_bits_uop_csr_addr),
    .io_deq_bits_uop_rob_idx(BranchKillableQueue_1_io_deq_bits_uop_rob_idx),
    .io_deq_bits_uop_ldq_idx(BranchKillableQueue_1_io_deq_bits_uop_ldq_idx),
    .io_deq_bits_uop_stq_idx(BranchKillableQueue_1_io_deq_bits_uop_stq_idx),
    .io_deq_bits_uop_rxq_idx(BranchKillableQueue_1_io_deq_bits_uop_rxq_idx),
    .io_deq_bits_uop_pdst(BranchKillableQueue_1_io_deq_bits_uop_pdst),
    .io_deq_bits_uop_prs1(BranchKillableQueue_1_io_deq_bits_uop_prs1),
    .io_deq_bits_uop_prs2(BranchKillableQueue_1_io_deq_bits_uop_prs2),
    .io_deq_bits_uop_prs3(BranchKillableQueue_1_io_deq_bits_uop_prs3),
    .io_deq_bits_uop_ppred(BranchKillableQueue_1_io_deq_bits_uop_ppred),
    .io_deq_bits_uop_prs1_busy(BranchKillableQueue_1_io_deq_bits_uop_prs1_busy),
    .io_deq_bits_uop_prs2_busy(BranchKillableQueue_1_io_deq_bits_uop_prs2_busy),
    .io_deq_bits_uop_prs3_busy(BranchKillableQueue_1_io_deq_bits_uop_prs3_busy),
    .io_deq_bits_uop_ppred_busy(BranchKillableQueue_1_io_deq_bits_uop_ppred_busy),
    .io_deq_bits_uop_stale_pdst(BranchKillableQueue_1_io_deq_bits_uop_stale_pdst),
    .io_deq_bits_uop_exception(BranchKillableQueue_1_io_deq_bits_uop_exception),
    .io_deq_bits_uop_exc_cause(BranchKillableQueue_1_io_deq_bits_uop_exc_cause),
    .io_deq_bits_uop_bypassable(BranchKillableQueue_1_io_deq_bits_uop_bypassable),
    .io_deq_bits_uop_mem_cmd(BranchKillableQueue_1_io_deq_bits_uop_mem_cmd),
    .io_deq_bits_uop_mem_size(BranchKillableQueue_1_io_deq_bits_uop_mem_size),
    .io_deq_bits_uop_mem_signed(BranchKillableQueue_1_io_deq_bits_uop_mem_signed),
    .io_deq_bits_uop_is_fence(BranchKillableQueue_1_io_deq_bits_uop_is_fence),
    .io_deq_bits_uop_is_fencei(BranchKillableQueue_1_io_deq_bits_uop_is_fencei),
    .io_deq_bits_uop_is_amo(BranchKillableQueue_1_io_deq_bits_uop_is_amo),
    .io_deq_bits_uop_uses_ldq(BranchKillableQueue_1_io_deq_bits_uop_uses_ldq),
    .io_deq_bits_uop_uses_stq(BranchKillableQueue_1_io_deq_bits_uop_uses_stq),
    .io_deq_bits_uop_is_sys_pc2epc(BranchKillableQueue_1_io_deq_bits_uop_is_sys_pc2epc),
    .io_deq_bits_uop_is_unique(BranchKillableQueue_1_io_deq_bits_uop_is_unique),
    .io_deq_bits_uop_flush_on_commit(BranchKillableQueue_1_io_deq_bits_uop_flush_on_commit),
    .io_deq_bits_uop_ldst_is_rs1(BranchKillableQueue_1_io_deq_bits_uop_ldst_is_rs1),
    .io_deq_bits_uop_ldst(BranchKillableQueue_1_io_deq_bits_uop_ldst),
    .io_deq_bits_uop_lrs1(BranchKillableQueue_1_io_deq_bits_uop_lrs1),
    .io_deq_bits_uop_lrs2(BranchKillableQueue_1_io_deq_bits_uop_lrs2),
    .io_deq_bits_uop_lrs3(BranchKillableQueue_1_io_deq_bits_uop_lrs3),
    .io_deq_bits_uop_ldst_val(BranchKillableQueue_1_io_deq_bits_uop_ldst_val),
    .io_deq_bits_uop_dst_rtype(BranchKillableQueue_1_io_deq_bits_uop_dst_rtype),
    .io_deq_bits_uop_lrs1_rtype(BranchKillableQueue_1_io_deq_bits_uop_lrs1_rtype),
    .io_deq_bits_uop_lrs2_rtype(BranchKillableQueue_1_io_deq_bits_uop_lrs2_rtype),
    .io_deq_bits_uop_frs3_en(BranchKillableQueue_1_io_deq_bits_uop_frs3_en),
    .io_deq_bits_uop_fp_val(BranchKillableQueue_1_io_deq_bits_uop_fp_val),
    .io_deq_bits_uop_fp_single(BranchKillableQueue_1_io_deq_bits_uop_fp_single),
    .io_deq_bits_uop_xcpt_pf_if(BranchKillableQueue_1_io_deq_bits_uop_xcpt_pf_if),
    .io_deq_bits_uop_xcpt_ae_if(BranchKillableQueue_1_io_deq_bits_uop_xcpt_ae_if),
    .io_deq_bits_uop_xcpt_ma_if(BranchKillableQueue_1_io_deq_bits_uop_xcpt_ma_if),
    .io_deq_bits_uop_bp_debug_if(BranchKillableQueue_1_io_deq_bits_uop_bp_debug_if),
    .io_deq_bits_uop_bp_xcpt_if(BranchKillableQueue_1_io_deq_bits_uop_bp_xcpt_if),
    .io_deq_bits_uop_debug_fsrc(BranchKillableQueue_1_io_deq_bits_uop_debug_fsrc),
    .io_deq_bits_uop_debug_tsrc(BranchKillableQueue_1_io_deq_bits_uop_debug_tsrc),
    .io_deq_bits_data(BranchKillableQueue_1_io_deq_bits_data),
    .io_deq_bits_predicated(BranchKillableQueue_1_io_deq_bits_predicated),
    .io_deq_bits_fflags_valid(BranchKillableQueue_1_io_deq_bits_fflags_valid),
    .io_deq_bits_fflags_bits_uop_uopc(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_uopc),
    .io_deq_bits_fflags_bits_uop_inst(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_inst),
    .io_deq_bits_fflags_bits_uop_debug_inst(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_inst),
    .io_deq_bits_fflags_bits_uop_is_rvc(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_rvc),
    .io_deq_bits_fflags_bits_uop_debug_pc(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_pc),
    .io_deq_bits_fflags_bits_uop_iq_type(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iq_type),
    .io_deq_bits_fflags_bits_uop_fu_code(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_fu_code),
    .io_deq_bits_fflags_bits_uop_ctrl_br_type(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_br_type),
    .io_deq_bits_fflags_bits_uop_ctrl_op1_sel(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_deq_bits_fflags_bits_uop_ctrl_op2_sel(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_deq_bits_fflags_bits_uop_ctrl_imm_sel(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_deq_bits_fflags_bits_uop_ctrl_op_fcn(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_deq_bits_fflags_bits_uop_ctrl_fcn_dw(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_deq_bits_fflags_bits_uop_ctrl_csr_cmd(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_deq_bits_fflags_bits_uop_ctrl_is_load(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_is_load),
    .io_deq_bits_fflags_bits_uop_ctrl_is_sta(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_is_sta),
    .io_deq_bits_fflags_bits_uop_ctrl_is_std(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_is_std),
    .io_deq_bits_fflags_bits_uop_iw_state(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iw_state),
    .io_deq_bits_fflags_bits_uop_iw_p1_poisoned(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_deq_bits_fflags_bits_uop_iw_p2_poisoned(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_deq_bits_fflags_bits_uop_is_br(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_br),
    .io_deq_bits_fflags_bits_uop_is_jalr(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_jalr),
    .io_deq_bits_fflags_bits_uop_is_jal(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_jal),
    .io_deq_bits_fflags_bits_uop_is_sfb(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_sfb),
    .io_deq_bits_fflags_bits_uop_br_mask(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_br_mask),
    .io_deq_bits_fflags_bits_uop_br_tag(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_br_tag),
    .io_deq_bits_fflags_bits_uop_ftq_idx(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ftq_idx),
    .io_deq_bits_fflags_bits_uop_edge_inst(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_edge_inst),
    .io_deq_bits_fflags_bits_uop_pc_lob(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_pc_lob),
    .io_deq_bits_fflags_bits_uop_taken(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_taken),
    .io_deq_bits_fflags_bits_uop_imm_packed(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_imm_packed),
    .io_deq_bits_fflags_bits_uop_csr_addr(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_csr_addr),
    .io_deq_bits_fflags_bits_uop_rob_idx(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_rob_idx),
    .io_deq_bits_fflags_bits_uop_ldq_idx(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldq_idx),
    .io_deq_bits_fflags_bits_uop_stq_idx(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_stq_idx),
    .io_deq_bits_fflags_bits_uop_rxq_idx(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_rxq_idx),
    .io_deq_bits_fflags_bits_uop_pdst(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_pdst),
    .io_deq_bits_fflags_bits_uop_prs1(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs1),
    .io_deq_bits_fflags_bits_uop_prs2(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs2),
    .io_deq_bits_fflags_bits_uop_prs3(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs3),
    .io_deq_bits_fflags_bits_uop_ppred(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ppred),
    .io_deq_bits_fflags_bits_uop_prs1_busy(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs1_busy),
    .io_deq_bits_fflags_bits_uop_prs2_busy(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs2_busy),
    .io_deq_bits_fflags_bits_uop_prs3_busy(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs3_busy),
    .io_deq_bits_fflags_bits_uop_ppred_busy(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ppred_busy),
    .io_deq_bits_fflags_bits_uop_stale_pdst(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_stale_pdst),
    .io_deq_bits_fflags_bits_uop_exception(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_exception),
    .io_deq_bits_fflags_bits_uop_exc_cause(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_exc_cause),
    .io_deq_bits_fflags_bits_uop_bypassable(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_bypassable),
    .io_deq_bits_fflags_bits_uop_mem_cmd(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_mem_cmd),
    .io_deq_bits_fflags_bits_uop_mem_size(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_mem_size),
    .io_deq_bits_fflags_bits_uop_mem_signed(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_mem_signed),
    .io_deq_bits_fflags_bits_uop_is_fence(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_fence),
    .io_deq_bits_fflags_bits_uop_is_fencei(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_fencei),
    .io_deq_bits_fflags_bits_uop_is_amo(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_amo),
    .io_deq_bits_fflags_bits_uop_uses_ldq(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_uses_ldq),
    .io_deq_bits_fflags_bits_uop_uses_stq(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_uses_stq),
    .io_deq_bits_fflags_bits_uop_is_sys_pc2epc(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_deq_bits_fflags_bits_uop_is_unique(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_unique),
    .io_deq_bits_fflags_bits_uop_flush_on_commit(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_flush_on_commit),
    .io_deq_bits_fflags_bits_uop_ldst_is_rs1(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldst_is_rs1),
    .io_deq_bits_fflags_bits_uop_ldst(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldst),
    .io_deq_bits_fflags_bits_uop_lrs1(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs1),
    .io_deq_bits_fflags_bits_uop_lrs2(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs2),
    .io_deq_bits_fflags_bits_uop_lrs3(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs3),
    .io_deq_bits_fflags_bits_uop_ldst_val(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldst_val),
    .io_deq_bits_fflags_bits_uop_dst_rtype(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_dst_rtype),
    .io_deq_bits_fflags_bits_uop_lrs1_rtype(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs1_rtype),
    .io_deq_bits_fflags_bits_uop_lrs2_rtype(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs2_rtype),
    .io_deq_bits_fflags_bits_uop_frs3_en(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_frs3_en),
    .io_deq_bits_fflags_bits_uop_fp_val(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_fp_val),
    .io_deq_bits_fflags_bits_uop_fp_single(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_fp_single),
    .io_deq_bits_fflags_bits_uop_xcpt_pf_if(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_xcpt_pf_if),
    .io_deq_bits_fflags_bits_uop_xcpt_ae_if(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_xcpt_ae_if),
    .io_deq_bits_fflags_bits_uop_xcpt_ma_if(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_xcpt_ma_if),
    .io_deq_bits_fflags_bits_uop_bp_debug_if(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_bp_debug_if),
    .io_deq_bits_fflags_bits_uop_bp_xcpt_if(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_bp_xcpt_if),
    .io_deq_bits_fflags_bits_uop_debug_fsrc(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_fsrc),
    .io_deq_bits_fflags_bits_uop_debug_tsrc(BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_tsrc),
    .io_deq_bits_fflags_bits_flags(BranchKillableQueue_1_io_deq_bits_fflags_bits_flags),
    .io_brupdate_b1_resolve_mask(BranchKillableQueue_1_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(BranchKillableQueue_1_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(BranchKillableQueue_1_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(BranchKillableQueue_1_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(BranchKillableQueue_1_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(BranchKillableQueue_1_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(BranchKillableQueue_1_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(BranchKillableQueue_1_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(BranchKillableQueue_1_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(BranchKillableQueue_1_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(BranchKillableQueue_1_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(BranchKillableQueue_1_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(BranchKillableQueue_1_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(BranchKillableQueue_1_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(BranchKillableQueue_1_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(BranchKillableQueue_1_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(BranchKillableQueue_1_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(BranchKillableQueue_1_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(BranchKillableQueue_1_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(BranchKillableQueue_1_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(BranchKillableQueue_1_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(BranchKillableQueue_1_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(BranchKillableQueue_1_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(BranchKillableQueue_1_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(BranchKillableQueue_1_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(BranchKillableQueue_1_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(BranchKillableQueue_1_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(BranchKillableQueue_1_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(BranchKillableQueue_1_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(BranchKillableQueue_1_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(BranchKillableQueue_1_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(BranchKillableQueue_1_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(BranchKillableQueue_1_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(BranchKillableQueue_1_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(BranchKillableQueue_1_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(BranchKillableQueue_1_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(BranchKillableQueue_1_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(BranchKillableQueue_1_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(BranchKillableQueue_1_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(BranchKillableQueue_1_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(BranchKillableQueue_1_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(BranchKillableQueue_1_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(BranchKillableQueue_1_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(BranchKillableQueue_1_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(BranchKillableQueue_1_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(BranchKillableQueue_1_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(BranchKillableQueue_1_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(BranchKillableQueue_1_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(BranchKillableQueue_1_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(BranchKillableQueue_1_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(BranchKillableQueue_1_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(BranchKillableQueue_1_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(BranchKillableQueue_1_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(BranchKillableQueue_1_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(BranchKillableQueue_1_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(BranchKillableQueue_1_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(BranchKillableQueue_1_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(BranchKillableQueue_1_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(BranchKillableQueue_1_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(BranchKillableQueue_1_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(BranchKillableQueue_1_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(BranchKillableQueue_1_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(BranchKillableQueue_1_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(BranchKillableQueue_1_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(BranchKillableQueue_1_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(BranchKillableQueue_1_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(BranchKillableQueue_1_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(BranchKillableQueue_1_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(BranchKillableQueue_1_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(BranchKillableQueue_1_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(BranchKillableQueue_1_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(BranchKillableQueue_1_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(BranchKillableQueue_1_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(BranchKillableQueue_1_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(BranchKillableQueue_1_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(BranchKillableQueue_1_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(BranchKillableQueue_1_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(BranchKillableQueue_1_io_brupdate_b2_target_offset),
    .io_flush(BranchKillableQueue_1_io_flush),
    .io_empty(BranchKillableQueue_1_io_empty),
    .io_count(BranchKillableQueue_1_io_count)
  );
  Arbiter_16 Arbiter ( // @[execution-unit.scala 554:26]
    .clock(Arbiter_clock),
    .reset(Arbiter_reset),
    .io_in_0_ready(Arbiter_io_in_0_ready),
    .io_in_0_valid(Arbiter_io_in_0_valid),
    .io_in_0_bits_uop_uopc(Arbiter_io_in_0_bits_uop_uopc),
    .io_in_0_bits_uop_inst(Arbiter_io_in_0_bits_uop_inst),
    .io_in_0_bits_uop_debug_inst(Arbiter_io_in_0_bits_uop_debug_inst),
    .io_in_0_bits_uop_is_rvc(Arbiter_io_in_0_bits_uop_is_rvc),
    .io_in_0_bits_uop_debug_pc(Arbiter_io_in_0_bits_uop_debug_pc),
    .io_in_0_bits_uop_iq_type(Arbiter_io_in_0_bits_uop_iq_type),
    .io_in_0_bits_uop_fu_code(Arbiter_io_in_0_bits_uop_fu_code),
    .io_in_0_bits_uop_ctrl_br_type(Arbiter_io_in_0_bits_uop_ctrl_br_type),
    .io_in_0_bits_uop_ctrl_op1_sel(Arbiter_io_in_0_bits_uop_ctrl_op1_sel),
    .io_in_0_bits_uop_ctrl_op2_sel(Arbiter_io_in_0_bits_uop_ctrl_op2_sel),
    .io_in_0_bits_uop_ctrl_imm_sel(Arbiter_io_in_0_bits_uop_ctrl_imm_sel),
    .io_in_0_bits_uop_ctrl_op_fcn(Arbiter_io_in_0_bits_uop_ctrl_op_fcn),
    .io_in_0_bits_uop_ctrl_fcn_dw(Arbiter_io_in_0_bits_uop_ctrl_fcn_dw),
    .io_in_0_bits_uop_ctrl_csr_cmd(Arbiter_io_in_0_bits_uop_ctrl_csr_cmd),
    .io_in_0_bits_uop_ctrl_is_load(Arbiter_io_in_0_bits_uop_ctrl_is_load),
    .io_in_0_bits_uop_ctrl_is_sta(Arbiter_io_in_0_bits_uop_ctrl_is_sta),
    .io_in_0_bits_uop_ctrl_is_std(Arbiter_io_in_0_bits_uop_ctrl_is_std),
    .io_in_0_bits_uop_iw_state(Arbiter_io_in_0_bits_uop_iw_state),
    .io_in_0_bits_uop_iw_p1_poisoned(Arbiter_io_in_0_bits_uop_iw_p1_poisoned),
    .io_in_0_bits_uop_iw_p2_poisoned(Arbiter_io_in_0_bits_uop_iw_p2_poisoned),
    .io_in_0_bits_uop_is_br(Arbiter_io_in_0_bits_uop_is_br),
    .io_in_0_bits_uop_is_jalr(Arbiter_io_in_0_bits_uop_is_jalr),
    .io_in_0_bits_uop_is_jal(Arbiter_io_in_0_bits_uop_is_jal),
    .io_in_0_bits_uop_is_sfb(Arbiter_io_in_0_bits_uop_is_sfb),
    .io_in_0_bits_uop_br_mask(Arbiter_io_in_0_bits_uop_br_mask),
    .io_in_0_bits_uop_br_tag(Arbiter_io_in_0_bits_uop_br_tag),
    .io_in_0_bits_uop_ftq_idx(Arbiter_io_in_0_bits_uop_ftq_idx),
    .io_in_0_bits_uop_edge_inst(Arbiter_io_in_0_bits_uop_edge_inst),
    .io_in_0_bits_uop_pc_lob(Arbiter_io_in_0_bits_uop_pc_lob),
    .io_in_0_bits_uop_taken(Arbiter_io_in_0_bits_uop_taken),
    .io_in_0_bits_uop_imm_packed(Arbiter_io_in_0_bits_uop_imm_packed),
    .io_in_0_bits_uop_csr_addr(Arbiter_io_in_0_bits_uop_csr_addr),
    .io_in_0_bits_uop_rob_idx(Arbiter_io_in_0_bits_uop_rob_idx),
    .io_in_0_bits_uop_ldq_idx(Arbiter_io_in_0_bits_uop_ldq_idx),
    .io_in_0_bits_uop_stq_idx(Arbiter_io_in_0_bits_uop_stq_idx),
    .io_in_0_bits_uop_rxq_idx(Arbiter_io_in_0_bits_uop_rxq_idx),
    .io_in_0_bits_uop_pdst(Arbiter_io_in_0_bits_uop_pdst),
    .io_in_0_bits_uop_prs1(Arbiter_io_in_0_bits_uop_prs1),
    .io_in_0_bits_uop_prs2(Arbiter_io_in_0_bits_uop_prs2),
    .io_in_0_bits_uop_prs3(Arbiter_io_in_0_bits_uop_prs3),
    .io_in_0_bits_uop_ppred(Arbiter_io_in_0_bits_uop_ppred),
    .io_in_0_bits_uop_prs1_busy(Arbiter_io_in_0_bits_uop_prs1_busy),
    .io_in_0_bits_uop_prs2_busy(Arbiter_io_in_0_bits_uop_prs2_busy),
    .io_in_0_bits_uop_prs3_busy(Arbiter_io_in_0_bits_uop_prs3_busy),
    .io_in_0_bits_uop_ppred_busy(Arbiter_io_in_0_bits_uop_ppred_busy),
    .io_in_0_bits_uop_stale_pdst(Arbiter_io_in_0_bits_uop_stale_pdst),
    .io_in_0_bits_uop_exception(Arbiter_io_in_0_bits_uop_exception),
    .io_in_0_bits_uop_exc_cause(Arbiter_io_in_0_bits_uop_exc_cause),
    .io_in_0_bits_uop_bypassable(Arbiter_io_in_0_bits_uop_bypassable),
    .io_in_0_bits_uop_mem_cmd(Arbiter_io_in_0_bits_uop_mem_cmd),
    .io_in_0_bits_uop_mem_size(Arbiter_io_in_0_bits_uop_mem_size),
    .io_in_0_bits_uop_mem_signed(Arbiter_io_in_0_bits_uop_mem_signed),
    .io_in_0_bits_uop_is_fence(Arbiter_io_in_0_bits_uop_is_fence),
    .io_in_0_bits_uop_is_fencei(Arbiter_io_in_0_bits_uop_is_fencei),
    .io_in_0_bits_uop_is_amo(Arbiter_io_in_0_bits_uop_is_amo),
    .io_in_0_bits_uop_uses_ldq(Arbiter_io_in_0_bits_uop_uses_ldq),
    .io_in_0_bits_uop_uses_stq(Arbiter_io_in_0_bits_uop_uses_stq),
    .io_in_0_bits_uop_is_sys_pc2epc(Arbiter_io_in_0_bits_uop_is_sys_pc2epc),
    .io_in_0_bits_uop_is_unique(Arbiter_io_in_0_bits_uop_is_unique),
    .io_in_0_bits_uop_flush_on_commit(Arbiter_io_in_0_bits_uop_flush_on_commit),
    .io_in_0_bits_uop_ldst_is_rs1(Arbiter_io_in_0_bits_uop_ldst_is_rs1),
    .io_in_0_bits_uop_ldst(Arbiter_io_in_0_bits_uop_ldst),
    .io_in_0_bits_uop_lrs1(Arbiter_io_in_0_bits_uop_lrs1),
    .io_in_0_bits_uop_lrs2(Arbiter_io_in_0_bits_uop_lrs2),
    .io_in_0_bits_uop_lrs3(Arbiter_io_in_0_bits_uop_lrs3),
    .io_in_0_bits_uop_ldst_val(Arbiter_io_in_0_bits_uop_ldst_val),
    .io_in_0_bits_uop_dst_rtype(Arbiter_io_in_0_bits_uop_dst_rtype),
    .io_in_0_bits_uop_lrs1_rtype(Arbiter_io_in_0_bits_uop_lrs1_rtype),
    .io_in_0_bits_uop_lrs2_rtype(Arbiter_io_in_0_bits_uop_lrs2_rtype),
    .io_in_0_bits_uop_frs3_en(Arbiter_io_in_0_bits_uop_frs3_en),
    .io_in_0_bits_uop_fp_val(Arbiter_io_in_0_bits_uop_fp_val),
    .io_in_0_bits_uop_fp_single(Arbiter_io_in_0_bits_uop_fp_single),
    .io_in_0_bits_uop_xcpt_pf_if(Arbiter_io_in_0_bits_uop_xcpt_pf_if),
    .io_in_0_bits_uop_xcpt_ae_if(Arbiter_io_in_0_bits_uop_xcpt_ae_if),
    .io_in_0_bits_uop_xcpt_ma_if(Arbiter_io_in_0_bits_uop_xcpt_ma_if),
    .io_in_0_bits_uop_bp_debug_if(Arbiter_io_in_0_bits_uop_bp_debug_if),
    .io_in_0_bits_uop_bp_xcpt_if(Arbiter_io_in_0_bits_uop_bp_xcpt_if),
    .io_in_0_bits_uop_debug_fsrc(Arbiter_io_in_0_bits_uop_debug_fsrc),
    .io_in_0_bits_uop_debug_tsrc(Arbiter_io_in_0_bits_uop_debug_tsrc),
    .io_in_0_bits_data(Arbiter_io_in_0_bits_data),
    .io_in_0_bits_predicated(Arbiter_io_in_0_bits_predicated),
    .io_in_0_bits_fflags_valid(Arbiter_io_in_0_bits_fflags_valid),
    .io_in_0_bits_fflags_bits_uop_uopc(Arbiter_io_in_0_bits_fflags_bits_uop_uopc),
    .io_in_0_bits_fflags_bits_uop_inst(Arbiter_io_in_0_bits_fflags_bits_uop_inst),
    .io_in_0_bits_fflags_bits_uop_debug_inst(Arbiter_io_in_0_bits_fflags_bits_uop_debug_inst),
    .io_in_0_bits_fflags_bits_uop_is_rvc(Arbiter_io_in_0_bits_fflags_bits_uop_is_rvc),
    .io_in_0_bits_fflags_bits_uop_debug_pc(Arbiter_io_in_0_bits_fflags_bits_uop_debug_pc),
    .io_in_0_bits_fflags_bits_uop_iq_type(Arbiter_io_in_0_bits_fflags_bits_uop_iq_type),
    .io_in_0_bits_fflags_bits_uop_fu_code(Arbiter_io_in_0_bits_fflags_bits_uop_fu_code),
    .io_in_0_bits_fflags_bits_uop_ctrl_br_type(Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_br_type),
    .io_in_0_bits_fflags_bits_uop_ctrl_op1_sel(Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_in_0_bits_fflags_bits_uop_ctrl_op2_sel(Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_in_0_bits_fflags_bits_uop_ctrl_imm_sel(Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_in_0_bits_fflags_bits_uop_ctrl_op_fcn(Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_in_0_bits_fflags_bits_uop_ctrl_fcn_dw(Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_in_0_bits_fflags_bits_uop_ctrl_csr_cmd(Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_in_0_bits_fflags_bits_uop_ctrl_is_load(Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_is_load),
    .io_in_0_bits_fflags_bits_uop_ctrl_is_sta(Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_is_sta),
    .io_in_0_bits_fflags_bits_uop_ctrl_is_std(Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_is_std),
    .io_in_0_bits_fflags_bits_uop_iw_state(Arbiter_io_in_0_bits_fflags_bits_uop_iw_state),
    .io_in_0_bits_fflags_bits_uop_iw_p1_poisoned(Arbiter_io_in_0_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_in_0_bits_fflags_bits_uop_iw_p2_poisoned(Arbiter_io_in_0_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_in_0_bits_fflags_bits_uop_is_br(Arbiter_io_in_0_bits_fflags_bits_uop_is_br),
    .io_in_0_bits_fflags_bits_uop_is_jalr(Arbiter_io_in_0_bits_fflags_bits_uop_is_jalr),
    .io_in_0_bits_fflags_bits_uop_is_jal(Arbiter_io_in_0_bits_fflags_bits_uop_is_jal),
    .io_in_0_bits_fflags_bits_uop_is_sfb(Arbiter_io_in_0_bits_fflags_bits_uop_is_sfb),
    .io_in_0_bits_fflags_bits_uop_br_mask(Arbiter_io_in_0_bits_fflags_bits_uop_br_mask),
    .io_in_0_bits_fflags_bits_uop_br_tag(Arbiter_io_in_0_bits_fflags_bits_uop_br_tag),
    .io_in_0_bits_fflags_bits_uop_ftq_idx(Arbiter_io_in_0_bits_fflags_bits_uop_ftq_idx),
    .io_in_0_bits_fflags_bits_uop_edge_inst(Arbiter_io_in_0_bits_fflags_bits_uop_edge_inst),
    .io_in_0_bits_fflags_bits_uop_pc_lob(Arbiter_io_in_0_bits_fflags_bits_uop_pc_lob),
    .io_in_0_bits_fflags_bits_uop_taken(Arbiter_io_in_0_bits_fflags_bits_uop_taken),
    .io_in_0_bits_fflags_bits_uop_imm_packed(Arbiter_io_in_0_bits_fflags_bits_uop_imm_packed),
    .io_in_0_bits_fflags_bits_uop_csr_addr(Arbiter_io_in_0_bits_fflags_bits_uop_csr_addr),
    .io_in_0_bits_fflags_bits_uop_rob_idx(Arbiter_io_in_0_bits_fflags_bits_uop_rob_idx),
    .io_in_0_bits_fflags_bits_uop_ldq_idx(Arbiter_io_in_0_bits_fflags_bits_uop_ldq_idx),
    .io_in_0_bits_fflags_bits_uop_stq_idx(Arbiter_io_in_0_bits_fflags_bits_uop_stq_idx),
    .io_in_0_bits_fflags_bits_uop_rxq_idx(Arbiter_io_in_0_bits_fflags_bits_uop_rxq_idx),
    .io_in_0_bits_fflags_bits_uop_pdst(Arbiter_io_in_0_bits_fflags_bits_uop_pdst),
    .io_in_0_bits_fflags_bits_uop_prs1(Arbiter_io_in_0_bits_fflags_bits_uop_prs1),
    .io_in_0_bits_fflags_bits_uop_prs2(Arbiter_io_in_0_bits_fflags_bits_uop_prs2),
    .io_in_0_bits_fflags_bits_uop_prs3(Arbiter_io_in_0_bits_fflags_bits_uop_prs3),
    .io_in_0_bits_fflags_bits_uop_ppred(Arbiter_io_in_0_bits_fflags_bits_uop_ppred),
    .io_in_0_bits_fflags_bits_uop_prs1_busy(Arbiter_io_in_0_bits_fflags_bits_uop_prs1_busy),
    .io_in_0_bits_fflags_bits_uop_prs2_busy(Arbiter_io_in_0_bits_fflags_bits_uop_prs2_busy),
    .io_in_0_bits_fflags_bits_uop_prs3_busy(Arbiter_io_in_0_bits_fflags_bits_uop_prs3_busy),
    .io_in_0_bits_fflags_bits_uop_ppred_busy(Arbiter_io_in_0_bits_fflags_bits_uop_ppred_busy),
    .io_in_0_bits_fflags_bits_uop_stale_pdst(Arbiter_io_in_0_bits_fflags_bits_uop_stale_pdst),
    .io_in_0_bits_fflags_bits_uop_exception(Arbiter_io_in_0_bits_fflags_bits_uop_exception),
    .io_in_0_bits_fflags_bits_uop_exc_cause(Arbiter_io_in_0_bits_fflags_bits_uop_exc_cause),
    .io_in_0_bits_fflags_bits_uop_bypassable(Arbiter_io_in_0_bits_fflags_bits_uop_bypassable),
    .io_in_0_bits_fflags_bits_uop_mem_cmd(Arbiter_io_in_0_bits_fflags_bits_uop_mem_cmd),
    .io_in_0_bits_fflags_bits_uop_mem_size(Arbiter_io_in_0_bits_fflags_bits_uop_mem_size),
    .io_in_0_bits_fflags_bits_uop_mem_signed(Arbiter_io_in_0_bits_fflags_bits_uop_mem_signed),
    .io_in_0_bits_fflags_bits_uop_is_fence(Arbiter_io_in_0_bits_fflags_bits_uop_is_fence),
    .io_in_0_bits_fflags_bits_uop_is_fencei(Arbiter_io_in_0_bits_fflags_bits_uop_is_fencei),
    .io_in_0_bits_fflags_bits_uop_is_amo(Arbiter_io_in_0_bits_fflags_bits_uop_is_amo),
    .io_in_0_bits_fflags_bits_uop_uses_ldq(Arbiter_io_in_0_bits_fflags_bits_uop_uses_ldq),
    .io_in_0_bits_fflags_bits_uop_uses_stq(Arbiter_io_in_0_bits_fflags_bits_uop_uses_stq),
    .io_in_0_bits_fflags_bits_uop_is_sys_pc2epc(Arbiter_io_in_0_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_in_0_bits_fflags_bits_uop_is_unique(Arbiter_io_in_0_bits_fflags_bits_uop_is_unique),
    .io_in_0_bits_fflags_bits_uop_flush_on_commit(Arbiter_io_in_0_bits_fflags_bits_uop_flush_on_commit),
    .io_in_0_bits_fflags_bits_uop_ldst_is_rs1(Arbiter_io_in_0_bits_fflags_bits_uop_ldst_is_rs1),
    .io_in_0_bits_fflags_bits_uop_ldst(Arbiter_io_in_0_bits_fflags_bits_uop_ldst),
    .io_in_0_bits_fflags_bits_uop_lrs1(Arbiter_io_in_0_bits_fflags_bits_uop_lrs1),
    .io_in_0_bits_fflags_bits_uop_lrs2(Arbiter_io_in_0_bits_fflags_bits_uop_lrs2),
    .io_in_0_bits_fflags_bits_uop_lrs3(Arbiter_io_in_0_bits_fflags_bits_uop_lrs3),
    .io_in_0_bits_fflags_bits_uop_ldst_val(Arbiter_io_in_0_bits_fflags_bits_uop_ldst_val),
    .io_in_0_bits_fflags_bits_uop_dst_rtype(Arbiter_io_in_0_bits_fflags_bits_uop_dst_rtype),
    .io_in_0_bits_fflags_bits_uop_lrs1_rtype(Arbiter_io_in_0_bits_fflags_bits_uop_lrs1_rtype),
    .io_in_0_bits_fflags_bits_uop_lrs2_rtype(Arbiter_io_in_0_bits_fflags_bits_uop_lrs2_rtype),
    .io_in_0_bits_fflags_bits_uop_frs3_en(Arbiter_io_in_0_bits_fflags_bits_uop_frs3_en),
    .io_in_0_bits_fflags_bits_uop_fp_val(Arbiter_io_in_0_bits_fflags_bits_uop_fp_val),
    .io_in_0_bits_fflags_bits_uop_fp_single(Arbiter_io_in_0_bits_fflags_bits_uop_fp_single),
    .io_in_0_bits_fflags_bits_uop_xcpt_pf_if(Arbiter_io_in_0_bits_fflags_bits_uop_xcpt_pf_if),
    .io_in_0_bits_fflags_bits_uop_xcpt_ae_if(Arbiter_io_in_0_bits_fflags_bits_uop_xcpt_ae_if),
    .io_in_0_bits_fflags_bits_uop_xcpt_ma_if(Arbiter_io_in_0_bits_fflags_bits_uop_xcpt_ma_if),
    .io_in_0_bits_fflags_bits_uop_bp_debug_if(Arbiter_io_in_0_bits_fflags_bits_uop_bp_debug_if),
    .io_in_0_bits_fflags_bits_uop_bp_xcpt_if(Arbiter_io_in_0_bits_fflags_bits_uop_bp_xcpt_if),
    .io_in_0_bits_fflags_bits_uop_debug_fsrc(Arbiter_io_in_0_bits_fflags_bits_uop_debug_fsrc),
    .io_in_0_bits_fflags_bits_uop_debug_tsrc(Arbiter_io_in_0_bits_fflags_bits_uop_debug_tsrc),
    .io_in_0_bits_fflags_bits_flags(Arbiter_io_in_0_bits_fflags_bits_flags),
    .io_in_1_ready(Arbiter_io_in_1_ready),
    .io_in_1_valid(Arbiter_io_in_1_valid),
    .io_in_1_bits_uop_uopc(Arbiter_io_in_1_bits_uop_uopc),
    .io_in_1_bits_uop_inst(Arbiter_io_in_1_bits_uop_inst),
    .io_in_1_bits_uop_debug_inst(Arbiter_io_in_1_bits_uop_debug_inst),
    .io_in_1_bits_uop_is_rvc(Arbiter_io_in_1_bits_uop_is_rvc),
    .io_in_1_bits_uop_debug_pc(Arbiter_io_in_1_bits_uop_debug_pc),
    .io_in_1_bits_uop_iq_type(Arbiter_io_in_1_bits_uop_iq_type),
    .io_in_1_bits_uop_fu_code(Arbiter_io_in_1_bits_uop_fu_code),
    .io_in_1_bits_uop_ctrl_br_type(Arbiter_io_in_1_bits_uop_ctrl_br_type),
    .io_in_1_bits_uop_ctrl_op1_sel(Arbiter_io_in_1_bits_uop_ctrl_op1_sel),
    .io_in_1_bits_uop_ctrl_op2_sel(Arbiter_io_in_1_bits_uop_ctrl_op2_sel),
    .io_in_1_bits_uop_ctrl_imm_sel(Arbiter_io_in_1_bits_uop_ctrl_imm_sel),
    .io_in_1_bits_uop_ctrl_op_fcn(Arbiter_io_in_1_bits_uop_ctrl_op_fcn),
    .io_in_1_bits_uop_ctrl_fcn_dw(Arbiter_io_in_1_bits_uop_ctrl_fcn_dw),
    .io_in_1_bits_uop_ctrl_csr_cmd(Arbiter_io_in_1_bits_uop_ctrl_csr_cmd),
    .io_in_1_bits_uop_ctrl_is_load(Arbiter_io_in_1_bits_uop_ctrl_is_load),
    .io_in_1_bits_uop_ctrl_is_sta(Arbiter_io_in_1_bits_uop_ctrl_is_sta),
    .io_in_1_bits_uop_ctrl_is_std(Arbiter_io_in_1_bits_uop_ctrl_is_std),
    .io_in_1_bits_uop_iw_state(Arbiter_io_in_1_bits_uop_iw_state),
    .io_in_1_bits_uop_iw_p1_poisoned(Arbiter_io_in_1_bits_uop_iw_p1_poisoned),
    .io_in_1_bits_uop_iw_p2_poisoned(Arbiter_io_in_1_bits_uop_iw_p2_poisoned),
    .io_in_1_bits_uop_is_br(Arbiter_io_in_1_bits_uop_is_br),
    .io_in_1_bits_uop_is_jalr(Arbiter_io_in_1_bits_uop_is_jalr),
    .io_in_1_bits_uop_is_jal(Arbiter_io_in_1_bits_uop_is_jal),
    .io_in_1_bits_uop_is_sfb(Arbiter_io_in_1_bits_uop_is_sfb),
    .io_in_1_bits_uop_br_mask(Arbiter_io_in_1_bits_uop_br_mask),
    .io_in_1_bits_uop_br_tag(Arbiter_io_in_1_bits_uop_br_tag),
    .io_in_1_bits_uop_ftq_idx(Arbiter_io_in_1_bits_uop_ftq_idx),
    .io_in_1_bits_uop_edge_inst(Arbiter_io_in_1_bits_uop_edge_inst),
    .io_in_1_bits_uop_pc_lob(Arbiter_io_in_1_bits_uop_pc_lob),
    .io_in_1_bits_uop_taken(Arbiter_io_in_1_bits_uop_taken),
    .io_in_1_bits_uop_imm_packed(Arbiter_io_in_1_bits_uop_imm_packed),
    .io_in_1_bits_uop_csr_addr(Arbiter_io_in_1_bits_uop_csr_addr),
    .io_in_1_bits_uop_rob_idx(Arbiter_io_in_1_bits_uop_rob_idx),
    .io_in_1_bits_uop_ldq_idx(Arbiter_io_in_1_bits_uop_ldq_idx),
    .io_in_1_bits_uop_stq_idx(Arbiter_io_in_1_bits_uop_stq_idx),
    .io_in_1_bits_uop_rxq_idx(Arbiter_io_in_1_bits_uop_rxq_idx),
    .io_in_1_bits_uop_pdst(Arbiter_io_in_1_bits_uop_pdst),
    .io_in_1_bits_uop_prs1(Arbiter_io_in_1_bits_uop_prs1),
    .io_in_1_bits_uop_prs2(Arbiter_io_in_1_bits_uop_prs2),
    .io_in_1_bits_uop_prs3(Arbiter_io_in_1_bits_uop_prs3),
    .io_in_1_bits_uop_ppred(Arbiter_io_in_1_bits_uop_ppred),
    .io_in_1_bits_uop_prs1_busy(Arbiter_io_in_1_bits_uop_prs1_busy),
    .io_in_1_bits_uop_prs2_busy(Arbiter_io_in_1_bits_uop_prs2_busy),
    .io_in_1_bits_uop_prs3_busy(Arbiter_io_in_1_bits_uop_prs3_busy),
    .io_in_1_bits_uop_ppred_busy(Arbiter_io_in_1_bits_uop_ppred_busy),
    .io_in_1_bits_uop_stale_pdst(Arbiter_io_in_1_bits_uop_stale_pdst),
    .io_in_1_bits_uop_exception(Arbiter_io_in_1_bits_uop_exception),
    .io_in_1_bits_uop_exc_cause(Arbiter_io_in_1_bits_uop_exc_cause),
    .io_in_1_bits_uop_bypassable(Arbiter_io_in_1_bits_uop_bypassable),
    .io_in_1_bits_uop_mem_cmd(Arbiter_io_in_1_bits_uop_mem_cmd),
    .io_in_1_bits_uop_mem_size(Arbiter_io_in_1_bits_uop_mem_size),
    .io_in_1_bits_uop_mem_signed(Arbiter_io_in_1_bits_uop_mem_signed),
    .io_in_1_bits_uop_is_fence(Arbiter_io_in_1_bits_uop_is_fence),
    .io_in_1_bits_uop_is_fencei(Arbiter_io_in_1_bits_uop_is_fencei),
    .io_in_1_bits_uop_is_amo(Arbiter_io_in_1_bits_uop_is_amo),
    .io_in_1_bits_uop_uses_ldq(Arbiter_io_in_1_bits_uop_uses_ldq),
    .io_in_1_bits_uop_uses_stq(Arbiter_io_in_1_bits_uop_uses_stq),
    .io_in_1_bits_uop_is_sys_pc2epc(Arbiter_io_in_1_bits_uop_is_sys_pc2epc),
    .io_in_1_bits_uop_is_unique(Arbiter_io_in_1_bits_uop_is_unique),
    .io_in_1_bits_uop_flush_on_commit(Arbiter_io_in_1_bits_uop_flush_on_commit),
    .io_in_1_bits_uop_ldst_is_rs1(Arbiter_io_in_1_bits_uop_ldst_is_rs1),
    .io_in_1_bits_uop_ldst(Arbiter_io_in_1_bits_uop_ldst),
    .io_in_1_bits_uop_lrs1(Arbiter_io_in_1_bits_uop_lrs1),
    .io_in_1_bits_uop_lrs2(Arbiter_io_in_1_bits_uop_lrs2),
    .io_in_1_bits_uop_lrs3(Arbiter_io_in_1_bits_uop_lrs3),
    .io_in_1_bits_uop_ldst_val(Arbiter_io_in_1_bits_uop_ldst_val),
    .io_in_1_bits_uop_dst_rtype(Arbiter_io_in_1_bits_uop_dst_rtype),
    .io_in_1_bits_uop_lrs1_rtype(Arbiter_io_in_1_bits_uop_lrs1_rtype),
    .io_in_1_bits_uop_lrs2_rtype(Arbiter_io_in_1_bits_uop_lrs2_rtype),
    .io_in_1_bits_uop_frs3_en(Arbiter_io_in_1_bits_uop_frs3_en),
    .io_in_1_bits_uop_fp_val(Arbiter_io_in_1_bits_uop_fp_val),
    .io_in_1_bits_uop_fp_single(Arbiter_io_in_1_bits_uop_fp_single),
    .io_in_1_bits_uop_xcpt_pf_if(Arbiter_io_in_1_bits_uop_xcpt_pf_if),
    .io_in_1_bits_uop_xcpt_ae_if(Arbiter_io_in_1_bits_uop_xcpt_ae_if),
    .io_in_1_bits_uop_xcpt_ma_if(Arbiter_io_in_1_bits_uop_xcpt_ma_if),
    .io_in_1_bits_uop_bp_debug_if(Arbiter_io_in_1_bits_uop_bp_debug_if),
    .io_in_1_bits_uop_bp_xcpt_if(Arbiter_io_in_1_bits_uop_bp_xcpt_if),
    .io_in_1_bits_uop_debug_fsrc(Arbiter_io_in_1_bits_uop_debug_fsrc),
    .io_in_1_bits_uop_debug_tsrc(Arbiter_io_in_1_bits_uop_debug_tsrc),
    .io_in_1_bits_data(Arbiter_io_in_1_bits_data),
    .io_in_1_bits_predicated(Arbiter_io_in_1_bits_predicated),
    .io_in_1_bits_fflags_valid(Arbiter_io_in_1_bits_fflags_valid),
    .io_in_1_bits_fflags_bits_uop_uopc(Arbiter_io_in_1_bits_fflags_bits_uop_uopc),
    .io_in_1_bits_fflags_bits_uop_inst(Arbiter_io_in_1_bits_fflags_bits_uop_inst),
    .io_in_1_bits_fflags_bits_uop_debug_inst(Arbiter_io_in_1_bits_fflags_bits_uop_debug_inst),
    .io_in_1_bits_fflags_bits_uop_is_rvc(Arbiter_io_in_1_bits_fflags_bits_uop_is_rvc),
    .io_in_1_bits_fflags_bits_uop_debug_pc(Arbiter_io_in_1_bits_fflags_bits_uop_debug_pc),
    .io_in_1_bits_fflags_bits_uop_iq_type(Arbiter_io_in_1_bits_fflags_bits_uop_iq_type),
    .io_in_1_bits_fflags_bits_uop_fu_code(Arbiter_io_in_1_bits_fflags_bits_uop_fu_code),
    .io_in_1_bits_fflags_bits_uop_ctrl_br_type(Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_br_type),
    .io_in_1_bits_fflags_bits_uop_ctrl_op1_sel(Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_in_1_bits_fflags_bits_uop_ctrl_op2_sel(Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_in_1_bits_fflags_bits_uop_ctrl_imm_sel(Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_in_1_bits_fflags_bits_uop_ctrl_op_fcn(Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_in_1_bits_fflags_bits_uop_ctrl_fcn_dw(Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_in_1_bits_fflags_bits_uop_ctrl_csr_cmd(Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_in_1_bits_fflags_bits_uop_ctrl_is_load(Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_is_load),
    .io_in_1_bits_fflags_bits_uop_ctrl_is_sta(Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_is_sta),
    .io_in_1_bits_fflags_bits_uop_ctrl_is_std(Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_is_std),
    .io_in_1_bits_fflags_bits_uop_iw_state(Arbiter_io_in_1_bits_fflags_bits_uop_iw_state),
    .io_in_1_bits_fflags_bits_uop_iw_p1_poisoned(Arbiter_io_in_1_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_in_1_bits_fflags_bits_uop_iw_p2_poisoned(Arbiter_io_in_1_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_in_1_bits_fflags_bits_uop_is_br(Arbiter_io_in_1_bits_fflags_bits_uop_is_br),
    .io_in_1_bits_fflags_bits_uop_is_jalr(Arbiter_io_in_1_bits_fflags_bits_uop_is_jalr),
    .io_in_1_bits_fflags_bits_uop_is_jal(Arbiter_io_in_1_bits_fflags_bits_uop_is_jal),
    .io_in_1_bits_fflags_bits_uop_is_sfb(Arbiter_io_in_1_bits_fflags_bits_uop_is_sfb),
    .io_in_1_bits_fflags_bits_uop_br_mask(Arbiter_io_in_1_bits_fflags_bits_uop_br_mask),
    .io_in_1_bits_fflags_bits_uop_br_tag(Arbiter_io_in_1_bits_fflags_bits_uop_br_tag),
    .io_in_1_bits_fflags_bits_uop_ftq_idx(Arbiter_io_in_1_bits_fflags_bits_uop_ftq_idx),
    .io_in_1_bits_fflags_bits_uop_edge_inst(Arbiter_io_in_1_bits_fflags_bits_uop_edge_inst),
    .io_in_1_bits_fflags_bits_uop_pc_lob(Arbiter_io_in_1_bits_fflags_bits_uop_pc_lob),
    .io_in_1_bits_fflags_bits_uop_taken(Arbiter_io_in_1_bits_fflags_bits_uop_taken),
    .io_in_1_bits_fflags_bits_uop_imm_packed(Arbiter_io_in_1_bits_fflags_bits_uop_imm_packed),
    .io_in_1_bits_fflags_bits_uop_csr_addr(Arbiter_io_in_1_bits_fflags_bits_uop_csr_addr),
    .io_in_1_bits_fflags_bits_uop_rob_idx(Arbiter_io_in_1_bits_fflags_bits_uop_rob_idx),
    .io_in_1_bits_fflags_bits_uop_ldq_idx(Arbiter_io_in_1_bits_fflags_bits_uop_ldq_idx),
    .io_in_1_bits_fflags_bits_uop_stq_idx(Arbiter_io_in_1_bits_fflags_bits_uop_stq_idx),
    .io_in_1_bits_fflags_bits_uop_rxq_idx(Arbiter_io_in_1_bits_fflags_bits_uop_rxq_idx),
    .io_in_1_bits_fflags_bits_uop_pdst(Arbiter_io_in_1_bits_fflags_bits_uop_pdst),
    .io_in_1_bits_fflags_bits_uop_prs1(Arbiter_io_in_1_bits_fflags_bits_uop_prs1),
    .io_in_1_bits_fflags_bits_uop_prs2(Arbiter_io_in_1_bits_fflags_bits_uop_prs2),
    .io_in_1_bits_fflags_bits_uop_prs3(Arbiter_io_in_1_bits_fflags_bits_uop_prs3),
    .io_in_1_bits_fflags_bits_uop_ppred(Arbiter_io_in_1_bits_fflags_bits_uop_ppred),
    .io_in_1_bits_fflags_bits_uop_prs1_busy(Arbiter_io_in_1_bits_fflags_bits_uop_prs1_busy),
    .io_in_1_bits_fflags_bits_uop_prs2_busy(Arbiter_io_in_1_bits_fflags_bits_uop_prs2_busy),
    .io_in_1_bits_fflags_bits_uop_prs3_busy(Arbiter_io_in_1_bits_fflags_bits_uop_prs3_busy),
    .io_in_1_bits_fflags_bits_uop_ppred_busy(Arbiter_io_in_1_bits_fflags_bits_uop_ppred_busy),
    .io_in_1_bits_fflags_bits_uop_stale_pdst(Arbiter_io_in_1_bits_fflags_bits_uop_stale_pdst),
    .io_in_1_bits_fflags_bits_uop_exception(Arbiter_io_in_1_bits_fflags_bits_uop_exception),
    .io_in_1_bits_fflags_bits_uop_exc_cause(Arbiter_io_in_1_bits_fflags_bits_uop_exc_cause),
    .io_in_1_bits_fflags_bits_uop_bypassable(Arbiter_io_in_1_bits_fflags_bits_uop_bypassable),
    .io_in_1_bits_fflags_bits_uop_mem_cmd(Arbiter_io_in_1_bits_fflags_bits_uop_mem_cmd),
    .io_in_1_bits_fflags_bits_uop_mem_size(Arbiter_io_in_1_bits_fflags_bits_uop_mem_size),
    .io_in_1_bits_fflags_bits_uop_mem_signed(Arbiter_io_in_1_bits_fflags_bits_uop_mem_signed),
    .io_in_1_bits_fflags_bits_uop_is_fence(Arbiter_io_in_1_bits_fflags_bits_uop_is_fence),
    .io_in_1_bits_fflags_bits_uop_is_fencei(Arbiter_io_in_1_bits_fflags_bits_uop_is_fencei),
    .io_in_1_bits_fflags_bits_uop_is_amo(Arbiter_io_in_1_bits_fflags_bits_uop_is_amo),
    .io_in_1_bits_fflags_bits_uop_uses_ldq(Arbiter_io_in_1_bits_fflags_bits_uop_uses_ldq),
    .io_in_1_bits_fflags_bits_uop_uses_stq(Arbiter_io_in_1_bits_fflags_bits_uop_uses_stq),
    .io_in_1_bits_fflags_bits_uop_is_sys_pc2epc(Arbiter_io_in_1_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_in_1_bits_fflags_bits_uop_is_unique(Arbiter_io_in_1_bits_fflags_bits_uop_is_unique),
    .io_in_1_bits_fflags_bits_uop_flush_on_commit(Arbiter_io_in_1_bits_fflags_bits_uop_flush_on_commit),
    .io_in_1_bits_fflags_bits_uop_ldst_is_rs1(Arbiter_io_in_1_bits_fflags_bits_uop_ldst_is_rs1),
    .io_in_1_bits_fflags_bits_uop_ldst(Arbiter_io_in_1_bits_fflags_bits_uop_ldst),
    .io_in_1_bits_fflags_bits_uop_lrs1(Arbiter_io_in_1_bits_fflags_bits_uop_lrs1),
    .io_in_1_bits_fflags_bits_uop_lrs2(Arbiter_io_in_1_bits_fflags_bits_uop_lrs2),
    .io_in_1_bits_fflags_bits_uop_lrs3(Arbiter_io_in_1_bits_fflags_bits_uop_lrs3),
    .io_in_1_bits_fflags_bits_uop_ldst_val(Arbiter_io_in_1_bits_fflags_bits_uop_ldst_val),
    .io_in_1_bits_fflags_bits_uop_dst_rtype(Arbiter_io_in_1_bits_fflags_bits_uop_dst_rtype),
    .io_in_1_bits_fflags_bits_uop_lrs1_rtype(Arbiter_io_in_1_bits_fflags_bits_uop_lrs1_rtype),
    .io_in_1_bits_fflags_bits_uop_lrs2_rtype(Arbiter_io_in_1_bits_fflags_bits_uop_lrs2_rtype),
    .io_in_1_bits_fflags_bits_uop_frs3_en(Arbiter_io_in_1_bits_fflags_bits_uop_frs3_en),
    .io_in_1_bits_fflags_bits_uop_fp_val(Arbiter_io_in_1_bits_fflags_bits_uop_fp_val),
    .io_in_1_bits_fflags_bits_uop_fp_single(Arbiter_io_in_1_bits_fflags_bits_uop_fp_single),
    .io_in_1_bits_fflags_bits_uop_xcpt_pf_if(Arbiter_io_in_1_bits_fflags_bits_uop_xcpt_pf_if),
    .io_in_1_bits_fflags_bits_uop_xcpt_ae_if(Arbiter_io_in_1_bits_fflags_bits_uop_xcpt_ae_if),
    .io_in_1_bits_fflags_bits_uop_xcpt_ma_if(Arbiter_io_in_1_bits_fflags_bits_uop_xcpt_ma_if),
    .io_in_1_bits_fflags_bits_uop_bp_debug_if(Arbiter_io_in_1_bits_fflags_bits_uop_bp_debug_if),
    .io_in_1_bits_fflags_bits_uop_bp_xcpt_if(Arbiter_io_in_1_bits_fflags_bits_uop_bp_xcpt_if),
    .io_in_1_bits_fflags_bits_uop_debug_fsrc(Arbiter_io_in_1_bits_fflags_bits_uop_debug_fsrc),
    .io_in_1_bits_fflags_bits_uop_debug_tsrc(Arbiter_io_in_1_bits_fflags_bits_uop_debug_tsrc),
    .io_in_1_bits_fflags_bits_flags(Arbiter_io_in_1_bits_fflags_bits_flags),
    .io_out_ready(Arbiter_io_out_ready),
    .io_out_valid(Arbiter_io_out_valid),
    .io_out_bits_uop_uopc(Arbiter_io_out_bits_uop_uopc),
    .io_out_bits_uop_inst(Arbiter_io_out_bits_uop_inst),
    .io_out_bits_uop_debug_inst(Arbiter_io_out_bits_uop_debug_inst),
    .io_out_bits_uop_is_rvc(Arbiter_io_out_bits_uop_is_rvc),
    .io_out_bits_uop_debug_pc(Arbiter_io_out_bits_uop_debug_pc),
    .io_out_bits_uop_iq_type(Arbiter_io_out_bits_uop_iq_type),
    .io_out_bits_uop_fu_code(Arbiter_io_out_bits_uop_fu_code),
    .io_out_bits_uop_ctrl_br_type(Arbiter_io_out_bits_uop_ctrl_br_type),
    .io_out_bits_uop_ctrl_op1_sel(Arbiter_io_out_bits_uop_ctrl_op1_sel),
    .io_out_bits_uop_ctrl_op2_sel(Arbiter_io_out_bits_uop_ctrl_op2_sel),
    .io_out_bits_uop_ctrl_imm_sel(Arbiter_io_out_bits_uop_ctrl_imm_sel),
    .io_out_bits_uop_ctrl_op_fcn(Arbiter_io_out_bits_uop_ctrl_op_fcn),
    .io_out_bits_uop_ctrl_fcn_dw(Arbiter_io_out_bits_uop_ctrl_fcn_dw),
    .io_out_bits_uop_ctrl_csr_cmd(Arbiter_io_out_bits_uop_ctrl_csr_cmd),
    .io_out_bits_uop_ctrl_is_load(Arbiter_io_out_bits_uop_ctrl_is_load),
    .io_out_bits_uop_ctrl_is_sta(Arbiter_io_out_bits_uop_ctrl_is_sta),
    .io_out_bits_uop_ctrl_is_std(Arbiter_io_out_bits_uop_ctrl_is_std),
    .io_out_bits_uop_iw_state(Arbiter_io_out_bits_uop_iw_state),
    .io_out_bits_uop_iw_p1_poisoned(Arbiter_io_out_bits_uop_iw_p1_poisoned),
    .io_out_bits_uop_iw_p2_poisoned(Arbiter_io_out_bits_uop_iw_p2_poisoned),
    .io_out_bits_uop_is_br(Arbiter_io_out_bits_uop_is_br),
    .io_out_bits_uop_is_jalr(Arbiter_io_out_bits_uop_is_jalr),
    .io_out_bits_uop_is_jal(Arbiter_io_out_bits_uop_is_jal),
    .io_out_bits_uop_is_sfb(Arbiter_io_out_bits_uop_is_sfb),
    .io_out_bits_uop_br_mask(Arbiter_io_out_bits_uop_br_mask),
    .io_out_bits_uop_br_tag(Arbiter_io_out_bits_uop_br_tag),
    .io_out_bits_uop_ftq_idx(Arbiter_io_out_bits_uop_ftq_idx),
    .io_out_bits_uop_edge_inst(Arbiter_io_out_bits_uop_edge_inst),
    .io_out_bits_uop_pc_lob(Arbiter_io_out_bits_uop_pc_lob),
    .io_out_bits_uop_taken(Arbiter_io_out_bits_uop_taken),
    .io_out_bits_uop_imm_packed(Arbiter_io_out_bits_uop_imm_packed),
    .io_out_bits_uop_csr_addr(Arbiter_io_out_bits_uop_csr_addr),
    .io_out_bits_uop_rob_idx(Arbiter_io_out_bits_uop_rob_idx),
    .io_out_bits_uop_ldq_idx(Arbiter_io_out_bits_uop_ldq_idx),
    .io_out_bits_uop_stq_idx(Arbiter_io_out_bits_uop_stq_idx),
    .io_out_bits_uop_rxq_idx(Arbiter_io_out_bits_uop_rxq_idx),
    .io_out_bits_uop_pdst(Arbiter_io_out_bits_uop_pdst),
    .io_out_bits_uop_prs1(Arbiter_io_out_bits_uop_prs1),
    .io_out_bits_uop_prs2(Arbiter_io_out_bits_uop_prs2),
    .io_out_bits_uop_prs3(Arbiter_io_out_bits_uop_prs3),
    .io_out_bits_uop_ppred(Arbiter_io_out_bits_uop_ppred),
    .io_out_bits_uop_prs1_busy(Arbiter_io_out_bits_uop_prs1_busy),
    .io_out_bits_uop_prs2_busy(Arbiter_io_out_bits_uop_prs2_busy),
    .io_out_bits_uop_prs3_busy(Arbiter_io_out_bits_uop_prs3_busy),
    .io_out_bits_uop_ppred_busy(Arbiter_io_out_bits_uop_ppred_busy),
    .io_out_bits_uop_stale_pdst(Arbiter_io_out_bits_uop_stale_pdst),
    .io_out_bits_uop_exception(Arbiter_io_out_bits_uop_exception),
    .io_out_bits_uop_exc_cause(Arbiter_io_out_bits_uop_exc_cause),
    .io_out_bits_uop_bypassable(Arbiter_io_out_bits_uop_bypassable),
    .io_out_bits_uop_mem_cmd(Arbiter_io_out_bits_uop_mem_cmd),
    .io_out_bits_uop_mem_size(Arbiter_io_out_bits_uop_mem_size),
    .io_out_bits_uop_mem_signed(Arbiter_io_out_bits_uop_mem_signed),
    .io_out_bits_uop_is_fence(Arbiter_io_out_bits_uop_is_fence),
    .io_out_bits_uop_is_fencei(Arbiter_io_out_bits_uop_is_fencei),
    .io_out_bits_uop_is_amo(Arbiter_io_out_bits_uop_is_amo),
    .io_out_bits_uop_uses_ldq(Arbiter_io_out_bits_uop_uses_ldq),
    .io_out_bits_uop_uses_stq(Arbiter_io_out_bits_uop_uses_stq),
    .io_out_bits_uop_is_sys_pc2epc(Arbiter_io_out_bits_uop_is_sys_pc2epc),
    .io_out_bits_uop_is_unique(Arbiter_io_out_bits_uop_is_unique),
    .io_out_bits_uop_flush_on_commit(Arbiter_io_out_bits_uop_flush_on_commit),
    .io_out_bits_uop_ldst_is_rs1(Arbiter_io_out_bits_uop_ldst_is_rs1),
    .io_out_bits_uop_ldst(Arbiter_io_out_bits_uop_ldst),
    .io_out_bits_uop_lrs1(Arbiter_io_out_bits_uop_lrs1),
    .io_out_bits_uop_lrs2(Arbiter_io_out_bits_uop_lrs2),
    .io_out_bits_uop_lrs3(Arbiter_io_out_bits_uop_lrs3),
    .io_out_bits_uop_ldst_val(Arbiter_io_out_bits_uop_ldst_val),
    .io_out_bits_uop_dst_rtype(Arbiter_io_out_bits_uop_dst_rtype),
    .io_out_bits_uop_lrs1_rtype(Arbiter_io_out_bits_uop_lrs1_rtype),
    .io_out_bits_uop_lrs2_rtype(Arbiter_io_out_bits_uop_lrs2_rtype),
    .io_out_bits_uop_frs3_en(Arbiter_io_out_bits_uop_frs3_en),
    .io_out_bits_uop_fp_val(Arbiter_io_out_bits_uop_fp_val),
    .io_out_bits_uop_fp_single(Arbiter_io_out_bits_uop_fp_single),
    .io_out_bits_uop_xcpt_pf_if(Arbiter_io_out_bits_uop_xcpt_pf_if),
    .io_out_bits_uop_xcpt_ae_if(Arbiter_io_out_bits_uop_xcpt_ae_if),
    .io_out_bits_uop_xcpt_ma_if(Arbiter_io_out_bits_uop_xcpt_ma_if),
    .io_out_bits_uop_bp_debug_if(Arbiter_io_out_bits_uop_bp_debug_if),
    .io_out_bits_uop_bp_xcpt_if(Arbiter_io_out_bits_uop_bp_xcpt_if),
    .io_out_bits_uop_debug_fsrc(Arbiter_io_out_bits_uop_debug_fsrc),
    .io_out_bits_uop_debug_tsrc(Arbiter_io_out_bits_uop_debug_tsrc),
    .io_out_bits_data(Arbiter_io_out_bits_data),
    .io_out_bits_predicated(Arbiter_io_out_bits_predicated),
    .io_out_bits_fflags_valid(Arbiter_io_out_bits_fflags_valid),
    .io_out_bits_fflags_bits_uop_uopc(Arbiter_io_out_bits_fflags_bits_uop_uopc),
    .io_out_bits_fflags_bits_uop_inst(Arbiter_io_out_bits_fflags_bits_uop_inst),
    .io_out_bits_fflags_bits_uop_debug_inst(Arbiter_io_out_bits_fflags_bits_uop_debug_inst),
    .io_out_bits_fflags_bits_uop_is_rvc(Arbiter_io_out_bits_fflags_bits_uop_is_rvc),
    .io_out_bits_fflags_bits_uop_debug_pc(Arbiter_io_out_bits_fflags_bits_uop_debug_pc),
    .io_out_bits_fflags_bits_uop_iq_type(Arbiter_io_out_bits_fflags_bits_uop_iq_type),
    .io_out_bits_fflags_bits_uop_fu_code(Arbiter_io_out_bits_fflags_bits_uop_fu_code),
    .io_out_bits_fflags_bits_uop_ctrl_br_type(Arbiter_io_out_bits_fflags_bits_uop_ctrl_br_type),
    .io_out_bits_fflags_bits_uop_ctrl_op1_sel(Arbiter_io_out_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_out_bits_fflags_bits_uop_ctrl_op2_sel(Arbiter_io_out_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_out_bits_fflags_bits_uop_ctrl_imm_sel(Arbiter_io_out_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_out_bits_fflags_bits_uop_ctrl_op_fcn(Arbiter_io_out_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_out_bits_fflags_bits_uop_ctrl_fcn_dw(Arbiter_io_out_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_out_bits_fflags_bits_uop_ctrl_csr_cmd(Arbiter_io_out_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_out_bits_fflags_bits_uop_ctrl_is_load(Arbiter_io_out_bits_fflags_bits_uop_ctrl_is_load),
    .io_out_bits_fflags_bits_uop_ctrl_is_sta(Arbiter_io_out_bits_fflags_bits_uop_ctrl_is_sta),
    .io_out_bits_fflags_bits_uop_ctrl_is_std(Arbiter_io_out_bits_fflags_bits_uop_ctrl_is_std),
    .io_out_bits_fflags_bits_uop_iw_state(Arbiter_io_out_bits_fflags_bits_uop_iw_state),
    .io_out_bits_fflags_bits_uop_iw_p1_poisoned(Arbiter_io_out_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_out_bits_fflags_bits_uop_iw_p2_poisoned(Arbiter_io_out_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_out_bits_fflags_bits_uop_is_br(Arbiter_io_out_bits_fflags_bits_uop_is_br),
    .io_out_bits_fflags_bits_uop_is_jalr(Arbiter_io_out_bits_fflags_bits_uop_is_jalr),
    .io_out_bits_fflags_bits_uop_is_jal(Arbiter_io_out_bits_fflags_bits_uop_is_jal),
    .io_out_bits_fflags_bits_uop_is_sfb(Arbiter_io_out_bits_fflags_bits_uop_is_sfb),
    .io_out_bits_fflags_bits_uop_br_mask(Arbiter_io_out_bits_fflags_bits_uop_br_mask),
    .io_out_bits_fflags_bits_uop_br_tag(Arbiter_io_out_bits_fflags_bits_uop_br_tag),
    .io_out_bits_fflags_bits_uop_ftq_idx(Arbiter_io_out_bits_fflags_bits_uop_ftq_idx),
    .io_out_bits_fflags_bits_uop_edge_inst(Arbiter_io_out_bits_fflags_bits_uop_edge_inst),
    .io_out_bits_fflags_bits_uop_pc_lob(Arbiter_io_out_bits_fflags_bits_uop_pc_lob),
    .io_out_bits_fflags_bits_uop_taken(Arbiter_io_out_bits_fflags_bits_uop_taken),
    .io_out_bits_fflags_bits_uop_imm_packed(Arbiter_io_out_bits_fflags_bits_uop_imm_packed),
    .io_out_bits_fflags_bits_uop_csr_addr(Arbiter_io_out_bits_fflags_bits_uop_csr_addr),
    .io_out_bits_fflags_bits_uop_rob_idx(Arbiter_io_out_bits_fflags_bits_uop_rob_idx),
    .io_out_bits_fflags_bits_uop_ldq_idx(Arbiter_io_out_bits_fflags_bits_uop_ldq_idx),
    .io_out_bits_fflags_bits_uop_stq_idx(Arbiter_io_out_bits_fflags_bits_uop_stq_idx),
    .io_out_bits_fflags_bits_uop_rxq_idx(Arbiter_io_out_bits_fflags_bits_uop_rxq_idx),
    .io_out_bits_fflags_bits_uop_pdst(Arbiter_io_out_bits_fflags_bits_uop_pdst),
    .io_out_bits_fflags_bits_uop_prs1(Arbiter_io_out_bits_fflags_bits_uop_prs1),
    .io_out_bits_fflags_bits_uop_prs2(Arbiter_io_out_bits_fflags_bits_uop_prs2),
    .io_out_bits_fflags_bits_uop_prs3(Arbiter_io_out_bits_fflags_bits_uop_prs3),
    .io_out_bits_fflags_bits_uop_ppred(Arbiter_io_out_bits_fflags_bits_uop_ppred),
    .io_out_bits_fflags_bits_uop_prs1_busy(Arbiter_io_out_bits_fflags_bits_uop_prs1_busy),
    .io_out_bits_fflags_bits_uop_prs2_busy(Arbiter_io_out_bits_fflags_bits_uop_prs2_busy),
    .io_out_bits_fflags_bits_uop_prs3_busy(Arbiter_io_out_bits_fflags_bits_uop_prs3_busy),
    .io_out_bits_fflags_bits_uop_ppred_busy(Arbiter_io_out_bits_fflags_bits_uop_ppred_busy),
    .io_out_bits_fflags_bits_uop_stale_pdst(Arbiter_io_out_bits_fflags_bits_uop_stale_pdst),
    .io_out_bits_fflags_bits_uop_exception(Arbiter_io_out_bits_fflags_bits_uop_exception),
    .io_out_bits_fflags_bits_uop_exc_cause(Arbiter_io_out_bits_fflags_bits_uop_exc_cause),
    .io_out_bits_fflags_bits_uop_bypassable(Arbiter_io_out_bits_fflags_bits_uop_bypassable),
    .io_out_bits_fflags_bits_uop_mem_cmd(Arbiter_io_out_bits_fflags_bits_uop_mem_cmd),
    .io_out_bits_fflags_bits_uop_mem_size(Arbiter_io_out_bits_fflags_bits_uop_mem_size),
    .io_out_bits_fflags_bits_uop_mem_signed(Arbiter_io_out_bits_fflags_bits_uop_mem_signed),
    .io_out_bits_fflags_bits_uop_is_fence(Arbiter_io_out_bits_fflags_bits_uop_is_fence),
    .io_out_bits_fflags_bits_uop_is_fencei(Arbiter_io_out_bits_fflags_bits_uop_is_fencei),
    .io_out_bits_fflags_bits_uop_is_amo(Arbiter_io_out_bits_fflags_bits_uop_is_amo),
    .io_out_bits_fflags_bits_uop_uses_ldq(Arbiter_io_out_bits_fflags_bits_uop_uses_ldq),
    .io_out_bits_fflags_bits_uop_uses_stq(Arbiter_io_out_bits_fflags_bits_uop_uses_stq),
    .io_out_bits_fflags_bits_uop_is_sys_pc2epc(Arbiter_io_out_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_out_bits_fflags_bits_uop_is_unique(Arbiter_io_out_bits_fflags_bits_uop_is_unique),
    .io_out_bits_fflags_bits_uop_flush_on_commit(Arbiter_io_out_bits_fflags_bits_uop_flush_on_commit),
    .io_out_bits_fflags_bits_uop_ldst_is_rs1(Arbiter_io_out_bits_fflags_bits_uop_ldst_is_rs1),
    .io_out_bits_fflags_bits_uop_ldst(Arbiter_io_out_bits_fflags_bits_uop_ldst),
    .io_out_bits_fflags_bits_uop_lrs1(Arbiter_io_out_bits_fflags_bits_uop_lrs1),
    .io_out_bits_fflags_bits_uop_lrs2(Arbiter_io_out_bits_fflags_bits_uop_lrs2),
    .io_out_bits_fflags_bits_uop_lrs3(Arbiter_io_out_bits_fflags_bits_uop_lrs3),
    .io_out_bits_fflags_bits_uop_ldst_val(Arbiter_io_out_bits_fflags_bits_uop_ldst_val),
    .io_out_bits_fflags_bits_uop_dst_rtype(Arbiter_io_out_bits_fflags_bits_uop_dst_rtype),
    .io_out_bits_fflags_bits_uop_lrs1_rtype(Arbiter_io_out_bits_fflags_bits_uop_lrs1_rtype),
    .io_out_bits_fflags_bits_uop_lrs2_rtype(Arbiter_io_out_bits_fflags_bits_uop_lrs2_rtype),
    .io_out_bits_fflags_bits_uop_frs3_en(Arbiter_io_out_bits_fflags_bits_uop_frs3_en),
    .io_out_bits_fflags_bits_uop_fp_val(Arbiter_io_out_bits_fflags_bits_uop_fp_val),
    .io_out_bits_fflags_bits_uop_fp_single(Arbiter_io_out_bits_fflags_bits_uop_fp_single),
    .io_out_bits_fflags_bits_uop_xcpt_pf_if(Arbiter_io_out_bits_fflags_bits_uop_xcpt_pf_if),
    .io_out_bits_fflags_bits_uop_xcpt_ae_if(Arbiter_io_out_bits_fflags_bits_uop_xcpt_ae_if),
    .io_out_bits_fflags_bits_uop_xcpt_ma_if(Arbiter_io_out_bits_fflags_bits_uop_xcpt_ma_if),
    .io_out_bits_fflags_bits_uop_bp_debug_if(Arbiter_io_out_bits_fflags_bits_uop_bp_debug_if),
    .io_out_bits_fflags_bits_uop_bp_xcpt_if(Arbiter_io_out_bits_fflags_bits_uop_bp_xcpt_if),
    .io_out_bits_fflags_bits_uop_debug_fsrc(Arbiter_io_out_bits_fflags_bits_uop_debug_fsrc),
    .io_out_bits_fflags_bits_uop_debug_tsrc(Arbiter_io_out_bits_fflags_bits_uop_debug_tsrc),
    .io_out_bits_fflags_bits_flags(Arbiter_io_out_bits_fflags_bits_flags),
    .io_chosen(Arbiter_io_chosen)
  );
  assign io_fu_types = _T_7 | _T_10; // @[execution-unit.scala 459:60]
  assign io_req_ready = 1'h0;
  assign io_fresp_valid = (fpu_io_resp_valid | fdivsqrt_io_resp_valid) & _T_31; // @[execution-unit.scala 516:69]
  assign io_fresp_bits_uop_uopc = fpu_io_resp_valid ? fpu_io_resp_bits_uop_uopc : fdivsqrt_io_resp_bits_uop_uopc; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_inst = fpu_io_resp_valid ? fpu_io_resp_bits_uop_inst : fdivsqrt_io_resp_bits_uop_inst; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_debug_inst = fpu_io_resp_valid ? fpu_io_resp_bits_uop_debug_inst :
    fdivsqrt_io_resp_bits_uop_debug_inst; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_is_rvc = fpu_io_resp_valid ? fpu_io_resp_bits_uop_is_rvc : fdivsqrt_io_resp_bits_uop_is_rvc; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_debug_pc = fpu_io_resp_valid ? fpu_io_resp_bits_uop_debug_pc :
    fdivsqrt_io_resp_bits_uop_debug_pc; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_iq_type = fpu_io_resp_valid ? fpu_io_resp_bits_uop_iq_type :
    fdivsqrt_io_resp_bits_uop_iq_type; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_fu_code = fpu_io_resp_valid ? fpu_io_resp_bits_uop_fu_code :
    fdivsqrt_io_resp_bits_uop_fu_code; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ctrl_br_type = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ctrl_br_type :
    fdivsqrt_io_resp_bits_uop_ctrl_br_type; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ctrl_op1_sel = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ctrl_op1_sel :
    fdivsqrt_io_resp_bits_uop_ctrl_op1_sel; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ctrl_op2_sel = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ctrl_op2_sel :
    fdivsqrt_io_resp_bits_uop_ctrl_op2_sel; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ctrl_imm_sel = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ctrl_imm_sel :
    fdivsqrt_io_resp_bits_uop_ctrl_imm_sel; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ctrl_op_fcn = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ctrl_op_fcn :
    fdivsqrt_io_resp_bits_uop_ctrl_op_fcn; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ctrl_fcn_dw = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ctrl_fcn_dw :
    fdivsqrt_io_resp_bits_uop_ctrl_fcn_dw; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ctrl_csr_cmd = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ctrl_csr_cmd :
    fdivsqrt_io_resp_bits_uop_ctrl_csr_cmd; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ctrl_is_load = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ctrl_is_load :
    fdivsqrt_io_resp_bits_uop_ctrl_is_load; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ctrl_is_sta = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ctrl_is_sta :
    fdivsqrt_io_resp_bits_uop_ctrl_is_sta; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ctrl_is_std = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ctrl_is_std :
    fdivsqrt_io_resp_bits_uop_ctrl_is_std; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_iw_state = fpu_io_resp_valid ? fpu_io_resp_bits_uop_iw_state :
    fdivsqrt_io_resp_bits_uop_iw_state; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_iw_p1_poisoned = fpu_io_resp_valid ? fpu_io_resp_bits_uop_iw_p1_poisoned :
    fdivsqrt_io_resp_bits_uop_iw_p1_poisoned; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_iw_p2_poisoned = fpu_io_resp_valid ? fpu_io_resp_bits_uop_iw_p2_poisoned :
    fdivsqrt_io_resp_bits_uop_iw_p2_poisoned; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_is_br = fpu_io_resp_valid ? fpu_io_resp_bits_uop_is_br : fdivsqrt_io_resp_bits_uop_is_br; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_is_jalr = fpu_io_resp_valid ? fpu_io_resp_bits_uop_is_jalr :
    fdivsqrt_io_resp_bits_uop_is_jalr; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_is_jal = fpu_io_resp_valid ? fpu_io_resp_bits_uop_is_jal : fdivsqrt_io_resp_bits_uop_is_jal; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_is_sfb = fpu_io_resp_valid ? fpu_io_resp_bits_uop_is_sfb : fdivsqrt_io_resp_bits_uop_is_sfb; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_br_mask = fpu_io_resp_valid ? fpu_io_resp_bits_uop_br_mask :
    fdivsqrt_io_resp_bits_uop_br_mask; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_br_tag = fpu_io_resp_valid ? fpu_io_resp_bits_uop_br_tag : fdivsqrt_io_resp_bits_uop_br_tag; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ftq_idx = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ftq_idx :
    fdivsqrt_io_resp_bits_uop_ftq_idx; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_edge_inst = fpu_io_resp_valid ? fpu_io_resp_bits_uop_edge_inst :
    fdivsqrt_io_resp_bits_uop_edge_inst; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_pc_lob = fpu_io_resp_valid ? fpu_io_resp_bits_uop_pc_lob : fdivsqrt_io_resp_bits_uop_pc_lob; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_taken = fpu_io_resp_valid ? fpu_io_resp_bits_uop_taken : fdivsqrt_io_resp_bits_uop_taken; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_imm_packed = fpu_io_resp_valid ? fpu_io_resp_bits_uop_imm_packed :
    fdivsqrt_io_resp_bits_uop_imm_packed; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_csr_addr = fpu_io_resp_valid ? fpu_io_resp_bits_uop_csr_addr :
    fdivsqrt_io_resp_bits_uop_csr_addr; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_rob_idx = fpu_io_resp_valid ? fpu_io_resp_bits_uop_rob_idx :
    fdivsqrt_io_resp_bits_uop_rob_idx; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ldq_idx = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ldq_idx :
    fdivsqrt_io_resp_bits_uop_ldq_idx; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_stq_idx = fpu_io_resp_valid ? fpu_io_resp_bits_uop_stq_idx :
    fdivsqrt_io_resp_bits_uop_stq_idx; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_rxq_idx = fpu_io_resp_valid ? fpu_io_resp_bits_uop_rxq_idx :
    fdivsqrt_io_resp_bits_uop_rxq_idx; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_pdst = fpu_io_resp_valid ? fpu_io_resp_bits_uop_pdst : fdivsqrt_io_resp_bits_uop_pdst; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_prs1 = fpu_io_resp_valid ? fpu_io_resp_bits_uop_prs1 : fdivsqrt_io_resp_bits_uop_prs1; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_prs2 = fpu_io_resp_valid ? fpu_io_resp_bits_uop_prs2 : fdivsqrt_io_resp_bits_uop_prs2; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_prs3 = fpu_io_resp_valid ? fpu_io_resp_bits_uop_prs3 : fdivsqrt_io_resp_bits_uop_prs3; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ppred = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ppred : fdivsqrt_io_resp_bits_uop_ppred; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_prs1_busy = fpu_io_resp_valid ? fpu_io_resp_bits_uop_prs1_busy :
    fdivsqrt_io_resp_bits_uop_prs1_busy; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_prs2_busy = fpu_io_resp_valid ? fpu_io_resp_bits_uop_prs2_busy :
    fdivsqrt_io_resp_bits_uop_prs2_busy; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_prs3_busy = fpu_io_resp_valid ? fpu_io_resp_bits_uop_prs3_busy :
    fdivsqrt_io_resp_bits_uop_prs3_busy; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ppred_busy = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ppred_busy :
    fdivsqrt_io_resp_bits_uop_ppred_busy; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_stale_pdst = fpu_io_resp_valid ? fpu_io_resp_bits_uop_stale_pdst :
    fdivsqrt_io_resp_bits_uop_stale_pdst; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_exception = fpu_io_resp_valid ? fpu_io_resp_bits_uop_exception :
    fdivsqrt_io_resp_bits_uop_exception; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_exc_cause = fpu_io_resp_valid ? fpu_io_resp_bits_uop_exc_cause :
    fdivsqrt_io_resp_bits_uop_exc_cause; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_bypassable = fpu_io_resp_valid ? fpu_io_resp_bits_uop_bypassable :
    fdivsqrt_io_resp_bits_uop_bypassable; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_mem_cmd = fpu_io_resp_valid ? fpu_io_resp_bits_uop_mem_cmd :
    fdivsqrt_io_resp_bits_uop_mem_cmd; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_mem_size = fpu_io_resp_valid ? fpu_io_resp_bits_uop_mem_size :
    fdivsqrt_io_resp_bits_uop_mem_size; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_mem_signed = fpu_io_resp_valid ? fpu_io_resp_bits_uop_mem_signed :
    fdivsqrt_io_resp_bits_uop_mem_signed; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_is_fence = fpu_io_resp_valid ? fpu_io_resp_bits_uop_is_fence :
    fdivsqrt_io_resp_bits_uop_is_fence; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_is_fencei = fpu_io_resp_valid ? fpu_io_resp_bits_uop_is_fencei :
    fdivsqrt_io_resp_bits_uop_is_fencei; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_is_amo = fpu_io_resp_valid ? fpu_io_resp_bits_uop_is_amo : fdivsqrt_io_resp_bits_uop_is_amo; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_uses_ldq = fpu_io_resp_valid ? fpu_io_resp_bits_uop_uses_ldq :
    fdivsqrt_io_resp_bits_uop_uses_ldq; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_uses_stq = fpu_io_resp_valid ? fpu_io_resp_bits_uop_uses_stq :
    fdivsqrt_io_resp_bits_uop_uses_stq; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_is_sys_pc2epc = fpu_io_resp_valid ? fpu_io_resp_bits_uop_is_sys_pc2epc :
    fdivsqrt_io_resp_bits_uop_is_sys_pc2epc; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_is_unique = fpu_io_resp_valid ? fpu_io_resp_bits_uop_is_unique :
    fdivsqrt_io_resp_bits_uop_is_unique; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_flush_on_commit = fpu_io_resp_valid ? fpu_io_resp_bits_uop_flush_on_commit :
    fdivsqrt_io_resp_bits_uop_flush_on_commit; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ldst_is_rs1 = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ldst_is_rs1 :
    fdivsqrt_io_resp_bits_uop_ldst_is_rs1; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ldst = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ldst : fdivsqrt_io_resp_bits_uop_ldst; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_lrs1 = fpu_io_resp_valid ? fpu_io_resp_bits_uop_lrs1 : fdivsqrt_io_resp_bits_uop_lrs1; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_lrs2 = fpu_io_resp_valid ? fpu_io_resp_bits_uop_lrs2 : fdivsqrt_io_resp_bits_uop_lrs2; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_lrs3 = fpu_io_resp_valid ? fpu_io_resp_bits_uop_lrs3 : fdivsqrt_io_resp_bits_uop_lrs3; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_ldst_val = fpu_io_resp_valid ? fpu_io_resp_bits_uop_ldst_val :
    fdivsqrt_io_resp_bits_uop_ldst_val; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_dst_rtype = fpu_io_resp_valid ? fpu_io_resp_bits_uop_dst_rtype :
    fdivsqrt_io_resp_bits_uop_dst_rtype; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_lrs1_rtype = fpu_io_resp_valid ? fpu_io_resp_bits_uop_lrs1_rtype :
    fdivsqrt_io_resp_bits_uop_lrs1_rtype; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_lrs2_rtype = fpu_io_resp_valid ? fpu_io_resp_bits_uop_lrs2_rtype :
    fdivsqrt_io_resp_bits_uop_lrs2_rtype; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_frs3_en = fpu_io_resp_valid ? fpu_io_resp_bits_uop_frs3_en :
    fdivsqrt_io_resp_bits_uop_frs3_en; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_fp_val = fpu_io_resp_valid ? fpu_io_resp_bits_uop_fp_val : fdivsqrt_io_resp_bits_uop_fp_val; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_fp_single = fpu_io_resp_valid ? fpu_io_resp_bits_uop_fp_single :
    fdivsqrt_io_resp_bits_uop_fp_single; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_xcpt_pf_if = fpu_io_resp_valid ? fpu_io_resp_bits_uop_xcpt_pf_if :
    fdivsqrt_io_resp_bits_uop_xcpt_pf_if; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_xcpt_ae_if = fpu_io_resp_valid ? fpu_io_resp_bits_uop_xcpt_ae_if :
    fdivsqrt_io_resp_bits_uop_xcpt_ae_if; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_xcpt_ma_if = fpu_io_resp_valid ? fpu_io_resp_bits_uop_xcpt_ma_if :
    fdivsqrt_io_resp_bits_uop_xcpt_ma_if; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_bp_debug_if = fpu_io_resp_valid ? fpu_io_resp_bits_uop_bp_debug_if :
    fdivsqrt_io_resp_bits_uop_bp_debug_if; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_bp_xcpt_if = fpu_io_resp_valid ? fpu_io_resp_bits_uop_bp_xcpt_if :
    fdivsqrt_io_resp_bits_uop_bp_xcpt_if; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_debug_fsrc = fpu_io_resp_valid ? fpu_io_resp_bits_uop_debug_fsrc :
    fdivsqrt_io_resp_bits_uop_debug_fsrc; // @[Mux.scala 47:69]
  assign io_fresp_bits_uop_debug_tsrc = fpu_io_resp_valid ? fpu_io_resp_bits_uop_debug_tsrc :
    fdivsqrt_io_resp_bits_uop_debug_tsrc; // @[Mux.scala 47:69]
  assign io_fresp_bits_data = fpu_io_resp_valid ? fpu_io_resp_bits_data : fdivsqrt_io_resp_bits_data; // @[Mux.scala 47:69]
  assign io_fresp_bits_predicated = 1'h0; // @[execution-unit.scala 152:30]
  assign io_fresp_bits_fflags_valid = fpu_resp_val ? fpu_resp_fflags_valid : fdiv_resp_fflags_valid; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_uopc = fpu_resp_val ? fpu_resp_fflags_bits_uop_uopc :
    fdiv_resp_fflags_bits_uop_uopc; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_inst = fpu_resp_val ? fpu_resp_fflags_bits_uop_inst :
    fdiv_resp_fflags_bits_uop_inst; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_debug_inst = fpu_resp_val ? fpu_resp_fflags_bits_uop_debug_inst :
    fdiv_resp_fflags_bits_uop_debug_inst; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_is_rvc = fpu_resp_val ? fpu_resp_fflags_bits_uop_is_rvc :
    fdiv_resp_fflags_bits_uop_is_rvc; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_debug_pc = fpu_resp_val ? fpu_resp_fflags_bits_uop_debug_pc :
    fdiv_resp_fflags_bits_uop_debug_pc; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_iq_type = fpu_resp_val ? fpu_resp_fflags_bits_uop_iq_type :
    fdiv_resp_fflags_bits_uop_iq_type; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_fu_code = fpu_resp_val ? fpu_resp_fflags_bits_uop_fu_code :
    fdiv_resp_fflags_bits_uop_fu_code; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ctrl_br_type = fpu_resp_val ? fpu_resp_fflags_bits_uop_ctrl_br_type :
    fdiv_resp_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ctrl_op1_sel = fpu_resp_val ? fpu_resp_fflags_bits_uop_ctrl_op1_sel :
    fdiv_resp_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ctrl_op2_sel = fpu_resp_val ? fpu_resp_fflags_bits_uop_ctrl_op2_sel :
    fdiv_resp_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ctrl_imm_sel = fpu_resp_val ? fpu_resp_fflags_bits_uop_ctrl_imm_sel :
    fdiv_resp_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ctrl_op_fcn = fpu_resp_val ? fpu_resp_fflags_bits_uop_ctrl_op_fcn :
    fdiv_resp_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ctrl_fcn_dw = fpu_resp_val ? fpu_resp_fflags_bits_uop_ctrl_fcn_dw :
    fdiv_resp_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ctrl_csr_cmd = fpu_resp_val ? fpu_resp_fflags_bits_uop_ctrl_csr_cmd :
    fdiv_resp_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ctrl_is_load = fpu_resp_val ? fpu_resp_fflags_bits_uop_ctrl_is_load :
    fdiv_resp_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ctrl_is_sta = fpu_resp_val ? fpu_resp_fflags_bits_uop_ctrl_is_sta :
    fdiv_resp_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ctrl_is_std = fpu_resp_val ? fpu_resp_fflags_bits_uop_ctrl_is_std :
    fdiv_resp_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_iw_state = fpu_resp_val ? fpu_resp_fflags_bits_uop_iw_state :
    fdiv_resp_fflags_bits_uop_iw_state; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_iw_p1_poisoned = fpu_resp_val ? fpu_resp_fflags_bits_uop_iw_p1_poisoned :
    fdiv_resp_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_iw_p2_poisoned = fpu_resp_val ? fpu_resp_fflags_bits_uop_iw_p2_poisoned :
    fdiv_resp_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_is_br = fpu_resp_val ? fpu_resp_fflags_bits_uop_is_br :
    fdiv_resp_fflags_bits_uop_is_br; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_is_jalr = fpu_resp_val ? fpu_resp_fflags_bits_uop_is_jalr :
    fdiv_resp_fflags_bits_uop_is_jalr; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_is_jal = fpu_resp_val ? fpu_resp_fflags_bits_uop_is_jal :
    fdiv_resp_fflags_bits_uop_is_jal; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_is_sfb = fpu_resp_val ? fpu_resp_fflags_bits_uop_is_sfb :
    fdiv_resp_fflags_bits_uop_is_sfb; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_br_mask = fpu_resp_val ? fpu_resp_fflags_bits_uop_br_mask :
    fdiv_resp_fflags_bits_uop_br_mask; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_br_tag = fpu_resp_val ? fpu_resp_fflags_bits_uop_br_tag :
    fdiv_resp_fflags_bits_uop_br_tag; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ftq_idx = fpu_resp_val ? fpu_resp_fflags_bits_uop_ftq_idx :
    fdiv_resp_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_edge_inst = fpu_resp_val ? fpu_resp_fflags_bits_uop_edge_inst :
    fdiv_resp_fflags_bits_uop_edge_inst; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_pc_lob = fpu_resp_val ? fpu_resp_fflags_bits_uop_pc_lob :
    fdiv_resp_fflags_bits_uop_pc_lob; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_taken = fpu_resp_val ? fpu_resp_fflags_bits_uop_taken :
    fdiv_resp_fflags_bits_uop_taken; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_imm_packed = fpu_resp_val ? fpu_resp_fflags_bits_uop_imm_packed :
    fdiv_resp_fflags_bits_uop_imm_packed; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_csr_addr = fpu_resp_val ? fpu_resp_fflags_bits_uop_csr_addr :
    fdiv_resp_fflags_bits_uop_csr_addr; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_rob_idx = fpu_resp_val ? fpu_resp_fflags_bits_uop_rob_idx :
    fdiv_resp_fflags_bits_uop_rob_idx; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ldq_idx = fpu_resp_val ? fpu_resp_fflags_bits_uop_ldq_idx :
    fdiv_resp_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_stq_idx = fpu_resp_val ? fpu_resp_fflags_bits_uop_stq_idx :
    fdiv_resp_fflags_bits_uop_stq_idx; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_rxq_idx = fpu_resp_val ? fpu_resp_fflags_bits_uop_rxq_idx :
    fdiv_resp_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_pdst = fpu_resp_val ? fpu_resp_fflags_bits_uop_pdst :
    fdiv_resp_fflags_bits_uop_pdst; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_prs1 = fpu_resp_val ? fpu_resp_fflags_bits_uop_prs1 :
    fdiv_resp_fflags_bits_uop_prs1; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_prs2 = fpu_resp_val ? fpu_resp_fflags_bits_uop_prs2 :
    fdiv_resp_fflags_bits_uop_prs2; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_prs3 = fpu_resp_val ? fpu_resp_fflags_bits_uop_prs3 :
    fdiv_resp_fflags_bits_uop_prs3; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ppred = fpu_resp_val ? fpu_resp_fflags_bits_uop_ppred :
    fdiv_resp_fflags_bits_uop_ppred; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_prs1_busy = fpu_resp_val ? fpu_resp_fflags_bits_uop_prs1_busy :
    fdiv_resp_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_prs2_busy = fpu_resp_val ? fpu_resp_fflags_bits_uop_prs2_busy :
    fdiv_resp_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_prs3_busy = fpu_resp_val ? fpu_resp_fflags_bits_uop_prs3_busy :
    fdiv_resp_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ppred_busy = fpu_resp_val ? fpu_resp_fflags_bits_uop_ppred_busy :
    fdiv_resp_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_stale_pdst = fpu_resp_val ? fpu_resp_fflags_bits_uop_stale_pdst :
    fdiv_resp_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_exception = fpu_resp_val ? fpu_resp_fflags_bits_uop_exception :
    fdiv_resp_fflags_bits_uop_exception; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_exc_cause = fpu_resp_val ? fpu_resp_fflags_bits_uop_exc_cause :
    fdiv_resp_fflags_bits_uop_exc_cause; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_bypassable = fpu_resp_val ? fpu_resp_fflags_bits_uop_bypassable :
    fdiv_resp_fflags_bits_uop_bypassable; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_mem_cmd = fpu_resp_val ? fpu_resp_fflags_bits_uop_mem_cmd :
    fdiv_resp_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_mem_size = fpu_resp_val ? fpu_resp_fflags_bits_uop_mem_size :
    fdiv_resp_fflags_bits_uop_mem_size; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_mem_signed = fpu_resp_val ? fpu_resp_fflags_bits_uop_mem_signed :
    fdiv_resp_fflags_bits_uop_mem_signed; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_is_fence = fpu_resp_val ? fpu_resp_fflags_bits_uop_is_fence :
    fdiv_resp_fflags_bits_uop_is_fence; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_is_fencei = fpu_resp_val ? fpu_resp_fflags_bits_uop_is_fencei :
    fdiv_resp_fflags_bits_uop_is_fencei; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_is_amo = fpu_resp_val ? fpu_resp_fflags_bits_uop_is_amo :
    fdiv_resp_fflags_bits_uop_is_amo; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_uses_ldq = fpu_resp_val ? fpu_resp_fflags_bits_uop_uses_ldq :
    fdiv_resp_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_uses_stq = fpu_resp_val ? fpu_resp_fflags_bits_uop_uses_stq :
    fdiv_resp_fflags_bits_uop_uses_stq; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_is_sys_pc2epc = fpu_resp_val ? fpu_resp_fflags_bits_uop_is_sys_pc2epc :
    fdiv_resp_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_is_unique = fpu_resp_val ? fpu_resp_fflags_bits_uop_is_unique :
    fdiv_resp_fflags_bits_uop_is_unique; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_flush_on_commit = fpu_resp_val ? fpu_resp_fflags_bits_uop_flush_on_commit :
    fdiv_resp_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ldst_is_rs1 = fpu_resp_val ? fpu_resp_fflags_bits_uop_ldst_is_rs1 :
    fdiv_resp_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ldst = fpu_resp_val ? fpu_resp_fflags_bits_uop_ldst :
    fdiv_resp_fflags_bits_uop_ldst; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_lrs1 = fpu_resp_val ? fpu_resp_fflags_bits_uop_lrs1 :
    fdiv_resp_fflags_bits_uop_lrs1; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_lrs2 = fpu_resp_val ? fpu_resp_fflags_bits_uop_lrs2 :
    fdiv_resp_fflags_bits_uop_lrs2; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_lrs3 = fpu_resp_val ? fpu_resp_fflags_bits_uop_lrs3 :
    fdiv_resp_fflags_bits_uop_lrs3; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_ldst_val = fpu_resp_val ? fpu_resp_fflags_bits_uop_ldst_val :
    fdiv_resp_fflags_bits_uop_ldst_val; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_dst_rtype = fpu_resp_val ? fpu_resp_fflags_bits_uop_dst_rtype :
    fdiv_resp_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_lrs1_rtype = fpu_resp_val ? fpu_resp_fflags_bits_uop_lrs1_rtype :
    fdiv_resp_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_lrs2_rtype = fpu_resp_val ? fpu_resp_fflags_bits_uop_lrs2_rtype :
    fdiv_resp_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_frs3_en = fpu_resp_val ? fpu_resp_fflags_bits_uop_frs3_en :
    fdiv_resp_fflags_bits_uop_frs3_en; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_fp_val = fpu_resp_val ? fpu_resp_fflags_bits_uop_fp_val :
    fdiv_resp_fflags_bits_uop_fp_val; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_fp_single = fpu_resp_val ? fpu_resp_fflags_bits_uop_fp_single :
    fdiv_resp_fflags_bits_uop_fp_single; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_xcpt_pf_if = fpu_resp_val ? fpu_resp_fflags_bits_uop_xcpt_pf_if :
    fdiv_resp_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_xcpt_ae_if = fpu_resp_val ? fpu_resp_fflags_bits_uop_xcpt_ae_if :
    fdiv_resp_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_xcpt_ma_if = fpu_resp_val ? fpu_resp_fflags_bits_uop_xcpt_ma_if :
    fdiv_resp_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_bp_debug_if = fpu_resp_val ? fpu_resp_fflags_bits_uop_bp_debug_if :
    fdiv_resp_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_bp_xcpt_if = fpu_resp_val ? fpu_resp_fflags_bits_uop_bp_xcpt_if :
    fdiv_resp_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_debug_fsrc = fpu_resp_val ? fpu_resp_fflags_bits_uop_debug_fsrc :
    fdiv_resp_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_uop_debug_tsrc = fpu_resp_val ? fpu_resp_fflags_bits_uop_debug_tsrc :
    fdiv_resp_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 521:30]
  assign io_fresp_bits_fflags_bits_flags = fpu_resp_val ? fpu_resp_fflags_bits_flags : fdiv_resp_fflags_bits_flags; // @[execution-unit.scala 521:30]
  assign io_ll_iresp_valid = Arbiter_io_out_valid; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_uopc = Arbiter_io_out_bits_uop_uopc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_inst = Arbiter_io_out_bits_uop_inst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_debug_inst = Arbiter_io_out_bits_uop_debug_inst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_is_rvc = Arbiter_io_out_bits_uop_is_rvc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_debug_pc = Arbiter_io_out_bits_uop_debug_pc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_iq_type = Arbiter_io_out_bits_uop_iq_type; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_fu_code = Arbiter_io_out_bits_uop_fu_code; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ctrl_br_type = Arbiter_io_out_bits_uop_ctrl_br_type; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ctrl_op1_sel = Arbiter_io_out_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ctrl_op2_sel = Arbiter_io_out_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ctrl_imm_sel = Arbiter_io_out_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ctrl_op_fcn = Arbiter_io_out_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ctrl_fcn_dw = Arbiter_io_out_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ctrl_csr_cmd = Arbiter_io_out_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ctrl_is_load = Arbiter_io_out_bits_uop_ctrl_is_load; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ctrl_is_sta = Arbiter_io_out_bits_uop_ctrl_is_sta; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ctrl_is_std = Arbiter_io_out_bits_uop_ctrl_is_std; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_iw_state = Arbiter_io_out_bits_uop_iw_state; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_iw_p1_poisoned = Arbiter_io_out_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_iw_p2_poisoned = Arbiter_io_out_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_is_br = Arbiter_io_out_bits_uop_is_br; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_is_jalr = Arbiter_io_out_bits_uop_is_jalr; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_is_jal = Arbiter_io_out_bits_uop_is_jal; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_is_sfb = Arbiter_io_out_bits_uop_is_sfb; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_br_mask = Arbiter_io_out_bits_uop_br_mask; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_br_tag = Arbiter_io_out_bits_uop_br_tag; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ftq_idx = Arbiter_io_out_bits_uop_ftq_idx; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_edge_inst = Arbiter_io_out_bits_uop_edge_inst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_pc_lob = Arbiter_io_out_bits_uop_pc_lob; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_taken = Arbiter_io_out_bits_uop_taken; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_imm_packed = Arbiter_io_out_bits_uop_imm_packed; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_csr_addr = Arbiter_io_out_bits_uop_csr_addr; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_rob_idx = Arbiter_io_out_bits_uop_rob_idx; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ldq_idx = Arbiter_io_out_bits_uop_ldq_idx; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_stq_idx = Arbiter_io_out_bits_uop_stq_idx; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_rxq_idx = Arbiter_io_out_bits_uop_rxq_idx; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_pdst = Arbiter_io_out_bits_uop_pdst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_prs1 = Arbiter_io_out_bits_uop_prs1; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_prs2 = Arbiter_io_out_bits_uop_prs2; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_prs3 = Arbiter_io_out_bits_uop_prs3; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ppred = Arbiter_io_out_bits_uop_ppred; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_prs1_busy = Arbiter_io_out_bits_uop_prs1_busy; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_prs2_busy = Arbiter_io_out_bits_uop_prs2_busy; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_prs3_busy = Arbiter_io_out_bits_uop_prs3_busy; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ppred_busy = Arbiter_io_out_bits_uop_ppred_busy; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_stale_pdst = Arbiter_io_out_bits_uop_stale_pdst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_exception = Arbiter_io_out_bits_uop_exception; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_exc_cause = Arbiter_io_out_bits_uop_exc_cause; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_bypassable = Arbiter_io_out_bits_uop_bypassable; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_mem_cmd = Arbiter_io_out_bits_uop_mem_cmd; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_mem_size = Arbiter_io_out_bits_uop_mem_size; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_mem_signed = Arbiter_io_out_bits_uop_mem_signed; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_is_fence = Arbiter_io_out_bits_uop_is_fence; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_is_fencei = Arbiter_io_out_bits_uop_is_fencei; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_is_amo = Arbiter_io_out_bits_uop_is_amo; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_uses_ldq = Arbiter_io_out_bits_uop_uses_ldq; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_uses_stq = Arbiter_io_out_bits_uop_uses_stq; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_is_sys_pc2epc = Arbiter_io_out_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_is_unique = Arbiter_io_out_bits_uop_is_unique; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_flush_on_commit = Arbiter_io_out_bits_uop_flush_on_commit; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ldst_is_rs1 = Arbiter_io_out_bits_uop_ldst_is_rs1; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ldst = Arbiter_io_out_bits_uop_ldst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_lrs1 = Arbiter_io_out_bits_uop_lrs1; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_lrs2 = Arbiter_io_out_bits_uop_lrs2; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_lrs3 = Arbiter_io_out_bits_uop_lrs3; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_ldst_val = Arbiter_io_out_bits_uop_ldst_val; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_dst_rtype = Arbiter_io_out_bits_uop_dst_rtype; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_lrs1_rtype = Arbiter_io_out_bits_uop_lrs1_rtype; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_lrs2_rtype = Arbiter_io_out_bits_uop_lrs2_rtype; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_frs3_en = Arbiter_io_out_bits_uop_frs3_en; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_fp_val = Arbiter_io_out_bits_uop_fp_val; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_fp_single = Arbiter_io_out_bits_uop_fp_single; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_xcpt_pf_if = Arbiter_io_out_bits_uop_xcpt_pf_if; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_xcpt_ae_if = Arbiter_io_out_bits_uop_xcpt_ae_if; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_xcpt_ma_if = Arbiter_io_out_bits_uop_xcpt_ma_if; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_bp_debug_if = Arbiter_io_out_bits_uop_bp_debug_if; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_bp_xcpt_if = Arbiter_io_out_bits_uop_bp_xcpt_if; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_debug_fsrc = Arbiter_io_out_bits_uop_debug_fsrc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_uop_debug_tsrc = Arbiter_io_out_bits_uop_debug_tsrc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_data = Arbiter_io_out_bits_data; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_predicated = Arbiter_io_out_bits_predicated; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_valid = Arbiter_io_out_bits_fflags_valid; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_uopc = Arbiter_io_out_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_inst = Arbiter_io_out_bits_fflags_bits_uop_inst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_debug_inst = Arbiter_io_out_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_is_rvc = Arbiter_io_out_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_debug_pc = Arbiter_io_out_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_iq_type = Arbiter_io_out_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_fu_code = Arbiter_io_out_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_br_type = Arbiter_io_out_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_op1_sel = Arbiter_io_out_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_op2_sel = Arbiter_io_out_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_imm_sel = Arbiter_io_out_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_op_fcn = Arbiter_io_out_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_fcn_dw = Arbiter_io_out_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_csr_cmd = Arbiter_io_out_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_is_load = Arbiter_io_out_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_is_sta = Arbiter_io_out_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ctrl_is_std = Arbiter_io_out_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_iw_state = Arbiter_io_out_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_iw_p1_poisoned = Arbiter_io_out_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_iw_p2_poisoned = Arbiter_io_out_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_is_br = Arbiter_io_out_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_is_jalr = Arbiter_io_out_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_is_jal = Arbiter_io_out_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_is_sfb = Arbiter_io_out_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_br_mask = Arbiter_io_out_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_br_tag = Arbiter_io_out_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ftq_idx = Arbiter_io_out_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_edge_inst = Arbiter_io_out_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_pc_lob = Arbiter_io_out_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_taken = Arbiter_io_out_bits_fflags_bits_uop_taken; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_imm_packed = Arbiter_io_out_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_csr_addr = Arbiter_io_out_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_rob_idx = Arbiter_io_out_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ldq_idx = Arbiter_io_out_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_stq_idx = Arbiter_io_out_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_rxq_idx = Arbiter_io_out_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_pdst = Arbiter_io_out_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_prs1 = Arbiter_io_out_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_prs2 = Arbiter_io_out_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_prs3 = Arbiter_io_out_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ppred = Arbiter_io_out_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_prs1_busy = Arbiter_io_out_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_prs2_busy = Arbiter_io_out_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_prs3_busy = Arbiter_io_out_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ppred_busy = Arbiter_io_out_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_stale_pdst = Arbiter_io_out_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_exception = Arbiter_io_out_bits_fflags_bits_uop_exception; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_exc_cause = Arbiter_io_out_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_bypassable = Arbiter_io_out_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_mem_cmd = Arbiter_io_out_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_mem_size = Arbiter_io_out_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_mem_signed = Arbiter_io_out_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_is_fence = Arbiter_io_out_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_is_fencei = Arbiter_io_out_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_is_amo = Arbiter_io_out_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_uses_ldq = Arbiter_io_out_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_uses_stq = Arbiter_io_out_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_is_sys_pc2epc = Arbiter_io_out_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_is_unique = Arbiter_io_out_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_flush_on_commit = Arbiter_io_out_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ldst_is_rs1 = Arbiter_io_out_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ldst = Arbiter_io_out_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_lrs1 = Arbiter_io_out_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_lrs2 = Arbiter_io_out_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_lrs3 = Arbiter_io_out_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_ldst_val = Arbiter_io_out_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_dst_rtype = Arbiter_io_out_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_lrs1_rtype = Arbiter_io_out_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_lrs2_rtype = Arbiter_io_out_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_frs3_en = Arbiter_io_out_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_fp_val = Arbiter_io_out_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_fp_single = Arbiter_io_out_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_xcpt_pf_if = Arbiter_io_out_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_xcpt_ae_if = Arbiter_io_out_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_xcpt_ma_if = Arbiter_io_out_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_bp_debug_if = Arbiter_io_out_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_bp_xcpt_if = Arbiter_io_out_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_debug_fsrc = Arbiter_io_out_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_uop_debug_tsrc = Arbiter_io_out_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 557:23]
  assign io_ll_iresp_bits_fflags_bits_flags = Arbiter_io_out_bits_fflags_bits_flags; // @[execution-unit.scala 557:23]
  assign fpu_clock = clock;
  assign fpu_reset = reset;
  assign fpu_io_req_valid = io_req_valid & _T_16; // @[execution-unit.scala 469:46]
  assign fpu_io_req_bits_uop_uopc = io_req_bits_uop_uopc; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_inst = io_req_bits_uop_inst; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_debug_inst = io_req_bits_uop_debug_inst; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_is_rvc = io_req_bits_uop_is_rvc; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_debug_pc = io_req_bits_uop_debug_pc; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_iq_type = io_req_bits_uop_iq_type; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_fu_code = io_req_bits_uop_fu_code; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_iw_state = io_req_bits_uop_iw_state; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_is_br = io_req_bits_uop_is_br; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_is_jalr = io_req_bits_uop_is_jalr; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_is_jal = io_req_bits_uop_is_jal; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_is_sfb = io_req_bits_uop_is_sfb; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_br_mask = io_req_bits_uop_br_mask; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_br_tag = io_req_bits_uop_br_tag; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_edge_inst = io_req_bits_uop_edge_inst; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_pc_lob = io_req_bits_uop_pc_lob; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_taken = io_req_bits_uop_taken; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_imm_packed = io_req_bits_uop_imm_packed; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_csr_addr = io_req_bits_uop_csr_addr; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_rob_idx = io_req_bits_uop_rob_idx; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_stq_idx = io_req_bits_uop_stq_idx; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_pdst = io_req_bits_uop_pdst; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_prs1 = io_req_bits_uop_prs1; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_prs2 = io_req_bits_uop_prs2; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_prs3 = io_req_bits_uop_prs3; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ppred = io_req_bits_uop_ppred; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_exception = io_req_bits_uop_exception; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_exc_cause = io_req_bits_uop_exc_cause; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_bypassable = io_req_bits_uop_bypassable; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_mem_size = io_req_bits_uop_mem_size; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_mem_signed = io_req_bits_uop_mem_signed; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_is_fence = io_req_bits_uop_is_fence; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_is_fencei = io_req_bits_uop_is_fencei; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_is_amo = io_req_bits_uop_is_amo; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_uses_stq = io_req_bits_uop_uses_stq; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_is_unique = io_req_bits_uop_is_unique; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ldst = io_req_bits_uop_ldst; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_lrs1 = io_req_bits_uop_lrs1; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_lrs2 = io_req_bits_uop_lrs2; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_lrs3 = io_req_bits_uop_lrs3; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_ldst_val = io_req_bits_uop_ldst_val; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_frs3_en = io_req_bits_uop_frs3_en; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_fp_val = io_req_bits_uop_fp_val; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_fp_single = io_req_bits_uop_fp_single; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 472:30]
  assign fpu_io_req_bits_rs1_data = io_req_bits_rs1_data; // @[execution-unit.scala 473:30]
  assign fpu_io_req_bits_rs2_data = io_req_bits_rs2_data; // @[execution-unit.scala 474:30]
  assign fpu_io_req_bits_rs3_data = io_req_bits_rs3_data; // @[execution-unit.scala 475:30]
  assign fpu_io_req_bits_pred_data = 1'h0; // @[execution-unit.scala 476:31]
  assign fpu_io_req_bits_kill = io_req_bits_kill; // @[execution-unit.scala 477:30]
  assign fpu_io_resp_ready = 1'h0;
  assign fpu_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[execution-unit.scala 479:30]
  assign fpu_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[execution-unit.scala 479:30]
  assign fpu_io_fcsr_rm = io_fcsr_rm; // @[execution-unit.scala 478:30]
  assign fdivsqrt_clock = clock;
  assign fdivsqrt_reset = reset;
  assign fdivsqrt_io_req_valid = io_req_valid & _T_24; // @[execution-unit.scala 494:51]
  assign fdivsqrt_io_req_bits_uop_uopc = io_req_bits_uop_uopc; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_inst = io_req_bits_uop_inst; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_debug_inst = io_req_bits_uop_debug_inst; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_is_rvc = io_req_bits_uop_is_rvc; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_debug_pc = io_req_bits_uop_debug_pc; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_iq_type = io_req_bits_uop_iq_type; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_fu_code = io_req_bits_uop_fu_code; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_iw_state = io_req_bits_uop_iw_state; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_is_br = io_req_bits_uop_is_br; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_is_jalr = io_req_bits_uop_is_jalr; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_is_jal = io_req_bits_uop_is_jal; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_is_sfb = io_req_bits_uop_is_sfb; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_br_mask = io_req_bits_uop_br_mask; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_br_tag = io_req_bits_uop_br_tag; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_edge_inst = io_req_bits_uop_edge_inst; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_pc_lob = io_req_bits_uop_pc_lob; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_taken = io_req_bits_uop_taken; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_imm_packed = io_req_bits_uop_imm_packed; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_csr_addr = io_req_bits_uop_csr_addr; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_rob_idx = io_req_bits_uop_rob_idx; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_stq_idx = io_req_bits_uop_stq_idx; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_pdst = io_req_bits_uop_pdst; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_prs1 = io_req_bits_uop_prs1; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_prs2 = io_req_bits_uop_prs2; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_prs3 = io_req_bits_uop_prs3; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ppred = io_req_bits_uop_ppred; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_exception = io_req_bits_uop_exception; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_exc_cause = io_req_bits_uop_exc_cause; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_bypassable = io_req_bits_uop_bypassable; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_mem_size = io_req_bits_uop_mem_size; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_mem_signed = io_req_bits_uop_mem_signed; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_is_fence = io_req_bits_uop_is_fence; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_is_fencei = io_req_bits_uop_is_fencei; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_is_amo = io_req_bits_uop_is_amo; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_uses_stq = io_req_bits_uop_uses_stq; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_is_unique = io_req_bits_uop_is_unique; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ldst = io_req_bits_uop_ldst; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_lrs1 = io_req_bits_uop_lrs1; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_lrs2 = io_req_bits_uop_lrs2; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_lrs3 = io_req_bits_uop_lrs3; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_ldst_val = io_req_bits_uop_ldst_val; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_frs3_en = io_req_bits_uop_frs3_en; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_fp_val = io_req_bits_uop_fp_val; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_fp_single = io_req_bits_uop_fp_single; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 495:35]
  assign fdivsqrt_io_req_bits_rs1_data = io_req_bits_rs1_data; // @[execution-unit.scala 496:35]
  assign fdivsqrt_io_req_bits_rs2_data = io_req_bits_rs2_data; // @[execution-unit.scala 497:35]
  assign fdivsqrt_io_req_bits_rs3_data = 65'h0;
  assign fdivsqrt_io_req_bits_pred_data = 1'h0; // @[execution-unit.scala 499:36]
  assign fdivsqrt_io_req_bits_kill = io_req_bits_kill; // @[execution-unit.scala 500:35]
  assign fdivsqrt_io_resp_ready = ~fpu_io_resp_valid; // @[execution-unit.scala 505:31]
  assign fdivsqrt_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[execution-unit.scala 502:35]
  assign fdivsqrt_io_fcsr_rm = io_fcsr_rm; // @[execution-unit.scala 501:35]
  assign BranchKillableQueue_clock = clock;
  assign BranchKillableQueue_reset = reset;
  assign BranchKillableQueue_io_enq_valid = _T_30 & _T_39; // @[execution-unit.scala 531:74]
  assign BranchKillableQueue_io_enq_bits_uop_uopc = fpu_io_resp_bits_uop_uopc; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_inst = fpu_io_resp_bits_uop_inst; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_debug_inst = fpu_io_resp_bits_uop_debug_inst; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_rvc = fpu_io_resp_bits_uop_is_rvc; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_debug_pc = fpu_io_resp_bits_uop_debug_pc; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_iq_type = fpu_io_resp_bits_uop_iq_type; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_fu_code = fpu_io_resp_bits_uop_fu_code; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_br_type = fpu_io_resp_bits_uop_ctrl_br_type; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_op1_sel = fpu_io_resp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_op2_sel = fpu_io_resp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_imm_sel = fpu_io_resp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_op_fcn = fpu_io_resp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_fcn_dw = fpu_io_resp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_csr_cmd = fpu_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_is_load = fpu_io_resp_bits_uop_ctrl_is_load; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_is_sta = fpu_io_resp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ctrl_is_std = fpu_io_resp_bits_uop_ctrl_is_std; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_iw_state = fpu_io_resp_bits_uop_iw_state; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_iw_p1_poisoned = fpu_io_resp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_iw_p2_poisoned = fpu_io_resp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_br = fpu_io_resp_bits_uop_is_br; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_jalr = fpu_io_resp_bits_uop_is_jalr; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_jal = fpu_io_resp_bits_uop_is_jal; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_sfb = fpu_io_resp_bits_uop_is_sfb; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_br_mask = fpu_io_resp_bits_uop_br_mask; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_br_tag = fpu_io_resp_bits_uop_br_tag; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ftq_idx = fpu_io_resp_bits_uop_ftq_idx; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_edge_inst = fpu_io_resp_bits_uop_edge_inst; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_pc_lob = fpu_io_resp_bits_uop_pc_lob; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_taken = fpu_io_resp_bits_uop_taken; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_imm_packed = fpu_io_resp_bits_uop_imm_packed; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_csr_addr = fpu_io_resp_bits_uop_csr_addr; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_rob_idx = fpu_io_resp_bits_uop_rob_idx; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ldq_idx = fpu_io_resp_bits_uop_ldq_idx; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_stq_idx = fpu_io_resp_bits_uop_stq_idx; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_rxq_idx = fpu_io_resp_bits_uop_rxq_idx; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_pdst = fpu_io_resp_bits_uop_pdst; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs1 = fpu_io_resp_bits_uop_prs1; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs2 = fpu_io_resp_bits_uop_prs2; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs3 = fpu_io_resp_bits_uop_prs3; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ppred = fpu_io_resp_bits_uop_ppred; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs1_busy = fpu_io_resp_bits_uop_prs1_busy; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs2_busy = fpu_io_resp_bits_uop_prs2_busy; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_prs3_busy = fpu_io_resp_bits_uop_prs3_busy; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ppred_busy = fpu_io_resp_bits_uop_ppred_busy; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_stale_pdst = fpu_io_resp_bits_uop_stale_pdst; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_exception = fpu_io_resp_bits_uop_exception; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_exc_cause = fpu_io_resp_bits_uop_exc_cause; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_bypassable = fpu_io_resp_bits_uop_bypassable; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_mem_cmd = fpu_io_resp_bits_uop_mem_cmd; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_mem_size = fpu_io_resp_bits_uop_mem_size; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_mem_signed = fpu_io_resp_bits_uop_mem_signed; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_fence = fpu_io_resp_bits_uop_is_fence; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_fencei = fpu_io_resp_bits_uop_is_fencei; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_amo = fpu_io_resp_bits_uop_is_amo; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_uses_ldq = fpu_io_resp_bits_uop_uses_ldq; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_uses_stq = fpu_io_resp_bits_uop_uses_stq; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_sys_pc2epc = fpu_io_resp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_is_unique = fpu_io_resp_bits_uop_is_unique; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_flush_on_commit = fpu_io_resp_bits_uop_flush_on_commit; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ldst_is_rs1 = fpu_io_resp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ldst = fpu_io_resp_bits_uop_ldst; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_lrs1 = fpu_io_resp_bits_uop_lrs1; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_lrs2 = fpu_io_resp_bits_uop_lrs2; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_lrs3 = fpu_io_resp_bits_uop_lrs3; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_ldst_val = fpu_io_resp_bits_uop_ldst_val; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_dst_rtype = fpu_io_resp_bits_uop_dst_rtype; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_lrs1_rtype = fpu_io_resp_bits_uop_lrs1_rtype; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_lrs2_rtype = fpu_io_resp_bits_uop_lrs2_rtype; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_frs3_en = fpu_io_resp_bits_uop_frs3_en; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_fp_val = fpu_io_resp_bits_uop_fp_val; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_fp_single = fpu_io_resp_bits_uop_fp_single; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_xcpt_pf_if = fpu_io_resp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_xcpt_ae_if = fpu_io_resp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_xcpt_ma_if = fpu_io_resp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_bp_debug_if = fpu_io_resp_bits_uop_bp_debug_if; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_bp_xcpt_if = fpu_io_resp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_debug_fsrc = fpu_io_resp_bits_uop_debug_fsrc; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_uop_debug_tsrc = fpu_io_resp_bits_uop_debug_tsrc; // @[execution-unit.scala 533:30]
  assign BranchKillableQueue_io_enq_bits_data = fpu_io_resp_bits_data; // @[execution-unit.scala 534:30]
  assign BranchKillableQueue_io_enq_bits_predicated = fpu_io_resp_bits_predicated; // @[execution-unit.scala 535:34]
  assign BranchKillableQueue_io_enq_bits_fflags_valid = fpu_io_resp_bits_fflags_valid; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_uopc = fpu_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_inst = fpu_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_inst = fpu_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_rvc = fpu_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_pc = fpu_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_iq_type = fpu_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_fu_code = fpu_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_br_type = fpu_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op1_sel = fpu_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op2_sel = fpu_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_imm_sel = fpu_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_op_fcn = fpu_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_fcn_dw = fpu_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_csr_cmd = fpu_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_load = fpu_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_sta = fpu_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ctrl_is_std = fpu_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_state = fpu_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p1_poisoned =
    fpu_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_iw_p2_poisoned =
    fpu_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_br = fpu_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jalr = fpu_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_jal = fpu_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sfb = fpu_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_mask = fpu_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_br_tag = fpu_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ftq_idx = fpu_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_edge_inst = fpu_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_pc_lob = fpu_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_taken = fpu_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_imm_packed = fpu_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_csr_addr = fpu_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_rob_idx = fpu_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldq_idx = fpu_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_stq_idx = fpu_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_rxq_idx = fpu_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_pdst = fpu_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1 = fpu_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2 = fpu_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3 = fpu_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred = fpu_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs1_busy = fpu_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs2_busy = fpu_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_prs3_busy = fpu_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ppred_busy = fpu_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_stale_pdst = fpu_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_exception = fpu_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_exc_cause = fpu_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_bypassable = fpu_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_cmd = fpu_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_size = fpu_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_mem_signed = fpu_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fence = fpu_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_fencei = fpu_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_amo = fpu_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_ldq = fpu_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_uses_stq = fpu_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_sys_pc2epc = fpu_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_is_unique = fpu_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_flush_on_commit =
    fpu_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_is_rs1 = fpu_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst = fpu_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1 = fpu_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2 = fpu_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs3 = fpu_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_ldst_val = fpu_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_dst_rtype = fpu_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs1_rtype = fpu_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_lrs2_rtype = fpu_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_frs3_en = fpu_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_val = fpu_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_fp_single = fpu_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_pf_if = fpu_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ae_if = fpu_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_xcpt_ma_if = fpu_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_debug_if = fpu_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_bp_xcpt_if = fpu_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_fsrc = fpu_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_uop_debug_tsrc = fpu_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_enq_bits_fflags_bits_flags = fpu_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 536:30]
  assign BranchKillableQueue_io_deq_ready = Arbiter_io_in_0_ready; // @[execution-unit.scala 555:23]
  assign BranchKillableQueue_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[execution-unit.scala 537:32]
  assign BranchKillableQueue_io_flush = io_req_bits_kill; // @[execution-unit.scala 538:30]
  assign BranchKillableQueue_1_clock = clock;
  assign BranchKillableQueue_1_reset = reset;
  assign BranchKillableQueue_1_io_enq_valid = io_req_valid & io_req_bits_uop_uopc == 7'h2 & ~_T_47; // @[execution-unit.scala 544:81]
  assign BranchKillableQueue_1_io_enq_bits_uop_uopc = io_req_bits_uop_uopc; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_inst = io_req_bits_uop_inst; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_debug_inst = io_req_bits_uop_debug_inst; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_is_rvc = io_req_bits_uop_is_rvc; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_debug_pc = io_req_bits_uop_debug_pc; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_iq_type = io_req_bits_uop_iq_type; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_fu_code = io_req_bits_uop_fu_code; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_iw_state = io_req_bits_uop_iw_state; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_is_br = io_req_bits_uop_is_br; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_is_jalr = io_req_bits_uop_is_jalr; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_is_jal = io_req_bits_uop_is_jal; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_is_sfb = io_req_bits_uop_is_sfb; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_br_mask = io_req_bits_uop_br_mask; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_br_tag = io_req_bits_uop_br_tag; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_edge_inst = io_req_bits_uop_edge_inst; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_pc_lob = io_req_bits_uop_pc_lob; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_taken = io_req_bits_uop_taken; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_imm_packed = io_req_bits_uop_imm_packed; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_csr_addr = io_req_bits_uop_csr_addr; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_rob_idx = io_req_bits_uop_rob_idx; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_stq_idx = io_req_bits_uop_stq_idx; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_pdst = io_req_bits_uop_pdst; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_prs1 = io_req_bits_uop_prs1; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_prs2 = io_req_bits_uop_prs2; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_prs3 = io_req_bits_uop_prs3; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ppred = io_req_bits_uop_ppred; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_exception = io_req_bits_uop_exception; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_exc_cause = io_req_bits_uop_exc_cause; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_bypassable = io_req_bits_uop_bypassable; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_mem_size = io_req_bits_uop_mem_size; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_mem_signed = io_req_bits_uop_mem_signed; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_is_fence = io_req_bits_uop_is_fence; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_is_fencei = io_req_bits_uop_is_fencei; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_is_amo = io_req_bits_uop_is_amo; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_uses_stq = io_req_bits_uop_uses_stq; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_is_unique = io_req_bits_uop_is_unique; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ldst = io_req_bits_uop_ldst; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_lrs1 = io_req_bits_uop_lrs1; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_lrs2 = io_req_bits_uop_lrs2; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_lrs3 = io_req_bits_uop_lrs3; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_ldst_val = io_req_bits_uop_ldst_val; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_frs3_en = io_req_bits_uop_frs3_en; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_fp_val = io_req_bits_uop_fp_val; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_fp_single = io_req_bits_uop_fp_single; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 545:30]
  assign BranchKillableQueue_1_io_enq_bits_data = {{1'd0}, _T_53}; // @[Cat.scala 30:58]
  assign BranchKillableQueue_1_io_enq_bits_predicated = 1'h0; // @[execution-unit.scala 547:35]
  assign BranchKillableQueue_1_io_enq_bits_fflags_valid = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_uopc = 7'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_inst = 32'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_inst = 32'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_rvc = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_pc = 40'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iq_type = 3'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_fu_code = 10'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_br_type = 4'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_op1_sel = 2'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_op2_sel = 3'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_imm_sel = 3'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_op_fcn = 4'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_fcn_dw = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_csr_cmd = 3'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_is_load = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_is_sta = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ctrl_is_std = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iw_state = 2'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iw_p1_poisoned = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_iw_p2_poisoned = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_br = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_jalr = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_jal = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_sfb = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_br_mask = 12'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_br_tag = 4'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ftq_idx = 5'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_edge_inst = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_pc_lob = 6'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_taken = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_imm_packed = 20'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_csr_addr = 12'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_rob_idx = 6'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldq_idx = 4'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_stq_idx = 4'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_rxq_idx = 2'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_pdst = 6'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs1 = 6'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs2 = 6'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs3 = 6'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ppred = 5'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs1_busy = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs2_busy = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_prs3_busy = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ppred_busy = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_stale_pdst = 6'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_exception = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_exc_cause = 64'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_bypassable = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_mem_cmd = 5'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_mem_size = 2'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_mem_signed = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_fence = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_fencei = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_amo = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_uses_ldq = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_uses_stq = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_sys_pc2epc = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_is_unique = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_flush_on_commit = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldst_is_rs1 = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldst = 6'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs1 = 6'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs2 = 6'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs3 = 6'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_ldst_val = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_dst_rtype = 2'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs1_rtype = 2'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_lrs2_rtype = 2'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_frs3_en = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_fp_val = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_fp_single = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_xcpt_pf_if = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_xcpt_ae_if = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_xcpt_ma_if = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_bp_debug_if = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_bp_xcpt_if = 1'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_fsrc = 2'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_uop_debug_tsrc = 2'h0;
  assign BranchKillableQueue_1_io_enq_bits_fflags_bits_flags = 5'h0;
  assign BranchKillableQueue_1_io_deq_ready = Arbiter_io_in_1_ready; // @[execution-unit.scala 556:23]
  assign BranchKillableQueue_1_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[execution-unit.scala 549:32]
  assign BranchKillableQueue_1_io_flush = io_req_bits_kill; // @[execution-unit.scala 550:30]
  assign Arbiter_clock = clock;
  assign Arbiter_reset = reset;
  assign Arbiter_io_in_0_valid = BranchKillableQueue_io_deq_valid; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_uopc = BranchKillableQueue_io_deq_bits_uop_uopc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_inst = BranchKillableQueue_io_deq_bits_uop_inst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_debug_inst = BranchKillableQueue_io_deq_bits_uop_debug_inst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_is_rvc = BranchKillableQueue_io_deq_bits_uop_is_rvc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_debug_pc = BranchKillableQueue_io_deq_bits_uop_debug_pc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_iq_type = BranchKillableQueue_io_deq_bits_uop_iq_type; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_fu_code = BranchKillableQueue_io_deq_bits_uop_fu_code; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ctrl_br_type = BranchKillableQueue_io_deq_bits_uop_ctrl_br_type; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ctrl_op1_sel = BranchKillableQueue_io_deq_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ctrl_op2_sel = BranchKillableQueue_io_deq_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ctrl_imm_sel = BranchKillableQueue_io_deq_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ctrl_op_fcn = BranchKillableQueue_io_deq_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ctrl_fcn_dw = BranchKillableQueue_io_deq_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ctrl_csr_cmd = BranchKillableQueue_io_deq_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ctrl_is_load = BranchKillableQueue_io_deq_bits_uop_ctrl_is_load; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ctrl_is_sta = BranchKillableQueue_io_deq_bits_uop_ctrl_is_sta; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ctrl_is_std = BranchKillableQueue_io_deq_bits_uop_ctrl_is_std; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_iw_state = BranchKillableQueue_io_deq_bits_uop_iw_state; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_iw_p1_poisoned = BranchKillableQueue_io_deq_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_iw_p2_poisoned = BranchKillableQueue_io_deq_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_is_br = BranchKillableQueue_io_deq_bits_uop_is_br; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_is_jalr = BranchKillableQueue_io_deq_bits_uop_is_jalr; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_is_jal = BranchKillableQueue_io_deq_bits_uop_is_jal; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_is_sfb = BranchKillableQueue_io_deq_bits_uop_is_sfb; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_br_mask = BranchKillableQueue_io_deq_bits_uop_br_mask; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_br_tag = BranchKillableQueue_io_deq_bits_uop_br_tag; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ftq_idx = BranchKillableQueue_io_deq_bits_uop_ftq_idx; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_edge_inst = BranchKillableQueue_io_deq_bits_uop_edge_inst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_pc_lob = BranchKillableQueue_io_deq_bits_uop_pc_lob; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_taken = BranchKillableQueue_io_deq_bits_uop_taken; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_imm_packed = BranchKillableQueue_io_deq_bits_uop_imm_packed; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_csr_addr = BranchKillableQueue_io_deq_bits_uop_csr_addr; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_rob_idx = BranchKillableQueue_io_deq_bits_uop_rob_idx; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ldq_idx = BranchKillableQueue_io_deq_bits_uop_ldq_idx; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_stq_idx = BranchKillableQueue_io_deq_bits_uop_stq_idx; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_rxq_idx = BranchKillableQueue_io_deq_bits_uop_rxq_idx; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_pdst = BranchKillableQueue_io_deq_bits_uop_pdst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_prs1 = BranchKillableQueue_io_deq_bits_uop_prs1; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_prs2 = BranchKillableQueue_io_deq_bits_uop_prs2; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_prs3 = BranchKillableQueue_io_deq_bits_uop_prs3; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ppred = BranchKillableQueue_io_deq_bits_uop_ppred; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_prs1_busy = BranchKillableQueue_io_deq_bits_uop_prs1_busy; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_prs2_busy = BranchKillableQueue_io_deq_bits_uop_prs2_busy; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_prs3_busy = BranchKillableQueue_io_deq_bits_uop_prs3_busy; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ppred_busy = BranchKillableQueue_io_deq_bits_uop_ppred_busy; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_stale_pdst = BranchKillableQueue_io_deq_bits_uop_stale_pdst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_exception = BranchKillableQueue_io_deq_bits_uop_exception; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_exc_cause = BranchKillableQueue_io_deq_bits_uop_exc_cause; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_bypassable = BranchKillableQueue_io_deq_bits_uop_bypassable; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_mem_cmd = BranchKillableQueue_io_deq_bits_uop_mem_cmd; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_mem_size = BranchKillableQueue_io_deq_bits_uop_mem_size; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_mem_signed = BranchKillableQueue_io_deq_bits_uop_mem_signed; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_is_fence = BranchKillableQueue_io_deq_bits_uop_is_fence; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_is_fencei = BranchKillableQueue_io_deq_bits_uop_is_fencei; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_is_amo = BranchKillableQueue_io_deq_bits_uop_is_amo; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_uses_ldq = BranchKillableQueue_io_deq_bits_uop_uses_ldq; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_uses_stq = BranchKillableQueue_io_deq_bits_uop_uses_stq; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_is_sys_pc2epc = BranchKillableQueue_io_deq_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_is_unique = BranchKillableQueue_io_deq_bits_uop_is_unique; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_flush_on_commit = BranchKillableQueue_io_deq_bits_uop_flush_on_commit; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ldst_is_rs1 = BranchKillableQueue_io_deq_bits_uop_ldst_is_rs1; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ldst = BranchKillableQueue_io_deq_bits_uop_ldst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_lrs1 = BranchKillableQueue_io_deq_bits_uop_lrs1; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_lrs2 = BranchKillableQueue_io_deq_bits_uop_lrs2; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_lrs3 = BranchKillableQueue_io_deq_bits_uop_lrs3; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_ldst_val = BranchKillableQueue_io_deq_bits_uop_ldst_val; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_dst_rtype = BranchKillableQueue_io_deq_bits_uop_dst_rtype; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_lrs1_rtype = BranchKillableQueue_io_deq_bits_uop_lrs1_rtype; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_lrs2_rtype = BranchKillableQueue_io_deq_bits_uop_lrs2_rtype; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_frs3_en = BranchKillableQueue_io_deq_bits_uop_frs3_en; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_fp_val = BranchKillableQueue_io_deq_bits_uop_fp_val; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_fp_single = BranchKillableQueue_io_deq_bits_uop_fp_single; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_xcpt_pf_if = BranchKillableQueue_io_deq_bits_uop_xcpt_pf_if; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_xcpt_ae_if = BranchKillableQueue_io_deq_bits_uop_xcpt_ae_if; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_xcpt_ma_if = BranchKillableQueue_io_deq_bits_uop_xcpt_ma_if; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_bp_debug_if = BranchKillableQueue_io_deq_bits_uop_bp_debug_if; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_bp_xcpt_if = BranchKillableQueue_io_deq_bits_uop_bp_xcpt_if; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_debug_fsrc = BranchKillableQueue_io_deq_bits_uop_debug_fsrc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_uop_debug_tsrc = BranchKillableQueue_io_deq_bits_uop_debug_tsrc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_data = BranchKillableQueue_io_deq_bits_data; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_predicated = BranchKillableQueue_io_deq_bits_predicated; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_valid = BranchKillableQueue_io_deq_bits_fflags_valid; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_uopc = BranchKillableQueue_io_deq_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_inst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_inst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_debug_inst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_is_rvc = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_debug_pc = BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_iq_type = BranchKillableQueue_io_deq_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_fu_code = BranchKillableQueue_io_deq_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_br_type =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_op1_sel =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_op2_sel =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_imm_sel =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_op_fcn = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_fcn_dw = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_csr_cmd =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_is_load =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_is_sta = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ctrl_is_std = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_iw_state = BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_iw_p1_poisoned =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_iw_p2_poisoned =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_is_br = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_is_jalr = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_is_jal = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_is_sfb = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_br_mask = BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_br_tag = BranchKillableQueue_io_deq_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ftq_idx = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_edge_inst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_pc_lob = BranchKillableQueue_io_deq_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_taken = BranchKillableQueue_io_deq_bits_fflags_bits_uop_taken; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_imm_packed = BranchKillableQueue_io_deq_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_csr_addr = BranchKillableQueue_io_deq_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_rob_idx = BranchKillableQueue_io_deq_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ldq_idx = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_stq_idx = BranchKillableQueue_io_deq_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_rxq_idx = BranchKillableQueue_io_deq_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_pdst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_prs1 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_prs2 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_prs3 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ppred = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_prs1_busy = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_prs2_busy = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_prs3_busy = BranchKillableQueue_io_deq_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ppred_busy = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_stale_pdst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_exception = BranchKillableQueue_io_deq_bits_fflags_bits_uop_exception; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_exc_cause = BranchKillableQueue_io_deq_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_bypassable = BranchKillableQueue_io_deq_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_mem_cmd = BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_mem_size = BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_mem_signed = BranchKillableQueue_io_deq_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_is_fence = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_is_fencei = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_is_amo = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_uses_ldq = BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_uses_stq = BranchKillableQueue_io_deq_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_is_sys_pc2epc =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_is_unique = BranchKillableQueue_io_deq_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_flush_on_commit =
    BranchKillableQueue_io_deq_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ldst_is_rs1 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ldst = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_lrs1 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_lrs2 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_lrs3 = BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_ldst_val = BranchKillableQueue_io_deq_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_dst_rtype = BranchKillableQueue_io_deq_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_lrs1_rtype = BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_lrs2_rtype = BranchKillableQueue_io_deq_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_frs3_en = BranchKillableQueue_io_deq_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_fp_val = BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_fp_single = BranchKillableQueue_io_deq_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_xcpt_pf_if = BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_xcpt_ae_if = BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_xcpt_ma_if = BranchKillableQueue_io_deq_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_bp_debug_if = BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_bp_xcpt_if = BranchKillableQueue_io_deq_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_debug_fsrc = BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_uop_debug_tsrc = BranchKillableQueue_io_deq_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_0_bits_fflags_bits_flags = BranchKillableQueue_io_deq_bits_fflags_bits_flags; // @[execution-unit.scala 555:23]
  assign Arbiter_io_in_1_valid = BranchKillableQueue_1_io_deq_valid; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_uopc = BranchKillableQueue_1_io_deq_bits_uop_uopc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_inst = BranchKillableQueue_1_io_deq_bits_uop_inst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_debug_inst = BranchKillableQueue_1_io_deq_bits_uop_debug_inst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_is_rvc = BranchKillableQueue_1_io_deq_bits_uop_is_rvc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_debug_pc = BranchKillableQueue_1_io_deq_bits_uop_debug_pc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_iq_type = BranchKillableQueue_1_io_deq_bits_uop_iq_type; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_fu_code = BranchKillableQueue_1_io_deq_bits_uop_fu_code; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ctrl_br_type = BranchKillableQueue_1_io_deq_bits_uop_ctrl_br_type; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ctrl_op1_sel = BranchKillableQueue_1_io_deq_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ctrl_op2_sel = BranchKillableQueue_1_io_deq_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ctrl_imm_sel = BranchKillableQueue_1_io_deq_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ctrl_op_fcn = BranchKillableQueue_1_io_deq_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ctrl_fcn_dw = BranchKillableQueue_1_io_deq_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ctrl_csr_cmd = BranchKillableQueue_1_io_deq_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ctrl_is_load = BranchKillableQueue_1_io_deq_bits_uop_ctrl_is_load; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ctrl_is_sta = BranchKillableQueue_1_io_deq_bits_uop_ctrl_is_sta; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ctrl_is_std = BranchKillableQueue_1_io_deq_bits_uop_ctrl_is_std; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_iw_state = BranchKillableQueue_1_io_deq_bits_uop_iw_state; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_iw_p1_poisoned = BranchKillableQueue_1_io_deq_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_iw_p2_poisoned = BranchKillableQueue_1_io_deq_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_is_br = BranchKillableQueue_1_io_deq_bits_uop_is_br; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_is_jalr = BranchKillableQueue_1_io_deq_bits_uop_is_jalr; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_is_jal = BranchKillableQueue_1_io_deq_bits_uop_is_jal; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_is_sfb = BranchKillableQueue_1_io_deq_bits_uop_is_sfb; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_br_mask = BranchKillableQueue_1_io_deq_bits_uop_br_mask; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_br_tag = BranchKillableQueue_1_io_deq_bits_uop_br_tag; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ftq_idx = BranchKillableQueue_1_io_deq_bits_uop_ftq_idx; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_edge_inst = BranchKillableQueue_1_io_deq_bits_uop_edge_inst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_pc_lob = BranchKillableQueue_1_io_deq_bits_uop_pc_lob; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_taken = BranchKillableQueue_1_io_deq_bits_uop_taken; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_imm_packed = BranchKillableQueue_1_io_deq_bits_uop_imm_packed; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_csr_addr = BranchKillableQueue_1_io_deq_bits_uop_csr_addr; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_rob_idx = BranchKillableQueue_1_io_deq_bits_uop_rob_idx; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ldq_idx = BranchKillableQueue_1_io_deq_bits_uop_ldq_idx; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_stq_idx = BranchKillableQueue_1_io_deq_bits_uop_stq_idx; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_rxq_idx = BranchKillableQueue_1_io_deq_bits_uop_rxq_idx; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_pdst = BranchKillableQueue_1_io_deq_bits_uop_pdst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_prs1 = BranchKillableQueue_1_io_deq_bits_uop_prs1; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_prs2 = BranchKillableQueue_1_io_deq_bits_uop_prs2; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_prs3 = BranchKillableQueue_1_io_deq_bits_uop_prs3; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ppred = BranchKillableQueue_1_io_deq_bits_uop_ppred; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_prs1_busy = BranchKillableQueue_1_io_deq_bits_uop_prs1_busy; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_prs2_busy = BranchKillableQueue_1_io_deq_bits_uop_prs2_busy; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_prs3_busy = BranchKillableQueue_1_io_deq_bits_uop_prs3_busy; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ppred_busy = BranchKillableQueue_1_io_deq_bits_uop_ppred_busy; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_stale_pdst = BranchKillableQueue_1_io_deq_bits_uop_stale_pdst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_exception = BranchKillableQueue_1_io_deq_bits_uop_exception; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_exc_cause = BranchKillableQueue_1_io_deq_bits_uop_exc_cause; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_bypassable = BranchKillableQueue_1_io_deq_bits_uop_bypassable; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_mem_cmd = BranchKillableQueue_1_io_deq_bits_uop_mem_cmd; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_mem_size = BranchKillableQueue_1_io_deq_bits_uop_mem_size; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_mem_signed = BranchKillableQueue_1_io_deq_bits_uop_mem_signed; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_is_fence = BranchKillableQueue_1_io_deq_bits_uop_is_fence; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_is_fencei = BranchKillableQueue_1_io_deq_bits_uop_is_fencei; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_is_amo = BranchKillableQueue_1_io_deq_bits_uop_is_amo; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_uses_ldq = BranchKillableQueue_1_io_deq_bits_uop_uses_ldq; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_uses_stq = BranchKillableQueue_1_io_deq_bits_uop_uses_stq; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_is_sys_pc2epc = BranchKillableQueue_1_io_deq_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_is_unique = BranchKillableQueue_1_io_deq_bits_uop_is_unique; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_flush_on_commit = BranchKillableQueue_1_io_deq_bits_uop_flush_on_commit; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ldst_is_rs1 = BranchKillableQueue_1_io_deq_bits_uop_ldst_is_rs1; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ldst = BranchKillableQueue_1_io_deq_bits_uop_ldst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_lrs1 = BranchKillableQueue_1_io_deq_bits_uop_lrs1; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_lrs2 = BranchKillableQueue_1_io_deq_bits_uop_lrs2; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_lrs3 = BranchKillableQueue_1_io_deq_bits_uop_lrs3; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_ldst_val = BranchKillableQueue_1_io_deq_bits_uop_ldst_val; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_dst_rtype = BranchKillableQueue_1_io_deq_bits_uop_dst_rtype; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_lrs1_rtype = BranchKillableQueue_1_io_deq_bits_uop_lrs1_rtype; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_lrs2_rtype = BranchKillableQueue_1_io_deq_bits_uop_lrs2_rtype; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_frs3_en = BranchKillableQueue_1_io_deq_bits_uop_frs3_en; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_fp_val = BranchKillableQueue_1_io_deq_bits_uop_fp_val; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_fp_single = BranchKillableQueue_1_io_deq_bits_uop_fp_single; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_xcpt_pf_if = BranchKillableQueue_1_io_deq_bits_uop_xcpt_pf_if; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_xcpt_ae_if = BranchKillableQueue_1_io_deq_bits_uop_xcpt_ae_if; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_xcpt_ma_if = BranchKillableQueue_1_io_deq_bits_uop_xcpt_ma_if; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_bp_debug_if = BranchKillableQueue_1_io_deq_bits_uop_bp_debug_if; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_bp_xcpt_if = BranchKillableQueue_1_io_deq_bits_uop_bp_xcpt_if; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_debug_fsrc = BranchKillableQueue_1_io_deq_bits_uop_debug_fsrc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_uop_debug_tsrc = BranchKillableQueue_1_io_deq_bits_uop_debug_tsrc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_data = BranchKillableQueue_1_io_deq_bits_data; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_predicated = BranchKillableQueue_1_io_deq_bits_predicated; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_valid = BranchKillableQueue_1_io_deq_bits_fflags_valid; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_uopc = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_inst = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_inst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_debug_inst = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_is_rvc = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_debug_pc = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_iq_type = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_fu_code = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_br_type =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_op1_sel =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_op2_sel =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_imm_sel =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_op_fcn =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_fcn_dw =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_csr_cmd =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_is_load =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_is_sta =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ctrl_is_std =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_iw_state = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_iw_p1_poisoned =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_iw_p2_poisoned =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_is_br = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_is_jalr = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_is_jal = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_is_sfb = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_br_mask = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_br_tag = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ftq_idx = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_edge_inst = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_pc_lob = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_taken = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_taken; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_imm_packed = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_csr_addr = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_rob_idx = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ldq_idx = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_stq_idx = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_rxq_idx = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_pdst = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_prs1 = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_prs2 = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_prs3 = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ppred = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_prs1_busy = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_prs2_busy = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_prs3_busy = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ppred_busy = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_stale_pdst = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_exception = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_exception; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_exc_cause = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_bypassable = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_mem_cmd = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_mem_size = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_mem_signed = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_is_fence = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_is_fencei = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_is_amo = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_uses_ldq = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_uses_stq = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_is_sys_pc2epc =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_is_unique = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_flush_on_commit =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ldst_is_rs1 =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ldst = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_lrs1 = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_lrs2 = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_lrs3 = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_ldst_val = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_dst_rtype = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_lrs1_rtype = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_lrs2_rtype = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_frs3_en = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_fp_val = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_fp_single = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_xcpt_pf_if = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_xcpt_ae_if = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_xcpt_ma_if = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_bp_debug_if =
    BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_bp_xcpt_if = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_debug_fsrc = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_uop_debug_tsrc = BranchKillableQueue_1_io_deq_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 556:23]
  assign Arbiter_io_in_1_bits_fflags_bits_flags = BranchKillableQueue_1_io_deq_bits_fflags_bits_flags; // @[execution-unit.scala 556:23]
  assign Arbiter_io_out_ready = io_ll_iresp_ready; // @[execution-unit.scala 557:23]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(io_fresp_ready | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at execution-unit.scala:153 assert(io.fresp.ready)\n"); // @[execution-unit.scala 153:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(io_fresp_ready | reset)) begin
          $fatal; // @[execution-unit.scala 153:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(BranchKillableQueue_io_enq_ready | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at execution-unit.scala:540 assert (queue.io.enq.ready) // If this backs up, we've miscalculated the size of the queue.\n"
            ); // @[execution-unit.scala 540:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(BranchKillableQueue_io_enq_ready | reset)) begin
          $fatal; // @[execution-unit.scala 540:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(BranchKillableQueue_1_io_enq_valid & ~BranchKillableQueue_1_io_enq_ready) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at execution-unit.scala:552 assert(!(fp_sdq.io.enq.valid && !fp_sdq.io.enq.ready))\n"
            ); // @[execution-unit.scala 552:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(BranchKillableQueue_1_io_enq_valid & ~BranchKillableQueue_1_io_enq_ready) | reset)) begin
          $fatal; // @[execution-unit.scala 552:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
