module BoomIOMSHR(
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
  input  [39:0] io_req_bits_addr,
  input  [63:0] io_req_bits_data,
  input         io_req_bits_is_hella,
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
  input         io_mem_access_ready,
  output        io_mem_access_valid,
  output [2:0]  io_mem_access_bits_opcode,
  output [2:0]  io_mem_access_bits_param,
  output [3:0]  io_mem_access_bits_size,
  output [1:0]  io_mem_access_bits_source,
  output [31:0] io_mem_access_bits_address,
  output [7:0]  io_mem_access_bits_mask,
  output [63:0] io_mem_access_bits_data,
  output        io_mem_access_bits_corrupt,
  input         io_mem_ack_valid,
  input  [2:0]  io_mem_ack_bits_opcode,
  input  [1:0]  io_mem_ack_bits_param,
  input  [3:0]  io_mem_ack_bits_size,
  input  [1:0]  io_mem_ack_bits_source,
  input  [1:0]  io_mem_ack_bits_sink,
  input         io_mem_ack_bits_denied,
  input  [63:0] io_mem_ack_bits_data,
  input         io_mem_ack_bits_corrupt
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
  reg [63:0] _RAND_21;
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
  reg [63:0] _RAND_65;
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
  reg [63:0] _RAND_97;
  reg [63:0] _RAND_98;
  reg [63:0] _RAND_99;
  reg [31:0] _RAND_100;
`endif // RANDOMIZE_REG_INIT
  reg  req_uop_switch; // @[mshrs.scala 410:16]
  reg  req_uop_switch_off; // @[mshrs.scala 410:16]
  reg  req_uop_is_unicore; // @[mshrs.scala 410:16]
  reg [2:0] req_uop_shift; // @[mshrs.scala 410:16]
  reg [1:0] req_uop_lrs3_rtype; // @[mshrs.scala 410:16]
  reg  req_uop_rflag; // @[mshrs.scala 410:16]
  reg  req_uop_wflag; // @[mshrs.scala 410:16]
  reg [3:0] req_uop_prflag; // @[mshrs.scala 410:16]
  reg [3:0] req_uop_pwflag; // @[mshrs.scala 410:16]
  reg  req_uop_pflag_busy; // @[mshrs.scala 410:16]
  reg [3:0] req_uop_stale_pflag; // @[mshrs.scala 410:16]
  reg [3:0] req_uop_op1_sel; // @[mshrs.scala 410:16]
  reg [3:0] req_uop_op2_sel; // @[mshrs.scala 410:16]
  reg [5:0] req_uop_split_num; // @[mshrs.scala 410:16]
  reg [5:0] req_uop_self_index; // @[mshrs.scala 410:16]
  reg [5:0] req_uop_rob_inst_idx; // @[mshrs.scala 410:16]
  reg [5:0] req_uop_address_num; // @[mshrs.scala 410:16]
  reg [6:0] req_uop_uopc; // @[mshrs.scala 410:16]
  reg [31:0] req_uop_inst; // @[mshrs.scala 410:16]
  reg [31:0] req_uop_debug_inst; // @[mshrs.scala 410:16]
  reg  req_uop_is_rvc; // @[mshrs.scala 410:16]
  reg [39:0] req_uop_debug_pc; // @[mshrs.scala 410:16]
  reg [2:0] req_uop_iq_type; // @[mshrs.scala 410:16]
  reg [9:0] req_uop_fu_code; // @[mshrs.scala 410:16]
  reg [3:0] req_uop_ctrl_br_type; // @[mshrs.scala 410:16]
  reg [1:0] req_uop_ctrl_op1_sel; // @[mshrs.scala 410:16]
  reg [2:0] req_uop_ctrl_op2_sel; // @[mshrs.scala 410:16]
  reg [2:0] req_uop_ctrl_imm_sel; // @[mshrs.scala 410:16]
  reg [3:0] req_uop_ctrl_op_fcn; // @[mshrs.scala 410:16]
  reg  req_uop_ctrl_fcn_dw; // @[mshrs.scala 410:16]
  reg [2:0] req_uop_ctrl_csr_cmd; // @[mshrs.scala 410:16]
  reg  req_uop_ctrl_is_load; // @[mshrs.scala 410:16]
  reg  req_uop_ctrl_is_sta; // @[mshrs.scala 410:16]
  reg  req_uop_ctrl_is_std; // @[mshrs.scala 410:16]
  reg [1:0] req_uop_ctrl_op3_sel; // @[mshrs.scala 410:16]
  reg [1:0] req_uop_iw_state; // @[mshrs.scala 410:16]
  reg  req_uop_iw_p1_poisoned; // @[mshrs.scala 410:16]
  reg  req_uop_iw_p2_poisoned; // @[mshrs.scala 410:16]
  reg  req_uop_is_br; // @[mshrs.scala 410:16]
  reg  req_uop_is_jalr; // @[mshrs.scala 410:16]
  reg  req_uop_is_jal; // @[mshrs.scala 410:16]
  reg  req_uop_is_sfb; // @[mshrs.scala 410:16]
  reg [11:0] req_uop_br_mask; // @[mshrs.scala 410:16]
  reg [3:0] req_uop_br_tag; // @[mshrs.scala 410:16]
  reg [4:0] req_uop_ftq_idx; // @[mshrs.scala 410:16]
  reg  req_uop_edge_inst; // @[mshrs.scala 410:16]
  reg [5:0] req_uop_pc_lob; // @[mshrs.scala 410:16]
  reg  req_uop_taken; // @[mshrs.scala 410:16]
  reg [19:0] req_uop_imm_packed; // @[mshrs.scala 410:16]
  reg [11:0] req_uop_csr_addr; // @[mshrs.scala 410:16]
  reg [5:0] req_uop_rob_idx; // @[mshrs.scala 410:16]
  reg [4:0] req_uop_ldq_idx; // @[mshrs.scala 410:16]
  reg [4:0] req_uop_stq_idx; // @[mshrs.scala 410:16]
  reg [1:0] req_uop_rxq_idx; // @[mshrs.scala 410:16]
  reg [6:0] req_uop_pdst; // @[mshrs.scala 410:16]
  reg [6:0] req_uop_prs1; // @[mshrs.scala 410:16]
  reg [6:0] req_uop_prs2; // @[mshrs.scala 410:16]
  reg [6:0] req_uop_prs3; // @[mshrs.scala 410:16]
  reg [4:0] req_uop_ppred; // @[mshrs.scala 410:16]
  reg  req_uop_prs1_busy; // @[mshrs.scala 410:16]
  reg  req_uop_prs2_busy; // @[mshrs.scala 410:16]
  reg  req_uop_prs3_busy; // @[mshrs.scala 410:16]
  reg  req_uop_ppred_busy; // @[mshrs.scala 410:16]
  reg [6:0] req_uop_stale_pdst; // @[mshrs.scala 410:16]
  reg  req_uop_exception; // @[mshrs.scala 410:16]
  reg [63:0] req_uop_exc_cause; // @[mshrs.scala 410:16]
  reg  req_uop_bypassable; // @[mshrs.scala 410:16]
  reg [4:0] req_uop_mem_cmd; // @[mshrs.scala 410:16]
  reg [1:0] req_uop_mem_size; // @[mshrs.scala 410:16]
  reg  req_uop_mem_signed; // @[mshrs.scala 410:16]
  reg  req_uop_is_fence; // @[mshrs.scala 410:16]
  reg  req_uop_is_fencei; // @[mshrs.scala 410:16]
  reg  req_uop_is_amo; // @[mshrs.scala 410:16]
  reg  req_uop_uses_ldq; // @[mshrs.scala 410:16]
  reg  req_uop_uses_stq; // @[mshrs.scala 410:16]
  reg  req_uop_is_sys_pc2epc; // @[mshrs.scala 410:16]
  reg  req_uop_is_unique; // @[mshrs.scala 410:16]
  reg  req_uop_flush_on_commit; // @[mshrs.scala 410:16]
  reg  req_uop_ldst_is_rs1; // @[mshrs.scala 410:16]
  reg [5:0] req_uop_ldst; // @[mshrs.scala 410:16]
  reg [5:0] req_uop_lrs1; // @[mshrs.scala 410:16]
  reg [5:0] req_uop_lrs2; // @[mshrs.scala 410:16]
  reg [5:0] req_uop_lrs3; // @[mshrs.scala 410:16]
  reg  req_uop_ldst_val; // @[mshrs.scala 410:16]
  reg [1:0] req_uop_dst_rtype; // @[mshrs.scala 410:16]
  reg [1:0] req_uop_lrs1_rtype; // @[mshrs.scala 410:16]
  reg [1:0] req_uop_lrs2_rtype; // @[mshrs.scala 410:16]
  reg  req_uop_frs3_en; // @[mshrs.scala 410:16]
  reg  req_uop_fp_val; // @[mshrs.scala 410:16]
  reg  req_uop_fp_single; // @[mshrs.scala 410:16]
  reg  req_uop_xcpt_pf_if; // @[mshrs.scala 410:16]
  reg  req_uop_xcpt_ae_if; // @[mshrs.scala 410:16]
  reg  req_uop_xcpt_ma_if; // @[mshrs.scala 410:16]
  reg  req_uop_bp_debug_if; // @[mshrs.scala 410:16]
  reg  req_uop_bp_xcpt_if; // @[mshrs.scala 410:16]
  reg [1:0] req_uop_debug_fsrc; // @[mshrs.scala 410:16]
  reg [1:0] req_uop_debug_tsrc; // @[mshrs.scala 410:16]
  reg [39:0] req_addr; // @[mshrs.scala 410:16]
  reg [63:0] req_data; // @[mshrs.scala 410:16]
  reg [63:0] grant_word; // @[mshrs.scala 411:23]
  reg [1:0] state; // @[mshrs.scala 415:22]
  wire  _T = state == 2'h0; // @[mshrs.scala 416:25]
  wire [2:0] _a_mask_sizeOH_T = {{1'd0}, req_uop_mem_size}; // @[Misc.scala 201:34]
  wire [1:0] a_mask_sizeOH_shiftAmount = _a_mask_sizeOH_T[1:0]; // @[OneHot.scala 64:49]
  wire [3:0] _a_mask_sizeOH_T_1 = 4'h1 << a_mask_sizeOH_shiftAmount; // @[OneHot.scala 65:12]
  wire [2:0] a_mask_sizeOH = _a_mask_sizeOH_T_1[2:0] | 3'h1; // @[Misc.scala 201:81]
  wire  _a_mask_T = req_uop_mem_size >= 2'h3; // @[Misc.scala 205:21]
  wire  a_mask_size = a_mask_sizeOH[2]; // @[Misc.scala 208:26]
  wire  a_mask_bit = req_addr[2]; // @[Misc.scala 209:26]
  wire  a_mask_nbit = ~a_mask_bit; // @[Misc.scala 210:20]
  wire  a_mask_acc = _a_mask_T | a_mask_size & a_mask_nbit; // @[Misc.scala 214:29]
  wire  a_mask_acc_1 = _a_mask_T | a_mask_size & a_mask_bit; // @[Misc.scala 214:29]
  wire  a_mask_size_1 = a_mask_sizeOH[1]; // @[Misc.scala 208:26]
  wire  a_mask_bit_1 = req_addr[1]; // @[Misc.scala 209:26]
  wire  a_mask_nbit_1 = ~a_mask_bit_1; // @[Misc.scala 210:20]
  wire  a_mask_eq_2 = a_mask_nbit & a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_2 = a_mask_acc | a_mask_size_1 & a_mask_eq_2; // @[Misc.scala 214:29]
  wire  a_mask_eq_3 = a_mask_nbit & a_mask_bit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_3 = a_mask_acc | a_mask_size_1 & a_mask_eq_3; // @[Misc.scala 214:29]
  wire  a_mask_eq_4 = a_mask_bit & a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_4 = a_mask_acc_1 | a_mask_size_1 & a_mask_eq_4; // @[Misc.scala 214:29]
  wire  a_mask_eq_5 = a_mask_bit & a_mask_bit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_5 = a_mask_acc_1 | a_mask_size_1 & a_mask_eq_5; // @[Misc.scala 214:29]
  wire  a_mask_size_2 = a_mask_sizeOH[0]; // @[Misc.scala 208:26]
  wire  a_mask_bit_2 = req_addr[0]; // @[Misc.scala 209:26]
  wire  a_mask_nbit_2 = ~a_mask_bit_2; // @[Misc.scala 210:20]
  wire  a_mask_eq_6 = a_mask_eq_2 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_lo_lo_lo = a_mask_acc_2 | a_mask_size_2 & a_mask_eq_6; // @[Misc.scala 214:29]
  wire  a_mask_eq_7 = a_mask_eq_2 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_lo_lo_hi = a_mask_acc_2 | a_mask_size_2 & a_mask_eq_7; // @[Misc.scala 214:29]
  wire  a_mask_eq_8 = a_mask_eq_3 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_lo_hi_lo = a_mask_acc_3 | a_mask_size_2 & a_mask_eq_8; // @[Misc.scala 214:29]
  wire  a_mask_eq_9 = a_mask_eq_3 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_lo_hi_hi = a_mask_acc_3 | a_mask_size_2 & a_mask_eq_9; // @[Misc.scala 214:29]
  wire  a_mask_eq_10 = a_mask_eq_4 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_hi_lo_lo = a_mask_acc_4 | a_mask_size_2 & a_mask_eq_10; // @[Misc.scala 214:29]
  wire  a_mask_eq_11 = a_mask_eq_4 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_hi_lo_hi = a_mask_acc_4 | a_mask_size_2 & a_mask_eq_11; // @[Misc.scala 214:29]
  wire  a_mask_eq_12 = a_mask_eq_5 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_hi_hi_lo = a_mask_acc_5 | a_mask_size_2 & a_mask_eq_12; // @[Misc.scala 214:29]
  wire  a_mask_eq_13 = a_mask_eq_5 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_hi_hi_hi = a_mask_acc_5 | a_mask_size_2 & a_mask_eq_13; // @[Misc.scala 214:29]
  wire [7:0] get_mask = {a_mask_hi_hi_hi,a_mask_hi_hi_lo,a_mask_hi_lo_hi,a_mask_hi_lo_lo,a_mask_lo_hi_hi,a_mask_lo_hi_lo
    ,a_mask_lo_lo_hi,a_mask_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [2:0] _T_2_opcode = 5'h4 == req_uop_mem_cmd ? 3'h3 : 3'h0; // @[Mux.scala 80:57]
  wire [3:0] a_size = {{2'd0}, req_uop_mem_size}; // @[Edges.scala 513:17 Edges.scala 516:15]
  wire [3:0] _T_2_size = 5'h4 == req_uop_mem_cmd ? a_size : 4'h0; // @[Mux.scala 80:57]
  wire [1:0] _T_2_source = 5'h4 == req_uop_mem_cmd ? 2'h3 : 2'h0; // @[Mux.scala 80:57]
  wire [31:0] a_address = req_addr[31:0]; // @[Edges.scala 513:17 Edges.scala 518:15]
  wire [31:0] _T_2_address = 5'h4 == req_uop_mem_cmd ? a_address : 32'h0; // @[Mux.scala 80:57]
  wire [7:0] _T_2_mask = 5'h4 == req_uop_mem_cmd ? get_mask : 8'h0; // @[Mux.scala 80:57]
  wire [63:0] _T_2_data = 5'h4 == req_uop_mem_cmd ? req_data : 64'h0; // @[Mux.scala 80:57]
  wire [2:0] _T_4_opcode = 5'h9 == req_uop_mem_cmd ? 3'h3 : _T_2_opcode; // @[Mux.scala 80:57]
  wire [2:0] _T_4_param = 5'h9 == req_uop_mem_cmd ? 3'h0 : _T_2_opcode; // @[Mux.scala 80:57]
  wire [3:0] _T_4_size = 5'h9 == req_uop_mem_cmd ? a_size : _T_2_size; // @[Mux.scala 80:57]
  wire [1:0] _T_4_source = 5'h9 == req_uop_mem_cmd ? 2'h3 : _T_2_source; // @[Mux.scala 80:57]
  wire [31:0] _T_4_address = 5'h9 == req_uop_mem_cmd ? a_address : _T_2_address; // @[Mux.scala 80:57]
  wire [7:0] _T_4_mask = 5'h9 == req_uop_mem_cmd ? get_mask : _T_2_mask; // @[Mux.scala 80:57]
  wire [63:0] _T_4_data = 5'h9 == req_uop_mem_cmd ? req_data : _T_2_data; // @[Mux.scala 80:57]
  wire [2:0] _T_6_opcode = 5'ha == req_uop_mem_cmd ? 3'h3 : _T_4_opcode; // @[Mux.scala 80:57]
  wire [2:0] _T_6_param = 5'ha == req_uop_mem_cmd ? 3'h1 : _T_4_param; // @[Mux.scala 80:57]
  wire [3:0] _T_6_size = 5'ha == req_uop_mem_cmd ? a_size : _T_4_size; // @[Mux.scala 80:57]
  wire [1:0] _T_6_source = 5'ha == req_uop_mem_cmd ? 2'h3 : _T_4_source; // @[Mux.scala 80:57]
  wire [31:0] _T_6_address = 5'ha == req_uop_mem_cmd ? a_address : _T_4_address; // @[Mux.scala 80:57]
  wire [7:0] _T_6_mask = 5'ha == req_uop_mem_cmd ? get_mask : _T_4_mask; // @[Mux.scala 80:57]
  wire [63:0] _T_6_data = 5'ha == req_uop_mem_cmd ? req_data : _T_4_data; // @[Mux.scala 80:57]
  wire [2:0] _T_8_opcode = 5'hb == req_uop_mem_cmd ? 3'h3 : _T_6_opcode; // @[Mux.scala 80:57]
  wire [2:0] _T_8_param = 5'hb == req_uop_mem_cmd ? 3'h2 : _T_6_param; // @[Mux.scala 80:57]
  wire [3:0] _T_8_size = 5'hb == req_uop_mem_cmd ? a_size : _T_6_size; // @[Mux.scala 80:57]
  wire [1:0] _T_8_source = 5'hb == req_uop_mem_cmd ? 2'h3 : _T_6_source; // @[Mux.scala 80:57]
  wire [31:0] _T_8_address = 5'hb == req_uop_mem_cmd ? a_address : _T_6_address; // @[Mux.scala 80:57]
  wire [7:0] _T_8_mask = 5'hb == req_uop_mem_cmd ? get_mask : _T_6_mask; // @[Mux.scala 80:57]
  wire [63:0] _T_8_data = 5'hb == req_uop_mem_cmd ? req_data : _T_6_data; // @[Mux.scala 80:57]
  wire [2:0] _T_10_opcode = 5'h8 == req_uop_mem_cmd ? 3'h2 : _T_8_opcode; // @[Mux.scala 80:57]
  wire [2:0] _T_10_param = 5'h8 == req_uop_mem_cmd ? 3'h4 : _T_8_param; // @[Mux.scala 80:57]
  wire [3:0] _T_10_size = 5'h8 == req_uop_mem_cmd ? a_size : _T_8_size; // @[Mux.scala 80:57]
  wire [1:0] _T_10_source = 5'h8 == req_uop_mem_cmd ? 2'h3 : _T_8_source; // @[Mux.scala 80:57]
  wire [31:0] _T_10_address = 5'h8 == req_uop_mem_cmd ? a_address : _T_8_address; // @[Mux.scala 80:57]
  wire [7:0] _T_10_mask = 5'h8 == req_uop_mem_cmd ? get_mask : _T_8_mask; // @[Mux.scala 80:57]
  wire [63:0] _T_10_data = 5'h8 == req_uop_mem_cmd ? req_data : _T_8_data; // @[Mux.scala 80:57]
  wire [2:0] _T_12_opcode = 5'hc == req_uop_mem_cmd ? 3'h2 : _T_10_opcode; // @[Mux.scala 80:57]
  wire [2:0] _T_12_param = 5'hc == req_uop_mem_cmd ? 3'h0 : _T_10_param; // @[Mux.scala 80:57]
  wire [3:0] _T_12_size = 5'hc == req_uop_mem_cmd ? a_size : _T_10_size; // @[Mux.scala 80:57]
  wire [1:0] _T_12_source = 5'hc == req_uop_mem_cmd ? 2'h3 : _T_10_source; // @[Mux.scala 80:57]
  wire [31:0] _T_12_address = 5'hc == req_uop_mem_cmd ? a_address : _T_10_address; // @[Mux.scala 80:57]
  wire [7:0] _T_12_mask = 5'hc == req_uop_mem_cmd ? get_mask : _T_10_mask; // @[Mux.scala 80:57]
  wire [63:0] _T_12_data = 5'hc == req_uop_mem_cmd ? req_data : _T_10_data; // @[Mux.scala 80:57]
  wire [2:0] _T_14_opcode = 5'hd == req_uop_mem_cmd ? 3'h2 : _T_12_opcode; // @[Mux.scala 80:57]
  wire [2:0] _T_14_param = 5'hd == req_uop_mem_cmd ? 3'h1 : _T_12_param; // @[Mux.scala 80:57]
  wire [3:0] _T_14_size = 5'hd == req_uop_mem_cmd ? a_size : _T_12_size; // @[Mux.scala 80:57]
  wire [1:0] _T_14_source = 5'hd == req_uop_mem_cmd ? 2'h3 : _T_12_source; // @[Mux.scala 80:57]
  wire [31:0] _T_14_address = 5'hd == req_uop_mem_cmd ? a_address : _T_12_address; // @[Mux.scala 80:57]
  wire [7:0] _T_14_mask = 5'hd == req_uop_mem_cmd ? get_mask : _T_12_mask; // @[Mux.scala 80:57]
  wire [63:0] _T_14_data = 5'hd == req_uop_mem_cmd ? req_data : _T_12_data; // @[Mux.scala 80:57]
  wire [2:0] _T_16_opcode = 5'he == req_uop_mem_cmd ? 3'h2 : _T_14_opcode; // @[Mux.scala 80:57]
  wire [2:0] _T_16_param = 5'he == req_uop_mem_cmd ? 3'h2 : _T_14_param; // @[Mux.scala 80:57]
  wire [3:0] _T_16_size = 5'he == req_uop_mem_cmd ? a_size : _T_14_size; // @[Mux.scala 80:57]
  wire [1:0] _T_16_source = 5'he == req_uop_mem_cmd ? 2'h3 : _T_14_source; // @[Mux.scala 80:57]
  wire [31:0] _T_16_address = 5'he == req_uop_mem_cmd ? a_address : _T_14_address; // @[Mux.scala 80:57]
  wire [7:0] _T_16_mask = 5'he == req_uop_mem_cmd ? get_mask : _T_14_mask; // @[Mux.scala 80:57]
  wire [63:0] _T_16_data = 5'he == req_uop_mem_cmd ? req_data : _T_14_data; // @[Mux.scala 80:57]
  wire [2:0] atomics_opcode = 5'hf == req_uop_mem_cmd ? 3'h2 : _T_16_opcode; // @[Mux.scala 80:57]
  wire [2:0] atomics_param = 5'hf == req_uop_mem_cmd ? 3'h3 : _T_16_param; // @[Mux.scala 80:57]
  wire [3:0] atomics_size = 5'hf == req_uop_mem_cmd ? a_size : _T_16_size; // @[Mux.scala 80:57]
  wire [1:0] atomics_source = 5'hf == req_uop_mem_cmd ? 2'h3 : _T_16_source; // @[Mux.scala 80:57]
  wire [31:0] atomics_address = 5'hf == req_uop_mem_cmd ? a_address : _T_16_address; // @[Mux.scala 80:57]
  wire [7:0] atomics_mask = 5'hf == req_uop_mem_cmd ? get_mask : _T_16_mask; // @[Mux.scala 80:57]
  wire [63:0] atomics_data = 5'hf == req_uop_mem_cmd ? req_data : _T_16_data; // @[Mux.scala 80:57]
  wire  _T_25 = req_uop_mem_cmd == 5'h4; // @[package.scala 15:47]
  wire  _T_26 = req_uop_mem_cmd == 5'h9; // @[package.scala 15:47]
  wire  _T_27 = req_uop_mem_cmd == 5'ha; // @[package.scala 15:47]
  wire  _T_28 = req_uop_mem_cmd == 5'hb; // @[package.scala 15:47]
  wire  _T_31 = _T_25 | _T_26 | _T_27 | _T_28; // @[package.scala 72:59]
  wire  _T_32 = req_uop_mem_cmd == 5'h8; // @[package.scala 15:47]
  wire  _T_33 = req_uop_mem_cmd == 5'hc; // @[package.scala 15:47]
  wire  _T_34 = req_uop_mem_cmd == 5'hd; // @[package.scala 15:47]
  wire  _T_35 = req_uop_mem_cmd == 5'he; // @[package.scala 15:47]
  wire  _T_36 = req_uop_mem_cmd == 5'hf; // @[package.scala 15:47]
  wire  _T_40 = _T_32 | _T_33 | _T_34 | _T_35 | _T_36; // @[package.scala 72:59]
  wire  _T_41 = _T_31 | _T_40; // @[Consts.scala 79:44]
  wire  _T_64 = req_uop_mem_cmd == 5'h0 | req_uop_mem_cmd == 5'h6 | req_uop_mem_cmd == 5'h7 | _T_41; // @[Consts.scala 81:75]
  wire [2:0] _T_65_opcode = _T_64 ? 3'h4 : 3'h0; // @[mshrs.scala 446:66]
  wire [3:0] _T_65_size = _T_64 ? a_size : a_size; // @[mshrs.scala 446:66]
  wire [31:0] _T_65_address = _T_64 ? a_address : a_address; // @[mshrs.scala 446:66]
  wire [7:0] _T_65_mask = _T_64 ? get_mask : get_mask; // @[mshrs.scala 446:66]
  wire [63:0] _T_65_data = _T_64 ? 64'h0 : req_data; // @[mshrs.scala 446:66]
  wire  _T_89 = state == 2'h3; // @[mshrs.scala 450:31]
  wire [31:0] shifted = a_mask_bit ? grant_word[63:32] : grant_word[31:0]; // @[AMOALU.scala 39:24]
  wire  _T_94 = req_uop_mem_signed & shifted[31]; // @[AMOALU.scala 42:76]
  wire [31:0] _T_96 = _T_94 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] hi = req_uop_mem_size == 2'h2 ? _T_96 : grant_word[63:32]; // @[AMOALU.scala 42:20]
  wire [63:0] _T_98 = {hi,shifted}; // @[Cat.scala 30:58]
  wire [15:0] shifted_1 = a_mask_bit_1 ? _T_98[31:16] : _T_98[15:0]; // @[AMOALU.scala 39:24]
  wire  _T_102 = req_uop_mem_signed & shifted_1[15]; // @[AMOALU.scala 42:76]
  wire [47:0] _T_104 = _T_102 ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 72:12]
  wire [47:0] hi_1 = req_uop_mem_size == 2'h1 ? _T_104 : _T_98[63:16]; // @[AMOALU.scala 42:20]
  wire [63:0] _T_106 = {hi_1,shifted_1}; // @[Cat.scala 30:58]
  wire [7:0] shifted_2 = a_mask_bit_2 ? _T_106[15:8] : _T_106[7:0]; // @[AMOALU.scala 39:24]
  wire  _T_110 = req_uop_mem_signed & shifted_2[7]; // @[AMOALU.scala 42:76]
  wire [55:0] _T_112 = _T_110 ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 72:12]
  wire [55:0] hi_2 = req_uop_mem_size == 2'h0 ? _T_112 : _T_106[63:8]; // @[AMOALU.scala 42:20]
  wire  _T_115 = io_req_ready & io_req_valid; // @[Decoupled.scala 40:37]
  wire [1:0] _GEN_100 = _T_115 ? 2'h1 : state; // @[mshrs.scala 454:24 mshrs.scala 456:11 mshrs.scala 415:22]
  wire  _T_116 = io_mem_access_ready & io_mem_access_valid; // @[Decoupled.scala 40:37]
  wire [1:0] _GEN_101 = _T_116 ? 2'h2 : _GEN_100; // @[mshrs.scala 458:31 mshrs.scala 459:11]
  wire [1:0] _GEN_103 = state == 2'h2 & io_mem_ack_valid ? 2'h3 : _GEN_101; // @[mshrs.scala 461:50 mshrs.scala 462:11]
  wire  _T_147 = io_resp_ready & io_resp_valid; // @[Decoupled.scala 40:37]
  assign io_req_ready = state == 2'h0; // @[mshrs.scala 416:25]
  assign io_resp_valid = state == 2'h3 & _T_64; // @[mshrs.scala 450:43]
  assign io_resp_bits_uop_switch = req_uop_switch; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_switch_off = req_uop_switch_off; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_is_unicore = req_uop_is_unicore; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_shift = req_uop_shift; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_lrs3_rtype = req_uop_lrs3_rtype; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_rflag = req_uop_rflag; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_wflag = req_uop_wflag; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_prflag = req_uop_prflag; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_pwflag = req_uop_pwflag; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_pflag_busy = req_uop_pflag_busy; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_stale_pflag = req_uop_stale_pflag; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_op1_sel = req_uop_op1_sel; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_op2_sel = req_uop_op2_sel; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_split_num = req_uop_split_num; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_self_index = req_uop_self_index; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_rob_inst_idx = req_uop_rob_inst_idx; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_address_num = req_uop_address_num; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_uopc = req_uop_uopc; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_inst = req_uop_inst; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_debug_inst = req_uop_debug_inst; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_is_rvc = req_uop_is_rvc; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_debug_pc = req_uop_debug_pc; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_iq_type = req_uop_iq_type; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_fu_code = req_uop_fu_code; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ctrl_br_type = req_uop_ctrl_br_type; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ctrl_op1_sel = req_uop_ctrl_op1_sel; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ctrl_op2_sel = req_uop_ctrl_op2_sel; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ctrl_imm_sel = req_uop_ctrl_imm_sel; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ctrl_op_fcn = req_uop_ctrl_op_fcn; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ctrl_fcn_dw = req_uop_ctrl_fcn_dw; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ctrl_csr_cmd = req_uop_ctrl_csr_cmd; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ctrl_is_load = req_uop_ctrl_is_load; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ctrl_is_sta = req_uop_ctrl_is_sta; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ctrl_is_std = req_uop_ctrl_is_std; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ctrl_op3_sel = req_uop_ctrl_op3_sel; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_iw_state = req_uop_iw_state; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_iw_p1_poisoned = req_uop_iw_p1_poisoned; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_iw_p2_poisoned = req_uop_iw_p2_poisoned; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_is_br = req_uop_is_br; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_is_jalr = req_uop_is_jalr; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_is_jal = req_uop_is_jal; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_is_sfb = req_uop_is_sfb; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_br_mask = req_uop_br_mask; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_br_tag = req_uop_br_tag; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ftq_idx = req_uop_ftq_idx; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_edge_inst = req_uop_edge_inst; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_pc_lob = req_uop_pc_lob; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_taken = req_uop_taken; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_imm_packed = req_uop_imm_packed; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_csr_addr = req_uop_csr_addr; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_rob_idx = req_uop_rob_idx; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ldq_idx = req_uop_ldq_idx; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_stq_idx = req_uop_stq_idx; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_rxq_idx = req_uop_rxq_idx; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_pdst = req_uop_pdst; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_prs1 = req_uop_prs1; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_prs2 = req_uop_prs2; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_prs3 = req_uop_prs3; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ppred = req_uop_ppred; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_prs1_busy = req_uop_prs1_busy; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_prs2_busy = req_uop_prs2_busy; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_prs3_busy = req_uop_prs3_busy; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ppred_busy = req_uop_ppred_busy; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_stale_pdst = req_uop_stale_pdst; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_exception = req_uop_exception; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_exc_cause = req_uop_exc_cause; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_bypassable = req_uop_bypassable; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_mem_cmd = req_uop_mem_cmd; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_mem_size = req_uop_mem_size; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_mem_signed = req_uop_mem_signed; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_is_fence = req_uop_is_fence; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_is_fencei = req_uop_is_fencei; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_is_amo = req_uop_is_amo; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_uses_ldq = req_uop_uses_ldq; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_uses_stq = req_uop_uses_stq; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_is_sys_pc2epc = req_uop_is_sys_pc2epc; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_is_unique = req_uop_is_unique; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_flush_on_commit = req_uop_flush_on_commit; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ldst_is_rs1 = req_uop_ldst_is_rs1; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ldst = req_uop_ldst; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_lrs1 = req_uop_lrs1; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_lrs2 = req_uop_lrs2; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_lrs3 = req_uop_lrs3; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_ldst_val = req_uop_ldst_val; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_dst_rtype = req_uop_dst_rtype; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_lrs1_rtype = req_uop_lrs1_rtype; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_lrs2_rtype = req_uop_lrs2_rtype; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_frs3_en = req_uop_frs3_en; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_fp_val = req_uop_fp_val; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_fp_single = req_uop_fp_single; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_xcpt_pf_if = req_uop_xcpt_pf_if; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_xcpt_ae_if = req_uop_xcpt_ae_if; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_xcpt_ma_if = req_uop_xcpt_ma_if; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_bp_debug_if = req_uop_bp_debug_if; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_bp_xcpt_if = req_uop_bp_xcpt_if; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_debug_fsrc = req_uop_debug_fsrc; // @[mshrs.scala 451:21]
  assign io_resp_bits_uop_debug_tsrc = req_uop_debug_tsrc; // @[mshrs.scala 451:21]
  assign io_resp_bits_data = {hi_2,shifted_2}; // @[Cat.scala 30:58]
  assign io_resp_bits_is_hella = 1'h0;
  assign io_mem_access_valid = state == 2'h1; // @[mshrs.scala 445:32]
  assign io_mem_access_bits_opcode = _T_41 ? atomics_opcode : _T_65_opcode; // @[mshrs.scala 446:29]
  assign io_mem_access_bits_param = _T_41 ? atomics_param : 3'h0; // @[mshrs.scala 446:29]
  assign io_mem_access_bits_size = _T_41 ? atomics_size : _T_65_size; // @[mshrs.scala 446:29]
  assign io_mem_access_bits_source = _T_41 ? atomics_source : 2'h3; // @[mshrs.scala 446:29]
  assign io_mem_access_bits_address = _T_41 ? atomics_address : _T_65_address; // @[mshrs.scala 446:29]
  assign io_mem_access_bits_mask = _T_41 ? atomics_mask : _T_65_mask; // @[mshrs.scala 446:29]
  assign io_mem_access_bits_data = _T_41 ? atomics_data : _T_65_data; // @[mshrs.scala 446:29]
  assign io_mem_access_bits_corrupt = 1'h0; // @[mshrs.scala 446:29]
  always @(posedge clock) begin
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_switch <= io_req_bits_uop_switch; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_switch_off <= io_req_bits_uop_switch_off; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_is_unicore <= io_req_bits_uop_is_unicore; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_shift <= io_req_bits_uop_shift; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_lrs3_rtype <= io_req_bits_uop_lrs3_rtype; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_rflag <= io_req_bits_uop_rflag; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_wflag <= io_req_bits_uop_wflag; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_prflag <= io_req_bits_uop_prflag; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_pwflag <= io_req_bits_uop_pwflag; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_pflag_busy <= io_req_bits_uop_pflag_busy; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_stale_pflag <= io_req_bits_uop_stale_pflag; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_op1_sel <= io_req_bits_uop_op1_sel; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_op2_sel <= io_req_bits_uop_op2_sel; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_split_num <= io_req_bits_uop_split_num; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_self_index <= io_req_bits_uop_self_index; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_rob_inst_idx <= io_req_bits_uop_rob_inst_idx; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_address_num <= io_req_bits_uop_address_num; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_uopc <= io_req_bits_uop_uopc; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_inst <= io_req_bits_uop_inst; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_debug_inst <= io_req_bits_uop_debug_inst; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_is_rvc <= io_req_bits_uop_is_rvc; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_debug_pc <= io_req_bits_uop_debug_pc; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_iq_type <= io_req_bits_uop_iq_type; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_fu_code <= io_req_bits_uop_fu_code; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ctrl_br_type <= io_req_bits_uop_ctrl_br_type; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ctrl_op1_sel <= io_req_bits_uop_ctrl_op1_sel; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ctrl_op2_sel <= io_req_bits_uop_ctrl_op2_sel; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ctrl_imm_sel <= io_req_bits_uop_ctrl_imm_sel; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ctrl_op_fcn <= io_req_bits_uop_ctrl_op_fcn; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ctrl_fcn_dw <= io_req_bits_uop_ctrl_fcn_dw; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ctrl_csr_cmd <= io_req_bits_uop_ctrl_csr_cmd; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ctrl_is_load <= io_req_bits_uop_ctrl_is_load; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ctrl_is_sta <= io_req_bits_uop_ctrl_is_sta; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ctrl_is_std <= io_req_bits_uop_ctrl_is_std; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ctrl_op3_sel <= io_req_bits_uop_ctrl_op3_sel; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_iw_state <= io_req_bits_uop_iw_state; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_iw_p1_poisoned <= io_req_bits_uop_iw_p1_poisoned; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_iw_p2_poisoned <= io_req_bits_uop_iw_p2_poisoned; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_is_br <= io_req_bits_uop_is_br; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_is_jalr <= io_req_bits_uop_is_jalr; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_is_jal <= io_req_bits_uop_is_jal; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_is_sfb <= io_req_bits_uop_is_sfb; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_br_mask <= io_req_bits_uop_br_mask; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_br_tag <= io_req_bits_uop_br_tag; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ftq_idx <= io_req_bits_uop_ftq_idx; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_edge_inst <= io_req_bits_uop_edge_inst; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_pc_lob <= io_req_bits_uop_pc_lob; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_taken <= io_req_bits_uop_taken; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_imm_packed <= io_req_bits_uop_imm_packed; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_csr_addr <= io_req_bits_uop_csr_addr; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_rob_idx <= io_req_bits_uop_rob_idx; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ldq_idx <= io_req_bits_uop_ldq_idx; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_stq_idx <= io_req_bits_uop_stq_idx; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_rxq_idx <= io_req_bits_uop_rxq_idx; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_pdst <= io_req_bits_uop_pdst; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_prs1 <= io_req_bits_uop_prs1; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_prs2 <= io_req_bits_uop_prs2; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_prs3 <= io_req_bits_uop_prs3; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ppred <= io_req_bits_uop_ppred; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_prs1_busy <= io_req_bits_uop_prs1_busy; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_prs2_busy <= io_req_bits_uop_prs2_busy; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_prs3_busy <= io_req_bits_uop_prs3_busy; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ppred_busy <= io_req_bits_uop_ppred_busy; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_stale_pdst <= io_req_bits_uop_stale_pdst; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_exception <= io_req_bits_uop_exception; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_exc_cause <= io_req_bits_uop_exc_cause; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_bypassable <= io_req_bits_uop_bypassable; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_mem_cmd <= io_req_bits_uop_mem_cmd; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_mem_size <= io_req_bits_uop_mem_size; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_mem_signed <= io_req_bits_uop_mem_signed; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_is_fence <= io_req_bits_uop_is_fence; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_is_fencei <= io_req_bits_uop_is_fencei; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_is_amo <= io_req_bits_uop_is_amo; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_uses_ldq <= io_req_bits_uop_uses_ldq; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_uses_stq <= io_req_bits_uop_uses_stq; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_is_sys_pc2epc <= io_req_bits_uop_is_sys_pc2epc; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_is_unique <= io_req_bits_uop_is_unique; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_flush_on_commit <= io_req_bits_uop_flush_on_commit; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ldst_is_rs1 <= io_req_bits_uop_ldst_is_rs1; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ldst <= io_req_bits_uop_ldst; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_lrs1 <= io_req_bits_uop_lrs1; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_lrs2 <= io_req_bits_uop_lrs2; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_lrs3 <= io_req_bits_uop_lrs3; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_ldst_val <= io_req_bits_uop_ldst_val; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_dst_rtype <= io_req_bits_uop_dst_rtype; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_lrs1_rtype <= io_req_bits_uop_lrs1_rtype; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_lrs2_rtype <= io_req_bits_uop_lrs2_rtype; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_frs3_en <= io_req_bits_uop_frs3_en; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_fp_val <= io_req_bits_uop_fp_val; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_fp_single <= io_req_bits_uop_fp_single; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_xcpt_pf_if <= io_req_bits_uop_xcpt_pf_if; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_xcpt_ae_if <= io_req_bits_uop_xcpt_ae_if; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_xcpt_ma_if <= io_req_bits_uop_xcpt_ma_if; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_bp_debug_if <= io_req_bits_uop_bp_debug_if; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_bp_xcpt_if <= io_req_bits_uop_bp_xcpt_if; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_debug_fsrc <= io_req_bits_uop_debug_fsrc; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_uop_debug_tsrc <= io_req_bits_uop_debug_tsrc; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_addr <= io_req_bits_addr; // @[mshrs.scala 455:11]
    end
    if (_T_115) begin // @[mshrs.scala 454:24]
      req_data <= io_req_bits_data; // @[mshrs.scala 455:11]
    end
    if (state == 2'h2 & io_mem_ack_valid) begin // @[mshrs.scala 461:50]
      if (_T_64) begin // @[mshrs.scala 463:36]
        grant_word <= io_mem_ack_bits_data; // @[mshrs.scala 464:18]
      end
    end
    if (reset) begin // @[mshrs.scala 415:22]
      state <= 2'h0; // @[mshrs.scala 415:22]
    end else if (_T_89) begin // @[mshrs.scala 467:27]
      if (~_T_64 | _T_147) begin // @[mshrs.scala 468:41]
        state <= 2'h0; // @[mshrs.scala 469:13]
      end else begin
        state <= _GEN_103;
      end
    end else begin
      state <= _GEN_103;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T | req_uop_mem_cmd != 5'h7 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at mshrs.scala:443 assert(state === s_idle || req.uop.mem_cmd =/= M_XSC)\n"); // @[mshrs.scala 443:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T | req_uop_mem_cmd != 5'h7 | reset)) begin
          $fatal; // @[mshrs.scala 443:9]
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
  req_uop_switch = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  req_uop_switch_off = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  req_uop_is_unicore = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  req_uop_shift = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  req_uop_lrs3_rtype = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  req_uop_rflag = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  req_uop_wflag = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  req_uop_prflag = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  req_uop_pwflag = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  req_uop_pflag_busy = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  req_uop_stale_pflag = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  req_uop_op1_sel = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  req_uop_op2_sel = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  req_uop_split_num = _RAND_13[5:0];
  _RAND_14 = {1{`RANDOM}};
  req_uop_self_index = _RAND_14[5:0];
  _RAND_15 = {1{`RANDOM}};
  req_uop_rob_inst_idx = _RAND_15[5:0];
  _RAND_16 = {1{`RANDOM}};
  req_uop_address_num = _RAND_16[5:0];
  _RAND_17 = {1{`RANDOM}};
  req_uop_uopc = _RAND_17[6:0];
  _RAND_18 = {1{`RANDOM}};
  req_uop_inst = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  req_uop_debug_inst = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  req_uop_is_rvc = _RAND_20[0:0];
  _RAND_21 = {2{`RANDOM}};
  req_uop_debug_pc = _RAND_21[39:0];
  _RAND_22 = {1{`RANDOM}};
  req_uop_iq_type = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  req_uop_fu_code = _RAND_23[9:0];
  _RAND_24 = {1{`RANDOM}};
  req_uop_ctrl_br_type = _RAND_24[3:0];
  _RAND_25 = {1{`RANDOM}};
  req_uop_ctrl_op1_sel = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  req_uop_ctrl_op2_sel = _RAND_26[2:0];
  _RAND_27 = {1{`RANDOM}};
  req_uop_ctrl_imm_sel = _RAND_27[2:0];
  _RAND_28 = {1{`RANDOM}};
  req_uop_ctrl_op_fcn = _RAND_28[3:0];
  _RAND_29 = {1{`RANDOM}};
  req_uop_ctrl_fcn_dw = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  req_uop_ctrl_csr_cmd = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  req_uop_ctrl_is_load = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  req_uop_ctrl_is_sta = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  req_uop_ctrl_is_std = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  req_uop_ctrl_op3_sel = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  req_uop_iw_state = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  req_uop_iw_p1_poisoned = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  req_uop_iw_p2_poisoned = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  req_uop_is_br = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  req_uop_is_jalr = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  req_uop_is_jal = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  req_uop_is_sfb = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  req_uop_br_mask = _RAND_42[11:0];
  _RAND_43 = {1{`RANDOM}};
  req_uop_br_tag = _RAND_43[3:0];
  _RAND_44 = {1{`RANDOM}};
  req_uop_ftq_idx = _RAND_44[4:0];
  _RAND_45 = {1{`RANDOM}};
  req_uop_edge_inst = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  req_uop_pc_lob = _RAND_46[5:0];
  _RAND_47 = {1{`RANDOM}};
  req_uop_taken = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  req_uop_imm_packed = _RAND_48[19:0];
  _RAND_49 = {1{`RANDOM}};
  req_uop_csr_addr = _RAND_49[11:0];
  _RAND_50 = {1{`RANDOM}};
  req_uop_rob_idx = _RAND_50[5:0];
  _RAND_51 = {1{`RANDOM}};
  req_uop_ldq_idx = _RAND_51[4:0];
  _RAND_52 = {1{`RANDOM}};
  req_uop_stq_idx = _RAND_52[4:0];
  _RAND_53 = {1{`RANDOM}};
  req_uop_rxq_idx = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  req_uop_pdst = _RAND_54[6:0];
  _RAND_55 = {1{`RANDOM}};
  req_uop_prs1 = _RAND_55[6:0];
  _RAND_56 = {1{`RANDOM}};
  req_uop_prs2 = _RAND_56[6:0];
  _RAND_57 = {1{`RANDOM}};
  req_uop_prs3 = _RAND_57[6:0];
  _RAND_58 = {1{`RANDOM}};
  req_uop_ppred = _RAND_58[4:0];
  _RAND_59 = {1{`RANDOM}};
  req_uop_prs1_busy = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  req_uop_prs2_busy = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  req_uop_prs3_busy = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  req_uop_ppred_busy = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  req_uop_stale_pdst = _RAND_63[6:0];
  _RAND_64 = {1{`RANDOM}};
  req_uop_exception = _RAND_64[0:0];
  _RAND_65 = {2{`RANDOM}};
  req_uop_exc_cause = _RAND_65[63:0];
  _RAND_66 = {1{`RANDOM}};
  req_uop_bypassable = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  req_uop_mem_cmd = _RAND_67[4:0];
  _RAND_68 = {1{`RANDOM}};
  req_uop_mem_size = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  req_uop_mem_signed = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  req_uop_is_fence = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  req_uop_is_fencei = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  req_uop_is_amo = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  req_uop_uses_ldq = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  req_uop_uses_stq = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  req_uop_is_sys_pc2epc = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  req_uop_is_unique = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  req_uop_flush_on_commit = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  req_uop_ldst_is_rs1 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  req_uop_ldst = _RAND_79[5:0];
  _RAND_80 = {1{`RANDOM}};
  req_uop_lrs1 = _RAND_80[5:0];
  _RAND_81 = {1{`RANDOM}};
  req_uop_lrs2 = _RAND_81[5:0];
  _RAND_82 = {1{`RANDOM}};
  req_uop_lrs3 = _RAND_82[5:0];
  _RAND_83 = {1{`RANDOM}};
  req_uop_ldst_val = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  req_uop_dst_rtype = _RAND_84[1:0];
  _RAND_85 = {1{`RANDOM}};
  req_uop_lrs1_rtype = _RAND_85[1:0];
  _RAND_86 = {1{`RANDOM}};
  req_uop_lrs2_rtype = _RAND_86[1:0];
  _RAND_87 = {1{`RANDOM}};
  req_uop_frs3_en = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  req_uop_fp_val = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  req_uop_fp_single = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  req_uop_xcpt_pf_if = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  req_uop_xcpt_ae_if = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  req_uop_xcpt_ma_if = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  req_uop_bp_debug_if = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  req_uop_bp_xcpt_if = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  req_uop_debug_fsrc = _RAND_95[1:0];
  _RAND_96 = {1{`RANDOM}};
  req_uop_debug_tsrc = _RAND_96[1:0];
  _RAND_97 = {2{`RANDOM}};
  req_addr = _RAND_97[39:0];
  _RAND_98 = {2{`RANDOM}};
  req_data = _RAND_98[63:0];
  _RAND_99 = {2{`RANDOM}};
  grant_word = _RAND_99[63:0];
  _RAND_100 = {1{`RANDOM}};
  state = _RAND_100[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
