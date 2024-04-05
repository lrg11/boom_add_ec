module BoomMSHRFile(
  input         clock,
  input         reset,
  output        io_req_0_ready,
  input         io_req_0_valid,
  input  [6:0]  io_req_0_bits_uop_uopc,
  input  [31:0] io_req_0_bits_uop_inst,
  input  [31:0] io_req_0_bits_uop_debug_inst,
  input         io_req_0_bits_uop_is_rvc,
  input  [39:0] io_req_0_bits_uop_debug_pc,
  input  [2:0]  io_req_0_bits_uop_iq_type,
  input  [9:0]  io_req_0_bits_uop_fu_code,
  input  [3:0]  io_req_0_bits_uop_ctrl_br_type,
  input  [1:0]  io_req_0_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_req_0_bits_uop_ctrl_op2_sel,
  input  [2:0]  io_req_0_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_req_0_bits_uop_ctrl_op_fcn,
  input         io_req_0_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_req_0_bits_uop_ctrl_csr_cmd,
  input         io_req_0_bits_uop_ctrl_is_load,
  input         io_req_0_bits_uop_ctrl_is_sta,
  input         io_req_0_bits_uop_ctrl_is_std,
  input  [1:0]  io_req_0_bits_uop_iw_state,
  input         io_req_0_bits_uop_iw_p1_poisoned,
  input         io_req_0_bits_uop_iw_p2_poisoned,
  input         io_req_0_bits_uop_is_br,
  input         io_req_0_bits_uop_is_jalr,
  input         io_req_0_bits_uop_is_jal,
  input         io_req_0_bits_uop_is_sfb,
  input  [11:0] io_req_0_bits_uop_br_mask,
  input  [3:0]  io_req_0_bits_uop_br_tag,
  input  [4:0]  io_req_0_bits_uop_ftq_idx,
  input         io_req_0_bits_uop_edge_inst,
  input  [5:0]  io_req_0_bits_uop_pc_lob,
  input         io_req_0_bits_uop_taken,
  input  [19:0] io_req_0_bits_uop_imm_packed,
  input  [11:0] io_req_0_bits_uop_csr_addr,
  input  [5:0]  io_req_0_bits_uop_rob_idx,
  input  [3:0]  io_req_0_bits_uop_ldq_idx,
  input  [3:0]  io_req_0_bits_uop_stq_idx,
  input  [1:0]  io_req_0_bits_uop_rxq_idx,
  input  [5:0]  io_req_0_bits_uop_pdst,
  input  [5:0]  io_req_0_bits_uop_prs1,
  input  [5:0]  io_req_0_bits_uop_prs2,
  input  [5:0]  io_req_0_bits_uop_prs3,
  input  [4:0]  io_req_0_bits_uop_ppred,
  input         io_req_0_bits_uop_prs1_busy,
  input         io_req_0_bits_uop_prs2_busy,
  input         io_req_0_bits_uop_prs3_busy,
  input         io_req_0_bits_uop_ppred_busy,
  input  [5:0]  io_req_0_bits_uop_stale_pdst,
  input         io_req_0_bits_uop_exception,
  input  [63:0] io_req_0_bits_uop_exc_cause,
  input         io_req_0_bits_uop_bypassable,
  input  [4:0]  io_req_0_bits_uop_mem_cmd,
  input  [1:0]  io_req_0_bits_uop_mem_size,
  input         io_req_0_bits_uop_mem_signed,
  input         io_req_0_bits_uop_is_fence,
  input         io_req_0_bits_uop_is_fencei,
  input         io_req_0_bits_uop_is_amo,
  input         io_req_0_bits_uop_uses_ldq,
  input         io_req_0_bits_uop_uses_stq,
  input         io_req_0_bits_uop_is_sys_pc2epc,
  input         io_req_0_bits_uop_is_unique,
  input         io_req_0_bits_uop_flush_on_commit,
  input         io_req_0_bits_uop_ldst_is_rs1,
  input  [5:0]  io_req_0_bits_uop_ldst,
  input  [5:0]  io_req_0_bits_uop_lrs1,
  input  [5:0]  io_req_0_bits_uop_lrs2,
  input  [5:0]  io_req_0_bits_uop_lrs3,
  input         io_req_0_bits_uop_ldst_val,
  input  [1:0]  io_req_0_bits_uop_dst_rtype,
  input  [1:0]  io_req_0_bits_uop_lrs1_rtype,
  input  [1:0]  io_req_0_bits_uop_lrs2_rtype,
  input         io_req_0_bits_uop_frs3_en,
  input         io_req_0_bits_uop_fp_val,
  input         io_req_0_bits_uop_fp_single,
  input         io_req_0_bits_uop_xcpt_pf_if,
  input         io_req_0_bits_uop_xcpt_ae_if,
  input         io_req_0_bits_uop_xcpt_ma_if,
  input         io_req_0_bits_uop_bp_debug_if,
  input         io_req_0_bits_uop_bp_xcpt_if,
  input  [1:0]  io_req_0_bits_uop_debug_fsrc,
  input  [1:0]  io_req_0_bits_uop_debug_tsrc,
  input  [39:0] io_req_0_bits_addr,
  input  [63:0] io_req_0_bits_data,
  input         io_req_0_bits_is_hella,
  input         io_req_0_bits_tag_match,
  input  [1:0]  io_req_0_bits_old_meta_coh_state,
  input  [19:0] io_req_0_bits_old_meta_tag,
  input  [3:0]  io_req_0_bits_way_en,
  input  [4:0]  io_req_0_bits_sdq_id,
  input         io_req_is_probe_0,
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
  output [63:0] io_resp_bits_data,
  output        io_resp_bits_is_hella,
  output        io_secondary_miss_0,
  output        io_block_hit_0,
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
  input         io_exception,
  input  [5:0]  io_rob_pnr_idx,
  input  [5:0]  io_rob_head_idx,
  input         io_mem_acquire_ready,
  output        io_mem_acquire_valid,
  output [2:0]  io_mem_acquire_bits_opcode,
  output [2:0]  io_mem_acquire_bits_param,
  output [3:0]  io_mem_acquire_bits_size,
  output [1:0]  io_mem_acquire_bits_source,
  output [31:0] io_mem_acquire_bits_address,
  output [7:0]  io_mem_acquire_bits_mask,
  output [63:0] io_mem_acquire_bits_data,
  output        io_mem_acquire_bits_corrupt,
  output        io_mem_grant_ready,
  input         io_mem_grant_valid,
  input  [2:0]  io_mem_grant_bits_opcode,
  input  [1:0]  io_mem_grant_bits_param,
  input  [3:0]  io_mem_grant_bits_size,
  input  [1:0]  io_mem_grant_bits_source,
  input  [1:0]  io_mem_grant_bits_sink,
  input         io_mem_grant_bits_denied,
  input  [63:0] io_mem_grant_bits_data,
  input         io_mem_grant_bits_corrupt,
  input         io_mem_finish_ready,
  output        io_mem_finish_valid,
  output [1:0]  io_mem_finish_bits_sink,
  input         io_refill_ready,
  output        io_refill_valid,
  output [3:0]  io_refill_bits_way_en,
  output [11:0] io_refill_bits_addr,
  output        io_refill_bits_wmask,
  output [63:0] io_refill_bits_data,
  input         io_meta_write_ready,
  output        io_meta_write_valid,
  output [5:0]  io_meta_write_bits_idx,
  output [3:0]  io_meta_write_bits_way_en,
  output [19:0] io_meta_write_bits_tag,
  output [1:0]  io_meta_write_bits_data_coh_state,
  output [19:0] io_meta_write_bits_data_tag,
  input         io_meta_read_ready,
  output        io_meta_read_valid,
  output [5:0]  io_meta_read_bits_idx,
  output [3:0]  io_meta_read_bits_way_en,
  output [19:0] io_meta_read_bits_tag,
  input         io_meta_resp_valid,
  input  [1:0]  io_meta_resp_bits_coh_state,
  input  [19:0] io_meta_resp_bits_tag,
  input         io_replay_ready,
  output        io_replay_valid,
  output [6:0]  io_replay_bits_uop_uopc,
  output [31:0] io_replay_bits_uop_inst,
  output [31:0] io_replay_bits_uop_debug_inst,
  output        io_replay_bits_uop_is_rvc,
  output [39:0] io_replay_bits_uop_debug_pc,
  output [2:0]  io_replay_bits_uop_iq_type,
  output [9:0]  io_replay_bits_uop_fu_code,
  output [3:0]  io_replay_bits_uop_ctrl_br_type,
  output [1:0]  io_replay_bits_uop_ctrl_op1_sel,
  output [2:0]  io_replay_bits_uop_ctrl_op2_sel,
  output [2:0]  io_replay_bits_uop_ctrl_imm_sel,
  output [3:0]  io_replay_bits_uop_ctrl_op_fcn,
  output        io_replay_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_replay_bits_uop_ctrl_csr_cmd,
  output        io_replay_bits_uop_ctrl_is_load,
  output        io_replay_bits_uop_ctrl_is_sta,
  output        io_replay_bits_uop_ctrl_is_std,
  output [1:0]  io_replay_bits_uop_iw_state,
  output        io_replay_bits_uop_iw_p1_poisoned,
  output        io_replay_bits_uop_iw_p2_poisoned,
  output        io_replay_bits_uop_is_br,
  output        io_replay_bits_uop_is_jalr,
  output        io_replay_bits_uop_is_jal,
  output        io_replay_bits_uop_is_sfb,
  output [11:0] io_replay_bits_uop_br_mask,
  output [3:0]  io_replay_bits_uop_br_tag,
  output [4:0]  io_replay_bits_uop_ftq_idx,
  output        io_replay_bits_uop_edge_inst,
  output [5:0]  io_replay_bits_uop_pc_lob,
  output        io_replay_bits_uop_taken,
  output [19:0] io_replay_bits_uop_imm_packed,
  output [11:0] io_replay_bits_uop_csr_addr,
  output [5:0]  io_replay_bits_uop_rob_idx,
  output [3:0]  io_replay_bits_uop_ldq_idx,
  output [3:0]  io_replay_bits_uop_stq_idx,
  output [1:0]  io_replay_bits_uop_rxq_idx,
  output [5:0]  io_replay_bits_uop_pdst,
  output [5:0]  io_replay_bits_uop_prs1,
  output [5:0]  io_replay_bits_uop_prs2,
  output [5:0]  io_replay_bits_uop_prs3,
  output [4:0]  io_replay_bits_uop_ppred,
  output        io_replay_bits_uop_prs1_busy,
  output        io_replay_bits_uop_prs2_busy,
  output        io_replay_bits_uop_prs3_busy,
  output        io_replay_bits_uop_ppred_busy,
  output [5:0]  io_replay_bits_uop_stale_pdst,
  output        io_replay_bits_uop_exception,
  output [63:0] io_replay_bits_uop_exc_cause,
  output        io_replay_bits_uop_bypassable,
  output [4:0]  io_replay_bits_uop_mem_cmd,
  output [1:0]  io_replay_bits_uop_mem_size,
  output        io_replay_bits_uop_mem_signed,
  output        io_replay_bits_uop_is_fence,
  output        io_replay_bits_uop_is_fencei,
  output        io_replay_bits_uop_is_amo,
  output        io_replay_bits_uop_uses_ldq,
  output        io_replay_bits_uop_uses_stq,
  output        io_replay_bits_uop_is_sys_pc2epc,
  output        io_replay_bits_uop_is_unique,
  output        io_replay_bits_uop_flush_on_commit,
  output        io_replay_bits_uop_ldst_is_rs1,
  output [5:0]  io_replay_bits_uop_ldst,
  output [5:0]  io_replay_bits_uop_lrs1,
  output [5:0]  io_replay_bits_uop_lrs2,
  output [5:0]  io_replay_bits_uop_lrs3,
  output        io_replay_bits_uop_ldst_val,
  output [1:0]  io_replay_bits_uop_dst_rtype,
  output [1:0]  io_replay_bits_uop_lrs1_rtype,
  output [1:0]  io_replay_bits_uop_lrs2_rtype,
  output        io_replay_bits_uop_frs3_en,
  output        io_replay_bits_uop_fp_val,
  output        io_replay_bits_uop_fp_single,
  output        io_replay_bits_uop_xcpt_pf_if,
  output        io_replay_bits_uop_xcpt_ae_if,
  output        io_replay_bits_uop_xcpt_ma_if,
  output        io_replay_bits_uop_bp_debug_if,
  output        io_replay_bits_uop_bp_xcpt_if,
  output [1:0]  io_replay_bits_uop_debug_fsrc,
  output [1:0]  io_replay_bits_uop_debug_tsrc,
  output [39:0] io_replay_bits_addr,
  output [63:0] io_replay_bits_data,
  output        io_replay_bits_is_hella,
  output        io_replay_bits_tag_match,
  output [1:0]  io_replay_bits_old_meta_coh_state,
  output [19:0] io_replay_bits_old_meta_tag,
  output [3:0]  io_replay_bits_way_en,
  output [4:0]  io_replay_bits_sdq_id,
  input         io_prefetch_ready,
  output        io_prefetch_valid,
  output [6:0]  io_prefetch_bits_uop_uopc,
  output [31:0] io_prefetch_bits_uop_inst,
  output [31:0] io_prefetch_bits_uop_debug_inst,
  output        io_prefetch_bits_uop_is_rvc,
  output [39:0] io_prefetch_bits_uop_debug_pc,
  output [2:0]  io_prefetch_bits_uop_iq_type,
  output [9:0]  io_prefetch_bits_uop_fu_code,
  output [3:0]  io_prefetch_bits_uop_ctrl_br_type,
  output [1:0]  io_prefetch_bits_uop_ctrl_op1_sel,
  output [2:0]  io_prefetch_bits_uop_ctrl_op2_sel,
  output [2:0]  io_prefetch_bits_uop_ctrl_imm_sel,
  output [3:0]  io_prefetch_bits_uop_ctrl_op_fcn,
  output        io_prefetch_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_prefetch_bits_uop_ctrl_csr_cmd,
  output        io_prefetch_bits_uop_ctrl_is_load,
  output        io_prefetch_bits_uop_ctrl_is_sta,
  output        io_prefetch_bits_uop_ctrl_is_std,
  output [1:0]  io_prefetch_bits_uop_iw_state,
  output        io_prefetch_bits_uop_iw_p1_poisoned,
  output        io_prefetch_bits_uop_iw_p2_poisoned,
  output        io_prefetch_bits_uop_is_br,
  output        io_prefetch_bits_uop_is_jalr,
  output        io_prefetch_bits_uop_is_jal,
  output        io_prefetch_bits_uop_is_sfb,
  output [11:0] io_prefetch_bits_uop_br_mask,
  output [3:0]  io_prefetch_bits_uop_br_tag,
  output [4:0]  io_prefetch_bits_uop_ftq_idx,
  output        io_prefetch_bits_uop_edge_inst,
  output [5:0]  io_prefetch_bits_uop_pc_lob,
  output        io_prefetch_bits_uop_taken,
  output [19:0] io_prefetch_bits_uop_imm_packed,
  output [11:0] io_prefetch_bits_uop_csr_addr,
  output [5:0]  io_prefetch_bits_uop_rob_idx,
  output [3:0]  io_prefetch_bits_uop_ldq_idx,
  output [3:0]  io_prefetch_bits_uop_stq_idx,
  output [1:0]  io_prefetch_bits_uop_rxq_idx,
  output [5:0]  io_prefetch_bits_uop_pdst,
  output [5:0]  io_prefetch_bits_uop_prs1,
  output [5:0]  io_prefetch_bits_uop_prs2,
  output [5:0]  io_prefetch_bits_uop_prs3,
  output [4:0]  io_prefetch_bits_uop_ppred,
  output        io_prefetch_bits_uop_prs1_busy,
  output        io_prefetch_bits_uop_prs2_busy,
  output        io_prefetch_bits_uop_prs3_busy,
  output        io_prefetch_bits_uop_ppred_busy,
  output [5:0]  io_prefetch_bits_uop_stale_pdst,
  output        io_prefetch_bits_uop_exception,
  output [63:0] io_prefetch_bits_uop_exc_cause,
  output        io_prefetch_bits_uop_bypassable,
  output [4:0]  io_prefetch_bits_uop_mem_cmd,
  output [1:0]  io_prefetch_bits_uop_mem_size,
  output        io_prefetch_bits_uop_mem_signed,
  output        io_prefetch_bits_uop_is_fence,
  output        io_prefetch_bits_uop_is_fencei,
  output        io_prefetch_bits_uop_is_amo,
  output        io_prefetch_bits_uop_uses_ldq,
  output        io_prefetch_bits_uop_uses_stq,
  output        io_prefetch_bits_uop_is_sys_pc2epc,
  output        io_prefetch_bits_uop_is_unique,
  output        io_prefetch_bits_uop_flush_on_commit,
  output        io_prefetch_bits_uop_ldst_is_rs1,
  output [5:0]  io_prefetch_bits_uop_ldst,
  output [5:0]  io_prefetch_bits_uop_lrs1,
  output [5:0]  io_prefetch_bits_uop_lrs2,
  output [5:0]  io_prefetch_bits_uop_lrs3,
  output        io_prefetch_bits_uop_ldst_val,
  output [1:0]  io_prefetch_bits_uop_dst_rtype,
  output [1:0]  io_prefetch_bits_uop_lrs1_rtype,
  output [1:0]  io_prefetch_bits_uop_lrs2_rtype,
  output        io_prefetch_bits_uop_frs3_en,
  output        io_prefetch_bits_uop_fp_val,
  output        io_prefetch_bits_uop_fp_single,
  output        io_prefetch_bits_uop_xcpt_pf_if,
  output        io_prefetch_bits_uop_xcpt_ae_if,
  output        io_prefetch_bits_uop_xcpt_ma_if,
  output        io_prefetch_bits_uop_bp_debug_if,
  output        io_prefetch_bits_uop_bp_xcpt_if,
  output [1:0]  io_prefetch_bits_uop_debug_fsrc,
  output [1:0]  io_prefetch_bits_uop_debug_tsrc,
  output [39:0] io_prefetch_bits_addr,
  output [63:0] io_prefetch_bits_data,
  output        io_prefetch_bits_is_hella,
  input         io_wb_req_ready,
  output        io_wb_req_valid,
  output [19:0] io_wb_req_bits_tag,
  output [5:0]  io_wb_req_bits_idx,
  output [1:0]  io_wb_req_bits_source,
  output [2:0]  io_wb_req_bits_param,
  output [3:0]  io_wb_req_bits_way_en,
  output        io_wb_req_bits_voluntary,
  input         io_prober_state_valid,
  input  [39:0] io_prober_state_bits,
  input         io_clear_all,
  input         io_wb_resp,
  output        io_fence_rdy,
  output        io_probe_rdy
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
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
  reg [63:0] _RAND_15;
  reg [31:0] _RAND_16;
`endif // RANDOMIZE_REG_INIT
  wire  prefetcher_clock; // @[mshrs.scala 546:65]
  wire  prefetcher_reset; // @[mshrs.scala 546:65]
  wire  prefetcher_io_mshr_avail; // @[mshrs.scala 546:65]
  wire  prefetcher_io_req_val; // @[mshrs.scala 546:65]
  wire [39:0] prefetcher_io_req_addr; // @[mshrs.scala 546:65]
  wire [1:0] prefetcher_io_req_coh_state; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_ready; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_valid; // @[mshrs.scala 546:65]
  wire [6:0] prefetcher_io_prefetch_bits_uop_uopc; // @[mshrs.scala 546:65]
  wire [31:0] prefetcher_io_prefetch_bits_uop_inst; // @[mshrs.scala 546:65]
  wire [31:0] prefetcher_io_prefetch_bits_uop_debug_inst; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_is_rvc; // @[mshrs.scala 546:65]
  wire [39:0] prefetcher_io_prefetch_bits_uop_debug_pc; // @[mshrs.scala 546:65]
  wire [2:0] prefetcher_io_prefetch_bits_uop_iq_type; // @[mshrs.scala 546:65]
  wire [9:0] prefetcher_io_prefetch_bits_uop_fu_code; // @[mshrs.scala 546:65]
  wire [3:0] prefetcher_io_prefetch_bits_uop_ctrl_br_type; // @[mshrs.scala 546:65]
  wire [1:0] prefetcher_io_prefetch_bits_uop_ctrl_op1_sel; // @[mshrs.scala 546:65]
  wire [2:0] prefetcher_io_prefetch_bits_uop_ctrl_op2_sel; // @[mshrs.scala 546:65]
  wire [2:0] prefetcher_io_prefetch_bits_uop_ctrl_imm_sel; // @[mshrs.scala 546:65]
  wire [3:0] prefetcher_io_prefetch_bits_uop_ctrl_op_fcn; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 546:65]
  wire [2:0] prefetcher_io_prefetch_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_ctrl_is_load; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_ctrl_is_sta; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_ctrl_is_std; // @[mshrs.scala 546:65]
  wire [1:0] prefetcher_io_prefetch_bits_uop_iw_state; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_iw_p1_poisoned; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_iw_p2_poisoned; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_is_br; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_is_jalr; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_is_jal; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_is_sfb; // @[mshrs.scala 546:65]
  wire [11:0] prefetcher_io_prefetch_bits_uop_br_mask; // @[mshrs.scala 546:65]
  wire [3:0] prefetcher_io_prefetch_bits_uop_br_tag; // @[mshrs.scala 546:65]
  wire [4:0] prefetcher_io_prefetch_bits_uop_ftq_idx; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_edge_inst; // @[mshrs.scala 546:65]
  wire [5:0] prefetcher_io_prefetch_bits_uop_pc_lob; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_taken; // @[mshrs.scala 546:65]
  wire [19:0] prefetcher_io_prefetch_bits_uop_imm_packed; // @[mshrs.scala 546:65]
  wire [11:0] prefetcher_io_prefetch_bits_uop_csr_addr; // @[mshrs.scala 546:65]
  wire [5:0] prefetcher_io_prefetch_bits_uop_rob_idx; // @[mshrs.scala 546:65]
  wire [3:0] prefetcher_io_prefetch_bits_uop_ldq_idx; // @[mshrs.scala 546:65]
  wire [3:0] prefetcher_io_prefetch_bits_uop_stq_idx; // @[mshrs.scala 546:65]
  wire [1:0] prefetcher_io_prefetch_bits_uop_rxq_idx; // @[mshrs.scala 546:65]
  wire [5:0] prefetcher_io_prefetch_bits_uop_pdst; // @[mshrs.scala 546:65]
  wire [5:0] prefetcher_io_prefetch_bits_uop_prs1; // @[mshrs.scala 546:65]
  wire [5:0] prefetcher_io_prefetch_bits_uop_prs2; // @[mshrs.scala 546:65]
  wire [5:0] prefetcher_io_prefetch_bits_uop_prs3; // @[mshrs.scala 546:65]
  wire [4:0] prefetcher_io_prefetch_bits_uop_ppred; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_prs1_busy; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_prs2_busy; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_prs3_busy; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_ppred_busy; // @[mshrs.scala 546:65]
  wire [5:0] prefetcher_io_prefetch_bits_uop_stale_pdst; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_exception; // @[mshrs.scala 546:65]
  wire [63:0] prefetcher_io_prefetch_bits_uop_exc_cause; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_bypassable; // @[mshrs.scala 546:65]
  wire [4:0] prefetcher_io_prefetch_bits_uop_mem_cmd; // @[mshrs.scala 546:65]
  wire [1:0] prefetcher_io_prefetch_bits_uop_mem_size; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_mem_signed; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_is_fence; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_is_fencei; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_is_amo; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_uses_ldq; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_uses_stq; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_is_sys_pc2epc; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_is_unique; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_flush_on_commit; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_ldst_is_rs1; // @[mshrs.scala 546:65]
  wire [5:0] prefetcher_io_prefetch_bits_uop_ldst; // @[mshrs.scala 546:65]
  wire [5:0] prefetcher_io_prefetch_bits_uop_lrs1; // @[mshrs.scala 546:65]
  wire [5:0] prefetcher_io_prefetch_bits_uop_lrs2; // @[mshrs.scala 546:65]
  wire [5:0] prefetcher_io_prefetch_bits_uop_lrs3; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_ldst_val; // @[mshrs.scala 546:65]
  wire [1:0] prefetcher_io_prefetch_bits_uop_dst_rtype; // @[mshrs.scala 546:65]
  wire [1:0] prefetcher_io_prefetch_bits_uop_lrs1_rtype; // @[mshrs.scala 546:65]
  wire [1:0] prefetcher_io_prefetch_bits_uop_lrs2_rtype; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_frs3_en; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_fp_val; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_fp_single; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_xcpt_pf_if; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_xcpt_ae_if; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_xcpt_ma_if; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_bp_debug_if; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_uop_bp_xcpt_if; // @[mshrs.scala 546:65]
  wire [1:0] prefetcher_io_prefetch_bits_uop_debug_fsrc; // @[mshrs.scala 546:65]
  wire [1:0] prefetcher_io_prefetch_bits_uop_debug_tsrc; // @[mshrs.scala 546:65]
  wire [39:0] prefetcher_io_prefetch_bits_addr; // @[mshrs.scala 546:65]
  wire [63:0] prefetcher_io_prefetch_bits_data; // @[mshrs.scala 546:65]
  wire  prefetcher_io_prefetch_bits_is_hella; // @[mshrs.scala 546:65]
  reg [63:0] sdq [0:16]; // @[mshrs.scala 559:25]
  wire [63:0] sdq_MPORT_3_data; // @[mshrs.scala 559:25]
  wire [4:0] sdq_MPORT_3_addr; // @[mshrs.scala 559:25]
  wire [63:0] sdq_MPORT_data; // @[mshrs.scala 559:25]
  wire [4:0] sdq_MPORT_addr; // @[mshrs.scala 559:25]
  wire  sdq_MPORT_mask; // @[mshrs.scala 559:25]
  wire  sdq_MPORT_en; // @[mshrs.scala 559:25]
  reg [63:0] lb [0:15]; // @[mshrs.scala 568:15]
  wire [63:0] lb_MPORT_2_data; // @[mshrs.scala 568:15]
  wire [3:0] lb_MPORT_2_addr; // @[mshrs.scala 568:15]
  wire [63:0] lb_MPORT_1_data; // @[mshrs.scala 568:15]
  wire [3:0] lb_MPORT_1_addr; // @[mshrs.scala 568:15]
  wire  lb_MPORT_1_mask; // @[mshrs.scala 568:15]
  wire  lb_MPORT_1_en; // @[mshrs.scala 568:15]
  wire  lb_read_arb_clock; // @[mshrs.scala 569:28]
  wire  lb_read_arb_reset; // @[mshrs.scala 569:28]
  wire  lb_read_arb_io_in_0_ready; // @[mshrs.scala 569:28]
  wire  lb_read_arb_io_in_0_valid; // @[mshrs.scala 569:28]
  wire  lb_read_arb_io_in_0_bits_id; // @[mshrs.scala 569:28]
  wire [2:0] lb_read_arb_io_in_0_bits_offset; // @[mshrs.scala 569:28]
  wire  lb_read_arb_io_in_1_ready; // @[mshrs.scala 569:28]
  wire  lb_read_arb_io_in_1_valid; // @[mshrs.scala 569:28]
  wire  lb_read_arb_io_in_1_bits_id; // @[mshrs.scala 569:28]
  wire [2:0] lb_read_arb_io_in_1_bits_offset; // @[mshrs.scala 569:28]
  wire  lb_read_arb_io_out_ready; // @[mshrs.scala 569:28]
  wire  lb_read_arb_io_out_valid; // @[mshrs.scala 569:28]
  wire  lb_read_arb_io_out_bits_id; // @[mshrs.scala 569:28]
  wire [2:0] lb_read_arb_io_out_bits_offset; // @[mshrs.scala 569:28]
  wire  lb_read_arb_io_chosen; // @[mshrs.scala 569:28]
  wire  lb_write_arb_clock; // @[mshrs.scala 570:28]
  wire  lb_write_arb_reset; // @[mshrs.scala 570:28]
  wire  lb_write_arb_io_in_0_ready; // @[mshrs.scala 570:28]
  wire  lb_write_arb_io_in_0_valid; // @[mshrs.scala 570:28]
  wire  lb_write_arb_io_in_0_bits_id; // @[mshrs.scala 570:28]
  wire [2:0] lb_write_arb_io_in_0_bits_offset; // @[mshrs.scala 570:28]
  wire [63:0] lb_write_arb_io_in_0_bits_data; // @[mshrs.scala 570:28]
  wire  lb_write_arb_io_in_1_ready; // @[mshrs.scala 570:28]
  wire  lb_write_arb_io_in_1_valid; // @[mshrs.scala 570:28]
  wire  lb_write_arb_io_in_1_bits_id; // @[mshrs.scala 570:28]
  wire [2:0] lb_write_arb_io_in_1_bits_offset; // @[mshrs.scala 570:28]
  wire [63:0] lb_write_arb_io_in_1_bits_data; // @[mshrs.scala 570:28]
  wire  lb_write_arb_io_out_ready; // @[mshrs.scala 570:28]
  wire  lb_write_arb_io_out_valid; // @[mshrs.scala 570:28]
  wire  lb_write_arb_io_out_bits_id; // @[mshrs.scala 570:28]
  wire [2:0] lb_write_arb_io_out_bits_offset; // @[mshrs.scala 570:28]
  wire [63:0] lb_write_arb_io_out_bits_data; // @[mshrs.scala 570:28]
  wire  lb_write_arb_io_chosen; // @[mshrs.scala 570:28]
  wire  meta_write_arb_clock; // @[mshrs.scala 599:30]
  wire  meta_write_arb_reset; // @[mshrs.scala 599:30]
  wire  meta_write_arb_io_in_0_ready; // @[mshrs.scala 599:30]
  wire  meta_write_arb_io_in_0_valid; // @[mshrs.scala 599:30]
  wire [5:0] meta_write_arb_io_in_0_bits_idx; // @[mshrs.scala 599:30]
  wire [3:0] meta_write_arb_io_in_0_bits_way_en; // @[mshrs.scala 599:30]
  wire [19:0] meta_write_arb_io_in_0_bits_tag; // @[mshrs.scala 599:30]
  wire [1:0] meta_write_arb_io_in_0_bits_data_coh_state; // @[mshrs.scala 599:30]
  wire [19:0] meta_write_arb_io_in_0_bits_data_tag; // @[mshrs.scala 599:30]
  wire  meta_write_arb_io_in_1_ready; // @[mshrs.scala 599:30]
  wire  meta_write_arb_io_in_1_valid; // @[mshrs.scala 599:30]
  wire [5:0] meta_write_arb_io_in_1_bits_idx; // @[mshrs.scala 599:30]
  wire [3:0] meta_write_arb_io_in_1_bits_way_en; // @[mshrs.scala 599:30]
  wire [19:0] meta_write_arb_io_in_1_bits_tag; // @[mshrs.scala 599:30]
  wire [1:0] meta_write_arb_io_in_1_bits_data_coh_state; // @[mshrs.scala 599:30]
  wire [19:0] meta_write_arb_io_in_1_bits_data_tag; // @[mshrs.scala 599:30]
  wire  meta_write_arb_io_out_ready; // @[mshrs.scala 599:30]
  wire  meta_write_arb_io_out_valid; // @[mshrs.scala 599:30]
  wire [5:0] meta_write_arb_io_out_bits_idx; // @[mshrs.scala 599:30]
  wire [3:0] meta_write_arb_io_out_bits_way_en; // @[mshrs.scala 599:30]
  wire [19:0] meta_write_arb_io_out_bits_tag; // @[mshrs.scala 599:30]
  wire [1:0] meta_write_arb_io_out_bits_data_coh_state; // @[mshrs.scala 599:30]
  wire [19:0] meta_write_arb_io_out_bits_data_tag; // @[mshrs.scala 599:30]
  wire  meta_write_arb_io_chosen; // @[mshrs.scala 599:30]
  wire  meta_read_arb_clock; // @[mshrs.scala 600:30]
  wire  meta_read_arb_reset; // @[mshrs.scala 600:30]
  wire  meta_read_arb_io_in_0_ready; // @[mshrs.scala 600:30]
  wire  meta_read_arb_io_in_0_valid; // @[mshrs.scala 600:30]
  wire [5:0] meta_read_arb_io_in_0_bits_idx; // @[mshrs.scala 600:30]
  wire [3:0] meta_read_arb_io_in_0_bits_way_en; // @[mshrs.scala 600:30]
  wire [19:0] meta_read_arb_io_in_0_bits_tag; // @[mshrs.scala 600:30]
  wire  meta_read_arb_io_in_1_ready; // @[mshrs.scala 600:30]
  wire  meta_read_arb_io_in_1_valid; // @[mshrs.scala 600:30]
  wire [5:0] meta_read_arb_io_in_1_bits_idx; // @[mshrs.scala 600:30]
  wire [3:0] meta_read_arb_io_in_1_bits_way_en; // @[mshrs.scala 600:30]
  wire [19:0] meta_read_arb_io_in_1_bits_tag; // @[mshrs.scala 600:30]
  wire  meta_read_arb_io_out_ready; // @[mshrs.scala 600:30]
  wire  meta_read_arb_io_out_valid; // @[mshrs.scala 600:30]
  wire [5:0] meta_read_arb_io_out_bits_idx; // @[mshrs.scala 600:30]
  wire [3:0] meta_read_arb_io_out_bits_way_en; // @[mshrs.scala 600:30]
  wire [19:0] meta_read_arb_io_out_bits_tag; // @[mshrs.scala 600:30]
  wire  meta_read_arb_io_chosen; // @[mshrs.scala 600:30]
  wire  wb_req_arb_clock; // @[mshrs.scala 601:30]
  wire  wb_req_arb_reset; // @[mshrs.scala 601:30]
  wire  wb_req_arb_io_in_0_ready; // @[mshrs.scala 601:30]
  wire  wb_req_arb_io_in_0_valid; // @[mshrs.scala 601:30]
  wire [19:0] wb_req_arb_io_in_0_bits_tag; // @[mshrs.scala 601:30]
  wire [5:0] wb_req_arb_io_in_0_bits_idx; // @[mshrs.scala 601:30]
  wire [1:0] wb_req_arb_io_in_0_bits_source; // @[mshrs.scala 601:30]
  wire [2:0] wb_req_arb_io_in_0_bits_param; // @[mshrs.scala 601:30]
  wire [3:0] wb_req_arb_io_in_0_bits_way_en; // @[mshrs.scala 601:30]
  wire  wb_req_arb_io_in_0_bits_voluntary; // @[mshrs.scala 601:30]
  wire  wb_req_arb_io_in_1_ready; // @[mshrs.scala 601:30]
  wire  wb_req_arb_io_in_1_valid; // @[mshrs.scala 601:30]
  wire [19:0] wb_req_arb_io_in_1_bits_tag; // @[mshrs.scala 601:30]
  wire [5:0] wb_req_arb_io_in_1_bits_idx; // @[mshrs.scala 601:30]
  wire [1:0] wb_req_arb_io_in_1_bits_source; // @[mshrs.scala 601:30]
  wire [2:0] wb_req_arb_io_in_1_bits_param; // @[mshrs.scala 601:30]
  wire [3:0] wb_req_arb_io_in_1_bits_way_en; // @[mshrs.scala 601:30]
  wire  wb_req_arb_io_in_1_bits_voluntary; // @[mshrs.scala 601:30]
  wire  wb_req_arb_io_out_ready; // @[mshrs.scala 601:30]
  wire  wb_req_arb_io_out_valid; // @[mshrs.scala 601:30]
  wire [19:0] wb_req_arb_io_out_bits_tag; // @[mshrs.scala 601:30]
  wire [5:0] wb_req_arb_io_out_bits_idx; // @[mshrs.scala 601:30]
  wire [1:0] wb_req_arb_io_out_bits_source; // @[mshrs.scala 601:30]
  wire [2:0] wb_req_arb_io_out_bits_param; // @[mshrs.scala 601:30]
  wire [3:0] wb_req_arb_io_out_bits_way_en; // @[mshrs.scala 601:30]
  wire  wb_req_arb_io_out_bits_voluntary; // @[mshrs.scala 601:30]
  wire  wb_req_arb_io_chosen; // @[mshrs.scala 601:30]
  wire  replay_arb_clock; // @[mshrs.scala 602:30]
  wire  replay_arb_reset; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_ready; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_valid; // @[mshrs.scala 602:30]
  wire [6:0] replay_arb_io_in_0_bits_uop_uopc; // @[mshrs.scala 602:30]
  wire [31:0] replay_arb_io_in_0_bits_uop_inst; // @[mshrs.scala 602:30]
  wire [31:0] replay_arb_io_in_0_bits_uop_debug_inst; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_is_rvc; // @[mshrs.scala 602:30]
  wire [39:0] replay_arb_io_in_0_bits_uop_debug_pc; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_in_0_bits_uop_iq_type; // @[mshrs.scala 602:30]
  wire [9:0] replay_arb_io_in_0_bits_uop_fu_code; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_0_bits_uop_ctrl_br_type; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_0_bits_uop_ctrl_op1_sel; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_in_0_bits_uop_ctrl_op2_sel; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_in_0_bits_uop_ctrl_imm_sel; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_0_bits_uop_ctrl_op_fcn; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_in_0_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_ctrl_is_load; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_ctrl_is_sta; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_ctrl_is_std; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_0_bits_uop_iw_state; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_iw_p1_poisoned; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_iw_p2_poisoned; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_is_br; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_is_jalr; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_is_jal; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_is_sfb; // @[mshrs.scala 602:30]
  wire [11:0] replay_arb_io_in_0_bits_uop_br_mask; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_0_bits_uop_br_tag; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_in_0_bits_uop_ftq_idx; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_edge_inst; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_0_bits_uop_pc_lob; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_taken; // @[mshrs.scala 602:30]
  wire [19:0] replay_arb_io_in_0_bits_uop_imm_packed; // @[mshrs.scala 602:30]
  wire [11:0] replay_arb_io_in_0_bits_uop_csr_addr; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_0_bits_uop_rob_idx; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_0_bits_uop_ldq_idx; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_0_bits_uop_stq_idx; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_0_bits_uop_rxq_idx; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_0_bits_uop_pdst; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_0_bits_uop_prs1; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_0_bits_uop_prs2; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_0_bits_uop_prs3; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_in_0_bits_uop_ppred; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_prs1_busy; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_prs2_busy; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_prs3_busy; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_ppred_busy; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_0_bits_uop_stale_pdst; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_exception; // @[mshrs.scala 602:30]
  wire [63:0] replay_arb_io_in_0_bits_uop_exc_cause; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_bypassable; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_in_0_bits_uop_mem_cmd; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_0_bits_uop_mem_size; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_mem_signed; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_is_fence; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_is_fencei; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_is_amo; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_uses_ldq; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_uses_stq; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_is_sys_pc2epc; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_is_unique; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_flush_on_commit; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_ldst_is_rs1; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_0_bits_uop_ldst; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_0_bits_uop_lrs1; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_0_bits_uop_lrs2; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_0_bits_uop_lrs3; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_ldst_val; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_0_bits_uop_dst_rtype; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_0_bits_uop_lrs1_rtype; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_0_bits_uop_lrs2_rtype; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_frs3_en; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_fp_val; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_fp_single; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_xcpt_pf_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_xcpt_ae_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_xcpt_ma_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_bp_debug_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_uop_bp_xcpt_if; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_0_bits_uop_debug_fsrc; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_0_bits_uop_debug_tsrc; // @[mshrs.scala 602:30]
  wire [39:0] replay_arb_io_in_0_bits_addr; // @[mshrs.scala 602:30]
  wire [63:0] replay_arb_io_in_0_bits_data; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_is_hella; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_0_bits_tag_match; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_0_bits_old_meta_coh_state; // @[mshrs.scala 602:30]
  wire [19:0] replay_arb_io_in_0_bits_old_meta_tag; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_0_bits_way_en; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_in_0_bits_sdq_id; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_ready; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_valid; // @[mshrs.scala 602:30]
  wire [6:0] replay_arb_io_in_1_bits_uop_uopc; // @[mshrs.scala 602:30]
  wire [31:0] replay_arb_io_in_1_bits_uop_inst; // @[mshrs.scala 602:30]
  wire [31:0] replay_arb_io_in_1_bits_uop_debug_inst; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_is_rvc; // @[mshrs.scala 602:30]
  wire [39:0] replay_arb_io_in_1_bits_uop_debug_pc; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_in_1_bits_uop_iq_type; // @[mshrs.scala 602:30]
  wire [9:0] replay_arb_io_in_1_bits_uop_fu_code; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_1_bits_uop_ctrl_br_type; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_1_bits_uop_ctrl_op1_sel; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_in_1_bits_uop_ctrl_op2_sel; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_in_1_bits_uop_ctrl_imm_sel; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_1_bits_uop_ctrl_op_fcn; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_in_1_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_ctrl_is_load; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_ctrl_is_sta; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_ctrl_is_std; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_1_bits_uop_iw_state; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_iw_p1_poisoned; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_iw_p2_poisoned; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_is_br; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_is_jalr; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_is_jal; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_is_sfb; // @[mshrs.scala 602:30]
  wire [11:0] replay_arb_io_in_1_bits_uop_br_mask; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_1_bits_uop_br_tag; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_in_1_bits_uop_ftq_idx; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_edge_inst; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_1_bits_uop_pc_lob; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_taken; // @[mshrs.scala 602:30]
  wire [19:0] replay_arb_io_in_1_bits_uop_imm_packed; // @[mshrs.scala 602:30]
  wire [11:0] replay_arb_io_in_1_bits_uop_csr_addr; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_1_bits_uop_rob_idx; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_1_bits_uop_ldq_idx; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_1_bits_uop_stq_idx; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_1_bits_uop_rxq_idx; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_1_bits_uop_pdst; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_1_bits_uop_prs1; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_1_bits_uop_prs2; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_1_bits_uop_prs3; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_in_1_bits_uop_ppred; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_prs1_busy; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_prs2_busy; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_prs3_busy; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_ppred_busy; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_1_bits_uop_stale_pdst; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_exception; // @[mshrs.scala 602:30]
  wire [63:0] replay_arb_io_in_1_bits_uop_exc_cause; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_bypassable; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_in_1_bits_uop_mem_cmd; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_1_bits_uop_mem_size; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_mem_signed; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_is_fence; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_is_fencei; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_is_amo; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_uses_ldq; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_uses_stq; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_is_sys_pc2epc; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_is_unique; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_flush_on_commit; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_ldst_is_rs1; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_1_bits_uop_ldst; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_1_bits_uop_lrs1; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_1_bits_uop_lrs2; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_in_1_bits_uop_lrs3; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_ldst_val; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_1_bits_uop_dst_rtype; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_1_bits_uop_lrs1_rtype; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_1_bits_uop_lrs2_rtype; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_frs3_en; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_fp_val; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_fp_single; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_xcpt_pf_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_xcpt_ae_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_xcpt_ma_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_bp_debug_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_uop_bp_xcpt_if; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_1_bits_uop_debug_fsrc; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_1_bits_uop_debug_tsrc; // @[mshrs.scala 602:30]
  wire [39:0] replay_arb_io_in_1_bits_addr; // @[mshrs.scala 602:30]
  wire [63:0] replay_arb_io_in_1_bits_data; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_is_hella; // @[mshrs.scala 602:30]
  wire  replay_arb_io_in_1_bits_tag_match; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_in_1_bits_old_meta_coh_state; // @[mshrs.scala 602:30]
  wire [19:0] replay_arb_io_in_1_bits_old_meta_tag; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_in_1_bits_way_en; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_in_1_bits_sdq_id; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_ready; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_valid; // @[mshrs.scala 602:30]
  wire [6:0] replay_arb_io_out_bits_uop_uopc; // @[mshrs.scala 602:30]
  wire [31:0] replay_arb_io_out_bits_uop_inst; // @[mshrs.scala 602:30]
  wire [31:0] replay_arb_io_out_bits_uop_debug_inst; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_is_rvc; // @[mshrs.scala 602:30]
  wire [39:0] replay_arb_io_out_bits_uop_debug_pc; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_out_bits_uop_iq_type; // @[mshrs.scala 602:30]
  wire [9:0] replay_arb_io_out_bits_uop_fu_code; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_out_bits_uop_ctrl_br_type; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_out_bits_uop_ctrl_op1_sel; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_out_bits_uop_ctrl_op2_sel; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_out_bits_uop_ctrl_imm_sel; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_out_bits_uop_ctrl_op_fcn; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 602:30]
  wire [2:0] replay_arb_io_out_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_ctrl_is_load; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_ctrl_is_sta; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_ctrl_is_std; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_out_bits_uop_iw_state; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_iw_p1_poisoned; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_iw_p2_poisoned; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_is_br; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_is_jalr; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_is_jal; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_is_sfb; // @[mshrs.scala 602:30]
  wire [11:0] replay_arb_io_out_bits_uop_br_mask; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_out_bits_uop_br_tag; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_out_bits_uop_ftq_idx; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_edge_inst; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_out_bits_uop_pc_lob; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_taken; // @[mshrs.scala 602:30]
  wire [19:0] replay_arb_io_out_bits_uop_imm_packed; // @[mshrs.scala 602:30]
  wire [11:0] replay_arb_io_out_bits_uop_csr_addr; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_out_bits_uop_rob_idx; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_out_bits_uop_ldq_idx; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_out_bits_uop_stq_idx; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_out_bits_uop_rxq_idx; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_out_bits_uop_pdst; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_out_bits_uop_prs1; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_out_bits_uop_prs2; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_out_bits_uop_prs3; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_out_bits_uop_ppred; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_prs1_busy; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_prs2_busy; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_prs3_busy; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_ppred_busy; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_out_bits_uop_stale_pdst; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_exception; // @[mshrs.scala 602:30]
  wire [63:0] replay_arb_io_out_bits_uop_exc_cause; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_bypassable; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_out_bits_uop_mem_cmd; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_out_bits_uop_mem_size; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_mem_signed; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_is_fence; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_is_fencei; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_is_amo; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_uses_ldq; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_uses_stq; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_is_sys_pc2epc; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_is_unique; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_flush_on_commit; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_ldst_is_rs1; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_out_bits_uop_ldst; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_out_bits_uop_lrs1; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_out_bits_uop_lrs2; // @[mshrs.scala 602:30]
  wire [5:0] replay_arb_io_out_bits_uop_lrs3; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_ldst_val; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_out_bits_uop_dst_rtype; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_out_bits_uop_lrs1_rtype; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_out_bits_uop_lrs2_rtype; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_frs3_en; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_fp_val; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_fp_single; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_xcpt_pf_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_xcpt_ae_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_xcpt_ma_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_bp_debug_if; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_uop_bp_xcpt_if; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_out_bits_uop_debug_fsrc; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_out_bits_uop_debug_tsrc; // @[mshrs.scala 602:30]
  wire [39:0] replay_arb_io_out_bits_addr; // @[mshrs.scala 602:30]
  wire [63:0] replay_arb_io_out_bits_data; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_is_hella; // @[mshrs.scala 602:30]
  wire  replay_arb_io_out_bits_tag_match; // @[mshrs.scala 602:30]
  wire [1:0] replay_arb_io_out_bits_old_meta_coh_state; // @[mshrs.scala 602:30]
  wire [19:0] replay_arb_io_out_bits_old_meta_tag; // @[mshrs.scala 602:30]
  wire [3:0] replay_arb_io_out_bits_way_en; // @[mshrs.scala 602:30]
  wire [4:0] replay_arb_io_out_bits_sdq_id; // @[mshrs.scala 602:30]
  wire  replay_arb_io_chosen; // @[mshrs.scala 602:30]
  wire  resp_arb_clock; // @[mshrs.scala 603:30]
  wire  resp_arb_reset; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_ready; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_valid; // @[mshrs.scala 603:30]
  wire [6:0] resp_arb_io_in_0_bits_uop_uopc; // @[mshrs.scala 603:30]
  wire [31:0] resp_arb_io_in_0_bits_uop_inst; // @[mshrs.scala 603:30]
  wire [31:0] resp_arb_io_in_0_bits_uop_debug_inst; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_is_rvc; // @[mshrs.scala 603:30]
  wire [39:0] resp_arb_io_in_0_bits_uop_debug_pc; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_0_bits_uop_iq_type; // @[mshrs.scala 603:30]
  wire [9:0] resp_arb_io_in_0_bits_uop_fu_code; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_0_bits_uop_ctrl_br_type; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_0_bits_uop_ctrl_op1_sel; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_0_bits_uop_ctrl_op2_sel; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_0_bits_uop_ctrl_imm_sel; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_0_bits_uop_ctrl_op_fcn; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_0_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_ctrl_is_load; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_ctrl_is_sta; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_ctrl_is_std; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_0_bits_uop_iw_state; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_iw_p1_poisoned; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_iw_p2_poisoned; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_is_br; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_is_jalr; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_is_jal; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_is_sfb; // @[mshrs.scala 603:30]
  wire [11:0] resp_arb_io_in_0_bits_uop_br_mask; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_0_bits_uop_br_tag; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_in_0_bits_uop_ftq_idx; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_edge_inst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_0_bits_uop_pc_lob; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_taken; // @[mshrs.scala 603:30]
  wire [19:0] resp_arb_io_in_0_bits_uop_imm_packed; // @[mshrs.scala 603:30]
  wire [11:0] resp_arb_io_in_0_bits_uop_csr_addr; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_0_bits_uop_rob_idx; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_0_bits_uop_ldq_idx; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_0_bits_uop_stq_idx; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_0_bits_uop_rxq_idx; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_0_bits_uop_pdst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_0_bits_uop_prs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_0_bits_uop_prs2; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_0_bits_uop_prs3; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_in_0_bits_uop_ppred; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_prs1_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_prs2_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_prs3_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_ppred_busy; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_0_bits_uop_stale_pdst; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_exception; // @[mshrs.scala 603:30]
  wire [63:0] resp_arb_io_in_0_bits_uop_exc_cause; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_bypassable; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_in_0_bits_uop_mem_cmd; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_0_bits_uop_mem_size; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_mem_signed; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_is_fence; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_is_fencei; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_is_amo; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_uses_ldq; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_uses_stq; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_is_sys_pc2epc; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_is_unique; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_flush_on_commit; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_ldst_is_rs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_0_bits_uop_ldst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_0_bits_uop_lrs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_0_bits_uop_lrs2; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_0_bits_uop_lrs3; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_ldst_val; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_0_bits_uop_dst_rtype; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_0_bits_uop_lrs1_rtype; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_0_bits_uop_lrs2_rtype; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_frs3_en; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_fp_val; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_fp_single; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_xcpt_pf_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_xcpt_ae_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_xcpt_ma_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_bp_debug_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_uop_bp_xcpt_if; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_0_bits_uop_debug_fsrc; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_0_bits_uop_debug_tsrc; // @[mshrs.scala 603:30]
  wire [63:0] resp_arb_io_in_0_bits_data; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_0_bits_is_hella; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_ready; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_valid; // @[mshrs.scala 603:30]
  wire [6:0] resp_arb_io_in_1_bits_uop_uopc; // @[mshrs.scala 603:30]
  wire [31:0] resp_arb_io_in_1_bits_uop_inst; // @[mshrs.scala 603:30]
  wire [31:0] resp_arb_io_in_1_bits_uop_debug_inst; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_is_rvc; // @[mshrs.scala 603:30]
  wire [39:0] resp_arb_io_in_1_bits_uop_debug_pc; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_1_bits_uop_iq_type; // @[mshrs.scala 603:30]
  wire [9:0] resp_arb_io_in_1_bits_uop_fu_code; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_1_bits_uop_ctrl_br_type; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_1_bits_uop_ctrl_op1_sel; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_1_bits_uop_ctrl_op2_sel; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_1_bits_uop_ctrl_imm_sel; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_1_bits_uop_ctrl_op_fcn; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_1_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_ctrl_is_load; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_ctrl_is_sta; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_ctrl_is_std; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_1_bits_uop_iw_state; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_iw_p1_poisoned; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_iw_p2_poisoned; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_is_br; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_is_jalr; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_is_jal; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_is_sfb; // @[mshrs.scala 603:30]
  wire [11:0] resp_arb_io_in_1_bits_uop_br_mask; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_1_bits_uop_br_tag; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_in_1_bits_uop_ftq_idx; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_edge_inst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_1_bits_uop_pc_lob; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_taken; // @[mshrs.scala 603:30]
  wire [19:0] resp_arb_io_in_1_bits_uop_imm_packed; // @[mshrs.scala 603:30]
  wire [11:0] resp_arb_io_in_1_bits_uop_csr_addr; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_1_bits_uop_rob_idx; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_1_bits_uop_ldq_idx; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_1_bits_uop_stq_idx; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_1_bits_uop_rxq_idx; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_1_bits_uop_pdst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_1_bits_uop_prs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_1_bits_uop_prs2; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_1_bits_uop_prs3; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_in_1_bits_uop_ppred; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_prs1_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_prs2_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_prs3_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_ppred_busy; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_1_bits_uop_stale_pdst; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_exception; // @[mshrs.scala 603:30]
  wire [63:0] resp_arb_io_in_1_bits_uop_exc_cause; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_bypassable; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_in_1_bits_uop_mem_cmd; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_1_bits_uop_mem_size; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_mem_signed; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_is_fence; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_is_fencei; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_is_amo; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_uses_ldq; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_uses_stq; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_is_sys_pc2epc; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_is_unique; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_flush_on_commit; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_ldst_is_rs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_1_bits_uop_ldst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_1_bits_uop_lrs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_1_bits_uop_lrs2; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_1_bits_uop_lrs3; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_ldst_val; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_1_bits_uop_dst_rtype; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_1_bits_uop_lrs1_rtype; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_1_bits_uop_lrs2_rtype; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_frs3_en; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_fp_val; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_fp_single; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_xcpt_pf_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_xcpt_ae_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_xcpt_ma_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_bp_debug_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_uop_bp_xcpt_if; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_1_bits_uop_debug_fsrc; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_1_bits_uop_debug_tsrc; // @[mshrs.scala 603:30]
  wire [63:0] resp_arb_io_in_1_bits_data; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_1_bits_is_hella; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_ready; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_valid; // @[mshrs.scala 603:30]
  wire [6:0] resp_arb_io_in_2_bits_uop_uopc; // @[mshrs.scala 603:30]
  wire [31:0] resp_arb_io_in_2_bits_uop_inst; // @[mshrs.scala 603:30]
  wire [31:0] resp_arb_io_in_2_bits_uop_debug_inst; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_is_rvc; // @[mshrs.scala 603:30]
  wire [39:0] resp_arb_io_in_2_bits_uop_debug_pc; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_2_bits_uop_iq_type; // @[mshrs.scala 603:30]
  wire [9:0] resp_arb_io_in_2_bits_uop_fu_code; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_2_bits_uop_ctrl_br_type; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_2_bits_uop_ctrl_op1_sel; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_2_bits_uop_ctrl_op2_sel; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_2_bits_uop_ctrl_imm_sel; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_2_bits_uop_ctrl_op_fcn; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_in_2_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_ctrl_is_load; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_ctrl_is_sta; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_ctrl_is_std; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_2_bits_uop_iw_state; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_iw_p1_poisoned; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_iw_p2_poisoned; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_is_br; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_is_jalr; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_is_jal; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_is_sfb; // @[mshrs.scala 603:30]
  wire [11:0] resp_arb_io_in_2_bits_uop_br_mask; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_2_bits_uop_br_tag; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_in_2_bits_uop_ftq_idx; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_edge_inst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_2_bits_uop_pc_lob; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_taken; // @[mshrs.scala 603:30]
  wire [19:0] resp_arb_io_in_2_bits_uop_imm_packed; // @[mshrs.scala 603:30]
  wire [11:0] resp_arb_io_in_2_bits_uop_csr_addr; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_2_bits_uop_rob_idx; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_2_bits_uop_ldq_idx; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_in_2_bits_uop_stq_idx; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_2_bits_uop_rxq_idx; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_2_bits_uop_pdst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_2_bits_uop_prs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_2_bits_uop_prs2; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_2_bits_uop_prs3; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_in_2_bits_uop_ppred; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_prs1_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_prs2_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_prs3_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_ppred_busy; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_2_bits_uop_stale_pdst; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_exception; // @[mshrs.scala 603:30]
  wire [63:0] resp_arb_io_in_2_bits_uop_exc_cause; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_bypassable; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_in_2_bits_uop_mem_cmd; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_2_bits_uop_mem_size; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_mem_signed; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_is_fence; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_is_fencei; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_is_amo; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_uses_ldq; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_uses_stq; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_is_sys_pc2epc; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_is_unique; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_flush_on_commit; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_ldst_is_rs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_2_bits_uop_ldst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_2_bits_uop_lrs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_2_bits_uop_lrs2; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_in_2_bits_uop_lrs3; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_ldst_val; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_2_bits_uop_dst_rtype; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_2_bits_uop_lrs1_rtype; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_2_bits_uop_lrs2_rtype; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_frs3_en; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_fp_val; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_fp_single; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_xcpt_pf_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_xcpt_ae_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_xcpt_ma_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_bp_debug_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_uop_bp_xcpt_if; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_2_bits_uop_debug_fsrc; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_in_2_bits_uop_debug_tsrc; // @[mshrs.scala 603:30]
  wire [63:0] resp_arb_io_in_2_bits_data; // @[mshrs.scala 603:30]
  wire  resp_arb_io_in_2_bits_is_hella; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_ready; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_valid; // @[mshrs.scala 603:30]
  wire [6:0] resp_arb_io_out_bits_uop_uopc; // @[mshrs.scala 603:30]
  wire [31:0] resp_arb_io_out_bits_uop_inst; // @[mshrs.scala 603:30]
  wire [31:0] resp_arb_io_out_bits_uop_debug_inst; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_is_rvc; // @[mshrs.scala 603:30]
  wire [39:0] resp_arb_io_out_bits_uop_debug_pc; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_out_bits_uop_iq_type; // @[mshrs.scala 603:30]
  wire [9:0] resp_arb_io_out_bits_uop_fu_code; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_out_bits_uop_ctrl_br_type; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_out_bits_uop_ctrl_op1_sel; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_out_bits_uop_ctrl_op2_sel; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_out_bits_uop_ctrl_imm_sel; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_out_bits_uop_ctrl_op_fcn; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 603:30]
  wire [2:0] resp_arb_io_out_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_ctrl_is_load; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_ctrl_is_sta; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_ctrl_is_std; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_out_bits_uop_iw_state; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_iw_p1_poisoned; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_iw_p2_poisoned; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_is_br; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_is_jalr; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_is_jal; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_is_sfb; // @[mshrs.scala 603:30]
  wire [11:0] resp_arb_io_out_bits_uop_br_mask; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_out_bits_uop_br_tag; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_out_bits_uop_ftq_idx; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_edge_inst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_out_bits_uop_pc_lob; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_taken; // @[mshrs.scala 603:30]
  wire [19:0] resp_arb_io_out_bits_uop_imm_packed; // @[mshrs.scala 603:30]
  wire [11:0] resp_arb_io_out_bits_uop_csr_addr; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_out_bits_uop_rob_idx; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_out_bits_uop_ldq_idx; // @[mshrs.scala 603:30]
  wire [3:0] resp_arb_io_out_bits_uop_stq_idx; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_out_bits_uop_rxq_idx; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_out_bits_uop_pdst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_out_bits_uop_prs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_out_bits_uop_prs2; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_out_bits_uop_prs3; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_out_bits_uop_ppred; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_prs1_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_prs2_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_prs3_busy; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_ppred_busy; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_out_bits_uop_stale_pdst; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_exception; // @[mshrs.scala 603:30]
  wire [63:0] resp_arb_io_out_bits_uop_exc_cause; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_bypassable; // @[mshrs.scala 603:30]
  wire [4:0] resp_arb_io_out_bits_uop_mem_cmd; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_out_bits_uop_mem_size; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_mem_signed; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_is_fence; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_is_fencei; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_is_amo; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_uses_ldq; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_uses_stq; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_is_sys_pc2epc; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_is_unique; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_flush_on_commit; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_ldst_is_rs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_out_bits_uop_ldst; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_out_bits_uop_lrs1; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_out_bits_uop_lrs2; // @[mshrs.scala 603:30]
  wire [5:0] resp_arb_io_out_bits_uop_lrs3; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_ldst_val; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_out_bits_uop_dst_rtype; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_out_bits_uop_lrs1_rtype; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_out_bits_uop_lrs2_rtype; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_frs3_en; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_fp_val; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_fp_single; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_xcpt_pf_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_xcpt_ae_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_xcpt_ma_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_bp_debug_if; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_uop_bp_xcpt_if; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_out_bits_uop_debug_fsrc; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_out_bits_uop_debug_tsrc; // @[mshrs.scala 603:30]
  wire [63:0] resp_arb_io_out_bits_data; // @[mshrs.scala 603:30]
  wire  resp_arb_io_out_bits_is_hella; // @[mshrs.scala 603:30]
  wire [1:0] resp_arb_io_chosen; // @[mshrs.scala 603:30]
  wire  refill_arb_clock; // @[mshrs.scala 604:30]
  wire  refill_arb_reset; // @[mshrs.scala 604:30]
  wire  refill_arb_io_in_0_ready; // @[mshrs.scala 604:30]
  wire  refill_arb_io_in_0_valid; // @[mshrs.scala 604:30]
  wire [3:0] refill_arb_io_in_0_bits_way_en; // @[mshrs.scala 604:30]
  wire [11:0] refill_arb_io_in_0_bits_addr; // @[mshrs.scala 604:30]
  wire  refill_arb_io_in_0_bits_wmask; // @[mshrs.scala 604:30]
  wire [63:0] refill_arb_io_in_0_bits_data; // @[mshrs.scala 604:30]
  wire  refill_arb_io_in_1_ready; // @[mshrs.scala 604:30]
  wire  refill_arb_io_in_1_valid; // @[mshrs.scala 604:30]
  wire [3:0] refill_arb_io_in_1_bits_way_en; // @[mshrs.scala 604:30]
  wire [11:0] refill_arb_io_in_1_bits_addr; // @[mshrs.scala 604:30]
  wire  refill_arb_io_in_1_bits_wmask; // @[mshrs.scala 604:30]
  wire [63:0] refill_arb_io_in_1_bits_data; // @[mshrs.scala 604:30]
  wire  refill_arb_io_out_ready; // @[mshrs.scala 604:30]
  wire  refill_arb_io_out_valid; // @[mshrs.scala 604:30]
  wire [3:0] refill_arb_io_out_bits_way_en; // @[mshrs.scala 604:30]
  wire [11:0] refill_arb_io_out_bits_addr; // @[mshrs.scala 604:30]
  wire  refill_arb_io_out_bits_wmask; // @[mshrs.scala 604:30]
  wire [63:0] refill_arb_io_out_bits_data; // @[mshrs.scala 604:30]
  wire  refill_arb_io_chosen; // @[mshrs.scala 604:30]
  wire  mshrs_0_clock; // @[mshrs.scala 620:22]
  wire  mshrs_0_reset; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_id; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_pri_val; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_pri_rdy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_sec_val; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_sec_rdy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_clear_prefetch; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_0_io_brupdate_b1_resolve_mask; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_0_io_brupdate_b1_mispredict_mask; // @[mshrs.scala 620:22]
  wire [6:0] mshrs_0_io_brupdate_b2_uop_uopc; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_0_io_brupdate_b2_uop_inst; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_0_io_brupdate_b2_uop_debug_inst; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_is_rvc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_0_io_brupdate_b2_uop_debug_pc; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_brupdate_b2_uop_iq_type; // @[mshrs.scala 620:22]
  wire [9:0] mshrs_0_io_brupdate_b2_uop_fu_code; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_brupdate_b2_uop_ctrl_br_type; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_brupdate_b2_uop_ctrl_op1_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_brupdate_b2_uop_ctrl_op2_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_brupdate_b2_uop_ctrl_imm_sel; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_brupdate_b2_uop_ctrl_op_fcn; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_ctrl_fcn_dw; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_brupdate_b2_uop_ctrl_csr_cmd; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_ctrl_is_load; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_ctrl_is_sta; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_ctrl_is_std; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_brupdate_b2_uop_iw_state; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_iw_p1_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_iw_p2_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_is_br; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_is_jalr; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_is_jal; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_is_sfb; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_0_io_brupdate_b2_uop_br_mask; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_brupdate_b2_uop_br_tag; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_brupdate_b2_uop_ftq_idx; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_edge_inst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_brupdate_b2_uop_pc_lob; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_taken; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_0_io_brupdate_b2_uop_imm_packed; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_0_io_brupdate_b2_uop_csr_addr; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_brupdate_b2_uop_rob_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_brupdate_b2_uop_ldq_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_brupdate_b2_uop_stq_idx; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_brupdate_b2_uop_rxq_idx; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_brupdate_b2_uop_pdst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_brupdate_b2_uop_prs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_brupdate_b2_uop_prs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_brupdate_b2_uop_prs3; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_brupdate_b2_uop_ppred; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_prs1_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_prs2_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_prs3_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_ppred_busy; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_brupdate_b2_uop_stale_pdst; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_exception; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_brupdate_b2_uop_exc_cause; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_bypassable; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_brupdate_b2_uop_mem_cmd; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_brupdate_b2_uop_mem_size; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_mem_signed; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_is_fence; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_is_fencei; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_is_amo; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_uses_ldq; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_uses_stq; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_is_sys_pc2epc; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_is_unique; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_flush_on_commit; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_ldst_is_rs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_brupdate_b2_uop_ldst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_brupdate_b2_uop_lrs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_brupdate_b2_uop_lrs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_brupdate_b2_uop_lrs3; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_ldst_val; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_brupdate_b2_uop_dst_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_brupdate_b2_uop_lrs1_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_brupdate_b2_uop_lrs2_rtype; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_frs3_en; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_fp_val; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_fp_single; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_xcpt_pf_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_xcpt_ae_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_xcpt_ma_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_bp_debug_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_uop_bp_xcpt_if; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_brupdate_b2_uop_debug_fsrc; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_brupdate_b2_uop_debug_tsrc; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_valid; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_mispredict; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_brupdate_b2_taken; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_brupdate_b2_cfi_type; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_brupdate_b2_pc_sel; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_0_io_brupdate_b2_jalr_target; // @[mshrs.scala 620:22]
  wire [20:0] mshrs_0_io_brupdate_b2_target_offset; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_exception; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_rob_pnr_idx; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_rob_head_idx; // @[mshrs.scala 620:22]
  wire [6:0] mshrs_0_io_req_uop_uopc; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_0_io_req_uop_inst; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_0_io_req_uop_debug_inst; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_is_rvc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_0_io_req_uop_debug_pc; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_req_uop_iq_type; // @[mshrs.scala 620:22]
  wire [9:0] mshrs_0_io_req_uop_fu_code; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_req_uop_ctrl_br_type; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_req_uop_ctrl_op1_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_req_uop_ctrl_op2_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_req_uop_ctrl_imm_sel; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_req_uop_ctrl_op_fcn; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_ctrl_fcn_dw; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_req_uop_ctrl_csr_cmd; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_ctrl_is_load; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_ctrl_is_sta; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_ctrl_is_std; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_req_uop_iw_state; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_iw_p1_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_iw_p2_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_is_br; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_is_jalr; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_is_jal; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_is_sfb; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_0_io_req_uop_br_mask; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_req_uop_br_tag; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_req_uop_ftq_idx; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_edge_inst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_req_uop_pc_lob; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_taken; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_0_io_req_uop_imm_packed; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_0_io_req_uop_csr_addr; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_req_uop_rob_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_req_uop_ldq_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_req_uop_stq_idx; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_req_uop_rxq_idx; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_req_uop_pdst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_req_uop_prs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_req_uop_prs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_req_uop_prs3; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_req_uop_ppred; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_prs1_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_prs2_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_prs3_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_ppred_busy; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_req_uop_stale_pdst; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_exception; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_req_uop_exc_cause; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_bypassable; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_req_uop_mem_cmd; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_req_uop_mem_size; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_mem_signed; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_is_fence; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_is_fencei; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_is_amo; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_uses_ldq; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_uses_stq; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_is_sys_pc2epc; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_is_unique; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_flush_on_commit; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_ldst_is_rs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_req_uop_ldst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_req_uop_lrs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_req_uop_lrs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_req_uop_lrs3; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_ldst_val; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_req_uop_dst_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_req_uop_lrs1_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_req_uop_lrs2_rtype; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_frs3_en; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_fp_val; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_fp_single; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_xcpt_pf_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_xcpt_ae_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_xcpt_ma_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_bp_debug_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_uop_bp_xcpt_if; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_req_uop_debug_fsrc; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_req_uop_debug_tsrc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_0_io_req_addr; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_req_data; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_is_hella; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_tag_match; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_req_old_meta_coh_state; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_0_io_req_old_meta_tag; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_req_way_en; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_req_sdq_id; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_req_is_probe; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_idx_valid; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_idx_bits; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_way_valid; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_way_bits; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_tag_valid; // @[mshrs.scala 620:22]
  wire [27:0] mshrs_0_io_tag_bits; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_mem_acquire_ready; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_mem_acquire_valid; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_mem_acquire_bits_opcode; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_mem_acquire_bits_param; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_mem_acquire_bits_size; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_mem_acquire_bits_source; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_0_io_mem_acquire_bits_address; // @[mshrs.scala 620:22]
  wire [7:0] mshrs_0_io_mem_acquire_bits_mask; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_mem_acquire_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_mem_acquire_bits_corrupt; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_mem_grant_ready; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_mem_grant_valid; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_mem_grant_bits_opcode; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_mem_grant_bits_param; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_mem_grant_bits_size; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_mem_grant_bits_source; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_mem_grant_bits_sink; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_mem_grant_bits_denied; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_mem_grant_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_mem_grant_bits_corrupt; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_mem_finish_ready; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_mem_finish_valid; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_mem_finish_bits_sink; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_prober_state_valid; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_0_io_prober_state_bits; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_refill_ready; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_refill_valid; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_refill_bits_way_en; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_0_io_refill_bits_addr; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_refill_bits_wmask; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_refill_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_meta_write_ready; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_meta_write_valid; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_meta_write_bits_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_meta_write_bits_way_en; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_0_io_meta_write_bits_tag; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_meta_write_bits_data_coh_state; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_0_io_meta_write_bits_data_tag; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_meta_read_ready; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_meta_read_valid; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_meta_read_bits_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_meta_read_bits_way_en; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_0_io_meta_read_bits_tag; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_meta_resp_valid; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_meta_resp_bits_coh_state; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_0_io_meta_resp_bits_tag; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_wb_req_ready; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_wb_req_valid; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_0_io_wb_req_bits_tag; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_wb_req_bits_idx; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_wb_req_bits_source; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_wb_req_bits_param; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_wb_req_bits_way_en; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_wb_req_bits_voluntary; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_commit_val; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_0_io_commit_addr; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_commit_coh_state; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_lb_read_ready; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_lb_read_valid; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_lb_read_bits_id; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_lb_read_bits_offset; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_lb_resp; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_lb_write_ready; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_lb_write_valid; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_lb_write_bits_id; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_lb_write_bits_offset; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_lb_write_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_ready; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_valid; // @[mshrs.scala 620:22]
  wire [6:0] mshrs_0_io_replay_bits_uop_uopc; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_0_io_replay_bits_uop_inst; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_0_io_replay_bits_uop_debug_inst; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_is_rvc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_0_io_replay_bits_uop_debug_pc; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_replay_bits_uop_iq_type; // @[mshrs.scala 620:22]
  wire [9:0] mshrs_0_io_replay_bits_uop_fu_code; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_replay_bits_uop_ctrl_br_type; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_replay_bits_uop_ctrl_op1_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_replay_bits_uop_ctrl_op2_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_replay_bits_uop_ctrl_imm_sel; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_replay_bits_uop_ctrl_op_fcn; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_replay_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_ctrl_is_load; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_ctrl_is_sta; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_ctrl_is_std; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_replay_bits_uop_iw_state; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_iw_p1_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_iw_p2_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_is_br; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_is_jalr; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_is_jal; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_is_sfb; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_0_io_replay_bits_uop_br_mask; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_replay_bits_uop_br_tag; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_replay_bits_uop_ftq_idx; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_edge_inst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_replay_bits_uop_pc_lob; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_taken; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_0_io_replay_bits_uop_imm_packed; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_0_io_replay_bits_uop_csr_addr; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_replay_bits_uop_rob_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_replay_bits_uop_stq_idx; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_replay_bits_uop_rxq_idx; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_replay_bits_uop_pdst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_replay_bits_uop_prs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_replay_bits_uop_prs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_replay_bits_uop_prs3; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_replay_bits_uop_ppred; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_prs1_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_prs2_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_prs3_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_ppred_busy; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_replay_bits_uop_stale_pdst; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_exception; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_replay_bits_uop_exc_cause; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_bypassable; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_replay_bits_uop_mem_size; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_mem_signed; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_is_fence; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_is_fencei; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_is_amo; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_uses_stq; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_is_sys_pc2epc; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_is_unique; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_flush_on_commit; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_ldst_is_rs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_replay_bits_uop_ldst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_replay_bits_uop_lrs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_replay_bits_uop_lrs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_replay_bits_uop_lrs3; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_ldst_val; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_replay_bits_uop_dst_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_replay_bits_uop_lrs1_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_replay_bits_uop_lrs2_rtype; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_frs3_en; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_fp_val; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_fp_single; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_xcpt_pf_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_xcpt_ae_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_xcpt_ma_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_bp_debug_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_uop_bp_xcpt_if; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_replay_bits_uop_debug_fsrc; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_replay_bits_uop_debug_tsrc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_0_io_replay_bits_addr; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_replay_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_is_hella; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_replay_bits_tag_match; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_replay_bits_old_meta_coh_state; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_0_io_replay_bits_old_meta_tag; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_replay_bits_way_en; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_replay_bits_sdq_id; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_ready; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_valid; // @[mshrs.scala 620:22]
  wire [6:0] mshrs_0_io_resp_bits_uop_uopc; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_0_io_resp_bits_uop_inst; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_0_io_resp_bits_uop_debug_inst; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_is_rvc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_0_io_resp_bits_uop_debug_pc; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_resp_bits_uop_iq_type; // @[mshrs.scala 620:22]
  wire [9:0] mshrs_0_io_resp_bits_uop_fu_code; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_resp_bits_uop_ctrl_br_type; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_resp_bits_uop_ctrl_op1_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_resp_bits_uop_ctrl_op2_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_resp_bits_uop_ctrl_imm_sel; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_resp_bits_uop_ctrl_op_fcn; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_0_io_resp_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_ctrl_is_load; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_ctrl_is_sta; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_ctrl_is_std; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_resp_bits_uop_iw_state; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_iw_p1_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_iw_p2_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_is_br; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_is_jalr; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_is_jal; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_is_sfb; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_0_io_resp_bits_uop_br_mask; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_resp_bits_uop_br_tag; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_resp_bits_uop_ftq_idx; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_edge_inst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_resp_bits_uop_pc_lob; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_taken; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_0_io_resp_bits_uop_imm_packed; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_0_io_resp_bits_uop_csr_addr; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_resp_bits_uop_rob_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_0_io_resp_bits_uop_stq_idx; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_resp_bits_uop_rxq_idx; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_resp_bits_uop_pdst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_resp_bits_uop_prs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_resp_bits_uop_prs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_resp_bits_uop_prs3; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_resp_bits_uop_ppred; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_prs1_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_prs2_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_prs3_busy; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_ppred_busy; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_resp_bits_uop_stale_pdst; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_exception; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_resp_bits_uop_exc_cause; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_bypassable; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_0_io_resp_bits_uop_mem_cmd; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_resp_bits_uop_mem_size; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_mem_signed; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_is_fence; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_is_fencei; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_is_amo; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_uses_stq; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_is_sys_pc2epc; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_is_unique; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_flush_on_commit; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_ldst_is_rs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_resp_bits_uop_ldst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_resp_bits_uop_lrs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_resp_bits_uop_lrs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_0_io_resp_bits_uop_lrs3; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_ldst_val; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_resp_bits_uop_dst_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_resp_bits_uop_lrs1_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_resp_bits_uop_lrs2_rtype; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_frs3_en; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_fp_val; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_fp_single; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_xcpt_pf_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_xcpt_ae_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_xcpt_ma_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_bp_debug_if; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_uop_bp_xcpt_if; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_resp_bits_uop_debug_fsrc; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_0_io_resp_bits_uop_debug_tsrc; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_0_io_resp_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_resp_bits_is_hella; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_wb_resp; // @[mshrs.scala 620:22]
  wire  mshrs_0_io_probe_rdy; // @[mshrs.scala 620:22]
  wire  mshrs_1_clock; // @[mshrs.scala 620:22]
  wire  mshrs_1_reset; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_id; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_pri_val; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_pri_rdy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_sec_val; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_sec_rdy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_clear_prefetch; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_1_io_brupdate_b1_resolve_mask; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_1_io_brupdate_b1_mispredict_mask; // @[mshrs.scala 620:22]
  wire [6:0] mshrs_1_io_brupdate_b2_uop_uopc; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_1_io_brupdate_b2_uop_inst; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_1_io_brupdate_b2_uop_debug_inst; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_is_rvc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_1_io_brupdate_b2_uop_debug_pc; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_brupdate_b2_uop_iq_type; // @[mshrs.scala 620:22]
  wire [9:0] mshrs_1_io_brupdate_b2_uop_fu_code; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_brupdate_b2_uop_ctrl_br_type; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_brupdate_b2_uop_ctrl_op1_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_brupdate_b2_uop_ctrl_op2_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_brupdate_b2_uop_ctrl_imm_sel; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_brupdate_b2_uop_ctrl_op_fcn; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_ctrl_fcn_dw; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_brupdate_b2_uop_ctrl_csr_cmd; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_ctrl_is_load; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_ctrl_is_sta; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_ctrl_is_std; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_brupdate_b2_uop_iw_state; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_iw_p1_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_iw_p2_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_is_br; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_is_jalr; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_is_jal; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_is_sfb; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_1_io_brupdate_b2_uop_br_mask; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_brupdate_b2_uop_br_tag; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_brupdate_b2_uop_ftq_idx; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_edge_inst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_brupdate_b2_uop_pc_lob; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_taken; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_1_io_brupdate_b2_uop_imm_packed; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_1_io_brupdate_b2_uop_csr_addr; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_brupdate_b2_uop_rob_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_brupdate_b2_uop_ldq_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_brupdate_b2_uop_stq_idx; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_brupdate_b2_uop_rxq_idx; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_brupdate_b2_uop_pdst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_brupdate_b2_uop_prs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_brupdate_b2_uop_prs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_brupdate_b2_uop_prs3; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_brupdate_b2_uop_ppred; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_prs1_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_prs2_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_prs3_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_ppred_busy; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_brupdate_b2_uop_stale_pdst; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_exception; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_brupdate_b2_uop_exc_cause; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_bypassable; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_brupdate_b2_uop_mem_cmd; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_brupdate_b2_uop_mem_size; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_mem_signed; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_is_fence; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_is_fencei; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_is_amo; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_uses_ldq; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_uses_stq; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_is_sys_pc2epc; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_is_unique; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_flush_on_commit; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_ldst_is_rs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_brupdate_b2_uop_ldst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_brupdate_b2_uop_lrs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_brupdate_b2_uop_lrs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_brupdate_b2_uop_lrs3; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_ldst_val; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_brupdate_b2_uop_dst_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_brupdate_b2_uop_lrs1_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_brupdate_b2_uop_lrs2_rtype; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_frs3_en; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_fp_val; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_fp_single; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_xcpt_pf_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_xcpt_ae_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_xcpt_ma_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_bp_debug_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_uop_bp_xcpt_if; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_brupdate_b2_uop_debug_fsrc; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_brupdate_b2_uop_debug_tsrc; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_valid; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_mispredict; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_brupdate_b2_taken; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_brupdate_b2_cfi_type; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_brupdate_b2_pc_sel; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_1_io_brupdate_b2_jalr_target; // @[mshrs.scala 620:22]
  wire [20:0] mshrs_1_io_brupdate_b2_target_offset; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_exception; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_rob_pnr_idx; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_rob_head_idx; // @[mshrs.scala 620:22]
  wire [6:0] mshrs_1_io_req_uop_uopc; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_1_io_req_uop_inst; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_1_io_req_uop_debug_inst; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_is_rvc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_1_io_req_uop_debug_pc; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_req_uop_iq_type; // @[mshrs.scala 620:22]
  wire [9:0] mshrs_1_io_req_uop_fu_code; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_req_uop_ctrl_br_type; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_req_uop_ctrl_op1_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_req_uop_ctrl_op2_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_req_uop_ctrl_imm_sel; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_req_uop_ctrl_op_fcn; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_ctrl_fcn_dw; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_req_uop_ctrl_csr_cmd; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_ctrl_is_load; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_ctrl_is_sta; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_ctrl_is_std; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_req_uop_iw_state; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_iw_p1_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_iw_p2_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_is_br; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_is_jalr; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_is_jal; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_is_sfb; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_1_io_req_uop_br_mask; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_req_uop_br_tag; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_req_uop_ftq_idx; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_edge_inst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_req_uop_pc_lob; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_taken; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_1_io_req_uop_imm_packed; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_1_io_req_uop_csr_addr; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_req_uop_rob_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_req_uop_ldq_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_req_uop_stq_idx; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_req_uop_rxq_idx; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_req_uop_pdst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_req_uop_prs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_req_uop_prs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_req_uop_prs3; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_req_uop_ppred; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_prs1_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_prs2_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_prs3_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_ppred_busy; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_req_uop_stale_pdst; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_exception; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_req_uop_exc_cause; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_bypassable; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_req_uop_mem_cmd; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_req_uop_mem_size; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_mem_signed; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_is_fence; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_is_fencei; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_is_amo; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_uses_ldq; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_uses_stq; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_is_sys_pc2epc; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_is_unique; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_flush_on_commit; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_ldst_is_rs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_req_uop_ldst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_req_uop_lrs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_req_uop_lrs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_req_uop_lrs3; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_ldst_val; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_req_uop_dst_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_req_uop_lrs1_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_req_uop_lrs2_rtype; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_frs3_en; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_fp_val; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_fp_single; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_xcpt_pf_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_xcpt_ae_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_xcpt_ma_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_bp_debug_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_uop_bp_xcpt_if; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_req_uop_debug_fsrc; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_req_uop_debug_tsrc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_1_io_req_addr; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_req_data; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_is_hella; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_tag_match; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_req_old_meta_coh_state; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_1_io_req_old_meta_tag; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_req_way_en; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_req_sdq_id; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_req_is_probe; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_idx_valid; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_idx_bits; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_way_valid; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_way_bits; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_tag_valid; // @[mshrs.scala 620:22]
  wire [27:0] mshrs_1_io_tag_bits; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_mem_acquire_ready; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_mem_acquire_valid; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_mem_acquire_bits_opcode; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_mem_acquire_bits_param; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_mem_acquire_bits_size; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_mem_acquire_bits_source; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_1_io_mem_acquire_bits_address; // @[mshrs.scala 620:22]
  wire [7:0] mshrs_1_io_mem_acquire_bits_mask; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_mem_acquire_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_mem_acquire_bits_corrupt; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_mem_grant_ready; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_mem_grant_valid; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_mem_grant_bits_opcode; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_mem_grant_bits_param; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_mem_grant_bits_size; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_mem_grant_bits_source; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_mem_grant_bits_sink; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_mem_grant_bits_denied; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_mem_grant_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_mem_grant_bits_corrupt; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_mem_finish_ready; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_mem_finish_valid; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_mem_finish_bits_sink; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_prober_state_valid; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_1_io_prober_state_bits; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_refill_ready; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_refill_valid; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_refill_bits_way_en; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_1_io_refill_bits_addr; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_refill_bits_wmask; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_refill_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_meta_write_ready; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_meta_write_valid; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_meta_write_bits_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_meta_write_bits_way_en; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_1_io_meta_write_bits_tag; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_meta_write_bits_data_coh_state; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_1_io_meta_write_bits_data_tag; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_meta_read_ready; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_meta_read_valid; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_meta_read_bits_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_meta_read_bits_way_en; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_1_io_meta_read_bits_tag; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_meta_resp_valid; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_meta_resp_bits_coh_state; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_1_io_meta_resp_bits_tag; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_wb_req_ready; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_wb_req_valid; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_1_io_wb_req_bits_tag; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_wb_req_bits_idx; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_wb_req_bits_source; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_wb_req_bits_param; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_wb_req_bits_way_en; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_wb_req_bits_voluntary; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_commit_val; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_1_io_commit_addr; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_commit_coh_state; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_lb_read_ready; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_lb_read_valid; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_lb_read_bits_id; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_lb_read_bits_offset; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_lb_resp; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_lb_write_ready; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_lb_write_valid; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_lb_write_bits_id; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_lb_write_bits_offset; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_lb_write_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_ready; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_valid; // @[mshrs.scala 620:22]
  wire [6:0] mshrs_1_io_replay_bits_uop_uopc; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_1_io_replay_bits_uop_inst; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_1_io_replay_bits_uop_debug_inst; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_is_rvc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_1_io_replay_bits_uop_debug_pc; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_replay_bits_uop_iq_type; // @[mshrs.scala 620:22]
  wire [9:0] mshrs_1_io_replay_bits_uop_fu_code; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_replay_bits_uop_ctrl_br_type; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_replay_bits_uop_ctrl_op1_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_replay_bits_uop_ctrl_op2_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_replay_bits_uop_ctrl_imm_sel; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_replay_bits_uop_ctrl_op_fcn; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_replay_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_ctrl_is_load; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_ctrl_is_sta; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_ctrl_is_std; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_replay_bits_uop_iw_state; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_iw_p1_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_iw_p2_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_is_br; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_is_jalr; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_is_jal; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_is_sfb; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_1_io_replay_bits_uop_br_mask; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_replay_bits_uop_br_tag; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_replay_bits_uop_ftq_idx; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_edge_inst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_replay_bits_uop_pc_lob; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_taken; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_1_io_replay_bits_uop_imm_packed; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_1_io_replay_bits_uop_csr_addr; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_replay_bits_uop_rob_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_replay_bits_uop_stq_idx; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_replay_bits_uop_rxq_idx; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_replay_bits_uop_pdst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_replay_bits_uop_prs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_replay_bits_uop_prs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_replay_bits_uop_prs3; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_replay_bits_uop_ppred; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_prs1_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_prs2_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_prs3_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_ppred_busy; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_replay_bits_uop_stale_pdst; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_exception; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_replay_bits_uop_exc_cause; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_bypassable; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_replay_bits_uop_mem_size; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_mem_signed; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_is_fence; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_is_fencei; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_is_amo; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_uses_stq; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_is_sys_pc2epc; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_is_unique; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_flush_on_commit; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_ldst_is_rs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_replay_bits_uop_ldst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_replay_bits_uop_lrs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_replay_bits_uop_lrs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_replay_bits_uop_lrs3; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_ldst_val; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_replay_bits_uop_dst_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_replay_bits_uop_lrs1_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_replay_bits_uop_lrs2_rtype; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_frs3_en; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_fp_val; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_fp_single; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_xcpt_pf_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_xcpt_ae_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_xcpt_ma_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_bp_debug_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_uop_bp_xcpt_if; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_replay_bits_uop_debug_fsrc; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_replay_bits_uop_debug_tsrc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_1_io_replay_bits_addr; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_replay_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_is_hella; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_replay_bits_tag_match; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_replay_bits_old_meta_coh_state; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_1_io_replay_bits_old_meta_tag; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_replay_bits_way_en; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_replay_bits_sdq_id; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_ready; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_valid; // @[mshrs.scala 620:22]
  wire [6:0] mshrs_1_io_resp_bits_uop_uopc; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_1_io_resp_bits_uop_inst; // @[mshrs.scala 620:22]
  wire [31:0] mshrs_1_io_resp_bits_uop_debug_inst; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_is_rvc; // @[mshrs.scala 620:22]
  wire [39:0] mshrs_1_io_resp_bits_uop_debug_pc; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_resp_bits_uop_iq_type; // @[mshrs.scala 620:22]
  wire [9:0] mshrs_1_io_resp_bits_uop_fu_code; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_resp_bits_uop_ctrl_br_type; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_resp_bits_uop_ctrl_op1_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_resp_bits_uop_ctrl_op2_sel; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_resp_bits_uop_ctrl_imm_sel; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_resp_bits_uop_ctrl_op_fcn; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 620:22]
  wire [2:0] mshrs_1_io_resp_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_ctrl_is_load; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_ctrl_is_sta; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_ctrl_is_std; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_resp_bits_uop_iw_state; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_iw_p1_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_iw_p2_poisoned; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_is_br; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_is_jalr; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_is_jal; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_is_sfb; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_1_io_resp_bits_uop_br_mask; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_resp_bits_uop_br_tag; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_resp_bits_uop_ftq_idx; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_edge_inst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_resp_bits_uop_pc_lob; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_taken; // @[mshrs.scala 620:22]
  wire [19:0] mshrs_1_io_resp_bits_uop_imm_packed; // @[mshrs.scala 620:22]
  wire [11:0] mshrs_1_io_resp_bits_uop_csr_addr; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_resp_bits_uop_rob_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 620:22]
  wire [3:0] mshrs_1_io_resp_bits_uop_stq_idx; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_resp_bits_uop_rxq_idx; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_resp_bits_uop_pdst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_resp_bits_uop_prs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_resp_bits_uop_prs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_resp_bits_uop_prs3; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_resp_bits_uop_ppred; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_prs1_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_prs2_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_prs3_busy; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_ppred_busy; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_resp_bits_uop_stale_pdst; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_exception; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_resp_bits_uop_exc_cause; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_bypassable; // @[mshrs.scala 620:22]
  wire [4:0] mshrs_1_io_resp_bits_uop_mem_cmd; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_resp_bits_uop_mem_size; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_mem_signed; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_is_fence; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_is_fencei; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_is_amo; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_uses_stq; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_is_sys_pc2epc; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_is_unique; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_flush_on_commit; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_ldst_is_rs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_resp_bits_uop_ldst; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_resp_bits_uop_lrs1; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_resp_bits_uop_lrs2; // @[mshrs.scala 620:22]
  wire [5:0] mshrs_1_io_resp_bits_uop_lrs3; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_ldst_val; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_resp_bits_uop_dst_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_resp_bits_uop_lrs1_rtype; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_resp_bits_uop_lrs2_rtype; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_frs3_en; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_fp_val; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_fp_single; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_xcpt_pf_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_xcpt_ae_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_xcpt_ma_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_bp_debug_if; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_uop_bp_xcpt_if; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_resp_bits_uop_debug_fsrc; // @[mshrs.scala 620:22]
  wire [1:0] mshrs_1_io_resp_bits_uop_debug_tsrc; // @[mshrs.scala 620:22]
  wire [63:0] mshrs_1_io_resp_bits_data; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_resp_bits_is_hella; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_wb_resp; // @[mshrs.scala 620:22]
  wire  mshrs_1_io_probe_rdy; // @[mshrs.scala 620:22]
  wire  mmio_alloc_arb_clock; // @[mshrs.scala 703:30]
  wire  mmio_alloc_arb_reset; // @[mshrs.scala 703:30]
  wire  mmio_alloc_arb_io_in_0_ready; // @[mshrs.scala 703:30]
  wire  mmio_alloc_arb_io_in_0_valid; // @[mshrs.scala 703:30]
  wire  mmio_alloc_arb_io_in_0_bits; // @[mshrs.scala 703:30]
  wire  mmio_alloc_arb_io_out_ready; // @[mshrs.scala 703:30]
  wire  mmio_alloc_arb_io_out_valid; // @[mshrs.scala 703:30]
  wire  mmio_alloc_arb_io_out_bits; // @[mshrs.scala 703:30]
  wire  mmios_0_clock; // @[mshrs.scala 710:22]
  wire  mmios_0_reset; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_ready; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_valid; // @[mshrs.scala 710:22]
  wire [6:0] mmios_0_io_req_bits_uop_uopc; // @[mshrs.scala 710:22]
  wire [31:0] mmios_0_io_req_bits_uop_inst; // @[mshrs.scala 710:22]
  wire [31:0] mmios_0_io_req_bits_uop_debug_inst; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_is_rvc; // @[mshrs.scala 710:22]
  wire [39:0] mmios_0_io_req_bits_uop_debug_pc; // @[mshrs.scala 710:22]
  wire [2:0] mmios_0_io_req_bits_uop_iq_type; // @[mshrs.scala 710:22]
  wire [9:0] mmios_0_io_req_bits_uop_fu_code; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_req_bits_uop_ctrl_br_type; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_req_bits_uop_ctrl_op1_sel; // @[mshrs.scala 710:22]
  wire [2:0] mmios_0_io_req_bits_uop_ctrl_op2_sel; // @[mshrs.scala 710:22]
  wire [2:0] mmios_0_io_req_bits_uop_ctrl_imm_sel; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_req_bits_uop_ctrl_op_fcn; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 710:22]
  wire [2:0] mmios_0_io_req_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_ctrl_is_load; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_ctrl_is_sta; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_ctrl_is_std; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_req_bits_uop_iw_state; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_iw_p1_poisoned; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_iw_p2_poisoned; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_is_br; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_is_jalr; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_is_jal; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_is_sfb; // @[mshrs.scala 710:22]
  wire [11:0] mmios_0_io_req_bits_uop_br_mask; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_req_bits_uop_br_tag; // @[mshrs.scala 710:22]
  wire [4:0] mmios_0_io_req_bits_uop_ftq_idx; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_edge_inst; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_req_bits_uop_pc_lob; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_taken; // @[mshrs.scala 710:22]
  wire [19:0] mmios_0_io_req_bits_uop_imm_packed; // @[mshrs.scala 710:22]
  wire [11:0] mmios_0_io_req_bits_uop_csr_addr; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_req_bits_uop_rob_idx; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_req_bits_uop_ldq_idx; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_req_bits_uop_stq_idx; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_req_bits_uop_rxq_idx; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_req_bits_uop_pdst; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_req_bits_uop_prs1; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_req_bits_uop_prs2; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_req_bits_uop_prs3; // @[mshrs.scala 710:22]
  wire [4:0] mmios_0_io_req_bits_uop_ppred; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_prs1_busy; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_prs2_busy; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_prs3_busy; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_ppred_busy; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_req_bits_uop_stale_pdst; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_exception; // @[mshrs.scala 710:22]
  wire [63:0] mmios_0_io_req_bits_uop_exc_cause; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_bypassable; // @[mshrs.scala 710:22]
  wire [4:0] mmios_0_io_req_bits_uop_mem_cmd; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_req_bits_uop_mem_size; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_mem_signed; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_is_fence; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_is_fencei; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_is_amo; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_uses_ldq; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_uses_stq; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_is_sys_pc2epc; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_is_unique; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_flush_on_commit; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_ldst_is_rs1; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_req_bits_uop_ldst; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_req_bits_uop_lrs1; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_req_bits_uop_lrs2; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_req_bits_uop_lrs3; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_ldst_val; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_req_bits_uop_dst_rtype; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_req_bits_uop_lrs1_rtype; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_req_bits_uop_lrs2_rtype; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_frs3_en; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_fp_val; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_fp_single; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_xcpt_pf_if; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_xcpt_ae_if; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_xcpt_ma_if; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_bp_debug_if; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_uop_bp_xcpt_if; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_req_bits_uop_debug_fsrc; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_req_bits_uop_debug_tsrc; // @[mshrs.scala 710:22]
  wire [39:0] mmios_0_io_req_bits_addr; // @[mshrs.scala 710:22]
  wire [63:0] mmios_0_io_req_bits_data; // @[mshrs.scala 710:22]
  wire  mmios_0_io_req_bits_is_hella; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_ready; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_valid; // @[mshrs.scala 710:22]
  wire [6:0] mmios_0_io_resp_bits_uop_uopc; // @[mshrs.scala 710:22]
  wire [31:0] mmios_0_io_resp_bits_uop_inst; // @[mshrs.scala 710:22]
  wire [31:0] mmios_0_io_resp_bits_uop_debug_inst; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_is_rvc; // @[mshrs.scala 710:22]
  wire [39:0] mmios_0_io_resp_bits_uop_debug_pc; // @[mshrs.scala 710:22]
  wire [2:0] mmios_0_io_resp_bits_uop_iq_type; // @[mshrs.scala 710:22]
  wire [9:0] mmios_0_io_resp_bits_uop_fu_code; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_resp_bits_uop_ctrl_br_type; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_resp_bits_uop_ctrl_op1_sel; // @[mshrs.scala 710:22]
  wire [2:0] mmios_0_io_resp_bits_uop_ctrl_op2_sel; // @[mshrs.scala 710:22]
  wire [2:0] mmios_0_io_resp_bits_uop_ctrl_imm_sel; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_resp_bits_uop_ctrl_op_fcn; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 710:22]
  wire [2:0] mmios_0_io_resp_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_ctrl_is_load; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_ctrl_is_sta; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_ctrl_is_std; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_resp_bits_uop_iw_state; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_iw_p1_poisoned; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_iw_p2_poisoned; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_is_br; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_is_jalr; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_is_jal; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_is_sfb; // @[mshrs.scala 710:22]
  wire [11:0] mmios_0_io_resp_bits_uop_br_mask; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_resp_bits_uop_br_tag; // @[mshrs.scala 710:22]
  wire [4:0] mmios_0_io_resp_bits_uop_ftq_idx; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_edge_inst; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_resp_bits_uop_pc_lob; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_taken; // @[mshrs.scala 710:22]
  wire [19:0] mmios_0_io_resp_bits_uop_imm_packed; // @[mshrs.scala 710:22]
  wire [11:0] mmios_0_io_resp_bits_uop_csr_addr; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_resp_bits_uop_rob_idx; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_resp_bits_uop_stq_idx; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_resp_bits_uop_rxq_idx; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_resp_bits_uop_pdst; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_resp_bits_uop_prs1; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_resp_bits_uop_prs2; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_resp_bits_uop_prs3; // @[mshrs.scala 710:22]
  wire [4:0] mmios_0_io_resp_bits_uop_ppred; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_prs1_busy; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_prs2_busy; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_prs3_busy; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_ppred_busy; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_resp_bits_uop_stale_pdst; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_exception; // @[mshrs.scala 710:22]
  wire [63:0] mmios_0_io_resp_bits_uop_exc_cause; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_bypassable; // @[mshrs.scala 710:22]
  wire [4:0] mmios_0_io_resp_bits_uop_mem_cmd; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_resp_bits_uop_mem_size; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_mem_signed; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_is_fence; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_is_fencei; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_is_amo; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_uses_stq; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_is_sys_pc2epc; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_is_unique; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_flush_on_commit; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_ldst_is_rs1; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_resp_bits_uop_ldst; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_resp_bits_uop_lrs1; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_resp_bits_uop_lrs2; // @[mshrs.scala 710:22]
  wire [5:0] mmios_0_io_resp_bits_uop_lrs3; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_ldst_val; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_resp_bits_uop_dst_rtype; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_resp_bits_uop_lrs1_rtype; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_resp_bits_uop_lrs2_rtype; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_frs3_en; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_fp_val; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_fp_single; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_xcpt_pf_if; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_xcpt_ae_if; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_xcpt_ma_if; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_bp_debug_if; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_uop_bp_xcpt_if; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_resp_bits_uop_debug_fsrc; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_resp_bits_uop_debug_tsrc; // @[mshrs.scala 710:22]
  wire [63:0] mmios_0_io_resp_bits_data; // @[mshrs.scala 710:22]
  wire  mmios_0_io_resp_bits_is_hella; // @[mshrs.scala 710:22]
  wire  mmios_0_io_mem_access_ready; // @[mshrs.scala 710:22]
  wire  mmios_0_io_mem_access_valid; // @[mshrs.scala 710:22]
  wire [2:0] mmios_0_io_mem_access_bits_opcode; // @[mshrs.scala 710:22]
  wire [2:0] mmios_0_io_mem_access_bits_param; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_mem_access_bits_size; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_mem_access_bits_source; // @[mshrs.scala 710:22]
  wire [31:0] mmios_0_io_mem_access_bits_address; // @[mshrs.scala 710:22]
  wire [7:0] mmios_0_io_mem_access_bits_mask; // @[mshrs.scala 710:22]
  wire [63:0] mmios_0_io_mem_access_bits_data; // @[mshrs.scala 710:22]
  wire  mmios_0_io_mem_access_bits_corrupt; // @[mshrs.scala 710:22]
  wire  mmios_0_io_mem_ack_valid; // @[mshrs.scala 710:22]
  wire [2:0] mmios_0_io_mem_ack_bits_opcode; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_mem_ack_bits_param; // @[mshrs.scala 710:22]
  wire [3:0] mmios_0_io_mem_ack_bits_size; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_mem_ack_bits_source; // @[mshrs.scala 710:22]
  wire [1:0] mmios_0_io_mem_ack_bits_sink; // @[mshrs.scala 710:22]
  wire  mmios_0_io_mem_ack_bits_denied; // @[mshrs.scala 710:22]
  wire [63:0] mmios_0_io_mem_ack_bits_data; // @[mshrs.scala 710:22]
  wire  mmios_0_io_mem_ack_bits_corrupt; // @[mshrs.scala 710:22]
  wire  respq_clock; // @[mshrs.scala 737:21]
  wire  respq_reset; // @[mshrs.scala 737:21]
  wire  respq_io_enq_ready; // @[mshrs.scala 737:21]
  wire  respq_io_enq_valid; // @[mshrs.scala 737:21]
  wire [6:0] respq_io_enq_bits_uop_uopc; // @[mshrs.scala 737:21]
  wire [31:0] respq_io_enq_bits_uop_inst; // @[mshrs.scala 737:21]
  wire [31:0] respq_io_enq_bits_uop_debug_inst; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_is_rvc; // @[mshrs.scala 737:21]
  wire [39:0] respq_io_enq_bits_uop_debug_pc; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_enq_bits_uop_iq_type; // @[mshrs.scala 737:21]
  wire [9:0] respq_io_enq_bits_uop_fu_code; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_enq_bits_uop_ctrl_br_type; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_enq_bits_uop_ctrl_op1_sel; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_enq_bits_uop_ctrl_op2_sel; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_enq_bits_uop_ctrl_imm_sel; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_enq_bits_uop_ctrl_op_fcn; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_enq_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_ctrl_is_load; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_ctrl_is_sta; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_ctrl_is_std; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_enq_bits_uop_iw_state; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_iw_p1_poisoned; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_iw_p2_poisoned; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_is_br; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_is_jalr; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_is_jal; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_is_sfb; // @[mshrs.scala 737:21]
  wire [11:0] respq_io_enq_bits_uop_br_mask; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_enq_bits_uop_br_tag; // @[mshrs.scala 737:21]
  wire [4:0] respq_io_enq_bits_uop_ftq_idx; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_edge_inst; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_enq_bits_uop_pc_lob; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_taken; // @[mshrs.scala 737:21]
  wire [19:0] respq_io_enq_bits_uop_imm_packed; // @[mshrs.scala 737:21]
  wire [11:0] respq_io_enq_bits_uop_csr_addr; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_enq_bits_uop_rob_idx; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_enq_bits_uop_ldq_idx; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_enq_bits_uop_stq_idx; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_enq_bits_uop_rxq_idx; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_enq_bits_uop_pdst; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_enq_bits_uop_prs1; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_enq_bits_uop_prs2; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_enq_bits_uop_prs3; // @[mshrs.scala 737:21]
  wire [4:0] respq_io_enq_bits_uop_ppred; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_prs1_busy; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_prs2_busy; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_prs3_busy; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_ppred_busy; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_enq_bits_uop_stale_pdst; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_exception; // @[mshrs.scala 737:21]
  wire [63:0] respq_io_enq_bits_uop_exc_cause; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_bypassable; // @[mshrs.scala 737:21]
  wire [4:0] respq_io_enq_bits_uop_mem_cmd; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_enq_bits_uop_mem_size; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_mem_signed; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_is_fence; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_is_fencei; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_is_amo; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_uses_ldq; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_uses_stq; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_is_sys_pc2epc; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_is_unique; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_flush_on_commit; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_ldst_is_rs1; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_enq_bits_uop_ldst; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_enq_bits_uop_lrs1; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_enq_bits_uop_lrs2; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_enq_bits_uop_lrs3; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_ldst_val; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_enq_bits_uop_dst_rtype; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_enq_bits_uop_lrs1_rtype; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_enq_bits_uop_lrs2_rtype; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_frs3_en; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_fp_val; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_fp_single; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_xcpt_pf_if; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_xcpt_ae_if; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_xcpt_ma_if; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_bp_debug_if; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_uop_bp_xcpt_if; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_enq_bits_uop_debug_fsrc; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_enq_bits_uop_debug_tsrc; // @[mshrs.scala 737:21]
  wire [63:0] respq_io_enq_bits_data; // @[mshrs.scala 737:21]
  wire  respq_io_enq_bits_is_hella; // @[mshrs.scala 737:21]
  wire  respq_io_deq_ready; // @[mshrs.scala 737:21]
  wire  respq_io_deq_valid; // @[mshrs.scala 737:21]
  wire [6:0] respq_io_deq_bits_uop_uopc; // @[mshrs.scala 737:21]
  wire [31:0] respq_io_deq_bits_uop_inst; // @[mshrs.scala 737:21]
  wire [31:0] respq_io_deq_bits_uop_debug_inst; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_is_rvc; // @[mshrs.scala 737:21]
  wire [39:0] respq_io_deq_bits_uop_debug_pc; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_deq_bits_uop_iq_type; // @[mshrs.scala 737:21]
  wire [9:0] respq_io_deq_bits_uop_fu_code; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_deq_bits_uop_ctrl_br_type; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_deq_bits_uop_ctrl_op1_sel; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_deq_bits_uop_ctrl_op2_sel; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_deq_bits_uop_ctrl_imm_sel; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_deq_bits_uop_ctrl_op_fcn; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_deq_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_ctrl_is_load; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_ctrl_is_sta; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_ctrl_is_std; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_deq_bits_uop_iw_state; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_iw_p1_poisoned; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_iw_p2_poisoned; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_is_br; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_is_jalr; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_is_jal; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_is_sfb; // @[mshrs.scala 737:21]
  wire [11:0] respq_io_deq_bits_uop_br_mask; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_deq_bits_uop_br_tag; // @[mshrs.scala 737:21]
  wire [4:0] respq_io_deq_bits_uop_ftq_idx; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_edge_inst; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_deq_bits_uop_pc_lob; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_taken; // @[mshrs.scala 737:21]
  wire [19:0] respq_io_deq_bits_uop_imm_packed; // @[mshrs.scala 737:21]
  wire [11:0] respq_io_deq_bits_uop_csr_addr; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_deq_bits_uop_rob_idx; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_deq_bits_uop_ldq_idx; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_deq_bits_uop_stq_idx; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_deq_bits_uop_rxq_idx; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_deq_bits_uop_pdst; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_deq_bits_uop_prs1; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_deq_bits_uop_prs2; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_deq_bits_uop_prs3; // @[mshrs.scala 737:21]
  wire [4:0] respq_io_deq_bits_uop_ppred; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_prs1_busy; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_prs2_busy; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_prs3_busy; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_ppred_busy; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_deq_bits_uop_stale_pdst; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_exception; // @[mshrs.scala 737:21]
  wire [63:0] respq_io_deq_bits_uop_exc_cause; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_bypassable; // @[mshrs.scala 737:21]
  wire [4:0] respq_io_deq_bits_uop_mem_cmd; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_deq_bits_uop_mem_size; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_mem_signed; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_is_fence; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_is_fencei; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_is_amo; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_uses_ldq; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_uses_stq; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_is_sys_pc2epc; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_is_unique; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_flush_on_commit; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_ldst_is_rs1; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_deq_bits_uop_ldst; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_deq_bits_uop_lrs1; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_deq_bits_uop_lrs2; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_deq_bits_uop_lrs3; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_ldst_val; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_deq_bits_uop_dst_rtype; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_deq_bits_uop_lrs1_rtype; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_deq_bits_uop_lrs2_rtype; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_frs3_en; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_fp_val; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_fp_single; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_xcpt_pf_if; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_xcpt_ae_if; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_xcpt_ma_if; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_bp_debug_if; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_uop_bp_xcpt_if; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_deq_bits_uop_debug_fsrc; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_deq_bits_uop_debug_tsrc; // @[mshrs.scala 737:21]
  wire [63:0] respq_io_deq_bits_data; // @[mshrs.scala 737:21]
  wire  respq_io_deq_bits_is_hella; // @[mshrs.scala 737:21]
  wire [11:0] respq_io_brupdate_b1_resolve_mask; // @[mshrs.scala 737:21]
  wire [11:0] respq_io_brupdate_b1_mispredict_mask; // @[mshrs.scala 737:21]
  wire [6:0] respq_io_brupdate_b2_uop_uopc; // @[mshrs.scala 737:21]
  wire [31:0] respq_io_brupdate_b2_uop_inst; // @[mshrs.scala 737:21]
  wire [31:0] respq_io_brupdate_b2_uop_debug_inst; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_is_rvc; // @[mshrs.scala 737:21]
  wire [39:0] respq_io_brupdate_b2_uop_debug_pc; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_brupdate_b2_uop_iq_type; // @[mshrs.scala 737:21]
  wire [9:0] respq_io_brupdate_b2_uop_fu_code; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_brupdate_b2_uop_ctrl_br_type; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_brupdate_b2_uop_ctrl_op1_sel; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_brupdate_b2_uop_ctrl_op2_sel; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_brupdate_b2_uop_ctrl_imm_sel; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_brupdate_b2_uop_ctrl_op_fcn; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_ctrl_fcn_dw; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_brupdate_b2_uop_ctrl_csr_cmd; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_ctrl_is_load; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_ctrl_is_sta; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_ctrl_is_std; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_brupdate_b2_uop_iw_state; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_iw_p1_poisoned; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_iw_p2_poisoned; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_is_br; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_is_jalr; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_is_jal; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_is_sfb; // @[mshrs.scala 737:21]
  wire [11:0] respq_io_brupdate_b2_uop_br_mask; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_brupdate_b2_uop_br_tag; // @[mshrs.scala 737:21]
  wire [4:0] respq_io_brupdate_b2_uop_ftq_idx; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_edge_inst; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_brupdate_b2_uop_pc_lob; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_taken; // @[mshrs.scala 737:21]
  wire [19:0] respq_io_brupdate_b2_uop_imm_packed; // @[mshrs.scala 737:21]
  wire [11:0] respq_io_brupdate_b2_uop_csr_addr; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_brupdate_b2_uop_rob_idx; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_brupdate_b2_uop_ldq_idx; // @[mshrs.scala 737:21]
  wire [3:0] respq_io_brupdate_b2_uop_stq_idx; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_brupdate_b2_uop_rxq_idx; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_brupdate_b2_uop_pdst; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_brupdate_b2_uop_prs1; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_brupdate_b2_uop_prs2; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_brupdate_b2_uop_prs3; // @[mshrs.scala 737:21]
  wire [4:0] respq_io_brupdate_b2_uop_ppred; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_prs1_busy; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_prs2_busy; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_prs3_busy; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_ppred_busy; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_brupdate_b2_uop_stale_pdst; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_exception; // @[mshrs.scala 737:21]
  wire [63:0] respq_io_brupdate_b2_uop_exc_cause; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_bypassable; // @[mshrs.scala 737:21]
  wire [4:0] respq_io_brupdate_b2_uop_mem_cmd; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_brupdate_b2_uop_mem_size; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_mem_signed; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_is_fence; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_is_fencei; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_is_amo; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_uses_ldq; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_uses_stq; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_is_sys_pc2epc; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_is_unique; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_flush_on_commit; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_ldst_is_rs1; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_brupdate_b2_uop_ldst; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_brupdate_b2_uop_lrs1; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_brupdate_b2_uop_lrs2; // @[mshrs.scala 737:21]
  wire [5:0] respq_io_brupdate_b2_uop_lrs3; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_ldst_val; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_brupdate_b2_uop_dst_rtype; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_brupdate_b2_uop_lrs1_rtype; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_brupdate_b2_uop_lrs2_rtype; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_frs3_en; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_fp_val; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_fp_single; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_xcpt_pf_if; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_xcpt_ae_if; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_xcpt_ma_if; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_bp_debug_if; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_uop_bp_xcpt_if; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_brupdate_b2_uop_debug_fsrc; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_brupdate_b2_uop_debug_tsrc; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_valid; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_mispredict; // @[mshrs.scala 737:21]
  wire  respq_io_brupdate_b2_taken; // @[mshrs.scala 737:21]
  wire [2:0] respq_io_brupdate_b2_cfi_type; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_brupdate_b2_pc_sel; // @[mshrs.scala 737:21]
  wire [39:0] respq_io_brupdate_b2_jalr_target; // @[mshrs.scala 737:21]
  wire [20:0] respq_io_brupdate_b2_target_offset; // @[mshrs.scala 737:21]
  wire  respq_io_flush; // @[mshrs.scala 737:21]
  wire  respq_io_empty; // @[mshrs.scala 737:21]
  wire [1:0] respq_io_count; // @[mshrs.scala 737:21]
  wire [39:0] _T_35 = io_req_0_bits_addr ^ 40'h20000; // @[Parameters.scala 137:31]
  wire [40:0] _T_36 = {1'b0,$signed(_T_35)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_38 = $signed(_T_36) & 41'sh96130000; // @[Parameters.scala 137:52]
  wire  _T_39 = $signed(_T_38) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_40 = io_req_0_bits_addr ^ 40'h10000000; // @[Parameters.scala 137:31]
  wire [40:0] _T_41 = {1'b0,$signed(_T_40)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_43 = $signed(_T_41) & 41'sh96130000; // @[Parameters.scala 137:52]
  wire  _T_44 = $signed(_T_43) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] _T_45 = io_req_0_bits_addr ^ 40'h80000000; // @[Parameters.scala 137:31]
  wire [40:0] _T_46 = {1'b0,$signed(_T_45)}; // @[Parameters.scala 137:49]
  wire [40:0] _T_48 = $signed(_T_46) & 41'sh90000000; // @[Parameters.scala 137:52]
  wire  _T_49 = $signed(_T_48) == 41'sh0; // @[Parameters.scala 137:67]
  wire  cacheable = _T_39 | _T_44 | _T_49; // @[Parameters.scala 671:42]
  reg [16:0] sdq_val; // @[mshrs.scala 555:29]
  wire [16:0] _T_55 = ~sdq_val; // @[mshrs.scala 556:38]
  wire [4:0] _T_73 = _T_55[15] ? 5'hf : 5'h10; // @[Mux.scala 47:69]
  wire [4:0] _T_74 = _T_55[14] ? 5'he : _T_73; // @[Mux.scala 47:69]
  wire [4:0] _T_75 = _T_55[13] ? 5'hd : _T_74; // @[Mux.scala 47:69]
  wire [4:0] _T_76 = _T_55[12] ? 5'hc : _T_75; // @[Mux.scala 47:69]
  wire [4:0] _T_77 = _T_55[11] ? 5'hb : _T_76; // @[Mux.scala 47:69]
  wire [4:0] _T_78 = _T_55[10] ? 5'ha : _T_77; // @[Mux.scala 47:69]
  wire [4:0] _T_79 = _T_55[9] ? 5'h9 : _T_78; // @[Mux.scala 47:69]
  wire [4:0] _T_80 = _T_55[8] ? 5'h8 : _T_79; // @[Mux.scala 47:69]
  wire [4:0] _T_81 = _T_55[7] ? 5'h7 : _T_80; // @[Mux.scala 47:69]
  wire [4:0] _T_82 = _T_55[6] ? 5'h6 : _T_81; // @[Mux.scala 47:69]
  wire [4:0] _T_83 = _T_55[5] ? 5'h5 : _T_82; // @[Mux.scala 47:69]
  wire [4:0] _T_84 = _T_55[4] ? 5'h4 : _T_83; // @[Mux.scala 47:69]
  wire [4:0] _T_85 = _T_55[3] ? 5'h3 : _T_84; // @[Mux.scala 47:69]
  wire [4:0] _T_86 = _T_55[2] ? 5'h2 : _T_85; // @[Mux.scala 47:69]
  wire [4:0] _T_87 = _T_55[1] ? 5'h1 : _T_86; // @[Mux.scala 47:69]
  wire  sdq_rdy = ~(&sdq_val); // @[mshrs.scala 557:22]
  wire  _T_89 = io_req_0_ready & io_req_0_valid; // @[Decoupled.scala 40:37]
  wire  _T_90 = _T_89 & cacheable; // @[mshrs.scala 558:33]
  wire  _T_96 = io_req_0_bits_uop_mem_cmd == 5'h4; // @[package.scala 15:47]
  wire  _T_97 = io_req_0_bits_uop_mem_cmd == 5'h9; // @[package.scala 15:47]
  wire  _T_98 = io_req_0_bits_uop_mem_cmd == 5'ha; // @[package.scala 15:47]
  wire  _T_99 = io_req_0_bits_uop_mem_cmd == 5'hb; // @[package.scala 15:47]
  wire  _T_102 = _T_96 | _T_97 | _T_98 | _T_99; // @[package.scala 72:59]
  wire  _T_103 = io_req_0_bits_uop_mem_cmd == 5'h8; // @[package.scala 15:47]
  wire  _T_104 = io_req_0_bits_uop_mem_cmd == 5'hc; // @[package.scala 15:47]
  wire  _T_105 = io_req_0_bits_uop_mem_cmd == 5'hd; // @[package.scala 15:47]
  wire  _T_106 = io_req_0_bits_uop_mem_cmd == 5'he; // @[package.scala 15:47]
  wire  _T_107 = io_req_0_bits_uop_mem_cmd == 5'hf; // @[package.scala 15:47]
  wire  _T_111 = _T_103 | _T_104 | _T_105 | _T_106 | _T_107; // @[package.scala 72:59]
  wire  _T_112 = _T_102 | _T_111; // @[Consts.scala 79:44]
  wire  _T_113 = io_req_0_bits_uop_mem_cmd == 5'h1 | io_req_0_bits_uop_mem_cmd == 5'h11 | io_req_0_bits_uop_mem_cmd == 5'h7
     | _T_112; // @[Consts.scala 82:76]
  wire  sdq_enq = _T_89 & cacheable & _T_113; // @[mshrs.scala 558:46]
  wire  _T_114 = lb_write_arb_io_out_ready & lb_write_arb_io_out_valid; // @[Decoupled.scala 40:37]
  wire  _T_116 = lb_read_arb_io_out_ready & lb_read_arb_io_out_valid; // @[Decoupled.scala 40:37]
  wire [63:0] _GEN_8 = _T_116 ? lb_MPORT_2_data : 64'h0; // @[mshrs.scala 580:38 mshrs.scala 581:20]
  wire  idx_matches_0_0 = mshrs_0_io_idx_valid & mshrs_0_io_idx_bits == io_req_0_bits_addr[11:6]; // @[mshrs.scala 624:46]
  wire  tag_matches_0_0 = mshrs_0_io_tag_valid & mshrs_0_io_tag_bits == io_req_0_bits_addr[39:12]; // @[mshrs.scala 625:46]
  wire  idx_matches_0_1 = mshrs_1_io_idx_valid & mshrs_1_io_idx_bits == io_req_0_bits_addr[11:6]; // @[mshrs.scala 624:46]
  wire  tag_matches_0_1 = mshrs_1_io_tag_valid & mshrs_1_io_tag_bits == io_req_0_bits_addr[39:12]; // @[mshrs.scala 625:46]
  wire  tag_match_0 = idx_matches_0_0 & tag_matches_0_0 | idx_matches_0_1 & tag_matches_0_1; // @[Mux.scala 27:72]
  wire  idx_match_0 = idx_matches_0_0 | idx_matches_0_1; // @[mshrs.scala 594:58]
  wire  way_matches_0_0 = mshrs_0_io_way_valid & mshrs_0_io_way_bits == io_req_0_bits_way_en; // @[mshrs.scala 626:46]
  wire  way_matches_0_1 = mshrs_1_io_way_valid & mshrs_1_io_way_bits == io_req_0_bits_way_en; // @[mshrs.scala 626:46]
  wire  way_match_0 = idx_matches_0_0 & way_matches_0_0 | idx_matches_0_1 & way_matches_0_1; // @[Mux.scala 27:72]
  wire  _T_125 = io_req_0_valid & sdq_rdy; // @[mshrs.scala 618:27]
  wire  pri_val = io_req_0_valid & sdq_rdy & cacheable & ~idx_match_0; // @[mshrs.scala 618:51]
  reg  REG; // @[mshrs.scala 694:31]
  wire  _T_136 = ~REG; // @[mshrs.scala 632:34]
  wire  _T_147 = ~tag_match_0; // @[mshrs.scala 645:61]
  wire  _T_148 = io_req_0_valid & idx_matches_0_0 & cacheable & ~tag_match_0; // @[mshrs.scala 645:58]
  wire  _T_149 = io_clear_all & ~io_req_0_valid | _T_148; // @[mshrs.scala 644:60]
  wire  _T_150 = io_req_is_probe_0 & idx_matches_0_0; // @[mshrs.scala 646:21]
  wire  _GEN_29 = io_mem_grant_bits_source == 2'h0 & mshrs_0_io_mem_grant_ready; // @[mshrs.scala 673:45 mshrs.scala 674:25 mshrs.scala 614:22]
  wire  _GEN_30 = ~mshrs_0_io_req_pri_rdy ? 1'h0 : 1'h1; // @[mshrs.scala 680:33 mshrs.scala 681:20 mshrs.scala 612:16]
  wire  _GEN_31 = ~mshrs_0_io_probe_rdy & idx_matches_0_0 & io_req_is_probe_0 ? 1'h0 : 1'h1; // @[mshrs.scala 684:76 mshrs.scala 685:22 mshrs.scala 613:16]
  wire  pri_rdy = REG ? mshrs_1_io_req_pri_rdy : _T_136 & mshrs_0_io_req_pri_rdy; // @[mshrs.scala 633:35 mshrs.scala 634:15]
  wire  _T_179 = io_req_0_valid & idx_matches_0_1 & cacheable & ~tag_match_0; // @[mshrs.scala 645:58]
  wire  _T_180 = io_clear_all & ~io_req_0_valid | _T_179; // @[mshrs.scala 644:60]
  wire  _T_181 = io_req_is_probe_0 & idx_matches_0_1; // @[mshrs.scala 646:21]
  wire  _GEN_42 = io_mem_grant_bits_source == 2'h1 ? mshrs_1_io_mem_grant_ready : _GEN_29; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  wire  sec_rdy = mshrs_0_io_req_sec_rdy & mshrs_0_io_req_sec_val | mshrs_1_io_req_sec_rdy & mshrs_1_io_req_sec_val; // @[mshrs.scala 677:25]
  wire  _GEN_43 = ~mshrs_1_io_req_pri_rdy ? 1'h0 : _GEN_30; // @[mshrs.scala 680:33 mshrs.scala 681:20]
  reg  mshr_head; // @[mshrs.scala 693:31]
  wire  _T_190 = mshrs_0_io_req_pri_rdy & 1'h0 >= mshr_head; // @[util.scala 351:65]
  wire  _T_192 = mshrs_1_io_req_pri_rdy; // @[util.scala 351:65]
  wire [1:0] _T_193 = mshrs_0_io_req_pri_rdy ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _T_194 = _T_192 ? 2'h1 : _T_193; // @[Mux.scala 47:69]
  wire [1:0] _T_195 = _T_190 ? 2'h0 : _T_194; // @[Mux.scala 47:69]
  wire  _T_199 = mshr_head + 1'h1; // @[util.scala 203:14]
  wire  mmio_rdy = mmios_0_io_req_ready; // @[mshrs.scala 717:25]
  wire  _T_201 = io_mem_grant_bits_source == 2'h3; // @[mshrs.scala 720:77]
  wire  _T_205 = ~cacheable; // @[mshrs.scala 732:47]
  wire [26:0] _decode_T_1 = 27'hfff << mshrs_0_io_mem_acquire_bits_size; // @[package.scala 234:77]
  wire [11:0] _decode_T_3 = ~_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] decode = _decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  opdata = ~mshrs_0_io_mem_acquire_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [8:0] _T_207 = opdata ? decode : 9'h0; // @[Edges.scala 220:14]
  wire [26:0] _decode_T_5 = 27'hfff << mshrs_1_io_mem_acquire_bits_size; // @[package.scala 234:77]
  wire [11:0] _decode_T_7 = ~_decode_T_5[11:0]; // @[package.scala 234:46]
  wire [8:0] decode_1 = _decode_T_7[11:3]; // @[Edges.scala 219:59]
  wire  opdata_1 = ~mshrs_1_io_mem_acquire_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [8:0] _T_208 = opdata_1 ? decode_1 : 9'h0; // @[Edges.scala 220:14]
  wire [26:0] _decode_T_9 = 27'hfff << mmios_0_io_mem_access_bits_size; // @[package.scala 234:77]
  wire [11:0] _decode_T_11 = ~_decode_T_9[11:0]; // @[package.scala 234:46]
  wire [8:0] decode_2 = _decode_T_11[11:3]; // @[Edges.scala 219:59]
  wire  opdata_2 = ~mmios_0_io_mem_access_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [8:0] _T_209 = opdata_2 ? decode_2 : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] beatsLeft; // @[Arbiter.scala 87:30]
  wire  idle = beatsLeft == 9'h0; // @[Arbiter.scala 88:28]
  wire  latch = idle & io_mem_acquire_ready; // @[Arbiter.scala 89:24]
  wire  out_earlyValid = mshrs_0_io_mem_acquire_valid; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 71:20]
  wire  out_1_earlyValid = mshrs_1_io_mem_acquire_valid; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 71:20]
  wire  out_2_earlyValid = mmios_0_io_mem_access_valid; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 71:20]
  wire [2:0] _readys_T = {out_2_earlyValid,out_1_earlyValid,out_earlyValid}; // @[Cat.scala 30:58]
  wire [3:0] _readys_T_1 = {_readys_T, 1'h0}; // @[package.scala 244:48]
  wire [2:0] _readys_T_3 = _readys_T | _readys_T_1[2:0]; // @[package.scala 244:43]
  wire [4:0] _readys_T_4 = {_readys_T_3, 2'h0}; // @[package.scala 244:48]
  wire [2:0] _readys_T_6 = _readys_T_3 | _readys_T_4[2:0]; // @[package.scala 244:43]
  wire [3:0] _readys_T_8 = {_readys_T_6, 1'h0}; // @[Arbiter.scala 16:78]
  wire [2:0] _readys_T_10 = ~_readys_T_8[2:0]; // @[Arbiter.scala 16:61]
  wire  readys__0 = _readys_T_10[0]; // @[Arbiter.scala 95:86]
  wire  readys__1 = _readys_T_10[1]; // @[Arbiter.scala 95:86]
  wire  readys__2 = _readys_T_10[2]; // @[Arbiter.scala 95:86]
  wire  earlyWinner__0 = readys__0 & out_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner__1 = readys__1 & out_1_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner__2 = readys__2 & out_2_earlyValid; // @[Arbiter.scala 97:79]
  wire  prefixOR_2 = earlyWinner__0 | earlyWinner__1; // @[Arbiter.scala 104:53]
  wire  _prefixOR_T = prefixOR_2 | earlyWinner__2; // @[Arbiter.scala 104:53]
  wire  _T_225 = out_earlyValid | out_1_earlyValid | out_2_earlyValid; // @[Arbiter.scala 107:36]
  wire  _T_226 = ~(out_earlyValid | out_1_earlyValid | out_2_earlyValid); // @[Arbiter.scala 107:15]
  wire [8:0] maskedBeats_0 = earlyWinner__0 ? _T_207 : 9'h0; // @[Arbiter.scala 111:73]
  wire [8:0] maskedBeats_1 = earlyWinner__1 ? _T_208 : 9'h0; // @[Arbiter.scala 111:73]
  wire [8:0] maskedBeats_2 = earlyWinner__2 ? _T_209 : 9'h0; // @[Arbiter.scala 111:73]
  wire [8:0] _initBeats_T = maskedBeats_0 | maskedBeats_1; // @[Arbiter.scala 112:44]
  wire [8:0] initBeats = _initBeats_T | maskedBeats_2; // @[Arbiter.scala 112:44]
  reg  state__0; // @[Arbiter.scala 116:26]
  wire  muxStateEarly__0 = idle ? earlyWinner__0 : state__0; // @[Arbiter.scala 117:30]
  reg  state__1; // @[Arbiter.scala 116:26]
  wire  muxStateEarly__1 = idle ? earlyWinner__1 : state__1; // @[Arbiter.scala 117:30]
  reg  state__2; // @[Arbiter.scala 116:26]
  wire  muxStateEarly__2 = idle ? earlyWinner__2 : state__2; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_6 = state__0 & out_earlyValid | state__1 & out_1_earlyValid | state__2 &
    out_2_earlyValid; // @[Mux.scala 27:72]
  wire  sink_ACancel_earlyValid = idle ? _T_225 : _sink_ACancel_earlyValid_T_6; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_2 = io_mem_acquire_ready & sink_ACancel_earlyValid; // @[ReadyValidCancel.scala 50:33]
  wire [8:0] _GEN_49 = {{8'd0}, _beatsLeft_T_2}; // @[Arbiter.scala 113:52]
  wire [8:0] _beatsLeft_T_4 = beatsLeft - _GEN_49; // @[Arbiter.scala 113:52]
  wire  allowed__0 = idle ? readys__0 : state__0; // @[Arbiter.scala 121:24]
  wire  allowed__1 = idle ? readys__1 : state__1; // @[Arbiter.scala 121:24]
  wire  allowed__2 = idle ? readys__2 : state__2; // @[Arbiter.scala 121:24]
  wire  out_bits_corrupt = mshrs_0_io_mem_acquire_bits_corrupt; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire  out_1_bits_corrupt = mshrs_1_io_mem_acquire_bits_corrupt; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire  out_2_bits_corrupt = mmios_0_io_mem_access_bits_corrupt; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [63:0] out_bits_data = mshrs_0_io_mem_acquire_bits_data; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [63:0] _T_247 = muxStateEarly__0 ? out_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] out_1_bits_data = mshrs_1_io_mem_acquire_bits_data; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [63:0] _T_248 = muxStateEarly__1 ? out_1_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] out_2_bits_data = mmios_0_io_mem_access_bits_data; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [63:0] _T_249 = muxStateEarly__2 ? out_2_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_250 = _T_247 | _T_248; // @[Mux.scala 27:72]
  wire [7:0] out_bits_mask = mshrs_0_io_mem_acquire_bits_mask; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [7:0] _T_252 = muxStateEarly__0 ? out_bits_mask : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] out_1_bits_mask = mshrs_1_io_mem_acquire_bits_mask; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [7:0] _T_253 = muxStateEarly__1 ? out_1_bits_mask : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] out_2_bits_mask = mmios_0_io_mem_access_bits_mask; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [7:0] _T_254 = muxStateEarly__2 ? out_2_bits_mask : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_255 = _T_252 | _T_253; // @[Mux.scala 27:72]
  wire [31:0] out_bits_address = mshrs_0_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [31:0] _T_257 = muxStateEarly__0 ? out_bits_address : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] out_1_bits_address = mshrs_1_io_mem_acquire_bits_address; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [31:0] _T_258 = muxStateEarly__1 ? out_1_bits_address : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] out_2_bits_address = mmios_0_io_mem_access_bits_address; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [31:0] _T_259 = muxStateEarly__2 ? out_2_bits_address : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_260 = _T_257 | _T_258; // @[Mux.scala 27:72]
  wire [1:0] out_bits_source = mshrs_0_io_mem_acquire_bits_source; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [1:0] _T_262 = muxStateEarly__0 ? out_bits_source : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] out_1_bits_source = mshrs_1_io_mem_acquire_bits_source; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [1:0] _T_263 = muxStateEarly__1 ? out_1_bits_source : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] out_2_bits_source = mmios_0_io_mem_access_bits_source; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [1:0] _T_264 = muxStateEarly__2 ? out_2_bits_source : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_265 = _T_262 | _T_263; // @[Mux.scala 27:72]
  wire [3:0] out_bits_size = mshrs_0_io_mem_acquire_bits_size; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [3:0] _T_267 = muxStateEarly__0 ? out_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] out_1_bits_size = mshrs_1_io_mem_acquire_bits_size; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [3:0] _T_268 = muxStateEarly__1 ? out_1_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] out_2_bits_size = mmios_0_io_mem_access_bits_size; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [3:0] _T_269 = muxStateEarly__2 ? out_2_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_270 = _T_267 | _T_268; // @[Mux.scala 27:72]
  wire [2:0] out_bits_param = mshrs_0_io_mem_acquire_bits_param; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [2:0] _T_272 = muxStateEarly__0 ? out_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] out_1_bits_param = mshrs_1_io_mem_acquire_bits_param; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [2:0] _T_273 = muxStateEarly__1 ? out_1_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] out_2_bits_param = mmios_0_io_mem_access_bits_param; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [2:0] _T_274 = muxStateEarly__2 ? out_2_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_275 = _T_272 | _T_273; // @[Mux.scala 27:72]
  wire [2:0] out_bits_opcode = mshrs_0_io_mem_acquire_bits_opcode; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [2:0] _T_277 = muxStateEarly__0 ? out_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] out_1_bits_opcode = mshrs_1_io_mem_acquire_bits_opcode; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [2:0] _T_278 = muxStateEarly__1 ? out_1_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] out_2_bits_opcode = mmios_0_io_mem_access_bits_opcode; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [2:0] _T_279 = muxStateEarly__2 ? out_2_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_280 = _T_277 | _T_278; // @[Mux.scala 27:72]
  reg  beatsLeft_1; // @[Arbiter.scala 87:30]
  wire  idle_1 = ~beatsLeft_1; // @[Arbiter.scala 88:28]
  wire  latch_1 = idle_1 & io_mem_finish_ready; // @[Arbiter.scala 89:24]
  wire  out_4_earlyValid = mshrs_0_io_mem_finish_valid; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 71:20]
  wire  out_5_earlyValid = mshrs_1_io_mem_finish_valid; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 71:20]
  wire [1:0] _readys_T_14 = {out_5_earlyValid,out_4_earlyValid}; // @[Cat.scala 30:58]
  wire [2:0] _readys_T_15 = {_readys_T_14, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_T_17 = _readys_T_14 | _readys_T_15[1:0]; // @[package.scala 244:43]
  wire [2:0] _readys_T_19 = {_readys_T_17, 1'h0}; // @[Arbiter.scala 16:78]
  wire [1:0] _readys_T_21 = ~_readys_T_19[1:0]; // @[Arbiter.scala 16:61]
  wire  readys_1_0 = _readys_T_21[0]; // @[Arbiter.scala 95:86]
  wire  readys_1_1 = _readys_T_21[1]; // @[Arbiter.scala 95:86]
  wire  earlyWinner_1_0 = readys_1_0 & out_4_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1_1 = readys_1_1 & out_5_earlyValid; // @[Arbiter.scala 97:79]
  wire  _prefixOR_T_1 = earlyWinner_1_0 | earlyWinner_1_1; // @[Arbiter.scala 104:53]
  wire  _T_292 = out_4_earlyValid | out_5_earlyValid; // @[Arbiter.scala 107:36]
  wire  _T_293 = ~(out_4_earlyValid | out_5_earlyValid); // @[Arbiter.scala 107:15]
  reg  state_1_0; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_0 = idle_1 ? earlyWinner_1_0 : state_1_0; // @[Arbiter.scala 117:30]
  reg  state_1_1; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_1 = idle_1 ? earlyWinner_1_1 : state_1_1; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_11 = state_1_0 & out_4_earlyValid | state_1_1 & out_5_earlyValid; // @[Mux.scala 27:72]
  wire  sink_ACancel_1_earlyValid = idle_1 ? _T_292 : _sink_ACancel_earlyValid_T_11; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_8 = io_mem_finish_ready & sink_ACancel_1_earlyValid; // @[ReadyValidCancel.scala 50:33]
  wire  allowed_1_0 = idle_1 ? readys_1_0 : state_1_0; // @[Arbiter.scala 121:24]
  wire  allowed_1_1 = idle_1 ? readys_1_1 : state_1_1; // @[Arbiter.scala 121:24]
  wire [1:0] out_4_bits_sink = mshrs_0_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [1:0] _T_306 = muxStateEarly_1_0 ? out_4_bits_sink : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] out_5_bits_sink = mshrs_1_io_mem_finish_bits_sink; // @[ReadyValidCancel.scala 70:19 ReadyValidCancel.scala 73:14]
  wire [1:0] _T_307 = muxStateEarly_1_1 ? out_5_bits_sink : 2'h0; // @[Mux.scala 27:72]
  wire  _T_312 = idx_match_0 ? tag_match_0 & sec_rdy : pri_rdy; // @[mshrs.scala 745:47]
  wire  _T_320 = io_replay_ready & io_replay_valid; // @[Decoupled.scala 40:37]
  wire  _T_326 = io_replay_bits_uop_mem_cmd == 5'h4; // @[package.scala 15:47]
  wire  _T_327 = io_replay_bits_uop_mem_cmd == 5'h9; // @[package.scala 15:47]
  wire  _T_328 = io_replay_bits_uop_mem_cmd == 5'ha; // @[package.scala 15:47]
  wire  _T_329 = io_replay_bits_uop_mem_cmd == 5'hb; // @[package.scala 15:47]
  wire  _T_332 = _T_326 | _T_327 | _T_328 | _T_329; // @[package.scala 72:59]
  wire  _T_333 = io_replay_bits_uop_mem_cmd == 5'h8; // @[package.scala 15:47]
  wire  _T_334 = io_replay_bits_uop_mem_cmd == 5'hc; // @[package.scala 15:47]
  wire  _T_335 = io_replay_bits_uop_mem_cmd == 5'hd; // @[package.scala 15:47]
  wire  _T_336 = io_replay_bits_uop_mem_cmd == 5'he; // @[package.scala 15:47]
  wire  _T_337 = io_replay_bits_uop_mem_cmd == 5'hf; // @[package.scala 15:47]
  wire  _T_341 = _T_333 | _T_334 | _T_335 | _T_336 | _T_337; // @[package.scala 72:59]
  wire  _T_342 = _T_332 | _T_341; // @[Consts.scala 79:44]
  wire  _T_343 = io_replay_bits_uop_mem_cmd == 5'h1 | io_replay_bits_uop_mem_cmd == 5'h11 | io_replay_bits_uop_mem_cmd
     == 5'h7 | _T_342; // @[Consts.scala 82:76]
  wire  free_sdq = _T_320 & _T_343; // @[mshrs.scala 751:35]
  wire [31:0] _T_345 = 32'h1 << replay_arb_io_out_bits_sdq_id; // @[OneHot.scala 58:35]
  wire [16:0] _T_347 = free_sdq ? 17'h1ffff : 17'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _GEN_50 = {{15'd0}, _T_347}; // @[mshrs.scala 757:68]
  wire [31:0] _T_348 = _T_345 & _GEN_50; // @[mshrs.scala 757:68]
  wire [31:0] _T_349 = ~_T_348; // @[mshrs.scala 757:26]
  wire [31:0] _GEN_51 = {{15'd0}, sdq_val}; // @[mshrs.scala 757:24]
  wire [31:0] _T_350 = _GEN_51 & _T_349; // @[mshrs.scala 757:24]
  wire [16:0] _T_370 = _T_55[16] ? 17'h10000 : 17'h0; // @[Mux.scala 47:69]
  wire [16:0] _T_371 = _T_55[15] ? 17'h8000 : _T_370; // @[Mux.scala 47:69]
  wire [16:0] _T_372 = _T_55[14] ? 17'h4000 : _T_371; // @[Mux.scala 47:69]
  wire [16:0] _T_373 = _T_55[13] ? 17'h2000 : _T_372; // @[Mux.scala 47:69]
  wire [16:0] _T_374 = _T_55[12] ? 17'h1000 : _T_373; // @[Mux.scala 47:69]
  wire [16:0] _T_375 = _T_55[11] ? 17'h800 : _T_374; // @[Mux.scala 47:69]
  wire [16:0] _T_376 = _T_55[10] ? 17'h400 : _T_375; // @[Mux.scala 47:69]
  wire [16:0] _T_377 = _T_55[9] ? 17'h200 : _T_376; // @[Mux.scala 47:69]
  wire [16:0] _T_378 = _T_55[8] ? 17'h100 : _T_377; // @[Mux.scala 47:69]
  wire [16:0] _T_379 = _T_55[7] ? 17'h80 : _T_378; // @[Mux.scala 47:69]
  wire [16:0] _T_380 = _T_55[6] ? 17'h40 : _T_379; // @[Mux.scala 47:69]
  wire [16:0] _T_381 = _T_55[5] ? 17'h20 : _T_380; // @[Mux.scala 47:69]
  wire [16:0] _T_382 = _T_55[4] ? 17'h10 : _T_381; // @[Mux.scala 47:69]
  wire [16:0] _T_383 = _T_55[3] ? 17'h8 : _T_382; // @[Mux.scala 47:69]
  wire [16:0] _T_384 = _T_55[2] ? 17'h4 : _T_383; // @[Mux.scala 47:69]
  wire [16:0] _T_385 = _T_55[1] ? 17'h2 : _T_384; // @[Mux.scala 47:69]
  wire [16:0] _T_386 = _T_55[0] ? 17'h1 : _T_385; // @[Mux.scala 47:69]
  wire [16:0] _T_388 = sdq_enq ? 17'h1ffff : 17'h0; // @[Bitwise.scala 72:12]
  wire [16:0] _T_389 = _T_386 & _T_388; // @[mshrs.scala 758:49]
  wire [31:0] _GEN_52 = {{15'd0}, _T_389}; // @[mshrs.scala 757:96]
  wire [31:0] _T_390 = _T_350 | _GEN_52; // @[mshrs.scala 757:96]
  wire [31:0] _GEN_48 = io_replay_valid | sdq_enq ? _T_390 : {{15'd0}, sdq_val}; // @[mshrs.scala 756:37 mshrs.scala 757:13 mshrs.scala 555:29]
  reg  REG_1; // @[mshrs.scala 761:41]
  wire  commit_vals_0 = mshrs_0_io_commit_val; // @[mshrs.scala 606:28 mshrs.scala 667:21]
  wire  commit_vals_1 = mshrs_1_io_commit_val; // @[mshrs.scala 606:28 mshrs.scala 667:21]
  reg  REG_2; // @[mshrs.scala 762:41]
  wire [39:0] commit_addrs_0 = mshrs_0_io_commit_addr; // @[mshrs.scala 607:28 mshrs.scala 668:21]
  wire [39:0] _T_392 = commit_vals_0 ? commit_addrs_0 : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] commit_addrs_1 = mshrs_1_io_commit_addr; // @[mshrs.scala 607:28 mshrs.scala 668:21]
  wire [39:0] _T_393 = commit_vals_1 ? commit_addrs_1 : 40'h0; // @[Mux.scala 27:72]
  reg [39:0] REG_3; // @[mshrs.scala 763:41]
  wire [1:0] commit_cohs_0_state = mshrs_0_io_commit_coh_state; // @[mshrs.scala 608:28 mshrs.scala 669:21]
  wire [1:0] _T_395 = commit_vals_0 ? commit_cohs_0_state : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] commit_cohs_1_state = mshrs_1_io_commit_coh_state; // @[mshrs.scala 608:28 mshrs.scala 669:21]
  wire [1:0] _T_396 = commit_vals_1 ? commit_cohs_1_state : 2'h0; // @[Mux.scala 27:72]
  reg [1:0] REG_4_state; // @[mshrs.scala 764:41]
  NullPrefetcher prefetcher ( // @[mshrs.scala 546:65]
    .clock(prefetcher_clock),
    .reset(prefetcher_reset),
    .io_mshr_avail(prefetcher_io_mshr_avail),
    .io_req_val(prefetcher_io_req_val),
    .io_req_addr(prefetcher_io_req_addr),
    .io_req_coh_state(prefetcher_io_req_coh_state),
    .io_prefetch_ready(prefetcher_io_prefetch_ready),
    .io_prefetch_valid(prefetcher_io_prefetch_valid),
    .io_prefetch_bits_uop_uopc(prefetcher_io_prefetch_bits_uop_uopc),
    .io_prefetch_bits_uop_inst(prefetcher_io_prefetch_bits_uop_inst),
    .io_prefetch_bits_uop_debug_inst(prefetcher_io_prefetch_bits_uop_debug_inst),
    .io_prefetch_bits_uop_is_rvc(prefetcher_io_prefetch_bits_uop_is_rvc),
    .io_prefetch_bits_uop_debug_pc(prefetcher_io_prefetch_bits_uop_debug_pc),
    .io_prefetch_bits_uop_iq_type(prefetcher_io_prefetch_bits_uop_iq_type),
    .io_prefetch_bits_uop_fu_code(prefetcher_io_prefetch_bits_uop_fu_code),
    .io_prefetch_bits_uop_ctrl_br_type(prefetcher_io_prefetch_bits_uop_ctrl_br_type),
    .io_prefetch_bits_uop_ctrl_op1_sel(prefetcher_io_prefetch_bits_uop_ctrl_op1_sel),
    .io_prefetch_bits_uop_ctrl_op2_sel(prefetcher_io_prefetch_bits_uop_ctrl_op2_sel),
    .io_prefetch_bits_uop_ctrl_imm_sel(prefetcher_io_prefetch_bits_uop_ctrl_imm_sel),
    .io_prefetch_bits_uop_ctrl_op_fcn(prefetcher_io_prefetch_bits_uop_ctrl_op_fcn),
    .io_prefetch_bits_uop_ctrl_fcn_dw(prefetcher_io_prefetch_bits_uop_ctrl_fcn_dw),
    .io_prefetch_bits_uop_ctrl_csr_cmd(prefetcher_io_prefetch_bits_uop_ctrl_csr_cmd),
    .io_prefetch_bits_uop_ctrl_is_load(prefetcher_io_prefetch_bits_uop_ctrl_is_load),
    .io_prefetch_bits_uop_ctrl_is_sta(prefetcher_io_prefetch_bits_uop_ctrl_is_sta),
    .io_prefetch_bits_uop_ctrl_is_std(prefetcher_io_prefetch_bits_uop_ctrl_is_std),
    .io_prefetch_bits_uop_iw_state(prefetcher_io_prefetch_bits_uop_iw_state),
    .io_prefetch_bits_uop_iw_p1_poisoned(prefetcher_io_prefetch_bits_uop_iw_p1_poisoned),
    .io_prefetch_bits_uop_iw_p2_poisoned(prefetcher_io_prefetch_bits_uop_iw_p2_poisoned),
    .io_prefetch_bits_uop_is_br(prefetcher_io_prefetch_bits_uop_is_br),
    .io_prefetch_bits_uop_is_jalr(prefetcher_io_prefetch_bits_uop_is_jalr),
    .io_prefetch_bits_uop_is_jal(prefetcher_io_prefetch_bits_uop_is_jal),
    .io_prefetch_bits_uop_is_sfb(prefetcher_io_prefetch_bits_uop_is_sfb),
    .io_prefetch_bits_uop_br_mask(prefetcher_io_prefetch_bits_uop_br_mask),
    .io_prefetch_bits_uop_br_tag(prefetcher_io_prefetch_bits_uop_br_tag),
    .io_prefetch_bits_uop_ftq_idx(prefetcher_io_prefetch_bits_uop_ftq_idx),
    .io_prefetch_bits_uop_edge_inst(prefetcher_io_prefetch_bits_uop_edge_inst),
    .io_prefetch_bits_uop_pc_lob(prefetcher_io_prefetch_bits_uop_pc_lob),
    .io_prefetch_bits_uop_taken(prefetcher_io_prefetch_bits_uop_taken),
    .io_prefetch_bits_uop_imm_packed(prefetcher_io_prefetch_bits_uop_imm_packed),
    .io_prefetch_bits_uop_csr_addr(prefetcher_io_prefetch_bits_uop_csr_addr),
    .io_prefetch_bits_uop_rob_idx(prefetcher_io_prefetch_bits_uop_rob_idx),
    .io_prefetch_bits_uop_ldq_idx(prefetcher_io_prefetch_bits_uop_ldq_idx),
    .io_prefetch_bits_uop_stq_idx(prefetcher_io_prefetch_bits_uop_stq_idx),
    .io_prefetch_bits_uop_rxq_idx(prefetcher_io_prefetch_bits_uop_rxq_idx),
    .io_prefetch_bits_uop_pdst(prefetcher_io_prefetch_bits_uop_pdst),
    .io_prefetch_bits_uop_prs1(prefetcher_io_prefetch_bits_uop_prs1),
    .io_prefetch_bits_uop_prs2(prefetcher_io_prefetch_bits_uop_prs2),
    .io_prefetch_bits_uop_prs3(prefetcher_io_prefetch_bits_uop_prs3),
    .io_prefetch_bits_uop_ppred(prefetcher_io_prefetch_bits_uop_ppred),
    .io_prefetch_bits_uop_prs1_busy(prefetcher_io_prefetch_bits_uop_prs1_busy),
    .io_prefetch_bits_uop_prs2_busy(prefetcher_io_prefetch_bits_uop_prs2_busy),
    .io_prefetch_bits_uop_prs3_busy(prefetcher_io_prefetch_bits_uop_prs3_busy),
    .io_prefetch_bits_uop_ppred_busy(prefetcher_io_prefetch_bits_uop_ppred_busy),
    .io_prefetch_bits_uop_stale_pdst(prefetcher_io_prefetch_bits_uop_stale_pdst),
    .io_prefetch_bits_uop_exception(prefetcher_io_prefetch_bits_uop_exception),
    .io_prefetch_bits_uop_exc_cause(prefetcher_io_prefetch_bits_uop_exc_cause),
    .io_prefetch_bits_uop_bypassable(prefetcher_io_prefetch_bits_uop_bypassable),
    .io_prefetch_bits_uop_mem_cmd(prefetcher_io_prefetch_bits_uop_mem_cmd),
    .io_prefetch_bits_uop_mem_size(prefetcher_io_prefetch_bits_uop_mem_size),
    .io_prefetch_bits_uop_mem_signed(prefetcher_io_prefetch_bits_uop_mem_signed),
    .io_prefetch_bits_uop_is_fence(prefetcher_io_prefetch_bits_uop_is_fence),
    .io_prefetch_bits_uop_is_fencei(prefetcher_io_prefetch_bits_uop_is_fencei),
    .io_prefetch_bits_uop_is_amo(prefetcher_io_prefetch_bits_uop_is_amo),
    .io_prefetch_bits_uop_uses_ldq(prefetcher_io_prefetch_bits_uop_uses_ldq),
    .io_prefetch_bits_uop_uses_stq(prefetcher_io_prefetch_bits_uop_uses_stq),
    .io_prefetch_bits_uop_is_sys_pc2epc(prefetcher_io_prefetch_bits_uop_is_sys_pc2epc),
    .io_prefetch_bits_uop_is_unique(prefetcher_io_prefetch_bits_uop_is_unique),
    .io_prefetch_bits_uop_flush_on_commit(prefetcher_io_prefetch_bits_uop_flush_on_commit),
    .io_prefetch_bits_uop_ldst_is_rs1(prefetcher_io_prefetch_bits_uop_ldst_is_rs1),
    .io_prefetch_bits_uop_ldst(prefetcher_io_prefetch_bits_uop_ldst),
    .io_prefetch_bits_uop_lrs1(prefetcher_io_prefetch_bits_uop_lrs1),
    .io_prefetch_bits_uop_lrs2(prefetcher_io_prefetch_bits_uop_lrs2),
    .io_prefetch_bits_uop_lrs3(prefetcher_io_prefetch_bits_uop_lrs3),
    .io_prefetch_bits_uop_ldst_val(prefetcher_io_prefetch_bits_uop_ldst_val),
    .io_prefetch_bits_uop_dst_rtype(prefetcher_io_prefetch_bits_uop_dst_rtype),
    .io_prefetch_bits_uop_lrs1_rtype(prefetcher_io_prefetch_bits_uop_lrs1_rtype),
    .io_prefetch_bits_uop_lrs2_rtype(prefetcher_io_prefetch_bits_uop_lrs2_rtype),
    .io_prefetch_bits_uop_frs3_en(prefetcher_io_prefetch_bits_uop_frs3_en),
    .io_prefetch_bits_uop_fp_val(prefetcher_io_prefetch_bits_uop_fp_val),
    .io_prefetch_bits_uop_fp_single(prefetcher_io_prefetch_bits_uop_fp_single),
    .io_prefetch_bits_uop_xcpt_pf_if(prefetcher_io_prefetch_bits_uop_xcpt_pf_if),
    .io_prefetch_bits_uop_xcpt_ae_if(prefetcher_io_prefetch_bits_uop_xcpt_ae_if),
    .io_prefetch_bits_uop_xcpt_ma_if(prefetcher_io_prefetch_bits_uop_xcpt_ma_if),
    .io_prefetch_bits_uop_bp_debug_if(prefetcher_io_prefetch_bits_uop_bp_debug_if),
    .io_prefetch_bits_uop_bp_xcpt_if(prefetcher_io_prefetch_bits_uop_bp_xcpt_if),
    .io_prefetch_bits_uop_debug_fsrc(prefetcher_io_prefetch_bits_uop_debug_fsrc),
    .io_prefetch_bits_uop_debug_tsrc(prefetcher_io_prefetch_bits_uop_debug_tsrc),
    .io_prefetch_bits_addr(prefetcher_io_prefetch_bits_addr),
    .io_prefetch_bits_data(prefetcher_io_prefetch_bits_data),
    .io_prefetch_bits_is_hella(prefetcher_io_prefetch_bits_is_hella)
  );
  Arbiter lb_read_arb ( // @[mshrs.scala 569:28]
    .clock(lb_read_arb_clock),
    .reset(lb_read_arb_reset),
    .io_in_0_ready(lb_read_arb_io_in_0_ready),
    .io_in_0_valid(lb_read_arb_io_in_0_valid),
    .io_in_0_bits_id(lb_read_arb_io_in_0_bits_id),
    .io_in_0_bits_offset(lb_read_arb_io_in_0_bits_offset),
    .io_in_1_ready(lb_read_arb_io_in_1_ready),
    .io_in_1_valid(lb_read_arb_io_in_1_valid),
    .io_in_1_bits_id(lb_read_arb_io_in_1_bits_id),
    .io_in_1_bits_offset(lb_read_arb_io_in_1_bits_offset),
    .io_out_ready(lb_read_arb_io_out_ready),
    .io_out_valid(lb_read_arb_io_out_valid),
    .io_out_bits_id(lb_read_arb_io_out_bits_id),
    .io_out_bits_offset(lb_read_arb_io_out_bits_offset),
    .io_chosen(lb_read_arb_io_chosen)
  );
  Arbiter_1 lb_write_arb ( // @[mshrs.scala 570:28]
    .clock(lb_write_arb_clock),
    .reset(lb_write_arb_reset),
    .io_in_0_ready(lb_write_arb_io_in_0_ready),
    .io_in_0_valid(lb_write_arb_io_in_0_valid),
    .io_in_0_bits_id(lb_write_arb_io_in_0_bits_id),
    .io_in_0_bits_offset(lb_write_arb_io_in_0_bits_offset),
    .io_in_0_bits_data(lb_write_arb_io_in_0_bits_data),
    .io_in_1_ready(lb_write_arb_io_in_1_ready),
    .io_in_1_valid(lb_write_arb_io_in_1_valid),
    .io_in_1_bits_id(lb_write_arb_io_in_1_bits_id),
    .io_in_1_bits_offset(lb_write_arb_io_in_1_bits_offset),
    .io_in_1_bits_data(lb_write_arb_io_in_1_bits_data),
    .io_out_ready(lb_write_arb_io_out_ready),
    .io_out_valid(lb_write_arb_io_out_valid),
    .io_out_bits_id(lb_write_arb_io_out_bits_id),
    .io_out_bits_offset(lb_write_arb_io_out_bits_offset),
    .io_out_bits_data(lb_write_arb_io_out_bits_data),
    .io_chosen(lb_write_arb_io_chosen)
  );
  Arbiter_2 meta_write_arb ( // @[mshrs.scala 599:30]
    .clock(meta_write_arb_clock),
    .reset(meta_write_arb_reset),
    .io_in_0_ready(meta_write_arb_io_in_0_ready),
    .io_in_0_valid(meta_write_arb_io_in_0_valid),
    .io_in_0_bits_idx(meta_write_arb_io_in_0_bits_idx),
    .io_in_0_bits_way_en(meta_write_arb_io_in_0_bits_way_en),
    .io_in_0_bits_tag(meta_write_arb_io_in_0_bits_tag),
    .io_in_0_bits_data_coh_state(meta_write_arb_io_in_0_bits_data_coh_state),
    .io_in_0_bits_data_tag(meta_write_arb_io_in_0_bits_data_tag),
    .io_in_1_ready(meta_write_arb_io_in_1_ready),
    .io_in_1_valid(meta_write_arb_io_in_1_valid),
    .io_in_1_bits_idx(meta_write_arb_io_in_1_bits_idx),
    .io_in_1_bits_way_en(meta_write_arb_io_in_1_bits_way_en),
    .io_in_1_bits_tag(meta_write_arb_io_in_1_bits_tag),
    .io_in_1_bits_data_coh_state(meta_write_arb_io_in_1_bits_data_coh_state),
    .io_in_1_bits_data_tag(meta_write_arb_io_in_1_bits_data_tag),
    .io_out_ready(meta_write_arb_io_out_ready),
    .io_out_valid(meta_write_arb_io_out_valid),
    .io_out_bits_idx(meta_write_arb_io_out_bits_idx),
    .io_out_bits_way_en(meta_write_arb_io_out_bits_way_en),
    .io_out_bits_tag(meta_write_arb_io_out_bits_tag),
    .io_out_bits_data_coh_state(meta_write_arb_io_out_bits_data_coh_state),
    .io_out_bits_data_tag(meta_write_arb_io_out_bits_data_tag),
    .io_chosen(meta_write_arb_io_chosen)
  );
  Arbiter_3 meta_read_arb ( // @[mshrs.scala 600:30]
    .clock(meta_read_arb_clock),
    .reset(meta_read_arb_reset),
    .io_in_0_ready(meta_read_arb_io_in_0_ready),
    .io_in_0_valid(meta_read_arb_io_in_0_valid),
    .io_in_0_bits_idx(meta_read_arb_io_in_0_bits_idx),
    .io_in_0_bits_way_en(meta_read_arb_io_in_0_bits_way_en),
    .io_in_0_bits_tag(meta_read_arb_io_in_0_bits_tag),
    .io_in_1_ready(meta_read_arb_io_in_1_ready),
    .io_in_1_valid(meta_read_arb_io_in_1_valid),
    .io_in_1_bits_idx(meta_read_arb_io_in_1_bits_idx),
    .io_in_1_bits_way_en(meta_read_arb_io_in_1_bits_way_en),
    .io_in_1_bits_tag(meta_read_arb_io_in_1_bits_tag),
    .io_out_ready(meta_read_arb_io_out_ready),
    .io_out_valid(meta_read_arb_io_out_valid),
    .io_out_bits_idx(meta_read_arb_io_out_bits_idx),
    .io_out_bits_way_en(meta_read_arb_io_out_bits_way_en),
    .io_out_bits_tag(meta_read_arb_io_out_bits_tag),
    .io_chosen(meta_read_arb_io_chosen)
  );
  Arbiter_4 wb_req_arb ( // @[mshrs.scala 601:30]
    .clock(wb_req_arb_clock),
    .reset(wb_req_arb_reset),
    .io_in_0_ready(wb_req_arb_io_in_0_ready),
    .io_in_0_valid(wb_req_arb_io_in_0_valid),
    .io_in_0_bits_tag(wb_req_arb_io_in_0_bits_tag),
    .io_in_0_bits_idx(wb_req_arb_io_in_0_bits_idx),
    .io_in_0_bits_source(wb_req_arb_io_in_0_bits_source),
    .io_in_0_bits_param(wb_req_arb_io_in_0_bits_param),
    .io_in_0_bits_way_en(wb_req_arb_io_in_0_bits_way_en),
    .io_in_0_bits_voluntary(wb_req_arb_io_in_0_bits_voluntary),
    .io_in_1_ready(wb_req_arb_io_in_1_ready),
    .io_in_1_valid(wb_req_arb_io_in_1_valid),
    .io_in_1_bits_tag(wb_req_arb_io_in_1_bits_tag),
    .io_in_1_bits_idx(wb_req_arb_io_in_1_bits_idx),
    .io_in_1_bits_source(wb_req_arb_io_in_1_bits_source),
    .io_in_1_bits_param(wb_req_arb_io_in_1_bits_param),
    .io_in_1_bits_way_en(wb_req_arb_io_in_1_bits_way_en),
    .io_in_1_bits_voluntary(wb_req_arb_io_in_1_bits_voluntary),
    .io_out_ready(wb_req_arb_io_out_ready),
    .io_out_valid(wb_req_arb_io_out_valid),
    .io_out_bits_tag(wb_req_arb_io_out_bits_tag),
    .io_out_bits_idx(wb_req_arb_io_out_bits_idx),
    .io_out_bits_source(wb_req_arb_io_out_bits_source),
    .io_out_bits_param(wb_req_arb_io_out_bits_param),
    .io_out_bits_way_en(wb_req_arb_io_out_bits_way_en),
    .io_out_bits_voluntary(wb_req_arb_io_out_bits_voluntary),
    .io_chosen(wb_req_arb_io_chosen)
  );
  Arbiter_5 replay_arb ( // @[mshrs.scala 602:30]
    .clock(replay_arb_clock),
    .reset(replay_arb_reset),
    .io_in_0_ready(replay_arb_io_in_0_ready),
    .io_in_0_valid(replay_arb_io_in_0_valid),
    .io_in_0_bits_uop_uopc(replay_arb_io_in_0_bits_uop_uopc),
    .io_in_0_bits_uop_inst(replay_arb_io_in_0_bits_uop_inst),
    .io_in_0_bits_uop_debug_inst(replay_arb_io_in_0_bits_uop_debug_inst),
    .io_in_0_bits_uop_is_rvc(replay_arb_io_in_0_bits_uop_is_rvc),
    .io_in_0_bits_uop_debug_pc(replay_arb_io_in_0_bits_uop_debug_pc),
    .io_in_0_bits_uop_iq_type(replay_arb_io_in_0_bits_uop_iq_type),
    .io_in_0_bits_uop_fu_code(replay_arb_io_in_0_bits_uop_fu_code),
    .io_in_0_bits_uop_ctrl_br_type(replay_arb_io_in_0_bits_uop_ctrl_br_type),
    .io_in_0_bits_uop_ctrl_op1_sel(replay_arb_io_in_0_bits_uop_ctrl_op1_sel),
    .io_in_0_bits_uop_ctrl_op2_sel(replay_arb_io_in_0_bits_uop_ctrl_op2_sel),
    .io_in_0_bits_uop_ctrl_imm_sel(replay_arb_io_in_0_bits_uop_ctrl_imm_sel),
    .io_in_0_bits_uop_ctrl_op_fcn(replay_arb_io_in_0_bits_uop_ctrl_op_fcn),
    .io_in_0_bits_uop_ctrl_fcn_dw(replay_arb_io_in_0_bits_uop_ctrl_fcn_dw),
    .io_in_0_bits_uop_ctrl_csr_cmd(replay_arb_io_in_0_bits_uop_ctrl_csr_cmd),
    .io_in_0_bits_uop_ctrl_is_load(replay_arb_io_in_0_bits_uop_ctrl_is_load),
    .io_in_0_bits_uop_ctrl_is_sta(replay_arb_io_in_0_bits_uop_ctrl_is_sta),
    .io_in_0_bits_uop_ctrl_is_std(replay_arb_io_in_0_bits_uop_ctrl_is_std),
    .io_in_0_bits_uop_iw_state(replay_arb_io_in_0_bits_uop_iw_state),
    .io_in_0_bits_uop_iw_p1_poisoned(replay_arb_io_in_0_bits_uop_iw_p1_poisoned),
    .io_in_0_bits_uop_iw_p2_poisoned(replay_arb_io_in_0_bits_uop_iw_p2_poisoned),
    .io_in_0_bits_uop_is_br(replay_arb_io_in_0_bits_uop_is_br),
    .io_in_0_bits_uop_is_jalr(replay_arb_io_in_0_bits_uop_is_jalr),
    .io_in_0_bits_uop_is_jal(replay_arb_io_in_0_bits_uop_is_jal),
    .io_in_0_bits_uop_is_sfb(replay_arb_io_in_0_bits_uop_is_sfb),
    .io_in_0_bits_uop_br_mask(replay_arb_io_in_0_bits_uop_br_mask),
    .io_in_0_bits_uop_br_tag(replay_arb_io_in_0_bits_uop_br_tag),
    .io_in_0_bits_uop_ftq_idx(replay_arb_io_in_0_bits_uop_ftq_idx),
    .io_in_0_bits_uop_edge_inst(replay_arb_io_in_0_bits_uop_edge_inst),
    .io_in_0_bits_uop_pc_lob(replay_arb_io_in_0_bits_uop_pc_lob),
    .io_in_0_bits_uop_taken(replay_arb_io_in_0_bits_uop_taken),
    .io_in_0_bits_uop_imm_packed(replay_arb_io_in_0_bits_uop_imm_packed),
    .io_in_0_bits_uop_csr_addr(replay_arb_io_in_0_bits_uop_csr_addr),
    .io_in_0_bits_uop_rob_idx(replay_arb_io_in_0_bits_uop_rob_idx),
    .io_in_0_bits_uop_ldq_idx(replay_arb_io_in_0_bits_uop_ldq_idx),
    .io_in_0_bits_uop_stq_idx(replay_arb_io_in_0_bits_uop_stq_idx),
    .io_in_0_bits_uop_rxq_idx(replay_arb_io_in_0_bits_uop_rxq_idx),
    .io_in_0_bits_uop_pdst(replay_arb_io_in_0_bits_uop_pdst),
    .io_in_0_bits_uop_prs1(replay_arb_io_in_0_bits_uop_prs1),
    .io_in_0_bits_uop_prs2(replay_arb_io_in_0_bits_uop_prs2),
    .io_in_0_bits_uop_prs3(replay_arb_io_in_0_bits_uop_prs3),
    .io_in_0_bits_uop_ppred(replay_arb_io_in_0_bits_uop_ppred),
    .io_in_0_bits_uop_prs1_busy(replay_arb_io_in_0_bits_uop_prs1_busy),
    .io_in_0_bits_uop_prs2_busy(replay_arb_io_in_0_bits_uop_prs2_busy),
    .io_in_0_bits_uop_prs3_busy(replay_arb_io_in_0_bits_uop_prs3_busy),
    .io_in_0_bits_uop_ppred_busy(replay_arb_io_in_0_bits_uop_ppred_busy),
    .io_in_0_bits_uop_stale_pdst(replay_arb_io_in_0_bits_uop_stale_pdst),
    .io_in_0_bits_uop_exception(replay_arb_io_in_0_bits_uop_exception),
    .io_in_0_bits_uop_exc_cause(replay_arb_io_in_0_bits_uop_exc_cause),
    .io_in_0_bits_uop_bypassable(replay_arb_io_in_0_bits_uop_bypassable),
    .io_in_0_bits_uop_mem_cmd(replay_arb_io_in_0_bits_uop_mem_cmd),
    .io_in_0_bits_uop_mem_size(replay_arb_io_in_0_bits_uop_mem_size),
    .io_in_0_bits_uop_mem_signed(replay_arb_io_in_0_bits_uop_mem_signed),
    .io_in_0_bits_uop_is_fence(replay_arb_io_in_0_bits_uop_is_fence),
    .io_in_0_bits_uop_is_fencei(replay_arb_io_in_0_bits_uop_is_fencei),
    .io_in_0_bits_uop_is_amo(replay_arb_io_in_0_bits_uop_is_amo),
    .io_in_0_bits_uop_uses_ldq(replay_arb_io_in_0_bits_uop_uses_ldq),
    .io_in_0_bits_uop_uses_stq(replay_arb_io_in_0_bits_uop_uses_stq),
    .io_in_0_bits_uop_is_sys_pc2epc(replay_arb_io_in_0_bits_uop_is_sys_pc2epc),
    .io_in_0_bits_uop_is_unique(replay_arb_io_in_0_bits_uop_is_unique),
    .io_in_0_bits_uop_flush_on_commit(replay_arb_io_in_0_bits_uop_flush_on_commit),
    .io_in_0_bits_uop_ldst_is_rs1(replay_arb_io_in_0_bits_uop_ldst_is_rs1),
    .io_in_0_bits_uop_ldst(replay_arb_io_in_0_bits_uop_ldst),
    .io_in_0_bits_uop_lrs1(replay_arb_io_in_0_bits_uop_lrs1),
    .io_in_0_bits_uop_lrs2(replay_arb_io_in_0_bits_uop_lrs2),
    .io_in_0_bits_uop_lrs3(replay_arb_io_in_0_bits_uop_lrs3),
    .io_in_0_bits_uop_ldst_val(replay_arb_io_in_0_bits_uop_ldst_val),
    .io_in_0_bits_uop_dst_rtype(replay_arb_io_in_0_bits_uop_dst_rtype),
    .io_in_0_bits_uop_lrs1_rtype(replay_arb_io_in_0_bits_uop_lrs1_rtype),
    .io_in_0_bits_uop_lrs2_rtype(replay_arb_io_in_0_bits_uop_lrs2_rtype),
    .io_in_0_bits_uop_frs3_en(replay_arb_io_in_0_bits_uop_frs3_en),
    .io_in_0_bits_uop_fp_val(replay_arb_io_in_0_bits_uop_fp_val),
    .io_in_0_bits_uop_fp_single(replay_arb_io_in_0_bits_uop_fp_single),
    .io_in_0_bits_uop_xcpt_pf_if(replay_arb_io_in_0_bits_uop_xcpt_pf_if),
    .io_in_0_bits_uop_xcpt_ae_if(replay_arb_io_in_0_bits_uop_xcpt_ae_if),
    .io_in_0_bits_uop_xcpt_ma_if(replay_arb_io_in_0_bits_uop_xcpt_ma_if),
    .io_in_0_bits_uop_bp_debug_if(replay_arb_io_in_0_bits_uop_bp_debug_if),
    .io_in_0_bits_uop_bp_xcpt_if(replay_arb_io_in_0_bits_uop_bp_xcpt_if),
    .io_in_0_bits_uop_debug_fsrc(replay_arb_io_in_0_bits_uop_debug_fsrc),
    .io_in_0_bits_uop_debug_tsrc(replay_arb_io_in_0_bits_uop_debug_tsrc),
    .io_in_0_bits_addr(replay_arb_io_in_0_bits_addr),
    .io_in_0_bits_data(replay_arb_io_in_0_bits_data),
    .io_in_0_bits_is_hella(replay_arb_io_in_0_bits_is_hella),
    .io_in_0_bits_tag_match(replay_arb_io_in_0_bits_tag_match),
    .io_in_0_bits_old_meta_coh_state(replay_arb_io_in_0_bits_old_meta_coh_state),
    .io_in_0_bits_old_meta_tag(replay_arb_io_in_0_bits_old_meta_tag),
    .io_in_0_bits_way_en(replay_arb_io_in_0_bits_way_en),
    .io_in_0_bits_sdq_id(replay_arb_io_in_0_bits_sdq_id),
    .io_in_1_ready(replay_arb_io_in_1_ready),
    .io_in_1_valid(replay_arb_io_in_1_valid),
    .io_in_1_bits_uop_uopc(replay_arb_io_in_1_bits_uop_uopc),
    .io_in_1_bits_uop_inst(replay_arb_io_in_1_bits_uop_inst),
    .io_in_1_bits_uop_debug_inst(replay_arb_io_in_1_bits_uop_debug_inst),
    .io_in_1_bits_uop_is_rvc(replay_arb_io_in_1_bits_uop_is_rvc),
    .io_in_1_bits_uop_debug_pc(replay_arb_io_in_1_bits_uop_debug_pc),
    .io_in_1_bits_uop_iq_type(replay_arb_io_in_1_bits_uop_iq_type),
    .io_in_1_bits_uop_fu_code(replay_arb_io_in_1_bits_uop_fu_code),
    .io_in_1_bits_uop_ctrl_br_type(replay_arb_io_in_1_bits_uop_ctrl_br_type),
    .io_in_1_bits_uop_ctrl_op1_sel(replay_arb_io_in_1_bits_uop_ctrl_op1_sel),
    .io_in_1_bits_uop_ctrl_op2_sel(replay_arb_io_in_1_bits_uop_ctrl_op2_sel),
    .io_in_1_bits_uop_ctrl_imm_sel(replay_arb_io_in_1_bits_uop_ctrl_imm_sel),
    .io_in_1_bits_uop_ctrl_op_fcn(replay_arb_io_in_1_bits_uop_ctrl_op_fcn),
    .io_in_1_bits_uop_ctrl_fcn_dw(replay_arb_io_in_1_bits_uop_ctrl_fcn_dw),
    .io_in_1_bits_uop_ctrl_csr_cmd(replay_arb_io_in_1_bits_uop_ctrl_csr_cmd),
    .io_in_1_bits_uop_ctrl_is_load(replay_arb_io_in_1_bits_uop_ctrl_is_load),
    .io_in_1_bits_uop_ctrl_is_sta(replay_arb_io_in_1_bits_uop_ctrl_is_sta),
    .io_in_1_bits_uop_ctrl_is_std(replay_arb_io_in_1_bits_uop_ctrl_is_std),
    .io_in_1_bits_uop_iw_state(replay_arb_io_in_1_bits_uop_iw_state),
    .io_in_1_bits_uop_iw_p1_poisoned(replay_arb_io_in_1_bits_uop_iw_p1_poisoned),
    .io_in_1_bits_uop_iw_p2_poisoned(replay_arb_io_in_1_bits_uop_iw_p2_poisoned),
    .io_in_1_bits_uop_is_br(replay_arb_io_in_1_bits_uop_is_br),
    .io_in_1_bits_uop_is_jalr(replay_arb_io_in_1_bits_uop_is_jalr),
    .io_in_1_bits_uop_is_jal(replay_arb_io_in_1_bits_uop_is_jal),
    .io_in_1_bits_uop_is_sfb(replay_arb_io_in_1_bits_uop_is_sfb),
    .io_in_1_bits_uop_br_mask(replay_arb_io_in_1_bits_uop_br_mask),
    .io_in_1_bits_uop_br_tag(replay_arb_io_in_1_bits_uop_br_tag),
    .io_in_1_bits_uop_ftq_idx(replay_arb_io_in_1_bits_uop_ftq_idx),
    .io_in_1_bits_uop_edge_inst(replay_arb_io_in_1_bits_uop_edge_inst),
    .io_in_1_bits_uop_pc_lob(replay_arb_io_in_1_bits_uop_pc_lob),
    .io_in_1_bits_uop_taken(replay_arb_io_in_1_bits_uop_taken),
    .io_in_1_bits_uop_imm_packed(replay_arb_io_in_1_bits_uop_imm_packed),
    .io_in_1_bits_uop_csr_addr(replay_arb_io_in_1_bits_uop_csr_addr),
    .io_in_1_bits_uop_rob_idx(replay_arb_io_in_1_bits_uop_rob_idx),
    .io_in_1_bits_uop_ldq_idx(replay_arb_io_in_1_bits_uop_ldq_idx),
    .io_in_1_bits_uop_stq_idx(replay_arb_io_in_1_bits_uop_stq_idx),
    .io_in_1_bits_uop_rxq_idx(replay_arb_io_in_1_bits_uop_rxq_idx),
    .io_in_1_bits_uop_pdst(replay_arb_io_in_1_bits_uop_pdst),
    .io_in_1_bits_uop_prs1(replay_arb_io_in_1_bits_uop_prs1),
    .io_in_1_bits_uop_prs2(replay_arb_io_in_1_bits_uop_prs2),
    .io_in_1_bits_uop_prs3(replay_arb_io_in_1_bits_uop_prs3),
    .io_in_1_bits_uop_ppred(replay_arb_io_in_1_bits_uop_ppred),
    .io_in_1_bits_uop_prs1_busy(replay_arb_io_in_1_bits_uop_prs1_busy),
    .io_in_1_bits_uop_prs2_busy(replay_arb_io_in_1_bits_uop_prs2_busy),
    .io_in_1_bits_uop_prs3_busy(replay_arb_io_in_1_bits_uop_prs3_busy),
    .io_in_1_bits_uop_ppred_busy(replay_arb_io_in_1_bits_uop_ppred_busy),
    .io_in_1_bits_uop_stale_pdst(replay_arb_io_in_1_bits_uop_stale_pdst),
    .io_in_1_bits_uop_exception(replay_arb_io_in_1_bits_uop_exception),
    .io_in_1_bits_uop_exc_cause(replay_arb_io_in_1_bits_uop_exc_cause),
    .io_in_1_bits_uop_bypassable(replay_arb_io_in_1_bits_uop_bypassable),
    .io_in_1_bits_uop_mem_cmd(replay_arb_io_in_1_bits_uop_mem_cmd),
    .io_in_1_bits_uop_mem_size(replay_arb_io_in_1_bits_uop_mem_size),
    .io_in_1_bits_uop_mem_signed(replay_arb_io_in_1_bits_uop_mem_signed),
    .io_in_1_bits_uop_is_fence(replay_arb_io_in_1_bits_uop_is_fence),
    .io_in_1_bits_uop_is_fencei(replay_arb_io_in_1_bits_uop_is_fencei),
    .io_in_1_bits_uop_is_amo(replay_arb_io_in_1_bits_uop_is_amo),
    .io_in_1_bits_uop_uses_ldq(replay_arb_io_in_1_bits_uop_uses_ldq),
    .io_in_1_bits_uop_uses_stq(replay_arb_io_in_1_bits_uop_uses_stq),
    .io_in_1_bits_uop_is_sys_pc2epc(replay_arb_io_in_1_bits_uop_is_sys_pc2epc),
    .io_in_1_bits_uop_is_unique(replay_arb_io_in_1_bits_uop_is_unique),
    .io_in_1_bits_uop_flush_on_commit(replay_arb_io_in_1_bits_uop_flush_on_commit),
    .io_in_1_bits_uop_ldst_is_rs1(replay_arb_io_in_1_bits_uop_ldst_is_rs1),
    .io_in_1_bits_uop_ldst(replay_arb_io_in_1_bits_uop_ldst),
    .io_in_1_bits_uop_lrs1(replay_arb_io_in_1_bits_uop_lrs1),
    .io_in_1_bits_uop_lrs2(replay_arb_io_in_1_bits_uop_lrs2),
    .io_in_1_bits_uop_lrs3(replay_arb_io_in_1_bits_uop_lrs3),
    .io_in_1_bits_uop_ldst_val(replay_arb_io_in_1_bits_uop_ldst_val),
    .io_in_1_bits_uop_dst_rtype(replay_arb_io_in_1_bits_uop_dst_rtype),
    .io_in_1_bits_uop_lrs1_rtype(replay_arb_io_in_1_bits_uop_lrs1_rtype),
    .io_in_1_bits_uop_lrs2_rtype(replay_arb_io_in_1_bits_uop_lrs2_rtype),
    .io_in_1_bits_uop_frs3_en(replay_arb_io_in_1_bits_uop_frs3_en),
    .io_in_1_bits_uop_fp_val(replay_arb_io_in_1_bits_uop_fp_val),
    .io_in_1_bits_uop_fp_single(replay_arb_io_in_1_bits_uop_fp_single),
    .io_in_1_bits_uop_xcpt_pf_if(replay_arb_io_in_1_bits_uop_xcpt_pf_if),
    .io_in_1_bits_uop_xcpt_ae_if(replay_arb_io_in_1_bits_uop_xcpt_ae_if),
    .io_in_1_bits_uop_xcpt_ma_if(replay_arb_io_in_1_bits_uop_xcpt_ma_if),
    .io_in_1_bits_uop_bp_debug_if(replay_arb_io_in_1_bits_uop_bp_debug_if),
    .io_in_1_bits_uop_bp_xcpt_if(replay_arb_io_in_1_bits_uop_bp_xcpt_if),
    .io_in_1_bits_uop_debug_fsrc(replay_arb_io_in_1_bits_uop_debug_fsrc),
    .io_in_1_bits_uop_debug_tsrc(replay_arb_io_in_1_bits_uop_debug_tsrc),
    .io_in_1_bits_addr(replay_arb_io_in_1_bits_addr),
    .io_in_1_bits_data(replay_arb_io_in_1_bits_data),
    .io_in_1_bits_is_hella(replay_arb_io_in_1_bits_is_hella),
    .io_in_1_bits_tag_match(replay_arb_io_in_1_bits_tag_match),
    .io_in_1_bits_old_meta_coh_state(replay_arb_io_in_1_bits_old_meta_coh_state),
    .io_in_1_bits_old_meta_tag(replay_arb_io_in_1_bits_old_meta_tag),
    .io_in_1_bits_way_en(replay_arb_io_in_1_bits_way_en),
    .io_in_1_bits_sdq_id(replay_arb_io_in_1_bits_sdq_id),
    .io_out_ready(replay_arb_io_out_ready),
    .io_out_valid(replay_arb_io_out_valid),
    .io_out_bits_uop_uopc(replay_arb_io_out_bits_uop_uopc),
    .io_out_bits_uop_inst(replay_arb_io_out_bits_uop_inst),
    .io_out_bits_uop_debug_inst(replay_arb_io_out_bits_uop_debug_inst),
    .io_out_bits_uop_is_rvc(replay_arb_io_out_bits_uop_is_rvc),
    .io_out_bits_uop_debug_pc(replay_arb_io_out_bits_uop_debug_pc),
    .io_out_bits_uop_iq_type(replay_arb_io_out_bits_uop_iq_type),
    .io_out_bits_uop_fu_code(replay_arb_io_out_bits_uop_fu_code),
    .io_out_bits_uop_ctrl_br_type(replay_arb_io_out_bits_uop_ctrl_br_type),
    .io_out_bits_uop_ctrl_op1_sel(replay_arb_io_out_bits_uop_ctrl_op1_sel),
    .io_out_bits_uop_ctrl_op2_sel(replay_arb_io_out_bits_uop_ctrl_op2_sel),
    .io_out_bits_uop_ctrl_imm_sel(replay_arb_io_out_bits_uop_ctrl_imm_sel),
    .io_out_bits_uop_ctrl_op_fcn(replay_arb_io_out_bits_uop_ctrl_op_fcn),
    .io_out_bits_uop_ctrl_fcn_dw(replay_arb_io_out_bits_uop_ctrl_fcn_dw),
    .io_out_bits_uop_ctrl_csr_cmd(replay_arb_io_out_bits_uop_ctrl_csr_cmd),
    .io_out_bits_uop_ctrl_is_load(replay_arb_io_out_bits_uop_ctrl_is_load),
    .io_out_bits_uop_ctrl_is_sta(replay_arb_io_out_bits_uop_ctrl_is_sta),
    .io_out_bits_uop_ctrl_is_std(replay_arb_io_out_bits_uop_ctrl_is_std),
    .io_out_bits_uop_iw_state(replay_arb_io_out_bits_uop_iw_state),
    .io_out_bits_uop_iw_p1_poisoned(replay_arb_io_out_bits_uop_iw_p1_poisoned),
    .io_out_bits_uop_iw_p2_poisoned(replay_arb_io_out_bits_uop_iw_p2_poisoned),
    .io_out_bits_uop_is_br(replay_arb_io_out_bits_uop_is_br),
    .io_out_bits_uop_is_jalr(replay_arb_io_out_bits_uop_is_jalr),
    .io_out_bits_uop_is_jal(replay_arb_io_out_bits_uop_is_jal),
    .io_out_bits_uop_is_sfb(replay_arb_io_out_bits_uop_is_sfb),
    .io_out_bits_uop_br_mask(replay_arb_io_out_bits_uop_br_mask),
    .io_out_bits_uop_br_tag(replay_arb_io_out_bits_uop_br_tag),
    .io_out_bits_uop_ftq_idx(replay_arb_io_out_bits_uop_ftq_idx),
    .io_out_bits_uop_edge_inst(replay_arb_io_out_bits_uop_edge_inst),
    .io_out_bits_uop_pc_lob(replay_arb_io_out_bits_uop_pc_lob),
    .io_out_bits_uop_taken(replay_arb_io_out_bits_uop_taken),
    .io_out_bits_uop_imm_packed(replay_arb_io_out_bits_uop_imm_packed),
    .io_out_bits_uop_csr_addr(replay_arb_io_out_bits_uop_csr_addr),
    .io_out_bits_uop_rob_idx(replay_arb_io_out_bits_uop_rob_idx),
    .io_out_bits_uop_ldq_idx(replay_arb_io_out_bits_uop_ldq_idx),
    .io_out_bits_uop_stq_idx(replay_arb_io_out_bits_uop_stq_idx),
    .io_out_bits_uop_rxq_idx(replay_arb_io_out_bits_uop_rxq_idx),
    .io_out_bits_uop_pdst(replay_arb_io_out_bits_uop_pdst),
    .io_out_bits_uop_prs1(replay_arb_io_out_bits_uop_prs1),
    .io_out_bits_uop_prs2(replay_arb_io_out_bits_uop_prs2),
    .io_out_bits_uop_prs3(replay_arb_io_out_bits_uop_prs3),
    .io_out_bits_uop_ppred(replay_arb_io_out_bits_uop_ppred),
    .io_out_bits_uop_prs1_busy(replay_arb_io_out_bits_uop_prs1_busy),
    .io_out_bits_uop_prs2_busy(replay_arb_io_out_bits_uop_prs2_busy),
    .io_out_bits_uop_prs3_busy(replay_arb_io_out_bits_uop_prs3_busy),
    .io_out_bits_uop_ppred_busy(replay_arb_io_out_bits_uop_ppred_busy),
    .io_out_bits_uop_stale_pdst(replay_arb_io_out_bits_uop_stale_pdst),
    .io_out_bits_uop_exception(replay_arb_io_out_bits_uop_exception),
    .io_out_bits_uop_exc_cause(replay_arb_io_out_bits_uop_exc_cause),
    .io_out_bits_uop_bypassable(replay_arb_io_out_bits_uop_bypassable),
    .io_out_bits_uop_mem_cmd(replay_arb_io_out_bits_uop_mem_cmd),
    .io_out_bits_uop_mem_size(replay_arb_io_out_bits_uop_mem_size),
    .io_out_bits_uop_mem_signed(replay_arb_io_out_bits_uop_mem_signed),
    .io_out_bits_uop_is_fence(replay_arb_io_out_bits_uop_is_fence),
    .io_out_bits_uop_is_fencei(replay_arb_io_out_bits_uop_is_fencei),
    .io_out_bits_uop_is_amo(replay_arb_io_out_bits_uop_is_amo),
    .io_out_bits_uop_uses_ldq(replay_arb_io_out_bits_uop_uses_ldq),
    .io_out_bits_uop_uses_stq(replay_arb_io_out_bits_uop_uses_stq),
    .io_out_bits_uop_is_sys_pc2epc(replay_arb_io_out_bits_uop_is_sys_pc2epc),
    .io_out_bits_uop_is_unique(replay_arb_io_out_bits_uop_is_unique),
    .io_out_bits_uop_flush_on_commit(replay_arb_io_out_bits_uop_flush_on_commit),
    .io_out_bits_uop_ldst_is_rs1(replay_arb_io_out_bits_uop_ldst_is_rs1),
    .io_out_bits_uop_ldst(replay_arb_io_out_bits_uop_ldst),
    .io_out_bits_uop_lrs1(replay_arb_io_out_bits_uop_lrs1),
    .io_out_bits_uop_lrs2(replay_arb_io_out_bits_uop_lrs2),
    .io_out_bits_uop_lrs3(replay_arb_io_out_bits_uop_lrs3),
    .io_out_bits_uop_ldst_val(replay_arb_io_out_bits_uop_ldst_val),
    .io_out_bits_uop_dst_rtype(replay_arb_io_out_bits_uop_dst_rtype),
    .io_out_bits_uop_lrs1_rtype(replay_arb_io_out_bits_uop_lrs1_rtype),
    .io_out_bits_uop_lrs2_rtype(replay_arb_io_out_bits_uop_lrs2_rtype),
    .io_out_bits_uop_frs3_en(replay_arb_io_out_bits_uop_frs3_en),
    .io_out_bits_uop_fp_val(replay_arb_io_out_bits_uop_fp_val),
    .io_out_bits_uop_fp_single(replay_arb_io_out_bits_uop_fp_single),
    .io_out_bits_uop_xcpt_pf_if(replay_arb_io_out_bits_uop_xcpt_pf_if),
    .io_out_bits_uop_xcpt_ae_if(replay_arb_io_out_bits_uop_xcpt_ae_if),
    .io_out_bits_uop_xcpt_ma_if(replay_arb_io_out_bits_uop_xcpt_ma_if),
    .io_out_bits_uop_bp_debug_if(replay_arb_io_out_bits_uop_bp_debug_if),
    .io_out_bits_uop_bp_xcpt_if(replay_arb_io_out_bits_uop_bp_xcpt_if),
    .io_out_bits_uop_debug_fsrc(replay_arb_io_out_bits_uop_debug_fsrc),
    .io_out_bits_uop_debug_tsrc(replay_arb_io_out_bits_uop_debug_tsrc),
    .io_out_bits_addr(replay_arb_io_out_bits_addr),
    .io_out_bits_data(replay_arb_io_out_bits_data),
    .io_out_bits_is_hella(replay_arb_io_out_bits_is_hella),
    .io_out_bits_tag_match(replay_arb_io_out_bits_tag_match),
    .io_out_bits_old_meta_coh_state(replay_arb_io_out_bits_old_meta_coh_state),
    .io_out_bits_old_meta_tag(replay_arb_io_out_bits_old_meta_tag),
    .io_out_bits_way_en(replay_arb_io_out_bits_way_en),
    .io_out_bits_sdq_id(replay_arb_io_out_bits_sdq_id),
    .io_chosen(replay_arb_io_chosen)
  );
  Arbiter_6 resp_arb ( // @[mshrs.scala 603:30]
    .clock(resp_arb_clock),
    .reset(resp_arb_reset),
    .io_in_0_ready(resp_arb_io_in_0_ready),
    .io_in_0_valid(resp_arb_io_in_0_valid),
    .io_in_0_bits_uop_uopc(resp_arb_io_in_0_bits_uop_uopc),
    .io_in_0_bits_uop_inst(resp_arb_io_in_0_bits_uop_inst),
    .io_in_0_bits_uop_debug_inst(resp_arb_io_in_0_bits_uop_debug_inst),
    .io_in_0_bits_uop_is_rvc(resp_arb_io_in_0_bits_uop_is_rvc),
    .io_in_0_bits_uop_debug_pc(resp_arb_io_in_0_bits_uop_debug_pc),
    .io_in_0_bits_uop_iq_type(resp_arb_io_in_0_bits_uop_iq_type),
    .io_in_0_bits_uop_fu_code(resp_arb_io_in_0_bits_uop_fu_code),
    .io_in_0_bits_uop_ctrl_br_type(resp_arb_io_in_0_bits_uop_ctrl_br_type),
    .io_in_0_bits_uop_ctrl_op1_sel(resp_arb_io_in_0_bits_uop_ctrl_op1_sel),
    .io_in_0_bits_uop_ctrl_op2_sel(resp_arb_io_in_0_bits_uop_ctrl_op2_sel),
    .io_in_0_bits_uop_ctrl_imm_sel(resp_arb_io_in_0_bits_uop_ctrl_imm_sel),
    .io_in_0_bits_uop_ctrl_op_fcn(resp_arb_io_in_0_bits_uop_ctrl_op_fcn),
    .io_in_0_bits_uop_ctrl_fcn_dw(resp_arb_io_in_0_bits_uop_ctrl_fcn_dw),
    .io_in_0_bits_uop_ctrl_csr_cmd(resp_arb_io_in_0_bits_uop_ctrl_csr_cmd),
    .io_in_0_bits_uop_ctrl_is_load(resp_arb_io_in_0_bits_uop_ctrl_is_load),
    .io_in_0_bits_uop_ctrl_is_sta(resp_arb_io_in_0_bits_uop_ctrl_is_sta),
    .io_in_0_bits_uop_ctrl_is_std(resp_arb_io_in_0_bits_uop_ctrl_is_std),
    .io_in_0_bits_uop_iw_state(resp_arb_io_in_0_bits_uop_iw_state),
    .io_in_0_bits_uop_iw_p1_poisoned(resp_arb_io_in_0_bits_uop_iw_p1_poisoned),
    .io_in_0_bits_uop_iw_p2_poisoned(resp_arb_io_in_0_bits_uop_iw_p2_poisoned),
    .io_in_0_bits_uop_is_br(resp_arb_io_in_0_bits_uop_is_br),
    .io_in_0_bits_uop_is_jalr(resp_arb_io_in_0_bits_uop_is_jalr),
    .io_in_0_bits_uop_is_jal(resp_arb_io_in_0_bits_uop_is_jal),
    .io_in_0_bits_uop_is_sfb(resp_arb_io_in_0_bits_uop_is_sfb),
    .io_in_0_bits_uop_br_mask(resp_arb_io_in_0_bits_uop_br_mask),
    .io_in_0_bits_uop_br_tag(resp_arb_io_in_0_bits_uop_br_tag),
    .io_in_0_bits_uop_ftq_idx(resp_arb_io_in_0_bits_uop_ftq_idx),
    .io_in_0_bits_uop_edge_inst(resp_arb_io_in_0_bits_uop_edge_inst),
    .io_in_0_bits_uop_pc_lob(resp_arb_io_in_0_bits_uop_pc_lob),
    .io_in_0_bits_uop_taken(resp_arb_io_in_0_bits_uop_taken),
    .io_in_0_bits_uop_imm_packed(resp_arb_io_in_0_bits_uop_imm_packed),
    .io_in_0_bits_uop_csr_addr(resp_arb_io_in_0_bits_uop_csr_addr),
    .io_in_0_bits_uop_rob_idx(resp_arb_io_in_0_bits_uop_rob_idx),
    .io_in_0_bits_uop_ldq_idx(resp_arb_io_in_0_bits_uop_ldq_idx),
    .io_in_0_bits_uop_stq_idx(resp_arb_io_in_0_bits_uop_stq_idx),
    .io_in_0_bits_uop_rxq_idx(resp_arb_io_in_0_bits_uop_rxq_idx),
    .io_in_0_bits_uop_pdst(resp_arb_io_in_0_bits_uop_pdst),
    .io_in_0_bits_uop_prs1(resp_arb_io_in_0_bits_uop_prs1),
    .io_in_0_bits_uop_prs2(resp_arb_io_in_0_bits_uop_prs2),
    .io_in_0_bits_uop_prs3(resp_arb_io_in_0_bits_uop_prs3),
    .io_in_0_bits_uop_ppred(resp_arb_io_in_0_bits_uop_ppred),
    .io_in_0_bits_uop_prs1_busy(resp_arb_io_in_0_bits_uop_prs1_busy),
    .io_in_0_bits_uop_prs2_busy(resp_arb_io_in_0_bits_uop_prs2_busy),
    .io_in_0_bits_uop_prs3_busy(resp_arb_io_in_0_bits_uop_prs3_busy),
    .io_in_0_bits_uop_ppred_busy(resp_arb_io_in_0_bits_uop_ppred_busy),
    .io_in_0_bits_uop_stale_pdst(resp_arb_io_in_0_bits_uop_stale_pdst),
    .io_in_0_bits_uop_exception(resp_arb_io_in_0_bits_uop_exception),
    .io_in_0_bits_uop_exc_cause(resp_arb_io_in_0_bits_uop_exc_cause),
    .io_in_0_bits_uop_bypassable(resp_arb_io_in_0_bits_uop_bypassable),
    .io_in_0_bits_uop_mem_cmd(resp_arb_io_in_0_bits_uop_mem_cmd),
    .io_in_0_bits_uop_mem_size(resp_arb_io_in_0_bits_uop_mem_size),
    .io_in_0_bits_uop_mem_signed(resp_arb_io_in_0_bits_uop_mem_signed),
    .io_in_0_bits_uop_is_fence(resp_arb_io_in_0_bits_uop_is_fence),
    .io_in_0_bits_uop_is_fencei(resp_arb_io_in_0_bits_uop_is_fencei),
    .io_in_0_bits_uop_is_amo(resp_arb_io_in_0_bits_uop_is_amo),
    .io_in_0_bits_uop_uses_ldq(resp_arb_io_in_0_bits_uop_uses_ldq),
    .io_in_0_bits_uop_uses_stq(resp_arb_io_in_0_bits_uop_uses_stq),
    .io_in_0_bits_uop_is_sys_pc2epc(resp_arb_io_in_0_bits_uop_is_sys_pc2epc),
    .io_in_0_bits_uop_is_unique(resp_arb_io_in_0_bits_uop_is_unique),
    .io_in_0_bits_uop_flush_on_commit(resp_arb_io_in_0_bits_uop_flush_on_commit),
    .io_in_0_bits_uop_ldst_is_rs1(resp_arb_io_in_0_bits_uop_ldst_is_rs1),
    .io_in_0_bits_uop_ldst(resp_arb_io_in_0_bits_uop_ldst),
    .io_in_0_bits_uop_lrs1(resp_arb_io_in_0_bits_uop_lrs1),
    .io_in_0_bits_uop_lrs2(resp_arb_io_in_0_bits_uop_lrs2),
    .io_in_0_bits_uop_lrs3(resp_arb_io_in_0_bits_uop_lrs3),
    .io_in_0_bits_uop_ldst_val(resp_arb_io_in_0_bits_uop_ldst_val),
    .io_in_0_bits_uop_dst_rtype(resp_arb_io_in_0_bits_uop_dst_rtype),
    .io_in_0_bits_uop_lrs1_rtype(resp_arb_io_in_0_bits_uop_lrs1_rtype),
    .io_in_0_bits_uop_lrs2_rtype(resp_arb_io_in_0_bits_uop_lrs2_rtype),
    .io_in_0_bits_uop_frs3_en(resp_arb_io_in_0_bits_uop_frs3_en),
    .io_in_0_bits_uop_fp_val(resp_arb_io_in_0_bits_uop_fp_val),
    .io_in_0_bits_uop_fp_single(resp_arb_io_in_0_bits_uop_fp_single),
    .io_in_0_bits_uop_xcpt_pf_if(resp_arb_io_in_0_bits_uop_xcpt_pf_if),
    .io_in_0_bits_uop_xcpt_ae_if(resp_arb_io_in_0_bits_uop_xcpt_ae_if),
    .io_in_0_bits_uop_xcpt_ma_if(resp_arb_io_in_0_bits_uop_xcpt_ma_if),
    .io_in_0_bits_uop_bp_debug_if(resp_arb_io_in_0_bits_uop_bp_debug_if),
    .io_in_0_bits_uop_bp_xcpt_if(resp_arb_io_in_0_bits_uop_bp_xcpt_if),
    .io_in_0_bits_uop_debug_fsrc(resp_arb_io_in_0_bits_uop_debug_fsrc),
    .io_in_0_bits_uop_debug_tsrc(resp_arb_io_in_0_bits_uop_debug_tsrc),
    .io_in_0_bits_data(resp_arb_io_in_0_bits_data),
    .io_in_0_bits_is_hella(resp_arb_io_in_0_bits_is_hella),
    .io_in_1_ready(resp_arb_io_in_1_ready),
    .io_in_1_valid(resp_arb_io_in_1_valid),
    .io_in_1_bits_uop_uopc(resp_arb_io_in_1_bits_uop_uopc),
    .io_in_1_bits_uop_inst(resp_arb_io_in_1_bits_uop_inst),
    .io_in_1_bits_uop_debug_inst(resp_arb_io_in_1_bits_uop_debug_inst),
    .io_in_1_bits_uop_is_rvc(resp_arb_io_in_1_bits_uop_is_rvc),
    .io_in_1_bits_uop_debug_pc(resp_arb_io_in_1_bits_uop_debug_pc),
    .io_in_1_bits_uop_iq_type(resp_arb_io_in_1_bits_uop_iq_type),
    .io_in_1_bits_uop_fu_code(resp_arb_io_in_1_bits_uop_fu_code),
    .io_in_1_bits_uop_ctrl_br_type(resp_arb_io_in_1_bits_uop_ctrl_br_type),
    .io_in_1_bits_uop_ctrl_op1_sel(resp_arb_io_in_1_bits_uop_ctrl_op1_sel),
    .io_in_1_bits_uop_ctrl_op2_sel(resp_arb_io_in_1_bits_uop_ctrl_op2_sel),
    .io_in_1_bits_uop_ctrl_imm_sel(resp_arb_io_in_1_bits_uop_ctrl_imm_sel),
    .io_in_1_bits_uop_ctrl_op_fcn(resp_arb_io_in_1_bits_uop_ctrl_op_fcn),
    .io_in_1_bits_uop_ctrl_fcn_dw(resp_arb_io_in_1_bits_uop_ctrl_fcn_dw),
    .io_in_1_bits_uop_ctrl_csr_cmd(resp_arb_io_in_1_bits_uop_ctrl_csr_cmd),
    .io_in_1_bits_uop_ctrl_is_load(resp_arb_io_in_1_bits_uop_ctrl_is_load),
    .io_in_1_bits_uop_ctrl_is_sta(resp_arb_io_in_1_bits_uop_ctrl_is_sta),
    .io_in_1_bits_uop_ctrl_is_std(resp_arb_io_in_1_bits_uop_ctrl_is_std),
    .io_in_1_bits_uop_iw_state(resp_arb_io_in_1_bits_uop_iw_state),
    .io_in_1_bits_uop_iw_p1_poisoned(resp_arb_io_in_1_bits_uop_iw_p1_poisoned),
    .io_in_1_bits_uop_iw_p2_poisoned(resp_arb_io_in_1_bits_uop_iw_p2_poisoned),
    .io_in_1_bits_uop_is_br(resp_arb_io_in_1_bits_uop_is_br),
    .io_in_1_bits_uop_is_jalr(resp_arb_io_in_1_bits_uop_is_jalr),
    .io_in_1_bits_uop_is_jal(resp_arb_io_in_1_bits_uop_is_jal),
    .io_in_1_bits_uop_is_sfb(resp_arb_io_in_1_bits_uop_is_sfb),
    .io_in_1_bits_uop_br_mask(resp_arb_io_in_1_bits_uop_br_mask),
    .io_in_1_bits_uop_br_tag(resp_arb_io_in_1_bits_uop_br_tag),
    .io_in_1_bits_uop_ftq_idx(resp_arb_io_in_1_bits_uop_ftq_idx),
    .io_in_1_bits_uop_edge_inst(resp_arb_io_in_1_bits_uop_edge_inst),
    .io_in_1_bits_uop_pc_lob(resp_arb_io_in_1_bits_uop_pc_lob),
    .io_in_1_bits_uop_taken(resp_arb_io_in_1_bits_uop_taken),
    .io_in_1_bits_uop_imm_packed(resp_arb_io_in_1_bits_uop_imm_packed),
    .io_in_1_bits_uop_csr_addr(resp_arb_io_in_1_bits_uop_csr_addr),
    .io_in_1_bits_uop_rob_idx(resp_arb_io_in_1_bits_uop_rob_idx),
    .io_in_1_bits_uop_ldq_idx(resp_arb_io_in_1_bits_uop_ldq_idx),
    .io_in_1_bits_uop_stq_idx(resp_arb_io_in_1_bits_uop_stq_idx),
    .io_in_1_bits_uop_rxq_idx(resp_arb_io_in_1_bits_uop_rxq_idx),
    .io_in_1_bits_uop_pdst(resp_arb_io_in_1_bits_uop_pdst),
    .io_in_1_bits_uop_prs1(resp_arb_io_in_1_bits_uop_prs1),
    .io_in_1_bits_uop_prs2(resp_arb_io_in_1_bits_uop_prs2),
    .io_in_1_bits_uop_prs3(resp_arb_io_in_1_bits_uop_prs3),
    .io_in_1_bits_uop_ppred(resp_arb_io_in_1_bits_uop_ppred),
    .io_in_1_bits_uop_prs1_busy(resp_arb_io_in_1_bits_uop_prs1_busy),
    .io_in_1_bits_uop_prs2_busy(resp_arb_io_in_1_bits_uop_prs2_busy),
    .io_in_1_bits_uop_prs3_busy(resp_arb_io_in_1_bits_uop_prs3_busy),
    .io_in_1_bits_uop_ppred_busy(resp_arb_io_in_1_bits_uop_ppred_busy),
    .io_in_1_bits_uop_stale_pdst(resp_arb_io_in_1_bits_uop_stale_pdst),
    .io_in_1_bits_uop_exception(resp_arb_io_in_1_bits_uop_exception),
    .io_in_1_bits_uop_exc_cause(resp_arb_io_in_1_bits_uop_exc_cause),
    .io_in_1_bits_uop_bypassable(resp_arb_io_in_1_bits_uop_bypassable),
    .io_in_1_bits_uop_mem_cmd(resp_arb_io_in_1_bits_uop_mem_cmd),
    .io_in_1_bits_uop_mem_size(resp_arb_io_in_1_bits_uop_mem_size),
    .io_in_1_bits_uop_mem_signed(resp_arb_io_in_1_bits_uop_mem_signed),
    .io_in_1_bits_uop_is_fence(resp_arb_io_in_1_bits_uop_is_fence),
    .io_in_1_bits_uop_is_fencei(resp_arb_io_in_1_bits_uop_is_fencei),
    .io_in_1_bits_uop_is_amo(resp_arb_io_in_1_bits_uop_is_amo),
    .io_in_1_bits_uop_uses_ldq(resp_arb_io_in_1_bits_uop_uses_ldq),
    .io_in_1_bits_uop_uses_stq(resp_arb_io_in_1_bits_uop_uses_stq),
    .io_in_1_bits_uop_is_sys_pc2epc(resp_arb_io_in_1_bits_uop_is_sys_pc2epc),
    .io_in_1_bits_uop_is_unique(resp_arb_io_in_1_bits_uop_is_unique),
    .io_in_1_bits_uop_flush_on_commit(resp_arb_io_in_1_bits_uop_flush_on_commit),
    .io_in_1_bits_uop_ldst_is_rs1(resp_arb_io_in_1_bits_uop_ldst_is_rs1),
    .io_in_1_bits_uop_ldst(resp_arb_io_in_1_bits_uop_ldst),
    .io_in_1_bits_uop_lrs1(resp_arb_io_in_1_bits_uop_lrs1),
    .io_in_1_bits_uop_lrs2(resp_arb_io_in_1_bits_uop_lrs2),
    .io_in_1_bits_uop_lrs3(resp_arb_io_in_1_bits_uop_lrs3),
    .io_in_1_bits_uop_ldst_val(resp_arb_io_in_1_bits_uop_ldst_val),
    .io_in_1_bits_uop_dst_rtype(resp_arb_io_in_1_bits_uop_dst_rtype),
    .io_in_1_bits_uop_lrs1_rtype(resp_arb_io_in_1_bits_uop_lrs1_rtype),
    .io_in_1_bits_uop_lrs2_rtype(resp_arb_io_in_1_bits_uop_lrs2_rtype),
    .io_in_1_bits_uop_frs3_en(resp_arb_io_in_1_bits_uop_frs3_en),
    .io_in_1_bits_uop_fp_val(resp_arb_io_in_1_bits_uop_fp_val),
    .io_in_1_bits_uop_fp_single(resp_arb_io_in_1_bits_uop_fp_single),
    .io_in_1_bits_uop_xcpt_pf_if(resp_arb_io_in_1_bits_uop_xcpt_pf_if),
    .io_in_1_bits_uop_xcpt_ae_if(resp_arb_io_in_1_bits_uop_xcpt_ae_if),
    .io_in_1_bits_uop_xcpt_ma_if(resp_arb_io_in_1_bits_uop_xcpt_ma_if),
    .io_in_1_bits_uop_bp_debug_if(resp_arb_io_in_1_bits_uop_bp_debug_if),
    .io_in_1_bits_uop_bp_xcpt_if(resp_arb_io_in_1_bits_uop_bp_xcpt_if),
    .io_in_1_bits_uop_debug_fsrc(resp_arb_io_in_1_bits_uop_debug_fsrc),
    .io_in_1_bits_uop_debug_tsrc(resp_arb_io_in_1_bits_uop_debug_tsrc),
    .io_in_1_bits_data(resp_arb_io_in_1_bits_data),
    .io_in_1_bits_is_hella(resp_arb_io_in_1_bits_is_hella),
    .io_in_2_ready(resp_arb_io_in_2_ready),
    .io_in_2_valid(resp_arb_io_in_2_valid),
    .io_in_2_bits_uop_uopc(resp_arb_io_in_2_bits_uop_uopc),
    .io_in_2_bits_uop_inst(resp_arb_io_in_2_bits_uop_inst),
    .io_in_2_bits_uop_debug_inst(resp_arb_io_in_2_bits_uop_debug_inst),
    .io_in_2_bits_uop_is_rvc(resp_arb_io_in_2_bits_uop_is_rvc),
    .io_in_2_bits_uop_debug_pc(resp_arb_io_in_2_bits_uop_debug_pc),
    .io_in_2_bits_uop_iq_type(resp_arb_io_in_2_bits_uop_iq_type),
    .io_in_2_bits_uop_fu_code(resp_arb_io_in_2_bits_uop_fu_code),
    .io_in_2_bits_uop_ctrl_br_type(resp_arb_io_in_2_bits_uop_ctrl_br_type),
    .io_in_2_bits_uop_ctrl_op1_sel(resp_arb_io_in_2_bits_uop_ctrl_op1_sel),
    .io_in_2_bits_uop_ctrl_op2_sel(resp_arb_io_in_2_bits_uop_ctrl_op2_sel),
    .io_in_2_bits_uop_ctrl_imm_sel(resp_arb_io_in_2_bits_uop_ctrl_imm_sel),
    .io_in_2_bits_uop_ctrl_op_fcn(resp_arb_io_in_2_bits_uop_ctrl_op_fcn),
    .io_in_2_bits_uop_ctrl_fcn_dw(resp_arb_io_in_2_bits_uop_ctrl_fcn_dw),
    .io_in_2_bits_uop_ctrl_csr_cmd(resp_arb_io_in_2_bits_uop_ctrl_csr_cmd),
    .io_in_2_bits_uop_ctrl_is_load(resp_arb_io_in_2_bits_uop_ctrl_is_load),
    .io_in_2_bits_uop_ctrl_is_sta(resp_arb_io_in_2_bits_uop_ctrl_is_sta),
    .io_in_2_bits_uop_ctrl_is_std(resp_arb_io_in_2_bits_uop_ctrl_is_std),
    .io_in_2_bits_uop_iw_state(resp_arb_io_in_2_bits_uop_iw_state),
    .io_in_2_bits_uop_iw_p1_poisoned(resp_arb_io_in_2_bits_uop_iw_p1_poisoned),
    .io_in_2_bits_uop_iw_p2_poisoned(resp_arb_io_in_2_bits_uop_iw_p2_poisoned),
    .io_in_2_bits_uop_is_br(resp_arb_io_in_2_bits_uop_is_br),
    .io_in_2_bits_uop_is_jalr(resp_arb_io_in_2_bits_uop_is_jalr),
    .io_in_2_bits_uop_is_jal(resp_arb_io_in_2_bits_uop_is_jal),
    .io_in_2_bits_uop_is_sfb(resp_arb_io_in_2_bits_uop_is_sfb),
    .io_in_2_bits_uop_br_mask(resp_arb_io_in_2_bits_uop_br_mask),
    .io_in_2_bits_uop_br_tag(resp_arb_io_in_2_bits_uop_br_tag),
    .io_in_2_bits_uop_ftq_idx(resp_arb_io_in_2_bits_uop_ftq_idx),
    .io_in_2_bits_uop_edge_inst(resp_arb_io_in_2_bits_uop_edge_inst),
    .io_in_2_bits_uop_pc_lob(resp_arb_io_in_2_bits_uop_pc_lob),
    .io_in_2_bits_uop_taken(resp_arb_io_in_2_bits_uop_taken),
    .io_in_2_bits_uop_imm_packed(resp_arb_io_in_2_bits_uop_imm_packed),
    .io_in_2_bits_uop_csr_addr(resp_arb_io_in_2_bits_uop_csr_addr),
    .io_in_2_bits_uop_rob_idx(resp_arb_io_in_2_bits_uop_rob_idx),
    .io_in_2_bits_uop_ldq_idx(resp_arb_io_in_2_bits_uop_ldq_idx),
    .io_in_2_bits_uop_stq_idx(resp_arb_io_in_2_bits_uop_stq_idx),
    .io_in_2_bits_uop_rxq_idx(resp_arb_io_in_2_bits_uop_rxq_idx),
    .io_in_2_bits_uop_pdst(resp_arb_io_in_2_bits_uop_pdst),
    .io_in_2_bits_uop_prs1(resp_arb_io_in_2_bits_uop_prs1),
    .io_in_2_bits_uop_prs2(resp_arb_io_in_2_bits_uop_prs2),
    .io_in_2_bits_uop_prs3(resp_arb_io_in_2_bits_uop_prs3),
    .io_in_2_bits_uop_ppred(resp_arb_io_in_2_bits_uop_ppred),
    .io_in_2_bits_uop_prs1_busy(resp_arb_io_in_2_bits_uop_prs1_busy),
    .io_in_2_bits_uop_prs2_busy(resp_arb_io_in_2_bits_uop_prs2_busy),
    .io_in_2_bits_uop_prs3_busy(resp_arb_io_in_2_bits_uop_prs3_busy),
    .io_in_2_bits_uop_ppred_busy(resp_arb_io_in_2_bits_uop_ppred_busy),
    .io_in_2_bits_uop_stale_pdst(resp_arb_io_in_2_bits_uop_stale_pdst),
    .io_in_2_bits_uop_exception(resp_arb_io_in_2_bits_uop_exception),
    .io_in_2_bits_uop_exc_cause(resp_arb_io_in_2_bits_uop_exc_cause),
    .io_in_2_bits_uop_bypassable(resp_arb_io_in_2_bits_uop_bypassable),
    .io_in_2_bits_uop_mem_cmd(resp_arb_io_in_2_bits_uop_mem_cmd),
    .io_in_2_bits_uop_mem_size(resp_arb_io_in_2_bits_uop_mem_size),
    .io_in_2_bits_uop_mem_signed(resp_arb_io_in_2_bits_uop_mem_signed),
    .io_in_2_bits_uop_is_fence(resp_arb_io_in_2_bits_uop_is_fence),
    .io_in_2_bits_uop_is_fencei(resp_arb_io_in_2_bits_uop_is_fencei),
    .io_in_2_bits_uop_is_amo(resp_arb_io_in_2_bits_uop_is_amo),
    .io_in_2_bits_uop_uses_ldq(resp_arb_io_in_2_bits_uop_uses_ldq),
    .io_in_2_bits_uop_uses_stq(resp_arb_io_in_2_bits_uop_uses_stq),
    .io_in_2_bits_uop_is_sys_pc2epc(resp_arb_io_in_2_bits_uop_is_sys_pc2epc),
    .io_in_2_bits_uop_is_unique(resp_arb_io_in_2_bits_uop_is_unique),
    .io_in_2_bits_uop_flush_on_commit(resp_arb_io_in_2_bits_uop_flush_on_commit),
    .io_in_2_bits_uop_ldst_is_rs1(resp_arb_io_in_2_bits_uop_ldst_is_rs1),
    .io_in_2_bits_uop_ldst(resp_arb_io_in_2_bits_uop_ldst),
    .io_in_2_bits_uop_lrs1(resp_arb_io_in_2_bits_uop_lrs1),
    .io_in_2_bits_uop_lrs2(resp_arb_io_in_2_bits_uop_lrs2),
    .io_in_2_bits_uop_lrs3(resp_arb_io_in_2_bits_uop_lrs3),
    .io_in_2_bits_uop_ldst_val(resp_arb_io_in_2_bits_uop_ldst_val),
    .io_in_2_bits_uop_dst_rtype(resp_arb_io_in_2_bits_uop_dst_rtype),
    .io_in_2_bits_uop_lrs1_rtype(resp_arb_io_in_2_bits_uop_lrs1_rtype),
    .io_in_2_bits_uop_lrs2_rtype(resp_arb_io_in_2_bits_uop_lrs2_rtype),
    .io_in_2_bits_uop_frs3_en(resp_arb_io_in_2_bits_uop_frs3_en),
    .io_in_2_bits_uop_fp_val(resp_arb_io_in_2_bits_uop_fp_val),
    .io_in_2_bits_uop_fp_single(resp_arb_io_in_2_bits_uop_fp_single),
    .io_in_2_bits_uop_xcpt_pf_if(resp_arb_io_in_2_bits_uop_xcpt_pf_if),
    .io_in_2_bits_uop_xcpt_ae_if(resp_arb_io_in_2_bits_uop_xcpt_ae_if),
    .io_in_2_bits_uop_xcpt_ma_if(resp_arb_io_in_2_bits_uop_xcpt_ma_if),
    .io_in_2_bits_uop_bp_debug_if(resp_arb_io_in_2_bits_uop_bp_debug_if),
    .io_in_2_bits_uop_bp_xcpt_if(resp_arb_io_in_2_bits_uop_bp_xcpt_if),
    .io_in_2_bits_uop_debug_fsrc(resp_arb_io_in_2_bits_uop_debug_fsrc),
    .io_in_2_bits_uop_debug_tsrc(resp_arb_io_in_2_bits_uop_debug_tsrc),
    .io_in_2_bits_data(resp_arb_io_in_2_bits_data),
    .io_in_2_bits_is_hella(resp_arb_io_in_2_bits_is_hella),
    .io_out_ready(resp_arb_io_out_ready),
    .io_out_valid(resp_arb_io_out_valid),
    .io_out_bits_uop_uopc(resp_arb_io_out_bits_uop_uopc),
    .io_out_bits_uop_inst(resp_arb_io_out_bits_uop_inst),
    .io_out_bits_uop_debug_inst(resp_arb_io_out_bits_uop_debug_inst),
    .io_out_bits_uop_is_rvc(resp_arb_io_out_bits_uop_is_rvc),
    .io_out_bits_uop_debug_pc(resp_arb_io_out_bits_uop_debug_pc),
    .io_out_bits_uop_iq_type(resp_arb_io_out_bits_uop_iq_type),
    .io_out_bits_uop_fu_code(resp_arb_io_out_bits_uop_fu_code),
    .io_out_bits_uop_ctrl_br_type(resp_arb_io_out_bits_uop_ctrl_br_type),
    .io_out_bits_uop_ctrl_op1_sel(resp_arb_io_out_bits_uop_ctrl_op1_sel),
    .io_out_bits_uop_ctrl_op2_sel(resp_arb_io_out_bits_uop_ctrl_op2_sel),
    .io_out_bits_uop_ctrl_imm_sel(resp_arb_io_out_bits_uop_ctrl_imm_sel),
    .io_out_bits_uop_ctrl_op_fcn(resp_arb_io_out_bits_uop_ctrl_op_fcn),
    .io_out_bits_uop_ctrl_fcn_dw(resp_arb_io_out_bits_uop_ctrl_fcn_dw),
    .io_out_bits_uop_ctrl_csr_cmd(resp_arb_io_out_bits_uop_ctrl_csr_cmd),
    .io_out_bits_uop_ctrl_is_load(resp_arb_io_out_bits_uop_ctrl_is_load),
    .io_out_bits_uop_ctrl_is_sta(resp_arb_io_out_bits_uop_ctrl_is_sta),
    .io_out_bits_uop_ctrl_is_std(resp_arb_io_out_bits_uop_ctrl_is_std),
    .io_out_bits_uop_iw_state(resp_arb_io_out_bits_uop_iw_state),
    .io_out_bits_uop_iw_p1_poisoned(resp_arb_io_out_bits_uop_iw_p1_poisoned),
    .io_out_bits_uop_iw_p2_poisoned(resp_arb_io_out_bits_uop_iw_p2_poisoned),
    .io_out_bits_uop_is_br(resp_arb_io_out_bits_uop_is_br),
    .io_out_bits_uop_is_jalr(resp_arb_io_out_bits_uop_is_jalr),
    .io_out_bits_uop_is_jal(resp_arb_io_out_bits_uop_is_jal),
    .io_out_bits_uop_is_sfb(resp_arb_io_out_bits_uop_is_sfb),
    .io_out_bits_uop_br_mask(resp_arb_io_out_bits_uop_br_mask),
    .io_out_bits_uop_br_tag(resp_arb_io_out_bits_uop_br_tag),
    .io_out_bits_uop_ftq_idx(resp_arb_io_out_bits_uop_ftq_idx),
    .io_out_bits_uop_edge_inst(resp_arb_io_out_bits_uop_edge_inst),
    .io_out_bits_uop_pc_lob(resp_arb_io_out_bits_uop_pc_lob),
    .io_out_bits_uop_taken(resp_arb_io_out_bits_uop_taken),
    .io_out_bits_uop_imm_packed(resp_arb_io_out_bits_uop_imm_packed),
    .io_out_bits_uop_csr_addr(resp_arb_io_out_bits_uop_csr_addr),
    .io_out_bits_uop_rob_idx(resp_arb_io_out_bits_uop_rob_idx),
    .io_out_bits_uop_ldq_idx(resp_arb_io_out_bits_uop_ldq_idx),
    .io_out_bits_uop_stq_idx(resp_arb_io_out_bits_uop_stq_idx),
    .io_out_bits_uop_rxq_idx(resp_arb_io_out_bits_uop_rxq_idx),
    .io_out_bits_uop_pdst(resp_arb_io_out_bits_uop_pdst),
    .io_out_bits_uop_prs1(resp_arb_io_out_bits_uop_prs1),
    .io_out_bits_uop_prs2(resp_arb_io_out_bits_uop_prs2),
    .io_out_bits_uop_prs3(resp_arb_io_out_bits_uop_prs3),
    .io_out_bits_uop_ppred(resp_arb_io_out_bits_uop_ppred),
    .io_out_bits_uop_prs1_busy(resp_arb_io_out_bits_uop_prs1_busy),
    .io_out_bits_uop_prs2_busy(resp_arb_io_out_bits_uop_prs2_busy),
    .io_out_bits_uop_prs3_busy(resp_arb_io_out_bits_uop_prs3_busy),
    .io_out_bits_uop_ppred_busy(resp_arb_io_out_bits_uop_ppred_busy),
    .io_out_bits_uop_stale_pdst(resp_arb_io_out_bits_uop_stale_pdst),
    .io_out_bits_uop_exception(resp_arb_io_out_bits_uop_exception),
    .io_out_bits_uop_exc_cause(resp_arb_io_out_bits_uop_exc_cause),
    .io_out_bits_uop_bypassable(resp_arb_io_out_bits_uop_bypassable),
    .io_out_bits_uop_mem_cmd(resp_arb_io_out_bits_uop_mem_cmd),
    .io_out_bits_uop_mem_size(resp_arb_io_out_bits_uop_mem_size),
    .io_out_bits_uop_mem_signed(resp_arb_io_out_bits_uop_mem_signed),
    .io_out_bits_uop_is_fence(resp_arb_io_out_bits_uop_is_fence),
    .io_out_bits_uop_is_fencei(resp_arb_io_out_bits_uop_is_fencei),
    .io_out_bits_uop_is_amo(resp_arb_io_out_bits_uop_is_amo),
    .io_out_bits_uop_uses_ldq(resp_arb_io_out_bits_uop_uses_ldq),
    .io_out_bits_uop_uses_stq(resp_arb_io_out_bits_uop_uses_stq),
    .io_out_bits_uop_is_sys_pc2epc(resp_arb_io_out_bits_uop_is_sys_pc2epc),
    .io_out_bits_uop_is_unique(resp_arb_io_out_bits_uop_is_unique),
    .io_out_bits_uop_flush_on_commit(resp_arb_io_out_bits_uop_flush_on_commit),
    .io_out_bits_uop_ldst_is_rs1(resp_arb_io_out_bits_uop_ldst_is_rs1),
    .io_out_bits_uop_ldst(resp_arb_io_out_bits_uop_ldst),
    .io_out_bits_uop_lrs1(resp_arb_io_out_bits_uop_lrs1),
    .io_out_bits_uop_lrs2(resp_arb_io_out_bits_uop_lrs2),
    .io_out_bits_uop_lrs3(resp_arb_io_out_bits_uop_lrs3),
    .io_out_bits_uop_ldst_val(resp_arb_io_out_bits_uop_ldst_val),
    .io_out_bits_uop_dst_rtype(resp_arb_io_out_bits_uop_dst_rtype),
    .io_out_bits_uop_lrs1_rtype(resp_arb_io_out_bits_uop_lrs1_rtype),
    .io_out_bits_uop_lrs2_rtype(resp_arb_io_out_bits_uop_lrs2_rtype),
    .io_out_bits_uop_frs3_en(resp_arb_io_out_bits_uop_frs3_en),
    .io_out_bits_uop_fp_val(resp_arb_io_out_bits_uop_fp_val),
    .io_out_bits_uop_fp_single(resp_arb_io_out_bits_uop_fp_single),
    .io_out_bits_uop_xcpt_pf_if(resp_arb_io_out_bits_uop_xcpt_pf_if),
    .io_out_bits_uop_xcpt_ae_if(resp_arb_io_out_bits_uop_xcpt_ae_if),
    .io_out_bits_uop_xcpt_ma_if(resp_arb_io_out_bits_uop_xcpt_ma_if),
    .io_out_bits_uop_bp_debug_if(resp_arb_io_out_bits_uop_bp_debug_if),
    .io_out_bits_uop_bp_xcpt_if(resp_arb_io_out_bits_uop_bp_xcpt_if),
    .io_out_bits_uop_debug_fsrc(resp_arb_io_out_bits_uop_debug_fsrc),
    .io_out_bits_uop_debug_tsrc(resp_arb_io_out_bits_uop_debug_tsrc),
    .io_out_bits_data(resp_arb_io_out_bits_data),
    .io_out_bits_is_hella(resp_arb_io_out_bits_is_hella),
    .io_chosen(resp_arb_io_chosen)
  );
  Arbiter_7 refill_arb ( // @[mshrs.scala 604:30]
    .clock(refill_arb_clock),
    .reset(refill_arb_reset),
    .io_in_0_ready(refill_arb_io_in_0_ready),
    .io_in_0_valid(refill_arb_io_in_0_valid),
    .io_in_0_bits_way_en(refill_arb_io_in_0_bits_way_en),
    .io_in_0_bits_addr(refill_arb_io_in_0_bits_addr),
    .io_in_0_bits_wmask(refill_arb_io_in_0_bits_wmask),
    .io_in_0_bits_data(refill_arb_io_in_0_bits_data),
    .io_in_1_ready(refill_arb_io_in_1_ready),
    .io_in_1_valid(refill_arb_io_in_1_valid),
    .io_in_1_bits_way_en(refill_arb_io_in_1_bits_way_en),
    .io_in_1_bits_addr(refill_arb_io_in_1_bits_addr),
    .io_in_1_bits_wmask(refill_arb_io_in_1_bits_wmask),
    .io_in_1_bits_data(refill_arb_io_in_1_bits_data),
    .io_out_ready(refill_arb_io_out_ready),
    .io_out_valid(refill_arb_io_out_valid),
    .io_out_bits_way_en(refill_arb_io_out_bits_way_en),
    .io_out_bits_addr(refill_arb_io_out_bits_addr),
    .io_out_bits_wmask(refill_arb_io_out_bits_wmask),
    .io_out_bits_data(refill_arb_io_out_bits_data),
    .io_chosen(refill_arb_io_chosen)
  );
  BoomMSHR mshrs_0 ( // @[mshrs.scala 620:22]
    .clock(mshrs_0_clock),
    .reset(mshrs_0_reset),
    .io_id(mshrs_0_io_id),
    .io_req_pri_val(mshrs_0_io_req_pri_val),
    .io_req_pri_rdy(mshrs_0_io_req_pri_rdy),
    .io_req_sec_val(mshrs_0_io_req_sec_val),
    .io_req_sec_rdy(mshrs_0_io_req_sec_rdy),
    .io_clear_prefetch(mshrs_0_io_clear_prefetch),
    .io_brupdate_b1_resolve_mask(mshrs_0_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(mshrs_0_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(mshrs_0_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(mshrs_0_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(mshrs_0_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(mshrs_0_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(mshrs_0_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(mshrs_0_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(mshrs_0_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(mshrs_0_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(mshrs_0_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(mshrs_0_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(mshrs_0_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(mshrs_0_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(mshrs_0_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(mshrs_0_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(mshrs_0_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(mshrs_0_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(mshrs_0_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(mshrs_0_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(mshrs_0_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(mshrs_0_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(mshrs_0_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(mshrs_0_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(mshrs_0_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(mshrs_0_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(mshrs_0_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(mshrs_0_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(mshrs_0_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(mshrs_0_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(mshrs_0_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(mshrs_0_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(mshrs_0_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(mshrs_0_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(mshrs_0_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(mshrs_0_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(mshrs_0_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(mshrs_0_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(mshrs_0_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(mshrs_0_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(mshrs_0_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(mshrs_0_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(mshrs_0_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(mshrs_0_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(mshrs_0_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(mshrs_0_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(mshrs_0_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(mshrs_0_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(mshrs_0_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(mshrs_0_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(mshrs_0_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(mshrs_0_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(mshrs_0_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(mshrs_0_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(mshrs_0_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(mshrs_0_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(mshrs_0_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(mshrs_0_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(mshrs_0_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(mshrs_0_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(mshrs_0_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(mshrs_0_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(mshrs_0_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(mshrs_0_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(mshrs_0_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(mshrs_0_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(mshrs_0_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(mshrs_0_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(mshrs_0_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(mshrs_0_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(mshrs_0_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(mshrs_0_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(mshrs_0_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(mshrs_0_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(mshrs_0_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(mshrs_0_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(mshrs_0_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(mshrs_0_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(mshrs_0_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(mshrs_0_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(mshrs_0_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(mshrs_0_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(mshrs_0_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(mshrs_0_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(mshrs_0_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(mshrs_0_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(mshrs_0_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(mshrs_0_io_brupdate_b2_target_offset),
    .io_exception(mshrs_0_io_exception),
    .io_rob_pnr_idx(mshrs_0_io_rob_pnr_idx),
    .io_rob_head_idx(mshrs_0_io_rob_head_idx),
    .io_req_uop_uopc(mshrs_0_io_req_uop_uopc),
    .io_req_uop_inst(mshrs_0_io_req_uop_inst),
    .io_req_uop_debug_inst(mshrs_0_io_req_uop_debug_inst),
    .io_req_uop_is_rvc(mshrs_0_io_req_uop_is_rvc),
    .io_req_uop_debug_pc(mshrs_0_io_req_uop_debug_pc),
    .io_req_uop_iq_type(mshrs_0_io_req_uop_iq_type),
    .io_req_uop_fu_code(mshrs_0_io_req_uop_fu_code),
    .io_req_uop_ctrl_br_type(mshrs_0_io_req_uop_ctrl_br_type),
    .io_req_uop_ctrl_op1_sel(mshrs_0_io_req_uop_ctrl_op1_sel),
    .io_req_uop_ctrl_op2_sel(mshrs_0_io_req_uop_ctrl_op2_sel),
    .io_req_uop_ctrl_imm_sel(mshrs_0_io_req_uop_ctrl_imm_sel),
    .io_req_uop_ctrl_op_fcn(mshrs_0_io_req_uop_ctrl_op_fcn),
    .io_req_uop_ctrl_fcn_dw(mshrs_0_io_req_uop_ctrl_fcn_dw),
    .io_req_uop_ctrl_csr_cmd(mshrs_0_io_req_uop_ctrl_csr_cmd),
    .io_req_uop_ctrl_is_load(mshrs_0_io_req_uop_ctrl_is_load),
    .io_req_uop_ctrl_is_sta(mshrs_0_io_req_uop_ctrl_is_sta),
    .io_req_uop_ctrl_is_std(mshrs_0_io_req_uop_ctrl_is_std),
    .io_req_uop_iw_state(mshrs_0_io_req_uop_iw_state),
    .io_req_uop_iw_p1_poisoned(mshrs_0_io_req_uop_iw_p1_poisoned),
    .io_req_uop_iw_p2_poisoned(mshrs_0_io_req_uop_iw_p2_poisoned),
    .io_req_uop_is_br(mshrs_0_io_req_uop_is_br),
    .io_req_uop_is_jalr(mshrs_0_io_req_uop_is_jalr),
    .io_req_uop_is_jal(mshrs_0_io_req_uop_is_jal),
    .io_req_uop_is_sfb(mshrs_0_io_req_uop_is_sfb),
    .io_req_uop_br_mask(mshrs_0_io_req_uop_br_mask),
    .io_req_uop_br_tag(mshrs_0_io_req_uop_br_tag),
    .io_req_uop_ftq_idx(mshrs_0_io_req_uop_ftq_idx),
    .io_req_uop_edge_inst(mshrs_0_io_req_uop_edge_inst),
    .io_req_uop_pc_lob(mshrs_0_io_req_uop_pc_lob),
    .io_req_uop_taken(mshrs_0_io_req_uop_taken),
    .io_req_uop_imm_packed(mshrs_0_io_req_uop_imm_packed),
    .io_req_uop_csr_addr(mshrs_0_io_req_uop_csr_addr),
    .io_req_uop_rob_idx(mshrs_0_io_req_uop_rob_idx),
    .io_req_uop_ldq_idx(mshrs_0_io_req_uop_ldq_idx),
    .io_req_uop_stq_idx(mshrs_0_io_req_uop_stq_idx),
    .io_req_uop_rxq_idx(mshrs_0_io_req_uop_rxq_idx),
    .io_req_uop_pdst(mshrs_0_io_req_uop_pdst),
    .io_req_uop_prs1(mshrs_0_io_req_uop_prs1),
    .io_req_uop_prs2(mshrs_0_io_req_uop_prs2),
    .io_req_uop_prs3(mshrs_0_io_req_uop_prs3),
    .io_req_uop_ppred(mshrs_0_io_req_uop_ppred),
    .io_req_uop_prs1_busy(mshrs_0_io_req_uop_prs1_busy),
    .io_req_uop_prs2_busy(mshrs_0_io_req_uop_prs2_busy),
    .io_req_uop_prs3_busy(mshrs_0_io_req_uop_prs3_busy),
    .io_req_uop_ppred_busy(mshrs_0_io_req_uop_ppred_busy),
    .io_req_uop_stale_pdst(mshrs_0_io_req_uop_stale_pdst),
    .io_req_uop_exception(mshrs_0_io_req_uop_exception),
    .io_req_uop_exc_cause(mshrs_0_io_req_uop_exc_cause),
    .io_req_uop_bypassable(mshrs_0_io_req_uop_bypassable),
    .io_req_uop_mem_cmd(mshrs_0_io_req_uop_mem_cmd),
    .io_req_uop_mem_size(mshrs_0_io_req_uop_mem_size),
    .io_req_uop_mem_signed(mshrs_0_io_req_uop_mem_signed),
    .io_req_uop_is_fence(mshrs_0_io_req_uop_is_fence),
    .io_req_uop_is_fencei(mshrs_0_io_req_uop_is_fencei),
    .io_req_uop_is_amo(mshrs_0_io_req_uop_is_amo),
    .io_req_uop_uses_ldq(mshrs_0_io_req_uop_uses_ldq),
    .io_req_uop_uses_stq(mshrs_0_io_req_uop_uses_stq),
    .io_req_uop_is_sys_pc2epc(mshrs_0_io_req_uop_is_sys_pc2epc),
    .io_req_uop_is_unique(mshrs_0_io_req_uop_is_unique),
    .io_req_uop_flush_on_commit(mshrs_0_io_req_uop_flush_on_commit),
    .io_req_uop_ldst_is_rs1(mshrs_0_io_req_uop_ldst_is_rs1),
    .io_req_uop_ldst(mshrs_0_io_req_uop_ldst),
    .io_req_uop_lrs1(mshrs_0_io_req_uop_lrs1),
    .io_req_uop_lrs2(mshrs_0_io_req_uop_lrs2),
    .io_req_uop_lrs3(mshrs_0_io_req_uop_lrs3),
    .io_req_uop_ldst_val(mshrs_0_io_req_uop_ldst_val),
    .io_req_uop_dst_rtype(mshrs_0_io_req_uop_dst_rtype),
    .io_req_uop_lrs1_rtype(mshrs_0_io_req_uop_lrs1_rtype),
    .io_req_uop_lrs2_rtype(mshrs_0_io_req_uop_lrs2_rtype),
    .io_req_uop_frs3_en(mshrs_0_io_req_uop_frs3_en),
    .io_req_uop_fp_val(mshrs_0_io_req_uop_fp_val),
    .io_req_uop_fp_single(mshrs_0_io_req_uop_fp_single),
    .io_req_uop_xcpt_pf_if(mshrs_0_io_req_uop_xcpt_pf_if),
    .io_req_uop_xcpt_ae_if(mshrs_0_io_req_uop_xcpt_ae_if),
    .io_req_uop_xcpt_ma_if(mshrs_0_io_req_uop_xcpt_ma_if),
    .io_req_uop_bp_debug_if(mshrs_0_io_req_uop_bp_debug_if),
    .io_req_uop_bp_xcpt_if(mshrs_0_io_req_uop_bp_xcpt_if),
    .io_req_uop_debug_fsrc(mshrs_0_io_req_uop_debug_fsrc),
    .io_req_uop_debug_tsrc(mshrs_0_io_req_uop_debug_tsrc),
    .io_req_addr(mshrs_0_io_req_addr),
    .io_req_data(mshrs_0_io_req_data),
    .io_req_is_hella(mshrs_0_io_req_is_hella),
    .io_req_tag_match(mshrs_0_io_req_tag_match),
    .io_req_old_meta_coh_state(mshrs_0_io_req_old_meta_coh_state),
    .io_req_old_meta_tag(mshrs_0_io_req_old_meta_tag),
    .io_req_way_en(mshrs_0_io_req_way_en),
    .io_req_sdq_id(mshrs_0_io_req_sdq_id),
    .io_req_is_probe(mshrs_0_io_req_is_probe),
    .io_idx_valid(mshrs_0_io_idx_valid),
    .io_idx_bits(mshrs_0_io_idx_bits),
    .io_way_valid(mshrs_0_io_way_valid),
    .io_way_bits(mshrs_0_io_way_bits),
    .io_tag_valid(mshrs_0_io_tag_valid),
    .io_tag_bits(mshrs_0_io_tag_bits),
    .io_mem_acquire_ready(mshrs_0_io_mem_acquire_ready),
    .io_mem_acquire_valid(mshrs_0_io_mem_acquire_valid),
    .io_mem_acquire_bits_opcode(mshrs_0_io_mem_acquire_bits_opcode),
    .io_mem_acquire_bits_param(mshrs_0_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_size(mshrs_0_io_mem_acquire_bits_size),
    .io_mem_acquire_bits_source(mshrs_0_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(mshrs_0_io_mem_acquire_bits_address),
    .io_mem_acquire_bits_mask(mshrs_0_io_mem_acquire_bits_mask),
    .io_mem_acquire_bits_data(mshrs_0_io_mem_acquire_bits_data),
    .io_mem_acquire_bits_corrupt(mshrs_0_io_mem_acquire_bits_corrupt),
    .io_mem_grant_ready(mshrs_0_io_mem_grant_ready),
    .io_mem_grant_valid(mshrs_0_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(mshrs_0_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(mshrs_0_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(mshrs_0_io_mem_grant_bits_size),
    .io_mem_grant_bits_source(mshrs_0_io_mem_grant_bits_source),
    .io_mem_grant_bits_sink(mshrs_0_io_mem_grant_bits_sink),
    .io_mem_grant_bits_denied(mshrs_0_io_mem_grant_bits_denied),
    .io_mem_grant_bits_data(mshrs_0_io_mem_grant_bits_data),
    .io_mem_grant_bits_corrupt(mshrs_0_io_mem_grant_bits_corrupt),
    .io_mem_finish_ready(mshrs_0_io_mem_finish_ready),
    .io_mem_finish_valid(mshrs_0_io_mem_finish_valid),
    .io_mem_finish_bits_sink(mshrs_0_io_mem_finish_bits_sink),
    .io_prober_state_valid(mshrs_0_io_prober_state_valid),
    .io_prober_state_bits(mshrs_0_io_prober_state_bits),
    .io_refill_ready(mshrs_0_io_refill_ready),
    .io_refill_valid(mshrs_0_io_refill_valid),
    .io_refill_bits_way_en(mshrs_0_io_refill_bits_way_en),
    .io_refill_bits_addr(mshrs_0_io_refill_bits_addr),
    .io_refill_bits_wmask(mshrs_0_io_refill_bits_wmask),
    .io_refill_bits_data(mshrs_0_io_refill_bits_data),
    .io_meta_write_ready(mshrs_0_io_meta_write_ready),
    .io_meta_write_valid(mshrs_0_io_meta_write_valid),
    .io_meta_write_bits_idx(mshrs_0_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en(mshrs_0_io_meta_write_bits_way_en),
    .io_meta_write_bits_tag(mshrs_0_io_meta_write_bits_tag),
    .io_meta_write_bits_data_coh_state(mshrs_0_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag(mshrs_0_io_meta_write_bits_data_tag),
    .io_meta_read_ready(mshrs_0_io_meta_read_ready),
    .io_meta_read_valid(mshrs_0_io_meta_read_valid),
    .io_meta_read_bits_idx(mshrs_0_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en(mshrs_0_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag(mshrs_0_io_meta_read_bits_tag),
    .io_meta_resp_valid(mshrs_0_io_meta_resp_valid),
    .io_meta_resp_bits_coh_state(mshrs_0_io_meta_resp_bits_coh_state),
    .io_meta_resp_bits_tag(mshrs_0_io_meta_resp_bits_tag),
    .io_wb_req_ready(mshrs_0_io_wb_req_ready),
    .io_wb_req_valid(mshrs_0_io_wb_req_valid),
    .io_wb_req_bits_tag(mshrs_0_io_wb_req_bits_tag),
    .io_wb_req_bits_idx(mshrs_0_io_wb_req_bits_idx),
    .io_wb_req_bits_source(mshrs_0_io_wb_req_bits_source),
    .io_wb_req_bits_param(mshrs_0_io_wb_req_bits_param),
    .io_wb_req_bits_way_en(mshrs_0_io_wb_req_bits_way_en),
    .io_wb_req_bits_voluntary(mshrs_0_io_wb_req_bits_voluntary),
    .io_commit_val(mshrs_0_io_commit_val),
    .io_commit_addr(mshrs_0_io_commit_addr),
    .io_commit_coh_state(mshrs_0_io_commit_coh_state),
    .io_lb_read_ready(mshrs_0_io_lb_read_ready),
    .io_lb_read_valid(mshrs_0_io_lb_read_valid),
    .io_lb_read_bits_id(mshrs_0_io_lb_read_bits_id),
    .io_lb_read_bits_offset(mshrs_0_io_lb_read_bits_offset),
    .io_lb_resp(mshrs_0_io_lb_resp),
    .io_lb_write_ready(mshrs_0_io_lb_write_ready),
    .io_lb_write_valid(mshrs_0_io_lb_write_valid),
    .io_lb_write_bits_id(mshrs_0_io_lb_write_bits_id),
    .io_lb_write_bits_offset(mshrs_0_io_lb_write_bits_offset),
    .io_lb_write_bits_data(mshrs_0_io_lb_write_bits_data),
    .io_replay_ready(mshrs_0_io_replay_ready),
    .io_replay_valid(mshrs_0_io_replay_valid),
    .io_replay_bits_uop_uopc(mshrs_0_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst(mshrs_0_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst(mshrs_0_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc(mshrs_0_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc(mshrs_0_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type(mshrs_0_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code(mshrs_0_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type(mshrs_0_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel(mshrs_0_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel(mshrs_0_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel(mshrs_0_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn(mshrs_0_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw(mshrs_0_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd(mshrs_0_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load(mshrs_0_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta(mshrs_0_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std(mshrs_0_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state(mshrs_0_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned(mshrs_0_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned(mshrs_0_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br(mshrs_0_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr(mshrs_0_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal(mshrs_0_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb(mshrs_0_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask(mshrs_0_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag(mshrs_0_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx(mshrs_0_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst(mshrs_0_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob(mshrs_0_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken(mshrs_0_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed(mshrs_0_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr(mshrs_0_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx(mshrs_0_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx(mshrs_0_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx(mshrs_0_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx(mshrs_0_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst(mshrs_0_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1(mshrs_0_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2(mshrs_0_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3(mshrs_0_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred(mshrs_0_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy(mshrs_0_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy(mshrs_0_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy(mshrs_0_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy(mshrs_0_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst(mshrs_0_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception(mshrs_0_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause(mshrs_0_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable(mshrs_0_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd(mshrs_0_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size(mshrs_0_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed(mshrs_0_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence(mshrs_0_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei(mshrs_0_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo(mshrs_0_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq(mshrs_0_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq(mshrs_0_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc(mshrs_0_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique(mshrs_0_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit(mshrs_0_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1(mshrs_0_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst(mshrs_0_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1(mshrs_0_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2(mshrs_0_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3(mshrs_0_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val(mshrs_0_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype(mshrs_0_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype(mshrs_0_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype(mshrs_0_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en(mshrs_0_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val(mshrs_0_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single(mshrs_0_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if(mshrs_0_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if(mshrs_0_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if(mshrs_0_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if(mshrs_0_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if(mshrs_0_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc(mshrs_0_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc(mshrs_0_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr(mshrs_0_io_replay_bits_addr),
    .io_replay_bits_data(mshrs_0_io_replay_bits_data),
    .io_replay_bits_is_hella(mshrs_0_io_replay_bits_is_hella),
    .io_replay_bits_tag_match(mshrs_0_io_replay_bits_tag_match),
    .io_replay_bits_old_meta_coh_state(mshrs_0_io_replay_bits_old_meta_coh_state),
    .io_replay_bits_old_meta_tag(mshrs_0_io_replay_bits_old_meta_tag),
    .io_replay_bits_way_en(mshrs_0_io_replay_bits_way_en),
    .io_replay_bits_sdq_id(mshrs_0_io_replay_bits_sdq_id),
    .io_resp_ready(mshrs_0_io_resp_ready),
    .io_resp_valid(mshrs_0_io_resp_valid),
    .io_resp_bits_uop_uopc(mshrs_0_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(mshrs_0_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(mshrs_0_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(mshrs_0_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(mshrs_0_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(mshrs_0_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(mshrs_0_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(mshrs_0_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(mshrs_0_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(mshrs_0_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(mshrs_0_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(mshrs_0_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(mshrs_0_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(mshrs_0_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(mshrs_0_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(mshrs_0_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(mshrs_0_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state(mshrs_0_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(mshrs_0_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(mshrs_0_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(mshrs_0_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(mshrs_0_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(mshrs_0_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(mshrs_0_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(mshrs_0_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(mshrs_0_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(mshrs_0_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(mshrs_0_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(mshrs_0_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(mshrs_0_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(mshrs_0_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(mshrs_0_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(mshrs_0_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(mshrs_0_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(mshrs_0_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(mshrs_0_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(mshrs_0_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(mshrs_0_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(mshrs_0_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(mshrs_0_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(mshrs_0_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(mshrs_0_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(mshrs_0_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(mshrs_0_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(mshrs_0_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(mshrs_0_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(mshrs_0_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(mshrs_0_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(mshrs_0_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(mshrs_0_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(mshrs_0_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(mshrs_0_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(mshrs_0_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(mshrs_0_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(mshrs_0_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(mshrs_0_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(mshrs_0_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(mshrs_0_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(mshrs_0_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(mshrs_0_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(mshrs_0_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(mshrs_0_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(mshrs_0_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(mshrs_0_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(mshrs_0_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(mshrs_0_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(mshrs_0_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(mshrs_0_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(mshrs_0_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(mshrs_0_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(mshrs_0_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(mshrs_0_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(mshrs_0_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(mshrs_0_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(mshrs_0_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(mshrs_0_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(mshrs_0_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(mshrs_0_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(mshrs_0_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data(mshrs_0_io_resp_bits_data),
    .io_resp_bits_is_hella(mshrs_0_io_resp_bits_is_hella),
    .io_wb_resp(mshrs_0_io_wb_resp),
    .io_probe_rdy(mshrs_0_io_probe_rdy)
  );
  BoomMSHR mshrs_1 ( // @[mshrs.scala 620:22]
    .clock(mshrs_1_clock),
    .reset(mshrs_1_reset),
    .io_id(mshrs_1_io_id),
    .io_req_pri_val(mshrs_1_io_req_pri_val),
    .io_req_pri_rdy(mshrs_1_io_req_pri_rdy),
    .io_req_sec_val(mshrs_1_io_req_sec_val),
    .io_req_sec_rdy(mshrs_1_io_req_sec_rdy),
    .io_clear_prefetch(mshrs_1_io_clear_prefetch),
    .io_brupdate_b1_resolve_mask(mshrs_1_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(mshrs_1_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(mshrs_1_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(mshrs_1_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(mshrs_1_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(mshrs_1_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(mshrs_1_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(mshrs_1_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(mshrs_1_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(mshrs_1_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(mshrs_1_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(mshrs_1_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(mshrs_1_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(mshrs_1_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(mshrs_1_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(mshrs_1_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(mshrs_1_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(mshrs_1_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(mshrs_1_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(mshrs_1_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(mshrs_1_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(mshrs_1_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(mshrs_1_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(mshrs_1_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(mshrs_1_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(mshrs_1_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(mshrs_1_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(mshrs_1_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(mshrs_1_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(mshrs_1_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(mshrs_1_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(mshrs_1_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(mshrs_1_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(mshrs_1_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(mshrs_1_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(mshrs_1_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(mshrs_1_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(mshrs_1_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(mshrs_1_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(mshrs_1_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(mshrs_1_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(mshrs_1_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(mshrs_1_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(mshrs_1_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(mshrs_1_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(mshrs_1_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(mshrs_1_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(mshrs_1_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(mshrs_1_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(mshrs_1_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(mshrs_1_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(mshrs_1_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(mshrs_1_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(mshrs_1_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(mshrs_1_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(mshrs_1_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(mshrs_1_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(mshrs_1_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(mshrs_1_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(mshrs_1_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(mshrs_1_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(mshrs_1_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(mshrs_1_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(mshrs_1_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(mshrs_1_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(mshrs_1_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(mshrs_1_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(mshrs_1_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(mshrs_1_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(mshrs_1_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(mshrs_1_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(mshrs_1_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(mshrs_1_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(mshrs_1_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(mshrs_1_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(mshrs_1_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(mshrs_1_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(mshrs_1_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(mshrs_1_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(mshrs_1_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(mshrs_1_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(mshrs_1_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(mshrs_1_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(mshrs_1_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(mshrs_1_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(mshrs_1_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(mshrs_1_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(mshrs_1_io_brupdate_b2_target_offset),
    .io_exception(mshrs_1_io_exception),
    .io_rob_pnr_idx(mshrs_1_io_rob_pnr_idx),
    .io_rob_head_idx(mshrs_1_io_rob_head_idx),
    .io_req_uop_uopc(mshrs_1_io_req_uop_uopc),
    .io_req_uop_inst(mshrs_1_io_req_uop_inst),
    .io_req_uop_debug_inst(mshrs_1_io_req_uop_debug_inst),
    .io_req_uop_is_rvc(mshrs_1_io_req_uop_is_rvc),
    .io_req_uop_debug_pc(mshrs_1_io_req_uop_debug_pc),
    .io_req_uop_iq_type(mshrs_1_io_req_uop_iq_type),
    .io_req_uop_fu_code(mshrs_1_io_req_uop_fu_code),
    .io_req_uop_ctrl_br_type(mshrs_1_io_req_uop_ctrl_br_type),
    .io_req_uop_ctrl_op1_sel(mshrs_1_io_req_uop_ctrl_op1_sel),
    .io_req_uop_ctrl_op2_sel(mshrs_1_io_req_uop_ctrl_op2_sel),
    .io_req_uop_ctrl_imm_sel(mshrs_1_io_req_uop_ctrl_imm_sel),
    .io_req_uop_ctrl_op_fcn(mshrs_1_io_req_uop_ctrl_op_fcn),
    .io_req_uop_ctrl_fcn_dw(mshrs_1_io_req_uop_ctrl_fcn_dw),
    .io_req_uop_ctrl_csr_cmd(mshrs_1_io_req_uop_ctrl_csr_cmd),
    .io_req_uop_ctrl_is_load(mshrs_1_io_req_uop_ctrl_is_load),
    .io_req_uop_ctrl_is_sta(mshrs_1_io_req_uop_ctrl_is_sta),
    .io_req_uop_ctrl_is_std(mshrs_1_io_req_uop_ctrl_is_std),
    .io_req_uop_iw_state(mshrs_1_io_req_uop_iw_state),
    .io_req_uop_iw_p1_poisoned(mshrs_1_io_req_uop_iw_p1_poisoned),
    .io_req_uop_iw_p2_poisoned(mshrs_1_io_req_uop_iw_p2_poisoned),
    .io_req_uop_is_br(mshrs_1_io_req_uop_is_br),
    .io_req_uop_is_jalr(mshrs_1_io_req_uop_is_jalr),
    .io_req_uop_is_jal(mshrs_1_io_req_uop_is_jal),
    .io_req_uop_is_sfb(mshrs_1_io_req_uop_is_sfb),
    .io_req_uop_br_mask(mshrs_1_io_req_uop_br_mask),
    .io_req_uop_br_tag(mshrs_1_io_req_uop_br_tag),
    .io_req_uop_ftq_idx(mshrs_1_io_req_uop_ftq_idx),
    .io_req_uop_edge_inst(mshrs_1_io_req_uop_edge_inst),
    .io_req_uop_pc_lob(mshrs_1_io_req_uop_pc_lob),
    .io_req_uop_taken(mshrs_1_io_req_uop_taken),
    .io_req_uop_imm_packed(mshrs_1_io_req_uop_imm_packed),
    .io_req_uop_csr_addr(mshrs_1_io_req_uop_csr_addr),
    .io_req_uop_rob_idx(mshrs_1_io_req_uop_rob_idx),
    .io_req_uop_ldq_idx(mshrs_1_io_req_uop_ldq_idx),
    .io_req_uop_stq_idx(mshrs_1_io_req_uop_stq_idx),
    .io_req_uop_rxq_idx(mshrs_1_io_req_uop_rxq_idx),
    .io_req_uop_pdst(mshrs_1_io_req_uop_pdst),
    .io_req_uop_prs1(mshrs_1_io_req_uop_prs1),
    .io_req_uop_prs2(mshrs_1_io_req_uop_prs2),
    .io_req_uop_prs3(mshrs_1_io_req_uop_prs3),
    .io_req_uop_ppred(mshrs_1_io_req_uop_ppred),
    .io_req_uop_prs1_busy(mshrs_1_io_req_uop_prs1_busy),
    .io_req_uop_prs2_busy(mshrs_1_io_req_uop_prs2_busy),
    .io_req_uop_prs3_busy(mshrs_1_io_req_uop_prs3_busy),
    .io_req_uop_ppred_busy(mshrs_1_io_req_uop_ppred_busy),
    .io_req_uop_stale_pdst(mshrs_1_io_req_uop_stale_pdst),
    .io_req_uop_exception(mshrs_1_io_req_uop_exception),
    .io_req_uop_exc_cause(mshrs_1_io_req_uop_exc_cause),
    .io_req_uop_bypassable(mshrs_1_io_req_uop_bypassable),
    .io_req_uop_mem_cmd(mshrs_1_io_req_uop_mem_cmd),
    .io_req_uop_mem_size(mshrs_1_io_req_uop_mem_size),
    .io_req_uop_mem_signed(mshrs_1_io_req_uop_mem_signed),
    .io_req_uop_is_fence(mshrs_1_io_req_uop_is_fence),
    .io_req_uop_is_fencei(mshrs_1_io_req_uop_is_fencei),
    .io_req_uop_is_amo(mshrs_1_io_req_uop_is_amo),
    .io_req_uop_uses_ldq(mshrs_1_io_req_uop_uses_ldq),
    .io_req_uop_uses_stq(mshrs_1_io_req_uop_uses_stq),
    .io_req_uop_is_sys_pc2epc(mshrs_1_io_req_uop_is_sys_pc2epc),
    .io_req_uop_is_unique(mshrs_1_io_req_uop_is_unique),
    .io_req_uop_flush_on_commit(mshrs_1_io_req_uop_flush_on_commit),
    .io_req_uop_ldst_is_rs1(mshrs_1_io_req_uop_ldst_is_rs1),
    .io_req_uop_ldst(mshrs_1_io_req_uop_ldst),
    .io_req_uop_lrs1(mshrs_1_io_req_uop_lrs1),
    .io_req_uop_lrs2(mshrs_1_io_req_uop_lrs2),
    .io_req_uop_lrs3(mshrs_1_io_req_uop_lrs3),
    .io_req_uop_ldst_val(mshrs_1_io_req_uop_ldst_val),
    .io_req_uop_dst_rtype(mshrs_1_io_req_uop_dst_rtype),
    .io_req_uop_lrs1_rtype(mshrs_1_io_req_uop_lrs1_rtype),
    .io_req_uop_lrs2_rtype(mshrs_1_io_req_uop_lrs2_rtype),
    .io_req_uop_frs3_en(mshrs_1_io_req_uop_frs3_en),
    .io_req_uop_fp_val(mshrs_1_io_req_uop_fp_val),
    .io_req_uop_fp_single(mshrs_1_io_req_uop_fp_single),
    .io_req_uop_xcpt_pf_if(mshrs_1_io_req_uop_xcpt_pf_if),
    .io_req_uop_xcpt_ae_if(mshrs_1_io_req_uop_xcpt_ae_if),
    .io_req_uop_xcpt_ma_if(mshrs_1_io_req_uop_xcpt_ma_if),
    .io_req_uop_bp_debug_if(mshrs_1_io_req_uop_bp_debug_if),
    .io_req_uop_bp_xcpt_if(mshrs_1_io_req_uop_bp_xcpt_if),
    .io_req_uop_debug_fsrc(mshrs_1_io_req_uop_debug_fsrc),
    .io_req_uop_debug_tsrc(mshrs_1_io_req_uop_debug_tsrc),
    .io_req_addr(mshrs_1_io_req_addr),
    .io_req_data(mshrs_1_io_req_data),
    .io_req_is_hella(mshrs_1_io_req_is_hella),
    .io_req_tag_match(mshrs_1_io_req_tag_match),
    .io_req_old_meta_coh_state(mshrs_1_io_req_old_meta_coh_state),
    .io_req_old_meta_tag(mshrs_1_io_req_old_meta_tag),
    .io_req_way_en(mshrs_1_io_req_way_en),
    .io_req_sdq_id(mshrs_1_io_req_sdq_id),
    .io_req_is_probe(mshrs_1_io_req_is_probe),
    .io_idx_valid(mshrs_1_io_idx_valid),
    .io_idx_bits(mshrs_1_io_idx_bits),
    .io_way_valid(mshrs_1_io_way_valid),
    .io_way_bits(mshrs_1_io_way_bits),
    .io_tag_valid(mshrs_1_io_tag_valid),
    .io_tag_bits(mshrs_1_io_tag_bits),
    .io_mem_acquire_ready(mshrs_1_io_mem_acquire_ready),
    .io_mem_acquire_valid(mshrs_1_io_mem_acquire_valid),
    .io_mem_acquire_bits_opcode(mshrs_1_io_mem_acquire_bits_opcode),
    .io_mem_acquire_bits_param(mshrs_1_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_size(mshrs_1_io_mem_acquire_bits_size),
    .io_mem_acquire_bits_source(mshrs_1_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address(mshrs_1_io_mem_acquire_bits_address),
    .io_mem_acquire_bits_mask(mshrs_1_io_mem_acquire_bits_mask),
    .io_mem_acquire_bits_data(mshrs_1_io_mem_acquire_bits_data),
    .io_mem_acquire_bits_corrupt(mshrs_1_io_mem_acquire_bits_corrupt),
    .io_mem_grant_ready(mshrs_1_io_mem_grant_ready),
    .io_mem_grant_valid(mshrs_1_io_mem_grant_valid),
    .io_mem_grant_bits_opcode(mshrs_1_io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param(mshrs_1_io_mem_grant_bits_param),
    .io_mem_grant_bits_size(mshrs_1_io_mem_grant_bits_size),
    .io_mem_grant_bits_source(mshrs_1_io_mem_grant_bits_source),
    .io_mem_grant_bits_sink(mshrs_1_io_mem_grant_bits_sink),
    .io_mem_grant_bits_denied(mshrs_1_io_mem_grant_bits_denied),
    .io_mem_grant_bits_data(mshrs_1_io_mem_grant_bits_data),
    .io_mem_grant_bits_corrupt(mshrs_1_io_mem_grant_bits_corrupt),
    .io_mem_finish_ready(mshrs_1_io_mem_finish_ready),
    .io_mem_finish_valid(mshrs_1_io_mem_finish_valid),
    .io_mem_finish_bits_sink(mshrs_1_io_mem_finish_bits_sink),
    .io_prober_state_valid(mshrs_1_io_prober_state_valid),
    .io_prober_state_bits(mshrs_1_io_prober_state_bits),
    .io_refill_ready(mshrs_1_io_refill_ready),
    .io_refill_valid(mshrs_1_io_refill_valid),
    .io_refill_bits_way_en(mshrs_1_io_refill_bits_way_en),
    .io_refill_bits_addr(mshrs_1_io_refill_bits_addr),
    .io_refill_bits_wmask(mshrs_1_io_refill_bits_wmask),
    .io_refill_bits_data(mshrs_1_io_refill_bits_data),
    .io_meta_write_ready(mshrs_1_io_meta_write_ready),
    .io_meta_write_valid(mshrs_1_io_meta_write_valid),
    .io_meta_write_bits_idx(mshrs_1_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en(mshrs_1_io_meta_write_bits_way_en),
    .io_meta_write_bits_tag(mshrs_1_io_meta_write_bits_tag),
    .io_meta_write_bits_data_coh_state(mshrs_1_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag(mshrs_1_io_meta_write_bits_data_tag),
    .io_meta_read_ready(mshrs_1_io_meta_read_ready),
    .io_meta_read_valid(mshrs_1_io_meta_read_valid),
    .io_meta_read_bits_idx(mshrs_1_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en(mshrs_1_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag(mshrs_1_io_meta_read_bits_tag),
    .io_meta_resp_valid(mshrs_1_io_meta_resp_valid),
    .io_meta_resp_bits_coh_state(mshrs_1_io_meta_resp_bits_coh_state),
    .io_meta_resp_bits_tag(mshrs_1_io_meta_resp_bits_tag),
    .io_wb_req_ready(mshrs_1_io_wb_req_ready),
    .io_wb_req_valid(mshrs_1_io_wb_req_valid),
    .io_wb_req_bits_tag(mshrs_1_io_wb_req_bits_tag),
    .io_wb_req_bits_idx(mshrs_1_io_wb_req_bits_idx),
    .io_wb_req_bits_source(mshrs_1_io_wb_req_bits_source),
    .io_wb_req_bits_param(mshrs_1_io_wb_req_bits_param),
    .io_wb_req_bits_way_en(mshrs_1_io_wb_req_bits_way_en),
    .io_wb_req_bits_voluntary(mshrs_1_io_wb_req_bits_voluntary),
    .io_commit_val(mshrs_1_io_commit_val),
    .io_commit_addr(mshrs_1_io_commit_addr),
    .io_commit_coh_state(mshrs_1_io_commit_coh_state),
    .io_lb_read_ready(mshrs_1_io_lb_read_ready),
    .io_lb_read_valid(mshrs_1_io_lb_read_valid),
    .io_lb_read_bits_id(mshrs_1_io_lb_read_bits_id),
    .io_lb_read_bits_offset(mshrs_1_io_lb_read_bits_offset),
    .io_lb_resp(mshrs_1_io_lb_resp),
    .io_lb_write_ready(mshrs_1_io_lb_write_ready),
    .io_lb_write_valid(mshrs_1_io_lb_write_valid),
    .io_lb_write_bits_id(mshrs_1_io_lb_write_bits_id),
    .io_lb_write_bits_offset(mshrs_1_io_lb_write_bits_offset),
    .io_lb_write_bits_data(mshrs_1_io_lb_write_bits_data),
    .io_replay_ready(mshrs_1_io_replay_ready),
    .io_replay_valid(mshrs_1_io_replay_valid),
    .io_replay_bits_uop_uopc(mshrs_1_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst(mshrs_1_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst(mshrs_1_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc(mshrs_1_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc(mshrs_1_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type(mshrs_1_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code(mshrs_1_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type(mshrs_1_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel(mshrs_1_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel(mshrs_1_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel(mshrs_1_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn(mshrs_1_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw(mshrs_1_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd(mshrs_1_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load(mshrs_1_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta(mshrs_1_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std(mshrs_1_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state(mshrs_1_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned(mshrs_1_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned(mshrs_1_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br(mshrs_1_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr(mshrs_1_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal(mshrs_1_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb(mshrs_1_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask(mshrs_1_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag(mshrs_1_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx(mshrs_1_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst(mshrs_1_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob(mshrs_1_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken(mshrs_1_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed(mshrs_1_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr(mshrs_1_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx(mshrs_1_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx(mshrs_1_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx(mshrs_1_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx(mshrs_1_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst(mshrs_1_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1(mshrs_1_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2(mshrs_1_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3(mshrs_1_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred(mshrs_1_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy(mshrs_1_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy(mshrs_1_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy(mshrs_1_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy(mshrs_1_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst(mshrs_1_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception(mshrs_1_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause(mshrs_1_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable(mshrs_1_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd(mshrs_1_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size(mshrs_1_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed(mshrs_1_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence(mshrs_1_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei(mshrs_1_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo(mshrs_1_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq(mshrs_1_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq(mshrs_1_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc(mshrs_1_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique(mshrs_1_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit(mshrs_1_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1(mshrs_1_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst(mshrs_1_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1(mshrs_1_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2(mshrs_1_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3(mshrs_1_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val(mshrs_1_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype(mshrs_1_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype(mshrs_1_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype(mshrs_1_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en(mshrs_1_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val(mshrs_1_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single(mshrs_1_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if(mshrs_1_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if(mshrs_1_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if(mshrs_1_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if(mshrs_1_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if(mshrs_1_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc(mshrs_1_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc(mshrs_1_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr(mshrs_1_io_replay_bits_addr),
    .io_replay_bits_data(mshrs_1_io_replay_bits_data),
    .io_replay_bits_is_hella(mshrs_1_io_replay_bits_is_hella),
    .io_replay_bits_tag_match(mshrs_1_io_replay_bits_tag_match),
    .io_replay_bits_old_meta_coh_state(mshrs_1_io_replay_bits_old_meta_coh_state),
    .io_replay_bits_old_meta_tag(mshrs_1_io_replay_bits_old_meta_tag),
    .io_replay_bits_way_en(mshrs_1_io_replay_bits_way_en),
    .io_replay_bits_sdq_id(mshrs_1_io_replay_bits_sdq_id),
    .io_resp_ready(mshrs_1_io_resp_ready),
    .io_resp_valid(mshrs_1_io_resp_valid),
    .io_resp_bits_uop_uopc(mshrs_1_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(mshrs_1_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(mshrs_1_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(mshrs_1_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(mshrs_1_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(mshrs_1_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(mshrs_1_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(mshrs_1_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(mshrs_1_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(mshrs_1_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(mshrs_1_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(mshrs_1_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(mshrs_1_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(mshrs_1_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(mshrs_1_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(mshrs_1_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(mshrs_1_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state(mshrs_1_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(mshrs_1_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(mshrs_1_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(mshrs_1_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(mshrs_1_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(mshrs_1_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(mshrs_1_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(mshrs_1_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(mshrs_1_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(mshrs_1_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(mshrs_1_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(mshrs_1_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(mshrs_1_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(mshrs_1_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(mshrs_1_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(mshrs_1_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(mshrs_1_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(mshrs_1_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(mshrs_1_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(mshrs_1_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(mshrs_1_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(mshrs_1_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(mshrs_1_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(mshrs_1_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(mshrs_1_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(mshrs_1_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(mshrs_1_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(mshrs_1_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(mshrs_1_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(mshrs_1_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(mshrs_1_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(mshrs_1_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(mshrs_1_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(mshrs_1_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(mshrs_1_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(mshrs_1_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(mshrs_1_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(mshrs_1_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(mshrs_1_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(mshrs_1_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(mshrs_1_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(mshrs_1_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(mshrs_1_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(mshrs_1_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(mshrs_1_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(mshrs_1_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(mshrs_1_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(mshrs_1_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(mshrs_1_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(mshrs_1_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(mshrs_1_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(mshrs_1_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(mshrs_1_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(mshrs_1_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(mshrs_1_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(mshrs_1_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(mshrs_1_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(mshrs_1_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(mshrs_1_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(mshrs_1_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(mshrs_1_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(mshrs_1_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data(mshrs_1_io_resp_bits_data),
    .io_resp_bits_is_hella(mshrs_1_io_resp_bits_is_hella),
    .io_wb_resp(mshrs_1_io_wb_resp),
    .io_probe_rdy(mshrs_1_io_probe_rdy)
  );
  Arbiter_8 mmio_alloc_arb ( // @[mshrs.scala 703:30]
    .clock(mmio_alloc_arb_clock),
    .reset(mmio_alloc_arb_reset),
    .io_in_0_ready(mmio_alloc_arb_io_in_0_ready),
    .io_in_0_valid(mmio_alloc_arb_io_in_0_valid),
    .io_in_0_bits(mmio_alloc_arb_io_in_0_bits),
    .io_out_ready(mmio_alloc_arb_io_out_ready),
    .io_out_valid(mmio_alloc_arb_io_out_valid),
    .io_out_bits(mmio_alloc_arb_io_out_bits)
  );
  BoomIOMSHR mmios_0 ( // @[mshrs.scala 710:22]
    .clock(mmios_0_clock),
    .reset(mmios_0_reset),
    .io_req_ready(mmios_0_io_req_ready),
    .io_req_valid(mmios_0_io_req_valid),
    .io_req_bits_uop_uopc(mmios_0_io_req_bits_uop_uopc),
    .io_req_bits_uop_inst(mmios_0_io_req_bits_uop_inst),
    .io_req_bits_uop_debug_inst(mmios_0_io_req_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc(mmios_0_io_req_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc(mmios_0_io_req_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type(mmios_0_io_req_bits_uop_iq_type),
    .io_req_bits_uop_fu_code(mmios_0_io_req_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type(mmios_0_io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel(mmios_0_io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel(mmios_0_io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel(mmios_0_io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn(mmios_0_io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw(mmios_0_io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd(mmios_0_io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load(mmios_0_io_req_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta(mmios_0_io_req_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std(mmios_0_io_req_bits_uop_ctrl_is_std),
    .io_req_bits_uop_iw_state(mmios_0_io_req_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned(mmios_0_io_req_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned(mmios_0_io_req_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br(mmios_0_io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr(mmios_0_io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal(mmios_0_io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb(mmios_0_io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask(mmios_0_io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag(mmios_0_io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx(mmios_0_io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst(mmios_0_io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob(mmios_0_io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken(mmios_0_io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed(mmios_0_io_req_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr(mmios_0_io_req_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx(mmios_0_io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx(mmios_0_io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx(mmios_0_io_req_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx(mmios_0_io_req_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst(mmios_0_io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1(mmios_0_io_req_bits_uop_prs1),
    .io_req_bits_uop_prs2(mmios_0_io_req_bits_uop_prs2),
    .io_req_bits_uop_prs3(mmios_0_io_req_bits_uop_prs3),
    .io_req_bits_uop_ppred(mmios_0_io_req_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy(mmios_0_io_req_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy(mmios_0_io_req_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy(mmios_0_io_req_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy(mmios_0_io_req_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst(mmios_0_io_req_bits_uop_stale_pdst),
    .io_req_bits_uop_exception(mmios_0_io_req_bits_uop_exception),
    .io_req_bits_uop_exc_cause(mmios_0_io_req_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable(mmios_0_io_req_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd(mmios_0_io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size(mmios_0_io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed(mmios_0_io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence(mmios_0_io_req_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei(mmios_0_io_req_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo(mmios_0_io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq(mmios_0_io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq(mmios_0_io_req_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc(mmios_0_io_req_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique(mmios_0_io_req_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit(mmios_0_io_req_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1(mmios_0_io_req_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst(mmios_0_io_req_bits_uop_ldst),
    .io_req_bits_uop_lrs1(mmios_0_io_req_bits_uop_lrs1),
    .io_req_bits_uop_lrs2(mmios_0_io_req_bits_uop_lrs2),
    .io_req_bits_uop_lrs3(mmios_0_io_req_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val(mmios_0_io_req_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype(mmios_0_io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype(mmios_0_io_req_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype(mmios_0_io_req_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en(mmios_0_io_req_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val(mmios_0_io_req_bits_uop_fp_val),
    .io_req_bits_uop_fp_single(mmios_0_io_req_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if(mmios_0_io_req_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if(mmios_0_io_req_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if(mmios_0_io_req_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if(mmios_0_io_req_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if(mmios_0_io_req_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc(mmios_0_io_req_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc(mmios_0_io_req_bits_uop_debug_tsrc),
    .io_req_bits_addr(mmios_0_io_req_bits_addr),
    .io_req_bits_data(mmios_0_io_req_bits_data),
    .io_req_bits_is_hella(mmios_0_io_req_bits_is_hella),
    .io_resp_ready(mmios_0_io_resp_ready),
    .io_resp_valid(mmios_0_io_resp_valid),
    .io_resp_bits_uop_uopc(mmios_0_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst(mmios_0_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst(mmios_0_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc(mmios_0_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc(mmios_0_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type(mmios_0_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code(mmios_0_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type(mmios_0_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel(mmios_0_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel(mmios_0_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel(mmios_0_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn(mmios_0_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw(mmios_0_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd(mmios_0_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load(mmios_0_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta(mmios_0_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std(mmios_0_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state(mmios_0_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned(mmios_0_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned(mmios_0_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br(mmios_0_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr(mmios_0_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal(mmios_0_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb(mmios_0_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask(mmios_0_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag(mmios_0_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx(mmios_0_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst(mmios_0_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob(mmios_0_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken(mmios_0_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed(mmios_0_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr(mmios_0_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx(mmios_0_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx(mmios_0_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx(mmios_0_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx(mmios_0_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst(mmios_0_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1(mmios_0_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2(mmios_0_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3(mmios_0_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred(mmios_0_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy(mmios_0_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy(mmios_0_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy(mmios_0_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy(mmios_0_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst(mmios_0_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception(mmios_0_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause(mmios_0_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable(mmios_0_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd(mmios_0_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size(mmios_0_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed(mmios_0_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence(mmios_0_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei(mmios_0_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo(mmios_0_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq(mmios_0_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq(mmios_0_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc(mmios_0_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique(mmios_0_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit(mmios_0_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1(mmios_0_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst(mmios_0_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1(mmios_0_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2(mmios_0_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3(mmios_0_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val(mmios_0_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype(mmios_0_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype(mmios_0_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype(mmios_0_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en(mmios_0_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val(mmios_0_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single(mmios_0_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if(mmios_0_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if(mmios_0_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if(mmios_0_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if(mmios_0_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if(mmios_0_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc(mmios_0_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc(mmios_0_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data(mmios_0_io_resp_bits_data),
    .io_resp_bits_is_hella(mmios_0_io_resp_bits_is_hella),
    .io_mem_access_ready(mmios_0_io_mem_access_ready),
    .io_mem_access_valid(mmios_0_io_mem_access_valid),
    .io_mem_access_bits_opcode(mmios_0_io_mem_access_bits_opcode),
    .io_mem_access_bits_param(mmios_0_io_mem_access_bits_param),
    .io_mem_access_bits_size(mmios_0_io_mem_access_bits_size),
    .io_mem_access_bits_source(mmios_0_io_mem_access_bits_source),
    .io_mem_access_bits_address(mmios_0_io_mem_access_bits_address),
    .io_mem_access_bits_mask(mmios_0_io_mem_access_bits_mask),
    .io_mem_access_bits_data(mmios_0_io_mem_access_bits_data),
    .io_mem_access_bits_corrupt(mmios_0_io_mem_access_bits_corrupt),
    .io_mem_ack_valid(mmios_0_io_mem_ack_valid),
    .io_mem_ack_bits_opcode(mmios_0_io_mem_ack_bits_opcode),
    .io_mem_ack_bits_param(mmios_0_io_mem_ack_bits_param),
    .io_mem_ack_bits_size(mmios_0_io_mem_ack_bits_size),
    .io_mem_ack_bits_source(mmios_0_io_mem_ack_bits_source),
    .io_mem_ack_bits_sink(mmios_0_io_mem_ack_bits_sink),
    .io_mem_ack_bits_denied(mmios_0_io_mem_ack_bits_denied),
    .io_mem_ack_bits_data(mmios_0_io_mem_ack_bits_data),
    .io_mem_ack_bits_corrupt(mmios_0_io_mem_ack_bits_corrupt)
  );
  BranchKillableQueue_2 respq ( // @[mshrs.scala 737:21]
    .clock(respq_clock),
    .reset(respq_reset),
    .io_enq_ready(respq_io_enq_ready),
    .io_enq_valid(respq_io_enq_valid),
    .io_enq_bits_uop_uopc(respq_io_enq_bits_uop_uopc),
    .io_enq_bits_uop_inst(respq_io_enq_bits_uop_inst),
    .io_enq_bits_uop_debug_inst(respq_io_enq_bits_uop_debug_inst),
    .io_enq_bits_uop_is_rvc(respq_io_enq_bits_uop_is_rvc),
    .io_enq_bits_uop_debug_pc(respq_io_enq_bits_uop_debug_pc),
    .io_enq_bits_uop_iq_type(respq_io_enq_bits_uop_iq_type),
    .io_enq_bits_uop_fu_code(respq_io_enq_bits_uop_fu_code),
    .io_enq_bits_uop_ctrl_br_type(respq_io_enq_bits_uop_ctrl_br_type),
    .io_enq_bits_uop_ctrl_op1_sel(respq_io_enq_bits_uop_ctrl_op1_sel),
    .io_enq_bits_uop_ctrl_op2_sel(respq_io_enq_bits_uop_ctrl_op2_sel),
    .io_enq_bits_uop_ctrl_imm_sel(respq_io_enq_bits_uop_ctrl_imm_sel),
    .io_enq_bits_uop_ctrl_op_fcn(respq_io_enq_bits_uop_ctrl_op_fcn),
    .io_enq_bits_uop_ctrl_fcn_dw(respq_io_enq_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_uop_ctrl_csr_cmd(respq_io_enq_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_uop_ctrl_is_load(respq_io_enq_bits_uop_ctrl_is_load),
    .io_enq_bits_uop_ctrl_is_sta(respq_io_enq_bits_uop_ctrl_is_sta),
    .io_enq_bits_uop_ctrl_is_std(respq_io_enq_bits_uop_ctrl_is_std),
    .io_enq_bits_uop_iw_state(respq_io_enq_bits_uop_iw_state),
    .io_enq_bits_uop_iw_p1_poisoned(respq_io_enq_bits_uop_iw_p1_poisoned),
    .io_enq_bits_uop_iw_p2_poisoned(respq_io_enq_bits_uop_iw_p2_poisoned),
    .io_enq_bits_uop_is_br(respq_io_enq_bits_uop_is_br),
    .io_enq_bits_uop_is_jalr(respq_io_enq_bits_uop_is_jalr),
    .io_enq_bits_uop_is_jal(respq_io_enq_bits_uop_is_jal),
    .io_enq_bits_uop_is_sfb(respq_io_enq_bits_uop_is_sfb),
    .io_enq_bits_uop_br_mask(respq_io_enq_bits_uop_br_mask),
    .io_enq_bits_uop_br_tag(respq_io_enq_bits_uop_br_tag),
    .io_enq_bits_uop_ftq_idx(respq_io_enq_bits_uop_ftq_idx),
    .io_enq_bits_uop_edge_inst(respq_io_enq_bits_uop_edge_inst),
    .io_enq_bits_uop_pc_lob(respq_io_enq_bits_uop_pc_lob),
    .io_enq_bits_uop_taken(respq_io_enq_bits_uop_taken),
    .io_enq_bits_uop_imm_packed(respq_io_enq_bits_uop_imm_packed),
    .io_enq_bits_uop_csr_addr(respq_io_enq_bits_uop_csr_addr),
    .io_enq_bits_uop_rob_idx(respq_io_enq_bits_uop_rob_idx),
    .io_enq_bits_uop_ldq_idx(respq_io_enq_bits_uop_ldq_idx),
    .io_enq_bits_uop_stq_idx(respq_io_enq_bits_uop_stq_idx),
    .io_enq_bits_uop_rxq_idx(respq_io_enq_bits_uop_rxq_idx),
    .io_enq_bits_uop_pdst(respq_io_enq_bits_uop_pdst),
    .io_enq_bits_uop_prs1(respq_io_enq_bits_uop_prs1),
    .io_enq_bits_uop_prs2(respq_io_enq_bits_uop_prs2),
    .io_enq_bits_uop_prs3(respq_io_enq_bits_uop_prs3),
    .io_enq_bits_uop_ppred(respq_io_enq_bits_uop_ppred),
    .io_enq_bits_uop_prs1_busy(respq_io_enq_bits_uop_prs1_busy),
    .io_enq_bits_uop_prs2_busy(respq_io_enq_bits_uop_prs2_busy),
    .io_enq_bits_uop_prs3_busy(respq_io_enq_bits_uop_prs3_busy),
    .io_enq_bits_uop_ppred_busy(respq_io_enq_bits_uop_ppred_busy),
    .io_enq_bits_uop_stale_pdst(respq_io_enq_bits_uop_stale_pdst),
    .io_enq_bits_uop_exception(respq_io_enq_bits_uop_exception),
    .io_enq_bits_uop_exc_cause(respq_io_enq_bits_uop_exc_cause),
    .io_enq_bits_uop_bypassable(respq_io_enq_bits_uop_bypassable),
    .io_enq_bits_uop_mem_cmd(respq_io_enq_bits_uop_mem_cmd),
    .io_enq_bits_uop_mem_size(respq_io_enq_bits_uop_mem_size),
    .io_enq_bits_uop_mem_signed(respq_io_enq_bits_uop_mem_signed),
    .io_enq_bits_uop_is_fence(respq_io_enq_bits_uop_is_fence),
    .io_enq_bits_uop_is_fencei(respq_io_enq_bits_uop_is_fencei),
    .io_enq_bits_uop_is_amo(respq_io_enq_bits_uop_is_amo),
    .io_enq_bits_uop_uses_ldq(respq_io_enq_bits_uop_uses_ldq),
    .io_enq_bits_uop_uses_stq(respq_io_enq_bits_uop_uses_stq),
    .io_enq_bits_uop_is_sys_pc2epc(respq_io_enq_bits_uop_is_sys_pc2epc),
    .io_enq_bits_uop_is_unique(respq_io_enq_bits_uop_is_unique),
    .io_enq_bits_uop_flush_on_commit(respq_io_enq_bits_uop_flush_on_commit),
    .io_enq_bits_uop_ldst_is_rs1(respq_io_enq_bits_uop_ldst_is_rs1),
    .io_enq_bits_uop_ldst(respq_io_enq_bits_uop_ldst),
    .io_enq_bits_uop_lrs1(respq_io_enq_bits_uop_lrs1),
    .io_enq_bits_uop_lrs2(respq_io_enq_bits_uop_lrs2),
    .io_enq_bits_uop_lrs3(respq_io_enq_bits_uop_lrs3),
    .io_enq_bits_uop_ldst_val(respq_io_enq_bits_uop_ldst_val),
    .io_enq_bits_uop_dst_rtype(respq_io_enq_bits_uop_dst_rtype),
    .io_enq_bits_uop_lrs1_rtype(respq_io_enq_bits_uop_lrs1_rtype),
    .io_enq_bits_uop_lrs2_rtype(respq_io_enq_bits_uop_lrs2_rtype),
    .io_enq_bits_uop_frs3_en(respq_io_enq_bits_uop_frs3_en),
    .io_enq_bits_uop_fp_val(respq_io_enq_bits_uop_fp_val),
    .io_enq_bits_uop_fp_single(respq_io_enq_bits_uop_fp_single),
    .io_enq_bits_uop_xcpt_pf_if(respq_io_enq_bits_uop_xcpt_pf_if),
    .io_enq_bits_uop_xcpt_ae_if(respq_io_enq_bits_uop_xcpt_ae_if),
    .io_enq_bits_uop_xcpt_ma_if(respq_io_enq_bits_uop_xcpt_ma_if),
    .io_enq_bits_uop_bp_debug_if(respq_io_enq_bits_uop_bp_debug_if),
    .io_enq_bits_uop_bp_xcpt_if(respq_io_enq_bits_uop_bp_xcpt_if),
    .io_enq_bits_uop_debug_fsrc(respq_io_enq_bits_uop_debug_fsrc),
    .io_enq_bits_uop_debug_tsrc(respq_io_enq_bits_uop_debug_tsrc),
    .io_enq_bits_data(respq_io_enq_bits_data),
    .io_enq_bits_is_hella(respq_io_enq_bits_is_hella),
    .io_deq_ready(respq_io_deq_ready),
    .io_deq_valid(respq_io_deq_valid),
    .io_deq_bits_uop_uopc(respq_io_deq_bits_uop_uopc),
    .io_deq_bits_uop_inst(respq_io_deq_bits_uop_inst),
    .io_deq_bits_uop_debug_inst(respq_io_deq_bits_uop_debug_inst),
    .io_deq_bits_uop_is_rvc(respq_io_deq_bits_uop_is_rvc),
    .io_deq_bits_uop_debug_pc(respq_io_deq_bits_uop_debug_pc),
    .io_deq_bits_uop_iq_type(respq_io_deq_bits_uop_iq_type),
    .io_deq_bits_uop_fu_code(respq_io_deq_bits_uop_fu_code),
    .io_deq_bits_uop_ctrl_br_type(respq_io_deq_bits_uop_ctrl_br_type),
    .io_deq_bits_uop_ctrl_op1_sel(respq_io_deq_bits_uop_ctrl_op1_sel),
    .io_deq_bits_uop_ctrl_op2_sel(respq_io_deq_bits_uop_ctrl_op2_sel),
    .io_deq_bits_uop_ctrl_imm_sel(respq_io_deq_bits_uop_ctrl_imm_sel),
    .io_deq_bits_uop_ctrl_op_fcn(respq_io_deq_bits_uop_ctrl_op_fcn),
    .io_deq_bits_uop_ctrl_fcn_dw(respq_io_deq_bits_uop_ctrl_fcn_dw),
    .io_deq_bits_uop_ctrl_csr_cmd(respq_io_deq_bits_uop_ctrl_csr_cmd),
    .io_deq_bits_uop_ctrl_is_load(respq_io_deq_bits_uop_ctrl_is_load),
    .io_deq_bits_uop_ctrl_is_sta(respq_io_deq_bits_uop_ctrl_is_sta),
    .io_deq_bits_uop_ctrl_is_std(respq_io_deq_bits_uop_ctrl_is_std),
    .io_deq_bits_uop_iw_state(respq_io_deq_bits_uop_iw_state),
    .io_deq_bits_uop_iw_p1_poisoned(respq_io_deq_bits_uop_iw_p1_poisoned),
    .io_deq_bits_uop_iw_p2_poisoned(respq_io_deq_bits_uop_iw_p2_poisoned),
    .io_deq_bits_uop_is_br(respq_io_deq_bits_uop_is_br),
    .io_deq_bits_uop_is_jalr(respq_io_deq_bits_uop_is_jalr),
    .io_deq_bits_uop_is_jal(respq_io_deq_bits_uop_is_jal),
    .io_deq_bits_uop_is_sfb(respq_io_deq_bits_uop_is_sfb),
    .io_deq_bits_uop_br_mask(respq_io_deq_bits_uop_br_mask),
    .io_deq_bits_uop_br_tag(respq_io_deq_bits_uop_br_tag),
    .io_deq_bits_uop_ftq_idx(respq_io_deq_bits_uop_ftq_idx),
    .io_deq_bits_uop_edge_inst(respq_io_deq_bits_uop_edge_inst),
    .io_deq_bits_uop_pc_lob(respq_io_deq_bits_uop_pc_lob),
    .io_deq_bits_uop_taken(respq_io_deq_bits_uop_taken),
    .io_deq_bits_uop_imm_packed(respq_io_deq_bits_uop_imm_packed),
    .io_deq_bits_uop_csr_addr(respq_io_deq_bits_uop_csr_addr),
    .io_deq_bits_uop_rob_idx(respq_io_deq_bits_uop_rob_idx),
    .io_deq_bits_uop_ldq_idx(respq_io_deq_bits_uop_ldq_idx),
    .io_deq_bits_uop_stq_idx(respq_io_deq_bits_uop_stq_idx),
    .io_deq_bits_uop_rxq_idx(respq_io_deq_bits_uop_rxq_idx),
    .io_deq_bits_uop_pdst(respq_io_deq_bits_uop_pdst),
    .io_deq_bits_uop_prs1(respq_io_deq_bits_uop_prs1),
    .io_deq_bits_uop_prs2(respq_io_deq_bits_uop_prs2),
    .io_deq_bits_uop_prs3(respq_io_deq_bits_uop_prs3),
    .io_deq_bits_uop_ppred(respq_io_deq_bits_uop_ppred),
    .io_deq_bits_uop_prs1_busy(respq_io_deq_bits_uop_prs1_busy),
    .io_deq_bits_uop_prs2_busy(respq_io_deq_bits_uop_prs2_busy),
    .io_deq_bits_uop_prs3_busy(respq_io_deq_bits_uop_prs3_busy),
    .io_deq_bits_uop_ppred_busy(respq_io_deq_bits_uop_ppred_busy),
    .io_deq_bits_uop_stale_pdst(respq_io_deq_bits_uop_stale_pdst),
    .io_deq_bits_uop_exception(respq_io_deq_bits_uop_exception),
    .io_deq_bits_uop_exc_cause(respq_io_deq_bits_uop_exc_cause),
    .io_deq_bits_uop_bypassable(respq_io_deq_bits_uop_bypassable),
    .io_deq_bits_uop_mem_cmd(respq_io_deq_bits_uop_mem_cmd),
    .io_deq_bits_uop_mem_size(respq_io_deq_bits_uop_mem_size),
    .io_deq_bits_uop_mem_signed(respq_io_deq_bits_uop_mem_signed),
    .io_deq_bits_uop_is_fence(respq_io_deq_bits_uop_is_fence),
    .io_deq_bits_uop_is_fencei(respq_io_deq_bits_uop_is_fencei),
    .io_deq_bits_uop_is_amo(respq_io_deq_bits_uop_is_amo),
    .io_deq_bits_uop_uses_ldq(respq_io_deq_bits_uop_uses_ldq),
    .io_deq_bits_uop_uses_stq(respq_io_deq_bits_uop_uses_stq),
    .io_deq_bits_uop_is_sys_pc2epc(respq_io_deq_bits_uop_is_sys_pc2epc),
    .io_deq_bits_uop_is_unique(respq_io_deq_bits_uop_is_unique),
    .io_deq_bits_uop_flush_on_commit(respq_io_deq_bits_uop_flush_on_commit),
    .io_deq_bits_uop_ldst_is_rs1(respq_io_deq_bits_uop_ldst_is_rs1),
    .io_deq_bits_uop_ldst(respq_io_deq_bits_uop_ldst),
    .io_deq_bits_uop_lrs1(respq_io_deq_bits_uop_lrs1),
    .io_deq_bits_uop_lrs2(respq_io_deq_bits_uop_lrs2),
    .io_deq_bits_uop_lrs3(respq_io_deq_bits_uop_lrs3),
    .io_deq_bits_uop_ldst_val(respq_io_deq_bits_uop_ldst_val),
    .io_deq_bits_uop_dst_rtype(respq_io_deq_bits_uop_dst_rtype),
    .io_deq_bits_uop_lrs1_rtype(respq_io_deq_bits_uop_lrs1_rtype),
    .io_deq_bits_uop_lrs2_rtype(respq_io_deq_bits_uop_lrs2_rtype),
    .io_deq_bits_uop_frs3_en(respq_io_deq_bits_uop_frs3_en),
    .io_deq_bits_uop_fp_val(respq_io_deq_bits_uop_fp_val),
    .io_deq_bits_uop_fp_single(respq_io_deq_bits_uop_fp_single),
    .io_deq_bits_uop_xcpt_pf_if(respq_io_deq_bits_uop_xcpt_pf_if),
    .io_deq_bits_uop_xcpt_ae_if(respq_io_deq_bits_uop_xcpt_ae_if),
    .io_deq_bits_uop_xcpt_ma_if(respq_io_deq_bits_uop_xcpt_ma_if),
    .io_deq_bits_uop_bp_debug_if(respq_io_deq_bits_uop_bp_debug_if),
    .io_deq_bits_uop_bp_xcpt_if(respq_io_deq_bits_uop_bp_xcpt_if),
    .io_deq_bits_uop_debug_fsrc(respq_io_deq_bits_uop_debug_fsrc),
    .io_deq_bits_uop_debug_tsrc(respq_io_deq_bits_uop_debug_tsrc),
    .io_deq_bits_data(respq_io_deq_bits_data),
    .io_deq_bits_is_hella(respq_io_deq_bits_is_hella),
    .io_brupdate_b1_resolve_mask(respq_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(respq_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_uopc(respq_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(respq_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(respq_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(respq_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(respq_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(respq_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(respq_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(respq_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(respq_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(respq_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(respq_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(respq_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(respq_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(respq_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(respq_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(respq_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(respq_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_iw_state(respq_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(respq_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(respq_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(respq_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(respq_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(respq_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(respq_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(respq_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(respq_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(respq_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(respq_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(respq_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(respq_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(respq_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(respq_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(respq_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(respq_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(respq_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(respq_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(respq_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(respq_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(respq_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(respq_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(respq_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(respq_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(respq_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(respq_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(respq_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(respq_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(respq_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(respq_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(respq_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(respq_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(respq_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(respq_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(respq_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(respq_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(respq_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(respq_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(respq_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(respq_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(respq_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(respq_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(respq_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(respq_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(respq_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(respq_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(respq_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(respq_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(respq_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(respq_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(respq_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(respq_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(respq_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(respq_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(respq_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(respq_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(respq_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(respq_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(respq_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(respq_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(respq_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(respq_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(respq_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(respq_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(respq_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(respq_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(respq_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(respq_io_brupdate_b2_target_offset),
    .io_flush(respq_io_flush),
    .io_empty(respq_io_empty),
    .io_count(respq_io_count)
  );
  assign sdq_MPORT_3_addr = replay_arb_io_out_bits_sdq_id;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign sdq_MPORT_3_data = sdq[sdq_MPORT_3_addr]; // @[mshrs.scala 559:25]
  `else
  assign sdq_MPORT_3_data = sdq_MPORT_3_addr >= 5'h11 ? _RAND_1[63:0] : sdq[sdq_MPORT_3_addr]; // @[mshrs.scala 559:25]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign sdq_MPORT_data = io_req_0_bits_data;
  assign sdq_MPORT_addr = _T_55[0] ? 5'h0 : _T_87;
  assign sdq_MPORT_mask = 1'h1;
  assign sdq_MPORT_en = _T_90 & _T_113;
  assign lb_MPORT_2_addr = {lb_read_arb_io_out_bits_id,lb_read_arb_io_out_bits_offset};
  assign lb_MPORT_2_data = lb[lb_MPORT_2_addr]; // @[mshrs.scala 568:15]
  assign lb_MPORT_1_data = lb_write_arb_io_out_bits_data;
  assign lb_MPORT_1_addr = {lb_write_arb_io_out_bits_id,lb_write_arb_io_out_bits_offset};
  assign lb_MPORT_1_mask = 1'h1;
  assign lb_MPORT_1_en = lb_write_arb_io_out_ready & lb_write_arb_io_out_valid;
  assign io_req_0_ready = _T_205 ? mmio_rdy : sdq_rdy & _T_312; // @[mshrs.scala 745:10]
  assign io_resp_valid = respq_io_deq_valid; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_uopc = respq_io_deq_bits_uop_uopc; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_inst = respq_io_deq_bits_uop_inst; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_debug_inst = respq_io_deq_bits_uop_debug_inst; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_is_rvc = respq_io_deq_bits_uop_is_rvc; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_debug_pc = respq_io_deq_bits_uop_debug_pc; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_iq_type = respq_io_deq_bits_uop_iq_type; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_fu_code = respq_io_deq_bits_uop_fu_code; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ctrl_br_type = respq_io_deq_bits_uop_ctrl_br_type; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ctrl_op1_sel = respq_io_deq_bits_uop_ctrl_op1_sel; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ctrl_op2_sel = respq_io_deq_bits_uop_ctrl_op2_sel; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ctrl_imm_sel = respq_io_deq_bits_uop_ctrl_imm_sel; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ctrl_op_fcn = respq_io_deq_bits_uop_ctrl_op_fcn; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ctrl_fcn_dw = respq_io_deq_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ctrl_csr_cmd = respq_io_deq_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ctrl_is_load = respq_io_deq_bits_uop_ctrl_is_load; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ctrl_is_sta = respq_io_deq_bits_uop_ctrl_is_sta; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ctrl_is_std = respq_io_deq_bits_uop_ctrl_is_std; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_iw_state = respq_io_deq_bits_uop_iw_state; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_iw_p1_poisoned = respq_io_deq_bits_uop_iw_p1_poisoned; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_iw_p2_poisoned = respq_io_deq_bits_uop_iw_p2_poisoned; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_is_br = respq_io_deq_bits_uop_is_br; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_is_jalr = respq_io_deq_bits_uop_is_jalr; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_is_jal = respq_io_deq_bits_uop_is_jal; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_is_sfb = respq_io_deq_bits_uop_is_sfb; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_br_mask = respq_io_deq_bits_uop_br_mask; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_br_tag = respq_io_deq_bits_uop_br_tag; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ftq_idx = respq_io_deq_bits_uop_ftq_idx; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_edge_inst = respq_io_deq_bits_uop_edge_inst; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_pc_lob = respq_io_deq_bits_uop_pc_lob; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_taken = respq_io_deq_bits_uop_taken; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_imm_packed = respq_io_deq_bits_uop_imm_packed; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_csr_addr = respq_io_deq_bits_uop_csr_addr; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_rob_idx = respq_io_deq_bits_uop_rob_idx; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ldq_idx = respq_io_deq_bits_uop_ldq_idx; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_stq_idx = respq_io_deq_bits_uop_stq_idx; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_rxq_idx = respq_io_deq_bits_uop_rxq_idx; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_pdst = respq_io_deq_bits_uop_pdst; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_prs1 = respq_io_deq_bits_uop_prs1; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_prs2 = respq_io_deq_bits_uop_prs2; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_prs3 = respq_io_deq_bits_uop_prs3; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ppred = respq_io_deq_bits_uop_ppred; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_prs1_busy = respq_io_deq_bits_uop_prs1_busy; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_prs2_busy = respq_io_deq_bits_uop_prs2_busy; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_prs3_busy = respq_io_deq_bits_uop_prs3_busy; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ppred_busy = respq_io_deq_bits_uop_ppred_busy; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_stale_pdst = respq_io_deq_bits_uop_stale_pdst; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_exception = respq_io_deq_bits_uop_exception; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_exc_cause = respq_io_deq_bits_uop_exc_cause; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_bypassable = respq_io_deq_bits_uop_bypassable; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_mem_cmd = respq_io_deq_bits_uop_mem_cmd; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_mem_size = respq_io_deq_bits_uop_mem_size; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_mem_signed = respq_io_deq_bits_uop_mem_signed; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_is_fence = respq_io_deq_bits_uop_is_fence; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_is_fencei = respq_io_deq_bits_uop_is_fencei; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_is_amo = respq_io_deq_bits_uop_is_amo; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_uses_ldq = respq_io_deq_bits_uop_uses_ldq; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_uses_stq = respq_io_deq_bits_uop_uses_stq; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_is_sys_pc2epc = respq_io_deq_bits_uop_is_sys_pc2epc; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_is_unique = respq_io_deq_bits_uop_is_unique; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_flush_on_commit = respq_io_deq_bits_uop_flush_on_commit; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ldst_is_rs1 = respq_io_deq_bits_uop_ldst_is_rs1; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ldst = respq_io_deq_bits_uop_ldst; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_lrs1 = respq_io_deq_bits_uop_lrs1; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_lrs2 = respq_io_deq_bits_uop_lrs2; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_lrs3 = respq_io_deq_bits_uop_lrs3; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_ldst_val = respq_io_deq_bits_uop_ldst_val; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_dst_rtype = respq_io_deq_bits_uop_dst_rtype; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_lrs1_rtype = respq_io_deq_bits_uop_lrs1_rtype; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_lrs2_rtype = respq_io_deq_bits_uop_lrs2_rtype; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_frs3_en = respq_io_deq_bits_uop_frs3_en; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_fp_val = respq_io_deq_bits_uop_fp_val; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_fp_single = respq_io_deq_bits_uop_fp_single; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_xcpt_pf_if = respq_io_deq_bits_uop_xcpt_pf_if; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_xcpt_ae_if = respq_io_deq_bits_uop_xcpt_ae_if; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_xcpt_ma_if = respq_io_deq_bits_uop_xcpt_ma_if; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_bp_debug_if = respq_io_deq_bits_uop_bp_debug_if; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_bp_xcpt_if = respq_io_deq_bits_uop_bp_xcpt_if; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_debug_fsrc = respq_io_deq_bits_uop_debug_fsrc; // @[mshrs.scala 741:21]
  assign io_resp_bits_uop_debug_tsrc = respq_io_deq_bits_uop_debug_tsrc; // @[mshrs.scala 741:21]
  assign io_resp_bits_data = respq_io_deq_bits_data; // @[mshrs.scala 741:21]
  assign io_resp_bits_is_hella = respq_io_deq_bits_is_hella; // @[mshrs.scala 741:21]
  assign io_secondary_miss_0 = idx_match_0 & way_match_0 & _T_147; // @[mshrs.scala 746:58]
  assign io_block_hit_0 = idx_match_0 & tag_match_0; // @[mshrs.scala 747:42]
  assign io_mem_acquire_valid = idle ? _T_225 : _sink_ACancel_earlyValid_T_6; // @[Arbiter.scala 125:29]
  assign io_mem_acquire_bits_opcode = _T_280 | _T_279; // @[Mux.scala 27:72]
  assign io_mem_acquire_bits_param = _T_275 | _T_274; // @[Mux.scala 27:72]
  assign io_mem_acquire_bits_size = _T_270 | _T_269; // @[Mux.scala 27:72]
  assign io_mem_acquire_bits_source = _T_265 | _T_264; // @[Mux.scala 27:72]
  assign io_mem_acquire_bits_address = _T_260 | _T_259; // @[Mux.scala 27:72]
  assign io_mem_acquire_bits_mask = _T_255 | _T_254; // @[Mux.scala 27:72]
  assign io_mem_acquire_bits_data = _T_250 | _T_249; // @[Mux.scala 27:72]
  assign io_mem_acquire_bits_corrupt = muxStateEarly__0 & out_bits_corrupt | muxStateEarly__1 & out_1_bits_corrupt |
    muxStateEarly__2 & out_2_bits_corrupt; // @[Mux.scala 27:72]
  assign io_mem_grant_ready = _T_201 | _GEN_42; // @[mshrs.scala 721:46 mshrs.scala 722:26]
  assign io_mem_finish_valid = idle_1 ? _T_292 : _sink_ACancel_earlyValid_T_11; // @[Arbiter.scala 125:29]
  assign io_mem_finish_bits_sink = _T_306 | _T_307; // @[Mux.scala 27:72]
  assign io_refill_valid = refill_arb_io_out_valid; // @[mshrs.scala 749:21]
  assign io_refill_bits_way_en = refill_arb_io_out_bits_way_en; // @[mshrs.scala 749:21]
  assign io_refill_bits_addr = refill_arb_io_out_bits_addr; // @[mshrs.scala 749:21]
  assign io_refill_bits_wmask = refill_arb_io_out_bits_wmask; // @[mshrs.scala 749:21]
  assign io_refill_bits_data = refill_arb_io_out_bits_data; // @[mshrs.scala 749:21]
  assign io_meta_write_valid = meta_write_arb_io_out_valid; // @[mshrs.scala 699:17]
  assign io_meta_write_bits_idx = meta_write_arb_io_out_bits_idx; // @[mshrs.scala 699:17]
  assign io_meta_write_bits_way_en = meta_write_arb_io_out_bits_way_en; // @[mshrs.scala 699:17]
  assign io_meta_write_bits_tag = meta_write_arb_io_out_bits_tag; // @[mshrs.scala 699:17]
  assign io_meta_write_bits_data_coh_state = meta_write_arb_io_out_bits_data_coh_state; // @[mshrs.scala 699:17]
  assign io_meta_write_bits_data_tag = meta_write_arb_io_out_bits_data_tag; // @[mshrs.scala 699:17]
  assign io_meta_read_valid = meta_read_arb_io_out_valid; // @[mshrs.scala 700:17]
  assign io_meta_read_bits_idx = meta_read_arb_io_out_bits_idx; // @[mshrs.scala 700:17]
  assign io_meta_read_bits_way_en = meta_read_arb_io_out_bits_way_en; // @[mshrs.scala 700:17]
  assign io_meta_read_bits_tag = meta_read_arb_io_out_bits_tag; // @[mshrs.scala 700:17]
  assign io_replay_valid = replay_arb_io_out_valid; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_uopc = replay_arb_io_out_bits_uop_uopc; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_inst = replay_arb_io_out_bits_uop_inst; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_debug_inst = replay_arb_io_out_bits_uop_debug_inst; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_is_rvc = replay_arb_io_out_bits_uop_is_rvc; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_debug_pc = replay_arb_io_out_bits_uop_debug_pc; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_iq_type = replay_arb_io_out_bits_uop_iq_type; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_fu_code = replay_arb_io_out_bits_uop_fu_code; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ctrl_br_type = replay_arb_io_out_bits_uop_ctrl_br_type; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ctrl_op1_sel = replay_arb_io_out_bits_uop_ctrl_op1_sel; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ctrl_op2_sel = replay_arb_io_out_bits_uop_ctrl_op2_sel; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ctrl_imm_sel = replay_arb_io_out_bits_uop_ctrl_imm_sel; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ctrl_op_fcn = replay_arb_io_out_bits_uop_ctrl_op_fcn; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ctrl_fcn_dw = replay_arb_io_out_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ctrl_csr_cmd = replay_arb_io_out_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ctrl_is_load = replay_arb_io_out_bits_uop_ctrl_is_load; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ctrl_is_sta = replay_arb_io_out_bits_uop_ctrl_is_sta; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ctrl_is_std = replay_arb_io_out_bits_uop_ctrl_is_std; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_iw_state = replay_arb_io_out_bits_uop_iw_state; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_iw_p1_poisoned = replay_arb_io_out_bits_uop_iw_p1_poisoned; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_iw_p2_poisoned = replay_arb_io_out_bits_uop_iw_p2_poisoned; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_is_br = replay_arb_io_out_bits_uop_is_br; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_is_jalr = replay_arb_io_out_bits_uop_is_jalr; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_is_jal = replay_arb_io_out_bits_uop_is_jal; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_is_sfb = replay_arb_io_out_bits_uop_is_sfb; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_br_mask = replay_arb_io_out_bits_uop_br_mask; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_br_tag = replay_arb_io_out_bits_uop_br_tag; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ftq_idx = replay_arb_io_out_bits_uop_ftq_idx; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_edge_inst = replay_arb_io_out_bits_uop_edge_inst; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_pc_lob = replay_arb_io_out_bits_uop_pc_lob; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_taken = replay_arb_io_out_bits_uop_taken; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_imm_packed = replay_arb_io_out_bits_uop_imm_packed; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_csr_addr = replay_arb_io_out_bits_uop_csr_addr; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_rob_idx = replay_arb_io_out_bits_uop_rob_idx; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ldq_idx = replay_arb_io_out_bits_uop_ldq_idx; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_stq_idx = replay_arb_io_out_bits_uop_stq_idx; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_rxq_idx = replay_arb_io_out_bits_uop_rxq_idx; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_pdst = replay_arb_io_out_bits_uop_pdst; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_prs1 = replay_arb_io_out_bits_uop_prs1; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_prs2 = replay_arb_io_out_bits_uop_prs2; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_prs3 = replay_arb_io_out_bits_uop_prs3; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ppred = replay_arb_io_out_bits_uop_ppred; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_prs1_busy = replay_arb_io_out_bits_uop_prs1_busy; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_prs2_busy = replay_arb_io_out_bits_uop_prs2_busy; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_prs3_busy = replay_arb_io_out_bits_uop_prs3_busy; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ppred_busy = replay_arb_io_out_bits_uop_ppred_busy; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_stale_pdst = replay_arb_io_out_bits_uop_stale_pdst; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_exception = replay_arb_io_out_bits_uop_exception; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_exc_cause = replay_arb_io_out_bits_uop_exc_cause; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_bypassable = replay_arb_io_out_bits_uop_bypassable; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_mem_cmd = replay_arb_io_out_bits_uop_mem_cmd; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_mem_size = replay_arb_io_out_bits_uop_mem_size; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_mem_signed = replay_arb_io_out_bits_uop_mem_signed; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_is_fence = replay_arb_io_out_bits_uop_is_fence; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_is_fencei = replay_arb_io_out_bits_uop_is_fencei; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_is_amo = replay_arb_io_out_bits_uop_is_amo; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_uses_ldq = replay_arb_io_out_bits_uop_uses_ldq; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_uses_stq = replay_arb_io_out_bits_uop_uses_stq; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_is_sys_pc2epc = replay_arb_io_out_bits_uop_is_sys_pc2epc; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_is_unique = replay_arb_io_out_bits_uop_is_unique; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_flush_on_commit = replay_arb_io_out_bits_uop_flush_on_commit; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ldst_is_rs1 = replay_arb_io_out_bits_uop_ldst_is_rs1; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ldst = replay_arb_io_out_bits_uop_ldst; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_lrs1 = replay_arb_io_out_bits_uop_lrs1; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_lrs2 = replay_arb_io_out_bits_uop_lrs2; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_lrs3 = replay_arb_io_out_bits_uop_lrs3; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_ldst_val = replay_arb_io_out_bits_uop_ldst_val; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_dst_rtype = replay_arb_io_out_bits_uop_dst_rtype; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_lrs1_rtype = replay_arb_io_out_bits_uop_lrs1_rtype; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_lrs2_rtype = replay_arb_io_out_bits_uop_lrs2_rtype; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_frs3_en = replay_arb_io_out_bits_uop_frs3_en; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_fp_val = replay_arb_io_out_bits_uop_fp_val; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_fp_single = replay_arb_io_out_bits_uop_fp_single; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_xcpt_pf_if = replay_arb_io_out_bits_uop_xcpt_pf_if; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_xcpt_ae_if = replay_arb_io_out_bits_uop_xcpt_ae_if; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_xcpt_ma_if = replay_arb_io_out_bits_uop_xcpt_ma_if; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_bp_debug_if = replay_arb_io_out_bits_uop_bp_debug_if; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_bp_xcpt_if = replay_arb_io_out_bits_uop_bp_xcpt_if; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_debug_fsrc = replay_arb_io_out_bits_uop_debug_fsrc; // @[mshrs.scala 753:13]
  assign io_replay_bits_uop_debug_tsrc = replay_arb_io_out_bits_uop_debug_tsrc; // @[mshrs.scala 753:13]
  assign io_replay_bits_addr = replay_arb_io_out_bits_addr; // @[mshrs.scala 753:13]
  assign io_replay_bits_data = sdq_MPORT_3_data; // @[mshrs.scala 754:23]
  assign io_replay_bits_is_hella = replay_arb_io_out_bits_is_hella; // @[mshrs.scala 753:13]
  assign io_replay_bits_tag_match = replay_arb_io_out_bits_tag_match; // @[mshrs.scala 753:13]
  assign io_replay_bits_old_meta_coh_state = replay_arb_io_out_bits_old_meta_coh_state; // @[mshrs.scala 753:13]
  assign io_replay_bits_old_meta_tag = replay_arb_io_out_bits_old_meta_tag; // @[mshrs.scala 753:13]
  assign io_replay_bits_way_en = replay_arb_io_out_bits_way_en; // @[mshrs.scala 753:13]
  assign io_replay_bits_sdq_id = replay_arb_io_out_bits_sdq_id; // @[mshrs.scala 753:13]
  assign io_prefetch_valid = prefetcher_io_prefetch_valid; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_uopc = prefetcher_io_prefetch_bits_uop_uopc; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_inst = prefetcher_io_prefetch_bits_uop_inst; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_debug_inst = prefetcher_io_prefetch_bits_uop_debug_inst; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_is_rvc = prefetcher_io_prefetch_bits_uop_is_rvc; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_debug_pc = prefetcher_io_prefetch_bits_uop_debug_pc; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_iq_type = prefetcher_io_prefetch_bits_uop_iq_type; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_fu_code = prefetcher_io_prefetch_bits_uop_fu_code; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ctrl_br_type = prefetcher_io_prefetch_bits_uop_ctrl_br_type; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ctrl_op1_sel = prefetcher_io_prefetch_bits_uop_ctrl_op1_sel; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ctrl_op2_sel = prefetcher_io_prefetch_bits_uop_ctrl_op2_sel; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ctrl_imm_sel = prefetcher_io_prefetch_bits_uop_ctrl_imm_sel; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ctrl_op_fcn = prefetcher_io_prefetch_bits_uop_ctrl_op_fcn; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ctrl_fcn_dw = prefetcher_io_prefetch_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ctrl_csr_cmd = prefetcher_io_prefetch_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ctrl_is_load = prefetcher_io_prefetch_bits_uop_ctrl_is_load; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ctrl_is_sta = prefetcher_io_prefetch_bits_uop_ctrl_is_sta; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ctrl_is_std = prefetcher_io_prefetch_bits_uop_ctrl_is_std; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_iw_state = prefetcher_io_prefetch_bits_uop_iw_state; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_iw_p1_poisoned = prefetcher_io_prefetch_bits_uop_iw_p1_poisoned; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_iw_p2_poisoned = prefetcher_io_prefetch_bits_uop_iw_p2_poisoned; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_is_br = prefetcher_io_prefetch_bits_uop_is_br; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_is_jalr = prefetcher_io_prefetch_bits_uop_is_jalr; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_is_jal = prefetcher_io_prefetch_bits_uop_is_jal; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_is_sfb = prefetcher_io_prefetch_bits_uop_is_sfb; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_br_mask = prefetcher_io_prefetch_bits_uop_br_mask; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_br_tag = prefetcher_io_prefetch_bits_uop_br_tag; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ftq_idx = prefetcher_io_prefetch_bits_uop_ftq_idx; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_edge_inst = prefetcher_io_prefetch_bits_uop_edge_inst; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_pc_lob = prefetcher_io_prefetch_bits_uop_pc_lob; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_taken = prefetcher_io_prefetch_bits_uop_taken; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_imm_packed = prefetcher_io_prefetch_bits_uop_imm_packed; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_csr_addr = prefetcher_io_prefetch_bits_uop_csr_addr; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_rob_idx = prefetcher_io_prefetch_bits_uop_rob_idx; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ldq_idx = prefetcher_io_prefetch_bits_uop_ldq_idx; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_stq_idx = prefetcher_io_prefetch_bits_uop_stq_idx; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_rxq_idx = prefetcher_io_prefetch_bits_uop_rxq_idx; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_pdst = prefetcher_io_prefetch_bits_uop_pdst; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_prs1 = prefetcher_io_prefetch_bits_uop_prs1; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_prs2 = prefetcher_io_prefetch_bits_uop_prs2; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_prs3 = prefetcher_io_prefetch_bits_uop_prs3; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ppred = prefetcher_io_prefetch_bits_uop_ppred; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_prs1_busy = prefetcher_io_prefetch_bits_uop_prs1_busy; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_prs2_busy = prefetcher_io_prefetch_bits_uop_prs2_busy; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_prs3_busy = prefetcher_io_prefetch_bits_uop_prs3_busy; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ppred_busy = prefetcher_io_prefetch_bits_uop_ppred_busy; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_stale_pdst = prefetcher_io_prefetch_bits_uop_stale_pdst; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_exception = prefetcher_io_prefetch_bits_uop_exception; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_exc_cause = prefetcher_io_prefetch_bits_uop_exc_cause; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_bypassable = prefetcher_io_prefetch_bits_uop_bypassable; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_mem_cmd = prefetcher_io_prefetch_bits_uop_mem_cmd; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_mem_size = prefetcher_io_prefetch_bits_uop_mem_size; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_mem_signed = prefetcher_io_prefetch_bits_uop_mem_signed; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_is_fence = prefetcher_io_prefetch_bits_uop_is_fence; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_is_fencei = prefetcher_io_prefetch_bits_uop_is_fencei; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_is_amo = prefetcher_io_prefetch_bits_uop_is_amo; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_uses_ldq = prefetcher_io_prefetch_bits_uop_uses_ldq; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_uses_stq = prefetcher_io_prefetch_bits_uop_uses_stq; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_is_sys_pc2epc = prefetcher_io_prefetch_bits_uop_is_sys_pc2epc; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_is_unique = prefetcher_io_prefetch_bits_uop_is_unique; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_flush_on_commit = prefetcher_io_prefetch_bits_uop_flush_on_commit; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ldst_is_rs1 = prefetcher_io_prefetch_bits_uop_ldst_is_rs1; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ldst = prefetcher_io_prefetch_bits_uop_ldst; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_lrs1 = prefetcher_io_prefetch_bits_uop_lrs1; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_lrs2 = prefetcher_io_prefetch_bits_uop_lrs2; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_lrs3 = prefetcher_io_prefetch_bits_uop_lrs3; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_ldst_val = prefetcher_io_prefetch_bits_uop_ldst_val; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_dst_rtype = prefetcher_io_prefetch_bits_uop_dst_rtype; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_lrs1_rtype = prefetcher_io_prefetch_bits_uop_lrs1_rtype; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_lrs2_rtype = prefetcher_io_prefetch_bits_uop_lrs2_rtype; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_frs3_en = prefetcher_io_prefetch_bits_uop_frs3_en; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_fp_val = prefetcher_io_prefetch_bits_uop_fp_val; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_fp_single = prefetcher_io_prefetch_bits_uop_fp_single; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_xcpt_pf_if = prefetcher_io_prefetch_bits_uop_xcpt_pf_if; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_xcpt_ae_if = prefetcher_io_prefetch_bits_uop_xcpt_ae_if; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_xcpt_ma_if = prefetcher_io_prefetch_bits_uop_xcpt_ma_if; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_bp_debug_if = prefetcher_io_prefetch_bits_uop_bp_debug_if; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_bp_xcpt_if = prefetcher_io_prefetch_bits_uop_bp_xcpt_if; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_debug_fsrc = prefetcher_io_prefetch_bits_uop_debug_fsrc; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_uop_debug_tsrc = prefetcher_io_prefetch_bits_uop_debug_tsrc; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_addr = prefetcher_io_prefetch_bits_addr; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_data = prefetcher_io_prefetch_bits_data; // @[mshrs.scala 548:15]
  assign io_prefetch_bits_is_hella = prefetcher_io_prefetch_bits_is_hella; // @[mshrs.scala 548:15]
  assign io_wb_req_valid = wb_req_arb_io_out_valid; // @[mshrs.scala 701:17]
  assign io_wb_req_bits_tag = wb_req_arb_io_out_bits_tag; // @[mshrs.scala 701:17]
  assign io_wb_req_bits_idx = wb_req_arb_io_out_bits_idx; // @[mshrs.scala 701:17]
  assign io_wb_req_bits_source = wb_req_arb_io_out_bits_source; // @[mshrs.scala 701:17]
  assign io_wb_req_bits_param = wb_req_arb_io_out_bits_param; // @[mshrs.scala 701:17]
  assign io_wb_req_bits_way_en = wb_req_arb_io_out_bits_way_en; // @[mshrs.scala 701:17]
  assign io_wb_req_bits_voluntary = wb_req_arb_io_out_bits_voluntary; // @[mshrs.scala 701:17]
  assign io_fence_rdy = ~mmios_0_io_req_ready ? 1'h0 : _GEN_43; // @[mshrs.scala 726:31 mshrs.scala 727:20]
  assign io_probe_rdy = ~mshrs_1_io_probe_rdy & idx_matches_0_1 & io_req_is_probe_0 ? 1'h0 : _GEN_31; // @[mshrs.scala 684:76 mshrs.scala 685:22]
  assign prefetcher_clock = clock;
  assign prefetcher_reset = reset;
  assign prefetcher_io_mshr_avail = REG_1; // @[mshrs.scala 761:31]
  assign prefetcher_io_req_val = REG_2; // @[mshrs.scala 762:31]
  assign prefetcher_io_req_addr = REG_3; // @[mshrs.scala 763:31]
  assign prefetcher_io_req_coh_state = REG_4_state; // @[mshrs.scala 764:31]
  assign prefetcher_io_prefetch_ready = io_prefetch_ready; // @[mshrs.scala 548:15]
  assign lb_read_arb_clock = clock;
  assign lb_read_arb_reset = reset;
  assign lb_read_arb_io_in_0_valid = mshrs_0_io_lb_read_valid; // @[mshrs.scala 663:32]
  assign lb_read_arb_io_in_0_bits_id = mshrs_0_io_lb_read_bits_id; // @[mshrs.scala 663:32]
  assign lb_read_arb_io_in_0_bits_offset = mshrs_0_io_lb_read_bits_offset; // @[mshrs.scala 663:32]
  assign lb_read_arb_io_in_1_valid = mshrs_1_io_lb_read_valid; // @[mshrs.scala 663:32]
  assign lb_read_arb_io_in_1_bits_id = mshrs_1_io_lb_read_bits_id; // @[mshrs.scala 663:32]
  assign lb_read_arb_io_in_1_bits_offset = mshrs_1_io_lb_read_bits_offset; // @[mshrs.scala 663:32]
  assign lb_read_arb_io_out_ready = _T_114 ? 1'h0 : 1'h1; // @[mshrs.scala 576:37 mshrs.scala 572:29 mshrs.scala 579:30]
  assign lb_write_arb_clock = clock;
  assign lb_write_arb_reset = reset;
  assign lb_write_arb_io_in_0_valid = mshrs_0_io_lb_write_valid; // @[mshrs.scala 665:32]
  assign lb_write_arb_io_in_0_bits_id = mshrs_0_io_lb_write_bits_id; // @[mshrs.scala 665:32]
  assign lb_write_arb_io_in_0_bits_offset = mshrs_0_io_lb_write_bits_offset; // @[mshrs.scala 665:32]
  assign lb_write_arb_io_in_0_bits_data = mshrs_0_io_lb_write_bits_data; // @[mshrs.scala 665:32]
  assign lb_write_arb_io_in_1_valid = mshrs_1_io_lb_write_valid; // @[mshrs.scala 665:32]
  assign lb_write_arb_io_in_1_bits_id = mshrs_1_io_lb_write_bits_id; // @[mshrs.scala 665:32]
  assign lb_write_arb_io_in_1_bits_offset = mshrs_1_io_lb_write_bits_offset; // @[mshrs.scala 665:32]
  assign lb_write_arb_io_in_1_bits_data = mshrs_1_io_lb_write_bits_data; // @[mshrs.scala 665:32]
  assign lb_write_arb_io_out_ready = 1'h1; // @[mshrs.scala 573:29]
  assign meta_write_arb_clock = clock;
  assign meta_write_arb_reset = reset;
  assign meta_write_arb_io_in_0_valid = mshrs_0_io_meta_write_valid; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_in_0_bits_idx = mshrs_0_io_meta_write_bits_idx; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_in_0_bits_way_en = mshrs_0_io_meta_write_bits_way_en; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_in_0_bits_tag = mshrs_0_io_meta_write_bits_tag; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_in_0_bits_data_coh_state = mshrs_0_io_meta_write_bits_data_coh_state; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_in_0_bits_data_tag = mshrs_0_io_meta_write_bits_data_tag; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_in_1_valid = mshrs_1_io_meta_write_valid; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_in_1_bits_idx = mshrs_1_io_meta_write_bits_idx; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_in_1_bits_way_en = mshrs_1_io_meta_write_bits_way_en; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_in_1_bits_tag = mshrs_1_io_meta_write_bits_tag; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_in_1_bits_data_coh_state = mshrs_1_io_meta_write_bits_data_coh_state; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_in_1_bits_data_tag = mshrs_1_io_meta_write_bits_data_tag; // @[mshrs.scala 656:29]
  assign meta_write_arb_io_out_ready = io_meta_write_ready; // @[mshrs.scala 699:17]
  assign meta_read_arb_clock = clock;
  assign meta_read_arb_reset = reset;
  assign meta_read_arb_io_in_0_valid = mshrs_0_io_meta_read_valid; // @[mshrs.scala 657:29]
  assign meta_read_arb_io_in_0_bits_idx = mshrs_0_io_meta_read_bits_idx; // @[mshrs.scala 657:29]
  assign meta_read_arb_io_in_0_bits_way_en = mshrs_0_io_meta_read_bits_way_en; // @[mshrs.scala 657:29]
  assign meta_read_arb_io_in_0_bits_tag = mshrs_0_io_meta_read_bits_tag; // @[mshrs.scala 657:29]
  assign meta_read_arb_io_in_1_valid = mshrs_1_io_meta_read_valid; // @[mshrs.scala 657:29]
  assign meta_read_arb_io_in_1_bits_idx = mshrs_1_io_meta_read_bits_idx; // @[mshrs.scala 657:29]
  assign meta_read_arb_io_in_1_bits_way_en = mshrs_1_io_meta_read_bits_way_en; // @[mshrs.scala 657:29]
  assign meta_read_arb_io_in_1_bits_tag = mshrs_1_io_meta_read_bits_tag; // @[mshrs.scala 657:29]
  assign meta_read_arb_io_out_ready = io_meta_read_ready; // @[mshrs.scala 700:17]
  assign wb_req_arb_clock = clock;
  assign wb_req_arb_reset = reset;
  assign wb_req_arb_io_in_0_valid = mshrs_0_io_wb_req_valid; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_0_bits_tag = mshrs_0_io_wb_req_bits_tag; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_0_bits_idx = mshrs_0_io_wb_req_bits_idx; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_0_bits_source = mshrs_0_io_wb_req_bits_source; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_0_bits_param = mshrs_0_io_wb_req_bits_param; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_0_bits_way_en = mshrs_0_io_wb_req_bits_way_en; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_0_bits_voluntary = mshrs_0_io_wb_req_bits_voluntary; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_1_valid = mshrs_1_io_wb_req_valid; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_1_bits_tag = mshrs_1_io_wb_req_bits_tag; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_1_bits_idx = mshrs_1_io_wb_req_bits_idx; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_1_bits_source = mshrs_1_io_wb_req_bits_source; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_1_bits_param = mshrs_1_io_wb_req_bits_param; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_1_bits_way_en = mshrs_1_io_wb_req_bits_way_en; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_in_1_bits_voluntary = mshrs_1_io_wb_req_bits_voluntary; // @[mshrs.scala 659:29]
  assign wb_req_arb_io_out_ready = io_wb_req_ready; // @[mshrs.scala 701:17]
  assign replay_arb_clock = clock;
  assign replay_arb_reset = reset;
  assign replay_arb_io_in_0_valid = mshrs_0_io_replay_valid; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_uopc = mshrs_0_io_replay_bits_uop_uopc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_inst = mshrs_0_io_replay_bits_uop_inst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_debug_inst = mshrs_0_io_replay_bits_uop_debug_inst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_is_rvc = mshrs_0_io_replay_bits_uop_is_rvc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_debug_pc = mshrs_0_io_replay_bits_uop_debug_pc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_iq_type = mshrs_0_io_replay_bits_uop_iq_type; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_fu_code = mshrs_0_io_replay_bits_uop_fu_code; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ctrl_br_type = mshrs_0_io_replay_bits_uop_ctrl_br_type; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ctrl_op1_sel = mshrs_0_io_replay_bits_uop_ctrl_op1_sel; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ctrl_op2_sel = mshrs_0_io_replay_bits_uop_ctrl_op2_sel; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ctrl_imm_sel = mshrs_0_io_replay_bits_uop_ctrl_imm_sel; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ctrl_op_fcn = mshrs_0_io_replay_bits_uop_ctrl_op_fcn; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ctrl_fcn_dw = mshrs_0_io_replay_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ctrl_csr_cmd = mshrs_0_io_replay_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ctrl_is_load = mshrs_0_io_replay_bits_uop_ctrl_is_load; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ctrl_is_sta = mshrs_0_io_replay_bits_uop_ctrl_is_sta; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ctrl_is_std = mshrs_0_io_replay_bits_uop_ctrl_is_std; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_iw_state = mshrs_0_io_replay_bits_uop_iw_state; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_iw_p1_poisoned = mshrs_0_io_replay_bits_uop_iw_p1_poisoned; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_iw_p2_poisoned = mshrs_0_io_replay_bits_uop_iw_p2_poisoned; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_is_br = mshrs_0_io_replay_bits_uop_is_br; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_is_jalr = mshrs_0_io_replay_bits_uop_is_jalr; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_is_jal = mshrs_0_io_replay_bits_uop_is_jal; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_is_sfb = mshrs_0_io_replay_bits_uop_is_sfb; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_br_mask = mshrs_0_io_replay_bits_uop_br_mask; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_br_tag = mshrs_0_io_replay_bits_uop_br_tag; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ftq_idx = mshrs_0_io_replay_bits_uop_ftq_idx; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_edge_inst = mshrs_0_io_replay_bits_uop_edge_inst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_pc_lob = mshrs_0_io_replay_bits_uop_pc_lob; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_taken = mshrs_0_io_replay_bits_uop_taken; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_imm_packed = mshrs_0_io_replay_bits_uop_imm_packed; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_csr_addr = mshrs_0_io_replay_bits_uop_csr_addr; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_rob_idx = mshrs_0_io_replay_bits_uop_rob_idx; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ldq_idx = mshrs_0_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_stq_idx = mshrs_0_io_replay_bits_uop_stq_idx; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_rxq_idx = mshrs_0_io_replay_bits_uop_rxq_idx; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_pdst = mshrs_0_io_replay_bits_uop_pdst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_prs1 = mshrs_0_io_replay_bits_uop_prs1; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_prs2 = mshrs_0_io_replay_bits_uop_prs2; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_prs3 = mshrs_0_io_replay_bits_uop_prs3; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ppred = mshrs_0_io_replay_bits_uop_ppred; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_prs1_busy = mshrs_0_io_replay_bits_uop_prs1_busy; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_prs2_busy = mshrs_0_io_replay_bits_uop_prs2_busy; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_prs3_busy = mshrs_0_io_replay_bits_uop_prs3_busy; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ppred_busy = mshrs_0_io_replay_bits_uop_ppred_busy; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_stale_pdst = mshrs_0_io_replay_bits_uop_stale_pdst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_exception = mshrs_0_io_replay_bits_uop_exception; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_exc_cause = mshrs_0_io_replay_bits_uop_exc_cause; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_bypassable = mshrs_0_io_replay_bits_uop_bypassable; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_mem_cmd = mshrs_0_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_mem_size = mshrs_0_io_replay_bits_uop_mem_size; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_mem_signed = mshrs_0_io_replay_bits_uop_mem_signed; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_is_fence = mshrs_0_io_replay_bits_uop_is_fence; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_is_fencei = mshrs_0_io_replay_bits_uop_is_fencei; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_is_amo = mshrs_0_io_replay_bits_uop_is_amo; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_uses_ldq = mshrs_0_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_uses_stq = mshrs_0_io_replay_bits_uop_uses_stq; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_is_sys_pc2epc = mshrs_0_io_replay_bits_uop_is_sys_pc2epc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_is_unique = mshrs_0_io_replay_bits_uop_is_unique; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_flush_on_commit = mshrs_0_io_replay_bits_uop_flush_on_commit; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ldst_is_rs1 = mshrs_0_io_replay_bits_uop_ldst_is_rs1; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ldst = mshrs_0_io_replay_bits_uop_ldst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_lrs1 = mshrs_0_io_replay_bits_uop_lrs1; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_lrs2 = mshrs_0_io_replay_bits_uop_lrs2; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_lrs3 = mshrs_0_io_replay_bits_uop_lrs3; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_ldst_val = mshrs_0_io_replay_bits_uop_ldst_val; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_dst_rtype = mshrs_0_io_replay_bits_uop_dst_rtype; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_lrs1_rtype = mshrs_0_io_replay_bits_uop_lrs1_rtype; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_lrs2_rtype = mshrs_0_io_replay_bits_uop_lrs2_rtype; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_frs3_en = mshrs_0_io_replay_bits_uop_frs3_en; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_fp_val = mshrs_0_io_replay_bits_uop_fp_val; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_fp_single = mshrs_0_io_replay_bits_uop_fp_single; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_xcpt_pf_if = mshrs_0_io_replay_bits_uop_xcpt_pf_if; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_xcpt_ae_if = mshrs_0_io_replay_bits_uop_xcpt_ae_if; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_xcpt_ma_if = mshrs_0_io_replay_bits_uop_xcpt_ma_if; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_bp_debug_if = mshrs_0_io_replay_bits_uop_bp_debug_if; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_bp_xcpt_if = mshrs_0_io_replay_bits_uop_bp_xcpt_if; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_debug_fsrc = mshrs_0_io_replay_bits_uop_debug_fsrc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_uop_debug_tsrc = mshrs_0_io_replay_bits_uop_debug_tsrc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_addr = mshrs_0_io_replay_bits_addr; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_data = mshrs_0_io_replay_bits_data; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_is_hella = mshrs_0_io_replay_bits_is_hella; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_tag_match = mshrs_0_io_replay_bits_tag_match; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_old_meta_coh_state = mshrs_0_io_replay_bits_old_meta_coh_state; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_old_meta_tag = mshrs_0_io_replay_bits_old_meta_tag; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_way_en = mshrs_0_io_replay_bits_way_en; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_0_bits_sdq_id = mshrs_0_io_replay_bits_sdq_id; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_valid = mshrs_1_io_replay_valid; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_uopc = mshrs_1_io_replay_bits_uop_uopc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_inst = mshrs_1_io_replay_bits_uop_inst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_debug_inst = mshrs_1_io_replay_bits_uop_debug_inst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_is_rvc = mshrs_1_io_replay_bits_uop_is_rvc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_debug_pc = mshrs_1_io_replay_bits_uop_debug_pc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_iq_type = mshrs_1_io_replay_bits_uop_iq_type; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_fu_code = mshrs_1_io_replay_bits_uop_fu_code; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ctrl_br_type = mshrs_1_io_replay_bits_uop_ctrl_br_type; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ctrl_op1_sel = mshrs_1_io_replay_bits_uop_ctrl_op1_sel; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ctrl_op2_sel = mshrs_1_io_replay_bits_uop_ctrl_op2_sel; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ctrl_imm_sel = mshrs_1_io_replay_bits_uop_ctrl_imm_sel; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ctrl_op_fcn = mshrs_1_io_replay_bits_uop_ctrl_op_fcn; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ctrl_fcn_dw = mshrs_1_io_replay_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ctrl_csr_cmd = mshrs_1_io_replay_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ctrl_is_load = mshrs_1_io_replay_bits_uop_ctrl_is_load; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ctrl_is_sta = mshrs_1_io_replay_bits_uop_ctrl_is_sta; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ctrl_is_std = mshrs_1_io_replay_bits_uop_ctrl_is_std; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_iw_state = mshrs_1_io_replay_bits_uop_iw_state; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_iw_p1_poisoned = mshrs_1_io_replay_bits_uop_iw_p1_poisoned; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_iw_p2_poisoned = mshrs_1_io_replay_bits_uop_iw_p2_poisoned; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_is_br = mshrs_1_io_replay_bits_uop_is_br; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_is_jalr = mshrs_1_io_replay_bits_uop_is_jalr; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_is_jal = mshrs_1_io_replay_bits_uop_is_jal; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_is_sfb = mshrs_1_io_replay_bits_uop_is_sfb; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_br_mask = mshrs_1_io_replay_bits_uop_br_mask; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_br_tag = mshrs_1_io_replay_bits_uop_br_tag; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ftq_idx = mshrs_1_io_replay_bits_uop_ftq_idx; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_edge_inst = mshrs_1_io_replay_bits_uop_edge_inst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_pc_lob = mshrs_1_io_replay_bits_uop_pc_lob; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_taken = mshrs_1_io_replay_bits_uop_taken; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_imm_packed = mshrs_1_io_replay_bits_uop_imm_packed; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_csr_addr = mshrs_1_io_replay_bits_uop_csr_addr; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_rob_idx = mshrs_1_io_replay_bits_uop_rob_idx; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ldq_idx = mshrs_1_io_replay_bits_uop_ldq_idx; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_stq_idx = mshrs_1_io_replay_bits_uop_stq_idx; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_rxq_idx = mshrs_1_io_replay_bits_uop_rxq_idx; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_pdst = mshrs_1_io_replay_bits_uop_pdst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_prs1 = mshrs_1_io_replay_bits_uop_prs1; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_prs2 = mshrs_1_io_replay_bits_uop_prs2; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_prs3 = mshrs_1_io_replay_bits_uop_prs3; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ppred = mshrs_1_io_replay_bits_uop_ppred; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_prs1_busy = mshrs_1_io_replay_bits_uop_prs1_busy; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_prs2_busy = mshrs_1_io_replay_bits_uop_prs2_busy; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_prs3_busy = mshrs_1_io_replay_bits_uop_prs3_busy; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ppred_busy = mshrs_1_io_replay_bits_uop_ppred_busy; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_stale_pdst = mshrs_1_io_replay_bits_uop_stale_pdst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_exception = mshrs_1_io_replay_bits_uop_exception; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_exc_cause = mshrs_1_io_replay_bits_uop_exc_cause; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_bypassable = mshrs_1_io_replay_bits_uop_bypassable; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_mem_cmd = mshrs_1_io_replay_bits_uop_mem_cmd; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_mem_size = mshrs_1_io_replay_bits_uop_mem_size; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_mem_signed = mshrs_1_io_replay_bits_uop_mem_signed; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_is_fence = mshrs_1_io_replay_bits_uop_is_fence; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_is_fencei = mshrs_1_io_replay_bits_uop_is_fencei; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_is_amo = mshrs_1_io_replay_bits_uop_is_amo; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_uses_ldq = mshrs_1_io_replay_bits_uop_uses_ldq; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_uses_stq = mshrs_1_io_replay_bits_uop_uses_stq; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_is_sys_pc2epc = mshrs_1_io_replay_bits_uop_is_sys_pc2epc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_is_unique = mshrs_1_io_replay_bits_uop_is_unique; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_flush_on_commit = mshrs_1_io_replay_bits_uop_flush_on_commit; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ldst_is_rs1 = mshrs_1_io_replay_bits_uop_ldst_is_rs1; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ldst = mshrs_1_io_replay_bits_uop_ldst; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_lrs1 = mshrs_1_io_replay_bits_uop_lrs1; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_lrs2 = mshrs_1_io_replay_bits_uop_lrs2; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_lrs3 = mshrs_1_io_replay_bits_uop_lrs3; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_ldst_val = mshrs_1_io_replay_bits_uop_ldst_val; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_dst_rtype = mshrs_1_io_replay_bits_uop_dst_rtype; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_lrs1_rtype = mshrs_1_io_replay_bits_uop_lrs1_rtype; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_lrs2_rtype = mshrs_1_io_replay_bits_uop_lrs2_rtype; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_frs3_en = mshrs_1_io_replay_bits_uop_frs3_en; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_fp_val = mshrs_1_io_replay_bits_uop_fp_val; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_fp_single = mshrs_1_io_replay_bits_uop_fp_single; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_xcpt_pf_if = mshrs_1_io_replay_bits_uop_xcpt_pf_if; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_xcpt_ae_if = mshrs_1_io_replay_bits_uop_xcpt_ae_if; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_xcpt_ma_if = mshrs_1_io_replay_bits_uop_xcpt_ma_if; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_bp_debug_if = mshrs_1_io_replay_bits_uop_bp_debug_if; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_bp_xcpt_if = mshrs_1_io_replay_bits_uop_bp_xcpt_if; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_debug_fsrc = mshrs_1_io_replay_bits_uop_debug_fsrc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_uop_debug_tsrc = mshrs_1_io_replay_bits_uop_debug_tsrc; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_addr = mshrs_1_io_replay_bits_addr; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_data = mshrs_1_io_replay_bits_data; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_is_hella = mshrs_1_io_replay_bits_is_hella; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_tag_match = mshrs_1_io_replay_bits_tag_match; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_old_meta_coh_state = mshrs_1_io_replay_bits_old_meta_coh_state; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_old_meta_tag = mshrs_1_io_replay_bits_old_meta_tag; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_way_en = mshrs_1_io_replay_bits_way_en; // @[mshrs.scala 660:29]
  assign replay_arb_io_in_1_bits_sdq_id = mshrs_1_io_replay_bits_sdq_id; // @[mshrs.scala 660:29]
  assign replay_arb_io_out_ready = io_replay_ready; // @[mshrs.scala 753:13]
  assign resp_arb_clock = clock;
  assign resp_arb_reset = reset;
  assign resp_arb_io_in_0_valid = mshrs_0_io_resp_valid; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_uopc = mshrs_0_io_resp_bits_uop_uopc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_inst = mshrs_0_io_resp_bits_uop_inst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_debug_inst = mshrs_0_io_resp_bits_uop_debug_inst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_is_rvc = mshrs_0_io_resp_bits_uop_is_rvc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_debug_pc = mshrs_0_io_resp_bits_uop_debug_pc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_iq_type = mshrs_0_io_resp_bits_uop_iq_type; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_fu_code = mshrs_0_io_resp_bits_uop_fu_code; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ctrl_br_type = mshrs_0_io_resp_bits_uop_ctrl_br_type; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ctrl_op1_sel = mshrs_0_io_resp_bits_uop_ctrl_op1_sel; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ctrl_op2_sel = mshrs_0_io_resp_bits_uop_ctrl_op2_sel; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ctrl_imm_sel = mshrs_0_io_resp_bits_uop_ctrl_imm_sel; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ctrl_op_fcn = mshrs_0_io_resp_bits_uop_ctrl_op_fcn; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ctrl_fcn_dw = mshrs_0_io_resp_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ctrl_csr_cmd = mshrs_0_io_resp_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ctrl_is_load = mshrs_0_io_resp_bits_uop_ctrl_is_load; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ctrl_is_sta = mshrs_0_io_resp_bits_uop_ctrl_is_sta; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ctrl_is_std = mshrs_0_io_resp_bits_uop_ctrl_is_std; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_iw_state = mshrs_0_io_resp_bits_uop_iw_state; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_iw_p1_poisoned = mshrs_0_io_resp_bits_uop_iw_p1_poisoned; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_iw_p2_poisoned = mshrs_0_io_resp_bits_uop_iw_p2_poisoned; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_is_br = mshrs_0_io_resp_bits_uop_is_br; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_is_jalr = mshrs_0_io_resp_bits_uop_is_jalr; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_is_jal = mshrs_0_io_resp_bits_uop_is_jal; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_is_sfb = mshrs_0_io_resp_bits_uop_is_sfb; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_br_mask = mshrs_0_io_resp_bits_uop_br_mask; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_br_tag = mshrs_0_io_resp_bits_uop_br_tag; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ftq_idx = mshrs_0_io_resp_bits_uop_ftq_idx; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_edge_inst = mshrs_0_io_resp_bits_uop_edge_inst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_pc_lob = mshrs_0_io_resp_bits_uop_pc_lob; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_taken = mshrs_0_io_resp_bits_uop_taken; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_imm_packed = mshrs_0_io_resp_bits_uop_imm_packed; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_csr_addr = mshrs_0_io_resp_bits_uop_csr_addr; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_rob_idx = mshrs_0_io_resp_bits_uop_rob_idx; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ldq_idx = mshrs_0_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_stq_idx = mshrs_0_io_resp_bits_uop_stq_idx; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_rxq_idx = mshrs_0_io_resp_bits_uop_rxq_idx; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_pdst = mshrs_0_io_resp_bits_uop_pdst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_prs1 = mshrs_0_io_resp_bits_uop_prs1; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_prs2 = mshrs_0_io_resp_bits_uop_prs2; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_prs3 = mshrs_0_io_resp_bits_uop_prs3; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ppred = mshrs_0_io_resp_bits_uop_ppred; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_prs1_busy = mshrs_0_io_resp_bits_uop_prs1_busy; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_prs2_busy = mshrs_0_io_resp_bits_uop_prs2_busy; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_prs3_busy = mshrs_0_io_resp_bits_uop_prs3_busy; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ppred_busy = mshrs_0_io_resp_bits_uop_ppred_busy; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_stale_pdst = mshrs_0_io_resp_bits_uop_stale_pdst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_exception = mshrs_0_io_resp_bits_uop_exception; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_exc_cause = mshrs_0_io_resp_bits_uop_exc_cause; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_bypassable = mshrs_0_io_resp_bits_uop_bypassable; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_mem_cmd = mshrs_0_io_resp_bits_uop_mem_cmd; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_mem_size = mshrs_0_io_resp_bits_uop_mem_size; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_mem_signed = mshrs_0_io_resp_bits_uop_mem_signed; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_is_fence = mshrs_0_io_resp_bits_uop_is_fence; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_is_fencei = mshrs_0_io_resp_bits_uop_is_fencei; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_is_amo = mshrs_0_io_resp_bits_uop_is_amo; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_uses_ldq = mshrs_0_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_uses_stq = mshrs_0_io_resp_bits_uop_uses_stq; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_is_sys_pc2epc = mshrs_0_io_resp_bits_uop_is_sys_pc2epc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_is_unique = mshrs_0_io_resp_bits_uop_is_unique; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_flush_on_commit = mshrs_0_io_resp_bits_uop_flush_on_commit; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ldst_is_rs1 = mshrs_0_io_resp_bits_uop_ldst_is_rs1; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ldst = mshrs_0_io_resp_bits_uop_ldst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_lrs1 = mshrs_0_io_resp_bits_uop_lrs1; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_lrs2 = mshrs_0_io_resp_bits_uop_lrs2; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_lrs3 = mshrs_0_io_resp_bits_uop_lrs3; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_ldst_val = mshrs_0_io_resp_bits_uop_ldst_val; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_dst_rtype = mshrs_0_io_resp_bits_uop_dst_rtype; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_lrs1_rtype = mshrs_0_io_resp_bits_uop_lrs1_rtype; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_lrs2_rtype = mshrs_0_io_resp_bits_uop_lrs2_rtype; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_frs3_en = mshrs_0_io_resp_bits_uop_frs3_en; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_fp_val = mshrs_0_io_resp_bits_uop_fp_val; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_fp_single = mshrs_0_io_resp_bits_uop_fp_single; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_xcpt_pf_if = mshrs_0_io_resp_bits_uop_xcpt_pf_if; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_xcpt_ae_if = mshrs_0_io_resp_bits_uop_xcpt_ae_if; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_xcpt_ma_if = mshrs_0_io_resp_bits_uop_xcpt_ma_if; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_bp_debug_if = mshrs_0_io_resp_bits_uop_bp_debug_if; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_bp_xcpt_if = mshrs_0_io_resp_bits_uop_bp_xcpt_if; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_debug_fsrc = mshrs_0_io_resp_bits_uop_debug_fsrc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_uop_debug_tsrc = mshrs_0_io_resp_bits_uop_debug_tsrc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_data = mshrs_0_io_resp_bits_data; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_0_bits_is_hella = mshrs_0_io_resp_bits_is_hella; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_valid = mshrs_1_io_resp_valid; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_uopc = mshrs_1_io_resp_bits_uop_uopc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_inst = mshrs_1_io_resp_bits_uop_inst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_debug_inst = mshrs_1_io_resp_bits_uop_debug_inst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_is_rvc = mshrs_1_io_resp_bits_uop_is_rvc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_debug_pc = mshrs_1_io_resp_bits_uop_debug_pc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_iq_type = mshrs_1_io_resp_bits_uop_iq_type; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_fu_code = mshrs_1_io_resp_bits_uop_fu_code; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ctrl_br_type = mshrs_1_io_resp_bits_uop_ctrl_br_type; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ctrl_op1_sel = mshrs_1_io_resp_bits_uop_ctrl_op1_sel; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ctrl_op2_sel = mshrs_1_io_resp_bits_uop_ctrl_op2_sel; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ctrl_imm_sel = mshrs_1_io_resp_bits_uop_ctrl_imm_sel; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ctrl_op_fcn = mshrs_1_io_resp_bits_uop_ctrl_op_fcn; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ctrl_fcn_dw = mshrs_1_io_resp_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ctrl_csr_cmd = mshrs_1_io_resp_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ctrl_is_load = mshrs_1_io_resp_bits_uop_ctrl_is_load; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ctrl_is_sta = mshrs_1_io_resp_bits_uop_ctrl_is_sta; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ctrl_is_std = mshrs_1_io_resp_bits_uop_ctrl_is_std; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_iw_state = mshrs_1_io_resp_bits_uop_iw_state; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_iw_p1_poisoned = mshrs_1_io_resp_bits_uop_iw_p1_poisoned; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_iw_p2_poisoned = mshrs_1_io_resp_bits_uop_iw_p2_poisoned; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_is_br = mshrs_1_io_resp_bits_uop_is_br; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_is_jalr = mshrs_1_io_resp_bits_uop_is_jalr; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_is_jal = mshrs_1_io_resp_bits_uop_is_jal; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_is_sfb = mshrs_1_io_resp_bits_uop_is_sfb; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_br_mask = mshrs_1_io_resp_bits_uop_br_mask; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_br_tag = mshrs_1_io_resp_bits_uop_br_tag; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ftq_idx = mshrs_1_io_resp_bits_uop_ftq_idx; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_edge_inst = mshrs_1_io_resp_bits_uop_edge_inst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_pc_lob = mshrs_1_io_resp_bits_uop_pc_lob; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_taken = mshrs_1_io_resp_bits_uop_taken; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_imm_packed = mshrs_1_io_resp_bits_uop_imm_packed; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_csr_addr = mshrs_1_io_resp_bits_uop_csr_addr; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_rob_idx = mshrs_1_io_resp_bits_uop_rob_idx; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ldq_idx = mshrs_1_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_stq_idx = mshrs_1_io_resp_bits_uop_stq_idx; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_rxq_idx = mshrs_1_io_resp_bits_uop_rxq_idx; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_pdst = mshrs_1_io_resp_bits_uop_pdst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_prs1 = mshrs_1_io_resp_bits_uop_prs1; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_prs2 = mshrs_1_io_resp_bits_uop_prs2; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_prs3 = mshrs_1_io_resp_bits_uop_prs3; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ppred = mshrs_1_io_resp_bits_uop_ppred; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_prs1_busy = mshrs_1_io_resp_bits_uop_prs1_busy; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_prs2_busy = mshrs_1_io_resp_bits_uop_prs2_busy; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_prs3_busy = mshrs_1_io_resp_bits_uop_prs3_busy; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ppred_busy = mshrs_1_io_resp_bits_uop_ppred_busy; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_stale_pdst = mshrs_1_io_resp_bits_uop_stale_pdst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_exception = mshrs_1_io_resp_bits_uop_exception; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_exc_cause = mshrs_1_io_resp_bits_uop_exc_cause; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_bypassable = mshrs_1_io_resp_bits_uop_bypassable; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_mem_cmd = mshrs_1_io_resp_bits_uop_mem_cmd; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_mem_size = mshrs_1_io_resp_bits_uop_mem_size; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_mem_signed = mshrs_1_io_resp_bits_uop_mem_signed; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_is_fence = mshrs_1_io_resp_bits_uop_is_fence; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_is_fencei = mshrs_1_io_resp_bits_uop_is_fencei; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_is_amo = mshrs_1_io_resp_bits_uop_is_amo; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_uses_ldq = mshrs_1_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_uses_stq = mshrs_1_io_resp_bits_uop_uses_stq; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_is_sys_pc2epc = mshrs_1_io_resp_bits_uop_is_sys_pc2epc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_is_unique = mshrs_1_io_resp_bits_uop_is_unique; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_flush_on_commit = mshrs_1_io_resp_bits_uop_flush_on_commit; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ldst_is_rs1 = mshrs_1_io_resp_bits_uop_ldst_is_rs1; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ldst = mshrs_1_io_resp_bits_uop_ldst; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_lrs1 = mshrs_1_io_resp_bits_uop_lrs1; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_lrs2 = mshrs_1_io_resp_bits_uop_lrs2; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_lrs3 = mshrs_1_io_resp_bits_uop_lrs3; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_ldst_val = mshrs_1_io_resp_bits_uop_ldst_val; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_dst_rtype = mshrs_1_io_resp_bits_uop_dst_rtype; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_lrs1_rtype = mshrs_1_io_resp_bits_uop_lrs1_rtype; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_lrs2_rtype = mshrs_1_io_resp_bits_uop_lrs2_rtype; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_frs3_en = mshrs_1_io_resp_bits_uop_frs3_en; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_fp_val = mshrs_1_io_resp_bits_uop_fp_val; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_fp_single = mshrs_1_io_resp_bits_uop_fp_single; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_xcpt_pf_if = mshrs_1_io_resp_bits_uop_xcpt_pf_if; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_xcpt_ae_if = mshrs_1_io_resp_bits_uop_xcpt_ae_if; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_xcpt_ma_if = mshrs_1_io_resp_bits_uop_xcpt_ma_if; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_bp_debug_if = mshrs_1_io_resp_bits_uop_bp_debug_if; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_bp_xcpt_if = mshrs_1_io_resp_bits_uop_bp_xcpt_if; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_debug_fsrc = mshrs_1_io_resp_bits_uop_debug_fsrc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_uop_debug_tsrc = mshrs_1_io_resp_bits_uop_debug_tsrc; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_data = mshrs_1_io_resp_bits_data; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_1_bits_is_hella = mshrs_1_io_resp_bits_is_hella; // @[mshrs.scala 678:23]
  assign resp_arb_io_in_2_valid = mmios_0_io_resp_valid; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_uopc = mmios_0_io_resp_bits_uop_uopc; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_inst = mmios_0_io_resp_bits_uop_inst; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_debug_inst = mmios_0_io_resp_bits_uop_debug_inst; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_is_rvc = mmios_0_io_resp_bits_uop_is_rvc; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_debug_pc = mmios_0_io_resp_bits_uop_debug_pc; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_iq_type = mmios_0_io_resp_bits_uop_iq_type; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_fu_code = mmios_0_io_resp_bits_uop_fu_code; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ctrl_br_type = mmios_0_io_resp_bits_uop_ctrl_br_type; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ctrl_op1_sel = mmios_0_io_resp_bits_uop_ctrl_op1_sel; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ctrl_op2_sel = mmios_0_io_resp_bits_uop_ctrl_op2_sel; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ctrl_imm_sel = mmios_0_io_resp_bits_uop_ctrl_imm_sel; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ctrl_op_fcn = mmios_0_io_resp_bits_uop_ctrl_op_fcn; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ctrl_fcn_dw = mmios_0_io_resp_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ctrl_csr_cmd = mmios_0_io_resp_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ctrl_is_load = mmios_0_io_resp_bits_uop_ctrl_is_load; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ctrl_is_sta = mmios_0_io_resp_bits_uop_ctrl_is_sta; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ctrl_is_std = mmios_0_io_resp_bits_uop_ctrl_is_std; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_iw_state = mmios_0_io_resp_bits_uop_iw_state; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_iw_p1_poisoned = mmios_0_io_resp_bits_uop_iw_p1_poisoned; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_iw_p2_poisoned = mmios_0_io_resp_bits_uop_iw_p2_poisoned; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_is_br = mmios_0_io_resp_bits_uop_is_br; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_is_jalr = mmios_0_io_resp_bits_uop_is_jalr; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_is_jal = mmios_0_io_resp_bits_uop_is_jal; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_is_sfb = mmios_0_io_resp_bits_uop_is_sfb; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_br_mask = mmios_0_io_resp_bits_uop_br_mask; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_br_tag = mmios_0_io_resp_bits_uop_br_tag; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ftq_idx = mmios_0_io_resp_bits_uop_ftq_idx; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_edge_inst = mmios_0_io_resp_bits_uop_edge_inst; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_pc_lob = mmios_0_io_resp_bits_uop_pc_lob; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_taken = mmios_0_io_resp_bits_uop_taken; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_imm_packed = mmios_0_io_resp_bits_uop_imm_packed; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_csr_addr = mmios_0_io_resp_bits_uop_csr_addr; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_rob_idx = mmios_0_io_resp_bits_uop_rob_idx; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ldq_idx = mmios_0_io_resp_bits_uop_ldq_idx; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_stq_idx = mmios_0_io_resp_bits_uop_stq_idx; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_rxq_idx = mmios_0_io_resp_bits_uop_rxq_idx; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_pdst = mmios_0_io_resp_bits_uop_pdst; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_prs1 = mmios_0_io_resp_bits_uop_prs1; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_prs2 = mmios_0_io_resp_bits_uop_prs2; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_prs3 = mmios_0_io_resp_bits_uop_prs3; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ppred = mmios_0_io_resp_bits_uop_ppred; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_prs1_busy = mmios_0_io_resp_bits_uop_prs1_busy; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_prs2_busy = mmios_0_io_resp_bits_uop_prs2_busy; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_prs3_busy = mmios_0_io_resp_bits_uop_prs3_busy; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ppred_busy = mmios_0_io_resp_bits_uop_ppred_busy; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_stale_pdst = mmios_0_io_resp_bits_uop_stale_pdst; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_exception = mmios_0_io_resp_bits_uop_exception; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_exc_cause = mmios_0_io_resp_bits_uop_exc_cause; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_bypassable = mmios_0_io_resp_bits_uop_bypassable; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_mem_cmd = mmios_0_io_resp_bits_uop_mem_cmd; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_mem_size = mmios_0_io_resp_bits_uop_mem_size; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_mem_signed = mmios_0_io_resp_bits_uop_mem_signed; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_is_fence = mmios_0_io_resp_bits_uop_is_fence; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_is_fencei = mmios_0_io_resp_bits_uop_is_fencei; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_is_amo = mmios_0_io_resp_bits_uop_is_amo; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_uses_ldq = mmios_0_io_resp_bits_uop_uses_ldq; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_uses_stq = mmios_0_io_resp_bits_uop_uses_stq; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_is_sys_pc2epc = mmios_0_io_resp_bits_uop_is_sys_pc2epc; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_is_unique = mmios_0_io_resp_bits_uop_is_unique; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_flush_on_commit = mmios_0_io_resp_bits_uop_flush_on_commit; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ldst_is_rs1 = mmios_0_io_resp_bits_uop_ldst_is_rs1; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ldst = mmios_0_io_resp_bits_uop_ldst; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_lrs1 = mmios_0_io_resp_bits_uop_lrs1; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_lrs2 = mmios_0_io_resp_bits_uop_lrs2; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_lrs3 = mmios_0_io_resp_bits_uop_lrs3; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_ldst_val = mmios_0_io_resp_bits_uop_ldst_val; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_dst_rtype = mmios_0_io_resp_bits_uop_dst_rtype; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_lrs1_rtype = mmios_0_io_resp_bits_uop_lrs1_rtype; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_lrs2_rtype = mmios_0_io_resp_bits_uop_lrs2_rtype; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_frs3_en = mmios_0_io_resp_bits_uop_frs3_en; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_fp_val = mmios_0_io_resp_bits_uop_fp_val; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_fp_single = mmios_0_io_resp_bits_uop_fp_single; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_xcpt_pf_if = mmios_0_io_resp_bits_uop_xcpt_pf_if; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_xcpt_ae_if = mmios_0_io_resp_bits_uop_xcpt_ae_if; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_xcpt_ma_if = mmios_0_io_resp_bits_uop_xcpt_ma_if; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_bp_debug_if = mmios_0_io_resp_bits_uop_bp_debug_if; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_bp_xcpt_if = mmios_0_io_resp_bits_uop_bp_xcpt_if; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_debug_fsrc = mmios_0_io_resp_bits_uop_debug_fsrc; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_uop_debug_tsrc = mmios_0_io_resp_bits_uop_debug_tsrc; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_data = mmios_0_io_resp_bits_data; // @[mshrs.scala 725:36]
  assign resp_arb_io_in_2_bits_is_hella = mmios_0_io_resp_bits_is_hella; // @[mshrs.scala 725:36]
  assign resp_arb_io_out_ready = respq_io_enq_ready; // @[mshrs.scala 740:21]
  assign refill_arb_clock = clock;
  assign refill_arb_reset = reset;
  assign refill_arb_io_in_0_valid = mshrs_0_io_refill_valid; // @[mshrs.scala 661:29]
  assign refill_arb_io_in_0_bits_way_en = mshrs_0_io_refill_bits_way_en; // @[mshrs.scala 661:29]
  assign refill_arb_io_in_0_bits_addr = mshrs_0_io_refill_bits_addr; // @[mshrs.scala 661:29]
  assign refill_arb_io_in_0_bits_wmask = mshrs_0_io_refill_bits_wmask; // @[mshrs.scala 661:29]
  assign refill_arb_io_in_0_bits_data = mshrs_0_io_refill_bits_data; // @[mshrs.scala 661:29]
  assign refill_arb_io_in_1_valid = mshrs_1_io_refill_valid; // @[mshrs.scala 661:29]
  assign refill_arb_io_in_1_bits_way_en = mshrs_1_io_refill_bits_way_en; // @[mshrs.scala 661:29]
  assign refill_arb_io_in_1_bits_addr = mshrs_1_io_refill_bits_addr; // @[mshrs.scala 661:29]
  assign refill_arb_io_in_1_bits_wmask = mshrs_1_io_refill_bits_wmask; // @[mshrs.scala 661:29]
  assign refill_arb_io_in_1_bits_data = mshrs_1_io_refill_bits_data; // @[mshrs.scala 661:29]
  assign refill_arb_io_out_ready = io_refill_ready; // @[mshrs.scala 749:21]
  assign mshrs_0_clock = clock;
  assign mshrs_0_reset = reset;
  assign mshrs_0_io_id = 1'h0; // @[mshrs.scala 621:16]
  assign mshrs_0_io_req_pri_val = ~REG & pri_val; // @[mshrs.scala 632:54]
  assign mshrs_0_io_req_sec_val = _T_125 & tag_match_0 & idx_matches_0_0 & cacheable; // @[mshrs.scala 637:99]
  assign mshrs_0_io_clear_prefetch = _T_149 | _T_150; // @[mshrs.scala 645:82]
  assign mshrs_0_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[mshrs.scala 647:28]
  assign mshrs_0_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[mshrs.scala 647:28]
  assign mshrs_0_io_exception = io_exception; // @[mshrs.scala 648:26]
  assign mshrs_0_io_rob_pnr_idx = io_rob_pnr_idx; // @[mshrs.scala 649:26]
  assign mshrs_0_io_rob_head_idx = io_rob_head_idx; // @[mshrs.scala 650:26]
  assign mshrs_0_io_req_uop_uopc = io_req_0_bits_uop_uopc; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_inst = io_req_0_bits_uop_inst; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_debug_inst = io_req_0_bits_uop_debug_inst; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_is_rvc = io_req_0_bits_uop_is_rvc; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_debug_pc = io_req_0_bits_uop_debug_pc; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_iq_type = io_req_0_bits_uop_iq_type; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_fu_code = io_req_0_bits_uop_fu_code; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ctrl_br_type = io_req_0_bits_uop_ctrl_br_type; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ctrl_op1_sel = io_req_0_bits_uop_ctrl_op1_sel; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ctrl_op2_sel = io_req_0_bits_uop_ctrl_op2_sel; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ctrl_imm_sel = io_req_0_bits_uop_ctrl_imm_sel; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ctrl_op_fcn = io_req_0_bits_uop_ctrl_op_fcn; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ctrl_fcn_dw = io_req_0_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ctrl_csr_cmd = io_req_0_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ctrl_is_load = io_req_0_bits_uop_ctrl_is_load; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ctrl_is_sta = io_req_0_bits_uop_ctrl_is_sta; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ctrl_is_std = io_req_0_bits_uop_ctrl_is_std; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_iw_state = io_req_0_bits_uop_iw_state; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_iw_p1_poisoned = io_req_0_bits_uop_iw_p1_poisoned; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_iw_p2_poisoned = io_req_0_bits_uop_iw_p2_poisoned; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_is_br = io_req_0_bits_uop_is_br; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_is_jalr = io_req_0_bits_uop_is_jalr; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_is_jal = io_req_0_bits_uop_is_jal; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_is_sfb = io_req_0_bits_uop_is_sfb; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_br_mask = io_req_0_bits_uop_br_mask; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_br_tag = io_req_0_bits_uop_br_tag; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ftq_idx = io_req_0_bits_uop_ftq_idx; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_edge_inst = io_req_0_bits_uop_edge_inst; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_pc_lob = io_req_0_bits_uop_pc_lob; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_taken = io_req_0_bits_uop_taken; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_imm_packed = io_req_0_bits_uop_imm_packed; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_csr_addr = io_req_0_bits_uop_csr_addr; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_rob_idx = io_req_0_bits_uop_rob_idx; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ldq_idx = io_req_0_bits_uop_ldq_idx; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_stq_idx = io_req_0_bits_uop_stq_idx; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_rxq_idx = io_req_0_bits_uop_rxq_idx; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_pdst = io_req_0_bits_uop_pdst; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_prs1 = io_req_0_bits_uop_prs1; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_prs2 = io_req_0_bits_uop_prs2; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_prs3 = io_req_0_bits_uop_prs3; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ppred = io_req_0_bits_uop_ppred; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_prs1_busy = io_req_0_bits_uop_prs1_busy; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_prs2_busy = io_req_0_bits_uop_prs2_busy; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_prs3_busy = io_req_0_bits_uop_prs3_busy; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ppred_busy = io_req_0_bits_uop_ppred_busy; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_stale_pdst = io_req_0_bits_uop_stale_pdst; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_exception = io_req_0_bits_uop_exception; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_exc_cause = io_req_0_bits_uop_exc_cause; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_bypassable = io_req_0_bits_uop_bypassable; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_mem_cmd = io_req_0_bits_uop_mem_cmd; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_mem_size = io_req_0_bits_uop_mem_size; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_mem_signed = io_req_0_bits_uop_mem_signed; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_is_fence = io_req_0_bits_uop_is_fence; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_is_fencei = io_req_0_bits_uop_is_fencei; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_is_amo = io_req_0_bits_uop_is_amo; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_uses_ldq = io_req_0_bits_uop_uses_ldq; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_uses_stq = io_req_0_bits_uop_uses_stq; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_is_sys_pc2epc = io_req_0_bits_uop_is_sys_pc2epc; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_is_unique = io_req_0_bits_uop_is_unique; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_flush_on_commit = io_req_0_bits_uop_flush_on_commit; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ldst_is_rs1 = io_req_0_bits_uop_ldst_is_rs1; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ldst = io_req_0_bits_uop_ldst; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_lrs1 = io_req_0_bits_uop_lrs1; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_lrs2 = io_req_0_bits_uop_lrs2; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_lrs3 = io_req_0_bits_uop_lrs3; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_ldst_val = io_req_0_bits_uop_ldst_val; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_dst_rtype = io_req_0_bits_uop_dst_rtype; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_lrs1_rtype = io_req_0_bits_uop_lrs1_rtype; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_lrs2_rtype = io_req_0_bits_uop_lrs2_rtype; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_frs3_en = io_req_0_bits_uop_frs3_en; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_fp_val = io_req_0_bits_uop_fp_val; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_fp_single = io_req_0_bits_uop_fp_single; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_xcpt_pf_if = io_req_0_bits_uop_xcpt_pf_if; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_xcpt_ae_if = io_req_0_bits_uop_xcpt_ae_if; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_xcpt_ma_if = io_req_0_bits_uop_xcpt_ma_if; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_bp_debug_if = io_req_0_bits_uop_bp_debug_if; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_bp_xcpt_if = io_req_0_bits_uop_bp_xcpt_if; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_debug_fsrc = io_req_0_bits_uop_debug_fsrc; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_uop_debug_tsrc = io_req_0_bits_uop_debug_tsrc; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_addr = io_req_0_bits_addr; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_data = io_req_0_bits_data; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_is_hella = io_req_0_bits_is_hella; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_tag_match = io_req_0_bits_tag_match; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_old_meta_coh_state = io_req_0_bits_old_meta_coh_state; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_old_meta_tag = io_req_0_bits_old_meta_tag; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_way_en = io_req_0_bits_way_en; // @[mshrs.scala 638:26]
  assign mshrs_0_io_req_sdq_id = _T_55[0] ? 5'h0 : _T_87; // @[Mux.scala 47:69]
  assign mshrs_0_io_req_is_probe = io_req_is_probe_0; // @[mshrs.scala 639:26]
  assign mshrs_0_io_mem_acquire_ready = io_mem_acquire_ready & allowed__0; // @[Arbiter.scala 123:31]
  assign mshrs_0_io_mem_grant_valid = io_mem_grant_bits_source == 2'h0 & io_mem_grant_valid; // @[mshrs.scala 673:45 mshrs.scala 674:25 mshrs.scala 671:29]
  assign mshrs_0_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_0_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_0_io_mem_grant_bits_size = io_mem_grant_bits_size; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_0_io_mem_grant_bits_source = io_mem_grant_bits_source; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_0_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_0_io_mem_grant_bits_denied = io_mem_grant_bits_denied; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_0_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_0_io_mem_grant_bits_corrupt = io_mem_grant_bits_corrupt; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_0_io_mem_finish_ready = io_mem_finish_ready & allowed_1_0; // @[Arbiter.scala 123:31]
  assign mshrs_0_io_prober_state_valid = io_prober_state_valid; // @[mshrs.scala 652:26]
  assign mshrs_0_io_prober_state_bits = io_prober_state_bits; // @[mshrs.scala 652:26]
  assign mshrs_0_io_refill_ready = refill_arb_io_in_0_ready; // @[mshrs.scala 661:29]
  assign mshrs_0_io_meta_write_ready = meta_write_arb_io_in_0_ready; // @[mshrs.scala 656:29]
  assign mshrs_0_io_meta_read_ready = meta_read_arb_io_in_0_ready; // @[mshrs.scala 657:29]
  assign mshrs_0_io_meta_resp_valid = io_meta_resp_valid; // @[mshrs.scala 658:29]
  assign mshrs_0_io_meta_resp_bits_coh_state = io_meta_resp_bits_coh_state; // @[mshrs.scala 658:29]
  assign mshrs_0_io_meta_resp_bits_tag = io_meta_resp_bits_tag; // @[mshrs.scala 658:29]
  assign mshrs_0_io_wb_req_ready = wb_req_arb_io_in_0_ready; // @[mshrs.scala 659:29]
  assign mshrs_0_io_lb_read_ready = lb_read_arb_io_in_0_ready; // @[mshrs.scala 663:32]
  assign mshrs_0_io_lb_resp = _T_114 ? 64'h0 : _GEN_8; // @[mshrs.scala 576:37]
  assign mshrs_0_io_lb_write_ready = lb_write_arb_io_in_0_ready; // @[mshrs.scala 665:32]
  assign mshrs_0_io_replay_ready = replay_arb_io_in_0_ready; // @[mshrs.scala 660:29]
  assign mshrs_0_io_resp_ready = resp_arb_io_in_0_ready; // @[mshrs.scala 678:23]
  assign mshrs_0_io_wb_resp = io_wb_resp; // @[mshrs.scala 654:26]
  assign mshrs_1_clock = clock;
  assign mshrs_1_reset = reset;
  assign mshrs_1_io_id = 1'h1; // @[mshrs.scala 621:16]
  assign mshrs_1_io_req_pri_val = REG & pri_val; // @[mshrs.scala 632:54]
  assign mshrs_1_io_req_sec_val = _T_125 & tag_match_0 & idx_matches_0_1 & cacheable; // @[mshrs.scala 637:99]
  assign mshrs_1_io_clear_prefetch = _T_180 | _T_181; // @[mshrs.scala 645:82]
  assign mshrs_1_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[mshrs.scala 647:28]
  assign mshrs_1_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[mshrs.scala 647:28]
  assign mshrs_1_io_exception = io_exception; // @[mshrs.scala 648:26]
  assign mshrs_1_io_rob_pnr_idx = io_rob_pnr_idx; // @[mshrs.scala 649:26]
  assign mshrs_1_io_rob_head_idx = io_rob_head_idx; // @[mshrs.scala 650:26]
  assign mshrs_1_io_req_uop_uopc = io_req_0_bits_uop_uopc; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_inst = io_req_0_bits_uop_inst; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_debug_inst = io_req_0_bits_uop_debug_inst; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_is_rvc = io_req_0_bits_uop_is_rvc; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_debug_pc = io_req_0_bits_uop_debug_pc; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_iq_type = io_req_0_bits_uop_iq_type; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_fu_code = io_req_0_bits_uop_fu_code; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ctrl_br_type = io_req_0_bits_uop_ctrl_br_type; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ctrl_op1_sel = io_req_0_bits_uop_ctrl_op1_sel; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ctrl_op2_sel = io_req_0_bits_uop_ctrl_op2_sel; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ctrl_imm_sel = io_req_0_bits_uop_ctrl_imm_sel; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ctrl_op_fcn = io_req_0_bits_uop_ctrl_op_fcn; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ctrl_fcn_dw = io_req_0_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ctrl_csr_cmd = io_req_0_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ctrl_is_load = io_req_0_bits_uop_ctrl_is_load; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ctrl_is_sta = io_req_0_bits_uop_ctrl_is_sta; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ctrl_is_std = io_req_0_bits_uop_ctrl_is_std; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_iw_state = io_req_0_bits_uop_iw_state; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_iw_p1_poisoned = io_req_0_bits_uop_iw_p1_poisoned; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_iw_p2_poisoned = io_req_0_bits_uop_iw_p2_poisoned; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_is_br = io_req_0_bits_uop_is_br; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_is_jalr = io_req_0_bits_uop_is_jalr; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_is_jal = io_req_0_bits_uop_is_jal; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_is_sfb = io_req_0_bits_uop_is_sfb; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_br_mask = io_req_0_bits_uop_br_mask; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_br_tag = io_req_0_bits_uop_br_tag; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ftq_idx = io_req_0_bits_uop_ftq_idx; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_edge_inst = io_req_0_bits_uop_edge_inst; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_pc_lob = io_req_0_bits_uop_pc_lob; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_taken = io_req_0_bits_uop_taken; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_imm_packed = io_req_0_bits_uop_imm_packed; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_csr_addr = io_req_0_bits_uop_csr_addr; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_rob_idx = io_req_0_bits_uop_rob_idx; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ldq_idx = io_req_0_bits_uop_ldq_idx; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_stq_idx = io_req_0_bits_uop_stq_idx; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_rxq_idx = io_req_0_bits_uop_rxq_idx; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_pdst = io_req_0_bits_uop_pdst; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_prs1 = io_req_0_bits_uop_prs1; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_prs2 = io_req_0_bits_uop_prs2; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_prs3 = io_req_0_bits_uop_prs3; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ppred = io_req_0_bits_uop_ppred; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_prs1_busy = io_req_0_bits_uop_prs1_busy; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_prs2_busy = io_req_0_bits_uop_prs2_busy; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_prs3_busy = io_req_0_bits_uop_prs3_busy; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ppred_busy = io_req_0_bits_uop_ppred_busy; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_stale_pdst = io_req_0_bits_uop_stale_pdst; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_exception = io_req_0_bits_uop_exception; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_exc_cause = io_req_0_bits_uop_exc_cause; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_bypassable = io_req_0_bits_uop_bypassable; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_mem_cmd = io_req_0_bits_uop_mem_cmd; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_mem_size = io_req_0_bits_uop_mem_size; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_mem_signed = io_req_0_bits_uop_mem_signed; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_is_fence = io_req_0_bits_uop_is_fence; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_is_fencei = io_req_0_bits_uop_is_fencei; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_is_amo = io_req_0_bits_uop_is_amo; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_uses_ldq = io_req_0_bits_uop_uses_ldq; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_uses_stq = io_req_0_bits_uop_uses_stq; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_is_sys_pc2epc = io_req_0_bits_uop_is_sys_pc2epc; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_is_unique = io_req_0_bits_uop_is_unique; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_flush_on_commit = io_req_0_bits_uop_flush_on_commit; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ldst_is_rs1 = io_req_0_bits_uop_ldst_is_rs1; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ldst = io_req_0_bits_uop_ldst; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_lrs1 = io_req_0_bits_uop_lrs1; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_lrs2 = io_req_0_bits_uop_lrs2; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_lrs3 = io_req_0_bits_uop_lrs3; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_ldst_val = io_req_0_bits_uop_ldst_val; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_dst_rtype = io_req_0_bits_uop_dst_rtype; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_lrs1_rtype = io_req_0_bits_uop_lrs1_rtype; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_lrs2_rtype = io_req_0_bits_uop_lrs2_rtype; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_frs3_en = io_req_0_bits_uop_frs3_en; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_fp_val = io_req_0_bits_uop_fp_val; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_fp_single = io_req_0_bits_uop_fp_single; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_xcpt_pf_if = io_req_0_bits_uop_xcpt_pf_if; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_xcpt_ae_if = io_req_0_bits_uop_xcpt_ae_if; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_xcpt_ma_if = io_req_0_bits_uop_xcpt_ma_if; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_bp_debug_if = io_req_0_bits_uop_bp_debug_if; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_bp_xcpt_if = io_req_0_bits_uop_bp_xcpt_if; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_debug_fsrc = io_req_0_bits_uop_debug_fsrc; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_uop_debug_tsrc = io_req_0_bits_uop_debug_tsrc; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_addr = io_req_0_bits_addr; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_data = io_req_0_bits_data; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_is_hella = io_req_0_bits_is_hella; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_tag_match = io_req_0_bits_tag_match; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_old_meta_coh_state = io_req_0_bits_old_meta_coh_state; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_old_meta_tag = io_req_0_bits_old_meta_tag; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_way_en = io_req_0_bits_way_en; // @[mshrs.scala 638:26]
  assign mshrs_1_io_req_sdq_id = _T_55[0] ? 5'h0 : _T_87; // @[Mux.scala 47:69]
  assign mshrs_1_io_req_is_probe = io_req_is_probe_0; // @[mshrs.scala 639:26]
  assign mshrs_1_io_mem_acquire_ready = io_mem_acquire_ready & allowed__1; // @[Arbiter.scala 123:31]
  assign mshrs_1_io_mem_grant_valid = io_mem_grant_bits_source == 2'h1 & io_mem_grant_valid; // @[mshrs.scala 673:45 mshrs.scala 674:25 mshrs.scala 671:29]
  assign mshrs_1_io_mem_grant_bits_opcode = io_mem_grant_bits_opcode; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_1_io_mem_grant_bits_param = io_mem_grant_bits_param; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_1_io_mem_grant_bits_size = io_mem_grant_bits_size; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_1_io_mem_grant_bits_source = io_mem_grant_bits_source; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_1_io_mem_grant_bits_sink = io_mem_grant_bits_sink; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_1_io_mem_grant_bits_denied = io_mem_grant_bits_denied; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_1_io_mem_grant_bits_data = io_mem_grant_bits_data; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_1_io_mem_grant_bits_corrupt = io_mem_grant_bits_corrupt; // @[mshrs.scala 673:45 mshrs.scala 674:25]
  assign mshrs_1_io_mem_finish_ready = io_mem_finish_ready & allowed_1_1; // @[Arbiter.scala 123:31]
  assign mshrs_1_io_prober_state_valid = io_prober_state_valid; // @[mshrs.scala 652:26]
  assign mshrs_1_io_prober_state_bits = io_prober_state_bits; // @[mshrs.scala 652:26]
  assign mshrs_1_io_refill_ready = refill_arb_io_in_1_ready; // @[mshrs.scala 661:29]
  assign mshrs_1_io_meta_write_ready = meta_write_arb_io_in_1_ready; // @[mshrs.scala 656:29]
  assign mshrs_1_io_meta_read_ready = meta_read_arb_io_in_1_ready; // @[mshrs.scala 657:29]
  assign mshrs_1_io_meta_resp_valid = io_meta_resp_valid; // @[mshrs.scala 658:29]
  assign mshrs_1_io_meta_resp_bits_coh_state = io_meta_resp_bits_coh_state; // @[mshrs.scala 658:29]
  assign mshrs_1_io_meta_resp_bits_tag = io_meta_resp_bits_tag; // @[mshrs.scala 658:29]
  assign mshrs_1_io_wb_req_ready = wb_req_arb_io_in_1_ready; // @[mshrs.scala 659:29]
  assign mshrs_1_io_lb_read_ready = lb_read_arb_io_in_1_ready; // @[mshrs.scala 663:32]
  assign mshrs_1_io_lb_resp = _T_114 ? 64'h0 : _GEN_8; // @[mshrs.scala 576:37]
  assign mshrs_1_io_lb_write_ready = lb_write_arb_io_in_1_ready; // @[mshrs.scala 665:32]
  assign mshrs_1_io_replay_ready = replay_arb_io_in_1_ready; // @[mshrs.scala 660:29]
  assign mshrs_1_io_resp_ready = resp_arb_io_in_1_ready; // @[mshrs.scala 678:23]
  assign mshrs_1_io_wb_resp = io_wb_resp; // @[mshrs.scala 654:26]
  assign mmio_alloc_arb_clock = clock;
  assign mmio_alloc_arb_reset = reset;
  assign mmio_alloc_arb_io_in_0_valid = mmios_0_io_req_ready; // @[mshrs.scala 712:35]
  assign mmio_alloc_arb_io_in_0_bits = 1'h0;
  assign mmio_alloc_arb_io_out_ready = io_req_0_valid & ~cacheable; // @[mshrs.scala 732:44]
  assign mmios_0_clock = clock;
  assign mmios_0_reset = reset;
  assign mmios_0_io_req_valid = mmio_alloc_arb_io_in_0_ready; // @[mshrs.scala 714:23]
  assign mmios_0_io_req_bits_uop_uopc = io_req_0_bits_uop_uopc; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_inst = io_req_0_bits_uop_inst; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_debug_inst = io_req_0_bits_uop_debug_inst; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_is_rvc = io_req_0_bits_uop_is_rvc; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_debug_pc = io_req_0_bits_uop_debug_pc; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_iq_type = io_req_0_bits_uop_iq_type; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_fu_code = io_req_0_bits_uop_fu_code; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ctrl_br_type = io_req_0_bits_uop_ctrl_br_type; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ctrl_op1_sel = io_req_0_bits_uop_ctrl_op1_sel; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ctrl_op2_sel = io_req_0_bits_uop_ctrl_op2_sel; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ctrl_imm_sel = io_req_0_bits_uop_ctrl_imm_sel; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ctrl_op_fcn = io_req_0_bits_uop_ctrl_op_fcn; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ctrl_fcn_dw = io_req_0_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ctrl_csr_cmd = io_req_0_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ctrl_is_load = io_req_0_bits_uop_ctrl_is_load; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ctrl_is_sta = io_req_0_bits_uop_ctrl_is_sta; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ctrl_is_std = io_req_0_bits_uop_ctrl_is_std; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_iw_state = io_req_0_bits_uop_iw_state; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_iw_p1_poisoned = io_req_0_bits_uop_iw_p1_poisoned; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_iw_p2_poisoned = io_req_0_bits_uop_iw_p2_poisoned; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_is_br = io_req_0_bits_uop_is_br; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_is_jalr = io_req_0_bits_uop_is_jalr; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_is_jal = io_req_0_bits_uop_is_jal; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_is_sfb = io_req_0_bits_uop_is_sfb; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_br_mask = io_req_0_bits_uop_br_mask; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_br_tag = io_req_0_bits_uop_br_tag; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ftq_idx = io_req_0_bits_uop_ftq_idx; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_edge_inst = io_req_0_bits_uop_edge_inst; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_pc_lob = io_req_0_bits_uop_pc_lob; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_taken = io_req_0_bits_uop_taken; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_imm_packed = io_req_0_bits_uop_imm_packed; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_csr_addr = io_req_0_bits_uop_csr_addr; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_rob_idx = io_req_0_bits_uop_rob_idx; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ldq_idx = io_req_0_bits_uop_ldq_idx; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_stq_idx = io_req_0_bits_uop_stq_idx; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_rxq_idx = io_req_0_bits_uop_rxq_idx; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_pdst = io_req_0_bits_uop_pdst; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_prs1 = io_req_0_bits_uop_prs1; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_prs2 = io_req_0_bits_uop_prs2; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_prs3 = io_req_0_bits_uop_prs3; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ppred = io_req_0_bits_uop_ppred; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_prs1_busy = io_req_0_bits_uop_prs1_busy; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_prs2_busy = io_req_0_bits_uop_prs2_busy; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_prs3_busy = io_req_0_bits_uop_prs3_busy; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ppred_busy = io_req_0_bits_uop_ppred_busy; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_stale_pdst = io_req_0_bits_uop_stale_pdst; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_exception = io_req_0_bits_uop_exception; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_exc_cause = io_req_0_bits_uop_exc_cause; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_bypassable = io_req_0_bits_uop_bypassable; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_mem_cmd = io_req_0_bits_uop_mem_cmd; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_mem_size = io_req_0_bits_uop_mem_size; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_mem_signed = io_req_0_bits_uop_mem_signed; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_is_fence = io_req_0_bits_uop_is_fence; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_is_fencei = io_req_0_bits_uop_is_fencei; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_is_amo = io_req_0_bits_uop_is_amo; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_uses_ldq = io_req_0_bits_uop_uses_ldq; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_uses_stq = io_req_0_bits_uop_uses_stq; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_is_sys_pc2epc = io_req_0_bits_uop_is_sys_pc2epc; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_is_unique = io_req_0_bits_uop_is_unique; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_flush_on_commit = io_req_0_bits_uop_flush_on_commit; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ldst_is_rs1 = io_req_0_bits_uop_ldst_is_rs1; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ldst = io_req_0_bits_uop_ldst; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_lrs1 = io_req_0_bits_uop_lrs1; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_lrs2 = io_req_0_bits_uop_lrs2; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_lrs3 = io_req_0_bits_uop_lrs3; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_ldst_val = io_req_0_bits_uop_ldst_val; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_dst_rtype = io_req_0_bits_uop_dst_rtype; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_lrs1_rtype = io_req_0_bits_uop_lrs1_rtype; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_lrs2_rtype = io_req_0_bits_uop_lrs2_rtype; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_frs3_en = io_req_0_bits_uop_frs3_en; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_fp_val = io_req_0_bits_uop_fp_val; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_fp_single = io_req_0_bits_uop_fp_single; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_xcpt_pf_if = io_req_0_bits_uop_xcpt_pf_if; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_xcpt_ae_if = io_req_0_bits_uop_xcpt_ae_if; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_xcpt_ma_if = io_req_0_bits_uop_xcpt_ma_if; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_bp_debug_if = io_req_0_bits_uop_bp_debug_if; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_bp_xcpt_if = io_req_0_bits_uop_bp_xcpt_if; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_debug_fsrc = io_req_0_bits_uop_debug_fsrc; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_uop_debug_tsrc = io_req_0_bits_uop_debug_tsrc; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_addr = io_req_0_bits_addr; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_data = io_req_0_bits_data; // @[mshrs.scala 715:23]
  assign mmios_0_io_req_bits_is_hella = io_req_0_bits_is_hella; // @[mshrs.scala 715:23]
  assign mmios_0_io_resp_ready = resp_arb_io_in_2_ready; // @[mshrs.scala 725:36]
  assign mmios_0_io_mem_access_ready = io_mem_acquire_ready & allowed__2; // @[Arbiter.scala 123:31]
  assign mmios_0_io_mem_ack_valid = io_mem_grant_valid & io_mem_grant_bits_source == 2'h3; // @[mshrs.scala 720:49]
  assign mmios_0_io_mem_ack_bits_opcode = io_mem_grant_bits_opcode; // @[mshrs.scala 719:27]
  assign mmios_0_io_mem_ack_bits_param = io_mem_grant_bits_param; // @[mshrs.scala 719:27]
  assign mmios_0_io_mem_ack_bits_size = io_mem_grant_bits_size; // @[mshrs.scala 719:27]
  assign mmios_0_io_mem_ack_bits_source = io_mem_grant_bits_source; // @[mshrs.scala 719:27]
  assign mmios_0_io_mem_ack_bits_sink = io_mem_grant_bits_sink; // @[mshrs.scala 719:27]
  assign mmios_0_io_mem_ack_bits_denied = io_mem_grant_bits_denied; // @[mshrs.scala 719:27]
  assign mmios_0_io_mem_ack_bits_data = io_mem_grant_bits_data; // @[mshrs.scala 719:27]
  assign mmios_0_io_mem_ack_bits_corrupt = io_mem_grant_bits_corrupt; // @[mshrs.scala 719:27]
  assign respq_clock = clock;
  assign respq_reset = reset;
  assign respq_io_enq_valid = resp_arb_io_out_valid; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_uopc = resp_arb_io_out_bits_uop_uopc; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_inst = resp_arb_io_out_bits_uop_inst; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_debug_inst = resp_arb_io_out_bits_uop_debug_inst; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_is_rvc = resp_arb_io_out_bits_uop_is_rvc; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_debug_pc = resp_arb_io_out_bits_uop_debug_pc; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_iq_type = resp_arb_io_out_bits_uop_iq_type; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_fu_code = resp_arb_io_out_bits_uop_fu_code; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ctrl_br_type = resp_arb_io_out_bits_uop_ctrl_br_type; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ctrl_op1_sel = resp_arb_io_out_bits_uop_ctrl_op1_sel; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ctrl_op2_sel = resp_arb_io_out_bits_uop_ctrl_op2_sel; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ctrl_imm_sel = resp_arb_io_out_bits_uop_ctrl_imm_sel; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ctrl_op_fcn = resp_arb_io_out_bits_uop_ctrl_op_fcn; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ctrl_fcn_dw = resp_arb_io_out_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ctrl_csr_cmd = resp_arb_io_out_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ctrl_is_load = resp_arb_io_out_bits_uop_ctrl_is_load; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ctrl_is_sta = resp_arb_io_out_bits_uop_ctrl_is_sta; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ctrl_is_std = resp_arb_io_out_bits_uop_ctrl_is_std; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_iw_state = resp_arb_io_out_bits_uop_iw_state; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_iw_p1_poisoned = resp_arb_io_out_bits_uop_iw_p1_poisoned; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_iw_p2_poisoned = resp_arb_io_out_bits_uop_iw_p2_poisoned; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_is_br = resp_arb_io_out_bits_uop_is_br; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_is_jalr = resp_arb_io_out_bits_uop_is_jalr; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_is_jal = resp_arb_io_out_bits_uop_is_jal; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_is_sfb = resp_arb_io_out_bits_uop_is_sfb; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_br_mask = resp_arb_io_out_bits_uop_br_mask; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_br_tag = resp_arb_io_out_bits_uop_br_tag; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ftq_idx = resp_arb_io_out_bits_uop_ftq_idx; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_edge_inst = resp_arb_io_out_bits_uop_edge_inst; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_pc_lob = resp_arb_io_out_bits_uop_pc_lob; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_taken = resp_arb_io_out_bits_uop_taken; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_imm_packed = resp_arb_io_out_bits_uop_imm_packed; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_csr_addr = resp_arb_io_out_bits_uop_csr_addr; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_rob_idx = resp_arb_io_out_bits_uop_rob_idx; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ldq_idx = resp_arb_io_out_bits_uop_ldq_idx; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_stq_idx = resp_arb_io_out_bits_uop_stq_idx; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_rxq_idx = resp_arb_io_out_bits_uop_rxq_idx; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_pdst = resp_arb_io_out_bits_uop_pdst; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_prs1 = resp_arb_io_out_bits_uop_prs1; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_prs2 = resp_arb_io_out_bits_uop_prs2; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_prs3 = resp_arb_io_out_bits_uop_prs3; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ppred = resp_arb_io_out_bits_uop_ppred; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_prs1_busy = resp_arb_io_out_bits_uop_prs1_busy; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_prs2_busy = resp_arb_io_out_bits_uop_prs2_busy; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_prs3_busy = resp_arb_io_out_bits_uop_prs3_busy; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ppred_busy = resp_arb_io_out_bits_uop_ppred_busy; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_stale_pdst = resp_arb_io_out_bits_uop_stale_pdst; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_exception = resp_arb_io_out_bits_uop_exception; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_exc_cause = resp_arb_io_out_bits_uop_exc_cause; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_bypassable = resp_arb_io_out_bits_uop_bypassable; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_mem_cmd = resp_arb_io_out_bits_uop_mem_cmd; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_mem_size = resp_arb_io_out_bits_uop_mem_size; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_mem_signed = resp_arb_io_out_bits_uop_mem_signed; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_is_fence = resp_arb_io_out_bits_uop_is_fence; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_is_fencei = resp_arb_io_out_bits_uop_is_fencei; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_is_amo = resp_arb_io_out_bits_uop_is_amo; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_uses_ldq = resp_arb_io_out_bits_uop_uses_ldq; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_uses_stq = resp_arb_io_out_bits_uop_uses_stq; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_is_sys_pc2epc = resp_arb_io_out_bits_uop_is_sys_pc2epc; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_is_unique = resp_arb_io_out_bits_uop_is_unique; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_flush_on_commit = resp_arb_io_out_bits_uop_flush_on_commit; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ldst_is_rs1 = resp_arb_io_out_bits_uop_ldst_is_rs1; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ldst = resp_arb_io_out_bits_uop_ldst; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_lrs1 = resp_arb_io_out_bits_uop_lrs1; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_lrs2 = resp_arb_io_out_bits_uop_lrs2; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_lrs3 = resp_arb_io_out_bits_uop_lrs3; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_ldst_val = resp_arb_io_out_bits_uop_ldst_val; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_dst_rtype = resp_arb_io_out_bits_uop_dst_rtype; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_lrs1_rtype = resp_arb_io_out_bits_uop_lrs1_rtype; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_lrs2_rtype = resp_arb_io_out_bits_uop_lrs2_rtype; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_frs3_en = resp_arb_io_out_bits_uop_frs3_en; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_fp_val = resp_arb_io_out_bits_uop_fp_val; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_fp_single = resp_arb_io_out_bits_uop_fp_single; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_xcpt_pf_if = resp_arb_io_out_bits_uop_xcpt_pf_if; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_xcpt_ae_if = resp_arb_io_out_bits_uop_xcpt_ae_if; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_xcpt_ma_if = resp_arb_io_out_bits_uop_xcpt_ma_if; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_bp_debug_if = resp_arb_io_out_bits_uop_bp_debug_if; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_bp_xcpt_if = resp_arb_io_out_bits_uop_bp_xcpt_if; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_debug_fsrc = resp_arb_io_out_bits_uop_debug_fsrc; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_uop_debug_tsrc = resp_arb_io_out_bits_uop_debug_tsrc; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_data = resp_arb_io_out_bits_data; // @[mshrs.scala 740:21]
  assign respq_io_enq_bits_is_hella = resp_arb_io_out_bits_is_hella; // @[mshrs.scala 740:21]
  assign respq_io_deq_ready = io_resp_ready; // @[mshrs.scala 741:21]
  assign respq_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[mshrs.scala 738:21]
  assign respq_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[mshrs.scala 738:21]
  assign respq_io_flush = io_exception; // @[mshrs.scala 739:21]
  always @(posedge clock) begin
    if(sdq_MPORT_en & sdq_MPORT_mask) begin
      sdq[sdq_MPORT_addr] <= sdq_MPORT_data; // @[mshrs.scala 559:25]
    end
    if(lb_MPORT_1_en & lb_MPORT_1_mask) begin
      lb[lb_MPORT_1_addr] <= lb_MPORT_1_data; // @[mshrs.scala 568:15]
    end
    if (reset) begin // @[mshrs.scala 555:29]
      sdq_val <= 17'h0; // @[mshrs.scala 555:29]
    end else begin
      sdq_val <= _GEN_48[16:0];
    end
    REG <= _T_195[0]; // @[util.scala 353:8]
    if (reset) begin // @[mshrs.scala 693:31]
      mshr_head <= 1'h0; // @[mshrs.scala 693:31]
    end else if (pri_rdy & pri_val) begin // @[mshrs.scala 695:29]
      mshr_head <= _T_199; // @[mshrs.scala 695:41]
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft <= 9'h0; // @[Arbiter.scala 87:30]
    end else if (latch) begin // @[Arbiter.scala 113:23]
      beatsLeft <= initBeats;
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state__0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state__0 <= earlyWinner__0;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state__1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state__1 <= earlyWinner__1;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state__2 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state__2 <= earlyWinner__2;
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft_1 <= 1'h0; // @[Arbiter.scala 87:30]
    end else if (latch_1) begin // @[Arbiter.scala 113:23]
      beatsLeft_1 <= 1'h0;
    end else begin
      beatsLeft_1 <= beatsLeft_1 - _beatsLeft_T_8;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_1) begin // @[Arbiter.scala 117:30]
      state_1_0 <= earlyWinner_1_0;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_1) begin // @[Arbiter.scala 117:30]
      state_1_1 <= earlyWinner_1_1;
    end
    if (REG) begin // @[mshrs.scala 633:35]
      REG_1 <= mshrs_1_io_req_pri_rdy; // @[mshrs.scala 634:15]
    end else begin
      REG_1 <= _T_136 & mshrs_0_io_req_pri_rdy;
    end
    REG_2 <= commit_vals_0 | commit_vals_1; // @[mshrs.scala 762:62]
    REG_3 <= _T_392 | _T_393; // @[Mux.scala 27:72]
    REG_4_state <= _T_395 | _T_396; // @[Mux.scala 27:72]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~((~earlyWinner__0 | ~earlyWinner__1) & (~prefixOR_2 | ~earlyWinner__2) | reset)) begin
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
        if (~((~earlyWinner__0 | ~earlyWinner__1) & (~prefixOR_2 | ~earlyWinner__2) | reset)) begin
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
        if (~(~(out_earlyValid | out_1_earlyValid | out_2_earlyValid) | _prefixOR_T | reset)) begin
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
        if (~(~(out_earlyValid | out_1_earlyValid | out_2_earlyValid) | _prefixOR_T | reset)) begin
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
        if (~(_T_226 | _T_225 | reset)) begin
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
        if (~(_T_226 | _T_225 | reset)) begin
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
        if (~(~earlyWinner_1_0 | ~earlyWinner_1_1 | reset)) begin
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
        if (~(~earlyWinner_1_0 | ~earlyWinner_1_1 | reset)) begin
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
        if (~(~(out_4_earlyValid | out_5_earlyValid) | _prefixOR_T_1 | reset)) begin
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
        if (~(~(out_4_earlyValid | out_5_earlyValid) | _prefixOR_T_1 | reset)) begin
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
        if (~(_T_293 | _T_292 | reset)) begin
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
        if (~(_T_293 | _T_292 | reset)) begin
          $fatal; // @[Arbiter.scala 108:14]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {2{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 17; initvar = initvar+1)
    sdq[initvar] = _RAND_0[63:0];
  _RAND_2 = {2{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    lb[initvar] = _RAND_2[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  sdq_val = _RAND_3[16:0];
  _RAND_4 = {1{`RANDOM}};
  REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  mshr_head = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  beatsLeft = _RAND_6[8:0];
  _RAND_7 = {1{`RANDOM}};
  state__0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  state__1 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  state__2 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  beatsLeft_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  state_1_0 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  state_1_1 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  REG_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  REG_2 = _RAND_14[0:0];
  _RAND_15 = {2{`RANDOM}};
  REG_3 = _RAND_15[39:0];
  _RAND_16 = {1{`RANDOM}};
  REG_4_state = _RAND_16[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
