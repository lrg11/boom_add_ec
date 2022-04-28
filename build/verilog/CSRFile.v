module CSRFile(
  input         clock,
  input         reset,
  input         io_ungated_clock,
  input         io_interrupts_debug,
  input         io_interrupts_mtip,
  input         io_interrupts_msip,
  input         io_interrupts_meip,
  input         io_interrupts_seip,
  input         io_hartid,
  input  [11:0] io_rw_addr,
  input  [2:0]  io_rw_cmd,
  output [63:0] io_rw_rdata,
  input  [63:0] io_rw_wdata,
  input  [11:0] io_decode_0_csr,
  output        io_decode_0_fp_illegal,
  output        io_decode_0_vector_illegal,
  output        io_decode_0_fp_csr,
  output        io_decode_0_rocc_illegal,
  output        io_decode_0_read_illegal,
  output        io_decode_0_write_illegal,
  output        io_decode_0_write_flush,
  output        io_decode_0_system_illegal,
  input  [11:0] io_decode_1_csr,
  output        io_decode_1_fp_illegal,
  output        io_decode_1_vector_illegal,
  output        io_decode_1_fp_csr,
  output        io_decode_1_rocc_illegal,
  output        io_decode_1_read_illegal,
  output        io_decode_1_write_illegal,
  output        io_decode_1_write_flush,
  output        io_decode_1_system_illegal,
  output        io_csr_stall,
  output        io_eret,
  output        io_singleStep,
  output        io_status_debug,
  output        io_status_cease,
  output        io_status_wfi,
  output [31:0] io_status_isa,
  output [1:0]  io_status_dprv,
  output [1:0]  io_status_prv,
  output        io_status_sd,
  output [26:0] io_status_zero2,
  output [1:0]  io_status_sxl,
  output [1:0]  io_status_uxl,
  output        io_status_sd_rv32,
  output [7:0]  io_status_zero1,
  output        io_status_tsr,
  output        io_status_tw,
  output        io_status_tvm,
  output        io_status_mxr,
  output        io_status_sum,
  output        io_status_mprv,
  output [1:0]  io_status_xs,
  output [1:0]  io_status_fs,
  output [1:0]  io_status_mpp,
  output [1:0]  io_status_vs,
  output        io_status_spp,
  output        io_status_mpie,
  output        io_status_hpie,
  output        io_status_spie,
  output        io_status_upie,
  output        io_status_mie,
  output        io_status_hie,
  output        io_status_sie,
  output        io_status_uie,
  output [3:0]  io_ptbr_mode,
  output [15:0] io_ptbr_asid,
  output [43:0] io_ptbr_ppn,
  output [39:0] io_evec,
  input         io_exception,
  input  [1:0]  io_retire,
  input  [63:0] io_cause,
  input  [39:0] io_pc,
  input  [39:0] io_tval,
  output [63:0] io_time,
  output [2:0]  io_fcsr_rm,
  input         io_fcsr_flags_valid,
  input  [4:0]  io_fcsr_flags_bits,
  input         io_fcsr_flag_exception_valid,
  input  [6:0]  io_fcsr_flag_exception_bits,
  input         io_set_fs_dirty,
  input         io_rocc_interrupt,
  output        io_interrupt,
  output [63:0] io_interrupt_cause,
  output        io_pmp_0_cfg_l,
  output [1:0]  io_pmp_0_cfg_res,
  output [1:0]  io_pmp_0_cfg_a,
  output        io_pmp_0_cfg_x,
  output        io_pmp_0_cfg_w,
  output        io_pmp_0_cfg_r,
  output [29:0] io_pmp_0_addr,
  output [31:0] io_pmp_0_mask,
  output        io_pmp_1_cfg_l,
  output [1:0]  io_pmp_1_cfg_res,
  output [1:0]  io_pmp_1_cfg_a,
  output        io_pmp_1_cfg_x,
  output        io_pmp_1_cfg_w,
  output        io_pmp_1_cfg_r,
  output [29:0] io_pmp_1_addr,
  output [31:0] io_pmp_1_mask,
  output        io_pmp_2_cfg_l,
  output [1:0]  io_pmp_2_cfg_res,
  output [1:0]  io_pmp_2_cfg_a,
  output        io_pmp_2_cfg_x,
  output        io_pmp_2_cfg_w,
  output        io_pmp_2_cfg_r,
  output [29:0] io_pmp_2_addr,
  output [31:0] io_pmp_2_mask,
  output        io_pmp_3_cfg_l,
  output [1:0]  io_pmp_3_cfg_res,
  output [1:0]  io_pmp_3_cfg_a,
  output        io_pmp_3_cfg_x,
  output        io_pmp_3_cfg_w,
  output        io_pmp_3_cfg_r,
  output [29:0] io_pmp_3_addr,
  output [31:0] io_pmp_3_mask,
  output        io_pmp_4_cfg_l,
  output [1:0]  io_pmp_4_cfg_res,
  output [1:0]  io_pmp_4_cfg_a,
  output        io_pmp_4_cfg_x,
  output        io_pmp_4_cfg_w,
  output        io_pmp_4_cfg_r,
  output [29:0] io_pmp_4_addr,
  output [31:0] io_pmp_4_mask,
  output        io_pmp_5_cfg_l,
  output [1:0]  io_pmp_5_cfg_res,
  output [1:0]  io_pmp_5_cfg_a,
  output        io_pmp_5_cfg_x,
  output        io_pmp_5_cfg_w,
  output        io_pmp_5_cfg_r,
  output [29:0] io_pmp_5_addr,
  output [31:0] io_pmp_5_mask,
  output        io_pmp_6_cfg_l,
  output [1:0]  io_pmp_6_cfg_res,
  output [1:0]  io_pmp_6_cfg_a,
  output        io_pmp_6_cfg_x,
  output        io_pmp_6_cfg_w,
  output        io_pmp_6_cfg_r,
  output [29:0] io_pmp_6_addr,
  output [31:0] io_pmp_6_mask,
  output        io_pmp_7_cfg_l,
  output [1:0]  io_pmp_7_cfg_res,
  output [1:0]  io_pmp_7_cfg_a,
  output        io_pmp_7_cfg_x,
  output        io_pmp_7_cfg_w,
  output        io_pmp_7_cfg_r,
  output [29:0] io_pmp_7_addr,
  output [31:0] io_pmp_7_mask,
  output [63:0] io_counters_0_eventSel,
  input  [1:0]  io_counters_0_inc,
  output [63:0] io_counters_1_eventSel,
  input  [1:0]  io_counters_1_inc,
  output [63:0] io_counters_2_eventSel,
  input  [1:0]  io_counters_2_inc,
  output [63:0] io_counters_3_eventSel,
  input  [1:0]  io_counters_3_inc,
  output [63:0] io_counters_4_eventSel,
  input  [1:0]  io_counters_4_inc,
  output [63:0] io_counters_5_eventSel,
  input  [1:0]  io_counters_5_inc,
  output [31:0] io_csrw_counter,
  output        io_inhibit_cycle,
  input  [31:0] io_inst_0,
  input  [31:0] io_inst_1,
  output        io_trace_0_valid,
  output [39:0] io_trace_0_iaddr,
  output [31:0] io_trace_0_insn,
  output [2:0]  io_trace_0_priv,
  output        io_trace_0_exception,
  output        io_trace_0_interrupt,
  output [63:0] io_trace_0_cause,
  output [39:0] io_trace_0_tval,
  output        io_trace_1_valid,
  output [39:0] io_trace_1_iaddr,
  output [31:0] io_trace_1_insn,
  output [2:0]  io_trace_1_priv,
  output        io_trace_1_exception,
  output        io_trace_1_interrupt,
  output [63:0] io_trace_1_cause,
  output [39:0] io_trace_1_tval,
  output        io_customCSRs_0_wen,
  output [63:0] io_customCSRs_0_wdata,
  output [63:0] io_customCSRs_0_value
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
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
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
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [63:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [63:0] _RAND_78;
  reg [63:0] _RAND_79;
  reg [63:0] _RAND_80;
  reg [63:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [63:0] _RAND_85;
  reg [63:0] _RAND_86;
  reg [63:0] _RAND_87;
  reg [63:0] _RAND_88;
  reg [63:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [63:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [63:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [63:0] _RAND_99;
  reg [63:0] _RAND_100;
  reg [63:0] _RAND_101;
  reg [63:0] _RAND_102;
  reg [63:0] _RAND_103;
  reg [63:0] _RAND_104;
  reg [63:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [63:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [63:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [63:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [63:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [63:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [63:0] _RAND_117;
  reg [63:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] reg_mstatus_prv; // @[CSR.scala 320:24]
  reg  reg_mstatus_tsr; // @[CSR.scala 320:24]
  reg  reg_mstatus_tw; // @[CSR.scala 320:24]
  reg  reg_mstatus_tvm; // @[CSR.scala 320:24]
  reg  reg_mstatus_mxr; // @[CSR.scala 320:24]
  reg  reg_mstatus_sum; // @[CSR.scala 320:24]
  reg  reg_mstatus_mprv; // @[CSR.scala 320:24]
  reg [1:0] reg_mstatus_fs; // @[CSR.scala 320:24]
  reg [1:0] reg_mstatus_mpp; // @[CSR.scala 320:24]
  reg  reg_mstatus_spp; // @[CSR.scala 320:24]
  reg  reg_mstatus_mpie; // @[CSR.scala 320:24]
  reg  reg_mstatus_spie; // @[CSR.scala 320:24]
  reg  reg_mstatus_mie; // @[CSR.scala 320:24]
  reg  reg_mstatus_sie; // @[CSR.scala 320:24]
  wire  system_insn = io_rw_cmd == 3'h4; // @[CSR.scala 640:31]
  wire [31:0] _T_204 = {io_rw_addr, 20'h0}; // @[CSR.scala 653:28]
  wire [31:0] _T_211 = _T_204 & 32'h12400000; // @[Decode.scala 14:65]
  wire  _T_212 = _T_211 == 32'h10000000; // @[Decode.scala 14:121]
  wire [31:0] _T_213 = _T_204 & 32'h40000000; // @[Decode.scala 14:65]
  wire  _T_214 = _T_213 == 32'h40000000; // @[Decode.scala 14:121]
  wire  _T_216 = _T_212 | _T_214; // @[Decode.scala 15:30]
  wire  insn_ret = system_insn & _T_216; // @[CSR.scala 653:95]
  reg [1:0] reg_dcsr_prv; // @[CSR.scala 328:21]
  wire [1:0] _GEN_161 = io_rw_addr[10] & io_rw_addr[7] ? reg_dcsr_prv : reg_mstatus_mpp; // @[CSR.scala 822:70 CSR.scala 823:15]
  wire [1:0] ret_prv = ~io_rw_addr[9] ? {{1'd0}, reg_mstatus_spp} : _GEN_161; // @[CSR.scala 816:52 CSR.scala 820:15]
  wire [31:0] _T_205 = _T_204 & 32'h10100000; // @[Decode.scala 14:65]
  wire  _T_206 = _T_205 == 32'h0; // @[Decode.scala 14:121]
  wire  insn_call = system_insn & _T_206; // @[CSR.scala 653:95]
  wire  _T_209 = _T_205 == 32'h100000; // @[Decode.scala 14:121]
  wire  insn_break = system_insn & _T_209; // @[CSR.scala 653:95]
  wire  _exception_T = insn_call | insn_break; // @[CSR.scala 739:29]
  wire  exception = insn_call | insn_break | io_exception; // @[CSR.scala 739:43]
  reg  reg_singleStepped; // @[CSR.scala 373:30]
  wire [3:0] _GEN_48 = {{2'd0}, reg_mstatus_prv}; // @[CSR.scala 689:36]
  wire [3:0] _cause_T_1 = _GEN_48 + 4'h8; // @[CSR.scala 689:36]
  wire [63:0] _cause_T_2 = insn_break ? 64'h3 : io_cause; // @[CSR.scala 690:14]
  wire [63:0] cause = insn_call ? {{60'd0}, _cause_T_1} : _cause_T_2; // @[CSR.scala 689:8]
  wire [7:0] cause_lsbs = cause[7:0]; // @[CSR.scala 691:25]
  wire  _causeIsDebugInt_T_1 = cause_lsbs == 8'he; // @[CSR.scala 692:53]
  wire  causeIsDebugInt = cause[63] & cause_lsbs == 8'he; // @[CSR.scala 692:39]
  wire  _causeIsDebugTrigger_T_1 = ~cause[63]; // @[CSR.scala 693:29]
  wire  causeIsDebugTrigger = ~cause[63] & _causeIsDebugInt_T_1; // @[CSR.scala 693:44]
  reg  reg_dcsr_ebreakm; // @[CSR.scala 328:21]
  reg  reg_dcsr_ebreaks; // @[CSR.scala 328:21]
  reg  reg_dcsr_ebreaku; // @[CSR.scala 328:21]
  wire [3:0] _causeIsDebugBreak_T_3 = {reg_dcsr_ebreakm,1'h0,reg_dcsr_ebreaks,reg_dcsr_ebreaku}; // @[Cat.scala 30:58]
  wire [3:0] _causeIsDebugBreak_T_4 = _causeIsDebugBreak_T_3 >> reg_mstatus_prv; // @[CSR.scala 694:134]
  wire  causeIsDebugBreak = _causeIsDebugTrigger_T_1 & insn_break & _causeIsDebugBreak_T_4[0]; // @[CSR.scala 694:56]
  reg  reg_debug; // @[CSR.scala 369:22]
  wire  trapToDebug = reg_singleStepped | causeIsDebugInt | causeIsDebugTrigger | causeIsDebugBreak | reg_debug; // @[CSR.scala 695:123]
  wire  _T_312 = ~reg_debug; // @[CSR.scala 757:13]
  wire [1:0] _GEN_68 = ~reg_debug ? 2'h3 : reg_mstatus_prv; // @[CSR.scala 757:25 CSR.scala 762:17]
  wire  _delegate_T = reg_mstatus_prv <= 2'h1; // @[CSR.scala 699:59]
  reg [63:0] reg_mideleg; // @[CSR.scala 384:18]
  wire [63:0] read_mideleg = reg_mideleg & 64'h222; // @[CSR.scala 385:36]
  wire [63:0] _delegate_T_3 = read_mideleg >> cause_lsbs; // @[CSR.scala 699:102]
  reg [63:0] reg_medeleg; // @[CSR.scala 388:18]
  wire [63:0] read_medeleg = reg_medeleg & 64'hb15d; // @[CSR.scala 389:36]
  wire [63:0] _delegate_T_5 = read_medeleg >> cause_lsbs; // @[CSR.scala 699:128]
  wire  _delegate_T_7 = cause[63] ? _delegate_T_3[0] : _delegate_T_5[0]; // @[CSR.scala 699:74]
  wire  delegate = reg_mstatus_prv <= 2'h1 & _delegate_T_7; // @[CSR.scala 699:68]
  wire [1:0] _GEN_82 = delegate ? 2'h1 : 2'h3; // @[CSR.scala 773:35 CSR.scala 781:15 CSR.scala 790:15]
  wire [1:0] _GEN_112 = trapToDebug ? _GEN_68 : _GEN_82; // @[CSR.scala 756:24]
  wire [1:0] _GEN_135 = exception ? _GEN_112 : reg_mstatus_prv; // @[CSR.scala 755:20]
  wire [1:0] new_prv = insn_ret ? ret_prv : _GEN_135; // @[CSR.scala 814:19 CSR.scala 839:13]
  reg [2:0] reg_dcsr_cause; // @[CSR.scala 328:21]
  reg  reg_dcsr_step; // @[CSR.scala 328:21]
  reg [39:0] reg_dpc; // @[CSR.scala 370:20]
  reg [63:0] reg_dscratch; // @[CSR.scala 371:25]
  reg  reg_pmp_0_cfg_l; // @[CSR.scala 380:20]
  reg [1:0] reg_pmp_0_cfg_a; // @[CSR.scala 380:20]
  reg  reg_pmp_0_cfg_x; // @[CSR.scala 380:20]
  reg  reg_pmp_0_cfg_w; // @[CSR.scala 380:20]
  reg  reg_pmp_0_cfg_r; // @[CSR.scala 380:20]
  reg [29:0] reg_pmp_0_addr; // @[CSR.scala 380:20]
  reg  reg_pmp_1_cfg_l; // @[CSR.scala 380:20]
  reg [1:0] reg_pmp_1_cfg_a; // @[CSR.scala 380:20]
  reg  reg_pmp_1_cfg_x; // @[CSR.scala 380:20]
  reg  reg_pmp_1_cfg_w; // @[CSR.scala 380:20]
  reg  reg_pmp_1_cfg_r; // @[CSR.scala 380:20]
  reg [29:0] reg_pmp_1_addr; // @[CSR.scala 380:20]
  reg  reg_pmp_2_cfg_l; // @[CSR.scala 380:20]
  reg [1:0] reg_pmp_2_cfg_a; // @[CSR.scala 380:20]
  reg  reg_pmp_2_cfg_x; // @[CSR.scala 380:20]
  reg  reg_pmp_2_cfg_w; // @[CSR.scala 380:20]
  reg  reg_pmp_2_cfg_r; // @[CSR.scala 380:20]
  reg [29:0] reg_pmp_2_addr; // @[CSR.scala 380:20]
  reg  reg_pmp_3_cfg_l; // @[CSR.scala 380:20]
  reg [1:0] reg_pmp_3_cfg_a; // @[CSR.scala 380:20]
  reg  reg_pmp_3_cfg_x; // @[CSR.scala 380:20]
  reg  reg_pmp_3_cfg_w; // @[CSR.scala 380:20]
  reg  reg_pmp_3_cfg_r; // @[CSR.scala 380:20]
  reg [29:0] reg_pmp_3_addr; // @[CSR.scala 380:20]
  reg  reg_pmp_4_cfg_l; // @[CSR.scala 380:20]
  reg [1:0] reg_pmp_4_cfg_a; // @[CSR.scala 380:20]
  reg  reg_pmp_4_cfg_x; // @[CSR.scala 380:20]
  reg  reg_pmp_4_cfg_w; // @[CSR.scala 380:20]
  reg  reg_pmp_4_cfg_r; // @[CSR.scala 380:20]
  reg [29:0] reg_pmp_4_addr; // @[CSR.scala 380:20]
  reg  reg_pmp_5_cfg_l; // @[CSR.scala 380:20]
  reg [1:0] reg_pmp_5_cfg_a; // @[CSR.scala 380:20]
  reg  reg_pmp_5_cfg_x; // @[CSR.scala 380:20]
  reg  reg_pmp_5_cfg_w; // @[CSR.scala 380:20]
  reg  reg_pmp_5_cfg_r; // @[CSR.scala 380:20]
  reg [29:0] reg_pmp_5_addr; // @[CSR.scala 380:20]
  reg  reg_pmp_6_cfg_l; // @[CSR.scala 380:20]
  reg [1:0] reg_pmp_6_cfg_a; // @[CSR.scala 380:20]
  reg  reg_pmp_6_cfg_x; // @[CSR.scala 380:20]
  reg  reg_pmp_6_cfg_w; // @[CSR.scala 380:20]
  reg  reg_pmp_6_cfg_r; // @[CSR.scala 380:20]
  reg [29:0] reg_pmp_6_addr; // @[CSR.scala 380:20]
  reg  reg_pmp_7_cfg_l; // @[CSR.scala 380:20]
  reg [1:0] reg_pmp_7_cfg_a; // @[CSR.scala 380:20]
  reg  reg_pmp_7_cfg_x; // @[CSR.scala 380:20]
  reg  reg_pmp_7_cfg_w; // @[CSR.scala 380:20]
  reg  reg_pmp_7_cfg_r; // @[CSR.scala 380:20]
  reg [29:0] reg_pmp_7_addr; // @[CSR.scala 380:20]
  reg [63:0] reg_mie; // @[CSR.scala 382:20]
  reg  reg_mip_seip; // @[CSR.scala 391:20]
  reg  reg_mip_stip; // @[CSR.scala 391:20]
  reg  reg_mip_ssip; // @[CSR.scala 391:20]
  reg [39:0] reg_mepc; // @[CSR.scala 392:21]
  reg [63:0] reg_mcause; // @[CSR.scala 393:27]
  reg [39:0] reg_mtval; // @[CSR.scala 394:22]
  reg [63:0] reg_mscratch; // @[CSR.scala 395:25]
  reg [31:0] reg_mtvec; // @[CSR.scala 398:27]
  reg [31:0] reg_mcounteren; // @[CSR.scala 414:18]
  wire [31:0] read_mcounteren = reg_mcounteren & 32'h1ff; // @[CSR.scala 415:30]
  reg [31:0] reg_scounteren; // @[CSR.scala 418:18]
  wire [31:0] read_scounteren = reg_scounteren & 32'h1ff; // @[CSR.scala 419:36]
  reg [39:0] reg_sepc; // @[CSR.scala 422:21]
  reg [63:0] reg_scause; // @[CSR.scala 423:23]
  reg [39:0] reg_stval; // @[CSR.scala 424:22]
  reg [63:0] reg_sscratch; // @[CSR.scala 425:25]
  reg [38:0] reg_stvec; // @[CSR.scala 426:22]
  reg [3:0] reg_satp_mode; // @[CSR.scala 427:21]
  reg [43:0] reg_satp_ppn; // @[CSR.scala 427:21]
  reg  reg_wfi; // @[CSR.scala 428:50]
  reg [4:0] reg_fflags; // @[CSR.scala 430:23]
  reg [2:0] reg_frm; // @[CSR.scala 431:20]
  reg [8:0] reg_mcountinhibit; // @[CSR.scala 437:34]
  wire  x67 = reg_mcountinhibit[2]; // @[CSR.scala 439:75]
  reg [5:0] value_lo; // @[Counters.scala 45:37]
  wire [5:0] _GEN_49 = {{4'd0}, io_retire}; // @[Counters.scala 46:33]
  wire [6:0] nextSmall = value_lo + _GEN_49; // @[Counters.scala 46:33]
  wire  _T_5 = ~x67; // @[Counters.scala 47:9]
  wire [6:0] _GEN_0 = ~x67 ? nextSmall : {{1'd0}, value_lo}; // @[Counters.scala 47:19 Counters.scala 47:27 Counters.scala 45:37]
  reg [57:0] value_hi; // @[Counters.scala 50:27]
  wire [57:0] _large_r_T_1 = value_hi + 58'h1; // @[Counters.scala 51:55]
  wire [57:0] _GEN_1 = nextSmall[6] & _T_5 ? _large_r_T_1 : value_hi; // @[Counters.scala 51:46 Counters.scala 51:50 Counters.scala 50:27]
  wire [63:0] value = {value_hi,value_lo}; // @[Cat.scala 30:58]
  wire  x74 = ~io_csr_stall; // @[CSR.scala 441:56]
  reg [5:0] value_lo_1; // @[Counters.scala 45:37]
  wire [5:0] _GEN_54 = {{5'd0}, x74}; // @[Counters.scala 46:33]
  wire [6:0] nextSmall_1 = value_lo_1 + _GEN_54; // @[Counters.scala 46:33]
  wire  _T_6 = ~reg_mcountinhibit[0]; // @[Counters.scala 47:9]
  wire [6:0] _GEN_2 = ~reg_mcountinhibit[0] ? nextSmall_1 : {{1'd0}, value_lo_1}; // @[Counters.scala 47:19 Counters.scala 47:27 Counters.scala 45:37]
  reg [57:0] value_hi_1; // @[Counters.scala 50:27]
  wire [57:0] _large_r_T_3 = value_hi_1 + 58'h1; // @[Counters.scala 51:55]
  wire [57:0] _GEN_3 = nextSmall_1[6] & _T_6 ? _large_r_T_3 : value_hi_1; // @[Counters.scala 51:46 Counters.scala 51:50 Counters.scala 50:27]
  wire [63:0] value_1 = {value_hi_1,value_lo_1}; // @[Cat.scala 30:58]
  reg [63:0] reg_hpmevent_0; // @[CSR.scala 442:46]
  reg [63:0] reg_hpmevent_1; // @[CSR.scala 442:46]
  reg [63:0] reg_hpmevent_2; // @[CSR.scala 442:46]
  reg [63:0] reg_hpmevent_3; // @[CSR.scala 442:46]
  reg [63:0] reg_hpmevent_4; // @[CSR.scala 442:46]
  reg [63:0] reg_hpmevent_5; // @[CSR.scala 442:46]
  reg [5:0] value_lo_2; // @[Counters.scala 45:72]
  wire [5:0] _GEN_55 = {{4'd0}, io_counters_0_inc}; // @[Counters.scala 46:33]
  wire [6:0] nextSmall_2 = value_lo_2 + _GEN_55; // @[Counters.scala 46:33]
  wire  _T_8 = ~reg_mcountinhibit[3]; // @[Counters.scala 47:9]
  wire [6:0] _GEN_4 = ~reg_mcountinhibit[3] ? nextSmall_2 : {{1'd0}, value_lo_2}; // @[Counters.scala 47:19 Counters.scala 47:27 Counters.scala 45:72]
  reg [33:0] value_hi_2; // @[Counters.scala 50:70]
  wire [33:0] _large_r_T_5 = value_hi_2 + 34'h1; // @[Counters.scala 51:55]
  wire [33:0] _GEN_5 = nextSmall_2[6] & _T_8 ? _large_r_T_5 : value_hi_2; // @[Counters.scala 51:46 Counters.scala 51:50 Counters.scala 50:70]
  wire [39:0] value_2 = {value_hi_2,value_lo_2}; // @[Cat.scala 30:58]
  reg [5:0] value_lo_3; // @[Counters.scala 45:72]
  wire [5:0] _GEN_492 = {{4'd0}, io_counters_1_inc}; // @[Counters.scala 46:33]
  wire [6:0] nextSmall_3 = value_lo_3 + _GEN_492; // @[Counters.scala 46:33]
  wire  _T_10 = ~reg_mcountinhibit[4]; // @[Counters.scala 47:9]
  wire [6:0] _GEN_6 = ~reg_mcountinhibit[4] ? nextSmall_3 : {{1'd0}, value_lo_3}; // @[Counters.scala 47:19 Counters.scala 47:27 Counters.scala 45:72]
  reg [33:0] value_hi_3; // @[Counters.scala 50:70]
  wire [33:0] _large_r_T_7 = value_hi_3 + 34'h1; // @[Counters.scala 51:55]
  wire [33:0] _GEN_7 = nextSmall_3[6] & _T_10 ? _large_r_T_7 : value_hi_3; // @[Counters.scala 51:46 Counters.scala 51:50 Counters.scala 50:70]
  wire [39:0] value_3 = {value_hi_3,value_lo_3}; // @[Cat.scala 30:58]
  reg [5:0] value_lo_4; // @[Counters.scala 45:72]
  wire [5:0] _GEN_493 = {{4'd0}, io_counters_2_inc}; // @[Counters.scala 46:33]
  wire [6:0] nextSmall_4 = value_lo_4 + _GEN_493; // @[Counters.scala 46:33]
  wire  _T_12 = ~reg_mcountinhibit[5]; // @[Counters.scala 47:9]
  wire [6:0] _GEN_8 = ~reg_mcountinhibit[5] ? nextSmall_4 : {{1'd0}, value_lo_4}; // @[Counters.scala 47:19 Counters.scala 47:27 Counters.scala 45:72]
  reg [33:0] value_hi_4; // @[Counters.scala 50:70]
  wire [33:0] _large_r_T_9 = value_hi_4 + 34'h1; // @[Counters.scala 51:55]
  wire [33:0] _GEN_9 = nextSmall_4[6] & _T_12 ? _large_r_T_9 : value_hi_4; // @[Counters.scala 51:46 Counters.scala 51:50 Counters.scala 50:70]
  wire [39:0] value_4 = {value_hi_4,value_lo_4}; // @[Cat.scala 30:58]
  reg [5:0] value_lo_5; // @[Counters.scala 45:72]
  wire [5:0] _GEN_494 = {{4'd0}, io_counters_3_inc}; // @[Counters.scala 46:33]
  wire [6:0] nextSmall_5 = value_lo_5 + _GEN_494; // @[Counters.scala 46:33]
  wire  _T_14 = ~reg_mcountinhibit[6]; // @[Counters.scala 47:9]
  wire [6:0] _GEN_10 = ~reg_mcountinhibit[6] ? nextSmall_5 : {{1'd0}, value_lo_5}; // @[Counters.scala 47:19 Counters.scala 47:27 Counters.scala 45:72]
  reg [33:0] value_hi_5; // @[Counters.scala 50:70]
  wire [33:0] _large_r_T_11 = value_hi_5 + 34'h1; // @[Counters.scala 51:55]
  wire [33:0] _GEN_11 = nextSmall_5[6] & _T_14 ? _large_r_T_11 : value_hi_5; // @[Counters.scala 51:46 Counters.scala 51:50 Counters.scala 50:70]
  wire [39:0] value_5 = {value_hi_5,value_lo_5}; // @[Cat.scala 30:58]
  reg [5:0] value_lo_6; // @[Counters.scala 45:72]
  wire [5:0] _GEN_495 = {{4'd0}, io_counters_4_inc}; // @[Counters.scala 46:33]
  wire [6:0] nextSmall_6 = value_lo_6 + _GEN_495; // @[Counters.scala 46:33]
  wire  _T_16 = ~reg_mcountinhibit[7]; // @[Counters.scala 47:9]
  wire [6:0] _GEN_12 = ~reg_mcountinhibit[7] ? nextSmall_6 : {{1'd0}, value_lo_6}; // @[Counters.scala 47:19 Counters.scala 47:27 Counters.scala 45:72]
  reg [33:0] value_hi_6; // @[Counters.scala 50:70]
  wire [33:0] _large_r_T_13 = value_hi_6 + 34'h1; // @[Counters.scala 51:55]
  wire [33:0] _GEN_13 = nextSmall_6[6] & _T_16 ? _large_r_T_13 : value_hi_6; // @[Counters.scala 51:46 Counters.scala 51:50 Counters.scala 50:70]
  wire [39:0] value_6 = {value_hi_6,value_lo_6}; // @[Cat.scala 30:58]
  reg [5:0] value_lo_7; // @[Counters.scala 45:72]
  wire [5:0] _GEN_496 = {{4'd0}, io_counters_5_inc}; // @[Counters.scala 46:33]
  wire [6:0] nextSmall_7 = value_lo_7 + _GEN_496; // @[Counters.scala 46:33]
  wire  _T_18 = ~reg_mcountinhibit[8]; // @[Counters.scala 47:9]
  wire [6:0] _GEN_14 = ~reg_mcountinhibit[8] ? nextSmall_7 : {{1'd0}, value_lo_7}; // @[Counters.scala 47:19 Counters.scala 47:27 Counters.scala 45:72]
  reg [33:0] value_hi_7; // @[Counters.scala 50:70]
  wire [33:0] _large_r_T_15 = value_hi_7 + 34'h1; // @[Counters.scala 51:55]
  wire [33:0] _GEN_15 = nextSmall_7[6] & _T_18 ? _large_r_T_15 : value_hi_7; // @[Counters.scala 51:46 Counters.scala 51:50 Counters.scala 50:70]
  wire [39:0] value_7 = {value_hi_7,value_lo_7}; // @[Cat.scala 30:58]
  wire  mip_seip = reg_mip_seip | io_interrupts_seip; // @[CSR.scala 453:57]
  wire [7:0] read_mip_lo = {io_interrupts_mtip,1'h0,reg_mip_stip,1'h0,io_interrupts_msip,1'h0,reg_mip_ssip,1'h0}; // @[CSR.scala 455:22]
  wire [15:0] _read_mip_T = {2'h0,1'h0,io_rocc_interrupt,io_interrupts_meip,1'h0,mip_seip,1'h0,read_mip_lo}; // @[CSR.scala 455:22]
  wire [15:0] read_mip = _read_mip_T & 16'haaa; // @[CSR.scala 455:29]
  wire [63:0] _GEN_497 = {{48'd0}, read_mip}; // @[CSR.scala 458:56]
  wire [63:0] pending_interrupts = _GEN_497 & reg_mie; // @[CSR.scala 458:56]
  wire [14:0] d_interrupts = {io_interrupts_debug, 14'h0}; // @[CSR.scala 459:42]
  wire [63:0] _m_interrupts_T_3 = ~pending_interrupts; // @[CSR.scala 465:83]
  wire [63:0] _m_interrupts_T_4 = _m_interrupts_T_3 | read_mideleg; // @[CSR.scala 465:103]
  wire [63:0] _m_interrupts_T_5 = ~_m_interrupts_T_4; // @[CSR.scala 465:81]
  wire [63:0] m_interrupts = _delegate_T | reg_mstatus_mie ? _m_interrupts_T_5 : 64'h0; // @[CSR.scala 465:25]
  wire [63:0] _s_interrupts_T_5 = pending_interrupts & read_mideleg; // @[CSR.scala 466:130]
  wire [63:0] s_interrupts = reg_mstatus_prv < 2'h1 | reg_mstatus_prv == 2'h1 & reg_mstatus_sie ? _s_interrupts_T_5 : 64'h0
    ; // @[CSR.scala 466:25]
  wire  _any_T_53 = d_interrupts[14] | d_interrupts[13] | d_interrupts[12] | d_interrupts[11] | d_interrupts[3] |
    d_interrupts[7] | d_interrupts[9] | d_interrupts[1] | d_interrupts[5] | d_interrupts[8] | d_interrupts[0] |
    d_interrupts[4] | m_interrupts[15] | m_interrupts[14] | m_interrupts[13] | m_interrupts[12]; // @[CSR.scala 1182:90]
  wire  _any_T_68 = _any_T_53 | m_interrupts[11] | m_interrupts[3] | m_interrupts[7] | m_interrupts[9] | m_interrupts[1]
     | m_interrupts[5] | m_interrupts[8] | m_interrupts[0] | m_interrupts[4] | s_interrupts[15] | s_interrupts[14] |
    s_interrupts[13] | s_interrupts[12] | s_interrupts[11] | s_interrupts[3]; // @[CSR.scala 1182:90]
  wire  anyInterrupt = _any_T_68 | s_interrupts[7] | s_interrupts[9] | s_interrupts[1] | s_interrupts[5] | s_interrupts[
    8] | s_interrupts[0] | s_interrupts[4]; // @[CSR.scala 1182:90]
  wire [2:0] _which_T_38 = s_interrupts[0] ? 3'h0 : 3'h4; // @[Mux.scala 47:69]
  wire [3:0] _which_T_39 = s_interrupts[8] ? 4'h8 : {{1'd0}, _which_T_38}; // @[Mux.scala 47:69]
  wire [3:0] _which_T_40 = s_interrupts[5] ? 4'h5 : _which_T_39; // @[Mux.scala 47:69]
  wire [3:0] _which_T_41 = s_interrupts[1] ? 4'h1 : _which_T_40; // @[Mux.scala 47:69]
  wire [3:0] _which_T_42 = s_interrupts[9] ? 4'h9 : _which_T_41; // @[Mux.scala 47:69]
  wire [3:0] _which_T_43 = s_interrupts[7] ? 4'h7 : _which_T_42; // @[Mux.scala 47:69]
  wire [3:0] _which_T_44 = s_interrupts[3] ? 4'h3 : _which_T_43; // @[Mux.scala 47:69]
  wire [3:0] _which_T_45 = s_interrupts[11] ? 4'hb : _which_T_44; // @[Mux.scala 47:69]
  wire [3:0] _which_T_46 = s_interrupts[12] ? 4'hc : _which_T_45; // @[Mux.scala 47:69]
  wire [3:0] _which_T_47 = s_interrupts[13] ? 4'hd : _which_T_46; // @[Mux.scala 47:69]
  wire [3:0] _which_T_48 = s_interrupts[14] ? 4'he : _which_T_47; // @[Mux.scala 47:69]
  wire [3:0] _which_T_49 = s_interrupts[15] ? 4'hf : _which_T_48; // @[Mux.scala 47:69]
  wire [3:0] _which_T_50 = m_interrupts[4] ? 4'h4 : _which_T_49; // @[Mux.scala 47:69]
  wire [3:0] _which_T_51 = m_interrupts[0] ? 4'h0 : _which_T_50; // @[Mux.scala 47:69]
  wire [3:0] _which_T_52 = m_interrupts[8] ? 4'h8 : _which_T_51; // @[Mux.scala 47:69]
  wire [3:0] _which_T_53 = m_interrupts[5] ? 4'h5 : _which_T_52; // @[Mux.scala 47:69]
  wire [3:0] _which_T_54 = m_interrupts[1] ? 4'h1 : _which_T_53; // @[Mux.scala 47:69]
  wire [3:0] _which_T_55 = m_interrupts[9] ? 4'h9 : _which_T_54; // @[Mux.scala 47:69]
  wire [3:0] _which_T_56 = m_interrupts[7] ? 4'h7 : _which_T_55; // @[Mux.scala 47:69]
  wire [3:0] _which_T_57 = m_interrupts[3] ? 4'h3 : _which_T_56; // @[Mux.scala 47:69]
  wire [3:0] _which_T_58 = m_interrupts[11] ? 4'hb : _which_T_57; // @[Mux.scala 47:69]
  wire [3:0] _which_T_59 = m_interrupts[12] ? 4'hc : _which_T_58; // @[Mux.scala 47:69]
  wire [3:0] _which_T_60 = m_interrupts[13] ? 4'hd : _which_T_59; // @[Mux.scala 47:69]
  wire [3:0] _which_T_61 = m_interrupts[14] ? 4'he : _which_T_60; // @[Mux.scala 47:69]
  wire [3:0] _which_T_62 = m_interrupts[15] ? 4'hf : _which_T_61; // @[Mux.scala 47:69]
  wire [3:0] _which_T_64 = d_interrupts[4] ? 4'h4 : _which_T_62; // @[Mux.scala 47:69]
  wire [3:0] _which_T_65 = d_interrupts[0] ? 4'h0 : _which_T_64; // @[Mux.scala 47:69]
  wire [3:0] _which_T_66 = d_interrupts[8] ? 4'h8 : _which_T_65; // @[Mux.scala 47:69]
  wire [3:0] _which_T_67 = d_interrupts[5] ? 4'h5 : _which_T_66; // @[Mux.scala 47:69]
  wire [3:0] _which_T_68 = d_interrupts[1] ? 4'h1 : _which_T_67; // @[Mux.scala 47:69]
  wire [3:0] _which_T_69 = d_interrupts[9] ? 4'h9 : _which_T_68; // @[Mux.scala 47:69]
  wire [3:0] _which_T_70 = d_interrupts[7] ? 4'h7 : _which_T_69; // @[Mux.scala 47:69]
  wire [3:0] _which_T_71 = d_interrupts[3] ? 4'h3 : _which_T_70; // @[Mux.scala 47:69]
  wire [3:0] _which_T_72 = d_interrupts[11] ? 4'hb : _which_T_71; // @[Mux.scala 47:69]
  wire [3:0] _which_T_73 = d_interrupts[12] ? 4'hc : _which_T_72; // @[Mux.scala 47:69]
  wire [3:0] _which_T_74 = d_interrupts[13] ? 4'hd : _which_T_73; // @[Mux.scala 47:69]
  wire [3:0] whichInterrupt = d_interrupts[14] ? 4'he : _which_T_74; // @[Mux.scala 47:69]
  wire [63:0] _GEN_498 = {{60'd0}, whichInterrupt}; // @[CSR.scala 469:67]
  wire  _io_interrupt_T = ~io_singleStep; // @[CSR.scala 470:36]
  wire  pmp_mask_base_lo = reg_pmp_0_cfg_a[0]; // @[PMP.scala 59:31]
  wire [30:0] pmp_mask_base = {reg_pmp_0_addr,pmp_mask_base_lo}; // @[Cat.scala 30:58]
  wire [30:0] _pmp_mask_T_1 = pmp_mask_base + 31'h1; // @[PMP.scala 60:23]
  wire [30:0] _pmp_mask_T_2 = ~_pmp_mask_T_1; // @[PMP.scala 60:16]
  wire [30:0] pmp_mask_hi = pmp_mask_base & _pmp_mask_T_2; // @[PMP.scala 60:14]
  wire [32:0] _pmp_mask_T_3 = {pmp_mask_hi,2'h3}; // @[Cat.scala 30:58]
  wire  pmp_mask_base_lo_1 = reg_pmp_1_cfg_a[0]; // @[PMP.scala 59:31]
  wire [30:0] pmp_mask_base_1 = {reg_pmp_1_addr,pmp_mask_base_lo_1}; // @[Cat.scala 30:58]
  wire [30:0] _pmp_mask_T_5 = pmp_mask_base_1 + 31'h1; // @[PMP.scala 60:23]
  wire [30:0] _pmp_mask_T_6 = ~_pmp_mask_T_5; // @[PMP.scala 60:16]
  wire [30:0] pmp_mask_hi_1 = pmp_mask_base_1 & _pmp_mask_T_6; // @[PMP.scala 60:14]
  wire [32:0] _pmp_mask_T_7 = {pmp_mask_hi_1,2'h3}; // @[Cat.scala 30:58]
  wire  pmp_mask_base_lo_2 = reg_pmp_2_cfg_a[0]; // @[PMP.scala 59:31]
  wire [30:0] pmp_mask_base_2 = {reg_pmp_2_addr,pmp_mask_base_lo_2}; // @[Cat.scala 30:58]
  wire [30:0] _pmp_mask_T_9 = pmp_mask_base_2 + 31'h1; // @[PMP.scala 60:23]
  wire [30:0] _pmp_mask_T_10 = ~_pmp_mask_T_9; // @[PMP.scala 60:16]
  wire [30:0] pmp_mask_hi_2 = pmp_mask_base_2 & _pmp_mask_T_10; // @[PMP.scala 60:14]
  wire [32:0] _pmp_mask_T_11 = {pmp_mask_hi_2,2'h3}; // @[Cat.scala 30:58]
  wire  pmp_mask_base_lo_3 = reg_pmp_3_cfg_a[0]; // @[PMP.scala 59:31]
  wire [30:0] pmp_mask_base_3 = {reg_pmp_3_addr,pmp_mask_base_lo_3}; // @[Cat.scala 30:58]
  wire [30:0] _pmp_mask_T_13 = pmp_mask_base_3 + 31'h1; // @[PMP.scala 60:23]
  wire [30:0] _pmp_mask_T_14 = ~_pmp_mask_T_13; // @[PMP.scala 60:16]
  wire [30:0] pmp_mask_hi_3 = pmp_mask_base_3 & _pmp_mask_T_14; // @[PMP.scala 60:14]
  wire [32:0] _pmp_mask_T_15 = {pmp_mask_hi_3,2'h3}; // @[Cat.scala 30:58]
  wire  pmp_mask_base_lo_4 = reg_pmp_4_cfg_a[0]; // @[PMP.scala 59:31]
  wire [30:0] pmp_mask_base_4 = {reg_pmp_4_addr,pmp_mask_base_lo_4}; // @[Cat.scala 30:58]
  wire [30:0] _pmp_mask_T_17 = pmp_mask_base_4 + 31'h1; // @[PMP.scala 60:23]
  wire [30:0] _pmp_mask_T_18 = ~_pmp_mask_T_17; // @[PMP.scala 60:16]
  wire [30:0] pmp_mask_hi_4 = pmp_mask_base_4 & _pmp_mask_T_18; // @[PMP.scala 60:14]
  wire [32:0] _pmp_mask_T_19 = {pmp_mask_hi_4,2'h3}; // @[Cat.scala 30:58]
  wire  pmp_mask_base_lo_5 = reg_pmp_5_cfg_a[0]; // @[PMP.scala 59:31]
  wire [30:0] pmp_mask_base_5 = {reg_pmp_5_addr,pmp_mask_base_lo_5}; // @[Cat.scala 30:58]
  wire [30:0] _pmp_mask_T_21 = pmp_mask_base_5 + 31'h1; // @[PMP.scala 60:23]
  wire [30:0] _pmp_mask_T_22 = ~_pmp_mask_T_21; // @[PMP.scala 60:16]
  wire [30:0] pmp_mask_hi_5 = pmp_mask_base_5 & _pmp_mask_T_22; // @[PMP.scala 60:14]
  wire [32:0] _pmp_mask_T_23 = {pmp_mask_hi_5,2'h3}; // @[Cat.scala 30:58]
  wire  pmp_mask_base_lo_6 = reg_pmp_6_cfg_a[0]; // @[PMP.scala 59:31]
  wire [30:0] pmp_mask_base_6 = {reg_pmp_6_addr,pmp_mask_base_lo_6}; // @[Cat.scala 30:58]
  wire [30:0] _pmp_mask_T_25 = pmp_mask_base_6 + 31'h1; // @[PMP.scala 60:23]
  wire [30:0] _pmp_mask_T_26 = ~_pmp_mask_T_25; // @[PMP.scala 60:16]
  wire [30:0] pmp_mask_hi_6 = pmp_mask_base_6 & _pmp_mask_T_26; // @[PMP.scala 60:14]
  wire [32:0] _pmp_mask_T_27 = {pmp_mask_hi_6,2'h3}; // @[Cat.scala 30:58]
  wire  pmp_mask_base_lo_7 = reg_pmp_7_cfg_a[0]; // @[PMP.scala 59:31]
  wire [30:0] pmp_mask_base_7 = {reg_pmp_7_addr,pmp_mask_base_lo_7}; // @[Cat.scala 30:58]
  wire [30:0] _pmp_mask_T_29 = pmp_mask_base_7 + 31'h1; // @[PMP.scala 60:23]
  wire [30:0] _pmp_mask_T_30 = ~_pmp_mask_T_29; // @[PMP.scala 60:16]
  wire [30:0] pmp_mask_hi_7 = pmp_mask_base_7 & _pmp_mask_T_30; // @[PMP.scala 60:14]
  wire [32:0] _pmp_mask_T_31 = {pmp_mask_hi_7,2'h3}; // @[Cat.scala 30:58]
  wire [6:0] read_mstatus_lo_lo = {io_status_hpie,io_status_spie,io_status_upie,io_status_mie,io_status_hie,
    io_status_sie,io_status_uie}; // @[CSR.scala 492:38]
  wire [18:0] read_mstatus_lo = {io_status_sum,io_status_mprv,io_status_xs,io_status_fs,io_status_mpp,io_status_vs,
    io_status_spp,io_status_mpie,read_mstatus_lo_lo}; // @[CSR.scala 492:38]
  wire [16:0] read_mstatus_hi_lo = {io_status_sxl,io_status_uxl,io_status_sd_rv32,io_status_zero1,io_status_tsr,
    io_status_tw,io_status_tvm,io_status_mxr}; // @[CSR.scala 492:38]
  wire [102:0] _read_mstatus_T = {io_status_debug,io_status_cease,io_status_wfi,io_status_isa,io_status_dprv,
    io_status_prv,io_status_sd,io_status_zero2,read_mstatus_hi_lo,read_mstatus_lo}; // @[CSR.scala 492:38]
  wire [63:0] read_mstatus = _read_mstatus_T[63:0]; // @[CSR.scala 492:40]
  wire [7:0] _read_mtvec_T_1 = reg_mtvec[0] ? 8'hfe : 8'h2; // @[CSR.scala 1211:39]
  wire [31:0] _read_mtvec_T_3 = {{24'd0}, _read_mtvec_T_1}; // @[package.scala 165:41]
  wire [31:0] _read_mtvec_T_4 = ~_read_mtvec_T_3; // @[package.scala 165:37]
  wire [31:0] read_mtvec_lo = reg_mtvec & _read_mtvec_T_4; // @[package.scala 165:35]
  wire [63:0] read_mtvec = {32'h0,read_mtvec_lo}; // @[Cat.scala 30:58]
  wire [7:0] _read_stvec_T_1 = reg_stvec[0] ? 8'hfe : 8'h2; // @[CSR.scala 1211:39]
  wire [38:0] _read_stvec_T_3 = {{31'd0}, _read_stvec_T_1}; // @[package.scala 165:41]
  wire [38:0] _read_stvec_T_4 = ~_read_stvec_T_3; // @[package.scala 165:37]
  wire [38:0] read_stvec_lo = reg_stvec & _read_stvec_T_4; // @[package.scala 165:35]
  wire [24:0] read_stvec_hi = read_stvec_lo[38] ? 25'h1ffffff : 25'h0; // @[Bitwise.scala 72:12]
  wire [63:0] read_stvec = {read_stvec_hi,read_stvec_lo}; // @[Cat.scala 30:58]
  wire [39:0] _T_24 = ~reg_mepc; // @[CSR.scala 1210:28]
  wire [39:0] _T_27 = _T_24 | 40'h1; // @[CSR.scala 1210:31]
  wire [39:0] lo_4 = ~_T_27; // @[CSR.scala 1210:26]
  wire [23:0] hi_5 = lo_4[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_30 = {hi_5,lo_4}; // @[Cat.scala 30:58]
  wire [23:0] hi_6 = reg_mtval[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_33 = {hi_6,reg_mtval}; // @[Cat.scala 30:58]
  wire [11:0] lo_5 = {2'h0,1'h0,reg_dcsr_cause,3'h0,reg_dcsr_step,reg_dcsr_prv}; // @[CSR.scala 513:27]
  wire [31:0] _T_34 = {4'h4,12'h0,reg_dcsr_ebreakm,1'h0,reg_dcsr_ebreaks,reg_dcsr_ebreaku,lo_5}; // @[CSR.scala 513:27]
  wire [39:0] _T_35 = ~reg_dpc; // @[CSR.scala 1210:28]
  wire [39:0] _T_38 = _T_35 | 40'h1; // @[CSR.scala 1210:31]
  wire [39:0] lo_6 = ~_T_38; // @[CSR.scala 1210:26]
  wire [23:0] hi_8 = lo_6[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_41 = {hi_8,lo_6}; // @[Cat.scala 30:58]
  wire [7:0] read_fcsr = {reg_frm,reg_fflags}; // @[Cat.scala 30:58]
  wire [63:0] read_sie = reg_mie & read_mideleg; // @[CSR.scala 585:28]
  wire [63:0] read_sip = _GEN_497 & read_mideleg; // @[CSR.scala 586:29]
  wire [6:0] lo_lo_4 = {1'h0,io_status_spie,2'h0,1'h0,io_status_sie,1'h0}; // @[CSR.scala 600:57]
  wire [18:0] lo_7 = {io_status_sum,1'h0,io_status_xs,io_status_fs,2'h0,io_status_vs,io_status_spp,1'h0,lo_lo_4}; // @[CSR.scala 600:57]
  wire [16:0] hi_lo_4 = {2'h0,io_status_uxl,io_status_sd_rv32,8'h0,2'h0,1'h0,io_status_mxr}; // @[CSR.scala 600:57]
  wire [102:0] _T_42 = {35'h0,4'h0,io_status_sd,27'h0,hi_lo_4,lo_7}; // @[CSR.scala 600:57]
  wire [23:0] hi_10 = reg_stval[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_46 = {hi_10,reg_stval}; // @[Cat.scala 30:58]
  wire [63:0] _T_47 = {reg_satp_mode,16'h0,reg_satp_ppn}; // @[CSR.scala 606:43]
  wire [39:0] _T_48 = ~reg_sepc; // @[CSR.scala 1210:28]
  wire [39:0] _T_51 = _T_48 | 40'h1; // @[CSR.scala 1210:31]
  wire [39:0] lo_8 = ~_T_51; // @[CSR.scala 1210:26]
  wire [23:0] hi_12 = lo_8[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [63:0] _T_54 = {hi_12,lo_8}; // @[Cat.scala 30:58]
  wire [7:0] lo_lo_lo_3 = {reg_pmp_0_cfg_l,2'h0,reg_pmp_0_cfg_a,reg_pmp_0_cfg_x,reg_pmp_0_cfg_w,reg_pmp_0_cfg_r}; // @[package.scala 36:38]
  wire [7:0] lo_hi_lo_5 = {reg_pmp_2_cfg_l,2'h0,reg_pmp_2_cfg_a,reg_pmp_2_cfg_x,reg_pmp_2_cfg_w,reg_pmp_2_cfg_r}; // @[package.scala 36:38]
  wire [7:0] hi_lo_lo_4 = {reg_pmp_4_cfg_l,2'h0,reg_pmp_4_cfg_a,reg_pmp_4_cfg_x,reg_pmp_4_cfg_w,reg_pmp_4_cfg_r}; // @[package.scala 36:38]
  wire [7:0] hi_hi_lo_5 = {reg_pmp_6_cfg_l,2'h0,reg_pmp_6_cfg_a,reg_pmp_6_cfg_x,reg_pmp_6_cfg_w,reg_pmp_6_cfg_r}; // @[package.scala 36:38]
  wire [15:0] lo_lo_5 = {reg_pmp_1_cfg_l,2'h0,reg_pmp_1_cfg_a,reg_pmp_1_cfg_x,reg_pmp_1_cfg_w,reg_pmp_1_cfg_r,lo_lo_lo_3
    }; // @[Cat.scala 30:58]
  wire [31:0] lo_17 = {reg_pmp_3_cfg_l,2'h0,reg_pmp_3_cfg_a,reg_pmp_3_cfg_x,reg_pmp_3_cfg_w,reg_pmp_3_cfg_r,lo_hi_lo_5,
    lo_lo_5}; // @[Cat.scala 30:58]
  wire [15:0] hi_lo_5 = {reg_pmp_5_cfg_l,2'h0,reg_pmp_5_cfg_a,reg_pmp_5_cfg_x,reg_pmp_5_cfg_w,reg_pmp_5_cfg_r,hi_lo_lo_4
    }; // @[Cat.scala 30:58]
  wire [63:0] _T_55 = {reg_pmp_7_cfg_l,2'h0,reg_pmp_7_cfg_a,reg_pmp_7_cfg_x,reg_pmp_7_cfg_w,reg_pmp_7_cfg_r,hi_hi_lo_5,
    hi_lo_5,lo_17}; // @[Cat.scala 30:58]
  reg [63:0] reg_custom_0; // @[CSR.scala 629:43]
  wire  _T_61 = io_rw_addr == 12'h301; // @[CSR.scala 637:73]
  wire  _T_62 = io_rw_addr == 12'h300; // @[CSR.scala 637:73]
  wire  _T_63 = io_rw_addr == 12'h305; // @[CSR.scala 637:73]
  wire  _T_64 = io_rw_addr == 12'h344; // @[CSR.scala 637:73]
  wire  _T_65 = io_rw_addr == 12'h304; // @[CSR.scala 637:73]
  wire  _T_66 = io_rw_addr == 12'h340; // @[CSR.scala 637:73]
  wire  _T_67 = io_rw_addr == 12'h341; // @[CSR.scala 637:73]
  wire  _T_68 = io_rw_addr == 12'h343; // @[CSR.scala 637:73]
  wire  _T_69 = io_rw_addr == 12'h342; // @[CSR.scala 637:73]
  wire  _T_70 = io_rw_addr == 12'hf14; // @[CSR.scala 637:73]
  wire  _T_71 = io_rw_addr == 12'h7b0; // @[CSR.scala 637:73]
  wire  _T_72 = io_rw_addr == 12'h7b1; // @[CSR.scala 637:73]
  wire  _T_73 = io_rw_addr == 12'h7b2; // @[CSR.scala 637:73]
  wire  _T_74 = io_rw_addr == 12'h1; // @[CSR.scala 637:73]
  wire  _T_75 = io_rw_addr == 12'h2; // @[CSR.scala 637:73]
  wire  _T_76 = io_rw_addr == 12'h3; // @[CSR.scala 637:73]
  wire  _T_77 = io_rw_addr == 12'h320; // @[CSR.scala 637:73]
  wire  _T_78 = io_rw_addr == 12'hb00; // @[CSR.scala 637:73]
  wire  _T_79 = io_rw_addr == 12'hb02; // @[CSR.scala 637:73]
  wire  _T_80 = io_rw_addr == 12'h323; // @[CSR.scala 637:73]
  wire  _T_81 = io_rw_addr == 12'hb03; // @[CSR.scala 637:73]
  wire  _T_82 = io_rw_addr == 12'hc03; // @[CSR.scala 637:73]
  wire  _T_83 = io_rw_addr == 12'h324; // @[CSR.scala 637:73]
  wire  _T_84 = io_rw_addr == 12'hb04; // @[CSR.scala 637:73]
  wire  _T_85 = io_rw_addr == 12'hc04; // @[CSR.scala 637:73]
  wire  _T_86 = io_rw_addr == 12'h325; // @[CSR.scala 637:73]
  wire  _T_87 = io_rw_addr == 12'hb05; // @[CSR.scala 637:73]
  wire  _T_88 = io_rw_addr == 12'hc05; // @[CSR.scala 637:73]
  wire  _T_89 = io_rw_addr == 12'h326; // @[CSR.scala 637:73]
  wire  _T_90 = io_rw_addr == 12'hb06; // @[CSR.scala 637:73]
  wire  _T_91 = io_rw_addr == 12'hc06; // @[CSR.scala 637:73]
  wire  _T_92 = io_rw_addr == 12'h327; // @[CSR.scala 637:73]
  wire  _T_93 = io_rw_addr == 12'hb07; // @[CSR.scala 637:73]
  wire  _T_94 = io_rw_addr == 12'hc07; // @[CSR.scala 637:73]
  wire  _T_95 = io_rw_addr == 12'h328; // @[CSR.scala 637:73]
  wire  _T_96 = io_rw_addr == 12'hb08; // @[CSR.scala 637:73]
  wire  _T_97 = io_rw_addr == 12'hc08; // @[CSR.scala 637:73]
  wire  _T_167 = io_rw_addr == 12'h306; // @[CSR.scala 637:73]
  wire  _T_168 = io_rw_addr == 12'hc00; // @[CSR.scala 637:73]
  wire  _T_169 = io_rw_addr == 12'hc02; // @[CSR.scala 637:73]
  wire  _T_170 = io_rw_addr == 12'h100; // @[CSR.scala 637:73]
  wire  _T_171 = io_rw_addr == 12'h144; // @[CSR.scala 637:73]
  wire  _T_172 = io_rw_addr == 12'h104; // @[CSR.scala 637:73]
  wire  _T_173 = io_rw_addr == 12'h140; // @[CSR.scala 637:73]
  wire  _T_174 = io_rw_addr == 12'h142; // @[CSR.scala 637:73]
  wire  _T_175 = io_rw_addr == 12'h143; // @[CSR.scala 637:73]
  wire  _T_176 = io_rw_addr == 12'h180; // @[CSR.scala 637:73]
  wire  _T_177 = io_rw_addr == 12'h141; // @[CSR.scala 637:73]
  wire  _T_178 = io_rw_addr == 12'h105; // @[CSR.scala 637:73]
  wire  _T_179 = io_rw_addr == 12'h106; // @[CSR.scala 637:73]
  wire  _T_180 = io_rw_addr == 12'h303; // @[CSR.scala 637:73]
  wire  _T_181 = io_rw_addr == 12'h302; // @[CSR.scala 637:73]
  wire  _T_182 = io_rw_addr == 12'h3a0; // @[CSR.scala 637:73]
  wire  _T_184 = io_rw_addr == 12'h3b0; // @[CSR.scala 637:73]
  wire  _T_185 = io_rw_addr == 12'h3b1; // @[CSR.scala 637:73]
  wire  _T_186 = io_rw_addr == 12'h3b2; // @[CSR.scala 637:73]
  wire  _T_187 = io_rw_addr == 12'h3b3; // @[CSR.scala 637:73]
  wire  _T_188 = io_rw_addr == 12'h3b4; // @[CSR.scala 637:73]
  wire  _T_189 = io_rw_addr == 12'h3b5; // @[CSR.scala 637:73]
  wire  _T_190 = io_rw_addr == 12'h3b6; // @[CSR.scala 637:73]
  wire  _T_191 = io_rw_addr == 12'h3b7; // @[CSR.scala 637:73]
  wire  _T_200 = io_rw_addr == 12'h7c1; // @[CSR.scala 637:73]
  wire [63:0] _wdata_T_1 = io_rw_cmd[1] ? io_rw_rdata : 64'h0; // @[CSR.scala 1188:9]
  wire [63:0] _wdata_T_2 = _wdata_T_1 | io_rw_wdata; // @[CSR.scala 1188:34]
  wire [63:0] _wdata_T_5 = &io_rw_cmd[1:0] ? io_rw_wdata : 64'h0; // @[CSR.scala 1188:49]
  wire [63:0] _wdata_T_6 = ~_wdata_T_5; // @[CSR.scala 1188:45]
  wire [63:0] wdata = _wdata_T_2 & _wdata_T_6; // @[CSR.scala 1188:43]
  wire [31:0] _T_217 = _T_204 & 32'h20200000; // @[Decode.scala 14:65]
  wire  _T_218 = _T_217 == 32'h20000000; // @[Decode.scala 14:121]
  wire [31:0] _T_220 = _T_204 & 32'h32200000; // @[Decode.scala 14:65]
  wire  _T_221 = _T_220 == 32'h10000000; // @[Decode.scala 14:121]
  wire  insn_cease = system_insn & _T_218; // @[CSR.scala 653:95]
  wire  insn_wfi = system_insn & _T_221; // @[CSR.scala 653:95]
  wire [31:0] _T_232 = {io_decode_0_csr, 20'h0}; // @[CSR.scala 660:30]
  wire [31:0] _T_239 = _T_232 & 32'h12400000; // @[Decode.scala 14:65]
  wire  _T_240 = _T_239 == 32'h10000000; // @[Decode.scala 14:121]
  wire [31:0] _T_241 = _T_232 & 32'h40000000; // @[Decode.scala 14:65]
  wire  _T_242 = _T_241 == 32'h40000000; // @[Decode.scala 14:121]
  wire  is_ret = _T_240 | _T_242; // @[Decode.scala 15:30]
  wire [31:0] _T_248 = _T_232 & 32'h32200000; // @[Decode.scala 14:65]
  wire  is_wfi = _T_248 == 32'h10000000; // @[Decode.scala 14:121]
  wire [31:0] _T_251 = _T_232 & 32'h42000000; // @[Decode.scala 14:65]
  wire  is_sfence = _T_251 == 32'h2000000; // @[Decode.scala 14:121]
  wire  _allow_wfi_T = reg_mstatus_prv > 2'h1; // @[CSR.scala 662:63]
  wire  allow_wfi = reg_mstatus_prv > 2'h1 | ~reg_mstatus_tw; // @[CSR.scala 662:71]
  wire  allow_sfence_vma = _allow_wfi_T | ~reg_mstatus_tvm; // @[CSR.scala 663:70]
  wire  allow_sret = _allow_wfi_T | ~reg_mstatus_tsr; // @[CSR.scala 664:72]
  wire [4:0] counter_addr = io_decode_0_csr[4:0]; // @[CSR.scala 665:34]
  wire [31:0] _allow_counter_T_1 = read_mcounteren >> counter_addr; // @[CSR.scala 666:68]
  wire [31:0] _allow_counter_T_6 = read_scounteren >> counter_addr; // @[CSR.scala 667:71]
  wire  _allow_counter_T_8 = reg_mstatus_prv >= 2'h1 | _allow_counter_T_6[0]; // @[CSR.scala 667:53]
  wire  allow_counter = (_allow_wfi_T | _allow_counter_T_1[0]) & _allow_counter_T_8; // @[CSR.scala 666:84]
  wire [11:0] _io_decode_0_fp_csr_T = io_decode_0_csr & 12'h900; // @[Decode.scala 14:65]
  wire  _io_decode_0_read_illegal_T_1 = reg_mstatus_prv < io_decode_0_csr[9:8]; // @[CSR.scala 672:44]
  wire  _io_decode_0_read_illegal_T_17 = io_decode_0_csr == 12'h7b1; // @[CSR.scala 656:99]
  wire  _io_decode_0_read_illegal_T_121 = io_decode_0_csr == 12'h180; // @[CSR.scala 656:99]
  wire  _io_decode_0_read_illegal_T_163 = io_decode_0_csr == 12'h7a0 | io_decode_0_csr == 12'h7a1 | io_decode_0_csr == 12'h7a2
     | io_decode_0_csr == 12'h7a3 | io_decode_0_csr == 12'h301 | io_decode_0_csr == 12'h300 | io_decode_0_csr == 12'h305
     | io_decode_0_csr == 12'h344 | io_decode_0_csr == 12'h304 | io_decode_0_csr == 12'h340 | io_decode_0_csr == 12'h341
     | io_decode_0_csr == 12'h343 | io_decode_0_csr == 12'h342 | io_decode_0_csr == 12'hf14 | io_decode_0_csr == 12'h7b0
     | _io_decode_0_read_illegal_T_17; // @[CSR.scala 656:115]
  wire  _io_decode_0_read_illegal_T_178 = _io_decode_0_read_illegal_T_163 | io_decode_0_csr == 12'h7b2 | io_decode_0_csr
     == 12'h1 | io_decode_0_csr == 12'h2 | io_decode_0_csr == 12'h3 | io_decode_0_csr == 12'h320 | io_decode_0_csr == 12'hb00
     | io_decode_0_csr == 12'hb02 | io_decode_0_csr == 12'h323 | io_decode_0_csr == 12'hb03 | io_decode_0_csr == 12'hc03
     | io_decode_0_csr == 12'h324 | io_decode_0_csr == 12'hb04 | io_decode_0_csr == 12'hc04 | io_decode_0_csr == 12'h325
     | io_decode_0_csr == 12'hb05; // @[CSR.scala 656:115]
  wire  _io_decode_0_read_illegal_T_193 = _io_decode_0_read_illegal_T_178 | io_decode_0_csr == 12'hc05 | io_decode_0_csr
     == 12'h326 | io_decode_0_csr == 12'hb06 | io_decode_0_csr == 12'hc06 | io_decode_0_csr == 12'h327 | io_decode_0_csr
     == 12'hb07 | io_decode_0_csr == 12'hc07 | io_decode_0_csr == 12'h328 | io_decode_0_csr == 12'hb08 | io_decode_0_csr
     == 12'hc08 | io_decode_0_csr == 12'h329 | io_decode_0_csr == 12'hb09 | io_decode_0_csr == 12'hc09 | io_decode_0_csr
     == 12'h32a | io_decode_0_csr == 12'hb0a; // @[CSR.scala 656:115]
  wire  _io_decode_0_read_illegal_T_208 = _io_decode_0_read_illegal_T_193 | io_decode_0_csr == 12'hc0a | io_decode_0_csr
     == 12'h32b | io_decode_0_csr == 12'hb0b | io_decode_0_csr == 12'hc0b | io_decode_0_csr == 12'h32c | io_decode_0_csr
     == 12'hb0c | io_decode_0_csr == 12'hc0c | io_decode_0_csr == 12'h32d | io_decode_0_csr == 12'hb0d | io_decode_0_csr
     == 12'hc0d | io_decode_0_csr == 12'h32e | io_decode_0_csr == 12'hb0e | io_decode_0_csr == 12'hc0e | io_decode_0_csr
     == 12'h32f | io_decode_0_csr == 12'hb0f; // @[CSR.scala 656:115]
  wire  _io_decode_0_read_illegal_T_223 = _io_decode_0_read_illegal_T_208 | io_decode_0_csr == 12'hc0f | io_decode_0_csr
     == 12'h330 | io_decode_0_csr == 12'hb10 | io_decode_0_csr == 12'hc10 | io_decode_0_csr == 12'h331 | io_decode_0_csr
     == 12'hb11 | io_decode_0_csr == 12'hc11 | io_decode_0_csr == 12'h332 | io_decode_0_csr == 12'hb12 | io_decode_0_csr
     == 12'hc12 | io_decode_0_csr == 12'h333 | io_decode_0_csr == 12'hb13 | io_decode_0_csr == 12'hc13 | io_decode_0_csr
     == 12'h334 | io_decode_0_csr == 12'hb14; // @[CSR.scala 656:115]
  wire  _io_decode_0_read_illegal_T_238 = _io_decode_0_read_illegal_T_223 | io_decode_0_csr == 12'hc14 | io_decode_0_csr
     == 12'h335 | io_decode_0_csr == 12'hb15 | io_decode_0_csr == 12'hc15 | io_decode_0_csr == 12'h336 | io_decode_0_csr
     == 12'hb16 | io_decode_0_csr == 12'hc16 | io_decode_0_csr == 12'h337 | io_decode_0_csr == 12'hb17 | io_decode_0_csr
     == 12'hc17 | io_decode_0_csr == 12'h338 | io_decode_0_csr == 12'hb18 | io_decode_0_csr == 12'hc18 | io_decode_0_csr
     == 12'h339 | io_decode_0_csr == 12'hb19; // @[CSR.scala 656:115]
  wire  _io_decode_0_read_illegal_T_253 = _io_decode_0_read_illegal_T_238 | io_decode_0_csr == 12'hc19 | io_decode_0_csr
     == 12'h33a | io_decode_0_csr == 12'hb1a | io_decode_0_csr == 12'hc1a | io_decode_0_csr == 12'h33b | io_decode_0_csr
     == 12'hb1b | io_decode_0_csr == 12'hc1b | io_decode_0_csr == 12'h33c | io_decode_0_csr == 12'hb1c | io_decode_0_csr
     == 12'hc1c | io_decode_0_csr == 12'h33d | io_decode_0_csr == 12'hb1d | io_decode_0_csr == 12'hc1d | io_decode_0_csr
     == 12'h33e | io_decode_0_csr == 12'hb1e; // @[CSR.scala 656:115]
  wire  _io_decode_0_read_illegal_T_268 = _io_decode_0_read_illegal_T_253 | io_decode_0_csr == 12'hc1e | io_decode_0_csr
     == 12'h33f | io_decode_0_csr == 12'hb1f | io_decode_0_csr == 12'hc1f | io_decode_0_csr == 12'h306 | io_decode_0_csr
     == 12'hc00 | io_decode_0_csr == 12'hc02 | io_decode_0_csr == 12'h100 | io_decode_0_csr == 12'h144 | io_decode_0_csr
     == 12'h104 | io_decode_0_csr == 12'h140 | io_decode_0_csr == 12'h142 | io_decode_0_csr == 12'h143 | io_decode_0_csr
     == 12'h180 | io_decode_0_csr == 12'h141; // @[CSR.scala 656:115]
  wire  _io_decode_0_read_illegal_T_283 = _io_decode_0_read_illegal_T_268 | io_decode_0_csr == 12'h105 | io_decode_0_csr
     == 12'h106 | io_decode_0_csr == 12'h303 | io_decode_0_csr == 12'h302 | io_decode_0_csr == 12'h3a0 | io_decode_0_csr
     == 12'h3a2 | io_decode_0_csr == 12'h3b0 | io_decode_0_csr == 12'h3b1 | io_decode_0_csr == 12'h3b2 | io_decode_0_csr
     == 12'h3b3 | io_decode_0_csr == 12'h3b4 | io_decode_0_csr == 12'h3b5 | io_decode_0_csr == 12'h3b6 | io_decode_0_csr
     == 12'h3b7 | io_decode_0_csr == 12'h3b8; // @[CSR.scala 656:115]
  wire  _io_decode_0_read_illegal_T_294 = _io_decode_0_read_illegal_T_283 | io_decode_0_csr == 12'h3b9 | io_decode_0_csr
     == 12'h3ba | io_decode_0_csr == 12'h3bb | io_decode_0_csr == 12'h3bc | io_decode_0_csr == 12'h3bd | io_decode_0_csr
     == 12'h3be | io_decode_0_csr == 12'h3bf | io_decode_0_csr == 12'h7c1 | io_decode_0_csr == 12'hf13 | io_decode_0_csr
     == 12'hf12 | io_decode_0_csr == 12'hf11; // @[CSR.scala 656:115]
  wire  _io_decode_0_read_illegal_T_295 = ~_io_decode_0_read_illegal_T_294; // @[CSR.scala 673:7]
  wire  _io_decode_0_read_illegal_T_296 = reg_mstatus_prv < io_decode_0_csr[9:8] | _io_decode_0_read_illegal_T_295; // @[CSR.scala 672:62]
  wire  _io_decode_0_read_illegal_T_298 = ~allow_sfence_vma; // @[CSR.scala 674:35]
  wire  _io_decode_0_read_illegal_T_299 = _io_decode_0_read_illegal_T_121 & ~allow_sfence_vma; // @[CSR.scala 674:32]
  wire  _io_decode_0_read_illegal_T_300 = _io_decode_0_read_illegal_T_296 | _io_decode_0_read_illegal_T_299; // @[CSR.scala 673:32]
  wire  _io_decode_0_read_illegal_T_303 = io_decode_0_csr >= 12'hc00 & io_decode_0_csr < 12'hc20; // @[package.scala 204:55]
  wire  _io_decode_0_read_illegal_T_306 = io_decode_0_csr >= 12'hc80 & io_decode_0_csr < 12'hca0; // @[package.scala 204:55]
  wire  _io_decode_0_read_illegal_T_309 = (_io_decode_0_read_illegal_T_303 | _io_decode_0_read_illegal_T_306) & ~
    allow_counter; // @[CSR.scala 675:130]
  wire  _io_decode_0_read_illegal_T_310 = _io_decode_0_read_illegal_T_300 | _io_decode_0_read_illegal_T_309; // @[CSR.scala 674:53]
  wire [11:0] _io_decode_0_read_illegal_T_311 = io_decode_0_csr & 12'hc10; // @[Decode.scala 14:65]
  wire  _io_decode_0_read_illegal_T_312 = _io_decode_0_read_illegal_T_311 == 12'h410; // @[Decode.scala 14:121]
  wire  _io_decode_0_read_illegal_T_316 = _io_decode_0_read_illegal_T_312 & _T_312; // @[CSR.scala 676:42]
  wire  _io_decode_0_read_illegal_T_317 = _io_decode_0_read_illegal_T_310 | _io_decode_0_read_illegal_T_316; // @[CSR.scala 675:148]
  wire  _io_decode_0_read_illegal_T_320 = io_decode_0_fp_csr & io_decode_0_fp_illegal; // @[CSR.scala 678:21]
  wire  _io_decode_0_system_illegal_T_3 = is_wfi & ~allow_wfi; // @[CSR.scala 682:14]
  wire  _io_decode_0_system_illegal_T_4 = _io_decode_0_read_illegal_T_1 | _io_decode_0_system_illegal_T_3; // @[CSR.scala 681:64]
  wire  _io_decode_0_system_illegal_T_6 = is_ret & ~allow_sret; // @[CSR.scala 683:14]
  wire  _io_decode_0_system_illegal_T_7 = _io_decode_0_system_illegal_T_4 | _io_decode_0_system_illegal_T_6; // @[CSR.scala 682:28]
  wire  _io_decode_0_system_illegal_T_13 = is_ret & io_decode_0_csr[10] & io_decode_0_csr[7] & _T_312; // @[CSR.scala 684:49]
  wire  _io_decode_0_system_illegal_T_14 = _io_decode_0_system_illegal_T_7 | _io_decode_0_system_illegal_T_13; // @[CSR.scala 683:29]
  wire  _io_decode_0_system_illegal_T_16 = is_sfence & _io_decode_0_read_illegal_T_298; // @[CSR.scala 685:17]
  wire [31:0] _T_256 = {io_decode_1_csr, 20'h0}; // @[CSR.scala 660:30]
  wire [31:0] _T_263 = _T_256 & 32'h12400000; // @[Decode.scala 14:65]
  wire  _T_264 = _T_263 == 32'h10000000; // @[Decode.scala 14:121]
  wire [31:0] _T_265 = _T_256 & 32'h40000000; // @[Decode.scala 14:65]
  wire  _T_266 = _T_265 == 32'h40000000; // @[Decode.scala 14:121]
  wire  is_ret_1 = _T_264 | _T_266; // @[Decode.scala 15:30]
  wire [31:0] _T_272 = _T_256 & 32'h32200000; // @[Decode.scala 14:65]
  wire  is_wfi_1 = _T_272 == 32'h10000000; // @[Decode.scala 14:121]
  wire [31:0] _T_275 = _T_256 & 32'h42000000; // @[Decode.scala 14:65]
  wire  is_sfence_1 = _T_275 == 32'h2000000; // @[Decode.scala 14:121]
  wire [4:0] counter_addr_1 = io_decode_1_csr[4:0]; // @[CSR.scala 665:34]
  wire [31:0] _allow_counter_T_10 = read_mcounteren >> counter_addr_1; // @[CSR.scala 666:68]
  wire [31:0] _allow_counter_T_15 = read_scounteren >> counter_addr_1; // @[CSR.scala 667:71]
  wire  _allow_counter_T_17 = reg_mstatus_prv >= 2'h1 | _allow_counter_T_15[0]; // @[CSR.scala 667:53]
  wire  allow_counter_1 = (_allow_wfi_T | _allow_counter_T_10[0]) & _allow_counter_T_17; // @[CSR.scala 666:84]
  wire [11:0] _io_decode_1_fp_csr_T = io_decode_1_csr & 12'h900; // @[Decode.scala 14:65]
  wire  _io_decode_1_read_illegal_T_1 = reg_mstatus_prv < io_decode_1_csr[9:8]; // @[CSR.scala 672:44]
  wire  _io_decode_1_read_illegal_T_17 = io_decode_1_csr == 12'h7b1; // @[CSR.scala 656:99]
  wire  _io_decode_1_read_illegal_T_121 = io_decode_1_csr == 12'h180; // @[CSR.scala 656:99]
  wire  _io_decode_1_read_illegal_T_163 = io_decode_1_csr == 12'h7a0 | io_decode_1_csr == 12'h7a1 | io_decode_1_csr == 12'h7a2
     | io_decode_1_csr == 12'h7a3 | io_decode_1_csr == 12'h301 | io_decode_1_csr == 12'h300 | io_decode_1_csr == 12'h305
     | io_decode_1_csr == 12'h344 | io_decode_1_csr == 12'h304 | io_decode_1_csr == 12'h340 | io_decode_1_csr == 12'h341
     | io_decode_1_csr == 12'h343 | io_decode_1_csr == 12'h342 | io_decode_1_csr == 12'hf14 | io_decode_1_csr == 12'h7b0
     | _io_decode_1_read_illegal_T_17; // @[CSR.scala 656:115]
  wire  _io_decode_1_read_illegal_T_178 = _io_decode_1_read_illegal_T_163 | io_decode_1_csr == 12'h7b2 | io_decode_1_csr
     == 12'h1 | io_decode_1_csr == 12'h2 | io_decode_1_csr == 12'h3 | io_decode_1_csr == 12'h320 | io_decode_1_csr == 12'hb00
     | io_decode_1_csr == 12'hb02 | io_decode_1_csr == 12'h323 | io_decode_1_csr == 12'hb03 | io_decode_1_csr == 12'hc03
     | io_decode_1_csr == 12'h324 | io_decode_1_csr == 12'hb04 | io_decode_1_csr == 12'hc04 | io_decode_1_csr == 12'h325
     | io_decode_1_csr == 12'hb05; // @[CSR.scala 656:115]
  wire  _io_decode_1_read_illegal_T_193 = _io_decode_1_read_illegal_T_178 | io_decode_1_csr == 12'hc05 | io_decode_1_csr
     == 12'h326 | io_decode_1_csr == 12'hb06 | io_decode_1_csr == 12'hc06 | io_decode_1_csr == 12'h327 | io_decode_1_csr
     == 12'hb07 | io_decode_1_csr == 12'hc07 | io_decode_1_csr == 12'h328 | io_decode_1_csr == 12'hb08 | io_decode_1_csr
     == 12'hc08 | io_decode_1_csr == 12'h329 | io_decode_1_csr == 12'hb09 | io_decode_1_csr == 12'hc09 | io_decode_1_csr
     == 12'h32a | io_decode_1_csr == 12'hb0a; // @[CSR.scala 656:115]
  wire  _io_decode_1_read_illegal_T_208 = _io_decode_1_read_illegal_T_193 | io_decode_1_csr == 12'hc0a | io_decode_1_csr
     == 12'h32b | io_decode_1_csr == 12'hb0b | io_decode_1_csr == 12'hc0b | io_decode_1_csr == 12'h32c | io_decode_1_csr
     == 12'hb0c | io_decode_1_csr == 12'hc0c | io_decode_1_csr == 12'h32d | io_decode_1_csr == 12'hb0d | io_decode_1_csr
     == 12'hc0d | io_decode_1_csr == 12'h32e | io_decode_1_csr == 12'hb0e | io_decode_1_csr == 12'hc0e | io_decode_1_csr
     == 12'h32f | io_decode_1_csr == 12'hb0f; // @[CSR.scala 656:115]
  wire  _io_decode_1_read_illegal_T_223 = _io_decode_1_read_illegal_T_208 | io_decode_1_csr == 12'hc0f | io_decode_1_csr
     == 12'h330 | io_decode_1_csr == 12'hb10 | io_decode_1_csr == 12'hc10 | io_decode_1_csr == 12'h331 | io_decode_1_csr
     == 12'hb11 | io_decode_1_csr == 12'hc11 | io_decode_1_csr == 12'h332 | io_decode_1_csr == 12'hb12 | io_decode_1_csr
     == 12'hc12 | io_decode_1_csr == 12'h333 | io_decode_1_csr == 12'hb13 | io_decode_1_csr == 12'hc13 | io_decode_1_csr
     == 12'h334 | io_decode_1_csr == 12'hb14; // @[CSR.scala 656:115]
  wire  _io_decode_1_read_illegal_T_238 = _io_decode_1_read_illegal_T_223 | io_decode_1_csr == 12'hc14 | io_decode_1_csr
     == 12'h335 | io_decode_1_csr == 12'hb15 | io_decode_1_csr == 12'hc15 | io_decode_1_csr == 12'h336 | io_decode_1_csr
     == 12'hb16 | io_decode_1_csr == 12'hc16 | io_decode_1_csr == 12'h337 | io_decode_1_csr == 12'hb17 | io_decode_1_csr
     == 12'hc17 | io_decode_1_csr == 12'h338 | io_decode_1_csr == 12'hb18 | io_decode_1_csr == 12'hc18 | io_decode_1_csr
     == 12'h339 | io_decode_1_csr == 12'hb19; // @[CSR.scala 656:115]
  wire  _io_decode_1_read_illegal_T_253 = _io_decode_1_read_illegal_T_238 | io_decode_1_csr == 12'hc19 | io_decode_1_csr
     == 12'h33a | io_decode_1_csr == 12'hb1a | io_decode_1_csr == 12'hc1a | io_decode_1_csr == 12'h33b | io_decode_1_csr
     == 12'hb1b | io_decode_1_csr == 12'hc1b | io_decode_1_csr == 12'h33c | io_decode_1_csr == 12'hb1c | io_decode_1_csr
     == 12'hc1c | io_decode_1_csr == 12'h33d | io_decode_1_csr == 12'hb1d | io_decode_1_csr == 12'hc1d | io_decode_1_csr
     == 12'h33e | io_decode_1_csr == 12'hb1e; // @[CSR.scala 656:115]
  wire  _io_decode_1_read_illegal_T_268 = _io_decode_1_read_illegal_T_253 | io_decode_1_csr == 12'hc1e | io_decode_1_csr
     == 12'h33f | io_decode_1_csr == 12'hb1f | io_decode_1_csr == 12'hc1f | io_decode_1_csr == 12'h306 | io_decode_1_csr
     == 12'hc00 | io_decode_1_csr == 12'hc02 | io_decode_1_csr == 12'h100 | io_decode_1_csr == 12'h144 | io_decode_1_csr
     == 12'h104 | io_decode_1_csr == 12'h140 | io_decode_1_csr == 12'h142 | io_decode_1_csr == 12'h143 | io_decode_1_csr
     == 12'h180 | io_decode_1_csr == 12'h141; // @[CSR.scala 656:115]
  wire  _io_decode_1_read_illegal_T_283 = _io_decode_1_read_illegal_T_268 | io_decode_1_csr == 12'h105 | io_decode_1_csr
     == 12'h106 | io_decode_1_csr == 12'h303 | io_decode_1_csr == 12'h302 | io_decode_1_csr == 12'h3a0 | io_decode_1_csr
     == 12'h3a2 | io_decode_1_csr == 12'h3b0 | io_decode_1_csr == 12'h3b1 | io_decode_1_csr == 12'h3b2 | io_decode_1_csr
     == 12'h3b3 | io_decode_1_csr == 12'h3b4 | io_decode_1_csr == 12'h3b5 | io_decode_1_csr == 12'h3b6 | io_decode_1_csr
     == 12'h3b7 | io_decode_1_csr == 12'h3b8; // @[CSR.scala 656:115]
  wire  _io_decode_1_read_illegal_T_294 = _io_decode_1_read_illegal_T_283 | io_decode_1_csr == 12'h3b9 | io_decode_1_csr
     == 12'h3ba | io_decode_1_csr == 12'h3bb | io_decode_1_csr == 12'h3bc | io_decode_1_csr == 12'h3bd | io_decode_1_csr
     == 12'h3be | io_decode_1_csr == 12'h3bf | io_decode_1_csr == 12'h7c1 | io_decode_1_csr == 12'hf13 | io_decode_1_csr
     == 12'hf12 | io_decode_1_csr == 12'hf11; // @[CSR.scala 656:115]
  wire  _io_decode_1_read_illegal_T_295 = ~_io_decode_1_read_illegal_T_294; // @[CSR.scala 673:7]
  wire  _io_decode_1_read_illegal_T_296 = reg_mstatus_prv < io_decode_1_csr[9:8] | _io_decode_1_read_illegal_T_295; // @[CSR.scala 672:62]
  wire  _io_decode_1_read_illegal_T_299 = _io_decode_1_read_illegal_T_121 & ~allow_sfence_vma; // @[CSR.scala 674:32]
  wire  _io_decode_1_read_illegal_T_300 = _io_decode_1_read_illegal_T_296 | _io_decode_1_read_illegal_T_299; // @[CSR.scala 673:32]
  wire  _io_decode_1_read_illegal_T_303 = io_decode_1_csr >= 12'hc00 & io_decode_1_csr < 12'hc20; // @[package.scala 204:55]
  wire  _io_decode_1_read_illegal_T_306 = io_decode_1_csr >= 12'hc80 & io_decode_1_csr < 12'hca0; // @[package.scala 204:55]
  wire  _io_decode_1_read_illegal_T_309 = (_io_decode_1_read_illegal_T_303 | _io_decode_1_read_illegal_T_306) & ~
    allow_counter_1; // @[CSR.scala 675:130]
  wire  _io_decode_1_read_illegal_T_310 = _io_decode_1_read_illegal_T_300 | _io_decode_1_read_illegal_T_309; // @[CSR.scala 674:53]
  wire [11:0] _io_decode_1_read_illegal_T_311 = io_decode_1_csr & 12'hc10; // @[Decode.scala 14:65]
  wire  _io_decode_1_read_illegal_T_312 = _io_decode_1_read_illegal_T_311 == 12'h410; // @[Decode.scala 14:121]
  wire  _io_decode_1_read_illegal_T_316 = _io_decode_1_read_illegal_T_312 & _T_312; // @[CSR.scala 676:42]
  wire  _io_decode_1_read_illegal_T_317 = _io_decode_1_read_illegal_T_310 | _io_decode_1_read_illegal_T_316; // @[CSR.scala 675:148]
  wire  _io_decode_1_read_illegal_T_320 = io_decode_1_fp_csr & io_decode_1_fp_illegal; // @[CSR.scala 678:21]
  wire  _io_decode_1_system_illegal_T_3 = is_wfi_1 & ~allow_wfi; // @[CSR.scala 682:14]
  wire  _io_decode_1_system_illegal_T_4 = _io_decode_1_read_illegal_T_1 | _io_decode_1_system_illegal_T_3; // @[CSR.scala 681:64]
  wire  _io_decode_1_system_illegal_T_6 = is_ret_1 & ~allow_sret; // @[CSR.scala 683:14]
  wire  _io_decode_1_system_illegal_T_7 = _io_decode_1_system_illegal_T_4 | _io_decode_1_system_illegal_T_6; // @[CSR.scala 682:28]
  wire  _io_decode_1_system_illegal_T_13 = is_ret_1 & io_decode_1_csr[10] & io_decode_1_csr[7] & _T_312; // @[CSR.scala 684:49]
  wire  _io_decode_1_system_illegal_T_14 = _io_decode_1_system_illegal_T_7 | _io_decode_1_system_illegal_T_13; // @[CSR.scala 683:29]
  wire  _io_decode_1_system_illegal_T_16 = is_sfence_1 & _io_decode_0_read_illegal_T_298; // @[CSR.scala 685:17]
  wire [11:0] _debugTVec_T = insn_break ? 12'h800 : 12'h808; // @[CSR.scala 698:37]
  wire [11:0] debugTVec = reg_debug ? _debugTVec_T : 12'h800; // @[CSR.scala 698:22]
  wire [63:0] notDebugTVec_base = delegate ? read_stvec : read_mtvec; // @[CSR.scala 706:19]
  wire [7:0] notDebugTVec_interruptVec_lo = {cause[5:0], 2'h0}; // @[CSR.scala 707:59]
  wire [55:0] notDebugTVec_interruptVec_hi = notDebugTVec_base[63:8]; // @[CSR.scala 708:33]
  wire [63:0] notDebugTVec_interruptVec = {notDebugTVec_interruptVec_hi,notDebugTVec_interruptVec_lo}; // @[Cat.scala 30:58]
  wire  notDebugTVec_doVector = notDebugTVec_base[0] & cause[63] & cause_lsbs[7:6] == 2'h0; // @[CSR.scala 709:55]
  wire [63:0] _notDebugTVec_T_1 = {notDebugTVec_base[63:2], 2'h0}; // @[CSR.scala 710:56]
  wire [63:0] notDebugTVec = notDebugTVec_doVector ? notDebugTVec_interruptVec : _notDebugTVec_T_1; // @[CSR.scala 710:8]
  wire [63:0] tvec = trapToDebug ? {{52'd0}, debugTVec} : notDebugTVec; // @[CSR.scala 724:17]
  reg [1:0] io_status_dprv_REG; // @[CSR.scala 735:24]
  wire [1:0] _T_280 = insn_ret + insn_call; // @[Bitwise.scala 47:55]
  wire [1:0] _T_282 = insn_break + io_exception; // @[Bitwise.scala 47:55]
  wire [2:0] _T_284 = _T_280 + _T_282; // @[Bitwise.scala 47:55]
  wire  _GEN_60 = insn_wfi & _io_interrupt_T & _T_312 | reg_wfi; // @[CSR.scala 742:51 CSR.scala 742:61 CSR.scala 428:50]
  wire  _GEN_62 = io_retire[0] | exception | reg_singleStepped; // @[CSR.scala 746:36 CSR.scala 746:56 CSR.scala 373:30]
  wire [39:0] _epc_T = ~io_pc; // @[CSR.scala 1209:28]
  wire [39:0] _epc_T_1 = _epc_T | 40'h1; // @[CSR.scala 1209:31]
  wire [39:0] epc = ~_epc_T_1; // @[CSR.scala 1209:26]
  wire [1:0] _reg_dcsr_cause_T = causeIsDebugTrigger ? 2'h2 : 2'h1; // @[CSR.scala 760:86]
  wire [1:0] _reg_dcsr_cause_T_1 = causeIsDebugInt ? 2'h3 : _reg_dcsr_cause_T; // @[CSR.scala 760:56]
  wire [2:0] _reg_dcsr_cause_T_2 = reg_singleStepped ? 3'h4 : {{1'd0}, _reg_dcsr_cause_T_1}; // @[CSR.scala 760:30]
  wire  _GEN_64 = ~reg_debug | reg_debug; // @[CSR.scala 757:25 CSR.scala 758:19 CSR.scala 369:22]
  wire [39:0] _GEN_65 = ~reg_debug ? epc : reg_dpc; // @[CSR.scala 757:25 CSR.scala 759:17 CSR.scala 370:20]
  wire [1:0] _GEN_67 = ~reg_debug ? reg_mstatus_prv : reg_dcsr_prv; // @[CSR.scala 757:25 CSR.scala 761:22 CSR.scala 328:21]
  wire [39:0] _GEN_75 = delegate ? epc : reg_sepc; // @[CSR.scala 773:35 CSR.scala 774:16 CSR.scala 422:21]
  wire [63:0] _GEN_76 = delegate ? cause : reg_scause; // @[CSR.scala 773:35 CSR.scala 775:18 CSR.scala 423:23]
  wire [39:0] _GEN_78 = delegate ? io_tval : reg_stval; // @[CSR.scala 773:35 CSR.scala 777:17 CSR.scala 424:22]
  wire  _GEN_79 = delegate ? reg_mstatus_sie : reg_mstatus_spie; // @[CSR.scala 773:35 CSR.scala 778:24 CSR.scala 320:24]
  wire [1:0] _GEN_80 = delegate ? reg_mstatus_prv : {{1'd0}, reg_mstatus_spp}; // @[CSR.scala 773:35 CSR.scala 779:23 CSR.scala 320:24]
  wire  _GEN_81 = delegate ? 1'h0 : reg_mstatus_sie; // @[CSR.scala 773:35 CSR.scala 780:23 CSR.scala 320:24]
  wire [39:0] _GEN_83 = delegate ? reg_mepc : epc; // @[CSR.scala 773:35 CSR.scala 392:21 CSR.scala 783:16]
  wire [63:0] _GEN_84 = delegate ? reg_mcause : cause; // @[CSR.scala 773:35 CSR.scala 393:27 CSR.scala 784:18]
  wire [39:0] _GEN_85 = delegate ? reg_mtval : io_tval; // @[CSR.scala 773:35 CSR.scala 394:22 CSR.scala 786:17]
  wire  _GEN_86 = delegate ? reg_mstatus_mpie : reg_mstatus_mie; // @[CSR.scala 773:35 CSR.scala 320:24 CSR.scala 787:24]
  wire [1:0] _GEN_87 = delegate ? reg_mstatus_mpp : reg_mstatus_prv; // @[CSR.scala 773:35 CSR.scala 320:24 CSR.scala 788:23]
  wire  _GEN_88 = delegate & reg_mstatus_mie; // @[CSR.scala 773:35 CSR.scala 320:24 CSR.scala 789:23]
  wire  _GEN_108 = trapToDebug ? _GEN_64 : reg_debug; // @[CSR.scala 756:24 CSR.scala 369:22]
  wire [39:0] _GEN_109 = trapToDebug ? _GEN_65 : reg_dpc; // @[CSR.scala 756:24 CSR.scala 370:20]
  wire [1:0] _GEN_111 = trapToDebug ? _GEN_67 : reg_dcsr_prv; // @[CSR.scala 756:24 CSR.scala 328:21]
  wire [39:0] _GEN_118 = trapToDebug ? reg_sepc : _GEN_75; // @[CSR.scala 756:24 CSR.scala 422:21]
  wire [63:0] _GEN_119 = trapToDebug ? reg_scause : _GEN_76; // @[CSR.scala 756:24 CSR.scala 423:23]
  wire [39:0] _GEN_121 = trapToDebug ? reg_stval : _GEN_78; // @[CSR.scala 756:24 CSR.scala 424:22]
  wire  _GEN_122 = trapToDebug ? reg_mstatus_spie : _GEN_79; // @[CSR.scala 756:24 CSR.scala 320:24]
  wire [1:0] _GEN_123 = trapToDebug ? {{1'd0}, reg_mstatus_spp} : _GEN_80; // @[CSR.scala 756:24 CSR.scala 320:24]
  wire  _GEN_124 = trapToDebug ? reg_mstatus_sie : _GEN_81; // @[CSR.scala 756:24 CSR.scala 320:24]
  wire [39:0] _GEN_125 = trapToDebug ? reg_mepc : _GEN_83; // @[CSR.scala 756:24 CSR.scala 392:21]
  wire [63:0] _GEN_126 = trapToDebug ? reg_mcause : _GEN_84; // @[CSR.scala 756:24 CSR.scala 393:27]
  wire [39:0] _GEN_127 = trapToDebug ? reg_mtval : _GEN_85; // @[CSR.scala 756:24 CSR.scala 394:22]
  wire  _GEN_128 = trapToDebug ? reg_mstatus_mpie : _GEN_86; // @[CSR.scala 756:24 CSR.scala 320:24]
  wire [1:0] _GEN_129 = trapToDebug ? reg_mstatus_mpp : _GEN_87; // @[CSR.scala 756:24 CSR.scala 320:24]
  wire  _GEN_130 = trapToDebug ? reg_mstatus_mie : _GEN_88; // @[CSR.scala 756:24 CSR.scala 320:24]
  wire  _GEN_131 = exception ? _GEN_108 : reg_debug; // @[CSR.scala 755:20 CSR.scala 369:22]
  wire [39:0] _GEN_132 = exception ? _GEN_109 : reg_dpc; // @[CSR.scala 755:20 CSR.scala 370:20]
  wire [1:0] _GEN_134 = exception ? _GEN_111 : reg_dcsr_prv; // @[CSR.scala 755:20 CSR.scala 328:21]
  wire [39:0] _GEN_141 = exception ? _GEN_118 : reg_sepc; // @[CSR.scala 755:20 CSR.scala 422:21]
  wire [63:0] _GEN_142 = exception ? _GEN_119 : reg_scause; // @[CSR.scala 755:20 CSR.scala 423:23]
  wire [39:0] _GEN_144 = exception ? _GEN_121 : reg_stval; // @[CSR.scala 755:20 CSR.scala 424:22]
  wire  _GEN_145 = exception ? _GEN_122 : reg_mstatus_spie; // @[CSR.scala 755:20 CSR.scala 320:24]
  wire [1:0] _GEN_146 = exception ? _GEN_123 : {{1'd0}, reg_mstatus_spp}; // @[CSR.scala 755:20 CSR.scala 320:24]
  wire  _GEN_147 = exception ? _GEN_124 : reg_mstatus_sie; // @[CSR.scala 755:20 CSR.scala 320:24]
  wire [39:0] _GEN_148 = exception ? _GEN_125 : reg_mepc; // @[CSR.scala 755:20 CSR.scala 392:21]
  wire [63:0] _GEN_149 = exception ? _GEN_126 : reg_mcause; // @[CSR.scala 755:20 CSR.scala 393:27]
  wire [39:0] _GEN_150 = exception ? _GEN_127 : reg_mtval; // @[CSR.scala 755:20 CSR.scala 394:22]
  wire  _GEN_151 = exception ? _GEN_128 : reg_mstatus_mpie; // @[CSR.scala 755:20 CSR.scala 320:24]
  wire [1:0] _GEN_152 = exception ? _GEN_129 : reg_mstatus_mpp; // @[CSR.scala 755:20 CSR.scala 320:24]
  wire  _GEN_153 = exception ? _GEN_130 : reg_mstatus_mie; // @[CSR.scala 755:20 CSR.scala 320:24]
  wire [39:0] _GEN_163 = io_rw_addr[10] & io_rw_addr[7] ? lo_6 : lo_4; // @[CSR.scala 822:70 CSR.scala 825:15]
  wire  _GEN_166 = io_rw_addr[10] & io_rw_addr[7] ? _GEN_153 : reg_mstatus_mpie; // @[CSR.scala 822:70]
  wire  _GEN_167 = io_rw_addr[10] & io_rw_addr[7] ? _GEN_151 : 1'h1; // @[CSR.scala 822:70]
  wire [1:0] _GEN_168 = io_rw_addr[10] & io_rw_addr[7] ? _GEN_152 : 2'h0; // @[CSR.scala 822:70]
  wire  _GEN_169 = ~io_rw_addr[9] ? reg_mstatus_spie : _GEN_147; // @[CSR.scala 816:52 CSR.scala 817:23]
  wire  _GEN_170 = ~io_rw_addr[9] | _GEN_145; // @[CSR.scala 816:52 CSR.scala 818:24]
  wire [1:0] _GEN_171 = ~io_rw_addr[9] ? 2'h0 : _GEN_146; // @[CSR.scala 816:52 CSR.scala 819:23]
  wire [39:0] _GEN_173 = ~io_rw_addr[9] ? lo_8 : _GEN_163; // @[CSR.scala 816:52 CSR.scala 821:15]
  wire  _GEN_177 = ~io_rw_addr[9] ? _GEN_153 : _GEN_166; // @[CSR.scala 816:52]
  wire  _GEN_178 = ~io_rw_addr[9] ? _GEN_151 : _GEN_167; // @[CSR.scala 816:52]
  wire [1:0] _GEN_179 = ~io_rw_addr[9] ? _GEN_152 : _GEN_168; // @[CSR.scala 816:52]
  wire  _GEN_180 = ret_prv < 2'h3 ? 1'h0 : reg_mstatus_mprv; // @[CSR.scala 840:41 CSR.scala 841:24 CSR.scala 320:24]
  wire  _GEN_181 = insn_ret ? _GEN_169 : _GEN_147; // @[CSR.scala 814:19]
  wire  _GEN_182 = insn_ret ? _GEN_170 : _GEN_145; // @[CSR.scala 814:19]
  wire [1:0] _GEN_183 = insn_ret ? _GEN_171 : _GEN_146; // @[CSR.scala 814:19]
  wire [63:0] _GEN_184 = insn_ret ? {{24'd0}, _GEN_173} : tvec; // @[CSR.scala 814:19 CSR.scala 725:11]
  wire  _GEN_188 = insn_ret ? _GEN_177 : _GEN_153; // @[CSR.scala 814:19]
  wire  _GEN_189 = insn_ret ? _GEN_178 : _GEN_151; // @[CSR.scala 814:19]
  wire [1:0] _GEN_190 = insn_ret ? _GEN_179 : _GEN_152; // @[CSR.scala 814:19]
  wire  _GEN_192 = insn_ret ? _GEN_180 : reg_mstatus_mprv; // @[CSR.scala 814:19 CSR.scala 320:24]
  reg  io_status_cease_r; // @[Reg.scala 27:20]
  wire  _GEN_193 = insn_cease | io_status_cease_r; // @[Reg.scala 28:19 Reg.scala 28:23 Reg.scala 27:20]
  wire [63:0] _io_rw_rdata_T_4 = _T_61 ? 64'h800000000094112d : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_5 = _T_62 ? read_mstatus : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_6 = _T_63 ? read_mtvec : 64'h0; // @[Mux.scala 27:72]
  wire [15:0] _io_rw_rdata_T_7 = _T_64 ? read_mip : 16'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_8 = _T_65 ? reg_mie : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_9 = _T_66 ? reg_mscratch : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_10 = _T_67 ? _T_30 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_11 = _T_68 ? _T_33 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_12 = _T_69 ? reg_mcause : 64'h0; // @[Mux.scala 27:72]
  wire  _io_rw_rdata_T_13 = _T_70 & io_hartid; // @[Mux.scala 27:72]
  wire [31:0] _io_rw_rdata_T_14 = _T_71 ? _T_34 : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_15 = _T_72 ? _T_41 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_16 = _T_73 ? reg_dscratch : 64'h0; // @[Mux.scala 27:72]
  wire [4:0] _io_rw_rdata_T_17 = _T_74 ? reg_fflags : 5'h0; // @[Mux.scala 27:72]
  wire [2:0] _io_rw_rdata_T_18 = _T_75 ? reg_frm : 3'h0; // @[Mux.scala 27:72]
  wire [7:0] _io_rw_rdata_T_19 = _T_76 ? read_fcsr : 8'h0; // @[Mux.scala 27:72]
  wire [8:0] _io_rw_rdata_T_20 = _T_77 ? reg_mcountinhibit : 9'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_21 = _T_78 ? value_1 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_22 = _T_79 ? value : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_23 = _T_80 ? reg_hpmevent_0 : 64'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_24 = _T_81 ? value_2 : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_25 = _T_82 ? value_2 : 40'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_26 = _T_83 ? reg_hpmevent_1 : 64'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_27 = _T_84 ? value_3 : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_28 = _T_85 ? value_3 : 40'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_29 = _T_86 ? reg_hpmevent_2 : 64'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_30 = _T_87 ? value_4 : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_31 = _T_88 ? value_4 : 40'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_32 = _T_89 ? reg_hpmevent_3 : 64'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_33 = _T_90 ? value_5 : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_34 = _T_91 ? value_5 : 40'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_35 = _T_92 ? reg_hpmevent_4 : 64'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_36 = _T_93 ? value_6 : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_37 = _T_94 ? value_6 : 40'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_38 = _T_95 ? reg_hpmevent_5 : 64'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_39 = _T_96 ? value_7 : 40'h0; // @[Mux.scala 27:72]
  wire [39:0] _io_rw_rdata_T_40 = _T_97 ? value_7 : 40'h0; // @[Mux.scala 27:72]
  wire [31:0] _io_rw_rdata_T_110 = _T_167 ? read_mcounteren : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_111 = _T_168 ? value_1 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_112 = _T_169 ? value : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_113 = _T_170 ? _T_42[63:0] : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_114 = _T_171 ? read_sip : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_115 = _T_172 ? read_sie : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_116 = _T_173 ? reg_sscratch : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_117 = _T_174 ? reg_scause : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_118 = _T_175 ? _T_46 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_119 = _T_176 ? _T_47 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_120 = _T_177 ? _T_54 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_121 = _T_178 ? read_stvec : 64'h0; // @[Mux.scala 27:72]
  wire [31:0] _io_rw_rdata_T_122 = _T_179 ? read_scounteren : 32'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_123 = _T_180 ? read_mideleg : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_124 = _T_181 ? read_medeleg : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_125 = _T_182 ? _T_55 : 64'h0; // @[Mux.scala 27:72]
  wire [29:0] _io_rw_rdata_T_127 = _T_184 ? reg_pmp_0_addr : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _io_rw_rdata_T_128 = _T_185 ? reg_pmp_1_addr : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _io_rw_rdata_T_129 = _T_186 ? reg_pmp_2_addr : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _io_rw_rdata_T_130 = _T_187 ? reg_pmp_3_addr : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _io_rw_rdata_T_131 = _T_188 ? reg_pmp_4_addr : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _io_rw_rdata_T_132 = _T_189 ? reg_pmp_5_addr : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _io_rw_rdata_T_133 = _T_190 ? reg_pmp_6_addr : 30'h0; // @[Mux.scala 27:72]
  wire [29:0] _io_rw_rdata_T_134 = _T_191 ? reg_pmp_7_addr : 30'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_143 = _T_200 ? reg_custom_0 : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_151 = _io_rw_rdata_T_4 | _io_rw_rdata_T_5; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_152 = _io_rw_rdata_T_151 | _io_rw_rdata_T_6; // @[Mux.scala 27:72]
  wire [63:0] _GEN_501 = {{48'd0}, _io_rw_rdata_T_7}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_153 = _io_rw_rdata_T_152 | _GEN_501; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_154 = _io_rw_rdata_T_153 | _io_rw_rdata_T_8; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_155 = _io_rw_rdata_T_154 | _io_rw_rdata_T_9; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_156 = _io_rw_rdata_T_155 | _io_rw_rdata_T_10; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_157 = _io_rw_rdata_T_156 | _io_rw_rdata_T_11; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_158 = _io_rw_rdata_T_157 | _io_rw_rdata_T_12; // @[Mux.scala 27:72]
  wire [63:0] _GEN_502 = {{63'd0}, _io_rw_rdata_T_13}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_159 = _io_rw_rdata_T_158 | _GEN_502; // @[Mux.scala 27:72]
  wire [63:0] _GEN_503 = {{32'd0}, _io_rw_rdata_T_14}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_160 = _io_rw_rdata_T_159 | _GEN_503; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_161 = _io_rw_rdata_T_160 | _io_rw_rdata_T_15; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_162 = _io_rw_rdata_T_161 | _io_rw_rdata_T_16; // @[Mux.scala 27:72]
  wire [63:0] _GEN_504 = {{59'd0}, _io_rw_rdata_T_17}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_163 = _io_rw_rdata_T_162 | _GEN_504; // @[Mux.scala 27:72]
  wire [63:0] _GEN_505 = {{61'd0}, _io_rw_rdata_T_18}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_164 = _io_rw_rdata_T_163 | _GEN_505; // @[Mux.scala 27:72]
  wire [63:0] _GEN_506 = {{56'd0}, _io_rw_rdata_T_19}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_165 = _io_rw_rdata_T_164 | _GEN_506; // @[Mux.scala 27:72]
  wire [63:0] _GEN_507 = {{55'd0}, _io_rw_rdata_T_20}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_166 = _io_rw_rdata_T_165 | _GEN_507; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_167 = _io_rw_rdata_T_166 | _io_rw_rdata_T_21; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_168 = _io_rw_rdata_T_167 | _io_rw_rdata_T_22; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_169 = _io_rw_rdata_T_168 | _io_rw_rdata_T_23; // @[Mux.scala 27:72]
  wire [63:0] _GEN_508 = {{24'd0}, _io_rw_rdata_T_24}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_170 = _io_rw_rdata_T_169 | _GEN_508; // @[Mux.scala 27:72]
  wire [63:0] _GEN_509 = {{24'd0}, _io_rw_rdata_T_25}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_171 = _io_rw_rdata_T_170 | _GEN_509; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_172 = _io_rw_rdata_T_171 | _io_rw_rdata_T_26; // @[Mux.scala 27:72]
  wire [63:0] _GEN_510 = {{24'd0}, _io_rw_rdata_T_27}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_173 = _io_rw_rdata_T_172 | _GEN_510; // @[Mux.scala 27:72]
  wire [63:0] _GEN_511 = {{24'd0}, _io_rw_rdata_T_28}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_174 = _io_rw_rdata_T_173 | _GEN_511; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_175 = _io_rw_rdata_T_174 | _io_rw_rdata_T_29; // @[Mux.scala 27:72]
  wire [63:0] _GEN_512 = {{24'd0}, _io_rw_rdata_T_30}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_176 = _io_rw_rdata_T_175 | _GEN_512; // @[Mux.scala 27:72]
  wire [63:0] _GEN_513 = {{24'd0}, _io_rw_rdata_T_31}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_177 = _io_rw_rdata_T_176 | _GEN_513; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_178 = _io_rw_rdata_T_177 | _io_rw_rdata_T_32; // @[Mux.scala 27:72]
  wire [63:0] _GEN_514 = {{24'd0}, _io_rw_rdata_T_33}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_179 = _io_rw_rdata_T_178 | _GEN_514; // @[Mux.scala 27:72]
  wire [63:0] _GEN_515 = {{24'd0}, _io_rw_rdata_T_34}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_180 = _io_rw_rdata_T_179 | _GEN_515; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_181 = _io_rw_rdata_T_180 | _io_rw_rdata_T_35; // @[Mux.scala 27:72]
  wire [63:0] _GEN_516 = {{24'd0}, _io_rw_rdata_T_36}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_182 = _io_rw_rdata_T_181 | _GEN_516; // @[Mux.scala 27:72]
  wire [63:0] _GEN_517 = {{24'd0}, _io_rw_rdata_T_37}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_183 = _io_rw_rdata_T_182 | _GEN_517; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_184 = _io_rw_rdata_T_183 | _io_rw_rdata_T_38; // @[Mux.scala 27:72]
  wire [63:0] _GEN_518 = {{24'd0}, _io_rw_rdata_T_39}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_185 = _io_rw_rdata_T_184 | _GEN_518; // @[Mux.scala 27:72]
  wire [63:0] _GEN_519 = {{24'd0}, _io_rw_rdata_T_40}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_186 = _io_rw_rdata_T_185 | _GEN_519; // @[Mux.scala 27:72]
  wire [63:0] _GEN_520 = {{32'd0}, _io_rw_rdata_T_110}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_256 = _io_rw_rdata_T_186 | _GEN_520; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_257 = _io_rw_rdata_T_256 | _io_rw_rdata_T_111; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_258 = _io_rw_rdata_T_257 | _io_rw_rdata_T_112; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_259 = _io_rw_rdata_T_258 | _io_rw_rdata_T_113; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_260 = _io_rw_rdata_T_259 | _io_rw_rdata_T_114; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_261 = _io_rw_rdata_T_260 | _io_rw_rdata_T_115; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_262 = _io_rw_rdata_T_261 | _io_rw_rdata_T_116; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_263 = _io_rw_rdata_T_262 | _io_rw_rdata_T_117; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_264 = _io_rw_rdata_T_263 | _io_rw_rdata_T_118; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_265 = _io_rw_rdata_T_264 | _io_rw_rdata_T_119; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_266 = _io_rw_rdata_T_265 | _io_rw_rdata_T_120; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_267 = _io_rw_rdata_T_266 | _io_rw_rdata_T_121; // @[Mux.scala 27:72]
  wire [63:0] _GEN_521 = {{32'd0}, _io_rw_rdata_T_122}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_268 = _io_rw_rdata_T_267 | _GEN_521; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_269 = _io_rw_rdata_T_268 | _io_rw_rdata_T_123; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_270 = _io_rw_rdata_T_269 | _io_rw_rdata_T_124; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_271 = _io_rw_rdata_T_270 | _io_rw_rdata_T_125; // @[Mux.scala 27:72]
  wire [63:0] _GEN_522 = {{34'd0}, _io_rw_rdata_T_127}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_273 = _io_rw_rdata_T_271 | _GEN_522; // @[Mux.scala 27:72]
  wire [63:0] _GEN_523 = {{34'd0}, _io_rw_rdata_T_128}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_274 = _io_rw_rdata_T_273 | _GEN_523; // @[Mux.scala 27:72]
  wire [63:0] _GEN_524 = {{34'd0}, _io_rw_rdata_T_129}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_275 = _io_rw_rdata_T_274 | _GEN_524; // @[Mux.scala 27:72]
  wire [63:0] _GEN_525 = {{34'd0}, _io_rw_rdata_T_130}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_276 = _io_rw_rdata_T_275 | _GEN_525; // @[Mux.scala 27:72]
  wire [63:0] _GEN_526 = {{34'd0}, _io_rw_rdata_T_131}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_277 = _io_rw_rdata_T_276 | _GEN_526; // @[Mux.scala 27:72]
  wire [63:0] _GEN_527 = {{34'd0}, _io_rw_rdata_T_132}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_278 = _io_rw_rdata_T_277 | _GEN_527; // @[Mux.scala 27:72]
  wire [63:0] _GEN_528 = {{34'd0}, _io_rw_rdata_T_133}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_279 = _io_rw_rdata_T_278 | _GEN_528; // @[Mux.scala 27:72]
  wire [63:0] _GEN_529 = {{34'd0}, _io_rw_rdata_T_134}; // @[Mux.scala 27:72]
  wire [63:0] _io_rw_rdata_T_280 = _io_rw_rdata_T_279 | _GEN_529; // @[Mux.scala 27:72]
  wire  _T_448 = io_rw_cmd == 3'h5; // @[package.scala 15:47]
  wire  _T_449 = io_rw_cmd == 3'h6; // @[package.scala 15:47]
  wire  _T_450 = io_rw_cmd == 3'h7; // @[package.scala 15:47]
  wire  csr_wen = _T_449 | _T_450 | _T_448; // @[package.scala 72:59]
  wire  _GEN_196 = io_fcsr_flags_valid | io_set_fs_dirty; // @[CSR.scala 884:30 CSR.scala 886:18]
  wire  _GEN_198 = io_fcsr_flag_exception_valid | _GEN_196; // @[CSR.scala 888:40 CSR.scala 890:18]
  wire  _GEN_245 = _T_74 | _GEN_198; // @[CSR.scala 976:40 CSR.scala 976:55]
  wire  _GEN_247 = _T_75 | _GEN_245; // @[CSR.scala 977:40 CSR.scala 977:55]
  wire  _GEN_249 = _T_76 | _GEN_247; // @[CSR.scala 978:38 CSR.scala 979:22]
  wire  set_fs_dirty = csr_wen ? _GEN_249 : _GEN_198; // @[CSR.scala 902:18]
  wire [1:0] _GEN_194 = set_fs_dirty ? 2'h3 : reg_mstatus_fs; // @[CSR.scala 877:25 CSR.scala 879:22 CSR.scala 320:24]
  wire [4:0] _lo_T = reg_fflags | io_fcsr_flags_bits; // @[CSR.scala 885:30]
  wire [4:0] _GEN_195 = io_fcsr_flags_valid ? _lo_T : reg_fflags; // @[CSR.scala 884:30 CSR.scala 885:16 CSR.scala 430:23]
  wire [4:0] _lo_T_2 = reg_fflags | io_fcsr_flag_exception_bits[6:2]; // @[CSR.scala 889:30]
  wire [4:0] _GEN_197 = io_fcsr_flag_exception_valid ? _lo_T_2 : _GEN_195; // @[CSR.scala 888:40 CSR.scala 889:16]
  wire  _io_csrw_counter_T_3 = io_rw_addr >= 12'hb00 & io_rw_addr < 12'hb20; // @[package.scala 204:55]
  wire  _io_csrw_counter_T_6 = io_rw_addr >= 12'hb80 & io_rw_addr < 12'hba0; // @[package.scala 204:55]
  wire [63:0] _io_csrw_counter_T_10 = 64'h1 << io_rw_addr[5:0]; // @[OneHot.scala 58:35]
  wire [63:0] _io_csrw_counter_T_11 = csr_wen & (_io_csrw_counter_T_3 | _io_csrw_counter_T_6) ? _io_csrw_counter_T_10 : 64'h0
    ; // @[CSR.scala 901:25]
  wire [102:0] _new_mstatus_WIRE = {{39'd0}, wdata};
  wire  new_mstatus_sie = _new_mstatus_WIRE[1]; // @[CSR.scala 904:47]
  wire  new_mstatus_mie = _new_mstatus_WIRE[3]; // @[CSR.scala 904:47]
  wire  new_mstatus_spie = _new_mstatus_WIRE[5]; // @[CSR.scala 904:47]
  wire  new_mstatus_mpie = _new_mstatus_WIRE[7]; // @[CSR.scala 904:47]
  wire  new_mstatus_spp = _new_mstatus_WIRE[8]; // @[CSR.scala 904:47]
  wire [1:0] new_mstatus_mpp = _new_mstatus_WIRE[12:11]; // @[CSR.scala 904:47]
  wire [1:0] new_mstatus_fs = _new_mstatus_WIRE[14:13]; // @[CSR.scala 904:47]
  wire  new_mstatus_mprv = _new_mstatus_WIRE[17]; // @[CSR.scala 904:47]
  wire  new_mstatus_sum = _new_mstatus_WIRE[18]; // @[CSR.scala 904:47]
  wire  new_mstatus_mxr = _new_mstatus_WIRE[19]; // @[CSR.scala 904:47]
  wire  new_mstatus_tvm = _new_mstatus_WIRE[20]; // @[CSR.scala 904:47]
  wire  new_mstatus_tw = _new_mstatus_WIRE[21]; // @[CSR.scala 904:47]
  wire  new_mstatus_tsr = _new_mstatus_WIRE[22]; // @[CSR.scala 904:47]
  wire [1:0] _GEN_203 = _T_62 ? {{1'd0}, new_mstatus_spp} : _GEN_183; // @[CSR.scala 903:39 CSR.scala 912:27]
  wire [15:0] _new_mip_T = {4'h0,2'h0,reg_mip_seip,1'h0,2'h0,reg_mip_stip,1'h0,2'h0,reg_mip_ssip,1'h0}; // @[CSR.scala 942:59]
  wire [15:0] _new_mip_T_2 = io_rw_cmd[1] ? _new_mip_T : 16'h0; // @[CSR.scala 1188:9]
  wire [63:0] _GEN_530 = {{48'd0}, _new_mip_T_2}; // @[CSR.scala 1188:34]
  wire [63:0] _new_mip_T_3 = _GEN_530 | io_rw_wdata; // @[CSR.scala 1188:34]
  wire [63:0] _new_mip_T_8 = _new_mip_T_3 & _wdata_T_6; // @[CSR.scala 1188:43]
  wire  new_mip_ssip = _new_mip_T_8[1]; // @[CSR.scala 942:88]
  wire  new_mip_stip = _new_mip_T_8[5]; // @[CSR.scala 942:88]
  wire  new_mip_seip = _new_mip_T_8[9]; // @[CSR.scala 942:88]
  wire [63:0] _reg_mie_T = wdata & 64'haaa; // @[CSR.scala 949:59]
  wire [63:0] _reg_mepc_T = ~wdata; // @[CSR.scala 1209:28]
  wire [63:0] _reg_mepc_T_1 = _reg_mepc_T | 64'h1; // @[CSR.scala 1209:31]
  wire [63:0] _reg_mepc_T_2 = ~_reg_mepc_T_1; // @[CSR.scala 1209:26]
  wire [63:0] _GEN_217 = _T_67 ? _reg_mepc_T_2 : {{24'd0}, _GEN_148}; // @[CSR.scala 950:40 CSR.scala 950:51]
  wire [63:0] _GEN_219 = _T_63 ? wdata : {{32'd0}, reg_mtvec}; // @[CSR.scala 953:40 CSR.scala 953:52 CSR.scala 398:27]
  wire [63:0] _reg_mcause_T = wdata & 64'h800000000000000f; // @[CSR.scala 954:62]
  wire [39:0] _GEN_222 = _T_81 ? wdata[39:0] : {{33'd0}, _GEN_4}; // @[CSR.scala 1206:31 Counters.scala 65:11]
  wire [63:0] _reg_hpmevent_0_T = wdata & 64'h3f03; // @[Events.scala 33:14]
  wire [39:0] _GEN_225 = _T_84 ? wdata[39:0] : {{33'd0}, _GEN_6}; // @[CSR.scala 1206:31 Counters.scala 65:11]
  wire [39:0] _GEN_228 = _T_87 ? wdata[39:0] : {{33'd0}, _GEN_8}; // @[CSR.scala 1206:31 Counters.scala 65:11]
  wire [39:0] _GEN_231 = _T_90 ? wdata[39:0] : {{33'd0}, _GEN_10}; // @[CSR.scala 1206:31 Counters.scala 65:11]
  wire [39:0] _GEN_234 = _T_93 ? wdata[39:0] : {{33'd0}, _GEN_12}; // @[CSR.scala 1206:31 Counters.scala 65:11]
  wire [39:0] _GEN_237 = _T_96 ? wdata[39:0] : {{33'd0}, _GEN_14}; // @[CSR.scala 1206:31 Counters.scala 65:11]
  wire [63:0] _reg_mcountinhibit_T_1 = wdata & 64'hfffffffffffffffd; // @[CSR.scala 970:76]
  wire [63:0] _GEN_240 = _T_77 ? _reg_mcountinhibit_T_1 : {{55'd0}, reg_mcountinhibit}; // @[CSR.scala 970:47 CSR.scala 970:67 CSR.scala 437:34]
  wire [63:0] _GEN_241 = _T_78 ? wdata : {{57'd0}, _GEN_2}; // @[CSR.scala 1206:31 Counters.scala 65:11]
  wire [63:0] _GEN_243 = _T_79 ? wdata : {{57'd0}, _GEN_0}; // @[CSR.scala 1206:31 Counters.scala 65:11]
  wire [63:0] _GEN_246 = _T_74 ? wdata : {{59'd0}, _GEN_197}; // @[CSR.scala 976:40 CSR.scala 976:75]
  wire [63:0] _GEN_248 = _T_75 ? wdata : {{61'd0}, reg_frm}; // @[CSR.scala 977:40 CSR.scala 977:72 CSR.scala 431:20]
  wire [63:0] _GEN_250 = _T_76 ? wdata : _GEN_246; // @[CSR.scala 978:38 CSR.scala 980:20]
  wire [63:0] _GEN_251 = _T_76 ? {{5'd0}, wdata[63:5]} : _GEN_248; // @[CSR.scala 978:38 CSR.scala 981:17]
  wire [1:0] new_dcsr_prv = wdata[1:0]; // @[CSR.scala 986:43]
  wire  new_dcsr_step = wdata[2]; // @[CSR.scala 986:43]
  wire  new_dcsr_ebreaku = wdata[12]; // @[CSR.scala 986:43]
  wire  new_dcsr_ebreaks = wdata[13]; // @[CSR.scala 986:43]
  wire  new_dcsr_ebreakm = wdata[15]; // @[CSR.scala 986:43]
  wire [63:0] _GEN_257 = _T_72 ? _reg_mepc_T_2 : {{24'd0}, _GEN_132}; // @[CSR.scala 993:42 CSR.scala 993:52]
  wire [1:0] _GEN_261 = _T_170 ? {{1'd0}, new_mstatus_spp} : _GEN_203; // @[CSR.scala 1000:41 CSR.scala 1004:25]
  wire [63:0] _new_sip_T = ~read_mideleg; // @[CSR.scala 1013:54]
  wire [63:0] _new_sip_T_1 = _GEN_497 & _new_sip_T; // @[CSR.scala 1013:52]
  wire [63:0] _new_sip_T_2 = wdata & read_mideleg; // @[CSR.scala 1013:78]
  wire [63:0] _new_sip_T_3 = _new_sip_T_1 | _new_sip_T_2; // @[CSR.scala 1013:69]
  wire  new_sip_ssip = _new_sip_T_3[1]; // @[CSR.scala 1013:41]
  wire [43:0] new_satp_ppn = wdata[43:0]; // @[CSR.scala 1018:45]
  wire [3:0] new_satp_mode = wdata[63:60]; // @[CSR.scala 1018:45]
  wire  _T_2227 = new_satp_mode == 4'h0; // @[package.scala 15:47]
  wire  _T_2228 = new_satp_mode == 4'h8; // @[package.scala 15:47]
  wire  _T_2229 = _T_2227 | _T_2228; // @[package.scala 72:59]
  wire [3:0] _reg_satp_mode_T = new_satp_mode & 4'h8; // @[CSR.scala 1021:44]
  wire [63:0] _reg_mie_T_2 = reg_mie & _new_sip_T; // @[CSR.scala 1027:64]
  wire [63:0] _reg_mie_T_4 = _reg_mie_T_2 | _new_sip_T_2; // @[CSR.scala 1027:81]
  wire [63:0] _GEN_273 = _T_177 ? _reg_mepc_T_2 : {{24'd0}, _GEN_141}; // @[CSR.scala 1029:42 CSR.scala 1029:53]
  wire [63:0] _GEN_274 = _T_178 ? wdata : {{25'd0}, reg_stvec}; // @[CSR.scala 1030:42 CSR.scala 1030:54 CSR.scala 426:22]
  wire [63:0] _reg_scause_T = wdata & 64'h800000000000001f; // @[CSR.scala 1031:64]
  wire [63:0] _GEN_279 = _T_179 ? wdata : {{32'd0}, reg_scounteren}; // @[CSR.scala 1035:44 CSR.scala 1035:61 CSR.scala 418:18]
  wire [63:0] _GEN_280 = _T_167 ? wdata : {{32'd0}, reg_mcounteren}; // @[CSR.scala 1038:44 CSR.scala 1038:61 CSR.scala 414:18]
  wire  newCfg_r = wdata[0]; // @[CSR.scala 1077:46]
  wire  newCfg_w = wdata[1]; // @[CSR.scala 1077:46]
  wire  newCfg_x = wdata[2]; // @[CSR.scala 1077:46]
  wire [1:0] newCfg_a = wdata[4:3]; // @[CSR.scala 1077:46]
  wire  newCfg_l = wdata[7]; // @[CSR.scala 1077:46]
  wire  _T_2235 = ~reg_pmp_1_cfg_a[1] & pmp_mask_base_lo_1; // @[PMP.scala 49:20]
  wire  _T_2237 = reg_pmp_0_cfg_l | reg_pmp_1_cfg_l & _T_2235; // @[PMP.scala 51:44]
  wire [63:0] _GEN_287 = _T_184 & ~_T_2237 ? wdata : {{34'd0}, reg_pmp_0_addr}; // @[CSR.scala 1085:71 CSR.scala 1086:18 CSR.scala 380:20]
  wire  newCfg_1_r = wdata[8]; // @[CSR.scala 1077:46]
  wire  newCfg_1_w = wdata[9]; // @[CSR.scala 1077:46]
  wire  newCfg_1_x = wdata[10]; // @[CSR.scala 1077:46]
  wire [1:0] newCfg_1_a = wdata[12:11]; // @[CSR.scala 1077:46]
  wire  newCfg_1_l = wdata[15]; // @[CSR.scala 1077:46]
  wire  _T_2245 = ~reg_pmp_2_cfg_a[1] & pmp_mask_base_lo_2; // @[PMP.scala 49:20]
  wire  _T_2247 = reg_pmp_1_cfg_l | reg_pmp_2_cfg_l & _T_2245; // @[PMP.scala 51:44]
  wire [63:0] _GEN_294 = _T_185 & ~_T_2247 ? wdata : {{34'd0}, reg_pmp_1_addr}; // @[CSR.scala 1085:71 CSR.scala 1086:18 CSR.scala 380:20]
  wire  newCfg_2_r = wdata[16]; // @[CSR.scala 1077:46]
  wire  newCfg_2_w = wdata[17]; // @[CSR.scala 1077:46]
  wire  newCfg_2_x = wdata[18]; // @[CSR.scala 1077:46]
  wire [1:0] newCfg_2_a = wdata[20:19]; // @[CSR.scala 1077:46]
  wire  newCfg_2_l = wdata[23]; // @[CSR.scala 1077:46]
  wire  _T_2255 = ~reg_pmp_3_cfg_a[1] & pmp_mask_base_lo_3; // @[PMP.scala 49:20]
  wire  _T_2257 = reg_pmp_2_cfg_l | reg_pmp_3_cfg_l & _T_2255; // @[PMP.scala 51:44]
  wire [63:0] _GEN_301 = _T_186 & ~_T_2257 ? wdata : {{34'd0}, reg_pmp_2_addr}; // @[CSR.scala 1085:71 CSR.scala 1086:18 CSR.scala 380:20]
  wire  newCfg_3_r = wdata[24]; // @[CSR.scala 1077:46]
  wire  newCfg_3_w = wdata[25]; // @[CSR.scala 1077:46]
  wire  newCfg_3_x = wdata[26]; // @[CSR.scala 1077:46]
  wire [1:0] newCfg_3_a = wdata[28:27]; // @[CSR.scala 1077:46]
  wire  newCfg_3_l = wdata[31]; // @[CSR.scala 1077:46]
  wire  _T_2265 = ~reg_pmp_4_cfg_a[1] & pmp_mask_base_lo_4; // @[PMP.scala 49:20]
  wire  _T_2267 = reg_pmp_3_cfg_l | reg_pmp_4_cfg_l & _T_2265; // @[PMP.scala 51:44]
  wire [63:0] _GEN_308 = _T_187 & ~_T_2267 ? wdata : {{34'd0}, reg_pmp_3_addr}; // @[CSR.scala 1085:71 CSR.scala 1086:18 CSR.scala 380:20]
  wire  newCfg_4_r = wdata[32]; // @[CSR.scala 1077:46]
  wire  newCfg_4_w = wdata[33]; // @[CSR.scala 1077:46]
  wire  newCfg_4_x = wdata[34]; // @[CSR.scala 1077:46]
  wire [1:0] newCfg_4_a = wdata[36:35]; // @[CSR.scala 1077:46]
  wire  newCfg_4_l = wdata[39]; // @[CSR.scala 1077:46]
  wire  _T_2275 = ~reg_pmp_5_cfg_a[1] & pmp_mask_base_lo_5; // @[PMP.scala 49:20]
  wire  _T_2277 = reg_pmp_4_cfg_l | reg_pmp_5_cfg_l & _T_2275; // @[PMP.scala 51:44]
  wire [63:0] _GEN_315 = _T_188 & ~_T_2277 ? wdata : {{34'd0}, reg_pmp_4_addr}; // @[CSR.scala 1085:71 CSR.scala 1086:18 CSR.scala 380:20]
  wire  newCfg_5_r = wdata[40]; // @[CSR.scala 1077:46]
  wire  newCfg_5_w = wdata[41]; // @[CSR.scala 1077:46]
  wire  newCfg_5_x = wdata[42]; // @[CSR.scala 1077:46]
  wire [1:0] newCfg_5_a = wdata[44:43]; // @[CSR.scala 1077:46]
  wire  newCfg_5_l = wdata[47]; // @[CSR.scala 1077:46]
  wire  _T_2285 = ~reg_pmp_6_cfg_a[1] & pmp_mask_base_lo_6; // @[PMP.scala 49:20]
  wire  _T_2287 = reg_pmp_5_cfg_l | reg_pmp_6_cfg_l & _T_2285; // @[PMP.scala 51:44]
  wire [63:0] _GEN_322 = _T_189 & ~_T_2287 ? wdata : {{34'd0}, reg_pmp_5_addr}; // @[CSR.scala 1085:71 CSR.scala 1086:18 CSR.scala 380:20]
  wire  newCfg_6_r = wdata[48]; // @[CSR.scala 1077:46]
  wire  newCfg_6_w = wdata[49]; // @[CSR.scala 1077:46]
  wire  newCfg_6_x = wdata[50]; // @[CSR.scala 1077:46]
  wire [1:0] newCfg_6_a = wdata[52:51]; // @[CSR.scala 1077:46]
  wire  newCfg_6_l = wdata[55]; // @[CSR.scala 1077:46]
  wire  _T_2295 = ~reg_pmp_7_cfg_a[1] & pmp_mask_base_lo_7; // @[PMP.scala 49:20]
  wire  _T_2297 = reg_pmp_6_cfg_l | reg_pmp_7_cfg_l & _T_2295; // @[PMP.scala 51:44]
  wire [63:0] _GEN_329 = _T_190 & ~_T_2297 ? wdata : {{34'd0}, reg_pmp_6_addr}; // @[CSR.scala 1085:71 CSR.scala 1086:18 CSR.scala 380:20]
  wire  newCfg_7_r = wdata[56]; // @[CSR.scala 1077:46]
  wire  newCfg_7_w = wdata[57]; // @[CSR.scala 1077:46]
  wire  newCfg_7_x = wdata[58]; // @[CSR.scala 1077:46]
  wire [1:0] newCfg_7_a = wdata[60:59]; // @[CSR.scala 1077:46]
  wire  newCfg_7_l = wdata[63]; // @[CSR.scala 1077:46]
  wire  _T_2307 = reg_pmp_7_cfg_l | reg_pmp_7_cfg_l & _T_2295; // @[PMP.scala 51:44]
  wire [63:0] _GEN_336 = _T_191 & ~_T_2307 ? wdata : {{34'd0}, reg_pmp_7_addr}; // @[CSR.scala 1085:71 CSR.scala 1086:18 CSR.scala 380:20]
  wire [63:0] _reg_custom_0_T = wdata & 64'h8; // @[CSR.scala 1092:23]
  wire [63:0] _reg_custom_0_T_2 = reg_custom_0 & 64'hfffffffffffffff7; // @[CSR.scala 1092:38]
  wire [63:0] _reg_custom_0_T_3 = _reg_custom_0_T | _reg_custom_0_T_2; // @[CSR.scala 1092:31]
  wire [1:0] _GEN_343 = csr_wen ? _GEN_261 : _GEN_183; // @[CSR.scala 902:18]
  wire [63:0] _GEN_357 = csr_wen ? _GEN_217 : {{24'd0}, _GEN_148}; // @[CSR.scala 902:18]
  wire [63:0] _GEN_359 = csr_wen ? _GEN_219 : {{32'd0}, reg_mtvec}; // @[CSR.scala 902:18 CSR.scala 398:27]
  wire [39:0] _GEN_362 = csr_wen ? _GEN_222 : {{33'd0}, _GEN_4}; // @[CSR.scala 902:18]
  wire [39:0] _GEN_365 = csr_wen ? _GEN_225 : {{33'd0}, _GEN_6}; // @[CSR.scala 902:18]
  wire [39:0] _GEN_368 = csr_wen ? _GEN_228 : {{33'd0}, _GEN_8}; // @[CSR.scala 902:18]
  wire [39:0] _GEN_371 = csr_wen ? _GEN_231 : {{33'd0}, _GEN_10}; // @[CSR.scala 902:18]
  wire [39:0] _GEN_374 = csr_wen ? _GEN_234 : {{33'd0}, _GEN_12}; // @[CSR.scala 902:18]
  wire [39:0] _GEN_377 = csr_wen ? _GEN_237 : {{33'd0}, _GEN_14}; // @[CSR.scala 902:18]
  wire [63:0] _GEN_380 = csr_wen ? _GEN_240 : {{55'd0}, reg_mcountinhibit}; // @[CSR.scala 902:18 CSR.scala 437:34]
  wire [63:0] _GEN_381 = csr_wen ? _GEN_241 : {{57'd0}, _GEN_2}; // @[CSR.scala 902:18]
  wire [63:0] _GEN_383 = csr_wen ? _GEN_243 : {{57'd0}, _GEN_0}; // @[CSR.scala 902:18]
  wire [63:0] _GEN_386 = csr_wen ? _GEN_250 : {{59'd0}, _GEN_197}; // @[CSR.scala 902:18]
  wire [63:0] _GEN_387 = csr_wen ? _GEN_251 : {{61'd0}, reg_frm}; // @[CSR.scala 902:18 CSR.scala 431:20]
  wire [63:0] _GEN_393 = csr_wen ? _GEN_257 : {{24'd0}, _GEN_132}; // @[CSR.scala 902:18]
  wire [63:0] _GEN_398 = csr_wen ? _GEN_273 : {{24'd0}, _GEN_141}; // @[CSR.scala 902:18]
  wire [63:0] _GEN_399 = csr_wen ? _GEN_274 : {{25'd0}, reg_stvec}; // @[CSR.scala 902:18 CSR.scala 426:22]
  wire [63:0] _GEN_404 = csr_wen ? _GEN_279 : {{32'd0}, reg_scounteren}; // @[CSR.scala 902:18 CSR.scala 418:18]
  wire [63:0] _GEN_405 = csr_wen ? _GEN_280 : {{32'd0}, reg_mcounteren}; // @[CSR.scala 902:18 CSR.scala 414:18]
  wire [63:0] _GEN_412 = csr_wen ? _GEN_287 : {{34'd0}, reg_pmp_0_addr}; // @[CSR.scala 902:18 CSR.scala 380:20]
  wire [63:0] _GEN_419 = csr_wen ? _GEN_294 : {{34'd0}, reg_pmp_1_addr}; // @[CSR.scala 902:18 CSR.scala 380:20]
  wire [63:0] _GEN_426 = csr_wen ? _GEN_301 : {{34'd0}, reg_pmp_2_addr}; // @[CSR.scala 902:18 CSR.scala 380:20]
  wire [63:0] _GEN_433 = csr_wen ? _GEN_308 : {{34'd0}, reg_pmp_3_addr}; // @[CSR.scala 902:18 CSR.scala 380:20]
  wire [63:0] _GEN_440 = csr_wen ? _GEN_315 : {{34'd0}, reg_pmp_4_addr}; // @[CSR.scala 902:18 CSR.scala 380:20]
  wire [63:0] _GEN_447 = csr_wen ? _GEN_322 : {{34'd0}, reg_pmp_5_addr}; // @[CSR.scala 902:18 CSR.scala 380:20]
  wire [63:0] _GEN_454 = csr_wen ? _GEN_329 : {{34'd0}, reg_pmp_6_addr}; // @[CSR.scala 902:18 CSR.scala 380:20]
  wire [63:0] _GEN_461 = csr_wen ? _GEN_336 : {{34'd0}, reg_pmp_7_addr}; // @[CSR.scala 902:18 CSR.scala 380:20]
  assign io_rw_rdata = _io_rw_rdata_T_280 | _io_rw_rdata_T_143; // @[Mux.scala 27:72]
  assign io_decode_0_fp_illegal = io_status_fs == 2'h0; // @[CSR.scala 668:39]
  assign io_decode_0_vector_illegal = 1'h1; // @[CSR.scala 669:49]
  assign io_decode_0_fp_csr = _io_decode_0_fp_csr_T == 12'h0; // @[Decode.scala 14:121]
  assign io_decode_0_rocc_illegal = io_status_xs == 2'h0; // @[CSR.scala 671:41]
  assign io_decode_0_read_illegal = _io_decode_0_read_illegal_T_317 | _io_decode_0_read_illegal_T_320; // @[CSR.scala 677:68]
  assign io_decode_0_write_illegal = &io_decode_0_csr[11:10]; // @[CSR.scala 679:47]
  assign io_decode_0_write_flush = ~(io_decode_0_csr >= 12'h340 & io_decode_0_csr <= 12'h343 | io_decode_0_csr >= 12'h140
     & io_decode_0_csr <= 12'h143); // @[CSR.scala 680:27]
  assign io_decode_0_system_illegal = _io_decode_0_system_illegal_T_14 | _io_decode_0_system_illegal_T_16; // @[CSR.scala 684:63]
  assign io_decode_1_fp_illegal = io_status_fs == 2'h0; // @[CSR.scala 668:39]
  assign io_decode_1_vector_illegal = 1'h1; // @[CSR.scala 669:49]
  assign io_decode_1_fp_csr = _io_decode_1_fp_csr_T == 12'h0; // @[Decode.scala 14:121]
  assign io_decode_1_rocc_illegal = io_status_xs == 2'h0; // @[CSR.scala 671:41]
  assign io_decode_1_read_illegal = _io_decode_1_read_illegal_T_317 | _io_decode_1_read_illegal_T_320; // @[CSR.scala 677:68]
  assign io_decode_1_write_illegal = &io_decode_1_csr[11:10]; // @[CSR.scala 679:47]
  assign io_decode_1_write_flush = ~(io_decode_1_csr >= 12'h340 & io_decode_1_csr <= 12'h343 | io_decode_1_csr >= 12'h140
     & io_decode_1_csr <= 12'h143); // @[CSR.scala 680:27]
  assign io_decode_1_system_illegal = _io_decode_1_system_illegal_T_14 | _io_decode_1_system_illegal_T_16; // @[CSR.scala 684:63]
  assign io_csr_stall = reg_wfi | io_status_cease; // @[CSR.scala 846:27]
  assign io_eret = _exception_T | insn_ret; // @[CSR.scala 727:38]
  assign io_singleStep = reg_dcsr_step & _T_312; // @[CSR.scala 728:34]
  assign io_status_debug = reg_debug; // @[CSR.scala 731:19]
  assign io_status_cease = io_status_cease_r; // @[CSR.scala 847:19]
  assign io_status_wfi = reg_wfi; // @[CSR.scala 848:17]
  assign io_status_isa = 32'h94112d; // @[CSR.scala 732:17]
  assign io_status_dprv = io_status_dprv_REG; // @[CSR.scala 735:18]
  assign io_status_prv = reg_mstatus_prv; // @[CSR.scala 729:13]
  assign io_status_sd = &io_status_fs | &io_status_xs | &io_status_vs; // @[CSR.scala 730:58]
  assign io_status_zero2 = 27'h0; // @[CSR.scala 729:13]
  assign io_status_sxl = 2'h2; // @[CSR.scala 734:17]
  assign io_status_uxl = 2'h2; // @[CSR.scala 733:17]
  assign io_status_sd_rv32 = 1'h0; // @[CSR.scala 729:13]
  assign io_status_zero1 = 8'h0; // @[CSR.scala 729:13]
  assign io_status_tsr = reg_mstatus_tsr; // @[CSR.scala 729:13]
  assign io_status_tw = reg_mstatus_tw; // @[CSR.scala 729:13]
  assign io_status_tvm = reg_mstatus_tvm; // @[CSR.scala 729:13]
  assign io_status_mxr = reg_mstatus_mxr; // @[CSR.scala 729:13]
  assign io_status_sum = reg_mstatus_sum; // @[CSR.scala 729:13]
  assign io_status_mprv = reg_mstatus_mprv; // @[CSR.scala 729:13]
  assign io_status_xs = 2'h0; // @[CSR.scala 729:13]
  assign io_status_fs = reg_mstatus_fs; // @[CSR.scala 729:13]
  assign io_status_mpp = reg_mstatus_mpp; // @[CSR.scala 729:13]
  assign io_status_vs = 2'h0; // @[CSR.scala 729:13]
  assign io_status_spp = reg_mstatus_spp; // @[CSR.scala 729:13]
  assign io_status_mpie = reg_mstatus_mpie; // @[CSR.scala 729:13]
  assign io_status_hpie = 1'h0; // @[CSR.scala 729:13]
  assign io_status_spie = reg_mstatus_spie; // @[CSR.scala 729:13]
  assign io_status_upie = 1'h0; // @[CSR.scala 729:13]
  assign io_status_mie = reg_mstatus_mie; // @[CSR.scala 729:13]
  assign io_status_hie = 1'h0; // @[CSR.scala 729:13]
  assign io_status_sie = reg_mstatus_sie; // @[CSR.scala 729:13]
  assign io_status_uie = 1'h0; // @[CSR.scala 729:13]
  assign io_ptbr_mode = reg_satp_mode; // @[CSR.scala 726:11]
  assign io_ptbr_asid = 16'h0; // @[CSR.scala 726:11]
  assign io_ptbr_ppn = reg_satp_ppn; // @[CSR.scala 726:11]
  assign io_evec = _GEN_184[39:0];
  assign io_time = {value_hi_1,value_lo_1}; // @[Cat.scala 30:58]
  assign io_fcsr_rm = reg_frm; // @[CSR.scala 883:14]
  assign io_interrupt = (anyInterrupt & ~io_singleStep | reg_singleStepped) & ~(reg_debug | io_status_cease); // @[CSR.scala 470:73]
  assign io_interrupt_cause = 64'h8000000000000000 + _GEN_498; // @[CSR.scala 469:67]
  assign io_pmp_0_cfg_l = reg_pmp_0_cfg_l; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_0_cfg_res = 2'h0; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_0_cfg_a = reg_pmp_0_cfg_a; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_0_cfg_x = reg_pmp_0_cfg_x; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_0_cfg_w = reg_pmp_0_cfg_w; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_0_cfg_r = reg_pmp_0_cfg_r; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_0_addr = reg_pmp_0_addr; // @[PMP.scala 26:19 PMP.scala 28:14]
  assign io_pmp_0_mask = _pmp_mask_T_3[31:0]; // @[PMP.scala 26:19 PMP.scala 29:14]
  assign io_pmp_1_cfg_l = reg_pmp_1_cfg_l; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_1_cfg_res = 2'h0; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_1_cfg_a = reg_pmp_1_cfg_a; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_1_cfg_x = reg_pmp_1_cfg_x; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_1_cfg_w = reg_pmp_1_cfg_w; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_1_cfg_r = reg_pmp_1_cfg_r; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_1_addr = reg_pmp_1_addr; // @[PMP.scala 26:19 PMP.scala 28:14]
  assign io_pmp_1_mask = _pmp_mask_T_7[31:0]; // @[PMP.scala 26:19 PMP.scala 29:14]
  assign io_pmp_2_cfg_l = reg_pmp_2_cfg_l; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_2_cfg_res = 2'h0; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_2_cfg_a = reg_pmp_2_cfg_a; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_2_cfg_x = reg_pmp_2_cfg_x; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_2_cfg_w = reg_pmp_2_cfg_w; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_2_cfg_r = reg_pmp_2_cfg_r; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_2_addr = reg_pmp_2_addr; // @[PMP.scala 26:19 PMP.scala 28:14]
  assign io_pmp_2_mask = _pmp_mask_T_11[31:0]; // @[PMP.scala 26:19 PMP.scala 29:14]
  assign io_pmp_3_cfg_l = reg_pmp_3_cfg_l; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_3_cfg_res = 2'h0; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_3_cfg_a = reg_pmp_3_cfg_a; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_3_cfg_x = reg_pmp_3_cfg_x; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_3_cfg_w = reg_pmp_3_cfg_w; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_3_cfg_r = reg_pmp_3_cfg_r; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_3_addr = reg_pmp_3_addr; // @[PMP.scala 26:19 PMP.scala 28:14]
  assign io_pmp_3_mask = _pmp_mask_T_15[31:0]; // @[PMP.scala 26:19 PMP.scala 29:14]
  assign io_pmp_4_cfg_l = reg_pmp_4_cfg_l; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_4_cfg_res = 2'h0; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_4_cfg_a = reg_pmp_4_cfg_a; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_4_cfg_x = reg_pmp_4_cfg_x; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_4_cfg_w = reg_pmp_4_cfg_w; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_4_cfg_r = reg_pmp_4_cfg_r; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_4_addr = reg_pmp_4_addr; // @[PMP.scala 26:19 PMP.scala 28:14]
  assign io_pmp_4_mask = _pmp_mask_T_19[31:0]; // @[PMP.scala 26:19 PMP.scala 29:14]
  assign io_pmp_5_cfg_l = reg_pmp_5_cfg_l; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_5_cfg_res = 2'h0; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_5_cfg_a = reg_pmp_5_cfg_a; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_5_cfg_x = reg_pmp_5_cfg_x; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_5_cfg_w = reg_pmp_5_cfg_w; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_5_cfg_r = reg_pmp_5_cfg_r; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_5_addr = reg_pmp_5_addr; // @[PMP.scala 26:19 PMP.scala 28:14]
  assign io_pmp_5_mask = _pmp_mask_T_23[31:0]; // @[PMP.scala 26:19 PMP.scala 29:14]
  assign io_pmp_6_cfg_l = reg_pmp_6_cfg_l; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_6_cfg_res = 2'h0; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_6_cfg_a = reg_pmp_6_cfg_a; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_6_cfg_x = reg_pmp_6_cfg_x; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_6_cfg_w = reg_pmp_6_cfg_w; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_6_cfg_r = reg_pmp_6_cfg_r; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_6_addr = reg_pmp_6_addr; // @[PMP.scala 26:19 PMP.scala 28:14]
  assign io_pmp_6_mask = _pmp_mask_T_27[31:0]; // @[PMP.scala 26:19 PMP.scala 29:14]
  assign io_pmp_7_cfg_l = reg_pmp_7_cfg_l; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_7_cfg_res = 2'h0; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_7_cfg_a = reg_pmp_7_cfg_a; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_7_cfg_x = reg_pmp_7_cfg_x; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_7_cfg_w = reg_pmp_7_cfg_w; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_7_cfg_r = reg_pmp_7_cfg_r; // @[PMP.scala 26:19 PMP.scala 27:13]
  assign io_pmp_7_addr = reg_pmp_7_addr; // @[PMP.scala 26:19 PMP.scala 28:14]
  assign io_pmp_7_mask = _pmp_mask_T_31[31:0]; // @[PMP.scala 26:19 PMP.scala 29:14]
  assign io_counters_0_eventSel = reg_hpmevent_0; // @[CSR.scala 443:72]
  assign io_counters_1_eventSel = reg_hpmevent_1; // @[CSR.scala 443:72]
  assign io_counters_2_eventSel = reg_hpmevent_2; // @[CSR.scala 443:72]
  assign io_counters_3_eventSel = reg_hpmevent_3; // @[CSR.scala 443:72]
  assign io_counters_4_eventSel = reg_hpmevent_4; // @[CSR.scala 443:72]
  assign io_counters_5_eventSel = reg_hpmevent_5; // @[CSR.scala 443:72]
  assign io_csrw_counter = _io_csrw_counter_T_11[31:0]; // @[CSR.scala 901:19]
  assign io_inhibit_cycle = reg_mcountinhibit[0]; // @[CSR.scala 438:40]
  assign io_trace_0_valid = io_retire > 2'h0 | io_trace_0_exception; // @[CSR.scala 1167:30]
  assign io_trace_0_iaddr = io_pc; // @[CSR.scala 1169:13]
  assign io_trace_0_insn = io_inst_0; // @[CSR.scala 1168:12]
  assign io_trace_0_priv = {reg_debug,reg_mstatus_prv}; // @[Cat.scala 30:58]
  assign io_trace_0_exception = insn_call | insn_break | io_exception; // @[CSR.scala 739:43]
  assign io_trace_0_interrupt = cause[63]; // @[CSR.scala 1172:25]
  assign io_trace_0_cause = insn_call ? {{60'd0}, _cause_T_1} : _cause_T_2; // @[CSR.scala 689:8]
  assign io_trace_0_tval = io_tval; // @[CSR.scala 1173:12]
  assign io_trace_1_valid = io_retire > 2'h1 | io_trace_1_exception; // @[CSR.scala 1167:30]
  assign io_trace_1_iaddr = io_pc; // @[CSR.scala 1169:13]
  assign io_trace_1_insn = io_inst_1; // @[CSR.scala 1168:12]
  assign io_trace_1_priv = {reg_debug,reg_mstatus_prv}; // @[Cat.scala 30:58]
  assign io_trace_1_exception = io_retire >= 2'h1 & exception; // @[CSR.scala 1166:35]
  assign io_trace_1_interrupt = cause[63]; // @[CSR.scala 1172:25]
  assign io_trace_1_cause = insn_call ? {{60'd0}, _cause_T_1} : _cause_T_2; // @[CSR.scala 689:8]
  assign io_trace_1_tval = io_tval; // @[CSR.scala 1173:12]
  assign io_customCSRs_0_wen = csr_wen & _T_200; // @[CSR.scala 902:18 CSR.scala 851:12]
  assign io_customCSRs_0_wdata = _wdata_T_2 & _wdata_T_6; // @[CSR.scala 1188:43]
  assign io_customCSRs_0_value = reg_custom_0; // @[CSR.scala 853:14]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_prv <= 2'h3; // @[CSR.scala 320:24]
    end else if (new_prv == 2'h2) begin // @[CSR.scala 1192:29]
      reg_mstatus_prv <= 2'h0;
    end else if (insn_ret) begin // @[CSR.scala 814:19]
      if (~io_rw_addr[9]) begin // @[CSR.scala 816:52]
        reg_mstatus_prv <= {{1'd0}, reg_mstatus_spp}; // @[CSR.scala 820:15]
      end else begin
        reg_mstatus_prv <= _GEN_161;
      end
    end else if (exception) begin // @[CSR.scala 755:20]
      reg_mstatus_prv <= _GEN_112;
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_tsr <= 1'h0; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_62) begin // @[CSR.scala 903:39]
        reg_mstatus_tsr <= new_mstatus_tsr; // @[CSR.scala 916:27]
      end
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_tw <= 1'h0; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_62) begin // @[CSR.scala 903:39]
        reg_mstatus_tw <= new_mstatus_tw; // @[CSR.scala 915:26]
      end
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_tvm <= 1'h0; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_62) begin // @[CSR.scala 903:39]
        reg_mstatus_tvm <= new_mstatus_tvm; // @[CSR.scala 921:27]
      end
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_mxr <= 1'h0; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_170) begin // @[CSR.scala 1000:41]
        reg_mstatus_mxr <= new_mstatus_mxr; // @[CSR.scala 1008:27]
      end else if (_T_62) begin // @[CSR.scala 903:39]
        reg_mstatus_mxr <= new_mstatus_mxr; // @[CSR.scala 919:27]
      end
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_sum <= 1'h0; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_170) begin // @[CSR.scala 1000:41]
        reg_mstatus_sum <= new_mstatus_sum; // @[CSR.scala 1009:27]
      end else if (_T_62) begin // @[CSR.scala 903:39]
        reg_mstatus_sum <= new_mstatus_sum; // @[CSR.scala 920:27]
      end
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_mprv <= 1'h0; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_62) begin // @[CSR.scala 903:39]
        reg_mstatus_mprv <= new_mstatus_mprv; // @[CSR.scala 909:26]
      end else begin
        reg_mstatus_mprv <= _GEN_192;
      end
    end else begin
      reg_mstatus_mprv <= _GEN_192;
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_fs <= 2'h0; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_170) begin // @[CSR.scala 1000:41]
        reg_mstatus_fs <= new_mstatus_fs; // @[CSR.scala 1005:24]
      end else if (_T_62) begin // @[CSR.scala 903:39]
        reg_mstatus_fs <= new_mstatus_fs; // @[CSR.scala 925:55]
      end else begin
        reg_mstatus_fs <= _GEN_194;
      end
    end else begin
      reg_mstatus_fs <= _GEN_194;
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_mpp <= 2'h3; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_62) begin // @[CSR.scala 903:39]
        if (new_mstatus_mpp == 2'h2) begin // @[CSR.scala 1192:29]
          reg_mstatus_mpp <= 2'h0;
        end else begin
          reg_mstatus_mpp <= new_mstatus_mpp;
        end
      end else begin
        reg_mstatus_mpp <= _GEN_190;
      end
    end else begin
      reg_mstatus_mpp <= _GEN_190;
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_spp <= 1'h0; // @[CSR.scala 320:24]
    end else begin
      reg_mstatus_spp <= _GEN_343[0];
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_mpie <= 1'h0; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_62) begin // @[CSR.scala 903:39]
        reg_mstatus_mpie <= new_mstatus_mpie; // @[CSR.scala 906:24]
      end else begin
        reg_mstatus_mpie <= _GEN_189;
      end
    end else begin
      reg_mstatus_mpie <= _GEN_189;
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_spie <= 1'h0; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_170) begin // @[CSR.scala 1000:41]
        reg_mstatus_spie <= new_mstatus_spie; // @[CSR.scala 1003:26]
      end else if (_T_62) begin // @[CSR.scala 903:39]
        reg_mstatus_spie <= new_mstatus_spie; // @[CSR.scala 913:28]
      end else begin
        reg_mstatus_spie <= _GEN_182;
      end
    end else begin
      reg_mstatus_spie <= _GEN_182;
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_mie <= 1'h0; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_62) begin // @[CSR.scala 903:39]
        reg_mstatus_mie <= new_mstatus_mie; // @[CSR.scala 905:23]
      end else begin
        reg_mstatus_mie <= _GEN_188;
      end
    end else begin
      reg_mstatus_mie <= _GEN_188;
    end
    if (reset) begin // @[CSR.scala 320:24]
      reg_mstatus_sie <= 1'h0; // @[CSR.scala 320:24]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_170) begin // @[CSR.scala 1000:41]
        reg_mstatus_sie <= new_mstatus_sie; // @[CSR.scala 1002:25]
      end else if (_T_62) begin // @[CSR.scala 903:39]
        reg_mstatus_sie <= new_mstatus_sie; // @[CSR.scala 914:27]
      end else begin
        reg_mstatus_sie <= _GEN_181;
      end
    end else begin
      reg_mstatus_sie <= _GEN_181;
    end
    if (reset) begin // @[CSR.scala 328:21]
      reg_dcsr_prv <= 2'h3; // @[CSR.scala 328:21]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_71) begin // @[CSR.scala 985:38]
        if (new_dcsr_prv == 2'h2) begin // @[CSR.scala 1192:29]
          reg_dcsr_prv <= 2'h0;
        end else begin
          reg_dcsr_prv <= new_dcsr_prv;
        end
      end else begin
        reg_dcsr_prv <= _GEN_134;
      end
    end else begin
      reg_dcsr_prv <= _GEN_134;
    end
    if (_io_interrupt_T) begin // @[CSR.scala 747:25]
      reg_singleStepped <= 1'h0; // @[CSR.scala 747:45]
    end else begin
      reg_singleStepped <= _GEN_62;
    end
    if (reset) begin // @[CSR.scala 328:21]
      reg_dcsr_ebreakm <= 1'h0; // @[CSR.scala 328:21]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_71) begin // @[CSR.scala 985:38]
        reg_dcsr_ebreakm <= new_dcsr_ebreakm; // @[CSR.scala 988:26]
      end
    end
    if (reset) begin // @[CSR.scala 328:21]
      reg_dcsr_ebreaks <= 1'h0; // @[CSR.scala 328:21]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_71) begin // @[CSR.scala 985:38]
        reg_dcsr_ebreaks <= new_dcsr_ebreaks; // @[CSR.scala 989:47]
      end
    end
    if (reset) begin // @[CSR.scala 328:21]
      reg_dcsr_ebreaku <= 1'h0; // @[CSR.scala 328:21]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_71) begin // @[CSR.scala 985:38]
        reg_dcsr_ebreaku <= new_dcsr_ebreaku; // @[CSR.scala 990:41]
      end
    end
    if (reset) begin // @[CSR.scala 369:22]
      reg_debug <= 1'h0; // @[CSR.scala 369:22]
    end else if (insn_ret) begin // @[CSR.scala 814:19]
      if (~io_rw_addr[9]) begin // @[CSR.scala 816:52]
        reg_debug <= _GEN_131;
      end else if (io_rw_addr[10] & io_rw_addr[7]) begin // @[CSR.scala 822:70]
        reg_debug <= 1'h0; // @[CSR.scala 824:17]
      end else begin
        reg_debug <= _GEN_131;
      end
    end else begin
      reg_debug <= _GEN_131;
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_180) begin // @[CSR.scala 1033:42]
        reg_mideleg <= wdata; // @[CSR.scala 1033:56]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_181) begin // @[CSR.scala 1034:42]
        reg_medeleg <= wdata; // @[CSR.scala 1034:56]
      end
    end
    if (reset) begin // @[CSR.scala 328:21]
      reg_dcsr_cause <= 3'h0; // @[CSR.scala 328:21]
    end else if (exception) begin // @[CSR.scala 755:20]
      if (trapToDebug) begin // @[CSR.scala 756:24]
        if (~reg_debug) begin // @[CSR.scala 757:25]
          reg_dcsr_cause <= _reg_dcsr_cause_T_2; // @[CSR.scala 760:24]
        end
      end
    end
    if (reset) begin // @[CSR.scala 328:21]
      reg_dcsr_step <= 1'h0; // @[CSR.scala 328:21]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_71) begin // @[CSR.scala 985:38]
        reg_dcsr_step <= new_dcsr_step; // @[CSR.scala 987:23]
      end
    end
    reg_dpc <= _GEN_393[39:0];
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_73) begin // @[CSR.scala 994:42]
        reg_dscratch <= wdata; // @[CSR.scala 994:57]
      end
    end
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_0_cfg_l <= 1'h0; // @[PMP.scala 40:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_0_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_0_cfg_l <= newCfg_l; // @[CSR.scala 1078:17]
      end
    end
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_0_cfg_a <= 2'h0; // @[PMP.scala 39:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_0_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_0_cfg_a <= newCfg_a; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_0_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_0_cfg_x <= newCfg_x; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_0_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_0_cfg_w <= newCfg_w & newCfg_r; // @[CSR.scala 1080:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_0_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_0_cfg_r <= newCfg_r; // @[CSR.scala 1078:17]
      end
    end
    reg_pmp_0_addr <= _GEN_412[29:0];
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_1_cfg_l <= 1'h0; // @[PMP.scala 40:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_1_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_1_cfg_l <= newCfg_1_l; // @[CSR.scala 1078:17]
      end
    end
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_1_cfg_a <= 2'h0; // @[PMP.scala 39:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_1_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_1_cfg_a <= newCfg_1_a; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_1_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_1_cfg_x <= newCfg_1_x; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_1_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_1_cfg_w <= newCfg_1_w & newCfg_1_r; // @[CSR.scala 1080:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_1_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_1_cfg_r <= newCfg_1_r; // @[CSR.scala 1078:17]
      end
    end
    reg_pmp_1_addr <= _GEN_419[29:0];
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_2_cfg_l <= 1'h0; // @[PMP.scala 40:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_2_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_2_cfg_l <= newCfg_2_l; // @[CSR.scala 1078:17]
      end
    end
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_2_cfg_a <= 2'h0; // @[PMP.scala 39:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_2_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_2_cfg_a <= newCfg_2_a; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_2_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_2_cfg_x <= newCfg_2_x; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_2_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_2_cfg_w <= newCfg_2_w & newCfg_2_r; // @[CSR.scala 1080:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_2_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_2_cfg_r <= newCfg_2_r; // @[CSR.scala 1078:17]
      end
    end
    reg_pmp_2_addr <= _GEN_426[29:0];
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_3_cfg_l <= 1'h0; // @[PMP.scala 40:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_3_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_3_cfg_l <= newCfg_3_l; // @[CSR.scala 1078:17]
      end
    end
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_3_cfg_a <= 2'h0; // @[PMP.scala 39:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_3_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_3_cfg_a <= newCfg_3_a; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_3_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_3_cfg_x <= newCfg_3_x; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_3_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_3_cfg_w <= newCfg_3_w & newCfg_3_r; // @[CSR.scala 1080:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_3_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_3_cfg_r <= newCfg_3_r; // @[CSR.scala 1078:17]
      end
    end
    reg_pmp_3_addr <= _GEN_433[29:0];
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_4_cfg_l <= 1'h0; // @[PMP.scala 40:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_4_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_4_cfg_l <= newCfg_4_l; // @[CSR.scala 1078:17]
      end
    end
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_4_cfg_a <= 2'h0; // @[PMP.scala 39:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_4_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_4_cfg_a <= newCfg_4_a; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_4_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_4_cfg_x <= newCfg_4_x; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_4_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_4_cfg_w <= newCfg_4_w & newCfg_4_r; // @[CSR.scala 1080:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_4_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_4_cfg_r <= newCfg_4_r; // @[CSR.scala 1078:17]
      end
    end
    reg_pmp_4_addr <= _GEN_440[29:0];
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_5_cfg_l <= 1'h0; // @[PMP.scala 40:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_5_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_5_cfg_l <= newCfg_5_l; // @[CSR.scala 1078:17]
      end
    end
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_5_cfg_a <= 2'h0; // @[PMP.scala 39:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_5_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_5_cfg_a <= newCfg_5_a; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_5_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_5_cfg_x <= newCfg_5_x; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_5_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_5_cfg_w <= newCfg_5_w & newCfg_5_r; // @[CSR.scala 1080:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_5_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_5_cfg_r <= newCfg_5_r; // @[CSR.scala 1078:17]
      end
    end
    reg_pmp_5_addr <= _GEN_447[29:0];
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_6_cfg_l <= 1'h0; // @[PMP.scala 40:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_6_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_6_cfg_l <= newCfg_6_l; // @[CSR.scala 1078:17]
      end
    end
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_6_cfg_a <= 2'h0; // @[PMP.scala 39:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_6_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_6_cfg_a <= newCfg_6_a; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_6_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_6_cfg_x <= newCfg_6_x; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_6_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_6_cfg_w <= newCfg_6_w & newCfg_6_r; // @[CSR.scala 1080:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_6_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_6_cfg_r <= newCfg_6_r; // @[CSR.scala 1078:17]
      end
    end
    reg_pmp_6_addr <= _GEN_454[29:0];
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_7_cfg_l <= 1'h0; // @[PMP.scala 40:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_7_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_7_cfg_l <= newCfg_7_l; // @[CSR.scala 1078:17]
      end
    end
    if (reset) begin // @[CSR.scala 1162:18]
      reg_pmp_7_cfg_a <= 2'h0; // @[PMP.scala 39:11]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_7_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_7_cfg_a <= newCfg_7_a; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_7_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_7_cfg_x <= newCfg_7_x; // @[CSR.scala 1078:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_7_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_7_cfg_w <= newCfg_7_w & newCfg_7_r; // @[CSR.scala 1080:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_182 & ~reg_pmp_7_cfg_l) begin // @[CSR.scala 1076:76]
        reg_pmp_7_cfg_r <= newCfg_7_r; // @[CSR.scala 1078:17]
      end
    end
    reg_pmp_7_addr <= _GEN_461[29:0];
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_172) begin // @[CSR.scala 1027:42]
        reg_mie <= _reg_mie_T_4; // @[CSR.scala 1027:52]
      end else if (_T_65) begin // @[CSR.scala 949:40]
        reg_mie <= _reg_mie_T; // @[CSR.scala 949:50]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_64) begin // @[CSR.scala 937:35]
        reg_mip_seip <= new_mip_seip; // @[CSR.scala 946:22]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_64) begin // @[CSR.scala 937:35]
        reg_mip_stip <= new_mip_stip; // @[CSR.scala 945:22]
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_171) begin // @[CSR.scala 1012:37]
        reg_mip_ssip <= new_sip_ssip; // @[CSR.scala 1014:22]
      end else if (_T_64) begin // @[CSR.scala 937:35]
        reg_mip_ssip <= new_mip_ssip; // @[CSR.scala 944:22]
      end
    end
    reg_mepc <= _GEN_357[39:0];
    if (reset) begin // @[CSR.scala 393:27]
      reg_mcause <= 64'h0; // @[CSR.scala 393:27]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_69) begin // @[CSR.scala 954:40]
        reg_mcause <= _reg_mcause_T; // @[CSR.scala 954:53]
      end else begin
        reg_mcause <= _GEN_149;
      end
    end else begin
      reg_mcause <= _GEN_149;
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_68) begin // @[CSR.scala 955:40]
        reg_mtval <= wdata[39:0]; // @[CSR.scala 955:52]
      end else begin
        reg_mtval <= _GEN_150;
      end
    end else begin
      reg_mtval <= _GEN_150;
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_66) begin // @[CSR.scala 951:40]
        reg_mscratch <= wdata; // @[CSR.scala 951:55]
      end
    end
    if (reset) begin // @[CSR.scala 398:27]
      reg_mtvec <= 32'h0; // @[CSR.scala 398:27]
    end else begin
      reg_mtvec <= _GEN_359[31:0];
    end
    reg_mcounteren <= _GEN_405[31:0];
    reg_scounteren <= _GEN_404[31:0];
    reg_sepc <= _GEN_398[39:0];
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_174) begin // @[CSR.scala 1031:42]
        reg_scause <= _reg_scause_T; // @[CSR.scala 1031:55]
      end else begin
        reg_scause <= _GEN_142;
      end
    end else begin
      reg_scause <= _GEN_142;
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_175) begin // @[CSR.scala 1032:42]
        reg_stval <= wdata[39:0]; // @[CSR.scala 1032:54]
      end else begin
        reg_stval <= _GEN_144;
      end
    end else begin
      reg_stval <= _GEN_144;
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_173) begin // @[CSR.scala 1028:42]
        reg_sscratch <= wdata; // @[CSR.scala 1028:57]
      end
    end
    reg_stvec <= _GEN_399[38:0];
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_176) begin // @[CSR.scala 1016:38]
        if (_T_2229) begin // @[CSR.scala 1020:62]
          reg_satp_mode <= _reg_satp_mode_T; // @[CSR.scala 1021:27]
        end
      end
    end
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_176) begin // @[CSR.scala 1016:38]
        if (_T_2229) begin // @[CSR.scala 1020:62]
          reg_satp_ppn <= {{24'd0}, new_satp_ppn[19:0]}; // @[CSR.scala 1022:26]
        end
      end
    end
    reg_fflags <= _GEN_386[4:0];
    reg_frm <= _GEN_387[2:0];
    if (reset) begin // @[CSR.scala 437:34]
      reg_mcountinhibit <= 9'h0; // @[CSR.scala 437:34]
    end else begin
      reg_mcountinhibit <= _GEN_380[8:0];
    end
    if (reset) begin // @[Counters.scala 45:37]
      value_lo <= 6'h0; // @[Counters.scala 45:37]
    end else begin
      value_lo <= _GEN_383[5:0];
    end
    if (reset) begin // @[Counters.scala 50:27]
      value_hi <= 58'h0; // @[Counters.scala 50:27]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_79) begin // @[CSR.scala 1206:31]
        value_hi <= wdata[63:6]; // @[Counters.scala 66:23]
      end else begin
        value_hi <= _GEN_1;
      end
    end else begin
      value_hi <= _GEN_1;
    end
    if (reset) begin // @[CSR.scala 442:46]
      reg_hpmevent_0 <= 64'h0; // @[CSR.scala 442:46]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_80) begin // @[CSR.scala 967:45]
        reg_hpmevent_0 <= _reg_hpmevent_0_T; // @[CSR.scala 967:49]
      end
    end
    if (reset) begin // @[CSR.scala 442:46]
      reg_hpmevent_1 <= 64'h0; // @[CSR.scala 442:46]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_83) begin // @[CSR.scala 967:45]
        reg_hpmevent_1 <= _reg_hpmevent_0_T; // @[CSR.scala 967:49]
      end
    end
    if (reset) begin // @[CSR.scala 442:46]
      reg_hpmevent_2 <= 64'h0; // @[CSR.scala 442:46]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_86) begin // @[CSR.scala 967:45]
        reg_hpmevent_2 <= _reg_hpmevent_0_T; // @[CSR.scala 967:49]
      end
    end
    if (reset) begin // @[CSR.scala 442:46]
      reg_hpmevent_3 <= 64'h0; // @[CSR.scala 442:46]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_89) begin // @[CSR.scala 967:45]
        reg_hpmevent_3 <= _reg_hpmevent_0_T; // @[CSR.scala 967:49]
      end
    end
    if (reset) begin // @[CSR.scala 442:46]
      reg_hpmevent_4 <= 64'h0; // @[CSR.scala 442:46]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_92) begin // @[CSR.scala 967:45]
        reg_hpmevent_4 <= _reg_hpmevent_0_T; // @[CSR.scala 967:49]
      end
    end
    if (reset) begin // @[CSR.scala 442:46]
      reg_hpmevent_5 <= 64'h0; // @[CSR.scala 442:46]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_95) begin // @[CSR.scala 967:45]
        reg_hpmevent_5 <= _reg_hpmevent_0_T; // @[CSR.scala 967:49]
      end
    end
    value_lo_2 <= _GEN_362[5:0];
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_81) begin // @[CSR.scala 1206:31]
        value_hi_2 <= wdata[39:6]; // @[Counters.scala 66:23]
      end else begin
        value_hi_2 <= _GEN_5;
      end
    end else begin
      value_hi_2 <= _GEN_5;
    end
    value_lo_3 <= _GEN_365[5:0];
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_84) begin // @[CSR.scala 1206:31]
        value_hi_3 <= wdata[39:6]; // @[Counters.scala 66:23]
      end else begin
        value_hi_3 <= _GEN_7;
      end
    end else begin
      value_hi_3 <= _GEN_7;
    end
    value_lo_4 <= _GEN_368[5:0];
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_87) begin // @[CSR.scala 1206:31]
        value_hi_4 <= wdata[39:6]; // @[Counters.scala 66:23]
      end else begin
        value_hi_4 <= _GEN_9;
      end
    end else begin
      value_hi_4 <= _GEN_9;
    end
    value_lo_5 <= _GEN_371[5:0];
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_90) begin // @[CSR.scala 1206:31]
        value_hi_5 <= wdata[39:6]; // @[Counters.scala 66:23]
      end else begin
        value_hi_5 <= _GEN_11;
      end
    end else begin
      value_hi_5 <= _GEN_11;
    end
    value_lo_6 <= _GEN_374[5:0];
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_93) begin // @[CSR.scala 1206:31]
        value_hi_6 <= wdata[39:6]; // @[Counters.scala 66:23]
      end else begin
        value_hi_6 <= _GEN_13;
      end
    end else begin
      value_hi_6 <= _GEN_13;
    end
    value_lo_7 <= _GEN_377[5:0];
    if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_96) begin // @[CSR.scala 1206:31]
        value_hi_7 <= wdata[39:6]; // @[Counters.scala 66:23]
      end else begin
        value_hi_7 <= _GEN_15;
      end
    end else begin
      value_hi_7 <= _GEN_15;
    end
    if (reset) begin // @[CSR.scala 629:43]
      reg_custom_0 <= 64'h0; // @[CSR.scala 629:43]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_200) begin // @[CSR.scala 1091:35]
        reg_custom_0 <= _reg_custom_0_T_3; // @[CSR.scala 1092:13]
      end
    end
    if (reg_mstatus_mprv & _T_312) begin // @[CSR.scala 735:35]
      io_status_dprv_REG <= reg_mstatus_mpp;
    end else begin
      io_status_dprv_REG <= reg_mstatus_prv;
    end
    if (reset) begin // @[Reg.scala 27:20]
      io_status_cease_r <= 1'h0; // @[Reg.scala 27:20]
    end else begin
      io_status_cease_r <= _GEN_193;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_284 <= 3'h1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: these conditions must be mutually exclusive\n    at CSR.scala:740 assert(PopCount(insn_ret :: insn_call :: insn_break :: io.exception :: Nil) <= 1, \"these conditions must be mutually exclusive\")\n"
            ); // @[CSR.scala 740:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_284 <= 3'h1 | reset)) begin
          $fatal; // @[CSR.scala 740:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_io_interrupt_T | io_retire <= 2'h1 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at CSR.scala:748 assert(!io.singleStep || io.retire <= UInt(1))\n"
            ); // @[CSR.scala 748:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_io_interrupt_T | io_retire <= 2'h1 | reset)) begin
          $fatal; // @[CSR.scala 748:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~reg_singleStepped | io_retire == 2'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at CSR.scala:749 assert(!reg_singleStepped || io.retire === UInt(0))\n"); // @[CSR.scala 749:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~reg_singleStepped | io_retire == 2'h0 | reset)) begin
          $fatal; // @[CSR.scala 749:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (set_fs_dirty & ~(reg_mstatus_fs > 2'h0 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at CSR.scala:878 assert(reg_mstatus.fs > 0)\n"); // @[CSR.scala 878:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (set_fs_dirty & ~(reg_mstatus_fs > 2'h0 | reset)) begin
          $fatal; // @[CSR.scala 878:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge io_ungated_clock) begin
    if (reset) begin // @[CSR.scala 428:50]
      reg_wfi <= 1'h0; // @[CSR.scala 428:50]
    end else if (|pending_interrupts | io_interrupts_debug | exception) begin // @[CSR.scala 743:69]
      reg_wfi <= 1'h0; // @[CSR.scala 743:79]
    end else begin
      reg_wfi <= _GEN_60;
    end
    if (reset) begin // @[Counters.scala 45:37]
      value_lo_1 <= 6'h0; // @[Counters.scala 45:37]
    end else begin
      value_lo_1 <= _GEN_381[5:0];
    end
    if (reset) begin // @[Counters.scala 50:27]
      value_hi_1 <= 58'h0; // @[Counters.scala 50:27]
    end else if (csr_wen) begin // @[CSR.scala 902:18]
      if (_T_78) begin // @[CSR.scala 1206:31]
        value_hi_1 <= wdata[63:6]; // @[Counters.scala 66:23]
      end else begin
        value_hi_1 <= _GEN_3;
      end
    end else begin
      value_hi_1 <= _GEN_3;
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
  reg_mstatus_prv = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  reg_mstatus_tsr = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_mstatus_tw = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg_mstatus_tvm = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  reg_mstatus_mxr = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  reg_mstatus_sum = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  reg_mstatus_mprv = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  reg_mstatus_fs = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  reg_mstatus_mpp = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  reg_mstatus_spp = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  reg_mstatus_mpie = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  reg_mstatus_spie = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  reg_mstatus_mie = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  reg_mstatus_sie = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  reg_dcsr_prv = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  reg_singleStepped = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  reg_dcsr_ebreakm = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  reg_dcsr_ebreaks = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  reg_dcsr_ebreaku = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  reg_debug = _RAND_19[0:0];
  _RAND_20 = {2{`RANDOM}};
  reg_mideleg = _RAND_20[63:0];
  _RAND_21 = {2{`RANDOM}};
  reg_medeleg = _RAND_21[63:0];
  _RAND_22 = {1{`RANDOM}};
  reg_dcsr_cause = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  reg_dcsr_step = _RAND_23[0:0];
  _RAND_24 = {2{`RANDOM}};
  reg_dpc = _RAND_24[39:0];
  _RAND_25 = {2{`RANDOM}};
  reg_dscratch = _RAND_25[63:0];
  _RAND_26 = {1{`RANDOM}};
  reg_pmp_0_cfg_l = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  reg_pmp_0_cfg_a = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  reg_pmp_0_cfg_x = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  reg_pmp_0_cfg_w = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  reg_pmp_0_cfg_r = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  reg_pmp_0_addr = _RAND_31[29:0];
  _RAND_32 = {1{`RANDOM}};
  reg_pmp_1_cfg_l = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  reg_pmp_1_cfg_a = _RAND_33[1:0];
  _RAND_34 = {1{`RANDOM}};
  reg_pmp_1_cfg_x = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  reg_pmp_1_cfg_w = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  reg_pmp_1_cfg_r = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  reg_pmp_1_addr = _RAND_37[29:0];
  _RAND_38 = {1{`RANDOM}};
  reg_pmp_2_cfg_l = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  reg_pmp_2_cfg_a = _RAND_39[1:0];
  _RAND_40 = {1{`RANDOM}};
  reg_pmp_2_cfg_x = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  reg_pmp_2_cfg_w = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  reg_pmp_2_cfg_r = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  reg_pmp_2_addr = _RAND_43[29:0];
  _RAND_44 = {1{`RANDOM}};
  reg_pmp_3_cfg_l = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  reg_pmp_3_cfg_a = _RAND_45[1:0];
  _RAND_46 = {1{`RANDOM}};
  reg_pmp_3_cfg_x = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  reg_pmp_3_cfg_w = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  reg_pmp_3_cfg_r = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  reg_pmp_3_addr = _RAND_49[29:0];
  _RAND_50 = {1{`RANDOM}};
  reg_pmp_4_cfg_l = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  reg_pmp_4_cfg_a = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  reg_pmp_4_cfg_x = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  reg_pmp_4_cfg_w = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  reg_pmp_4_cfg_r = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  reg_pmp_4_addr = _RAND_55[29:0];
  _RAND_56 = {1{`RANDOM}};
  reg_pmp_5_cfg_l = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  reg_pmp_5_cfg_a = _RAND_57[1:0];
  _RAND_58 = {1{`RANDOM}};
  reg_pmp_5_cfg_x = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  reg_pmp_5_cfg_w = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  reg_pmp_5_cfg_r = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  reg_pmp_5_addr = _RAND_61[29:0];
  _RAND_62 = {1{`RANDOM}};
  reg_pmp_6_cfg_l = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  reg_pmp_6_cfg_a = _RAND_63[1:0];
  _RAND_64 = {1{`RANDOM}};
  reg_pmp_6_cfg_x = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  reg_pmp_6_cfg_w = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  reg_pmp_6_cfg_r = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  reg_pmp_6_addr = _RAND_67[29:0];
  _RAND_68 = {1{`RANDOM}};
  reg_pmp_7_cfg_l = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  reg_pmp_7_cfg_a = _RAND_69[1:0];
  _RAND_70 = {1{`RANDOM}};
  reg_pmp_7_cfg_x = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  reg_pmp_7_cfg_w = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  reg_pmp_7_cfg_r = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  reg_pmp_7_addr = _RAND_73[29:0];
  _RAND_74 = {2{`RANDOM}};
  reg_mie = _RAND_74[63:0];
  _RAND_75 = {1{`RANDOM}};
  reg_mip_seip = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  reg_mip_stip = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  reg_mip_ssip = _RAND_77[0:0];
  _RAND_78 = {2{`RANDOM}};
  reg_mepc = _RAND_78[39:0];
  _RAND_79 = {2{`RANDOM}};
  reg_mcause = _RAND_79[63:0];
  _RAND_80 = {2{`RANDOM}};
  reg_mtval = _RAND_80[39:0];
  _RAND_81 = {2{`RANDOM}};
  reg_mscratch = _RAND_81[63:0];
  _RAND_82 = {1{`RANDOM}};
  reg_mtvec = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  reg_mcounteren = _RAND_83[31:0];
  _RAND_84 = {1{`RANDOM}};
  reg_scounteren = _RAND_84[31:0];
  _RAND_85 = {2{`RANDOM}};
  reg_sepc = _RAND_85[39:0];
  _RAND_86 = {2{`RANDOM}};
  reg_scause = _RAND_86[63:0];
  _RAND_87 = {2{`RANDOM}};
  reg_stval = _RAND_87[39:0];
  _RAND_88 = {2{`RANDOM}};
  reg_sscratch = _RAND_88[63:0];
  _RAND_89 = {2{`RANDOM}};
  reg_stvec = _RAND_89[38:0];
  _RAND_90 = {1{`RANDOM}};
  reg_satp_mode = _RAND_90[3:0];
  _RAND_91 = {2{`RANDOM}};
  reg_satp_ppn = _RAND_91[43:0];
  _RAND_92 = {1{`RANDOM}};
  reg_wfi = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  reg_fflags = _RAND_93[4:0];
  _RAND_94 = {1{`RANDOM}};
  reg_frm = _RAND_94[2:0];
  _RAND_95 = {1{`RANDOM}};
  reg_mcountinhibit = _RAND_95[8:0];
  _RAND_96 = {1{`RANDOM}};
  value_lo = _RAND_96[5:0];
  _RAND_97 = {2{`RANDOM}};
  value_hi = _RAND_97[57:0];
  _RAND_98 = {1{`RANDOM}};
  value_lo_1 = _RAND_98[5:0];
  _RAND_99 = {2{`RANDOM}};
  value_hi_1 = _RAND_99[57:0];
  _RAND_100 = {2{`RANDOM}};
  reg_hpmevent_0 = _RAND_100[63:0];
  _RAND_101 = {2{`RANDOM}};
  reg_hpmevent_1 = _RAND_101[63:0];
  _RAND_102 = {2{`RANDOM}};
  reg_hpmevent_2 = _RAND_102[63:0];
  _RAND_103 = {2{`RANDOM}};
  reg_hpmevent_3 = _RAND_103[63:0];
  _RAND_104 = {2{`RANDOM}};
  reg_hpmevent_4 = _RAND_104[63:0];
  _RAND_105 = {2{`RANDOM}};
  reg_hpmevent_5 = _RAND_105[63:0];
  _RAND_106 = {1{`RANDOM}};
  value_lo_2 = _RAND_106[5:0];
  _RAND_107 = {2{`RANDOM}};
  value_hi_2 = _RAND_107[33:0];
  _RAND_108 = {1{`RANDOM}};
  value_lo_3 = _RAND_108[5:0];
  _RAND_109 = {2{`RANDOM}};
  value_hi_3 = _RAND_109[33:0];
  _RAND_110 = {1{`RANDOM}};
  value_lo_4 = _RAND_110[5:0];
  _RAND_111 = {2{`RANDOM}};
  value_hi_4 = _RAND_111[33:0];
  _RAND_112 = {1{`RANDOM}};
  value_lo_5 = _RAND_112[5:0];
  _RAND_113 = {2{`RANDOM}};
  value_hi_5 = _RAND_113[33:0];
  _RAND_114 = {1{`RANDOM}};
  value_lo_6 = _RAND_114[5:0];
  _RAND_115 = {2{`RANDOM}};
  value_hi_6 = _RAND_115[33:0];
  _RAND_116 = {1{`RANDOM}};
  value_lo_7 = _RAND_116[5:0];
  _RAND_117 = {2{`RANDOM}};
  value_hi_7 = _RAND_117[33:0];
  _RAND_118 = {2{`RANDOM}};
  reg_custom_0 = _RAND_118[63:0];
  _RAND_119 = {1{`RANDOM}};
  io_status_dprv_REG = _RAND_119[1:0];
  _RAND_120 = {1{`RANDOM}};
  io_status_cease_r = _RAND_120[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
