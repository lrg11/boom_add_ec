module SubDecodeUnit(
  input         clock,
  input         reset,
  input         io_rawuop_switch,
  input         io_rawuop_switch_off,
  input         io_rawuop_is_unicore,
  input  [2:0]  io_rawuop_shift,
  input  [1:0]  io_rawuop_lrs3_rtype,
  input         io_rawuop_rflag,
  input         io_rawuop_wflag,
  input  [3:0]  io_rawuop_prflag,
  input  [3:0]  io_rawuop_pwflag,
  input         io_rawuop_pflag_busy,
  input  [3:0]  io_rawuop_stale_pflag,
  input  [3:0]  io_rawuop_op1_sel,
  input  [3:0]  io_rawuop_op2_sel,
  input  [5:0]  io_rawuop_split_num,
  input  [5:0]  io_rawuop_self_index,
  input  [5:0]  io_rawuop_rob_inst_idx,
  input  [5:0]  io_rawuop_address_num,
  input  [6:0]  io_rawuop_uopc,
  input  [31:0] io_rawuop_inst,
  input  [31:0] io_rawuop_debug_inst,
  input         io_rawuop_is_rvc,
  input  [39:0] io_rawuop_debug_pc,
  input  [2:0]  io_rawuop_iq_type,
  input  [9:0]  io_rawuop_fu_code,
  input  [3:0]  io_rawuop_ctrl_br_type,
  input  [1:0]  io_rawuop_ctrl_op1_sel,
  input  [2:0]  io_rawuop_ctrl_op2_sel,
  input  [2:0]  io_rawuop_ctrl_imm_sel,
  input  [3:0]  io_rawuop_ctrl_op_fcn,
  input         io_rawuop_ctrl_fcn_dw,
  input  [2:0]  io_rawuop_ctrl_csr_cmd,
  input         io_rawuop_ctrl_is_load,
  input         io_rawuop_ctrl_is_sta,
  input         io_rawuop_ctrl_is_std,
  input  [1:0]  io_rawuop_ctrl_op3_sel,
  input  [1:0]  io_rawuop_iw_state,
  input         io_rawuop_iw_p1_poisoned,
  input         io_rawuop_iw_p2_poisoned,
  input         io_rawuop_is_br,
  input         io_rawuop_is_jalr,
  input         io_rawuop_is_jal,
  input         io_rawuop_is_sfb,
  input  [11:0] io_rawuop_br_mask,
  input  [3:0]  io_rawuop_br_tag,
  input  [4:0]  io_rawuop_ftq_idx,
  input         io_rawuop_edge_inst,
  input  [5:0]  io_rawuop_pc_lob,
  input         io_rawuop_taken,
  input  [19:0] io_rawuop_imm_packed,
  input  [11:0] io_rawuop_csr_addr,
  input  [5:0]  io_rawuop_rob_idx,
  input  [4:0]  io_rawuop_ldq_idx,
  input  [4:0]  io_rawuop_stq_idx,
  input  [1:0]  io_rawuop_rxq_idx,
  input  [6:0]  io_rawuop_pdst,
  input  [6:0]  io_rawuop_prs1,
  input  [6:0]  io_rawuop_prs2,
  input  [6:0]  io_rawuop_prs3,
  input  [4:0]  io_rawuop_ppred,
  input         io_rawuop_prs1_busy,
  input         io_rawuop_prs2_busy,
  input         io_rawuop_prs3_busy,
  input         io_rawuop_ppred_busy,
  input  [6:0]  io_rawuop_stale_pdst,
  input         io_rawuop_exception,
  input  [63:0] io_rawuop_exc_cause,
  input         io_rawuop_bypassable,
  input  [4:0]  io_rawuop_mem_cmd,
  input  [1:0]  io_rawuop_mem_size,
  input         io_rawuop_mem_signed,
  input         io_rawuop_is_fence,
  input         io_rawuop_is_fencei,
  input         io_rawuop_is_amo,
  input         io_rawuop_uses_ldq,
  input         io_rawuop_uses_stq,
  input         io_rawuop_is_sys_pc2epc,
  input         io_rawuop_is_unique,
  input         io_rawuop_flush_on_commit,
  input         io_rawuop_ldst_is_rs1,
  input  [5:0]  io_rawuop_ldst,
  input  [5:0]  io_rawuop_lrs1,
  input  [5:0]  io_rawuop_lrs2,
  input  [5:0]  io_rawuop_lrs3,
  input         io_rawuop_ldst_val,
  input  [1:0]  io_rawuop_dst_rtype,
  input  [1:0]  io_rawuop_lrs1_rtype,
  input  [1:0]  io_rawuop_lrs2_rtype,
  input         io_rawuop_frs3_en,
  input         io_rawuop_fp_val,
  input         io_rawuop_fp_single,
  input         io_rawuop_xcpt_pf_if,
  input         io_rawuop_xcpt_ae_if,
  input         io_rawuop_xcpt_ma_if,
  input         io_rawuop_bp_debug_if,
  input         io_rawuop_bp_xcpt_if,
  input  [1:0]  io_rawuop_debug_fsrc,
  input  [1:0]  io_rawuop_debug_tsrc,
  input         io_cs_sub_valid,
  input         io_cs_sub_fp_val,
  input         io_cs_sub_fp_single,
  input  [6:0]  io_cs_sub_uopc,
  input  [2:0]  io_cs_sub_iq_type,
  input  [9:0]  io_cs_sub_fu_code,
  input         io_cs_sub_uses_ldq,
  input         io_cs_sub_uses_stq,
  input         io_cs_sub_is_br,
  input  [2:0]  io_cs_sub_dst_type,
  input  [2:0]  io_cs_sub_rs1_type,
  input  [2:0]  io_cs_sub_rs2_type,
  input  [4:0]  io_cs_sub_rtemp1,
  input  [4:0]  io_cs_sub_rtemp2,
  input  [4:0]  io_cs_sub_wtemp,
  input         io_cs_sub_wflag,
  input         io_cs_sub_rflag,
  input  [2:0]  io_cs_sub_imm_sel,
  input  [1:0]  io_cs_sub_wakeup_delay,
  input         io_cs_sub_bypassable,
  input  [4:0]  io_cs_sub_mem_cmd,
  input  [1:0]  io_cs_sub_mem_size,
  input  [2:0]  io_cs_sub_shift,
  input  [4:0]  io_cs_sub_split_num,
  input  [3:0]  io_cs_sub_op1_sel,
  input  [3:0]  io_cs_sub_op2_sel,
  output        io_subuop_switch,
  output        io_subuop_switch_off,
  output        io_subuop_is_unicore,
  output [2:0]  io_subuop_shift,
  output [1:0]  io_subuop_lrs3_rtype,
  output        io_subuop_rflag,
  output        io_subuop_wflag,
  output [3:0]  io_subuop_prflag,
  output [3:0]  io_subuop_pwflag,
  output        io_subuop_pflag_busy,
  output [3:0]  io_subuop_stale_pflag,
  output [3:0]  io_subuop_op1_sel,
  output [3:0]  io_subuop_op2_sel,
  output [5:0]  io_subuop_split_num,
  output [5:0]  io_subuop_self_index,
  output [5:0]  io_subuop_rob_inst_idx,
  output [5:0]  io_subuop_address_num,
  output [6:0]  io_subuop_uopc,
  output [31:0] io_subuop_inst,
  output [31:0] io_subuop_debug_inst,
  output        io_subuop_is_rvc,
  output [39:0] io_subuop_debug_pc,
  output [2:0]  io_subuop_iq_type,
  output [9:0]  io_subuop_fu_code,
  output [3:0]  io_subuop_ctrl_br_type,
  output [1:0]  io_subuop_ctrl_op1_sel,
  output [2:0]  io_subuop_ctrl_op2_sel,
  output [2:0]  io_subuop_ctrl_imm_sel,
  output [3:0]  io_subuop_ctrl_op_fcn,
  output        io_subuop_ctrl_fcn_dw,
  output [2:0]  io_subuop_ctrl_csr_cmd,
  output        io_subuop_ctrl_is_load,
  output        io_subuop_ctrl_is_sta,
  output        io_subuop_ctrl_is_std,
  output [1:0]  io_subuop_ctrl_op3_sel,
  output [1:0]  io_subuop_iw_state,
  output        io_subuop_iw_p1_poisoned,
  output        io_subuop_iw_p2_poisoned,
  output        io_subuop_is_br,
  output        io_subuop_is_jalr,
  output        io_subuop_is_jal,
  output        io_subuop_is_sfb,
  output [11:0] io_subuop_br_mask,
  output [3:0]  io_subuop_br_tag,
  output [4:0]  io_subuop_ftq_idx,
  output        io_subuop_edge_inst,
  output [5:0]  io_subuop_pc_lob,
  output        io_subuop_taken,
  output [19:0] io_subuop_imm_packed,
  output [11:0] io_subuop_csr_addr,
  output [5:0]  io_subuop_rob_idx,
  output [4:0]  io_subuop_ldq_idx,
  output [4:0]  io_subuop_stq_idx,
  output [1:0]  io_subuop_rxq_idx,
  output [6:0]  io_subuop_pdst,
  output [6:0]  io_subuop_prs1,
  output [6:0]  io_subuop_prs2,
  output [6:0]  io_subuop_prs3,
  output [4:0]  io_subuop_ppred,
  output        io_subuop_prs1_busy,
  output        io_subuop_prs2_busy,
  output        io_subuop_prs3_busy,
  output        io_subuop_ppred_busy,
  output [6:0]  io_subuop_stale_pdst,
  output        io_subuop_exception,
  output [63:0] io_subuop_exc_cause,
  output        io_subuop_bypassable,
  output [4:0]  io_subuop_mem_cmd,
  output [1:0]  io_subuop_mem_size,
  output        io_subuop_mem_signed,
  output        io_subuop_is_fence,
  output        io_subuop_is_fencei,
  output        io_subuop_is_amo,
  output        io_subuop_uses_ldq,
  output        io_subuop_uses_stq,
  output        io_subuop_is_sys_pc2epc,
  output        io_subuop_is_unique,
  output        io_subuop_flush_on_commit,
  output        io_subuop_ldst_is_rs1,
  output [5:0]  io_subuop_ldst,
  output [5:0]  io_subuop_lrs1,
  output [5:0]  io_subuop_lrs2,
  output [5:0]  io_subuop_lrs3,
  output        io_subuop_ldst_val,
  output [1:0]  io_subuop_dst_rtype,
  output [1:0]  io_subuop_lrs1_rtype,
  output [1:0]  io_subuop_lrs2_rtype,
  output        io_subuop_frs3_en,
  output        io_subuop_fp_val,
  output        io_subuop_fp_single,
  output        io_subuop_xcpt_pf_if,
  output        io_subuop_xcpt_ae_if,
  output        io_subuop_xcpt_ma_if,
  output        io_subuop_bp_debug_if,
  output        io_subuop_bp_xcpt_if,
  output [1:0]  io_subuop_debug_fsrc,
  output [1:0]  io_subuop_debug_tsrc
);
  wire  hi = io_rawuop_inst[6] & ~io_rawuop_inst[7]; // @[subInstDecode.scala 319:31]
  wire  lo = io_rawuop_inst[6] & io_rawuop_inst[7]; // @[subInstDecode.scala 319:59]
  wire  hi_hi = io_rawuop_inst[19]; // @[subInstDecode.scala 321:57]
  wire [15:0] lo_lo = io_rawuop_inst[15:0]; // @[subInstDecode.scala 321:91]
  wire [19:0] _T_7 = {hi_hi,1'h0,hi,lo,lo_lo}; // @[Cat.scala 30:58]
  wire  _T_16 = io_rawuop_inst[18:14] == 5'h1f & (io_cs_sub_uopc == 7'h28 | io_cs_sub_uopc == 7'h6c); // @[subInstDecode.scala 325:70]
  wire  _T_17 = _T_16 ? 1'h0 : 1'h1; // @[subInstDecode.scala 326:28]
  wire  _T_19 = io_cs_sub_fp_val & io_cs_sub_fu_code != 10'h200; // @[subInstDecode.scala 327:46]
  wire [1:0] _T_20 = _T_16 ? 2'h2 : 2'h0; // @[subInstDecode.scala 327:90]
  wire [1:0] _T_21 = io_cs_sub_fp_val & io_cs_sub_fu_code != 10'h200 ? 2'h1 : _T_20; // @[subInstDecode.scala 327:28]
  wire [1:0] _T_26 = _T_19 ? 2'h1 : 2'h0; // @[subInstDecode.scala 332:28]
  wire [5:0] _T_42 = {1'h1,io_cs_sub_wtemp}; // @[Cat.scala 30:58]
  wire  _T_43 = io_cs_sub_dst_type == 3'h7; // @[subInstDecode.scala 350:34]
  wire [1:0] _GEN_1 = io_cs_sub_dst_type == 3'h7 ? _T_26 : 2'h2; // @[subInstDecode.scala 350:45 subInstDecode.scala 352:22 subInstDecode.scala 357:22]
  wire [5:0] _GEN_2 = io_cs_sub_dst_type == 3'h7 ? 6'h1e : io_rawuop_ldst; // @[subInstDecode.scala 350:45 subInstDecode.scala 353:22 subInstDecode.scala 295:9]
  wire  _GEN_3 = io_cs_sub_dst_type == 3'h2 | _T_43; // @[subInstDecode.scala 345:45 subInstDecode.scala 346:22]
  wire [1:0] _GEN_4 = io_cs_sub_dst_type == 3'h2 ? _T_26 : _GEN_1; // @[subInstDecode.scala 345:45 subInstDecode.scala 347:22]
  wire [5:0] _GEN_5 = io_cs_sub_dst_type == 3'h2 ? _T_42 : _GEN_2; // @[subInstDecode.scala 345:45 subInstDecode.scala 348:22]
  wire  _GEN_6 = io_cs_sub_dst_type == 3'h5 | _GEN_3; // @[subInstDecode.scala 340:45 subInstDecode.scala 341:22]
  wire [1:0] _GEN_7 = io_cs_sub_dst_type == 3'h5 ? _T_26 : _GEN_4; // @[subInstDecode.scala 340:45 subInstDecode.scala 342:22]
  wire [5:0] _GEN_8 = io_cs_sub_dst_type == 3'h5 ? {{1'd0}, io_rawuop_inst[13:9]} : _GEN_5; // @[subInstDecode.scala 340:45 subInstDecode.scala 343:22]
  wire  _GEN_9 = io_cs_sub_dst_type == 3'h4 | _GEN_6; // @[subInstDecode.scala 335:45 subInstDecode.scala 336:22]
  wire [1:0] _GEN_10 = io_cs_sub_dst_type == 3'h4 ? _T_26 : _GEN_7; // @[subInstDecode.scala 335:45 subInstDecode.scala 337:22]
  wire [5:0] _GEN_11 = io_cs_sub_dst_type == 3'h4 ? {{1'd0}, io_rawuop_inst[4:0]} : _GEN_8; // @[subInstDecode.scala 335:45 subInstDecode.scala 338:22]
  wire  _GEN_12 = io_cs_sub_dst_type == 3'h3 | _GEN_9; // @[subInstDecode.scala 330:45 subInstDecode.scala 331:22]
  wire [1:0] _GEN_13 = io_cs_sub_dst_type == 3'h3 ? _T_26 : _GEN_10; // @[subInstDecode.scala 330:45 subInstDecode.scala 332:22]
  wire [5:0] _GEN_14 = io_cs_sub_dst_type == 3'h3 ? {{1'd0}, io_rawuop_inst[23:19]} : _GEN_11; // @[subInstDecode.scala 330:45 subInstDecode.scala 333:22]
  wire  _T_55 = io_cs_sub_fp_val & io_cs_sub_fu_code != 10'h100; // @[subInstDecode.scala 364:49]
  wire [1:0] _T_57 = io_cs_sub_fp_val & io_cs_sub_fu_code != 10'h100 ? 2'h1 : _T_20; // @[subInstDecode.scala 364:31]
  wire [1:0] _T_67 = _T_55 & ~(io_cs_sub_uopc == 7'h1 | io_cs_sub_uopc == 7'h2) ? 2'h1 : 2'h0; // @[subInstDecode.scala 368:31]
  wire [1:0] _T_72 = _T_55 ? 2'h1 : 2'h0; // @[subInstDecode.scala 372:31]
  wire [5:0] _T_83 = {1'h1,io_cs_sub_rtemp1}; // @[Cat.scala 30:58]
  wire [1:0] _GEN_18 = _T_43 ? _T_72 : 2'h2; // @[subInstDecode.scala 387:45 subInstDecode.scala 388:25 subInstDecode.scala 392:24]
  wire [5:0] _GEN_19 = _T_43 ? 6'h1e : io_rawuop_lrs1; // @[subInstDecode.scala 387:45 subInstDecode.scala 389:25 subInstDecode.scala 295:9]
  wire [1:0] _GEN_20 = io_cs_sub_rs1_type == 3'h6 ? 2'h3 : _GEN_18; // @[subInstDecode.scala 383:45 subInstDecode.scala 384:25]
  wire [5:0] _GEN_21 = io_cs_sub_rs1_type == 3'h6 ? {{1'd0}, io_rawuop_inst[13:9]} : _GEN_19; // @[subInstDecode.scala 383:45 subInstDecode.scala 385:25]
  wire [1:0] _GEN_22 = io_cs_sub_rs1_type == 3'h2 ? _T_72 : _GEN_20; // @[subInstDecode.scala 379:45 subInstDecode.scala 380:25]
  wire [5:0] _GEN_23 = io_cs_sub_rs1_type == 3'h2 ? _T_83 : _GEN_21; // @[subInstDecode.scala 379:45 subInstDecode.scala 381:25]
  wire [1:0] _GEN_24 = io_cs_sub_rs1_type == 3'h5 ? _T_72 : _GEN_22; // @[subInstDecode.scala 375:45 subInstDecode.scala 376:25]
  wire [5:0] _GEN_25 = io_cs_sub_rs1_type == 3'h5 ? {{1'd0}, io_rawuop_inst[13:9]} : _GEN_23; // @[subInstDecode.scala 375:45 subInstDecode.scala 377:25]
  wire [1:0] _GEN_26 = io_cs_sub_rs1_type == 3'h4 ? _T_72 : _GEN_24; // @[subInstDecode.scala 371:45 subInstDecode.scala 372:25]
  wire [5:0] _GEN_27 = io_cs_sub_rs1_type == 3'h4 ? {{1'd0}, io_rawuop_inst[4:0]} : _GEN_25; // @[subInstDecode.scala 371:45 subInstDecode.scala 373:25]
  wire [1:0] _GEN_28 = io_cs_sub_rs1_type == 3'h3 ? _T_67 : _GEN_26; // @[subInstDecode.scala 367:45 subInstDecode.scala 368:25]
  wire [5:0] _GEN_29 = io_cs_sub_rs1_type == 3'h3 ? {{1'd0}, io_rawuop_inst[23:19]} : _GEN_27; // @[subInstDecode.scala 367:45 subInstDecode.scala 369:25]
  wire [5:0] _T_114 = {1'h1,io_cs_sub_rtemp2}; // @[Cat.scala 30:58]
  wire [1:0] _GEN_32 = io_cs_sub_rs2_type == 3'h6 ? 2'h3 : 2'h2; // @[subInstDecode.scala 416:45 subInstDecode.scala 417:25 subInstDecode.scala 421:24]
  wire [5:0] _GEN_33 = io_cs_sub_rs2_type == 3'h6 ? {{1'd0}, io_rawuop_inst[13:9]} : io_rawuop_lrs2; // @[subInstDecode.scala 416:45 subInstDecode.scala 418:25 subInstDecode.scala 295:9]
  wire [1:0] _GEN_34 = io_cs_sub_rs2_type == 3'h2 ? _T_72 : _GEN_32; // @[subInstDecode.scala 412:45 subInstDecode.scala 413:25]
  wire [5:0] _GEN_35 = io_cs_sub_rs2_type == 3'h2 ? _T_114 : _GEN_33; // @[subInstDecode.scala 412:45 subInstDecode.scala 414:25]
  wire [1:0] _GEN_36 = io_cs_sub_rs2_type == 3'h5 ? _T_72 : _GEN_34; // @[subInstDecode.scala 408:45 subInstDecode.scala 409:25]
  wire [5:0] _GEN_37 = io_cs_sub_rs2_type == 3'h5 ? {{1'd0}, io_rawuop_inst[13:9]} : _GEN_35; // @[subInstDecode.scala 408:45 subInstDecode.scala 410:25]
  wire [1:0] _GEN_38 = io_cs_sub_rs2_type == 3'h4 ? _T_72 : _GEN_36; // @[subInstDecode.scala 404:45 subInstDecode.scala 405:25]
  wire [5:0] _GEN_39 = io_cs_sub_rs2_type == 3'h4 ? {{1'd0}, io_rawuop_inst[4:0]} : _GEN_37; // @[subInstDecode.scala 404:45 subInstDecode.scala 406:25]
  wire [1:0] _GEN_40 = io_cs_sub_rs2_type == 3'h3 ? _T_72 : _GEN_38; // @[subInstDecode.scala 400:45 subInstDecode.scala 401:25]
  wire [5:0] _GEN_41 = io_cs_sub_rs2_type == 3'h3 ? {{1'd0}, io_rawuop_inst[23:19]} : _GEN_39; // @[subInstDecode.scala 400:45 subInstDecode.scala 402:25]
  assign io_subuop_switch = io_rawuop_switch; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_switch_off = io_rawuop_switch_off; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_is_unicore = io_rawuop_is_unicore; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_shift = io_cs_sub_shift; // @[subInstDecode.scala 294:19 subInstDecode.scala 310:21]
  assign io_subuop_lrs3_rtype = 2'h2; // @[subInstDecode.scala 294:19 subInstDecode.scala 313:21]
  assign io_subuop_rflag = io_cs_sub_rflag; // @[subInstDecode.scala 294:19 subInstDecode.scala 306:21]
  assign io_subuop_wflag = io_cs_sub_wflag; // @[subInstDecode.scala 294:19 subInstDecode.scala 305:21]
  assign io_subuop_prflag = io_rawuop_prflag; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_pwflag = io_rawuop_pwflag; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_pflag_busy = io_rawuop_pflag_busy; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_stale_pflag = io_rawuop_stale_pflag; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_op1_sel = io_cs_sub_op1_sel; // @[subInstDecode.scala 294:19 subInstDecode.scala 314:21]
  assign io_subuop_op2_sel = io_cs_sub_op2_sel; // @[subInstDecode.scala 294:19 subInstDecode.scala 315:21]
  assign io_subuop_split_num = io_rawuop_split_num; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_self_index = io_rawuop_self_index; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_rob_inst_idx = io_rawuop_rob_inst_idx; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_address_num = io_rawuop_address_num; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_uopc = io_cs_sub_uopc; // @[subInstDecode.scala 294:19 subInstDecode.scala 299:21]
  assign io_subuop_inst = io_rawuop_inst; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_debug_inst = io_rawuop_debug_inst; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_is_rvc = io_rawuop_is_rvc; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_debug_pc = io_rawuop_debug_pc; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_iq_type = io_cs_sub_iq_type; // @[subInstDecode.scala 294:19 subInstDecode.scala 300:21]
  assign io_subuop_fu_code = io_cs_sub_fu_code; // @[subInstDecode.scala 294:19 subInstDecode.scala 301:21]
  assign io_subuop_ctrl_br_type = io_rawuop_ctrl_br_type; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ctrl_op1_sel = io_rawuop_ctrl_op1_sel; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ctrl_op2_sel = io_rawuop_ctrl_op2_sel; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ctrl_imm_sel = io_cs_sub_imm_sel; // @[subInstDecode.scala 294:19 subInstDecode.scala 317:26]
  assign io_subuop_ctrl_op_fcn = io_rawuop_ctrl_op_fcn; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ctrl_fcn_dw = io_rawuop_ctrl_fcn_dw; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ctrl_csr_cmd = io_rawuop_ctrl_csr_cmd; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ctrl_is_load = io_rawuop_ctrl_is_load; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ctrl_is_sta = io_rawuop_ctrl_is_sta; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ctrl_is_std = io_rawuop_ctrl_is_std; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ctrl_op3_sel = io_rawuop_ctrl_op3_sel; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_iw_state = io_rawuop_iw_state; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_iw_p1_poisoned = io_rawuop_iw_p1_poisoned; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_iw_p2_poisoned = io_rawuop_iw_p2_poisoned; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_is_br = io_cs_sub_is_br; // @[subInstDecode.scala 294:19 subInstDecode.scala 304:21]
  assign io_subuop_is_jalr = io_cs_sub_uopc == 7'h26; // @[subInstDecode.scala 312:40]
  assign io_subuop_is_jal = io_cs_sub_uopc == 7'h25; // @[subInstDecode.scala 311:40]
  assign io_subuop_is_sfb = io_rawuop_is_sfb; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_br_mask = io_rawuop_br_mask; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_br_tag = io_rawuop_br_tag; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ftq_idx = io_rawuop_ftq_idx; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_edge_inst = io_rawuop_edge_inst; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_pc_lob = io_rawuop_pc_lob; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_taken = io_rawuop_taken; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_imm_packed = io_cs_sub_fp_val ? _T_7 : io_rawuop_inst[19:0]; // @[subInstDecode.scala 321:26]
  assign io_subuop_csr_addr = io_rawuop_csr_addr; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_rob_idx = io_rawuop_rob_idx; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ldq_idx = io_rawuop_ldq_idx; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_stq_idx = io_rawuop_stq_idx; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_rxq_idx = io_rawuop_rxq_idx; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_pdst = io_rawuop_pdst; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_prs1 = io_rawuop_prs1; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_prs2 = io_rawuop_prs2; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_prs3 = io_rawuop_prs3; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ppred = io_rawuop_ppred; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_prs1_busy = io_rawuop_prs1_busy; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_prs2_busy = io_rawuop_prs2_busy; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_prs3_busy = io_rawuop_prs3_busy; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ppred_busy = io_rawuop_ppred_busy; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_stale_pdst = io_rawuop_stale_pdst; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_exception = io_rawuop_exception; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_exc_cause = io_rawuop_exc_cause; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_bypassable = io_cs_sub_bypassable; // @[subInstDecode.scala 294:19 subInstDecode.scala 307:21]
  assign io_subuop_mem_cmd = io_cs_sub_mem_cmd; // @[subInstDecode.scala 294:19 subInstDecode.scala 308:21]
  assign io_subuop_mem_size = io_cs_sub_mem_size; // @[subInstDecode.scala 294:19 subInstDecode.scala 309:21]
  assign io_subuop_mem_signed = io_rawuop_mem_signed; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_is_fence = io_rawuop_is_fence; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_is_fencei = io_rawuop_is_fencei; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_is_amo = io_rawuop_is_amo; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_uses_ldq = io_cs_sub_uses_ldq; // @[subInstDecode.scala 294:19 subInstDecode.scala 302:21]
  assign io_subuop_uses_stq = io_cs_sub_uses_stq; // @[subInstDecode.scala 294:19 subInstDecode.scala 303:21]
  assign io_subuop_is_sys_pc2epc = io_rawuop_is_sys_pc2epc; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_is_unique = io_rawuop_is_unique; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_flush_on_commit = io_rawuop_flush_on_commit; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ldst_is_rs1 = io_rawuop_ldst_is_rs1; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ldst = io_cs_sub_dst_type == 3'h1 ? {{1'd0}, io_rawuop_inst[18:14]} : _GEN_14; // @[subInstDecode.scala 324:40 subInstDecode.scala 328:22]
  assign io_subuop_lrs1 = io_cs_sub_rs1_type == 3'h1 ? {{1'd0}, io_rawuop_inst[18:14]} : _GEN_29; // @[subInstDecode.scala 362:40 subInstDecode.scala 365:25]
  assign io_subuop_lrs2 = io_cs_sub_rs2_type == 3'h1 ? {{1'd0}, io_rawuop_inst[18:14]} : _GEN_41; // @[subInstDecode.scala 396:40 subInstDecode.scala 398:25]
  assign io_subuop_lrs3 = io_rawuop_lrs3; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_ldst_val = io_cs_sub_dst_type == 3'h1 ? _T_17 : _GEN_12; // @[subInstDecode.scala 324:40 subInstDecode.scala 326:22]
  assign io_subuop_dst_rtype = io_cs_sub_dst_type == 3'h1 ? _T_21 : _GEN_13; // @[subInstDecode.scala 324:40 subInstDecode.scala 327:22]
  assign io_subuop_lrs1_rtype = io_cs_sub_rs1_type == 3'h1 ? _T_57 : _GEN_28; // @[subInstDecode.scala 362:40 subInstDecode.scala 364:25]
  assign io_subuop_lrs2_rtype = io_cs_sub_rs2_type == 3'h1 ? _T_72 : _GEN_40; // @[subInstDecode.scala 396:40 subInstDecode.scala 397:25]
  assign io_subuop_frs3_en = io_rawuop_frs3_en; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_fp_val = io_cs_sub_fp_val; // @[subInstDecode.scala 294:19 subInstDecode.scala 297:21]
  assign io_subuop_fp_single = io_cs_sub_fp_single; // @[subInstDecode.scala 294:19 subInstDecode.scala 298:21]
  assign io_subuop_xcpt_pf_if = io_rawuop_xcpt_pf_if; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_xcpt_ae_if = io_rawuop_xcpt_ae_if; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_xcpt_ma_if = io_rawuop_xcpt_ma_if; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_bp_debug_if = io_rawuop_bp_debug_if; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_bp_xcpt_if = io_rawuop_bp_xcpt_if; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_debug_fsrc = io_rawuop_debug_fsrc; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
  assign io_subuop_debug_tsrc = io_rawuop_debug_tsrc; // @[subInstDecode.scala 294:19 subInstDecode.scala 295:9]
endmodule
