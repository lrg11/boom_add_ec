module BranchKillableQueue_4(
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
  input  [64:0] io_enq_bits_data,
  input         io_enq_bits_predicated,
  input         io_enq_bits_fflags_valid,
  input  [6:0]  io_enq_bits_fflags_bits_uop_uopc,
  input  [31:0] io_enq_bits_fflags_bits_uop_inst,
  input  [31:0] io_enq_bits_fflags_bits_uop_debug_inst,
  input         io_enq_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_enq_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_enq_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_enq_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_enq_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_enq_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_enq_bits_fflags_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_enq_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_enq_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_enq_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_enq_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_enq_bits_fflags_bits_uop_ctrl_is_load,
  input         io_enq_bits_fflags_bits_uop_ctrl_is_sta,
  input         io_enq_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_enq_bits_fflags_bits_uop_iw_state,
  input         io_enq_bits_fflags_bits_uop_iw_p1_poisoned,
  input         io_enq_bits_fflags_bits_uop_iw_p2_poisoned,
  input         io_enq_bits_fflags_bits_uop_is_br,
  input         io_enq_bits_fflags_bits_uop_is_jalr,
  input         io_enq_bits_fflags_bits_uop_is_jal,
  input         io_enq_bits_fflags_bits_uop_is_sfb,
  input  [11:0] io_enq_bits_fflags_bits_uop_br_mask,
  input  [3:0]  io_enq_bits_fflags_bits_uop_br_tag,
  input  [4:0]  io_enq_bits_fflags_bits_uop_ftq_idx,
  input         io_enq_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_enq_bits_fflags_bits_uop_pc_lob,
  input         io_enq_bits_fflags_bits_uop_taken,
  input  [19:0] io_enq_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_enq_bits_fflags_bits_uop_csr_addr,
  input  [5:0]  io_enq_bits_fflags_bits_uop_rob_idx,
  input  [3:0]  io_enq_bits_fflags_bits_uop_ldq_idx,
  input  [3:0]  io_enq_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_enq_bits_fflags_bits_uop_rxq_idx,
  input  [5:0]  io_enq_bits_fflags_bits_uop_pdst,
  input  [5:0]  io_enq_bits_fflags_bits_uop_prs1,
  input  [5:0]  io_enq_bits_fflags_bits_uop_prs2,
  input  [5:0]  io_enq_bits_fflags_bits_uop_prs3,
  input  [4:0]  io_enq_bits_fflags_bits_uop_ppred,
  input         io_enq_bits_fflags_bits_uop_prs1_busy,
  input         io_enq_bits_fflags_bits_uop_prs2_busy,
  input         io_enq_bits_fflags_bits_uop_prs3_busy,
  input         io_enq_bits_fflags_bits_uop_ppred_busy,
  input  [5:0]  io_enq_bits_fflags_bits_uop_stale_pdst,
  input         io_enq_bits_fflags_bits_uop_exception,
  input  [63:0] io_enq_bits_fflags_bits_uop_exc_cause,
  input         io_enq_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_enq_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_enq_bits_fflags_bits_uop_mem_size,
  input         io_enq_bits_fflags_bits_uop_mem_signed,
  input         io_enq_bits_fflags_bits_uop_is_fence,
  input         io_enq_bits_fflags_bits_uop_is_fencei,
  input         io_enq_bits_fflags_bits_uop_is_amo,
  input         io_enq_bits_fflags_bits_uop_uses_ldq,
  input         io_enq_bits_fflags_bits_uop_uses_stq,
  input         io_enq_bits_fflags_bits_uop_is_sys_pc2epc,
  input         io_enq_bits_fflags_bits_uop_is_unique,
  input         io_enq_bits_fflags_bits_uop_flush_on_commit,
  input         io_enq_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_enq_bits_fflags_bits_uop_ldst,
  input  [5:0]  io_enq_bits_fflags_bits_uop_lrs1,
  input  [5:0]  io_enq_bits_fflags_bits_uop_lrs2,
  input  [5:0]  io_enq_bits_fflags_bits_uop_lrs3,
  input         io_enq_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_enq_bits_fflags_bits_uop_dst_rtype,
  input  [1:0]  io_enq_bits_fflags_bits_uop_lrs1_rtype,
  input  [1:0]  io_enq_bits_fflags_bits_uop_lrs2_rtype,
  input         io_enq_bits_fflags_bits_uop_frs3_en,
  input         io_enq_bits_fflags_bits_uop_fp_val,
  input         io_enq_bits_fflags_bits_uop_fp_single,
  input         io_enq_bits_fflags_bits_uop_xcpt_pf_if,
  input         io_enq_bits_fflags_bits_uop_xcpt_ae_if,
  input         io_enq_bits_fflags_bits_uop_xcpt_ma_if,
  input         io_enq_bits_fflags_bits_uop_bp_debug_if,
  input         io_enq_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_enq_bits_fflags_bits_uop_debug_fsrc,
  input  [1:0]  io_enq_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_enq_bits_fflags_bits_flags,
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
  output [64:0] io_deq_bits_data,
  output        io_deq_bits_predicated,
  output        io_deq_bits_fflags_valid,
  output [6:0]  io_deq_bits_fflags_bits_uop_uopc,
  output [31:0] io_deq_bits_fflags_bits_uop_inst,
  output [31:0] io_deq_bits_fflags_bits_uop_debug_inst,
  output        io_deq_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_deq_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_deq_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_deq_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_deq_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_deq_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_deq_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_deq_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_deq_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_deq_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_deq_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_deq_bits_fflags_bits_uop_ctrl_is_load,
  output        io_deq_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_deq_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_deq_bits_fflags_bits_uop_iw_state,
  output        io_deq_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_deq_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_deq_bits_fflags_bits_uop_is_br,
  output        io_deq_bits_fflags_bits_uop_is_jalr,
  output        io_deq_bits_fflags_bits_uop_is_jal,
  output        io_deq_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_deq_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_deq_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_deq_bits_fflags_bits_uop_ftq_idx,
  output        io_deq_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_deq_bits_fflags_bits_uop_pc_lob,
  output        io_deq_bits_fflags_bits_uop_taken,
  output [19:0] io_deq_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_deq_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_deq_bits_fflags_bits_uop_rob_idx,
  output [3:0]  io_deq_bits_fflags_bits_uop_ldq_idx,
  output [3:0]  io_deq_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_deq_bits_fflags_bits_uop_rxq_idx,
  output [5:0]  io_deq_bits_fflags_bits_uop_pdst,
  output [5:0]  io_deq_bits_fflags_bits_uop_prs1,
  output [5:0]  io_deq_bits_fflags_bits_uop_prs2,
  output [5:0]  io_deq_bits_fflags_bits_uop_prs3,
  output [4:0]  io_deq_bits_fflags_bits_uop_ppred,
  output        io_deq_bits_fflags_bits_uop_prs1_busy,
  output        io_deq_bits_fflags_bits_uop_prs2_busy,
  output        io_deq_bits_fflags_bits_uop_prs3_busy,
  output        io_deq_bits_fflags_bits_uop_ppred_busy,
  output [5:0]  io_deq_bits_fflags_bits_uop_stale_pdst,
  output        io_deq_bits_fflags_bits_uop_exception,
  output [63:0] io_deq_bits_fflags_bits_uop_exc_cause,
  output        io_deq_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_deq_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_deq_bits_fflags_bits_uop_mem_size,
  output        io_deq_bits_fflags_bits_uop_mem_signed,
  output        io_deq_bits_fflags_bits_uop_is_fence,
  output        io_deq_bits_fflags_bits_uop_is_fencei,
  output        io_deq_bits_fflags_bits_uop_is_amo,
  output        io_deq_bits_fflags_bits_uop_uses_ldq,
  output        io_deq_bits_fflags_bits_uop_uses_stq,
  output        io_deq_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_deq_bits_fflags_bits_uop_is_unique,
  output        io_deq_bits_fflags_bits_uop_flush_on_commit,
  output        io_deq_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_deq_bits_fflags_bits_uop_ldst,
  output [5:0]  io_deq_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_deq_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_deq_bits_fflags_bits_uop_lrs3,
  output        io_deq_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_deq_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_deq_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_deq_bits_fflags_bits_uop_lrs2_rtype,
  output        io_deq_bits_fflags_bits_uop_frs3_en,
  output        io_deq_bits_fflags_bits_uop_fp_val,
  output        io_deq_bits_fflags_bits_uop_fp_single,
  output        io_deq_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_deq_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_deq_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_deq_bits_fflags_bits_uop_bp_debug_if,
  output        io_deq_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_deq_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_deq_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_deq_bits_fflags_bits_flags,
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
  output [2:0]  io_count
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [95:0] _RAND_1;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_13;
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_99;
  reg [63:0] _RAND_101;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_143;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_151;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_165;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [95:0] _RAND_0;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_14;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_98;
  reg [63:0] _RAND_100;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_142;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_150;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_164;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
  reg [63:0] _RAND_177;
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
  reg [31:0] _RAND_211;
  reg [31:0] _RAND_212;
  reg [31:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [31:0] _RAND_215;
  reg [31:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [31:0] _RAND_218;
  reg [31:0] _RAND_219;
  reg [63:0] _RAND_220;
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
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [31:0] _RAND_250;
  reg [31:0] _RAND_251;
  reg [31:0] _RAND_252;
  reg [31:0] _RAND_253;
  reg [31:0] _RAND_254;
  reg [31:0] _RAND_255;
  reg [63:0] _RAND_256;
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
  reg [31:0] _RAND_290;
  reg [31:0] _RAND_291;
  reg [31:0] _RAND_292;
  reg [31:0] _RAND_293;
  reg [31:0] _RAND_294;
  reg [31:0] _RAND_295;
  reg [31:0] _RAND_296;
  reg [31:0] _RAND_297;
  reg [31:0] _RAND_298;
  reg [63:0] _RAND_299;
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
  reg [63:0] _RAND_335;
  reg [31:0] _RAND_336;
  reg [31:0] _RAND_337;
  reg [31:0] _RAND_338;
  reg [31:0] _RAND_339;
  reg [31:0] _RAND_340;
  reg [31:0] _RAND_341;
  reg [31:0] _RAND_342;
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
  reg [63:0] _RAND_457;
  reg [31:0] _RAND_458;
  reg [31:0] _RAND_459;
  reg [31:0] _RAND_460;
  reg [31:0] _RAND_461;
  reg [31:0] _RAND_462;
  reg [31:0] _RAND_463;
  reg [31:0] _RAND_464;
  reg [31:0] _RAND_465;
  reg [31:0] _RAND_466;
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
  reg [63:0] _RAND_493;
  reg [31:0] _RAND_494;
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
  reg [63:0] _RAND_536;
  reg [31:0] _RAND_537;
  reg [31:0] _RAND_538;
  reg [31:0] _RAND_539;
  reg [31:0] _RAND_540;
  reg [31:0] _RAND_541;
  reg [31:0] _RAND_542;
  reg [31:0] _RAND_543;
  reg [31:0] _RAND_544;
  reg [31:0] _RAND_545;
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
  reg [63:0] _RAND_572;
  reg [31:0] _RAND_573;
  reg [31:0] _RAND_574;
  reg [31:0] _RAND_575;
  reg [31:0] _RAND_576;
  reg [31:0] _RAND_577;
  reg [31:0] _RAND_578;
  reg [31:0] _RAND_579;
  reg [31:0] _RAND_580;
  reg [31:0] _RAND_581;
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
  reg [63:0] _RAND_615;
  reg [31:0] _RAND_616;
  reg [31:0] _RAND_617;
  reg [31:0] _RAND_618;
  reg [31:0] _RAND_619;
  reg [31:0] _RAND_620;
  reg [31:0] _RAND_621;
  reg [31:0] _RAND_622;
  reg [31:0] _RAND_623;
  reg [31:0] _RAND_624;
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
  reg [63:0] _RAND_651;
  reg [31:0] _RAND_652;
  reg [31:0] _RAND_653;
  reg [31:0] _RAND_654;
  reg [31:0] _RAND_655;
  reg [31:0] _RAND_656;
  reg [31:0] _RAND_657;
  reg [31:0] _RAND_658;
  reg [31:0] _RAND_659;
  reg [31:0] _RAND_660;
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
  reg [63:0] _RAND_694;
  reg [31:0] _RAND_695;
  reg [31:0] _RAND_696;
  reg [31:0] _RAND_697;
  reg [31:0] _RAND_698;
  reg [31:0] _RAND_699;
  reg [31:0] _RAND_700;
  reg [31:0] _RAND_701;
  reg [31:0] _RAND_702;
  reg [31:0] _RAND_703;
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
`endif // RANDOMIZE_REG_INIT
  reg [64:0] ram_data [0:6]; // @[util.scala 464:20]
  wire [64:0] ram_data_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_data_MPORT_1_addr; // @[util.scala 464:20]
  wire [64:0] ram_data_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_data_MPORT_addr; // @[util.scala 464:20]
  wire  ram_data_MPORT_mask; // @[util.scala 464:20]
  wire  ram_data_MPORT_en; // @[util.scala 464:20]
  reg  ram_predicated [0:6]; // @[util.scala 464:20]
  wire  ram_predicated_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_predicated_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_predicated_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_predicated_MPORT_addr; // @[util.scala 464:20]
  wire  ram_predicated_MPORT_mask; // @[util.scala 464:20]
  wire  ram_predicated_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_valid [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_valid_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_valid_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_valid_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_valid_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_valid_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_valid_MPORT_en; // @[util.scala 464:20]
  reg [6:0] ram_fflags_bits_uop_uopc [0:6]; // @[util.scala 464:20]
  wire [6:0] ram_fflags_bits_uop_uopc_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_uopc_MPORT_1_addr; // @[util.scala 464:20]
  wire [6:0] ram_fflags_bits_uop_uopc_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_uopc_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_uopc_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_uopc_MPORT_en; // @[util.scala 464:20]
  reg [31:0] ram_fflags_bits_uop_inst [0:6]; // @[util.scala 464:20]
  wire [31:0] ram_fflags_bits_uop_inst_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_inst_MPORT_1_addr; // @[util.scala 464:20]
  wire [31:0] ram_fflags_bits_uop_inst_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_inst_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_inst_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_inst_MPORT_en; // @[util.scala 464:20]
  reg [31:0] ram_fflags_bits_uop_debug_inst [0:6]; // @[util.scala 464:20]
  wire [31:0] ram_fflags_bits_uop_debug_inst_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_debug_inst_MPORT_1_addr; // @[util.scala 464:20]
  wire [31:0] ram_fflags_bits_uop_debug_inst_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_debug_inst_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_debug_inst_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_debug_inst_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_is_rvc [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_rvc_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_rvc_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_rvc_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_rvc_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_rvc_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_rvc_MPORT_en; // @[util.scala 464:20]
  reg [39:0] ram_fflags_bits_uop_debug_pc [0:6]; // @[util.scala 464:20]
  wire [39:0] ram_fflags_bits_uop_debug_pc_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_debug_pc_MPORT_1_addr; // @[util.scala 464:20]
  wire [39:0] ram_fflags_bits_uop_debug_pc_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_debug_pc_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_debug_pc_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_debug_pc_MPORT_en; // @[util.scala 464:20]
  reg [2:0] ram_fflags_bits_uop_iq_type [0:6]; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_iq_type_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_iq_type_MPORT_1_addr; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_iq_type_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_iq_type_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iq_type_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iq_type_MPORT_en; // @[util.scala 464:20]
  reg [9:0] ram_fflags_bits_uop_fu_code [0:6]; // @[util.scala 464:20]
  wire [9:0] ram_fflags_bits_uop_fu_code_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_fu_code_MPORT_1_addr; // @[util.scala 464:20]
  wire [9:0] ram_fflags_bits_uop_fu_code_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_fu_code_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_fu_code_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_fu_code_MPORT_en; // @[util.scala 464:20]
  reg [3:0] ram_fflags_bits_uop_ctrl_br_type [0:6]; // @[util.scala 464:20]
  wire [3:0] ram_fflags_bits_uop_ctrl_br_type_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_br_type_MPORT_1_addr; // @[util.scala 464:20]
  wire [3:0] ram_fflags_bits_uop_ctrl_br_type_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_br_type_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_br_type_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_br_type_MPORT_en; // @[util.scala 464:20]
  reg [1:0] ram_fflags_bits_uop_ctrl_op1_sel [0:6]; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_addr; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_ctrl_op1_sel_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op1_sel_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_op1_sel_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_op1_sel_MPORT_en; // @[util.scala 464:20]
  reg [2:0] ram_fflags_bits_uop_ctrl_op2_sel [0:6]; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_addr; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op2_sel_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op2_sel_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_op2_sel_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_op2_sel_MPORT_en; // @[util.scala 464:20]
  reg [2:0] ram_fflags_bits_uop_ctrl_imm_sel [0:6]; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_addr; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_imm_sel_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_imm_sel_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_imm_sel_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_imm_sel_MPORT_en; // @[util.scala 464:20]
  reg [3:0] ram_fflags_bits_uop_ctrl_op_fcn [0:6]; // @[util.scala 464:20]
  wire [3:0] ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_addr; // @[util.scala 464:20]
  wire [3:0] ram_fflags_bits_uop_ctrl_op_fcn_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_op_fcn_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_op_fcn_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_op_fcn_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_ctrl_fcn_dw [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_en; // @[util.scala 464:20]
  reg [2:0] ram_fflags_bits_uop_ctrl_csr_cmd [0:6]; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_addr; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_ctrl_is_load [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_load_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_load_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_load_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_load_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_load_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_load_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_ctrl_is_sta [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_sta_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_sta_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_sta_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_sta_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_ctrl_is_std [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_std_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_std_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_std_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ctrl_is_std_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_std_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ctrl_is_std_MPORT_en; // @[util.scala 464:20]
  reg [1:0] ram_fflags_bits_uop_iw_state [0:6]; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_iw_state_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_iw_state_MPORT_1_addr; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_iw_state_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_iw_state_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iw_state_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iw_state_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_iw_p1_poisoned [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iw_p1_poisoned_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_iw_p1_poisoned_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iw_p1_poisoned_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iw_p1_poisoned_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_iw_p2_poisoned [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iw_p2_poisoned_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_iw_p2_poisoned_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iw_p2_poisoned_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_iw_p2_poisoned_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_is_br [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_br_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_br_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_br_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_br_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_br_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_br_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_is_jalr [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_jalr_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_jalr_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_jalr_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_jalr_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_jalr_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_jalr_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_is_jal [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_jal_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_jal_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_jal_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_jal_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_jal_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_jal_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_is_sfb [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_sfb_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_sfb_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_sfb_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_sfb_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_sfb_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_sfb_MPORT_en; // @[util.scala 464:20]
  reg [11:0] ram_fflags_bits_uop_br_mask [0:6]; // @[util.scala 464:20]
  wire [11:0] ram_fflags_bits_uop_br_mask_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_br_mask_MPORT_1_addr; // @[util.scala 464:20]
  wire [11:0] ram_fflags_bits_uop_br_mask_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_br_mask_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_br_mask_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_br_mask_MPORT_en; // @[util.scala 464:20]
  reg [3:0] ram_fflags_bits_uop_br_tag [0:6]; // @[util.scala 464:20]
  wire [3:0] ram_fflags_bits_uop_br_tag_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_br_tag_MPORT_1_addr; // @[util.scala 464:20]
  wire [3:0] ram_fflags_bits_uop_br_tag_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_br_tag_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_br_tag_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_br_tag_MPORT_en; // @[util.scala 464:20]
  reg [4:0] ram_fflags_bits_uop_ftq_idx [0:6]; // @[util.scala 464:20]
  wire [4:0] ram_fflags_bits_uop_ftq_idx_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ftq_idx_MPORT_1_addr; // @[util.scala 464:20]
  wire [4:0] ram_fflags_bits_uop_ftq_idx_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ftq_idx_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ftq_idx_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ftq_idx_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_edge_inst [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_edge_inst_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_edge_inst_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_edge_inst_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_edge_inst_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_edge_inst_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_edge_inst_MPORT_en; // @[util.scala 464:20]
  reg [5:0] ram_fflags_bits_uop_pc_lob [0:6]; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_pc_lob_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_pc_lob_MPORT_1_addr; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_pc_lob_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_pc_lob_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_pc_lob_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_pc_lob_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_taken [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_taken_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_taken_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_taken_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_taken_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_taken_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_taken_MPORT_en; // @[util.scala 464:20]
  reg [19:0] ram_fflags_bits_uop_imm_packed [0:6]; // @[util.scala 464:20]
  wire [19:0] ram_fflags_bits_uop_imm_packed_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_imm_packed_MPORT_1_addr; // @[util.scala 464:20]
  wire [19:0] ram_fflags_bits_uop_imm_packed_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_imm_packed_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_imm_packed_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_imm_packed_MPORT_en; // @[util.scala 464:20]
  reg [11:0] ram_fflags_bits_uop_csr_addr [0:6]; // @[util.scala 464:20]
  wire [11:0] ram_fflags_bits_uop_csr_addr_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_csr_addr_MPORT_1_addr; // @[util.scala 464:20]
  wire [11:0] ram_fflags_bits_uop_csr_addr_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_csr_addr_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_csr_addr_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_csr_addr_MPORT_en; // @[util.scala 464:20]
  reg [5:0] ram_fflags_bits_uop_rob_idx [0:6]; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_rob_idx_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_rob_idx_MPORT_1_addr; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_rob_idx_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_rob_idx_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_rob_idx_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_rob_idx_MPORT_en; // @[util.scala 464:20]
  reg [3:0] ram_fflags_bits_uop_ldq_idx [0:6]; // @[util.scala 464:20]
  wire [3:0] ram_fflags_bits_uop_ldq_idx_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ldq_idx_MPORT_1_addr; // @[util.scala 464:20]
  wire [3:0] ram_fflags_bits_uop_ldq_idx_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ldq_idx_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldq_idx_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldq_idx_MPORT_en; // @[util.scala 464:20]
  reg [3:0] ram_fflags_bits_uop_stq_idx [0:6]; // @[util.scala 464:20]
  wire [3:0] ram_fflags_bits_uop_stq_idx_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_stq_idx_MPORT_1_addr; // @[util.scala 464:20]
  wire [3:0] ram_fflags_bits_uop_stq_idx_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_stq_idx_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_stq_idx_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_stq_idx_MPORT_en; // @[util.scala 464:20]
  reg [1:0] ram_fflags_bits_uop_rxq_idx [0:6]; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_rxq_idx_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_rxq_idx_MPORT_1_addr; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_rxq_idx_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_rxq_idx_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_rxq_idx_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_rxq_idx_MPORT_en; // @[util.scala 464:20]
  reg [5:0] ram_fflags_bits_uop_pdst [0:6]; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_pdst_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_pdst_MPORT_1_addr; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_pdst_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_pdst_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_pdst_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_pdst_MPORT_en; // @[util.scala 464:20]
  reg [5:0] ram_fflags_bits_uop_prs1 [0:6]; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_prs1_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs1_MPORT_1_addr; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_prs1_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs1_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs1_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs1_MPORT_en; // @[util.scala 464:20]
  reg [5:0] ram_fflags_bits_uop_prs2 [0:6]; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_prs2_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs2_MPORT_1_addr; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_prs2_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs2_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs2_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs2_MPORT_en; // @[util.scala 464:20]
  reg [5:0] ram_fflags_bits_uop_prs3 [0:6]; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_prs3_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs3_MPORT_1_addr; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_prs3_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs3_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs3_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs3_MPORT_en; // @[util.scala 464:20]
  reg [4:0] ram_fflags_bits_uop_ppred [0:6]; // @[util.scala 464:20]
  wire [4:0] ram_fflags_bits_uop_ppred_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ppred_MPORT_1_addr; // @[util.scala 464:20]
  wire [4:0] ram_fflags_bits_uop_ppred_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ppred_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ppred_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ppred_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_prs1_busy [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs1_busy_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs1_busy_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs1_busy_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs1_busy_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs1_busy_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs1_busy_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_prs2_busy [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs2_busy_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs2_busy_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs2_busy_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs2_busy_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs2_busy_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs2_busy_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_prs3_busy [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs3_busy_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs3_busy_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs3_busy_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_prs3_busy_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs3_busy_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_prs3_busy_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_ppred_busy [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ppred_busy_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ppred_busy_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ppred_busy_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ppred_busy_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ppred_busy_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ppred_busy_MPORT_en; // @[util.scala 464:20]
  reg [5:0] ram_fflags_bits_uop_stale_pdst [0:6]; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_stale_pdst_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_stale_pdst_MPORT_1_addr; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_stale_pdst_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_stale_pdst_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_stale_pdst_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_stale_pdst_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_exception [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_exception_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_exception_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_exception_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_exception_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_exception_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_exception_MPORT_en; // @[util.scala 464:20]
  reg [63:0] ram_fflags_bits_uop_exc_cause [0:6]; // @[util.scala 464:20]
  wire [63:0] ram_fflags_bits_uop_exc_cause_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_exc_cause_MPORT_1_addr; // @[util.scala 464:20]
  wire [63:0] ram_fflags_bits_uop_exc_cause_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_exc_cause_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_exc_cause_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_exc_cause_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_bypassable [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bypassable_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_bypassable_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bypassable_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_bypassable_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bypassable_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bypassable_MPORT_en; // @[util.scala 464:20]
  reg [4:0] ram_fflags_bits_uop_mem_cmd [0:6]; // @[util.scala 464:20]
  wire [4:0] ram_fflags_bits_uop_mem_cmd_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_mem_cmd_MPORT_1_addr; // @[util.scala 464:20]
  wire [4:0] ram_fflags_bits_uop_mem_cmd_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_mem_cmd_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_mem_cmd_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_mem_cmd_MPORT_en; // @[util.scala 464:20]
  reg [1:0] ram_fflags_bits_uop_mem_size [0:6]; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_mem_size_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_mem_size_MPORT_1_addr; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_mem_size_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_mem_size_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_mem_size_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_mem_size_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_mem_signed [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_mem_signed_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_mem_signed_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_mem_signed_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_mem_signed_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_mem_signed_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_mem_signed_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_is_fence [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_fence_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_fence_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_fence_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_fence_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_fence_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_fence_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_is_fencei [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_fencei_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_fencei_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_fencei_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_fencei_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_fencei_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_fencei_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_is_amo [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_amo_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_amo_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_amo_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_amo_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_amo_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_amo_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_uses_ldq [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_uses_ldq_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_uses_ldq_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_uses_ldq_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_uses_ldq_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_uses_ldq_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_uses_ldq_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_uses_stq [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_uses_stq_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_uses_stq_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_uses_stq_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_uses_stq_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_uses_stq_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_uses_stq_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_is_sys_pc2epc [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_sys_pc2epc_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_sys_pc2epc_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_sys_pc2epc_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_sys_pc2epc_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_is_unique [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_unique_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_unique_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_unique_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_is_unique_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_unique_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_is_unique_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_flush_on_commit [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_flush_on_commit_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_flush_on_commit_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_flush_on_commit_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_flush_on_commit_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_flush_on_commit_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_flush_on_commit_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_ldst_is_rs1 [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldst_is_rs1_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ldst_is_rs1_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldst_is_rs1_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldst_is_rs1_MPORT_en; // @[util.scala 464:20]
  reg [5:0] ram_fflags_bits_uop_ldst [0:6]; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_ldst_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ldst_MPORT_1_addr; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_ldst_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ldst_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldst_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldst_MPORT_en; // @[util.scala 464:20]
  reg [5:0] ram_fflags_bits_uop_lrs1 [0:6]; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_lrs1_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_lrs1_MPORT_1_addr; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_lrs1_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_lrs1_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_lrs1_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_lrs1_MPORT_en; // @[util.scala 464:20]
  reg [5:0] ram_fflags_bits_uop_lrs2 [0:6]; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_lrs2_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_lrs2_MPORT_1_addr; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_lrs2_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_lrs2_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_lrs2_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_lrs2_MPORT_en; // @[util.scala 464:20]
  reg [5:0] ram_fflags_bits_uop_lrs3 [0:6]; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_lrs3_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_lrs3_MPORT_1_addr; // @[util.scala 464:20]
  wire [5:0] ram_fflags_bits_uop_lrs3_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_lrs3_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_lrs3_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_lrs3_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_ldst_val [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldst_val_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ldst_val_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldst_val_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_ldst_val_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldst_val_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_ldst_val_MPORT_en; // @[util.scala 464:20]
  reg [1:0] ram_fflags_bits_uop_dst_rtype [0:6]; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_dst_rtype_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_dst_rtype_MPORT_1_addr; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_dst_rtype_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_dst_rtype_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_dst_rtype_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_dst_rtype_MPORT_en; // @[util.scala 464:20]
  reg [1:0] ram_fflags_bits_uop_lrs1_rtype [0:6]; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_lrs1_rtype_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_lrs1_rtype_MPORT_1_addr; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_lrs1_rtype_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_lrs1_rtype_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_lrs1_rtype_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_lrs1_rtype_MPORT_en; // @[util.scala 464:20]
  reg [1:0] ram_fflags_bits_uop_lrs2_rtype [0:6]; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_lrs2_rtype_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_lrs2_rtype_MPORT_1_addr; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_lrs2_rtype_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_lrs2_rtype_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_lrs2_rtype_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_lrs2_rtype_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_frs3_en [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_frs3_en_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_frs3_en_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_frs3_en_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_frs3_en_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_frs3_en_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_frs3_en_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_fp_val [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_fp_val_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_fp_val_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_fp_val_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_fp_val_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_fp_val_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_fp_val_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_fp_single [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_fp_single_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_fp_single_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_fp_single_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_fp_single_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_fp_single_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_fp_single_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_xcpt_pf_if [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_pf_if_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_pf_if_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_pf_if_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_pf_if_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_xcpt_ae_if [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_ae_if_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_ae_if_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_ae_if_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_ae_if_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_xcpt_ma_if [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_ma_if_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_xcpt_ma_if_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_ma_if_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_xcpt_ma_if_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_bp_debug_if [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bp_debug_if_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_bp_debug_if_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bp_debug_if_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_bp_debug_if_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bp_debug_if_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bp_debug_if_MPORT_en; // @[util.scala 464:20]
  reg  ram_fflags_bits_uop_bp_xcpt_if [0:6]; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bp_xcpt_if_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_bp_xcpt_if_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bp_xcpt_if_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_bp_xcpt_if_MPORT_en; // @[util.scala 464:20]
  reg [1:0] ram_fflags_bits_uop_debug_fsrc [0:6]; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_debug_fsrc_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_debug_fsrc_MPORT_1_addr; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_debug_fsrc_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_debug_fsrc_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_debug_fsrc_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_debug_fsrc_MPORT_en; // @[util.scala 464:20]
  reg [1:0] ram_fflags_bits_uop_debug_tsrc [0:6]; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_debug_tsrc_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_debug_tsrc_MPORT_1_addr; // @[util.scala 464:20]
  wire [1:0] ram_fflags_bits_uop_debug_tsrc_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_uop_debug_tsrc_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_debug_tsrc_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_uop_debug_tsrc_MPORT_en; // @[util.scala 464:20]
  reg [4:0] ram_fflags_bits_flags [0:6]; // @[util.scala 464:20]
  wire [4:0] ram_fflags_bits_flags_MPORT_1_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_flags_MPORT_1_addr; // @[util.scala 464:20]
  wire [4:0] ram_fflags_bits_flags_MPORT_data; // @[util.scala 464:20]
  wire [2:0] ram_fflags_bits_flags_MPORT_addr; // @[util.scala 464:20]
  wire  ram_fflags_bits_flags_MPORT_mask; // @[util.scala 464:20]
  wire  ram_fflags_bits_flags_MPORT_en; // @[util.scala 464:20]
  reg  valids_0; // @[util.scala 465:24]
  reg  valids_1; // @[util.scala 465:24]
  reg  valids_2; // @[util.scala 465:24]
  reg  valids_3; // @[util.scala 465:24]
  reg  valids_4; // @[util.scala 465:24]
  reg  valids_5; // @[util.scala 465:24]
  reg  valids_6; // @[util.scala 465:24]
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
  reg [2:0] value; // @[Counter.scala 60:40]
  reg [2:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[util.scala 470:27]
  wire  ptr_match = value == value_1; // @[util.scala 472:33]
  wire  full = ptr_match & maybe_full; // @[util.scala 474:24]
  wire  _T_2 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_1 = 3'h1 == value_1 ? valids_1 : valids_0; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_2 = 3'h2 == value_1 ? valids_2 : _GEN_1; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_3 = 3'h3 == value_1 ? valids_3 : _GEN_2; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_4 = 3'h4 == value_1 ? valids_4 : _GEN_3; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_5 = 3'h5 == value_1 ? valids_5 : _GEN_4; // @[util.scala 476:42 util.scala 476:42]
  wire  _GEN_6 = 3'h6 == value_1 ? valids_6 : _GEN_5; // @[util.scala 476:42 util.scala 476:42]
  wire  _T_5 = ~io_empty; // @[util.scala 476:69]
  wire  _T_6 = (io_deq_ready | ~_GEN_6) & ~io_empty; // @[util.scala 476:66]
  wire [11:0] _T_7 = io_brupdate_b1_mispredict_mask & uops_0_br_mask; // @[util.scala 118:51]
  wire  _T_8 = _T_7 != 12'h0; // @[util.scala 118:59]
  wire  _T_12 = ~io_flush; // @[util.scala 481:72]
  wire [11:0] _T_14 = ~io_brupdate_b1_resolve_mask; // @[util.scala 89:23]
  wire [11:0] _T_15 = uops_0_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_7 = valids_0 ? _T_15 : uops_0_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_16 = io_brupdate_b1_mispredict_mask & uops_1_br_mask; // @[util.scala 118:51]
  wire  _T_17 = _T_16 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_24 = uops_1_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_8 = valids_1 ? _T_24 : uops_1_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_25 = io_brupdate_b1_mispredict_mask & uops_2_br_mask; // @[util.scala 118:51]
  wire  _T_26 = _T_25 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_33 = uops_2_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_9 = valids_2 ? _T_33 : uops_2_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_34 = io_brupdate_b1_mispredict_mask & uops_3_br_mask; // @[util.scala 118:51]
  wire  _T_35 = _T_34 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_42 = uops_3_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_10 = valids_3 ? _T_42 : uops_3_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_43 = io_brupdate_b1_mispredict_mask & uops_4_br_mask; // @[util.scala 118:51]
  wire  _T_44 = _T_43 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_51 = uops_4_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_11 = valids_4 ? _T_51 : uops_4_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_52 = io_brupdate_b1_mispredict_mask & uops_5_br_mask; // @[util.scala 118:51]
  wire  _T_53 = _T_52 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_60 = uops_5_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_12 = valids_5 ? _T_60 : uops_5_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire [11:0] _T_61 = io_brupdate_b1_mispredict_mask & uops_6_br_mask; // @[util.scala 118:51]
  wire  _T_62 = _T_61 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_69 = uops_6_br_mask & _T_14; // @[util.scala 89:21]
  wire [11:0] _GEN_13 = valids_6 ? _T_69 : uops_6_br_mask; // @[util.scala 482:22 util.scala 483:23 util.scala 466:20]
  wire  _GEN_14 = 3'h0 == value | valids_0 & ~_T_8 & ~io_flush; // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_15 = 3'h1 == value | valids_1 & ~_T_17 & ~io_flush; // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_16 = 3'h2 == value | valids_2 & ~_T_26 & ~io_flush; // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_17 = 3'h3 == value | valids_3 & ~_T_35 & ~io_flush; // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_18 = 3'h4 == value | valids_4 & ~_T_44 & ~io_flush; // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_19 = 3'h5 == value | valids_5 & ~_T_53 & ~io_flush; // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire  _GEN_20 = 3'h6 == value | valids_6 & ~_T_62 & ~io_flush; // @[util.scala 489:33 util.scala 489:33 util.scala 481:16]
  wire [11:0] _T_71 = io_enq_bits_uop_br_mask & _T_14; // @[util.scala 85:25]
  wire  wrap = value == 3'h6; // @[Counter.scala 72:24]
  wire [2:0] _value_T_1 = value + 3'h1; // @[Counter.scala 76:24]
  wire  _GEN_1879 = io_deq_ready ? 1'h0 : _T_2; // @[util.scala 521:27 util.scala 521:36]
  wire  do_enq = io_empty ? _GEN_1879 : _T_2; // @[util.scala 515:21]
  wire  _GEN_748 = do_enq ? _GEN_14 : valids_0 & ~_T_8 & ~io_flush; // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_749 = do_enq ? _GEN_15 : valids_1 & ~_T_17 & ~io_flush; // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_750 = do_enq ? _GEN_16 : valids_2 & ~_T_26 & ~io_flush; // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_751 = do_enq ? _GEN_17 : valids_3 & ~_T_35 & ~io_flush; // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_752 = do_enq ? _GEN_18 : valids_4 & ~_T_44 & ~io_flush; // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_753 = do_enq ? _GEN_19 : valids_5 & ~_T_53 & ~io_flush; // @[util.scala 487:17 util.scala 481:16]
  wire  _GEN_754 = do_enq ? _GEN_20 : valids_6 & ~_T_62 & ~io_flush; // @[util.scala 487:17 util.scala 481:16]
  wire  wrap_1 = value_1 == 3'h6; // @[Counter.scala 72:24]
  wire [2:0] _value_T_3 = value_1 + 3'h1; // @[Counter.scala 76:24]
  wire  do_deq = io_empty ? 1'h0 : _T_6; // @[util.scala 515:21 util.scala 520:14]
  wire [1:0] _GEN_1327 = 3'h1 == value_1 ? uops_1_debug_tsrc : uops_0_debug_tsrc; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1328 = 3'h2 == value_1 ? uops_2_debug_tsrc : _GEN_1327; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1329 = 3'h3 == value_1 ? uops_3_debug_tsrc : _GEN_1328; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1330 = 3'h4 == value_1 ? uops_4_debug_tsrc : _GEN_1329; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1331 = 3'h5 == value_1 ? uops_5_debug_tsrc : _GEN_1330; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] out_uop_debug_tsrc = 3'h6 == value_1 ? uops_6_debug_tsrc : _GEN_1331; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1334 = 3'h1 == value_1 ? uops_1_debug_fsrc : uops_0_debug_fsrc; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1335 = 3'h2 == value_1 ? uops_2_debug_fsrc : _GEN_1334; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1336 = 3'h3 == value_1 ? uops_3_debug_fsrc : _GEN_1335; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1337 = 3'h4 == value_1 ? uops_4_debug_fsrc : _GEN_1336; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1338 = 3'h5 == value_1 ? uops_5_debug_fsrc : _GEN_1337; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] out_uop_debug_fsrc = 3'h6 == value_1 ? uops_6_debug_fsrc : _GEN_1338; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1341 = 3'h1 == value_1 ? uops_1_bp_xcpt_if : uops_0_bp_xcpt_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1342 = 3'h2 == value_1 ? uops_2_bp_xcpt_if : _GEN_1341; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1343 = 3'h3 == value_1 ? uops_3_bp_xcpt_if : _GEN_1342; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1344 = 3'h4 == value_1 ? uops_4_bp_xcpt_if : _GEN_1343; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1345 = 3'h5 == value_1 ? uops_5_bp_xcpt_if : _GEN_1344; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_bp_xcpt_if = 3'h6 == value_1 ? uops_6_bp_xcpt_if : _GEN_1345; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1348 = 3'h1 == value_1 ? uops_1_bp_debug_if : uops_0_bp_debug_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1349 = 3'h2 == value_1 ? uops_2_bp_debug_if : _GEN_1348; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1350 = 3'h3 == value_1 ? uops_3_bp_debug_if : _GEN_1349; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1351 = 3'h4 == value_1 ? uops_4_bp_debug_if : _GEN_1350; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1352 = 3'h5 == value_1 ? uops_5_bp_debug_if : _GEN_1351; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_bp_debug_if = 3'h6 == value_1 ? uops_6_bp_debug_if : _GEN_1352; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1355 = 3'h1 == value_1 ? uops_1_xcpt_ma_if : uops_0_xcpt_ma_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1356 = 3'h2 == value_1 ? uops_2_xcpt_ma_if : _GEN_1355; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1357 = 3'h3 == value_1 ? uops_3_xcpt_ma_if : _GEN_1356; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1358 = 3'h4 == value_1 ? uops_4_xcpt_ma_if : _GEN_1357; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1359 = 3'h5 == value_1 ? uops_5_xcpt_ma_if : _GEN_1358; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_xcpt_ma_if = 3'h6 == value_1 ? uops_6_xcpt_ma_if : _GEN_1359; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1362 = 3'h1 == value_1 ? uops_1_xcpt_ae_if : uops_0_xcpt_ae_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1363 = 3'h2 == value_1 ? uops_2_xcpt_ae_if : _GEN_1362; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1364 = 3'h3 == value_1 ? uops_3_xcpt_ae_if : _GEN_1363; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1365 = 3'h4 == value_1 ? uops_4_xcpt_ae_if : _GEN_1364; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1366 = 3'h5 == value_1 ? uops_5_xcpt_ae_if : _GEN_1365; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_xcpt_ae_if = 3'h6 == value_1 ? uops_6_xcpt_ae_if : _GEN_1366; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1369 = 3'h1 == value_1 ? uops_1_xcpt_pf_if : uops_0_xcpt_pf_if; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1370 = 3'h2 == value_1 ? uops_2_xcpt_pf_if : _GEN_1369; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1371 = 3'h3 == value_1 ? uops_3_xcpt_pf_if : _GEN_1370; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1372 = 3'h4 == value_1 ? uops_4_xcpt_pf_if : _GEN_1371; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1373 = 3'h5 == value_1 ? uops_5_xcpt_pf_if : _GEN_1372; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_xcpt_pf_if = 3'h6 == value_1 ? uops_6_xcpt_pf_if : _GEN_1373; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1376 = 3'h1 == value_1 ? uops_1_fp_single : uops_0_fp_single; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1377 = 3'h2 == value_1 ? uops_2_fp_single : _GEN_1376; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1378 = 3'h3 == value_1 ? uops_3_fp_single : _GEN_1377; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1379 = 3'h4 == value_1 ? uops_4_fp_single : _GEN_1378; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1380 = 3'h5 == value_1 ? uops_5_fp_single : _GEN_1379; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_fp_single = 3'h6 == value_1 ? uops_6_fp_single : _GEN_1380; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1383 = 3'h1 == value_1 ? uops_1_fp_val : uops_0_fp_val; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1384 = 3'h2 == value_1 ? uops_2_fp_val : _GEN_1383; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1385 = 3'h3 == value_1 ? uops_3_fp_val : _GEN_1384; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1386 = 3'h4 == value_1 ? uops_4_fp_val : _GEN_1385; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1387 = 3'h5 == value_1 ? uops_5_fp_val : _GEN_1386; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_fp_val = 3'h6 == value_1 ? uops_6_fp_val : _GEN_1387; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1390 = 3'h1 == value_1 ? uops_1_frs3_en : uops_0_frs3_en; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1391 = 3'h2 == value_1 ? uops_2_frs3_en : _GEN_1390; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1392 = 3'h3 == value_1 ? uops_3_frs3_en : _GEN_1391; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1393 = 3'h4 == value_1 ? uops_4_frs3_en : _GEN_1392; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1394 = 3'h5 == value_1 ? uops_5_frs3_en : _GEN_1393; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_frs3_en = 3'h6 == value_1 ? uops_6_frs3_en : _GEN_1394; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1397 = 3'h1 == value_1 ? uops_1_lrs2_rtype : uops_0_lrs2_rtype; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1398 = 3'h2 == value_1 ? uops_2_lrs2_rtype : _GEN_1397; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1399 = 3'h3 == value_1 ? uops_3_lrs2_rtype : _GEN_1398; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1400 = 3'h4 == value_1 ? uops_4_lrs2_rtype : _GEN_1399; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1401 = 3'h5 == value_1 ? uops_5_lrs2_rtype : _GEN_1400; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] out_uop_lrs2_rtype = 3'h6 == value_1 ? uops_6_lrs2_rtype : _GEN_1401; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1404 = 3'h1 == value_1 ? uops_1_lrs1_rtype : uops_0_lrs1_rtype; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1405 = 3'h2 == value_1 ? uops_2_lrs1_rtype : _GEN_1404; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1406 = 3'h3 == value_1 ? uops_3_lrs1_rtype : _GEN_1405; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1407 = 3'h4 == value_1 ? uops_4_lrs1_rtype : _GEN_1406; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1408 = 3'h5 == value_1 ? uops_5_lrs1_rtype : _GEN_1407; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] out_uop_lrs1_rtype = 3'h6 == value_1 ? uops_6_lrs1_rtype : _GEN_1408; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1411 = 3'h1 == value_1 ? uops_1_dst_rtype : uops_0_dst_rtype; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1412 = 3'h2 == value_1 ? uops_2_dst_rtype : _GEN_1411; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1413 = 3'h3 == value_1 ? uops_3_dst_rtype : _GEN_1412; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1414 = 3'h4 == value_1 ? uops_4_dst_rtype : _GEN_1413; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1415 = 3'h5 == value_1 ? uops_5_dst_rtype : _GEN_1414; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] out_uop_dst_rtype = 3'h6 == value_1 ? uops_6_dst_rtype : _GEN_1415; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1418 = 3'h1 == value_1 ? uops_1_ldst_val : uops_0_ldst_val; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1419 = 3'h2 == value_1 ? uops_2_ldst_val : _GEN_1418; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1420 = 3'h3 == value_1 ? uops_3_ldst_val : _GEN_1419; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1421 = 3'h4 == value_1 ? uops_4_ldst_val : _GEN_1420; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1422 = 3'h5 == value_1 ? uops_5_ldst_val : _GEN_1421; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_ldst_val = 3'h6 == value_1 ? uops_6_ldst_val : _GEN_1422; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1425 = 3'h1 == value_1 ? uops_1_lrs3 : uops_0_lrs3; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1426 = 3'h2 == value_1 ? uops_2_lrs3 : _GEN_1425; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1427 = 3'h3 == value_1 ? uops_3_lrs3 : _GEN_1426; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1428 = 3'h4 == value_1 ? uops_4_lrs3 : _GEN_1427; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1429 = 3'h5 == value_1 ? uops_5_lrs3 : _GEN_1428; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] out_uop_lrs3 = 3'h6 == value_1 ? uops_6_lrs3 : _GEN_1429; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1432 = 3'h1 == value_1 ? uops_1_lrs2 : uops_0_lrs2; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1433 = 3'h2 == value_1 ? uops_2_lrs2 : _GEN_1432; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1434 = 3'h3 == value_1 ? uops_3_lrs2 : _GEN_1433; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1435 = 3'h4 == value_1 ? uops_4_lrs2 : _GEN_1434; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1436 = 3'h5 == value_1 ? uops_5_lrs2 : _GEN_1435; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] out_uop_lrs2 = 3'h6 == value_1 ? uops_6_lrs2 : _GEN_1436; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1439 = 3'h1 == value_1 ? uops_1_lrs1 : uops_0_lrs1; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1440 = 3'h2 == value_1 ? uops_2_lrs1 : _GEN_1439; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1441 = 3'h3 == value_1 ? uops_3_lrs1 : _GEN_1440; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1442 = 3'h4 == value_1 ? uops_4_lrs1 : _GEN_1441; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1443 = 3'h5 == value_1 ? uops_5_lrs1 : _GEN_1442; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] out_uop_lrs1 = 3'h6 == value_1 ? uops_6_lrs1 : _GEN_1443; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1446 = 3'h1 == value_1 ? uops_1_ldst : uops_0_ldst; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1447 = 3'h2 == value_1 ? uops_2_ldst : _GEN_1446; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1448 = 3'h3 == value_1 ? uops_3_ldst : _GEN_1447; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1449 = 3'h4 == value_1 ? uops_4_ldst : _GEN_1448; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1450 = 3'h5 == value_1 ? uops_5_ldst : _GEN_1449; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] out_uop_ldst = 3'h6 == value_1 ? uops_6_ldst : _GEN_1450; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1453 = 3'h1 == value_1 ? uops_1_ldst_is_rs1 : uops_0_ldst_is_rs1; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1454 = 3'h2 == value_1 ? uops_2_ldst_is_rs1 : _GEN_1453; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1455 = 3'h3 == value_1 ? uops_3_ldst_is_rs1 : _GEN_1454; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1456 = 3'h4 == value_1 ? uops_4_ldst_is_rs1 : _GEN_1455; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1457 = 3'h5 == value_1 ? uops_5_ldst_is_rs1 : _GEN_1456; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_ldst_is_rs1 = 3'h6 == value_1 ? uops_6_ldst_is_rs1 : _GEN_1457; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1460 = 3'h1 == value_1 ? uops_1_flush_on_commit : uops_0_flush_on_commit; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1461 = 3'h2 == value_1 ? uops_2_flush_on_commit : _GEN_1460; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1462 = 3'h3 == value_1 ? uops_3_flush_on_commit : _GEN_1461; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1463 = 3'h4 == value_1 ? uops_4_flush_on_commit : _GEN_1462; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1464 = 3'h5 == value_1 ? uops_5_flush_on_commit : _GEN_1463; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_flush_on_commit = 3'h6 == value_1 ? uops_6_flush_on_commit : _GEN_1464; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1467 = 3'h1 == value_1 ? uops_1_is_unique : uops_0_is_unique; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1468 = 3'h2 == value_1 ? uops_2_is_unique : _GEN_1467; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1469 = 3'h3 == value_1 ? uops_3_is_unique : _GEN_1468; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1470 = 3'h4 == value_1 ? uops_4_is_unique : _GEN_1469; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1471 = 3'h5 == value_1 ? uops_5_is_unique : _GEN_1470; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_is_unique = 3'h6 == value_1 ? uops_6_is_unique : _GEN_1471; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1474 = 3'h1 == value_1 ? uops_1_is_sys_pc2epc : uops_0_is_sys_pc2epc; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1475 = 3'h2 == value_1 ? uops_2_is_sys_pc2epc : _GEN_1474; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1476 = 3'h3 == value_1 ? uops_3_is_sys_pc2epc : _GEN_1475; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1477 = 3'h4 == value_1 ? uops_4_is_sys_pc2epc : _GEN_1476; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1478 = 3'h5 == value_1 ? uops_5_is_sys_pc2epc : _GEN_1477; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_is_sys_pc2epc = 3'h6 == value_1 ? uops_6_is_sys_pc2epc : _GEN_1478; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1481 = 3'h1 == value_1 ? uops_1_uses_stq : uops_0_uses_stq; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1482 = 3'h2 == value_1 ? uops_2_uses_stq : _GEN_1481; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1483 = 3'h3 == value_1 ? uops_3_uses_stq : _GEN_1482; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1484 = 3'h4 == value_1 ? uops_4_uses_stq : _GEN_1483; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1485 = 3'h5 == value_1 ? uops_5_uses_stq : _GEN_1484; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_uses_stq = 3'h6 == value_1 ? uops_6_uses_stq : _GEN_1485; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1488 = 3'h1 == value_1 ? uops_1_uses_ldq : uops_0_uses_ldq; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1489 = 3'h2 == value_1 ? uops_2_uses_ldq : _GEN_1488; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1490 = 3'h3 == value_1 ? uops_3_uses_ldq : _GEN_1489; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1491 = 3'h4 == value_1 ? uops_4_uses_ldq : _GEN_1490; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1492 = 3'h5 == value_1 ? uops_5_uses_ldq : _GEN_1491; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_uses_ldq = 3'h6 == value_1 ? uops_6_uses_ldq : _GEN_1492; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1495 = 3'h1 == value_1 ? uops_1_is_amo : uops_0_is_amo; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1496 = 3'h2 == value_1 ? uops_2_is_amo : _GEN_1495; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1497 = 3'h3 == value_1 ? uops_3_is_amo : _GEN_1496; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1498 = 3'h4 == value_1 ? uops_4_is_amo : _GEN_1497; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1499 = 3'h5 == value_1 ? uops_5_is_amo : _GEN_1498; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_is_amo = 3'h6 == value_1 ? uops_6_is_amo : _GEN_1499; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1502 = 3'h1 == value_1 ? uops_1_is_fencei : uops_0_is_fencei; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1503 = 3'h2 == value_1 ? uops_2_is_fencei : _GEN_1502; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1504 = 3'h3 == value_1 ? uops_3_is_fencei : _GEN_1503; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1505 = 3'h4 == value_1 ? uops_4_is_fencei : _GEN_1504; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1506 = 3'h5 == value_1 ? uops_5_is_fencei : _GEN_1505; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_is_fencei = 3'h6 == value_1 ? uops_6_is_fencei : _GEN_1506; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1509 = 3'h1 == value_1 ? uops_1_is_fence : uops_0_is_fence; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1510 = 3'h2 == value_1 ? uops_2_is_fence : _GEN_1509; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1511 = 3'h3 == value_1 ? uops_3_is_fence : _GEN_1510; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1512 = 3'h4 == value_1 ? uops_4_is_fence : _GEN_1511; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1513 = 3'h5 == value_1 ? uops_5_is_fence : _GEN_1512; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_is_fence = 3'h6 == value_1 ? uops_6_is_fence : _GEN_1513; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1516 = 3'h1 == value_1 ? uops_1_mem_signed : uops_0_mem_signed; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1517 = 3'h2 == value_1 ? uops_2_mem_signed : _GEN_1516; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1518 = 3'h3 == value_1 ? uops_3_mem_signed : _GEN_1517; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1519 = 3'h4 == value_1 ? uops_4_mem_signed : _GEN_1518; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1520 = 3'h5 == value_1 ? uops_5_mem_signed : _GEN_1519; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_mem_signed = 3'h6 == value_1 ? uops_6_mem_signed : _GEN_1520; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1523 = 3'h1 == value_1 ? uops_1_mem_size : uops_0_mem_size; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1524 = 3'h2 == value_1 ? uops_2_mem_size : _GEN_1523; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1525 = 3'h3 == value_1 ? uops_3_mem_size : _GEN_1524; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1526 = 3'h4 == value_1 ? uops_4_mem_size : _GEN_1525; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1527 = 3'h5 == value_1 ? uops_5_mem_size : _GEN_1526; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] out_uop_mem_size = 3'h6 == value_1 ? uops_6_mem_size : _GEN_1527; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1530 = 3'h1 == value_1 ? uops_1_mem_cmd : uops_0_mem_cmd; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1531 = 3'h2 == value_1 ? uops_2_mem_cmd : _GEN_1530; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1532 = 3'h3 == value_1 ? uops_3_mem_cmd : _GEN_1531; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1533 = 3'h4 == value_1 ? uops_4_mem_cmd : _GEN_1532; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1534 = 3'h5 == value_1 ? uops_5_mem_cmd : _GEN_1533; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] out_uop_mem_cmd = 3'h6 == value_1 ? uops_6_mem_cmd : _GEN_1534; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1537 = 3'h1 == value_1 ? uops_1_bypassable : uops_0_bypassable; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1538 = 3'h2 == value_1 ? uops_2_bypassable : _GEN_1537; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1539 = 3'h3 == value_1 ? uops_3_bypassable : _GEN_1538; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1540 = 3'h4 == value_1 ? uops_4_bypassable : _GEN_1539; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1541 = 3'h5 == value_1 ? uops_5_bypassable : _GEN_1540; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_bypassable = 3'h6 == value_1 ? uops_6_bypassable : _GEN_1541; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_1544 = 3'h1 == value_1 ? uops_1_exc_cause : uops_0_exc_cause; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_1545 = 3'h2 == value_1 ? uops_2_exc_cause : _GEN_1544; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_1546 = 3'h3 == value_1 ? uops_3_exc_cause : _GEN_1545; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_1547 = 3'h4 == value_1 ? uops_4_exc_cause : _GEN_1546; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] _GEN_1548 = 3'h5 == value_1 ? uops_5_exc_cause : _GEN_1547; // @[util.scala 508:19 util.scala 508:19]
  wire [63:0] out_uop_exc_cause = 3'h6 == value_1 ? uops_6_exc_cause : _GEN_1548; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1551 = 3'h1 == value_1 ? uops_1_exception : uops_0_exception; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1552 = 3'h2 == value_1 ? uops_2_exception : _GEN_1551; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1553 = 3'h3 == value_1 ? uops_3_exception : _GEN_1552; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1554 = 3'h4 == value_1 ? uops_4_exception : _GEN_1553; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1555 = 3'h5 == value_1 ? uops_5_exception : _GEN_1554; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_exception = 3'h6 == value_1 ? uops_6_exception : _GEN_1555; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1558 = 3'h1 == value_1 ? uops_1_stale_pdst : uops_0_stale_pdst; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1559 = 3'h2 == value_1 ? uops_2_stale_pdst : _GEN_1558; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1560 = 3'h3 == value_1 ? uops_3_stale_pdst : _GEN_1559; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1561 = 3'h4 == value_1 ? uops_4_stale_pdst : _GEN_1560; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1562 = 3'h5 == value_1 ? uops_5_stale_pdst : _GEN_1561; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] out_uop_stale_pdst = 3'h6 == value_1 ? uops_6_stale_pdst : _GEN_1562; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1565 = 3'h1 == value_1 ? uops_1_ppred_busy : uops_0_ppred_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1566 = 3'h2 == value_1 ? uops_2_ppred_busy : _GEN_1565; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1567 = 3'h3 == value_1 ? uops_3_ppred_busy : _GEN_1566; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1568 = 3'h4 == value_1 ? uops_4_ppred_busy : _GEN_1567; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1569 = 3'h5 == value_1 ? uops_5_ppred_busy : _GEN_1568; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_ppred_busy = 3'h6 == value_1 ? uops_6_ppred_busy : _GEN_1569; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1572 = 3'h1 == value_1 ? uops_1_prs3_busy : uops_0_prs3_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1573 = 3'h2 == value_1 ? uops_2_prs3_busy : _GEN_1572; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1574 = 3'h3 == value_1 ? uops_3_prs3_busy : _GEN_1573; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1575 = 3'h4 == value_1 ? uops_4_prs3_busy : _GEN_1574; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1576 = 3'h5 == value_1 ? uops_5_prs3_busy : _GEN_1575; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_prs3_busy = 3'h6 == value_1 ? uops_6_prs3_busy : _GEN_1576; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1579 = 3'h1 == value_1 ? uops_1_prs2_busy : uops_0_prs2_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1580 = 3'h2 == value_1 ? uops_2_prs2_busy : _GEN_1579; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1581 = 3'h3 == value_1 ? uops_3_prs2_busy : _GEN_1580; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1582 = 3'h4 == value_1 ? uops_4_prs2_busy : _GEN_1581; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1583 = 3'h5 == value_1 ? uops_5_prs2_busy : _GEN_1582; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_prs2_busy = 3'h6 == value_1 ? uops_6_prs2_busy : _GEN_1583; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1586 = 3'h1 == value_1 ? uops_1_prs1_busy : uops_0_prs1_busy; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1587 = 3'h2 == value_1 ? uops_2_prs1_busy : _GEN_1586; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1588 = 3'h3 == value_1 ? uops_3_prs1_busy : _GEN_1587; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1589 = 3'h4 == value_1 ? uops_4_prs1_busy : _GEN_1588; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1590 = 3'h5 == value_1 ? uops_5_prs1_busy : _GEN_1589; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_prs1_busy = 3'h6 == value_1 ? uops_6_prs1_busy : _GEN_1590; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1593 = 3'h1 == value_1 ? uops_1_ppred : uops_0_ppred; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1594 = 3'h2 == value_1 ? uops_2_ppred : _GEN_1593; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1595 = 3'h3 == value_1 ? uops_3_ppred : _GEN_1594; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1596 = 3'h4 == value_1 ? uops_4_ppred : _GEN_1595; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1597 = 3'h5 == value_1 ? uops_5_ppred : _GEN_1596; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] out_uop_ppred = 3'h6 == value_1 ? uops_6_ppred : _GEN_1597; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1600 = 3'h1 == value_1 ? uops_1_prs3 : uops_0_prs3; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1601 = 3'h2 == value_1 ? uops_2_prs3 : _GEN_1600; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1602 = 3'h3 == value_1 ? uops_3_prs3 : _GEN_1601; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1603 = 3'h4 == value_1 ? uops_4_prs3 : _GEN_1602; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1604 = 3'h5 == value_1 ? uops_5_prs3 : _GEN_1603; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] out_uop_prs3 = 3'h6 == value_1 ? uops_6_prs3 : _GEN_1604; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1607 = 3'h1 == value_1 ? uops_1_prs2 : uops_0_prs2; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1608 = 3'h2 == value_1 ? uops_2_prs2 : _GEN_1607; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1609 = 3'h3 == value_1 ? uops_3_prs2 : _GEN_1608; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1610 = 3'h4 == value_1 ? uops_4_prs2 : _GEN_1609; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1611 = 3'h5 == value_1 ? uops_5_prs2 : _GEN_1610; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] out_uop_prs2 = 3'h6 == value_1 ? uops_6_prs2 : _GEN_1611; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1614 = 3'h1 == value_1 ? uops_1_prs1 : uops_0_prs1; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1615 = 3'h2 == value_1 ? uops_2_prs1 : _GEN_1614; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1616 = 3'h3 == value_1 ? uops_3_prs1 : _GEN_1615; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1617 = 3'h4 == value_1 ? uops_4_prs1 : _GEN_1616; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1618 = 3'h5 == value_1 ? uops_5_prs1 : _GEN_1617; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] out_uop_prs1 = 3'h6 == value_1 ? uops_6_prs1 : _GEN_1618; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1621 = 3'h1 == value_1 ? uops_1_pdst : uops_0_pdst; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1622 = 3'h2 == value_1 ? uops_2_pdst : _GEN_1621; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1623 = 3'h3 == value_1 ? uops_3_pdst : _GEN_1622; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1624 = 3'h4 == value_1 ? uops_4_pdst : _GEN_1623; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1625 = 3'h5 == value_1 ? uops_5_pdst : _GEN_1624; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] out_uop_pdst = 3'h6 == value_1 ? uops_6_pdst : _GEN_1625; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1628 = 3'h1 == value_1 ? uops_1_rxq_idx : uops_0_rxq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1629 = 3'h2 == value_1 ? uops_2_rxq_idx : _GEN_1628; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1630 = 3'h3 == value_1 ? uops_3_rxq_idx : _GEN_1629; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1631 = 3'h4 == value_1 ? uops_4_rxq_idx : _GEN_1630; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1632 = 3'h5 == value_1 ? uops_5_rxq_idx : _GEN_1631; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] out_uop_rxq_idx = 3'h6 == value_1 ? uops_6_rxq_idx : _GEN_1632; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1635 = 3'h1 == value_1 ? uops_1_stq_idx : uops_0_stq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1636 = 3'h2 == value_1 ? uops_2_stq_idx : _GEN_1635; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1637 = 3'h3 == value_1 ? uops_3_stq_idx : _GEN_1636; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1638 = 3'h4 == value_1 ? uops_4_stq_idx : _GEN_1637; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1639 = 3'h5 == value_1 ? uops_5_stq_idx : _GEN_1638; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] out_uop_stq_idx = 3'h6 == value_1 ? uops_6_stq_idx : _GEN_1639; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1642 = 3'h1 == value_1 ? uops_1_ldq_idx : uops_0_ldq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1643 = 3'h2 == value_1 ? uops_2_ldq_idx : _GEN_1642; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1644 = 3'h3 == value_1 ? uops_3_ldq_idx : _GEN_1643; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1645 = 3'h4 == value_1 ? uops_4_ldq_idx : _GEN_1644; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1646 = 3'h5 == value_1 ? uops_5_ldq_idx : _GEN_1645; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] out_uop_ldq_idx = 3'h6 == value_1 ? uops_6_ldq_idx : _GEN_1646; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1649 = 3'h1 == value_1 ? uops_1_rob_idx : uops_0_rob_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1650 = 3'h2 == value_1 ? uops_2_rob_idx : _GEN_1649; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1651 = 3'h3 == value_1 ? uops_3_rob_idx : _GEN_1650; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1652 = 3'h4 == value_1 ? uops_4_rob_idx : _GEN_1651; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1653 = 3'h5 == value_1 ? uops_5_rob_idx : _GEN_1652; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] out_uop_rob_idx = 3'h6 == value_1 ? uops_6_rob_idx : _GEN_1653; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_1656 = 3'h1 == value_1 ? uops_1_csr_addr : uops_0_csr_addr; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_1657 = 3'h2 == value_1 ? uops_2_csr_addr : _GEN_1656; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_1658 = 3'h3 == value_1 ? uops_3_csr_addr : _GEN_1657; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_1659 = 3'h4 == value_1 ? uops_4_csr_addr : _GEN_1658; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_1660 = 3'h5 == value_1 ? uops_5_csr_addr : _GEN_1659; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] out_uop_csr_addr = 3'h6 == value_1 ? uops_6_csr_addr : _GEN_1660; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_1663 = 3'h1 == value_1 ? uops_1_imm_packed : uops_0_imm_packed; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_1664 = 3'h2 == value_1 ? uops_2_imm_packed : _GEN_1663; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_1665 = 3'h3 == value_1 ? uops_3_imm_packed : _GEN_1664; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_1666 = 3'h4 == value_1 ? uops_4_imm_packed : _GEN_1665; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] _GEN_1667 = 3'h5 == value_1 ? uops_5_imm_packed : _GEN_1666; // @[util.scala 508:19 util.scala 508:19]
  wire [19:0] out_uop_imm_packed = 3'h6 == value_1 ? uops_6_imm_packed : _GEN_1667; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1670 = 3'h1 == value_1 ? uops_1_taken : uops_0_taken; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1671 = 3'h2 == value_1 ? uops_2_taken : _GEN_1670; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1672 = 3'h3 == value_1 ? uops_3_taken : _GEN_1671; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1673 = 3'h4 == value_1 ? uops_4_taken : _GEN_1672; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1674 = 3'h5 == value_1 ? uops_5_taken : _GEN_1673; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_taken = 3'h6 == value_1 ? uops_6_taken : _GEN_1674; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1677 = 3'h1 == value_1 ? uops_1_pc_lob : uops_0_pc_lob; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1678 = 3'h2 == value_1 ? uops_2_pc_lob : _GEN_1677; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1679 = 3'h3 == value_1 ? uops_3_pc_lob : _GEN_1678; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1680 = 3'h4 == value_1 ? uops_4_pc_lob : _GEN_1679; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] _GEN_1681 = 3'h5 == value_1 ? uops_5_pc_lob : _GEN_1680; // @[util.scala 508:19 util.scala 508:19]
  wire [5:0] out_uop_pc_lob = 3'h6 == value_1 ? uops_6_pc_lob : _GEN_1681; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1684 = 3'h1 == value_1 ? uops_1_edge_inst : uops_0_edge_inst; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1685 = 3'h2 == value_1 ? uops_2_edge_inst : _GEN_1684; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1686 = 3'h3 == value_1 ? uops_3_edge_inst : _GEN_1685; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1687 = 3'h4 == value_1 ? uops_4_edge_inst : _GEN_1686; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1688 = 3'h5 == value_1 ? uops_5_edge_inst : _GEN_1687; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_edge_inst = 3'h6 == value_1 ? uops_6_edge_inst : _GEN_1688; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1691 = 3'h1 == value_1 ? uops_1_ftq_idx : uops_0_ftq_idx; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1692 = 3'h2 == value_1 ? uops_2_ftq_idx : _GEN_1691; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1693 = 3'h3 == value_1 ? uops_3_ftq_idx : _GEN_1692; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1694 = 3'h4 == value_1 ? uops_4_ftq_idx : _GEN_1693; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] _GEN_1695 = 3'h5 == value_1 ? uops_5_ftq_idx : _GEN_1694; // @[util.scala 508:19 util.scala 508:19]
  wire [4:0] out_uop_ftq_idx = 3'h6 == value_1 ? uops_6_ftq_idx : _GEN_1695; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1698 = 3'h1 == value_1 ? uops_1_br_tag : uops_0_br_tag; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1699 = 3'h2 == value_1 ? uops_2_br_tag : _GEN_1698; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1700 = 3'h3 == value_1 ? uops_3_br_tag : _GEN_1699; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1701 = 3'h4 == value_1 ? uops_4_br_tag : _GEN_1700; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1702 = 3'h5 == value_1 ? uops_5_br_tag : _GEN_1701; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] out_uop_br_tag = 3'h6 == value_1 ? uops_6_br_tag : _GEN_1702; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_1705 = 3'h1 == value_1 ? uops_1_br_mask : uops_0_br_mask; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_1706 = 3'h2 == value_1 ? uops_2_br_mask : _GEN_1705; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_1707 = 3'h3 == value_1 ? uops_3_br_mask : _GEN_1706; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_1708 = 3'h4 == value_1 ? uops_4_br_mask : _GEN_1707; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _GEN_1709 = 3'h5 == value_1 ? uops_5_br_mask : _GEN_1708; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] out_uop_br_mask = 3'h6 == value_1 ? uops_6_br_mask : _GEN_1709; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1712 = 3'h1 == value_1 ? uops_1_is_sfb : uops_0_is_sfb; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1713 = 3'h2 == value_1 ? uops_2_is_sfb : _GEN_1712; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1714 = 3'h3 == value_1 ? uops_3_is_sfb : _GEN_1713; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1715 = 3'h4 == value_1 ? uops_4_is_sfb : _GEN_1714; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1716 = 3'h5 == value_1 ? uops_5_is_sfb : _GEN_1715; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_is_sfb = 3'h6 == value_1 ? uops_6_is_sfb : _GEN_1716; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1719 = 3'h1 == value_1 ? uops_1_is_jal : uops_0_is_jal; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1720 = 3'h2 == value_1 ? uops_2_is_jal : _GEN_1719; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1721 = 3'h3 == value_1 ? uops_3_is_jal : _GEN_1720; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1722 = 3'h4 == value_1 ? uops_4_is_jal : _GEN_1721; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1723 = 3'h5 == value_1 ? uops_5_is_jal : _GEN_1722; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_is_jal = 3'h6 == value_1 ? uops_6_is_jal : _GEN_1723; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1726 = 3'h1 == value_1 ? uops_1_is_jalr : uops_0_is_jalr; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1727 = 3'h2 == value_1 ? uops_2_is_jalr : _GEN_1726; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1728 = 3'h3 == value_1 ? uops_3_is_jalr : _GEN_1727; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1729 = 3'h4 == value_1 ? uops_4_is_jalr : _GEN_1728; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1730 = 3'h5 == value_1 ? uops_5_is_jalr : _GEN_1729; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_is_jalr = 3'h6 == value_1 ? uops_6_is_jalr : _GEN_1730; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1733 = 3'h1 == value_1 ? uops_1_is_br : uops_0_is_br; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1734 = 3'h2 == value_1 ? uops_2_is_br : _GEN_1733; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1735 = 3'h3 == value_1 ? uops_3_is_br : _GEN_1734; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1736 = 3'h4 == value_1 ? uops_4_is_br : _GEN_1735; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1737 = 3'h5 == value_1 ? uops_5_is_br : _GEN_1736; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_is_br = 3'h6 == value_1 ? uops_6_is_br : _GEN_1737; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1740 = 3'h1 == value_1 ? uops_1_iw_p2_poisoned : uops_0_iw_p2_poisoned; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1741 = 3'h2 == value_1 ? uops_2_iw_p2_poisoned : _GEN_1740; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1742 = 3'h3 == value_1 ? uops_3_iw_p2_poisoned : _GEN_1741; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1743 = 3'h4 == value_1 ? uops_4_iw_p2_poisoned : _GEN_1742; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1744 = 3'h5 == value_1 ? uops_5_iw_p2_poisoned : _GEN_1743; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_iw_p2_poisoned = 3'h6 == value_1 ? uops_6_iw_p2_poisoned : _GEN_1744; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1747 = 3'h1 == value_1 ? uops_1_iw_p1_poisoned : uops_0_iw_p1_poisoned; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1748 = 3'h2 == value_1 ? uops_2_iw_p1_poisoned : _GEN_1747; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1749 = 3'h3 == value_1 ? uops_3_iw_p1_poisoned : _GEN_1748; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1750 = 3'h4 == value_1 ? uops_4_iw_p1_poisoned : _GEN_1749; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1751 = 3'h5 == value_1 ? uops_5_iw_p1_poisoned : _GEN_1750; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_iw_p1_poisoned = 3'h6 == value_1 ? uops_6_iw_p1_poisoned : _GEN_1751; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1754 = 3'h1 == value_1 ? uops_1_iw_state : uops_0_iw_state; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1755 = 3'h2 == value_1 ? uops_2_iw_state : _GEN_1754; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1756 = 3'h3 == value_1 ? uops_3_iw_state : _GEN_1755; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1757 = 3'h4 == value_1 ? uops_4_iw_state : _GEN_1756; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1758 = 3'h5 == value_1 ? uops_5_iw_state : _GEN_1757; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] out_uop_iw_state = 3'h6 == value_1 ? uops_6_iw_state : _GEN_1758; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1761 = 3'h1 == value_1 ? uops_1_ctrl_is_std : uops_0_ctrl_is_std; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1762 = 3'h2 == value_1 ? uops_2_ctrl_is_std : _GEN_1761; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1763 = 3'h3 == value_1 ? uops_3_ctrl_is_std : _GEN_1762; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1764 = 3'h4 == value_1 ? uops_4_ctrl_is_std : _GEN_1763; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1765 = 3'h5 == value_1 ? uops_5_ctrl_is_std : _GEN_1764; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_ctrl_is_std = 3'h6 == value_1 ? uops_6_ctrl_is_std : _GEN_1765; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1768 = 3'h1 == value_1 ? uops_1_ctrl_is_sta : uops_0_ctrl_is_sta; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1769 = 3'h2 == value_1 ? uops_2_ctrl_is_sta : _GEN_1768; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1770 = 3'h3 == value_1 ? uops_3_ctrl_is_sta : _GEN_1769; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1771 = 3'h4 == value_1 ? uops_4_ctrl_is_sta : _GEN_1770; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1772 = 3'h5 == value_1 ? uops_5_ctrl_is_sta : _GEN_1771; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_ctrl_is_sta = 3'h6 == value_1 ? uops_6_ctrl_is_sta : _GEN_1772; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1775 = 3'h1 == value_1 ? uops_1_ctrl_is_load : uops_0_ctrl_is_load; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1776 = 3'h2 == value_1 ? uops_2_ctrl_is_load : _GEN_1775; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1777 = 3'h3 == value_1 ? uops_3_ctrl_is_load : _GEN_1776; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1778 = 3'h4 == value_1 ? uops_4_ctrl_is_load : _GEN_1777; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1779 = 3'h5 == value_1 ? uops_5_ctrl_is_load : _GEN_1778; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_ctrl_is_load = 3'h6 == value_1 ? uops_6_ctrl_is_load : _GEN_1779; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1782 = 3'h1 == value_1 ? uops_1_ctrl_csr_cmd : uops_0_ctrl_csr_cmd; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1783 = 3'h2 == value_1 ? uops_2_ctrl_csr_cmd : _GEN_1782; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1784 = 3'h3 == value_1 ? uops_3_ctrl_csr_cmd : _GEN_1783; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1785 = 3'h4 == value_1 ? uops_4_ctrl_csr_cmd : _GEN_1784; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1786 = 3'h5 == value_1 ? uops_5_ctrl_csr_cmd : _GEN_1785; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] out_uop_ctrl_csr_cmd = 3'h6 == value_1 ? uops_6_ctrl_csr_cmd : _GEN_1786; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1789 = 3'h1 == value_1 ? uops_1_ctrl_fcn_dw : uops_0_ctrl_fcn_dw; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1790 = 3'h2 == value_1 ? uops_2_ctrl_fcn_dw : _GEN_1789; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1791 = 3'h3 == value_1 ? uops_3_ctrl_fcn_dw : _GEN_1790; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1792 = 3'h4 == value_1 ? uops_4_ctrl_fcn_dw : _GEN_1791; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1793 = 3'h5 == value_1 ? uops_5_ctrl_fcn_dw : _GEN_1792; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_ctrl_fcn_dw = 3'h6 == value_1 ? uops_6_ctrl_fcn_dw : _GEN_1793; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1796 = 3'h1 == value_1 ? uops_1_ctrl_op_fcn : uops_0_ctrl_op_fcn; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1797 = 3'h2 == value_1 ? uops_2_ctrl_op_fcn : _GEN_1796; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1798 = 3'h3 == value_1 ? uops_3_ctrl_op_fcn : _GEN_1797; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1799 = 3'h4 == value_1 ? uops_4_ctrl_op_fcn : _GEN_1798; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1800 = 3'h5 == value_1 ? uops_5_ctrl_op_fcn : _GEN_1799; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] out_uop_ctrl_op_fcn = 3'h6 == value_1 ? uops_6_ctrl_op_fcn : _GEN_1800; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1803 = 3'h1 == value_1 ? uops_1_ctrl_imm_sel : uops_0_ctrl_imm_sel; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1804 = 3'h2 == value_1 ? uops_2_ctrl_imm_sel : _GEN_1803; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1805 = 3'h3 == value_1 ? uops_3_ctrl_imm_sel : _GEN_1804; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1806 = 3'h4 == value_1 ? uops_4_ctrl_imm_sel : _GEN_1805; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1807 = 3'h5 == value_1 ? uops_5_ctrl_imm_sel : _GEN_1806; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] out_uop_ctrl_imm_sel = 3'h6 == value_1 ? uops_6_ctrl_imm_sel : _GEN_1807; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1810 = 3'h1 == value_1 ? uops_1_ctrl_op2_sel : uops_0_ctrl_op2_sel; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1811 = 3'h2 == value_1 ? uops_2_ctrl_op2_sel : _GEN_1810; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1812 = 3'h3 == value_1 ? uops_3_ctrl_op2_sel : _GEN_1811; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1813 = 3'h4 == value_1 ? uops_4_ctrl_op2_sel : _GEN_1812; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1814 = 3'h5 == value_1 ? uops_5_ctrl_op2_sel : _GEN_1813; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] out_uop_ctrl_op2_sel = 3'h6 == value_1 ? uops_6_ctrl_op2_sel : _GEN_1814; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1817 = 3'h1 == value_1 ? uops_1_ctrl_op1_sel : uops_0_ctrl_op1_sel; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1818 = 3'h2 == value_1 ? uops_2_ctrl_op1_sel : _GEN_1817; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1819 = 3'h3 == value_1 ? uops_3_ctrl_op1_sel : _GEN_1818; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1820 = 3'h4 == value_1 ? uops_4_ctrl_op1_sel : _GEN_1819; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] _GEN_1821 = 3'h5 == value_1 ? uops_5_ctrl_op1_sel : _GEN_1820; // @[util.scala 508:19 util.scala 508:19]
  wire [1:0] out_uop_ctrl_op1_sel = 3'h6 == value_1 ? uops_6_ctrl_op1_sel : _GEN_1821; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1824 = 3'h1 == value_1 ? uops_1_ctrl_br_type : uops_0_ctrl_br_type; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1825 = 3'h2 == value_1 ? uops_2_ctrl_br_type : _GEN_1824; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1826 = 3'h3 == value_1 ? uops_3_ctrl_br_type : _GEN_1825; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1827 = 3'h4 == value_1 ? uops_4_ctrl_br_type : _GEN_1826; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] _GEN_1828 = 3'h5 == value_1 ? uops_5_ctrl_br_type : _GEN_1827; // @[util.scala 508:19 util.scala 508:19]
  wire [3:0] out_uop_ctrl_br_type = 3'h6 == value_1 ? uops_6_ctrl_br_type : _GEN_1828; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_1831 = 3'h1 == value_1 ? uops_1_fu_code : uops_0_fu_code; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_1832 = 3'h2 == value_1 ? uops_2_fu_code : _GEN_1831; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_1833 = 3'h3 == value_1 ? uops_3_fu_code : _GEN_1832; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_1834 = 3'h4 == value_1 ? uops_4_fu_code : _GEN_1833; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] _GEN_1835 = 3'h5 == value_1 ? uops_5_fu_code : _GEN_1834; // @[util.scala 508:19 util.scala 508:19]
  wire [9:0] out_uop_fu_code = 3'h6 == value_1 ? uops_6_fu_code : _GEN_1835; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1838 = 3'h1 == value_1 ? uops_1_iq_type : uops_0_iq_type; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1839 = 3'h2 == value_1 ? uops_2_iq_type : _GEN_1838; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1840 = 3'h3 == value_1 ? uops_3_iq_type : _GEN_1839; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1841 = 3'h4 == value_1 ? uops_4_iq_type : _GEN_1840; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] _GEN_1842 = 3'h5 == value_1 ? uops_5_iq_type : _GEN_1841; // @[util.scala 508:19 util.scala 508:19]
  wire [2:0] out_uop_iq_type = 3'h6 == value_1 ? uops_6_iq_type : _GEN_1842; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_1845 = 3'h1 == value_1 ? uops_1_debug_pc : uops_0_debug_pc; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_1846 = 3'h2 == value_1 ? uops_2_debug_pc : _GEN_1845; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_1847 = 3'h3 == value_1 ? uops_3_debug_pc : _GEN_1846; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_1848 = 3'h4 == value_1 ? uops_4_debug_pc : _GEN_1847; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] _GEN_1849 = 3'h5 == value_1 ? uops_5_debug_pc : _GEN_1848; // @[util.scala 508:19 util.scala 508:19]
  wire [39:0] out_uop_debug_pc = 3'h6 == value_1 ? uops_6_debug_pc : _GEN_1849; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1852 = 3'h1 == value_1 ? uops_1_is_rvc : uops_0_is_rvc; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1853 = 3'h2 == value_1 ? uops_2_is_rvc : _GEN_1852; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1854 = 3'h3 == value_1 ? uops_3_is_rvc : _GEN_1853; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1855 = 3'h4 == value_1 ? uops_4_is_rvc : _GEN_1854; // @[util.scala 508:19 util.scala 508:19]
  wire  _GEN_1856 = 3'h5 == value_1 ? uops_5_is_rvc : _GEN_1855; // @[util.scala 508:19 util.scala 508:19]
  wire  out_uop_is_rvc = 3'h6 == value_1 ? uops_6_is_rvc : _GEN_1856; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1859 = 3'h1 == value_1 ? uops_1_debug_inst : uops_0_debug_inst; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1860 = 3'h2 == value_1 ? uops_2_debug_inst : _GEN_1859; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1861 = 3'h3 == value_1 ? uops_3_debug_inst : _GEN_1860; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1862 = 3'h4 == value_1 ? uops_4_debug_inst : _GEN_1861; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1863 = 3'h5 == value_1 ? uops_5_debug_inst : _GEN_1862; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] out_uop_debug_inst = 3'h6 == value_1 ? uops_6_debug_inst : _GEN_1863; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1866 = 3'h1 == value_1 ? uops_1_inst : uops_0_inst; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1867 = 3'h2 == value_1 ? uops_2_inst : _GEN_1866; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1868 = 3'h3 == value_1 ? uops_3_inst : _GEN_1867; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1869 = 3'h4 == value_1 ? uops_4_inst : _GEN_1868; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] _GEN_1870 = 3'h5 == value_1 ? uops_5_inst : _GEN_1869; // @[util.scala 508:19 util.scala 508:19]
  wire [31:0] out_uop_inst = 3'h6 == value_1 ? uops_6_inst : _GEN_1870; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_1873 = 3'h1 == value_1 ? uops_1_uopc : uops_0_uopc; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_1874 = 3'h2 == value_1 ? uops_2_uopc : _GEN_1873; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_1875 = 3'h3 == value_1 ? uops_3_uopc : _GEN_1874; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_1876 = 3'h4 == value_1 ? uops_4_uopc : _GEN_1875; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] _GEN_1877 = 3'h5 == value_1 ? uops_5_uopc : _GEN_1876; // @[util.scala 508:19 util.scala 508:19]
  wire [6:0] out_uop_uopc = 3'h6 == value_1 ? uops_6_uopc : _GEN_1877; // @[util.scala 508:19 util.scala 508:19]
  wire [11:0] _T_76 = io_brupdate_b1_mispredict_mask & out_uop_br_mask; // @[util.scala 118:51]
  wire  _T_77 = _T_76 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_84 = out_uop_br_mask & _T_14; // @[util.scala 85:25]
  wire [4:0] out_fflags_bits_flags = ram_fflags_bits_flags_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [1:0] out_fflags_bits_uop_debug_tsrc = ram_fflags_bits_uop_debug_tsrc_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [1:0] out_fflags_bits_uop_debug_fsrc = ram_fflags_bits_uop_debug_fsrc_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_bp_xcpt_if = ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_bp_debug_if = ram_fflags_bits_uop_bp_debug_if_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_xcpt_ma_if = ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_xcpt_ae_if = ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_xcpt_pf_if = ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_fp_single = ram_fflags_bits_uop_fp_single_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_fp_val = ram_fflags_bits_uop_fp_val_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_frs3_en = ram_fflags_bits_uop_frs3_en_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [1:0] out_fflags_bits_uop_lrs2_rtype = ram_fflags_bits_uop_lrs2_rtype_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [1:0] out_fflags_bits_uop_lrs1_rtype = ram_fflags_bits_uop_lrs1_rtype_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [1:0] out_fflags_bits_uop_dst_rtype = ram_fflags_bits_uop_dst_rtype_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_ldst_val = ram_fflags_bits_uop_ldst_val_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [5:0] out_fflags_bits_uop_lrs3 = ram_fflags_bits_uop_lrs3_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [5:0] out_fflags_bits_uop_lrs2 = ram_fflags_bits_uop_lrs2_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [5:0] out_fflags_bits_uop_lrs1 = ram_fflags_bits_uop_lrs1_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [5:0] out_fflags_bits_uop_ldst = ram_fflags_bits_uop_ldst_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_ldst_is_rs1 = ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_flush_on_commit = ram_fflags_bits_uop_flush_on_commit_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_is_unique = ram_fflags_bits_uop_is_unique_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_is_sys_pc2epc = ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_uses_stq = ram_fflags_bits_uop_uses_stq_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_uses_ldq = ram_fflags_bits_uop_uses_ldq_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_is_amo = ram_fflags_bits_uop_is_amo_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_is_fencei = ram_fflags_bits_uop_is_fencei_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_is_fence = ram_fflags_bits_uop_is_fence_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_mem_signed = ram_fflags_bits_uop_mem_signed_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [1:0] out_fflags_bits_uop_mem_size = ram_fflags_bits_uop_mem_size_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [4:0] out_fflags_bits_uop_mem_cmd = ram_fflags_bits_uop_mem_cmd_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_bypassable = ram_fflags_bits_uop_bypassable_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [63:0] out_fflags_bits_uop_exc_cause = ram_fflags_bits_uop_exc_cause_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_exception = ram_fflags_bits_uop_exception_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [5:0] out_fflags_bits_uop_stale_pdst = ram_fflags_bits_uop_stale_pdst_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_ppred_busy = ram_fflags_bits_uop_ppred_busy_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_prs3_busy = ram_fflags_bits_uop_prs3_busy_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_prs2_busy = ram_fflags_bits_uop_prs2_busy_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_prs1_busy = ram_fflags_bits_uop_prs1_busy_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [4:0] out_fflags_bits_uop_ppred = ram_fflags_bits_uop_ppred_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [5:0] out_fflags_bits_uop_prs3 = ram_fflags_bits_uop_prs3_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [5:0] out_fflags_bits_uop_prs2 = ram_fflags_bits_uop_prs2_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [5:0] out_fflags_bits_uop_prs1 = ram_fflags_bits_uop_prs1_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [5:0] out_fflags_bits_uop_pdst = ram_fflags_bits_uop_pdst_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [1:0] out_fflags_bits_uop_rxq_idx = ram_fflags_bits_uop_rxq_idx_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [3:0] out_fflags_bits_uop_stq_idx = ram_fflags_bits_uop_stq_idx_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [3:0] out_fflags_bits_uop_ldq_idx = ram_fflags_bits_uop_ldq_idx_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [5:0] out_fflags_bits_uop_rob_idx = ram_fflags_bits_uop_rob_idx_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [11:0] out_fflags_bits_uop_csr_addr = ram_fflags_bits_uop_csr_addr_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [19:0] out_fflags_bits_uop_imm_packed = ram_fflags_bits_uop_imm_packed_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_taken = ram_fflags_bits_uop_taken_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [5:0] out_fflags_bits_uop_pc_lob = ram_fflags_bits_uop_pc_lob_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_edge_inst = ram_fflags_bits_uop_edge_inst_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [4:0] out_fflags_bits_uop_ftq_idx = ram_fflags_bits_uop_ftq_idx_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [3:0] out_fflags_bits_uop_br_tag = ram_fflags_bits_uop_br_tag_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [11:0] out_fflags_bits_uop_br_mask = ram_fflags_bits_uop_br_mask_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_is_sfb = ram_fflags_bits_uop_is_sfb_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_is_jal = ram_fflags_bits_uop_is_jal_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_is_jalr = ram_fflags_bits_uop_is_jalr_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_is_br = ram_fflags_bits_uop_is_br_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_iw_p2_poisoned = ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_iw_p1_poisoned = ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [1:0] out_fflags_bits_uop_iw_state = ram_fflags_bits_uop_iw_state_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_ctrl_is_std = ram_fflags_bits_uop_ctrl_is_std_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_ctrl_is_sta = ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_ctrl_is_load = ram_fflags_bits_uop_ctrl_is_load_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [2:0] out_fflags_bits_uop_ctrl_csr_cmd = ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_ctrl_fcn_dw = ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [3:0] out_fflags_bits_uop_ctrl_op_fcn = ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [2:0] out_fflags_bits_uop_ctrl_imm_sel = ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [2:0] out_fflags_bits_uop_ctrl_op2_sel = ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [1:0] out_fflags_bits_uop_ctrl_op1_sel = ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [3:0] out_fflags_bits_uop_ctrl_br_type = ram_fflags_bits_uop_ctrl_br_type_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [9:0] out_fflags_bits_uop_fu_code = ram_fflags_bits_uop_fu_code_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [2:0] out_fflags_bits_uop_iq_type = ram_fflags_bits_uop_iq_type_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [39:0] out_fflags_bits_uop_debug_pc = ram_fflags_bits_uop_debug_pc_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_bits_uop_is_rvc = ram_fflags_bits_uop_is_rvc_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [31:0] out_fflags_bits_uop_debug_inst = ram_fflags_bits_uop_debug_inst_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [31:0] out_fflags_bits_uop_inst = ram_fflags_bits_uop_inst_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [6:0] out_fflags_bits_uop_uopc = ram_fflags_bits_uop_uopc_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_fflags_valid = ram_fflags_valid_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire  out_predicated = ram_predicated_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [64:0] out_data = ram_data_MPORT_1_data; // @[util.scala 506:17 util.scala 507:19]
  wire [2:0] _T_88 = value - value_1; // @[util.scala 524:40]
  wire [2:0] _T_89 = maybe_full ? 3'h7 : 3'h0; // @[util.scala 530:24]
  wire [2:0] _T_92 = 3'h7 + _T_88; // @[util.scala 533:40]
  wire [2:0] _T_93 = value_1 > value ? _T_92 : _T_88; // @[util.scala 532:24]
  assign ram_data_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_data_MPORT_1_data = ram_data[ram_data_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_data_MPORT_1_data = ram_data_MPORT_1_addr >= 3'h7 ? _RAND_1[64:0] : ram_data[ram_data_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_predicated_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_predicated_MPORT_1_data = ram_predicated[ram_predicated_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_predicated_MPORT_1_data = ram_predicated_MPORT_1_addr >= 3'h7 ? _RAND_3[0:0] :
    ram_predicated[ram_predicated_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_predicated_MPORT_data = io_enq_bits_predicated;
  assign ram_predicated_MPORT_addr = value;
  assign ram_predicated_MPORT_mask = 1'h1;
  assign ram_predicated_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_valid_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_valid_MPORT_1_data = ram_fflags_valid[ram_fflags_valid_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_valid_MPORT_1_data = ram_fflags_valid_MPORT_1_addr >= 3'h7 ? _RAND_5[0:0] :
    ram_fflags_valid[ram_fflags_valid_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_valid_MPORT_data = io_enq_bits_fflags_valid;
  assign ram_fflags_valid_MPORT_addr = value;
  assign ram_fflags_valid_MPORT_mask = 1'h1;
  assign ram_fflags_valid_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_uopc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uopc_MPORT_1_data = ram_fflags_bits_uop_uopc[ram_fflags_bits_uop_uopc_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_uopc_MPORT_1_data = ram_fflags_bits_uop_uopc_MPORT_1_addr >= 3'h7 ? _RAND_7[6:0] :
    ram_fflags_bits_uop_uopc[ram_fflags_bits_uop_uopc_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uopc_MPORT_data = io_enq_bits_fflags_bits_uop_uopc;
  assign ram_fflags_bits_uop_uopc_MPORT_addr = value;
  assign ram_fflags_bits_uop_uopc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_uopc_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_inst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_inst_MPORT_1_data = ram_fflags_bits_uop_inst[ram_fflags_bits_uop_inst_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_inst_MPORT_1_data = ram_fflags_bits_uop_inst_MPORT_1_addr >= 3'h7 ? _RAND_9[31:0] :
    ram_fflags_bits_uop_inst[ram_fflags_bits_uop_inst_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_inst_MPORT_data = io_enq_bits_fflags_bits_uop_inst;
  assign ram_fflags_bits_uop_inst_MPORT_addr = value;
  assign ram_fflags_bits_uop_inst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_inst_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_debug_inst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_inst_MPORT_1_data =
    ram_fflags_bits_uop_debug_inst[ram_fflags_bits_uop_debug_inst_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_debug_inst_MPORT_1_data = ram_fflags_bits_uop_debug_inst_MPORT_1_addr >= 3'h7 ? _RAND_11[31
    :0] : ram_fflags_bits_uop_debug_inst[ram_fflags_bits_uop_debug_inst_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_inst_MPORT_data = io_enq_bits_fflags_bits_uop_debug_inst;
  assign ram_fflags_bits_uop_debug_inst_MPORT_addr = value;
  assign ram_fflags_bits_uop_debug_inst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_debug_inst_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_is_rvc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_rvc_MPORT_1_data = ram_fflags_bits_uop_is_rvc[ram_fflags_bits_uop_is_rvc_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_is_rvc_MPORT_1_data = ram_fflags_bits_uop_is_rvc_MPORT_1_addr >= 3'h7 ? _RAND_13[0:0] :
    ram_fflags_bits_uop_is_rvc[ram_fflags_bits_uop_is_rvc_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_rvc_MPORT_data = io_enq_bits_fflags_bits_uop_is_rvc;
  assign ram_fflags_bits_uop_is_rvc_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_rvc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_rvc_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_debug_pc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_pc_MPORT_1_data =
    ram_fflags_bits_uop_debug_pc[ram_fflags_bits_uop_debug_pc_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_debug_pc_MPORT_1_data = ram_fflags_bits_uop_debug_pc_MPORT_1_addr >= 3'h7 ? _RAND_15[39:0]
     : ram_fflags_bits_uop_debug_pc[ram_fflags_bits_uop_debug_pc_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_pc_MPORT_data = io_enq_bits_fflags_bits_uop_debug_pc;
  assign ram_fflags_bits_uop_debug_pc_MPORT_addr = value;
  assign ram_fflags_bits_uop_debug_pc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_debug_pc_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_iq_type_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iq_type_MPORT_1_data =
    ram_fflags_bits_uop_iq_type[ram_fflags_bits_uop_iq_type_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_iq_type_MPORT_1_data = ram_fflags_bits_uop_iq_type_MPORT_1_addr >= 3'h7 ? _RAND_17[2:0] :
    ram_fflags_bits_uop_iq_type[ram_fflags_bits_uop_iq_type_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iq_type_MPORT_data = io_enq_bits_fflags_bits_uop_iq_type;
  assign ram_fflags_bits_uop_iq_type_MPORT_addr = value;
  assign ram_fflags_bits_uop_iq_type_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_iq_type_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_fu_code_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fu_code_MPORT_1_data =
    ram_fflags_bits_uop_fu_code[ram_fflags_bits_uop_fu_code_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_fu_code_MPORT_1_data = ram_fflags_bits_uop_fu_code_MPORT_1_addr >= 3'h7 ? _RAND_19[9:0] :
    ram_fflags_bits_uop_fu_code[ram_fflags_bits_uop_fu_code_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fu_code_MPORT_data = io_enq_bits_fflags_bits_uop_fu_code;
  assign ram_fflags_bits_uop_fu_code_MPORT_addr = value;
  assign ram_fflags_bits_uop_fu_code_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_fu_code_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_br_type[ram_fflags_bits_uop_ctrl_br_type_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_1_data = ram_fflags_bits_uop_ctrl_br_type_MPORT_1_addr >= 3'h7 ?
    _RAND_21[3:0] : ram_fflags_bits_uop_ctrl_br_type[ram_fflags_bits_uop_ctrl_br_type_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_br_type;
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_br_type_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_op1_sel[ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_data = ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_addr >= 3'h7 ?
    _RAND_23[1:0] : ram_fflags_bits_uop_ctrl_op1_sel[ram_fflags_bits_uop_ctrl_op1_sel_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_op1_sel;
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_op1_sel_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_op2_sel[ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_data = ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_addr >= 3'h7 ?
    _RAND_25[2:0] : ram_fflags_bits_uop_ctrl_op2_sel[ram_fflags_bits_uop_ctrl_op2_sel_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_op2_sel;
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_op2_sel_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_imm_sel[ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_data = ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_addr >= 3'h7 ?
    _RAND_27[2:0] : ram_fflags_bits_uop_ctrl_imm_sel[ram_fflags_bits_uop_ctrl_imm_sel_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_imm_sel;
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_imm_sel_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_op_fcn[ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_data = ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_addr >= 3'h7 ? _RAND_29[
    3:0] : ram_fflags_bits_uop_ctrl_op_fcn[ram_fflags_bits_uop_ctrl_op_fcn_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_op_fcn;
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_op_fcn_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_fcn_dw[ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_data = ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_addr >= 3'h7 ? _RAND_31[
    0:0] : ram_fflags_bits_uop_ctrl_fcn_dw[ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_fcn_dw;
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_csr_cmd[ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_data = ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_addr >= 3'h7 ?
    _RAND_33[2:0] : ram_fflags_bits_uop_ctrl_csr_cmd[ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_csr_cmd;
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_is_load[ram_fflags_bits_uop_ctrl_is_load_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_1_data = ram_fflags_bits_uop_ctrl_is_load_MPORT_1_addr >= 3'h7 ?
    _RAND_35[0:0] : ram_fflags_bits_uop_ctrl_is_load[ram_fflags_bits_uop_ctrl_is_load_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_is_load;
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_is_load_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_is_sta[ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_data = ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_addr >= 3'h7 ? _RAND_37[
    0:0] : ram_fflags_bits_uop_ctrl_is_sta[ram_fflags_bits_uop_ctrl_is_sta_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_is_sta;
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_is_sta_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_1_data =
    ram_fflags_bits_uop_ctrl_is_std[ram_fflags_bits_uop_ctrl_is_std_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_1_data = ram_fflags_bits_uop_ctrl_is_std_MPORT_1_addr >= 3'h7 ? _RAND_39[
    0:0] : ram_fflags_bits_uop_ctrl_is_std[ram_fflags_bits_uop_ctrl_is_std_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_data = io_enq_bits_fflags_bits_uop_ctrl_is_std;
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_addr = value;
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ctrl_is_std_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_iw_state_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_state_MPORT_1_data =
    ram_fflags_bits_uop_iw_state[ram_fflags_bits_uop_iw_state_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_iw_state_MPORT_1_data = ram_fflags_bits_uop_iw_state_MPORT_1_addr >= 3'h7 ? _RAND_41[1:0]
     : ram_fflags_bits_uop_iw_state[ram_fflags_bits_uop_iw_state_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_state_MPORT_data = io_enq_bits_fflags_bits_uop_iw_state;
  assign ram_fflags_bits_uop_iw_state_MPORT_addr = value;
  assign ram_fflags_bits_uop_iw_state_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_iw_state_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_data =
    ram_fflags_bits_uop_iw_p1_poisoned[ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_data = ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_addr >= 3'h7 ?
    _RAND_43[0:0] : ram_fflags_bits_uop_iw_p1_poisoned[ram_fflags_bits_uop_iw_p1_poisoned_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_data = io_enq_bits_fflags_bits_uop_iw_p1_poisoned;
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_addr = value;
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_iw_p1_poisoned_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_data =
    ram_fflags_bits_uop_iw_p2_poisoned[ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_data = ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_addr >= 3'h7 ?
    _RAND_45[0:0] : ram_fflags_bits_uop_iw_p2_poisoned[ram_fflags_bits_uop_iw_p2_poisoned_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_data = io_enq_bits_fflags_bits_uop_iw_p2_poisoned;
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_addr = value;
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_iw_p2_poisoned_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_is_br_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_br_MPORT_1_data = ram_fflags_bits_uop_is_br[ram_fflags_bits_uop_is_br_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_is_br_MPORT_1_data = ram_fflags_bits_uop_is_br_MPORT_1_addr >= 3'h7 ? _RAND_47[0:0] :
    ram_fflags_bits_uop_is_br[ram_fflags_bits_uop_is_br_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_br_MPORT_data = io_enq_bits_fflags_bits_uop_is_br;
  assign ram_fflags_bits_uop_is_br_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_br_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_br_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_is_jalr_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_jalr_MPORT_1_data =
    ram_fflags_bits_uop_is_jalr[ram_fflags_bits_uop_is_jalr_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_is_jalr_MPORT_1_data = ram_fflags_bits_uop_is_jalr_MPORT_1_addr >= 3'h7 ? _RAND_49[0:0] :
    ram_fflags_bits_uop_is_jalr[ram_fflags_bits_uop_is_jalr_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_jalr_MPORT_data = io_enq_bits_fflags_bits_uop_is_jalr;
  assign ram_fflags_bits_uop_is_jalr_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_jalr_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_jalr_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_is_jal_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_jal_MPORT_1_data = ram_fflags_bits_uop_is_jal[ram_fflags_bits_uop_is_jal_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_is_jal_MPORT_1_data = ram_fflags_bits_uop_is_jal_MPORT_1_addr >= 3'h7 ? _RAND_51[0:0] :
    ram_fflags_bits_uop_is_jal[ram_fflags_bits_uop_is_jal_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_jal_MPORT_data = io_enq_bits_fflags_bits_uop_is_jal;
  assign ram_fflags_bits_uop_is_jal_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_jal_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_jal_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_is_sfb_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_sfb_MPORT_1_data = ram_fflags_bits_uop_is_sfb[ram_fflags_bits_uop_is_sfb_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_is_sfb_MPORT_1_data = ram_fflags_bits_uop_is_sfb_MPORT_1_addr >= 3'h7 ? _RAND_53[0:0] :
    ram_fflags_bits_uop_is_sfb[ram_fflags_bits_uop_is_sfb_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_sfb_MPORT_data = io_enq_bits_fflags_bits_uop_is_sfb;
  assign ram_fflags_bits_uop_is_sfb_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_sfb_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_sfb_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_br_mask_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_br_mask_MPORT_1_data =
    ram_fflags_bits_uop_br_mask[ram_fflags_bits_uop_br_mask_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_br_mask_MPORT_1_data = ram_fflags_bits_uop_br_mask_MPORT_1_addr >= 3'h7 ? _RAND_55[11:0] :
    ram_fflags_bits_uop_br_mask[ram_fflags_bits_uop_br_mask_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_br_mask_MPORT_data = io_enq_bits_fflags_bits_uop_br_mask;
  assign ram_fflags_bits_uop_br_mask_MPORT_addr = value;
  assign ram_fflags_bits_uop_br_mask_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_br_mask_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_br_tag_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_br_tag_MPORT_1_data = ram_fflags_bits_uop_br_tag[ram_fflags_bits_uop_br_tag_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_br_tag_MPORT_1_data = ram_fflags_bits_uop_br_tag_MPORT_1_addr >= 3'h7 ? _RAND_57[3:0] :
    ram_fflags_bits_uop_br_tag[ram_fflags_bits_uop_br_tag_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_br_tag_MPORT_data = io_enq_bits_fflags_bits_uop_br_tag;
  assign ram_fflags_bits_uop_br_tag_MPORT_addr = value;
  assign ram_fflags_bits_uop_br_tag_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_br_tag_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ftq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ftq_idx_MPORT_1_data =
    ram_fflags_bits_uop_ftq_idx[ram_fflags_bits_uop_ftq_idx_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ftq_idx_MPORT_1_data = ram_fflags_bits_uop_ftq_idx_MPORT_1_addr >= 3'h7 ? _RAND_59[4:0] :
    ram_fflags_bits_uop_ftq_idx[ram_fflags_bits_uop_ftq_idx_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ftq_idx_MPORT_data = io_enq_bits_fflags_bits_uop_ftq_idx;
  assign ram_fflags_bits_uop_ftq_idx_MPORT_addr = value;
  assign ram_fflags_bits_uop_ftq_idx_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ftq_idx_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_edge_inst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_edge_inst_MPORT_1_data =
    ram_fflags_bits_uop_edge_inst[ram_fflags_bits_uop_edge_inst_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_edge_inst_MPORT_1_data = ram_fflags_bits_uop_edge_inst_MPORT_1_addr >= 3'h7 ? _RAND_61[0:0]
     : ram_fflags_bits_uop_edge_inst[ram_fflags_bits_uop_edge_inst_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_edge_inst_MPORT_data = io_enq_bits_fflags_bits_uop_edge_inst;
  assign ram_fflags_bits_uop_edge_inst_MPORT_addr = value;
  assign ram_fflags_bits_uop_edge_inst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_edge_inst_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_pc_lob_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pc_lob_MPORT_1_data = ram_fflags_bits_uop_pc_lob[ram_fflags_bits_uop_pc_lob_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_pc_lob_MPORT_1_data = ram_fflags_bits_uop_pc_lob_MPORT_1_addr >= 3'h7 ? _RAND_63[5:0] :
    ram_fflags_bits_uop_pc_lob[ram_fflags_bits_uop_pc_lob_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pc_lob_MPORT_data = io_enq_bits_fflags_bits_uop_pc_lob;
  assign ram_fflags_bits_uop_pc_lob_MPORT_addr = value;
  assign ram_fflags_bits_uop_pc_lob_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_pc_lob_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_taken_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_taken_MPORT_1_data = ram_fflags_bits_uop_taken[ram_fflags_bits_uop_taken_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_taken_MPORT_1_data = ram_fflags_bits_uop_taken_MPORT_1_addr >= 3'h7 ? _RAND_65[0:0] :
    ram_fflags_bits_uop_taken[ram_fflags_bits_uop_taken_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_taken_MPORT_data = io_enq_bits_fflags_bits_uop_taken;
  assign ram_fflags_bits_uop_taken_MPORT_addr = value;
  assign ram_fflags_bits_uop_taken_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_taken_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_imm_packed_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_imm_packed_MPORT_1_data =
    ram_fflags_bits_uop_imm_packed[ram_fflags_bits_uop_imm_packed_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_imm_packed_MPORT_1_data = ram_fflags_bits_uop_imm_packed_MPORT_1_addr >= 3'h7 ? _RAND_67[19
    :0] : ram_fflags_bits_uop_imm_packed[ram_fflags_bits_uop_imm_packed_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_imm_packed_MPORT_data = io_enq_bits_fflags_bits_uop_imm_packed;
  assign ram_fflags_bits_uop_imm_packed_MPORT_addr = value;
  assign ram_fflags_bits_uop_imm_packed_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_imm_packed_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_csr_addr_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_csr_addr_MPORT_1_data =
    ram_fflags_bits_uop_csr_addr[ram_fflags_bits_uop_csr_addr_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_csr_addr_MPORT_1_data = ram_fflags_bits_uop_csr_addr_MPORT_1_addr >= 3'h7 ? _RAND_69[11:0]
     : ram_fflags_bits_uop_csr_addr[ram_fflags_bits_uop_csr_addr_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_csr_addr_MPORT_data = io_enq_bits_fflags_bits_uop_csr_addr;
  assign ram_fflags_bits_uop_csr_addr_MPORT_addr = value;
  assign ram_fflags_bits_uop_csr_addr_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_csr_addr_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_rob_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rob_idx_MPORT_1_data =
    ram_fflags_bits_uop_rob_idx[ram_fflags_bits_uop_rob_idx_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_rob_idx_MPORT_1_data = ram_fflags_bits_uop_rob_idx_MPORT_1_addr >= 3'h7 ? _RAND_71[5:0] :
    ram_fflags_bits_uop_rob_idx[ram_fflags_bits_uop_rob_idx_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rob_idx_MPORT_data = io_enq_bits_fflags_bits_uop_rob_idx;
  assign ram_fflags_bits_uop_rob_idx_MPORT_addr = value;
  assign ram_fflags_bits_uop_rob_idx_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_rob_idx_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ldq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldq_idx_MPORT_1_data =
    ram_fflags_bits_uop_ldq_idx[ram_fflags_bits_uop_ldq_idx_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ldq_idx_MPORT_1_data = ram_fflags_bits_uop_ldq_idx_MPORT_1_addr >= 3'h7 ? _RAND_73[3:0] :
    ram_fflags_bits_uop_ldq_idx[ram_fflags_bits_uop_ldq_idx_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldq_idx_MPORT_data = io_enq_bits_fflags_bits_uop_ldq_idx;
  assign ram_fflags_bits_uop_ldq_idx_MPORT_addr = value;
  assign ram_fflags_bits_uop_ldq_idx_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ldq_idx_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_stq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_stq_idx_MPORT_1_data =
    ram_fflags_bits_uop_stq_idx[ram_fflags_bits_uop_stq_idx_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_stq_idx_MPORT_1_data = ram_fflags_bits_uop_stq_idx_MPORT_1_addr >= 3'h7 ? _RAND_75[3:0] :
    ram_fflags_bits_uop_stq_idx[ram_fflags_bits_uop_stq_idx_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_stq_idx_MPORT_data = io_enq_bits_fflags_bits_uop_stq_idx;
  assign ram_fflags_bits_uop_stq_idx_MPORT_addr = value;
  assign ram_fflags_bits_uop_stq_idx_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_stq_idx_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_rxq_idx_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rxq_idx_MPORT_1_data =
    ram_fflags_bits_uop_rxq_idx[ram_fflags_bits_uop_rxq_idx_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_rxq_idx_MPORT_1_data = ram_fflags_bits_uop_rxq_idx_MPORT_1_addr >= 3'h7 ? _RAND_77[1:0] :
    ram_fflags_bits_uop_rxq_idx[ram_fflags_bits_uop_rxq_idx_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_rxq_idx_MPORT_data = io_enq_bits_fflags_bits_uop_rxq_idx;
  assign ram_fflags_bits_uop_rxq_idx_MPORT_addr = value;
  assign ram_fflags_bits_uop_rxq_idx_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_rxq_idx_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_pdst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pdst_MPORT_1_data = ram_fflags_bits_uop_pdst[ram_fflags_bits_uop_pdst_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_pdst_MPORT_1_data = ram_fflags_bits_uop_pdst_MPORT_1_addr >= 3'h7 ? _RAND_79[5:0] :
    ram_fflags_bits_uop_pdst[ram_fflags_bits_uop_pdst_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_pdst_MPORT_data = io_enq_bits_fflags_bits_uop_pdst;
  assign ram_fflags_bits_uop_pdst_MPORT_addr = value;
  assign ram_fflags_bits_uop_pdst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_pdst_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_prs1_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs1_MPORT_1_data = ram_fflags_bits_uop_prs1[ram_fflags_bits_uop_prs1_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_prs1_MPORT_1_data = ram_fflags_bits_uop_prs1_MPORT_1_addr >= 3'h7 ? _RAND_81[5:0] :
    ram_fflags_bits_uop_prs1[ram_fflags_bits_uop_prs1_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs1_MPORT_data = io_enq_bits_fflags_bits_uop_prs1;
  assign ram_fflags_bits_uop_prs1_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs1_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs1_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_prs2_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs2_MPORT_1_data = ram_fflags_bits_uop_prs2[ram_fflags_bits_uop_prs2_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_prs2_MPORT_1_data = ram_fflags_bits_uop_prs2_MPORT_1_addr >= 3'h7 ? _RAND_83[5:0] :
    ram_fflags_bits_uop_prs2[ram_fflags_bits_uop_prs2_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs2_MPORT_data = io_enq_bits_fflags_bits_uop_prs2;
  assign ram_fflags_bits_uop_prs2_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs2_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs2_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_prs3_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs3_MPORT_1_data = ram_fflags_bits_uop_prs3[ram_fflags_bits_uop_prs3_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_prs3_MPORT_1_data = ram_fflags_bits_uop_prs3_MPORT_1_addr >= 3'h7 ? _RAND_85[5:0] :
    ram_fflags_bits_uop_prs3[ram_fflags_bits_uop_prs3_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs3_MPORT_data = io_enq_bits_fflags_bits_uop_prs3;
  assign ram_fflags_bits_uop_prs3_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs3_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs3_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ppred_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ppred_MPORT_1_data = ram_fflags_bits_uop_ppred[ram_fflags_bits_uop_ppred_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ppred_MPORT_1_data = ram_fflags_bits_uop_ppred_MPORT_1_addr >= 3'h7 ? _RAND_87[4:0] :
    ram_fflags_bits_uop_ppred[ram_fflags_bits_uop_ppred_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ppred_MPORT_data = io_enq_bits_fflags_bits_uop_ppred;
  assign ram_fflags_bits_uop_ppred_MPORT_addr = value;
  assign ram_fflags_bits_uop_ppred_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ppred_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_prs1_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs1_busy_MPORT_1_data =
    ram_fflags_bits_uop_prs1_busy[ram_fflags_bits_uop_prs1_busy_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_prs1_busy_MPORT_1_data = ram_fflags_bits_uop_prs1_busy_MPORT_1_addr >= 3'h7 ? _RAND_89[0:0]
     : ram_fflags_bits_uop_prs1_busy[ram_fflags_bits_uop_prs1_busy_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs1_busy_MPORT_data = io_enq_bits_fflags_bits_uop_prs1_busy;
  assign ram_fflags_bits_uop_prs1_busy_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs1_busy_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs1_busy_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_prs2_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs2_busy_MPORT_1_data =
    ram_fflags_bits_uop_prs2_busy[ram_fflags_bits_uop_prs2_busy_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_prs2_busy_MPORT_1_data = ram_fflags_bits_uop_prs2_busy_MPORT_1_addr >= 3'h7 ? _RAND_91[0:0]
     : ram_fflags_bits_uop_prs2_busy[ram_fflags_bits_uop_prs2_busy_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs2_busy_MPORT_data = io_enq_bits_fflags_bits_uop_prs2_busy;
  assign ram_fflags_bits_uop_prs2_busy_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs2_busy_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs2_busy_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_prs3_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs3_busy_MPORT_1_data =
    ram_fflags_bits_uop_prs3_busy[ram_fflags_bits_uop_prs3_busy_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_prs3_busy_MPORT_1_data = ram_fflags_bits_uop_prs3_busy_MPORT_1_addr >= 3'h7 ? _RAND_93[0:0]
     : ram_fflags_bits_uop_prs3_busy[ram_fflags_bits_uop_prs3_busy_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_prs3_busy_MPORT_data = io_enq_bits_fflags_bits_uop_prs3_busy;
  assign ram_fflags_bits_uop_prs3_busy_MPORT_addr = value;
  assign ram_fflags_bits_uop_prs3_busy_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_prs3_busy_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ppred_busy_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ppred_busy_MPORT_1_data =
    ram_fflags_bits_uop_ppred_busy[ram_fflags_bits_uop_ppred_busy_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ppred_busy_MPORT_1_data = ram_fflags_bits_uop_ppred_busy_MPORT_1_addr >= 3'h7 ? _RAND_95[0
    :0] : ram_fflags_bits_uop_ppred_busy[ram_fflags_bits_uop_ppred_busy_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ppred_busy_MPORT_data = io_enq_bits_fflags_bits_uop_ppred_busy;
  assign ram_fflags_bits_uop_ppred_busy_MPORT_addr = value;
  assign ram_fflags_bits_uop_ppred_busy_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ppred_busy_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_stale_pdst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_stale_pdst_MPORT_1_data =
    ram_fflags_bits_uop_stale_pdst[ram_fflags_bits_uop_stale_pdst_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_stale_pdst_MPORT_1_data = ram_fflags_bits_uop_stale_pdst_MPORT_1_addr >= 3'h7 ? _RAND_97[5
    :0] : ram_fflags_bits_uop_stale_pdst[ram_fflags_bits_uop_stale_pdst_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_stale_pdst_MPORT_data = io_enq_bits_fflags_bits_uop_stale_pdst;
  assign ram_fflags_bits_uop_stale_pdst_MPORT_addr = value;
  assign ram_fflags_bits_uop_stale_pdst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_stale_pdst_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_exception_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_exception_MPORT_1_data =
    ram_fflags_bits_uop_exception[ram_fflags_bits_uop_exception_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_exception_MPORT_1_data = ram_fflags_bits_uop_exception_MPORT_1_addr >= 3'h7 ? _RAND_99[0:0]
     : ram_fflags_bits_uop_exception[ram_fflags_bits_uop_exception_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_exception_MPORT_data = io_enq_bits_fflags_bits_uop_exception;
  assign ram_fflags_bits_uop_exception_MPORT_addr = value;
  assign ram_fflags_bits_uop_exception_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_exception_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_exc_cause_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_exc_cause_MPORT_1_data =
    ram_fflags_bits_uop_exc_cause[ram_fflags_bits_uop_exc_cause_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_exc_cause_MPORT_1_data = ram_fflags_bits_uop_exc_cause_MPORT_1_addr >= 3'h7 ? _RAND_101[63
    :0] : ram_fflags_bits_uop_exc_cause[ram_fflags_bits_uop_exc_cause_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_exc_cause_MPORT_data = io_enq_bits_fflags_bits_uop_exc_cause;
  assign ram_fflags_bits_uop_exc_cause_MPORT_addr = value;
  assign ram_fflags_bits_uop_exc_cause_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_exc_cause_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_bypassable_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bypassable_MPORT_1_data =
    ram_fflags_bits_uop_bypassable[ram_fflags_bits_uop_bypassable_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_bypassable_MPORT_1_data = ram_fflags_bits_uop_bypassable_MPORT_1_addr >= 3'h7 ? _RAND_103[0
    :0] : ram_fflags_bits_uop_bypassable[ram_fflags_bits_uop_bypassable_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bypassable_MPORT_data = io_enq_bits_fflags_bits_uop_bypassable;
  assign ram_fflags_bits_uop_bypassable_MPORT_addr = value;
  assign ram_fflags_bits_uop_bypassable_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_bypassable_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_mem_cmd_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_cmd_MPORT_1_data =
    ram_fflags_bits_uop_mem_cmd[ram_fflags_bits_uop_mem_cmd_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_mem_cmd_MPORT_1_data = ram_fflags_bits_uop_mem_cmd_MPORT_1_addr >= 3'h7 ? _RAND_105[4:0] :
    ram_fflags_bits_uop_mem_cmd[ram_fflags_bits_uop_mem_cmd_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_cmd_MPORT_data = io_enq_bits_fflags_bits_uop_mem_cmd;
  assign ram_fflags_bits_uop_mem_cmd_MPORT_addr = value;
  assign ram_fflags_bits_uop_mem_cmd_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_mem_cmd_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_mem_size_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_size_MPORT_1_data =
    ram_fflags_bits_uop_mem_size[ram_fflags_bits_uop_mem_size_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_mem_size_MPORT_1_data = ram_fflags_bits_uop_mem_size_MPORT_1_addr >= 3'h7 ? _RAND_107[1:0]
     : ram_fflags_bits_uop_mem_size[ram_fflags_bits_uop_mem_size_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_size_MPORT_data = io_enq_bits_fflags_bits_uop_mem_size;
  assign ram_fflags_bits_uop_mem_size_MPORT_addr = value;
  assign ram_fflags_bits_uop_mem_size_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_mem_size_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_mem_signed_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_signed_MPORT_1_data =
    ram_fflags_bits_uop_mem_signed[ram_fflags_bits_uop_mem_signed_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_mem_signed_MPORT_1_data = ram_fflags_bits_uop_mem_signed_MPORT_1_addr >= 3'h7 ? _RAND_109[0
    :0] : ram_fflags_bits_uop_mem_signed[ram_fflags_bits_uop_mem_signed_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_mem_signed_MPORT_data = io_enq_bits_fflags_bits_uop_mem_signed;
  assign ram_fflags_bits_uop_mem_signed_MPORT_addr = value;
  assign ram_fflags_bits_uop_mem_signed_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_mem_signed_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_is_fence_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_fence_MPORT_1_data =
    ram_fflags_bits_uop_is_fence[ram_fflags_bits_uop_is_fence_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_is_fence_MPORT_1_data = ram_fflags_bits_uop_is_fence_MPORT_1_addr >= 3'h7 ? _RAND_111[0:0]
     : ram_fflags_bits_uop_is_fence[ram_fflags_bits_uop_is_fence_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_fence_MPORT_data = io_enq_bits_fflags_bits_uop_is_fence;
  assign ram_fflags_bits_uop_is_fence_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_fence_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_fence_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_is_fencei_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_fencei_MPORT_1_data =
    ram_fflags_bits_uop_is_fencei[ram_fflags_bits_uop_is_fencei_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_is_fencei_MPORT_1_data = ram_fflags_bits_uop_is_fencei_MPORT_1_addr >= 3'h7 ? _RAND_113[0
    :0] : ram_fflags_bits_uop_is_fencei[ram_fflags_bits_uop_is_fencei_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_fencei_MPORT_data = io_enq_bits_fflags_bits_uop_is_fencei;
  assign ram_fflags_bits_uop_is_fencei_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_fencei_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_fencei_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_is_amo_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_amo_MPORT_1_data = ram_fflags_bits_uop_is_amo[ram_fflags_bits_uop_is_amo_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_is_amo_MPORT_1_data = ram_fflags_bits_uop_is_amo_MPORT_1_addr >= 3'h7 ? _RAND_115[0:0] :
    ram_fflags_bits_uop_is_amo[ram_fflags_bits_uop_is_amo_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_amo_MPORT_data = io_enq_bits_fflags_bits_uop_is_amo;
  assign ram_fflags_bits_uop_is_amo_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_amo_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_amo_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_uses_ldq_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uses_ldq_MPORT_1_data =
    ram_fflags_bits_uop_uses_ldq[ram_fflags_bits_uop_uses_ldq_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_uses_ldq_MPORT_1_data = ram_fflags_bits_uop_uses_ldq_MPORT_1_addr >= 3'h7 ? _RAND_117[0:0]
     : ram_fflags_bits_uop_uses_ldq[ram_fflags_bits_uop_uses_ldq_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uses_ldq_MPORT_data = io_enq_bits_fflags_bits_uop_uses_ldq;
  assign ram_fflags_bits_uop_uses_ldq_MPORT_addr = value;
  assign ram_fflags_bits_uop_uses_ldq_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_uses_ldq_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_uses_stq_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uses_stq_MPORT_1_data =
    ram_fflags_bits_uop_uses_stq[ram_fflags_bits_uop_uses_stq_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_uses_stq_MPORT_1_data = ram_fflags_bits_uop_uses_stq_MPORT_1_addr >= 3'h7 ? _RAND_119[0:0]
     : ram_fflags_bits_uop_uses_stq[ram_fflags_bits_uop_uses_stq_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_uses_stq_MPORT_data = io_enq_bits_fflags_bits_uop_uses_stq;
  assign ram_fflags_bits_uop_uses_stq_MPORT_addr = value;
  assign ram_fflags_bits_uop_uses_stq_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_uses_stq_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_data =
    ram_fflags_bits_uop_is_sys_pc2epc[ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_data = ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_addr >= 3'h7 ?
    _RAND_121[0:0] : ram_fflags_bits_uop_is_sys_pc2epc[ram_fflags_bits_uop_is_sys_pc2epc_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_data = io_enq_bits_fflags_bits_uop_is_sys_pc2epc;
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_sys_pc2epc_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_is_unique_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_unique_MPORT_1_data =
    ram_fflags_bits_uop_is_unique[ram_fflags_bits_uop_is_unique_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_is_unique_MPORT_1_data = ram_fflags_bits_uop_is_unique_MPORT_1_addr >= 3'h7 ? _RAND_123[0
    :0] : ram_fflags_bits_uop_is_unique[ram_fflags_bits_uop_is_unique_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_is_unique_MPORT_data = io_enq_bits_fflags_bits_uop_is_unique;
  assign ram_fflags_bits_uop_is_unique_MPORT_addr = value;
  assign ram_fflags_bits_uop_is_unique_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_is_unique_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_1_data =
    ram_fflags_bits_uop_flush_on_commit[ram_fflags_bits_uop_flush_on_commit_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_1_data = ram_fflags_bits_uop_flush_on_commit_MPORT_1_addr >= 3'h7 ?
    _RAND_125[0:0] : ram_fflags_bits_uop_flush_on_commit[ram_fflags_bits_uop_flush_on_commit_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_data = io_enq_bits_fflags_bits_uop_flush_on_commit;
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_addr = value;
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_flush_on_commit_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_data =
    ram_fflags_bits_uop_ldst_is_rs1[ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_data = ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_addr >= 3'h7 ? _RAND_127
    [0:0] : ram_fflags_bits_uop_ldst_is_rs1[ram_fflags_bits_uop_ldst_is_rs1_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_data = io_enq_bits_fflags_bits_uop_ldst_is_rs1;
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_addr = value;
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ldst_is_rs1_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ldst_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_MPORT_1_data = ram_fflags_bits_uop_ldst[ram_fflags_bits_uop_ldst_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ldst_MPORT_1_data = ram_fflags_bits_uop_ldst_MPORT_1_addr >= 3'h7 ? _RAND_129[5:0] :
    ram_fflags_bits_uop_ldst[ram_fflags_bits_uop_ldst_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_MPORT_data = io_enq_bits_fflags_bits_uop_ldst;
  assign ram_fflags_bits_uop_ldst_MPORT_addr = value;
  assign ram_fflags_bits_uop_ldst_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ldst_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_lrs1_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs1_MPORT_1_data = ram_fflags_bits_uop_lrs1[ram_fflags_bits_uop_lrs1_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_lrs1_MPORT_1_data = ram_fflags_bits_uop_lrs1_MPORT_1_addr >= 3'h7 ? _RAND_131[5:0] :
    ram_fflags_bits_uop_lrs1[ram_fflags_bits_uop_lrs1_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs1_MPORT_data = io_enq_bits_fflags_bits_uop_lrs1;
  assign ram_fflags_bits_uop_lrs1_MPORT_addr = value;
  assign ram_fflags_bits_uop_lrs1_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_lrs1_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_lrs2_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs2_MPORT_1_data = ram_fflags_bits_uop_lrs2[ram_fflags_bits_uop_lrs2_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_lrs2_MPORT_1_data = ram_fflags_bits_uop_lrs2_MPORT_1_addr >= 3'h7 ? _RAND_133[5:0] :
    ram_fflags_bits_uop_lrs2[ram_fflags_bits_uop_lrs2_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs2_MPORT_data = io_enq_bits_fflags_bits_uop_lrs2;
  assign ram_fflags_bits_uop_lrs2_MPORT_addr = value;
  assign ram_fflags_bits_uop_lrs2_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_lrs2_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_lrs3_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs3_MPORT_1_data = ram_fflags_bits_uop_lrs3[ram_fflags_bits_uop_lrs3_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_lrs3_MPORT_1_data = ram_fflags_bits_uop_lrs3_MPORT_1_addr >= 3'h7 ? _RAND_135[5:0] :
    ram_fflags_bits_uop_lrs3[ram_fflags_bits_uop_lrs3_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs3_MPORT_data = io_enq_bits_fflags_bits_uop_lrs3;
  assign ram_fflags_bits_uop_lrs3_MPORT_addr = value;
  assign ram_fflags_bits_uop_lrs3_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_lrs3_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_ldst_val_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_val_MPORT_1_data =
    ram_fflags_bits_uop_ldst_val[ram_fflags_bits_uop_ldst_val_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_ldst_val_MPORT_1_data = ram_fflags_bits_uop_ldst_val_MPORT_1_addr >= 3'h7 ? _RAND_137[0:0]
     : ram_fflags_bits_uop_ldst_val[ram_fflags_bits_uop_ldst_val_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_ldst_val_MPORT_data = io_enq_bits_fflags_bits_uop_ldst_val;
  assign ram_fflags_bits_uop_ldst_val_MPORT_addr = value;
  assign ram_fflags_bits_uop_ldst_val_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_ldst_val_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_dst_rtype_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_dst_rtype_MPORT_1_data =
    ram_fflags_bits_uop_dst_rtype[ram_fflags_bits_uop_dst_rtype_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_dst_rtype_MPORT_1_data = ram_fflags_bits_uop_dst_rtype_MPORT_1_addr >= 3'h7 ? _RAND_139[1
    :0] : ram_fflags_bits_uop_dst_rtype[ram_fflags_bits_uop_dst_rtype_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_dst_rtype_MPORT_data = io_enq_bits_fflags_bits_uop_dst_rtype;
  assign ram_fflags_bits_uop_dst_rtype_MPORT_addr = value;
  assign ram_fflags_bits_uop_dst_rtype_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_dst_rtype_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_1_data =
    ram_fflags_bits_uop_lrs1_rtype[ram_fflags_bits_uop_lrs1_rtype_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_1_data = ram_fflags_bits_uop_lrs1_rtype_MPORT_1_addr >= 3'h7 ? _RAND_141[1
    :0] : ram_fflags_bits_uop_lrs1_rtype[ram_fflags_bits_uop_lrs1_rtype_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_data = io_enq_bits_fflags_bits_uop_lrs1_rtype;
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_addr = value;
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_lrs1_rtype_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_1_data =
    ram_fflags_bits_uop_lrs2_rtype[ram_fflags_bits_uop_lrs2_rtype_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_1_data = ram_fflags_bits_uop_lrs2_rtype_MPORT_1_addr >= 3'h7 ? _RAND_143[1
    :0] : ram_fflags_bits_uop_lrs2_rtype[ram_fflags_bits_uop_lrs2_rtype_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_data = io_enq_bits_fflags_bits_uop_lrs2_rtype;
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_addr = value;
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_lrs2_rtype_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_frs3_en_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_frs3_en_MPORT_1_data =
    ram_fflags_bits_uop_frs3_en[ram_fflags_bits_uop_frs3_en_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_frs3_en_MPORT_1_data = ram_fflags_bits_uop_frs3_en_MPORT_1_addr >= 3'h7 ? _RAND_145[0:0] :
    ram_fflags_bits_uop_frs3_en[ram_fflags_bits_uop_frs3_en_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_frs3_en_MPORT_data = io_enq_bits_fflags_bits_uop_frs3_en;
  assign ram_fflags_bits_uop_frs3_en_MPORT_addr = value;
  assign ram_fflags_bits_uop_frs3_en_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_frs3_en_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_fp_val_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fp_val_MPORT_1_data = ram_fflags_bits_uop_fp_val[ram_fflags_bits_uop_fp_val_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_fp_val_MPORT_1_data = ram_fflags_bits_uop_fp_val_MPORT_1_addr >= 3'h7 ? _RAND_147[0:0] :
    ram_fflags_bits_uop_fp_val[ram_fflags_bits_uop_fp_val_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fp_val_MPORT_data = io_enq_bits_fflags_bits_uop_fp_val;
  assign ram_fflags_bits_uop_fp_val_MPORT_addr = value;
  assign ram_fflags_bits_uop_fp_val_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_fp_val_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_fp_single_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fp_single_MPORT_1_data =
    ram_fflags_bits_uop_fp_single[ram_fflags_bits_uop_fp_single_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_fp_single_MPORT_1_data = ram_fflags_bits_uop_fp_single_MPORT_1_addr >= 3'h7 ? _RAND_149[0
    :0] : ram_fflags_bits_uop_fp_single[ram_fflags_bits_uop_fp_single_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_fp_single_MPORT_data = io_enq_bits_fflags_bits_uop_fp_single;
  assign ram_fflags_bits_uop_fp_single_MPORT_addr = value;
  assign ram_fflags_bits_uop_fp_single_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_fp_single_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_data =
    ram_fflags_bits_uop_xcpt_pf_if[ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_data = ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_addr >= 3'h7 ? _RAND_151[0
    :0] : ram_fflags_bits_uop_xcpt_pf_if[ram_fflags_bits_uop_xcpt_pf_if_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_data = io_enq_bits_fflags_bits_uop_xcpt_pf_if;
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_addr = value;
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_xcpt_pf_if_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_data =
    ram_fflags_bits_uop_xcpt_ae_if[ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_data = ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_addr >= 3'h7 ? _RAND_153[0
    :0] : ram_fflags_bits_uop_xcpt_ae_if[ram_fflags_bits_uop_xcpt_ae_if_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_data = io_enq_bits_fflags_bits_uop_xcpt_ae_if;
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_addr = value;
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_xcpt_ae_if_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_data =
    ram_fflags_bits_uop_xcpt_ma_if[ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_data = ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_addr >= 3'h7 ? _RAND_155[0
    :0] : ram_fflags_bits_uop_xcpt_ma_if[ram_fflags_bits_uop_xcpt_ma_if_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_data = io_enq_bits_fflags_bits_uop_xcpt_ma_if;
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_addr = value;
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_xcpt_ma_if_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_1_data =
    ram_fflags_bits_uop_bp_debug_if[ram_fflags_bits_uop_bp_debug_if_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_1_data = ram_fflags_bits_uop_bp_debug_if_MPORT_1_addr >= 3'h7 ? _RAND_157
    [0:0] : ram_fflags_bits_uop_bp_debug_if[ram_fflags_bits_uop_bp_debug_if_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_data = io_enq_bits_fflags_bits_uop_bp_debug_if;
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_addr = value;
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_bp_debug_if_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_data =
    ram_fflags_bits_uop_bp_xcpt_if[ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_data = ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_addr >= 3'h7 ? _RAND_159[0
    :0] : ram_fflags_bits_uop_bp_xcpt_if[ram_fflags_bits_uop_bp_xcpt_if_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_data = io_enq_bits_fflags_bits_uop_bp_xcpt_if;
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_addr = value;
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_bp_xcpt_if_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_1_data =
    ram_fflags_bits_uop_debug_fsrc[ram_fflags_bits_uop_debug_fsrc_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_1_data = ram_fflags_bits_uop_debug_fsrc_MPORT_1_addr >= 3'h7 ? _RAND_161[1
    :0] : ram_fflags_bits_uop_debug_fsrc[ram_fflags_bits_uop_debug_fsrc_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_data = io_enq_bits_fflags_bits_uop_debug_fsrc;
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_addr = value;
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_debug_fsrc_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_1_data =
    ram_fflags_bits_uop_debug_tsrc[ram_fflags_bits_uop_debug_tsrc_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_1_data = ram_fflags_bits_uop_debug_tsrc_MPORT_1_addr >= 3'h7 ? _RAND_163[1
    :0] : ram_fflags_bits_uop_debug_tsrc[ram_fflags_bits_uop_debug_tsrc_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_data = io_enq_bits_fflags_bits_uop_debug_tsrc;
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_addr = value;
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_mask = 1'h1;
  assign ram_fflags_bits_uop_debug_tsrc_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign ram_fflags_bits_flags_MPORT_1_addr = value_1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_flags_MPORT_1_data = ram_fflags_bits_flags[ram_fflags_bits_flags_MPORT_1_addr]; // @[util.scala 464:20]
  `else
  assign ram_fflags_bits_flags_MPORT_1_data = ram_fflags_bits_flags_MPORT_1_addr >= 3'h7 ? _RAND_165[4:0] :
    ram_fflags_bits_flags[ram_fflags_bits_flags_MPORT_1_addr]; // @[util.scala 464:20]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_fflags_bits_flags_MPORT_data = io_enq_bits_fflags_bits_flags;
  assign ram_fflags_bits_flags_MPORT_addr = value;
  assign ram_fflags_bits_flags_MPORT_mask = 1'h1;
  assign ram_fflags_bits_flags_MPORT_en = io_empty ? _GEN_1879 : _T_2;
  assign io_enq_ready = ~full; // @[util.scala 504:19]
  assign io_deq_valid = io_empty ? io_enq_valid : _T_5 & _GEN_6 & ~_T_77 & _T_12; // @[util.scala 515:21 util.scala 516:20 util.scala 509:27]
  assign io_deq_bits_uop_uopc = io_empty ? io_enq_bits_uop_uopc : out_uop_uopc; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_inst = io_empty ? io_enq_bits_uop_inst : out_uop_inst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_debug_inst = io_empty ? io_enq_bits_uop_debug_inst : out_uop_debug_inst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_is_rvc = io_empty ? io_enq_bits_uop_is_rvc : out_uop_is_rvc; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_debug_pc = io_empty ? io_enq_bits_uop_debug_pc : out_uop_debug_pc; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_iq_type = io_empty ? io_enq_bits_uop_iq_type : out_uop_iq_type; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_fu_code = io_empty ? io_enq_bits_uop_fu_code : out_uop_fu_code; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ctrl_br_type = io_empty ? io_enq_bits_uop_ctrl_br_type : out_uop_ctrl_br_type; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ctrl_op1_sel = io_empty ? io_enq_bits_uop_ctrl_op1_sel : out_uop_ctrl_op1_sel; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ctrl_op2_sel = io_empty ? io_enq_bits_uop_ctrl_op2_sel : out_uop_ctrl_op2_sel; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ctrl_imm_sel = io_empty ? io_enq_bits_uop_ctrl_imm_sel : out_uop_ctrl_imm_sel; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ctrl_op_fcn = io_empty ? io_enq_bits_uop_ctrl_op_fcn : out_uop_ctrl_op_fcn; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ctrl_fcn_dw = io_empty ? io_enq_bits_uop_ctrl_fcn_dw : out_uop_ctrl_fcn_dw; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ctrl_csr_cmd = io_empty ? io_enq_bits_uop_ctrl_csr_cmd : out_uop_ctrl_csr_cmd; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ctrl_is_load = io_empty ? io_enq_bits_uop_ctrl_is_load : out_uop_ctrl_is_load; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ctrl_is_sta = io_empty ? io_enq_bits_uop_ctrl_is_sta : out_uop_ctrl_is_sta; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ctrl_is_std = io_empty ? io_enq_bits_uop_ctrl_is_std : out_uop_ctrl_is_std; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_iw_state = io_empty ? io_enq_bits_uop_iw_state : out_uop_iw_state; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_iw_p1_poisoned = io_empty ? io_enq_bits_uop_iw_p1_poisoned : out_uop_iw_p1_poisoned; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_iw_p2_poisoned = io_empty ? io_enq_bits_uop_iw_p2_poisoned : out_uop_iw_p2_poisoned; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_is_br = io_empty ? io_enq_bits_uop_is_br : out_uop_is_br; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_is_jalr = io_empty ? io_enq_bits_uop_is_jalr : out_uop_is_jalr; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_is_jal = io_empty ? io_enq_bits_uop_is_jal : out_uop_is_jal; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_is_sfb = io_empty ? io_enq_bits_uop_is_sfb : out_uop_is_sfb; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_br_mask = io_empty ? _T_71 : _T_84; // @[util.scala 515:21 util.scala 518:31 util.scala 511:27]
  assign io_deq_bits_uop_br_tag = io_empty ? io_enq_bits_uop_br_tag : out_uop_br_tag; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ftq_idx = io_empty ? io_enq_bits_uop_ftq_idx : out_uop_ftq_idx; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_edge_inst = io_empty ? io_enq_bits_uop_edge_inst : out_uop_edge_inst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_pc_lob = io_empty ? io_enq_bits_uop_pc_lob : out_uop_pc_lob; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_taken = io_empty ? io_enq_bits_uop_taken : out_uop_taken; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_imm_packed = io_empty ? io_enq_bits_uop_imm_packed : out_uop_imm_packed; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_csr_addr = io_empty ? io_enq_bits_uop_csr_addr : out_uop_csr_addr; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_rob_idx = io_empty ? io_enq_bits_uop_rob_idx : out_uop_rob_idx; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ldq_idx = io_empty ? io_enq_bits_uop_ldq_idx : out_uop_ldq_idx; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_stq_idx = io_empty ? io_enq_bits_uop_stq_idx : out_uop_stq_idx; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_rxq_idx = io_empty ? io_enq_bits_uop_rxq_idx : out_uop_rxq_idx; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_pdst = io_empty ? io_enq_bits_uop_pdst : out_uop_pdst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_prs1 = io_empty ? io_enq_bits_uop_prs1 : out_uop_prs1; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_prs2 = io_empty ? io_enq_bits_uop_prs2 : out_uop_prs2; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_prs3 = io_empty ? io_enq_bits_uop_prs3 : out_uop_prs3; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ppred = io_empty ? io_enq_bits_uop_ppred : out_uop_ppred; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_prs1_busy = io_empty ? io_enq_bits_uop_prs1_busy : out_uop_prs1_busy; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_prs2_busy = io_empty ? io_enq_bits_uop_prs2_busy : out_uop_prs2_busy; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_prs3_busy = io_empty ? io_enq_bits_uop_prs3_busy : out_uop_prs3_busy; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ppred_busy = io_empty ? io_enq_bits_uop_ppred_busy : out_uop_ppred_busy; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_stale_pdst = io_empty ? io_enq_bits_uop_stale_pdst : out_uop_stale_pdst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_exception = io_empty ? io_enq_bits_uop_exception : out_uop_exception; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_exc_cause = io_empty ? io_enq_bits_uop_exc_cause : out_uop_exc_cause; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_bypassable = io_empty ? io_enq_bits_uop_bypassable : out_uop_bypassable; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_mem_cmd = io_empty ? io_enq_bits_uop_mem_cmd : out_uop_mem_cmd; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_mem_size = io_empty ? io_enq_bits_uop_mem_size : out_uop_mem_size; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_mem_signed = io_empty ? io_enq_bits_uop_mem_signed : out_uop_mem_signed; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_is_fence = io_empty ? io_enq_bits_uop_is_fence : out_uop_is_fence; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_is_fencei = io_empty ? io_enq_bits_uop_is_fencei : out_uop_is_fencei; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_is_amo = io_empty ? io_enq_bits_uop_is_amo : out_uop_is_amo; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_uses_ldq = io_empty ? io_enq_bits_uop_uses_ldq : out_uop_uses_ldq; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_uses_stq = io_empty ? io_enq_bits_uop_uses_stq : out_uop_uses_stq; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_is_sys_pc2epc = io_empty ? io_enq_bits_uop_is_sys_pc2epc : out_uop_is_sys_pc2epc; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_is_unique = io_empty ? io_enq_bits_uop_is_unique : out_uop_is_unique; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_flush_on_commit = io_empty ? io_enq_bits_uop_flush_on_commit : out_uop_flush_on_commit; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ldst_is_rs1 = io_empty ? io_enq_bits_uop_ldst_is_rs1 : out_uop_ldst_is_rs1; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ldst = io_empty ? io_enq_bits_uop_ldst : out_uop_ldst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_lrs1 = io_empty ? io_enq_bits_uop_lrs1 : out_uop_lrs1; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_lrs2 = io_empty ? io_enq_bits_uop_lrs2 : out_uop_lrs2; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_lrs3 = io_empty ? io_enq_bits_uop_lrs3 : out_uop_lrs3; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_ldst_val = io_empty ? io_enq_bits_uop_ldst_val : out_uop_ldst_val; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_dst_rtype = io_empty ? io_enq_bits_uop_dst_rtype : out_uop_dst_rtype; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_lrs1_rtype = io_empty ? io_enq_bits_uop_lrs1_rtype : out_uop_lrs1_rtype; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_lrs2_rtype = io_empty ? io_enq_bits_uop_lrs2_rtype : out_uop_lrs2_rtype; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_frs3_en = io_empty ? io_enq_bits_uop_frs3_en : out_uop_frs3_en; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_fp_val = io_empty ? io_enq_bits_uop_fp_val : out_uop_fp_val; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_fp_single = io_empty ? io_enq_bits_uop_fp_single : out_uop_fp_single; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_xcpt_pf_if = io_empty ? io_enq_bits_uop_xcpt_pf_if : out_uop_xcpt_pf_if; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_xcpt_ae_if = io_empty ? io_enq_bits_uop_xcpt_ae_if : out_uop_xcpt_ae_if; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_xcpt_ma_if = io_empty ? io_enq_bits_uop_xcpt_ma_if : out_uop_xcpt_ma_if; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_bp_debug_if = io_empty ? io_enq_bits_uop_bp_debug_if : out_uop_bp_debug_if; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_bp_xcpt_if = io_empty ? io_enq_bits_uop_bp_xcpt_if : out_uop_bp_xcpt_if; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_debug_fsrc = io_empty ? io_enq_bits_uop_debug_fsrc : out_uop_debug_fsrc; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_uop_debug_tsrc = io_empty ? io_enq_bits_uop_debug_tsrc : out_uop_debug_tsrc; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_data = io_empty ? io_enq_bits_data : out_data; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_predicated = io_empty ? io_enq_bits_predicated : out_predicated; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_valid = io_empty ? io_enq_bits_fflags_valid : out_fflags_valid; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_uopc = io_empty ? io_enq_bits_fflags_bits_uop_uopc : out_fflags_bits_uop_uopc; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_inst = io_empty ? io_enq_bits_fflags_bits_uop_inst : out_fflags_bits_uop_inst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_debug_inst = io_empty ? io_enq_bits_fflags_bits_uop_debug_inst :
    out_fflags_bits_uop_debug_inst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_is_rvc = io_empty ? io_enq_bits_fflags_bits_uop_is_rvc : out_fflags_bits_uop_is_rvc
    ; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_debug_pc = io_empty ? io_enq_bits_fflags_bits_uop_debug_pc :
    out_fflags_bits_uop_debug_pc; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_iq_type = io_empty ? io_enq_bits_fflags_bits_uop_iq_type :
    out_fflags_bits_uop_iq_type; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_fu_code = io_empty ? io_enq_bits_fflags_bits_uop_fu_code :
    out_fflags_bits_uop_fu_code; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_br_type = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_br_type :
    out_fflags_bits_uop_ctrl_br_type; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_op1_sel = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_op1_sel :
    out_fflags_bits_uop_ctrl_op1_sel; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_op2_sel = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_op2_sel :
    out_fflags_bits_uop_ctrl_op2_sel; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_imm_sel = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_imm_sel :
    out_fflags_bits_uop_ctrl_imm_sel; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_op_fcn = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_op_fcn :
    out_fflags_bits_uop_ctrl_op_fcn; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_fcn_dw = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_fcn_dw :
    out_fflags_bits_uop_ctrl_fcn_dw; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_csr_cmd = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_csr_cmd :
    out_fflags_bits_uop_ctrl_csr_cmd; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_is_load = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_is_load :
    out_fflags_bits_uop_ctrl_is_load; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_is_sta = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_is_sta :
    out_fflags_bits_uop_ctrl_is_sta; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ctrl_is_std = io_empty ? io_enq_bits_fflags_bits_uop_ctrl_is_std :
    out_fflags_bits_uop_ctrl_is_std; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_iw_state = io_empty ? io_enq_bits_fflags_bits_uop_iw_state :
    out_fflags_bits_uop_iw_state; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_iw_p1_poisoned = io_empty ? io_enq_bits_fflags_bits_uop_iw_p1_poisoned :
    out_fflags_bits_uop_iw_p1_poisoned; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_iw_p2_poisoned = io_empty ? io_enq_bits_fflags_bits_uop_iw_p2_poisoned :
    out_fflags_bits_uop_iw_p2_poisoned; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_is_br = io_empty ? io_enq_bits_fflags_bits_uop_is_br : out_fflags_bits_uop_is_br; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_is_jalr = io_empty ? io_enq_bits_fflags_bits_uop_is_jalr :
    out_fflags_bits_uop_is_jalr; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_is_jal = io_empty ? io_enq_bits_fflags_bits_uop_is_jal : out_fflags_bits_uop_is_jal
    ; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_is_sfb = io_empty ? io_enq_bits_fflags_bits_uop_is_sfb : out_fflags_bits_uop_is_sfb
    ; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_br_mask = io_empty ? io_enq_bits_fflags_bits_uop_br_mask :
    out_fflags_bits_uop_br_mask; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_br_tag = io_empty ? io_enq_bits_fflags_bits_uop_br_tag : out_fflags_bits_uop_br_tag
    ; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ftq_idx = io_empty ? io_enq_bits_fflags_bits_uop_ftq_idx :
    out_fflags_bits_uop_ftq_idx; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_edge_inst = io_empty ? io_enq_bits_fflags_bits_uop_edge_inst :
    out_fflags_bits_uop_edge_inst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_pc_lob = io_empty ? io_enq_bits_fflags_bits_uop_pc_lob : out_fflags_bits_uop_pc_lob
    ; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_taken = io_empty ? io_enq_bits_fflags_bits_uop_taken : out_fflags_bits_uop_taken; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_imm_packed = io_empty ? io_enq_bits_fflags_bits_uop_imm_packed :
    out_fflags_bits_uop_imm_packed; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_csr_addr = io_empty ? io_enq_bits_fflags_bits_uop_csr_addr :
    out_fflags_bits_uop_csr_addr; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_rob_idx = io_empty ? io_enq_bits_fflags_bits_uop_rob_idx :
    out_fflags_bits_uop_rob_idx; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ldq_idx = io_empty ? io_enq_bits_fflags_bits_uop_ldq_idx :
    out_fflags_bits_uop_ldq_idx; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_stq_idx = io_empty ? io_enq_bits_fflags_bits_uop_stq_idx :
    out_fflags_bits_uop_stq_idx; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_rxq_idx = io_empty ? io_enq_bits_fflags_bits_uop_rxq_idx :
    out_fflags_bits_uop_rxq_idx; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_pdst = io_empty ? io_enq_bits_fflags_bits_uop_pdst : out_fflags_bits_uop_pdst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_prs1 = io_empty ? io_enq_bits_fflags_bits_uop_prs1 : out_fflags_bits_uop_prs1; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_prs2 = io_empty ? io_enq_bits_fflags_bits_uop_prs2 : out_fflags_bits_uop_prs2; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_prs3 = io_empty ? io_enq_bits_fflags_bits_uop_prs3 : out_fflags_bits_uop_prs3; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ppred = io_empty ? io_enq_bits_fflags_bits_uop_ppred : out_fflags_bits_uop_ppred; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_prs1_busy = io_empty ? io_enq_bits_fflags_bits_uop_prs1_busy :
    out_fflags_bits_uop_prs1_busy; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_prs2_busy = io_empty ? io_enq_bits_fflags_bits_uop_prs2_busy :
    out_fflags_bits_uop_prs2_busy; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_prs3_busy = io_empty ? io_enq_bits_fflags_bits_uop_prs3_busy :
    out_fflags_bits_uop_prs3_busy; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ppred_busy = io_empty ? io_enq_bits_fflags_bits_uop_ppred_busy :
    out_fflags_bits_uop_ppred_busy; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_stale_pdst = io_empty ? io_enq_bits_fflags_bits_uop_stale_pdst :
    out_fflags_bits_uop_stale_pdst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_exception = io_empty ? io_enq_bits_fflags_bits_uop_exception :
    out_fflags_bits_uop_exception; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_exc_cause = io_empty ? io_enq_bits_fflags_bits_uop_exc_cause :
    out_fflags_bits_uop_exc_cause; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_bypassable = io_empty ? io_enq_bits_fflags_bits_uop_bypassable :
    out_fflags_bits_uop_bypassable; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_mem_cmd = io_empty ? io_enq_bits_fflags_bits_uop_mem_cmd :
    out_fflags_bits_uop_mem_cmd; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_mem_size = io_empty ? io_enq_bits_fflags_bits_uop_mem_size :
    out_fflags_bits_uop_mem_size; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_mem_signed = io_empty ? io_enq_bits_fflags_bits_uop_mem_signed :
    out_fflags_bits_uop_mem_signed; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_is_fence = io_empty ? io_enq_bits_fflags_bits_uop_is_fence :
    out_fflags_bits_uop_is_fence; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_is_fencei = io_empty ? io_enq_bits_fflags_bits_uop_is_fencei :
    out_fflags_bits_uop_is_fencei; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_is_amo = io_empty ? io_enq_bits_fflags_bits_uop_is_amo : out_fflags_bits_uop_is_amo
    ; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_uses_ldq = io_empty ? io_enq_bits_fflags_bits_uop_uses_ldq :
    out_fflags_bits_uop_uses_ldq; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_uses_stq = io_empty ? io_enq_bits_fflags_bits_uop_uses_stq :
    out_fflags_bits_uop_uses_stq; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_is_sys_pc2epc = io_empty ? io_enq_bits_fflags_bits_uop_is_sys_pc2epc :
    out_fflags_bits_uop_is_sys_pc2epc; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_is_unique = io_empty ? io_enq_bits_fflags_bits_uop_is_unique :
    out_fflags_bits_uop_is_unique; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_flush_on_commit = io_empty ? io_enq_bits_fflags_bits_uop_flush_on_commit :
    out_fflags_bits_uop_flush_on_commit; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ldst_is_rs1 = io_empty ? io_enq_bits_fflags_bits_uop_ldst_is_rs1 :
    out_fflags_bits_uop_ldst_is_rs1; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ldst = io_empty ? io_enq_bits_fflags_bits_uop_ldst : out_fflags_bits_uop_ldst; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_lrs1 = io_empty ? io_enq_bits_fflags_bits_uop_lrs1 : out_fflags_bits_uop_lrs1; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_lrs2 = io_empty ? io_enq_bits_fflags_bits_uop_lrs2 : out_fflags_bits_uop_lrs2; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_lrs3 = io_empty ? io_enq_bits_fflags_bits_uop_lrs3 : out_fflags_bits_uop_lrs3; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_ldst_val = io_empty ? io_enq_bits_fflags_bits_uop_ldst_val :
    out_fflags_bits_uop_ldst_val; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_dst_rtype = io_empty ? io_enq_bits_fflags_bits_uop_dst_rtype :
    out_fflags_bits_uop_dst_rtype; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_lrs1_rtype = io_empty ? io_enq_bits_fflags_bits_uop_lrs1_rtype :
    out_fflags_bits_uop_lrs1_rtype; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_lrs2_rtype = io_empty ? io_enq_bits_fflags_bits_uop_lrs2_rtype :
    out_fflags_bits_uop_lrs2_rtype; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_frs3_en = io_empty ? io_enq_bits_fflags_bits_uop_frs3_en :
    out_fflags_bits_uop_frs3_en; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_fp_val = io_empty ? io_enq_bits_fflags_bits_uop_fp_val : out_fflags_bits_uop_fp_val
    ; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_fp_single = io_empty ? io_enq_bits_fflags_bits_uop_fp_single :
    out_fflags_bits_uop_fp_single; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_xcpt_pf_if = io_empty ? io_enq_bits_fflags_bits_uop_xcpt_pf_if :
    out_fflags_bits_uop_xcpt_pf_if; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_xcpt_ae_if = io_empty ? io_enq_bits_fflags_bits_uop_xcpt_ae_if :
    out_fflags_bits_uop_xcpt_ae_if; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_xcpt_ma_if = io_empty ? io_enq_bits_fflags_bits_uop_xcpt_ma_if :
    out_fflags_bits_uop_xcpt_ma_if; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_bp_debug_if = io_empty ? io_enq_bits_fflags_bits_uop_bp_debug_if :
    out_fflags_bits_uop_bp_debug_if; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_bp_xcpt_if = io_empty ? io_enq_bits_fflags_bits_uop_bp_xcpt_if :
    out_fflags_bits_uop_bp_xcpt_if; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_debug_fsrc = io_empty ? io_enq_bits_fflags_bits_uop_debug_fsrc :
    out_fflags_bits_uop_debug_fsrc; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_uop_debug_tsrc = io_empty ? io_enq_bits_fflags_bits_uop_debug_tsrc :
    out_fflags_bits_uop_debug_tsrc; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_deq_bits_fflags_bits_flags = io_empty ? io_enq_bits_fflags_bits_flags : out_fflags_bits_flags; // @[util.scala 515:21 util.scala 517:19 util.scala 510:27]
  assign io_empty = ptr_match & ~maybe_full; // @[util.scala 473:25]
  assign io_count = ptr_match ? _T_89 : _T_93; // @[util.scala 529:20]
  always @(posedge clock) begin
    if(ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_predicated_MPORT_en & ram_predicated_MPORT_mask) begin
      ram_predicated[ram_predicated_MPORT_addr] <= ram_predicated_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_valid_MPORT_en & ram_fflags_valid_MPORT_mask) begin
      ram_fflags_valid[ram_fflags_valid_MPORT_addr] <= ram_fflags_valid_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_uopc_MPORT_en & ram_fflags_bits_uop_uopc_MPORT_mask) begin
      ram_fflags_bits_uop_uopc[ram_fflags_bits_uop_uopc_MPORT_addr] <= ram_fflags_bits_uop_uopc_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_inst_MPORT_en & ram_fflags_bits_uop_inst_MPORT_mask) begin
      ram_fflags_bits_uop_inst[ram_fflags_bits_uop_inst_MPORT_addr] <= ram_fflags_bits_uop_inst_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_debug_inst_MPORT_en & ram_fflags_bits_uop_debug_inst_MPORT_mask) begin
      ram_fflags_bits_uop_debug_inst[ram_fflags_bits_uop_debug_inst_MPORT_addr] <=
        ram_fflags_bits_uop_debug_inst_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_is_rvc_MPORT_en & ram_fflags_bits_uop_is_rvc_MPORT_mask) begin
      ram_fflags_bits_uop_is_rvc[ram_fflags_bits_uop_is_rvc_MPORT_addr] <= ram_fflags_bits_uop_is_rvc_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_debug_pc_MPORT_en & ram_fflags_bits_uop_debug_pc_MPORT_mask) begin
      ram_fflags_bits_uop_debug_pc[ram_fflags_bits_uop_debug_pc_MPORT_addr] <= ram_fflags_bits_uop_debug_pc_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_iq_type_MPORT_en & ram_fflags_bits_uop_iq_type_MPORT_mask) begin
      ram_fflags_bits_uop_iq_type[ram_fflags_bits_uop_iq_type_MPORT_addr] <= ram_fflags_bits_uop_iq_type_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_fu_code_MPORT_en & ram_fflags_bits_uop_fu_code_MPORT_mask) begin
      ram_fflags_bits_uop_fu_code[ram_fflags_bits_uop_fu_code_MPORT_addr] <= ram_fflags_bits_uop_fu_code_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ctrl_br_type_MPORT_en & ram_fflags_bits_uop_ctrl_br_type_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_br_type[ram_fflags_bits_uop_ctrl_br_type_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_br_type_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ctrl_op1_sel_MPORT_en & ram_fflags_bits_uop_ctrl_op1_sel_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_op1_sel[ram_fflags_bits_uop_ctrl_op1_sel_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_op1_sel_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ctrl_op2_sel_MPORT_en & ram_fflags_bits_uop_ctrl_op2_sel_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_op2_sel[ram_fflags_bits_uop_ctrl_op2_sel_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_op2_sel_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ctrl_imm_sel_MPORT_en & ram_fflags_bits_uop_ctrl_imm_sel_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_imm_sel[ram_fflags_bits_uop_ctrl_imm_sel_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_imm_sel_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ctrl_op_fcn_MPORT_en & ram_fflags_bits_uop_ctrl_op_fcn_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_op_fcn[ram_fflags_bits_uop_ctrl_op_fcn_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_op_fcn_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_en & ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_fcn_dw[ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_fcn_dw_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_en & ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_csr_cmd[ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_csr_cmd_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ctrl_is_load_MPORT_en & ram_fflags_bits_uop_ctrl_is_load_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_is_load[ram_fflags_bits_uop_ctrl_is_load_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_is_load_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ctrl_is_sta_MPORT_en & ram_fflags_bits_uop_ctrl_is_sta_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_is_sta[ram_fflags_bits_uop_ctrl_is_sta_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_is_sta_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ctrl_is_std_MPORT_en & ram_fflags_bits_uop_ctrl_is_std_MPORT_mask) begin
      ram_fflags_bits_uop_ctrl_is_std[ram_fflags_bits_uop_ctrl_is_std_MPORT_addr] <=
        ram_fflags_bits_uop_ctrl_is_std_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_iw_state_MPORT_en & ram_fflags_bits_uop_iw_state_MPORT_mask) begin
      ram_fflags_bits_uop_iw_state[ram_fflags_bits_uop_iw_state_MPORT_addr] <= ram_fflags_bits_uop_iw_state_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_iw_p1_poisoned_MPORT_en & ram_fflags_bits_uop_iw_p1_poisoned_MPORT_mask) begin
      ram_fflags_bits_uop_iw_p1_poisoned[ram_fflags_bits_uop_iw_p1_poisoned_MPORT_addr] <=
        ram_fflags_bits_uop_iw_p1_poisoned_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_iw_p2_poisoned_MPORT_en & ram_fflags_bits_uop_iw_p2_poisoned_MPORT_mask) begin
      ram_fflags_bits_uop_iw_p2_poisoned[ram_fflags_bits_uop_iw_p2_poisoned_MPORT_addr] <=
        ram_fflags_bits_uop_iw_p2_poisoned_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_is_br_MPORT_en & ram_fflags_bits_uop_is_br_MPORT_mask) begin
      ram_fflags_bits_uop_is_br[ram_fflags_bits_uop_is_br_MPORT_addr] <= ram_fflags_bits_uop_is_br_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_is_jalr_MPORT_en & ram_fflags_bits_uop_is_jalr_MPORT_mask) begin
      ram_fflags_bits_uop_is_jalr[ram_fflags_bits_uop_is_jalr_MPORT_addr] <= ram_fflags_bits_uop_is_jalr_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_is_jal_MPORT_en & ram_fflags_bits_uop_is_jal_MPORT_mask) begin
      ram_fflags_bits_uop_is_jal[ram_fflags_bits_uop_is_jal_MPORT_addr] <= ram_fflags_bits_uop_is_jal_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_is_sfb_MPORT_en & ram_fflags_bits_uop_is_sfb_MPORT_mask) begin
      ram_fflags_bits_uop_is_sfb[ram_fflags_bits_uop_is_sfb_MPORT_addr] <= ram_fflags_bits_uop_is_sfb_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_br_mask_MPORT_en & ram_fflags_bits_uop_br_mask_MPORT_mask) begin
      ram_fflags_bits_uop_br_mask[ram_fflags_bits_uop_br_mask_MPORT_addr] <= ram_fflags_bits_uop_br_mask_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_br_tag_MPORT_en & ram_fflags_bits_uop_br_tag_MPORT_mask) begin
      ram_fflags_bits_uop_br_tag[ram_fflags_bits_uop_br_tag_MPORT_addr] <= ram_fflags_bits_uop_br_tag_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ftq_idx_MPORT_en & ram_fflags_bits_uop_ftq_idx_MPORT_mask) begin
      ram_fflags_bits_uop_ftq_idx[ram_fflags_bits_uop_ftq_idx_MPORT_addr] <= ram_fflags_bits_uop_ftq_idx_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_edge_inst_MPORT_en & ram_fflags_bits_uop_edge_inst_MPORT_mask) begin
      ram_fflags_bits_uop_edge_inst[ram_fflags_bits_uop_edge_inst_MPORT_addr] <=
        ram_fflags_bits_uop_edge_inst_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_pc_lob_MPORT_en & ram_fflags_bits_uop_pc_lob_MPORT_mask) begin
      ram_fflags_bits_uop_pc_lob[ram_fflags_bits_uop_pc_lob_MPORT_addr] <= ram_fflags_bits_uop_pc_lob_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_taken_MPORT_en & ram_fflags_bits_uop_taken_MPORT_mask) begin
      ram_fflags_bits_uop_taken[ram_fflags_bits_uop_taken_MPORT_addr] <= ram_fflags_bits_uop_taken_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_imm_packed_MPORT_en & ram_fflags_bits_uop_imm_packed_MPORT_mask) begin
      ram_fflags_bits_uop_imm_packed[ram_fflags_bits_uop_imm_packed_MPORT_addr] <=
        ram_fflags_bits_uop_imm_packed_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_csr_addr_MPORT_en & ram_fflags_bits_uop_csr_addr_MPORT_mask) begin
      ram_fflags_bits_uop_csr_addr[ram_fflags_bits_uop_csr_addr_MPORT_addr] <= ram_fflags_bits_uop_csr_addr_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_rob_idx_MPORT_en & ram_fflags_bits_uop_rob_idx_MPORT_mask) begin
      ram_fflags_bits_uop_rob_idx[ram_fflags_bits_uop_rob_idx_MPORT_addr] <= ram_fflags_bits_uop_rob_idx_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ldq_idx_MPORT_en & ram_fflags_bits_uop_ldq_idx_MPORT_mask) begin
      ram_fflags_bits_uop_ldq_idx[ram_fflags_bits_uop_ldq_idx_MPORT_addr] <= ram_fflags_bits_uop_ldq_idx_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_stq_idx_MPORT_en & ram_fflags_bits_uop_stq_idx_MPORT_mask) begin
      ram_fflags_bits_uop_stq_idx[ram_fflags_bits_uop_stq_idx_MPORT_addr] <= ram_fflags_bits_uop_stq_idx_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_rxq_idx_MPORT_en & ram_fflags_bits_uop_rxq_idx_MPORT_mask) begin
      ram_fflags_bits_uop_rxq_idx[ram_fflags_bits_uop_rxq_idx_MPORT_addr] <= ram_fflags_bits_uop_rxq_idx_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_pdst_MPORT_en & ram_fflags_bits_uop_pdst_MPORT_mask) begin
      ram_fflags_bits_uop_pdst[ram_fflags_bits_uop_pdst_MPORT_addr] <= ram_fflags_bits_uop_pdst_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_prs1_MPORT_en & ram_fflags_bits_uop_prs1_MPORT_mask) begin
      ram_fflags_bits_uop_prs1[ram_fflags_bits_uop_prs1_MPORT_addr] <= ram_fflags_bits_uop_prs1_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_prs2_MPORT_en & ram_fflags_bits_uop_prs2_MPORT_mask) begin
      ram_fflags_bits_uop_prs2[ram_fflags_bits_uop_prs2_MPORT_addr] <= ram_fflags_bits_uop_prs2_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_prs3_MPORT_en & ram_fflags_bits_uop_prs3_MPORT_mask) begin
      ram_fflags_bits_uop_prs3[ram_fflags_bits_uop_prs3_MPORT_addr] <= ram_fflags_bits_uop_prs3_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ppred_MPORT_en & ram_fflags_bits_uop_ppred_MPORT_mask) begin
      ram_fflags_bits_uop_ppred[ram_fflags_bits_uop_ppred_MPORT_addr] <= ram_fflags_bits_uop_ppred_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_prs1_busy_MPORT_en & ram_fflags_bits_uop_prs1_busy_MPORT_mask) begin
      ram_fflags_bits_uop_prs1_busy[ram_fflags_bits_uop_prs1_busy_MPORT_addr] <=
        ram_fflags_bits_uop_prs1_busy_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_prs2_busy_MPORT_en & ram_fflags_bits_uop_prs2_busy_MPORT_mask) begin
      ram_fflags_bits_uop_prs2_busy[ram_fflags_bits_uop_prs2_busy_MPORT_addr] <=
        ram_fflags_bits_uop_prs2_busy_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_prs3_busy_MPORT_en & ram_fflags_bits_uop_prs3_busy_MPORT_mask) begin
      ram_fflags_bits_uop_prs3_busy[ram_fflags_bits_uop_prs3_busy_MPORT_addr] <=
        ram_fflags_bits_uop_prs3_busy_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ppred_busy_MPORT_en & ram_fflags_bits_uop_ppred_busy_MPORT_mask) begin
      ram_fflags_bits_uop_ppred_busy[ram_fflags_bits_uop_ppred_busy_MPORT_addr] <=
        ram_fflags_bits_uop_ppred_busy_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_stale_pdst_MPORT_en & ram_fflags_bits_uop_stale_pdst_MPORT_mask) begin
      ram_fflags_bits_uop_stale_pdst[ram_fflags_bits_uop_stale_pdst_MPORT_addr] <=
        ram_fflags_bits_uop_stale_pdst_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_exception_MPORT_en & ram_fflags_bits_uop_exception_MPORT_mask) begin
      ram_fflags_bits_uop_exception[ram_fflags_bits_uop_exception_MPORT_addr] <=
        ram_fflags_bits_uop_exception_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_exc_cause_MPORT_en & ram_fflags_bits_uop_exc_cause_MPORT_mask) begin
      ram_fflags_bits_uop_exc_cause[ram_fflags_bits_uop_exc_cause_MPORT_addr] <=
        ram_fflags_bits_uop_exc_cause_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_bypassable_MPORT_en & ram_fflags_bits_uop_bypassable_MPORT_mask) begin
      ram_fflags_bits_uop_bypassable[ram_fflags_bits_uop_bypassable_MPORT_addr] <=
        ram_fflags_bits_uop_bypassable_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_mem_cmd_MPORT_en & ram_fflags_bits_uop_mem_cmd_MPORT_mask) begin
      ram_fflags_bits_uop_mem_cmd[ram_fflags_bits_uop_mem_cmd_MPORT_addr] <= ram_fflags_bits_uop_mem_cmd_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_mem_size_MPORT_en & ram_fflags_bits_uop_mem_size_MPORT_mask) begin
      ram_fflags_bits_uop_mem_size[ram_fflags_bits_uop_mem_size_MPORT_addr] <= ram_fflags_bits_uop_mem_size_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_mem_signed_MPORT_en & ram_fflags_bits_uop_mem_signed_MPORT_mask) begin
      ram_fflags_bits_uop_mem_signed[ram_fflags_bits_uop_mem_signed_MPORT_addr] <=
        ram_fflags_bits_uop_mem_signed_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_is_fence_MPORT_en & ram_fflags_bits_uop_is_fence_MPORT_mask) begin
      ram_fflags_bits_uop_is_fence[ram_fflags_bits_uop_is_fence_MPORT_addr] <= ram_fflags_bits_uop_is_fence_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_is_fencei_MPORT_en & ram_fflags_bits_uop_is_fencei_MPORT_mask) begin
      ram_fflags_bits_uop_is_fencei[ram_fflags_bits_uop_is_fencei_MPORT_addr] <=
        ram_fflags_bits_uop_is_fencei_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_is_amo_MPORT_en & ram_fflags_bits_uop_is_amo_MPORT_mask) begin
      ram_fflags_bits_uop_is_amo[ram_fflags_bits_uop_is_amo_MPORT_addr] <= ram_fflags_bits_uop_is_amo_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_uses_ldq_MPORT_en & ram_fflags_bits_uop_uses_ldq_MPORT_mask) begin
      ram_fflags_bits_uop_uses_ldq[ram_fflags_bits_uop_uses_ldq_MPORT_addr] <= ram_fflags_bits_uop_uses_ldq_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_uses_stq_MPORT_en & ram_fflags_bits_uop_uses_stq_MPORT_mask) begin
      ram_fflags_bits_uop_uses_stq[ram_fflags_bits_uop_uses_stq_MPORT_addr] <= ram_fflags_bits_uop_uses_stq_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_is_sys_pc2epc_MPORT_en & ram_fflags_bits_uop_is_sys_pc2epc_MPORT_mask) begin
      ram_fflags_bits_uop_is_sys_pc2epc[ram_fflags_bits_uop_is_sys_pc2epc_MPORT_addr] <=
        ram_fflags_bits_uop_is_sys_pc2epc_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_is_unique_MPORT_en & ram_fflags_bits_uop_is_unique_MPORT_mask) begin
      ram_fflags_bits_uop_is_unique[ram_fflags_bits_uop_is_unique_MPORT_addr] <=
        ram_fflags_bits_uop_is_unique_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_flush_on_commit_MPORT_en & ram_fflags_bits_uop_flush_on_commit_MPORT_mask) begin
      ram_fflags_bits_uop_flush_on_commit[ram_fflags_bits_uop_flush_on_commit_MPORT_addr] <=
        ram_fflags_bits_uop_flush_on_commit_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ldst_is_rs1_MPORT_en & ram_fflags_bits_uop_ldst_is_rs1_MPORT_mask) begin
      ram_fflags_bits_uop_ldst_is_rs1[ram_fflags_bits_uop_ldst_is_rs1_MPORT_addr] <=
        ram_fflags_bits_uop_ldst_is_rs1_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ldst_MPORT_en & ram_fflags_bits_uop_ldst_MPORT_mask) begin
      ram_fflags_bits_uop_ldst[ram_fflags_bits_uop_ldst_MPORT_addr] <= ram_fflags_bits_uop_ldst_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_lrs1_MPORT_en & ram_fflags_bits_uop_lrs1_MPORT_mask) begin
      ram_fflags_bits_uop_lrs1[ram_fflags_bits_uop_lrs1_MPORT_addr] <= ram_fflags_bits_uop_lrs1_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_lrs2_MPORT_en & ram_fflags_bits_uop_lrs2_MPORT_mask) begin
      ram_fflags_bits_uop_lrs2[ram_fflags_bits_uop_lrs2_MPORT_addr] <= ram_fflags_bits_uop_lrs2_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_lrs3_MPORT_en & ram_fflags_bits_uop_lrs3_MPORT_mask) begin
      ram_fflags_bits_uop_lrs3[ram_fflags_bits_uop_lrs3_MPORT_addr] <= ram_fflags_bits_uop_lrs3_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_ldst_val_MPORT_en & ram_fflags_bits_uop_ldst_val_MPORT_mask) begin
      ram_fflags_bits_uop_ldst_val[ram_fflags_bits_uop_ldst_val_MPORT_addr] <= ram_fflags_bits_uop_ldst_val_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_dst_rtype_MPORT_en & ram_fflags_bits_uop_dst_rtype_MPORT_mask) begin
      ram_fflags_bits_uop_dst_rtype[ram_fflags_bits_uop_dst_rtype_MPORT_addr] <=
        ram_fflags_bits_uop_dst_rtype_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_lrs1_rtype_MPORT_en & ram_fflags_bits_uop_lrs1_rtype_MPORT_mask) begin
      ram_fflags_bits_uop_lrs1_rtype[ram_fflags_bits_uop_lrs1_rtype_MPORT_addr] <=
        ram_fflags_bits_uop_lrs1_rtype_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_lrs2_rtype_MPORT_en & ram_fflags_bits_uop_lrs2_rtype_MPORT_mask) begin
      ram_fflags_bits_uop_lrs2_rtype[ram_fflags_bits_uop_lrs2_rtype_MPORT_addr] <=
        ram_fflags_bits_uop_lrs2_rtype_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_frs3_en_MPORT_en & ram_fflags_bits_uop_frs3_en_MPORT_mask) begin
      ram_fflags_bits_uop_frs3_en[ram_fflags_bits_uop_frs3_en_MPORT_addr] <= ram_fflags_bits_uop_frs3_en_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_fp_val_MPORT_en & ram_fflags_bits_uop_fp_val_MPORT_mask) begin
      ram_fflags_bits_uop_fp_val[ram_fflags_bits_uop_fp_val_MPORT_addr] <= ram_fflags_bits_uop_fp_val_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_fp_single_MPORT_en & ram_fflags_bits_uop_fp_single_MPORT_mask) begin
      ram_fflags_bits_uop_fp_single[ram_fflags_bits_uop_fp_single_MPORT_addr] <=
        ram_fflags_bits_uop_fp_single_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_xcpt_pf_if_MPORT_en & ram_fflags_bits_uop_xcpt_pf_if_MPORT_mask) begin
      ram_fflags_bits_uop_xcpt_pf_if[ram_fflags_bits_uop_xcpt_pf_if_MPORT_addr] <=
        ram_fflags_bits_uop_xcpt_pf_if_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_xcpt_ae_if_MPORT_en & ram_fflags_bits_uop_xcpt_ae_if_MPORT_mask) begin
      ram_fflags_bits_uop_xcpt_ae_if[ram_fflags_bits_uop_xcpt_ae_if_MPORT_addr] <=
        ram_fflags_bits_uop_xcpt_ae_if_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_xcpt_ma_if_MPORT_en & ram_fflags_bits_uop_xcpt_ma_if_MPORT_mask) begin
      ram_fflags_bits_uop_xcpt_ma_if[ram_fflags_bits_uop_xcpt_ma_if_MPORT_addr] <=
        ram_fflags_bits_uop_xcpt_ma_if_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_bp_debug_if_MPORT_en & ram_fflags_bits_uop_bp_debug_if_MPORT_mask) begin
      ram_fflags_bits_uop_bp_debug_if[ram_fflags_bits_uop_bp_debug_if_MPORT_addr] <=
        ram_fflags_bits_uop_bp_debug_if_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_bp_xcpt_if_MPORT_en & ram_fflags_bits_uop_bp_xcpt_if_MPORT_mask) begin
      ram_fflags_bits_uop_bp_xcpt_if[ram_fflags_bits_uop_bp_xcpt_if_MPORT_addr] <=
        ram_fflags_bits_uop_bp_xcpt_if_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_debug_fsrc_MPORT_en & ram_fflags_bits_uop_debug_fsrc_MPORT_mask) begin
      ram_fflags_bits_uop_debug_fsrc[ram_fflags_bits_uop_debug_fsrc_MPORT_addr] <=
        ram_fflags_bits_uop_debug_fsrc_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_uop_debug_tsrc_MPORT_en & ram_fflags_bits_uop_debug_tsrc_MPORT_mask) begin
      ram_fflags_bits_uop_debug_tsrc[ram_fflags_bits_uop_debug_tsrc_MPORT_addr] <=
        ram_fflags_bits_uop_debug_tsrc_MPORT_data; // @[util.scala 464:20]
    end
    if(ram_fflags_bits_flags_MPORT_en & ram_fflags_bits_flags_MPORT_mask) begin
      ram_fflags_bits_flags[ram_fflags_bits_flags_MPORT_addr] <= ram_fflags_bits_flags_MPORT_data; // @[util.scala 464:20]
    end
    if (reset) begin // @[util.scala 465:24]
      valids_0 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (3'h0 == value_1) begin // @[util.scala 496:27]
        valids_0 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_0 <= _GEN_748;
      end
    end else begin
      valids_0 <= _GEN_748;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_1 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (3'h1 == value_1) begin // @[util.scala 496:27]
        valids_1 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_1 <= _GEN_749;
      end
    end else begin
      valids_1 <= _GEN_749;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_2 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (3'h2 == value_1) begin // @[util.scala 496:27]
        valids_2 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_2 <= _GEN_750;
      end
    end else begin
      valids_2 <= _GEN_750;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_3 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (3'h3 == value_1) begin // @[util.scala 496:27]
        valids_3 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_3 <= _GEN_751;
      end
    end else begin
      valids_3 <= _GEN_751;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_4 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (3'h4 == value_1) begin // @[util.scala 496:27]
        valids_4 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_4 <= _GEN_752;
      end
    end else begin
      valids_4 <= _GEN_752;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_5 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (3'h5 == value_1) begin // @[util.scala 496:27]
        valids_5 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_5 <= _GEN_753;
      end
    end else begin
      valids_5 <= _GEN_753;
    end
    if (reset) begin // @[util.scala 465:24]
      valids_6 <= 1'h0; // @[util.scala 465:24]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (3'h6 == value_1) begin // @[util.scala 496:27]
        valids_6 <= 1'h0; // @[util.scala 496:27]
      end else begin
        valids_6 <= _GEN_754;
      end
    end else begin
      valids_6 <= _GEN_754;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 491:33]
        uops_0_br_mask <= _T_71; // @[util.scala 491:33]
      end else if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_0_br_mask <= _GEN_7;
      end
    end else begin
      uops_0_br_mask <= _GEN_7;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h0 == value) begin // @[util.scala 490:33]
        uops_0_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 491:33]
        uops_1_br_mask <= _T_71; // @[util.scala 491:33]
      end else if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_1_br_mask <= _GEN_8;
      end
    end else begin
      uops_1_br_mask <= _GEN_8;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h1 == value) begin // @[util.scala 490:33]
        uops_1_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 491:33]
        uops_2_br_mask <= _T_71; // @[util.scala 491:33]
      end else if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_2_br_mask <= _GEN_9;
      end
    end else begin
      uops_2_br_mask <= _GEN_9;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h2 == value) begin // @[util.scala 490:33]
        uops_2_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 491:33]
        uops_3_br_mask <= _T_71; // @[util.scala 491:33]
      end else if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_3_br_mask <= _GEN_10;
      end
    end else begin
      uops_3_br_mask <= _GEN_10;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h3 == value) begin // @[util.scala 490:33]
        uops_3_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 491:33]
        uops_4_br_mask <= _T_71; // @[util.scala 491:33]
      end else if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_4_br_mask <= _GEN_11;
      end
    end else begin
      uops_4_br_mask <= _GEN_11;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h4 == value) begin // @[util.scala 490:33]
        uops_4_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 491:33]
        uops_5_br_mask <= _T_71; // @[util.scala 491:33]
      end else if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_5_br_mask <= _GEN_12;
      end
    end else begin
      uops_5_br_mask <= _GEN_12;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h5 == value) begin // @[util.scala 490:33]
        uops_5_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_uopc <= io_enq_bits_uop_uopc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_inst <= io_enq_bits_uop_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_br <= io_enq_bits_uop_is_br; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 491:33]
        uops_6_br_mask <= _T_71; // @[util.scala 491:33]
      end else if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 490:33]
      end else begin
        uops_6_br_mask <= _GEN_13;
      end
    end else begin
      uops_6_br_mask <= _GEN_13;
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_taken <= io_enq_bits_uop_taken; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_pdst <= io_enq_bits_uop_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ppred <= io_enq_bits_uop_ppred; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_exception <= io_enq_bits_uop_exception; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ldst <= io_enq_bits_uop_ldst; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 490:33]
      end
    end
    if (do_enq) begin // @[util.scala 487:17]
      if (3'h6 == value) begin // @[util.scala 490:33]
        uops_6_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 490:33]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 3'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[util.scala 487:17]
      if (wrap) begin // @[Counter.scala 86:20]
        value <= 3'h0; // @[Counter.scala 86:28]
      end else begin
        value <= _value_T_1; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 3'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[util.scala 495:17]
      if (wrap_1) begin // @[Counter.scala 86:20]
        value_1 <= 3'h0; // @[Counter.scala 86:28]
      end else begin
        value_1 <= _value_T_3; // @[Counter.scala 76:15]
      end
    end
    if (reset) begin // @[util.scala 470:27]
      maybe_full <= 1'h0; // @[util.scala 470:27]
    end else if (do_enq != do_deq) begin // @[util.scala 500:28]
      if (io_empty) begin // @[util.scala 515:21]
        if (io_deq_ready) begin // @[util.scala 521:27]
          maybe_full <= 1'h0; // @[util.scala 521:36]
        end else begin
          maybe_full <= _T_2;
        end
      end else begin
        maybe_full <= _T_2;
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {3{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
  _RAND_7 = {1{`RANDOM}};
  _RAND_9 = {1{`RANDOM}};
  _RAND_11 = {1{`RANDOM}};
  _RAND_13 = {1{`RANDOM}};
  _RAND_15 = {2{`RANDOM}};
  _RAND_17 = {1{`RANDOM}};
  _RAND_19 = {1{`RANDOM}};
  _RAND_21 = {1{`RANDOM}};
  _RAND_23 = {1{`RANDOM}};
  _RAND_25 = {1{`RANDOM}};
  _RAND_27 = {1{`RANDOM}};
  _RAND_29 = {1{`RANDOM}};
  _RAND_31 = {1{`RANDOM}};
  _RAND_33 = {1{`RANDOM}};
  _RAND_35 = {1{`RANDOM}};
  _RAND_37 = {1{`RANDOM}};
  _RAND_39 = {1{`RANDOM}};
  _RAND_41 = {1{`RANDOM}};
  _RAND_43 = {1{`RANDOM}};
  _RAND_45 = {1{`RANDOM}};
  _RAND_47 = {1{`RANDOM}};
  _RAND_49 = {1{`RANDOM}};
  _RAND_51 = {1{`RANDOM}};
  _RAND_53 = {1{`RANDOM}};
  _RAND_55 = {1{`RANDOM}};
  _RAND_57 = {1{`RANDOM}};
  _RAND_59 = {1{`RANDOM}};
  _RAND_61 = {1{`RANDOM}};
  _RAND_63 = {1{`RANDOM}};
  _RAND_65 = {1{`RANDOM}};
  _RAND_67 = {1{`RANDOM}};
  _RAND_69 = {1{`RANDOM}};
  _RAND_71 = {1{`RANDOM}};
  _RAND_73 = {1{`RANDOM}};
  _RAND_75 = {1{`RANDOM}};
  _RAND_77 = {1{`RANDOM}};
  _RAND_79 = {1{`RANDOM}};
  _RAND_81 = {1{`RANDOM}};
  _RAND_83 = {1{`RANDOM}};
  _RAND_85 = {1{`RANDOM}};
  _RAND_87 = {1{`RANDOM}};
  _RAND_89 = {1{`RANDOM}};
  _RAND_91 = {1{`RANDOM}};
  _RAND_93 = {1{`RANDOM}};
  _RAND_95 = {1{`RANDOM}};
  _RAND_97 = {1{`RANDOM}};
  _RAND_99 = {1{`RANDOM}};
  _RAND_101 = {2{`RANDOM}};
  _RAND_103 = {1{`RANDOM}};
  _RAND_105 = {1{`RANDOM}};
  _RAND_107 = {1{`RANDOM}};
  _RAND_109 = {1{`RANDOM}};
  _RAND_111 = {1{`RANDOM}};
  _RAND_113 = {1{`RANDOM}};
  _RAND_115 = {1{`RANDOM}};
  _RAND_117 = {1{`RANDOM}};
  _RAND_119 = {1{`RANDOM}};
  _RAND_121 = {1{`RANDOM}};
  _RAND_123 = {1{`RANDOM}};
  _RAND_125 = {1{`RANDOM}};
  _RAND_127 = {1{`RANDOM}};
  _RAND_129 = {1{`RANDOM}};
  _RAND_131 = {1{`RANDOM}};
  _RAND_133 = {1{`RANDOM}};
  _RAND_135 = {1{`RANDOM}};
  _RAND_137 = {1{`RANDOM}};
  _RAND_139 = {1{`RANDOM}};
  _RAND_141 = {1{`RANDOM}};
  _RAND_143 = {1{`RANDOM}};
  _RAND_145 = {1{`RANDOM}};
  _RAND_147 = {1{`RANDOM}};
  _RAND_149 = {1{`RANDOM}};
  _RAND_151 = {1{`RANDOM}};
  _RAND_153 = {1{`RANDOM}};
  _RAND_155 = {1{`RANDOM}};
  _RAND_157 = {1{`RANDOM}};
  _RAND_159 = {1{`RANDOM}};
  _RAND_161 = {1{`RANDOM}};
  _RAND_163 = {1{`RANDOM}};
  _RAND_165 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {3{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[64:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_predicated[initvar] = _RAND_2[0:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_valid[initvar] = _RAND_4[0:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_uopc[initvar] = _RAND_6[6:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_inst[initvar] = _RAND_8[31:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_debug_inst[initvar] = _RAND_10[31:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_rvc[initvar] = _RAND_12[0:0];
  _RAND_14 = {2{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_debug_pc[initvar] = _RAND_14[39:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_iq_type[initvar] = _RAND_16[2:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_fu_code[initvar] = _RAND_18[9:0];
  _RAND_20 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_br_type[initvar] = _RAND_20[3:0];
  _RAND_22 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_op1_sel[initvar] = _RAND_22[1:0];
  _RAND_24 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_op2_sel[initvar] = _RAND_24[2:0];
  _RAND_26 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_imm_sel[initvar] = _RAND_26[2:0];
  _RAND_28 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_op_fcn[initvar] = _RAND_28[3:0];
  _RAND_30 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_fcn_dw[initvar] = _RAND_30[0:0];
  _RAND_32 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_csr_cmd[initvar] = _RAND_32[2:0];
  _RAND_34 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_is_load[initvar] = _RAND_34[0:0];
  _RAND_36 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_is_sta[initvar] = _RAND_36[0:0];
  _RAND_38 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ctrl_is_std[initvar] = _RAND_38[0:0];
  _RAND_40 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_iw_state[initvar] = _RAND_40[1:0];
  _RAND_42 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_iw_p1_poisoned[initvar] = _RAND_42[0:0];
  _RAND_44 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_iw_p2_poisoned[initvar] = _RAND_44[0:0];
  _RAND_46 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_br[initvar] = _RAND_46[0:0];
  _RAND_48 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_jalr[initvar] = _RAND_48[0:0];
  _RAND_50 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_jal[initvar] = _RAND_50[0:0];
  _RAND_52 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_sfb[initvar] = _RAND_52[0:0];
  _RAND_54 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_br_mask[initvar] = _RAND_54[11:0];
  _RAND_56 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_br_tag[initvar] = _RAND_56[3:0];
  _RAND_58 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ftq_idx[initvar] = _RAND_58[4:0];
  _RAND_60 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_edge_inst[initvar] = _RAND_60[0:0];
  _RAND_62 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_pc_lob[initvar] = _RAND_62[5:0];
  _RAND_64 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_taken[initvar] = _RAND_64[0:0];
  _RAND_66 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_imm_packed[initvar] = _RAND_66[19:0];
  _RAND_68 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_csr_addr[initvar] = _RAND_68[11:0];
  _RAND_70 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_rob_idx[initvar] = _RAND_70[5:0];
  _RAND_72 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ldq_idx[initvar] = _RAND_72[3:0];
  _RAND_74 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_stq_idx[initvar] = _RAND_74[3:0];
  _RAND_76 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_rxq_idx[initvar] = _RAND_76[1:0];
  _RAND_78 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_pdst[initvar] = _RAND_78[5:0];
  _RAND_80 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs1[initvar] = _RAND_80[5:0];
  _RAND_82 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs2[initvar] = _RAND_82[5:0];
  _RAND_84 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs3[initvar] = _RAND_84[5:0];
  _RAND_86 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ppred[initvar] = _RAND_86[4:0];
  _RAND_88 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs1_busy[initvar] = _RAND_88[0:0];
  _RAND_90 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs2_busy[initvar] = _RAND_90[0:0];
  _RAND_92 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_prs3_busy[initvar] = _RAND_92[0:0];
  _RAND_94 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ppred_busy[initvar] = _RAND_94[0:0];
  _RAND_96 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_stale_pdst[initvar] = _RAND_96[5:0];
  _RAND_98 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_exception[initvar] = _RAND_98[0:0];
  _RAND_100 = {2{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_exc_cause[initvar] = _RAND_100[63:0];
  _RAND_102 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_bypassable[initvar] = _RAND_102[0:0];
  _RAND_104 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_mem_cmd[initvar] = _RAND_104[4:0];
  _RAND_106 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_mem_size[initvar] = _RAND_106[1:0];
  _RAND_108 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_mem_signed[initvar] = _RAND_108[0:0];
  _RAND_110 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_fence[initvar] = _RAND_110[0:0];
  _RAND_112 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_fencei[initvar] = _RAND_112[0:0];
  _RAND_114 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_amo[initvar] = _RAND_114[0:0];
  _RAND_116 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_uses_ldq[initvar] = _RAND_116[0:0];
  _RAND_118 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_uses_stq[initvar] = _RAND_118[0:0];
  _RAND_120 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_sys_pc2epc[initvar] = _RAND_120[0:0];
  _RAND_122 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_is_unique[initvar] = _RAND_122[0:0];
  _RAND_124 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_flush_on_commit[initvar] = _RAND_124[0:0];
  _RAND_126 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ldst_is_rs1[initvar] = _RAND_126[0:0];
  _RAND_128 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ldst[initvar] = _RAND_128[5:0];
  _RAND_130 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_lrs1[initvar] = _RAND_130[5:0];
  _RAND_132 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_lrs2[initvar] = _RAND_132[5:0];
  _RAND_134 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_lrs3[initvar] = _RAND_134[5:0];
  _RAND_136 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_ldst_val[initvar] = _RAND_136[0:0];
  _RAND_138 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_dst_rtype[initvar] = _RAND_138[1:0];
  _RAND_140 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_lrs1_rtype[initvar] = _RAND_140[1:0];
  _RAND_142 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_lrs2_rtype[initvar] = _RAND_142[1:0];
  _RAND_144 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_frs3_en[initvar] = _RAND_144[0:0];
  _RAND_146 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_fp_val[initvar] = _RAND_146[0:0];
  _RAND_148 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_fp_single[initvar] = _RAND_148[0:0];
  _RAND_150 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_xcpt_pf_if[initvar] = _RAND_150[0:0];
  _RAND_152 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_xcpt_ae_if[initvar] = _RAND_152[0:0];
  _RAND_154 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_xcpt_ma_if[initvar] = _RAND_154[0:0];
  _RAND_156 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_bp_debug_if[initvar] = _RAND_156[0:0];
  _RAND_158 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_bp_xcpt_if[initvar] = _RAND_158[0:0];
  _RAND_160 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_debug_fsrc[initvar] = _RAND_160[1:0];
  _RAND_162 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_uop_debug_tsrc[initvar] = _RAND_162[1:0];
  _RAND_164 = {1{`RANDOM}};
  for (initvar = 0; initvar < 7; initvar = initvar+1)
    ram_fflags_bits_flags[initvar] = _RAND_164[4:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_166 = {1{`RANDOM}};
  valids_0 = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  valids_1 = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  valids_2 = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  valids_3 = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  valids_4 = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  valids_5 = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  valids_6 = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  uops_0_uopc = _RAND_173[6:0];
  _RAND_174 = {1{`RANDOM}};
  uops_0_inst = _RAND_174[31:0];
  _RAND_175 = {1{`RANDOM}};
  uops_0_debug_inst = _RAND_175[31:0];
  _RAND_176 = {1{`RANDOM}};
  uops_0_is_rvc = _RAND_176[0:0];
  _RAND_177 = {2{`RANDOM}};
  uops_0_debug_pc = _RAND_177[39:0];
  _RAND_178 = {1{`RANDOM}};
  uops_0_iq_type = _RAND_178[2:0];
  _RAND_179 = {1{`RANDOM}};
  uops_0_fu_code = _RAND_179[9:0];
  _RAND_180 = {1{`RANDOM}};
  uops_0_ctrl_br_type = _RAND_180[3:0];
  _RAND_181 = {1{`RANDOM}};
  uops_0_ctrl_op1_sel = _RAND_181[1:0];
  _RAND_182 = {1{`RANDOM}};
  uops_0_ctrl_op2_sel = _RAND_182[2:0];
  _RAND_183 = {1{`RANDOM}};
  uops_0_ctrl_imm_sel = _RAND_183[2:0];
  _RAND_184 = {1{`RANDOM}};
  uops_0_ctrl_op_fcn = _RAND_184[3:0];
  _RAND_185 = {1{`RANDOM}};
  uops_0_ctrl_fcn_dw = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  uops_0_ctrl_csr_cmd = _RAND_186[2:0];
  _RAND_187 = {1{`RANDOM}};
  uops_0_ctrl_is_load = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  uops_0_ctrl_is_sta = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  uops_0_ctrl_is_std = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  uops_0_iw_state = _RAND_190[1:0];
  _RAND_191 = {1{`RANDOM}};
  uops_0_iw_p1_poisoned = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  uops_0_iw_p2_poisoned = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  uops_0_is_br = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  uops_0_is_jalr = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  uops_0_is_jal = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  uops_0_is_sfb = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  uops_0_br_mask = _RAND_197[11:0];
  _RAND_198 = {1{`RANDOM}};
  uops_0_br_tag = _RAND_198[3:0];
  _RAND_199 = {1{`RANDOM}};
  uops_0_ftq_idx = _RAND_199[4:0];
  _RAND_200 = {1{`RANDOM}};
  uops_0_edge_inst = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  uops_0_pc_lob = _RAND_201[5:0];
  _RAND_202 = {1{`RANDOM}};
  uops_0_taken = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  uops_0_imm_packed = _RAND_203[19:0];
  _RAND_204 = {1{`RANDOM}};
  uops_0_csr_addr = _RAND_204[11:0];
  _RAND_205 = {1{`RANDOM}};
  uops_0_rob_idx = _RAND_205[5:0];
  _RAND_206 = {1{`RANDOM}};
  uops_0_ldq_idx = _RAND_206[3:0];
  _RAND_207 = {1{`RANDOM}};
  uops_0_stq_idx = _RAND_207[3:0];
  _RAND_208 = {1{`RANDOM}};
  uops_0_rxq_idx = _RAND_208[1:0];
  _RAND_209 = {1{`RANDOM}};
  uops_0_pdst = _RAND_209[5:0];
  _RAND_210 = {1{`RANDOM}};
  uops_0_prs1 = _RAND_210[5:0];
  _RAND_211 = {1{`RANDOM}};
  uops_0_prs2 = _RAND_211[5:0];
  _RAND_212 = {1{`RANDOM}};
  uops_0_prs3 = _RAND_212[5:0];
  _RAND_213 = {1{`RANDOM}};
  uops_0_ppred = _RAND_213[4:0];
  _RAND_214 = {1{`RANDOM}};
  uops_0_prs1_busy = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  uops_0_prs2_busy = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  uops_0_prs3_busy = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  uops_0_ppred_busy = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  uops_0_stale_pdst = _RAND_218[5:0];
  _RAND_219 = {1{`RANDOM}};
  uops_0_exception = _RAND_219[0:0];
  _RAND_220 = {2{`RANDOM}};
  uops_0_exc_cause = _RAND_220[63:0];
  _RAND_221 = {1{`RANDOM}};
  uops_0_bypassable = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  uops_0_mem_cmd = _RAND_222[4:0];
  _RAND_223 = {1{`RANDOM}};
  uops_0_mem_size = _RAND_223[1:0];
  _RAND_224 = {1{`RANDOM}};
  uops_0_mem_signed = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  uops_0_is_fence = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  uops_0_is_fencei = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  uops_0_is_amo = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  uops_0_uses_ldq = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  uops_0_uses_stq = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  uops_0_is_sys_pc2epc = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  uops_0_is_unique = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  uops_0_flush_on_commit = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  uops_0_ldst_is_rs1 = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  uops_0_ldst = _RAND_234[5:0];
  _RAND_235 = {1{`RANDOM}};
  uops_0_lrs1 = _RAND_235[5:0];
  _RAND_236 = {1{`RANDOM}};
  uops_0_lrs2 = _RAND_236[5:0];
  _RAND_237 = {1{`RANDOM}};
  uops_0_lrs3 = _RAND_237[5:0];
  _RAND_238 = {1{`RANDOM}};
  uops_0_ldst_val = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  uops_0_dst_rtype = _RAND_239[1:0];
  _RAND_240 = {1{`RANDOM}};
  uops_0_lrs1_rtype = _RAND_240[1:0];
  _RAND_241 = {1{`RANDOM}};
  uops_0_lrs2_rtype = _RAND_241[1:0];
  _RAND_242 = {1{`RANDOM}};
  uops_0_frs3_en = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  uops_0_fp_val = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  uops_0_fp_single = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  uops_0_xcpt_pf_if = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  uops_0_xcpt_ae_if = _RAND_246[0:0];
  _RAND_247 = {1{`RANDOM}};
  uops_0_xcpt_ma_if = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  uops_0_bp_debug_if = _RAND_248[0:0];
  _RAND_249 = {1{`RANDOM}};
  uops_0_bp_xcpt_if = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  uops_0_debug_fsrc = _RAND_250[1:0];
  _RAND_251 = {1{`RANDOM}};
  uops_0_debug_tsrc = _RAND_251[1:0];
  _RAND_252 = {1{`RANDOM}};
  uops_1_uopc = _RAND_252[6:0];
  _RAND_253 = {1{`RANDOM}};
  uops_1_inst = _RAND_253[31:0];
  _RAND_254 = {1{`RANDOM}};
  uops_1_debug_inst = _RAND_254[31:0];
  _RAND_255 = {1{`RANDOM}};
  uops_1_is_rvc = _RAND_255[0:0];
  _RAND_256 = {2{`RANDOM}};
  uops_1_debug_pc = _RAND_256[39:0];
  _RAND_257 = {1{`RANDOM}};
  uops_1_iq_type = _RAND_257[2:0];
  _RAND_258 = {1{`RANDOM}};
  uops_1_fu_code = _RAND_258[9:0];
  _RAND_259 = {1{`RANDOM}};
  uops_1_ctrl_br_type = _RAND_259[3:0];
  _RAND_260 = {1{`RANDOM}};
  uops_1_ctrl_op1_sel = _RAND_260[1:0];
  _RAND_261 = {1{`RANDOM}};
  uops_1_ctrl_op2_sel = _RAND_261[2:0];
  _RAND_262 = {1{`RANDOM}};
  uops_1_ctrl_imm_sel = _RAND_262[2:0];
  _RAND_263 = {1{`RANDOM}};
  uops_1_ctrl_op_fcn = _RAND_263[3:0];
  _RAND_264 = {1{`RANDOM}};
  uops_1_ctrl_fcn_dw = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  uops_1_ctrl_csr_cmd = _RAND_265[2:0];
  _RAND_266 = {1{`RANDOM}};
  uops_1_ctrl_is_load = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  uops_1_ctrl_is_sta = _RAND_267[0:0];
  _RAND_268 = {1{`RANDOM}};
  uops_1_ctrl_is_std = _RAND_268[0:0];
  _RAND_269 = {1{`RANDOM}};
  uops_1_iw_state = _RAND_269[1:0];
  _RAND_270 = {1{`RANDOM}};
  uops_1_iw_p1_poisoned = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  uops_1_iw_p2_poisoned = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  uops_1_is_br = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  uops_1_is_jalr = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  uops_1_is_jal = _RAND_274[0:0];
  _RAND_275 = {1{`RANDOM}};
  uops_1_is_sfb = _RAND_275[0:0];
  _RAND_276 = {1{`RANDOM}};
  uops_1_br_mask = _RAND_276[11:0];
  _RAND_277 = {1{`RANDOM}};
  uops_1_br_tag = _RAND_277[3:0];
  _RAND_278 = {1{`RANDOM}};
  uops_1_ftq_idx = _RAND_278[4:0];
  _RAND_279 = {1{`RANDOM}};
  uops_1_edge_inst = _RAND_279[0:0];
  _RAND_280 = {1{`RANDOM}};
  uops_1_pc_lob = _RAND_280[5:0];
  _RAND_281 = {1{`RANDOM}};
  uops_1_taken = _RAND_281[0:0];
  _RAND_282 = {1{`RANDOM}};
  uops_1_imm_packed = _RAND_282[19:0];
  _RAND_283 = {1{`RANDOM}};
  uops_1_csr_addr = _RAND_283[11:0];
  _RAND_284 = {1{`RANDOM}};
  uops_1_rob_idx = _RAND_284[5:0];
  _RAND_285 = {1{`RANDOM}};
  uops_1_ldq_idx = _RAND_285[3:0];
  _RAND_286 = {1{`RANDOM}};
  uops_1_stq_idx = _RAND_286[3:0];
  _RAND_287 = {1{`RANDOM}};
  uops_1_rxq_idx = _RAND_287[1:0];
  _RAND_288 = {1{`RANDOM}};
  uops_1_pdst = _RAND_288[5:0];
  _RAND_289 = {1{`RANDOM}};
  uops_1_prs1 = _RAND_289[5:0];
  _RAND_290 = {1{`RANDOM}};
  uops_1_prs2 = _RAND_290[5:0];
  _RAND_291 = {1{`RANDOM}};
  uops_1_prs3 = _RAND_291[5:0];
  _RAND_292 = {1{`RANDOM}};
  uops_1_ppred = _RAND_292[4:0];
  _RAND_293 = {1{`RANDOM}};
  uops_1_prs1_busy = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  uops_1_prs2_busy = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  uops_1_prs3_busy = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  uops_1_ppred_busy = _RAND_296[0:0];
  _RAND_297 = {1{`RANDOM}};
  uops_1_stale_pdst = _RAND_297[5:0];
  _RAND_298 = {1{`RANDOM}};
  uops_1_exception = _RAND_298[0:0];
  _RAND_299 = {2{`RANDOM}};
  uops_1_exc_cause = _RAND_299[63:0];
  _RAND_300 = {1{`RANDOM}};
  uops_1_bypassable = _RAND_300[0:0];
  _RAND_301 = {1{`RANDOM}};
  uops_1_mem_cmd = _RAND_301[4:0];
  _RAND_302 = {1{`RANDOM}};
  uops_1_mem_size = _RAND_302[1:0];
  _RAND_303 = {1{`RANDOM}};
  uops_1_mem_signed = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  uops_1_is_fence = _RAND_304[0:0];
  _RAND_305 = {1{`RANDOM}};
  uops_1_is_fencei = _RAND_305[0:0];
  _RAND_306 = {1{`RANDOM}};
  uops_1_is_amo = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  uops_1_uses_ldq = _RAND_307[0:0];
  _RAND_308 = {1{`RANDOM}};
  uops_1_uses_stq = _RAND_308[0:0];
  _RAND_309 = {1{`RANDOM}};
  uops_1_is_sys_pc2epc = _RAND_309[0:0];
  _RAND_310 = {1{`RANDOM}};
  uops_1_is_unique = _RAND_310[0:0];
  _RAND_311 = {1{`RANDOM}};
  uops_1_flush_on_commit = _RAND_311[0:0];
  _RAND_312 = {1{`RANDOM}};
  uops_1_ldst_is_rs1 = _RAND_312[0:0];
  _RAND_313 = {1{`RANDOM}};
  uops_1_ldst = _RAND_313[5:0];
  _RAND_314 = {1{`RANDOM}};
  uops_1_lrs1 = _RAND_314[5:0];
  _RAND_315 = {1{`RANDOM}};
  uops_1_lrs2 = _RAND_315[5:0];
  _RAND_316 = {1{`RANDOM}};
  uops_1_lrs3 = _RAND_316[5:0];
  _RAND_317 = {1{`RANDOM}};
  uops_1_ldst_val = _RAND_317[0:0];
  _RAND_318 = {1{`RANDOM}};
  uops_1_dst_rtype = _RAND_318[1:0];
  _RAND_319 = {1{`RANDOM}};
  uops_1_lrs1_rtype = _RAND_319[1:0];
  _RAND_320 = {1{`RANDOM}};
  uops_1_lrs2_rtype = _RAND_320[1:0];
  _RAND_321 = {1{`RANDOM}};
  uops_1_frs3_en = _RAND_321[0:0];
  _RAND_322 = {1{`RANDOM}};
  uops_1_fp_val = _RAND_322[0:0];
  _RAND_323 = {1{`RANDOM}};
  uops_1_fp_single = _RAND_323[0:0];
  _RAND_324 = {1{`RANDOM}};
  uops_1_xcpt_pf_if = _RAND_324[0:0];
  _RAND_325 = {1{`RANDOM}};
  uops_1_xcpt_ae_if = _RAND_325[0:0];
  _RAND_326 = {1{`RANDOM}};
  uops_1_xcpt_ma_if = _RAND_326[0:0];
  _RAND_327 = {1{`RANDOM}};
  uops_1_bp_debug_if = _RAND_327[0:0];
  _RAND_328 = {1{`RANDOM}};
  uops_1_bp_xcpt_if = _RAND_328[0:0];
  _RAND_329 = {1{`RANDOM}};
  uops_1_debug_fsrc = _RAND_329[1:0];
  _RAND_330 = {1{`RANDOM}};
  uops_1_debug_tsrc = _RAND_330[1:0];
  _RAND_331 = {1{`RANDOM}};
  uops_2_uopc = _RAND_331[6:0];
  _RAND_332 = {1{`RANDOM}};
  uops_2_inst = _RAND_332[31:0];
  _RAND_333 = {1{`RANDOM}};
  uops_2_debug_inst = _RAND_333[31:0];
  _RAND_334 = {1{`RANDOM}};
  uops_2_is_rvc = _RAND_334[0:0];
  _RAND_335 = {2{`RANDOM}};
  uops_2_debug_pc = _RAND_335[39:0];
  _RAND_336 = {1{`RANDOM}};
  uops_2_iq_type = _RAND_336[2:0];
  _RAND_337 = {1{`RANDOM}};
  uops_2_fu_code = _RAND_337[9:0];
  _RAND_338 = {1{`RANDOM}};
  uops_2_ctrl_br_type = _RAND_338[3:0];
  _RAND_339 = {1{`RANDOM}};
  uops_2_ctrl_op1_sel = _RAND_339[1:0];
  _RAND_340 = {1{`RANDOM}};
  uops_2_ctrl_op2_sel = _RAND_340[2:0];
  _RAND_341 = {1{`RANDOM}};
  uops_2_ctrl_imm_sel = _RAND_341[2:0];
  _RAND_342 = {1{`RANDOM}};
  uops_2_ctrl_op_fcn = _RAND_342[3:0];
  _RAND_343 = {1{`RANDOM}};
  uops_2_ctrl_fcn_dw = _RAND_343[0:0];
  _RAND_344 = {1{`RANDOM}};
  uops_2_ctrl_csr_cmd = _RAND_344[2:0];
  _RAND_345 = {1{`RANDOM}};
  uops_2_ctrl_is_load = _RAND_345[0:0];
  _RAND_346 = {1{`RANDOM}};
  uops_2_ctrl_is_sta = _RAND_346[0:0];
  _RAND_347 = {1{`RANDOM}};
  uops_2_ctrl_is_std = _RAND_347[0:0];
  _RAND_348 = {1{`RANDOM}};
  uops_2_iw_state = _RAND_348[1:0];
  _RAND_349 = {1{`RANDOM}};
  uops_2_iw_p1_poisoned = _RAND_349[0:0];
  _RAND_350 = {1{`RANDOM}};
  uops_2_iw_p2_poisoned = _RAND_350[0:0];
  _RAND_351 = {1{`RANDOM}};
  uops_2_is_br = _RAND_351[0:0];
  _RAND_352 = {1{`RANDOM}};
  uops_2_is_jalr = _RAND_352[0:0];
  _RAND_353 = {1{`RANDOM}};
  uops_2_is_jal = _RAND_353[0:0];
  _RAND_354 = {1{`RANDOM}};
  uops_2_is_sfb = _RAND_354[0:0];
  _RAND_355 = {1{`RANDOM}};
  uops_2_br_mask = _RAND_355[11:0];
  _RAND_356 = {1{`RANDOM}};
  uops_2_br_tag = _RAND_356[3:0];
  _RAND_357 = {1{`RANDOM}};
  uops_2_ftq_idx = _RAND_357[4:0];
  _RAND_358 = {1{`RANDOM}};
  uops_2_edge_inst = _RAND_358[0:0];
  _RAND_359 = {1{`RANDOM}};
  uops_2_pc_lob = _RAND_359[5:0];
  _RAND_360 = {1{`RANDOM}};
  uops_2_taken = _RAND_360[0:0];
  _RAND_361 = {1{`RANDOM}};
  uops_2_imm_packed = _RAND_361[19:0];
  _RAND_362 = {1{`RANDOM}};
  uops_2_csr_addr = _RAND_362[11:0];
  _RAND_363 = {1{`RANDOM}};
  uops_2_rob_idx = _RAND_363[5:0];
  _RAND_364 = {1{`RANDOM}};
  uops_2_ldq_idx = _RAND_364[3:0];
  _RAND_365 = {1{`RANDOM}};
  uops_2_stq_idx = _RAND_365[3:0];
  _RAND_366 = {1{`RANDOM}};
  uops_2_rxq_idx = _RAND_366[1:0];
  _RAND_367 = {1{`RANDOM}};
  uops_2_pdst = _RAND_367[5:0];
  _RAND_368 = {1{`RANDOM}};
  uops_2_prs1 = _RAND_368[5:0];
  _RAND_369 = {1{`RANDOM}};
  uops_2_prs2 = _RAND_369[5:0];
  _RAND_370 = {1{`RANDOM}};
  uops_2_prs3 = _RAND_370[5:0];
  _RAND_371 = {1{`RANDOM}};
  uops_2_ppred = _RAND_371[4:0];
  _RAND_372 = {1{`RANDOM}};
  uops_2_prs1_busy = _RAND_372[0:0];
  _RAND_373 = {1{`RANDOM}};
  uops_2_prs2_busy = _RAND_373[0:0];
  _RAND_374 = {1{`RANDOM}};
  uops_2_prs3_busy = _RAND_374[0:0];
  _RAND_375 = {1{`RANDOM}};
  uops_2_ppred_busy = _RAND_375[0:0];
  _RAND_376 = {1{`RANDOM}};
  uops_2_stale_pdst = _RAND_376[5:0];
  _RAND_377 = {1{`RANDOM}};
  uops_2_exception = _RAND_377[0:0];
  _RAND_378 = {2{`RANDOM}};
  uops_2_exc_cause = _RAND_378[63:0];
  _RAND_379 = {1{`RANDOM}};
  uops_2_bypassable = _RAND_379[0:0];
  _RAND_380 = {1{`RANDOM}};
  uops_2_mem_cmd = _RAND_380[4:0];
  _RAND_381 = {1{`RANDOM}};
  uops_2_mem_size = _RAND_381[1:0];
  _RAND_382 = {1{`RANDOM}};
  uops_2_mem_signed = _RAND_382[0:0];
  _RAND_383 = {1{`RANDOM}};
  uops_2_is_fence = _RAND_383[0:0];
  _RAND_384 = {1{`RANDOM}};
  uops_2_is_fencei = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  uops_2_is_amo = _RAND_385[0:0];
  _RAND_386 = {1{`RANDOM}};
  uops_2_uses_ldq = _RAND_386[0:0];
  _RAND_387 = {1{`RANDOM}};
  uops_2_uses_stq = _RAND_387[0:0];
  _RAND_388 = {1{`RANDOM}};
  uops_2_is_sys_pc2epc = _RAND_388[0:0];
  _RAND_389 = {1{`RANDOM}};
  uops_2_is_unique = _RAND_389[0:0];
  _RAND_390 = {1{`RANDOM}};
  uops_2_flush_on_commit = _RAND_390[0:0];
  _RAND_391 = {1{`RANDOM}};
  uops_2_ldst_is_rs1 = _RAND_391[0:0];
  _RAND_392 = {1{`RANDOM}};
  uops_2_ldst = _RAND_392[5:0];
  _RAND_393 = {1{`RANDOM}};
  uops_2_lrs1 = _RAND_393[5:0];
  _RAND_394 = {1{`RANDOM}};
  uops_2_lrs2 = _RAND_394[5:0];
  _RAND_395 = {1{`RANDOM}};
  uops_2_lrs3 = _RAND_395[5:0];
  _RAND_396 = {1{`RANDOM}};
  uops_2_ldst_val = _RAND_396[0:0];
  _RAND_397 = {1{`RANDOM}};
  uops_2_dst_rtype = _RAND_397[1:0];
  _RAND_398 = {1{`RANDOM}};
  uops_2_lrs1_rtype = _RAND_398[1:0];
  _RAND_399 = {1{`RANDOM}};
  uops_2_lrs2_rtype = _RAND_399[1:0];
  _RAND_400 = {1{`RANDOM}};
  uops_2_frs3_en = _RAND_400[0:0];
  _RAND_401 = {1{`RANDOM}};
  uops_2_fp_val = _RAND_401[0:0];
  _RAND_402 = {1{`RANDOM}};
  uops_2_fp_single = _RAND_402[0:0];
  _RAND_403 = {1{`RANDOM}};
  uops_2_xcpt_pf_if = _RAND_403[0:0];
  _RAND_404 = {1{`RANDOM}};
  uops_2_xcpt_ae_if = _RAND_404[0:0];
  _RAND_405 = {1{`RANDOM}};
  uops_2_xcpt_ma_if = _RAND_405[0:0];
  _RAND_406 = {1{`RANDOM}};
  uops_2_bp_debug_if = _RAND_406[0:0];
  _RAND_407 = {1{`RANDOM}};
  uops_2_bp_xcpt_if = _RAND_407[0:0];
  _RAND_408 = {1{`RANDOM}};
  uops_2_debug_fsrc = _RAND_408[1:0];
  _RAND_409 = {1{`RANDOM}};
  uops_2_debug_tsrc = _RAND_409[1:0];
  _RAND_410 = {1{`RANDOM}};
  uops_3_uopc = _RAND_410[6:0];
  _RAND_411 = {1{`RANDOM}};
  uops_3_inst = _RAND_411[31:0];
  _RAND_412 = {1{`RANDOM}};
  uops_3_debug_inst = _RAND_412[31:0];
  _RAND_413 = {1{`RANDOM}};
  uops_3_is_rvc = _RAND_413[0:0];
  _RAND_414 = {2{`RANDOM}};
  uops_3_debug_pc = _RAND_414[39:0];
  _RAND_415 = {1{`RANDOM}};
  uops_3_iq_type = _RAND_415[2:0];
  _RAND_416 = {1{`RANDOM}};
  uops_3_fu_code = _RAND_416[9:0];
  _RAND_417 = {1{`RANDOM}};
  uops_3_ctrl_br_type = _RAND_417[3:0];
  _RAND_418 = {1{`RANDOM}};
  uops_3_ctrl_op1_sel = _RAND_418[1:0];
  _RAND_419 = {1{`RANDOM}};
  uops_3_ctrl_op2_sel = _RAND_419[2:0];
  _RAND_420 = {1{`RANDOM}};
  uops_3_ctrl_imm_sel = _RAND_420[2:0];
  _RAND_421 = {1{`RANDOM}};
  uops_3_ctrl_op_fcn = _RAND_421[3:0];
  _RAND_422 = {1{`RANDOM}};
  uops_3_ctrl_fcn_dw = _RAND_422[0:0];
  _RAND_423 = {1{`RANDOM}};
  uops_3_ctrl_csr_cmd = _RAND_423[2:0];
  _RAND_424 = {1{`RANDOM}};
  uops_3_ctrl_is_load = _RAND_424[0:0];
  _RAND_425 = {1{`RANDOM}};
  uops_3_ctrl_is_sta = _RAND_425[0:0];
  _RAND_426 = {1{`RANDOM}};
  uops_3_ctrl_is_std = _RAND_426[0:0];
  _RAND_427 = {1{`RANDOM}};
  uops_3_iw_state = _RAND_427[1:0];
  _RAND_428 = {1{`RANDOM}};
  uops_3_iw_p1_poisoned = _RAND_428[0:0];
  _RAND_429 = {1{`RANDOM}};
  uops_3_iw_p2_poisoned = _RAND_429[0:0];
  _RAND_430 = {1{`RANDOM}};
  uops_3_is_br = _RAND_430[0:0];
  _RAND_431 = {1{`RANDOM}};
  uops_3_is_jalr = _RAND_431[0:0];
  _RAND_432 = {1{`RANDOM}};
  uops_3_is_jal = _RAND_432[0:0];
  _RAND_433 = {1{`RANDOM}};
  uops_3_is_sfb = _RAND_433[0:0];
  _RAND_434 = {1{`RANDOM}};
  uops_3_br_mask = _RAND_434[11:0];
  _RAND_435 = {1{`RANDOM}};
  uops_3_br_tag = _RAND_435[3:0];
  _RAND_436 = {1{`RANDOM}};
  uops_3_ftq_idx = _RAND_436[4:0];
  _RAND_437 = {1{`RANDOM}};
  uops_3_edge_inst = _RAND_437[0:0];
  _RAND_438 = {1{`RANDOM}};
  uops_3_pc_lob = _RAND_438[5:0];
  _RAND_439 = {1{`RANDOM}};
  uops_3_taken = _RAND_439[0:0];
  _RAND_440 = {1{`RANDOM}};
  uops_3_imm_packed = _RAND_440[19:0];
  _RAND_441 = {1{`RANDOM}};
  uops_3_csr_addr = _RAND_441[11:0];
  _RAND_442 = {1{`RANDOM}};
  uops_3_rob_idx = _RAND_442[5:0];
  _RAND_443 = {1{`RANDOM}};
  uops_3_ldq_idx = _RAND_443[3:0];
  _RAND_444 = {1{`RANDOM}};
  uops_3_stq_idx = _RAND_444[3:0];
  _RAND_445 = {1{`RANDOM}};
  uops_3_rxq_idx = _RAND_445[1:0];
  _RAND_446 = {1{`RANDOM}};
  uops_3_pdst = _RAND_446[5:0];
  _RAND_447 = {1{`RANDOM}};
  uops_3_prs1 = _RAND_447[5:0];
  _RAND_448 = {1{`RANDOM}};
  uops_3_prs2 = _RAND_448[5:0];
  _RAND_449 = {1{`RANDOM}};
  uops_3_prs3 = _RAND_449[5:0];
  _RAND_450 = {1{`RANDOM}};
  uops_3_ppred = _RAND_450[4:0];
  _RAND_451 = {1{`RANDOM}};
  uops_3_prs1_busy = _RAND_451[0:0];
  _RAND_452 = {1{`RANDOM}};
  uops_3_prs2_busy = _RAND_452[0:0];
  _RAND_453 = {1{`RANDOM}};
  uops_3_prs3_busy = _RAND_453[0:0];
  _RAND_454 = {1{`RANDOM}};
  uops_3_ppred_busy = _RAND_454[0:0];
  _RAND_455 = {1{`RANDOM}};
  uops_3_stale_pdst = _RAND_455[5:0];
  _RAND_456 = {1{`RANDOM}};
  uops_3_exception = _RAND_456[0:0];
  _RAND_457 = {2{`RANDOM}};
  uops_3_exc_cause = _RAND_457[63:0];
  _RAND_458 = {1{`RANDOM}};
  uops_3_bypassable = _RAND_458[0:0];
  _RAND_459 = {1{`RANDOM}};
  uops_3_mem_cmd = _RAND_459[4:0];
  _RAND_460 = {1{`RANDOM}};
  uops_3_mem_size = _RAND_460[1:0];
  _RAND_461 = {1{`RANDOM}};
  uops_3_mem_signed = _RAND_461[0:0];
  _RAND_462 = {1{`RANDOM}};
  uops_3_is_fence = _RAND_462[0:0];
  _RAND_463 = {1{`RANDOM}};
  uops_3_is_fencei = _RAND_463[0:0];
  _RAND_464 = {1{`RANDOM}};
  uops_3_is_amo = _RAND_464[0:0];
  _RAND_465 = {1{`RANDOM}};
  uops_3_uses_ldq = _RAND_465[0:0];
  _RAND_466 = {1{`RANDOM}};
  uops_3_uses_stq = _RAND_466[0:0];
  _RAND_467 = {1{`RANDOM}};
  uops_3_is_sys_pc2epc = _RAND_467[0:0];
  _RAND_468 = {1{`RANDOM}};
  uops_3_is_unique = _RAND_468[0:0];
  _RAND_469 = {1{`RANDOM}};
  uops_3_flush_on_commit = _RAND_469[0:0];
  _RAND_470 = {1{`RANDOM}};
  uops_3_ldst_is_rs1 = _RAND_470[0:0];
  _RAND_471 = {1{`RANDOM}};
  uops_3_ldst = _RAND_471[5:0];
  _RAND_472 = {1{`RANDOM}};
  uops_3_lrs1 = _RAND_472[5:0];
  _RAND_473 = {1{`RANDOM}};
  uops_3_lrs2 = _RAND_473[5:0];
  _RAND_474 = {1{`RANDOM}};
  uops_3_lrs3 = _RAND_474[5:0];
  _RAND_475 = {1{`RANDOM}};
  uops_3_ldst_val = _RAND_475[0:0];
  _RAND_476 = {1{`RANDOM}};
  uops_3_dst_rtype = _RAND_476[1:0];
  _RAND_477 = {1{`RANDOM}};
  uops_3_lrs1_rtype = _RAND_477[1:0];
  _RAND_478 = {1{`RANDOM}};
  uops_3_lrs2_rtype = _RAND_478[1:0];
  _RAND_479 = {1{`RANDOM}};
  uops_3_frs3_en = _RAND_479[0:0];
  _RAND_480 = {1{`RANDOM}};
  uops_3_fp_val = _RAND_480[0:0];
  _RAND_481 = {1{`RANDOM}};
  uops_3_fp_single = _RAND_481[0:0];
  _RAND_482 = {1{`RANDOM}};
  uops_3_xcpt_pf_if = _RAND_482[0:0];
  _RAND_483 = {1{`RANDOM}};
  uops_3_xcpt_ae_if = _RAND_483[0:0];
  _RAND_484 = {1{`RANDOM}};
  uops_3_xcpt_ma_if = _RAND_484[0:0];
  _RAND_485 = {1{`RANDOM}};
  uops_3_bp_debug_if = _RAND_485[0:0];
  _RAND_486 = {1{`RANDOM}};
  uops_3_bp_xcpt_if = _RAND_486[0:0];
  _RAND_487 = {1{`RANDOM}};
  uops_3_debug_fsrc = _RAND_487[1:0];
  _RAND_488 = {1{`RANDOM}};
  uops_3_debug_tsrc = _RAND_488[1:0];
  _RAND_489 = {1{`RANDOM}};
  uops_4_uopc = _RAND_489[6:0];
  _RAND_490 = {1{`RANDOM}};
  uops_4_inst = _RAND_490[31:0];
  _RAND_491 = {1{`RANDOM}};
  uops_4_debug_inst = _RAND_491[31:0];
  _RAND_492 = {1{`RANDOM}};
  uops_4_is_rvc = _RAND_492[0:0];
  _RAND_493 = {2{`RANDOM}};
  uops_4_debug_pc = _RAND_493[39:0];
  _RAND_494 = {1{`RANDOM}};
  uops_4_iq_type = _RAND_494[2:0];
  _RAND_495 = {1{`RANDOM}};
  uops_4_fu_code = _RAND_495[9:0];
  _RAND_496 = {1{`RANDOM}};
  uops_4_ctrl_br_type = _RAND_496[3:0];
  _RAND_497 = {1{`RANDOM}};
  uops_4_ctrl_op1_sel = _RAND_497[1:0];
  _RAND_498 = {1{`RANDOM}};
  uops_4_ctrl_op2_sel = _RAND_498[2:0];
  _RAND_499 = {1{`RANDOM}};
  uops_4_ctrl_imm_sel = _RAND_499[2:0];
  _RAND_500 = {1{`RANDOM}};
  uops_4_ctrl_op_fcn = _RAND_500[3:0];
  _RAND_501 = {1{`RANDOM}};
  uops_4_ctrl_fcn_dw = _RAND_501[0:0];
  _RAND_502 = {1{`RANDOM}};
  uops_4_ctrl_csr_cmd = _RAND_502[2:0];
  _RAND_503 = {1{`RANDOM}};
  uops_4_ctrl_is_load = _RAND_503[0:0];
  _RAND_504 = {1{`RANDOM}};
  uops_4_ctrl_is_sta = _RAND_504[0:0];
  _RAND_505 = {1{`RANDOM}};
  uops_4_ctrl_is_std = _RAND_505[0:0];
  _RAND_506 = {1{`RANDOM}};
  uops_4_iw_state = _RAND_506[1:0];
  _RAND_507 = {1{`RANDOM}};
  uops_4_iw_p1_poisoned = _RAND_507[0:0];
  _RAND_508 = {1{`RANDOM}};
  uops_4_iw_p2_poisoned = _RAND_508[0:0];
  _RAND_509 = {1{`RANDOM}};
  uops_4_is_br = _RAND_509[0:0];
  _RAND_510 = {1{`RANDOM}};
  uops_4_is_jalr = _RAND_510[0:0];
  _RAND_511 = {1{`RANDOM}};
  uops_4_is_jal = _RAND_511[0:0];
  _RAND_512 = {1{`RANDOM}};
  uops_4_is_sfb = _RAND_512[0:0];
  _RAND_513 = {1{`RANDOM}};
  uops_4_br_mask = _RAND_513[11:0];
  _RAND_514 = {1{`RANDOM}};
  uops_4_br_tag = _RAND_514[3:0];
  _RAND_515 = {1{`RANDOM}};
  uops_4_ftq_idx = _RAND_515[4:0];
  _RAND_516 = {1{`RANDOM}};
  uops_4_edge_inst = _RAND_516[0:0];
  _RAND_517 = {1{`RANDOM}};
  uops_4_pc_lob = _RAND_517[5:0];
  _RAND_518 = {1{`RANDOM}};
  uops_4_taken = _RAND_518[0:0];
  _RAND_519 = {1{`RANDOM}};
  uops_4_imm_packed = _RAND_519[19:0];
  _RAND_520 = {1{`RANDOM}};
  uops_4_csr_addr = _RAND_520[11:0];
  _RAND_521 = {1{`RANDOM}};
  uops_4_rob_idx = _RAND_521[5:0];
  _RAND_522 = {1{`RANDOM}};
  uops_4_ldq_idx = _RAND_522[3:0];
  _RAND_523 = {1{`RANDOM}};
  uops_4_stq_idx = _RAND_523[3:0];
  _RAND_524 = {1{`RANDOM}};
  uops_4_rxq_idx = _RAND_524[1:0];
  _RAND_525 = {1{`RANDOM}};
  uops_4_pdst = _RAND_525[5:0];
  _RAND_526 = {1{`RANDOM}};
  uops_4_prs1 = _RAND_526[5:0];
  _RAND_527 = {1{`RANDOM}};
  uops_4_prs2 = _RAND_527[5:0];
  _RAND_528 = {1{`RANDOM}};
  uops_4_prs3 = _RAND_528[5:0];
  _RAND_529 = {1{`RANDOM}};
  uops_4_ppred = _RAND_529[4:0];
  _RAND_530 = {1{`RANDOM}};
  uops_4_prs1_busy = _RAND_530[0:0];
  _RAND_531 = {1{`RANDOM}};
  uops_4_prs2_busy = _RAND_531[0:0];
  _RAND_532 = {1{`RANDOM}};
  uops_4_prs3_busy = _RAND_532[0:0];
  _RAND_533 = {1{`RANDOM}};
  uops_4_ppred_busy = _RAND_533[0:0];
  _RAND_534 = {1{`RANDOM}};
  uops_4_stale_pdst = _RAND_534[5:0];
  _RAND_535 = {1{`RANDOM}};
  uops_4_exception = _RAND_535[0:0];
  _RAND_536 = {2{`RANDOM}};
  uops_4_exc_cause = _RAND_536[63:0];
  _RAND_537 = {1{`RANDOM}};
  uops_4_bypassable = _RAND_537[0:0];
  _RAND_538 = {1{`RANDOM}};
  uops_4_mem_cmd = _RAND_538[4:0];
  _RAND_539 = {1{`RANDOM}};
  uops_4_mem_size = _RAND_539[1:0];
  _RAND_540 = {1{`RANDOM}};
  uops_4_mem_signed = _RAND_540[0:0];
  _RAND_541 = {1{`RANDOM}};
  uops_4_is_fence = _RAND_541[0:0];
  _RAND_542 = {1{`RANDOM}};
  uops_4_is_fencei = _RAND_542[0:0];
  _RAND_543 = {1{`RANDOM}};
  uops_4_is_amo = _RAND_543[0:0];
  _RAND_544 = {1{`RANDOM}};
  uops_4_uses_ldq = _RAND_544[0:0];
  _RAND_545 = {1{`RANDOM}};
  uops_4_uses_stq = _RAND_545[0:0];
  _RAND_546 = {1{`RANDOM}};
  uops_4_is_sys_pc2epc = _RAND_546[0:0];
  _RAND_547 = {1{`RANDOM}};
  uops_4_is_unique = _RAND_547[0:0];
  _RAND_548 = {1{`RANDOM}};
  uops_4_flush_on_commit = _RAND_548[0:0];
  _RAND_549 = {1{`RANDOM}};
  uops_4_ldst_is_rs1 = _RAND_549[0:0];
  _RAND_550 = {1{`RANDOM}};
  uops_4_ldst = _RAND_550[5:0];
  _RAND_551 = {1{`RANDOM}};
  uops_4_lrs1 = _RAND_551[5:0];
  _RAND_552 = {1{`RANDOM}};
  uops_4_lrs2 = _RAND_552[5:0];
  _RAND_553 = {1{`RANDOM}};
  uops_4_lrs3 = _RAND_553[5:0];
  _RAND_554 = {1{`RANDOM}};
  uops_4_ldst_val = _RAND_554[0:0];
  _RAND_555 = {1{`RANDOM}};
  uops_4_dst_rtype = _RAND_555[1:0];
  _RAND_556 = {1{`RANDOM}};
  uops_4_lrs1_rtype = _RAND_556[1:0];
  _RAND_557 = {1{`RANDOM}};
  uops_4_lrs2_rtype = _RAND_557[1:0];
  _RAND_558 = {1{`RANDOM}};
  uops_4_frs3_en = _RAND_558[0:0];
  _RAND_559 = {1{`RANDOM}};
  uops_4_fp_val = _RAND_559[0:0];
  _RAND_560 = {1{`RANDOM}};
  uops_4_fp_single = _RAND_560[0:0];
  _RAND_561 = {1{`RANDOM}};
  uops_4_xcpt_pf_if = _RAND_561[0:0];
  _RAND_562 = {1{`RANDOM}};
  uops_4_xcpt_ae_if = _RAND_562[0:0];
  _RAND_563 = {1{`RANDOM}};
  uops_4_xcpt_ma_if = _RAND_563[0:0];
  _RAND_564 = {1{`RANDOM}};
  uops_4_bp_debug_if = _RAND_564[0:0];
  _RAND_565 = {1{`RANDOM}};
  uops_4_bp_xcpt_if = _RAND_565[0:0];
  _RAND_566 = {1{`RANDOM}};
  uops_4_debug_fsrc = _RAND_566[1:0];
  _RAND_567 = {1{`RANDOM}};
  uops_4_debug_tsrc = _RAND_567[1:0];
  _RAND_568 = {1{`RANDOM}};
  uops_5_uopc = _RAND_568[6:0];
  _RAND_569 = {1{`RANDOM}};
  uops_5_inst = _RAND_569[31:0];
  _RAND_570 = {1{`RANDOM}};
  uops_5_debug_inst = _RAND_570[31:0];
  _RAND_571 = {1{`RANDOM}};
  uops_5_is_rvc = _RAND_571[0:0];
  _RAND_572 = {2{`RANDOM}};
  uops_5_debug_pc = _RAND_572[39:0];
  _RAND_573 = {1{`RANDOM}};
  uops_5_iq_type = _RAND_573[2:0];
  _RAND_574 = {1{`RANDOM}};
  uops_5_fu_code = _RAND_574[9:0];
  _RAND_575 = {1{`RANDOM}};
  uops_5_ctrl_br_type = _RAND_575[3:0];
  _RAND_576 = {1{`RANDOM}};
  uops_5_ctrl_op1_sel = _RAND_576[1:0];
  _RAND_577 = {1{`RANDOM}};
  uops_5_ctrl_op2_sel = _RAND_577[2:0];
  _RAND_578 = {1{`RANDOM}};
  uops_5_ctrl_imm_sel = _RAND_578[2:0];
  _RAND_579 = {1{`RANDOM}};
  uops_5_ctrl_op_fcn = _RAND_579[3:0];
  _RAND_580 = {1{`RANDOM}};
  uops_5_ctrl_fcn_dw = _RAND_580[0:0];
  _RAND_581 = {1{`RANDOM}};
  uops_5_ctrl_csr_cmd = _RAND_581[2:0];
  _RAND_582 = {1{`RANDOM}};
  uops_5_ctrl_is_load = _RAND_582[0:0];
  _RAND_583 = {1{`RANDOM}};
  uops_5_ctrl_is_sta = _RAND_583[0:0];
  _RAND_584 = {1{`RANDOM}};
  uops_5_ctrl_is_std = _RAND_584[0:0];
  _RAND_585 = {1{`RANDOM}};
  uops_5_iw_state = _RAND_585[1:0];
  _RAND_586 = {1{`RANDOM}};
  uops_5_iw_p1_poisoned = _RAND_586[0:0];
  _RAND_587 = {1{`RANDOM}};
  uops_5_iw_p2_poisoned = _RAND_587[0:0];
  _RAND_588 = {1{`RANDOM}};
  uops_5_is_br = _RAND_588[0:0];
  _RAND_589 = {1{`RANDOM}};
  uops_5_is_jalr = _RAND_589[0:0];
  _RAND_590 = {1{`RANDOM}};
  uops_5_is_jal = _RAND_590[0:0];
  _RAND_591 = {1{`RANDOM}};
  uops_5_is_sfb = _RAND_591[0:0];
  _RAND_592 = {1{`RANDOM}};
  uops_5_br_mask = _RAND_592[11:0];
  _RAND_593 = {1{`RANDOM}};
  uops_5_br_tag = _RAND_593[3:0];
  _RAND_594 = {1{`RANDOM}};
  uops_5_ftq_idx = _RAND_594[4:0];
  _RAND_595 = {1{`RANDOM}};
  uops_5_edge_inst = _RAND_595[0:0];
  _RAND_596 = {1{`RANDOM}};
  uops_5_pc_lob = _RAND_596[5:0];
  _RAND_597 = {1{`RANDOM}};
  uops_5_taken = _RAND_597[0:0];
  _RAND_598 = {1{`RANDOM}};
  uops_5_imm_packed = _RAND_598[19:0];
  _RAND_599 = {1{`RANDOM}};
  uops_5_csr_addr = _RAND_599[11:0];
  _RAND_600 = {1{`RANDOM}};
  uops_5_rob_idx = _RAND_600[5:0];
  _RAND_601 = {1{`RANDOM}};
  uops_5_ldq_idx = _RAND_601[3:0];
  _RAND_602 = {1{`RANDOM}};
  uops_5_stq_idx = _RAND_602[3:0];
  _RAND_603 = {1{`RANDOM}};
  uops_5_rxq_idx = _RAND_603[1:0];
  _RAND_604 = {1{`RANDOM}};
  uops_5_pdst = _RAND_604[5:0];
  _RAND_605 = {1{`RANDOM}};
  uops_5_prs1 = _RAND_605[5:0];
  _RAND_606 = {1{`RANDOM}};
  uops_5_prs2 = _RAND_606[5:0];
  _RAND_607 = {1{`RANDOM}};
  uops_5_prs3 = _RAND_607[5:0];
  _RAND_608 = {1{`RANDOM}};
  uops_5_ppred = _RAND_608[4:0];
  _RAND_609 = {1{`RANDOM}};
  uops_5_prs1_busy = _RAND_609[0:0];
  _RAND_610 = {1{`RANDOM}};
  uops_5_prs2_busy = _RAND_610[0:0];
  _RAND_611 = {1{`RANDOM}};
  uops_5_prs3_busy = _RAND_611[0:0];
  _RAND_612 = {1{`RANDOM}};
  uops_5_ppred_busy = _RAND_612[0:0];
  _RAND_613 = {1{`RANDOM}};
  uops_5_stale_pdst = _RAND_613[5:0];
  _RAND_614 = {1{`RANDOM}};
  uops_5_exception = _RAND_614[0:0];
  _RAND_615 = {2{`RANDOM}};
  uops_5_exc_cause = _RAND_615[63:0];
  _RAND_616 = {1{`RANDOM}};
  uops_5_bypassable = _RAND_616[0:0];
  _RAND_617 = {1{`RANDOM}};
  uops_5_mem_cmd = _RAND_617[4:0];
  _RAND_618 = {1{`RANDOM}};
  uops_5_mem_size = _RAND_618[1:0];
  _RAND_619 = {1{`RANDOM}};
  uops_5_mem_signed = _RAND_619[0:0];
  _RAND_620 = {1{`RANDOM}};
  uops_5_is_fence = _RAND_620[0:0];
  _RAND_621 = {1{`RANDOM}};
  uops_5_is_fencei = _RAND_621[0:0];
  _RAND_622 = {1{`RANDOM}};
  uops_5_is_amo = _RAND_622[0:0];
  _RAND_623 = {1{`RANDOM}};
  uops_5_uses_ldq = _RAND_623[0:0];
  _RAND_624 = {1{`RANDOM}};
  uops_5_uses_stq = _RAND_624[0:0];
  _RAND_625 = {1{`RANDOM}};
  uops_5_is_sys_pc2epc = _RAND_625[0:0];
  _RAND_626 = {1{`RANDOM}};
  uops_5_is_unique = _RAND_626[0:0];
  _RAND_627 = {1{`RANDOM}};
  uops_5_flush_on_commit = _RAND_627[0:0];
  _RAND_628 = {1{`RANDOM}};
  uops_5_ldst_is_rs1 = _RAND_628[0:0];
  _RAND_629 = {1{`RANDOM}};
  uops_5_ldst = _RAND_629[5:0];
  _RAND_630 = {1{`RANDOM}};
  uops_5_lrs1 = _RAND_630[5:0];
  _RAND_631 = {1{`RANDOM}};
  uops_5_lrs2 = _RAND_631[5:0];
  _RAND_632 = {1{`RANDOM}};
  uops_5_lrs3 = _RAND_632[5:0];
  _RAND_633 = {1{`RANDOM}};
  uops_5_ldst_val = _RAND_633[0:0];
  _RAND_634 = {1{`RANDOM}};
  uops_5_dst_rtype = _RAND_634[1:0];
  _RAND_635 = {1{`RANDOM}};
  uops_5_lrs1_rtype = _RAND_635[1:0];
  _RAND_636 = {1{`RANDOM}};
  uops_5_lrs2_rtype = _RAND_636[1:0];
  _RAND_637 = {1{`RANDOM}};
  uops_5_frs3_en = _RAND_637[0:0];
  _RAND_638 = {1{`RANDOM}};
  uops_5_fp_val = _RAND_638[0:0];
  _RAND_639 = {1{`RANDOM}};
  uops_5_fp_single = _RAND_639[0:0];
  _RAND_640 = {1{`RANDOM}};
  uops_5_xcpt_pf_if = _RAND_640[0:0];
  _RAND_641 = {1{`RANDOM}};
  uops_5_xcpt_ae_if = _RAND_641[0:0];
  _RAND_642 = {1{`RANDOM}};
  uops_5_xcpt_ma_if = _RAND_642[0:0];
  _RAND_643 = {1{`RANDOM}};
  uops_5_bp_debug_if = _RAND_643[0:0];
  _RAND_644 = {1{`RANDOM}};
  uops_5_bp_xcpt_if = _RAND_644[0:0];
  _RAND_645 = {1{`RANDOM}};
  uops_5_debug_fsrc = _RAND_645[1:0];
  _RAND_646 = {1{`RANDOM}};
  uops_5_debug_tsrc = _RAND_646[1:0];
  _RAND_647 = {1{`RANDOM}};
  uops_6_uopc = _RAND_647[6:0];
  _RAND_648 = {1{`RANDOM}};
  uops_6_inst = _RAND_648[31:0];
  _RAND_649 = {1{`RANDOM}};
  uops_6_debug_inst = _RAND_649[31:0];
  _RAND_650 = {1{`RANDOM}};
  uops_6_is_rvc = _RAND_650[0:0];
  _RAND_651 = {2{`RANDOM}};
  uops_6_debug_pc = _RAND_651[39:0];
  _RAND_652 = {1{`RANDOM}};
  uops_6_iq_type = _RAND_652[2:0];
  _RAND_653 = {1{`RANDOM}};
  uops_6_fu_code = _RAND_653[9:0];
  _RAND_654 = {1{`RANDOM}};
  uops_6_ctrl_br_type = _RAND_654[3:0];
  _RAND_655 = {1{`RANDOM}};
  uops_6_ctrl_op1_sel = _RAND_655[1:0];
  _RAND_656 = {1{`RANDOM}};
  uops_6_ctrl_op2_sel = _RAND_656[2:0];
  _RAND_657 = {1{`RANDOM}};
  uops_6_ctrl_imm_sel = _RAND_657[2:0];
  _RAND_658 = {1{`RANDOM}};
  uops_6_ctrl_op_fcn = _RAND_658[3:0];
  _RAND_659 = {1{`RANDOM}};
  uops_6_ctrl_fcn_dw = _RAND_659[0:0];
  _RAND_660 = {1{`RANDOM}};
  uops_6_ctrl_csr_cmd = _RAND_660[2:0];
  _RAND_661 = {1{`RANDOM}};
  uops_6_ctrl_is_load = _RAND_661[0:0];
  _RAND_662 = {1{`RANDOM}};
  uops_6_ctrl_is_sta = _RAND_662[0:0];
  _RAND_663 = {1{`RANDOM}};
  uops_6_ctrl_is_std = _RAND_663[0:0];
  _RAND_664 = {1{`RANDOM}};
  uops_6_iw_state = _RAND_664[1:0];
  _RAND_665 = {1{`RANDOM}};
  uops_6_iw_p1_poisoned = _RAND_665[0:0];
  _RAND_666 = {1{`RANDOM}};
  uops_6_iw_p2_poisoned = _RAND_666[0:0];
  _RAND_667 = {1{`RANDOM}};
  uops_6_is_br = _RAND_667[0:0];
  _RAND_668 = {1{`RANDOM}};
  uops_6_is_jalr = _RAND_668[0:0];
  _RAND_669 = {1{`RANDOM}};
  uops_6_is_jal = _RAND_669[0:0];
  _RAND_670 = {1{`RANDOM}};
  uops_6_is_sfb = _RAND_670[0:0];
  _RAND_671 = {1{`RANDOM}};
  uops_6_br_mask = _RAND_671[11:0];
  _RAND_672 = {1{`RANDOM}};
  uops_6_br_tag = _RAND_672[3:0];
  _RAND_673 = {1{`RANDOM}};
  uops_6_ftq_idx = _RAND_673[4:0];
  _RAND_674 = {1{`RANDOM}};
  uops_6_edge_inst = _RAND_674[0:0];
  _RAND_675 = {1{`RANDOM}};
  uops_6_pc_lob = _RAND_675[5:0];
  _RAND_676 = {1{`RANDOM}};
  uops_6_taken = _RAND_676[0:0];
  _RAND_677 = {1{`RANDOM}};
  uops_6_imm_packed = _RAND_677[19:0];
  _RAND_678 = {1{`RANDOM}};
  uops_6_csr_addr = _RAND_678[11:0];
  _RAND_679 = {1{`RANDOM}};
  uops_6_rob_idx = _RAND_679[5:0];
  _RAND_680 = {1{`RANDOM}};
  uops_6_ldq_idx = _RAND_680[3:0];
  _RAND_681 = {1{`RANDOM}};
  uops_6_stq_idx = _RAND_681[3:0];
  _RAND_682 = {1{`RANDOM}};
  uops_6_rxq_idx = _RAND_682[1:0];
  _RAND_683 = {1{`RANDOM}};
  uops_6_pdst = _RAND_683[5:0];
  _RAND_684 = {1{`RANDOM}};
  uops_6_prs1 = _RAND_684[5:0];
  _RAND_685 = {1{`RANDOM}};
  uops_6_prs2 = _RAND_685[5:0];
  _RAND_686 = {1{`RANDOM}};
  uops_6_prs3 = _RAND_686[5:0];
  _RAND_687 = {1{`RANDOM}};
  uops_6_ppred = _RAND_687[4:0];
  _RAND_688 = {1{`RANDOM}};
  uops_6_prs1_busy = _RAND_688[0:0];
  _RAND_689 = {1{`RANDOM}};
  uops_6_prs2_busy = _RAND_689[0:0];
  _RAND_690 = {1{`RANDOM}};
  uops_6_prs3_busy = _RAND_690[0:0];
  _RAND_691 = {1{`RANDOM}};
  uops_6_ppred_busy = _RAND_691[0:0];
  _RAND_692 = {1{`RANDOM}};
  uops_6_stale_pdst = _RAND_692[5:0];
  _RAND_693 = {1{`RANDOM}};
  uops_6_exception = _RAND_693[0:0];
  _RAND_694 = {2{`RANDOM}};
  uops_6_exc_cause = _RAND_694[63:0];
  _RAND_695 = {1{`RANDOM}};
  uops_6_bypassable = _RAND_695[0:0];
  _RAND_696 = {1{`RANDOM}};
  uops_6_mem_cmd = _RAND_696[4:0];
  _RAND_697 = {1{`RANDOM}};
  uops_6_mem_size = _RAND_697[1:0];
  _RAND_698 = {1{`RANDOM}};
  uops_6_mem_signed = _RAND_698[0:0];
  _RAND_699 = {1{`RANDOM}};
  uops_6_is_fence = _RAND_699[0:0];
  _RAND_700 = {1{`RANDOM}};
  uops_6_is_fencei = _RAND_700[0:0];
  _RAND_701 = {1{`RANDOM}};
  uops_6_is_amo = _RAND_701[0:0];
  _RAND_702 = {1{`RANDOM}};
  uops_6_uses_ldq = _RAND_702[0:0];
  _RAND_703 = {1{`RANDOM}};
  uops_6_uses_stq = _RAND_703[0:0];
  _RAND_704 = {1{`RANDOM}};
  uops_6_is_sys_pc2epc = _RAND_704[0:0];
  _RAND_705 = {1{`RANDOM}};
  uops_6_is_unique = _RAND_705[0:0];
  _RAND_706 = {1{`RANDOM}};
  uops_6_flush_on_commit = _RAND_706[0:0];
  _RAND_707 = {1{`RANDOM}};
  uops_6_ldst_is_rs1 = _RAND_707[0:0];
  _RAND_708 = {1{`RANDOM}};
  uops_6_ldst = _RAND_708[5:0];
  _RAND_709 = {1{`RANDOM}};
  uops_6_lrs1 = _RAND_709[5:0];
  _RAND_710 = {1{`RANDOM}};
  uops_6_lrs2 = _RAND_710[5:0];
  _RAND_711 = {1{`RANDOM}};
  uops_6_lrs3 = _RAND_711[5:0];
  _RAND_712 = {1{`RANDOM}};
  uops_6_ldst_val = _RAND_712[0:0];
  _RAND_713 = {1{`RANDOM}};
  uops_6_dst_rtype = _RAND_713[1:0];
  _RAND_714 = {1{`RANDOM}};
  uops_6_lrs1_rtype = _RAND_714[1:0];
  _RAND_715 = {1{`RANDOM}};
  uops_6_lrs2_rtype = _RAND_715[1:0];
  _RAND_716 = {1{`RANDOM}};
  uops_6_frs3_en = _RAND_716[0:0];
  _RAND_717 = {1{`RANDOM}};
  uops_6_fp_val = _RAND_717[0:0];
  _RAND_718 = {1{`RANDOM}};
  uops_6_fp_single = _RAND_718[0:0];
  _RAND_719 = {1{`RANDOM}};
  uops_6_xcpt_pf_if = _RAND_719[0:0];
  _RAND_720 = {1{`RANDOM}};
  uops_6_xcpt_ae_if = _RAND_720[0:0];
  _RAND_721 = {1{`RANDOM}};
  uops_6_xcpt_ma_if = _RAND_721[0:0];
  _RAND_722 = {1{`RANDOM}};
  uops_6_bp_debug_if = _RAND_722[0:0];
  _RAND_723 = {1{`RANDOM}};
  uops_6_bp_xcpt_if = _RAND_723[0:0];
  _RAND_724 = {1{`RANDOM}};
  uops_6_debug_fsrc = _RAND_724[1:0];
  _RAND_725 = {1{`RANDOM}};
  uops_6_debug_tsrc = _RAND_725[1:0];
  _RAND_726 = {1{`RANDOM}};
  value = _RAND_726[2:0];
  _RAND_727 = {1{`RANDOM}};
  value_1 = _RAND_727[2:0];
  _RAND_728 = {1{`RANDOM}};
  maybe_full = _RAND_728[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
