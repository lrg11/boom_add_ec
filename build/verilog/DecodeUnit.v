module DecodeUnit(
  input         clock,
  input         reset,
  input  [6:0]  io_enq_uop_uopc,
  input  [31:0] io_enq_uop_inst,
  input  [31:0] io_enq_uop_debug_inst,
  input         io_enq_uop_is_rvc,
  input  [39:0] io_enq_uop_debug_pc,
  input  [2:0]  io_enq_uop_iq_type,
  input  [9:0]  io_enq_uop_fu_code,
  input  [3:0]  io_enq_uop_ctrl_br_type,
  input  [1:0]  io_enq_uop_ctrl_op1_sel,
  input  [2:0]  io_enq_uop_ctrl_op2_sel,
  input  [2:0]  io_enq_uop_ctrl_imm_sel,
  input  [3:0]  io_enq_uop_ctrl_op_fcn,
  input         io_enq_uop_ctrl_fcn_dw,
  input  [2:0]  io_enq_uop_ctrl_csr_cmd,
  input         io_enq_uop_ctrl_is_load,
  input         io_enq_uop_ctrl_is_sta,
  input         io_enq_uop_ctrl_is_std,
  input  [1:0]  io_enq_uop_iw_state,
  input         io_enq_uop_iw_p1_poisoned,
  input         io_enq_uop_iw_p2_poisoned,
  input         io_enq_uop_is_br,
  input         io_enq_uop_is_jalr,
  input         io_enq_uop_is_jal,
  input         io_enq_uop_is_sfb,
  input  [11:0] io_enq_uop_br_mask,
  input  [3:0]  io_enq_uop_br_tag,
  input  [4:0]  io_enq_uop_ftq_idx,
  input         io_enq_uop_edge_inst,
  input  [5:0]  io_enq_uop_pc_lob,
  input         io_enq_uop_taken,
  input  [19:0] io_enq_uop_imm_packed,
  input  [11:0] io_enq_uop_csr_addr,
  input  [5:0]  io_enq_uop_rob_idx,
  input  [3:0]  io_enq_uop_ldq_idx,
  input  [3:0]  io_enq_uop_stq_idx,
  input  [1:0]  io_enq_uop_rxq_idx,
  input  [5:0]  io_enq_uop_pdst,
  input  [5:0]  io_enq_uop_prs1,
  input  [5:0]  io_enq_uop_prs2,
  input  [5:0]  io_enq_uop_prs3,
  input  [4:0]  io_enq_uop_ppred,
  input         io_enq_uop_prs1_busy,
  input         io_enq_uop_prs2_busy,
  input         io_enq_uop_prs3_busy,
  input         io_enq_uop_ppred_busy,
  input  [5:0]  io_enq_uop_stale_pdst,
  input         io_enq_uop_exception,
  input  [63:0] io_enq_uop_exc_cause,
  input         io_enq_uop_bypassable,
  input  [4:0]  io_enq_uop_mem_cmd,
  input  [1:0]  io_enq_uop_mem_size,
  input         io_enq_uop_mem_signed,
  input         io_enq_uop_is_fence,
  input         io_enq_uop_is_fencei,
  input         io_enq_uop_is_amo,
  input         io_enq_uop_uses_ldq,
  input         io_enq_uop_uses_stq,
  input         io_enq_uop_is_sys_pc2epc,
  input         io_enq_uop_is_unique,
  input         io_enq_uop_flush_on_commit,
  input         io_enq_uop_ldst_is_rs1,
  input  [5:0]  io_enq_uop_ldst,
  input  [5:0]  io_enq_uop_lrs1,
  input  [5:0]  io_enq_uop_lrs2,
  input  [5:0]  io_enq_uop_lrs3,
  input         io_enq_uop_ldst_val,
  input  [1:0]  io_enq_uop_dst_rtype,
  input  [1:0]  io_enq_uop_lrs1_rtype,
  input  [1:0]  io_enq_uop_lrs2_rtype,
  input         io_enq_uop_frs3_en,
  input         io_enq_uop_fp_val,
  input         io_enq_uop_fp_single,
  input         io_enq_uop_xcpt_pf_if,
  input         io_enq_uop_xcpt_ae_if,
  input         io_enq_uop_xcpt_ma_if,
  input         io_enq_uop_bp_debug_if,
  input         io_enq_uop_bp_xcpt_if,
  input  [1:0]  io_enq_uop_debug_fsrc,
  input  [1:0]  io_enq_uop_debug_tsrc,
  output [6:0]  io_deq_uop_uopc,
  output [31:0] io_deq_uop_inst,
  output [31:0] io_deq_uop_debug_inst,
  output        io_deq_uop_is_rvc,
  output [39:0] io_deq_uop_debug_pc,
  output [2:0]  io_deq_uop_iq_type,
  output [9:0]  io_deq_uop_fu_code,
  output [3:0]  io_deq_uop_ctrl_br_type,
  output [1:0]  io_deq_uop_ctrl_op1_sel,
  output [2:0]  io_deq_uop_ctrl_op2_sel,
  output [2:0]  io_deq_uop_ctrl_imm_sel,
  output [3:0]  io_deq_uop_ctrl_op_fcn,
  output        io_deq_uop_ctrl_fcn_dw,
  output [2:0]  io_deq_uop_ctrl_csr_cmd,
  output        io_deq_uop_ctrl_is_load,
  output        io_deq_uop_ctrl_is_sta,
  output        io_deq_uop_ctrl_is_std,
  output [1:0]  io_deq_uop_iw_state,
  output        io_deq_uop_iw_p1_poisoned,
  output        io_deq_uop_iw_p2_poisoned,
  output        io_deq_uop_is_br,
  output        io_deq_uop_is_jalr,
  output        io_deq_uop_is_jal,
  output        io_deq_uop_is_sfb,
  output [11:0] io_deq_uop_br_mask,
  output [3:0]  io_deq_uop_br_tag,
  output [4:0]  io_deq_uop_ftq_idx,
  output        io_deq_uop_edge_inst,
  output [5:0]  io_deq_uop_pc_lob,
  output        io_deq_uop_taken,
  output [19:0] io_deq_uop_imm_packed,
  output [11:0] io_deq_uop_csr_addr,
  output [5:0]  io_deq_uop_rob_idx,
  output [3:0]  io_deq_uop_ldq_idx,
  output [3:0]  io_deq_uop_stq_idx,
  output [1:0]  io_deq_uop_rxq_idx,
  output [5:0]  io_deq_uop_pdst,
  output [5:0]  io_deq_uop_prs1,
  output [5:0]  io_deq_uop_prs2,
  output [5:0]  io_deq_uop_prs3,
  output [4:0]  io_deq_uop_ppred,
  output        io_deq_uop_prs1_busy,
  output        io_deq_uop_prs2_busy,
  output        io_deq_uop_prs3_busy,
  output        io_deq_uop_ppred_busy,
  output [5:0]  io_deq_uop_stale_pdst,
  output        io_deq_uop_exception,
  output [63:0] io_deq_uop_exc_cause,
  output        io_deq_uop_bypassable,
  output [4:0]  io_deq_uop_mem_cmd,
  output [1:0]  io_deq_uop_mem_size,
  output        io_deq_uop_mem_signed,
  output        io_deq_uop_is_fence,
  output        io_deq_uop_is_fencei,
  output        io_deq_uop_is_amo,
  output        io_deq_uop_uses_ldq,
  output        io_deq_uop_uses_stq,
  output        io_deq_uop_is_sys_pc2epc,
  output        io_deq_uop_is_unique,
  output        io_deq_uop_flush_on_commit,
  output        io_deq_uop_ldst_is_rs1,
  output [5:0]  io_deq_uop_ldst,
  output [5:0]  io_deq_uop_lrs1,
  output [5:0]  io_deq_uop_lrs2,
  output [5:0]  io_deq_uop_lrs3,
  output        io_deq_uop_ldst_val,
  output [1:0]  io_deq_uop_dst_rtype,
  output [1:0]  io_deq_uop_lrs1_rtype,
  output [1:0]  io_deq_uop_lrs2_rtype,
  output        io_deq_uop_frs3_en,
  output        io_deq_uop_fp_val,
  output        io_deq_uop_fp_single,
  output        io_deq_uop_xcpt_pf_if,
  output        io_deq_uop_xcpt_ae_if,
  output        io_deq_uop_xcpt_ma_if,
  output        io_deq_uop_bp_debug_if,
  output        io_deq_uop_bp_xcpt_if,
  output [1:0]  io_deq_uop_debug_fsrc,
  output [1:0]  io_deq_uop_debug_tsrc,
  input         io_status_debug,
  input         io_status_cease,
  input         io_status_wfi,
  input  [31:0] io_status_isa,
  input  [1:0]  io_status_dprv,
  input  [1:0]  io_status_prv,
  input         io_status_sd,
  input  [26:0] io_status_zero2,
  input  [1:0]  io_status_sxl,
  input  [1:0]  io_status_uxl,
  input         io_status_sd_rv32,
  input  [7:0]  io_status_zero1,
  input         io_status_tsr,
  input         io_status_tw,
  input         io_status_tvm,
  input         io_status_mxr,
  input         io_status_sum,
  input         io_status_mprv,
  input  [1:0]  io_status_xs,
  input  [1:0]  io_status_fs,
  input  [1:0]  io_status_mpp,
  input  [1:0]  io_status_vs,
  input         io_status_spp,
  input         io_status_mpie,
  input         io_status_hpie,
  input         io_status_spie,
  input         io_status_upie,
  input         io_status_mie,
  input         io_status_hie,
  input         io_status_sie,
  input         io_status_uie,
  output [11:0] io_csr_decode_csr,
  input         io_csr_decode_fp_illegal,
  input         io_csr_decode_vector_illegal,
  input         io_csr_decode_fp_csr,
  input         io_csr_decode_rocc_illegal,
  input         io_csr_decode_read_illegal,
  input         io_csr_decode_write_illegal,
  input         io_csr_decode_write_flush,
  input         io_csr_decode_system_illegal,
  input         io_interrupt,
  input  [63:0] io_interrupt_cause
);
  wire [31:0] _bit_T = io_enq_uop_inst & 32'h707f; // @[Decode.scala 14:65]
  wire  _bit_T_1 = _bit_T == 32'h2003; // @[Decode.scala 14:121]
  wire  _bit_T_3 = _bit_T == 32'h1003; // @[Decode.scala 14:121]
  wire  _bit_T_5 = _bit_T == 32'h5003; // @[Decode.scala 14:121]
  wire  _bit_T_7 = _bit_T == 32'h3; // @[Decode.scala 14:121]
  wire  _bit_T_9 = _bit_T == 32'h4003; // @[Decode.scala 14:121]
  wire  _bit_T_11 = _bit_T == 32'h2023; // @[Decode.scala 14:121]
  wire  _bit_T_13 = _bit_T == 32'h1023; // @[Decode.scala 14:121]
  wire  _bit_T_15 = _bit_T == 32'h23; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_16 = io_enq_uop_inst & 32'h7f; // @[Decode.scala 14:65]
  wire  _bit_T_17 = _bit_T_16 == 32'h37; // @[Decode.scala 14:121]
  wire  _bit_T_19 = _bit_T == 32'h13; // @[Decode.scala 14:121]
  wire  _bit_T_21 = _bit_T == 32'h7013; // @[Decode.scala 14:121]
  wire  _bit_T_23 = _bit_T == 32'h6013; // @[Decode.scala 14:121]
  wire  _bit_T_25 = _bit_T == 32'h4013; // @[Decode.scala 14:121]
  wire  _bit_T_27 = _bit_T == 32'h2013; // @[Decode.scala 14:121]
  wire  _bit_T_29 = _bit_T == 32'h3013; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_30 = io_enq_uop_inst & 32'hfe00707f; // @[Decode.scala 14:65]
  wire  _bit_T_31 = _bit_T_30 == 32'h1033; // @[Decode.scala 14:121]
  wire  _bit_T_33 = _bit_T_30 == 32'h33; // @[Decode.scala 14:121]
  wire  _bit_T_35 = _bit_T_30 == 32'h40000033; // @[Decode.scala 14:121]
  wire  _bit_T_37 = _bit_T_30 == 32'h2033; // @[Decode.scala 14:121]
  wire  _bit_T_39 = _bit_T_30 == 32'h3033; // @[Decode.scala 14:121]
  wire  _bit_T_41 = _bit_T_30 == 32'h7033; // @[Decode.scala 14:121]
  wire  _bit_T_43 = _bit_T_30 == 32'h6033; // @[Decode.scala 14:121]
  wire  _bit_T_45 = _bit_T_30 == 32'h4033; // @[Decode.scala 14:121]
  wire  _bit_T_47 = _bit_T_30 == 32'h40005033; // @[Decode.scala 14:121]
  wire  _bit_T_49 = _bit_T_30 == 32'h5033; // @[Decode.scala 14:121]
  wire  _bit_T_51 = _bit_T_30 == 32'h2000033; // @[Decode.scala 14:121]
  wire  _bit_T_53 = _bit_T_30 == 32'h2001033; // @[Decode.scala 14:121]
  wire  _bit_T_55 = _bit_T_30 == 32'h2003033; // @[Decode.scala 14:121]
  wire  _bit_T_57 = _bit_T_30 == 32'h2002033; // @[Decode.scala 14:121]
  wire  _bit_T_59 = _bit_T_30 == 32'h200003b; // @[Decode.scala 14:121]
  wire  _bit_T_61 = _bit_T_30 == 32'h2004033; // @[Decode.scala 14:121]
  wire  _bit_T_63 = _bit_T_30 == 32'h2005033; // @[Decode.scala 14:121]
  wire  _bit_T_65 = _bit_T_30 == 32'h2006033; // @[Decode.scala 14:121]
  wire  _bit_T_67 = _bit_T_30 == 32'h2007033; // @[Decode.scala 14:121]
  wire  _bit_T_69 = _bit_T_30 == 32'h200403b; // @[Decode.scala 14:121]
  wire  _bit_T_71 = _bit_T_30 == 32'h200503b; // @[Decode.scala 14:121]
  wire  _bit_T_73 = _bit_T_30 == 32'h200603b; // @[Decode.scala 14:121]
  wire  _bit_T_75 = _bit_T_30 == 32'h200703b; // @[Decode.scala 14:121]
  wire  _bit_T_77 = _bit_T_16 == 32'h17; // @[Decode.scala 14:121]
  wire  _bit_T_79 = _bit_T_16 == 32'h6f; // @[Decode.scala 14:121]
  wire  _bit_T_81 = _bit_T == 32'h67; // @[Decode.scala 14:121]
  wire  _bit_T_83 = _bit_T == 32'h63; // @[Decode.scala 14:121]
  wire  _bit_T_85 = _bit_T == 32'h1063; // @[Decode.scala 14:121]
  wire  _bit_T_87 = _bit_T == 32'h5063; // @[Decode.scala 14:121]
  wire  _bit_T_89 = _bit_T == 32'h7063; // @[Decode.scala 14:121]
  wire  _bit_T_91 = _bit_T == 32'h4063; // @[Decode.scala 14:121]
  wire  _bit_T_93 = _bit_T == 32'h6063; // @[Decode.scala 14:121]
  wire  _bit_T_95 = _bit_T == 32'h1073; // @[Decode.scala 14:121]
  wire  _bit_T_97 = _bit_T == 32'h2073; // @[Decode.scala 14:121]
  wire  _bit_T_99 = _bit_T == 32'h3073; // @[Decode.scala 14:121]
  wire  _bit_T_101 = _bit_T == 32'h5073; // @[Decode.scala 14:121]
  wire  _bit_T_103 = _bit_T == 32'h6073; // @[Decode.scala 14:121]
  wire  _bit_T_105 = _bit_T == 32'h7073; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_106 = io_enq_uop_inst & 32'hfe007fff; // @[Decode.scala 14:65]
  wire  _bit_T_107 = _bit_T_106 == 32'h12000073; // @[Decode.scala 14:121]
  wire  _bit_T_108 = io_enq_uop_inst == 32'h73; // @[Decode.scala 14:121]
  wire  _bit_T_109 = io_enq_uop_inst == 32'h100073; // @[Decode.scala 14:121]
  wire  _bit_T_110 = io_enq_uop_inst == 32'h10200073; // @[Decode.scala 14:121]
  wire  _bit_T_111 = io_enq_uop_inst == 32'h30200073; // @[Decode.scala 14:121]
  wire  _bit_T_112 = io_enq_uop_inst == 32'h7b200073; // @[Decode.scala 14:121]
  wire  _bit_T_113 = io_enq_uop_inst == 32'h10500073; // @[Decode.scala 14:121]
  wire  bit_4 = _bit_T == 32'h100f; // @[Decode.scala 14:121]
  wire  _bit_T_117 = _bit_T == 32'hf; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_118 = io_enq_uop_inst & 32'hf800707f; // @[Decode.scala 14:65]
  wire  _bit_T_119 = _bit_T_118 == 32'h202f; // @[Decode.scala 14:121]
  wire  _bit_T_121 = _bit_T_118 == 32'h2000202f; // @[Decode.scala 14:121]
  wire  _bit_T_123 = _bit_T_118 == 32'h800202f; // @[Decode.scala 14:121]
  wire  _bit_T_125 = _bit_T_118 == 32'h6000202f; // @[Decode.scala 14:121]
  wire  _bit_T_127 = _bit_T_118 == 32'h4000202f; // @[Decode.scala 14:121]
  wire  _bit_T_129 = _bit_T_118 == 32'h8000202f; // @[Decode.scala 14:121]
  wire  _bit_T_131 = _bit_T_118 == 32'hc000202f; // @[Decode.scala 14:121]
  wire  _bit_T_133 = _bit_T_118 == 32'ha000202f; // @[Decode.scala 14:121]
  wire  _bit_T_135 = _bit_T_118 == 32'he000202f; // @[Decode.scala 14:121]
  wire  _bit_T_137 = _bit_T_118 == 32'h302f; // @[Decode.scala 14:121]
  wire  _bit_T_139 = _bit_T_118 == 32'h2000302f; // @[Decode.scala 14:121]
  wire  _bit_T_141 = _bit_T_118 == 32'h800302f; // @[Decode.scala 14:121]
  wire  _bit_T_143 = _bit_T_118 == 32'h6000302f; // @[Decode.scala 14:121]
  wire  _bit_T_145 = _bit_T_118 == 32'h4000302f; // @[Decode.scala 14:121]
  wire  _bit_T_147 = _bit_T_118 == 32'h8000302f; // @[Decode.scala 14:121]
  wire  _bit_T_149 = _bit_T_118 == 32'hc000302f; // @[Decode.scala 14:121]
  wire  _bit_T_151 = _bit_T_118 == 32'ha000302f; // @[Decode.scala 14:121]
  wire  _bit_T_153 = _bit_T_118 == 32'he000302f; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_154 = io_enq_uop_inst & 32'hf9f0707f; // @[Decode.scala 14:65]
  wire  _bit_T_155 = _bit_T_154 == 32'h1000202f; // @[Decode.scala 14:121]
  wire  _bit_T_157 = _bit_T_154 == 32'h1000302f; // @[Decode.scala 14:121]
  wire  _bit_T_159 = _bit_T_118 == 32'h1800202f; // @[Decode.scala 14:121]
  wire  _bit_T_161 = _bit_T_118 == 32'h1800302f; // @[Decode.scala 14:121]
  wire  _bit_T_163 = _bit_T == 32'h2007; // @[Decode.scala 14:121]
  wire  _bit_T_165 = _bit_T == 32'h3007; // @[Decode.scala 14:121]
  wire  _bit_T_167 = _bit_T == 32'h2027; // @[Decode.scala 14:121]
  wire  _bit_T_169 = _bit_T == 32'h3027; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_170 = io_enq_uop_inst & 32'hfff0707f; // @[Decode.scala 14:65]
  wire  _bit_T_171 = _bit_T_170 == 32'he0001053; // @[Decode.scala 14:121]
  wire  _bit_T_173 = _bit_T_170 == 32'he2001053; // @[Decode.scala 14:121]
  wire  _bit_T_175 = _bit_T_170 == 32'hf0000053; // @[Decode.scala 14:121]
  wire  _bit_T_177 = _bit_T_170 == 32'hf2000053; // @[Decode.scala 14:121]
  wire  _bit_T_179 = _bit_T_170 == 32'he0000053; // @[Decode.scala 14:121]
  wire  _bit_T_181 = _bit_T_170 == 32'he2000053; // @[Decode.scala 14:121]
  wire  _bit_T_183 = _bit_T_30 == 32'h20000053; // @[Decode.scala 14:121]
  wire  _bit_T_185 = _bit_T_30 == 32'h22000053; // @[Decode.scala 14:121]
  wire  _bit_T_187 = _bit_T_30 == 32'h20002053; // @[Decode.scala 14:121]
  wire  _bit_T_189 = _bit_T_30 == 32'h22002053; // @[Decode.scala 14:121]
  wire  _bit_T_191 = _bit_T_30 == 32'h20001053; // @[Decode.scala 14:121]
  wire  _bit_T_193 = _bit_T_30 == 32'h22001053; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_194 = io_enq_uop_inst & 32'hfff0007f; // @[Decode.scala 14:65]
  wire  _bit_T_195 = _bit_T_194 == 32'h40100053; // @[Decode.scala 14:121]
  wire  _bit_T_197 = _bit_T_194 == 32'h42000053; // @[Decode.scala 14:121]
  wire  _bit_T_199 = _bit_T_194 == 32'hd0000053; // @[Decode.scala 14:121]
  wire  _bit_T_201 = _bit_T_194 == 32'hd0100053; // @[Decode.scala 14:121]
  wire  _bit_T_203 = _bit_T_194 == 32'hd0200053; // @[Decode.scala 14:121]
  wire  _bit_T_205 = _bit_T_194 == 32'hd0300053; // @[Decode.scala 14:121]
  wire  _bit_T_207 = _bit_T_194 == 32'hd2000053; // @[Decode.scala 14:121]
  wire  _bit_T_209 = _bit_T_194 == 32'hd2100053; // @[Decode.scala 14:121]
  wire  _bit_T_211 = _bit_T_194 == 32'hd2200053; // @[Decode.scala 14:121]
  wire  _bit_T_213 = _bit_T_194 == 32'hd2300053; // @[Decode.scala 14:121]
  wire  _bit_T_215 = _bit_T_194 == 32'hc0000053; // @[Decode.scala 14:121]
  wire  _bit_T_217 = _bit_T_194 == 32'hc0100053; // @[Decode.scala 14:121]
  wire  _bit_T_219 = _bit_T_194 == 32'hc0200053; // @[Decode.scala 14:121]
  wire  _bit_T_221 = _bit_T_194 == 32'hc0300053; // @[Decode.scala 14:121]
  wire  _bit_T_223 = _bit_T_194 == 32'hc2000053; // @[Decode.scala 14:121]
  wire  _bit_T_225 = _bit_T_194 == 32'hc2100053; // @[Decode.scala 14:121]
  wire  _bit_T_227 = _bit_T_194 == 32'hc2200053; // @[Decode.scala 14:121]
  wire  _bit_T_229 = _bit_T_194 == 32'hc2300053; // @[Decode.scala 14:121]
  wire  _bit_T_231 = _bit_T_30 == 32'ha0002053; // @[Decode.scala 14:121]
  wire  _bit_T_233 = _bit_T_30 == 32'ha0001053; // @[Decode.scala 14:121]
  wire  _bit_T_235 = _bit_T_30 == 32'ha0000053; // @[Decode.scala 14:121]
  wire  _bit_T_237 = _bit_T_30 == 32'ha2002053; // @[Decode.scala 14:121]
  wire  _bit_T_239 = _bit_T_30 == 32'ha2001053; // @[Decode.scala 14:121]
  wire  _bit_T_241 = _bit_T_30 == 32'ha2000053; // @[Decode.scala 14:121]
  wire  _bit_T_243 = _bit_T_30 == 32'h28000053; // @[Decode.scala 14:121]
  wire  _bit_T_245 = _bit_T_30 == 32'h28001053; // @[Decode.scala 14:121]
  wire  _bit_T_247 = _bit_T_30 == 32'h2a000053; // @[Decode.scala 14:121]
  wire  _bit_T_249 = _bit_T_30 == 32'h2a001053; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_250 = io_enq_uop_inst & 32'hfe00007f; // @[Decode.scala 14:65]
  wire  _bit_T_251 = _bit_T_250 == 32'h53; // @[Decode.scala 14:121]
  wire  _bit_T_253 = _bit_T_250 == 32'h8000053; // @[Decode.scala 14:121]
  wire  _bit_T_255 = _bit_T_250 == 32'h10000053; // @[Decode.scala 14:121]
  wire  _bit_T_257 = _bit_T_250 == 32'h2000053; // @[Decode.scala 14:121]
  wire  _bit_T_259 = _bit_T_250 == 32'ha000053; // @[Decode.scala 14:121]
  wire  _bit_T_261 = _bit_T_250 == 32'h12000053; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_262 = io_enq_uop_inst & 32'h600007f; // @[Decode.scala 14:65]
  wire  _bit_T_263 = _bit_T_262 == 32'h43; // @[Decode.scala 14:121]
  wire  _bit_T_265 = _bit_T_262 == 32'h47; // @[Decode.scala 14:121]
  wire  _bit_T_267 = _bit_T_262 == 32'h4f; // @[Decode.scala 14:121]
  wire  _bit_T_269 = _bit_T_262 == 32'h4b; // @[Decode.scala 14:121]
  wire  _bit_T_271 = _bit_T_262 == 32'h2000043; // @[Decode.scala 14:121]
  wire  _bit_T_273 = _bit_T_262 == 32'h2000047; // @[Decode.scala 14:121]
  wire  _bit_T_275 = _bit_T_262 == 32'h200004f; // @[Decode.scala 14:121]
  wire  _bit_T_277 = _bit_T_262 == 32'h200004b; // @[Decode.scala 14:121]
  wire  _bit_T_279 = _bit_T_250 == 32'h18000053; // @[Decode.scala 14:121]
  wire  _bit_T_281 = _bit_T_250 == 32'h1a000053; // @[Decode.scala 14:121]
  wire  _bit_T_283 = _bit_T_194 == 32'h58000053; // @[Decode.scala 14:121]
  wire  _bit_T_285 = _bit_T_194 == 32'h5a000053; // @[Decode.scala 14:121]
  wire  _bit_T_287 = _bit_T == 32'h3003; // @[Decode.scala 14:121]
  wire  _bit_T_289 = _bit_T == 32'h6003; // @[Decode.scala 14:121]
  wire  _bit_T_291 = _bit_T == 32'h3023; // @[Decode.scala 14:121]
  wire [31:0] _bit_T_292 = io_enq_uop_inst & 32'hfc00707f; // @[Decode.scala 14:65]
  wire  _bit_T_293 = _bit_T_292 == 32'h1013; // @[Decode.scala 14:121]
  wire  _bit_T_295 = _bit_T_292 == 32'h5013; // @[Decode.scala 14:121]
  wire  _bit_T_297 = _bit_T_292 == 32'h40005013; // @[Decode.scala 14:121]
  wire  _bit_T_299 = _bit_T == 32'h1b; // @[Decode.scala 14:121]
  wire  _bit_T_301 = _bit_T_30 == 32'h101b; // @[Decode.scala 14:121]
  wire  _bit_T_303 = _bit_T_30 == 32'h4000501b; // @[Decode.scala 14:121]
  wire  _bit_T_305 = _bit_T_30 == 32'h501b; // @[Decode.scala 14:121]
  wire  _bit_T_307 = _bit_T_30 == 32'h3b; // @[Decode.scala 14:121]
  wire  _bit_T_309 = _bit_T_30 == 32'h4000003b; // @[Decode.scala 14:121]
  wire  _bit_T_311 = _bit_T_30 == 32'h103b; // @[Decode.scala 14:121]
  wire  _bit_T_313 = _bit_T_30 == 32'h4000503b; // @[Decode.scala 14:121]
  wire  _bit_T_315 = _bit_T_30 == 32'h503b; // @[Decode.scala 14:121]
  wire  _bit_T_346 = _bit_T_1 | _bit_T_3 | _bit_T_5 | _bit_T_7 | _bit_T_9 | _bit_T_11 | _bit_T_13 | _bit_T_15 |
    _bit_T_17 | _bit_T_19 | _bit_T_21 | _bit_T_23 | _bit_T_25 | _bit_T_27 | _bit_T_29 | _bit_T_31 | _bit_T_33 |
    _bit_T_35 | _bit_T_37 | _bit_T_39 | _bit_T_41 | _bit_T_43 | _bit_T_45 | _bit_T_47 | _bit_T_49 | _bit_T_51 |
    _bit_T_53 | _bit_T_55 | _bit_T_57 | _bit_T_59 | _bit_T_61; // @[Decode.scala 15:30]
  wire  _bit_T_376 = _bit_T_346 | _bit_T_63 | _bit_T_65 | _bit_T_67 | _bit_T_69 | _bit_T_71 | _bit_T_73 | _bit_T_75 |
    _bit_T_77 | _bit_T_79 | _bit_T_81 | _bit_T_83 | _bit_T_85 | _bit_T_87 | _bit_T_89 | _bit_T_91 | _bit_T_93 |
    _bit_T_95 | _bit_T_97 | _bit_T_99 | _bit_T_101 | _bit_T_103 | _bit_T_105 | _bit_T_107 | _bit_T_108 | _bit_T_109 |
    _bit_T_110 | _bit_T_111 | _bit_T_112 | _bit_T_113 | bit_4; // @[Decode.scala 15:30]
  wire  _bit_T_406 = _bit_T_376 | _bit_T_117 | _bit_T_119 | _bit_T_121 | _bit_T_123 | _bit_T_125 | _bit_T_127 |
    _bit_T_129 | _bit_T_131 | _bit_T_133 | _bit_T_135 | _bit_T_137 | _bit_T_139 | _bit_T_141 | _bit_T_143 | _bit_T_145
     | _bit_T_147 | _bit_T_149 | _bit_T_151 | _bit_T_153 | _bit_T_155 | _bit_T_157 | _bit_T_159 | _bit_T_161 |
    _bit_T_163 | _bit_T_165 | _bit_T_167 | _bit_T_169 | _bit_T_171 | _bit_T_173 | _bit_T_175; // @[Decode.scala 15:30]
  wire  _bit_T_436 = _bit_T_406 | _bit_T_177 | _bit_T_179 | _bit_T_181 | _bit_T_183 | _bit_T_185 | _bit_T_187 |
    _bit_T_189 | _bit_T_191 | _bit_T_193 | _bit_T_195 | _bit_T_197 | _bit_T_199 | _bit_T_201 | _bit_T_203 | _bit_T_205
     | _bit_T_207 | _bit_T_209 | _bit_T_211 | _bit_T_213 | _bit_T_215 | _bit_T_217 | _bit_T_219 | _bit_T_221 |
    _bit_T_223 | _bit_T_225 | _bit_T_227 | _bit_T_229 | _bit_T_231 | _bit_T_233 | _bit_T_235; // @[Decode.scala 15:30]
  wire  _bit_T_466 = _bit_T_436 | _bit_T_237 | _bit_T_239 | _bit_T_241 | _bit_T_243 | _bit_T_245 | _bit_T_247 |
    _bit_T_249 | _bit_T_251 | _bit_T_253 | _bit_T_255 | _bit_T_257 | _bit_T_259 | _bit_T_261 | _bit_T_263 | _bit_T_265
     | _bit_T_267 | _bit_T_269 | _bit_T_271 | _bit_T_273 | _bit_T_275 | _bit_T_277 | _bit_T_279 | _bit_T_281 |
    _bit_T_283 | _bit_T_285 | _bit_T_287 | _bit_T_289 | _bit_T_291 | _bit_T_293 | _bit_T_295; // @[Decode.scala 15:30]
  wire  bit_ = _bit_T_466 | _bit_T_297 | _bit_T_299 | _bit_T_301 | _bit_T_303 | _bit_T_305 | _bit_T_307 | _bit_T_309 |
    _bit_T_311 | _bit_T_313 | _bit_T_315; // @[Decode.scala 15:30]
  wire  _bit_T_506 = _bit_T_163 | _bit_T_165 | _bit_T_167 | _bit_T_169 | _bit_T_171 | _bit_T_173 | _bit_T_175 |
    _bit_T_177 | _bit_T_179 | _bit_T_181 | _bit_T_183 | _bit_T_185 | _bit_T_187 | _bit_T_189 | _bit_T_191 | _bit_T_193
     | _bit_T_195 | _bit_T_197 | _bit_T_199 | _bit_T_201 | _bit_T_203 | _bit_T_205 | _bit_T_207 | _bit_T_209 |
    _bit_T_211 | _bit_T_213 | _bit_T_215 | _bit_T_217 | _bit_T_219 | _bit_T_221 | _bit_T_223; // @[Decode.scala 15:30]
  wire  _bit_T_536 = _bit_T_506 | _bit_T_225 | _bit_T_227 | _bit_T_229 | _bit_T_231 | _bit_T_233 | _bit_T_235 |
    _bit_T_237 | _bit_T_239 | _bit_T_241 | _bit_T_243 | _bit_T_245 | _bit_T_247 | _bit_T_249 | _bit_T_251 | _bit_T_253
     | _bit_T_255 | _bit_T_257 | _bit_T_259 | _bit_T_261 | _bit_T_263 | _bit_T_265 | _bit_T_267 | _bit_T_269 |
    _bit_T_271 | _bit_T_273 | _bit_T_275 | _bit_T_277 | _bit_T_279 | _bit_T_281 | _bit_T_283; // @[Decode.scala 15:30]
  wire  bit_1 = _bit_T_536 | _bit_T_285; // @[Decode.scala 15:30]
  wire [31:0] _T = io_enq_uop_inst & 32'h1040; // @[Decode.scala 14:65]
  wire  _T_1 = _T == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_2 = io_enq_uop_inst & 32'h2000040; // @[Decode.scala 14:65]
  wire  _T_3 = _T_2 == 32'h40; // @[Decode.scala 14:121]
  wire  cs_fp_single = _T_1 | _T_3; // @[Decode.scala 15:30]
  wire [31:0] _T_6 = io_enq_uop_inst & 32'h5064; // @[Decode.scala 14:65]
  wire  _T_7 = _T_6 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_8 = io_enq_uop_inst & 32'h3c; // @[Decode.scala 14:65]
  wire  _T_9 = _T_8 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_10 = io_enq_uop_inst & 32'h6c; // @[Decode.scala 14:65]
  wire  _T_11 = _T_10 == 32'h4; // @[Decode.scala 14:121]
  wire [31:0] _T_12 = io_enq_uop_inst & 32'h38; // @[Decode.scala 14:65]
  wire  _T_13 = _T_12 == 32'h28; // @[Decode.scala 14:121]
  wire [31:0] _T_14 = io_enq_uop_inst & 32'h6a00006c; // @[Decode.scala 14:65]
  wire  _T_15 = _T_14 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_16 = io_enq_uop_inst & 32'h4c; // @[Decode.scala 14:65]
  wire  _T_17 = _T_16 == 32'h4c; // @[Decode.scala 14:121]
  wire [31:0] _T_18 = io_enq_uop_inst & 32'h40003068; // @[Decode.scala 14:65]
  wire  _T_19 = _T_18 == 32'h1000; // @[Decode.scala 14:121]
  wire [31:0] _T_20 = io_enq_uop_inst & 32'h2001028; // @[Decode.scala 14:65]
  wire  _T_21 = _T_20 == 32'h1028; // @[Decode.scala 14:121]
  wire [31:0] _T_22 = io_enq_uop_inst & 32'h505c; // @[Decode.scala 14:65]
  wire  _T_23 = _T_22 == 32'h1040; // @[Decode.scala 14:121]
  wire [31:0] _T_24 = io_enq_uop_inst & 32'h3060; // @[Decode.scala 14:65]
  wire  _T_25 = _T_24 == 32'h2000; // @[Decode.scala 14:121]
  wire [31:0] _T_26 = io_enq_uop_inst & 32'h7060; // @[Decode.scala 14:65]
  wire  _T_27 = _T_26 == 32'h2060; // @[Decode.scala 14:121]
  wire [31:0] _T_28 = io_enq_uop_inst & 32'h42005064; // @[Decode.scala 14:65]
  wire  _T_29 = _T_28 == 32'h5020; // @[Decode.scala 14:121]
  wire [31:0] _T_30 = io_enq_uop_inst & 32'h5070; // @[Decode.scala 14:65]
  wire  _T_31 = _T_30 == 32'h5070; // @[Decode.scala 14:121]
  wire [31:0] _T_32 = io_enq_uop_inst & 32'h601c; // @[Decode.scala 14:65]
  wire  _T_33 = _T_32 == 32'h6000; // @[Decode.scala 14:121]
  wire [31:0] _T_34 = io_enq_uop_inst & 32'h2007054; // @[Decode.scala 14:65]
  wire  _T_35 = _T_34 == 32'h2001010; // @[Decode.scala 14:121]
  wire [31:0] _T_36 = io_enq_uop_inst & 32'h1a00006c; // @[Decode.scala 14:65]
  wire  _T_37 = _T_36 == 32'ha000040; // @[Decode.scala 14:121]
  wire [31:0] _T_38 = io_enq_uop_inst & 32'h92205014; // @[Decode.scala 14:65]
  wire  _T_39 = _T_38 == 32'h10000010; // @[Decode.scala 14:121]
  wire [31:0] _T_40 = io_enq_uop_inst & 32'h9200006c; // @[Decode.scala 14:65]
  wire  _T_41 = _T_40 == 32'h10000040; // @[Decode.scala 14:121]
  wire [31:0] _T_42 = io_enq_uop_inst & 32'h52005034; // @[Decode.scala 14:65]
  wire  _T_43 = _T_42 == 32'h12000030; // @[Decode.scala 14:121]
  wire [31:0] _T_44 = io_enq_uop_inst & 32'h2200602c; // @[Decode.scala 14:65]
  wire  _T_45 = _T_44 == 32'h22000000; // @[Decode.scala 14:121]
  wire [31:0] _T_46 = io_enq_uop_inst & 32'h2200502c; // @[Decode.scala 14:65]
  wire  _T_47 = _T_46 == 32'h22000000; // @[Decode.scala 14:121]
  wire [31:0] _T_48 = io_enq_uop_inst & 32'h4000404c; // @[Decode.scala 14:65]
  wire  _T_49 = _T_48 == 32'h40000008; // @[Decode.scala 14:121]
  wire [31:0] _T_50 = io_enq_uop_inst & 32'h5200006c; // @[Decode.scala 14:65]
  wire  _T_51 = _T_50 == 32'h42000040; // @[Decode.scala 14:121]
  wire [31:0] _T_52 = io_enq_uop_inst & 32'h8200006c; // @[Decode.scala 14:65]
  wire  _T_53 = _T_52 == 32'h82000040; // @[Decode.scala 14:121]
  wire [31:0] _T_54 = io_enq_uop_inst & 32'h4200505c; // @[Decode.scala 14:65]
  wire  _T_55 = _T_54 == 32'h10; // @[Decode.scala 14:121]
  wire [31:0] _T_56 = io_enq_uop_inst & 32'h7064; // @[Decode.scala 14:65]
  wire  _T_57 = _T_56 == 32'h4020; // @[Decode.scala 14:121]
  wire [31:0] _T_58 = io_enq_uop_inst & 32'h2003054; // @[Decode.scala 14:65]
  wire  _T_59 = _T_58 == 32'h2002010; // @[Decode.scala 14:121]
  wire  lo_lo = _T_7 | _T_9 | _T_11 | _T_13 | _T_15 | _T_17 | _T_19 | _T_21 | _T_23 | _T_25 | _T_27 | _T_29 | _T_31 |
    _T_33 | _T_35 | _T_37 | _T_39 | _T_41 | _T_43 | _T_45 | _T_47 | _T_49 | _T_51 | _T_53 | _T_55 | _T_57 | _T_59; // @[Decode.scala 15:30]
  wire [31:0] _T_86 = io_enq_uop_inst & 32'h201c; // @[Decode.scala 14:65]
  wire  _T_87 = _T_86 == 32'h4; // @[Decode.scala 14:121]
  wire [31:0] _T_88 = io_enq_uop_inst & 32'h1068; // @[Decode.scala 14:65]
  wire  _T_89 = _T_88 == 32'h8; // @[Decode.scala 14:121]
  wire [31:0] _T_90 = io_enq_uop_inst & 32'h34; // @[Decode.scala 14:65]
  wire  _T_91 = _T_90 == 32'h14; // @[Decode.scala 14:121]
  wire [31:0] _T_92 = io_enq_uop_inst & 32'h4200606c; // @[Decode.scala 14:65]
  wire  _T_93 = _T_92 == 32'h20; // @[Decode.scala 14:121]
  wire [31:0] _T_94 = io_enq_uop_inst & 32'h10000070; // @[Decode.scala 14:65]
  wire  _T_95 = _T_94 == 32'h20; // @[Decode.scala 14:121]
  wire [31:0] _T_96 = io_enq_uop_inst & 32'h78; // @[Decode.scala 14:65]
  wire  _T_97 = _T_96 == 32'h20; // @[Decode.scala 14:121]
  wire [31:0] _T_98 = io_enq_uop_inst & 32'h4240603c; // @[Decode.scala 14:65]
  wire  _T_99 = _T_98 == 32'h30; // @[Decode.scala 14:121]
  wire [31:0] _T_100 = io_enq_uop_inst & 32'h64; // @[Decode.scala 14:65]
  wire  _T_101 = _T_100 == 32'h44; // @[Decode.scala 14:121]
  wire [31:0] _T_102 = io_enq_uop_inst & 32'h38000070; // @[Decode.scala 14:65]
  wire  _T_103 = _T_102 == 32'h50; // @[Decode.scala 14:121]
  wire [31:0] _T_104 = io_enq_uop_inst & 32'h4200104c; // @[Decode.scala 14:65]
  wire  _T_105 = _T_104 == 32'h1008; // @[Decode.scala 14:121]
  wire [31:0] _T_106 = io_enq_uop_inst & 32'h38005030; // @[Decode.scala 14:65]
  wire  _T_107 = _T_106 == 32'h1010; // @[Decode.scala 14:121]
  wire [31:0] _T_108 = io_enq_uop_inst & 32'h200106c; // @[Decode.scala 14:65]
  wire  _T_109 = _T_108 == 32'h1020; // @[Decode.scala 14:121]
  wire [31:0] _T_110 = io_enq_uop_inst & 32'h7070; // @[Decode.scala 14:65]
  wire  _T_111 = _T_110 == 32'h1070; // @[Decode.scala 14:121]
  wire [31:0] _T_112 = io_enq_uop_inst & 32'h3070; // @[Decode.scala 14:65]
  wire  _T_113 = _T_112 == 32'h2070; // @[Decode.scala 14:121]
  wire  _T_115 = _T_112 == 32'h3010; // @[Decode.scala 14:121]
  wire [31:0] _T_116 = io_enq_uop_inst & 32'h40007064; // @[Decode.scala 14:65]
  wire  _T_117 = _T_116 == 32'h5020; // @[Decode.scala 14:121]
  wire [31:0] _T_118 = io_enq_uop_inst & 32'h5038; // @[Decode.scala 14:65]
  wire  _T_119 = _T_118 == 32'h5020; // @[Decode.scala 14:121]
  wire [31:0] _T_120 = io_enq_uop_inst & 32'h6070; // @[Decode.scala 14:65]
  wire  _T_121 = _T_120 == 32'h6010; // @[Decode.scala 14:121]
  wire [31:0] _T_122 = io_enq_uop_inst & 32'h2003064; // @[Decode.scala 14:65]
  wire  _T_123 = _T_122 == 32'h2002020; // @[Decode.scala 14:121]
  wire [31:0] _T_124 = io_enq_uop_inst & 32'h8000070; // @[Decode.scala 14:65]
  wire  _T_125 = _T_124 == 32'h8000020; // @[Decode.scala 14:121]
  wire [31:0] _T_126 = io_enq_uop_inst & 32'h6a000070; // @[Decode.scala 14:65]
  wire  _T_127 = _T_126 == 32'ha000050; // @[Decode.scala 14:121]
  wire [31:0] _T_128 = io_enq_uop_inst & 32'h12006034; // @[Decode.scala 14:65]
  wire  _T_129 = _T_128 == 32'h12000030; // @[Decode.scala 14:121]
  wire [31:0] _T_130 = io_enq_uop_inst & 32'hc2000070; // @[Decode.scala 14:65]
  wire  _T_131 = _T_130 == 32'h40000050; // @[Decode.scala 14:121]
  wire [31:0] _T_132 = io_enq_uop_inst & 32'h50006050; // @[Decode.scala 14:65]
  wire  _T_133 = _T_132 == 32'h40000050; // @[Decode.scala 14:121]
  wire  _T_135 = _T_56 == 32'h3020; // @[Decode.scala 14:121]
  wire  _T_137 = _T_120 == 32'h6070; // @[Decode.scala 14:121]
  wire  lo_hi_lo = _T_87 | _T_89 | _T_91 | _T_93 | _T_95 | _T_97 | _T_99 | _T_101 | _T_103 | _T_105 | _T_107 | _T_109 |
    _T_111 | _T_113 | _T_115 | _T_117 | _T_119 | _T_121 | _T_123 | _T_125 | _T_127 | _T_129 | _T_131 | _T_133 | _T_135
     | _T_137; // @[Decode.scala 15:30]
  wire [31:0] _T_163 = io_enq_uop_inst & 32'h7078; // @[Decode.scala 14:65]
  wire  _T_164 = _T_163 == 32'h10; // @[Decode.scala 14:121]
  wire [31:0] _T_165 = io_enq_uop_inst & 32'h14; // @[Decode.scala 14:65]
  wire  _T_166 = _T_165 == 32'h14; // @[Decode.scala 14:121]
  wire [31:0] _T_167 = io_enq_uop_inst & 32'h2024; // @[Decode.scala 14:65]
  wire  _T_168 = _T_167 == 32'h24; // @[Decode.scala 14:121]
  wire [31:0] _T_169 = io_enq_uop_inst & 32'h2006028; // @[Decode.scala 14:65]
  wire  _T_170 = _T_169 == 32'h28; // @[Decode.scala 14:121]
  wire [31:0] _T_171 = io_enq_uop_inst & 32'h7a000068; // @[Decode.scala 14:65]
  wire  _T_172 = _T_171 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_173 = io_enq_uop_inst & 32'h2000078; // @[Decode.scala 14:65]
  wire  _T_174 = _T_173 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_175 = io_enq_uop_inst & 32'h2000044; // @[Decode.scala 14:65]
  wire  _T_176 = _T_175 == 32'h44; // @[Decode.scala 14:121]
  wire [31:0] _T_177 = io_enq_uop_inst & 32'h68; // @[Decode.scala 14:65]
  wire  _T_178 = _T_177 == 32'h68; // @[Decode.scala 14:121]
  wire [31:0] _T_179 = io_enq_uop_inst & 32'h504c; // @[Decode.scala 14:65]
  wire  _T_180 = _T_179 == 32'h1008; // @[Decode.scala 14:121]
  wire [31:0] _T_181 = io_enq_uop_inst & 32'h7030; // @[Decode.scala 14:65]
  wire  _T_182 = _T_181 == 32'h1030; // @[Decode.scala 14:121]
  wire [31:0] _T_183 = io_enq_uop_inst & 32'h5048; // @[Decode.scala 14:65]
  wire  _T_184 = _T_183 == 32'h4008; // @[Decode.scala 14:121]
  wire [31:0] _T_185 = io_enq_uop_inst & 32'h2006068; // @[Decode.scala 14:65]
  wire  _T_186 = _T_185 == 32'h4020; // @[Decode.scala 14:121]
  wire [31:0] _T_187 = io_enq_uop_inst & 32'h2005060; // @[Decode.scala 14:65]
  wire  _T_188 = _T_187 == 32'h4020; // @[Decode.scala 14:121]
  wire [31:0] _T_189 = io_enq_uop_inst & 32'h5030; // @[Decode.scala 14:65]
  wire  _T_190 = _T_189 == 32'h4020; // @[Decode.scala 14:121]
  wire [31:0] _T_191 = io_enq_uop_inst & 32'h5078; // @[Decode.scala 14:65]
  wire  _T_192 = _T_191 == 32'h5010; // @[Decode.scala 14:121]
  wire [31:0] _T_193 = io_enq_uop_inst & 32'h200001c; // @[Decode.scala 14:65]
  wire  _T_194 = _T_193 == 32'h2000008; // @[Decode.scala 14:121]
  wire [31:0] _T_195 = io_enq_uop_inst & 32'h2004078; // @[Decode.scala 14:65]
  wire  _T_196 = _T_195 == 32'h2000030; // @[Decode.scala 14:121]
  wire [31:0] _T_197 = io_enq_uop_inst & 32'h2003078; // @[Decode.scala 14:65]
  wire  _T_198 = _T_197 == 32'h2003030; // @[Decode.scala 14:121]
  wire [31:0] _T_199 = io_enq_uop_inst & 32'h2006048; // @[Decode.scala 14:65]
  wire  _T_200 = _T_199 == 32'h2004008; // @[Decode.scala 14:121]
  wire [31:0] _T_201 = io_enq_uop_inst & 32'h52000070; // @[Decode.scala 14:65]
  wire  _T_202 = _T_201 == 32'h12000050; // @[Decode.scala 14:121]
  wire [31:0] _T_203 = io_enq_uop_inst & 32'h58000070; // @[Decode.scala 14:65]
  wire  _T_204 = _T_203 == 32'h18000050; // @[Decode.scala 14:121]
  wire [31:0] _T_205 = io_enq_uop_inst & 32'h68006018; // @[Decode.scala 14:65]
  wire  _T_206 = _T_205 == 32'h28000010; // @[Decode.scala 14:121]
  wire [31:0] _T_207 = io_enq_uop_inst & 32'hc2100068; // @[Decode.scala 14:65]
  wire  _T_208 = _T_207 == 32'h40000040; // @[Decode.scala 14:121]
  wire [31:0] _T_209 = io_enq_uop_inst & 32'ha0000070; // @[Decode.scala 14:65]
  wire  _T_210 = _T_209 == 32'h80000050; // @[Decode.scala 14:121]
  wire [31:0] _T_211 = io_enq_uop_inst & 32'hc0007018; // @[Decode.scala 14:65]
  wire  _T_212 = _T_211 == 32'hc0000010; // @[Decode.scala 14:121]
  wire [31:0] _T_213 = io_enq_uop_inst & 32'h42006070; // @[Decode.scala 14:65]
  wire  _T_214 = _T_213 == 32'h30; // @[Decode.scala 14:121]
  wire  lo_hi_hi = _T_164 | _T_166 | _T_168 | _T_170 | _T_172 | _T_174 | _T_176 | _T_178 | _T_180 | _T_182 | _T_27 |
    _T_184 | _T_186 | _T_188 | _T_190 | _T_192 | _T_121 | _T_194 | _T_196 | _T_198 | _T_200 | _T_202 | _T_204 | _T_206
     | _T_208 | _T_210 | _T_212 | _T_214; // @[Decode.scala 15:30]
  wire [31:0] _T_242 = io_enq_uop_inst & 32'h3048; // @[Decode.scala 14:65]
  wire  _T_243 = _T_242 == 32'h8; // @[Decode.scala 14:121]
  wire [31:0] _T_244 = io_enq_uop_inst & 32'h42006034; // @[Decode.scala 14:65]
  wire  _T_245 = _T_244 == 32'h30; // @[Decode.scala 14:121]
  wire [31:0] _T_246 = io_enq_uop_inst & 32'h2000064; // @[Decode.scala 14:65]
  wire  _T_247 = _T_246 == 32'h44; // @[Decode.scala 14:121]
  wire [31:0] _T_248 = io_enq_uop_inst & 32'h6064; // @[Decode.scala 14:65]
  wire  _T_249 = _T_248 == 32'h60; // @[Decode.scala 14:121]
  wire  _T_251 = _T_6 == 32'h60; // @[Decode.scala 14:121]
  wire [31:0] _T_252 = io_enq_uop_inst & 32'h74; // @[Decode.scala 14:65]
  wire  cs_is_br = _T_252 == 32'h60; // @[Decode.scala 14:121]
  wire  _T_255 = _T_34 == 32'h1010; // @[Decode.scala 14:121]
  wire [31:0] _T_256 = io_enq_uop_inst & 32'h307c; // @[Decode.scala 14:65]
  wire  _T_257 = _T_256 == 32'h1010; // @[Decode.scala 14:121]
  wire [31:0] _T_258 = io_enq_uop_inst & 32'h6074; // @[Decode.scala 14:65]
  wire  _T_259 = _T_258 == 32'h2010; // @[Decode.scala 14:121]
  wire [31:0] _T_260 = io_enq_uop_inst & 32'h2006064; // @[Decode.scala 14:65]
  wire  _T_261 = _T_260 == 32'h2004020; // @[Decode.scala 14:121]
  wire [31:0] _T_262 = io_enq_uop_inst & 32'h2005064; // @[Decode.scala 14:65]
  wire  _T_263 = _T_262 == 32'h2004020; // @[Decode.scala 14:121]
  wire [31:0] _T_264 = io_enq_uop_inst & 32'h200406c; // @[Decode.scala 14:65]
  wire  _T_265 = _T_264 == 32'h2004020; // @[Decode.scala 14:121]
  wire  _T_267 = _T_102 == 32'h8000050; // @[Decode.scala 14:121]
  wire [31:0] _T_268 = io_enq_uop_inst & 32'h98000070; // @[Decode.scala 14:65]
  wire  _T_269 = _T_268 == 32'h10000050; // @[Decode.scala 14:121]
  wire [31:0] _T_270 = io_enq_uop_inst & 32'ha8006050; // @[Decode.scala 14:65]
  wire  _T_271 = _T_270 == 32'h20000050; // @[Decode.scala 14:121]
  wire [31:0] _T_272 = io_enq_uop_inst & 32'ha8005050; // @[Decode.scala 14:65]
  wire  _T_273 = _T_272 == 32'h20000050; // @[Decode.scala 14:121]
  wire  _T_275 = _T_130 == 32'h42000050; // @[Decode.scala 14:121]
  wire [31:0] _T_276 = io_enq_uop_inst & 32'h7074; // @[Decode.scala 14:65]
  wire  _T_277 = _T_276 == 32'h4010; // @[Decode.scala 14:121]
  wire [31:0] _T_278 = io_enq_uop_inst & 32'h70000070; // @[Decode.scala 14:65]
  wire  _T_279 = _T_278 == 32'h40000050; // @[Decode.scala 14:121]
  wire [31:0] _T_280 = io_enq_uop_inst & 32'h8a000070; // @[Decode.scala 14:65]
  wire  _T_281 = _T_280 == 32'h2000050; // @[Decode.scala 14:121]
  wire  hi_lo_lo = _T_243 | _T_245 | _T_174 | _T_247 | _T_249 | _T_251 | cs_is_br | _T_255 | _T_257 | _T_259 | _T_261 |
    _T_263 | _T_265 | _T_267 | _T_269 | _T_271 | _T_273 | _T_275 | _T_210 | _T_277 | _T_279 | _T_281; // @[Decode.scala 15:30]
  wire  _T_304 = _T_278 == 32'h50; // @[Decode.scala 14:121]
  wire [31:0] _T_305 = io_enq_uop_inst & 32'h68000070; // @[Decode.scala 14:65]
  wire  _T_306 = _T_305 == 32'h50; // @[Decode.scala 14:121]
  wire [31:0] _T_307 = io_enq_uop_inst & 32'h7068; // @[Decode.scala 14:65]
  wire  _T_308 = _T_307 == 32'h1060; // @[Decode.scala 14:121]
  wire [31:0] _T_309 = io_enq_uop_inst & 32'h207c; // @[Decode.scala 14:65]
  wire  _T_310 = _T_309 == 32'h2030; // @[Decode.scala 14:121]
  wire  _T_312 = _T_307 == 32'h2060; // @[Decode.scala 14:121]
  wire [31:0] _T_313 = io_enq_uop_inst & 32'h2004048; // @[Decode.scala 14:65]
  wire  _T_314 = _T_313 == 32'h4008; // @[Decode.scala 14:121]
  wire  _T_316 = _T_248 == 32'h4020; // @[Decode.scala 14:121]
  wire  _T_318 = _T_6 == 32'h4020; // @[Decode.scala 14:121]
  wire [31:0] _T_319 = io_enq_uop_inst & 32'h12003034; // @[Decode.scala 14:65]
  wire  _T_320 = _T_319 == 32'h2000030; // @[Decode.scala 14:121]
  wire [31:0] _T_321 = io_enq_uop_inst & 32'h200007c; // @[Decode.scala 14:65]
  wire  _T_322 = _T_321 == 32'h2000030; // @[Decode.scala 14:121]
  wire [31:0] _T_323 = io_enq_uop_inst & 32'h18006050; // @[Decode.scala 14:65]
  wire  _T_324 = _T_323 == 32'h8000050; // @[Decode.scala 14:121]
  wire [31:0] _T_325 = io_enq_uop_inst & 32'h6000603c; // @[Decode.scala 14:65]
  wire  _T_326 = _T_325 == 32'h40000030; // @[Decode.scala 14:121]
  wire [31:0] _T_327 = io_enq_uop_inst & 32'hc0005050; // @[Decode.scala 14:65]
  wire  _T_328 = _T_327 == 32'h80000050; // @[Decode.scala 14:121]
  wire [31:0] _T_329 = io_enq_uop_inst & 32'ha0007014; // @[Decode.scala 14:65]
  wire  _T_330 = _T_329 == 32'ha0001010; // @[Decode.scala 14:121]
  wire  hi_lo_hi = _T_174 | _T_247 | _T_304 | _T_306 | cs_is_br | _T_308 | _T_310 | _T_312 | _T_314 | _T_316 | _T_318 |
    _T_320 | _T_322 | _T_324 | _T_326 | _T_328 | _T_330; // @[Decode.scala 15:30]
  wire [31:0] _T_347 = io_enq_uop_inst & 32'h2034; // @[Decode.scala 14:65]
  wire  _T_348 = _T_347 == 32'h24; // @[Decode.scala 14:121]
  wire  _T_350 = _T_112 == 32'h70; // @[Decode.scala 14:121]
  wire  _T_352 = _T_112 == 32'h3070; // @[Decode.scala 14:121]
  wire [31:0] _T_353 = io_enq_uop_inst & 32'h4070; // @[Decode.scala 14:65]
  wire  _T_354 = _T_353 == 32'h4070; // @[Decode.scala 14:121]
  wire [31:0] _T_355 = io_enq_uop_inst & 32'h2000070; // @[Decode.scala 14:65]
  wire  _T_356 = _T_355 == 32'h2000040; // @[Decode.scala 14:121]
  wire [31:0] _T_357 = io_enq_uop_inst & 32'h18000070; // @[Decode.scala 14:65]
  wire  hi_hi_lo_1 = _T_357 == 32'h18000050; // @[Decode.scala 14:121]
  wire [31:0] _T_359 = io_enq_uop_inst & 32'h200000c; // @[Decode.scala 14:65]
  wire  _T_360 = _T_359 == 32'h8; // @[Decode.scala 14:121]
  wire [31:0] _T_361 = io_enq_uop_inst & 32'h200c; // @[Decode.scala 14:65]
  wire  _T_362 = _T_361 == 32'h8; // @[Decode.scala 14:121]
  wire  hi_hi_lo = _T_243 | _T_91 | _T_348 | _T_178 | _T_350 | _T_352 | _T_354 | _T_322 | _T_356 | _T_263 | hi_hi_lo_1
     | _T_360 | _T_362; // @[Decode.scala 15:30]
  wire [31:0] _T_375 = io_enq_uop_inst & 32'h60; // @[Decode.scala 14:65]
  wire  _T_376 = _T_375 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_377 = io_enq_uop_inst & 32'h3050; // @[Decode.scala 14:65]
  wire  _T_378 = _T_377 == 32'h50; // @[Decode.scala 14:121]
  wire [31:0] _T_379 = io_enq_uop_inst & 32'h10006048; // @[Decode.scala 14:65]
  wire  _T_380 = _T_379 == 32'h2008; // @[Decode.scala 14:121]
  wire [31:0] _T_381 = io_enq_uop_inst & 32'h10003048; // @[Decode.scala 14:65]
  wire  _T_382 = _T_381 == 32'h3008; // @[Decode.scala 14:121]
  wire [31:0] _T_383 = io_enq_uop_inst & 32'h8002048; // @[Decode.scala 14:65]
  wire  _T_384 = _T_383 == 32'h8002008; // @[Decode.scala 14:121]
  wire  hi_hi_hi = _T_376 | _T_378 | _T_380 | _T_382 | _T_384; // @[Decode.scala 15:30]
  wire [2:0] lo = {lo_hi_hi,lo_hi_lo,lo_lo}; // @[Cat.scala 30:58]
  wire [3:0] hi = {hi_hi_hi,hi_hi_lo,hi_lo_hi,hi_lo_lo}; // @[Cat.scala 30:58]
  wire [6:0] cs_uopc = {hi_hi_hi,hi_hi_lo,hi_lo_hi,hi_lo_lo,lo_hi_hi,lo_hi_lo,lo_lo}; // @[Cat.scala 30:58]
  wire  _bit_T_567 = _bit_T_1 | _bit_T_3 | _bit_T_5 | _bit_T_7 | _bit_T_9 | _bit_T_11 | _bit_T_13 | _bit_T_15 |
    _bit_T_107 | _bit_T_119 | _bit_T_121 | _bit_T_123 | _bit_T_125 | _bit_T_127 | _bit_T_129 | _bit_T_131 | _bit_T_133
     | _bit_T_135 | _bit_T_137 | _bit_T_139 | _bit_T_141 | _bit_T_143 | _bit_T_145 | _bit_T_147 | _bit_T_149 |
    _bit_T_151 | _bit_T_153 | _bit_T_155 | _bit_T_157 | _bit_T_159 | _bit_T_161; // @[Decode.scala 15:30]
  wire  _bit_T_597 = _bit_T_567 | _bit_T_163 | _bit_T_165 | _bit_T_167 | _bit_T_169 | _bit_T_171 | _bit_T_173 |
    _bit_T_179 | _bit_T_181 | _bit_T_183 | _bit_T_185 | _bit_T_187 | _bit_T_189 | _bit_T_191 | _bit_T_193 | _bit_T_195
     | _bit_T_197 | _bit_T_215 | _bit_T_217 | _bit_T_219 | _bit_T_221 | _bit_T_223 | _bit_T_225 | _bit_T_227 |
    _bit_T_229 | _bit_T_231 | _bit_T_233 | _bit_T_235 | _bit_T_237 | _bit_T_239 | _bit_T_241; // @[Decode.scala 15:30]
  wire  bit_2 = _bit_T_597 | _bit_T_243 | _bit_T_245 | _bit_T_247 | _bit_T_249 | _bit_T_251 | _bit_T_253 | _bit_T_255 |
    _bit_T_257 | _bit_T_259 | _bit_T_261 | _bit_T_263 | _bit_T_265 | _bit_T_267 | _bit_T_269 | _bit_T_271 | _bit_T_273
     | _bit_T_275 | _bit_T_277 | _bit_T_279 | _bit_T_281 | _bit_T_283 | _bit_T_285 | _bit_T_287 | _bit_T_289 |
    _bit_T_291; // @[Decode.scala 15:30]
  wire  lo_1 = ~bit_2; // @[Decode.scala 40:35]
  wire  hi_lo_1 = _bit_T_567 | _bit_T_163 | _bit_T_165 | _bit_T_167 | _bit_T_169 | _bit_T_287 | _bit_T_289 | _bit_T_291; // @[Decode.scala 15:30]
  wire  _bit_T_689 = _bit_T_167 | _bit_T_169 | _bit_T_171 | _bit_T_173 | _bit_T_179 | _bit_T_181 | _bit_T_183 |
    _bit_T_185 | _bit_T_187 | _bit_T_189 | _bit_T_191 | _bit_T_193 | _bit_T_195 | _bit_T_197 | _bit_T_215 | _bit_T_217
     | _bit_T_219 | _bit_T_221 | _bit_T_223 | _bit_T_225 | _bit_T_227 | _bit_T_229 | _bit_T_231 | _bit_T_233 |
    _bit_T_235 | _bit_T_237 | _bit_T_239 | _bit_T_241 | _bit_T_243 | _bit_T_245 | _bit_T_247; // @[Decode.scala 15:30]
  wire  hi_hi_1 = _bit_T_689 | _bit_T_249 | _bit_T_251 | _bit_T_253 | _bit_T_255 | _bit_T_257 | _bit_T_259 | _bit_T_261
     | _bit_T_263 | _bit_T_265 | _bit_T_267 | _bit_T_269 | _bit_T_271 | _bit_T_273 | _bit_T_275 | _bit_T_277 |
    _bit_T_279 | _bit_T_281 | _bit_T_283 | _bit_T_285; // @[Decode.scala 15:30]
  wire [1:0] hi_1 = {hi_hi_1,hi_lo_1}; // @[Cat.scala 30:58]
  wire [31:0] _T_391 = io_enq_uop_inst & 32'h2000054; // @[Decode.scala 14:65]
  wire  _T_392 = _T_391 == 32'h10; // @[Decode.scala 14:121]
  wire  _T_394 = _T_252 == 32'h10; // @[Decode.scala 14:121]
  wire  _T_396 = _T_90 == 32'h34; // @[Decode.scala 14:121]
  wire  lo_lo_lo = _T_392 | _T_394 | _T_396 | cs_is_br; // @[Decode.scala 15:30]
  wire  lo_lo_hi = _T_91 | _T_348 | _T_178; // @[Decode.scala 15:30]
  wire [31:0] _T_402 = io_enq_uop_inst & 32'h50; // @[Decode.scala 14:65]
  wire  _T_403 = _T_402 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_404 = io_enq_uop_inst & 32'h52003034; // @[Decode.scala 14:65]
  wire  _T_405 = _T_404 == 32'h12000030; // @[Decode.scala 14:121]
  wire  lo_hi_lo_1 = _T_403 | _T_405; // @[Decode.scala 15:30]
  wire [31:0] _T_407 = io_enq_uop_inst & 32'h2004074; // @[Decode.scala 14:65]
  wire  lo_hi_hi_lo = _T_407 == 32'h2000030; // @[Decode.scala 14:121]
  wire [31:0] _T_409 = io_enq_uop_inst & 32'h2004064; // @[Decode.scala 14:65]
  wire  lo_hi_hi_hi = _T_409 == 32'h2004020; // @[Decode.scala 14:121]
  wire  _T_412 = _T_94 == 32'h70; // @[Decode.scala 14:121]
  wire [31:0] _T_413 = io_enq_uop_inst & 32'h1070; // @[Decode.scala 14:65]
  wire  lo_9 = _T_413 == 32'h1070; // @[Decode.scala 14:121]
  wire [31:0] _T_415 = io_enq_uop_inst & 32'h2070; // @[Decode.scala 14:65]
  wire  hi_lo_5 = _T_415 == 32'h2070; // @[Decode.scala 14:121]
  wire [31:0] _T_417 = io_enq_uop_inst & 32'h12000034; // @[Decode.scala 14:65]
  wire  _T_418 = _T_417 == 32'h10000030; // @[Decode.scala 14:121]
  wire [31:0] _T_419 = io_enq_uop_inst & 32'he0000050; // @[Decode.scala 14:65]
  wire  _T_420 = _T_419 == 32'h60000050; // @[Decode.scala 14:121]
  wire  hi_lo_lo_1 = _T_412 | lo_9 | hi_lo_5 | _T_418 | _T_420; // @[Decode.scala 15:30]
  wire [31:0] _T_425 = io_enq_uop_inst & 32'h90000060; // @[Decode.scala 14:65]
  wire  _T_426 = _T_425 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_427 = io_enq_uop_inst & 32'h88000060; // @[Decode.scala 14:65]
  wire  _T_428 = _T_427 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_429 = io_enq_uop_inst & 32'h70; // @[Decode.scala 14:65]
  wire  cs_frs3_en = _T_429 == 32'h40; // @[Decode.scala 14:121]
  wire  hi_lo_hi_1 = _T_426 | _T_428 | cs_frs3_en; // @[Decode.scala 15:30]
  wire [31:0] _T_433 = io_enq_uop_inst & 32'h90000070; // @[Decode.scala 14:65]
  wire  hi_hi_hi_lo = _T_433 == 32'h90000050; // @[Decode.scala 14:121]
  wire [31:0] _T_435 = io_enq_uop_inst & 32'h7c; // @[Decode.scala 14:65]
  wire  _T_436 = _T_435 == 32'h24; // @[Decode.scala 14:121]
  wire  _T_438 = _T_433 == 32'h80000050; // @[Decode.scala 14:121]
  wire  hi_hi_hi_hi = _T_436 | _T_438; // @[Decode.scala 15:30]
  wire [4:0] lo_2 = {lo_hi_hi_hi,lo_hi_hi_lo,lo_hi_lo_1,lo_lo_hi,lo_lo_lo}; // @[Cat.scala 30:58]
  wire [4:0] hi_2 = {hi_hi_hi_hi,hi_hi_hi_lo,hi_hi_lo_1,hi_lo_hi_1,hi_lo_lo_1}; // @[Cat.scala 30:58]
  wire  _bit_T_738 = _bit_T_163 | _bit_T_165 | _bit_T_175 | _bit_T_177 | _bit_T_183 | _bit_T_185 | _bit_T_187 |
    _bit_T_189 | _bit_T_191 | _bit_T_193 | _bit_T_195 | _bit_T_197 | _bit_T_199 | _bit_T_201 | _bit_T_203 | _bit_T_205
     | _bit_T_207 | _bit_T_209 | _bit_T_211 | _bit_T_213 | _bit_T_243 | _bit_T_245 | _bit_T_247 | _bit_T_249 |
    _bit_T_251 | _bit_T_253 | _bit_T_255 | _bit_T_257 | _bit_T_259 | _bit_T_261 | _bit_T_263; // @[Decode.scala 15:30]
  wire  lo_3 = _bit_T_738 | _bit_T_265 | _bit_T_267 | _bit_T_269 | _bit_T_271 | _bit_T_273 | _bit_T_275 | _bit_T_277 |
    _bit_T_279 | _bit_T_281 | _bit_T_283 | _bit_T_285; // @[Decode.scala 15:30]
  wire  _bit_T_779 = _bit_T_1 | _bit_T_3 | _bit_T_5 | _bit_T_7 | _bit_T_9 | _bit_T_17 | _bit_T_19 | _bit_T_21 |
    _bit_T_23 | _bit_T_25 | _bit_T_27 | _bit_T_29 | _bit_T_31 | _bit_T_33 | _bit_T_35 | _bit_T_37 | _bit_T_39 |
    _bit_T_41 | _bit_T_43 | _bit_T_45 | _bit_T_47 | _bit_T_49 | _bit_T_51 | _bit_T_53 | _bit_T_55 | _bit_T_57 |
    _bit_T_59 | _bit_T_61 | _bit_T_63 | _bit_T_65 | _bit_T_67; // @[Decode.scala 15:30]
  wire  _bit_T_809 = _bit_T_779 | _bit_T_69 | _bit_T_71 | _bit_T_73 | _bit_T_75 | _bit_T_77 | _bit_T_79 | _bit_T_81 |
    _bit_T_95 | _bit_T_97 | _bit_T_99 | _bit_T_101 | _bit_T_103 | _bit_T_105 | _bit_T_119 | _bit_T_121 | _bit_T_123 |
    _bit_T_125 | _bit_T_127 | _bit_T_129 | _bit_T_131 | _bit_T_133 | _bit_T_135 | _bit_T_137 | _bit_T_139 | _bit_T_141
     | _bit_T_143 | _bit_T_145 | _bit_T_147 | _bit_T_149 | _bit_T_151; // @[Decode.scala 15:30]
  wire  _bit_T_839 = _bit_T_809 | _bit_T_153 | _bit_T_155 | _bit_T_157 | _bit_T_159 | _bit_T_161 | _bit_T_163 |
    _bit_T_165 | _bit_T_171 | _bit_T_173 | _bit_T_175 | _bit_T_177 | _bit_T_179 | _bit_T_181 | _bit_T_183 | _bit_T_185
     | _bit_T_187 | _bit_T_189 | _bit_T_191 | _bit_T_193 | _bit_T_195 | _bit_T_197 | _bit_T_199 | _bit_T_201 |
    _bit_T_203 | _bit_T_205 | _bit_T_207 | _bit_T_209 | _bit_T_211 | _bit_T_213 | _bit_T_215; // @[Decode.scala 15:30]
  wire  _bit_T_869 = _bit_T_839 | _bit_T_217 | _bit_T_219 | _bit_T_221 | _bit_T_223 | _bit_T_225 | _bit_T_227 |
    _bit_T_229 | _bit_T_231 | _bit_T_233 | _bit_T_235 | _bit_T_237 | _bit_T_239 | _bit_T_241 | _bit_T_243 | _bit_T_245
     | _bit_T_247 | _bit_T_249 | _bit_T_251 | _bit_T_253 | _bit_T_255 | _bit_T_257 | _bit_T_259 | _bit_T_261 |
    _bit_T_263 | _bit_T_265 | _bit_T_267 | _bit_T_269 | _bit_T_271 | _bit_T_273 | _bit_T_275; // @[Decode.scala 15:30]
  wire  bit_3 = _bit_T_869 | _bit_T_277 | _bit_T_279 | _bit_T_281 | _bit_T_283 | _bit_T_285 | _bit_T_287 | _bit_T_289 |
    _bit_T_293 | _bit_T_295 | _bit_T_297 | _bit_T_299 | _bit_T_301 | _bit_T_303 | _bit_T_305 | _bit_T_307 | _bit_T_309
     | _bit_T_311 | _bit_T_313 | _bit_T_315; // @[Decode.scala 15:30]
  wire  hi_3 = ~bit_3; // @[Decode.scala 40:35]
  wire [1:0] cs_dst_type = {hi_3,lo_3}; // @[Cat.scala 30:58]
  wire [31:0] _T_442 = io_enq_uop_inst & 32'h80000060; // @[Decode.scala 14:65]
  wire  _T_443 = _T_442 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_444 = io_enq_uop_inst & 32'h10000060; // @[Decode.scala 14:65]
  wire  _T_445 = _T_444 == 32'h40; // @[Decode.scala 14:121]
  wire  lo_4 = _T_443 | _T_445 | cs_frs3_en | _T_354; // @[Decode.scala 15:30]
  wire [31:0] _T_449 = io_enq_uop_inst & 32'h2058; // @[Decode.scala 14:65]
  wire  _T_450 = _T_449 == 32'h8; // @[Decode.scala 14:121]
  wire [31:0] _T_451 = io_enq_uop_inst & 32'h10003070; // @[Decode.scala 14:65]
  wire  _T_452 = _T_451 == 32'h70; // @[Decode.scala 14:121]
  wire [31:0] _T_453 = io_enq_uop_inst & 32'h12003030; // @[Decode.scala 14:65]
  wire  _T_454 = _T_453 == 32'h10000030; // @[Decode.scala 14:121]
  wire [31:0] _T_455 = io_enq_uop_inst & 32'he0003050; // @[Decode.scala 14:65]
  wire  _T_456 = _T_455 == 32'h60000050; // @[Decode.scala 14:121]
  wire  hi_4 = _T_450 | _T_166 | _T_178 | _T_452 | _T_354 | _T_454 | _T_456; // @[Decode.scala 15:30]
  wire [31:0] _T_464 = io_enq_uop_inst & 32'h40000060; // @[Decode.scala 14:65]
  wire  _T_465 = _T_464 == 32'h40; // @[Decode.scala 14:121]
  wire  lo_5 = _T_436 | _T_465 | cs_frs3_en; // @[Decode.scala 15:30]
  wire  _T_469 = _T_375 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_470 = io_enq_uop_inst & 32'h18000048; // @[Decode.scala 14:65]
  wire  _T_471 = _T_470 == 32'h10000008; // @[Decode.scala 14:121]
  wire [31:0] _T_472 = io_enq_uop_inst & 32'h12000030; // @[Decode.scala 14:65]
  wire  _T_473 = _T_472 == 32'h10000030; // @[Decode.scala 14:121]
  wire [31:0] _T_474 = io_enq_uop_inst & 32'h40000030; // @[Decode.scala 14:65]
  wire  _T_475 = _T_474 == 32'h40000010; // @[Decode.scala 14:121]
  wire [31:0] _T_476 = io_enq_uop_inst & 32'h60000010; // @[Decode.scala 14:65]
  wire  _T_477 = _T_476 == 32'h60000010; // @[Decode.scala 14:121]
  wire  hi_5 = _T_469 | _T_166 | _T_168 | _T_178 | _T_412 | lo_9 | hi_lo_5 | _T_471 | _T_473 | _T_475 | _T_477; // @[Decode.scala 15:30]
  wire  _T_491 = _T_429 == 32'h20; // @[Decode.scala 14:121]
  wire  lo_6 = _T_166 | _T_491; // @[Decode.scala 15:30]
  wire [31:0] _T_493 = io_enq_uop_inst & 32'h54; // @[Decode.scala 14:65]
  wire  _T_494 = _T_493 == 32'h40; // @[Decode.scala 14:121]
  wire  hi_lo_3 = _T_166 | _T_494; // @[Decode.scala 15:30]
  wire [31:0] _T_496 = io_enq_uop_inst & 32'h18; // @[Decode.scala 14:65]
  wire  hi_hi_3 = _T_496 == 32'h8; // @[Decode.scala 14:121]
  wire [2:0] cs_imm_sel = {hi_hi_3,hi_lo_3,lo_6}; // @[Cat.scala 30:58]
  wire  _T_500 = _T_96 == 32'h0; // @[Decode.scala 14:121]
  wire [31:0] _T_501 = io_enq_uop_inst & 32'h18002048; // @[Decode.scala 14:65]
  wire  _T_502 = _T_501 == 32'h10002008; // @[Decode.scala 14:121]
  wire [31:0] _T_505 = io_enq_uop_inst & 32'h3058; // @[Decode.scala 14:65]
  wire  cs_is_fence = _T_505 == 32'h8; // @[Decode.scala 14:121]
  wire  cs_is_amo = _T_380 | _T_384; // @[Decode.scala 15:30]
  wire  _T_515 = _T_177 == 32'h20; // @[Decode.scala 14:121]
  wire [31:0] _T_516 = io_enq_uop_inst & 32'h18000020; // @[Decode.scala 14:65]
  wire  _T_517 = _T_516 == 32'h18000020; // @[Decode.scala 14:121]
  wire [31:0] _T_518 = io_enq_uop_inst & 32'h20000020; // @[Decode.scala 14:65]
  wire  _T_519 = _T_518 == 32'h20000020; // @[Decode.scala 14:121]
  wire  lo_lo_2 = _T_515 | _T_517 | _T_519; // @[Decode.scala 15:30]
  wire [31:0] _T_522 = io_enq_uop_inst & 32'h10000008; // @[Decode.scala 14:65]
  wire  _T_523 = _T_522 == 32'h10000008; // @[Decode.scala 14:121]
  wire [31:0] _T_524 = io_enq_uop_inst & 32'h40000008; // @[Decode.scala 14:65]
  wire  _T_525 = _T_524 == 32'h40000008; // @[Decode.scala 14:121]
  wire  lo_hi_2 = _T_523 | _T_525; // @[Decode.scala 15:30]
  wire [31:0] _T_527 = io_enq_uop_inst & 32'h40; // @[Decode.scala 14:65]
  wire  hi_hi_hi_2 = _T_527 == 32'h40; // @[Decode.scala 14:121]
  wire [31:0] _T_529 = io_enq_uop_inst & 32'h8000008; // @[Decode.scala 14:65]
  wire  _T_530 = _T_529 == 32'h8000008; // @[Decode.scala 14:121]
  wire [31:0] _T_531 = io_enq_uop_inst & 32'h80000008; // @[Decode.scala 14:65]
  wire  _T_532 = _T_531 == 32'h80000008; // @[Decode.scala 14:121]
  wire  hi_lo_4 = hi_hi_hi_2 | _T_530 | _T_523 | _T_532; // @[Decode.scala 15:30]
  wire [31:0] _T_536 = io_enq_uop_inst & 32'h18000008; // @[Decode.scala 14:65]
  wire  hi_hi_lo_2 = _T_536 == 32'h8; // @[Decode.scala 14:121]
  wire [1:0] lo_7 = {lo_hi_2,lo_lo_2}; // @[Cat.scala 30:58]
  wire [2:0] hi_7 = {hi_hi_hi_2,hi_hi_lo_2,hi_lo_4}; // @[Cat.scala 30:58]
  wire [4:0] cs_mem_cmd = {hi_hi_hi_2,hi_hi_lo_2,hi_lo_4,lo_hi_2,lo_lo_2}; // @[Cat.scala 30:58]
  wire  _bit_T_919 = _bit_T_95 | _bit_T_97 | _bit_T_99 | _bit_T_101 | _bit_T_103 | _bit_T_105 | _bit_T_107 | _bit_T_108
     | _bit_T_109 | _bit_T_110 | _bit_T_111 | _bit_T_112 | _bit_T_113 | bit_4 | _bit_T_117 | _bit_T_119 | _bit_T_121 |
    _bit_T_123 | _bit_T_125 | _bit_T_127 | _bit_T_129 | _bit_T_131 | _bit_T_133 | _bit_T_135 | _bit_T_137 | _bit_T_139
     | _bit_T_141 | _bit_T_143 | _bit_T_145 | _bit_T_147 | _bit_T_149; // @[Decode.scala 15:30]
  wire [31:0] _T_554 = io_enq_uop_inst & 32'h58; // @[Decode.scala 14:65]
  wire  _T_555 = _T_554 == 32'h8; // @[Decode.scala 14:121]
  wire  _T_557 = _T_429 == 32'h70; // @[Decode.scala 14:121]
  wire  cs_flush_on_commit = _T_555 | _T_557; // @[Decode.scala 15:30]
  wire [2:0] cs_csr_cmd = {hi_lo_lo_1,hi_lo_5,lo_9}; // @[Cat.scala 30:58]
  wire  _T_566 = cs_csr_cmd == 3'h6; // @[package.scala 15:47]
  wire  _T_567 = cs_csr_cmd == 3'h7; // @[package.scala 15:47]
  wire  _T_568 = cs_csr_cmd == 3'h5; // @[package.scala 15:47]
  wire  _T_569 = _T_566 | _T_567; // @[package.scala 72:59]
  wire  csr_en = _T_566 | _T_567 | _T_568; // @[package.scala 72:59]
  wire [5:0] uop_lrs1 = {{1'd0}, io_enq_uop_inst[19:15]}; // @[decode.scala 474:17]
  wire  csr_ren = _T_569 & uop_lrs1 == 6'h0; // @[decode.scala 490:50]
  wire  system_insn = cs_csr_cmd == 3'h4; // @[decode.scala 491:32]
  wire  sfence = cs_uopc == 7'h6b; // @[decode.scala 492:24]
  wire  _T_575 = bit_1 & io_csr_decode_fp_illegal; // @[decode.scala 498:15]
  wire  _T_576 = ~bit_ | _T_575; // @[decode.scala 497:35]
  wire  _T_581 = cs_is_amo & ~io_status_isa[0]; // @[decode.scala 500:15]
  wire  _T_582 = _T_576 | _T_581; // @[decode.scala 499:43]
  wire  _T_587 = bit_1 & ~cs_fp_single & ~io_status_isa[3]; // @[decode.scala 501:34]
  wire  _T_588 = _T_582 | _T_587; // @[decode.scala 500:43]
  wire  _T_589 = ~csr_ren; // @[decode.scala 502:46]
  wire  _T_592 = csr_en & (io_csr_decode_read_illegal | ~csr_ren & io_csr_decode_write_illegal); // @[decode.scala 502:12]
  wire  _T_593 = _T_588 | _T_592; // @[decode.scala 501:61]
  wire  _T_595 = (sfence | system_insn) & io_csr_decode_system_illegal; // @[decode.scala 503:30]
  wire  id_illegal_insn = _T_593 | _T_595; // @[decode.scala 502:87]
  wire  _T_597 = io_interrupt & ~io_enq_uop_is_sfb; // @[decode.scala 511:19]
  wire [1:0] _T_602 = io_enq_uop_xcpt_ae_if ? 2'h1 : 2'h2; // @[Mux.scala 47:69]
  wire [3:0] _T_603 = io_enq_uop_xcpt_pf_if ? 4'hc : {{2'd0}, _T_602}; // @[Mux.scala 47:69]
  wire [3:0] _T_604 = io_enq_uop_bp_xcpt_if ? 4'h3 : _T_603; // @[Mux.scala 47:69]
  wire [3:0] _T_605 = io_enq_uop_bp_debug_if ? 4'he : _T_604; // @[Mux.scala 47:69]
  wire [5:0] uop_ldst = {{1'd0}, io_enq_uop_inst[11:7]}; // @[decode.scala 474:17 decode.scala 530:18]
  wire  _T_636 = cs_mem_cmd == 5'h14; // @[package.scala 15:47]
  wire  _T_637 = cs_mem_cmd == 5'h5; // @[package.scala 15:47]
  wire  _T_638 = _T_636 | _T_637; // @[package.scala 72:59]
  wire [5:0] uop_lrs2 = {{1'd0}, io_enq_uop_inst[24:20]}; // @[decode.scala 474:17]
  wire  hi_10 = uop_lrs2 != 6'h0; // @[decode.scala 561:81]
  wire  lo_10 = uop_lrs1 != 6'h0; // @[decode.scala 561:99]
  wire [1:0] _T_639 = {hi_10,lo_10}; // @[Cat.scala 30:58]
  wire [4:0] di24_20 = cs_imm_sel == 3'h2 | cs_imm_sel == 3'h1 ? io_enq_uop_inst[11:7] : io_enq_uop_inst[24:20]; // @[decode.scala 578:20]
  wire [6:0] hi_hi_6 = io_enq_uop_inst[31:25]; // @[decode.scala 579:29]
  wire [7:0] lo_11 = io_enq_uop_inst[19:12]; // @[decode.scala 579:51]
  wire [11:0] hi_11 = {hi_hi_6,di24_20}; // @[Cat.scala 30:58]
  assign io_deq_uop_uopc = {hi,lo}; // @[Cat.scala 30:58]
  assign io_deq_uop_inst = io_enq_uop_inst; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_debug_inst = io_enq_uop_debug_inst; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_is_rvc = io_enq_uop_is_rvc; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_debug_pc = io_enq_uop_debug_pc; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_iq_type = {hi_1,lo_1}; // @[Cat.scala 30:58]
  assign io_deq_uop_fu_code = {hi_2,lo_2}; // @[Cat.scala 30:58]
  assign io_deq_uop_ctrl_br_type = io_enq_uop_ctrl_br_type; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ctrl_op1_sel = io_enq_uop_ctrl_op1_sel; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ctrl_op2_sel = io_enq_uop_ctrl_op2_sel; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ctrl_imm_sel = io_enq_uop_ctrl_imm_sel; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ctrl_op_fcn = io_enq_uop_ctrl_op_fcn; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ctrl_fcn_dw = io_enq_uop_ctrl_fcn_dw; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ctrl_csr_cmd = io_enq_uop_ctrl_csr_cmd; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ctrl_is_load = io_enq_uop_ctrl_is_load; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ctrl_is_sta = io_enq_uop_ctrl_is_sta; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ctrl_is_std = io_enq_uop_ctrl_is_std; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_iw_state = io_enq_uop_iw_state; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_iw_p1_poisoned = io_enq_uop_iw_p1_poisoned; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_iw_p2_poisoned = io_enq_uop_iw_p2_poisoned; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_is_br = _T_252 == 32'h60; // @[Decode.scala 14:121]
  assign io_deq_uop_is_jalr = cs_uopc == 7'h26; // @[decode.scala 585:35]
  assign io_deq_uop_is_jal = cs_uopc == 7'h25; // @[decode.scala 584:35]
  assign io_deq_uop_is_sfb = io_enq_uop_is_sfb; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_br_mask = io_enq_uop_br_mask; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_br_tag = io_enq_uop_br_tag; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ftq_idx = io_enq_uop_ftq_idx; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_edge_inst = io_enq_uop_edge_inst; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_pc_lob = io_enq_uop_pc_lob; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_taken = io_enq_uop_taken; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_imm_packed = {hi_11,lo_11}; // @[Cat.scala 30:58]
  assign io_deq_uop_csr_addr = io_enq_uop_csr_addr; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_rob_idx = io_enq_uop_rob_idx; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ldq_idx = io_enq_uop_ldq_idx; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_stq_idx = io_enq_uop_stq_idx; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_rxq_idx = io_enq_uop_rxq_idx; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_pdst = io_enq_uop_pdst; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_prs1 = io_enq_uop_prs1; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_prs2 = io_enq_uop_prs2; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_prs3 = io_enq_uop_prs3; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ppred = io_enq_uop_ppred; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_prs1_busy = io_enq_uop_prs1_busy; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_prs2_busy = io_enq_uop_prs2_busy; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_prs3_busy = io_enq_uop_prs3_busy; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_ppred_busy = io_enq_uop_ppred_busy; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_stale_pdst = io_enq_uop_stale_pdst; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_exception = _T_597 | io_enq_uop_bp_debug_if | io_enq_uop_bp_xcpt_if | io_enq_uop_xcpt_pf_if |
    io_enq_uop_xcpt_ae_if | id_illegal_insn; // @[decode.scala 508:26]
  assign io_deq_uop_exc_cause = _T_597 ? io_interrupt_cause : {{60'd0}, _T_605}; // @[Mux.scala 47:69]
  assign io_deq_uop_bypassable = _T_392 | _T_394 | _T_396; // @[Decode.scala 15:30]
  assign io_deq_uop_mem_cmd = {hi_7,lo_7}; // @[Cat.scala 30:58]
  assign io_deq_uop_mem_size = _T_638 ? _T_639 : io_enq_uop_inst[13:12]; // @[decode.scala 561:24]
  assign io_deq_uop_mem_signed = ~io_enq_uop_inst[14]; // @[decode.scala 562:21]
  assign io_deq_uop_is_fence = _T_505 == 32'h8; // @[Decode.scala 14:121]
  assign io_deq_uop_is_fencei = _bit_T == 32'h100f; // @[Decode.scala 14:121]
  assign io_deq_uop_is_amo = _T_380 | _T_384; // @[Decode.scala 15:30]
  assign io_deq_uop_uses_ldq = _T_500 | _T_502; // @[Decode.scala 15:30]
  assign io_deq_uop_uses_stq = cs_is_fence | _T_95 | _T_97 | _T_125; // @[Decode.scala 15:30]
  assign io_deq_uop_is_sys_pc2epc = _bit_T_108 | _bit_T_109; // @[Decode.scala 15:30]
  assign io_deq_uop_is_unique = _bit_T_919 | _bit_T_151 | _bit_T_153 | _bit_T_155 | _bit_T_157 | _bit_T_159 | _bit_T_161
    ; // @[Decode.scala 15:30]
  assign io_deq_uop_flush_on_commit = cs_flush_on_commit | csr_en & _T_589 & io_csr_decode_write_flush; // @[decode.scala 570:45]
  assign io_deq_uop_ldst_is_rs1 = 1'h0; // @[decode.scala 543:52 decode.scala 546:21]
  assign io_deq_uop_ldst = {{1'd0}, io_enq_uop_inst[11:7]}; // @[decode.scala 474:17 decode.scala 530:18]
  assign io_deq_uop_lrs1 = {{1'd0}, io_enq_uop_inst[19:15]}; // @[decode.scala 474:17]
  assign io_deq_uop_lrs2 = {{1'd0}, io_enq_uop_inst[24:20]}; // @[decode.scala 474:17]
  assign io_deq_uop_lrs3 = {{1'd0}, io_enq_uop_inst[31:27]}; // @[decode.scala 474:17 decode.scala 533:18]
  assign io_deq_uop_ldst_val = cs_dst_type != 2'h2 & ~(uop_ldst == 6'h0 & cs_dst_type == 2'h0); // @[decode.scala 535:42]
  assign io_deq_uop_dst_rtype = {hi_3,lo_3}; // @[Cat.scala 30:58]
  assign io_deq_uop_lrs1_rtype = {hi_4,lo_4}; // @[Cat.scala 30:58]
  assign io_deq_uop_lrs2_rtype = {hi_5,lo_5}; // @[Cat.scala 30:58]
  assign io_deq_uop_frs3_en = _T_429 == 32'h40; // @[Decode.scala 14:121]
  assign io_deq_uop_fp_val = _bit_T_536 | _bit_T_285; // @[Decode.scala 15:30]
  assign io_deq_uop_fp_single = _T_1 | _T_3; // @[Decode.scala 15:30]
  assign io_deq_uop_xcpt_pf_if = io_enq_uop_xcpt_pf_if; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_xcpt_ae_if = io_enq_uop_xcpt_ae_if; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_xcpt_ma_if = io_enq_uop_xcpt_ma_if; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_bp_debug_if = io_enq_uop_bp_debug_if; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_bp_xcpt_if = io_enq_uop_bp_xcpt_if; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_debug_fsrc = io_enq_uop_debug_fsrc; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_deq_uop_debug_tsrc = io_enq_uop_debug_tsrc; // @[decode.scala 474:17 decode.scala 475:7]
  assign io_csr_decode_csr = io_enq_uop_inst[31:20]; // @[decode.scala 488:28]
endmodule
