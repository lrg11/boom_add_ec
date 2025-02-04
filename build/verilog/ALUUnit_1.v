module ALUUnit_1(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input         io_req_bits_uop_switch,
  input         io_req_bits_uop_switch_off,
  input         io_req_bits_uop_is_unicore,
  input  [2:0]  io_req_bits_uop_shift,
  input  [1:0]  io_req_bits_uop_lrs3_rtype,
  input         io_req_bits_uop_rflag,
  input         io_req_bits_uop_wflag,
  input  [3:0]  io_req_bits_uop_prflag,
  input  [3:0]  io_req_bits_uop_pwflag,
  input         io_req_bits_uop_pflag_busy,
  input  [3:0]  io_req_bits_uop_stale_pflag,
  input  [3:0]  io_req_bits_uop_op1_sel,
  input  [3:0]  io_req_bits_uop_op2_sel,
  input  [5:0]  io_req_bits_uop_split_num,
  input  [5:0]  io_req_bits_uop_self_index,
  input  [5:0]  io_req_bits_uop_rob_inst_idx,
  input  [5:0]  io_req_bits_uop_address_num,
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
  input  [1:0]  io_req_bits_uop_ctrl_op3_sel,
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
  input  [4:0]  io_req_bits_uop_ldq_idx,
  input  [4:0]  io_req_bits_uop_stq_idx,
  input  [1:0]  io_req_bits_uop_rxq_idx,
  input  [6:0]  io_req_bits_uop_pdst,
  input  [6:0]  io_req_bits_uop_prs1,
  input  [6:0]  io_req_bits_uop_prs2,
  input  [6:0]  io_req_bits_uop_prs3,
  input  [4:0]  io_req_bits_uop_ppred,
  input         io_req_bits_uop_prs1_busy,
  input         io_req_bits_uop_prs2_busy,
  input         io_req_bits_uop_prs3_busy,
  input         io_req_bits_uop_ppred_busy,
  input  [6:0]  io_req_bits_uop_stale_pdst,
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
  input  [3:0]  io_req_bits_flagdata,
  input  [31:0] io_req_bits_fflagdata,
  input         io_req_bits_kill,
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
  output        io_resp_bits_predicated,
  output [63:0] io_resp_bits_data,
  output        io_resp_bits_fflags_valid,
  output        io_resp_bits_fflags_bits_uop_switch,
  output        io_resp_bits_fflags_bits_uop_switch_off,
  output        io_resp_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_resp_bits_fflags_bits_uop_shift,
  output [1:0]  io_resp_bits_fflags_bits_uop_lrs3_rtype,
  output        io_resp_bits_fflags_bits_uop_rflag,
  output        io_resp_bits_fflags_bits_uop_wflag,
  output [3:0]  io_resp_bits_fflags_bits_uop_prflag,
  output [3:0]  io_resp_bits_fflags_bits_uop_pwflag,
  output        io_resp_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_resp_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_resp_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_resp_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_resp_bits_fflags_bits_uop_split_num,
  output [5:0]  io_resp_bits_fflags_bits_uop_self_index,
  output [5:0]  io_resp_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_resp_bits_fflags_bits_uop_address_num,
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
  output [1:0]  io_resp_bits_fflags_bits_uop_ctrl_op3_sel,
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
  output [4:0]  io_resp_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_resp_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_resp_bits_fflags_bits_uop_pdst,
  output [6:0]  io_resp_bits_fflags_bits_uop_prs1,
  output [6:0]  io_resp_bits_fflags_bits_uop_prs2,
  output [6:0]  io_resp_bits_fflags_bits_uop_prs3,
  output [4:0]  io_resp_bits_fflags_bits_uop_ppred,
  output        io_resp_bits_fflags_bits_uop_prs1_busy,
  output        io_resp_bits_fflags_bits_uop_prs2_busy,
  output        io_resp_bits_fflags_bits_uop_prs3_busy,
  output        io_resp_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_resp_bits_fflags_bits_uop_stale_pdst,
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
  output [3:0]  io_resp_bits_flagdata,
  output        io_resp_bits_fflagdata_valid,
  output        io_resp_bits_fflagdata_bits_uop_switch,
  output        io_resp_bits_fflagdata_bits_uop_switch_off,
  output        io_resp_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_resp_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_resp_bits_fflagdata_bits_uop_rflag,
  output        io_resp_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_pwflag,
  output        io_resp_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_resp_bits_fflagdata_bits_uop_inst,
  output [31:0] io_resp_bits_fflagdata_bits_uop_debug_inst,
  output        io_resp_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_resp_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_resp_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_resp_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_resp_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_resp_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_resp_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_iw_state,
  output        io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_resp_bits_fflagdata_bits_uop_is_br,
  output        io_resp_bits_fflagdata_bits_uop_is_jalr,
  output        io_resp_bits_fflagdata_bits_uop_is_jal,
  output        io_resp_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_resp_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_resp_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_resp_bits_fflagdata_bits_uop_ftq_idx,
  output        io_resp_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_pc_lob,
  output        io_resp_bits_fflagdata_bits_uop_taken,
  output [19:0] io_resp_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_resp_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_resp_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_resp_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_resp_bits_fflagdata_bits_uop_ppred,
  output        io_resp_bits_fflagdata_bits_uop_prs1_busy,
  output        io_resp_bits_fflagdata_bits_uop_prs2_busy,
  output        io_resp_bits_fflagdata_bits_uop_prs3_busy,
  output        io_resp_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_resp_bits_fflagdata_bits_uop_stale_pdst,
  output        io_resp_bits_fflagdata_bits_uop_exception,
  output [63:0] io_resp_bits_fflagdata_bits_uop_exc_cause,
  output        io_resp_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_resp_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_mem_size,
  output        io_resp_bits_fflagdata_bits_uop_mem_signed,
  output        io_resp_bits_fflagdata_bits_uop_is_fence,
  output        io_resp_bits_fflagdata_bits_uop_is_fencei,
  output        io_resp_bits_fflagdata_bits_uop_is_amo,
  output        io_resp_bits_fflagdata_bits_uop_uses_ldq,
  output        io_resp_bits_fflagdata_bits_uop_uses_stq,
  output        io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_resp_bits_fflagdata_bits_uop_is_unique,
  output        io_resp_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_resp_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_resp_bits_fflagdata_bits_uop_lrs3,
  output        io_resp_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_resp_bits_fflagdata_bits_uop_frs3_en,
  output        io_resp_bits_fflagdata_bits_uop_fp_val,
  output        io_resp_bits_fflagdata_bits_uop_fp_single,
  output        io_resp_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_resp_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_resp_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_resp_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_resp_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_resp_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_resp_bits_fflagdata_bits_fflag,
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
  output        io_bypass_0_valid,
  output        io_bypass_0_bits_uop_switch,
  output        io_bypass_0_bits_uop_switch_off,
  output        io_bypass_0_bits_uop_is_unicore,
  output [2:0]  io_bypass_0_bits_uop_shift,
  output [1:0]  io_bypass_0_bits_uop_lrs3_rtype,
  output        io_bypass_0_bits_uop_rflag,
  output        io_bypass_0_bits_uop_wflag,
  output [3:0]  io_bypass_0_bits_uop_prflag,
  output [3:0]  io_bypass_0_bits_uop_pwflag,
  output        io_bypass_0_bits_uop_pflag_busy,
  output [3:0]  io_bypass_0_bits_uop_stale_pflag,
  output [3:0]  io_bypass_0_bits_uop_op1_sel,
  output [3:0]  io_bypass_0_bits_uop_op2_sel,
  output [5:0]  io_bypass_0_bits_uop_split_num,
  output [5:0]  io_bypass_0_bits_uop_self_index,
  output [5:0]  io_bypass_0_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_0_bits_uop_address_num,
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
  output [1:0]  io_bypass_0_bits_uop_ctrl_op3_sel,
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
  output [4:0]  io_bypass_0_bits_uop_ldq_idx,
  output [4:0]  io_bypass_0_bits_uop_stq_idx,
  output [1:0]  io_bypass_0_bits_uop_rxq_idx,
  output [6:0]  io_bypass_0_bits_uop_pdst,
  output [6:0]  io_bypass_0_bits_uop_prs1,
  output [6:0]  io_bypass_0_bits_uop_prs2,
  output [6:0]  io_bypass_0_bits_uop_prs3,
  output [4:0]  io_bypass_0_bits_uop_ppred,
  output        io_bypass_0_bits_uop_prs1_busy,
  output        io_bypass_0_bits_uop_prs2_busy,
  output        io_bypass_0_bits_uop_prs3_busy,
  output        io_bypass_0_bits_uop_ppred_busy,
  output [6:0]  io_bypass_0_bits_uop_stale_pdst,
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
  output [63:0] io_bypass_0_bits_data,
  output        io_bypass_0_bits_predicated,
  output        io_bypass_0_bits_fflags_valid,
  output        io_bypass_0_bits_fflags_bits_uop_switch,
  output        io_bypass_0_bits_fflags_bits_uop_switch_off,
  output        io_bypass_0_bits_fflags_bits_uop_is_unicore,
  output [2:0]  io_bypass_0_bits_fflags_bits_uop_shift,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_lrs3_rtype,
  output        io_bypass_0_bits_fflags_bits_uop_rflag,
  output        io_bypass_0_bits_fflags_bits_uop_wflag,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_prflag,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_pwflag,
  output        io_bypass_0_bits_fflags_bits_uop_pflag_busy,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_stale_pflag,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_op1_sel,
  output [3:0]  io_bypass_0_bits_fflags_bits_uop_op2_sel,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_split_num,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_self_index,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_0_bits_fflags_bits_uop_address_num,
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
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_ctrl_op3_sel,
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
  output [4:0]  io_bypass_0_bits_fflags_bits_uop_ldq_idx,
  output [4:0]  io_bypass_0_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_bypass_0_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_pdst,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_prs1,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_prs2,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_prs3,
  output [4:0]  io_bypass_0_bits_fflags_bits_uop_ppred,
  output        io_bypass_0_bits_fflags_bits_uop_prs1_busy,
  output        io_bypass_0_bits_fflags_bits_uop_prs2_busy,
  output        io_bypass_0_bits_fflags_bits_uop_prs3_busy,
  output        io_bypass_0_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_bypass_0_bits_fflags_bits_uop_stale_pdst,
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
  output [3:0]  io_bypass_0_bits_flagdata,
  output        io_bypass_0_bits_fflagdata_valid,
  output        io_bypass_0_bits_fflagdata_bits_uop_switch,
  output        io_bypass_0_bits_fflagdata_bits_uop_switch_off,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_unicore,
  output [2:0]  io_bypass_0_bits_fflagdata_bits_uop_shift,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs3_rtype,
  output        io_bypass_0_bits_fflagdata_bits_uop_rflag,
  output        io_bypass_0_bits_fflagdata_bits_uop_wflag,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_prflag,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_pwflag,
  output        io_bypass_0_bits_fflagdata_bits_uop_pflag_busy,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_stale_pflag,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_op1_sel,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_op2_sel,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_split_num,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_self_index,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_rob_inst_idx,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_address_num,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_uopc,
  output [31:0] io_bypass_0_bits_fflagdata_bits_uop_inst,
  output [31:0] io_bypass_0_bits_fflagdata_bits_uop_debug_inst,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_rvc,
  output [39:0] io_bypass_0_bits_fflagdata_bits_uop_debug_pc,
  output [2:0]  io_bypass_0_bits_fflagdata_bits_uop_iq_type,
  output [9:0]  io_bypass_0_bits_fflagdata_bits_uop_fu_code,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_br_type,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_op1_sel,
  output [2:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_op2_sel,
  output [2:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_imm_sel,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_op_fcn,
  output        io_bypass_0_bits_fflagdata_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_csr_cmd,
  output        io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_load,
  output        io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_sta,
  output        io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_std,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_ctrl_op3_sel,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_iw_state,
  output        io_bypass_0_bits_fflagdata_bits_uop_iw_p1_poisoned,
  output        io_bypass_0_bits_fflagdata_bits_uop_iw_p2_poisoned,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_br,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_jalr,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_jal,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_sfb,
  output [11:0] io_bypass_0_bits_fflagdata_bits_uop_br_mask,
  output [3:0]  io_bypass_0_bits_fflagdata_bits_uop_br_tag,
  output [4:0]  io_bypass_0_bits_fflagdata_bits_uop_ftq_idx,
  output        io_bypass_0_bits_fflagdata_bits_uop_edge_inst,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_pc_lob,
  output        io_bypass_0_bits_fflagdata_bits_uop_taken,
  output [19:0] io_bypass_0_bits_fflagdata_bits_uop_imm_packed,
  output [11:0] io_bypass_0_bits_fflagdata_bits_uop_csr_addr,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_rob_idx,
  output [4:0]  io_bypass_0_bits_fflagdata_bits_uop_ldq_idx,
  output [4:0]  io_bypass_0_bits_fflagdata_bits_uop_stq_idx,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_rxq_idx,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_pdst,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_prs1,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_prs2,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_prs3,
  output [4:0]  io_bypass_0_bits_fflagdata_bits_uop_ppred,
  output        io_bypass_0_bits_fflagdata_bits_uop_prs1_busy,
  output        io_bypass_0_bits_fflagdata_bits_uop_prs2_busy,
  output        io_bypass_0_bits_fflagdata_bits_uop_prs3_busy,
  output        io_bypass_0_bits_fflagdata_bits_uop_ppred_busy,
  output [6:0]  io_bypass_0_bits_fflagdata_bits_uop_stale_pdst,
  output        io_bypass_0_bits_fflagdata_bits_uop_exception,
  output [63:0] io_bypass_0_bits_fflagdata_bits_uop_exc_cause,
  output        io_bypass_0_bits_fflagdata_bits_uop_bypassable,
  output [4:0]  io_bypass_0_bits_fflagdata_bits_uop_mem_cmd,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_mem_size,
  output        io_bypass_0_bits_fflagdata_bits_uop_mem_signed,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_fence,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_fencei,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_amo,
  output        io_bypass_0_bits_fflagdata_bits_uop_uses_ldq,
  output        io_bypass_0_bits_fflagdata_bits_uop_uses_stq,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_sys_pc2epc,
  output        io_bypass_0_bits_fflagdata_bits_uop_is_unique,
  output        io_bypass_0_bits_fflagdata_bits_uop_flush_on_commit,
  output        io_bypass_0_bits_fflagdata_bits_uop_ldst_is_rs1,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_ldst,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs1,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs2,
  output [5:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs3,
  output        io_bypass_0_bits_fflagdata_bits_uop_ldst_val,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_dst_rtype,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs1_rtype,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_lrs2_rtype,
  output        io_bypass_0_bits_fflagdata_bits_uop_frs3_en,
  output        io_bypass_0_bits_fflagdata_bits_uop_fp_val,
  output        io_bypass_0_bits_fflagdata_bits_uop_fp_single,
  output        io_bypass_0_bits_fflagdata_bits_uop_xcpt_pf_if,
  output        io_bypass_0_bits_fflagdata_bits_uop_xcpt_ae_if,
  output        io_bypass_0_bits_fflagdata_bits_uop_xcpt_ma_if,
  output        io_bypass_0_bits_fflagdata_bits_uop_bp_debug_if,
  output        io_bypass_0_bits_fflagdata_bits_uop_bp_xcpt_if,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_debug_fsrc,
  output [1:0]  io_bypass_0_bits_fflagdata_bits_uop_debug_tsrc,
  output [31:0] io_bypass_0_bits_fflagdata_bits_fflag,
  output        io_brinfo_uop_switch,
  output        io_brinfo_uop_switch_off,
  output        io_brinfo_uop_is_unicore,
  output [2:0]  io_brinfo_uop_shift,
  output [1:0]  io_brinfo_uop_lrs3_rtype,
  output        io_brinfo_uop_rflag,
  output        io_brinfo_uop_wflag,
  output [3:0]  io_brinfo_uop_prflag,
  output [3:0]  io_brinfo_uop_pwflag,
  output        io_brinfo_uop_pflag_busy,
  output [3:0]  io_brinfo_uop_stale_pflag,
  output [3:0]  io_brinfo_uop_op1_sel,
  output [3:0]  io_brinfo_uop_op2_sel,
  output [5:0]  io_brinfo_uop_split_num,
  output [5:0]  io_brinfo_uop_self_index,
  output [5:0]  io_brinfo_uop_rob_inst_idx,
  output [5:0]  io_brinfo_uop_address_num,
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
  output [1:0]  io_brinfo_uop_ctrl_op3_sel,
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
  output [4:0]  io_brinfo_uop_ldq_idx,
  output [4:0]  io_brinfo_uop_stq_idx,
  output [1:0]  io_brinfo_uop_rxq_idx,
  output [6:0]  io_brinfo_uop_pdst,
  output [6:0]  io_brinfo_uop_prs1,
  output [6:0]  io_brinfo_uop_prs2,
  output [6:0]  io_brinfo_uop_prs3,
  output [4:0]  io_brinfo_uop_ppred,
  output        io_brinfo_uop_prs1_busy,
  output        io_brinfo_uop_prs2_busy,
  output        io_brinfo_uop_prs3_busy,
  output        io_brinfo_uop_ppred_busy,
  output [6:0]  io_brinfo_uop_stale_pdst,
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
  output [31:0] io_brinfo_target_offset
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
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
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [63:0] _RAND_22;
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
  reg [63:0] _RAND_66;
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
  reg [63:0] _RAND_100;
  reg [31:0] _RAND_101;
`endif // RANDOMIZE_REG_INIT
  wire  alu_clock; // @[functional-unit.scala 559:19]
  wire  alu_reset; // @[functional-unit.scala 559:19]
  wire  alu_io_dw; // @[functional-unit.scala 559:19]
  wire [3:0] alu_io_fn; // @[functional-unit.scala 559:19]
  wire [63:0] alu_io_in2; // @[functional-unit.scala 559:19]
  wire [63:0] alu_io_in1; // @[functional-unit.scala 559:19]
  wire [63:0] alu_io_out; // @[functional-unit.scala 559:19]
  wire [63:0] alu_io_adder_out; // @[functional-unit.scala 559:19]
  wire  alu_io_cmp_out; // @[functional-unit.scala 559:19]
  wire  unicore_alu_clock; // @[functional-unit.scala 566:27]
  wire  unicore_alu_reset; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_switch; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_switch_off; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_is_unicore; // @[functional-unit.scala 566:27]
  wire [2:0] unicore_alu_io_uop_shift; // @[functional-unit.scala 566:27]
  wire [1:0] unicore_alu_io_uop_lrs3_rtype; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_rflag; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_wflag; // @[functional-unit.scala 566:27]
  wire [3:0] unicore_alu_io_uop_prflag; // @[functional-unit.scala 566:27]
  wire [3:0] unicore_alu_io_uop_pwflag; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_pflag_busy; // @[functional-unit.scala 566:27]
  wire [3:0] unicore_alu_io_uop_stale_pflag; // @[functional-unit.scala 566:27]
  wire [3:0] unicore_alu_io_uop_op1_sel; // @[functional-unit.scala 566:27]
  wire [3:0] unicore_alu_io_uop_op2_sel; // @[functional-unit.scala 566:27]
  wire [5:0] unicore_alu_io_uop_split_num; // @[functional-unit.scala 566:27]
  wire [5:0] unicore_alu_io_uop_self_index; // @[functional-unit.scala 566:27]
  wire [5:0] unicore_alu_io_uop_rob_inst_idx; // @[functional-unit.scala 566:27]
  wire [5:0] unicore_alu_io_uop_address_num; // @[functional-unit.scala 566:27]
  wire [6:0] unicore_alu_io_uop_uopc; // @[functional-unit.scala 566:27]
  wire [31:0] unicore_alu_io_uop_inst; // @[functional-unit.scala 566:27]
  wire [31:0] unicore_alu_io_uop_debug_inst; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_is_rvc; // @[functional-unit.scala 566:27]
  wire [39:0] unicore_alu_io_uop_debug_pc; // @[functional-unit.scala 566:27]
  wire [2:0] unicore_alu_io_uop_iq_type; // @[functional-unit.scala 566:27]
  wire [9:0] unicore_alu_io_uop_fu_code; // @[functional-unit.scala 566:27]
  wire [3:0] unicore_alu_io_uop_ctrl_br_type; // @[functional-unit.scala 566:27]
  wire [1:0] unicore_alu_io_uop_ctrl_op1_sel; // @[functional-unit.scala 566:27]
  wire [2:0] unicore_alu_io_uop_ctrl_op2_sel; // @[functional-unit.scala 566:27]
  wire [2:0] unicore_alu_io_uop_ctrl_imm_sel; // @[functional-unit.scala 566:27]
  wire [3:0] unicore_alu_io_uop_ctrl_op_fcn; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_ctrl_fcn_dw; // @[functional-unit.scala 566:27]
  wire [2:0] unicore_alu_io_uop_ctrl_csr_cmd; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_ctrl_is_load; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_ctrl_is_sta; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_ctrl_is_std; // @[functional-unit.scala 566:27]
  wire [1:0] unicore_alu_io_uop_ctrl_op3_sel; // @[functional-unit.scala 566:27]
  wire [1:0] unicore_alu_io_uop_iw_state; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_iw_p1_poisoned; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_iw_p2_poisoned; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_is_br; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_is_jalr; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_is_jal; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_is_sfb; // @[functional-unit.scala 566:27]
  wire [11:0] unicore_alu_io_uop_br_mask; // @[functional-unit.scala 566:27]
  wire [3:0] unicore_alu_io_uop_br_tag; // @[functional-unit.scala 566:27]
  wire [4:0] unicore_alu_io_uop_ftq_idx; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_edge_inst; // @[functional-unit.scala 566:27]
  wire [5:0] unicore_alu_io_uop_pc_lob; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_taken; // @[functional-unit.scala 566:27]
  wire [19:0] unicore_alu_io_uop_imm_packed; // @[functional-unit.scala 566:27]
  wire [11:0] unicore_alu_io_uop_csr_addr; // @[functional-unit.scala 566:27]
  wire [5:0] unicore_alu_io_uop_rob_idx; // @[functional-unit.scala 566:27]
  wire [4:0] unicore_alu_io_uop_ldq_idx; // @[functional-unit.scala 566:27]
  wire [4:0] unicore_alu_io_uop_stq_idx; // @[functional-unit.scala 566:27]
  wire [1:0] unicore_alu_io_uop_rxq_idx; // @[functional-unit.scala 566:27]
  wire [6:0] unicore_alu_io_uop_pdst; // @[functional-unit.scala 566:27]
  wire [6:0] unicore_alu_io_uop_prs1; // @[functional-unit.scala 566:27]
  wire [6:0] unicore_alu_io_uop_prs2; // @[functional-unit.scala 566:27]
  wire [6:0] unicore_alu_io_uop_prs3; // @[functional-unit.scala 566:27]
  wire [4:0] unicore_alu_io_uop_ppred; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_prs1_busy; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_prs2_busy; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_prs3_busy; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_ppred_busy; // @[functional-unit.scala 566:27]
  wire [6:0] unicore_alu_io_uop_stale_pdst; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_exception; // @[functional-unit.scala 566:27]
  wire [63:0] unicore_alu_io_uop_exc_cause; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_bypassable; // @[functional-unit.scala 566:27]
  wire [4:0] unicore_alu_io_uop_mem_cmd; // @[functional-unit.scala 566:27]
  wire [1:0] unicore_alu_io_uop_mem_size; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_mem_signed; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_is_fence; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_is_fencei; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_is_amo; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_uses_ldq; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_uses_stq; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_is_sys_pc2epc; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_is_unique; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_flush_on_commit; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_ldst_is_rs1; // @[functional-unit.scala 566:27]
  wire [5:0] unicore_alu_io_uop_ldst; // @[functional-unit.scala 566:27]
  wire [5:0] unicore_alu_io_uop_lrs1; // @[functional-unit.scala 566:27]
  wire [5:0] unicore_alu_io_uop_lrs2; // @[functional-unit.scala 566:27]
  wire [5:0] unicore_alu_io_uop_lrs3; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_ldst_val; // @[functional-unit.scala 566:27]
  wire [1:0] unicore_alu_io_uop_dst_rtype; // @[functional-unit.scala 566:27]
  wire [1:0] unicore_alu_io_uop_lrs1_rtype; // @[functional-unit.scala 566:27]
  wire [1:0] unicore_alu_io_uop_lrs2_rtype; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_frs3_en; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_fp_val; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_fp_single; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_xcpt_pf_if; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_xcpt_ae_if; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_xcpt_ma_if; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_bp_debug_if; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_uop_bp_xcpt_if; // @[functional-unit.scala 566:27]
  wire [1:0] unicore_alu_io_uop_debug_fsrc; // @[functional-unit.scala 566:27]
  wire [1:0] unicore_alu_io_uop_debug_tsrc; // @[functional-unit.scala 566:27]
  wire [3:0] unicore_alu_io_flagdata; // @[functional-unit.scala 566:27]
  wire [63:0] unicore_alu_io_riscv_op1_data; // @[functional-unit.scala 566:27]
  wire [63:0] unicore_alu_io_rs1_data; // @[functional-unit.scala 566:27]
  wire [63:0] unicore_alu_io_rs2_data; // @[functional-unit.scala 566:27]
  wire [63:0] unicore_alu_io_out; // @[functional-unit.scala 566:27]
  wire  unicore_alu_io_flagdata_out_valid; // @[functional-unit.scala 566:27]
  wire [3:0] unicore_alu_io_flagdata_out_bits; // @[functional-unit.scala 566:27]
  reg  REG_0; // @[functional-unit.scala 239:27]
  reg  REG_1_0_switch; // @[functional-unit.scala 240:23]
  reg  REG_1_0_switch_off; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_unicore; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_0_shift; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_lrs3_rtype; // @[functional-unit.scala 240:23]
  reg  REG_1_0_rflag; // @[functional-unit.scala 240:23]
  reg  REG_1_0_wflag; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_prflag; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_pwflag; // @[functional-unit.scala 240:23]
  reg  REG_1_0_pflag_busy; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_stale_pflag; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_op1_sel; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_op2_sel; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_split_num; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_self_index; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_rob_inst_idx; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_address_num; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_uopc; // @[functional-unit.scala 240:23]
  reg [31:0] REG_1_0_inst; // @[functional-unit.scala 240:23]
  reg [31:0] REG_1_0_debug_inst; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_rvc; // @[functional-unit.scala 240:23]
  reg [39:0] REG_1_0_debug_pc; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_0_iq_type; // @[functional-unit.scala 240:23]
  reg [9:0] REG_1_0_fu_code; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_ctrl_br_type; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_ctrl_op1_sel; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_0_ctrl_op2_sel; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_0_ctrl_imm_sel; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_ctrl_op_fcn; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ctrl_fcn_dw; // @[functional-unit.scala 240:23]
  reg [2:0] REG_1_0_ctrl_csr_cmd; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ctrl_is_load; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ctrl_is_sta; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ctrl_is_std; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_ctrl_op3_sel; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_iw_state; // @[functional-unit.scala 240:23]
  reg  REG_1_0_iw_p1_poisoned; // @[functional-unit.scala 240:23]
  reg  REG_1_0_iw_p2_poisoned; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_br; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_jalr; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_jal; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_sfb; // @[functional-unit.scala 240:23]
  reg [11:0] REG_1_0_br_mask; // @[functional-unit.scala 240:23]
  reg [3:0] REG_1_0_br_tag; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_0_ftq_idx; // @[functional-unit.scala 240:23]
  reg  REG_1_0_edge_inst; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_pc_lob; // @[functional-unit.scala 240:23]
  reg  REG_1_0_taken; // @[functional-unit.scala 240:23]
  reg [19:0] REG_1_0_imm_packed; // @[functional-unit.scala 240:23]
  reg [11:0] REG_1_0_csr_addr; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_rob_idx; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_0_ldq_idx; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_0_stq_idx; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_rxq_idx; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_pdst; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_prs1; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_prs2; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_prs3; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_0_ppred; // @[functional-unit.scala 240:23]
  reg  REG_1_0_prs1_busy; // @[functional-unit.scala 240:23]
  reg  REG_1_0_prs2_busy; // @[functional-unit.scala 240:23]
  reg  REG_1_0_prs3_busy; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ppred_busy; // @[functional-unit.scala 240:23]
  reg [6:0] REG_1_0_stale_pdst; // @[functional-unit.scala 240:23]
  reg  REG_1_0_exception; // @[functional-unit.scala 240:23]
  reg [63:0] REG_1_0_exc_cause; // @[functional-unit.scala 240:23]
  reg  REG_1_0_bypassable; // @[functional-unit.scala 240:23]
  reg [4:0] REG_1_0_mem_cmd; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_mem_size; // @[functional-unit.scala 240:23]
  reg  REG_1_0_mem_signed; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_fence; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_fencei; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_amo; // @[functional-unit.scala 240:23]
  reg  REG_1_0_uses_ldq; // @[functional-unit.scala 240:23]
  reg  REG_1_0_uses_stq; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_sys_pc2epc; // @[functional-unit.scala 240:23]
  reg  REG_1_0_is_unique; // @[functional-unit.scala 240:23]
  reg  REG_1_0_flush_on_commit; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ldst_is_rs1; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_ldst; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_lrs1; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_lrs2; // @[functional-unit.scala 240:23]
  reg [5:0] REG_1_0_lrs3; // @[functional-unit.scala 240:23]
  reg  REG_1_0_ldst_val; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_dst_rtype; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_lrs1_rtype; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_lrs2_rtype; // @[functional-unit.scala 240:23]
  reg  REG_1_0_frs3_en; // @[functional-unit.scala 240:23]
  reg  REG_1_0_fp_val; // @[functional-unit.scala 240:23]
  reg  REG_1_0_fp_single; // @[functional-unit.scala 240:23]
  reg  REG_1_0_xcpt_pf_if; // @[functional-unit.scala 240:23]
  reg  REG_1_0_xcpt_ae_if; // @[functional-unit.scala 240:23]
  reg  REG_1_0_xcpt_ma_if; // @[functional-unit.scala 240:23]
  reg  REG_1_0_bp_debug_if; // @[functional-unit.scala 240:23]
  reg  REG_1_0_bp_xcpt_if; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_debug_fsrc; // @[functional-unit.scala 240:23]
  reg [1:0] REG_1_0_debug_tsrc; // @[functional-unit.scala 240:23]
  wire [11:0] _T = io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask; // @[util.scala 175:51]
  wire  _T_1 = _T != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_6 = ~io_brupdate_b1_resolve_mask; // @[util.scala 142:27]
  wire [11:0] _T_8 = io_brupdate_b1_mispredict_mask & REG_1_0_br_mask; // @[util.scala 175:51]
  wire  _T_9 = _T_8 != 12'h0; // @[util.scala 175:59]
  wire [5:0] hi_hi = io_req_bits_uop_inst[23] ? 6'h3f : 6'h0; // @[Bitwise.scala 72:12]
  wire [23:0] hi_lo = io_req_bits_uop_inst[23:0]; // @[functional-unit.scala 531:54]
  wire [31:0] _T_18 = {hi_hi,hi_lo,2'h0}; // @[functional-unit.scala 531:72]
  wire  _T_20 = io_req_bits_uop_imm_packed[19]; // @[util.scala 330:37]
  wire  _T_21 = io_req_bits_uop_ctrl_imm_sel == 3'h3; // @[util.scala 331:27]
  wire [10:0] _T_23 = io_req_bits_uop_imm_packed[18:8]; // @[util.scala 331:46]
  wire  _T_26 = io_req_bits_uop_ctrl_imm_sel == 3'h4; // @[util.scala 332:44]
  wire [7:0] _T_29 = io_req_bits_uop_imm_packed[7:0]; // @[util.scala 332:62]
  wire  _T_36 = io_req_bits_uop_imm_packed[8]; // @[util.scala 334:60]
  wire  _T_37 = _T_26 | io_req_bits_uop_ctrl_imm_sel == 3'h2 ? $signed(_T_36) : $signed(_T_20); // @[util.scala 334:21]
  wire [4:0] _T_41 = io_req_bits_uop_imm_packed[18:14]; // @[util.scala 335:52]
  wire [4:0] _T_45 = io_req_bits_uop_imm_packed[13:9]; // @[util.scala 336:51]
  wire  lo_lo = io_req_bits_uop_ctrl_imm_sel == 3'h1 | io_req_bits_uop_ctrl_imm_sel == 3'h0 ? $signed(_T_36) : $signed(1'sh0
    ); // @[Cat.scala 30:58]
  wire [4:0] lo_hi_lo = _T_21 ? $signed(5'sh0) : $signed(_T_45); // @[Cat.scala 30:58]
  wire [4:0] lo_hi_hi = _T_21 ? $signed(5'sh0) : $signed(_T_41); // @[Cat.scala 30:58]
  wire  hi_lo_lo = _T_21 ? $signed(1'sh0) : $signed(_T_37); // @[Cat.scala 30:58]
  wire [7:0] hi_lo_hi = _T_21 | io_req_bits_uop_ctrl_imm_sel == 3'h4 ? $signed(_T_29) : $signed({8{_T_20}}); // @[Cat.scala 30:58]
  wire [10:0] hi_hi_lo = io_req_bits_uop_ctrl_imm_sel == 3'h3 ? $signed(_T_23) : $signed({11{_T_20}}); // @[Cat.scala 30:58]
  wire  hi_hi_hi = io_req_bits_uop_imm_packed[19]; // @[Cat.scala 30:58]
  wire [31:0] _T_54 = {hi_hi_hi,hi_hi_lo,hi_lo_hi,hi_lo_lo,lo_hi_hi,lo_hi_lo,lo_lo}; // @[util.scala 339:60]
  wire [31:0] lo_1 = io_req_bits_uop_ctrl_imm_sel == 3'h5 ? $signed(_T_18) : $signed(_T_54); // @[functional-unit.scala 552:69]
  wire [31:0] hi_2 = lo_1[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_59 = {hi_2,lo_1}; // @[Cat.scala 30:58]
  wire [2:0] _T_64 = io_req_bits_uop_is_rvc ? 3'h2 : 3'h4; // @[functional-unit.scala 555:56]
  wire [2:0] _T_65 = io_req_bits_uop_ctrl_op2_sel == 3'h3 ? _T_64 : 3'h0; // @[functional-unit.scala 555:21]
  wire [63:0] _T_66 = io_req_bits_uop_ctrl_op2_sel == 3'h0 ? io_req_bits_rs2_data : {{61'd0}, _T_65}; // @[functional-unit.scala 554:21]
  wire [63:0] _T_67 = io_req_bits_uop_ctrl_op2_sel == 3'h4 ? {{59'd0}, io_req_bits_uop_prs1[4:0]} : _T_66; // @[functional-unit.scala 553:21]
  wire  killed = io_req_bits_kill | _T_1; // @[functional-unit.scala 579:26]
  wire  br_eq = io_req_bits_rs1_data == io_req_bits_rs2_data; // @[functional-unit.scala 585:21]
  wire  br_ltu = io_req_bits_rs1_data < io_req_bits_rs2_data; // @[functional-unit.scala 586:28]
  wire  _T_79 = io_req_bits_rs1_data[63] & ~io_req_bits_rs2_data[63]; // @[functional-unit.scala 588:29]
  wire  br_lt = ~(io_req_bits_rs1_data[63] ^ io_req_bits_rs2_data[63]) & br_ltu | _T_79; // @[functional-unit.scala 587:55]
  wire  flag_rval_n = io_req_bits_flagdata[0]; // @[functional-unit.scala 597:48]
  wire  flag_rval_z = io_req_bits_flagdata[1]; // @[functional-unit.scala 597:48]
  wire  flag_rval_c = io_req_bits_flagdata[2]; // @[functional-unit.scala 597:48]
  wire  flag_rval_v = io_req_bits_flagdata[3]; // @[functional-unit.scala 597:48]
  wire  _T_86 = ~flag_rval_z; // @[functional-unit.scala 600:30]
  wire  _T_87 = ~flag_rval_c; // @[functional-unit.scala 602:30]
  wire  _T_89 = flag_rval_c & _T_86; // @[functional-unit.scala 603:43]
  wire  _T_91 = _T_87 | flag_rval_z; // @[functional-unit.scala 604:43]
  wire  _T_92 = flag_rval_n == flag_rval_v; // @[functional-unit.scala 605:43]
  wire  _T_93 = flag_rval_n != flag_rval_v; // @[functional-unit.scala 606:43]
  wire  _T_96 = _T_92 & _T_86; // @[functional-unit.scala 607:60]
  wire  _T_98 = _T_93 | flag_rval_z; // @[functional-unit.scala 608:60]
  wire  _T_102 = 4'h1 == io_req_bits_uop_inst[28:25] ? _T_86 : 4'h0 == io_req_bits_uop_inst[28:25] & flag_rval_z; // @[Mux.scala 80:57]
  wire  _T_104 = 4'h2 == io_req_bits_uop_inst[28:25] ? flag_rval_c : _T_102; // @[Mux.scala 80:57]
  wire  _T_106 = 4'h3 == io_req_bits_uop_inst[28:25] ? _T_87 : _T_104; // @[Mux.scala 80:57]
  wire  _T_108 = 4'h8 == io_req_bits_uop_inst[28:25] ? _T_89 : _T_106; // @[Mux.scala 80:57]
  wire  _T_110 = 4'h9 == io_req_bits_uop_inst[28:25] ? _T_91 : _T_108; // @[Mux.scala 80:57]
  wire  _T_112 = 4'ha == io_req_bits_uop_inst[28:25] ? _T_92 : _T_110; // @[Mux.scala 80:57]
  wire  _T_114 = 4'hb == io_req_bits_uop_inst[28:25] ? _T_93 : _T_112; // @[Mux.scala 80:57]
  wire  _T_116 = 4'hc == io_req_bits_uop_inst[28:25] ? _T_96 : _T_114; // @[Mux.scala 80:57]
  wire  br_cc = 4'hd == io_req_bits_uop_inst[28:25] ? _T_98 : _T_116; // @[Mux.scala 80:57]
  wire [1:0] _T_119 = ~br_eq ? 2'h1 : 2'h0; // @[functional-unit.scala 618:38]
  wire [1:0] _T_120 = br_eq ? 2'h1 : 2'h0; // @[functional-unit.scala 619:38]
  wire [1:0] _T_122 = ~br_lt ? 2'h1 : 2'h0; // @[functional-unit.scala 620:38]
  wire [1:0] _T_124 = ~br_ltu ? 2'h1 : 2'h0; // @[functional-unit.scala 621:38]
  wire [1:0] _T_125 = br_lt ? 2'h1 : 2'h0; // @[functional-unit.scala 622:38]
  wire [1:0] _T_126 = br_ltu ? 2'h1 : 2'h0; // @[functional-unit.scala 623:38]
  wire [1:0] _T_127 = br_cc ? 2'h1 : 2'h0; // @[functional-unit.scala 626:38]
  wire [1:0] _T_131 = 4'h1 == io_req_bits_uop_ctrl_br_type ? _T_119 : 2'h0; // @[Mux.scala 80:57]
  wire [1:0] _T_133 = 4'h2 == io_req_bits_uop_ctrl_br_type ? _T_120 : _T_131; // @[Mux.scala 80:57]
  wire [1:0] _T_135 = 4'h3 == io_req_bits_uop_ctrl_br_type ? _T_122 : _T_133; // @[Mux.scala 80:57]
  wire [1:0] _T_137 = 4'h4 == io_req_bits_uop_ctrl_br_type ? _T_124 : _T_135; // @[Mux.scala 80:57]
  wire [1:0] _T_139 = 4'h5 == io_req_bits_uop_ctrl_br_type ? _T_125 : _T_137; // @[Mux.scala 80:57]
  wire [1:0] _T_141 = 4'h6 == io_req_bits_uop_ctrl_br_type ? _T_126 : _T_139; // @[Mux.scala 80:57]
  wire [1:0] _T_143 = 4'h7 == io_req_bits_uop_ctrl_br_type ? 2'h1 : _T_141; // @[Mux.scala 80:57]
  wire [1:0] _T_145 = 4'h8 == io_req_bits_uop_ctrl_br_type ? 2'h2 : _T_143; // @[Mux.scala 80:57]
  wire [1:0] pc_sel = 4'h9 == io_req_bits_uop_ctrl_br_type ? _T_127 : _T_145; // @[Mux.scala 80:57]
  wire  _T_147 = ~killed; // @[functional-unit.scala 630:20]
  wire  _T_148 = io_req_valid & _T_147; // @[functional-unit.scala 629:31]
  wire  _T_150 = io_req_bits_uop_is_br | io_req_bits_uop_is_jalr | io_req_bits_uop_is_jal; // @[functional-unit.scala 631:46]
  wire  _T_151 = _T_148 & _T_150; // @[functional-unit.scala 630:28]
  wire  _T_152 = pc_sel != 2'h0; // @[functional-unit.scala 632:28]
  wire  is_taken = _T_151 & _T_152; // @[functional-unit.scala 631:61]
  wire  is_br = _T_148 & io_req_bits_uop_is_br & ~io_req_bits_uop_is_sfb; // @[functional-unit.scala 637:61]
  wire  is_jalr = _T_148 & io_req_bits_uop_is_jalr; // @[functional-unit.scala 639:48]
  wire  _T_161 = is_br | is_jalr; // @[functional-unit.scala 641:15]
  wire  _GEN_2 = pc_sel == 2'h0 & io_req_bits_uop_taken; // @[functional-unit.scala 645:32 functional-unit.scala 646:18]
  wire  _GEN_3 = pc_sel == 2'h1 ? ~io_req_bits_uop_taken : _GEN_2; // @[functional-unit.scala 648:32 functional-unit.scala 649:18]
  wire  mispredict = (is_br | is_jalr) & _GEN_3; // @[functional-unit.scala 641:27]
  wire [2:0] _T_170 = is_br ? 3'h1 : 3'h0; // @[functional-unit.scala 660:31]
  wire  _T_172 = io_req_bits_uop_is_unicore & _T_161; // @[functional-unit.scala 668:25]
  reg [4:0] value_lo; // @[Counters.scala 45:37]
  wire [5:0] nextSmall = value_lo + 5'h1; // @[Counters.scala 46:33]
  reg [26:0] value_hi; // @[Counters.scala 50:27]
  wire [26:0] _large_r_T_1 = value_hi + 27'h1; // @[Counters.scala 51:55]
  wire [31:0] value = {value_hi,value_lo}; // @[Cat.scala 30:58]
  wire [31:0] _T_178 = io_req_bits_uop_ctrl_imm_sel == 3'h5 ? $signed(_T_18) : $signed(_T_54); // @[functional-unit.scala 691:77]
  wire [31:0] _T_181 = $signed(_T_178) + 32'sh4; // @[functional-unit.scala 691:84]
  wire [31:0] _T_182 = io_req_bits_uop_uopc == 7'h26 ? $signed(32'sh0) : $signed(_T_181); // @[functional-unit.scala 691:26]
  reg [63:0] r_data_0; // @[functional-unit.scala 756:19]
  wire [63:0] alu_out_riscv = io_req_bits_uop_uopc == 7'h6d ? io_req_bits_rs2_data : alu_io_out; // @[functional-unit.scala 761:8]
  wire [63:0] _T_195 = io_req_bits_uop_ctrl_br_type == 4'h9 & ~br_cc ? io_req_bits_rs1_data : unicore_alu_io_out; // @[functional-unit.scala 765:52]
  reg [3:0] r_flag_0; // @[functional-unit.scala 768:19]
  wire  _T_198 = io_req_bits_uop_is_unicore & io_req_bits_uop_wflag & ~io_req_bits_uop_fp_val; // @[functional-unit.scala 771:72]
  wire [3:0] _T_199 = unicore_alu_io_flagdata_out_valid ? io_req_bits_flagdata : unicore_alu_io_flagdata_out_bits; // @[functional-unit.scala 772:19]
  ALU alu ( // @[functional-unit.scala 559:19]
    .clock(alu_clock),
    .reset(alu_reset),
    .io_dw(alu_io_dw),
    .io_fn(alu_io_fn),
    .io_in2(alu_io_in2),
    .io_in1(alu_io_in1),
    .io_out(alu_io_out),
    .io_adder_out(alu_io_adder_out),
    .io_cmp_out(alu_io_cmp_out)
  );
  UniCoreALU_1 unicore_alu ( // @[functional-unit.scala 566:27]
    .clock(unicore_alu_clock),
    .reset(unicore_alu_reset),
    .io_uop_switch(unicore_alu_io_uop_switch),
    .io_uop_switch_off(unicore_alu_io_uop_switch_off),
    .io_uop_is_unicore(unicore_alu_io_uop_is_unicore),
    .io_uop_shift(unicore_alu_io_uop_shift),
    .io_uop_lrs3_rtype(unicore_alu_io_uop_lrs3_rtype),
    .io_uop_rflag(unicore_alu_io_uop_rflag),
    .io_uop_wflag(unicore_alu_io_uop_wflag),
    .io_uop_prflag(unicore_alu_io_uop_prflag),
    .io_uop_pwflag(unicore_alu_io_uop_pwflag),
    .io_uop_pflag_busy(unicore_alu_io_uop_pflag_busy),
    .io_uop_stale_pflag(unicore_alu_io_uop_stale_pflag),
    .io_uop_op1_sel(unicore_alu_io_uop_op1_sel),
    .io_uop_op2_sel(unicore_alu_io_uop_op2_sel),
    .io_uop_split_num(unicore_alu_io_uop_split_num),
    .io_uop_self_index(unicore_alu_io_uop_self_index),
    .io_uop_rob_inst_idx(unicore_alu_io_uop_rob_inst_idx),
    .io_uop_address_num(unicore_alu_io_uop_address_num),
    .io_uop_uopc(unicore_alu_io_uop_uopc),
    .io_uop_inst(unicore_alu_io_uop_inst),
    .io_uop_debug_inst(unicore_alu_io_uop_debug_inst),
    .io_uop_is_rvc(unicore_alu_io_uop_is_rvc),
    .io_uop_debug_pc(unicore_alu_io_uop_debug_pc),
    .io_uop_iq_type(unicore_alu_io_uop_iq_type),
    .io_uop_fu_code(unicore_alu_io_uop_fu_code),
    .io_uop_ctrl_br_type(unicore_alu_io_uop_ctrl_br_type),
    .io_uop_ctrl_op1_sel(unicore_alu_io_uop_ctrl_op1_sel),
    .io_uop_ctrl_op2_sel(unicore_alu_io_uop_ctrl_op2_sel),
    .io_uop_ctrl_imm_sel(unicore_alu_io_uop_ctrl_imm_sel),
    .io_uop_ctrl_op_fcn(unicore_alu_io_uop_ctrl_op_fcn),
    .io_uop_ctrl_fcn_dw(unicore_alu_io_uop_ctrl_fcn_dw),
    .io_uop_ctrl_csr_cmd(unicore_alu_io_uop_ctrl_csr_cmd),
    .io_uop_ctrl_is_load(unicore_alu_io_uop_ctrl_is_load),
    .io_uop_ctrl_is_sta(unicore_alu_io_uop_ctrl_is_sta),
    .io_uop_ctrl_is_std(unicore_alu_io_uop_ctrl_is_std),
    .io_uop_ctrl_op3_sel(unicore_alu_io_uop_ctrl_op3_sel),
    .io_uop_iw_state(unicore_alu_io_uop_iw_state),
    .io_uop_iw_p1_poisoned(unicore_alu_io_uop_iw_p1_poisoned),
    .io_uop_iw_p2_poisoned(unicore_alu_io_uop_iw_p2_poisoned),
    .io_uop_is_br(unicore_alu_io_uop_is_br),
    .io_uop_is_jalr(unicore_alu_io_uop_is_jalr),
    .io_uop_is_jal(unicore_alu_io_uop_is_jal),
    .io_uop_is_sfb(unicore_alu_io_uop_is_sfb),
    .io_uop_br_mask(unicore_alu_io_uop_br_mask),
    .io_uop_br_tag(unicore_alu_io_uop_br_tag),
    .io_uop_ftq_idx(unicore_alu_io_uop_ftq_idx),
    .io_uop_edge_inst(unicore_alu_io_uop_edge_inst),
    .io_uop_pc_lob(unicore_alu_io_uop_pc_lob),
    .io_uop_taken(unicore_alu_io_uop_taken),
    .io_uop_imm_packed(unicore_alu_io_uop_imm_packed),
    .io_uop_csr_addr(unicore_alu_io_uop_csr_addr),
    .io_uop_rob_idx(unicore_alu_io_uop_rob_idx),
    .io_uop_ldq_idx(unicore_alu_io_uop_ldq_idx),
    .io_uop_stq_idx(unicore_alu_io_uop_stq_idx),
    .io_uop_rxq_idx(unicore_alu_io_uop_rxq_idx),
    .io_uop_pdst(unicore_alu_io_uop_pdst),
    .io_uop_prs1(unicore_alu_io_uop_prs1),
    .io_uop_prs2(unicore_alu_io_uop_prs2),
    .io_uop_prs3(unicore_alu_io_uop_prs3),
    .io_uop_ppred(unicore_alu_io_uop_ppred),
    .io_uop_prs1_busy(unicore_alu_io_uop_prs1_busy),
    .io_uop_prs2_busy(unicore_alu_io_uop_prs2_busy),
    .io_uop_prs3_busy(unicore_alu_io_uop_prs3_busy),
    .io_uop_ppred_busy(unicore_alu_io_uop_ppred_busy),
    .io_uop_stale_pdst(unicore_alu_io_uop_stale_pdst),
    .io_uop_exception(unicore_alu_io_uop_exception),
    .io_uop_exc_cause(unicore_alu_io_uop_exc_cause),
    .io_uop_bypassable(unicore_alu_io_uop_bypassable),
    .io_uop_mem_cmd(unicore_alu_io_uop_mem_cmd),
    .io_uop_mem_size(unicore_alu_io_uop_mem_size),
    .io_uop_mem_signed(unicore_alu_io_uop_mem_signed),
    .io_uop_is_fence(unicore_alu_io_uop_is_fence),
    .io_uop_is_fencei(unicore_alu_io_uop_is_fencei),
    .io_uop_is_amo(unicore_alu_io_uop_is_amo),
    .io_uop_uses_ldq(unicore_alu_io_uop_uses_ldq),
    .io_uop_uses_stq(unicore_alu_io_uop_uses_stq),
    .io_uop_is_sys_pc2epc(unicore_alu_io_uop_is_sys_pc2epc),
    .io_uop_is_unique(unicore_alu_io_uop_is_unique),
    .io_uop_flush_on_commit(unicore_alu_io_uop_flush_on_commit),
    .io_uop_ldst_is_rs1(unicore_alu_io_uop_ldst_is_rs1),
    .io_uop_ldst(unicore_alu_io_uop_ldst),
    .io_uop_lrs1(unicore_alu_io_uop_lrs1),
    .io_uop_lrs2(unicore_alu_io_uop_lrs2),
    .io_uop_lrs3(unicore_alu_io_uop_lrs3),
    .io_uop_ldst_val(unicore_alu_io_uop_ldst_val),
    .io_uop_dst_rtype(unicore_alu_io_uop_dst_rtype),
    .io_uop_lrs1_rtype(unicore_alu_io_uop_lrs1_rtype),
    .io_uop_lrs2_rtype(unicore_alu_io_uop_lrs2_rtype),
    .io_uop_frs3_en(unicore_alu_io_uop_frs3_en),
    .io_uop_fp_val(unicore_alu_io_uop_fp_val),
    .io_uop_fp_single(unicore_alu_io_uop_fp_single),
    .io_uop_xcpt_pf_if(unicore_alu_io_uop_xcpt_pf_if),
    .io_uop_xcpt_ae_if(unicore_alu_io_uop_xcpt_ae_if),
    .io_uop_xcpt_ma_if(unicore_alu_io_uop_xcpt_ma_if),
    .io_uop_bp_debug_if(unicore_alu_io_uop_bp_debug_if),
    .io_uop_bp_xcpt_if(unicore_alu_io_uop_bp_xcpt_if),
    .io_uop_debug_fsrc(unicore_alu_io_uop_debug_fsrc),
    .io_uop_debug_tsrc(unicore_alu_io_uop_debug_tsrc),
    .io_flagdata(unicore_alu_io_flagdata),
    .io_riscv_op1_data(unicore_alu_io_riscv_op1_data),
    .io_rs1_data(unicore_alu_io_rs1_data),
    .io_rs2_data(unicore_alu_io_rs2_data),
    .io_out(unicore_alu_io_out),
    .io_flagdata_out_valid(unicore_alu_io_flagdata_out_valid),
    .io_flagdata_out_bits(unicore_alu_io_flagdata_out_bits)
  );
  assign io_req_ready = 1'h1; // @[functional-unit.scala 236:16]
  assign io_resp_valid = REG_0 & ~_T_9; // @[functional-unit.scala 260:47]
  assign io_resp_bits_uop_switch = REG_1_0_switch; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_switch_off = REG_1_0_switch_off; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_unicore = REG_1_0_is_unicore; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_shift = REG_1_0_shift; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs3_rtype = REG_1_0_lrs3_rtype; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_rflag = REG_1_0_rflag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_wflag = REG_1_0_wflag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prflag = REG_1_0_prflag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_pwflag = REG_1_0_pwflag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_pflag_busy = REG_1_0_pflag_busy; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_stale_pflag = REG_1_0_stale_pflag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_op1_sel = REG_1_0_op1_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_op2_sel = REG_1_0_op2_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_split_num = REG_1_0_split_num; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_self_index = REG_1_0_self_index; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_rob_inst_idx = REG_1_0_rob_inst_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_address_num = REG_1_0_address_num; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_uopc = REG_1_0_uopc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_inst = REG_1_0_inst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_debug_inst = REG_1_0_debug_inst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_rvc = REG_1_0_is_rvc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_debug_pc = REG_1_0_debug_pc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_iq_type = REG_1_0_iq_type; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_fu_code = REG_1_0_fu_code; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_br_type = REG_1_0_ctrl_br_type; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_op1_sel = REG_1_0_ctrl_op1_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_op2_sel = REG_1_0_ctrl_op2_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_imm_sel = REG_1_0_ctrl_imm_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_op_fcn = REG_1_0_ctrl_op_fcn; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_fcn_dw = REG_1_0_ctrl_fcn_dw; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_csr_cmd = REG_1_0_ctrl_csr_cmd; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_is_load = REG_1_0_ctrl_is_load; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_is_sta = REG_1_0_ctrl_is_sta; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_is_std = REG_1_0_ctrl_is_std; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ctrl_op3_sel = REG_1_0_ctrl_op3_sel; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_iw_state = REG_1_0_iw_state; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_iw_p1_poisoned = REG_1_0_iw_p1_poisoned; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_iw_p2_poisoned = REG_1_0_iw_p2_poisoned; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_br = REG_1_0_is_br; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_jalr = REG_1_0_is_jalr; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_jal = REG_1_0_is_jal; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_sfb = REG_1_0_is_sfb; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_br_mask = REG_1_0_br_mask & _T_6; // @[util.scala 142:25]
  assign io_resp_bits_uop_br_tag = REG_1_0_br_tag; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ftq_idx = REG_1_0_ftq_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_edge_inst = REG_1_0_edge_inst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_pc_lob = REG_1_0_pc_lob; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_taken = REG_1_0_taken; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_imm_packed = REG_1_0_imm_packed; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_csr_addr = REG_1_0_csr_addr; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_rob_idx = REG_1_0_rob_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ldq_idx = REG_1_0_ldq_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_stq_idx = REG_1_0_stq_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_rxq_idx = REG_1_0_rxq_idx; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_pdst = REG_1_0_pdst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs1 = REG_1_0_prs1; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs2 = REG_1_0_prs2; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs3 = REG_1_0_prs3; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ppred = REG_1_0_ppred; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs1_busy = REG_1_0_prs1_busy; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs2_busy = REG_1_0_prs2_busy; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_prs3_busy = REG_1_0_prs3_busy; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ppred_busy = REG_1_0_ppred_busy; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_stale_pdst = REG_1_0_stale_pdst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_exception = REG_1_0_exception; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_exc_cause = REG_1_0_exc_cause; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_bypassable = REG_1_0_bypassable; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_mem_cmd = REG_1_0_mem_cmd; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_mem_size = REG_1_0_mem_size; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_mem_signed = REG_1_0_mem_signed; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_fence = REG_1_0_is_fence; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_fencei = REG_1_0_is_fencei; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_amo = REG_1_0_is_amo; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_uses_ldq = REG_1_0_uses_ldq; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_uses_stq = REG_1_0_uses_stq; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_sys_pc2epc = REG_1_0_is_sys_pc2epc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_is_unique = REG_1_0_is_unique; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_flush_on_commit = REG_1_0_flush_on_commit; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ldst_is_rs1 = REG_1_0_ldst_is_rs1; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ldst = REG_1_0_ldst; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs1 = REG_1_0_lrs1; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs2 = REG_1_0_lrs2; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs3 = REG_1_0_lrs3; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_ldst_val = REG_1_0_ldst_val; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_dst_rtype = REG_1_0_dst_rtype; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs1_rtype = REG_1_0_lrs1_rtype; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_lrs2_rtype = REG_1_0_lrs2_rtype; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_frs3_en = REG_1_0_frs3_en; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_fp_val = REG_1_0_fp_val; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_fp_single = REG_1_0_fp_single; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_xcpt_pf_if = REG_1_0_xcpt_pf_if; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_xcpt_ae_if = REG_1_0_xcpt_ae_if; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_xcpt_ma_if = REG_1_0_xcpt_ma_if; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_bp_debug_if = REG_1_0_bp_debug_if; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_bp_xcpt_if = REG_1_0_bp_xcpt_if; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_debug_fsrc = REG_1_0_debug_fsrc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_uop_debug_tsrc = REG_1_0_debug_tsrc; // @[functional-unit.scala 262:22]
  assign io_resp_bits_predicated = 1'h0; // @[functional-unit.scala 785:27]
  assign io_resp_bits_data = r_data_0; // @[functional-unit.scala 784:21]
  assign io_resp_bits_fflags_valid = 1'h0; // @[functional-unit.scala 810:29]
  assign io_resp_bits_fflags_bits_uop_switch = 1'h0;
  assign io_resp_bits_fflags_bits_uop_switch_off = 1'h0;
  assign io_resp_bits_fflags_bits_uop_is_unicore = 1'h0;
  assign io_resp_bits_fflags_bits_uop_shift = 3'h0;
  assign io_resp_bits_fflags_bits_uop_lrs3_rtype = 2'h0;
  assign io_resp_bits_fflags_bits_uop_rflag = 1'h0;
  assign io_resp_bits_fflags_bits_uop_wflag = 1'h0;
  assign io_resp_bits_fflags_bits_uop_prflag = 4'h0;
  assign io_resp_bits_fflags_bits_uop_pwflag = 4'h0;
  assign io_resp_bits_fflags_bits_uop_pflag_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_stale_pflag = 4'h0;
  assign io_resp_bits_fflags_bits_uop_op1_sel = 4'h0;
  assign io_resp_bits_fflags_bits_uop_op2_sel = 4'h0;
  assign io_resp_bits_fflags_bits_uop_split_num = 6'h0;
  assign io_resp_bits_fflags_bits_uop_self_index = 6'h0;
  assign io_resp_bits_fflags_bits_uop_rob_inst_idx = 6'h0;
  assign io_resp_bits_fflags_bits_uop_address_num = 6'h0;
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
  assign io_resp_bits_fflags_bits_uop_ctrl_op3_sel = 2'h0;
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
  assign io_resp_bits_fflags_bits_uop_ldq_idx = 5'h0;
  assign io_resp_bits_fflags_bits_uop_stq_idx = 5'h0;
  assign io_resp_bits_fflags_bits_uop_rxq_idx = 2'h0;
  assign io_resp_bits_fflags_bits_uop_pdst = 7'h0;
  assign io_resp_bits_fflags_bits_uop_prs1 = 7'h0;
  assign io_resp_bits_fflags_bits_uop_prs2 = 7'h0;
  assign io_resp_bits_fflags_bits_uop_prs3 = 7'h0;
  assign io_resp_bits_fflags_bits_uop_ppred = 5'h0;
  assign io_resp_bits_fflags_bits_uop_prs1_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_prs2_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_prs3_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_ppred_busy = 1'h0;
  assign io_resp_bits_fflags_bits_uop_stale_pdst = 7'h0;
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
  assign io_resp_bits_flagdata = r_flag_0; // @[functional-unit.scala 787:25]
  assign io_resp_bits_fflagdata_valid = 1'h0; // @[functional-unit.scala 812:32]
  assign io_resp_bits_fflagdata_bits_uop_switch = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_switch_off = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_unicore = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_shift = 3'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs3_rtype = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_rflag = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_wflag = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_prflag = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_pwflag = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_pflag_busy = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_stale_pflag = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_op1_sel = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_op2_sel = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_split_num = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_self_index = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_rob_inst_idx = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_address_num = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_uopc = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_inst = 32'h0;
  assign io_resp_bits_fflagdata_bits_uop_debug_inst = 32'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_rvc = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_debug_pc = 40'h0;
  assign io_resp_bits_fflagdata_bits_uop_iq_type = 3'h0;
  assign io_resp_bits_fflagdata_bits_uop_fu_code = 10'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_br_type = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op1_sel = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op2_sel = 3'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_imm_sel = 3'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op_fcn = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_fcn_dw = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_csr_cmd = 3'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_is_load = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_is_sta = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_is_std = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ctrl_op3_sel = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_iw_state = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_iw_p1_poisoned = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_iw_p2_poisoned = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_br = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_jalr = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_jal = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_sfb = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_br_mask = 12'h0;
  assign io_resp_bits_fflagdata_bits_uop_br_tag = 4'h0;
  assign io_resp_bits_fflagdata_bits_uop_ftq_idx = 5'h0;
  assign io_resp_bits_fflagdata_bits_uop_edge_inst = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_pc_lob = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_taken = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_imm_packed = 20'h0;
  assign io_resp_bits_fflagdata_bits_uop_csr_addr = 12'h0;
  assign io_resp_bits_fflagdata_bits_uop_rob_idx = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_ldq_idx = 5'h0;
  assign io_resp_bits_fflagdata_bits_uop_stq_idx = 5'h0;
  assign io_resp_bits_fflagdata_bits_uop_rxq_idx = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_pdst = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs1 = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs2 = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs3 = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_ppred = 5'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs1_busy = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs2_busy = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_prs3_busy = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ppred_busy = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_stale_pdst = 7'h0;
  assign io_resp_bits_fflagdata_bits_uop_exception = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_exc_cause = 64'h0;
  assign io_resp_bits_fflagdata_bits_uop_bypassable = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_mem_cmd = 5'h0;
  assign io_resp_bits_fflagdata_bits_uop_mem_size = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_mem_signed = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_fence = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_fencei = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_amo = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_uses_ldq = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_uses_stq = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_sys_pc2epc = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_is_unique = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_flush_on_commit = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ldst_is_rs1 = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_ldst = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs1 = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs2 = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs3 = 6'h0;
  assign io_resp_bits_fflagdata_bits_uop_ldst_val = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_dst_rtype = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs1_rtype = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_lrs2_rtype = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_frs3_en = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_fp_val = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_fp_single = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_xcpt_pf_if = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_xcpt_ae_if = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_xcpt_ma_if = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_bp_debug_if = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_bp_xcpt_if = 1'h0;
  assign io_resp_bits_fflagdata_bits_uop_debug_fsrc = 2'h0;
  assign io_resp_bits_fflagdata_bits_uop_debug_tsrc = 2'h0;
  assign io_resp_bits_fflagdata_bits_fflag = 32'h0;
  assign io_bypass_0_valid = io_req_valid; // @[functional-unit.scala 793:22]
  assign io_bypass_0_bits_uop_switch = io_req_bits_uop_switch; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_switch_off = io_req_bits_uop_switch_off; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_is_unicore = io_req_bits_uop_is_unicore; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_shift = io_req_bits_uop_shift; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_lrs3_rtype = io_req_bits_uop_lrs3_rtype; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_rflag = io_req_bits_uop_rflag; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_wflag = io_req_bits_uop_wflag; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_prflag = io_req_bits_uop_prflag; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_pwflag = io_req_bits_uop_pwflag; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_pflag_busy = io_req_bits_uop_pflag_busy; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_stale_pflag = io_req_bits_uop_stale_pflag; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_op1_sel = io_req_bits_uop_op1_sel; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_op2_sel = io_req_bits_uop_op2_sel; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_split_num = io_req_bits_uop_split_num; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_self_index = io_req_bits_uop_self_index; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_rob_inst_idx = io_req_bits_uop_rob_inst_idx; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_address_num = io_req_bits_uop_address_num; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_uopc = io_req_bits_uop_uopc; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_inst = io_req_bits_uop_inst; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_debug_inst = io_req_bits_uop_debug_inst; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_is_rvc = io_req_bits_uop_is_rvc; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_debug_pc = io_req_bits_uop_debug_pc; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_iq_type = io_req_bits_uop_iq_type; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_fu_code = io_req_bits_uop_fu_code; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ctrl_op3_sel = io_req_bits_uop_ctrl_op3_sel; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_iw_state = io_req_bits_uop_iw_state; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_is_br = io_req_bits_uop_is_br; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_is_jalr = io_req_bits_uop_is_jalr; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_is_jal = io_req_bits_uop_is_jal; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_is_sfb = io_req_bits_uop_is_sfb; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_br_mask = io_req_bits_uop_br_mask; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_br_tag = io_req_bits_uop_br_tag; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_edge_inst = io_req_bits_uop_edge_inst; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_pc_lob = io_req_bits_uop_pc_lob; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_taken = io_req_bits_uop_taken; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_imm_packed = io_req_bits_uop_imm_packed; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_csr_addr = io_req_bits_uop_csr_addr; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_rob_idx = io_req_bits_uop_rob_idx; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_stq_idx = io_req_bits_uop_stq_idx; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_pdst = io_req_bits_uop_pdst; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_prs1 = io_req_bits_uop_prs1; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_prs2 = io_req_bits_uop_prs2; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_prs3 = io_req_bits_uop_prs3; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ppred = io_req_bits_uop_ppred; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_exception = io_req_bits_uop_exception; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_exc_cause = io_req_bits_uop_exc_cause; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_bypassable = io_req_bits_uop_bypassable; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_mem_size = io_req_bits_uop_mem_size; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_mem_signed = io_req_bits_uop_mem_signed; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_is_fence = io_req_bits_uop_is_fence; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_is_fencei = io_req_bits_uop_is_fencei; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_is_amo = io_req_bits_uop_is_amo; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_uses_stq = io_req_bits_uop_uses_stq; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_is_unique = io_req_bits_uop_is_unique; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ldst = io_req_bits_uop_ldst; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_lrs1 = io_req_bits_uop_lrs1; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_lrs2 = io_req_bits_uop_lrs2; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_lrs3 = io_req_bits_uop_lrs3; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_ldst_val = io_req_bits_uop_ldst_val; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_frs3_en = io_req_bits_uop_frs3_en; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_fp_val = io_req_bits_uop_fp_val; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_fp_single = io_req_bits_uop_fp_single; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[functional-unit.scala 267:29]
  assign io_bypass_0_bits_data = io_req_bits_uop_is_unicore ? _T_195 : alu_out_riscv; // @[functional-unit.scala 765:20]
  assign io_bypass_0_bits_predicated = 1'h0;
  assign io_bypass_0_bits_fflags_valid = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_switch = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_switch_off = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_is_unicore = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_shift = 3'h0;
  assign io_bypass_0_bits_fflags_bits_uop_lrs3_rtype = 2'h0;
  assign io_bypass_0_bits_fflags_bits_uop_rflag = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_wflag = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_prflag = 4'h0;
  assign io_bypass_0_bits_fflags_bits_uop_pwflag = 4'h0;
  assign io_bypass_0_bits_fflags_bits_uop_pflag_busy = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_stale_pflag = 4'h0;
  assign io_bypass_0_bits_fflags_bits_uop_op1_sel = 4'h0;
  assign io_bypass_0_bits_fflags_bits_uop_op2_sel = 4'h0;
  assign io_bypass_0_bits_fflags_bits_uop_split_num = 6'h0;
  assign io_bypass_0_bits_fflags_bits_uop_self_index = 6'h0;
  assign io_bypass_0_bits_fflags_bits_uop_rob_inst_idx = 6'h0;
  assign io_bypass_0_bits_fflags_bits_uop_address_num = 6'h0;
  assign io_bypass_0_bits_fflags_bits_uop_uopc = 7'h0;
  assign io_bypass_0_bits_fflags_bits_uop_inst = 32'h0;
  assign io_bypass_0_bits_fflags_bits_uop_debug_inst = 32'h0;
  assign io_bypass_0_bits_fflags_bits_uop_is_rvc = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_debug_pc = 40'h0;
  assign io_bypass_0_bits_fflags_bits_uop_iq_type = 3'h0;
  assign io_bypass_0_bits_fflags_bits_uop_fu_code = 10'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_br_type = 4'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_op1_sel = 2'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_op2_sel = 3'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_imm_sel = 3'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_op_fcn = 4'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_fcn_dw = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_csr_cmd = 3'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_is_load = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_is_sta = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_is_std = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ctrl_op3_sel = 2'h0;
  assign io_bypass_0_bits_fflags_bits_uop_iw_state = 2'h0;
  assign io_bypass_0_bits_fflags_bits_uop_iw_p1_poisoned = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_iw_p2_poisoned = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_is_br = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_is_jalr = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_is_jal = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_is_sfb = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_br_mask = 12'h0;
  assign io_bypass_0_bits_fflags_bits_uop_br_tag = 4'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ftq_idx = 5'h0;
  assign io_bypass_0_bits_fflags_bits_uop_edge_inst = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_pc_lob = 6'h0;
  assign io_bypass_0_bits_fflags_bits_uop_taken = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_imm_packed = 20'h0;
  assign io_bypass_0_bits_fflags_bits_uop_csr_addr = 12'h0;
  assign io_bypass_0_bits_fflags_bits_uop_rob_idx = 6'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ldq_idx = 5'h0;
  assign io_bypass_0_bits_fflags_bits_uop_stq_idx = 5'h0;
  assign io_bypass_0_bits_fflags_bits_uop_rxq_idx = 2'h0;
  assign io_bypass_0_bits_fflags_bits_uop_pdst = 7'h0;
  assign io_bypass_0_bits_fflags_bits_uop_prs1 = 7'h0;
  assign io_bypass_0_bits_fflags_bits_uop_prs2 = 7'h0;
  assign io_bypass_0_bits_fflags_bits_uop_prs3 = 7'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ppred = 5'h0;
  assign io_bypass_0_bits_fflags_bits_uop_prs1_busy = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_prs2_busy = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_prs3_busy = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ppred_busy = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_stale_pdst = 7'h0;
  assign io_bypass_0_bits_fflags_bits_uop_exception = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_exc_cause = 64'h0;
  assign io_bypass_0_bits_fflags_bits_uop_bypassable = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_mem_cmd = 5'h0;
  assign io_bypass_0_bits_fflags_bits_uop_mem_size = 2'h0;
  assign io_bypass_0_bits_fflags_bits_uop_mem_signed = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_is_fence = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_is_fencei = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_is_amo = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_uses_ldq = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_uses_stq = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_is_sys_pc2epc = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_is_unique = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_flush_on_commit = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ldst_is_rs1 = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ldst = 6'h0;
  assign io_bypass_0_bits_fflags_bits_uop_lrs1 = 6'h0;
  assign io_bypass_0_bits_fflags_bits_uop_lrs2 = 6'h0;
  assign io_bypass_0_bits_fflags_bits_uop_lrs3 = 6'h0;
  assign io_bypass_0_bits_fflags_bits_uop_ldst_val = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_dst_rtype = 2'h0;
  assign io_bypass_0_bits_fflags_bits_uop_lrs1_rtype = 2'h0;
  assign io_bypass_0_bits_fflags_bits_uop_lrs2_rtype = 2'h0;
  assign io_bypass_0_bits_fflags_bits_uop_frs3_en = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_fp_val = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_fp_single = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_xcpt_pf_if = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_xcpt_ae_if = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_xcpt_ma_if = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_bp_debug_if = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_bp_xcpt_if = 1'h0;
  assign io_bypass_0_bits_fflags_bits_uop_debug_fsrc = 2'h0;
  assign io_bypass_0_bits_fflags_bits_uop_debug_tsrc = 2'h0;
  assign io_bypass_0_bits_fflags_bits_flags = 5'h0;
  assign io_bypass_0_bits_flagdata = _T_198 ? _T_199 : 4'h0; // @[functional-unit.scala 799:36]
  assign io_bypass_0_bits_fflagdata_valid = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_switch = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_switch_off = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_is_unicore = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_shift = 3'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs3_rtype = 2'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_rflag = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_wflag = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_prflag = 4'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_pwflag = 4'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_pflag_busy = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_stale_pflag = 4'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_op1_sel = 4'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_op2_sel = 4'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_split_num = 6'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_self_index = 6'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_rob_inst_idx = 6'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_address_num = 6'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_uopc = 7'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_inst = 32'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_debug_inst = 32'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_is_rvc = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_debug_pc = 40'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_iq_type = 3'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_fu_code = 10'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_br_type = 4'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_op1_sel = 2'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_op2_sel = 3'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_imm_sel = 3'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_op_fcn = 4'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_fcn_dw = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_csr_cmd = 3'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_load = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_sta = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_is_std = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ctrl_op3_sel = 2'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_iw_state = 2'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_iw_p1_poisoned = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_iw_p2_poisoned = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_is_br = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_is_jalr = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_is_jal = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_is_sfb = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_br_mask = 12'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_br_tag = 4'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ftq_idx = 5'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_edge_inst = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_pc_lob = 6'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_taken = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_imm_packed = 20'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_csr_addr = 12'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_rob_idx = 6'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ldq_idx = 5'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_stq_idx = 5'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_rxq_idx = 2'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_pdst = 7'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_prs1 = 7'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_prs2 = 7'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_prs3 = 7'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ppred = 5'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_prs1_busy = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_prs2_busy = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_prs3_busy = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ppred_busy = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_stale_pdst = 7'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_exception = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_exc_cause = 64'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_bypassable = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_mem_cmd = 5'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_mem_size = 2'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_mem_signed = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_is_fence = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_is_fencei = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_is_amo = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_uses_ldq = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_uses_stq = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_is_sys_pc2epc = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_is_unique = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_flush_on_commit = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ldst_is_rs1 = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ldst = 6'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs1 = 6'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs2 = 6'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs3 = 6'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_ldst_val = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_dst_rtype = 2'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs1_rtype = 2'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_lrs2_rtype = 2'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_frs3_en = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_fp_val = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_fp_single = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_xcpt_pf_if = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_xcpt_ae_if = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_xcpt_ma_if = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_bp_debug_if = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_bp_xcpt_if = 1'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_debug_fsrc = 2'h0;
  assign io_bypass_0_bits_fflagdata_bits_uop_debug_tsrc = 2'h0;
  assign io_bypass_0_bits_fflagdata_bits_fflag = 32'h0;
  assign io_brinfo_uop_switch = io_req_bits_uop_switch; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_switch_off = io_req_bits_uop_switch_off; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_is_unicore = io_req_bits_uop_is_unicore; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_shift = io_req_bits_uop_shift; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_lrs3_rtype = io_req_bits_uop_lrs3_rtype; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_rflag = io_req_bits_uop_rflag; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_wflag = io_req_bits_uop_wflag; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_prflag = io_req_bits_uop_prflag; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_pwflag = io_req_bits_uop_pwflag; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_pflag_busy = io_req_bits_uop_pflag_busy; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_stale_pflag = io_req_bits_uop_stale_pflag; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_op1_sel = io_req_bits_uop_op1_sel; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_op2_sel = io_req_bits_uop_op2_sel; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_split_num = io_req_bits_uop_split_num; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_self_index = io_req_bits_uop_self_index; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_rob_inst_idx = io_req_bits_uop_rob_inst_idx; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_address_num = io_req_bits_uop_address_num; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_uopc = io_req_bits_uop_uopc; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_inst = io_req_bits_uop_inst; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_debug_inst = io_req_bits_uop_debug_inst; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_is_rvc = io_req_bits_uop_is_unicore ? 1'h0 : io_req_bits_uop_is_rvc; // @[functional-unit.scala 683:25 functional-unit.scala 684:23 functional-unit.scala 658:25]
  assign io_brinfo_uop_debug_pc = io_req_bits_uop_debug_pc; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_iq_type = io_req_bits_uop_iq_type; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_fu_code = io_req_bits_uop_fu_code; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ctrl_op3_sel = io_req_bits_uop_ctrl_op3_sel; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_iw_state = io_req_bits_uop_iw_state; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_is_br = io_req_bits_uop_is_br; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_is_jalr = io_req_bits_uop_is_jalr; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_is_jal = io_req_bits_uop_is_jal; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_is_sfb = io_req_bits_uop_is_sfb; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_br_mask = io_req_bits_uop_br_mask; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_br_tag = io_req_bits_uop_br_tag; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_edge_inst = io_req_bits_uop_edge_inst; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_pc_lob = io_req_bits_uop_pc_lob; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_taken = io_req_bits_uop_taken; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_imm_packed = io_req_bits_uop_imm_packed; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_csr_addr = io_req_bits_uop_csr_addr; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_rob_idx = io_req_bits_uop_rob_idx; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_stq_idx = io_req_bits_uop_stq_idx; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_pdst = io_req_bits_uop_pdst; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_prs1 = io_req_bits_uop_prs1; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_prs2 = io_req_bits_uop_prs2; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_prs3 = io_req_bits_uop_prs3; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ppred = io_req_bits_uop_ppred; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_exception = io_req_bits_uop_exception; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_exc_cause = io_req_bits_uop_exc_cause; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_bypassable = io_req_bits_uop_bypassable; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_mem_size = io_req_bits_uop_mem_size; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_mem_signed = io_req_bits_uop_mem_signed; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_is_fence = io_req_bits_uop_is_fence; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_is_fencei = io_req_bits_uop_is_fencei; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_is_amo = io_req_bits_uop_is_amo; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_uses_stq = io_req_bits_uop_uses_stq; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_is_unique = io_req_bits_uop_is_unique; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ldst = io_req_bits_uop_ldst; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_lrs1 = io_req_bits_uop_lrs1; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_lrs2 = io_req_bits_uop_lrs2; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_lrs3 = io_req_bits_uop_lrs3; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_ldst_val = io_req_bits_uop_ldst_val; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_frs3_en = io_req_bits_uop_frs3_en; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_fp_val = io_req_bits_uop_fp_val; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_fp_single = io_req_bits_uop_fp_single; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[functional-unit.scala 653:20 functional-unit.scala 658:25]
  assign io_brinfo_valid = is_br | is_jalr; // @[functional-unit.scala 656:34]
  assign io_brinfo_mispredict = (is_br | is_jalr) & _GEN_3; // @[functional-unit.scala 641:27]
  assign io_brinfo_taken = _T_151 & _T_152; // @[functional-unit.scala 631:61]
  assign io_brinfo_cfi_type = is_jalr ? 3'h3 : _T_170; // @[functional-unit.scala 659:31]
  assign io_brinfo_pc_sel = 4'h9 == io_req_bits_uop_ctrl_br_type ? _T_127 : _T_145; // @[Mux.scala 80:57]
  assign io_brinfo_jalr_target = 40'h0; // @[functional-unit.scala 744:13]
  assign io_brinfo_target_offset = io_req_bits_uop_is_unicore ? $signed(_T_182) : $signed(_T_178); // @[functional-unit.scala 690:26]
  assign alu_clock = clock;
  assign alu_reset = reset;
  assign alu_io_dw = io_req_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 563:14]
  assign alu_io_fn = io_req_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 562:14]
  assign alu_io_in2 = io_req_bits_uop_ctrl_op2_sel == 3'h1 ? _T_59 : _T_67; // @[functional-unit.scala 552:21]
  assign alu_io_in1 = io_req_bits_uop_ctrl_op1_sel == 2'h0 ? io_req_bits_rs1_data : 64'h0; // @[functional-unit.scala 547:19]
  assign unicore_alu_clock = clock;
  assign unicore_alu_reset = reset;
  assign unicore_alu_io_uop_switch = io_req_bits_uop_switch; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_switch_off = io_req_bits_uop_switch_off; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_is_unicore = io_req_bits_uop_is_unicore; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_shift = io_req_bits_uop_shift; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_lrs3_rtype = io_req_bits_uop_lrs3_rtype; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_rflag = io_req_bits_uop_rflag; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_wflag = io_req_bits_uop_wflag; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_prflag = io_req_bits_uop_prflag; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_pwflag = io_req_bits_uop_pwflag; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_pflag_busy = io_req_bits_uop_pflag_busy; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_stale_pflag = io_req_bits_uop_stale_pflag; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_op1_sel = io_req_bits_uop_op1_sel; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_op2_sel = io_req_bits_uop_op2_sel; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_split_num = io_req_bits_uop_split_num; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_self_index = io_req_bits_uop_self_index; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_rob_inst_idx = io_req_bits_uop_rob_inst_idx; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_address_num = io_req_bits_uop_address_num; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_uopc = io_req_bits_uop_uopc; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_inst = io_req_bits_uop_inst; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_debug_inst = io_req_bits_uop_debug_inst; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_is_rvc = io_req_bits_uop_is_rvc; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_debug_pc = io_req_bits_uop_debug_pc; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_iq_type = io_req_bits_uop_iq_type; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_fu_code = io_req_bits_uop_fu_code; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ctrl_op3_sel = io_req_bits_uop_ctrl_op3_sel; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_iw_state = io_req_bits_uop_iw_state; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_iw_p1_poisoned = io_req_bits_uop_iw_p1_poisoned; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_iw_p2_poisoned = io_req_bits_uop_iw_p2_poisoned; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_is_br = io_req_bits_uop_is_br; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_is_jalr = io_req_bits_uop_is_jalr; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_is_jal = io_req_bits_uop_is_jal; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_is_sfb = io_req_bits_uop_is_sfb; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_br_mask = io_req_bits_uop_br_mask; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_br_tag = io_req_bits_uop_br_tag; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ftq_idx = io_req_bits_uop_ftq_idx; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_edge_inst = io_req_bits_uop_edge_inst; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_pc_lob = io_req_bits_uop_pc_lob; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_taken = io_req_bits_uop_taken; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_imm_packed = io_req_bits_uop_imm_packed; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_csr_addr = io_req_bits_uop_csr_addr; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_rob_idx = io_req_bits_uop_rob_idx; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ldq_idx = io_req_bits_uop_ldq_idx; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_stq_idx = io_req_bits_uop_stq_idx; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_rxq_idx = io_req_bits_uop_rxq_idx; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_pdst = io_req_bits_uop_pdst; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_prs1 = io_req_bits_uop_prs1; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_prs2 = io_req_bits_uop_prs2; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_prs3 = io_req_bits_uop_prs3; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ppred = io_req_bits_uop_ppred; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_prs1_busy = io_req_bits_uop_prs1_busy; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_prs2_busy = io_req_bits_uop_prs2_busy; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_prs3_busy = io_req_bits_uop_prs3_busy; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ppred_busy = io_req_bits_uop_ppred_busy; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_stale_pdst = io_req_bits_uop_stale_pdst; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_exception = io_req_bits_uop_exception; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_exc_cause = io_req_bits_uop_exc_cause; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_bypassable = io_req_bits_uop_bypassable; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_mem_cmd = io_req_bits_uop_mem_cmd; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_mem_size = io_req_bits_uop_mem_size; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_mem_signed = io_req_bits_uop_mem_signed; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_is_fence = io_req_bits_uop_is_fence; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_is_fencei = io_req_bits_uop_is_fencei; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_is_amo = io_req_bits_uop_is_amo; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_uses_ldq = io_req_bits_uop_uses_ldq; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_uses_stq = io_req_bits_uop_uses_stq; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_is_unique = io_req_bits_uop_is_unique; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_flush_on_commit = io_req_bits_uop_flush_on_commit; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ldst = io_req_bits_uop_ldst; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_lrs1 = io_req_bits_uop_lrs1; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_lrs2 = io_req_bits_uop_lrs2; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_lrs3 = io_req_bits_uop_lrs3; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_ldst_val = io_req_bits_uop_ldst_val; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_dst_rtype = io_req_bits_uop_dst_rtype; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_frs3_en = io_req_bits_uop_frs3_en; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_fp_val = io_req_bits_uop_fp_val; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_fp_single = io_req_bits_uop_fp_single; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_bp_debug_if = io_req_bits_uop_bp_debug_if; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_debug_fsrc = io_req_bits_uop_debug_fsrc; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_uop_debug_tsrc = io_req_bits_uop_debug_tsrc; // @[functional-unit.scala 567:22]
  assign unicore_alu_io_flagdata = io_req_bits_flagdata; // @[functional-unit.scala 571:27]
  assign unicore_alu_io_riscv_op1_data = io_req_bits_uop_ctrl_op1_sel == 2'h0 ? io_req_bits_rs1_data : 64'h0; // @[functional-unit.scala 547:19]
  assign unicore_alu_io_rs1_data = io_req_bits_rs1_data; // @[functional-unit.scala 569:27]
  assign unicore_alu_io_rs2_data = io_req_bits_rs2_data; // @[functional-unit.scala 570:27]
  always @(posedge clock) begin
    if (reset) begin // @[functional-unit.scala 239:27]
      REG_0 <= 1'h0; // @[functional-unit.scala 239:27]
    end else begin
      REG_0 <= io_req_valid & ~_T_1 & ~io_req_bits_kill; // @[functional-unit.scala 243:17]
    end
    REG_1_0_switch <= io_req_bits_uop_switch; // @[functional-unit.scala 244:17]
    REG_1_0_switch_off <= io_req_bits_uop_switch_off; // @[functional-unit.scala 244:17]
    REG_1_0_is_unicore <= io_req_bits_uop_is_unicore; // @[functional-unit.scala 244:17]
    REG_1_0_shift <= io_req_bits_uop_shift; // @[functional-unit.scala 244:17]
    REG_1_0_lrs3_rtype <= io_req_bits_uop_lrs3_rtype; // @[functional-unit.scala 244:17]
    REG_1_0_rflag <= io_req_bits_uop_rflag; // @[functional-unit.scala 244:17]
    REG_1_0_wflag <= io_req_bits_uop_wflag; // @[functional-unit.scala 244:17]
    REG_1_0_prflag <= io_req_bits_uop_prflag; // @[functional-unit.scala 244:17]
    REG_1_0_pwflag <= io_req_bits_uop_pwflag; // @[functional-unit.scala 244:17]
    REG_1_0_pflag_busy <= io_req_bits_uop_pflag_busy; // @[functional-unit.scala 244:17]
    REG_1_0_stale_pflag <= io_req_bits_uop_stale_pflag; // @[functional-unit.scala 244:17]
    REG_1_0_op1_sel <= io_req_bits_uop_op1_sel; // @[functional-unit.scala 244:17]
    REG_1_0_op2_sel <= io_req_bits_uop_op2_sel; // @[functional-unit.scala 244:17]
    REG_1_0_split_num <= io_req_bits_uop_split_num; // @[functional-unit.scala 244:17]
    REG_1_0_self_index <= io_req_bits_uop_self_index; // @[functional-unit.scala 244:17]
    REG_1_0_rob_inst_idx <= io_req_bits_uop_rob_inst_idx; // @[functional-unit.scala 244:17]
    REG_1_0_address_num <= io_req_bits_uop_address_num; // @[functional-unit.scala 244:17]
    REG_1_0_uopc <= io_req_bits_uop_uopc; // @[functional-unit.scala 244:17]
    REG_1_0_inst <= io_req_bits_uop_inst; // @[functional-unit.scala 244:17]
    REG_1_0_debug_inst <= io_req_bits_uop_debug_inst; // @[functional-unit.scala 244:17]
    REG_1_0_is_rvc <= io_req_bits_uop_is_rvc; // @[functional-unit.scala 244:17]
    REG_1_0_debug_pc <= io_req_bits_uop_debug_pc; // @[functional-unit.scala 244:17]
    REG_1_0_iq_type <= io_req_bits_uop_iq_type; // @[functional-unit.scala 244:17]
    REG_1_0_fu_code <= io_req_bits_uop_fu_code; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_br_type <= io_req_bits_uop_ctrl_br_type; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_op1_sel <= io_req_bits_uop_ctrl_op1_sel; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_op2_sel <= io_req_bits_uop_ctrl_op2_sel; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_imm_sel <= io_req_bits_uop_ctrl_imm_sel; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_op_fcn <= io_req_bits_uop_ctrl_op_fcn; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_fcn_dw <= io_req_bits_uop_ctrl_fcn_dw; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_csr_cmd <= io_req_bits_uop_ctrl_csr_cmd; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_is_load <= io_req_bits_uop_ctrl_is_load; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_is_sta <= io_req_bits_uop_ctrl_is_sta; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_is_std <= io_req_bits_uop_ctrl_is_std; // @[functional-unit.scala 244:17]
    REG_1_0_ctrl_op3_sel <= io_req_bits_uop_ctrl_op3_sel; // @[functional-unit.scala 244:17]
    REG_1_0_iw_state <= io_req_bits_uop_iw_state; // @[functional-unit.scala 244:17]
    REG_1_0_iw_p1_poisoned <= io_req_bits_uop_iw_p1_poisoned; // @[functional-unit.scala 244:17]
    REG_1_0_iw_p2_poisoned <= io_req_bits_uop_iw_p2_poisoned; // @[functional-unit.scala 244:17]
    REG_1_0_is_br <= io_req_bits_uop_is_br; // @[functional-unit.scala 244:17]
    REG_1_0_is_jalr <= io_req_bits_uop_is_jalr; // @[functional-unit.scala 244:17]
    REG_1_0_is_jal <= io_req_bits_uop_is_jal; // @[functional-unit.scala 244:17]
    REG_1_0_is_sfb <= io_req_bits_uop_is_sfb; // @[functional-unit.scala 244:17]
    REG_1_0_br_mask <= io_req_bits_uop_br_mask & _T_6; // @[util.scala 142:25]
    REG_1_0_br_tag <= io_req_bits_uop_br_tag; // @[functional-unit.scala 244:17]
    REG_1_0_ftq_idx <= io_req_bits_uop_ftq_idx; // @[functional-unit.scala 244:17]
    REG_1_0_edge_inst <= io_req_bits_uop_edge_inst; // @[functional-unit.scala 244:17]
    REG_1_0_pc_lob <= io_req_bits_uop_pc_lob; // @[functional-unit.scala 244:17]
    REG_1_0_taken <= io_req_bits_uop_taken; // @[functional-unit.scala 244:17]
    REG_1_0_imm_packed <= io_req_bits_uop_imm_packed; // @[functional-unit.scala 244:17]
    REG_1_0_csr_addr <= io_req_bits_uop_csr_addr; // @[functional-unit.scala 244:17]
    REG_1_0_rob_idx <= io_req_bits_uop_rob_idx; // @[functional-unit.scala 244:17]
    REG_1_0_ldq_idx <= io_req_bits_uop_ldq_idx; // @[functional-unit.scala 244:17]
    REG_1_0_stq_idx <= io_req_bits_uop_stq_idx; // @[functional-unit.scala 244:17]
    REG_1_0_rxq_idx <= io_req_bits_uop_rxq_idx; // @[functional-unit.scala 244:17]
    REG_1_0_pdst <= io_req_bits_uop_pdst; // @[functional-unit.scala 244:17]
    REG_1_0_prs1 <= io_req_bits_uop_prs1; // @[functional-unit.scala 244:17]
    REG_1_0_prs2 <= io_req_bits_uop_prs2; // @[functional-unit.scala 244:17]
    REG_1_0_prs3 <= io_req_bits_uop_prs3; // @[functional-unit.scala 244:17]
    REG_1_0_ppred <= io_req_bits_uop_ppred; // @[functional-unit.scala 244:17]
    REG_1_0_prs1_busy <= io_req_bits_uop_prs1_busy; // @[functional-unit.scala 244:17]
    REG_1_0_prs2_busy <= io_req_bits_uop_prs2_busy; // @[functional-unit.scala 244:17]
    REG_1_0_prs3_busy <= io_req_bits_uop_prs3_busy; // @[functional-unit.scala 244:17]
    REG_1_0_ppred_busy <= io_req_bits_uop_ppred_busy; // @[functional-unit.scala 244:17]
    REG_1_0_stale_pdst <= io_req_bits_uop_stale_pdst; // @[functional-unit.scala 244:17]
    REG_1_0_exception <= io_req_bits_uop_exception; // @[functional-unit.scala 244:17]
    REG_1_0_exc_cause <= io_req_bits_uop_exc_cause; // @[functional-unit.scala 244:17]
    REG_1_0_bypassable <= io_req_bits_uop_bypassable; // @[functional-unit.scala 244:17]
    REG_1_0_mem_cmd <= io_req_bits_uop_mem_cmd; // @[functional-unit.scala 244:17]
    REG_1_0_mem_size <= io_req_bits_uop_mem_size; // @[functional-unit.scala 244:17]
    REG_1_0_mem_signed <= io_req_bits_uop_mem_signed; // @[functional-unit.scala 244:17]
    REG_1_0_is_fence <= io_req_bits_uop_is_fence; // @[functional-unit.scala 244:17]
    REG_1_0_is_fencei <= io_req_bits_uop_is_fencei; // @[functional-unit.scala 244:17]
    REG_1_0_is_amo <= io_req_bits_uop_is_amo; // @[functional-unit.scala 244:17]
    REG_1_0_uses_ldq <= io_req_bits_uop_uses_ldq; // @[functional-unit.scala 244:17]
    REG_1_0_uses_stq <= io_req_bits_uop_uses_stq; // @[functional-unit.scala 244:17]
    REG_1_0_is_sys_pc2epc <= io_req_bits_uop_is_sys_pc2epc; // @[functional-unit.scala 244:17]
    REG_1_0_is_unique <= io_req_bits_uop_is_unique; // @[functional-unit.scala 244:17]
    REG_1_0_flush_on_commit <= io_req_bits_uop_flush_on_commit; // @[functional-unit.scala 244:17]
    REG_1_0_ldst_is_rs1 <= io_req_bits_uop_ldst_is_rs1; // @[functional-unit.scala 244:17]
    REG_1_0_ldst <= io_req_bits_uop_ldst; // @[functional-unit.scala 244:17]
    REG_1_0_lrs1 <= io_req_bits_uop_lrs1; // @[functional-unit.scala 244:17]
    REG_1_0_lrs2 <= io_req_bits_uop_lrs2; // @[functional-unit.scala 244:17]
    REG_1_0_lrs3 <= io_req_bits_uop_lrs3; // @[functional-unit.scala 244:17]
    REG_1_0_ldst_val <= io_req_bits_uop_ldst_val; // @[functional-unit.scala 244:17]
    REG_1_0_dst_rtype <= io_req_bits_uop_dst_rtype; // @[functional-unit.scala 244:17]
    REG_1_0_lrs1_rtype <= io_req_bits_uop_lrs1_rtype; // @[functional-unit.scala 244:17]
    REG_1_0_lrs2_rtype <= io_req_bits_uop_lrs2_rtype; // @[functional-unit.scala 244:17]
    REG_1_0_frs3_en <= io_req_bits_uop_frs3_en; // @[functional-unit.scala 244:17]
    REG_1_0_fp_val <= io_req_bits_uop_fp_val; // @[functional-unit.scala 244:17]
    REG_1_0_fp_single <= io_req_bits_uop_fp_single; // @[functional-unit.scala 244:17]
    REG_1_0_xcpt_pf_if <= io_req_bits_uop_xcpt_pf_if; // @[functional-unit.scala 244:17]
    REG_1_0_xcpt_ae_if <= io_req_bits_uop_xcpt_ae_if; // @[functional-unit.scala 244:17]
    REG_1_0_xcpt_ma_if <= io_req_bits_uop_xcpt_ma_if; // @[functional-unit.scala 244:17]
    REG_1_0_bp_debug_if <= io_req_bits_uop_bp_debug_if; // @[functional-unit.scala 244:17]
    REG_1_0_bp_xcpt_if <= io_req_bits_uop_bp_xcpt_if; // @[functional-unit.scala 244:17]
    REG_1_0_debug_fsrc <= io_req_bits_uop_debug_fsrc; // @[functional-unit.scala 244:17]
    REG_1_0_debug_tsrc <= io_req_bits_uop_debug_tsrc; // @[functional-unit.scala 244:17]
    if (reset) begin // @[Counters.scala 45:37]
      value_lo <= 5'h0; // @[Counters.scala 45:37]
    end else begin
      value_lo <= nextSmall[4:0];
    end
    if (reset) begin // @[Counters.scala 50:27]
      value_hi <= 27'h0; // @[Counters.scala 50:27]
    end else if (nextSmall[5]) begin // @[Counters.scala 51:46]
      value_hi <= _large_r_T_1; // @[Counters.scala 51:50]
    end
    if (io_req_bits_uop_is_unicore) begin // @[functional-unit.scala 765:20]
      if (io_req_bits_uop_ctrl_br_type == 4'h9 & ~br_cc) begin // @[functional-unit.scala 765:52]
        r_data_0 <= io_req_bits_rs1_data;
      end else begin
        r_data_0 <= unicore_alu_io_out;
      end
    end else if (io_req_bits_uop_uopc == 7'h6d) begin // @[functional-unit.scala 761:8]
      r_data_0 <= io_req_bits_rs2_data;
    end else begin
      r_data_0 <= alu_io_out;
    end
    if (io_req_bits_uop_is_unicore & io_req_bits_uop_wflag & ~io_req_bits_uop_fp_val) begin // @[functional-unit.scala 771:19]
      if (unicore_alu_io_flagdata_out_valid) begin // @[functional-unit.scala 772:19]
        r_flag_0 <= io_req_bits_flagdata;
      end else begin
        r_flag_0 <= unicore_alu_io_flagdata_out_bits;
      end
    end else begin
      r_flag_0 <= 4'h0;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_161 & ~(pc_sel != 2'h2 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at functional-unit.scala:643 assert (pc_sel =/= PC_JALR)\n"); // @[functional-unit.scala 643:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_161 & ~(pc_sel != 2'h2 | reset)) begin
          $fatal; // @[functional-unit.scala 643:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_172 & ~reset) begin
          $fwrite(32'h80000002,
            "{\"module\":\"ALUUnit_1\",\"source\":\"functional-unit.scala:679\",\"cycle\":%d,\"type\":\"[Pipeline--Execution] Branch Information\",\"pc\":\"0x%x\",\"inst\":\"0x%x\",\"self_idx\":%d,\"uopc\":%d,\"is_br\":%d,\"is_jalr\":%d,\"Res_taken\":%d,\"Res_misp\":%d}\n"
            ,value,io_req_bits_uop_debug_pc,io_req_bits_uop_inst,io_req_bits_uop_self_index,io_req_bits_uop_uopc,is_br,
            is_jalr,is_taken,mispredict); // @[logging.scala 34:13]
        end
    `ifdef PRINTF_COND
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
  REG_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  REG_1_0_switch = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  REG_1_0_switch_off = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  REG_1_0_is_unicore = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  REG_1_0_shift = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  REG_1_0_lrs3_rtype = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  REG_1_0_rflag = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  REG_1_0_wflag = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  REG_1_0_prflag = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  REG_1_0_pwflag = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  REG_1_0_pflag_busy = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  REG_1_0_stale_pflag = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  REG_1_0_op1_sel = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  REG_1_0_op2_sel = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  REG_1_0_split_num = _RAND_14[5:0];
  _RAND_15 = {1{`RANDOM}};
  REG_1_0_self_index = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  REG_1_0_rob_inst_idx = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  REG_1_0_address_num = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  REG_1_0_uopc = _RAND_18[6:0];
  _RAND_19 = {1{`RANDOM}};
  REG_1_0_inst = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  REG_1_0_debug_inst = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  REG_1_0_is_rvc = _RAND_21[0:0];
  _RAND_22 = {2{`RANDOM}};
  REG_1_0_debug_pc = _RAND_22[39:0];
  _RAND_23 = {1{`RANDOM}};
  REG_1_0_iq_type = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  REG_1_0_fu_code = _RAND_24[9:0];
  _RAND_25 = {1{`RANDOM}};
  REG_1_0_ctrl_br_type = _RAND_25[3:0];
  _RAND_26 = {1{`RANDOM}};
  REG_1_0_ctrl_op1_sel = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  REG_1_0_ctrl_op2_sel = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  REG_1_0_ctrl_imm_sel = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  REG_1_0_ctrl_op_fcn = _RAND_29[3:0];
  _RAND_30 = {1{`RANDOM}};
  REG_1_0_ctrl_fcn_dw = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  REG_1_0_ctrl_csr_cmd = _RAND_31[2:0];
  _RAND_32 = {1{`RANDOM}};
  REG_1_0_ctrl_is_load = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  REG_1_0_ctrl_is_sta = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  REG_1_0_ctrl_is_std = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  REG_1_0_ctrl_op3_sel = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  REG_1_0_iw_state = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  REG_1_0_iw_p1_poisoned = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  REG_1_0_iw_p2_poisoned = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  REG_1_0_is_br = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  REG_1_0_is_jalr = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  REG_1_0_is_jal = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  REG_1_0_is_sfb = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  REG_1_0_br_mask = _RAND_43[11:0];
  _RAND_44 = {1{`RANDOM}};
  REG_1_0_br_tag = _RAND_44[3:0];
  _RAND_45 = {1{`RANDOM}};
  REG_1_0_ftq_idx = _RAND_45[4:0];
  _RAND_46 = {1{`RANDOM}};
  REG_1_0_edge_inst = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  REG_1_0_pc_lob = _RAND_47[5:0];
  _RAND_48 = {1{`RANDOM}};
  REG_1_0_taken = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  REG_1_0_imm_packed = _RAND_49[19:0];
  _RAND_50 = {1{`RANDOM}};
  REG_1_0_csr_addr = _RAND_50[11:0];
  _RAND_51 = {1{`RANDOM}};
  REG_1_0_rob_idx = _RAND_51[5:0];
  _RAND_52 = {1{`RANDOM}};
  REG_1_0_ldq_idx = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  REG_1_0_stq_idx = _RAND_53[4:0];
  _RAND_54 = {1{`RANDOM}};
  REG_1_0_rxq_idx = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  REG_1_0_pdst = _RAND_55[6:0];
  _RAND_56 = {1{`RANDOM}};
  REG_1_0_prs1 = _RAND_56[6:0];
  _RAND_57 = {1{`RANDOM}};
  REG_1_0_prs2 = _RAND_57[6:0];
  _RAND_58 = {1{`RANDOM}};
  REG_1_0_prs3 = _RAND_58[6:0];
  _RAND_59 = {1{`RANDOM}};
  REG_1_0_ppred = _RAND_59[4:0];
  _RAND_60 = {1{`RANDOM}};
  REG_1_0_prs1_busy = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  REG_1_0_prs2_busy = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  REG_1_0_prs3_busy = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  REG_1_0_ppred_busy = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  REG_1_0_stale_pdst = _RAND_64[6:0];
  _RAND_65 = {1{`RANDOM}};
  REG_1_0_exception = _RAND_65[0:0];
  _RAND_66 = {2{`RANDOM}};
  REG_1_0_exc_cause = _RAND_66[63:0];
  _RAND_67 = {1{`RANDOM}};
  REG_1_0_bypassable = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  REG_1_0_mem_cmd = _RAND_68[4:0];
  _RAND_69 = {1{`RANDOM}};
  REG_1_0_mem_size = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  REG_1_0_mem_signed = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  REG_1_0_is_fence = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  REG_1_0_is_fencei = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  REG_1_0_is_amo = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  REG_1_0_uses_ldq = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  REG_1_0_uses_stq = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  REG_1_0_is_sys_pc2epc = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  REG_1_0_is_unique = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  REG_1_0_flush_on_commit = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  REG_1_0_ldst_is_rs1 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  REG_1_0_ldst = _RAND_80[5:0];
  _RAND_81 = {1{`RANDOM}};
  REG_1_0_lrs1 = _RAND_81[5:0];
  _RAND_82 = {1{`RANDOM}};
  REG_1_0_lrs2 = _RAND_82[5:0];
  _RAND_83 = {1{`RANDOM}};
  REG_1_0_lrs3 = _RAND_83[5:0];
  _RAND_84 = {1{`RANDOM}};
  REG_1_0_ldst_val = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  REG_1_0_dst_rtype = _RAND_85[1:0];
  _RAND_86 = {1{`RANDOM}};
  REG_1_0_lrs1_rtype = _RAND_86[1:0];
  _RAND_87 = {1{`RANDOM}};
  REG_1_0_lrs2_rtype = _RAND_87[1:0];
  _RAND_88 = {1{`RANDOM}};
  REG_1_0_frs3_en = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  REG_1_0_fp_val = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  REG_1_0_fp_single = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  REG_1_0_xcpt_pf_if = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  REG_1_0_xcpt_ae_if = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  REG_1_0_xcpt_ma_if = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  REG_1_0_bp_debug_if = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  REG_1_0_bp_xcpt_if = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  REG_1_0_debug_fsrc = _RAND_96[1:0];
  _RAND_97 = {1{`RANDOM}};
  REG_1_0_debug_tsrc = _RAND_97[1:0];
  _RAND_98 = {1{`RANDOM}};
  value_lo = _RAND_98[4:0];
  _RAND_99 = {1{`RANDOM}};
  value_hi = _RAND_99[26:0];
  _RAND_100 = {2{`RANDOM}};
  r_data_0 = _RAND_100[63:0];
  _RAND_101 = {1{`RANDOM}};
  r_flag_0 = _RAND_101[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
