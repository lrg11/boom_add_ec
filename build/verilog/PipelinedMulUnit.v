module PipelinedMulUnit(
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
  input  [63:0] io_req_bits_rs1_data,
  input  [63:0] io_req_bits_rs2_data,
  input  [63:0] io_req_bits_rs3_data,
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
  output [63:0] io_resp_bits_data,
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
  input  [20:0] io_brupdate_b2_target_offset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
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
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [63:0] _RAND_50;
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
  reg [31:0] _RAND_85;
  reg [63:0] _RAND_86;
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
  reg [31:0] _RAND_128;
  reg [63:0] _RAND_129;
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
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [31:0] _RAND_163;
  reg [31:0] _RAND_164;
  reg [63:0] _RAND_165;
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
  reg [63:0] _RAND_208;
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
`endif // RANDOMIZE_REG_INIT
  wire  imul_clock; // @[functional-unit.scala 708:20]
  wire  imul_reset; // @[functional-unit.scala 708:20]
  wire  imul_io_req_valid; // @[functional-unit.scala 708:20]
  wire [3:0] imul_io_req_bits_fn; // @[functional-unit.scala 708:20]
  wire  imul_io_req_bits_dw; // @[functional-unit.scala 708:20]
  wire [63:0] imul_io_req_bits_in1; // @[functional-unit.scala 708:20]
  wire [63:0] imul_io_req_bits_in2; // @[functional-unit.scala 708:20]
  wire [4:0] imul_io_req_bits_tag; // @[functional-unit.scala 708:20]
  wire  imul_io_resp_valid; // @[functional-unit.scala 708:20]
  wire [63:0] imul_io_resp_bits_data; // @[functional-unit.scala 708:20]
  wire [4:0] imul_io_resp_bits_tag; // @[functional-unit.scala 708:20]
  reg  REG__0; // @[functional-unit.scala 228:27]
  reg  REG__1; // @[functional-unit.scala 228:27]
  reg  REG__2; // @[functional-unit.scala 228:27]
  reg [6:0] REG_1_0_uopc; // @[functional-unit.scala 229:23]
  reg [31:0] REG_1_0_inst; // @[functional-unit.scala 229:23]
  reg [31:0] REG_1_0_debug_inst; // @[functional-unit.scala 229:23]
  reg  REG_1_0_is_rvc; // @[functional-unit.scala 229:23]
  reg [39:0] REG_1_0_debug_pc; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_0_iq_type; // @[functional-unit.scala 229:23]
  reg [9:0] REG_1_0_fu_code; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_0_ctrl_br_type; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_0_ctrl_op1_sel; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_0_ctrl_op2_sel; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_0_ctrl_imm_sel; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_0_ctrl_op_fcn; // @[functional-unit.scala 229:23]
  reg  REG_1_0_ctrl_fcn_dw; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_0_ctrl_csr_cmd; // @[functional-unit.scala 229:23]
  reg  REG_1_0_ctrl_is_load; // @[functional-unit.scala 229:23]
  reg  REG_1_0_ctrl_is_sta; // @[functional-unit.scala 229:23]
  reg  REG_1_0_ctrl_is_std; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_0_iw_state; // @[functional-unit.scala 229:23]
  reg  REG_1_0_iw_p1_poisoned; // @[functional-unit.scala 229:23]
  reg  REG_1_0_iw_p2_poisoned; // @[functional-unit.scala 229:23]
  reg  REG_1_0_is_br; // @[functional-unit.scala 229:23]
  reg  REG_1_0_is_jalr; // @[functional-unit.scala 229:23]
  reg  REG_1_0_is_jal; // @[functional-unit.scala 229:23]
  reg  REG_1_0_is_sfb; // @[functional-unit.scala 229:23]
  reg [11:0] REG_1_0_br_mask; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_0_br_tag; // @[functional-unit.scala 229:23]
  reg [4:0] REG_1_0_ftq_idx; // @[functional-unit.scala 229:23]
  reg  REG_1_0_edge_inst; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_0_pc_lob; // @[functional-unit.scala 229:23]
  reg  REG_1_0_taken; // @[functional-unit.scala 229:23]
  reg [19:0] REG_1_0_imm_packed; // @[functional-unit.scala 229:23]
  reg [11:0] REG_1_0_csr_addr; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_0_rob_idx; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_0_ldq_idx; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_0_stq_idx; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_0_rxq_idx; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_0_pdst; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_0_prs1; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_0_prs2; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_0_prs3; // @[functional-unit.scala 229:23]
  reg [4:0] REG_1_0_ppred; // @[functional-unit.scala 229:23]
  reg  REG_1_0_prs1_busy; // @[functional-unit.scala 229:23]
  reg  REG_1_0_prs2_busy; // @[functional-unit.scala 229:23]
  reg  REG_1_0_prs3_busy; // @[functional-unit.scala 229:23]
  reg  REG_1_0_ppred_busy; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_0_stale_pdst; // @[functional-unit.scala 229:23]
  reg  REG_1_0_exception; // @[functional-unit.scala 229:23]
  reg [63:0] REG_1_0_exc_cause; // @[functional-unit.scala 229:23]
  reg  REG_1_0_bypassable; // @[functional-unit.scala 229:23]
  reg [4:0] REG_1_0_mem_cmd; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_0_mem_size; // @[functional-unit.scala 229:23]
  reg  REG_1_0_mem_signed; // @[functional-unit.scala 229:23]
  reg  REG_1_0_is_fence; // @[functional-unit.scala 229:23]
  reg  REG_1_0_is_fencei; // @[functional-unit.scala 229:23]
  reg  REG_1_0_is_amo; // @[functional-unit.scala 229:23]
  reg  REG_1_0_uses_ldq; // @[functional-unit.scala 229:23]
  reg  REG_1_0_uses_stq; // @[functional-unit.scala 229:23]
  reg  REG_1_0_is_sys_pc2epc; // @[functional-unit.scala 229:23]
  reg  REG_1_0_is_unique; // @[functional-unit.scala 229:23]
  reg  REG_1_0_flush_on_commit; // @[functional-unit.scala 229:23]
  reg  REG_1_0_ldst_is_rs1; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_0_ldst; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_0_lrs1; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_0_lrs2; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_0_lrs3; // @[functional-unit.scala 229:23]
  reg  REG_1_0_ldst_val; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_0_dst_rtype; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_0_lrs1_rtype; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_0_lrs2_rtype; // @[functional-unit.scala 229:23]
  reg  REG_1_0_frs3_en; // @[functional-unit.scala 229:23]
  reg  REG_1_0_fp_val; // @[functional-unit.scala 229:23]
  reg  REG_1_0_fp_single; // @[functional-unit.scala 229:23]
  reg  REG_1_0_xcpt_pf_if; // @[functional-unit.scala 229:23]
  reg  REG_1_0_xcpt_ae_if; // @[functional-unit.scala 229:23]
  reg  REG_1_0_xcpt_ma_if; // @[functional-unit.scala 229:23]
  reg  REG_1_0_bp_debug_if; // @[functional-unit.scala 229:23]
  reg  REG_1_0_bp_xcpt_if; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_0_debug_fsrc; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_0_debug_tsrc; // @[functional-unit.scala 229:23]
  reg [6:0] REG_1_1_uopc; // @[functional-unit.scala 229:23]
  reg [31:0] REG_1_1_inst; // @[functional-unit.scala 229:23]
  reg [31:0] REG_1_1_debug_inst; // @[functional-unit.scala 229:23]
  reg  REG_1_1_is_rvc; // @[functional-unit.scala 229:23]
  reg [39:0] REG_1_1_debug_pc; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_1_iq_type; // @[functional-unit.scala 229:23]
  reg [9:0] REG_1_1_fu_code; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_1_ctrl_br_type; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_1_ctrl_op1_sel; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_1_ctrl_op2_sel; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_1_ctrl_imm_sel; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_1_ctrl_op_fcn; // @[functional-unit.scala 229:23]
  reg  REG_1_1_ctrl_fcn_dw; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_1_ctrl_csr_cmd; // @[functional-unit.scala 229:23]
  reg  REG_1_1_ctrl_is_load; // @[functional-unit.scala 229:23]
  reg  REG_1_1_ctrl_is_sta; // @[functional-unit.scala 229:23]
  reg  REG_1_1_ctrl_is_std; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_1_iw_state; // @[functional-unit.scala 229:23]
  reg  REG_1_1_iw_p1_poisoned; // @[functional-unit.scala 229:23]
  reg  REG_1_1_iw_p2_poisoned; // @[functional-unit.scala 229:23]
  reg  REG_1_1_is_br; // @[functional-unit.scala 229:23]
  reg  REG_1_1_is_jalr; // @[functional-unit.scala 229:23]
  reg  REG_1_1_is_jal; // @[functional-unit.scala 229:23]
  reg  REG_1_1_is_sfb; // @[functional-unit.scala 229:23]
  reg [11:0] REG_1_1_br_mask; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_1_br_tag; // @[functional-unit.scala 229:23]
  reg [4:0] REG_1_1_ftq_idx; // @[functional-unit.scala 229:23]
  reg  REG_1_1_edge_inst; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_1_pc_lob; // @[functional-unit.scala 229:23]
  reg  REG_1_1_taken; // @[functional-unit.scala 229:23]
  reg [19:0] REG_1_1_imm_packed; // @[functional-unit.scala 229:23]
  reg [11:0] REG_1_1_csr_addr; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_1_rob_idx; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_1_ldq_idx; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_1_stq_idx; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_1_rxq_idx; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_1_pdst; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_1_prs1; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_1_prs2; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_1_prs3; // @[functional-unit.scala 229:23]
  reg [4:0] REG_1_1_ppred; // @[functional-unit.scala 229:23]
  reg  REG_1_1_prs1_busy; // @[functional-unit.scala 229:23]
  reg  REG_1_1_prs2_busy; // @[functional-unit.scala 229:23]
  reg  REG_1_1_prs3_busy; // @[functional-unit.scala 229:23]
  reg  REG_1_1_ppred_busy; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_1_stale_pdst; // @[functional-unit.scala 229:23]
  reg  REG_1_1_exception; // @[functional-unit.scala 229:23]
  reg [63:0] REG_1_1_exc_cause; // @[functional-unit.scala 229:23]
  reg  REG_1_1_bypassable; // @[functional-unit.scala 229:23]
  reg [4:0] REG_1_1_mem_cmd; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_1_mem_size; // @[functional-unit.scala 229:23]
  reg  REG_1_1_mem_signed; // @[functional-unit.scala 229:23]
  reg  REG_1_1_is_fence; // @[functional-unit.scala 229:23]
  reg  REG_1_1_is_fencei; // @[functional-unit.scala 229:23]
  reg  REG_1_1_is_amo; // @[functional-unit.scala 229:23]
  reg  REG_1_1_uses_ldq; // @[functional-unit.scala 229:23]
  reg  REG_1_1_uses_stq; // @[functional-unit.scala 229:23]
  reg  REG_1_1_is_sys_pc2epc; // @[functional-unit.scala 229:23]
  reg  REG_1_1_is_unique; // @[functional-unit.scala 229:23]
  reg  REG_1_1_flush_on_commit; // @[functional-unit.scala 229:23]
  reg  REG_1_1_ldst_is_rs1; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_1_ldst; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_1_lrs1; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_1_lrs2; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_1_lrs3; // @[functional-unit.scala 229:23]
  reg  REG_1_1_ldst_val; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_1_dst_rtype; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_1_lrs1_rtype; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_1_lrs2_rtype; // @[functional-unit.scala 229:23]
  reg  REG_1_1_frs3_en; // @[functional-unit.scala 229:23]
  reg  REG_1_1_fp_val; // @[functional-unit.scala 229:23]
  reg  REG_1_1_fp_single; // @[functional-unit.scala 229:23]
  reg  REG_1_1_xcpt_pf_if; // @[functional-unit.scala 229:23]
  reg  REG_1_1_xcpt_ae_if; // @[functional-unit.scala 229:23]
  reg  REG_1_1_xcpt_ma_if; // @[functional-unit.scala 229:23]
  reg  REG_1_1_bp_debug_if; // @[functional-unit.scala 229:23]
  reg  REG_1_1_bp_xcpt_if; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_1_debug_fsrc; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_1_debug_tsrc; // @[functional-unit.scala 229:23]
  reg [6:0] REG_1_2_uopc; // @[functional-unit.scala 229:23]
  reg [31:0] REG_1_2_inst; // @[functional-unit.scala 229:23]
  reg [31:0] REG_1_2_debug_inst; // @[functional-unit.scala 229:23]
  reg  REG_1_2_is_rvc; // @[functional-unit.scala 229:23]
  reg [39:0] REG_1_2_debug_pc; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_2_iq_type; // @[functional-unit.scala 229:23]
  reg [9:0] REG_1_2_fu_code; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_2_ctrl_br_type; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_2_ctrl_op1_sel; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_2_ctrl_op2_sel; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_2_ctrl_imm_sel; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_2_ctrl_op_fcn; // @[functional-unit.scala 229:23]
  reg  REG_1_2_ctrl_fcn_dw; // @[functional-unit.scala 229:23]
  reg [2:0] REG_1_2_ctrl_csr_cmd; // @[functional-unit.scala 229:23]
  reg  REG_1_2_ctrl_is_load; // @[functional-unit.scala 229:23]
  reg  REG_1_2_ctrl_is_sta; // @[functional-unit.scala 229:23]
  reg  REG_1_2_ctrl_is_std; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_2_iw_state; // @[functional-unit.scala 229:23]
  reg  REG_1_2_iw_p1_poisoned; // @[functional-unit.scala 229:23]
  reg  REG_1_2_iw_p2_poisoned; // @[functional-unit.scala 229:23]
  reg  REG_1_2_is_br; // @[functional-unit.scala 229:23]
  reg  REG_1_2_is_jalr; // @[functional-unit.scala 229:23]
  reg  REG_1_2_is_jal; // @[functional-unit.scala 229:23]
  reg  REG_1_2_is_sfb; // @[functional-unit.scala 229:23]
  reg [11:0] REG_1_2_br_mask; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_2_br_tag; // @[functional-unit.scala 229:23]
  reg [4:0] REG_1_2_ftq_idx; // @[functional-unit.scala 229:23]
  reg  REG_1_2_edge_inst; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_2_pc_lob; // @[functional-unit.scala 229:23]
  reg  REG_1_2_taken; // @[functional-unit.scala 229:23]
  reg [19:0] REG_1_2_imm_packed; // @[functional-unit.scala 229:23]
  reg [11:0] REG_1_2_csr_addr; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_2_rob_idx; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_2_ldq_idx; // @[functional-unit.scala 229:23]
  reg [3:0] REG_1_2_stq_idx; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_2_rxq_idx; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_2_pdst; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_2_prs1; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_2_prs2; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_2_prs3; // @[functional-unit.scala 229:23]
  reg [4:0] REG_1_2_ppred; // @[functional-unit.scala 229:23]
  reg  REG_1_2_prs1_busy; // @[functional-unit.scala 229:23]
  reg  REG_1_2_prs2_busy; // @[functional-unit.scala 229:23]
  reg  REG_1_2_prs3_busy; // @[functional-unit.scala 229:23]
  reg  REG_1_2_ppred_busy; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_2_stale_pdst; // @[functional-unit.scala 229:23]
  reg  REG_1_2_exception; // @[functional-unit.scala 229:23]
  reg [63:0] REG_1_2_exc_cause; // @[functional-unit.scala 229:23]
  reg  REG_1_2_bypassable; // @[functional-unit.scala 229:23]
  reg [4:0] REG_1_2_mem_cmd; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_2_mem_size; // @[functional-unit.scala 229:23]
  reg  REG_1_2_mem_signed; // @[functional-unit.scala 229:23]
  reg  REG_1_2_is_fence; // @[functional-unit.scala 229:23]
  reg  REG_1_2_is_fencei; // @[functional-unit.scala 229:23]
  reg  REG_1_2_is_amo; // @[functional-unit.scala 229:23]
  reg  REG_1_2_uses_ldq; // @[functional-unit.scala 229:23]
  reg  REG_1_2_uses_stq; // @[functional-unit.scala 229:23]
  reg  REG_1_2_is_sys_pc2epc; // @[functional-unit.scala 229:23]
  reg  REG_1_2_is_unique; // @[functional-unit.scala 229:23]
  reg  REG_1_2_flush_on_commit; // @[functional-unit.scala 229:23]
  reg  REG_1_2_ldst_is_rs1; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_2_ldst; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_2_lrs1; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_2_lrs2; // @[functional-unit.scala 229:23]
  reg [5:0] REG_1_2_lrs3; // @[functional-unit.scala 229:23]
  reg  REG_1_2_ldst_val; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_2_dst_rtype; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_2_lrs1_rtype; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_2_lrs2_rtype; // @[functional-unit.scala 229:23]
  reg  REG_1_2_frs3_en; // @[functional-unit.scala 229:23]
  reg  REG_1_2_fp_val; // @[functional-unit.scala 229:23]
  reg  REG_1_2_fp_single; // @[functional-unit.scala 229:23]
  reg  REG_1_2_xcpt_pf_if; // @[functional-unit.scala 229:23]
  reg  REG_1_2_xcpt_ae_if; // @[functional-unit.scala 229:23]
  reg  REG_1_2_xcpt_ma_if; // @[functional-unit.scala 229:23]
  reg  REG_1_2_bp_debug_if; // @[functional-unit.scala 229:23]
  reg  REG_1_2_bp_xcpt_if; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_2_debug_fsrc; // @[functional-unit.scala 229:23]
  reg [1:0] REG_1_2_debug_tsrc; // @[functional-unit.scala 229:23]
  wire [11:0] _T = io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask; // @[util.scala 118:51]
  wire  _T_1 = _T != 12'h0; // @[util.scala 118:59]
  wire  _T_4 = ~io_req_bits_kill; // @[functional-unit.scala 232:87]
  wire [11:0] _T_6 = ~io_brupdate_b1_resolve_mask; // @[util.scala 85:27]
  wire [11:0] _T_8 = io_brupdate_b1_mispredict_mask & REG_1_0_br_mask; // @[util.scala 118:51]
  wire  _T_9 = _T_8 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_16 = io_brupdate_b1_mispredict_mask & REG_1_1_br_mask; // @[util.scala 118:51]
  wire  _T_17 = _T_16 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_24 = io_brupdate_b1_mispredict_mask & REG_1_2_br_mask; // @[util.scala 118:51]
  wire  _T_25 = _T_24 != 12'h0; // @[util.scala 118:59]
  PipelinedMultiplier imul ( // @[functional-unit.scala 708:20]
    .clock(imul_clock),
    .reset(imul_reset),
    .io_req_valid(imul_io_req_valid),
    .io_req_bits_fn(imul_io_req_bits_fn),
    .io_req_bits_dw(imul_io_req_bits_dw),
    .io_req_bits_in1(imul_io_req_bits_in1),
    .io_req_bits_in2(imul_io_req_bits_in2),
    .io_req_bits_tag(imul_io_req_bits_tag),
    .io_resp_valid(imul_io_resp_valid),
    .io_resp_bits_data(imul_io_resp_bits_data),
    .io_resp_bits_tag(imul_io_resp_bits_tag)
  );
  assign io_req_ready = 1'h1; // @[functional-unit.scala 225:16]
  assign io_resp_valid = REG__2 & ~_T_25; // @[functional-unit.scala 249:47]
  assign io_resp_bits_uop_uopc = REG_1_2_uopc; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_inst = REG_1_2_inst; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_debug_inst = REG_1_2_debug_inst; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_is_rvc = REG_1_2_is_rvc; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_debug_pc = REG_1_2_debug_pc; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_iq_type = REG_1_2_iq_type; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_fu_code = REG_1_2_fu_code; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ctrl_br_type = REG_1_2_ctrl_br_type; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ctrl_op1_sel = REG_1_2_ctrl_op1_sel; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ctrl_op2_sel = REG_1_2_ctrl_op2_sel; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ctrl_imm_sel = REG_1_2_ctrl_imm_sel; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ctrl_op_fcn = REG_1_2_ctrl_op_fcn; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ctrl_fcn_dw = REG_1_2_ctrl_fcn_dw; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ctrl_csr_cmd = REG_1_2_ctrl_csr_cmd; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ctrl_is_load = REG_1_2_ctrl_is_load; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ctrl_is_sta = REG_1_2_ctrl_is_sta; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ctrl_is_std = REG_1_2_ctrl_is_std; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_iw_state = REG_1_2_iw_state; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_iw_p1_poisoned = REG_1_2_iw_p1_poisoned; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_iw_p2_poisoned = REG_1_2_iw_p2_poisoned; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_is_br = REG_1_2_is_br; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_is_jalr = REG_1_2_is_jalr; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_is_jal = REG_1_2_is_jal; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_is_sfb = REG_1_2_is_sfb; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_br_mask = REG_1_2_br_mask & _T_6; // @[util.scala 85:25]
  assign io_resp_bits_uop_br_tag = REG_1_2_br_tag; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ftq_idx = REG_1_2_ftq_idx; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_edge_inst = REG_1_2_edge_inst; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_pc_lob = REG_1_2_pc_lob; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_taken = REG_1_2_taken; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_imm_packed = REG_1_2_imm_packed; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_csr_addr = REG_1_2_csr_addr; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_rob_idx = REG_1_2_rob_idx; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ldq_idx = REG_1_2_ldq_idx; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_stq_idx = REG_1_2_stq_idx; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_rxq_idx = REG_1_2_rxq_idx; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_pdst = REG_1_2_pdst; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_prs1 = REG_1_2_prs1; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_prs2 = REG_1_2_prs2; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_prs3 = REG_1_2_prs3; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ppred = REG_1_2_ppred; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_prs1_busy = REG_1_2_prs1_busy; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_prs2_busy = REG_1_2_prs2_busy; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_prs3_busy = REG_1_2_prs3_busy; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ppred_busy = REG_1_2_ppred_busy; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_stale_pdst = REG_1_2_stale_pdst; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_exception = REG_1_2_exception; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_exc_cause = REG_1_2_exc_cause; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_bypassable = REG_1_2_bypassable; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_mem_cmd = REG_1_2_mem_cmd; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_mem_size = REG_1_2_mem_size; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_mem_signed = REG_1_2_mem_signed; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_is_fence = REG_1_2_is_fence; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_is_fencei = REG_1_2_is_fencei; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_is_amo = REG_1_2_is_amo; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_uses_ldq = REG_1_2_uses_ldq; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_uses_stq = REG_1_2_uses_stq; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_is_sys_pc2epc = REG_1_2_is_sys_pc2epc; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_is_unique = REG_1_2_is_unique; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_flush_on_commit = REG_1_2_flush_on_commit; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ldst_is_rs1 = REG_1_2_ldst_is_rs1; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ldst = REG_1_2_ldst; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_lrs1 = REG_1_2_lrs1; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_lrs2 = REG_1_2_lrs2; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_lrs3 = REG_1_2_lrs3; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_ldst_val = REG_1_2_ldst_val; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_dst_rtype = REG_1_2_dst_rtype; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_lrs1_rtype = REG_1_2_lrs1_rtype; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_lrs2_rtype = REG_1_2_lrs2_rtype; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_frs3_en = REG_1_2_frs3_en; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_fp_val = REG_1_2_fp_val; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_fp_single = REG_1_2_fp_single; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_xcpt_pf_if = REG_1_2_xcpt_pf_if; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_xcpt_ae_if = REG_1_2_xcpt_ae_if; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_xcpt_ma_if = REG_1_2_xcpt_ma_if; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_bp_debug_if = REG_1_2_bp_debug_if; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_bp_xcpt_if = REG_1_2_bp_xcpt_if; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_debug_fsrc = REG_1_2_debug_fsrc; // @[functional-unit.scala 251:22]
  assign io_resp_bits_uop_debug_tsrc = REG_1_2_debug_tsrc; // @[functional-unit.scala 251:22]
  assign io_resp_bits_predicated = 1'h0; // @[functional-unit.scala 250:29]
  assign io_resp_bits_data = imul_io_resp_bits_data; // @[functional-unit.scala 717:24]
  assign io_resp_bits_fflags_valid = 1'h0;
  assign io_resp_bits_fflags_bits_uop_uopc = 7'h0;
  assign io_resp_bits_fflags_bits_uop_inst = 32'h0;
  assign io_resp_bits_fflags_bits_uop_debug_inst = 32'h0;
  assign io_resp_bits_fflags_bits_uop_is_rvc = 1'h0;
  assign io_resp_bits_fflags_bits_uop_debug_pc = 40'h0;
  assign io_resp_bits_fflags_bits_uop_iq_type = 3'h0;
  assign io_resp_bits_fflags_bits_uop_fu_code = 10'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_br_type = 4'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_op1_sel = 2'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_op2_sel = 3'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_imm_sel = 3'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_op_fcn = 4'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_fcn_dw = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_csr_cmd = 3'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_is_load = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_is_sta = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ctrl_is_std = 1'h0;
  assign io_resp_bits_fflags_bits_uop_iw_state = 2'h0;
  assign io_resp_bits_fflags_bits_uop_iw_p1_poisoned = 1'h0;
  assign io_resp_bits_fflags_bits_uop_iw_p2_poisoned = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_br = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_jalr = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_jal = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_sfb = 1'h0;
  assign io_resp_bits_fflags_bits_uop_br_mask = 12'h0;
  assign io_resp_bits_fflags_bits_uop_br_tag = 4'h0;
  assign io_resp_bits_fflags_bits_uop_ftq_idx = 5'h0;
  assign io_resp_bits_fflags_bits_uop_edge_inst = 1'h0;
  assign io_resp_bits_fflags_bits_uop_pc_lob = 6'h0;
  assign io_resp_bits_fflags_bits_uop_taken = 1'h0;
  assign io_resp_bits_fflags_bits_uop_imm_packed = 20'h0;
  assign io_resp_bits_fflags_bits_uop_csr_addr = 12'h0;
  assign io_resp_bits_fflags_bits_uop_rob_idx = 6'h0;
  assign io_resp_bits_fflags_bits_uop_ldq_idx = 4'h0;
  assign io_resp_bits_fflags_bits_uop_stq_idx = 4'h0;
  assign io_resp_bits_fflags_bits_uop_rxq_idx = 2'h0;
  assign io_resp_bits_fflags_bits_uop_pdst = 6'h0;
  assign io_resp_bits_fflags_bits_uop_prs1 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_prs2 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_prs3 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_ppred = 5'h0;
  assign io_resp_bits_fflags_bits_uop_prs1_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_prs2_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_prs3_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ppred_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_stale_pdst = 6'h0;
  assign io_resp_bits_fflags_bits_uop_exception = 1'h0;
  assign io_resp_bits_fflags_bits_uop_exc_cause = 64'h0;
  assign io_resp_bits_fflags_bits_uop_bypassable = 1'h0;
  assign io_resp_bits_fflags_bits_uop_mem_cmd = 5'h0;
  assign io_resp_bits_fflags_bits_uop_mem_size = 2'h0;
  assign io_resp_bits_fflags_bits_uop_mem_signed = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_fence = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_fencei = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_amo = 1'h0;
  assign io_resp_bits_fflags_bits_uop_uses_ldq = 1'h0;
  assign io_resp_bits_fflags_bits_uop_uses_stq = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_sys_pc2epc = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_unique = 1'h0;
  assign io_resp_bits_fflags_bits_uop_flush_on_commit = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ldst_is_rs1 = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ldst = 6'h0;
  assign io_resp_bits_fflags_bits_uop_lrs1 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_lrs2 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_lrs3 = 6'h0;
  assign io_resp_bits_fflags_bits_uop_ldst_val = 1'h0;
  assign io_resp_bits_fflags_bits_uop_dst_rtype = 2'h0;
  assign io_resp_bits_fflags_bits_uop_lrs1_rtype = 2'h0;
  assign io_resp_bits_fflags_bits_uop_lrs2_rtype = 2'h0;
  assign io_resp_bits_fflags_bits_uop_frs3_en = 1'h0;
  assign io_resp_bits_fflags_bits_uop_fp_val = 1'h0;
  assign io_resp_bits_fflags_bits_uop_fp_single = 1'h0;
  assign io_resp_bits_fflags_bits_uop_xcpt_pf_if = 1'h0;
  assign io_resp_bits_fflags_bits_uop_xcpt_ae_if = 1'h0;
  assign io_resp_bits_fflags_bits_uop_xcpt_ma_if = 1'h0;
  assign io_resp_bits_fflags_bits_uop_bp_debug_if = 1'h0;
  assign io_resp_bits_fflags_bits_uop_bp_xcpt_if = 1'h0;
  assign io_resp_bits_fflags_bits_uop_debug_fsrc = 2'h0;
  assign io_resp_bits_fflags_bits_uop_debug_tsrc = 2'h0;
  assign io_resp_bits_fflags_bits_flags = 5'h0;
  assign io_resp_bits_addr = 40'h0;
  assign io_resp_bits_mxcpt_valid = 1'h0;
  assign io_resp_bits_mxcpt_bits = 17'h0;
  assign io_resp_bits_sfence_valid = 1'h0;
  assign io_resp_bits_sfence_bits_rs1 = 1'h0;
  assign io_resp_bits_sfence_bits_rs2 = 1'h0;
  assign io_resp_bits_sfence_bits_addr = 39'h0;
  assign io_resp_bits_sfence_bits_asid = 1'h0;
  assign imul_clock = clock;
  assign imul_reset = reset;
  assign imul_io_req_valid = io_req_valid; // @[functional-unit.scala 710:24]
  assign imul_io_req_bits_fn = io_req_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 711:24]
  assign imul_io_req_bits_dw = io_req_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 712:24]
  assign imul_io_req_bits_in1 = io_req_bits_rs1_data; // @[functional-unit.scala 713:24]
  assign imul_io_req_bits_in2 = io_req_bits_rs2_data; // @[functional-unit.scala 714:24]
  assign imul_io_req_bits_tag = 5'h0;
  always @(posedge clock) begin
    if (reset) begin // @[functional-unit.scala 228:27]
      REG__0 <= 1'h0; // @[functional-unit.scala 228:27]
    end else begin
      REG__0 <= io_req_valid & ~_T_1 & ~io_req_bits_kill; // @[functional-unit.scala 232:17]
    end
    if (reset) begin // @[functional-unit.scala 228:27]
      REG__1 <= 1'h0; // @[functional-unit.scala 228:27]
    end else begin
      REG__1 <= REG__0 & ~_T_9 & _T_4; // @[functional-unit.scala 238:19]
    end
    if (reset) begin // @[functional-unit.scala 228:27]
      REG__2 <= 1'h0; // @[functional-unit.scala 228:27]
    end else begin
      REG__2 <= REG__1 & ~_T_17 & _T_4; // @[functional-unit.scala 238:19]
    end
    REG_1_0_uopc <= io_req_bits_uop_uopc; // @[functional-unit.scala 233:17]
    REG_1_0_inst <= io_req_bits_uop_inst; // @[functional-unit.scala 233:17]
    REG_1_0_debug_inst <= io_req_bits_uop_debug_inst; // @[functional-unit.scala 233:17]
    REG_1_0_is_rvc <= io_req_bits_uop_is_rvc; // @[functional-unit.scala 233:17]
    REG_1_0_debug_pc <= io_req_bits_uop_debug_pc; // @[functional-unit.scala 233:17]
    REG_1_0_iq_type <= io_req_bits_uop_iq_type; // @[functional-unit.scala 233:17]
    REG_1_0_fu_code <= io_req_bits_uop_fu_code; // @[functional-unit.scala 233:17]
    REG_1_0_ctrl_br_type <= io_req_bits_uop_ctrl_br_type; // @[functional-unit.scala 233:17]
    REG_1_0_ctrl_op1_sel <= io_req_bits_uop_ctrl_op1_sel; // @[functional-unit.scala 233:17]
    REG_1_0_ctrl_op2_sel <= io_req_bits_uop_ctrl_op2_sel; // @[functional-unit.scala 233:17]
    REG_1_0_ctrl_imm_sel <= io_req_bits_uop_ctrl_imm_sel; // @[functional-unit.scala 233:17]
    REG_1_0_ctrl_op_fcn <= io_req_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 233:17]
    REG_1_0_ctrl_fcn_dw <= io_req_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 233:17]
    REG_1_0_ctrl_csr_cmd <= io_req_bits_uop_ctrl_csr_cmd; // @[functional-unit.scala 233:17]
    REG_1_0_ctrl_is_load <= io_req_bits_uop_ctrl_is_load; // @[functional-unit.scala 233:17]
    REG_1_0_ctrl_is_sta <= io_req_bits_uop_ctrl_is_sta; // @[functional-unit.scala 233:17]
    REG_1_0_ctrl_is_std <= io_req_bits_uop_ctrl_is_std; // @[functional-unit.scala 233:17]
    REG_1_0_iw_state <= io_req_bits_uop_iw_state; // @[functional-unit.scala 233:17]
    REG_1_0_iw_p1_poisoned <= io_req_bits_uop_iw_p1_poisoned; // @[functional-unit.scala 233:17]
    REG_1_0_iw_p2_poisoned <= io_req_bits_uop_iw_p2_poisoned; // @[functional-unit.scala 233:17]
    REG_1_0_is_br <= io_req_bits_uop_is_br; // @[functional-unit.scala 233:17]
    REG_1_0_is_jalr <= io_req_bits_uop_is_jalr; // @[functional-unit.scala 233:17]
    REG_1_0_is_jal <= io_req_bits_uop_is_jal; // @[functional-unit.scala 233:17]
    REG_1_0_is_sfb <= io_req_bits_uop_is_sfb; // @[functional-unit.scala 233:17]
    REG_1_0_br_mask <= io_req_bits_uop_br_mask & _T_6; // @[util.scala 85:25]
    REG_1_0_br_tag <= io_req_bits_uop_br_tag; // @[functional-unit.scala 233:17]
    REG_1_0_ftq_idx <= io_req_bits_uop_ftq_idx; // @[functional-unit.scala 233:17]
    REG_1_0_edge_inst <= io_req_bits_uop_edge_inst; // @[functional-unit.scala 233:17]
    REG_1_0_pc_lob <= io_req_bits_uop_pc_lob; // @[functional-unit.scala 233:17]
    REG_1_0_taken <= io_req_bits_uop_taken; // @[functional-unit.scala 233:17]
    REG_1_0_imm_packed <= io_req_bits_uop_imm_packed; // @[functional-unit.scala 233:17]
    REG_1_0_csr_addr <= io_req_bits_uop_csr_addr; // @[functional-unit.scala 233:17]
    REG_1_0_rob_idx <= io_req_bits_uop_rob_idx; // @[functional-unit.scala 233:17]
    REG_1_0_ldq_idx <= io_req_bits_uop_ldq_idx; // @[functional-unit.scala 233:17]
    REG_1_0_stq_idx <= io_req_bits_uop_stq_idx; // @[functional-unit.scala 233:17]
    REG_1_0_rxq_idx <= io_req_bits_uop_rxq_idx; // @[functional-unit.scala 233:17]
    REG_1_0_pdst <= io_req_bits_uop_pdst; // @[functional-unit.scala 233:17]
    REG_1_0_prs1 <= io_req_bits_uop_prs1; // @[functional-unit.scala 233:17]
    REG_1_0_prs2 <= io_req_bits_uop_prs2; // @[functional-unit.scala 233:17]
    REG_1_0_prs3 <= io_req_bits_uop_prs3; // @[functional-unit.scala 233:17]
    REG_1_0_ppred <= io_req_bits_uop_ppred; // @[functional-unit.scala 233:17]
    REG_1_0_prs1_busy <= io_req_bits_uop_prs1_busy; // @[functional-unit.scala 233:17]
    REG_1_0_prs2_busy <= io_req_bits_uop_prs2_busy; // @[functional-unit.scala 233:17]
    REG_1_0_prs3_busy <= io_req_bits_uop_prs3_busy; // @[functional-unit.scala 233:17]
    REG_1_0_ppred_busy <= io_req_bits_uop_ppred_busy; // @[functional-unit.scala 233:17]
    REG_1_0_stale_pdst <= io_req_bits_uop_stale_pdst; // @[functional-unit.scala 233:17]
    REG_1_0_exception <= io_req_bits_uop_exception; // @[functional-unit.scala 233:17]
    REG_1_0_exc_cause <= io_req_bits_uop_exc_cause; // @[functional-unit.scala 233:17]
    REG_1_0_bypassable <= io_req_bits_uop_bypassable; // @[functional-unit.scala 233:17]
    REG_1_0_mem_cmd <= io_req_bits_uop_mem_cmd; // @[functional-unit.scala 233:17]
    REG_1_0_mem_size <= io_req_bits_uop_mem_size; // @[functional-unit.scala 233:17]
    REG_1_0_mem_signed <= io_req_bits_uop_mem_signed; // @[functional-unit.scala 233:17]
    REG_1_0_is_fence <= io_req_bits_uop_is_fence; // @[functional-unit.scala 233:17]
    REG_1_0_is_fencei <= io_req_bits_uop_is_fencei; // @[functional-unit.scala 233:17]
    REG_1_0_is_amo <= io_req_bits_uop_is_amo; // @[functional-unit.scala 233:17]
    REG_1_0_uses_ldq <= io_req_bits_uop_uses_ldq; // @[functional-unit.scala 233:17]
    REG_1_0_uses_stq <= io_req_bits_uop_uses_stq; // @[functional-unit.scala 233:17]
    REG_1_0_is_sys_pc2epc <= io_req_bits_uop_is_sys_pc2epc; // @[functional-unit.scala 233:17]
    REG_1_0_is_unique <= io_req_bits_uop_is_unique; // @[functional-unit.scala 233:17]
    REG_1_0_flush_on_commit <= io_req_bits_uop_flush_on_commit; // @[functional-unit.scala 233:17]
    REG_1_0_ldst_is_rs1 <= io_req_bits_uop_ldst_is_rs1; // @[functional-unit.scala 233:17]
    REG_1_0_ldst <= io_req_bits_uop_ldst; // @[functional-unit.scala 233:17]
    REG_1_0_lrs1 <= io_req_bits_uop_lrs1; // @[functional-unit.scala 233:17]
    REG_1_0_lrs2 <= io_req_bits_uop_lrs2; // @[functional-unit.scala 233:17]
    REG_1_0_lrs3 <= io_req_bits_uop_lrs3; // @[functional-unit.scala 233:17]
    REG_1_0_ldst_val <= io_req_bits_uop_ldst_val; // @[functional-unit.scala 233:17]
    REG_1_0_dst_rtype <= io_req_bits_uop_dst_rtype; // @[functional-unit.scala 233:17]
    REG_1_0_lrs1_rtype <= io_req_bits_uop_lrs1_rtype; // @[functional-unit.scala 233:17]
    REG_1_0_lrs2_rtype <= io_req_bits_uop_lrs2_rtype; // @[functional-unit.scala 233:17]
    REG_1_0_frs3_en <= io_req_bits_uop_frs3_en; // @[functional-unit.scala 233:17]
    REG_1_0_fp_val <= io_req_bits_uop_fp_val; // @[functional-unit.scala 233:17]
    REG_1_0_fp_single <= io_req_bits_uop_fp_single; // @[functional-unit.scala 233:17]
    REG_1_0_xcpt_pf_if <= io_req_bits_uop_xcpt_pf_if; // @[functional-unit.scala 233:17]
    REG_1_0_xcpt_ae_if <= io_req_bits_uop_xcpt_ae_if; // @[functional-unit.scala 233:17]
    REG_1_0_xcpt_ma_if <= io_req_bits_uop_xcpt_ma_if; // @[functional-unit.scala 233:17]
    REG_1_0_bp_debug_if <= io_req_bits_uop_bp_debug_if; // @[functional-unit.scala 233:17]
    REG_1_0_bp_xcpt_if <= io_req_bits_uop_bp_xcpt_if; // @[functional-unit.scala 233:17]
    REG_1_0_debug_fsrc <= io_req_bits_uop_debug_fsrc; // @[functional-unit.scala 233:17]
    REG_1_0_debug_tsrc <= io_req_bits_uop_debug_tsrc; // @[functional-unit.scala 233:17]
    REG_1_1_uopc <= REG_1_0_uopc; // @[functional-unit.scala 239:19]
    REG_1_1_inst <= REG_1_0_inst; // @[functional-unit.scala 239:19]
    REG_1_1_debug_inst <= REG_1_0_debug_inst; // @[functional-unit.scala 239:19]
    REG_1_1_is_rvc <= REG_1_0_is_rvc; // @[functional-unit.scala 239:19]
    REG_1_1_debug_pc <= REG_1_0_debug_pc; // @[functional-unit.scala 239:19]
    REG_1_1_iq_type <= REG_1_0_iq_type; // @[functional-unit.scala 239:19]
    REG_1_1_fu_code <= REG_1_0_fu_code; // @[functional-unit.scala 239:19]
    REG_1_1_ctrl_br_type <= REG_1_0_ctrl_br_type; // @[functional-unit.scala 239:19]
    REG_1_1_ctrl_op1_sel <= REG_1_0_ctrl_op1_sel; // @[functional-unit.scala 239:19]
    REG_1_1_ctrl_op2_sel <= REG_1_0_ctrl_op2_sel; // @[functional-unit.scala 239:19]
    REG_1_1_ctrl_imm_sel <= REG_1_0_ctrl_imm_sel; // @[functional-unit.scala 239:19]
    REG_1_1_ctrl_op_fcn <= REG_1_0_ctrl_op_fcn; // @[functional-unit.scala 239:19]
    REG_1_1_ctrl_fcn_dw <= REG_1_0_ctrl_fcn_dw; // @[functional-unit.scala 239:19]
    REG_1_1_ctrl_csr_cmd <= REG_1_0_ctrl_csr_cmd; // @[functional-unit.scala 239:19]
    REG_1_1_ctrl_is_load <= REG_1_0_ctrl_is_load; // @[functional-unit.scala 239:19]
    REG_1_1_ctrl_is_sta <= REG_1_0_ctrl_is_sta; // @[functional-unit.scala 239:19]
    REG_1_1_ctrl_is_std <= REG_1_0_ctrl_is_std; // @[functional-unit.scala 239:19]
    REG_1_1_iw_state <= REG_1_0_iw_state; // @[functional-unit.scala 239:19]
    REG_1_1_iw_p1_poisoned <= REG_1_0_iw_p1_poisoned; // @[functional-unit.scala 239:19]
    REG_1_1_iw_p2_poisoned <= REG_1_0_iw_p2_poisoned; // @[functional-unit.scala 239:19]
    REG_1_1_is_br <= REG_1_0_is_br; // @[functional-unit.scala 239:19]
    REG_1_1_is_jalr <= REG_1_0_is_jalr; // @[functional-unit.scala 239:19]
    REG_1_1_is_jal <= REG_1_0_is_jal; // @[functional-unit.scala 239:19]
    REG_1_1_is_sfb <= REG_1_0_is_sfb; // @[functional-unit.scala 239:19]
    REG_1_1_br_mask <= REG_1_0_br_mask & _T_6; // @[util.scala 85:25]
    REG_1_1_br_tag <= REG_1_0_br_tag; // @[functional-unit.scala 239:19]
    REG_1_1_ftq_idx <= REG_1_0_ftq_idx; // @[functional-unit.scala 239:19]
    REG_1_1_edge_inst <= REG_1_0_edge_inst; // @[functional-unit.scala 239:19]
    REG_1_1_pc_lob <= REG_1_0_pc_lob; // @[functional-unit.scala 239:19]
    REG_1_1_taken <= REG_1_0_taken; // @[functional-unit.scala 239:19]
    REG_1_1_imm_packed <= REG_1_0_imm_packed; // @[functional-unit.scala 239:19]
    REG_1_1_csr_addr <= REG_1_0_csr_addr; // @[functional-unit.scala 239:19]
    REG_1_1_rob_idx <= REG_1_0_rob_idx; // @[functional-unit.scala 239:19]
    REG_1_1_ldq_idx <= REG_1_0_ldq_idx; // @[functional-unit.scala 239:19]
    REG_1_1_stq_idx <= REG_1_0_stq_idx; // @[functional-unit.scala 239:19]
    REG_1_1_rxq_idx <= REG_1_0_rxq_idx; // @[functional-unit.scala 239:19]
    REG_1_1_pdst <= REG_1_0_pdst; // @[functional-unit.scala 239:19]
    REG_1_1_prs1 <= REG_1_0_prs1; // @[functional-unit.scala 239:19]
    REG_1_1_prs2 <= REG_1_0_prs2; // @[functional-unit.scala 239:19]
    REG_1_1_prs3 <= REG_1_0_prs3; // @[functional-unit.scala 239:19]
    REG_1_1_ppred <= REG_1_0_ppred; // @[functional-unit.scala 239:19]
    REG_1_1_prs1_busy <= REG_1_0_prs1_busy; // @[functional-unit.scala 239:19]
    REG_1_1_prs2_busy <= REG_1_0_prs2_busy; // @[functional-unit.scala 239:19]
    REG_1_1_prs3_busy <= REG_1_0_prs3_busy; // @[functional-unit.scala 239:19]
    REG_1_1_ppred_busy <= REG_1_0_ppred_busy; // @[functional-unit.scala 239:19]
    REG_1_1_stale_pdst <= REG_1_0_stale_pdst; // @[functional-unit.scala 239:19]
    REG_1_1_exception <= REG_1_0_exception; // @[functional-unit.scala 239:19]
    REG_1_1_exc_cause <= REG_1_0_exc_cause; // @[functional-unit.scala 239:19]
    REG_1_1_bypassable <= REG_1_0_bypassable; // @[functional-unit.scala 239:19]
    REG_1_1_mem_cmd <= REG_1_0_mem_cmd; // @[functional-unit.scala 239:19]
    REG_1_1_mem_size <= REG_1_0_mem_size; // @[functional-unit.scala 239:19]
    REG_1_1_mem_signed <= REG_1_0_mem_signed; // @[functional-unit.scala 239:19]
    REG_1_1_is_fence <= REG_1_0_is_fence; // @[functional-unit.scala 239:19]
    REG_1_1_is_fencei <= REG_1_0_is_fencei; // @[functional-unit.scala 239:19]
    REG_1_1_is_amo <= REG_1_0_is_amo; // @[functional-unit.scala 239:19]
    REG_1_1_uses_ldq <= REG_1_0_uses_ldq; // @[functional-unit.scala 239:19]
    REG_1_1_uses_stq <= REG_1_0_uses_stq; // @[functional-unit.scala 239:19]
    REG_1_1_is_sys_pc2epc <= REG_1_0_is_sys_pc2epc; // @[functional-unit.scala 239:19]
    REG_1_1_is_unique <= REG_1_0_is_unique; // @[functional-unit.scala 239:19]
    REG_1_1_flush_on_commit <= REG_1_0_flush_on_commit; // @[functional-unit.scala 239:19]
    REG_1_1_ldst_is_rs1 <= REG_1_0_ldst_is_rs1; // @[functional-unit.scala 239:19]
    REG_1_1_ldst <= REG_1_0_ldst; // @[functional-unit.scala 239:19]
    REG_1_1_lrs1 <= REG_1_0_lrs1; // @[functional-unit.scala 239:19]
    REG_1_1_lrs2 <= REG_1_0_lrs2; // @[functional-unit.scala 239:19]
    REG_1_1_lrs3 <= REG_1_0_lrs3; // @[functional-unit.scala 239:19]
    REG_1_1_ldst_val <= REG_1_0_ldst_val; // @[functional-unit.scala 239:19]
    REG_1_1_dst_rtype <= REG_1_0_dst_rtype; // @[functional-unit.scala 239:19]
    REG_1_1_lrs1_rtype <= REG_1_0_lrs1_rtype; // @[functional-unit.scala 239:19]
    REG_1_1_lrs2_rtype <= REG_1_0_lrs2_rtype; // @[functional-unit.scala 239:19]
    REG_1_1_frs3_en <= REG_1_0_frs3_en; // @[functional-unit.scala 239:19]
    REG_1_1_fp_val <= REG_1_0_fp_val; // @[functional-unit.scala 239:19]
    REG_1_1_fp_single <= REG_1_0_fp_single; // @[functional-unit.scala 239:19]
    REG_1_1_xcpt_pf_if <= REG_1_0_xcpt_pf_if; // @[functional-unit.scala 239:19]
    REG_1_1_xcpt_ae_if <= REG_1_0_xcpt_ae_if; // @[functional-unit.scala 239:19]
    REG_1_1_xcpt_ma_if <= REG_1_0_xcpt_ma_if; // @[functional-unit.scala 239:19]
    REG_1_1_bp_debug_if <= REG_1_0_bp_debug_if; // @[functional-unit.scala 239:19]
    REG_1_1_bp_xcpt_if <= REG_1_0_bp_xcpt_if; // @[functional-unit.scala 239:19]
    REG_1_1_debug_fsrc <= REG_1_0_debug_fsrc; // @[functional-unit.scala 239:19]
    REG_1_1_debug_tsrc <= REG_1_0_debug_tsrc; // @[functional-unit.scala 239:19]
    REG_1_2_uopc <= REG_1_1_uopc; // @[functional-unit.scala 239:19]
    REG_1_2_inst <= REG_1_1_inst; // @[functional-unit.scala 239:19]
    REG_1_2_debug_inst <= REG_1_1_debug_inst; // @[functional-unit.scala 239:19]
    REG_1_2_is_rvc <= REG_1_1_is_rvc; // @[functional-unit.scala 239:19]
    REG_1_2_debug_pc <= REG_1_1_debug_pc; // @[functional-unit.scala 239:19]
    REG_1_2_iq_type <= REG_1_1_iq_type; // @[functional-unit.scala 239:19]
    REG_1_2_fu_code <= REG_1_1_fu_code; // @[functional-unit.scala 239:19]
    REG_1_2_ctrl_br_type <= REG_1_1_ctrl_br_type; // @[functional-unit.scala 239:19]
    REG_1_2_ctrl_op1_sel <= REG_1_1_ctrl_op1_sel; // @[functional-unit.scala 239:19]
    REG_1_2_ctrl_op2_sel <= REG_1_1_ctrl_op2_sel; // @[functional-unit.scala 239:19]
    REG_1_2_ctrl_imm_sel <= REG_1_1_ctrl_imm_sel; // @[functional-unit.scala 239:19]
    REG_1_2_ctrl_op_fcn <= REG_1_1_ctrl_op_fcn; // @[functional-unit.scala 239:19]
    REG_1_2_ctrl_fcn_dw <= REG_1_1_ctrl_fcn_dw; // @[functional-unit.scala 239:19]
    REG_1_2_ctrl_csr_cmd <= REG_1_1_ctrl_csr_cmd; // @[functional-unit.scala 239:19]
    REG_1_2_ctrl_is_load <= REG_1_1_ctrl_is_load; // @[functional-unit.scala 239:19]
    REG_1_2_ctrl_is_sta <= REG_1_1_ctrl_is_sta; // @[functional-unit.scala 239:19]
    REG_1_2_ctrl_is_std <= REG_1_1_ctrl_is_std; // @[functional-unit.scala 239:19]
    REG_1_2_iw_state <= REG_1_1_iw_state; // @[functional-unit.scala 239:19]
    REG_1_2_iw_p1_poisoned <= REG_1_1_iw_p1_poisoned; // @[functional-unit.scala 239:19]
    REG_1_2_iw_p2_poisoned <= REG_1_1_iw_p2_poisoned; // @[functional-unit.scala 239:19]
    REG_1_2_is_br <= REG_1_1_is_br; // @[functional-unit.scala 239:19]
    REG_1_2_is_jalr <= REG_1_1_is_jalr; // @[functional-unit.scala 239:19]
    REG_1_2_is_jal <= REG_1_1_is_jal; // @[functional-unit.scala 239:19]
    REG_1_2_is_sfb <= REG_1_1_is_sfb; // @[functional-unit.scala 239:19]
    REG_1_2_br_mask <= REG_1_1_br_mask & _T_6; // @[util.scala 85:25]
    REG_1_2_br_tag <= REG_1_1_br_tag; // @[functional-unit.scala 239:19]
    REG_1_2_ftq_idx <= REG_1_1_ftq_idx; // @[functional-unit.scala 239:19]
    REG_1_2_edge_inst <= REG_1_1_edge_inst; // @[functional-unit.scala 239:19]
    REG_1_2_pc_lob <= REG_1_1_pc_lob; // @[functional-unit.scala 239:19]
    REG_1_2_taken <= REG_1_1_taken; // @[functional-unit.scala 239:19]
    REG_1_2_imm_packed <= REG_1_1_imm_packed; // @[functional-unit.scala 239:19]
    REG_1_2_csr_addr <= REG_1_1_csr_addr; // @[functional-unit.scala 239:19]
    REG_1_2_rob_idx <= REG_1_1_rob_idx; // @[functional-unit.scala 239:19]
    REG_1_2_ldq_idx <= REG_1_1_ldq_idx; // @[functional-unit.scala 239:19]
    REG_1_2_stq_idx <= REG_1_1_stq_idx; // @[functional-unit.scala 239:19]
    REG_1_2_rxq_idx <= REG_1_1_rxq_idx; // @[functional-unit.scala 239:19]
    REG_1_2_pdst <= REG_1_1_pdst; // @[functional-unit.scala 239:19]
    REG_1_2_prs1 <= REG_1_1_prs1; // @[functional-unit.scala 239:19]
    REG_1_2_prs2 <= REG_1_1_prs2; // @[functional-unit.scala 239:19]
    REG_1_2_prs3 <= REG_1_1_prs3; // @[functional-unit.scala 239:19]
    REG_1_2_ppred <= REG_1_1_ppred; // @[functional-unit.scala 239:19]
    REG_1_2_prs1_busy <= REG_1_1_prs1_busy; // @[functional-unit.scala 239:19]
    REG_1_2_prs2_busy <= REG_1_1_prs2_busy; // @[functional-unit.scala 239:19]
    REG_1_2_prs3_busy <= REG_1_1_prs3_busy; // @[functional-unit.scala 239:19]
    REG_1_2_ppred_busy <= REG_1_1_ppred_busy; // @[functional-unit.scala 239:19]
    REG_1_2_stale_pdst <= REG_1_1_stale_pdst; // @[functional-unit.scala 239:19]
    REG_1_2_exception <= REG_1_1_exception; // @[functional-unit.scala 239:19]
    REG_1_2_exc_cause <= REG_1_1_exc_cause; // @[functional-unit.scala 239:19]
    REG_1_2_bypassable <= REG_1_1_bypassable; // @[functional-unit.scala 239:19]
    REG_1_2_mem_cmd <= REG_1_1_mem_cmd; // @[functional-unit.scala 239:19]
    REG_1_2_mem_size <= REG_1_1_mem_size; // @[functional-unit.scala 239:19]
    REG_1_2_mem_signed <= REG_1_1_mem_signed; // @[functional-unit.scala 239:19]
    REG_1_2_is_fence <= REG_1_1_is_fence; // @[functional-unit.scala 239:19]
    REG_1_2_is_fencei <= REG_1_1_is_fencei; // @[functional-unit.scala 239:19]
    REG_1_2_is_amo <= REG_1_1_is_amo; // @[functional-unit.scala 239:19]
    REG_1_2_uses_ldq <= REG_1_1_uses_ldq; // @[functional-unit.scala 239:19]
    REG_1_2_uses_stq <= REG_1_1_uses_stq; // @[functional-unit.scala 239:19]
    REG_1_2_is_sys_pc2epc <= REG_1_1_is_sys_pc2epc; // @[functional-unit.scala 239:19]
    REG_1_2_is_unique <= REG_1_1_is_unique; // @[functional-unit.scala 239:19]
    REG_1_2_flush_on_commit <= REG_1_1_flush_on_commit; // @[functional-unit.scala 239:19]
    REG_1_2_ldst_is_rs1 <= REG_1_1_ldst_is_rs1; // @[functional-unit.scala 239:19]
    REG_1_2_ldst <= REG_1_1_ldst; // @[functional-unit.scala 239:19]
    REG_1_2_lrs1 <= REG_1_1_lrs1; // @[functional-unit.scala 239:19]
    REG_1_2_lrs2 <= REG_1_1_lrs2; // @[functional-unit.scala 239:19]
    REG_1_2_lrs3 <= REG_1_1_lrs3; // @[functional-unit.scala 239:19]
    REG_1_2_ldst_val <= REG_1_1_ldst_val; // @[functional-unit.scala 239:19]
    REG_1_2_dst_rtype <= REG_1_1_dst_rtype; // @[functional-unit.scala 239:19]
    REG_1_2_lrs1_rtype <= REG_1_1_lrs1_rtype; // @[functional-unit.scala 239:19]
    REG_1_2_lrs2_rtype <= REG_1_1_lrs2_rtype; // @[functional-unit.scala 239:19]
    REG_1_2_frs3_en <= REG_1_1_frs3_en; // @[functional-unit.scala 239:19]
    REG_1_2_fp_val <= REG_1_1_fp_val; // @[functional-unit.scala 239:19]
    REG_1_2_fp_single <= REG_1_1_fp_single; // @[functional-unit.scala 239:19]
    REG_1_2_xcpt_pf_if <= REG_1_1_xcpt_pf_if; // @[functional-unit.scala 239:19]
    REG_1_2_xcpt_ae_if <= REG_1_1_xcpt_ae_if; // @[functional-unit.scala 239:19]
    REG_1_2_xcpt_ma_if <= REG_1_1_xcpt_ma_if; // @[functional-unit.scala 239:19]
    REG_1_2_bp_debug_if <= REG_1_1_bp_debug_if; // @[functional-unit.scala 239:19]
    REG_1_2_bp_xcpt_if <= REG_1_1_bp_xcpt_if; // @[functional-unit.scala 239:19]
    REG_1_2_debug_fsrc <= REG_1_1_debug_fsrc; // @[functional-unit.scala 239:19]
    REG_1_2_debug_tsrc <= REG_1_1_debug_tsrc; // @[functional-unit.scala 239:19]
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
  REG__0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  REG__1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  REG__2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG_1_0_uopc = _RAND_3[6:0];
  _RAND_4 = {1{`RANDOM}};
  REG_1_0_inst = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  REG_1_0_debug_inst = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  REG_1_0_is_rvc = _RAND_6[0:0];
  _RAND_7 = {2{`RANDOM}};
  REG_1_0_debug_pc = _RAND_7[39:0];
  _RAND_8 = {1{`RANDOM}};
  REG_1_0_iq_type = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  REG_1_0_fu_code = _RAND_9[9:0];
  _RAND_10 = {1{`RANDOM}};
  REG_1_0_ctrl_br_type = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  REG_1_0_ctrl_op1_sel = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  REG_1_0_ctrl_op2_sel = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  REG_1_0_ctrl_imm_sel = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  REG_1_0_ctrl_op_fcn = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  REG_1_0_ctrl_fcn_dw = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  REG_1_0_ctrl_csr_cmd = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  REG_1_0_ctrl_is_load = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  REG_1_0_ctrl_is_sta = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  REG_1_0_ctrl_is_std = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  REG_1_0_iw_state = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  REG_1_0_iw_p1_poisoned = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  REG_1_0_iw_p2_poisoned = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  REG_1_0_is_br = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  REG_1_0_is_jalr = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  REG_1_0_is_jal = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  REG_1_0_is_sfb = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  REG_1_0_br_mask = _RAND_27[11:0];
  _RAND_28 = {1{`RANDOM}};
  REG_1_0_br_tag = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  REG_1_0_ftq_idx = _RAND_29[4:0];
  _RAND_30 = {1{`RANDOM}};
  REG_1_0_edge_inst = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  REG_1_0_pc_lob = _RAND_31[5:0];
  _RAND_32 = {1{`RANDOM}};
  REG_1_0_taken = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  REG_1_0_imm_packed = _RAND_33[19:0];
  _RAND_34 = {1{`RANDOM}};
  REG_1_0_csr_addr = _RAND_34[11:0];
  _RAND_35 = {1{`RANDOM}};
  REG_1_0_rob_idx = _RAND_35[5:0];
  _RAND_36 = {1{`RANDOM}};
  REG_1_0_ldq_idx = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  REG_1_0_stq_idx = _RAND_37[3:0];
  _RAND_38 = {1{`RANDOM}};
  REG_1_0_rxq_idx = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  REG_1_0_pdst = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  REG_1_0_prs1 = _RAND_40[5:0];
  _RAND_41 = {1{`RANDOM}};
  REG_1_0_prs2 = _RAND_41[5:0];
  _RAND_42 = {1{`RANDOM}};
  REG_1_0_prs3 = _RAND_42[5:0];
  _RAND_43 = {1{`RANDOM}};
  REG_1_0_ppred = _RAND_43[4:0];
  _RAND_44 = {1{`RANDOM}};
  REG_1_0_prs1_busy = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  REG_1_0_prs2_busy = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  REG_1_0_prs3_busy = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  REG_1_0_ppred_busy = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  REG_1_0_stale_pdst = _RAND_48[5:0];
  _RAND_49 = {1{`RANDOM}};
  REG_1_0_exception = _RAND_49[0:0];
  _RAND_50 = {2{`RANDOM}};
  REG_1_0_exc_cause = _RAND_50[63:0];
  _RAND_51 = {1{`RANDOM}};
  REG_1_0_bypassable = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  REG_1_0_mem_cmd = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  REG_1_0_mem_size = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  REG_1_0_mem_signed = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  REG_1_0_is_fence = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  REG_1_0_is_fencei = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  REG_1_0_is_amo = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  REG_1_0_uses_ldq = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  REG_1_0_uses_stq = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  REG_1_0_is_sys_pc2epc = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  REG_1_0_is_unique = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  REG_1_0_flush_on_commit = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  REG_1_0_ldst_is_rs1 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  REG_1_0_ldst = _RAND_64[5:0];
  _RAND_65 = {1{`RANDOM}};
  REG_1_0_lrs1 = _RAND_65[5:0];
  _RAND_66 = {1{`RANDOM}};
  REG_1_0_lrs2 = _RAND_66[5:0];
  _RAND_67 = {1{`RANDOM}};
  REG_1_0_lrs3 = _RAND_67[5:0];
  _RAND_68 = {1{`RANDOM}};
  REG_1_0_ldst_val = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  REG_1_0_dst_rtype = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  REG_1_0_lrs1_rtype = _RAND_70[1:0];
  _RAND_71 = {1{`RANDOM}};
  REG_1_0_lrs2_rtype = _RAND_71[1:0];
  _RAND_72 = {1{`RANDOM}};
  REG_1_0_frs3_en = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  REG_1_0_fp_val = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  REG_1_0_fp_single = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  REG_1_0_xcpt_pf_if = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  REG_1_0_xcpt_ae_if = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  REG_1_0_xcpt_ma_if = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  REG_1_0_bp_debug_if = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  REG_1_0_bp_xcpt_if = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  REG_1_0_debug_fsrc = _RAND_80[1:0];
  _RAND_81 = {1{`RANDOM}};
  REG_1_0_debug_tsrc = _RAND_81[1:0];
  _RAND_82 = {1{`RANDOM}};
  REG_1_1_uopc = _RAND_82[6:0];
  _RAND_83 = {1{`RANDOM}};
  REG_1_1_inst = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  REG_1_1_debug_inst = _RAND_84[31:0];
  _RAND_85 = {1{`RANDOM}};
  REG_1_1_is_rvc = _RAND_85[0:0];
  _RAND_86 = {2{`RANDOM}};
  REG_1_1_debug_pc = _RAND_86[39:0];
  _RAND_87 = {1{`RANDOM}};
  REG_1_1_iq_type = _RAND_87[2:0];
  _RAND_88 = {1{`RANDOM}};
  REG_1_1_fu_code = _RAND_88[9:0];
  _RAND_89 = {1{`RANDOM}};
  REG_1_1_ctrl_br_type = _RAND_89[3:0];
  _RAND_90 = {1{`RANDOM}};
  REG_1_1_ctrl_op1_sel = _RAND_90[1:0];
  _RAND_91 = {1{`RANDOM}};
  REG_1_1_ctrl_op2_sel = _RAND_91[2:0];
  _RAND_92 = {1{`RANDOM}};
  REG_1_1_ctrl_imm_sel = _RAND_92[2:0];
  _RAND_93 = {1{`RANDOM}};
  REG_1_1_ctrl_op_fcn = _RAND_93[3:0];
  _RAND_94 = {1{`RANDOM}};
  REG_1_1_ctrl_fcn_dw = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  REG_1_1_ctrl_csr_cmd = _RAND_95[2:0];
  _RAND_96 = {1{`RANDOM}};
  REG_1_1_ctrl_is_load = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  REG_1_1_ctrl_is_sta = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  REG_1_1_ctrl_is_std = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  REG_1_1_iw_state = _RAND_99[1:0];
  _RAND_100 = {1{`RANDOM}};
  REG_1_1_iw_p1_poisoned = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  REG_1_1_iw_p2_poisoned = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  REG_1_1_is_br = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  REG_1_1_is_jalr = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  REG_1_1_is_jal = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  REG_1_1_is_sfb = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  REG_1_1_br_mask = _RAND_106[11:0];
  _RAND_107 = {1{`RANDOM}};
  REG_1_1_br_tag = _RAND_107[3:0];
  _RAND_108 = {1{`RANDOM}};
  REG_1_1_ftq_idx = _RAND_108[4:0];
  _RAND_109 = {1{`RANDOM}};
  REG_1_1_edge_inst = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  REG_1_1_pc_lob = _RAND_110[5:0];
  _RAND_111 = {1{`RANDOM}};
  REG_1_1_taken = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  REG_1_1_imm_packed = _RAND_112[19:0];
  _RAND_113 = {1{`RANDOM}};
  REG_1_1_csr_addr = _RAND_113[11:0];
  _RAND_114 = {1{`RANDOM}};
  REG_1_1_rob_idx = _RAND_114[5:0];
  _RAND_115 = {1{`RANDOM}};
  REG_1_1_ldq_idx = _RAND_115[3:0];
  _RAND_116 = {1{`RANDOM}};
  REG_1_1_stq_idx = _RAND_116[3:0];
  _RAND_117 = {1{`RANDOM}};
  REG_1_1_rxq_idx = _RAND_117[1:0];
  _RAND_118 = {1{`RANDOM}};
  REG_1_1_pdst = _RAND_118[5:0];
  _RAND_119 = {1{`RANDOM}};
  REG_1_1_prs1 = _RAND_119[5:0];
  _RAND_120 = {1{`RANDOM}};
  REG_1_1_prs2 = _RAND_120[5:0];
  _RAND_121 = {1{`RANDOM}};
  REG_1_1_prs3 = _RAND_121[5:0];
  _RAND_122 = {1{`RANDOM}};
  REG_1_1_ppred = _RAND_122[4:0];
  _RAND_123 = {1{`RANDOM}};
  REG_1_1_prs1_busy = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  REG_1_1_prs2_busy = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  REG_1_1_prs3_busy = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  REG_1_1_ppred_busy = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  REG_1_1_stale_pdst = _RAND_127[5:0];
  _RAND_128 = {1{`RANDOM}};
  REG_1_1_exception = _RAND_128[0:0];
  _RAND_129 = {2{`RANDOM}};
  REG_1_1_exc_cause = _RAND_129[63:0];
  _RAND_130 = {1{`RANDOM}};
  REG_1_1_bypassable = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  REG_1_1_mem_cmd = _RAND_131[4:0];
  _RAND_132 = {1{`RANDOM}};
  REG_1_1_mem_size = _RAND_132[1:0];
  _RAND_133 = {1{`RANDOM}};
  REG_1_1_mem_signed = _RAND_133[0:0];
  _RAND_134 = {1{`RANDOM}};
  REG_1_1_is_fence = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  REG_1_1_is_fencei = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  REG_1_1_is_amo = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  REG_1_1_uses_ldq = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  REG_1_1_uses_stq = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  REG_1_1_is_sys_pc2epc = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  REG_1_1_is_unique = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  REG_1_1_flush_on_commit = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  REG_1_1_ldst_is_rs1 = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  REG_1_1_ldst = _RAND_143[5:0];
  _RAND_144 = {1{`RANDOM}};
  REG_1_1_lrs1 = _RAND_144[5:0];
  _RAND_145 = {1{`RANDOM}};
  REG_1_1_lrs2 = _RAND_145[5:0];
  _RAND_146 = {1{`RANDOM}};
  REG_1_1_lrs3 = _RAND_146[5:0];
  _RAND_147 = {1{`RANDOM}};
  REG_1_1_ldst_val = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  REG_1_1_dst_rtype = _RAND_148[1:0];
  _RAND_149 = {1{`RANDOM}};
  REG_1_1_lrs1_rtype = _RAND_149[1:0];
  _RAND_150 = {1{`RANDOM}};
  REG_1_1_lrs2_rtype = _RAND_150[1:0];
  _RAND_151 = {1{`RANDOM}};
  REG_1_1_frs3_en = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  REG_1_1_fp_val = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  REG_1_1_fp_single = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  REG_1_1_xcpt_pf_if = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  REG_1_1_xcpt_ae_if = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  REG_1_1_xcpt_ma_if = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  REG_1_1_bp_debug_if = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  REG_1_1_bp_xcpt_if = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  REG_1_1_debug_fsrc = _RAND_159[1:0];
  _RAND_160 = {1{`RANDOM}};
  REG_1_1_debug_tsrc = _RAND_160[1:0];
  _RAND_161 = {1{`RANDOM}};
  REG_1_2_uopc = _RAND_161[6:0];
  _RAND_162 = {1{`RANDOM}};
  REG_1_2_inst = _RAND_162[31:0];
  _RAND_163 = {1{`RANDOM}};
  REG_1_2_debug_inst = _RAND_163[31:0];
  _RAND_164 = {1{`RANDOM}};
  REG_1_2_is_rvc = _RAND_164[0:0];
  _RAND_165 = {2{`RANDOM}};
  REG_1_2_debug_pc = _RAND_165[39:0];
  _RAND_166 = {1{`RANDOM}};
  REG_1_2_iq_type = _RAND_166[2:0];
  _RAND_167 = {1{`RANDOM}};
  REG_1_2_fu_code = _RAND_167[9:0];
  _RAND_168 = {1{`RANDOM}};
  REG_1_2_ctrl_br_type = _RAND_168[3:0];
  _RAND_169 = {1{`RANDOM}};
  REG_1_2_ctrl_op1_sel = _RAND_169[1:0];
  _RAND_170 = {1{`RANDOM}};
  REG_1_2_ctrl_op2_sel = _RAND_170[2:0];
  _RAND_171 = {1{`RANDOM}};
  REG_1_2_ctrl_imm_sel = _RAND_171[2:0];
  _RAND_172 = {1{`RANDOM}};
  REG_1_2_ctrl_op_fcn = _RAND_172[3:0];
  _RAND_173 = {1{`RANDOM}};
  REG_1_2_ctrl_fcn_dw = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  REG_1_2_ctrl_csr_cmd = _RAND_174[2:0];
  _RAND_175 = {1{`RANDOM}};
  REG_1_2_ctrl_is_load = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  REG_1_2_ctrl_is_sta = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  REG_1_2_ctrl_is_std = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  REG_1_2_iw_state = _RAND_178[1:0];
  _RAND_179 = {1{`RANDOM}};
  REG_1_2_iw_p1_poisoned = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  REG_1_2_iw_p2_poisoned = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  REG_1_2_is_br = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  REG_1_2_is_jalr = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  REG_1_2_is_jal = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  REG_1_2_is_sfb = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  REG_1_2_br_mask = _RAND_185[11:0];
  _RAND_186 = {1{`RANDOM}};
  REG_1_2_br_tag = _RAND_186[3:0];
  _RAND_187 = {1{`RANDOM}};
  REG_1_2_ftq_idx = _RAND_187[4:0];
  _RAND_188 = {1{`RANDOM}};
  REG_1_2_edge_inst = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  REG_1_2_pc_lob = _RAND_189[5:0];
  _RAND_190 = {1{`RANDOM}};
  REG_1_2_taken = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  REG_1_2_imm_packed = _RAND_191[19:0];
  _RAND_192 = {1{`RANDOM}};
  REG_1_2_csr_addr = _RAND_192[11:0];
  _RAND_193 = {1{`RANDOM}};
  REG_1_2_rob_idx = _RAND_193[5:0];
  _RAND_194 = {1{`RANDOM}};
  REG_1_2_ldq_idx = _RAND_194[3:0];
  _RAND_195 = {1{`RANDOM}};
  REG_1_2_stq_idx = _RAND_195[3:0];
  _RAND_196 = {1{`RANDOM}};
  REG_1_2_rxq_idx = _RAND_196[1:0];
  _RAND_197 = {1{`RANDOM}};
  REG_1_2_pdst = _RAND_197[5:0];
  _RAND_198 = {1{`RANDOM}};
  REG_1_2_prs1 = _RAND_198[5:0];
  _RAND_199 = {1{`RANDOM}};
  REG_1_2_prs2 = _RAND_199[5:0];
  _RAND_200 = {1{`RANDOM}};
  REG_1_2_prs3 = _RAND_200[5:0];
  _RAND_201 = {1{`RANDOM}};
  REG_1_2_ppred = _RAND_201[4:0];
  _RAND_202 = {1{`RANDOM}};
  REG_1_2_prs1_busy = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  REG_1_2_prs2_busy = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  REG_1_2_prs3_busy = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  REG_1_2_ppred_busy = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  REG_1_2_stale_pdst = _RAND_206[5:0];
  _RAND_207 = {1{`RANDOM}};
  REG_1_2_exception = _RAND_207[0:0];
  _RAND_208 = {2{`RANDOM}};
  REG_1_2_exc_cause = _RAND_208[63:0];
  _RAND_209 = {1{`RANDOM}};
  REG_1_2_bypassable = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  REG_1_2_mem_cmd = _RAND_210[4:0];
  _RAND_211 = {1{`RANDOM}};
  REG_1_2_mem_size = _RAND_211[1:0];
  _RAND_212 = {1{`RANDOM}};
  REG_1_2_mem_signed = _RAND_212[0:0];
  _RAND_213 = {1{`RANDOM}};
  REG_1_2_is_fence = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  REG_1_2_is_fencei = _RAND_214[0:0];
  _RAND_215 = {1{`RANDOM}};
  REG_1_2_is_amo = _RAND_215[0:0];
  _RAND_216 = {1{`RANDOM}};
  REG_1_2_uses_ldq = _RAND_216[0:0];
  _RAND_217 = {1{`RANDOM}};
  REG_1_2_uses_stq = _RAND_217[0:0];
  _RAND_218 = {1{`RANDOM}};
  REG_1_2_is_sys_pc2epc = _RAND_218[0:0];
  _RAND_219 = {1{`RANDOM}};
  REG_1_2_is_unique = _RAND_219[0:0];
  _RAND_220 = {1{`RANDOM}};
  REG_1_2_flush_on_commit = _RAND_220[0:0];
  _RAND_221 = {1{`RANDOM}};
  REG_1_2_ldst_is_rs1 = _RAND_221[0:0];
  _RAND_222 = {1{`RANDOM}};
  REG_1_2_ldst = _RAND_222[5:0];
  _RAND_223 = {1{`RANDOM}};
  REG_1_2_lrs1 = _RAND_223[5:0];
  _RAND_224 = {1{`RANDOM}};
  REG_1_2_lrs2 = _RAND_224[5:0];
  _RAND_225 = {1{`RANDOM}};
  REG_1_2_lrs3 = _RAND_225[5:0];
  _RAND_226 = {1{`RANDOM}};
  REG_1_2_ldst_val = _RAND_226[0:0];
  _RAND_227 = {1{`RANDOM}};
  REG_1_2_dst_rtype = _RAND_227[1:0];
  _RAND_228 = {1{`RANDOM}};
  REG_1_2_lrs1_rtype = _RAND_228[1:0];
  _RAND_229 = {1{`RANDOM}};
  REG_1_2_lrs2_rtype = _RAND_229[1:0];
  _RAND_230 = {1{`RANDOM}};
  REG_1_2_frs3_en = _RAND_230[0:0];
  _RAND_231 = {1{`RANDOM}};
  REG_1_2_fp_val = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  REG_1_2_fp_single = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  REG_1_2_xcpt_pf_if = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  REG_1_2_xcpt_ae_if = _RAND_234[0:0];
  _RAND_235 = {1{`RANDOM}};
  REG_1_2_xcpt_ma_if = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  REG_1_2_bp_debug_if = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  REG_1_2_bp_xcpt_if = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  REG_1_2_debug_fsrc = _RAND_238[1:0];
  _RAND_239 = {1{`RANDOM}};
  REG_1_2_debug_tsrc = _RAND_239[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
