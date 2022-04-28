module BranchKillableQueue_2(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input         io_enq_bits_uop_switch,
  input         io_enq_bits_uop_switch_off,
  input         io_enq_bits_uop_is_unicore,
  input  [2:0]  io_enq_bits_uop_shift,
  input  [1:0]  io_enq_bits_uop_lrs3_rtype,
  input         io_enq_bits_uop_rflag,
  input         io_enq_bits_uop_wflag,
  input  [3:0]  io_enq_bits_uop_prflag,
  input  [3:0]  io_enq_bits_uop_pwflag,
  input         io_enq_bits_uop_pflag_busy,
  input  [3:0]  io_enq_bits_uop_stale_pflag,
  input  [3:0]  io_enq_bits_uop_op1_sel,
  input  [3:0]  io_enq_bits_uop_op2_sel,
  input  [5:0]  io_enq_bits_uop_split_num,
  input  [5:0]  io_enq_bits_uop_self_index,
  input  [5:0]  io_enq_bits_uop_rob_inst_idx,
  input  [5:0]  io_enq_bits_uop_address_num,
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
  input  [1:0]  io_enq_bits_uop_ctrl_op3_sel,
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
  input  [4:0]  io_enq_bits_uop_ldq_idx,
  input  [4:0]  io_enq_bits_uop_stq_idx,
  input  [1:0]  io_enq_bits_uop_rxq_idx,
  input  [6:0]  io_enq_bits_uop_pdst,
  input  [6:0]  io_enq_bits_uop_prs1,
  input  [6:0]  io_enq_bits_uop_prs2,
  input  [6:0]  io_enq_bits_uop_prs3,
  input  [4:0]  io_enq_bits_uop_ppred,
  input         io_enq_bits_uop_prs1_busy,
  input         io_enq_bits_uop_prs2_busy,
  input         io_enq_bits_uop_prs3_busy,
  input         io_enq_bits_uop_ppred_busy,
  input  [6:0]  io_enq_bits_uop_stale_pdst,
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
  input  [63:0] io_enq_bits_data,
  input         io_enq_bits_is_hella,
  input         io_deq_ready,
  output        io_deq_valid,
  output        io_deq_bits_uop_switch,
  output        io_deq_bits_uop_switch_off,
  output        io_deq_bits_uop_is_unicore,
  output [2:0]  io_deq_bits_uop_shift,
  output [1:0]  io_deq_bits_uop_lrs3_rtype,
  output        io_deq_bits_uop_rflag,
  output        io_deq_bits_uop_wflag,
  output [3:0]  io_deq_bits_uop_prflag,
  output [3:0]  io_deq_bits_uop_pwflag,
  output        io_deq_bits_uop_pflag_busy,
  output [3:0]  io_deq_bits_uop_stale_pflag,
  output [3:0]  io_deq_bits_uop_op1_sel,
  output [3:0]  io_deq_bits_uop_op2_sel,
  output [5:0]  io_deq_bits_uop_split_num,
  output [5:0]  io_deq_bits_uop_self_index,
  output [5:0]  io_deq_bits_uop_rob_inst_idx,
  output [5:0]  io_deq_bits_uop_address_num,
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
  output [1:0]  io_deq_bits_uop_ctrl_op3_sel,
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
  output [4:0]  io_deq_bits_uop_ldq_idx,
  output [4:0]  io_deq_bits_uop_stq_idx,
  output [1:0]  io_deq_bits_uop_rxq_idx,
  output [6:0]  io_deq_bits_uop_pdst,
  output [6:0]  io_deq_bits_uop_prs1,
  output [6:0]  io_deq_bits_uop_prs2,
  output [6:0]  io_deq_bits_uop_prs3,
  output [4:0]  io_deq_bits_uop_ppred,
  output        io_deq_bits_uop_prs1_busy,
  output        io_deq_bits_uop_prs2_busy,
  output        io_deq_bits_uop_prs3_busy,
  output        io_deq_bits_uop_ppred_busy,
  output [6:0]  io_deq_bits_uop_stale_pdst,
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
  output [63:0] io_deq_bits_data,
  output        io_deq_bits_is_hella,
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
  input         io_flush,
  output        io_empty,
  output [1:0]  io_count
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
  reg [63:0] _RAND_27;
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
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [63:0] _RAND_71;
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
  reg [63:0] _RAND_124;
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
  reg [63:0] _RAND_168;
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
  reg [63:0] _RAND_221;
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
  reg [31:0] _RAND_256;
  reg [31:0] _RAND_257;
  reg [31:0] _RAND_258;
  reg [31:0] _RAND_259;
  reg [31:0] _RAND_260;
  reg [31:0] _RAND_261;
  reg [31:0] _RAND_262;
  reg [31:0] _RAND_263;
  reg [31:0] _RAND_264;
  reg [63:0] _RAND_265;
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
  reg [63:0] _RAND_318;
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
  reg [63:0] _RAND_362;
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
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram_data [0:3]; // @[util.scala 535:20]
  wire [63:0] ram_data_MPORT_1_data; // @[util.scala 535:20]
  wire [1:0] ram_data_MPORT_1_addr; // @[util.scala 535:20]
  wire [63:0] ram_data_MPORT_data; // @[util.scala 535:20]
  wire [1:0] ram_data_MPORT_addr; // @[util.scala 535:20]
  wire  ram_data_MPORT_mask; // @[util.scala 535:20]
  wire  ram_data_MPORT_en; // @[util.scala 535:20]
  reg  ram_is_hella [0:3]; // @[util.scala 535:20]
  wire  ram_is_hella_MPORT_1_data; // @[util.scala 535:20]
  wire [1:0] ram_is_hella_MPORT_1_addr; // @[util.scala 535:20]
  wire  ram_is_hella_MPORT_data; // @[util.scala 535:20]
  wire [1:0] ram_is_hella_MPORT_addr; // @[util.scala 535:20]
  wire  ram_is_hella_MPORT_mask; // @[util.scala 535:20]
  wire  ram_is_hella_MPORT_en; // @[util.scala 535:20]
  reg  valids_0; // @[util.scala 536:24]
  reg  valids_1; // @[util.scala 536:24]
  reg  valids_2; // @[util.scala 536:24]
  reg  valids_3; // @[util.scala 536:24]
  reg  uops_0_switch; // @[util.scala 537:20]
  reg  uops_0_switch_off; // @[util.scala 537:20]
  reg  uops_0_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_0_shift; // @[util.scala 537:20]
  reg [1:0] uops_0_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_0_rflag; // @[util.scala 537:20]
  reg  uops_0_wflag; // @[util.scala 537:20]
  reg [3:0] uops_0_prflag; // @[util.scala 537:20]
  reg [3:0] uops_0_pwflag; // @[util.scala 537:20]
  reg  uops_0_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_0_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_0_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_0_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_0_split_num; // @[util.scala 537:20]
  reg [5:0] uops_0_self_index; // @[util.scala 537:20]
  reg [5:0] uops_0_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_0_address_num; // @[util.scala 537:20]
  reg [6:0] uops_0_uopc; // @[util.scala 537:20]
  reg [31:0] uops_0_inst; // @[util.scala 537:20]
  reg [31:0] uops_0_debug_inst; // @[util.scala 537:20]
  reg  uops_0_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_0_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_0_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_0_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_0_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_0_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_0_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_0_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_0_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_0_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_0_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_0_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_0_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_0_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_0_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_0_iw_state; // @[util.scala 537:20]
  reg  uops_0_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_0_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_0_is_br; // @[util.scala 537:20]
  reg  uops_0_is_jalr; // @[util.scala 537:20]
  reg  uops_0_is_jal; // @[util.scala 537:20]
  reg  uops_0_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_0_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_0_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_0_ftq_idx; // @[util.scala 537:20]
  reg  uops_0_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_0_pc_lob; // @[util.scala 537:20]
  reg  uops_0_taken; // @[util.scala 537:20]
  reg [19:0] uops_0_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_0_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_0_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_0_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_0_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_0_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_0_pdst; // @[util.scala 537:20]
  reg [6:0] uops_0_prs1; // @[util.scala 537:20]
  reg [6:0] uops_0_prs2; // @[util.scala 537:20]
  reg [6:0] uops_0_prs3; // @[util.scala 537:20]
  reg [4:0] uops_0_ppred; // @[util.scala 537:20]
  reg  uops_0_prs1_busy; // @[util.scala 537:20]
  reg  uops_0_prs2_busy; // @[util.scala 537:20]
  reg  uops_0_prs3_busy; // @[util.scala 537:20]
  reg  uops_0_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_0_stale_pdst; // @[util.scala 537:20]
  reg  uops_0_exception; // @[util.scala 537:20]
  reg [63:0] uops_0_exc_cause; // @[util.scala 537:20]
  reg  uops_0_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_0_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_0_mem_size; // @[util.scala 537:20]
  reg  uops_0_mem_signed; // @[util.scala 537:20]
  reg  uops_0_is_fence; // @[util.scala 537:20]
  reg  uops_0_is_fencei; // @[util.scala 537:20]
  reg  uops_0_is_amo; // @[util.scala 537:20]
  reg  uops_0_uses_ldq; // @[util.scala 537:20]
  reg  uops_0_uses_stq; // @[util.scala 537:20]
  reg  uops_0_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_0_is_unique; // @[util.scala 537:20]
  reg  uops_0_flush_on_commit; // @[util.scala 537:20]
  reg  uops_0_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_0_ldst; // @[util.scala 537:20]
  reg [5:0] uops_0_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_0_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_0_lrs3; // @[util.scala 537:20]
  reg  uops_0_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_0_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_0_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_0_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_0_frs3_en; // @[util.scala 537:20]
  reg  uops_0_fp_val; // @[util.scala 537:20]
  reg  uops_0_fp_single; // @[util.scala 537:20]
  reg  uops_0_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_0_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_0_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_0_bp_debug_if; // @[util.scala 537:20]
  reg  uops_0_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_0_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_0_debug_tsrc; // @[util.scala 537:20]
  reg  uops_1_switch; // @[util.scala 537:20]
  reg  uops_1_switch_off; // @[util.scala 537:20]
  reg  uops_1_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_1_shift; // @[util.scala 537:20]
  reg [1:0] uops_1_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_1_rflag; // @[util.scala 537:20]
  reg  uops_1_wflag; // @[util.scala 537:20]
  reg [3:0] uops_1_prflag; // @[util.scala 537:20]
  reg [3:0] uops_1_pwflag; // @[util.scala 537:20]
  reg  uops_1_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_1_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_1_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_1_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_1_split_num; // @[util.scala 537:20]
  reg [5:0] uops_1_self_index; // @[util.scala 537:20]
  reg [5:0] uops_1_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_1_address_num; // @[util.scala 537:20]
  reg [6:0] uops_1_uopc; // @[util.scala 537:20]
  reg [31:0] uops_1_inst; // @[util.scala 537:20]
  reg [31:0] uops_1_debug_inst; // @[util.scala 537:20]
  reg  uops_1_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_1_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_1_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_1_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_1_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_1_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_1_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_1_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_1_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_1_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_1_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_1_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_1_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_1_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_1_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_1_iw_state; // @[util.scala 537:20]
  reg  uops_1_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_1_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_1_is_br; // @[util.scala 537:20]
  reg  uops_1_is_jalr; // @[util.scala 537:20]
  reg  uops_1_is_jal; // @[util.scala 537:20]
  reg  uops_1_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_1_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_1_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_1_ftq_idx; // @[util.scala 537:20]
  reg  uops_1_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_1_pc_lob; // @[util.scala 537:20]
  reg  uops_1_taken; // @[util.scala 537:20]
  reg [19:0] uops_1_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_1_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_1_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_1_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_1_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_1_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_1_pdst; // @[util.scala 537:20]
  reg [6:0] uops_1_prs1; // @[util.scala 537:20]
  reg [6:0] uops_1_prs2; // @[util.scala 537:20]
  reg [6:0] uops_1_prs3; // @[util.scala 537:20]
  reg [4:0] uops_1_ppred; // @[util.scala 537:20]
  reg  uops_1_prs1_busy; // @[util.scala 537:20]
  reg  uops_1_prs2_busy; // @[util.scala 537:20]
  reg  uops_1_prs3_busy; // @[util.scala 537:20]
  reg  uops_1_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_1_stale_pdst; // @[util.scala 537:20]
  reg  uops_1_exception; // @[util.scala 537:20]
  reg [63:0] uops_1_exc_cause; // @[util.scala 537:20]
  reg  uops_1_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_1_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_1_mem_size; // @[util.scala 537:20]
  reg  uops_1_mem_signed; // @[util.scala 537:20]
  reg  uops_1_is_fence; // @[util.scala 537:20]
  reg  uops_1_is_fencei; // @[util.scala 537:20]
  reg  uops_1_is_amo; // @[util.scala 537:20]
  reg  uops_1_uses_ldq; // @[util.scala 537:20]
  reg  uops_1_uses_stq; // @[util.scala 537:20]
  reg  uops_1_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_1_is_unique; // @[util.scala 537:20]
  reg  uops_1_flush_on_commit; // @[util.scala 537:20]
  reg  uops_1_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_1_ldst; // @[util.scala 537:20]
  reg [5:0] uops_1_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_1_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_1_lrs3; // @[util.scala 537:20]
  reg  uops_1_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_1_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_1_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_1_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_1_frs3_en; // @[util.scala 537:20]
  reg  uops_1_fp_val; // @[util.scala 537:20]
  reg  uops_1_fp_single; // @[util.scala 537:20]
  reg  uops_1_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_1_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_1_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_1_bp_debug_if; // @[util.scala 537:20]
  reg  uops_1_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_1_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_1_debug_tsrc; // @[util.scala 537:20]
  reg  uops_2_switch; // @[util.scala 537:20]
  reg  uops_2_switch_off; // @[util.scala 537:20]
  reg  uops_2_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_2_shift; // @[util.scala 537:20]
  reg [1:0] uops_2_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_2_rflag; // @[util.scala 537:20]
  reg  uops_2_wflag; // @[util.scala 537:20]
  reg [3:0] uops_2_prflag; // @[util.scala 537:20]
  reg [3:0] uops_2_pwflag; // @[util.scala 537:20]
  reg  uops_2_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_2_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_2_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_2_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_2_split_num; // @[util.scala 537:20]
  reg [5:0] uops_2_self_index; // @[util.scala 537:20]
  reg [5:0] uops_2_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_2_address_num; // @[util.scala 537:20]
  reg [6:0] uops_2_uopc; // @[util.scala 537:20]
  reg [31:0] uops_2_inst; // @[util.scala 537:20]
  reg [31:0] uops_2_debug_inst; // @[util.scala 537:20]
  reg  uops_2_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_2_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_2_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_2_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_2_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_2_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_2_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_2_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_2_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_2_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_2_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_2_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_2_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_2_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_2_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_2_iw_state; // @[util.scala 537:20]
  reg  uops_2_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_2_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_2_is_br; // @[util.scala 537:20]
  reg  uops_2_is_jalr; // @[util.scala 537:20]
  reg  uops_2_is_jal; // @[util.scala 537:20]
  reg  uops_2_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_2_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_2_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_2_ftq_idx; // @[util.scala 537:20]
  reg  uops_2_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_2_pc_lob; // @[util.scala 537:20]
  reg  uops_2_taken; // @[util.scala 537:20]
  reg [19:0] uops_2_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_2_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_2_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_2_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_2_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_2_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_2_pdst; // @[util.scala 537:20]
  reg [6:0] uops_2_prs1; // @[util.scala 537:20]
  reg [6:0] uops_2_prs2; // @[util.scala 537:20]
  reg [6:0] uops_2_prs3; // @[util.scala 537:20]
  reg [4:0] uops_2_ppred; // @[util.scala 537:20]
  reg  uops_2_prs1_busy; // @[util.scala 537:20]
  reg  uops_2_prs2_busy; // @[util.scala 537:20]
  reg  uops_2_prs3_busy; // @[util.scala 537:20]
  reg  uops_2_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_2_stale_pdst; // @[util.scala 537:20]
  reg  uops_2_exception; // @[util.scala 537:20]
  reg [63:0] uops_2_exc_cause; // @[util.scala 537:20]
  reg  uops_2_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_2_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_2_mem_size; // @[util.scala 537:20]
  reg  uops_2_mem_signed; // @[util.scala 537:20]
  reg  uops_2_is_fence; // @[util.scala 537:20]
  reg  uops_2_is_fencei; // @[util.scala 537:20]
  reg  uops_2_is_amo; // @[util.scala 537:20]
  reg  uops_2_uses_ldq; // @[util.scala 537:20]
  reg  uops_2_uses_stq; // @[util.scala 537:20]
  reg  uops_2_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_2_is_unique; // @[util.scala 537:20]
  reg  uops_2_flush_on_commit; // @[util.scala 537:20]
  reg  uops_2_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_2_ldst; // @[util.scala 537:20]
  reg [5:0] uops_2_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_2_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_2_lrs3; // @[util.scala 537:20]
  reg  uops_2_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_2_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_2_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_2_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_2_frs3_en; // @[util.scala 537:20]
  reg  uops_2_fp_val; // @[util.scala 537:20]
  reg  uops_2_fp_single; // @[util.scala 537:20]
  reg  uops_2_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_2_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_2_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_2_bp_debug_if; // @[util.scala 537:20]
  reg  uops_2_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_2_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_2_debug_tsrc; // @[util.scala 537:20]
  reg  uops_3_switch; // @[util.scala 537:20]
  reg  uops_3_switch_off; // @[util.scala 537:20]
  reg  uops_3_is_unicore; // @[util.scala 537:20]
  reg [2:0] uops_3_shift; // @[util.scala 537:20]
  reg [1:0] uops_3_lrs3_rtype; // @[util.scala 537:20]
  reg  uops_3_rflag; // @[util.scala 537:20]
  reg  uops_3_wflag; // @[util.scala 537:20]
  reg [3:0] uops_3_prflag; // @[util.scala 537:20]
  reg [3:0] uops_3_pwflag; // @[util.scala 537:20]
  reg  uops_3_pflag_busy; // @[util.scala 537:20]
  reg [3:0] uops_3_stale_pflag; // @[util.scala 537:20]
  reg [3:0] uops_3_op1_sel; // @[util.scala 537:20]
  reg [3:0] uops_3_op2_sel; // @[util.scala 537:20]
  reg [5:0] uops_3_split_num; // @[util.scala 537:20]
  reg [5:0] uops_3_self_index; // @[util.scala 537:20]
  reg [5:0] uops_3_rob_inst_idx; // @[util.scala 537:20]
  reg [5:0] uops_3_address_num; // @[util.scala 537:20]
  reg [6:0] uops_3_uopc; // @[util.scala 537:20]
  reg [31:0] uops_3_inst; // @[util.scala 537:20]
  reg [31:0] uops_3_debug_inst; // @[util.scala 537:20]
  reg  uops_3_is_rvc; // @[util.scala 537:20]
  reg [39:0] uops_3_debug_pc; // @[util.scala 537:20]
  reg [2:0] uops_3_iq_type; // @[util.scala 537:20]
  reg [9:0] uops_3_fu_code; // @[util.scala 537:20]
  reg [3:0] uops_3_ctrl_br_type; // @[util.scala 537:20]
  reg [1:0] uops_3_ctrl_op1_sel; // @[util.scala 537:20]
  reg [2:0] uops_3_ctrl_op2_sel; // @[util.scala 537:20]
  reg [2:0] uops_3_ctrl_imm_sel; // @[util.scala 537:20]
  reg [3:0] uops_3_ctrl_op_fcn; // @[util.scala 537:20]
  reg  uops_3_ctrl_fcn_dw; // @[util.scala 537:20]
  reg [2:0] uops_3_ctrl_csr_cmd; // @[util.scala 537:20]
  reg  uops_3_ctrl_is_load; // @[util.scala 537:20]
  reg  uops_3_ctrl_is_sta; // @[util.scala 537:20]
  reg  uops_3_ctrl_is_std; // @[util.scala 537:20]
  reg [1:0] uops_3_ctrl_op3_sel; // @[util.scala 537:20]
  reg [1:0] uops_3_iw_state; // @[util.scala 537:20]
  reg  uops_3_iw_p1_poisoned; // @[util.scala 537:20]
  reg  uops_3_iw_p2_poisoned; // @[util.scala 537:20]
  reg  uops_3_is_br; // @[util.scala 537:20]
  reg  uops_3_is_jalr; // @[util.scala 537:20]
  reg  uops_3_is_jal; // @[util.scala 537:20]
  reg  uops_3_is_sfb; // @[util.scala 537:20]
  reg [11:0] uops_3_br_mask; // @[util.scala 537:20]
  reg [3:0] uops_3_br_tag; // @[util.scala 537:20]
  reg [4:0] uops_3_ftq_idx; // @[util.scala 537:20]
  reg  uops_3_edge_inst; // @[util.scala 537:20]
  reg [5:0] uops_3_pc_lob; // @[util.scala 537:20]
  reg  uops_3_taken; // @[util.scala 537:20]
  reg [19:0] uops_3_imm_packed; // @[util.scala 537:20]
  reg [11:0] uops_3_csr_addr; // @[util.scala 537:20]
  reg [5:0] uops_3_rob_idx; // @[util.scala 537:20]
  reg [4:0] uops_3_ldq_idx; // @[util.scala 537:20]
  reg [4:0] uops_3_stq_idx; // @[util.scala 537:20]
  reg [1:0] uops_3_rxq_idx; // @[util.scala 537:20]
  reg [6:0] uops_3_pdst; // @[util.scala 537:20]
  reg [6:0] uops_3_prs1; // @[util.scala 537:20]
  reg [6:0] uops_3_prs2; // @[util.scala 537:20]
  reg [6:0] uops_3_prs3; // @[util.scala 537:20]
  reg [4:0] uops_3_ppred; // @[util.scala 537:20]
  reg  uops_3_prs1_busy; // @[util.scala 537:20]
  reg  uops_3_prs2_busy; // @[util.scala 537:20]
  reg  uops_3_prs3_busy; // @[util.scala 537:20]
  reg  uops_3_ppred_busy; // @[util.scala 537:20]
  reg [6:0] uops_3_stale_pdst; // @[util.scala 537:20]
  reg  uops_3_exception; // @[util.scala 537:20]
  reg [63:0] uops_3_exc_cause; // @[util.scala 537:20]
  reg  uops_3_bypassable; // @[util.scala 537:20]
  reg [4:0] uops_3_mem_cmd; // @[util.scala 537:20]
  reg [1:0] uops_3_mem_size; // @[util.scala 537:20]
  reg  uops_3_mem_signed; // @[util.scala 537:20]
  reg  uops_3_is_fence; // @[util.scala 537:20]
  reg  uops_3_is_fencei; // @[util.scala 537:20]
  reg  uops_3_is_amo; // @[util.scala 537:20]
  reg  uops_3_uses_ldq; // @[util.scala 537:20]
  reg  uops_3_uses_stq; // @[util.scala 537:20]
  reg  uops_3_is_sys_pc2epc; // @[util.scala 537:20]
  reg  uops_3_is_unique; // @[util.scala 537:20]
  reg  uops_3_flush_on_commit; // @[util.scala 537:20]
  reg  uops_3_ldst_is_rs1; // @[util.scala 537:20]
  reg [5:0] uops_3_ldst; // @[util.scala 537:20]
  reg [5:0] uops_3_lrs1; // @[util.scala 537:20]
  reg [5:0] uops_3_lrs2; // @[util.scala 537:20]
  reg [5:0] uops_3_lrs3; // @[util.scala 537:20]
  reg  uops_3_ldst_val; // @[util.scala 537:20]
  reg [1:0] uops_3_dst_rtype; // @[util.scala 537:20]
  reg [1:0] uops_3_lrs1_rtype; // @[util.scala 537:20]
  reg [1:0] uops_3_lrs2_rtype; // @[util.scala 537:20]
  reg  uops_3_frs3_en; // @[util.scala 537:20]
  reg  uops_3_fp_val; // @[util.scala 537:20]
  reg  uops_3_fp_single; // @[util.scala 537:20]
  reg  uops_3_xcpt_pf_if; // @[util.scala 537:20]
  reg  uops_3_xcpt_ae_if; // @[util.scala 537:20]
  reg  uops_3_xcpt_ma_if; // @[util.scala 537:20]
  reg  uops_3_bp_debug_if; // @[util.scala 537:20]
  reg  uops_3_bp_xcpt_if; // @[util.scala 537:20]
  reg [1:0] uops_3_debug_fsrc; // @[util.scala 537:20]
  reg [1:0] uops_3_debug_tsrc; // @[util.scala 537:20]
  reg [1:0] value; // @[Counter.scala 60:40]
  reg [1:0] value_1; // @[Counter.scala 60:40]
  reg  maybe_full; // @[util.scala 541:27]
  wire  ptr_match = value == value_1; // @[util.scala 543:33]
  wire  full = ptr_match & maybe_full; // @[util.scala 545:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_1 = 2'h1 == value_1 ? valids_1 : valids_0; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_2 = 2'h2 == value_1 ? valids_2 : _GEN_1; // @[util.scala 547:42 util.scala 547:42]
  wire  _GEN_3 = 2'h3 == value_1 ? valids_3 : _GEN_2; // @[util.scala 547:42 util.scala 547:42]
  wire  _T_5 = ~io_empty; // @[util.scala 547:69]
  wire  do_deq = (io_deq_ready | ~_GEN_3) & ~io_empty; // @[util.scala 547:66]
  wire [11:0] _T_7 = io_brupdate_b1_mispredict_mask & uops_0_br_mask; // @[util.scala 175:51]
  wire  _T_8 = _T_7 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_14 = ~io_brupdate_b1_resolve_mask; // @[util.scala 146:23]
  wire [11:0] _T_15 = uops_0_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_4 = valids_0 ? _T_15 : uops_0_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_16 = io_brupdate_b1_mispredict_mask & uops_1_br_mask; // @[util.scala 175:51]
  wire  _T_17 = _T_16 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_24 = uops_1_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_5 = valids_1 ? _T_24 : uops_1_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_25 = io_brupdate_b1_mispredict_mask & uops_2_br_mask; // @[util.scala 175:51]
  wire  _T_26 = _T_25 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_33 = uops_2_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_6 = valids_2 ? _T_33 : uops_2_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire [11:0] _T_34 = io_brupdate_b1_mispredict_mask & uops_3_br_mask; // @[util.scala 175:51]
  wire  _T_35 = _T_34 != 12'h0; // @[util.scala 175:59]
  wire [11:0] _T_42 = uops_3_br_mask & _T_14; // @[util.scala 146:21]
  wire [11:0] _GEN_7 = valids_3 ? _T_42 : uops_3_br_mask; // @[util.scala 553:22 util.scala 554:23 util.scala 537:20]
  wire  _GEN_8 = 2'h0 == value | valids_0 & ~_T_8 & ~(io_flush & uops_0_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_9 = 2'h1 == value | valids_1 & ~_T_17 & ~(io_flush & uops_1_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_10 = 2'h2 == value | valids_2 & ~_T_26 & ~(io_flush & uops_2_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire  _GEN_11 = 2'h3 == value | valids_3 & ~_T_35 & ~(io_flush & uops_3_uses_ldq); // @[util.scala 560:33 util.scala 560:33 util.scala 552:16]
  wire [11:0] _T_44 = io_enq_bits_uop_br_mask & _T_14; // @[util.scala 142:25]
  wire [1:0] _value_T_1 = value + 2'h1; // @[Counter.scala 76:24]
  wire  _GEN_507 = do_enq ? _GEN_8 : valids_0 & ~_T_8 & ~(io_flush & uops_0_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_508 = do_enq ? _GEN_9 : valids_1 & ~_T_17 & ~(io_flush & uops_1_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_509 = do_enq ? _GEN_10 : valids_2 & ~_T_26 & ~(io_flush & uops_2_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire  _GEN_510 = do_enq ? _GEN_11 : valids_3 & ~_T_35 & ~(io_flush & uops_3_uses_ldq); // @[util.scala 558:17 util.scala 552:16]
  wire [1:0] _value_T_3 = value_1 + 2'h1; // @[Counter.scala 76:24]
  wire [1:0] _GEN_911 = 2'h1 == value_1 ? uops_1_debug_tsrc : uops_0_debug_tsrc; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_912 = 2'h2 == value_1 ? uops_2_debug_tsrc : _GEN_911; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_915 = 2'h1 == value_1 ? uops_1_debug_fsrc : uops_0_debug_fsrc; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_916 = 2'h2 == value_1 ? uops_2_debug_fsrc : _GEN_915; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_919 = 2'h1 == value_1 ? uops_1_bp_xcpt_if : uops_0_bp_xcpt_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_920 = 2'h2 == value_1 ? uops_2_bp_xcpt_if : _GEN_919; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_923 = 2'h1 == value_1 ? uops_1_bp_debug_if : uops_0_bp_debug_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_924 = 2'h2 == value_1 ? uops_2_bp_debug_if : _GEN_923; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_927 = 2'h1 == value_1 ? uops_1_xcpt_ma_if : uops_0_xcpt_ma_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_928 = 2'h2 == value_1 ? uops_2_xcpt_ma_if : _GEN_927; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_931 = 2'h1 == value_1 ? uops_1_xcpt_ae_if : uops_0_xcpt_ae_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_932 = 2'h2 == value_1 ? uops_2_xcpt_ae_if : _GEN_931; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_935 = 2'h1 == value_1 ? uops_1_xcpt_pf_if : uops_0_xcpt_pf_if; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_936 = 2'h2 == value_1 ? uops_2_xcpt_pf_if : _GEN_935; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_939 = 2'h1 == value_1 ? uops_1_fp_single : uops_0_fp_single; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_940 = 2'h2 == value_1 ? uops_2_fp_single : _GEN_939; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_943 = 2'h1 == value_1 ? uops_1_fp_val : uops_0_fp_val; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_944 = 2'h2 == value_1 ? uops_2_fp_val : _GEN_943; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_947 = 2'h1 == value_1 ? uops_1_frs3_en : uops_0_frs3_en; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_948 = 2'h2 == value_1 ? uops_2_frs3_en : _GEN_947; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_951 = 2'h1 == value_1 ? uops_1_lrs2_rtype : uops_0_lrs2_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_952 = 2'h2 == value_1 ? uops_2_lrs2_rtype : _GEN_951; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_955 = 2'h1 == value_1 ? uops_1_lrs1_rtype : uops_0_lrs1_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_956 = 2'h2 == value_1 ? uops_2_lrs1_rtype : _GEN_955; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_959 = 2'h1 == value_1 ? uops_1_dst_rtype : uops_0_dst_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_960 = 2'h2 == value_1 ? uops_2_dst_rtype : _GEN_959; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_963 = 2'h1 == value_1 ? uops_1_ldst_val : uops_0_ldst_val; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_964 = 2'h2 == value_1 ? uops_2_ldst_val : _GEN_963; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_967 = 2'h1 == value_1 ? uops_1_lrs3 : uops_0_lrs3; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_968 = 2'h2 == value_1 ? uops_2_lrs3 : _GEN_967; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_971 = 2'h1 == value_1 ? uops_1_lrs2 : uops_0_lrs2; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_972 = 2'h2 == value_1 ? uops_2_lrs2 : _GEN_971; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_975 = 2'h1 == value_1 ? uops_1_lrs1 : uops_0_lrs1; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_976 = 2'h2 == value_1 ? uops_2_lrs1 : _GEN_975; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_979 = 2'h1 == value_1 ? uops_1_ldst : uops_0_ldst; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_980 = 2'h2 == value_1 ? uops_2_ldst : _GEN_979; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_983 = 2'h1 == value_1 ? uops_1_ldst_is_rs1 : uops_0_ldst_is_rs1; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_984 = 2'h2 == value_1 ? uops_2_ldst_is_rs1 : _GEN_983; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_987 = 2'h1 == value_1 ? uops_1_flush_on_commit : uops_0_flush_on_commit; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_988 = 2'h2 == value_1 ? uops_2_flush_on_commit : _GEN_987; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_991 = 2'h1 == value_1 ? uops_1_is_unique : uops_0_is_unique; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_992 = 2'h2 == value_1 ? uops_2_is_unique : _GEN_991; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_995 = 2'h1 == value_1 ? uops_1_is_sys_pc2epc : uops_0_is_sys_pc2epc; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_996 = 2'h2 == value_1 ? uops_2_is_sys_pc2epc : _GEN_995; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_999 = 2'h1 == value_1 ? uops_1_uses_stq : uops_0_uses_stq; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1000 = 2'h2 == value_1 ? uops_2_uses_stq : _GEN_999; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1003 = 2'h1 == value_1 ? uops_1_uses_ldq : uops_0_uses_ldq; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1004 = 2'h2 == value_1 ? uops_2_uses_ldq : _GEN_1003; // @[util.scala 579:19 util.scala 579:19]
  wire  out_uop_uses_ldq = 2'h3 == value_1 ? uops_3_uses_ldq : _GEN_1004; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1007 = 2'h1 == value_1 ? uops_1_is_amo : uops_0_is_amo; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1008 = 2'h2 == value_1 ? uops_2_is_amo : _GEN_1007; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1011 = 2'h1 == value_1 ? uops_1_is_fencei : uops_0_is_fencei; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1012 = 2'h2 == value_1 ? uops_2_is_fencei : _GEN_1011; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1015 = 2'h1 == value_1 ? uops_1_is_fence : uops_0_is_fence; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1016 = 2'h2 == value_1 ? uops_2_is_fence : _GEN_1015; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1019 = 2'h1 == value_1 ? uops_1_mem_signed : uops_0_mem_signed; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1020 = 2'h2 == value_1 ? uops_2_mem_signed : _GEN_1019; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1023 = 2'h1 == value_1 ? uops_1_mem_size : uops_0_mem_size; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1024 = 2'h2 == value_1 ? uops_2_mem_size : _GEN_1023; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1027 = 2'h1 == value_1 ? uops_1_mem_cmd : uops_0_mem_cmd; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1028 = 2'h2 == value_1 ? uops_2_mem_cmd : _GEN_1027; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1031 = 2'h1 == value_1 ? uops_1_bypassable : uops_0_bypassable; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1032 = 2'h2 == value_1 ? uops_2_bypassable : _GEN_1031; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_1035 = 2'h1 == value_1 ? uops_1_exc_cause : uops_0_exc_cause; // @[util.scala 579:19 util.scala 579:19]
  wire [63:0] _GEN_1036 = 2'h2 == value_1 ? uops_2_exc_cause : _GEN_1035; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1039 = 2'h1 == value_1 ? uops_1_exception : uops_0_exception; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1040 = 2'h2 == value_1 ? uops_2_exception : _GEN_1039; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1043 = 2'h1 == value_1 ? uops_1_stale_pdst : uops_0_stale_pdst; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1044 = 2'h2 == value_1 ? uops_2_stale_pdst : _GEN_1043; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1047 = 2'h1 == value_1 ? uops_1_ppred_busy : uops_0_ppred_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1048 = 2'h2 == value_1 ? uops_2_ppred_busy : _GEN_1047; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1051 = 2'h1 == value_1 ? uops_1_prs3_busy : uops_0_prs3_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1052 = 2'h2 == value_1 ? uops_2_prs3_busy : _GEN_1051; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1055 = 2'h1 == value_1 ? uops_1_prs2_busy : uops_0_prs2_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1056 = 2'h2 == value_1 ? uops_2_prs2_busy : _GEN_1055; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1059 = 2'h1 == value_1 ? uops_1_prs1_busy : uops_0_prs1_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1060 = 2'h2 == value_1 ? uops_2_prs1_busy : _GEN_1059; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1063 = 2'h1 == value_1 ? uops_1_ppred : uops_0_ppred; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1064 = 2'h2 == value_1 ? uops_2_ppred : _GEN_1063; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1067 = 2'h1 == value_1 ? uops_1_prs3 : uops_0_prs3; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1068 = 2'h2 == value_1 ? uops_2_prs3 : _GEN_1067; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1071 = 2'h1 == value_1 ? uops_1_prs2 : uops_0_prs2; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1072 = 2'h2 == value_1 ? uops_2_prs2 : _GEN_1071; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1075 = 2'h1 == value_1 ? uops_1_prs1 : uops_0_prs1; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1076 = 2'h2 == value_1 ? uops_2_prs1 : _GEN_1075; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1079 = 2'h1 == value_1 ? uops_1_pdst : uops_0_pdst; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1080 = 2'h2 == value_1 ? uops_2_pdst : _GEN_1079; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1083 = 2'h1 == value_1 ? uops_1_rxq_idx : uops_0_rxq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1084 = 2'h2 == value_1 ? uops_2_rxq_idx : _GEN_1083; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1087 = 2'h1 == value_1 ? uops_1_stq_idx : uops_0_stq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1088 = 2'h2 == value_1 ? uops_2_stq_idx : _GEN_1087; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1091 = 2'h1 == value_1 ? uops_1_ldq_idx : uops_0_ldq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1092 = 2'h2 == value_1 ? uops_2_ldq_idx : _GEN_1091; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1095 = 2'h1 == value_1 ? uops_1_rob_idx : uops_0_rob_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1096 = 2'h2 == value_1 ? uops_2_rob_idx : _GEN_1095; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_1099 = 2'h1 == value_1 ? uops_1_csr_addr : uops_0_csr_addr; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_1100 = 2'h2 == value_1 ? uops_2_csr_addr : _GEN_1099; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_1103 = 2'h1 == value_1 ? uops_1_imm_packed : uops_0_imm_packed; // @[util.scala 579:19 util.scala 579:19]
  wire [19:0] _GEN_1104 = 2'h2 == value_1 ? uops_2_imm_packed : _GEN_1103; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1107 = 2'h1 == value_1 ? uops_1_taken : uops_0_taken; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1108 = 2'h2 == value_1 ? uops_2_taken : _GEN_1107; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1111 = 2'h1 == value_1 ? uops_1_pc_lob : uops_0_pc_lob; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1112 = 2'h2 == value_1 ? uops_2_pc_lob : _GEN_1111; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1115 = 2'h1 == value_1 ? uops_1_edge_inst : uops_0_edge_inst; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1116 = 2'h2 == value_1 ? uops_2_edge_inst : _GEN_1115; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1119 = 2'h1 == value_1 ? uops_1_ftq_idx : uops_0_ftq_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [4:0] _GEN_1120 = 2'h2 == value_1 ? uops_2_ftq_idx : _GEN_1119; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1123 = 2'h1 == value_1 ? uops_1_br_tag : uops_0_br_tag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1124 = 2'h2 == value_1 ? uops_2_br_tag : _GEN_1123; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_1127 = 2'h1 == value_1 ? uops_1_br_mask : uops_0_br_mask; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _GEN_1128 = 2'h2 == value_1 ? uops_2_br_mask : _GEN_1127; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] out_uop_br_mask = 2'h3 == value_1 ? uops_3_br_mask : _GEN_1128; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1131 = 2'h1 == value_1 ? uops_1_is_sfb : uops_0_is_sfb; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1132 = 2'h2 == value_1 ? uops_2_is_sfb : _GEN_1131; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1135 = 2'h1 == value_1 ? uops_1_is_jal : uops_0_is_jal; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1136 = 2'h2 == value_1 ? uops_2_is_jal : _GEN_1135; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1139 = 2'h1 == value_1 ? uops_1_is_jalr : uops_0_is_jalr; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1140 = 2'h2 == value_1 ? uops_2_is_jalr : _GEN_1139; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1143 = 2'h1 == value_1 ? uops_1_is_br : uops_0_is_br; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1144 = 2'h2 == value_1 ? uops_2_is_br : _GEN_1143; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1147 = 2'h1 == value_1 ? uops_1_iw_p2_poisoned : uops_0_iw_p2_poisoned; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1148 = 2'h2 == value_1 ? uops_2_iw_p2_poisoned : _GEN_1147; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1151 = 2'h1 == value_1 ? uops_1_iw_p1_poisoned : uops_0_iw_p1_poisoned; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1152 = 2'h2 == value_1 ? uops_2_iw_p1_poisoned : _GEN_1151; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1155 = 2'h1 == value_1 ? uops_1_iw_state : uops_0_iw_state; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1156 = 2'h2 == value_1 ? uops_2_iw_state : _GEN_1155; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1159 = 2'h1 == value_1 ? uops_1_ctrl_op3_sel : uops_0_ctrl_op3_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1160 = 2'h2 == value_1 ? uops_2_ctrl_op3_sel : _GEN_1159; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1163 = 2'h1 == value_1 ? uops_1_ctrl_is_std : uops_0_ctrl_is_std; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1164 = 2'h2 == value_1 ? uops_2_ctrl_is_std : _GEN_1163; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1167 = 2'h1 == value_1 ? uops_1_ctrl_is_sta : uops_0_ctrl_is_sta; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1168 = 2'h2 == value_1 ? uops_2_ctrl_is_sta : _GEN_1167; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1171 = 2'h1 == value_1 ? uops_1_ctrl_is_load : uops_0_ctrl_is_load; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1172 = 2'h2 == value_1 ? uops_2_ctrl_is_load : _GEN_1171; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_1175 = 2'h1 == value_1 ? uops_1_ctrl_csr_cmd : uops_0_ctrl_csr_cmd; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_1176 = 2'h2 == value_1 ? uops_2_ctrl_csr_cmd : _GEN_1175; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1179 = 2'h1 == value_1 ? uops_1_ctrl_fcn_dw : uops_0_ctrl_fcn_dw; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1180 = 2'h2 == value_1 ? uops_2_ctrl_fcn_dw : _GEN_1179; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1183 = 2'h1 == value_1 ? uops_1_ctrl_op_fcn : uops_0_ctrl_op_fcn; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1184 = 2'h2 == value_1 ? uops_2_ctrl_op_fcn : _GEN_1183; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_1187 = 2'h1 == value_1 ? uops_1_ctrl_imm_sel : uops_0_ctrl_imm_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_1188 = 2'h2 == value_1 ? uops_2_ctrl_imm_sel : _GEN_1187; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_1191 = 2'h1 == value_1 ? uops_1_ctrl_op2_sel : uops_0_ctrl_op2_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_1192 = 2'h2 == value_1 ? uops_2_ctrl_op2_sel : _GEN_1191; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1195 = 2'h1 == value_1 ? uops_1_ctrl_op1_sel : uops_0_ctrl_op1_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1196 = 2'h2 == value_1 ? uops_2_ctrl_op1_sel : _GEN_1195; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1199 = 2'h1 == value_1 ? uops_1_ctrl_br_type : uops_0_ctrl_br_type; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1200 = 2'h2 == value_1 ? uops_2_ctrl_br_type : _GEN_1199; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_1203 = 2'h1 == value_1 ? uops_1_fu_code : uops_0_fu_code; // @[util.scala 579:19 util.scala 579:19]
  wire [9:0] _GEN_1204 = 2'h2 == value_1 ? uops_2_fu_code : _GEN_1203; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_1207 = 2'h1 == value_1 ? uops_1_iq_type : uops_0_iq_type; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_1208 = 2'h2 == value_1 ? uops_2_iq_type : _GEN_1207; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_1211 = 2'h1 == value_1 ? uops_1_debug_pc : uops_0_debug_pc; // @[util.scala 579:19 util.scala 579:19]
  wire [39:0] _GEN_1212 = 2'h2 == value_1 ? uops_2_debug_pc : _GEN_1211; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1215 = 2'h1 == value_1 ? uops_1_is_rvc : uops_0_is_rvc; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1216 = 2'h2 == value_1 ? uops_2_is_rvc : _GEN_1215; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_1219 = 2'h1 == value_1 ? uops_1_debug_inst : uops_0_debug_inst; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_1220 = 2'h2 == value_1 ? uops_2_debug_inst : _GEN_1219; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_1223 = 2'h1 == value_1 ? uops_1_inst : uops_0_inst; // @[util.scala 579:19 util.scala 579:19]
  wire [31:0] _GEN_1224 = 2'h2 == value_1 ? uops_2_inst : _GEN_1223; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1227 = 2'h1 == value_1 ? uops_1_uopc : uops_0_uopc; // @[util.scala 579:19 util.scala 579:19]
  wire [6:0] _GEN_1228 = 2'h2 == value_1 ? uops_2_uopc : _GEN_1227; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1231 = 2'h1 == value_1 ? uops_1_address_num : uops_0_address_num; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1232 = 2'h2 == value_1 ? uops_2_address_num : _GEN_1231; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1235 = 2'h1 == value_1 ? uops_1_rob_inst_idx : uops_0_rob_inst_idx; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1236 = 2'h2 == value_1 ? uops_2_rob_inst_idx : _GEN_1235; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1239 = 2'h1 == value_1 ? uops_1_self_index : uops_0_self_index; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1240 = 2'h2 == value_1 ? uops_2_self_index : _GEN_1239; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1243 = 2'h1 == value_1 ? uops_1_split_num : uops_0_split_num; // @[util.scala 579:19 util.scala 579:19]
  wire [5:0] _GEN_1244 = 2'h2 == value_1 ? uops_2_split_num : _GEN_1243; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1247 = 2'h1 == value_1 ? uops_1_op2_sel : uops_0_op2_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1248 = 2'h2 == value_1 ? uops_2_op2_sel : _GEN_1247; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1251 = 2'h1 == value_1 ? uops_1_op1_sel : uops_0_op1_sel; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1252 = 2'h2 == value_1 ? uops_2_op1_sel : _GEN_1251; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1255 = 2'h1 == value_1 ? uops_1_stale_pflag : uops_0_stale_pflag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1256 = 2'h2 == value_1 ? uops_2_stale_pflag : _GEN_1255; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1259 = 2'h1 == value_1 ? uops_1_pflag_busy : uops_0_pflag_busy; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1260 = 2'h2 == value_1 ? uops_2_pflag_busy : _GEN_1259; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1263 = 2'h1 == value_1 ? uops_1_pwflag : uops_0_pwflag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1264 = 2'h2 == value_1 ? uops_2_pwflag : _GEN_1263; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1267 = 2'h1 == value_1 ? uops_1_prflag : uops_0_prflag; // @[util.scala 579:19 util.scala 579:19]
  wire [3:0] _GEN_1268 = 2'h2 == value_1 ? uops_2_prflag : _GEN_1267; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1271 = 2'h1 == value_1 ? uops_1_wflag : uops_0_wflag; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1272 = 2'h2 == value_1 ? uops_2_wflag : _GEN_1271; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1275 = 2'h1 == value_1 ? uops_1_rflag : uops_0_rflag; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1276 = 2'h2 == value_1 ? uops_2_rflag : _GEN_1275; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1279 = 2'h1 == value_1 ? uops_1_lrs3_rtype : uops_0_lrs3_rtype; // @[util.scala 579:19 util.scala 579:19]
  wire [1:0] _GEN_1280 = 2'h2 == value_1 ? uops_2_lrs3_rtype : _GEN_1279; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_1283 = 2'h1 == value_1 ? uops_1_shift : uops_0_shift; // @[util.scala 579:19 util.scala 579:19]
  wire [2:0] _GEN_1284 = 2'h2 == value_1 ? uops_2_shift : _GEN_1283; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1287 = 2'h1 == value_1 ? uops_1_is_unicore : uops_0_is_unicore; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1288 = 2'h2 == value_1 ? uops_2_is_unicore : _GEN_1287; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1291 = 2'h1 == value_1 ? uops_1_switch_off : uops_0_switch_off; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1292 = 2'h2 == value_1 ? uops_2_switch_off : _GEN_1291; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1295 = 2'h1 == value_1 ? uops_1_switch : uops_0_switch; // @[util.scala 579:19 util.scala 579:19]
  wire  _GEN_1296 = 2'h2 == value_1 ? uops_2_switch : _GEN_1295; // @[util.scala 579:19 util.scala 579:19]
  wire [11:0] _T_49 = io_brupdate_b1_mispredict_mask & out_uop_br_mask; // @[util.scala 175:51]
  wire  _T_50 = _T_49 != 12'h0; // @[util.scala 175:59]
  wire [1:0] lo = value - value_1; // @[util.scala 595:40]
  wire  hi = maybe_full & ptr_match; // @[util.scala 597:32]
  wire [2:0] _T_59 = {hi,lo}; // @[Cat.scala 30:58]
  assign ram_data_MPORT_1_addr = value_1;
  assign ram_data_MPORT_1_data = ram_data[ram_data_MPORT_1_addr]; // @[util.scala 535:20]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_is_hella_MPORT_1_addr = value_1;
  assign ram_is_hella_MPORT_1_data = ram_is_hella[ram_is_hella_MPORT_1_addr]; // @[util.scala 535:20]
  assign ram_is_hella_MPORT_data = io_enq_bits_is_hella;
  assign ram_is_hella_MPORT_addr = value;
  assign ram_is_hella_MPORT_mask = 1'h1;
  assign ram_is_hella_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[util.scala 575:19]
  assign io_deq_valid = _T_5 & _GEN_3 & ~_T_50 & ~(io_flush & out_uop_uses_ldq); // @[util.scala 580:108]
  assign io_deq_bits_uop_switch = 2'h3 == value_1 ? uops_3_switch : _GEN_1296; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_switch_off = 2'h3 == value_1 ? uops_3_switch_off : _GEN_1292; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_unicore = 2'h3 == value_1 ? uops_3_is_unicore : _GEN_1288; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_shift = 2'h3 == value_1 ? uops_3_shift : _GEN_1284; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs3_rtype = 2'h3 == value_1 ? uops_3_lrs3_rtype : _GEN_1280; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_rflag = 2'h3 == value_1 ? uops_3_rflag : _GEN_1276; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_wflag = 2'h3 == value_1 ? uops_3_wflag : _GEN_1272; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prflag = 2'h3 == value_1 ? uops_3_prflag : _GEN_1268; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_pwflag = 2'h3 == value_1 ? uops_3_pwflag : _GEN_1264; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_pflag_busy = 2'h3 == value_1 ? uops_3_pflag_busy : _GEN_1260; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_stale_pflag = 2'h3 == value_1 ? uops_3_stale_pflag : _GEN_1256; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_op1_sel = 2'h3 == value_1 ? uops_3_op1_sel : _GEN_1252; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_op2_sel = 2'h3 == value_1 ? uops_3_op2_sel : _GEN_1248; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_split_num = 2'h3 == value_1 ? uops_3_split_num : _GEN_1244; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_self_index = 2'h3 == value_1 ? uops_3_self_index : _GEN_1240; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_rob_inst_idx = 2'h3 == value_1 ? uops_3_rob_inst_idx : _GEN_1236; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_address_num = 2'h3 == value_1 ? uops_3_address_num : _GEN_1232; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_uopc = 2'h3 == value_1 ? uops_3_uopc : _GEN_1228; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_inst = 2'h3 == value_1 ? uops_3_inst : _GEN_1224; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_debug_inst = 2'h3 == value_1 ? uops_3_debug_inst : _GEN_1220; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_rvc = 2'h3 == value_1 ? uops_3_is_rvc : _GEN_1216; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_debug_pc = 2'h3 == value_1 ? uops_3_debug_pc : _GEN_1212; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_iq_type = 2'h3 == value_1 ? uops_3_iq_type : _GEN_1208; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_fu_code = 2'h3 == value_1 ? uops_3_fu_code : _GEN_1204; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_br_type = 2'h3 == value_1 ? uops_3_ctrl_br_type : _GEN_1200; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_op1_sel = 2'h3 == value_1 ? uops_3_ctrl_op1_sel : _GEN_1196; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_op2_sel = 2'h3 == value_1 ? uops_3_ctrl_op2_sel : _GEN_1192; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_imm_sel = 2'h3 == value_1 ? uops_3_ctrl_imm_sel : _GEN_1188; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_op_fcn = 2'h3 == value_1 ? uops_3_ctrl_op_fcn : _GEN_1184; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_fcn_dw = 2'h3 == value_1 ? uops_3_ctrl_fcn_dw : _GEN_1180; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_csr_cmd = 2'h3 == value_1 ? uops_3_ctrl_csr_cmd : _GEN_1176; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_is_load = 2'h3 == value_1 ? uops_3_ctrl_is_load : _GEN_1172; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_is_sta = 2'h3 == value_1 ? uops_3_ctrl_is_sta : _GEN_1168; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_is_std = 2'h3 == value_1 ? uops_3_ctrl_is_std : _GEN_1164; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ctrl_op3_sel = 2'h3 == value_1 ? uops_3_ctrl_op3_sel : _GEN_1160; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_iw_state = 2'h3 == value_1 ? uops_3_iw_state : _GEN_1156; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_iw_p1_poisoned = 2'h3 == value_1 ? uops_3_iw_p1_poisoned : _GEN_1152; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_iw_p2_poisoned = 2'h3 == value_1 ? uops_3_iw_p2_poisoned : _GEN_1148; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_br = 2'h3 == value_1 ? uops_3_is_br : _GEN_1144; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_jalr = 2'h3 == value_1 ? uops_3_is_jalr : _GEN_1140; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_jal = 2'h3 == value_1 ? uops_3_is_jal : _GEN_1136; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_sfb = 2'h3 == value_1 ? uops_3_is_sfb : _GEN_1132; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_br_mask = out_uop_br_mask & _T_14; // @[util.scala 142:25]
  assign io_deq_bits_uop_br_tag = 2'h3 == value_1 ? uops_3_br_tag : _GEN_1124; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ftq_idx = 2'h3 == value_1 ? uops_3_ftq_idx : _GEN_1120; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_edge_inst = 2'h3 == value_1 ? uops_3_edge_inst : _GEN_1116; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_pc_lob = 2'h3 == value_1 ? uops_3_pc_lob : _GEN_1112; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_taken = 2'h3 == value_1 ? uops_3_taken : _GEN_1108; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_imm_packed = 2'h3 == value_1 ? uops_3_imm_packed : _GEN_1104; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_csr_addr = 2'h3 == value_1 ? uops_3_csr_addr : _GEN_1100; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_rob_idx = 2'h3 == value_1 ? uops_3_rob_idx : _GEN_1096; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ldq_idx = 2'h3 == value_1 ? uops_3_ldq_idx : _GEN_1092; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_stq_idx = 2'h3 == value_1 ? uops_3_stq_idx : _GEN_1088; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_rxq_idx = 2'h3 == value_1 ? uops_3_rxq_idx : _GEN_1084; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_pdst = 2'h3 == value_1 ? uops_3_pdst : _GEN_1080; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs1 = 2'h3 == value_1 ? uops_3_prs1 : _GEN_1076; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs2 = 2'h3 == value_1 ? uops_3_prs2 : _GEN_1072; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs3 = 2'h3 == value_1 ? uops_3_prs3 : _GEN_1068; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ppred = 2'h3 == value_1 ? uops_3_ppred : _GEN_1064; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs1_busy = 2'h3 == value_1 ? uops_3_prs1_busy : _GEN_1060; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs2_busy = 2'h3 == value_1 ? uops_3_prs2_busy : _GEN_1056; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_prs3_busy = 2'h3 == value_1 ? uops_3_prs3_busy : _GEN_1052; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ppred_busy = 2'h3 == value_1 ? uops_3_ppred_busy : _GEN_1048; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_stale_pdst = 2'h3 == value_1 ? uops_3_stale_pdst : _GEN_1044; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_exception = 2'h3 == value_1 ? uops_3_exception : _GEN_1040; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_exc_cause = 2'h3 == value_1 ? uops_3_exc_cause : _GEN_1036; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_bypassable = 2'h3 == value_1 ? uops_3_bypassable : _GEN_1032; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_mem_cmd = 2'h3 == value_1 ? uops_3_mem_cmd : _GEN_1028; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_mem_size = 2'h3 == value_1 ? uops_3_mem_size : _GEN_1024; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_mem_signed = 2'h3 == value_1 ? uops_3_mem_signed : _GEN_1020; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_fence = 2'h3 == value_1 ? uops_3_is_fence : _GEN_1016; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_fencei = 2'h3 == value_1 ? uops_3_is_fencei : _GEN_1012; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_amo = 2'h3 == value_1 ? uops_3_is_amo : _GEN_1008; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_uses_ldq = 2'h3 == value_1 ? uops_3_uses_ldq : _GEN_1004; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_uses_stq = 2'h3 == value_1 ? uops_3_uses_stq : _GEN_1000; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_sys_pc2epc = 2'h3 == value_1 ? uops_3_is_sys_pc2epc : _GEN_996; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_is_unique = 2'h3 == value_1 ? uops_3_is_unique : _GEN_992; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_flush_on_commit = 2'h3 == value_1 ? uops_3_flush_on_commit : _GEN_988; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ldst_is_rs1 = 2'h3 == value_1 ? uops_3_ldst_is_rs1 : _GEN_984; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ldst = 2'h3 == value_1 ? uops_3_ldst : _GEN_980; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs1 = 2'h3 == value_1 ? uops_3_lrs1 : _GEN_976; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs2 = 2'h3 == value_1 ? uops_3_lrs2 : _GEN_972; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs3 = 2'h3 == value_1 ? uops_3_lrs3 : _GEN_968; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_ldst_val = 2'h3 == value_1 ? uops_3_ldst_val : _GEN_964; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_dst_rtype = 2'h3 == value_1 ? uops_3_dst_rtype : _GEN_960; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs1_rtype = 2'h3 == value_1 ? uops_3_lrs1_rtype : _GEN_956; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_lrs2_rtype = 2'h3 == value_1 ? uops_3_lrs2_rtype : _GEN_952; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_frs3_en = 2'h3 == value_1 ? uops_3_frs3_en : _GEN_948; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_fp_val = 2'h3 == value_1 ? uops_3_fp_val : _GEN_944; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_fp_single = 2'h3 == value_1 ? uops_3_fp_single : _GEN_940; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_xcpt_pf_if = 2'h3 == value_1 ? uops_3_xcpt_pf_if : _GEN_936; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_xcpt_ae_if = 2'h3 == value_1 ? uops_3_xcpt_ae_if : _GEN_932; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_xcpt_ma_if = 2'h3 == value_1 ? uops_3_xcpt_ma_if : _GEN_928; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_bp_debug_if = 2'h3 == value_1 ? uops_3_bp_debug_if : _GEN_924; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_bp_xcpt_if = 2'h3 == value_1 ? uops_3_bp_xcpt_if : _GEN_920; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_debug_fsrc = 2'h3 == value_1 ? uops_3_debug_fsrc : _GEN_916; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_uop_debug_tsrc = 2'h3 == value_1 ? uops_3_debug_tsrc : _GEN_912; // @[util.scala 579:19 util.scala 579:19]
  assign io_deq_bits_data = ram_data_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  assign io_deq_bits_is_hella = ram_is_hella_MPORT_1_data; // @[util.scala 577:17 util.scala 578:19]
  assign io_empty = ptr_match & ~maybe_full; // @[util.scala 544:25]
  assign io_count = _T_59[1:0]; // @[util.scala 597:14]
  always @(posedge clock) begin
    if(ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[util.scala 535:20]
    end
    if(ram_is_hella_MPORT_en & ram_is_hella_MPORT_mask) begin
      ram_is_hella[ram_is_hella_MPORT_addr] <= ram_is_hella_MPORT_data; // @[util.scala 535:20]
    end
    if (reset) begin // @[util.scala 536:24]
      valids_0 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (2'h0 == value_1) begin // @[util.scala 567:27]
        valids_0 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_0 <= _GEN_507;
      end
    end else begin
      valids_0 <= _GEN_507;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_1 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (2'h1 == value_1) begin // @[util.scala 567:27]
        valids_1 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_1 <= _GEN_508;
      end
    end else begin
      valids_1 <= _GEN_508;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_2 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (2'h2 == value_1) begin // @[util.scala 567:27]
        valids_2 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_2 <= _GEN_509;
      end
    end else begin
      valids_2 <= _GEN_509;
    end
    if (reset) begin // @[util.scala 536:24]
      valids_3 <= 1'h0; // @[util.scala 536:24]
    end else if (do_deq) begin // @[util.scala 566:17]
      if (2'h3 == value_1) begin // @[util.scala 567:27]
        valids_3 <= 1'h0; // @[util.scala 567:27]
      end else begin
        valids_3 <= _GEN_510;
      end
    end else begin
      valids_3 <= _GEN_510;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 562:33]
        uops_0_br_mask <= _T_44; // @[util.scala 562:33]
      end else if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_0_br_mask <= _GEN_4;
      end
    end else begin
      uops_0_br_mask <= _GEN_4;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h0 == value) begin // @[util.scala 561:33]
        uops_0_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 562:33]
        uops_1_br_mask <= _T_44; // @[util.scala 562:33]
      end else if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_1_br_mask <= _GEN_5;
      end
    end else begin
      uops_1_br_mask <= _GEN_5;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h1 == value) begin // @[util.scala 561:33]
        uops_1_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 562:33]
        uops_2_br_mask <= _T_44; // @[util.scala 562:33]
      end else if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_2_br_mask <= _GEN_6;
      end
    end else begin
      uops_2_br_mask <= _GEN_6;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h2 == value) begin // @[util.scala 561:33]
        uops_2_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_switch <= io_enq_bits_uop_switch; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_switch_off <= io_enq_bits_uop_switch_off; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_unicore <= io_enq_bits_uop_is_unicore; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_shift <= io_enq_bits_uop_shift; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs3_rtype <= io_enq_bits_uop_lrs3_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_rflag <= io_enq_bits_uop_rflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_wflag <= io_enq_bits_uop_wflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_prflag <= io_enq_bits_uop_prflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_pwflag <= io_enq_bits_uop_pwflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_pflag_busy <= io_enq_bits_uop_pflag_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_stale_pflag <= io_enq_bits_uop_stale_pflag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_op1_sel <= io_enq_bits_uop_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_op2_sel <= io_enq_bits_uop_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_split_num <= io_enq_bits_uop_split_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_self_index <= io_enq_bits_uop_self_index; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_rob_inst_idx <= io_enq_bits_uop_rob_inst_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_address_num <= io_enq_bits_uop_address_num; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_uopc <= io_enq_bits_uop_uopc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_inst <= io_enq_bits_uop_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_inst <= io_enq_bits_uop_debug_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_rvc <= io_enq_bits_uop_is_rvc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_pc <= io_enq_bits_uop_debug_pc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_iq_type <= io_enq_bits_uop_iq_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_fu_code <= io_enq_bits_uop_fu_code; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ctrl_op3_sel <= io_enq_bits_uop_ctrl_op3_sel; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_iw_state <= io_enq_bits_uop_iw_state; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_br <= io_enq_bits_uop_is_br; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_jalr <= io_enq_bits_uop_is_jalr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_jal <= io_enq_bits_uop_is_jal; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_sfb <= io_enq_bits_uop_is_sfb; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 562:33]
        uops_3_br_mask <= _T_44; // @[util.scala 562:33]
      end else if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_br_mask <= io_enq_bits_uop_br_mask; // @[util.scala 561:33]
      end else begin
        uops_3_br_mask <= _GEN_7;
      end
    end else begin
      uops_3_br_mask <= _GEN_7;
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_br_tag <= io_enq_bits_uop_br_tag; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ftq_idx <= io_enq_bits_uop_ftq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_edge_inst <= io_enq_bits_uop_edge_inst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_pc_lob <= io_enq_bits_uop_pc_lob; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_taken <= io_enq_bits_uop_taken; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_imm_packed <= io_enq_bits_uop_imm_packed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_csr_addr <= io_enq_bits_uop_csr_addr; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_rob_idx <= io_enq_bits_uop_rob_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldq_idx <= io_enq_bits_uop_ldq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_stq_idx <= io_enq_bits_uop_stq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_rxq_idx <= io_enq_bits_uop_rxq_idx; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_pdst <= io_enq_bits_uop_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs1 <= io_enq_bits_uop_prs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs2 <= io_enq_bits_uop_prs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs3 <= io_enq_bits_uop_prs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ppred <= io_enq_bits_uop_ppred; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs1_busy <= io_enq_bits_uop_prs1_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs2_busy <= io_enq_bits_uop_prs2_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_prs3_busy <= io_enq_bits_uop_prs3_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ppred_busy <= io_enq_bits_uop_ppred_busy; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_stale_pdst <= io_enq_bits_uop_stale_pdst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_exception <= io_enq_bits_uop_exception; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_exc_cause <= io_enq_bits_uop_exc_cause; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_bypassable <= io_enq_bits_uop_bypassable; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_mem_cmd <= io_enq_bits_uop_mem_cmd; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_mem_size <= io_enq_bits_uop_mem_size; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_mem_signed <= io_enq_bits_uop_mem_signed; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_fence <= io_enq_bits_uop_is_fence; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_fencei <= io_enq_bits_uop_is_fencei; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_amo <= io_enq_bits_uop_is_amo; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_uses_ldq <= io_enq_bits_uop_uses_ldq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_uses_stq <= io_enq_bits_uop_uses_stq; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_is_unique <= io_enq_bits_uop_is_unique; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_flush_on_commit <= io_enq_bits_uop_flush_on_commit; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldst <= io_enq_bits_uop_ldst; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs1 <= io_enq_bits_uop_lrs1; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs2 <= io_enq_bits_uop_lrs2; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs3 <= io_enq_bits_uop_lrs3; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_ldst_val <= io_enq_bits_uop_ldst_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_dst_rtype <= io_enq_bits_uop_dst_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_frs3_en <= io_enq_bits_uop_frs3_en; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_fp_val <= io_enq_bits_uop_fp_val; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_fp_single <= io_enq_bits_uop_fp_single; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_bp_debug_if <= io_enq_bits_uop_bp_debug_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_fsrc <= io_enq_bits_uop_debug_fsrc; // @[util.scala 561:33]
      end
    end
    if (do_enq) begin // @[util.scala 558:17]
      if (2'h3 == value) begin // @[util.scala 561:33]
        uops_3_debug_tsrc <= io_enq_bits_uop_debug_tsrc; // @[util.scala 561:33]
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 2'h0; // @[Counter.scala 60:40]
    end else if (do_enq) begin // @[util.scala 558:17]
      value <= _value_T_1; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 2'h0; // @[Counter.scala 60:40]
    end else if (do_deq) begin // @[util.scala 566:17]
      value_1 <= _value_T_3; // @[Counter.scala 76:15]
    end
    if (reset) begin // @[util.scala 541:27]
      maybe_full <= 1'h0; // @[util.scala 541:27]
    end else if (do_enq != do_deq) begin // @[util.scala 571:28]
      maybe_full <= do_enq; // @[util.scala 572:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_is_hella[initvar] = _RAND_1[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  valids_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  valids_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  valids_2 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  valids_3 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  uops_0_switch = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  uops_0_switch_off = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  uops_0_is_unicore = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  uops_0_shift = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  uops_0_lrs3_rtype = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  uops_0_rflag = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  uops_0_wflag = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  uops_0_prflag = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  uops_0_pwflag = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  uops_0_pflag_busy = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  uops_0_stale_pflag = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  uops_0_op1_sel = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  uops_0_op2_sel = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  uops_0_split_num = _RAND_19[5:0];
  _RAND_20 = {1{`RANDOM}};
  uops_0_self_index = _RAND_20[5:0];
  _RAND_21 = {1{`RANDOM}};
  uops_0_rob_inst_idx = _RAND_21[5:0];
  _RAND_22 = {1{`RANDOM}};
  uops_0_address_num = _RAND_22[5:0];
  _RAND_23 = {1{`RANDOM}};
  uops_0_uopc = _RAND_23[6:0];
  _RAND_24 = {1{`RANDOM}};
  uops_0_inst = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  uops_0_debug_inst = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  uops_0_is_rvc = _RAND_26[0:0];
  _RAND_27 = {2{`RANDOM}};
  uops_0_debug_pc = _RAND_27[39:0];
  _RAND_28 = {1{`RANDOM}};
  uops_0_iq_type = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  uops_0_fu_code = _RAND_29[9:0];
  _RAND_30 = {1{`RANDOM}};
  uops_0_ctrl_br_type = _RAND_30[3:0];
  _RAND_31 = {1{`RANDOM}};
  uops_0_ctrl_op1_sel = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  uops_0_ctrl_op2_sel = _RAND_32[2:0];
  _RAND_33 = {1{`RANDOM}};
  uops_0_ctrl_imm_sel = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  uops_0_ctrl_op_fcn = _RAND_34[3:0];
  _RAND_35 = {1{`RANDOM}};
  uops_0_ctrl_fcn_dw = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  uops_0_ctrl_csr_cmd = _RAND_36[2:0];
  _RAND_37 = {1{`RANDOM}};
  uops_0_ctrl_is_load = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  uops_0_ctrl_is_sta = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  uops_0_ctrl_is_std = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  uops_0_ctrl_op3_sel = _RAND_40[1:0];
  _RAND_41 = {1{`RANDOM}};
  uops_0_iw_state = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  uops_0_iw_p1_poisoned = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  uops_0_iw_p2_poisoned = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  uops_0_is_br = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  uops_0_is_jalr = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  uops_0_is_jal = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  uops_0_is_sfb = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  uops_0_br_mask = _RAND_48[11:0];
  _RAND_49 = {1{`RANDOM}};
  uops_0_br_tag = _RAND_49[3:0];
  _RAND_50 = {1{`RANDOM}};
  uops_0_ftq_idx = _RAND_50[4:0];
  _RAND_51 = {1{`RANDOM}};
  uops_0_edge_inst = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  uops_0_pc_lob = _RAND_52[5:0];
  _RAND_53 = {1{`RANDOM}};
  uops_0_taken = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  uops_0_imm_packed = _RAND_54[19:0];
  _RAND_55 = {1{`RANDOM}};
  uops_0_csr_addr = _RAND_55[11:0];
  _RAND_56 = {1{`RANDOM}};
  uops_0_rob_idx = _RAND_56[5:0];
  _RAND_57 = {1{`RANDOM}};
  uops_0_ldq_idx = _RAND_57[4:0];
  _RAND_58 = {1{`RANDOM}};
  uops_0_stq_idx = _RAND_58[4:0];
  _RAND_59 = {1{`RANDOM}};
  uops_0_rxq_idx = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  uops_0_pdst = _RAND_60[6:0];
  _RAND_61 = {1{`RANDOM}};
  uops_0_prs1 = _RAND_61[6:0];
  _RAND_62 = {1{`RANDOM}};
  uops_0_prs2 = _RAND_62[6:0];
  _RAND_63 = {1{`RANDOM}};
  uops_0_prs3 = _RAND_63[6:0];
  _RAND_64 = {1{`RANDOM}};
  uops_0_ppred = _RAND_64[4:0];
  _RAND_65 = {1{`RANDOM}};
  uops_0_prs1_busy = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  uops_0_prs2_busy = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  uops_0_prs3_busy = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  uops_0_ppred_busy = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  uops_0_stale_pdst = _RAND_69[6:0];
  _RAND_70 = {1{`RANDOM}};
  uops_0_exception = _RAND_70[0:0];
  _RAND_71 = {2{`RANDOM}};
  uops_0_exc_cause = _RAND_71[63:0];
  _RAND_72 = {1{`RANDOM}};
  uops_0_bypassable = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  uops_0_mem_cmd = _RAND_73[4:0];
  _RAND_74 = {1{`RANDOM}};
  uops_0_mem_size = _RAND_74[1:0];
  _RAND_75 = {1{`RANDOM}};
  uops_0_mem_signed = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  uops_0_is_fence = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  uops_0_is_fencei = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  uops_0_is_amo = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  uops_0_uses_ldq = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  uops_0_uses_stq = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  uops_0_is_sys_pc2epc = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  uops_0_is_unique = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  uops_0_flush_on_commit = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  uops_0_ldst_is_rs1 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  uops_0_ldst = _RAND_85[5:0];
  _RAND_86 = {1{`RANDOM}};
  uops_0_lrs1 = _RAND_86[5:0];
  _RAND_87 = {1{`RANDOM}};
  uops_0_lrs2 = _RAND_87[5:0];
  _RAND_88 = {1{`RANDOM}};
  uops_0_lrs3 = _RAND_88[5:0];
  _RAND_89 = {1{`RANDOM}};
  uops_0_ldst_val = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  uops_0_dst_rtype = _RAND_90[1:0];
  _RAND_91 = {1{`RANDOM}};
  uops_0_lrs1_rtype = _RAND_91[1:0];
  _RAND_92 = {1{`RANDOM}};
  uops_0_lrs2_rtype = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  uops_0_frs3_en = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  uops_0_fp_val = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  uops_0_fp_single = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  uops_0_xcpt_pf_if = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  uops_0_xcpt_ae_if = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  uops_0_xcpt_ma_if = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  uops_0_bp_debug_if = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  uops_0_bp_xcpt_if = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  uops_0_debug_fsrc = _RAND_101[1:0];
  _RAND_102 = {1{`RANDOM}};
  uops_0_debug_tsrc = _RAND_102[1:0];
  _RAND_103 = {1{`RANDOM}};
  uops_1_switch = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  uops_1_switch_off = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  uops_1_is_unicore = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  uops_1_shift = _RAND_106[2:0];
  _RAND_107 = {1{`RANDOM}};
  uops_1_lrs3_rtype = _RAND_107[1:0];
  _RAND_108 = {1{`RANDOM}};
  uops_1_rflag = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  uops_1_wflag = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  uops_1_prflag = _RAND_110[3:0];
  _RAND_111 = {1{`RANDOM}};
  uops_1_pwflag = _RAND_111[3:0];
  _RAND_112 = {1{`RANDOM}};
  uops_1_pflag_busy = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  uops_1_stale_pflag = _RAND_113[3:0];
  _RAND_114 = {1{`RANDOM}};
  uops_1_op1_sel = _RAND_114[3:0];
  _RAND_115 = {1{`RANDOM}};
  uops_1_op2_sel = _RAND_115[3:0];
  _RAND_116 = {1{`RANDOM}};
  uops_1_split_num = _RAND_116[5:0];
  _RAND_117 = {1{`RANDOM}};
  uops_1_self_index = _RAND_117[5:0];
  _RAND_118 = {1{`RANDOM}};
  uops_1_rob_inst_idx = _RAND_118[5:0];
  _RAND_119 = {1{`RANDOM}};
  uops_1_address_num = _RAND_119[5:0];
  _RAND_120 = {1{`RANDOM}};
  uops_1_uopc = _RAND_120[6:0];
  _RAND_121 = {1{`RANDOM}};
  uops_1_inst = _RAND_121[31:0];
  _RAND_122 = {1{`RANDOM}};
  uops_1_debug_inst = _RAND_122[31:0];
  _RAND_123 = {1{`RANDOM}};
  uops_1_is_rvc = _RAND_123[0:0];
  _RAND_124 = {2{`RANDOM}};
  uops_1_debug_pc = _RAND_124[39:0];
  _RAND_125 = {1{`RANDOM}};
  uops_1_iq_type = _RAND_125[2:0];
  _RAND_126 = {1{`RANDOM}};
  uops_1_fu_code = _RAND_126[9:0];
  _RAND_127 = {1{`RANDOM}};
  uops_1_ctrl_br_type = _RAND_127[3:0];
  _RAND_128 = {1{`RANDOM}};
  uops_1_ctrl_op1_sel = _RAND_128[1:0];
  _RAND_129 = {1{`RANDOM}};
  uops_1_ctrl_op2_sel = _RAND_129[2:0];
  _RAND_130 = {1{`RANDOM}};
  uops_1_ctrl_imm_sel = _RAND_130[2:0];
  _RAND_131 = {1{`RANDOM}};
  uops_1_ctrl_op_fcn = _RAND_131[3:0];
  _RAND_132 = {1{`RANDOM}};
  uops_1_ctrl_fcn_dw = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  uops_1_ctrl_csr_cmd = _RAND_133[2:0];
  _RAND_134 = {1{`RANDOM}};
  uops_1_ctrl_is_load = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  uops_1_ctrl_is_sta = _RAND_135[0:0];
  _RAND_136 = {1{`RANDOM}};
  uops_1_ctrl_is_std = _RAND_136[0:0];
  _RAND_137 = {1{`RANDOM}};
  uops_1_ctrl_op3_sel = _RAND_137[1:0];
  _RAND_138 = {1{`RANDOM}};
  uops_1_iw_state = _RAND_138[1:0];
  _RAND_139 = {1{`RANDOM}};
  uops_1_iw_p1_poisoned = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  uops_1_iw_p2_poisoned = _RAND_140[0:0];
  _RAND_141 = {1{`RANDOM}};
  uops_1_is_br = _RAND_141[0:0];
  _RAND_142 = {1{`RANDOM}};
  uops_1_is_jalr = _RAND_142[0:0];
  _RAND_143 = {1{`RANDOM}};
  uops_1_is_jal = _RAND_143[0:0];
  _RAND_144 = {1{`RANDOM}};
  uops_1_is_sfb = _RAND_144[0:0];
  _RAND_145 = {1{`RANDOM}};
  uops_1_br_mask = _RAND_145[11:0];
  _RAND_146 = {1{`RANDOM}};
  uops_1_br_tag = _RAND_146[3:0];
  _RAND_147 = {1{`RANDOM}};
  uops_1_ftq_idx = _RAND_147[4:0];
  _RAND_148 = {1{`RANDOM}};
  uops_1_edge_inst = _RAND_148[0:0];
  _RAND_149 = {1{`RANDOM}};
  uops_1_pc_lob = _RAND_149[5:0];
  _RAND_150 = {1{`RANDOM}};
  uops_1_taken = _RAND_150[0:0];
  _RAND_151 = {1{`RANDOM}};
  uops_1_imm_packed = _RAND_151[19:0];
  _RAND_152 = {1{`RANDOM}};
  uops_1_csr_addr = _RAND_152[11:0];
  _RAND_153 = {1{`RANDOM}};
  uops_1_rob_idx = _RAND_153[5:0];
  _RAND_154 = {1{`RANDOM}};
  uops_1_ldq_idx = _RAND_154[4:0];
  _RAND_155 = {1{`RANDOM}};
  uops_1_stq_idx = _RAND_155[4:0];
  _RAND_156 = {1{`RANDOM}};
  uops_1_rxq_idx = _RAND_156[1:0];
  _RAND_157 = {1{`RANDOM}};
  uops_1_pdst = _RAND_157[6:0];
  _RAND_158 = {1{`RANDOM}};
  uops_1_prs1 = _RAND_158[6:0];
  _RAND_159 = {1{`RANDOM}};
  uops_1_prs2 = _RAND_159[6:0];
  _RAND_160 = {1{`RANDOM}};
  uops_1_prs3 = _RAND_160[6:0];
  _RAND_161 = {1{`RANDOM}};
  uops_1_ppred = _RAND_161[4:0];
  _RAND_162 = {1{`RANDOM}};
  uops_1_prs1_busy = _RAND_162[0:0];
  _RAND_163 = {1{`RANDOM}};
  uops_1_prs2_busy = _RAND_163[0:0];
  _RAND_164 = {1{`RANDOM}};
  uops_1_prs3_busy = _RAND_164[0:0];
  _RAND_165 = {1{`RANDOM}};
  uops_1_ppred_busy = _RAND_165[0:0];
  _RAND_166 = {1{`RANDOM}};
  uops_1_stale_pdst = _RAND_166[6:0];
  _RAND_167 = {1{`RANDOM}};
  uops_1_exception = _RAND_167[0:0];
  _RAND_168 = {2{`RANDOM}};
  uops_1_exc_cause = _RAND_168[63:0];
  _RAND_169 = {1{`RANDOM}};
  uops_1_bypassable = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  uops_1_mem_cmd = _RAND_170[4:0];
  _RAND_171 = {1{`RANDOM}};
  uops_1_mem_size = _RAND_171[1:0];
  _RAND_172 = {1{`RANDOM}};
  uops_1_mem_signed = _RAND_172[0:0];
  _RAND_173 = {1{`RANDOM}};
  uops_1_is_fence = _RAND_173[0:0];
  _RAND_174 = {1{`RANDOM}};
  uops_1_is_fencei = _RAND_174[0:0];
  _RAND_175 = {1{`RANDOM}};
  uops_1_is_amo = _RAND_175[0:0];
  _RAND_176 = {1{`RANDOM}};
  uops_1_uses_ldq = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  uops_1_uses_stq = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  uops_1_is_sys_pc2epc = _RAND_178[0:0];
  _RAND_179 = {1{`RANDOM}};
  uops_1_is_unique = _RAND_179[0:0];
  _RAND_180 = {1{`RANDOM}};
  uops_1_flush_on_commit = _RAND_180[0:0];
  _RAND_181 = {1{`RANDOM}};
  uops_1_ldst_is_rs1 = _RAND_181[0:0];
  _RAND_182 = {1{`RANDOM}};
  uops_1_ldst = _RAND_182[5:0];
  _RAND_183 = {1{`RANDOM}};
  uops_1_lrs1 = _RAND_183[5:0];
  _RAND_184 = {1{`RANDOM}};
  uops_1_lrs2 = _RAND_184[5:0];
  _RAND_185 = {1{`RANDOM}};
  uops_1_lrs3 = _RAND_185[5:0];
  _RAND_186 = {1{`RANDOM}};
  uops_1_ldst_val = _RAND_186[0:0];
  _RAND_187 = {1{`RANDOM}};
  uops_1_dst_rtype = _RAND_187[1:0];
  _RAND_188 = {1{`RANDOM}};
  uops_1_lrs1_rtype = _RAND_188[1:0];
  _RAND_189 = {1{`RANDOM}};
  uops_1_lrs2_rtype = _RAND_189[1:0];
  _RAND_190 = {1{`RANDOM}};
  uops_1_frs3_en = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  uops_1_fp_val = _RAND_191[0:0];
  _RAND_192 = {1{`RANDOM}};
  uops_1_fp_single = _RAND_192[0:0];
  _RAND_193 = {1{`RANDOM}};
  uops_1_xcpt_pf_if = _RAND_193[0:0];
  _RAND_194 = {1{`RANDOM}};
  uops_1_xcpt_ae_if = _RAND_194[0:0];
  _RAND_195 = {1{`RANDOM}};
  uops_1_xcpt_ma_if = _RAND_195[0:0];
  _RAND_196 = {1{`RANDOM}};
  uops_1_bp_debug_if = _RAND_196[0:0];
  _RAND_197 = {1{`RANDOM}};
  uops_1_bp_xcpt_if = _RAND_197[0:0];
  _RAND_198 = {1{`RANDOM}};
  uops_1_debug_fsrc = _RAND_198[1:0];
  _RAND_199 = {1{`RANDOM}};
  uops_1_debug_tsrc = _RAND_199[1:0];
  _RAND_200 = {1{`RANDOM}};
  uops_2_switch = _RAND_200[0:0];
  _RAND_201 = {1{`RANDOM}};
  uops_2_switch_off = _RAND_201[0:0];
  _RAND_202 = {1{`RANDOM}};
  uops_2_is_unicore = _RAND_202[0:0];
  _RAND_203 = {1{`RANDOM}};
  uops_2_shift = _RAND_203[2:0];
  _RAND_204 = {1{`RANDOM}};
  uops_2_lrs3_rtype = _RAND_204[1:0];
  _RAND_205 = {1{`RANDOM}};
  uops_2_rflag = _RAND_205[0:0];
  _RAND_206 = {1{`RANDOM}};
  uops_2_wflag = _RAND_206[0:0];
  _RAND_207 = {1{`RANDOM}};
  uops_2_prflag = _RAND_207[3:0];
  _RAND_208 = {1{`RANDOM}};
  uops_2_pwflag = _RAND_208[3:0];
  _RAND_209 = {1{`RANDOM}};
  uops_2_pflag_busy = _RAND_209[0:0];
  _RAND_210 = {1{`RANDOM}};
  uops_2_stale_pflag = _RAND_210[3:0];
  _RAND_211 = {1{`RANDOM}};
  uops_2_op1_sel = _RAND_211[3:0];
  _RAND_212 = {1{`RANDOM}};
  uops_2_op2_sel = _RAND_212[3:0];
  _RAND_213 = {1{`RANDOM}};
  uops_2_split_num = _RAND_213[5:0];
  _RAND_214 = {1{`RANDOM}};
  uops_2_self_index = _RAND_214[5:0];
  _RAND_215 = {1{`RANDOM}};
  uops_2_rob_inst_idx = _RAND_215[5:0];
  _RAND_216 = {1{`RANDOM}};
  uops_2_address_num = _RAND_216[5:0];
  _RAND_217 = {1{`RANDOM}};
  uops_2_uopc = _RAND_217[6:0];
  _RAND_218 = {1{`RANDOM}};
  uops_2_inst = _RAND_218[31:0];
  _RAND_219 = {1{`RANDOM}};
  uops_2_debug_inst = _RAND_219[31:0];
  _RAND_220 = {1{`RANDOM}};
  uops_2_is_rvc = _RAND_220[0:0];
  _RAND_221 = {2{`RANDOM}};
  uops_2_debug_pc = _RAND_221[39:0];
  _RAND_222 = {1{`RANDOM}};
  uops_2_iq_type = _RAND_222[2:0];
  _RAND_223 = {1{`RANDOM}};
  uops_2_fu_code = _RAND_223[9:0];
  _RAND_224 = {1{`RANDOM}};
  uops_2_ctrl_br_type = _RAND_224[3:0];
  _RAND_225 = {1{`RANDOM}};
  uops_2_ctrl_op1_sel = _RAND_225[1:0];
  _RAND_226 = {1{`RANDOM}};
  uops_2_ctrl_op2_sel = _RAND_226[2:0];
  _RAND_227 = {1{`RANDOM}};
  uops_2_ctrl_imm_sel = _RAND_227[2:0];
  _RAND_228 = {1{`RANDOM}};
  uops_2_ctrl_op_fcn = _RAND_228[3:0];
  _RAND_229 = {1{`RANDOM}};
  uops_2_ctrl_fcn_dw = _RAND_229[0:0];
  _RAND_230 = {1{`RANDOM}};
  uops_2_ctrl_csr_cmd = _RAND_230[2:0];
  _RAND_231 = {1{`RANDOM}};
  uops_2_ctrl_is_load = _RAND_231[0:0];
  _RAND_232 = {1{`RANDOM}};
  uops_2_ctrl_is_sta = _RAND_232[0:0];
  _RAND_233 = {1{`RANDOM}};
  uops_2_ctrl_is_std = _RAND_233[0:0];
  _RAND_234 = {1{`RANDOM}};
  uops_2_ctrl_op3_sel = _RAND_234[1:0];
  _RAND_235 = {1{`RANDOM}};
  uops_2_iw_state = _RAND_235[1:0];
  _RAND_236 = {1{`RANDOM}};
  uops_2_iw_p1_poisoned = _RAND_236[0:0];
  _RAND_237 = {1{`RANDOM}};
  uops_2_iw_p2_poisoned = _RAND_237[0:0];
  _RAND_238 = {1{`RANDOM}};
  uops_2_is_br = _RAND_238[0:0];
  _RAND_239 = {1{`RANDOM}};
  uops_2_is_jalr = _RAND_239[0:0];
  _RAND_240 = {1{`RANDOM}};
  uops_2_is_jal = _RAND_240[0:0];
  _RAND_241 = {1{`RANDOM}};
  uops_2_is_sfb = _RAND_241[0:0];
  _RAND_242 = {1{`RANDOM}};
  uops_2_br_mask = _RAND_242[11:0];
  _RAND_243 = {1{`RANDOM}};
  uops_2_br_tag = _RAND_243[3:0];
  _RAND_244 = {1{`RANDOM}};
  uops_2_ftq_idx = _RAND_244[4:0];
  _RAND_245 = {1{`RANDOM}};
  uops_2_edge_inst = _RAND_245[0:0];
  _RAND_246 = {1{`RANDOM}};
  uops_2_pc_lob = _RAND_246[5:0];
  _RAND_247 = {1{`RANDOM}};
  uops_2_taken = _RAND_247[0:0];
  _RAND_248 = {1{`RANDOM}};
  uops_2_imm_packed = _RAND_248[19:0];
  _RAND_249 = {1{`RANDOM}};
  uops_2_csr_addr = _RAND_249[11:0];
  _RAND_250 = {1{`RANDOM}};
  uops_2_rob_idx = _RAND_250[5:0];
  _RAND_251 = {1{`RANDOM}};
  uops_2_ldq_idx = _RAND_251[4:0];
  _RAND_252 = {1{`RANDOM}};
  uops_2_stq_idx = _RAND_252[4:0];
  _RAND_253 = {1{`RANDOM}};
  uops_2_rxq_idx = _RAND_253[1:0];
  _RAND_254 = {1{`RANDOM}};
  uops_2_pdst = _RAND_254[6:0];
  _RAND_255 = {1{`RANDOM}};
  uops_2_prs1 = _RAND_255[6:0];
  _RAND_256 = {1{`RANDOM}};
  uops_2_prs2 = _RAND_256[6:0];
  _RAND_257 = {1{`RANDOM}};
  uops_2_prs3 = _RAND_257[6:0];
  _RAND_258 = {1{`RANDOM}};
  uops_2_ppred = _RAND_258[4:0];
  _RAND_259 = {1{`RANDOM}};
  uops_2_prs1_busy = _RAND_259[0:0];
  _RAND_260 = {1{`RANDOM}};
  uops_2_prs2_busy = _RAND_260[0:0];
  _RAND_261 = {1{`RANDOM}};
  uops_2_prs3_busy = _RAND_261[0:0];
  _RAND_262 = {1{`RANDOM}};
  uops_2_ppred_busy = _RAND_262[0:0];
  _RAND_263 = {1{`RANDOM}};
  uops_2_stale_pdst = _RAND_263[6:0];
  _RAND_264 = {1{`RANDOM}};
  uops_2_exception = _RAND_264[0:0];
  _RAND_265 = {2{`RANDOM}};
  uops_2_exc_cause = _RAND_265[63:0];
  _RAND_266 = {1{`RANDOM}};
  uops_2_bypassable = _RAND_266[0:0];
  _RAND_267 = {1{`RANDOM}};
  uops_2_mem_cmd = _RAND_267[4:0];
  _RAND_268 = {1{`RANDOM}};
  uops_2_mem_size = _RAND_268[1:0];
  _RAND_269 = {1{`RANDOM}};
  uops_2_mem_signed = _RAND_269[0:0];
  _RAND_270 = {1{`RANDOM}};
  uops_2_is_fence = _RAND_270[0:0];
  _RAND_271 = {1{`RANDOM}};
  uops_2_is_fencei = _RAND_271[0:0];
  _RAND_272 = {1{`RANDOM}};
  uops_2_is_amo = _RAND_272[0:0];
  _RAND_273 = {1{`RANDOM}};
  uops_2_uses_ldq = _RAND_273[0:0];
  _RAND_274 = {1{`RANDOM}};
  uops_2_uses_stq = _RAND_274[0:0];
  _RAND_275 = {1{`RANDOM}};
  uops_2_is_sys_pc2epc = _RAND_275[0:0];
  _RAND_276 = {1{`RANDOM}};
  uops_2_is_unique = _RAND_276[0:0];
  _RAND_277 = {1{`RANDOM}};
  uops_2_flush_on_commit = _RAND_277[0:0];
  _RAND_278 = {1{`RANDOM}};
  uops_2_ldst_is_rs1 = _RAND_278[0:0];
  _RAND_279 = {1{`RANDOM}};
  uops_2_ldst = _RAND_279[5:0];
  _RAND_280 = {1{`RANDOM}};
  uops_2_lrs1 = _RAND_280[5:0];
  _RAND_281 = {1{`RANDOM}};
  uops_2_lrs2 = _RAND_281[5:0];
  _RAND_282 = {1{`RANDOM}};
  uops_2_lrs3 = _RAND_282[5:0];
  _RAND_283 = {1{`RANDOM}};
  uops_2_ldst_val = _RAND_283[0:0];
  _RAND_284 = {1{`RANDOM}};
  uops_2_dst_rtype = _RAND_284[1:0];
  _RAND_285 = {1{`RANDOM}};
  uops_2_lrs1_rtype = _RAND_285[1:0];
  _RAND_286 = {1{`RANDOM}};
  uops_2_lrs2_rtype = _RAND_286[1:0];
  _RAND_287 = {1{`RANDOM}};
  uops_2_frs3_en = _RAND_287[0:0];
  _RAND_288 = {1{`RANDOM}};
  uops_2_fp_val = _RAND_288[0:0];
  _RAND_289 = {1{`RANDOM}};
  uops_2_fp_single = _RAND_289[0:0];
  _RAND_290 = {1{`RANDOM}};
  uops_2_xcpt_pf_if = _RAND_290[0:0];
  _RAND_291 = {1{`RANDOM}};
  uops_2_xcpt_ae_if = _RAND_291[0:0];
  _RAND_292 = {1{`RANDOM}};
  uops_2_xcpt_ma_if = _RAND_292[0:0];
  _RAND_293 = {1{`RANDOM}};
  uops_2_bp_debug_if = _RAND_293[0:0];
  _RAND_294 = {1{`RANDOM}};
  uops_2_bp_xcpt_if = _RAND_294[0:0];
  _RAND_295 = {1{`RANDOM}};
  uops_2_debug_fsrc = _RAND_295[1:0];
  _RAND_296 = {1{`RANDOM}};
  uops_2_debug_tsrc = _RAND_296[1:0];
  _RAND_297 = {1{`RANDOM}};
  uops_3_switch = _RAND_297[0:0];
  _RAND_298 = {1{`RANDOM}};
  uops_3_switch_off = _RAND_298[0:0];
  _RAND_299 = {1{`RANDOM}};
  uops_3_is_unicore = _RAND_299[0:0];
  _RAND_300 = {1{`RANDOM}};
  uops_3_shift = _RAND_300[2:0];
  _RAND_301 = {1{`RANDOM}};
  uops_3_lrs3_rtype = _RAND_301[1:0];
  _RAND_302 = {1{`RANDOM}};
  uops_3_rflag = _RAND_302[0:0];
  _RAND_303 = {1{`RANDOM}};
  uops_3_wflag = _RAND_303[0:0];
  _RAND_304 = {1{`RANDOM}};
  uops_3_prflag = _RAND_304[3:0];
  _RAND_305 = {1{`RANDOM}};
  uops_3_pwflag = _RAND_305[3:0];
  _RAND_306 = {1{`RANDOM}};
  uops_3_pflag_busy = _RAND_306[0:0];
  _RAND_307 = {1{`RANDOM}};
  uops_3_stale_pflag = _RAND_307[3:0];
  _RAND_308 = {1{`RANDOM}};
  uops_3_op1_sel = _RAND_308[3:0];
  _RAND_309 = {1{`RANDOM}};
  uops_3_op2_sel = _RAND_309[3:0];
  _RAND_310 = {1{`RANDOM}};
  uops_3_split_num = _RAND_310[5:0];
  _RAND_311 = {1{`RANDOM}};
  uops_3_self_index = _RAND_311[5:0];
  _RAND_312 = {1{`RANDOM}};
  uops_3_rob_inst_idx = _RAND_312[5:0];
  _RAND_313 = {1{`RANDOM}};
  uops_3_address_num = _RAND_313[5:0];
  _RAND_314 = {1{`RANDOM}};
  uops_3_uopc = _RAND_314[6:0];
  _RAND_315 = {1{`RANDOM}};
  uops_3_inst = _RAND_315[31:0];
  _RAND_316 = {1{`RANDOM}};
  uops_3_debug_inst = _RAND_316[31:0];
  _RAND_317 = {1{`RANDOM}};
  uops_3_is_rvc = _RAND_317[0:0];
  _RAND_318 = {2{`RANDOM}};
  uops_3_debug_pc = _RAND_318[39:0];
  _RAND_319 = {1{`RANDOM}};
  uops_3_iq_type = _RAND_319[2:0];
  _RAND_320 = {1{`RANDOM}};
  uops_3_fu_code = _RAND_320[9:0];
  _RAND_321 = {1{`RANDOM}};
  uops_3_ctrl_br_type = _RAND_321[3:0];
  _RAND_322 = {1{`RANDOM}};
  uops_3_ctrl_op1_sel = _RAND_322[1:0];
  _RAND_323 = {1{`RANDOM}};
  uops_3_ctrl_op2_sel = _RAND_323[2:0];
  _RAND_324 = {1{`RANDOM}};
  uops_3_ctrl_imm_sel = _RAND_324[2:0];
  _RAND_325 = {1{`RANDOM}};
  uops_3_ctrl_op_fcn = _RAND_325[3:0];
  _RAND_326 = {1{`RANDOM}};
  uops_3_ctrl_fcn_dw = _RAND_326[0:0];
  _RAND_327 = {1{`RANDOM}};
  uops_3_ctrl_csr_cmd = _RAND_327[2:0];
  _RAND_328 = {1{`RANDOM}};
  uops_3_ctrl_is_load = _RAND_328[0:0];
  _RAND_329 = {1{`RANDOM}};
  uops_3_ctrl_is_sta = _RAND_329[0:0];
  _RAND_330 = {1{`RANDOM}};
  uops_3_ctrl_is_std = _RAND_330[0:0];
  _RAND_331 = {1{`RANDOM}};
  uops_3_ctrl_op3_sel = _RAND_331[1:0];
  _RAND_332 = {1{`RANDOM}};
  uops_3_iw_state = _RAND_332[1:0];
  _RAND_333 = {1{`RANDOM}};
  uops_3_iw_p1_poisoned = _RAND_333[0:0];
  _RAND_334 = {1{`RANDOM}};
  uops_3_iw_p2_poisoned = _RAND_334[0:0];
  _RAND_335 = {1{`RANDOM}};
  uops_3_is_br = _RAND_335[0:0];
  _RAND_336 = {1{`RANDOM}};
  uops_3_is_jalr = _RAND_336[0:0];
  _RAND_337 = {1{`RANDOM}};
  uops_3_is_jal = _RAND_337[0:0];
  _RAND_338 = {1{`RANDOM}};
  uops_3_is_sfb = _RAND_338[0:0];
  _RAND_339 = {1{`RANDOM}};
  uops_3_br_mask = _RAND_339[11:0];
  _RAND_340 = {1{`RANDOM}};
  uops_3_br_tag = _RAND_340[3:0];
  _RAND_341 = {1{`RANDOM}};
  uops_3_ftq_idx = _RAND_341[4:0];
  _RAND_342 = {1{`RANDOM}};
  uops_3_edge_inst = _RAND_342[0:0];
  _RAND_343 = {1{`RANDOM}};
  uops_3_pc_lob = _RAND_343[5:0];
  _RAND_344 = {1{`RANDOM}};
  uops_3_taken = _RAND_344[0:0];
  _RAND_345 = {1{`RANDOM}};
  uops_3_imm_packed = _RAND_345[19:0];
  _RAND_346 = {1{`RANDOM}};
  uops_3_csr_addr = _RAND_346[11:0];
  _RAND_347 = {1{`RANDOM}};
  uops_3_rob_idx = _RAND_347[5:0];
  _RAND_348 = {1{`RANDOM}};
  uops_3_ldq_idx = _RAND_348[4:0];
  _RAND_349 = {1{`RANDOM}};
  uops_3_stq_idx = _RAND_349[4:0];
  _RAND_350 = {1{`RANDOM}};
  uops_3_rxq_idx = _RAND_350[1:0];
  _RAND_351 = {1{`RANDOM}};
  uops_3_pdst = _RAND_351[6:0];
  _RAND_352 = {1{`RANDOM}};
  uops_3_prs1 = _RAND_352[6:0];
  _RAND_353 = {1{`RANDOM}};
  uops_3_prs2 = _RAND_353[6:0];
  _RAND_354 = {1{`RANDOM}};
  uops_3_prs3 = _RAND_354[6:0];
  _RAND_355 = {1{`RANDOM}};
  uops_3_ppred = _RAND_355[4:0];
  _RAND_356 = {1{`RANDOM}};
  uops_3_prs1_busy = _RAND_356[0:0];
  _RAND_357 = {1{`RANDOM}};
  uops_3_prs2_busy = _RAND_357[0:0];
  _RAND_358 = {1{`RANDOM}};
  uops_3_prs3_busy = _RAND_358[0:0];
  _RAND_359 = {1{`RANDOM}};
  uops_3_ppred_busy = _RAND_359[0:0];
  _RAND_360 = {1{`RANDOM}};
  uops_3_stale_pdst = _RAND_360[6:0];
  _RAND_361 = {1{`RANDOM}};
  uops_3_exception = _RAND_361[0:0];
  _RAND_362 = {2{`RANDOM}};
  uops_3_exc_cause = _RAND_362[63:0];
  _RAND_363 = {1{`RANDOM}};
  uops_3_bypassable = _RAND_363[0:0];
  _RAND_364 = {1{`RANDOM}};
  uops_3_mem_cmd = _RAND_364[4:0];
  _RAND_365 = {1{`RANDOM}};
  uops_3_mem_size = _RAND_365[1:0];
  _RAND_366 = {1{`RANDOM}};
  uops_3_mem_signed = _RAND_366[0:0];
  _RAND_367 = {1{`RANDOM}};
  uops_3_is_fence = _RAND_367[0:0];
  _RAND_368 = {1{`RANDOM}};
  uops_3_is_fencei = _RAND_368[0:0];
  _RAND_369 = {1{`RANDOM}};
  uops_3_is_amo = _RAND_369[0:0];
  _RAND_370 = {1{`RANDOM}};
  uops_3_uses_ldq = _RAND_370[0:0];
  _RAND_371 = {1{`RANDOM}};
  uops_3_uses_stq = _RAND_371[0:0];
  _RAND_372 = {1{`RANDOM}};
  uops_3_is_sys_pc2epc = _RAND_372[0:0];
  _RAND_373 = {1{`RANDOM}};
  uops_3_is_unique = _RAND_373[0:0];
  _RAND_374 = {1{`RANDOM}};
  uops_3_flush_on_commit = _RAND_374[0:0];
  _RAND_375 = {1{`RANDOM}};
  uops_3_ldst_is_rs1 = _RAND_375[0:0];
  _RAND_376 = {1{`RANDOM}};
  uops_3_ldst = _RAND_376[5:0];
  _RAND_377 = {1{`RANDOM}};
  uops_3_lrs1 = _RAND_377[5:0];
  _RAND_378 = {1{`RANDOM}};
  uops_3_lrs2 = _RAND_378[5:0];
  _RAND_379 = {1{`RANDOM}};
  uops_3_lrs3 = _RAND_379[5:0];
  _RAND_380 = {1{`RANDOM}};
  uops_3_ldst_val = _RAND_380[0:0];
  _RAND_381 = {1{`RANDOM}};
  uops_3_dst_rtype = _RAND_381[1:0];
  _RAND_382 = {1{`RANDOM}};
  uops_3_lrs1_rtype = _RAND_382[1:0];
  _RAND_383 = {1{`RANDOM}};
  uops_3_lrs2_rtype = _RAND_383[1:0];
  _RAND_384 = {1{`RANDOM}};
  uops_3_frs3_en = _RAND_384[0:0];
  _RAND_385 = {1{`RANDOM}};
  uops_3_fp_val = _RAND_385[0:0];
  _RAND_386 = {1{`RANDOM}};
  uops_3_fp_single = _RAND_386[0:0];
  _RAND_387 = {1{`RANDOM}};
  uops_3_xcpt_pf_if = _RAND_387[0:0];
  _RAND_388 = {1{`RANDOM}};
  uops_3_xcpt_ae_if = _RAND_388[0:0];
  _RAND_389 = {1{`RANDOM}};
  uops_3_xcpt_ma_if = _RAND_389[0:0];
  _RAND_390 = {1{`RANDOM}};
  uops_3_bp_debug_if = _RAND_390[0:0];
  _RAND_391 = {1{`RANDOM}};
  uops_3_bp_xcpt_if = _RAND_391[0:0];
  _RAND_392 = {1{`RANDOM}};
  uops_3_debug_fsrc = _RAND_392[1:0];
  _RAND_393 = {1{`RANDOM}};
  uops_3_debug_tsrc = _RAND_393[1:0];
  _RAND_394 = {1{`RANDOM}};
  value = _RAND_394[1:0];
  _RAND_395 = {1{`RANDOM}};
  value_1 = _RAND_395[1:0];
  _RAND_396 = {1{`RANDOM}};
  maybe_full = _RAND_396[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
