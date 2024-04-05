module ALUExeUnit_2(
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
  input         io_iresp_ready,
  output        io_iresp_valid,
  output [6:0]  io_iresp_bits_uop_uopc,
  output [31:0] io_iresp_bits_uop_inst,
  output [31:0] io_iresp_bits_uop_debug_inst,
  output        io_iresp_bits_uop_is_rvc,
  output [39:0] io_iresp_bits_uop_debug_pc,
  output [2:0]  io_iresp_bits_uop_iq_type,
  output [9:0]  io_iresp_bits_uop_fu_code,
  output [3:0]  io_iresp_bits_uop_ctrl_br_type,
  output [1:0]  io_iresp_bits_uop_ctrl_op1_sel,
  output [2:0]  io_iresp_bits_uop_ctrl_op2_sel,
  output [2:0]  io_iresp_bits_uop_ctrl_imm_sel,
  output [3:0]  io_iresp_bits_uop_ctrl_op_fcn,
  output        io_iresp_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_iresp_bits_uop_ctrl_csr_cmd,
  output        io_iresp_bits_uop_ctrl_is_load,
  output        io_iresp_bits_uop_ctrl_is_sta,
  output        io_iresp_bits_uop_ctrl_is_std,
  output [1:0]  io_iresp_bits_uop_iw_state,
  output        io_iresp_bits_uop_iw_p1_poisoned,
  output        io_iresp_bits_uop_iw_p2_poisoned,
  output        io_iresp_bits_uop_is_br,
  output        io_iresp_bits_uop_is_jalr,
  output        io_iresp_bits_uop_is_jal,
  output        io_iresp_bits_uop_is_sfb,
  output [11:0] io_iresp_bits_uop_br_mask,
  output [3:0]  io_iresp_bits_uop_br_tag,
  output [4:0]  io_iresp_bits_uop_ftq_idx,
  output        io_iresp_bits_uop_edge_inst,
  output [5:0]  io_iresp_bits_uop_pc_lob,
  output        io_iresp_bits_uop_taken,
  output [19:0] io_iresp_bits_uop_imm_packed,
  output [11:0] io_iresp_bits_uop_csr_addr,
  output [5:0]  io_iresp_bits_uop_rob_idx,
  output [3:0]  io_iresp_bits_uop_ldq_idx,
  output [3:0]  io_iresp_bits_uop_stq_idx,
  output [1:0]  io_iresp_bits_uop_rxq_idx,
  output [5:0]  io_iresp_bits_uop_pdst,
  output [5:0]  io_iresp_bits_uop_prs1,
  output [5:0]  io_iresp_bits_uop_prs2,
  output [5:0]  io_iresp_bits_uop_prs3,
  output [4:0]  io_iresp_bits_uop_ppred,
  output        io_iresp_bits_uop_prs1_busy,
  output        io_iresp_bits_uop_prs2_busy,
  output        io_iresp_bits_uop_prs3_busy,
  output        io_iresp_bits_uop_ppred_busy,
  output [5:0]  io_iresp_bits_uop_stale_pdst,
  output        io_iresp_bits_uop_exception,
  output [63:0] io_iresp_bits_uop_exc_cause,
  output        io_iresp_bits_uop_bypassable,
  output [4:0]  io_iresp_bits_uop_mem_cmd,
  output [1:0]  io_iresp_bits_uop_mem_size,
  output        io_iresp_bits_uop_mem_signed,
  output        io_iresp_bits_uop_is_fence,
  output        io_iresp_bits_uop_is_fencei,
  output        io_iresp_bits_uop_is_amo,
  output        io_iresp_bits_uop_uses_ldq,
  output        io_iresp_bits_uop_uses_stq,
  output        io_iresp_bits_uop_is_sys_pc2epc,
  output        io_iresp_bits_uop_is_unique,
  output        io_iresp_bits_uop_flush_on_commit,
  output        io_iresp_bits_uop_ldst_is_rs1,
  output [5:0]  io_iresp_bits_uop_ldst,
  output [5:0]  io_iresp_bits_uop_lrs1,
  output [5:0]  io_iresp_bits_uop_lrs2,
  output [5:0]  io_iresp_bits_uop_lrs3,
  output        io_iresp_bits_uop_ldst_val,
  output [1:0]  io_iresp_bits_uop_dst_rtype,
  output [1:0]  io_iresp_bits_uop_lrs1_rtype,
  output [1:0]  io_iresp_bits_uop_lrs2_rtype,
  output        io_iresp_bits_uop_frs3_en,
  output        io_iresp_bits_uop_fp_val,
  output        io_iresp_bits_uop_fp_single,
  output        io_iresp_bits_uop_xcpt_pf_if,
  output        io_iresp_bits_uop_xcpt_ae_if,
  output        io_iresp_bits_uop_xcpt_ma_if,
  output        io_iresp_bits_uop_bp_debug_if,
  output        io_iresp_bits_uop_bp_xcpt_if,
  output [1:0]  io_iresp_bits_uop_debug_fsrc,
  output [1:0]  io_iresp_bits_uop_debug_tsrc,
  output [64:0] io_iresp_bits_data,
  output        io_iresp_bits_predicated,
  output        io_iresp_bits_fflags_valid,
  output [6:0]  io_iresp_bits_fflags_bits_uop_uopc,
  output [31:0] io_iresp_bits_fflags_bits_uop_inst,
  output [31:0] io_iresp_bits_fflags_bits_uop_debug_inst,
  output        io_iresp_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_iresp_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_iresp_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_iresp_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_iresp_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_iresp_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_iresp_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_iresp_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_iresp_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_iresp_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_iresp_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_iresp_bits_fflags_bits_uop_ctrl_is_load,
  output        io_iresp_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_iresp_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_iresp_bits_fflags_bits_uop_iw_state,
  output        io_iresp_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_iresp_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_iresp_bits_fflags_bits_uop_is_br,
  output        io_iresp_bits_fflags_bits_uop_is_jalr,
  output        io_iresp_bits_fflags_bits_uop_is_jal,
  output        io_iresp_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_iresp_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_iresp_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_iresp_bits_fflags_bits_uop_ftq_idx,
  output        io_iresp_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_iresp_bits_fflags_bits_uop_pc_lob,
  output        io_iresp_bits_fflags_bits_uop_taken,
  output [19:0] io_iresp_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_iresp_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_iresp_bits_fflags_bits_uop_rob_idx,
  output [3:0]  io_iresp_bits_fflags_bits_uop_ldq_idx,
  output [3:0]  io_iresp_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_iresp_bits_fflags_bits_uop_rxq_idx,
  output [5:0]  io_iresp_bits_fflags_bits_uop_pdst,
  output [5:0]  io_iresp_bits_fflags_bits_uop_prs1,
  output [5:0]  io_iresp_bits_fflags_bits_uop_prs2,
  output [5:0]  io_iresp_bits_fflags_bits_uop_prs3,
  output [4:0]  io_iresp_bits_fflags_bits_uop_ppred,
  output        io_iresp_bits_fflags_bits_uop_prs1_busy,
  output        io_iresp_bits_fflags_bits_uop_prs2_busy,
  output        io_iresp_bits_fflags_bits_uop_prs3_busy,
  output        io_iresp_bits_fflags_bits_uop_ppred_busy,
  output [5:0]  io_iresp_bits_fflags_bits_uop_stale_pdst,
  output        io_iresp_bits_fflags_bits_uop_exception,
  output [63:0] io_iresp_bits_fflags_bits_uop_exc_cause,
  output        io_iresp_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_iresp_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_iresp_bits_fflags_bits_uop_mem_size,
  output        io_iresp_bits_fflags_bits_uop_mem_signed,
  output        io_iresp_bits_fflags_bits_uop_is_fence,
  output        io_iresp_bits_fflags_bits_uop_is_fencei,
  output        io_iresp_bits_fflags_bits_uop_is_amo,
  output        io_iresp_bits_fflags_bits_uop_uses_ldq,
  output        io_iresp_bits_fflags_bits_uop_uses_stq,
  output        io_iresp_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_iresp_bits_fflags_bits_uop_is_unique,
  output        io_iresp_bits_fflags_bits_uop_flush_on_commit,
  output        io_iresp_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_iresp_bits_fflags_bits_uop_ldst,
  output [5:0]  io_iresp_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_iresp_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_iresp_bits_fflags_bits_uop_lrs3,
  output        io_iresp_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_iresp_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_iresp_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_iresp_bits_fflags_bits_uop_lrs2_rtype,
  output        io_iresp_bits_fflags_bits_uop_frs3_en,
  output        io_iresp_bits_fflags_bits_uop_fp_val,
  output        io_iresp_bits_fflags_bits_uop_fp_single,
  output        io_iresp_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_iresp_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_iresp_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_iresp_bits_fflags_bits_uop_bp_debug_if,
  output        io_iresp_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_iresp_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_iresp_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_iresp_bits_fflags_bits_flags,
  output        io_bypass_0_valid,
  output [6:0]  io_bypass_0_bits_uop_uopc,
  output [31:0] io_bypass_0_bits_uop_inst,
  output [31:0] io_bypass_0_bits_uop_debug_inst,
  output        io_bypass_0_bits_uop_is_rvc,
  output [39:0] io_bypass_0_bits_uop_debug_pc,
  output [2:0]  io_bypass_0_bits_uop_iq_type,
  output [9:0]  io_bypass_0_bits_uop_fu_code,
  output [3:0]  io_bypass_0_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_0_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_0_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_0_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_0_bits_uop_ctrl_op_fcn,
  output        io_bypass_0_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_0_bits_uop_ctrl_csr_cmd,
  output        io_bypass_0_bits_uop_ctrl_is_load,
  output        io_bypass_0_bits_uop_ctrl_is_sta,
  output        io_bypass_0_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_0_bits_uop_iw_state,
  output        io_bypass_0_bits_uop_iw_p1_poisoned,
  output        io_bypass_0_bits_uop_iw_p2_poisoned,
  output        io_bypass_0_bits_uop_is_br,
  output        io_bypass_0_bits_uop_is_jalr,
  output        io_bypass_0_bits_uop_is_jal,
  output        io_bypass_0_bits_uop_is_sfb,
  output [11:0] io_bypass_0_bits_uop_br_mask,
  output [3:0]  io_bypass_0_bits_uop_br_tag,
  output [4:0]  io_bypass_0_bits_uop_ftq_idx,
  output        io_bypass_0_bits_uop_edge_inst,
  output [5:0]  io_bypass_0_bits_uop_pc_lob,
  output        io_bypass_0_bits_uop_taken,
  output [19:0] io_bypass_0_bits_uop_imm_packed,
  output [11:0] io_bypass_0_bits_uop_csr_addr,
  output [5:0]  io_bypass_0_bits_uop_rob_idx,
  output [3:0]  io_bypass_0_bits_uop_ldq_idx,
  output [3:0]  io_bypass_0_bits_uop_stq_idx,
  output [1:0]  io_bypass_0_bits_uop_rxq_idx,
  output [5:0]  io_bypass_0_bits_uop_pdst,
  output [5:0]  io_bypass_0_bits_uop_prs1,
  output [5:0]  io_bypass_0_bits_uop_prs2,
  output [5:0]  io_bypass_0_bits_uop_prs3,
  output [4:0]  io_bypass_0_bits_uop_ppred,
  output        io_bypass_0_bits_uop_prs1_busy,
  output        io_bypass_0_bits_uop_prs2_busy,
  output        io_bypass_0_bits_uop_prs3_busy,
  output        io_bypass_0_bits_uop_ppred_busy,
  output [5:0]  io_bypass_0_bits_uop_stale_pdst,
  output        io_bypass_0_bits_uop_exception,
  output [63:0] io_bypass_0_bits_uop_exc_cause,
  output        io_bypass_0_bits_uop_bypassable,
  output [4:0]  io_bypass_0_bits_uop_mem_cmd,
  output [1:0]  io_bypass_0_bits_uop_mem_size,
  output        io_bypass_0_bits_uop_mem_signed,
  output        io_bypass_0_bits_uop_is_fence,
  output        io_bypass_0_bits_uop_is_fencei,
  output        io_bypass_0_bits_uop_is_amo,
  output        io_bypass_0_bits_uop_uses_ldq,
  output        io_bypass_0_bits_uop_uses_stq,
  output        io_bypass_0_bits_uop_is_sys_pc2epc,
  output        io_bypass_0_bits_uop_is_unique,
  output        io_bypass_0_bits_uop_flush_on_commit,
  output        io_bypass_0_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_0_bits_uop_ldst,
  output [5:0]  io_bypass_0_bits_uop_lrs1,
  output [5:0]  io_bypass_0_bits_uop_lrs2,
  output [5:0]  io_bypass_0_bits_uop_lrs3,
  output        io_bypass_0_bits_uop_ldst_val,
  output [1:0]  io_bypass_0_bits_uop_dst_rtype,
  output [1:0]  io_bypass_0_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_0_bits_uop_lrs2_rtype,
  output        io_bypass_0_bits_uop_frs3_en,
  output        io_bypass_0_bits_uop_fp_val,
  output        io_bypass_0_bits_uop_fp_single,
  output        io_bypass_0_bits_uop_xcpt_pf_if,
  output        io_bypass_0_bits_uop_xcpt_ae_if,
  output        io_bypass_0_bits_uop_xcpt_ma_if,
  output        io_bypass_0_bits_uop_bp_debug_if,
  output        io_bypass_0_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_0_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_0_bits_uop_debug_tsrc,
  output [64:0] io_bypass_0_bits_data,
  output        io_bypass_0_bits_predicated,
  output        io_bypass_0_bits_fflags_valid,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_uopc,
  output [31:0] io_bypass_0_bits_fflags_bits_uop_inst,
  output [31:0] io_bypass_0_bits_fflags_bits_uop_debug_inst,
  output        io_bypass_0_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_bypass_0_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_bypass_0_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_bypass_0_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_bypass_0_bits_fflags_bits_uop_ctrl_is_load,
  output        io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_bypass_0_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_iw_state,
  output        io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_bypass_0_bits_fflags_bits_uop_is_br,
  output        io_bypass_0_bits_fflags_bits_uop_is_jalr,
  output        io_bypass_0_bits_fflags_bits_uop_is_jal,
  output        io_bypass_0_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_bypass_0_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_bypass_0_bits_fflags_bits_uop_ftq_idx,
  output        io_bypass_0_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_pc_lob,
  output        io_bypass_0_bits_fflags_bits_uop_taken,
  output [19:0] io_bypass_0_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_bypass_0_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_rob_idx,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_ldq_idx,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_rxq_idx,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_pdst,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_prs1,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_prs2,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_prs3,
  output [4:0]  io_bypass_0_bits_fflags_bits_uop_ppred,
  output        io_bypass_0_bits_fflags_bits_uop_prs1_busy,
  output        io_bypass_0_bits_fflags_bits_uop_prs2_busy,
  output        io_bypass_0_bits_fflags_bits_uop_prs3_busy,
  output        io_bypass_0_bits_fflags_bits_uop_ppred_busy,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_stale_pdst,
  output        io_bypass_0_bits_fflags_bits_uop_exception,
  output [63:0] io_bypass_0_bits_fflags_bits_uop_exc_cause,
  output        io_bypass_0_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_bypass_0_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_mem_size,
  output        io_bypass_0_bits_fflags_bits_uop_mem_signed,
  output        io_bypass_0_bits_fflags_bits_uop_is_fence,
  output        io_bypass_0_bits_fflags_bits_uop_is_fencei,
  output        io_bypass_0_bits_fflags_bits_uop_is_amo,
  output        io_bypass_0_bits_fflags_bits_uop_uses_ldq,
  output        io_bypass_0_bits_fflags_bits_uop_uses_stq,
  output        io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_bypass_0_bits_fflags_bits_uop_is_unique,
  output        io_bypass_0_bits_fflags_bits_uop_flush_on_commit,
  output        io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_ldst,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_lrs3,
  output        io_bypass_0_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_lrs2_rtype,
  output        io_bypass_0_bits_fflags_bits_uop_frs3_en,
  output        io_bypass_0_bits_fflags_bits_uop_fp_val,
  output        io_bypass_0_bits_fflags_bits_uop_fp_single,
  output        io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_bypass_0_bits_fflags_bits_uop_bp_debug_if,
  output        io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_bypass_0_bits_fflags_bits_flags,
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
  output [6:0]  io_brinfo_uop_uopc,
  output [31:0] io_brinfo_uop_inst,
  output [31:0] io_brinfo_uop_debug_inst,
  output        io_brinfo_uop_is_rvc,
  output [39:0] io_brinfo_uop_debug_pc,
  output [2:0]  io_brinfo_uop_iq_type,
  output [9:0]  io_brinfo_uop_fu_code,
  output [3:0]  io_brinfo_uop_ctrl_br_type,
  output [1:0]  io_brinfo_uop_ctrl_op1_sel,
  output [2:0]  io_brinfo_uop_ctrl_op2_sel,
  output [2:0]  io_brinfo_uop_ctrl_imm_sel,
  output [3:0]  io_brinfo_uop_ctrl_op_fcn,
  output        io_brinfo_uop_ctrl_fcn_dw,
  output [2:0]  io_brinfo_uop_ctrl_csr_cmd,
  output        io_brinfo_uop_ctrl_is_load,
  output        io_brinfo_uop_ctrl_is_sta,
  output        io_brinfo_uop_ctrl_is_std,
  output [1:0]  io_brinfo_uop_iw_state,
  output        io_brinfo_uop_iw_p1_poisoned,
  output        io_brinfo_uop_iw_p2_poisoned,
  output        io_brinfo_uop_is_br,
  output        io_brinfo_uop_is_jalr,
  output        io_brinfo_uop_is_jal,
  output        io_brinfo_uop_is_sfb,
  output [11:0] io_brinfo_uop_br_mask,
  output [3:0]  io_brinfo_uop_br_tag,
  output [4:0]  io_brinfo_uop_ftq_idx,
  output        io_brinfo_uop_edge_inst,
  output [5:0]  io_brinfo_uop_pc_lob,
  output        io_brinfo_uop_taken,
  output [19:0] io_brinfo_uop_imm_packed,
  output [11:0] io_brinfo_uop_csr_addr,
  output [5:0]  io_brinfo_uop_rob_idx,
  output [3:0]  io_brinfo_uop_ldq_idx,
  output [3:0]  io_brinfo_uop_stq_idx,
  output [1:0]  io_brinfo_uop_rxq_idx,
  output [5:0]  io_brinfo_uop_pdst,
  output [5:0]  io_brinfo_uop_prs1,
  output [5:0]  io_brinfo_uop_prs2,
  output [5:0]  io_brinfo_uop_prs3,
  output [4:0]  io_brinfo_uop_ppred,
  output        io_brinfo_uop_prs1_busy,
  output        io_brinfo_uop_prs2_busy,
  output        io_brinfo_uop_prs3_busy,
  output        io_brinfo_uop_ppred_busy,
  output [5:0]  io_brinfo_uop_stale_pdst,
  output        io_brinfo_uop_exception,
  output [63:0] io_brinfo_uop_exc_cause,
  output        io_brinfo_uop_bypassable,
  output [4:0]  io_brinfo_uop_mem_cmd,
  output [1:0]  io_brinfo_uop_mem_size,
  output        io_brinfo_uop_mem_signed,
  output        io_brinfo_uop_is_fence,
  output        io_brinfo_uop_is_fencei,
  output        io_brinfo_uop_is_amo,
  output        io_brinfo_uop_uses_ldq,
  output        io_brinfo_uop_uses_stq,
  output        io_brinfo_uop_is_sys_pc2epc,
  output        io_brinfo_uop_is_unique,
  output        io_brinfo_uop_flush_on_commit,
  output        io_brinfo_uop_ldst_is_rs1,
  output [5:0]  io_brinfo_uop_ldst,
  output [5:0]  io_brinfo_uop_lrs1,
  output [5:0]  io_brinfo_uop_lrs2,
  output [5:0]  io_brinfo_uop_lrs3,
  output        io_brinfo_uop_ldst_val,
  output [1:0]  io_brinfo_uop_dst_rtype,
  output [1:0]  io_brinfo_uop_lrs1_rtype,
  output [1:0]  io_brinfo_uop_lrs2_rtype,
  output        io_brinfo_uop_frs3_en,
  output        io_brinfo_uop_fp_val,
  output        io_brinfo_uop_fp_single,
  output        io_brinfo_uop_xcpt_pf_if,
  output        io_brinfo_uop_xcpt_ae_if,
  output        io_brinfo_uop_xcpt_ma_if,
  output        io_brinfo_uop_bp_debug_if,
  output        io_brinfo_uop_bp_xcpt_if,
  output [1:0]  io_brinfo_uop_debug_fsrc,
  output [1:0]  io_brinfo_uop_debug_tsrc,
  output        io_brinfo_valid,
  output        io_brinfo_mispredict,
  output        io_brinfo_taken,
  output [2:0]  io_brinfo_cfi_type,
  output [1:0]  io_brinfo_pc_sel,
  output [39:0] io_brinfo_jalr_target,
  output [20:0] io_brinfo_target_offset,
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
  input         io_status_uie
);
  wire  alu_clock; // @[execution-unit.scala 262:17]
  wire  alu_reset; // @[execution-unit.scala 262:17]
  wire  alu_io_req_ready; // @[execution-unit.scala 262:17]
  wire  alu_io_req_valid; // @[execution-unit.scala 262:17]
  wire [6:0] alu_io_req_bits_uop_uopc; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_req_bits_uop_inst; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_req_bits_uop_debug_inst; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_is_rvc; // @[execution-unit.scala 262:17]
  wire [39:0] alu_io_req_bits_uop_debug_pc; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_req_bits_uop_iq_type; // @[execution-unit.scala 262:17]
  wire [9:0] alu_io_req_bits_uop_fu_code; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_req_bits_uop_iw_state; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_is_br; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_is_jalr; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_is_jal; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_is_sfb; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_req_bits_uop_br_mask; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_req_bits_uop_br_tag; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_req_bits_uop_ftq_idx; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_edge_inst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_req_bits_uop_pc_lob; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_taken; // @[execution-unit.scala 262:17]
  wire [19:0] alu_io_req_bits_uop_imm_packed; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_req_bits_uop_csr_addr; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_req_bits_uop_rob_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_req_bits_uop_ldq_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_req_bits_uop_stq_idx; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_req_bits_uop_rxq_idx; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_req_bits_uop_pdst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_req_bits_uop_prs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_req_bits_uop_prs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_req_bits_uop_prs3; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_req_bits_uop_ppred; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_prs1_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_prs2_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_prs3_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_ppred_busy; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_req_bits_uop_stale_pdst; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_exception; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_req_bits_uop_exc_cause; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_bypassable; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_req_bits_uop_mem_cmd; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_req_bits_uop_mem_size; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_mem_signed; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_is_fence; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_is_fencei; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_is_amo; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_uses_ldq; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_uses_stq; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_is_unique; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_req_bits_uop_ldst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_req_bits_uop_lrs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_req_bits_uop_lrs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_req_bits_uop_lrs3; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_ldst_val; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_req_bits_uop_dst_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_frs3_en; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_fp_val; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_fp_single; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_req_bits_rs1_data; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_req_bits_rs2_data; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_req_bits_rs3_data; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_pred_data; // @[execution-unit.scala 262:17]
  wire  alu_io_req_bits_kill; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_ready; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_valid; // @[execution-unit.scala 262:17]
  wire [6:0] alu_io_resp_bits_uop_uopc; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_resp_bits_uop_inst; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_resp_bits_uop_debug_inst; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_is_rvc; // @[execution-unit.scala 262:17]
  wire [39:0] alu_io_resp_bits_uop_debug_pc; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_resp_bits_uop_iq_type; // @[execution-unit.scala 262:17]
  wire [9:0] alu_io_resp_bits_uop_fu_code; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_resp_bits_uop_ctrl_br_type; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_resp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_resp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_resp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_ctrl_is_load; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_ctrl_is_std; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_uop_iw_state; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_is_br; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_is_jalr; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_is_jal; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_is_sfb; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_resp_bits_uop_br_mask; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_resp_bits_uop_br_tag; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_resp_bits_uop_ftq_idx; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_edge_inst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_uop_pc_lob; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_taken; // @[execution-unit.scala 262:17]
  wire [19:0] alu_io_resp_bits_uop_imm_packed; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_resp_bits_uop_csr_addr; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_uop_rob_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_resp_bits_uop_ldq_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_resp_bits_uop_stq_idx; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_uop_rxq_idx; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_uop_pdst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_uop_prs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_uop_prs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_uop_prs3; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_resp_bits_uop_ppred; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_prs1_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_prs2_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_prs3_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_ppred_busy; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_uop_stale_pdst; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_exception; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_resp_bits_uop_exc_cause; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_bypassable; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_resp_bits_uop_mem_cmd; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_uop_mem_size; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_mem_signed; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_is_fence; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_is_fencei; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_is_amo; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_uses_ldq; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_uses_stq; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_is_unique; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_flush_on_commit; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_uop_ldst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_uop_lrs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_uop_lrs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_uop_lrs3; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_ldst_val; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_uop_dst_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_uop_lrs1_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_uop_lrs2_rtype; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_frs3_en; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_fp_val; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_fp_single; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_bp_debug_if; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_uop_debug_fsrc; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_uop_debug_tsrc; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_predicated; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_resp_bits_data; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_valid; // @[execution-unit.scala 262:17]
  wire [6:0] alu_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 262:17]
  wire [39:0] alu_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 262:17]
  wire [9:0] alu_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 262:17]
  wire [19:0] alu_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 262:17]
  wire [39:0] alu_io_resp_bits_addr; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_mxcpt_valid; // @[execution-unit.scala 262:17]
  wire [16:0] alu_io_resp_bits_mxcpt_bits; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_sfence_valid; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_sfence_bits_rs1; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_sfence_bits_rs2; // @[execution-unit.scala 262:17]
  wire [38:0] alu_io_resp_bits_sfence_bits_addr; // @[execution-unit.scala 262:17]
  wire  alu_io_resp_bits_sfence_bits_asid; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_brupdate_b1_resolve_mask; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 262:17]
  wire [6:0] alu_io_brupdate_b2_uop_uopc; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_brupdate_b2_uop_inst; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 262:17]
  wire [39:0] alu_io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 262:17]
  wire [9:0] alu_io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_is_br; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_taken; // @[execution-unit.scala 262:17]
  wire [19:0] alu_io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brupdate_b2_uop_pdst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brupdate_b2_uop_prs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brupdate_b2_uop_prs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brupdate_b2_uop_prs3; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_brupdate_b2_uop_ppred; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_exception; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brupdate_b2_uop_ldst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_valid; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_mispredict; // @[execution-unit.scala 262:17]
  wire  alu_io_brupdate_b2_taken; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_brupdate_b2_cfi_type; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brupdate_b2_pc_sel; // @[execution-unit.scala 262:17]
  wire [39:0] alu_io_brupdate_b2_jalr_target; // @[execution-unit.scala 262:17]
  wire [20:0] alu_io_brupdate_b2_target_offset; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_valid; // @[execution-unit.scala 262:17]
  wire [6:0] alu_io_bypass_0_bits_uop_uopc; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_bypass_0_bits_uop_inst; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_bypass_0_bits_uop_debug_inst; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_is_rvc; // @[execution-unit.scala 262:17]
  wire [39:0] alu_io_bypass_0_bits_uop_debug_pc; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_bypass_0_bits_uop_iq_type; // @[execution-unit.scala 262:17]
  wire [9:0] alu_io_bypass_0_bits_uop_fu_code; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_bypass_0_bits_uop_ctrl_br_type; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_bypass_0_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_bypass_0_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_bypass_0_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_bypass_0_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_ctrl_is_load; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_ctrl_is_sta; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_ctrl_is_std; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_uop_iw_state; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_is_br; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_is_jalr; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_is_jal; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_is_sfb; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_bypass_0_bits_uop_br_mask; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_bypass_0_bits_uop_br_tag; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_bypass_0_bits_uop_ftq_idx; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_edge_inst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_uop_pc_lob; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_taken; // @[execution-unit.scala 262:17]
  wire [19:0] alu_io_bypass_0_bits_uop_imm_packed; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_bypass_0_bits_uop_csr_addr; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_uop_rob_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_bypass_0_bits_uop_ldq_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_bypass_0_bits_uop_stq_idx; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_uop_rxq_idx; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_uop_pdst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_uop_prs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_uop_prs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_uop_prs3; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_bypass_0_bits_uop_ppred; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_prs1_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_prs2_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_prs3_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_ppred_busy; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_uop_stale_pdst; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_exception; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_bypass_0_bits_uop_exc_cause; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_bypassable; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_bypass_0_bits_uop_mem_cmd; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_uop_mem_size; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_mem_signed; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_is_fence; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_is_fencei; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_is_amo; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_uses_ldq; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_uses_stq; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_is_unique; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_flush_on_commit; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_ldst_is_rs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_uop_ldst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_uop_lrs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_uop_lrs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_uop_lrs3; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_ldst_val; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_uop_dst_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_uop_lrs1_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_uop_lrs2_rtype; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_frs3_en; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_fp_val; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_fp_single; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_xcpt_pf_if; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_xcpt_ae_if; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_xcpt_ma_if; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_bp_debug_if; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_uop_bp_xcpt_if; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_uop_debug_fsrc; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_uop_debug_tsrc; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_bypass_0_bits_data; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_predicated; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_valid; // @[execution-unit.scala 262:17]
  wire [6:0] alu_io_bypass_0_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_bypass_0_bits_fflags_bits_uop_inst; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_bypass_0_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 262:17]
  wire [39:0] alu_io_bypass_0_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_bypass_0_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 262:17]
  wire [9:0] alu_io_bypass_0_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_bypass_0_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_bypass_0_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_taken; // @[execution-unit.scala 262:17]
  wire [19:0] alu_io_bypass_0_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_bypass_0_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_bypass_0_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_bypass_0_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_exception; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_bypass_0_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_bypass_0_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_bypass_0_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 262:17]
  wire  alu_io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_bypass_0_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_bypass_0_bits_fflags_bits_flags; // @[execution-unit.scala 262:17]
  wire [6:0] alu_io_brinfo_uop_uopc; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_brinfo_uop_inst; // @[execution-unit.scala 262:17]
  wire [31:0] alu_io_brinfo_uop_debug_inst; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_is_rvc; // @[execution-unit.scala 262:17]
  wire [39:0] alu_io_brinfo_uop_debug_pc; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_brinfo_uop_iq_type; // @[execution-unit.scala 262:17]
  wire [9:0] alu_io_brinfo_uop_fu_code; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_brinfo_uop_ctrl_br_type; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brinfo_uop_ctrl_op1_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_brinfo_uop_ctrl_op2_sel; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_brinfo_uop_ctrl_imm_sel; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_brinfo_uop_ctrl_op_fcn; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_ctrl_fcn_dw; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_brinfo_uop_ctrl_csr_cmd; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_ctrl_is_load; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_ctrl_is_sta; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_ctrl_is_std; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brinfo_uop_iw_state; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_iw_p1_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_iw_p2_poisoned; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_is_br; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_is_jalr; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_is_jal; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_is_sfb; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_brinfo_uop_br_mask; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_brinfo_uop_br_tag; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_brinfo_uop_ftq_idx; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_edge_inst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brinfo_uop_pc_lob; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_taken; // @[execution-unit.scala 262:17]
  wire [19:0] alu_io_brinfo_uop_imm_packed; // @[execution-unit.scala 262:17]
  wire [11:0] alu_io_brinfo_uop_csr_addr; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brinfo_uop_rob_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_brinfo_uop_ldq_idx; // @[execution-unit.scala 262:17]
  wire [3:0] alu_io_brinfo_uop_stq_idx; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brinfo_uop_rxq_idx; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brinfo_uop_pdst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brinfo_uop_prs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brinfo_uop_prs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brinfo_uop_prs3; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_brinfo_uop_ppred; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_prs1_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_prs2_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_prs3_busy; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_ppred_busy; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brinfo_uop_stale_pdst; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_exception; // @[execution-unit.scala 262:17]
  wire [63:0] alu_io_brinfo_uop_exc_cause; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_bypassable; // @[execution-unit.scala 262:17]
  wire [4:0] alu_io_brinfo_uop_mem_cmd; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brinfo_uop_mem_size; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_mem_signed; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_is_fence; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_is_fencei; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_is_amo; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_uses_ldq; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_uses_stq; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_is_sys_pc2epc; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_is_unique; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_flush_on_commit; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_ldst_is_rs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brinfo_uop_ldst; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brinfo_uop_lrs1; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brinfo_uop_lrs2; // @[execution-unit.scala 262:17]
  wire [5:0] alu_io_brinfo_uop_lrs3; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_ldst_val; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brinfo_uop_dst_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brinfo_uop_lrs1_rtype; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brinfo_uop_lrs2_rtype; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_frs3_en; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_fp_val; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_fp_single; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_xcpt_pf_if; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_xcpt_ae_if; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_xcpt_ma_if; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_bp_debug_if; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_uop_bp_xcpt_if; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brinfo_uop_debug_fsrc; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brinfo_uop_debug_tsrc; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_valid; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_mispredict; // @[execution-unit.scala 262:17]
  wire  alu_io_brinfo_taken; // @[execution-unit.scala 262:17]
  wire [2:0] alu_io_brinfo_cfi_type; // @[execution-unit.scala 262:17]
  wire [1:0] alu_io_brinfo_pc_sel; // @[execution-unit.scala 262:17]
  wire [39:0] alu_io_brinfo_jalr_target; // @[execution-unit.scala 262:17]
  wire [20:0] alu_io_brinfo_target_offset; // @[execution-unit.scala 262:17]
  wire  div_clock; // @[execution-unit.scala 357:17]
  wire  div_reset; // @[execution-unit.scala 357:17]
  wire  div_io_req_ready; // @[execution-unit.scala 357:17]
  wire  div_io_req_valid; // @[execution-unit.scala 357:17]
  wire [6:0] div_io_req_bits_uop_uopc; // @[execution-unit.scala 357:17]
  wire [31:0] div_io_req_bits_uop_inst; // @[execution-unit.scala 357:17]
  wire [31:0] div_io_req_bits_uop_debug_inst; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_is_rvc; // @[execution-unit.scala 357:17]
  wire [39:0] div_io_req_bits_uop_debug_pc; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_req_bits_uop_iq_type; // @[execution-unit.scala 357:17]
  wire [9:0] div_io_req_bits_uop_fu_code; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_req_bits_uop_iw_state; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_is_br; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_is_jalr; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_is_jal; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_is_sfb; // @[execution-unit.scala 357:17]
  wire [11:0] div_io_req_bits_uop_br_mask; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_req_bits_uop_br_tag; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_req_bits_uop_ftq_idx; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_edge_inst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_req_bits_uop_pc_lob; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_taken; // @[execution-unit.scala 357:17]
  wire [19:0] div_io_req_bits_uop_imm_packed; // @[execution-unit.scala 357:17]
  wire [11:0] div_io_req_bits_uop_csr_addr; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_req_bits_uop_rob_idx; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_req_bits_uop_ldq_idx; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_req_bits_uop_stq_idx; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_req_bits_uop_rxq_idx; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_req_bits_uop_pdst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_req_bits_uop_prs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_req_bits_uop_prs2; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_req_bits_uop_prs3; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_req_bits_uop_ppred; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_prs1_busy; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_prs2_busy; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_prs3_busy; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_ppred_busy; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_req_bits_uop_stale_pdst; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_exception; // @[execution-unit.scala 357:17]
  wire [63:0] div_io_req_bits_uop_exc_cause; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_bypassable; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_req_bits_uop_mem_cmd; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_req_bits_uop_mem_size; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_mem_signed; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_is_fence; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_is_fencei; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_is_amo; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_uses_ldq; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_uses_stq; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_is_unique; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_req_bits_uop_ldst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_req_bits_uop_lrs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_req_bits_uop_lrs2; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_req_bits_uop_lrs3; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_ldst_val; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_req_bits_uop_dst_rtype; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_frs3_en; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_fp_val; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_fp_single; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 357:17]
  wire [63:0] div_io_req_bits_rs1_data; // @[execution-unit.scala 357:17]
  wire [63:0] div_io_req_bits_rs2_data; // @[execution-unit.scala 357:17]
  wire [63:0] div_io_req_bits_rs3_data; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_pred_data; // @[execution-unit.scala 357:17]
  wire  div_io_req_bits_kill; // @[execution-unit.scala 357:17]
  wire  div_io_resp_ready; // @[execution-unit.scala 357:17]
  wire  div_io_resp_valid; // @[execution-unit.scala 357:17]
  wire [6:0] div_io_resp_bits_uop_uopc; // @[execution-unit.scala 357:17]
  wire [31:0] div_io_resp_bits_uop_inst; // @[execution-unit.scala 357:17]
  wire [31:0] div_io_resp_bits_uop_debug_inst; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_is_rvc; // @[execution-unit.scala 357:17]
  wire [39:0] div_io_resp_bits_uop_debug_pc; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_resp_bits_uop_iq_type; // @[execution-unit.scala 357:17]
  wire [9:0] div_io_resp_bits_uop_fu_code; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_resp_bits_uop_ctrl_br_type; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_resp_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_resp_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_resp_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_ctrl_is_load; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_ctrl_is_sta; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_ctrl_is_std; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_uop_iw_state; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_is_br; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_is_jalr; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_is_jal; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_is_sfb; // @[execution-unit.scala 357:17]
  wire [11:0] div_io_resp_bits_uop_br_mask; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_resp_bits_uop_br_tag; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_resp_bits_uop_ftq_idx; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_edge_inst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_uop_pc_lob; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_taken; // @[execution-unit.scala 357:17]
  wire [19:0] div_io_resp_bits_uop_imm_packed; // @[execution-unit.scala 357:17]
  wire [11:0] div_io_resp_bits_uop_csr_addr; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_uop_rob_idx; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_resp_bits_uop_ldq_idx; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_resp_bits_uop_stq_idx; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_uop_rxq_idx; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_uop_pdst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_uop_prs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_uop_prs2; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_uop_prs3; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_resp_bits_uop_ppred; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_prs1_busy; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_prs2_busy; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_prs3_busy; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_ppred_busy; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_uop_stale_pdst; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_exception; // @[execution-unit.scala 357:17]
  wire [63:0] div_io_resp_bits_uop_exc_cause; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_bypassable; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_resp_bits_uop_mem_cmd; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_uop_mem_size; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_mem_signed; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_is_fence; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_is_fencei; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_is_amo; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_uses_ldq; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_uses_stq; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_is_unique; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_flush_on_commit; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_ldst_is_rs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_uop_ldst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_uop_lrs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_uop_lrs2; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_uop_lrs3; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_ldst_val; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_uop_dst_rtype; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_uop_lrs1_rtype; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_uop_lrs2_rtype; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_frs3_en; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_fp_val; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_fp_single; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_xcpt_pf_if; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_xcpt_ae_if; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_xcpt_ma_if; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_bp_debug_if; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_uop_bp_xcpt_if; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_uop_debug_fsrc; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_uop_debug_tsrc; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_predicated; // @[execution-unit.scala 357:17]
  wire [63:0] div_io_resp_bits_data; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_valid; // @[execution-unit.scala 357:17]
  wire [6:0] div_io_resp_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 357:17]
  wire [31:0] div_io_resp_bits_fflags_bits_uop_inst; // @[execution-unit.scala 357:17]
  wire [31:0] div_io_resp_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 357:17]
  wire [39:0] div_io_resp_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_resp_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 357:17]
  wire [9:0] div_io_resp_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_resp_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_resp_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_resp_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_resp_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 357:17]
  wire [11:0] div_io_resp_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_resp_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_resp_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_taken; // @[execution-unit.scala 357:17]
  wire [19:0] div_io_resp_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 357:17]
  wire [11:0] div_io_resp_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_resp_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_resp_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_resp_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_exception; // @[execution-unit.scala 357:17]
  wire [63:0] div_io_resp_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_resp_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_resp_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_resp_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_resp_bits_fflags_bits_flags; // @[execution-unit.scala 357:17]
  wire [39:0] div_io_resp_bits_addr; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_mxcpt_valid; // @[execution-unit.scala 357:17]
  wire [16:0] div_io_resp_bits_mxcpt_bits; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_sfence_valid; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_sfence_bits_rs1; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_sfence_bits_rs2; // @[execution-unit.scala 357:17]
  wire [38:0] div_io_resp_bits_sfence_bits_addr; // @[execution-unit.scala 357:17]
  wire  div_io_resp_bits_sfence_bits_asid; // @[execution-unit.scala 357:17]
  wire [11:0] div_io_brupdate_b1_resolve_mask; // @[execution-unit.scala 357:17]
  wire [11:0] div_io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 357:17]
  wire [6:0] div_io_brupdate_b2_uop_uopc; // @[execution-unit.scala 357:17]
  wire [31:0] div_io_brupdate_b2_uop_inst; // @[execution-unit.scala 357:17]
  wire [31:0] div_io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 357:17]
  wire [39:0] div_io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 357:17]
  wire [9:0] div_io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_is_br; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 357:17]
  wire [11:0] div_io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_taken; // @[execution-unit.scala 357:17]
  wire [19:0] div_io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 357:17]
  wire [11:0] div_io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 357:17]
  wire [3:0] div_io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_brupdate_b2_uop_pdst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_brupdate_b2_uop_prs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_brupdate_b2_uop_prs2; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_brupdate_b2_uop_prs3; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_brupdate_b2_uop_ppred; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_exception; // @[execution-unit.scala 357:17]
  wire [63:0] div_io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 357:17]
  wire [4:0] div_io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_brupdate_b2_uop_ldst; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 357:17]
  wire [5:0] div_io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_valid; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_mispredict; // @[execution-unit.scala 357:17]
  wire  div_io_brupdate_b2_taken; // @[execution-unit.scala 357:17]
  wire [2:0] div_io_brupdate_b2_cfi_type; // @[execution-unit.scala 357:17]
  wire [1:0] div_io_brupdate_b2_pc_sel; // @[execution-unit.scala 357:17]
  wire [39:0] div_io_brupdate_b2_jalr_target; // @[execution-unit.scala 357:17]
  wire [20:0] div_io_brupdate_b2_target_offset; // @[execution-unit.scala 357:17]
  wire [9:0] _T_34 = io_req_bits_uop_fu_code & 10'h10; // @[micro-op.scala 154:40]
  wire  _T_35 = _T_34 != 10'h0; // @[micro-op.scala 154:47]
  wire  _T_36 = io_req_valid & _T_35; // @[execution-unit.scala 371:35]
  wire  div_busy = ~div_io_req_ready | _T_36; // @[execution-unit.scala 370:39]
  wire [9:0] _T_8 = ~div_busy ? 10'h10 : 10'h0; // @[execution-unit.scala 253:21]
  wire [9:0] _T_9 = 10'h1 | _T_8; // @[execution-unit.scala 252:45]
  wire  _T_21 = io_req_bits_uop_fu_code == 10'h2; // @[execution-unit.scala 268:32]
  wire  _T_22 = io_req_bits_uop_fu_code == 10'h1 | _T_21; // @[execution-unit.scala 267:43]
  wire  _T_25 = io_req_bits_uop_fu_code == 10'h20 & io_req_bits_uop_uopc != 7'h6c; // @[execution-unit.scala 269:43]
  wire  _T_26 = _T_22 | _T_25; // @[execution-unit.scala 268:43]
  wire [63:0] _T_40 = alu_io_resp_valid ? alu_io_resp_bits_data : div_io_resp_bits_data; // @[Mux.scala 47:69]
  wire  _T_43 = alu_io_resp_bits_uop_imm_packed[19]; // @[util.scala 273:37]
  wire  lo_lo = alu_io_resp_bits_uop_imm_packed[8]; // @[Cat.scala 30:58]
  wire [4:0] lo_hi_lo = alu_io_resp_bits_uop_imm_packed[13:9]; // @[Cat.scala 30:58]
  wire [4:0] lo_hi_hi = alu_io_resp_bits_uop_imm_packed[18:14]; // @[Cat.scala 30:58]
  wire  hi_lo_lo = alu_io_resp_bits_uop_imm_packed[19]; // @[Cat.scala 30:58]
  wire [7:0] hi_lo_hi = {8{_T_43}}; // @[Cat.scala 30:58]
  wire [10:0] hi_hi_lo = {11{_T_43}}; // @[Cat.scala 30:58]
  wire [31:0] _T_78 = {hi_lo_lo,hi_hi_lo,hi_lo_hi,hi_lo_lo,lo_hi_hi,lo_hi_lo,lo_lo}; // @[execution-unit.scala 411:83]
  wire [1:0] _T_79 = alu_io_resp_valid + div_io_resp_valid; // @[Bitwise.scala 47:55]
  wire  div_resp_val = div_io_resp_valid;
  wire  _T_87 = _T_79 <= 2'h2 & div_resp_val; // @[execution-unit.scala 417:65]
  ALUUnit_1 alu ( // @[execution-unit.scala 262:17]
    .clock(alu_clock),
    .reset(alu_reset),
    .io_req_ready(alu_io_req_ready),
    .io_req_valid(alu_io_req_valid),
    .io_req_bits_uop_uopc(alu_io_req_bits_uop_uopc),
    .io_req_bits_uop_inst(alu_io_req_bits_uop_inst),
    .io_req_bits_uop_debug_inst(alu_io_req_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc(alu_io_req_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc(alu_io_req_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type(alu_io_req_bits_uop_iq_type),
    .io_req_bits_uop_fu_code(alu_io_req_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type(alu_io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel(alu_io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel(alu_io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel(alu_io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn(alu_io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw(alu_io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd(alu_io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load(alu_io_req_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta(alu_io_req_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std(alu_io_req_bits_uop_ctrl_is_std),
    .io_req_bits_uop_iw_state(alu_io_req_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned(alu_io_req_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned(alu_io_req_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br(alu_io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr(alu_io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal(alu_io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb(alu_io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask(alu_io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag(alu_io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx(alu_io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst(alu_io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob(alu_io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken(alu_io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed(alu_io_req_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr(alu_io_req_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx(alu_io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx(alu_io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx(alu_io_req_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx(alu_io_req_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst(alu_io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1(alu_io_req_bits_uop_prs1),
    .io_req_bits_uop_prs2(alu_io_req_bits_uop_prs2),
    .io_req_bits_uop_prs3(alu_io_req_bits_uop_prs3),
    .io_req_bits_uop_ppred(alu_io_req_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy(alu_io_req_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy(alu_io_req_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy(alu_io_req_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy(alu_io_req_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst(alu_io_req_bits_uop_stale_pdst),
    .io_req_bits_uop_exception(alu_io_req_bits_uop_exception),
    .io_req_bits_uop_exc_cause(alu_io_req_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable(alu_io_req_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd(alu_io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size(alu_io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed(alu_io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence(alu_io_req_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei(alu_io_req_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo(alu_io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq(alu_io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq(alu_io_req_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc(alu_io_req_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique(alu_io_req_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit(alu_io_req_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1(alu_io_req_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst(alu_io_req_bits_uop_ldst),
    .io_req_bits_uop_lrs1(alu_io_req_bits_uop_lrs1),
    .io_req_bits_uop_lrs2(alu_io_req_bits_uop_lrs2),
    .io_req_bits_uop_lrs3(alu_io_req_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val(alu_io_req_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype(alu_io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype(alu_io_req_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype(alu_io_req_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en(alu_io_req_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val(alu_io_req_bits_uop_fp_val),
    .io_req_bits_uop_fp_single(alu_io_req_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if(alu_io_req_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if(alu_io_req_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if(alu_io_req_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if(alu_io_req_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if(alu_io_req_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc(alu_io_req_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc(alu_io_req_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data(alu_io_req_bits_rs1_data),
    .io_req_bits_rs2_data(alu_io_req_bits_rs2_data),
    .io_req_bits_rs3_data(alu_io_req_bits_rs3_data),
    .io_req_bits_pred_data(alu_io_req_bits_pred_data),
    .io_req_bits_kill(alu_io_req_bits_kill),
    .io_resp_ready(alu_io_resp_ready),
    .io_resp_valid(alu_io_resp_valid),
    .io_resp_bits_uop_uopc(alu_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(alu_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(alu_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(alu_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(alu_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(alu_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(alu_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(alu_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(alu_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(alu_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(alu_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(alu_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(alu_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(alu_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(alu_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(alu_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(alu_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state(alu_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(alu_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(alu_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(alu_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(alu_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(alu_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(alu_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(alu_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(alu_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(alu_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(alu_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(alu_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(alu_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(alu_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(alu_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(alu_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(alu_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(alu_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(alu_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(alu_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(alu_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(alu_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(alu_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(alu_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(alu_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(alu_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(alu_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(alu_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(alu_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(alu_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(alu_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(alu_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(alu_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(alu_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(alu_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(alu_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(alu_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(alu_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(alu_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(alu_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(alu_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(alu_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(alu_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(alu_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(alu_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(alu_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(alu_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(alu_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(alu_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(alu_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(alu_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(alu_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(alu_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(alu_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(alu_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(alu_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(alu_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(alu_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(alu_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(alu_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(alu_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(alu_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_predicated(alu_io_resp_bits_predicated),
    .io_resp_bits_data(alu_io_resp_bits_data),
    .io_resp_bits_fflags_valid(alu_io_resp_bits_fflags_valid),
    .io_resp_bits_fflags_bits_uop_uopc(alu_io_resp_bits_fflags_bits_uop_uopc),
    .io_resp_bits_fflags_bits_uop_inst(alu_io_resp_bits_fflags_bits_uop_inst),
    .io_resp_bits_fflags_bits_uop_debug_inst(alu_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_resp_bits_fflags_bits_uop_is_rvc(alu_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_resp_bits_fflags_bits_uop_debug_pc(alu_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_resp_bits_fflags_bits_uop_iq_type(alu_io_resp_bits_fflags_bits_uop_iq_type),
    .io_resp_bits_fflags_bits_uop_fu_code(alu_io_resp_bits_fflags_bits_uop_fu_code),
    .io_resp_bits_fflags_bits_uop_ctrl_br_type(alu_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_resp_bits_fflags_bits_uop_ctrl_op1_sel(alu_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op2_sel(alu_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_imm_sel(alu_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op_fcn(alu_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflags_bits_uop_ctrl_fcn_dw(alu_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflags_bits_uop_ctrl_csr_cmd(alu_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflags_bits_uop_ctrl_is_load(alu_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_resp_bits_fflags_bits_uop_ctrl_is_sta(alu_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflags_bits_uop_ctrl_is_std(alu_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_resp_bits_fflags_bits_uop_iw_state(alu_io_resp_bits_fflags_bits_uop_iw_state),
    .io_resp_bits_fflags_bits_uop_iw_p1_poisoned(alu_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflags_bits_uop_iw_p2_poisoned(alu_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflags_bits_uop_is_br(alu_io_resp_bits_fflags_bits_uop_is_br),
    .io_resp_bits_fflags_bits_uop_is_jalr(alu_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_resp_bits_fflags_bits_uop_is_jal(alu_io_resp_bits_fflags_bits_uop_is_jal),
    .io_resp_bits_fflags_bits_uop_is_sfb(alu_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_resp_bits_fflags_bits_uop_br_mask(alu_io_resp_bits_fflags_bits_uop_br_mask),
    .io_resp_bits_fflags_bits_uop_br_tag(alu_io_resp_bits_fflags_bits_uop_br_tag),
    .io_resp_bits_fflags_bits_uop_ftq_idx(alu_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_resp_bits_fflags_bits_uop_edge_inst(alu_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_resp_bits_fflags_bits_uop_pc_lob(alu_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_resp_bits_fflags_bits_uop_taken(alu_io_resp_bits_fflags_bits_uop_taken),
    .io_resp_bits_fflags_bits_uop_imm_packed(alu_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_resp_bits_fflags_bits_uop_csr_addr(alu_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_resp_bits_fflags_bits_uop_rob_idx(alu_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_resp_bits_fflags_bits_uop_ldq_idx(alu_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_resp_bits_fflags_bits_uop_stq_idx(alu_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_resp_bits_fflags_bits_uop_rxq_idx(alu_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_resp_bits_fflags_bits_uop_pdst(alu_io_resp_bits_fflags_bits_uop_pdst),
    .io_resp_bits_fflags_bits_uop_prs1(alu_io_resp_bits_fflags_bits_uop_prs1),
    .io_resp_bits_fflags_bits_uop_prs2(alu_io_resp_bits_fflags_bits_uop_prs2),
    .io_resp_bits_fflags_bits_uop_prs3(alu_io_resp_bits_fflags_bits_uop_prs3),
    .io_resp_bits_fflags_bits_uop_ppred(alu_io_resp_bits_fflags_bits_uop_ppred),
    .io_resp_bits_fflags_bits_uop_prs1_busy(alu_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_resp_bits_fflags_bits_uop_prs2_busy(alu_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_resp_bits_fflags_bits_uop_prs3_busy(alu_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_resp_bits_fflags_bits_uop_ppred_busy(alu_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_resp_bits_fflags_bits_uop_stale_pdst(alu_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_resp_bits_fflags_bits_uop_exception(alu_io_resp_bits_fflags_bits_uop_exception),
    .io_resp_bits_fflags_bits_uop_exc_cause(alu_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_resp_bits_fflags_bits_uop_bypassable(alu_io_resp_bits_fflags_bits_uop_bypassable),
    .io_resp_bits_fflags_bits_uop_mem_cmd(alu_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_resp_bits_fflags_bits_uop_mem_size(alu_io_resp_bits_fflags_bits_uop_mem_size),
    .io_resp_bits_fflags_bits_uop_mem_signed(alu_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_resp_bits_fflags_bits_uop_is_fence(alu_io_resp_bits_fflags_bits_uop_is_fence),
    .io_resp_bits_fflags_bits_uop_is_fencei(alu_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_resp_bits_fflags_bits_uop_is_amo(alu_io_resp_bits_fflags_bits_uop_is_amo),
    .io_resp_bits_fflags_bits_uop_uses_ldq(alu_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_resp_bits_fflags_bits_uop_uses_stq(alu_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_resp_bits_fflags_bits_uop_is_sys_pc2epc(alu_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflags_bits_uop_is_unique(alu_io_resp_bits_fflags_bits_uop_is_unique),
    .io_resp_bits_fflags_bits_uop_flush_on_commit(alu_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_resp_bits_fflags_bits_uop_ldst_is_rs1(alu_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflags_bits_uop_ldst(alu_io_resp_bits_fflags_bits_uop_ldst),
    .io_resp_bits_fflags_bits_uop_lrs1(alu_io_resp_bits_fflags_bits_uop_lrs1),
    .io_resp_bits_fflags_bits_uop_lrs2(alu_io_resp_bits_fflags_bits_uop_lrs2),
    .io_resp_bits_fflags_bits_uop_lrs3(alu_io_resp_bits_fflags_bits_uop_lrs3),
    .io_resp_bits_fflags_bits_uop_ldst_val(alu_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_resp_bits_fflags_bits_uop_dst_rtype(alu_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_resp_bits_fflags_bits_uop_lrs1_rtype(alu_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_resp_bits_fflags_bits_uop_lrs2_rtype(alu_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_resp_bits_fflags_bits_uop_frs3_en(alu_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_resp_bits_fflags_bits_uop_fp_val(alu_io_resp_bits_fflags_bits_uop_fp_val),
    .io_resp_bits_fflags_bits_uop_fp_single(alu_io_resp_bits_fflags_bits_uop_fp_single),
    .io_resp_bits_fflags_bits_uop_xcpt_pf_if(alu_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ae_if(alu_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ma_if(alu_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflags_bits_uop_bp_debug_if(alu_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_resp_bits_fflags_bits_uop_bp_xcpt_if(alu_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflags_bits_uop_debug_fsrc(alu_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_resp_bits_fflags_bits_uop_debug_tsrc(alu_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_resp_bits_fflags_bits_flags(alu_io_resp_bits_fflags_bits_flags),
    .io_resp_bits_addr(alu_io_resp_bits_addr),
    .io_resp_bits_mxcpt_valid(alu_io_resp_bits_mxcpt_valid),
    .io_resp_bits_mxcpt_bits(alu_io_resp_bits_mxcpt_bits),
    .io_resp_bits_sfence_valid(alu_io_resp_bits_sfence_valid),
    .io_resp_bits_sfence_bits_rs1(alu_io_resp_bits_sfence_bits_rs1),
    .io_resp_bits_sfence_bits_rs2(alu_io_resp_bits_sfence_bits_rs2),
    .io_resp_bits_sfence_bits_addr(alu_io_resp_bits_sfence_bits_addr),
    .io_resp_bits_sfence_bits_asid(alu_io_resp_bits_sfence_bits_asid),
    .io_brupdate_b1_resolve_mask(alu_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(alu_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(alu_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(alu_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(alu_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(alu_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(alu_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(alu_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(alu_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(alu_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(alu_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(alu_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(alu_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(alu_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(alu_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(alu_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(alu_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(alu_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(alu_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(alu_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(alu_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(alu_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(alu_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(alu_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(alu_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(alu_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(alu_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(alu_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(alu_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(alu_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(alu_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(alu_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(alu_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(alu_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(alu_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(alu_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(alu_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(alu_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(alu_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(alu_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(alu_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(alu_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(alu_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(alu_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(alu_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(alu_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(alu_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(alu_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(alu_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(alu_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(alu_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(alu_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(alu_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(alu_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(alu_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(alu_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(alu_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(alu_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(alu_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(alu_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(alu_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(alu_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(alu_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(alu_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(alu_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(alu_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(alu_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(alu_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(alu_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(alu_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(alu_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(alu_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(alu_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(alu_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(alu_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(alu_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(alu_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(alu_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(alu_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(alu_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(alu_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(alu_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(alu_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(alu_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(alu_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(alu_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(alu_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(alu_io_brupdate_b2_target_offset),
    .io_bypass_0_valid(alu_io_bypass_0_valid),
    .io_bypass_0_bits_uop_uopc(alu_io_bypass_0_bits_uop_uopc),
    .io_bypass_0_bits_uop_inst(alu_io_bypass_0_bits_uop_inst),
    .io_bypass_0_bits_uop_debug_inst(alu_io_bypass_0_bits_uop_debug_inst),
    .io_bypass_0_bits_uop_is_rvc(alu_io_bypass_0_bits_uop_is_rvc),
    .io_bypass_0_bits_uop_debug_pc(alu_io_bypass_0_bits_uop_debug_pc),
    .io_bypass_0_bits_uop_iq_type(alu_io_bypass_0_bits_uop_iq_type),
    .io_bypass_0_bits_uop_fu_code(alu_io_bypass_0_bits_uop_fu_code),
    .io_bypass_0_bits_uop_ctrl_br_type(alu_io_bypass_0_bits_uop_ctrl_br_type),
    .io_bypass_0_bits_uop_ctrl_op1_sel(alu_io_bypass_0_bits_uop_ctrl_op1_sel),
    .io_bypass_0_bits_uop_ctrl_op2_sel(alu_io_bypass_0_bits_uop_ctrl_op2_sel),
    .io_bypass_0_bits_uop_ctrl_imm_sel(alu_io_bypass_0_bits_uop_ctrl_imm_sel),
    .io_bypass_0_bits_uop_ctrl_op_fcn(alu_io_bypass_0_bits_uop_ctrl_op_fcn),
    .io_bypass_0_bits_uop_ctrl_fcn_dw(alu_io_bypass_0_bits_uop_ctrl_fcn_dw),
    .io_bypass_0_bits_uop_ctrl_csr_cmd(alu_io_bypass_0_bits_uop_ctrl_csr_cmd),
    .io_bypass_0_bits_uop_ctrl_is_load(alu_io_bypass_0_bits_uop_ctrl_is_load),
    .io_bypass_0_bits_uop_ctrl_is_sta(alu_io_bypass_0_bits_uop_ctrl_is_sta),
    .io_bypass_0_bits_uop_ctrl_is_std(alu_io_bypass_0_bits_uop_ctrl_is_std),
    .io_bypass_0_bits_uop_iw_state(alu_io_bypass_0_bits_uop_iw_state),
    .io_bypass_0_bits_uop_iw_p1_poisoned(alu_io_bypass_0_bits_uop_iw_p1_poisoned),
    .io_bypass_0_bits_uop_iw_p2_poisoned(alu_io_bypass_0_bits_uop_iw_p2_poisoned),
    .io_bypass_0_bits_uop_is_br(alu_io_bypass_0_bits_uop_is_br),
    .io_bypass_0_bits_uop_is_jalr(alu_io_bypass_0_bits_uop_is_jalr),
    .io_bypass_0_bits_uop_is_jal(alu_io_bypass_0_bits_uop_is_jal),
    .io_bypass_0_bits_uop_is_sfb(alu_io_bypass_0_bits_uop_is_sfb),
    .io_bypass_0_bits_uop_br_mask(alu_io_bypass_0_bits_uop_br_mask),
    .io_bypass_0_bits_uop_br_tag(alu_io_bypass_0_bits_uop_br_tag),
    .io_bypass_0_bits_uop_ftq_idx(alu_io_bypass_0_bits_uop_ftq_idx),
    .io_bypass_0_bits_uop_edge_inst(alu_io_bypass_0_bits_uop_edge_inst),
    .io_bypass_0_bits_uop_pc_lob(alu_io_bypass_0_bits_uop_pc_lob),
    .io_bypass_0_bits_uop_taken(alu_io_bypass_0_bits_uop_taken),
    .io_bypass_0_bits_uop_imm_packed(alu_io_bypass_0_bits_uop_imm_packed),
    .io_bypass_0_bits_uop_csr_addr(alu_io_bypass_0_bits_uop_csr_addr),
    .io_bypass_0_bits_uop_rob_idx(alu_io_bypass_0_bits_uop_rob_idx),
    .io_bypass_0_bits_uop_ldq_idx(alu_io_bypass_0_bits_uop_ldq_idx),
    .io_bypass_0_bits_uop_stq_idx(alu_io_bypass_0_bits_uop_stq_idx),
    .io_bypass_0_bits_uop_rxq_idx(alu_io_bypass_0_bits_uop_rxq_idx),
    .io_bypass_0_bits_uop_pdst(alu_io_bypass_0_bits_uop_pdst),
    .io_bypass_0_bits_uop_prs1(alu_io_bypass_0_bits_uop_prs1),
    .io_bypass_0_bits_uop_prs2(alu_io_bypass_0_bits_uop_prs2),
    .io_bypass_0_bits_uop_prs3(alu_io_bypass_0_bits_uop_prs3),
    .io_bypass_0_bits_uop_ppred(alu_io_bypass_0_bits_uop_ppred),
    .io_bypass_0_bits_uop_prs1_busy(alu_io_bypass_0_bits_uop_prs1_busy),
    .io_bypass_0_bits_uop_prs2_busy(alu_io_bypass_0_bits_uop_prs2_busy),
    .io_bypass_0_bits_uop_prs3_busy(alu_io_bypass_0_bits_uop_prs3_busy),
    .io_bypass_0_bits_uop_ppred_busy(alu_io_bypass_0_bits_uop_ppred_busy),
    .io_bypass_0_bits_uop_stale_pdst(alu_io_bypass_0_bits_uop_stale_pdst),
    .io_bypass_0_bits_uop_exception(alu_io_bypass_0_bits_uop_exception),
    .io_bypass_0_bits_uop_exc_cause(alu_io_bypass_0_bits_uop_exc_cause),
    .io_bypass_0_bits_uop_bypassable(alu_io_bypass_0_bits_uop_bypassable),
    .io_bypass_0_bits_uop_mem_cmd(alu_io_bypass_0_bits_uop_mem_cmd),
    .io_bypass_0_bits_uop_mem_size(alu_io_bypass_0_bits_uop_mem_size),
    .io_bypass_0_bits_uop_mem_signed(alu_io_bypass_0_bits_uop_mem_signed),
    .io_bypass_0_bits_uop_is_fence(alu_io_bypass_0_bits_uop_is_fence),
    .io_bypass_0_bits_uop_is_fencei(alu_io_bypass_0_bits_uop_is_fencei),
    .io_bypass_0_bits_uop_is_amo(alu_io_bypass_0_bits_uop_is_amo),
    .io_bypass_0_bits_uop_uses_ldq(alu_io_bypass_0_bits_uop_uses_ldq),
    .io_bypass_0_bits_uop_uses_stq(alu_io_bypass_0_bits_uop_uses_stq),
    .io_bypass_0_bits_uop_is_sys_pc2epc(alu_io_bypass_0_bits_uop_is_sys_pc2epc),
    .io_bypass_0_bits_uop_is_unique(alu_io_bypass_0_bits_uop_is_unique),
    .io_bypass_0_bits_uop_flush_on_commit(alu_io_bypass_0_bits_uop_flush_on_commit),
    .io_bypass_0_bits_uop_ldst_is_rs1(alu_io_bypass_0_bits_uop_ldst_is_rs1),
    .io_bypass_0_bits_uop_ldst(alu_io_bypass_0_bits_uop_ldst),
    .io_bypass_0_bits_uop_lrs1(alu_io_bypass_0_bits_uop_lrs1),
    .io_bypass_0_bits_uop_lrs2(alu_io_bypass_0_bits_uop_lrs2),
    .io_bypass_0_bits_uop_lrs3(alu_io_bypass_0_bits_uop_lrs3),
    .io_bypass_0_bits_uop_ldst_val(alu_io_bypass_0_bits_uop_ldst_val),
    .io_bypass_0_bits_uop_dst_rtype(alu_io_bypass_0_bits_uop_dst_rtype),
    .io_bypass_0_bits_uop_lrs1_rtype(alu_io_bypass_0_bits_uop_lrs1_rtype),
    .io_bypass_0_bits_uop_lrs2_rtype(alu_io_bypass_0_bits_uop_lrs2_rtype),
    .io_bypass_0_bits_uop_frs3_en(alu_io_bypass_0_bits_uop_frs3_en),
    .io_bypass_0_bits_uop_fp_val(alu_io_bypass_0_bits_uop_fp_val),
    .io_bypass_0_bits_uop_fp_single(alu_io_bypass_0_bits_uop_fp_single),
    .io_bypass_0_bits_uop_xcpt_pf_if(alu_io_bypass_0_bits_uop_xcpt_pf_if),
    .io_bypass_0_bits_uop_xcpt_ae_if(alu_io_bypass_0_bits_uop_xcpt_ae_if),
    .io_bypass_0_bits_uop_xcpt_ma_if(alu_io_bypass_0_bits_uop_xcpt_ma_if),
    .io_bypass_0_bits_uop_bp_debug_if(alu_io_bypass_0_bits_uop_bp_debug_if),
    .io_bypass_0_bits_uop_bp_xcpt_if(alu_io_bypass_0_bits_uop_bp_xcpt_if),
    .io_bypass_0_bits_uop_debug_fsrc(alu_io_bypass_0_bits_uop_debug_fsrc),
    .io_bypass_0_bits_uop_debug_tsrc(alu_io_bypass_0_bits_uop_debug_tsrc),
    .io_bypass_0_bits_data(alu_io_bypass_0_bits_data),
    .io_bypass_0_bits_predicated(alu_io_bypass_0_bits_predicated),
    .io_bypass_0_bits_fflags_valid(alu_io_bypass_0_bits_fflags_valid),
    .io_bypass_0_bits_fflags_bits_uop_uopc(alu_io_bypass_0_bits_fflags_bits_uop_uopc),
    .io_bypass_0_bits_fflags_bits_uop_inst(alu_io_bypass_0_bits_fflags_bits_uop_inst),
    .io_bypass_0_bits_fflags_bits_uop_debug_inst(alu_io_bypass_0_bits_fflags_bits_uop_debug_inst),
    .io_bypass_0_bits_fflags_bits_uop_is_rvc(alu_io_bypass_0_bits_fflags_bits_uop_is_rvc),
    .io_bypass_0_bits_fflags_bits_uop_debug_pc(alu_io_bypass_0_bits_fflags_bits_uop_debug_pc),
    .io_bypass_0_bits_fflags_bits_uop_iq_type(alu_io_bypass_0_bits_fflags_bits_uop_iq_type),
    .io_bypass_0_bits_fflags_bits_uop_fu_code(alu_io_bypass_0_bits_fflags_bits_uop_fu_code),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_br_type(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_br_type),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_is_load(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_load),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta),
    .io_bypass_0_bits_fflags_bits_uop_ctrl_is_std(alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_std),
    .io_bypass_0_bits_fflags_bits_uop_iw_state(alu_io_bypass_0_bits_fflags_bits_uop_iw_state),
    .io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned(alu_io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned(alu_io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_bypass_0_bits_fflags_bits_uop_is_br(alu_io_bypass_0_bits_fflags_bits_uop_is_br),
    .io_bypass_0_bits_fflags_bits_uop_is_jalr(alu_io_bypass_0_bits_fflags_bits_uop_is_jalr),
    .io_bypass_0_bits_fflags_bits_uop_is_jal(alu_io_bypass_0_bits_fflags_bits_uop_is_jal),
    .io_bypass_0_bits_fflags_bits_uop_is_sfb(alu_io_bypass_0_bits_fflags_bits_uop_is_sfb),
    .io_bypass_0_bits_fflags_bits_uop_br_mask(alu_io_bypass_0_bits_fflags_bits_uop_br_mask),
    .io_bypass_0_bits_fflags_bits_uop_br_tag(alu_io_bypass_0_bits_fflags_bits_uop_br_tag),
    .io_bypass_0_bits_fflags_bits_uop_ftq_idx(alu_io_bypass_0_bits_fflags_bits_uop_ftq_idx),
    .io_bypass_0_bits_fflags_bits_uop_edge_inst(alu_io_bypass_0_bits_fflags_bits_uop_edge_inst),
    .io_bypass_0_bits_fflags_bits_uop_pc_lob(alu_io_bypass_0_bits_fflags_bits_uop_pc_lob),
    .io_bypass_0_bits_fflags_bits_uop_taken(alu_io_bypass_0_bits_fflags_bits_uop_taken),
    .io_bypass_0_bits_fflags_bits_uop_imm_packed(alu_io_bypass_0_bits_fflags_bits_uop_imm_packed),
    .io_bypass_0_bits_fflags_bits_uop_csr_addr(alu_io_bypass_0_bits_fflags_bits_uop_csr_addr),
    .io_bypass_0_bits_fflags_bits_uop_rob_idx(alu_io_bypass_0_bits_fflags_bits_uop_rob_idx),
    .io_bypass_0_bits_fflags_bits_uop_ldq_idx(alu_io_bypass_0_bits_fflags_bits_uop_ldq_idx),
    .io_bypass_0_bits_fflags_bits_uop_stq_idx(alu_io_bypass_0_bits_fflags_bits_uop_stq_idx),
    .io_bypass_0_bits_fflags_bits_uop_rxq_idx(alu_io_bypass_0_bits_fflags_bits_uop_rxq_idx),
    .io_bypass_0_bits_fflags_bits_uop_pdst(alu_io_bypass_0_bits_fflags_bits_uop_pdst),
    .io_bypass_0_bits_fflags_bits_uop_prs1(alu_io_bypass_0_bits_fflags_bits_uop_prs1),
    .io_bypass_0_bits_fflags_bits_uop_prs2(alu_io_bypass_0_bits_fflags_bits_uop_prs2),
    .io_bypass_0_bits_fflags_bits_uop_prs3(alu_io_bypass_0_bits_fflags_bits_uop_prs3),
    .io_bypass_0_bits_fflags_bits_uop_ppred(alu_io_bypass_0_bits_fflags_bits_uop_ppred),
    .io_bypass_0_bits_fflags_bits_uop_prs1_busy(alu_io_bypass_0_bits_fflags_bits_uop_prs1_busy),
    .io_bypass_0_bits_fflags_bits_uop_prs2_busy(alu_io_bypass_0_bits_fflags_bits_uop_prs2_busy),
    .io_bypass_0_bits_fflags_bits_uop_prs3_busy(alu_io_bypass_0_bits_fflags_bits_uop_prs3_busy),
    .io_bypass_0_bits_fflags_bits_uop_ppred_busy(alu_io_bypass_0_bits_fflags_bits_uop_ppred_busy),
    .io_bypass_0_bits_fflags_bits_uop_stale_pdst(alu_io_bypass_0_bits_fflags_bits_uop_stale_pdst),
    .io_bypass_0_bits_fflags_bits_uop_exception(alu_io_bypass_0_bits_fflags_bits_uop_exception),
    .io_bypass_0_bits_fflags_bits_uop_exc_cause(alu_io_bypass_0_bits_fflags_bits_uop_exc_cause),
    .io_bypass_0_bits_fflags_bits_uop_bypassable(alu_io_bypass_0_bits_fflags_bits_uop_bypassable),
    .io_bypass_0_bits_fflags_bits_uop_mem_cmd(alu_io_bypass_0_bits_fflags_bits_uop_mem_cmd),
    .io_bypass_0_bits_fflags_bits_uop_mem_size(alu_io_bypass_0_bits_fflags_bits_uop_mem_size),
    .io_bypass_0_bits_fflags_bits_uop_mem_signed(alu_io_bypass_0_bits_fflags_bits_uop_mem_signed),
    .io_bypass_0_bits_fflags_bits_uop_is_fence(alu_io_bypass_0_bits_fflags_bits_uop_is_fence),
    .io_bypass_0_bits_fflags_bits_uop_is_fencei(alu_io_bypass_0_bits_fflags_bits_uop_is_fencei),
    .io_bypass_0_bits_fflags_bits_uop_is_amo(alu_io_bypass_0_bits_fflags_bits_uop_is_amo),
    .io_bypass_0_bits_fflags_bits_uop_uses_ldq(alu_io_bypass_0_bits_fflags_bits_uop_uses_ldq),
    .io_bypass_0_bits_fflags_bits_uop_uses_stq(alu_io_bypass_0_bits_fflags_bits_uop_uses_stq),
    .io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc(alu_io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_bypass_0_bits_fflags_bits_uop_is_unique(alu_io_bypass_0_bits_fflags_bits_uop_is_unique),
    .io_bypass_0_bits_fflags_bits_uop_flush_on_commit(alu_io_bypass_0_bits_fflags_bits_uop_flush_on_commit),
    .io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1(alu_io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1),
    .io_bypass_0_bits_fflags_bits_uop_ldst(alu_io_bypass_0_bits_fflags_bits_uop_ldst),
    .io_bypass_0_bits_fflags_bits_uop_lrs1(alu_io_bypass_0_bits_fflags_bits_uop_lrs1),
    .io_bypass_0_bits_fflags_bits_uop_lrs2(alu_io_bypass_0_bits_fflags_bits_uop_lrs2),
    .io_bypass_0_bits_fflags_bits_uop_lrs3(alu_io_bypass_0_bits_fflags_bits_uop_lrs3),
    .io_bypass_0_bits_fflags_bits_uop_ldst_val(alu_io_bypass_0_bits_fflags_bits_uop_ldst_val),
    .io_bypass_0_bits_fflags_bits_uop_dst_rtype(alu_io_bypass_0_bits_fflags_bits_uop_dst_rtype),
    .io_bypass_0_bits_fflags_bits_uop_lrs1_rtype(alu_io_bypass_0_bits_fflags_bits_uop_lrs1_rtype),
    .io_bypass_0_bits_fflags_bits_uop_lrs2_rtype(alu_io_bypass_0_bits_fflags_bits_uop_lrs2_rtype),
    .io_bypass_0_bits_fflags_bits_uop_frs3_en(alu_io_bypass_0_bits_fflags_bits_uop_frs3_en),
    .io_bypass_0_bits_fflags_bits_uop_fp_val(alu_io_bypass_0_bits_fflags_bits_uop_fp_val),
    .io_bypass_0_bits_fflags_bits_uop_fp_single(alu_io_bypass_0_bits_fflags_bits_uop_fp_single),
    .io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if(alu_io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if),
    .io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if(alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if),
    .io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if(alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if),
    .io_bypass_0_bits_fflags_bits_uop_bp_debug_if(alu_io_bypass_0_bits_fflags_bits_uop_bp_debug_if),
    .io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if(alu_io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if),
    .io_bypass_0_bits_fflags_bits_uop_debug_fsrc(alu_io_bypass_0_bits_fflags_bits_uop_debug_fsrc),
    .io_bypass_0_bits_fflags_bits_uop_debug_tsrc(alu_io_bypass_0_bits_fflags_bits_uop_debug_tsrc),
    .io_bypass_0_bits_fflags_bits_flags(alu_io_bypass_0_bits_fflags_bits_flags),
    .io_brinfo_uop_uopc(alu_io_brinfo_uop_uopc),
    .io_brinfo_uop_inst(alu_io_brinfo_uop_inst),
    .io_brinfo_uop_debug_inst(alu_io_brinfo_uop_debug_inst),
    .io_brinfo_uop_is_rvc(alu_io_brinfo_uop_is_rvc),
    .io_brinfo_uop_debug_pc(alu_io_brinfo_uop_debug_pc),
    .io_brinfo_uop_iq_type(alu_io_brinfo_uop_iq_type),
    .io_brinfo_uop_fu_code(alu_io_brinfo_uop_fu_code),
    .io_brinfo_uop_ctrl_br_type(alu_io_brinfo_uop_ctrl_br_type),
    .io_brinfo_uop_ctrl_op1_sel(alu_io_brinfo_uop_ctrl_op1_sel),
    .io_brinfo_uop_ctrl_op2_sel(alu_io_brinfo_uop_ctrl_op2_sel),
    .io_brinfo_uop_ctrl_imm_sel(alu_io_brinfo_uop_ctrl_imm_sel),
    .io_brinfo_uop_ctrl_op_fcn(alu_io_brinfo_uop_ctrl_op_fcn),
    .io_brinfo_uop_ctrl_fcn_dw(alu_io_brinfo_uop_ctrl_fcn_dw),
    .io_brinfo_uop_ctrl_csr_cmd(alu_io_brinfo_uop_ctrl_csr_cmd),
    .io_brinfo_uop_ctrl_is_load(alu_io_brinfo_uop_ctrl_is_load),
    .io_brinfo_uop_ctrl_is_sta(alu_io_brinfo_uop_ctrl_is_sta),
    .io_brinfo_uop_ctrl_is_std(alu_io_brinfo_uop_ctrl_is_std),
    .io_brinfo_uop_iw_state(alu_io_brinfo_uop_iw_state),
    .io_brinfo_uop_iw_p1_poisoned(alu_io_brinfo_uop_iw_p1_poisoned),
    .io_brinfo_uop_iw_p2_poisoned(alu_io_brinfo_uop_iw_p2_poisoned),
    .io_brinfo_uop_is_br(alu_io_brinfo_uop_is_br),
    .io_brinfo_uop_is_jalr(alu_io_brinfo_uop_is_jalr),
    .io_brinfo_uop_is_jal(alu_io_brinfo_uop_is_jal),
    .io_brinfo_uop_is_sfb(alu_io_brinfo_uop_is_sfb),
    .io_brinfo_uop_br_mask(alu_io_brinfo_uop_br_mask),
    .io_brinfo_uop_br_tag(alu_io_brinfo_uop_br_tag),
    .io_brinfo_uop_ftq_idx(alu_io_brinfo_uop_ftq_idx),
    .io_brinfo_uop_edge_inst(alu_io_brinfo_uop_edge_inst),
    .io_brinfo_uop_pc_lob(alu_io_brinfo_uop_pc_lob),
    .io_brinfo_uop_taken(alu_io_brinfo_uop_taken),
    .io_brinfo_uop_imm_packed(alu_io_brinfo_uop_imm_packed),
    .io_brinfo_uop_csr_addr(alu_io_brinfo_uop_csr_addr),
    .io_brinfo_uop_rob_idx(alu_io_brinfo_uop_rob_idx),
    .io_brinfo_uop_ldq_idx(alu_io_brinfo_uop_ldq_idx),
    .io_brinfo_uop_stq_idx(alu_io_brinfo_uop_stq_idx),
    .io_brinfo_uop_rxq_idx(alu_io_brinfo_uop_rxq_idx),
    .io_brinfo_uop_pdst(alu_io_brinfo_uop_pdst),
    .io_brinfo_uop_prs1(alu_io_brinfo_uop_prs1),
    .io_brinfo_uop_prs2(alu_io_brinfo_uop_prs2),
    .io_brinfo_uop_prs3(alu_io_brinfo_uop_prs3),
    .io_brinfo_uop_ppred(alu_io_brinfo_uop_ppred),
    .io_brinfo_uop_prs1_busy(alu_io_brinfo_uop_prs1_busy),
    .io_brinfo_uop_prs2_busy(alu_io_brinfo_uop_prs2_busy),
    .io_brinfo_uop_prs3_busy(alu_io_brinfo_uop_prs3_busy),
    .io_brinfo_uop_ppred_busy(alu_io_brinfo_uop_ppred_busy),
    .io_brinfo_uop_stale_pdst(alu_io_brinfo_uop_stale_pdst),
    .io_brinfo_uop_exception(alu_io_brinfo_uop_exception),
    .io_brinfo_uop_exc_cause(alu_io_brinfo_uop_exc_cause),
    .io_brinfo_uop_bypassable(alu_io_brinfo_uop_bypassable),
    .io_brinfo_uop_mem_cmd(alu_io_brinfo_uop_mem_cmd),
    .io_brinfo_uop_mem_size(alu_io_brinfo_uop_mem_size),
    .io_brinfo_uop_mem_signed(alu_io_brinfo_uop_mem_signed),
    .io_brinfo_uop_is_fence(alu_io_brinfo_uop_is_fence),
    .io_brinfo_uop_is_fencei(alu_io_brinfo_uop_is_fencei),
    .io_brinfo_uop_is_amo(alu_io_brinfo_uop_is_amo),
    .io_brinfo_uop_uses_ldq(alu_io_brinfo_uop_uses_ldq),
    .io_brinfo_uop_uses_stq(alu_io_brinfo_uop_uses_stq),
    .io_brinfo_uop_is_sys_pc2epc(alu_io_brinfo_uop_is_sys_pc2epc),
    .io_brinfo_uop_is_unique(alu_io_brinfo_uop_is_unique),
    .io_brinfo_uop_flush_on_commit(alu_io_brinfo_uop_flush_on_commit),
    .io_brinfo_uop_ldst_is_rs1(alu_io_brinfo_uop_ldst_is_rs1),
    .io_brinfo_uop_ldst(alu_io_brinfo_uop_ldst),
    .io_brinfo_uop_lrs1(alu_io_brinfo_uop_lrs1),
    .io_brinfo_uop_lrs2(alu_io_brinfo_uop_lrs2),
    .io_brinfo_uop_lrs3(alu_io_brinfo_uop_lrs3),
    .io_brinfo_uop_ldst_val(alu_io_brinfo_uop_ldst_val),
    .io_brinfo_uop_dst_rtype(alu_io_brinfo_uop_dst_rtype),
    .io_brinfo_uop_lrs1_rtype(alu_io_brinfo_uop_lrs1_rtype),
    .io_brinfo_uop_lrs2_rtype(alu_io_brinfo_uop_lrs2_rtype),
    .io_brinfo_uop_frs3_en(alu_io_brinfo_uop_frs3_en),
    .io_brinfo_uop_fp_val(alu_io_brinfo_uop_fp_val),
    .io_brinfo_uop_fp_single(alu_io_brinfo_uop_fp_single),
    .io_brinfo_uop_xcpt_pf_if(alu_io_brinfo_uop_xcpt_pf_if),
    .io_brinfo_uop_xcpt_ae_if(alu_io_brinfo_uop_xcpt_ae_if),
    .io_brinfo_uop_xcpt_ma_if(alu_io_brinfo_uop_xcpt_ma_if),
    .io_brinfo_uop_bp_debug_if(alu_io_brinfo_uop_bp_debug_if),
    .io_brinfo_uop_bp_xcpt_if(alu_io_brinfo_uop_bp_xcpt_if),
    .io_brinfo_uop_debug_fsrc(alu_io_brinfo_uop_debug_fsrc),
    .io_brinfo_uop_debug_tsrc(alu_io_brinfo_uop_debug_tsrc),
    .io_brinfo_valid(alu_io_brinfo_valid),
    .io_brinfo_mispredict(alu_io_brinfo_mispredict),
    .io_brinfo_taken(alu_io_brinfo_taken),
    .io_brinfo_cfi_type(alu_io_brinfo_cfi_type),
    .io_brinfo_pc_sel(alu_io_brinfo_pc_sel),
    .io_brinfo_jalr_target(alu_io_brinfo_jalr_target),
    .io_brinfo_target_offset(alu_io_brinfo_target_offset)
  );
  DivUnit div ( // @[execution-unit.scala 357:17]
    .clock(div_clock),
    .reset(div_reset),
    .io_req_ready(div_io_req_ready),
    .io_req_valid(div_io_req_valid),
    .io_req_bits_uop_uopc(div_io_req_bits_uop_uopc),
    .io_req_bits_uop_inst(div_io_req_bits_uop_inst),
    .io_req_bits_uop_debug_inst(div_io_req_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc(div_io_req_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc(div_io_req_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type(div_io_req_bits_uop_iq_type),
    .io_req_bits_uop_fu_code(div_io_req_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type(div_io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel(div_io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel(div_io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel(div_io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn(div_io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw(div_io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd(div_io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load(div_io_req_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta(div_io_req_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std(div_io_req_bits_uop_ctrl_is_std),
    .io_req_bits_uop_iw_state(div_io_req_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned(div_io_req_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned(div_io_req_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br(div_io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr(div_io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal(div_io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb(div_io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask(div_io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag(div_io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx(div_io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst(div_io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob(div_io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken(div_io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed(div_io_req_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr(div_io_req_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx(div_io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx(div_io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx(div_io_req_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx(div_io_req_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst(div_io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1(div_io_req_bits_uop_prs1),
    .io_req_bits_uop_prs2(div_io_req_bits_uop_prs2),
    .io_req_bits_uop_prs3(div_io_req_bits_uop_prs3),
    .io_req_bits_uop_ppred(div_io_req_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy(div_io_req_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy(div_io_req_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy(div_io_req_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy(div_io_req_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst(div_io_req_bits_uop_stale_pdst),
    .io_req_bits_uop_exception(div_io_req_bits_uop_exception),
    .io_req_bits_uop_exc_cause(div_io_req_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable(div_io_req_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd(div_io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size(div_io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed(div_io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence(div_io_req_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei(div_io_req_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo(div_io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq(div_io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq(div_io_req_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc(div_io_req_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique(div_io_req_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit(div_io_req_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1(div_io_req_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst(div_io_req_bits_uop_ldst),
    .io_req_bits_uop_lrs1(div_io_req_bits_uop_lrs1),
    .io_req_bits_uop_lrs2(div_io_req_bits_uop_lrs2),
    .io_req_bits_uop_lrs3(div_io_req_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val(div_io_req_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype(div_io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype(div_io_req_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype(div_io_req_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en(div_io_req_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val(div_io_req_bits_uop_fp_val),
    .io_req_bits_uop_fp_single(div_io_req_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if(div_io_req_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if(div_io_req_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if(div_io_req_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if(div_io_req_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if(div_io_req_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc(div_io_req_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc(div_io_req_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data(div_io_req_bits_rs1_data),
    .io_req_bits_rs2_data(div_io_req_bits_rs2_data),
    .io_req_bits_rs3_data(div_io_req_bits_rs3_data),
    .io_req_bits_pred_data(div_io_req_bits_pred_data),
    .io_req_bits_kill(div_io_req_bits_kill),
    .io_resp_ready(div_io_resp_ready),
    .io_resp_valid(div_io_resp_valid),
    .io_resp_bits_uop_uopc(div_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(div_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(div_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(div_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(div_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(div_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(div_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(div_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(div_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(div_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(div_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(div_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(div_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(div_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(div_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(div_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(div_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state(div_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(div_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(div_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(div_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(div_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(div_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(div_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(div_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(div_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(div_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(div_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(div_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(div_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(div_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(div_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(div_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(div_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(div_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(div_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(div_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(div_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(div_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(div_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(div_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(div_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(div_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(div_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(div_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(div_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(div_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(div_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(div_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(div_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(div_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(div_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(div_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(div_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(div_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(div_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(div_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(div_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(div_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(div_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(div_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(div_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(div_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(div_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(div_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(div_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(div_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(div_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(div_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(div_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(div_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(div_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(div_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(div_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(div_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(div_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(div_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(div_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(div_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_predicated(div_io_resp_bits_predicated),
    .io_resp_bits_data(div_io_resp_bits_data),
    .io_resp_bits_fflags_valid(div_io_resp_bits_fflags_valid),
    .io_resp_bits_fflags_bits_uop_uopc(div_io_resp_bits_fflags_bits_uop_uopc),
    .io_resp_bits_fflags_bits_uop_inst(div_io_resp_bits_fflags_bits_uop_inst),
    .io_resp_bits_fflags_bits_uop_debug_inst(div_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_resp_bits_fflags_bits_uop_is_rvc(div_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_resp_bits_fflags_bits_uop_debug_pc(div_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_resp_bits_fflags_bits_uop_iq_type(div_io_resp_bits_fflags_bits_uop_iq_type),
    .io_resp_bits_fflags_bits_uop_fu_code(div_io_resp_bits_fflags_bits_uop_fu_code),
    .io_resp_bits_fflags_bits_uop_ctrl_br_type(div_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_resp_bits_fflags_bits_uop_ctrl_op1_sel(div_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op2_sel(div_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_imm_sel(div_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op_fcn(div_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflags_bits_uop_ctrl_fcn_dw(div_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflags_bits_uop_ctrl_csr_cmd(div_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflags_bits_uop_ctrl_is_load(div_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_resp_bits_fflags_bits_uop_ctrl_is_sta(div_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflags_bits_uop_ctrl_is_std(div_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_resp_bits_fflags_bits_uop_iw_state(div_io_resp_bits_fflags_bits_uop_iw_state),
    .io_resp_bits_fflags_bits_uop_iw_p1_poisoned(div_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflags_bits_uop_iw_p2_poisoned(div_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflags_bits_uop_is_br(div_io_resp_bits_fflags_bits_uop_is_br),
    .io_resp_bits_fflags_bits_uop_is_jalr(div_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_resp_bits_fflags_bits_uop_is_jal(div_io_resp_bits_fflags_bits_uop_is_jal),
    .io_resp_bits_fflags_bits_uop_is_sfb(div_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_resp_bits_fflags_bits_uop_br_mask(div_io_resp_bits_fflags_bits_uop_br_mask),
    .io_resp_bits_fflags_bits_uop_br_tag(div_io_resp_bits_fflags_bits_uop_br_tag),
    .io_resp_bits_fflags_bits_uop_ftq_idx(div_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_resp_bits_fflags_bits_uop_edge_inst(div_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_resp_bits_fflags_bits_uop_pc_lob(div_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_resp_bits_fflags_bits_uop_taken(div_io_resp_bits_fflags_bits_uop_taken),
    .io_resp_bits_fflags_bits_uop_imm_packed(div_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_resp_bits_fflags_bits_uop_csr_addr(div_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_resp_bits_fflags_bits_uop_rob_idx(div_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_resp_bits_fflags_bits_uop_ldq_idx(div_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_resp_bits_fflags_bits_uop_stq_idx(div_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_resp_bits_fflags_bits_uop_rxq_idx(div_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_resp_bits_fflags_bits_uop_pdst(div_io_resp_bits_fflags_bits_uop_pdst),
    .io_resp_bits_fflags_bits_uop_prs1(div_io_resp_bits_fflags_bits_uop_prs1),
    .io_resp_bits_fflags_bits_uop_prs2(div_io_resp_bits_fflags_bits_uop_prs2),
    .io_resp_bits_fflags_bits_uop_prs3(div_io_resp_bits_fflags_bits_uop_prs3),
    .io_resp_bits_fflags_bits_uop_ppred(div_io_resp_bits_fflags_bits_uop_ppred),
    .io_resp_bits_fflags_bits_uop_prs1_busy(div_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_resp_bits_fflags_bits_uop_prs2_busy(div_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_resp_bits_fflags_bits_uop_prs3_busy(div_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_resp_bits_fflags_bits_uop_ppred_busy(div_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_resp_bits_fflags_bits_uop_stale_pdst(div_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_resp_bits_fflags_bits_uop_exception(div_io_resp_bits_fflags_bits_uop_exception),
    .io_resp_bits_fflags_bits_uop_exc_cause(div_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_resp_bits_fflags_bits_uop_bypassable(div_io_resp_bits_fflags_bits_uop_bypassable),
    .io_resp_bits_fflags_bits_uop_mem_cmd(div_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_resp_bits_fflags_bits_uop_mem_size(div_io_resp_bits_fflags_bits_uop_mem_size),
    .io_resp_bits_fflags_bits_uop_mem_signed(div_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_resp_bits_fflags_bits_uop_is_fence(div_io_resp_bits_fflags_bits_uop_is_fence),
    .io_resp_bits_fflags_bits_uop_is_fencei(div_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_resp_bits_fflags_bits_uop_is_amo(div_io_resp_bits_fflags_bits_uop_is_amo),
    .io_resp_bits_fflags_bits_uop_uses_ldq(div_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_resp_bits_fflags_bits_uop_uses_stq(div_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_resp_bits_fflags_bits_uop_is_sys_pc2epc(div_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflags_bits_uop_is_unique(div_io_resp_bits_fflags_bits_uop_is_unique),
    .io_resp_bits_fflags_bits_uop_flush_on_commit(div_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_resp_bits_fflags_bits_uop_ldst_is_rs1(div_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflags_bits_uop_ldst(div_io_resp_bits_fflags_bits_uop_ldst),
    .io_resp_bits_fflags_bits_uop_lrs1(div_io_resp_bits_fflags_bits_uop_lrs1),
    .io_resp_bits_fflags_bits_uop_lrs2(div_io_resp_bits_fflags_bits_uop_lrs2),
    .io_resp_bits_fflags_bits_uop_lrs3(div_io_resp_bits_fflags_bits_uop_lrs3),
    .io_resp_bits_fflags_bits_uop_ldst_val(div_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_resp_bits_fflags_bits_uop_dst_rtype(div_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_resp_bits_fflags_bits_uop_lrs1_rtype(div_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_resp_bits_fflags_bits_uop_lrs2_rtype(div_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_resp_bits_fflags_bits_uop_frs3_en(div_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_resp_bits_fflags_bits_uop_fp_val(div_io_resp_bits_fflags_bits_uop_fp_val),
    .io_resp_bits_fflags_bits_uop_fp_single(div_io_resp_bits_fflags_bits_uop_fp_single),
    .io_resp_bits_fflags_bits_uop_xcpt_pf_if(div_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ae_if(div_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ma_if(div_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflags_bits_uop_bp_debug_if(div_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_resp_bits_fflags_bits_uop_bp_xcpt_if(div_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflags_bits_uop_debug_fsrc(div_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_resp_bits_fflags_bits_uop_debug_tsrc(div_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_resp_bits_fflags_bits_flags(div_io_resp_bits_fflags_bits_flags),
    .io_resp_bits_addr(div_io_resp_bits_addr),
    .io_resp_bits_mxcpt_valid(div_io_resp_bits_mxcpt_valid),
    .io_resp_bits_mxcpt_bits(div_io_resp_bits_mxcpt_bits),
    .io_resp_bits_sfence_valid(div_io_resp_bits_sfence_valid),
    .io_resp_bits_sfence_bits_rs1(div_io_resp_bits_sfence_bits_rs1),
    .io_resp_bits_sfence_bits_rs2(div_io_resp_bits_sfence_bits_rs2),
    .io_resp_bits_sfence_bits_addr(div_io_resp_bits_sfence_bits_addr),
    .io_resp_bits_sfence_bits_asid(div_io_resp_bits_sfence_bits_asid),
    .io_brupdate_b1_resolve_mask(div_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(div_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(div_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(div_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(div_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(div_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(div_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(div_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(div_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(div_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(div_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(div_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(div_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(div_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(div_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(div_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(div_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(div_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(div_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(div_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(div_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(div_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(div_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(div_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(div_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(div_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(div_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(div_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(div_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(div_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(div_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(div_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(div_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(div_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(div_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(div_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(div_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(div_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(div_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(div_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(div_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(div_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(div_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(div_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(div_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(div_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(div_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(div_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(div_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(div_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(div_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(div_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(div_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(div_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(div_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(div_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(div_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(div_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(div_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(div_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(div_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(div_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(div_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(div_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(div_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(div_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(div_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(div_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(div_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(div_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(div_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(div_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(div_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(div_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(div_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(div_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(div_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(div_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(div_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(div_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(div_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(div_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(div_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(div_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(div_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(div_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(div_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(div_io_brupdate_b2_target_offset)
  );
  assign io_fu_types = _T_9 | 10'h20; // @[execution-unit.scala 253:58]
  assign io_req_ready = 1'h0;
  assign io_iresp_valid = alu_io_resp_valid | div_io_resp_valid; // @[execution-unit.scala 400:71]
  assign io_iresp_bits_uop_uopc = alu_io_resp_valid ? alu_io_resp_bits_uop_uopc : div_io_resp_bits_uop_uopc; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_inst = alu_io_resp_valid ? alu_io_resp_bits_uop_inst : div_io_resp_bits_uop_inst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_debug_inst = alu_io_resp_valid ? alu_io_resp_bits_uop_debug_inst :
    div_io_resp_bits_uop_debug_inst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_rvc = alu_io_resp_valid ? alu_io_resp_bits_uop_is_rvc : div_io_resp_bits_uop_is_rvc; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_debug_pc = alu_io_resp_valid ? alu_io_resp_bits_uop_debug_pc : div_io_resp_bits_uop_debug_pc; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_iq_type = alu_io_resp_valid ? alu_io_resp_bits_uop_iq_type : div_io_resp_bits_uop_iq_type; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_fu_code = alu_io_resp_valid ? alu_io_resp_bits_uop_fu_code : div_io_resp_bits_uop_fu_code; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_br_type = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_br_type :
    div_io_resp_bits_uop_ctrl_br_type; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_op1_sel = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_op1_sel :
    div_io_resp_bits_uop_ctrl_op1_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_op2_sel = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_op2_sel :
    div_io_resp_bits_uop_ctrl_op2_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_imm_sel = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_imm_sel :
    div_io_resp_bits_uop_ctrl_imm_sel; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_op_fcn = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_op_fcn :
    div_io_resp_bits_uop_ctrl_op_fcn; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_fcn_dw = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_fcn_dw :
    div_io_resp_bits_uop_ctrl_fcn_dw; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_csr_cmd = alu_io_resp_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 412:38]
  assign io_iresp_bits_uop_ctrl_is_load = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_is_load :
    div_io_resp_bits_uop_ctrl_is_load; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_is_sta = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_is_sta :
    div_io_resp_bits_uop_ctrl_is_sta; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ctrl_is_std = alu_io_resp_valid ? alu_io_resp_bits_uop_ctrl_is_std :
    div_io_resp_bits_uop_ctrl_is_std; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_iw_state = alu_io_resp_valid ? alu_io_resp_bits_uop_iw_state : div_io_resp_bits_uop_iw_state; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_iw_p1_poisoned = alu_io_resp_valid ? alu_io_resp_bits_uop_iw_p1_poisoned :
    div_io_resp_bits_uop_iw_p1_poisoned; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_iw_p2_poisoned = alu_io_resp_valid ? alu_io_resp_bits_uop_iw_p2_poisoned :
    div_io_resp_bits_uop_iw_p2_poisoned; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_br = alu_io_resp_valid ? alu_io_resp_bits_uop_is_br : div_io_resp_bits_uop_is_br; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_jalr = alu_io_resp_valid ? alu_io_resp_bits_uop_is_jalr : div_io_resp_bits_uop_is_jalr; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_jal = alu_io_resp_valid ? alu_io_resp_bits_uop_is_jal : div_io_resp_bits_uop_is_jal; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_sfb = alu_io_resp_valid ? alu_io_resp_bits_uop_is_sfb : div_io_resp_bits_uop_is_sfb; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_br_mask = alu_io_resp_valid ? alu_io_resp_bits_uop_br_mask : div_io_resp_bits_uop_br_mask; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_br_tag = alu_io_resp_valid ? alu_io_resp_bits_uop_br_tag : div_io_resp_bits_uop_br_tag; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ftq_idx = alu_io_resp_valid ? alu_io_resp_bits_uop_ftq_idx : div_io_resp_bits_uop_ftq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_edge_inst = alu_io_resp_valid ? alu_io_resp_bits_uop_edge_inst :
    div_io_resp_bits_uop_edge_inst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_pc_lob = alu_io_resp_valid ? alu_io_resp_bits_uop_pc_lob : div_io_resp_bits_uop_pc_lob; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_taken = alu_io_resp_valid ? alu_io_resp_bits_uop_taken : div_io_resp_bits_uop_taken; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_imm_packed = alu_io_resp_valid ? alu_io_resp_bits_uop_imm_packed :
    div_io_resp_bits_uop_imm_packed; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_csr_addr = _T_78[11:0]; // @[execution-unit.scala 411:34]
  assign io_iresp_bits_uop_rob_idx = alu_io_resp_valid ? alu_io_resp_bits_uop_rob_idx : div_io_resp_bits_uop_rob_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ldq_idx = alu_io_resp_valid ? alu_io_resp_bits_uop_ldq_idx : div_io_resp_bits_uop_ldq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_stq_idx = alu_io_resp_valid ? alu_io_resp_bits_uop_stq_idx : div_io_resp_bits_uop_stq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_rxq_idx = alu_io_resp_valid ? alu_io_resp_bits_uop_rxq_idx : div_io_resp_bits_uop_rxq_idx; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_pdst = alu_io_resp_valid ? alu_io_resp_bits_uop_pdst : div_io_resp_bits_uop_pdst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs1 = alu_io_resp_valid ? alu_io_resp_bits_uop_prs1 : div_io_resp_bits_uop_prs1; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs2 = alu_io_resp_valid ? alu_io_resp_bits_uop_prs2 : div_io_resp_bits_uop_prs2; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs3 = alu_io_resp_valid ? alu_io_resp_bits_uop_prs3 : div_io_resp_bits_uop_prs3; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ppred = alu_io_resp_valid ? alu_io_resp_bits_uop_ppred : div_io_resp_bits_uop_ppred; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs1_busy = alu_io_resp_valid ? alu_io_resp_bits_uop_prs1_busy :
    div_io_resp_bits_uop_prs1_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs2_busy = alu_io_resp_valid ? alu_io_resp_bits_uop_prs2_busy :
    div_io_resp_bits_uop_prs2_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_prs3_busy = alu_io_resp_valid ? alu_io_resp_bits_uop_prs3_busy :
    div_io_resp_bits_uop_prs3_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ppred_busy = alu_io_resp_valid ? alu_io_resp_bits_uop_ppred_busy :
    div_io_resp_bits_uop_ppred_busy; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_stale_pdst = alu_io_resp_valid ? alu_io_resp_bits_uop_stale_pdst :
    div_io_resp_bits_uop_stale_pdst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_exception = alu_io_resp_valid ? alu_io_resp_bits_uop_exception :
    div_io_resp_bits_uop_exception; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_exc_cause = alu_io_resp_valid ? alu_io_resp_bits_uop_exc_cause :
    div_io_resp_bits_uop_exc_cause; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_bypassable = alu_io_resp_valid ? alu_io_resp_bits_uop_bypassable :
    div_io_resp_bits_uop_bypassable; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_mem_cmd = alu_io_resp_valid ? alu_io_resp_bits_uop_mem_cmd : div_io_resp_bits_uop_mem_cmd; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_mem_size = alu_io_resp_valid ? alu_io_resp_bits_uop_mem_size : div_io_resp_bits_uop_mem_size; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_mem_signed = alu_io_resp_valid ? alu_io_resp_bits_uop_mem_signed :
    div_io_resp_bits_uop_mem_signed; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_fence = alu_io_resp_valid ? alu_io_resp_bits_uop_is_fence : div_io_resp_bits_uop_is_fence; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_fencei = alu_io_resp_valid ? alu_io_resp_bits_uop_is_fencei :
    div_io_resp_bits_uop_is_fencei; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_amo = alu_io_resp_valid ? alu_io_resp_bits_uop_is_amo : div_io_resp_bits_uop_is_amo; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_uses_ldq = alu_io_resp_valid ? alu_io_resp_bits_uop_uses_ldq : div_io_resp_bits_uop_uses_ldq; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_uses_stq = alu_io_resp_valid ? alu_io_resp_bits_uop_uses_stq : div_io_resp_bits_uop_uses_stq; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_sys_pc2epc = alu_io_resp_valid ? alu_io_resp_bits_uop_is_sys_pc2epc :
    div_io_resp_bits_uop_is_sys_pc2epc; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_is_unique = alu_io_resp_valid ? alu_io_resp_bits_uop_is_unique :
    div_io_resp_bits_uop_is_unique; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_flush_on_commit = alu_io_resp_valid ? alu_io_resp_bits_uop_flush_on_commit :
    div_io_resp_bits_uop_flush_on_commit; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ldst_is_rs1 = alu_io_resp_valid ? alu_io_resp_bits_uop_ldst_is_rs1 :
    div_io_resp_bits_uop_ldst_is_rs1; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ldst = alu_io_resp_valid ? alu_io_resp_bits_uop_ldst : div_io_resp_bits_uop_ldst; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_lrs1 = alu_io_resp_valid ? alu_io_resp_bits_uop_lrs1 : div_io_resp_bits_uop_lrs1; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_lrs2 = alu_io_resp_valid ? alu_io_resp_bits_uop_lrs2 : div_io_resp_bits_uop_lrs2; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_lrs3 = alu_io_resp_valid ? alu_io_resp_bits_uop_lrs3 : div_io_resp_bits_uop_lrs3; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_ldst_val = alu_io_resp_valid ? alu_io_resp_bits_uop_ldst_val : div_io_resp_bits_uop_ldst_val; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_dst_rtype = alu_io_resp_valid ? alu_io_resp_bits_uop_dst_rtype :
    div_io_resp_bits_uop_dst_rtype; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_lrs1_rtype = alu_io_resp_valid ? alu_io_resp_bits_uop_lrs1_rtype :
    div_io_resp_bits_uop_lrs1_rtype; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_lrs2_rtype = alu_io_resp_valid ? alu_io_resp_bits_uop_lrs2_rtype :
    div_io_resp_bits_uop_lrs2_rtype; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_frs3_en = alu_io_resp_valid ? alu_io_resp_bits_uop_frs3_en : div_io_resp_bits_uop_frs3_en; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_fp_val = alu_io_resp_valid ? alu_io_resp_bits_uop_fp_val : div_io_resp_bits_uop_fp_val; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_fp_single = alu_io_resp_valid ? alu_io_resp_bits_uop_fp_single :
    div_io_resp_bits_uop_fp_single; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_xcpt_pf_if = alu_io_resp_valid ? alu_io_resp_bits_uop_xcpt_pf_if :
    div_io_resp_bits_uop_xcpt_pf_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_xcpt_ae_if = alu_io_resp_valid ? alu_io_resp_bits_uop_xcpt_ae_if :
    div_io_resp_bits_uop_xcpt_ae_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_xcpt_ma_if = alu_io_resp_valid ? alu_io_resp_bits_uop_xcpt_ma_if :
    div_io_resp_bits_uop_xcpt_ma_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_bp_debug_if = alu_io_resp_valid ? alu_io_resp_bits_uop_bp_debug_if :
    div_io_resp_bits_uop_bp_debug_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_bp_xcpt_if = alu_io_resp_valid ? alu_io_resp_bits_uop_bp_xcpt_if :
    div_io_resp_bits_uop_bp_xcpt_if; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_debug_fsrc = alu_io_resp_valid ? alu_io_resp_bits_uop_debug_fsrc :
    div_io_resp_bits_uop_debug_fsrc; // @[Mux.scala 47:69]
  assign io_iresp_bits_uop_debug_tsrc = alu_io_resp_valid ? alu_io_resp_bits_uop_debug_tsrc :
    div_io_resp_bits_uop_debug_tsrc; // @[Mux.scala 47:69]
  assign io_iresp_bits_data = {{1'd0}, _T_40}; // @[Mux.scala 47:69]
  assign io_iresp_bits_predicated = alu_io_resp_valid ? alu_io_resp_bits_predicated : div_io_resp_bits_predicated; // @[Mux.scala 47:69]
  assign io_iresp_bits_fflags_valid = 1'h0; // @[execution-unit.scala 142:32]
  assign io_iresp_bits_fflags_bits_uop_uopc = 7'h0;
  assign io_iresp_bits_fflags_bits_uop_inst = 32'h0;
  assign io_iresp_bits_fflags_bits_uop_debug_inst = 32'h0;
  assign io_iresp_bits_fflags_bits_uop_is_rvc = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_debug_pc = 40'h0;
  assign io_iresp_bits_fflags_bits_uop_iq_type = 3'h0;
  assign io_iresp_bits_fflags_bits_uop_fu_code = 10'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_br_type = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_op1_sel = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_op2_sel = 3'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_imm_sel = 3'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_op_fcn = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_fcn_dw = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_csr_cmd = 3'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_is_load = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_is_sta = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ctrl_is_std = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_iw_state = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_iw_p1_poisoned = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_iw_p2_poisoned = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_br = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_jalr = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_jal = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_sfb = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_br_mask = 12'h0;
  assign io_iresp_bits_fflags_bits_uop_br_tag = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_ftq_idx = 5'h0;
  assign io_iresp_bits_fflags_bits_uop_edge_inst = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_pc_lob = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_taken = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_imm_packed = 20'h0;
  assign io_iresp_bits_fflags_bits_uop_csr_addr = 12'h0;
  assign io_iresp_bits_fflags_bits_uop_rob_idx = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_ldq_idx = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_stq_idx = 4'h0;
  assign io_iresp_bits_fflags_bits_uop_rxq_idx = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_pdst = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_prs1 = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_prs2 = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_prs3 = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_ppred = 5'h0;
  assign io_iresp_bits_fflags_bits_uop_prs1_busy = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_prs2_busy = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_prs3_busy = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ppred_busy = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_stale_pdst = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_exception = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_exc_cause = 64'h0;
  assign io_iresp_bits_fflags_bits_uop_bypassable = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_mem_cmd = 5'h0;
  assign io_iresp_bits_fflags_bits_uop_mem_size = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_mem_signed = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_fence = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_fencei = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_amo = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_uses_ldq = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_uses_stq = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_sys_pc2epc = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_is_unique = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_flush_on_commit = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ldst_is_rs1 = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_ldst = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_lrs1 = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_lrs2 = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_lrs3 = 6'h0;
  assign io_iresp_bits_fflags_bits_uop_ldst_val = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_dst_rtype = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_lrs1_rtype = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_lrs2_rtype = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_frs3_en = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_fp_val = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_fp_single = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_xcpt_pf_if = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_xcpt_ae_if = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_xcpt_ma_if = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_bp_debug_if = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_bp_xcpt_if = 1'h0;
  assign io_iresp_bits_fflags_bits_uop_debug_fsrc = 2'h0;
  assign io_iresp_bits_fflags_bits_uop_debug_tsrc = 2'h0;
  assign io_iresp_bits_fflags_bits_flags = 5'h0;
  assign io_bypass_0_valid = alu_io_bypass_0_valid; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_uopc = alu_io_bypass_0_bits_uop_uopc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_inst = alu_io_bypass_0_bits_uop_inst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_debug_inst = alu_io_bypass_0_bits_uop_debug_inst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_is_rvc = alu_io_bypass_0_bits_uop_is_rvc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_debug_pc = alu_io_bypass_0_bits_uop_debug_pc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_iq_type = alu_io_bypass_0_bits_uop_iq_type; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_fu_code = alu_io_bypass_0_bits_uop_fu_code; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ctrl_br_type = alu_io_bypass_0_bits_uop_ctrl_br_type; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ctrl_op1_sel = alu_io_bypass_0_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ctrl_op2_sel = alu_io_bypass_0_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ctrl_imm_sel = alu_io_bypass_0_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ctrl_op_fcn = alu_io_bypass_0_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ctrl_fcn_dw = alu_io_bypass_0_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ctrl_csr_cmd = alu_io_bypass_0_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ctrl_is_load = alu_io_bypass_0_bits_uop_ctrl_is_load; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ctrl_is_sta = alu_io_bypass_0_bits_uop_ctrl_is_sta; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ctrl_is_std = alu_io_bypass_0_bits_uop_ctrl_is_std; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_iw_state = alu_io_bypass_0_bits_uop_iw_state; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_iw_p1_poisoned = alu_io_bypass_0_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_iw_p2_poisoned = alu_io_bypass_0_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_is_br = alu_io_bypass_0_bits_uop_is_br; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_is_jalr = alu_io_bypass_0_bits_uop_is_jalr; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_is_jal = alu_io_bypass_0_bits_uop_is_jal; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_is_sfb = alu_io_bypass_0_bits_uop_is_sfb; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_br_mask = alu_io_bypass_0_bits_uop_br_mask; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_br_tag = alu_io_bypass_0_bits_uop_br_tag; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ftq_idx = alu_io_bypass_0_bits_uop_ftq_idx; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_edge_inst = alu_io_bypass_0_bits_uop_edge_inst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_pc_lob = alu_io_bypass_0_bits_uop_pc_lob; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_taken = alu_io_bypass_0_bits_uop_taken; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_imm_packed = alu_io_bypass_0_bits_uop_imm_packed; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_csr_addr = alu_io_bypass_0_bits_uop_csr_addr; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_rob_idx = alu_io_bypass_0_bits_uop_rob_idx; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ldq_idx = alu_io_bypass_0_bits_uop_ldq_idx; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_stq_idx = alu_io_bypass_0_bits_uop_stq_idx; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_rxq_idx = alu_io_bypass_0_bits_uop_rxq_idx; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_pdst = alu_io_bypass_0_bits_uop_pdst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_prs1 = alu_io_bypass_0_bits_uop_prs1; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_prs2 = alu_io_bypass_0_bits_uop_prs2; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_prs3 = alu_io_bypass_0_bits_uop_prs3; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ppred = alu_io_bypass_0_bits_uop_ppred; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_prs1_busy = alu_io_bypass_0_bits_uop_prs1_busy; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_prs2_busy = alu_io_bypass_0_bits_uop_prs2_busy; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_prs3_busy = alu_io_bypass_0_bits_uop_prs3_busy; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ppred_busy = alu_io_bypass_0_bits_uop_ppred_busy; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_stale_pdst = alu_io_bypass_0_bits_uop_stale_pdst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_exception = alu_io_bypass_0_bits_uop_exception; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_exc_cause = alu_io_bypass_0_bits_uop_exc_cause; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_bypassable = alu_io_bypass_0_bits_uop_bypassable; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_mem_cmd = alu_io_bypass_0_bits_uop_mem_cmd; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_mem_size = alu_io_bypass_0_bits_uop_mem_size; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_mem_signed = alu_io_bypass_0_bits_uop_mem_signed; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_is_fence = alu_io_bypass_0_bits_uop_is_fence; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_is_fencei = alu_io_bypass_0_bits_uop_is_fencei; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_is_amo = alu_io_bypass_0_bits_uop_is_amo; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_uses_ldq = alu_io_bypass_0_bits_uop_uses_ldq; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_uses_stq = alu_io_bypass_0_bits_uop_uses_stq; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_is_sys_pc2epc = alu_io_bypass_0_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_is_unique = alu_io_bypass_0_bits_uop_is_unique; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_flush_on_commit = alu_io_bypass_0_bits_uop_flush_on_commit; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ldst_is_rs1 = alu_io_bypass_0_bits_uop_ldst_is_rs1; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ldst = alu_io_bypass_0_bits_uop_ldst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_lrs1 = alu_io_bypass_0_bits_uop_lrs1; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_lrs2 = alu_io_bypass_0_bits_uop_lrs2; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_lrs3 = alu_io_bypass_0_bits_uop_lrs3; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_ldst_val = alu_io_bypass_0_bits_uop_ldst_val; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_dst_rtype = alu_io_bypass_0_bits_uop_dst_rtype; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_lrs1_rtype = alu_io_bypass_0_bits_uop_lrs1_rtype; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_lrs2_rtype = alu_io_bypass_0_bits_uop_lrs2_rtype; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_frs3_en = alu_io_bypass_0_bits_uop_frs3_en; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_fp_val = alu_io_bypass_0_bits_uop_fp_val; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_fp_single = alu_io_bypass_0_bits_uop_fp_single; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_xcpt_pf_if = alu_io_bypass_0_bits_uop_xcpt_pf_if; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_xcpt_ae_if = alu_io_bypass_0_bits_uop_xcpt_ae_if; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_xcpt_ma_if = alu_io_bypass_0_bits_uop_xcpt_ma_if; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_bp_debug_if = alu_io_bypass_0_bits_uop_bp_debug_if; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_bp_xcpt_if = alu_io_bypass_0_bits_uop_bp_xcpt_if; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_debug_fsrc = alu_io_bypass_0_bits_uop_debug_fsrc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_uop_debug_tsrc = alu_io_bypass_0_bits_uop_debug_tsrc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_data = {{1'd0}, alu_io_bypass_0_bits_data}; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_predicated = alu_io_bypass_0_bits_predicated; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_valid = alu_io_bypass_0_bits_fflags_valid; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_uopc = alu_io_bypass_0_bits_fflags_bits_uop_uopc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_inst = alu_io_bypass_0_bits_fflags_bits_uop_inst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_debug_inst = alu_io_bypass_0_bits_fflags_bits_uop_debug_inst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_rvc = alu_io_bypass_0_bits_fflags_bits_uop_is_rvc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_debug_pc = alu_io_bypass_0_bits_fflags_bits_uop_debug_pc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_iq_type = alu_io_bypass_0_bits_fflags_bits_uop_iq_type; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_fu_code = alu_io_bypass_0_bits_fflags_bits_uop_fu_code; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_br_type = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_br_type; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_is_load = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_load; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_is_std = alu_io_bypass_0_bits_fflags_bits_uop_ctrl_is_std; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_iw_state = alu_io_bypass_0_bits_fflags_bits_uop_iw_state; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned = alu_io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned = alu_io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_br = alu_io_bypass_0_bits_fflags_bits_uop_is_br; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_jalr = alu_io_bypass_0_bits_fflags_bits_uop_is_jalr; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_jal = alu_io_bypass_0_bits_fflags_bits_uop_is_jal; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_sfb = alu_io_bypass_0_bits_fflags_bits_uop_is_sfb; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_br_mask = alu_io_bypass_0_bits_fflags_bits_uop_br_mask; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_br_tag = alu_io_bypass_0_bits_fflags_bits_uop_br_tag; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ftq_idx = alu_io_bypass_0_bits_fflags_bits_uop_ftq_idx; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_edge_inst = alu_io_bypass_0_bits_fflags_bits_uop_edge_inst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_pc_lob = alu_io_bypass_0_bits_fflags_bits_uop_pc_lob; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_taken = alu_io_bypass_0_bits_fflags_bits_uop_taken; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_imm_packed = alu_io_bypass_0_bits_fflags_bits_uop_imm_packed; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_csr_addr = alu_io_bypass_0_bits_fflags_bits_uop_csr_addr; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_rob_idx = alu_io_bypass_0_bits_fflags_bits_uop_rob_idx; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ldq_idx = alu_io_bypass_0_bits_fflags_bits_uop_ldq_idx; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_stq_idx = alu_io_bypass_0_bits_fflags_bits_uop_stq_idx; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_rxq_idx = alu_io_bypass_0_bits_fflags_bits_uop_rxq_idx; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_pdst = alu_io_bypass_0_bits_fflags_bits_uop_pdst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs1 = alu_io_bypass_0_bits_fflags_bits_uop_prs1; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs2 = alu_io_bypass_0_bits_fflags_bits_uop_prs2; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs3 = alu_io_bypass_0_bits_fflags_bits_uop_prs3; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ppred = alu_io_bypass_0_bits_fflags_bits_uop_ppred; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs1_busy = alu_io_bypass_0_bits_fflags_bits_uop_prs1_busy; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs2_busy = alu_io_bypass_0_bits_fflags_bits_uop_prs2_busy; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_prs3_busy = alu_io_bypass_0_bits_fflags_bits_uop_prs3_busy; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ppred_busy = alu_io_bypass_0_bits_fflags_bits_uop_ppred_busy; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_stale_pdst = alu_io_bypass_0_bits_fflags_bits_uop_stale_pdst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_exception = alu_io_bypass_0_bits_fflags_bits_uop_exception; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_exc_cause = alu_io_bypass_0_bits_fflags_bits_uop_exc_cause; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_bypassable = alu_io_bypass_0_bits_fflags_bits_uop_bypassable; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_mem_cmd = alu_io_bypass_0_bits_fflags_bits_uop_mem_cmd; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_mem_size = alu_io_bypass_0_bits_fflags_bits_uop_mem_size; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_mem_signed = alu_io_bypass_0_bits_fflags_bits_uop_mem_signed; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_fence = alu_io_bypass_0_bits_fflags_bits_uop_is_fence; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_fencei = alu_io_bypass_0_bits_fflags_bits_uop_is_fencei; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_amo = alu_io_bypass_0_bits_fflags_bits_uop_is_amo; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_uses_ldq = alu_io_bypass_0_bits_fflags_bits_uop_uses_ldq; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_uses_stq = alu_io_bypass_0_bits_fflags_bits_uop_uses_stq; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc = alu_io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_is_unique = alu_io_bypass_0_bits_fflags_bits_uop_is_unique; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_flush_on_commit = alu_io_bypass_0_bits_fflags_bits_uop_flush_on_commit; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1 = alu_io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ldst = alu_io_bypass_0_bits_fflags_bits_uop_ldst; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_lrs1 = alu_io_bypass_0_bits_fflags_bits_uop_lrs1; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_lrs2 = alu_io_bypass_0_bits_fflags_bits_uop_lrs2; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_lrs3 = alu_io_bypass_0_bits_fflags_bits_uop_lrs3; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_ldst_val = alu_io_bypass_0_bits_fflags_bits_uop_ldst_val; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_dst_rtype = alu_io_bypass_0_bits_fflags_bits_uop_dst_rtype; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_lrs1_rtype = alu_io_bypass_0_bits_fflags_bits_uop_lrs1_rtype; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_lrs2_rtype = alu_io_bypass_0_bits_fflags_bits_uop_lrs2_rtype; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_frs3_en = alu_io_bypass_0_bits_fflags_bits_uop_frs3_en; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_fp_val = alu_io_bypass_0_bits_fflags_bits_uop_fp_val; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_fp_single = alu_io_bypass_0_bits_fflags_bits_uop_fp_single; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if = alu_io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if = alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if = alu_io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_bp_debug_if = alu_io_bypass_0_bits_fflags_bits_uop_bp_debug_if; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if = alu_io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_debug_fsrc = alu_io_bypass_0_bits_fflags_bits_uop_debug_fsrc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_uop_debug_tsrc = alu_io_bypass_0_bits_fflags_bits_uop_debug_tsrc; // @[execution-unit.scala 284:15]
  assign io_bypass_0_bits_fflags_bits_flags = alu_io_bypass_0_bits_fflags_bits_flags; // @[execution-unit.scala 284:15]
  assign io_brinfo_uop_uopc = alu_io_brinfo_uop_uopc; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_inst = alu_io_brinfo_uop_inst; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_debug_inst = alu_io_brinfo_uop_debug_inst; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_is_rvc = alu_io_brinfo_uop_is_rvc; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_debug_pc = alu_io_brinfo_uop_debug_pc; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_iq_type = alu_io_brinfo_uop_iq_type; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_fu_code = alu_io_brinfo_uop_fu_code; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ctrl_br_type = alu_io_brinfo_uop_ctrl_br_type; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ctrl_op1_sel = alu_io_brinfo_uop_ctrl_op1_sel; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ctrl_op2_sel = alu_io_brinfo_uop_ctrl_op2_sel; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ctrl_imm_sel = alu_io_brinfo_uop_ctrl_imm_sel; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ctrl_op_fcn = alu_io_brinfo_uop_ctrl_op_fcn; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ctrl_fcn_dw = alu_io_brinfo_uop_ctrl_fcn_dw; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ctrl_csr_cmd = alu_io_brinfo_uop_ctrl_csr_cmd; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ctrl_is_load = alu_io_brinfo_uop_ctrl_is_load; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ctrl_is_sta = alu_io_brinfo_uop_ctrl_is_sta; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ctrl_is_std = alu_io_brinfo_uop_ctrl_is_std; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_iw_state = alu_io_brinfo_uop_iw_state; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_iw_p1_poisoned = alu_io_brinfo_uop_iw_p1_poisoned; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_iw_p2_poisoned = alu_io_brinfo_uop_iw_p2_poisoned; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_is_br = alu_io_brinfo_uop_is_br; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_is_jalr = alu_io_brinfo_uop_is_jalr; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_is_jal = alu_io_brinfo_uop_is_jal; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_is_sfb = alu_io_brinfo_uop_is_sfb; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_br_mask = alu_io_brinfo_uop_br_mask; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_br_tag = alu_io_brinfo_uop_br_tag; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ftq_idx = alu_io_brinfo_uop_ftq_idx; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_edge_inst = alu_io_brinfo_uop_edge_inst; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_pc_lob = alu_io_brinfo_uop_pc_lob; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_taken = alu_io_brinfo_uop_taken; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_imm_packed = alu_io_brinfo_uop_imm_packed; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_csr_addr = alu_io_brinfo_uop_csr_addr; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_rob_idx = alu_io_brinfo_uop_rob_idx; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ldq_idx = alu_io_brinfo_uop_ldq_idx; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_stq_idx = alu_io_brinfo_uop_stq_idx; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_rxq_idx = alu_io_brinfo_uop_rxq_idx; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_pdst = alu_io_brinfo_uop_pdst; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_prs1 = alu_io_brinfo_uop_prs1; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_prs2 = alu_io_brinfo_uop_prs2; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_prs3 = alu_io_brinfo_uop_prs3; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ppred = alu_io_brinfo_uop_ppred; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_prs1_busy = alu_io_brinfo_uop_prs1_busy; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_prs2_busy = alu_io_brinfo_uop_prs2_busy; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_prs3_busy = alu_io_brinfo_uop_prs3_busy; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ppred_busy = alu_io_brinfo_uop_ppred_busy; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_stale_pdst = alu_io_brinfo_uop_stale_pdst; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_exception = alu_io_brinfo_uop_exception; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_exc_cause = alu_io_brinfo_uop_exc_cause; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_bypassable = alu_io_brinfo_uop_bypassable; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_mem_cmd = alu_io_brinfo_uop_mem_cmd; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_mem_size = alu_io_brinfo_uop_mem_size; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_mem_signed = alu_io_brinfo_uop_mem_signed; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_is_fence = alu_io_brinfo_uop_is_fence; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_is_fencei = alu_io_brinfo_uop_is_fencei; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_is_amo = alu_io_brinfo_uop_is_amo; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_uses_ldq = alu_io_brinfo_uop_uses_ldq; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_uses_stq = alu_io_brinfo_uop_uses_stq; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_is_sys_pc2epc = alu_io_brinfo_uop_is_sys_pc2epc; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_is_unique = alu_io_brinfo_uop_is_unique; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_flush_on_commit = alu_io_brinfo_uop_flush_on_commit; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ldst_is_rs1 = alu_io_brinfo_uop_ldst_is_rs1; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ldst = alu_io_brinfo_uop_ldst; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_lrs1 = alu_io_brinfo_uop_lrs1; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_lrs2 = alu_io_brinfo_uop_lrs2; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_lrs3 = alu_io_brinfo_uop_lrs3; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_ldst_val = alu_io_brinfo_uop_ldst_val; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_dst_rtype = alu_io_brinfo_uop_dst_rtype; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_lrs1_rtype = alu_io_brinfo_uop_lrs1_rtype; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_lrs2_rtype = alu_io_brinfo_uop_lrs2_rtype; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_frs3_en = alu_io_brinfo_uop_frs3_en; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_fp_val = alu_io_brinfo_uop_fp_val; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_fp_single = alu_io_brinfo_uop_fp_single; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_xcpt_pf_if = alu_io_brinfo_uop_xcpt_pf_if; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_xcpt_ae_if = alu_io_brinfo_uop_xcpt_ae_if; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_xcpt_ma_if = alu_io_brinfo_uop_xcpt_ma_if; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_bp_debug_if = alu_io_brinfo_uop_bp_debug_if; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_bp_xcpt_if = alu_io_brinfo_uop_bp_xcpt_if; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_debug_fsrc = alu_io_brinfo_uop_debug_fsrc; // @[execution-unit.scala 287:15]
  assign io_brinfo_uop_debug_tsrc = alu_io_brinfo_uop_debug_tsrc; // @[execution-unit.scala 287:15]
  assign io_brinfo_valid = alu_io_brinfo_valid; // @[execution-unit.scala 287:15]
  assign io_brinfo_mispredict = alu_io_brinfo_mispredict; // @[execution-unit.scala 287:15]
  assign io_brinfo_taken = alu_io_brinfo_taken; // @[execution-unit.scala 287:15]
  assign io_brinfo_cfi_type = alu_io_brinfo_cfi_type; // @[execution-unit.scala 287:15]
  assign io_brinfo_pc_sel = alu_io_brinfo_pc_sel; // @[execution-unit.scala 287:15]
  assign io_brinfo_jalr_target = alu_io_brinfo_jalr_target; // @[execution-unit.scala 287:15]
  assign io_brinfo_target_offset = alu_io_brinfo_target_offset; // @[execution-unit.scala 287:15]
  assign alu_clock = clock;
  assign alu_reset = reset;
  assign alu_io_req_valid = io_req_valid & _T_26; // @[execution-unit.scala 266:20]
  assign alu_io_req_bits_uop_uopc = io_req_bits_uop_uopc; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_inst = io_req_bits_uop_inst; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_debug_inst = io_req_bits_uop_debug_inst; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_is_rvc = io_req_bits_uop_is_rvc; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_debug_pc = io_req_bits_uop_debug_pc; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_iq_type = io_req_bits_uop_iq_type; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_fu_code = io_req_bits_uop_fu_code; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_iw_state = io_req_bits_uop_iw_state; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_is_br = io_req_bits_uop_is_br; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_is_jalr = io_req_bits_uop_is_jalr; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_is_jal = io_req_bits_uop_is_jal; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_is_sfb = io_req_bits_uop_is_sfb; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_br_mask = io_req_bits_uop_br_mask; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_br_tag = io_req_bits_uop_br_tag; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_edge_inst = io_req_bits_uop_edge_inst; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_pc_lob = io_req_bits_uop_pc_lob; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_taken = io_req_bits_uop_taken; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_imm_packed = io_req_bits_uop_imm_packed; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_csr_addr = io_req_bits_uop_csr_addr; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_rob_idx = io_req_bits_uop_rob_idx; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_stq_idx = io_req_bits_uop_stq_idx; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_pdst = io_req_bits_uop_pdst; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_prs1 = io_req_bits_uop_prs1; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_prs2 = io_req_bits_uop_prs2; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_prs3 = io_req_bits_uop_prs3; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ppred = io_req_bits_uop_ppred; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_exception = io_req_bits_uop_exception; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_exc_cause = io_req_bits_uop_exc_cause; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_bypassable = io_req_bits_uop_bypassable; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_mem_size = io_req_bits_uop_mem_size; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_mem_signed = io_req_bits_uop_mem_signed; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_is_fence = io_req_bits_uop_is_fence; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_is_fencei = io_req_bits_uop_is_fencei; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_is_amo = io_req_bits_uop_is_amo; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_uses_stq = io_req_bits_uop_uses_stq; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_is_unique = io_req_bits_uop_is_unique; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ldst = io_req_bits_uop_ldst; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_lrs1 = io_req_bits_uop_lrs1; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_lrs2 = io_req_bits_uop_lrs2; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_lrs3 = io_req_bits_uop_lrs3; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_ldst_val = io_req_bits_uop_ldst_val; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_frs3_en = io_req_bits_uop_frs3_en; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_fp_val = io_req_bits_uop_fp_val; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_fp_single = io_req_bits_uop_fp_single; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 272:30]
  assign alu_io_req_bits_rs1_data = io_req_bits_rs1_data[63:0]; // @[execution-unit.scala 274:30]
  assign alu_io_req_bits_rs2_data = io_req_bits_rs2_data[63:0]; // @[execution-unit.scala 275:30]
  assign alu_io_req_bits_rs3_data = 64'h0;
  assign alu_io_req_bits_pred_data = io_req_bits_pred_data; // @[execution-unit.scala 277:31]
  assign alu_io_req_bits_kill = io_req_bits_kill; // @[execution-unit.scala 273:30]
  assign alu_io_resp_ready = 1'h0;
  assign alu_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[execution-unit.scala 279:21]
  assign alu_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[execution-unit.scala 279:21]
  assign div_clock = clock;
  assign div_reset = reset;
  assign div_io_req_valid = io_req_valid & _T_35; // @[execution-unit.scala 359:48]
  assign div_io_req_bits_uop_uopc = io_req_bits_uop_uopc; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_inst = io_req_bits_uop_inst; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_debug_inst = io_req_bits_uop_debug_inst; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_is_rvc = io_req_bits_uop_is_rvc; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_debug_pc = io_req_bits_uop_debug_pc; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_iq_type = io_req_bits_uop_iq_type; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_fu_code = io_req_bits_uop_fu_code; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_iw_state = io_req_bits_uop_iw_state; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_is_br = io_req_bits_uop_is_br; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_is_jalr = io_req_bits_uop_is_jalr; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_is_jal = io_req_bits_uop_is_jal; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_is_sfb = io_req_bits_uop_is_sfb; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_br_mask = io_req_bits_uop_br_mask; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_br_tag = io_req_bits_uop_br_tag; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_edge_inst = io_req_bits_uop_edge_inst; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_pc_lob = io_req_bits_uop_pc_lob; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_taken = io_req_bits_uop_taken; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_imm_packed = io_req_bits_uop_imm_packed; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_csr_addr = io_req_bits_uop_csr_addr; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_rob_idx = io_req_bits_uop_rob_idx; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_stq_idx = io_req_bits_uop_stq_idx; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_pdst = io_req_bits_uop_pdst; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_prs1 = io_req_bits_uop_prs1; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_prs2 = io_req_bits_uop_prs2; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_prs3 = io_req_bits_uop_prs3; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ppred = io_req_bits_uop_ppred; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_exception = io_req_bits_uop_exception; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_exc_cause = io_req_bits_uop_exc_cause; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_bypassable = io_req_bits_uop_bypassable; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_mem_size = io_req_bits_uop_mem_size; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_mem_signed = io_req_bits_uop_mem_signed; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_is_fence = io_req_bits_uop_is_fence; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_is_fencei = io_req_bits_uop_is_fencei; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_is_amo = io_req_bits_uop_is_amo; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_uses_stq = io_req_bits_uop_uses_stq; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_is_unique = io_req_bits_uop_is_unique; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ldst = io_req_bits_uop_ldst; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_lrs1 = io_req_bits_uop_lrs1; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_lrs2 = io_req_bits_uop_lrs2; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_lrs3 = io_req_bits_uop_lrs3; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_ldst_val = io_req_bits_uop_ldst_val; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_frs3_en = io_req_bits_uop_frs3_en; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_fp_val = io_req_bits_uop_fp_val; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_fp_single = io_req_bits_uop_fp_single; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[execution-unit.scala 360:32]
  assign div_io_req_bits_rs1_data = io_req_bits_rs1_data[63:0]; // @[execution-unit.scala 361:32]
  assign div_io_req_bits_rs2_data = io_req_bits_rs2_data[63:0]; // @[execution-unit.scala 362:32]
  assign div_io_req_bits_rs3_data = 64'h0;
  assign div_io_req_bits_pred_data = 1'h0;
  assign div_io_req_bits_kill = io_req_bits_kill; // @[execution-unit.scala 364:32]
  assign div_io_resp_ready = ~alu_io_resp_valid; // @[execution-unit.scala 367:26]
  assign div_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[execution-unit.scala 363:32]
  assign div_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[execution-unit.scala 363:32]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(io_iresp_ready | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at execution-unit.scala:144 assert(io.iresp.ready)\n"); // @[execution-unit.scala 144:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(io_iresp_ready | reset)) begin
          $fatal; // @[execution-unit.scala 144:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_79 <= 2'h1 & ~div_resp_val | _T_87 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Multiple functional units are fighting over the write port.\n    at execution-unit.scala:416 assert ((PopCount(iresp_fu_units.map(_.io.resp.valid)) <= 1.U && !div_resp_val) ||\n"
            ); // @[execution-unit.scala 416:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_79 <= 2'h1 & ~div_resp_val | _T_87 | reset)) begin
          $fatal; // @[execution-unit.scala 416:10]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
