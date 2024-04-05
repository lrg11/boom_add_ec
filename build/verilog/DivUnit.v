module DivUnit(
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
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
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
  reg [63:0] _RAND_47;
  reg [31:0] _RAND_48;
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
`endif // RANDOMIZE_REG_INIT
  wire  div_clock; // @[functional-unit.scala 675:19]
  wire  div_reset; // @[functional-unit.scala 675:19]
  wire  div_io_req_ready; // @[functional-unit.scala 675:19]
  wire  div_io_req_valid; // @[functional-unit.scala 675:19]
  wire [3:0] div_io_req_bits_fn; // @[functional-unit.scala 675:19]
  wire  div_io_req_bits_dw; // @[functional-unit.scala 675:19]
  wire [63:0] div_io_req_bits_in1; // @[functional-unit.scala 675:19]
  wire [63:0] div_io_req_bits_in2; // @[functional-unit.scala 675:19]
  wire [4:0] div_io_req_bits_tag; // @[functional-unit.scala 675:19]
  wire  div_io_kill; // @[functional-unit.scala 675:19]
  wire  div_io_resp_ready; // @[functional-unit.scala 675:19]
  wire  div_io_resp_valid; // @[functional-unit.scala 675:19]
  wire [63:0] div_io_resp_bits_data; // @[functional-unit.scala 675:19]
  wire [4:0] div_io_resp_bits_tag; // @[functional-unit.scala 675:19]
  reg [6:0] r_uop_uopc; // @[functional-unit.scala 645:18]
  reg [31:0] r_uop_inst; // @[functional-unit.scala 645:18]
  reg [31:0] r_uop_debug_inst; // @[functional-unit.scala 645:18]
  reg  r_uop_is_rvc; // @[functional-unit.scala 645:18]
  reg [39:0] r_uop_debug_pc; // @[functional-unit.scala 645:18]
  reg [2:0] r_uop_iq_type; // @[functional-unit.scala 645:18]
  reg [9:0] r_uop_fu_code; // @[functional-unit.scala 645:18]
  reg [3:0] r_uop_ctrl_br_type; // @[functional-unit.scala 645:18]
  reg [1:0] r_uop_ctrl_op1_sel; // @[functional-unit.scala 645:18]
  reg [2:0] r_uop_ctrl_op2_sel; // @[functional-unit.scala 645:18]
  reg [2:0] r_uop_ctrl_imm_sel; // @[functional-unit.scala 645:18]
  reg [3:0] r_uop_ctrl_op_fcn; // @[functional-unit.scala 645:18]
  reg  r_uop_ctrl_fcn_dw; // @[functional-unit.scala 645:18]
  reg [2:0] r_uop_ctrl_csr_cmd; // @[functional-unit.scala 645:18]
  reg  r_uop_ctrl_is_load; // @[functional-unit.scala 645:18]
  reg  r_uop_ctrl_is_sta; // @[functional-unit.scala 645:18]
  reg  r_uop_ctrl_is_std; // @[functional-unit.scala 645:18]
  reg [1:0] r_uop_iw_state; // @[functional-unit.scala 645:18]
  reg  r_uop_iw_p1_poisoned; // @[functional-unit.scala 645:18]
  reg  r_uop_iw_p2_poisoned; // @[functional-unit.scala 645:18]
  reg  r_uop_is_br; // @[functional-unit.scala 645:18]
  reg  r_uop_is_jalr; // @[functional-unit.scala 645:18]
  reg  r_uop_is_jal; // @[functional-unit.scala 645:18]
  reg  r_uop_is_sfb; // @[functional-unit.scala 645:18]
  reg [11:0] r_uop_br_mask; // @[functional-unit.scala 645:18]
  reg [3:0] r_uop_br_tag; // @[functional-unit.scala 645:18]
  reg [4:0] r_uop_ftq_idx; // @[functional-unit.scala 645:18]
  reg  r_uop_edge_inst; // @[functional-unit.scala 645:18]
  reg [5:0] r_uop_pc_lob; // @[functional-unit.scala 645:18]
  reg  r_uop_taken; // @[functional-unit.scala 645:18]
  reg [19:0] r_uop_imm_packed; // @[functional-unit.scala 645:18]
  reg [11:0] r_uop_csr_addr; // @[functional-unit.scala 645:18]
  reg [5:0] r_uop_rob_idx; // @[functional-unit.scala 645:18]
  reg [3:0] r_uop_ldq_idx; // @[functional-unit.scala 645:18]
  reg [3:0] r_uop_stq_idx; // @[functional-unit.scala 645:18]
  reg [1:0] r_uop_rxq_idx; // @[functional-unit.scala 645:18]
  reg [5:0] r_uop_pdst; // @[functional-unit.scala 645:18]
  reg [5:0] r_uop_prs1; // @[functional-unit.scala 645:18]
  reg [5:0] r_uop_prs2; // @[functional-unit.scala 645:18]
  reg [5:0] r_uop_prs3; // @[functional-unit.scala 645:18]
  reg [4:0] r_uop_ppred; // @[functional-unit.scala 645:18]
  reg  r_uop_prs1_busy; // @[functional-unit.scala 645:18]
  reg  r_uop_prs2_busy; // @[functional-unit.scala 645:18]
  reg  r_uop_prs3_busy; // @[functional-unit.scala 645:18]
  reg  r_uop_ppred_busy; // @[functional-unit.scala 645:18]
  reg [5:0] r_uop_stale_pdst; // @[functional-unit.scala 645:18]
  reg  r_uop_exception; // @[functional-unit.scala 645:18]
  reg [63:0] r_uop_exc_cause; // @[functional-unit.scala 645:18]
  reg  r_uop_bypassable; // @[functional-unit.scala 645:18]
  reg [4:0] r_uop_mem_cmd; // @[functional-unit.scala 645:18]
  reg [1:0] r_uop_mem_size; // @[functional-unit.scala 645:18]
  reg  r_uop_mem_signed; // @[functional-unit.scala 645:18]
  reg  r_uop_is_fence; // @[functional-unit.scala 645:18]
  reg  r_uop_is_fencei; // @[functional-unit.scala 645:18]
  reg  r_uop_is_amo; // @[functional-unit.scala 645:18]
  reg  r_uop_uses_ldq; // @[functional-unit.scala 645:18]
  reg  r_uop_uses_stq; // @[functional-unit.scala 645:18]
  reg  r_uop_is_sys_pc2epc; // @[functional-unit.scala 645:18]
  reg  r_uop_is_unique; // @[functional-unit.scala 645:18]
  reg  r_uop_flush_on_commit; // @[functional-unit.scala 645:18]
  reg  r_uop_ldst_is_rs1; // @[functional-unit.scala 645:18]
  reg [5:0] r_uop_ldst; // @[functional-unit.scala 645:18]
  reg [5:0] r_uop_lrs1; // @[functional-unit.scala 645:18]
  reg [5:0] r_uop_lrs2; // @[functional-unit.scala 645:18]
  reg [5:0] r_uop_lrs3; // @[functional-unit.scala 645:18]
  reg  r_uop_ldst_val; // @[functional-unit.scala 645:18]
  reg [1:0] r_uop_dst_rtype; // @[functional-unit.scala 645:18]
  reg [1:0] r_uop_lrs1_rtype; // @[functional-unit.scala 645:18]
  reg [1:0] r_uop_lrs2_rtype; // @[functional-unit.scala 645:18]
  reg  r_uop_frs3_en; // @[functional-unit.scala 645:18]
  reg  r_uop_fp_val; // @[functional-unit.scala 645:18]
  reg  r_uop_fp_single; // @[functional-unit.scala 645:18]
  reg  r_uop_xcpt_pf_if; // @[functional-unit.scala 645:18]
  reg  r_uop_xcpt_ae_if; // @[functional-unit.scala 645:18]
  reg  r_uop_xcpt_ma_if; // @[functional-unit.scala 645:18]
  reg  r_uop_bp_debug_if; // @[functional-unit.scala 645:18]
  reg  r_uop_bp_xcpt_if; // @[functional-unit.scala 645:18]
  reg [1:0] r_uop_debug_fsrc; // @[functional-unit.scala 645:18]
  reg [1:0] r_uop_debug_tsrc; // @[functional-unit.scala 645:18]
  wire  _T = io_req_ready & io_req_valid; // @[Decoupled.scala 40:37]
  wire [11:0] _T_1 = io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask; // @[util.scala 118:51]
  wire  _T_2 = _T_1 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_4 = ~io_brupdate_b1_resolve_mask; // @[util.scala 85:27]
  wire [11:0] _T_5 = io_req_bits_uop_br_mask & _T_4; // @[util.scala 85:25]
  wire [11:0] _T_6 = io_brupdate_b1_mispredict_mask & r_uop_br_mask; // @[util.scala 118:51]
  wire  _T_7 = _T_6 != 12'h0; // @[util.scala 118:59]
  wire [11:0] _T_10 = r_uop_br_mask & _T_4; // @[util.scala 85:25]
  wire  do_kill = _T ? _T_2 | io_req_bits_kill : _T_7 | io_req_bits_kill; // @[functional-unit.scala 650:24 functional-unit.scala 652:13 functional-unit.scala 656:13]
  wire  _T_11 = ~do_kill; // @[functional-unit.scala 678:42]
  MulDiv div ( // @[functional-unit.scala 675:19]
    .clock(div_clock),
    .reset(div_reset),
    .io_req_ready(div_io_req_ready),
    .io_req_valid(div_io_req_valid),
    .io_req_bits_fn(div_io_req_bits_fn),
    .io_req_bits_dw(div_io_req_bits_dw),
    .io_req_bits_in1(div_io_req_bits_in1),
    .io_req_bits_in2(div_io_req_bits_in2),
    .io_req_bits_tag(div_io_req_bits_tag),
    .io_kill(div_io_kill),
    .io_resp_ready(div_io_resp_ready),
    .io_resp_valid(div_io_resp_valid),
    .io_resp_bits_data(div_io_resp_bits_data),
    .io_resp_bits_tag(div_io_resp_bits_tag)
  );
  assign io_req_ready = div_io_req_ready; // @[functional-unit.scala 684:23]
  assign io_resp_valid = div_io_resp_valid & _T_11; // @[functional-unit.scala 690:44]
  assign io_resp_bits_uop_uopc = r_uop_uopc; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_inst = r_uop_inst; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_debug_inst = r_uop_debug_inst; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_is_rvc = r_uop_is_rvc; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_debug_pc = r_uop_debug_pc; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_iq_type = r_uop_iq_type; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_fu_code = r_uop_fu_code; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ctrl_br_type = r_uop_ctrl_br_type; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ctrl_op1_sel = r_uop_ctrl_op1_sel; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ctrl_op2_sel = r_uop_ctrl_op2_sel; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ctrl_imm_sel = r_uop_ctrl_imm_sel; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ctrl_op_fcn = r_uop_ctrl_op_fcn; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ctrl_fcn_dw = r_uop_ctrl_fcn_dw; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ctrl_csr_cmd = r_uop_ctrl_csr_cmd; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ctrl_is_load = r_uop_ctrl_is_load; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ctrl_is_sta = r_uop_ctrl_is_sta; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ctrl_is_std = r_uop_ctrl_is_std; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_iw_state = r_uop_iw_state; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_iw_p1_poisoned = r_uop_iw_p1_poisoned; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_iw_p2_poisoned = r_uop_iw_p2_poisoned; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_is_br = r_uop_is_br; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_is_jalr = r_uop_is_jalr; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_is_jal = r_uop_is_jal; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_is_sfb = r_uop_is_sfb; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_br_mask = r_uop_br_mask; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_br_tag = r_uop_br_tag; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ftq_idx = r_uop_ftq_idx; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_edge_inst = r_uop_edge_inst; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_pc_lob = r_uop_pc_lob; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_taken = r_uop_taken; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_imm_packed = r_uop_imm_packed; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_csr_addr = r_uop_csr_addr; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_rob_idx = r_uop_rob_idx; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ldq_idx = r_uop_ldq_idx; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_stq_idx = r_uop_stq_idx; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_rxq_idx = r_uop_rxq_idx; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_pdst = r_uop_pdst; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_prs1 = r_uop_prs1; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_prs2 = r_uop_prs2; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_prs3 = r_uop_prs3; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ppred = r_uop_ppred; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_prs1_busy = r_uop_prs1_busy; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_prs2_busy = r_uop_prs2_busy; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_prs3_busy = r_uop_prs3_busy; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ppred_busy = r_uop_ppred_busy; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_stale_pdst = r_uop_stale_pdst; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_exception = r_uop_exception; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_exc_cause = r_uop_exc_cause; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_bypassable = r_uop_bypassable; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_mem_cmd = r_uop_mem_cmd; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_mem_size = r_uop_mem_size; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_mem_signed = r_uop_mem_signed; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_is_fence = r_uop_is_fence; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_is_fencei = r_uop_is_fencei; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_is_amo = r_uop_is_amo; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_uses_ldq = r_uop_uses_ldq; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_uses_stq = r_uop_uses_stq; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_is_sys_pc2epc = r_uop_is_sys_pc2epc; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_is_unique = r_uop_is_unique; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_flush_on_commit = r_uop_flush_on_commit; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ldst_is_rs1 = r_uop_ldst_is_rs1; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ldst = r_uop_ldst; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_lrs1 = r_uop_lrs1; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_lrs2 = r_uop_lrs2; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_lrs3 = r_uop_lrs3; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_ldst_val = r_uop_ldst_val; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_dst_rtype = r_uop_dst_rtype; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_lrs1_rtype = r_uop_lrs1_rtype; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_lrs2_rtype = r_uop_lrs2_rtype; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_frs3_en = r_uop_frs3_en; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_fp_val = r_uop_fp_val; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_fp_single = r_uop_fp_single; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_xcpt_pf_if = r_uop_xcpt_pf_if; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_xcpt_ae_if = r_uop_xcpt_ae_if; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_xcpt_ma_if = r_uop_xcpt_ma_if; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_bp_debug_if = r_uop_bp_debug_if; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_bp_xcpt_if = r_uop_bp_xcpt_if; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_debug_fsrc = r_uop_debug_fsrc; // @[functional-unit.scala 661:20]
  assign io_resp_bits_uop_debug_tsrc = r_uop_debug_tsrc; // @[functional-unit.scala 661:20]
  assign io_resp_bits_predicated = 1'h0;
  assign io_resp_bits_data = div_io_resp_bits_data; // @[functional-unit.scala 692:23]
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
  assign div_clock = clock;
  assign div_reset = reset;
  assign div_io_req_valid = io_req_valid & ~do_kill; // @[functional-unit.scala 678:39]
  assign div_io_req_bits_fn = io_req_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 680:23]
  assign div_io_req_bits_dw = io_req_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 679:23]
  assign div_io_req_bits_in1 = io_req_bits_rs1_data; // @[functional-unit.scala 681:23]
  assign div_io_req_bits_in2 = io_req_bits_rs2_data; // @[functional-unit.scala 682:23]
  assign div_io_req_bits_tag = 5'h0;
  assign div_io_kill = _T ? _T_2 | io_req_bits_kill : _T_7 | io_req_bits_kill; // @[functional-unit.scala 650:24 functional-unit.scala 652:13 functional-unit.scala 656:13]
  assign div_io_resp_ready = io_resp_ready; // @[functional-unit.scala 691:23]
  always @(posedge clock) begin
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_uopc <= io_req_bits_uop_uopc; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_inst <= io_req_bits_uop_inst; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_debug_inst <= io_req_bits_uop_debug_inst; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_is_rvc <= io_req_bits_uop_is_rvc; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_debug_pc <= io_req_bits_uop_debug_pc; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_iq_type <= io_req_bits_uop_iq_type; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_fu_code <= io_req_bits_uop_fu_code; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ctrl_br_type <= io_req_bits_uop_ctrl_br_type; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ctrl_op1_sel <= io_req_bits_uop_ctrl_op1_sel; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ctrl_op2_sel <= io_req_bits_uop_ctrl_op2_sel; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ctrl_imm_sel <= io_req_bits_uop_ctrl_imm_sel; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ctrl_op_fcn <= io_req_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ctrl_fcn_dw <= io_req_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ctrl_csr_cmd <= io_req_bits_uop_ctrl_csr_cmd; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ctrl_is_load <= io_req_bits_uop_ctrl_is_load; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ctrl_is_sta <= io_req_bits_uop_ctrl_is_sta; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ctrl_is_std <= io_req_bits_uop_ctrl_is_std; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_iw_state <= io_req_bits_uop_iw_state; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_iw_p1_poisoned <= io_req_bits_uop_iw_p1_poisoned; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_iw_p2_poisoned <= io_req_bits_uop_iw_p2_poisoned; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_is_br <= io_req_bits_uop_is_br; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_is_jalr <= io_req_bits_uop_is_jalr; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_is_jal <= io_req_bits_uop_is_jal; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_is_sfb <= io_req_bits_uop_is_sfb; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_br_mask <= _T_5; // @[functional-unit.scala 654:19]
    end else begin
      r_uop_br_mask <= _T_10; // @[functional-unit.scala 657:19]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_br_tag <= io_req_bits_uop_br_tag; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ftq_idx <= io_req_bits_uop_ftq_idx; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_edge_inst <= io_req_bits_uop_edge_inst; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_pc_lob <= io_req_bits_uop_pc_lob; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_taken <= io_req_bits_uop_taken; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_imm_packed <= io_req_bits_uop_imm_packed; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_csr_addr <= io_req_bits_uop_csr_addr; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_rob_idx <= io_req_bits_uop_rob_idx; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ldq_idx <= io_req_bits_uop_ldq_idx; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_stq_idx <= io_req_bits_uop_stq_idx; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_rxq_idx <= io_req_bits_uop_rxq_idx; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_pdst <= io_req_bits_uop_pdst; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_prs1 <= io_req_bits_uop_prs1; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_prs2 <= io_req_bits_uop_prs2; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_prs3 <= io_req_bits_uop_prs3; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ppred <= io_req_bits_uop_ppred; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_prs1_busy <= io_req_bits_uop_prs1_busy; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_prs2_busy <= io_req_bits_uop_prs2_busy; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_prs3_busy <= io_req_bits_uop_prs3_busy; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ppred_busy <= io_req_bits_uop_ppred_busy; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_stale_pdst <= io_req_bits_uop_stale_pdst; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_exception <= io_req_bits_uop_exception; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_exc_cause <= io_req_bits_uop_exc_cause; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_bypassable <= io_req_bits_uop_bypassable; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_mem_cmd <= io_req_bits_uop_mem_cmd; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_mem_size <= io_req_bits_uop_mem_size; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_mem_signed <= io_req_bits_uop_mem_signed; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_is_fence <= io_req_bits_uop_is_fence; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_is_fencei <= io_req_bits_uop_is_fencei; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_is_amo <= io_req_bits_uop_is_amo; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_uses_ldq <= io_req_bits_uop_uses_ldq; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_uses_stq <= io_req_bits_uop_uses_stq; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_is_sys_pc2epc <= io_req_bits_uop_is_sys_pc2epc; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_is_unique <= io_req_bits_uop_is_unique; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_flush_on_commit <= io_req_bits_uop_flush_on_commit; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ldst_is_rs1 <= io_req_bits_uop_ldst_is_rs1; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ldst <= io_req_bits_uop_ldst; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_lrs1 <= io_req_bits_uop_lrs1; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_lrs2 <= io_req_bits_uop_lrs2; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_lrs3 <= io_req_bits_uop_lrs3; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_ldst_val <= io_req_bits_uop_ldst_val; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_dst_rtype <= io_req_bits_uop_dst_rtype; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_lrs1_rtype <= io_req_bits_uop_lrs1_rtype; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_lrs2_rtype <= io_req_bits_uop_lrs2_rtype; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_frs3_en <= io_req_bits_uop_frs3_en; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_fp_val <= io_req_bits_uop_fp_val; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_fp_single <= io_req_bits_uop_fp_single; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_xcpt_pf_if <= io_req_bits_uop_xcpt_pf_if; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_xcpt_ae_if <= io_req_bits_uop_xcpt_ae_if; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_xcpt_ma_if <= io_req_bits_uop_xcpt_ma_if; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_bp_debug_if <= io_req_bits_uop_bp_debug_if; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_bp_xcpt_if <= io_req_bits_uop_bp_xcpt_if; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_debug_fsrc <= io_req_bits_uop_debug_fsrc; // @[functional-unit.scala 653:11]
    end
    if (_T) begin // @[functional-unit.scala 650:24]
      r_uop_debug_tsrc <= io_req_bits_uop_debug_tsrc; // @[functional-unit.scala 653:11]
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
  r_uop_uopc = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  r_uop_inst = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  r_uop_debug_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  r_uop_is_rvc = _RAND_3[0:0];
  _RAND_4 = {2{`RANDOM}};
  r_uop_debug_pc = _RAND_4[39:0];
  _RAND_5 = {1{`RANDOM}};
  r_uop_iq_type = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  r_uop_fu_code = _RAND_6[9:0];
  _RAND_7 = {1{`RANDOM}};
  r_uop_ctrl_br_type = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  r_uop_ctrl_op1_sel = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  r_uop_ctrl_op2_sel = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  r_uop_ctrl_imm_sel = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  r_uop_ctrl_op_fcn = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  r_uop_ctrl_fcn_dw = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  r_uop_ctrl_csr_cmd = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  r_uop_ctrl_is_load = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  r_uop_ctrl_is_sta = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  r_uop_ctrl_is_std = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  r_uop_iw_state = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  r_uop_iw_p1_poisoned = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  r_uop_iw_p2_poisoned = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  r_uop_is_br = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  r_uop_is_jalr = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  r_uop_is_jal = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  r_uop_is_sfb = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  r_uop_br_mask = _RAND_24[11:0];
  _RAND_25 = {1{`RANDOM}};
  r_uop_br_tag = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  r_uop_ftq_idx = _RAND_26[4:0];
  _RAND_27 = {1{`RANDOM}};
  r_uop_edge_inst = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  r_uop_pc_lob = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  r_uop_taken = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  r_uop_imm_packed = _RAND_30[19:0];
  _RAND_31 = {1{`RANDOM}};
  r_uop_csr_addr = _RAND_31[11:0];
  _RAND_32 = {1{`RANDOM}};
  r_uop_rob_idx = _RAND_32[5:0];
  _RAND_33 = {1{`RANDOM}};
  r_uop_ldq_idx = _RAND_33[3:0];
  _RAND_34 = {1{`RANDOM}};
  r_uop_stq_idx = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  r_uop_rxq_idx = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  r_uop_pdst = _RAND_36[5:0];
  _RAND_37 = {1{`RANDOM}};
  r_uop_prs1 = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  r_uop_prs2 = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  r_uop_prs3 = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  r_uop_ppred = _RAND_40[4:0];
  _RAND_41 = {1{`RANDOM}};
  r_uop_prs1_busy = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  r_uop_prs2_busy = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  r_uop_prs3_busy = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  r_uop_ppred_busy = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  r_uop_stale_pdst = _RAND_45[5:0];
  _RAND_46 = {1{`RANDOM}};
  r_uop_exception = _RAND_46[0:0];
  _RAND_47 = {2{`RANDOM}};
  r_uop_exc_cause = _RAND_47[63:0];
  _RAND_48 = {1{`RANDOM}};
  r_uop_bypassable = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  r_uop_mem_cmd = _RAND_49[4:0];
  _RAND_50 = {1{`RANDOM}};
  r_uop_mem_size = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  r_uop_mem_signed = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  r_uop_is_fence = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  r_uop_is_fencei = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  r_uop_is_amo = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  r_uop_uses_ldq = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  r_uop_uses_stq = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  r_uop_is_sys_pc2epc = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  r_uop_is_unique = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  r_uop_flush_on_commit = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  r_uop_ldst_is_rs1 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  r_uop_ldst = _RAND_61[5:0];
  _RAND_62 = {1{`RANDOM}};
  r_uop_lrs1 = _RAND_62[5:0];
  _RAND_63 = {1{`RANDOM}};
  r_uop_lrs2 = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  r_uop_lrs3 = _RAND_64[5:0];
  _RAND_65 = {1{`RANDOM}};
  r_uop_ldst_val = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  r_uop_dst_rtype = _RAND_66[1:0];
  _RAND_67 = {1{`RANDOM}};
  r_uop_lrs1_rtype = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  r_uop_lrs2_rtype = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  r_uop_frs3_en = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  r_uop_fp_val = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  r_uop_fp_single = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  r_uop_xcpt_pf_if = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  r_uop_xcpt_ae_if = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  r_uop_xcpt_ma_if = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  r_uop_bp_debug_if = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  r_uop_bp_xcpt_if = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  r_uop_debug_fsrc = _RAND_77[1:0];
  _RAND_78 = {1{`RANDOM}};
  r_uop_debug_tsrc = _RAND_78[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
