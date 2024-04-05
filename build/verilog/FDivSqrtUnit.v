module FDivSqrtUnit(
  input         clock,
  input         reset,
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
  input         io_resp_ready,
  output        io_resp_valid,
  output [6:0]  io_resp_bits_uop_uopc,
  output [31:0] io_resp_bits_uop_inst,
  output [31:0] io_resp_bits_uop_debug_inst,
  output        io_resp_bits_uop_is_rvc,
  output [39:0] io_resp_bits_uop_debug_pc,
  output [2:0]  io_resp_bits_uop_iq_type,
  output [9:0]  io_resp_bits_uop_fu_code,
  output [3:0]  io_resp_bits_uop_ctrl_br_type,
  output [1:0]  io_resp_bits_uop_ctrl_op1_sel,
  output [2:0]  io_resp_bits_uop_ctrl_op2_sel,
  output [2:0]  io_resp_bits_uop_ctrl_imm_sel,
  output [3:0]  io_resp_bits_uop_ctrl_op_fcn,
  output        io_resp_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_resp_bits_uop_ctrl_csr_cmd,
  output        io_resp_bits_uop_ctrl_is_load,
  output        io_resp_bits_uop_ctrl_is_sta,
  output        io_resp_bits_uop_ctrl_is_std,
  output [1:0]  io_resp_bits_uop_iw_state,
  output        io_resp_bits_uop_iw_p1_poisoned,
  output        io_resp_bits_uop_iw_p2_poisoned,
  output        io_resp_bits_uop_is_br,
  output        io_resp_bits_uop_is_jalr,
  output        io_resp_bits_uop_is_jal,
  output        io_resp_bits_uop_is_sfb,
  output [11:0] io_resp_bits_uop_br_mask,
  output [3:0]  io_resp_bits_uop_br_tag,
  output [4:0]  io_resp_bits_uop_ftq_idx,
  output        io_resp_bits_uop_edge_inst,
  output [5:0]  io_resp_bits_uop_pc_lob,
  output        io_resp_bits_uop_taken,
  output [19:0] io_resp_bits_uop_imm_packed,
  output [11:0] io_resp_bits_uop_csr_addr,
  output [5:0]  io_resp_bits_uop_rob_idx,
  output [3:0]  io_resp_bits_uop_ldq_idx,
  output [3:0]  io_resp_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_uop_rxq_idx,
  output [5:0]  io_resp_bits_uop_pdst,
  output [5:0]  io_resp_bits_uop_prs1,
  output [5:0]  io_resp_bits_uop_prs2,
  output [5:0]  io_resp_bits_uop_prs3,
  output [4:0]  io_resp_bits_uop_ppred,
  output        io_resp_bits_uop_prs1_busy,
  output        io_resp_bits_uop_prs2_busy,
  output        io_resp_bits_uop_prs3_busy,
  output        io_resp_bits_uop_ppred_busy,
  output [5:0]  io_resp_bits_uop_stale_pdst,
  output        io_resp_bits_uop_exception,
  output [63:0] io_resp_bits_uop_exc_cause,
  output        io_resp_bits_uop_bypassable,
  output [4:0]  io_resp_bits_uop_mem_cmd,
  output [1:0]  io_resp_bits_uop_mem_size,
  output        io_resp_bits_uop_mem_signed,
  output        io_resp_bits_uop_is_fence,
  output        io_resp_bits_uop_is_fencei,
  output        io_resp_bits_uop_is_amo,
  output        io_resp_bits_uop_uses_ldq,
  output        io_resp_bits_uop_uses_stq,
  output        io_resp_bits_uop_is_sys_pc2epc,
  output        io_resp_bits_uop_is_unique,
  output        io_resp_bits_uop_flush_on_commit,
  output        io_resp_bits_uop_ldst_is_rs1,
  output [5:0]  io_resp_bits_uop_ldst,
  output [5:0]  io_resp_bits_uop_lrs1,
  output [5:0]  io_resp_bits_uop_lrs2,
  output [5:0]  io_resp_bits_uop_lrs3,
  output        io_resp_bits_uop_ldst_val,
  output [1:0]  io_resp_bits_uop_dst_rtype,
  output [1:0]  io_resp_bits_uop_lrs1_rtype,
  output [1:0]  io_resp_bits_uop_lrs2_rtype,
  output        io_resp_bits_uop_frs3_en,
  output        io_resp_bits_uop_fp_val,
  output        io_resp_bits_uop_fp_single,
  output        io_resp_bits_uop_xcpt_pf_if,
  output        io_resp_bits_uop_xcpt_ae_if,
  output        io_resp_bits_uop_xcpt_ma_if,
  output        io_resp_bits_uop_bp_debug_if,
  output        io_resp_bits_uop_bp_xcpt_if,
  output [1:0]  io_resp_bits_uop_debug_fsrc,
  output [1:0]  io_resp_bits_uop_debug_tsrc,
  output        io_resp_bits_predicated,
  output [64:0] io_resp_bits_data,
  output        io_resp_bits_fflags_valid,
  output [6:0]  io_resp_bits_fflags_bits_uop_uopc,
  output [31:0] io_resp_bits_fflags_bits_uop_inst,
  output [31:0] io_resp_bits_fflags_bits_uop_debug_inst,
  output        io_resp_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_resp_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_resp_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_resp_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_resp_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_resp_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_resp_bits_fflags_bits_uop_ctrl_op2_sel,
  output [2:0]  io_resp_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_resp_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_resp_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_resp_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_resp_bits_fflags_bits_uop_ctrl_is_load,
  output        io_resp_bits_fflags_bits_uop_ctrl_is_sta,
  output        io_resp_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_resp_bits_fflags_bits_uop_iw_state,
  output        io_resp_bits_fflags_bits_uop_iw_p1_poisoned,
  output        io_resp_bits_fflags_bits_uop_iw_p2_poisoned,
  output        io_resp_bits_fflags_bits_uop_is_br,
  output        io_resp_bits_fflags_bits_uop_is_jalr,
  output        io_resp_bits_fflags_bits_uop_is_jal,
  output        io_resp_bits_fflags_bits_uop_is_sfb,
  output [11:0] io_resp_bits_fflags_bits_uop_br_mask,
  output [3:0]  io_resp_bits_fflags_bits_uop_br_tag,
  output [4:0]  io_resp_bits_fflags_bits_uop_ftq_idx,
  output        io_resp_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_resp_bits_fflags_bits_uop_pc_lob,
  output        io_resp_bits_fflags_bits_uop_taken,
  output [19:0] io_resp_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_resp_bits_fflags_bits_uop_csr_addr,
  output [5:0]  io_resp_bits_fflags_bits_uop_rob_idx,
  output [3:0]  io_resp_bits_fflags_bits_uop_ldq_idx,
  output [3:0]  io_resp_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_fflags_bits_uop_rxq_idx,
  output [5:0]  io_resp_bits_fflags_bits_uop_pdst,
  output [5:0]  io_resp_bits_fflags_bits_uop_prs1,
  output [5:0]  io_resp_bits_fflags_bits_uop_prs2,
  output [5:0]  io_resp_bits_fflags_bits_uop_prs3,
  output [4:0]  io_resp_bits_fflags_bits_uop_ppred,
  output        io_resp_bits_fflags_bits_uop_prs1_busy,
  output        io_resp_bits_fflags_bits_uop_prs2_busy,
  output        io_resp_bits_fflags_bits_uop_prs3_busy,
  output        io_resp_bits_fflags_bits_uop_ppred_busy,
  output [5:0]  io_resp_bits_fflags_bits_uop_stale_pdst,
  output        io_resp_bits_fflags_bits_uop_exception,
  output [63:0] io_resp_bits_fflags_bits_uop_exc_cause,
  output        io_resp_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_resp_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_resp_bits_fflags_bits_uop_mem_size,
  output        io_resp_bits_fflags_bits_uop_mem_signed,
  output        io_resp_bits_fflags_bits_uop_is_fence,
  output        io_resp_bits_fflags_bits_uop_is_fencei,
  output        io_resp_bits_fflags_bits_uop_is_amo,
  output        io_resp_bits_fflags_bits_uop_uses_ldq,
  output        io_resp_bits_fflags_bits_uop_uses_stq,
  output        io_resp_bits_fflags_bits_uop_is_sys_pc2epc,
  output        io_resp_bits_fflags_bits_uop_is_unique,
  output        io_resp_bits_fflags_bits_uop_flush_on_commit,
  output        io_resp_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_resp_bits_fflags_bits_uop_ldst,
  output [5:0]  io_resp_bits_fflags_bits_uop_lrs1,
  output [5:0]  io_resp_bits_fflags_bits_uop_lrs2,
  output [5:0]  io_resp_bits_fflags_bits_uop_lrs3,
  output        io_resp_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_resp_bits_fflags_bits_uop_dst_rtype,
  output [1:0]  io_resp_bits_fflags_bits_uop_lrs1_rtype,
  output [1:0]  io_resp_bits_fflags_bits_uop_lrs2_rtype,
  output        io_resp_bits_fflags_bits_uop_frs3_en,
  output        io_resp_bits_fflags_bits_uop_fp_val,
  output        io_resp_bits_fflags_bits_uop_fp_single,
  output        io_resp_bits_fflags_bits_uop_xcpt_pf_if,
  output        io_resp_bits_fflags_bits_uop_xcpt_ae_if,
  output        io_resp_bits_fflags_bits_uop_xcpt_ma_if,
  output        io_resp_bits_fflags_bits_uop_bp_debug_if,
  output        io_resp_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_resp_bits_fflags_bits_uop_debug_fsrc,
  output [1:0]  io_resp_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_resp_bits_fflags_bits_flags,
  output [39:0] io_resp_bits_addr,
  output        io_resp_bits_mxcpt_valid,
  output [16:0] io_resp_bits_mxcpt_bits,
  output        io_resp_bits_sfence_valid,
  output        io_resp_bits_sfence_bits_rs1,
  output        io_resp_bits_sfence_bits_rs2,
  output [38:0] io_resp_bits_sfence_bits_addr,
  output        io_resp_bits_sfence_bits_asid,
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
  input  [2:0]  io_fcsr_rm
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
  reg [95:0] _RAND_84;
  reg [95:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [63:0] _RAND_94;
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
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [63:0] _RAND_137;
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
  reg [63:0] _RAND_217;
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
  reg [31:0] _RAND_247;
  reg [31:0] _RAND_248;
  reg [31:0] _RAND_249;
  reg [95:0] _RAND_250;
`endif // RANDOMIZE_REG_INIT
  wire  fdiv_decoder_clock; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_reset; // @[fdiv.scala 99:28]
  wire [6:0] fdiv_decoder_io_uopc; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_ldst; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_wen; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_ren1; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_ren2; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_ren3; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_swap12; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_swap23; // @[fdiv.scala 99:28]
  wire [1:0] fdiv_decoder_io_sigs_typeTagIn; // @[fdiv.scala 99:28]
  wire [1:0] fdiv_decoder_io_sigs_typeTagOut; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_fromint; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_toint; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_fastpipe; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_fma; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_div; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_sqrt; // @[fdiv.scala 99:28]
  wire  fdiv_decoder_io_sigs_wflags; // @[fdiv.scala 99:28]
  wire [32:0] RecFNToRecFN_io_in; // @[fdiv.scala 110:21]
  wire [2:0] RecFNToRecFN_io_roundingMode; // @[fdiv.scala 110:21]
  wire  RecFNToRecFN_io_detectTininess; // @[fdiv.scala 110:21]
  wire [64:0] RecFNToRecFN_io_out; // @[fdiv.scala 110:21]
  wire [4:0] RecFNToRecFN_io_exceptionFlags; // @[fdiv.scala 110:21]
  wire [32:0] RecFNToRecFN_1_io_in; // @[fdiv.scala 110:21]
  wire [2:0] RecFNToRecFN_1_io_roundingMode; // @[fdiv.scala 110:21]
  wire  RecFNToRecFN_1_io_detectTininess; // @[fdiv.scala 110:21]
  wire [64:0] RecFNToRecFN_1_io_out; // @[fdiv.scala 110:21]
  wire [4:0] RecFNToRecFN_1_io_exceptionFlags; // @[fdiv.scala 110:21]
  wire  divsqrt_clock; // @[fdiv.scala 141:23]
  wire  divsqrt_reset; // @[fdiv.scala 141:23]
  wire  divsqrt_io_inReady_div; // @[fdiv.scala 141:23]
  wire  divsqrt_io_inReady_sqrt; // @[fdiv.scala 141:23]
  wire  divsqrt_io_inValid; // @[fdiv.scala 141:23]
  wire  divsqrt_io_sqrtOp; // @[fdiv.scala 141:23]
  wire [64:0] divsqrt_io_a; // @[fdiv.scala 141:23]
  wire [64:0] divsqrt_io_b; // @[fdiv.scala 141:23]
  wire [2:0] divsqrt_io_roundingMode; // @[fdiv.scala 141:23]
  wire  divsqrt_io_detectTininess; // @[fdiv.scala 141:23]
  wire  divsqrt_io_outValid_div; // @[fdiv.scala 141:23]
  wire  divsqrt_io_outValid_sqrt; // @[fdiv.scala 141:23]
  wire [64:0] divsqrt_io_out; // @[fdiv.scala 141:23]
  wire [4:0] divsqrt_io_exceptionFlags; // @[fdiv.scala 141:23]
  wire [64:0] downvert_d2s_io_in; // @[fdiv.scala 209:28]
  wire [2:0] downvert_d2s_io_roundingMode; // @[fdiv.scala 209:28]
  wire  downvert_d2s_io_detectTininess; // @[fdiv.scala 209:28]
  wire [32:0] downvert_d2s_io_out; // @[fdiv.scala 209:28]
  wire [4:0] downvert_d2s_io_exceptionFlags; // @[fdiv.scala 209:28]
  reg  r_buffer_val; // @[fdiv.scala 95:29]
  reg [6:0] r_buffer_req_uop_uopc; // @[fdiv.scala 96:25]
  reg [31:0] r_buffer_req_uop_inst; // @[fdiv.scala 96:25]
  reg [31:0] r_buffer_req_uop_debug_inst; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_is_rvc; // @[fdiv.scala 96:25]
  reg [39:0] r_buffer_req_uop_debug_pc; // @[fdiv.scala 96:25]
  reg [2:0] r_buffer_req_uop_iq_type; // @[fdiv.scala 96:25]
  reg [9:0] r_buffer_req_uop_fu_code; // @[fdiv.scala 96:25]
  reg [3:0] r_buffer_req_uop_ctrl_br_type; // @[fdiv.scala 96:25]
  reg [1:0] r_buffer_req_uop_ctrl_op1_sel; // @[fdiv.scala 96:25]
  reg [2:0] r_buffer_req_uop_ctrl_op2_sel; // @[fdiv.scala 96:25]
  reg [2:0] r_buffer_req_uop_ctrl_imm_sel; // @[fdiv.scala 96:25]
  reg [3:0] r_buffer_req_uop_ctrl_op_fcn; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_ctrl_fcn_dw; // @[fdiv.scala 96:25]
  reg [2:0] r_buffer_req_uop_ctrl_csr_cmd; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_ctrl_is_load; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_ctrl_is_sta; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_ctrl_is_std; // @[fdiv.scala 96:25]
  reg [1:0] r_buffer_req_uop_iw_state; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_iw_p1_poisoned; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_iw_p2_poisoned; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_is_br; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_is_jalr; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_is_jal; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_is_sfb; // @[fdiv.scala 96:25]
  reg [11:0] r_buffer_req_uop_br_mask; // @[fdiv.scala 96:25]
  reg [3:0] r_buffer_req_uop_br_tag; // @[fdiv.scala 96:25]
  reg [4:0] r_buffer_req_uop_ftq_idx; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_edge_inst; // @[fdiv.scala 96:25]
  reg [5:0] r_buffer_req_uop_pc_lob; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_taken; // @[fdiv.scala 96:25]
  reg [19:0] r_buffer_req_uop_imm_packed; // @[fdiv.scala 96:25]
  reg [11:0] r_buffer_req_uop_csr_addr; // @[fdiv.scala 96:25]
  reg [5:0] r_buffer_req_uop_rob_idx; // @[fdiv.scala 96:25]
  reg [3:0] r_buffer_req_uop_ldq_idx; // @[fdiv.scala 96:25]
  reg [3:0] r_buffer_req_uop_stq_idx; // @[fdiv.scala 96:25]
  reg [1:0] r_buffer_req_uop_rxq_idx; // @[fdiv.scala 96:25]
  reg [5:0] r_buffer_req_uop_pdst; // @[fdiv.scala 96:25]
  reg [5:0] r_buffer_req_uop_prs1; // @[fdiv.scala 96:25]
  reg [5:0] r_buffer_req_uop_prs2; // @[fdiv.scala 96:25]
  reg [5:0] r_buffer_req_uop_prs3; // @[fdiv.scala 96:25]
  reg [4:0] r_buffer_req_uop_ppred; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_prs1_busy; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_prs2_busy; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_prs3_busy; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_ppred_busy; // @[fdiv.scala 96:25]
  reg [5:0] r_buffer_req_uop_stale_pdst; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_exception; // @[fdiv.scala 96:25]
  reg [63:0] r_buffer_req_uop_exc_cause; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_bypassable; // @[fdiv.scala 96:25]
  reg [4:0] r_buffer_req_uop_mem_cmd; // @[fdiv.scala 96:25]
  reg [1:0] r_buffer_req_uop_mem_size; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_mem_signed; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_is_fence; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_is_fencei; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_is_amo; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_uses_ldq; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_uses_stq; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_is_sys_pc2epc; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_is_unique; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_flush_on_commit; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_ldst_is_rs1; // @[fdiv.scala 96:25]
  reg [5:0] r_buffer_req_uop_ldst; // @[fdiv.scala 96:25]
  reg [5:0] r_buffer_req_uop_lrs1; // @[fdiv.scala 96:25]
  reg [5:0] r_buffer_req_uop_lrs2; // @[fdiv.scala 96:25]
  reg [5:0] r_buffer_req_uop_lrs3; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_ldst_val; // @[fdiv.scala 96:25]
  reg [1:0] r_buffer_req_uop_dst_rtype; // @[fdiv.scala 96:25]
  reg [1:0] r_buffer_req_uop_lrs1_rtype; // @[fdiv.scala 96:25]
  reg [1:0] r_buffer_req_uop_lrs2_rtype; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_frs3_en; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_fp_val; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_fp_single; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_xcpt_pf_if; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_xcpt_ae_if; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_xcpt_ma_if; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_bp_debug_if; // @[fdiv.scala 96:25]
  reg  r_buffer_req_uop_bp_xcpt_if; // @[fdiv.scala 96:25]
  reg [1:0] r_buffer_req_uop_debug_fsrc; // @[fdiv.scala 96:25]
  reg [1:0] r_buffer_req_uop_debug_tsrc; // @[fdiv.scala 96:25]
  reg [1:0] r_buffer_fin_typeTagIn; // @[fdiv.scala 97:25]
  reg  r_buffer_fin_div; // @[fdiv.scala 97:25]
  reg  r_buffer_fin_sqrt; // @[fdiv.scala 97:25]
  reg [2:0] r_buffer_fin_rm; // @[fdiv.scala 97:25]
  reg [64:0] r_buffer_fin_in1; // @[fdiv.scala 97:25]
  reg [64:0] r_buffer_fin_in2; // @[fdiv.scala 97:25]
  wire [11:0] _T = io_brupdate_b1_mispredict_mask & r_buffer_req_uop_br_mask; // @[util.scala 118:51]
  wire  _T_1 = _T != 12'h0; // @[util.scala 118:59]
  wire  _T_3 = ~io_req_bits_kill; // @[fdiv.scala 103:71]
  wire [11:0] _T_6 = ~io_brupdate_b1_resolve_mask; // @[util.scala 85:27]
  wire [11:0] _T_7 = r_buffer_req_uop_br_mask & _T_6; // @[util.scala 85:25]
  wire  unswizzled_hi_hi = io_req_bits_rs1_data[31]; // @[FPU.scala 352:14]
  wire  unswizzled_hi_lo = io_req_bits_rs1_data[52]; // @[FPU.scala 353:14]
  wire [30:0] unswizzled_lo = io_req_bits_rs1_data[30:0]; // @[FPU.scala 354:14]
  wire [32:0] floats_0 = {unswizzled_hi_hi,unswizzled_hi_lo,unswizzled_lo}; // @[Cat.scala 30:58]
  wire  isbox = &io_req_bits_rs1_data[64:60]; // @[FPU.scala 327:84]
  wire [32:0] _T_9 = isbox ? 33'h0 : 33'he0400000; // @[FPU.scala 367:31]
  wire  unswizzled_hi_hi_1 = io_req_bits_rs2_data[31]; // @[FPU.scala 352:14]
  wire  unswizzled_hi_lo_1 = io_req_bits_rs2_data[52]; // @[FPU.scala 353:14]
  wire [30:0] unswizzled_lo_1 = io_req_bits_rs2_data[30:0]; // @[FPU.scala 354:14]
  wire [32:0] floats_0_1 = {unswizzled_hi_hi_1,unswizzled_hi_lo_1,unswizzled_lo_1}; // @[Cat.scala 30:58]
  wire  isbox_1 = &io_req_bits_rs2_data[64:60]; // @[FPU.scala 327:84]
  wire [32:0] _T_11 = isbox_1 ? 33'h0 : 33'he0400000; // @[FPU.scala 367:31]
  wire [11:0] _T_13 = io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask; // @[util.scala 118:51]
  wire  _T_14 = _T_13 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_20 = io_req_bits_uop_br_mask & _T_6; // @[util.scala 85:25]
  wire  _GEN_2 = io_req_valid & ~_T_14 & _T_3 | ~_T_1 & ~io_req_bits_kill & r_buffer_val; // @[fdiv.scala 119:95 fdiv.scala 120:18 fdiv.scala 103:16]
  reg  r_divsqrt_val; // @[fdiv.scala 143:30]
  reg  r_divsqrt_killed; // @[fdiv.scala 144:29]
  reg [1:0] r_divsqrt_fin_typeTagIn; // @[fdiv.scala 145:26]
  reg [2:0] r_divsqrt_fin_rm; // @[fdiv.scala 145:26]
  reg [6:0] r_divsqrt_uop_uopc; // @[fdiv.scala 146:26]
  reg [31:0] r_divsqrt_uop_inst; // @[fdiv.scala 146:26]
  reg [31:0] r_divsqrt_uop_debug_inst; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_is_rvc; // @[fdiv.scala 146:26]
  reg [39:0] r_divsqrt_uop_debug_pc; // @[fdiv.scala 146:26]
  reg [2:0] r_divsqrt_uop_iq_type; // @[fdiv.scala 146:26]
  reg [9:0] r_divsqrt_uop_fu_code; // @[fdiv.scala 146:26]
  reg [3:0] r_divsqrt_uop_ctrl_br_type; // @[fdiv.scala 146:26]
  reg [1:0] r_divsqrt_uop_ctrl_op1_sel; // @[fdiv.scala 146:26]
  reg [2:0] r_divsqrt_uop_ctrl_op2_sel; // @[fdiv.scala 146:26]
  reg [2:0] r_divsqrt_uop_ctrl_imm_sel; // @[fdiv.scala 146:26]
  reg [3:0] r_divsqrt_uop_ctrl_op_fcn; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_ctrl_fcn_dw; // @[fdiv.scala 146:26]
  reg [2:0] r_divsqrt_uop_ctrl_csr_cmd; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_ctrl_is_load; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_ctrl_is_sta; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_ctrl_is_std; // @[fdiv.scala 146:26]
  reg [1:0] r_divsqrt_uop_iw_state; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_iw_p1_poisoned; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_iw_p2_poisoned; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_is_br; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_is_jalr; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_is_jal; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_is_sfb; // @[fdiv.scala 146:26]
  reg [11:0] r_divsqrt_uop_br_mask; // @[fdiv.scala 146:26]
  reg [3:0] r_divsqrt_uop_br_tag; // @[fdiv.scala 146:26]
  reg [4:0] r_divsqrt_uop_ftq_idx; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_edge_inst; // @[fdiv.scala 146:26]
  reg [5:0] r_divsqrt_uop_pc_lob; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_taken; // @[fdiv.scala 146:26]
  reg [19:0] r_divsqrt_uop_imm_packed; // @[fdiv.scala 146:26]
  reg [11:0] r_divsqrt_uop_csr_addr; // @[fdiv.scala 146:26]
  reg [5:0] r_divsqrt_uop_rob_idx; // @[fdiv.scala 146:26]
  reg [3:0] r_divsqrt_uop_ldq_idx; // @[fdiv.scala 146:26]
  reg [3:0] r_divsqrt_uop_stq_idx; // @[fdiv.scala 146:26]
  reg [1:0] r_divsqrt_uop_rxq_idx; // @[fdiv.scala 146:26]
  reg [5:0] r_divsqrt_uop_pdst; // @[fdiv.scala 146:26]
  reg [5:0] r_divsqrt_uop_prs1; // @[fdiv.scala 146:26]
  reg [5:0] r_divsqrt_uop_prs2; // @[fdiv.scala 146:26]
  reg [5:0] r_divsqrt_uop_prs3; // @[fdiv.scala 146:26]
  reg [4:0] r_divsqrt_uop_ppred; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_prs1_busy; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_prs2_busy; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_prs3_busy; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_ppred_busy; // @[fdiv.scala 146:26]
  reg [5:0] r_divsqrt_uop_stale_pdst; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_exception; // @[fdiv.scala 146:26]
  reg [63:0] r_divsqrt_uop_exc_cause; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_bypassable; // @[fdiv.scala 146:26]
  reg [4:0] r_divsqrt_uop_mem_cmd; // @[fdiv.scala 146:26]
  reg [1:0] r_divsqrt_uop_mem_size; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_mem_signed; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_is_fence; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_is_fencei; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_is_amo; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_uses_ldq; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_uses_stq; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_is_sys_pc2epc; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_is_unique; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_flush_on_commit; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_ldst_is_rs1; // @[fdiv.scala 146:26]
  reg [5:0] r_divsqrt_uop_ldst; // @[fdiv.scala 146:26]
  reg [5:0] r_divsqrt_uop_lrs1; // @[fdiv.scala 146:26]
  reg [5:0] r_divsqrt_uop_lrs2; // @[fdiv.scala 146:26]
  reg [5:0] r_divsqrt_uop_lrs3; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_ldst_val; // @[fdiv.scala 146:26]
  reg [1:0] r_divsqrt_uop_dst_rtype; // @[fdiv.scala 146:26]
  reg [1:0] r_divsqrt_uop_lrs1_rtype; // @[fdiv.scala 146:26]
  reg [1:0] r_divsqrt_uop_lrs2_rtype; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_frs3_en; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_fp_val; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_fp_single; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_xcpt_pf_if; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_xcpt_ae_if; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_xcpt_ma_if; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_bp_debug_if; // @[fdiv.scala 146:26]
  reg  r_divsqrt_uop_bp_xcpt_if; // @[fdiv.scala 146:26]
  reg [1:0] r_divsqrt_uop_debug_fsrc; // @[fdiv.scala 146:26]
  reg [1:0] r_divsqrt_uop_debug_tsrc; // @[fdiv.scala 146:26]
  wire  _T_31 = r_buffer_fin_div | r_buffer_fin_sqrt; // @[fdiv.scala 153:23]
  wire  _T_32 = r_buffer_val & _T_31; // @[fdiv.scala 152:18]
  wire  _T_33 = ~r_divsqrt_val; // @[fdiv.scala 154:5]
  wire  _T_34 = _T_32 & _T_33; // @[fdiv.scala 153:45]
  reg  r_out_val; // @[fdiv.scala 182:26]
  wire  output_buffer_available = ~r_out_val; // @[fdiv.scala 187:30]
  wire  may_fire_input = _T_34 & output_buffer_available; // @[fdiv.scala 154:20]
  wire  divsqrt_ready = divsqrt_io_sqrtOp ? divsqrt_io_inReady_sqrt : divsqrt_io_inReady_div; // @[fdiv.scala 157:26]
  wire [11:0] _T_36 = io_brupdate_b1_mispredict_mask & r_divsqrt_uop_br_mask; // @[util.scala 118:51]
  wire  _T_37 = _T_36 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_41 = r_divsqrt_uop_br_mask & _T_6; // @[util.scala 85:25]
  wire  _GEN_108 = may_fire_input & divsqrt_ready | r_divsqrt_val; // @[fdiv.scala 168:42 fdiv.scala 172:19 fdiv.scala 143:30]
  reg [6:0] r_out_uop_uopc; // @[fdiv.scala 183:22]
  reg [31:0] r_out_uop_inst; // @[fdiv.scala 183:22]
  reg [31:0] r_out_uop_debug_inst; // @[fdiv.scala 183:22]
  reg  r_out_uop_is_rvc; // @[fdiv.scala 183:22]
  reg [39:0] r_out_uop_debug_pc; // @[fdiv.scala 183:22]
  reg [2:0] r_out_uop_iq_type; // @[fdiv.scala 183:22]
  reg [9:0] r_out_uop_fu_code; // @[fdiv.scala 183:22]
  reg [3:0] r_out_uop_ctrl_br_type; // @[fdiv.scala 183:22]
  reg [1:0] r_out_uop_ctrl_op1_sel; // @[fdiv.scala 183:22]
  reg [2:0] r_out_uop_ctrl_op2_sel; // @[fdiv.scala 183:22]
  reg [2:0] r_out_uop_ctrl_imm_sel; // @[fdiv.scala 183:22]
  reg [3:0] r_out_uop_ctrl_op_fcn; // @[fdiv.scala 183:22]
  reg  r_out_uop_ctrl_fcn_dw; // @[fdiv.scala 183:22]
  reg [2:0] r_out_uop_ctrl_csr_cmd; // @[fdiv.scala 183:22]
  reg  r_out_uop_ctrl_is_load; // @[fdiv.scala 183:22]
  reg  r_out_uop_ctrl_is_sta; // @[fdiv.scala 183:22]
  reg  r_out_uop_ctrl_is_std; // @[fdiv.scala 183:22]
  reg [1:0] r_out_uop_iw_state; // @[fdiv.scala 183:22]
  reg  r_out_uop_iw_p1_poisoned; // @[fdiv.scala 183:22]
  reg  r_out_uop_iw_p2_poisoned; // @[fdiv.scala 183:22]
  reg  r_out_uop_is_br; // @[fdiv.scala 183:22]
  reg  r_out_uop_is_jalr; // @[fdiv.scala 183:22]
  reg  r_out_uop_is_jal; // @[fdiv.scala 183:22]
  reg  r_out_uop_is_sfb; // @[fdiv.scala 183:22]
  reg [11:0] r_out_uop_br_mask; // @[fdiv.scala 183:22]
  reg [3:0] r_out_uop_br_tag; // @[fdiv.scala 183:22]
  reg [4:0] r_out_uop_ftq_idx; // @[fdiv.scala 183:22]
  reg  r_out_uop_edge_inst; // @[fdiv.scala 183:22]
  reg [5:0] r_out_uop_pc_lob; // @[fdiv.scala 183:22]
  reg  r_out_uop_taken; // @[fdiv.scala 183:22]
  reg [19:0] r_out_uop_imm_packed; // @[fdiv.scala 183:22]
  reg [11:0] r_out_uop_csr_addr; // @[fdiv.scala 183:22]
  reg [5:0] r_out_uop_rob_idx; // @[fdiv.scala 183:22]
  reg [3:0] r_out_uop_ldq_idx; // @[fdiv.scala 183:22]
  reg [3:0] r_out_uop_stq_idx; // @[fdiv.scala 183:22]
  reg [1:0] r_out_uop_rxq_idx; // @[fdiv.scala 183:22]
  reg [5:0] r_out_uop_pdst; // @[fdiv.scala 183:22]
  reg [5:0] r_out_uop_prs1; // @[fdiv.scala 183:22]
  reg [5:0] r_out_uop_prs2; // @[fdiv.scala 183:22]
  reg [5:0] r_out_uop_prs3; // @[fdiv.scala 183:22]
  reg [4:0] r_out_uop_ppred; // @[fdiv.scala 183:22]
  reg  r_out_uop_prs1_busy; // @[fdiv.scala 183:22]
  reg  r_out_uop_prs2_busy; // @[fdiv.scala 183:22]
  reg  r_out_uop_prs3_busy; // @[fdiv.scala 183:22]
  reg  r_out_uop_ppred_busy; // @[fdiv.scala 183:22]
  reg [5:0] r_out_uop_stale_pdst; // @[fdiv.scala 183:22]
  reg  r_out_uop_exception; // @[fdiv.scala 183:22]
  reg [63:0] r_out_uop_exc_cause; // @[fdiv.scala 183:22]
  reg  r_out_uop_bypassable; // @[fdiv.scala 183:22]
  reg [4:0] r_out_uop_mem_cmd; // @[fdiv.scala 183:22]
  reg [1:0] r_out_uop_mem_size; // @[fdiv.scala 183:22]
  reg  r_out_uop_mem_signed; // @[fdiv.scala 183:22]
  reg  r_out_uop_is_fence; // @[fdiv.scala 183:22]
  reg  r_out_uop_is_fencei; // @[fdiv.scala 183:22]
  reg  r_out_uop_is_amo; // @[fdiv.scala 183:22]
  reg  r_out_uop_uses_ldq; // @[fdiv.scala 183:22]
  reg  r_out_uop_uses_stq; // @[fdiv.scala 183:22]
  reg  r_out_uop_is_sys_pc2epc; // @[fdiv.scala 183:22]
  reg  r_out_uop_is_unique; // @[fdiv.scala 183:22]
  reg  r_out_uop_flush_on_commit; // @[fdiv.scala 183:22]
  reg  r_out_uop_ldst_is_rs1; // @[fdiv.scala 183:22]
  reg [5:0] r_out_uop_ldst; // @[fdiv.scala 183:22]
  reg [5:0] r_out_uop_lrs1; // @[fdiv.scala 183:22]
  reg [5:0] r_out_uop_lrs2; // @[fdiv.scala 183:22]
  reg [5:0] r_out_uop_lrs3; // @[fdiv.scala 183:22]
  reg  r_out_uop_ldst_val; // @[fdiv.scala 183:22]
  reg [1:0] r_out_uop_dst_rtype; // @[fdiv.scala 183:22]
  reg [1:0] r_out_uop_lrs1_rtype; // @[fdiv.scala 183:22]
  reg [1:0] r_out_uop_lrs2_rtype; // @[fdiv.scala 183:22]
  reg  r_out_uop_frs3_en; // @[fdiv.scala 183:22]
  reg  r_out_uop_fp_val; // @[fdiv.scala 183:22]
  reg  r_out_uop_fp_single; // @[fdiv.scala 183:22]
  reg  r_out_uop_xcpt_pf_if; // @[fdiv.scala 183:22]
  reg  r_out_uop_xcpt_ae_if; // @[fdiv.scala 183:22]
  reg  r_out_uop_xcpt_ma_if; // @[fdiv.scala 183:22]
  reg  r_out_uop_bp_debug_if; // @[fdiv.scala 183:22]
  reg  r_out_uop_bp_xcpt_if; // @[fdiv.scala 183:22]
  reg [1:0] r_out_uop_debug_fsrc; // @[fdiv.scala 183:22]
  reg [1:0] r_out_uop_debug_tsrc; // @[fdiv.scala 183:22]
  reg [4:0] r_out_flags_double; // @[fdiv.scala 184:31]
  reg [64:0] r_out_wdata_double; // @[fdiv.scala 185:31]
  wire [11:0] _T_50 = r_out_uop_br_mask & _T_6; // @[util.scala 85:25]
  wire [11:0] _T_51 = io_brupdate_b1_mispredict_mask & r_out_uop_br_mask; // @[util.scala 118:51]
  wire  _T_52 = _T_51 != 12'h0; // @[util.scala 118:59]
  wire  _T_55 = divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt; // @[fdiv.scala 194:33]
  wire [64:0] maskedNaN = divsqrt_io_out & 65'h1efefffffffffffff; // @[FPU.scala 408:25]
  wire  _T_66 = &divsqrt_io_out[63:61]; // @[FPU.scala 243:56]
  wire  _T_77 = r_divsqrt_fin_typeTagIn == 2'h0; // @[fdiv.scala 214:68]
  wire [4:0] _T_78 = r_divsqrt_fin_typeTagIn == 2'h0 ? downvert_d2s_io_exceptionFlags : 5'h0; // @[fdiv.scala 214:43]
  wire  opts_bigger_swizzledNaN_hi_lo_lo = downvert_d2s_io_out[31]; // @[FPU.scala 335:8]
  wire  opts_bigger_swizzledNaN_lo_hi_lo = downvert_d2s_io_out[32]; // @[FPU.scala 337:8]
  wire [30:0] opts_bigger_swizzledNaN_lo_lo = downvert_d2s_io_out[30:0]; // @[FPU.scala 338:8]
  wire [64:0] opts_bigger_swizzledNaN = {5'h1f,7'h7f,opts_bigger_swizzledNaN_hi_lo_lo,20'hfffff,
    opts_bigger_swizzledNaN_lo_hi_lo,opts_bigger_swizzledNaN_lo_lo}; // @[Cat.scala 30:58]
  UOPCodeFDivDecoder fdiv_decoder ( // @[fdiv.scala 99:28]
    .clock(fdiv_decoder_clock),
    .reset(fdiv_decoder_reset),
    .io_uopc(fdiv_decoder_io_uopc),
    .io_sigs_ldst(fdiv_decoder_io_sigs_ldst),
    .io_sigs_wen(fdiv_decoder_io_sigs_wen),
    .io_sigs_ren1(fdiv_decoder_io_sigs_ren1),
    .io_sigs_ren2(fdiv_decoder_io_sigs_ren2),
    .io_sigs_ren3(fdiv_decoder_io_sigs_ren3),
    .io_sigs_swap12(fdiv_decoder_io_sigs_swap12),
    .io_sigs_swap23(fdiv_decoder_io_sigs_swap23),
    .io_sigs_typeTagIn(fdiv_decoder_io_sigs_typeTagIn),
    .io_sigs_typeTagOut(fdiv_decoder_io_sigs_typeTagOut),
    .io_sigs_fromint(fdiv_decoder_io_sigs_fromint),
    .io_sigs_toint(fdiv_decoder_io_sigs_toint),
    .io_sigs_fastpipe(fdiv_decoder_io_sigs_fastpipe),
    .io_sigs_fma(fdiv_decoder_io_sigs_fma),
    .io_sigs_div(fdiv_decoder_io_sigs_div),
    .io_sigs_sqrt(fdiv_decoder_io_sigs_sqrt),
    .io_sigs_wflags(fdiv_decoder_io_sigs_wflags)
  );
  RecFNToRecFN_1 RecFNToRecFN ( // @[fdiv.scala 110:21]
    .io_in(RecFNToRecFN_io_in),
    .io_roundingMode(RecFNToRecFN_io_roundingMode),
    .io_detectTininess(RecFNToRecFN_io_detectTininess),
    .io_out(RecFNToRecFN_io_out),
    .io_exceptionFlags(RecFNToRecFN_io_exceptionFlags)
  );
  RecFNToRecFN_1 RecFNToRecFN_1 ( // @[fdiv.scala 110:21]
    .io_in(RecFNToRecFN_1_io_in),
    .io_roundingMode(RecFNToRecFN_1_io_roundingMode),
    .io_detectTininess(RecFNToRecFN_1_io_detectTininess),
    .io_out(RecFNToRecFN_1_io_out),
    .io_exceptionFlags(RecFNToRecFN_1_io_exceptionFlags)
  );
  DivSqrtRecF64 divsqrt ( // @[fdiv.scala 141:23]
    .clock(divsqrt_clock),
    .reset(divsqrt_reset),
    .io_inReady_div(divsqrt_io_inReady_div),
    .io_inReady_sqrt(divsqrt_io_inReady_sqrt),
    .io_inValid(divsqrt_io_inValid),
    .io_sqrtOp(divsqrt_io_sqrtOp),
    .io_a(divsqrt_io_a),
    .io_b(divsqrt_io_b),
    .io_roundingMode(divsqrt_io_roundingMode),
    .io_detectTininess(divsqrt_io_detectTininess),
    .io_outValid_div(divsqrt_io_outValid_div),
    .io_outValid_sqrt(divsqrt_io_outValid_sqrt),
    .io_out(divsqrt_io_out),
    .io_exceptionFlags(divsqrt_io_exceptionFlags)
  );
  RecFNToRecFN downvert_d2s ( // @[fdiv.scala 209:28]
    .io_in(downvert_d2s_io_in),
    .io_roundingMode(downvert_d2s_io_roundingMode),
    .io_detectTininess(downvert_d2s_io_detectTininess),
    .io_out(downvert_d2s_io_out),
    .io_exceptionFlags(downvert_d2s_io_exceptionFlags)
  );
  assign io_req_ready = ~r_buffer_val; // @[fdiv.scala 107:19]
  assign io_resp_valid = r_out_val & ~_T_52; // @[fdiv.scala 216:30]
  assign io_resp_bits_uop_uopc = r_out_uop_uopc; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_inst = r_out_uop_inst; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_debug_inst = r_out_uop_debug_inst; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_is_rvc = r_out_uop_is_rvc; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_debug_pc = r_out_uop_debug_pc; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_iq_type = r_out_uop_iq_type; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_fu_code = r_out_uop_fu_code; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ctrl_br_type = r_out_uop_ctrl_br_type; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ctrl_op1_sel = r_out_uop_ctrl_op1_sel; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ctrl_op2_sel = r_out_uop_ctrl_op2_sel; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ctrl_imm_sel = r_out_uop_ctrl_imm_sel; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ctrl_op_fcn = r_out_uop_ctrl_op_fcn; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ctrl_fcn_dw = r_out_uop_ctrl_fcn_dw; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ctrl_csr_cmd = r_out_uop_ctrl_csr_cmd; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ctrl_is_load = r_out_uop_ctrl_is_load; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ctrl_is_sta = r_out_uop_ctrl_is_sta; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ctrl_is_std = r_out_uop_ctrl_is_std; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_iw_state = r_out_uop_iw_state; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_iw_p1_poisoned = r_out_uop_iw_p1_poisoned; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_iw_p2_poisoned = r_out_uop_iw_p2_poisoned; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_is_br = r_out_uop_is_br; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_is_jalr = r_out_uop_is_jalr; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_is_jal = r_out_uop_is_jal; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_is_sfb = r_out_uop_is_sfb; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_br_mask = r_out_uop_br_mask; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_br_tag = r_out_uop_br_tag; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ftq_idx = r_out_uop_ftq_idx; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_edge_inst = r_out_uop_edge_inst; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_pc_lob = r_out_uop_pc_lob; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_taken = r_out_uop_taken; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_imm_packed = r_out_uop_imm_packed; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_csr_addr = r_out_uop_csr_addr; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_rob_idx = r_out_uop_rob_idx; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ldq_idx = r_out_uop_ldq_idx; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_stq_idx = r_out_uop_stq_idx; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_rxq_idx = r_out_uop_rxq_idx; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_pdst = r_out_uop_pdst; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_prs1 = r_out_uop_prs1; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_prs2 = r_out_uop_prs2; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_prs3 = r_out_uop_prs3; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ppred = r_out_uop_ppred; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_prs1_busy = r_out_uop_prs1_busy; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_prs2_busy = r_out_uop_prs2_busy; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_prs3_busy = r_out_uop_prs3_busy; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ppred_busy = r_out_uop_ppred_busy; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_stale_pdst = r_out_uop_stale_pdst; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_exception = r_out_uop_exception; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_exc_cause = r_out_uop_exc_cause; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_bypassable = r_out_uop_bypassable; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_mem_cmd = r_out_uop_mem_cmd; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_mem_size = r_out_uop_mem_size; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_mem_signed = r_out_uop_mem_signed; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_is_fence = r_out_uop_is_fence; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_is_fencei = r_out_uop_is_fencei; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_is_amo = r_out_uop_is_amo; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_uses_ldq = r_out_uop_uses_ldq; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_uses_stq = r_out_uop_uses_stq; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_is_sys_pc2epc = r_out_uop_is_sys_pc2epc; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_is_unique = r_out_uop_is_unique; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_flush_on_commit = r_out_uop_flush_on_commit; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ldst_is_rs1 = r_out_uop_ldst_is_rs1; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ldst = r_out_uop_ldst; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_lrs1 = r_out_uop_lrs1; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_lrs2 = r_out_uop_lrs2; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_lrs3 = r_out_uop_lrs3; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_ldst_val = r_out_uop_ldst_val; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_dst_rtype = r_out_uop_dst_rtype; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_lrs1_rtype = r_out_uop_lrs1_rtype; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_lrs2_rtype = r_out_uop_lrs2_rtype; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_frs3_en = r_out_uop_frs3_en; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_fp_val = r_out_uop_fp_val; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_fp_single = r_out_uop_fp_single; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_xcpt_pf_if = r_out_uop_xcpt_pf_if; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_xcpt_ae_if = r_out_uop_xcpt_ae_if; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_xcpt_ma_if = r_out_uop_xcpt_ma_if; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_bp_debug_if = r_out_uop_bp_debug_if; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_bp_xcpt_if = r_out_uop_bp_xcpt_if; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_debug_fsrc = r_out_uop_debug_fsrc; // @[fdiv.scala 217:20]
  assign io_resp_bits_uop_debug_tsrc = r_out_uop_debug_tsrc; // @[fdiv.scala 217:20]
  assign io_resp_bits_predicated = 1'h0;
  assign io_resp_bits_data = _T_77 ? opts_bigger_swizzledNaN : r_out_wdata_double; // @[fdiv.scala 219:8]
  assign io_resp_bits_fflags_valid = io_resp_valid; // @[fdiv.scala 222:29]
  assign io_resp_bits_fflags_bits_uop_uopc = r_out_uop_uopc; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_inst = r_out_uop_inst; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_debug_inst = r_out_uop_debug_inst; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_is_rvc = r_out_uop_is_rvc; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_debug_pc = r_out_uop_debug_pc; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_iq_type = r_out_uop_iq_type; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_fu_code = r_out_uop_fu_code; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ctrl_br_type = r_out_uop_ctrl_br_type; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ctrl_op1_sel = r_out_uop_ctrl_op1_sel; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ctrl_op2_sel = r_out_uop_ctrl_op2_sel; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ctrl_imm_sel = r_out_uop_ctrl_imm_sel; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ctrl_op_fcn = r_out_uop_ctrl_op_fcn; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ctrl_fcn_dw = r_out_uop_ctrl_fcn_dw; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ctrl_csr_cmd = r_out_uop_ctrl_csr_cmd; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ctrl_is_load = r_out_uop_ctrl_is_load; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ctrl_is_sta = r_out_uop_ctrl_is_sta; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ctrl_is_std = r_out_uop_ctrl_is_std; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_iw_state = r_out_uop_iw_state; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_iw_p1_poisoned = r_out_uop_iw_p1_poisoned; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_iw_p2_poisoned = r_out_uop_iw_p2_poisoned; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_is_br = r_out_uop_is_br; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_is_jalr = r_out_uop_is_jalr; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_is_jal = r_out_uop_is_jal; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_is_sfb = r_out_uop_is_sfb; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_br_mask = r_out_uop_br_mask & _T_6; // @[util.scala 85:25]
  assign io_resp_bits_fflags_bits_uop_br_tag = r_out_uop_br_tag; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ftq_idx = r_out_uop_ftq_idx; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_edge_inst = r_out_uop_edge_inst; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_pc_lob = r_out_uop_pc_lob; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_taken = r_out_uop_taken; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_imm_packed = r_out_uop_imm_packed; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_csr_addr = r_out_uop_csr_addr; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_rob_idx = r_out_uop_rob_idx; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ldq_idx = r_out_uop_ldq_idx; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_stq_idx = r_out_uop_stq_idx; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_rxq_idx = r_out_uop_rxq_idx; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_pdst = r_out_uop_pdst; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_prs1 = r_out_uop_prs1; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_prs2 = r_out_uop_prs2; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_prs3 = r_out_uop_prs3; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ppred = r_out_uop_ppred; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_prs1_busy = r_out_uop_prs1_busy; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_prs2_busy = r_out_uop_prs2_busy; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_prs3_busy = r_out_uop_prs3_busy; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ppred_busy = r_out_uop_ppred_busy; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_stale_pdst = r_out_uop_stale_pdst; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_exception = r_out_uop_exception; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_exc_cause = r_out_uop_exc_cause; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_bypassable = r_out_uop_bypassable; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_mem_cmd = r_out_uop_mem_cmd; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_mem_size = r_out_uop_mem_size; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_mem_signed = r_out_uop_mem_signed; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_is_fence = r_out_uop_is_fence; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_is_fencei = r_out_uop_is_fencei; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_is_amo = r_out_uop_is_amo; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_uses_ldq = r_out_uop_uses_ldq; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_uses_stq = r_out_uop_uses_stq; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_is_sys_pc2epc = r_out_uop_is_sys_pc2epc; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_is_unique = r_out_uop_is_unique; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_flush_on_commit = r_out_uop_flush_on_commit; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ldst_is_rs1 = r_out_uop_ldst_is_rs1; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ldst = r_out_uop_ldst; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_lrs1 = r_out_uop_lrs1; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_lrs2 = r_out_uop_lrs2; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_lrs3 = r_out_uop_lrs3; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_ldst_val = r_out_uop_ldst_val; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_dst_rtype = r_out_uop_dst_rtype; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_lrs1_rtype = r_out_uop_lrs1_rtype; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_lrs2_rtype = r_out_uop_lrs2_rtype; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_frs3_en = r_out_uop_frs3_en; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_fp_val = r_out_uop_fp_val; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_fp_single = r_out_uop_fp_single; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_xcpt_pf_if = r_out_uop_xcpt_pf_if; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_xcpt_ae_if = r_out_uop_xcpt_ae_if; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_xcpt_ma_if = r_out_uop_xcpt_ma_if; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_bp_debug_if = r_out_uop_bp_debug_if; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_bp_xcpt_if = r_out_uop_bp_xcpt_if; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_debug_fsrc = r_out_uop_debug_fsrc; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_uop_debug_tsrc = r_out_uop_debug_tsrc; // @[fdiv.scala 223:32]
  assign io_resp_bits_fflags_bits_flags = r_out_flags_double | _T_78; // @[fdiv.scala 214:38]
  assign io_resp_bits_addr = 40'h0;
  assign io_resp_bits_mxcpt_valid = 1'h0;
  assign io_resp_bits_mxcpt_bits = 17'h0;
  assign io_resp_bits_sfence_valid = 1'h0;
  assign io_resp_bits_sfence_bits_rs1 = 1'h0;
  assign io_resp_bits_sfence_bits_rs2 = 1'h0;
  assign io_resp_bits_sfence_bits_addr = 39'h0;
  assign io_resp_bits_sfence_bits_asid = 1'h0;
  assign fdiv_decoder_clock = clock;
  assign fdiv_decoder_reset = reset;
  assign fdiv_decoder_io_uopc = io_req_bits_uop_uopc; // @[fdiv.scala 100:24]
  assign RecFNToRecFN_io_in = floats_0 | _T_9; // @[FPU.scala 367:26]
  assign RecFNToRecFN_io_roundingMode = 3'h0; // @[fdiv.scala 112:25]
  assign RecFNToRecFN_io_detectTininess = 1'h0;
  assign RecFNToRecFN_1_io_in = floats_0_1 | _T_11; // @[FPU.scala 367:26]
  assign RecFNToRecFN_1_io_roundingMode = 3'h0; // @[fdiv.scala 112:25]
  assign RecFNToRecFN_1_io_detectTininess = 1'h0;
  assign divsqrt_clock = clock;
  assign divsqrt_reset = reset;
  assign divsqrt_io_inValid = _T_34 & output_buffer_available; // @[fdiv.scala 154:20]
  assign divsqrt_io_sqrtOp = r_buffer_fin_sqrt; // @[fdiv.scala 159:21]
  assign divsqrt_io_a = r_buffer_fin_in1; // @[fdiv.scala 160:16]
  assign divsqrt_io_b = divsqrt_io_sqrtOp ? r_buffer_fin_in1 : r_buffer_fin_in2; // @[fdiv.scala 161:22]
  assign divsqrt_io_roundingMode = r_buffer_fin_rm; // @[fdiv.scala 162:27]
  assign divsqrt_io_detectTininess = 1'h0;
  assign downvert_d2s_io_in = r_out_wdata_double; // @[fdiv.scala 211:22]
  assign downvert_d2s_io_roundingMode = r_divsqrt_fin_rm; // @[fdiv.scala 212:32]
  assign downvert_d2s_io_detectTininess = 1'h0;
  always @(posedge clock) begin
    if (reset) begin // @[fdiv.scala 95:29]
      r_buffer_val <= 1'h0; // @[fdiv.scala 95:29]
    end else if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_buffer_val <= 1'h0; // @[fdiv.scala 171:18]
    end else begin
      r_buffer_val <= _GEN_2;
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_uopc <= io_req_bits_uop_uopc; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_inst <= io_req_bits_uop_inst; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_debug_inst <= io_req_bits_uop_debug_inst; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_is_rvc <= io_req_bits_uop_is_rvc; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_debug_pc <= io_req_bits_uop_debug_pc; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_iq_type <= io_req_bits_uop_iq_type; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_fu_code <= io_req_bits_uop_fu_code; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ctrl_br_type <= io_req_bits_uop_ctrl_br_type; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ctrl_op1_sel <= io_req_bits_uop_ctrl_op1_sel; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ctrl_op2_sel <= io_req_bits_uop_ctrl_op2_sel; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ctrl_imm_sel <= io_req_bits_uop_ctrl_imm_sel; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ctrl_op_fcn <= io_req_bits_uop_ctrl_op_fcn; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ctrl_fcn_dw <= io_req_bits_uop_ctrl_fcn_dw; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ctrl_csr_cmd <= io_req_bits_uop_ctrl_csr_cmd; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ctrl_is_load <= io_req_bits_uop_ctrl_is_load; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ctrl_is_sta <= io_req_bits_uop_ctrl_is_sta; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ctrl_is_std <= io_req_bits_uop_ctrl_is_std; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_iw_state <= io_req_bits_uop_iw_state; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_iw_p1_poisoned <= io_req_bits_uop_iw_p1_poisoned; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_iw_p2_poisoned <= io_req_bits_uop_iw_p2_poisoned; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_is_br <= io_req_bits_uop_is_br; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_is_jalr <= io_req_bits_uop_is_jalr; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_is_jal <= io_req_bits_uop_is_jal; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_is_sfb <= io_req_bits_uop_is_sfb; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_br_mask <= _T_20; // @[fdiv.scala 122:30]
    end else begin
      r_buffer_req_uop_br_mask <= _T_7; // @[fdiv.scala 104:28]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_br_tag <= io_req_bits_uop_br_tag; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ftq_idx <= io_req_bits_uop_ftq_idx; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_edge_inst <= io_req_bits_uop_edge_inst; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_pc_lob <= io_req_bits_uop_pc_lob; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_taken <= io_req_bits_uop_taken; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_imm_packed <= io_req_bits_uop_imm_packed; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_csr_addr <= io_req_bits_uop_csr_addr; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_rob_idx <= io_req_bits_uop_rob_idx; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ldq_idx <= io_req_bits_uop_ldq_idx; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_stq_idx <= io_req_bits_uop_stq_idx; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_rxq_idx <= io_req_bits_uop_rxq_idx; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_pdst <= io_req_bits_uop_pdst; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_prs1 <= io_req_bits_uop_prs1; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_prs2 <= io_req_bits_uop_prs2; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_prs3 <= io_req_bits_uop_prs3; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ppred <= io_req_bits_uop_ppred; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_prs1_busy <= io_req_bits_uop_prs1_busy; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_prs2_busy <= io_req_bits_uop_prs2_busy; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_prs3_busy <= io_req_bits_uop_prs3_busy; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ppred_busy <= io_req_bits_uop_ppred_busy; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_stale_pdst <= io_req_bits_uop_stale_pdst; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_exception <= io_req_bits_uop_exception; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_exc_cause <= io_req_bits_uop_exc_cause; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_bypassable <= io_req_bits_uop_bypassable; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_mem_cmd <= io_req_bits_uop_mem_cmd; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_mem_size <= io_req_bits_uop_mem_size; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_mem_signed <= io_req_bits_uop_mem_signed; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_is_fence <= io_req_bits_uop_is_fence; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_is_fencei <= io_req_bits_uop_is_fencei; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_is_amo <= io_req_bits_uop_is_amo; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_uses_ldq <= io_req_bits_uop_uses_ldq; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_uses_stq <= io_req_bits_uop_uses_stq; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_is_sys_pc2epc <= io_req_bits_uop_is_sys_pc2epc; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_is_unique <= io_req_bits_uop_is_unique; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_flush_on_commit <= io_req_bits_uop_flush_on_commit; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ldst_is_rs1 <= io_req_bits_uop_ldst_is_rs1; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ldst <= io_req_bits_uop_ldst; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_lrs1 <= io_req_bits_uop_lrs1; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_lrs2 <= io_req_bits_uop_lrs2; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_lrs3 <= io_req_bits_uop_lrs3; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_ldst_val <= io_req_bits_uop_ldst_val; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_dst_rtype <= io_req_bits_uop_dst_rtype; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_lrs1_rtype <= io_req_bits_uop_lrs1_rtype; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_lrs2_rtype <= io_req_bits_uop_lrs2_rtype; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_frs3_en <= io_req_bits_uop_frs3_en; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_fp_val <= io_req_bits_uop_fp_val; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_fp_single <= io_req_bits_uop_fp_single; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_xcpt_pf_if <= io_req_bits_uop_xcpt_pf_if; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_xcpt_ae_if <= io_req_bits_uop_xcpt_ae_if; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_xcpt_ma_if <= io_req_bits_uop_xcpt_ma_if; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_bp_debug_if <= io_req_bits_uop_bp_debug_if; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_bp_xcpt_if <= io_req_bits_uop_bp_xcpt_if; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_debug_fsrc <= io_req_bits_uop_debug_fsrc; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_req_uop_debug_tsrc <= io_req_bits_uop_debug_tsrc; // @[fdiv.scala 121:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_fin_typeTagIn <= fdiv_decoder_io_sigs_typeTagIn; // @[fdiv.scala 123:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_fin_div <= fdiv_decoder_io_sigs_div; // @[fdiv.scala 123:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_fin_sqrt <= fdiv_decoder_io_sigs_sqrt; // @[fdiv.scala 123:18]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      r_buffer_fin_rm <= io_fcsr_rm; // @[fdiv.scala 125:21]
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      if (fdiv_decoder_io_sigs_typeTagIn == 2'h0) begin // @[fdiv.scala 130:22]
        r_buffer_fin_in1 <= RecFNToRecFN_io_out; // @[fdiv.scala 131:24]
      end else begin
        r_buffer_fin_in1 <= io_req_bits_rs1_data; // @[fdiv.scala 128:22]
      end
    end
    if (io_req_valid & ~_T_14 & _T_3) begin // @[fdiv.scala 119:95]
      if (fdiv_decoder_io_sigs_typeTagIn == 2'h0) begin // @[fdiv.scala 130:22]
        r_buffer_fin_in2 <= RecFNToRecFN_1_io_out; // @[fdiv.scala 132:24]
      end else begin
        r_buffer_fin_in2 <= io_req_bits_rs2_data; // @[fdiv.scala 129:22]
      end
    end
    if (reset) begin // @[fdiv.scala 143:30]
      r_divsqrt_val <= 1'h0; // @[fdiv.scala 143:30]
    end else if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_divsqrt_val <= 1'h0; // @[fdiv.scala 195:19]
    end else begin
      r_divsqrt_val <= _GEN_108;
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_killed <= _T_1 | io_req_bits_kill; // @[fdiv.scala 175:22]
    end else begin
      r_divsqrt_killed <= r_divsqrt_killed | _T_37 | io_req_bits_kill; // @[fdiv.scala 165:20]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_fin_typeTagIn <= r_buffer_fin_typeTagIn; // @[fdiv.scala 173:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_fin_rm <= r_buffer_fin_rm; // @[fdiv.scala 173:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_uopc <= r_buffer_req_uop_uopc; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_inst <= r_buffer_req_uop_inst; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_debug_inst <= r_buffer_req_uop_debug_inst; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_is_rvc <= r_buffer_req_uop_is_rvc; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_debug_pc <= r_buffer_req_uop_debug_pc; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_iq_type <= r_buffer_req_uop_iq_type; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_fu_code <= r_buffer_req_uop_fu_code; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ctrl_br_type <= r_buffer_req_uop_ctrl_br_type; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ctrl_op1_sel <= r_buffer_req_uop_ctrl_op1_sel; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ctrl_op2_sel <= r_buffer_req_uop_ctrl_op2_sel; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ctrl_imm_sel <= r_buffer_req_uop_ctrl_imm_sel; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ctrl_op_fcn <= r_buffer_req_uop_ctrl_op_fcn; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ctrl_fcn_dw <= r_buffer_req_uop_ctrl_fcn_dw; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ctrl_csr_cmd <= r_buffer_req_uop_ctrl_csr_cmd; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ctrl_is_load <= r_buffer_req_uop_ctrl_is_load; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ctrl_is_sta <= r_buffer_req_uop_ctrl_is_sta; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ctrl_is_std <= r_buffer_req_uop_ctrl_is_std; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_iw_state <= r_buffer_req_uop_iw_state; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_iw_p1_poisoned <= r_buffer_req_uop_iw_p1_poisoned; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_iw_p2_poisoned <= r_buffer_req_uop_iw_p2_poisoned; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_is_br <= r_buffer_req_uop_is_br; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_is_jalr <= r_buffer_req_uop_is_jalr; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_is_jal <= r_buffer_req_uop_is_jal; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_is_sfb <= r_buffer_req_uop_is_sfb; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_br_mask <= _T_7; // @[fdiv.scala 176:27]
    end else begin
      r_divsqrt_uop_br_mask <= _T_41; // @[fdiv.scala 166:25]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_br_tag <= r_buffer_req_uop_br_tag; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ftq_idx <= r_buffer_req_uop_ftq_idx; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_edge_inst <= r_buffer_req_uop_edge_inst; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_pc_lob <= r_buffer_req_uop_pc_lob; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_taken <= r_buffer_req_uop_taken; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_imm_packed <= r_buffer_req_uop_imm_packed; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_csr_addr <= r_buffer_req_uop_csr_addr; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_rob_idx <= r_buffer_req_uop_rob_idx; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ldq_idx <= r_buffer_req_uop_ldq_idx; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_stq_idx <= r_buffer_req_uop_stq_idx; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_rxq_idx <= r_buffer_req_uop_rxq_idx; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_pdst <= r_buffer_req_uop_pdst; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_prs1 <= r_buffer_req_uop_prs1; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_prs2 <= r_buffer_req_uop_prs2; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_prs3 <= r_buffer_req_uop_prs3; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ppred <= r_buffer_req_uop_ppred; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_prs1_busy <= r_buffer_req_uop_prs1_busy; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_prs2_busy <= r_buffer_req_uop_prs2_busy; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_prs3_busy <= r_buffer_req_uop_prs3_busy; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ppred_busy <= r_buffer_req_uop_ppred_busy; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_stale_pdst <= r_buffer_req_uop_stale_pdst; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_exception <= r_buffer_req_uop_exception; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_exc_cause <= r_buffer_req_uop_exc_cause; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_bypassable <= r_buffer_req_uop_bypassable; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_mem_cmd <= r_buffer_req_uop_mem_cmd; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_mem_size <= r_buffer_req_uop_mem_size; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_mem_signed <= r_buffer_req_uop_mem_signed; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_is_fence <= r_buffer_req_uop_is_fence; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_is_fencei <= r_buffer_req_uop_is_fencei; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_is_amo <= r_buffer_req_uop_is_amo; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_uses_ldq <= r_buffer_req_uop_uses_ldq; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_uses_stq <= r_buffer_req_uop_uses_stq; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_is_sys_pc2epc <= r_buffer_req_uop_is_sys_pc2epc; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_is_unique <= r_buffer_req_uop_is_unique; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_flush_on_commit <= r_buffer_req_uop_flush_on_commit; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ldst_is_rs1 <= r_buffer_req_uop_ldst_is_rs1; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ldst <= r_buffer_req_uop_ldst; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_lrs1 <= r_buffer_req_uop_lrs1; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_lrs2 <= r_buffer_req_uop_lrs2; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_lrs3 <= r_buffer_req_uop_lrs3; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_ldst_val <= r_buffer_req_uop_ldst_val; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_dst_rtype <= r_buffer_req_uop_dst_rtype; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_lrs1_rtype <= r_buffer_req_uop_lrs1_rtype; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_lrs2_rtype <= r_buffer_req_uop_lrs2_rtype; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_frs3_en <= r_buffer_req_uop_frs3_en; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_fp_val <= r_buffer_req_uop_fp_val; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_fp_single <= r_buffer_req_uop_fp_single; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_xcpt_pf_if <= r_buffer_req_uop_xcpt_pf_if; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_xcpt_ae_if <= r_buffer_req_uop_xcpt_ae_if; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_xcpt_ma_if <= r_buffer_req_uop_xcpt_ma_if; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_bp_debug_if <= r_buffer_req_uop_bp_debug_if; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_bp_xcpt_if <= r_buffer_req_uop_bp_xcpt_if; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_debug_fsrc <= r_buffer_req_uop_debug_fsrc; // @[fdiv.scala 174:19]
    end
    if (may_fire_input & divsqrt_ready) begin // @[fdiv.scala 168:42]
      r_divsqrt_uop_debug_tsrc <= r_buffer_req_uop_debug_tsrc; // @[fdiv.scala 174:19]
    end
    if (reset) begin // @[fdiv.scala 182:26]
      r_out_val <= 1'h0; // @[fdiv.scala 182:26]
    end else if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_val <= ~r_divsqrt_killed & ~_T_37 & _T_3; // @[fdiv.scala 197:15]
    end else if (io_resp_ready | _T_52 | io_req_bits_kill) begin // @[fdiv.scala 191:88]
      r_out_val <= 1'h0; // @[fdiv.scala 192:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_uopc <= r_divsqrt_uop_uopc; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_inst <= r_divsqrt_uop_inst; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_debug_inst <= r_divsqrt_uop_debug_inst; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_is_rvc <= r_divsqrt_uop_is_rvc; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_debug_pc <= r_divsqrt_uop_debug_pc; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_iq_type <= r_divsqrt_uop_iq_type; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_fu_code <= r_divsqrt_uop_fu_code; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ctrl_br_type <= r_divsqrt_uop_ctrl_br_type; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ctrl_op1_sel <= r_divsqrt_uop_ctrl_op1_sel; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ctrl_op2_sel <= r_divsqrt_uop_ctrl_op2_sel; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ctrl_imm_sel <= r_divsqrt_uop_ctrl_imm_sel; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ctrl_op_fcn <= r_divsqrt_uop_ctrl_op_fcn; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ctrl_fcn_dw <= r_divsqrt_uop_ctrl_fcn_dw; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ctrl_csr_cmd <= r_divsqrt_uop_ctrl_csr_cmd; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ctrl_is_load <= r_divsqrt_uop_ctrl_is_load; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ctrl_is_sta <= r_divsqrt_uop_ctrl_is_sta; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ctrl_is_std <= r_divsqrt_uop_ctrl_is_std; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_iw_state <= r_divsqrt_uop_iw_state; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_iw_p1_poisoned <= r_divsqrt_uop_iw_p1_poisoned; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_iw_p2_poisoned <= r_divsqrt_uop_iw_p2_poisoned; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_is_br <= r_divsqrt_uop_is_br; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_is_jalr <= r_divsqrt_uop_is_jalr; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_is_jal <= r_divsqrt_uop_is_jal; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_is_sfb <= r_divsqrt_uop_is_sfb; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_br_mask <= _T_41; // @[fdiv.scala 199:23]
    end else begin
      r_out_uop_br_mask <= _T_50; // @[fdiv.scala 189:21]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_br_tag <= r_divsqrt_uop_br_tag; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ftq_idx <= r_divsqrt_uop_ftq_idx; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_edge_inst <= r_divsqrt_uop_edge_inst; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_pc_lob <= r_divsqrt_uop_pc_lob; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_taken <= r_divsqrt_uop_taken; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_imm_packed <= r_divsqrt_uop_imm_packed; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_csr_addr <= r_divsqrt_uop_csr_addr; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_rob_idx <= r_divsqrt_uop_rob_idx; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ldq_idx <= r_divsqrt_uop_ldq_idx; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_stq_idx <= r_divsqrt_uop_stq_idx; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_rxq_idx <= r_divsqrt_uop_rxq_idx; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_pdst <= r_divsqrt_uop_pdst; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_prs1 <= r_divsqrt_uop_prs1; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_prs2 <= r_divsqrt_uop_prs2; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_prs3 <= r_divsqrt_uop_prs3; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ppred <= r_divsqrt_uop_ppred; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_prs1_busy <= r_divsqrt_uop_prs1_busy; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_prs2_busy <= r_divsqrt_uop_prs2_busy; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_prs3_busy <= r_divsqrt_uop_prs3_busy; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ppred_busy <= r_divsqrt_uop_ppred_busy; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_stale_pdst <= r_divsqrt_uop_stale_pdst; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_exception <= r_divsqrt_uop_exception; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_exc_cause <= r_divsqrt_uop_exc_cause; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_bypassable <= r_divsqrt_uop_bypassable; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_mem_cmd <= r_divsqrt_uop_mem_cmd; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_mem_size <= r_divsqrt_uop_mem_size; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_mem_signed <= r_divsqrt_uop_mem_signed; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_is_fence <= r_divsqrt_uop_is_fence; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_is_fencei <= r_divsqrt_uop_is_fencei; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_is_amo <= r_divsqrt_uop_is_amo; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_uses_ldq <= r_divsqrt_uop_uses_ldq; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_uses_stq <= r_divsqrt_uop_uses_stq; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_is_sys_pc2epc <= r_divsqrt_uop_is_sys_pc2epc; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_is_unique <= r_divsqrt_uop_is_unique; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_flush_on_commit <= r_divsqrt_uop_flush_on_commit; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ldst_is_rs1 <= r_divsqrt_uop_ldst_is_rs1; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ldst <= r_divsqrt_uop_ldst; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_lrs1 <= r_divsqrt_uop_lrs1; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_lrs2 <= r_divsqrt_uop_lrs2; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_lrs3 <= r_divsqrt_uop_lrs3; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_ldst_val <= r_divsqrt_uop_ldst_val; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_dst_rtype <= r_divsqrt_uop_dst_rtype; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_lrs1_rtype <= r_divsqrt_uop_lrs1_rtype; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_lrs2_rtype <= r_divsqrt_uop_lrs2_rtype; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_frs3_en <= r_divsqrt_uop_frs3_en; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_fp_val <= r_divsqrt_uop_fp_val; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_fp_single <= r_divsqrt_uop_fp_single; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_xcpt_pf_if <= r_divsqrt_uop_xcpt_pf_if; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_xcpt_ae_if <= r_divsqrt_uop_xcpt_ae_if; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_xcpt_ma_if <= r_divsqrt_uop_xcpt_ma_if; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_bp_debug_if <= r_divsqrt_uop_bp_debug_if; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_bp_xcpt_if <= r_divsqrt_uop_bp_xcpt_if; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_debug_fsrc <= r_divsqrt_uop_debug_fsrc; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_uop_debug_tsrc <= r_divsqrt_uop_debug_tsrc; // @[fdiv.scala 198:15]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      r_out_flags_double <= divsqrt_io_exceptionFlags; // @[fdiv.scala 201:24]
    end
    if (divsqrt_io_outValid_div | divsqrt_io_outValid_sqrt) begin // @[fdiv.scala 194:62]
      if (_T_66) begin // @[FPU.scala 409:10]
        r_out_wdata_double <= maskedNaN;
      end else begin
        r_out_wdata_double <= divsqrt_io_out;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(r_buffer_val & io_req_valid) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [fdiv] a request is incoming while the buffer is already full.\n    at fdiv.scala:136 assert (!(r_buffer_val && io.req.valid), \"[fdiv] a request is incoming while the buffer is already full.\")\n"
            ); // @[fdiv.scala 136:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(r_buffer_val & io_req_valid) | reset)) begin
          $fatal; // @[fdiv.scala 136:10]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_55 & ~(r_divsqrt_val | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [fdiv] a response is being generated for no request.\n    at fdiv.scala:203 assert (r_divsqrt_val, \"[fdiv] a response is being generated for no request.\")\n"
            ); // @[fdiv.scala 203:12]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_55 & ~(r_divsqrt_val | reset)) begin
          $fatal; // @[fdiv.scala 203:12]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(r_out_val & _T_55) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [fdiv] Buffered output being overwritten by another output from the fdiv/fsqrt unit.\n    at fdiv.scala:206 assert (!(r_out_val && (divsqrt.io.outValid_div || divsqrt.io.outValid_sqrt)),\n"
            ); // @[fdiv.scala 206:10]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(r_out_val & _T_55) | reset)) begin
          $fatal; // @[fdiv.scala 206:10]
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
  r_buffer_val = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  r_buffer_req_uop_uopc = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  r_buffer_req_uop_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  r_buffer_req_uop_debug_inst = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  r_buffer_req_uop_is_rvc = _RAND_4[0:0];
  _RAND_5 = {2{`RANDOM}};
  r_buffer_req_uop_debug_pc = _RAND_5[39:0];
  _RAND_6 = {1{`RANDOM}};
  r_buffer_req_uop_iq_type = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  r_buffer_req_uop_fu_code = _RAND_7[9:0];
  _RAND_8 = {1{`RANDOM}};
  r_buffer_req_uop_ctrl_br_type = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  r_buffer_req_uop_ctrl_op1_sel = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  r_buffer_req_uop_ctrl_op2_sel = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  r_buffer_req_uop_ctrl_imm_sel = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  r_buffer_req_uop_ctrl_op_fcn = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  r_buffer_req_uop_ctrl_fcn_dw = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  r_buffer_req_uop_ctrl_csr_cmd = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  r_buffer_req_uop_ctrl_is_load = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  r_buffer_req_uop_ctrl_is_sta = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  r_buffer_req_uop_ctrl_is_std = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  r_buffer_req_uop_iw_state = _RAND_18[1:0];
  _RAND_19 = {1{`RANDOM}};
  r_buffer_req_uop_iw_p1_poisoned = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  r_buffer_req_uop_iw_p2_poisoned = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  r_buffer_req_uop_is_br = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  r_buffer_req_uop_is_jalr = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  r_buffer_req_uop_is_jal = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  r_buffer_req_uop_is_sfb = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  r_buffer_req_uop_br_mask = _RAND_25[11:0];
  _RAND_26 = {1{`RANDOM}};
  r_buffer_req_uop_br_tag = _RAND_26[3:0];
  _RAND_27 = {1{`RANDOM}};
  r_buffer_req_uop_ftq_idx = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  r_buffer_req_uop_edge_inst = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  r_buffer_req_uop_pc_lob = _RAND_29[5:0];
  _RAND_30 = {1{`RANDOM}};
  r_buffer_req_uop_taken = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  r_buffer_req_uop_imm_packed = _RAND_31[19:0];
  _RAND_32 = {1{`RANDOM}};
  r_buffer_req_uop_csr_addr = _RAND_32[11:0];
  _RAND_33 = {1{`RANDOM}};
  r_buffer_req_uop_rob_idx = _RAND_33[5:0];
  _RAND_34 = {1{`RANDOM}};
  r_buffer_req_uop_ldq_idx = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  r_buffer_req_uop_stq_idx = _RAND_35[3:0];
  _RAND_36 = {1{`RANDOM}};
  r_buffer_req_uop_rxq_idx = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  r_buffer_req_uop_pdst = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  r_buffer_req_uop_prs1 = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  r_buffer_req_uop_prs2 = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  r_buffer_req_uop_prs3 = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  r_buffer_req_uop_ppred = _RAND_41[4:0];
  _RAND_42 = {1{`RANDOM}};
  r_buffer_req_uop_prs1_busy = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  r_buffer_req_uop_prs2_busy = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  r_buffer_req_uop_prs3_busy = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  r_buffer_req_uop_ppred_busy = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  r_buffer_req_uop_stale_pdst = _RAND_46[5:0];
  _RAND_47 = {1{`RANDOM}};
  r_buffer_req_uop_exception = _RAND_47[0:0];
  _RAND_48 = {2{`RANDOM}};
  r_buffer_req_uop_exc_cause = _RAND_48[63:0];
  _RAND_49 = {1{`RANDOM}};
  r_buffer_req_uop_bypassable = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  r_buffer_req_uop_mem_cmd = _RAND_50[4:0];
  _RAND_51 = {1{`RANDOM}};
  r_buffer_req_uop_mem_size = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  r_buffer_req_uop_mem_signed = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  r_buffer_req_uop_is_fence = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  r_buffer_req_uop_is_fencei = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  r_buffer_req_uop_is_amo = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  r_buffer_req_uop_uses_ldq = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  r_buffer_req_uop_uses_stq = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  r_buffer_req_uop_is_sys_pc2epc = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  r_buffer_req_uop_is_unique = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  r_buffer_req_uop_flush_on_commit = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  r_buffer_req_uop_ldst_is_rs1 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  r_buffer_req_uop_ldst = _RAND_62[5:0];
  _RAND_63 = {1{`RANDOM}};
  r_buffer_req_uop_lrs1 = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  r_buffer_req_uop_lrs2 = _RAND_64[5:0];
  _RAND_65 = {1{`RANDOM}};
  r_buffer_req_uop_lrs3 = _RAND_65[5:0];
  _RAND_66 = {1{`RANDOM}};
  r_buffer_req_uop_ldst_val = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  r_buffer_req_uop_dst_rtype = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  r_buffer_req_uop_lrs1_rtype = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  r_buffer_req_uop_lrs2_rtype = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  r_buffer_req_uop_frs3_en = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  r_buffer_req_uop_fp_val = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  r_buffer_req_uop_fp_single = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  r_buffer_req_uop_xcpt_pf_if = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  r_buffer_req_uop_xcpt_ae_if = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  r_buffer_req_uop_xcpt_ma_if = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  r_buffer_req_uop_bp_debug_if = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  r_buffer_req_uop_bp_xcpt_if = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  r_buffer_req_uop_debug_fsrc = _RAND_78[1:0];
  _RAND_79 = {1{`RANDOM}};
  r_buffer_req_uop_debug_tsrc = _RAND_79[1:0];
  _RAND_80 = {1{`RANDOM}};
  r_buffer_fin_typeTagIn = _RAND_80[1:0];
  _RAND_81 = {1{`RANDOM}};
  r_buffer_fin_div = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  r_buffer_fin_sqrt = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  r_buffer_fin_rm = _RAND_83[2:0];
  _RAND_84 = {3{`RANDOM}};
  r_buffer_fin_in1 = _RAND_84[64:0];
  _RAND_85 = {3{`RANDOM}};
  r_buffer_fin_in2 = _RAND_85[64:0];
  _RAND_86 = {1{`RANDOM}};
  r_divsqrt_val = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  r_divsqrt_killed = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  r_divsqrt_fin_typeTagIn = _RAND_88[1:0];
  _RAND_89 = {1{`RANDOM}};
  r_divsqrt_fin_rm = _RAND_89[2:0];
  _RAND_90 = {1{`RANDOM}};
  r_divsqrt_uop_uopc = _RAND_90[6:0];
  _RAND_91 = {1{`RANDOM}};
  r_divsqrt_uop_inst = _RAND_91[31:0];
  _RAND_92 = {1{`RANDOM}};
  r_divsqrt_uop_debug_inst = _RAND_92[31:0];
  _RAND_93 = {1{`RANDOM}};
  r_divsqrt_uop_is_rvc = _RAND_93[0:0];
  _RAND_94 = {2{`RANDOM}};
  r_divsqrt_uop_debug_pc = _RAND_94[39:0];
  _RAND_95 = {1{`RANDOM}};
  r_divsqrt_uop_iq_type = _RAND_95[2:0];
  _RAND_96 = {1{`RANDOM}};
  r_divsqrt_uop_fu_code = _RAND_96[9:0];
  _RAND_97 = {1{`RANDOM}};
  r_divsqrt_uop_ctrl_br_type = _RAND_97[3:0];
  _RAND_98 = {1{`RANDOM}};
  r_divsqrt_uop_ctrl_op1_sel = _RAND_98[1:0];
  _RAND_99 = {1{`RANDOM}};
  r_divsqrt_uop_ctrl_op2_sel = _RAND_99[2:0];
  _RAND_100 = {1{`RANDOM}};
  r_divsqrt_uop_ctrl_imm_sel = _RAND_100[2:0];
  _RAND_101 = {1{`RANDOM}};
  r_divsqrt_uop_ctrl_op_fcn = _RAND_101[3:0];
  _RAND_102 = {1{`RANDOM}};
  r_divsqrt_uop_ctrl_fcn_dw = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  r_divsqrt_uop_ctrl_csr_cmd = _RAND_103[2:0];
  _RAND_104 = {1{`RANDOM}};
  r_divsqrt_uop_ctrl_is_load = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  r_divsqrt_uop_ctrl_is_sta = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  r_divsqrt_uop_ctrl_is_std = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  r_divsqrt_uop_iw_state = _RAND_107[1:0];
  _RAND_108 = {1{`RANDOM}};
  r_divsqrt_uop_iw_p1_poisoned = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  r_divsqrt_uop_iw_p2_poisoned = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  r_divsqrt_uop_is_br = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  r_divsqrt_uop_is_jalr = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  r_divsqrt_uop_is_jal = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  r_divsqrt_uop_is_sfb = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  r_divsqrt_uop_br_mask = _RAND_114[11:0];
  _RAND_115 = {1{`RANDOM}};
  r_divsqrt_uop_br_tag = _RAND_115[3:0];
  _RAND_116 = {1{`RANDOM}};
  r_divsqrt_uop_ftq_idx = _RAND_116[4:0];
  _RAND_117 = {1{`RANDOM}};
  r_divsqrt_uop_edge_inst = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  r_divsqrt_uop_pc_lob = _RAND_118[5:0];
  _RAND_119 = {1{`RANDOM}};
  r_divsqrt_uop_taken = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  r_divsqrt_uop_imm_packed = _RAND_120[19:0];
  _RAND_121 = {1{`RANDOM}};
  r_divsqrt_uop_csr_addr = _RAND_121[11:0];
  _RAND_122 = {1{`RANDOM}};
  r_divsqrt_uop_rob_idx = _RAND_122[5:0];
  _RAND_123 = {1{`RANDOM}};
  r_divsqrt_uop_ldq_idx = _RAND_123[3:0];
  _RAND_124 = {1{`RANDOM}};
  r_divsqrt_uop_stq_idx = _RAND_124[3:0];
  _RAND_125 = {1{`RANDOM}};
  r_divsqrt_uop_rxq_idx = _RAND_125[1:0];
  _RAND_126 = {1{`RANDOM}};
  r_divsqrt_uop_pdst = _RAND_126[5:0];
  _RAND_127 = {1{`RANDOM}};
  r_divsqrt_uop_prs1 = _RAND_127[5:0];
  _RAND_128 = {1{`RANDOM}};
  r_divsqrt_uop_prs2 = _RAND_128[5:0];
  _RAND_129 = {1{`RANDOM}};
  r_divsqrt_uop_prs3 = _RAND_129[5:0];
  _RAND_130 = {1{`RANDOM}};
  r_divsqrt_uop_ppred = _RAND_130[4:0];
  _RAND_131 = {1{`RANDOM}};
  r_divsqrt_uop_prs1_busy = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  r_divsqrt_uop_prs2_busy = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  r_divsqrt_uop_prs3_busy = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  r_divsqrt_uop_ppred_busy = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  r_divsqrt_uop_stale_pdst = _RAND_135[5:0];
  _RAND_136 = {1{`RANDOM}};
  r_divsqrt_uop_exception = _RAND_136[0:0];
  _RAND_137 = {2{`RANDOM}};
  r_divsqrt_uop_exc_cause = _RAND_137[63:0];
  _RAND_138 = {1{`RANDOM}};
  r_divsqrt_uop_bypassable = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  r_divsqrt_uop_mem_cmd = _RAND_139[4:0];
  _RAND_140 = {1{`RANDOM}};
  r_divsqrt_uop_mem_size = _RAND_140[1:0];
  _RAND_141 = {1{`RANDOM}};
  r_divsqrt_uop_mem_signed = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  r_divsqrt_uop_is_fence = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  r_divsqrt_uop_is_fencei = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  r_divsqrt_uop_is_amo = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  r_divsqrt_uop_uses_ldq = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  r_divsqrt_uop_uses_stq = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  r_divsqrt_uop_is_sys_pc2epc = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  r_divsqrt_uop_is_unique = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  r_divsqrt_uop_flush_on_commit = _RAND_149[0:0];
  _RAND_150 = {1{`RANDOM}};
  r_divsqrt_uop_ldst_is_rs1 = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  r_divsqrt_uop_ldst = _RAND_151[5:0];
  _RAND_152 = {1{`RANDOM}};
  r_divsqrt_uop_lrs1 = _RAND_152[5:0];
  _RAND_153 = {1{`RANDOM}};
  r_divsqrt_uop_lrs2 = _RAND_153[5:0];
  _RAND_154 = {1{`RANDOM}};
  r_divsqrt_uop_lrs3 = _RAND_154[5:0];
  _RAND_155 = {1{`RANDOM}};
  r_divsqrt_uop_ldst_val = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  r_divsqrt_uop_dst_rtype = _RAND_156[1:0];
  _RAND_157 = {1{`RANDOM}};
  r_divsqrt_uop_lrs1_rtype = _RAND_157[1:0];
  _RAND_158 = {1{`RANDOM}};
  r_divsqrt_uop_lrs2_rtype = _RAND_158[1:0];
  _RAND_159 = {1{`RANDOM}};
  r_divsqrt_uop_frs3_en = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  r_divsqrt_uop_fp_val = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  r_divsqrt_uop_fp_single = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  r_divsqrt_uop_xcpt_pf_if = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  r_divsqrt_uop_xcpt_ae_if = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  r_divsqrt_uop_xcpt_ma_if = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  r_divsqrt_uop_bp_debug_if = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  r_divsqrt_uop_bp_xcpt_if = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  r_divsqrt_uop_debug_fsrc = _RAND_167[1:0];
  _RAND_168 = {1{`RANDOM}};
  r_divsqrt_uop_debug_tsrc = _RAND_168[1:0];
  _RAND_169 = {1{`RANDOM}};
  r_out_val = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  r_out_uop_uopc = _RAND_170[6:0];
  _RAND_171 = {1{`RANDOM}};
  r_out_uop_inst = _RAND_171[31:0];
  _RAND_172 = {1{`RANDOM}};
  r_out_uop_debug_inst = _RAND_172[31:0];
  _RAND_173 = {1{`RANDOM}};
  r_out_uop_is_rvc = _RAND_173[0:0];
  _RAND_174 = {2{`RANDOM}};
  r_out_uop_debug_pc = _RAND_174[39:0];
  _RAND_175 = {1{`RANDOM}};
  r_out_uop_iq_type = _RAND_175[2:0];
  _RAND_176 = {1{`RANDOM}};
  r_out_uop_fu_code = _RAND_176[9:0];
  _RAND_177 = {1{`RANDOM}};
  r_out_uop_ctrl_br_type = _RAND_177[3:0];
  _RAND_178 = {1{`RANDOM}};
  r_out_uop_ctrl_op1_sel = _RAND_178[1:0];
  _RAND_179 = {1{`RANDOM}};
  r_out_uop_ctrl_op2_sel = _RAND_179[2:0];
  _RAND_180 = {1{`RANDOM}};
  r_out_uop_ctrl_imm_sel = _RAND_180[2:0];
  _RAND_181 = {1{`RANDOM}};
  r_out_uop_ctrl_op_fcn = _RAND_181[3:0];
  _RAND_182 = {1{`RANDOM}};
  r_out_uop_ctrl_fcn_dw = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  r_out_uop_ctrl_csr_cmd = _RAND_183[2:0];
  _RAND_184 = {1{`RANDOM}};
  r_out_uop_ctrl_is_load = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  r_out_uop_ctrl_is_sta = _RAND_185[0:0];
  _RAND_186 = {1{`RANDOM}};
  r_out_uop_ctrl_is_std = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  r_out_uop_iw_state = _RAND_187[1:0];
  _RAND_188 = {1{`RANDOM}};
  r_out_uop_iw_p1_poisoned = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  r_out_uop_iw_p2_poisoned = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  r_out_uop_is_br = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  r_out_uop_is_jalr = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  r_out_uop_is_jal = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  r_out_uop_is_sfb = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  r_out_uop_br_mask = _RAND_194[11:0];
  _RAND_195 = {1{`RANDOM}};
  r_out_uop_br_tag = _RAND_195[3:0];
  _RAND_196 = {1{`RANDOM}};
  r_out_uop_ftq_idx = _RAND_196[4:0];
  _RAND_197 = {1{`RANDOM}};
  r_out_uop_edge_inst = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  r_out_uop_pc_lob = _RAND_198[5:0];
  _RAND_199 = {1{`RANDOM}};
  r_out_uop_taken = _RAND_199[0:0];
  _RAND_200 = {1{`RANDOM}};
  r_out_uop_imm_packed = _RAND_200[19:0];
  _RAND_201 = {1{`RANDOM}};
  r_out_uop_csr_addr = _RAND_201[11:0];
  _RAND_202 = {1{`RANDOM}};
  r_out_uop_rob_idx = _RAND_202[5:0];
  _RAND_203 = {1{`RANDOM}};
  r_out_uop_ldq_idx = _RAND_203[3:0];
  _RAND_204 = {1{`RANDOM}};
  r_out_uop_stq_idx = _RAND_204[3:0];
  _RAND_205 = {1{`RANDOM}};
  r_out_uop_rxq_idx = _RAND_205[1:0];
  _RAND_206 = {1{`RANDOM}};
  r_out_uop_pdst = _RAND_206[5:0];
  _RAND_207 = {1{`RANDOM}};
  r_out_uop_prs1 = _RAND_207[5:0];
  _RAND_208 = {1{`RANDOM}};
  r_out_uop_prs2 = _RAND_208[5:0];
  _RAND_209 = {1{`RANDOM}};
  r_out_uop_prs3 = _RAND_209[5:0];
  _RAND_210 = {1{`RANDOM}};
  r_out_uop_ppred = _RAND_210[4:0];
  _RAND_211 = {1{`RANDOM}};
  r_out_uop_prs1_busy = _RAND_211[0:0];
  _RAND_212 = {1{`RANDOM}};
  r_out_uop_prs2_busy = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  r_out_uop_prs3_busy = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  r_out_uop_ppred_busy = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  r_out_uop_stale_pdst = _RAND_215[5:0];
  _RAND_216 = {1{`RANDOM}};
  r_out_uop_exception = _RAND_216[0:0];
  _RAND_217 = {2{`RANDOM}};
  r_out_uop_exc_cause = _RAND_217[63:0];
  _RAND_218 = {1{`RANDOM}};
  r_out_uop_bypassable = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  r_out_uop_mem_cmd = _RAND_219[4:0];
  _RAND_220 = {1{`RANDOM}};
  r_out_uop_mem_size = _RAND_220[1:0];
  _RAND_221 = {1{`RANDOM}};
  r_out_uop_mem_signed = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  r_out_uop_is_fence = _RAND_222[0:0];
  _RAND_223 = {1{`RANDOM}};
  r_out_uop_is_fencei = _RAND_223[0:0];
  _RAND_224 = {1{`RANDOM}};
  r_out_uop_is_amo = _RAND_224[0:0];
  _RAND_225 = {1{`RANDOM}};
  r_out_uop_uses_ldq = _RAND_225[0:0];
  _RAND_226 = {1{`RANDOM}};
  r_out_uop_uses_stq = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  r_out_uop_is_sys_pc2epc = _RAND_227[0:0];
  _RAND_228 = {1{`RANDOM}};
  r_out_uop_is_unique = _RAND_228[0:0];
  _RAND_229 = {1{`RANDOM}};
  r_out_uop_flush_on_commit = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  r_out_uop_ldst_is_rs1 = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  r_out_uop_ldst = _RAND_231[5:0];
  _RAND_232 = {1{`RANDOM}};
  r_out_uop_lrs1 = _RAND_232[5:0];
  _RAND_233 = {1{`RANDOM}};
  r_out_uop_lrs2 = _RAND_233[5:0];
  _RAND_234 = {1{`RANDOM}};
  r_out_uop_lrs3 = _RAND_234[5:0];
  _RAND_235 = {1{`RANDOM}};
  r_out_uop_ldst_val = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  r_out_uop_dst_rtype = _RAND_236[1:0];
  _RAND_237 = {1{`RANDOM}};
  r_out_uop_lrs1_rtype = _RAND_237[1:0];
  _RAND_238 = {1{`RANDOM}};
  r_out_uop_lrs2_rtype = _RAND_238[1:0];
  _RAND_239 = {1{`RANDOM}};
  r_out_uop_frs3_en = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  r_out_uop_fp_val = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  r_out_uop_fp_single = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  r_out_uop_xcpt_pf_if = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  r_out_uop_xcpt_ae_if = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  r_out_uop_xcpt_ma_if = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  r_out_uop_bp_debug_if = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  r_out_uop_bp_xcpt_if = _RAND_246[0:0];
  _RAND_247 = {1{`RANDOM}};
  r_out_uop_debug_fsrc = _RAND_247[1:0];
  _RAND_248 = {1{`RANDOM}};
  r_out_uop_debug_tsrc = _RAND_248[1:0];
  _RAND_249 = {1{`RANDOM}};
  r_out_flags_double = _RAND_249[4:0];
  _RAND_250 = {3{`RANDOM}};
  r_out_wdata_double = _RAND_250[64:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
