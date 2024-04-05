module BoomNonBlockingDCache(
  input         clock,
  input         reset,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output [1:0]  auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [2:0]  auto_out_b_bits_opcode,
  input  [1:0]  auto_out_b_bits_param,
  input  [3:0]  auto_out_b_bits_size,
  input  [1:0]  auto_out_b_bits_source,
  input  [31:0] auto_out_b_bits_address,
  input  [7:0]  auto_out_b_bits_mask,
  input  [63:0] auto_out_b_bits_data,
  input         auto_out_b_bits_corrupt,
  input         auto_out_c_ready,
  output        auto_out_c_valid,
  output [2:0]  auto_out_c_bits_opcode,
  output [2:0]  auto_out_c_bits_param,
  output [3:0]  auto_out_c_bits_size,
  output [1:0]  auto_out_c_bits_source,
  output [31:0] auto_out_c_bits_address,
  output [63:0] auto_out_c_bits_data,
  output        auto_out_c_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input  [1:0]  auto_out_d_bits_source,
  input  [1:0]  auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt,
  input         auto_out_e_ready,
  output        auto_out_e_valid,
  output [1:0]  auto_out_e_bits_sink,
  output        io_errors_bus_valid,
  output [31:0] io_errors_bus_bits,
  output        io_lsu_req_ready,
  input         io_lsu_req_valid,
  input         io_lsu_req_bits_0_valid,
  input  [6:0]  io_lsu_req_bits_0_bits_uop_uopc,
  input  [31:0] io_lsu_req_bits_0_bits_uop_inst,
  input  [31:0] io_lsu_req_bits_0_bits_uop_debug_inst,
  input         io_lsu_req_bits_0_bits_uop_is_rvc,
  input  [39:0] io_lsu_req_bits_0_bits_uop_debug_pc,
  input  [2:0]  io_lsu_req_bits_0_bits_uop_iq_type,
  input  [9:0]  io_lsu_req_bits_0_bits_uop_fu_code,
  input  [3:0]  io_lsu_req_bits_0_bits_uop_ctrl_br_type,
  input  [1:0]  io_lsu_req_bits_0_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_lsu_req_bits_0_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_lsu_req_bits_0_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_lsu_req_bits_0_bits_uop_ctrl_op_fcn,
  input         io_lsu_req_bits_0_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_lsu_req_bits_0_bits_uop_ctrl_csr_cmd,
  input         io_lsu_req_bits_0_bits_uop_ctrl_is_load,
  input         io_lsu_req_bits_0_bits_uop_ctrl_is_sta,
  input         io_lsu_req_bits_0_bits_uop_ctrl_is_std,
  input  [1:0]  io_lsu_req_bits_0_bits_uop_iw_state,
  input         io_lsu_req_bits_0_bits_uop_iw_p1_poisoned,
  input         io_lsu_req_bits_0_bits_uop_iw_p2_poisoned,
  input         io_lsu_req_bits_0_bits_uop_is_br,
  input         io_lsu_req_bits_0_bits_uop_is_jalr,
  input         io_lsu_req_bits_0_bits_uop_is_jal,
  input         io_lsu_req_bits_0_bits_uop_is_sfb,
  input  [11:0] io_lsu_req_bits_0_bits_uop_br_mask,
  input  [3:0]  io_lsu_req_bits_0_bits_uop_br_tag,
  input  [4:0]  io_lsu_req_bits_0_bits_uop_ftq_idx,
  input         io_lsu_req_bits_0_bits_uop_edge_inst,
  input  [5:0]  io_lsu_req_bits_0_bits_uop_pc_lob,
  input         io_lsu_req_bits_0_bits_uop_taken,
  input  [19:0] io_lsu_req_bits_0_bits_uop_imm_packed,
  input  [11:0] io_lsu_req_bits_0_bits_uop_csr_addr,
  input  [5:0]  io_lsu_req_bits_0_bits_uop_rob_idx,
  input  [3:0]  io_lsu_req_bits_0_bits_uop_ldq_idx,
  input  [3:0]  io_lsu_req_bits_0_bits_uop_stq_idx,
  input  [1:0]  io_lsu_req_bits_0_bits_uop_rxq_idx,
  input  [5:0]  io_lsu_req_bits_0_bits_uop_pdst,
  input  [5:0]  io_lsu_req_bits_0_bits_uop_prs1,
  input  [5:0]  io_lsu_req_bits_0_bits_uop_prs2,
  input  [5:0]  io_lsu_req_bits_0_bits_uop_prs3,
  input  [4:0]  io_lsu_req_bits_0_bits_uop_ppred,
  input         io_lsu_req_bits_0_bits_uop_prs1_busy,
  input         io_lsu_req_bits_0_bits_uop_prs2_busy,
  input         io_lsu_req_bits_0_bits_uop_prs3_busy,
  input         io_lsu_req_bits_0_bits_uop_ppred_busy,
  input  [5:0]  io_lsu_req_bits_0_bits_uop_stale_pdst,
  input         io_lsu_req_bits_0_bits_uop_exception,
  input  [63:0] io_lsu_req_bits_0_bits_uop_exc_cause,
  input         io_lsu_req_bits_0_bits_uop_bypassable,
  input  [4:0]  io_lsu_req_bits_0_bits_uop_mem_cmd,
  input  [1:0]  io_lsu_req_bits_0_bits_uop_mem_size,
  input         io_lsu_req_bits_0_bits_uop_mem_signed,
  input         io_lsu_req_bits_0_bits_uop_is_fence,
  input         io_lsu_req_bits_0_bits_uop_is_fencei,
  input         io_lsu_req_bits_0_bits_uop_is_amo,
  input         io_lsu_req_bits_0_bits_uop_uses_ldq,
  input         io_lsu_req_bits_0_bits_uop_uses_stq,
  input         io_lsu_req_bits_0_bits_uop_is_sys_pc2epc,
  input         io_lsu_req_bits_0_bits_uop_is_unique,
  input         io_lsu_req_bits_0_bits_uop_flush_on_commit,
  input         io_lsu_req_bits_0_bits_uop_ldst_is_rs1,
  input  [5:0]  io_lsu_req_bits_0_bits_uop_ldst,
  input  [5:0]  io_lsu_req_bits_0_bits_uop_lrs1,
  input  [5:0]  io_lsu_req_bits_0_bits_uop_lrs2,
  input  [5:0]  io_lsu_req_bits_0_bits_uop_lrs3,
  input         io_lsu_req_bits_0_bits_uop_ldst_val,
  input  [1:0]  io_lsu_req_bits_0_bits_uop_dst_rtype,
  input  [1:0]  io_lsu_req_bits_0_bits_uop_lrs1_rtype,
  input  [1:0]  io_lsu_req_bits_0_bits_uop_lrs2_rtype,
  input         io_lsu_req_bits_0_bits_uop_frs3_en,
  input         io_lsu_req_bits_0_bits_uop_fp_val,
  input         io_lsu_req_bits_0_bits_uop_fp_single,
  input         io_lsu_req_bits_0_bits_uop_xcpt_pf_if,
  input         io_lsu_req_bits_0_bits_uop_xcpt_ae_if,
  input         io_lsu_req_bits_0_bits_uop_xcpt_ma_if,
  input         io_lsu_req_bits_0_bits_uop_bp_debug_if,
  input         io_lsu_req_bits_0_bits_uop_bp_xcpt_if,
  input  [1:0]  io_lsu_req_bits_0_bits_uop_debug_fsrc,
  input  [1:0]  io_lsu_req_bits_0_bits_uop_debug_tsrc,
  input  [39:0] io_lsu_req_bits_0_bits_addr,
  input  [63:0] io_lsu_req_bits_0_bits_data,
  input         io_lsu_req_bits_0_bits_is_hella,
  input         io_lsu_s1_kill_0,
  output        io_lsu_resp_0_valid,
  output [6:0]  io_lsu_resp_0_bits_uop_uopc,
  output [31:0] io_lsu_resp_0_bits_uop_inst,
  output [31:0] io_lsu_resp_0_bits_uop_debug_inst,
  output        io_lsu_resp_0_bits_uop_is_rvc,
  output [39:0] io_lsu_resp_0_bits_uop_debug_pc,
  output [2:0]  io_lsu_resp_0_bits_uop_iq_type,
  output [9:0]  io_lsu_resp_0_bits_uop_fu_code,
  output [3:0]  io_lsu_resp_0_bits_uop_ctrl_br_type,
  output [1:0]  io_lsu_resp_0_bits_uop_ctrl_op1_sel,
  output [2:0]  io_lsu_resp_0_bits_uop_ctrl_op2_sel,
  output [2:0]  io_lsu_resp_0_bits_uop_ctrl_imm_sel,
  output [3:0]  io_lsu_resp_0_bits_uop_ctrl_op_fcn,
  output        io_lsu_resp_0_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_lsu_resp_0_bits_uop_ctrl_csr_cmd,
  output        io_lsu_resp_0_bits_uop_ctrl_is_load,
  output        io_lsu_resp_0_bits_uop_ctrl_is_sta,
  output        io_lsu_resp_0_bits_uop_ctrl_is_std,
  output [1:0]  io_lsu_resp_0_bits_uop_iw_state,
  output        io_lsu_resp_0_bits_uop_iw_p1_poisoned,
  output        io_lsu_resp_0_bits_uop_iw_p2_poisoned,
  output        io_lsu_resp_0_bits_uop_is_br,
  output        io_lsu_resp_0_bits_uop_is_jalr,
  output        io_lsu_resp_0_bits_uop_is_jal,
  output        io_lsu_resp_0_bits_uop_is_sfb,
  output [11:0] io_lsu_resp_0_bits_uop_br_mask,
  output [3:0]  io_lsu_resp_0_bits_uop_br_tag,
  output [4:0]  io_lsu_resp_0_bits_uop_ftq_idx,
  output        io_lsu_resp_0_bits_uop_edge_inst,
  output [5:0]  io_lsu_resp_0_bits_uop_pc_lob,
  output        io_lsu_resp_0_bits_uop_taken,
  output [19:0] io_lsu_resp_0_bits_uop_imm_packed,
  output [11:0] io_lsu_resp_0_bits_uop_csr_addr,
  output [5:0]  io_lsu_resp_0_bits_uop_rob_idx,
  output [3:0]  io_lsu_resp_0_bits_uop_ldq_idx,
  output [3:0]  io_lsu_resp_0_bits_uop_stq_idx,
  output [1:0]  io_lsu_resp_0_bits_uop_rxq_idx,
  output [5:0]  io_lsu_resp_0_bits_uop_pdst,
  output [5:0]  io_lsu_resp_0_bits_uop_prs1,
  output [5:0]  io_lsu_resp_0_bits_uop_prs2,
  output [5:0]  io_lsu_resp_0_bits_uop_prs3,
  output [4:0]  io_lsu_resp_0_bits_uop_ppred,
  output        io_lsu_resp_0_bits_uop_prs1_busy,
  output        io_lsu_resp_0_bits_uop_prs2_busy,
  output        io_lsu_resp_0_bits_uop_prs3_busy,
  output        io_lsu_resp_0_bits_uop_ppred_busy,
  output [5:0]  io_lsu_resp_0_bits_uop_stale_pdst,
  output        io_lsu_resp_0_bits_uop_exception,
  output [63:0] io_lsu_resp_0_bits_uop_exc_cause,
  output        io_lsu_resp_0_bits_uop_bypassable,
  output [4:0]  io_lsu_resp_0_bits_uop_mem_cmd,
  output [1:0]  io_lsu_resp_0_bits_uop_mem_size,
  output        io_lsu_resp_0_bits_uop_mem_signed,
  output        io_lsu_resp_0_bits_uop_is_fence,
  output        io_lsu_resp_0_bits_uop_is_fencei,
  output        io_lsu_resp_0_bits_uop_is_amo,
  output        io_lsu_resp_0_bits_uop_uses_ldq,
  output        io_lsu_resp_0_bits_uop_uses_stq,
  output        io_lsu_resp_0_bits_uop_is_sys_pc2epc,
  output        io_lsu_resp_0_bits_uop_is_unique,
  output        io_lsu_resp_0_bits_uop_flush_on_commit,
  output        io_lsu_resp_0_bits_uop_ldst_is_rs1,
  output [5:0]  io_lsu_resp_0_bits_uop_ldst,
  output [5:0]  io_lsu_resp_0_bits_uop_lrs1,
  output [5:0]  io_lsu_resp_0_bits_uop_lrs2,
  output [5:0]  io_lsu_resp_0_bits_uop_lrs3,
  output        io_lsu_resp_0_bits_uop_ldst_val,
  output [1:0]  io_lsu_resp_0_bits_uop_dst_rtype,
  output [1:0]  io_lsu_resp_0_bits_uop_lrs1_rtype,
  output [1:0]  io_lsu_resp_0_bits_uop_lrs2_rtype,
  output        io_lsu_resp_0_bits_uop_frs3_en,
  output        io_lsu_resp_0_bits_uop_fp_val,
  output        io_lsu_resp_0_bits_uop_fp_single,
  output        io_lsu_resp_0_bits_uop_xcpt_pf_if,
  output        io_lsu_resp_0_bits_uop_xcpt_ae_if,
  output        io_lsu_resp_0_bits_uop_xcpt_ma_if,
  output        io_lsu_resp_0_bits_uop_bp_debug_if,
  output        io_lsu_resp_0_bits_uop_bp_xcpt_if,
  output [1:0]  io_lsu_resp_0_bits_uop_debug_fsrc,
  output [1:0]  io_lsu_resp_0_bits_uop_debug_tsrc,
  output [63:0] io_lsu_resp_0_bits_data,
  output        io_lsu_resp_0_bits_is_hella,
  output        io_lsu_nack_0_valid,
  output [6:0]  io_lsu_nack_0_bits_uop_uopc,
  output [31:0] io_lsu_nack_0_bits_uop_inst,
  output [31:0] io_lsu_nack_0_bits_uop_debug_inst,
  output        io_lsu_nack_0_bits_uop_is_rvc,
  output [39:0] io_lsu_nack_0_bits_uop_debug_pc,
  output [2:0]  io_lsu_nack_0_bits_uop_iq_type,
  output [9:0]  io_lsu_nack_0_bits_uop_fu_code,
  output [3:0]  io_lsu_nack_0_bits_uop_ctrl_br_type,
  output [1:0]  io_lsu_nack_0_bits_uop_ctrl_op1_sel,
  output [2:0]  io_lsu_nack_0_bits_uop_ctrl_op2_sel,
  output [2:0]  io_lsu_nack_0_bits_uop_ctrl_imm_sel,
  output [3:0]  io_lsu_nack_0_bits_uop_ctrl_op_fcn,
  output        io_lsu_nack_0_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_lsu_nack_0_bits_uop_ctrl_csr_cmd,
  output        io_lsu_nack_0_bits_uop_ctrl_is_load,
  output        io_lsu_nack_0_bits_uop_ctrl_is_sta,
  output        io_lsu_nack_0_bits_uop_ctrl_is_std,
  output [1:0]  io_lsu_nack_0_bits_uop_iw_state,
  output        io_lsu_nack_0_bits_uop_iw_p1_poisoned,
  output        io_lsu_nack_0_bits_uop_iw_p2_poisoned,
  output        io_lsu_nack_0_bits_uop_is_br,
  output        io_lsu_nack_0_bits_uop_is_jalr,
  output        io_lsu_nack_0_bits_uop_is_jal,
  output        io_lsu_nack_0_bits_uop_is_sfb,
  output [11:0] io_lsu_nack_0_bits_uop_br_mask,
  output [3:0]  io_lsu_nack_0_bits_uop_br_tag,
  output [4:0]  io_lsu_nack_0_bits_uop_ftq_idx,
  output        io_lsu_nack_0_bits_uop_edge_inst,
  output [5:0]  io_lsu_nack_0_bits_uop_pc_lob,
  output        io_lsu_nack_0_bits_uop_taken,
  output [19:0] io_lsu_nack_0_bits_uop_imm_packed,
  output [11:0] io_lsu_nack_0_bits_uop_csr_addr,
  output [5:0]  io_lsu_nack_0_bits_uop_rob_idx,
  output [3:0]  io_lsu_nack_0_bits_uop_ldq_idx,
  output [3:0]  io_lsu_nack_0_bits_uop_stq_idx,
  output [1:0]  io_lsu_nack_0_bits_uop_rxq_idx,
  output [5:0]  io_lsu_nack_0_bits_uop_pdst,
  output [5:0]  io_lsu_nack_0_bits_uop_prs1,
  output [5:0]  io_lsu_nack_0_bits_uop_prs2,
  output [5:0]  io_lsu_nack_0_bits_uop_prs3,
  output [4:0]  io_lsu_nack_0_bits_uop_ppred,
  output        io_lsu_nack_0_bits_uop_prs1_busy,
  output        io_lsu_nack_0_bits_uop_prs2_busy,
  output        io_lsu_nack_0_bits_uop_prs3_busy,
  output        io_lsu_nack_0_bits_uop_ppred_busy,
  output [5:0]  io_lsu_nack_0_bits_uop_stale_pdst,
  output        io_lsu_nack_0_bits_uop_exception,
  output [63:0] io_lsu_nack_0_bits_uop_exc_cause,
  output        io_lsu_nack_0_bits_uop_bypassable,
  output [4:0]  io_lsu_nack_0_bits_uop_mem_cmd,
  output [1:0]  io_lsu_nack_0_bits_uop_mem_size,
  output        io_lsu_nack_0_bits_uop_mem_signed,
  output        io_lsu_nack_0_bits_uop_is_fence,
  output        io_lsu_nack_0_bits_uop_is_fencei,
  output        io_lsu_nack_0_bits_uop_is_amo,
  output        io_lsu_nack_0_bits_uop_uses_ldq,
  output        io_lsu_nack_0_bits_uop_uses_stq,
  output        io_lsu_nack_0_bits_uop_is_sys_pc2epc,
  output        io_lsu_nack_0_bits_uop_is_unique,
  output        io_lsu_nack_0_bits_uop_flush_on_commit,
  output        io_lsu_nack_0_bits_uop_ldst_is_rs1,
  output [5:0]  io_lsu_nack_0_bits_uop_ldst,
  output [5:0]  io_lsu_nack_0_bits_uop_lrs1,
  output [5:0]  io_lsu_nack_0_bits_uop_lrs2,
  output [5:0]  io_lsu_nack_0_bits_uop_lrs3,
  output        io_lsu_nack_0_bits_uop_ldst_val,
  output [1:0]  io_lsu_nack_0_bits_uop_dst_rtype,
  output [1:0]  io_lsu_nack_0_bits_uop_lrs1_rtype,
  output [1:0]  io_lsu_nack_0_bits_uop_lrs2_rtype,
  output        io_lsu_nack_0_bits_uop_frs3_en,
  output        io_lsu_nack_0_bits_uop_fp_val,
  output        io_lsu_nack_0_bits_uop_fp_single,
  output        io_lsu_nack_0_bits_uop_xcpt_pf_if,
  output        io_lsu_nack_0_bits_uop_xcpt_ae_if,
  output        io_lsu_nack_0_bits_uop_xcpt_ma_if,
  output        io_lsu_nack_0_bits_uop_bp_debug_if,
  output        io_lsu_nack_0_bits_uop_bp_xcpt_if,
  output [1:0]  io_lsu_nack_0_bits_uop_debug_fsrc,
  output [1:0]  io_lsu_nack_0_bits_uop_debug_tsrc,
  output [39:0] io_lsu_nack_0_bits_addr,
  output [63:0] io_lsu_nack_0_bits_data,
  output        io_lsu_nack_0_bits_is_hella,
  input  [11:0] io_lsu_brupdate_b1_resolve_mask,
  input  [11:0] io_lsu_brupdate_b1_mispredict_mask,
  input  [6:0]  io_lsu_brupdate_b2_uop_uopc,
  input  [31:0] io_lsu_brupdate_b2_uop_inst,
  input  [31:0] io_lsu_brupdate_b2_uop_debug_inst,
  input         io_lsu_brupdate_b2_uop_is_rvc,
  input  [39:0] io_lsu_brupdate_b2_uop_debug_pc,
  input  [2:0]  io_lsu_brupdate_b2_uop_iq_type,
  input  [9:0]  io_lsu_brupdate_b2_uop_fu_code,
  input  [3:0]  io_lsu_brupdate_b2_uop_ctrl_br_type,
  input  [1:0]  io_lsu_brupdate_b2_uop_ctrl_op1_sel,
  input  [2:0]  io_lsu_brupdate_b2_uop_ctrl_op2_sel,
  input  [2:0]  io_lsu_brupdate_b2_uop_ctrl_imm_sel,
  input  [3:0]  io_lsu_brupdate_b2_uop_ctrl_op_fcn,
  input         io_lsu_brupdate_b2_uop_ctrl_fcn_dw,
  input  [2:0]  io_lsu_brupdate_b2_uop_ctrl_csr_cmd,
  input         io_lsu_brupdate_b2_uop_ctrl_is_load,
  input         io_lsu_brupdate_b2_uop_ctrl_is_sta,
  input         io_lsu_brupdate_b2_uop_ctrl_is_std,
  input  [1:0]  io_lsu_brupdate_b2_uop_iw_state,
  input         io_lsu_brupdate_b2_uop_iw_p1_poisoned,
  input         io_lsu_brupdate_b2_uop_iw_p2_poisoned,
  input         io_lsu_brupdate_b2_uop_is_br,
  input         io_lsu_brupdate_b2_uop_is_jalr,
  input         io_lsu_brupdate_b2_uop_is_jal,
  input         io_lsu_brupdate_b2_uop_is_sfb,
  input  [11:0] io_lsu_brupdate_b2_uop_br_mask,
  input  [3:0]  io_lsu_brupdate_b2_uop_br_tag,
  input  [4:0]  io_lsu_brupdate_b2_uop_ftq_idx,
  input         io_lsu_brupdate_b2_uop_edge_inst,
  input  [5:0]  io_lsu_brupdate_b2_uop_pc_lob,
  input         io_lsu_brupdate_b2_uop_taken,
  input  [19:0] io_lsu_brupdate_b2_uop_imm_packed,
  input  [11:0] io_lsu_brupdate_b2_uop_csr_addr,
  input  [5:0]  io_lsu_brupdate_b2_uop_rob_idx,
  input  [3:0]  io_lsu_brupdate_b2_uop_ldq_idx,
  input  [3:0]  io_lsu_brupdate_b2_uop_stq_idx,
  input  [1:0]  io_lsu_brupdate_b2_uop_rxq_idx,
  input  [5:0]  io_lsu_brupdate_b2_uop_pdst,
  input  [5:0]  io_lsu_brupdate_b2_uop_prs1,
  input  [5:0]  io_lsu_brupdate_b2_uop_prs2,
  input  [5:0]  io_lsu_brupdate_b2_uop_prs3,
  input  [4:0]  io_lsu_brupdate_b2_uop_ppred,
  input         io_lsu_brupdate_b2_uop_prs1_busy,
  input         io_lsu_brupdate_b2_uop_prs2_busy,
  input         io_lsu_brupdate_b2_uop_prs3_busy,
  input         io_lsu_brupdate_b2_uop_ppred_busy,
  input  [5:0]  io_lsu_brupdate_b2_uop_stale_pdst,
  input         io_lsu_brupdate_b2_uop_exception,
  input  [63:0] io_lsu_brupdate_b2_uop_exc_cause,
  input         io_lsu_brupdate_b2_uop_bypassable,
  input  [4:0]  io_lsu_brupdate_b2_uop_mem_cmd,
  input  [1:0]  io_lsu_brupdate_b2_uop_mem_size,
  input         io_lsu_brupdate_b2_uop_mem_signed,
  input         io_lsu_brupdate_b2_uop_is_fence,
  input         io_lsu_brupdate_b2_uop_is_fencei,
  input         io_lsu_brupdate_b2_uop_is_amo,
  input         io_lsu_brupdate_b2_uop_uses_ldq,
  input         io_lsu_brupdate_b2_uop_uses_stq,
  input         io_lsu_brupdate_b2_uop_is_sys_pc2epc,
  input         io_lsu_brupdate_b2_uop_is_unique,
  input         io_lsu_brupdate_b2_uop_flush_on_commit,
  input         io_lsu_brupdate_b2_uop_ldst_is_rs1,
  input  [5:0]  io_lsu_brupdate_b2_uop_ldst,
  input  [5:0]  io_lsu_brupdate_b2_uop_lrs1,
  input  [5:0]  io_lsu_brupdate_b2_uop_lrs2,
  input  [5:0]  io_lsu_brupdate_b2_uop_lrs3,
  input         io_lsu_brupdate_b2_uop_ldst_val,
  input  [1:0]  io_lsu_brupdate_b2_uop_dst_rtype,
  input  [1:0]  io_lsu_brupdate_b2_uop_lrs1_rtype,
  input  [1:0]  io_lsu_brupdate_b2_uop_lrs2_rtype,
  input         io_lsu_brupdate_b2_uop_frs3_en,
  input         io_lsu_brupdate_b2_uop_fp_val,
  input         io_lsu_brupdate_b2_uop_fp_single,
  input         io_lsu_brupdate_b2_uop_xcpt_pf_if,
  input         io_lsu_brupdate_b2_uop_xcpt_ae_if,
  input         io_lsu_brupdate_b2_uop_xcpt_ma_if,
  input         io_lsu_brupdate_b2_uop_bp_debug_if,
  input         io_lsu_brupdate_b2_uop_bp_xcpt_if,
  input  [1:0]  io_lsu_brupdate_b2_uop_debug_fsrc,
  input  [1:0]  io_lsu_brupdate_b2_uop_debug_tsrc,
  input         io_lsu_brupdate_b2_valid,
  input         io_lsu_brupdate_b2_mispredict,
  input         io_lsu_brupdate_b2_taken,
  input  [2:0]  io_lsu_brupdate_b2_cfi_type,
  input  [1:0]  io_lsu_brupdate_b2_pc_sel,
  input  [39:0] io_lsu_brupdate_b2_jalr_target,
  input  [20:0] io_lsu_brupdate_b2_target_offset,
  input         io_lsu_exception,
  input  [5:0]  io_lsu_rob_pnr_idx,
  input  [5:0]  io_lsu_rob_head_idx,
  input         io_lsu_release_ready,
  output        io_lsu_release_valid,
  output [2:0]  io_lsu_release_bits_opcode,
  output [2:0]  io_lsu_release_bits_param,
  output [3:0]  io_lsu_release_bits_size,
  output [1:0]  io_lsu_release_bits_source,
  output [31:0] io_lsu_release_bits_address,
  output [63:0] io_lsu_release_bits_data,
  output        io_lsu_release_bits_corrupt,
  input         io_lsu_force_order,
  output        io_lsu_ordered,
  output        io_lsu_perf_acquire,
  output        io_lsu_perf_release
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
  reg [63:0] _RAND_79;
  reg [63:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
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
  reg [63:0] _RAND_106;
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
  reg [63:0] _RAND_149;
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
  reg [31:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [63:0] _RAND_179;
  reg [63:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [63:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [63:0] _RAND_185;
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
  reg [63:0] _RAND_212;
  reg [63:0] _RAND_213;
  reg [31:0] _RAND_214;
  reg [63:0] _RAND_215;
  reg [63:0] _RAND_216;
  reg [31:0] _RAND_217;
  reg [63:0] _RAND_218;
  reg [63:0] _RAND_219;
  reg [31:0] _RAND_220;
`endif // RANDOMIZE_REG_INIT
  wire  wb_clock; // @[dcache.scala 430:18]
  wire  wb_reset; // @[dcache.scala 430:18]
  wire  wb_io_req_ready; // @[dcache.scala 430:18]
  wire  wb_io_req_valid; // @[dcache.scala 430:18]
  wire [19:0] wb_io_req_bits_tag; // @[dcache.scala 430:18]
  wire [5:0] wb_io_req_bits_idx; // @[dcache.scala 430:18]
  wire [1:0] wb_io_req_bits_source; // @[dcache.scala 430:18]
  wire [2:0] wb_io_req_bits_param; // @[dcache.scala 430:18]
  wire [3:0] wb_io_req_bits_way_en; // @[dcache.scala 430:18]
  wire  wb_io_req_bits_voluntary; // @[dcache.scala 430:18]
  wire  wb_io_meta_read_ready; // @[dcache.scala 430:18]
  wire  wb_io_meta_read_valid; // @[dcache.scala 430:18]
  wire [5:0] wb_io_meta_read_bits_idx; // @[dcache.scala 430:18]
  wire [3:0] wb_io_meta_read_bits_way_en; // @[dcache.scala 430:18]
  wire [19:0] wb_io_meta_read_bits_tag; // @[dcache.scala 430:18]
  wire  wb_io_resp; // @[dcache.scala 430:18]
  wire  wb_io_idx_valid; // @[dcache.scala 430:18]
  wire [5:0] wb_io_idx_bits; // @[dcache.scala 430:18]
  wire  wb_io_data_req_ready; // @[dcache.scala 430:18]
  wire  wb_io_data_req_valid; // @[dcache.scala 430:18]
  wire [3:0] wb_io_data_req_bits_way_en; // @[dcache.scala 430:18]
  wire [11:0] wb_io_data_req_bits_addr; // @[dcache.scala 430:18]
  wire [63:0] wb_io_data_resp; // @[dcache.scala 430:18]
  wire  wb_io_mem_grant; // @[dcache.scala 430:18]
  wire  wb_io_release_ready; // @[dcache.scala 430:18]
  wire  wb_io_release_valid; // @[dcache.scala 430:18]
  wire [2:0] wb_io_release_bits_opcode; // @[dcache.scala 430:18]
  wire [2:0] wb_io_release_bits_param; // @[dcache.scala 430:18]
  wire [3:0] wb_io_release_bits_size; // @[dcache.scala 430:18]
  wire [1:0] wb_io_release_bits_source; // @[dcache.scala 430:18]
  wire [31:0] wb_io_release_bits_address; // @[dcache.scala 430:18]
  wire [63:0] wb_io_release_bits_data; // @[dcache.scala 430:18]
  wire  wb_io_release_bits_corrupt; // @[dcache.scala 430:18]
  wire  wb_io_lsu_release_ready; // @[dcache.scala 430:18]
  wire  wb_io_lsu_release_valid; // @[dcache.scala 430:18]
  wire [2:0] wb_io_lsu_release_bits_opcode; // @[dcache.scala 430:18]
  wire [2:0] wb_io_lsu_release_bits_param; // @[dcache.scala 430:18]
  wire [3:0] wb_io_lsu_release_bits_size; // @[dcache.scala 430:18]
  wire [1:0] wb_io_lsu_release_bits_source; // @[dcache.scala 430:18]
  wire [31:0] wb_io_lsu_release_bits_address; // @[dcache.scala 430:18]
  wire [63:0] wb_io_lsu_release_bits_data; // @[dcache.scala 430:18]
  wire  wb_io_lsu_release_bits_corrupt; // @[dcache.scala 430:18]
  wire  prober_clock; // @[dcache.scala 431:22]
  wire  prober_reset; // @[dcache.scala 431:22]
  wire  prober_io_req_ready; // @[dcache.scala 431:22]
  wire  prober_io_req_valid; // @[dcache.scala 431:22]
  wire [2:0] prober_io_req_bits_opcode; // @[dcache.scala 431:22]
  wire [1:0] prober_io_req_bits_param; // @[dcache.scala 431:22]
  wire [3:0] prober_io_req_bits_size; // @[dcache.scala 431:22]
  wire [1:0] prober_io_req_bits_source; // @[dcache.scala 431:22]
  wire [31:0] prober_io_req_bits_address; // @[dcache.scala 431:22]
  wire [7:0] prober_io_req_bits_mask; // @[dcache.scala 431:22]
  wire [63:0] prober_io_req_bits_data; // @[dcache.scala 431:22]
  wire  prober_io_req_bits_corrupt; // @[dcache.scala 431:22]
  wire  prober_io_rep_ready; // @[dcache.scala 431:22]
  wire  prober_io_rep_valid; // @[dcache.scala 431:22]
  wire [2:0] prober_io_rep_bits_opcode; // @[dcache.scala 431:22]
  wire [2:0] prober_io_rep_bits_param; // @[dcache.scala 431:22]
  wire [3:0] prober_io_rep_bits_size; // @[dcache.scala 431:22]
  wire [1:0] prober_io_rep_bits_source; // @[dcache.scala 431:22]
  wire [31:0] prober_io_rep_bits_address; // @[dcache.scala 431:22]
  wire [63:0] prober_io_rep_bits_data; // @[dcache.scala 431:22]
  wire  prober_io_rep_bits_corrupt; // @[dcache.scala 431:22]
  wire  prober_io_meta_read_ready; // @[dcache.scala 431:22]
  wire  prober_io_meta_read_valid; // @[dcache.scala 431:22]
  wire [5:0] prober_io_meta_read_bits_idx; // @[dcache.scala 431:22]
  wire [3:0] prober_io_meta_read_bits_way_en; // @[dcache.scala 431:22]
  wire [19:0] prober_io_meta_read_bits_tag; // @[dcache.scala 431:22]
  wire  prober_io_meta_write_ready; // @[dcache.scala 431:22]
  wire  prober_io_meta_write_valid; // @[dcache.scala 431:22]
  wire [5:0] prober_io_meta_write_bits_idx; // @[dcache.scala 431:22]
  wire [3:0] prober_io_meta_write_bits_way_en; // @[dcache.scala 431:22]
  wire [19:0] prober_io_meta_write_bits_tag; // @[dcache.scala 431:22]
  wire [1:0] prober_io_meta_write_bits_data_coh_state; // @[dcache.scala 431:22]
  wire [19:0] prober_io_meta_write_bits_data_tag; // @[dcache.scala 431:22]
  wire  prober_io_wb_req_ready; // @[dcache.scala 431:22]
  wire  prober_io_wb_req_valid; // @[dcache.scala 431:22]
  wire [19:0] prober_io_wb_req_bits_tag; // @[dcache.scala 431:22]
  wire [5:0] prober_io_wb_req_bits_idx; // @[dcache.scala 431:22]
  wire [1:0] prober_io_wb_req_bits_source; // @[dcache.scala 431:22]
  wire [2:0] prober_io_wb_req_bits_param; // @[dcache.scala 431:22]
  wire [3:0] prober_io_wb_req_bits_way_en; // @[dcache.scala 431:22]
  wire  prober_io_wb_req_bits_voluntary; // @[dcache.scala 431:22]
  wire [3:0] prober_io_way_en; // @[dcache.scala 431:22]
  wire  prober_io_wb_rdy; // @[dcache.scala 431:22]
  wire  prober_io_mshr_rdy; // @[dcache.scala 431:22]
  wire  prober_io_mshr_wb_rdy; // @[dcache.scala 431:22]
  wire [1:0] prober_io_block_state_state; // @[dcache.scala 431:22]
  wire  prober_io_lsu_release_ready; // @[dcache.scala 431:22]
  wire  prober_io_lsu_release_valid; // @[dcache.scala 431:22]
  wire [2:0] prober_io_lsu_release_bits_opcode; // @[dcache.scala 431:22]
  wire [2:0] prober_io_lsu_release_bits_param; // @[dcache.scala 431:22]
  wire [3:0] prober_io_lsu_release_bits_size; // @[dcache.scala 431:22]
  wire [1:0] prober_io_lsu_release_bits_source; // @[dcache.scala 431:22]
  wire [31:0] prober_io_lsu_release_bits_address; // @[dcache.scala 431:22]
  wire [63:0] prober_io_lsu_release_bits_data; // @[dcache.scala 431:22]
  wire  prober_io_lsu_release_bits_corrupt; // @[dcache.scala 431:22]
  wire  prober_io_state_valid; // @[dcache.scala 431:22]
  wire [39:0] prober_io_state_bits; // @[dcache.scala 431:22]
  wire  mshrs_clock; // @[dcache.scala 432:21]
  wire  mshrs_reset; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_ready; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_valid; // @[dcache.scala 432:21]
  wire [6:0] mshrs_io_req_0_bits_uop_uopc; // @[dcache.scala 432:21]
  wire [31:0] mshrs_io_req_0_bits_uop_inst; // @[dcache.scala 432:21]
  wire [31:0] mshrs_io_req_0_bits_uop_debug_inst; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_is_rvc; // @[dcache.scala 432:21]
  wire [39:0] mshrs_io_req_0_bits_uop_debug_pc; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_req_0_bits_uop_iq_type; // @[dcache.scala 432:21]
  wire [9:0] mshrs_io_req_0_bits_uop_fu_code; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_req_0_bits_uop_ctrl_br_type; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_req_0_bits_uop_ctrl_op1_sel; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_req_0_bits_uop_ctrl_op2_sel; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_req_0_bits_uop_ctrl_imm_sel; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_req_0_bits_uop_ctrl_op_fcn; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_ctrl_fcn_dw; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_req_0_bits_uop_ctrl_csr_cmd; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_ctrl_is_load; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_ctrl_is_sta; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_ctrl_is_std; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_req_0_bits_uop_iw_state; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_iw_p1_poisoned; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_iw_p2_poisoned; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_is_br; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_is_jalr; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_is_jal; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_is_sfb; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_req_0_bits_uop_br_mask; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_req_0_bits_uop_br_tag; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_req_0_bits_uop_ftq_idx; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_edge_inst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_req_0_bits_uop_pc_lob; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_taken; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_req_0_bits_uop_imm_packed; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_req_0_bits_uop_csr_addr; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_req_0_bits_uop_rob_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_req_0_bits_uop_ldq_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_req_0_bits_uop_stq_idx; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_req_0_bits_uop_rxq_idx; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_req_0_bits_uop_pdst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_req_0_bits_uop_prs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_req_0_bits_uop_prs2; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_req_0_bits_uop_prs3; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_req_0_bits_uop_ppred; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_prs1_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_prs2_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_prs3_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_ppred_busy; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_req_0_bits_uop_stale_pdst; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_exception; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_req_0_bits_uop_exc_cause; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_bypassable; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_req_0_bits_uop_mem_cmd; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_req_0_bits_uop_mem_size; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_mem_signed; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_is_fence; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_is_fencei; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_is_amo; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_uses_ldq; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_uses_stq; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_is_sys_pc2epc; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_is_unique; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_flush_on_commit; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_ldst_is_rs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_req_0_bits_uop_ldst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_req_0_bits_uop_lrs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_req_0_bits_uop_lrs2; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_req_0_bits_uop_lrs3; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_ldst_val; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_req_0_bits_uop_dst_rtype; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_req_0_bits_uop_lrs1_rtype; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_req_0_bits_uop_lrs2_rtype; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_frs3_en; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_fp_val; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_fp_single; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_xcpt_pf_if; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_xcpt_ae_if; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_xcpt_ma_if; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_bp_debug_if; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_uop_bp_xcpt_if; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_req_0_bits_uop_debug_fsrc; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_req_0_bits_uop_debug_tsrc; // @[dcache.scala 432:21]
  wire [39:0] mshrs_io_req_0_bits_addr; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_req_0_bits_data; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_is_hella; // @[dcache.scala 432:21]
  wire  mshrs_io_req_0_bits_tag_match; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_req_0_bits_old_meta_coh_state; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_req_0_bits_old_meta_tag; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_req_0_bits_way_en; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_req_0_bits_sdq_id; // @[dcache.scala 432:21]
  wire  mshrs_io_req_is_probe_0; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_ready; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_valid; // @[dcache.scala 432:21]
  wire [6:0] mshrs_io_resp_bits_uop_uopc; // @[dcache.scala 432:21]
  wire [31:0] mshrs_io_resp_bits_uop_inst; // @[dcache.scala 432:21]
  wire [31:0] mshrs_io_resp_bits_uop_debug_inst; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_is_rvc; // @[dcache.scala 432:21]
  wire [39:0] mshrs_io_resp_bits_uop_debug_pc; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_resp_bits_uop_iq_type; // @[dcache.scala 432:21]
  wire [9:0] mshrs_io_resp_bits_uop_fu_code; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_resp_bits_uop_ctrl_br_type; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_resp_bits_uop_ctrl_op1_sel; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_resp_bits_uop_ctrl_op2_sel; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_resp_bits_uop_ctrl_imm_sel; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_resp_bits_uop_ctrl_op_fcn; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_ctrl_fcn_dw; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_resp_bits_uop_ctrl_csr_cmd; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_ctrl_is_load; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_ctrl_is_sta; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_ctrl_is_std; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_resp_bits_uop_iw_state; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_iw_p1_poisoned; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_iw_p2_poisoned; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_is_br; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_is_jalr; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_is_jal; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_is_sfb; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_resp_bits_uop_br_mask; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_resp_bits_uop_br_tag; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_resp_bits_uop_ftq_idx; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_edge_inst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_resp_bits_uop_pc_lob; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_taken; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_resp_bits_uop_imm_packed; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_resp_bits_uop_csr_addr; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_resp_bits_uop_rob_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_resp_bits_uop_ldq_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_resp_bits_uop_stq_idx; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_resp_bits_uop_rxq_idx; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_resp_bits_uop_pdst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_resp_bits_uop_prs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_resp_bits_uop_prs2; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_resp_bits_uop_prs3; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_resp_bits_uop_ppred; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_prs1_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_prs2_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_prs3_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_ppred_busy; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_resp_bits_uop_stale_pdst; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_exception; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_resp_bits_uop_exc_cause; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_bypassable; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_resp_bits_uop_mem_cmd; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_resp_bits_uop_mem_size; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_mem_signed; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_is_fence; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_is_fencei; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_is_amo; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_uses_ldq; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_uses_stq; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_is_sys_pc2epc; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_is_unique; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_flush_on_commit; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_ldst_is_rs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_resp_bits_uop_ldst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_resp_bits_uop_lrs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_resp_bits_uop_lrs2; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_resp_bits_uop_lrs3; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_ldst_val; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_resp_bits_uop_dst_rtype; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_resp_bits_uop_lrs1_rtype; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_resp_bits_uop_lrs2_rtype; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_frs3_en; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_fp_val; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_fp_single; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_xcpt_pf_if; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_xcpt_ae_if; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_xcpt_ma_if; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_bp_debug_if; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_uop_bp_xcpt_if; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_resp_bits_uop_debug_fsrc; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_resp_bits_uop_debug_tsrc; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_resp_bits_data; // @[dcache.scala 432:21]
  wire  mshrs_io_resp_bits_is_hella; // @[dcache.scala 432:21]
  wire  mshrs_io_secondary_miss_0; // @[dcache.scala 432:21]
  wire  mshrs_io_block_hit_0; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_brupdate_b1_resolve_mask; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_brupdate_b1_mispredict_mask; // @[dcache.scala 432:21]
  wire [6:0] mshrs_io_brupdate_b2_uop_uopc; // @[dcache.scala 432:21]
  wire [31:0] mshrs_io_brupdate_b2_uop_inst; // @[dcache.scala 432:21]
  wire [31:0] mshrs_io_brupdate_b2_uop_debug_inst; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_is_rvc; // @[dcache.scala 432:21]
  wire [39:0] mshrs_io_brupdate_b2_uop_debug_pc; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_brupdate_b2_uop_iq_type; // @[dcache.scala 432:21]
  wire [9:0] mshrs_io_brupdate_b2_uop_fu_code; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_brupdate_b2_uop_ctrl_br_type; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_brupdate_b2_uop_ctrl_op1_sel; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_brupdate_b2_uop_ctrl_op2_sel; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_brupdate_b2_uop_ctrl_imm_sel; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_brupdate_b2_uop_ctrl_op_fcn; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_ctrl_fcn_dw; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_brupdate_b2_uop_ctrl_csr_cmd; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_ctrl_is_load; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_ctrl_is_sta; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_ctrl_is_std; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_brupdate_b2_uop_iw_state; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_iw_p1_poisoned; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_iw_p2_poisoned; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_is_br; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_is_jalr; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_is_jal; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_is_sfb; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_brupdate_b2_uop_br_mask; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_brupdate_b2_uop_br_tag; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_brupdate_b2_uop_ftq_idx; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_edge_inst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_brupdate_b2_uop_pc_lob; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_taken; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_brupdate_b2_uop_imm_packed; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_brupdate_b2_uop_csr_addr; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_brupdate_b2_uop_rob_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_brupdate_b2_uop_ldq_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_brupdate_b2_uop_stq_idx; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_brupdate_b2_uop_rxq_idx; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_brupdate_b2_uop_pdst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_brupdate_b2_uop_prs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_brupdate_b2_uop_prs2; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_brupdate_b2_uop_prs3; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_brupdate_b2_uop_ppred; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_prs1_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_prs2_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_prs3_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_ppred_busy; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_brupdate_b2_uop_stale_pdst; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_exception; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_brupdate_b2_uop_exc_cause; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_bypassable; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_brupdate_b2_uop_mem_cmd; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_brupdate_b2_uop_mem_size; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_mem_signed; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_is_fence; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_is_fencei; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_is_amo; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_uses_ldq; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_uses_stq; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_is_sys_pc2epc; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_is_unique; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_flush_on_commit; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_ldst_is_rs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_brupdate_b2_uop_ldst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_brupdate_b2_uop_lrs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_brupdate_b2_uop_lrs2; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_brupdate_b2_uop_lrs3; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_ldst_val; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_brupdate_b2_uop_dst_rtype; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_brupdate_b2_uop_lrs1_rtype; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_brupdate_b2_uop_lrs2_rtype; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_frs3_en; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_fp_val; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_fp_single; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_xcpt_pf_if; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_xcpt_ae_if; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_xcpt_ma_if; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_bp_debug_if; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_uop_bp_xcpt_if; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_brupdate_b2_uop_debug_fsrc; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_brupdate_b2_uop_debug_tsrc; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_valid; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_mispredict; // @[dcache.scala 432:21]
  wire  mshrs_io_brupdate_b2_taken; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_brupdate_b2_cfi_type; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_brupdate_b2_pc_sel; // @[dcache.scala 432:21]
  wire [39:0] mshrs_io_brupdate_b2_jalr_target; // @[dcache.scala 432:21]
  wire [20:0] mshrs_io_brupdate_b2_target_offset; // @[dcache.scala 432:21]
  wire  mshrs_io_exception; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_rob_pnr_idx; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_rob_head_idx; // @[dcache.scala 432:21]
  wire  mshrs_io_mem_acquire_ready; // @[dcache.scala 432:21]
  wire  mshrs_io_mem_acquire_valid; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_mem_acquire_bits_opcode; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_mem_acquire_bits_param; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_mem_acquire_bits_size; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_mem_acquire_bits_source; // @[dcache.scala 432:21]
  wire [31:0] mshrs_io_mem_acquire_bits_address; // @[dcache.scala 432:21]
  wire [7:0] mshrs_io_mem_acquire_bits_mask; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_mem_acquire_bits_data; // @[dcache.scala 432:21]
  wire  mshrs_io_mem_acquire_bits_corrupt; // @[dcache.scala 432:21]
  wire  mshrs_io_mem_grant_ready; // @[dcache.scala 432:21]
  wire  mshrs_io_mem_grant_valid; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_mem_grant_bits_opcode; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_mem_grant_bits_param; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_mem_grant_bits_size; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_mem_grant_bits_source; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_mem_grant_bits_sink; // @[dcache.scala 432:21]
  wire  mshrs_io_mem_grant_bits_denied; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_mem_grant_bits_data; // @[dcache.scala 432:21]
  wire  mshrs_io_mem_grant_bits_corrupt; // @[dcache.scala 432:21]
  wire  mshrs_io_mem_finish_ready; // @[dcache.scala 432:21]
  wire  mshrs_io_mem_finish_valid; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_mem_finish_bits_sink; // @[dcache.scala 432:21]
  wire  mshrs_io_refill_ready; // @[dcache.scala 432:21]
  wire  mshrs_io_refill_valid; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_refill_bits_way_en; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_refill_bits_addr; // @[dcache.scala 432:21]
  wire  mshrs_io_refill_bits_wmask; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_refill_bits_data; // @[dcache.scala 432:21]
  wire  mshrs_io_meta_write_ready; // @[dcache.scala 432:21]
  wire  mshrs_io_meta_write_valid; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_meta_write_bits_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_meta_write_bits_way_en; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_meta_write_bits_tag; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_meta_write_bits_data_coh_state; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_meta_write_bits_data_tag; // @[dcache.scala 432:21]
  wire  mshrs_io_meta_read_ready; // @[dcache.scala 432:21]
  wire  mshrs_io_meta_read_valid; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_meta_read_bits_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_meta_read_bits_way_en; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_meta_read_bits_tag; // @[dcache.scala 432:21]
  wire  mshrs_io_meta_resp_valid; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_meta_resp_bits_coh_state; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_meta_resp_bits_tag; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_ready; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_valid; // @[dcache.scala 432:21]
  wire [6:0] mshrs_io_replay_bits_uop_uopc; // @[dcache.scala 432:21]
  wire [31:0] mshrs_io_replay_bits_uop_inst; // @[dcache.scala 432:21]
  wire [31:0] mshrs_io_replay_bits_uop_debug_inst; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_is_rvc; // @[dcache.scala 432:21]
  wire [39:0] mshrs_io_replay_bits_uop_debug_pc; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_replay_bits_uop_iq_type; // @[dcache.scala 432:21]
  wire [9:0] mshrs_io_replay_bits_uop_fu_code; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_replay_bits_uop_ctrl_br_type; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_replay_bits_uop_ctrl_op1_sel; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_replay_bits_uop_ctrl_op2_sel; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_replay_bits_uop_ctrl_imm_sel; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_replay_bits_uop_ctrl_op_fcn; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_ctrl_fcn_dw; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_replay_bits_uop_ctrl_csr_cmd; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_ctrl_is_load; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_ctrl_is_sta; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_ctrl_is_std; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_replay_bits_uop_iw_state; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_iw_p1_poisoned; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_iw_p2_poisoned; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_is_br; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_is_jalr; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_is_jal; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_is_sfb; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_replay_bits_uop_br_mask; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_replay_bits_uop_br_tag; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_replay_bits_uop_ftq_idx; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_edge_inst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_replay_bits_uop_pc_lob; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_taken; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_replay_bits_uop_imm_packed; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_replay_bits_uop_csr_addr; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_replay_bits_uop_rob_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_replay_bits_uop_ldq_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_replay_bits_uop_stq_idx; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_replay_bits_uop_rxq_idx; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_replay_bits_uop_pdst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_replay_bits_uop_prs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_replay_bits_uop_prs2; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_replay_bits_uop_prs3; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_replay_bits_uop_ppred; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_prs1_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_prs2_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_prs3_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_ppred_busy; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_replay_bits_uop_stale_pdst; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_exception; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_replay_bits_uop_exc_cause; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_bypassable; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_replay_bits_uop_mem_cmd; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_replay_bits_uop_mem_size; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_mem_signed; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_is_fence; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_is_fencei; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_is_amo; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_uses_ldq; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_uses_stq; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_is_sys_pc2epc; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_is_unique; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_flush_on_commit; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_ldst_is_rs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_replay_bits_uop_ldst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_replay_bits_uop_lrs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_replay_bits_uop_lrs2; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_replay_bits_uop_lrs3; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_ldst_val; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_replay_bits_uop_dst_rtype; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_replay_bits_uop_lrs1_rtype; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_replay_bits_uop_lrs2_rtype; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_frs3_en; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_fp_val; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_fp_single; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_xcpt_pf_if; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_xcpt_ae_if; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_xcpt_ma_if; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_bp_debug_if; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_uop_bp_xcpt_if; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_replay_bits_uop_debug_fsrc; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_replay_bits_uop_debug_tsrc; // @[dcache.scala 432:21]
  wire [39:0] mshrs_io_replay_bits_addr; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_replay_bits_data; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_is_hella; // @[dcache.scala 432:21]
  wire  mshrs_io_replay_bits_tag_match; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_replay_bits_old_meta_coh_state; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_replay_bits_old_meta_tag; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_replay_bits_way_en; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_replay_bits_sdq_id; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_ready; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_valid; // @[dcache.scala 432:21]
  wire [6:0] mshrs_io_prefetch_bits_uop_uopc; // @[dcache.scala 432:21]
  wire [31:0] mshrs_io_prefetch_bits_uop_inst; // @[dcache.scala 432:21]
  wire [31:0] mshrs_io_prefetch_bits_uop_debug_inst; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_is_rvc; // @[dcache.scala 432:21]
  wire [39:0] mshrs_io_prefetch_bits_uop_debug_pc; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_prefetch_bits_uop_iq_type; // @[dcache.scala 432:21]
  wire [9:0] mshrs_io_prefetch_bits_uop_fu_code; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_prefetch_bits_uop_ctrl_br_type; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_prefetch_bits_uop_ctrl_op1_sel; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_prefetch_bits_uop_ctrl_op2_sel; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_prefetch_bits_uop_ctrl_imm_sel; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_prefetch_bits_uop_ctrl_op_fcn; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_ctrl_fcn_dw; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_prefetch_bits_uop_ctrl_csr_cmd; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_ctrl_is_load; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_ctrl_is_sta; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_ctrl_is_std; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_prefetch_bits_uop_iw_state; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_iw_p1_poisoned; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_iw_p2_poisoned; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_is_br; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_is_jalr; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_is_jal; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_is_sfb; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_prefetch_bits_uop_br_mask; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_prefetch_bits_uop_br_tag; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_prefetch_bits_uop_ftq_idx; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_edge_inst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_prefetch_bits_uop_pc_lob; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_taken; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_prefetch_bits_uop_imm_packed; // @[dcache.scala 432:21]
  wire [11:0] mshrs_io_prefetch_bits_uop_csr_addr; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_prefetch_bits_uop_rob_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_prefetch_bits_uop_ldq_idx; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_prefetch_bits_uop_stq_idx; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_prefetch_bits_uop_rxq_idx; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_prefetch_bits_uop_pdst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_prefetch_bits_uop_prs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_prefetch_bits_uop_prs2; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_prefetch_bits_uop_prs3; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_prefetch_bits_uop_ppred; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_prs1_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_prs2_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_prs3_busy; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_ppred_busy; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_prefetch_bits_uop_stale_pdst; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_exception; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_prefetch_bits_uop_exc_cause; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_bypassable; // @[dcache.scala 432:21]
  wire [4:0] mshrs_io_prefetch_bits_uop_mem_cmd; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_prefetch_bits_uop_mem_size; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_mem_signed; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_is_fence; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_is_fencei; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_is_amo; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_uses_ldq; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_uses_stq; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_is_sys_pc2epc; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_is_unique; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_flush_on_commit; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_ldst_is_rs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_prefetch_bits_uop_ldst; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_prefetch_bits_uop_lrs1; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_prefetch_bits_uop_lrs2; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_prefetch_bits_uop_lrs3; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_ldst_val; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_prefetch_bits_uop_dst_rtype; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_prefetch_bits_uop_lrs1_rtype; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_prefetch_bits_uop_lrs2_rtype; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_frs3_en; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_fp_val; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_fp_single; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_xcpt_pf_if; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_xcpt_ae_if; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_xcpt_ma_if; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_bp_debug_if; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_uop_bp_xcpt_if; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_prefetch_bits_uop_debug_fsrc; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_prefetch_bits_uop_debug_tsrc; // @[dcache.scala 432:21]
  wire [39:0] mshrs_io_prefetch_bits_addr; // @[dcache.scala 432:21]
  wire [63:0] mshrs_io_prefetch_bits_data; // @[dcache.scala 432:21]
  wire  mshrs_io_prefetch_bits_is_hella; // @[dcache.scala 432:21]
  wire  mshrs_io_wb_req_ready; // @[dcache.scala 432:21]
  wire  mshrs_io_wb_req_valid; // @[dcache.scala 432:21]
  wire [19:0] mshrs_io_wb_req_bits_tag; // @[dcache.scala 432:21]
  wire [5:0] mshrs_io_wb_req_bits_idx; // @[dcache.scala 432:21]
  wire [1:0] mshrs_io_wb_req_bits_source; // @[dcache.scala 432:21]
  wire [2:0] mshrs_io_wb_req_bits_param; // @[dcache.scala 432:21]
  wire [3:0] mshrs_io_wb_req_bits_way_en; // @[dcache.scala 432:21]
  wire  mshrs_io_wb_req_bits_voluntary; // @[dcache.scala 432:21]
  wire  mshrs_io_prober_state_valid; // @[dcache.scala 432:21]
  wire [39:0] mshrs_io_prober_state_bits; // @[dcache.scala 432:21]
  wire  mshrs_io_clear_all; // @[dcache.scala 432:21]
  wire  mshrs_io_wb_resp; // @[dcache.scala 432:21]
  wire  mshrs_io_fence_rdy; // @[dcache.scala 432:21]
  wire  mshrs_io_probe_rdy; // @[dcache.scala 432:21]
  wire  meta_0_clock; // @[dcache.scala 441:41]
  wire  meta_0_reset; // @[dcache.scala 441:41]
  wire  meta_0_io_read_ready; // @[dcache.scala 441:41]
  wire  meta_0_io_read_valid; // @[dcache.scala 441:41]
  wire [5:0] meta_0_io_read_bits_idx; // @[dcache.scala 441:41]
  wire [3:0] meta_0_io_read_bits_way_en; // @[dcache.scala 441:41]
  wire [19:0] meta_0_io_read_bits_tag; // @[dcache.scala 441:41]
  wire  meta_0_io_write_ready; // @[dcache.scala 441:41]
  wire  meta_0_io_write_valid; // @[dcache.scala 441:41]
  wire [5:0] meta_0_io_write_bits_idx; // @[dcache.scala 441:41]
  wire [3:0] meta_0_io_write_bits_way_en; // @[dcache.scala 441:41]
  wire [19:0] meta_0_io_write_bits_tag; // @[dcache.scala 441:41]
  wire [1:0] meta_0_io_write_bits_data_coh_state; // @[dcache.scala 441:41]
  wire [19:0] meta_0_io_write_bits_data_tag; // @[dcache.scala 441:41]
  wire [1:0] meta_0_io_resp_0_coh_state; // @[dcache.scala 441:41]
  wire [19:0] meta_0_io_resp_0_tag; // @[dcache.scala 441:41]
  wire [1:0] meta_0_io_resp_1_coh_state; // @[dcache.scala 441:41]
  wire [19:0] meta_0_io_resp_1_tag; // @[dcache.scala 441:41]
  wire [1:0] meta_0_io_resp_2_coh_state; // @[dcache.scala 441:41]
  wire [19:0] meta_0_io_resp_2_tag; // @[dcache.scala 441:41]
  wire [1:0] meta_0_io_resp_3_coh_state; // @[dcache.scala 441:41]
  wire [19:0] meta_0_io_resp_3_tag; // @[dcache.scala 441:41]
  wire  metaWriteArb_clock; // @[dcache.scala 442:28]
  wire  metaWriteArb_reset; // @[dcache.scala 442:28]
  wire  metaWriteArb_io_in_0_ready; // @[dcache.scala 442:28]
  wire  metaWriteArb_io_in_0_valid; // @[dcache.scala 442:28]
  wire [5:0] metaWriteArb_io_in_0_bits_idx; // @[dcache.scala 442:28]
  wire [3:0] metaWriteArb_io_in_0_bits_way_en; // @[dcache.scala 442:28]
  wire [19:0] metaWriteArb_io_in_0_bits_tag; // @[dcache.scala 442:28]
  wire [1:0] metaWriteArb_io_in_0_bits_data_coh_state; // @[dcache.scala 442:28]
  wire [19:0] metaWriteArb_io_in_0_bits_data_tag; // @[dcache.scala 442:28]
  wire  metaWriteArb_io_in_1_ready; // @[dcache.scala 442:28]
  wire  metaWriteArb_io_in_1_valid; // @[dcache.scala 442:28]
  wire [5:0] metaWriteArb_io_in_1_bits_idx; // @[dcache.scala 442:28]
  wire [3:0] metaWriteArb_io_in_1_bits_way_en; // @[dcache.scala 442:28]
  wire [19:0] metaWriteArb_io_in_1_bits_tag; // @[dcache.scala 442:28]
  wire [1:0] metaWriteArb_io_in_1_bits_data_coh_state; // @[dcache.scala 442:28]
  wire [19:0] metaWriteArb_io_in_1_bits_data_tag; // @[dcache.scala 442:28]
  wire  metaWriteArb_io_out_ready; // @[dcache.scala 442:28]
  wire  metaWriteArb_io_out_valid; // @[dcache.scala 442:28]
  wire [5:0] metaWriteArb_io_out_bits_idx; // @[dcache.scala 442:28]
  wire [3:0] metaWriteArb_io_out_bits_way_en; // @[dcache.scala 442:28]
  wire [19:0] metaWriteArb_io_out_bits_tag; // @[dcache.scala 442:28]
  wire [1:0] metaWriteArb_io_out_bits_data_coh_state; // @[dcache.scala 442:28]
  wire [19:0] metaWriteArb_io_out_bits_data_tag; // @[dcache.scala 442:28]
  wire  metaWriteArb_io_chosen; // @[dcache.scala 442:28]
  wire  metaReadArb_clock; // @[dcache.scala 444:27]
  wire  metaReadArb_reset; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_0_ready; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_0_valid; // @[dcache.scala 444:27]
  wire [5:0] metaReadArb_io_in_0_bits_req_0_idx; // @[dcache.scala 444:27]
  wire [3:0] metaReadArb_io_in_0_bits_req_0_way_en; // @[dcache.scala 444:27]
  wire [19:0] metaReadArb_io_in_0_bits_req_0_tag; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_1_ready; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_1_valid; // @[dcache.scala 444:27]
  wire [5:0] metaReadArb_io_in_1_bits_req_0_idx; // @[dcache.scala 444:27]
  wire [3:0] metaReadArb_io_in_1_bits_req_0_way_en; // @[dcache.scala 444:27]
  wire [19:0] metaReadArb_io_in_1_bits_req_0_tag; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_2_ready; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_2_valid; // @[dcache.scala 444:27]
  wire [5:0] metaReadArb_io_in_2_bits_req_0_idx; // @[dcache.scala 444:27]
  wire [3:0] metaReadArb_io_in_2_bits_req_0_way_en; // @[dcache.scala 444:27]
  wire [19:0] metaReadArb_io_in_2_bits_req_0_tag; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_3_ready; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_3_valid; // @[dcache.scala 444:27]
  wire [5:0] metaReadArb_io_in_3_bits_req_0_idx; // @[dcache.scala 444:27]
  wire [3:0] metaReadArb_io_in_3_bits_req_0_way_en; // @[dcache.scala 444:27]
  wire [19:0] metaReadArb_io_in_3_bits_req_0_tag; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_4_ready; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_4_valid; // @[dcache.scala 444:27]
  wire [5:0] metaReadArb_io_in_4_bits_req_0_idx; // @[dcache.scala 444:27]
  wire [3:0] metaReadArb_io_in_4_bits_req_0_way_en; // @[dcache.scala 444:27]
  wire [19:0] metaReadArb_io_in_4_bits_req_0_tag; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_5_ready; // @[dcache.scala 444:27]
  wire  metaReadArb_io_in_5_valid; // @[dcache.scala 444:27]
  wire [5:0] metaReadArb_io_in_5_bits_req_0_idx; // @[dcache.scala 444:27]
  wire [3:0] metaReadArb_io_in_5_bits_req_0_way_en; // @[dcache.scala 444:27]
  wire [19:0] metaReadArb_io_in_5_bits_req_0_tag; // @[dcache.scala 444:27]
  wire  metaReadArb_io_out_ready; // @[dcache.scala 444:27]
  wire  metaReadArb_io_out_valid; // @[dcache.scala 444:27]
  wire [5:0] metaReadArb_io_out_bits_req_0_idx; // @[dcache.scala 444:27]
  wire [3:0] metaReadArb_io_out_bits_req_0_way_en; // @[dcache.scala 444:27]
  wire [19:0] metaReadArb_io_out_bits_req_0_tag; // @[dcache.scala 444:27]
  wire [2:0] metaReadArb_io_chosen; // @[dcache.scala 444:27]
  wire  data_clock; // @[dcache.scala 459:20]
  wire  data_reset; // @[dcache.scala 459:20]
  wire  data_io_read_0_valid; // @[dcache.scala 459:20]
  wire [3:0] data_io_read_0_bits_way_en; // @[dcache.scala 459:20]
  wire [11:0] data_io_read_0_bits_addr; // @[dcache.scala 459:20]
  wire  data_io_write_valid; // @[dcache.scala 459:20]
  wire [3:0] data_io_write_bits_way_en; // @[dcache.scala 459:20]
  wire [11:0] data_io_write_bits_addr; // @[dcache.scala 459:20]
  wire  data_io_write_bits_wmask; // @[dcache.scala 459:20]
  wire [63:0] data_io_write_bits_data; // @[dcache.scala 459:20]
  wire [63:0] data_io_resp_0_0; // @[dcache.scala 459:20]
  wire [63:0] data_io_resp_0_1; // @[dcache.scala 459:20]
  wire [63:0] data_io_resp_0_2; // @[dcache.scala 459:20]
  wire [63:0] data_io_resp_0_3; // @[dcache.scala 459:20]
  wire  data_io_nacks_0; // @[dcache.scala 459:20]
  wire  dataWriteArb_clock; // @[dcache.scala 460:28]
  wire  dataWriteArb_reset; // @[dcache.scala 460:28]
  wire  dataWriteArb_io_in_0_ready; // @[dcache.scala 460:28]
  wire  dataWriteArb_io_in_0_valid; // @[dcache.scala 460:28]
  wire [3:0] dataWriteArb_io_in_0_bits_way_en; // @[dcache.scala 460:28]
  wire [11:0] dataWriteArb_io_in_0_bits_addr; // @[dcache.scala 460:28]
  wire  dataWriteArb_io_in_0_bits_wmask; // @[dcache.scala 460:28]
  wire [63:0] dataWriteArb_io_in_0_bits_data; // @[dcache.scala 460:28]
  wire  dataWriteArb_io_in_1_ready; // @[dcache.scala 460:28]
  wire  dataWriteArb_io_in_1_valid; // @[dcache.scala 460:28]
  wire [3:0] dataWriteArb_io_in_1_bits_way_en; // @[dcache.scala 460:28]
  wire [11:0] dataWriteArb_io_in_1_bits_addr; // @[dcache.scala 460:28]
  wire  dataWriteArb_io_in_1_bits_wmask; // @[dcache.scala 460:28]
  wire [63:0] dataWriteArb_io_in_1_bits_data; // @[dcache.scala 460:28]
  wire  dataWriteArb_io_out_ready; // @[dcache.scala 460:28]
  wire  dataWriteArb_io_out_valid; // @[dcache.scala 460:28]
  wire [3:0] dataWriteArb_io_out_bits_way_en; // @[dcache.scala 460:28]
  wire [11:0] dataWriteArb_io_out_bits_addr; // @[dcache.scala 460:28]
  wire  dataWriteArb_io_out_bits_wmask; // @[dcache.scala 460:28]
  wire [63:0] dataWriteArb_io_out_bits_data; // @[dcache.scala 460:28]
  wire  dataWriteArb_io_chosen; // @[dcache.scala 460:28]
  wire  dataReadArb_clock; // @[dcache.scala 462:27]
  wire  dataReadArb_reset; // @[dcache.scala 462:27]
  wire  dataReadArb_io_in_0_ready; // @[dcache.scala 462:27]
  wire  dataReadArb_io_in_0_valid; // @[dcache.scala 462:27]
  wire [3:0] dataReadArb_io_in_0_bits_req_0_way_en; // @[dcache.scala 462:27]
  wire [11:0] dataReadArb_io_in_0_bits_req_0_addr; // @[dcache.scala 462:27]
  wire  dataReadArb_io_in_0_bits_valid_0; // @[dcache.scala 462:27]
  wire  dataReadArb_io_in_1_ready; // @[dcache.scala 462:27]
  wire  dataReadArb_io_in_1_valid; // @[dcache.scala 462:27]
  wire [3:0] dataReadArb_io_in_1_bits_req_0_way_en; // @[dcache.scala 462:27]
  wire [11:0] dataReadArb_io_in_1_bits_req_0_addr; // @[dcache.scala 462:27]
  wire  dataReadArb_io_in_1_bits_valid_0; // @[dcache.scala 462:27]
  wire  dataReadArb_io_in_2_ready; // @[dcache.scala 462:27]
  wire  dataReadArb_io_in_2_valid; // @[dcache.scala 462:27]
  wire [3:0] dataReadArb_io_in_2_bits_req_0_way_en; // @[dcache.scala 462:27]
  wire [11:0] dataReadArb_io_in_2_bits_req_0_addr; // @[dcache.scala 462:27]
  wire  dataReadArb_io_in_2_bits_valid_0; // @[dcache.scala 462:27]
  wire  dataReadArb_io_out_ready; // @[dcache.scala 462:27]
  wire  dataReadArb_io_out_valid; // @[dcache.scala 462:27]
  wire [3:0] dataReadArb_io_out_bits_req_0_way_en; // @[dcache.scala 462:27]
  wire [11:0] dataReadArb_io_out_bits_req_0_addr; // @[dcache.scala 462:27]
  wire  dataReadArb_io_out_bits_valid_0; // @[dcache.scala 462:27]
  wire [1:0] dataReadArb_io_chosen; // @[dcache.scala 462:27]
  wire  lfsr_prng_clock; // @[PRNG.scala 82:22]
  wire  lfsr_prng_reset; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_valid; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_0; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_1; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_2; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_3; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_4; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_5; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_6; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_7; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_8; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_9; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_10; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_11; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_12; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_13; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_14; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_seed_bits_15; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_increment; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_0; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_1; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_2; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_3; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_4; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_5; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_6; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_7; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_8; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_9; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_10; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_11; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_12; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_13; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_14; // @[PRNG.scala 82:22]
  wire  lfsr_prng_io_out_15; // @[PRNG.scala 82:22]
  wire  wbArb_clock; // @[dcache.scala 804:21]
  wire  wbArb_reset; // @[dcache.scala 804:21]
  wire  wbArb_io_in_0_ready; // @[dcache.scala 804:21]
  wire  wbArb_io_in_0_valid; // @[dcache.scala 804:21]
  wire [19:0] wbArb_io_in_0_bits_tag; // @[dcache.scala 804:21]
  wire [5:0] wbArb_io_in_0_bits_idx; // @[dcache.scala 804:21]
  wire [1:0] wbArb_io_in_0_bits_source; // @[dcache.scala 804:21]
  wire [2:0] wbArb_io_in_0_bits_param; // @[dcache.scala 804:21]
  wire [3:0] wbArb_io_in_0_bits_way_en; // @[dcache.scala 804:21]
  wire  wbArb_io_in_0_bits_voluntary; // @[dcache.scala 804:21]
  wire  wbArb_io_in_1_ready; // @[dcache.scala 804:21]
  wire  wbArb_io_in_1_valid; // @[dcache.scala 804:21]
  wire [19:0] wbArb_io_in_1_bits_tag; // @[dcache.scala 804:21]
  wire [5:0] wbArb_io_in_1_bits_idx; // @[dcache.scala 804:21]
  wire [1:0] wbArb_io_in_1_bits_source; // @[dcache.scala 804:21]
  wire [2:0] wbArb_io_in_1_bits_param; // @[dcache.scala 804:21]
  wire [3:0] wbArb_io_in_1_bits_way_en; // @[dcache.scala 804:21]
  wire  wbArb_io_in_1_bits_voluntary; // @[dcache.scala 804:21]
  wire  wbArb_io_out_ready; // @[dcache.scala 804:21]
  wire  wbArb_io_out_valid; // @[dcache.scala 804:21]
  wire [19:0] wbArb_io_out_bits_tag; // @[dcache.scala 804:21]
  wire [5:0] wbArb_io_out_bits_idx; // @[dcache.scala 804:21]
  wire [1:0] wbArb_io_out_bits_source; // @[dcache.scala 804:21]
  wire [2:0] wbArb_io_out_bits_param; // @[dcache.scala 804:21]
  wire [3:0] wbArb_io_out_bits_way_en; // @[dcache.scala 804:21]
  wire  wbArb_io_out_bits_voluntary; // @[dcache.scala 804:21]
  wire  wbArb_io_chosen; // @[dcache.scala 804:21]
  wire  lsu_release_arb_clock; // @[dcache.scala 813:31]
  wire  lsu_release_arb_reset; // @[dcache.scala 813:31]
  wire  lsu_release_arb_io_in_0_ready; // @[dcache.scala 813:31]
  wire  lsu_release_arb_io_in_0_valid; // @[dcache.scala 813:31]
  wire [2:0] lsu_release_arb_io_in_0_bits_opcode; // @[dcache.scala 813:31]
  wire [2:0] lsu_release_arb_io_in_0_bits_param; // @[dcache.scala 813:31]
  wire [3:0] lsu_release_arb_io_in_0_bits_size; // @[dcache.scala 813:31]
  wire [1:0] lsu_release_arb_io_in_0_bits_source; // @[dcache.scala 813:31]
  wire [31:0] lsu_release_arb_io_in_0_bits_address; // @[dcache.scala 813:31]
  wire [63:0] lsu_release_arb_io_in_0_bits_data; // @[dcache.scala 813:31]
  wire  lsu_release_arb_io_in_0_bits_corrupt; // @[dcache.scala 813:31]
  wire  lsu_release_arb_io_in_1_ready; // @[dcache.scala 813:31]
  wire  lsu_release_arb_io_in_1_valid; // @[dcache.scala 813:31]
  wire [2:0] lsu_release_arb_io_in_1_bits_opcode; // @[dcache.scala 813:31]
  wire [2:0] lsu_release_arb_io_in_1_bits_param; // @[dcache.scala 813:31]
  wire [3:0] lsu_release_arb_io_in_1_bits_size; // @[dcache.scala 813:31]
  wire [1:0] lsu_release_arb_io_in_1_bits_source; // @[dcache.scala 813:31]
  wire [31:0] lsu_release_arb_io_in_1_bits_address; // @[dcache.scala 813:31]
  wire [63:0] lsu_release_arb_io_in_1_bits_data; // @[dcache.scala 813:31]
  wire  lsu_release_arb_io_in_1_bits_corrupt; // @[dcache.scala 813:31]
  wire  lsu_release_arb_io_out_ready; // @[dcache.scala 813:31]
  wire  lsu_release_arb_io_out_valid; // @[dcache.scala 813:31]
  wire [2:0] lsu_release_arb_io_out_bits_opcode; // @[dcache.scala 813:31]
  wire [2:0] lsu_release_arb_io_out_bits_param; // @[dcache.scala 813:31]
  wire [3:0] lsu_release_arb_io_out_bits_size; // @[dcache.scala 813:31]
  wire [1:0] lsu_release_arb_io_out_bits_source; // @[dcache.scala 813:31]
  wire [31:0] lsu_release_arb_io_out_bits_address; // @[dcache.scala 813:31]
  wire [63:0] lsu_release_arb_io_out_bits_data; // @[dcache.scala 813:31]
  wire  lsu_release_arb_io_out_bits_corrupt; // @[dcache.scala 813:31]
  wire  lsu_release_arb_io_chosen; // @[dcache.scala 813:31]
  wire  amoalu_clock; // @[dcache.scala 895:24]
  wire  amoalu_reset; // @[dcache.scala 895:24]
  wire [7:0] amoalu_io_mask; // @[dcache.scala 895:24]
  wire [4:0] amoalu_io_cmd; // @[dcache.scala 895:24]
  wire [63:0] amoalu_io_lhs; // @[dcache.scala 895:24]
  wire [63:0] amoalu_io_rhs; // @[dcache.scala 895:24]
  wire [63:0] amoalu_io_out; // @[dcache.scala 895:24]
  wire [63:0] amoalu_io_out_unmasked; // @[dcache.scala 895:24]
  wire [25:0] _T_8 = {mshrs_io_meta_read_bits_tag,mshrs_io_meta_read_bits_idx}; // @[Cat.scala 30:58]
  wire [31:0] _T_9 = {_T_8, 6'h0}; // @[dcache.scala 519:94]
  wire  _T_10 = wb_io_meta_read_ready & wb_io_meta_read_valid; // @[Decoupled.scala 40:37]
  wire  _T_11 = wb_io_data_req_ready & wb_io_data_req_valid; // @[Decoupled.scala 40:37]
  wire  wb_fire = _T_10 & _T_11; // @[dcache.scala 530:40]
  wire [31:0] _T_12 = {wb_io_meta_read_bits_tag,wb_io_data_req_bits_addr}; // @[Cat.scala 30:58]
  wire  prober_fire = prober_io_meta_read_ready & prober_io_meta_read_valid; // @[Decoupled.scala 40:37]
  wire [25:0] _T_22 = {prober_io_meta_read_bits_tag,prober_io_meta_read_bits_idx}; // @[Cat.scala 30:58]
  wire [31:0] _T_23 = {_T_22, 6'h0}; // @[dcache.scala 555:93]
  wire  prefetch_fire = mshrs_io_prefetch_ready & mshrs_io_prefetch_valid; // @[Decoupled.scala 40:37]
  wire  _T_25 = io_lsu_req_ready & io_lsu_req_valid; // @[Decoupled.scala 40:37]
  wire  _T_26 = mshrs_io_replay_ready & mshrs_io_replay_valid; // @[Decoupled.scala 40:37]
  wire  _T_30 = mshrs_io_meta_read_ready & mshrs_io_meta_read_valid; // @[Decoupled.scala 40:37]
  wire  _T_31 = _T_26 | wb_fire | prober_fire | prefetch_fire | _T_30; // @[dcache.scala 579:88]
  wire  s0_valid_0 = _T_25 ? io_lsu_req_bits_0_valid : _T_31; // @[dcache.scala 578:21]
  wire [6:0] replay_req_0_uop_uopc = mshrs_io_replay_bits_uop_uopc; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [6:0] _T_35_0_uop_uopc = _T_30 ? 7'h0 : replay_req_0_uop_uopc; // @[dcache.scala 585:21]
  wire [31:0] replay_req_0_uop_inst = mshrs_io_replay_bits_uop_inst; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [31:0] _T_35_0_uop_inst = _T_30 ? 32'h0 : replay_req_0_uop_inst; // @[dcache.scala 585:21]
  wire [31:0] replay_req_0_uop_debug_inst = mshrs_io_replay_bits_uop_debug_inst; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [31:0] _T_35_0_uop_debug_inst = _T_30 ? 32'h0 : replay_req_0_uop_debug_inst; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_is_rvc = mshrs_io_replay_bits_uop_is_rvc; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_is_rvc = _T_30 ? 1'h0 : replay_req_0_uop_is_rvc; // @[dcache.scala 585:21]
  wire [39:0] replay_req_0_uop_debug_pc = mshrs_io_replay_bits_uop_debug_pc; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [39:0] _T_35_0_uop_debug_pc = _T_30 ? 40'h0 : replay_req_0_uop_debug_pc; // @[dcache.scala 585:21]
  wire [2:0] replay_req_0_uop_iq_type = mshrs_io_replay_bits_uop_iq_type; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [2:0] _T_35_0_uop_iq_type = _T_30 ? 3'h0 : replay_req_0_uop_iq_type; // @[dcache.scala 585:21]
  wire [9:0] replay_req_0_uop_fu_code = mshrs_io_replay_bits_uop_fu_code; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [9:0] _T_35_0_uop_fu_code = _T_30 ? 10'h0 : replay_req_0_uop_fu_code; // @[dcache.scala 585:21]
  wire [3:0] replay_req_0_uop_ctrl_br_type = mshrs_io_replay_bits_uop_ctrl_br_type; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [3:0] _T_35_0_uop_ctrl_br_type = _T_30 ? 4'h0 : replay_req_0_uop_ctrl_br_type; // @[dcache.scala 585:21]
  wire [1:0] replay_req_0_uop_ctrl_op1_sel = mshrs_io_replay_bits_uop_ctrl_op1_sel; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [1:0] _T_35_0_uop_ctrl_op1_sel = _T_30 ? 2'h0 : replay_req_0_uop_ctrl_op1_sel; // @[dcache.scala 585:21]
  wire [2:0] replay_req_0_uop_ctrl_op2_sel = mshrs_io_replay_bits_uop_ctrl_op2_sel; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [2:0] _T_35_0_uop_ctrl_op2_sel = _T_30 ? 3'h0 : replay_req_0_uop_ctrl_op2_sel; // @[dcache.scala 585:21]
  wire [2:0] replay_req_0_uop_ctrl_imm_sel = mshrs_io_replay_bits_uop_ctrl_imm_sel; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [2:0] _T_35_0_uop_ctrl_imm_sel = _T_30 ? 3'h0 : replay_req_0_uop_ctrl_imm_sel; // @[dcache.scala 585:21]
  wire [3:0] replay_req_0_uop_ctrl_op_fcn = mshrs_io_replay_bits_uop_ctrl_op_fcn; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [3:0] _T_35_0_uop_ctrl_op_fcn = _T_30 ? 4'h0 : replay_req_0_uop_ctrl_op_fcn; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_ctrl_fcn_dw = mshrs_io_replay_bits_uop_ctrl_fcn_dw; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_ctrl_fcn_dw = _T_30 ? 1'h0 : replay_req_0_uop_ctrl_fcn_dw; // @[dcache.scala 585:21]
  wire [2:0] replay_req_0_uop_ctrl_csr_cmd = mshrs_io_replay_bits_uop_ctrl_csr_cmd; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [2:0] _T_35_0_uop_ctrl_csr_cmd = _T_30 ? 3'h0 : replay_req_0_uop_ctrl_csr_cmd; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_ctrl_is_load = mshrs_io_replay_bits_uop_ctrl_is_load; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_ctrl_is_load = _T_30 ? 1'h0 : replay_req_0_uop_ctrl_is_load; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_ctrl_is_sta = mshrs_io_replay_bits_uop_ctrl_is_sta; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_ctrl_is_sta = _T_30 ? 1'h0 : replay_req_0_uop_ctrl_is_sta; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_ctrl_is_std = mshrs_io_replay_bits_uop_ctrl_is_std; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_ctrl_is_std = _T_30 ? 1'h0 : replay_req_0_uop_ctrl_is_std; // @[dcache.scala 585:21]
  wire [1:0] replay_req_0_uop_iw_state = mshrs_io_replay_bits_uop_iw_state; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [1:0] _T_35_0_uop_iw_state = _T_30 ? 2'h0 : replay_req_0_uop_iw_state; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_iw_p1_poisoned = mshrs_io_replay_bits_uop_iw_p1_poisoned; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_iw_p1_poisoned = _T_30 ? 1'h0 : replay_req_0_uop_iw_p1_poisoned; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_iw_p2_poisoned = mshrs_io_replay_bits_uop_iw_p2_poisoned; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_iw_p2_poisoned = _T_30 ? 1'h0 : replay_req_0_uop_iw_p2_poisoned; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_is_br = mshrs_io_replay_bits_uop_is_br; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_is_br = _T_30 ? 1'h0 : replay_req_0_uop_is_br; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_is_jalr = mshrs_io_replay_bits_uop_is_jalr; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_is_jalr = _T_30 ? 1'h0 : replay_req_0_uop_is_jalr; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_is_jal = mshrs_io_replay_bits_uop_is_jal; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_is_jal = _T_30 ? 1'h0 : replay_req_0_uop_is_jal; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_is_sfb = mshrs_io_replay_bits_uop_is_sfb; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_is_sfb = _T_30 ? 1'h0 : replay_req_0_uop_is_sfb; // @[dcache.scala 585:21]
  wire [11:0] replay_req_0_uop_br_mask = mshrs_io_replay_bits_uop_br_mask; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [11:0] _T_35_0_uop_br_mask = _T_30 ? 12'h0 : replay_req_0_uop_br_mask; // @[dcache.scala 585:21]
  wire [3:0] replay_req_0_uop_br_tag = mshrs_io_replay_bits_uop_br_tag; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [3:0] _T_35_0_uop_br_tag = _T_30 ? 4'h0 : replay_req_0_uop_br_tag; // @[dcache.scala 585:21]
  wire [4:0] replay_req_0_uop_ftq_idx = mshrs_io_replay_bits_uop_ftq_idx; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [4:0] _T_35_0_uop_ftq_idx = _T_30 ? 5'h0 : replay_req_0_uop_ftq_idx; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_edge_inst = mshrs_io_replay_bits_uop_edge_inst; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_edge_inst = _T_30 ? 1'h0 : replay_req_0_uop_edge_inst; // @[dcache.scala 585:21]
  wire [5:0] replay_req_0_uop_pc_lob = mshrs_io_replay_bits_uop_pc_lob; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [5:0] _T_35_0_uop_pc_lob = _T_30 ? 6'h0 : replay_req_0_uop_pc_lob; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_taken = mshrs_io_replay_bits_uop_taken; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_taken = _T_30 ? 1'h0 : replay_req_0_uop_taken; // @[dcache.scala 585:21]
  wire [19:0] replay_req_0_uop_imm_packed = mshrs_io_replay_bits_uop_imm_packed; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [19:0] _T_35_0_uop_imm_packed = _T_30 ? 20'h0 : replay_req_0_uop_imm_packed; // @[dcache.scala 585:21]
  wire [11:0] replay_req_0_uop_csr_addr = mshrs_io_replay_bits_uop_csr_addr; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [11:0] _T_35_0_uop_csr_addr = _T_30 ? 12'h0 : replay_req_0_uop_csr_addr; // @[dcache.scala 585:21]
  wire [5:0] replay_req_0_uop_rob_idx = mshrs_io_replay_bits_uop_rob_idx; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [5:0] _T_35_0_uop_rob_idx = _T_30 ? 6'h0 : replay_req_0_uop_rob_idx; // @[dcache.scala 585:21]
  wire [3:0] replay_req_0_uop_ldq_idx = mshrs_io_replay_bits_uop_ldq_idx; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [3:0] _T_35_0_uop_ldq_idx = _T_30 ? 4'h0 : replay_req_0_uop_ldq_idx; // @[dcache.scala 585:21]
  wire [3:0] replay_req_0_uop_stq_idx = mshrs_io_replay_bits_uop_stq_idx; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [3:0] _T_35_0_uop_stq_idx = _T_30 ? 4'h0 : replay_req_0_uop_stq_idx; // @[dcache.scala 585:21]
  wire [1:0] replay_req_0_uop_rxq_idx = mshrs_io_replay_bits_uop_rxq_idx; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [1:0] _T_35_0_uop_rxq_idx = _T_30 ? 2'h0 : replay_req_0_uop_rxq_idx; // @[dcache.scala 585:21]
  wire [5:0] replay_req_0_uop_pdst = mshrs_io_replay_bits_uop_pdst; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [5:0] _T_35_0_uop_pdst = _T_30 ? 6'h0 : replay_req_0_uop_pdst; // @[dcache.scala 585:21]
  wire [5:0] replay_req_0_uop_prs1 = mshrs_io_replay_bits_uop_prs1; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [5:0] _T_35_0_uop_prs1 = _T_30 ? 6'h0 : replay_req_0_uop_prs1; // @[dcache.scala 585:21]
  wire [5:0] replay_req_0_uop_prs2 = mshrs_io_replay_bits_uop_prs2; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [5:0] _T_35_0_uop_prs2 = _T_30 ? 6'h0 : replay_req_0_uop_prs2; // @[dcache.scala 585:21]
  wire [5:0] replay_req_0_uop_prs3 = mshrs_io_replay_bits_uop_prs3; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [5:0] _T_35_0_uop_prs3 = _T_30 ? 6'h0 : replay_req_0_uop_prs3; // @[dcache.scala 585:21]
  wire [4:0] replay_req_0_uop_ppred = mshrs_io_replay_bits_uop_ppred; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [4:0] _T_35_0_uop_ppred = _T_30 ? 5'h0 : replay_req_0_uop_ppred; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_prs1_busy = mshrs_io_replay_bits_uop_prs1_busy; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_prs1_busy = _T_30 ? 1'h0 : replay_req_0_uop_prs1_busy; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_prs2_busy = mshrs_io_replay_bits_uop_prs2_busy; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_prs2_busy = _T_30 ? 1'h0 : replay_req_0_uop_prs2_busy; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_prs3_busy = mshrs_io_replay_bits_uop_prs3_busy; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_prs3_busy = _T_30 ? 1'h0 : replay_req_0_uop_prs3_busy; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_ppred_busy = mshrs_io_replay_bits_uop_ppred_busy; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_ppred_busy = _T_30 ? 1'h0 : replay_req_0_uop_ppred_busy; // @[dcache.scala 585:21]
  wire [5:0] replay_req_0_uop_stale_pdst = mshrs_io_replay_bits_uop_stale_pdst; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [5:0] _T_35_0_uop_stale_pdst = _T_30 ? 6'h0 : replay_req_0_uop_stale_pdst; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_exception = mshrs_io_replay_bits_uop_exception; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_exception = _T_30 ? 1'h0 : replay_req_0_uop_exception; // @[dcache.scala 585:21]
  wire [63:0] replay_req_0_uop_exc_cause = mshrs_io_replay_bits_uop_exc_cause; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [63:0] _T_35_0_uop_exc_cause = _T_30 ? 64'h0 : replay_req_0_uop_exc_cause; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_bypassable = mshrs_io_replay_bits_uop_bypassable; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_bypassable = _T_30 ? 1'h0 : replay_req_0_uop_bypassable; // @[dcache.scala 585:21]
  wire [4:0] replay_req_0_uop_mem_cmd = mshrs_io_replay_bits_uop_mem_cmd; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [4:0] _T_35_0_uop_mem_cmd = _T_30 ? 5'h0 : replay_req_0_uop_mem_cmd; // @[dcache.scala 585:21]
  wire [1:0] replay_req_0_uop_mem_size = mshrs_io_replay_bits_uop_mem_size; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [1:0] _T_35_0_uop_mem_size = _T_30 ? 2'h0 : replay_req_0_uop_mem_size; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_mem_signed = mshrs_io_replay_bits_uop_mem_signed; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_mem_signed = _T_30 ? 1'h0 : replay_req_0_uop_mem_signed; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_is_fence = mshrs_io_replay_bits_uop_is_fence; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_is_fence = _T_30 ? 1'h0 : replay_req_0_uop_is_fence; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_is_fencei = mshrs_io_replay_bits_uop_is_fencei; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_is_fencei = _T_30 ? 1'h0 : replay_req_0_uop_is_fencei; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_is_amo = mshrs_io_replay_bits_uop_is_amo; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_is_amo = _T_30 ? 1'h0 : replay_req_0_uop_is_amo; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_uses_ldq = mshrs_io_replay_bits_uop_uses_ldq; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_uses_ldq = _T_30 ? 1'h0 : replay_req_0_uop_uses_ldq; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_uses_stq = mshrs_io_replay_bits_uop_uses_stq; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_uses_stq = _T_30 ? 1'h0 : replay_req_0_uop_uses_stq; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_is_sys_pc2epc = mshrs_io_replay_bits_uop_is_sys_pc2epc; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_is_sys_pc2epc = _T_30 ? 1'h0 : replay_req_0_uop_is_sys_pc2epc; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_is_unique = mshrs_io_replay_bits_uop_is_unique; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_is_unique = _T_30 ? 1'h0 : replay_req_0_uop_is_unique; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_flush_on_commit = mshrs_io_replay_bits_uop_flush_on_commit; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_flush_on_commit = _T_30 ? 1'h0 : replay_req_0_uop_flush_on_commit; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_ldst_is_rs1 = mshrs_io_replay_bits_uop_ldst_is_rs1; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_ldst_is_rs1 = _T_30 ? 1'h0 : replay_req_0_uop_ldst_is_rs1; // @[dcache.scala 585:21]
  wire [5:0] replay_req_0_uop_ldst = mshrs_io_replay_bits_uop_ldst; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [5:0] _T_35_0_uop_ldst = _T_30 ? 6'h0 : replay_req_0_uop_ldst; // @[dcache.scala 585:21]
  wire [5:0] replay_req_0_uop_lrs1 = mshrs_io_replay_bits_uop_lrs1; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [5:0] _T_35_0_uop_lrs1 = _T_30 ? 6'h0 : replay_req_0_uop_lrs1; // @[dcache.scala 585:21]
  wire [5:0] replay_req_0_uop_lrs2 = mshrs_io_replay_bits_uop_lrs2; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [5:0] _T_35_0_uop_lrs2 = _T_30 ? 6'h0 : replay_req_0_uop_lrs2; // @[dcache.scala 585:21]
  wire [5:0] replay_req_0_uop_lrs3 = mshrs_io_replay_bits_uop_lrs3; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [5:0] _T_35_0_uop_lrs3 = _T_30 ? 6'h0 : replay_req_0_uop_lrs3; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_ldst_val = mshrs_io_replay_bits_uop_ldst_val; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_ldst_val = _T_30 ? 1'h0 : replay_req_0_uop_ldst_val; // @[dcache.scala 585:21]
  wire [1:0] replay_req_0_uop_dst_rtype = mshrs_io_replay_bits_uop_dst_rtype; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [1:0] _T_35_0_uop_dst_rtype = _T_30 ? 2'h2 : replay_req_0_uop_dst_rtype; // @[dcache.scala 585:21]
  wire [1:0] replay_req_0_uop_lrs1_rtype = mshrs_io_replay_bits_uop_lrs1_rtype; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [1:0] _T_35_0_uop_lrs1_rtype = _T_30 ? 2'h0 : replay_req_0_uop_lrs1_rtype; // @[dcache.scala 585:21]
  wire [1:0] replay_req_0_uop_lrs2_rtype = mshrs_io_replay_bits_uop_lrs2_rtype; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [1:0] _T_35_0_uop_lrs2_rtype = _T_30 ? 2'h0 : replay_req_0_uop_lrs2_rtype; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_frs3_en = mshrs_io_replay_bits_uop_frs3_en; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_frs3_en = _T_30 ? 1'h0 : replay_req_0_uop_frs3_en; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_fp_val = mshrs_io_replay_bits_uop_fp_val; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_fp_val = _T_30 ? 1'h0 : replay_req_0_uop_fp_val; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_fp_single = mshrs_io_replay_bits_uop_fp_single; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_fp_single = _T_30 ? 1'h0 : replay_req_0_uop_fp_single; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_xcpt_pf_if = mshrs_io_replay_bits_uop_xcpt_pf_if; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_xcpt_pf_if = _T_30 ? 1'h0 : replay_req_0_uop_xcpt_pf_if; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_xcpt_ae_if = mshrs_io_replay_bits_uop_xcpt_ae_if; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_xcpt_ae_if = _T_30 ? 1'h0 : replay_req_0_uop_xcpt_ae_if; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_xcpt_ma_if = mshrs_io_replay_bits_uop_xcpt_ma_if; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_xcpt_ma_if = _T_30 ? 1'h0 : replay_req_0_uop_xcpt_ma_if; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_bp_debug_if = mshrs_io_replay_bits_uop_bp_debug_if; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_bp_debug_if = _T_30 ? 1'h0 : replay_req_0_uop_bp_debug_if; // @[dcache.scala 585:21]
  wire  replay_req_0_uop_bp_xcpt_if = mshrs_io_replay_bits_uop_bp_xcpt_if; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire  _T_35_0_uop_bp_xcpt_if = _T_30 ? 1'h0 : replay_req_0_uop_bp_xcpt_if; // @[dcache.scala 585:21]
  wire [1:0] replay_req_0_uop_debug_fsrc = mshrs_io_replay_bits_uop_debug_fsrc; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [1:0] _T_35_0_uop_debug_fsrc = _T_30 ? 2'h0 : replay_req_0_uop_debug_fsrc; // @[dcache.scala 585:21]
  wire [1:0] replay_req_0_uop_debug_tsrc = mshrs_io_replay_bits_uop_debug_tsrc; // @[dcache.scala 495:24 dcache.scala 497:28]
  wire [1:0] _T_35_0_uop_debug_tsrc = _T_30 ? 2'h0 : replay_req_0_uop_debug_tsrc; // @[dcache.scala 585:21]
  wire [39:0] mshr_read_req_0_addr = {{8'd0}, _T_9}; // @[dcache.scala 516:27 dcache.scala 519:29]
  wire [39:0] replay_req_0_addr = mshrs_io_replay_bits_addr; // @[dcache.scala 495:24 dcache.scala 498:28]
  wire [39:0] _T_35_0_addr = _T_30 ? mshr_read_req_0_addr : replay_req_0_addr; // @[dcache.scala 585:21]
  wire [63:0] replay_req_0_data = mshrs_io_replay_bits_data; // @[dcache.scala 495:24 dcache.scala 499:28]
  wire [63:0] _T_35_0_data = _T_30 ? 64'h0 : replay_req_0_data; // @[dcache.scala 585:21]
  wire  replay_req_0_is_hella = mshrs_io_replay_bits_is_hella; // @[dcache.scala 495:24 dcache.scala 500:28]
  wire  _T_35_0_is_hella = _T_30 ? 1'h0 : replay_req_0_is_hella; // @[dcache.scala 585:21]
  wire [6:0] prefetch_req_0_uop_uopc = mshrs_io_prefetch_bits_uop_uopc; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [31:0] prefetch_req_0_uop_inst = mshrs_io_prefetch_bits_uop_inst; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [31:0] prefetch_req_0_uop_debug_inst = mshrs_io_prefetch_bits_uop_debug_inst; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_is_rvc = mshrs_io_prefetch_bits_uop_is_rvc; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [39:0] prefetch_req_0_uop_debug_pc = mshrs_io_prefetch_bits_uop_debug_pc; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [2:0] prefetch_req_0_uop_iq_type = mshrs_io_prefetch_bits_uop_iq_type; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [9:0] prefetch_req_0_uop_fu_code = mshrs_io_prefetch_bits_uop_fu_code; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [3:0] prefetch_req_0_uop_ctrl_br_type = mshrs_io_prefetch_bits_uop_ctrl_br_type; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [1:0] prefetch_req_0_uop_ctrl_op1_sel = mshrs_io_prefetch_bits_uop_ctrl_op1_sel; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [2:0] prefetch_req_0_uop_ctrl_op2_sel = mshrs_io_prefetch_bits_uop_ctrl_op2_sel; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [2:0] prefetch_req_0_uop_ctrl_imm_sel = mshrs_io_prefetch_bits_uop_ctrl_imm_sel; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [3:0] prefetch_req_0_uop_ctrl_op_fcn = mshrs_io_prefetch_bits_uop_ctrl_op_fcn; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_ctrl_fcn_dw = mshrs_io_prefetch_bits_uop_ctrl_fcn_dw; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [2:0] prefetch_req_0_uop_ctrl_csr_cmd = mshrs_io_prefetch_bits_uop_ctrl_csr_cmd; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_ctrl_is_load = mshrs_io_prefetch_bits_uop_ctrl_is_load; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_ctrl_is_sta = mshrs_io_prefetch_bits_uop_ctrl_is_sta; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_ctrl_is_std = mshrs_io_prefetch_bits_uop_ctrl_is_std; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [1:0] prefetch_req_0_uop_iw_state = mshrs_io_prefetch_bits_uop_iw_state; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_iw_p1_poisoned = mshrs_io_prefetch_bits_uop_iw_p1_poisoned; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_iw_p2_poisoned = mshrs_io_prefetch_bits_uop_iw_p2_poisoned; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_is_br = mshrs_io_prefetch_bits_uop_is_br; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_is_jalr = mshrs_io_prefetch_bits_uop_is_jalr; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_is_jal = mshrs_io_prefetch_bits_uop_is_jal; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_is_sfb = mshrs_io_prefetch_bits_uop_is_sfb; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [11:0] prefetch_req_0_uop_br_mask = mshrs_io_prefetch_bits_uop_br_mask; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [11:0] _T_36_0_uop_br_mask = prefetch_fire ? prefetch_req_0_uop_br_mask : _T_35_0_uop_br_mask; // @[dcache.scala 584:21]
  wire [3:0] prefetch_req_0_uop_br_tag = mshrs_io_prefetch_bits_uop_br_tag; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [4:0] prefetch_req_0_uop_ftq_idx = mshrs_io_prefetch_bits_uop_ftq_idx; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_edge_inst = mshrs_io_prefetch_bits_uop_edge_inst; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [5:0] prefetch_req_0_uop_pc_lob = mshrs_io_prefetch_bits_uop_pc_lob; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_taken = mshrs_io_prefetch_bits_uop_taken; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [19:0] prefetch_req_0_uop_imm_packed = mshrs_io_prefetch_bits_uop_imm_packed; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [11:0] prefetch_req_0_uop_csr_addr = mshrs_io_prefetch_bits_uop_csr_addr; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [5:0] prefetch_req_0_uop_rob_idx = mshrs_io_prefetch_bits_uop_rob_idx; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [3:0] prefetch_req_0_uop_ldq_idx = mshrs_io_prefetch_bits_uop_ldq_idx; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [3:0] prefetch_req_0_uop_stq_idx = mshrs_io_prefetch_bits_uop_stq_idx; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [1:0] prefetch_req_0_uop_rxq_idx = mshrs_io_prefetch_bits_uop_rxq_idx; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [5:0] prefetch_req_0_uop_pdst = mshrs_io_prefetch_bits_uop_pdst; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [5:0] prefetch_req_0_uop_prs1 = mshrs_io_prefetch_bits_uop_prs1; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [5:0] prefetch_req_0_uop_prs2 = mshrs_io_prefetch_bits_uop_prs2; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [5:0] prefetch_req_0_uop_prs3 = mshrs_io_prefetch_bits_uop_prs3; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [4:0] prefetch_req_0_uop_ppred = mshrs_io_prefetch_bits_uop_ppred; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_prs1_busy = mshrs_io_prefetch_bits_uop_prs1_busy; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_prs2_busy = mshrs_io_prefetch_bits_uop_prs2_busy; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_prs3_busy = mshrs_io_prefetch_bits_uop_prs3_busy; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_ppred_busy = mshrs_io_prefetch_bits_uop_ppred_busy; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [5:0] prefetch_req_0_uop_stale_pdst = mshrs_io_prefetch_bits_uop_stale_pdst; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_exception = mshrs_io_prefetch_bits_uop_exception; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [63:0] prefetch_req_0_uop_exc_cause = mshrs_io_prefetch_bits_uop_exc_cause; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_bypassable = mshrs_io_prefetch_bits_uop_bypassable; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [4:0] prefetch_req_0_uop_mem_cmd = mshrs_io_prefetch_bits_uop_mem_cmd; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [1:0] prefetch_req_0_uop_mem_size = mshrs_io_prefetch_bits_uop_mem_size; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_mem_signed = mshrs_io_prefetch_bits_uop_mem_signed; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_is_fence = mshrs_io_prefetch_bits_uop_is_fence; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_is_fencei = mshrs_io_prefetch_bits_uop_is_fencei; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_is_amo = mshrs_io_prefetch_bits_uop_is_amo; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_uses_ldq = mshrs_io_prefetch_bits_uop_uses_ldq; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  _T_36_0_uop_uses_ldq = prefetch_fire ? prefetch_req_0_uop_uses_ldq : _T_35_0_uop_uses_ldq; // @[dcache.scala 584:21]
  wire  prefetch_req_0_uop_uses_stq = mshrs_io_prefetch_bits_uop_uses_stq; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  _T_36_0_uop_uses_stq = prefetch_fire ? prefetch_req_0_uop_uses_stq : _T_35_0_uop_uses_stq; // @[dcache.scala 584:21]
  wire  prefetch_req_0_uop_is_sys_pc2epc = mshrs_io_prefetch_bits_uop_is_sys_pc2epc; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_is_unique = mshrs_io_prefetch_bits_uop_is_unique; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_flush_on_commit = mshrs_io_prefetch_bits_uop_flush_on_commit; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_ldst_is_rs1 = mshrs_io_prefetch_bits_uop_ldst_is_rs1; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [5:0] prefetch_req_0_uop_ldst = mshrs_io_prefetch_bits_uop_ldst; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [5:0] prefetch_req_0_uop_lrs1 = mshrs_io_prefetch_bits_uop_lrs1; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [5:0] prefetch_req_0_uop_lrs2 = mshrs_io_prefetch_bits_uop_lrs2; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [5:0] prefetch_req_0_uop_lrs3 = mshrs_io_prefetch_bits_uop_lrs3; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_ldst_val = mshrs_io_prefetch_bits_uop_ldst_val; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [1:0] prefetch_req_0_uop_dst_rtype = mshrs_io_prefetch_bits_uop_dst_rtype; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [1:0] prefetch_req_0_uop_lrs1_rtype = mshrs_io_prefetch_bits_uop_lrs1_rtype; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [1:0] prefetch_req_0_uop_lrs2_rtype = mshrs_io_prefetch_bits_uop_lrs2_rtype; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_frs3_en = mshrs_io_prefetch_bits_uop_frs3_en; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_fp_val = mshrs_io_prefetch_bits_uop_fp_val; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_fp_single = mshrs_io_prefetch_bits_uop_fp_single; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_xcpt_pf_if = mshrs_io_prefetch_bits_uop_xcpt_pf_if; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_xcpt_ae_if = mshrs_io_prefetch_bits_uop_xcpt_ae_if; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_xcpt_ma_if = mshrs_io_prefetch_bits_uop_xcpt_ma_if; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_bp_debug_if = mshrs_io_prefetch_bits_uop_bp_debug_if; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_uop_bp_xcpt_if = mshrs_io_prefetch_bits_uop_bp_xcpt_if; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [1:0] prefetch_req_0_uop_debug_fsrc = mshrs_io_prefetch_bits_uop_debug_fsrc; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [1:0] prefetch_req_0_uop_debug_tsrc = mshrs_io_prefetch_bits_uop_debug_tsrc; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [39:0] prefetch_req_0_addr = mshrs_io_prefetch_bits_addr; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [63:0] prefetch_req_0_data = mshrs_io_prefetch_bits_data; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire  prefetch_req_0_is_hella = mshrs_io_prefetch_bits_is_hella; // @[dcache.scala 567:27 dcache.scala 569:19]
  wire [11:0] _T_37_0_uop_br_mask = prober_fire ? 12'h0 : _T_36_0_uop_br_mask; // @[dcache.scala 583:21]
  wire  _T_37_0_uop_uses_ldq = prober_fire ? 1'h0 : _T_36_0_uop_uses_ldq; // @[dcache.scala 583:21]
  wire  _T_37_0_uop_uses_stq = prober_fire ? 1'h0 : _T_36_0_uop_uses_stq; // @[dcache.scala 583:21]
  wire [39:0] prober_req_0_addr = {{8'd0}, _T_23}; // @[dcache.scala 552:26 dcache.scala 555:26]
  wire [11:0] _T_38_0_uop_br_mask = wb_fire ? 12'h0 : _T_37_0_uop_br_mask; // @[dcache.scala 582:21]
  wire  _T_38_0_uop_uses_ldq = wb_fire ? 1'h0 : _T_37_0_uop_uses_ldq; // @[dcache.scala 582:21]
  wire  _T_38_0_uop_uses_stq = wb_fire ? 1'h0 : _T_37_0_uop_uses_stq; // @[dcache.scala 582:21]
  wire [39:0] wb_req_0_addr = {{8'd0}, _T_12}; // @[dcache.scala 531:20 dcache.scala 534:22]
  wire [11:0] s0_req_0_uop_br_mask = _T_25 ? io_lsu_req_bits_0_bits_uop_br_mask : _T_38_0_uop_br_mask; // @[dcache.scala 581:21]
  wire  s0_req_0_uop_uses_ldq = _T_25 ? io_lsu_req_bits_0_bits_uop_uses_ldq : _T_38_0_uop_uses_ldq; // @[dcache.scala 581:21]
  wire  s0_req_0_uop_uses_stq = _T_25 ? io_lsu_req_bits_0_bits_uop_uses_stq : _T_38_0_uop_uses_stq; // @[dcache.scala 581:21]
  wire [2:0] _T_41 = _T_30 ? 3'h3 : 3'h0; // @[dcache.scala 591:21]
  wire  _T_52 = mshrs_io_replay_bits_uop_mem_cmd == 5'h4; // @[package.scala 15:47]
  wire  _T_53 = mshrs_io_replay_bits_uop_mem_cmd == 5'h9; // @[package.scala 15:47]
  wire  _T_54 = mshrs_io_replay_bits_uop_mem_cmd == 5'ha; // @[package.scala 15:47]
  wire  _T_55 = mshrs_io_replay_bits_uop_mem_cmd == 5'hb; // @[package.scala 15:47]
  wire  _T_58 = _T_52 | _T_53 | _T_54 | _T_55; // @[package.scala 72:59]
  wire  _T_59 = mshrs_io_replay_bits_uop_mem_cmd == 5'h8; // @[package.scala 15:47]
  wire  _T_60 = mshrs_io_replay_bits_uop_mem_cmd == 5'hc; // @[package.scala 15:47]
  wire  _T_61 = mshrs_io_replay_bits_uop_mem_cmd == 5'hd; // @[package.scala 15:47]
  wire  _T_62 = mshrs_io_replay_bits_uop_mem_cmd == 5'he; // @[package.scala 15:47]
  wire  _T_63 = mshrs_io_replay_bits_uop_mem_cmd == 5'hf; // @[package.scala 15:47]
  wire  _T_67 = _T_59 | _T_60 | _T_61 | _T_62 | _T_63; // @[package.scala 72:59]
  wire  _T_68 = _T_58 | _T_67; // @[Consts.scala 79:44]
  wire  _T_69 = mshrs_io_replay_bits_uop_mem_cmd == 5'h0 | mshrs_io_replay_bits_uop_mem_cmd == 5'h6 |
    mshrs_io_replay_bits_uop_mem_cmd == 5'h7 | _T_68; // @[Consts.scala 81:75]
  wire  _T_70 = _T_26 & _T_69; // @[dcache.scala 596:40]
  reg [6:0] s1_req_0_uop_uopc; // @[dcache.scala 599:32]
  reg [31:0] s1_req_0_uop_inst; // @[dcache.scala 599:32]
  reg [31:0] s1_req_0_uop_debug_inst; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_is_rvc; // @[dcache.scala 599:32]
  reg [39:0] s1_req_0_uop_debug_pc; // @[dcache.scala 599:32]
  reg [2:0] s1_req_0_uop_iq_type; // @[dcache.scala 599:32]
  reg [9:0] s1_req_0_uop_fu_code; // @[dcache.scala 599:32]
  reg [3:0] s1_req_0_uop_ctrl_br_type; // @[dcache.scala 599:32]
  reg [1:0] s1_req_0_uop_ctrl_op1_sel; // @[dcache.scala 599:32]
  reg [2:0] s1_req_0_uop_ctrl_op2_sel; // @[dcache.scala 599:32]
  reg [2:0] s1_req_0_uop_ctrl_imm_sel; // @[dcache.scala 599:32]
  reg [3:0] s1_req_0_uop_ctrl_op_fcn; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_ctrl_fcn_dw; // @[dcache.scala 599:32]
  reg [2:0] s1_req_0_uop_ctrl_csr_cmd; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_ctrl_is_load; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_ctrl_is_sta; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_ctrl_is_std; // @[dcache.scala 599:32]
  reg [1:0] s1_req_0_uop_iw_state; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_iw_p1_poisoned; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_iw_p2_poisoned; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_is_br; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_is_jalr; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_is_jal; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_is_sfb; // @[dcache.scala 599:32]
  reg [11:0] s1_req_0_uop_br_mask; // @[dcache.scala 599:32]
  reg [3:0] s1_req_0_uop_br_tag; // @[dcache.scala 599:32]
  reg [4:0] s1_req_0_uop_ftq_idx; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_edge_inst; // @[dcache.scala 599:32]
  reg [5:0] s1_req_0_uop_pc_lob; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_taken; // @[dcache.scala 599:32]
  reg [19:0] s1_req_0_uop_imm_packed; // @[dcache.scala 599:32]
  reg [11:0] s1_req_0_uop_csr_addr; // @[dcache.scala 599:32]
  reg [5:0] s1_req_0_uop_rob_idx; // @[dcache.scala 599:32]
  reg [3:0] s1_req_0_uop_ldq_idx; // @[dcache.scala 599:32]
  reg [3:0] s1_req_0_uop_stq_idx; // @[dcache.scala 599:32]
  reg [1:0] s1_req_0_uop_rxq_idx; // @[dcache.scala 599:32]
  reg [5:0] s1_req_0_uop_pdst; // @[dcache.scala 599:32]
  reg [5:0] s1_req_0_uop_prs1; // @[dcache.scala 599:32]
  reg [5:0] s1_req_0_uop_prs2; // @[dcache.scala 599:32]
  reg [5:0] s1_req_0_uop_prs3; // @[dcache.scala 599:32]
  reg [4:0] s1_req_0_uop_ppred; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_prs1_busy; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_prs2_busy; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_prs3_busy; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_ppred_busy; // @[dcache.scala 599:32]
  reg [5:0] s1_req_0_uop_stale_pdst; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_exception; // @[dcache.scala 599:32]
  reg [63:0] s1_req_0_uop_exc_cause; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_bypassable; // @[dcache.scala 599:32]
  reg [4:0] s1_req_0_uop_mem_cmd; // @[dcache.scala 599:32]
  reg [1:0] s1_req_0_uop_mem_size; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_mem_signed; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_is_fence; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_is_fencei; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_is_amo; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_uses_ldq; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_uses_stq; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_is_sys_pc2epc; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_is_unique; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_flush_on_commit; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_ldst_is_rs1; // @[dcache.scala 599:32]
  reg [5:0] s1_req_0_uop_ldst; // @[dcache.scala 599:32]
  reg [5:0] s1_req_0_uop_lrs1; // @[dcache.scala 599:32]
  reg [5:0] s1_req_0_uop_lrs2; // @[dcache.scala 599:32]
  reg [5:0] s1_req_0_uop_lrs3; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_ldst_val; // @[dcache.scala 599:32]
  reg [1:0] s1_req_0_uop_dst_rtype; // @[dcache.scala 599:32]
  reg [1:0] s1_req_0_uop_lrs1_rtype; // @[dcache.scala 599:32]
  reg [1:0] s1_req_0_uop_lrs2_rtype; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_frs3_en; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_fp_val; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_fp_single; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_xcpt_pf_if; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_xcpt_ae_if; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_xcpt_ma_if; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_bp_debug_if; // @[dcache.scala 599:32]
  reg  s1_req_0_uop_bp_xcpt_if; // @[dcache.scala 599:32]
  reg [1:0] s1_req_0_uop_debug_fsrc; // @[dcache.scala 599:32]
  reg [1:0] s1_req_0_uop_debug_tsrc; // @[dcache.scala 599:32]
  reg [39:0] s1_req_0_addr; // @[dcache.scala 599:32]
  reg [63:0] s1_req_0_data; // @[dcache.scala 599:32]
  reg  s1_req_0_is_hella; // @[dcache.scala 599:32]
  wire [11:0] _T_73 = ~io_lsu_brupdate_b1_resolve_mask; // @[util.scala 85:27]
  wire [11:0] _T_75 = io_lsu_brupdate_b1_mispredict_mask & s0_req_0_uop_br_mask; // @[util.scala 118:51]
  wire  _T_76 = _T_75 != 12'h0; // @[util.scala 118:59]
  wire  _T_77 = ~_T_76; // @[dcache.scala 605:26]
  wire  _T_78 = s0_valid_0 & _T_77; // @[dcache.scala 604:74]
  wire  _T_80 = ~(io_lsu_exception & s0_req_0_uop_uses_ldq); // @[dcache.scala 606:26]
  wire  _T_81 = _T_78 & _T_80; // @[dcache.scala 605:76]
  reg  REG_3; // @[dcache.scala 634:26]
  reg [3:0] s2_tag_match_way_0; // @[dcache.scala 642:33]
  wire  s2_tag_match_0 = |s2_tag_match_way_0; // @[dcache.scala 643:49]
  reg [4:0] s2_req_0_uop_mem_cmd; // @[dcache.scala 631:25]
  wire  _c_cat_T_3 = s2_req_0_uop_mem_cmd == 5'h7; // @[Consts.scala 82:66]
  wire  _c_cat_T_5 = s2_req_0_uop_mem_cmd == 5'h4; // @[package.scala 15:47]
  wire  _c_cat_T_6 = s2_req_0_uop_mem_cmd == 5'h9; // @[package.scala 15:47]
  wire  _c_cat_T_7 = s2_req_0_uop_mem_cmd == 5'ha; // @[package.scala 15:47]
  wire  _c_cat_T_8 = s2_req_0_uop_mem_cmd == 5'hb; // @[package.scala 15:47]
  wire  _c_cat_T_11 = _c_cat_T_5 | _c_cat_T_6 | _c_cat_T_7 | _c_cat_T_8; // @[package.scala 72:59]
  wire  _c_cat_T_12 = s2_req_0_uop_mem_cmd == 5'h8; // @[package.scala 15:47]
  wire  _c_cat_T_13 = s2_req_0_uop_mem_cmd == 5'hc; // @[package.scala 15:47]
  wire  _c_cat_T_14 = s2_req_0_uop_mem_cmd == 5'hd; // @[package.scala 15:47]
  wire  _c_cat_T_15 = s2_req_0_uop_mem_cmd == 5'he; // @[package.scala 15:47]
  wire  _c_cat_T_16 = s2_req_0_uop_mem_cmd == 5'hf; // @[package.scala 15:47]
  wire  _c_cat_T_20 = _c_cat_T_12 | _c_cat_T_13 | _c_cat_T_14 | _c_cat_T_15 | _c_cat_T_16; // @[package.scala 72:59]
  wire  _c_cat_T_21 = _c_cat_T_11 | _c_cat_T_20; // @[Consts.scala 79:44]
  wire  c_cat_hi = s2_req_0_uop_mem_cmd == 5'h1 | s2_req_0_uop_mem_cmd == 5'h11 | s2_req_0_uop_mem_cmd == 5'h7 |
    _c_cat_T_21; // @[Consts.scala 82:76]
  wire  _c_cat_T_45 = s2_req_0_uop_mem_cmd == 5'h3; // @[Consts.scala 83:54]
  wire  _c_cat_T_47 = s2_req_0_uop_mem_cmd == 5'h6; // @[Consts.scala 83:71]
  wire  c_cat_lo = c_cat_hi | s2_req_0_uop_mem_cmd == 5'h3 | s2_req_0_uop_mem_cmd == 5'h6; // @[Consts.scala 83:64]
  reg [1:0] REG_4_state; // @[dcache.scala 644:93]
  wire [1:0] _T_150 = s2_tag_match_way_0[0] ? REG_4_state : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] REG_5_state; // @[dcache.scala 644:93]
  wire [1:0] _T_151 = s2_tag_match_way_0[1] ? REG_5_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_154 = _T_150 | _T_151; // @[Mux.scala 27:72]
  reg [1:0] REG_6_state; // @[dcache.scala 644:93]
  wire [1:0] _T_152 = s2_tag_match_way_0[2] ? REG_6_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_155 = _T_154 | _T_152; // @[Mux.scala 27:72]
  reg [1:0] REG_7_state; // @[dcache.scala 644:93]
  wire [1:0] _T_153 = s2_tag_match_way_0[3] ? REG_7_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] s2_hit_state_0_state = _T_155 | _T_153; // @[Mux.scala 27:72]
  wire [3:0] _T_157 = {c_cat_hi,c_cat_lo,s2_hit_state_0_state}; // @[Cat.scala 30:58]
  wire  _T_203 = 4'h3 == _T_157; // @[Misc.scala 48:20]
  wire  _T_200 = 4'h2 == _T_157; // @[Misc.scala 48:20]
  wire  _T_197 = 4'h1 == _T_157; // @[Misc.scala 48:20]
  wire  _T_194 = 4'h7 == _T_157; // @[Misc.scala 48:20]
  wire  _T_191 = 4'h6 == _T_157; // @[Misc.scala 48:20]
  wire  _T_188 = 4'hf == _T_157; // @[Misc.scala 48:20]
  wire  _T_185 = 4'he == _T_157; // @[Misc.scala 48:20]
  wire  _T_182 = 4'h0 == _T_157; // @[Misc.scala 48:20]
  wire  _T_179 = 4'h5 == _T_157; // @[Misc.scala 48:20]
  wire  _T_176 = 4'h4 == _T_157; // @[Misc.scala 48:20]
  wire  _T_173 = 4'hd == _T_157; // @[Misc.scala 48:20]
  wire  _T_170 = 4'hc == _T_157; // @[Misc.scala 48:20]
  wire  s2_has_permission_0 = _T_203 | (_T_200 | (_T_197 | (_T_194 | (_T_191 | (_T_188 | _T_185))))); // @[Misc.scala 34:9]
  wire [1:0] _T_221 = _T_170 ? 2'h1 : 2'h0; // @[Misc.scala 34:36]
  wire [1:0] _T_224 = _T_173 ? 2'h2 : _T_221; // @[Misc.scala 34:36]
  wire [1:0] _T_227 = _T_176 ? 2'h1 : _T_224; // @[Misc.scala 34:36]
  wire [1:0] _T_230 = _T_179 ? 2'h2 : _T_227; // @[Misc.scala 34:36]
  wire [1:0] _T_233 = _T_182 ? 2'h0 : _T_230; // @[Misc.scala 34:36]
  wire [1:0] _T_236 = _T_185 ? 2'h3 : _T_233; // @[Misc.scala 34:36]
  wire [1:0] _T_239 = _T_188 ? 2'h3 : _T_236; // @[Misc.scala 34:36]
  wire [1:0] _T_242 = _T_191 ? 2'h2 : _T_239; // @[Misc.scala 34:36]
  wire [1:0] _T_245 = _T_194 ? 2'h3 : _T_242; // @[Misc.scala 34:36]
  wire [1:0] _T_248 = _T_197 ? 2'h1 : _T_245; // @[Misc.scala 34:36]
  wire [1:0] _T_251 = _T_200 ? 2'h2 : _T_248; // @[Misc.scala 34:36]
  wire [1:0] meta_1_state = _T_203 ? 2'h3 : _T_251; // @[Misc.scala 34:36]
  wire  _T_256 = s2_hit_state_0_state == meta_1_state; // @[Metadata.scala 45:46]
  reg [2:0] s2_type; // @[dcache.scala 632:25]
  wire  _T_260 = s2_type == 3'h0; // @[package.scala 15:47]
  wire  _T_261 = s2_type == 3'h2; // @[package.scala 15:47]
  wire  _T_262 = _T_260 | _T_261; // @[package.scala 72:59]
  wire  s2_hit_0 = s2_tag_match_0 & s2_has_permission_0 & _T_256 & ~mshrs_io_block_hit_0 | _T_262; // @[dcache.scala 648:141]
  wire  _T_354 = ~s2_hit_0; // @[dcache.scala 725:53]
  wire  _T_355 = REG_3 & ~s2_hit_0; // @[dcache.scala 725:50]
  wire  s2_nack_miss_0 = REG_3 & ~s2_hit_0 & ~mshrs_io_req_0_ready; // @[dcache.scala 725:64]
  reg  s2_nack_hit_0; // @[dcache.scala 721:31]
  wire  _T_352 = REG_3 & s2_hit_0; // @[dcache.scala 723:50]
  wire  s2_nack_victim_0 = REG_3 & s2_hit_0 & mshrs_io_secondary_miss_0; // @[dcache.scala 723:64]
  wire  s2_nack_data_0 = data_io_nacks_0; // @[dcache.scala 426:49 dcache.scala 426:49]
  reg  s2_wb_idx_matches_0; // @[dcache.scala 653:34]
  wire  s2_nack_wb_0 = _T_355 & s2_wb_idx_matches_0; // @[dcache.scala 729:64]
  wire  s2_nack_0 = (s2_nack_miss_0 | s2_nack_hit_0 | s2_nack_victim_0 | s2_nack_data_0 | s2_nack_wb_0) & s2_type != 3'h0
    ; // @[dcache.scala 731:131]
  reg  REG_16; // @[dcache.scala 734:44]
  wire  s2_send_nack_0 = REG_16 & s2_nack_0; // @[dcache.scala 734:70]
  reg  s2_req_0_uop_uses_stq; // @[dcache.scala 631:25]
  wire  s2_store_failed = REG_3 & s2_nack_0 & s2_send_nack_0 & s2_req_0_uop_uses_stq; // @[dcache.scala 741:67]
  wire  _T_85 = ~(s2_store_failed & _T_25 & s0_req_0_uop_uses_stq); // @[dcache.scala 607:26]
  wire  _T_86 = _T_81 & _T_85; // @[dcache.scala 606:74]
  reg  REG; // @[dcache.scala 604:25]
  reg  REG_1; // @[dcache.scala 610:43]
  reg  REG_2; // @[dcache.scala 610:74]
  reg  s1_send_resp_or_nack_0; // @[dcache.scala 613:37]
  reg [2:0] s1_type; // @[dcache.scala 614:32]
  reg [3:0] s1_mshr_meta_read_way_en; // @[dcache.scala 616:41]
  reg [3:0] s1_replay_way_en; // @[dcache.scala 617:41]
  reg [3:0] s1_wb_way_en; // @[dcache.scala 618:41]
  wire [27:0] _GEN_110 = {{8'd0}, meta_0_io_resp_0_tag}; // @[dcache.scala 622:79]
  wire [27:0] _GEN_111 = {{8'd0}, meta_0_io_resp_1_tag}; // @[dcache.scala 622:79]
  wire [27:0] _GEN_112 = {{8'd0}, meta_0_io_resp_2_tag}; // @[dcache.scala 622:79]
  wire [27:0] _GEN_113 = {{8'd0}, meta_0_io_resp_3_tag}; // @[dcache.scala 622:79]
  wire [3:0] s1_tag_eq_way_0 = {_GEN_113 == s1_req_0_addr[39:12],_GEN_112 == s1_req_0_addr[39:12],_GEN_111 ==
    s1_req_0_addr[39:12],_GEN_110 == s1_req_0_addr[39:12]}; // @[dcache.scala 622:110]
  wire  _T_112 = meta_0_io_resp_0_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _T_113 = s1_tag_eq_way_0[0] & _T_112; // @[dcache.scala 627:67]
  wire  _T_115 = meta_0_io_resp_1_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _T_116 = s1_tag_eq_way_0[1] & _T_115; // @[dcache.scala 627:67]
  wire  _T_118 = meta_0_io_resp_2_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _T_119 = s1_tag_eq_way_0[2] & _T_118; // @[dcache.scala 627:67]
  wire  _T_121 = meta_0_io_resp_3_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _T_122 = s1_tag_eq_way_0[3] & _T_121; // @[dcache.scala 627:67]
  wire [3:0] _T_123 = {_T_122,_T_119,_T_116,_T_113}; // @[dcache.scala 627:104]
  reg [6:0] s2_req_0_uop_uopc; // @[dcache.scala 631:25]
  reg [31:0] s2_req_0_uop_inst; // @[dcache.scala 631:25]
  reg [31:0] s2_req_0_uop_debug_inst; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_is_rvc; // @[dcache.scala 631:25]
  reg [39:0] s2_req_0_uop_debug_pc; // @[dcache.scala 631:25]
  reg [2:0] s2_req_0_uop_iq_type; // @[dcache.scala 631:25]
  reg [9:0] s2_req_0_uop_fu_code; // @[dcache.scala 631:25]
  reg [3:0] s2_req_0_uop_ctrl_br_type; // @[dcache.scala 631:25]
  reg [1:0] s2_req_0_uop_ctrl_op1_sel; // @[dcache.scala 631:25]
  reg [2:0] s2_req_0_uop_ctrl_op2_sel; // @[dcache.scala 631:25]
  reg [2:0] s2_req_0_uop_ctrl_imm_sel; // @[dcache.scala 631:25]
  reg [3:0] s2_req_0_uop_ctrl_op_fcn; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_ctrl_fcn_dw; // @[dcache.scala 631:25]
  reg [2:0] s2_req_0_uop_ctrl_csr_cmd; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_ctrl_is_load; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_ctrl_is_sta; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_ctrl_is_std; // @[dcache.scala 631:25]
  reg [1:0] s2_req_0_uop_iw_state; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_iw_p1_poisoned; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_iw_p2_poisoned; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_is_br; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_is_jalr; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_is_jal; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_is_sfb; // @[dcache.scala 631:25]
  reg [11:0] s2_req_0_uop_br_mask; // @[dcache.scala 631:25]
  reg [3:0] s2_req_0_uop_br_tag; // @[dcache.scala 631:25]
  reg [4:0] s2_req_0_uop_ftq_idx; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_edge_inst; // @[dcache.scala 631:25]
  reg [5:0] s2_req_0_uop_pc_lob; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_taken; // @[dcache.scala 631:25]
  reg [19:0] s2_req_0_uop_imm_packed; // @[dcache.scala 631:25]
  reg [11:0] s2_req_0_uop_csr_addr; // @[dcache.scala 631:25]
  reg [5:0] s2_req_0_uop_rob_idx; // @[dcache.scala 631:25]
  reg [3:0] s2_req_0_uop_ldq_idx; // @[dcache.scala 631:25]
  reg [3:0] s2_req_0_uop_stq_idx; // @[dcache.scala 631:25]
  reg [1:0] s2_req_0_uop_rxq_idx; // @[dcache.scala 631:25]
  reg [5:0] s2_req_0_uop_pdst; // @[dcache.scala 631:25]
  reg [5:0] s2_req_0_uop_prs1; // @[dcache.scala 631:25]
  reg [5:0] s2_req_0_uop_prs2; // @[dcache.scala 631:25]
  reg [5:0] s2_req_0_uop_prs3; // @[dcache.scala 631:25]
  reg [4:0] s2_req_0_uop_ppred; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_prs1_busy; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_prs2_busy; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_prs3_busy; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_ppred_busy; // @[dcache.scala 631:25]
  reg [5:0] s2_req_0_uop_stale_pdst; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_exception; // @[dcache.scala 631:25]
  reg [63:0] s2_req_0_uop_exc_cause; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_bypassable; // @[dcache.scala 631:25]
  reg [1:0] s2_req_0_uop_mem_size; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_mem_signed; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_is_fence; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_is_fencei; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_is_amo; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_uses_ldq; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_is_sys_pc2epc; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_is_unique; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_flush_on_commit; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_ldst_is_rs1; // @[dcache.scala 631:25]
  reg [5:0] s2_req_0_uop_ldst; // @[dcache.scala 631:25]
  reg [5:0] s2_req_0_uop_lrs1; // @[dcache.scala 631:25]
  reg [5:0] s2_req_0_uop_lrs2; // @[dcache.scala 631:25]
  reg [5:0] s2_req_0_uop_lrs3; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_ldst_val; // @[dcache.scala 631:25]
  reg [1:0] s2_req_0_uop_dst_rtype; // @[dcache.scala 631:25]
  reg [1:0] s2_req_0_uop_lrs1_rtype; // @[dcache.scala 631:25]
  reg [1:0] s2_req_0_uop_lrs2_rtype; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_frs3_en; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_fp_val; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_fp_single; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_xcpt_pf_if; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_xcpt_ae_if; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_xcpt_ma_if; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_bp_debug_if; // @[dcache.scala 631:25]
  reg  s2_req_0_uop_bp_xcpt_if; // @[dcache.scala 631:25]
  reg [1:0] s2_req_0_uop_debug_fsrc; // @[dcache.scala 631:25]
  reg [1:0] s2_req_0_uop_debug_tsrc; // @[dcache.scala 631:25]
  reg [39:0] s2_req_0_addr; // @[dcache.scala 631:25]
  reg [63:0] s2_req_0_data; // @[dcache.scala 631:25]
  reg  s2_req_0_is_hella; // @[dcache.scala 631:25]
  wire  _T_130 = ~io_lsu_s1_kill_0; // @[dcache.scala 635:26]
  wire  _T_131 = REG & _T_130; // @[dcache.scala 634:39]
  wire [11:0] _T_132 = io_lsu_brupdate_b1_mispredict_mask & s1_req_0_uop_br_mask; // @[util.scala 118:51]
  wire  _T_133 = _T_132 != 12'h0; // @[util.scala 118:59]
  wire  _T_134 = ~_T_133; // @[dcache.scala 636:26]
  wire  _T_135 = _T_131 & _T_134; // @[dcache.scala 635:45]
  wire  _T_137 = ~(io_lsu_exception & s1_req_0_uop_uses_ldq); // @[dcache.scala 637:26]
  wire  _T_138 = _T_135 & _T_137; // @[dcache.scala 636:76]
  wire  _T_142 = ~(s2_store_failed & s1_type == 3'h4 & s1_req_0_uop_uses_stq); // @[dcache.scala 638:26]
  reg [39:0] debug_sc_fail_addr; // @[dcache.scala 656:35]
  reg [7:0] debug_sc_fail_cnt; // @[dcache.scala 657:35]
  reg [6:0] lrsc_count; // @[dcache.scala 659:27]
  wire  lrsc_valid = lrsc_count > 7'h3; // @[dcache.scala 660:31]
  reg [33:0] lrsc_addr; // @[dcache.scala 661:23]
  reg  REG_8; // @[dcache.scala 662:59]
  wire  s2_lr = _c_cat_T_47 & (~REG_8 | _T_260); // @[dcache.scala 662:47]
  reg  REG_9; // @[dcache.scala 663:59]
  wire  s2_sc = _c_cat_T_3 & (~REG_9 | _T_260); // @[dcache.scala 663:47]
  wire  s2_lrsc_addr_match_0 = lrsc_valid & lrsc_addr == s2_req_0_addr[39:6]; // @[dcache.scala 664:53]
  wire  s2_sc_fail = s2_sc & ~s2_lrsc_addr_match_0; // @[dcache.scala 665:26]
  wire  _T_290 = lrsc_count > 7'h0; // @[dcache.scala 666:20]
  wire [6:0] _T_292 = lrsc_count - 7'h1; // @[dcache.scala 666:54]
  wire [6:0] _GEN_0 = lrsc_count > 7'h0 ? _T_292 : lrsc_count; // @[dcache.scala 666:27 dcache.scala 666:40 dcache.scala 659:27]
  wire  _T_293 = s2_type == 3'h4; // @[dcache.scala 667:34]
  wire  _T_295 = ~s2_nack_0; // @[dcache.scala 667:60]
  wire  _T_299 = _T_260 & s2_req_0_uop_mem_cmd != 5'h5; // @[dcache.scala 668:44]
  wire  _T_301 = REG_3 & (s2_type == 3'h4 & s2_hit_0 & ~s2_nack_0 | _T_299); // @[dcache.scala 667:21]
  wire [6:0] _GEN_1 = s2_lr ? 7'h4f : _GEN_0; // @[dcache.scala 669:18 dcache.scala 670:18]
  wire  _T_305 = REG_3 & _T_293; // @[dcache.scala 678:50]
  wire  _T_307 = _T_305 & _T_354; // @[dcache.scala 679:50]
  wire  _T_309 = ~(s2_has_permission_0 & s2_tag_match_0); // @[dcache.scala 681:7]
  wire  _T_310 = _T_307 & _T_309; // @[dcache.scala 680:50]
  wire  _T_311 = _T_310 & s2_lrsc_addr_match_0; // @[dcache.scala 681:50]
  wire  _T_313 = _T_311 & _T_295; // @[dcache.scala 682:50]
  wire [7:0] _T_316 = debug_sc_fail_cnt + 8'h1; // @[dcache.scala 691:48]
  wire [7:0] _GEN_7 = s2_sc ? 8'h0 : debug_sc_fail_cnt; // @[dcache.scala 692:27 dcache.scala 693:27 dcache.scala 657:35]
  wire [63:0] s2_data_0_0 = data_io_resp_0_0; // @[dcache.scala 704:21 dcache.scala 707:21]
  wire [63:0] _T_325 = s2_tag_match_way_0[0] ? s2_data_0_0 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] s2_data_0_1 = data_io_resp_0_1; // @[dcache.scala 704:21 dcache.scala 707:21]
  wire [63:0] _T_326 = s2_tag_match_way_0[1] ? s2_data_0_1 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] s2_data_0_2 = data_io_resp_0_2; // @[dcache.scala 704:21 dcache.scala 707:21]
  wire [63:0] _T_327 = s2_tag_match_way_0[2] ? s2_data_0_2 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] s2_data_0_3 = data_io_resp_0_3; // @[dcache.scala 704:21 dcache.scala 707:21]
  wire [63:0] _T_328 = s2_tag_match_way_0[3] ? s2_data_0_3 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_329 = _T_325 | _T_326; // @[Mux.scala 27:72]
  wire [63:0] _T_330 = _T_329 | _T_327; // @[Mux.scala 27:72]
  wire [63:0] s2_data_muxed_0 = _T_330 | _T_328; // @[Mux.scala 27:72]
  wire [7:0] lfsr_lo = {lfsr_prng_io_out_7,lfsr_prng_io_out_6,lfsr_prng_io_out_5,lfsr_prng_io_out_4,lfsr_prng_io_out_3,
    lfsr_prng_io_out_2,lfsr_prng_io_out_1,lfsr_prng_io_out_0}; // @[PRNG.scala 86:17]
  wire [15:0] lfsr = {lfsr_prng_io_out_15,lfsr_prng_io_out_14,lfsr_prng_io_out_13,lfsr_prng_io_out_12,
    lfsr_prng_io_out_11,lfsr_prng_io_out_10,lfsr_prng_io_out_9,lfsr_prng_io_out_8,lfsr_lo}; // @[PRNG.scala 86:17]
  reg [1:0] REG_10; // @[dcache.scala 717:44]
  wire [3:0] s2_replaced_way_en = 4'h1 << REG_10; // @[OneHot.scala 58:35]
  reg [1:0] REG_11_coh_state; // @[dcache.scala 718:88]
  reg [19:0] REG_11_tag; // @[dcache.scala 718:88]
  reg [1:0] REG_12_coh_state; // @[dcache.scala 718:88]
  reg [19:0] REG_12_tag; // @[dcache.scala 718:88]
  reg [1:0] REG_13_coh_state; // @[dcache.scala 718:88]
  reg [19:0] REG_13_tag; // @[dcache.scala 718:88]
  reg [1:0] REG_14_coh_state; // @[dcache.scala 718:88]
  reg [19:0] REG_14_tag; // @[dcache.scala 718:88]
  wire [19:0] _T_338 = s2_replaced_way_en[0] ? REG_11_tag : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_339 = s2_replaced_way_en[1] ? REG_12_tag : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_340 = s2_replaced_way_en[2] ? REG_13_tag : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_341 = s2_replaced_way_en[3] ? REG_14_tag : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_342 = _T_338 | _T_339; // @[Mux.scala 27:72]
  wire [19:0] _T_343 = _T_342 | _T_340; // @[Mux.scala 27:72]
  wire [1:0] _T_345 = s2_replaced_way_en[0] ? REG_11_coh_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_346 = s2_replaced_way_en[1] ? REG_12_coh_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_347 = s2_replaced_way_en[2] ? REG_13_coh_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_348 = s2_replaced_way_en[3] ? REG_14_coh_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_349 = _T_345 | _T_346; // @[Mux.scala 27:72]
  wire [1:0] _T_350 = _T_349 | _T_347; // @[Mux.scala 27:72]
  wire [1:0] s2_repl_meta_0_coh_state = _T_350 | _T_348; // @[Mux.scala 27:72]
  reg  REG_15; // @[dcache.scala 732:44]
  wire  _T_369 = mshrs_io_req_0_ready & mshrs_io_req_0_valid; // @[Decoupled.scala 40:37]
  wire  _T_416 = s2_req_0_uop_mem_cmd == 5'h0 | _c_cat_T_47 | _c_cat_T_3 | _c_cat_T_21; // @[Consts.scala 81:75]
  wire  _T_419 = s2_hit_0 | _T_369 & c_cat_hi & ~_T_416; // @[dcache.scala 733:34]
  wire  s2_send_resp_0 = REG_15 & _T_295 & _T_419; // @[dcache.scala 732:85]
  wire  _T_432 = ~s2_nack_hit_0; // @[dcache.scala 747:29]
  wire  _T_433 = _T_355 & _T_432; // @[dcache.scala 746:51]
  wire  _T_434 = ~s2_nack_victim_0; // @[dcache.scala 748:29]
  wire  _T_435 = _T_433 & _T_434; // @[dcache.scala 747:51]
  wire  _T_436 = ~s2_nack_data_0; // @[dcache.scala 749:29]
  wire  _T_437 = _T_435 & _T_436; // @[dcache.scala 748:51]
  wire  _T_438 = ~s2_nack_wb_0; // @[dcache.scala 750:29]
  wire  _T_439 = _T_437 & _T_438; // @[dcache.scala 749:51]
  wire  _T_441 = s2_type == 3'h5; // @[package.scala 15:47]
  wire  _T_442 = _T_293 | _T_441; // @[package.scala 72:59]
  wire  _T_443 = _T_439 & _T_442; // @[dcache.scala 750:51]
  wire [11:0] _T_444 = io_lsu_brupdate_b1_mispredict_mask & s2_req_0_uop_br_mask; // @[util.scala 118:51]
  wire  _T_445 = _T_444 != 12'h0; // @[util.scala 118:59]
  wire  _T_446 = ~_T_445; // @[dcache.scala 752:29]
  wire  _T_447 = _T_443 & _T_446; // @[dcache.scala 751:77]
  wire  _T_449 = ~(io_lsu_exception & s2_req_0_uop_uses_ldq); // @[dcache.scala 753:29]
  wire  _T_450 = _T_447 & _T_449; // @[dcache.scala 752:79]
  wire  _T_453 = s2_req_0_uop_mem_cmd == 5'h2 | _c_cat_T_45; // @[Consts.scala 80:45]
  wire  _T_477 = _T_453 | _T_416; // @[dcache.scala 754:65]
  wire  _T_501 = _T_477 | c_cat_hi; // @[dcache.scala 755:65]
  reg [1:0] REG_17_0_coh_state; // @[dcache.scala 772:70]
  reg [19:0] REG_17_0_tag; // @[dcache.scala 772:70]
  reg [1:0] REG_17_1_coh_state; // @[dcache.scala 772:70]
  reg [19:0] REG_17_1_tag; // @[dcache.scala 772:70]
  reg [1:0] REG_17_2_coh_state; // @[dcache.scala 772:70]
  reg [19:0] REG_17_2_tag; // @[dcache.scala 772:70]
  reg [1:0] REG_17_3_coh_state; // @[dcache.scala 772:70]
  reg [19:0] REG_17_3_tag; // @[dcache.scala 772:70]
  wire [19:0] _T_521 = s2_tag_match_way_0[0] ? REG_17_0_tag : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_522 = s2_tag_match_way_0[1] ? REG_17_1_tag : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_523 = s2_tag_match_way_0[2] ? REG_17_2_tag : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_524 = s2_tag_match_way_0[3] ? REG_17_3_tag : 20'h0; // @[Mux.scala 27:72]
  wire [19:0] _T_525 = _T_521 | _T_522; // @[Mux.scala 27:72]
  wire [19:0] _T_526 = _T_525 | _T_523; // @[Mux.scala 27:72]
  wire [1:0] _T_528 = s2_tag_match_way_0[0] ? REG_17_0_coh_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_529 = s2_tag_match_way_0[1] ? REG_17_1_coh_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_530 = s2_tag_match_way_0[2] ? REG_17_2_coh_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_531 = s2_tag_match_way_0[3] ? REG_17_3_coh_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_532 = _T_528 | _T_529; // @[Mux.scala 27:72]
  wire [1:0] _T_533 = _T_532 | _T_530; // @[Mux.scala 27:72]
  wire  _T_536 = ~lrsc_valid; // @[dcache.scala 777:46]
  wire  _T_541 = auto_out_d_bits_source == 2'h2; // @[dcache.scala 788:30]
  wire  tl_out_d_ready = auto_out_d_bits_source == 2'h2 | mshrs_io_mem_grant_ready; // @[dcache.scala 788:48 dcache.scala 790:20 dcache.scala 795:24]
  wire  _T_542 = tl_out_d_ready & auto_out_d_valid; // @[Decoupled.scala 40:37]
  wire [26:0] _decode_T_1 = 27'hfff << wb_io_release_bits_size; // @[package.scala 234:77]
  wire [11:0] _decode_T_3 = ~_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] decode = _decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  opdata = wb_io_release_bits_opcode[0]; // @[Edges.scala 101:36]
  wire [8:0] _T_545 = opdata ? decode : 9'h0; // @[Edges.scala 220:14]
  wire [26:0] _decode_T_5 = 27'hfff << prober_io_rep_bits_size; // @[package.scala 234:77]
  wire [11:0] _decode_T_7 = ~_decode_T_5[11:0]; // @[package.scala 234:46]
  wire [8:0] decode_1 = _decode_T_7[11:3]; // @[Edges.scala 219:59]
  wire  opdata_1 = prober_io_rep_bits_opcode[0]; // @[Edges.scala 101:36]
  wire [8:0] _T_546 = opdata_1 ? decode_1 : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] beatsLeft; // @[Arbiter.scala 87:30]
  wire  idle = beatsLeft == 9'h0; // @[Arbiter.scala 88:28]
  wire  latch = idle & auto_out_c_ready; // @[Arbiter.scala 89:24]
  wire  out_earlyValid = wb_io_release_valid; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 71:20]
  wire  out_1_earlyValid = prober_io_rep_valid; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 71:20]
  wire [1:0] _readys_T = {out_1_earlyValid,out_earlyValid}; // @[Cat.scala 30:58]
  wire [2:0] _readys_T_1 = {_readys_T, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_T_3 = _readys_T | _readys_T_1[1:0]; // @[package.scala 244:43]
  wire [2:0] _readys_T_5 = {_readys_T_3, 1'h0}; // @[Arbiter.scala 16:78]
  wire [1:0] _readys_T_7 = ~_readys_T_5[1:0]; // @[Arbiter.scala 16:61]
  wire  readys_0 = _readys_T_7[0]; // @[Arbiter.scala 95:86]
  wire  readys_1 = _readys_T_7[1]; // @[Arbiter.scala 95:86]
  wire  earlyWinner_0 = readys_0 & out_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1 = readys_1 & out_1_earlyValid; // @[Arbiter.scala 97:79]
  wire  _prefixOR_T = earlyWinner_0 | earlyWinner_1; // @[Arbiter.scala 104:53]
  wire  _T_557 = out_earlyValid | out_1_earlyValid; // @[Arbiter.scala 107:36]
  wire  _T_558 = ~(out_earlyValid | out_1_earlyValid); // @[Arbiter.scala 107:15]
  wire [8:0] maskedBeats_0 = earlyWinner_0 ? _T_545 : 9'h0; // @[Arbiter.scala 111:73]
  wire [8:0] maskedBeats_1 = earlyWinner_1 ? _T_546 : 9'h0; // @[Arbiter.scala 111:73]
  wire [8:0] initBeats = maskedBeats_0 | maskedBeats_1; // @[Arbiter.scala 112:44]
  reg  state_0; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_0 = idle ? earlyWinner_0 : state_0; // @[Arbiter.scala 117:30]
  reg  state_1; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1 = idle ? earlyWinner_1 : state_1; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_3 = state_0 & out_earlyValid | state_1 & out_1_earlyValid; // @[Mux.scala 27:72]
  wire  sink_ACancel_earlyValid = idle ? _T_557 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_2 = auto_out_c_ready & sink_ACancel_earlyValid; // @[ReadyValidCancel.scala 50:33]
  wire [8:0] _GEN_114 = {{8'd0}, _beatsLeft_T_2}; // @[Arbiter.scala 113:52]
  wire [8:0] _beatsLeft_T_4 = beatsLeft - _GEN_114; // @[Arbiter.scala 113:52]
  wire  allowed_0 = idle ? readys_0 : state_0; // @[Arbiter.scala 121:24]
  wire  allowed_1 = idle ? readys_1 : state_1; // @[Arbiter.scala 121:24]
  wire  out_bits_corrupt = wb_io_release_bits_corrupt; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire  out_1_bits_corrupt = prober_io_rep_bits_corrupt; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [63:0] out_bits_data = wb_io_release_bits_data; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [63:0] _T_574 = muxStateEarly_0 ? out_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] out_1_bits_data = prober_io_rep_bits_data; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [63:0] _T_575 = muxStateEarly_1 ? out_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] out_bits_address = wb_io_release_bits_address; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [31:0] _T_577 = muxStateEarly_0 ? out_bits_address : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] out_1_bits_address = prober_io_rep_bits_address; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [31:0] _T_578 = muxStateEarly_1 ? out_1_bits_address : 32'h0; // @[Mux.scala 27:72]
  wire [1:0] out_bits_source = wb_io_release_bits_source; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [1:0] _T_580 = muxStateEarly_0 ? out_bits_source : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] out_1_bits_source = prober_io_rep_bits_source; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [1:0] _T_581 = muxStateEarly_1 ? out_1_bits_source : 2'h0; // @[Mux.scala 27:72]
  wire [3:0] out_bits_size = wb_io_release_bits_size; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [3:0] _T_583 = muxStateEarly_0 ? out_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] out_1_bits_size = prober_io_rep_bits_size; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [3:0] _T_584 = muxStateEarly_1 ? out_1_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] sink_ACancel_bits_size = _T_583 | _T_584; // @[Mux.scala 27:72]
  wire [2:0] out_bits_param = wb_io_release_bits_param; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [2:0] _T_586 = muxStateEarly_0 ? out_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] out_1_bits_param = prober_io_rep_bits_param; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [2:0] _T_587 = muxStateEarly_1 ? out_1_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] out_bits_opcode = wb_io_release_bits_opcode; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [2:0] _T_589 = muxStateEarly_0 ? out_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] out_1_bits_opcode = prober_io_rep_bits_opcode; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [2:0] _T_590 = muxStateEarly_1 ? out_1_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] sink_ACancel_bits_opcode = _T_589 | _T_590; // @[Mux.scala 27:72]
  wire [26:0] _beats1_decode_T_1 = 27'hfff << sink_ACancel_bits_size; // @[package.scala 234:77]
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] beats1_decode = _beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  beats1_opdata = sink_ACancel_bits_opcode[0]; // @[Edges.scala 101:36]
  wire [8:0] beats1 = beats1_opdata ? beats1_decode : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] counter; // @[Edges.scala 228:27]
  wire [8:0] counter1 = counter - 9'h1; // @[Edges.scala 229:28]
  wire  first = counter == 9'h0; // @[Edges.scala 230:25]
  wire  last = counter == 9'h1 | beats1 == 9'h0; // @[Edges.scala 231:37]
  wire  tl_out_a_valid = mshrs_io_mem_acquire_valid; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  wire  _T_593 = auto_out_a_ready & tl_out_a_valid; // @[Decoupled.scala 40:37]
  wire [3:0] tl_out_a_bits_size = mshrs_io_mem_acquire_bits_size; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  wire [26:0] _beats1_decode_T_5 = 27'hfff << tl_out_a_bits_size; // @[package.scala 234:77]
  wire [11:0] _beats1_decode_T_7 = ~_beats1_decode_T_5[11:0]; // @[package.scala 234:46]
  wire [8:0] beats1_decode_1 = _beats1_decode_T_7[11:3]; // @[Edges.scala 219:59]
  wire [2:0] tl_out_a_bits_opcode = mshrs_io_mem_acquire_bits_opcode; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  wire  beats1_opdata_1 = ~tl_out_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [8:0] beats1_1 = beats1_opdata_1 ? beats1_decode_1 : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] counter_1; // @[Edges.scala 228:27]
  wire [8:0] counter1_1 = counter_1 - 9'h1; // @[Edges.scala 229:28]
  wire  first_1 = counter_1 == 9'h0; // @[Edges.scala 230:25]
  wire  last_1 = counter_1 == 9'h1 | beats1_1 == 9'h0; // @[Edges.scala 231:37]
  wire  cache_resp_0_valid = REG_3 & s2_send_resp_0; // @[dcache.scala 834:48]
  reg  s3_valid; // @[dcache.scala 870:25]
  reg [39:0] s3_req_addr; // @[dcache.scala 869:25]
  wire  s3_bypass_0 = s3_valid & s2_req_0_addr[39:3] == s3_req_addr[39:3]; // @[dcache.scala 884:42]
  reg [63:0] s3_req_data; // @[dcache.scala 869:25]
  reg  s4_valid; // @[dcache.scala 880:25]
  reg [39:0] s4_req_addr; // @[dcache.scala 879:25]
  wire  s4_bypass_0 = s4_valid & s2_req_0_addr[39:3] == s4_req_addr[39:3]; // @[dcache.scala 885:42]
  reg [63:0] s4_req_data; // @[dcache.scala 879:25]
  reg  s5_valid; // @[dcache.scala 882:25]
  reg [39:0] s5_req_addr; // @[dcache.scala 881:25]
  wire  s5_bypass_0 = s5_valid & s2_req_0_addr[39:3] == s5_req_addr[39:3]; // @[dcache.scala 886:42]
  reg [63:0] s5_req_data; // @[dcache.scala 881:25]
  wire [63:0] _T_694 = s5_bypass_0 ? s5_req_data : s2_data_muxed_0; // @[dcache.scala 892:27]
  wire [63:0] _T_695 = s4_bypass_0 ? s4_req_data : _T_694; // @[dcache.scala 891:27]
  wire [63:0] s2_data_word_0 = s3_bypass_0 ? s3_req_data : _T_695; // @[dcache.scala 890:27]
  wire [31:0] shifted = s2_req_0_addr[2] ? s2_data_word_0[63:32] : s2_data_word_0[31:0]; // @[AMOALU.scala 39:24]
  wire  _T_601 = s2_req_0_uop_mem_signed & shifted[31]; // @[AMOALU.scala 42:76]
  wire [31:0] _T_603 = _T_601 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] hi_28 = s2_req_0_uop_mem_size == 2'h2 ? _T_603 : s2_data_word_0[63:32]; // @[AMOALU.scala 42:20]
  wire [63:0] _T_605 = {hi_28,shifted}; // @[Cat.scala 30:58]
  wire [15:0] shifted_1 = s2_req_0_addr[1] ? _T_605[31:16] : _T_605[15:0]; // @[AMOALU.scala 39:24]
  wire  _T_609 = s2_req_0_uop_mem_signed & shifted_1[15]; // @[AMOALU.scala 42:76]
  wire [47:0] _T_611 = _T_609 ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [47:0] hi_29 = s2_req_0_uop_mem_size == 2'h1 ? _T_611 : _T_605[63:16]; // @[AMOALU.scala 42:20]
  wire [63:0] _T_613 = {hi_29,shifted_1}; // @[Cat.scala 30:58]
  wire [7:0] shifted_2 = s2_req_0_addr[0] ? _T_613[15:8] : _T_613[7:0]; // @[AMOALU.scala 39:24]
  wire [7:0] lo_4 = s2_sc ? 8'h0 : shifted_2; // @[AMOALU.scala 41:23]
  wire  _T_617 = s2_req_0_uop_mem_signed & lo_4[7]; // @[AMOALU.scala 42:76]
  wire [55:0] _T_619 = _T_617 ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [55:0] hi_30 = s2_req_0_uop_mem_size == 2'h0 | s2_sc ? _T_619 : _T_613[63:8]; // @[AMOALU.scala 42:20]
  wire [63:0] _T_621 = {hi_30,lo_4}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_115 = {{63'd0}, s2_sc_fail}; // @[dcache.scala 836:52]
  wire [63:0] cache_resp_0_bits_data = _T_621 | _GEN_115; // @[dcache.scala 836:52]
  wire  _T_623 = ~cache_resp_0_valid; // @[dcache.scala 843:26]
  wire  uncache_resp_bits_is_hella = mshrs_io_resp_bits_is_hella; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [63:0] uncache_resp_bits_data = mshrs_io_resp_bits_data; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [1:0] uncache_resp_bits_uop_debug_tsrc = mshrs_io_resp_bits_uop_debug_tsrc; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [1:0] uncache_resp_bits_uop_debug_fsrc = mshrs_io_resp_bits_uop_debug_fsrc; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_bp_xcpt_if = mshrs_io_resp_bits_uop_bp_xcpt_if; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_bp_debug_if = mshrs_io_resp_bits_uop_bp_debug_if; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_xcpt_ma_if = mshrs_io_resp_bits_uop_xcpt_ma_if; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_xcpt_ae_if = mshrs_io_resp_bits_uop_xcpt_ae_if; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_xcpt_pf_if = mshrs_io_resp_bits_uop_xcpt_pf_if; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_fp_single = mshrs_io_resp_bits_uop_fp_single; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_fp_val = mshrs_io_resp_bits_uop_fp_val; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_frs3_en = mshrs_io_resp_bits_uop_frs3_en; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [1:0] uncache_resp_bits_uop_lrs2_rtype = mshrs_io_resp_bits_uop_lrs2_rtype; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [1:0] uncache_resp_bits_uop_lrs1_rtype = mshrs_io_resp_bits_uop_lrs1_rtype; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [1:0] uncache_resp_bits_uop_dst_rtype = mshrs_io_resp_bits_uop_dst_rtype; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_ldst_val = mshrs_io_resp_bits_uop_ldst_val; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [5:0] uncache_resp_bits_uop_lrs3 = mshrs_io_resp_bits_uop_lrs3; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [5:0] uncache_resp_bits_uop_lrs2 = mshrs_io_resp_bits_uop_lrs2; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [5:0] uncache_resp_bits_uop_lrs1 = mshrs_io_resp_bits_uop_lrs1; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [5:0] uncache_resp_bits_uop_ldst = mshrs_io_resp_bits_uop_ldst; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_ldst_is_rs1 = mshrs_io_resp_bits_uop_ldst_is_rs1; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_flush_on_commit = mshrs_io_resp_bits_uop_flush_on_commit; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_is_unique = mshrs_io_resp_bits_uop_is_unique; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_is_sys_pc2epc = mshrs_io_resp_bits_uop_is_sys_pc2epc; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_uses_stq = mshrs_io_resp_bits_uop_uses_stq; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_uses_ldq = mshrs_io_resp_bits_uop_uses_ldq; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  resp_0_bits_uop_uses_ldq = _T_623 ? uncache_resp_bits_uop_uses_ldq : s2_req_0_uop_uses_ldq; // @[dcache.scala 849:28 dcache.scala 850:15]
  wire  uncache_resp_bits_uop_is_amo = mshrs_io_resp_bits_uop_is_amo; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_is_fencei = mshrs_io_resp_bits_uop_is_fencei; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_is_fence = mshrs_io_resp_bits_uop_is_fence; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_mem_signed = mshrs_io_resp_bits_uop_mem_signed; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [1:0] uncache_resp_bits_uop_mem_size = mshrs_io_resp_bits_uop_mem_size; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [4:0] uncache_resp_bits_uop_mem_cmd = mshrs_io_resp_bits_uop_mem_cmd; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_bypassable = mshrs_io_resp_bits_uop_bypassable; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [63:0] uncache_resp_bits_uop_exc_cause = mshrs_io_resp_bits_uop_exc_cause; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_exception = mshrs_io_resp_bits_uop_exception; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [5:0] uncache_resp_bits_uop_stale_pdst = mshrs_io_resp_bits_uop_stale_pdst; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_ppred_busy = mshrs_io_resp_bits_uop_ppred_busy; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_prs3_busy = mshrs_io_resp_bits_uop_prs3_busy; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_prs2_busy = mshrs_io_resp_bits_uop_prs2_busy; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_prs1_busy = mshrs_io_resp_bits_uop_prs1_busy; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [4:0] uncache_resp_bits_uop_ppred = mshrs_io_resp_bits_uop_ppred; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [5:0] uncache_resp_bits_uop_prs3 = mshrs_io_resp_bits_uop_prs3; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [5:0] uncache_resp_bits_uop_prs2 = mshrs_io_resp_bits_uop_prs2; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [5:0] uncache_resp_bits_uop_prs1 = mshrs_io_resp_bits_uop_prs1; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [5:0] uncache_resp_bits_uop_pdst = mshrs_io_resp_bits_uop_pdst; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [1:0] uncache_resp_bits_uop_rxq_idx = mshrs_io_resp_bits_uop_rxq_idx; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [3:0] uncache_resp_bits_uop_stq_idx = mshrs_io_resp_bits_uop_stq_idx; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [3:0] uncache_resp_bits_uop_ldq_idx = mshrs_io_resp_bits_uop_ldq_idx; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [5:0] uncache_resp_bits_uop_rob_idx = mshrs_io_resp_bits_uop_rob_idx; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [11:0] uncache_resp_bits_uop_csr_addr = mshrs_io_resp_bits_uop_csr_addr; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [19:0] uncache_resp_bits_uop_imm_packed = mshrs_io_resp_bits_uop_imm_packed; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_taken = mshrs_io_resp_bits_uop_taken; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [5:0] uncache_resp_bits_uop_pc_lob = mshrs_io_resp_bits_uop_pc_lob; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_edge_inst = mshrs_io_resp_bits_uop_edge_inst; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [4:0] uncache_resp_bits_uop_ftq_idx = mshrs_io_resp_bits_uop_ftq_idx; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [3:0] uncache_resp_bits_uop_br_tag = mshrs_io_resp_bits_uop_br_tag; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [11:0] uncache_resp_bits_uop_br_mask = mshrs_io_resp_bits_uop_br_mask; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [11:0] resp_0_bits_uop_br_mask = _T_623 ? uncache_resp_bits_uop_br_mask : s2_req_0_uop_br_mask; // @[dcache.scala 849:28 dcache.scala 850:15]
  wire  uncache_resp_bits_uop_is_sfb = mshrs_io_resp_bits_uop_is_sfb; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_is_jal = mshrs_io_resp_bits_uop_is_jal; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_is_jalr = mshrs_io_resp_bits_uop_is_jalr; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_is_br = mshrs_io_resp_bits_uop_is_br; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_iw_p2_poisoned = mshrs_io_resp_bits_uop_iw_p2_poisoned; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_iw_p1_poisoned = mshrs_io_resp_bits_uop_iw_p1_poisoned; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [1:0] uncache_resp_bits_uop_iw_state = mshrs_io_resp_bits_uop_iw_state; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_ctrl_is_std = mshrs_io_resp_bits_uop_ctrl_is_std; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_ctrl_is_sta = mshrs_io_resp_bits_uop_ctrl_is_sta; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_ctrl_is_load = mshrs_io_resp_bits_uop_ctrl_is_load; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [2:0] uncache_resp_bits_uop_ctrl_csr_cmd = mshrs_io_resp_bits_uop_ctrl_csr_cmd; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_ctrl_fcn_dw = mshrs_io_resp_bits_uop_ctrl_fcn_dw; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [3:0] uncache_resp_bits_uop_ctrl_op_fcn = mshrs_io_resp_bits_uop_ctrl_op_fcn; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [2:0] uncache_resp_bits_uop_ctrl_imm_sel = mshrs_io_resp_bits_uop_ctrl_imm_sel; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [2:0] uncache_resp_bits_uop_ctrl_op2_sel = mshrs_io_resp_bits_uop_ctrl_op2_sel; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [1:0] uncache_resp_bits_uop_ctrl_op1_sel = mshrs_io_resp_bits_uop_ctrl_op1_sel; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [3:0] uncache_resp_bits_uop_ctrl_br_type = mshrs_io_resp_bits_uop_ctrl_br_type; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [9:0] uncache_resp_bits_uop_fu_code = mshrs_io_resp_bits_uop_fu_code; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [2:0] uncache_resp_bits_uop_iq_type = mshrs_io_resp_bits_uop_iq_type; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [39:0] uncache_resp_bits_uop_debug_pc = mshrs_io_resp_bits_uop_debug_pc; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_bits_uop_is_rvc = mshrs_io_resp_bits_uop_is_rvc; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [31:0] uncache_resp_bits_uop_debug_inst = mshrs_io_resp_bits_uop_debug_inst; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [31:0] uncache_resp_bits_uop_inst = mshrs_io_resp_bits_uop_inst; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire [6:0] uncache_resp_bits_uop_uopc = mshrs_io_resp_bits_uop_uopc; // @[dcache.scala 840:26 dcache.scala 841:25]
  wire  uncache_resp_valid = mshrs_io_resp_valid; // @[dcache.scala 840:26 dcache.scala 842:25]
  wire  resp_0_valid = _T_623 ? uncache_resp_valid : cache_resp_0_valid; // @[dcache.scala 849:28 dcache.scala 850:15]
  wire  _T_628 = ~(io_lsu_exception & resp_0_bits_uop_uses_ldq); // @[dcache.scala 857:29]
  wire  _T_629 = resp_0_valid & _T_628; // @[dcache.scala 856:43]
  wire [11:0] _T_630 = io_lsu_brupdate_b1_mispredict_mask & resp_0_bits_uop_br_mask; // @[util.scala 118:51]
  wire  _T_631 = _T_630 != 12'h0; // @[util.scala 118:59]
  wire  _T_632 = ~_T_631; // @[dcache.scala 858:29]
  wire  _T_639 = REG_3 & s2_send_nack_0 & _T_449; // @[dcache.scala 861:60]
  wire  _T_677 = ~s2_sc_fail; // @[dcache.scala 871:26]
  wire  _T_678 = _T_352 & c_cat_hi & _T_677; // @[dcache.scala 870:85]
  wire  hi_31 = s2_req_0_addr[0] | s2_req_0_uop_mem_size >= 2'h1; // @[AMOALU.scala 17:46]
  wire  lo_5 = s2_req_0_addr[0] ? 1'h0 : 1'h1; // @[AMOALU.scala 18:22]
  wire [1:0] _T_697 = {hi_31,lo_5}; // @[Cat.scala 30:58]
  wire [1:0] _upper_T_5 = s2_req_0_addr[1] ? _T_697 : 2'h0; // @[AMOALU.scala 17:22]
  wire [1:0] _upper_T_7 = s2_req_0_uop_mem_size >= 2'h2 ? 2'h3 : 2'h0; // @[AMOALU.scala 17:51]
  wire [1:0] hi_32 = _upper_T_5 | _upper_T_7; // @[AMOALU.scala 17:46]
  wire [1:0] lo_6 = s2_req_0_addr[1] ? 2'h0 : _T_697; // @[AMOALU.scala 18:22]
  wire [3:0] _T_698 = {hi_32,lo_6}; // @[Cat.scala 30:58]
  wire [3:0] _upper_T_9 = s2_req_0_addr[2] ? _T_698 : 4'h0; // @[AMOALU.scala 17:22]
  wire [3:0] _upper_T_11 = s2_req_0_uop_mem_size >= 2'h3 ? 4'hf : 4'h0; // @[AMOALU.scala 17:51]
  wire [3:0] hi_33 = _upper_T_9 | _upper_T_11; // @[AMOALU.scala 17:46]
  wire [3:0] lo_7 = s2_req_0_addr[2] ? 4'h0 : _T_698; // @[AMOALU.scala 18:22]
  reg [3:0] s3_way; // @[dcache.scala 903:25]
  BoomWritebackUnit wb ( // @[dcache.scala 430:18]
    .clock(wb_clock),
    .reset(wb_reset),
    .io_req_ready(wb_io_req_ready),
    .io_req_valid(wb_io_req_valid),
    .io_req_bits_tag(wb_io_req_bits_tag),
    .io_req_bits_idx(wb_io_req_bits_idx),
    .io_req_bits_source(wb_io_req_bits_source),
    .io_req_bits_param(wb_io_req_bits_param),
    .io_req_bits_way_en(wb_io_req_bits_way_en),
    .io_req_bits_voluntary(wb_io_req_bits_voluntary),
    .io_meta_read_ready(wb_io_meta_read_ready),
    .io_meta_read_valid(wb_io_meta_read_valid),
    .io_meta_read_bits_idx(wb_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en(wb_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag(wb_io_meta_read_bits_tag),
    .io_resp(wb_io_resp),
    .io_idx_valid(wb_io_idx_valid),
    .io_idx_bits(wb_io_idx_bits),
    .io_data_req_ready(wb_io_data_req_ready),
    .io_data_req_valid(wb_io_data_req_valid),
    .io_data_req_bits_way_en(wb_io_data_req_bits_way_en),
    .io_data_req_bits_addr(wb_io_data_req_bits_addr),
    .io_data_resp(wb_io_data_resp),
    .io_mem_grant(wb_io_mem_grant),
    .io_release_ready(wb_io_release_ready),
    .io_release_valid(wb_io_release_valid),
    .io_release_bits_opcode(wb_io_release_bits_opcode),
    .io_release_bits_param(wb_io_release_bits_param),
    .io_release_bits_size(wb_io_release_bits_size),
    .io_release_bits_source(wb_io_release_bits_source),
    .io_release_bits_address(wb_io_release_bits_address),
    .io_release_bits_data(wb_io_release_bits_data),
    .io_release_bits_corrupt(wb_io_release_bits_corrupt),
    .io_lsu_release_ready(wb_io_lsu_release_ready),
    .io_lsu_release_valid(wb_io_lsu_release_valid),
    .io_lsu_release_bits_opcode(wb_io_lsu_release_bits_opcode),
    .io_lsu_release_bits_param(wb_io_lsu_release_bits_param),
    .io_lsu_release_bits_size(wb_io_lsu_release_bits_size),
    .io_lsu_release_bits_source(wb_io_lsu_release_bits_source),
    .io_lsu_release_bits_address(wb_io_lsu_release_bits_address),
    .io_lsu_release_bits_data(wb_io_lsu_release_bits_data),
    .io_lsu_release_bits_corrupt(wb_io_lsu_release_bits_corrupt)
  );
  BoomProbeUnit prober ( // @[dcache.scala 431:22]
    .clock(prober_clock),
    .reset(prober_reset),
    .io_req_ready(prober_io_req_ready),
    .io_req_valid(prober_io_req_valid),
    .io_req_bits_opcode(prober_io_req_bits_opcode),
    .io_req_bits_param(prober_io_req_bits_param),
    .io_req_bits_size(prober_io_req_bits_size),
    .io_req_bits_source(prober_io_req_bits_source),
    .io_req_bits_address(prober_io_req_bits_address),
    .io_req_bits_mask(prober_io_req_bits_mask),
    .io_req_bits_data(prober_io_req_bits_data),
    .io_req_bits_corrupt(prober_io_req_bits_corrupt),
    .io_rep_ready(prober_io_rep_ready),
    .io_rep_valid(prober_io_rep_valid),
    .io_rep_bits_opcode(prober_io_rep_bits_opcode),
    .io_rep_bits_param(prober_io_rep_bits_param),
    .io_rep_bits_size(prober_io_rep_bits_size),
    .io_rep_bits_source(prober_io_rep_bits_source),
    .io_rep_bits_address(prober_io_rep_bits_address),
    .io_rep_bits_data(prober_io_rep_bits_data),
    .io_rep_bits_corrupt(prober_io_rep_bits_corrupt),
    .io_meta_read_ready(prober_io_meta_read_ready),
    .io_meta_read_valid(prober_io_meta_read_valid),
    .io_meta_read_bits_idx(prober_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en(prober_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag(prober_io_meta_read_bits_tag),
    .io_meta_write_ready(prober_io_meta_write_ready),
    .io_meta_write_valid(prober_io_meta_write_valid),
    .io_meta_write_bits_idx(prober_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en(prober_io_meta_write_bits_way_en),
    .io_meta_write_bits_tag(prober_io_meta_write_bits_tag),
    .io_meta_write_bits_data_coh_state(prober_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag(prober_io_meta_write_bits_data_tag),
    .io_wb_req_ready(prober_io_wb_req_ready),
    .io_wb_req_valid(prober_io_wb_req_valid),
    .io_wb_req_bits_tag(prober_io_wb_req_bits_tag),
    .io_wb_req_bits_idx(prober_io_wb_req_bits_idx),
    .io_wb_req_bits_source(prober_io_wb_req_bits_source),
    .io_wb_req_bits_param(prober_io_wb_req_bits_param),
    .io_wb_req_bits_way_en(prober_io_wb_req_bits_way_en),
    .io_wb_req_bits_voluntary(prober_io_wb_req_bits_voluntary),
    .io_way_en(prober_io_way_en),
    .io_wb_rdy(prober_io_wb_rdy),
    .io_mshr_rdy(prober_io_mshr_rdy),
    .io_mshr_wb_rdy(prober_io_mshr_wb_rdy),
    .io_block_state_state(prober_io_block_state_state),
    .io_lsu_release_ready(prober_io_lsu_release_ready),
    .io_lsu_release_valid(prober_io_lsu_release_valid),
    .io_lsu_release_bits_opcode(prober_io_lsu_release_bits_opcode),
    .io_lsu_release_bits_param(prober_io_lsu_release_bits_param),
    .io_lsu_release_bits_size(prober_io_lsu_release_bits_size),
    .io_lsu_release_bits_source(prober_io_lsu_release_bits_source),
    .io_lsu_release_bits_address(prober_io_lsu_release_bits_address),
    .io_lsu_release_bits_data(prober_io_lsu_release_bits_data),
    .io_lsu_release_bits_corrupt(prober_io_lsu_release_bits_corrupt),
    .io_state_valid(prober_io_state_valid),
    .io_state_bits(prober_io_state_bits)
  );
  BoomMSHRFile mshrs ( // @[dcache.scala 432:21]
    .clock(mshrs_clock),
    .reset(mshrs_reset),
    .io_req_0_ready(mshrs_io_req_0_ready),
    .io_req_0_valid(mshrs_io_req_0_valid),
    .io_req_0_bits_uop_uopc(mshrs_io_req_0_bits_uop_uopc),
    .io_req_0_bits_uop_inst(mshrs_io_req_0_bits_uop_inst),
    .io_req_0_bits_uop_debug_inst(mshrs_io_req_0_bits_uop_debug_inst),
    .io_req_0_bits_uop_is_rvc(mshrs_io_req_0_bits_uop_is_rvc),
    .io_req_0_bits_uop_debug_pc(mshrs_io_req_0_bits_uop_debug_pc),
    .io_req_0_bits_uop_iq_type(mshrs_io_req_0_bits_uop_iq_type),
    .io_req_0_bits_uop_fu_code(mshrs_io_req_0_bits_uop_fu_code),
    .io_req_0_bits_uop_ctrl_br_type(mshrs_io_req_0_bits_uop_ctrl_br_type),
    .io_req_0_bits_uop_ctrl_op1_sel(mshrs_io_req_0_bits_uop_ctrl_op1_sel),
    .io_req_0_bits_uop_ctrl_op2_sel(mshrs_io_req_0_bits_uop_ctrl_op2_sel),
    .io_req_0_bits_uop_ctrl_imm_sel(mshrs_io_req_0_bits_uop_ctrl_imm_sel),
    .io_req_0_bits_uop_ctrl_op_fcn(mshrs_io_req_0_bits_uop_ctrl_op_fcn),
    .io_req_0_bits_uop_ctrl_fcn_dw(mshrs_io_req_0_bits_uop_ctrl_fcn_dw),
    .io_req_0_bits_uop_ctrl_csr_cmd(mshrs_io_req_0_bits_uop_ctrl_csr_cmd),
    .io_req_0_bits_uop_ctrl_is_load(mshrs_io_req_0_bits_uop_ctrl_is_load),
    .io_req_0_bits_uop_ctrl_is_sta(mshrs_io_req_0_bits_uop_ctrl_is_sta),
    .io_req_0_bits_uop_ctrl_is_std(mshrs_io_req_0_bits_uop_ctrl_is_std),
    .io_req_0_bits_uop_iw_state(mshrs_io_req_0_bits_uop_iw_state),
    .io_req_0_bits_uop_iw_p1_poisoned(mshrs_io_req_0_bits_uop_iw_p1_poisoned),
    .io_req_0_bits_uop_iw_p2_poisoned(mshrs_io_req_0_bits_uop_iw_p2_poisoned),
    .io_req_0_bits_uop_is_br(mshrs_io_req_0_bits_uop_is_br),
    .io_req_0_bits_uop_is_jalr(mshrs_io_req_0_bits_uop_is_jalr),
    .io_req_0_bits_uop_is_jal(mshrs_io_req_0_bits_uop_is_jal),
    .io_req_0_bits_uop_is_sfb(mshrs_io_req_0_bits_uop_is_sfb),
    .io_req_0_bits_uop_br_mask(mshrs_io_req_0_bits_uop_br_mask),
    .io_req_0_bits_uop_br_tag(mshrs_io_req_0_bits_uop_br_tag),
    .io_req_0_bits_uop_ftq_idx(mshrs_io_req_0_bits_uop_ftq_idx),
    .io_req_0_bits_uop_edge_inst(mshrs_io_req_0_bits_uop_edge_inst),
    .io_req_0_bits_uop_pc_lob(mshrs_io_req_0_bits_uop_pc_lob),
    .io_req_0_bits_uop_taken(mshrs_io_req_0_bits_uop_taken),
    .io_req_0_bits_uop_imm_packed(mshrs_io_req_0_bits_uop_imm_packed),
    .io_req_0_bits_uop_csr_addr(mshrs_io_req_0_bits_uop_csr_addr),
    .io_req_0_bits_uop_rob_idx(mshrs_io_req_0_bits_uop_rob_idx),
    .io_req_0_bits_uop_ldq_idx(mshrs_io_req_0_bits_uop_ldq_idx),
    .io_req_0_bits_uop_stq_idx(mshrs_io_req_0_bits_uop_stq_idx),
    .io_req_0_bits_uop_rxq_idx(mshrs_io_req_0_bits_uop_rxq_idx),
    .io_req_0_bits_uop_pdst(mshrs_io_req_0_bits_uop_pdst),
    .io_req_0_bits_uop_prs1(mshrs_io_req_0_bits_uop_prs1),
    .io_req_0_bits_uop_prs2(mshrs_io_req_0_bits_uop_prs2),
    .io_req_0_bits_uop_prs3(mshrs_io_req_0_bits_uop_prs3),
    .io_req_0_bits_uop_ppred(mshrs_io_req_0_bits_uop_ppred),
    .io_req_0_bits_uop_prs1_busy(mshrs_io_req_0_bits_uop_prs1_busy),
    .io_req_0_bits_uop_prs2_busy(mshrs_io_req_0_bits_uop_prs2_busy),
    .io_req_0_bits_uop_prs3_busy(mshrs_io_req_0_bits_uop_prs3_busy),
    .io_req_0_bits_uop_ppred_busy(mshrs_io_req_0_bits_uop_ppred_busy),
    .io_req_0_bits_uop_stale_pdst(mshrs_io_req_0_bits_uop_stale_pdst),
    .io_req_0_bits_uop_exception(mshrs_io_req_0_bits_uop_exception),
    .io_req_0_bits_uop_exc_cause(mshrs_io_req_0_bits_uop_exc_cause),
    .io_req_0_bits_uop_bypassable(mshrs_io_req_0_bits_uop_bypassable),
    .io_req_0_bits_uop_mem_cmd(mshrs_io_req_0_bits_uop_mem_cmd),
    .io_req_0_bits_uop_mem_size(mshrs_io_req_0_bits_uop_mem_size),
    .io_req_0_bits_uop_mem_signed(mshrs_io_req_0_bits_uop_mem_signed),
    .io_req_0_bits_uop_is_fence(mshrs_io_req_0_bits_uop_is_fence),
    .io_req_0_bits_uop_is_fencei(mshrs_io_req_0_bits_uop_is_fencei),
    .io_req_0_bits_uop_is_amo(mshrs_io_req_0_bits_uop_is_amo),
    .io_req_0_bits_uop_uses_ldq(mshrs_io_req_0_bits_uop_uses_ldq),
    .io_req_0_bits_uop_uses_stq(mshrs_io_req_0_bits_uop_uses_stq),
    .io_req_0_bits_uop_is_sys_pc2epc(mshrs_io_req_0_bits_uop_is_sys_pc2epc),
    .io_req_0_bits_uop_is_unique(mshrs_io_req_0_bits_uop_is_unique),
    .io_req_0_bits_uop_flush_on_commit(mshrs_io_req_0_bits_uop_flush_on_commit),
    .io_req_0_bits_uop_ldst_is_rs1(mshrs_io_req_0_bits_uop_ldst_is_rs1),
    .io_req_0_bits_uop_ldst(mshrs_io_req_0_bits_uop_ldst),
    .io_req_0_bits_uop_lrs1(mshrs_io_req_0_bits_uop_lrs1),
    .io_req_0_bits_uop_lrs2(mshrs_io_req_0_bits_uop_lrs2),
    .io_req_0_bits_uop_lrs3(mshrs_io_req_0_bits_uop_lrs3),
    .io_req_0_bits_uop_ldst_val(mshrs_io_req_0_bits_uop_ldst_val),
    .io_req_0_bits_uop_dst_rtype(mshrs_io_req_0_bits_uop_dst_rtype),
    .io_req_0_bits_uop_lrs1_rtype(mshrs_io_req_0_bits_uop_lrs1_rtype),
    .io_req_0_bits_uop_lrs2_rtype(mshrs_io_req_0_bits_uop_lrs2_rtype),
    .io_req_0_bits_uop_frs3_en(mshrs_io_req_0_bits_uop_frs3_en),
    .io_req_0_bits_uop_fp_val(mshrs_io_req_0_bits_uop_fp_val),
    .io_req_0_bits_uop_fp_single(mshrs_io_req_0_bits_uop_fp_single),
    .io_req_0_bits_uop_xcpt_pf_if(mshrs_io_req_0_bits_uop_xcpt_pf_if),
    .io_req_0_bits_uop_xcpt_ae_if(mshrs_io_req_0_bits_uop_xcpt_ae_if),
    .io_req_0_bits_uop_xcpt_ma_if(mshrs_io_req_0_bits_uop_xcpt_ma_if),
    .io_req_0_bits_uop_bp_debug_if(mshrs_io_req_0_bits_uop_bp_debug_if),
    .io_req_0_bits_uop_bp_xcpt_if(mshrs_io_req_0_bits_uop_bp_xcpt_if),
    .io_req_0_bits_uop_debug_fsrc(mshrs_io_req_0_bits_uop_debug_fsrc),
    .io_req_0_bits_uop_debug_tsrc(mshrs_io_req_0_bits_uop_debug_tsrc),
    .io_req_0_bits_addr(mshrs_io_req_0_bits_addr),
    .io_req_0_bits_data(mshrs_io_req_0_bits_data),
    .io_req_0_bits_is_hella(mshrs_io_req_0_bits_is_hella),
    .io_req_0_bits_tag_match(mshrs_io_req_0_bits_tag_match),
    .io_req_0_bits_old_meta_coh_state(mshrs_io_req_0_bits_old_meta_coh_state),
    .io_req_0_bits_old_meta_tag(mshrs_io_req_0_bits_old_meta_tag),
    .io_req_0_bits_way_en(mshrs_io_req_0_bits_way_en),
    .io_req_0_bits_sdq_id(mshrs_io_req_0_bits_sdq_id),
    .io_req_is_probe_0(mshrs_io_req_is_probe_0),
    .io_resp_ready(mshrs_io_resp_ready),
    .io_resp_valid(mshrs_io_resp_valid),
    .io_resp_bits_uop_uopc(mshrs_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(mshrs_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(mshrs_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(mshrs_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(mshrs_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(mshrs_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(mshrs_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(mshrs_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(mshrs_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(mshrs_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(mshrs_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(mshrs_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(mshrs_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(mshrs_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(mshrs_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(mshrs_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(mshrs_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state(mshrs_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(mshrs_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(mshrs_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(mshrs_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(mshrs_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(mshrs_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(mshrs_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(mshrs_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(mshrs_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(mshrs_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(mshrs_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(mshrs_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(mshrs_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(mshrs_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(mshrs_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(mshrs_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(mshrs_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(mshrs_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(mshrs_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(mshrs_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(mshrs_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(mshrs_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(mshrs_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(mshrs_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(mshrs_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(mshrs_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(mshrs_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(mshrs_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(mshrs_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(mshrs_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(mshrs_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(mshrs_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(mshrs_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(mshrs_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(mshrs_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(mshrs_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(mshrs_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(mshrs_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(mshrs_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(mshrs_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(mshrs_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(mshrs_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(mshrs_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(mshrs_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(mshrs_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(mshrs_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(mshrs_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(mshrs_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(mshrs_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(mshrs_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(mshrs_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(mshrs_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(mshrs_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(mshrs_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(mshrs_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(mshrs_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(mshrs_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(mshrs_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(mshrs_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(mshrs_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(mshrs_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(mshrs_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data(mshrs_io_resp_bits_data),
    .io_resp_bits_is_hella(mshrs_io_resp_bits_is_hella),
    .io_secondary_miss_0(mshrs_io_secondary_miss_0),
    .io_block_hit_0(mshrs_io_block_hit_0),
    .io_brupdate_b1_resolve_mask(mshrs_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(mshrs_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(mshrs_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(mshrs_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(mshrs_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(mshrs_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(mshrs_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(mshrs_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(mshrs_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(mshrs_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(mshrs_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(mshrs_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(mshrs_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(mshrs_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(mshrs_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(mshrs_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(mshrs_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(mshrs_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(mshrs_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(mshrs_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(mshrs_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(mshrs_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(mshrs_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(mshrs_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(mshrs_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(mshrs_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(mshrs_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(mshrs_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(mshrs_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(mshrs_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(mshrs_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(mshrs_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(mshrs_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(mshrs_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(mshrs_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(mshrs_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(mshrs_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(mshrs_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(mshrs_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(mshrs_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(mshrs_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(mshrs_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(mshrs_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(mshrs_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(mshrs_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(mshrs_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(mshrs_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(mshrs_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(mshrs_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(mshrs_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(mshrs_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(mshrs_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(mshrs_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(mshrs_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(mshrs_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(mshrs_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(mshrs_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(mshrs_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(mshrs_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(mshrs_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(mshrs_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(mshrs_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(mshrs_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(mshrs_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(mshrs_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(mshrs_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(mshrs_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(mshrs_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(mshrs_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(mshrs_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(mshrs_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(mshrs_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(mshrs_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(mshrs_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(mshrs_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(mshrs_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(mshrs_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(mshrs_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(mshrs_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(mshrs_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(mshrs_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(mshrs_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(mshrs_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(mshrs_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(mshrs_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(mshrs_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(mshrs_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(mshrs_io_brupdate_b2_target_offset),
    .io_exception(mshrs_io_exception),
    .io_rob_pnr_idx(mshrs_io_rob_pnr_idx),
    .io_rob_head_idx(mshrs_io_rob_head_idx),
    .io_mem_acquire_ready(mshrs_io_mem_acquire_ready),
    .io_mem_acquire_valid(mshrs_io_mem_acquire_valid),
    .io_mem_acquire_bits_opcode(mshrs_io_mem_acquire_bits_opcode),
    .io_mem_acquire_bits_param(mshrs_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_size(mshrs_io_mem_acquire_bits_size),
    .io_mem_acquire_bits_source(mshrs_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(mshrs_io_mem_acquire_bits_address),
    .io_mem_acquire_bits_mask(mshrs_io_mem_acquire_bits_mask),
    .io_mem_acquire_bits_data(mshrs_io_mem_acquire_bits_data),
    .io_mem_acquire_bits_corrupt(mshrs_io_mem_acquire_bits_corrupt),
    .io_mem_grant_ready(mshrs_io_mem_grant_ready),
    .io_mem_grant_valid(mshrs_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(mshrs_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(mshrs_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(mshrs_io_mem_grant_bits_size),
    .io_mem_grant_bits_source(mshrs_io_mem_grant_bits_source),
    .io_mem_grant_bits_sink(mshrs_io_mem_grant_bits_sink),
    .io_mem_grant_bits_denied(mshrs_io_mem_grant_bits_denied),
    .io_mem_grant_bits_data(mshrs_io_mem_grant_bits_data),
    .io_mem_grant_bits_corrupt(mshrs_io_mem_grant_bits_corrupt),
    .io_mem_finish_ready(mshrs_io_mem_finish_ready),
    .io_mem_finish_valid(mshrs_io_mem_finish_valid),
    .io_mem_finish_bits_sink(mshrs_io_mem_finish_bits_sink),
    .io_refill_ready(mshrs_io_refill_ready),
    .io_refill_valid(mshrs_io_refill_valid),
    .io_refill_bits_way_en(mshrs_io_refill_bits_way_en),
    .io_refill_bits_addr(mshrs_io_refill_bits_addr),
    .io_refill_bits_wmask(mshrs_io_refill_bits_wmask),
    .io_refill_bits_data(mshrs_io_refill_bits_data),
    .io_meta_write_ready(mshrs_io_meta_write_ready),
    .io_meta_write_valid(mshrs_io_meta_write_valid),
    .io_meta_write_bits_idx(mshrs_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en(mshrs_io_meta_write_bits_way_en),
    .io_meta_write_bits_tag(mshrs_io_meta_write_bits_tag),
    .io_meta_write_bits_data_coh_state(mshrs_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag(mshrs_io_meta_write_bits_data_tag),
    .io_meta_read_ready(mshrs_io_meta_read_ready),
    .io_meta_read_valid(mshrs_io_meta_read_valid),
    .io_meta_read_bits_idx(mshrs_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en(mshrs_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag(mshrs_io_meta_read_bits_tag),
    .io_meta_resp_valid(mshrs_io_meta_resp_valid),
    .io_meta_resp_bits_coh_state(mshrs_io_meta_resp_bits_coh_state),
    .io_meta_resp_bits_tag(mshrs_io_meta_resp_bits_tag),
    .io_replay_ready(mshrs_io_replay_ready),
    .io_replay_valid(mshrs_io_replay_valid),
    .io_replay_bits_uop_uopc(mshrs_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst(mshrs_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst(mshrs_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc(mshrs_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc(mshrs_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type(mshrs_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code(mshrs_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type(mshrs_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel(mshrs_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel(mshrs_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel(mshrs_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn(mshrs_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw(mshrs_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd(mshrs_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load(mshrs_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta(mshrs_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std(mshrs_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state(mshrs_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned(mshrs_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned(mshrs_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br(mshrs_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr(mshrs_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal(mshrs_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb(mshrs_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask(mshrs_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag(mshrs_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx(mshrs_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst(mshrs_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob(mshrs_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken(mshrs_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed(mshrs_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr(mshrs_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx(mshrs_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx(mshrs_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx(mshrs_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx(mshrs_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst(mshrs_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1(mshrs_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2(mshrs_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3(mshrs_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred(mshrs_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy(mshrs_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy(mshrs_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy(mshrs_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy(mshrs_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst(mshrs_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception(mshrs_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause(mshrs_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable(mshrs_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd(mshrs_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size(mshrs_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed(mshrs_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence(mshrs_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei(mshrs_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo(mshrs_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq(mshrs_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq(mshrs_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc(mshrs_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique(mshrs_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit(mshrs_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1(mshrs_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst(mshrs_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1(mshrs_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2(mshrs_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3(mshrs_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val(mshrs_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype(mshrs_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype(mshrs_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype(mshrs_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en(mshrs_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val(mshrs_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single(mshrs_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if(mshrs_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if(mshrs_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if(mshrs_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if(mshrs_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if(mshrs_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc(mshrs_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc(mshrs_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr(mshrs_io_replay_bits_addr),
    .io_replay_bits_data(mshrs_io_replay_bits_data),
    .io_replay_bits_is_hella(mshrs_io_replay_bits_is_hella),
    .io_replay_bits_tag_match(mshrs_io_replay_bits_tag_match),
    .io_replay_bits_old_meta_coh_state(mshrs_io_replay_bits_old_meta_coh_state),
    .io_replay_bits_old_meta_tag(mshrs_io_replay_bits_old_meta_tag),
    .io_replay_bits_way_en(mshrs_io_replay_bits_way_en),
    .io_replay_bits_sdq_id(mshrs_io_replay_bits_sdq_id),
    .io_prefetch_ready(mshrs_io_prefetch_ready),
    .io_prefetch_valid(mshrs_io_prefetch_valid),
    .io_prefetch_bits_uop_uopc(mshrs_io_prefetch_bits_uop_uopc),
    .io_prefetch_bits_uop_inst(mshrs_io_prefetch_bits_uop_inst),
    .io_prefetch_bits_uop_debug_inst(mshrs_io_prefetch_bits_uop_debug_inst),
    .io_prefetch_bits_uop_is_rvc(mshrs_io_prefetch_bits_uop_is_rvc),
    .io_prefetch_bits_uop_debug_pc(mshrs_io_prefetch_bits_uop_debug_pc),
    .io_prefetch_bits_uop_iq_type(mshrs_io_prefetch_bits_uop_iq_type),
    .io_prefetch_bits_uop_fu_code(mshrs_io_prefetch_bits_uop_fu_code),
    .io_prefetch_bits_uop_ctrl_br_type(mshrs_io_prefetch_bits_uop_ctrl_br_type),
    .io_prefetch_bits_uop_ctrl_op1_sel(mshrs_io_prefetch_bits_uop_ctrl_op1_sel),
    .io_prefetch_bits_uop_ctrl_op2_sel(mshrs_io_prefetch_bits_uop_ctrl_op2_sel),
    .io_prefetch_bits_uop_ctrl_imm_sel(mshrs_io_prefetch_bits_uop_ctrl_imm_sel),
    .io_prefetch_bits_uop_ctrl_op_fcn(mshrs_io_prefetch_bits_uop_ctrl_op_fcn),
    .io_prefetch_bits_uop_ctrl_fcn_dw(mshrs_io_prefetch_bits_uop_ctrl_fcn_dw),
    .io_prefetch_bits_uop_ctrl_csr_cmd(mshrs_io_prefetch_bits_uop_ctrl_csr_cmd),
    .io_prefetch_bits_uop_ctrl_is_load(mshrs_io_prefetch_bits_uop_ctrl_is_load),
    .io_prefetch_bits_uop_ctrl_is_sta(mshrs_io_prefetch_bits_uop_ctrl_is_sta),
    .io_prefetch_bits_uop_ctrl_is_std(mshrs_io_prefetch_bits_uop_ctrl_is_std),
    .io_prefetch_bits_uop_iw_state(mshrs_io_prefetch_bits_uop_iw_state),
    .io_prefetch_bits_uop_iw_p1_poisoned(mshrs_io_prefetch_bits_uop_iw_p1_poisoned),
    .io_prefetch_bits_uop_iw_p2_poisoned(mshrs_io_prefetch_bits_uop_iw_p2_poisoned),
    .io_prefetch_bits_uop_is_br(mshrs_io_prefetch_bits_uop_is_br),
    .io_prefetch_bits_uop_is_jalr(mshrs_io_prefetch_bits_uop_is_jalr),
    .io_prefetch_bits_uop_is_jal(mshrs_io_prefetch_bits_uop_is_jal),
    .io_prefetch_bits_uop_is_sfb(mshrs_io_prefetch_bits_uop_is_sfb),
    .io_prefetch_bits_uop_br_mask(mshrs_io_prefetch_bits_uop_br_mask),
    .io_prefetch_bits_uop_br_tag(mshrs_io_prefetch_bits_uop_br_tag),
    .io_prefetch_bits_uop_ftq_idx(mshrs_io_prefetch_bits_uop_ftq_idx),
    .io_prefetch_bits_uop_edge_inst(mshrs_io_prefetch_bits_uop_edge_inst),
    .io_prefetch_bits_uop_pc_lob(mshrs_io_prefetch_bits_uop_pc_lob),
    .io_prefetch_bits_uop_taken(mshrs_io_prefetch_bits_uop_taken),
    .io_prefetch_bits_uop_imm_packed(mshrs_io_prefetch_bits_uop_imm_packed),
    .io_prefetch_bits_uop_csr_addr(mshrs_io_prefetch_bits_uop_csr_addr),
    .io_prefetch_bits_uop_rob_idx(mshrs_io_prefetch_bits_uop_rob_idx),
    .io_prefetch_bits_uop_ldq_idx(mshrs_io_prefetch_bits_uop_ldq_idx),
    .io_prefetch_bits_uop_stq_idx(mshrs_io_prefetch_bits_uop_stq_idx),
    .io_prefetch_bits_uop_rxq_idx(mshrs_io_prefetch_bits_uop_rxq_idx),
    .io_prefetch_bits_uop_pdst(mshrs_io_prefetch_bits_uop_pdst),
    .io_prefetch_bits_uop_prs1(mshrs_io_prefetch_bits_uop_prs1),
    .io_prefetch_bits_uop_prs2(mshrs_io_prefetch_bits_uop_prs2),
    .io_prefetch_bits_uop_prs3(mshrs_io_prefetch_bits_uop_prs3),
    .io_prefetch_bits_uop_ppred(mshrs_io_prefetch_bits_uop_ppred),
    .io_prefetch_bits_uop_prs1_busy(mshrs_io_prefetch_bits_uop_prs1_busy),
    .io_prefetch_bits_uop_prs2_busy(mshrs_io_prefetch_bits_uop_prs2_busy),
    .io_prefetch_bits_uop_prs3_busy(mshrs_io_prefetch_bits_uop_prs3_busy),
    .io_prefetch_bits_uop_ppred_busy(mshrs_io_prefetch_bits_uop_ppred_busy),
    .io_prefetch_bits_uop_stale_pdst(mshrs_io_prefetch_bits_uop_stale_pdst),
    .io_prefetch_bits_uop_exception(mshrs_io_prefetch_bits_uop_exception),
    .io_prefetch_bits_uop_exc_cause(mshrs_io_prefetch_bits_uop_exc_cause),
    .io_prefetch_bits_uop_bypassable(mshrs_io_prefetch_bits_uop_bypassable),
    .io_prefetch_bits_uop_mem_cmd(mshrs_io_prefetch_bits_uop_mem_cmd),
    .io_prefetch_bits_uop_mem_size(mshrs_io_prefetch_bits_uop_mem_size),
    .io_prefetch_bits_uop_mem_signed(mshrs_io_prefetch_bits_uop_mem_signed),
    .io_prefetch_bits_uop_is_fence(mshrs_io_prefetch_bits_uop_is_fence),
    .io_prefetch_bits_uop_is_fencei(mshrs_io_prefetch_bits_uop_is_fencei),
    .io_prefetch_bits_uop_is_amo(mshrs_io_prefetch_bits_uop_is_amo),
    .io_prefetch_bits_uop_uses_ldq(mshrs_io_prefetch_bits_uop_uses_ldq),
    .io_prefetch_bits_uop_uses_stq(mshrs_io_prefetch_bits_uop_uses_stq),
    .io_prefetch_bits_uop_is_sys_pc2epc(mshrs_io_prefetch_bits_uop_is_sys_pc2epc),
    .io_prefetch_bits_uop_is_unique(mshrs_io_prefetch_bits_uop_is_unique),
    .io_prefetch_bits_uop_flush_on_commit(mshrs_io_prefetch_bits_uop_flush_on_commit),
    .io_prefetch_bits_uop_ldst_is_rs1(mshrs_io_prefetch_bits_uop_ldst_is_rs1),
    .io_prefetch_bits_uop_ldst(mshrs_io_prefetch_bits_uop_ldst),
    .io_prefetch_bits_uop_lrs1(mshrs_io_prefetch_bits_uop_lrs1),
    .io_prefetch_bits_uop_lrs2(mshrs_io_prefetch_bits_uop_lrs2),
    .io_prefetch_bits_uop_lrs3(mshrs_io_prefetch_bits_uop_lrs3),
    .io_prefetch_bits_uop_ldst_val(mshrs_io_prefetch_bits_uop_ldst_val),
    .io_prefetch_bits_uop_dst_rtype(mshrs_io_prefetch_bits_uop_dst_rtype),
    .io_prefetch_bits_uop_lrs1_rtype(mshrs_io_prefetch_bits_uop_lrs1_rtype),
    .io_prefetch_bits_uop_lrs2_rtype(mshrs_io_prefetch_bits_uop_lrs2_rtype),
    .io_prefetch_bits_uop_frs3_en(mshrs_io_prefetch_bits_uop_frs3_en),
    .io_prefetch_bits_uop_fp_val(mshrs_io_prefetch_bits_uop_fp_val),
    .io_prefetch_bits_uop_fp_single(mshrs_io_prefetch_bits_uop_fp_single),
    .io_prefetch_bits_uop_xcpt_pf_if(mshrs_io_prefetch_bits_uop_xcpt_pf_if),
    .io_prefetch_bits_uop_xcpt_ae_if(mshrs_io_prefetch_bits_uop_xcpt_ae_if),
    .io_prefetch_bits_uop_xcpt_ma_if(mshrs_io_prefetch_bits_uop_xcpt_ma_if),
    .io_prefetch_bits_uop_bp_debug_if(mshrs_io_prefetch_bits_uop_bp_debug_if),
    .io_prefetch_bits_uop_bp_xcpt_if(mshrs_io_prefetch_bits_uop_bp_xcpt_if),
    .io_prefetch_bits_uop_debug_fsrc(mshrs_io_prefetch_bits_uop_debug_fsrc),
    .io_prefetch_bits_uop_debug_tsrc(mshrs_io_prefetch_bits_uop_debug_tsrc),
    .io_prefetch_bits_addr(mshrs_io_prefetch_bits_addr),
    .io_prefetch_bits_data(mshrs_io_prefetch_bits_data),
    .io_prefetch_bits_is_hella(mshrs_io_prefetch_bits_is_hella),
    .io_wb_req_ready(mshrs_io_wb_req_ready),
    .io_wb_req_valid(mshrs_io_wb_req_valid),
    .io_wb_req_bits_tag(mshrs_io_wb_req_bits_tag),
    .io_wb_req_bits_idx(mshrs_io_wb_req_bits_idx),
    .io_wb_req_bits_source(mshrs_io_wb_req_bits_source),
    .io_wb_req_bits_param(mshrs_io_wb_req_bits_param),
    .io_wb_req_bits_way_en(mshrs_io_wb_req_bits_way_en),
    .io_wb_req_bits_voluntary(mshrs_io_wb_req_bits_voluntary),
    .io_prober_state_valid(mshrs_io_prober_state_valid),
    .io_prober_state_bits(mshrs_io_prober_state_bits),
    .io_clear_all(mshrs_io_clear_all),
    .io_wb_resp(mshrs_io_wb_resp),
    .io_fence_rdy(mshrs_io_fence_rdy),
    .io_probe_rdy(mshrs_io_probe_rdy)
  );
  L1MetadataArray meta_0 ( // @[dcache.scala 441:41]
    .clock(meta_0_clock),
    .reset(meta_0_reset),
    .io_read_ready(meta_0_io_read_ready),
    .io_read_valid(meta_0_io_read_valid),
    .io_read_bits_idx(meta_0_io_read_bits_idx),
    .io_read_bits_way_en(meta_0_io_read_bits_way_en),
    .io_read_bits_tag(meta_0_io_read_bits_tag),
    .io_write_ready(meta_0_io_write_ready),
    .io_write_valid(meta_0_io_write_valid),
    .io_write_bits_idx(meta_0_io_write_bits_idx),
    .io_write_bits_way_en(meta_0_io_write_bits_way_en),
    .io_write_bits_tag(meta_0_io_write_bits_tag),
    .io_write_bits_data_coh_state(meta_0_io_write_bits_data_coh_state),
    .io_write_bits_data_tag(meta_0_io_write_bits_data_tag),
    .io_resp_0_coh_state(meta_0_io_resp_0_coh_state),
    .io_resp_0_tag(meta_0_io_resp_0_tag),
    .io_resp_1_coh_state(meta_0_io_resp_1_coh_state),
    .io_resp_1_tag(meta_0_io_resp_1_tag),
    .io_resp_2_coh_state(meta_0_io_resp_2_coh_state),
    .io_resp_2_tag(meta_0_io_resp_2_tag),
    .io_resp_3_coh_state(meta_0_io_resp_3_coh_state),
    .io_resp_3_tag(meta_0_io_resp_3_tag)
  );
  Arbiter_2 metaWriteArb ( // @[dcache.scala 442:28]
    .clock(metaWriteArb_clock),
    .reset(metaWriteArb_reset),
    .io_in_0_ready(metaWriteArb_io_in_0_ready),
    .io_in_0_valid(metaWriteArb_io_in_0_valid),
    .io_in_0_bits_idx(metaWriteArb_io_in_0_bits_idx),
    .io_in_0_bits_way_en(metaWriteArb_io_in_0_bits_way_en),
    .io_in_0_bits_tag(metaWriteArb_io_in_0_bits_tag),
    .io_in_0_bits_data_coh_state(metaWriteArb_io_in_0_bits_data_coh_state),
    .io_in_0_bits_data_tag(metaWriteArb_io_in_0_bits_data_tag),
    .io_in_1_ready(metaWriteArb_io_in_1_ready),
    .io_in_1_valid(metaWriteArb_io_in_1_valid),
    .io_in_1_bits_idx(metaWriteArb_io_in_1_bits_idx),
    .io_in_1_bits_way_en(metaWriteArb_io_in_1_bits_way_en),
    .io_in_1_bits_tag(metaWriteArb_io_in_1_bits_tag),
    .io_in_1_bits_data_coh_state(metaWriteArb_io_in_1_bits_data_coh_state),
    .io_in_1_bits_data_tag(metaWriteArb_io_in_1_bits_data_tag),
    .io_out_ready(metaWriteArb_io_out_ready),
    .io_out_valid(metaWriteArb_io_out_valid),
    .io_out_bits_idx(metaWriteArb_io_out_bits_idx),
    .io_out_bits_way_en(metaWriteArb_io_out_bits_way_en),
    .io_out_bits_tag(metaWriteArb_io_out_bits_tag),
    .io_out_bits_data_coh_state(metaWriteArb_io_out_bits_data_coh_state),
    .io_out_bits_data_tag(metaWriteArb_io_out_bits_data_tag),
    .io_chosen(metaWriteArb_io_chosen)
  );
  Arbiter_10 metaReadArb ( // @[dcache.scala 444:27]
    .clock(metaReadArb_clock),
    .reset(metaReadArb_reset),
    .io_in_0_ready(metaReadArb_io_in_0_ready),
    .io_in_0_valid(metaReadArb_io_in_0_valid),
    .io_in_0_bits_req_0_idx(metaReadArb_io_in_0_bits_req_0_idx),
    .io_in_0_bits_req_0_way_en(metaReadArb_io_in_0_bits_req_0_way_en),
    .io_in_0_bits_req_0_tag(metaReadArb_io_in_0_bits_req_0_tag),
    .io_in_1_ready(metaReadArb_io_in_1_ready),
    .io_in_1_valid(metaReadArb_io_in_1_valid),
    .io_in_1_bits_req_0_idx(metaReadArb_io_in_1_bits_req_0_idx),
    .io_in_1_bits_req_0_way_en(metaReadArb_io_in_1_bits_req_0_way_en),
    .io_in_1_bits_req_0_tag(metaReadArb_io_in_1_bits_req_0_tag),
    .io_in_2_ready(metaReadArb_io_in_2_ready),
    .io_in_2_valid(metaReadArb_io_in_2_valid),
    .io_in_2_bits_req_0_idx(metaReadArb_io_in_2_bits_req_0_idx),
    .io_in_2_bits_req_0_way_en(metaReadArb_io_in_2_bits_req_0_way_en),
    .io_in_2_bits_req_0_tag(metaReadArb_io_in_2_bits_req_0_tag),
    .io_in_3_ready(metaReadArb_io_in_3_ready),
    .io_in_3_valid(metaReadArb_io_in_3_valid),
    .io_in_3_bits_req_0_idx(metaReadArb_io_in_3_bits_req_0_idx),
    .io_in_3_bits_req_0_way_en(metaReadArb_io_in_3_bits_req_0_way_en),
    .io_in_3_bits_req_0_tag(metaReadArb_io_in_3_bits_req_0_tag),
    .io_in_4_ready(metaReadArb_io_in_4_ready),
    .io_in_4_valid(metaReadArb_io_in_4_valid),
    .io_in_4_bits_req_0_idx(metaReadArb_io_in_4_bits_req_0_idx),
    .io_in_4_bits_req_0_way_en(metaReadArb_io_in_4_bits_req_0_way_en),
    .io_in_4_bits_req_0_tag(metaReadArb_io_in_4_bits_req_0_tag),
    .io_in_5_ready(metaReadArb_io_in_5_ready),
    .io_in_5_valid(metaReadArb_io_in_5_valid),
    .io_in_5_bits_req_0_idx(metaReadArb_io_in_5_bits_req_0_idx),
    .io_in_5_bits_req_0_way_en(metaReadArb_io_in_5_bits_req_0_way_en),
    .io_in_5_bits_req_0_tag(metaReadArb_io_in_5_bits_req_0_tag),
    .io_out_ready(metaReadArb_io_out_ready),
    .io_out_valid(metaReadArb_io_out_valid),
    .io_out_bits_req_0_idx(metaReadArb_io_out_bits_req_0_idx),
    .io_out_bits_req_0_way_en(metaReadArb_io_out_bits_req_0_way_en),
    .io_out_bits_req_0_tag(metaReadArb_io_out_bits_req_0_tag),
    .io_chosen(metaReadArb_io_chosen)
  );
  BoomDuplicatedDataArray data ( // @[dcache.scala 459:20]
    .clock(data_clock),
    .reset(data_reset),
    .io_read_0_valid(data_io_read_0_valid),
    .io_read_0_bits_way_en(data_io_read_0_bits_way_en),
    .io_read_0_bits_addr(data_io_read_0_bits_addr),
    .io_write_valid(data_io_write_valid),
    .io_write_bits_way_en(data_io_write_bits_way_en),
    .io_write_bits_addr(data_io_write_bits_addr),
    .io_write_bits_wmask(data_io_write_bits_wmask),
    .io_write_bits_data(data_io_write_bits_data),
    .io_resp_0_0(data_io_resp_0_0),
    .io_resp_0_1(data_io_resp_0_1),
    .io_resp_0_2(data_io_resp_0_2),
    .io_resp_0_3(data_io_resp_0_3),
    .io_nacks_0(data_io_nacks_0)
  );
  Arbiter_7 dataWriteArb ( // @[dcache.scala 460:28]
    .clock(dataWriteArb_clock),
    .reset(dataWriteArb_reset),
    .io_in_0_ready(dataWriteArb_io_in_0_ready),
    .io_in_0_valid(dataWriteArb_io_in_0_valid),
    .io_in_0_bits_way_en(dataWriteArb_io_in_0_bits_way_en),
    .io_in_0_bits_addr(dataWriteArb_io_in_0_bits_addr),
    .io_in_0_bits_wmask(dataWriteArb_io_in_0_bits_wmask),
    .io_in_0_bits_data(dataWriteArb_io_in_0_bits_data),
    .io_in_1_ready(dataWriteArb_io_in_1_ready),
    .io_in_1_valid(dataWriteArb_io_in_1_valid),
    .io_in_1_bits_way_en(dataWriteArb_io_in_1_bits_way_en),
    .io_in_1_bits_addr(dataWriteArb_io_in_1_bits_addr),
    .io_in_1_bits_wmask(dataWriteArb_io_in_1_bits_wmask),
    .io_in_1_bits_data(dataWriteArb_io_in_1_bits_data),
    .io_out_ready(dataWriteArb_io_out_ready),
    .io_out_valid(dataWriteArb_io_out_valid),
    .io_out_bits_way_en(dataWriteArb_io_out_bits_way_en),
    .io_out_bits_addr(dataWriteArb_io_out_bits_addr),
    .io_out_bits_wmask(dataWriteArb_io_out_bits_wmask),
    .io_out_bits_data(dataWriteArb_io_out_bits_data),
    .io_chosen(dataWriteArb_io_chosen)
  );
  Arbiter_12 dataReadArb ( // @[dcache.scala 462:27]
    .clock(dataReadArb_clock),
    .reset(dataReadArb_reset),
    .io_in_0_ready(dataReadArb_io_in_0_ready),
    .io_in_0_valid(dataReadArb_io_in_0_valid),
    .io_in_0_bits_req_0_way_en(dataReadArb_io_in_0_bits_req_0_way_en),
    .io_in_0_bits_req_0_addr(dataReadArb_io_in_0_bits_req_0_addr),
    .io_in_0_bits_valid_0(dataReadArb_io_in_0_bits_valid_0),
    .io_in_1_ready(dataReadArb_io_in_1_ready),
    .io_in_1_valid(dataReadArb_io_in_1_valid),
    .io_in_1_bits_req_0_way_en(dataReadArb_io_in_1_bits_req_0_way_en),
    .io_in_1_bits_req_0_addr(dataReadArb_io_in_1_bits_req_0_addr),
    .io_in_1_bits_valid_0(dataReadArb_io_in_1_bits_valid_0),
    .io_in_2_ready(dataReadArb_io_in_2_ready),
    .io_in_2_valid(dataReadArb_io_in_2_valid),
    .io_in_2_bits_req_0_way_en(dataReadArb_io_in_2_bits_req_0_way_en),
    .io_in_2_bits_req_0_addr(dataReadArb_io_in_2_bits_req_0_addr),
    .io_in_2_bits_valid_0(dataReadArb_io_in_2_bits_valid_0),
    .io_out_ready(dataReadArb_io_out_ready),
    .io_out_valid(dataReadArb_io_out_valid),
    .io_out_bits_req_0_way_en(dataReadArb_io_out_bits_req_0_way_en),
    .io_out_bits_req_0_addr(dataReadArb_io_out_bits_req_0_addr),
    .io_out_bits_valid_0(dataReadArb_io_out_bits_valid_0),
    .io_chosen(dataReadArb_io_chosen)
  );
  MaxPeriodFibonacciLFSR lfsr_prng ( // @[PRNG.scala 82:22]
    .clock(lfsr_prng_clock),
    .reset(lfsr_prng_reset),
    .io_seed_valid(lfsr_prng_io_seed_valid),
    .io_seed_bits_0(lfsr_prng_io_seed_bits_0),
    .io_seed_bits_1(lfsr_prng_io_seed_bits_1),
    .io_seed_bits_2(lfsr_prng_io_seed_bits_2),
    .io_seed_bits_3(lfsr_prng_io_seed_bits_3),
    .io_seed_bits_4(lfsr_prng_io_seed_bits_4),
    .io_seed_bits_5(lfsr_prng_io_seed_bits_5),
    .io_seed_bits_6(lfsr_prng_io_seed_bits_6),
    .io_seed_bits_7(lfsr_prng_io_seed_bits_7),
    .io_seed_bits_8(lfsr_prng_io_seed_bits_8),
    .io_seed_bits_9(lfsr_prng_io_seed_bits_9),
    .io_seed_bits_10(lfsr_prng_io_seed_bits_10),
    .io_seed_bits_11(lfsr_prng_io_seed_bits_11),
    .io_seed_bits_12(lfsr_prng_io_seed_bits_12),
    .io_seed_bits_13(lfsr_prng_io_seed_bits_13),
    .io_seed_bits_14(lfsr_prng_io_seed_bits_14),
    .io_seed_bits_15(lfsr_prng_io_seed_bits_15),
    .io_increment(lfsr_prng_io_increment),
    .io_out_0(lfsr_prng_io_out_0),
    .io_out_1(lfsr_prng_io_out_1),
    .io_out_2(lfsr_prng_io_out_2),
    .io_out_3(lfsr_prng_io_out_3),
    .io_out_4(lfsr_prng_io_out_4),
    .io_out_5(lfsr_prng_io_out_5),
    .io_out_6(lfsr_prng_io_out_6),
    .io_out_7(lfsr_prng_io_out_7),
    .io_out_8(lfsr_prng_io_out_8),
    .io_out_9(lfsr_prng_io_out_9),
    .io_out_10(lfsr_prng_io_out_10),
    .io_out_11(lfsr_prng_io_out_11),
    .io_out_12(lfsr_prng_io_out_12),
    .io_out_13(lfsr_prng_io_out_13),
    .io_out_14(lfsr_prng_io_out_14),
    .io_out_15(lfsr_prng_io_out_15)
  );
  Arbiter_4 wbArb ( // @[dcache.scala 804:21]
    .clock(wbArb_clock),
    .reset(wbArb_reset),
    .io_in_0_ready(wbArb_io_in_0_ready),
    .io_in_0_valid(wbArb_io_in_0_valid),
    .io_in_0_bits_tag(wbArb_io_in_0_bits_tag),
    .io_in_0_bits_idx(wbArb_io_in_0_bits_idx),
    .io_in_0_bits_source(wbArb_io_in_0_bits_source),
    .io_in_0_bits_param(wbArb_io_in_0_bits_param),
    .io_in_0_bits_way_en(wbArb_io_in_0_bits_way_en),
    .io_in_0_bits_voluntary(wbArb_io_in_0_bits_voluntary),
    .io_in_1_ready(wbArb_io_in_1_ready),
    .io_in_1_valid(wbArb_io_in_1_valid),
    .io_in_1_bits_tag(wbArb_io_in_1_bits_tag),
    .io_in_1_bits_idx(wbArb_io_in_1_bits_idx),
    .io_in_1_bits_source(wbArb_io_in_1_bits_source),
    .io_in_1_bits_param(wbArb_io_in_1_bits_param),
    .io_in_1_bits_way_en(wbArb_io_in_1_bits_way_en),
    .io_in_1_bits_voluntary(wbArb_io_in_1_bits_voluntary),
    .io_out_ready(wbArb_io_out_ready),
    .io_out_valid(wbArb_io_out_valid),
    .io_out_bits_tag(wbArb_io_out_bits_tag),
    .io_out_bits_idx(wbArb_io_out_bits_idx),
    .io_out_bits_source(wbArb_io_out_bits_source),
    .io_out_bits_param(wbArb_io_out_bits_param),
    .io_out_bits_way_en(wbArb_io_out_bits_way_en),
    .io_out_bits_voluntary(wbArb_io_out_bits_voluntary),
    .io_chosen(wbArb_io_chosen)
  );
  Arbiter_14 lsu_release_arb ( // @[dcache.scala 813:31]
    .clock(lsu_release_arb_clock),
    .reset(lsu_release_arb_reset),
    .io_in_0_ready(lsu_release_arb_io_in_0_ready),
    .io_in_0_valid(lsu_release_arb_io_in_0_valid),
    .io_in_0_bits_opcode(lsu_release_arb_io_in_0_bits_opcode),
    .io_in_0_bits_param(lsu_release_arb_io_in_0_bits_param),
    .io_in_0_bits_size(lsu_release_arb_io_in_0_bits_size),
    .io_in_0_bits_source(lsu_release_arb_io_in_0_bits_source),
    .io_in_0_bits_address(lsu_release_arb_io_in_0_bits_address),
    .io_in_0_bits_data(lsu_release_arb_io_in_0_bits_data),
    .io_in_0_bits_corrupt(lsu_release_arb_io_in_0_bits_corrupt),
    .io_in_1_ready(lsu_release_arb_io_in_1_ready),
    .io_in_1_valid(lsu_release_arb_io_in_1_valid),
    .io_in_1_bits_opcode(lsu_release_arb_io_in_1_bits_opcode),
    .io_in_1_bits_param(lsu_release_arb_io_in_1_bits_param),
    .io_in_1_bits_size(lsu_release_arb_io_in_1_bits_size),
    .io_in_1_bits_source(lsu_release_arb_io_in_1_bits_source),
    .io_in_1_bits_address(lsu_release_arb_io_in_1_bits_address),
    .io_in_1_bits_data(lsu_release_arb_io_in_1_bits_data),
    .io_in_1_bits_corrupt(lsu_release_arb_io_in_1_bits_corrupt),
    .io_out_ready(lsu_release_arb_io_out_ready),
    .io_out_valid(lsu_release_arb_io_out_valid),
    .io_out_bits_opcode(lsu_release_arb_io_out_bits_opcode),
    .io_out_bits_param(lsu_release_arb_io_out_bits_param),
    .io_out_bits_size(lsu_release_arb_io_out_bits_size),
    .io_out_bits_source(lsu_release_arb_io_out_bits_source),
    .io_out_bits_address(lsu_release_arb_io_out_bits_address),
    .io_out_bits_data(lsu_release_arb_io_out_bits_data),
    .io_out_bits_corrupt(lsu_release_arb_io_out_bits_corrupt),
    .io_chosen(lsu_release_arb_io_chosen)
  );
  AMOALU amoalu ( // @[dcache.scala 895:24]
    .clock(amoalu_clock),
    .reset(amoalu_reset),
    .io_mask(amoalu_io_mask),
    .io_cmd(amoalu_io_cmd),
    .io_lhs(amoalu_io_lhs),
    .io_rhs(amoalu_io_rhs),
    .io_out(amoalu_io_out),
    .io_out_unmasked(amoalu_io_out_unmasked)
  );
  assign auto_out_a_valid = mshrs_io_mem_acquire_valid; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  assign auto_out_a_bits_opcode = mshrs_io_mem_acquire_bits_opcode; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  assign auto_out_a_bits_param = mshrs_io_mem_acquire_bits_param; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  assign auto_out_a_bits_size = mshrs_io_mem_acquire_bits_size; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  assign auto_out_a_bits_source = mshrs_io_mem_acquire_bits_source; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  assign auto_out_a_bits_address = mshrs_io_mem_acquire_bits_address; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  assign auto_out_a_bits_mask = mshrs_io_mem_acquire_bits_mask; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  assign auto_out_a_bits_data = mshrs_io_mem_acquire_bits_data; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  assign auto_out_a_bits_corrupt = mshrs_io_mem_acquire_bits_corrupt; // @[Nodes.scala 1207:84 dcache.scala 774:12]
  assign auto_out_b_ready = prober_io_req_ready & _T_536; // @[dcache.scala 778:48]
  assign auto_out_c_valid = idle ? _T_557 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  assign auto_out_c_bits_opcode = _T_589 | _T_590; // @[Mux.scala 27:72]
  assign auto_out_c_bits_param = _T_586 | _T_587; // @[Mux.scala 27:72]
  assign auto_out_c_bits_size = _T_583 | _T_584; // @[Mux.scala 27:72]
  assign auto_out_c_bits_source = _T_580 | _T_581; // @[Mux.scala 27:72]
  assign auto_out_c_bits_address = _T_577 | _T_578; // @[Mux.scala 27:72]
  assign auto_out_c_bits_data = _T_574 | _T_575; // @[Mux.scala 27:72]
  assign auto_out_c_bits_corrupt = muxStateEarly_0 & out_bits_corrupt | muxStateEarly_1 & out_1_bits_corrupt; // @[Mux.scala 27:72]
  assign auto_out_d_ready = auto_out_d_bits_source == 2'h2 | mshrs_io_mem_grant_ready; // @[dcache.scala 788:48 dcache.scala 790:20 dcache.scala 795:24]
  assign auto_out_e_valid = mshrs_io_mem_finish_valid; // @[Nodes.scala 1207:84 dcache.scala 801:12]
  assign auto_out_e_bits_sink = mshrs_io_mem_finish_bits_sink; // @[Nodes.scala 1207:84 dcache.scala 801:12]
  assign io_errors_bus_valid = 1'h0;
  assign io_errors_bus_bits = 32'h0;
  assign io_lsu_req_ready = metaReadArb_io_in_4_ready & dataReadArb_io_in_2_ready; // @[dcache.scala 479:50]
  assign io_lsu_resp_0_valid = _T_629 & _T_632; // @[dcache.scala 857:78]
  assign io_lsu_resp_0_bits_uop_uopc = _T_623 ? uncache_resp_bits_uop_uopc : s2_req_0_uop_uopc; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_inst = _T_623 ? uncache_resp_bits_uop_inst : s2_req_0_uop_inst; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_debug_inst = _T_623 ? uncache_resp_bits_uop_debug_inst : s2_req_0_uop_debug_inst; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_is_rvc = _T_623 ? uncache_resp_bits_uop_is_rvc : s2_req_0_uop_is_rvc; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_debug_pc = _T_623 ? uncache_resp_bits_uop_debug_pc : s2_req_0_uop_debug_pc; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_iq_type = _T_623 ? uncache_resp_bits_uop_iq_type : s2_req_0_uop_iq_type; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_fu_code = _T_623 ? uncache_resp_bits_uop_fu_code : s2_req_0_uop_fu_code; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ctrl_br_type = _T_623 ? uncache_resp_bits_uop_ctrl_br_type : s2_req_0_uop_ctrl_br_type; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ctrl_op1_sel = _T_623 ? uncache_resp_bits_uop_ctrl_op1_sel : s2_req_0_uop_ctrl_op1_sel; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ctrl_op2_sel = _T_623 ? uncache_resp_bits_uop_ctrl_op2_sel : s2_req_0_uop_ctrl_op2_sel; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ctrl_imm_sel = _T_623 ? uncache_resp_bits_uop_ctrl_imm_sel : s2_req_0_uop_ctrl_imm_sel; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ctrl_op_fcn = _T_623 ? uncache_resp_bits_uop_ctrl_op_fcn : s2_req_0_uop_ctrl_op_fcn; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ctrl_fcn_dw = _T_623 ? uncache_resp_bits_uop_ctrl_fcn_dw : s2_req_0_uop_ctrl_fcn_dw; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ctrl_csr_cmd = _T_623 ? uncache_resp_bits_uop_ctrl_csr_cmd : s2_req_0_uop_ctrl_csr_cmd; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ctrl_is_load = _T_623 ? uncache_resp_bits_uop_ctrl_is_load : s2_req_0_uop_ctrl_is_load; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ctrl_is_sta = _T_623 ? uncache_resp_bits_uop_ctrl_is_sta : s2_req_0_uop_ctrl_is_sta; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ctrl_is_std = _T_623 ? uncache_resp_bits_uop_ctrl_is_std : s2_req_0_uop_ctrl_is_std; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_iw_state = _T_623 ? uncache_resp_bits_uop_iw_state : s2_req_0_uop_iw_state; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_iw_p1_poisoned = _T_623 ? uncache_resp_bits_uop_iw_p1_poisoned :
    s2_req_0_uop_iw_p1_poisoned; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_iw_p2_poisoned = _T_623 ? uncache_resp_bits_uop_iw_p2_poisoned :
    s2_req_0_uop_iw_p2_poisoned; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_is_br = _T_623 ? uncache_resp_bits_uop_is_br : s2_req_0_uop_is_br; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_is_jalr = _T_623 ? uncache_resp_bits_uop_is_jalr : s2_req_0_uop_is_jalr; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_is_jal = _T_623 ? uncache_resp_bits_uop_is_jal : s2_req_0_uop_is_jal; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_is_sfb = _T_623 ? uncache_resp_bits_uop_is_sfb : s2_req_0_uop_is_sfb; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_br_mask = resp_0_bits_uop_br_mask & _T_73; // @[util.scala 89:21]
  assign io_lsu_resp_0_bits_uop_br_tag = _T_623 ? uncache_resp_bits_uop_br_tag : s2_req_0_uop_br_tag; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ftq_idx = _T_623 ? uncache_resp_bits_uop_ftq_idx : s2_req_0_uop_ftq_idx; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_edge_inst = _T_623 ? uncache_resp_bits_uop_edge_inst : s2_req_0_uop_edge_inst; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_pc_lob = _T_623 ? uncache_resp_bits_uop_pc_lob : s2_req_0_uop_pc_lob; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_taken = _T_623 ? uncache_resp_bits_uop_taken : s2_req_0_uop_taken; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_imm_packed = _T_623 ? uncache_resp_bits_uop_imm_packed : s2_req_0_uop_imm_packed; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_csr_addr = _T_623 ? uncache_resp_bits_uop_csr_addr : s2_req_0_uop_csr_addr; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_rob_idx = _T_623 ? uncache_resp_bits_uop_rob_idx : s2_req_0_uop_rob_idx; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ldq_idx = _T_623 ? uncache_resp_bits_uop_ldq_idx : s2_req_0_uop_ldq_idx; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_stq_idx = _T_623 ? uncache_resp_bits_uop_stq_idx : s2_req_0_uop_stq_idx; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_rxq_idx = _T_623 ? uncache_resp_bits_uop_rxq_idx : s2_req_0_uop_rxq_idx; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_pdst = _T_623 ? uncache_resp_bits_uop_pdst : s2_req_0_uop_pdst; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_prs1 = _T_623 ? uncache_resp_bits_uop_prs1 : s2_req_0_uop_prs1; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_prs2 = _T_623 ? uncache_resp_bits_uop_prs2 : s2_req_0_uop_prs2; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_prs3 = _T_623 ? uncache_resp_bits_uop_prs3 : s2_req_0_uop_prs3; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ppred = _T_623 ? uncache_resp_bits_uop_ppred : s2_req_0_uop_ppred; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_prs1_busy = _T_623 ? uncache_resp_bits_uop_prs1_busy : s2_req_0_uop_prs1_busy; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_prs2_busy = _T_623 ? uncache_resp_bits_uop_prs2_busy : s2_req_0_uop_prs2_busy; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_prs3_busy = _T_623 ? uncache_resp_bits_uop_prs3_busy : s2_req_0_uop_prs3_busy; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ppred_busy = _T_623 ? uncache_resp_bits_uop_ppred_busy : s2_req_0_uop_ppred_busy; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_stale_pdst = _T_623 ? uncache_resp_bits_uop_stale_pdst : s2_req_0_uop_stale_pdst; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_exception = _T_623 ? uncache_resp_bits_uop_exception : s2_req_0_uop_exception; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_exc_cause = _T_623 ? uncache_resp_bits_uop_exc_cause : s2_req_0_uop_exc_cause; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_bypassable = _T_623 ? uncache_resp_bits_uop_bypassable : s2_req_0_uop_bypassable; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_mem_cmd = _T_623 ? uncache_resp_bits_uop_mem_cmd : s2_req_0_uop_mem_cmd; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_mem_size = _T_623 ? uncache_resp_bits_uop_mem_size : s2_req_0_uop_mem_size; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_mem_signed = _T_623 ? uncache_resp_bits_uop_mem_signed : s2_req_0_uop_mem_signed; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_is_fence = _T_623 ? uncache_resp_bits_uop_is_fence : s2_req_0_uop_is_fence; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_is_fencei = _T_623 ? uncache_resp_bits_uop_is_fencei : s2_req_0_uop_is_fencei; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_is_amo = _T_623 ? uncache_resp_bits_uop_is_amo : s2_req_0_uop_is_amo; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_uses_ldq = _T_623 ? uncache_resp_bits_uop_uses_ldq : s2_req_0_uop_uses_ldq; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_uses_stq = _T_623 ? uncache_resp_bits_uop_uses_stq : s2_req_0_uop_uses_stq; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_is_sys_pc2epc = _T_623 ? uncache_resp_bits_uop_is_sys_pc2epc :
    s2_req_0_uop_is_sys_pc2epc; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_is_unique = _T_623 ? uncache_resp_bits_uop_is_unique : s2_req_0_uop_is_unique; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_flush_on_commit = _T_623 ? uncache_resp_bits_uop_flush_on_commit :
    s2_req_0_uop_flush_on_commit; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ldst_is_rs1 = _T_623 ? uncache_resp_bits_uop_ldst_is_rs1 : s2_req_0_uop_ldst_is_rs1; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ldst = _T_623 ? uncache_resp_bits_uop_ldst : s2_req_0_uop_ldst; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_lrs1 = _T_623 ? uncache_resp_bits_uop_lrs1 : s2_req_0_uop_lrs1; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_lrs2 = _T_623 ? uncache_resp_bits_uop_lrs2 : s2_req_0_uop_lrs2; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_lrs3 = _T_623 ? uncache_resp_bits_uop_lrs3 : s2_req_0_uop_lrs3; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_ldst_val = _T_623 ? uncache_resp_bits_uop_ldst_val : s2_req_0_uop_ldst_val; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_dst_rtype = _T_623 ? uncache_resp_bits_uop_dst_rtype : s2_req_0_uop_dst_rtype; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_lrs1_rtype = _T_623 ? uncache_resp_bits_uop_lrs1_rtype : s2_req_0_uop_lrs1_rtype; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_lrs2_rtype = _T_623 ? uncache_resp_bits_uop_lrs2_rtype : s2_req_0_uop_lrs2_rtype; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_frs3_en = _T_623 ? uncache_resp_bits_uop_frs3_en : s2_req_0_uop_frs3_en; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_fp_val = _T_623 ? uncache_resp_bits_uop_fp_val : s2_req_0_uop_fp_val; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_fp_single = _T_623 ? uncache_resp_bits_uop_fp_single : s2_req_0_uop_fp_single; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_xcpt_pf_if = _T_623 ? uncache_resp_bits_uop_xcpt_pf_if : s2_req_0_uop_xcpt_pf_if; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_xcpt_ae_if = _T_623 ? uncache_resp_bits_uop_xcpt_ae_if : s2_req_0_uop_xcpt_ae_if; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_xcpt_ma_if = _T_623 ? uncache_resp_bits_uop_xcpt_ma_if : s2_req_0_uop_xcpt_ma_if; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_bp_debug_if = _T_623 ? uncache_resp_bits_uop_bp_debug_if : s2_req_0_uop_bp_debug_if; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_bp_xcpt_if = _T_623 ? uncache_resp_bits_uop_bp_xcpt_if : s2_req_0_uop_bp_xcpt_if; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_debug_fsrc = _T_623 ? uncache_resp_bits_uop_debug_fsrc : s2_req_0_uop_debug_fsrc; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_uop_debug_tsrc = _T_623 ? uncache_resp_bits_uop_debug_tsrc : s2_req_0_uop_debug_tsrc; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_data = _T_623 ? uncache_resp_bits_data : cache_resp_0_bits_data; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_resp_0_bits_is_hella = _T_623 ? uncache_resp_bits_is_hella : s2_req_0_is_hella; // @[dcache.scala 849:28 dcache.scala 850:15]
  assign io_lsu_nack_0_valid = _T_639 & _T_446; // @[dcache.scala 862:75]
  assign io_lsu_nack_0_bits_uop_uopc = s2_req_0_uop_uopc; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_inst = s2_req_0_uop_inst; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_debug_inst = s2_req_0_uop_debug_inst; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_is_rvc = s2_req_0_uop_is_rvc; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_debug_pc = s2_req_0_uop_debug_pc; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_iq_type = s2_req_0_uop_iq_type; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_fu_code = s2_req_0_uop_fu_code; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ctrl_br_type = s2_req_0_uop_ctrl_br_type; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ctrl_op1_sel = s2_req_0_uop_ctrl_op1_sel; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ctrl_op2_sel = s2_req_0_uop_ctrl_op2_sel; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ctrl_imm_sel = s2_req_0_uop_ctrl_imm_sel; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ctrl_op_fcn = s2_req_0_uop_ctrl_op_fcn; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ctrl_fcn_dw = s2_req_0_uop_ctrl_fcn_dw; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ctrl_csr_cmd = s2_req_0_uop_ctrl_csr_cmd; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ctrl_is_load = s2_req_0_uop_ctrl_is_load; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ctrl_is_sta = s2_req_0_uop_ctrl_is_sta; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ctrl_is_std = s2_req_0_uop_ctrl_is_std; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_iw_state = s2_req_0_uop_iw_state; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_iw_p1_poisoned = s2_req_0_uop_iw_p1_poisoned; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_iw_p2_poisoned = s2_req_0_uop_iw_p2_poisoned; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_is_br = s2_req_0_uop_is_br; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_is_jalr = s2_req_0_uop_is_jalr; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_is_jal = s2_req_0_uop_is_jal; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_is_sfb = s2_req_0_uop_is_sfb; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_br_mask = s2_req_0_uop_br_mask & _T_73; // @[util.scala 89:21]
  assign io_lsu_nack_0_bits_uop_br_tag = s2_req_0_uop_br_tag; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ftq_idx = s2_req_0_uop_ftq_idx; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_edge_inst = s2_req_0_uop_edge_inst; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_pc_lob = s2_req_0_uop_pc_lob; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_taken = s2_req_0_uop_taken; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_imm_packed = s2_req_0_uop_imm_packed; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_csr_addr = s2_req_0_uop_csr_addr; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_rob_idx = s2_req_0_uop_rob_idx; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ldq_idx = s2_req_0_uop_ldq_idx; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_stq_idx = s2_req_0_uop_stq_idx; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_rxq_idx = s2_req_0_uop_rxq_idx; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_pdst = s2_req_0_uop_pdst; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_prs1 = s2_req_0_uop_prs1; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_prs2 = s2_req_0_uop_prs2; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_prs3 = s2_req_0_uop_prs3; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ppred = s2_req_0_uop_ppred; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_prs1_busy = s2_req_0_uop_prs1_busy; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_prs2_busy = s2_req_0_uop_prs2_busy; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_prs3_busy = s2_req_0_uop_prs3_busy; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ppred_busy = s2_req_0_uop_ppred_busy; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_stale_pdst = s2_req_0_uop_stale_pdst; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_exception = s2_req_0_uop_exception; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_exc_cause = s2_req_0_uop_exc_cause; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_bypassable = s2_req_0_uop_bypassable; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_mem_cmd = s2_req_0_uop_mem_cmd; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_mem_size = s2_req_0_uop_mem_size; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_mem_signed = s2_req_0_uop_mem_signed; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_is_fence = s2_req_0_uop_is_fence; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_is_fencei = s2_req_0_uop_is_fencei; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_is_amo = s2_req_0_uop_is_amo; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_uses_ldq = s2_req_0_uop_uses_ldq; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_uses_stq = s2_req_0_uop_uses_stq; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_is_sys_pc2epc = s2_req_0_uop_is_sys_pc2epc; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_is_unique = s2_req_0_uop_is_unique; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_flush_on_commit = s2_req_0_uop_flush_on_commit; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ldst_is_rs1 = s2_req_0_uop_ldst_is_rs1; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ldst = s2_req_0_uop_ldst; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_lrs1 = s2_req_0_uop_lrs1; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_lrs2 = s2_req_0_uop_lrs2; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_lrs3 = s2_req_0_uop_lrs3; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_ldst_val = s2_req_0_uop_ldst_val; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_dst_rtype = s2_req_0_uop_dst_rtype; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_lrs1_rtype = s2_req_0_uop_lrs1_rtype; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_lrs2_rtype = s2_req_0_uop_lrs2_rtype; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_frs3_en = s2_req_0_uop_frs3_en; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_fp_val = s2_req_0_uop_fp_val; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_fp_single = s2_req_0_uop_fp_single; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_xcpt_pf_if = s2_req_0_uop_xcpt_pf_if; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_xcpt_ae_if = s2_req_0_uop_xcpt_ae_if; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_xcpt_ma_if = s2_req_0_uop_xcpt_ma_if; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_bp_debug_if = s2_req_0_uop_bp_debug_if; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_bp_xcpt_if = s2_req_0_uop_bp_xcpt_if; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_debug_fsrc = s2_req_0_uop_debug_fsrc; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_uop_debug_tsrc = s2_req_0_uop_debug_tsrc; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_addr = s2_req_0_addr; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_data = s2_req_0_data; // @[dcache.scala 864:26]
  assign io_lsu_nack_0_bits_is_hella = s2_req_0_is_hella; // @[dcache.scala 864:26]
  assign io_lsu_release_valid = lsu_release_arb_io_out_valid; // @[dcache.scala 814:18]
  assign io_lsu_release_bits_opcode = lsu_release_arb_io_out_bits_opcode; // @[dcache.scala 814:18]
  assign io_lsu_release_bits_param = lsu_release_arb_io_out_bits_param; // @[dcache.scala 814:18]
  assign io_lsu_release_bits_size = lsu_release_arb_io_out_bits_size; // @[dcache.scala 814:18]
  assign io_lsu_release_bits_source = lsu_release_arb_io_out_bits_source; // @[dcache.scala 814:18]
  assign io_lsu_release_bits_address = lsu_release_arb_io_out_bits_address; // @[dcache.scala 814:18]
  assign io_lsu_release_bits_data = lsu_release_arb_io_out_bits_data; // @[dcache.scala 814:18]
  assign io_lsu_release_bits_corrupt = lsu_release_arb_io_out_bits_corrupt; // @[dcache.scala 814:18]
  assign io_lsu_ordered = mshrs_io_fence_rdy & ~REG & ~REG_3; // @[dcache.scala 912:66]
  assign io_lsu_perf_acquire = last_1 & _T_593; // @[Edges.scala 232:22]
  assign io_lsu_perf_release = last & _beatsLeft_T_2; // @[Edges.scala 232:22]
  assign wb_clock = clock;
  assign wb_reset = reset;
  assign wb_io_req_valid = wbArb_io_out_valid; // @[dcache.scala 808:24]
  assign wb_io_req_bits_tag = wbArb_io_out_bits_tag; // @[dcache.scala 808:24]
  assign wb_io_req_bits_idx = wbArb_io_out_bits_idx; // @[dcache.scala 808:24]
  assign wb_io_req_bits_source = wbArb_io_out_bits_source; // @[dcache.scala 808:24]
  assign wb_io_req_bits_param = wbArb_io_out_bits_param; // @[dcache.scala 808:24]
  assign wb_io_req_bits_way_en = wbArb_io_out_bits_way_en; // @[dcache.scala 808:24]
  assign wb_io_req_bits_voluntary = wbArb_io_out_bits_voluntary; // @[dcache.scala 808:24]
  assign wb_io_meta_read_ready = metaReadArb_io_in_2_ready & dataReadArb_io_in_1_ready; // @[dcache.scala 541:55]
  assign wb_io_data_req_ready = metaReadArb_io_in_2_ready & dataReadArb_io_in_1_ready; // @[dcache.scala 546:55]
  assign wb_io_data_resp = _T_330 | _T_328; // @[Mux.scala 27:72]
  assign wb_io_mem_grant = _T_542 & _T_541; // @[dcache.scala 811:44]
  assign wb_io_release_ready = auto_out_c_ready & allowed_0; // @[Arbiter.scala 123:31]
  assign wb_io_lsu_release_ready = lsu_release_arb_io_in_0_ready; // @[dcache.scala 815:28]
  assign prober_clock = clock;
  assign prober_reset = reset;
  assign prober_io_req_valid = auto_out_b_valid & ~lrsc_valid; // @[dcache.scala 777:43]
  assign prober_io_req_bits_opcode = auto_out_b_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign prober_io_req_bits_param = auto_out_b_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign prober_io_req_bits_size = auto_out_b_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign prober_io_req_bits_source = auto_out_b_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign prober_io_req_bits_address = auto_out_b_bits_address; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign prober_io_req_bits_mask = auto_out_b_bits_mask; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign prober_io_req_bits_data = auto_out_b_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign prober_io_req_bits_corrupt = auto_out_b_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign prober_io_rep_ready = auto_out_c_ready & allowed_1; // @[Arbiter.scala 123:31]
  assign prober_io_meta_read_ready = metaReadArb_io_in_1_ready; // @[dcache.scala 561:29]
  assign prober_io_meta_write_ready = metaWriteArb_io_in_1_ready; // @[dcache.scala 782:25]
  assign prober_io_wb_req_ready = wbArb_io_in_0_ready; // @[dcache.scala 806:24]
  assign prober_io_way_en = s2_tag_match_way_0; // @[dcache.scala 780:25]
  assign prober_io_wb_rdy = prober_io_meta_write_bits_idx != wb_io_idx_bits | ~wb_io_idx_valid; // @[dcache.scala 784:79]
  assign prober_io_mshr_rdy = mshrs_io_probe_rdy; // @[dcache.scala 783:25]
  assign prober_io_block_state_state = _T_155 | _T_153; // @[Mux.scala 27:72]
  assign prober_io_lsu_release_ready = lsu_release_arb_io_in_1_ready; // @[dcache.scala 816:28]
  assign mshrs_clock = clock;
  assign mshrs_reset = reset;
  assign mshrs_io_req_0_valid = _T_450 & _T_501; // @[dcache.scala 753:77]
  assign mshrs_io_req_0_bits_uop_uopc = s2_req_0_uop_uopc; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_inst = s2_req_0_uop_inst; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_debug_inst = s2_req_0_uop_debug_inst; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_is_rvc = s2_req_0_uop_is_rvc; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_debug_pc = s2_req_0_uop_debug_pc; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_iq_type = s2_req_0_uop_iq_type; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_fu_code = s2_req_0_uop_fu_code; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ctrl_br_type = s2_req_0_uop_ctrl_br_type; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ctrl_op1_sel = s2_req_0_uop_ctrl_op1_sel; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ctrl_op2_sel = s2_req_0_uop_ctrl_op2_sel; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ctrl_imm_sel = s2_req_0_uop_ctrl_imm_sel; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ctrl_op_fcn = s2_req_0_uop_ctrl_op_fcn; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ctrl_fcn_dw = s2_req_0_uop_ctrl_fcn_dw; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ctrl_csr_cmd = s2_req_0_uop_ctrl_csr_cmd; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ctrl_is_load = s2_req_0_uop_ctrl_is_load; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ctrl_is_sta = s2_req_0_uop_ctrl_is_sta; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ctrl_is_std = s2_req_0_uop_ctrl_is_std; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_iw_state = s2_req_0_uop_iw_state; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_iw_p1_poisoned = s2_req_0_uop_iw_p1_poisoned; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_iw_p2_poisoned = s2_req_0_uop_iw_p2_poisoned; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_is_br = s2_req_0_uop_is_br; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_is_jalr = s2_req_0_uop_is_jalr; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_is_jal = s2_req_0_uop_is_jal; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_is_sfb = s2_req_0_uop_is_sfb; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_br_mask = s2_req_0_uop_br_mask & _T_73; // @[util.scala 85:25]
  assign mshrs_io_req_0_bits_uop_br_tag = s2_req_0_uop_br_tag; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ftq_idx = s2_req_0_uop_ftq_idx; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_edge_inst = s2_req_0_uop_edge_inst; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_pc_lob = s2_req_0_uop_pc_lob; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_taken = s2_req_0_uop_taken; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_imm_packed = s2_req_0_uop_imm_packed; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_csr_addr = s2_req_0_uop_csr_addr; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_rob_idx = s2_req_0_uop_rob_idx; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ldq_idx = s2_req_0_uop_ldq_idx; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_stq_idx = s2_req_0_uop_stq_idx; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_rxq_idx = s2_req_0_uop_rxq_idx; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_pdst = s2_req_0_uop_pdst; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_prs1 = s2_req_0_uop_prs1; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_prs2 = s2_req_0_uop_prs2; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_prs3 = s2_req_0_uop_prs3; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ppred = s2_req_0_uop_ppred; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_prs1_busy = s2_req_0_uop_prs1_busy; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_prs2_busy = s2_req_0_uop_prs2_busy; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_prs3_busy = s2_req_0_uop_prs3_busy; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ppred_busy = s2_req_0_uop_ppred_busy; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_stale_pdst = s2_req_0_uop_stale_pdst; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_exception = s2_req_0_uop_exception; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_exc_cause = s2_req_0_uop_exc_cause; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_bypassable = s2_req_0_uop_bypassable; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_mem_cmd = s2_req_0_uop_mem_cmd; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_mem_size = s2_req_0_uop_mem_size; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_mem_signed = s2_req_0_uop_mem_signed; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_is_fence = s2_req_0_uop_is_fence; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_is_fencei = s2_req_0_uop_is_fencei; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_is_amo = s2_req_0_uop_is_amo; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_uses_ldq = s2_req_0_uop_uses_ldq; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_uses_stq = s2_req_0_uop_uses_stq; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_is_sys_pc2epc = s2_req_0_uop_is_sys_pc2epc; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_is_unique = s2_req_0_uop_is_unique; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_flush_on_commit = s2_req_0_uop_flush_on_commit; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ldst_is_rs1 = s2_req_0_uop_ldst_is_rs1; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ldst = s2_req_0_uop_ldst; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_lrs1 = s2_req_0_uop_lrs1; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_lrs2 = s2_req_0_uop_lrs2; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_lrs3 = s2_req_0_uop_lrs3; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_ldst_val = s2_req_0_uop_ldst_val; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_dst_rtype = s2_req_0_uop_dst_rtype; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_lrs1_rtype = s2_req_0_uop_lrs1_rtype; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_lrs2_rtype = s2_req_0_uop_lrs2_rtype; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_frs3_en = s2_req_0_uop_frs3_en; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_fp_val = s2_req_0_uop_fp_val; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_fp_single = s2_req_0_uop_fp_single; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_xcpt_pf_if = s2_req_0_uop_xcpt_pf_if; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_xcpt_ae_if = s2_req_0_uop_xcpt_ae_if; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_xcpt_ma_if = s2_req_0_uop_xcpt_ma_if; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_bp_debug_if = s2_req_0_uop_bp_debug_if; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_bp_xcpt_if = s2_req_0_uop_bp_xcpt_if; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_debug_fsrc = s2_req_0_uop_debug_fsrc; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_uop_debug_tsrc = s2_req_0_uop_debug_tsrc; // @[dcache.scala 759:38]
  assign mshrs_io_req_0_bits_addr = s2_req_0_addr; // @[dcache.scala 761:38]
  assign mshrs_io_req_0_bits_data = s2_req_0_data; // @[dcache.scala 766:38]
  assign mshrs_io_req_0_bits_is_hella = s2_req_0_is_hella; // @[dcache.scala 767:38]
  assign mshrs_io_req_0_bits_tag_match = |s2_tag_match_way_0; // @[dcache.scala 643:49]
  assign mshrs_io_req_0_bits_old_meta_coh_state = s2_tag_match_0 ? s2_hit_state_0_state : s2_repl_meta_0_coh_state; // @[dcache.scala 763:44]
  assign mshrs_io_req_0_bits_old_meta_tag = _T_343 | _T_341; // @[Mux.scala 27:72]
  assign mshrs_io_req_0_bits_way_en = s2_tag_match_0 ? s2_tag_match_way_0 : s2_replaced_way_en; // @[dcache.scala 764:44]
  assign mshrs_io_req_0_bits_sdq_id = 5'h0;
  assign mshrs_io_req_is_probe_0 = s2_type == 3'h1 & REG_3; // @[dcache.scala 768:61]
  assign mshrs_io_resp_ready = ~cache_resp_0_valid; // @[dcache.scala 843:26]
  assign mshrs_io_brupdate_b1_resolve_mask = io_lsu_brupdate_b1_resolve_mask; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b1_mispredict_mask = io_lsu_brupdate_b1_mispredict_mask; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_uopc = io_lsu_brupdate_b2_uop_uopc; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_inst = io_lsu_brupdate_b2_uop_inst; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_debug_inst = io_lsu_brupdate_b2_uop_debug_inst; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_is_rvc = io_lsu_brupdate_b2_uop_is_rvc; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_debug_pc = io_lsu_brupdate_b2_uop_debug_pc; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_iq_type = io_lsu_brupdate_b2_uop_iq_type; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_fu_code = io_lsu_brupdate_b2_uop_fu_code; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ctrl_br_type = io_lsu_brupdate_b2_uop_ctrl_br_type; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ctrl_op1_sel = io_lsu_brupdate_b2_uop_ctrl_op1_sel; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ctrl_op2_sel = io_lsu_brupdate_b2_uop_ctrl_op2_sel; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ctrl_imm_sel = io_lsu_brupdate_b2_uop_ctrl_imm_sel; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ctrl_op_fcn = io_lsu_brupdate_b2_uop_ctrl_op_fcn; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ctrl_fcn_dw = io_lsu_brupdate_b2_uop_ctrl_fcn_dw; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ctrl_csr_cmd = io_lsu_brupdate_b2_uop_ctrl_csr_cmd; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ctrl_is_load = io_lsu_brupdate_b2_uop_ctrl_is_load; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ctrl_is_sta = io_lsu_brupdate_b2_uop_ctrl_is_sta; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ctrl_is_std = io_lsu_brupdate_b2_uop_ctrl_is_std; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_iw_state = io_lsu_brupdate_b2_uop_iw_state; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_iw_p1_poisoned = io_lsu_brupdate_b2_uop_iw_p1_poisoned; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_iw_p2_poisoned = io_lsu_brupdate_b2_uop_iw_p2_poisoned; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_is_br = io_lsu_brupdate_b2_uop_is_br; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_is_jalr = io_lsu_brupdate_b2_uop_is_jalr; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_is_jal = io_lsu_brupdate_b2_uop_is_jal; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_is_sfb = io_lsu_brupdate_b2_uop_is_sfb; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_br_mask = io_lsu_brupdate_b2_uop_br_mask; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_br_tag = io_lsu_brupdate_b2_uop_br_tag; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ftq_idx = io_lsu_brupdate_b2_uop_ftq_idx; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_edge_inst = io_lsu_brupdate_b2_uop_edge_inst; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_pc_lob = io_lsu_brupdate_b2_uop_pc_lob; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_taken = io_lsu_brupdate_b2_uop_taken; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_imm_packed = io_lsu_brupdate_b2_uop_imm_packed; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_csr_addr = io_lsu_brupdate_b2_uop_csr_addr; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_rob_idx = io_lsu_brupdate_b2_uop_rob_idx; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ldq_idx = io_lsu_brupdate_b2_uop_ldq_idx; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_stq_idx = io_lsu_brupdate_b2_uop_stq_idx; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_rxq_idx = io_lsu_brupdate_b2_uop_rxq_idx; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_pdst = io_lsu_brupdate_b2_uop_pdst; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_prs1 = io_lsu_brupdate_b2_uop_prs1; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_prs2 = io_lsu_brupdate_b2_uop_prs2; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_prs3 = io_lsu_brupdate_b2_uop_prs3; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ppred = io_lsu_brupdate_b2_uop_ppred; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_prs1_busy = io_lsu_brupdate_b2_uop_prs1_busy; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_prs2_busy = io_lsu_brupdate_b2_uop_prs2_busy; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_prs3_busy = io_lsu_brupdate_b2_uop_prs3_busy; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ppred_busy = io_lsu_brupdate_b2_uop_ppred_busy; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_stale_pdst = io_lsu_brupdate_b2_uop_stale_pdst; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_exception = io_lsu_brupdate_b2_uop_exception; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_exc_cause = io_lsu_brupdate_b2_uop_exc_cause; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_bypassable = io_lsu_brupdate_b2_uop_bypassable; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_mem_cmd = io_lsu_brupdate_b2_uop_mem_cmd; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_mem_size = io_lsu_brupdate_b2_uop_mem_size; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_mem_signed = io_lsu_brupdate_b2_uop_mem_signed; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_is_fence = io_lsu_brupdate_b2_uop_is_fence; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_is_fencei = io_lsu_brupdate_b2_uop_is_fencei; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_is_amo = io_lsu_brupdate_b2_uop_is_amo; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_uses_ldq = io_lsu_brupdate_b2_uop_uses_ldq; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_uses_stq = io_lsu_brupdate_b2_uop_uses_stq; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_is_sys_pc2epc = io_lsu_brupdate_b2_uop_is_sys_pc2epc; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_is_unique = io_lsu_brupdate_b2_uop_is_unique; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_flush_on_commit = io_lsu_brupdate_b2_uop_flush_on_commit; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ldst_is_rs1 = io_lsu_brupdate_b2_uop_ldst_is_rs1; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ldst = io_lsu_brupdate_b2_uop_ldst; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_lrs1 = io_lsu_brupdate_b2_uop_lrs1; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_lrs2 = io_lsu_brupdate_b2_uop_lrs2; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_lrs3 = io_lsu_brupdate_b2_uop_lrs3; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_ldst_val = io_lsu_brupdate_b2_uop_ldst_val; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_dst_rtype = io_lsu_brupdate_b2_uop_dst_rtype; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_lrs1_rtype = io_lsu_brupdate_b2_uop_lrs1_rtype; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_lrs2_rtype = io_lsu_brupdate_b2_uop_lrs2_rtype; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_frs3_en = io_lsu_brupdate_b2_uop_frs3_en; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_fp_val = io_lsu_brupdate_b2_uop_fp_val; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_fp_single = io_lsu_brupdate_b2_uop_fp_single; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_xcpt_pf_if = io_lsu_brupdate_b2_uop_xcpt_pf_if; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_xcpt_ae_if = io_lsu_brupdate_b2_uop_xcpt_ae_if; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_xcpt_ma_if = io_lsu_brupdate_b2_uop_xcpt_ma_if; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_bp_debug_if = io_lsu_brupdate_b2_uop_bp_debug_if; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_bp_xcpt_if = io_lsu_brupdate_b2_uop_bp_xcpt_if; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_debug_fsrc = io_lsu_brupdate_b2_uop_debug_fsrc; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_uop_debug_tsrc = io_lsu_brupdate_b2_uop_debug_tsrc; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_valid = io_lsu_brupdate_b2_valid; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_mispredict = io_lsu_brupdate_b2_mispredict; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_taken = io_lsu_brupdate_b2_taken; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_cfi_type = io_lsu_brupdate_b2_cfi_type; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_pc_sel = io_lsu_brupdate_b2_pc_sel; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_jalr_target = io_lsu_brupdate_b2_jalr_target; // @[dcache.scala 434:27]
  assign mshrs_io_brupdate_b2_target_offset = io_lsu_brupdate_b2_target_offset; // @[dcache.scala 434:27]
  assign mshrs_io_exception = io_lsu_exception; // @[dcache.scala 435:25]
  assign mshrs_io_rob_pnr_idx = io_lsu_rob_pnr_idx; // @[dcache.scala 436:25]
  assign mshrs_io_rob_head_idx = io_lsu_rob_head_idx; // @[dcache.scala 437:25]
  assign mshrs_io_mem_acquire_ready = auto_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign mshrs_io_mem_grant_valid = auto_out_d_bits_source == 2'h2 ? 1'h0 : auto_out_d_valid; // @[dcache.scala 788:48 dcache.scala 791:30 dcache.scala 795:24]
  assign mshrs_io_mem_grant_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign mshrs_io_mem_grant_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign mshrs_io_mem_grant_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign mshrs_io_mem_grant_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign mshrs_io_mem_grant_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign mshrs_io_mem_grant_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign mshrs_io_mem_grant_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign mshrs_io_mem_grant_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign mshrs_io_mem_finish_ready = auto_out_e_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign mshrs_io_refill_ready = dataWriteArb_io_in_1_ready; // @[dcache.scala 798:25]
  assign mshrs_io_meta_write_ready = metaWriteArb_io_in_0_ready; // @[dcache.scala 799:25]
  assign mshrs_io_meta_read_ready = metaReadArb_io_in_3_ready; // @[dcache.scala 524:36]
  assign mshrs_io_meta_resp_valid = _T_432 | prober_io_mshr_wb_rdy; // @[dcache.scala 771:52]
  assign mshrs_io_meta_resp_bits_coh_state = _T_533 | _T_531; // @[Mux.scala 27:72]
  assign mshrs_io_meta_resp_bits_tag = _T_526 | _T_524; // @[Mux.scala 27:72]
  assign mshrs_io_replay_ready = metaReadArb_io_in_0_ready & dataReadArb_io_in_0_ready; // @[dcache.scala 501:58]
  assign mshrs_io_prefetch_ready = metaReadArb_io_in_5_ready; // @[dcache.scala 575:27]
  assign mshrs_io_wb_req_ready = wbArb_io_in_1_ready; // @[dcache.scala 807:24]
  assign mshrs_io_prober_state_valid = prober_io_state_valid; // @[dcache.scala 785:25]
  assign mshrs_io_prober_state_bits = prober_io_state_bits; // @[dcache.scala 785:25]
  assign mshrs_io_clear_all = io_lsu_force_order; // @[dcache.scala 433:25]
  assign mshrs_io_wb_resp = wb_io_resp; // @[dcache.scala 810:25]
  assign meta_0_clock = clock;
  assign meta_0_reset = reset;
  assign meta_0_io_read_valid = metaReadArb_io_out_valid; // @[dcache.scala 452:28]
  assign meta_0_io_read_bits_idx = metaReadArb_io_out_bits_req_0_idx; // @[dcache.scala 453:28]
  assign meta_0_io_read_bits_way_en = metaReadArb_io_out_bits_req_0_way_en; // @[dcache.scala 453:28]
  assign meta_0_io_read_bits_tag = metaReadArb_io_out_bits_req_0_tag; // @[dcache.scala 453:28]
  assign meta_0_io_write_valid = metaWriteArb_io_out_ready & metaWriteArb_io_out_valid; // @[Decoupled.scala 40:37]
  assign meta_0_io_write_bits_idx = metaWriteArb_io_out_bits_idx; // @[dcache.scala 451:28]
  assign meta_0_io_write_bits_way_en = metaWriteArb_io_out_bits_way_en; // @[dcache.scala 451:28]
  assign meta_0_io_write_bits_tag = metaWriteArb_io_out_bits_tag; // @[dcache.scala 451:28]
  assign meta_0_io_write_bits_data_coh_state = metaWriteArb_io_out_bits_data_coh_state; // @[dcache.scala 451:28]
  assign meta_0_io_write_bits_data_tag = metaWriteArb_io_out_bits_data_tag; // @[dcache.scala 451:28]
  assign metaWriteArb_clock = clock;
  assign metaWriteArb_reset = reset;
  assign metaWriteArb_io_in_0_valid = mshrs_io_meta_write_valid; // @[dcache.scala 799:25]
  assign metaWriteArb_io_in_0_bits_idx = mshrs_io_meta_write_bits_idx; // @[dcache.scala 799:25]
  assign metaWriteArb_io_in_0_bits_way_en = mshrs_io_meta_write_bits_way_en; // @[dcache.scala 799:25]
  assign metaWriteArb_io_in_0_bits_tag = mshrs_io_meta_write_bits_tag; // @[dcache.scala 799:25]
  assign metaWriteArb_io_in_0_bits_data_coh_state = mshrs_io_meta_write_bits_data_coh_state; // @[dcache.scala 799:25]
  assign metaWriteArb_io_in_0_bits_data_tag = mshrs_io_meta_write_bits_data_tag; // @[dcache.scala 799:25]
  assign metaWriteArb_io_in_1_valid = prober_io_meta_write_valid; // @[dcache.scala 782:25]
  assign metaWriteArb_io_in_1_bits_idx = prober_io_meta_write_bits_idx; // @[dcache.scala 782:25]
  assign metaWriteArb_io_in_1_bits_way_en = prober_io_meta_write_bits_way_en; // @[dcache.scala 782:25]
  assign metaWriteArb_io_in_1_bits_tag = prober_io_meta_write_bits_tag; // @[dcache.scala 782:25]
  assign metaWriteArb_io_in_1_bits_data_coh_state = prober_io_meta_write_bits_data_coh_state; // @[dcache.scala 782:25]
  assign metaWriteArb_io_in_1_bits_data_tag = prober_io_meta_write_bits_data_tag; // @[dcache.scala 782:25]
  assign metaWriteArb_io_out_ready = meta_0_io_write_ready; // @[dcache.scala 456:29]
  assign metaReadArb_clock = clock;
  assign metaReadArb_reset = reset;
  assign metaReadArb_io_in_0_valid = mshrs_io_replay_valid; // @[dcache.scala 504:43]
  assign metaReadArb_io_in_0_bits_req_0_idx = mshrs_io_replay_bits_addr[11:6]; // @[dcache.scala 505:43]
  assign metaReadArb_io_in_0_bits_req_0_way_en = 4'h0;
  assign metaReadArb_io_in_0_bits_req_0_tag = 20'h0;
  assign metaReadArb_io_in_1_valid = prober_io_meta_read_valid; // @[dcache.scala 559:36]
  assign metaReadArb_io_in_1_bits_req_0_idx = prober_io_meta_read_bits_idx; // @[dcache.scala 560:36]
  assign metaReadArb_io_in_1_bits_req_0_way_en = prober_io_meta_read_bits_way_en; // @[dcache.scala 560:36]
  assign metaReadArb_io_in_1_bits_req_0_tag = prober_io_meta_read_bits_tag; // @[dcache.scala 560:36]
  assign metaReadArb_io_in_2_valid = wb_io_meta_read_valid; // @[dcache.scala 539:37]
  assign metaReadArb_io_in_2_bits_req_0_idx = wb_io_meta_read_bits_idx; // @[dcache.scala 540:37]
  assign metaReadArb_io_in_2_bits_req_0_way_en = wb_io_meta_read_bits_way_en; // @[dcache.scala 540:37]
  assign metaReadArb_io_in_2_bits_req_0_tag = wb_io_meta_read_bits_tag; // @[dcache.scala 540:37]
  assign metaReadArb_io_in_3_valid = mshrs_io_meta_read_valid; // @[dcache.scala 522:36]
  assign metaReadArb_io_in_3_bits_req_0_idx = mshrs_io_meta_read_bits_idx; // @[dcache.scala 523:36]
  assign metaReadArb_io_in_3_bits_req_0_way_en = mshrs_io_meta_read_bits_way_en; // @[dcache.scala 523:36]
  assign metaReadArb_io_in_3_bits_req_0_tag = mshrs_io_meta_read_bits_tag; // @[dcache.scala 523:36]
  assign metaReadArb_io_in_4_valid = io_lsu_req_valid; // @[dcache.scala 480:30]
  assign metaReadArb_io_in_4_bits_req_0_idx = io_lsu_req_bits_0_bits_addr[11:6]; // @[dcache.scala 484:45]
  assign metaReadArb_io_in_4_bits_req_0_way_en = 4'h0;
  assign metaReadArb_io_in_4_bits_req_0_tag = 20'h0;
  assign metaReadArb_io_in_5_valid = mshrs_io_prefetch_valid; // @[dcache.scala 571:43]
  assign metaReadArb_io_in_5_bits_req_0_idx = mshrs_io_prefetch_bits_addr[11:6]; // @[dcache.scala 572:43]
  assign metaReadArb_io_in_5_bits_req_0_way_en = 4'h0;
  assign metaReadArb_io_in_5_bits_req_0_tag = 20'h0;
  assign metaReadArb_io_out_ready = meta_0_io_read_ready; // @[dcache.scala 455:29]
  assign data_clock = clock;
  assign data_reset = reset;
  assign data_io_read_0_valid = dataReadArb_io_out_bits_valid_0 & dataReadArb_io_out_valid; // @[dcache.scala 467:63]
  assign data_io_read_0_bits_way_en = dataReadArb_io_out_bits_req_0_way_en; // @[dcache.scala 468:27]
  assign data_io_read_0_bits_addr = dataReadArb_io_out_bits_req_0_addr; // @[dcache.scala 468:27]
  assign data_io_write_valid = dataWriteArb_io_out_ready & dataWriteArb_io_out_valid; // @[Decoupled.scala 40:37]
  assign data_io_write_bits_way_en = dataWriteArb_io_out_bits_way_en; // @[dcache.scala 473:23]
  assign data_io_write_bits_addr = dataWriteArb_io_out_bits_addr; // @[dcache.scala 473:23]
  assign data_io_write_bits_wmask = dataWriteArb_io_out_bits_wmask; // @[dcache.scala 473:23]
  assign data_io_write_bits_data = dataWriteArb_io_out_bits_data; // @[dcache.scala 473:23]
  assign dataWriteArb_clock = clock;
  assign dataWriteArb_reset = reset;
  assign dataWriteArb_io_in_0_valid = s3_valid; // @[dcache.scala 905:37]
  assign dataWriteArb_io_in_0_bits_way_en = s3_way; // @[dcache.scala 909:37]
  assign dataWriteArb_io_in_0_bits_addr = s3_req_addr[11:0]; // @[dcache.scala 906:37]
  assign dataWriteArb_io_in_0_bits_wmask = 1'h1; // @[dcache.scala 907:37]
  assign dataWriteArb_io_in_0_bits_data = s3_req_data; // @[dcache.scala 908:37]
  assign dataWriteArb_io_in_1_valid = mshrs_io_refill_valid; // @[dcache.scala 798:25]
  assign dataWriteArb_io_in_1_bits_way_en = mshrs_io_refill_bits_way_en; // @[dcache.scala 798:25]
  assign dataWriteArb_io_in_1_bits_addr = mshrs_io_refill_bits_addr; // @[dcache.scala 798:25]
  assign dataWriteArb_io_in_1_bits_wmask = mshrs_io_refill_bits_wmask; // @[dcache.scala 798:25]
  assign dataWriteArb_io_in_1_bits_data = mshrs_io_refill_bits_data; // @[dcache.scala 798:25]
  assign dataWriteArb_io_out_ready = 1'h1; // @[dcache.scala 474:29]
  assign dataReadArb_clock = clock;
  assign dataReadArb_reset = reset;
  assign dataReadArb_io_in_0_valid = mshrs_io_replay_valid; // @[dcache.scala 509:43]
  assign dataReadArb_io_in_0_bits_req_0_way_en = mshrs_io_replay_bits_way_en; // @[dcache.scala 511:43]
  assign dataReadArb_io_in_0_bits_req_0_addr = mshrs_io_replay_bits_addr[11:0]; // @[dcache.scala 510:43]
  assign dataReadArb_io_in_0_bits_valid_0 = 1'h1; // @[dcache.scala 426:49 dcache.scala 426:49]
  assign dataReadArb_io_in_1_valid = wb_io_data_req_valid; // @[dcache.scala 543:37]
  assign dataReadArb_io_in_1_bits_req_0_way_en = wb_io_data_req_bits_way_en; // @[dcache.scala 544:37]
  assign dataReadArb_io_in_1_bits_req_0_addr = wb_io_data_req_bits_addr; // @[dcache.scala 544:37]
  assign dataReadArb_io_in_1_bits_valid_0 = 1'h1; // @[dcache.scala 426:49 dcache.scala 426:49]
  assign dataReadArb_io_in_2_valid = io_lsu_req_valid; // @[dcache.scala 481:30]
  assign dataReadArb_io_in_2_bits_req_0_way_en = 4'hf; // @[dcache.scala 490:48]
  assign dataReadArb_io_in_2_bits_req_0_addr = io_lsu_req_bits_0_bits_addr[11:0]; // @[dcache.scala 489:45]
  assign dataReadArb_io_in_2_bits_valid_0 = io_lsu_req_bits_0_valid; // @[dcache.scala 488:45]
  assign dataReadArb_io_out_ready = 1'h1; // @[dcache.scala 470:28]
  assign lfsr_prng_clock = clock;
  assign lfsr_prng_reset = reset;
  assign lfsr_prng_io_seed_valid = 1'h0; // @[PRNG.scala 83:24]
  assign lfsr_prng_io_seed_bits_0 = 1'h0;
  assign lfsr_prng_io_seed_bits_1 = 1'h0;
  assign lfsr_prng_io_seed_bits_2 = 1'h0;
  assign lfsr_prng_io_seed_bits_3 = 1'h0;
  assign lfsr_prng_io_seed_bits_4 = 1'h0;
  assign lfsr_prng_io_seed_bits_5 = 1'h0;
  assign lfsr_prng_io_seed_bits_6 = 1'h0;
  assign lfsr_prng_io_seed_bits_7 = 1'h0;
  assign lfsr_prng_io_seed_bits_8 = 1'h0;
  assign lfsr_prng_io_seed_bits_9 = 1'h0;
  assign lfsr_prng_io_seed_bits_10 = 1'h0;
  assign lfsr_prng_io_seed_bits_11 = 1'h0;
  assign lfsr_prng_io_seed_bits_12 = 1'h0;
  assign lfsr_prng_io_seed_bits_13 = 1'h0;
  assign lfsr_prng_io_seed_bits_14 = 1'h0;
  assign lfsr_prng_io_seed_bits_15 = 1'h0;
  assign lfsr_prng_io_increment = mshrs_io_req_0_ready & mshrs_io_req_0_valid; // @[Decoupled.scala 40:37]
  assign wbArb_clock = clock;
  assign wbArb_reset = reset;
  assign wbArb_io_in_0_valid = prober_io_wb_req_valid; // @[dcache.scala 806:24]
  assign wbArb_io_in_0_bits_tag = prober_io_wb_req_bits_tag; // @[dcache.scala 806:24]
  assign wbArb_io_in_0_bits_idx = prober_io_wb_req_bits_idx; // @[dcache.scala 806:24]
  assign wbArb_io_in_0_bits_source = prober_io_wb_req_bits_source; // @[dcache.scala 806:24]
  assign wbArb_io_in_0_bits_param = prober_io_wb_req_bits_param; // @[dcache.scala 806:24]
  assign wbArb_io_in_0_bits_way_en = prober_io_wb_req_bits_way_en; // @[dcache.scala 806:24]
  assign wbArb_io_in_0_bits_voluntary = prober_io_wb_req_bits_voluntary; // @[dcache.scala 806:24]
  assign wbArb_io_in_1_valid = mshrs_io_wb_req_valid; // @[dcache.scala 807:24]
  assign wbArb_io_in_1_bits_tag = mshrs_io_wb_req_bits_tag; // @[dcache.scala 807:24]
  assign wbArb_io_in_1_bits_idx = mshrs_io_wb_req_bits_idx; // @[dcache.scala 807:24]
  assign wbArb_io_in_1_bits_source = mshrs_io_wb_req_bits_source; // @[dcache.scala 807:24]
  assign wbArb_io_in_1_bits_param = mshrs_io_wb_req_bits_param; // @[dcache.scala 807:24]
  assign wbArb_io_in_1_bits_way_en = mshrs_io_wb_req_bits_way_en; // @[dcache.scala 807:24]
  assign wbArb_io_in_1_bits_voluntary = mshrs_io_wb_req_bits_voluntary; // @[dcache.scala 807:24]
  assign wbArb_io_out_ready = wb_io_req_ready; // @[dcache.scala 808:24]
  assign lsu_release_arb_clock = clock;
  assign lsu_release_arb_reset = reset;
  assign lsu_release_arb_io_in_0_valid = wb_io_lsu_release_valid; // @[dcache.scala 815:28]
  assign lsu_release_arb_io_in_0_bits_opcode = wb_io_lsu_release_bits_opcode; // @[dcache.scala 815:28]
  assign lsu_release_arb_io_in_0_bits_param = wb_io_lsu_release_bits_param; // @[dcache.scala 815:28]
  assign lsu_release_arb_io_in_0_bits_size = wb_io_lsu_release_bits_size; // @[dcache.scala 815:28]
  assign lsu_release_arb_io_in_0_bits_source = wb_io_lsu_release_bits_source; // @[dcache.scala 815:28]
  assign lsu_release_arb_io_in_0_bits_address = wb_io_lsu_release_bits_address; // @[dcache.scala 815:28]
  assign lsu_release_arb_io_in_0_bits_data = wb_io_lsu_release_bits_data; // @[dcache.scala 815:28]
  assign lsu_release_arb_io_in_0_bits_corrupt = wb_io_lsu_release_bits_corrupt; // @[dcache.scala 815:28]
  assign lsu_release_arb_io_in_1_valid = prober_io_lsu_release_valid; // @[dcache.scala 816:28]
  assign lsu_release_arb_io_in_1_bits_opcode = prober_io_lsu_release_bits_opcode; // @[dcache.scala 816:28]
  assign lsu_release_arb_io_in_1_bits_param = prober_io_lsu_release_bits_param; // @[dcache.scala 816:28]
  assign lsu_release_arb_io_in_1_bits_size = prober_io_lsu_release_bits_size; // @[dcache.scala 816:28]
  assign lsu_release_arb_io_in_1_bits_source = prober_io_lsu_release_bits_source; // @[dcache.scala 816:28]
  assign lsu_release_arb_io_in_1_bits_address = prober_io_lsu_release_bits_address; // @[dcache.scala 816:28]
  assign lsu_release_arb_io_in_1_bits_data = prober_io_lsu_release_bits_data; // @[dcache.scala 816:28]
  assign lsu_release_arb_io_in_1_bits_corrupt = prober_io_lsu_release_bits_corrupt; // @[dcache.scala 816:28]
  assign lsu_release_arb_io_out_ready = io_lsu_release_ready; // @[dcache.scala 814:18]
  assign amoalu_clock = clock;
  assign amoalu_reset = reset;
  assign amoalu_io_mask = {hi_33,lo_7}; // @[Cat.scala 30:58]
  assign amoalu_io_cmd = s2_req_0_uop_mem_cmd; // @[dcache.scala 897:18]
  assign amoalu_io_lhs = s3_bypass_0 ? s3_req_data : _T_695; // @[dcache.scala 890:27]
  assign amoalu_io_rhs = s2_req_0_data; // @[dcache.scala 899:18]
  always @(posedge clock) begin
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_uopc <= io_lsu_req_bits_0_bits_uop_uopc;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_uopc <= 7'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_uopc <= 7'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_uopc <= prefetch_req_0_uop_uopc;
    end else begin
      s1_req_0_uop_uopc <= _T_35_0_uop_uopc;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_inst <= io_lsu_req_bits_0_bits_uop_inst;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_inst <= 32'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_inst <= 32'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_inst <= prefetch_req_0_uop_inst;
    end else begin
      s1_req_0_uop_inst <= _T_35_0_uop_inst;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_debug_inst <= io_lsu_req_bits_0_bits_uop_debug_inst;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_debug_inst <= 32'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_debug_inst <= 32'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_debug_inst <= prefetch_req_0_uop_debug_inst;
    end else begin
      s1_req_0_uop_debug_inst <= _T_35_0_uop_debug_inst;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_is_rvc <= io_lsu_req_bits_0_bits_uop_is_rvc;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_is_rvc <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_is_rvc <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_is_rvc <= prefetch_req_0_uop_is_rvc;
    end else begin
      s1_req_0_uop_is_rvc <= _T_35_0_uop_is_rvc;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_debug_pc <= io_lsu_req_bits_0_bits_uop_debug_pc;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_debug_pc <= 40'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_debug_pc <= 40'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_debug_pc <= prefetch_req_0_uop_debug_pc;
    end else begin
      s1_req_0_uop_debug_pc <= _T_35_0_uop_debug_pc;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_iq_type <= io_lsu_req_bits_0_bits_uop_iq_type;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_iq_type <= 3'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_iq_type <= 3'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_iq_type <= prefetch_req_0_uop_iq_type;
    end else begin
      s1_req_0_uop_iq_type <= _T_35_0_uop_iq_type;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_fu_code <= io_lsu_req_bits_0_bits_uop_fu_code;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_fu_code <= 10'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_fu_code <= 10'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_fu_code <= prefetch_req_0_uop_fu_code;
    end else begin
      s1_req_0_uop_fu_code <= _T_35_0_uop_fu_code;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ctrl_br_type <= io_lsu_req_bits_0_bits_uop_ctrl_br_type;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ctrl_br_type <= 4'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ctrl_br_type <= 4'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ctrl_br_type <= prefetch_req_0_uop_ctrl_br_type;
    end else begin
      s1_req_0_uop_ctrl_br_type <= _T_35_0_uop_ctrl_br_type;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ctrl_op1_sel <= io_lsu_req_bits_0_bits_uop_ctrl_op1_sel;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ctrl_op1_sel <= 2'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ctrl_op1_sel <= 2'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ctrl_op1_sel <= prefetch_req_0_uop_ctrl_op1_sel;
    end else begin
      s1_req_0_uop_ctrl_op1_sel <= _T_35_0_uop_ctrl_op1_sel;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ctrl_op2_sel <= io_lsu_req_bits_0_bits_uop_ctrl_op2_sel;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ctrl_op2_sel <= 3'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ctrl_op2_sel <= 3'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ctrl_op2_sel <= prefetch_req_0_uop_ctrl_op2_sel;
    end else begin
      s1_req_0_uop_ctrl_op2_sel <= _T_35_0_uop_ctrl_op2_sel;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ctrl_imm_sel <= io_lsu_req_bits_0_bits_uop_ctrl_imm_sel;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ctrl_imm_sel <= 3'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ctrl_imm_sel <= 3'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ctrl_imm_sel <= prefetch_req_0_uop_ctrl_imm_sel;
    end else begin
      s1_req_0_uop_ctrl_imm_sel <= _T_35_0_uop_ctrl_imm_sel;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ctrl_op_fcn <= io_lsu_req_bits_0_bits_uop_ctrl_op_fcn;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ctrl_op_fcn <= 4'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ctrl_op_fcn <= 4'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ctrl_op_fcn <= prefetch_req_0_uop_ctrl_op_fcn;
    end else begin
      s1_req_0_uop_ctrl_op_fcn <= _T_35_0_uop_ctrl_op_fcn;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ctrl_fcn_dw <= io_lsu_req_bits_0_bits_uop_ctrl_fcn_dw;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ctrl_fcn_dw <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ctrl_fcn_dw <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ctrl_fcn_dw <= prefetch_req_0_uop_ctrl_fcn_dw;
    end else begin
      s1_req_0_uop_ctrl_fcn_dw <= _T_35_0_uop_ctrl_fcn_dw;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ctrl_csr_cmd <= io_lsu_req_bits_0_bits_uop_ctrl_csr_cmd;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ctrl_csr_cmd <= 3'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ctrl_csr_cmd <= 3'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ctrl_csr_cmd <= prefetch_req_0_uop_ctrl_csr_cmd;
    end else begin
      s1_req_0_uop_ctrl_csr_cmd <= _T_35_0_uop_ctrl_csr_cmd;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ctrl_is_load <= io_lsu_req_bits_0_bits_uop_ctrl_is_load;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ctrl_is_load <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ctrl_is_load <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ctrl_is_load <= prefetch_req_0_uop_ctrl_is_load;
    end else begin
      s1_req_0_uop_ctrl_is_load <= _T_35_0_uop_ctrl_is_load;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ctrl_is_sta <= io_lsu_req_bits_0_bits_uop_ctrl_is_sta;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ctrl_is_sta <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ctrl_is_sta <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ctrl_is_sta <= prefetch_req_0_uop_ctrl_is_sta;
    end else begin
      s1_req_0_uop_ctrl_is_sta <= _T_35_0_uop_ctrl_is_sta;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ctrl_is_std <= io_lsu_req_bits_0_bits_uop_ctrl_is_std;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ctrl_is_std <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ctrl_is_std <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ctrl_is_std <= prefetch_req_0_uop_ctrl_is_std;
    end else begin
      s1_req_0_uop_ctrl_is_std <= _T_35_0_uop_ctrl_is_std;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_iw_state <= io_lsu_req_bits_0_bits_uop_iw_state;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_iw_state <= 2'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_iw_state <= 2'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_iw_state <= prefetch_req_0_uop_iw_state;
    end else begin
      s1_req_0_uop_iw_state <= _T_35_0_uop_iw_state;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_iw_p1_poisoned <= io_lsu_req_bits_0_bits_uop_iw_p1_poisoned;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_iw_p1_poisoned <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_iw_p1_poisoned <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_iw_p1_poisoned <= prefetch_req_0_uop_iw_p1_poisoned;
    end else begin
      s1_req_0_uop_iw_p1_poisoned <= _T_35_0_uop_iw_p1_poisoned;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_iw_p2_poisoned <= io_lsu_req_bits_0_bits_uop_iw_p2_poisoned;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_iw_p2_poisoned <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_iw_p2_poisoned <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_iw_p2_poisoned <= prefetch_req_0_uop_iw_p2_poisoned;
    end else begin
      s1_req_0_uop_iw_p2_poisoned <= _T_35_0_uop_iw_p2_poisoned;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_is_br <= io_lsu_req_bits_0_bits_uop_is_br;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_is_br <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_is_br <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_is_br <= prefetch_req_0_uop_is_br;
    end else begin
      s1_req_0_uop_is_br <= _T_35_0_uop_is_br;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_is_jalr <= io_lsu_req_bits_0_bits_uop_is_jalr;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_is_jalr <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_is_jalr <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_is_jalr <= prefetch_req_0_uop_is_jalr;
    end else begin
      s1_req_0_uop_is_jalr <= _T_35_0_uop_is_jalr;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_is_jal <= io_lsu_req_bits_0_bits_uop_is_jal;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_is_jal <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_is_jal <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_is_jal <= prefetch_req_0_uop_is_jal;
    end else begin
      s1_req_0_uop_is_jal <= _T_35_0_uop_is_jal;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_is_sfb <= io_lsu_req_bits_0_bits_uop_is_sfb;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_is_sfb <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_is_sfb <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_is_sfb <= prefetch_req_0_uop_is_sfb;
    end else begin
      s1_req_0_uop_is_sfb <= _T_35_0_uop_is_sfb;
    end
    s1_req_0_uop_br_mask <= s0_req_0_uop_br_mask & _T_73; // @[util.scala 85:25]
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_br_tag <= io_lsu_req_bits_0_bits_uop_br_tag;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_br_tag <= 4'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_br_tag <= 4'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_br_tag <= prefetch_req_0_uop_br_tag;
    end else begin
      s1_req_0_uop_br_tag <= _T_35_0_uop_br_tag;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ftq_idx <= io_lsu_req_bits_0_bits_uop_ftq_idx;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ftq_idx <= 5'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ftq_idx <= 5'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ftq_idx <= prefetch_req_0_uop_ftq_idx;
    end else begin
      s1_req_0_uop_ftq_idx <= _T_35_0_uop_ftq_idx;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_edge_inst <= io_lsu_req_bits_0_bits_uop_edge_inst;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_edge_inst <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_edge_inst <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_edge_inst <= prefetch_req_0_uop_edge_inst;
    end else begin
      s1_req_0_uop_edge_inst <= _T_35_0_uop_edge_inst;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_pc_lob <= io_lsu_req_bits_0_bits_uop_pc_lob;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_pc_lob <= 6'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_pc_lob <= 6'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_pc_lob <= prefetch_req_0_uop_pc_lob;
    end else begin
      s1_req_0_uop_pc_lob <= _T_35_0_uop_pc_lob;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_taken <= io_lsu_req_bits_0_bits_uop_taken;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_taken <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_taken <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_taken <= prefetch_req_0_uop_taken;
    end else begin
      s1_req_0_uop_taken <= _T_35_0_uop_taken;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_imm_packed <= io_lsu_req_bits_0_bits_uop_imm_packed;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_imm_packed <= 20'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_imm_packed <= 20'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_imm_packed <= prefetch_req_0_uop_imm_packed;
    end else begin
      s1_req_0_uop_imm_packed <= _T_35_0_uop_imm_packed;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_csr_addr <= io_lsu_req_bits_0_bits_uop_csr_addr;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_csr_addr <= 12'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_csr_addr <= 12'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_csr_addr <= prefetch_req_0_uop_csr_addr;
    end else begin
      s1_req_0_uop_csr_addr <= _T_35_0_uop_csr_addr;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_rob_idx <= io_lsu_req_bits_0_bits_uop_rob_idx;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_rob_idx <= 6'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_rob_idx <= 6'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_rob_idx <= prefetch_req_0_uop_rob_idx;
    end else begin
      s1_req_0_uop_rob_idx <= _T_35_0_uop_rob_idx;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ldq_idx <= io_lsu_req_bits_0_bits_uop_ldq_idx;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ldq_idx <= 4'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ldq_idx <= 4'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ldq_idx <= prefetch_req_0_uop_ldq_idx;
    end else begin
      s1_req_0_uop_ldq_idx <= _T_35_0_uop_ldq_idx;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_stq_idx <= io_lsu_req_bits_0_bits_uop_stq_idx;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_stq_idx <= 4'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_stq_idx <= 4'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_stq_idx <= prefetch_req_0_uop_stq_idx;
    end else begin
      s1_req_0_uop_stq_idx <= _T_35_0_uop_stq_idx;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_rxq_idx <= io_lsu_req_bits_0_bits_uop_rxq_idx;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_rxq_idx <= 2'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_rxq_idx <= 2'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_rxq_idx <= prefetch_req_0_uop_rxq_idx;
    end else begin
      s1_req_0_uop_rxq_idx <= _T_35_0_uop_rxq_idx;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_pdst <= io_lsu_req_bits_0_bits_uop_pdst;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_pdst <= 6'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_pdst <= 6'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_pdst <= prefetch_req_0_uop_pdst;
    end else begin
      s1_req_0_uop_pdst <= _T_35_0_uop_pdst;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_prs1 <= io_lsu_req_bits_0_bits_uop_prs1;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_prs1 <= 6'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_prs1 <= 6'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_prs1 <= prefetch_req_0_uop_prs1;
    end else begin
      s1_req_0_uop_prs1 <= _T_35_0_uop_prs1;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_prs2 <= io_lsu_req_bits_0_bits_uop_prs2;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_prs2 <= 6'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_prs2 <= 6'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_prs2 <= prefetch_req_0_uop_prs2;
    end else begin
      s1_req_0_uop_prs2 <= _T_35_0_uop_prs2;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_prs3 <= io_lsu_req_bits_0_bits_uop_prs3;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_prs3 <= 6'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_prs3 <= 6'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_prs3 <= prefetch_req_0_uop_prs3;
    end else begin
      s1_req_0_uop_prs3 <= _T_35_0_uop_prs3;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ppred <= io_lsu_req_bits_0_bits_uop_ppred;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ppred <= 5'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ppred <= 5'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ppred <= prefetch_req_0_uop_ppred;
    end else begin
      s1_req_0_uop_ppred <= _T_35_0_uop_ppred;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_prs1_busy <= io_lsu_req_bits_0_bits_uop_prs1_busy;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_prs1_busy <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_prs1_busy <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_prs1_busy <= prefetch_req_0_uop_prs1_busy;
    end else begin
      s1_req_0_uop_prs1_busy <= _T_35_0_uop_prs1_busy;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_prs2_busy <= io_lsu_req_bits_0_bits_uop_prs2_busy;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_prs2_busy <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_prs2_busy <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_prs2_busy <= prefetch_req_0_uop_prs2_busy;
    end else begin
      s1_req_0_uop_prs2_busy <= _T_35_0_uop_prs2_busy;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_prs3_busy <= io_lsu_req_bits_0_bits_uop_prs3_busy;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_prs3_busy <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_prs3_busy <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_prs3_busy <= prefetch_req_0_uop_prs3_busy;
    end else begin
      s1_req_0_uop_prs3_busy <= _T_35_0_uop_prs3_busy;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ppred_busy <= io_lsu_req_bits_0_bits_uop_ppred_busy;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ppred_busy <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ppred_busy <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ppred_busy <= prefetch_req_0_uop_ppred_busy;
    end else begin
      s1_req_0_uop_ppred_busy <= _T_35_0_uop_ppred_busy;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_stale_pdst <= io_lsu_req_bits_0_bits_uop_stale_pdst;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_stale_pdst <= 6'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_stale_pdst <= 6'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_stale_pdst <= prefetch_req_0_uop_stale_pdst;
    end else begin
      s1_req_0_uop_stale_pdst <= _T_35_0_uop_stale_pdst;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_exception <= io_lsu_req_bits_0_bits_uop_exception;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_exception <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_exception <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_exception <= prefetch_req_0_uop_exception;
    end else begin
      s1_req_0_uop_exception <= _T_35_0_uop_exception;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_exc_cause <= io_lsu_req_bits_0_bits_uop_exc_cause;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_exc_cause <= 64'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_exc_cause <= 64'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_exc_cause <= prefetch_req_0_uop_exc_cause;
    end else begin
      s1_req_0_uop_exc_cause <= _T_35_0_uop_exc_cause;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_bypassable <= io_lsu_req_bits_0_bits_uop_bypassable;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_bypassable <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_bypassable <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_bypassable <= prefetch_req_0_uop_bypassable;
    end else begin
      s1_req_0_uop_bypassable <= _T_35_0_uop_bypassable;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_mem_cmd <= io_lsu_req_bits_0_bits_uop_mem_cmd;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_mem_cmd <= 5'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_mem_cmd <= 5'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_mem_cmd <= prefetch_req_0_uop_mem_cmd;
    end else begin
      s1_req_0_uop_mem_cmd <= _T_35_0_uop_mem_cmd;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_mem_size <= io_lsu_req_bits_0_bits_uop_mem_size;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_mem_size <= 2'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_mem_size <= 2'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_mem_size <= prefetch_req_0_uop_mem_size;
    end else begin
      s1_req_0_uop_mem_size <= _T_35_0_uop_mem_size;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_mem_signed <= io_lsu_req_bits_0_bits_uop_mem_signed;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_mem_signed <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_mem_signed <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_mem_signed <= prefetch_req_0_uop_mem_signed;
    end else begin
      s1_req_0_uop_mem_signed <= _T_35_0_uop_mem_signed;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_is_fence <= io_lsu_req_bits_0_bits_uop_is_fence;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_is_fence <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_is_fence <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_is_fence <= prefetch_req_0_uop_is_fence;
    end else begin
      s1_req_0_uop_is_fence <= _T_35_0_uop_is_fence;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_is_fencei <= io_lsu_req_bits_0_bits_uop_is_fencei;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_is_fencei <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_is_fencei <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_is_fencei <= prefetch_req_0_uop_is_fencei;
    end else begin
      s1_req_0_uop_is_fencei <= _T_35_0_uop_is_fencei;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_is_amo <= io_lsu_req_bits_0_bits_uop_is_amo;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_is_amo <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_is_amo <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_is_amo <= prefetch_req_0_uop_is_amo;
    end else begin
      s1_req_0_uop_is_amo <= _T_35_0_uop_is_amo;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_uses_ldq <= io_lsu_req_bits_0_bits_uop_uses_ldq;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_uses_ldq <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_uses_ldq <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_uses_ldq <= prefetch_req_0_uop_uses_ldq;
    end else begin
      s1_req_0_uop_uses_ldq <= _T_35_0_uop_uses_ldq;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_uses_stq <= io_lsu_req_bits_0_bits_uop_uses_stq;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_uses_stq <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_uses_stq <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_uses_stq <= prefetch_req_0_uop_uses_stq;
    end else begin
      s1_req_0_uop_uses_stq <= _T_35_0_uop_uses_stq;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_is_sys_pc2epc <= io_lsu_req_bits_0_bits_uop_is_sys_pc2epc;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_is_sys_pc2epc <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_is_sys_pc2epc <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_is_sys_pc2epc <= prefetch_req_0_uop_is_sys_pc2epc;
    end else begin
      s1_req_0_uop_is_sys_pc2epc <= _T_35_0_uop_is_sys_pc2epc;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_is_unique <= io_lsu_req_bits_0_bits_uop_is_unique;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_is_unique <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_is_unique <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_is_unique <= prefetch_req_0_uop_is_unique;
    end else begin
      s1_req_0_uop_is_unique <= _T_35_0_uop_is_unique;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_flush_on_commit <= io_lsu_req_bits_0_bits_uop_flush_on_commit;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_flush_on_commit <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_flush_on_commit <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_flush_on_commit <= prefetch_req_0_uop_flush_on_commit;
    end else begin
      s1_req_0_uop_flush_on_commit <= _T_35_0_uop_flush_on_commit;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ldst_is_rs1 <= io_lsu_req_bits_0_bits_uop_ldst_is_rs1;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ldst_is_rs1 <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ldst_is_rs1 <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ldst_is_rs1 <= prefetch_req_0_uop_ldst_is_rs1;
    end else begin
      s1_req_0_uop_ldst_is_rs1 <= _T_35_0_uop_ldst_is_rs1;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ldst <= io_lsu_req_bits_0_bits_uop_ldst;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ldst <= 6'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ldst <= 6'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ldst <= prefetch_req_0_uop_ldst;
    end else begin
      s1_req_0_uop_ldst <= _T_35_0_uop_ldst;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_lrs1 <= io_lsu_req_bits_0_bits_uop_lrs1;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_lrs1 <= 6'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_lrs1 <= 6'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_lrs1 <= prefetch_req_0_uop_lrs1;
    end else begin
      s1_req_0_uop_lrs1 <= _T_35_0_uop_lrs1;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_lrs2 <= io_lsu_req_bits_0_bits_uop_lrs2;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_lrs2 <= 6'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_lrs2 <= 6'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_lrs2 <= prefetch_req_0_uop_lrs2;
    end else begin
      s1_req_0_uop_lrs2 <= _T_35_0_uop_lrs2;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_lrs3 <= io_lsu_req_bits_0_bits_uop_lrs3;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_lrs3 <= 6'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_lrs3 <= 6'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_lrs3 <= prefetch_req_0_uop_lrs3;
    end else begin
      s1_req_0_uop_lrs3 <= _T_35_0_uop_lrs3;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_ldst_val <= io_lsu_req_bits_0_bits_uop_ldst_val;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_ldst_val <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_ldst_val <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_ldst_val <= prefetch_req_0_uop_ldst_val;
    end else begin
      s1_req_0_uop_ldst_val <= _T_35_0_uop_ldst_val;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_dst_rtype <= io_lsu_req_bits_0_bits_uop_dst_rtype;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_dst_rtype <= 2'h2;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_dst_rtype <= 2'h2;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_dst_rtype <= prefetch_req_0_uop_dst_rtype;
    end else begin
      s1_req_0_uop_dst_rtype <= _T_35_0_uop_dst_rtype;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_lrs1_rtype <= io_lsu_req_bits_0_bits_uop_lrs1_rtype;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_lrs1_rtype <= 2'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_lrs1_rtype <= 2'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_lrs1_rtype <= prefetch_req_0_uop_lrs1_rtype;
    end else begin
      s1_req_0_uop_lrs1_rtype <= _T_35_0_uop_lrs1_rtype;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_lrs2_rtype <= io_lsu_req_bits_0_bits_uop_lrs2_rtype;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_lrs2_rtype <= 2'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_lrs2_rtype <= 2'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_lrs2_rtype <= prefetch_req_0_uop_lrs2_rtype;
    end else begin
      s1_req_0_uop_lrs2_rtype <= _T_35_0_uop_lrs2_rtype;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_frs3_en <= io_lsu_req_bits_0_bits_uop_frs3_en;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_frs3_en <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_frs3_en <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_frs3_en <= prefetch_req_0_uop_frs3_en;
    end else begin
      s1_req_0_uop_frs3_en <= _T_35_0_uop_frs3_en;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_fp_val <= io_lsu_req_bits_0_bits_uop_fp_val;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_fp_val <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_fp_val <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_fp_val <= prefetch_req_0_uop_fp_val;
    end else begin
      s1_req_0_uop_fp_val <= _T_35_0_uop_fp_val;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_fp_single <= io_lsu_req_bits_0_bits_uop_fp_single;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_fp_single <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_fp_single <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_fp_single <= prefetch_req_0_uop_fp_single;
    end else begin
      s1_req_0_uop_fp_single <= _T_35_0_uop_fp_single;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_xcpt_pf_if <= io_lsu_req_bits_0_bits_uop_xcpt_pf_if;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_xcpt_pf_if <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_xcpt_pf_if <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_xcpt_pf_if <= prefetch_req_0_uop_xcpt_pf_if;
    end else begin
      s1_req_0_uop_xcpt_pf_if <= _T_35_0_uop_xcpt_pf_if;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_xcpt_ae_if <= io_lsu_req_bits_0_bits_uop_xcpt_ae_if;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_xcpt_ae_if <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_xcpt_ae_if <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_xcpt_ae_if <= prefetch_req_0_uop_xcpt_ae_if;
    end else begin
      s1_req_0_uop_xcpt_ae_if <= _T_35_0_uop_xcpt_ae_if;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_xcpt_ma_if <= io_lsu_req_bits_0_bits_uop_xcpt_ma_if;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_xcpt_ma_if <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_xcpt_ma_if <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_xcpt_ma_if <= prefetch_req_0_uop_xcpt_ma_if;
    end else begin
      s1_req_0_uop_xcpt_ma_if <= _T_35_0_uop_xcpt_ma_if;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_bp_debug_if <= io_lsu_req_bits_0_bits_uop_bp_debug_if;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_bp_debug_if <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_bp_debug_if <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_bp_debug_if <= prefetch_req_0_uop_bp_debug_if;
    end else begin
      s1_req_0_uop_bp_debug_if <= _T_35_0_uop_bp_debug_if;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_bp_xcpt_if <= io_lsu_req_bits_0_bits_uop_bp_xcpt_if;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_bp_xcpt_if <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_bp_xcpt_if <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_bp_xcpt_if <= prefetch_req_0_uop_bp_xcpt_if;
    end else begin
      s1_req_0_uop_bp_xcpt_if <= _T_35_0_uop_bp_xcpt_if;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_debug_fsrc <= io_lsu_req_bits_0_bits_uop_debug_fsrc;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_debug_fsrc <= 2'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_debug_fsrc <= 2'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_debug_fsrc <= prefetch_req_0_uop_debug_fsrc;
    end else begin
      s1_req_0_uop_debug_fsrc <= _T_35_0_uop_debug_fsrc;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_uop_debug_tsrc <= io_lsu_req_bits_0_bits_uop_debug_tsrc;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_uop_debug_tsrc <= 2'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_uop_debug_tsrc <= 2'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_uop_debug_tsrc <= prefetch_req_0_uop_debug_tsrc;
    end else begin
      s1_req_0_uop_debug_tsrc <= _T_35_0_uop_debug_tsrc;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_addr <= io_lsu_req_bits_0_bits_addr;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_addr <= wb_req_0_addr;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_addr <= prober_req_0_addr;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_addr <= prefetch_req_0_addr;
    end else begin
      s1_req_0_addr <= _T_35_0_addr;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_data <= io_lsu_req_bits_0_bits_data;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_data <= 64'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_data <= 64'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_data <= prefetch_req_0_data;
    end else begin
      s1_req_0_data <= _T_35_0_data;
    end
    if (_T_25) begin // @[dcache.scala 581:21]
      s1_req_0_is_hella <= io_lsu_req_bits_0_bits_is_hella;
    end else if (wb_fire) begin // @[dcache.scala 582:21]
      s1_req_0_is_hella <= 1'h0;
    end else if (prober_fire) begin // @[dcache.scala 583:21]
      s1_req_0_is_hella <= 1'h0;
    end else if (prefetch_fire) begin // @[dcache.scala 584:21]
      s1_req_0_is_hella <= prefetch_req_0_is_hella;
    end else begin
      s1_req_0_is_hella <= _T_35_0_is_hella;
    end
    REG_3 <= _T_138 & _T_142; // @[dcache.scala 637:72]
    if (s1_type == 3'h0) begin // @[dcache.scala 624:29]
      s2_tag_match_way_0 <= s1_replay_way_en;
    end else if (s1_type == 3'h2) begin // @[dcache.scala 625:29]
      s2_tag_match_way_0 <= s1_wb_way_en;
    end else if (s1_type == 3'h3) begin // @[dcache.scala 626:29]
      s2_tag_match_way_0 <= s1_mshr_meta_read_way_en;
    end else begin
      s2_tag_match_way_0 <= _T_123;
    end
    s2_req_0_uop_mem_cmd <= s1_req_0_uop_mem_cmd; // @[dcache.scala 631:25]
    REG_4_state <= meta_0_io_resp_0_coh_state; // @[dcache.scala 644:93]
    REG_5_state <= meta_0_io_resp_1_coh_state; // @[dcache.scala 644:93]
    REG_6_state <= meta_0_io_resp_2_coh_state; // @[dcache.scala 644:93]
    REG_7_state <= meta_0_io_resp_3_coh_state; // @[dcache.scala 644:93]
    s2_type <= s1_type; // @[dcache.scala 632:25]
    s2_nack_hit_0 <= s1_req_0_addr[11:6] == prober_io_meta_write_bits_idx & ~prober_io_req_ready; // @[dcache.scala 612:93]
    s2_wb_idx_matches_0 <= s1_req_0_addr[11:6] == wb_io_idx_bits & wb_io_idx_valid; // @[dcache.scala 629:99]
    REG_16 <= s1_send_resp_or_nack_0; // @[dcache.scala 734:44]
    s2_req_0_uop_uses_stq <= s1_req_0_uop_uses_stq; // @[dcache.scala 631:25]
    if (reset) begin // @[dcache.scala 604:25]
      REG <= 1'h0; // @[dcache.scala 604:25]
    end else begin
      REG <= _T_86; // @[dcache.scala 604:25]
    end
    REG_1 <= io_lsu_req_ready & io_lsu_req_valid; // @[Decoupled.scala 40:37]
    REG_2 <= io_lsu_req_bits_0_valid; // @[dcache.scala 610:74]
    if (_T_25) begin // @[dcache.scala 595:33]
      if (_T_25) begin // @[dcache.scala 578:21]
        s1_send_resp_or_nack_0 <= io_lsu_req_bits_0_valid;
      end else begin
        s1_send_resp_or_nack_0 <= _T_31;
      end
    end else begin
      s1_send_resp_or_nack_0 <= _T_70;
    end
    if (_T_25) begin // @[dcache.scala 587:21]
      s1_type <= 3'h4;
    end else if (wb_fire) begin // @[dcache.scala 588:21]
      s1_type <= 3'h2;
    end else if (prober_fire) begin // @[dcache.scala 589:21]
      s1_type <= 3'h1;
    end else if (prefetch_fire) begin // @[dcache.scala 590:21]
      s1_type <= 3'h5;
    end else begin
      s1_type <= _T_41;
    end
    s1_mshr_meta_read_way_en <= mshrs_io_meta_read_bits_way_en; // @[dcache.scala 616:41]
    s1_replay_way_en <= mshrs_io_replay_bits_way_en; // @[dcache.scala 617:41]
    s1_wb_way_en <= wb_io_data_req_bits_way_en; // @[dcache.scala 618:41]
    s2_req_0_uop_uopc <= s1_req_0_uop_uopc; // @[dcache.scala 631:25]
    s2_req_0_uop_inst <= s1_req_0_uop_inst; // @[dcache.scala 631:25]
    s2_req_0_uop_debug_inst <= s1_req_0_uop_debug_inst; // @[dcache.scala 631:25]
    s2_req_0_uop_is_rvc <= s1_req_0_uop_is_rvc; // @[dcache.scala 631:25]
    s2_req_0_uop_debug_pc <= s1_req_0_uop_debug_pc; // @[dcache.scala 631:25]
    s2_req_0_uop_iq_type <= s1_req_0_uop_iq_type; // @[dcache.scala 631:25]
    s2_req_0_uop_fu_code <= s1_req_0_uop_fu_code; // @[dcache.scala 631:25]
    s2_req_0_uop_ctrl_br_type <= s1_req_0_uop_ctrl_br_type; // @[dcache.scala 631:25]
    s2_req_0_uop_ctrl_op1_sel <= s1_req_0_uop_ctrl_op1_sel; // @[dcache.scala 631:25]
    s2_req_0_uop_ctrl_op2_sel <= s1_req_0_uop_ctrl_op2_sel; // @[dcache.scala 631:25]
    s2_req_0_uop_ctrl_imm_sel <= s1_req_0_uop_ctrl_imm_sel; // @[dcache.scala 631:25]
    s2_req_0_uop_ctrl_op_fcn <= s1_req_0_uop_ctrl_op_fcn; // @[dcache.scala 631:25]
    s2_req_0_uop_ctrl_fcn_dw <= s1_req_0_uop_ctrl_fcn_dw; // @[dcache.scala 631:25]
    s2_req_0_uop_ctrl_csr_cmd <= s1_req_0_uop_ctrl_csr_cmd; // @[dcache.scala 631:25]
    s2_req_0_uop_ctrl_is_load <= s1_req_0_uop_ctrl_is_load; // @[dcache.scala 631:25]
    s2_req_0_uop_ctrl_is_sta <= s1_req_0_uop_ctrl_is_sta; // @[dcache.scala 631:25]
    s2_req_0_uop_ctrl_is_std <= s1_req_0_uop_ctrl_is_std; // @[dcache.scala 631:25]
    s2_req_0_uop_iw_state <= s1_req_0_uop_iw_state; // @[dcache.scala 631:25]
    s2_req_0_uop_iw_p1_poisoned <= s1_req_0_uop_iw_p1_poisoned; // @[dcache.scala 631:25]
    s2_req_0_uop_iw_p2_poisoned <= s1_req_0_uop_iw_p2_poisoned; // @[dcache.scala 631:25]
    s2_req_0_uop_is_br <= s1_req_0_uop_is_br; // @[dcache.scala 631:25]
    s2_req_0_uop_is_jalr <= s1_req_0_uop_is_jalr; // @[dcache.scala 631:25]
    s2_req_0_uop_is_jal <= s1_req_0_uop_is_jal; // @[dcache.scala 631:25]
    s2_req_0_uop_is_sfb <= s1_req_0_uop_is_sfb; // @[dcache.scala 631:25]
    s2_req_0_uop_br_mask <= s1_req_0_uop_br_mask & _T_73; // @[util.scala 85:25]
    s2_req_0_uop_br_tag <= s1_req_0_uop_br_tag; // @[dcache.scala 631:25]
    s2_req_0_uop_ftq_idx <= s1_req_0_uop_ftq_idx; // @[dcache.scala 631:25]
    s2_req_0_uop_edge_inst <= s1_req_0_uop_edge_inst; // @[dcache.scala 631:25]
    s2_req_0_uop_pc_lob <= s1_req_0_uop_pc_lob; // @[dcache.scala 631:25]
    s2_req_0_uop_taken <= s1_req_0_uop_taken; // @[dcache.scala 631:25]
    s2_req_0_uop_imm_packed <= s1_req_0_uop_imm_packed; // @[dcache.scala 631:25]
    s2_req_0_uop_csr_addr <= s1_req_0_uop_csr_addr; // @[dcache.scala 631:25]
    s2_req_0_uop_rob_idx <= s1_req_0_uop_rob_idx; // @[dcache.scala 631:25]
    s2_req_0_uop_ldq_idx <= s1_req_0_uop_ldq_idx; // @[dcache.scala 631:25]
    s2_req_0_uop_stq_idx <= s1_req_0_uop_stq_idx; // @[dcache.scala 631:25]
    s2_req_0_uop_rxq_idx <= s1_req_0_uop_rxq_idx; // @[dcache.scala 631:25]
    s2_req_0_uop_pdst <= s1_req_0_uop_pdst; // @[dcache.scala 631:25]
    s2_req_0_uop_prs1 <= s1_req_0_uop_prs1; // @[dcache.scala 631:25]
    s2_req_0_uop_prs2 <= s1_req_0_uop_prs2; // @[dcache.scala 631:25]
    s2_req_0_uop_prs3 <= s1_req_0_uop_prs3; // @[dcache.scala 631:25]
    s2_req_0_uop_ppred <= s1_req_0_uop_ppred; // @[dcache.scala 631:25]
    s2_req_0_uop_prs1_busy <= s1_req_0_uop_prs1_busy; // @[dcache.scala 631:25]
    s2_req_0_uop_prs2_busy <= s1_req_0_uop_prs2_busy; // @[dcache.scala 631:25]
    s2_req_0_uop_prs3_busy <= s1_req_0_uop_prs3_busy; // @[dcache.scala 631:25]
    s2_req_0_uop_ppred_busy <= s1_req_0_uop_ppred_busy; // @[dcache.scala 631:25]
    s2_req_0_uop_stale_pdst <= s1_req_0_uop_stale_pdst; // @[dcache.scala 631:25]
    s2_req_0_uop_exception <= s1_req_0_uop_exception; // @[dcache.scala 631:25]
    s2_req_0_uop_exc_cause <= s1_req_0_uop_exc_cause; // @[dcache.scala 631:25]
    s2_req_0_uop_bypassable <= s1_req_0_uop_bypassable; // @[dcache.scala 631:25]
    s2_req_0_uop_mem_size <= s1_req_0_uop_mem_size; // @[dcache.scala 631:25]
    s2_req_0_uop_mem_signed <= s1_req_0_uop_mem_signed; // @[dcache.scala 631:25]
    s2_req_0_uop_is_fence <= s1_req_0_uop_is_fence; // @[dcache.scala 631:25]
    s2_req_0_uop_is_fencei <= s1_req_0_uop_is_fencei; // @[dcache.scala 631:25]
    s2_req_0_uop_is_amo <= s1_req_0_uop_is_amo; // @[dcache.scala 631:25]
    s2_req_0_uop_uses_ldq <= s1_req_0_uop_uses_ldq; // @[dcache.scala 631:25]
    s2_req_0_uop_is_sys_pc2epc <= s1_req_0_uop_is_sys_pc2epc; // @[dcache.scala 631:25]
    s2_req_0_uop_is_unique <= s1_req_0_uop_is_unique; // @[dcache.scala 631:25]
    s2_req_0_uop_flush_on_commit <= s1_req_0_uop_flush_on_commit; // @[dcache.scala 631:25]
    s2_req_0_uop_ldst_is_rs1 <= s1_req_0_uop_ldst_is_rs1; // @[dcache.scala 631:25]
    s2_req_0_uop_ldst <= s1_req_0_uop_ldst; // @[dcache.scala 631:25]
    s2_req_0_uop_lrs1 <= s1_req_0_uop_lrs1; // @[dcache.scala 631:25]
    s2_req_0_uop_lrs2 <= s1_req_0_uop_lrs2; // @[dcache.scala 631:25]
    s2_req_0_uop_lrs3 <= s1_req_0_uop_lrs3; // @[dcache.scala 631:25]
    s2_req_0_uop_ldst_val <= s1_req_0_uop_ldst_val; // @[dcache.scala 631:25]
    s2_req_0_uop_dst_rtype <= s1_req_0_uop_dst_rtype; // @[dcache.scala 631:25]
    s2_req_0_uop_lrs1_rtype <= s1_req_0_uop_lrs1_rtype; // @[dcache.scala 631:25]
    s2_req_0_uop_lrs2_rtype <= s1_req_0_uop_lrs2_rtype; // @[dcache.scala 631:25]
    s2_req_0_uop_frs3_en <= s1_req_0_uop_frs3_en; // @[dcache.scala 631:25]
    s2_req_0_uop_fp_val <= s1_req_0_uop_fp_val; // @[dcache.scala 631:25]
    s2_req_0_uop_fp_single <= s1_req_0_uop_fp_single; // @[dcache.scala 631:25]
    s2_req_0_uop_xcpt_pf_if <= s1_req_0_uop_xcpt_pf_if; // @[dcache.scala 631:25]
    s2_req_0_uop_xcpt_ae_if <= s1_req_0_uop_xcpt_ae_if; // @[dcache.scala 631:25]
    s2_req_0_uop_xcpt_ma_if <= s1_req_0_uop_xcpt_ma_if; // @[dcache.scala 631:25]
    s2_req_0_uop_bp_debug_if <= s1_req_0_uop_bp_debug_if; // @[dcache.scala 631:25]
    s2_req_0_uop_bp_xcpt_if <= s1_req_0_uop_bp_xcpt_if; // @[dcache.scala 631:25]
    s2_req_0_uop_debug_fsrc <= s1_req_0_uop_debug_fsrc; // @[dcache.scala 631:25]
    s2_req_0_uop_debug_tsrc <= s1_req_0_uop_debug_tsrc; // @[dcache.scala 631:25]
    s2_req_0_addr <= s1_req_0_addr; // @[dcache.scala 631:25]
    s2_req_0_data <= s1_req_0_data; // @[dcache.scala 631:25]
    s2_req_0_is_hella <= s1_req_0_is_hella; // @[dcache.scala 631:25]
    if (reset) begin // @[dcache.scala 656:35]
      debug_sc_fail_addr <= 40'h0; // @[dcache.scala 656:35]
    end else if (REG_3) begin // @[dcache.scala 688:22]
      if (!(s2_req_0_addr == debug_sc_fail_addr)) begin // @[dcache.scala 689:50]
        if (s2_sc_fail) begin // @[dcache.scala 696:25]
          debug_sc_fail_addr <= s2_req_0_addr; // @[dcache.scala 697:28]
        end
      end
    end
    if (reset) begin // @[dcache.scala 657:35]
      debug_sc_fail_cnt <= 8'h0; // @[dcache.scala 657:35]
    end else if (REG_3) begin // @[dcache.scala 688:22]
      if (s2_req_0_addr == debug_sc_fail_addr) begin // @[dcache.scala 689:50]
        if (s2_sc_fail) begin // @[dcache.scala 690:25]
          debug_sc_fail_cnt <= _T_316; // @[dcache.scala 691:27]
        end else begin
          debug_sc_fail_cnt <= _GEN_7;
        end
      end else if (s2_sc_fail) begin // @[dcache.scala 696:25]
        debug_sc_fail_cnt <= 8'h1; // @[dcache.scala 698:28]
      end
    end
    if (reset) begin // @[dcache.scala 659:27]
      lrsc_count <= 7'h0; // @[dcache.scala 659:27]
    end else if (_T_313) begin // @[dcache.scala 683:20]
      lrsc_count <= 7'h0; // @[dcache.scala 684:18]
    end else if (_T_301) begin // @[dcache.scala 668:88]
      if (_T_290) begin // @[dcache.scala 673:29]
        lrsc_count <= 7'h0; // @[dcache.scala 674:18]
      end else begin
        lrsc_count <= _GEN_1;
      end
    end else if (lrsc_count > 7'h0) begin // @[dcache.scala 666:27]
      lrsc_count <= _T_292; // @[dcache.scala 666:40]
    end
    if (_T_301) begin // @[dcache.scala 668:88]
      if (s2_lr) begin // @[dcache.scala 669:18]
        lrsc_addr <= s2_req_0_addr[39:6]; // @[dcache.scala 671:17]
      end
    end
    REG_8 <= s1_req_0_addr[11:6] == prober_io_meta_write_bits_idx & ~prober_io_req_ready; // @[dcache.scala 612:93]
    REG_9 <= s1_req_0_addr[11:6] == prober_io_meta_write_bits_idx & ~prober_io_req_ready; // @[dcache.scala 612:93]
    REG_10 <= lfsr[1:0]; // @[package.scala 154:13]
    REG_11_coh_state <= meta_0_io_resp_0_coh_state; // @[dcache.scala 718:88]
    REG_11_tag <= meta_0_io_resp_0_tag; // @[dcache.scala 718:88]
    REG_12_coh_state <= meta_0_io_resp_1_coh_state; // @[dcache.scala 718:88]
    REG_12_tag <= meta_0_io_resp_1_tag; // @[dcache.scala 718:88]
    REG_13_coh_state <= meta_0_io_resp_2_coh_state; // @[dcache.scala 718:88]
    REG_13_tag <= meta_0_io_resp_2_tag; // @[dcache.scala 718:88]
    REG_14_coh_state <= meta_0_io_resp_3_coh_state; // @[dcache.scala 718:88]
    REG_14_tag <= meta_0_io_resp_3_tag; // @[dcache.scala 718:88]
    REG_15 <= s1_send_resp_or_nack_0; // @[dcache.scala 732:44]
    REG_17_0_coh_state <= meta_0_io_resp_0_coh_state; // @[dcache.scala 772:70]
    REG_17_0_tag <= meta_0_io_resp_0_tag; // @[dcache.scala 772:70]
    REG_17_1_coh_state <= meta_0_io_resp_1_coh_state; // @[dcache.scala 772:70]
    REG_17_1_tag <= meta_0_io_resp_1_tag; // @[dcache.scala 772:70]
    REG_17_2_coh_state <= meta_0_io_resp_2_coh_state; // @[dcache.scala 772:70]
    REG_17_2_tag <= meta_0_io_resp_2_tag; // @[dcache.scala 772:70]
    REG_17_3_coh_state <= meta_0_io_resp_3_coh_state; // @[dcache.scala 772:70]
    REG_17_3_tag <= meta_0_io_resp_3_tag; // @[dcache.scala 772:70]
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft <= 9'h0; // @[Arbiter.scala 87:30]
    end else if (latch) begin // @[Arbiter.scala 113:23]
      beatsLeft <= initBeats;
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state_0 <= earlyWinner_0;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state_1 <= earlyWinner_1;
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_beatsLeft_T_2) begin // @[Edges.scala 234:17]
      if (first) begin // @[Edges.scala 235:21]
        if (beats1_opdata) begin // @[Edges.scala 220:14]
          counter <= beats1_decode;
        end else begin
          counter <= 9'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter_1 <= 9'h0; // @[Edges.scala 228:27]
    end else if (_T_593) begin // @[Edges.scala 234:17]
      if (first_1) begin // @[Edges.scala 235:21]
        if (beats1_opdata_1) begin // @[Edges.scala 220:14]
          counter_1 <= beats1_decode_1;
        end else begin
          counter_1 <= 9'h0;
        end
      end else begin
        counter_1 <= counter1_1;
      end
    end
    s3_valid <= _T_678 & ~(s2_send_nack_0 & s2_nack_0); // @[dcache.scala 871:38]
    s3_req_addr <= s2_req_0_addr; // @[dcache.scala 869:25]
    s3_req_data <= amoalu_io_out; // @[dcache.scala 902:15]
    s4_valid <= s3_valid; // @[dcache.scala 880:25]
    s4_req_addr <= s3_req_addr; // @[dcache.scala 879:25]
    s4_req_data <= s3_req_data; // @[dcache.scala 879:25]
    s5_valid <= s4_valid; // @[dcache.scala 882:25]
    s5_req_addr <= s4_req_addr; // @[dcache.scala 881:25]
    s5_req_data <= s4_req_data; // @[dcache.scala 881:25]
    s3_way <= s2_tag_match_way_0; // @[dcache.scala 903:25]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(_T_10 ^ _T_11) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at dcache.scala:547 assert(!(wb.io.meta_read.fire() ^ wb.io.data_req.fire()))\n"); // @[dcache.scala 547:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(_T_10 ^ _T_11) | reset)) begin
          $fatal; // @[dcache.scala 547:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(io_lsu_s1_kill_0 & ~REG_1 & ~REG_2) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at dcache.scala:610 assert(!(io.lsu.s1_kill(w) && !RegNext(io.lsu.req.fire()) && !RegNext(io.lsu.req.bits(w).valid)))\n"
            ); // @[dcache.scala 610:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_lsu_s1_kill_0 & ~REG_1 & ~REG_2) | reset)) begin
          $fatal; // @[dcache.scala 610:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(_T_260 & _T_354) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Replays should always hit\n    at dcache.scala:650 assert(!(s2_type === t_replay && !s2_hit(0)), \"Replays should always hit\")\n"
            ); // @[dcache.scala 650:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(_T_260 & _T_354) | reset)) begin
          $fatal; // @[dcache.scala 650:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(_T_261 & _T_354) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Writeback should always see data hit\n    at dcache.scala:651 assert(!(s2_type === t_wb && !s2_hit(0)), \"Writeback should always see data hit\")\n"
            ); // @[dcache.scala 651:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(_T_261 & _T_354) | reset)) begin
          $fatal; // @[dcache.scala 651:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(debug_sc_fail_cnt < 8'h64 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: L1DCache failed too many SCs in a row\n    at dcache.scala:702 assert(debug_sc_fail_cnt < 100.U, \"L1DCache failed too many SCs in a row\")\n"
            ); // @[dcache.scala 702:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(debug_sc_fail_cnt < 8'h64 | reset)) begin
          $fatal; // @[dcache.scala 702:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(s2_send_resp_0 & s2_send_nack_0) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at dcache.scala:736 assert(!(s2_send_resp(w) && s2_send_nack(w)))\n"); // @[dcache.scala 736:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(s2_send_resp_0 & s2_send_nack_0) | reset)) begin
          $fatal; // @[dcache.scala 736:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(mshrs_io_req_0_valid & _T_260) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Replays should not need to go back into MSHRs\n    at dcache.scala:757 assert(!(mshrs.io.req(w).valid && s2_type === t_replay), \"Replays should not need to go back into MSHRs\")\n"
            ); // @[dcache.scala 757:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(mshrs_io_req_0_valid & _T_260) | reset)) begin
          $fatal; // @[dcache.scala 757:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~earlyWinner_0 | ~earlyWinner_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
            ); // @[Arbiter.scala 105:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~earlyWinner_0 | ~earlyWinner_1 | reset)) begin
          $fatal; // @[Arbiter.scala 105:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(out_earlyValid | out_1_earlyValid) | _prefixOR_T | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            ); // @[Arbiter.scala 107:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(out_earlyValid | out_1_earlyValid) | _prefixOR_T | reset)) begin
          $fatal; // @[Arbiter.scala 107:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_558 | _T_557 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            ); // @[Arbiter.scala 108:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_558 | _T_557 | reset)) begin
          $fatal; // @[Arbiter.scala 108:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(io_lsu_nack_0_valid & s2_type != 3'h4) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at dcache.scala:865 assert(!(io.lsu.nack(w).valid && s2_type =/= t_lsu))\n"); // @[dcache.scala 865:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_lsu_nack_0_valid & s2_type != 3'h4) | reset)) begin
          $fatal; // @[dcache.scala 865:11]
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
  s1_req_0_uop_uopc = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  s1_req_0_uop_inst = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  s1_req_0_uop_debug_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  s1_req_0_uop_is_rvc = _RAND_3[0:0];
  _RAND_4 = {2{`RANDOM}};
  s1_req_0_uop_debug_pc = _RAND_4[39:0];
  _RAND_5 = {1{`RANDOM}};
  s1_req_0_uop_iq_type = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  s1_req_0_uop_fu_code = _RAND_6[9:0];
  _RAND_7 = {1{`RANDOM}};
  s1_req_0_uop_ctrl_br_type = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  s1_req_0_uop_ctrl_op1_sel = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  s1_req_0_uop_ctrl_op2_sel = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  s1_req_0_uop_ctrl_imm_sel = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  s1_req_0_uop_ctrl_op_fcn = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  s1_req_0_uop_ctrl_fcn_dw = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s1_req_0_uop_ctrl_csr_cmd = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  s1_req_0_uop_ctrl_is_load = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s1_req_0_uop_ctrl_is_sta = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  s1_req_0_uop_ctrl_is_std = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  s1_req_0_uop_iw_state = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  s1_req_0_uop_iw_p1_poisoned = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  s1_req_0_uop_iw_p2_poisoned = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  s1_req_0_uop_is_br = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  s1_req_0_uop_is_jalr = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  s1_req_0_uop_is_jal = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  s1_req_0_uop_is_sfb = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  s1_req_0_uop_br_mask = _RAND_24[11:0];
  _RAND_25 = {1{`RANDOM}};
  s1_req_0_uop_br_tag = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  s1_req_0_uop_ftq_idx = _RAND_26[4:0];
  _RAND_27 = {1{`RANDOM}};
  s1_req_0_uop_edge_inst = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  s1_req_0_uop_pc_lob = _RAND_28[5:0];
  _RAND_29 = {1{`RANDOM}};
  s1_req_0_uop_taken = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  s1_req_0_uop_imm_packed = _RAND_30[19:0];
  _RAND_31 = {1{`RANDOM}};
  s1_req_0_uop_csr_addr = _RAND_31[11:0];
  _RAND_32 = {1{`RANDOM}};
  s1_req_0_uop_rob_idx = _RAND_32[5:0];
  _RAND_33 = {1{`RANDOM}};
  s1_req_0_uop_ldq_idx = _RAND_33[3:0];
  _RAND_34 = {1{`RANDOM}};
  s1_req_0_uop_stq_idx = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  s1_req_0_uop_rxq_idx = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  s1_req_0_uop_pdst = _RAND_36[5:0];
  _RAND_37 = {1{`RANDOM}};
  s1_req_0_uop_prs1 = _RAND_37[5:0];
  _RAND_38 = {1{`RANDOM}};
  s1_req_0_uop_prs2 = _RAND_38[5:0];
  _RAND_39 = {1{`RANDOM}};
  s1_req_0_uop_prs3 = _RAND_39[5:0];
  _RAND_40 = {1{`RANDOM}};
  s1_req_0_uop_ppred = _RAND_40[4:0];
  _RAND_41 = {1{`RANDOM}};
  s1_req_0_uop_prs1_busy = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  s1_req_0_uop_prs2_busy = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  s1_req_0_uop_prs3_busy = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  s1_req_0_uop_ppred_busy = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  s1_req_0_uop_stale_pdst = _RAND_45[5:0];
  _RAND_46 = {1{`RANDOM}};
  s1_req_0_uop_exception = _RAND_46[0:0];
  _RAND_47 = {2{`RANDOM}};
  s1_req_0_uop_exc_cause = _RAND_47[63:0];
  _RAND_48 = {1{`RANDOM}};
  s1_req_0_uop_bypassable = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  s1_req_0_uop_mem_cmd = _RAND_49[4:0];
  _RAND_50 = {1{`RANDOM}};
  s1_req_0_uop_mem_size = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  s1_req_0_uop_mem_signed = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  s1_req_0_uop_is_fence = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  s1_req_0_uop_is_fencei = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  s1_req_0_uop_is_amo = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  s1_req_0_uop_uses_ldq = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  s1_req_0_uop_uses_stq = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  s1_req_0_uop_is_sys_pc2epc = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  s1_req_0_uop_is_unique = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  s1_req_0_uop_flush_on_commit = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  s1_req_0_uop_ldst_is_rs1 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  s1_req_0_uop_ldst = _RAND_61[5:0];
  _RAND_62 = {1{`RANDOM}};
  s1_req_0_uop_lrs1 = _RAND_62[5:0];
  _RAND_63 = {1{`RANDOM}};
  s1_req_0_uop_lrs2 = _RAND_63[5:0];
  _RAND_64 = {1{`RANDOM}};
  s1_req_0_uop_lrs3 = _RAND_64[5:0];
  _RAND_65 = {1{`RANDOM}};
  s1_req_0_uop_ldst_val = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  s1_req_0_uop_dst_rtype = _RAND_66[1:0];
  _RAND_67 = {1{`RANDOM}};
  s1_req_0_uop_lrs1_rtype = _RAND_67[1:0];
  _RAND_68 = {1{`RANDOM}};
  s1_req_0_uop_lrs2_rtype = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  s1_req_0_uop_frs3_en = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  s1_req_0_uop_fp_val = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  s1_req_0_uop_fp_single = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  s1_req_0_uop_xcpt_pf_if = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  s1_req_0_uop_xcpt_ae_if = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  s1_req_0_uop_xcpt_ma_if = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  s1_req_0_uop_bp_debug_if = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  s1_req_0_uop_bp_xcpt_if = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  s1_req_0_uop_debug_fsrc = _RAND_77[1:0];
  _RAND_78 = {1{`RANDOM}};
  s1_req_0_uop_debug_tsrc = _RAND_78[1:0];
  _RAND_79 = {2{`RANDOM}};
  s1_req_0_addr = _RAND_79[39:0];
  _RAND_80 = {2{`RANDOM}};
  s1_req_0_data = _RAND_80[63:0];
  _RAND_81 = {1{`RANDOM}};
  s1_req_0_is_hella = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  REG_3 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  s2_tag_match_way_0 = _RAND_83[3:0];
  _RAND_84 = {1{`RANDOM}};
  s2_req_0_uop_mem_cmd = _RAND_84[4:0];
  _RAND_85 = {1{`RANDOM}};
  REG_4_state = _RAND_85[1:0];
  _RAND_86 = {1{`RANDOM}};
  REG_5_state = _RAND_86[1:0];
  _RAND_87 = {1{`RANDOM}};
  REG_6_state = _RAND_87[1:0];
  _RAND_88 = {1{`RANDOM}};
  REG_7_state = _RAND_88[1:0];
  _RAND_89 = {1{`RANDOM}};
  s2_type = _RAND_89[2:0];
  _RAND_90 = {1{`RANDOM}};
  s2_nack_hit_0 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  s2_wb_idx_matches_0 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  REG_16 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  s2_req_0_uop_uses_stq = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  REG = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  REG_1 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  REG_2 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  s1_send_resp_or_nack_0 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  s1_type = _RAND_98[2:0];
  _RAND_99 = {1{`RANDOM}};
  s1_mshr_meta_read_way_en = _RAND_99[3:0];
  _RAND_100 = {1{`RANDOM}};
  s1_replay_way_en = _RAND_100[3:0];
  _RAND_101 = {1{`RANDOM}};
  s1_wb_way_en = _RAND_101[3:0];
  _RAND_102 = {1{`RANDOM}};
  s2_req_0_uop_uopc = _RAND_102[6:0];
  _RAND_103 = {1{`RANDOM}};
  s2_req_0_uop_inst = _RAND_103[31:0];
  _RAND_104 = {1{`RANDOM}};
  s2_req_0_uop_debug_inst = _RAND_104[31:0];
  _RAND_105 = {1{`RANDOM}};
  s2_req_0_uop_is_rvc = _RAND_105[0:0];
  _RAND_106 = {2{`RANDOM}};
  s2_req_0_uop_debug_pc = _RAND_106[39:0];
  _RAND_107 = {1{`RANDOM}};
  s2_req_0_uop_iq_type = _RAND_107[2:0];
  _RAND_108 = {1{`RANDOM}};
  s2_req_0_uop_fu_code = _RAND_108[9:0];
  _RAND_109 = {1{`RANDOM}};
  s2_req_0_uop_ctrl_br_type = _RAND_109[3:0];
  _RAND_110 = {1{`RANDOM}};
  s2_req_0_uop_ctrl_op1_sel = _RAND_110[1:0];
  _RAND_111 = {1{`RANDOM}};
  s2_req_0_uop_ctrl_op2_sel = _RAND_111[2:0];
  _RAND_112 = {1{`RANDOM}};
  s2_req_0_uop_ctrl_imm_sel = _RAND_112[2:0];
  _RAND_113 = {1{`RANDOM}};
  s2_req_0_uop_ctrl_op_fcn = _RAND_113[3:0];
  _RAND_114 = {1{`RANDOM}};
  s2_req_0_uop_ctrl_fcn_dw = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  s2_req_0_uop_ctrl_csr_cmd = _RAND_115[2:0];
  _RAND_116 = {1{`RANDOM}};
  s2_req_0_uop_ctrl_is_load = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  s2_req_0_uop_ctrl_is_sta = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  s2_req_0_uop_ctrl_is_std = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  s2_req_0_uop_iw_state = _RAND_119[1:0];
  _RAND_120 = {1{`RANDOM}};
  s2_req_0_uop_iw_p1_poisoned = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  s2_req_0_uop_iw_p2_poisoned = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  s2_req_0_uop_is_br = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  s2_req_0_uop_is_jalr = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  s2_req_0_uop_is_jal = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  s2_req_0_uop_is_sfb = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  s2_req_0_uop_br_mask = _RAND_126[11:0];
  _RAND_127 = {1{`RANDOM}};
  s2_req_0_uop_br_tag = _RAND_127[3:0];
  _RAND_128 = {1{`RANDOM}};
  s2_req_0_uop_ftq_idx = _RAND_128[4:0];
  _RAND_129 = {1{`RANDOM}};
  s2_req_0_uop_edge_inst = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  s2_req_0_uop_pc_lob = _RAND_130[5:0];
  _RAND_131 = {1{`RANDOM}};
  s2_req_0_uop_taken = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  s2_req_0_uop_imm_packed = _RAND_132[19:0];
  _RAND_133 = {1{`RANDOM}};
  s2_req_0_uop_csr_addr = _RAND_133[11:0];
  _RAND_134 = {1{`RANDOM}};
  s2_req_0_uop_rob_idx = _RAND_134[5:0];
  _RAND_135 = {1{`RANDOM}};
  s2_req_0_uop_ldq_idx = _RAND_135[3:0];
  _RAND_136 = {1{`RANDOM}};
  s2_req_0_uop_stq_idx = _RAND_136[3:0];
  _RAND_137 = {1{`RANDOM}};
  s2_req_0_uop_rxq_idx = _RAND_137[1:0];
  _RAND_138 = {1{`RANDOM}};
  s2_req_0_uop_pdst = _RAND_138[5:0];
  _RAND_139 = {1{`RANDOM}};
  s2_req_0_uop_prs1 = _RAND_139[5:0];
  _RAND_140 = {1{`RANDOM}};
  s2_req_0_uop_prs2 = _RAND_140[5:0];
  _RAND_141 = {1{`RANDOM}};
  s2_req_0_uop_prs3 = _RAND_141[5:0];
  _RAND_142 = {1{`RANDOM}};
  s2_req_0_uop_ppred = _RAND_142[4:0];
  _RAND_143 = {1{`RANDOM}};
  s2_req_0_uop_prs1_busy = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  s2_req_0_uop_prs2_busy = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  s2_req_0_uop_prs3_busy = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  s2_req_0_uop_ppred_busy = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  s2_req_0_uop_stale_pdst = _RAND_147[5:0];
  _RAND_148 = {1{`RANDOM}};
  s2_req_0_uop_exception = _RAND_148[0:0];
  _RAND_149 = {2{`RANDOM}};
  s2_req_0_uop_exc_cause = _RAND_149[63:0];
  _RAND_150 = {1{`RANDOM}};
  s2_req_0_uop_bypassable = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  s2_req_0_uop_mem_size = _RAND_151[1:0];
  _RAND_152 = {1{`RANDOM}};
  s2_req_0_uop_mem_signed = _RAND_152[0:0];
  _RAND_153 = {1{`RANDOM}};
  s2_req_0_uop_is_fence = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  s2_req_0_uop_is_fencei = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  s2_req_0_uop_is_amo = _RAND_155[0:0];
  _RAND_156 = {1{`RANDOM}};
  s2_req_0_uop_uses_ldq = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  s2_req_0_uop_is_sys_pc2epc = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  s2_req_0_uop_is_unique = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  s2_req_0_uop_flush_on_commit = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  s2_req_0_uop_ldst_is_rs1 = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  s2_req_0_uop_ldst = _RAND_161[5:0];
  _RAND_162 = {1{`RANDOM}};
  s2_req_0_uop_lrs1 = _RAND_162[5:0];
  _RAND_163 = {1{`RANDOM}};
  s2_req_0_uop_lrs2 = _RAND_163[5:0];
  _RAND_164 = {1{`RANDOM}};
  s2_req_0_uop_lrs3 = _RAND_164[5:0];
  _RAND_165 = {1{`RANDOM}};
  s2_req_0_uop_ldst_val = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  s2_req_0_uop_dst_rtype = _RAND_166[1:0];
  _RAND_167 = {1{`RANDOM}};
  s2_req_0_uop_lrs1_rtype = _RAND_167[1:0];
  _RAND_168 = {1{`RANDOM}};
  s2_req_0_uop_lrs2_rtype = _RAND_168[1:0];
  _RAND_169 = {1{`RANDOM}};
  s2_req_0_uop_frs3_en = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  s2_req_0_uop_fp_val = _RAND_170[0:0];
  _RAND_171 = {1{`RANDOM}};
  s2_req_0_uop_fp_single = _RAND_171[0:0];
  _RAND_172 = {1{`RANDOM}};
  s2_req_0_uop_xcpt_pf_if = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  s2_req_0_uop_xcpt_ae_if = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  s2_req_0_uop_xcpt_ma_if = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  s2_req_0_uop_bp_debug_if = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  s2_req_0_uop_bp_xcpt_if = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  s2_req_0_uop_debug_fsrc = _RAND_177[1:0];
  _RAND_178 = {1{`RANDOM}};
  s2_req_0_uop_debug_tsrc = _RAND_178[1:0];
  _RAND_179 = {2{`RANDOM}};
  s2_req_0_addr = _RAND_179[39:0];
  _RAND_180 = {2{`RANDOM}};
  s2_req_0_data = _RAND_180[63:0];
  _RAND_181 = {1{`RANDOM}};
  s2_req_0_is_hella = _RAND_181[0:0];
  _RAND_182 = {2{`RANDOM}};
  debug_sc_fail_addr = _RAND_182[39:0];
  _RAND_183 = {1{`RANDOM}};
  debug_sc_fail_cnt = _RAND_183[7:0];
  _RAND_184 = {1{`RANDOM}};
  lrsc_count = _RAND_184[6:0];
  _RAND_185 = {2{`RANDOM}};
  lrsc_addr = _RAND_185[33:0];
  _RAND_186 = {1{`RANDOM}};
  REG_8 = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  REG_9 = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  REG_10 = _RAND_188[1:0];
  _RAND_189 = {1{`RANDOM}};
  REG_11_coh_state = _RAND_189[1:0];
  _RAND_190 = {1{`RANDOM}};
  REG_11_tag = _RAND_190[19:0];
  _RAND_191 = {1{`RANDOM}};
  REG_12_coh_state = _RAND_191[1:0];
  _RAND_192 = {1{`RANDOM}};
  REG_12_tag = _RAND_192[19:0];
  _RAND_193 = {1{`RANDOM}};
  REG_13_coh_state = _RAND_193[1:0];
  _RAND_194 = {1{`RANDOM}};
  REG_13_tag = _RAND_194[19:0];
  _RAND_195 = {1{`RANDOM}};
  REG_14_coh_state = _RAND_195[1:0];
  _RAND_196 = {1{`RANDOM}};
  REG_14_tag = _RAND_196[19:0];
  _RAND_197 = {1{`RANDOM}};
  REG_15 = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  REG_17_0_coh_state = _RAND_198[1:0];
  _RAND_199 = {1{`RANDOM}};
  REG_17_0_tag = _RAND_199[19:0];
  _RAND_200 = {1{`RANDOM}};
  REG_17_1_coh_state = _RAND_200[1:0];
  _RAND_201 = {1{`RANDOM}};
  REG_17_1_tag = _RAND_201[19:0];
  _RAND_202 = {1{`RANDOM}};
  REG_17_2_coh_state = _RAND_202[1:0];
  _RAND_203 = {1{`RANDOM}};
  REG_17_2_tag = _RAND_203[19:0];
  _RAND_204 = {1{`RANDOM}};
  REG_17_3_coh_state = _RAND_204[1:0];
  _RAND_205 = {1{`RANDOM}};
  REG_17_3_tag = _RAND_205[19:0];
  _RAND_206 = {1{`RANDOM}};
  beatsLeft = _RAND_206[8:0];
  _RAND_207 = {1{`RANDOM}};
  state_0 = _RAND_207[0:0];
  _RAND_208 = {1{`RANDOM}};
  state_1 = _RAND_208[0:0];
  _RAND_209 = {1{`RANDOM}};
  counter = _RAND_209[8:0];
  _RAND_210 = {1{`RANDOM}};
  counter_1 = _RAND_210[8:0];
  _RAND_211 = {1{`RANDOM}};
  s3_valid = _RAND_211[0:0];
  _RAND_212 = {2{`RANDOM}};
  s3_req_addr = _RAND_212[39:0];
  _RAND_213 = {2{`RANDOM}};
  s3_req_data = _RAND_213[63:0];
  _RAND_214 = {1{`RANDOM}};
  s4_valid = _RAND_214[0:0];
  _RAND_215 = {2{`RANDOM}};
  s4_req_addr = _RAND_215[39:0];
  _RAND_216 = {2{`RANDOM}};
  s4_req_data = _RAND_216[63:0];
  _RAND_217 = {1{`RANDOM}};
  s5_valid = _RAND_217[0:0];
  _RAND_218 = {2{`RANDOM}};
  s5_req_addr = _RAND_218[39:0];
  _RAND_219 = {2{`RANDOM}};
  s5_req_data = _RAND_219[63:0];
  _RAND_220 = {1{`RANDOM}};
  s3_way = _RAND_220[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
