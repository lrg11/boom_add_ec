module BoomFrontend(
  input         clock,
  input         reset,
  input         auto_icache_master_out_a_ready,
  output        auto_icache_master_out_a_valid,
  output [2:0]  auto_icache_master_out_a_bits_opcode,
  output [2:0]  auto_icache_master_out_a_bits_param,
  output [3:0]  auto_icache_master_out_a_bits_size,
  output        auto_icache_master_out_a_bits_source,
  output [31:0] auto_icache_master_out_a_bits_address,
  output [7:0]  auto_icache_master_out_a_bits_mask,
  output [63:0] auto_icache_master_out_a_bits_data,
  output        auto_icache_master_out_a_bits_corrupt,
  output        auto_icache_master_out_d_ready,
  input         auto_icache_master_out_d_valid,
  input  [2:0]  auto_icache_master_out_d_bits_opcode,
  input  [1:0]  auto_icache_master_out_d_bits_param,
  input  [3:0]  auto_icache_master_out_d_bits_size,
  input         auto_icache_master_out_d_bits_source,
  input  [1:0]  auto_icache_master_out_d_bits_sink,
  input         auto_icache_master_out_d_bits_denied,
  input  [63:0] auto_icache_master_out_d_bits_data,
  input         auto_icache_master_out_d_bits_corrupt,
  input  [31:0] auto_reset_vector_sink_in,
  input         io_cpu_fetchpacket_ready,
  output        io_cpu_fetchpacket_valid,
  output        io_cpu_fetchpacket_bits_uops_0_valid,
  output        io_cpu_fetchpacket_bits_uops_0_bits_switch,
  output        io_cpu_fetchpacket_bits_uops_0_bits_switch_off,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_unicore,
  output [2:0]  io_cpu_fetchpacket_bits_uops_0_bits_shift,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_lrs3_rtype,
  output        io_cpu_fetchpacket_bits_uops_0_bits_rflag,
  output        io_cpu_fetchpacket_bits_uops_0_bits_wflag,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_prflag,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_pwflag,
  output        io_cpu_fetchpacket_bits_uops_0_bits_pflag_busy,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_stale_pflag,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_op1_sel,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_op2_sel,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_split_num,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_self_index,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_rob_inst_idx,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_address_num,
  output [6:0]  io_cpu_fetchpacket_bits_uops_0_bits_uopc,
  output [31:0] io_cpu_fetchpacket_bits_uops_0_bits_inst,
  output [31:0] io_cpu_fetchpacket_bits_uops_0_bits_debug_inst,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_rvc,
  output [39:0] io_cpu_fetchpacket_bits_uops_0_bits_debug_pc,
  output [2:0]  io_cpu_fetchpacket_bits_uops_0_bits_iq_type,
  output [9:0]  io_cpu_fetchpacket_bits_uops_0_bits_fu_code,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_br_type,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op1_sel,
  output [2:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op2_sel,
  output [2:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_imm_sel,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op_fcn,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ctrl_fcn_dw,
  output [2:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_csr_cmd,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_load,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_sta,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_std,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op3_sel,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_iw_state,
  output        io_cpu_fetchpacket_bits_uops_0_bits_iw_p1_poisoned,
  output        io_cpu_fetchpacket_bits_uops_0_bits_iw_p2_poisoned,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_br,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_jalr,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_jal,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_sfb,
  output [11:0] io_cpu_fetchpacket_bits_uops_0_bits_br_mask,
  output [3:0]  io_cpu_fetchpacket_bits_uops_0_bits_br_tag,
  output [4:0]  io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx,
  output        io_cpu_fetchpacket_bits_uops_0_bits_edge_inst,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_pc_lob,
  output        io_cpu_fetchpacket_bits_uops_0_bits_taken,
  output [19:0] io_cpu_fetchpacket_bits_uops_0_bits_imm_packed,
  output [11:0] io_cpu_fetchpacket_bits_uops_0_bits_csr_addr,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_rob_idx,
  output [4:0]  io_cpu_fetchpacket_bits_uops_0_bits_ldq_idx,
  output [4:0]  io_cpu_fetchpacket_bits_uops_0_bits_stq_idx,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_rxq_idx,
  output [6:0]  io_cpu_fetchpacket_bits_uops_0_bits_pdst,
  output [6:0]  io_cpu_fetchpacket_bits_uops_0_bits_prs1,
  output [6:0]  io_cpu_fetchpacket_bits_uops_0_bits_prs2,
  output [6:0]  io_cpu_fetchpacket_bits_uops_0_bits_prs3,
  output [4:0]  io_cpu_fetchpacket_bits_uops_0_bits_ppred,
  output        io_cpu_fetchpacket_bits_uops_0_bits_prs1_busy,
  output        io_cpu_fetchpacket_bits_uops_0_bits_prs2_busy,
  output        io_cpu_fetchpacket_bits_uops_0_bits_prs3_busy,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ppred_busy,
  output [6:0]  io_cpu_fetchpacket_bits_uops_0_bits_stale_pdst,
  output        io_cpu_fetchpacket_bits_uops_0_bits_exception,
  output [63:0] io_cpu_fetchpacket_bits_uops_0_bits_exc_cause,
  output        io_cpu_fetchpacket_bits_uops_0_bits_bypassable,
  output [4:0]  io_cpu_fetchpacket_bits_uops_0_bits_mem_cmd,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_mem_size,
  output        io_cpu_fetchpacket_bits_uops_0_bits_mem_signed,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_fence,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_fencei,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_amo,
  output        io_cpu_fetchpacket_bits_uops_0_bits_uses_ldq,
  output        io_cpu_fetchpacket_bits_uops_0_bits_uses_stq,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_sys_pc2epc,
  output        io_cpu_fetchpacket_bits_uops_0_bits_is_unique,
  output        io_cpu_fetchpacket_bits_uops_0_bits_flush_on_commit,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ldst_is_rs1,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_ldst,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_lrs1,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_lrs2,
  output [5:0]  io_cpu_fetchpacket_bits_uops_0_bits_lrs3,
  output        io_cpu_fetchpacket_bits_uops_0_bits_ldst_val,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_dst_rtype,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_lrs1_rtype,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_lrs2_rtype,
  output        io_cpu_fetchpacket_bits_uops_0_bits_frs3_en,
  output        io_cpu_fetchpacket_bits_uops_0_bits_fp_val,
  output        io_cpu_fetchpacket_bits_uops_0_bits_fp_single,
  output        io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if,
  output        io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if,
  output        io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ma_if,
  output        io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if,
  output        io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc,
  output [1:0]  io_cpu_fetchpacket_bits_uops_0_bits_debug_tsrc,
  output        io_cpu_fetchpacket_bits_uops_1_valid,
  output        io_cpu_fetchpacket_bits_uops_1_bits_switch,
  output        io_cpu_fetchpacket_bits_uops_1_bits_switch_off,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_unicore,
  output [2:0]  io_cpu_fetchpacket_bits_uops_1_bits_shift,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_lrs3_rtype,
  output        io_cpu_fetchpacket_bits_uops_1_bits_rflag,
  output        io_cpu_fetchpacket_bits_uops_1_bits_wflag,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_prflag,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_pwflag,
  output        io_cpu_fetchpacket_bits_uops_1_bits_pflag_busy,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_stale_pflag,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_op1_sel,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_op2_sel,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_split_num,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_self_index,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_rob_inst_idx,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_address_num,
  output [6:0]  io_cpu_fetchpacket_bits_uops_1_bits_uopc,
  output [31:0] io_cpu_fetchpacket_bits_uops_1_bits_inst,
  output [31:0] io_cpu_fetchpacket_bits_uops_1_bits_debug_inst,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_rvc,
  output [39:0] io_cpu_fetchpacket_bits_uops_1_bits_debug_pc,
  output [2:0]  io_cpu_fetchpacket_bits_uops_1_bits_iq_type,
  output [9:0]  io_cpu_fetchpacket_bits_uops_1_bits_fu_code,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_br_type,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op1_sel,
  output [2:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op2_sel,
  output [2:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_imm_sel,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op_fcn,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ctrl_fcn_dw,
  output [2:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_csr_cmd,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_load,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_sta,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_std,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op3_sel,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_iw_state,
  output        io_cpu_fetchpacket_bits_uops_1_bits_iw_p1_poisoned,
  output        io_cpu_fetchpacket_bits_uops_1_bits_iw_p2_poisoned,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_br,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_jalr,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_jal,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_sfb,
  output [11:0] io_cpu_fetchpacket_bits_uops_1_bits_br_mask,
  output [3:0]  io_cpu_fetchpacket_bits_uops_1_bits_br_tag,
  output [4:0]  io_cpu_fetchpacket_bits_uops_1_bits_ftq_idx,
  output        io_cpu_fetchpacket_bits_uops_1_bits_edge_inst,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_pc_lob,
  output        io_cpu_fetchpacket_bits_uops_1_bits_taken,
  output [19:0] io_cpu_fetchpacket_bits_uops_1_bits_imm_packed,
  output [11:0] io_cpu_fetchpacket_bits_uops_1_bits_csr_addr,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_rob_idx,
  output [4:0]  io_cpu_fetchpacket_bits_uops_1_bits_ldq_idx,
  output [4:0]  io_cpu_fetchpacket_bits_uops_1_bits_stq_idx,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_rxq_idx,
  output [6:0]  io_cpu_fetchpacket_bits_uops_1_bits_pdst,
  output [6:0]  io_cpu_fetchpacket_bits_uops_1_bits_prs1,
  output [6:0]  io_cpu_fetchpacket_bits_uops_1_bits_prs2,
  output [6:0]  io_cpu_fetchpacket_bits_uops_1_bits_prs3,
  output [4:0]  io_cpu_fetchpacket_bits_uops_1_bits_ppred,
  output        io_cpu_fetchpacket_bits_uops_1_bits_prs1_busy,
  output        io_cpu_fetchpacket_bits_uops_1_bits_prs2_busy,
  output        io_cpu_fetchpacket_bits_uops_1_bits_prs3_busy,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ppred_busy,
  output [6:0]  io_cpu_fetchpacket_bits_uops_1_bits_stale_pdst,
  output        io_cpu_fetchpacket_bits_uops_1_bits_exception,
  output [63:0] io_cpu_fetchpacket_bits_uops_1_bits_exc_cause,
  output        io_cpu_fetchpacket_bits_uops_1_bits_bypassable,
  output [4:0]  io_cpu_fetchpacket_bits_uops_1_bits_mem_cmd,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_mem_size,
  output        io_cpu_fetchpacket_bits_uops_1_bits_mem_signed,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_fence,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_fencei,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_amo,
  output        io_cpu_fetchpacket_bits_uops_1_bits_uses_ldq,
  output        io_cpu_fetchpacket_bits_uops_1_bits_uses_stq,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_sys_pc2epc,
  output        io_cpu_fetchpacket_bits_uops_1_bits_is_unique,
  output        io_cpu_fetchpacket_bits_uops_1_bits_flush_on_commit,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ldst_is_rs1,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_ldst,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_lrs1,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_lrs2,
  output [5:0]  io_cpu_fetchpacket_bits_uops_1_bits_lrs3,
  output        io_cpu_fetchpacket_bits_uops_1_bits_ldst_val,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_dst_rtype,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_lrs1_rtype,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_lrs2_rtype,
  output        io_cpu_fetchpacket_bits_uops_1_bits_frs3_en,
  output        io_cpu_fetchpacket_bits_uops_1_bits_fp_val,
  output        io_cpu_fetchpacket_bits_uops_1_bits_fp_single,
  output        io_cpu_fetchpacket_bits_uops_1_bits_xcpt_pf_if,
  output        io_cpu_fetchpacket_bits_uops_1_bits_xcpt_ae_if,
  output        io_cpu_fetchpacket_bits_uops_1_bits_xcpt_ma_if,
  output        io_cpu_fetchpacket_bits_uops_1_bits_bp_debug_if,
  output        io_cpu_fetchpacket_bits_uops_1_bits_bp_xcpt_if,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_debug_fsrc,
  output [1:0]  io_cpu_fetchpacket_bits_uops_1_bits_debug_tsrc,
  input  [4:0]  io_cpu_get_pc_0_ftq_idx,
  output        io_cpu_get_pc_0_entry_cfi_idx_valid,
  output [1:0]  io_cpu_get_pc_0_entry_cfi_idx_bits,
  output        io_cpu_get_pc_0_entry_cfi_taken,
  output        io_cpu_get_pc_0_entry_cfi_mispredicted,
  output [2:0]  io_cpu_get_pc_0_entry_cfi_type,
  output [3:0]  io_cpu_get_pc_0_entry_br_mask,
  output        io_cpu_get_pc_0_entry_cfi_is_call,
  output        io_cpu_get_pc_0_entry_cfi_is_ret,
  output        io_cpu_get_pc_0_entry_cfi_npc_plus4,
  output [39:0] io_cpu_get_pc_0_entry_ras_top,
  output [4:0]  io_cpu_get_pc_0_entry_ras_idx,
  output        io_cpu_get_pc_0_entry_start_bank,
  output [15:0] io_cpu_get_pc_0_ghist_old_history,
  output        io_cpu_get_pc_0_ghist_current_saw_branch_not_taken,
  output        io_cpu_get_pc_0_ghist_new_saw_branch_not_taken,
  output        io_cpu_get_pc_0_ghist_new_saw_branch_taken,
  output [4:0]  io_cpu_get_pc_0_ghist_ras_idx,
  output [39:0] io_cpu_get_pc_0_pc,
  output [39:0] io_cpu_get_pc_0_com_pc,
  output        io_cpu_get_pc_0_next_val,
  output [39:0] io_cpu_get_pc_0_next_pc,
  input  [4:0]  io_cpu_get_pc_1_ftq_idx,
  output        io_cpu_get_pc_1_entry_cfi_idx_valid,
  output [1:0]  io_cpu_get_pc_1_entry_cfi_idx_bits,
  output        io_cpu_get_pc_1_entry_cfi_taken,
  output        io_cpu_get_pc_1_entry_cfi_mispredicted,
  output [2:0]  io_cpu_get_pc_1_entry_cfi_type,
  output [3:0]  io_cpu_get_pc_1_entry_br_mask,
  output        io_cpu_get_pc_1_entry_cfi_is_call,
  output        io_cpu_get_pc_1_entry_cfi_is_ret,
  output        io_cpu_get_pc_1_entry_cfi_npc_plus4,
  output [39:0] io_cpu_get_pc_1_entry_ras_top,
  output [4:0]  io_cpu_get_pc_1_entry_ras_idx,
  output        io_cpu_get_pc_1_entry_start_bank,
  output [15:0] io_cpu_get_pc_1_ghist_old_history,
  output        io_cpu_get_pc_1_ghist_current_saw_branch_not_taken,
  output        io_cpu_get_pc_1_ghist_new_saw_branch_not_taken,
  output        io_cpu_get_pc_1_ghist_new_saw_branch_taken,
  output [4:0]  io_cpu_get_pc_1_ghist_ras_idx,
  output [39:0] io_cpu_get_pc_1_pc,
  output [39:0] io_cpu_get_pc_1_com_pc,
  output        io_cpu_get_pc_1_next_val,
  output [39:0] io_cpu_get_pc_1_next_pc,
  input  [4:0]  io_cpu_get_pc_2_ftq_idx,
  output        io_cpu_get_pc_2_entry_cfi_idx_valid,
  output [1:0]  io_cpu_get_pc_2_entry_cfi_idx_bits,
  output        io_cpu_get_pc_2_entry_cfi_taken,
  output        io_cpu_get_pc_2_entry_cfi_mispredicted,
  output [2:0]  io_cpu_get_pc_2_entry_cfi_type,
  output [3:0]  io_cpu_get_pc_2_entry_br_mask,
  output        io_cpu_get_pc_2_entry_cfi_is_call,
  output        io_cpu_get_pc_2_entry_cfi_is_ret,
  output        io_cpu_get_pc_2_entry_cfi_npc_plus4,
  output [39:0] io_cpu_get_pc_2_entry_ras_top,
  output [4:0]  io_cpu_get_pc_2_entry_ras_idx,
  output        io_cpu_get_pc_2_entry_start_bank,
  output [15:0] io_cpu_get_pc_2_ghist_old_history,
  output        io_cpu_get_pc_2_ghist_current_saw_branch_not_taken,
  output        io_cpu_get_pc_2_ghist_new_saw_branch_not_taken,
  output        io_cpu_get_pc_2_ghist_new_saw_branch_taken,
  output [4:0]  io_cpu_get_pc_2_ghist_ras_idx,
  output [39:0] io_cpu_get_pc_2_pc,
  output [39:0] io_cpu_get_pc_2_com_pc,
  output        io_cpu_get_pc_2_next_val,
  output [39:0] io_cpu_get_pc_2_next_pc,
  input  [4:0]  io_cpu_get_pc_3_ftq_idx,
  output        io_cpu_get_pc_3_entry_cfi_idx_valid,
  output [1:0]  io_cpu_get_pc_3_entry_cfi_idx_bits,
  output        io_cpu_get_pc_3_entry_cfi_taken,
  output        io_cpu_get_pc_3_entry_cfi_mispredicted,
  output [2:0]  io_cpu_get_pc_3_entry_cfi_type,
  output [3:0]  io_cpu_get_pc_3_entry_br_mask,
  output        io_cpu_get_pc_3_entry_cfi_is_call,
  output        io_cpu_get_pc_3_entry_cfi_is_ret,
  output        io_cpu_get_pc_3_entry_cfi_npc_plus4,
  output [39:0] io_cpu_get_pc_3_entry_ras_top,
  output [4:0]  io_cpu_get_pc_3_entry_ras_idx,
  output        io_cpu_get_pc_3_entry_start_bank,
  output [15:0] io_cpu_get_pc_3_ghist_old_history,
  output        io_cpu_get_pc_3_ghist_current_saw_branch_not_taken,
  output        io_cpu_get_pc_3_ghist_new_saw_branch_not_taken,
  output        io_cpu_get_pc_3_ghist_new_saw_branch_taken,
  output [4:0]  io_cpu_get_pc_3_ghist_ras_idx,
  output [39:0] io_cpu_get_pc_3_pc,
  output [39:0] io_cpu_get_pc_3_com_pc,
  output        io_cpu_get_pc_3_next_val,
  output [39:0] io_cpu_get_pc_3_next_pc,
  input  [4:0]  io_cpu_debug_ftq_idx_0,
  input  [4:0]  io_cpu_debug_ftq_idx_1,
  output [39:0] io_cpu_debug_fetch_pc_0,
  output [39:0] io_cpu_debug_fetch_pc_1,
  input         io_cpu_status_debug,
  input         io_cpu_status_cease,
  input         io_cpu_status_wfi,
  input  [31:0] io_cpu_status_isa,
  input  [1:0]  io_cpu_status_dprv,
  input  [1:0]  io_cpu_status_prv,
  input         io_cpu_status_sd,
  input  [26:0] io_cpu_status_zero2,
  input  [1:0]  io_cpu_status_sxl,
  input  [1:0]  io_cpu_status_uxl,
  input         io_cpu_status_sd_rv32,
  input  [7:0]  io_cpu_status_zero1,
  input         io_cpu_status_tsr,
  input         io_cpu_status_tw,
  input         io_cpu_status_tvm,
  input         io_cpu_status_mxr,
  input         io_cpu_status_sum,
  input         io_cpu_status_mprv,
  input  [1:0]  io_cpu_status_xs,
  input  [1:0]  io_cpu_status_fs,
  input  [1:0]  io_cpu_status_mpp,
  input  [1:0]  io_cpu_status_vs,
  input         io_cpu_status_spp,
  input         io_cpu_status_mpie,
  input         io_cpu_status_hpie,
  input         io_cpu_status_spie,
  input         io_cpu_status_upie,
  input         io_cpu_status_mie,
  input         io_cpu_status_hie,
  input         io_cpu_status_sie,
  input         io_cpu_status_uie,
  input         io_cpu_sfence_valid,
  input         io_cpu_sfence_bits_rs1,
  input         io_cpu_sfence_bits_rs2,
  input  [38:0] io_cpu_sfence_bits_addr,
  input         io_cpu_sfence_bits_asid,
  input  [11:0] io_cpu_brupdate_b1_resolve_mask,
  input  [11:0] io_cpu_brupdate_b1_mispredict_mask,
  input         io_cpu_brupdate_b2_uop_switch,
  input         io_cpu_brupdate_b2_uop_switch_off,
  input         io_cpu_brupdate_b2_uop_is_unicore,
  input  [2:0]  io_cpu_brupdate_b2_uop_shift,
  input  [1:0]  io_cpu_brupdate_b2_uop_lrs3_rtype,
  input         io_cpu_brupdate_b2_uop_rflag,
  input         io_cpu_brupdate_b2_uop_wflag,
  input  [3:0]  io_cpu_brupdate_b2_uop_prflag,
  input  [3:0]  io_cpu_brupdate_b2_uop_pwflag,
  input         io_cpu_brupdate_b2_uop_pflag_busy,
  input  [3:0]  io_cpu_brupdate_b2_uop_stale_pflag,
  input  [3:0]  io_cpu_brupdate_b2_uop_op1_sel,
  input  [3:0]  io_cpu_brupdate_b2_uop_op2_sel,
  input  [5:0]  io_cpu_brupdate_b2_uop_split_num,
  input  [5:0]  io_cpu_brupdate_b2_uop_self_index,
  input  [5:0]  io_cpu_brupdate_b2_uop_rob_inst_idx,
  input  [5:0]  io_cpu_brupdate_b2_uop_address_num,
  input  [6:0]  io_cpu_brupdate_b2_uop_uopc,
  input  [31:0] io_cpu_brupdate_b2_uop_inst,
  input  [31:0] io_cpu_brupdate_b2_uop_debug_inst,
  input         io_cpu_brupdate_b2_uop_is_rvc,
  input  [39:0] io_cpu_brupdate_b2_uop_debug_pc,
  input  [2:0]  io_cpu_brupdate_b2_uop_iq_type,
  input  [9:0]  io_cpu_brupdate_b2_uop_fu_code,
  input  [3:0]  io_cpu_brupdate_b2_uop_ctrl_br_type,
  input  [1:0]  io_cpu_brupdate_b2_uop_ctrl_op1_sel,
  input  [2:0]  io_cpu_brupdate_b2_uop_ctrl_op2_sel,
  input  [2:0]  io_cpu_brupdate_b2_uop_ctrl_imm_sel,
  input  [3:0]  io_cpu_brupdate_b2_uop_ctrl_op_fcn,
  input         io_cpu_brupdate_b2_uop_ctrl_fcn_dw,
  input  [2:0]  io_cpu_brupdate_b2_uop_ctrl_csr_cmd,
  input         io_cpu_brupdate_b2_uop_ctrl_is_load,
  input         io_cpu_brupdate_b2_uop_ctrl_is_sta,
  input         io_cpu_brupdate_b2_uop_ctrl_is_std,
  input  [1:0]  io_cpu_brupdate_b2_uop_ctrl_op3_sel,
  input  [1:0]  io_cpu_brupdate_b2_uop_iw_state,
  input         io_cpu_brupdate_b2_uop_iw_p1_poisoned,
  input         io_cpu_brupdate_b2_uop_iw_p2_poisoned,
  input         io_cpu_brupdate_b2_uop_is_br,
  input         io_cpu_brupdate_b2_uop_is_jalr,
  input         io_cpu_brupdate_b2_uop_is_jal,
  input         io_cpu_brupdate_b2_uop_is_sfb,
  input  [11:0] io_cpu_brupdate_b2_uop_br_mask,
  input  [3:0]  io_cpu_brupdate_b2_uop_br_tag,
  input  [4:0]  io_cpu_brupdate_b2_uop_ftq_idx,
  input         io_cpu_brupdate_b2_uop_edge_inst,
  input  [5:0]  io_cpu_brupdate_b2_uop_pc_lob,
  input         io_cpu_brupdate_b2_uop_taken,
  input  [19:0] io_cpu_brupdate_b2_uop_imm_packed,
  input  [11:0] io_cpu_brupdate_b2_uop_csr_addr,
  input  [5:0]  io_cpu_brupdate_b2_uop_rob_idx,
  input  [4:0]  io_cpu_brupdate_b2_uop_ldq_idx,
  input  [4:0]  io_cpu_brupdate_b2_uop_stq_idx,
  input  [1:0]  io_cpu_brupdate_b2_uop_rxq_idx,
  input  [6:0]  io_cpu_brupdate_b2_uop_pdst,
  input  [6:0]  io_cpu_brupdate_b2_uop_prs1,
  input  [6:0]  io_cpu_brupdate_b2_uop_prs2,
  input  [6:0]  io_cpu_brupdate_b2_uop_prs3,
  input  [4:0]  io_cpu_brupdate_b2_uop_ppred,
  input         io_cpu_brupdate_b2_uop_prs1_busy,
  input         io_cpu_brupdate_b2_uop_prs2_busy,
  input         io_cpu_brupdate_b2_uop_prs3_busy,
  input         io_cpu_brupdate_b2_uop_ppred_busy,
  input  [6:0]  io_cpu_brupdate_b2_uop_stale_pdst,
  input         io_cpu_brupdate_b2_uop_exception,
  input  [63:0] io_cpu_brupdate_b2_uop_exc_cause,
  input         io_cpu_brupdate_b2_uop_bypassable,
  input  [4:0]  io_cpu_brupdate_b2_uop_mem_cmd,
  input  [1:0]  io_cpu_brupdate_b2_uop_mem_size,
  input         io_cpu_brupdate_b2_uop_mem_signed,
  input         io_cpu_brupdate_b2_uop_is_fence,
  input         io_cpu_brupdate_b2_uop_is_fencei,
  input         io_cpu_brupdate_b2_uop_is_amo,
  input         io_cpu_brupdate_b2_uop_uses_ldq,
  input         io_cpu_brupdate_b2_uop_uses_stq,
  input         io_cpu_brupdate_b2_uop_is_sys_pc2epc,
  input         io_cpu_brupdate_b2_uop_is_unique,
  input         io_cpu_brupdate_b2_uop_flush_on_commit,
  input         io_cpu_brupdate_b2_uop_ldst_is_rs1,
  input  [5:0]  io_cpu_brupdate_b2_uop_ldst,
  input  [5:0]  io_cpu_brupdate_b2_uop_lrs1,
  input  [5:0]  io_cpu_brupdate_b2_uop_lrs2,
  input  [5:0]  io_cpu_brupdate_b2_uop_lrs3,
  input         io_cpu_brupdate_b2_uop_ldst_val,
  input  [1:0]  io_cpu_brupdate_b2_uop_dst_rtype,
  input  [1:0]  io_cpu_brupdate_b2_uop_lrs1_rtype,
  input  [1:0]  io_cpu_brupdate_b2_uop_lrs2_rtype,
  input         io_cpu_brupdate_b2_uop_frs3_en,
  input         io_cpu_brupdate_b2_uop_fp_val,
  input         io_cpu_brupdate_b2_uop_fp_single,
  input         io_cpu_brupdate_b2_uop_xcpt_pf_if,
  input         io_cpu_brupdate_b2_uop_xcpt_ae_if,
  input         io_cpu_brupdate_b2_uop_xcpt_ma_if,
  input         io_cpu_brupdate_b2_uop_bp_debug_if,
  input         io_cpu_brupdate_b2_uop_bp_xcpt_if,
  input  [1:0]  io_cpu_brupdate_b2_uop_debug_fsrc,
  input  [1:0]  io_cpu_brupdate_b2_uop_debug_tsrc,
  input         io_cpu_brupdate_b2_valid,
  input         io_cpu_brupdate_b2_mispredict,
  input         io_cpu_brupdate_b2_taken,
  input  [2:0]  io_cpu_brupdate_b2_cfi_type,
  input  [1:0]  io_cpu_brupdate_b2_pc_sel,
  input  [39:0] io_cpu_brupdate_b2_jalr_target,
  input  [31:0] io_cpu_brupdate_b2_target_offset,
  input         io_cpu_redirect_flush,
  input         io_cpu_redirect_val,
  input  [63:0] io_cpu_redirect_pc,
  input  [4:0]  io_cpu_redirect_ftq_idx,
  input  [15:0] io_cpu_redirect_ghist_old_history,
  input         io_cpu_redirect_ghist_current_saw_branch_not_taken,
  input         io_cpu_redirect_ghist_new_saw_branch_not_taken,
  input         io_cpu_redirect_ghist_new_saw_branch_taken,
  input  [4:0]  io_cpu_redirect_ghist_ras_idx,
  input         io_cpu_commit_valid,
  input  [31:0] io_cpu_commit_bits,
  input         io_cpu_flush_icache,
  output        io_cpu_perf_acquire,
  output        io_cpu_perf_tlbMiss,
  input         io_cpu_is_unicore,
  input         io_ptw_req_ready,
  output        io_ptw_req_valid,
  output        io_ptw_req_bits_valid,
  output [26:0] io_ptw_req_bits_bits_addr,
  input         io_ptw_resp_valid,
  input         io_ptw_resp_bits_ae,
  input  [53:0] io_ptw_resp_bits_pte_ppn,
  input  [1:0]  io_ptw_resp_bits_pte_reserved_for_software,
  input         io_ptw_resp_bits_pte_d,
  input         io_ptw_resp_bits_pte_a,
  input         io_ptw_resp_bits_pte_g,
  input         io_ptw_resp_bits_pte_u,
  input         io_ptw_resp_bits_pte_x,
  input         io_ptw_resp_bits_pte_w,
  input         io_ptw_resp_bits_pte_r,
  input         io_ptw_resp_bits_pte_v,
  input  [1:0]  io_ptw_resp_bits_level,
  input         io_ptw_resp_bits_fragmented_superpage,
  input         io_ptw_resp_bits_homogeneous,
  input  [3:0]  io_ptw_ptbr_mode,
  input  [15:0] io_ptw_ptbr_asid,
  input  [43:0] io_ptw_ptbr_ppn,
  input         io_ptw_status_debug,
  input         io_ptw_status_cease,
  input         io_ptw_status_wfi,
  input  [31:0] io_ptw_status_isa,
  input  [1:0]  io_ptw_status_dprv,
  input  [1:0]  io_ptw_status_prv,
  input         io_ptw_status_sd,
  input  [26:0] io_ptw_status_zero2,
  input  [1:0]  io_ptw_status_sxl,
  input  [1:0]  io_ptw_status_uxl,
  input         io_ptw_status_sd_rv32,
  input  [7:0]  io_ptw_status_zero1,
  input         io_ptw_status_tsr,
  input         io_ptw_status_tw,
  input         io_ptw_status_tvm,
  input         io_ptw_status_mxr,
  input         io_ptw_status_sum,
  input         io_ptw_status_mprv,
  input  [1:0]  io_ptw_status_xs,
  input  [1:0]  io_ptw_status_fs,
  input  [1:0]  io_ptw_status_mpp,
  input  [1:0]  io_ptw_status_vs,
  input         io_ptw_status_spp,
  input         io_ptw_status_mpie,
  input         io_ptw_status_hpie,
  input         io_ptw_status_spie,
  input         io_ptw_status_upie,
  input         io_ptw_status_mie,
  input         io_ptw_status_hie,
  input         io_ptw_status_sie,
  input         io_ptw_status_uie,
  input         io_ptw_pmp_0_cfg_l,
  input  [1:0]  io_ptw_pmp_0_cfg_res,
  input  [1:0]  io_ptw_pmp_0_cfg_a,
  input         io_ptw_pmp_0_cfg_x,
  input         io_ptw_pmp_0_cfg_w,
  input         io_ptw_pmp_0_cfg_r,
  input  [29:0] io_ptw_pmp_0_addr,
  input  [31:0] io_ptw_pmp_0_mask,
  input         io_ptw_pmp_1_cfg_l,
  input  [1:0]  io_ptw_pmp_1_cfg_res,
  input  [1:0]  io_ptw_pmp_1_cfg_a,
  input         io_ptw_pmp_1_cfg_x,
  input         io_ptw_pmp_1_cfg_w,
  input         io_ptw_pmp_1_cfg_r,
  input  [29:0] io_ptw_pmp_1_addr,
  input  [31:0] io_ptw_pmp_1_mask,
  input         io_ptw_pmp_2_cfg_l,
  input  [1:0]  io_ptw_pmp_2_cfg_res,
  input  [1:0]  io_ptw_pmp_2_cfg_a,
  input         io_ptw_pmp_2_cfg_x,
  input         io_ptw_pmp_2_cfg_w,
  input         io_ptw_pmp_2_cfg_r,
  input  [29:0] io_ptw_pmp_2_addr,
  input  [31:0] io_ptw_pmp_2_mask,
  input         io_ptw_pmp_3_cfg_l,
  input  [1:0]  io_ptw_pmp_3_cfg_res,
  input  [1:0]  io_ptw_pmp_3_cfg_a,
  input         io_ptw_pmp_3_cfg_x,
  input         io_ptw_pmp_3_cfg_w,
  input         io_ptw_pmp_3_cfg_r,
  input  [29:0] io_ptw_pmp_3_addr,
  input  [31:0] io_ptw_pmp_3_mask,
  input         io_ptw_pmp_4_cfg_l,
  input  [1:0]  io_ptw_pmp_4_cfg_res,
  input  [1:0]  io_ptw_pmp_4_cfg_a,
  input         io_ptw_pmp_4_cfg_x,
  input         io_ptw_pmp_4_cfg_w,
  input         io_ptw_pmp_4_cfg_r,
  input  [29:0] io_ptw_pmp_4_addr,
  input  [31:0] io_ptw_pmp_4_mask,
  input         io_ptw_pmp_5_cfg_l,
  input  [1:0]  io_ptw_pmp_5_cfg_res,
  input  [1:0]  io_ptw_pmp_5_cfg_a,
  input         io_ptw_pmp_5_cfg_x,
  input         io_ptw_pmp_5_cfg_w,
  input         io_ptw_pmp_5_cfg_r,
  input  [29:0] io_ptw_pmp_5_addr,
  input  [31:0] io_ptw_pmp_5_mask,
  input         io_ptw_pmp_6_cfg_l,
  input  [1:0]  io_ptw_pmp_6_cfg_res,
  input  [1:0]  io_ptw_pmp_6_cfg_a,
  input         io_ptw_pmp_6_cfg_x,
  input         io_ptw_pmp_6_cfg_w,
  input         io_ptw_pmp_6_cfg_r,
  input  [29:0] io_ptw_pmp_6_addr,
  input  [31:0] io_ptw_pmp_6_mask,
  input         io_ptw_pmp_7_cfg_l,
  input  [1:0]  io_ptw_pmp_7_cfg_res,
  input  [1:0]  io_ptw_pmp_7_cfg_a,
  input         io_ptw_pmp_7_cfg_x,
  input         io_ptw_pmp_7_cfg_w,
  input         io_ptw_pmp_7_cfg_r,
  input  [29:0] io_ptw_pmp_7_addr,
  input  [31:0] io_ptw_pmp_7_mask,
  input         io_ptw_customCSRs_csrs_0_wen,
  input  [63:0] io_ptw_customCSRs_csrs_0_wdata,
  input  [63:0] io_ptw_customCSRs_csrs_0_value,
  output        io_errors_bus_valid,
  output [31:0] io_errors_bus_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
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
  reg [63:0] _RAND_12;
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
`endif // RANDOMIZE_REG_INIT
  wire  icache_clock; // @[frontend.scala 303:26]
  wire  icache_reset; // @[frontend.scala 303:26]
  wire  icache_auto_master_out_a_ready; // @[frontend.scala 303:26]
  wire  icache_auto_master_out_a_valid; // @[frontend.scala 303:26]
  wire [2:0] icache_auto_master_out_a_bits_opcode; // @[frontend.scala 303:26]
  wire [2:0] icache_auto_master_out_a_bits_param; // @[frontend.scala 303:26]
  wire [3:0] icache_auto_master_out_a_bits_size; // @[frontend.scala 303:26]
  wire  icache_auto_master_out_a_bits_source; // @[frontend.scala 303:26]
  wire [31:0] icache_auto_master_out_a_bits_address; // @[frontend.scala 303:26]
  wire [7:0] icache_auto_master_out_a_bits_mask; // @[frontend.scala 303:26]
  wire [63:0] icache_auto_master_out_a_bits_data; // @[frontend.scala 303:26]
  wire  icache_auto_master_out_a_bits_corrupt; // @[frontend.scala 303:26]
  wire  icache_auto_master_out_d_ready; // @[frontend.scala 303:26]
  wire  icache_auto_master_out_d_valid; // @[frontend.scala 303:26]
  wire [2:0] icache_auto_master_out_d_bits_opcode; // @[frontend.scala 303:26]
  wire [1:0] icache_auto_master_out_d_bits_param; // @[frontend.scala 303:26]
  wire [3:0] icache_auto_master_out_d_bits_size; // @[frontend.scala 303:26]
  wire  icache_auto_master_out_d_bits_source; // @[frontend.scala 303:26]
  wire [1:0] icache_auto_master_out_d_bits_sink; // @[frontend.scala 303:26]
  wire  icache_auto_master_out_d_bits_denied; // @[frontend.scala 303:26]
  wire [63:0] icache_auto_master_out_d_bits_data; // @[frontend.scala 303:26]
  wire  icache_auto_master_out_d_bits_corrupt; // @[frontend.scala 303:26]
  wire  icache_io_req_ready; // @[frontend.scala 303:26]
  wire  icache_io_req_valid; // @[frontend.scala 303:26]
  wire [38:0] icache_io_req_bits_addr; // @[frontend.scala 303:26]
  wire [31:0] icache_io_s1_paddr; // @[frontend.scala 303:26]
  wire  icache_io_s1_kill; // @[frontend.scala 303:26]
  wire  icache_io_s2_kill; // @[frontend.scala 303:26]
  wire  icache_io_s2_prefetch; // @[frontend.scala 303:26]
  wire  icache_io_resp_valid; // @[frontend.scala 303:26]
  wire [63:0] icache_io_resp_bits_data; // @[frontend.scala 303:26]
  wire  icache_io_resp_bits_replay; // @[frontend.scala 303:26]
  wire  icache_io_resp_bits_ae; // @[frontend.scala 303:26]
  wire  icache_io_invalidate; // @[frontend.scala 303:26]
  wire  icache_io_perf_acquire; // @[frontend.scala 303:26]
  wire  bpd_clock; // @[frontend.scala 336:19]
  wire  bpd_reset; // @[frontend.scala 336:19]
  wire  bpd_io_f0_req_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_f0_req_bits_pc; // @[frontend.scala 336:19]
  wire [15:0] bpd_io_f0_req_bits_ghist_old_history; // @[frontend.scala 336:19]
  wire  bpd_io_f0_req_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 336:19]
  wire  bpd_io_f0_req_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 336:19]
  wire  bpd_io_f0_req_bits_ghist_new_saw_branch_taken; // @[frontend.scala 336:19]
  wire [4:0] bpd_io_f0_req_bits_ghist_ras_idx; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f1_pc; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_0_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_0_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_0_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_0_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f1_preds_0_predicted_pc_bits; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_1_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_1_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_1_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_1_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f1_preds_1_predicted_pc_bits; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_2_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_2_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_2_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_2_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f1_preds_2_predicted_pc_bits; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_3_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_3_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_3_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_preds_3_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f1_preds_3_predicted_pc_bits; // @[frontend.scala 336:19]
  wire [44:0] bpd_io_resp_f1_meta_0; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f1_lhist_0; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f2_pc; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_0_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_0_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_0_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_0_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f2_preds_0_predicted_pc_bits; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_1_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_1_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_1_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_1_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f2_preds_1_predicted_pc_bits; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_2_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_2_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_2_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_2_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f2_preds_2_predicted_pc_bits; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_3_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_3_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_3_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_preds_3_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f2_preds_3_predicted_pc_bits; // @[frontend.scala 336:19]
  wire [44:0] bpd_io_resp_f2_meta_0; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f2_lhist_0; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f3_pc; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_0_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_0_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_0_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_0_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f3_preds_0_predicted_pc_bits; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_1_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_1_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_1_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_1_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f3_preds_1_predicted_pc_bits; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_2_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_2_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_2_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_2_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f3_preds_2_predicted_pc_bits; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_3_taken; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_3_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_3_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_preds_3_predicted_pc_valid; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_resp_f3_preds_3_predicted_pc_bits; // @[frontend.scala 336:19]
  wire [44:0] bpd_io_resp_f3_meta_0; // @[frontend.scala 336:19]
  wire  bpd_io_resp_f3_lhist_0; // @[frontend.scala 336:19]
  wire  bpd_io_f3_fire; // @[frontend.scala 336:19]
  wire  bpd_io_update_valid; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_is_mispredict_update; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_is_repair_update; // @[frontend.scala 336:19]
  wire [3:0] bpd_io_update_bits_btb_mispredicts; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_update_bits_pc; // @[frontend.scala 336:19]
  wire [3:0] bpd_io_update_bits_br_mask; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_cfi_idx_valid; // @[frontend.scala 336:19]
  wire [1:0] bpd_io_update_bits_cfi_idx_bits; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_cfi_taken; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_cfi_mispredicted; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_cfi_is_br; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_cfi_is_jal; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_cfi_is_jalr; // @[frontend.scala 336:19]
  wire [15:0] bpd_io_update_bits_ghist_old_history; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_ghist_new_saw_branch_taken; // @[frontend.scala 336:19]
  wire [4:0] bpd_io_update_bits_ghist_ras_idx; // @[frontend.scala 336:19]
  wire  bpd_io_update_bits_lhist_0; // @[frontend.scala 336:19]
  wire [39:0] bpd_io_update_bits_target; // @[frontend.scala 336:19]
  wire [44:0] bpd_io_update_bits_meta_0; // @[frontend.scala 336:19]
  wire  ras_clock; // @[frontend.scala 338:19]
  wire  ras_reset; // @[frontend.scala 338:19]
  wire [4:0] ras_io_read_idx; // @[frontend.scala 338:19]
  wire [39:0] ras_io_read_addr; // @[frontend.scala 338:19]
  wire  ras_io_write_valid; // @[frontend.scala 338:19]
  wire [4:0] ras_io_write_idx; // @[frontend.scala 338:19]
  wire [39:0] ras_io_write_addr; // @[frontend.scala 338:19]
  wire  tlb_clock; // @[frontend.scala 342:19]
  wire  tlb_reset; // @[frontend.scala 342:19]
  wire  tlb_io_req_ready; // @[frontend.scala 342:19]
  wire  tlb_io_req_valid; // @[frontend.scala 342:19]
  wire [39:0] tlb_io_req_bits_vaddr; // @[frontend.scala 342:19]
  wire  tlb_io_req_bits_passthrough; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_req_bits_size; // @[frontend.scala 342:19]
  wire [4:0] tlb_io_req_bits_cmd; // @[frontend.scala 342:19]
  wire  tlb_io_resp_miss; // @[frontend.scala 342:19]
  wire [31:0] tlb_io_resp_paddr; // @[frontend.scala 342:19]
  wire  tlb_io_resp_pf_ld; // @[frontend.scala 342:19]
  wire  tlb_io_resp_pf_st; // @[frontend.scala 342:19]
  wire  tlb_io_resp_pf_inst; // @[frontend.scala 342:19]
  wire  tlb_io_resp_ae_ld; // @[frontend.scala 342:19]
  wire  tlb_io_resp_ae_st; // @[frontend.scala 342:19]
  wire  tlb_io_resp_ae_inst; // @[frontend.scala 342:19]
  wire  tlb_io_resp_ma_ld; // @[frontend.scala 342:19]
  wire  tlb_io_resp_ma_st; // @[frontend.scala 342:19]
  wire  tlb_io_resp_ma_inst; // @[frontend.scala 342:19]
  wire  tlb_io_resp_cacheable; // @[frontend.scala 342:19]
  wire  tlb_io_resp_must_alloc; // @[frontend.scala 342:19]
  wire  tlb_io_resp_prefetchable; // @[frontend.scala 342:19]
  wire  tlb_io_sfence_valid; // @[frontend.scala 342:19]
  wire  tlb_io_sfence_bits_rs1; // @[frontend.scala 342:19]
  wire  tlb_io_sfence_bits_rs2; // @[frontend.scala 342:19]
  wire [38:0] tlb_io_sfence_bits_addr; // @[frontend.scala 342:19]
  wire  tlb_io_sfence_bits_asid; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_req_ready; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_req_valid; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_req_bits_valid; // @[frontend.scala 342:19]
  wire [26:0] tlb_io_ptw_req_bits_bits_addr; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_valid; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_bits_ae; // @[frontend.scala 342:19]
  wire [53:0] tlb_io_ptw_resp_bits_pte_ppn; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_resp_bits_pte_reserved_for_software; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_bits_pte_d; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_bits_pte_a; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_bits_pte_g; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_bits_pte_u; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_bits_pte_x; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_bits_pte_w; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_bits_pte_r; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_bits_pte_v; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_resp_bits_level; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_bits_fragmented_superpage; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_resp_bits_homogeneous; // @[frontend.scala 342:19]
  wire [3:0] tlb_io_ptw_ptbr_mode; // @[frontend.scala 342:19]
  wire [15:0] tlb_io_ptw_ptbr_asid; // @[frontend.scala 342:19]
  wire [43:0] tlb_io_ptw_ptbr_ppn; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_debug; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_cease; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_wfi; // @[frontend.scala 342:19]
  wire [31:0] tlb_io_ptw_status_isa; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_status_dprv; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_status_prv; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_sd; // @[frontend.scala 342:19]
  wire [26:0] tlb_io_ptw_status_zero2; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_status_sxl; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_status_uxl; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_sd_rv32; // @[frontend.scala 342:19]
  wire [7:0] tlb_io_ptw_status_zero1; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_tsr; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_tw; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_tvm; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_mxr; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_sum; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_mprv; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_status_xs; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_status_fs; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_status_mpp; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_status_vs; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_spp; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_mpie; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_hpie; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_spie; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_upie; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_mie; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_hie; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_sie; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_status_uie; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_0_cfg_l; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_0_cfg_res; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_0_cfg_a; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_0_cfg_x; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_0_cfg_w; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_0_cfg_r; // @[frontend.scala 342:19]
  wire [29:0] tlb_io_ptw_pmp_0_addr; // @[frontend.scala 342:19]
  wire [31:0] tlb_io_ptw_pmp_0_mask; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_1_cfg_l; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_1_cfg_res; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_1_cfg_a; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_1_cfg_x; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_1_cfg_w; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_1_cfg_r; // @[frontend.scala 342:19]
  wire [29:0] tlb_io_ptw_pmp_1_addr; // @[frontend.scala 342:19]
  wire [31:0] tlb_io_ptw_pmp_1_mask; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_2_cfg_l; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_2_cfg_res; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_2_cfg_a; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_2_cfg_x; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_2_cfg_w; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_2_cfg_r; // @[frontend.scala 342:19]
  wire [29:0] tlb_io_ptw_pmp_2_addr; // @[frontend.scala 342:19]
  wire [31:0] tlb_io_ptw_pmp_2_mask; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_3_cfg_l; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_3_cfg_res; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_3_cfg_a; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_3_cfg_x; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_3_cfg_w; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_3_cfg_r; // @[frontend.scala 342:19]
  wire [29:0] tlb_io_ptw_pmp_3_addr; // @[frontend.scala 342:19]
  wire [31:0] tlb_io_ptw_pmp_3_mask; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_4_cfg_l; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_4_cfg_res; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_4_cfg_a; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_4_cfg_x; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_4_cfg_w; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_4_cfg_r; // @[frontend.scala 342:19]
  wire [29:0] tlb_io_ptw_pmp_4_addr; // @[frontend.scala 342:19]
  wire [31:0] tlb_io_ptw_pmp_4_mask; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_5_cfg_l; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_5_cfg_res; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_5_cfg_a; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_5_cfg_x; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_5_cfg_w; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_5_cfg_r; // @[frontend.scala 342:19]
  wire [29:0] tlb_io_ptw_pmp_5_addr; // @[frontend.scala 342:19]
  wire [31:0] tlb_io_ptw_pmp_5_mask; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_6_cfg_l; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_6_cfg_res; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_6_cfg_a; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_6_cfg_x; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_6_cfg_w; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_6_cfg_r; // @[frontend.scala 342:19]
  wire [29:0] tlb_io_ptw_pmp_6_addr; // @[frontend.scala 342:19]
  wire [31:0] tlb_io_ptw_pmp_6_mask; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_7_cfg_l; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_7_cfg_res; // @[frontend.scala 342:19]
  wire [1:0] tlb_io_ptw_pmp_7_cfg_a; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_7_cfg_x; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_7_cfg_w; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_pmp_7_cfg_r; // @[frontend.scala 342:19]
  wire [29:0] tlb_io_ptw_pmp_7_addr; // @[frontend.scala 342:19]
  wire [31:0] tlb_io_ptw_pmp_7_mask; // @[frontend.scala 342:19]
  wire  tlb_io_ptw_customCSRs_csrs_0_wen; // @[frontend.scala 342:19]
  wire [63:0] tlb_io_ptw_customCSRs_csrs_0_wdata; // @[frontend.scala 342:19]
  wire [63:0] tlb_io_ptw_customCSRs_csrs_0_value; // @[frontend.scala 342:19]
  wire  tlb_io_kill; // @[frontend.scala 342:19]
  wire  f3_clock; // @[frontend.scala 519:11]
  wire  f3_reset; // @[frontend.scala 519:11]
  wire  f3_io_enq_ready; // @[frontend.scala 519:11]
  wire  f3_io_enq_valid; // @[frontend.scala 519:11]
  wire [39:0] f3_io_enq_bits_pc; // @[frontend.scala 519:11]
  wire [63:0] f3_io_enq_bits_data; // @[frontend.scala 519:11]
  wire [3:0] f3_io_enq_bits_mask; // @[frontend.scala 519:11]
  wire  f3_io_enq_bits_xcpt_pf_inst; // @[frontend.scala 519:11]
  wire  f3_io_enq_bits_xcpt_ae_inst; // @[frontend.scala 519:11]
  wire [15:0] f3_io_enq_bits_ghist_old_history; // @[frontend.scala 519:11]
  wire  f3_io_enq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 519:11]
  wire  f3_io_enq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 519:11]
  wire  f3_io_enq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 519:11]
  wire [4:0] f3_io_enq_bits_ghist_ras_idx; // @[frontend.scala 519:11]
  wire [1:0] f3_io_enq_bits_fsrc; // @[frontend.scala 519:11]
  wire [1:0] f3_io_enq_bits_tsrc; // @[frontend.scala 519:11]
  wire  f3_io_deq_ready; // @[frontend.scala 519:11]
  wire  f3_io_deq_valid; // @[frontend.scala 519:11]
  wire [39:0] f3_io_deq_bits_pc; // @[frontend.scala 519:11]
  wire [63:0] f3_io_deq_bits_data; // @[frontend.scala 519:11]
  wire [3:0] f3_io_deq_bits_mask; // @[frontend.scala 519:11]
  wire  f3_io_deq_bits_xcpt_pf_inst; // @[frontend.scala 519:11]
  wire  f3_io_deq_bits_xcpt_ae_inst; // @[frontend.scala 519:11]
  wire [15:0] f3_io_deq_bits_ghist_old_history; // @[frontend.scala 519:11]
  wire  f3_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 519:11]
  wire  f3_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 519:11]
  wire  f3_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 519:11]
  wire [4:0] f3_io_deq_bits_ghist_ras_idx; // @[frontend.scala 519:11]
  wire [1:0] f3_io_deq_bits_fsrc; // @[frontend.scala 519:11]
  wire [1:0] f3_io_deq_bits_tsrc; // @[frontend.scala 519:11]
  wire  f3_io_count; // @[frontend.scala 519:11]
  wire  f3_bpd_resp_clock; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_reset; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_ready; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_valid; // @[frontend.scala 524:11]
  wire [39:0] f3_bpd_resp_io_enq_bits_pc; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_0_taken; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_0_is_br; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_0_is_jal; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_valid; // @[frontend.scala 524:11]
  wire [39:0] f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_bits; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_1_taken; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_1_is_br; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_1_is_jal; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_valid; // @[frontend.scala 524:11]
  wire [39:0] f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_bits; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_2_taken; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_2_is_br; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_2_is_jal; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_valid; // @[frontend.scala 524:11]
  wire [39:0] f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_bits; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_3_taken; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_3_is_br; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_3_is_jal; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_valid; // @[frontend.scala 524:11]
  wire [39:0] f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_bits; // @[frontend.scala 524:11]
  wire [44:0] f3_bpd_resp_io_enq_bits_meta_0; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_enq_bits_lhist_0; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_ready; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_valid; // @[frontend.scala 524:11]
  wire [39:0] f3_bpd_resp_io_deq_bits_pc; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_0_taken; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_0_is_br; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_0_is_jal; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_valid; // @[frontend.scala 524:11]
  wire [39:0] f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_1_taken; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_1_is_br; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_1_is_jal; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_valid; // @[frontend.scala 524:11]
  wire [39:0] f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_2_taken; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_2_is_br; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_2_is_jal; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_valid; // @[frontend.scala 524:11]
  wire [39:0] f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_3_taken; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_3_is_br; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_3_is_jal; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_valid; // @[frontend.scala 524:11]
  wire [39:0] f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits; // @[frontend.scala 524:11]
  wire [44:0] f3_bpd_resp_io_deq_bits_meta_0; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_deq_bits_lhist_0; // @[frontend.scala 524:11]
  wire  f3_bpd_resp_io_count; // @[frontend.scala 524:11]
  wire  BreakpointUnit_clock; // @[frontend.scala 611:23]
  wire  BreakpointUnit_reset; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_debug; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_cease; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_wfi; // @[frontend.scala 611:23]
  wire [31:0] BreakpointUnit_io_status_isa; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_io_status_dprv; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_io_status_prv; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_sd; // @[frontend.scala 611:23]
  wire [26:0] BreakpointUnit_io_status_zero2; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_io_status_sxl; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_io_status_uxl; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_sd_rv32; // @[frontend.scala 611:23]
  wire [7:0] BreakpointUnit_io_status_zero1; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_tsr; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_tw; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_tvm; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_mxr; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_sum; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_mprv; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_io_status_xs; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_io_status_fs; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_io_status_mpp; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_io_status_vs; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_spp; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_mpie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_hpie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_spie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_upie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_mie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_hie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_sie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_status_uie; // @[frontend.scala 611:23]
  wire [38:0] BreakpointUnit_io_pc; // @[frontend.scala 611:23]
  wire [38:0] BreakpointUnit_io_ea; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_xcpt_if; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_xcpt_ld; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_xcpt_st; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_debug_if; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_debug_ld; // @[frontend.scala 611:23]
  wire  BreakpointUnit_io_debug_st; // @[frontend.scala 611:23]
  wire  RVCExpander_clock; // @[consts.scala 457:25]
  wire  RVCExpander_reset; // @[consts.scala 457:25]
  wire [31:0] RVCExpander_io_in; // @[consts.scala 457:25]
  wire [31:0] RVCExpander_io_out_bits; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_io_out_rd; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_io_out_rs1; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_io_out_rs2; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_io_out_rs3; // @[consts.scala 457:25]
  wire  RVCExpander_io_rvc; // @[consts.scala 457:25]
  wire  RVCExpander_1_clock; // @[consts.scala 457:25]
  wire  RVCExpander_1_reset; // @[consts.scala 457:25]
  wire [31:0] RVCExpander_1_io_in; // @[consts.scala 457:25]
  wire [31:0] RVCExpander_1_io_out_bits; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_1_io_out_rd; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_1_io_out_rs1; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_1_io_out_rs2; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_1_io_out_rs3; // @[consts.scala 457:25]
  wire  RVCExpander_1_io_rvc; // @[consts.scala 457:25]
  wire  BranchDecode_clock; // @[frontend.scala 628:34]
  wire  BranchDecode_reset; // @[frontend.scala 628:34]
  wire [31:0] BranchDecode_io_inst; // @[frontend.scala 628:34]
  wire [39:0] BranchDecode_io_pc; // @[frontend.scala 628:34]
  wire  BranchDecode_io_is_unicore; // @[frontend.scala 628:34]
  wire  BranchDecode_io_out_is_ret; // @[frontend.scala 628:34]
  wire  BranchDecode_io_out_is_call; // @[frontend.scala 628:34]
  wire [39:0] BranchDecode_io_out_target; // @[frontend.scala 628:34]
  wire [2:0] BranchDecode_io_out_cfi_type; // @[frontend.scala 628:34]
  wire  BranchDecode_io_out_sfb_offset_valid; // @[frontend.scala 628:34]
  wire [5:0] BranchDecode_io_out_sfb_offset_bits; // @[frontend.scala 628:34]
  wire  BranchDecode_io_out_shadowable; // @[frontend.scala 628:34]
  wire  BranchDecode_1_clock; // @[frontend.scala 631:34]
  wire  BranchDecode_1_reset; // @[frontend.scala 631:34]
  wire [31:0] BranchDecode_1_io_inst; // @[frontend.scala 631:34]
  wire [39:0] BranchDecode_1_io_pc; // @[frontend.scala 631:34]
  wire  BranchDecode_1_io_is_unicore; // @[frontend.scala 631:34]
  wire  BranchDecode_1_io_out_is_ret; // @[frontend.scala 631:34]
  wire  BranchDecode_1_io_out_is_call; // @[frontend.scala 631:34]
  wire [39:0] BranchDecode_1_io_out_target; // @[frontend.scala 631:34]
  wire [2:0] BranchDecode_1_io_out_cfi_type; // @[frontend.scala 631:34]
  wire  BranchDecode_1_io_out_sfb_offset_valid; // @[frontend.scala 631:34]
  wire [5:0] BranchDecode_1_io_out_sfb_offset_bits; // @[frontend.scala 631:34]
  wire  BranchDecode_1_io_out_shadowable; // @[frontend.scala 631:34]
  wire  BreakpointUnit_1_clock; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_reset; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_debug; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_cease; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_wfi; // @[frontend.scala 611:23]
  wire [31:0] BreakpointUnit_1_io_status_isa; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_1_io_status_dprv; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_1_io_status_prv; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_sd; // @[frontend.scala 611:23]
  wire [26:0] BreakpointUnit_1_io_status_zero2; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_1_io_status_sxl; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_1_io_status_uxl; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_sd_rv32; // @[frontend.scala 611:23]
  wire [7:0] BreakpointUnit_1_io_status_zero1; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_tsr; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_tw; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_tvm; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_mxr; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_sum; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_mprv; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_1_io_status_xs; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_1_io_status_fs; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_1_io_status_mpp; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_1_io_status_vs; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_spp; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_mpie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_hpie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_spie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_upie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_mie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_hie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_sie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_status_uie; // @[frontend.scala 611:23]
  wire [38:0] BreakpointUnit_1_io_pc; // @[frontend.scala 611:23]
  wire [38:0] BreakpointUnit_1_io_ea; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_xcpt_if; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_xcpt_ld; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_xcpt_st; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_debug_if; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_debug_ld; // @[frontend.scala 611:23]
  wire  BreakpointUnit_1_io_debug_st; // @[frontend.scala 611:23]
  wire  RVCExpander_2_clock; // @[consts.scala 457:25]
  wire  RVCExpander_2_reset; // @[consts.scala 457:25]
  wire [31:0] RVCExpander_2_io_in; // @[consts.scala 457:25]
  wire [31:0] RVCExpander_2_io_out_bits; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_2_io_out_rd; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_2_io_out_rs1; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_2_io_out_rs2; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_2_io_out_rs3; // @[consts.scala 457:25]
  wire  RVCExpander_2_io_rvc; // @[consts.scala 457:25]
  wire  BranchDecode_2_clock; // @[frontend.scala 676:33]
  wire  BranchDecode_2_reset; // @[frontend.scala 676:33]
  wire [31:0] BranchDecode_2_io_inst; // @[frontend.scala 676:33]
  wire [39:0] BranchDecode_2_io_pc; // @[frontend.scala 676:33]
  wire  BranchDecode_2_io_is_unicore; // @[frontend.scala 676:33]
  wire  BranchDecode_2_io_out_is_ret; // @[frontend.scala 676:33]
  wire  BranchDecode_2_io_out_is_call; // @[frontend.scala 676:33]
  wire [39:0] BranchDecode_2_io_out_target; // @[frontend.scala 676:33]
  wire [2:0] BranchDecode_2_io_out_cfi_type; // @[frontend.scala 676:33]
  wire  BranchDecode_2_io_out_sfb_offset_valid; // @[frontend.scala 676:33]
  wire [5:0] BranchDecode_2_io_out_sfb_offset_bits; // @[frontend.scala 676:33]
  wire  BranchDecode_2_io_out_shadowable; // @[frontend.scala 676:33]
  wire  BreakpointUnit_2_clock; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_reset; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_debug; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_cease; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_wfi; // @[frontend.scala 611:23]
  wire [31:0] BreakpointUnit_2_io_status_isa; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_2_io_status_dprv; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_2_io_status_prv; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_sd; // @[frontend.scala 611:23]
  wire [26:0] BreakpointUnit_2_io_status_zero2; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_2_io_status_sxl; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_2_io_status_uxl; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_sd_rv32; // @[frontend.scala 611:23]
  wire [7:0] BreakpointUnit_2_io_status_zero1; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_tsr; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_tw; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_tvm; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_mxr; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_sum; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_mprv; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_2_io_status_xs; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_2_io_status_fs; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_2_io_status_mpp; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_2_io_status_vs; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_spp; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_mpie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_hpie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_spie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_upie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_mie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_hie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_sie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_status_uie; // @[frontend.scala 611:23]
  wire [38:0] BreakpointUnit_2_io_pc; // @[frontend.scala 611:23]
  wire [38:0] BreakpointUnit_2_io_ea; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_xcpt_if; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_xcpt_ld; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_xcpt_st; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_debug_if; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_debug_ld; // @[frontend.scala 611:23]
  wire  BreakpointUnit_2_io_debug_st; // @[frontend.scala 611:23]
  wire  RVCExpander_3_clock; // @[consts.scala 457:25]
  wire  RVCExpander_3_reset; // @[consts.scala 457:25]
  wire [31:0] RVCExpander_3_io_in; // @[consts.scala 457:25]
  wire [31:0] RVCExpander_3_io_out_bits; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_3_io_out_rd; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_3_io_out_rs1; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_3_io_out_rs2; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_3_io_out_rs3; // @[consts.scala 457:25]
  wire  RVCExpander_3_io_rvc; // @[consts.scala 457:25]
  wire  BranchDecode_3_clock; // @[frontend.scala 676:33]
  wire  BranchDecode_3_reset; // @[frontend.scala 676:33]
  wire [31:0] BranchDecode_3_io_inst; // @[frontend.scala 676:33]
  wire [39:0] BranchDecode_3_io_pc; // @[frontend.scala 676:33]
  wire  BranchDecode_3_io_is_unicore; // @[frontend.scala 676:33]
  wire  BranchDecode_3_io_out_is_ret; // @[frontend.scala 676:33]
  wire  BranchDecode_3_io_out_is_call; // @[frontend.scala 676:33]
  wire [39:0] BranchDecode_3_io_out_target; // @[frontend.scala 676:33]
  wire [2:0] BranchDecode_3_io_out_cfi_type; // @[frontend.scala 676:33]
  wire  BranchDecode_3_io_out_sfb_offset_valid; // @[frontend.scala 676:33]
  wire [5:0] BranchDecode_3_io_out_sfb_offset_bits; // @[frontend.scala 676:33]
  wire  BranchDecode_3_io_out_shadowable; // @[frontend.scala 676:33]
  wire  BreakpointUnit_3_clock; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_reset; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_debug; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_cease; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_wfi; // @[frontend.scala 611:23]
  wire [31:0] BreakpointUnit_3_io_status_isa; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_3_io_status_dprv; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_3_io_status_prv; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_sd; // @[frontend.scala 611:23]
  wire [26:0] BreakpointUnit_3_io_status_zero2; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_3_io_status_sxl; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_3_io_status_uxl; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_sd_rv32; // @[frontend.scala 611:23]
  wire [7:0] BreakpointUnit_3_io_status_zero1; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_tsr; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_tw; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_tvm; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_mxr; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_sum; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_mprv; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_3_io_status_xs; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_3_io_status_fs; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_3_io_status_mpp; // @[frontend.scala 611:23]
  wire [1:0] BreakpointUnit_3_io_status_vs; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_spp; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_mpie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_hpie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_spie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_upie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_mie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_hie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_sie; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_status_uie; // @[frontend.scala 611:23]
  wire [38:0] BreakpointUnit_3_io_pc; // @[frontend.scala 611:23]
  wire [38:0] BreakpointUnit_3_io_ea; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_xcpt_if; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_xcpt_ld; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_xcpt_st; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_debug_if; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_debug_ld; // @[frontend.scala 611:23]
  wire  BreakpointUnit_3_io_debug_st; // @[frontend.scala 611:23]
  wire  RVCExpander_4_clock; // @[consts.scala 457:25]
  wire  RVCExpander_4_reset; // @[consts.scala 457:25]
  wire [31:0] RVCExpander_4_io_in; // @[consts.scala 457:25]
  wire [31:0] RVCExpander_4_io_out_bits; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_4_io_out_rd; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_4_io_out_rs1; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_4_io_out_rs2; // @[consts.scala 457:25]
  wire [4:0] RVCExpander_4_io_out_rs3; // @[consts.scala 457:25]
  wire  RVCExpander_4_io_rvc; // @[consts.scala 457:25]
  wire  BranchDecode_4_clock; // @[frontend.scala 676:33]
  wire  BranchDecode_4_reset; // @[frontend.scala 676:33]
  wire [31:0] BranchDecode_4_io_inst; // @[frontend.scala 676:33]
  wire [39:0] BranchDecode_4_io_pc; // @[frontend.scala 676:33]
  wire  BranchDecode_4_io_is_unicore; // @[frontend.scala 676:33]
  wire  BranchDecode_4_io_out_is_ret; // @[frontend.scala 676:33]
  wire  BranchDecode_4_io_out_is_call; // @[frontend.scala 676:33]
  wire [39:0] BranchDecode_4_io_out_target; // @[frontend.scala 676:33]
  wire [2:0] BranchDecode_4_io_out_cfi_type; // @[frontend.scala 676:33]
  wire  BranchDecode_4_io_out_sfb_offset_valid; // @[frontend.scala 676:33]
  wire [5:0] BranchDecode_4_io_out_sfb_offset_bits; // @[frontend.scala 676:33]
  wire  BranchDecode_4_io_out_shadowable; // @[frontend.scala 676:33]
  wire  f4_btb_corrections_clock; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_reset; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_ready; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_valid; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_is_mispredict_update; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_is_repair_update; // @[frontend.scala 856:34]
  wire [3:0] f4_btb_corrections_io_enq_bits_btb_mispredicts; // @[frontend.scala 856:34]
  wire [39:0] f4_btb_corrections_io_enq_bits_pc; // @[frontend.scala 856:34]
  wire [3:0] f4_btb_corrections_io_enq_bits_br_mask; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_idx_valid; // @[frontend.scala 856:34]
  wire [1:0] f4_btb_corrections_io_enq_bits_cfi_idx_bits; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_taken; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_mispredicted; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_is_br; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_is_jal; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_cfi_is_jalr; // @[frontend.scala 856:34]
  wire [15:0] f4_btb_corrections_io_enq_bits_ghist_old_history; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 856:34]
  wire [4:0] f4_btb_corrections_io_enq_bits_ghist_ras_idx; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_enq_bits_lhist_0; // @[frontend.scala 856:34]
  wire [39:0] f4_btb_corrections_io_enq_bits_target; // @[frontend.scala 856:34]
  wire [44:0] f4_btb_corrections_io_enq_bits_meta_0; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_ready; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_valid; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_is_mispredict_update; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_is_repair_update; // @[frontend.scala 856:34]
  wire [3:0] f4_btb_corrections_io_deq_bits_btb_mispredicts; // @[frontend.scala 856:34]
  wire [39:0] f4_btb_corrections_io_deq_bits_pc; // @[frontend.scala 856:34]
  wire [3:0] f4_btb_corrections_io_deq_bits_br_mask; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_idx_valid; // @[frontend.scala 856:34]
  wire [1:0] f4_btb_corrections_io_deq_bits_cfi_idx_bits; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_taken; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_mispredicted; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_is_br; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_is_jal; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_cfi_is_jalr; // @[frontend.scala 856:34]
  wire [15:0] f4_btb_corrections_io_deq_bits_ghist_old_history; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 856:34]
  wire [4:0] f4_btb_corrections_io_deq_bits_ghist_ras_idx; // @[frontend.scala 856:34]
  wire  f4_btb_corrections_io_deq_bits_lhist_0; // @[frontend.scala 856:34]
  wire [39:0] f4_btb_corrections_io_deq_bits_target; // @[frontend.scala 856:34]
  wire [44:0] f4_btb_corrections_io_deq_bits_meta_0; // @[frontend.scala 856:34]
  wire [1:0] f4_btb_corrections_io_count; // @[frontend.scala 856:34]
  wire  f4_clock; // @[frontend.scala 873:11]
  wire  f4_reset; // @[frontend.scala 873:11]
  wire  f4_io_enq_ready; // @[frontend.scala 873:11]
  wire  f4_io_enq_valid; // @[frontend.scala 873:11]
  wire [39:0] f4_io_enq_bits_pc; // @[frontend.scala 873:11]
  wire [39:0] f4_io_enq_bits_next_pc; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_edge_inst_0; // @[frontend.scala 873:11]
  wire [31:0] f4_io_enq_bits_insts_0; // @[frontend.scala 873:11]
  wire [31:0] f4_io_enq_bits_insts_1; // @[frontend.scala 873:11]
  wire [31:0] f4_io_enq_bits_insts_2; // @[frontend.scala 873:11]
  wire [31:0] f4_io_enq_bits_insts_3; // @[frontend.scala 873:11]
  wire [31:0] f4_io_enq_bits_exp_insts_0; // @[frontend.scala 873:11]
  wire [31:0] f4_io_enq_bits_exp_insts_1; // @[frontend.scala 873:11]
  wire [31:0] f4_io_enq_bits_exp_insts_2; // @[frontend.scala 873:11]
  wire [31:0] f4_io_enq_bits_exp_insts_3; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_sfbs_0; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_sfbs_1; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_sfbs_2; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_sfbs_3; // @[frontend.scala 873:11]
  wire [7:0] f4_io_enq_bits_sfb_masks_0; // @[frontend.scala 873:11]
  wire [7:0] f4_io_enq_bits_sfb_masks_1; // @[frontend.scala 873:11]
  wire [7:0] f4_io_enq_bits_sfb_masks_2; // @[frontend.scala 873:11]
  wire [7:0] f4_io_enq_bits_sfb_masks_3; // @[frontend.scala 873:11]
  wire [3:0] f4_io_enq_bits_sfb_dests_0; // @[frontend.scala 873:11]
  wire [3:0] f4_io_enq_bits_sfb_dests_1; // @[frontend.scala 873:11]
  wire [3:0] f4_io_enq_bits_sfb_dests_2; // @[frontend.scala 873:11]
  wire [3:0] f4_io_enq_bits_sfb_dests_3; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_shadowable_mask_0; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_shadowable_mask_1; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_shadowable_mask_2; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_shadowable_mask_3; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_shadowed_mask_0; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_shadowed_mask_1; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_shadowed_mask_2; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_shadowed_mask_3; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_cfi_idx_valid; // @[frontend.scala 873:11]
  wire [1:0] f4_io_enq_bits_cfi_idx_bits; // @[frontend.scala 873:11]
  wire [2:0] f4_io_enq_bits_cfi_type; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_cfi_is_call; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_cfi_is_ret; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_cfi_npc_plus4; // @[frontend.scala 873:11]
  wire [39:0] f4_io_enq_bits_ras_top; // @[frontend.scala 873:11]
  wire [4:0] f4_io_enq_bits_ftq_idx; // @[frontend.scala 873:11]
  wire [3:0] f4_io_enq_bits_mask; // @[frontend.scala 873:11]
  wire [3:0] f4_io_enq_bits_br_mask; // @[frontend.scala 873:11]
  wire [15:0] f4_io_enq_bits_ghist_old_history; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 873:11]
  wire [4:0] f4_io_enq_bits_ghist_ras_idx; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_lhist_0; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_xcpt_pf_if; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_xcpt_ae_if; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_bp_debug_if_oh_0; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_bp_debug_if_oh_1; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_bp_debug_if_oh_2; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_bp_debug_if_oh_3; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 873:11]
  wire  f4_io_enq_bits_end_half_valid; // @[frontend.scala 873:11]
  wire [15:0] f4_io_enq_bits_end_half_bits; // @[frontend.scala 873:11]
  wire [44:0] f4_io_enq_bits_bpd_meta_0; // @[frontend.scala 873:11]
  wire [1:0] f4_io_enq_bits_fsrc; // @[frontend.scala 873:11]
  wire [1:0] f4_io_enq_bits_tsrc; // @[frontend.scala 873:11]
  wire  f4_io_deq_ready; // @[frontend.scala 873:11]
  wire  f4_io_deq_valid; // @[frontend.scala 873:11]
  wire [39:0] f4_io_deq_bits_pc; // @[frontend.scala 873:11]
  wire [39:0] f4_io_deq_bits_next_pc; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_edge_inst_0; // @[frontend.scala 873:11]
  wire [31:0] f4_io_deq_bits_insts_0; // @[frontend.scala 873:11]
  wire [31:0] f4_io_deq_bits_insts_1; // @[frontend.scala 873:11]
  wire [31:0] f4_io_deq_bits_insts_2; // @[frontend.scala 873:11]
  wire [31:0] f4_io_deq_bits_insts_3; // @[frontend.scala 873:11]
  wire [31:0] f4_io_deq_bits_exp_insts_0; // @[frontend.scala 873:11]
  wire [31:0] f4_io_deq_bits_exp_insts_1; // @[frontend.scala 873:11]
  wire [31:0] f4_io_deq_bits_exp_insts_2; // @[frontend.scala 873:11]
  wire [31:0] f4_io_deq_bits_exp_insts_3; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_sfbs_0; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_sfbs_1; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_sfbs_2; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_sfbs_3; // @[frontend.scala 873:11]
  wire [7:0] f4_io_deq_bits_sfb_masks_0; // @[frontend.scala 873:11]
  wire [7:0] f4_io_deq_bits_sfb_masks_1; // @[frontend.scala 873:11]
  wire [7:0] f4_io_deq_bits_sfb_masks_2; // @[frontend.scala 873:11]
  wire [7:0] f4_io_deq_bits_sfb_masks_3; // @[frontend.scala 873:11]
  wire [3:0] f4_io_deq_bits_sfb_dests_0; // @[frontend.scala 873:11]
  wire [3:0] f4_io_deq_bits_sfb_dests_1; // @[frontend.scala 873:11]
  wire [3:0] f4_io_deq_bits_sfb_dests_2; // @[frontend.scala 873:11]
  wire [3:0] f4_io_deq_bits_sfb_dests_3; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_shadowable_mask_0; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_shadowable_mask_1; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_shadowable_mask_2; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_shadowable_mask_3; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_shadowed_mask_0; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_shadowed_mask_1; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_shadowed_mask_2; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_shadowed_mask_3; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_cfi_idx_valid; // @[frontend.scala 873:11]
  wire [1:0] f4_io_deq_bits_cfi_idx_bits; // @[frontend.scala 873:11]
  wire [2:0] f4_io_deq_bits_cfi_type; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_cfi_is_call; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_cfi_is_ret; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_cfi_npc_plus4; // @[frontend.scala 873:11]
  wire [39:0] f4_io_deq_bits_ras_top; // @[frontend.scala 873:11]
  wire [4:0] f4_io_deq_bits_ftq_idx; // @[frontend.scala 873:11]
  wire [3:0] f4_io_deq_bits_mask; // @[frontend.scala 873:11]
  wire [3:0] f4_io_deq_bits_br_mask; // @[frontend.scala 873:11]
  wire [15:0] f4_io_deq_bits_ghist_old_history; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 873:11]
  wire [4:0] f4_io_deq_bits_ghist_ras_idx; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_lhist_0; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_xcpt_pf_if; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_xcpt_ae_if; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_bp_debug_if_oh_0; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_bp_debug_if_oh_1; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_bp_debug_if_oh_2; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_bp_debug_if_oh_3; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 873:11]
  wire  f4_io_deq_bits_end_half_valid; // @[frontend.scala 873:11]
  wire [15:0] f4_io_deq_bits_end_half_bits; // @[frontend.scala 873:11]
  wire [44:0] f4_io_deq_bits_bpd_meta_0; // @[frontend.scala 873:11]
  wire [1:0] f4_io_deq_bits_fsrc; // @[frontend.scala 873:11]
  wire [1:0] f4_io_deq_bits_tsrc; // @[frontend.scala 873:11]
  wire  f4_io_count; // @[frontend.scala 873:11]
  wire  fb_clock; // @[frontend.scala 875:19]
  wire  fb_reset; // @[frontend.scala 875:19]
  wire  fb_io_enq_ready; // @[frontend.scala 875:19]
  wire  fb_io_enq_valid; // @[frontend.scala 875:19]
  wire [39:0] fb_io_enq_bits_pc; // @[frontend.scala 875:19]
  wire [39:0] fb_io_enq_bits_next_pc; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_edge_inst_0; // @[frontend.scala 875:19]
  wire [31:0] fb_io_enq_bits_insts_0; // @[frontend.scala 875:19]
  wire [31:0] fb_io_enq_bits_insts_1; // @[frontend.scala 875:19]
  wire [31:0] fb_io_enq_bits_insts_2; // @[frontend.scala 875:19]
  wire [31:0] fb_io_enq_bits_insts_3; // @[frontend.scala 875:19]
  wire [31:0] fb_io_enq_bits_exp_insts_0; // @[frontend.scala 875:19]
  wire [31:0] fb_io_enq_bits_exp_insts_1; // @[frontend.scala 875:19]
  wire [31:0] fb_io_enq_bits_exp_insts_2; // @[frontend.scala 875:19]
  wire [31:0] fb_io_enq_bits_exp_insts_3; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_sfbs_0; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_sfbs_1; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_sfbs_2; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_sfbs_3; // @[frontend.scala 875:19]
  wire [7:0] fb_io_enq_bits_sfb_masks_0; // @[frontend.scala 875:19]
  wire [7:0] fb_io_enq_bits_sfb_masks_1; // @[frontend.scala 875:19]
  wire [7:0] fb_io_enq_bits_sfb_masks_2; // @[frontend.scala 875:19]
  wire [7:0] fb_io_enq_bits_sfb_masks_3; // @[frontend.scala 875:19]
  wire [3:0] fb_io_enq_bits_sfb_dests_0; // @[frontend.scala 875:19]
  wire [3:0] fb_io_enq_bits_sfb_dests_1; // @[frontend.scala 875:19]
  wire [3:0] fb_io_enq_bits_sfb_dests_2; // @[frontend.scala 875:19]
  wire [3:0] fb_io_enq_bits_sfb_dests_3; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_shadowable_mask_0; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_shadowable_mask_1; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_shadowable_mask_2; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_shadowable_mask_3; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_shadowed_mask_0; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_shadowed_mask_1; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_shadowed_mask_2; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_shadowed_mask_3; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_cfi_idx_valid; // @[frontend.scala 875:19]
  wire [1:0] fb_io_enq_bits_cfi_idx_bits; // @[frontend.scala 875:19]
  wire [2:0] fb_io_enq_bits_cfi_type; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_cfi_is_call; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_cfi_is_ret; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_cfi_npc_plus4; // @[frontend.scala 875:19]
  wire [39:0] fb_io_enq_bits_ras_top; // @[frontend.scala 875:19]
  wire [4:0] fb_io_enq_bits_ftq_idx; // @[frontend.scala 875:19]
  wire [3:0] fb_io_enq_bits_mask; // @[frontend.scala 875:19]
  wire [3:0] fb_io_enq_bits_br_mask; // @[frontend.scala 875:19]
  wire [15:0] fb_io_enq_bits_ghist_old_history; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 875:19]
  wire [4:0] fb_io_enq_bits_ghist_ras_idx; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_lhist_0; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_xcpt_pf_if; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_xcpt_ae_if; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_bp_debug_if_oh_0; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_bp_debug_if_oh_1; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_bp_debug_if_oh_2; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_bp_debug_if_oh_3; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 875:19]
  wire  fb_io_enq_bits_end_half_valid; // @[frontend.scala 875:19]
  wire [15:0] fb_io_enq_bits_end_half_bits; // @[frontend.scala 875:19]
  wire [44:0] fb_io_enq_bits_bpd_meta_0; // @[frontend.scala 875:19]
  wire [1:0] fb_io_enq_bits_fsrc; // @[frontend.scala 875:19]
  wire [1:0] fb_io_enq_bits_tsrc; // @[frontend.scala 875:19]
  wire  fb_io_deq_ready; // @[frontend.scala 875:19]
  wire  fb_io_deq_valid; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_valid; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_switch; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_switch_off; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_is_unicore; // @[frontend.scala 875:19]
  wire [2:0] fb_io_deq_bits_uops_0_bits_shift; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_lrs3_rtype; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_rflag; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_wflag; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_prflag; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_pwflag; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_pflag_busy; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_stale_pflag; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_op1_sel; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_op2_sel; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_split_num; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_self_index; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_rob_inst_idx; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_address_num; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_0_bits_uopc; // @[frontend.scala 875:19]
  wire [31:0] fb_io_deq_bits_uops_0_bits_inst; // @[frontend.scala 875:19]
  wire [31:0] fb_io_deq_bits_uops_0_bits_debug_inst; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_is_rvc; // @[frontend.scala 875:19]
  wire [39:0] fb_io_deq_bits_uops_0_bits_debug_pc; // @[frontend.scala 875:19]
  wire [2:0] fb_io_deq_bits_uops_0_bits_iq_type; // @[frontend.scala 875:19]
  wire [9:0] fb_io_deq_bits_uops_0_bits_fu_code; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_ctrl_br_type; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_ctrl_op1_sel; // @[frontend.scala 875:19]
  wire [2:0] fb_io_deq_bits_uops_0_bits_ctrl_op2_sel; // @[frontend.scala 875:19]
  wire [2:0] fb_io_deq_bits_uops_0_bits_ctrl_imm_sel; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_ctrl_op_fcn; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_ctrl_fcn_dw; // @[frontend.scala 875:19]
  wire [2:0] fb_io_deq_bits_uops_0_bits_ctrl_csr_cmd; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_ctrl_is_load; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_ctrl_is_sta; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_ctrl_is_std; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_ctrl_op3_sel; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_iw_state; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_iw_p1_poisoned; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_iw_p2_poisoned; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_is_br; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_is_jalr; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_is_jal; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_is_sfb; // @[frontend.scala 875:19]
  wire [11:0] fb_io_deq_bits_uops_0_bits_br_mask; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_0_bits_br_tag; // @[frontend.scala 875:19]
  wire [4:0] fb_io_deq_bits_uops_0_bits_ftq_idx; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_edge_inst; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_pc_lob; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_taken; // @[frontend.scala 875:19]
  wire [19:0] fb_io_deq_bits_uops_0_bits_imm_packed; // @[frontend.scala 875:19]
  wire [11:0] fb_io_deq_bits_uops_0_bits_csr_addr; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_rob_idx; // @[frontend.scala 875:19]
  wire [4:0] fb_io_deq_bits_uops_0_bits_ldq_idx; // @[frontend.scala 875:19]
  wire [4:0] fb_io_deq_bits_uops_0_bits_stq_idx; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_rxq_idx; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_0_bits_pdst; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_0_bits_prs1; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_0_bits_prs2; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_0_bits_prs3; // @[frontend.scala 875:19]
  wire [4:0] fb_io_deq_bits_uops_0_bits_ppred; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_prs1_busy; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_prs2_busy; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_prs3_busy; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_ppred_busy; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_0_bits_stale_pdst; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_exception; // @[frontend.scala 875:19]
  wire [63:0] fb_io_deq_bits_uops_0_bits_exc_cause; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_bypassable; // @[frontend.scala 875:19]
  wire [4:0] fb_io_deq_bits_uops_0_bits_mem_cmd; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_mem_size; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_mem_signed; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_is_fence; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_is_fencei; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_is_amo; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_uses_ldq; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_uses_stq; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_is_sys_pc2epc; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_is_unique; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_flush_on_commit; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_ldst_is_rs1; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_ldst; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_lrs1; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_lrs2; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_0_bits_lrs3; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_ldst_val; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_dst_rtype; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_lrs1_rtype; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_lrs2_rtype; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_frs3_en; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_fp_val; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_fp_single; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_xcpt_pf_if; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_xcpt_ae_if; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_xcpt_ma_if; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_bp_debug_if; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_0_bits_bp_xcpt_if; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_debug_fsrc; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_0_bits_debug_tsrc; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_valid; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_switch; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_switch_off; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_is_unicore; // @[frontend.scala 875:19]
  wire [2:0] fb_io_deq_bits_uops_1_bits_shift; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_lrs3_rtype; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_rflag; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_wflag; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_prflag; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_pwflag; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_pflag_busy; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_stale_pflag; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_op1_sel; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_op2_sel; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_split_num; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_self_index; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_rob_inst_idx; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_address_num; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_1_bits_uopc; // @[frontend.scala 875:19]
  wire [31:0] fb_io_deq_bits_uops_1_bits_inst; // @[frontend.scala 875:19]
  wire [31:0] fb_io_deq_bits_uops_1_bits_debug_inst; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_is_rvc; // @[frontend.scala 875:19]
  wire [39:0] fb_io_deq_bits_uops_1_bits_debug_pc; // @[frontend.scala 875:19]
  wire [2:0] fb_io_deq_bits_uops_1_bits_iq_type; // @[frontend.scala 875:19]
  wire [9:0] fb_io_deq_bits_uops_1_bits_fu_code; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_ctrl_br_type; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_ctrl_op1_sel; // @[frontend.scala 875:19]
  wire [2:0] fb_io_deq_bits_uops_1_bits_ctrl_op2_sel; // @[frontend.scala 875:19]
  wire [2:0] fb_io_deq_bits_uops_1_bits_ctrl_imm_sel; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_ctrl_op_fcn; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_ctrl_fcn_dw; // @[frontend.scala 875:19]
  wire [2:0] fb_io_deq_bits_uops_1_bits_ctrl_csr_cmd; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_ctrl_is_load; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_ctrl_is_sta; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_ctrl_is_std; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_ctrl_op3_sel; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_iw_state; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_iw_p1_poisoned; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_iw_p2_poisoned; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_is_br; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_is_jalr; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_is_jal; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_is_sfb; // @[frontend.scala 875:19]
  wire [11:0] fb_io_deq_bits_uops_1_bits_br_mask; // @[frontend.scala 875:19]
  wire [3:0] fb_io_deq_bits_uops_1_bits_br_tag; // @[frontend.scala 875:19]
  wire [4:0] fb_io_deq_bits_uops_1_bits_ftq_idx; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_edge_inst; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_pc_lob; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_taken; // @[frontend.scala 875:19]
  wire [19:0] fb_io_deq_bits_uops_1_bits_imm_packed; // @[frontend.scala 875:19]
  wire [11:0] fb_io_deq_bits_uops_1_bits_csr_addr; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_rob_idx; // @[frontend.scala 875:19]
  wire [4:0] fb_io_deq_bits_uops_1_bits_ldq_idx; // @[frontend.scala 875:19]
  wire [4:0] fb_io_deq_bits_uops_1_bits_stq_idx; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_rxq_idx; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_1_bits_pdst; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_1_bits_prs1; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_1_bits_prs2; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_1_bits_prs3; // @[frontend.scala 875:19]
  wire [4:0] fb_io_deq_bits_uops_1_bits_ppred; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_prs1_busy; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_prs2_busy; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_prs3_busy; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_ppred_busy; // @[frontend.scala 875:19]
  wire [6:0] fb_io_deq_bits_uops_1_bits_stale_pdst; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_exception; // @[frontend.scala 875:19]
  wire [63:0] fb_io_deq_bits_uops_1_bits_exc_cause; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_bypassable; // @[frontend.scala 875:19]
  wire [4:0] fb_io_deq_bits_uops_1_bits_mem_cmd; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_mem_size; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_mem_signed; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_is_fence; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_is_fencei; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_is_amo; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_uses_ldq; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_uses_stq; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_is_sys_pc2epc; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_is_unique; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_flush_on_commit; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_ldst_is_rs1; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_ldst; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_lrs1; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_lrs2; // @[frontend.scala 875:19]
  wire [5:0] fb_io_deq_bits_uops_1_bits_lrs3; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_ldst_val; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_dst_rtype; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_lrs1_rtype; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_lrs2_rtype; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_frs3_en; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_fp_val; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_fp_single; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_xcpt_pf_if; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_xcpt_ae_if; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_xcpt_ma_if; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_bp_debug_if; // @[frontend.scala 875:19]
  wire  fb_io_deq_bits_uops_1_bits_bp_xcpt_if; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_debug_fsrc; // @[frontend.scala 875:19]
  wire [1:0] fb_io_deq_bits_uops_1_bits_debug_tsrc; // @[frontend.scala 875:19]
  wire  fb_io_clear; // @[frontend.scala 875:19]
  wire  ftq_clock; // @[frontend.scala 876:19]
  wire  ftq_reset; // @[frontend.scala 876:19]
  wire  ftq_io_enq_ready; // @[frontend.scala 876:19]
  wire  ftq_io_enq_valid; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_enq_bits_pc; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_enq_bits_next_pc; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_edge_inst_0; // @[frontend.scala 876:19]
  wire [31:0] ftq_io_enq_bits_insts_0; // @[frontend.scala 876:19]
  wire [31:0] ftq_io_enq_bits_insts_1; // @[frontend.scala 876:19]
  wire [31:0] ftq_io_enq_bits_insts_2; // @[frontend.scala 876:19]
  wire [31:0] ftq_io_enq_bits_insts_3; // @[frontend.scala 876:19]
  wire [31:0] ftq_io_enq_bits_exp_insts_0; // @[frontend.scala 876:19]
  wire [31:0] ftq_io_enq_bits_exp_insts_1; // @[frontend.scala 876:19]
  wire [31:0] ftq_io_enq_bits_exp_insts_2; // @[frontend.scala 876:19]
  wire [31:0] ftq_io_enq_bits_exp_insts_3; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_sfbs_0; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_sfbs_1; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_sfbs_2; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_sfbs_3; // @[frontend.scala 876:19]
  wire [7:0] ftq_io_enq_bits_sfb_masks_0; // @[frontend.scala 876:19]
  wire [7:0] ftq_io_enq_bits_sfb_masks_1; // @[frontend.scala 876:19]
  wire [7:0] ftq_io_enq_bits_sfb_masks_2; // @[frontend.scala 876:19]
  wire [7:0] ftq_io_enq_bits_sfb_masks_3; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_enq_bits_sfb_dests_0; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_enq_bits_sfb_dests_1; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_enq_bits_sfb_dests_2; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_enq_bits_sfb_dests_3; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_shadowable_mask_0; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_shadowable_mask_1; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_shadowable_mask_2; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_shadowable_mask_3; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_shadowed_mask_0; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_shadowed_mask_1; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_shadowed_mask_2; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_shadowed_mask_3; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_cfi_idx_valid; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_enq_bits_cfi_idx_bits; // @[frontend.scala 876:19]
  wire [2:0] ftq_io_enq_bits_cfi_type; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_cfi_is_call; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_cfi_is_ret; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_cfi_npc_plus4; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_enq_bits_ras_top; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_enq_bits_ftq_idx; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_enq_bits_mask; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_enq_bits_br_mask; // @[frontend.scala 876:19]
  wire [15:0] ftq_io_enq_bits_ghist_old_history; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_enq_bits_ghist_ras_idx; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_lhist_0; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_xcpt_pf_if; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_xcpt_ae_if; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_bp_debug_if_oh_0; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_bp_debug_if_oh_1; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_bp_debug_if_oh_2; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_bp_debug_if_oh_3; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 876:19]
  wire  ftq_io_enq_bits_end_half_valid; // @[frontend.scala 876:19]
  wire [15:0] ftq_io_enq_bits_end_half_bits; // @[frontend.scala 876:19]
  wire [44:0] ftq_io_enq_bits_bpd_meta_0; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_enq_bits_fsrc; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_enq_bits_tsrc; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_enq_idx; // @[frontend.scala 876:19]
  wire  ftq_io_deq_valid; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_deq_bits; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_0_ftq_idx; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_idx_valid; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_get_ftq_pc_0_entry_cfi_idx_bits; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_mispredicted; // @[frontend.scala 876:19]
  wire [2:0] ftq_io_get_ftq_pc_0_entry_cfi_type; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_get_ftq_pc_0_entry_br_mask; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_is_call; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_is_ret; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_0_entry_cfi_npc_plus4; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_0_entry_ras_top; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_0_entry_ras_idx; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_0_entry_start_bank; // @[frontend.scala 876:19]
  wire [15:0] ftq_io_get_ftq_pc_0_ghist_old_history; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_0_ghist_current_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_0_ghist_new_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_0_ghist_new_saw_branch_taken; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_0_ghist_ras_idx; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_0_pc; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_0_com_pc; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_0_next_val; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_0_next_pc; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_1_ftq_idx; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_idx_valid; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_get_ftq_pc_1_entry_cfi_idx_bits; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_mispredicted; // @[frontend.scala 876:19]
  wire [2:0] ftq_io_get_ftq_pc_1_entry_cfi_type; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_get_ftq_pc_1_entry_br_mask; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_is_call; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_is_ret; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_1_entry_cfi_npc_plus4; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_1_entry_ras_top; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_1_entry_ras_idx; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_1_entry_start_bank; // @[frontend.scala 876:19]
  wire [15:0] ftq_io_get_ftq_pc_1_ghist_old_history; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_1_ghist_current_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_1_ghist_new_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_1_ghist_new_saw_branch_taken; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_1_ghist_ras_idx; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_1_pc; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_1_com_pc; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_1_next_val; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_1_next_pc; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_2_ftq_idx; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_2_entry_cfi_idx_valid; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_get_ftq_pc_2_entry_cfi_idx_bits; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_2_entry_cfi_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_2_entry_cfi_mispredicted; // @[frontend.scala 876:19]
  wire [2:0] ftq_io_get_ftq_pc_2_entry_cfi_type; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_get_ftq_pc_2_entry_br_mask; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_2_entry_cfi_is_call; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_2_entry_cfi_is_ret; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_2_entry_cfi_npc_plus4; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_2_entry_ras_top; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_2_entry_ras_idx; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_2_entry_start_bank; // @[frontend.scala 876:19]
  wire [15:0] ftq_io_get_ftq_pc_2_ghist_old_history; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_2_ghist_current_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_2_ghist_new_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_2_ghist_new_saw_branch_taken; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_2_ghist_ras_idx; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_2_pc; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_2_com_pc; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_2_next_val; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_2_next_pc; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_3_ftq_idx; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_3_entry_cfi_idx_valid; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_get_ftq_pc_3_entry_cfi_idx_bits; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_3_entry_cfi_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_3_entry_cfi_mispredicted; // @[frontend.scala 876:19]
  wire [2:0] ftq_io_get_ftq_pc_3_entry_cfi_type; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_get_ftq_pc_3_entry_br_mask; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_3_entry_cfi_is_call; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_3_entry_cfi_is_ret; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_3_entry_cfi_npc_plus4; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_3_entry_ras_top; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_3_entry_ras_idx; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_3_entry_start_bank; // @[frontend.scala 876:19]
  wire [15:0] ftq_io_get_ftq_pc_3_ghist_old_history; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_3_ghist_current_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_3_ghist_new_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_3_ghist_new_saw_branch_taken; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_get_ftq_pc_3_ghist_ras_idx; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_3_pc; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_3_com_pc; // @[frontend.scala 876:19]
  wire  ftq_io_get_ftq_pc_3_next_val; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_get_ftq_pc_3_next_pc; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_debug_ftq_idx_0; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_debug_ftq_idx_1; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_debug_fetch_pc_0; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_debug_fetch_pc_1; // @[frontend.scala 876:19]
  wire  ftq_io_redirect_valid; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_redirect_bits; // @[frontend.scala 876:19]
  wire [11:0] ftq_io_brupdate_b1_resolve_mask; // @[frontend.scala 876:19]
  wire [11:0] ftq_io_brupdate_b1_mispredict_mask; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_switch; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_switch_off; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_is_unicore; // @[frontend.scala 876:19]
  wire [2:0] ftq_io_brupdate_b2_uop_shift; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_uop_lrs3_rtype; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_rflag; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_wflag; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_brupdate_b2_uop_prflag; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_brupdate_b2_uop_pwflag; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_pflag_busy; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_brupdate_b2_uop_stale_pflag; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_brupdate_b2_uop_op1_sel; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_brupdate_b2_uop_op2_sel; // @[frontend.scala 876:19]
  wire [5:0] ftq_io_brupdate_b2_uop_split_num; // @[frontend.scala 876:19]
  wire [5:0] ftq_io_brupdate_b2_uop_self_index; // @[frontend.scala 876:19]
  wire [5:0] ftq_io_brupdate_b2_uop_rob_inst_idx; // @[frontend.scala 876:19]
  wire [5:0] ftq_io_brupdate_b2_uop_address_num; // @[frontend.scala 876:19]
  wire [6:0] ftq_io_brupdate_b2_uop_uopc; // @[frontend.scala 876:19]
  wire [31:0] ftq_io_brupdate_b2_uop_inst; // @[frontend.scala 876:19]
  wire [31:0] ftq_io_brupdate_b2_uop_debug_inst; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_is_rvc; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_brupdate_b2_uop_debug_pc; // @[frontend.scala 876:19]
  wire [2:0] ftq_io_brupdate_b2_uop_iq_type; // @[frontend.scala 876:19]
  wire [9:0] ftq_io_brupdate_b2_uop_fu_code; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_brupdate_b2_uop_ctrl_br_type; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_uop_ctrl_op1_sel; // @[frontend.scala 876:19]
  wire [2:0] ftq_io_brupdate_b2_uop_ctrl_op2_sel; // @[frontend.scala 876:19]
  wire [2:0] ftq_io_brupdate_b2_uop_ctrl_imm_sel; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_brupdate_b2_uop_ctrl_op_fcn; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_ctrl_fcn_dw; // @[frontend.scala 876:19]
  wire [2:0] ftq_io_brupdate_b2_uop_ctrl_csr_cmd; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_ctrl_is_load; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_ctrl_is_sta; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_ctrl_is_std; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_uop_ctrl_op3_sel; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_uop_iw_state; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_iw_p1_poisoned; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_iw_p2_poisoned; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_is_br; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_is_jalr; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_is_jal; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_is_sfb; // @[frontend.scala 876:19]
  wire [11:0] ftq_io_brupdate_b2_uop_br_mask; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_brupdate_b2_uop_br_tag; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_brupdate_b2_uop_ftq_idx; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_edge_inst; // @[frontend.scala 876:19]
  wire [5:0] ftq_io_brupdate_b2_uop_pc_lob; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_taken; // @[frontend.scala 876:19]
  wire [19:0] ftq_io_brupdate_b2_uop_imm_packed; // @[frontend.scala 876:19]
  wire [11:0] ftq_io_brupdate_b2_uop_csr_addr; // @[frontend.scala 876:19]
  wire [5:0] ftq_io_brupdate_b2_uop_rob_idx; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_brupdate_b2_uop_ldq_idx; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_brupdate_b2_uop_stq_idx; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_uop_rxq_idx; // @[frontend.scala 876:19]
  wire [6:0] ftq_io_brupdate_b2_uop_pdst; // @[frontend.scala 876:19]
  wire [6:0] ftq_io_brupdate_b2_uop_prs1; // @[frontend.scala 876:19]
  wire [6:0] ftq_io_brupdate_b2_uop_prs2; // @[frontend.scala 876:19]
  wire [6:0] ftq_io_brupdate_b2_uop_prs3; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_brupdate_b2_uop_ppred; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_prs1_busy; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_prs2_busy; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_prs3_busy; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_ppred_busy; // @[frontend.scala 876:19]
  wire [6:0] ftq_io_brupdate_b2_uop_stale_pdst; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_exception; // @[frontend.scala 876:19]
  wire [63:0] ftq_io_brupdate_b2_uop_exc_cause; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_bypassable; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_brupdate_b2_uop_mem_cmd; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_uop_mem_size; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_mem_signed; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_is_fence; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_is_fencei; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_is_amo; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_uses_ldq; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_uses_stq; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_is_sys_pc2epc; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_is_unique; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_flush_on_commit; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_ldst_is_rs1; // @[frontend.scala 876:19]
  wire [5:0] ftq_io_brupdate_b2_uop_ldst; // @[frontend.scala 876:19]
  wire [5:0] ftq_io_brupdate_b2_uop_lrs1; // @[frontend.scala 876:19]
  wire [5:0] ftq_io_brupdate_b2_uop_lrs2; // @[frontend.scala 876:19]
  wire [5:0] ftq_io_brupdate_b2_uop_lrs3; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_ldst_val; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_uop_dst_rtype; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_uop_lrs1_rtype; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_uop_lrs2_rtype; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_frs3_en; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_fp_val; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_fp_single; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_xcpt_pf_if; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_xcpt_ae_if; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_xcpt_ma_if; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_bp_debug_if; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_uop_bp_xcpt_if; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_uop_debug_fsrc; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_uop_debug_tsrc; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_valid; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_mispredict; // @[frontend.scala 876:19]
  wire  ftq_io_brupdate_b2_taken; // @[frontend.scala 876:19]
  wire [2:0] ftq_io_brupdate_b2_cfi_type; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_brupdate_b2_pc_sel; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_brupdate_b2_jalr_target; // @[frontend.scala 876:19]
  wire [31:0] ftq_io_brupdate_b2_target_offset; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_valid; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_is_mispredict_update; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_is_repair_update; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_bpdupdate_bits_btb_mispredicts; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_bpdupdate_bits_pc; // @[frontend.scala 876:19]
  wire [3:0] ftq_io_bpdupdate_bits_br_mask; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_cfi_idx_valid; // @[frontend.scala 876:19]
  wire [1:0] ftq_io_bpdupdate_bits_cfi_idx_bits; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_cfi_taken; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_cfi_mispredicted; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_cfi_is_br; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_cfi_is_jal; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_cfi_is_jalr; // @[frontend.scala 876:19]
  wire [15:0] ftq_io_bpdupdate_bits_ghist_old_history; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_ghist_new_saw_branch_taken; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_bpdupdate_bits_ghist_ras_idx; // @[frontend.scala 876:19]
  wire  ftq_io_bpdupdate_bits_lhist_0; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_bpdupdate_bits_target; // @[frontend.scala 876:19]
  wire [44:0] ftq_io_bpdupdate_bits_meta_0; // @[frontend.scala 876:19]
  wire  ftq_io_ras_update; // @[frontend.scala 876:19]
  wire [4:0] ftq_io_ras_update_idx; // @[frontend.scala 876:19]
  wire [39:0] ftq_io_ras_update_pc; // @[frontend.scala 876:19]
  wire  bpd_update_arbiter_clock; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_reset; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_ready; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_valid; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_is_mispredict_update; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_is_repair_update; // @[frontend.scala 939:34]
  wire [3:0] bpd_update_arbiter_io_in_0_bits_btb_mispredicts; // @[frontend.scala 939:34]
  wire [39:0] bpd_update_arbiter_io_in_0_bits_pc; // @[frontend.scala 939:34]
  wire [3:0] bpd_update_arbiter_io_in_0_bits_br_mask; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_idx_valid; // @[frontend.scala 939:34]
  wire [1:0] bpd_update_arbiter_io_in_0_bits_cfi_idx_bits; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_taken; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_mispredicted; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_is_br; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_is_jal; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_cfi_is_jalr; // @[frontend.scala 939:34]
  wire [15:0] bpd_update_arbiter_io_in_0_bits_ghist_old_history; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_taken; // @[frontend.scala 939:34]
  wire [4:0] bpd_update_arbiter_io_in_0_bits_ghist_ras_idx; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_0_bits_lhist_0; // @[frontend.scala 939:34]
  wire [39:0] bpd_update_arbiter_io_in_0_bits_target; // @[frontend.scala 939:34]
  wire [44:0] bpd_update_arbiter_io_in_0_bits_meta_0; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_ready; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_valid; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_is_mispredict_update; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_is_repair_update; // @[frontend.scala 939:34]
  wire [3:0] bpd_update_arbiter_io_in_1_bits_btb_mispredicts; // @[frontend.scala 939:34]
  wire [39:0] bpd_update_arbiter_io_in_1_bits_pc; // @[frontend.scala 939:34]
  wire [3:0] bpd_update_arbiter_io_in_1_bits_br_mask; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_idx_valid; // @[frontend.scala 939:34]
  wire [1:0] bpd_update_arbiter_io_in_1_bits_cfi_idx_bits; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_taken; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_mispredicted; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_is_br; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_is_jal; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_cfi_is_jalr; // @[frontend.scala 939:34]
  wire [15:0] bpd_update_arbiter_io_in_1_bits_ghist_old_history; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_taken; // @[frontend.scala 939:34]
  wire [4:0] bpd_update_arbiter_io_in_1_bits_ghist_ras_idx; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_in_1_bits_lhist_0; // @[frontend.scala 939:34]
  wire [39:0] bpd_update_arbiter_io_in_1_bits_target; // @[frontend.scala 939:34]
  wire [44:0] bpd_update_arbiter_io_in_1_bits_meta_0; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_ready; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_valid; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_is_mispredict_update; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_is_repair_update; // @[frontend.scala 939:34]
  wire [3:0] bpd_update_arbiter_io_out_bits_btb_mispredicts; // @[frontend.scala 939:34]
  wire [39:0] bpd_update_arbiter_io_out_bits_pc; // @[frontend.scala 939:34]
  wire [3:0] bpd_update_arbiter_io_out_bits_br_mask; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_idx_valid; // @[frontend.scala 939:34]
  wire [1:0] bpd_update_arbiter_io_out_bits_cfi_idx_bits; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_taken; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_mispredicted; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_is_br; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_is_jal; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_cfi_is_jalr; // @[frontend.scala 939:34]
  wire [15:0] bpd_update_arbiter_io_out_bits_ghist_old_history; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_taken; // @[frontend.scala 939:34]
  wire [4:0] bpd_update_arbiter_io_out_bits_ghist_ras_idx; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_out_bits_lhist_0; // @[frontend.scala 939:34]
  wire [39:0] bpd_update_arbiter_io_out_bits_target; // @[frontend.scala 939:34]
  wire [44:0] bpd_update_arbiter_io_out_bits_meta_0; // @[frontend.scala 939:34]
  wire  bpd_update_arbiter_io_chosen; // @[frontend.scala 939:34]
  reg  REG; // @[frontend.scala 366:16]
  wire  _T_4 = REG & ~reset; // @[frontend.scala 366:31]
  wire [39:0] _GEN_1 = REG & ~reset ? {{8'd0}, auto_reset_vector_sink_in} : 40'h0; // @[frontend.scala 366:49 frontend.scala 368:16]
  wire [1:0] _GEN_7 = REG & ~reset ? 2'h3 : 2'h0; // @[frontend.scala 366:49 frontend.scala 370:16]
  reg [39:0] s1_vpc; // @[frontend.scala 384:29]
  reg  s1_valid; // @[frontend.scala 385:29]
  reg [15:0] s1_ghist_old_history; // @[frontend.scala 386:29]
  reg  s1_ghist_current_saw_branch_not_taken; // @[frontend.scala 386:29]
  reg  s1_ghist_new_saw_branch_not_taken; // @[frontend.scala 386:29]
  reg  s1_ghist_new_saw_branch_taken; // @[frontend.scala 386:29]
  reg [4:0] s1_ghist_ras_idx; // @[frontend.scala 386:29]
  reg  s1_is_replay; // @[frontend.scala 387:29]
  reg  s1_is_sfence; // @[frontend.scala 388:29]
  reg [1:0] s1_tsrc; // @[frontend.scala 390:29]
  wire  _T_5 = ~s1_is_replay; // @[frontend.scala 391:41]
  wire  f4_ready = f4_io_enq_ready; // @[frontend.scala 529:22 frontend.scala 921:12]
  reg  s2_valid; // @[frontend.scala 443:25]
  reg [39:0] s2_vpc; // @[frontend.scala 444:25]
  wire  f3_mask_0 = f3_io_deq_valid & f3_io_deq_bits_mask[0]; // @[frontend.scala 704:39]
  reg  f3_prev_is_half; // @[frontend.scala 592:32]
  wire [2:0] f3_cfi_types_0 = f3_prev_is_half ? BranchDecode_io_out_cfi_type : BranchDecode_1_io_out_cfi_type; // @[frontend.scala 639:34 frontend.scala 644:40 frontend.scala 667:40]
  wire  _T_328 = f3_cfi_types_0 == 3'h2; // @[frontend.scala 746:25]
  wire  _T_329 = f3_cfi_types_0 == 3'h3; // @[frontend.scala 746:56]
  wire  _T_331 = f3_cfi_types_0 == 3'h1; // @[frontend.scala 747:26]
  wire  _T_332 = f3_cfi_types_0 == 3'h1 & f3_bpd_resp_io_deq_bits_preds_0_taken; // @[frontend.scala 747:37]
  wire  _T_334 = f3_cfi_types_0 == 3'h2 | f3_cfi_types_0 == 3'h3 | _T_332; // @[frontend.scala 746:69]
  wire  f3_redirects_0 = f3_mask_0 & _T_334; // @[frontend.scala 745:40]
  wire [63:0] _T_227 = f3_io_deq_bits_data; // @[frontend.scala 603:29]
  wire [15:0] hi_4 = _T_227[15:0]; // @[frontend.scala 620:34]
  reg [15:0] f3_prev_half; // @[frontend.scala 590:28]
  wire [31:0] _T_228 = {hi_4,f3_prev_half}; // @[Cat.scala 30:58]
  wire [31:0] f3_fetch_bundle_insts_0 = f3_prev_is_half ? _T_228 : _T_227[31:0]; // @[frontend.scala 639:34 frontend.scala 640:40 frontend.scala 663:40]
  wire  _T_347 = f3_fetch_bundle_insts_0[1:0] != 2'h3 & ~io_cpu_is_unicore; // @[frontend.scala 597:46]
  wire  _T_348 = ~_T_347; // @[frontend.scala 689:59]
  wire  _T_351 = f3_prev_is_half | ~(f3_mask_0 & ~_T_347); // @[frontend.scala 689:38]
  wire  f3_mask_1 = f3_io_deq_valid & f3_io_deq_bits_mask[1] & _T_351 & ~f3_redirects_0; // @[frontend.scala 704:71]
  wire [2:0] f3_cfi_types_1 = BranchDecode_2_io_out_cfi_type; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  _T_438 = f3_cfi_types_1 == 3'h2; // @[frontend.scala 746:25]
  wire  _T_439 = f3_cfi_types_1 == 3'h3; // @[frontend.scala 746:56]
  wire  _T_441 = f3_cfi_types_1 == 3'h1; // @[frontend.scala 747:26]
  wire  _T_442 = f3_cfi_types_1 == 3'h1 & f3_bpd_resp_io_deq_bits_preds_1_taken; // @[frontend.scala 747:37]
  wire  _T_444 = f3_cfi_types_1 == 3'h2 | f3_cfi_types_1 == 3'h3 | _T_442; // @[frontend.scala 746:69]
  wire  f3_redirects_1 = f3_mask_1 & _T_444; // @[frontend.scala 745:40]
  wire  _T_697 = f3_redirects_0 | f3_redirects_1; // @[frontend.scala 798:54]
  wire [31:0] f3_fetch_bundle_insts_1 = _T_227[47:16]; // @[frontend.scala 688:29]
  wire  _T_457 = f3_fetch_bundle_insts_1[1:0] != 2'h3 & ~io_cpu_is_unicore; // @[frontend.scala 597:46]
  wire  _T_458 = ~_T_457; // @[frontend.scala 696:40]
  wire  _T_460 = ~(f3_mask_1 & ~_T_457); // @[frontend.scala 696:20]
  wire  f3_mask_2 = f3_io_deq_valid & f3_io_deq_bits_mask[2] & _T_460 & ~_T_697; // @[frontend.scala 704:71]
  wire [2:0] f3_cfi_types_2 = BranchDecode_3_io_out_cfi_type; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  _T_547 = f3_cfi_types_2 == 3'h2; // @[frontend.scala 746:25]
  wire  _T_548 = f3_cfi_types_2 == 3'h3; // @[frontend.scala 746:56]
  wire  _T_550 = f3_cfi_types_2 == 3'h1; // @[frontend.scala 747:26]
  wire  _T_551 = f3_cfi_types_2 == 3'h1 & f3_bpd_resp_io_deq_bits_preds_2_taken; // @[frontend.scala 747:37]
  wire  _T_553 = f3_cfi_types_2 == 3'h2 | f3_cfi_types_2 == 3'h3 | _T_551; // @[frontend.scala 746:69]
  wire  f3_redirects_2 = f3_mask_2 & _T_553; // @[frontend.scala 745:40]
  wire  _T_698 = f3_redirects_0 | f3_redirects_1 | f3_redirects_2; // @[frontend.scala 798:54]
  wire [31:0] f3_fetch_bundle_insts_2 = _T_227[63:32]; // @[frontend.scala 695:29]
  wire  _T_566 = f3_fetch_bundle_insts_2[1:0] != 2'h3 & ~io_cpu_is_unicore; // @[frontend.scala 597:46]
  wire  _T_567 = ~_T_566; // @[frontend.scala 692:41]
  wire  _T_568 = f3_mask_2 & ~_T_566; // @[frontend.scala 692:38]
  wire [15:0] lo_4 = _T_227[63:48]; // @[frontend.scala 691:44]
  wire [31:0] f3_fetch_bundle_insts_3 = {16'h0,lo_4}; // @[Cat.scala 30:58]
  wire  _T_572 = f3_fetch_bundle_insts_3[1:0] != 2'h3 & ~io_cpu_is_unicore; // @[frontend.scala 597:46]
  wire  _T_573 = ~_T_572; // @[frontend.scala 693:13]
  wire  _T_575 = ~(f3_mask_2 & ~_T_566 | _T_573); // @[frontend.scala 692:20]
  wire  f3_mask_3 = f3_io_deq_valid & f3_io_deq_bits_mask[3] & _T_575 & ~_T_698; // @[frontend.scala 704:71]
  wire [2:0] f3_cfi_types_3 = BranchDecode_4_io_out_cfi_type; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  _T_662 = f3_cfi_types_3 == 3'h2; // @[frontend.scala 746:25]
  wire  _T_663 = f3_cfi_types_3 == 3'h3; // @[frontend.scala 746:56]
  wire  _T_665 = f3_cfi_types_3 == 3'h1; // @[frontend.scala 747:26]
  wire  _T_666 = f3_cfi_types_3 == 3'h1 & f3_bpd_resp_io_deq_bits_preds_3_taken; // @[frontend.scala 747:37]
  wire  _T_668 = f3_cfi_types_3 == 3'h2 | f3_cfi_types_3 == 3'h3 | _T_666; // @[frontend.scala 746:69]
  wire  f3_redirects_3 = f3_mask_3 & _T_668; // @[frontend.scala 745:40]
  wire  _T_699 = f3_redirects_0 | f3_redirects_1 | f3_redirects_2 | f3_redirects_3; // @[frontend.scala 798:54]
  wire [1:0] _T_694 = f3_redirects_2 ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _T_695 = f3_redirects_1 ? 2'h1 : _T_694; // @[Mux.scala 47:69]
  wire [1:0] f3_fetch_bundle_cfi_idx_bits = f3_redirects_0 ? 2'h0 : _T_695; // @[Mux.scala 47:69]
  wire  f3_ret_mask_3 = BranchDecode_4_io_out_is_ret; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  f3_ret_mask_2 = BranchDecode_3_io_out_is_ret; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  f3_ret_mask_1 = BranchDecode_2_io_out_is_ret; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  f3_ret_mask_0 = f3_prev_is_half ? BranchDecode_io_out_is_ret : BranchDecode_1_io_out_is_ret; // @[frontend.scala 639:34 frontend.scala 644:40 frontend.scala 667:40]
  wire  _GEN_104 = 2'h1 == f3_fetch_bundle_cfi_idx_bits ? f3_ret_mask_1 : f3_ret_mask_0; // @[frontend.scala 771:33 frontend.scala 771:33]
  wire  _GEN_105 = 2'h2 == f3_fetch_bundle_cfi_idx_bits ? f3_ret_mask_2 : _GEN_104; // @[frontend.scala 771:33 frontend.scala 771:33]
  wire  f3_fetch_bundle_cfi_is_ret = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_ret_mask_3 : _GEN_105; // @[frontend.scala 771:33 frontend.scala 771:33]
  wire [39:0] _WIRE_19_target = BranchDecode_4_io_out_target; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire [39:0] f3_targs_3 = _T_663 ? f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits : _WIRE_19_target; // @[frontend.scala 705:26]
  wire [39:0] _WIRE_14_target = BranchDecode_3_io_out_target; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire [39:0] f3_targs_2 = _T_548 ? f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits : _WIRE_14_target; // @[frontend.scala 705:26]
  wire [39:0] _WIRE_9_target = BranchDecode_2_io_out_target; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire [39:0] f3_targs_1 = _T_439 ? f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits : _WIRE_9_target; // @[frontend.scala 705:26]
  wire [39:0] _GEN_91 = f3_prev_is_half ? BranchDecode_io_out_target : BranchDecode_1_io_out_target; // @[frontend.scala 639:34 frontend.scala 644:40 frontend.scala 667:40]
  wire [39:0] f3_targs_0 = _T_329 ? f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits : _GEN_91; // @[frontend.scala 705:26]
  wire [39:0] _GEN_115 = 2'h1 == f3_fetch_bundle_cfi_idx_bits ? f3_targs_1 : f3_targs_0; // @[frontend.scala 799:8 frontend.scala 799:8]
  wire [39:0] _GEN_116 = 2'h2 == f3_fetch_bundle_cfi_idx_bits ? f3_targs_2 : _GEN_115; // @[frontend.scala 799:8 frontend.scala 799:8]
  wire [39:0] _GEN_117 = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_targs_3 : _GEN_116; // @[frontend.scala 799:8 frontend.scala 799:8]
  wire [39:0] _T_705 = f3_fetch_bundle_cfi_is_ret ? ras_io_read_addr : _GEN_117; // @[frontend.scala 799:8]
  wire [39:0] f3_fetch_bundle_pc = f3_io_deq_bits_pc; // @[frontend.scala 572:29 frontend.scala 581:22]
  wire [39:0] _T_706 = ~f3_fetch_bundle_pc; // @[frontend.scala 161:33]
  wire [39:0] _T_707 = _T_706 | 40'h7; // @[frontend.scala 161:39]
  wire [39:0] _T_708 = ~_T_707; // @[frontend.scala 161:31]
  wire [39:0] _T_710 = _T_708 + 40'h8; // @[frontend.scala 168:23]
  wire [39:0] f3_predicted_target = f3_redirects_0 | f3_redirects_1 | f3_redirects_2 | f3_redirects_3 ? _T_705 : _T_710; // @[frontend.scala 798:32]
  reg [15:0] s2_ghist_old_history; // @[frontend.scala 445:21]
  wire  f3_br_mask_3 = f3_mask_3 & _T_665; // @[frontend.scala 750:37]
  wire  f3_br_mask_2 = f3_mask_2 & _T_550; // @[frontend.scala 750:37]
  wire [1:0] hi_3 = {f3_br_mask_3,f3_br_mask_2}; // @[frontend.scala 580:41]
  wire  f3_br_mask_1 = f3_mask_1 & _T_441; // @[frontend.scala 750:37]
  wire  f3_br_mask_0 = f3_mask_0 & _T_331; // @[frontend.scala 750:37]
  wire [1:0] lo_3 = {f3_br_mask_1,f3_br_mask_0}; // @[frontend.scala 580:41]
  wire [3:0] f3_fetch_bundle_br_mask = {f3_br_mask_3,f3_br_mask_2,f3_br_mask_1,f3_br_mask_0}; // @[frontend.scala 580:41]
  wire [3:0] _T_711 = f3_fetch_bundle_br_mask >> f3_fetch_bundle_cfi_idx_bits; // @[frontend.scala 810:28]
  wire  _T_731 = _T_711[0] & _T_699; // @[frontend.scala 99:48]
  wire [15:0] f3_fetch_bundle_ghist_old_history = f3_io_deq_bits_ghist_old_history; // @[frontend.scala 572:29 frontend.scala 774:28]
  wire [16:0] _T_733 = {f3_fetch_bundle_ghist_old_history, 1'h0}; // @[frontend.scala 99:91]
  wire [16:0] _T_734 = _T_733 | 17'h1; // @[frontend.scala 99:96]
  wire [3:0] _T_714 = 4'h1 << f3_fetch_bundle_cfi_idx_bits; // @[OneHot.scala 58:35]
  wire [3:0] _T_716 = {{1'd0}, _T_714[3:1]}; // @[util.scala 444:29]
  wire [3:0] _T_719 = _T_714 | _T_716; // @[util.scala 444:45]
  wire [3:0] _T_717 = {{2'd0}, _T_714[3:2]}; // @[util.scala 444:29]
  wire [3:0] _T_720 = _T_719 | _T_717; // @[util.scala 444:45]
  wire [3:0] _T_718 = {{3'd0}, _T_714[3]}; // @[util.scala 444:29]
  wire [3:0] _T_721 = _T_720 | _T_718; // @[util.scala 444:45]
  wire [3:0] _T_723 = _T_731 ? _T_714 : 4'h0; // @[frontend.scala 91:73]
  wire [3:0] _T_724 = ~_T_723; // @[frontend.scala 91:69]
  wire [3:0] _T_725 = _T_721 & _T_724; // @[frontend.scala 91:67]
  wire [3:0] _T_727 = _T_699 ? _T_725 : 4'hf; // @[frontend.scala 90:44]
  wire [3:0] _T_728 = f3_fetch_bundle_br_mask & _T_727; // @[frontend.scala 90:39]
  wire  f3_fetch_bundle_ghist_current_saw_branch_not_taken = f3_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 572:29 frontend.scala 774:28]
  wire  _T_730 = _T_728 != 4'h0 | f3_fetch_bundle_ghist_current_saw_branch_not_taken; // @[frontend.scala 98:61]
  wire [16:0] _T_736 = _T_730 ? _T_733 : {{1'd0}, f3_fetch_bundle_ghist_old_history}; // @[frontend.scala 100:37]
  wire [16:0] _T_737 = _T_711[0] & _T_699 & _T_699 ? _T_734 : _T_736; // @[frontend.scala 99:37]
  wire [15:0] f3_predicted_ghist_old_history = _T_737[15:0]; // @[frontend.scala 88:27 frontend.scala 99:31]
  reg  s2_ghist_new_saw_branch_not_taken; // @[frontend.scala 445:21]
  wire  _T_764 = ~s2_ghist_new_saw_branch_not_taken; // @[frontend.scala 77:32]
  wire  _T_765 = s2_ghist_old_history == f3_predicted_ghist_old_history & _T_764; // @[frontend.scala 76:42]
  reg  s2_ghist_new_saw_branch_taken; // @[frontend.scala 445:21]
  wire  _T_766 = ~s2_ghist_new_saw_branch_taken; // @[frontend.scala 78:28]
  wire  _T_767 = _T_765 & _T_766; // @[frontend.scala 77:68]
  wire  f3_correct_f2_ghist = ~_T_767; // @[frontend.scala 81:41]
  wire  f3_ready = f3_io_enq_ready; // @[frontend.scala 455:22 frontend.scala 530:12]
  wire  _T_180 = s2_valid & icache_io_resp_valid & ~f3_ready; // @[frontend.scala 485:43]
  wire  _T_181 = s2_valid & ~icache_io_resp_valid | _T_180; // @[frontend.scala 484:45]
  wire [6:0] f2_mask = 7'hf << s2_vpc[2:1]; // @[frontend.scala 178:31]
  wire  _T_99 = bpd_io_resp_f2_preds_0_is_br & bpd_io_resp_f2_preds_0_taken; // @[frontend.scala 464:35]
  wire  _T_100 = bpd_io_resp_f2_preds_0_is_jal | _T_99; // @[frontend.scala 463:34]
  wire  f2_redirects_0 = s2_valid & f2_mask[0] & bpd_io_resp_f2_preds_0_predicted_pc_valid & _T_100; // @[frontend.scala 462:71]
  wire  _T_104 = bpd_io_resp_f2_preds_1_is_br & bpd_io_resp_f2_preds_1_taken; // @[frontend.scala 464:35]
  wire  _T_105 = bpd_io_resp_f2_preds_1_is_jal | _T_104; // @[frontend.scala 463:34]
  wire  f2_redirects_1 = s2_valid & f2_mask[1] & bpd_io_resp_f2_preds_1_predicted_pc_valid & _T_105; // @[frontend.scala 462:71]
  wire  _T_109 = bpd_io_resp_f2_preds_2_is_br & bpd_io_resp_f2_preds_2_taken; // @[frontend.scala 464:35]
  wire  _T_110 = bpd_io_resp_f2_preds_2_is_jal | _T_109; // @[frontend.scala 463:34]
  wire  f2_redirects_2 = s2_valid & f2_mask[2] & bpd_io_resp_f2_preds_2_predicted_pc_valid & _T_110; // @[frontend.scala 462:71]
  wire  _T_114 = bpd_io_resp_f2_preds_3_is_br & bpd_io_resp_f2_preds_3_taken; // @[frontend.scala 464:35]
  wire  _T_115 = bpd_io_resp_f2_preds_3_is_jal | _T_114; // @[frontend.scala 463:34]
  wire  f2_redirects_3 = s2_valid & f2_mask[3] & bpd_io_resp_f2_preds_3_predicted_pc_valid & _T_115; // @[frontend.scala 462:71]
  wire  f2_do_redirect = f2_redirects_0 | f2_redirects_1 | f2_redirects_2 | f2_redirects_3; // @[frontend.scala 468:45]
  wire [1:0] _T_116 = f2_redirects_2 ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _T_117 = f2_redirects_1 ? 2'h1 : _T_116; // @[Mux.scala 47:69]
  wire [1:0] f2_redirect_idx = f2_redirects_0 ? 2'h0 : _T_117; // @[Mux.scala 47:69]
  wire [39:0] _T_122 = f2_redirect_idx == 2'h1 ? bpd_io_resp_f2_preds_1_predicted_pc_bits :
    bpd_io_resp_f2_preds_0_predicted_pc_bits; // @[package.scala 32:76]
  wire [39:0] _T_124 = f2_redirect_idx == 2'h2 ? bpd_io_resp_f2_preds_2_predicted_pc_bits : _T_122; // @[package.scala 32:76]
  wire [39:0] _T_126 = f2_redirect_idx == 2'h3 ? bpd_io_resp_f2_preds_3_predicted_pc_bits : _T_124; // @[package.scala 32:76]
  wire [39:0] _T_127 = ~s2_vpc; // @[frontend.scala 161:33]
  wire [39:0] _T_128 = _T_127 | 40'h7; // @[frontend.scala 161:39]
  wire [39:0] _T_129 = ~_T_128; // @[frontend.scala 161:31]
  wire [39:0] _T_131 = _T_129 + 40'h8; // @[frontend.scala 168:23]
  wire [39:0] f2_predicted_target = f2_do_redirect ? _T_126 : _T_131; // @[frontend.scala 469:32]
  wire  _GEN_30 = 2'h1 == f2_redirect_idx ? bpd_io_resp_f2_preds_1_is_br : bpd_io_resp_f2_preds_0_is_br; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _GEN_31 = 2'h2 == f2_redirect_idx ? bpd_io_resp_f2_preds_2_is_br : _GEN_30; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _GEN_32 = 2'h3 == f2_redirect_idx ? bpd_io_resp_f2_preds_3_is_br : _GEN_31; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _GEN_26 = 2'h1 == f2_redirect_idx ? bpd_io_resp_f2_preds_1_taken : bpd_io_resp_f2_preds_0_taken; // @[frontend.scala 474:46 frontend.scala 474:46]
  wire  _GEN_27 = 2'h2 == f2_redirect_idx ? bpd_io_resp_f2_preds_2_taken : _GEN_26; // @[frontend.scala 474:46 frontend.scala 474:46]
  wire  _GEN_28 = 2'h3 == f2_redirect_idx ? bpd_io_resp_f2_preds_3_taken : _GEN_27; // @[frontend.scala 474:46 frontend.scala 474:46]
  wire  _T_134 = _GEN_28 & f2_do_redirect; // @[frontend.scala 474:46]
  wire  _T_153 = _GEN_32 & _T_134; // @[frontend.scala 99:48]
  wire [16:0] _T_155 = {s2_ghist_old_history, 1'h0}; // @[frontend.scala 99:91]
  wire [16:0] _T_156 = _T_155 | 17'h1; // @[frontend.scala 99:96]
  wire  hi_hi_1 = bpd_io_resp_f2_preds_3_is_br & bpd_io_resp_f2_preds_3_predicted_pc_valid; // @[frontend.scala 473:40]
  wire  hi_lo_1 = bpd_io_resp_f2_preds_2_is_br & bpd_io_resp_f2_preds_2_predicted_pc_valid; // @[frontend.scala 473:40]
  wire  lo_hi_1 = bpd_io_resp_f2_preds_1_is_br & bpd_io_resp_f2_preds_1_predicted_pc_valid; // @[frontend.scala 473:40]
  wire  lo_lo_1 = bpd_io_resp_f2_preds_0_is_br & bpd_io_resp_f2_preds_0_predicted_pc_valid; // @[frontend.scala 473:40]
  wire [3:0] _T_132 = {hi_hi_1,hi_lo_1,lo_hi_1,lo_lo_1}; // @[Cat.scala 30:58]
  wire [6:0] _GEN_240 = {{3'd0}, _T_132}; // @[frontend.scala 473:72]
  wire [6:0] _T_133 = _GEN_240 & f2_mask; // @[frontend.scala 473:72]
  wire [3:0] _T_136 = 4'h1 << f2_redirect_idx; // @[OneHot.scala 58:35]
  wire [3:0] _T_138 = {{1'd0}, _T_136[3:1]}; // @[util.scala 444:29]
  wire [3:0] _T_141 = _T_136 | _T_138; // @[util.scala 444:45]
  wire [3:0] _T_139 = {{2'd0}, _T_136[3:2]}; // @[util.scala 444:29]
  wire [3:0] _T_142 = _T_141 | _T_139; // @[util.scala 444:45]
  wire [3:0] _T_140 = {{3'd0}, _T_136[3]}; // @[util.scala 444:29]
  wire [3:0] _T_143 = _T_142 | _T_140; // @[util.scala 444:45]
  wire [3:0] _T_145 = _T_153 ? _T_136 : 4'h0; // @[frontend.scala 91:73]
  wire [3:0] _T_146 = ~_T_145; // @[frontend.scala 91:69]
  wire [3:0] _T_147 = _T_143 & _T_146; // @[frontend.scala 91:67]
  wire [3:0] _T_149 = f2_do_redirect ? _T_147 : 4'hf; // @[frontend.scala 90:44]
  wire [6:0] _GEN_244 = {{3'd0}, _T_149}; // @[frontend.scala 90:39]
  wire [6:0] _T_150 = _T_133 & _GEN_244; // @[frontend.scala 90:39]
  reg  s2_ghist_current_saw_branch_not_taken; // @[frontend.scala 445:21]
  wire  _T_152 = _T_150 != 7'h0 | s2_ghist_current_saw_branch_not_taken; // @[frontend.scala 98:61]
  wire [16:0] _T_158 = _T_152 ? _T_155 : {{1'd0}, s2_ghist_old_history}; // @[frontend.scala 100:37]
  wire [16:0] _T_159 = _GEN_32 & _T_134 & f2_do_redirect ? _T_156 : _T_158; // @[frontend.scala 99:37]
  wire [15:0] f2_predicted_ghist_old_history = _T_159[15:0]; // @[frontend.scala 88:27 frontend.scala 99:31]
  wire  _T_171 = ~s1_ghist_new_saw_branch_not_taken; // @[frontend.scala 77:32]
  wire  _T_172 = s1_ghist_old_history == f2_predicted_ghist_old_history & _T_171; // @[frontend.scala 76:42]
  wire  _T_173 = ~s1_ghist_new_saw_branch_taken; // @[frontend.scala 78:28]
  wire  _T_174 = _T_172 & _T_173; // @[frontend.scala 77:68]
  wire  f2_correct_f1_ghist = ~_T_174; // @[frontend.scala 81:41]
  wire  _T_197 = ~s1_valid; // @[frontend.scala 499:84]
  wire  _T_198 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid; // @[frontend.scala 499:81]
  wire  _GEN_54 = s2_valid & f3_ready & _T_198; // @[frontend.scala 494:38]
  wire  _GEN_75 = _T_181 | _GEN_54; // @[frontend.scala 485:58 frontend.scala 493:14]
  wire  _T_778 = ~s2_valid; // @[frontend.scala 837:18]
  wire  _T_779 = ~s2_valid & s1_valid; // @[frontend.scala 837:28]
  wire  _T_759 = s1_ghist_old_history == f3_predicted_ghist_old_history & _T_171; // @[frontend.scala 76:42]
  wire  _T_761 = _T_759 & _T_173; // @[frontend.scala 77:68]
  wire  f3_correct_f1_ghist = ~_T_761; // @[frontend.scala 81:41]
  wire  _T_791 = _T_779 & (s1_vpc != f3_predicted_target | f3_correct_f1_ghist); // @[frontend.scala 840:35]
  wire  _T_792 = s2_valid & (s2_vpc != f3_predicted_target | f3_correct_f2_ghist) | _T_791; // @[frontend.scala 839:90]
  wire  _T_795 = _T_778 & _T_197; // @[frontend.scala 841:22]
  wire  _T_796 = _T_792 | _T_795; // @[frontend.scala 840:95]
  wire  _GEN_121 = _T_796 | _GEN_75; // @[frontend.scala 841:37 frontend.scala 843:16]
  wire  _GEN_138 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_75 : _GEN_121; // @[frontend.scala 837:99]
  wire  _GEN_160 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_75 : _GEN_138; // @[frontend.scala 835:79]
  wire  _GEN_184 = f3_io_deq_valid & f4_ready ? _GEN_160 : _GEN_75; // @[frontend.scala 828:38]
  wire  _GEN_208 = io_cpu_redirect_flush | _GEN_184; // @[frontend.scala 979:38 frontend.scala 984:17]
  wire  f1_clear = io_cpu_sfence_valid | _GEN_208; // @[frontend.scala 967:30 frontend.scala 972:17]
  wire  _T_7 = ~f1_clear; // @[frontend.scala 391:58]
  reg  REG_1_valid; // @[frontend.scala 396:35]
  reg  REG_1_bits_rs1; // @[frontend.scala 396:35]
  reg  REG_1_bits_rs2; // @[frontend.scala 396:35]
  reg [38:0] REG_1_bits_addr; // @[frontend.scala 396:35]
  reg  REG_1_bits_asid; // @[frontend.scala 396:35]
  wire  s1_tlb_miss = _T_5 & tlb_io_resp_miss; // @[frontend.scala 399:35]
  reg  REG_2_pf_inst; // @[frontend.scala 400:46]
  reg  REG_2_ae_inst; // @[frontend.scala 400:46]
  wire  s1_tlb_resp_pf_inst = s1_is_replay ? REG_2_pf_inst : tlb_io_resp_pf_inst; // @[frontend.scala 400:24]
  wire  s1_tlb_resp_ae_inst = s1_is_replay ? REG_2_ae_inst : tlb_io_resp_ae_inst; // @[frontend.scala 400:24]
  reg [31:0] REG_3; // @[frontend.scala 401:42]
  wire [6:0] f1_mask = 7'hf << s1_vpc[2:1]; // @[frontend.scala 178:31]
  wire  _T_15 = bpd_io_resp_f1_preds_0_is_br & bpd_io_resp_f1_preds_0_taken; // @[frontend.scala 411:35]
  wire  _T_16 = bpd_io_resp_f1_preds_0_is_jal | _T_15; // @[frontend.scala 410:34]
  wire  f1_redirects_0 = s1_valid & f1_mask[0] & bpd_io_resp_f1_preds_0_predicted_pc_valid & _T_16; // @[frontend.scala 409:71]
  wire  _T_20 = bpd_io_resp_f1_preds_1_is_br & bpd_io_resp_f1_preds_1_taken; // @[frontend.scala 411:35]
  wire  _T_21 = bpd_io_resp_f1_preds_1_is_jal | _T_20; // @[frontend.scala 410:34]
  wire  f1_redirects_1 = s1_valid & f1_mask[1] & bpd_io_resp_f1_preds_1_predicted_pc_valid & _T_21; // @[frontend.scala 409:71]
  wire  _T_25 = bpd_io_resp_f1_preds_2_is_br & bpd_io_resp_f1_preds_2_taken; // @[frontend.scala 411:35]
  wire  _T_26 = bpd_io_resp_f1_preds_2_is_jal | _T_25; // @[frontend.scala 410:34]
  wire  f1_redirects_2 = s1_valid & f1_mask[2] & bpd_io_resp_f1_preds_2_predicted_pc_valid & _T_26; // @[frontend.scala 409:71]
  wire  _T_30 = bpd_io_resp_f1_preds_3_is_br & bpd_io_resp_f1_preds_3_taken; // @[frontend.scala 411:35]
  wire  _T_31 = bpd_io_resp_f1_preds_3_is_jal | _T_30; // @[frontend.scala 410:34]
  wire  f1_redirects_3 = s1_valid & f1_mask[3] & bpd_io_resp_f1_preds_3_predicted_pc_valid & _T_31; // @[frontend.scala 409:71]
  wire [1:0] _T_32 = f1_redirects_2 ? 2'h2 : 2'h3; // @[Mux.scala 47:69]
  wire [1:0] _T_33 = f1_redirects_1 ? 2'h1 : _T_32; // @[Mux.scala 47:69]
  wire [1:0] f1_redirect_idx = f1_redirects_0 ? 2'h0 : _T_33; // @[Mux.scala 47:69]
  wire  f1_do_redirect = f1_redirects_0 | f1_redirects_1 | f1_redirects_2 | f1_redirects_3; // @[frontend.scala 414:45]
  wire [39:0] _T_38 = f1_redirect_idx == 2'h1 ? bpd_io_resp_f1_preds_1_predicted_pc_bits :
    bpd_io_resp_f1_preds_0_predicted_pc_bits; // @[package.scala 32:76]
  wire [39:0] _T_40 = f1_redirect_idx == 2'h2 ? bpd_io_resp_f1_preds_2_predicted_pc_bits : _T_38; // @[package.scala 32:76]
  wire [39:0] _T_42 = f1_redirect_idx == 2'h3 ? bpd_io_resp_f1_preds_3_predicted_pc_bits : _T_40; // @[package.scala 32:76]
  wire [39:0] _T_43 = ~s1_vpc; // @[frontend.scala 161:33]
  wire [39:0] _T_44 = _T_43 | 40'h7; // @[frontend.scala 161:39]
  wire [39:0] _T_45 = ~_T_44; // @[frontend.scala 161:31]
  wire [39:0] _T_47 = _T_45 + 40'h8; // @[frontend.scala 168:23]
  wire [39:0] f1_predicted_target = f1_do_redirect ? _T_42 : _T_47; // @[frontend.scala 416:32]
  wire  lo_lo = bpd_io_resp_f1_preds_0_is_br & bpd_io_resp_f1_preds_0_predicted_pc_valid; // @[frontend.scala 421:40]
  wire  lo_hi = bpd_io_resp_f1_preds_1_is_br & bpd_io_resp_f1_preds_1_predicted_pc_valid; // @[frontend.scala 421:40]
  wire  hi_lo = bpd_io_resp_f1_preds_2_is_br & bpd_io_resp_f1_preds_2_predicted_pc_valid; // @[frontend.scala 421:40]
  wire  hi_hi = bpd_io_resp_f1_preds_3_is_br & bpd_io_resp_f1_preds_3_predicted_pc_valid; // @[frontend.scala 421:40]
  wire [3:0] _T_48 = {hi_hi,hi_lo,lo_hi,lo_lo}; // @[Cat.scala 30:58]
  wire [6:0] _GEN_245 = {{3'd0}, _T_48}; // @[frontend.scala 421:72]
  wire [6:0] _T_49 = _GEN_245 & f1_mask; // @[frontend.scala 421:72]
  wire  _GEN_9 = 2'h1 == f1_redirect_idx ? bpd_io_resp_f1_preds_1_taken : bpd_io_resp_f1_preds_0_taken; // @[frontend.scala 422:46 frontend.scala 422:46]
  wire  _GEN_10 = 2'h2 == f1_redirect_idx ? bpd_io_resp_f1_preds_2_taken : _GEN_9; // @[frontend.scala 422:46 frontend.scala 422:46]
  wire  _GEN_11 = 2'h3 == f1_redirect_idx ? bpd_io_resp_f1_preds_3_taken : _GEN_10; // @[frontend.scala 422:46 frontend.scala 422:46]
  wire  _T_50 = _GEN_11 & f1_do_redirect; // @[frontend.scala 422:46]
  wire [3:0] _T_52 = 4'h1 << f1_redirect_idx; // @[OneHot.scala 58:35]
  wire [3:0] _T_54 = {{1'd0}, _T_52[3:1]}; // @[util.scala 444:29]
  wire [3:0] _T_55 = {{2'd0}, _T_52[3:2]}; // @[util.scala 444:29]
  wire [3:0] _T_56 = {{3'd0}, _T_52[3]}; // @[util.scala 444:29]
  wire [3:0] _T_57 = _T_52 | _T_54; // @[util.scala 444:45]
  wire [3:0] _T_58 = _T_57 | _T_55; // @[util.scala 444:45]
  wire [3:0] _T_59 = _T_58 | _T_56; // @[util.scala 444:45]
  wire  _GEN_13 = 2'h1 == f1_redirect_idx ? bpd_io_resp_f1_preds_1_is_br : bpd_io_resp_f1_preds_0_is_br; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _GEN_14 = 2'h2 == f1_redirect_idx ? bpd_io_resp_f1_preds_2_is_br : _GEN_13; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _GEN_15 = 2'h3 == f1_redirect_idx ? bpd_io_resp_f1_preds_3_is_br : _GEN_14; // @[frontend.scala 91:84 frontend.scala 91:84]
  wire  _T_60 = _GEN_15 & _T_50; // @[frontend.scala 91:84]
  wire [3:0] _T_61 = _GEN_15 & _T_50 ? _T_52 : 4'h0; // @[frontend.scala 91:73]
  wire [3:0] _T_62 = ~_T_61; // @[frontend.scala 91:69]
  wire [3:0] _T_63 = _T_59 & _T_62; // @[frontend.scala 91:67]
  wire [3:0] _T_65 = f1_do_redirect ? _T_63 : 4'hf; // @[frontend.scala 90:44]
  wire [6:0] _GEN_249 = {{3'd0}, _T_65}; // @[frontend.scala 90:39]
  wire [6:0] _T_66 = _T_49 & _GEN_249; // @[frontend.scala 90:39]
  wire  _T_68 = _T_66 != 7'h0 | s1_ghist_current_saw_branch_not_taken; // @[frontend.scala 98:61]
  wire [16:0] _T_71 = {s1_ghist_old_history, 1'h0}; // @[frontend.scala 99:91]
  wire [16:0] _T_72 = _T_71 | 17'h1; // @[frontend.scala 99:96]
  wire [16:0] _T_74 = _T_68 ? _T_71 : {{1'd0}, s1_ghist_old_history}; // @[frontend.scala 100:37]
  wire [16:0] _T_75 = _T_60 & f1_do_redirect ? _T_72 : _T_74; // @[frontend.scala 99:37]
  wire  _GEN_16 = s1_valid & ~s1_tlb_miss ? ~(s1_tlb_resp_ae_inst | s1_tlb_resp_pf_inst) : _T_4; // @[frontend.scala 430:35 frontend.scala 432:18]
  wire [1:0] _GEN_17 = s1_valid & ~s1_tlb_miss ? 2'h0 : _GEN_7; // @[frontend.scala 430:35 frontend.scala 433:18]
  wire [39:0] _GEN_18 = s1_valid & ~s1_tlb_miss ? f1_predicted_target : _GEN_1; // @[frontend.scala 430:35 frontend.scala 434:18]
  wire [4:0] _GEN_19 = s1_valid & ~s1_tlb_miss ? s1_ghist_ras_idx : 5'h0; // @[frontend.scala 430:35 frontend.scala 435:18]
  wire [15:0] f1_predicted_ghist_old_history = _T_75[15:0]; // @[frontend.scala 88:27 frontend.scala 99:31]
  wire [15:0] _GEN_23 = s1_valid & ~s1_tlb_miss ? f1_predicted_ghist_old_history : 16'h0; // @[frontend.scala 430:35 frontend.scala 435:18]
  reg [4:0] s2_ghist_ras_idx; // @[frontend.scala 445:21]
  reg [31:0] s2_ppc; // @[frontend.scala 447:24]
  reg [1:0] s2_tsrc; // @[frontend.scala 448:24]
  reg  s2_tlb_resp_pf_inst; // @[frontend.scala 451:28]
  reg  s2_tlb_resp_ae_inst; // @[frontend.scala 451:28]
  reg  s2_tlb_miss; // @[frontend.scala 452:28]
  reg  REG_4; // @[frontend.scala 453:29]
  wire  s2_is_replay = REG_4 & s2_valid; // @[frontend.scala 453:44]
  wire  _T_92 = s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst; // @[frontend.scala 454:50]
  wire  _T_94 = ~s2_is_replay; // @[frontend.scala 454:77]
  wire  s2_xcpt = s2_valid & (s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst) & ~s2_is_replay; // @[frontend.scala 454:74]
  wire [4:0] _GEN_33 = s1_valid & s1_vpc == f2_predicted_target & ~f2_correct_f1_ghist ? s2_ghist_ras_idx :
    s1_ghist_ras_idx; // @[frontend.scala 495:79 frontend.scala 497:16 frontend.scala 446:12]
  wire  _GEN_34 = s1_valid & s1_vpc == f2_predicted_target & ~f2_correct_f1_ghist ? 1'h0 : s1_ghist_new_saw_branch_taken
    ; // @[frontend.scala 495:79 frontend.scala 497:16 frontend.scala 446:12]
  wire  _GEN_35 = s1_valid & s1_vpc == f2_predicted_target & ~f2_correct_f1_ghist ? 1'h0 :
    s1_ghist_new_saw_branch_not_taken; // @[frontend.scala 495:79 frontend.scala 497:16 frontend.scala 446:12]
  wire  _GEN_36 = s1_valid & s1_vpc == f2_predicted_target & ~f2_correct_f1_ghist ? 1'h0 :
    s1_ghist_current_saw_branch_not_taken; // @[frontend.scala 495:79 frontend.scala 497:16 frontend.scala 446:12]
  wire [15:0] _GEN_37 = s1_valid & s1_vpc == f2_predicted_target & ~f2_correct_f1_ghist ? f2_predicted_ghist_old_history
     : s1_ghist_old_history; // @[frontend.scala 495:79 frontend.scala 497:16 frontend.scala 446:12]
  wire  _GEN_39 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ? ~(_T_92 & _T_94) :
    _GEN_16; // @[frontend.scala 499:95 frontend.scala 502:20]
  wire [39:0] _GEN_40 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ?
    f2_predicted_target : _GEN_18; // @[frontend.scala 499:95 frontend.scala 503:20]
  wire [4:0] _GEN_42 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ? s2_ghist_ras_idx
     : _GEN_19; // @[frontend.scala 499:95 frontend.scala 505:20]
  wire [15:0] _GEN_46 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ?
    f2_predicted_ghist_old_history : _GEN_23; // @[frontend.scala 499:95 frontend.scala 505:20]
  wire [1:0] _GEN_47 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ? 2'h1 : 2'h0; // @[frontend.scala 499:95 frontend.scala 506:20]
  wire [1:0] _GEN_48 = s1_valid & (s1_vpc != f2_predicted_target | f2_correct_f1_ghist) | ~s1_valid ? 2'h1 : _GEN_17; // @[frontend.scala 499:95 frontend.scala 507:20]
  wire [4:0] _GEN_49 = s2_valid & f3_ready ? _GEN_33 : s1_ghist_ras_idx; // @[frontend.scala 494:38 frontend.scala 446:12]
  wire  _GEN_50 = s2_valid & f3_ready ? _GEN_34 : s1_ghist_new_saw_branch_taken; // @[frontend.scala 494:38 frontend.scala 446:12]
  wire  _GEN_51 = s2_valid & f3_ready ? _GEN_35 : s1_ghist_new_saw_branch_not_taken; // @[frontend.scala 494:38 frontend.scala 446:12]
  wire  _GEN_52 = s2_valid & f3_ready ? _GEN_36 : s1_ghist_current_saw_branch_not_taken; // @[frontend.scala 494:38 frontend.scala 446:12]
  wire [15:0] _GEN_53 = s2_valid & f3_ready ? _GEN_37 : s1_ghist_old_history; // @[frontend.scala 494:38 frontend.scala 446:12]
  wire  _GEN_55 = s2_valid & f3_ready ? _GEN_39 : _GEN_16; // @[frontend.scala 494:38]
  wire [39:0] _GEN_56 = s2_valid & f3_ready ? _GEN_40 : _GEN_18; // @[frontend.scala 494:38]
  wire [4:0] _GEN_58 = s2_valid & f3_ready ? _GEN_42 : _GEN_19; // @[frontend.scala 494:38]
  wire [15:0] _GEN_62 = s2_valid & f3_ready ? _GEN_46 : _GEN_23; // @[frontend.scala 494:38]
  wire [1:0] _GEN_63 = s2_valid & f3_ready ? _GEN_47 : 2'h0; // @[frontend.scala 494:38]
  wire [1:0] _GEN_64 = s2_valid & f3_ready ? _GEN_48 : _GEN_17; // @[frontend.scala 494:38]
  wire  _GEN_65 = _T_181 ? ~s2_tlb_resp_ae_inst & ~s2_tlb_resp_pf_inst | s2_is_replay | s2_tlb_miss : _GEN_55; // @[frontend.scala 485:58 frontend.scala 486:14]
  wire [39:0] _GEN_66 = _T_181 ? s2_vpc : _GEN_56; // @[frontend.scala 485:58 frontend.scala 487:14]
  wire  _GEN_67 = _T_181 & (s2_valid & icache_io_resp_valid); // @[frontend.scala 485:58 frontend.scala 488:18]
  wire [4:0] _GEN_69 = _T_181 ? s2_ghist_ras_idx : _GEN_58; // @[frontend.scala 485:58 frontend.scala 491:14]
  wire  _GEN_70 = _T_181 & s2_ghist_new_saw_branch_taken; // @[frontend.scala 485:58 frontend.scala 491:14]
  wire  _GEN_71 = _T_181 & s2_ghist_new_saw_branch_not_taken; // @[frontend.scala 485:58 frontend.scala 491:14]
  wire  _GEN_72 = _T_181 & s2_ghist_current_saw_branch_not_taken; // @[frontend.scala 485:58 frontend.scala 491:14]
  wire [15:0] _GEN_73 = _T_181 ? s2_ghist_old_history : _GEN_62; // @[frontend.scala 485:58 frontend.scala 491:14]
  wire [1:0] _GEN_74 = _T_181 ? s2_tsrc : _GEN_64; // @[frontend.scala 485:58 frontend.scala 492:14]
  wire [4:0] _GEN_76 = _T_181 ? s1_ghist_ras_idx : _GEN_49; // @[frontend.scala 485:58 frontend.scala 446:12]
  wire  _GEN_77 = _T_181 ? s1_ghist_new_saw_branch_taken : _GEN_50; // @[frontend.scala 485:58 frontend.scala 446:12]
  wire  _GEN_78 = _T_181 ? s1_ghist_new_saw_branch_not_taken : _GEN_51; // @[frontend.scala 485:58 frontend.scala 446:12]
  wire  _GEN_79 = _T_181 ? s1_ghist_current_saw_branch_not_taken : _GEN_52; // @[frontend.scala 485:58 frontend.scala 446:12]
  wire [15:0] _GEN_80 = _T_181 ? s1_ghist_old_history : _GEN_53; // @[frontend.scala 485:58 frontend.scala 446:12]
  wire  f3_clear = io_cpu_sfence_valid | io_cpu_redirect_flush; // @[frontend.scala 967:30 frontend.scala 968:17]
  wire  _GEN_137 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? 1'h0 : _T_796; // @[frontend.scala 837:99]
  wire  _GEN_159 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? 1'h0 : _GEN_137; // @[frontend.scala 835:79]
  wire  _GEN_183 = f3_io_deq_valid & f4_ready & _GEN_159; // @[frontend.scala 828:38]
  wire  _GEN_207 = io_cpu_redirect_flush | _GEN_183; // @[frontend.scala 979:38 frontend.scala 983:17]
  wire  f2_clear = io_cpu_sfence_valid | _GEN_207; // @[frontend.scala 967:30 frontend.scala 971:17]
  wire  _T_212 = icache_io_resp_valid | _T_92 & ~s2_tlb_miss; // @[frontend.scala 532:27]
  reg [4:0] ras_read_idx; // @[frontend.scala 543:29]
  wire  _T_217 = f3_io_enq_ready & f3_io_enq_valid; // @[Decoupled.scala 40:37]
  reg  REG_5; // @[frontend.scala 552:57]
  wire [39:0] _T_221 = ~f3_io_deq_bits_pc; // @[frontend.scala 161:33]
  wire [39:0] _T_222 = _T_221 | 40'h7; // @[frontend.scala 161:39]
  wire [39:0] f3_aligned_pc = ~_T_222; // @[frontend.scala 161:31]
  wire [1:0] lo_2 = {f3_mask_1,f3_mask_0}; // @[frontend.scala 579:35]
  wire [1:0] hi_2 = {f3_mask_3,f3_mask_2}; // @[frontend.scala 579:35]
  wire [31:0] _T_230 = RVCExpander_io_rvc ? RVCExpander_io_out_bits : _T_228; // @[consts.scala 459:8]
  wire [31:0] _T_231 = io_cpu_is_unicore ? _T_228 : _T_230; // @[frontend.scala 623:28]
  wire [31:0] _T_232 = RVCExpander_1_io_rvc ? RVCExpander_1_io_out_bits : _T_227[31:0]; // @[consts.scala 459:8]
  wire [31:0] _T_233 = io_cpu_is_unicore ? _T_227[31:0] : _T_232; // @[frontend.scala 624:28]
  wire [40:0] _T_234 = {{1'd0}, f3_aligned_pc}; // @[frontend.scala 625:34]
  wire [39:0] _T_237 = _T_234[39:0] - 40'h2; // @[frontend.scala 625:69]
  wire [39:0] _GEN_86 = f3_prev_is_half ? _T_237 : _T_234[39:0]; // @[frontend.scala 639:34 frontend.scala 643:40 frontend.scala 666:40]
  wire  _GEN_87 = f3_prev_is_half ? BranchDecode_io_out_shadowable : BranchDecode_1_io_out_shadowable; // @[frontend.scala 639:34 frontend.scala 644:40 frontend.scala 667:40]
  wire [5:0] _GEN_88 = f3_prev_is_half ? BranchDecode_io_out_sfb_offset_bits : BranchDecode_1_io_out_sfb_offset_bits; // @[frontend.scala 639:34 frontend.scala 644:40 frontend.scala 667:40]
  wire  _GEN_89 = f3_prev_is_half ? BranchDecode_io_out_sfb_offset_valid : BranchDecode_1_io_out_sfb_offset_valid; // @[frontend.scala 639:34 frontend.scala 644:40 frontend.scala 667:40]
  wire  f3_call_mask_0 = f3_prev_is_half ? BranchDecode_io_out_is_call : BranchDecode_1_io_out_is_call; // @[frontend.scala 639:34 frontend.scala 644:40 frontend.scala 667:40]
  wire  _T_258 = _T_328 & f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_valid; // @[frontend.scala 710:70]
  wire  _T_259 = f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits != _GEN_91; // @[frontend.scala 712:61]
  wire  f3_btb_mispredicts_0 = _T_258 & _T_259; // @[frontend.scala 711:61]
  wire  f3_npc_plus4_mask_0 = _T_348 & ~f3_prev_is_half; // @[frontend.scala 717:23]
  wire [7:0] _T_264 = {{2'd0}, _GEN_88}; // @[frontend.scala 722:50]
  wire [1:0] _T_267 = f3_prev_is_half ? 2'h2 : 2'h0; // @[frontend.scala 724:12]
  wire [6:0] _GEN_250 = {{5'd0}, _T_267}; // @[frontend.scala 723:32]
  wire [6:0] _T_269 = _T_264[6:0] - _GEN_250; // @[frontend.scala 723:32]
  wire [15:0] _T_272 = 16'h1 << _T_269[4:1]; // @[OneHot.scala 58:35]
  wire [22:0] _T_274 = {{7'd0}, _T_272}; // @[frontend.scala 729:80]
  wire  _T_275 = f3_mask_0 & _GEN_89; // @[frontend.scala 732:20]
  wire  _T_277 = _T_269 <= 7'h10; // @[frontend.scala 734:33]
  wire [8:0] _T_295 = {{1'd0}, _T_274[7:0]}; // @[util.scala 455:30]
  wire [8:0] _T_297 = {_T_274[7:0], 1'h0}; // @[util.scala 455:30]
  wire [9:0] _GEN_251 = {_T_274[7:0], 2'h0}; // @[util.scala 455:30]
  wire [10:0] _T_299 = {{1'd0}, _GEN_251}; // @[util.scala 455:30]
  wire [10:0] _T_301 = {_T_274[7:0], 3'h0}; // @[util.scala 455:30]
  wire [11:0] _GEN_252 = {_T_274[7:0], 4'h0}; // @[util.scala 455:30]
  wire [14:0] _T_303 = {{3'd0}, _GEN_252}; // @[util.scala 455:30]
  wire [12:0] _GEN_253 = {_T_274[7:0], 5'h0}; // @[util.scala 455:30]
  wire [14:0] _T_305 = {{2'd0}, _GEN_253}; // @[util.scala 455:30]
  wire [13:0] _GEN_254 = {_T_274[7:0], 6'h0}; // @[util.scala 455:30]
  wire [14:0] _T_307 = {{1'd0}, _GEN_254}; // @[util.scala 455:30]
  wire [14:0] _T_309 = {_T_274[7:0], 7'h0}; // @[util.scala 455:30]
  wire [7:0] _T_311 = _T_295[7:0] | _T_297[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_312 = _T_311 | _T_299[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_313 = _T_312 | _T_301[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_314 = _T_313 | _T_303[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_315 = _T_314 | _T_305[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_316 = _T_315 | _T_307[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_317 = _T_316 | _T_309[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_318 = ~_T_317; // @[frontend.scala 736:70]
  wire  f3_fetch_bundle_xcpt_pf_if = f3_io_deq_bits_xcpt_pf_inst; // @[frontend.scala 572:29 frontend.scala 583:30]
  wire  f3_fetch_bundle_xcpt_ae_if = f3_io_deq_bits_xcpt_ae_inst; // @[frontend.scala 572:29 frontend.scala 584:30]
  wire  _T_320 = f3_fetch_bundle_xcpt_pf_if | f3_fetch_bundle_xcpt_ae_if; // @[frontend.scala 737:75]
  wire  _T_323 = ~(f3_fetch_bundle_xcpt_pf_if | f3_fetch_bundle_xcpt_ae_if | BreakpointUnit_io_debug_if |
    BreakpointUnit_io_xcpt_if); // @[frontend.scala 737:46]
  wire  _T_326 = _GEN_87 | ~f3_mask_0; // @[frontend.scala 739:65]
  wire [31:0] _T_339 = RVCExpander_2_io_rvc ? RVCExpander_2_io_out_bits : f3_fetch_bundle_insts_1; // @[consts.scala 459:8]
  wire [39:0] _T_342 = f3_aligned_pc + 40'h2; // @[frontend.scala 675:32]
  wire  _T_370 = _T_438 & _T_351 & f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_valid; // @[frontend.scala 710:70]
  wire  _T_371 = f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits != _WIRE_9_target; // @[frontend.scala 712:61]
  wire  f3_btb_mispredicts_1 = _T_370 & _T_371; // @[frontend.scala 711:61]
  wire [5:0] _WIRE_9_sfb_offset_bits = BranchDecode_2_io_out_sfb_offset_bits; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire [6:0] _GEN_255 = {{1'd0}, _WIRE_9_sfb_offset_bits}; // @[frontend.scala 722:50]
  wire [6:0] _T_375 = 7'h2 + _GEN_255; // @[frontend.scala 722:50]
  wire [6:0] _T_379 = _T_375 - 7'h0; // @[frontend.scala 723:32]
  wire [15:0] _T_382 = 16'h1 << _T_379[4:1]; // @[OneHot.scala 58:35]
  wire [22:0] _T_384 = {{7'd0}, _T_382}; // @[frontend.scala 729:80]
  wire  _WIRE_9_sfb_offset_valid = BranchDecode_2_io_out_sfb_offset_valid; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  _T_385 = f3_mask_1 & _WIRE_9_sfb_offset_valid; // @[frontend.scala 732:20]
  wire  _T_387 = _T_379 <= 7'h10; // @[frontend.scala 734:33]
  wire [8:0] _T_405 = {{1'd0}, _T_384[7:0]}; // @[util.scala 455:30]
  wire [8:0] _T_407 = {_T_384[7:0], 1'h0}; // @[util.scala 455:30]
  wire [9:0] _GEN_256 = {_T_384[7:0], 2'h0}; // @[util.scala 455:30]
  wire [10:0] _T_409 = {{1'd0}, _GEN_256}; // @[util.scala 455:30]
  wire [10:0] _T_411 = {_T_384[7:0], 3'h0}; // @[util.scala 455:30]
  wire [11:0] _GEN_257 = {_T_384[7:0], 4'h0}; // @[util.scala 455:30]
  wire [14:0] _T_413 = {{3'd0}, _GEN_257}; // @[util.scala 455:30]
  wire [12:0] _GEN_258 = {_T_384[7:0], 5'h0}; // @[util.scala 455:30]
  wire [14:0] _T_415 = {{2'd0}, _GEN_258}; // @[util.scala 455:30]
  wire [13:0] _GEN_259 = {_T_384[7:0], 6'h0}; // @[util.scala 455:30]
  wire [14:0] _T_417 = {{1'd0}, _GEN_259}; // @[util.scala 455:30]
  wire [14:0] _T_419 = {_T_384[7:0], 7'h0}; // @[util.scala 455:30]
  wire [7:0] _T_421 = _T_405[7:0] | _T_407[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_422 = _T_421 | _T_409[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_423 = _T_422 | _T_411[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_424 = _T_423 | _T_413[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_425 = _T_424 | _T_415[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_426 = _T_425 | _T_417[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_427 = _T_426 | _T_419[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_428 = ~_T_427; // @[frontend.scala 736:70]
  wire  _T_433 = ~(f3_fetch_bundle_xcpt_pf_if | f3_fetch_bundle_xcpt_ae_if | BreakpointUnit_1_io_debug_if |
    BreakpointUnit_1_io_xcpt_if); // @[frontend.scala 737:46]
  wire  _WIRE_9_shadowable = BranchDecode_2_io_out_shadowable; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  _T_436 = _WIRE_9_shadowable | ~f3_mask_1; // @[frontend.scala 739:65]
  wire [31:0] _T_449 = RVCExpander_3_io_rvc ? RVCExpander_3_io_out_bits : f3_fetch_bundle_insts_2; // @[consts.scala 459:8]
  wire [39:0] _T_452 = f3_aligned_pc + 40'h4; // @[frontend.scala 675:32]
  wire  _T_479 = _T_547 & _T_460 & f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_valid; // @[frontend.scala 710:70]
  wire  _T_480 = f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits != _WIRE_14_target; // @[frontend.scala 712:61]
  wire  f3_btb_mispredicts_2 = _T_479 & _T_480; // @[frontend.scala 711:61]
  wire [5:0] _WIRE_14_sfb_offset_bits = BranchDecode_3_io_out_sfb_offset_bits; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire [6:0] _GEN_260 = {{1'd0}, _WIRE_14_sfb_offset_bits}; // @[frontend.scala 722:50]
  wire [6:0] _T_484 = 7'h4 + _GEN_260; // @[frontend.scala 722:50]
  wire [6:0] _T_488 = _T_484 - 7'h0; // @[frontend.scala 723:32]
  wire [15:0] _T_491 = 16'h1 << _T_488[4:1]; // @[OneHot.scala 58:35]
  wire [22:0] _T_493 = {{7'd0}, _T_491}; // @[frontend.scala 729:80]
  wire  _WIRE_14_sfb_offset_valid = BranchDecode_3_io_out_sfb_offset_valid; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  _T_494 = f3_mask_2 & _WIRE_14_sfb_offset_valid; // @[frontend.scala 732:20]
  wire  _T_496 = _T_488 <= 7'h10; // @[frontend.scala 734:33]
  wire [8:0] _T_514 = {{1'd0}, _T_493[7:0]}; // @[util.scala 455:30]
  wire [8:0] _T_516 = {_T_493[7:0], 1'h0}; // @[util.scala 455:30]
  wire [9:0] _GEN_261 = {_T_493[7:0], 2'h0}; // @[util.scala 455:30]
  wire [10:0] _T_518 = {{1'd0}, _GEN_261}; // @[util.scala 455:30]
  wire [10:0] _T_520 = {_T_493[7:0], 3'h0}; // @[util.scala 455:30]
  wire [11:0] _GEN_262 = {_T_493[7:0], 4'h0}; // @[util.scala 455:30]
  wire [14:0] _T_522 = {{3'd0}, _GEN_262}; // @[util.scala 455:30]
  wire [12:0] _GEN_263 = {_T_493[7:0], 5'h0}; // @[util.scala 455:30]
  wire [14:0] _T_524 = {{2'd0}, _GEN_263}; // @[util.scala 455:30]
  wire [13:0] _GEN_264 = {_T_493[7:0], 6'h0}; // @[util.scala 455:30]
  wire [14:0] _T_526 = {{1'd0}, _GEN_264}; // @[util.scala 455:30]
  wire [14:0] _T_528 = {_T_493[7:0], 7'h0}; // @[util.scala 455:30]
  wire [7:0] _T_530 = _T_514[7:0] | _T_516[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_531 = _T_530 | _T_518[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_532 = _T_531 | _T_520[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_533 = _T_532 | _T_522[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_534 = _T_533 | _T_524[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_535 = _T_534 | _T_526[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_536 = _T_535 | _T_528[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_537 = ~_T_536; // @[frontend.scala 736:70]
  wire  _T_542 = ~(f3_fetch_bundle_xcpt_pf_if | f3_fetch_bundle_xcpt_ae_if | BreakpointUnit_2_io_debug_if |
    BreakpointUnit_2_io_xcpt_if); // @[frontend.scala 737:46]
  wire  _WIRE_14_shadowable = BranchDecode_3_io_out_shadowable; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  _T_545 = _WIRE_14_shadowable | ~f3_mask_2; // @[frontend.scala 739:65]
  wire [31:0] _T_558 = RVCExpander_4_io_rvc ? RVCExpander_4_io_out_bits : f3_fetch_bundle_insts_3; // @[consts.scala 459:8]
  wire [39:0] _T_561 = f3_aligned_pc + 40'h6; // @[frontend.scala 675:32]
  wire  _T_594 = _T_662 & _T_575 & f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_valid; // @[frontend.scala 710:70]
  wire  _T_595 = f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits != _WIRE_19_target; // @[frontend.scala 712:61]
  wire  f3_btb_mispredicts_3 = _T_594 & _T_595; // @[frontend.scala 711:61]
  wire [5:0] _WIRE_19_sfb_offset_bits = BranchDecode_4_io_out_sfb_offset_bits; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire [6:0] _GEN_265 = {{1'd0}, _WIRE_19_sfb_offset_bits}; // @[frontend.scala 722:50]
  wire [6:0] _T_599 = 7'h6 + _GEN_265; // @[frontend.scala 722:50]
  wire [6:0] _T_603 = _T_599 - 7'h0; // @[frontend.scala 723:32]
  wire [15:0] _T_606 = 16'h1 << _T_603[4:1]; // @[OneHot.scala 58:35]
  wire [22:0] _T_608 = {{7'd0}, _T_606}; // @[frontend.scala 729:80]
  wire  _WIRE_19_sfb_offset_valid = BranchDecode_4_io_out_sfb_offset_valid; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  _T_609 = f3_mask_3 & _WIRE_19_sfb_offset_valid; // @[frontend.scala 732:20]
  wire  _T_611 = _T_603 <= 7'h10; // @[frontend.scala 734:33]
  wire [8:0] _T_629 = {{1'd0}, _T_608[7:0]}; // @[util.scala 455:30]
  wire [8:0] _T_631 = {_T_608[7:0], 1'h0}; // @[util.scala 455:30]
  wire [9:0] _GEN_266 = {_T_608[7:0], 2'h0}; // @[util.scala 455:30]
  wire [10:0] _T_633 = {{1'd0}, _GEN_266}; // @[util.scala 455:30]
  wire [10:0] _T_635 = {_T_608[7:0], 3'h0}; // @[util.scala 455:30]
  wire [11:0] _GEN_267 = {_T_608[7:0], 4'h0}; // @[util.scala 455:30]
  wire [14:0] _T_637 = {{3'd0}, _GEN_267}; // @[util.scala 455:30]
  wire [12:0] _GEN_268 = {_T_608[7:0], 5'h0}; // @[util.scala 455:30]
  wire [14:0] _T_639 = {{2'd0}, _GEN_268}; // @[util.scala 455:30]
  wire [13:0] _GEN_269 = {_T_608[7:0], 6'h0}; // @[util.scala 455:30]
  wire [14:0] _T_641 = {{1'd0}, _GEN_269}; // @[util.scala 455:30]
  wire [14:0] _T_643 = {_T_608[7:0], 7'h0}; // @[util.scala 455:30]
  wire [7:0] _T_645 = _T_629[7:0] | _T_631[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_646 = _T_645 | _T_633[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_647 = _T_646 | _T_635[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_648 = _T_647 | _T_637[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_649 = _T_648 | _T_639[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_650 = _T_649 | _T_641[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_651 = _T_650 | _T_643[7:0]; // @[util.scala 455:54]
  wire [7:0] _T_652 = ~_T_651; // @[frontend.scala 736:70]
  wire  _T_657 = ~(f3_fetch_bundle_xcpt_pf_if | f3_fetch_bundle_xcpt_ae_if | BreakpointUnit_3_io_debug_if |
    BreakpointUnit_3_io_xcpt_if); // @[frontend.scala 737:46]
  wire  _WIRE_19_shadowable = BranchDecode_4_io_out_shadowable; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  _T_660 = _WIRE_19_shadowable | ~f3_mask_3; // @[frontend.scala 739:65]
  wire [15:0] last_inst = f3_fetch_bundle_insts_3[15:0]; // @[frontend.scala 760:40]
  wire  _T_682 = last_inst[1:0] != 2'h3 & ~io_cpu_is_unicore; // @[frontend.scala 597:46]
  wire  bank_prev_is_half = ~_T_568 & ~_T_682; // @[frontend.scala 762:69]
  wire [2:0] _GEN_96 = 2'h1 == f3_fetch_bundle_cfi_idx_bits ? f3_cfi_types_1 : f3_cfi_types_0; // @[frontend.scala 769:33 frontend.scala 769:33]
  wire [2:0] _GEN_97 = 2'h2 == f3_fetch_bundle_cfi_idx_bits ? f3_cfi_types_2 : _GEN_96; // @[frontend.scala 769:33 frontend.scala 769:33]
  wire  f3_call_mask_1 = BranchDecode_2_io_out_is_call; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  _GEN_100 = 2'h1 == f3_fetch_bundle_cfi_idx_bits ? f3_call_mask_1 : f3_call_mask_0; // @[frontend.scala 770:33 frontend.scala 770:33]
  wire  f3_call_mask_2 = BranchDecode_3_io_out_is_call; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  _GEN_101 = 2'h2 == f3_fetch_bundle_cfi_idx_bits ? f3_call_mask_2 : _GEN_100; // @[frontend.scala 770:33 frontend.scala 770:33]
  wire  f3_call_mask_3 = BranchDecode_4_io_out_is_call; // @[frontend.scala 618:24 frontend.scala 685:38]
  wire  f3_fetch_bundle_cfi_is_call = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_call_mask_3 : _GEN_101; // @[frontend.scala 770:33 frontend.scala 770:33]
  wire  _GEN_108 = 2'h1 == f3_fetch_bundle_cfi_idx_bits ? _T_458 : f3_npc_plus4_mask_0; // @[frontend.scala 772:33 frontend.scala 772:33]
  wire  _GEN_109 = 2'h2 == f3_fetch_bundle_cfi_idx_bits ? _T_567 : _GEN_108; // @[frontend.scala 772:33 frontend.scala 772:33]
  wire  f3_fetch_bundle_cfi_npc_plus4 = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? _T_573 : _GEN_109; // @[frontend.scala 772:33 frontend.scala 772:33]
  wire  _T_686 = f3_io_deq_ready & f3_io_deq_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_111 = _T_686 ? bank_prev_is_half : f3_prev_is_half; // @[frontend.scala 781:27 frontend.scala 782:21 frontend.scala 592:32]
  wire  _GEN_113 = f3_clear ? 1'h0 : _GEN_111; // @[frontend.scala 787:19 frontend.scala 788:21]
  wire [4:0] f3_fetch_bundle_ghist_ras_idx = f3_io_deq_bits_ghist_ras_idx; // @[frontend.scala 572:29 frontend.scala 774:28]
  wire [4:0] _T_740 = f3_fetch_bundle_ghist_ras_idx + 5'h1; // @[util.scala 260:14]
  wire [4:0] _T_744 = f3_fetch_bundle_ghist_ras_idx - 5'h1; // @[util.scala 277:14]
  wire [4:0] _T_746 = _T_699 & f3_fetch_bundle_cfi_is_ret ? _T_744 : f3_fetch_bundle_ghist_ras_idx; // @[frontend.scala 125:31]
  wire [4:0] f3_predicted_ghist_ras_idx = _T_699 & f3_fetch_bundle_cfi_is_call ? _T_740 : _T_746; // @[frontend.scala 124:31]
  wire [2:0] _T_748 = {f3_fetch_bundle_cfi_idx_bits, 1'h0}; // @[frontend.scala 820:71]
  wire [39:0] _GEN_270 = {{37'd0}, _T_748}; // @[frontend.scala 820:39]
  wire [39:0] _T_750 = f3_aligned_pc + _GEN_270; // @[frontend.scala 820:39]
  wire [2:0] _T_751 = f3_fetch_bundle_cfi_npc_plus4 ? 3'h4 : 3'h2; // @[frontend.scala 820:82]
  wire [39:0] _GEN_271 = {{37'd0}, _T_751}; // @[frontend.scala 820:77]
  wire [39:0] _T_753 = _T_750 + _GEN_271; // @[frontend.scala 820:77]
  wire  _T_770 = f3_fetch_bundle_cfi_is_call & _T_699; // @[frontend.scala 829:39]
  wire  _GEN_119 = _T_699 ? 1'h0 : _GEN_113; // @[frontend.scala 832:38 frontend.scala 833:23]
  wire  _GEN_122 = _T_796 ? ~_T_320 : _GEN_65; // @[frontend.scala 841:37 frontend.scala 845:20]
  wire [39:0] _GEN_123 = _T_796 ? f3_predicted_target : _GEN_66; // @[frontend.scala 841:37 frontend.scala 846:20]
  wire  _GEN_124 = _T_796 ? 1'h0 : _GEN_67; // @[frontend.scala 841:37 frontend.scala 847:20]
  wire [4:0] _GEN_125 = _T_796 ? f3_predicted_ghist_ras_idx : _GEN_69; // @[frontend.scala 841:37 frontend.scala 848:20]
  wire  _GEN_126 = _T_796 ? 1'h0 : _GEN_70; // @[frontend.scala 841:37 frontend.scala 848:20]
  wire  _GEN_127 = _T_796 ? 1'h0 : _GEN_71; // @[frontend.scala 841:37 frontend.scala 848:20]
  wire  _GEN_128 = _T_796 ? 1'h0 : _GEN_72; // @[frontend.scala 841:37 frontend.scala 848:20]
  wire [15:0] _GEN_129 = _T_796 ? f3_predicted_ghist_old_history : _GEN_73; // @[frontend.scala 841:37 frontend.scala 848:20]
  wire [1:0] _GEN_130 = _T_796 ? 2'h2 : _GEN_74; // @[frontend.scala 841:37 frontend.scala 849:20]
  wire [1:0] _GEN_131 = _T_796 ? 2'h2 : f3_io_deq_bits_fsrc; // @[frontend.scala 841:37 frontend.scala 851:28 frontend.scala 585:24]
  wire  _GEN_139 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_65 : _GEN_122; // @[frontend.scala 837:99]
  wire [39:0] _GEN_140 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_66 :
    _GEN_123; // @[frontend.scala 837:99]
  wire  _GEN_141 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_67 : _GEN_124; // @[frontend.scala 837:99]
  wire [4:0] _GEN_142 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_69 : _GEN_125
    ; // @[frontend.scala 837:99]
  wire  _GEN_143 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_70 : _GEN_126; // @[frontend.scala 837:99]
  wire  _GEN_144 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_71 : _GEN_127; // @[frontend.scala 837:99]
  wire  _GEN_145 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_72 : _GEN_128; // @[frontend.scala 837:99]
  wire [15:0] _GEN_146 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_73 :
    _GEN_129; // @[frontend.scala 837:99]
  wire [1:0] _GEN_147 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ? _GEN_74 : _GEN_130
    ; // @[frontend.scala 837:99]
  wire [1:0] _GEN_148 = ~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist ?
    f3_io_deq_bits_fsrc : _GEN_131; // @[frontend.scala 837:99 frontend.scala 585:24]
  wire [4:0] _GEN_149 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? f3_predicted_ghist_ras_idx :
    s2_ghist_ras_idx; // @[frontend.scala 835:79 frontend.scala 836:28 frontend.scala 536:24]
  wire  _GEN_150 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? 1'h0 :
    s2_ghist_new_saw_branch_taken; // @[frontend.scala 835:79 frontend.scala 836:28 frontend.scala 536:24]
  wire  _GEN_151 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? 1'h0 :
    s2_ghist_new_saw_branch_not_taken; // @[frontend.scala 835:79 frontend.scala 836:28 frontend.scala 536:24]
  wire  _GEN_152 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? 1'h0 :
    s2_ghist_current_saw_branch_not_taken; // @[frontend.scala 835:79 frontend.scala 836:28 frontend.scala 536:24]
  wire [15:0] _GEN_153 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ?
    f3_predicted_ghist_old_history : s2_ghist_old_history; // @[frontend.scala 835:79 frontend.scala 836:28 frontend.scala 536:24]
  wire  _GEN_161 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_65 : _GEN_139; // @[frontend.scala 835:79]
  wire [39:0] _GEN_162 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_66 : _GEN_140; // @[frontend.scala 835:79]
  wire [4:0] _GEN_164 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_69 : _GEN_142; // @[frontend.scala 835:79]
  wire  _GEN_165 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_70 : _GEN_143; // @[frontend.scala 835:79]
  wire  _GEN_166 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_71 : _GEN_144; // @[frontend.scala 835:79]
  wire  _GEN_167 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_72 : _GEN_145; // @[frontend.scala 835:79]
  wire [15:0] _GEN_168 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_73 : _GEN_146; // @[frontend.scala 835:79]
  wire [1:0] _GEN_169 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? _GEN_74 : _GEN_147; // @[frontend.scala 835:79]
  wire [1:0] _GEN_170 = s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist ? f3_io_deq_bits_fsrc : _GEN_148
    ; // @[frontend.scala 835:79 frontend.scala 585:24]
  wire  _GEN_171 = f3_io_deq_valid & f4_ready & _T_770; // @[frontend.scala 828:38 frontend.scala 819:22]
  wire  _GEN_172 = f3_io_deq_valid & f4_ready ? _GEN_119 : _GEN_113; // @[frontend.scala 828:38]
  wire  _GEN_185 = f3_io_deq_valid & f4_ready ? _GEN_161 : _GEN_65; // @[frontend.scala 828:38]
  wire [39:0] _GEN_186 = f3_io_deq_valid & f4_ready ? _GEN_162 : _GEN_66; // @[frontend.scala 828:38]
  wire [4:0] _GEN_188 = f3_io_deq_valid & f4_ready ? _GEN_164 : _GEN_69; // @[frontend.scala 828:38]
  wire  _GEN_189 = f3_io_deq_valid & f4_ready ? _GEN_165 : _GEN_70; // @[frontend.scala 828:38]
  wire  _GEN_190 = f3_io_deq_valid & f4_ready ? _GEN_166 : _GEN_71; // @[frontend.scala 828:38]
  wire  _GEN_191 = f3_io_deq_valid & f4_ready ? _GEN_167 : _GEN_72; // @[frontend.scala 828:38]
  wire [15:0] _GEN_192 = f3_io_deq_valid & f4_ready ? _GEN_168 : _GEN_73; // @[frontend.scala 828:38]
  wire [1:0] _GEN_193 = f3_io_deq_valid & f4_ready ? _GEN_169 : _GEN_74; // @[frontend.scala 828:38]
  wire [1:0] lo_5 = {f3_btb_mispredicts_1,f3_btb_mispredicts_0}; // @[frontend.scala 861:77]
  wire [1:0] hi_5 = {f3_btb_mispredicts_3,f3_btb_mispredicts_2}; // @[frontend.scala 861:77]
  wire  _T_924 = ~f4_io_deq_bits_cfi_idx_valid; // @[frontend.scala 910:5]
  wire  _T_925 = (f4_io_deq_bits_sfbs_0 | f4_io_deq_bits_sfbs_1 | f4_io_deq_bits_sfbs_2 | f4_io_deq_bits_sfbs_3) &
    _T_924; // @[frontend.scala 909:38]
  wire  _T_926 = ~f4_io_enq_valid; // @[frontend.scala 911:5]
  wire  _T_927 = _T_925 & _T_926; // @[frontend.scala 910:35]
  wire  _T_928 = ~f4_io_deq_bits_xcpt_pf_if; // @[frontend.scala 912:5]
  wire  _T_929 = _T_927 & _T_928; // @[frontend.scala 911:22]
  wire  _T_930 = ~f4_io_deq_bits_xcpt_ae_if; // @[frontend.scala 913:5]
  wire  f4_delay = _T_929 & _T_930; // @[frontend.scala 912:32]
  wire  _T_939 = ~f4_delay; // @[frontend.scala 924:61]
  wire [3:0] _T_952 = {f4_io_deq_bits_shadowed_mask_3,f4_io_deq_bits_shadowed_mask_2,f4_io_deq_bits_shadowed_mask_1,
    f4_io_deq_bits_shadowed_mask_0}; // @[frontend.scala 932:34]
  wire  _GEN_210 = io_cpu_redirect_flush ? io_cpu_redirect_val : _GEN_185; // @[frontend.scala 979:38 frontend.scala 988:18]
  wire [63:0] _GEN_211 = io_cpu_redirect_flush ? io_cpu_redirect_pc : {{24'd0}, _GEN_186}; // @[frontend.scala 979:38 frontend.scala 989:18]
  wire [4:0] _GEN_212 = io_cpu_redirect_flush ? io_cpu_redirect_ghist_ras_idx : _GEN_188; // @[frontend.scala 979:38 frontend.scala 990:18]
  wire  _GEN_213 = io_cpu_redirect_flush ? io_cpu_redirect_ghist_new_saw_branch_taken : _GEN_189; // @[frontend.scala 979:38 frontend.scala 990:18]
  wire  _GEN_214 = io_cpu_redirect_flush ? io_cpu_redirect_ghist_new_saw_branch_not_taken : _GEN_190; // @[frontend.scala 979:38 frontend.scala 990:18]
  wire  _GEN_215 = io_cpu_redirect_flush ? io_cpu_redirect_ghist_current_saw_branch_not_taken : _GEN_191; // @[frontend.scala 979:38 frontend.scala 990:18]
  wire [15:0] _GEN_216 = io_cpu_redirect_flush ? io_cpu_redirect_ghist_old_history : _GEN_192; // @[frontend.scala 979:38 frontend.scala 990:18]
  wire [63:0] _GEN_225 = io_cpu_sfence_valid ? {{25'd0}, io_cpu_sfence_bits_addr} : _GEN_211; // @[frontend.scala 967:30 frontend.scala 975:18]
  wire [39:0] s0_vpc = _GEN_225[39:0];
  ICache icache ( // @[frontend.scala 303:26]
    .clock(icache_clock),
    .reset(icache_reset),
    .auto_master_out_a_ready(icache_auto_master_out_a_ready),
    .auto_master_out_a_valid(icache_auto_master_out_a_valid),
    .auto_master_out_a_bits_opcode(icache_auto_master_out_a_bits_opcode),
    .auto_master_out_a_bits_param(icache_auto_master_out_a_bits_param),
    .auto_master_out_a_bits_size(icache_auto_master_out_a_bits_size),
    .auto_master_out_a_bits_source(icache_auto_master_out_a_bits_source),
    .auto_master_out_a_bits_address(icache_auto_master_out_a_bits_address),
    .auto_master_out_a_bits_mask(icache_auto_master_out_a_bits_mask),
    .auto_master_out_a_bits_data(icache_auto_master_out_a_bits_data),
    .auto_master_out_a_bits_corrupt(icache_auto_master_out_a_bits_corrupt),
    .auto_master_out_d_ready(icache_auto_master_out_d_ready),
    .auto_master_out_d_valid(icache_auto_master_out_d_valid),
    .auto_master_out_d_bits_opcode(icache_auto_master_out_d_bits_opcode),
    .auto_master_out_d_bits_param(icache_auto_master_out_d_bits_param),
    .auto_master_out_d_bits_size(icache_auto_master_out_d_bits_size),
    .auto_master_out_d_bits_source(icache_auto_master_out_d_bits_source),
    .auto_master_out_d_bits_sink(icache_auto_master_out_d_bits_sink),
    .auto_master_out_d_bits_denied(icache_auto_master_out_d_bits_denied),
    .auto_master_out_d_bits_data(icache_auto_master_out_d_bits_data),
    .auto_master_out_d_bits_corrupt(icache_auto_master_out_d_bits_corrupt),
    .io_req_ready(icache_io_req_ready),
    .io_req_valid(icache_io_req_valid),
    .io_req_bits_addr(icache_io_req_bits_addr),
    .io_s1_paddr(icache_io_s1_paddr),
    .io_s1_kill(icache_io_s1_kill),
    .io_s2_kill(icache_io_s2_kill),
    .io_s2_prefetch(icache_io_s2_prefetch),
    .io_resp_valid(icache_io_resp_valid),
    .io_resp_bits_data(icache_io_resp_bits_data),
    .io_resp_bits_replay(icache_io_resp_bits_replay),
    .io_resp_bits_ae(icache_io_resp_bits_ae),
    .io_invalidate(icache_io_invalidate),
    .io_perf_acquire(icache_io_perf_acquire)
  );
  BranchPredictor bpd ( // @[frontend.scala 336:19]
    .clock(bpd_clock),
    .reset(bpd_reset),
    .io_f0_req_valid(bpd_io_f0_req_valid),
    .io_f0_req_bits_pc(bpd_io_f0_req_bits_pc),
    .io_f0_req_bits_ghist_old_history(bpd_io_f0_req_bits_ghist_old_history),
    .io_f0_req_bits_ghist_current_saw_branch_not_taken(bpd_io_f0_req_bits_ghist_current_saw_branch_not_taken),
    .io_f0_req_bits_ghist_new_saw_branch_not_taken(bpd_io_f0_req_bits_ghist_new_saw_branch_not_taken),
    .io_f0_req_bits_ghist_new_saw_branch_taken(bpd_io_f0_req_bits_ghist_new_saw_branch_taken),
    .io_f0_req_bits_ghist_ras_idx(bpd_io_f0_req_bits_ghist_ras_idx),
    .io_resp_f1_pc(bpd_io_resp_f1_pc),
    .io_resp_f1_preds_0_taken(bpd_io_resp_f1_preds_0_taken),
    .io_resp_f1_preds_0_is_br(bpd_io_resp_f1_preds_0_is_br),
    .io_resp_f1_preds_0_is_jal(bpd_io_resp_f1_preds_0_is_jal),
    .io_resp_f1_preds_0_predicted_pc_valid(bpd_io_resp_f1_preds_0_predicted_pc_valid),
    .io_resp_f1_preds_0_predicted_pc_bits(bpd_io_resp_f1_preds_0_predicted_pc_bits),
    .io_resp_f1_preds_1_taken(bpd_io_resp_f1_preds_1_taken),
    .io_resp_f1_preds_1_is_br(bpd_io_resp_f1_preds_1_is_br),
    .io_resp_f1_preds_1_is_jal(bpd_io_resp_f1_preds_1_is_jal),
    .io_resp_f1_preds_1_predicted_pc_valid(bpd_io_resp_f1_preds_1_predicted_pc_valid),
    .io_resp_f1_preds_1_predicted_pc_bits(bpd_io_resp_f1_preds_1_predicted_pc_bits),
    .io_resp_f1_preds_2_taken(bpd_io_resp_f1_preds_2_taken),
    .io_resp_f1_preds_2_is_br(bpd_io_resp_f1_preds_2_is_br),
    .io_resp_f1_preds_2_is_jal(bpd_io_resp_f1_preds_2_is_jal),
    .io_resp_f1_preds_2_predicted_pc_valid(bpd_io_resp_f1_preds_2_predicted_pc_valid),
    .io_resp_f1_preds_2_predicted_pc_bits(bpd_io_resp_f1_preds_2_predicted_pc_bits),
    .io_resp_f1_preds_3_taken(bpd_io_resp_f1_preds_3_taken),
    .io_resp_f1_preds_3_is_br(bpd_io_resp_f1_preds_3_is_br),
    .io_resp_f1_preds_3_is_jal(bpd_io_resp_f1_preds_3_is_jal),
    .io_resp_f1_preds_3_predicted_pc_valid(bpd_io_resp_f1_preds_3_predicted_pc_valid),
    .io_resp_f1_preds_3_predicted_pc_bits(bpd_io_resp_f1_preds_3_predicted_pc_bits),
    .io_resp_f1_meta_0(bpd_io_resp_f1_meta_0),
    .io_resp_f1_lhist_0(bpd_io_resp_f1_lhist_0),
    .io_resp_f2_pc(bpd_io_resp_f2_pc),
    .io_resp_f2_preds_0_taken(bpd_io_resp_f2_preds_0_taken),
    .io_resp_f2_preds_0_is_br(bpd_io_resp_f2_preds_0_is_br),
    .io_resp_f2_preds_0_is_jal(bpd_io_resp_f2_preds_0_is_jal),
    .io_resp_f2_preds_0_predicted_pc_valid(bpd_io_resp_f2_preds_0_predicted_pc_valid),
    .io_resp_f2_preds_0_predicted_pc_bits(bpd_io_resp_f2_preds_0_predicted_pc_bits),
    .io_resp_f2_preds_1_taken(bpd_io_resp_f2_preds_1_taken),
    .io_resp_f2_preds_1_is_br(bpd_io_resp_f2_preds_1_is_br),
    .io_resp_f2_preds_1_is_jal(bpd_io_resp_f2_preds_1_is_jal),
    .io_resp_f2_preds_1_predicted_pc_valid(bpd_io_resp_f2_preds_1_predicted_pc_valid),
    .io_resp_f2_preds_1_predicted_pc_bits(bpd_io_resp_f2_preds_1_predicted_pc_bits),
    .io_resp_f2_preds_2_taken(bpd_io_resp_f2_preds_2_taken),
    .io_resp_f2_preds_2_is_br(bpd_io_resp_f2_preds_2_is_br),
    .io_resp_f2_preds_2_is_jal(bpd_io_resp_f2_preds_2_is_jal),
    .io_resp_f2_preds_2_predicted_pc_valid(bpd_io_resp_f2_preds_2_predicted_pc_valid),
    .io_resp_f2_preds_2_predicted_pc_bits(bpd_io_resp_f2_preds_2_predicted_pc_bits),
    .io_resp_f2_preds_3_taken(bpd_io_resp_f2_preds_3_taken),
    .io_resp_f2_preds_3_is_br(bpd_io_resp_f2_preds_3_is_br),
    .io_resp_f2_preds_3_is_jal(bpd_io_resp_f2_preds_3_is_jal),
    .io_resp_f2_preds_3_predicted_pc_valid(bpd_io_resp_f2_preds_3_predicted_pc_valid),
    .io_resp_f2_preds_3_predicted_pc_bits(bpd_io_resp_f2_preds_3_predicted_pc_bits),
    .io_resp_f2_meta_0(bpd_io_resp_f2_meta_0),
    .io_resp_f2_lhist_0(bpd_io_resp_f2_lhist_0),
    .io_resp_f3_pc(bpd_io_resp_f3_pc),
    .io_resp_f3_preds_0_taken(bpd_io_resp_f3_preds_0_taken),
    .io_resp_f3_preds_0_is_br(bpd_io_resp_f3_preds_0_is_br),
    .io_resp_f3_preds_0_is_jal(bpd_io_resp_f3_preds_0_is_jal),
    .io_resp_f3_preds_0_predicted_pc_valid(bpd_io_resp_f3_preds_0_predicted_pc_valid),
    .io_resp_f3_preds_0_predicted_pc_bits(bpd_io_resp_f3_preds_0_predicted_pc_bits),
    .io_resp_f3_preds_1_taken(bpd_io_resp_f3_preds_1_taken),
    .io_resp_f3_preds_1_is_br(bpd_io_resp_f3_preds_1_is_br),
    .io_resp_f3_preds_1_is_jal(bpd_io_resp_f3_preds_1_is_jal),
    .io_resp_f3_preds_1_predicted_pc_valid(bpd_io_resp_f3_preds_1_predicted_pc_valid),
    .io_resp_f3_preds_1_predicted_pc_bits(bpd_io_resp_f3_preds_1_predicted_pc_bits),
    .io_resp_f3_preds_2_taken(bpd_io_resp_f3_preds_2_taken),
    .io_resp_f3_preds_2_is_br(bpd_io_resp_f3_preds_2_is_br),
    .io_resp_f3_preds_2_is_jal(bpd_io_resp_f3_preds_2_is_jal),
    .io_resp_f3_preds_2_predicted_pc_valid(bpd_io_resp_f3_preds_2_predicted_pc_valid),
    .io_resp_f3_preds_2_predicted_pc_bits(bpd_io_resp_f3_preds_2_predicted_pc_bits),
    .io_resp_f3_preds_3_taken(bpd_io_resp_f3_preds_3_taken),
    .io_resp_f3_preds_3_is_br(bpd_io_resp_f3_preds_3_is_br),
    .io_resp_f3_preds_3_is_jal(bpd_io_resp_f3_preds_3_is_jal),
    .io_resp_f3_preds_3_predicted_pc_valid(bpd_io_resp_f3_preds_3_predicted_pc_valid),
    .io_resp_f3_preds_3_predicted_pc_bits(bpd_io_resp_f3_preds_3_predicted_pc_bits),
    .io_resp_f3_meta_0(bpd_io_resp_f3_meta_0),
    .io_resp_f3_lhist_0(bpd_io_resp_f3_lhist_0),
    .io_f3_fire(bpd_io_f3_fire),
    .io_update_valid(bpd_io_update_valid),
    .io_update_bits_is_mispredict_update(bpd_io_update_bits_is_mispredict_update),
    .io_update_bits_is_repair_update(bpd_io_update_bits_is_repair_update),
    .io_update_bits_btb_mispredicts(bpd_io_update_bits_btb_mispredicts),
    .io_update_bits_pc(bpd_io_update_bits_pc),
    .io_update_bits_br_mask(bpd_io_update_bits_br_mask),
    .io_update_bits_cfi_idx_valid(bpd_io_update_bits_cfi_idx_valid),
    .io_update_bits_cfi_idx_bits(bpd_io_update_bits_cfi_idx_bits),
    .io_update_bits_cfi_taken(bpd_io_update_bits_cfi_taken),
    .io_update_bits_cfi_mispredicted(bpd_io_update_bits_cfi_mispredicted),
    .io_update_bits_cfi_is_br(bpd_io_update_bits_cfi_is_br),
    .io_update_bits_cfi_is_jal(bpd_io_update_bits_cfi_is_jal),
    .io_update_bits_cfi_is_jalr(bpd_io_update_bits_cfi_is_jalr),
    .io_update_bits_ghist_old_history(bpd_io_update_bits_ghist_old_history),
    .io_update_bits_ghist_current_saw_branch_not_taken(bpd_io_update_bits_ghist_current_saw_branch_not_taken),
    .io_update_bits_ghist_new_saw_branch_not_taken(bpd_io_update_bits_ghist_new_saw_branch_not_taken),
    .io_update_bits_ghist_new_saw_branch_taken(bpd_io_update_bits_ghist_new_saw_branch_taken),
    .io_update_bits_ghist_ras_idx(bpd_io_update_bits_ghist_ras_idx),
    .io_update_bits_lhist_0(bpd_io_update_bits_lhist_0),
    .io_update_bits_target(bpd_io_update_bits_target),
    .io_update_bits_meta_0(bpd_io_update_bits_meta_0)
  );
  BoomRAS ras ( // @[frontend.scala 338:19]
    .clock(ras_clock),
    .reset(ras_reset),
    .io_read_idx(ras_io_read_idx),
    .io_read_addr(ras_io_read_addr),
    .io_write_valid(ras_io_write_valid),
    .io_write_idx(ras_io_write_idx),
    .io_write_addr(ras_io_write_addr)
  );
  TLB tlb ( // @[frontend.scala 342:19]
    .clock(tlb_clock),
    .reset(tlb_reset),
    .io_req_ready(tlb_io_req_ready),
    .io_req_valid(tlb_io_req_valid),
    .io_req_bits_vaddr(tlb_io_req_bits_vaddr),
    .io_req_bits_passthrough(tlb_io_req_bits_passthrough),
    .io_req_bits_size(tlb_io_req_bits_size),
    .io_req_bits_cmd(tlb_io_req_bits_cmd),
    .io_resp_miss(tlb_io_resp_miss),
    .io_resp_paddr(tlb_io_resp_paddr),
    .io_resp_pf_ld(tlb_io_resp_pf_ld),
    .io_resp_pf_st(tlb_io_resp_pf_st),
    .io_resp_pf_inst(tlb_io_resp_pf_inst),
    .io_resp_ae_ld(tlb_io_resp_ae_ld),
    .io_resp_ae_st(tlb_io_resp_ae_st),
    .io_resp_ae_inst(tlb_io_resp_ae_inst),
    .io_resp_ma_ld(tlb_io_resp_ma_ld),
    .io_resp_ma_st(tlb_io_resp_ma_st),
    .io_resp_ma_inst(tlb_io_resp_ma_inst),
    .io_resp_cacheable(tlb_io_resp_cacheable),
    .io_resp_must_alloc(tlb_io_resp_must_alloc),
    .io_resp_prefetchable(tlb_io_resp_prefetchable),
    .io_sfence_valid(tlb_io_sfence_valid),
    .io_sfence_bits_rs1(tlb_io_sfence_bits_rs1),
    .io_sfence_bits_rs2(tlb_io_sfence_bits_rs2),
    .io_sfence_bits_addr(tlb_io_sfence_bits_addr),
    .io_sfence_bits_asid(tlb_io_sfence_bits_asid),
    .io_ptw_req_ready(tlb_io_ptw_req_ready),
    .io_ptw_req_valid(tlb_io_ptw_req_valid),
    .io_ptw_req_bits_valid(tlb_io_ptw_req_bits_valid),
    .io_ptw_req_bits_bits_addr(tlb_io_ptw_req_bits_bits_addr),
    .io_ptw_resp_valid(tlb_io_ptw_resp_valid),
    .io_ptw_resp_bits_ae(tlb_io_ptw_resp_bits_ae),
    .io_ptw_resp_bits_pte_ppn(tlb_io_ptw_resp_bits_pte_ppn),
    .io_ptw_resp_bits_pte_reserved_for_software(tlb_io_ptw_resp_bits_pte_reserved_for_software),
    .io_ptw_resp_bits_pte_d(tlb_io_ptw_resp_bits_pte_d),
    .io_ptw_resp_bits_pte_a(tlb_io_ptw_resp_bits_pte_a),
    .io_ptw_resp_bits_pte_g(tlb_io_ptw_resp_bits_pte_g),
    .io_ptw_resp_bits_pte_u(tlb_io_ptw_resp_bits_pte_u),
    .io_ptw_resp_bits_pte_x(tlb_io_ptw_resp_bits_pte_x),
    .io_ptw_resp_bits_pte_w(tlb_io_ptw_resp_bits_pte_w),
    .io_ptw_resp_bits_pte_r(tlb_io_ptw_resp_bits_pte_r),
    .io_ptw_resp_bits_pte_v(tlb_io_ptw_resp_bits_pte_v),
    .io_ptw_resp_bits_level(tlb_io_ptw_resp_bits_level),
    .io_ptw_resp_bits_fragmented_superpage(tlb_io_ptw_resp_bits_fragmented_superpage),
    .io_ptw_resp_bits_homogeneous(tlb_io_ptw_resp_bits_homogeneous),
    .io_ptw_ptbr_mode(tlb_io_ptw_ptbr_mode),
    .io_ptw_ptbr_asid(tlb_io_ptw_ptbr_asid),
    .io_ptw_ptbr_ppn(tlb_io_ptw_ptbr_ppn),
    .io_ptw_status_debug(tlb_io_ptw_status_debug),
    .io_ptw_status_cease(tlb_io_ptw_status_cease),
    .io_ptw_status_wfi(tlb_io_ptw_status_wfi),
    .io_ptw_status_isa(tlb_io_ptw_status_isa),
    .io_ptw_status_dprv(tlb_io_ptw_status_dprv),
    .io_ptw_status_prv(tlb_io_ptw_status_prv),
    .io_ptw_status_sd(tlb_io_ptw_status_sd),
    .io_ptw_status_zero2(tlb_io_ptw_status_zero2),
    .io_ptw_status_sxl(tlb_io_ptw_status_sxl),
    .io_ptw_status_uxl(tlb_io_ptw_status_uxl),
    .io_ptw_status_sd_rv32(tlb_io_ptw_status_sd_rv32),
    .io_ptw_status_zero1(tlb_io_ptw_status_zero1),
    .io_ptw_status_tsr(tlb_io_ptw_status_tsr),
    .io_ptw_status_tw(tlb_io_ptw_status_tw),
    .io_ptw_status_tvm(tlb_io_ptw_status_tvm),
    .io_ptw_status_mxr(tlb_io_ptw_status_mxr),
    .io_ptw_status_sum(tlb_io_ptw_status_sum),
    .io_ptw_status_mprv(tlb_io_ptw_status_mprv),
    .io_ptw_status_xs(tlb_io_ptw_status_xs),
    .io_ptw_status_fs(tlb_io_ptw_status_fs),
    .io_ptw_status_mpp(tlb_io_ptw_status_mpp),
    .io_ptw_status_vs(tlb_io_ptw_status_vs),
    .io_ptw_status_spp(tlb_io_ptw_status_spp),
    .io_ptw_status_mpie(tlb_io_ptw_status_mpie),
    .io_ptw_status_hpie(tlb_io_ptw_status_hpie),
    .io_ptw_status_spie(tlb_io_ptw_status_spie),
    .io_ptw_status_upie(tlb_io_ptw_status_upie),
    .io_ptw_status_mie(tlb_io_ptw_status_mie),
    .io_ptw_status_hie(tlb_io_ptw_status_hie),
    .io_ptw_status_sie(tlb_io_ptw_status_sie),
    .io_ptw_status_uie(tlb_io_ptw_status_uie),
    .io_ptw_pmp_0_cfg_l(tlb_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_res(tlb_io_ptw_pmp_0_cfg_res),
    .io_ptw_pmp_0_cfg_a(tlb_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(tlb_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(tlb_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(tlb_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(tlb_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(tlb_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(tlb_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_res(tlb_io_ptw_pmp_1_cfg_res),
    .io_ptw_pmp_1_cfg_a(tlb_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(tlb_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(tlb_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(tlb_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(tlb_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(tlb_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(tlb_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_res(tlb_io_ptw_pmp_2_cfg_res),
    .io_ptw_pmp_2_cfg_a(tlb_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(tlb_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(tlb_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(tlb_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(tlb_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(tlb_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(tlb_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_res(tlb_io_ptw_pmp_3_cfg_res),
    .io_ptw_pmp_3_cfg_a(tlb_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(tlb_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(tlb_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(tlb_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(tlb_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(tlb_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(tlb_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_res(tlb_io_ptw_pmp_4_cfg_res),
    .io_ptw_pmp_4_cfg_a(tlb_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(tlb_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(tlb_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(tlb_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(tlb_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(tlb_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(tlb_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_res(tlb_io_ptw_pmp_5_cfg_res),
    .io_ptw_pmp_5_cfg_a(tlb_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(tlb_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(tlb_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(tlb_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(tlb_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(tlb_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(tlb_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_res(tlb_io_ptw_pmp_6_cfg_res),
    .io_ptw_pmp_6_cfg_a(tlb_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(tlb_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(tlb_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(tlb_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(tlb_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(tlb_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(tlb_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_res(tlb_io_ptw_pmp_7_cfg_res),
    .io_ptw_pmp_7_cfg_a(tlb_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(tlb_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(tlb_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(tlb_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(tlb_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(tlb_io_ptw_pmp_7_mask),
    .io_ptw_customCSRs_csrs_0_wen(tlb_io_ptw_customCSRs_csrs_0_wen),
    .io_ptw_customCSRs_csrs_0_wdata(tlb_io_ptw_customCSRs_csrs_0_wdata),
    .io_ptw_customCSRs_csrs_0_value(tlb_io_ptw_customCSRs_csrs_0_value),
    .io_kill(tlb_io_kill)
  );
  Queue_21 f3 ( // @[frontend.scala 519:11]
    .clock(f3_clock),
    .reset(f3_reset),
    .io_enq_ready(f3_io_enq_ready),
    .io_enq_valid(f3_io_enq_valid),
    .io_enq_bits_pc(f3_io_enq_bits_pc),
    .io_enq_bits_data(f3_io_enq_bits_data),
    .io_enq_bits_mask(f3_io_enq_bits_mask),
    .io_enq_bits_xcpt_pf_inst(f3_io_enq_bits_xcpt_pf_inst),
    .io_enq_bits_xcpt_ae_inst(f3_io_enq_bits_xcpt_ae_inst),
    .io_enq_bits_ghist_old_history(f3_io_enq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken(f3_io_enq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken(f3_io_enq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken(f3_io_enq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx(f3_io_enq_bits_ghist_ras_idx),
    .io_enq_bits_fsrc(f3_io_enq_bits_fsrc),
    .io_enq_bits_tsrc(f3_io_enq_bits_tsrc),
    .io_deq_ready(f3_io_deq_ready),
    .io_deq_valid(f3_io_deq_valid),
    .io_deq_bits_pc(f3_io_deq_bits_pc),
    .io_deq_bits_data(f3_io_deq_bits_data),
    .io_deq_bits_mask(f3_io_deq_bits_mask),
    .io_deq_bits_xcpt_pf_inst(f3_io_deq_bits_xcpt_pf_inst),
    .io_deq_bits_xcpt_ae_inst(f3_io_deq_bits_xcpt_ae_inst),
    .io_deq_bits_ghist_old_history(f3_io_deq_bits_ghist_old_history),
    .io_deq_bits_ghist_current_saw_branch_not_taken(f3_io_deq_bits_ghist_current_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_not_taken(f3_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_taken(f3_io_deq_bits_ghist_new_saw_branch_taken),
    .io_deq_bits_ghist_ras_idx(f3_io_deq_bits_ghist_ras_idx),
    .io_deq_bits_fsrc(f3_io_deq_bits_fsrc),
    .io_deq_bits_tsrc(f3_io_deq_bits_tsrc),
    .io_count(f3_io_count)
  );
  Queue_22 f3_bpd_resp ( // @[frontend.scala 524:11]
    .clock(f3_bpd_resp_clock),
    .reset(f3_bpd_resp_reset),
    .io_enq_ready(f3_bpd_resp_io_enq_ready),
    .io_enq_valid(f3_bpd_resp_io_enq_valid),
    .io_enq_bits_pc(f3_bpd_resp_io_enq_bits_pc),
    .io_enq_bits_preds_0_taken(f3_bpd_resp_io_enq_bits_preds_0_taken),
    .io_enq_bits_preds_0_is_br(f3_bpd_resp_io_enq_bits_preds_0_is_br),
    .io_enq_bits_preds_0_is_jal(f3_bpd_resp_io_enq_bits_preds_0_is_jal),
    .io_enq_bits_preds_0_predicted_pc_valid(f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_valid),
    .io_enq_bits_preds_0_predicted_pc_bits(f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_bits),
    .io_enq_bits_preds_1_taken(f3_bpd_resp_io_enq_bits_preds_1_taken),
    .io_enq_bits_preds_1_is_br(f3_bpd_resp_io_enq_bits_preds_1_is_br),
    .io_enq_bits_preds_1_is_jal(f3_bpd_resp_io_enq_bits_preds_1_is_jal),
    .io_enq_bits_preds_1_predicted_pc_valid(f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_valid),
    .io_enq_bits_preds_1_predicted_pc_bits(f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_bits),
    .io_enq_bits_preds_2_taken(f3_bpd_resp_io_enq_bits_preds_2_taken),
    .io_enq_bits_preds_2_is_br(f3_bpd_resp_io_enq_bits_preds_2_is_br),
    .io_enq_bits_preds_2_is_jal(f3_bpd_resp_io_enq_bits_preds_2_is_jal),
    .io_enq_bits_preds_2_predicted_pc_valid(f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_valid),
    .io_enq_bits_preds_2_predicted_pc_bits(f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_bits),
    .io_enq_bits_preds_3_taken(f3_bpd_resp_io_enq_bits_preds_3_taken),
    .io_enq_bits_preds_3_is_br(f3_bpd_resp_io_enq_bits_preds_3_is_br),
    .io_enq_bits_preds_3_is_jal(f3_bpd_resp_io_enq_bits_preds_3_is_jal),
    .io_enq_bits_preds_3_predicted_pc_valid(f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_valid),
    .io_enq_bits_preds_3_predicted_pc_bits(f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_bits),
    .io_enq_bits_meta_0(f3_bpd_resp_io_enq_bits_meta_0),
    .io_enq_bits_lhist_0(f3_bpd_resp_io_enq_bits_lhist_0),
    .io_deq_ready(f3_bpd_resp_io_deq_ready),
    .io_deq_valid(f3_bpd_resp_io_deq_valid),
    .io_deq_bits_pc(f3_bpd_resp_io_deq_bits_pc),
    .io_deq_bits_preds_0_taken(f3_bpd_resp_io_deq_bits_preds_0_taken),
    .io_deq_bits_preds_0_is_br(f3_bpd_resp_io_deq_bits_preds_0_is_br),
    .io_deq_bits_preds_0_is_jal(f3_bpd_resp_io_deq_bits_preds_0_is_jal),
    .io_deq_bits_preds_0_predicted_pc_valid(f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_valid),
    .io_deq_bits_preds_0_predicted_pc_bits(f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits),
    .io_deq_bits_preds_1_taken(f3_bpd_resp_io_deq_bits_preds_1_taken),
    .io_deq_bits_preds_1_is_br(f3_bpd_resp_io_deq_bits_preds_1_is_br),
    .io_deq_bits_preds_1_is_jal(f3_bpd_resp_io_deq_bits_preds_1_is_jal),
    .io_deq_bits_preds_1_predicted_pc_valid(f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_valid),
    .io_deq_bits_preds_1_predicted_pc_bits(f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits),
    .io_deq_bits_preds_2_taken(f3_bpd_resp_io_deq_bits_preds_2_taken),
    .io_deq_bits_preds_2_is_br(f3_bpd_resp_io_deq_bits_preds_2_is_br),
    .io_deq_bits_preds_2_is_jal(f3_bpd_resp_io_deq_bits_preds_2_is_jal),
    .io_deq_bits_preds_2_predicted_pc_valid(f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_valid),
    .io_deq_bits_preds_2_predicted_pc_bits(f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits),
    .io_deq_bits_preds_3_taken(f3_bpd_resp_io_deq_bits_preds_3_taken),
    .io_deq_bits_preds_3_is_br(f3_bpd_resp_io_deq_bits_preds_3_is_br),
    .io_deq_bits_preds_3_is_jal(f3_bpd_resp_io_deq_bits_preds_3_is_jal),
    .io_deq_bits_preds_3_predicted_pc_valid(f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_valid),
    .io_deq_bits_preds_3_predicted_pc_bits(f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits),
    .io_deq_bits_meta_0(f3_bpd_resp_io_deq_bits_meta_0),
    .io_deq_bits_lhist_0(f3_bpd_resp_io_deq_bits_lhist_0),
    .io_count(f3_bpd_resp_io_count)
  );
  BreakpointUnit BreakpointUnit ( // @[frontend.scala 611:23]
    .clock(BreakpointUnit_clock),
    .reset(BreakpointUnit_reset),
    .io_status_debug(BreakpointUnit_io_status_debug),
    .io_status_cease(BreakpointUnit_io_status_cease),
    .io_status_wfi(BreakpointUnit_io_status_wfi),
    .io_status_isa(BreakpointUnit_io_status_isa),
    .io_status_dprv(BreakpointUnit_io_status_dprv),
    .io_status_prv(BreakpointUnit_io_status_prv),
    .io_status_sd(BreakpointUnit_io_status_sd),
    .io_status_zero2(BreakpointUnit_io_status_zero2),
    .io_status_sxl(BreakpointUnit_io_status_sxl),
    .io_status_uxl(BreakpointUnit_io_status_uxl),
    .io_status_sd_rv32(BreakpointUnit_io_status_sd_rv32),
    .io_status_zero1(BreakpointUnit_io_status_zero1),
    .io_status_tsr(BreakpointUnit_io_status_tsr),
    .io_status_tw(BreakpointUnit_io_status_tw),
    .io_status_tvm(BreakpointUnit_io_status_tvm),
    .io_status_mxr(BreakpointUnit_io_status_mxr),
    .io_status_sum(BreakpointUnit_io_status_sum),
    .io_status_mprv(BreakpointUnit_io_status_mprv),
    .io_status_xs(BreakpointUnit_io_status_xs),
    .io_status_fs(BreakpointUnit_io_status_fs),
    .io_status_mpp(BreakpointUnit_io_status_mpp),
    .io_status_vs(BreakpointUnit_io_status_vs),
    .io_status_spp(BreakpointUnit_io_status_spp),
    .io_status_mpie(BreakpointUnit_io_status_mpie),
    .io_status_hpie(BreakpointUnit_io_status_hpie),
    .io_status_spie(BreakpointUnit_io_status_spie),
    .io_status_upie(BreakpointUnit_io_status_upie),
    .io_status_mie(BreakpointUnit_io_status_mie),
    .io_status_hie(BreakpointUnit_io_status_hie),
    .io_status_sie(BreakpointUnit_io_status_sie),
    .io_status_uie(BreakpointUnit_io_status_uie),
    .io_pc(BreakpointUnit_io_pc),
    .io_ea(BreakpointUnit_io_ea),
    .io_xcpt_if(BreakpointUnit_io_xcpt_if),
    .io_xcpt_ld(BreakpointUnit_io_xcpt_ld),
    .io_xcpt_st(BreakpointUnit_io_xcpt_st),
    .io_debug_if(BreakpointUnit_io_debug_if),
    .io_debug_ld(BreakpointUnit_io_debug_ld),
    .io_debug_st(BreakpointUnit_io_debug_st)
  );
  RVCExpander RVCExpander ( // @[consts.scala 457:25]
    .clock(RVCExpander_clock),
    .reset(RVCExpander_reset),
    .io_in(RVCExpander_io_in),
    .io_out_bits(RVCExpander_io_out_bits),
    .io_out_rd(RVCExpander_io_out_rd),
    .io_out_rs1(RVCExpander_io_out_rs1),
    .io_out_rs2(RVCExpander_io_out_rs2),
    .io_out_rs3(RVCExpander_io_out_rs3),
    .io_rvc(RVCExpander_io_rvc)
  );
  RVCExpander RVCExpander_1 ( // @[consts.scala 457:25]
    .clock(RVCExpander_1_clock),
    .reset(RVCExpander_1_reset),
    .io_in(RVCExpander_1_io_in),
    .io_out_bits(RVCExpander_1_io_out_bits),
    .io_out_rd(RVCExpander_1_io_out_rd),
    .io_out_rs1(RVCExpander_1_io_out_rs1),
    .io_out_rs2(RVCExpander_1_io_out_rs2),
    .io_out_rs3(RVCExpander_1_io_out_rs3),
    .io_rvc(RVCExpander_1_io_rvc)
  );
  BranchDecode BranchDecode ( // @[frontend.scala 628:34]
    .clock(BranchDecode_clock),
    .reset(BranchDecode_reset),
    .io_inst(BranchDecode_io_inst),
    .io_pc(BranchDecode_io_pc),
    .io_is_unicore(BranchDecode_io_is_unicore),
    .io_out_is_ret(BranchDecode_io_out_is_ret),
    .io_out_is_call(BranchDecode_io_out_is_call),
    .io_out_target(BranchDecode_io_out_target),
    .io_out_cfi_type(BranchDecode_io_out_cfi_type),
    .io_out_sfb_offset_valid(BranchDecode_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits(BranchDecode_io_out_sfb_offset_bits),
    .io_out_shadowable(BranchDecode_io_out_shadowable)
  );
  BranchDecode BranchDecode_1 ( // @[frontend.scala 631:34]
    .clock(BranchDecode_1_clock),
    .reset(BranchDecode_1_reset),
    .io_inst(BranchDecode_1_io_inst),
    .io_pc(BranchDecode_1_io_pc),
    .io_is_unicore(BranchDecode_1_io_is_unicore),
    .io_out_is_ret(BranchDecode_1_io_out_is_ret),
    .io_out_is_call(BranchDecode_1_io_out_is_call),
    .io_out_target(BranchDecode_1_io_out_target),
    .io_out_cfi_type(BranchDecode_1_io_out_cfi_type),
    .io_out_sfb_offset_valid(BranchDecode_1_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits(BranchDecode_1_io_out_sfb_offset_bits),
    .io_out_shadowable(BranchDecode_1_io_out_shadowable)
  );
  BreakpointUnit BreakpointUnit_1 ( // @[frontend.scala 611:23]
    .clock(BreakpointUnit_1_clock),
    .reset(BreakpointUnit_1_reset),
    .io_status_debug(BreakpointUnit_1_io_status_debug),
    .io_status_cease(BreakpointUnit_1_io_status_cease),
    .io_status_wfi(BreakpointUnit_1_io_status_wfi),
    .io_status_isa(BreakpointUnit_1_io_status_isa),
    .io_status_dprv(BreakpointUnit_1_io_status_dprv),
    .io_status_prv(BreakpointUnit_1_io_status_prv),
    .io_status_sd(BreakpointUnit_1_io_status_sd),
    .io_status_zero2(BreakpointUnit_1_io_status_zero2),
    .io_status_sxl(BreakpointUnit_1_io_status_sxl),
    .io_status_uxl(BreakpointUnit_1_io_status_uxl),
    .io_status_sd_rv32(BreakpointUnit_1_io_status_sd_rv32),
    .io_status_zero1(BreakpointUnit_1_io_status_zero1),
    .io_status_tsr(BreakpointUnit_1_io_status_tsr),
    .io_status_tw(BreakpointUnit_1_io_status_tw),
    .io_status_tvm(BreakpointUnit_1_io_status_tvm),
    .io_status_mxr(BreakpointUnit_1_io_status_mxr),
    .io_status_sum(BreakpointUnit_1_io_status_sum),
    .io_status_mprv(BreakpointUnit_1_io_status_mprv),
    .io_status_xs(BreakpointUnit_1_io_status_xs),
    .io_status_fs(BreakpointUnit_1_io_status_fs),
    .io_status_mpp(BreakpointUnit_1_io_status_mpp),
    .io_status_vs(BreakpointUnit_1_io_status_vs),
    .io_status_spp(BreakpointUnit_1_io_status_spp),
    .io_status_mpie(BreakpointUnit_1_io_status_mpie),
    .io_status_hpie(BreakpointUnit_1_io_status_hpie),
    .io_status_spie(BreakpointUnit_1_io_status_spie),
    .io_status_upie(BreakpointUnit_1_io_status_upie),
    .io_status_mie(BreakpointUnit_1_io_status_mie),
    .io_status_hie(BreakpointUnit_1_io_status_hie),
    .io_status_sie(BreakpointUnit_1_io_status_sie),
    .io_status_uie(BreakpointUnit_1_io_status_uie),
    .io_pc(BreakpointUnit_1_io_pc),
    .io_ea(BreakpointUnit_1_io_ea),
    .io_xcpt_if(BreakpointUnit_1_io_xcpt_if),
    .io_xcpt_ld(BreakpointUnit_1_io_xcpt_ld),
    .io_xcpt_st(BreakpointUnit_1_io_xcpt_st),
    .io_debug_if(BreakpointUnit_1_io_debug_if),
    .io_debug_ld(BreakpointUnit_1_io_debug_ld),
    .io_debug_st(BreakpointUnit_1_io_debug_st)
  );
  RVCExpander RVCExpander_2 ( // @[consts.scala 457:25]
    .clock(RVCExpander_2_clock),
    .reset(RVCExpander_2_reset),
    .io_in(RVCExpander_2_io_in),
    .io_out_bits(RVCExpander_2_io_out_bits),
    .io_out_rd(RVCExpander_2_io_out_rd),
    .io_out_rs1(RVCExpander_2_io_out_rs1),
    .io_out_rs2(RVCExpander_2_io_out_rs2),
    .io_out_rs3(RVCExpander_2_io_out_rs3),
    .io_rvc(RVCExpander_2_io_rvc)
  );
  BranchDecode BranchDecode_2 ( // @[frontend.scala 676:33]
    .clock(BranchDecode_2_clock),
    .reset(BranchDecode_2_reset),
    .io_inst(BranchDecode_2_io_inst),
    .io_pc(BranchDecode_2_io_pc),
    .io_is_unicore(BranchDecode_2_io_is_unicore),
    .io_out_is_ret(BranchDecode_2_io_out_is_ret),
    .io_out_is_call(BranchDecode_2_io_out_is_call),
    .io_out_target(BranchDecode_2_io_out_target),
    .io_out_cfi_type(BranchDecode_2_io_out_cfi_type),
    .io_out_sfb_offset_valid(BranchDecode_2_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits(BranchDecode_2_io_out_sfb_offset_bits),
    .io_out_shadowable(BranchDecode_2_io_out_shadowable)
  );
  BreakpointUnit BreakpointUnit_2 ( // @[frontend.scala 611:23]
    .clock(BreakpointUnit_2_clock),
    .reset(BreakpointUnit_2_reset),
    .io_status_debug(BreakpointUnit_2_io_status_debug),
    .io_status_cease(BreakpointUnit_2_io_status_cease),
    .io_status_wfi(BreakpointUnit_2_io_status_wfi),
    .io_status_isa(BreakpointUnit_2_io_status_isa),
    .io_status_dprv(BreakpointUnit_2_io_status_dprv),
    .io_status_prv(BreakpointUnit_2_io_status_prv),
    .io_status_sd(BreakpointUnit_2_io_status_sd),
    .io_status_zero2(BreakpointUnit_2_io_status_zero2),
    .io_status_sxl(BreakpointUnit_2_io_status_sxl),
    .io_status_uxl(BreakpointUnit_2_io_status_uxl),
    .io_status_sd_rv32(BreakpointUnit_2_io_status_sd_rv32),
    .io_status_zero1(BreakpointUnit_2_io_status_zero1),
    .io_status_tsr(BreakpointUnit_2_io_status_tsr),
    .io_status_tw(BreakpointUnit_2_io_status_tw),
    .io_status_tvm(BreakpointUnit_2_io_status_tvm),
    .io_status_mxr(BreakpointUnit_2_io_status_mxr),
    .io_status_sum(BreakpointUnit_2_io_status_sum),
    .io_status_mprv(BreakpointUnit_2_io_status_mprv),
    .io_status_xs(BreakpointUnit_2_io_status_xs),
    .io_status_fs(BreakpointUnit_2_io_status_fs),
    .io_status_mpp(BreakpointUnit_2_io_status_mpp),
    .io_status_vs(BreakpointUnit_2_io_status_vs),
    .io_status_spp(BreakpointUnit_2_io_status_spp),
    .io_status_mpie(BreakpointUnit_2_io_status_mpie),
    .io_status_hpie(BreakpointUnit_2_io_status_hpie),
    .io_status_spie(BreakpointUnit_2_io_status_spie),
    .io_status_upie(BreakpointUnit_2_io_status_upie),
    .io_status_mie(BreakpointUnit_2_io_status_mie),
    .io_status_hie(BreakpointUnit_2_io_status_hie),
    .io_status_sie(BreakpointUnit_2_io_status_sie),
    .io_status_uie(BreakpointUnit_2_io_status_uie),
    .io_pc(BreakpointUnit_2_io_pc),
    .io_ea(BreakpointUnit_2_io_ea),
    .io_xcpt_if(BreakpointUnit_2_io_xcpt_if),
    .io_xcpt_ld(BreakpointUnit_2_io_xcpt_ld),
    .io_xcpt_st(BreakpointUnit_2_io_xcpt_st),
    .io_debug_if(BreakpointUnit_2_io_debug_if),
    .io_debug_ld(BreakpointUnit_2_io_debug_ld),
    .io_debug_st(BreakpointUnit_2_io_debug_st)
  );
  RVCExpander RVCExpander_3 ( // @[consts.scala 457:25]
    .clock(RVCExpander_3_clock),
    .reset(RVCExpander_3_reset),
    .io_in(RVCExpander_3_io_in),
    .io_out_bits(RVCExpander_3_io_out_bits),
    .io_out_rd(RVCExpander_3_io_out_rd),
    .io_out_rs1(RVCExpander_3_io_out_rs1),
    .io_out_rs2(RVCExpander_3_io_out_rs2),
    .io_out_rs3(RVCExpander_3_io_out_rs3),
    .io_rvc(RVCExpander_3_io_rvc)
  );
  BranchDecode BranchDecode_3 ( // @[frontend.scala 676:33]
    .clock(BranchDecode_3_clock),
    .reset(BranchDecode_3_reset),
    .io_inst(BranchDecode_3_io_inst),
    .io_pc(BranchDecode_3_io_pc),
    .io_is_unicore(BranchDecode_3_io_is_unicore),
    .io_out_is_ret(BranchDecode_3_io_out_is_ret),
    .io_out_is_call(BranchDecode_3_io_out_is_call),
    .io_out_target(BranchDecode_3_io_out_target),
    .io_out_cfi_type(BranchDecode_3_io_out_cfi_type),
    .io_out_sfb_offset_valid(BranchDecode_3_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits(BranchDecode_3_io_out_sfb_offset_bits),
    .io_out_shadowable(BranchDecode_3_io_out_shadowable)
  );
  BreakpointUnit BreakpointUnit_3 ( // @[frontend.scala 611:23]
    .clock(BreakpointUnit_3_clock),
    .reset(BreakpointUnit_3_reset),
    .io_status_debug(BreakpointUnit_3_io_status_debug),
    .io_status_cease(BreakpointUnit_3_io_status_cease),
    .io_status_wfi(BreakpointUnit_3_io_status_wfi),
    .io_status_isa(BreakpointUnit_3_io_status_isa),
    .io_status_dprv(BreakpointUnit_3_io_status_dprv),
    .io_status_prv(BreakpointUnit_3_io_status_prv),
    .io_status_sd(BreakpointUnit_3_io_status_sd),
    .io_status_zero2(BreakpointUnit_3_io_status_zero2),
    .io_status_sxl(BreakpointUnit_3_io_status_sxl),
    .io_status_uxl(BreakpointUnit_3_io_status_uxl),
    .io_status_sd_rv32(BreakpointUnit_3_io_status_sd_rv32),
    .io_status_zero1(BreakpointUnit_3_io_status_zero1),
    .io_status_tsr(BreakpointUnit_3_io_status_tsr),
    .io_status_tw(BreakpointUnit_3_io_status_tw),
    .io_status_tvm(BreakpointUnit_3_io_status_tvm),
    .io_status_mxr(BreakpointUnit_3_io_status_mxr),
    .io_status_sum(BreakpointUnit_3_io_status_sum),
    .io_status_mprv(BreakpointUnit_3_io_status_mprv),
    .io_status_xs(BreakpointUnit_3_io_status_xs),
    .io_status_fs(BreakpointUnit_3_io_status_fs),
    .io_status_mpp(BreakpointUnit_3_io_status_mpp),
    .io_status_vs(BreakpointUnit_3_io_status_vs),
    .io_status_spp(BreakpointUnit_3_io_status_spp),
    .io_status_mpie(BreakpointUnit_3_io_status_mpie),
    .io_status_hpie(BreakpointUnit_3_io_status_hpie),
    .io_status_spie(BreakpointUnit_3_io_status_spie),
    .io_status_upie(BreakpointUnit_3_io_status_upie),
    .io_status_mie(BreakpointUnit_3_io_status_mie),
    .io_status_hie(BreakpointUnit_3_io_status_hie),
    .io_status_sie(BreakpointUnit_3_io_status_sie),
    .io_status_uie(BreakpointUnit_3_io_status_uie),
    .io_pc(BreakpointUnit_3_io_pc),
    .io_ea(BreakpointUnit_3_io_ea),
    .io_xcpt_if(BreakpointUnit_3_io_xcpt_if),
    .io_xcpt_ld(BreakpointUnit_3_io_xcpt_ld),
    .io_xcpt_st(BreakpointUnit_3_io_xcpt_st),
    .io_debug_if(BreakpointUnit_3_io_debug_if),
    .io_debug_ld(BreakpointUnit_3_io_debug_ld),
    .io_debug_st(BreakpointUnit_3_io_debug_st)
  );
  RVCExpander RVCExpander_4 ( // @[consts.scala 457:25]
    .clock(RVCExpander_4_clock),
    .reset(RVCExpander_4_reset),
    .io_in(RVCExpander_4_io_in),
    .io_out_bits(RVCExpander_4_io_out_bits),
    .io_out_rd(RVCExpander_4_io_out_rd),
    .io_out_rs1(RVCExpander_4_io_out_rs1),
    .io_out_rs2(RVCExpander_4_io_out_rs2),
    .io_out_rs3(RVCExpander_4_io_out_rs3),
    .io_rvc(RVCExpander_4_io_rvc)
  );
  BranchDecode BranchDecode_4 ( // @[frontend.scala 676:33]
    .clock(BranchDecode_4_clock),
    .reset(BranchDecode_4_reset),
    .io_inst(BranchDecode_4_io_inst),
    .io_pc(BranchDecode_4_io_pc),
    .io_is_unicore(BranchDecode_4_io_is_unicore),
    .io_out_is_ret(BranchDecode_4_io_out_is_ret),
    .io_out_is_call(BranchDecode_4_io_out_is_call),
    .io_out_target(BranchDecode_4_io_out_target),
    .io_out_cfi_type(BranchDecode_4_io_out_cfi_type),
    .io_out_sfb_offset_valid(BranchDecode_4_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits(BranchDecode_4_io_out_sfb_offset_bits),
    .io_out_shadowable(BranchDecode_4_io_out_shadowable)
  );
  Queue_23 f4_btb_corrections ( // @[frontend.scala 856:34]
    .clock(f4_btb_corrections_clock),
    .reset(f4_btb_corrections_reset),
    .io_enq_ready(f4_btb_corrections_io_enq_ready),
    .io_enq_valid(f4_btb_corrections_io_enq_valid),
    .io_enq_bits_is_mispredict_update(f4_btb_corrections_io_enq_bits_is_mispredict_update),
    .io_enq_bits_is_repair_update(f4_btb_corrections_io_enq_bits_is_repair_update),
    .io_enq_bits_btb_mispredicts(f4_btb_corrections_io_enq_bits_btb_mispredicts),
    .io_enq_bits_pc(f4_btb_corrections_io_enq_bits_pc),
    .io_enq_bits_br_mask(f4_btb_corrections_io_enq_bits_br_mask),
    .io_enq_bits_cfi_idx_valid(f4_btb_corrections_io_enq_bits_cfi_idx_valid),
    .io_enq_bits_cfi_idx_bits(f4_btb_corrections_io_enq_bits_cfi_idx_bits),
    .io_enq_bits_cfi_taken(f4_btb_corrections_io_enq_bits_cfi_taken),
    .io_enq_bits_cfi_mispredicted(f4_btb_corrections_io_enq_bits_cfi_mispredicted),
    .io_enq_bits_cfi_is_br(f4_btb_corrections_io_enq_bits_cfi_is_br),
    .io_enq_bits_cfi_is_jal(f4_btb_corrections_io_enq_bits_cfi_is_jal),
    .io_enq_bits_cfi_is_jalr(f4_btb_corrections_io_enq_bits_cfi_is_jalr),
    .io_enq_bits_ghist_old_history(f4_btb_corrections_io_enq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken(f4_btb_corrections_io_enq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken(f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken(f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx(f4_btb_corrections_io_enq_bits_ghist_ras_idx),
    .io_enq_bits_lhist_0(f4_btb_corrections_io_enq_bits_lhist_0),
    .io_enq_bits_target(f4_btb_corrections_io_enq_bits_target),
    .io_enq_bits_meta_0(f4_btb_corrections_io_enq_bits_meta_0),
    .io_deq_ready(f4_btb_corrections_io_deq_ready),
    .io_deq_valid(f4_btb_corrections_io_deq_valid),
    .io_deq_bits_is_mispredict_update(f4_btb_corrections_io_deq_bits_is_mispredict_update),
    .io_deq_bits_is_repair_update(f4_btb_corrections_io_deq_bits_is_repair_update),
    .io_deq_bits_btb_mispredicts(f4_btb_corrections_io_deq_bits_btb_mispredicts),
    .io_deq_bits_pc(f4_btb_corrections_io_deq_bits_pc),
    .io_deq_bits_br_mask(f4_btb_corrections_io_deq_bits_br_mask),
    .io_deq_bits_cfi_idx_valid(f4_btb_corrections_io_deq_bits_cfi_idx_valid),
    .io_deq_bits_cfi_idx_bits(f4_btb_corrections_io_deq_bits_cfi_idx_bits),
    .io_deq_bits_cfi_taken(f4_btb_corrections_io_deq_bits_cfi_taken),
    .io_deq_bits_cfi_mispredicted(f4_btb_corrections_io_deq_bits_cfi_mispredicted),
    .io_deq_bits_cfi_is_br(f4_btb_corrections_io_deq_bits_cfi_is_br),
    .io_deq_bits_cfi_is_jal(f4_btb_corrections_io_deq_bits_cfi_is_jal),
    .io_deq_bits_cfi_is_jalr(f4_btb_corrections_io_deq_bits_cfi_is_jalr),
    .io_deq_bits_ghist_old_history(f4_btb_corrections_io_deq_bits_ghist_old_history),
    .io_deq_bits_ghist_current_saw_branch_not_taken(f4_btb_corrections_io_deq_bits_ghist_current_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_not_taken(f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_taken(f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_taken),
    .io_deq_bits_ghist_ras_idx(f4_btb_corrections_io_deq_bits_ghist_ras_idx),
    .io_deq_bits_lhist_0(f4_btb_corrections_io_deq_bits_lhist_0),
    .io_deq_bits_target(f4_btb_corrections_io_deq_bits_target),
    .io_deq_bits_meta_0(f4_btb_corrections_io_deq_bits_meta_0),
    .io_count(f4_btb_corrections_io_count)
  );
  Queue_24 f4 ( // @[frontend.scala 873:11]
    .clock(f4_clock),
    .reset(f4_reset),
    .io_enq_ready(f4_io_enq_ready),
    .io_enq_valid(f4_io_enq_valid),
    .io_enq_bits_pc(f4_io_enq_bits_pc),
    .io_enq_bits_next_pc(f4_io_enq_bits_next_pc),
    .io_enq_bits_edge_inst_0(f4_io_enq_bits_edge_inst_0),
    .io_enq_bits_insts_0(f4_io_enq_bits_insts_0),
    .io_enq_bits_insts_1(f4_io_enq_bits_insts_1),
    .io_enq_bits_insts_2(f4_io_enq_bits_insts_2),
    .io_enq_bits_insts_3(f4_io_enq_bits_insts_3),
    .io_enq_bits_exp_insts_0(f4_io_enq_bits_exp_insts_0),
    .io_enq_bits_exp_insts_1(f4_io_enq_bits_exp_insts_1),
    .io_enq_bits_exp_insts_2(f4_io_enq_bits_exp_insts_2),
    .io_enq_bits_exp_insts_3(f4_io_enq_bits_exp_insts_3),
    .io_enq_bits_sfbs_0(f4_io_enq_bits_sfbs_0),
    .io_enq_bits_sfbs_1(f4_io_enq_bits_sfbs_1),
    .io_enq_bits_sfbs_2(f4_io_enq_bits_sfbs_2),
    .io_enq_bits_sfbs_3(f4_io_enq_bits_sfbs_3),
    .io_enq_bits_sfb_masks_0(f4_io_enq_bits_sfb_masks_0),
    .io_enq_bits_sfb_masks_1(f4_io_enq_bits_sfb_masks_1),
    .io_enq_bits_sfb_masks_2(f4_io_enq_bits_sfb_masks_2),
    .io_enq_bits_sfb_masks_3(f4_io_enq_bits_sfb_masks_3),
    .io_enq_bits_sfb_dests_0(f4_io_enq_bits_sfb_dests_0),
    .io_enq_bits_sfb_dests_1(f4_io_enq_bits_sfb_dests_1),
    .io_enq_bits_sfb_dests_2(f4_io_enq_bits_sfb_dests_2),
    .io_enq_bits_sfb_dests_3(f4_io_enq_bits_sfb_dests_3),
    .io_enq_bits_shadowable_mask_0(f4_io_enq_bits_shadowable_mask_0),
    .io_enq_bits_shadowable_mask_1(f4_io_enq_bits_shadowable_mask_1),
    .io_enq_bits_shadowable_mask_2(f4_io_enq_bits_shadowable_mask_2),
    .io_enq_bits_shadowable_mask_3(f4_io_enq_bits_shadowable_mask_3),
    .io_enq_bits_shadowed_mask_0(f4_io_enq_bits_shadowed_mask_0),
    .io_enq_bits_shadowed_mask_1(f4_io_enq_bits_shadowed_mask_1),
    .io_enq_bits_shadowed_mask_2(f4_io_enq_bits_shadowed_mask_2),
    .io_enq_bits_shadowed_mask_3(f4_io_enq_bits_shadowed_mask_3),
    .io_enq_bits_cfi_idx_valid(f4_io_enq_bits_cfi_idx_valid),
    .io_enq_bits_cfi_idx_bits(f4_io_enq_bits_cfi_idx_bits),
    .io_enq_bits_cfi_type(f4_io_enq_bits_cfi_type),
    .io_enq_bits_cfi_is_call(f4_io_enq_bits_cfi_is_call),
    .io_enq_bits_cfi_is_ret(f4_io_enq_bits_cfi_is_ret),
    .io_enq_bits_cfi_npc_plus4(f4_io_enq_bits_cfi_npc_plus4),
    .io_enq_bits_ras_top(f4_io_enq_bits_ras_top),
    .io_enq_bits_ftq_idx(f4_io_enq_bits_ftq_idx),
    .io_enq_bits_mask(f4_io_enq_bits_mask),
    .io_enq_bits_br_mask(f4_io_enq_bits_br_mask),
    .io_enq_bits_ghist_old_history(f4_io_enq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken(f4_io_enq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken(f4_io_enq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken(f4_io_enq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx(f4_io_enq_bits_ghist_ras_idx),
    .io_enq_bits_lhist_0(f4_io_enq_bits_lhist_0),
    .io_enq_bits_xcpt_pf_if(f4_io_enq_bits_xcpt_pf_if),
    .io_enq_bits_xcpt_ae_if(f4_io_enq_bits_xcpt_ae_if),
    .io_enq_bits_bp_debug_if_oh_0(f4_io_enq_bits_bp_debug_if_oh_0),
    .io_enq_bits_bp_debug_if_oh_1(f4_io_enq_bits_bp_debug_if_oh_1),
    .io_enq_bits_bp_debug_if_oh_2(f4_io_enq_bits_bp_debug_if_oh_2),
    .io_enq_bits_bp_debug_if_oh_3(f4_io_enq_bits_bp_debug_if_oh_3),
    .io_enq_bits_bp_xcpt_if_oh_0(f4_io_enq_bits_bp_xcpt_if_oh_0),
    .io_enq_bits_bp_xcpt_if_oh_1(f4_io_enq_bits_bp_xcpt_if_oh_1),
    .io_enq_bits_bp_xcpt_if_oh_2(f4_io_enq_bits_bp_xcpt_if_oh_2),
    .io_enq_bits_bp_xcpt_if_oh_3(f4_io_enq_bits_bp_xcpt_if_oh_3),
    .io_enq_bits_end_half_valid(f4_io_enq_bits_end_half_valid),
    .io_enq_bits_end_half_bits(f4_io_enq_bits_end_half_bits),
    .io_enq_bits_bpd_meta_0(f4_io_enq_bits_bpd_meta_0),
    .io_enq_bits_fsrc(f4_io_enq_bits_fsrc),
    .io_enq_bits_tsrc(f4_io_enq_bits_tsrc),
    .io_deq_ready(f4_io_deq_ready),
    .io_deq_valid(f4_io_deq_valid),
    .io_deq_bits_pc(f4_io_deq_bits_pc),
    .io_deq_bits_next_pc(f4_io_deq_bits_next_pc),
    .io_deq_bits_edge_inst_0(f4_io_deq_bits_edge_inst_0),
    .io_deq_bits_insts_0(f4_io_deq_bits_insts_0),
    .io_deq_bits_insts_1(f4_io_deq_bits_insts_1),
    .io_deq_bits_insts_2(f4_io_deq_bits_insts_2),
    .io_deq_bits_insts_3(f4_io_deq_bits_insts_3),
    .io_deq_bits_exp_insts_0(f4_io_deq_bits_exp_insts_0),
    .io_deq_bits_exp_insts_1(f4_io_deq_bits_exp_insts_1),
    .io_deq_bits_exp_insts_2(f4_io_deq_bits_exp_insts_2),
    .io_deq_bits_exp_insts_3(f4_io_deq_bits_exp_insts_3),
    .io_deq_bits_sfbs_0(f4_io_deq_bits_sfbs_0),
    .io_deq_bits_sfbs_1(f4_io_deq_bits_sfbs_1),
    .io_deq_bits_sfbs_2(f4_io_deq_bits_sfbs_2),
    .io_deq_bits_sfbs_3(f4_io_deq_bits_sfbs_3),
    .io_deq_bits_sfb_masks_0(f4_io_deq_bits_sfb_masks_0),
    .io_deq_bits_sfb_masks_1(f4_io_deq_bits_sfb_masks_1),
    .io_deq_bits_sfb_masks_2(f4_io_deq_bits_sfb_masks_2),
    .io_deq_bits_sfb_masks_3(f4_io_deq_bits_sfb_masks_3),
    .io_deq_bits_sfb_dests_0(f4_io_deq_bits_sfb_dests_0),
    .io_deq_bits_sfb_dests_1(f4_io_deq_bits_sfb_dests_1),
    .io_deq_bits_sfb_dests_2(f4_io_deq_bits_sfb_dests_2),
    .io_deq_bits_sfb_dests_3(f4_io_deq_bits_sfb_dests_3),
    .io_deq_bits_shadowable_mask_0(f4_io_deq_bits_shadowable_mask_0),
    .io_deq_bits_shadowable_mask_1(f4_io_deq_bits_shadowable_mask_1),
    .io_deq_bits_shadowable_mask_2(f4_io_deq_bits_shadowable_mask_2),
    .io_deq_bits_shadowable_mask_3(f4_io_deq_bits_shadowable_mask_3),
    .io_deq_bits_shadowed_mask_0(f4_io_deq_bits_shadowed_mask_0),
    .io_deq_bits_shadowed_mask_1(f4_io_deq_bits_shadowed_mask_1),
    .io_deq_bits_shadowed_mask_2(f4_io_deq_bits_shadowed_mask_2),
    .io_deq_bits_shadowed_mask_3(f4_io_deq_bits_shadowed_mask_3),
    .io_deq_bits_cfi_idx_valid(f4_io_deq_bits_cfi_idx_valid),
    .io_deq_bits_cfi_idx_bits(f4_io_deq_bits_cfi_idx_bits),
    .io_deq_bits_cfi_type(f4_io_deq_bits_cfi_type),
    .io_deq_bits_cfi_is_call(f4_io_deq_bits_cfi_is_call),
    .io_deq_bits_cfi_is_ret(f4_io_deq_bits_cfi_is_ret),
    .io_deq_bits_cfi_npc_plus4(f4_io_deq_bits_cfi_npc_plus4),
    .io_deq_bits_ras_top(f4_io_deq_bits_ras_top),
    .io_deq_bits_ftq_idx(f4_io_deq_bits_ftq_idx),
    .io_deq_bits_mask(f4_io_deq_bits_mask),
    .io_deq_bits_br_mask(f4_io_deq_bits_br_mask),
    .io_deq_bits_ghist_old_history(f4_io_deq_bits_ghist_old_history),
    .io_deq_bits_ghist_current_saw_branch_not_taken(f4_io_deq_bits_ghist_current_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_not_taken(f4_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_taken(f4_io_deq_bits_ghist_new_saw_branch_taken),
    .io_deq_bits_ghist_ras_idx(f4_io_deq_bits_ghist_ras_idx),
    .io_deq_bits_lhist_0(f4_io_deq_bits_lhist_0),
    .io_deq_bits_xcpt_pf_if(f4_io_deq_bits_xcpt_pf_if),
    .io_deq_bits_xcpt_ae_if(f4_io_deq_bits_xcpt_ae_if),
    .io_deq_bits_bp_debug_if_oh_0(f4_io_deq_bits_bp_debug_if_oh_0),
    .io_deq_bits_bp_debug_if_oh_1(f4_io_deq_bits_bp_debug_if_oh_1),
    .io_deq_bits_bp_debug_if_oh_2(f4_io_deq_bits_bp_debug_if_oh_2),
    .io_deq_bits_bp_debug_if_oh_3(f4_io_deq_bits_bp_debug_if_oh_3),
    .io_deq_bits_bp_xcpt_if_oh_0(f4_io_deq_bits_bp_xcpt_if_oh_0),
    .io_deq_bits_bp_xcpt_if_oh_1(f4_io_deq_bits_bp_xcpt_if_oh_1),
    .io_deq_bits_bp_xcpt_if_oh_2(f4_io_deq_bits_bp_xcpt_if_oh_2),
    .io_deq_bits_bp_xcpt_if_oh_3(f4_io_deq_bits_bp_xcpt_if_oh_3),
    .io_deq_bits_end_half_valid(f4_io_deq_bits_end_half_valid),
    .io_deq_bits_end_half_bits(f4_io_deq_bits_end_half_bits),
    .io_deq_bits_bpd_meta_0(f4_io_deq_bits_bpd_meta_0),
    .io_deq_bits_fsrc(f4_io_deq_bits_fsrc),
    .io_deq_bits_tsrc(f4_io_deq_bits_tsrc),
    .io_count(f4_io_count)
  );
  FetchBuffer fb ( // @[frontend.scala 875:19]
    .clock(fb_clock),
    .reset(fb_reset),
    .io_enq_ready(fb_io_enq_ready),
    .io_enq_valid(fb_io_enq_valid),
    .io_enq_bits_pc(fb_io_enq_bits_pc),
    .io_enq_bits_next_pc(fb_io_enq_bits_next_pc),
    .io_enq_bits_edge_inst_0(fb_io_enq_bits_edge_inst_0),
    .io_enq_bits_insts_0(fb_io_enq_bits_insts_0),
    .io_enq_bits_insts_1(fb_io_enq_bits_insts_1),
    .io_enq_bits_insts_2(fb_io_enq_bits_insts_2),
    .io_enq_bits_insts_3(fb_io_enq_bits_insts_3),
    .io_enq_bits_exp_insts_0(fb_io_enq_bits_exp_insts_0),
    .io_enq_bits_exp_insts_1(fb_io_enq_bits_exp_insts_1),
    .io_enq_bits_exp_insts_2(fb_io_enq_bits_exp_insts_2),
    .io_enq_bits_exp_insts_3(fb_io_enq_bits_exp_insts_3),
    .io_enq_bits_sfbs_0(fb_io_enq_bits_sfbs_0),
    .io_enq_bits_sfbs_1(fb_io_enq_bits_sfbs_1),
    .io_enq_bits_sfbs_2(fb_io_enq_bits_sfbs_2),
    .io_enq_bits_sfbs_3(fb_io_enq_bits_sfbs_3),
    .io_enq_bits_sfb_masks_0(fb_io_enq_bits_sfb_masks_0),
    .io_enq_bits_sfb_masks_1(fb_io_enq_bits_sfb_masks_1),
    .io_enq_bits_sfb_masks_2(fb_io_enq_bits_sfb_masks_2),
    .io_enq_bits_sfb_masks_3(fb_io_enq_bits_sfb_masks_3),
    .io_enq_bits_sfb_dests_0(fb_io_enq_bits_sfb_dests_0),
    .io_enq_bits_sfb_dests_1(fb_io_enq_bits_sfb_dests_1),
    .io_enq_bits_sfb_dests_2(fb_io_enq_bits_sfb_dests_2),
    .io_enq_bits_sfb_dests_3(fb_io_enq_bits_sfb_dests_3),
    .io_enq_bits_shadowable_mask_0(fb_io_enq_bits_shadowable_mask_0),
    .io_enq_bits_shadowable_mask_1(fb_io_enq_bits_shadowable_mask_1),
    .io_enq_bits_shadowable_mask_2(fb_io_enq_bits_shadowable_mask_2),
    .io_enq_bits_shadowable_mask_3(fb_io_enq_bits_shadowable_mask_3),
    .io_enq_bits_shadowed_mask_0(fb_io_enq_bits_shadowed_mask_0),
    .io_enq_bits_shadowed_mask_1(fb_io_enq_bits_shadowed_mask_1),
    .io_enq_bits_shadowed_mask_2(fb_io_enq_bits_shadowed_mask_2),
    .io_enq_bits_shadowed_mask_3(fb_io_enq_bits_shadowed_mask_3),
    .io_enq_bits_cfi_idx_valid(fb_io_enq_bits_cfi_idx_valid),
    .io_enq_bits_cfi_idx_bits(fb_io_enq_bits_cfi_idx_bits),
    .io_enq_bits_cfi_type(fb_io_enq_bits_cfi_type),
    .io_enq_bits_cfi_is_call(fb_io_enq_bits_cfi_is_call),
    .io_enq_bits_cfi_is_ret(fb_io_enq_bits_cfi_is_ret),
    .io_enq_bits_cfi_npc_plus4(fb_io_enq_bits_cfi_npc_plus4),
    .io_enq_bits_ras_top(fb_io_enq_bits_ras_top),
    .io_enq_bits_ftq_idx(fb_io_enq_bits_ftq_idx),
    .io_enq_bits_mask(fb_io_enq_bits_mask),
    .io_enq_bits_br_mask(fb_io_enq_bits_br_mask),
    .io_enq_bits_ghist_old_history(fb_io_enq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken(fb_io_enq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken(fb_io_enq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken(fb_io_enq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx(fb_io_enq_bits_ghist_ras_idx),
    .io_enq_bits_lhist_0(fb_io_enq_bits_lhist_0),
    .io_enq_bits_xcpt_pf_if(fb_io_enq_bits_xcpt_pf_if),
    .io_enq_bits_xcpt_ae_if(fb_io_enq_bits_xcpt_ae_if),
    .io_enq_bits_bp_debug_if_oh_0(fb_io_enq_bits_bp_debug_if_oh_0),
    .io_enq_bits_bp_debug_if_oh_1(fb_io_enq_bits_bp_debug_if_oh_1),
    .io_enq_bits_bp_debug_if_oh_2(fb_io_enq_bits_bp_debug_if_oh_2),
    .io_enq_bits_bp_debug_if_oh_3(fb_io_enq_bits_bp_debug_if_oh_3),
    .io_enq_bits_bp_xcpt_if_oh_0(fb_io_enq_bits_bp_xcpt_if_oh_0),
    .io_enq_bits_bp_xcpt_if_oh_1(fb_io_enq_bits_bp_xcpt_if_oh_1),
    .io_enq_bits_bp_xcpt_if_oh_2(fb_io_enq_bits_bp_xcpt_if_oh_2),
    .io_enq_bits_bp_xcpt_if_oh_3(fb_io_enq_bits_bp_xcpt_if_oh_3),
    .io_enq_bits_end_half_valid(fb_io_enq_bits_end_half_valid),
    .io_enq_bits_end_half_bits(fb_io_enq_bits_end_half_bits),
    .io_enq_bits_bpd_meta_0(fb_io_enq_bits_bpd_meta_0),
    .io_enq_bits_fsrc(fb_io_enq_bits_fsrc),
    .io_enq_bits_tsrc(fb_io_enq_bits_tsrc),
    .io_deq_ready(fb_io_deq_ready),
    .io_deq_valid(fb_io_deq_valid),
    .io_deq_bits_uops_0_valid(fb_io_deq_bits_uops_0_valid),
    .io_deq_bits_uops_0_bits_switch(fb_io_deq_bits_uops_0_bits_switch),
    .io_deq_bits_uops_0_bits_switch_off(fb_io_deq_bits_uops_0_bits_switch_off),
    .io_deq_bits_uops_0_bits_is_unicore(fb_io_deq_bits_uops_0_bits_is_unicore),
    .io_deq_bits_uops_0_bits_shift(fb_io_deq_bits_uops_0_bits_shift),
    .io_deq_bits_uops_0_bits_lrs3_rtype(fb_io_deq_bits_uops_0_bits_lrs3_rtype),
    .io_deq_bits_uops_0_bits_rflag(fb_io_deq_bits_uops_0_bits_rflag),
    .io_deq_bits_uops_0_bits_wflag(fb_io_deq_bits_uops_0_bits_wflag),
    .io_deq_bits_uops_0_bits_prflag(fb_io_deq_bits_uops_0_bits_prflag),
    .io_deq_bits_uops_0_bits_pwflag(fb_io_deq_bits_uops_0_bits_pwflag),
    .io_deq_bits_uops_0_bits_pflag_busy(fb_io_deq_bits_uops_0_bits_pflag_busy),
    .io_deq_bits_uops_0_bits_stale_pflag(fb_io_deq_bits_uops_0_bits_stale_pflag),
    .io_deq_bits_uops_0_bits_op1_sel(fb_io_deq_bits_uops_0_bits_op1_sel),
    .io_deq_bits_uops_0_bits_op2_sel(fb_io_deq_bits_uops_0_bits_op2_sel),
    .io_deq_bits_uops_0_bits_split_num(fb_io_deq_bits_uops_0_bits_split_num),
    .io_deq_bits_uops_0_bits_self_index(fb_io_deq_bits_uops_0_bits_self_index),
    .io_deq_bits_uops_0_bits_rob_inst_idx(fb_io_deq_bits_uops_0_bits_rob_inst_idx),
    .io_deq_bits_uops_0_bits_address_num(fb_io_deq_bits_uops_0_bits_address_num),
    .io_deq_bits_uops_0_bits_uopc(fb_io_deq_bits_uops_0_bits_uopc),
    .io_deq_bits_uops_0_bits_inst(fb_io_deq_bits_uops_0_bits_inst),
    .io_deq_bits_uops_0_bits_debug_inst(fb_io_deq_bits_uops_0_bits_debug_inst),
    .io_deq_bits_uops_0_bits_is_rvc(fb_io_deq_bits_uops_0_bits_is_rvc),
    .io_deq_bits_uops_0_bits_debug_pc(fb_io_deq_bits_uops_0_bits_debug_pc),
    .io_deq_bits_uops_0_bits_iq_type(fb_io_deq_bits_uops_0_bits_iq_type),
    .io_deq_bits_uops_0_bits_fu_code(fb_io_deq_bits_uops_0_bits_fu_code),
    .io_deq_bits_uops_0_bits_ctrl_br_type(fb_io_deq_bits_uops_0_bits_ctrl_br_type),
    .io_deq_bits_uops_0_bits_ctrl_op1_sel(fb_io_deq_bits_uops_0_bits_ctrl_op1_sel),
    .io_deq_bits_uops_0_bits_ctrl_op2_sel(fb_io_deq_bits_uops_0_bits_ctrl_op2_sel),
    .io_deq_bits_uops_0_bits_ctrl_imm_sel(fb_io_deq_bits_uops_0_bits_ctrl_imm_sel),
    .io_deq_bits_uops_0_bits_ctrl_op_fcn(fb_io_deq_bits_uops_0_bits_ctrl_op_fcn),
    .io_deq_bits_uops_0_bits_ctrl_fcn_dw(fb_io_deq_bits_uops_0_bits_ctrl_fcn_dw),
    .io_deq_bits_uops_0_bits_ctrl_csr_cmd(fb_io_deq_bits_uops_0_bits_ctrl_csr_cmd),
    .io_deq_bits_uops_0_bits_ctrl_is_load(fb_io_deq_bits_uops_0_bits_ctrl_is_load),
    .io_deq_bits_uops_0_bits_ctrl_is_sta(fb_io_deq_bits_uops_0_bits_ctrl_is_sta),
    .io_deq_bits_uops_0_bits_ctrl_is_std(fb_io_deq_bits_uops_0_bits_ctrl_is_std),
    .io_deq_bits_uops_0_bits_ctrl_op3_sel(fb_io_deq_bits_uops_0_bits_ctrl_op3_sel),
    .io_deq_bits_uops_0_bits_iw_state(fb_io_deq_bits_uops_0_bits_iw_state),
    .io_deq_bits_uops_0_bits_iw_p1_poisoned(fb_io_deq_bits_uops_0_bits_iw_p1_poisoned),
    .io_deq_bits_uops_0_bits_iw_p2_poisoned(fb_io_deq_bits_uops_0_bits_iw_p2_poisoned),
    .io_deq_bits_uops_0_bits_is_br(fb_io_deq_bits_uops_0_bits_is_br),
    .io_deq_bits_uops_0_bits_is_jalr(fb_io_deq_bits_uops_0_bits_is_jalr),
    .io_deq_bits_uops_0_bits_is_jal(fb_io_deq_bits_uops_0_bits_is_jal),
    .io_deq_bits_uops_0_bits_is_sfb(fb_io_deq_bits_uops_0_bits_is_sfb),
    .io_deq_bits_uops_0_bits_br_mask(fb_io_deq_bits_uops_0_bits_br_mask),
    .io_deq_bits_uops_0_bits_br_tag(fb_io_deq_bits_uops_0_bits_br_tag),
    .io_deq_bits_uops_0_bits_ftq_idx(fb_io_deq_bits_uops_0_bits_ftq_idx),
    .io_deq_bits_uops_0_bits_edge_inst(fb_io_deq_bits_uops_0_bits_edge_inst),
    .io_deq_bits_uops_0_bits_pc_lob(fb_io_deq_bits_uops_0_bits_pc_lob),
    .io_deq_bits_uops_0_bits_taken(fb_io_deq_bits_uops_0_bits_taken),
    .io_deq_bits_uops_0_bits_imm_packed(fb_io_deq_bits_uops_0_bits_imm_packed),
    .io_deq_bits_uops_0_bits_csr_addr(fb_io_deq_bits_uops_0_bits_csr_addr),
    .io_deq_bits_uops_0_bits_rob_idx(fb_io_deq_bits_uops_0_bits_rob_idx),
    .io_deq_bits_uops_0_bits_ldq_idx(fb_io_deq_bits_uops_0_bits_ldq_idx),
    .io_deq_bits_uops_0_bits_stq_idx(fb_io_deq_bits_uops_0_bits_stq_idx),
    .io_deq_bits_uops_0_bits_rxq_idx(fb_io_deq_bits_uops_0_bits_rxq_idx),
    .io_deq_bits_uops_0_bits_pdst(fb_io_deq_bits_uops_0_bits_pdst),
    .io_deq_bits_uops_0_bits_prs1(fb_io_deq_bits_uops_0_bits_prs1),
    .io_deq_bits_uops_0_bits_prs2(fb_io_deq_bits_uops_0_bits_prs2),
    .io_deq_bits_uops_0_bits_prs3(fb_io_deq_bits_uops_0_bits_prs3),
    .io_deq_bits_uops_0_bits_ppred(fb_io_deq_bits_uops_0_bits_ppred),
    .io_deq_bits_uops_0_bits_prs1_busy(fb_io_deq_bits_uops_0_bits_prs1_busy),
    .io_deq_bits_uops_0_bits_prs2_busy(fb_io_deq_bits_uops_0_bits_prs2_busy),
    .io_deq_bits_uops_0_bits_prs3_busy(fb_io_deq_bits_uops_0_bits_prs3_busy),
    .io_deq_bits_uops_0_bits_ppred_busy(fb_io_deq_bits_uops_0_bits_ppred_busy),
    .io_deq_bits_uops_0_bits_stale_pdst(fb_io_deq_bits_uops_0_bits_stale_pdst),
    .io_deq_bits_uops_0_bits_exception(fb_io_deq_bits_uops_0_bits_exception),
    .io_deq_bits_uops_0_bits_exc_cause(fb_io_deq_bits_uops_0_bits_exc_cause),
    .io_deq_bits_uops_0_bits_bypassable(fb_io_deq_bits_uops_0_bits_bypassable),
    .io_deq_bits_uops_0_bits_mem_cmd(fb_io_deq_bits_uops_0_bits_mem_cmd),
    .io_deq_bits_uops_0_bits_mem_size(fb_io_deq_bits_uops_0_bits_mem_size),
    .io_deq_bits_uops_0_bits_mem_signed(fb_io_deq_bits_uops_0_bits_mem_signed),
    .io_deq_bits_uops_0_bits_is_fence(fb_io_deq_bits_uops_0_bits_is_fence),
    .io_deq_bits_uops_0_bits_is_fencei(fb_io_deq_bits_uops_0_bits_is_fencei),
    .io_deq_bits_uops_0_bits_is_amo(fb_io_deq_bits_uops_0_bits_is_amo),
    .io_deq_bits_uops_0_bits_uses_ldq(fb_io_deq_bits_uops_0_bits_uses_ldq),
    .io_deq_bits_uops_0_bits_uses_stq(fb_io_deq_bits_uops_0_bits_uses_stq),
    .io_deq_bits_uops_0_bits_is_sys_pc2epc(fb_io_deq_bits_uops_0_bits_is_sys_pc2epc),
    .io_deq_bits_uops_0_bits_is_unique(fb_io_deq_bits_uops_0_bits_is_unique),
    .io_deq_bits_uops_0_bits_flush_on_commit(fb_io_deq_bits_uops_0_bits_flush_on_commit),
    .io_deq_bits_uops_0_bits_ldst_is_rs1(fb_io_deq_bits_uops_0_bits_ldst_is_rs1),
    .io_deq_bits_uops_0_bits_ldst(fb_io_deq_bits_uops_0_bits_ldst),
    .io_deq_bits_uops_0_bits_lrs1(fb_io_deq_bits_uops_0_bits_lrs1),
    .io_deq_bits_uops_0_bits_lrs2(fb_io_deq_bits_uops_0_bits_lrs2),
    .io_deq_bits_uops_0_bits_lrs3(fb_io_deq_bits_uops_0_bits_lrs3),
    .io_deq_bits_uops_0_bits_ldst_val(fb_io_deq_bits_uops_0_bits_ldst_val),
    .io_deq_bits_uops_0_bits_dst_rtype(fb_io_deq_bits_uops_0_bits_dst_rtype),
    .io_deq_bits_uops_0_bits_lrs1_rtype(fb_io_deq_bits_uops_0_bits_lrs1_rtype),
    .io_deq_bits_uops_0_bits_lrs2_rtype(fb_io_deq_bits_uops_0_bits_lrs2_rtype),
    .io_deq_bits_uops_0_bits_frs3_en(fb_io_deq_bits_uops_0_bits_frs3_en),
    .io_deq_bits_uops_0_bits_fp_val(fb_io_deq_bits_uops_0_bits_fp_val),
    .io_deq_bits_uops_0_bits_fp_single(fb_io_deq_bits_uops_0_bits_fp_single),
    .io_deq_bits_uops_0_bits_xcpt_pf_if(fb_io_deq_bits_uops_0_bits_xcpt_pf_if),
    .io_deq_bits_uops_0_bits_xcpt_ae_if(fb_io_deq_bits_uops_0_bits_xcpt_ae_if),
    .io_deq_bits_uops_0_bits_xcpt_ma_if(fb_io_deq_bits_uops_0_bits_xcpt_ma_if),
    .io_deq_bits_uops_0_bits_bp_debug_if(fb_io_deq_bits_uops_0_bits_bp_debug_if),
    .io_deq_bits_uops_0_bits_bp_xcpt_if(fb_io_deq_bits_uops_0_bits_bp_xcpt_if),
    .io_deq_bits_uops_0_bits_debug_fsrc(fb_io_deq_bits_uops_0_bits_debug_fsrc),
    .io_deq_bits_uops_0_bits_debug_tsrc(fb_io_deq_bits_uops_0_bits_debug_tsrc),
    .io_deq_bits_uops_1_valid(fb_io_deq_bits_uops_1_valid),
    .io_deq_bits_uops_1_bits_switch(fb_io_deq_bits_uops_1_bits_switch),
    .io_deq_bits_uops_1_bits_switch_off(fb_io_deq_bits_uops_1_bits_switch_off),
    .io_deq_bits_uops_1_bits_is_unicore(fb_io_deq_bits_uops_1_bits_is_unicore),
    .io_deq_bits_uops_1_bits_shift(fb_io_deq_bits_uops_1_bits_shift),
    .io_deq_bits_uops_1_bits_lrs3_rtype(fb_io_deq_bits_uops_1_bits_lrs3_rtype),
    .io_deq_bits_uops_1_bits_rflag(fb_io_deq_bits_uops_1_bits_rflag),
    .io_deq_bits_uops_1_bits_wflag(fb_io_deq_bits_uops_1_bits_wflag),
    .io_deq_bits_uops_1_bits_prflag(fb_io_deq_bits_uops_1_bits_prflag),
    .io_deq_bits_uops_1_bits_pwflag(fb_io_deq_bits_uops_1_bits_pwflag),
    .io_deq_bits_uops_1_bits_pflag_busy(fb_io_deq_bits_uops_1_bits_pflag_busy),
    .io_deq_bits_uops_1_bits_stale_pflag(fb_io_deq_bits_uops_1_bits_stale_pflag),
    .io_deq_bits_uops_1_bits_op1_sel(fb_io_deq_bits_uops_1_bits_op1_sel),
    .io_deq_bits_uops_1_bits_op2_sel(fb_io_deq_bits_uops_1_bits_op2_sel),
    .io_deq_bits_uops_1_bits_split_num(fb_io_deq_bits_uops_1_bits_split_num),
    .io_deq_bits_uops_1_bits_self_index(fb_io_deq_bits_uops_1_bits_self_index),
    .io_deq_bits_uops_1_bits_rob_inst_idx(fb_io_deq_bits_uops_1_bits_rob_inst_idx),
    .io_deq_bits_uops_1_bits_address_num(fb_io_deq_bits_uops_1_bits_address_num),
    .io_deq_bits_uops_1_bits_uopc(fb_io_deq_bits_uops_1_bits_uopc),
    .io_deq_bits_uops_1_bits_inst(fb_io_deq_bits_uops_1_bits_inst),
    .io_deq_bits_uops_1_bits_debug_inst(fb_io_deq_bits_uops_1_bits_debug_inst),
    .io_deq_bits_uops_1_bits_is_rvc(fb_io_deq_bits_uops_1_bits_is_rvc),
    .io_deq_bits_uops_1_bits_debug_pc(fb_io_deq_bits_uops_1_bits_debug_pc),
    .io_deq_bits_uops_1_bits_iq_type(fb_io_deq_bits_uops_1_bits_iq_type),
    .io_deq_bits_uops_1_bits_fu_code(fb_io_deq_bits_uops_1_bits_fu_code),
    .io_deq_bits_uops_1_bits_ctrl_br_type(fb_io_deq_bits_uops_1_bits_ctrl_br_type),
    .io_deq_bits_uops_1_bits_ctrl_op1_sel(fb_io_deq_bits_uops_1_bits_ctrl_op1_sel),
    .io_deq_bits_uops_1_bits_ctrl_op2_sel(fb_io_deq_bits_uops_1_bits_ctrl_op2_sel),
    .io_deq_bits_uops_1_bits_ctrl_imm_sel(fb_io_deq_bits_uops_1_bits_ctrl_imm_sel),
    .io_deq_bits_uops_1_bits_ctrl_op_fcn(fb_io_deq_bits_uops_1_bits_ctrl_op_fcn),
    .io_deq_bits_uops_1_bits_ctrl_fcn_dw(fb_io_deq_bits_uops_1_bits_ctrl_fcn_dw),
    .io_deq_bits_uops_1_bits_ctrl_csr_cmd(fb_io_deq_bits_uops_1_bits_ctrl_csr_cmd),
    .io_deq_bits_uops_1_bits_ctrl_is_load(fb_io_deq_bits_uops_1_bits_ctrl_is_load),
    .io_deq_bits_uops_1_bits_ctrl_is_sta(fb_io_deq_bits_uops_1_bits_ctrl_is_sta),
    .io_deq_bits_uops_1_bits_ctrl_is_std(fb_io_deq_bits_uops_1_bits_ctrl_is_std),
    .io_deq_bits_uops_1_bits_ctrl_op3_sel(fb_io_deq_bits_uops_1_bits_ctrl_op3_sel),
    .io_deq_bits_uops_1_bits_iw_state(fb_io_deq_bits_uops_1_bits_iw_state),
    .io_deq_bits_uops_1_bits_iw_p1_poisoned(fb_io_deq_bits_uops_1_bits_iw_p1_poisoned),
    .io_deq_bits_uops_1_bits_iw_p2_poisoned(fb_io_deq_bits_uops_1_bits_iw_p2_poisoned),
    .io_deq_bits_uops_1_bits_is_br(fb_io_deq_bits_uops_1_bits_is_br),
    .io_deq_bits_uops_1_bits_is_jalr(fb_io_deq_bits_uops_1_bits_is_jalr),
    .io_deq_bits_uops_1_bits_is_jal(fb_io_deq_bits_uops_1_bits_is_jal),
    .io_deq_bits_uops_1_bits_is_sfb(fb_io_deq_bits_uops_1_bits_is_sfb),
    .io_deq_bits_uops_1_bits_br_mask(fb_io_deq_bits_uops_1_bits_br_mask),
    .io_deq_bits_uops_1_bits_br_tag(fb_io_deq_bits_uops_1_bits_br_tag),
    .io_deq_bits_uops_1_bits_ftq_idx(fb_io_deq_bits_uops_1_bits_ftq_idx),
    .io_deq_bits_uops_1_bits_edge_inst(fb_io_deq_bits_uops_1_bits_edge_inst),
    .io_deq_bits_uops_1_bits_pc_lob(fb_io_deq_bits_uops_1_bits_pc_lob),
    .io_deq_bits_uops_1_bits_taken(fb_io_deq_bits_uops_1_bits_taken),
    .io_deq_bits_uops_1_bits_imm_packed(fb_io_deq_bits_uops_1_bits_imm_packed),
    .io_deq_bits_uops_1_bits_csr_addr(fb_io_deq_bits_uops_1_bits_csr_addr),
    .io_deq_bits_uops_1_bits_rob_idx(fb_io_deq_bits_uops_1_bits_rob_idx),
    .io_deq_bits_uops_1_bits_ldq_idx(fb_io_deq_bits_uops_1_bits_ldq_idx),
    .io_deq_bits_uops_1_bits_stq_idx(fb_io_deq_bits_uops_1_bits_stq_idx),
    .io_deq_bits_uops_1_bits_rxq_idx(fb_io_deq_bits_uops_1_bits_rxq_idx),
    .io_deq_bits_uops_1_bits_pdst(fb_io_deq_bits_uops_1_bits_pdst),
    .io_deq_bits_uops_1_bits_prs1(fb_io_deq_bits_uops_1_bits_prs1),
    .io_deq_bits_uops_1_bits_prs2(fb_io_deq_bits_uops_1_bits_prs2),
    .io_deq_bits_uops_1_bits_prs3(fb_io_deq_bits_uops_1_bits_prs3),
    .io_deq_bits_uops_1_bits_ppred(fb_io_deq_bits_uops_1_bits_ppred),
    .io_deq_bits_uops_1_bits_prs1_busy(fb_io_deq_bits_uops_1_bits_prs1_busy),
    .io_deq_bits_uops_1_bits_prs2_busy(fb_io_deq_bits_uops_1_bits_prs2_busy),
    .io_deq_bits_uops_1_bits_prs3_busy(fb_io_deq_bits_uops_1_bits_prs3_busy),
    .io_deq_bits_uops_1_bits_ppred_busy(fb_io_deq_bits_uops_1_bits_ppred_busy),
    .io_deq_bits_uops_1_bits_stale_pdst(fb_io_deq_bits_uops_1_bits_stale_pdst),
    .io_deq_bits_uops_1_bits_exception(fb_io_deq_bits_uops_1_bits_exception),
    .io_deq_bits_uops_1_bits_exc_cause(fb_io_deq_bits_uops_1_bits_exc_cause),
    .io_deq_bits_uops_1_bits_bypassable(fb_io_deq_bits_uops_1_bits_bypassable),
    .io_deq_bits_uops_1_bits_mem_cmd(fb_io_deq_bits_uops_1_bits_mem_cmd),
    .io_deq_bits_uops_1_bits_mem_size(fb_io_deq_bits_uops_1_bits_mem_size),
    .io_deq_bits_uops_1_bits_mem_signed(fb_io_deq_bits_uops_1_bits_mem_signed),
    .io_deq_bits_uops_1_bits_is_fence(fb_io_deq_bits_uops_1_bits_is_fence),
    .io_deq_bits_uops_1_bits_is_fencei(fb_io_deq_bits_uops_1_bits_is_fencei),
    .io_deq_bits_uops_1_bits_is_amo(fb_io_deq_bits_uops_1_bits_is_amo),
    .io_deq_bits_uops_1_bits_uses_ldq(fb_io_deq_bits_uops_1_bits_uses_ldq),
    .io_deq_bits_uops_1_bits_uses_stq(fb_io_deq_bits_uops_1_bits_uses_stq),
    .io_deq_bits_uops_1_bits_is_sys_pc2epc(fb_io_deq_bits_uops_1_bits_is_sys_pc2epc),
    .io_deq_bits_uops_1_bits_is_unique(fb_io_deq_bits_uops_1_bits_is_unique),
    .io_deq_bits_uops_1_bits_flush_on_commit(fb_io_deq_bits_uops_1_bits_flush_on_commit),
    .io_deq_bits_uops_1_bits_ldst_is_rs1(fb_io_deq_bits_uops_1_bits_ldst_is_rs1),
    .io_deq_bits_uops_1_bits_ldst(fb_io_deq_bits_uops_1_bits_ldst),
    .io_deq_bits_uops_1_bits_lrs1(fb_io_deq_bits_uops_1_bits_lrs1),
    .io_deq_bits_uops_1_bits_lrs2(fb_io_deq_bits_uops_1_bits_lrs2),
    .io_deq_bits_uops_1_bits_lrs3(fb_io_deq_bits_uops_1_bits_lrs3),
    .io_deq_bits_uops_1_bits_ldst_val(fb_io_deq_bits_uops_1_bits_ldst_val),
    .io_deq_bits_uops_1_bits_dst_rtype(fb_io_deq_bits_uops_1_bits_dst_rtype),
    .io_deq_bits_uops_1_bits_lrs1_rtype(fb_io_deq_bits_uops_1_bits_lrs1_rtype),
    .io_deq_bits_uops_1_bits_lrs2_rtype(fb_io_deq_bits_uops_1_bits_lrs2_rtype),
    .io_deq_bits_uops_1_bits_frs3_en(fb_io_deq_bits_uops_1_bits_frs3_en),
    .io_deq_bits_uops_1_bits_fp_val(fb_io_deq_bits_uops_1_bits_fp_val),
    .io_deq_bits_uops_1_bits_fp_single(fb_io_deq_bits_uops_1_bits_fp_single),
    .io_deq_bits_uops_1_bits_xcpt_pf_if(fb_io_deq_bits_uops_1_bits_xcpt_pf_if),
    .io_deq_bits_uops_1_bits_xcpt_ae_if(fb_io_deq_bits_uops_1_bits_xcpt_ae_if),
    .io_deq_bits_uops_1_bits_xcpt_ma_if(fb_io_deq_bits_uops_1_bits_xcpt_ma_if),
    .io_deq_bits_uops_1_bits_bp_debug_if(fb_io_deq_bits_uops_1_bits_bp_debug_if),
    .io_deq_bits_uops_1_bits_bp_xcpt_if(fb_io_deq_bits_uops_1_bits_bp_xcpt_if),
    .io_deq_bits_uops_1_bits_debug_fsrc(fb_io_deq_bits_uops_1_bits_debug_fsrc),
    .io_deq_bits_uops_1_bits_debug_tsrc(fb_io_deq_bits_uops_1_bits_debug_tsrc),
    .io_clear(fb_io_clear)
  );
  FetchTargetQueue ftq ( // @[frontend.scala 876:19]
    .clock(ftq_clock),
    .reset(ftq_reset),
    .io_enq_ready(ftq_io_enq_ready),
    .io_enq_valid(ftq_io_enq_valid),
    .io_enq_bits_pc(ftq_io_enq_bits_pc),
    .io_enq_bits_next_pc(ftq_io_enq_bits_next_pc),
    .io_enq_bits_edge_inst_0(ftq_io_enq_bits_edge_inst_0),
    .io_enq_bits_insts_0(ftq_io_enq_bits_insts_0),
    .io_enq_bits_insts_1(ftq_io_enq_bits_insts_1),
    .io_enq_bits_insts_2(ftq_io_enq_bits_insts_2),
    .io_enq_bits_insts_3(ftq_io_enq_bits_insts_3),
    .io_enq_bits_exp_insts_0(ftq_io_enq_bits_exp_insts_0),
    .io_enq_bits_exp_insts_1(ftq_io_enq_bits_exp_insts_1),
    .io_enq_bits_exp_insts_2(ftq_io_enq_bits_exp_insts_2),
    .io_enq_bits_exp_insts_3(ftq_io_enq_bits_exp_insts_3),
    .io_enq_bits_sfbs_0(ftq_io_enq_bits_sfbs_0),
    .io_enq_bits_sfbs_1(ftq_io_enq_bits_sfbs_1),
    .io_enq_bits_sfbs_2(ftq_io_enq_bits_sfbs_2),
    .io_enq_bits_sfbs_3(ftq_io_enq_bits_sfbs_3),
    .io_enq_bits_sfb_masks_0(ftq_io_enq_bits_sfb_masks_0),
    .io_enq_bits_sfb_masks_1(ftq_io_enq_bits_sfb_masks_1),
    .io_enq_bits_sfb_masks_2(ftq_io_enq_bits_sfb_masks_2),
    .io_enq_bits_sfb_masks_3(ftq_io_enq_bits_sfb_masks_3),
    .io_enq_bits_sfb_dests_0(ftq_io_enq_bits_sfb_dests_0),
    .io_enq_bits_sfb_dests_1(ftq_io_enq_bits_sfb_dests_1),
    .io_enq_bits_sfb_dests_2(ftq_io_enq_bits_sfb_dests_2),
    .io_enq_bits_sfb_dests_3(ftq_io_enq_bits_sfb_dests_3),
    .io_enq_bits_shadowable_mask_0(ftq_io_enq_bits_shadowable_mask_0),
    .io_enq_bits_shadowable_mask_1(ftq_io_enq_bits_shadowable_mask_1),
    .io_enq_bits_shadowable_mask_2(ftq_io_enq_bits_shadowable_mask_2),
    .io_enq_bits_shadowable_mask_3(ftq_io_enq_bits_shadowable_mask_3),
    .io_enq_bits_shadowed_mask_0(ftq_io_enq_bits_shadowed_mask_0),
    .io_enq_bits_shadowed_mask_1(ftq_io_enq_bits_shadowed_mask_1),
    .io_enq_bits_shadowed_mask_2(ftq_io_enq_bits_shadowed_mask_2),
    .io_enq_bits_shadowed_mask_3(ftq_io_enq_bits_shadowed_mask_3),
    .io_enq_bits_cfi_idx_valid(ftq_io_enq_bits_cfi_idx_valid),
    .io_enq_bits_cfi_idx_bits(ftq_io_enq_bits_cfi_idx_bits),
    .io_enq_bits_cfi_type(ftq_io_enq_bits_cfi_type),
    .io_enq_bits_cfi_is_call(ftq_io_enq_bits_cfi_is_call),
    .io_enq_bits_cfi_is_ret(ftq_io_enq_bits_cfi_is_ret),
    .io_enq_bits_cfi_npc_plus4(ftq_io_enq_bits_cfi_npc_plus4),
    .io_enq_bits_ras_top(ftq_io_enq_bits_ras_top),
    .io_enq_bits_ftq_idx(ftq_io_enq_bits_ftq_idx),
    .io_enq_bits_mask(ftq_io_enq_bits_mask),
    .io_enq_bits_br_mask(ftq_io_enq_bits_br_mask),
    .io_enq_bits_ghist_old_history(ftq_io_enq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken(ftq_io_enq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken(ftq_io_enq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken(ftq_io_enq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx(ftq_io_enq_bits_ghist_ras_idx),
    .io_enq_bits_lhist_0(ftq_io_enq_bits_lhist_0),
    .io_enq_bits_xcpt_pf_if(ftq_io_enq_bits_xcpt_pf_if),
    .io_enq_bits_xcpt_ae_if(ftq_io_enq_bits_xcpt_ae_if),
    .io_enq_bits_bp_debug_if_oh_0(ftq_io_enq_bits_bp_debug_if_oh_0),
    .io_enq_bits_bp_debug_if_oh_1(ftq_io_enq_bits_bp_debug_if_oh_1),
    .io_enq_bits_bp_debug_if_oh_2(ftq_io_enq_bits_bp_debug_if_oh_2),
    .io_enq_bits_bp_debug_if_oh_3(ftq_io_enq_bits_bp_debug_if_oh_3),
    .io_enq_bits_bp_xcpt_if_oh_0(ftq_io_enq_bits_bp_xcpt_if_oh_0),
    .io_enq_bits_bp_xcpt_if_oh_1(ftq_io_enq_bits_bp_xcpt_if_oh_1),
    .io_enq_bits_bp_xcpt_if_oh_2(ftq_io_enq_bits_bp_xcpt_if_oh_2),
    .io_enq_bits_bp_xcpt_if_oh_3(ftq_io_enq_bits_bp_xcpt_if_oh_3),
    .io_enq_bits_end_half_valid(ftq_io_enq_bits_end_half_valid),
    .io_enq_bits_end_half_bits(ftq_io_enq_bits_end_half_bits),
    .io_enq_bits_bpd_meta_0(ftq_io_enq_bits_bpd_meta_0),
    .io_enq_bits_fsrc(ftq_io_enq_bits_fsrc),
    .io_enq_bits_tsrc(ftq_io_enq_bits_tsrc),
    .io_enq_idx(ftq_io_enq_idx),
    .io_deq_valid(ftq_io_deq_valid),
    .io_deq_bits(ftq_io_deq_bits),
    .io_get_ftq_pc_0_ftq_idx(ftq_io_get_ftq_pc_0_ftq_idx),
    .io_get_ftq_pc_0_entry_cfi_idx_valid(ftq_io_get_ftq_pc_0_entry_cfi_idx_valid),
    .io_get_ftq_pc_0_entry_cfi_idx_bits(ftq_io_get_ftq_pc_0_entry_cfi_idx_bits),
    .io_get_ftq_pc_0_entry_cfi_taken(ftq_io_get_ftq_pc_0_entry_cfi_taken),
    .io_get_ftq_pc_0_entry_cfi_mispredicted(ftq_io_get_ftq_pc_0_entry_cfi_mispredicted),
    .io_get_ftq_pc_0_entry_cfi_type(ftq_io_get_ftq_pc_0_entry_cfi_type),
    .io_get_ftq_pc_0_entry_br_mask(ftq_io_get_ftq_pc_0_entry_br_mask),
    .io_get_ftq_pc_0_entry_cfi_is_call(ftq_io_get_ftq_pc_0_entry_cfi_is_call),
    .io_get_ftq_pc_0_entry_cfi_is_ret(ftq_io_get_ftq_pc_0_entry_cfi_is_ret),
    .io_get_ftq_pc_0_entry_cfi_npc_plus4(ftq_io_get_ftq_pc_0_entry_cfi_npc_plus4),
    .io_get_ftq_pc_0_entry_ras_top(ftq_io_get_ftq_pc_0_entry_ras_top),
    .io_get_ftq_pc_0_entry_ras_idx(ftq_io_get_ftq_pc_0_entry_ras_idx),
    .io_get_ftq_pc_0_entry_start_bank(ftq_io_get_ftq_pc_0_entry_start_bank),
    .io_get_ftq_pc_0_ghist_old_history(ftq_io_get_ftq_pc_0_ghist_old_history),
    .io_get_ftq_pc_0_ghist_current_saw_branch_not_taken(ftq_io_get_ftq_pc_0_ghist_current_saw_branch_not_taken),
    .io_get_ftq_pc_0_ghist_new_saw_branch_not_taken(ftq_io_get_ftq_pc_0_ghist_new_saw_branch_not_taken),
    .io_get_ftq_pc_0_ghist_new_saw_branch_taken(ftq_io_get_ftq_pc_0_ghist_new_saw_branch_taken),
    .io_get_ftq_pc_0_ghist_ras_idx(ftq_io_get_ftq_pc_0_ghist_ras_idx),
    .io_get_ftq_pc_0_pc(ftq_io_get_ftq_pc_0_pc),
    .io_get_ftq_pc_0_com_pc(ftq_io_get_ftq_pc_0_com_pc),
    .io_get_ftq_pc_0_next_val(ftq_io_get_ftq_pc_0_next_val),
    .io_get_ftq_pc_0_next_pc(ftq_io_get_ftq_pc_0_next_pc),
    .io_get_ftq_pc_1_ftq_idx(ftq_io_get_ftq_pc_1_ftq_idx),
    .io_get_ftq_pc_1_entry_cfi_idx_valid(ftq_io_get_ftq_pc_1_entry_cfi_idx_valid),
    .io_get_ftq_pc_1_entry_cfi_idx_bits(ftq_io_get_ftq_pc_1_entry_cfi_idx_bits),
    .io_get_ftq_pc_1_entry_cfi_taken(ftq_io_get_ftq_pc_1_entry_cfi_taken),
    .io_get_ftq_pc_1_entry_cfi_mispredicted(ftq_io_get_ftq_pc_1_entry_cfi_mispredicted),
    .io_get_ftq_pc_1_entry_cfi_type(ftq_io_get_ftq_pc_1_entry_cfi_type),
    .io_get_ftq_pc_1_entry_br_mask(ftq_io_get_ftq_pc_1_entry_br_mask),
    .io_get_ftq_pc_1_entry_cfi_is_call(ftq_io_get_ftq_pc_1_entry_cfi_is_call),
    .io_get_ftq_pc_1_entry_cfi_is_ret(ftq_io_get_ftq_pc_1_entry_cfi_is_ret),
    .io_get_ftq_pc_1_entry_cfi_npc_plus4(ftq_io_get_ftq_pc_1_entry_cfi_npc_plus4),
    .io_get_ftq_pc_1_entry_ras_top(ftq_io_get_ftq_pc_1_entry_ras_top),
    .io_get_ftq_pc_1_entry_ras_idx(ftq_io_get_ftq_pc_1_entry_ras_idx),
    .io_get_ftq_pc_1_entry_start_bank(ftq_io_get_ftq_pc_1_entry_start_bank),
    .io_get_ftq_pc_1_ghist_old_history(ftq_io_get_ftq_pc_1_ghist_old_history),
    .io_get_ftq_pc_1_ghist_current_saw_branch_not_taken(ftq_io_get_ftq_pc_1_ghist_current_saw_branch_not_taken),
    .io_get_ftq_pc_1_ghist_new_saw_branch_not_taken(ftq_io_get_ftq_pc_1_ghist_new_saw_branch_not_taken),
    .io_get_ftq_pc_1_ghist_new_saw_branch_taken(ftq_io_get_ftq_pc_1_ghist_new_saw_branch_taken),
    .io_get_ftq_pc_1_ghist_ras_idx(ftq_io_get_ftq_pc_1_ghist_ras_idx),
    .io_get_ftq_pc_1_pc(ftq_io_get_ftq_pc_1_pc),
    .io_get_ftq_pc_1_com_pc(ftq_io_get_ftq_pc_1_com_pc),
    .io_get_ftq_pc_1_next_val(ftq_io_get_ftq_pc_1_next_val),
    .io_get_ftq_pc_1_next_pc(ftq_io_get_ftq_pc_1_next_pc),
    .io_get_ftq_pc_2_ftq_idx(ftq_io_get_ftq_pc_2_ftq_idx),
    .io_get_ftq_pc_2_entry_cfi_idx_valid(ftq_io_get_ftq_pc_2_entry_cfi_idx_valid),
    .io_get_ftq_pc_2_entry_cfi_idx_bits(ftq_io_get_ftq_pc_2_entry_cfi_idx_bits),
    .io_get_ftq_pc_2_entry_cfi_taken(ftq_io_get_ftq_pc_2_entry_cfi_taken),
    .io_get_ftq_pc_2_entry_cfi_mispredicted(ftq_io_get_ftq_pc_2_entry_cfi_mispredicted),
    .io_get_ftq_pc_2_entry_cfi_type(ftq_io_get_ftq_pc_2_entry_cfi_type),
    .io_get_ftq_pc_2_entry_br_mask(ftq_io_get_ftq_pc_2_entry_br_mask),
    .io_get_ftq_pc_2_entry_cfi_is_call(ftq_io_get_ftq_pc_2_entry_cfi_is_call),
    .io_get_ftq_pc_2_entry_cfi_is_ret(ftq_io_get_ftq_pc_2_entry_cfi_is_ret),
    .io_get_ftq_pc_2_entry_cfi_npc_plus4(ftq_io_get_ftq_pc_2_entry_cfi_npc_plus4),
    .io_get_ftq_pc_2_entry_ras_top(ftq_io_get_ftq_pc_2_entry_ras_top),
    .io_get_ftq_pc_2_entry_ras_idx(ftq_io_get_ftq_pc_2_entry_ras_idx),
    .io_get_ftq_pc_2_entry_start_bank(ftq_io_get_ftq_pc_2_entry_start_bank),
    .io_get_ftq_pc_2_ghist_old_history(ftq_io_get_ftq_pc_2_ghist_old_history),
    .io_get_ftq_pc_2_ghist_current_saw_branch_not_taken(ftq_io_get_ftq_pc_2_ghist_current_saw_branch_not_taken),
    .io_get_ftq_pc_2_ghist_new_saw_branch_not_taken(ftq_io_get_ftq_pc_2_ghist_new_saw_branch_not_taken),
    .io_get_ftq_pc_2_ghist_new_saw_branch_taken(ftq_io_get_ftq_pc_2_ghist_new_saw_branch_taken),
    .io_get_ftq_pc_2_ghist_ras_idx(ftq_io_get_ftq_pc_2_ghist_ras_idx),
    .io_get_ftq_pc_2_pc(ftq_io_get_ftq_pc_2_pc),
    .io_get_ftq_pc_2_com_pc(ftq_io_get_ftq_pc_2_com_pc),
    .io_get_ftq_pc_2_next_val(ftq_io_get_ftq_pc_2_next_val),
    .io_get_ftq_pc_2_next_pc(ftq_io_get_ftq_pc_2_next_pc),
    .io_get_ftq_pc_3_ftq_idx(ftq_io_get_ftq_pc_3_ftq_idx),
    .io_get_ftq_pc_3_entry_cfi_idx_valid(ftq_io_get_ftq_pc_3_entry_cfi_idx_valid),
    .io_get_ftq_pc_3_entry_cfi_idx_bits(ftq_io_get_ftq_pc_3_entry_cfi_idx_bits),
    .io_get_ftq_pc_3_entry_cfi_taken(ftq_io_get_ftq_pc_3_entry_cfi_taken),
    .io_get_ftq_pc_3_entry_cfi_mispredicted(ftq_io_get_ftq_pc_3_entry_cfi_mispredicted),
    .io_get_ftq_pc_3_entry_cfi_type(ftq_io_get_ftq_pc_3_entry_cfi_type),
    .io_get_ftq_pc_3_entry_br_mask(ftq_io_get_ftq_pc_3_entry_br_mask),
    .io_get_ftq_pc_3_entry_cfi_is_call(ftq_io_get_ftq_pc_3_entry_cfi_is_call),
    .io_get_ftq_pc_3_entry_cfi_is_ret(ftq_io_get_ftq_pc_3_entry_cfi_is_ret),
    .io_get_ftq_pc_3_entry_cfi_npc_plus4(ftq_io_get_ftq_pc_3_entry_cfi_npc_plus4),
    .io_get_ftq_pc_3_entry_ras_top(ftq_io_get_ftq_pc_3_entry_ras_top),
    .io_get_ftq_pc_3_entry_ras_idx(ftq_io_get_ftq_pc_3_entry_ras_idx),
    .io_get_ftq_pc_3_entry_start_bank(ftq_io_get_ftq_pc_3_entry_start_bank),
    .io_get_ftq_pc_3_ghist_old_history(ftq_io_get_ftq_pc_3_ghist_old_history),
    .io_get_ftq_pc_3_ghist_current_saw_branch_not_taken(ftq_io_get_ftq_pc_3_ghist_current_saw_branch_not_taken),
    .io_get_ftq_pc_3_ghist_new_saw_branch_not_taken(ftq_io_get_ftq_pc_3_ghist_new_saw_branch_not_taken),
    .io_get_ftq_pc_3_ghist_new_saw_branch_taken(ftq_io_get_ftq_pc_3_ghist_new_saw_branch_taken),
    .io_get_ftq_pc_3_ghist_ras_idx(ftq_io_get_ftq_pc_3_ghist_ras_idx),
    .io_get_ftq_pc_3_pc(ftq_io_get_ftq_pc_3_pc),
    .io_get_ftq_pc_3_com_pc(ftq_io_get_ftq_pc_3_com_pc),
    .io_get_ftq_pc_3_next_val(ftq_io_get_ftq_pc_3_next_val),
    .io_get_ftq_pc_3_next_pc(ftq_io_get_ftq_pc_3_next_pc),
    .io_debug_ftq_idx_0(ftq_io_debug_ftq_idx_0),
    .io_debug_ftq_idx_1(ftq_io_debug_ftq_idx_1),
    .io_debug_fetch_pc_0(ftq_io_debug_fetch_pc_0),
    .io_debug_fetch_pc_1(ftq_io_debug_fetch_pc_1),
    .io_redirect_valid(ftq_io_redirect_valid),
    .io_redirect_bits(ftq_io_redirect_bits),
    .io_brupdate_b1_resolve_mask(ftq_io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask(ftq_io_brupdate_b1_mispredict_mask),
    .io_brupdate_b2_uop_switch(ftq_io_brupdate_b2_uop_switch),
    .io_brupdate_b2_uop_switch_off(ftq_io_brupdate_b2_uop_switch_off),
    .io_brupdate_b2_uop_is_unicore(ftq_io_brupdate_b2_uop_is_unicore),
    .io_brupdate_b2_uop_shift(ftq_io_brupdate_b2_uop_shift),
    .io_brupdate_b2_uop_lrs3_rtype(ftq_io_brupdate_b2_uop_lrs3_rtype),
    .io_brupdate_b2_uop_rflag(ftq_io_brupdate_b2_uop_rflag),
    .io_brupdate_b2_uop_wflag(ftq_io_brupdate_b2_uop_wflag),
    .io_brupdate_b2_uop_prflag(ftq_io_brupdate_b2_uop_prflag),
    .io_brupdate_b2_uop_pwflag(ftq_io_brupdate_b2_uop_pwflag),
    .io_brupdate_b2_uop_pflag_busy(ftq_io_brupdate_b2_uop_pflag_busy),
    .io_brupdate_b2_uop_stale_pflag(ftq_io_brupdate_b2_uop_stale_pflag),
    .io_brupdate_b2_uop_op1_sel(ftq_io_brupdate_b2_uop_op1_sel),
    .io_brupdate_b2_uop_op2_sel(ftq_io_brupdate_b2_uop_op2_sel),
    .io_brupdate_b2_uop_split_num(ftq_io_brupdate_b2_uop_split_num),
    .io_brupdate_b2_uop_self_index(ftq_io_brupdate_b2_uop_self_index),
    .io_brupdate_b2_uop_rob_inst_idx(ftq_io_brupdate_b2_uop_rob_inst_idx),
    .io_brupdate_b2_uop_address_num(ftq_io_brupdate_b2_uop_address_num),
    .io_brupdate_b2_uop_uopc(ftq_io_brupdate_b2_uop_uopc),
    .io_brupdate_b2_uop_inst(ftq_io_brupdate_b2_uop_inst),
    .io_brupdate_b2_uop_debug_inst(ftq_io_brupdate_b2_uop_debug_inst),
    .io_brupdate_b2_uop_is_rvc(ftq_io_brupdate_b2_uop_is_rvc),
    .io_brupdate_b2_uop_debug_pc(ftq_io_brupdate_b2_uop_debug_pc),
    .io_brupdate_b2_uop_iq_type(ftq_io_brupdate_b2_uop_iq_type),
    .io_brupdate_b2_uop_fu_code(ftq_io_brupdate_b2_uop_fu_code),
    .io_brupdate_b2_uop_ctrl_br_type(ftq_io_brupdate_b2_uop_ctrl_br_type),
    .io_brupdate_b2_uop_ctrl_op1_sel(ftq_io_brupdate_b2_uop_ctrl_op1_sel),
    .io_brupdate_b2_uop_ctrl_op2_sel(ftq_io_brupdate_b2_uop_ctrl_op2_sel),
    .io_brupdate_b2_uop_ctrl_imm_sel(ftq_io_brupdate_b2_uop_ctrl_imm_sel),
    .io_brupdate_b2_uop_ctrl_op_fcn(ftq_io_brupdate_b2_uop_ctrl_op_fcn),
    .io_brupdate_b2_uop_ctrl_fcn_dw(ftq_io_brupdate_b2_uop_ctrl_fcn_dw),
    .io_brupdate_b2_uop_ctrl_csr_cmd(ftq_io_brupdate_b2_uop_ctrl_csr_cmd),
    .io_brupdate_b2_uop_ctrl_is_load(ftq_io_brupdate_b2_uop_ctrl_is_load),
    .io_brupdate_b2_uop_ctrl_is_sta(ftq_io_brupdate_b2_uop_ctrl_is_sta),
    .io_brupdate_b2_uop_ctrl_is_std(ftq_io_brupdate_b2_uop_ctrl_is_std),
    .io_brupdate_b2_uop_ctrl_op3_sel(ftq_io_brupdate_b2_uop_ctrl_op3_sel),
    .io_brupdate_b2_uop_iw_state(ftq_io_brupdate_b2_uop_iw_state),
    .io_brupdate_b2_uop_iw_p1_poisoned(ftq_io_brupdate_b2_uop_iw_p1_poisoned),
    .io_brupdate_b2_uop_iw_p2_poisoned(ftq_io_brupdate_b2_uop_iw_p2_poisoned),
    .io_brupdate_b2_uop_is_br(ftq_io_brupdate_b2_uop_is_br),
    .io_brupdate_b2_uop_is_jalr(ftq_io_brupdate_b2_uop_is_jalr),
    .io_brupdate_b2_uop_is_jal(ftq_io_brupdate_b2_uop_is_jal),
    .io_brupdate_b2_uop_is_sfb(ftq_io_brupdate_b2_uop_is_sfb),
    .io_brupdate_b2_uop_br_mask(ftq_io_brupdate_b2_uop_br_mask),
    .io_brupdate_b2_uop_br_tag(ftq_io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_uop_ftq_idx(ftq_io_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_edge_inst(ftq_io_brupdate_b2_uop_edge_inst),
    .io_brupdate_b2_uop_pc_lob(ftq_io_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_uop_taken(ftq_io_brupdate_b2_uop_taken),
    .io_brupdate_b2_uop_imm_packed(ftq_io_brupdate_b2_uop_imm_packed),
    .io_brupdate_b2_uop_csr_addr(ftq_io_brupdate_b2_uop_csr_addr),
    .io_brupdate_b2_uop_rob_idx(ftq_io_brupdate_b2_uop_rob_idx),
    .io_brupdate_b2_uop_ldq_idx(ftq_io_brupdate_b2_uop_ldq_idx),
    .io_brupdate_b2_uop_stq_idx(ftq_io_brupdate_b2_uop_stq_idx),
    .io_brupdate_b2_uop_rxq_idx(ftq_io_brupdate_b2_uop_rxq_idx),
    .io_brupdate_b2_uop_pdst(ftq_io_brupdate_b2_uop_pdst),
    .io_brupdate_b2_uop_prs1(ftq_io_brupdate_b2_uop_prs1),
    .io_brupdate_b2_uop_prs2(ftq_io_brupdate_b2_uop_prs2),
    .io_brupdate_b2_uop_prs3(ftq_io_brupdate_b2_uop_prs3),
    .io_brupdate_b2_uop_ppred(ftq_io_brupdate_b2_uop_ppred),
    .io_brupdate_b2_uop_prs1_busy(ftq_io_brupdate_b2_uop_prs1_busy),
    .io_brupdate_b2_uop_prs2_busy(ftq_io_brupdate_b2_uop_prs2_busy),
    .io_brupdate_b2_uop_prs3_busy(ftq_io_brupdate_b2_uop_prs3_busy),
    .io_brupdate_b2_uop_ppred_busy(ftq_io_brupdate_b2_uop_ppred_busy),
    .io_brupdate_b2_uop_stale_pdst(ftq_io_brupdate_b2_uop_stale_pdst),
    .io_brupdate_b2_uop_exception(ftq_io_brupdate_b2_uop_exception),
    .io_brupdate_b2_uop_exc_cause(ftq_io_brupdate_b2_uop_exc_cause),
    .io_brupdate_b2_uop_bypassable(ftq_io_brupdate_b2_uop_bypassable),
    .io_brupdate_b2_uop_mem_cmd(ftq_io_brupdate_b2_uop_mem_cmd),
    .io_brupdate_b2_uop_mem_size(ftq_io_brupdate_b2_uop_mem_size),
    .io_brupdate_b2_uop_mem_signed(ftq_io_brupdate_b2_uop_mem_signed),
    .io_brupdate_b2_uop_is_fence(ftq_io_brupdate_b2_uop_is_fence),
    .io_brupdate_b2_uop_is_fencei(ftq_io_brupdate_b2_uop_is_fencei),
    .io_brupdate_b2_uop_is_amo(ftq_io_brupdate_b2_uop_is_amo),
    .io_brupdate_b2_uop_uses_ldq(ftq_io_brupdate_b2_uop_uses_ldq),
    .io_brupdate_b2_uop_uses_stq(ftq_io_brupdate_b2_uop_uses_stq),
    .io_brupdate_b2_uop_is_sys_pc2epc(ftq_io_brupdate_b2_uop_is_sys_pc2epc),
    .io_brupdate_b2_uop_is_unique(ftq_io_brupdate_b2_uop_is_unique),
    .io_brupdate_b2_uop_flush_on_commit(ftq_io_brupdate_b2_uop_flush_on_commit),
    .io_brupdate_b2_uop_ldst_is_rs1(ftq_io_brupdate_b2_uop_ldst_is_rs1),
    .io_brupdate_b2_uop_ldst(ftq_io_brupdate_b2_uop_ldst),
    .io_brupdate_b2_uop_lrs1(ftq_io_brupdate_b2_uop_lrs1),
    .io_brupdate_b2_uop_lrs2(ftq_io_brupdate_b2_uop_lrs2),
    .io_brupdate_b2_uop_lrs3(ftq_io_brupdate_b2_uop_lrs3),
    .io_brupdate_b2_uop_ldst_val(ftq_io_brupdate_b2_uop_ldst_val),
    .io_brupdate_b2_uop_dst_rtype(ftq_io_brupdate_b2_uop_dst_rtype),
    .io_brupdate_b2_uop_lrs1_rtype(ftq_io_brupdate_b2_uop_lrs1_rtype),
    .io_brupdate_b2_uop_lrs2_rtype(ftq_io_brupdate_b2_uop_lrs2_rtype),
    .io_brupdate_b2_uop_frs3_en(ftq_io_brupdate_b2_uop_frs3_en),
    .io_brupdate_b2_uop_fp_val(ftq_io_brupdate_b2_uop_fp_val),
    .io_brupdate_b2_uop_fp_single(ftq_io_brupdate_b2_uop_fp_single),
    .io_brupdate_b2_uop_xcpt_pf_if(ftq_io_brupdate_b2_uop_xcpt_pf_if),
    .io_brupdate_b2_uop_xcpt_ae_if(ftq_io_brupdate_b2_uop_xcpt_ae_if),
    .io_brupdate_b2_uop_xcpt_ma_if(ftq_io_brupdate_b2_uop_xcpt_ma_if),
    .io_brupdate_b2_uop_bp_debug_if(ftq_io_brupdate_b2_uop_bp_debug_if),
    .io_brupdate_b2_uop_bp_xcpt_if(ftq_io_brupdate_b2_uop_bp_xcpt_if),
    .io_brupdate_b2_uop_debug_fsrc(ftq_io_brupdate_b2_uop_debug_fsrc),
    .io_brupdate_b2_uop_debug_tsrc(ftq_io_brupdate_b2_uop_debug_tsrc),
    .io_brupdate_b2_valid(ftq_io_brupdate_b2_valid),
    .io_brupdate_b2_mispredict(ftq_io_brupdate_b2_mispredict),
    .io_brupdate_b2_taken(ftq_io_brupdate_b2_taken),
    .io_brupdate_b2_cfi_type(ftq_io_brupdate_b2_cfi_type),
    .io_brupdate_b2_pc_sel(ftq_io_brupdate_b2_pc_sel),
    .io_brupdate_b2_jalr_target(ftq_io_brupdate_b2_jalr_target),
    .io_brupdate_b2_target_offset(ftq_io_brupdate_b2_target_offset),
    .io_bpdupdate_valid(ftq_io_bpdupdate_valid),
    .io_bpdupdate_bits_is_mispredict_update(ftq_io_bpdupdate_bits_is_mispredict_update),
    .io_bpdupdate_bits_is_repair_update(ftq_io_bpdupdate_bits_is_repair_update),
    .io_bpdupdate_bits_btb_mispredicts(ftq_io_bpdupdate_bits_btb_mispredicts),
    .io_bpdupdate_bits_pc(ftq_io_bpdupdate_bits_pc),
    .io_bpdupdate_bits_br_mask(ftq_io_bpdupdate_bits_br_mask),
    .io_bpdupdate_bits_cfi_idx_valid(ftq_io_bpdupdate_bits_cfi_idx_valid),
    .io_bpdupdate_bits_cfi_idx_bits(ftq_io_bpdupdate_bits_cfi_idx_bits),
    .io_bpdupdate_bits_cfi_taken(ftq_io_bpdupdate_bits_cfi_taken),
    .io_bpdupdate_bits_cfi_mispredicted(ftq_io_bpdupdate_bits_cfi_mispredicted),
    .io_bpdupdate_bits_cfi_is_br(ftq_io_bpdupdate_bits_cfi_is_br),
    .io_bpdupdate_bits_cfi_is_jal(ftq_io_bpdupdate_bits_cfi_is_jal),
    .io_bpdupdate_bits_cfi_is_jalr(ftq_io_bpdupdate_bits_cfi_is_jalr),
    .io_bpdupdate_bits_ghist_old_history(ftq_io_bpdupdate_bits_ghist_old_history),
    .io_bpdupdate_bits_ghist_current_saw_branch_not_taken(ftq_io_bpdupdate_bits_ghist_current_saw_branch_not_taken),
    .io_bpdupdate_bits_ghist_new_saw_branch_not_taken(ftq_io_bpdupdate_bits_ghist_new_saw_branch_not_taken),
    .io_bpdupdate_bits_ghist_new_saw_branch_taken(ftq_io_bpdupdate_bits_ghist_new_saw_branch_taken),
    .io_bpdupdate_bits_ghist_ras_idx(ftq_io_bpdupdate_bits_ghist_ras_idx),
    .io_bpdupdate_bits_lhist_0(ftq_io_bpdupdate_bits_lhist_0),
    .io_bpdupdate_bits_target(ftq_io_bpdupdate_bits_target),
    .io_bpdupdate_bits_meta_0(ftq_io_bpdupdate_bits_meta_0),
    .io_ras_update(ftq_io_ras_update),
    .io_ras_update_idx(ftq_io_ras_update_idx),
    .io_ras_update_pc(ftq_io_ras_update_pc)
  );
  Arbiter_15 bpd_update_arbiter ( // @[frontend.scala 939:34]
    .clock(bpd_update_arbiter_clock),
    .reset(bpd_update_arbiter_reset),
    .io_in_0_ready(bpd_update_arbiter_io_in_0_ready),
    .io_in_0_valid(bpd_update_arbiter_io_in_0_valid),
    .io_in_0_bits_is_mispredict_update(bpd_update_arbiter_io_in_0_bits_is_mispredict_update),
    .io_in_0_bits_is_repair_update(bpd_update_arbiter_io_in_0_bits_is_repair_update),
    .io_in_0_bits_btb_mispredicts(bpd_update_arbiter_io_in_0_bits_btb_mispredicts),
    .io_in_0_bits_pc(bpd_update_arbiter_io_in_0_bits_pc),
    .io_in_0_bits_br_mask(bpd_update_arbiter_io_in_0_bits_br_mask),
    .io_in_0_bits_cfi_idx_valid(bpd_update_arbiter_io_in_0_bits_cfi_idx_valid),
    .io_in_0_bits_cfi_idx_bits(bpd_update_arbiter_io_in_0_bits_cfi_idx_bits),
    .io_in_0_bits_cfi_taken(bpd_update_arbiter_io_in_0_bits_cfi_taken),
    .io_in_0_bits_cfi_mispredicted(bpd_update_arbiter_io_in_0_bits_cfi_mispredicted),
    .io_in_0_bits_cfi_is_br(bpd_update_arbiter_io_in_0_bits_cfi_is_br),
    .io_in_0_bits_cfi_is_jal(bpd_update_arbiter_io_in_0_bits_cfi_is_jal),
    .io_in_0_bits_cfi_is_jalr(bpd_update_arbiter_io_in_0_bits_cfi_is_jalr),
    .io_in_0_bits_ghist_old_history(bpd_update_arbiter_io_in_0_bits_ghist_old_history),
    .io_in_0_bits_ghist_current_saw_branch_not_taken(bpd_update_arbiter_io_in_0_bits_ghist_current_saw_branch_not_taken)
      ,
    .io_in_0_bits_ghist_new_saw_branch_not_taken(bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_not_taken),
    .io_in_0_bits_ghist_new_saw_branch_taken(bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_taken),
    .io_in_0_bits_ghist_ras_idx(bpd_update_arbiter_io_in_0_bits_ghist_ras_idx),
    .io_in_0_bits_lhist_0(bpd_update_arbiter_io_in_0_bits_lhist_0),
    .io_in_0_bits_target(bpd_update_arbiter_io_in_0_bits_target),
    .io_in_0_bits_meta_0(bpd_update_arbiter_io_in_0_bits_meta_0),
    .io_in_1_ready(bpd_update_arbiter_io_in_1_ready),
    .io_in_1_valid(bpd_update_arbiter_io_in_1_valid),
    .io_in_1_bits_is_mispredict_update(bpd_update_arbiter_io_in_1_bits_is_mispredict_update),
    .io_in_1_bits_is_repair_update(bpd_update_arbiter_io_in_1_bits_is_repair_update),
    .io_in_1_bits_btb_mispredicts(bpd_update_arbiter_io_in_1_bits_btb_mispredicts),
    .io_in_1_bits_pc(bpd_update_arbiter_io_in_1_bits_pc),
    .io_in_1_bits_br_mask(bpd_update_arbiter_io_in_1_bits_br_mask),
    .io_in_1_bits_cfi_idx_valid(bpd_update_arbiter_io_in_1_bits_cfi_idx_valid),
    .io_in_1_bits_cfi_idx_bits(bpd_update_arbiter_io_in_1_bits_cfi_idx_bits),
    .io_in_1_bits_cfi_taken(bpd_update_arbiter_io_in_1_bits_cfi_taken),
    .io_in_1_bits_cfi_mispredicted(bpd_update_arbiter_io_in_1_bits_cfi_mispredicted),
    .io_in_1_bits_cfi_is_br(bpd_update_arbiter_io_in_1_bits_cfi_is_br),
    .io_in_1_bits_cfi_is_jal(bpd_update_arbiter_io_in_1_bits_cfi_is_jal),
    .io_in_1_bits_cfi_is_jalr(bpd_update_arbiter_io_in_1_bits_cfi_is_jalr),
    .io_in_1_bits_ghist_old_history(bpd_update_arbiter_io_in_1_bits_ghist_old_history),
    .io_in_1_bits_ghist_current_saw_branch_not_taken(bpd_update_arbiter_io_in_1_bits_ghist_current_saw_branch_not_taken)
      ,
    .io_in_1_bits_ghist_new_saw_branch_not_taken(bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_not_taken),
    .io_in_1_bits_ghist_new_saw_branch_taken(bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_taken),
    .io_in_1_bits_ghist_ras_idx(bpd_update_arbiter_io_in_1_bits_ghist_ras_idx),
    .io_in_1_bits_lhist_0(bpd_update_arbiter_io_in_1_bits_lhist_0),
    .io_in_1_bits_target(bpd_update_arbiter_io_in_1_bits_target),
    .io_in_1_bits_meta_0(bpd_update_arbiter_io_in_1_bits_meta_0),
    .io_out_ready(bpd_update_arbiter_io_out_ready),
    .io_out_valid(bpd_update_arbiter_io_out_valid),
    .io_out_bits_is_mispredict_update(bpd_update_arbiter_io_out_bits_is_mispredict_update),
    .io_out_bits_is_repair_update(bpd_update_arbiter_io_out_bits_is_repair_update),
    .io_out_bits_btb_mispredicts(bpd_update_arbiter_io_out_bits_btb_mispredicts),
    .io_out_bits_pc(bpd_update_arbiter_io_out_bits_pc),
    .io_out_bits_br_mask(bpd_update_arbiter_io_out_bits_br_mask),
    .io_out_bits_cfi_idx_valid(bpd_update_arbiter_io_out_bits_cfi_idx_valid),
    .io_out_bits_cfi_idx_bits(bpd_update_arbiter_io_out_bits_cfi_idx_bits),
    .io_out_bits_cfi_taken(bpd_update_arbiter_io_out_bits_cfi_taken),
    .io_out_bits_cfi_mispredicted(bpd_update_arbiter_io_out_bits_cfi_mispredicted),
    .io_out_bits_cfi_is_br(bpd_update_arbiter_io_out_bits_cfi_is_br),
    .io_out_bits_cfi_is_jal(bpd_update_arbiter_io_out_bits_cfi_is_jal),
    .io_out_bits_cfi_is_jalr(bpd_update_arbiter_io_out_bits_cfi_is_jalr),
    .io_out_bits_ghist_old_history(bpd_update_arbiter_io_out_bits_ghist_old_history),
    .io_out_bits_ghist_current_saw_branch_not_taken(bpd_update_arbiter_io_out_bits_ghist_current_saw_branch_not_taken),
    .io_out_bits_ghist_new_saw_branch_not_taken(bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_not_taken),
    .io_out_bits_ghist_new_saw_branch_taken(bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_taken),
    .io_out_bits_ghist_ras_idx(bpd_update_arbiter_io_out_bits_ghist_ras_idx),
    .io_out_bits_lhist_0(bpd_update_arbiter_io_out_bits_lhist_0),
    .io_out_bits_target(bpd_update_arbiter_io_out_bits_target),
    .io_out_bits_meta_0(bpd_update_arbiter_io_out_bits_meta_0),
    .io_chosen(bpd_update_arbiter_io_chosen)
  );
  assign auto_icache_master_out_a_valid = icache_auto_master_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_opcode = icache_auto_master_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_param = icache_auto_master_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_size = icache_auto_master_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_source = icache_auto_master_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_address = icache_auto_master_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_mask = icache_auto_master_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_data = icache_auto_master_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_corrupt = icache_auto_master_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_d_ready = icache_auto_master_out_d_ready; // @[LazyModule.scala 311:12]
  assign io_cpu_fetchpacket_valid = fb_io_deq_valid; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_valid = fb_io_deq_bits_uops_0_valid; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_switch = fb_io_deq_bits_uops_0_bits_switch; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_switch_off = fb_io_deq_bits_uops_0_bits_switch_off; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_unicore = fb_io_deq_bits_uops_0_bits_is_unicore; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_shift = fb_io_deq_bits_uops_0_bits_shift; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_lrs3_rtype = fb_io_deq_bits_uops_0_bits_lrs3_rtype; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_rflag = fb_io_deq_bits_uops_0_bits_rflag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_wflag = fb_io_deq_bits_uops_0_bits_wflag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prflag = fb_io_deq_bits_uops_0_bits_prflag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_pwflag = fb_io_deq_bits_uops_0_bits_pwflag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_pflag_busy = fb_io_deq_bits_uops_0_bits_pflag_busy; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_stale_pflag = fb_io_deq_bits_uops_0_bits_stale_pflag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_op1_sel = fb_io_deq_bits_uops_0_bits_op1_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_op2_sel = fb_io_deq_bits_uops_0_bits_op2_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_split_num = fb_io_deq_bits_uops_0_bits_split_num; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_self_index = fb_io_deq_bits_uops_0_bits_self_index; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_rob_inst_idx = fb_io_deq_bits_uops_0_bits_rob_inst_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_address_num = fb_io_deq_bits_uops_0_bits_address_num; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_uopc = fb_io_deq_bits_uops_0_bits_uopc; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_inst = fb_io_deq_bits_uops_0_bits_inst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_debug_inst = fb_io_deq_bits_uops_0_bits_debug_inst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_rvc = fb_io_deq_bits_uops_0_bits_is_rvc; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_debug_pc = fb_io_deq_bits_uops_0_bits_debug_pc; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_iq_type = fb_io_deq_bits_uops_0_bits_iq_type; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_fu_code = fb_io_deq_bits_uops_0_bits_fu_code; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_br_type = fb_io_deq_bits_uops_0_bits_ctrl_br_type; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op1_sel = fb_io_deq_bits_uops_0_bits_ctrl_op1_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op2_sel = fb_io_deq_bits_uops_0_bits_ctrl_op2_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_imm_sel = fb_io_deq_bits_uops_0_bits_ctrl_imm_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op_fcn = fb_io_deq_bits_uops_0_bits_ctrl_op_fcn; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_fcn_dw = fb_io_deq_bits_uops_0_bits_ctrl_fcn_dw; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_csr_cmd = fb_io_deq_bits_uops_0_bits_ctrl_csr_cmd; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_load = fb_io_deq_bits_uops_0_bits_ctrl_is_load; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_sta = fb_io_deq_bits_uops_0_bits_ctrl_is_sta; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_is_std = fb_io_deq_bits_uops_0_bits_ctrl_is_std; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ctrl_op3_sel = fb_io_deq_bits_uops_0_bits_ctrl_op3_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_iw_state = fb_io_deq_bits_uops_0_bits_iw_state; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_iw_p1_poisoned = fb_io_deq_bits_uops_0_bits_iw_p1_poisoned; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_iw_p2_poisoned = fb_io_deq_bits_uops_0_bits_iw_p2_poisoned; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_br = fb_io_deq_bits_uops_0_bits_is_br; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_jalr = fb_io_deq_bits_uops_0_bits_is_jalr; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_jal = fb_io_deq_bits_uops_0_bits_is_jal; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_sfb = fb_io_deq_bits_uops_0_bits_is_sfb; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_br_mask = fb_io_deq_bits_uops_0_bits_br_mask; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_br_tag = fb_io_deq_bits_uops_0_bits_br_tag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx = fb_io_deq_bits_uops_0_bits_ftq_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_edge_inst = fb_io_deq_bits_uops_0_bits_edge_inst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_pc_lob = fb_io_deq_bits_uops_0_bits_pc_lob; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_taken = fb_io_deq_bits_uops_0_bits_taken; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_imm_packed = fb_io_deq_bits_uops_0_bits_imm_packed; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_csr_addr = fb_io_deq_bits_uops_0_bits_csr_addr; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_rob_idx = fb_io_deq_bits_uops_0_bits_rob_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ldq_idx = fb_io_deq_bits_uops_0_bits_ldq_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_stq_idx = fb_io_deq_bits_uops_0_bits_stq_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_rxq_idx = fb_io_deq_bits_uops_0_bits_rxq_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_pdst = fb_io_deq_bits_uops_0_bits_pdst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs1 = fb_io_deq_bits_uops_0_bits_prs1; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs2 = fb_io_deq_bits_uops_0_bits_prs2; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs3 = fb_io_deq_bits_uops_0_bits_prs3; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ppred = fb_io_deq_bits_uops_0_bits_ppred; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs1_busy = fb_io_deq_bits_uops_0_bits_prs1_busy; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs2_busy = fb_io_deq_bits_uops_0_bits_prs2_busy; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_prs3_busy = fb_io_deq_bits_uops_0_bits_prs3_busy; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ppred_busy = fb_io_deq_bits_uops_0_bits_ppred_busy; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_stale_pdst = fb_io_deq_bits_uops_0_bits_stale_pdst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_exception = fb_io_deq_bits_uops_0_bits_exception; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_exc_cause = fb_io_deq_bits_uops_0_bits_exc_cause; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_bypassable = fb_io_deq_bits_uops_0_bits_bypassable; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_mem_cmd = fb_io_deq_bits_uops_0_bits_mem_cmd; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_mem_size = fb_io_deq_bits_uops_0_bits_mem_size; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_mem_signed = fb_io_deq_bits_uops_0_bits_mem_signed; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_fence = fb_io_deq_bits_uops_0_bits_is_fence; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_fencei = fb_io_deq_bits_uops_0_bits_is_fencei; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_amo = fb_io_deq_bits_uops_0_bits_is_amo; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_uses_ldq = fb_io_deq_bits_uops_0_bits_uses_ldq; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_uses_stq = fb_io_deq_bits_uops_0_bits_uses_stq; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_sys_pc2epc = fb_io_deq_bits_uops_0_bits_is_sys_pc2epc; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_is_unique = fb_io_deq_bits_uops_0_bits_is_unique; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_flush_on_commit = fb_io_deq_bits_uops_0_bits_flush_on_commit; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ldst_is_rs1 = fb_io_deq_bits_uops_0_bits_ldst_is_rs1; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ldst = fb_io_deq_bits_uops_0_bits_ldst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_lrs1 = fb_io_deq_bits_uops_0_bits_lrs1; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_lrs2 = fb_io_deq_bits_uops_0_bits_lrs2; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_lrs3 = fb_io_deq_bits_uops_0_bits_lrs3; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_ldst_val = fb_io_deq_bits_uops_0_bits_ldst_val; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_dst_rtype = fb_io_deq_bits_uops_0_bits_dst_rtype; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_lrs1_rtype = fb_io_deq_bits_uops_0_bits_lrs1_rtype; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_lrs2_rtype = fb_io_deq_bits_uops_0_bits_lrs2_rtype; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_frs3_en = fb_io_deq_bits_uops_0_bits_frs3_en; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_fp_val = fb_io_deq_bits_uops_0_bits_fp_val; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_fp_single = fb_io_deq_bits_uops_0_bits_fp_single; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if = fb_io_deq_bits_uops_0_bits_xcpt_pf_if; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if = fb_io_deq_bits_uops_0_bits_xcpt_ae_if; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ma_if = fb_io_deq_bits_uops_0_bits_xcpt_ma_if; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if = fb_io_deq_bits_uops_0_bits_bp_debug_if; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if = fb_io_deq_bits_uops_0_bits_bp_xcpt_if; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc = fb_io_deq_bits_uops_0_bits_debug_fsrc; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_0_bits_debug_tsrc = fb_io_deq_bits_uops_0_bits_debug_tsrc; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_valid = fb_io_deq_bits_uops_1_valid; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_switch = fb_io_deq_bits_uops_1_bits_switch; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_switch_off = fb_io_deq_bits_uops_1_bits_switch_off; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_unicore = fb_io_deq_bits_uops_1_bits_is_unicore; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_shift = fb_io_deq_bits_uops_1_bits_shift; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_lrs3_rtype = fb_io_deq_bits_uops_1_bits_lrs3_rtype; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_rflag = fb_io_deq_bits_uops_1_bits_rflag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_wflag = fb_io_deq_bits_uops_1_bits_wflag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prflag = fb_io_deq_bits_uops_1_bits_prflag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_pwflag = fb_io_deq_bits_uops_1_bits_pwflag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_pflag_busy = fb_io_deq_bits_uops_1_bits_pflag_busy; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_stale_pflag = fb_io_deq_bits_uops_1_bits_stale_pflag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_op1_sel = fb_io_deq_bits_uops_1_bits_op1_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_op2_sel = fb_io_deq_bits_uops_1_bits_op2_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_split_num = fb_io_deq_bits_uops_1_bits_split_num; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_self_index = fb_io_deq_bits_uops_1_bits_self_index; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_rob_inst_idx = fb_io_deq_bits_uops_1_bits_rob_inst_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_address_num = fb_io_deq_bits_uops_1_bits_address_num; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_uopc = fb_io_deq_bits_uops_1_bits_uopc; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_inst = fb_io_deq_bits_uops_1_bits_inst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_debug_inst = fb_io_deq_bits_uops_1_bits_debug_inst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_rvc = fb_io_deq_bits_uops_1_bits_is_rvc; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_debug_pc = fb_io_deq_bits_uops_1_bits_debug_pc; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_iq_type = fb_io_deq_bits_uops_1_bits_iq_type; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_fu_code = fb_io_deq_bits_uops_1_bits_fu_code; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_br_type = fb_io_deq_bits_uops_1_bits_ctrl_br_type; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op1_sel = fb_io_deq_bits_uops_1_bits_ctrl_op1_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op2_sel = fb_io_deq_bits_uops_1_bits_ctrl_op2_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_imm_sel = fb_io_deq_bits_uops_1_bits_ctrl_imm_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op_fcn = fb_io_deq_bits_uops_1_bits_ctrl_op_fcn; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_fcn_dw = fb_io_deq_bits_uops_1_bits_ctrl_fcn_dw; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_csr_cmd = fb_io_deq_bits_uops_1_bits_ctrl_csr_cmd; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_load = fb_io_deq_bits_uops_1_bits_ctrl_is_load; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_sta = fb_io_deq_bits_uops_1_bits_ctrl_is_sta; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_is_std = fb_io_deq_bits_uops_1_bits_ctrl_is_std; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ctrl_op3_sel = fb_io_deq_bits_uops_1_bits_ctrl_op3_sel; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_iw_state = fb_io_deq_bits_uops_1_bits_iw_state; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_iw_p1_poisoned = fb_io_deq_bits_uops_1_bits_iw_p1_poisoned; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_iw_p2_poisoned = fb_io_deq_bits_uops_1_bits_iw_p2_poisoned; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_br = fb_io_deq_bits_uops_1_bits_is_br; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_jalr = fb_io_deq_bits_uops_1_bits_is_jalr; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_jal = fb_io_deq_bits_uops_1_bits_is_jal; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_sfb = fb_io_deq_bits_uops_1_bits_is_sfb; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_br_mask = fb_io_deq_bits_uops_1_bits_br_mask; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_br_tag = fb_io_deq_bits_uops_1_bits_br_tag; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ftq_idx = fb_io_deq_bits_uops_1_bits_ftq_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_edge_inst = fb_io_deq_bits_uops_1_bits_edge_inst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_pc_lob = fb_io_deq_bits_uops_1_bits_pc_lob; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_taken = fb_io_deq_bits_uops_1_bits_taken; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_imm_packed = fb_io_deq_bits_uops_1_bits_imm_packed; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_csr_addr = fb_io_deq_bits_uops_1_bits_csr_addr; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_rob_idx = fb_io_deq_bits_uops_1_bits_rob_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ldq_idx = fb_io_deq_bits_uops_1_bits_ldq_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_stq_idx = fb_io_deq_bits_uops_1_bits_stq_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_rxq_idx = fb_io_deq_bits_uops_1_bits_rxq_idx; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_pdst = fb_io_deq_bits_uops_1_bits_pdst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs1 = fb_io_deq_bits_uops_1_bits_prs1; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs2 = fb_io_deq_bits_uops_1_bits_prs2; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs3 = fb_io_deq_bits_uops_1_bits_prs3; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ppred = fb_io_deq_bits_uops_1_bits_ppred; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs1_busy = fb_io_deq_bits_uops_1_bits_prs1_busy; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs2_busy = fb_io_deq_bits_uops_1_bits_prs2_busy; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_prs3_busy = fb_io_deq_bits_uops_1_bits_prs3_busy; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ppred_busy = fb_io_deq_bits_uops_1_bits_ppred_busy; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_stale_pdst = fb_io_deq_bits_uops_1_bits_stale_pdst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_exception = fb_io_deq_bits_uops_1_bits_exception; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_exc_cause = fb_io_deq_bits_uops_1_bits_exc_cause; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_bypassable = fb_io_deq_bits_uops_1_bits_bypassable; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_mem_cmd = fb_io_deq_bits_uops_1_bits_mem_cmd; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_mem_size = fb_io_deq_bits_uops_1_bits_mem_size; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_mem_signed = fb_io_deq_bits_uops_1_bits_mem_signed; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_fence = fb_io_deq_bits_uops_1_bits_is_fence; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_fencei = fb_io_deq_bits_uops_1_bits_is_fencei; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_amo = fb_io_deq_bits_uops_1_bits_is_amo; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_uses_ldq = fb_io_deq_bits_uops_1_bits_uses_ldq; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_uses_stq = fb_io_deq_bits_uops_1_bits_uses_stq; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_sys_pc2epc = fb_io_deq_bits_uops_1_bits_is_sys_pc2epc; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_is_unique = fb_io_deq_bits_uops_1_bits_is_unique; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_flush_on_commit = fb_io_deq_bits_uops_1_bits_flush_on_commit; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ldst_is_rs1 = fb_io_deq_bits_uops_1_bits_ldst_is_rs1; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ldst = fb_io_deq_bits_uops_1_bits_ldst; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_lrs1 = fb_io_deq_bits_uops_1_bits_lrs1; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_lrs2 = fb_io_deq_bits_uops_1_bits_lrs2; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_lrs3 = fb_io_deq_bits_uops_1_bits_lrs3; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_ldst_val = fb_io_deq_bits_uops_1_bits_ldst_val; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_dst_rtype = fb_io_deq_bits_uops_1_bits_dst_rtype; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_lrs1_rtype = fb_io_deq_bits_uops_1_bits_lrs1_rtype; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_lrs2_rtype = fb_io_deq_bits_uops_1_bits_lrs2_rtype; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_frs3_en = fb_io_deq_bits_uops_1_bits_frs3_en; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_fp_val = fb_io_deq_bits_uops_1_bits_fp_val; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_fp_single = fb_io_deq_bits_uops_1_bits_fp_single; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_xcpt_pf_if = fb_io_deq_bits_uops_1_bits_xcpt_pf_if; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_xcpt_ae_if = fb_io_deq_bits_uops_1_bits_xcpt_ae_if; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_xcpt_ma_if = fb_io_deq_bits_uops_1_bits_xcpt_ma_if; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_bp_debug_if = fb_io_deq_bits_uops_1_bits_bp_debug_if; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_bp_xcpt_if = fb_io_deq_bits_uops_1_bits_bp_xcpt_if; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_debug_fsrc = fb_io_deq_bits_uops_1_bits_debug_fsrc; // @[frontend.scala 958:22]
  assign io_cpu_fetchpacket_bits_uops_1_bits_debug_tsrc = fb_io_deq_bits_uops_1_bits_debug_tsrc; // @[frontend.scala 958:22]
  assign io_cpu_get_pc_0_entry_cfi_idx_valid = ftq_io_get_ftq_pc_0_entry_cfi_idx_valid; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_entry_cfi_idx_bits = ftq_io_get_ftq_pc_0_entry_cfi_idx_bits; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_entry_cfi_taken = ftq_io_get_ftq_pc_0_entry_cfi_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_entry_cfi_mispredicted = ftq_io_get_ftq_pc_0_entry_cfi_mispredicted; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_entry_cfi_type = ftq_io_get_ftq_pc_0_entry_cfi_type; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_entry_br_mask = ftq_io_get_ftq_pc_0_entry_br_mask; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_entry_cfi_is_call = ftq_io_get_ftq_pc_0_entry_cfi_is_call; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_entry_cfi_is_ret = ftq_io_get_ftq_pc_0_entry_cfi_is_ret; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_entry_cfi_npc_plus4 = ftq_io_get_ftq_pc_0_entry_cfi_npc_plus4; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_entry_ras_top = ftq_io_get_ftq_pc_0_entry_ras_top; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_entry_ras_idx = ftq_io_get_ftq_pc_0_entry_ras_idx; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_entry_start_bank = ftq_io_get_ftq_pc_0_entry_start_bank; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_ghist_old_history = ftq_io_get_ftq_pc_0_ghist_old_history; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_ghist_current_saw_branch_not_taken = ftq_io_get_ftq_pc_0_ghist_current_saw_branch_not_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_ghist_new_saw_branch_not_taken = ftq_io_get_ftq_pc_0_ghist_new_saw_branch_not_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_ghist_new_saw_branch_taken = ftq_io_get_ftq_pc_0_ghist_new_saw_branch_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_ghist_ras_idx = ftq_io_get_ftq_pc_0_ghist_ras_idx; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_pc = ftq_io_get_ftq_pc_0_pc; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_com_pc = ftq_io_get_ftq_pc_0_com_pc; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_next_val = ftq_io_get_ftq_pc_0_next_val; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_0_next_pc = ftq_io_get_ftq_pc_0_next_pc; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_cfi_idx_valid = ftq_io_get_ftq_pc_1_entry_cfi_idx_valid; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_cfi_idx_bits = ftq_io_get_ftq_pc_1_entry_cfi_idx_bits; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_cfi_taken = ftq_io_get_ftq_pc_1_entry_cfi_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_cfi_mispredicted = ftq_io_get_ftq_pc_1_entry_cfi_mispredicted; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_cfi_type = ftq_io_get_ftq_pc_1_entry_cfi_type; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_br_mask = ftq_io_get_ftq_pc_1_entry_br_mask; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_cfi_is_call = ftq_io_get_ftq_pc_1_entry_cfi_is_call; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_cfi_is_ret = ftq_io_get_ftq_pc_1_entry_cfi_is_ret; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_cfi_npc_plus4 = ftq_io_get_ftq_pc_1_entry_cfi_npc_plus4; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_ras_top = ftq_io_get_ftq_pc_1_entry_ras_top; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_ras_idx = ftq_io_get_ftq_pc_1_entry_ras_idx; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_entry_start_bank = ftq_io_get_ftq_pc_1_entry_start_bank; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_ghist_old_history = ftq_io_get_ftq_pc_1_ghist_old_history; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_ghist_current_saw_branch_not_taken = ftq_io_get_ftq_pc_1_ghist_current_saw_branch_not_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_ghist_new_saw_branch_not_taken = ftq_io_get_ftq_pc_1_ghist_new_saw_branch_not_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_ghist_new_saw_branch_taken = ftq_io_get_ftq_pc_1_ghist_new_saw_branch_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_ghist_ras_idx = ftq_io_get_ftq_pc_1_ghist_ras_idx; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_pc = ftq_io_get_ftq_pc_1_pc; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_com_pc = ftq_io_get_ftq_pc_1_com_pc; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_next_val = ftq_io_get_ftq_pc_1_next_val; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_1_next_pc = ftq_io_get_ftq_pc_1_next_pc; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_cfi_idx_valid = ftq_io_get_ftq_pc_2_entry_cfi_idx_valid; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_cfi_idx_bits = ftq_io_get_ftq_pc_2_entry_cfi_idx_bits; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_cfi_taken = ftq_io_get_ftq_pc_2_entry_cfi_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_cfi_mispredicted = ftq_io_get_ftq_pc_2_entry_cfi_mispredicted; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_cfi_type = ftq_io_get_ftq_pc_2_entry_cfi_type; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_br_mask = ftq_io_get_ftq_pc_2_entry_br_mask; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_cfi_is_call = ftq_io_get_ftq_pc_2_entry_cfi_is_call; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_cfi_is_ret = ftq_io_get_ftq_pc_2_entry_cfi_is_ret; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_cfi_npc_plus4 = ftq_io_get_ftq_pc_2_entry_cfi_npc_plus4; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_ras_top = ftq_io_get_ftq_pc_2_entry_ras_top; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_ras_idx = ftq_io_get_ftq_pc_2_entry_ras_idx; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_entry_start_bank = ftq_io_get_ftq_pc_2_entry_start_bank; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_ghist_old_history = ftq_io_get_ftq_pc_2_ghist_old_history; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_ghist_current_saw_branch_not_taken = ftq_io_get_ftq_pc_2_ghist_current_saw_branch_not_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_ghist_new_saw_branch_not_taken = ftq_io_get_ftq_pc_2_ghist_new_saw_branch_not_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_ghist_new_saw_branch_taken = ftq_io_get_ftq_pc_2_ghist_new_saw_branch_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_ghist_ras_idx = ftq_io_get_ftq_pc_2_ghist_ras_idx; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_pc = ftq_io_get_ftq_pc_2_pc; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_com_pc = ftq_io_get_ftq_pc_2_com_pc; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_next_val = ftq_io_get_ftq_pc_2_next_val; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_2_next_pc = ftq_io_get_ftq_pc_2_next_pc; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_cfi_idx_valid = ftq_io_get_ftq_pc_3_entry_cfi_idx_valid; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_cfi_idx_bits = ftq_io_get_ftq_pc_3_entry_cfi_idx_bits; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_cfi_taken = ftq_io_get_ftq_pc_3_entry_cfi_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_cfi_mispredicted = ftq_io_get_ftq_pc_3_entry_cfi_mispredicted; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_cfi_type = ftq_io_get_ftq_pc_3_entry_cfi_type; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_br_mask = ftq_io_get_ftq_pc_3_entry_br_mask; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_cfi_is_call = ftq_io_get_ftq_pc_3_entry_cfi_is_call; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_cfi_is_ret = ftq_io_get_ftq_pc_3_entry_cfi_is_ret; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_cfi_npc_plus4 = ftq_io_get_ftq_pc_3_entry_cfi_npc_plus4; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_ras_top = ftq_io_get_ftq_pc_3_entry_ras_top; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_ras_idx = ftq_io_get_ftq_pc_3_entry_ras_idx; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_entry_start_bank = ftq_io_get_ftq_pc_3_entry_start_bank; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_ghist_old_history = ftq_io_get_ftq_pc_3_ghist_old_history; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_ghist_current_saw_branch_not_taken = ftq_io_get_ftq_pc_3_ghist_current_saw_branch_not_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_ghist_new_saw_branch_not_taken = ftq_io_get_ftq_pc_3_ghist_new_saw_branch_not_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_ghist_new_saw_branch_taken = ftq_io_get_ftq_pc_3_ghist_new_saw_branch_taken; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_ghist_ras_idx = ftq_io_get_ftq_pc_3_ghist_ras_idx; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_pc = ftq_io_get_ftq_pc_3_pc; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_com_pc = ftq_io_get_ftq_pc_3_com_pc; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_next_val = ftq_io_get_ftq_pc_3_next_val; // @[frontend.scala 959:17]
  assign io_cpu_get_pc_3_next_pc = ftq_io_get_ftq_pc_3_next_pc; // @[frontend.scala 959:17]
  assign io_cpu_debug_fetch_pc_0 = ftq_io_debug_fetch_pc_0; // @[frontend.scala 999:25]
  assign io_cpu_debug_fetch_pc_1 = ftq_io_debug_fetch_pc_1; // @[frontend.scala 999:25]
  assign io_cpu_perf_acquire = icache_io_perf_acquire; // @[frontend.scala 345:23]
  assign io_cpu_perf_tlbMiss = io_ptw_req_ready & io_ptw_req_valid; // @[Decoupled.scala 40:37]
  assign io_ptw_req_valid = tlb_io_ptw_req_valid; // @[frontend.scala 343:10]
  assign io_ptw_req_bits_valid = tlb_io_ptw_req_bits_valid; // @[frontend.scala 343:10]
  assign io_ptw_req_bits_bits_addr = tlb_io_ptw_req_bits_bits_addr; // @[frontend.scala 343:10]
  assign io_errors_bus_valid = 1'h0;
  assign io_errors_bus_bits = 32'h0;
  assign icache_clock = clock;
  assign icache_reset = reset;
  assign icache_auto_master_out_a_ready = auto_icache_master_out_a_ready; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_valid = auto_icache_master_out_d_valid; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_opcode = auto_icache_master_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_param = auto_icache_master_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_size = auto_icache_master_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_source = auto_icache_master_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_sink = auto_icache_master_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_denied = auto_icache_master_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_data = auto_icache_master_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_corrupt = auto_icache_master_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign icache_io_req_valid = io_cpu_sfence_valid ? 1'h0 : _GEN_210; // @[frontend.scala 967:30 frontend.scala 974:18]
  assign icache_io_req_bits_addr = s0_vpc[38:0]; // @[frontend.scala 374:27]
  assign icache_io_s1_paddr = s1_is_replay ? REG_3 : tlb_io_resp_paddr; // @[frontend.scala 401:20]
  assign icache_io_s1_kill = tlb_io_resp_miss | f1_clear; // @[frontend.scala 405:42]
  assign icache_io_s2_kill = s2_valid & (s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst) & ~s2_is_replay; // @[frontend.scala 454:74]
  assign icache_io_s2_prefetch = 1'h0;
  assign icache_io_invalidate = io_cpu_flush_icache; // @[frontend.scala 341:24]
  assign bpd_clock = clock;
  assign bpd_reset = reset;
  assign bpd_io_f0_req_valid = io_cpu_sfence_valid ? 1'h0 : _GEN_210; // @[frontend.scala 967:30 frontend.scala 974:18]
  assign bpd_io_f0_req_bits_pc = _GEN_225[39:0]; // @[frontend.scala 377:28]
  assign bpd_io_f0_req_bits_ghist_old_history = io_cpu_sfence_valid ? _GEN_192 : _GEN_216; // @[frontend.scala 967:30]
  assign bpd_io_f0_req_bits_ghist_current_saw_branch_not_taken = io_cpu_sfence_valid ? _GEN_191 : _GEN_215; // @[frontend.scala 967:30]
  assign bpd_io_f0_req_bits_ghist_new_saw_branch_not_taken = io_cpu_sfence_valid ? _GEN_190 : _GEN_214; // @[frontend.scala 967:30]
  assign bpd_io_f0_req_bits_ghist_new_saw_branch_taken = io_cpu_sfence_valid ? _GEN_189 : _GEN_213; // @[frontend.scala 967:30]
  assign bpd_io_f0_req_bits_ghist_ras_idx = io_cpu_sfence_valid ? _GEN_188 : _GEN_212; // @[frontend.scala 967:30]
  assign bpd_io_f3_fire = f3_bpd_resp_io_enq_ready & f3_bpd_resp_io_enq_valid; // @[Decoupled.scala 40:37]
  assign bpd_io_update_valid = bpd_update_arbiter_io_out_valid; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_is_mispredict_update = bpd_update_arbiter_io_out_bits_is_mispredict_update; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_is_repair_update = bpd_update_arbiter_io_out_bits_is_repair_update; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_btb_mispredicts = bpd_update_arbiter_io_out_bits_btb_mispredicts; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_pc = bpd_update_arbiter_io_out_bits_pc; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_br_mask = bpd_update_arbiter_io_out_bits_br_mask; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_cfi_idx_valid = bpd_update_arbiter_io_out_bits_cfi_idx_valid; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_cfi_idx_bits = bpd_update_arbiter_io_out_bits_cfi_idx_bits; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_cfi_taken = bpd_update_arbiter_io_out_bits_cfi_taken; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_cfi_mispredicted = bpd_update_arbiter_io_out_bits_cfi_mispredicted; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_cfi_is_br = bpd_update_arbiter_io_out_bits_cfi_is_br; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_cfi_is_jal = bpd_update_arbiter_io_out_bits_cfi_is_jal; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_cfi_is_jalr = bpd_update_arbiter_io_out_bits_cfi_is_jalr; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_ghist_old_history = bpd_update_arbiter_io_out_bits_ghist_old_history; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_ghist_current_saw_branch_not_taken =
    bpd_update_arbiter_io_out_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_ghist_new_saw_branch_not_taken =
    bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_ghist_new_saw_branch_taken = bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_taken; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_ghist_ras_idx = bpd_update_arbiter_io_out_bits_ghist_ras_idx; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_lhist_0 = bpd_update_arbiter_io_out_bits_lhist_0; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_target = bpd_update_arbiter_io_out_bits_target; // @[frontend.scala 944:17]
  assign bpd_io_update_bits_meta_0 = bpd_update_arbiter_io_out_bits_meta_0; // @[frontend.scala 944:17]
  assign ras_clock = clock;
  assign ras_reset = reset;
  assign ras_io_read_idx = _T_217 ? f3_io_enq_bits_ghist_ras_idx : ras_read_idx; // @[frontend.scala 545:27 frontend.scala 546:18 frontend.scala 543:29]
  assign ras_io_write_valid = ftq_io_ras_update | _GEN_171; // @[frontend.scala 947:52 frontend.scala 948:24]
  assign ras_io_write_idx = ftq_io_ras_update ? ftq_io_ras_update_idx : _T_740; // @[frontend.scala 947:52 frontend.scala 949:24 frontend.scala 822:22]
  assign ras_io_write_addr = ftq_io_ras_update ? ftq_io_ras_update_pc : _T_753; // @[frontend.scala 947:52 frontend.scala 950:24 frontend.scala 820:22]
  assign tlb_clock = clock;
  assign tlb_reset = reset;
  assign tlb_io_req_valid = s1_valid & ~s1_is_replay & ~f1_clear | s1_is_sfence; // @[frontend.scala 391:69]
  assign tlb_io_req_bits_vaddr = s1_vpc; // @[frontend.scala 393:25]
  assign tlb_io_req_bits_passthrough = 1'h0; // @[frontend.scala 394:31]
  assign tlb_io_req_bits_size = 2'h3; // @[frontend.scala 395:25]
  assign tlb_io_req_bits_cmd = 5'h0;
  assign tlb_io_sfence_valid = REG_1_valid; // @[frontend.scala 396:25]
  assign tlb_io_sfence_bits_rs1 = REG_1_bits_rs1; // @[frontend.scala 396:25]
  assign tlb_io_sfence_bits_rs2 = REG_1_bits_rs2; // @[frontend.scala 396:25]
  assign tlb_io_sfence_bits_addr = REG_1_bits_addr; // @[frontend.scala 396:25]
  assign tlb_io_sfence_bits_asid = REG_1_bits_asid; // @[frontend.scala 396:25]
  assign tlb_io_ptw_req_ready = io_ptw_req_ready; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_valid = io_ptw_resp_valid; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_ae = io_ptw_resp_bits_ae; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_pte_ppn = io_ptw_resp_bits_pte_ppn; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_pte_reserved_for_software = io_ptw_resp_bits_pte_reserved_for_software; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_pte_d = io_ptw_resp_bits_pte_d; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_pte_a = io_ptw_resp_bits_pte_a; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_pte_g = io_ptw_resp_bits_pte_g; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_pte_u = io_ptw_resp_bits_pte_u; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_pte_x = io_ptw_resp_bits_pte_x; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_pte_w = io_ptw_resp_bits_pte_w; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_pte_r = io_ptw_resp_bits_pte_r; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_pte_v = io_ptw_resp_bits_pte_v; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_level = io_ptw_resp_bits_level; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_fragmented_superpage = io_ptw_resp_bits_fragmented_superpage; // @[frontend.scala 343:10]
  assign tlb_io_ptw_resp_bits_homogeneous = io_ptw_resp_bits_homogeneous; // @[frontend.scala 343:10]
  assign tlb_io_ptw_ptbr_mode = io_ptw_ptbr_mode; // @[frontend.scala 343:10]
  assign tlb_io_ptw_ptbr_asid = io_ptw_ptbr_asid; // @[frontend.scala 343:10]
  assign tlb_io_ptw_ptbr_ppn = io_ptw_ptbr_ppn; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_debug = io_ptw_status_debug; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_cease = io_ptw_status_cease; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_wfi = io_ptw_status_wfi; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_isa = io_ptw_status_isa; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_dprv = io_ptw_status_dprv; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_prv = io_ptw_status_prv; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_sd = io_ptw_status_sd; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_zero2 = io_ptw_status_zero2; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_sxl = io_ptw_status_sxl; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_uxl = io_ptw_status_uxl; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_sd_rv32 = io_ptw_status_sd_rv32; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_zero1 = io_ptw_status_zero1; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_tsr = io_ptw_status_tsr; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_tw = io_ptw_status_tw; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_tvm = io_ptw_status_tvm; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_mxr = io_ptw_status_mxr; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_sum = io_ptw_status_sum; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_mprv = io_ptw_status_mprv; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_xs = io_ptw_status_xs; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_fs = io_ptw_status_fs; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_mpp = io_ptw_status_mpp; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_vs = io_ptw_status_vs; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_spp = io_ptw_status_spp; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_mpie = io_ptw_status_mpie; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_hpie = io_ptw_status_hpie; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_spie = io_ptw_status_spie; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_upie = io_ptw_status_upie; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_mie = io_ptw_status_mie; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_hie = io_ptw_status_hie; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_sie = io_ptw_status_sie; // @[frontend.scala 343:10]
  assign tlb_io_ptw_status_uie = io_ptw_status_uie; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_0_cfg_l = io_ptw_pmp_0_cfg_l; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_0_cfg_res = io_ptw_pmp_0_cfg_res; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_0_cfg_a = io_ptw_pmp_0_cfg_a; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_0_cfg_x = io_ptw_pmp_0_cfg_x; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_0_cfg_w = io_ptw_pmp_0_cfg_w; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_0_cfg_r = io_ptw_pmp_0_cfg_r; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_0_addr = io_ptw_pmp_0_addr; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_0_mask = io_ptw_pmp_0_mask; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_1_cfg_l = io_ptw_pmp_1_cfg_l; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_1_cfg_res = io_ptw_pmp_1_cfg_res; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_1_cfg_a = io_ptw_pmp_1_cfg_a; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_1_cfg_x = io_ptw_pmp_1_cfg_x; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_1_cfg_w = io_ptw_pmp_1_cfg_w; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_1_cfg_r = io_ptw_pmp_1_cfg_r; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_1_addr = io_ptw_pmp_1_addr; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_1_mask = io_ptw_pmp_1_mask; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_2_cfg_l = io_ptw_pmp_2_cfg_l; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_2_cfg_res = io_ptw_pmp_2_cfg_res; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_2_cfg_a = io_ptw_pmp_2_cfg_a; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_2_cfg_x = io_ptw_pmp_2_cfg_x; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_2_cfg_w = io_ptw_pmp_2_cfg_w; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_2_cfg_r = io_ptw_pmp_2_cfg_r; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_2_addr = io_ptw_pmp_2_addr; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_2_mask = io_ptw_pmp_2_mask; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_3_cfg_l = io_ptw_pmp_3_cfg_l; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_3_cfg_res = io_ptw_pmp_3_cfg_res; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_3_cfg_a = io_ptw_pmp_3_cfg_a; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_3_cfg_x = io_ptw_pmp_3_cfg_x; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_3_cfg_w = io_ptw_pmp_3_cfg_w; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_3_cfg_r = io_ptw_pmp_3_cfg_r; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_3_addr = io_ptw_pmp_3_addr; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_3_mask = io_ptw_pmp_3_mask; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_4_cfg_l = io_ptw_pmp_4_cfg_l; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_4_cfg_res = io_ptw_pmp_4_cfg_res; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_4_cfg_a = io_ptw_pmp_4_cfg_a; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_4_cfg_x = io_ptw_pmp_4_cfg_x; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_4_cfg_w = io_ptw_pmp_4_cfg_w; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_4_cfg_r = io_ptw_pmp_4_cfg_r; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_4_addr = io_ptw_pmp_4_addr; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_4_mask = io_ptw_pmp_4_mask; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_5_cfg_l = io_ptw_pmp_5_cfg_l; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_5_cfg_res = io_ptw_pmp_5_cfg_res; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_5_cfg_a = io_ptw_pmp_5_cfg_a; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_5_cfg_x = io_ptw_pmp_5_cfg_x; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_5_cfg_w = io_ptw_pmp_5_cfg_w; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_5_cfg_r = io_ptw_pmp_5_cfg_r; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_5_addr = io_ptw_pmp_5_addr; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_5_mask = io_ptw_pmp_5_mask; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_6_cfg_l = io_ptw_pmp_6_cfg_l; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_6_cfg_res = io_ptw_pmp_6_cfg_res; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_6_cfg_a = io_ptw_pmp_6_cfg_a; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_6_cfg_x = io_ptw_pmp_6_cfg_x; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_6_cfg_w = io_ptw_pmp_6_cfg_w; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_6_cfg_r = io_ptw_pmp_6_cfg_r; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_6_addr = io_ptw_pmp_6_addr; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_6_mask = io_ptw_pmp_6_mask; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_7_cfg_l = io_ptw_pmp_7_cfg_l; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_7_cfg_res = io_ptw_pmp_7_cfg_res; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_7_cfg_a = io_ptw_pmp_7_cfg_a; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_7_cfg_x = io_ptw_pmp_7_cfg_x; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_7_cfg_w = io_ptw_pmp_7_cfg_w; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_7_cfg_r = io_ptw_pmp_7_cfg_r; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_7_addr = io_ptw_pmp_7_addr; // @[frontend.scala 343:10]
  assign tlb_io_ptw_pmp_7_mask = io_ptw_pmp_7_mask; // @[frontend.scala 343:10]
  assign tlb_io_ptw_customCSRs_csrs_0_wen = io_ptw_customCSRs_csrs_0_wen; // @[frontend.scala 343:10]
  assign tlb_io_ptw_customCSRs_csrs_0_wdata = io_ptw_customCSRs_csrs_0_wdata; // @[frontend.scala 343:10]
  assign tlb_io_ptw_customCSRs_csrs_0_value = io_ptw_customCSRs_csrs_0_value; // @[frontend.scala 343:10]
  assign tlb_io_kill = 1'h0; // @[frontend.scala 397:25]
  assign f3_clock = clock;
  assign f3_reset = reset | f3_clear; // @[frontend.scala 518:35]
  assign f3_io_enq_valid = s2_valid & ~f2_clear & _T_212; // @[frontend.scala 531:47]
  assign f3_io_enq_bits_pc = s2_vpc; // @[frontend.scala 534:21]
  assign f3_io_enq_bits_data = s2_xcpt ? 64'h0 : icache_io_resp_bits_data; // @[frontend.scala 535:30]
  assign f3_io_enq_bits_mask = f2_mask[3:0]; // @[frontend.scala 537:23]
  assign f3_io_enq_bits_xcpt_pf_inst = s2_tlb_resp_pf_inst; // @[frontend.scala 538:23]
  assign f3_io_enq_bits_xcpt_ae_inst = s2_tlb_resp_ae_inst; // @[frontend.scala 538:23]
  assign f3_io_enq_bits_ghist_old_history = f3_io_deq_valid & f4_ready ? _GEN_153 : s2_ghist_old_history; // @[frontend.scala 828:38 frontend.scala 536:24]
  assign f3_io_enq_bits_ghist_current_saw_branch_not_taken = f3_io_deq_valid & f4_ready ? _GEN_152 :
    s2_ghist_current_saw_branch_not_taken; // @[frontend.scala 828:38 frontend.scala 536:24]
  assign f3_io_enq_bits_ghist_new_saw_branch_not_taken = f3_io_deq_valid & f4_ready ? _GEN_151 :
    s2_ghist_new_saw_branch_not_taken; // @[frontend.scala 828:38 frontend.scala 536:24]
  assign f3_io_enq_bits_ghist_new_saw_branch_taken = f3_io_deq_valid & f4_ready ? _GEN_150 :
    s2_ghist_new_saw_branch_taken; // @[frontend.scala 828:38 frontend.scala 536:24]
  assign f3_io_enq_bits_ghist_ras_idx = f3_io_deq_valid & f4_ready ? _GEN_149 : s2_ghist_ras_idx; // @[frontend.scala 828:38 frontend.scala 536:24]
  assign f3_io_enq_bits_fsrc = _T_181 ? 2'h0 : _GEN_63; // @[frontend.scala 485:58]
  assign f3_io_enq_bits_tsrc = s2_tsrc; // @[frontend.scala 540:23]
  assign f3_io_deq_ready = f4_io_enq_ready; // @[frontend.scala 529:22 frontend.scala 921:12]
  assign f3_bpd_resp_clock = clock;
  assign f3_bpd_resp_reset = reset | f3_clear; // @[frontend.scala 523:44]
  assign f3_bpd_resp_io_enq_valid = f3_io_deq_valid & REG_5; // @[frontend.scala 552:47]
  assign f3_bpd_resp_io_enq_bits_pc = bpd_io_resp_f3_pc; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_0_taken = bpd_io_resp_f3_preds_0_taken; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_0_is_br = bpd_io_resp_f3_preds_0_is_br; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_0_is_jal = bpd_io_resp_f3_preds_0_is_jal; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_valid = bpd_io_resp_f3_preds_0_predicted_pc_valid; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_0_predicted_pc_bits = bpd_io_resp_f3_preds_0_predicted_pc_bits; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_1_taken = bpd_io_resp_f3_preds_1_taken; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_1_is_br = bpd_io_resp_f3_preds_1_is_br; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_1_is_jal = bpd_io_resp_f3_preds_1_is_jal; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_valid = bpd_io_resp_f3_preds_1_predicted_pc_valid; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_1_predicted_pc_bits = bpd_io_resp_f3_preds_1_predicted_pc_bits; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_2_taken = bpd_io_resp_f3_preds_2_taken; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_2_is_br = bpd_io_resp_f3_preds_2_is_br; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_2_is_jal = bpd_io_resp_f3_preds_2_is_jal; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_valid = bpd_io_resp_f3_preds_2_predicted_pc_valid; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_2_predicted_pc_bits = bpd_io_resp_f3_preds_2_predicted_pc_bits; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_3_taken = bpd_io_resp_f3_preds_3_taken; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_3_is_br = bpd_io_resp_f3_preds_3_is_br; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_3_is_jal = bpd_io_resp_f3_preds_3_is_jal; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_valid = bpd_io_resp_f3_preds_3_predicted_pc_valid; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_preds_3_predicted_pc_bits = bpd_io_resp_f3_preds_3_predicted_pc_bits; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_meta_0 = bpd_io_resp_f3_meta_0; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_enq_bits_lhist_0 = bpd_io_resp_f3_lhist_0; // @[frontend.scala 553:28]
  assign f3_bpd_resp_io_deq_ready = f4_io_enq_ready; // @[frontend.scala 529:22 frontend.scala 921:12]
  assign BreakpointUnit_clock = clock;
  assign BreakpointUnit_reset = reset;
  assign BreakpointUnit_io_status_debug = io_cpu_status_debug; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_cease = io_cpu_status_cease; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_wfi = io_cpu_status_wfi; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_isa = io_cpu_status_isa; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_dprv = io_cpu_status_dprv; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_prv = io_cpu_status_prv; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_sd = io_cpu_status_sd; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_zero2 = io_cpu_status_zero2; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_sxl = io_cpu_status_sxl; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_uxl = io_cpu_status_uxl; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_sd_rv32 = io_cpu_status_sd_rv32; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_zero1 = io_cpu_status_zero1; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_tsr = io_cpu_status_tsr; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_tw = io_cpu_status_tw; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_tvm = io_cpu_status_tvm; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_mxr = io_cpu_status_mxr; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_sum = io_cpu_status_sum; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_mprv = io_cpu_status_mprv; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_xs = io_cpu_status_xs; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_fs = io_cpu_status_fs; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_mpp = io_cpu_status_mpp; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_vs = io_cpu_status_vs; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_spp = io_cpu_status_spp; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_mpie = io_cpu_status_mpie; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_hpie = io_cpu_status_hpie; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_spie = io_cpu_status_spie; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_upie = io_cpu_status_upie; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_mie = io_cpu_status_mie; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_hie = io_cpu_status_hie; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_sie = io_cpu_status_sie; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_status_uie = io_cpu_status_uie; // @[frontend.scala 612:23]
  assign BreakpointUnit_io_pc = _GEN_86[38:0];
  assign BreakpointUnit_io_ea = 39'h0;
  assign RVCExpander_clock = clock;
  assign RVCExpander_reset = reset;
  assign RVCExpander_io_in = {hi_4,f3_prev_half}; // @[Cat.scala 30:58]
  assign RVCExpander_1_clock = clock;
  assign RVCExpander_1_reset = reset;
  assign RVCExpander_1_io_in = _T_227[31:0]; // @[frontend.scala 621:30]
  assign BranchDecode_clock = clock;
  assign BranchDecode_reset = reset;
  assign BranchDecode_io_inst = io_cpu_is_unicore ? _T_228 : _T_230; // @[frontend.scala 623:28]
  assign BranchDecode_io_pc = _T_234[39:0] - 40'h2; // @[frontend.scala 625:69]
  assign BranchDecode_io_is_unicore = io_cpu_is_unicore; // @[frontend.scala 636:38]
  assign BranchDecode_1_clock = clock;
  assign BranchDecode_1_reset = reset;
  assign BranchDecode_1_io_inst = io_cpu_is_unicore ? _T_227[31:0] : _T_232; // @[frontend.scala 624:28]
  assign BranchDecode_1_io_pc = _T_234[39:0]; // @[frontend.scala 626:34]
  assign BranchDecode_1_io_is_unicore = io_cpu_is_unicore; // @[frontend.scala 637:38]
  assign BreakpointUnit_1_clock = clock;
  assign BreakpointUnit_1_reset = reset;
  assign BreakpointUnit_1_io_status_debug = io_cpu_status_debug; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_cease = io_cpu_status_cease; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_wfi = io_cpu_status_wfi; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_isa = io_cpu_status_isa; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_dprv = io_cpu_status_dprv; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_prv = io_cpu_status_prv; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_sd = io_cpu_status_sd; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_zero2 = io_cpu_status_zero2; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_sxl = io_cpu_status_sxl; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_uxl = io_cpu_status_uxl; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_sd_rv32 = io_cpu_status_sd_rv32; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_zero1 = io_cpu_status_zero1; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_tsr = io_cpu_status_tsr; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_tw = io_cpu_status_tw; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_tvm = io_cpu_status_tvm; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_mxr = io_cpu_status_mxr; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_sum = io_cpu_status_sum; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_mprv = io_cpu_status_mprv; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_xs = io_cpu_status_xs; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_fs = io_cpu_status_fs; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_mpp = io_cpu_status_mpp; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_vs = io_cpu_status_vs; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_spp = io_cpu_status_spp; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_mpie = io_cpu_status_mpie; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_hpie = io_cpu_status_hpie; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_spie = io_cpu_status_spie; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_upie = io_cpu_status_upie; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_mie = io_cpu_status_mie; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_hie = io_cpu_status_hie; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_sie = io_cpu_status_sie; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_status_uie = io_cpu_status_uie; // @[frontend.scala 612:23]
  assign BreakpointUnit_1_io_pc = _T_342[38:0]; // @[frontend.scala 684:38]
  assign BreakpointUnit_1_io_ea = 39'h0;
  assign RVCExpander_2_clock = clock;
  assign RVCExpander_2_reset = reset;
  assign RVCExpander_2_io_in = _T_227[47:16]; // @[frontend.scala 688:29]
  assign BranchDecode_2_clock = clock;
  assign BranchDecode_2_reset = reset;
  assign BranchDecode_2_io_inst = io_cpu_is_unicore ? f3_fetch_bundle_insts_1 : _T_339; // @[frontend.scala 674:27]
  assign BranchDecode_2_io_pc = f3_aligned_pc + 40'h2; // @[frontend.scala 675:32]
  assign BranchDecode_2_io_is_unicore = io_cpu_is_unicore; // @[frontend.scala 679:37]
  assign BreakpointUnit_2_clock = clock;
  assign BreakpointUnit_2_reset = reset;
  assign BreakpointUnit_2_io_status_debug = io_cpu_status_debug; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_cease = io_cpu_status_cease; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_wfi = io_cpu_status_wfi; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_isa = io_cpu_status_isa; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_dprv = io_cpu_status_dprv; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_prv = io_cpu_status_prv; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_sd = io_cpu_status_sd; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_zero2 = io_cpu_status_zero2; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_sxl = io_cpu_status_sxl; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_uxl = io_cpu_status_uxl; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_sd_rv32 = io_cpu_status_sd_rv32; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_zero1 = io_cpu_status_zero1; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_tsr = io_cpu_status_tsr; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_tw = io_cpu_status_tw; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_tvm = io_cpu_status_tvm; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_mxr = io_cpu_status_mxr; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_sum = io_cpu_status_sum; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_mprv = io_cpu_status_mprv; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_xs = io_cpu_status_xs; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_fs = io_cpu_status_fs; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_mpp = io_cpu_status_mpp; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_vs = io_cpu_status_vs; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_spp = io_cpu_status_spp; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_mpie = io_cpu_status_mpie; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_hpie = io_cpu_status_hpie; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_spie = io_cpu_status_spie; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_upie = io_cpu_status_upie; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_mie = io_cpu_status_mie; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_hie = io_cpu_status_hie; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_sie = io_cpu_status_sie; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_status_uie = io_cpu_status_uie; // @[frontend.scala 612:23]
  assign BreakpointUnit_2_io_pc = _T_452[38:0]; // @[frontend.scala 684:38]
  assign BreakpointUnit_2_io_ea = 39'h0;
  assign RVCExpander_3_clock = clock;
  assign RVCExpander_3_reset = reset;
  assign RVCExpander_3_io_in = _T_227[63:32]; // @[frontend.scala 695:29]
  assign BranchDecode_3_clock = clock;
  assign BranchDecode_3_reset = reset;
  assign BranchDecode_3_io_inst = io_cpu_is_unicore ? f3_fetch_bundle_insts_2 : _T_449; // @[frontend.scala 674:27]
  assign BranchDecode_3_io_pc = f3_aligned_pc + 40'h4; // @[frontend.scala 675:32]
  assign BranchDecode_3_io_is_unicore = io_cpu_is_unicore; // @[frontend.scala 679:37]
  assign BreakpointUnit_3_clock = clock;
  assign BreakpointUnit_3_reset = reset;
  assign BreakpointUnit_3_io_status_debug = io_cpu_status_debug; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_cease = io_cpu_status_cease; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_wfi = io_cpu_status_wfi; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_isa = io_cpu_status_isa; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_dprv = io_cpu_status_dprv; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_prv = io_cpu_status_prv; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_sd = io_cpu_status_sd; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_zero2 = io_cpu_status_zero2; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_sxl = io_cpu_status_sxl; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_uxl = io_cpu_status_uxl; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_sd_rv32 = io_cpu_status_sd_rv32; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_zero1 = io_cpu_status_zero1; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_tsr = io_cpu_status_tsr; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_tw = io_cpu_status_tw; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_tvm = io_cpu_status_tvm; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_mxr = io_cpu_status_mxr; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_sum = io_cpu_status_sum; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_mprv = io_cpu_status_mprv; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_xs = io_cpu_status_xs; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_fs = io_cpu_status_fs; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_mpp = io_cpu_status_mpp; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_vs = io_cpu_status_vs; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_spp = io_cpu_status_spp; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_mpie = io_cpu_status_mpie; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_hpie = io_cpu_status_hpie; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_spie = io_cpu_status_spie; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_upie = io_cpu_status_upie; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_mie = io_cpu_status_mie; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_hie = io_cpu_status_hie; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_sie = io_cpu_status_sie; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_status_uie = io_cpu_status_uie; // @[frontend.scala 612:23]
  assign BreakpointUnit_3_io_pc = _T_561[38:0]; // @[frontend.scala 684:38]
  assign BreakpointUnit_3_io_ea = 39'h0;
  assign RVCExpander_4_clock = clock;
  assign RVCExpander_4_reset = reset;
  assign RVCExpander_4_io_in = {16'h0,lo_4}; // @[Cat.scala 30:58]
  assign BranchDecode_4_clock = clock;
  assign BranchDecode_4_reset = reset;
  assign BranchDecode_4_io_inst = io_cpu_is_unicore ? f3_fetch_bundle_insts_3 : _T_558; // @[frontend.scala 674:27]
  assign BranchDecode_4_io_pc = f3_aligned_pc + 40'h6; // @[frontend.scala 675:32]
  assign BranchDecode_4_io_is_unicore = io_cpu_is_unicore; // @[frontend.scala 679:37]
  assign f4_btb_corrections_clock = clock;
  assign f4_btb_corrections_reset = reset;
  assign f4_btb_corrections_io_enq_valid = _T_686 & (f3_btb_mispredicts_0 | f3_btb_mispredicts_1 | f3_btb_mispredicts_2
     | f3_btb_mispredicts_3); // @[frontend.scala 857:55]
  assign f4_btb_corrections_io_enq_bits_is_mispredict_update = 1'h0; // @[frontend.scala 859:55]
  assign f4_btb_corrections_io_enq_bits_is_repair_update = 1'h0; // @[frontend.scala 860:55]
  assign f4_btb_corrections_io_enq_bits_btb_mispredicts = {hi_5,lo_5}; // @[frontend.scala 861:77]
  assign f4_btb_corrections_io_enq_bits_pc = f3_io_deq_bits_pc; // @[frontend.scala 572:29 frontend.scala 581:22]
  assign f4_btb_corrections_io_enq_bits_br_mask = 4'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_idx_valid = 1'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_idx_bits = 2'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_taken = 1'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_mispredicted = 1'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_is_br = 1'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_is_jal = 1'h0;
  assign f4_btb_corrections_io_enq_bits_cfi_is_jalr = 1'h0;
  assign f4_btb_corrections_io_enq_bits_ghist_old_history = f3_io_deq_bits_ghist_old_history; // @[frontend.scala 572:29 frontend.scala 774:28]
  assign f4_btb_corrections_io_enq_bits_ghist_current_saw_branch_not_taken =
    f3_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 572:29 frontend.scala 774:28]
  assign f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_not_taken = f3_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 572:29 frontend.scala 774:28]
  assign f4_btb_corrections_io_enq_bits_ghist_new_saw_branch_taken = f3_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 572:29 frontend.scala 774:28]
  assign f4_btb_corrections_io_enq_bits_ghist_ras_idx = f3_io_deq_bits_ghist_ras_idx; // @[frontend.scala 572:29 frontend.scala 774:28]
  assign f4_btb_corrections_io_enq_bits_lhist_0 = f3_bpd_resp_io_deq_bits_lhist_0; // @[frontend.scala 572:29 frontend.scala 775:28]
  assign f4_btb_corrections_io_enq_bits_target = 40'h0;
  assign f4_btb_corrections_io_enq_bits_meta_0 = f3_bpd_resp_io_deq_bits_meta_0; // @[frontend.scala 572:29 frontend.scala 776:28]
  assign f4_btb_corrections_io_deq_ready = bpd_update_arbiter_io_in_1_ready; // @[frontend.scala 943:31]
  assign f4_clock = clock;
  assign f4_reset = reset | f3_clear; // @[frontend.scala 872:35]
  assign f4_io_enq_valid = f3_io_deq_valid & ~f3_clear; // @[frontend.scala 922:38]
  assign f4_io_enq_bits_pc = f3_io_deq_bits_pc; // @[frontend.scala 572:29 frontend.scala 581:22]
  assign f4_io_enq_bits_next_pc = f3_redirects_0 | f3_redirects_1 | f3_redirects_2 | f3_redirects_3 ? _T_705 : _T_710; // @[frontend.scala 798:32]
  assign f4_io_enq_bits_edge_inst_0 = f3_prev_is_half; // @[frontend.scala 639:34 frontend.scala 645:40 frontend.scala 668:40]
  assign f4_io_enq_bits_insts_0 = f3_prev_is_half ? _T_228 : _T_227[31:0]; // @[frontend.scala 639:34 frontend.scala 640:40 frontend.scala 663:40]
  assign f4_io_enq_bits_insts_1 = _T_227[47:16]; // @[frontend.scala 688:29]
  assign f4_io_enq_bits_insts_2 = _T_227[63:32]; // @[frontend.scala 695:29]
  assign f4_io_enq_bits_insts_3 = {16'h0,lo_4}; // @[Cat.scala 30:58]
  assign f4_io_enq_bits_exp_insts_0 = f3_prev_is_half ? _T_231 : _T_233; // @[frontend.scala 639:34 frontend.scala 642:40 frontend.scala 665:40]
  assign f4_io_enq_bits_exp_insts_1 = io_cpu_is_unicore ? f3_fetch_bundle_insts_1 : _T_339; // @[frontend.scala 674:27]
  assign f4_io_enq_bits_exp_insts_2 = io_cpu_is_unicore ? f3_fetch_bundle_insts_2 : _T_449; // @[frontend.scala 674:27]
  assign f4_io_enq_bits_exp_insts_3 = io_cpu_is_unicore ? f3_fetch_bundle_insts_3 : _T_558; // @[frontend.scala 674:27]
  assign f4_io_enq_bits_sfbs_0 = _T_275 & _T_277; // @[frontend.scala 733:33]
  assign f4_io_enq_bits_sfbs_1 = _T_385 & _T_387; // @[frontend.scala 733:33]
  assign f4_io_enq_bits_sfbs_2 = _T_494 & _T_496; // @[frontend.scala 733:33]
  assign f4_io_enq_bits_sfbs_3 = _T_609 & _T_611; // @[frontend.scala 733:33]
  assign f4_io_enq_bits_sfb_masks_0 = 8'hfe & _T_318; // @[frontend.scala 736:68]
  assign f4_io_enq_bits_sfb_masks_1 = 8'hfc & _T_428; // @[frontend.scala 736:68]
  assign f4_io_enq_bits_sfb_masks_2 = 8'hf8 & _T_537; // @[frontend.scala 736:68]
  assign f4_io_enq_bits_sfb_masks_3 = 8'hf0 & _T_652; // @[frontend.scala 736:68]
  assign f4_io_enq_bits_sfb_dests_0 = _T_269[3:0]; // @[frontend.scala 572:29 frontend.scala 740:42]
  assign f4_io_enq_bits_sfb_dests_1 = _T_379[3:0]; // @[frontend.scala 572:29 frontend.scala 740:42]
  assign f4_io_enq_bits_sfb_dests_2 = _T_488[3:0]; // @[frontend.scala 572:29 frontend.scala 740:42]
  assign f4_io_enq_bits_sfb_dests_3 = _T_603[3:0]; // @[frontend.scala 572:29 frontend.scala 740:42]
  assign f4_io_enq_bits_shadowable_mask_0 = _T_323 & _T_326; // @[frontend.scala 738:62]
  assign f4_io_enq_bits_shadowable_mask_1 = _T_433 & _T_436; // @[frontend.scala 738:62]
  assign f4_io_enq_bits_shadowable_mask_2 = _T_542 & _T_545; // @[frontend.scala 738:62]
  assign f4_io_enq_bits_shadowable_mask_3 = _T_657 & _T_660; // @[frontend.scala 738:62]
  assign f4_io_enq_bits_shadowed_mask_0 = 1'h0; // @[frontend.scala 915:23 frontend.scala 916:22 frontend.scala 918:22]
  assign f4_io_enq_bits_shadowed_mask_1 = 1'h0; // @[frontend.scala 915:23 frontend.scala 916:22 frontend.scala 918:22]
  assign f4_io_enq_bits_shadowed_mask_2 = 1'h0; // @[frontend.scala 915:23 frontend.scala 916:22 frontend.scala 918:22]
  assign f4_io_enq_bits_shadowed_mask_3 = 1'h0; // @[frontend.scala 915:23 frontend.scala 916:22 frontend.scala 918:22]
  assign f4_io_enq_bits_cfi_idx_valid = _T_698 | f3_redirects_3; // @[frontend.scala 791:57]
  assign f4_io_enq_bits_cfi_idx_bits = f3_redirects_0 ? 2'h0 : _T_695; // @[Mux.scala 47:69]
  assign f4_io_enq_bits_cfi_type = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_cfi_types_3 : _GEN_97; // @[frontend.scala 769:33 frontend.scala 769:33]
  assign f4_io_enq_bits_cfi_is_call = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_call_mask_3 : _GEN_101; // @[frontend.scala 770:33 frontend.scala 770:33]
  assign f4_io_enq_bits_cfi_is_ret = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? f3_ret_mask_3 : _GEN_105; // @[frontend.scala 771:33 frontend.scala 771:33]
  assign f4_io_enq_bits_cfi_npc_plus4 = 2'h3 == f3_fetch_bundle_cfi_idx_bits ? _T_573 : _GEN_109; // @[frontend.scala 772:33 frontend.scala 772:33]
  assign f4_io_enq_bits_ras_top = ras_io_read_addr; // @[frontend.scala 572:29 frontend.scala 794:27]
  assign f4_io_enq_bits_ftq_idx = 5'h0; // @[frontend.scala 572:29 frontend.scala 582:27]
  assign f4_io_enq_bits_mask = {hi_2,lo_2}; // @[frontend.scala 579:35]
  assign f4_io_enq_bits_br_mask = {hi_3,lo_3}; // @[frontend.scala 580:41]
  assign f4_io_enq_bits_ghist_old_history = f3_io_deq_bits_ghist_old_history; // @[frontend.scala 572:29 frontend.scala 774:28]
  assign f4_io_enq_bits_ghist_current_saw_branch_not_taken = f3_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 572:29 frontend.scala 774:28]
  assign f4_io_enq_bits_ghist_new_saw_branch_not_taken = f3_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 572:29 frontend.scala 774:28]
  assign f4_io_enq_bits_ghist_new_saw_branch_taken = f3_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 572:29 frontend.scala 774:28]
  assign f4_io_enq_bits_ghist_ras_idx = f3_io_deq_bits_ghist_ras_idx; // @[frontend.scala 572:29 frontend.scala 774:28]
  assign f4_io_enq_bits_lhist_0 = f3_bpd_resp_io_deq_bits_lhist_0; // @[frontend.scala 572:29 frontend.scala 775:28]
  assign f4_io_enq_bits_xcpt_pf_if = f3_io_deq_bits_xcpt_pf_inst; // @[frontend.scala 572:29 frontend.scala 583:30]
  assign f4_io_enq_bits_xcpt_ae_if = f3_io_deq_bits_xcpt_ae_inst; // @[frontend.scala 572:29 frontend.scala 584:30]
  assign f4_io_enq_bits_bp_debug_if_oh_0 = BreakpointUnit_io_debug_if; // @[frontend.scala 572:29 frontend.scala 755:41]
  assign f4_io_enq_bits_bp_debug_if_oh_1 = BreakpointUnit_1_io_debug_if; // @[frontend.scala 572:29 frontend.scala 755:41]
  assign f4_io_enq_bits_bp_debug_if_oh_2 = BreakpointUnit_2_io_debug_if; // @[frontend.scala 572:29 frontend.scala 755:41]
  assign f4_io_enq_bits_bp_debug_if_oh_3 = BreakpointUnit_3_io_debug_if; // @[frontend.scala 572:29 frontend.scala 755:41]
  assign f4_io_enq_bits_bp_xcpt_if_oh_0 = BreakpointUnit_io_xcpt_if; // @[frontend.scala 572:29 frontend.scala 756:41]
  assign f4_io_enq_bits_bp_xcpt_if_oh_1 = BreakpointUnit_1_io_xcpt_if; // @[frontend.scala 572:29 frontend.scala 756:41]
  assign f4_io_enq_bits_bp_xcpt_if_oh_2 = BreakpointUnit_2_io_xcpt_if; // @[frontend.scala 572:29 frontend.scala 756:41]
  assign f4_io_enq_bits_bp_xcpt_if_oh_3 = BreakpointUnit_3_io_xcpt_if; // @[frontend.scala 572:29 frontend.scala 756:41]
  assign f4_io_enq_bits_end_half_valid = ~_T_568 & ~_T_682; // @[frontend.scala 762:69]
  assign f4_io_enq_bits_end_half_bits = f3_fetch_bundle_insts_3[15:0]; // @[frontend.scala 760:40]
  assign f4_io_enq_bits_bpd_meta_0 = f3_bpd_resp_io_deq_bits_meta_0; // @[frontend.scala 572:29 frontend.scala 776:28]
  assign f4_io_enq_bits_fsrc = f3_io_deq_valid & f4_ready ? _GEN_170 : f3_io_deq_bits_fsrc; // @[frontend.scala 828:38 frontend.scala 585:24]
  assign f4_io_enq_bits_tsrc = f3_io_deq_bits_tsrc; // @[frontend.scala 572:29 frontend.scala 586:24]
  assign f4_io_deq_ready = fb_io_enq_ready & ftq_io_enq_ready & ~f4_delay; // @[frontend.scala 924:58]
  assign fb_clock = clock;
  assign fb_reset = reset;
  assign fb_io_enq_valid = f4_io_deq_valid & ftq_io_enq_ready & _T_939; // @[frontend.scala 926:58]
  assign fb_io_enq_bits_pc = f4_io_deq_bits_pc; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_next_pc = f4_io_deq_bits_next_pc; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_edge_inst_0 = f4_io_deq_bits_edge_inst_0; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_insts_0 = f4_io_deq_bits_insts_0; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_insts_1 = f4_io_deq_bits_insts_1; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_insts_2 = f4_io_deq_bits_insts_2; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_insts_3 = f4_io_deq_bits_insts_3; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_exp_insts_0 = f4_io_deq_bits_exp_insts_0; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_exp_insts_1 = f4_io_deq_bits_exp_insts_1; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_exp_insts_2 = f4_io_deq_bits_exp_insts_2; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_exp_insts_3 = f4_io_deq_bits_exp_insts_3; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_sfbs_0 = 1'h0; // @[frontend.scala 929:88]
  assign fb_io_enq_bits_sfbs_1 = 1'h0; // @[frontend.scala 929:88]
  assign fb_io_enq_bits_sfbs_2 = 1'h0; // @[frontend.scala 929:88]
  assign fb_io_enq_bits_sfbs_3 = 1'h0; // @[frontend.scala 929:88]
  assign fb_io_enq_bits_sfb_masks_0 = f4_io_deq_bits_sfb_masks_0; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_sfb_masks_1 = f4_io_deq_bits_sfb_masks_1; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_sfb_masks_2 = f4_io_deq_bits_sfb_masks_2; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_sfb_masks_3 = f4_io_deq_bits_sfb_masks_3; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_sfb_dests_0 = f4_io_deq_bits_sfb_dests_0; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_sfb_dests_1 = f4_io_deq_bits_sfb_dests_1; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_sfb_dests_2 = f4_io_deq_bits_sfb_dests_2; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_sfb_dests_3 = f4_io_deq_bits_sfb_dests_3; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_shadowable_mask_0 = f4_io_deq_bits_shadowable_mask_0; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_shadowable_mask_1 = f4_io_deq_bits_shadowable_mask_1; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_shadowable_mask_2 = f4_io_deq_bits_shadowable_mask_2; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_shadowable_mask_3 = f4_io_deq_bits_shadowable_mask_3; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_shadowed_mask_0 = _T_952[0]; // @[frontend.scala 933:5]
  assign fb_io_enq_bits_shadowed_mask_1 = _T_952[1]; // @[frontend.scala 933:5]
  assign fb_io_enq_bits_shadowed_mask_2 = _T_952[2]; // @[frontend.scala 933:5]
  assign fb_io_enq_bits_shadowed_mask_3 = _T_952[3]; // @[frontend.scala 933:5]
  assign fb_io_enq_bits_cfi_idx_valid = f4_io_deq_bits_cfi_idx_valid; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_cfi_idx_bits = f4_io_deq_bits_cfi_idx_bits; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_cfi_type = f4_io_deq_bits_cfi_type; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_cfi_is_call = f4_io_deq_bits_cfi_is_call; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_cfi_is_ret = f4_io_deq_bits_cfi_is_ret; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_cfi_npc_plus4 = f4_io_deq_bits_cfi_npc_plus4; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_ras_top = f4_io_deq_bits_ras_top; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_ftq_idx = ftq_io_enq_idx; // @[frontend.scala 928:26]
  assign fb_io_enq_bits_mask = f4_io_deq_bits_mask; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_br_mask = f4_io_deq_bits_br_mask; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_ghist_old_history = f4_io_deq_bits_ghist_old_history; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_ghist_current_saw_branch_not_taken = f4_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_ghist_new_saw_branch_not_taken = f4_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_ghist_new_saw_branch_taken = f4_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_ghist_ras_idx = f4_io_deq_bits_ghist_ras_idx; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_lhist_0 = f4_io_deq_bits_lhist_0; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_xcpt_pf_if = f4_io_deq_bits_xcpt_pf_if; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_xcpt_ae_if = f4_io_deq_bits_xcpt_ae_if; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_bp_debug_if_oh_0 = f4_io_deq_bits_bp_debug_if_oh_0; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_bp_debug_if_oh_1 = f4_io_deq_bits_bp_debug_if_oh_1; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_bp_debug_if_oh_2 = f4_io_deq_bits_bp_debug_if_oh_2; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_bp_debug_if_oh_3 = f4_io_deq_bits_bp_debug_if_oh_3; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_bp_xcpt_if_oh_0 = f4_io_deq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_bp_xcpt_if_oh_1 = f4_io_deq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_bp_xcpt_if_oh_2 = f4_io_deq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_bp_xcpt_if_oh_3 = f4_io_deq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_end_half_valid = f4_io_deq_bits_end_half_valid; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_end_half_bits = f4_io_deq_bits_end_half_bits; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_bpd_meta_0 = f4_io_deq_bits_bpd_meta_0; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_fsrc = f4_io_deq_bits_fsrc; // @[frontend.scala 927:19]
  assign fb_io_enq_bits_tsrc = f4_io_deq_bits_tsrc; // @[frontend.scala 927:19]
  assign fb_io_deq_ready = io_cpu_fetchpacket_ready; // @[frontend.scala 958:22]
  assign fb_io_clear = io_cpu_sfence_valid | io_cpu_redirect_flush; // @[frontend.scala 967:30 frontend.scala 968:17]
  assign ftq_clock = clock;
  assign ftq_reset = reset;
  assign ftq_io_enq_valid = f4_io_deq_valid & fb_io_enq_ready & _T_939; // @[frontend.scala 936:67]
  assign ftq_io_enq_bits_pc = f4_io_deq_bits_pc; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_next_pc = f4_io_deq_bits_next_pc; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_edge_inst_0 = f4_io_deq_bits_edge_inst_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_insts_0 = f4_io_deq_bits_insts_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_insts_1 = f4_io_deq_bits_insts_1; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_insts_2 = f4_io_deq_bits_insts_2; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_insts_3 = f4_io_deq_bits_insts_3; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_exp_insts_0 = f4_io_deq_bits_exp_insts_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_exp_insts_1 = f4_io_deq_bits_exp_insts_1; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_exp_insts_2 = f4_io_deq_bits_exp_insts_2; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_exp_insts_3 = f4_io_deq_bits_exp_insts_3; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfbs_0 = f4_io_deq_bits_sfbs_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfbs_1 = f4_io_deq_bits_sfbs_1; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfbs_2 = f4_io_deq_bits_sfbs_2; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfbs_3 = f4_io_deq_bits_sfbs_3; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfb_masks_0 = f4_io_deq_bits_sfb_masks_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfb_masks_1 = f4_io_deq_bits_sfb_masks_1; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfb_masks_2 = f4_io_deq_bits_sfb_masks_2; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfb_masks_3 = f4_io_deq_bits_sfb_masks_3; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfb_dests_0 = f4_io_deq_bits_sfb_dests_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfb_dests_1 = f4_io_deq_bits_sfb_dests_1; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfb_dests_2 = f4_io_deq_bits_sfb_dests_2; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_sfb_dests_3 = f4_io_deq_bits_sfb_dests_3; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_shadowable_mask_0 = f4_io_deq_bits_shadowable_mask_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_shadowable_mask_1 = f4_io_deq_bits_shadowable_mask_1; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_shadowable_mask_2 = f4_io_deq_bits_shadowable_mask_2; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_shadowable_mask_3 = f4_io_deq_bits_shadowable_mask_3; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_shadowed_mask_0 = f4_io_deq_bits_shadowed_mask_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_shadowed_mask_1 = f4_io_deq_bits_shadowed_mask_1; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_shadowed_mask_2 = f4_io_deq_bits_shadowed_mask_2; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_shadowed_mask_3 = f4_io_deq_bits_shadowed_mask_3; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_cfi_idx_valid = f4_io_deq_bits_cfi_idx_valid; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_cfi_idx_bits = f4_io_deq_bits_cfi_idx_bits; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_cfi_type = f4_io_deq_bits_cfi_type; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_cfi_is_call = f4_io_deq_bits_cfi_is_call; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_cfi_is_ret = f4_io_deq_bits_cfi_is_ret; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_cfi_npc_plus4 = f4_io_deq_bits_cfi_npc_plus4; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_ras_top = f4_io_deq_bits_ras_top; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_ftq_idx = f4_io_deq_bits_ftq_idx; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_mask = f4_io_deq_bits_mask; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_br_mask = f4_io_deq_bits_br_mask; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_ghist_old_history = f4_io_deq_bits_ghist_old_history; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_ghist_current_saw_branch_not_taken = f4_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_ghist_new_saw_branch_not_taken = f4_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_ghist_new_saw_branch_taken = f4_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_ghist_ras_idx = f4_io_deq_bits_ghist_ras_idx; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_lhist_0 = f4_io_deq_bits_lhist_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_xcpt_pf_if = f4_io_deq_bits_xcpt_pf_if; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_xcpt_ae_if = f4_io_deq_bits_xcpt_ae_if; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_bp_debug_if_oh_0 = f4_io_deq_bits_bp_debug_if_oh_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_bp_debug_if_oh_1 = f4_io_deq_bits_bp_debug_if_oh_1; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_bp_debug_if_oh_2 = f4_io_deq_bits_bp_debug_if_oh_2; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_bp_debug_if_oh_3 = f4_io_deq_bits_bp_debug_if_oh_3; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_bp_xcpt_if_oh_0 = f4_io_deq_bits_bp_xcpt_if_oh_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_bp_xcpt_if_oh_1 = f4_io_deq_bits_bp_xcpt_if_oh_1; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_bp_xcpt_if_oh_2 = f4_io_deq_bits_bp_xcpt_if_oh_2; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_bp_xcpt_if_oh_3 = f4_io_deq_bits_bp_xcpt_if_oh_3; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_end_half_valid = f4_io_deq_bits_end_half_valid; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_end_half_bits = f4_io_deq_bits_end_half_bits; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_bpd_meta_0 = f4_io_deq_bits_bpd_meta_0; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_fsrc = f4_io_deq_bits_fsrc; // @[frontend.scala 937:29]
  assign ftq_io_enq_bits_tsrc = f4_io_deq_bits_tsrc; // @[frontend.scala 937:29]
  assign ftq_io_deq_valid = io_cpu_commit_valid; // @[frontend.scala 960:14]
  assign ftq_io_deq_bits = io_cpu_commit_bits[4:0]; // @[frontend.scala 960:14]
  assign ftq_io_get_ftq_pc_0_ftq_idx = io_cpu_get_pc_0_ftq_idx; // @[frontend.scala 959:17]
  assign ftq_io_get_ftq_pc_1_ftq_idx = io_cpu_get_pc_1_ftq_idx; // @[frontend.scala 959:17]
  assign ftq_io_get_ftq_pc_2_ftq_idx = io_cpu_get_pc_2_ftq_idx; // @[frontend.scala 959:17]
  assign ftq_io_get_ftq_pc_3_ftq_idx = io_cpu_get_pc_3_ftq_idx; // @[frontend.scala 959:17]
  assign ftq_io_debug_ftq_idx_0 = io_cpu_debug_ftq_idx_0; // @[frontend.scala 998:24]
  assign ftq_io_debug_ftq_idx_1 = io_cpu_debug_ftq_idx_1; // @[frontend.scala 998:24]
  assign ftq_io_redirect_valid = io_cpu_redirect_val; // @[frontend.scala 967:30 frontend.scala 963:27]
  assign ftq_io_redirect_bits = io_cpu_redirect_ftq_idx; // @[frontend.scala 967:30 frontend.scala 964:27]
  assign ftq_io_brupdate_b1_resolve_mask = io_cpu_brupdate_b1_resolve_mask; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b1_mispredict_mask = io_cpu_brupdate_b1_mispredict_mask; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_switch = io_cpu_brupdate_b2_uop_switch; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_switch_off = io_cpu_brupdate_b2_uop_switch_off; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_is_unicore = io_cpu_brupdate_b2_uop_is_unicore; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_shift = io_cpu_brupdate_b2_uop_shift; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_lrs3_rtype = io_cpu_brupdate_b2_uop_lrs3_rtype; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_rflag = io_cpu_brupdate_b2_uop_rflag; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_wflag = io_cpu_brupdate_b2_uop_wflag; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_prflag = io_cpu_brupdate_b2_uop_prflag; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_pwflag = io_cpu_brupdate_b2_uop_pwflag; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_pflag_busy = io_cpu_brupdate_b2_uop_pflag_busy; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_stale_pflag = io_cpu_brupdate_b2_uop_stale_pflag; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_op1_sel = io_cpu_brupdate_b2_uop_op1_sel; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_op2_sel = io_cpu_brupdate_b2_uop_op2_sel; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_split_num = io_cpu_brupdate_b2_uop_split_num; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_self_index = io_cpu_brupdate_b2_uop_self_index; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_rob_inst_idx = io_cpu_brupdate_b2_uop_rob_inst_idx; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_address_num = io_cpu_brupdate_b2_uop_address_num; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_uopc = io_cpu_brupdate_b2_uop_uopc; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_inst = io_cpu_brupdate_b2_uop_inst; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_debug_inst = io_cpu_brupdate_b2_uop_debug_inst; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_is_rvc = io_cpu_brupdate_b2_uop_is_rvc; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_debug_pc = io_cpu_brupdate_b2_uop_debug_pc; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_iq_type = io_cpu_brupdate_b2_uop_iq_type; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_fu_code = io_cpu_brupdate_b2_uop_fu_code; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ctrl_br_type = io_cpu_brupdate_b2_uop_ctrl_br_type; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ctrl_op1_sel = io_cpu_brupdate_b2_uop_ctrl_op1_sel; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ctrl_op2_sel = io_cpu_brupdate_b2_uop_ctrl_op2_sel; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ctrl_imm_sel = io_cpu_brupdate_b2_uop_ctrl_imm_sel; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ctrl_op_fcn = io_cpu_brupdate_b2_uop_ctrl_op_fcn; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ctrl_fcn_dw = io_cpu_brupdate_b2_uop_ctrl_fcn_dw; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ctrl_csr_cmd = io_cpu_brupdate_b2_uop_ctrl_csr_cmd; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ctrl_is_load = io_cpu_brupdate_b2_uop_ctrl_is_load; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ctrl_is_sta = io_cpu_brupdate_b2_uop_ctrl_is_sta; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ctrl_is_std = io_cpu_brupdate_b2_uop_ctrl_is_std; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ctrl_op3_sel = io_cpu_brupdate_b2_uop_ctrl_op3_sel; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_iw_state = io_cpu_brupdate_b2_uop_iw_state; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_iw_p1_poisoned = io_cpu_brupdate_b2_uop_iw_p1_poisoned; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_iw_p2_poisoned = io_cpu_brupdate_b2_uop_iw_p2_poisoned; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_is_br = io_cpu_brupdate_b2_uop_is_br; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_is_jalr = io_cpu_brupdate_b2_uop_is_jalr; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_is_jal = io_cpu_brupdate_b2_uop_is_jal; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_is_sfb = io_cpu_brupdate_b2_uop_is_sfb; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_br_mask = io_cpu_brupdate_b2_uop_br_mask; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_br_tag = io_cpu_brupdate_b2_uop_br_tag; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ftq_idx = io_cpu_brupdate_b2_uop_ftq_idx; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_edge_inst = io_cpu_brupdate_b2_uop_edge_inst; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_pc_lob = io_cpu_brupdate_b2_uop_pc_lob; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_taken = io_cpu_brupdate_b2_uop_taken; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_imm_packed = io_cpu_brupdate_b2_uop_imm_packed; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_csr_addr = io_cpu_brupdate_b2_uop_csr_addr; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_rob_idx = io_cpu_brupdate_b2_uop_rob_idx; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ldq_idx = io_cpu_brupdate_b2_uop_ldq_idx; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_stq_idx = io_cpu_brupdate_b2_uop_stq_idx; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_rxq_idx = io_cpu_brupdate_b2_uop_rxq_idx; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_pdst = io_cpu_brupdate_b2_uop_pdst; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_prs1 = io_cpu_brupdate_b2_uop_prs1; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_prs2 = io_cpu_brupdate_b2_uop_prs2; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_prs3 = io_cpu_brupdate_b2_uop_prs3; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ppred = io_cpu_brupdate_b2_uop_ppred; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_prs1_busy = io_cpu_brupdate_b2_uop_prs1_busy; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_prs2_busy = io_cpu_brupdate_b2_uop_prs2_busy; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_prs3_busy = io_cpu_brupdate_b2_uop_prs3_busy; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ppred_busy = io_cpu_brupdate_b2_uop_ppred_busy; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_stale_pdst = io_cpu_brupdate_b2_uop_stale_pdst; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_exception = io_cpu_brupdate_b2_uop_exception; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_exc_cause = io_cpu_brupdate_b2_uop_exc_cause; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_bypassable = io_cpu_brupdate_b2_uop_bypassable; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_mem_cmd = io_cpu_brupdate_b2_uop_mem_cmd; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_mem_size = io_cpu_brupdate_b2_uop_mem_size; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_mem_signed = io_cpu_brupdate_b2_uop_mem_signed; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_is_fence = io_cpu_brupdate_b2_uop_is_fence; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_is_fencei = io_cpu_brupdate_b2_uop_is_fencei; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_is_amo = io_cpu_brupdate_b2_uop_is_amo; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_uses_ldq = io_cpu_brupdate_b2_uop_uses_ldq; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_uses_stq = io_cpu_brupdate_b2_uop_uses_stq; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_is_sys_pc2epc = io_cpu_brupdate_b2_uop_is_sys_pc2epc; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_is_unique = io_cpu_brupdate_b2_uop_is_unique; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_flush_on_commit = io_cpu_brupdate_b2_uop_flush_on_commit; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ldst_is_rs1 = io_cpu_brupdate_b2_uop_ldst_is_rs1; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ldst = io_cpu_brupdate_b2_uop_ldst; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_lrs1 = io_cpu_brupdate_b2_uop_lrs1; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_lrs2 = io_cpu_brupdate_b2_uop_lrs2; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_lrs3 = io_cpu_brupdate_b2_uop_lrs3; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_ldst_val = io_cpu_brupdate_b2_uop_ldst_val; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_dst_rtype = io_cpu_brupdate_b2_uop_dst_rtype; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_lrs1_rtype = io_cpu_brupdate_b2_uop_lrs1_rtype; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_lrs2_rtype = io_cpu_brupdate_b2_uop_lrs2_rtype; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_frs3_en = io_cpu_brupdate_b2_uop_frs3_en; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_fp_val = io_cpu_brupdate_b2_uop_fp_val; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_fp_single = io_cpu_brupdate_b2_uop_fp_single; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_xcpt_pf_if = io_cpu_brupdate_b2_uop_xcpt_pf_if; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_xcpt_ae_if = io_cpu_brupdate_b2_uop_xcpt_ae_if; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_xcpt_ma_if = io_cpu_brupdate_b2_uop_xcpt_ma_if; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_bp_debug_if = io_cpu_brupdate_b2_uop_bp_debug_if; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_bp_xcpt_if = io_cpu_brupdate_b2_uop_bp_xcpt_if; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_debug_fsrc = io_cpu_brupdate_b2_uop_debug_fsrc; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_uop_debug_tsrc = io_cpu_brupdate_b2_uop_debug_tsrc; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_valid = io_cpu_brupdate_b2_valid; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_mispredict = io_cpu_brupdate_b2_mispredict; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_taken = io_cpu_brupdate_b2_taken; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_cfi_type = io_cpu_brupdate_b2_cfi_type; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_pc_sel = io_cpu_brupdate_b2_pc_sel; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_jalr_target = io_cpu_brupdate_b2_jalr_target; // @[frontend.scala 961:19]
  assign ftq_io_brupdate_b2_target_offset = io_cpu_brupdate_b2_target_offset; // @[frontend.scala 961:19]
  assign bpd_update_arbiter_clock = clock;
  assign bpd_update_arbiter_reset = reset;
  assign bpd_update_arbiter_io_in_0_valid = ftq_io_bpdupdate_valid; // @[frontend.scala 940:37]
  assign bpd_update_arbiter_io_in_0_bits_is_mispredict_update = ftq_io_bpdupdate_bits_is_mispredict_update; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_is_repair_update = ftq_io_bpdupdate_bits_is_repair_update; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_btb_mispredicts = ftq_io_bpdupdate_bits_btb_mispredicts; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_pc = ftq_io_bpdupdate_bits_pc; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_br_mask = ftq_io_bpdupdate_bits_br_mask; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_idx_valid = ftq_io_bpdupdate_bits_cfi_idx_valid; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_idx_bits = ftq_io_bpdupdate_bits_cfi_idx_bits; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_taken = ftq_io_bpdupdate_bits_cfi_taken; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_mispredicted = ftq_io_bpdupdate_bits_cfi_mispredicted; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_is_br = ftq_io_bpdupdate_bits_cfi_is_br; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_is_jal = ftq_io_bpdupdate_bits_cfi_is_jal; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_cfi_is_jalr = ftq_io_bpdupdate_bits_cfi_is_jalr; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_ghist_old_history = ftq_io_bpdupdate_bits_ghist_old_history; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_ghist_current_saw_branch_not_taken =
    ftq_io_bpdupdate_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_not_taken =
    ftq_io_bpdupdate_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_ghist_new_saw_branch_taken = ftq_io_bpdupdate_bits_ghist_new_saw_branch_taken; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_ghist_ras_idx = ftq_io_bpdupdate_bits_ghist_ras_idx; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_lhist_0 = ftq_io_bpdupdate_bits_lhist_0; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_target = ftq_io_bpdupdate_bits_target; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_0_bits_meta_0 = ftq_io_bpdupdate_bits_meta_0; // @[frontend.scala 941:37]
  assign bpd_update_arbiter_io_in_1_valid = f4_btb_corrections_io_deq_valid; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_is_mispredict_update = f4_btb_corrections_io_deq_bits_is_mispredict_update; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_is_repair_update = f4_btb_corrections_io_deq_bits_is_repair_update; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_btb_mispredicts = f4_btb_corrections_io_deq_bits_btb_mispredicts; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_pc = f4_btb_corrections_io_deq_bits_pc; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_br_mask = f4_btb_corrections_io_deq_bits_br_mask; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_idx_valid = f4_btb_corrections_io_deq_bits_cfi_idx_valid; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_idx_bits = f4_btb_corrections_io_deq_bits_cfi_idx_bits; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_taken = f4_btb_corrections_io_deq_bits_cfi_taken; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_mispredicted = f4_btb_corrections_io_deq_bits_cfi_mispredicted; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_is_br = f4_btb_corrections_io_deq_bits_cfi_is_br; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_is_jal = f4_btb_corrections_io_deq_bits_cfi_is_jal; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_cfi_is_jalr = f4_btb_corrections_io_deq_bits_cfi_is_jalr; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_ghist_old_history = f4_btb_corrections_io_deq_bits_ghist_old_history; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_ghist_current_saw_branch_not_taken =
    f4_btb_corrections_io_deq_bits_ghist_current_saw_branch_not_taken; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_not_taken =
    f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_not_taken; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_ghist_new_saw_branch_taken =
    f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_taken; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_ghist_ras_idx = f4_btb_corrections_io_deq_bits_ghist_ras_idx; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_lhist_0 = f4_btb_corrections_io_deq_bits_lhist_0; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_target = f4_btb_corrections_io_deq_bits_target; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_in_1_bits_meta_0 = f4_btb_corrections_io_deq_bits_meta_0; // @[frontend.scala 943:31]
  assign bpd_update_arbiter_io_out_ready = 1'h1; // @[frontend.scala 945:35]
  always @(posedge clock) begin
    REG <= reset; // @[frontend.scala 366:23]
    s1_vpc <= _GEN_225[39:0]; // @[frontend.scala 384:29]
    if (reset) begin // @[frontend.scala 385:29]
      s1_valid <= 1'h0; // @[frontend.scala 385:29]
    end else if (io_cpu_sfence_valid) begin // @[frontend.scala 967:30]
      s1_valid <= 1'h0; // @[frontend.scala 974:18]
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 979:38]
      s1_valid <= io_cpu_redirect_val; // @[frontend.scala 988:18]
    end else if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 828:38]
      s1_valid <= _GEN_161;
    end else begin
      s1_valid <= _GEN_65;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 967:30]
      s1_ghist_old_history <= _GEN_192;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 979:38]
      s1_ghist_old_history <= io_cpu_redirect_ghist_old_history; // @[frontend.scala 990:18]
    end else begin
      s1_ghist_old_history <= _GEN_192;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 967:30]
      s1_ghist_current_saw_branch_not_taken <= _GEN_191;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 979:38]
      s1_ghist_current_saw_branch_not_taken <= io_cpu_redirect_ghist_current_saw_branch_not_taken; // @[frontend.scala 990:18]
    end else begin
      s1_ghist_current_saw_branch_not_taken <= _GEN_191;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 967:30]
      s1_ghist_new_saw_branch_not_taken <= _GEN_190;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 979:38]
      s1_ghist_new_saw_branch_not_taken <= io_cpu_redirect_ghist_new_saw_branch_not_taken; // @[frontend.scala 990:18]
    end else begin
      s1_ghist_new_saw_branch_not_taken <= _GEN_190;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 967:30]
      s1_ghist_new_saw_branch_taken <= _GEN_189;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 979:38]
      s1_ghist_new_saw_branch_taken <= io_cpu_redirect_ghist_new_saw_branch_taken; // @[frontend.scala 990:18]
    end else begin
      s1_ghist_new_saw_branch_taken <= _GEN_189;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 967:30]
      s1_ghist_ras_idx <= _GEN_188;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 979:38]
      s1_ghist_ras_idx <= io_cpu_redirect_ghist_ras_idx; // @[frontend.scala 990:18]
    end else begin
      s1_ghist_ras_idx <= _GEN_188;
    end
    if (io_cpu_sfence_valid) begin // @[frontend.scala 967:30]
      s1_is_replay <= 1'h0; // @[frontend.scala 976:18]
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 979:38]
      s1_is_replay <= 1'h0; // @[frontend.scala 992:18]
    end else if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 828:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 835:79]
        s1_is_replay <= _GEN_67;
      end else begin
        s1_is_replay <= _GEN_141;
      end
    end else begin
      s1_is_replay <= _GEN_67;
    end
    s1_is_sfence <= io_cpu_sfence_valid; // @[frontend.scala 967:30 frontend.scala 977:18]
    if (io_cpu_sfence_valid) begin // @[frontend.scala 967:30]
      s1_tsrc <= _GEN_193;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 979:38]
      s1_tsrc <= 2'h3; // @[frontend.scala 991:18]
    end else begin
      s1_tsrc <= _GEN_193;
    end
    if (reset) begin // @[frontend.scala 443:25]
      s2_valid <= 1'h0; // @[frontend.scala 443:25]
    end else begin
      s2_valid <= s1_valid & _T_7; // @[frontend.scala 443:25]
    end
    s2_vpc <= s1_vpc; // @[frontend.scala 444:25]
    if (reset) begin // @[frontend.scala 592:32]
      f3_prev_is_half <= 1'h0; // @[frontend.scala 592:32]
    end else if (io_cpu_sfence_valid) begin // @[frontend.scala 967:30]
      f3_prev_is_half <= _GEN_172;
    end else if (io_cpu_redirect_flush) begin // @[frontend.scala 979:38]
      f3_prev_is_half <= 1'h0; // @[frontend.scala 986:21]
    end else begin
      f3_prev_is_half <= _GEN_172;
    end
    if (_T_686) begin // @[frontend.scala 781:27]
      f3_prev_half <= last_inst; // @[frontend.scala 783:21]
    end
    if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 828:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 835:79]
        s2_ghist_old_history <= _GEN_80;
      end else if (~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist) begin // @[frontend.scala 837:99]
        s2_ghist_old_history <= f3_predicted_ghist_old_history; // @[frontend.scala 838:16]
      end else begin
        s2_ghist_old_history <= _GEN_80;
      end
    end else begin
      s2_ghist_old_history <= _GEN_80;
    end
    if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 828:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 835:79]
        s2_ghist_new_saw_branch_not_taken <= _GEN_78;
      end else if (~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist) begin // @[frontend.scala 837:99]
        s2_ghist_new_saw_branch_not_taken <= 1'h0; // @[frontend.scala 838:16]
      end else begin
        s2_ghist_new_saw_branch_not_taken <= _GEN_78;
      end
    end else begin
      s2_ghist_new_saw_branch_not_taken <= _GEN_78;
    end
    if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 828:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 835:79]
        s2_ghist_new_saw_branch_taken <= _GEN_77;
      end else if (~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist) begin // @[frontend.scala 837:99]
        s2_ghist_new_saw_branch_taken <= 1'h0; // @[frontend.scala 838:16]
      end else begin
        s2_ghist_new_saw_branch_taken <= _GEN_77;
      end
    end else begin
      s2_ghist_new_saw_branch_taken <= _GEN_77;
    end
    if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 828:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 835:79]
        s2_ghist_current_saw_branch_not_taken <= _GEN_79;
      end else if (~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist) begin // @[frontend.scala 837:99]
        s2_ghist_current_saw_branch_not_taken <= 1'h0; // @[frontend.scala 838:16]
      end else begin
        s2_ghist_current_saw_branch_not_taken <= _GEN_79;
      end
    end else begin
      s2_ghist_current_saw_branch_not_taken <= _GEN_79;
    end
    REG_1_valid <= io_cpu_sfence_valid; // @[frontend.scala 396:35]
    REG_1_bits_rs1 <= io_cpu_sfence_bits_rs1; // @[frontend.scala 396:35]
    REG_1_bits_rs2 <= io_cpu_sfence_bits_rs2; // @[frontend.scala 396:35]
    REG_1_bits_addr <= io_cpu_sfence_bits_addr; // @[frontend.scala 396:35]
    REG_1_bits_asid <= io_cpu_sfence_bits_asid; // @[frontend.scala 396:35]
    REG_2_pf_inst <= s2_tlb_resp_pf_inst; // @[frontend.scala 358:28 frontend.scala 511:18]
    REG_2_ae_inst <= s2_tlb_resp_ae_inst; // @[frontend.scala 358:28 frontend.scala 511:18]
    REG_3 <= s2_ppc; // @[frontend.scala 360:28 frontend.scala 512:18]
    if (f3_io_deq_valid & f4_ready) begin // @[frontend.scala 828:38]
      if (s2_valid & s2_vpc == f3_predicted_target & ~f3_correct_f2_ghist) begin // @[frontend.scala 835:79]
        s2_ghist_ras_idx <= _GEN_76;
      end else if (~s2_valid & s1_valid & s1_vpc == f3_predicted_target & ~f3_correct_f1_ghist) begin // @[frontend.scala 837:99]
        if (_T_699 & f3_fetch_bundle_cfi_is_call) begin // @[frontend.scala 124:31]
          s2_ghist_ras_idx <= _T_740;
        end else begin
          s2_ghist_ras_idx <= _T_746;
        end
      end else begin
        s2_ghist_ras_idx <= _GEN_76;
      end
    end else begin
      s2_ghist_ras_idx <= _GEN_76;
    end
    if (s1_is_replay) begin // @[frontend.scala 401:20]
      s2_ppc <= REG_3;
    end else begin
      s2_ppc <= tlb_io_resp_paddr;
    end
    s2_tsrc <= s1_tsrc; // @[frontend.scala 448:24]
    if (s1_is_replay) begin // @[frontend.scala 400:24]
      s2_tlb_resp_pf_inst <= REG_2_pf_inst;
    end else begin
      s2_tlb_resp_pf_inst <= tlb_io_resp_pf_inst;
    end
    if (s1_is_replay) begin // @[frontend.scala 400:24]
      s2_tlb_resp_ae_inst <= REG_2_ae_inst;
    end else begin
      s2_tlb_resp_ae_inst <= tlb_io_resp_ae_inst;
    end
    s2_tlb_miss <= _T_5 & tlb_io_resp_miss; // @[frontend.scala 399:35]
    REG_4 <= s1_is_replay; // @[frontend.scala 453:29]
    if (reset) begin // @[frontend.scala 543:29]
      ras_read_idx <= 5'h0; // @[frontend.scala 543:29]
    end else if (_T_217) begin // @[frontend.scala 545:27]
      ras_read_idx <= f3_io_enq_bits_ghist_ras_idx; // @[frontend.scala 546:18]
    end
    REG_5 <= f3_io_enq_ready; // @[frontend.scala 552:57]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_686 & ~(f3_bpd_resp_io_deq_bits_pc == f3_fetch_bundle_pc | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at frontend.scala:784 assert(f3_bpd_resp.io.deq.bits.pc === f3_fetch_bundle.pc)\n"); // @[frontend.scala 784:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_686 & ~(f3_bpd_resp_io_deq_bits_pc == f3_fetch_bundle_pc | reset)) begin
          $fatal; // @[frontend.scala 784:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(bpd_update_arbiter_io_in_0_ready | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at frontend.scala:942 assert(bpd_update_arbiter.io.in(0).ready)\n"
            ); // @[frontend.scala 942:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(bpd_update_arbiter_io_in_0_ready | reset)) begin
          $fatal; // @[frontend.scala 942:9]
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
  REG = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  s1_vpc = _RAND_1[39:0];
  _RAND_2 = {1{`RANDOM}};
  s1_valid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_ghist_old_history = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  s1_ghist_current_saw_branch_not_taken = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  s1_ghist_new_saw_branch_not_taken = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s1_ghist_new_saw_branch_taken = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s1_ghist_ras_idx = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  s1_is_replay = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s1_is_sfence = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s1_tsrc = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  s2_valid = _RAND_11[0:0];
  _RAND_12 = {2{`RANDOM}};
  s2_vpc = _RAND_12[39:0];
  _RAND_13 = {1{`RANDOM}};
  f3_prev_is_half = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  f3_prev_half = _RAND_14[15:0];
  _RAND_15 = {1{`RANDOM}};
  s2_ghist_old_history = _RAND_15[15:0];
  _RAND_16 = {1{`RANDOM}};
  s2_ghist_new_saw_branch_not_taken = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  s2_ghist_new_saw_branch_taken = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  s2_ghist_current_saw_branch_not_taken = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  REG_1_valid = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  REG_1_bits_rs1 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  REG_1_bits_rs2 = _RAND_21[0:0];
  _RAND_22 = {2{`RANDOM}};
  REG_1_bits_addr = _RAND_22[38:0];
  _RAND_23 = {1{`RANDOM}};
  REG_1_bits_asid = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  REG_2_pf_inst = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  REG_2_ae_inst = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  REG_3 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  s2_ghist_ras_idx = _RAND_27[4:0];
  _RAND_28 = {1{`RANDOM}};
  s2_ppc = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  s2_tsrc = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  s2_tlb_resp_pf_inst = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  s2_tlb_resp_ae_inst = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  s2_tlb_miss = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  REG_4 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  ras_read_idx = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  REG_5 = _RAND_35[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
