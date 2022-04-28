module FPU(
  input         clock,
  input         reset,
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
  input  [64:0] io_req_bits_rs1_data,
  input  [64:0] io_req_bits_rs2_data,
  input  [64:0] io_req_bits_rs3_data,
  input  [2:0]  io_req_bits_fcsr_rm,
  input  [31:0] io_req_bits_fflagdata,
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
  output [64:0] io_resp_bits_data,
  output        io_resp_bits_predicated,
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
  output [31:0] io_resp_bits_fflagdata_bits_fflag
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
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [63:0] _RAND_29;
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
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [63:0] _RAND_73;
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
  reg [63:0] _RAND_127;
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
  reg [63:0] _RAND_171;
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
  reg [31:0] _RAND_220;
  reg [31:0] _RAND_221;
  reg [31:0] _RAND_222;
  reg [31:0] _RAND_223;
  reg [31:0] _RAND_224;
  reg [63:0] _RAND_225;
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
  reg [31:0] _RAND_256;
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
  reg [63:0] _RAND_269;
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
  reg [31:0] _RAND_299;
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
  reg [63:0] _RAND_322;
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
  reg [31:0] _RAND_335;
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
  reg [63:0] _RAND_366;
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
  reg [31:0] _RAND_378;
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
  reg [95:0] _RAND_399;
  reg [31:0] _RAND_400;
  reg [95:0] _RAND_401;
  reg [31:0] _RAND_402;
  reg [95:0] _RAND_403;
  reg [95:0] _RAND_404;
  reg [31:0] _RAND_405;
  reg [31:0] _RAND_406;
  reg [31:0] _RAND_407;
  reg [31:0] _RAND_408;
  reg [31:0] _RAND_409;
  reg [31:0] _RAND_410;
  reg [31:0] _RAND_411;
  reg [31:0] _RAND_412;
  reg [63:0] _RAND_413;
  reg [31:0] _RAND_414;
  reg [63:0] _RAND_415;
  reg [31:0] _RAND_416;
  reg [31:0] _RAND_417;
  reg [31:0] _RAND_418;
  reg [63:0] _RAND_419;
  reg [31:0] _RAND_420;
  reg [63:0] _RAND_421;
  reg [31:0] _RAND_422;
  reg [31:0] _RAND_423;
  reg [31:0] _RAND_424;
  reg [63:0] _RAND_425;
  reg [31:0] _RAND_426;
  reg [63:0] _RAND_427;
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
`endif // RANDOMIZE_REG_INIT
  wire  fp_decoder_clock; // @[fpu.scala 190:26]
  wire  fp_decoder_reset; // @[fpu.scala 190:26]
  wire [6:0] fp_decoder_io_uopc; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_ldst; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_wen; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_ren1; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_ren2; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_ren3; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_swap12; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_swap23; // @[fpu.scala 190:26]
  wire [1:0] fp_decoder_io_sigs_typeTagIn; // @[fpu.scala 190:26]
  wire [1:0] fp_decoder_io_sigs_typeTagOut; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_fromint; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_toint; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_fastpipe; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_fma; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_div; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_sqrt; // @[fpu.scala 190:26]
  wire  fp_decoder_io_sigs_wflags; // @[fpu.scala 190:26]
  wire  dfma_clock; // @[fpu.scala 265:20]
  wire  dfma_reset; // @[fpu.scala 265:20]
  wire  dfma_io_in_valid; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_ldst; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_wen; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_ren1; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_ren2; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_ren3; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_swap12; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_swap23; // @[fpu.scala 265:20]
  wire [1:0] dfma_io_in_bits_typeTagIn; // @[fpu.scala 265:20]
  wire [1:0] dfma_io_in_bits_typeTagOut; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_fromint; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_toint; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_fastpipe; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_fma; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_div; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_sqrt; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_wflags; // @[fpu.scala 265:20]
  wire [2:0] dfma_io_in_bits_rm; // @[fpu.scala 265:20]
  wire [1:0] dfma_io_in_bits_fmaCmd; // @[fpu.scala 265:20]
  wire [1:0] dfma_io_in_bits_typ; // @[fpu.scala 265:20]
  wire [1:0] dfma_io_in_bits_fmt; // @[fpu.scala 265:20]
  wire [64:0] dfma_io_in_bits_in1; // @[fpu.scala 265:20]
  wire [64:0] dfma_io_in_bits_in2; // @[fpu.scala 265:20]
  wire [64:0] dfma_io_in_bits_in3; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_is_unicore; // @[fpu.scala 265:20]
  wire [6:0] dfma_io_in_bits_exc_enabled; // @[fpu.scala 265:20]
  wire  dfma_io_in_bits_c; // @[fpu.scala 265:20]
  wire [3:0] dfma_io_in_bits_cond_unicore; // @[fpu.scala 265:20]
  wire  dfma_io_out_valid; // @[fpu.scala 265:20]
  wire [64:0] dfma_io_out_bits_data; // @[fpu.scala 265:20]
  wire [4:0] dfma_io_out_bits_exc; // @[fpu.scala 265:20]
  wire [6:0] dfma_io_out_bits_u_exception; // @[fpu.scala 265:20]
  wire [9:0] dfma_io_out_bits_u_flag; // @[fpu.scala 265:20]
  wire  dfma_io_out_bits_u_c; // @[fpu.scala 265:20]
  wire  FMADecoder_clock; // @[fpu.scala 228:29]
  wire  FMADecoder_reset; // @[fpu.scala 228:29]
  wire [6:0] FMADecoder_io_uopc; // @[fpu.scala 228:29]
  wire [1:0] FMADecoder_io_cmd; // @[fpu.scala 228:29]
  wire  sfma_clock; // @[fpu.scala 269:20]
  wire  sfma_reset; // @[fpu.scala 269:20]
  wire  sfma_io_in_valid; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_ldst; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_wen; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_ren1; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_ren2; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_ren3; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_swap12; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_swap23; // @[fpu.scala 269:20]
  wire [1:0] sfma_io_in_bits_typeTagIn; // @[fpu.scala 269:20]
  wire [1:0] sfma_io_in_bits_typeTagOut; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_fromint; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_toint; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_fastpipe; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_fma; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_div; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_sqrt; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_wflags; // @[fpu.scala 269:20]
  wire [2:0] sfma_io_in_bits_rm; // @[fpu.scala 269:20]
  wire [1:0] sfma_io_in_bits_fmaCmd; // @[fpu.scala 269:20]
  wire [1:0] sfma_io_in_bits_typ; // @[fpu.scala 269:20]
  wire [1:0] sfma_io_in_bits_fmt; // @[fpu.scala 269:20]
  wire [64:0] sfma_io_in_bits_in1; // @[fpu.scala 269:20]
  wire [64:0] sfma_io_in_bits_in2; // @[fpu.scala 269:20]
  wire [64:0] sfma_io_in_bits_in3; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_is_unicore; // @[fpu.scala 269:20]
  wire [6:0] sfma_io_in_bits_exc_enabled; // @[fpu.scala 269:20]
  wire  sfma_io_in_bits_c; // @[fpu.scala 269:20]
  wire [3:0] sfma_io_in_bits_cond_unicore; // @[fpu.scala 269:20]
  wire  sfma_io_out_valid; // @[fpu.scala 269:20]
  wire [64:0] sfma_io_out_bits_data; // @[fpu.scala 269:20]
  wire [4:0] sfma_io_out_bits_exc; // @[fpu.scala 269:20]
  wire [6:0] sfma_io_out_bits_u_exception; // @[fpu.scala 269:20]
  wire [9:0] sfma_io_out_bits_u_flag; // @[fpu.scala 269:20]
  wire  sfma_io_out_bits_u_c; // @[fpu.scala 269:20]
  wire  FMADecoder_1_clock; // @[fpu.scala 228:29]
  wire  FMADecoder_1_reset; // @[fpu.scala 228:29]
  wire [6:0] FMADecoder_1_io_uopc; // @[fpu.scala 228:29]
  wire [1:0] FMADecoder_1_io_cmd; // @[fpu.scala 228:29]
  wire  fpiu_clock; // @[fpu.scala 273:20]
  wire  fpiu_reset; // @[fpu.scala 273:20]
  wire  fpiu_io_in_valid; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_ldst; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_wen; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_ren1; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_ren2; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_ren3; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_swap12; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_swap23; // @[fpu.scala 273:20]
  wire [1:0] fpiu_io_in_bits_typeTagIn; // @[fpu.scala 273:20]
  wire [1:0] fpiu_io_in_bits_typeTagOut; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_fromint; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_toint; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_fastpipe; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_fma; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_div; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_sqrt; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_wflags; // @[fpu.scala 273:20]
  wire [2:0] fpiu_io_in_bits_rm; // @[fpu.scala 273:20]
  wire [1:0] fpiu_io_in_bits_fmaCmd; // @[fpu.scala 273:20]
  wire [1:0] fpiu_io_in_bits_typ; // @[fpu.scala 273:20]
  wire [1:0] fpiu_io_in_bits_fmt; // @[fpu.scala 273:20]
  wire [64:0] fpiu_io_in_bits_in1; // @[fpu.scala 273:20]
  wire [64:0] fpiu_io_in_bits_in2; // @[fpu.scala 273:20]
  wire [64:0] fpiu_io_in_bits_in3; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_is_unicore; // @[fpu.scala 273:20]
  wire [6:0] fpiu_io_in_bits_exc_enabled; // @[fpu.scala 273:20]
  wire  fpiu_io_in_bits_c; // @[fpu.scala 273:20]
  wire [3:0] fpiu_io_in_bits_cond_unicore; // @[fpu.scala 273:20]
  wire  fpiu_io_out_valid; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_ldst; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_wen; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_ren1; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_ren2; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_ren3; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_swap12; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_swap23; // @[fpu.scala 273:20]
  wire [1:0] fpiu_io_out_bits_in_typeTagIn; // @[fpu.scala 273:20]
  wire [1:0] fpiu_io_out_bits_in_typeTagOut; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_fromint; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_toint; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_fastpipe; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_fma; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_div; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_sqrt; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_wflags; // @[fpu.scala 273:20]
  wire [2:0] fpiu_io_out_bits_in_rm; // @[fpu.scala 273:20]
  wire [1:0] fpiu_io_out_bits_in_fmaCmd; // @[fpu.scala 273:20]
  wire [1:0] fpiu_io_out_bits_in_typ; // @[fpu.scala 273:20]
  wire [1:0] fpiu_io_out_bits_in_fmt; // @[fpu.scala 273:20]
  wire [64:0] fpiu_io_out_bits_in_in1; // @[fpu.scala 273:20]
  wire [64:0] fpiu_io_out_bits_in_in2; // @[fpu.scala 273:20]
  wire [64:0] fpiu_io_out_bits_in_in3; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_is_unicore; // @[fpu.scala 273:20]
  wire [6:0] fpiu_io_out_bits_in_exc_enabled; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_in_c; // @[fpu.scala 273:20]
  wire [3:0] fpiu_io_out_bits_in_cond_unicore; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_lt; // @[fpu.scala 273:20]
  wire [63:0] fpiu_io_out_bits_store; // @[fpu.scala 273:20]
  wire [63:0] fpiu_io_out_bits_toint; // @[fpu.scala 273:20]
  wire [4:0] fpiu_io_out_bits_exc; // @[fpu.scala 273:20]
  wire [63:0] fpiu_io_out_bits_toint_cmp_unicore; // @[fpu.scala 273:20]
  wire [6:0] fpiu_io_out_bits_u_exception; // @[fpu.scala 273:20]
  wire [9:0] fpiu_io_out_bits_u_flag; // @[fpu.scala 273:20]
  wire  fpiu_io_out_bits_u_c; // @[fpu.scala 273:20]
  wire  FMADecoder_2_clock; // @[fpu.scala 228:29]
  wire  FMADecoder_2_reset; // @[fpu.scala 228:29]
  wire [6:0] FMADecoder_2_io_uopc; // @[fpu.scala 228:29]
  wire [1:0] FMADecoder_2_io_cmd; // @[fpu.scala 228:29]
  wire  fpmu_clock; // @[fpu.scala 288:20]
  wire  fpmu_reset; // @[fpu.scala 288:20]
  wire  fpmu_io_in_valid; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_ldst; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_wen; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_ren1; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_ren2; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_ren3; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_swap12; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_swap23; // @[fpu.scala 288:20]
  wire [1:0] fpmu_io_in_bits_typeTagIn; // @[fpu.scala 288:20]
  wire [1:0] fpmu_io_in_bits_typeTagOut; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_fromint; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_toint; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_fastpipe; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_fma; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_div; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_sqrt; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_wflags; // @[fpu.scala 288:20]
  wire [2:0] fpmu_io_in_bits_rm; // @[fpu.scala 288:20]
  wire [1:0] fpmu_io_in_bits_fmaCmd; // @[fpu.scala 288:20]
  wire [1:0] fpmu_io_in_bits_typ; // @[fpu.scala 288:20]
  wire [1:0] fpmu_io_in_bits_fmt; // @[fpu.scala 288:20]
  wire [64:0] fpmu_io_in_bits_in1; // @[fpu.scala 288:20]
  wire [64:0] fpmu_io_in_bits_in2; // @[fpu.scala 288:20]
  wire [64:0] fpmu_io_in_bits_in3; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_is_unicore; // @[fpu.scala 288:20]
  wire [6:0] fpmu_io_in_bits_exc_enabled; // @[fpu.scala 288:20]
  wire  fpmu_io_in_bits_c; // @[fpu.scala 288:20]
  wire [3:0] fpmu_io_in_bits_cond_unicore; // @[fpu.scala 288:20]
  wire  fpmu_io_out_valid; // @[fpu.scala 288:20]
  wire [64:0] fpmu_io_out_bits_data; // @[fpu.scala 288:20]
  wire [4:0] fpmu_io_out_bits_exc; // @[fpu.scala 288:20]
  wire [6:0] fpmu_io_out_bits_u_exception; // @[fpu.scala 288:20]
  wire [9:0] fpmu_io_out_bits_u_flag; // @[fpu.scala 288:20]
  wire  fpmu_io_out_bits_u_c; // @[fpu.scala 288:20]
  wire  fpmu_io_lt; // @[fpu.scala 288:20]
  wire  ifpu_clock; // @[fpu.scala 294:20]
  wire  ifpu_reset; // @[fpu.scala 294:20]
  wire  ifpu_io_in_valid; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_ldst; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_wen; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_ren1; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_ren2; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_ren3; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_swap12; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_swap23; // @[fpu.scala 294:20]
  wire [1:0] ifpu_io_in_bits_typeTagIn; // @[fpu.scala 294:20]
  wire [1:0] ifpu_io_in_bits_typeTagOut; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_fromint; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_toint; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_fastpipe; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_fma; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_div; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_sqrt; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_wflags; // @[fpu.scala 294:20]
  wire [2:0] ifpu_io_in_bits_rm; // @[fpu.scala 294:20]
  wire [1:0] ifpu_io_in_bits_typ; // @[fpu.scala 294:20]
  wire [63:0] ifpu_io_in_bits_in1; // @[fpu.scala 294:20]
  wire [1:0] ifpu_io_in_bits_fmt; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_is_unicore; // @[fpu.scala 294:20]
  wire [6:0] ifpu_io_in_bits_exc_enabled; // @[fpu.scala 294:20]
  wire  ifpu_io_in_bits_c; // @[fpu.scala 294:20]
  wire  ifpu_io_out_valid; // @[fpu.scala 294:20]
  wire [64:0] ifpu_io_out_bits_data; // @[fpu.scala 294:20]
  wire [4:0] ifpu_io_out_bits_exc; // @[fpu.scala 294:20]
  wire [6:0] ifpu_io_out_bits_u_exception; // @[fpu.scala 294:20]
  wire [9:0] ifpu_io_out_bits_u_flag; // @[fpu.scala 294:20]
  wire  ifpu_io_out_bits_u_c; // @[fpu.scala 294:20]
  wire  _T = io_req_bits_uop_uopc == 7'h48; // @[fpu.scala 194:33]
  wire  _T_1 = io_req_bits_uop_uopc == 7'h49; // @[fpu.scala 194:67]
  wire  special = io_req_bits_uop_uopc == 7'h48 | io_req_bits_uop_uopc == 7'h49; // @[fpu.scala 194:48]
  wire [2:0] _T_10 = io_req_bits_uop_imm_packed[18:16] == 3'h5 ? 3'h4 : io_req_bits_uop_imm_packed[18:16]; // @[util.scala 354:27]
  wire [2:0] _T_11 = io_req_bits_uop_imm_packed[18:16] == 3'h4 ? 3'h5 : _T_10; // @[util.scala 353:27]
  wire [2:0] _T_12 = io_req_bits_uop_imm_packed[18:16] == 3'h3 ? 3'h2 : _T_11; // @[util.scala 352:27]
  wire [2:0] _T_13 = io_req_bits_uop_imm_packed[18:16] == 3'h2 ? 3'h3 : _T_12; // @[util.scala 351:27]
  wire [2:0] _T_23 = io_req_bits_fflagdata[2:0] == 3'h5 ? 3'h4 : io_req_bits_fflagdata[2:0]; // @[util.scala 354:27]
  wire [2:0] _T_24 = io_req_bits_fflagdata[2:0] == 3'h4 ? 3'h5 : _T_23; // @[util.scala 353:27]
  wire [2:0] _T_25 = io_req_bits_fflagdata[2:0] == 3'h3 ? 3'h2 : _T_24; // @[util.scala 352:27]
  wire [2:0] _T_26 = io_req_bits_fflagdata[2:0] == 3'h2 ? 3'h3 : _T_25; // @[util.scala 351:27]
  wire [2:0] _T_27 = special ? _T_13 : _T_26; // @[fpu.scala 195:45]
  wire [2:0] _T_31 = io_req_bits_uop_imm_packed[2:0] == 3'h7 ? io_req_bits_fcsr_rm : io_req_bits_uop_imm_packed[2:0]; // @[fpu.scala 196:45]
  wire [2:0] fp_rm = io_req_bits_uop_is_unicore ? _T_27 : _T_31; // @[fpu.scala 195:18]
  wire [3:0] fp_cond_unicore = io_req_bits_uop_imm_packed[9:6]; // @[util.scala 360:60]
  reg  v; // @[Valid.scala 117:22]
  reg [31:0] b; // @[Reg.scala 15:16]
  reg  outPipe_valid; // @[Valid.scala 117:22]
  reg [31:0] outPipe_bits; // @[Reg.scala 15:16]
  reg  outPipe_valid_1; // @[Valid.scala 117:22]
  reg [31:0] outPipe_bits_1; // @[Reg.scala 15:16]
  reg [31:0] outPipe_bits_2; // @[Reg.scala 15:16]
  reg  v_1; // @[Valid.scala 117:22]
  reg  b_1_switch; // @[Reg.scala 15:16]
  reg  b_1_switch_off; // @[Reg.scala 15:16]
  reg  b_1_is_unicore; // @[Reg.scala 15:16]
  reg [2:0] b_1_shift; // @[Reg.scala 15:16]
  reg [1:0] b_1_lrs3_rtype; // @[Reg.scala 15:16]
  reg  b_1_rflag; // @[Reg.scala 15:16]
  reg  b_1_wflag; // @[Reg.scala 15:16]
  reg [3:0] b_1_prflag; // @[Reg.scala 15:16]
  reg [3:0] b_1_pwflag; // @[Reg.scala 15:16]
  reg  b_1_pflag_busy; // @[Reg.scala 15:16]
  reg [3:0] b_1_stale_pflag; // @[Reg.scala 15:16]
  reg [3:0] b_1_op1_sel; // @[Reg.scala 15:16]
  reg [3:0] b_1_op2_sel; // @[Reg.scala 15:16]
  reg [5:0] b_1_split_num; // @[Reg.scala 15:16]
  reg [5:0] b_1_self_index; // @[Reg.scala 15:16]
  reg [5:0] b_1_rob_inst_idx; // @[Reg.scala 15:16]
  reg [5:0] b_1_address_num; // @[Reg.scala 15:16]
  reg [6:0] b_1_uopc; // @[Reg.scala 15:16]
  reg [31:0] b_1_inst; // @[Reg.scala 15:16]
  reg [31:0] b_1_debug_inst; // @[Reg.scala 15:16]
  reg  b_1_is_rvc; // @[Reg.scala 15:16]
  reg [39:0] b_1_debug_pc; // @[Reg.scala 15:16]
  reg [2:0] b_1_iq_type; // @[Reg.scala 15:16]
  reg [9:0] b_1_fu_code; // @[Reg.scala 15:16]
  reg [3:0] b_1_ctrl_br_type; // @[Reg.scala 15:16]
  reg [1:0] b_1_ctrl_op1_sel; // @[Reg.scala 15:16]
  reg [2:0] b_1_ctrl_op2_sel; // @[Reg.scala 15:16]
  reg [2:0] b_1_ctrl_imm_sel; // @[Reg.scala 15:16]
  reg [3:0] b_1_ctrl_op_fcn; // @[Reg.scala 15:16]
  reg  b_1_ctrl_fcn_dw; // @[Reg.scala 15:16]
  reg [2:0] b_1_ctrl_csr_cmd; // @[Reg.scala 15:16]
  reg  b_1_ctrl_is_load; // @[Reg.scala 15:16]
  reg  b_1_ctrl_is_sta; // @[Reg.scala 15:16]
  reg  b_1_ctrl_is_std; // @[Reg.scala 15:16]
  reg [1:0] b_1_ctrl_op3_sel; // @[Reg.scala 15:16]
  reg [1:0] b_1_iw_state; // @[Reg.scala 15:16]
  reg  b_1_iw_p1_poisoned; // @[Reg.scala 15:16]
  reg  b_1_iw_p2_poisoned; // @[Reg.scala 15:16]
  reg  b_1_is_br; // @[Reg.scala 15:16]
  reg  b_1_is_jalr; // @[Reg.scala 15:16]
  reg  b_1_is_jal; // @[Reg.scala 15:16]
  reg  b_1_is_sfb; // @[Reg.scala 15:16]
  reg [11:0] b_1_br_mask; // @[Reg.scala 15:16]
  reg [3:0] b_1_br_tag; // @[Reg.scala 15:16]
  reg [4:0] b_1_ftq_idx; // @[Reg.scala 15:16]
  reg  b_1_edge_inst; // @[Reg.scala 15:16]
  reg [5:0] b_1_pc_lob; // @[Reg.scala 15:16]
  reg  b_1_taken; // @[Reg.scala 15:16]
  reg [19:0] b_1_imm_packed; // @[Reg.scala 15:16]
  reg [11:0] b_1_csr_addr; // @[Reg.scala 15:16]
  reg [5:0] b_1_rob_idx; // @[Reg.scala 15:16]
  reg [4:0] b_1_ldq_idx; // @[Reg.scala 15:16]
  reg [4:0] b_1_stq_idx; // @[Reg.scala 15:16]
  reg [1:0] b_1_rxq_idx; // @[Reg.scala 15:16]
  reg [6:0] b_1_pdst; // @[Reg.scala 15:16]
  reg [6:0] b_1_prs1; // @[Reg.scala 15:16]
  reg [6:0] b_1_prs2; // @[Reg.scala 15:16]
  reg [6:0] b_1_prs3; // @[Reg.scala 15:16]
  reg [4:0] b_1_ppred; // @[Reg.scala 15:16]
  reg  b_1_prs1_busy; // @[Reg.scala 15:16]
  reg  b_1_prs2_busy; // @[Reg.scala 15:16]
  reg  b_1_prs3_busy; // @[Reg.scala 15:16]
  reg  b_1_ppred_busy; // @[Reg.scala 15:16]
  reg [6:0] b_1_stale_pdst; // @[Reg.scala 15:16]
  reg  b_1_exception; // @[Reg.scala 15:16]
  reg [63:0] b_1_exc_cause; // @[Reg.scala 15:16]
  reg  b_1_bypassable; // @[Reg.scala 15:16]
  reg [4:0] b_1_mem_cmd; // @[Reg.scala 15:16]
  reg [1:0] b_1_mem_size; // @[Reg.scala 15:16]
  reg  b_1_mem_signed; // @[Reg.scala 15:16]
  reg  b_1_is_fence; // @[Reg.scala 15:16]
  reg  b_1_is_fencei; // @[Reg.scala 15:16]
  reg  b_1_is_amo; // @[Reg.scala 15:16]
  reg  b_1_uses_ldq; // @[Reg.scala 15:16]
  reg  b_1_uses_stq; // @[Reg.scala 15:16]
  reg  b_1_is_sys_pc2epc; // @[Reg.scala 15:16]
  reg  b_1_is_unique; // @[Reg.scala 15:16]
  reg  b_1_flush_on_commit; // @[Reg.scala 15:16]
  reg  b_1_ldst_is_rs1; // @[Reg.scala 15:16]
  reg [5:0] b_1_ldst; // @[Reg.scala 15:16]
  reg [5:0] b_1_lrs1; // @[Reg.scala 15:16]
  reg [5:0] b_1_lrs2; // @[Reg.scala 15:16]
  reg [5:0] b_1_lrs3; // @[Reg.scala 15:16]
  reg  b_1_ldst_val; // @[Reg.scala 15:16]
  reg [1:0] b_1_dst_rtype; // @[Reg.scala 15:16]
  reg [1:0] b_1_lrs1_rtype; // @[Reg.scala 15:16]
  reg [1:0] b_1_lrs2_rtype; // @[Reg.scala 15:16]
  reg  b_1_frs3_en; // @[Reg.scala 15:16]
  reg  b_1_fp_val; // @[Reg.scala 15:16]
  reg  b_1_fp_single; // @[Reg.scala 15:16]
  reg  b_1_xcpt_pf_if; // @[Reg.scala 15:16]
  reg  b_1_xcpt_ae_if; // @[Reg.scala 15:16]
  reg  b_1_xcpt_ma_if; // @[Reg.scala 15:16]
  reg  b_1_bp_debug_if; // @[Reg.scala 15:16]
  reg  b_1_bp_xcpt_if; // @[Reg.scala 15:16]
  reg [1:0] b_1_debug_fsrc; // @[Reg.scala 15:16]
  reg [1:0] b_1_debug_tsrc; // @[Reg.scala 15:16]
  reg  outPipe_valid_3; // @[Valid.scala 117:22]
  reg  outPipe_bits_3_switch; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_switch_off; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_is_unicore; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_3_shift; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_3_lrs3_rtype; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_rflag; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_wflag; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_3_prflag; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_3_pwflag; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_pflag_busy; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_3_stale_pflag; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_3_op1_sel; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_3_op2_sel; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_3_split_num; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_3_self_index; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_3_rob_inst_idx; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_3_address_num; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_3_uopc; // @[Reg.scala 15:16]
  reg [31:0] outPipe_bits_3_inst; // @[Reg.scala 15:16]
  reg [31:0] outPipe_bits_3_debug_inst; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_is_rvc; // @[Reg.scala 15:16]
  reg [39:0] outPipe_bits_3_debug_pc; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_3_iq_type; // @[Reg.scala 15:16]
  reg [9:0] outPipe_bits_3_fu_code; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_3_ctrl_br_type; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_3_ctrl_op1_sel; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_3_ctrl_op2_sel; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_3_ctrl_imm_sel; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_3_ctrl_op_fcn; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_ctrl_fcn_dw; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_3_ctrl_csr_cmd; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_ctrl_is_load; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_ctrl_is_sta; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_ctrl_is_std; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_3_ctrl_op3_sel; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_3_iw_state; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_iw_p1_poisoned; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_iw_p2_poisoned; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_is_br; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_is_jalr; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_is_jal; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_is_sfb; // @[Reg.scala 15:16]
  reg [11:0] outPipe_bits_3_br_mask; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_3_br_tag; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_3_ftq_idx; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_edge_inst; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_3_pc_lob; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_taken; // @[Reg.scala 15:16]
  reg [19:0] outPipe_bits_3_imm_packed; // @[Reg.scala 15:16]
  reg [11:0] outPipe_bits_3_csr_addr; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_3_rob_idx; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_3_ldq_idx; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_3_stq_idx; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_3_rxq_idx; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_3_pdst; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_3_prs1; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_3_prs2; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_3_prs3; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_3_ppred; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_prs1_busy; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_prs2_busy; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_prs3_busy; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_ppred_busy; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_3_stale_pdst; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_exception; // @[Reg.scala 15:16]
  reg [63:0] outPipe_bits_3_exc_cause; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_bypassable; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_3_mem_cmd; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_3_mem_size; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_mem_signed; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_is_fence; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_is_fencei; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_is_amo; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_uses_ldq; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_uses_stq; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_is_sys_pc2epc; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_is_unique; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_flush_on_commit; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_ldst_is_rs1; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_3_ldst; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_3_lrs1; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_3_lrs2; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_3_lrs3; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_ldst_val; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_3_dst_rtype; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_3_lrs1_rtype; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_3_lrs2_rtype; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_frs3_en; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_fp_val; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_fp_single; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_xcpt_pf_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_xcpt_ae_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_xcpt_ma_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_bp_debug_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_3_bp_xcpt_if; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_3_debug_fsrc; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_3_debug_tsrc; // @[Reg.scala 15:16]
  reg  outPipe_valid_4; // @[Valid.scala 117:22]
  reg  outPipe_bits_4_switch; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_switch_off; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_is_unicore; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_4_shift; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_4_lrs3_rtype; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_rflag; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_wflag; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_4_prflag; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_4_pwflag; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_pflag_busy; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_4_stale_pflag; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_4_op1_sel; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_4_op2_sel; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_4_split_num; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_4_self_index; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_4_rob_inst_idx; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_4_address_num; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_4_uopc; // @[Reg.scala 15:16]
  reg [31:0] outPipe_bits_4_inst; // @[Reg.scala 15:16]
  reg [31:0] outPipe_bits_4_debug_inst; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_is_rvc; // @[Reg.scala 15:16]
  reg [39:0] outPipe_bits_4_debug_pc; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_4_iq_type; // @[Reg.scala 15:16]
  reg [9:0] outPipe_bits_4_fu_code; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_4_ctrl_br_type; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_4_ctrl_op1_sel; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_4_ctrl_op2_sel; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_4_ctrl_imm_sel; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_4_ctrl_op_fcn; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_ctrl_fcn_dw; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_4_ctrl_csr_cmd; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_ctrl_is_load; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_ctrl_is_sta; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_ctrl_is_std; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_4_ctrl_op3_sel; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_4_iw_state; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_iw_p1_poisoned; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_iw_p2_poisoned; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_is_br; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_is_jalr; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_is_jal; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_is_sfb; // @[Reg.scala 15:16]
  reg [11:0] outPipe_bits_4_br_mask; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_4_br_tag; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_4_ftq_idx; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_edge_inst; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_4_pc_lob; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_taken; // @[Reg.scala 15:16]
  reg [19:0] outPipe_bits_4_imm_packed; // @[Reg.scala 15:16]
  reg [11:0] outPipe_bits_4_csr_addr; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_4_rob_idx; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_4_ldq_idx; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_4_stq_idx; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_4_rxq_idx; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_4_pdst; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_4_prs1; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_4_prs2; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_4_prs3; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_4_ppred; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_prs1_busy; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_prs2_busy; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_prs3_busy; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_ppred_busy; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_4_stale_pdst; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_exception; // @[Reg.scala 15:16]
  reg [63:0] outPipe_bits_4_exc_cause; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_bypassable; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_4_mem_cmd; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_4_mem_size; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_mem_signed; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_is_fence; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_is_fencei; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_is_amo; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_uses_ldq; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_uses_stq; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_is_sys_pc2epc; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_is_unique; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_flush_on_commit; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_ldst_is_rs1; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_4_ldst; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_4_lrs1; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_4_lrs2; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_4_lrs3; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_ldst_val; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_4_dst_rtype; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_4_lrs1_rtype; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_4_lrs2_rtype; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_frs3_en; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_fp_val; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_fp_single; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_xcpt_pf_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_xcpt_ae_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_xcpt_ma_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_bp_debug_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_4_bp_xcpt_if; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_4_debug_fsrc; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_4_debug_tsrc; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_switch; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_switch_off; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_is_unicore; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_5_shift; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_5_lrs3_rtype; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_rflag; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_wflag; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_5_prflag; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_5_pwflag; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_pflag_busy; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_5_stale_pflag; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_5_op1_sel; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_5_op2_sel; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_5_split_num; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_5_self_index; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_5_rob_inst_idx; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_5_address_num; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_5_uopc; // @[Reg.scala 15:16]
  reg [31:0] outPipe_bits_5_inst; // @[Reg.scala 15:16]
  reg [31:0] outPipe_bits_5_debug_inst; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_is_rvc; // @[Reg.scala 15:16]
  reg [39:0] outPipe_bits_5_debug_pc; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_5_iq_type; // @[Reg.scala 15:16]
  reg [9:0] outPipe_bits_5_fu_code; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_5_ctrl_br_type; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_5_ctrl_op1_sel; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_5_ctrl_op2_sel; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_5_ctrl_imm_sel; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_5_ctrl_op_fcn; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_ctrl_fcn_dw; // @[Reg.scala 15:16]
  reg [2:0] outPipe_bits_5_ctrl_csr_cmd; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_ctrl_is_load; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_ctrl_is_sta; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_ctrl_is_std; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_5_ctrl_op3_sel; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_5_iw_state; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_iw_p1_poisoned; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_iw_p2_poisoned; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_is_br; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_is_jalr; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_is_jal; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_is_sfb; // @[Reg.scala 15:16]
  reg [11:0] outPipe_bits_5_br_mask; // @[Reg.scala 15:16]
  reg [3:0] outPipe_bits_5_br_tag; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_5_ftq_idx; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_edge_inst; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_5_pc_lob; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_taken; // @[Reg.scala 15:16]
  reg [19:0] outPipe_bits_5_imm_packed; // @[Reg.scala 15:16]
  reg [11:0] outPipe_bits_5_csr_addr; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_5_rob_idx; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_5_ldq_idx; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_5_stq_idx; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_5_rxq_idx; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_5_pdst; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_5_prs1; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_5_prs2; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_5_prs3; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_5_ppred; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_prs1_busy; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_prs2_busy; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_prs3_busy; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_ppred_busy; // @[Reg.scala 15:16]
  reg [6:0] outPipe_bits_5_stale_pdst; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_exception; // @[Reg.scala 15:16]
  reg [63:0] outPipe_bits_5_exc_cause; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_bypassable; // @[Reg.scala 15:16]
  reg [4:0] outPipe_bits_5_mem_cmd; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_5_mem_size; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_mem_signed; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_is_fence; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_is_fencei; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_is_amo; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_uses_ldq; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_uses_stq; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_is_sys_pc2epc; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_is_unique; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_flush_on_commit; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_ldst_is_rs1; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_5_ldst; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_5_lrs1; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_5_lrs2; // @[Reg.scala 15:16]
  reg [5:0] outPipe_bits_5_lrs3; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_ldst_val; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_5_dst_rtype; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_5_lrs1_rtype; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_5_lrs2_rtype; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_frs3_en; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_fp_val; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_fp_single; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_xcpt_pf_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_xcpt_ae_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_xcpt_ma_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_bp_debug_if; // @[Reg.scala 15:16]
  reg  outPipe_bits_5_bp_xcpt_if; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_5_debug_fsrc; // @[Reg.scala 15:16]
  reg [1:0] outPipe_bits_5_debug_tsrc; // @[Reg.scala 15:16]
  reg  v_2; // @[Valid.scala 117:22]
  reg [64:0] b_2; // @[Reg.scala 15:16]
  reg  outPipe_valid_6; // @[Valid.scala 117:22]
  reg [64:0] outPipe_bits_6; // @[Reg.scala 15:16]
  reg  outPipe_valid_7; // @[Valid.scala 117:22]
  reg [64:0] outPipe_bits_7; // @[Reg.scala 15:16]
  reg [64:0] outPipe_bits_8; // @[Reg.scala 15:16]
  wire  _T_32 = io_req_valid & fp_decoder_io_sigs_fma; // @[fpu.scala 266:36]
  wire  _T_33 = fp_decoder_io_sigs_typeTagOut == 2'h1; // @[fpu.scala 266:74]
  wire [6:0] _T_37 = io_req_bits_uop_is_unicore ? io_req_bits_fflagdata[16:10] : 7'h7f; // @[fpu.scala 206:27]
  wire  _T_39 = io_req_bits_uop_is_unicore & io_req_bits_fflagdata[29]; // @[fpu.scala 207:17]
  wire  _T_47 = _T & fp_rm == 3'h0; // @[fpu.scala 214:81]
  wire  _T_48 = io_req_bits_uop_uopc == 7'h7f | io_req_bits_uop_uopc == 7'h7a | io_req_bits_uop_uopc == 7'h7b | _T_47; // @[fpu.scala 213:158]
  wire  _T_52 = _T_48 | _T_1 & fp_rm == 3'h0; // @[fpu.scala 214:99]
  wire [64:0] _T_54 = io_req_bits_uop_is_unicore & _T_52 ? io_req_bits_rs2_data : io_req_bits_rs1_data; // @[fpu.scala 213:23]
  wire  unswizzled_hi_hi = _T_54[31]; // @[FPU.scala 364:14]
  wire  unswizzled_hi_lo = _T_54[52]; // @[FPU.scala 365:14]
  wire [30:0] unswizzled_lo = _T_54[30:0]; // @[FPU.scala 366:14]
  wire [32:0] unswizzled = {unswizzled_hi_hi,unswizzled_hi_lo,unswizzled_lo}; // @[Cat.scala 30:58]
  wire  hi_hi = unswizzled[32]; // @[FPU.scala 280:17]
  wire [22:0] fractIn = unswizzled[22:0]; // @[FPU.scala 281:20]
  wire [8:0] expIn = unswizzled[31:23]; // @[FPU.scala 282:18]
  wire [75:0] _fractOut_T = {fractIn, 53'h0}; // @[FPU.scala 283:28]
  wire [51:0] lo = _fractOut_T[75:24]; // @[FPU.scala 283:38]
  wire [2:0] expOut_hi = expIn[8:6]; // @[FPU.scala 285:26]
  wire [11:0] _GEN_523 = {{3'd0}, expIn}; // @[FPU.scala 286:31]
  wire [11:0] _expOut_commonCase_T_1 = _GEN_523 + 12'h800; // @[FPU.scala 286:31]
  wire [11:0] expOut_commonCase = _expOut_commonCase_T_1 - 12'h100; // @[FPU.scala 286:48]
  wire [8:0] expOut_lo = expOut_commonCase[8:0]; // @[FPU.scala 287:65]
  wire [11:0] _expOut_T_3 = {expOut_hi,expOut_lo}; // @[Cat.scala 30:58]
  wire [11:0] hi_lo = expOut_hi == 3'h0 | expOut_hi >= 3'h6 ? _expOut_T_3 : expOut_commonCase; // @[FPU.scala 287:10]
  wire [64:0] floats_0 = {hi_hi,hi_lo,lo}; // @[Cat.scala 30:58]
  wire  isbox = &_T_54[64:60]; // @[FPU.scala 339:84]
  wire  unswizzled_hi_hi_1 = io_req_bits_rs2_data[31]; // @[FPU.scala 364:14]
  wire  unswizzled_hi_lo_1 = io_req_bits_rs2_data[52]; // @[FPU.scala 365:14]
  wire [30:0] unswizzled_lo_1 = io_req_bits_rs2_data[30:0]; // @[FPU.scala 366:14]
  wire [32:0] unswizzled_1 = {unswizzled_hi_hi_1,unswizzled_hi_lo_1,unswizzled_lo_1}; // @[Cat.scala 30:58]
  wire  hi_hi_1 = unswizzled_1[32]; // @[FPU.scala 280:17]
  wire [22:0] fractIn_1 = unswizzled_1[22:0]; // @[FPU.scala 281:20]
  wire [8:0] expIn_1 = unswizzled_1[31:23]; // @[FPU.scala 282:18]
  wire [75:0] _fractOut_T_1 = {fractIn_1, 53'h0}; // @[FPU.scala 283:28]
  wire [51:0] lo_1 = _fractOut_T_1[75:24]; // @[FPU.scala 283:38]
  wire [2:0] expOut_hi_1 = expIn_1[8:6]; // @[FPU.scala 285:26]
  wire [11:0] _GEN_524 = {{3'd0}, expIn_1}; // @[FPU.scala 286:31]
  wire [11:0] _expOut_commonCase_T_4 = _GEN_524 + 12'h800; // @[FPU.scala 286:31]
  wire [11:0] expOut_commonCase_1 = _expOut_commonCase_T_4 - 12'h100; // @[FPU.scala 286:48]
  wire [8:0] expOut_lo_1 = expOut_commonCase_1[8:0]; // @[FPU.scala 287:65]
  wire [11:0] _expOut_T_8 = {expOut_hi_1,expOut_lo_1}; // @[Cat.scala 30:58]
  wire [11:0] hi_lo_1 = expOut_hi_1 == 3'h0 | expOut_hi_1 >= 3'h6 ? _expOut_T_8 : expOut_commonCase_1; // @[FPU.scala 287:10]
  wire [64:0] floats_0_1 = {hi_hi_1,hi_lo_1,lo_1}; // @[Cat.scala 30:58]
  wire  isbox_1 = &io_req_bits_rs2_data[64:60]; // @[FPU.scala 339:84]
  wire  unswizzled_hi_hi_2 = io_req_bits_rs3_data[31]; // @[FPU.scala 364:14]
  wire  unswizzled_hi_lo_2 = io_req_bits_rs3_data[52]; // @[FPU.scala 365:14]
  wire [30:0] unswizzled_lo_2 = io_req_bits_rs3_data[30:0]; // @[FPU.scala 366:14]
  wire [32:0] unswizzled_2 = {unswizzled_hi_hi_2,unswizzled_hi_lo_2,unswizzled_lo_2}; // @[Cat.scala 30:58]
  wire  hi_hi_2 = unswizzled_2[32]; // @[FPU.scala 280:17]
  wire [22:0] fractIn_2 = unswizzled_2[22:0]; // @[FPU.scala 281:20]
  wire [8:0] expIn_2 = unswizzled_2[31:23]; // @[FPU.scala 282:18]
  wire [75:0] _fractOut_T_2 = {fractIn_2, 53'h0}; // @[FPU.scala 283:28]
  wire [51:0] lo_2 = _fractOut_T_2[75:24]; // @[FPU.scala 283:38]
  wire [2:0] expOut_hi_2 = expIn_2[8:6]; // @[FPU.scala 285:26]
  wire [11:0] _GEN_525 = {{3'd0}, expIn_2}; // @[FPU.scala 286:31]
  wire [11:0] _expOut_commonCase_T_7 = _GEN_525 + 12'h800; // @[FPU.scala 286:31]
  wire [11:0] expOut_commonCase_2 = _expOut_commonCase_T_7 - 12'h100; // @[FPU.scala 286:48]
  wire [8:0] expOut_lo_2 = expOut_commonCase_2[8:0]; // @[FPU.scala 287:65]
  wire [11:0] _expOut_T_13 = {expOut_hi_2,expOut_lo_2}; // @[Cat.scala 30:58]
  wire [11:0] hi_lo_2 = expOut_hi_2 == 3'h0 | expOut_hi_2 >= 3'h6 ? _expOut_T_13 : expOut_commonCase_2; // @[FPU.scala 287:10]
  wire [64:0] floats_0_2 = {hi_hi_2,hi_lo_2,lo_2}; // @[Cat.scala 30:58]
  wire  isbox_2 = &io_req_bits_rs3_data[64:60]; // @[FPU.scala 339:84]
  wire [1:0] _T_62 = io_req_bits_uop_is_unicore ? 2'h0 : io_req_bits_uop_imm_packed[9:8]; // @[fpu.scala 222:19]
  wire  _T_64 = fp_decoder_io_sigs_typeTagIn == 2'h0 ? 1'h0 : 1'h1; // @[fpu.scala 223:19]
  wire  _GEN_397 = io_req_bits_uop_uopc == 7'h46 ? 1'h0 : _T_64; // @[fpu.scala 224:43 fpu.scala 225:15 fpu.scala 223:13]
  wire  _T_66 = io_req_bits_uop_is_unicore & io_req_valid; // @[fpu.scala 233:32]
  reg [4:0] value_lo; // @[Counters.scala 45:37]
  wire [5:0] nextSmall = value_lo + 5'h1; // @[Counters.scala 46:33]
  reg [26:0] value_hi; // @[Counters.scala 50:27]
  wire [26:0] _large_r_T_1 = value_hi + 27'h1; // @[Counters.scala 51:55]
  wire [31:0] value = {value_hi,value_lo}; // @[Cat.scala 30:58]
  wire [32:0] _T_93 = isbox ? 33'h0 : 33'he0400000; // @[FPU.scala 379:31]
  wire [32:0] _T_94 = unswizzled | _T_93; // @[FPU.scala 379:26]
  wire [32:0] _T_95 = isbox_1 ? 33'h0 : 33'he0400000; // @[FPU.scala 379:31]
  wire [32:0] _T_96 = unswizzled_1 | _T_95; // @[FPU.scala 379:26]
  wire [32:0] _T_97 = isbox_2 ? 33'h0 : 33'he0400000; // @[FPU.scala 379:31]
  wire [32:0] _T_98 = unswizzled_2 | _T_97; // @[FPU.scala 379:26]
  wire [64:0] _WIRE_1_in2 = {{32'd0}, _T_96}; // @[fpu.scala 201:19 fpu.scala 218:13]
  reg [4:0] value_lo_1; // @[Counters.scala 45:37]
  wire [5:0] nextSmall_1 = value_lo_1 + 5'h1; // @[Counters.scala 46:33]
  reg [26:0] value_hi_1; // @[Counters.scala 50:27]
  wire [26:0] _large_r_T_3 = value_hi_1 + 27'h1; // @[Counters.scala 51:55]
  wire [31:0] value_1 = {value_hi_1,value_lo_1}; // @[Cat.scala 30:58]
  wire [1:0] _truncIdx_T = fp_decoder_io_sigs_typeTagIn; // @[package.scala 31:21]
  wire  truncIdx = _truncIdx_T[0]; // @[package.scala 31:49]
  wire  _T_132 = truncIdx | isbox; // @[package.scala 32:76]
  wire [64:0] _T_134 = truncIdx ? _T_54 : floats_0; // @[package.scala 32:76]
  wire  _T_137 = truncIdx | isbox_1; // @[package.scala 32:76]
  wire [64:0] _T_139 = truncIdx ? io_req_bits_rs2_data : floats_0_1; // @[package.scala 32:76]
  wire [64:0] _T_140 = _T_137 ? _T_139 : 65'he008000000000000; // @[FPU.scala 376:10]
  wire  _T_142 = truncIdx | isbox_2; // @[package.scala 32:76]
  wire [64:0] _T_144 = truncIdx ? io_req_bits_rs3_data : floats_0_2; // @[package.scala 32:76]
  wire [64:0] _T_145 = _T_142 ? _T_144 : 65'he008000000000000; // @[FPU.scala 376:10]
  reg [4:0] value_lo_2; // @[Counters.scala 45:37]
  wire [5:0] nextSmall_2 = value_lo_2 + 5'h1; // @[Counters.scala 46:33]
  reg [26:0] value_hi_2; // @[Counters.scala 50:27]
  wire [26:0] _large_r_T_5 = value_hi_2 + 27'h1; // @[Counters.scala 51:55]
  wire [31:0] value_2 = {value_hi_2,value_lo_2}; // @[Cat.scala 30:58]
  reg  REG; // @[fpu.scala 276:30]
  reg  fpiu_outPipe_valid; // @[Valid.scala 117:22]
  reg [63:0] fpiu_outPipe_bits_toint; // @[Reg.scala 15:16]
  reg [4:0] fpiu_outPipe_bits_exc; // @[Reg.scala 15:16]
  reg [63:0] fpiu_outPipe_bits_toint_cmp_unicore; // @[Reg.scala 15:16]
  reg [6:0] fpiu_outPipe_bits_u_exception; // @[Reg.scala 15:16]
  reg [9:0] fpiu_outPipe_bits_u_flag; // @[Reg.scala 15:16]
  reg  fpiu_outPipe_valid_1; // @[Valid.scala 117:22]
  reg [63:0] fpiu_outPipe_bits_1_toint; // @[Reg.scala 15:16]
  reg [4:0] fpiu_outPipe_bits_1_exc; // @[Reg.scala 15:16]
  reg [63:0] fpiu_outPipe_bits_1_toint_cmp_unicore; // @[Reg.scala 15:16]
  reg [6:0] fpiu_outPipe_bits_1_u_exception; // @[Reg.scala 15:16]
  reg [9:0] fpiu_outPipe_bits_1_u_flag; // @[Reg.scala 15:16]
  reg  fpiu_outPipe_valid_2; // @[Valid.scala 117:22]
  reg [63:0] fpiu_outPipe_bits_2_toint; // @[Reg.scala 15:16]
  reg [4:0] fpiu_outPipe_bits_2_exc; // @[Reg.scala 15:16]
  reg [63:0] fpiu_outPipe_bits_2_toint_cmp_unicore; // @[Reg.scala 15:16]
  reg [6:0] fpiu_outPipe_bits_2_u_exception; // @[Reg.scala 15:16]
  reg [9:0] fpiu_outPipe_bits_2_u_flag; // @[Reg.scala 15:16]
  wire  _T_159 = outPipe_bits_5_uopc == 7'h56 | outPipe_bits_5_uopc == 7'h42; // @[fpu.scala 280:78]
  wire [63:0] _T_172 = 64'hffffffff00000000 | fpiu_outPipe_bits_2_toint; // @[FPU.scala 438:23]
  wire  rawIn_sign = _T_172[63]; // @[rawFloatFromFN.scala 46:22]
  wire [10:0] rawIn_expIn = _T_172[62:52]; // @[rawFloatFromFN.scala 47:23]
  wire [51:0] rawIn_fractIn = _T_172[51:0]; // @[rawFloatFromFN.scala 48:25]
  wire  rawIn_isZeroExpIn = rawIn_expIn == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  rawIn_isZeroFractIn = rawIn_fractIn == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _rawIn_normDist_T_52 = rawIn_fractIn[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_53 = rawIn_fractIn[2] ? 6'h31 : _rawIn_normDist_T_52; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_54 = rawIn_fractIn[3] ? 6'h30 : _rawIn_normDist_T_53; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_55 = rawIn_fractIn[4] ? 6'h2f : _rawIn_normDist_T_54; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_56 = rawIn_fractIn[5] ? 6'h2e : _rawIn_normDist_T_55; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_57 = rawIn_fractIn[6] ? 6'h2d : _rawIn_normDist_T_56; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_58 = rawIn_fractIn[7] ? 6'h2c : _rawIn_normDist_T_57; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_59 = rawIn_fractIn[8] ? 6'h2b : _rawIn_normDist_T_58; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_60 = rawIn_fractIn[9] ? 6'h2a : _rawIn_normDist_T_59; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_61 = rawIn_fractIn[10] ? 6'h29 : _rawIn_normDist_T_60; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_62 = rawIn_fractIn[11] ? 6'h28 : _rawIn_normDist_T_61; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_63 = rawIn_fractIn[12] ? 6'h27 : _rawIn_normDist_T_62; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_64 = rawIn_fractIn[13] ? 6'h26 : _rawIn_normDist_T_63; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_65 = rawIn_fractIn[14] ? 6'h25 : _rawIn_normDist_T_64; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_66 = rawIn_fractIn[15] ? 6'h24 : _rawIn_normDist_T_65; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_67 = rawIn_fractIn[16] ? 6'h23 : _rawIn_normDist_T_66; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_68 = rawIn_fractIn[17] ? 6'h22 : _rawIn_normDist_T_67; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_69 = rawIn_fractIn[18] ? 6'h21 : _rawIn_normDist_T_68; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_70 = rawIn_fractIn[19] ? 6'h20 : _rawIn_normDist_T_69; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_71 = rawIn_fractIn[20] ? 6'h1f : _rawIn_normDist_T_70; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_72 = rawIn_fractIn[21] ? 6'h1e : _rawIn_normDist_T_71; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_73 = rawIn_fractIn[22] ? 6'h1d : _rawIn_normDist_T_72; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_74 = rawIn_fractIn[23] ? 6'h1c : _rawIn_normDist_T_73; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_75 = rawIn_fractIn[24] ? 6'h1b : _rawIn_normDist_T_74; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_76 = rawIn_fractIn[25] ? 6'h1a : _rawIn_normDist_T_75; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_77 = rawIn_fractIn[26] ? 6'h19 : _rawIn_normDist_T_76; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_78 = rawIn_fractIn[27] ? 6'h18 : _rawIn_normDist_T_77; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_79 = rawIn_fractIn[28] ? 6'h17 : _rawIn_normDist_T_78; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_80 = rawIn_fractIn[29] ? 6'h16 : _rawIn_normDist_T_79; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_81 = rawIn_fractIn[30] ? 6'h15 : _rawIn_normDist_T_80; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_82 = rawIn_fractIn[31] ? 6'h14 : _rawIn_normDist_T_81; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_83 = rawIn_fractIn[32] ? 6'h13 : _rawIn_normDist_T_82; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_84 = rawIn_fractIn[33] ? 6'h12 : _rawIn_normDist_T_83; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_85 = rawIn_fractIn[34] ? 6'h11 : _rawIn_normDist_T_84; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_86 = rawIn_fractIn[35] ? 6'h10 : _rawIn_normDist_T_85; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_87 = rawIn_fractIn[36] ? 6'hf : _rawIn_normDist_T_86; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_88 = rawIn_fractIn[37] ? 6'he : _rawIn_normDist_T_87; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_89 = rawIn_fractIn[38] ? 6'hd : _rawIn_normDist_T_88; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_90 = rawIn_fractIn[39] ? 6'hc : _rawIn_normDist_T_89; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_91 = rawIn_fractIn[40] ? 6'hb : _rawIn_normDist_T_90; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_92 = rawIn_fractIn[41] ? 6'ha : _rawIn_normDist_T_91; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_93 = rawIn_fractIn[42] ? 6'h9 : _rawIn_normDist_T_92; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_94 = rawIn_fractIn[43] ? 6'h8 : _rawIn_normDist_T_93; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_95 = rawIn_fractIn[44] ? 6'h7 : _rawIn_normDist_T_94; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_96 = rawIn_fractIn[45] ? 6'h6 : _rawIn_normDist_T_95; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_97 = rawIn_fractIn[46] ? 6'h5 : _rawIn_normDist_T_96; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_98 = rawIn_fractIn[47] ? 6'h4 : _rawIn_normDist_T_97; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_99 = rawIn_fractIn[48] ? 6'h3 : _rawIn_normDist_T_98; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_100 = rawIn_fractIn[49] ? 6'h2 : _rawIn_normDist_T_99; // @[Mux.scala 47:69]
  wire [5:0] _rawIn_normDist_T_101 = rawIn_fractIn[50] ? 6'h1 : _rawIn_normDist_T_100; // @[Mux.scala 47:69]
  wire [5:0] rawIn_normDist = rawIn_fractIn[51] ? 6'h0 : _rawIn_normDist_T_101; // @[Mux.scala 47:69]
  wire [114:0] _GEN_529 = {{63'd0}, rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _rawIn_subnormFract_T = _GEN_529 << rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] rawIn_subnormFract = {_rawIn_subnormFract_T[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_530 = {{6'd0}, rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _rawIn_adjustedExp_T = _GEN_530 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _rawIn_adjustedExp_T_1 = rawIn_isZeroExpIn ? _rawIn_adjustedExp_T : {{1'd0}, rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _rawIn_adjustedExp_T_2 = rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_531 = {{9'd0}, _rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _rawIn_adjustedExp_T_3 = 11'h400 | _GEN_531; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_532 = {{1'd0}, _rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] rawIn_adjustedExp = _rawIn_adjustedExp_T_1 + _GEN_532; // @[rawFloatFromFN.scala 59:15]
  wire  rawIn_isZero = rawIn_isZeroExpIn & rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  rawIn_isSpecial = rawIn_adjustedExp[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  rawIn__isNaN = rawIn_isSpecial & ~rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] rawIn__sExp = {1'b0,$signed(rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  rawIn_out_sig_hi_lo = ~rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] rawIn_out_sig_lo = rawIn_isZeroExpIn ? rawIn_subnormFract : rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] rawIn__sig = {1'h0,rawIn_out_sig_hi_lo,rawIn_out_sig_lo}; // @[Cat.scala 30:58]
  wire [2:0] _T_174 = rawIn_isZero ? 3'h0 : rawIn__sExp[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_533 = {{2'd0}, rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] hi_lo_9 = _T_174 | _GEN_533; // @[recFNFromFN.scala 48:79]
  wire [8:0] lo_hi = rawIn__sExp[8:0]; // @[recFNFromFN.scala 50:23]
  wire [51:0] lo_lo = rawIn__sig[51:0]; // @[recFNFromFN.scala 51:22]
  wire [64:0] _T_176 = {rawIn_sign,hi_lo_9,lo_hi,lo_lo}; // @[Cat.scala 30:58]
  wire  rawIn_sign_1 = _T_172[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] rawIn_expIn_1 = _T_172[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] rawIn_fractIn_1 = _T_172[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  rawIn_isZeroExpIn_1 = rawIn_expIn_1 == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  rawIn_isZeroFractIn_1 = rawIn_fractIn_1 == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _rawIn_normDist_T_125 = rawIn_fractIn_1[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_126 = rawIn_fractIn_1[2] ? 5'h14 : _rawIn_normDist_T_125; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_127 = rawIn_fractIn_1[3] ? 5'h13 : _rawIn_normDist_T_126; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_128 = rawIn_fractIn_1[4] ? 5'h12 : _rawIn_normDist_T_127; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_129 = rawIn_fractIn_1[5] ? 5'h11 : _rawIn_normDist_T_128; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_130 = rawIn_fractIn_1[6] ? 5'h10 : _rawIn_normDist_T_129; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_131 = rawIn_fractIn_1[7] ? 5'hf : _rawIn_normDist_T_130; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_132 = rawIn_fractIn_1[8] ? 5'he : _rawIn_normDist_T_131; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_133 = rawIn_fractIn_1[9] ? 5'hd : _rawIn_normDist_T_132; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_134 = rawIn_fractIn_1[10] ? 5'hc : _rawIn_normDist_T_133; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_135 = rawIn_fractIn_1[11] ? 5'hb : _rawIn_normDist_T_134; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_136 = rawIn_fractIn_1[12] ? 5'ha : _rawIn_normDist_T_135; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_137 = rawIn_fractIn_1[13] ? 5'h9 : _rawIn_normDist_T_136; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_138 = rawIn_fractIn_1[14] ? 5'h8 : _rawIn_normDist_T_137; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_139 = rawIn_fractIn_1[15] ? 5'h7 : _rawIn_normDist_T_138; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_140 = rawIn_fractIn_1[16] ? 5'h6 : _rawIn_normDist_T_139; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_141 = rawIn_fractIn_1[17] ? 5'h5 : _rawIn_normDist_T_140; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_142 = rawIn_fractIn_1[18] ? 5'h4 : _rawIn_normDist_T_141; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_143 = rawIn_fractIn_1[19] ? 5'h3 : _rawIn_normDist_T_142; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_144 = rawIn_fractIn_1[20] ? 5'h2 : _rawIn_normDist_T_143; // @[Mux.scala 47:69]
  wire [4:0] _rawIn_normDist_T_145 = rawIn_fractIn_1[21] ? 5'h1 : _rawIn_normDist_T_144; // @[Mux.scala 47:69]
  wire [4:0] rawIn_normDist_1 = rawIn_fractIn_1[22] ? 5'h0 : _rawIn_normDist_T_145; // @[Mux.scala 47:69]
  wire [53:0] _GEN_534 = {{31'd0}, rawIn_fractIn_1}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _rawIn_subnormFract_T_2 = _GEN_534 << rawIn_normDist_1; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] rawIn_subnormFract_1 = {_rawIn_subnormFract_T_2[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_535 = {{4'd0}, rawIn_normDist_1}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _rawIn_adjustedExp_T_5 = _GEN_535 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _rawIn_adjustedExp_T_6 = rawIn_isZeroExpIn_1 ? _rawIn_adjustedExp_T_5 : {{1'd0}, rawIn_expIn_1}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _rawIn_adjustedExp_T_7 = rawIn_isZeroExpIn_1 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_536 = {{6'd0}, _rawIn_adjustedExp_T_7}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _rawIn_adjustedExp_T_8 = 8'h80 | _GEN_536; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_537 = {{1'd0}, _rawIn_adjustedExp_T_8}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] rawIn_adjustedExp_1 = _rawIn_adjustedExp_T_6 + _GEN_537; // @[rawFloatFromFN.scala 59:15]
  wire  rawIn_isZero_1 = rawIn_isZeroExpIn_1 & rawIn_isZeroFractIn_1; // @[rawFloatFromFN.scala 62:34]
  wire  rawIn_isSpecial_1 = rawIn_adjustedExp_1[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  rawIn_1_isNaN = rawIn_isSpecial_1 & ~rawIn_isZeroFractIn_1; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] rawIn_1_sExp = {1'b0,$signed(rawIn_adjustedExp_1)}; // @[rawFloatFromFN.scala 70:48]
  wire  rawIn_out_sig_hi_lo_1 = ~rawIn_isZero_1; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] rawIn_out_sig_lo_1 = rawIn_isZeroExpIn_1 ? rawIn_subnormFract_1 : rawIn_fractIn_1; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] rawIn_1_sig = {1'h0,rawIn_out_sig_hi_lo_1,rawIn_out_sig_lo_1}; // @[Cat.scala 30:58]
  wire [2:0] _T_178 = rawIn_isZero_1 ? 3'h0 : rawIn_1_sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_538 = {{2'd0}, rawIn_1_isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] hi_lo_10 = _T_178 | _GEN_538; // @[recFNFromFN.scala 48:79]
  wire [5:0] lo_hi_1 = rawIn_1_sExp[5:0]; // @[recFNFromFN.scala 50:23]
  wire [22:0] lo_lo_1 = rawIn_1_sig[22:0]; // @[recFNFromFN.scala 51:22]
  wire [32:0] _T_180 = {rawIn_sign_1,hi_lo_10,lo_hi_1,lo_lo_1}; // @[Cat.scala 30:58]
  wire [3:0] swizzledNaN_hi_hi_hi = _T_176[64:61]; // @[FPU.scala 344:8]
  wire  swizzledNaN_hi_hi_lo = &_T_176[51:32]; // @[FPU.scala 345:42]
  wire [6:0] swizzledNaN_hi_lo_hi = _T_176[59:53]; // @[FPU.scala 346:8]
  wire  swizzledNaN_hi_lo_lo = _T_180[31]; // @[FPU.scala 347:8]
  wire  swizzledNaN_lo_hi_lo = _T_180[32]; // @[FPU.scala 349:8]
  wire [30:0] swizzledNaN_lo_lo = _T_180[30:0]; // @[FPU.scala 350:8]
  wire [64:0] swizzledNaN = {swizzledNaN_hi_hi_hi,swizzledNaN_hi_hi_lo,swizzledNaN_hi_lo_hi,swizzledNaN_hi_lo_lo,_T_176[
    51:32],swizzledNaN_lo_hi_lo,swizzledNaN_lo_lo}; // @[Cat.scala 30:58]
  wire  _T_182 = &_T_176[63:61]; // @[FPU.scala 255:56]
  wire [64:0] _T_183 = _T_182 ? swizzledNaN : _T_176; // @[FPU.scala 351:8]
  wire [64:0] _T_184 = outPipe_bits_5_is_unicore & (outPipe_bits_5_uopc == 7'h4e | outPipe_bits_5_uopc == 7'h4f) ?
    _T_183 : {{1'd0}, fpiu_outPipe_bits_2_toint}; // @[fpu.scala 281:101]
  wire [64:0] _T_185 = outPipe_bits_5_uopc == 7'h7e ? {{33'd0}, outPipe_bits_2} : _T_184; // @[fpu.scala 281:63]
  wire [64:0] fpiu_result_data = outPipe_bits_5_is_unicore & (outPipe_bits_5_uopc == 7'h56 | outPipe_bits_5_uopc == 7'h42
     | outPipe_bits_5_uopc == 7'h50 | outPipe_bits_5_uopc == 7'h51) ? {{1'd0}, fpiu_outPipe_bits_2_toint_cmp_unicore} :
    _T_185; // @[fpu.scala 280:26]
  wire  _T_187 = io_req_valid & fp_decoder_io_sigs_fastpipe; // @[fpu.scala 289:36]
  reg  v_3; // @[Valid.scala 117:22]
  reg  b_3; // @[Reg.scala 15:16]
  reg  outPipe_valid_9; // @[Valid.scala 117:22]
  reg  outPipe_bits_9; // @[Reg.scala 15:16]
  reg  outPipe_valid_10; // @[Valid.scala 117:22]
  reg  outPipe_bits_10; // @[Reg.scala 15:16]
  reg  outPipe_bits_11; // @[Reg.scala 15:16]
  wire  _T_190 = io_req_valid & fp_decoder_io_sigs_fromint; // @[fpu.scala 295:36]
  wire [11:0] unrecoded_rawIn_exp = io_req_bits_rs1_data[63:52]; // @[rawFloatFromRecFN.scala 50:21]
  wire  unrecoded_rawIn_isZero = unrecoded_rawIn_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  unrecoded_rawIn_isSpecial = unrecoded_rawIn_exp[11:10] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  unrecoded_rawIn__isNaN = unrecoded_rawIn_isSpecial & unrecoded_rawIn_exp[9]; // @[rawFloatFromRecFN.scala 55:33]
  wire  unrecoded_rawIn__isInf = unrecoded_rawIn_isSpecial & ~unrecoded_rawIn_exp[9]; // @[rawFloatFromRecFN.scala 56:33]
  wire  unrecoded_rawIn__sign = io_req_bits_rs1_data[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] unrecoded_rawIn__sExp = {1'b0,$signed(unrecoded_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  unrecoded_rawIn_out_sig_hi_lo = ~unrecoded_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [51:0] unrecoded_rawIn_out_sig_lo = io_req_bits_rs1_data[51:0]; // @[rawFloatFromRecFN.scala 60:51]
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
  wire  prevRecoded_hi_hi = io_req_bits_rs1_data[31]; // @[FPU.scala 449:10]
  wire  prevRecoded_hi_lo = io_req_bits_rs1_data[52]; // @[FPU.scala 450:10]
  wire [30:0] prevRecoded_lo = io_req_bits_rs1_data[30:0]; // @[FPU.scala 451:10]
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
  wire [31:0] hi_11 = unrecoded[63:32]; // @[FPU.scala 453:21]
  wire  _T_192 = &io_req_bits_rs1_data[63:61]; // @[FPU.scala 255:56]
  wire [31:0] lo_11 = _T_192 ? prevUnrecoded : unrecoded[31:0]; // @[FPU.scala 453:44]
  reg  v_4; // @[Valid.scala 117:22]
  reg  b_4; // @[Reg.scala 15:16]
  reg  outPipe_valid_12; // @[Valid.scala 117:22]
  reg  outPipe_bits_12; // @[Reg.scala 15:16]
  reg  outPipe_valid_13; // @[Valid.scala 117:22]
  reg  outPipe_bits_13; // @[Reg.scala 15:16]
  reg  outPipe_bits_14; // @[Reg.scala 15:16]
  wire  _T_197 = fpiu_outPipe_valid_2 | fpmu_io_out_valid; // @[fpu.scala 301:35]
  wire  _T_198 = _T_197 | sfma_io_out_valid; // @[fpu.scala 302:38]
  wire  _T_199 = _T_198 | dfma_io_out_valid; // @[fpu.scala 303:38]
  wire [64:0] _T_212 = dfma_io_out_bits_data; // @[package.scala 32:76]
  wire  opts_bigger_swizzledNaN_hi_lo_lo_1 = sfma_io_out_bits_data[31]; // @[FPU.scala 347:8]
  wire  opts_bigger_swizzledNaN_lo_hi_lo_1 = sfma_io_out_bits_data[32]; // @[FPU.scala 349:8]
  wire [30:0] opts_bigger_swizzledNaN_lo_lo_1 = sfma_io_out_bits_data[30:0]; // @[FPU.scala 350:8]
  wire [64:0] opts_bigger_swizzledNaN_1 = {5'h1f,7'h7f,opts_bigger_swizzledNaN_hi_lo_lo_1,20'hfffff,
    opts_bigger_swizzledNaN_lo_hi_lo_1,opts_bigger_swizzledNaN_lo_lo_1}; // @[Cat.scala 30:58]
  wire  opts_bigger_swizzledNaN_hi_lo_lo_2 = fpmu_io_out_bits_data[31]; // @[FPU.scala 347:8]
  wire  opts_bigger_swizzledNaN_lo_hi_lo_2 = fpmu_io_out_bits_data[32]; // @[FPU.scala 349:8]
  wire [30:0] opts_bigger_swizzledNaN_lo_lo_2 = fpmu_io_out_bits_data[30:0]; // @[FPU.scala 350:8]
  wire [64:0] opts_bigger_swizzledNaN_2 = {5'h1f,7'h7f,opts_bigger_swizzledNaN_hi_lo_lo_2,20'hfffff,
    opts_bigger_swizzledNaN_lo_hi_lo_2,opts_bigger_swizzledNaN_lo_lo_2}; // @[Cat.scala 30:58]
  wire [64:0] _T_216 = outPipe_bits_11 ? fpmu_io_out_bits_data : opts_bigger_swizzledNaN_2; // @[package.scala 32:76]
  wire  opts_bigger_swizzledNaN_hi_lo_lo_3 = ifpu_io_out_bits_data[31]; // @[FPU.scala 347:8]
  wire  opts_bigger_swizzledNaN_lo_hi_lo_3 = ifpu_io_out_bits_data[32]; // @[FPU.scala 349:8]
  wire [30:0] opts_bigger_swizzledNaN_lo_lo_3 = ifpu_io_out_bits_data[30:0]; // @[FPU.scala 350:8]
  wire [64:0] opts_bigger_swizzledNaN_3 = {5'h1f,7'h7f,opts_bigger_swizzledNaN_hi_lo_lo_3,20'hfffff,
    opts_bigger_swizzledNaN_lo_hi_lo_3,opts_bigger_swizzledNaN_lo_lo_3}; // @[Cat.scala 30:58]
  wire [64:0] _T_218 = outPipe_bits_14 ? ifpu_io_out_bits_data : opts_bigger_swizzledNaN_3; // @[package.scala 32:76]
  wire [64:0] _T_219 = fpmu_io_out_valid ? _T_216 : _T_218; // @[fpu.scala 313:8]
  wire [64:0] _T_220 = fpiu_outPipe_valid_2 ? fpiu_result_data : _T_219; // @[fpu.scala 312:8]
  wire [64:0] _T_221 = sfma_io_out_valid ? opts_bigger_swizzledNaN_1 : _T_220; // @[fpu.scala 311:8]
  wire [64:0] _T_222 = dfma_io_out_valid ? _T_212 : _T_221; // @[fpu.scala 310:8]
  wire [64:0] fpu_out_data = outPipe_bits_5_is_unicore & (outPipe_bits_5_uopc == 7'h7f | outPipe_bits_5_uopc == 7'h7a |
    outPipe_bits_5_uopc == 7'h7b) & outPipe_bits_2[29] != outPipe_bits_5_imm_packed[19] ? outPipe_bits_8 : _T_222; // @[fpu.scala 309:8]
  wire [4:0] _T_223 = fpmu_io_out_valid ? fpmu_io_out_bits_exc : ifpu_io_out_bits_exc; // @[fpu.scala 321:8]
  wire [4:0] _T_224 = fpiu_outPipe_valid_2 ? fpiu_outPipe_bits_2_exc : _T_223; // @[fpu.scala 320:8]
  wire [4:0] _T_225 = sfma_io_out_valid ? sfma_io_out_bits_exc : _T_224; // @[fpu.scala 319:8]
  wire [6:0] _T_226 = fpmu_io_out_valid ? fpmu_io_out_bits_u_exception : ifpu_io_out_bits_u_exception; // @[fpu.scala 328:8]
  wire [6:0] _T_227 = fpiu_outPipe_valid_2 ? fpiu_outPipe_bits_2_u_exception : _T_226; // @[fpu.scala 327:8]
  wire [6:0] _T_228 = sfma_io_out_valid ? sfma_io_out_bits_u_exception : _T_227; // @[fpu.scala 326:8]
  wire [6:0] fpu_out_u_exception = dfma_io_out_valid ? dfma_io_out_bits_u_exception : _T_228; // @[fpu.scala 325:8]
  wire [9:0] _T_229 = fpmu_io_out_valid ? fpmu_io_out_bits_u_flag : ifpu_io_out_bits_u_flag; // @[fpu.scala 335:8]
  wire [9:0] _T_230 = fpiu_outPipe_valid_2 ? fpiu_outPipe_bits_2_u_flag : _T_229; // @[fpu.scala 334:8]
  wire [9:0] _T_231 = sfma_io_out_valid ? sfma_io_out_bits_u_flag : _T_230; // @[fpu.scala 333:8]
  wire [9:0] fpu_out_u_flag = dfma_io_out_valid ? dfma_io_out_bits_u_flag : _T_231; // @[fpu.scala 332:8]
  wire  fpu_out_u_c = outPipe_bits_5_is_unicore & _T_159 ? fpu_out_data[0] : outPipe_bits_2[29]; // @[fpu.scala 339:24]
  wire  hi_lo_lo = fpu_out_u_exception[0] | fpu_out_u_exception[1] | fpu_out_u_exception[2] | fpu_out_u_exception[3] |
    fpu_out_u_exception[4] | fpu_out_u_exception[5] | fpu_out_u_exception[6]; // @[fpu.scala 347:117]
  wire [6:0] lo_hi_lo = outPipe_bits_2[16:10]; // @[fpu.scala 348:65]
  wire [2:0] lo_lo_lo = outPipe_bits_2[2:0]; // @[fpu.scala 348:104]
  wire [26:0] lo_12 = {fpu_out_u_flag,lo_hi_lo,fpu_out_u_exception,lo_lo_lo}; // @[Cat.scala 30:58]
  wire [4:0] hi_12 = {2'h0,fpu_out_u_c,1'h0,hi_lo_lo}; // @[Cat.scala 30:58]
  wire  _T_257 = outPipe_bits_5_is_unicore & io_resp_valid; // @[fpu.scala 351:39]
  reg [4:0] value_lo_3; // @[Counters.scala 45:37]
  wire [5:0] nextSmall_3 = value_lo_3 + 5'h1; // @[Counters.scala 46:33]
  reg [26:0] value_hi_3; // @[Counters.scala 50:27]
  wire [26:0] _large_r_T_7 = value_hi_3 + 27'h1; // @[Counters.scala 51:55]
  wire [31:0] value_3 = {value_hi_3,value_lo_3}; // @[Cat.scala 30:58]
  wire [1:0] _WIRE_fmt = {{1'd0}, _GEN_397}; // @[fpu.scala 201:19]
  UOPCodeFPUDecoder fp_decoder ( // @[fpu.scala 190:26]
    .clock(fp_decoder_clock),
    .reset(fp_decoder_reset),
    .io_uopc(fp_decoder_io_uopc),
    .io_sigs_ldst(fp_decoder_io_sigs_ldst),
    .io_sigs_wen(fp_decoder_io_sigs_wen),
    .io_sigs_ren1(fp_decoder_io_sigs_ren1),
    .io_sigs_ren2(fp_decoder_io_sigs_ren2),
    .io_sigs_ren3(fp_decoder_io_sigs_ren3),
    .io_sigs_swap12(fp_decoder_io_sigs_swap12),
    .io_sigs_swap23(fp_decoder_io_sigs_swap23),
    .io_sigs_typeTagIn(fp_decoder_io_sigs_typeTagIn),
    .io_sigs_typeTagOut(fp_decoder_io_sigs_typeTagOut),
    .io_sigs_fromint(fp_decoder_io_sigs_fromint),
    .io_sigs_toint(fp_decoder_io_sigs_toint),
    .io_sigs_fastpipe(fp_decoder_io_sigs_fastpipe),
    .io_sigs_fma(fp_decoder_io_sigs_fma),
    .io_sigs_div(fp_decoder_io_sigs_div),
    .io_sigs_sqrt(fp_decoder_io_sigs_sqrt),
    .io_sigs_wflags(fp_decoder_io_sigs_wflags)
  );
  FPUFMAPipe dfma ( // @[fpu.scala 265:20]
    .clock(dfma_clock),
    .reset(dfma_reset),
    .io_in_valid(dfma_io_in_valid),
    .io_in_bits_ldst(dfma_io_in_bits_ldst),
    .io_in_bits_wen(dfma_io_in_bits_wen),
    .io_in_bits_ren1(dfma_io_in_bits_ren1),
    .io_in_bits_ren2(dfma_io_in_bits_ren2),
    .io_in_bits_ren3(dfma_io_in_bits_ren3),
    .io_in_bits_swap12(dfma_io_in_bits_swap12),
    .io_in_bits_swap23(dfma_io_in_bits_swap23),
    .io_in_bits_typeTagIn(dfma_io_in_bits_typeTagIn),
    .io_in_bits_typeTagOut(dfma_io_in_bits_typeTagOut),
    .io_in_bits_fromint(dfma_io_in_bits_fromint),
    .io_in_bits_toint(dfma_io_in_bits_toint),
    .io_in_bits_fastpipe(dfma_io_in_bits_fastpipe),
    .io_in_bits_fma(dfma_io_in_bits_fma),
    .io_in_bits_div(dfma_io_in_bits_div),
    .io_in_bits_sqrt(dfma_io_in_bits_sqrt),
    .io_in_bits_wflags(dfma_io_in_bits_wflags),
    .io_in_bits_rm(dfma_io_in_bits_rm),
    .io_in_bits_fmaCmd(dfma_io_in_bits_fmaCmd),
    .io_in_bits_typ(dfma_io_in_bits_typ),
    .io_in_bits_fmt(dfma_io_in_bits_fmt),
    .io_in_bits_in1(dfma_io_in_bits_in1),
    .io_in_bits_in2(dfma_io_in_bits_in2),
    .io_in_bits_in3(dfma_io_in_bits_in3),
    .io_in_bits_is_unicore(dfma_io_in_bits_is_unicore),
    .io_in_bits_exc_enabled(dfma_io_in_bits_exc_enabled),
    .io_in_bits_c(dfma_io_in_bits_c),
    .io_in_bits_cond_unicore(dfma_io_in_bits_cond_unicore),
    .io_out_valid(dfma_io_out_valid),
    .io_out_bits_data(dfma_io_out_bits_data),
    .io_out_bits_exc(dfma_io_out_bits_exc),
    .io_out_bits_u_exception(dfma_io_out_bits_u_exception),
    .io_out_bits_u_flag(dfma_io_out_bits_u_flag),
    .io_out_bits_u_c(dfma_io_out_bits_u_c)
  );
  FMADecoder FMADecoder ( // @[fpu.scala 228:29]
    .clock(FMADecoder_clock),
    .reset(FMADecoder_reset),
    .io_uopc(FMADecoder_io_uopc),
    .io_cmd(FMADecoder_io_cmd)
  );
  FPUFMAPipe_1 sfma ( // @[fpu.scala 269:20]
    .clock(sfma_clock),
    .reset(sfma_reset),
    .io_in_valid(sfma_io_in_valid),
    .io_in_bits_ldst(sfma_io_in_bits_ldst),
    .io_in_bits_wen(sfma_io_in_bits_wen),
    .io_in_bits_ren1(sfma_io_in_bits_ren1),
    .io_in_bits_ren2(sfma_io_in_bits_ren2),
    .io_in_bits_ren3(sfma_io_in_bits_ren3),
    .io_in_bits_swap12(sfma_io_in_bits_swap12),
    .io_in_bits_swap23(sfma_io_in_bits_swap23),
    .io_in_bits_typeTagIn(sfma_io_in_bits_typeTagIn),
    .io_in_bits_typeTagOut(sfma_io_in_bits_typeTagOut),
    .io_in_bits_fromint(sfma_io_in_bits_fromint),
    .io_in_bits_toint(sfma_io_in_bits_toint),
    .io_in_bits_fastpipe(sfma_io_in_bits_fastpipe),
    .io_in_bits_fma(sfma_io_in_bits_fma),
    .io_in_bits_div(sfma_io_in_bits_div),
    .io_in_bits_sqrt(sfma_io_in_bits_sqrt),
    .io_in_bits_wflags(sfma_io_in_bits_wflags),
    .io_in_bits_rm(sfma_io_in_bits_rm),
    .io_in_bits_fmaCmd(sfma_io_in_bits_fmaCmd),
    .io_in_bits_typ(sfma_io_in_bits_typ),
    .io_in_bits_fmt(sfma_io_in_bits_fmt),
    .io_in_bits_in1(sfma_io_in_bits_in1),
    .io_in_bits_in2(sfma_io_in_bits_in2),
    .io_in_bits_in3(sfma_io_in_bits_in3),
    .io_in_bits_is_unicore(sfma_io_in_bits_is_unicore),
    .io_in_bits_exc_enabled(sfma_io_in_bits_exc_enabled),
    .io_in_bits_c(sfma_io_in_bits_c),
    .io_in_bits_cond_unicore(sfma_io_in_bits_cond_unicore),
    .io_out_valid(sfma_io_out_valid),
    .io_out_bits_data(sfma_io_out_bits_data),
    .io_out_bits_exc(sfma_io_out_bits_exc),
    .io_out_bits_u_exception(sfma_io_out_bits_u_exception),
    .io_out_bits_u_flag(sfma_io_out_bits_u_flag),
    .io_out_bits_u_c(sfma_io_out_bits_u_c)
  );
  FMADecoder FMADecoder_1 ( // @[fpu.scala 228:29]
    .clock(FMADecoder_1_clock),
    .reset(FMADecoder_1_reset),
    .io_uopc(FMADecoder_1_io_uopc),
    .io_cmd(FMADecoder_1_io_cmd)
  );
  FPToInt fpiu ( // @[fpu.scala 273:20]
    .clock(fpiu_clock),
    .reset(fpiu_reset),
    .io_in_valid(fpiu_io_in_valid),
    .io_in_bits_ldst(fpiu_io_in_bits_ldst),
    .io_in_bits_wen(fpiu_io_in_bits_wen),
    .io_in_bits_ren1(fpiu_io_in_bits_ren1),
    .io_in_bits_ren2(fpiu_io_in_bits_ren2),
    .io_in_bits_ren3(fpiu_io_in_bits_ren3),
    .io_in_bits_swap12(fpiu_io_in_bits_swap12),
    .io_in_bits_swap23(fpiu_io_in_bits_swap23),
    .io_in_bits_typeTagIn(fpiu_io_in_bits_typeTagIn),
    .io_in_bits_typeTagOut(fpiu_io_in_bits_typeTagOut),
    .io_in_bits_fromint(fpiu_io_in_bits_fromint),
    .io_in_bits_toint(fpiu_io_in_bits_toint),
    .io_in_bits_fastpipe(fpiu_io_in_bits_fastpipe),
    .io_in_bits_fma(fpiu_io_in_bits_fma),
    .io_in_bits_div(fpiu_io_in_bits_div),
    .io_in_bits_sqrt(fpiu_io_in_bits_sqrt),
    .io_in_bits_wflags(fpiu_io_in_bits_wflags),
    .io_in_bits_rm(fpiu_io_in_bits_rm),
    .io_in_bits_fmaCmd(fpiu_io_in_bits_fmaCmd),
    .io_in_bits_typ(fpiu_io_in_bits_typ),
    .io_in_bits_fmt(fpiu_io_in_bits_fmt),
    .io_in_bits_in1(fpiu_io_in_bits_in1),
    .io_in_bits_in2(fpiu_io_in_bits_in2),
    .io_in_bits_in3(fpiu_io_in_bits_in3),
    .io_in_bits_is_unicore(fpiu_io_in_bits_is_unicore),
    .io_in_bits_exc_enabled(fpiu_io_in_bits_exc_enabled),
    .io_in_bits_c(fpiu_io_in_bits_c),
    .io_in_bits_cond_unicore(fpiu_io_in_bits_cond_unicore),
    .io_out_valid(fpiu_io_out_valid),
    .io_out_bits_in_ldst(fpiu_io_out_bits_in_ldst),
    .io_out_bits_in_wen(fpiu_io_out_bits_in_wen),
    .io_out_bits_in_ren1(fpiu_io_out_bits_in_ren1),
    .io_out_bits_in_ren2(fpiu_io_out_bits_in_ren2),
    .io_out_bits_in_ren3(fpiu_io_out_bits_in_ren3),
    .io_out_bits_in_swap12(fpiu_io_out_bits_in_swap12),
    .io_out_bits_in_swap23(fpiu_io_out_bits_in_swap23),
    .io_out_bits_in_typeTagIn(fpiu_io_out_bits_in_typeTagIn),
    .io_out_bits_in_typeTagOut(fpiu_io_out_bits_in_typeTagOut),
    .io_out_bits_in_fromint(fpiu_io_out_bits_in_fromint),
    .io_out_bits_in_toint(fpiu_io_out_bits_in_toint),
    .io_out_bits_in_fastpipe(fpiu_io_out_bits_in_fastpipe),
    .io_out_bits_in_fma(fpiu_io_out_bits_in_fma),
    .io_out_bits_in_div(fpiu_io_out_bits_in_div),
    .io_out_bits_in_sqrt(fpiu_io_out_bits_in_sqrt),
    .io_out_bits_in_wflags(fpiu_io_out_bits_in_wflags),
    .io_out_bits_in_rm(fpiu_io_out_bits_in_rm),
    .io_out_bits_in_fmaCmd(fpiu_io_out_bits_in_fmaCmd),
    .io_out_bits_in_typ(fpiu_io_out_bits_in_typ),
    .io_out_bits_in_fmt(fpiu_io_out_bits_in_fmt),
    .io_out_bits_in_in1(fpiu_io_out_bits_in_in1),
    .io_out_bits_in_in2(fpiu_io_out_bits_in_in2),
    .io_out_bits_in_in3(fpiu_io_out_bits_in_in3),
    .io_out_bits_in_is_unicore(fpiu_io_out_bits_in_is_unicore),
    .io_out_bits_in_exc_enabled(fpiu_io_out_bits_in_exc_enabled),
    .io_out_bits_in_c(fpiu_io_out_bits_in_c),
    .io_out_bits_in_cond_unicore(fpiu_io_out_bits_in_cond_unicore),
    .io_out_bits_lt(fpiu_io_out_bits_lt),
    .io_out_bits_store(fpiu_io_out_bits_store),
    .io_out_bits_toint(fpiu_io_out_bits_toint),
    .io_out_bits_exc(fpiu_io_out_bits_exc),
    .io_out_bits_toint_cmp_unicore(fpiu_io_out_bits_toint_cmp_unicore),
    .io_out_bits_u_exception(fpiu_io_out_bits_u_exception),
    .io_out_bits_u_flag(fpiu_io_out_bits_u_flag),
    .io_out_bits_u_c(fpiu_io_out_bits_u_c)
  );
  FMADecoder FMADecoder_2 ( // @[fpu.scala 228:29]
    .clock(FMADecoder_2_clock),
    .reset(FMADecoder_2_reset),
    .io_uopc(FMADecoder_2_io_uopc),
    .io_cmd(FMADecoder_2_io_cmd)
  );
  FPToFP fpmu ( // @[fpu.scala 288:20]
    .clock(fpmu_clock),
    .reset(fpmu_reset),
    .io_in_valid(fpmu_io_in_valid),
    .io_in_bits_ldst(fpmu_io_in_bits_ldst),
    .io_in_bits_wen(fpmu_io_in_bits_wen),
    .io_in_bits_ren1(fpmu_io_in_bits_ren1),
    .io_in_bits_ren2(fpmu_io_in_bits_ren2),
    .io_in_bits_ren3(fpmu_io_in_bits_ren3),
    .io_in_bits_swap12(fpmu_io_in_bits_swap12),
    .io_in_bits_swap23(fpmu_io_in_bits_swap23),
    .io_in_bits_typeTagIn(fpmu_io_in_bits_typeTagIn),
    .io_in_bits_typeTagOut(fpmu_io_in_bits_typeTagOut),
    .io_in_bits_fromint(fpmu_io_in_bits_fromint),
    .io_in_bits_toint(fpmu_io_in_bits_toint),
    .io_in_bits_fastpipe(fpmu_io_in_bits_fastpipe),
    .io_in_bits_fma(fpmu_io_in_bits_fma),
    .io_in_bits_div(fpmu_io_in_bits_div),
    .io_in_bits_sqrt(fpmu_io_in_bits_sqrt),
    .io_in_bits_wflags(fpmu_io_in_bits_wflags),
    .io_in_bits_rm(fpmu_io_in_bits_rm),
    .io_in_bits_fmaCmd(fpmu_io_in_bits_fmaCmd),
    .io_in_bits_typ(fpmu_io_in_bits_typ),
    .io_in_bits_fmt(fpmu_io_in_bits_fmt),
    .io_in_bits_in1(fpmu_io_in_bits_in1),
    .io_in_bits_in2(fpmu_io_in_bits_in2),
    .io_in_bits_in3(fpmu_io_in_bits_in3),
    .io_in_bits_is_unicore(fpmu_io_in_bits_is_unicore),
    .io_in_bits_exc_enabled(fpmu_io_in_bits_exc_enabled),
    .io_in_bits_c(fpmu_io_in_bits_c),
    .io_in_bits_cond_unicore(fpmu_io_in_bits_cond_unicore),
    .io_out_valid(fpmu_io_out_valid),
    .io_out_bits_data(fpmu_io_out_bits_data),
    .io_out_bits_exc(fpmu_io_out_bits_exc),
    .io_out_bits_u_exception(fpmu_io_out_bits_u_exception),
    .io_out_bits_u_flag(fpmu_io_out_bits_u_flag),
    .io_out_bits_u_c(fpmu_io_out_bits_u_c),
    .io_lt(fpmu_io_lt)
  );
  IntToFP ifpu ( // @[fpu.scala 294:20]
    .clock(ifpu_clock),
    .reset(ifpu_reset),
    .io_in_valid(ifpu_io_in_valid),
    .io_in_bits_ldst(ifpu_io_in_bits_ldst),
    .io_in_bits_wen(ifpu_io_in_bits_wen),
    .io_in_bits_ren1(ifpu_io_in_bits_ren1),
    .io_in_bits_ren2(ifpu_io_in_bits_ren2),
    .io_in_bits_ren3(ifpu_io_in_bits_ren3),
    .io_in_bits_swap12(ifpu_io_in_bits_swap12),
    .io_in_bits_swap23(ifpu_io_in_bits_swap23),
    .io_in_bits_typeTagIn(ifpu_io_in_bits_typeTagIn),
    .io_in_bits_typeTagOut(ifpu_io_in_bits_typeTagOut),
    .io_in_bits_fromint(ifpu_io_in_bits_fromint),
    .io_in_bits_toint(ifpu_io_in_bits_toint),
    .io_in_bits_fastpipe(ifpu_io_in_bits_fastpipe),
    .io_in_bits_fma(ifpu_io_in_bits_fma),
    .io_in_bits_div(ifpu_io_in_bits_div),
    .io_in_bits_sqrt(ifpu_io_in_bits_sqrt),
    .io_in_bits_wflags(ifpu_io_in_bits_wflags),
    .io_in_bits_rm(ifpu_io_in_bits_rm),
    .io_in_bits_typ(ifpu_io_in_bits_typ),
    .io_in_bits_in1(ifpu_io_in_bits_in1),
    .io_in_bits_fmt(ifpu_io_in_bits_fmt),
    .io_in_bits_is_unicore(ifpu_io_in_bits_is_unicore),
    .io_in_bits_exc_enabled(ifpu_io_in_bits_exc_enabled),
    .io_in_bits_c(ifpu_io_in_bits_c),
    .io_out_valid(ifpu_io_out_valid),
    .io_out_bits_data(ifpu_io_out_bits_data),
    .io_out_bits_exc(ifpu_io_out_bits_exc),
    .io_out_bits_u_exception(ifpu_io_out_bits_u_exception),
    .io_out_bits_u_flag(ifpu_io_out_bits_u_flag),
    .io_out_bits_u_c(ifpu_io_out_bits_u_c)
  );
  assign io_resp_valid = _T_199 | ifpu_io_out_valid; // @[fpu.scala 304:38]
  assign io_resp_bits_uop_switch = outPipe_bits_5_switch; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_switch_off = outPipe_bits_5_switch_off; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_is_unicore = outPipe_bits_5_is_unicore; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_shift = outPipe_bits_5_shift; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_lrs3_rtype = outPipe_bits_5_lrs3_rtype; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_rflag = outPipe_bits_5_rflag; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_wflag = outPipe_bits_5_wflag; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_prflag = outPipe_bits_5_prflag; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_pwflag = outPipe_bits_5_pwflag; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_pflag_busy = outPipe_bits_5_pflag_busy; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_stale_pflag = outPipe_bits_5_stale_pflag; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_op1_sel = outPipe_bits_5_op1_sel; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_op2_sel = outPipe_bits_5_op2_sel; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_split_num = outPipe_bits_5_split_num; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_self_index = outPipe_bits_5_self_index; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_rob_inst_idx = outPipe_bits_5_rob_inst_idx; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_address_num = outPipe_bits_5_address_num; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_uopc = outPipe_bits_5_uopc; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_inst = outPipe_bits_5_inst; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_debug_inst = outPipe_bits_5_debug_inst; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_is_rvc = outPipe_bits_5_is_rvc; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_debug_pc = outPipe_bits_5_debug_pc; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_iq_type = outPipe_bits_5_iq_type; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_fu_code = outPipe_bits_5_fu_code; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ctrl_br_type = outPipe_bits_5_ctrl_br_type; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ctrl_op1_sel = outPipe_bits_5_ctrl_op1_sel; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ctrl_op2_sel = outPipe_bits_5_ctrl_op2_sel; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ctrl_imm_sel = outPipe_bits_5_ctrl_imm_sel; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ctrl_op_fcn = outPipe_bits_5_ctrl_op_fcn; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ctrl_fcn_dw = outPipe_bits_5_ctrl_fcn_dw; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ctrl_csr_cmd = outPipe_bits_5_ctrl_csr_cmd; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ctrl_is_load = outPipe_bits_5_ctrl_is_load; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ctrl_is_sta = outPipe_bits_5_ctrl_is_sta; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ctrl_is_std = outPipe_bits_5_ctrl_is_std; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ctrl_op3_sel = outPipe_bits_5_ctrl_op3_sel; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_iw_state = outPipe_bits_5_iw_state; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_iw_p1_poisoned = outPipe_bits_5_iw_p1_poisoned; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_iw_p2_poisoned = outPipe_bits_5_iw_p2_poisoned; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_is_br = outPipe_bits_5_is_br; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_is_jalr = outPipe_bits_5_is_jalr; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_is_jal = outPipe_bits_5_is_jal; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_is_sfb = outPipe_bits_5_is_sfb; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_br_mask = outPipe_bits_5_br_mask; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_br_tag = outPipe_bits_5_br_tag; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ftq_idx = outPipe_bits_5_ftq_idx; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_edge_inst = outPipe_bits_5_edge_inst; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_pc_lob = outPipe_bits_5_pc_lob; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_taken = outPipe_bits_5_taken; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_imm_packed = outPipe_bits_5_imm_packed; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_csr_addr = outPipe_bits_5_csr_addr; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_rob_idx = outPipe_bits_5_rob_idx; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ldq_idx = outPipe_bits_5_ldq_idx; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_stq_idx = outPipe_bits_5_stq_idx; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_rxq_idx = outPipe_bits_5_rxq_idx; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_pdst = outPipe_bits_5_pdst; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_prs1 = outPipe_bits_5_prs1; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_prs2 = outPipe_bits_5_prs2; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_prs3 = outPipe_bits_5_prs3; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ppred = outPipe_bits_5_ppred; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_prs1_busy = outPipe_bits_5_prs1_busy; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_prs2_busy = outPipe_bits_5_prs2_busy; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_prs3_busy = outPipe_bits_5_prs3_busy; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ppred_busy = outPipe_bits_5_ppred_busy; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_stale_pdst = outPipe_bits_5_stale_pdst; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_exception = outPipe_bits_5_exception; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_exc_cause = outPipe_bits_5_exc_cause; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_bypassable = outPipe_bits_5_bypassable; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_mem_cmd = outPipe_bits_5_mem_cmd; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_mem_size = outPipe_bits_5_mem_size; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_mem_signed = outPipe_bits_5_mem_signed; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_is_fence = outPipe_bits_5_is_fence; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_is_fencei = outPipe_bits_5_is_fencei; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_is_amo = outPipe_bits_5_is_amo; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_uses_ldq = outPipe_bits_5_uses_ldq; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_uses_stq = outPipe_bits_5_uses_stq; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_is_sys_pc2epc = outPipe_bits_5_is_sys_pc2epc; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_is_unique = outPipe_bits_5_is_unique; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_flush_on_commit = outPipe_bits_5_flush_on_commit; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ldst_is_rs1 = outPipe_bits_5_ldst_is_rs1; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ldst = outPipe_bits_5_ldst; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_lrs1 = outPipe_bits_5_lrs1; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_lrs2 = outPipe_bits_5_lrs2; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_lrs3 = outPipe_bits_5_lrs3; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_ldst_val = outPipe_bits_5_ldst_val; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_dst_rtype = outPipe_bits_5_dst_rtype; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_lrs1_rtype = outPipe_bits_5_lrs1_rtype; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_lrs2_rtype = outPipe_bits_5_lrs2_rtype; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_frs3_en = outPipe_bits_5_frs3_en; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_fp_val = outPipe_bits_5_fp_val; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_fp_single = outPipe_bits_5_fp_single; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_xcpt_pf_if = outPipe_bits_5_xcpt_pf_if; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_xcpt_ae_if = outPipe_bits_5_xcpt_ae_if; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_xcpt_ma_if = outPipe_bits_5_xcpt_ma_if; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_bp_debug_if = outPipe_bits_5_bp_debug_if; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_bp_xcpt_if = outPipe_bits_5_bp_xcpt_if; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_debug_fsrc = outPipe_bits_5_debug_fsrc; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_uop_debug_tsrc = outPipe_bits_5_debug_tsrc; // @[Valid.scala 112:21 Valid.scala 114:16]
  assign io_resp_bits_data = outPipe_bits_5_is_unicore & (outPipe_bits_5_uopc == 7'h7f | outPipe_bits_5_uopc == 7'h7a |
    outPipe_bits_5_uopc == 7'h7b) & outPipe_bits_2[29] != outPipe_bits_5_imm_packed[19] ? outPipe_bits_8 : _T_222; // @[fpu.scala 309:8]
  assign io_resp_bits_predicated = 1'h0;
  assign io_resp_bits_fflags_valid = io_resp_valid & ~outPipe_bits_5_is_unicore; // @[fpu.scala 342:51]
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
  assign io_resp_bits_fflags_bits_flags = dfma_io_out_valid ? dfma_io_out_bits_exc : _T_225; // @[fpu.scala 318:8]
  assign io_resp_bits_flagdata = 4'h0;
  assign io_resp_bits_fflagdata_valid = io_resp_valid & outPipe_bits_5_is_unicore; // @[fpu.scala 346:58]
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
  assign io_resp_bits_fflagdata_bits_fflag = {hi_12,lo_12}; // @[Cat.scala 30:58]
  assign fp_decoder_clock = clock;
  assign fp_decoder_reset = reset;
  assign fp_decoder_io_uopc = io_req_bits_uop_uopc; // @[fpu.scala 191:22]
  assign dfma_clock = clock;
  assign dfma_reset = reset;
  assign dfma_io_in_valid = io_req_valid & fp_decoder_io_sigs_fma & fp_decoder_io_sigs_typeTagOut == 2'h1; // @[fpu.scala 266:51]
  assign dfma_io_in_bits_ldst = fp_decoder_io_sigs_ldst; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_wen = fp_decoder_io_sigs_wen; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_ren1 = fp_decoder_io_sigs_ren1; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_ren2 = fp_decoder_io_sigs_ren2; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_ren3 = fp_decoder_io_sigs_ren3; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_swap12 = fp_decoder_io_sigs_swap12; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_swap23 = fp_decoder_io_sigs_swap23; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_typeTagIn = fp_decoder_io_sigs_typeTagIn; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_typeTagOut = fp_decoder_io_sigs_typeTagOut; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_fromint = fp_decoder_io_sigs_fromint; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_toint = fp_decoder_io_sigs_toint; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_fastpipe = fp_decoder_io_sigs_fastpipe; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_fma = fp_decoder_io_sigs_fma; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_div = fp_decoder_io_sigs_div; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_sqrt = fp_decoder_io_sigs_sqrt; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_wflags = fp_decoder_io_sigs_wflags; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign dfma_io_in_bits_rm = io_req_bits_uop_is_unicore ? _T_27 : _T_31; // @[fpu.scala 195:18]
  assign dfma_io_in_bits_fmaCmd = FMADecoder_io_cmd; // @[fpu.scala 201:19 fpu.scala 230:16]
  assign dfma_io_in_bits_typ = io_req_bits_uop_is_unicore ? 2'h0 : io_req_bits_uop_imm_packed[9:8]; // @[fpu.scala 222:19]
  assign dfma_io_in_bits_fmt = {{1'd0}, _GEN_397}; // @[fpu.scala 201:19]
  assign dfma_io_in_bits_in1 = io_req_bits_uop_is_unicore & _T_52 ? io_req_bits_rs2_data : io_req_bits_rs1_data; // @[fpu.scala 213:23]
  assign dfma_io_in_bits_in2 = io_req_bits_rs2_data; // @[FPU.scala 379:26]
  assign dfma_io_in_bits_in3 = fp_decoder_io_sigs_swap23 ? io_req_bits_rs2_data : io_req_bits_rs3_data; // @[fpu.scala 221:27 fpu.scala 221:37 fpu.scala 219:13]
  assign dfma_io_in_bits_is_unicore = io_req_bits_uop_is_unicore; // @[fpu.scala 201:19 fpu.scala 208:20]
  assign dfma_io_in_bits_exc_enabled = io_req_bits_uop_is_unicore ? io_req_bits_fflagdata[16:10] : 7'h7f; // @[fpu.scala 206:27]
  assign dfma_io_in_bits_c = io_req_bits_uop_is_unicore & io_req_bits_fflagdata[29]; // @[fpu.scala 207:17]
  assign dfma_io_in_bits_cond_unicore = io_req_bits_uop_imm_packed[9:6]; // @[util.scala 360:60]
  assign FMADecoder_clock = clock;
  assign FMADecoder_reset = reset;
  assign FMADecoder_io_uopc = io_req_bits_uop_uopc; // @[fpu.scala 229:25]
  assign sfma_clock = clock;
  assign sfma_reset = reset;
  assign sfma_io_in_valid = _T_32 & fp_decoder_io_sigs_typeTagOut == 2'h0; // @[fpu.scala 270:51]
  assign sfma_io_in_bits_ldst = fp_decoder_io_sigs_ldst; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_wen = fp_decoder_io_sigs_wen; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_ren1 = fp_decoder_io_sigs_ren1; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_ren2 = fp_decoder_io_sigs_ren2; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_ren3 = fp_decoder_io_sigs_ren3; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_swap12 = fp_decoder_io_sigs_swap12; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_swap23 = fp_decoder_io_sigs_swap23; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_typeTagIn = fp_decoder_io_sigs_typeTagIn; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_typeTagOut = fp_decoder_io_sigs_typeTagOut; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_fromint = fp_decoder_io_sigs_fromint; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_toint = fp_decoder_io_sigs_toint; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_fastpipe = fp_decoder_io_sigs_fastpipe; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_fma = fp_decoder_io_sigs_fma; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_div = fp_decoder_io_sigs_div; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_sqrt = fp_decoder_io_sigs_sqrt; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_wflags = fp_decoder_io_sigs_wflags; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign sfma_io_in_bits_rm = io_req_bits_uop_is_unicore ? _T_27 : _T_31; // @[fpu.scala 195:18]
  assign sfma_io_in_bits_fmaCmd = FMADecoder_1_io_cmd; // @[fpu.scala 201:19 fpu.scala 230:16]
  assign sfma_io_in_bits_typ = io_req_bits_uop_is_unicore ? 2'h0 : io_req_bits_uop_imm_packed[9:8]; // @[fpu.scala 222:19]
  assign sfma_io_in_bits_fmt = {{1'd0}, _GEN_397}; // @[fpu.scala 201:19]
  assign sfma_io_in_bits_in1 = {{32'd0}, _T_94}; // @[fpu.scala 201:19 fpu.scala 217:13]
  assign sfma_io_in_bits_in2 = {{32'd0}, _T_96}; // @[fpu.scala 201:19 fpu.scala 218:13]
  assign sfma_io_in_bits_in3 = fp_decoder_io_sigs_swap23 ? _WIRE_1_in2 : {{32'd0}, _T_98}; // @[fpu.scala 221:27 fpu.scala 221:37 fpu.scala 219:13]
  assign sfma_io_in_bits_is_unicore = io_req_bits_uop_is_unicore; // @[fpu.scala 201:19 fpu.scala 208:20]
  assign sfma_io_in_bits_exc_enabled = io_req_bits_uop_is_unicore ? io_req_bits_fflagdata[16:10] : 7'h7f; // @[fpu.scala 206:27]
  assign sfma_io_in_bits_c = io_req_bits_uop_is_unicore & io_req_bits_fflagdata[29]; // @[fpu.scala 207:17]
  assign sfma_io_in_bits_cond_unicore = io_req_bits_uop_imm_packed[9:6]; // @[util.scala 360:60]
  assign FMADecoder_1_clock = clock;
  assign FMADecoder_1_reset = reset;
  assign FMADecoder_1_io_uopc = io_req_bits_uop_uopc; // @[fpu.scala 229:25]
  assign fpiu_clock = clock;
  assign fpiu_reset = reset;
  assign fpiu_io_in_valid = io_req_valid & (fp_decoder_io_sigs_toint | fp_decoder_io_sigs_fastpipe &
    fp_decoder_io_sigs_wflags); // @[fpu.scala 274:36]
  assign fpiu_io_in_bits_ldst = fp_decoder_io_sigs_ldst; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_wen = fp_decoder_io_sigs_wen; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_ren1 = fp_decoder_io_sigs_ren1; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_ren2 = fp_decoder_io_sigs_ren2; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_ren3 = fp_decoder_io_sigs_ren3; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_swap12 = fp_decoder_io_sigs_swap12; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_swap23 = fp_decoder_io_sigs_swap23; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_typeTagIn = fp_decoder_io_sigs_typeTagIn; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_typeTagOut = fp_decoder_io_sigs_typeTagOut; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_fromint = fp_decoder_io_sigs_fromint; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_toint = fp_decoder_io_sigs_toint; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_fastpipe = fp_decoder_io_sigs_fastpipe; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_fma = fp_decoder_io_sigs_fma; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_div = fp_decoder_io_sigs_div; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_sqrt = fp_decoder_io_sigs_sqrt; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_wflags = fp_decoder_io_sigs_wflags; // @[fpu.scala 201:19 fpu.scala 203:9]
  assign fpiu_io_in_bits_rm = io_req_bits_uop_is_unicore ? _T_27 : _T_31; // @[fpu.scala 195:18]
  assign fpiu_io_in_bits_fmaCmd = FMADecoder_2_io_cmd; // @[fpu.scala 201:19 fpu.scala 230:16]
  assign fpiu_io_in_bits_typ = io_req_bits_uop_is_unicore ? 2'h0 : io_req_bits_uop_imm_packed[9:8]; // @[fpu.scala 222:19]
  assign fpiu_io_in_bits_fmt = {{1'd0}, _GEN_397}; // @[fpu.scala 201:19]
  assign fpiu_io_in_bits_in1 = _T_132 ? _T_134 : 65'he008000000000000; // @[FPU.scala 376:10]
  assign fpiu_io_in_bits_in2 = _T_137 ? _T_139 : 65'he008000000000000; // @[FPU.scala 376:10]
  assign fpiu_io_in_bits_in3 = fp_decoder_io_sigs_swap23 ? _T_140 : _T_145; // @[fpu.scala 221:27 fpu.scala 221:37 fpu.scala 219:13]
  assign fpiu_io_in_bits_is_unicore = io_req_bits_uop_is_unicore; // @[fpu.scala 201:19 fpu.scala 208:20]
  assign fpiu_io_in_bits_exc_enabled = io_req_bits_uop_is_unicore ? io_req_bits_fflagdata[16:10] : 7'h7f; // @[fpu.scala 206:27]
  assign fpiu_io_in_bits_c = io_req_bits_uop_is_unicore & io_req_bits_fflagdata[29]; // @[fpu.scala 207:17]
  assign fpiu_io_in_bits_cond_unicore = io_req_bits_uop_imm_packed[9:6]; // @[util.scala 360:60]
  assign FMADecoder_2_clock = clock;
  assign FMADecoder_2_reset = reset;
  assign FMADecoder_2_io_uopc = io_req_bits_uop_uopc; // @[fpu.scala 229:25]
  assign fpmu_clock = clock;
  assign fpmu_reset = reset;
  assign fpmu_io_in_valid = io_req_valid & fp_decoder_io_sigs_fastpipe; // @[fpu.scala 289:36]
  assign fpmu_io_in_bits_ldst = fpiu_io_in_bits_ldst; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_wen = fpiu_io_in_bits_wen; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_ren1 = fpiu_io_in_bits_ren1; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_ren2 = fpiu_io_in_bits_ren2; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_ren3 = fpiu_io_in_bits_ren3; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_swap12 = fpiu_io_in_bits_swap12; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_swap23 = fpiu_io_in_bits_swap23; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_typeTagIn = fpiu_io_in_bits_typeTagIn; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_typeTagOut = fpiu_io_in_bits_typeTagOut; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_fromint = fpiu_io_in_bits_fromint; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_toint = fpiu_io_in_bits_toint; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_fastpipe = fpiu_io_in_bits_fastpipe; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_fma = fpiu_io_in_bits_fma; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_div = fpiu_io_in_bits_div; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_sqrt = fpiu_io_in_bits_sqrt; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_wflags = fpiu_io_in_bits_wflags; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_rm = fpiu_io_in_bits_rm; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_fmaCmd = fpiu_io_in_bits_fmaCmd; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_typ = fpiu_io_in_bits_typ; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_fmt = fpiu_io_in_bits_fmt; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_in1 = fpiu_io_in_bits_in1; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_in2 = fpiu_io_in_bits_in2; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_in3 = fpiu_io_in_bits_in3; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_is_unicore = fpiu_io_in_bits_is_unicore; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_exc_enabled = fpiu_io_in_bits_exc_enabled; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_c = fpiu_io_in_bits_c; // @[fpu.scala 290:19]
  assign fpmu_io_in_bits_cond_unicore = fpiu_io_in_bits_cond_unicore; // @[fpu.scala 290:19]
  assign fpmu_io_lt = fpiu_io_out_bits_lt; // @[fpu.scala 291:14]
  assign ifpu_clock = clock;
  assign ifpu_reset = reset;
  assign ifpu_io_in_valid = io_req_valid & fp_decoder_io_sigs_fromint; // @[fpu.scala 295:36]
  assign ifpu_io_in_bits_ldst = fpiu_io_in_bits_ldst; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_wen = fpiu_io_in_bits_wen; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_ren1 = fpiu_io_in_bits_ren1; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_ren2 = fpiu_io_in_bits_ren2; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_ren3 = fpiu_io_in_bits_ren3; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_swap12 = fpiu_io_in_bits_swap12; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_swap23 = fpiu_io_in_bits_swap23; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_typeTagIn = fpiu_io_in_bits_typeTagIn; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_typeTagOut = fpiu_io_in_bits_typeTagOut; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_fromint = fpiu_io_in_bits_fromint; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_toint = fpiu_io_in_bits_toint; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_fastpipe = fpiu_io_in_bits_fastpipe; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_fma = fpiu_io_in_bits_fma; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_div = fpiu_io_in_bits_div; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_sqrt = fpiu_io_in_bits_sqrt; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_wflags = fpiu_io_in_bits_wflags; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_rm = fpiu_io_in_bits_rm; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_typ = fpiu_io_in_bits_typ; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_in1 = {hi_11,lo_11}; // @[Cat.scala 30:58]
  assign ifpu_io_in_bits_fmt = fpiu_io_in_bits_fmt; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_is_unicore = fpiu_io_in_bits_is_unicore; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_exc_enabled = fpiu_io_in_bits_exc_enabled; // @[fpu.scala 296:19]
  assign ifpu_io_in_bits_c = fpiu_io_in_bits_c; // @[fpu.scala 296:19]
  always @(posedge clock) begin
    if (reset) begin // @[Valid.scala 117:22]
      v <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      v <= io_req_valid; // @[Valid.scala 117:22]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b <= io_req_bits_fflagdata; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid <= v; // @[Valid.scala 117:22]
    end
    if (v) begin // @[Reg.scala 16:19]
      outPipe_bits <= b; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid_1 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid_1 <= outPipe_valid; // @[Valid.scala 117:22]
    end
    if (outPipe_valid) begin // @[Reg.scala 16:19]
      outPipe_bits_1 <= outPipe_bits; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_1) begin // @[Reg.scala 16:19]
      outPipe_bits_2 <= outPipe_bits_1; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      v_1 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      v_1 <= io_req_valid; // @[Valid.scala 117:22]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_switch <= io_req_bits_uop_switch; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_switch_off <= io_req_bits_uop_switch_off; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_is_unicore <= io_req_bits_uop_is_unicore; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_shift <= io_req_bits_uop_shift; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_lrs3_rtype <= io_req_bits_uop_lrs3_rtype; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_rflag <= io_req_bits_uop_rflag; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_wflag <= io_req_bits_uop_wflag; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_prflag <= io_req_bits_uop_prflag; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_pwflag <= io_req_bits_uop_pwflag; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_pflag_busy <= io_req_bits_uop_pflag_busy; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_stale_pflag <= io_req_bits_uop_stale_pflag; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_op1_sel <= io_req_bits_uop_op1_sel; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_op2_sel <= io_req_bits_uop_op2_sel; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_split_num <= io_req_bits_uop_split_num; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_self_index <= io_req_bits_uop_self_index; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_rob_inst_idx <= io_req_bits_uop_rob_inst_idx; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_address_num <= io_req_bits_uop_address_num; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_uopc <= io_req_bits_uop_uopc; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_inst <= io_req_bits_uop_inst; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_debug_inst <= io_req_bits_uop_debug_inst; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_is_rvc <= io_req_bits_uop_is_rvc; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_debug_pc <= io_req_bits_uop_debug_pc; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_iq_type <= io_req_bits_uop_iq_type; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_fu_code <= io_req_bits_uop_fu_code; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ctrl_br_type <= io_req_bits_uop_ctrl_br_type; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ctrl_op1_sel <= io_req_bits_uop_ctrl_op1_sel; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ctrl_op2_sel <= io_req_bits_uop_ctrl_op2_sel; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ctrl_imm_sel <= io_req_bits_uop_ctrl_imm_sel; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ctrl_op_fcn <= io_req_bits_uop_ctrl_op_fcn; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ctrl_fcn_dw <= io_req_bits_uop_ctrl_fcn_dw; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ctrl_csr_cmd <= io_req_bits_uop_ctrl_csr_cmd; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ctrl_is_load <= io_req_bits_uop_ctrl_is_load; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ctrl_is_sta <= io_req_bits_uop_ctrl_is_sta; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ctrl_is_std <= io_req_bits_uop_ctrl_is_std; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ctrl_op3_sel <= io_req_bits_uop_ctrl_op3_sel; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_iw_state <= io_req_bits_uop_iw_state; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_iw_p1_poisoned <= io_req_bits_uop_iw_p1_poisoned; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_iw_p2_poisoned <= io_req_bits_uop_iw_p2_poisoned; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_is_br <= io_req_bits_uop_is_br; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_is_jalr <= io_req_bits_uop_is_jalr; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_is_jal <= io_req_bits_uop_is_jal; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_is_sfb <= io_req_bits_uop_is_sfb; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_br_mask <= io_req_bits_uop_br_mask; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_br_tag <= io_req_bits_uop_br_tag; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ftq_idx <= io_req_bits_uop_ftq_idx; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_edge_inst <= io_req_bits_uop_edge_inst; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_pc_lob <= io_req_bits_uop_pc_lob; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_taken <= io_req_bits_uop_taken; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_imm_packed <= io_req_bits_uop_imm_packed; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_csr_addr <= io_req_bits_uop_csr_addr; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_rob_idx <= io_req_bits_uop_rob_idx; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ldq_idx <= io_req_bits_uop_ldq_idx; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_stq_idx <= io_req_bits_uop_stq_idx; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_rxq_idx <= io_req_bits_uop_rxq_idx; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_pdst <= io_req_bits_uop_pdst; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_prs1 <= io_req_bits_uop_prs1; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_prs2 <= io_req_bits_uop_prs2; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_prs3 <= io_req_bits_uop_prs3; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ppred <= io_req_bits_uop_ppred; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_prs1_busy <= io_req_bits_uop_prs1_busy; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_prs2_busy <= io_req_bits_uop_prs2_busy; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_prs3_busy <= io_req_bits_uop_prs3_busy; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ppred_busy <= io_req_bits_uop_ppred_busy; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_stale_pdst <= io_req_bits_uop_stale_pdst; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_exception <= io_req_bits_uop_exception; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_exc_cause <= io_req_bits_uop_exc_cause; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_bypassable <= io_req_bits_uop_bypassable; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_mem_cmd <= io_req_bits_uop_mem_cmd; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_mem_size <= io_req_bits_uop_mem_size; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_mem_signed <= io_req_bits_uop_mem_signed; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_is_fence <= io_req_bits_uop_is_fence; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_is_fencei <= io_req_bits_uop_is_fencei; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_is_amo <= io_req_bits_uop_is_amo; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_uses_ldq <= io_req_bits_uop_uses_ldq; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_uses_stq <= io_req_bits_uop_uses_stq; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_is_sys_pc2epc <= io_req_bits_uop_is_sys_pc2epc; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_is_unique <= io_req_bits_uop_is_unique; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_flush_on_commit <= io_req_bits_uop_flush_on_commit; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ldst_is_rs1 <= io_req_bits_uop_ldst_is_rs1; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ldst <= io_req_bits_uop_ldst; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_lrs1 <= io_req_bits_uop_lrs1; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_lrs2 <= io_req_bits_uop_lrs2; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_lrs3 <= io_req_bits_uop_lrs3; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_ldst_val <= io_req_bits_uop_ldst_val; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_dst_rtype <= io_req_bits_uop_dst_rtype; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_lrs1_rtype <= io_req_bits_uop_lrs1_rtype; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_lrs2_rtype <= io_req_bits_uop_lrs2_rtype; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_frs3_en <= io_req_bits_uop_frs3_en; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_fp_val <= io_req_bits_uop_fp_val; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_fp_single <= io_req_bits_uop_fp_single; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_xcpt_pf_if <= io_req_bits_uop_xcpt_pf_if; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_xcpt_ae_if <= io_req_bits_uop_xcpt_ae_if; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_xcpt_ma_if <= io_req_bits_uop_xcpt_ma_if; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_bp_debug_if <= io_req_bits_uop_bp_debug_if; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_bp_xcpt_if <= io_req_bits_uop_bp_xcpt_if; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_debug_fsrc <= io_req_bits_uop_debug_fsrc; // @[Reg.scala 16:23]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_1_debug_tsrc <= io_req_bits_uop_debug_tsrc; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid_3 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid_3 <= v_1; // @[Valid.scala 117:22]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_switch <= b_1_switch; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_switch_off <= b_1_switch_off; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_is_unicore <= b_1_is_unicore; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_shift <= b_1_shift; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_lrs3_rtype <= b_1_lrs3_rtype; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_rflag <= b_1_rflag; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_wflag <= b_1_wflag; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_prflag <= b_1_prflag; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_pwflag <= b_1_pwflag; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_pflag_busy <= b_1_pflag_busy; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_stale_pflag <= b_1_stale_pflag; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_op1_sel <= b_1_op1_sel; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_op2_sel <= b_1_op2_sel; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_split_num <= b_1_split_num; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_self_index <= b_1_self_index; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_rob_inst_idx <= b_1_rob_inst_idx; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_address_num <= b_1_address_num; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_uopc <= b_1_uopc; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_inst <= b_1_inst; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_debug_inst <= b_1_debug_inst; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_is_rvc <= b_1_is_rvc; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_debug_pc <= b_1_debug_pc; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_iq_type <= b_1_iq_type; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_fu_code <= b_1_fu_code; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ctrl_br_type <= b_1_ctrl_br_type; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ctrl_op1_sel <= b_1_ctrl_op1_sel; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ctrl_op2_sel <= b_1_ctrl_op2_sel; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ctrl_imm_sel <= b_1_ctrl_imm_sel; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ctrl_op_fcn <= b_1_ctrl_op_fcn; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ctrl_fcn_dw <= b_1_ctrl_fcn_dw; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ctrl_csr_cmd <= b_1_ctrl_csr_cmd; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ctrl_is_load <= b_1_ctrl_is_load; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ctrl_is_sta <= b_1_ctrl_is_sta; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ctrl_is_std <= b_1_ctrl_is_std; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ctrl_op3_sel <= b_1_ctrl_op3_sel; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_iw_state <= b_1_iw_state; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_iw_p1_poisoned <= b_1_iw_p1_poisoned; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_iw_p2_poisoned <= b_1_iw_p2_poisoned; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_is_br <= b_1_is_br; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_is_jalr <= b_1_is_jalr; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_is_jal <= b_1_is_jal; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_is_sfb <= b_1_is_sfb; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_br_mask <= b_1_br_mask; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_br_tag <= b_1_br_tag; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ftq_idx <= b_1_ftq_idx; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_edge_inst <= b_1_edge_inst; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_pc_lob <= b_1_pc_lob; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_taken <= b_1_taken; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_imm_packed <= b_1_imm_packed; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_csr_addr <= b_1_csr_addr; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_rob_idx <= b_1_rob_idx; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ldq_idx <= b_1_ldq_idx; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_stq_idx <= b_1_stq_idx; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_rxq_idx <= b_1_rxq_idx; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_pdst <= b_1_pdst; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_prs1 <= b_1_prs1; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_prs2 <= b_1_prs2; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_prs3 <= b_1_prs3; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ppred <= b_1_ppred; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_prs1_busy <= b_1_prs1_busy; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_prs2_busy <= b_1_prs2_busy; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_prs3_busy <= b_1_prs3_busy; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ppred_busy <= b_1_ppred_busy; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_stale_pdst <= b_1_stale_pdst; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_exception <= b_1_exception; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_exc_cause <= b_1_exc_cause; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_bypassable <= b_1_bypassable; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_mem_cmd <= b_1_mem_cmd; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_mem_size <= b_1_mem_size; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_mem_signed <= b_1_mem_signed; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_is_fence <= b_1_is_fence; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_is_fencei <= b_1_is_fencei; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_is_amo <= b_1_is_amo; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_uses_ldq <= b_1_uses_ldq; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_uses_stq <= b_1_uses_stq; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_is_sys_pc2epc <= b_1_is_sys_pc2epc; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_is_unique <= b_1_is_unique; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_flush_on_commit <= b_1_flush_on_commit; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ldst_is_rs1 <= b_1_ldst_is_rs1; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ldst <= b_1_ldst; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_lrs1 <= b_1_lrs1; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_lrs2 <= b_1_lrs2; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_lrs3 <= b_1_lrs3; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_ldst_val <= b_1_ldst_val; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_dst_rtype <= b_1_dst_rtype; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_lrs1_rtype <= b_1_lrs1_rtype; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_lrs2_rtype <= b_1_lrs2_rtype; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_frs3_en <= b_1_frs3_en; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_fp_val <= b_1_fp_val; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_fp_single <= b_1_fp_single; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_xcpt_pf_if <= b_1_xcpt_pf_if; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_xcpt_ae_if <= b_1_xcpt_ae_if; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_xcpt_ma_if <= b_1_xcpt_ma_if; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_bp_debug_if <= b_1_bp_debug_if; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_bp_xcpt_if <= b_1_bp_xcpt_if; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_debug_fsrc <= b_1_debug_fsrc; // @[Reg.scala 16:23]
    end
    if (v_1) begin // @[Reg.scala 16:19]
      outPipe_bits_3_debug_tsrc <= b_1_debug_tsrc; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid_4 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid_4 <= outPipe_valid_3; // @[Valid.scala 117:22]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_switch <= outPipe_bits_3_switch; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_switch_off <= outPipe_bits_3_switch_off; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_is_unicore <= outPipe_bits_3_is_unicore; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_shift <= outPipe_bits_3_shift; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_lrs3_rtype <= outPipe_bits_3_lrs3_rtype; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_rflag <= outPipe_bits_3_rflag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_wflag <= outPipe_bits_3_wflag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_prflag <= outPipe_bits_3_prflag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_pwflag <= outPipe_bits_3_pwflag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_pflag_busy <= outPipe_bits_3_pflag_busy; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_stale_pflag <= outPipe_bits_3_stale_pflag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_op1_sel <= outPipe_bits_3_op1_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_op2_sel <= outPipe_bits_3_op2_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_split_num <= outPipe_bits_3_split_num; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_self_index <= outPipe_bits_3_self_index; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_rob_inst_idx <= outPipe_bits_3_rob_inst_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_address_num <= outPipe_bits_3_address_num; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_uopc <= outPipe_bits_3_uopc; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_inst <= outPipe_bits_3_inst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_debug_inst <= outPipe_bits_3_debug_inst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_is_rvc <= outPipe_bits_3_is_rvc; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_debug_pc <= outPipe_bits_3_debug_pc; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_iq_type <= outPipe_bits_3_iq_type; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_fu_code <= outPipe_bits_3_fu_code; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ctrl_br_type <= outPipe_bits_3_ctrl_br_type; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ctrl_op1_sel <= outPipe_bits_3_ctrl_op1_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ctrl_op2_sel <= outPipe_bits_3_ctrl_op2_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ctrl_imm_sel <= outPipe_bits_3_ctrl_imm_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ctrl_op_fcn <= outPipe_bits_3_ctrl_op_fcn; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ctrl_fcn_dw <= outPipe_bits_3_ctrl_fcn_dw; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ctrl_csr_cmd <= outPipe_bits_3_ctrl_csr_cmd; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ctrl_is_load <= outPipe_bits_3_ctrl_is_load; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ctrl_is_sta <= outPipe_bits_3_ctrl_is_sta; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ctrl_is_std <= outPipe_bits_3_ctrl_is_std; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ctrl_op3_sel <= outPipe_bits_3_ctrl_op3_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_iw_state <= outPipe_bits_3_iw_state; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_iw_p1_poisoned <= outPipe_bits_3_iw_p1_poisoned; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_iw_p2_poisoned <= outPipe_bits_3_iw_p2_poisoned; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_is_br <= outPipe_bits_3_is_br; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_is_jalr <= outPipe_bits_3_is_jalr; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_is_jal <= outPipe_bits_3_is_jal; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_is_sfb <= outPipe_bits_3_is_sfb; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_br_mask <= outPipe_bits_3_br_mask; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_br_tag <= outPipe_bits_3_br_tag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ftq_idx <= outPipe_bits_3_ftq_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_edge_inst <= outPipe_bits_3_edge_inst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_pc_lob <= outPipe_bits_3_pc_lob; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_taken <= outPipe_bits_3_taken; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_imm_packed <= outPipe_bits_3_imm_packed; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_csr_addr <= outPipe_bits_3_csr_addr; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_rob_idx <= outPipe_bits_3_rob_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ldq_idx <= outPipe_bits_3_ldq_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_stq_idx <= outPipe_bits_3_stq_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_rxq_idx <= outPipe_bits_3_rxq_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_pdst <= outPipe_bits_3_pdst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_prs1 <= outPipe_bits_3_prs1; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_prs2 <= outPipe_bits_3_prs2; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_prs3 <= outPipe_bits_3_prs3; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ppred <= outPipe_bits_3_ppred; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_prs1_busy <= outPipe_bits_3_prs1_busy; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_prs2_busy <= outPipe_bits_3_prs2_busy; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_prs3_busy <= outPipe_bits_3_prs3_busy; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ppred_busy <= outPipe_bits_3_ppred_busy; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_stale_pdst <= outPipe_bits_3_stale_pdst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_exception <= outPipe_bits_3_exception; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_exc_cause <= outPipe_bits_3_exc_cause; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_bypassable <= outPipe_bits_3_bypassable; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_mem_cmd <= outPipe_bits_3_mem_cmd; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_mem_size <= outPipe_bits_3_mem_size; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_mem_signed <= outPipe_bits_3_mem_signed; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_is_fence <= outPipe_bits_3_is_fence; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_is_fencei <= outPipe_bits_3_is_fencei; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_is_amo <= outPipe_bits_3_is_amo; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_uses_ldq <= outPipe_bits_3_uses_ldq; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_uses_stq <= outPipe_bits_3_uses_stq; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_is_sys_pc2epc <= outPipe_bits_3_is_sys_pc2epc; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_is_unique <= outPipe_bits_3_is_unique; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_flush_on_commit <= outPipe_bits_3_flush_on_commit; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ldst_is_rs1 <= outPipe_bits_3_ldst_is_rs1; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ldst <= outPipe_bits_3_ldst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_lrs1 <= outPipe_bits_3_lrs1; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_lrs2 <= outPipe_bits_3_lrs2; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_lrs3 <= outPipe_bits_3_lrs3; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_ldst_val <= outPipe_bits_3_ldst_val; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_dst_rtype <= outPipe_bits_3_dst_rtype; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_lrs1_rtype <= outPipe_bits_3_lrs1_rtype; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_lrs2_rtype <= outPipe_bits_3_lrs2_rtype; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_frs3_en <= outPipe_bits_3_frs3_en; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_fp_val <= outPipe_bits_3_fp_val; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_fp_single <= outPipe_bits_3_fp_single; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_xcpt_pf_if <= outPipe_bits_3_xcpt_pf_if; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_xcpt_ae_if <= outPipe_bits_3_xcpt_ae_if; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_xcpt_ma_if <= outPipe_bits_3_xcpt_ma_if; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_bp_debug_if <= outPipe_bits_3_bp_debug_if; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_bp_xcpt_if <= outPipe_bits_3_bp_xcpt_if; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_debug_fsrc <= outPipe_bits_3_debug_fsrc; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_3) begin // @[Reg.scala 16:19]
      outPipe_bits_4_debug_tsrc <= outPipe_bits_3_debug_tsrc; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_switch <= outPipe_bits_4_switch; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_switch_off <= outPipe_bits_4_switch_off; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_is_unicore <= outPipe_bits_4_is_unicore; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_shift <= outPipe_bits_4_shift; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_lrs3_rtype <= outPipe_bits_4_lrs3_rtype; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_rflag <= outPipe_bits_4_rflag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_wflag <= outPipe_bits_4_wflag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_prflag <= outPipe_bits_4_prflag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_pwflag <= outPipe_bits_4_pwflag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_pflag_busy <= outPipe_bits_4_pflag_busy; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_stale_pflag <= outPipe_bits_4_stale_pflag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_op1_sel <= outPipe_bits_4_op1_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_op2_sel <= outPipe_bits_4_op2_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_split_num <= outPipe_bits_4_split_num; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_self_index <= outPipe_bits_4_self_index; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_rob_inst_idx <= outPipe_bits_4_rob_inst_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_address_num <= outPipe_bits_4_address_num; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_uopc <= outPipe_bits_4_uopc; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_inst <= outPipe_bits_4_inst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_debug_inst <= outPipe_bits_4_debug_inst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_is_rvc <= outPipe_bits_4_is_rvc; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_debug_pc <= outPipe_bits_4_debug_pc; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_iq_type <= outPipe_bits_4_iq_type; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_fu_code <= outPipe_bits_4_fu_code; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ctrl_br_type <= outPipe_bits_4_ctrl_br_type; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ctrl_op1_sel <= outPipe_bits_4_ctrl_op1_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ctrl_op2_sel <= outPipe_bits_4_ctrl_op2_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ctrl_imm_sel <= outPipe_bits_4_ctrl_imm_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ctrl_op_fcn <= outPipe_bits_4_ctrl_op_fcn; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ctrl_fcn_dw <= outPipe_bits_4_ctrl_fcn_dw; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ctrl_csr_cmd <= outPipe_bits_4_ctrl_csr_cmd; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ctrl_is_load <= outPipe_bits_4_ctrl_is_load; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ctrl_is_sta <= outPipe_bits_4_ctrl_is_sta; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ctrl_is_std <= outPipe_bits_4_ctrl_is_std; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ctrl_op3_sel <= outPipe_bits_4_ctrl_op3_sel; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_iw_state <= outPipe_bits_4_iw_state; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_iw_p1_poisoned <= outPipe_bits_4_iw_p1_poisoned; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_iw_p2_poisoned <= outPipe_bits_4_iw_p2_poisoned; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_is_br <= outPipe_bits_4_is_br; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_is_jalr <= outPipe_bits_4_is_jalr; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_is_jal <= outPipe_bits_4_is_jal; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_is_sfb <= outPipe_bits_4_is_sfb; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_br_mask <= outPipe_bits_4_br_mask; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_br_tag <= outPipe_bits_4_br_tag; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ftq_idx <= outPipe_bits_4_ftq_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_edge_inst <= outPipe_bits_4_edge_inst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_pc_lob <= outPipe_bits_4_pc_lob; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_taken <= outPipe_bits_4_taken; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_imm_packed <= outPipe_bits_4_imm_packed; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_csr_addr <= outPipe_bits_4_csr_addr; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_rob_idx <= outPipe_bits_4_rob_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ldq_idx <= outPipe_bits_4_ldq_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_stq_idx <= outPipe_bits_4_stq_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_rxq_idx <= outPipe_bits_4_rxq_idx; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_pdst <= outPipe_bits_4_pdst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_prs1 <= outPipe_bits_4_prs1; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_prs2 <= outPipe_bits_4_prs2; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_prs3 <= outPipe_bits_4_prs3; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ppred <= outPipe_bits_4_ppred; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_prs1_busy <= outPipe_bits_4_prs1_busy; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_prs2_busy <= outPipe_bits_4_prs2_busy; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_prs3_busy <= outPipe_bits_4_prs3_busy; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ppred_busy <= outPipe_bits_4_ppred_busy; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_stale_pdst <= outPipe_bits_4_stale_pdst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_exception <= outPipe_bits_4_exception; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_exc_cause <= outPipe_bits_4_exc_cause; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_bypassable <= outPipe_bits_4_bypassable; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_mem_cmd <= outPipe_bits_4_mem_cmd; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_mem_size <= outPipe_bits_4_mem_size; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_mem_signed <= outPipe_bits_4_mem_signed; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_is_fence <= outPipe_bits_4_is_fence; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_is_fencei <= outPipe_bits_4_is_fencei; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_is_amo <= outPipe_bits_4_is_amo; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_uses_ldq <= outPipe_bits_4_uses_ldq; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_uses_stq <= outPipe_bits_4_uses_stq; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_is_sys_pc2epc <= outPipe_bits_4_is_sys_pc2epc; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_is_unique <= outPipe_bits_4_is_unique; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_flush_on_commit <= outPipe_bits_4_flush_on_commit; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ldst_is_rs1 <= outPipe_bits_4_ldst_is_rs1; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ldst <= outPipe_bits_4_ldst; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_lrs1 <= outPipe_bits_4_lrs1; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_lrs2 <= outPipe_bits_4_lrs2; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_lrs3 <= outPipe_bits_4_lrs3; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_ldst_val <= outPipe_bits_4_ldst_val; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_dst_rtype <= outPipe_bits_4_dst_rtype; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_lrs1_rtype <= outPipe_bits_4_lrs1_rtype; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_lrs2_rtype <= outPipe_bits_4_lrs2_rtype; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_frs3_en <= outPipe_bits_4_frs3_en; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_fp_val <= outPipe_bits_4_fp_val; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_fp_single <= outPipe_bits_4_fp_single; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_xcpt_pf_if <= outPipe_bits_4_xcpt_pf_if; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_xcpt_ae_if <= outPipe_bits_4_xcpt_ae_if; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_xcpt_ma_if <= outPipe_bits_4_xcpt_ma_if; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_bp_debug_if <= outPipe_bits_4_bp_debug_if; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_bp_xcpt_if <= outPipe_bits_4_bp_xcpt_if; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_debug_fsrc <= outPipe_bits_4_debug_fsrc; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_4) begin // @[Reg.scala 16:19]
      outPipe_bits_5_debug_tsrc <= outPipe_bits_4_debug_tsrc; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      v_2 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      v_2 <= io_req_valid; // @[Valid.scala 117:22]
    end
    if (io_req_valid) begin // @[Reg.scala 16:19]
      b_2 <= io_req_bits_rs1_data; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid_6 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid_6 <= v_2; // @[Valid.scala 117:22]
    end
    if (v_2) begin // @[Reg.scala 16:19]
      outPipe_bits_6 <= b_2; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid_7 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid_7 <= outPipe_valid_6; // @[Valid.scala 117:22]
    end
    if (outPipe_valid_6) begin // @[Reg.scala 16:19]
      outPipe_bits_7 <= outPipe_bits_6; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_7) begin // @[Reg.scala 16:19]
      outPipe_bits_8 <= outPipe_bits_7; // @[Reg.scala 16:23]
    end
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
    if (reset) begin // @[Counters.scala 45:37]
      value_lo_1 <= 5'h0; // @[Counters.scala 45:37]
    end else begin
      value_lo_1 <= nextSmall_1[4:0];
    end
    if (reset) begin // @[Counters.scala 50:27]
      value_hi_1 <= 27'h0; // @[Counters.scala 50:27]
    end else if (nextSmall_1[5]) begin // @[Counters.scala 51:46]
      value_hi_1 <= _large_r_T_3; // @[Counters.scala 51:50]
    end
    if (reset) begin // @[Counters.scala 45:37]
      value_lo_2 <= 5'h0; // @[Counters.scala 45:37]
    end else begin
      value_lo_2 <= nextSmall_2[4:0];
    end
    if (reset) begin // @[Counters.scala 50:27]
      value_hi_2 <= 27'h0; // @[Counters.scala 50:27]
    end else if (nextSmall_2[5]) begin // @[Counters.scala 51:46]
      value_hi_2 <= _large_r_T_5; // @[Counters.scala 51:50]
    end
    REG <= fpiu_io_in_valid & ~fp_decoder_io_sigs_fastpipe; // @[fpu.scala 276:48]
    if (reset) begin // @[Valid.scala 117:22]
      fpiu_outPipe_valid <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      fpiu_outPipe_valid <= REG; // @[Valid.scala 117:22]
    end
    if (REG) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_toint <= fpiu_io_out_bits_toint; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_exc <= fpiu_io_out_bits_exc; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_toint_cmp_unicore <= fpiu_io_out_bits_toint_cmp_unicore; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_u_exception <= fpiu_io_out_bits_u_exception; // @[Reg.scala 16:23]
    end
    if (REG) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_u_flag <= fpiu_io_out_bits_u_flag; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      fpiu_outPipe_valid_1 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      fpiu_outPipe_valid_1 <= fpiu_outPipe_valid; // @[Valid.scala 117:22]
    end
    if (fpiu_outPipe_valid) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_1_toint <= fpiu_outPipe_bits_toint; // @[Reg.scala 16:23]
    end
    if (fpiu_outPipe_valid) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_1_exc <= fpiu_outPipe_bits_exc; // @[Reg.scala 16:23]
    end
    if (fpiu_outPipe_valid) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_1_toint_cmp_unicore <= fpiu_outPipe_bits_toint_cmp_unicore; // @[Reg.scala 16:23]
    end
    if (fpiu_outPipe_valid) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_1_u_exception <= fpiu_outPipe_bits_u_exception; // @[Reg.scala 16:23]
    end
    if (fpiu_outPipe_valid) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_1_u_flag <= fpiu_outPipe_bits_u_flag; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      fpiu_outPipe_valid_2 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      fpiu_outPipe_valid_2 <= fpiu_outPipe_valid_1; // @[Valid.scala 117:22]
    end
    if (fpiu_outPipe_valid_1) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_2_toint <= fpiu_outPipe_bits_1_toint; // @[Reg.scala 16:23]
    end
    if (fpiu_outPipe_valid_1) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_2_exc <= fpiu_outPipe_bits_1_exc; // @[Reg.scala 16:23]
    end
    if (fpiu_outPipe_valid_1) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_2_toint_cmp_unicore <= fpiu_outPipe_bits_1_toint_cmp_unicore; // @[Reg.scala 16:23]
    end
    if (fpiu_outPipe_valid_1) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_2_u_exception <= fpiu_outPipe_bits_1_u_exception; // @[Reg.scala 16:23]
    end
    if (fpiu_outPipe_valid_1) begin // @[Reg.scala 16:19]
      fpiu_outPipe_bits_2_u_flag <= fpiu_outPipe_bits_1_u_flag; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      v_3 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      v_3 <= _T_187; // @[Valid.scala 117:22]
    end
    if (_T_187) begin // @[Reg.scala 16:19]
      b_3 <= _T_33; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid_9 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid_9 <= v_3; // @[Valid.scala 117:22]
    end
    if (v_3) begin // @[Reg.scala 16:19]
      outPipe_bits_9 <= b_3; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid_10 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid_10 <= outPipe_valid_9; // @[Valid.scala 117:22]
    end
    if (outPipe_valid_9) begin // @[Reg.scala 16:19]
      outPipe_bits_10 <= outPipe_bits_9; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_10) begin // @[Reg.scala 16:19]
      outPipe_bits_11 <= outPipe_bits_10; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      v_4 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      v_4 <= _T_190; // @[Valid.scala 117:22]
    end
    if (_T_190) begin // @[Reg.scala 16:19]
      b_4 <= _T_33; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid_12 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid_12 <= v_4; // @[Valid.scala 117:22]
    end
    if (v_4) begin // @[Reg.scala 16:19]
      outPipe_bits_12 <= b_4; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Valid.scala 117:22]
      outPipe_valid_13 <= 1'h0; // @[Valid.scala 117:22]
    end else begin
      outPipe_valid_13 <= outPipe_valid_12; // @[Valid.scala 117:22]
    end
    if (outPipe_valid_12) begin // @[Reg.scala 16:19]
      outPipe_bits_13 <= outPipe_bits_12; // @[Reg.scala 16:23]
    end
    if (outPipe_valid_13) begin // @[Reg.scala 16:19]
      outPipe_bits_14 <= outPipe_bits_13; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Counters.scala 45:37]
      value_lo_3 <= 5'h0; // @[Counters.scala 45:37]
    end else begin
      value_lo_3 <= nextSmall_3[4:0];
    end
    if (reset) begin // @[Counters.scala 50:27]
      value_hi_3 <= 27'h0; // @[Counters.scala 50:27]
    end else if (nextSmall_3[5]) begin // @[Counters.scala 51:46]
      value_hi_3 <= _large_r_T_7; // @[Counters.scala 51:50]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_66 & ~reset) begin
          $fwrite(32'h80000002,
            "{\"module\":\"FPU\",\"source\":\"fpu.scala:252\",\"cycle\":%d,\"message\":\"fpu input\",\"pc\":\"0x%x\",\"inst\":\"0x%x\",\"self_index\":%d,\"uopc\":%d,\"fflagdata\":\"0x%x\",\"exc_enabled\":\"0x%x\",\"rm\":%d,\"c\":%d,\"typ\":%d,\"fmt\":%d,\"wflag\":%d,\"rflag\":%d,\"cond_unicore\":%d,\"lrs1\":%d,\"lrs2\":%d,\"rs1_data\":\"0x%x\",\"rs2_data\":\"0x%x\"}\n"
            ,value,io_req_bits_uop_debug_pc,io_req_bits_uop_inst,io_req_bits_uop_self_index,io_req_bits_uop_uopc,
            io_req_bits_fflagdata,_T_37,fp_rm,_T_39,_T_62,_WIRE_fmt,io_req_bits_uop_wflag,io_req_bits_uop_rflag,
            fp_cond_unicore,io_req_bits_uop_lrs1,io_req_bits_uop_lrs2,io_req_bits_rs1_data,io_req_bits_rs2_data); // @[logging.scala 34:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_66 & ~reset) begin
          $fwrite(32'h80000002,
            "{\"module\":\"FPU\",\"source\":\"fpu.scala:252\",\"cycle\":%d,\"message\":\"fpu input\",\"pc\":\"0x%x\",\"inst\":\"0x%x\",\"self_index\":%d,\"uopc\":%d,\"fflagdata\":\"0x%x\",\"exc_enabled\":\"0x%x\",\"rm\":%d,\"c\":%d,\"typ\":%d,\"fmt\":%d,\"wflag\":%d,\"rflag\":%d,\"cond_unicore\":%d,\"lrs1\":%d,\"lrs2\":%d,\"rs1_data\":\"0x%x\",\"rs2_data\":\"0x%x\"}\n"
            ,value_1,io_req_bits_uop_debug_pc,io_req_bits_uop_inst,io_req_bits_uop_self_index,io_req_bits_uop_uopc,
            io_req_bits_fflagdata,_T_37,fp_rm,_T_39,_T_62,_WIRE_fmt,io_req_bits_uop_wflag,io_req_bits_uop_rflag,
            fp_cond_unicore,io_req_bits_uop_lrs1,io_req_bits_uop_lrs2,io_req_bits_rs1_data,io_req_bits_rs2_data); // @[logging.scala 34:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_66 & ~reset) begin
          $fwrite(32'h80000002,
            "{\"module\":\"FPU\",\"source\":\"fpu.scala:252\",\"cycle\":%d,\"message\":\"fpu input\",\"pc\":\"0x%x\",\"inst\":\"0x%x\",\"self_index\":%d,\"uopc\":%d,\"fflagdata\":\"0x%x\",\"exc_enabled\":\"0x%x\",\"rm\":%d,\"c\":%d,\"typ\":%d,\"fmt\":%d,\"wflag\":%d,\"rflag\":%d,\"cond_unicore\":%d,\"lrs1\":%d,\"lrs2\":%d,\"rs1_data\":\"0x%x\",\"rs2_data\":\"0x%x\"}\n"
            ,value_2,io_req_bits_uop_debug_pc,io_req_bits_uop_inst,io_req_bits_uop_self_index,io_req_bits_uop_uopc,
            io_req_bits_fflagdata,_T_37,fp_rm,_T_39,_T_62,_WIRE_fmt,io_req_bits_uop_wflag,io_req_bits_uop_rflag,
            fp_cond_unicore,io_req_bits_uop_lrs1,io_req_bits_uop_lrs2,io_req_bits_rs1_data,io_req_bits_rs2_data); // @[logging.scala 34:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_257 & ~reset) begin
          $fwrite(32'h80000002,
            "{\"module\":\"FPU\",\"source\":\"fpu.scala:368\",\"cycle\":%d,\"message\":\"fpu output\",\"dfma_out_valid\":%d,\"sfma_out_valid\":%d,\"fpiu_out_valid\":%d,\"fpmu_out_valid\":%d,\"ifpu_out_valid\":%d,\"pc\":\"0x%x\",\"ldst\":%d,\"data\":\"0x%x\",\"rflag\":%d,\"wflag\":%d,\"fllag_in\":\"0x%x\",\"flag_out\":\"0x%x\",\"exception_out\":\"0x%x\",\"c_out\":\"0x%x\",\"fflag_out\":\"0x%x\"}\n"
            ,value_3,dfma_io_out_valid,sfma_io_out_valid,fpiu_outPipe_valid_2,fpmu_io_out_valid,ifpu_io_out_valid,
            outPipe_bits_5_debug_pc,outPipe_bits_5_ldst,io_resp_bits_data,outPipe_bits_5_rflag,outPipe_bits_5_wflag,
            outPipe_bits_2,fpu_out_u_flag,fpu_out_u_exception,fpu_out_u_c,io_resp_bits_fflagdata_bits_fflag); // @[logging.scala 34:13]
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
  v = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  b = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  outPipe_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  outPipe_bits = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  outPipe_valid_1 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  outPipe_bits_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  outPipe_bits_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  v_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  b_1_switch = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  b_1_switch_off = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  b_1_is_unicore = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  b_1_shift = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  b_1_lrs3_rtype = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  b_1_rflag = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  b_1_wflag = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  b_1_prflag = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  b_1_pwflag = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  b_1_pflag_busy = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  b_1_stale_pflag = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  b_1_op1_sel = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  b_1_op2_sel = _RAND_20[3:0];
  _RAND_21 = {1{`RANDOM}};
  b_1_split_num = _RAND_21[5:0];
  _RAND_22 = {1{`RANDOM}};
  b_1_self_index = _RAND_22[5:0];
  _RAND_23 = {1{`RANDOM}};
  b_1_rob_inst_idx = _RAND_23[5:0];
  _RAND_24 = {1{`RANDOM}};
  b_1_address_num = _RAND_24[5:0];
  _RAND_25 = {1{`RANDOM}};
  b_1_uopc = _RAND_25[6:0];
  _RAND_26 = {1{`RANDOM}};
  b_1_inst = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  b_1_debug_inst = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  b_1_is_rvc = _RAND_28[0:0];
  _RAND_29 = {2{`RANDOM}};
  b_1_debug_pc = _RAND_29[39:0];
  _RAND_30 = {1{`RANDOM}};
  b_1_iq_type = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  b_1_fu_code = _RAND_31[9:0];
  _RAND_32 = {1{`RANDOM}};
  b_1_ctrl_br_type = _RAND_32[3:0];
  _RAND_33 = {1{`RANDOM}};
  b_1_ctrl_op1_sel = _RAND_33[1:0];
  _RAND_34 = {1{`RANDOM}};
  b_1_ctrl_op2_sel = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  b_1_ctrl_imm_sel = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  b_1_ctrl_op_fcn = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  b_1_ctrl_fcn_dw = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  b_1_ctrl_csr_cmd = _RAND_38[2:0];
  _RAND_39 = {1{`RANDOM}};
  b_1_ctrl_is_load = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  b_1_ctrl_is_sta = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  b_1_ctrl_is_std = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  b_1_ctrl_op3_sel = _RAND_42[1:0];
  _RAND_43 = {1{`RANDOM}};
  b_1_iw_state = _RAND_43[1:0];
  _RAND_44 = {1{`RANDOM}};
  b_1_iw_p1_poisoned = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  b_1_iw_p2_poisoned = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  b_1_is_br = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  b_1_is_jalr = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  b_1_is_jal = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  b_1_is_sfb = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  b_1_br_mask = _RAND_50[11:0];
  _RAND_51 = {1{`RANDOM}};
  b_1_br_tag = _RAND_51[3:0];
  _RAND_52 = {1{`RANDOM}};
  b_1_ftq_idx = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  b_1_edge_inst = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  b_1_pc_lob = _RAND_54[5:0];
  _RAND_55 = {1{`RANDOM}};
  b_1_taken = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  b_1_imm_packed = _RAND_56[19:0];
  _RAND_57 = {1{`RANDOM}};
  b_1_csr_addr = _RAND_57[11:0];
  _RAND_58 = {1{`RANDOM}};
  b_1_rob_idx = _RAND_58[5:0];
  _RAND_59 = {1{`RANDOM}};
  b_1_ldq_idx = _RAND_59[4:0];
  _RAND_60 = {1{`RANDOM}};
  b_1_stq_idx = _RAND_60[4:0];
  _RAND_61 = {1{`RANDOM}};
  b_1_rxq_idx = _RAND_61[1:0];
  _RAND_62 = {1{`RANDOM}};
  b_1_pdst = _RAND_62[6:0];
  _RAND_63 = {1{`RANDOM}};
  b_1_prs1 = _RAND_63[6:0];
  _RAND_64 = {1{`RANDOM}};
  b_1_prs2 = _RAND_64[6:0];
  _RAND_65 = {1{`RANDOM}};
  b_1_prs3 = _RAND_65[6:0];
  _RAND_66 = {1{`RANDOM}};
  b_1_ppred = _RAND_66[4:0];
  _RAND_67 = {1{`RANDOM}};
  b_1_prs1_busy = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  b_1_prs2_busy = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  b_1_prs3_busy = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  b_1_ppred_busy = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  b_1_stale_pdst = _RAND_71[6:0];
  _RAND_72 = {1{`RANDOM}};
  b_1_exception = _RAND_72[0:0];
  _RAND_73 = {2{`RANDOM}};
  b_1_exc_cause = _RAND_73[63:0];
  _RAND_74 = {1{`RANDOM}};
  b_1_bypassable = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  b_1_mem_cmd = _RAND_75[4:0];
  _RAND_76 = {1{`RANDOM}};
  b_1_mem_size = _RAND_76[1:0];
  _RAND_77 = {1{`RANDOM}};
  b_1_mem_signed = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  b_1_is_fence = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  b_1_is_fencei = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  b_1_is_amo = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  b_1_uses_ldq = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  b_1_uses_stq = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  b_1_is_sys_pc2epc = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  b_1_is_unique = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  b_1_flush_on_commit = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  b_1_ldst_is_rs1 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  b_1_ldst = _RAND_87[5:0];
  _RAND_88 = {1{`RANDOM}};
  b_1_lrs1 = _RAND_88[5:0];
  _RAND_89 = {1{`RANDOM}};
  b_1_lrs2 = _RAND_89[5:0];
  _RAND_90 = {1{`RANDOM}};
  b_1_lrs3 = _RAND_90[5:0];
  _RAND_91 = {1{`RANDOM}};
  b_1_ldst_val = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  b_1_dst_rtype = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  b_1_lrs1_rtype = _RAND_93[1:0];
  _RAND_94 = {1{`RANDOM}};
  b_1_lrs2_rtype = _RAND_94[1:0];
  _RAND_95 = {1{`RANDOM}};
  b_1_frs3_en = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  b_1_fp_val = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  b_1_fp_single = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  b_1_xcpt_pf_if = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  b_1_xcpt_ae_if = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  b_1_xcpt_ma_if = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  b_1_bp_debug_if = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  b_1_bp_xcpt_if = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  b_1_debug_fsrc = _RAND_103[1:0];
  _RAND_104 = {1{`RANDOM}};
  b_1_debug_tsrc = _RAND_104[1:0];
  _RAND_105 = {1{`RANDOM}};
  outPipe_valid_3 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  outPipe_bits_3_switch = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  outPipe_bits_3_switch_off = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  outPipe_bits_3_is_unicore = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  outPipe_bits_3_shift = _RAND_109[2:0];
  _RAND_110 = {1{`RANDOM}};
  outPipe_bits_3_lrs3_rtype = _RAND_110[1:0];
  _RAND_111 = {1{`RANDOM}};
  outPipe_bits_3_rflag = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  outPipe_bits_3_wflag = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  outPipe_bits_3_prflag = _RAND_113[3:0];
  _RAND_114 = {1{`RANDOM}};
  outPipe_bits_3_pwflag = _RAND_114[3:0];
  _RAND_115 = {1{`RANDOM}};
  outPipe_bits_3_pflag_busy = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  outPipe_bits_3_stale_pflag = _RAND_116[3:0];
  _RAND_117 = {1{`RANDOM}};
  outPipe_bits_3_op1_sel = _RAND_117[3:0];
  _RAND_118 = {1{`RANDOM}};
  outPipe_bits_3_op2_sel = _RAND_118[3:0];
  _RAND_119 = {1{`RANDOM}};
  outPipe_bits_3_split_num = _RAND_119[5:0];
  _RAND_120 = {1{`RANDOM}};
  outPipe_bits_3_self_index = _RAND_120[5:0];
  _RAND_121 = {1{`RANDOM}};
  outPipe_bits_3_rob_inst_idx = _RAND_121[5:0];
  _RAND_122 = {1{`RANDOM}};
  outPipe_bits_3_address_num = _RAND_122[5:0];
  _RAND_123 = {1{`RANDOM}};
  outPipe_bits_3_uopc = _RAND_123[6:0];
  _RAND_124 = {1{`RANDOM}};
  outPipe_bits_3_inst = _RAND_124[31:0];
  _RAND_125 = {1{`RANDOM}};
  outPipe_bits_3_debug_inst = _RAND_125[31:0];
  _RAND_126 = {1{`RANDOM}};
  outPipe_bits_3_is_rvc = _RAND_126[0:0];
  _RAND_127 = {2{`RANDOM}};
  outPipe_bits_3_debug_pc = _RAND_127[39:0];
  _RAND_128 = {1{`RANDOM}};
  outPipe_bits_3_iq_type = _RAND_128[2:0];
  _RAND_129 = {1{`RANDOM}};
  outPipe_bits_3_fu_code = _RAND_129[9:0];
  _RAND_130 = {1{`RANDOM}};
  outPipe_bits_3_ctrl_br_type = _RAND_130[3:0];
  _RAND_131 = {1{`RANDOM}};
  outPipe_bits_3_ctrl_op1_sel = _RAND_131[1:0];
  _RAND_132 = {1{`RANDOM}};
  outPipe_bits_3_ctrl_op2_sel = _RAND_132[2:0];
  _RAND_133 = {1{`RANDOM}};
  outPipe_bits_3_ctrl_imm_sel = _RAND_133[2:0];
  _RAND_134 = {1{`RANDOM}};
  outPipe_bits_3_ctrl_op_fcn = _RAND_134[3:0];
  _RAND_135 = {1{`RANDOM}};
  outPipe_bits_3_ctrl_fcn_dw = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  outPipe_bits_3_ctrl_csr_cmd = _RAND_136[2:0];
  _RAND_137 = {1{`RANDOM}};
  outPipe_bits_3_ctrl_is_load = _RAND_137[0:0];
  _RAND_138 = {1{`RANDOM}};
  outPipe_bits_3_ctrl_is_sta = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  outPipe_bits_3_ctrl_is_std = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  outPipe_bits_3_ctrl_op3_sel = _RAND_140[1:0];
  _RAND_141 = {1{`RANDOM}};
  outPipe_bits_3_iw_state = _RAND_141[1:0];
  _RAND_142 = {1{`RANDOM}};
  outPipe_bits_3_iw_p1_poisoned = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  outPipe_bits_3_iw_p2_poisoned = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  outPipe_bits_3_is_br = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  outPipe_bits_3_is_jalr = _RAND_145[0:0];
  _RAND_146 = {1{`RANDOM}};
  outPipe_bits_3_is_jal = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  outPipe_bits_3_is_sfb = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  outPipe_bits_3_br_mask = _RAND_148[11:0];
  _RAND_149 = {1{`RANDOM}};
  outPipe_bits_3_br_tag = _RAND_149[3:0];
  _RAND_150 = {1{`RANDOM}};
  outPipe_bits_3_ftq_idx = _RAND_150[4:0];
  _RAND_151 = {1{`RANDOM}};
  outPipe_bits_3_edge_inst = _RAND_151[0:0];
  _RAND_152 = {1{`RANDOM}};
  outPipe_bits_3_pc_lob = _RAND_152[5:0];
  _RAND_153 = {1{`RANDOM}};
  outPipe_bits_3_taken = _RAND_153[0:0];
  _RAND_154 = {1{`RANDOM}};
  outPipe_bits_3_imm_packed = _RAND_154[19:0];
  _RAND_155 = {1{`RANDOM}};
  outPipe_bits_3_csr_addr = _RAND_155[11:0];
  _RAND_156 = {1{`RANDOM}};
  outPipe_bits_3_rob_idx = _RAND_156[5:0];
  _RAND_157 = {1{`RANDOM}};
  outPipe_bits_3_ldq_idx = _RAND_157[4:0];
  _RAND_158 = {1{`RANDOM}};
  outPipe_bits_3_stq_idx = _RAND_158[4:0];
  _RAND_159 = {1{`RANDOM}};
  outPipe_bits_3_rxq_idx = _RAND_159[1:0];
  _RAND_160 = {1{`RANDOM}};
  outPipe_bits_3_pdst = _RAND_160[6:0];
  _RAND_161 = {1{`RANDOM}};
  outPipe_bits_3_prs1 = _RAND_161[6:0];
  _RAND_162 = {1{`RANDOM}};
  outPipe_bits_3_prs2 = _RAND_162[6:0];
  _RAND_163 = {1{`RANDOM}};
  outPipe_bits_3_prs3 = _RAND_163[6:0];
  _RAND_164 = {1{`RANDOM}};
  outPipe_bits_3_ppred = _RAND_164[4:0];
  _RAND_165 = {1{`RANDOM}};
  outPipe_bits_3_prs1_busy = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  outPipe_bits_3_prs2_busy = _RAND_166[0:0];
  _RAND_167 = {1{`RANDOM}};
  outPipe_bits_3_prs3_busy = _RAND_167[0:0];
  _RAND_168 = {1{`RANDOM}};
  outPipe_bits_3_ppred_busy = _RAND_168[0:0];
  _RAND_169 = {1{`RANDOM}};
  outPipe_bits_3_stale_pdst = _RAND_169[6:0];
  _RAND_170 = {1{`RANDOM}};
  outPipe_bits_3_exception = _RAND_170[0:0];
  _RAND_171 = {2{`RANDOM}};
  outPipe_bits_3_exc_cause = _RAND_171[63:0];
  _RAND_172 = {1{`RANDOM}};
  outPipe_bits_3_bypassable = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  outPipe_bits_3_mem_cmd = _RAND_173[4:0];
  _RAND_174 = {1{`RANDOM}};
  outPipe_bits_3_mem_size = _RAND_174[1:0];
  _RAND_175 = {1{`RANDOM}};
  outPipe_bits_3_mem_signed = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  outPipe_bits_3_is_fence = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  outPipe_bits_3_is_fencei = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  outPipe_bits_3_is_amo = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  outPipe_bits_3_uses_ldq = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  outPipe_bits_3_uses_stq = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  outPipe_bits_3_is_sys_pc2epc = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  outPipe_bits_3_is_unique = _RAND_182[0:0];
  _RAND_183 = {1{`RANDOM}};
  outPipe_bits_3_flush_on_commit = _RAND_183[0:0];
  _RAND_184 = {1{`RANDOM}};
  outPipe_bits_3_ldst_is_rs1 = _RAND_184[0:0];
  _RAND_185 = {1{`RANDOM}};
  outPipe_bits_3_ldst = _RAND_185[5:0];
  _RAND_186 = {1{`RANDOM}};
  outPipe_bits_3_lrs1 = _RAND_186[5:0];
  _RAND_187 = {1{`RANDOM}};
  outPipe_bits_3_lrs2 = _RAND_187[5:0];
  _RAND_188 = {1{`RANDOM}};
  outPipe_bits_3_lrs3 = _RAND_188[5:0];
  _RAND_189 = {1{`RANDOM}};
  outPipe_bits_3_ldst_val = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  outPipe_bits_3_dst_rtype = _RAND_190[1:0];
  _RAND_191 = {1{`RANDOM}};
  outPipe_bits_3_lrs1_rtype = _RAND_191[1:0];
  _RAND_192 = {1{`RANDOM}};
  outPipe_bits_3_lrs2_rtype = _RAND_192[1:0];
  _RAND_193 = {1{`RANDOM}};
  outPipe_bits_3_frs3_en = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  outPipe_bits_3_fp_val = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  outPipe_bits_3_fp_single = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  outPipe_bits_3_xcpt_pf_if = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  outPipe_bits_3_xcpt_ae_if = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  outPipe_bits_3_xcpt_ma_if = _RAND_198[0:0];
  _RAND_199 = {1{`RANDOM}};
  outPipe_bits_3_bp_debug_if = _RAND_199[0:0];
  _RAND_200 = {1{`RANDOM}};
  outPipe_bits_3_bp_xcpt_if = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  outPipe_bits_3_debug_fsrc = _RAND_201[1:0];
  _RAND_202 = {1{`RANDOM}};
  outPipe_bits_3_debug_tsrc = _RAND_202[1:0];
  _RAND_203 = {1{`RANDOM}};
  outPipe_valid_4 = _RAND_203[0:0];
  _RAND_204 = {1{`RANDOM}};
  outPipe_bits_4_switch = _RAND_204[0:0];
  _RAND_205 = {1{`RANDOM}};
  outPipe_bits_4_switch_off = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  outPipe_bits_4_is_unicore = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  outPipe_bits_4_shift = _RAND_207[2:0];
  _RAND_208 = {1{`RANDOM}};
  outPipe_bits_4_lrs3_rtype = _RAND_208[1:0];
  _RAND_209 = {1{`RANDOM}};
  outPipe_bits_4_rflag = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  outPipe_bits_4_wflag = _RAND_210[0:0];
  _RAND_211 = {1{`RANDOM}};
  outPipe_bits_4_prflag = _RAND_211[3:0];
  _RAND_212 = {1{`RANDOM}};
  outPipe_bits_4_pwflag = _RAND_212[3:0];
  _RAND_213 = {1{`RANDOM}};
  outPipe_bits_4_pflag_busy = _RAND_213[0:0];
  _RAND_214 = {1{`RANDOM}};
  outPipe_bits_4_stale_pflag = _RAND_214[3:0];
  _RAND_215 = {1{`RANDOM}};
  outPipe_bits_4_op1_sel = _RAND_215[3:0];
  _RAND_216 = {1{`RANDOM}};
  outPipe_bits_4_op2_sel = _RAND_216[3:0];
  _RAND_217 = {1{`RANDOM}};
  outPipe_bits_4_split_num = _RAND_217[5:0];
  _RAND_218 = {1{`RANDOM}};
  outPipe_bits_4_self_index = _RAND_218[5:0];
  _RAND_219 = {1{`RANDOM}};
  outPipe_bits_4_rob_inst_idx = _RAND_219[5:0];
  _RAND_220 = {1{`RANDOM}};
  outPipe_bits_4_address_num = _RAND_220[5:0];
  _RAND_221 = {1{`RANDOM}};
  outPipe_bits_4_uopc = _RAND_221[6:0];
  _RAND_222 = {1{`RANDOM}};
  outPipe_bits_4_inst = _RAND_222[31:0];
  _RAND_223 = {1{`RANDOM}};
  outPipe_bits_4_debug_inst = _RAND_223[31:0];
  _RAND_224 = {1{`RANDOM}};
  outPipe_bits_4_is_rvc = _RAND_224[0:0];
  _RAND_225 = {2{`RANDOM}};
  outPipe_bits_4_debug_pc = _RAND_225[39:0];
  _RAND_226 = {1{`RANDOM}};
  outPipe_bits_4_iq_type = _RAND_226[2:0];
  _RAND_227 = {1{`RANDOM}};
  outPipe_bits_4_fu_code = _RAND_227[9:0];
  _RAND_228 = {1{`RANDOM}};
  outPipe_bits_4_ctrl_br_type = _RAND_228[3:0];
  _RAND_229 = {1{`RANDOM}};
  outPipe_bits_4_ctrl_op1_sel = _RAND_229[1:0];
  _RAND_230 = {1{`RANDOM}};
  outPipe_bits_4_ctrl_op2_sel = _RAND_230[2:0];
  _RAND_231 = {1{`RANDOM}};
  outPipe_bits_4_ctrl_imm_sel = _RAND_231[2:0];
  _RAND_232 = {1{`RANDOM}};
  outPipe_bits_4_ctrl_op_fcn = _RAND_232[3:0];
  _RAND_233 = {1{`RANDOM}};
  outPipe_bits_4_ctrl_fcn_dw = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  outPipe_bits_4_ctrl_csr_cmd = _RAND_234[2:0];
  _RAND_235 = {1{`RANDOM}};
  outPipe_bits_4_ctrl_is_load = _RAND_235[0:0];
  _RAND_236 = {1{`RANDOM}};
  outPipe_bits_4_ctrl_is_sta = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  outPipe_bits_4_ctrl_is_std = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  outPipe_bits_4_ctrl_op3_sel = _RAND_238[1:0];
  _RAND_239 = {1{`RANDOM}};
  outPipe_bits_4_iw_state = _RAND_239[1:0];
  _RAND_240 = {1{`RANDOM}};
  outPipe_bits_4_iw_p1_poisoned = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  outPipe_bits_4_iw_p2_poisoned = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  outPipe_bits_4_is_br = _RAND_242[0:0];
  _RAND_243 = {1{`RANDOM}};
  outPipe_bits_4_is_jalr = _RAND_243[0:0];
  _RAND_244 = {1{`RANDOM}};
  outPipe_bits_4_is_jal = _RAND_244[0:0];
  _RAND_245 = {1{`RANDOM}};
  outPipe_bits_4_is_sfb = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  outPipe_bits_4_br_mask = _RAND_246[11:0];
  _RAND_247 = {1{`RANDOM}};
  outPipe_bits_4_br_tag = _RAND_247[3:0];
  _RAND_248 = {1{`RANDOM}};
  outPipe_bits_4_ftq_idx = _RAND_248[4:0];
  _RAND_249 = {1{`RANDOM}};
  outPipe_bits_4_edge_inst = _RAND_249[0:0];
  _RAND_250 = {1{`RANDOM}};
  outPipe_bits_4_pc_lob = _RAND_250[5:0];
  _RAND_251 = {1{`RANDOM}};
  outPipe_bits_4_taken = _RAND_251[0:0];
  _RAND_252 = {1{`RANDOM}};
  outPipe_bits_4_imm_packed = _RAND_252[19:0];
  _RAND_253 = {1{`RANDOM}};
  outPipe_bits_4_csr_addr = _RAND_253[11:0];
  _RAND_254 = {1{`RANDOM}};
  outPipe_bits_4_rob_idx = _RAND_254[5:0];
  _RAND_255 = {1{`RANDOM}};
  outPipe_bits_4_ldq_idx = _RAND_255[4:0];
  _RAND_256 = {1{`RANDOM}};
  outPipe_bits_4_stq_idx = _RAND_256[4:0];
  _RAND_257 = {1{`RANDOM}};
  outPipe_bits_4_rxq_idx = _RAND_257[1:0];
  _RAND_258 = {1{`RANDOM}};
  outPipe_bits_4_pdst = _RAND_258[6:0];
  _RAND_259 = {1{`RANDOM}};
  outPipe_bits_4_prs1 = _RAND_259[6:0];
  _RAND_260 = {1{`RANDOM}};
  outPipe_bits_4_prs2 = _RAND_260[6:0];
  _RAND_261 = {1{`RANDOM}};
  outPipe_bits_4_prs3 = _RAND_261[6:0];
  _RAND_262 = {1{`RANDOM}};
  outPipe_bits_4_ppred = _RAND_262[4:0];
  _RAND_263 = {1{`RANDOM}};
  outPipe_bits_4_prs1_busy = _RAND_263[0:0];
  _RAND_264 = {1{`RANDOM}};
  outPipe_bits_4_prs2_busy = _RAND_264[0:0];
  _RAND_265 = {1{`RANDOM}};
  outPipe_bits_4_prs3_busy = _RAND_265[0:0];
  _RAND_266 = {1{`RANDOM}};
  outPipe_bits_4_ppred_busy = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  outPipe_bits_4_stale_pdst = _RAND_267[6:0];
  _RAND_268 = {1{`RANDOM}};
  outPipe_bits_4_exception = _RAND_268[0:0];
  _RAND_269 = {2{`RANDOM}};
  outPipe_bits_4_exc_cause = _RAND_269[63:0];
  _RAND_270 = {1{`RANDOM}};
  outPipe_bits_4_bypassable = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  outPipe_bits_4_mem_cmd = _RAND_271[4:0];
  _RAND_272 = {1{`RANDOM}};
  outPipe_bits_4_mem_size = _RAND_272[1:0];
  _RAND_273 = {1{`RANDOM}};
  outPipe_bits_4_mem_signed = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  outPipe_bits_4_is_fence = _RAND_274[0:0];
  _RAND_275 = {1{`RANDOM}};
  outPipe_bits_4_is_fencei = _RAND_275[0:0];
  _RAND_276 = {1{`RANDOM}};
  outPipe_bits_4_is_amo = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  outPipe_bits_4_uses_ldq = _RAND_277[0:0];
  _RAND_278 = {1{`RANDOM}};
  outPipe_bits_4_uses_stq = _RAND_278[0:0];
  _RAND_279 = {1{`RANDOM}};
  outPipe_bits_4_is_sys_pc2epc = _RAND_279[0:0];
  _RAND_280 = {1{`RANDOM}};
  outPipe_bits_4_is_unique = _RAND_280[0:0];
  _RAND_281 = {1{`RANDOM}};
  outPipe_bits_4_flush_on_commit = _RAND_281[0:0];
  _RAND_282 = {1{`RANDOM}};
  outPipe_bits_4_ldst_is_rs1 = _RAND_282[0:0];
  _RAND_283 = {1{`RANDOM}};
  outPipe_bits_4_ldst = _RAND_283[5:0];
  _RAND_284 = {1{`RANDOM}};
  outPipe_bits_4_lrs1 = _RAND_284[5:0];
  _RAND_285 = {1{`RANDOM}};
  outPipe_bits_4_lrs2 = _RAND_285[5:0];
  _RAND_286 = {1{`RANDOM}};
  outPipe_bits_4_lrs3 = _RAND_286[5:0];
  _RAND_287 = {1{`RANDOM}};
  outPipe_bits_4_ldst_val = _RAND_287[0:0];
  _RAND_288 = {1{`RANDOM}};
  outPipe_bits_4_dst_rtype = _RAND_288[1:0];
  _RAND_289 = {1{`RANDOM}};
  outPipe_bits_4_lrs1_rtype = _RAND_289[1:0];
  _RAND_290 = {1{`RANDOM}};
  outPipe_bits_4_lrs2_rtype = _RAND_290[1:0];
  _RAND_291 = {1{`RANDOM}};
  outPipe_bits_4_frs3_en = _RAND_291[0:0];
  _RAND_292 = {1{`RANDOM}};
  outPipe_bits_4_fp_val = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  outPipe_bits_4_fp_single = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  outPipe_bits_4_xcpt_pf_if = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  outPipe_bits_4_xcpt_ae_if = _RAND_295[0:0];
  _RAND_296 = {1{`RANDOM}};
  outPipe_bits_4_xcpt_ma_if = _RAND_296[0:0];
  _RAND_297 = {1{`RANDOM}};
  outPipe_bits_4_bp_debug_if = _RAND_297[0:0];
  _RAND_298 = {1{`RANDOM}};
  outPipe_bits_4_bp_xcpt_if = _RAND_298[0:0];
  _RAND_299 = {1{`RANDOM}};
  outPipe_bits_4_debug_fsrc = _RAND_299[1:0];
  _RAND_300 = {1{`RANDOM}};
  outPipe_bits_4_debug_tsrc = _RAND_300[1:0];
  _RAND_301 = {1{`RANDOM}};
  outPipe_bits_5_switch = _RAND_301[0:0];
  _RAND_302 = {1{`RANDOM}};
  outPipe_bits_5_switch_off = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  outPipe_bits_5_is_unicore = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  outPipe_bits_5_shift = _RAND_304[2:0];
  _RAND_305 = {1{`RANDOM}};
  outPipe_bits_5_lrs3_rtype = _RAND_305[1:0];
  _RAND_306 = {1{`RANDOM}};
  outPipe_bits_5_rflag = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  outPipe_bits_5_wflag = _RAND_307[0:0];
  _RAND_308 = {1{`RANDOM}};
  outPipe_bits_5_prflag = _RAND_308[3:0];
  _RAND_309 = {1{`RANDOM}};
  outPipe_bits_5_pwflag = _RAND_309[3:0];
  _RAND_310 = {1{`RANDOM}};
  outPipe_bits_5_pflag_busy = _RAND_310[0:0];
  _RAND_311 = {1{`RANDOM}};
  outPipe_bits_5_stale_pflag = _RAND_311[3:0];
  _RAND_312 = {1{`RANDOM}};
  outPipe_bits_5_op1_sel = _RAND_312[3:0];
  _RAND_313 = {1{`RANDOM}};
  outPipe_bits_5_op2_sel = _RAND_313[3:0];
  _RAND_314 = {1{`RANDOM}};
  outPipe_bits_5_split_num = _RAND_314[5:0];
  _RAND_315 = {1{`RANDOM}};
  outPipe_bits_5_self_index = _RAND_315[5:0];
  _RAND_316 = {1{`RANDOM}};
  outPipe_bits_5_rob_inst_idx = _RAND_316[5:0];
  _RAND_317 = {1{`RANDOM}};
  outPipe_bits_5_address_num = _RAND_317[5:0];
  _RAND_318 = {1{`RANDOM}};
  outPipe_bits_5_uopc = _RAND_318[6:0];
  _RAND_319 = {1{`RANDOM}};
  outPipe_bits_5_inst = _RAND_319[31:0];
  _RAND_320 = {1{`RANDOM}};
  outPipe_bits_5_debug_inst = _RAND_320[31:0];
  _RAND_321 = {1{`RANDOM}};
  outPipe_bits_5_is_rvc = _RAND_321[0:0];
  _RAND_322 = {2{`RANDOM}};
  outPipe_bits_5_debug_pc = _RAND_322[39:0];
  _RAND_323 = {1{`RANDOM}};
  outPipe_bits_5_iq_type = _RAND_323[2:0];
  _RAND_324 = {1{`RANDOM}};
  outPipe_bits_5_fu_code = _RAND_324[9:0];
  _RAND_325 = {1{`RANDOM}};
  outPipe_bits_5_ctrl_br_type = _RAND_325[3:0];
  _RAND_326 = {1{`RANDOM}};
  outPipe_bits_5_ctrl_op1_sel = _RAND_326[1:0];
  _RAND_327 = {1{`RANDOM}};
  outPipe_bits_5_ctrl_op2_sel = _RAND_327[2:0];
  _RAND_328 = {1{`RANDOM}};
  outPipe_bits_5_ctrl_imm_sel = _RAND_328[2:0];
  _RAND_329 = {1{`RANDOM}};
  outPipe_bits_5_ctrl_op_fcn = _RAND_329[3:0];
  _RAND_330 = {1{`RANDOM}};
  outPipe_bits_5_ctrl_fcn_dw = _RAND_330[0:0];
  _RAND_331 = {1{`RANDOM}};
  outPipe_bits_5_ctrl_csr_cmd = _RAND_331[2:0];
  _RAND_332 = {1{`RANDOM}};
  outPipe_bits_5_ctrl_is_load = _RAND_332[0:0];
  _RAND_333 = {1{`RANDOM}};
  outPipe_bits_5_ctrl_is_sta = _RAND_333[0:0];
  _RAND_334 = {1{`RANDOM}};
  outPipe_bits_5_ctrl_is_std = _RAND_334[0:0];
  _RAND_335 = {1{`RANDOM}};
  outPipe_bits_5_ctrl_op3_sel = _RAND_335[1:0];
  _RAND_336 = {1{`RANDOM}};
  outPipe_bits_5_iw_state = _RAND_336[1:0];
  _RAND_337 = {1{`RANDOM}};
  outPipe_bits_5_iw_p1_poisoned = _RAND_337[0:0];
  _RAND_338 = {1{`RANDOM}};
  outPipe_bits_5_iw_p2_poisoned = _RAND_338[0:0];
  _RAND_339 = {1{`RANDOM}};
  outPipe_bits_5_is_br = _RAND_339[0:0];
  _RAND_340 = {1{`RANDOM}};
  outPipe_bits_5_is_jalr = _RAND_340[0:0];
  _RAND_341 = {1{`RANDOM}};
  outPipe_bits_5_is_jal = _RAND_341[0:0];
  _RAND_342 = {1{`RANDOM}};
  outPipe_bits_5_is_sfb = _RAND_342[0:0];
  _RAND_343 = {1{`RANDOM}};
  outPipe_bits_5_br_mask = _RAND_343[11:0];
  _RAND_344 = {1{`RANDOM}};
  outPipe_bits_5_br_tag = _RAND_344[3:0];
  _RAND_345 = {1{`RANDOM}};
  outPipe_bits_5_ftq_idx = _RAND_345[4:0];
  _RAND_346 = {1{`RANDOM}};
  outPipe_bits_5_edge_inst = _RAND_346[0:0];
  _RAND_347 = {1{`RANDOM}};
  outPipe_bits_5_pc_lob = _RAND_347[5:0];
  _RAND_348 = {1{`RANDOM}};
  outPipe_bits_5_taken = _RAND_348[0:0];
  _RAND_349 = {1{`RANDOM}};
  outPipe_bits_5_imm_packed = _RAND_349[19:0];
  _RAND_350 = {1{`RANDOM}};
  outPipe_bits_5_csr_addr = _RAND_350[11:0];
  _RAND_351 = {1{`RANDOM}};
  outPipe_bits_5_rob_idx = _RAND_351[5:0];
  _RAND_352 = {1{`RANDOM}};
  outPipe_bits_5_ldq_idx = _RAND_352[4:0];
  _RAND_353 = {1{`RANDOM}};
  outPipe_bits_5_stq_idx = _RAND_353[4:0];
  _RAND_354 = {1{`RANDOM}};
  outPipe_bits_5_rxq_idx = _RAND_354[1:0];
  _RAND_355 = {1{`RANDOM}};
  outPipe_bits_5_pdst = _RAND_355[6:0];
  _RAND_356 = {1{`RANDOM}};
  outPipe_bits_5_prs1 = _RAND_356[6:0];
  _RAND_357 = {1{`RANDOM}};
  outPipe_bits_5_prs2 = _RAND_357[6:0];
  _RAND_358 = {1{`RANDOM}};
  outPipe_bits_5_prs3 = _RAND_358[6:0];
  _RAND_359 = {1{`RANDOM}};
  outPipe_bits_5_ppred = _RAND_359[4:0];
  _RAND_360 = {1{`RANDOM}};
  outPipe_bits_5_prs1_busy = _RAND_360[0:0];
  _RAND_361 = {1{`RANDOM}};
  outPipe_bits_5_prs2_busy = _RAND_361[0:0];
  _RAND_362 = {1{`RANDOM}};
  outPipe_bits_5_prs3_busy = _RAND_362[0:0];
  _RAND_363 = {1{`RANDOM}};
  outPipe_bits_5_ppred_busy = _RAND_363[0:0];
  _RAND_364 = {1{`RANDOM}};
  outPipe_bits_5_stale_pdst = _RAND_364[6:0];
  _RAND_365 = {1{`RANDOM}};
  outPipe_bits_5_exception = _RAND_365[0:0];
  _RAND_366 = {2{`RANDOM}};
  outPipe_bits_5_exc_cause = _RAND_366[63:0];
  _RAND_367 = {1{`RANDOM}};
  outPipe_bits_5_bypassable = _RAND_367[0:0];
  _RAND_368 = {1{`RANDOM}};
  outPipe_bits_5_mem_cmd = _RAND_368[4:0];
  _RAND_369 = {1{`RANDOM}};
  outPipe_bits_5_mem_size = _RAND_369[1:0];
  _RAND_370 = {1{`RANDOM}};
  outPipe_bits_5_mem_signed = _RAND_370[0:0];
  _RAND_371 = {1{`RANDOM}};
  outPipe_bits_5_is_fence = _RAND_371[0:0];
  _RAND_372 = {1{`RANDOM}};
  outPipe_bits_5_is_fencei = _RAND_372[0:0];
  _RAND_373 = {1{`RANDOM}};
  outPipe_bits_5_is_amo = _RAND_373[0:0];
  _RAND_374 = {1{`RANDOM}};
  outPipe_bits_5_uses_ldq = _RAND_374[0:0];
  _RAND_375 = {1{`RANDOM}};
  outPipe_bits_5_uses_stq = _RAND_375[0:0];
  _RAND_376 = {1{`RANDOM}};
  outPipe_bits_5_is_sys_pc2epc = _RAND_376[0:0];
  _RAND_377 = {1{`RANDOM}};
  outPipe_bits_5_is_unique = _RAND_377[0:0];
  _RAND_378 = {1{`RANDOM}};
  outPipe_bits_5_flush_on_commit = _RAND_378[0:0];
  _RAND_379 = {1{`RANDOM}};
  outPipe_bits_5_ldst_is_rs1 = _RAND_379[0:0];
  _RAND_380 = {1{`RANDOM}};
  outPipe_bits_5_ldst = _RAND_380[5:0];
  _RAND_381 = {1{`RANDOM}};
  outPipe_bits_5_lrs1 = _RAND_381[5:0];
  _RAND_382 = {1{`RANDOM}};
  outPipe_bits_5_lrs2 = _RAND_382[5:0];
  _RAND_383 = {1{`RANDOM}};
  outPipe_bits_5_lrs3 = _RAND_383[5:0];
  _RAND_384 = {1{`RANDOM}};
  outPipe_bits_5_ldst_val = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  outPipe_bits_5_dst_rtype = _RAND_385[1:0];
  _RAND_386 = {1{`RANDOM}};
  outPipe_bits_5_lrs1_rtype = _RAND_386[1:0];
  _RAND_387 = {1{`RANDOM}};
  outPipe_bits_5_lrs2_rtype = _RAND_387[1:0];
  _RAND_388 = {1{`RANDOM}};
  outPipe_bits_5_frs3_en = _RAND_388[0:0];
  _RAND_389 = {1{`RANDOM}};
  outPipe_bits_5_fp_val = _RAND_389[0:0];
  _RAND_390 = {1{`RANDOM}};
  outPipe_bits_5_fp_single = _RAND_390[0:0];
  _RAND_391 = {1{`RANDOM}};
  outPipe_bits_5_xcpt_pf_if = _RAND_391[0:0];
  _RAND_392 = {1{`RANDOM}};
  outPipe_bits_5_xcpt_ae_if = _RAND_392[0:0];
  _RAND_393 = {1{`RANDOM}};
  outPipe_bits_5_xcpt_ma_if = _RAND_393[0:0];
  _RAND_394 = {1{`RANDOM}};
  outPipe_bits_5_bp_debug_if = _RAND_394[0:0];
  _RAND_395 = {1{`RANDOM}};
  outPipe_bits_5_bp_xcpt_if = _RAND_395[0:0];
  _RAND_396 = {1{`RANDOM}};
  outPipe_bits_5_debug_fsrc = _RAND_396[1:0];
  _RAND_397 = {1{`RANDOM}};
  outPipe_bits_5_debug_tsrc = _RAND_397[1:0];
  _RAND_398 = {1{`RANDOM}};
  v_2 = _RAND_398[0:0];
  _RAND_399 = {3{`RANDOM}};
  b_2 = _RAND_399[64:0];
  _RAND_400 = {1{`RANDOM}};
  outPipe_valid_6 = _RAND_400[0:0];
  _RAND_401 = {3{`RANDOM}};
  outPipe_bits_6 = _RAND_401[64:0];
  _RAND_402 = {1{`RANDOM}};
  outPipe_valid_7 = _RAND_402[0:0];
  _RAND_403 = {3{`RANDOM}};
  outPipe_bits_7 = _RAND_403[64:0];
  _RAND_404 = {3{`RANDOM}};
  outPipe_bits_8 = _RAND_404[64:0];
  _RAND_405 = {1{`RANDOM}};
  value_lo = _RAND_405[4:0];
  _RAND_406 = {1{`RANDOM}};
  value_hi = _RAND_406[26:0];
  _RAND_407 = {1{`RANDOM}};
  value_lo_1 = _RAND_407[4:0];
  _RAND_408 = {1{`RANDOM}};
  value_hi_1 = _RAND_408[26:0];
  _RAND_409 = {1{`RANDOM}};
  value_lo_2 = _RAND_409[4:0];
  _RAND_410 = {1{`RANDOM}};
  value_hi_2 = _RAND_410[26:0];
  _RAND_411 = {1{`RANDOM}};
  REG = _RAND_411[0:0];
  _RAND_412 = {1{`RANDOM}};
  fpiu_outPipe_valid = _RAND_412[0:0];
  _RAND_413 = {2{`RANDOM}};
  fpiu_outPipe_bits_toint = _RAND_413[63:0];
  _RAND_414 = {1{`RANDOM}};
  fpiu_outPipe_bits_exc = _RAND_414[4:0];
  _RAND_415 = {2{`RANDOM}};
  fpiu_outPipe_bits_toint_cmp_unicore = _RAND_415[63:0];
  _RAND_416 = {1{`RANDOM}};
  fpiu_outPipe_bits_u_exception = _RAND_416[6:0];
  _RAND_417 = {1{`RANDOM}};
  fpiu_outPipe_bits_u_flag = _RAND_417[9:0];
  _RAND_418 = {1{`RANDOM}};
  fpiu_outPipe_valid_1 = _RAND_418[0:0];
  _RAND_419 = {2{`RANDOM}};
  fpiu_outPipe_bits_1_toint = _RAND_419[63:0];
  _RAND_420 = {1{`RANDOM}};
  fpiu_outPipe_bits_1_exc = _RAND_420[4:0];
  _RAND_421 = {2{`RANDOM}};
  fpiu_outPipe_bits_1_toint_cmp_unicore = _RAND_421[63:0];
  _RAND_422 = {1{`RANDOM}};
  fpiu_outPipe_bits_1_u_exception = _RAND_422[6:0];
  _RAND_423 = {1{`RANDOM}};
  fpiu_outPipe_bits_1_u_flag = _RAND_423[9:0];
  _RAND_424 = {1{`RANDOM}};
  fpiu_outPipe_valid_2 = _RAND_424[0:0];
  _RAND_425 = {2{`RANDOM}};
  fpiu_outPipe_bits_2_toint = _RAND_425[63:0];
  _RAND_426 = {1{`RANDOM}};
  fpiu_outPipe_bits_2_exc = _RAND_426[4:0];
  _RAND_427 = {2{`RANDOM}};
  fpiu_outPipe_bits_2_toint_cmp_unicore = _RAND_427[63:0];
  _RAND_428 = {1{`RANDOM}};
  fpiu_outPipe_bits_2_u_exception = _RAND_428[6:0];
  _RAND_429 = {1{`RANDOM}};
  fpiu_outPipe_bits_2_u_flag = _RAND_429[9:0];
  _RAND_430 = {1{`RANDOM}};
  v_3 = _RAND_430[0:0];
  _RAND_431 = {1{`RANDOM}};
  b_3 = _RAND_431[0:0];
  _RAND_432 = {1{`RANDOM}};
  outPipe_valid_9 = _RAND_432[0:0];
  _RAND_433 = {1{`RANDOM}};
  outPipe_bits_9 = _RAND_433[0:0];
  _RAND_434 = {1{`RANDOM}};
  outPipe_valid_10 = _RAND_434[0:0];
  _RAND_435 = {1{`RANDOM}};
  outPipe_bits_10 = _RAND_435[0:0];
  _RAND_436 = {1{`RANDOM}};
  outPipe_bits_11 = _RAND_436[0:0];
  _RAND_437 = {1{`RANDOM}};
  v_4 = _RAND_437[0:0];
  _RAND_438 = {1{`RANDOM}};
  b_4 = _RAND_438[0:0];
  _RAND_439 = {1{`RANDOM}};
  outPipe_valid_12 = _RAND_439[0:0];
  _RAND_440 = {1{`RANDOM}};
  outPipe_bits_12 = _RAND_440[0:0];
  _RAND_441 = {1{`RANDOM}};
  outPipe_valid_13 = _RAND_441[0:0];
  _RAND_442 = {1{`RANDOM}};
  outPipe_bits_13 = _RAND_442[0:0];
  _RAND_443 = {1{`RANDOM}};
  outPipe_bits_14 = _RAND_443[0:0];
  _RAND_444 = {1{`RANDOM}};
  value_lo_3 = _RAND_444[4:0];
  _RAND_445 = {1{`RANDOM}};
  value_hi_3 = _RAND_445[26:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
