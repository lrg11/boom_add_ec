module UniCoreALU(
  input         clock,
  input         reset,
  input         io_uop_switch,
  input         io_uop_switch_off,
  input         io_uop_is_unicore,
  input  [2:0]  io_uop_shift,
  input  [1:0]  io_uop_lrs3_rtype,
  input         io_uop_rflag,
  input         io_uop_wflag,
  input  [3:0]  io_uop_prflag,
  input  [3:0]  io_uop_pwflag,
  input         io_uop_pflag_busy,
  input  [3:0]  io_uop_stale_pflag,
  input  [3:0]  io_uop_op1_sel,
  input  [3:0]  io_uop_op2_sel,
  input  [5:0]  io_uop_split_num,
  input  [5:0]  io_uop_self_index,
  input  [5:0]  io_uop_rob_inst_idx,
  input  [5:0]  io_uop_address_num,
  input  [6:0]  io_uop_uopc,
  input  [31:0] io_uop_inst,
  input  [31:0] io_uop_debug_inst,
  input         io_uop_is_rvc,
  input  [39:0] io_uop_debug_pc,
  input  [2:0]  io_uop_iq_type,
  input  [9:0]  io_uop_fu_code,
  input  [3:0]  io_uop_ctrl_br_type,
  input  [1:0]  io_uop_ctrl_op1_sel,
  input  [2:0]  io_uop_ctrl_op2_sel,
  input  [2:0]  io_uop_ctrl_imm_sel,
  input  [3:0]  io_uop_ctrl_op_fcn,
  input         io_uop_ctrl_fcn_dw,
  input  [2:0]  io_uop_ctrl_csr_cmd,
  input         io_uop_ctrl_is_load,
  input         io_uop_ctrl_is_sta,
  input         io_uop_ctrl_is_std,
  input  [1:0]  io_uop_ctrl_op3_sel,
  input  [1:0]  io_uop_iw_state,
  input         io_uop_iw_p1_poisoned,
  input         io_uop_iw_p2_poisoned,
  input         io_uop_is_br,
  input         io_uop_is_jalr,
  input         io_uop_is_jal,
  input         io_uop_is_sfb,
  input  [11:0] io_uop_br_mask,
  input  [3:0]  io_uop_br_tag,
  input  [4:0]  io_uop_ftq_idx,
  input         io_uop_edge_inst,
  input  [5:0]  io_uop_pc_lob,
  input         io_uop_taken,
  input  [19:0] io_uop_imm_packed,
  input  [11:0] io_uop_csr_addr,
  input  [5:0]  io_uop_rob_idx,
  input  [4:0]  io_uop_ldq_idx,
  input  [4:0]  io_uop_stq_idx,
  input  [1:0]  io_uop_rxq_idx,
  input  [6:0]  io_uop_pdst,
  input  [6:0]  io_uop_prs1,
  input  [6:0]  io_uop_prs2,
  input  [6:0]  io_uop_prs3,
  input  [4:0]  io_uop_ppred,
  input         io_uop_prs1_busy,
  input         io_uop_prs2_busy,
  input         io_uop_prs3_busy,
  input         io_uop_ppred_busy,
  input  [6:0]  io_uop_stale_pdst,
  input         io_uop_exception,
  input  [63:0] io_uop_exc_cause,
  input         io_uop_bypassable,
  input  [4:0]  io_uop_mem_cmd,
  input  [1:0]  io_uop_mem_size,
  input         io_uop_mem_signed,
  input         io_uop_is_fence,
  input         io_uop_is_fencei,
  input         io_uop_is_amo,
  input         io_uop_uses_ldq,
  input         io_uop_uses_stq,
  input         io_uop_is_sys_pc2epc,
  input         io_uop_is_unique,
  input         io_uop_flush_on_commit,
  input         io_uop_ldst_is_rs1,
  input  [5:0]  io_uop_ldst,
  input  [5:0]  io_uop_lrs1,
  input  [5:0]  io_uop_lrs2,
  input  [5:0]  io_uop_lrs3,
  input         io_uop_ldst_val,
  input  [1:0]  io_uop_dst_rtype,
  input  [1:0]  io_uop_lrs1_rtype,
  input  [1:0]  io_uop_lrs2_rtype,
  input         io_uop_frs3_en,
  input         io_uop_fp_val,
  input         io_uop_fp_single,
  input         io_uop_xcpt_pf_if,
  input         io_uop_xcpt_ae_if,
  input         io_uop_xcpt_ma_if,
  input         io_uop_bp_debug_if,
  input         io_uop_bp_xcpt_if,
  input  [1:0]  io_uop_debug_fsrc,
  input  [1:0]  io_uop_debug_tsrc,
  input  [3:0]  io_flagdata,
  input  [63:0] io_riscv_op1_data,
  input  [63:0] io_rs1_data,
  input  [63:0] io_rs2_data,
  output [63:0] io_out,
  output        io_flagdata_out_valid,
  output [3:0]  io_flagdata_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  _T = 4'h1 == io_uop_op1_sel; // @[Conditional.scala 37:30]
  wire  _T_1 = 4'h2 == io_uop_op1_sel; // @[Conditional.scala 37:30]
  wire  _T_2 = 4'h3 == io_uop_op1_sel; // @[Conditional.scala 37:30]
  wire  _T_3 = 4'h4 == io_uop_op1_sel; // @[Conditional.scala 37:30]
  wire  _T_5 = 4'h5 == io_uop_op1_sel; // @[Conditional.scala 37:30]
  wire  _T_7 = 4'h6 == io_uop_op1_sel; // @[Conditional.scala 37:30]
  wire  _T_8 = 4'h7 == io_uop_op1_sel; // @[Conditional.scala 37:30]
  wire [63:0] _GEN_1 = _T_8 ? io_riscv_op1_data : 64'h0; // @[Conditional.scala 39:67 functional-unit.scala 312:25]
  wire [63:0] _GEN_2 = _T_7 ? 64'h4 : _GEN_1; // @[Conditional.scala 39:67 functional-unit.scala 311:25]
  wire [63:0] _GEN_3 = _T_5 ? {{55'd0}, io_uop_imm_packed[8:0]} : _GEN_2; // @[Conditional.scala 39:67 functional-unit.scala 310:25]
  wire [63:0] _GEN_4 = _T_3 ? {{59'd0}, io_uop_inst[13:9]} : _GEN_3; // @[Conditional.scala 39:67 functional-unit.scala 309:25]
  wire [63:0] _GEN_5 = _T_2 ? 64'h0 : _GEN_4; // @[Conditional.scala 39:67 functional-unit.scala 308:25]
  wire [63:0] _GEN_6 = _T_1 ? io_rs2_data : _GEN_5; // @[Conditional.scala 39:67 functional-unit.scala 307:25]
  wire [63:0] data1 = _T ? io_rs1_data : _GEN_6; // @[Conditional.scala 40:58 functional-unit.scala 306:25]
  wire  _T_10 = 4'h1 == io_uop_op2_sel; // @[Conditional.scala 37:30]
  wire  _T_11 = 4'h2 == io_uop_op2_sel; // @[Conditional.scala 37:30]
  wire  _T_12 = 4'h3 == io_uop_op2_sel; // @[Conditional.scala 37:30]
  wire  _T_13 = 4'h4 == io_uop_op2_sel; // @[Conditional.scala 37:30]
  wire  _T_15 = 4'h5 == io_uop_op2_sel; // @[Conditional.scala 37:30]
  wire  _T_17 = 4'h6 == io_uop_op2_sel; // @[Conditional.scala 37:30]
  wire  _T_18 = 4'h7 == io_uop_op2_sel; // @[Conditional.scala 37:30]
  wire  _T_19 = 4'h0 == io_uop_op2_sel; // @[Conditional.scala 37:30]
  wire  _T_20 = 4'h9 == io_uop_op2_sel; // @[Conditional.scala 37:30]
  wire  _T_22 = 4'ha == io_uop_op2_sel; // @[Conditional.scala 37:30]
  wire [4:0] lo = io_uop_inst[4:0]; // @[functional-unit.scala 326:56]
  wire [9:0] _T_23 = {io_uop_inst[13:9],lo}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_8 = _T_22 ? {{54'd0}, _T_23} : 64'h0; // @[Conditional.scala 39:67 functional-unit.scala 326:25]
  wire [63:0] _GEN_9 = _T_20 ? {{50'd0}, io_uop_inst[13:0]} : _GEN_8; // @[Conditional.scala 39:67 functional-unit.scala 325:25]
  wire [63:0] _GEN_10 = _T_19 ? 64'h0 : _GEN_9; // @[Conditional.scala 39:67 functional-unit.scala 324:25]
  wire [63:0] _GEN_11 = _T_18 ? 64'h0 : _GEN_10; // @[Conditional.scala 39:67 functional-unit.scala 323:25]
  wire [63:0] _GEN_12 = _T_17 ? 64'h4 : _GEN_11; // @[Conditional.scala 39:67 functional-unit.scala 322:25]
  wire [63:0] _GEN_13 = _T_15 ? {{55'd0}, io_uop_imm_packed[8:0]} : _GEN_12; // @[Conditional.scala 39:67 functional-unit.scala 321:25]
  wire [63:0] _GEN_14 = _T_13 ? {{59'd0}, io_uop_inst[13:9]} : _GEN_13; // @[Conditional.scala 39:67 functional-unit.scala 320:25]
  wire [63:0] _GEN_15 = _T_12 ? 64'h0 : _GEN_14; // @[Conditional.scala 39:67 functional-unit.scala 319:25]
  wire [63:0] _GEN_16 = _T_11 ? io_rs2_data : _GEN_15; // @[Conditional.scala 39:67 functional-unit.scala 318:25]
  wire [63:0] data2 = _T_10 ? io_rs1_data : _GEN_16; // @[Conditional.scala 40:58 functional-unit.scala 317:25]
  wire [63:0] _T_24 = {{5'd0}, data2[63:5]}; // @[functional-unit.scala 330:40]
  wire  shift_data_valid = _T_24 != 64'h0; // @[functional-unit.scala 330:49]
  wire [4:0] shift_bits = data2[4:0]; // @[functional-unit.scala 331:25]
  wire [62:0] _GEN_21 = {{31'd0}, data1[31:0]}; // @[functional-unit.scala 332:79]
  wire [62:0] _T_26 = _GEN_21 << shift_bits; // @[functional-unit.scala 332:79]
  wire [62:0] op1_data_lg_left = shift_data_valid ? 63'h0 : _T_26; // @[functional-unit.scala 332:29]
  wire  _T_28 = shift_bits == 5'h0; // @[functional-unit.scala 334:89]
  wire  _T_29 = io_uop_op2_sel == 4'h4 & shift_bits == 5'h0; // @[functional-unit.scala 334:74]
  wire  _T_30 = shift_data_valid | io_uop_op2_sel == 4'h4 & shift_bits == 5'h0; // @[functional-unit.scala 334:48]
  wire [31:0] _T_32 = data1[31:0] >> shift_bits; // @[functional-unit.scala 335:51]
  wire [31:0] op1_data_lg_right = shift_data_valid | io_uop_op2_sel == 4'h4 & shift_bits == 5'h0 ? 32'h0 : _T_32; // @[functional-unit.scala 334:30]
  wire [31:0] _T_38 = data1[31:0]; // @[functional-unit.scala 338:44]
  wire  _GEN_23 = _T_38[31]; // @[functional-unit.scala 338:51]
  wire [31:0] _T_40 = {32{_GEN_23}}; // @[functional-unit.scala 338:60]
  wire [31:0] _T_44 = $signed(_T_38) >>> shift_bits; // @[functional-unit.scala 339:73]
  wire [31:0] op1_data_al_right = _T_30 ? _T_40 : _T_44; // @[functional-unit.scala 337:30]
  wire  _T_45 = io_uop_uopc == 7'h6e; // @[functional-unit.scala 341:34]
  wire  shift_from_reg = io_uop_uopc == 7'h6e & (io_uop_op2_sel == 4'h1 | io_uop_op2_sel == 4'h2); // @[functional-unit.scala 341:47]
  wire  hi_1 = io_flagdata[2]; // @[functional-unit.scala 344:15]
  wire [30:0] lo_1 = data1[31:1]; // @[functional-unit.scala 344:27]
  wire [31:0] _T_54 = {hi_1,lo_1}; // @[Cat.scala 30:58]
  wire [5:0] _GEN_24 = {{1'd0}, shift_bits}; // @[functional-unit.scala 346:79]
  wire [5:0] _T_62 = 6'h20 - _GEN_24; // @[functional-unit.scala 346:79]
  wire [94:0] _GEN_25 = {{63'd0}, data1[31:0]}; // @[functional-unit.scala 346:70]
  wire [94:0] _T_63 = _GEN_25 << _T_62; // @[functional-unit.scala 346:70]
  wire [94:0] _GEN_26 = {{63'd0}, _T_32}; // @[functional-unit.scala 346:48]
  wire [94:0] _T_64 = _GEN_26 | _T_63; // @[functional-unit.scala 346:48]
  wire [63:0] _T_75 = io_uop_op1_sel == 4'h5 ? {{32'd0}, _T_64[31:0]} : data1; // @[functional-unit.scala 347:8]
  wire [63:0] _T_76 = io_uop_op1_sel == 4'h1 & shift_bits != 5'h0 ? {{32'd0}, _T_64[31:0]} : _T_75; // @[functional-unit.scala 345:6]
  wire [63:0] op1_data_lp_right = _T_29 & io_uop_op1_sel != 4'h5 ? {{32'd0}, _T_54} : _T_76; // @[functional-unit.scala 343:30]
  wire  _T_77 = io_uop_shift == 3'h7; // @[functional-unit.scala 352:41]
  wire  _T_78 = io_uop_shift == 3'h6; // @[functional-unit.scala 353:43]
  wire  _T_79 = io_uop_shift == 3'h4; // @[functional-unit.scala 354:43]
  wire [63:0] _T_81 = io_uop_shift == 3'h5 ? op1_data_lp_right : data1; // @[functional-unit.scala 355:32]
  wire [63:0] _T_82 = io_uop_shift == 3'h4 ? {{32'd0}, op1_data_al_right} : _T_81; // @[functional-unit.scala 354:32]
  wire [63:0] _T_83 = io_uop_shift == 3'h6 ? {{32'd0}, op1_data_lg_right} : _T_82; // @[functional-unit.scala 353:32]
  wire [63:0] shift_out_unicore = io_uop_shift == 3'h7 ? {{1'd0}, op1_data_lg_left} : _T_83; // @[functional-unit.scala 352:30]
  wire  isSub = io_uop_ctrl_op_fcn == 4'ha; // @[functional-unit.scala 359:31]
  wire [31:0] _T_88 = hi_1 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _T_89 = {31'h0,hi_1}; // @[Cat.scala 30:58]
  wire [31:0] _T_90 = isSub ? _T_88 : _T_89; // @[functional-unit.scala 360:60]
  wire [31:0] carryData = io_uop_rflag & io_uop_uopc != 7'h71 ? _T_90 : 32'h0; // @[functional-unit.scala 360:22]
  wire [31:0] _T_92 = ~data2[31:0]; // @[functional-unit.scala 361:28]
  wire [31:0] in2_inv = isSub ? _T_92 : data2[31:0]; // @[functional-unit.scala 361:20]
  wire [32:0] _T_94 = {1'h0,data1[31:0]}; // @[Cat.scala 30:58]
  wire [32:0] _T_95 = {1'h0,in2_inv}; // @[Cat.scala 30:58]
  wire [32:0] _T_97 = _T_94 + _T_95; // @[functional-unit.scala 363:45]
  wire [32:0] _GEN_30 = {{32'd0}, isSub}; // @[functional-unit.scala 363:71]
  wire [32:0] _T_99 = _T_97 + _GEN_30; // @[functional-unit.scala 363:71]
  wire [32:0] _T_100 = {1'h0,carryData}; // @[Cat.scala 30:58]
  wire [32:0] add_temp = _T_99 + _T_100; // @[functional-unit.scala 363:86]
  wire  add_carry = add_temp[32]; // @[functional-unit.scala 364:27]
  wire  is_add = io_uop_op2_sel[0]; // @[functional-unit.scala 367:27]
  wire [9:0] raw_offset = io_uop_ctrl_imm_sel == 3'h7 ? {{4'd0}, io_uop_address_num} : io_uop_imm_packed[9:0]; // @[functional-unit.scala 368:23]
  wire [9:0] _T_104 = ~raw_offset; // @[functional-unit.scala 369:48]
  wire [9:0] _T_106 = _T_104 + 10'h1; // @[functional-unit.scala 369:59]
  wire [9:0] _T_108 = is_add ? raw_offset : _T_106; // @[functional-unit.scala 370:59]
  wire [11:0] _T_109 = {$signed(_T_108), 2'h0}; // @[functional-unit.scala 370:66]
  wire [63:0] _GEN_31 = {{52{_T_109[11]}},_T_109}; // @[functional-unit.scala 370:41]
  wire [63:0] sum_unicore = $signed(io_rs1_data) + $signed(_GEN_31); // @[functional-unit.scala 370:80]
  wire [24:0] _T_115 = ~sum_unicore[63:39]; // @[functional-unit.scala 371:55]
  wire  _T_118 = sum_unicore[63:39] != 25'h0; // @[functional-unit.scala 372:82]
  wire  ea_sign_unicore = sum_unicore[38] ? _T_115 == 25'h0 : _T_118; // @[functional-unit.scala 371:28]
  wire [38:0] lo_5 = sum_unicore[38:0]; // @[functional-unit.scala 373:58]
  wire [39:0] adda_out_unicore = {ea_sign_unicore,lo_5}; // @[Cat.scala 30:58]
  wire [1:0] hi_hi = data1[31:30]; // @[functional-unit.scala 376:35]
  wire  hi_lo = data2[0]; // @[functional-unit.scala 376:57]
  wire [28:0] lo_6 = data1[28:0]; // @[functional-unit.scala 376:74]
  wire [31:0] mffc_out_unicore = {hi_hi,hi_lo,lo_6}; // @[Cat.scala 30:58]
  wire [63:0] xor_out_unicore = data1 ^ data2; // @[functional-unit.scala 380:38]
  wire [63:0] and_out_unicore = data1 & data2; // @[functional-unit.scala 381:38]
  wire [63:0] or_out_unicore = data1 | data2; // @[functional-unit.scala 382:37]
  wire [63:0] _T_119 = ~data2; // @[functional-unit.scala 383:41]
  wire [63:0] andn_out_unicore = data1 & _T_119; // @[functional-unit.scala 383:39]
  wire [63:0] link_res = {data1[31:0],data2[31:0]}; // @[Cat.scala 30:58]
  wire [63:0] _T_120 = _T ? io_rs1_data : _GEN_6; // @[functional-unit.scala 388:25]
  wire [63:0] _T_121 = _T_10 ? io_rs1_data : _GEN_16; // @[functional-unit.scala 388:40]
  wire [63:0] sadd_res = $signed(_T_120) + $signed(_T_121); // @[functional-unit.scala 388:32]
  wire [63:0] uadd_res = data1 + data2; // @[functional-unit.scala 389:32]
  wire [5:0] _T_189 = hi_lo ? 6'h1f : 6'h20; // @[functional-unit.scala 392:69]
  wire [5:0] _T_190 = data2[1] ? 6'h1e : _T_189; // @[functional-unit.scala 392:69]
  wire [5:0] _T_191 = data2[2] ? 6'h1d : _T_190; // @[functional-unit.scala 392:69]
  wire [5:0] _T_192 = data2[3] ? 6'h1c : _T_191; // @[functional-unit.scala 392:69]
  wire [5:0] _T_193 = data2[4] ? 6'h1b : _T_192; // @[functional-unit.scala 392:69]
  wire [5:0] _T_194 = data2[5] ? 6'h1a : _T_193; // @[functional-unit.scala 392:69]
  wire [5:0] _T_195 = data2[6] ? 6'h19 : _T_194; // @[functional-unit.scala 392:69]
  wire [5:0] _T_196 = data2[7] ? 6'h18 : _T_195; // @[functional-unit.scala 392:69]
  wire [5:0] _T_197 = data2[8] ? 6'h17 : _T_196; // @[functional-unit.scala 392:69]
  wire [5:0] _T_198 = data2[9] ? 6'h16 : _T_197; // @[functional-unit.scala 392:69]
  wire [5:0] _T_199 = data2[10] ? 6'h15 : _T_198; // @[functional-unit.scala 392:69]
  wire [5:0] _T_200 = data2[11] ? 6'h14 : _T_199; // @[functional-unit.scala 392:69]
  wire [5:0] _T_201 = data2[12] ? 6'h13 : _T_200; // @[functional-unit.scala 392:69]
  wire [5:0] _T_202 = data2[13] ? 6'h12 : _T_201; // @[functional-unit.scala 392:69]
  wire [5:0] _T_203 = data2[14] ? 6'h11 : _T_202; // @[functional-unit.scala 392:69]
  wire [5:0] _T_204 = data2[15] ? 6'h10 : _T_203; // @[functional-unit.scala 392:69]
  wire [5:0] _T_205 = data2[16] ? 6'hf : _T_204; // @[functional-unit.scala 392:69]
  wire [5:0] _T_206 = data2[17] ? 6'he : _T_205; // @[functional-unit.scala 392:69]
  wire [5:0] _T_207 = data2[18] ? 6'hd : _T_206; // @[functional-unit.scala 392:69]
  wire [5:0] _T_208 = data2[19] ? 6'hc : _T_207; // @[functional-unit.scala 392:69]
  wire [5:0] _T_209 = data2[20] ? 6'hb : _T_208; // @[functional-unit.scala 392:69]
  wire [5:0] _T_210 = data2[21] ? 6'ha : _T_209; // @[functional-unit.scala 392:69]
  wire [5:0] _T_211 = data2[22] ? 6'h9 : _T_210; // @[functional-unit.scala 392:69]
  wire [5:0] _T_212 = data2[23] ? 6'h8 : _T_211; // @[functional-unit.scala 392:69]
  wire [5:0] _T_213 = data2[24] ? 6'h7 : _T_212; // @[functional-unit.scala 392:69]
  wire [5:0] _T_214 = data2[25] ? 6'h6 : _T_213; // @[functional-unit.scala 392:69]
  wire [5:0] _T_215 = data2[26] ? 6'h5 : _T_214; // @[functional-unit.scala 392:69]
  wire [5:0] _T_216 = data2[27] ? 6'h4 : _T_215; // @[functional-unit.scala 392:69]
  wire [5:0] _T_217 = data2[28] ? 6'h3 : _T_216; // @[functional-unit.scala 392:69]
  wire [5:0] _T_218 = data2[29] ? 6'h2 : _T_217; // @[functional-unit.scala 392:69]
  wire [5:0] _T_219 = data2[30] ? 6'h1 : _T_218; // @[functional-unit.scala 392:69]
  wire [5:0] cntlz_out_unicore = data2[31] ? 6'h0 : _T_219; // @[functional-unit.scala 392:69]
  wire [5:0] _T_285 = _T_119[0] ? 6'h1f : 6'h20; // @[functional-unit.scala 392:69]
  wire [5:0] _T_286 = _T_119[1] ? 6'h1e : _T_285; // @[functional-unit.scala 392:69]
  wire [5:0] _T_287 = _T_119[2] ? 6'h1d : _T_286; // @[functional-unit.scala 392:69]
  wire [5:0] _T_288 = _T_119[3] ? 6'h1c : _T_287; // @[functional-unit.scala 392:69]
  wire [5:0] _T_289 = _T_119[4] ? 6'h1b : _T_288; // @[functional-unit.scala 392:69]
  wire [5:0] _T_290 = _T_119[5] ? 6'h1a : _T_289; // @[functional-unit.scala 392:69]
  wire [5:0] _T_291 = _T_119[6] ? 6'h19 : _T_290; // @[functional-unit.scala 392:69]
  wire [5:0] _T_292 = _T_119[7] ? 6'h18 : _T_291; // @[functional-unit.scala 392:69]
  wire [5:0] _T_293 = _T_119[8] ? 6'h17 : _T_292; // @[functional-unit.scala 392:69]
  wire [5:0] _T_294 = _T_119[9] ? 6'h16 : _T_293; // @[functional-unit.scala 392:69]
  wire [5:0] _T_295 = _T_119[10] ? 6'h15 : _T_294; // @[functional-unit.scala 392:69]
  wire [5:0] _T_296 = _T_119[11] ? 6'h14 : _T_295; // @[functional-unit.scala 392:69]
  wire [5:0] _T_297 = _T_119[12] ? 6'h13 : _T_296; // @[functional-unit.scala 392:69]
  wire [5:0] _T_298 = _T_119[13] ? 6'h12 : _T_297; // @[functional-unit.scala 392:69]
  wire [5:0] _T_299 = _T_119[14] ? 6'h11 : _T_298; // @[functional-unit.scala 392:69]
  wire [5:0] _T_300 = _T_119[15] ? 6'h10 : _T_299; // @[functional-unit.scala 392:69]
  wire [5:0] _T_301 = _T_119[16] ? 6'hf : _T_300; // @[functional-unit.scala 392:69]
  wire [5:0] _T_302 = _T_119[17] ? 6'he : _T_301; // @[functional-unit.scala 392:69]
  wire [5:0] _T_303 = _T_119[18] ? 6'hd : _T_302; // @[functional-unit.scala 392:69]
  wire [5:0] _T_304 = _T_119[19] ? 6'hc : _T_303; // @[functional-unit.scala 392:69]
  wire [5:0] _T_305 = _T_119[20] ? 6'hb : _T_304; // @[functional-unit.scala 392:69]
  wire [5:0] _T_306 = _T_119[21] ? 6'ha : _T_305; // @[functional-unit.scala 392:69]
  wire [5:0] _T_307 = _T_119[22] ? 6'h9 : _T_306; // @[functional-unit.scala 392:69]
  wire [5:0] _T_308 = _T_119[23] ? 6'h8 : _T_307; // @[functional-unit.scala 392:69]
  wire [5:0] _T_309 = _T_119[24] ? 6'h7 : _T_308; // @[functional-unit.scala 392:69]
  wire [5:0] _T_310 = _T_119[25] ? 6'h6 : _T_309; // @[functional-unit.scala 392:69]
  wire [5:0] _T_311 = _T_119[26] ? 6'h5 : _T_310; // @[functional-unit.scala 392:69]
  wire [5:0] _T_312 = _T_119[27] ? 6'h4 : _T_311; // @[functional-unit.scala 392:69]
  wire [5:0] _T_313 = _T_119[28] ? 6'h3 : _T_312; // @[functional-unit.scala 392:69]
  wire [5:0] _T_314 = _T_119[29] ? 6'h2 : _T_313; // @[functional-unit.scala 392:69]
  wire [5:0] _T_315 = _T_119[30] ? 6'h1 : _T_314; // @[functional-unit.scala 392:69]
  wire [5:0] cntlo_out_unicore = _T_119[31] ? 6'h0 : _T_315; // @[functional-unit.scala 392:69]
  wire  _T_316 = io_uop_uopc == 7'h6d; // @[functional-unit.scala 397:42]
  wire  _T_317 = io_uop_uopc == 7'h72; // @[functional-unit.scala 397:65]
  wire  cexe = io_uop_is_unicore & (io_uop_uopc == 7'h6d | io_uop_uopc == 7'h72) & io_uop_inst[23]; // @[functional-unit.scala 397:77]
  wire  exe_fz_unicore = io_flagdata[1]; // @[functional-unit.scala 404:33]
  wire  exe_fs_unicore = io_flagdata[0]; // @[functional-unit.scala 406:33]
  wire  exe_fv_unicore = io_flagdata[3]; // @[functional-unit.scala 407:33]
  wire  cexe_fz_unicore = io_uop_inst[22:19] == 4'h0; // @[functional-unit.scala 408:42]
  wire  cexe_nz_unicore = io_uop_inst[22:19] == 4'h1; // @[functional-unit.scala 409:42]
  wire  cexe_fc_unicore = io_uop_inst[22:19] == 4'h2; // @[functional-unit.scala 410:42]
  wire  cexe_nc_unicore = io_uop_inst[22:19] == 4'h3; // @[functional-unit.scala 411:42]
  wire  cexe_fs_unicore = io_uop_inst[22:19] == 4'h4; // @[functional-unit.scala 412:42]
  wire  cexe_ns_unicore = io_uop_inst[22:19] == 4'h5; // @[functional-unit.scala 413:42]
  wire  cexe_fv_unicore = io_uop_inst[22:19] == 4'h6; // @[functional-unit.scala 414:42]
  wire  cexe_nv_unicore = io_uop_inst[22:19] == 4'h7; // @[functional-unit.scala 415:42]
  wire  cexe_fc_and_nz_unicore = io_uop_inst[22:19] == 4'h8; // @[functional-unit.scala 416:49]
  wire  cexe_nc_or_fz_unicore = io_uop_inst[22:19] == 4'h9; // @[functional-unit.scala 417:48]
  wire  cexe_s_eq_v_unicore = io_uop_inst[22:19] == 4'ha; // @[functional-unit.scala 418:46]
  wire  cexe_s_ne_v_unicore = io_uop_inst[22:19] == 4'hb; // @[functional-unit.scala 419:46]
  wire  cexe_nz_and_s_eq_v_unicore = io_uop_inst[22:19] == 4'hc; // @[functional-unit.scala 420:53]
  wire  cexe_fz_or_s_ne_v_unicore = io_uop_inst[22:19] == 4'hd; // @[functional-unit.scala 421:52]
  wire  _T_341 = ~exe_fs_unicore; // @[functional-unit.scala 423:55]
  wire  _T_342 = ~exe_fv_unicore; // @[functional-unit.scala 423:74]
  wire  s_eq_v = exe_fs_unicore & exe_fv_unicore | ~exe_fs_unicore & ~exe_fv_unicore; // @[functional-unit.scala 423:51]
  wire  _T_345 = ~exe_fz_unicore; // @[functional-unit.scala 426:23]
  wire  _T_346 = cexe_nz_unicore & ~exe_fz_unicore; // @[functional-unit.scala 426:20]
  wire  _T_347 = cexe_fz_unicore & exe_fz_unicore | _T_346; // @[functional-unit.scala 425:68]
  wire  _T_350 = ~hi_1; // @[functional-unit.scala 427:23]
  wire  _T_351 = cexe_nc_unicore & ~hi_1; // @[functional-unit.scala 427:20]
  wire  _T_352 = _T_347 | cexe_fc_unicore & hi_1 | _T_351; // @[functional-unit.scala 426:79]
  wire  _T_356 = cexe_ns_unicore & _T_341; // @[functional-unit.scala 428:20]
  wire  _T_357 = _T_352 | cexe_fs_unicore & exe_fs_unicore | _T_356; // @[functional-unit.scala 427:79]
  wire  _T_361 = cexe_nv_unicore & _T_342; // @[functional-unit.scala 429:20]
  wire  _T_362 = _T_357 | cexe_fv_unicore & exe_fv_unicore | _T_361; // @[functional-unit.scala 428:79]
  wire  _T_369 = cexe_nc_or_fz_unicore & (_T_350 | exe_fz_unicore); // @[functional-unit.scala 430:26]
  wire  _T_370 = _T_362 | cexe_fc_and_nz_unicore & hi_1 & _T_345 | _T_369; // @[functional-unit.scala 429:105]
  wire  _T_371 = cexe_s_eq_v_unicore & s_eq_v; // @[functional-unit.scala 431:24]
  wire  _T_372 = _T_370 | _T_371; // @[functional-unit.scala 430:66]
  wire  _T_373 = ~s_eq_v; // @[functional-unit.scala 431:62]
  wire  _T_378 = cexe_nz_and_s_eq_v_unicore & _T_345 & s_eq_v; // @[functional-unit.scala 432:50]
  wire  _T_379 = _T_372 | cexe_s_ne_v_unicore & ~s_eq_v | _T_378; // @[functional-unit.scala 431:71]
  wire  _T_382 = cexe_fz_or_s_ne_v_unicore & (exe_fz_unicore | _T_373); // @[functional-unit.scala 433:30]
  wire  _T_383 = _T_379 | _T_382; // @[functional-unit.scala 432:61]
  wire  cexe_invalid = cexe & ~_T_383; // @[functional-unit.scala 425:27]
  wire  isSignH = io_uop_uopc == 7'h6f; // @[functional-unit.scala 436:26]
  wire  isSignB = io_uop_uopc == 7'h70; // @[functional-unit.scala 437:26]
  wire [15:0] lo_8 = data1[15:0]; // @[functional-unit.scala 438:93]
  wire [31:0] _T_388 = {16'hffff,lo_8}; // @[Cat.scala 30:58]
  wire [7:0] lo_9 = data1[7:0]; // @[functional-unit.scala 439:86]
  wire [31:0] _T_392 = {24'hffffff,lo_9}; // @[Cat.scala 30:58]
  wire [63:0] _T_393 = isSignB & data1[7] ? {{32'd0}, _T_392} : data1; // @[functional-unit.scala 439:28]
  wire [63:0] signExtend_res_unicore = isSignH & data1[15] ? {{32'd0}, _T_388} : _T_393; // @[functional-unit.scala 438:35]
  wire  _T_412 = io_uop_uopc == 7'h28; // @[functional-unit.scala 456:38]
  wire  _T_413 = io_uop_uopc == 7'h6c; // @[functional-unit.scala 457:38]
  wire [63:0] _T_415 = io_uop_uopc == 7'h6c ? data2 : {{32'd0}, add_temp[31:0]}; // @[functional-unit.scala 457:28]
  wire [63:0] _T_416 = io_uop_uopc == 7'h28 ? {{32'd0}, mffc_out_unicore} : _T_415; // @[functional-unit.scala 456:28]
  wire [63:0] _T_417 = io_uop_uopc == 7'h7c ? {{24'd0}, adda_out_unicore} : _T_416; // @[functional-unit.scala 455:28]
  wire [63:0] _T_418 = io_uop_uopc == 7'h74 ? link_res : _T_417; // @[functional-unit.scala 454:28]
  wire [63:0] _T_419 = io_uop_uopc == 7'h78 ? {{32'd0}, uadd_res[63:32]} : _T_418; // @[functional-unit.scala 453:28]
  wire [63:0] _T_420 = io_uop_uopc == 7'h75 ? {{32'd0}, sadd_res[63:32]} : _T_419; // @[functional-unit.scala 452:28]
  wire [63:0] _T_421 = io_uop_uopc == 7'h53 ? {{58'd0}, cntlo_out_unicore} : _T_420; // @[functional-unit.scala 451:28]
  wire [63:0] _T_422 = io_uop_uopc == 7'h52 ? {{58'd0}, cntlz_out_unicore} : _T_421; // @[functional-unit.scala 450:28]
  wire [63:0] _T_423 = io_uop_uopc == 7'h73 ? andn_out_unicore : _T_422; // @[functional-unit.scala 449:28]
  wire [63:0] _T_424 = io_uop_uopc == 7'h14 ? or_out_unicore : _T_423; // @[functional-unit.scala 448:28]
  wire [63:0] _T_425 = io_uop_uopc == 7'h15 ? xor_out_unicore : _T_424; // @[functional-unit.scala 447:28]
  wire [63:0] _T_426 = io_uop_uopc == 7'h13 ? and_out_unicore : _T_425; // @[functional-unit.scala 446:28]
  wire [63:0] _T_427 = _T_317 ? _T_119 : _T_426; // @[functional-unit.scala 445:28]
  wire [63:0] _T_428 = _T_316 ? data2 : _T_427; // @[functional-unit.scala 444:28]
  wire [63:0] _T_429 = _T_45 ? shift_out_unicore : _T_428; // @[functional-unit.scala 443:28]
  wire [63:0] _T_430 = isSignB ? signExtend_res_unicore : _T_429; // @[functional-unit.scala 442:28]
  wire [63:0] alu_out_unicore = isSignH ? signExtend_res_unicore : _T_430; // @[functional-unit.scala 441:28]
  wire  is_arithmetic = io_uop_uopc == 7'hf | io_uop_uopc == 7'h10; // @[functional-unit.scala 460:43]
  wire  _T_434 = io_uop_ldst == 6'h1f; // @[functional-unit.scala 462:51]
  wire  is_mff_pc = _T_413 & io_uop_ldst == 6'h1f; // @[functional-unit.scala 462:39]
  wire  is_mffc_pc = _T_412 & _T_434; // @[functional-unit.scala 464:41]
  wire [4:0] _T_452 = shift_bits - 5'h1; // @[functional-unit.scala 469:42]
  wire [5:0] flag_shift_num = _T_77 ? _T_62 : {{1'd0}, _T_452}; // @[functional-unit.scala 467:26]
  wire [63:0] _T_457 = $signed(_T_120) >>> flag_shift_num; // @[functional-unit.scala 471:89]
  wire [63:0] _T_458 = data1 >> flag_shift_num; // @[functional-unit.scala 472:46]
  wire [63:0] _T_459 = _T_79 ? _T_457 : _T_458; // @[functional-unit.scala 471:32]
  wire  normal_shift_flag_c = _T_459[0]; // @[functional-unit.scala 472:64]
  wire  _T_469 = _T_79 | _T_78 ? data1[31] : data1[0]; // @[functional-unit.scala 476:28]
  wire  _T_470 = shift_from_reg | _T_77 ? hi_1 : _T_469; // @[functional-unit.scala 475:28]
  wire  shift_flag_c = _T_28 ? _T_470 : normal_shift_flag_c; // @[functional-unit.scala 474:25]
  wire  _T_473 = io_uop_is_unicore & io_uop_wflag & _T_45; // @[functional-unit.scala 479:36]
  reg [4:0] value_lo; // @[Counters.scala 45:37]
  wire [5:0] nextSmall = value_lo + 5'h1; // @[Counters.scala 46:33]
  reg [26:0] value_hi; // @[Counters.scala 50:27]
  wire [26:0] _large_r_T_1 = value_hi + 27'h1; // @[Counters.scala 51:55]
  wire [31:0] value = {value_hi,value_lo}; // @[Cat.scala 30:58]
  wire  _T_482 = alu_out_unicore[31] != data1[31]; // @[functional-unit.scala 492:76]
  wire  flag_add_v = data1[31] == data2[31] & alu_out_unicore[31] != data1[31]; // @[functional-unit.scala 492:50]
  wire  flag_sub_v = data1[31] != data2[31] & _T_482; // @[functional-unit.scala 493:50]
  wire  arithmetic_v = isSub ? flag_sub_v : flag_add_v; // @[functional-unit.scala 494:25]
  wire  _T_491 = is_arithmetic ? arithmetic_v : exe_fv_unicore; // @[functional-unit.scala 497:45]
  wire  flag_v = is_mff_pc ? data2[28] : _T_491; // @[functional-unit.scala 497:19]
  wire  _T_496 = _T_45 ? shift_flag_c : hi_1; // @[functional-unit.scala 498:101]
  wire  _T_497 = is_arithmetic ? add_carry : _T_496; // @[functional-unit.scala 498:71]
  wire  _T_498 = is_mff_pc ? data2[29] : _T_497; // @[functional-unit.scala 498:45]
  wire  flag_c = is_mffc_pc ? hi_lo : _T_498; // @[functional-unit.scala 498:19]
  wire  _T_503 = _T_45 ? exe_fz_unicore : alu_out_unicore == 64'h0; // @[functional-unit.scala 499:45]
  wire  flag_z = is_mff_pc ? data2[30] : _T_503; // @[functional-unit.scala 499:19]
  wire  _T_508 = _T_45 ? exe_fs_unicore : alu_out_unicore[31]; // @[functional-unit.scala 500:45]
  wire  flag_n = is_mff_pc ? data2[31] : _T_508; // @[functional-unit.scala 500:19]
  wire [1:0] lo_10 = {flag_z,flag_n}; // @[Cat.scala 30:58]
  wire [1:0] hi_4 = {flag_v,flag_c}; // @[Cat.scala 30:58]
  assign io_out = cexe_invalid ? data1 : alu_out_unicore; // @[functional-unit.scala 502:16]
  assign io_flagdata_out_valid = cexe & ~_T_383; // @[functional-unit.scala 425:27]
  assign io_flagdata_out_bits = {hi_4,lo_10}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
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
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_473 & ~reset) begin
          $fwrite(32'h80000002,
            "{\"module\":\"UniCoreALU\",\"source\":\"functional-unit.scala:488\",\"cycle\":%d,\"inst\":%d,\"is_arithmetic\":%d,\"flag_shift_num\":%d,\"normal_shift_flag_c\":%d,\"shift_flag_c\":%d,\"shift_bits\":%d,\"shift_from_reg\":%d,\"uop.shift\":%d}\n"
            ,value,io_uop_uopc,is_arithmetic,flag_shift_num,normal_shift_flag_c,shift_flag_c,shift_bits,shift_from_reg,
            io_uop_shift); // @[logging.scala 34:13]
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
  value_lo = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  value_hi = _RAND_1[26:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
