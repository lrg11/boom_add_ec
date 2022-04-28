module BoomMSHR(
  input         clock,
  input         reset,
  input         io_id,
  input         io_req_pri_val,
  output        io_req_pri_rdy,
  input         io_req_sec_val,
  output        io_req_sec_rdy,
  input         io_clear_prefetch,
  input  [11:0] io_brupdate_b1_resolve_mask,
  input  [11:0] io_brupdate_b1_mispredict_mask,
  input         io_brupdate_b2_uop_switch,
  input         io_brupdate_b2_uop_switch_off,
  input         io_brupdate_b2_uop_is_unicore,
  input  [2:0]  io_brupdate_b2_uop_shift,
  input  [1:0]  io_brupdate_b2_uop_lrs3_rtype,
  input         io_brupdate_b2_uop_rflag,
  input         io_brupdate_b2_uop_wflag,
  input  [3:0]  io_brupdate_b2_uop_prflag,
  input  [3:0]  io_brupdate_b2_uop_pwflag,
  input         io_brupdate_b2_uop_pflag_busy,
  input  [3:0]  io_brupdate_b2_uop_stale_pflag,
  input  [3:0]  io_brupdate_b2_uop_op1_sel,
  input  [3:0]  io_brupdate_b2_uop_op2_sel,
  input  [5:0]  io_brupdate_b2_uop_split_num,
  input  [5:0]  io_brupdate_b2_uop_self_index,
  input  [5:0]  io_brupdate_b2_uop_rob_inst_idx,
  input  [5:0]  io_brupdate_b2_uop_address_num,
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
  input  [1:0]  io_brupdate_b2_uop_ctrl_op3_sel,
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
  input  [4:0]  io_brupdate_b2_uop_ldq_idx,
  input  [4:0]  io_brupdate_b2_uop_stq_idx,
  input  [1:0]  io_brupdate_b2_uop_rxq_idx,
  input  [6:0]  io_brupdate_b2_uop_pdst,
  input  [6:0]  io_brupdate_b2_uop_prs1,
  input  [6:0]  io_brupdate_b2_uop_prs2,
  input  [6:0]  io_brupdate_b2_uop_prs3,
  input  [4:0]  io_brupdate_b2_uop_ppred,
  input         io_brupdate_b2_uop_prs1_busy,
  input         io_brupdate_b2_uop_prs2_busy,
  input         io_brupdate_b2_uop_prs3_busy,
  input         io_brupdate_b2_uop_ppred_busy,
  input  [6:0]  io_brupdate_b2_uop_stale_pdst,
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
  input  [31:0] io_brupdate_b2_target_offset,
  input         io_exception,
  input  [5:0]  io_rob_pnr_idx,
  input  [5:0]  io_rob_head_idx,
  input         io_req_uop_switch,
  input         io_req_uop_switch_off,
  input         io_req_uop_is_unicore,
  input  [2:0]  io_req_uop_shift,
  input  [1:0]  io_req_uop_lrs3_rtype,
  input         io_req_uop_rflag,
  input         io_req_uop_wflag,
  input  [3:0]  io_req_uop_prflag,
  input  [3:0]  io_req_uop_pwflag,
  input         io_req_uop_pflag_busy,
  input  [3:0]  io_req_uop_stale_pflag,
  input  [3:0]  io_req_uop_op1_sel,
  input  [3:0]  io_req_uop_op2_sel,
  input  [5:0]  io_req_uop_split_num,
  input  [5:0]  io_req_uop_self_index,
  input  [5:0]  io_req_uop_rob_inst_idx,
  input  [5:0]  io_req_uop_address_num,
  input  [6:0]  io_req_uop_uopc,
  input  [31:0] io_req_uop_inst,
  input  [31:0] io_req_uop_debug_inst,
  input         io_req_uop_is_rvc,
  input  [39:0] io_req_uop_debug_pc,
  input  [2:0]  io_req_uop_iq_type,
  input  [9:0]  io_req_uop_fu_code,
  input  [3:0]  io_req_uop_ctrl_br_type,
  input  [1:0]  io_req_uop_ctrl_op1_sel,
  input  [2:0]  io_req_uop_ctrl_op2_sel,
  input  [2:0]  io_req_uop_ctrl_imm_sel,
  input  [3:0]  io_req_uop_ctrl_op_fcn,
  input         io_req_uop_ctrl_fcn_dw,
  input  [2:0]  io_req_uop_ctrl_csr_cmd,
  input         io_req_uop_ctrl_is_load,
  input         io_req_uop_ctrl_is_sta,
  input         io_req_uop_ctrl_is_std,
  input  [1:0]  io_req_uop_ctrl_op3_sel,
  input  [1:0]  io_req_uop_iw_state,
  input         io_req_uop_iw_p1_poisoned,
  input         io_req_uop_iw_p2_poisoned,
  input         io_req_uop_is_br,
  input         io_req_uop_is_jalr,
  input         io_req_uop_is_jal,
  input         io_req_uop_is_sfb,
  input  [11:0] io_req_uop_br_mask,
  input  [3:0]  io_req_uop_br_tag,
  input  [4:0]  io_req_uop_ftq_idx,
  input         io_req_uop_edge_inst,
  input  [5:0]  io_req_uop_pc_lob,
  input         io_req_uop_taken,
  input  [19:0] io_req_uop_imm_packed,
  input  [11:0] io_req_uop_csr_addr,
  input  [5:0]  io_req_uop_rob_idx,
  input  [4:0]  io_req_uop_ldq_idx,
  input  [4:0]  io_req_uop_stq_idx,
  input  [1:0]  io_req_uop_rxq_idx,
  input  [6:0]  io_req_uop_pdst,
  input  [6:0]  io_req_uop_prs1,
  input  [6:0]  io_req_uop_prs2,
  input  [6:0]  io_req_uop_prs3,
  input  [4:0]  io_req_uop_ppred,
  input         io_req_uop_prs1_busy,
  input         io_req_uop_prs2_busy,
  input         io_req_uop_prs3_busy,
  input         io_req_uop_ppred_busy,
  input  [6:0]  io_req_uop_stale_pdst,
  input         io_req_uop_exception,
  input  [63:0] io_req_uop_exc_cause,
  input         io_req_uop_bypassable,
  input  [4:0]  io_req_uop_mem_cmd,
  input  [1:0]  io_req_uop_mem_size,
  input         io_req_uop_mem_signed,
  input         io_req_uop_is_fence,
  input         io_req_uop_is_fencei,
  input         io_req_uop_is_amo,
  input         io_req_uop_uses_ldq,
  input         io_req_uop_uses_stq,
  input         io_req_uop_is_sys_pc2epc,
  input         io_req_uop_is_unique,
  input         io_req_uop_flush_on_commit,
  input         io_req_uop_ldst_is_rs1,
  input  [5:0]  io_req_uop_ldst,
  input  [5:0]  io_req_uop_lrs1,
  input  [5:0]  io_req_uop_lrs2,
  input  [5:0]  io_req_uop_lrs3,
  input         io_req_uop_ldst_val,
  input  [1:0]  io_req_uop_dst_rtype,
  input  [1:0]  io_req_uop_lrs1_rtype,
  input  [1:0]  io_req_uop_lrs2_rtype,
  input         io_req_uop_frs3_en,
  input         io_req_uop_fp_val,
  input         io_req_uop_fp_single,
  input         io_req_uop_xcpt_pf_if,
  input         io_req_uop_xcpt_ae_if,
  input         io_req_uop_xcpt_ma_if,
  input         io_req_uop_bp_debug_if,
  input         io_req_uop_bp_xcpt_if,
  input  [1:0]  io_req_uop_debug_fsrc,
  input  [1:0]  io_req_uop_debug_tsrc,
  input  [39:0] io_req_addr,
  input  [63:0] io_req_data,
  input         io_req_is_hella,
  input         io_req_tag_match,
  input  [1:0]  io_req_old_meta_coh_state,
  input  [19:0] io_req_old_meta_tag,
  input         io_req_way_en,
  input  [4:0]  io_req_sdq_id,
  input         io_req_is_probe,
  output        io_idx_valid,
  output [5:0]  io_idx_bits,
  output        io_way_valid,
  output        io_way_bits,
  output        io_tag_valid,
  output [27:0] io_tag_bits,
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
  input         io_prober_state_valid,
  input  [39:0] io_prober_state_bits,
  input         io_refill_ready,
  output        io_refill_valid,
  output        io_refill_bits_way_en,
  output [11:0] io_refill_bits_addr,
  output        io_refill_bits_wmask,
  output [63:0] io_refill_bits_data,
  input         io_meta_write_ready,
  output        io_meta_write_valid,
  output [5:0]  io_meta_write_bits_idx,
  output        io_meta_write_bits_way_en,
  output [19:0] io_meta_write_bits_tag,
  output [1:0]  io_meta_write_bits_data_coh_state,
  output [19:0] io_meta_write_bits_data_tag,
  input         io_meta_read_ready,
  output        io_meta_read_valid,
  output [5:0]  io_meta_read_bits_idx,
  output        io_meta_read_bits_way_en,
  output [19:0] io_meta_read_bits_tag,
  input         io_meta_resp_valid,
  input  [1:0]  io_meta_resp_bits_coh_state,
  input  [19:0] io_meta_resp_bits_tag,
  input         io_wb_req_ready,
  output        io_wb_req_valid,
  output [19:0] io_wb_req_bits_tag,
  output [5:0]  io_wb_req_bits_idx,
  output [1:0]  io_wb_req_bits_source,
  output [2:0]  io_wb_req_bits_param,
  output        io_wb_req_bits_way_en,
  output        io_wb_req_bits_voluntary,
  output        io_commit_val,
  output [39:0] io_commit_addr,
  output [1:0]  io_commit_coh_state,
  input         io_lb_read_ready,
  output        io_lb_read_valid,
  output        io_lb_read_bits_id,
  output [2:0]  io_lb_read_bits_offset,
  input  [63:0] io_lb_resp,
  input         io_lb_write_ready,
  output        io_lb_write_valid,
  output        io_lb_write_bits_id,
  output [2:0]  io_lb_write_bits_offset,
  output [63:0] io_lb_write_bits_data,
  input         io_replay_ready,
  output        io_replay_valid,
  output        io_replay_bits_uop_switch,
  output        io_replay_bits_uop_switch_off,
  output        io_replay_bits_uop_is_unicore,
  output [2:0]  io_replay_bits_uop_shift,
  output [1:0]  io_replay_bits_uop_lrs3_rtype,
  output        io_replay_bits_uop_rflag,
  output        io_replay_bits_uop_wflag,
  output [3:0]  io_replay_bits_uop_prflag,
  output [3:0]  io_replay_bits_uop_pwflag,
  output        io_replay_bits_uop_pflag_busy,
  output [3:0]  io_replay_bits_uop_stale_pflag,
  output [3:0]  io_replay_bits_uop_op1_sel,
  output [3:0]  io_replay_bits_uop_op2_sel,
  output [5:0]  io_replay_bits_uop_split_num,
  output [5:0]  io_replay_bits_uop_self_index,
  output [5:0]  io_replay_bits_uop_rob_inst_idx,
  output [5:0]  io_replay_bits_uop_address_num,
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
  output [1:0]  io_replay_bits_uop_ctrl_op3_sel,
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
  output [4:0]  io_replay_bits_uop_ldq_idx,
  output [4:0]  io_replay_bits_uop_stq_idx,
  output [1:0]  io_replay_bits_uop_rxq_idx,
  output [6:0]  io_replay_bits_uop_pdst,
  output [6:0]  io_replay_bits_uop_prs1,
  output [6:0]  io_replay_bits_uop_prs2,
  output [6:0]  io_replay_bits_uop_prs3,
  output [4:0]  io_replay_bits_uop_ppred,
  output        io_replay_bits_uop_prs1_busy,
  output        io_replay_bits_uop_prs2_busy,
  output        io_replay_bits_uop_prs3_busy,
  output        io_replay_bits_uop_ppred_busy,
  output [6:0]  io_replay_bits_uop_stale_pdst,
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
  output        io_replay_bits_way_en,
  output [4:0]  io_replay_bits_sdq_id,
  input         io_resp_ready,
  output        io_resp_valid,
  output        io_resp_bits_uop_switch,
  output        io_resp_bits_uop_switch_off,
  output        io_resp_bits_uop_is_unicore,
  output [2:0]  io_resp_bits_uop_shift,
  output [1:0]  io_resp_bits_uop_lrs3_rtype,
  output        io_resp_bits_uop_rflag,
  output        io_resp_bits_uop_wflag,
  output [3:0]  io_resp_bits_uop_prflag,
  output [3:0]  io_resp_bits_uop_pwflag,
  output        io_resp_bits_uop_pflag_busy,
  output [3:0]  io_resp_bits_uop_stale_pflag,
  output [3:0]  io_resp_bits_uop_op1_sel,
  output [3:0]  io_resp_bits_uop_op2_sel,
  output [5:0]  io_resp_bits_uop_split_num,
  output [5:0]  io_resp_bits_uop_self_index,
  output [5:0]  io_resp_bits_uop_rob_inst_idx,
  output [5:0]  io_resp_bits_uop_address_num,
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
  output [1:0]  io_resp_bits_uop_ctrl_op3_sel,
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
  output [4:0]  io_resp_bits_uop_ldq_idx,
  output [4:0]  io_resp_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_uop_rxq_idx,
  output [6:0]  io_resp_bits_uop_pdst,
  output [6:0]  io_resp_bits_uop_prs1,
  output [6:0]  io_resp_bits_uop_prs2,
  output [6:0]  io_resp_bits_uop_prs3,
  output [4:0]  io_resp_bits_uop_ppred,
  output        io_resp_bits_uop_prs1_busy,
  output        io_resp_bits_uop_prs2_busy,
  output        io_resp_bits_uop_prs3_busy,
  output        io_resp_bits_uop_ppred_busy,
  output [6:0]  io_resp_bits_uop_stale_pdst,
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
  input         io_wb_resp,
  output        io_probe_rdy
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
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
`endif // RANDOMIZE_REG_INIT
  wire  rpq_clock; // @[mshrs.scala 128:19]
  wire  rpq_reset; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_ready; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_valid; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_switch; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_switch_off; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_is_unicore; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_enq_bits_uop_shift; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_uop_lrs3_rtype; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_rflag; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_wflag; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_enq_bits_uop_prflag; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_enq_bits_uop_pwflag; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_pflag_busy; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_enq_bits_uop_stale_pflag; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_enq_bits_uop_op1_sel; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_enq_bits_uop_op2_sel; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_enq_bits_uop_split_num; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_enq_bits_uop_self_index; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_enq_bits_uop_rob_inst_idx; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_enq_bits_uop_address_num; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_enq_bits_uop_uopc; // @[mshrs.scala 128:19]
  wire [31:0] rpq_io_enq_bits_uop_inst; // @[mshrs.scala 128:19]
  wire [31:0] rpq_io_enq_bits_uop_debug_inst; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_is_rvc; // @[mshrs.scala 128:19]
  wire [39:0] rpq_io_enq_bits_uop_debug_pc; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_enq_bits_uop_iq_type; // @[mshrs.scala 128:19]
  wire [9:0] rpq_io_enq_bits_uop_fu_code; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_enq_bits_uop_ctrl_br_type; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_uop_ctrl_op1_sel; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_enq_bits_uop_ctrl_op2_sel; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_enq_bits_uop_ctrl_imm_sel; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_enq_bits_uop_ctrl_op_fcn; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_enq_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_ctrl_is_load; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_ctrl_is_sta; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_ctrl_is_std; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_uop_ctrl_op3_sel; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_uop_iw_state; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_iw_p1_poisoned; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_iw_p2_poisoned; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_is_br; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_is_jalr; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_is_jal; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_is_sfb; // @[mshrs.scala 128:19]
  wire [11:0] rpq_io_enq_bits_uop_br_mask; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_enq_bits_uop_br_tag; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_enq_bits_uop_ftq_idx; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_edge_inst; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_enq_bits_uop_pc_lob; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_taken; // @[mshrs.scala 128:19]
  wire [19:0] rpq_io_enq_bits_uop_imm_packed; // @[mshrs.scala 128:19]
  wire [11:0] rpq_io_enq_bits_uop_csr_addr; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_enq_bits_uop_rob_idx; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_enq_bits_uop_ldq_idx; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_enq_bits_uop_stq_idx; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_uop_rxq_idx; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_enq_bits_uop_pdst; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_enq_bits_uop_prs1; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_enq_bits_uop_prs2; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_enq_bits_uop_prs3; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_enq_bits_uop_ppred; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_prs1_busy; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_prs2_busy; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_prs3_busy; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_ppred_busy; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_enq_bits_uop_stale_pdst; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_exception; // @[mshrs.scala 128:19]
  wire [63:0] rpq_io_enq_bits_uop_exc_cause; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_bypassable; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_enq_bits_uop_mem_cmd; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_uop_mem_size; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_mem_signed; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_is_fence; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_is_fencei; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_is_amo; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_uses_ldq; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_uses_stq; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_is_sys_pc2epc; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_is_unique; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_flush_on_commit; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_ldst_is_rs1; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_enq_bits_uop_ldst; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_enq_bits_uop_lrs1; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_enq_bits_uop_lrs2; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_enq_bits_uop_lrs3; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_ldst_val; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_uop_dst_rtype; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_uop_lrs1_rtype; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_uop_lrs2_rtype; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_frs3_en; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_fp_val; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_fp_single; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_xcpt_pf_if; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_xcpt_ae_if; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_xcpt_ma_if; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_bp_debug_if; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_uop_bp_xcpt_if; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_uop_debug_fsrc; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_uop_debug_tsrc; // @[mshrs.scala 128:19]
  wire [39:0] rpq_io_enq_bits_addr; // @[mshrs.scala 128:19]
  wire [63:0] rpq_io_enq_bits_data; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_is_hella; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_tag_match; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_enq_bits_old_meta_coh_state; // @[mshrs.scala 128:19]
  wire [19:0] rpq_io_enq_bits_old_meta_tag; // @[mshrs.scala 128:19]
  wire  rpq_io_enq_bits_way_en; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_enq_bits_sdq_id; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_ready; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_valid; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_switch; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_switch_off; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_is_unicore; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_deq_bits_uop_shift; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_uop_lrs3_rtype; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_rflag; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_wflag; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_deq_bits_uop_prflag; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_deq_bits_uop_pwflag; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_pflag_busy; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_deq_bits_uop_stale_pflag; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_deq_bits_uop_op1_sel; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_deq_bits_uop_op2_sel; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_deq_bits_uop_split_num; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_deq_bits_uop_self_index; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_deq_bits_uop_rob_inst_idx; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_deq_bits_uop_address_num; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_deq_bits_uop_uopc; // @[mshrs.scala 128:19]
  wire [31:0] rpq_io_deq_bits_uop_inst; // @[mshrs.scala 128:19]
  wire [31:0] rpq_io_deq_bits_uop_debug_inst; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_is_rvc; // @[mshrs.scala 128:19]
  wire [39:0] rpq_io_deq_bits_uop_debug_pc; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_deq_bits_uop_iq_type; // @[mshrs.scala 128:19]
  wire [9:0] rpq_io_deq_bits_uop_fu_code; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_deq_bits_uop_ctrl_br_type; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_uop_ctrl_op1_sel; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_deq_bits_uop_ctrl_op2_sel; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_deq_bits_uop_ctrl_imm_sel; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_deq_bits_uop_ctrl_op_fcn; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_deq_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_ctrl_is_load; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_ctrl_is_sta; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_ctrl_is_std; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_uop_ctrl_op3_sel; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_uop_iw_state; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_iw_p1_poisoned; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_iw_p2_poisoned; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_is_br; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_is_jalr; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_is_jal; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_is_sfb; // @[mshrs.scala 128:19]
  wire [11:0] rpq_io_deq_bits_uop_br_mask; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_deq_bits_uop_br_tag; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_deq_bits_uop_ftq_idx; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_edge_inst; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_deq_bits_uop_pc_lob; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_taken; // @[mshrs.scala 128:19]
  wire [19:0] rpq_io_deq_bits_uop_imm_packed; // @[mshrs.scala 128:19]
  wire [11:0] rpq_io_deq_bits_uop_csr_addr; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_deq_bits_uop_rob_idx; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_deq_bits_uop_ldq_idx; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_deq_bits_uop_stq_idx; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_uop_rxq_idx; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_deq_bits_uop_pdst; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_deq_bits_uop_prs1; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_deq_bits_uop_prs2; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_deq_bits_uop_prs3; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_deq_bits_uop_ppred; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_prs1_busy; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_prs2_busy; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_prs3_busy; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_ppred_busy; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_deq_bits_uop_stale_pdst; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_exception; // @[mshrs.scala 128:19]
  wire [63:0] rpq_io_deq_bits_uop_exc_cause; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_bypassable; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_deq_bits_uop_mem_cmd; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_uop_mem_size; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_mem_signed; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_is_fence; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_is_fencei; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_is_amo; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_uses_ldq; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_uses_stq; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_is_sys_pc2epc; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_is_unique; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_flush_on_commit; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_ldst_is_rs1; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_deq_bits_uop_ldst; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_deq_bits_uop_lrs1; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_deq_bits_uop_lrs2; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_deq_bits_uop_lrs3; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_ldst_val; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_uop_dst_rtype; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_uop_lrs1_rtype; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_uop_lrs2_rtype; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_frs3_en; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_fp_val; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_fp_single; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_xcpt_pf_if; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_xcpt_ae_if; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_xcpt_ma_if; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_bp_debug_if; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_uop_bp_xcpt_if; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_uop_debug_fsrc; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_uop_debug_tsrc; // @[mshrs.scala 128:19]
  wire [39:0] rpq_io_deq_bits_addr; // @[mshrs.scala 128:19]
  wire [63:0] rpq_io_deq_bits_data; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_is_hella; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_tag_match; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_deq_bits_old_meta_coh_state; // @[mshrs.scala 128:19]
  wire [19:0] rpq_io_deq_bits_old_meta_tag; // @[mshrs.scala 128:19]
  wire  rpq_io_deq_bits_way_en; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_deq_bits_sdq_id; // @[mshrs.scala 128:19]
  wire [11:0] rpq_io_brupdate_b1_resolve_mask; // @[mshrs.scala 128:19]
  wire [11:0] rpq_io_brupdate_b1_mispredict_mask; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_switch; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_switch_off; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_is_unicore; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_brupdate_b2_uop_shift; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_uop_lrs3_rtype; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_rflag; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_wflag; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_brupdate_b2_uop_prflag; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_brupdate_b2_uop_pwflag; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_pflag_busy; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_brupdate_b2_uop_stale_pflag; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_brupdate_b2_uop_op1_sel; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_brupdate_b2_uop_op2_sel; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_brupdate_b2_uop_split_num; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_brupdate_b2_uop_self_index; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_brupdate_b2_uop_rob_inst_idx; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_brupdate_b2_uop_address_num; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_brupdate_b2_uop_uopc; // @[mshrs.scala 128:19]
  wire [31:0] rpq_io_brupdate_b2_uop_inst; // @[mshrs.scala 128:19]
  wire [31:0] rpq_io_brupdate_b2_uop_debug_inst; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_is_rvc; // @[mshrs.scala 128:19]
  wire [39:0] rpq_io_brupdate_b2_uop_debug_pc; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_brupdate_b2_uop_iq_type; // @[mshrs.scala 128:19]
  wire [9:0] rpq_io_brupdate_b2_uop_fu_code; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_brupdate_b2_uop_ctrl_br_type; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_uop_ctrl_op1_sel; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_brupdate_b2_uop_ctrl_op2_sel; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_brupdate_b2_uop_ctrl_imm_sel; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_brupdate_b2_uop_ctrl_op_fcn; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_ctrl_fcn_dw; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_brupdate_b2_uop_ctrl_csr_cmd; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_ctrl_is_load; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_ctrl_is_sta; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_ctrl_is_std; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_uop_ctrl_op3_sel; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_uop_iw_state; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_iw_p1_poisoned; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_iw_p2_poisoned; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_is_br; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_is_jalr; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_is_jal; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_is_sfb; // @[mshrs.scala 128:19]
  wire [11:0] rpq_io_brupdate_b2_uop_br_mask; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_brupdate_b2_uop_br_tag; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_brupdate_b2_uop_ftq_idx; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_edge_inst; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_brupdate_b2_uop_pc_lob; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_taken; // @[mshrs.scala 128:19]
  wire [19:0] rpq_io_brupdate_b2_uop_imm_packed; // @[mshrs.scala 128:19]
  wire [11:0] rpq_io_brupdate_b2_uop_csr_addr; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_brupdate_b2_uop_rob_idx; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_brupdate_b2_uop_ldq_idx; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_brupdate_b2_uop_stq_idx; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_uop_rxq_idx; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_brupdate_b2_uop_pdst; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_brupdate_b2_uop_prs1; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_brupdate_b2_uop_prs2; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_brupdate_b2_uop_prs3; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_brupdate_b2_uop_ppred; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_prs1_busy; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_prs2_busy; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_prs3_busy; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_ppred_busy; // @[mshrs.scala 128:19]
  wire [6:0] rpq_io_brupdate_b2_uop_stale_pdst; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_exception; // @[mshrs.scala 128:19]
  wire [63:0] rpq_io_brupdate_b2_uop_exc_cause; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_bypassable; // @[mshrs.scala 128:19]
  wire [4:0] rpq_io_brupdate_b2_uop_mem_cmd; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_uop_mem_size; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_mem_signed; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_is_fence; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_is_fencei; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_is_amo; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_uses_ldq; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_uses_stq; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_is_sys_pc2epc; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_is_unique; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_flush_on_commit; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_ldst_is_rs1; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_brupdate_b2_uop_ldst; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_brupdate_b2_uop_lrs1; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_brupdate_b2_uop_lrs2; // @[mshrs.scala 128:19]
  wire [5:0] rpq_io_brupdate_b2_uop_lrs3; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_ldst_val; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_uop_dst_rtype; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_uop_lrs1_rtype; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_uop_lrs2_rtype; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_frs3_en; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_fp_val; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_fp_single; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_xcpt_pf_if; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_xcpt_ae_if; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_xcpt_ma_if; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_bp_debug_if; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_uop_bp_xcpt_if; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_uop_debug_fsrc; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_uop_debug_tsrc; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_valid; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_mispredict; // @[mshrs.scala 128:19]
  wire  rpq_io_brupdate_b2_taken; // @[mshrs.scala 128:19]
  wire [2:0] rpq_io_brupdate_b2_cfi_type; // @[mshrs.scala 128:19]
  wire [1:0] rpq_io_brupdate_b2_pc_sel; // @[mshrs.scala 128:19]
  wire [39:0] rpq_io_brupdate_b2_jalr_target; // @[mshrs.scala 128:19]
  wire [31:0] rpq_io_brupdate_b2_target_offset; // @[mshrs.scala 128:19]
  wire  rpq_io_flush; // @[mshrs.scala 128:19]
  wire  rpq_io_empty; // @[mshrs.scala 128:19]
  wire [3:0] rpq_io_count; // @[mshrs.scala 128:19]
  reg [4:0] state; // @[mshrs.scala 107:22]
  reg [4:0] req_uop_mem_cmd; // @[mshrs.scala 109:20]
  reg [39:0] req_addr; // @[mshrs.scala 109:20]
  reg [1:0] req_old_meta_coh_state; // @[mshrs.scala 109:20]
  reg [19:0] req_old_meta_tag; // @[mshrs.scala 109:20]
  reg  req_way_en; // @[mshrs.scala 109:20]
  wire [5:0] req_idx = req_addr[11:6]; // @[mshrs.scala 110:25]
  wire [27:0] req_tag = req_addr[39:12]; // @[mshrs.scala 111:26]
  wire [39:0] req_block_addr = {req_addr[39:6], 6'h0}; // @[mshrs.scala 112:51]
  reg  req_needs_wb; // @[mshrs.scala 113:29]
  reg [1:0] new_coh_state; // @[mshrs.scala 115:24]
  wire [3:0] _T_6 = {2'h2,req_old_meta_coh_state}; // @[Cat.scala 30:58]
  wire  _T_19 = 4'h8 == _T_6; // @[Misc.scala 55:20]
  wire [2:0] _T_21 = _T_19 ? 3'h5 : 3'h0; // @[Misc.scala 37:36]
  wire  _T_23 = 4'h9 == _T_6; // @[Misc.scala 55:20]
  wire [2:0] _T_25 = _T_23 ? 3'h2 : _T_21; // @[Misc.scala 37:36]
  wire  _T_27 = 4'ha == _T_6; // @[Misc.scala 55:20]
  wire [2:0] _T_29 = _T_27 ? 3'h1 : _T_25; // @[Misc.scala 37:36]
  wire  _T_31 = 4'hb == _T_6; // @[Misc.scala 55:20]
  wire [2:0] _T_33 = _T_31 ? 3'h1 : _T_29; // @[Misc.scala 37:36]
  wire  _T_35 = 4'h4 == _T_6; // @[Misc.scala 55:20]
  wire [2:0] _T_37 = _T_35 ? 3'h5 : _T_33; // @[Misc.scala 37:36]
  wire  _T_39 = 4'h5 == _T_6; // @[Misc.scala 55:20]
  wire [2:0] _T_41 = _T_39 ? 3'h4 : _T_37; // @[Misc.scala 37:36]
  wire [1:0] _T_42 = _T_39 ? 2'h1 : 2'h0; // @[Misc.scala 37:63]
  wire  _T_43 = 4'h6 == _T_6; // @[Misc.scala 55:20]
  wire [2:0] _T_45 = _T_43 ? 3'h0 : _T_41; // @[Misc.scala 37:36]
  wire [1:0] _T_46 = _T_43 ? 2'h1 : _T_42; // @[Misc.scala 37:63]
  wire  _T_47 = 4'h7 == _T_6; // @[Misc.scala 55:20]
  wire [2:0] _T_49 = _T_47 ? 3'h0 : _T_45; // @[Misc.scala 37:36]
  wire [1:0] _T_50 = _T_47 ? 2'h1 : _T_46; // @[Misc.scala 37:63]
  wire  _T_51 = 4'h0 == _T_6; // @[Misc.scala 55:20]
  wire [2:0] _T_53 = _T_51 ? 3'h5 : _T_49; // @[Misc.scala 37:36]
  wire [1:0] _T_54 = _T_51 ? 2'h0 : _T_50; // @[Misc.scala 37:63]
  wire  _T_55 = 4'h1 == _T_6; // @[Misc.scala 55:20]
  wire [2:0] _T_57 = _T_55 ? 3'h4 : _T_53; // @[Misc.scala 37:36]
  wire [1:0] _T_58 = _T_55 ? 2'h1 : _T_54; // @[Misc.scala 37:63]
  wire  _T_59 = 4'h2 == _T_6; // @[Misc.scala 55:20]
  wire [2:0] _T_61 = _T_59 ? 3'h3 : _T_57; // @[Misc.scala 37:36]
  wire [1:0] _T_62 = _T_59 ? 2'h2 : _T_58; // @[Misc.scala 37:63]
  wire  _T_63 = 4'h3 == _T_6; // @[Misc.scala 55:20]
  wire [1:0] coh_on_clear_state = _T_63 ? 2'h2 : _T_62; // @[Misc.scala 37:63]
  wire  _c_cat_T_5 = req_uop_mem_cmd == 5'h4; // @[package.scala 15:47]
  wire  _c_cat_T_6 = req_uop_mem_cmd == 5'h9; // @[package.scala 15:47]
  wire  _c_cat_T_7 = req_uop_mem_cmd == 5'ha; // @[package.scala 15:47]
  wire  _c_cat_T_8 = req_uop_mem_cmd == 5'hb; // @[package.scala 15:47]
  wire  _c_cat_T_11 = _c_cat_T_5 | _c_cat_T_6 | _c_cat_T_7 | _c_cat_T_8; // @[package.scala 72:59]
  wire  _c_cat_T_12 = req_uop_mem_cmd == 5'h8; // @[package.scala 15:47]
  wire  _c_cat_T_13 = req_uop_mem_cmd == 5'hc; // @[package.scala 15:47]
  wire  _c_cat_T_14 = req_uop_mem_cmd == 5'hd; // @[package.scala 15:47]
  wire  _c_cat_T_15 = req_uop_mem_cmd == 5'he; // @[package.scala 15:47]
  wire  _c_cat_T_16 = req_uop_mem_cmd == 5'hf; // @[package.scala 15:47]
  wire  _c_cat_T_20 = _c_cat_T_12 | _c_cat_T_13 | _c_cat_T_14 | _c_cat_T_15 | _c_cat_T_16; // @[package.scala 72:59]
  wire  _c_cat_T_21 = _c_cat_T_11 | _c_cat_T_20; // @[Consts.scala 79:44]
  wire  c_cat_hi = req_uop_mem_cmd == 5'h1 | req_uop_mem_cmd == 5'h11 | req_uop_mem_cmd == 5'h7 | _c_cat_T_21; // @[Consts.scala 82:76]
  wire  c_cat_lo = c_cat_hi | req_uop_mem_cmd == 5'h3 | req_uop_mem_cmd == 5'h6; // @[Consts.scala 83:64]
  wire [3:0] _T_66 = {c_cat_hi,c_cat_lo,new_coh_state}; // @[Cat.scala 30:58]
  wire  _T_79 = 4'hc == _T_66; // @[Misc.scala 48:20]
  wire [1:0] _T_81 = _T_79 ? 2'h1 : 2'h0; // @[Misc.scala 34:36]
  wire  _T_82 = 4'hd == _T_66; // @[Misc.scala 48:20]
  wire [1:0] _T_84 = _T_82 ? 2'h2 : _T_81; // @[Misc.scala 34:36]
  wire  _T_85 = 4'h4 == _T_66; // @[Misc.scala 48:20]
  wire [1:0] _T_87 = _T_85 ? 2'h1 : _T_84; // @[Misc.scala 34:36]
  wire  _T_88 = 4'h5 == _T_66; // @[Misc.scala 48:20]
  wire [1:0] _T_90 = _T_88 ? 2'h2 : _T_87; // @[Misc.scala 34:36]
  wire  _T_91 = 4'h0 == _T_66; // @[Misc.scala 48:20]
  wire [1:0] _T_93 = _T_91 ? 2'h0 : _T_90; // @[Misc.scala 34:36]
  wire  _T_94 = 4'he == _T_66; // @[Misc.scala 48:20]
  wire [1:0] _T_96 = _T_94 ? 2'h3 : _T_93; // @[Misc.scala 34:36]
  wire  _T_97 = 4'hf == _T_66; // @[Misc.scala 48:20]
  wire [1:0] _T_99 = _T_97 ? 2'h3 : _T_96; // @[Misc.scala 34:36]
  wire  _T_100 = 4'h6 == _T_66; // @[Misc.scala 48:20]
  wire [1:0] _T_102 = _T_100 ? 2'h2 : _T_99; // @[Misc.scala 34:36]
  wire  _T_103 = 4'h7 == _T_66; // @[Misc.scala 48:20]
  wire [1:0] _T_105 = _T_103 ? 2'h3 : _T_102; // @[Misc.scala 34:36]
  wire  _T_106 = 4'h1 == _T_66; // @[Misc.scala 48:20]
  wire [1:0] _T_108 = _T_106 ? 2'h1 : _T_105; // @[Misc.scala 34:36]
  wire  _T_109 = 4'h2 == _T_66; // @[Misc.scala 48:20]
  wire [1:0] _T_111 = _T_109 ? 2'h2 : _T_108; // @[Misc.scala 34:36]
  wire  _T_112 = 4'h3 == _T_66; // @[Misc.scala 48:20]
  wire  _T_113 = _T_112 | (_T_109 | (_T_106 | (_T_103 | (_T_100 | (_T_97 | _T_94))))); // @[Misc.scala 34:9]
  wire [1:0] grow_param = _T_112 ? 2'h3 : _T_111; // @[Misc.scala 34:36]
  wire [3:0] _T_114 = {c_cat_hi,c_cat_lo,io_mem_grant_bits_param}; // @[Cat.scala 30:58]
  wire [1:0] _T_120 = 4'h1 == _T_114 ? 2'h1 : 2'h0; // @[Mux.scala 80:57]
  wire [1:0] _T_122 = 4'h0 == _T_114 ? 2'h2 : _T_120; // @[Mux.scala 80:57]
  wire [1:0] _T_124 = 4'h4 == _T_114 ? 2'h2 : _T_122; // @[Mux.scala 80:57]
  wire [1:0] coh_on_grant_state = 4'hc == _T_114 ? 2'h3 : _T_124; // @[Mux.scala 80:57]
  wire  _c_cat_T_149 = io_req_uop_mem_cmd == 5'h4; // @[package.scala 15:47]
  wire  _c_cat_T_150 = io_req_uop_mem_cmd == 5'h9; // @[package.scala 15:47]
  wire  _c_cat_T_151 = io_req_uop_mem_cmd == 5'ha; // @[package.scala 15:47]
  wire  _c_cat_T_152 = io_req_uop_mem_cmd == 5'hb; // @[package.scala 15:47]
  wire  _c_cat_T_155 = _c_cat_T_149 | _c_cat_T_150 | _c_cat_T_151 | _c_cat_T_152; // @[package.scala 72:59]
  wire  _c_cat_T_156 = io_req_uop_mem_cmd == 5'h8; // @[package.scala 15:47]
  wire  _c_cat_T_157 = io_req_uop_mem_cmd == 5'hc; // @[package.scala 15:47]
  wire  _c_cat_T_158 = io_req_uop_mem_cmd == 5'hd; // @[package.scala 15:47]
  wire  _c_cat_T_159 = io_req_uop_mem_cmd == 5'he; // @[package.scala 15:47]
  wire  _c_cat_T_160 = io_req_uop_mem_cmd == 5'hf; // @[package.scala 15:47]
  wire  _c_cat_T_164 = _c_cat_T_156 | _c_cat_T_157 | _c_cat_T_158 | _c_cat_T_159 | _c_cat_T_160; // @[package.scala 72:59]
  wire  _c_cat_T_165 = _c_cat_T_155 | _c_cat_T_164; // @[Consts.scala 79:44]
  wire  c_cat_hi_3 = io_req_uop_mem_cmd == 5'h1 | io_req_uop_mem_cmd == 5'h11 | io_req_uop_mem_cmd == 5'h7 |
    _c_cat_T_165; // @[Consts.scala 82:76]
  wire  _c_cat_T_189 = io_req_uop_mem_cmd == 5'h3; // @[Consts.scala 83:54]
  wire  c_cat_lo_3 = c_cat_hi_3 | io_req_uop_mem_cmd == 5'h3 | io_req_uop_mem_cmd == 5'h6; // @[Consts.scala 83:64]
  wire [1:0] hi_32 = {c_cat_hi_3,c_cat_lo_3}; // @[Cat.scala 30:58]
  wire [3:0] _T_176 = {c_cat_hi_3,c_cat_lo_3,new_coh_state}; // @[Cat.scala 30:58]
  wire  _T_189 = 4'hc == _T_176; // @[Misc.scala 48:20]
  wire [1:0] _T_191 = _T_189 ? 2'h1 : 2'h0; // @[Misc.scala 34:36]
  wire  _T_192 = 4'hd == _T_176; // @[Misc.scala 48:20]
  wire [1:0] _T_194 = _T_192 ? 2'h2 : _T_191; // @[Misc.scala 34:36]
  wire  _T_195 = 4'h4 == _T_176; // @[Misc.scala 48:20]
  wire [1:0] _T_197 = _T_195 ? 2'h1 : _T_194; // @[Misc.scala 34:36]
  wire  _T_198 = 4'h5 == _T_176; // @[Misc.scala 48:20]
  wire [1:0] _T_200 = _T_198 ? 2'h2 : _T_197; // @[Misc.scala 34:36]
  wire  _T_201 = 4'h0 == _T_176; // @[Misc.scala 48:20]
  wire [1:0] _T_203 = _T_201 ? 2'h0 : _T_200; // @[Misc.scala 34:36]
  wire  _T_204 = 4'he == _T_176; // @[Misc.scala 48:20]
  wire [1:0] _T_206 = _T_204 ? 2'h3 : _T_203; // @[Misc.scala 34:36]
  wire  _T_207 = 4'hf == _T_176; // @[Misc.scala 48:20]
  wire [1:0] _T_209 = _T_207 ? 2'h3 : _T_206; // @[Misc.scala 34:36]
  wire  _T_210 = 4'h6 == _T_176; // @[Misc.scala 48:20]
  wire [1:0] _T_212 = _T_210 ? 2'h2 : _T_209; // @[Misc.scala 34:36]
  wire  _T_213 = 4'h7 == _T_176; // @[Misc.scala 48:20]
  wire [1:0] _T_215 = _T_213 ? 2'h3 : _T_212; // @[Misc.scala 34:36]
  wire  _T_216 = 4'h1 == _T_176; // @[Misc.scala 48:20]
  wire [1:0] _T_218 = _T_216 ? 2'h1 : _T_215; // @[Misc.scala 34:36]
  wire  _T_219 = 4'h2 == _T_176; // @[Misc.scala 48:20]
  wire [1:0] _T_221 = _T_219 ? 2'h2 : _T_218; // @[Misc.scala 34:36]
  wire  _T_222 = 4'h3 == _T_176; // @[Misc.scala 48:20]
  wire  _T_223 = _T_222 | (_T_219 | (_T_216 | (_T_213 | (_T_210 | (_T_207 | _T_204))))); // @[Misc.scala 34:9]
  wire [1:0] _T_224 = _T_222 ? 2'h3 : _T_221; // @[Misc.scala 34:36]
  wire  cmd_requires_second_acquire = c_cat_lo_3 & ~c_cat_lo; // @[Metadata.scala 103:54]
  wire  is_hit_again = _T_113 & _T_223; // @[Metadata.scala 104:27]
  wire  dirties = hi_32 == 2'h3; // @[Metadata.scala 105:42]
  wire [1:0] biggest_grow_param = dirties ? _T_224 : grow_param; // @[Metadata.scala 106:33]
  wire [4:0] dirtier_cmd = dirties ? io_req_uop_mem_cmd : req_uop_mem_cmd; // @[Metadata.scala 108:27]
  wire  _T_225 = io_mem_grant_ready & io_mem_grant_valid; // @[Decoupled.scala 40:37]
  wire [26:0] _beats1_decode_T_1 = 27'hfff << io_mem_grant_bits_size; // @[package.scala 234:77]
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] beats1_decode = _beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  beats1_opdata = io_mem_grant_bits_opcode[0]; // @[Edges.scala 105:36]
  wire [8:0] beats1 = beats1_opdata ? beats1_decode : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] counter; // @[Edges.scala 228:27]
  wire [8:0] counter1 = counter - 9'h1; // @[Edges.scala 229:28]
  wire  first = counter == 9'h0; // @[Edges.scala 230:25]
  wire  last = counter == 9'h1 | beats1 == 9'h0; // @[Edges.scala 231:37]
  wire  refill_done = last & _T_225; // @[Edges.scala 232:22]
  wire [8:0] _count_T = ~counter1; // @[Edges.scala 233:27]
  wire [8:0] count = beats1 & _count_T; // @[Edges.scala 233:25]
  wire [11:0] refill_address_inc = {count, 3'h0}; // @[Edges.scala 268:29]
  wire  _T_229 = state == 5'h0; // @[package.scala 15:47]
  wire  _T_230 = state == 5'hd; // @[package.scala 15:47]
  wire  _T_231 = state == 5'he; // @[package.scala 15:47]
  wire  _T_232 = state == 5'hf; // @[package.scala 15:47]
  wire  _T_235 = _T_229 | _T_230 | _T_231 | _T_232; // @[package.scala 72:59]
  wire  _T_236 = ~_T_235; // @[mshrs.scala 126:18]
  wire  sec_rdy = ~cmd_requires_second_acquire & ~io_req_is_probe & _T_236; // @[mshrs.scala 125:67]
  wire  _T_244 = io_req_pri_val & io_req_pri_rdy; // @[mshrs.scala 133:40]
  wire  _T_245 = io_req_sec_val & io_req_sec_rdy; // @[mshrs.scala 133:78]
  wire  _T_249 = io_req_uop_mem_cmd == 5'h2 | _c_cat_T_189; // @[Consts.scala 80:45]
  reg  grantack_valid; // @[mshrs.scala 138:21]
  reg [1:0] grantack_bits_sink; // @[mshrs.scala 138:21]
  reg [2:0] refill_ctr; // @[mshrs.scala 139:24]
  reg  commit_line; // @[mshrs.scala 140:24]
  reg  grant_had_data; // @[mshrs.scala 141:27]
  reg [1:0] meta_hazard; // @[mshrs.scala 145:28]
  wire [1:0] _T_254 = meta_hazard + 2'h1; // @[mshrs.scala 146:59]
  wire  _T_255 = io_meta_write_ready & io_meta_write_valid; // @[Decoupled.scala 40:37]
  wire  _T_258 = state == 5'h1; // @[package.scala 15:47]
  wire  _T_259 = state == 5'h2; // @[package.scala 15:47]
  wire  _T_260 = state == 5'h3; // @[package.scala 15:47]
  wire  _T_263 = _T_229 | _T_258 | _T_259 | _T_260; // @[package.scala 72:59]
  wire  _T_264 = state == 5'h4; // @[mshrs.scala 148:129]
  wire  _T_271 = state == 5'h11; // @[package.scala 15:47]
  wire  _T_272 = _T_229 | _T_271; // @[package.scala 72:59]
  wire [1:0] _GEN_3 = is_hit_again ? biggest_grow_param : new_coh_state; // @[mshrs.scala 174:25 mshrs.scala 175:15 mshrs.scala 115:24]
  wire [4:0] _GEN_4 = _T_245 ? dirtier_cmd : req_uop_mem_cmd; // @[mshrs.scala 172:43 mshrs.scala 173:21 mshrs.scala 109:20]
  wire [1:0] _GEN_5 = _T_245 ? _GEN_3 : new_coh_state; // @[mshrs.scala 172:43 mshrs.scala 115:24]
  wire [3:0] _T_286 = {2'h2,io_req_old_meta_coh_state}; // @[Cat.scala 30:58]
  wire  _T_311 = 4'hb == _T_286; // @[Misc.scala 55:20]
  wire  _T_315 = 4'h4 == _T_286; // @[Misc.scala 55:20]
  wire  _T_316 = _T_315 ? 1'h0 : _T_311; // @[Misc.scala 37:9]
  wire  _T_319 = 4'h5 == _T_286; // @[Misc.scala 55:20]
  wire  _T_320 = _T_319 ? 1'h0 : _T_316; // @[Misc.scala 37:9]
  wire  _T_323 = 4'h6 == _T_286; // @[Misc.scala 55:20]
  wire  _T_324 = _T_323 ? 1'h0 : _T_320; // @[Misc.scala 37:9]
  wire  _T_327 = 4'h7 == _T_286; // @[Misc.scala 55:20]
  wire  _T_331 = 4'h0 == _T_286; // @[Misc.scala 55:20]
  wire  _T_332 = _T_331 ? 1'h0 : _T_327 | _T_324; // @[Misc.scala 37:9]
  wire  _T_335 = 4'h1 == _T_286; // @[Misc.scala 55:20]
  wire  _T_336 = _T_335 ? 1'h0 : _T_332; // @[Misc.scala 37:9]
  wire  _T_339 = 4'h2 == _T_286; // @[Misc.scala 55:20]
  wire  _T_340 = _T_339 ? 1'h0 : _T_336; // @[Misc.scala 37:9]
  wire  _T_343 = 4'h3 == _T_286; // @[Misc.scala 55:20]
  wire  _T_344 = _T_343 | _T_340; // @[Misc.scala 37:9]
  wire [3:0] _T_347 = {c_cat_hi_3,c_cat_lo_3,io_req_old_meta_coh_state}; // @[Cat.scala 30:58]
  wire  _T_360 = 4'hc == _T_347; // @[Misc.scala 48:20]
  wire [1:0] _T_362 = _T_360 ? 2'h1 : 2'h0; // @[Misc.scala 34:36]
  wire  _T_363 = 4'hd == _T_347; // @[Misc.scala 48:20]
  wire [1:0] _T_365 = _T_363 ? 2'h2 : _T_362; // @[Misc.scala 34:36]
  wire  _T_366 = 4'h4 == _T_347; // @[Misc.scala 48:20]
  wire [1:0] _T_368 = _T_366 ? 2'h1 : _T_365; // @[Misc.scala 34:36]
  wire  _T_369 = 4'h5 == _T_347; // @[Misc.scala 48:20]
  wire [1:0] _T_371 = _T_369 ? 2'h2 : _T_368; // @[Misc.scala 34:36]
  wire  _T_372 = 4'h0 == _T_347; // @[Misc.scala 48:20]
  wire [1:0] _T_374 = _T_372 ? 2'h0 : _T_371; // @[Misc.scala 34:36]
  wire  _T_375 = 4'he == _T_347; // @[Misc.scala 48:20]
  wire [1:0] _T_377 = _T_375 ? 2'h3 : _T_374; // @[Misc.scala 34:36]
  wire  _T_378 = 4'hf == _T_347; // @[Misc.scala 48:20]
  wire [1:0] _T_380 = _T_378 ? 2'h3 : _T_377; // @[Misc.scala 34:36]
  wire  _T_381 = 4'h6 == _T_347; // @[Misc.scala 48:20]
  wire [1:0] _T_383 = _T_381 ? 2'h2 : _T_380; // @[Misc.scala 34:36]
  wire  _T_384 = 4'h7 == _T_347; // @[Misc.scala 48:20]
  wire [1:0] _T_386 = _T_384 ? 2'h3 : _T_383; // @[Misc.scala 34:36]
  wire  _T_387 = 4'h1 == _T_347; // @[Misc.scala 48:20]
  wire [1:0] _T_389 = _T_387 ? 2'h1 : _T_386; // @[Misc.scala 34:36]
  wire  _T_390 = 4'h2 == _T_347; // @[Misc.scala 48:20]
  wire [1:0] _T_392 = _T_390 ? 2'h2 : _T_389; // @[Misc.scala 34:36]
  wire  _T_393 = 4'h3 == _T_347; // @[Misc.scala 48:20]
  wire  _T_394 = _T_393 | (_T_390 | (_T_387 | (_T_384 | (_T_381 | (_T_378 | _T_375))))); // @[Misc.scala 34:9]
  wire [1:0] meta_3_state = _T_393 ? 2'h3 : _T_392; // @[Misc.scala 34:36]
  wire [1:0] _GEN_6 = _T_394 ? meta_3_state : io_req_old_meta_coh_state; // @[mshrs.scala 189:21 mshrs.scala 191:21 mshrs.scala 194:21]
  wire [4:0] _GEN_7 = _T_394 ? 5'hc : 5'h1; // @[mshrs.scala 189:21 mshrs.scala 192:21 mshrs.scala 195:21]
  wire [1:0] _GEN_8 = io_req_tag_match ? _GEN_6 : 2'h0; // @[mshrs.scala 187:29 mshrs.scala 198:19]
  wire [4:0] _GEN_9 = io_req_tag_match ? _GEN_7 : 5'h1; // @[mshrs.scala 187:29 mshrs.scala 199:19]
  wire  _GEN_10 = _T_244 ? 1'h0 : grantack_valid; // @[mshrs.scala 208:45 mshrs.scala 181:20 mshrs.scala 138:21]
  wire [2:0] _GEN_11 = _T_244 ? 3'h0 : refill_ctr; // @[mshrs.scala 208:45 mshrs.scala 182:16 mshrs.scala 139:24]
  wire  _GEN_13 = _T_244 ? io_req_way_en : req_way_en; // @[mshrs.scala 208:45 mshrs.scala 184:9 mshrs.scala 109:20]
  wire [19:0] _GEN_14 = _T_244 ? io_req_old_meta_tag : req_old_meta_tag; // @[mshrs.scala 208:45 mshrs.scala 184:9 mshrs.scala 109:20]
  wire [1:0] _GEN_15 = _T_244 ? io_req_old_meta_coh_state : req_old_meta_coh_state; // @[mshrs.scala 208:45 mshrs.scala 184:9 mshrs.scala 109:20]
  wire [39:0] _GEN_19 = _T_244 ? io_req_addr : req_addr; // @[mshrs.scala 208:45 mshrs.scala 184:9 mshrs.scala 109:20]
  wire [4:0] _GEN_49 = _T_244 ? io_req_uop_mem_cmd : _GEN_4; // @[mshrs.scala 208:45 mshrs.scala 184:9]
  wire  _GEN_117 = _T_244 ? _T_344 : req_needs_wb; // @[mshrs.scala 208:45 mshrs.scala 186:18 mshrs.scala 113:29]
  wire [1:0] _GEN_118 = _T_244 ? _GEN_8 : _GEN_5; // @[mshrs.scala 208:45]
  wire [4:0] _GEN_119 = _T_244 ? _GEN_9 : state; // @[mshrs.scala 208:45 mshrs.scala 209:13 mshrs.scala 107:22]
  wire [33:0] _T_423 = {req_tag,req_idx}; // @[Cat.scala 30:58]
  wire [39:0] _T_424 = {_T_423, 6'h0}; // @[mshrs.scala 216:47]
  wire  _T_425 = io_mem_acquire_ready & io_mem_acquire_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_122 = beats1_opdata & io_mem_grant_valid; // @[mshrs.scala 223:44 mshrs.scala 225:31 mshrs.scala 169:26]
  wire  _T_432 = io_mem_grant_bits_opcode[2] & ~io_mem_grant_bits_opcode[1]; // @[Edges.scala 70:40]
  wire [4:0] _T_433 = grant_had_data ? 5'h3 : 5'hc; // @[mshrs.scala 239:19]
  wire [4:0] _GEN_129 = refill_done ? _T_433 : state; // @[mshrs.scala 236:24 mshrs.scala 239:13 mshrs.scala 107:22]
  wire [1:0] _GEN_131 = refill_done ? coh_on_grant_state : _GEN_5; // @[mshrs.scala 236:24 mshrs.scala 242:15]
  wire  _T_442 = rpq_io_deq_bits_uop_mem_cmd == 5'h6; // @[Consts.scala 81:48]
  wire  _T_444 = rpq_io_deq_bits_uop_mem_cmd == 5'h7; // @[Consts.scala 81:65]
  wire  _T_446 = rpq_io_deq_bits_uop_mem_cmd == 5'h4; // @[package.scala 15:47]
  wire  _T_447 = rpq_io_deq_bits_uop_mem_cmd == 5'h9; // @[package.scala 15:47]
  wire  _T_448 = rpq_io_deq_bits_uop_mem_cmd == 5'ha; // @[package.scala 15:47]
  wire  _T_449 = rpq_io_deq_bits_uop_mem_cmd == 5'hb; // @[package.scala 15:47]
  wire  _T_452 = _T_446 | _T_447 | _T_448 | _T_449; // @[package.scala 72:59]
  wire  _T_453 = rpq_io_deq_bits_uop_mem_cmd == 5'h8; // @[package.scala 15:47]
  wire  _T_454 = rpq_io_deq_bits_uop_mem_cmd == 5'hc; // @[package.scala 15:47]
  wire  _T_455 = rpq_io_deq_bits_uop_mem_cmd == 5'hd; // @[package.scala 15:47]
  wire  _T_456 = rpq_io_deq_bits_uop_mem_cmd == 5'he; // @[package.scala 15:47]
  wire  _T_457 = rpq_io_deq_bits_uop_mem_cmd == 5'hf; // @[package.scala 15:47]
  wire  _T_461 = _T_453 | _T_454 | _T_455 | _T_456 | _T_457; // @[package.scala 72:59]
  wire  _T_462 = _T_452 | _T_461; // @[Consts.scala 79:44]
  wire  _T_463 = rpq_io_deq_bits_uop_mem_cmd == 5'h0 | rpq_io_deq_bits_uop_mem_cmd == 5'h6 | rpq_io_deq_bits_uop_mem_cmd
     == 5'h7 | _T_462; // @[Consts.scala 81:75]
  wire  _T_486 = rpq_io_deq_bits_uop_mem_cmd == 5'h1 | rpq_io_deq_bits_uop_mem_cmd == 5'h11 | _T_444 | _T_462; // @[Consts.scala 82:76]
  wire  _T_487 = ~_T_486; // @[mshrs.scala 247:22]
  wire  _T_488 = _T_463 & _T_487; // @[mshrs.scala 246:59]
  wire  _T_489 = rpq_io_deq_bits_uop_mem_cmd != 5'h6; // @[mshrs.scala 248:51]
  wire  _T_490 = _T_488 & _T_489; // @[mshrs.scala 247:60]
  wire [5:0] lo = rpq_io_deq_bits_addr[5:0]; // @[mshrs.scala 250:61]
  wire [39:0] _T_491 = {req_tag,req_idx,lo}; // @[Cat.scala 30:58]
  wire [1:0] size = rpq_io_deq_bits_uop_mem_size; // @[AMOALU.scala 10:17]
  wire  _T_499 = io_lb_read_ready & io_lb_read_valid; // @[Decoupled.scala 40:37]
  wire [31:0] shifted = _T_491[2] ? io_lb_resp[63:32] : io_lb_resp[31:0]; // @[AMOALU.scala 39:24]
  wire  _T_505 = rpq_io_deq_bits_uop_mem_signed & shifted[31]; // @[AMOALU.scala 42:76]
  wire [31:0] _T_507 = _T_505 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] hi_61 = size == 2'h2 ? _T_507 : io_lb_resp[63:32]; // @[AMOALU.scala 42:20]
  wire [63:0] _T_509 = {hi_61,shifted}; // @[Cat.scala 30:58]
  wire [15:0] shifted_1 = _T_491[1] ? _T_509[31:16] : _T_509[15:0]; // @[AMOALU.scala 39:24]
  wire  _T_513 = rpq_io_deq_bits_uop_mem_signed & shifted_1[15]; // @[AMOALU.scala 42:76]
  wire [47:0] _T_515 = _T_513 ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [47:0] hi_62 = size == 2'h1 ? _T_515 : _T_509[63:16]; // @[AMOALU.scala 42:20]
  wire [63:0] _T_517 = {hi_62,shifted_1}; // @[Cat.scala 30:58]
  wire [7:0] shifted_2 = _T_491[0] ? _T_517[15:8] : _T_517[7:0]; // @[AMOALU.scala 39:24]
  wire  _T_521 = rpq_io_deq_bits_uop_mem_signed & shifted_2[7]; // @[AMOALU.scala 42:76]
  wire [55:0] _T_523 = _T_521 ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [55:0] hi_63 = size == 2'h0 ? _T_523 : _T_517[63:8]; // @[AMOALU.scala 42:20]
  wire  _T_526 = rpq_io_deq_ready & rpq_io_deq_valid; // @[Decoupled.scala 40:37]
  wire  _T_528 = rpq_io_empty & ~commit_line; // @[mshrs.scala 271:31]
  wire  _T_529 = rpq_io_enq_ready & rpq_io_enq_valid; // @[Decoupled.scala 40:37]
  wire [4:0] _GEN_132 = ~_T_529 ? 5'he : state; // @[mshrs.scala 273:33 mshrs.scala 274:15 mshrs.scala 107:22]
  wire  _T_533 = rpq_io_empty | rpq_io_deq_valid & ~_T_490; // @[mshrs.scala 277:31]
  wire [4:0] _GEN_135 = rpq_io_empty | rpq_io_deq_valid & ~_T_490 ? 5'h4 : state; // @[mshrs.scala 277:69 mshrs.scala 281:13 mshrs.scala 107:22]
  wire [4:0] _GEN_136 = _T_528 ? _GEN_132 : _GEN_135; // @[mshrs.scala 272:5]
  wire  _GEN_138 = _T_528 ? 1'h0 : _T_533; // @[mshrs.scala 272:5 mshrs.scala 164:26]
  wire  _GEN_139 = _T_526 | commit_line; // @[mshrs.scala 268:30 mshrs.scala 269:21 mshrs.scala 140:24]
  wire [4:0] _GEN_140 = _T_526 ? state : _GEN_136; // @[mshrs.scala 268:30 mshrs.scala 107:22]
  wire  _GEN_142 = _T_526 ? 1'h0 : _GEN_138; // @[mshrs.scala 268:30 mshrs.scala 164:26]
  wire  _T_536 = ~grantack_valid; // @[mshrs.scala 284:53]
  wire  _T_541 = io_meta_read_ready & io_meta_read_valid; // @[Decoupled.scala 40:37]
  wire [4:0] _GEN_143 = _T_541 ? 5'h5 : state; // @[mshrs.scala 288:32 mshrs.scala 289:13 mshrs.scala 107:22]
  wire  _T_542 = state == 5'h5; // @[mshrs.scala 291:22]
  wire  _T_543 = state == 5'h6; // @[mshrs.scala 293:22]
  wire [3:0] _T_549 = {2'h2,io_meta_resp_bits_coh_state}; // @[Cat.scala 30:58]
  wire  _T_574 = 4'hb == _T_549; // @[Misc.scala 55:20]
  wire  _T_578 = 4'h4 == _T_549; // @[Misc.scala 55:20]
  wire  _T_579 = _T_578 ? 1'h0 : _T_574; // @[Misc.scala 37:9]
  wire  _T_582 = 4'h5 == _T_549; // @[Misc.scala 55:20]
  wire  _T_583 = _T_582 ? 1'h0 : _T_579; // @[Misc.scala 37:9]
  wire  _T_586 = 4'h6 == _T_549; // @[Misc.scala 55:20]
  wire  _T_587 = _T_586 ? 1'h0 : _T_583; // @[Misc.scala 37:9]
  wire  _T_590 = 4'h7 == _T_549; // @[Misc.scala 55:20]
  wire  _T_594 = 4'h0 == _T_549; // @[Misc.scala 55:20]
  wire  _T_595 = _T_594 ? 1'h0 : _T_590 | _T_587; // @[Misc.scala 37:9]
  wire  _T_598 = 4'h1 == _T_549; // @[Misc.scala 55:20]
  wire  _T_599 = _T_598 ? 1'h0 : _T_595; // @[Misc.scala 37:9]
  wire  _T_602 = 4'h2 == _T_549; // @[Misc.scala 55:20]
  wire  _T_603 = _T_602 ? 1'h0 : _T_599; // @[Misc.scala 37:9]
  wire  _T_606 = 4'h3 == _T_549; // @[Misc.scala 55:20]
  wire  _T_607 = _T_606 | _T_603; // @[Misc.scala 37:9]
  wire [4:0] _T_611 = _T_607 ? 5'h7 : 5'hb; // @[mshrs.scala 296:17]
  wire [4:0] _T_612 = ~io_meta_resp_valid ? 5'h4 : _T_611; // @[mshrs.scala 295:17]
  wire  _T_613 = state == 5'h7; // @[mshrs.scala 297:22]
  wire [4:0] _GEN_144 = _T_255 ? 5'h9 : state; // @[mshrs.scala 304:33 mshrs.scala 305:18 mshrs.scala 107:22]
  wire  _T_615 = state == 5'h9; // @[mshrs.scala 307:22]
  wire  _T_616 = io_wb_req_ready & io_wb_req_valid; // @[Decoupled.scala 40:37]
  wire [4:0] _GEN_145 = _T_616 ? 5'ha : state; // @[mshrs.scala 316:29 mshrs.scala 317:13 mshrs.scala 107:22]
  wire  _T_617 = state == 5'ha; // @[mshrs.scala 319:22]
  wire [4:0] _GEN_146 = io_wb_resp ? 5'hb : state; // @[mshrs.scala 320:23 mshrs.scala 321:13 mshrs.scala 107:22]
  wire  _T_618 = state == 5'hb; // @[mshrs.scala 323:22]
  wire [5:0] _T_620 = {refill_ctr, 3'h0}; // @[mshrs.scala 329:59]
  wire [39:0] _GEN_4292 = {{34'd0}, _T_620}; // @[mshrs.scala 329:45]
  wire [39:0] _T_621 = req_block_addr | _GEN_4292; // @[mshrs.scala 329:45]
  wire  _T_623 = io_refill_ready & io_refill_valid; // @[Decoupled.scala 40:37]
  wire [2:0] _T_625 = refill_ctr + 3'h1; // @[mshrs.scala 334:32]
  wire [4:0] _GEN_147 = refill_ctr == 3'h7 ? 5'hc : state; // @[mshrs.scala 335:52 mshrs.scala 336:15 mshrs.scala 107:22]
  wire [2:0] _GEN_148 = _T_623 ? _T_625 : refill_ctr; // @[mshrs.scala 333:29 mshrs.scala 334:18 mshrs.scala 139:24]
  wire [4:0] _GEN_149 = _T_623 ? _GEN_147 : state; // @[mshrs.scala 333:29 mshrs.scala 107:22]
  wire  _T_627 = state == 5'hc; // @[mshrs.scala 339:22]
  wire  _T_629 = io_replay_ready & io_replay_valid; // @[Decoupled.scala 40:37]
  wire  _T_653 = _T_629 & _T_486; // @[mshrs.scala 343:28]
  wire  c_cat_lo_5 = _T_486 | rpq_io_deq_bits_uop_mem_cmd == 5'h3 | _T_442; // @[Consts.scala 83:64]
  wire [3:0] _T_654 = {_T_486,c_cat_lo_5,new_coh_state}; // @[Cat.scala 30:58]
  wire  _T_667 = 4'hc == _T_654; // @[Misc.scala 48:20]
  wire [1:0] _T_669 = _T_667 ? 2'h1 : 2'h0; // @[Misc.scala 34:36]
  wire  _T_670 = 4'hd == _T_654; // @[Misc.scala 48:20]
  wire [1:0] _T_672 = _T_670 ? 2'h2 : _T_669; // @[Misc.scala 34:36]
  wire  _T_673 = 4'h4 == _T_654; // @[Misc.scala 48:20]
  wire [1:0] _T_675 = _T_673 ? 2'h1 : _T_672; // @[Misc.scala 34:36]
  wire  _T_676 = 4'h5 == _T_654; // @[Misc.scala 48:20]
  wire [1:0] _T_678 = _T_676 ? 2'h2 : _T_675; // @[Misc.scala 34:36]
  wire  _T_679 = 4'h0 == _T_654; // @[Misc.scala 48:20]
  wire [1:0] _T_681 = _T_679 ? 2'h0 : _T_678; // @[Misc.scala 34:36]
  wire  _T_682 = 4'he == _T_654; // @[Misc.scala 48:20]
  wire [1:0] _T_684 = _T_682 ? 2'h3 : _T_681; // @[Misc.scala 34:36]
  wire  _T_685 = 4'hf == _T_654; // @[Misc.scala 48:20]
  wire [1:0] _T_687 = _T_685 ? 2'h3 : _T_684; // @[Misc.scala 34:36]
  wire  _T_688 = 4'h6 == _T_654; // @[Misc.scala 48:20]
  wire [1:0] _T_690 = _T_688 ? 2'h2 : _T_687; // @[Misc.scala 34:36]
  wire  _T_691 = 4'h7 == _T_654; // @[Misc.scala 48:20]
  wire [1:0] _T_693 = _T_691 ? 2'h3 : _T_690; // @[Misc.scala 34:36]
  wire  _T_694 = 4'h1 == _T_654; // @[Misc.scala 48:20]
  wire [1:0] _T_696 = _T_694 ? 2'h1 : _T_693; // @[Misc.scala 34:36]
  wire  _T_697 = 4'h2 == _T_654; // @[Misc.scala 48:20]
  wire [1:0] _T_699 = _T_697 ? 2'h2 : _T_696; // @[Misc.scala 34:36]
  wire  _T_700 = 4'h3 == _T_654; // @[Misc.scala 48:20]
  wire  _T_701 = _T_700 | (_T_697 | (_T_694 | (_T_691 | (_T_688 | (_T_685 | _T_682))))); // @[Misc.scala 34:9]
  wire [1:0] meta_6_state = _T_700 ? 2'h3 : _T_699; // @[Misc.scala 34:36]
  wire [1:0] _GEN_150 = _T_629 & _T_486 ? meta_6_state : _GEN_5; // @[mshrs.scala 343:69 mshrs.scala 347:15]
  wire [4:0] _GEN_151 = rpq_io_empty & ~rpq_io_enq_valid ? 5'hd : state; // @[mshrs.scala 349:46 mshrs.scala 350:13 mshrs.scala 107:22]
  wire [4:0] _GEN_152 = _T_255 ? 5'he : state; // @[mshrs.scala 358:33 mshrs.scala 359:13 mshrs.scala 107:22]
  wire  _T_711 = io_mem_finish_ready & io_mem_finish_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_154 = _T_711 | _T_536 ? 1'h0 : grantack_valid; // @[mshrs.scala 365:52 mshrs.scala 366:22 mshrs.scala 138:21]
  wire [4:0] _GEN_155 = _T_711 | _T_536 ? 5'hf : state; // @[mshrs.scala 365:52 mshrs.scala 367:13 mshrs.scala 107:22]
  wire  _T_719 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch; // @[mshrs.scala 373:47]
  wire [1:0] _GEN_156 = _T_223 ? _T_224 : 2'h0; // @[mshrs.scala 377:21 mshrs.scala 378:17 mshrs.scala 381:17]
  wire [4:0] _GEN_157 = _T_223 ? 5'h4 : 5'h1; // @[mshrs.scala 377:21 mshrs.scala 379:15 mshrs.scala 382:15]
  wire  _GEN_162 = _T_244 ? 1'h0 : grant_had_data; // @[mshrs.scala 384:52 mshrs.scala 385:22 mshrs.scala 141:27]
  wire [1:0] _GEN_273 = _T_245 ? _GEN_156 : _GEN_118; // @[mshrs.scala 375:52]
  wire [4:0] _GEN_274 = _T_245 ? _GEN_157 : _GEN_119; // @[mshrs.scala 375:52]
  wire  _GEN_275 = _T_245 ? grant_had_data : _GEN_162; // @[mshrs.scala 375:52 mshrs.scala 141:27]
  wire  _GEN_276 = _T_245 ? grantack_valid : _GEN_10; // @[mshrs.scala 375:52 mshrs.scala 138:21]
  wire [2:0] _GEN_277 = _T_245 ? refill_ctr : _GEN_11; // @[mshrs.scala 375:52 mshrs.scala 139:24]
  wire  _GEN_279 = _T_245 ? req_way_en : _GEN_13; // @[mshrs.scala 375:52 mshrs.scala 109:20]
  wire [19:0] _GEN_280 = _T_245 ? req_old_meta_tag : _GEN_14; // @[mshrs.scala 375:52 mshrs.scala 109:20]
  wire [1:0] _GEN_281 = _T_245 ? req_old_meta_coh_state : _GEN_15; // @[mshrs.scala 375:52 mshrs.scala 109:20]
  wire [39:0] _GEN_285 = _T_245 ? req_addr : _GEN_19; // @[mshrs.scala 375:52 mshrs.scala 109:20]
  wire [4:0] _GEN_315 = _T_245 ? _GEN_4 : _GEN_49; // @[mshrs.scala 375:52]
  wire  _GEN_383 = _T_245 ? req_needs_wb : _GEN_117; // @[mshrs.scala 375:52 mshrs.scala 113:29]
  wire [4:0] _GEN_384 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch ? 5'h0 : _GEN_274; // @[mshrs.scala 373:69 mshrs.scala 374:13]
  wire [1:0] _GEN_385 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch ? _GEN_5 : _GEN_273; // @[mshrs.scala 373:69]
  wire  _GEN_386 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch ? grant_had_data : _GEN_275; // @[mshrs.scala 373:69 mshrs.scala 141:27]
  wire  _GEN_387 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch ? grantack_valid : _GEN_276; // @[mshrs.scala 373:69 mshrs.scala 138:21]
  wire [2:0] _GEN_388 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch ? refill_ctr : _GEN_277; // @[mshrs.scala 373:69 mshrs.scala 139:24]
  wire  _GEN_390 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch ? req_way_en : _GEN_279; // @[mshrs.scala 373:69 mshrs.scala 109:20]
  wire [19:0] _GEN_391 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch ? req_old_meta_tag : _GEN_280; // @[mshrs.scala 373:69 mshrs.scala 109:20]
  wire [1:0] _GEN_392 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch ? req_old_meta_coh_state : _GEN_281; // @[mshrs.scala 373:69 mshrs.scala 109:20]
  wire [39:0] _GEN_396 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch ? req_addr : _GEN_285; // @[mshrs.scala 373:69 mshrs.scala 109:20]
  wire [4:0] _GEN_426 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch ? _GEN_4 : _GEN_315; // @[mshrs.scala 373:69]
  wire  _GEN_494 = io_req_sec_val & ~io_req_sec_rdy | io_clear_prefetch ? req_needs_wb : _GEN_383; // @[mshrs.scala 373:69 mshrs.scala 113:29]
  wire [4:0] _GEN_496 = _T_271 ? _GEN_384 : state; // @[mshrs.scala 371:38 mshrs.scala 107:22]
  wire [1:0] _GEN_497 = _T_271 ? _GEN_385 : _GEN_5; // @[mshrs.scala 371:38]
  wire  _GEN_498 = _T_271 ? _GEN_386 : grant_had_data; // @[mshrs.scala 371:38 mshrs.scala 141:27]
  wire  _GEN_499 = _T_271 ? _GEN_387 : grantack_valid; // @[mshrs.scala 371:38 mshrs.scala 138:21]
  wire [2:0] _GEN_500 = _T_271 ? _GEN_388 : refill_ctr; // @[mshrs.scala 371:38 mshrs.scala 139:24]
  wire  _GEN_502 = _T_271 ? _GEN_390 : req_way_en; // @[mshrs.scala 371:38 mshrs.scala 109:20]
  wire [19:0] _GEN_503 = _T_271 ? _GEN_391 : req_old_meta_tag; // @[mshrs.scala 371:38 mshrs.scala 109:20]
  wire [1:0] _GEN_504 = _T_271 ? _GEN_392 : req_old_meta_coh_state; // @[mshrs.scala 371:38 mshrs.scala 109:20]
  wire [39:0] _GEN_508 = _T_271 ? _GEN_396 : req_addr; // @[mshrs.scala 371:38 mshrs.scala 109:20]
  wire [4:0] _GEN_538 = _T_271 ? _GEN_426 : _GEN_4; // @[mshrs.scala 371:38]
  wire  _GEN_606 = _T_271 ? _GEN_494 : req_needs_wb; // @[mshrs.scala 371:38 mshrs.scala 113:29]
  wire [4:0] _GEN_607 = _T_232 ? 5'h0 : _GEN_496; // @[mshrs.scala 369:42 mshrs.scala 370:11]
  wire  _GEN_608 = _T_232 ? 1'h0 : _T_271; // @[mshrs.scala 369:42 mshrs.scala 157:26]
  wire [1:0] _GEN_609 = _T_232 ? _GEN_5 : _GEN_497; // @[mshrs.scala 369:42]
  wire  _GEN_610 = _T_232 ? grant_had_data : _GEN_498; // @[mshrs.scala 369:42 mshrs.scala 141:27]
  wire  _GEN_611 = _T_232 ? grantack_valid : _GEN_499; // @[mshrs.scala 369:42 mshrs.scala 138:21]
  wire [2:0] _GEN_612 = _T_232 ? refill_ctr : _GEN_500; // @[mshrs.scala 369:42 mshrs.scala 139:24]
  wire  _GEN_614 = _T_232 ? req_way_en : _GEN_502; // @[mshrs.scala 369:42 mshrs.scala 109:20]
  wire [19:0] _GEN_615 = _T_232 ? req_old_meta_tag : _GEN_503; // @[mshrs.scala 369:42 mshrs.scala 109:20]
  wire [1:0] _GEN_616 = _T_232 ? req_old_meta_coh_state : _GEN_504; // @[mshrs.scala 369:42 mshrs.scala 109:20]
  wire [39:0] _GEN_620 = _T_232 ? req_addr : _GEN_508; // @[mshrs.scala 369:42 mshrs.scala 109:20]
  wire [4:0] _GEN_650 = _T_232 ? _GEN_4 : _GEN_538; // @[mshrs.scala 369:42]
  wire  _GEN_718 = _T_232 ? req_needs_wb : _GEN_606; // @[mshrs.scala 369:42 mshrs.scala 113:29]
  wire  _GEN_719 = _T_231 & grantack_valid; // @[mshrs.scala 362:42 mshrs.scala 363:25 mshrs.scala 168:26]
  wire  _GEN_721 = _T_231 ? _GEN_154 : _GEN_611; // @[mshrs.scala 362:42]
  wire [4:0] _GEN_722 = _T_231 ? _GEN_155 : _GEN_607; // @[mshrs.scala 362:42]
  wire  _GEN_723 = _T_231 ? 1'h0 : _GEN_608; // @[mshrs.scala 362:42 mshrs.scala 157:26]
  wire [1:0] _GEN_724 = _T_231 ? _GEN_5 : _GEN_609; // @[mshrs.scala 362:42]
  wire  _GEN_725 = _T_231 ? grant_had_data : _GEN_610; // @[mshrs.scala 362:42 mshrs.scala 141:27]
  wire [2:0] _GEN_726 = _T_231 ? refill_ctr : _GEN_612; // @[mshrs.scala 362:42 mshrs.scala 139:24]
  wire  _GEN_728 = _T_231 ? req_way_en : _GEN_614; // @[mshrs.scala 362:42 mshrs.scala 109:20]
  wire [19:0] _GEN_729 = _T_231 ? req_old_meta_tag : _GEN_615; // @[mshrs.scala 362:42 mshrs.scala 109:20]
  wire [1:0] _GEN_730 = _T_231 ? req_old_meta_coh_state : _GEN_616; // @[mshrs.scala 362:42 mshrs.scala 109:20]
  wire [39:0] _GEN_734 = _T_231 ? req_addr : _GEN_620; // @[mshrs.scala 362:42 mshrs.scala 109:20]
  wire [4:0] _GEN_764 = _T_231 ? _GEN_4 : _GEN_650; // @[mshrs.scala 362:42]
  wire  _GEN_832 = _T_231 ? req_needs_wb : _GEN_718; // @[mshrs.scala 362:42 mshrs.scala 113:29]
  wire [4:0] _GEN_838 = _T_230 ? _GEN_152 : _GEN_722; // @[mshrs.scala 352:44]
  wire  _GEN_840 = _T_230 ? 1'h0 : _GEN_719; // @[mshrs.scala 352:44 mshrs.scala 168:26]
  wire  _GEN_842 = _T_230 ? grantack_valid : _GEN_721; // @[mshrs.scala 352:44 mshrs.scala 138:21]
  wire  _GEN_843 = _T_230 ? 1'h0 : _GEN_723; // @[mshrs.scala 352:44 mshrs.scala 157:26]
  wire [1:0] _GEN_844 = _T_230 ? _GEN_5 : _GEN_724; // @[mshrs.scala 352:44]
  wire  _GEN_845 = _T_230 ? grant_had_data : _GEN_725; // @[mshrs.scala 352:44 mshrs.scala 141:27]
  wire [2:0] _GEN_846 = _T_230 ? refill_ctr : _GEN_726; // @[mshrs.scala 352:44 mshrs.scala 139:24]
  wire  _GEN_848 = _T_230 ? req_way_en : _GEN_728; // @[mshrs.scala 352:44 mshrs.scala 109:20]
  wire [19:0] _GEN_849 = _T_230 ? req_old_meta_tag : _GEN_729; // @[mshrs.scala 352:44 mshrs.scala 109:20]
  wire [1:0] _GEN_850 = _T_230 ? req_old_meta_coh_state : _GEN_730; // @[mshrs.scala 352:44 mshrs.scala 109:20]
  wire [39:0] _GEN_854 = _T_230 ? req_addr : _GEN_734; // @[mshrs.scala 352:44 mshrs.scala 109:20]
  wire [4:0] _GEN_884 = _T_230 ? _GEN_4 : _GEN_764; // @[mshrs.scala 352:44]
  wire  _GEN_952 = _T_230 ? req_needs_wb : _GEN_832; // @[mshrs.scala 352:44 mshrs.scala 113:29]
  wire  _GEN_1058 = state == 5'hc & rpq_io_deq_valid; // @[mshrs.scala 339:39 mshrs.scala 340:15 mshrs.scala 161:26]
  wire  _GEN_1059 = state == 5'hc & io_replay_ready; // @[mshrs.scala 339:39 mshrs.scala 340:15 mshrs.scala 135:20]
  wire [1:0] _GEN_1060 = state == 5'hc ? _GEN_150 : _GEN_844; // @[mshrs.scala 339:39]
  wire [4:0] _GEN_1061 = state == 5'hc ? _GEN_151 : _GEN_838; // @[mshrs.scala 339:39]
  wire  _GEN_1062 = state == 5'hc ? 1'h0 : _T_230; // @[mshrs.scala 339:39 mshrs.scala 156:26]
  wire  _GEN_1068 = state == 5'hc ? 1'h0 : _GEN_840; // @[mshrs.scala 339:39 mshrs.scala 168:26]
  wire  _GEN_1070 = state == 5'hc ? grantack_valid : _GEN_842; // @[mshrs.scala 339:39 mshrs.scala 138:21]
  wire  _GEN_1071 = state == 5'hc ? 1'h0 : _GEN_843; // @[mshrs.scala 339:39 mshrs.scala 157:26]
  wire  _GEN_1072 = state == 5'hc ? grant_had_data : _GEN_845; // @[mshrs.scala 339:39 mshrs.scala 141:27]
  wire [2:0] _GEN_1073 = state == 5'hc ? refill_ctr : _GEN_846; // @[mshrs.scala 339:39 mshrs.scala 139:24]
  wire  _GEN_1075 = state == 5'hc ? req_way_en : _GEN_848; // @[mshrs.scala 339:39 mshrs.scala 109:20]
  wire [19:0] _GEN_1076 = state == 5'hc ? req_old_meta_tag : _GEN_849; // @[mshrs.scala 339:39 mshrs.scala 109:20]
  wire [1:0] _GEN_1077 = state == 5'hc ? req_old_meta_coh_state : _GEN_850; // @[mshrs.scala 339:39 mshrs.scala 109:20]
  wire [39:0] _GEN_1081 = state == 5'hc ? req_addr : _GEN_854; // @[mshrs.scala 339:39 mshrs.scala 109:20]
  wire [4:0] _GEN_1111 = state == 5'hc ? _GEN_4 : _GEN_884; // @[mshrs.scala 339:39]
  wire  _GEN_1179 = state == 5'hc ? req_needs_wb : _GEN_952; // @[mshrs.scala 339:39 mshrs.scala 113:29]
  wire  _GEN_1183 = state == 5'hb & _T_499; // @[mshrs.scala 323:41 mshrs.scala 328:27 mshrs.scala 160:26]
  wire [2:0] _GEN_1188 = state == 5'hb ? _GEN_148 : _GEN_1073; // @[mshrs.scala 323:41]
  wire [4:0] _GEN_1189 = state == 5'hb ? _GEN_149 : _GEN_1061; // @[mshrs.scala 323:41]
  wire  _GEN_1295 = state == 5'hb ? 1'h0 : _GEN_1058; // @[mshrs.scala 323:41 mshrs.scala 161:26]
  wire  _GEN_1296 = state == 5'hb ? 1'h0 : _GEN_1059; // @[mshrs.scala 323:41 mshrs.scala 135:20]
  wire [1:0] _GEN_1297 = state == 5'hb ? _GEN_5 : _GEN_1060; // @[mshrs.scala 323:41]
  wire  _GEN_1298 = state == 5'hb ? 1'h0 : _GEN_1062; // @[mshrs.scala 323:41 mshrs.scala 156:26]
  wire  _GEN_1304 = state == 5'hb ? 1'h0 : _GEN_1068; // @[mshrs.scala 323:41 mshrs.scala 168:26]
  wire  _GEN_1306 = state == 5'hb ? grantack_valid : _GEN_1070; // @[mshrs.scala 323:41 mshrs.scala 138:21]
  wire  _GEN_1307 = state == 5'hb ? 1'h0 : _GEN_1071; // @[mshrs.scala 323:41 mshrs.scala 157:26]
  wire  _GEN_1308 = state == 5'hb ? grant_had_data : _GEN_1072; // @[mshrs.scala 323:41 mshrs.scala 141:27]
  wire  _GEN_1310 = state == 5'hb ? req_way_en : _GEN_1075; // @[mshrs.scala 323:41 mshrs.scala 109:20]
  wire [19:0] _GEN_1311 = state == 5'hb ? req_old_meta_tag : _GEN_1076; // @[mshrs.scala 323:41 mshrs.scala 109:20]
  wire [1:0] _GEN_1312 = state == 5'hb ? req_old_meta_coh_state : _GEN_1077; // @[mshrs.scala 323:41 mshrs.scala 109:20]
  wire [39:0] _GEN_1316 = state == 5'hb ? req_addr : _GEN_1081; // @[mshrs.scala 323:41 mshrs.scala 109:20]
  wire [4:0] _GEN_1346 = state == 5'hb ? _GEN_4 : _GEN_1111; // @[mshrs.scala 323:41]
  wire  _GEN_1414 = state == 5'hb ? req_needs_wb : _GEN_1179; // @[mshrs.scala 323:41 mshrs.scala 113:29]
  wire [4:0] _GEN_1415 = state == 5'ha ? _GEN_146 : _GEN_1189; // @[mshrs.scala 319:37]
  wire  _GEN_1416 = state == 5'ha ? 1'h0 : _T_618; // @[mshrs.scala 319:37 mshrs.scala 170:26]
  wire  _GEN_1419 = state == 5'ha ? 1'h0 : _GEN_1183; // @[mshrs.scala 319:37 mshrs.scala 160:26]
  wire [2:0] _GEN_1424 = state == 5'ha ? refill_ctr : _GEN_1188; // @[mshrs.scala 319:37 mshrs.scala 139:24]
  wire  _GEN_1530 = state == 5'ha ? 1'h0 : _GEN_1295; // @[mshrs.scala 319:37 mshrs.scala 161:26]
  wire  _GEN_1531 = state == 5'ha ? 1'h0 : _GEN_1296; // @[mshrs.scala 319:37 mshrs.scala 135:20]
  wire [1:0] _GEN_1532 = state == 5'ha ? _GEN_5 : _GEN_1297; // @[mshrs.scala 319:37]
  wire  _GEN_1533 = state == 5'ha ? 1'h0 : _GEN_1298; // @[mshrs.scala 319:37 mshrs.scala 156:26]
  wire  _GEN_1539 = state == 5'ha ? 1'h0 : _GEN_1304; // @[mshrs.scala 319:37 mshrs.scala 168:26]
  wire  _GEN_1541 = state == 5'ha ? grantack_valid : _GEN_1306; // @[mshrs.scala 319:37 mshrs.scala 138:21]
  wire  _GEN_1542 = state == 5'ha ? 1'h0 : _GEN_1307; // @[mshrs.scala 319:37 mshrs.scala 157:26]
  wire  _GEN_1543 = state == 5'ha ? grant_had_data : _GEN_1308; // @[mshrs.scala 319:37 mshrs.scala 141:27]
  wire  _GEN_1545 = state == 5'ha ? req_way_en : _GEN_1310; // @[mshrs.scala 319:37 mshrs.scala 109:20]
  wire [19:0] _GEN_1546 = state == 5'ha ? req_old_meta_tag : _GEN_1311; // @[mshrs.scala 319:37 mshrs.scala 109:20]
  wire [1:0] _GEN_1547 = state == 5'ha ? req_old_meta_coh_state : _GEN_1312; // @[mshrs.scala 319:37 mshrs.scala 109:20]
  wire [39:0] _GEN_1551 = state == 5'ha ? req_addr : _GEN_1316; // @[mshrs.scala 319:37 mshrs.scala 109:20]
  wire [4:0] _GEN_1581 = state == 5'ha ? _GEN_4 : _GEN_1346; // @[mshrs.scala 319:37]
  wire  _GEN_1649 = state == 5'ha ? req_needs_wb : _GEN_1414; // @[mshrs.scala 319:37 mshrs.scala 113:29]
  wire [4:0] _GEN_1657 = state == 5'h9 ? _GEN_145 : _GEN_1415; // @[mshrs.scala 307:36]
  wire  _GEN_1658 = state == 5'h9 ? 1'h0 : _GEN_1416; // @[mshrs.scala 307:36 mshrs.scala 170:26]
  wire  _GEN_1661 = state == 5'h9 ? 1'h0 : _GEN_1419; // @[mshrs.scala 307:36 mshrs.scala 160:26]
  wire [2:0] _GEN_1666 = state == 5'h9 ? refill_ctr : _GEN_1424; // @[mshrs.scala 307:36 mshrs.scala 139:24]
  wire  _GEN_1772 = state == 5'h9 ? 1'h0 : _GEN_1530; // @[mshrs.scala 307:36 mshrs.scala 161:26]
  wire  _GEN_1773 = state == 5'h9 ? 1'h0 : _GEN_1531; // @[mshrs.scala 307:36 mshrs.scala 135:20]
  wire [1:0] _GEN_1774 = state == 5'h9 ? _GEN_5 : _GEN_1532; // @[mshrs.scala 307:36]
  wire  _GEN_1775 = state == 5'h9 ? 1'h0 : _GEN_1533; // @[mshrs.scala 307:36 mshrs.scala 156:26]
  wire  _GEN_1781 = state == 5'h9 ? 1'h0 : _GEN_1539; // @[mshrs.scala 307:36 mshrs.scala 168:26]
  wire  _GEN_1783 = state == 5'h9 ? grantack_valid : _GEN_1541; // @[mshrs.scala 307:36 mshrs.scala 138:21]
  wire  _GEN_1784 = state == 5'h9 ? 1'h0 : _GEN_1542; // @[mshrs.scala 307:36 mshrs.scala 157:26]
  wire  _GEN_1785 = state == 5'h9 ? grant_had_data : _GEN_1543; // @[mshrs.scala 307:36 mshrs.scala 141:27]
  wire  _GEN_1787 = state == 5'h9 ? req_way_en : _GEN_1545; // @[mshrs.scala 307:36 mshrs.scala 109:20]
  wire [19:0] _GEN_1788 = state == 5'h9 ? req_old_meta_tag : _GEN_1546; // @[mshrs.scala 307:36 mshrs.scala 109:20]
  wire [1:0] _GEN_1789 = state == 5'h9 ? req_old_meta_coh_state : _GEN_1547; // @[mshrs.scala 307:36 mshrs.scala 109:20]
  wire [39:0] _GEN_1793 = state == 5'h9 ? req_addr : _GEN_1551; // @[mshrs.scala 307:36 mshrs.scala 109:20]
  wire [4:0] _GEN_1823 = state == 5'h9 ? _GEN_4 : _GEN_1581; // @[mshrs.scala 307:36]
  wire  _GEN_1891 = state == 5'h9 ? req_needs_wb : _GEN_1649; // @[mshrs.scala 307:36 mshrs.scala 113:29]
  wire  _GEN_1892 = state == 5'h7 | _GEN_1775; // @[mshrs.scala 297:40 mshrs.scala 298:33]
  wire [4:0] _GEN_1897 = state == 5'h7 ? _GEN_144 : _GEN_1657; // @[mshrs.scala 297:40]
  wire  _GEN_1898 = state == 5'h7 ? 1'h0 : _T_615; // @[mshrs.scala 297:40 mshrs.scala 162:26]
  wire  _GEN_1905 = state == 5'h7 ? 1'h0 : _GEN_1658; // @[mshrs.scala 297:40 mshrs.scala 170:26]
  wire  _GEN_1908 = state == 5'h7 ? 1'h0 : _GEN_1661; // @[mshrs.scala 297:40 mshrs.scala 160:26]
  wire [2:0] _GEN_1913 = state == 5'h7 ? refill_ctr : _GEN_1666; // @[mshrs.scala 297:40 mshrs.scala 139:24]
  wire  _GEN_2019 = state == 5'h7 ? 1'h0 : _GEN_1772; // @[mshrs.scala 297:40 mshrs.scala 161:26]
  wire  _GEN_2020 = state == 5'h7 ? 1'h0 : _GEN_1773; // @[mshrs.scala 297:40 mshrs.scala 135:20]
  wire [1:0] _GEN_2021 = state == 5'h7 ? _GEN_5 : _GEN_1774; // @[mshrs.scala 297:40]
  wire  _GEN_2023 = state == 5'h7 ? 1'h0 : _GEN_1781; // @[mshrs.scala 297:40 mshrs.scala 168:26]
  wire  _GEN_2025 = state == 5'h7 ? grantack_valid : _GEN_1783; // @[mshrs.scala 297:40 mshrs.scala 138:21]
  wire  _GEN_2026 = state == 5'h7 ? 1'h0 : _GEN_1784; // @[mshrs.scala 297:40 mshrs.scala 157:26]
  wire  _GEN_2027 = state == 5'h7 ? grant_had_data : _GEN_1785; // @[mshrs.scala 297:40 mshrs.scala 141:27]
  wire  _GEN_2029 = state == 5'h7 ? req_way_en : _GEN_1787; // @[mshrs.scala 297:40 mshrs.scala 109:20]
  wire [19:0] _GEN_2030 = state == 5'h7 ? req_old_meta_tag : _GEN_1788; // @[mshrs.scala 297:40 mshrs.scala 109:20]
  wire [1:0] _GEN_2031 = state == 5'h7 ? req_old_meta_coh_state : _GEN_1789; // @[mshrs.scala 297:40 mshrs.scala 109:20]
  wire [39:0] _GEN_2035 = state == 5'h7 ? req_addr : _GEN_1793; // @[mshrs.scala 297:40 mshrs.scala 109:20]
  wire [4:0] _GEN_2065 = state == 5'h7 ? _GEN_4 : _GEN_1823; // @[mshrs.scala 297:40]
  wire  _GEN_2133 = state == 5'h7 ? req_needs_wb : _GEN_1891; // @[mshrs.scala 297:40 mshrs.scala 113:29]
  wire [4:0] _GEN_2134 = state == 5'h6 ? _T_612 : _GEN_1897; // @[mshrs.scala 293:41 mshrs.scala 295:11]
  wire  _GEN_2135 = state == 5'h6 ? 1'h0 : _GEN_1892; // @[mshrs.scala 293:41 mshrs.scala 156:26]
  wire  _GEN_2140 = state == 5'h6 ? 1'h0 : _GEN_1898; // @[mshrs.scala 293:41 mshrs.scala 162:26]
  wire  _GEN_2147 = state == 5'h6 ? 1'h0 : _GEN_1905; // @[mshrs.scala 293:41 mshrs.scala 170:26]
  wire  _GEN_2150 = state == 5'h6 ? 1'h0 : _GEN_1908; // @[mshrs.scala 293:41 mshrs.scala 160:26]
  wire [2:0] _GEN_2155 = state == 5'h6 ? refill_ctr : _GEN_1913; // @[mshrs.scala 293:41 mshrs.scala 139:24]
  wire  _GEN_2261 = state == 5'h6 ? 1'h0 : _GEN_2019; // @[mshrs.scala 293:41 mshrs.scala 161:26]
  wire  _GEN_2262 = state == 5'h6 ? 1'h0 : _GEN_2020; // @[mshrs.scala 293:41 mshrs.scala 135:20]
  wire [1:0] _GEN_2263 = state == 5'h6 ? _GEN_5 : _GEN_2021; // @[mshrs.scala 293:41]
  wire  _GEN_2265 = state == 5'h6 ? 1'h0 : _GEN_2023; // @[mshrs.scala 293:41 mshrs.scala 168:26]
  wire  _GEN_2267 = state == 5'h6 ? grantack_valid : _GEN_2025; // @[mshrs.scala 293:41 mshrs.scala 138:21]
  wire  _GEN_2268 = state == 5'h6 ? 1'h0 : _GEN_2026; // @[mshrs.scala 293:41 mshrs.scala 157:26]
  wire  _GEN_2269 = state == 5'h6 ? grant_had_data : _GEN_2027; // @[mshrs.scala 293:41 mshrs.scala 141:27]
  wire  _GEN_2271 = state == 5'h6 ? req_way_en : _GEN_2029; // @[mshrs.scala 293:41 mshrs.scala 109:20]
  wire [19:0] _GEN_2272 = state == 5'h6 ? req_old_meta_tag : _GEN_2030; // @[mshrs.scala 293:41 mshrs.scala 109:20]
  wire [1:0] _GEN_2273 = state == 5'h6 ? req_old_meta_coh_state : _GEN_2031; // @[mshrs.scala 293:41 mshrs.scala 109:20]
  wire [39:0] _GEN_2277 = state == 5'h6 ? req_addr : _GEN_2035; // @[mshrs.scala 293:41 mshrs.scala 109:20]
  wire [4:0] _GEN_2307 = state == 5'h6 ? _GEN_4 : _GEN_2065; // @[mshrs.scala 293:41]
  wire  _GEN_2375 = state == 5'h6 ? req_needs_wb : _GEN_2133; // @[mshrs.scala 293:41 mshrs.scala 113:29]
  wire [4:0] _GEN_2376 = state == 5'h5 ? 5'h6 : _GEN_2134; // @[mshrs.scala 291:41 mshrs.scala 292:11]
  wire  _GEN_2377 = state == 5'h5 ? 1'h0 : _GEN_2135; // @[mshrs.scala 291:41 mshrs.scala 156:26]
  wire  _GEN_2382 = state == 5'h5 ? 1'h0 : _GEN_2140; // @[mshrs.scala 291:41 mshrs.scala 162:26]
  wire  _GEN_2389 = state == 5'h5 ? 1'h0 : _GEN_2147; // @[mshrs.scala 291:41 mshrs.scala 170:26]
  wire  _GEN_2392 = state == 5'h5 ? 1'h0 : _GEN_2150; // @[mshrs.scala 291:41 mshrs.scala 160:26]
  wire [2:0] _GEN_2397 = state == 5'h5 ? refill_ctr : _GEN_2155; // @[mshrs.scala 291:41 mshrs.scala 139:24]
  wire  _GEN_2503 = state == 5'h5 ? 1'h0 : _GEN_2261; // @[mshrs.scala 291:41 mshrs.scala 161:26]
  wire  _GEN_2504 = state == 5'h5 ? 1'h0 : _GEN_2262; // @[mshrs.scala 291:41 mshrs.scala 135:20]
  wire [1:0] _GEN_2505 = state == 5'h5 ? _GEN_5 : _GEN_2263; // @[mshrs.scala 291:41]
  wire  _GEN_2507 = state == 5'h5 ? 1'h0 : _GEN_2265; // @[mshrs.scala 291:41 mshrs.scala 168:26]
  wire  _GEN_2509 = state == 5'h5 ? grantack_valid : _GEN_2267; // @[mshrs.scala 291:41 mshrs.scala 138:21]
  wire  _GEN_2510 = state == 5'h5 ? 1'h0 : _GEN_2268; // @[mshrs.scala 291:41 mshrs.scala 157:26]
  wire  _GEN_2511 = state == 5'h5 ? grant_had_data : _GEN_2269; // @[mshrs.scala 291:41 mshrs.scala 141:27]
  wire  _GEN_2513 = state == 5'h5 ? req_way_en : _GEN_2271; // @[mshrs.scala 291:41 mshrs.scala 109:20]
  wire [19:0] _GEN_2514 = state == 5'h5 ? req_old_meta_tag : _GEN_2272; // @[mshrs.scala 291:41 mshrs.scala 109:20]
  wire [1:0] _GEN_2515 = state == 5'h5 ? req_old_meta_coh_state : _GEN_2273; // @[mshrs.scala 291:41 mshrs.scala 109:20]
  wire [39:0] _GEN_2519 = state == 5'h5 ? req_addr : _GEN_2277; // @[mshrs.scala 291:41 mshrs.scala 109:20]
  wire [4:0] _GEN_2549 = state == 5'h5 ? _GEN_4 : _GEN_2307; // @[mshrs.scala 291:41]
  wire  _GEN_2617 = state == 5'h5 ? req_needs_wb : _GEN_2375; // @[mshrs.scala 291:41 mshrs.scala 113:29]
  wire  _GEN_2618 = _T_264 & (~io_prober_state_valid | ~grantack_valid | io_prober_state_bits[11:6] != req_idx); // @[mshrs.scala 283:39 mshrs.scala 284:24 mshrs.scala 167:26]
  wire [4:0] _GEN_2622 = _T_264 ? _GEN_143 : _GEN_2376; // @[mshrs.scala 283:39]
  wire  _GEN_2623 = _T_264 ? 1'h0 : _GEN_2377; // @[mshrs.scala 283:39 mshrs.scala 156:26]
  wire  _GEN_2628 = _T_264 ? 1'h0 : _GEN_2382; // @[mshrs.scala 283:39 mshrs.scala 162:26]
  wire  _GEN_2635 = _T_264 ? 1'h0 : _GEN_2389; // @[mshrs.scala 283:39 mshrs.scala 170:26]
  wire  _GEN_2638 = _T_264 ? 1'h0 : _GEN_2392; // @[mshrs.scala 283:39 mshrs.scala 160:26]
  wire [2:0] _GEN_2643 = _T_264 ? refill_ctr : _GEN_2397; // @[mshrs.scala 283:39 mshrs.scala 139:24]
  wire  _GEN_2749 = _T_264 ? 1'h0 : _GEN_2503; // @[mshrs.scala 283:39 mshrs.scala 161:26]
  wire  _GEN_2750 = _T_264 ? 1'h0 : _GEN_2504; // @[mshrs.scala 283:39 mshrs.scala 135:20]
  wire [1:0] _GEN_2751 = _T_264 ? _GEN_5 : _GEN_2505; // @[mshrs.scala 283:39]
  wire  _GEN_2753 = _T_264 ? 1'h0 : _GEN_2507; // @[mshrs.scala 283:39 mshrs.scala 168:26]
  wire  _GEN_2755 = _T_264 ? grantack_valid : _GEN_2509; // @[mshrs.scala 283:39 mshrs.scala 138:21]
  wire  _GEN_2756 = _T_264 ? 1'h0 : _GEN_2510; // @[mshrs.scala 283:39 mshrs.scala 157:26]
  wire  _GEN_2757 = _T_264 ? grant_had_data : _GEN_2511; // @[mshrs.scala 283:39 mshrs.scala 141:27]
  wire  _GEN_2759 = _T_264 ? req_way_en : _GEN_2513; // @[mshrs.scala 283:39 mshrs.scala 109:20]
  wire [19:0] _GEN_2760 = _T_264 ? req_old_meta_tag : _GEN_2514; // @[mshrs.scala 283:39 mshrs.scala 109:20]
  wire [1:0] _GEN_2761 = _T_264 ? req_old_meta_coh_state : _GEN_2515; // @[mshrs.scala 283:39 mshrs.scala 109:20]
  wire [39:0] _GEN_2765 = _T_264 ? req_addr : _GEN_2519; // @[mshrs.scala 283:39 mshrs.scala 109:20]
  wire [4:0] _GEN_2795 = _T_264 ? _GEN_4 : _GEN_2549; // @[mshrs.scala 283:39]
  wire  _GEN_2863 = _T_264 ? req_needs_wb : _GEN_2617; // @[mshrs.scala 283:39 mshrs.scala 113:29]
  wire  _GEN_2864 = _T_260 ? io_resp_ready & io_lb_read_ready & _T_490 : _GEN_2750; // @[mshrs.scala 245:45 mshrs.scala 259:28]
  wire  _GEN_2865 = _T_260 ? rpq_io_deq_valid & _T_490 : _GEN_2635; // @[mshrs.scala 245:45 mshrs.scala 260:28]
  wire [36:0] _GEN_2867 = _T_260 ? rpq_io_deq_bits_addr[39:3] : {{34'd0}, refill_ctr}; // @[mshrs.scala 245:45 mshrs.scala 262:28]
  wire  _GEN_2868 = _T_260 & (rpq_io_deq_valid & _T_499 & _T_490); // @[mshrs.scala 245:45 mshrs.scala 264:23 mshrs.scala 163:26]
  wire [4:0] _GEN_2969 = _T_260 ? _GEN_140 : _GEN_2622; // @[mshrs.scala 245:45]
  wire  _GEN_2971 = _T_260 & _GEN_142; // @[mshrs.scala 245:45 mshrs.scala 164:26]
  wire  _GEN_2972 = _T_260 ? 1'h0 : _GEN_2618; // @[mshrs.scala 245:45 mshrs.scala 167:26]
  wire  _GEN_2976 = _T_260 ? 1'h0 : _GEN_2623; // @[mshrs.scala 245:45 mshrs.scala 156:26]
  wire  _GEN_2981 = _T_260 ? 1'h0 : _GEN_2628; // @[mshrs.scala 245:45 mshrs.scala 162:26]
  wire  _GEN_2988 = _T_260 ? 1'h0 : _GEN_2638; // @[mshrs.scala 245:45 mshrs.scala 160:26]
  wire  _GEN_3099 = _T_260 ? 1'h0 : _GEN_2749; // @[mshrs.scala 245:45 mshrs.scala 161:26]
  wire [1:0] _GEN_3100 = _T_260 ? _GEN_5 : _GEN_2751; // @[mshrs.scala 245:45]
  wire  _GEN_3101 = _T_260 ? 1'h0 : _GEN_2753; // @[mshrs.scala 245:45 mshrs.scala 168:26]
  wire  _GEN_3104 = _T_260 ? 1'h0 : _GEN_2756; // @[mshrs.scala 245:45 mshrs.scala 157:26]
  wire  _GEN_3211 = _T_260 ? req_needs_wb : _GEN_2863; // @[mshrs.scala 245:45 mshrs.scala 113:29]
  wire  _GEN_3213 = _T_259 & _GEN_122; // @[mshrs.scala 222:41 mshrs.scala 169:26]
  wire  _GEN_3223 = _T_259 ? 1'h0 : _GEN_2864; // @[mshrs.scala 222:41 mshrs.scala 135:20]
  wire  _GEN_3224 = _T_259 ? 1'h0 : _GEN_2865; // @[mshrs.scala 222:41 mshrs.scala 170:26]
  wire  _GEN_3227 = _T_259 ? 1'h0 : _GEN_2868; // @[mshrs.scala 222:41 mshrs.scala 163:26]
  wire  _GEN_3328 = _T_259 ? 1'h0 : _GEN_2971; // @[mshrs.scala 222:41 mshrs.scala 164:26]
  wire  _GEN_3329 = _T_259 ? 1'h0 : _GEN_2972; // @[mshrs.scala 222:41 mshrs.scala 167:26]
  wire  _GEN_3333 = _T_259 ? 1'h0 : _GEN_2976; // @[mshrs.scala 222:41 mshrs.scala 156:26]
  wire  _GEN_3338 = _T_259 ? 1'h0 : _GEN_2981; // @[mshrs.scala 222:41 mshrs.scala 162:26]
  wire  _GEN_3345 = _T_259 ? 1'h0 : _GEN_2988; // @[mshrs.scala 222:41 mshrs.scala 160:26]
  wire  _GEN_3456 = _T_259 ? 1'h0 : _GEN_3099; // @[mshrs.scala 222:41 mshrs.scala 161:26]
  wire  _GEN_3457 = _T_259 ? 1'h0 : _GEN_3101; // @[mshrs.scala 222:41 mshrs.scala 168:26]
  wire  _GEN_3459 = _T_259 ? 1'h0 : _GEN_3104; // @[mshrs.scala 222:41 mshrs.scala 157:26]
  wire  _GEN_3577 = _T_258 ? 1'h0 : _GEN_3213; // @[mshrs.scala 211:40 mshrs.scala 169:26]
  wire  _GEN_3586 = _T_258 ? 1'h0 : _GEN_3223; // @[mshrs.scala 211:40 mshrs.scala 135:20]
  wire  _GEN_3587 = _T_258 ? 1'h0 : _GEN_3224; // @[mshrs.scala 211:40 mshrs.scala 170:26]
  wire  _GEN_3590 = _T_258 ? 1'h0 : _GEN_3227; // @[mshrs.scala 211:40 mshrs.scala 163:26]
  wire  _GEN_3691 = _T_258 ? 1'h0 : _GEN_3328; // @[mshrs.scala 211:40 mshrs.scala 164:26]
  wire  _GEN_3692 = _T_258 ? 1'h0 : _GEN_3329; // @[mshrs.scala 211:40 mshrs.scala 167:26]
  wire  _GEN_3696 = _T_258 ? 1'h0 : _GEN_3333; // @[mshrs.scala 211:40 mshrs.scala 156:26]
  wire  _GEN_3701 = _T_258 ? 1'h0 : _GEN_3338; // @[mshrs.scala 211:40 mshrs.scala 162:26]
  wire  _GEN_3708 = _T_258 ? 1'h0 : _GEN_3345; // @[mshrs.scala 211:40 mshrs.scala 160:26]
  wire  _GEN_3819 = _T_258 ? 1'h0 : _GEN_3456; // @[mshrs.scala 211:40 mshrs.scala 161:26]
  wire  _GEN_3820 = _T_258 ? 1'h0 : _GEN_3457; // @[mshrs.scala 211:40 mshrs.scala 168:26]
  wire  _GEN_3822 = _T_258 ? 1'h0 : _GEN_3459; // @[mshrs.scala 211:40 mshrs.scala 157:26]
  wire  _GEN_4293 = _T_229 & _T_244; // @[mshrs.scala 183:11]
  wire  _GEN_4303 = ~_T_229 & ~_T_258; // @[mshrs.scala 240:13]
  wire  _GEN_4331 = _GEN_4303 & ~_T_259 & ~_T_260 & ~_T_264 & ~_T_542 & ~_T_543 & ~_T_613 & ~_T_615 & ~_T_617 & ~_T_618; // @[mshrs.scala 346:13]
  wire  _GEN_4391 = _GEN_4331 & ~_T_627 & ~_T_230 & ~_T_231 & ~_T_232 & _T_271 & ~_T_719 & ~_T_245 & _T_244; // @[mshrs.scala 183:11]
  BranchKillableQueue rpq ( // @[mshrs.scala 128:19]
    .clock(rpq_clock),
    .reset(rpq_reset),
    .io_enq_ready(rpq_io_enq_ready),
    .io_enq_valid(rpq_io_enq_valid),
    .io_enq_bits_uop_switch(rpq_io_enq_bits_uop_switch),
    .io_enq_bits_uop_switch_off(rpq_io_enq_bits_uop_switch_off),
    .io_enq_bits_uop_is_unicore(rpq_io_enq_bits_uop_is_unicore),
    .io_enq_bits_uop_shift(rpq_io_enq_bits_uop_shift),
    .io_enq_bits_uop_lrs3_rtype(rpq_io_enq_bits_uop_lrs3_rtype),
    .io_enq_bits_uop_rflag(rpq_io_enq_bits_uop_rflag),
    .io_enq_bits_uop_wflag(rpq_io_enq_bits_uop_wflag),
    .io_enq_bits_uop_prflag(rpq_io_enq_bits_uop_prflag),
    .io_enq_bits_uop_pwflag(rpq_io_enq_bits_uop_pwflag),
    .io_enq_bits_uop_pflag_busy(rpq_io_enq_bits_uop_pflag_busy),
    .io_enq_bits_uop_stale_pflag(rpq_io_enq_bits_uop_stale_pflag),
    .io_enq_bits_uop_op1_sel(rpq_io_enq_bits_uop_op1_sel),
    .io_enq_bits_uop_op2_sel(rpq_io_enq_bits_uop_op2_sel),
    .io_enq_bits_uop_split_num(rpq_io_enq_bits_uop_split_num),
    .io_enq_bits_uop_self_index(rpq_io_enq_bits_uop_self_index),
    .io_enq_bits_uop_rob_inst_idx(rpq_io_enq_bits_uop_rob_inst_idx),
    .io_enq_bits_uop_address_num(rpq_io_enq_bits_uop_address_num),
    .io_enq_bits_uop_uopc(rpq_io_enq_bits_uop_uopc),
    .io_enq_bits_uop_inst(rpq_io_enq_bits_uop_inst),
    .io_enq_bits_uop_debug_inst(rpq_io_enq_bits_uop_debug_inst),
    .io_enq_bits_uop_is_rvc(rpq_io_enq_bits_uop_is_rvc),
    .io_enq_bits_uop_debug_pc(rpq_io_enq_bits_uop_debug_pc),
    .io_enq_bits_uop_iq_type(rpq_io_enq_bits_uop_iq_type),
    .io_enq_bits_uop_fu_code(rpq_io_enq_bits_uop_fu_code),
    .io_enq_bits_uop_ctrl_br_type(rpq_io_enq_bits_uop_ctrl_br_type),
    .io_enq_bits_uop_ctrl_op1_sel(rpq_io_enq_bits_uop_ctrl_op1_sel),
    .io_enq_bits_uop_ctrl_op2_sel(rpq_io_enq_bits_uop_ctrl_op2_sel),
    .io_enq_bits_uop_ctrl_imm_sel(rpq_io_enq_bits_uop_ctrl_imm_sel),
    .io_enq_bits_uop_ctrl_op_fcn(rpq_io_enq_bits_uop_ctrl_op_fcn),
    .io_enq_bits_uop_ctrl_fcn_dw(rpq_io_enq_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_uop_ctrl_csr_cmd(rpq_io_enq_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_uop_ctrl_is_load(rpq_io_enq_bits_uop_ctrl_is_load),
    .io_enq_bits_uop_ctrl_is_sta(rpq_io_enq_bits_uop_ctrl_is_sta),
    .io_enq_bits_uop_ctrl_is_std(rpq_io_enq_bits_uop_ctrl_is_std),
    .io_enq_bits_uop_ctrl_op3_sel(rpq_io_enq_bits_uop_ctrl_op3_sel),
    .io_enq_bits_uop_iw_state(rpq_io_enq_bits_uop_iw_state),
    .io_enq_bits_uop_iw_p1_poisoned(rpq_io_enq_bits_uop_iw_p1_poisoned),
    .io_enq_bits_uop_iw_p2_poisoned(rpq_io_enq_bits_uop_iw_p2_poisoned),
    .io_enq_bits_uop_is_br(rpq_io_enq_bits_uop_is_br),
    .io_enq_bits_uop_is_jalr(rpq_io_enq_bits_uop_is_jalr),
    .io_enq_bits_uop_is_jal(rpq_io_enq_bits_uop_is_jal),
    .io_enq_bits_uop_is_sfb(rpq_io_enq_bits_uop_is_sfb),
    .io_enq_bits_uop_br_mask(rpq_io_enq_bits_uop_br_mask),
    .io_enq_bits_uop_br_tag(rpq_io_enq_bits_uop_br_tag),
    .io_enq_bits_uop_ftq_idx(rpq_io_enq_bits_uop_ftq_idx),
    .io_enq_bits_uop_edge_inst(rpq_io_enq_bits_uop_edge_inst),
    .io_enq_bits_uop_pc_lob(rpq_io_enq_bits_uop_pc_lob),
    .io_enq_bits_uop_taken(rpq_io_enq_bits_uop_taken),
    .io_enq_bits_uop_imm_packed(rpq_io_enq_bits_uop_imm_packed),
    .io_enq_bits_uop_csr_addr(rpq_io_enq_bits_uop_csr_addr),
    .io_enq_bits_uop_rob_idx(rpq_io_enq_bits_uop_rob_idx),
    .io_enq_bits_uop_ldq_idx(rpq_io_enq_bits_uop_ldq_idx),
    .io_enq_bits_uop_stq_idx(rpq_io_enq_bits_uop_stq_idx),
    .io_enq_bits_uop_rxq_idx(rpq_io_enq_bits_uop_rxq_idx),
    .io_enq_bits_uop_pdst(rpq_io_enq_bits_uop_pdst),
    .io_enq_bits_uop_prs1(rpq_io_enq_bits_uop_prs1),
    .io_enq_bits_uop_prs2(rpq_io_enq_bits_uop_prs2),
    .io_enq_bits_uop_prs3(rpq_io_enq_bits_uop_prs3),
    .io_enq_bits_uop_ppred(rpq_io_enq_bits_uop_ppred),
    .io_enq_bits_uop_prs1_busy(rpq_io_enq_bits_uop_prs1_busy),
    .io_enq_bits_uop_prs2_busy(rpq_io_enq_bits_uop_prs2_busy),
    .io_enq_bits_uop_prs3_busy(rpq_io_enq_bits_uop_prs3_busy),
    .io_enq_bits_uop_ppred_busy(rpq_io_enq_bits_uop_ppred_busy),
    .io_enq_bits_uop_stale_pdst(rpq_io_enq_bits_uop_stale_pdst),
    .io_enq_bits_uop_exception(rpq_io_enq_bits_uop_exception),
    .io_enq_bits_uop_exc_cause(rpq_io_enq_bits_uop_exc_cause),
    .io_enq_bits_uop_bypassable(rpq_io_enq_bits_uop_bypassable),
    .io_enq_bits_uop_mem_cmd(rpq_io_enq_bits_uop_mem_cmd),
    .io_enq_bits_uop_mem_size(rpq_io_enq_bits_uop_mem_size),
    .io_enq_bits_uop_mem_signed(rpq_io_enq_bits_uop_mem_signed),
    .io_enq_bits_uop_is_fence(rpq_io_enq_bits_uop_is_fence),
    .io_enq_bits_uop_is_fencei(rpq_io_enq_bits_uop_is_fencei),
    .io_enq_bits_uop_is_amo(rpq_io_enq_bits_uop_is_amo),
    .io_enq_bits_uop_uses_ldq(rpq_io_enq_bits_uop_uses_ldq),
    .io_enq_bits_uop_uses_stq(rpq_io_enq_bits_uop_uses_stq),
    .io_enq_bits_uop_is_sys_pc2epc(rpq_io_enq_bits_uop_is_sys_pc2epc),
    .io_enq_bits_uop_is_unique(rpq_io_enq_bits_uop_is_unique),
    .io_enq_bits_uop_flush_on_commit(rpq_io_enq_bits_uop_flush_on_commit),
    .io_enq_bits_uop_ldst_is_rs1(rpq_io_enq_bits_uop_ldst_is_rs1),
    .io_enq_bits_uop_ldst(rpq_io_enq_bits_uop_ldst),
    .io_enq_bits_uop_lrs1(rpq_io_enq_bits_uop_lrs1),
    .io_enq_bits_uop_lrs2(rpq_io_enq_bits_uop_lrs2),
    .io_enq_bits_uop_lrs3(rpq_io_enq_bits_uop_lrs3),
    .io_enq_bits_uop_ldst_val(rpq_io_enq_bits_uop_ldst_val),
    .io_enq_bits_uop_dst_rtype(rpq_io_enq_bits_uop_dst_rtype),
    .io_enq_bits_uop_lrs1_rtype(rpq_io_enq_bits_uop_lrs1_rtype),
    .io_enq_bits_uop_lrs2_rtype(rpq_io_enq_bits_uop_lrs2_rtype),
    .io_enq_bits_uop_frs3_en(rpq_io_enq_bits_uop_frs3_en),
    .io_enq_bits_uop_fp_val(rpq_io_enq_bits_uop_fp_val),
    .io_enq_bits_uop_fp_single(rpq_io_enq_bits_uop_fp_single),
    .io_enq_bits_uop_xcpt_pf_if(rpq_io_enq_bits_uop_xcpt_pf_if),
    .io_enq_bits_uop_xcpt_ae_if(rpq_io_enq_bits_uop_xcpt_ae_if),
    .io_enq_bits_uop_xcpt_ma_if(rpq_io_enq_bits_uop_xcpt_ma_if),
    .io_enq_bits_uop_bp_debug_if(rpq_io_enq_bits_uop_bp_debug_if),
    .io_enq_bits_uop_bp_xcpt_if(rpq_io_enq_bits_uop_bp_xcpt_if),
    .io_enq_bits_uop_debug_fsrc(rpq_io_enq_bits_uop_debug_fsrc),
    .io_enq_bits_uop_debug_tsrc(rpq_io_enq_bits_uop_debug_tsrc),
    .io_enq_bits_addr(rpq_io_enq_bits_addr),
    .io_enq_bits_data(rpq_io_enq_bits_data),
    .io_enq_bits_is_hella(rpq_io_enq_bits_is_hella),
    .io_enq_bits_tag_match(rpq_io_enq_bits_tag_match),
    .io_enq_bits_old_meta_coh_state(rpq_io_enq_bits_old_meta_coh_state),
    .io_enq_bits_old_meta_tag(rpq_io_enq_bits_old_meta_tag),
    .io_enq_bits_way_en(rpq_io_enq_bits_way_en),
    .io_enq_bits_sdq_id(rpq_io_enq_bits_sdq_id),
    .io_deq_ready(rpq_io_deq_ready),
    .io_deq_valid(rpq_io_deq_valid),
    .io_deq_bits_uop_switch(rpq_io_deq_bits_uop_switch),
    .io_deq_bits_uop_switch_off(rpq_io_deq_bits_uop_switch_off),
    .io_deq_bits_uop_is_unicore(rpq_io_deq_bits_uop_is_unicore),
    .io_deq_bits_uop_shift(rpq_io_deq_bits_uop_shift),
    .io_deq_bits_uop_lrs3_rtype(rpq_io_deq_bits_uop_lrs3_rtype),
    .io_deq_bits_uop_rflag(rpq_io_deq_bits_uop_rflag),
    .io_deq_bits_uop_wflag(rpq_io_deq_bits_uop_wflag),
    .io_deq_bits_uop_prflag(rpq_io_deq_bits_uop_prflag),
    .io_deq_bits_uop_pwflag(rpq_io_deq_bits_uop_pwflag),
    .io_deq_bits_uop_pflag_busy(rpq_io_deq_bits_uop_pflag_busy),
    .io_deq_bits_uop_stale_pflag(rpq_io_deq_bits_uop_stale_pflag),
    .io_deq_bits_uop_op1_sel(rpq_io_deq_bits_uop_op1_sel),
    .io_deq_bits_uop_op2_sel(rpq_io_deq_bits_uop_op2_sel),
    .io_deq_bits_uop_split_num(rpq_io_deq_bits_uop_split_num),
    .io_deq_bits_uop_self_index(rpq_io_deq_bits_uop_self_index),
    .io_deq_bits_uop_rob_inst_idx(rpq_io_deq_bits_uop_rob_inst_idx),
    .io_deq_bits_uop_address_num(rpq_io_deq_bits_uop_address_num),
    .io_deq_bits_uop_uopc(rpq_io_deq_bits_uop_uopc),
    .io_deq_bits_uop_inst(rpq_io_deq_bits_uop_inst),
    .io_deq_bits_uop_debug_inst(rpq_io_deq_bits_uop_debug_inst),
    .io_deq_bits_uop_is_rvc(rpq_io_deq_bits_uop_is_rvc),
    .io_deq_bits_uop_debug_pc(rpq_io_deq_bits_uop_debug_pc),
    .io_deq_bits_uop_iq_type(rpq_io_deq_bits_uop_iq_type),
    .io_deq_bits_uop_fu_code(rpq_io_deq_bits_uop_fu_code),
    .io_deq_bits_uop_ctrl_br_type(rpq_io_deq_bits_uop_ctrl_br_type),
    .io_deq_bits_uop_ctrl_op1_sel(rpq_io_deq_bits_uop_ctrl_op1_sel),
    .io_deq_bits_uop_ctrl_op2_sel(rpq_io_deq_bits_uop_ctrl_op2_sel),
    .io_deq_bits_uop_ctrl_imm_sel(rpq_io_deq_bits_uop_ctrl_imm_sel),
    .io_deq_bits_uop_ctrl_op_fcn(rpq_io_deq_bits_uop_ctrl_op_fcn),
    .io_deq_bits_uop_ctrl_fcn_dw(rpq_io_deq_bits_uop_ctrl_fcn_dw),
    .io_deq_bits_uop_ctrl_csr_cmd(rpq_io_deq_bits_uop_ctrl_csr_cmd),
    .io_deq_bits_uop_ctrl_is_load(rpq_io_deq_bits_uop_ctrl_is_load),
    .io_deq_bits_uop_ctrl_is_sta(rpq_io_deq_bits_uop_ctrl_is_sta),
    .io_deq_bits_uop_ctrl_is_std(rpq_io_deq_bits_uop_ctrl_is_std),
    .io_deq_bits_uop_ctrl_op3_sel(rpq_io_deq_bits_uop_ctrl_op3_sel),
    .io_deq_bits_uop_iw_state(rpq_io_deq_bits_uop_iw_state),
    .io_deq_bits_uop_iw_p1_poisoned(rpq_io_deq_bits_uop_iw_p1_poisoned),
    .io_deq_bits_uop_iw_p2_poisoned(rpq_io_deq_bits_uop_iw_p2_poisoned),
    .io_deq_bits_uop_is_br(rpq_io_deq_bits_uop_is_br),
    .io_deq_bits_uop_is_jalr(rpq_io_deq_bits_uop_is_jalr),
    .io_deq_bits_uop_is_jal(rpq_io_deq_bits_uop_is_jal),
    .io_deq_bits_uop_is_sfb(rpq_io_deq_bits_uop_is_sfb),
    .io_deq_bits_uop_br_mask(rpq_io_deq_bits_uop_br_mask),
    .io_deq_bits_uop_br_tag(rpq_io_deq_bits_uop_br_tag),
    .io_deq_bits_uop_ftq_idx(rpq_io_deq_bits_uop_ftq_idx),
    .io_deq_bits_uop_edge_inst(rpq_io_deq_bits_uop_edge_inst),
    .io_deq_bits_uop_pc_lob(rpq_io_deq_bits_uop_pc_lob),
    .io_deq_bits_uop_taken(rpq_io_deq_bits_uop_taken),
    .io_deq_bits_uop_imm_packed(rpq_io_deq_bits_uop_imm_packed),
    .io_deq_bits_uop_csr_addr(rpq_io_deq_bits_uop_csr_addr),
    .io_deq_bits_uop_rob_idx(rpq_io_deq_bits_uop_rob_idx),
    .io_deq_bits_uop_ldq_idx(rpq_io_deq_bits_uop_ldq_idx),
    .io_deq_bits_uop_stq_idx(rpq_io_deq_bits_uop_stq_idx),
    .io_deq_bits_uop_rxq_idx(rpq_io_deq_bits_uop_rxq_idx),
    .io_deq_bits_uop_pdst(rpq_io_deq_bits_uop_pdst),
    .io_deq_bits_uop_prs1(rpq_io_deq_bits_uop_prs1),
    .io_deq_bits_uop_prs2(rpq_io_deq_bits_uop_prs2),
    .io_deq_bits_uop_prs3(rpq_io_deq_bits_uop_prs3),
    .io_deq_bits_uop_ppred(rpq_io_deq_bits_uop_ppred),
    .io_deq_bits_uop_prs1_busy(rpq_io_deq_bits_uop_prs1_busy),
    .io_deq_bits_uop_prs2_busy(rpq_io_deq_bits_uop_prs2_busy),
    .io_deq_bits_uop_prs3_busy(rpq_io_deq_bits_uop_prs3_busy),
    .io_deq_bits_uop_ppred_busy(rpq_io_deq_bits_uop_ppred_busy),
    .io_deq_bits_uop_stale_pdst(rpq_io_deq_bits_uop_stale_pdst),
    .io_deq_bits_uop_exception(rpq_io_deq_bits_uop_exception),
    .io_deq_bits_uop_exc_cause(rpq_io_deq_bits_uop_exc_cause),
    .io_deq_bits_uop_bypassable(rpq_io_deq_bits_uop_bypassable),
    .io_deq_bits_uop_mem_cmd(rpq_io_deq_bits_uop_mem_cmd),
    .io_deq_bits_uop_mem_size(rpq_io_deq_bits_uop_mem_size),
    .io_deq_bits_uop_mem_signed(rpq_io_deq_bits_uop_mem_signed),
    .io_deq_bits_uop_is_fence(rpq_io_deq_bits_uop_is_fence),
    .io_deq_bits_uop_is_fencei(rpq_io_deq_bits_uop_is_fencei),
    .io_deq_bits_uop_is_amo(rpq_io_deq_bits_uop_is_amo),
    .io_deq_bits_uop_uses_ldq(rpq_io_deq_bits_uop_uses_ldq),
    .io_deq_bits_uop_uses_stq(rpq_io_deq_bits_uop_uses_stq),
    .io_deq_bits_uop_is_sys_pc2epc(rpq_io_deq_bits_uop_is_sys_pc2epc),
    .io_deq_bits_uop_is_unique(rpq_io_deq_bits_uop_is_unique),
    .io_deq_bits_uop_flush_on_commit(rpq_io_deq_bits_uop_flush_on_commit),
    .io_deq_bits_uop_ldst_is_rs1(rpq_io_deq_bits_uop_ldst_is_rs1),
    .io_deq_bits_uop_ldst(rpq_io_deq_bits_uop_ldst),
    .io_deq_bits_uop_lrs1(rpq_io_deq_bits_uop_lrs1),
    .io_deq_bits_uop_lrs2(rpq_io_deq_bits_uop_lrs2),
    .io_deq_bits_uop_lrs3(rpq_io_deq_bits_uop_lrs3),
    .io_deq_bits_uop_ldst_val(rpq_io_deq_bits_uop_ldst_val),
    .io_deq_bits_uop_dst_rtype(rpq_io_deq_bits_uop_dst_rtype),
    .io_deq_bits_uop_lrs1_rtype(rpq_io_deq_bits_uop_lrs1_rtype),
    .io_deq_bits_uop_lrs2_rtype(rpq_io_deq_bits_uop_lrs2_rtype),
    .io_deq_bits_uop_frs3_en(rpq_io_deq_bits_uop_frs3_en),
    .io_deq_bits_uop_fp_val(rpq_io_deq_bits_uop_fp_val),
    .io_deq_bits_uop_fp_single(rpq_io_deq_bits_uop_fp_single),
    .io_deq_bits_uop_xcpt_pf_if(rpq_io_deq_bits_uop_xcpt_pf_if),
    .io_deq_bits_uop_xcpt_ae_if(rpq_io_deq_bits_uop_xcpt_ae_if),
    .io_deq_bits_uop_xcpt_ma_if(rpq_io_deq_bits_uop_xcpt_ma_if),
    .io_deq_bits_uop_bp_debug_if(rpq_io_deq_bits_uop_bp_debug_if),
    .io_deq_bits_uop_bp_xcpt_if(rpq_io_deq_bits_uop_bp_xcpt_if),
    .io_deq_bits_uop_debug_fsrc(rpq_io_deq_bits_uop_debug_fsrc),
    .io_deq_bits_uop_debug_tsrc(rpq_io_deq_bits_uop_debug_tsrc),
    .io_deq_bits_addr(rpq_io_deq_bits_addr),
    .io_deq_bits_data(rpq_io_deq_bits_data),
    .io_deq_bits_is_hella(rpq_io_deq_bits_is_hella),
    .io_deq_bits_tag_match(rpq_io_deq_bits_tag_match),
    .io_deq_bits_old_meta_coh_state(rpq_io_deq_bits_old_meta_coh_state),
    .io_deq_bits_old_meta_tag(rpq_io_deq_bits_old_meta_tag),
    .io_deq_bits_way_en(rpq_io_deq_bits_way_en),
    .io_deq_bits_sdq_id(rpq_io_deq_bits_sdq_id),
    .io_brupdate_b1_resolve_mask(rpq_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(rpq_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_switch(rpq_io_brupdate_b2_uop_switch),
    .io_brupdate_b2_uop_switch_off(rpq_io_brupdate_b2_uop_switch_off),
    .io_brupdate_b2_uop_is_unicore(rpq_io_brupdate_b2_uop_is_unicore),
    .io_brupdate_b2_uop_shift(rpq_io_brupdate_b2_uop_shift),
    .io_brupdate_b2_uop_lrs3_rtype(rpq_io_brupdate_b2_uop_lrs3_rtype),
    .io_brupdate_b2_uop_rflag(rpq_io_brupdate_b2_uop_rflag),
    .io_brupdate_b2_uop_wflag(rpq_io_brupdate_b2_uop_wflag),
    .io_brupdate_b2_uop_prflag(rpq_io_brupdate_b2_uop_prflag),
    .io_brupdate_b2_uop_pwflag(rpq_io_brupdate_b2_uop_pwflag),
    .io_brupdate_b2_uop_pflag_busy(rpq_io_brupdate_b2_uop_pflag_busy),
    .io_brupdate_b2_uop_stale_pflag(rpq_io_brupdate_b2_uop_stale_pflag),
    .io_brupdate_b2_uop_op1_sel(rpq_io_brupdate_b2_uop_op1_sel),
    .io_brupdate_b2_uop_op2_sel(rpq_io_brupdate_b2_uop_op2_sel),
    .io_brupdate_b2_uop_split_num(rpq_io_brupdate_b2_uop_split_num),
    .io_brupdate_b2_uop_self_index(rpq_io_brupdate_b2_uop_self_index),
    .io_brupdate_b2_uop_rob_inst_idx(rpq_io_brupdate_b2_uop_rob_inst_idx),
    .io_brupdate_b2_uop_address_num(rpq_io_brupdate_b2_uop_address_num),
    .io_brupdate_b2_uop_uopc(rpq_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(rpq_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(rpq_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(rpq_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(rpq_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(rpq_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(rpq_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(rpq_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(rpq_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(rpq_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(rpq_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(rpq_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(rpq_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(rpq_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(rpq_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(rpq_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(rpq_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_ctrl_op3_sel(rpq_io_brupdate_b2_uop_ctrl_op3_sel),
    .io_brupdate_b2_uop_iw_state(rpq_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(rpq_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(rpq_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(rpq_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(rpq_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(rpq_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(rpq_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(rpq_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(rpq_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(rpq_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(rpq_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(rpq_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(rpq_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(rpq_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(rpq_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(rpq_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(rpq_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(rpq_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(rpq_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(rpq_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(rpq_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(rpq_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(rpq_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(rpq_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(rpq_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(rpq_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(rpq_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(rpq_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(rpq_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(rpq_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(rpq_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(rpq_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(rpq_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(rpq_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(rpq_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(rpq_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(rpq_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(rpq_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(rpq_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(rpq_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(rpq_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(rpq_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(rpq_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(rpq_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(rpq_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(rpq_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(rpq_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(rpq_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(rpq_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(rpq_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(rpq_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(rpq_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(rpq_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(rpq_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(rpq_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(rpq_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(rpq_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(rpq_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(rpq_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(rpq_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(rpq_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(rpq_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(rpq_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(rpq_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(rpq_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(rpq_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(rpq_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(rpq_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(rpq_io_brupdate_b2_target_offset),
    .io_flush(rpq_io_flush),
    .io_empty(rpq_io_empty),
    .io_count(rpq_io_count)
  );
  assign io_req_pri_rdy = _T_229 | _GEN_3822; // @[mshrs.scala 204:30 mshrs.scala 205:20]
  assign io_req_sec_rdy = sec_rdy & rpq_io_enq_ready; // @[mshrs.scala 158:37]
  assign io_idx_valid = state != 5'h0; // @[mshrs.scala 149:25]
  assign io_idx_bits = req_addr[11:6]; // @[mshrs.scala 110:25]
  assign io_way_valid = ~_T_272; // @[mshrs.scala 151:19]
  assign io_way_bits = req_way_en; // @[mshrs.scala 154:15]
  assign io_tag_valid = state != 5'h0; // @[mshrs.scala 150:25]
  assign io_tag_bits = req_addr[39:12]; // @[mshrs.scala 111:26]
  assign io_mem_acquire_valid = _T_229 ? 1'h0 : _T_258; // @[mshrs.scala 204:30 mshrs.scala 159:26]
  assign io_mem_acquire_bits_opcode = 3'h6; // @[Edges.scala 345:17 Edges.scala 346:15]
  assign io_mem_acquire_bits_param = {{1'd0}, grow_param}; // @[Edges.scala 345:17 Edges.scala 347:15]
  assign io_mem_acquire_bits_size = 4'h6; // @[Edges.scala 345:17 Edges.scala 348:15]
  assign io_mem_acquire_bits_source = {{1'd0}, io_id}; // @[Edges.scala 345:17 Edges.scala 349:15]
  assign io_mem_acquire_bits_address = _T_424[31:0]; // @[Edges.scala 345:17 Edges.scala 350:15]
  assign io_mem_acquire_bits_mask = 8'hff; // @[Cat.scala 30:58]
  assign io_mem_acquire_bits_data = 64'h0; // @[Edges.scala 345:17 Edges.scala 352:15]
  assign io_mem_acquire_bits_corrupt = 1'h0; // @[Edges.scala 345:17 Edges.scala 353:15]
  assign io_mem_grant_ready = beats1_opdata ? io_lb_write_ready : 1'h1; // @[mshrs.scala 223:44 mshrs.scala 224:31 mshrs.scala 230:31]
  assign io_mem_finish_valid = _T_229 ? 1'h0 : _GEN_3820; // @[mshrs.scala 204:30 mshrs.scala 168:26]
  assign io_mem_finish_bits_sink = grantack_bits_sink; // @[mshrs.scala 362:42 mshrs.scala 364:25]
  assign io_refill_valid = _T_229 ? 1'h0 : _GEN_3708; // @[mshrs.scala 204:30 mshrs.scala 160:26]
  assign io_refill_bits_way_en = req_way_en; // @[mshrs.scala 323:41 mshrs.scala 330:27]
  assign io_refill_bits_addr = _T_621[11:0];
  assign io_refill_bits_wmask = 1'h1; // @[mshrs.scala 331:30]
  assign io_refill_bits_data = io_lb_resp; // @[mshrs.scala 323:41 mshrs.scala 332:27]
  assign io_meta_write_valid = _T_229 ? 1'h0 : _GEN_3696; // @[mshrs.scala 204:30 mshrs.scala 156:26]
  assign io_meta_write_bits_idx = req_addr[11:6]; // @[mshrs.scala 110:25]
  assign io_meta_write_bits_way_en = req_way_en; // @[mshrs.scala 297:40 mshrs.scala 302:33]
  assign io_meta_write_bits_tag = 20'h0;
  assign io_meta_write_bits_data_coh_state = state == 5'h7 ? coh_on_clear_state : new_coh_state; // @[mshrs.scala 297:40 mshrs.scala 300:33]
  assign io_meta_write_bits_data_tag = req_tag[19:0];
  assign io_meta_read_valid = _T_229 ? 1'h0 : _GEN_3692; // @[mshrs.scala 204:30 mshrs.scala 167:26]
  assign io_meta_read_bits_idx = req_addr[11:6]; // @[mshrs.scala 110:25]
  assign io_meta_read_bits_way_en = req_way_en; // @[mshrs.scala 283:39 mshrs.scala 287:30]
  assign io_meta_read_bits_tag = req_tag[19:0];
  assign io_wb_req_valid = _T_229 ? 1'h0 : _GEN_3701; // @[mshrs.scala 204:30 mshrs.scala 162:26]
  assign io_wb_req_bits_tag = req_old_meta_tag; // @[mshrs.scala 307:36 mshrs.scala 310:30]
  assign io_wb_req_bits_idx = req_addr[11:6]; // @[mshrs.scala 110:25]
  assign io_wb_req_bits_source = {{1'd0}, io_id}; // @[mshrs.scala 307:36 mshrs.scala 314:30]
  assign io_wb_req_bits_param = _T_63 ? 3'h3 : _T_61; // @[Misc.scala 37:36]
  assign io_wb_req_bits_way_en = req_way_en; // @[mshrs.scala 307:36 mshrs.scala 313:30]
  assign io_wb_req_bits_voluntary = 1'h1; // @[mshrs.scala 307:36 mshrs.scala 315:30]
  assign io_commit_val = _T_229 ? 1'h0 : _GEN_3691; // @[mshrs.scala 204:30 mshrs.scala 164:26]
  assign io_commit_addr = req_addr; // @[mshrs.scala 165:26]
  assign io_commit_coh_state = 4'hc == _T_114 ? 2'h3 : _T_124; // @[Mux.scala 80:57]
  assign io_lb_read_valid = _T_229 ? 1'h0 : _GEN_3587; // @[mshrs.scala 204:30 mshrs.scala 170:26]
  assign io_lb_read_bits_id = io_id; // @[mshrs.scala 245:45 mshrs.scala 261:28]
  assign io_lb_read_bits_offset = _GEN_2867[2:0];
  assign io_lb_write_valid = _T_229 ? 1'h0 : _GEN_3577; // @[mshrs.scala 204:30 mshrs.scala 169:26]
  assign io_lb_write_bits_id = io_id; // @[mshrs.scala 223:44 mshrs.scala 226:31]
  assign io_lb_write_bits_offset = refill_address_inc[5:3];
  assign io_lb_write_bits_data = io_mem_grant_bits_data; // @[mshrs.scala 223:44 mshrs.scala 228:31]
  assign io_replay_valid = _T_229 ? 1'h0 : _GEN_3819; // @[mshrs.scala 204:30 mshrs.scala 161:26]
  assign io_replay_bits_uop_switch = rpq_io_deq_bits_uop_switch; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_switch_off = rpq_io_deq_bits_uop_switch_off; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_is_unicore = rpq_io_deq_bits_uop_is_unicore; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_shift = rpq_io_deq_bits_uop_shift; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_lrs3_rtype = rpq_io_deq_bits_uop_lrs3_rtype; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_rflag = rpq_io_deq_bits_uop_rflag; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_wflag = rpq_io_deq_bits_uop_wflag; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_prflag = rpq_io_deq_bits_uop_prflag; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_pwflag = rpq_io_deq_bits_uop_pwflag; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_pflag_busy = rpq_io_deq_bits_uop_pflag_busy; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_stale_pflag = rpq_io_deq_bits_uop_stale_pflag; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_op1_sel = rpq_io_deq_bits_uop_op1_sel; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_op2_sel = rpq_io_deq_bits_uop_op2_sel; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_split_num = rpq_io_deq_bits_uop_split_num; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_self_index = rpq_io_deq_bits_uop_self_index; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_rob_inst_idx = rpq_io_deq_bits_uop_rob_inst_idx; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_address_num = rpq_io_deq_bits_uop_address_num; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_uopc = rpq_io_deq_bits_uop_uopc; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_inst = rpq_io_deq_bits_uop_inst; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_debug_inst = rpq_io_deq_bits_uop_debug_inst; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_is_rvc = rpq_io_deq_bits_uop_is_rvc; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_debug_pc = rpq_io_deq_bits_uop_debug_pc; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_iq_type = rpq_io_deq_bits_uop_iq_type; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_fu_code = rpq_io_deq_bits_uop_fu_code; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ctrl_br_type = rpq_io_deq_bits_uop_ctrl_br_type; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ctrl_op1_sel = rpq_io_deq_bits_uop_ctrl_op1_sel; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ctrl_op2_sel = rpq_io_deq_bits_uop_ctrl_op2_sel; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ctrl_imm_sel = rpq_io_deq_bits_uop_ctrl_imm_sel; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ctrl_op_fcn = rpq_io_deq_bits_uop_ctrl_op_fcn; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ctrl_fcn_dw = rpq_io_deq_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ctrl_csr_cmd = rpq_io_deq_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ctrl_is_load = rpq_io_deq_bits_uop_ctrl_is_load; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ctrl_is_sta = rpq_io_deq_bits_uop_ctrl_is_sta; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ctrl_is_std = rpq_io_deq_bits_uop_ctrl_is_std; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ctrl_op3_sel = rpq_io_deq_bits_uop_ctrl_op3_sel; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_iw_state = rpq_io_deq_bits_uop_iw_state; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_iw_p1_poisoned = rpq_io_deq_bits_uop_iw_p1_poisoned; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_iw_p2_poisoned = rpq_io_deq_bits_uop_iw_p2_poisoned; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_is_br = rpq_io_deq_bits_uop_is_br; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_is_jalr = rpq_io_deq_bits_uop_is_jalr; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_is_jal = rpq_io_deq_bits_uop_is_jal; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_is_sfb = rpq_io_deq_bits_uop_is_sfb; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_br_mask = rpq_io_deq_bits_uop_br_mask; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_br_tag = rpq_io_deq_bits_uop_br_tag; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ftq_idx = rpq_io_deq_bits_uop_ftq_idx; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_edge_inst = rpq_io_deq_bits_uop_edge_inst; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_pc_lob = rpq_io_deq_bits_uop_pc_lob; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_taken = rpq_io_deq_bits_uop_taken; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_imm_packed = rpq_io_deq_bits_uop_imm_packed; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_csr_addr = rpq_io_deq_bits_uop_csr_addr; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_rob_idx = rpq_io_deq_bits_uop_rob_idx; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ldq_idx = rpq_io_deq_bits_uop_ldq_idx; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_stq_idx = rpq_io_deq_bits_uop_stq_idx; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_rxq_idx = rpq_io_deq_bits_uop_rxq_idx; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_pdst = rpq_io_deq_bits_uop_pdst; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_prs1 = rpq_io_deq_bits_uop_prs1; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_prs2 = rpq_io_deq_bits_uop_prs2; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_prs3 = rpq_io_deq_bits_uop_prs3; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ppred = rpq_io_deq_bits_uop_ppred; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_prs1_busy = rpq_io_deq_bits_uop_prs1_busy; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_prs2_busy = rpq_io_deq_bits_uop_prs2_busy; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_prs3_busy = rpq_io_deq_bits_uop_prs3_busy; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ppred_busy = rpq_io_deq_bits_uop_ppred_busy; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_stale_pdst = rpq_io_deq_bits_uop_stale_pdst; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_exception = rpq_io_deq_bits_uop_exception; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_exc_cause = rpq_io_deq_bits_uop_exc_cause; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_bypassable = rpq_io_deq_bits_uop_bypassable; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_mem_cmd = rpq_io_deq_bits_uop_mem_cmd; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_mem_size = rpq_io_deq_bits_uop_mem_size; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_mem_signed = rpq_io_deq_bits_uop_mem_signed; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_is_fence = rpq_io_deq_bits_uop_is_fence; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_is_fencei = rpq_io_deq_bits_uop_is_fencei; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_is_amo = rpq_io_deq_bits_uop_is_amo; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_uses_ldq = rpq_io_deq_bits_uop_uses_ldq; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_uses_stq = rpq_io_deq_bits_uop_uses_stq; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_is_sys_pc2epc = rpq_io_deq_bits_uop_is_sys_pc2epc; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_is_unique = rpq_io_deq_bits_uop_is_unique; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_flush_on_commit = rpq_io_deq_bits_uop_flush_on_commit; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ldst_is_rs1 = rpq_io_deq_bits_uop_ldst_is_rs1; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ldst = rpq_io_deq_bits_uop_ldst; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_lrs1 = rpq_io_deq_bits_uop_lrs1; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_lrs2 = rpq_io_deq_bits_uop_lrs2; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_lrs3 = rpq_io_deq_bits_uop_lrs3; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_ldst_val = rpq_io_deq_bits_uop_ldst_val; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_dst_rtype = rpq_io_deq_bits_uop_dst_rtype; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_lrs1_rtype = rpq_io_deq_bits_uop_lrs1_rtype; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_lrs2_rtype = rpq_io_deq_bits_uop_lrs2_rtype; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_frs3_en = rpq_io_deq_bits_uop_frs3_en; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_fp_val = rpq_io_deq_bits_uop_fp_val; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_fp_single = rpq_io_deq_bits_uop_fp_single; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_xcpt_pf_if = rpq_io_deq_bits_uop_xcpt_pf_if; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_xcpt_ae_if = rpq_io_deq_bits_uop_xcpt_ae_if; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_xcpt_ma_if = rpq_io_deq_bits_uop_xcpt_ma_if; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_bp_debug_if = rpq_io_deq_bits_uop_bp_debug_if; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_bp_xcpt_if = rpq_io_deq_bits_uop_bp_xcpt_if; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_debug_fsrc = rpq_io_deq_bits_uop_debug_fsrc; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_uop_debug_tsrc = rpq_io_deq_bits_uop_debug_tsrc; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_addr = {_T_423,lo}; // @[Cat.scala 30:58]
  assign io_replay_bits_data = rpq_io_deq_bits_data; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_is_hella = rpq_io_deq_bits_is_hella; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_tag_match = rpq_io_deq_bits_tag_match; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_old_meta_coh_state = rpq_io_deq_bits_old_meta_coh_state; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_old_meta_tag = rpq_io_deq_bits_old_meta_tag; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_replay_bits_way_en = req_way_en; // @[mshrs.scala 339:39 mshrs.scala 341:30]
  assign io_replay_bits_sdq_id = rpq_io_deq_bits_sdq_id; // @[mshrs.scala 339:39 mshrs.scala 340:15]
  assign io_resp_valid = _T_229 ? 1'h0 : _GEN_3590; // @[mshrs.scala 204:30 mshrs.scala 163:26]
  assign io_resp_bits_uop_switch = rpq_io_deq_bits_uop_switch; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_switch_off = rpq_io_deq_bits_uop_switch_off; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_is_unicore = rpq_io_deq_bits_uop_is_unicore; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_shift = rpq_io_deq_bits_uop_shift; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_lrs3_rtype = rpq_io_deq_bits_uop_lrs3_rtype; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_rflag = rpq_io_deq_bits_uop_rflag; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_wflag = rpq_io_deq_bits_uop_wflag; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_prflag = rpq_io_deq_bits_uop_prflag; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_pwflag = rpq_io_deq_bits_uop_pwflag; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_pflag_busy = rpq_io_deq_bits_uop_pflag_busy; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_stale_pflag = rpq_io_deq_bits_uop_stale_pflag; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_op1_sel = rpq_io_deq_bits_uop_op1_sel; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_op2_sel = rpq_io_deq_bits_uop_op2_sel; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_split_num = rpq_io_deq_bits_uop_split_num; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_self_index = rpq_io_deq_bits_uop_self_index; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_rob_inst_idx = rpq_io_deq_bits_uop_rob_inst_idx; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_address_num = rpq_io_deq_bits_uop_address_num; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_uopc = rpq_io_deq_bits_uop_uopc; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_inst = rpq_io_deq_bits_uop_inst; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_debug_inst = rpq_io_deq_bits_uop_debug_inst; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_is_rvc = rpq_io_deq_bits_uop_is_rvc; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_debug_pc = rpq_io_deq_bits_uop_debug_pc; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_iq_type = rpq_io_deq_bits_uop_iq_type; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_fu_code = rpq_io_deq_bits_uop_fu_code; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ctrl_br_type = rpq_io_deq_bits_uop_ctrl_br_type; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ctrl_op1_sel = rpq_io_deq_bits_uop_ctrl_op1_sel; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ctrl_op2_sel = rpq_io_deq_bits_uop_ctrl_op2_sel; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ctrl_imm_sel = rpq_io_deq_bits_uop_ctrl_imm_sel; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ctrl_op_fcn = rpq_io_deq_bits_uop_ctrl_op_fcn; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ctrl_fcn_dw = rpq_io_deq_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ctrl_csr_cmd = rpq_io_deq_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ctrl_is_load = rpq_io_deq_bits_uop_ctrl_is_load; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ctrl_is_sta = rpq_io_deq_bits_uop_ctrl_is_sta; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ctrl_is_std = rpq_io_deq_bits_uop_ctrl_is_std; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ctrl_op3_sel = rpq_io_deq_bits_uop_ctrl_op3_sel; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_iw_state = rpq_io_deq_bits_uop_iw_state; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_iw_p1_poisoned = rpq_io_deq_bits_uop_iw_p1_poisoned; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_iw_p2_poisoned = rpq_io_deq_bits_uop_iw_p2_poisoned; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_is_br = rpq_io_deq_bits_uop_is_br; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_is_jalr = rpq_io_deq_bits_uop_is_jalr; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_is_jal = rpq_io_deq_bits_uop_is_jal; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_is_sfb = rpq_io_deq_bits_uop_is_sfb; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_br_mask = rpq_io_deq_bits_uop_br_mask; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_br_tag = rpq_io_deq_bits_uop_br_tag; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ftq_idx = rpq_io_deq_bits_uop_ftq_idx; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_edge_inst = rpq_io_deq_bits_uop_edge_inst; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_pc_lob = rpq_io_deq_bits_uop_pc_lob; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_taken = rpq_io_deq_bits_uop_taken; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_imm_packed = rpq_io_deq_bits_uop_imm_packed; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_csr_addr = rpq_io_deq_bits_uop_csr_addr; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_rob_idx = rpq_io_deq_bits_uop_rob_idx; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ldq_idx = rpq_io_deq_bits_uop_ldq_idx; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_stq_idx = rpq_io_deq_bits_uop_stq_idx; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_rxq_idx = rpq_io_deq_bits_uop_rxq_idx; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_pdst = rpq_io_deq_bits_uop_pdst; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_prs1 = rpq_io_deq_bits_uop_prs1; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_prs2 = rpq_io_deq_bits_uop_prs2; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_prs3 = rpq_io_deq_bits_uop_prs3; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ppred = rpq_io_deq_bits_uop_ppred; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_prs1_busy = rpq_io_deq_bits_uop_prs1_busy; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_prs2_busy = rpq_io_deq_bits_uop_prs2_busy; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_prs3_busy = rpq_io_deq_bits_uop_prs3_busy; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ppred_busy = rpq_io_deq_bits_uop_ppred_busy; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_stale_pdst = rpq_io_deq_bits_uop_stale_pdst; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_exception = rpq_io_deq_bits_uop_exception; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_exc_cause = rpq_io_deq_bits_uop_exc_cause; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_bypassable = rpq_io_deq_bits_uop_bypassable; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_mem_cmd = rpq_io_deq_bits_uop_mem_cmd; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_mem_size = rpq_io_deq_bits_uop_mem_size; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_mem_signed = rpq_io_deq_bits_uop_mem_signed; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_is_fence = rpq_io_deq_bits_uop_is_fence; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_is_fencei = rpq_io_deq_bits_uop_is_fencei; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_is_amo = rpq_io_deq_bits_uop_is_amo; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_uses_ldq = rpq_io_deq_bits_uop_uses_ldq; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_uses_stq = rpq_io_deq_bits_uop_uses_stq; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_is_sys_pc2epc = rpq_io_deq_bits_uop_is_sys_pc2epc; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_is_unique = rpq_io_deq_bits_uop_is_unique; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_flush_on_commit = rpq_io_deq_bits_uop_flush_on_commit; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ldst_is_rs1 = rpq_io_deq_bits_uop_ldst_is_rs1; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ldst = rpq_io_deq_bits_uop_ldst; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_lrs1 = rpq_io_deq_bits_uop_lrs1; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_lrs2 = rpq_io_deq_bits_uop_lrs2; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_lrs3 = rpq_io_deq_bits_uop_lrs3; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_ldst_val = rpq_io_deq_bits_uop_ldst_val; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_dst_rtype = rpq_io_deq_bits_uop_dst_rtype; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_lrs1_rtype = rpq_io_deq_bits_uop_lrs1_rtype; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_lrs2_rtype = rpq_io_deq_bits_uop_lrs2_rtype; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_frs3_en = rpq_io_deq_bits_uop_frs3_en; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_fp_val = rpq_io_deq_bits_uop_fp_val; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_fp_single = rpq_io_deq_bits_uop_fp_single; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_xcpt_pf_if = rpq_io_deq_bits_uop_xcpt_pf_if; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_xcpt_ae_if = rpq_io_deq_bits_uop_xcpt_ae_if; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_xcpt_ma_if = rpq_io_deq_bits_uop_xcpt_ma_if; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_bp_debug_if = rpq_io_deq_bits_uop_bp_debug_if; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_bp_xcpt_if = rpq_io_deq_bits_uop_bp_xcpt_if; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_debug_fsrc = rpq_io_deq_bits_uop_debug_fsrc; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_uop_debug_tsrc = rpq_io_deq_bits_uop_debug_tsrc; // @[mshrs.scala 245:45 mshrs.scala 265:23]
  assign io_resp_bits_data = {hi_63,shifted_2}; // @[Cat.scala 30:58]
  assign io_resp_bits_is_hella = rpq_io_deq_bits_is_hella; // @[mshrs.scala 245:45 mshrs.scala 267:27]
  assign io_probe_rdy = meta_hazard == 2'h0 & (_T_263 | state == 5'h4 & grantack_valid); // @[mshrs.scala 148:42]
  assign rpq_clock = clock;
  assign rpq_reset = reset;
  assign rpq_io_enq_valid = (io_req_pri_val & io_req_pri_rdy | io_req_sec_val & io_req_sec_rdy) & ~_T_249; // @[mshrs.scala 133:98]
  assign rpq_io_enq_bits_uop_switch = io_req_uop_switch; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_switch_off = io_req_uop_switch_off; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_is_unicore = io_req_uop_is_unicore; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_shift = io_req_uop_shift; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_lrs3_rtype = io_req_uop_lrs3_rtype; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_rflag = io_req_uop_rflag; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_wflag = io_req_uop_wflag; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_prflag = io_req_uop_prflag; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_pwflag = io_req_uop_pwflag; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_pflag_busy = io_req_uop_pflag_busy; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_stale_pflag = io_req_uop_stale_pflag; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_op1_sel = io_req_uop_op1_sel; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_op2_sel = io_req_uop_op2_sel; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_split_num = io_req_uop_split_num; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_self_index = io_req_uop_self_index; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_rob_inst_idx = io_req_uop_rob_inst_idx; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_address_num = io_req_uop_address_num; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_uopc = io_req_uop_uopc; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_inst = io_req_uop_inst; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_debug_inst = io_req_uop_debug_inst; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_is_rvc = io_req_uop_is_rvc; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_debug_pc = io_req_uop_debug_pc; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_iq_type = io_req_uop_iq_type; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_fu_code = io_req_uop_fu_code; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ctrl_br_type = io_req_uop_ctrl_br_type; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ctrl_op1_sel = io_req_uop_ctrl_op1_sel; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ctrl_op2_sel = io_req_uop_ctrl_op2_sel; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ctrl_imm_sel = io_req_uop_ctrl_imm_sel; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ctrl_op_fcn = io_req_uop_ctrl_op_fcn; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ctrl_fcn_dw = io_req_uop_ctrl_fcn_dw; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ctrl_csr_cmd = io_req_uop_ctrl_csr_cmd; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ctrl_is_load = io_req_uop_ctrl_is_load; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ctrl_is_sta = io_req_uop_ctrl_is_sta; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ctrl_is_std = io_req_uop_ctrl_is_std; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ctrl_op3_sel = io_req_uop_ctrl_op3_sel; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_iw_state = io_req_uop_iw_state; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_iw_p1_poisoned = io_req_uop_iw_p1_poisoned; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_iw_p2_poisoned = io_req_uop_iw_p2_poisoned; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_is_br = io_req_uop_is_br; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_is_jalr = io_req_uop_is_jalr; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_is_jal = io_req_uop_is_jal; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_is_sfb = io_req_uop_is_sfb; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_br_mask = io_req_uop_br_mask; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_br_tag = io_req_uop_br_tag; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ftq_idx = io_req_uop_ftq_idx; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_edge_inst = io_req_uop_edge_inst; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_pc_lob = io_req_uop_pc_lob; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_taken = io_req_uop_taken; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_imm_packed = io_req_uop_imm_packed; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_csr_addr = io_req_uop_csr_addr; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_rob_idx = io_req_uop_rob_idx; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ldq_idx = io_req_uop_ldq_idx; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_stq_idx = io_req_uop_stq_idx; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_rxq_idx = io_req_uop_rxq_idx; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_pdst = io_req_uop_pdst; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_prs1 = io_req_uop_prs1; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_prs2 = io_req_uop_prs2; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_prs3 = io_req_uop_prs3; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ppred = io_req_uop_ppred; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_prs1_busy = io_req_uop_prs1_busy; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_prs2_busy = io_req_uop_prs2_busy; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_prs3_busy = io_req_uop_prs3_busy; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ppred_busy = io_req_uop_ppred_busy; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_stale_pdst = io_req_uop_stale_pdst; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_exception = io_req_uop_exception; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_exc_cause = io_req_uop_exc_cause; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_bypassable = io_req_uop_bypassable; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_mem_cmd = io_req_uop_mem_cmd; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_mem_size = io_req_uop_mem_size; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_mem_signed = io_req_uop_mem_signed; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_is_fence = io_req_uop_is_fence; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_is_fencei = io_req_uop_is_fencei; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_is_amo = io_req_uop_is_amo; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_uses_ldq = io_req_uop_uses_ldq; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_uses_stq = io_req_uop_uses_stq; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_is_sys_pc2epc = io_req_uop_is_sys_pc2epc; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_is_unique = io_req_uop_is_unique; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_flush_on_commit = io_req_uop_flush_on_commit; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ldst_is_rs1 = io_req_uop_ldst_is_rs1; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ldst = io_req_uop_ldst; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_lrs1 = io_req_uop_lrs1; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_lrs2 = io_req_uop_lrs2; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_lrs3 = io_req_uop_lrs3; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_ldst_val = io_req_uop_ldst_val; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_dst_rtype = io_req_uop_dst_rtype; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_lrs1_rtype = io_req_uop_lrs1_rtype; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_lrs2_rtype = io_req_uop_lrs2_rtype; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_frs3_en = io_req_uop_frs3_en; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_fp_val = io_req_uop_fp_val; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_fp_single = io_req_uop_fp_single; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_xcpt_pf_if = io_req_uop_xcpt_pf_if; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_xcpt_ae_if = io_req_uop_xcpt_ae_if; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_xcpt_ma_if = io_req_uop_xcpt_ma_if; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_bp_debug_if = io_req_uop_bp_debug_if; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_bp_xcpt_if = io_req_uop_bp_xcpt_if; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_debug_fsrc = io_req_uop_debug_fsrc; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_uop_debug_tsrc = io_req_uop_debug_tsrc; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_addr = io_req_addr; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_data = io_req_data; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_is_hella = io_req_is_hella; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_tag_match = io_req_tag_match; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_old_meta_coh_state = io_req_old_meta_coh_state; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_old_meta_tag = io_req_old_meta_tag; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_way_en = io_req_way_en; // @[mshrs.scala 134:20]
  assign rpq_io_enq_bits_sdq_id = io_req_sdq_id; // @[mshrs.scala 134:20]
  assign rpq_io_deq_ready = _T_229 ? 1'h0 : _GEN_3586; // @[mshrs.scala 204:30 mshrs.scala 135:20]
  assign rpq_io_brupdate_b1_resolve_mask = io_brupdate_b1_resolve_mask; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b1_mispredict_mask = io_brupdate_b1_mispredict_mask; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_switch = io_brupdate_b2_uop_switch; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_switch_off = io_brupdate_b2_uop_switch_off; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_is_unicore = io_brupdate_b2_uop_is_unicore; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_shift = io_brupdate_b2_uop_shift; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_lrs3_rtype = io_brupdate_b2_uop_lrs3_rtype; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_rflag = io_brupdate_b2_uop_rflag; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_wflag = io_brupdate_b2_uop_wflag; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_prflag = io_brupdate_b2_uop_prflag; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_pwflag = io_brupdate_b2_uop_pwflag; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_pflag_busy = io_brupdate_b2_uop_pflag_busy; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_stale_pflag = io_brupdate_b2_uop_stale_pflag; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_op1_sel = io_brupdate_b2_uop_op1_sel; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_op2_sel = io_brupdate_b2_uop_op2_sel; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_split_num = io_brupdate_b2_uop_split_num; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_self_index = io_brupdate_b2_uop_self_index; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_rob_inst_idx = io_brupdate_b2_uop_rob_inst_idx; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_address_num = io_brupdate_b2_uop_address_num; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_uopc = io_brupdate_b2_uop_uopc; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_inst = io_brupdate_b2_uop_inst; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_debug_inst = io_brupdate_b2_uop_debug_inst; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_is_rvc = io_brupdate_b2_uop_is_rvc; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_debug_pc = io_brupdate_b2_uop_debug_pc; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_iq_type = io_brupdate_b2_uop_iq_type; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_fu_code = io_brupdate_b2_uop_fu_code; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ctrl_br_type = io_brupdate_b2_uop_ctrl_br_type; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ctrl_op1_sel = io_brupdate_b2_uop_ctrl_op1_sel; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ctrl_op2_sel = io_brupdate_b2_uop_ctrl_op2_sel; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ctrl_imm_sel = io_brupdate_b2_uop_ctrl_imm_sel; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ctrl_op_fcn = io_brupdate_b2_uop_ctrl_op_fcn; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ctrl_fcn_dw = io_brupdate_b2_uop_ctrl_fcn_dw; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ctrl_csr_cmd = io_brupdate_b2_uop_ctrl_csr_cmd; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ctrl_is_load = io_brupdate_b2_uop_ctrl_is_load; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ctrl_is_sta = io_brupdate_b2_uop_ctrl_is_sta; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ctrl_is_std = io_brupdate_b2_uop_ctrl_is_std; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ctrl_op3_sel = io_brupdate_b2_uop_ctrl_op3_sel; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_iw_state = io_brupdate_b2_uop_iw_state; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_iw_p1_poisoned = io_brupdate_b2_uop_iw_p1_poisoned; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_iw_p2_poisoned = io_brupdate_b2_uop_iw_p2_poisoned; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_is_br = io_brupdate_b2_uop_is_br; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_is_jalr = io_brupdate_b2_uop_is_jalr; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_is_jal = io_brupdate_b2_uop_is_jal; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_is_sfb = io_brupdate_b2_uop_is_sfb; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_br_mask = io_brupdate_b2_uop_br_mask; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_br_tag = io_brupdate_b2_uop_br_tag; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ftq_idx = io_brupdate_b2_uop_ftq_idx; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_edge_inst = io_brupdate_b2_uop_edge_inst; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_pc_lob = io_brupdate_b2_uop_pc_lob; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_taken = io_brupdate_b2_uop_taken; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_imm_packed = io_brupdate_b2_uop_imm_packed; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_csr_addr = io_brupdate_b2_uop_csr_addr; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_rob_idx = io_brupdate_b2_uop_rob_idx; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ldq_idx = io_brupdate_b2_uop_ldq_idx; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_stq_idx = io_brupdate_b2_uop_stq_idx; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_rxq_idx = io_brupdate_b2_uop_rxq_idx; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_pdst = io_brupdate_b2_uop_pdst; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_prs1 = io_brupdate_b2_uop_prs1; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_prs2 = io_brupdate_b2_uop_prs2; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_prs3 = io_brupdate_b2_uop_prs3; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ppred = io_brupdate_b2_uop_ppred; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_prs1_busy = io_brupdate_b2_uop_prs1_busy; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_prs2_busy = io_brupdate_b2_uop_prs2_busy; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_prs3_busy = io_brupdate_b2_uop_prs3_busy; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ppred_busy = io_brupdate_b2_uop_ppred_busy; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_stale_pdst = io_brupdate_b2_uop_stale_pdst; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_exception = io_brupdate_b2_uop_exception; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_exc_cause = io_brupdate_b2_uop_exc_cause; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_bypassable = io_brupdate_b2_uop_bypassable; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_mem_cmd = io_brupdate_b2_uop_mem_cmd; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_mem_size = io_brupdate_b2_uop_mem_size; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_mem_signed = io_brupdate_b2_uop_mem_signed; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_is_fence = io_brupdate_b2_uop_is_fence; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_is_fencei = io_brupdate_b2_uop_is_fencei; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_is_amo = io_brupdate_b2_uop_is_amo; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_uses_ldq = io_brupdate_b2_uop_uses_ldq; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_uses_stq = io_brupdate_b2_uop_uses_stq; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_is_sys_pc2epc = io_brupdate_b2_uop_is_sys_pc2epc; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_is_unique = io_brupdate_b2_uop_is_unique; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_flush_on_commit = io_brupdate_b2_uop_flush_on_commit; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ldst_is_rs1 = io_brupdate_b2_uop_ldst_is_rs1; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ldst = io_brupdate_b2_uop_ldst; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_lrs1 = io_brupdate_b2_uop_lrs1; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_lrs2 = io_brupdate_b2_uop_lrs2; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_lrs3 = io_brupdate_b2_uop_lrs3; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_ldst_val = io_brupdate_b2_uop_ldst_val; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_dst_rtype = io_brupdate_b2_uop_dst_rtype; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_lrs1_rtype = io_brupdate_b2_uop_lrs1_rtype; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_lrs2_rtype = io_brupdate_b2_uop_lrs2_rtype; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_frs3_en = io_brupdate_b2_uop_frs3_en; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_fp_val = io_brupdate_b2_uop_fp_val; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_fp_single = io_brupdate_b2_uop_fp_single; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_xcpt_pf_if = io_brupdate_b2_uop_xcpt_pf_if; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_xcpt_ae_if = io_brupdate_b2_uop_xcpt_ae_if; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_xcpt_ma_if = io_brupdate_b2_uop_xcpt_ma_if; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_bp_debug_if = io_brupdate_b2_uop_bp_debug_if; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_bp_xcpt_if = io_brupdate_b2_uop_bp_xcpt_if; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_debug_fsrc = io_brupdate_b2_uop_debug_fsrc; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_uop_debug_tsrc = io_brupdate_b2_uop_debug_tsrc; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_valid = io_brupdate_b2_valid; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_mispredict = io_brupdate_b2_mispredict; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_taken = io_brupdate_b2_taken; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_cfi_type = io_brupdate_b2_cfi_type; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_pc_sel = io_brupdate_b2_pc_sel; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_jalr_target = io_brupdate_b2_jalr_target; // @[mshrs.scala 129:19]
  assign rpq_io_brupdate_b2_target_offset = io_brupdate_b2_target_offset; // @[mshrs.scala 129:19]
  assign rpq_io_flush = io_exception; // @[mshrs.scala 130:17]
  always @(posedge clock) begin
    if (reset) begin // @[mshrs.scala 107:22]
      state <= 5'h0; // @[mshrs.scala 107:22]
    end else if (_T_229) begin // @[mshrs.scala 204:30]
      if (_T_244) begin // @[mshrs.scala 208:45]
        if (io_req_tag_match) begin // @[mshrs.scala 187:29]
          state <= _GEN_7;
        end else begin
          state <= 5'h1; // @[mshrs.scala 199:19]
        end
      end
    end else if (_T_258) begin // @[mshrs.scala 211:40]
      if (_T_425) begin // @[mshrs.scala 219:34]
        state <= 5'h2; // @[mshrs.scala 220:13]
      end
    end else if (_T_259) begin // @[mshrs.scala 222:41]
      state <= _GEN_129;
    end else begin
      state <= _GEN_2969;
    end
    if (_T_229) begin // @[mshrs.scala 204:30]
      if (_T_244) begin // @[mshrs.scala 208:45]
        req_uop_mem_cmd <= io_req_uop_mem_cmd; // @[mshrs.scala 184:9]
      end else begin
        req_uop_mem_cmd <= _GEN_4;
      end
    end else if (_T_258) begin // @[mshrs.scala 211:40]
      req_uop_mem_cmd <= _GEN_4;
    end else if (_T_259) begin // @[mshrs.scala 222:41]
      req_uop_mem_cmd <= _GEN_4;
    end else if (_T_260) begin // @[mshrs.scala 245:45]
      req_uop_mem_cmd <= _GEN_4;
    end else begin
      req_uop_mem_cmd <= _GEN_2795;
    end
    if (_T_229) begin // @[mshrs.scala 204:30]
      if (_T_244) begin // @[mshrs.scala 208:45]
        req_addr <= io_req_addr; // @[mshrs.scala 184:9]
      end
    end else if (!(_T_258)) begin // @[mshrs.scala 211:40]
      if (!(_T_259)) begin // @[mshrs.scala 222:41]
        if (!(_T_260)) begin // @[mshrs.scala 245:45]
          req_addr <= _GEN_2765;
        end
      end
    end
    if (_T_229) begin // @[mshrs.scala 204:30]
      if (_T_244) begin // @[mshrs.scala 208:45]
        req_old_meta_coh_state <= io_req_old_meta_coh_state; // @[mshrs.scala 184:9]
      end
    end else if (!(_T_258)) begin // @[mshrs.scala 211:40]
      if (!(_T_259)) begin // @[mshrs.scala 222:41]
        if (!(_T_260)) begin // @[mshrs.scala 245:45]
          req_old_meta_coh_state <= _GEN_2761;
        end
      end
    end
    if (_T_229) begin // @[mshrs.scala 204:30]
      if (_T_244) begin // @[mshrs.scala 208:45]
        req_old_meta_tag <= io_req_old_meta_tag; // @[mshrs.scala 184:9]
      end
    end else if (!(_T_258)) begin // @[mshrs.scala 211:40]
      if (!(_T_259)) begin // @[mshrs.scala 222:41]
        if (!(_T_260)) begin // @[mshrs.scala 245:45]
          req_old_meta_tag <= _GEN_2760;
        end
      end
    end
    if (_T_229) begin // @[mshrs.scala 204:30]
      if (_T_244) begin // @[mshrs.scala 208:45]
        req_way_en <= io_req_way_en; // @[mshrs.scala 184:9]
      end
    end else if (!(_T_258)) begin // @[mshrs.scala 211:40]
      if (!(_T_259)) begin // @[mshrs.scala 222:41]
        if (!(_T_260)) begin // @[mshrs.scala 245:45]
          req_way_en <= _GEN_2759;
        end
      end
    end
    if (reset) begin // @[mshrs.scala 113:29]
      req_needs_wb <= 1'h0; // @[mshrs.scala 113:29]
    end else if (_T_229) begin // @[mshrs.scala 204:30]
      if (_T_244) begin // @[mshrs.scala 208:45]
        req_needs_wb <= _T_344; // @[mshrs.scala 186:18]
      end
    end else if (!(_T_258)) begin // @[mshrs.scala 211:40]
      if (!(_T_259)) begin // @[mshrs.scala 222:41]
        req_needs_wb <= _GEN_3211;
      end
    end
    if (reset) begin // @[mshrs.scala 115:24]
      new_coh_state <= 2'h0; // @[mshrs.scala 115:24]
    end else if (_T_229) begin // @[mshrs.scala 204:30]
      if (_T_244) begin // @[mshrs.scala 208:45]
        if (io_req_tag_match) begin // @[mshrs.scala 187:29]
          new_coh_state <= _GEN_6;
        end else begin
          new_coh_state <= 2'h0; // @[mshrs.scala 198:19]
        end
      end else begin
        new_coh_state <= _GEN_5;
      end
    end else if (_T_258) begin // @[mshrs.scala 211:40]
      new_coh_state <= _GEN_5;
    end else if (_T_259) begin // @[mshrs.scala 222:41]
      new_coh_state <= _GEN_131;
    end else begin
      new_coh_state <= _GEN_3100;
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_T_225) begin // @[Edges.scala 234:17]
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
    if (_T_229) begin // @[mshrs.scala 204:30]
      if (_T_244) begin // @[mshrs.scala 208:45]
        grantack_valid <= 1'h0; // @[mshrs.scala 181:20]
      end
    end else if (!(_T_258)) begin // @[mshrs.scala 211:40]
      if (_T_259) begin // @[mshrs.scala 222:41]
        if (refill_done) begin // @[mshrs.scala 236:24]
          grantack_valid <= _T_432; // @[mshrs.scala 237:22]
        end
      end else if (!(_T_260)) begin // @[mshrs.scala 245:45]
        grantack_valid <= _GEN_2755;
      end
    end
    if (!(_T_229)) begin // @[mshrs.scala 204:30]
      if (!(_T_258)) begin // @[mshrs.scala 211:40]
        if (_T_259) begin // @[mshrs.scala 222:41]
          if (refill_done) begin // @[mshrs.scala 236:24]
            grantack_bits_sink <= io_mem_grant_bits_sink; // @[mshrs.scala 238:21]
          end
        end
      end
    end
    if (_T_229) begin // @[mshrs.scala 204:30]
      if (_T_244) begin // @[mshrs.scala 208:45]
        refill_ctr <= 3'h0; // @[mshrs.scala 182:16]
      end
    end else if (!(_T_258)) begin // @[mshrs.scala 211:40]
      if (!(_T_259)) begin // @[mshrs.scala 222:41]
        if (!(_T_260)) begin // @[mshrs.scala 245:45]
          refill_ctr <= _GEN_2643;
        end
      end
    end
    if (!(_T_229)) begin // @[mshrs.scala 204:30]
      if (!(_T_258)) begin // @[mshrs.scala 211:40]
        if (_T_259) begin // @[mshrs.scala 222:41]
          if (refill_done) begin // @[mshrs.scala 236:24]
            commit_line <= 1'h0; // @[mshrs.scala 241:19]
          end
        end else if (_T_260) begin // @[mshrs.scala 245:45]
          commit_line <= _GEN_139;
        end
      end
    end
    if (_T_229) begin // @[mshrs.scala 204:30]
      grant_had_data <= 1'h0; // @[mshrs.scala 206:20]
    end else if (!(_T_258)) begin // @[mshrs.scala 211:40]
      if (_T_259) begin // @[mshrs.scala 222:41]
        if (_T_225) begin // @[mshrs.scala 233:32]
          grant_had_data <= beats1_opdata; // @[mshrs.scala 234:22]
        end
      end else if (!(_T_260)) begin // @[mshrs.scala 245:45]
        grant_had_data <= _GEN_2757;
      end
    end
    if (reset) begin // @[mshrs.scala 145:28]
      meta_hazard <= 2'h0; // @[mshrs.scala 145:28]
    end else if (_T_255) begin // @[mshrs.scala 147:31]
      meta_hazard <= 2'h1; // @[mshrs.scala 147:45]
    end else if (meta_hazard != 2'h0) begin // @[mshrs.scala 146:30]
      meta_hazard <= _T_254; // @[mshrs.scala 146:44]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(_T_229 & ~rpq_io_empty) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at mshrs.scala:131 assert(!(state === s_invalid && !rpq.io.empty))\n"); // @[mshrs.scala 131:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(_T_229 & ~rpq_io_empty) | reset)) begin
          $fatal; // @[mshrs.scala 131:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_229 & _T_244 & ~(rpq_io_enq_ready | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at mshrs.scala:183 assert(rpq.io.enq.ready)\n"); // @[mshrs.scala 183:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_229 & _T_244 & ~(rpq_io_enq_ready | reset)) begin
          $fatal; // @[mshrs.scala 183:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_4293 & io_req_tag_match & _T_394 & ~(c_cat_hi_3 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at mshrs.scala:190 assert(isWrite(io.req.uop.mem_cmd))\n"); // @[mshrs.scala 190:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_4293 & io_req_tag_match & _T_394 & ~(c_cat_hi_3 | reset)) begin
          $fatal; // @[mshrs.scala 190:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~_T_229 & ~_T_258 & _T_259 & refill_done & ~(~(~grant_had_data & req_needs_wb) | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at mshrs.scala:240 assert(!(!grant_had_data && req_needs_wb))\n"); // @[mshrs.scala 240:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_229 & ~_T_258 & _T_259 & refill_done & ~(~(~grant_had_data & req_needs_wb) | reset)) begin
          $fatal; // @[mshrs.scala 240:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_4303 & ~_T_259 & ~_T_260 & ~_T_264 & ~_T_542 & ~_T_543 & ~_T_613 & ~_T_615 & ~_T_617 & ~_T_618 & _T_627
           & _T_653 & ~(_T_701 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: We still don't have permissions for this store\n    at mshrs.scala:346 assert(is_hit, \"We still don't have permissions for this store\")\n"
            ); // @[mshrs.scala 346:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_4303 & ~_T_259 & ~_T_260 & ~_T_264 & ~_T_542 & ~_T_543 & ~_T_613 & ~_T_615 & ~_T_617 & ~_T_618 & _T_627
           & _T_653 & ~(_T_701 | reset)) begin
          $fatal; // @[mshrs.scala 346:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_4331 & ~_T_627 & ~_T_230 & ~_T_231 & ~_T_232 & _T_271 & ~_T_719 & ~_T_245 & _T_244 & ~(rpq_io_enq_ready
           | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at mshrs.scala:183 assert(rpq.io.enq.ready)\n"); // @[mshrs.scala 183:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_4331 & ~_T_627 & ~_T_230 & ~_T_231 & ~_T_232 & _T_271 & ~_T_719 & ~_T_245 & _T_244 & ~(rpq_io_enq_ready
           | reset)) begin
          $fatal; // @[mshrs.scala 183:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_4391 & io_req_tag_match & _T_394 & ~(c_cat_hi_3 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at mshrs.scala:190 assert(isWrite(io.req.uop.mem_cmd))\n"); // @[mshrs.scala 190:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_4391 & io_req_tag_match & _T_394 & ~(c_cat_hi_3 | reset)) begin
          $fatal; // @[mshrs.scala 190:15]
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
  state = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  req_uop_mem_cmd = _RAND_1[4:0];
  _RAND_2 = {2{`RANDOM}};
  req_addr = _RAND_2[39:0];
  _RAND_3 = {1{`RANDOM}};
  req_old_meta_coh_state = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  req_old_meta_tag = _RAND_4[19:0];
  _RAND_5 = {1{`RANDOM}};
  req_way_en = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  req_needs_wb = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  new_coh_state = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  counter = _RAND_8[8:0];
  _RAND_9 = {1{`RANDOM}};
  grantack_valid = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  grantack_bits_sink = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  refill_ctr = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  commit_line = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  grant_had_data = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  meta_hazard = _RAND_14[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
