module TageBranchPredictorBank(
  input         clock,
  input         reset,
  input         io_f0_valid,
  input  [39:0] io_f0_pc,
  input  [3:0]  io_f0_mask,
  input  [15:0] io_f1_ghist,
  input         io_f1_lhist,
  input         io_resp_in_0_f1_0_taken,
  input         io_resp_in_0_f1_0_is_br,
  input         io_resp_in_0_f1_0_is_jal,
  input         io_resp_in_0_f1_0_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f1_0_predicted_pc_bits,
  input         io_resp_in_0_f1_1_taken,
  input         io_resp_in_0_f1_1_is_br,
  input         io_resp_in_0_f1_1_is_jal,
  input         io_resp_in_0_f1_1_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f1_1_predicted_pc_bits,
  input         io_resp_in_0_f1_2_taken,
  input         io_resp_in_0_f1_2_is_br,
  input         io_resp_in_0_f1_2_is_jal,
  input         io_resp_in_0_f1_2_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f1_2_predicted_pc_bits,
  input         io_resp_in_0_f1_3_taken,
  input         io_resp_in_0_f1_3_is_br,
  input         io_resp_in_0_f1_3_is_jal,
  input         io_resp_in_0_f1_3_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f1_3_predicted_pc_bits,
  input         io_resp_in_0_f2_0_taken,
  input         io_resp_in_0_f2_0_is_br,
  input         io_resp_in_0_f2_0_is_jal,
  input         io_resp_in_0_f2_0_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f2_0_predicted_pc_bits,
  input         io_resp_in_0_f2_1_taken,
  input         io_resp_in_0_f2_1_is_br,
  input         io_resp_in_0_f2_1_is_jal,
  input         io_resp_in_0_f2_1_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f2_1_predicted_pc_bits,
  input         io_resp_in_0_f2_2_taken,
  input         io_resp_in_0_f2_2_is_br,
  input         io_resp_in_0_f2_2_is_jal,
  input         io_resp_in_0_f2_2_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f2_2_predicted_pc_bits,
  input         io_resp_in_0_f2_3_taken,
  input         io_resp_in_0_f2_3_is_br,
  input         io_resp_in_0_f2_3_is_jal,
  input         io_resp_in_0_f2_3_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f2_3_predicted_pc_bits,
  input         io_resp_in_0_f3_0_taken,
  input         io_resp_in_0_f3_0_is_br,
  input         io_resp_in_0_f3_0_is_jal,
  input         io_resp_in_0_f3_0_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f3_0_predicted_pc_bits,
  input         io_resp_in_0_f3_1_taken,
  input         io_resp_in_0_f3_1_is_br,
  input         io_resp_in_0_f3_1_is_jal,
  input         io_resp_in_0_f3_1_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f3_1_predicted_pc_bits,
  input         io_resp_in_0_f3_2_taken,
  input         io_resp_in_0_f3_2_is_br,
  input         io_resp_in_0_f3_2_is_jal,
  input         io_resp_in_0_f3_2_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f3_2_predicted_pc_bits,
  input         io_resp_in_0_f3_3_taken,
  input         io_resp_in_0_f3_3_is_br,
  input         io_resp_in_0_f3_3_is_jal,
  input         io_resp_in_0_f3_3_predicted_pc_valid,
  input  [39:0] io_resp_in_0_f3_3_predicted_pc_bits,
  output        io_resp_f1_0_taken,
  output        io_resp_f1_0_is_br,
  output        io_resp_f1_0_is_jal,
  output        io_resp_f1_0_predicted_pc_valid,
  output [39:0] io_resp_f1_0_predicted_pc_bits,
  output        io_resp_f1_1_taken,
  output        io_resp_f1_1_is_br,
  output        io_resp_f1_1_is_jal,
  output        io_resp_f1_1_predicted_pc_valid,
  output [39:0] io_resp_f1_1_predicted_pc_bits,
  output        io_resp_f1_2_taken,
  output        io_resp_f1_2_is_br,
  output        io_resp_f1_2_is_jal,
  output        io_resp_f1_2_predicted_pc_valid,
  output [39:0] io_resp_f1_2_predicted_pc_bits,
  output        io_resp_f1_3_taken,
  output        io_resp_f1_3_is_br,
  output        io_resp_f1_3_is_jal,
  output        io_resp_f1_3_predicted_pc_valid,
  output [39:0] io_resp_f1_3_predicted_pc_bits,
  output        io_resp_f2_0_taken,
  output        io_resp_f2_0_is_br,
  output        io_resp_f2_0_is_jal,
  output        io_resp_f2_0_predicted_pc_valid,
  output [39:0] io_resp_f2_0_predicted_pc_bits,
  output        io_resp_f2_1_taken,
  output        io_resp_f2_1_is_br,
  output        io_resp_f2_1_is_jal,
  output        io_resp_f2_1_predicted_pc_valid,
  output [39:0] io_resp_f2_1_predicted_pc_bits,
  output        io_resp_f2_2_taken,
  output        io_resp_f2_2_is_br,
  output        io_resp_f2_2_is_jal,
  output        io_resp_f2_2_predicted_pc_valid,
  output [39:0] io_resp_f2_2_predicted_pc_bits,
  output        io_resp_f2_3_taken,
  output        io_resp_f2_3_is_br,
  output        io_resp_f2_3_is_jal,
  output        io_resp_f2_3_predicted_pc_valid,
  output [39:0] io_resp_f2_3_predicted_pc_bits,
  output        io_resp_f3_0_taken,
  output        io_resp_f3_0_is_br,
  output        io_resp_f3_0_is_jal,
  output        io_resp_f3_0_predicted_pc_valid,
  output [39:0] io_resp_f3_0_predicted_pc_bits,
  output        io_resp_f3_1_taken,
  output        io_resp_f3_1_is_br,
  output        io_resp_f3_1_is_jal,
  output        io_resp_f3_1_predicted_pc_valid,
  output [39:0] io_resp_f3_1_predicted_pc_bits,
  output        io_resp_f3_2_taken,
  output        io_resp_f3_2_is_br,
  output        io_resp_f3_2_is_jal,
  output        io_resp_f3_2_predicted_pc_valid,
  output [39:0] io_resp_f3_2_predicted_pc_bits,
  output        io_resp_f3_3_taken,
  output        io_resp_f3_3_is_br,
  output        io_resp_f3_3_is_jal,
  output        io_resp_f3_3_predicted_pc_valid,
  output [39:0] io_resp_f3_3_predicted_pc_bits,
  output [44:0] io_f3_meta,
  input         io_f3_fire,
  input         io_update_valid,
  input         io_update_bits_is_mispredict_update,
  input         io_update_bits_is_repair_update,
  input  [3:0]  io_update_bits_btb_mispredicts,
  input  [39:0] io_update_bits_pc,
  input  [3:0]  io_update_bits_br_mask,
  input         io_update_bits_cfi_idx_valid,
  input  [1:0]  io_update_bits_cfi_idx_bits,
  input         io_update_bits_cfi_taken,
  input         io_update_bits_cfi_mispredicted,
  input         io_update_bits_cfi_is_br,
  input         io_update_bits_cfi_is_jal,
  input         io_update_bits_cfi_is_jalr,
  input  [15:0] io_update_bits_ghist,
  input         io_update_bits_lhist,
  input  [39:0] io_update_bits_target,
  input  [44:0] io_update_bits_meta
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [63:0] _RAND_13;
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
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [31:0] _RAND_39;
`endif // RANDOMIZE_REG_INIT
  wire  tables_0_clock; // @[tage.scala 224:21]
  wire  tables_0_reset; // @[tage.scala 224:21]
  wire  tables_0_io_f1_req_valid; // @[tage.scala 224:21]
  wire [39:0] tables_0_io_f1_req_pc; // @[tage.scala 224:21]
  wire [15:0] tables_0_io_f1_req_ghist; // @[tage.scala 224:21]
  wire  tables_0_io_f3_resp_0_valid; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_f3_resp_0_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_f3_resp_0_bits_u; // @[tage.scala 224:21]
  wire  tables_0_io_f3_resp_1_valid; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_f3_resp_1_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_f3_resp_1_bits_u; // @[tage.scala 224:21]
  wire  tables_0_io_f3_resp_2_valid; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_f3_resp_2_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_f3_resp_2_bits_u; // @[tage.scala 224:21]
  wire  tables_0_io_f3_resp_3_valid; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_f3_resp_3_bits_ctr; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_f3_resp_3_bits_u; // @[tage.scala 224:21]
  wire  tables_0_io_update_mask_0; // @[tage.scala 224:21]
  wire  tables_0_io_update_mask_1; // @[tage.scala 224:21]
  wire  tables_0_io_update_mask_2; // @[tage.scala 224:21]
  wire  tables_0_io_update_mask_3; // @[tage.scala 224:21]
  wire  tables_0_io_update_taken_0; // @[tage.scala 224:21]
  wire  tables_0_io_update_taken_1; // @[tage.scala 224:21]
  wire  tables_0_io_update_taken_2; // @[tage.scala 224:21]
  wire  tables_0_io_update_taken_3; // @[tage.scala 224:21]
  wire  tables_0_io_update_alloc_0; // @[tage.scala 224:21]
  wire  tables_0_io_update_alloc_1; // @[tage.scala 224:21]
  wire  tables_0_io_update_alloc_2; // @[tage.scala 224:21]
  wire  tables_0_io_update_alloc_3; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_update_old_ctr_0; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_update_old_ctr_1; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_update_old_ctr_2; // @[tage.scala 224:21]
  wire [2:0] tables_0_io_update_old_ctr_3; // @[tage.scala 224:21]
  wire [39:0] tables_0_io_update_pc; // @[tage.scala 224:21]
  wire [15:0] tables_0_io_update_hist; // @[tage.scala 224:21]
  wire  tables_0_io_update_u_mask_0; // @[tage.scala 224:21]
  wire  tables_0_io_update_u_mask_1; // @[tage.scala 224:21]
  wire  tables_0_io_update_u_mask_2; // @[tage.scala 224:21]
  wire  tables_0_io_update_u_mask_3; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_update_u_0; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_update_u_1; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_update_u_2; // @[tage.scala 224:21]
  wire [1:0] tables_0_io_update_u_3; // @[tage.scala 224:21]
  wire  prng_clock; // @[PRNG.scala 82:22]
  wire  prng_reset; // @[PRNG.scala 82:22]
  wire  prng_io_seed_valid; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_0; // @[PRNG.scala 82:22]
  wire  prng_io_seed_bits_1; // @[PRNG.scala 82:22]
  wire  prng_io_increment; // @[PRNG.scala 82:22]
  wire  prng_io_out_0; // @[PRNG.scala 82:22]
  wire  prng_io_out_1; // @[PRNG.scala 82:22]
  wire  prng_1_clock; // @[PRNG.scala 82:22]
  wire  prng_1_reset; // @[PRNG.scala 82:22]
  wire  prng_1_io_seed_valid; // @[PRNG.scala 82:22]
  wire  prng_1_io_seed_bits_0; // @[PRNG.scala 82:22]
  wire  prng_1_io_seed_bits_1; // @[PRNG.scala 82:22]
  wire  prng_1_io_increment; // @[PRNG.scala 82:22]
  wire  prng_1_io_out_0; // @[PRNG.scala 82:22]
  wire  prng_1_io_out_1; // @[PRNG.scala 82:22]
  wire  prng_2_clock; // @[PRNG.scala 82:22]
  wire  prng_2_reset; // @[PRNG.scala 82:22]
  wire  prng_2_io_seed_valid; // @[PRNG.scala 82:22]
  wire  prng_2_io_seed_bits_0; // @[PRNG.scala 82:22]
  wire  prng_2_io_seed_bits_1; // @[PRNG.scala 82:22]
  wire  prng_2_io_increment; // @[PRNG.scala 82:22]
  wire  prng_2_io_out_0; // @[PRNG.scala 82:22]
  wire  prng_2_io_out_1; // @[PRNG.scala 82:22]
  wire  prng_3_clock; // @[PRNG.scala 82:22]
  wire  prng_3_reset; // @[PRNG.scala 82:22]
  wire  prng_3_io_seed_valid; // @[PRNG.scala 82:22]
  wire  prng_3_io_seed_bits_0; // @[PRNG.scala 82:22]
  wire  prng_3_io_seed_bits_1; // @[PRNG.scala 82:22]
  wire  prng_3_io_increment; // @[PRNG.scala 82:22]
  wire  prng_3_io_out_0; // @[PRNG.scala 82:22]
  wire  prng_3_io_out_1; // @[PRNG.scala 82:22]
  reg  s1_update__valid; // @[predictor.scala 184:30]
  reg  s1_update__bits_is_mispredict_update; // @[predictor.scala 184:30]
  reg  s1_update__bits_is_repair_update; // @[predictor.scala 184:30]
  reg [3:0] s1_update__bits_btb_mispredicts; // @[predictor.scala 184:30]
  reg [39:0] s1_update__bits_pc; // @[predictor.scala 184:30]
  reg [3:0] s1_update__bits_br_mask; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_idx_valid; // @[predictor.scala 184:30]
  reg [1:0] s1_update__bits_cfi_idx_bits; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_taken; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_mispredicted; // @[predictor.scala 184:30]
  reg [15:0] s1_update__bits_ghist; // @[predictor.scala 184:30]
  reg [44:0] s1_update__bits_meta; // @[predictor.scala 184:30]
  wire  f3_resps_0_0_valid = tables_0_io_f3_resp_0_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_0_0_bits_u = tables_0_io_f3_resp_0_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_36 = ~f3_resps_0_0_valid & f3_resps_0_0_bits_u == 2'h0; // @[tage.scala 282:45]
  wire [1:0] _T_41 = {{1'd0}, f3_resps_0_0_valid}; // @[tage.scala 283:39]
  wire [1:0] _T_42 = ~_T_41; // @[tage.scala 283:7]
  wire [1:0] _GEN_80 = {{1'd0}, _T_36}; // @[tage.scala 282:77]
  wire [1:0] _T_43 = _GEN_80 & _T_42; // @[tage.scala 282:77]
  wire  f3_meta_allocate_0_valid = _T_43 != 2'h0; // @[tage.scala 293:52]
  wire  f3_resps_0_1_valid = tables_0_io_f3_resp_1_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_0_1_bits_u = tables_0_io_f3_resp_1_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_90 = ~f3_resps_0_1_valid & f3_resps_0_1_bits_u == 2'h0; // @[tage.scala 282:45]
  wire [1:0] _T_95 = {{1'd0}, f3_resps_0_1_valid}; // @[tage.scala 283:39]
  wire [1:0] _T_96 = ~_T_95; // @[tage.scala 283:7]
  wire [1:0] _GEN_81 = {{1'd0}, _T_90}; // @[tage.scala 282:77]
  wire [1:0] _T_97 = _GEN_81 & _T_96; // @[tage.scala 282:77]
  wire  f3_meta_allocate_1_valid = _T_97 != 2'h0; // @[tage.scala 293:52]
  wire  f3_resps_0_2_valid = tables_0_io_f3_resp_2_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_0_2_bits_u = tables_0_io_f3_resp_2_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_144 = ~f3_resps_0_2_valid & f3_resps_0_2_bits_u == 2'h0; // @[tage.scala 282:45]
  wire [1:0] _T_149 = {{1'd0}, f3_resps_0_2_valid}; // @[tage.scala 283:39]
  wire [1:0] _T_150 = ~_T_149; // @[tage.scala 283:7]
  wire [1:0] _GEN_82 = {{1'd0}, _T_144}; // @[tage.scala 282:77]
  wire [1:0] _T_151 = _GEN_82 & _T_150; // @[tage.scala 282:77]
  wire  f3_meta_allocate_2_valid = _T_151 != 2'h0; // @[tage.scala 293:52]
  wire [2:0] f3_resps_0_1_bits_ctr = tables_0_io_f3_resp_1_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_0_0_bits_ctr = tables_0_io_f3_resp_0_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire  f3_resps_0_3_valid = tables_0_io_f3_resp_3_valid; // @[tage.scala 234:25 tage.scala 234:25]
  wire [1:0] f3_resps_0_3_bits_u = tables_0_io_f3_resp_3_bits_u; // @[tage.scala 234:25 tage.scala 234:25]
  wire  _T_198 = ~f3_resps_0_3_valid & f3_resps_0_3_bits_u == 2'h0; // @[tage.scala 282:45]
  wire [1:0] _T_203 = {{1'd0}, f3_resps_0_3_valid}; // @[tage.scala 283:39]
  wire [1:0] _T_204 = ~_T_203; // @[tage.scala 283:7]
  wire [1:0] _GEN_83 = {{1'd0}, _T_198}; // @[tage.scala 282:77]
  wire [1:0] _T_205 = _GEN_83 & _T_204; // @[tage.scala 282:77]
  wire  f3_meta_allocate_3_valid = _T_205 != 2'h0; // @[tage.scala 293:52]
  wire [2:0] f3_resps_0_3_bits_ctr = tables_0_io_f3_resp_3_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [2:0] f3_resps_0_2_bits_ctr = tables_0_io_f3_resp_2_bits_ctr; // @[tage.scala 234:25 tage.scala 234:25]
  wire [19:0] lo = {f3_resps_0_1_bits_u,f3_resps_0_0_bits_u,f3_resps_0_3_bits_ctr,f3_resps_0_2_bits_ctr,
    f3_resps_0_1_bits_ctr,f3_resps_0_0_bits_ctr,f3_meta_allocate_3_valid,f3_meta_allocate_2_valid,
    f3_meta_allocate_1_valid,f3_meta_allocate_0_valid}; // @[tage.scala 213:33]
  wire  f3_meta_alt_differs_0 = io_resp_in_0_f3_0_taken != io_resp_f3_0_taken; // @[tage.scala 275:48]
  wire  f3_meta_alt_differs_2 = io_resp_in_0_f3_2_taken != io_resp_f3_2_taken; // @[tage.scala 275:48]
  wire  f3_meta_alt_differs_1 = io_resp_in_0_f3_1_taken != io_resp_f3_1_taken; // @[tage.scala 275:48]
  wire  f3_meta_alt_differs_3 = io_resp_in_0_f3_3_taken != io_resp_f3_3_taken; // @[tage.scala 275:48]
  wire [11:0] hi = {f3_resps_0_3_valid,f3_resps_0_2_valid,f3_resps_0_1_valid,f3_resps_0_0_valid,f3_meta_alt_differs_3,
    f3_meta_alt_differs_2,f3_meta_alt_differs_1,f3_meta_alt_differs_0,f3_resps_0_3_bits_u,f3_resps_0_2_bits_u}; // @[tage.scala 213:33]
  wire [31:0] _T = {hi,lo}; // @[tage.scala 213:33]
  reg  REG; // @[tage.scala 225:35]
  reg [39:0] REG_1; // @[tage.scala 226:35]
  wire  s1_update_meta_allocate_0_valid = s1_update__bits_meta[0]; // @[tage.scala 236:52]
  wire  s1_update_meta_allocate_1_valid = s1_update__bits_meta[1]; // @[tage.scala 236:52]
  wire  s1_update_meta_allocate_2_valid = s1_update__bits_meta[2]; // @[tage.scala 236:52]
  wire  s1_update_meta_allocate_3_valid = s1_update__bits_meta[3]; // @[tage.scala 236:52]
  wire [1:0] s1_update_meta_provider_u_0 = s1_update__bits_meta[17:16]; // @[tage.scala 236:52]
  wire [1:0] s1_update_meta_provider_u_1 = s1_update__bits_meta[19:18]; // @[tage.scala 236:52]
  wire [1:0] s1_update_meta_provider_u_2 = s1_update__bits_meta[21:20]; // @[tage.scala 236:52]
  wire [1:0] s1_update_meta_provider_u_3 = s1_update__bits_meta[23:22]; // @[tage.scala 236:52]
  wire  s1_update_meta_alt_differs_0 = s1_update__bits_meta[24]; // @[tage.scala 236:52]
  wire  s1_update_meta_alt_differs_1 = s1_update__bits_meta[25]; // @[tage.scala 236:52]
  wire  s1_update_meta_alt_differs_2 = s1_update__bits_meta[26]; // @[tage.scala 236:52]
  wire  s1_update_meta_alt_differs_3 = s1_update__bits_meta[27]; // @[tage.scala 236:52]
  wire  s1_update_meta_provider_0_valid = s1_update__bits_meta[28]; // @[tage.scala 236:52]
  wire  s1_update_meta_provider_1_valid = s1_update__bits_meta[29]; // @[tage.scala 236:52]
  wire  s1_update_meta_provider_2_valid = s1_update__bits_meta[30]; // @[tage.scala 236:52]
  wire  s1_update_meta_provider_3_valid = s1_update__bits_meta[31]; // @[tage.scala 236:52]
  wire [3:0] _T_21 = 4'h1 << s1_update__bits_cfi_idx_bits; // @[OneHot.scala 58:35]
  wire [3:0] _T_23 = s1_update__bits_cfi_mispredicted ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] s1_update_mispredict_mask = _T_21 & _T_23; // @[tage.scala 237:73]
  wire  _T_28 = f3_resps_0_0_bits_ctr == 3'h3 | f3_resps_0_0_bits_ctr == 3'h4 ? io_resp_in_0_f3_0_taken :
    f3_resps_0_0_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _T_56 = s1_update__bits_cfi_idx_bits == 2'h0; // @[tage.scala 297:58]
  wire  _T_57 = s1_update__bits_cfi_idx_valid & _T_56; // @[tage.scala 296:58]
  wire  _T_58 = _T_57 & s1_update__bits_cfi_taken; // @[tage.scala 297:67]
  wire  _T_62 = s1_update__bits_btb_mispredicts != 4'h0; // @[predictor.scala 94:50]
  wire  _T_64 = ~(s1_update__bits_is_mispredict_update | s1_update__bits_is_repair_update | _T_62); // @[predictor.scala 96:26]
  wire [1:0] _T_70 = s1_update_meta_provider_u_0 - 2'h1; // @[tage.scala 218:43]
  wire [1:0] _T_71 = s1_update_meta_provider_u_0 == 2'h0 ? 2'h0 : _T_70; // @[tage.scala 218:24]
  wire [1:0] _T_74 = s1_update_meta_provider_u_0 + 2'h1; // @[tage.scala 219:43]
  wire [1:0] _T_75 = s1_update_meta_provider_u_0 == 2'h3 ? 2'h3 : _T_74; // @[tage.scala 219:24]
  wire [1:0] _T_76 = s1_update_mispredict_mask[0] ? _T_71 : _T_75; // @[tage.scala 218:8]
  wire [1:0] _T_77 = ~s1_update_meta_alt_differs_0 ? s1_update_meta_provider_u_0 : _T_76; // @[tage.scala 217:8]
  wire  _GEN_8 = s1_update__bits_br_mask[0] & s1_update__valid & _T_64 & s1_update_meta_provider_0_valid; // @[tage.scala 299:92]
  wire  _T_82 = f3_resps_0_1_bits_ctr == 3'h3 | f3_resps_0_1_bits_ctr == 3'h4 ? io_resp_in_0_f3_1_taken :
    f3_resps_0_1_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _T_110 = s1_update__bits_cfi_idx_bits == 2'h1; // @[tage.scala 297:58]
  wire  _T_111 = s1_update__bits_cfi_idx_valid & _T_110; // @[tage.scala 296:58]
  wire  _T_112 = _T_111 & s1_update__bits_cfi_taken; // @[tage.scala 297:67]
  wire [1:0] _T_124 = s1_update_meta_provider_u_1 - 2'h1; // @[tage.scala 218:43]
  wire [1:0] _T_125 = s1_update_meta_provider_u_1 == 2'h0 ? 2'h0 : _T_124; // @[tage.scala 218:24]
  wire [1:0] _T_128 = s1_update_meta_provider_u_1 + 2'h1; // @[tage.scala 219:43]
  wire [1:0] _T_129 = s1_update_meta_provider_u_1 == 2'h3 ? 2'h3 : _T_128; // @[tage.scala 219:24]
  wire [1:0] _T_130 = s1_update_mispredict_mask[1] ? _T_125 : _T_129; // @[tage.scala 218:8]
  wire [1:0] _T_131 = ~s1_update_meta_alt_differs_1 ? s1_update_meta_provider_u_1 : _T_130; // @[tage.scala 217:8]
  wire  _GEN_22 = s1_update__bits_br_mask[1] & s1_update__valid & _T_64 & s1_update_meta_provider_1_valid; // @[tage.scala 299:92]
  wire  _T_136 = f3_resps_0_2_bits_ctr == 3'h3 | f3_resps_0_2_bits_ctr == 3'h4 ? io_resp_in_0_f3_2_taken :
    f3_resps_0_2_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _T_164 = s1_update__bits_cfi_idx_bits == 2'h2; // @[tage.scala 297:58]
  wire  _T_165 = s1_update__bits_cfi_idx_valid & _T_164; // @[tage.scala 296:58]
  wire  _T_166 = _T_165 & s1_update__bits_cfi_taken; // @[tage.scala 297:67]
  wire [1:0] _T_178 = s1_update_meta_provider_u_2 - 2'h1; // @[tage.scala 218:43]
  wire [1:0] _T_179 = s1_update_meta_provider_u_2 == 2'h0 ? 2'h0 : _T_178; // @[tage.scala 218:24]
  wire [1:0] _T_182 = s1_update_meta_provider_u_2 + 2'h1; // @[tage.scala 219:43]
  wire [1:0] _T_183 = s1_update_meta_provider_u_2 == 2'h3 ? 2'h3 : _T_182; // @[tage.scala 219:24]
  wire [1:0] _T_184 = s1_update_mispredict_mask[2] ? _T_179 : _T_183; // @[tage.scala 218:8]
  wire [1:0] _T_185 = ~s1_update_meta_alt_differs_2 ? s1_update_meta_provider_u_2 : _T_184; // @[tage.scala 217:8]
  wire  _GEN_36 = s1_update__bits_br_mask[2] & s1_update__valid & _T_64 & s1_update_meta_provider_2_valid; // @[tage.scala 299:92]
  wire  _T_190 = f3_resps_0_3_bits_ctr == 3'h3 | f3_resps_0_3_bits_ctr == 3'h4 ? io_resp_in_0_f3_3_taken :
    f3_resps_0_3_bits_ctr[2]; // @[tage.scala 265:35]
  wire  _T_218 = s1_update__bits_cfi_idx_bits == 2'h3; // @[tage.scala 297:58]
  wire  _T_219 = s1_update__bits_cfi_idx_valid & _T_218; // @[tage.scala 296:58]
  wire  _T_220 = _T_219 & s1_update__bits_cfi_taken; // @[tage.scala 297:67]
  wire [1:0] _T_232 = s1_update_meta_provider_u_3 - 2'h1; // @[tage.scala 218:43]
  wire [1:0] _T_233 = s1_update_meta_provider_u_3 == 2'h0 ? 2'h0 : _T_232; // @[tage.scala 218:24]
  wire [1:0] _T_236 = s1_update_meta_provider_u_3 + 2'h1; // @[tage.scala 219:43]
  wire [1:0] _T_237 = s1_update_meta_provider_u_3 == 2'h3 ? 2'h3 : _T_236; // @[tage.scala 219:24]
  wire [1:0] _T_238 = s1_update_mispredict_mask[3] ? _T_233 : _T_237; // @[tage.scala 218:8]
  wire [1:0] _T_239 = ~s1_update_meta_alt_differs_3 ? s1_update_meta_provider_u_3 : _T_238; // @[tage.scala 217:8]
  wire  _GEN_50 = s1_update__bits_br_mask[3] & s1_update__valid & _T_64 & s1_update_meta_provider_3_valid; // @[tage.scala 299:92]
  wire  _GEN_57 = 2'h1 == s1_update__bits_cfi_idx_bits ? s1_update_meta_allocate_1_valid :
    s1_update_meta_allocate_0_valid; // @[tage.scala 320:27 tage.scala 320:27]
  wire  _GEN_58 = 2'h2 == s1_update__bits_cfi_idx_bits ? s1_update_meta_allocate_2_valid : _GEN_57; // @[tage.scala 320:27 tage.scala 320:27]
  wire  _GEN_59 = 2'h3 == s1_update__bits_cfi_idx_bits ? s1_update_meta_allocate_3_valid : _GEN_58; // @[tage.scala 320:27 tage.scala 320:27]
  wire  _GEN_144 = 2'h0 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_60 = 2'h0 == s1_update__bits_cfi_idx_bits | _GEN_8; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_145 = 2'h1 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_61 = 2'h1 == s1_update__bits_cfi_idx_bits | _GEN_22; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_146 = 2'h2 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_62 = 2'h2 == s1_update__bits_cfi_idx_bits | _GEN_36; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_147 = 2'h3 == s1_update__bits_cfi_idx_bits; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_63 = 2'h3 == s1_update__bits_cfi_idx_bits | _GEN_50; // @[tage.scala 321:43 tage.scala 321:43]
  wire  _GEN_112 = _GEN_59 & _GEN_144; // @[tage.scala 320:27]
  wire  _GEN_113 = _GEN_59 & _GEN_145; // @[tage.scala 320:27]
  wire  _GEN_114 = _GEN_59 & _GEN_146; // @[tage.scala 320:27]
  wire  _GEN_115 = _GEN_59 & _GEN_147; // @[tage.scala 320:27]
  reg  REG_2; // @[tage.scala 345:48]
  reg  REG_3; // @[tage.scala 346:48]
  reg  REG_4; // @[tage.scala 347:48]
  reg [2:0] REG_5; // @[tage.scala 348:48]
  reg  REG_6; // @[tage.scala 350:47]
  reg [1:0] REG_7; // @[tage.scala 351:47]
  reg  REG_8; // @[tage.scala 345:48]
  reg  REG_9; // @[tage.scala 346:48]
  reg  REG_10; // @[tage.scala 347:48]
  reg [2:0] REG_11; // @[tage.scala 348:48]
  reg  REG_12; // @[tage.scala 350:47]
  reg [1:0] REG_13; // @[tage.scala 351:47]
  reg  REG_14; // @[tage.scala 345:48]
  reg  REG_15; // @[tage.scala 346:48]
  reg  REG_16; // @[tage.scala 347:48]
  reg [2:0] REG_17; // @[tage.scala 348:48]
  reg  REG_18; // @[tage.scala 350:47]
  reg [1:0] REG_19; // @[tage.scala 351:47]
  reg  REG_20; // @[tage.scala 345:48]
  reg  REG_21; // @[tage.scala 346:48]
  reg  REG_22; // @[tage.scala 347:48]
  reg [2:0] REG_23; // @[tage.scala 348:48]
  reg  REG_24; // @[tage.scala 350:47]
  reg [1:0] REG_25; // @[tage.scala 351:47]
  reg [39:0] REG_26; // @[tage.scala 353:41]
  reg [15:0] REG_27; // @[tage.scala 354:41]
  TageTable tables_0 ( // @[tage.scala 224:21]
    .clock(tables_0_clock),
    .reset(tables_0_reset),
    .io_f1_req_valid(tables_0_io_f1_req_valid),
    .io_f1_req_pc(tables_0_io_f1_req_pc),
    .io_f1_req_ghist(tables_0_io_f1_req_ghist),
    .io_f3_resp_0_valid(tables_0_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr(tables_0_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u(tables_0_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid(tables_0_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr(tables_0_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u(tables_0_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid(tables_0_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr(tables_0_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u(tables_0_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid(tables_0_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr(tables_0_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u(tables_0_io_f3_resp_3_bits_u),
    .io_update_mask_0(tables_0_io_update_mask_0),
    .io_update_mask_1(tables_0_io_update_mask_1),
    .io_update_mask_2(tables_0_io_update_mask_2),
    .io_update_mask_3(tables_0_io_update_mask_3),
    .io_update_taken_0(tables_0_io_update_taken_0),
    .io_update_taken_1(tables_0_io_update_taken_1),
    .io_update_taken_2(tables_0_io_update_taken_2),
    .io_update_taken_3(tables_0_io_update_taken_3),
    .io_update_alloc_0(tables_0_io_update_alloc_0),
    .io_update_alloc_1(tables_0_io_update_alloc_1),
    .io_update_alloc_2(tables_0_io_update_alloc_2),
    .io_update_alloc_3(tables_0_io_update_alloc_3),
    .io_update_old_ctr_0(tables_0_io_update_old_ctr_0),
    .io_update_old_ctr_1(tables_0_io_update_old_ctr_1),
    .io_update_old_ctr_2(tables_0_io_update_old_ctr_2),
    .io_update_old_ctr_3(tables_0_io_update_old_ctr_3),
    .io_update_pc(tables_0_io_update_pc),
    .io_update_hist(tables_0_io_update_hist),
    .io_update_u_mask_0(tables_0_io_update_u_mask_0),
    .io_update_u_mask_1(tables_0_io_update_u_mask_1),
    .io_update_u_mask_2(tables_0_io_update_u_mask_2),
    .io_update_u_mask_3(tables_0_io_update_u_mask_3),
    .io_update_u_0(tables_0_io_update_u_0),
    .io_update_u_1(tables_0_io_update_u_1),
    .io_update_u_2(tables_0_io_update_u_2),
    .io_update_u_3(tables_0_io_update_u_3)
  );
  MaxPeriodFibonacciLFSR_1 prng ( // @[PRNG.scala 82:22]
    .clock(prng_clock),
    .reset(prng_reset),
    .io_seed_valid(prng_io_seed_valid),
    .io_seed_bits_0(prng_io_seed_bits_0),
    .io_seed_bits_1(prng_io_seed_bits_1),
    .io_increment(prng_io_increment),
    .io_out_0(prng_io_out_0),
    .io_out_1(prng_io_out_1)
  );
  MaxPeriodFibonacciLFSR_1 prng_1 ( // @[PRNG.scala 82:22]
    .clock(prng_1_clock),
    .reset(prng_1_reset),
    .io_seed_valid(prng_1_io_seed_valid),
    .io_seed_bits_0(prng_1_io_seed_bits_0),
    .io_seed_bits_1(prng_1_io_seed_bits_1),
    .io_increment(prng_1_io_increment),
    .io_out_0(prng_1_io_out_0),
    .io_out_1(prng_1_io_out_1)
  );
  MaxPeriodFibonacciLFSR_1 prng_2 ( // @[PRNG.scala 82:22]
    .clock(prng_2_clock),
    .reset(prng_2_reset),
    .io_seed_valid(prng_2_io_seed_valid),
    .io_seed_bits_0(prng_2_io_seed_bits_0),
    .io_seed_bits_1(prng_2_io_seed_bits_1),
    .io_increment(prng_2_io_increment),
    .io_out_0(prng_2_io_out_0),
    .io_out_1(prng_2_io_out_1)
  );
  MaxPeriodFibonacciLFSR_1 prng_3 ( // @[PRNG.scala 82:22]
    .clock(prng_3_clock),
    .reset(prng_3_reset),
    .io_seed_valid(prng_3_io_seed_valid),
    .io_seed_bits_0(prng_3_io_seed_bits_0),
    .io_seed_bits_1(prng_3_io_seed_bits_1),
    .io_increment(prng_3_io_increment),
    .io_out_0(prng_3_io_out_0),
    .io_out_1(prng_3_io_out_1)
  );
  assign io_resp_f1_0_taken = io_resp_in_0_f1_0_taken; // @[predictor.scala 158:11]
  assign io_resp_f1_0_is_br = io_resp_in_0_f1_0_is_br; // @[predictor.scala 158:11]
  assign io_resp_f1_0_is_jal = io_resp_in_0_f1_0_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f1_0_predicted_pc_valid = io_resp_in_0_f1_0_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f1_0_predicted_pc_bits = io_resp_in_0_f1_0_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f1_1_taken = io_resp_in_0_f1_1_taken; // @[predictor.scala 158:11]
  assign io_resp_f1_1_is_br = io_resp_in_0_f1_1_is_br; // @[predictor.scala 158:11]
  assign io_resp_f1_1_is_jal = io_resp_in_0_f1_1_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f1_1_predicted_pc_valid = io_resp_in_0_f1_1_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f1_1_predicted_pc_bits = io_resp_in_0_f1_1_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f1_2_taken = io_resp_in_0_f1_2_taken; // @[predictor.scala 158:11]
  assign io_resp_f1_2_is_br = io_resp_in_0_f1_2_is_br; // @[predictor.scala 158:11]
  assign io_resp_f1_2_is_jal = io_resp_in_0_f1_2_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f1_2_predicted_pc_valid = io_resp_in_0_f1_2_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f1_2_predicted_pc_bits = io_resp_in_0_f1_2_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f1_3_taken = io_resp_in_0_f1_3_taken; // @[predictor.scala 158:11]
  assign io_resp_f1_3_is_br = io_resp_in_0_f1_3_is_br; // @[predictor.scala 158:11]
  assign io_resp_f1_3_is_jal = io_resp_in_0_f1_3_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f1_3_predicted_pc_valid = io_resp_in_0_f1_3_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f1_3_predicted_pc_bits = io_resp_in_0_f1_3_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f2_0_taken = io_resp_in_0_f2_0_taken; // @[predictor.scala 158:11]
  assign io_resp_f2_0_is_br = io_resp_in_0_f2_0_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_0_is_jal = io_resp_in_0_f2_0_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_0_predicted_pc_valid = io_resp_in_0_f2_0_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_0_predicted_pc_bits = io_resp_in_0_f2_0_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f2_1_taken = io_resp_in_0_f2_1_taken; // @[predictor.scala 158:11]
  assign io_resp_f2_1_is_br = io_resp_in_0_f2_1_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_1_is_jal = io_resp_in_0_f2_1_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_1_predicted_pc_valid = io_resp_in_0_f2_1_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_1_predicted_pc_bits = io_resp_in_0_f2_1_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f2_2_taken = io_resp_in_0_f2_2_taken; // @[predictor.scala 158:11]
  assign io_resp_f2_2_is_br = io_resp_in_0_f2_2_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_2_is_jal = io_resp_in_0_f2_2_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_2_predicted_pc_valid = io_resp_in_0_f2_2_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_2_predicted_pc_bits = io_resp_in_0_f2_2_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f2_3_taken = io_resp_in_0_f2_3_taken; // @[predictor.scala 158:11]
  assign io_resp_f2_3_is_br = io_resp_in_0_f2_3_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_3_is_jal = io_resp_in_0_f2_3_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_3_predicted_pc_valid = io_resp_in_0_f2_3_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_3_predicted_pc_bits = io_resp_in_0_f2_3_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_0_taken = f3_resps_0_0_valid ? _T_28 : io_resp_in_0_f3_0_taken; // @[tage.scala 264:18 tage.scala 265:29 tage.scala 259:25]
  assign io_resp_f3_0_is_br = io_resp_in_0_f3_0_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_0_is_jal = io_resp_in_0_f3_0_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_0_predicted_pc_valid = io_resp_in_0_f3_0_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_0_predicted_pc_bits = io_resp_in_0_f3_0_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_1_taken = f3_resps_0_1_valid ? _T_82 : io_resp_in_0_f3_1_taken; // @[tage.scala 264:18 tage.scala 265:29 tage.scala 259:25]
  assign io_resp_f3_1_is_br = io_resp_in_0_f3_1_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_1_is_jal = io_resp_in_0_f3_1_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_1_predicted_pc_valid = io_resp_in_0_f3_1_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_1_predicted_pc_bits = io_resp_in_0_f3_1_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_2_taken = f3_resps_0_2_valid ? _T_136 : io_resp_in_0_f3_2_taken; // @[tage.scala 264:18 tage.scala 265:29 tage.scala 259:25]
  assign io_resp_f3_2_is_br = io_resp_in_0_f3_2_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_2_is_jal = io_resp_in_0_f3_2_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_2_predicted_pc_valid = io_resp_in_0_f3_2_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_2_predicted_pc_bits = io_resp_in_0_f3_2_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_3_taken = f3_resps_0_3_valid ? _T_190 : io_resp_in_0_f3_3_taken; // @[tage.scala 264:18 tage.scala 265:29 tage.scala 259:25]
  assign io_resp_f3_3_is_br = io_resp_in_0_f3_3_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_3_is_jal = io_resp_in_0_f3_3_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_3_predicted_pc_valid = io_resp_in_0_f3_3_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_3_predicted_pc_bits = io_resp_in_0_f3_3_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_f3_meta = {{13'd0}, _T}; // @[tage.scala 359:25]
  assign tables_0_clock = clock;
  assign tables_0_reset = reset;
  assign tables_0_io_f1_req_valid = REG; // @[tage.scala 225:25]
  assign tables_0_io_f1_req_pc = REG_1; // @[tage.scala 226:25]
  assign tables_0_io_f1_req_ghist = io_f1_ghist; // @[tage.scala 227:25]
  assign tables_0_io_update_mask_0 = REG_2; // @[tage.scala 345:38]
  assign tables_0_io_update_mask_1 = REG_8; // @[tage.scala 345:38]
  assign tables_0_io_update_mask_2 = REG_14; // @[tage.scala 345:38]
  assign tables_0_io_update_mask_3 = REG_20; // @[tage.scala 345:38]
  assign tables_0_io_update_taken_0 = REG_3; // @[tage.scala 346:38]
  assign tables_0_io_update_taken_1 = REG_9; // @[tage.scala 346:38]
  assign tables_0_io_update_taken_2 = REG_15; // @[tage.scala 346:38]
  assign tables_0_io_update_taken_3 = REG_21; // @[tage.scala 346:38]
  assign tables_0_io_update_alloc_0 = REG_4; // @[tage.scala 347:38]
  assign tables_0_io_update_alloc_1 = REG_10; // @[tage.scala 347:38]
  assign tables_0_io_update_alloc_2 = REG_16; // @[tage.scala 347:38]
  assign tables_0_io_update_alloc_3 = REG_22; // @[tage.scala 347:38]
  assign tables_0_io_update_old_ctr_0 = REG_5; // @[tage.scala 348:38]
  assign tables_0_io_update_old_ctr_1 = REG_11; // @[tage.scala 348:38]
  assign tables_0_io_update_old_ctr_2 = REG_17; // @[tage.scala 348:38]
  assign tables_0_io_update_old_ctr_3 = REG_23; // @[tage.scala 348:38]
  assign tables_0_io_update_pc = REG_26; // @[tage.scala 353:31]
  assign tables_0_io_update_hist = REG_27; // @[tage.scala 354:31]
  assign tables_0_io_update_u_mask_0 = REG_6; // @[tage.scala 350:37]
  assign tables_0_io_update_u_mask_1 = REG_12; // @[tage.scala 350:37]
  assign tables_0_io_update_u_mask_2 = REG_18; // @[tage.scala 350:37]
  assign tables_0_io_update_u_mask_3 = REG_24; // @[tage.scala 350:37]
  assign tables_0_io_update_u_0 = REG_7; // @[tage.scala 351:37]
  assign tables_0_io_update_u_1 = REG_13; // @[tage.scala 351:37]
  assign tables_0_io_update_u_2 = REG_19; // @[tage.scala 351:37]
  assign tables_0_io_update_u_3 = REG_25; // @[tage.scala 351:37]
  assign prng_clock = clock;
  assign prng_reset = reset;
  assign prng_io_seed_valid = 1'h0; // @[PRNG.scala 83:24]
  assign prng_io_seed_bits_0 = 1'h0;
  assign prng_io_seed_bits_1 = 1'h0;
  assign prng_io_increment = 1'h1; // @[PRNG.scala 85:23]
  assign prng_1_clock = clock;
  assign prng_1_reset = reset;
  assign prng_1_io_seed_valid = 1'h0; // @[PRNG.scala 83:24]
  assign prng_1_io_seed_bits_0 = 1'h0;
  assign prng_1_io_seed_bits_1 = 1'h0;
  assign prng_1_io_increment = 1'h1; // @[PRNG.scala 85:23]
  assign prng_2_clock = clock;
  assign prng_2_reset = reset;
  assign prng_2_io_seed_valid = 1'h0; // @[PRNG.scala 83:24]
  assign prng_2_io_seed_bits_0 = 1'h0;
  assign prng_2_io_seed_bits_1 = 1'h0;
  assign prng_2_io_increment = 1'h1; // @[PRNG.scala 85:23]
  assign prng_3_clock = clock;
  assign prng_3_reset = reset;
  assign prng_3_io_seed_valid = 1'h0; // @[PRNG.scala 83:24]
  assign prng_3_io_seed_bits_0 = 1'h0;
  assign prng_3_io_seed_bits_1 = 1'h0;
  assign prng_3_io_increment = 1'h1; // @[PRNG.scala 85:23]
  always @(posedge clock) begin
    s1_update__valid <= io_update_valid; // @[predictor.scala 184:30]
    s1_update__bits_is_mispredict_update <= io_update_bits_is_mispredict_update; // @[predictor.scala 184:30]
    s1_update__bits_is_repair_update <= io_update_bits_is_repair_update; // @[predictor.scala 184:30]
    s1_update__bits_btb_mispredicts <= io_update_bits_btb_mispredicts; // @[predictor.scala 184:30]
    s1_update__bits_pc <= io_update_bits_pc; // @[predictor.scala 184:30]
    s1_update__bits_br_mask <= io_update_bits_br_mask; // @[predictor.scala 184:30]
    s1_update__bits_cfi_idx_valid <= io_update_bits_cfi_idx_valid; // @[predictor.scala 184:30]
    s1_update__bits_cfi_idx_bits <= io_update_bits_cfi_idx_bits; // @[predictor.scala 184:30]
    s1_update__bits_cfi_taken <= io_update_bits_cfi_taken; // @[predictor.scala 184:30]
    s1_update__bits_cfi_mispredicted <= io_update_bits_cfi_mispredicted; // @[predictor.scala 184:30]
    s1_update__bits_ghist <= io_update_bits_ghist; // @[predictor.scala 184:30]
    s1_update__bits_meta <= io_update_bits_meta; // @[predictor.scala 184:30]
    REG <= io_f0_valid; // @[tage.scala 225:35]
    REG_1 <= io_f0_pc; // @[tage.scala 226:35]
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        REG_2 <= _GEN_60;
      end else begin
        REG_2 <= _GEN_8;
      end
    end else begin
      REG_2 <= _GEN_8;
    end
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        if (2'h0 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 322:43]
          REG_3 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_3 <= _T_58;
        end
      end else begin
        REG_3 <= _T_58;
      end
    end else begin
      REG_3 <= _T_58;
    end
    REG_4 <= s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_112; // @[tage.scala 317:128]
    REG_5 <= s1_update__bits_meta[6:4]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        REG_6 <= _GEN_60;
      end else begin
        REG_6 <= _GEN_8;
      end
    end else begin
      REG_6 <= _GEN_8;
    end
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        if (2'h0 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 326:44]
          REG_7 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_7 <= _T_77;
        end
      end else begin
        REG_7 <= _T_77;
      end
    end else begin
      REG_7 <= _T_77;
    end
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        REG_8 <= _GEN_61;
      end else begin
        REG_8 <= _GEN_22;
      end
    end else begin
      REG_8 <= _GEN_22;
    end
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        if (2'h1 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 322:43]
          REG_9 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_9 <= _T_112;
        end
      end else begin
        REG_9 <= _T_112;
      end
    end else begin
      REG_9 <= _T_112;
    end
    REG_10 <= s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_113; // @[tage.scala 317:128]
    REG_11 <= s1_update__bits_meta[9:7]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        REG_12 <= _GEN_61;
      end else begin
        REG_12 <= _GEN_22;
      end
    end else begin
      REG_12 <= _GEN_22;
    end
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        if (2'h1 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 326:44]
          REG_13 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_13 <= _T_131;
        end
      end else begin
        REG_13 <= _T_131;
      end
    end else begin
      REG_13 <= _T_131;
    end
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        REG_14 <= _GEN_62;
      end else begin
        REG_14 <= _GEN_36;
      end
    end else begin
      REG_14 <= _GEN_36;
    end
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        if (2'h2 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 322:43]
          REG_15 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_15 <= _T_166;
        end
      end else begin
        REG_15 <= _T_166;
      end
    end else begin
      REG_15 <= _T_166;
    end
    REG_16 <= s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_114; // @[tage.scala 317:128]
    REG_17 <= s1_update__bits_meta[12:10]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        REG_18 <= _GEN_62;
      end else begin
        REG_18 <= _GEN_36;
      end
    end else begin
      REG_18 <= _GEN_36;
    end
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        if (2'h2 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 326:44]
          REG_19 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_19 <= _T_185;
        end
      end else begin
        REG_19 <= _T_185;
      end
    end else begin
      REG_19 <= _T_185;
    end
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        REG_20 <= _GEN_63;
      end else begin
        REG_20 <= _GEN_50;
      end
    end else begin
      REG_20 <= _GEN_50;
    end
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        if (2'h3 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 322:43]
          REG_21 <= s1_update__bits_cfi_taken; // @[tage.scala 322:43]
        end else begin
          REG_21 <= _T_220;
        end
      end else begin
        REG_21 <= _T_220;
      end
    end else begin
      REG_21 <= _T_220;
    end
    REG_22 <= s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid & _GEN_115; // @[tage.scala 317:128]
    REG_23 <= s1_update__bits_meta[15:13]; // @[tage.scala 236:52]
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        REG_24 <= _GEN_63;
      end else begin
        REG_24 <= _GEN_50;
      end
    end else begin
      REG_24 <= _GEN_50;
    end
    if (s1_update__valid & _T_64 & s1_update__bits_cfi_mispredicted & s1_update__bits_cfi_idx_valid) begin // @[tage.scala 317:128]
      if (_GEN_59) begin // @[tage.scala 320:27]
        if (2'h3 == s1_update__bits_cfi_idx_bits) begin // @[tage.scala 326:44]
          REG_25 <= 2'h0; // @[tage.scala 326:44]
        end else begin
          REG_25 <= _T_239;
        end
      end else begin
        REG_25 <= _T_239;
      end
    end else begin
      REG_25 <= _T_239;
    end
    REG_26 <= s1_update__bits_pc; // @[tage.scala 353:41]
    REG_27 <= s1_update__bits_ghist; // @[tage.scala 354:41]
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
  s1_update__valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s1_update__bits_is_mispredict_update = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  s1_update__bits_is_repair_update = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  s1_update__bits_btb_mispredicts = _RAND_3[3:0];
  _RAND_4 = {2{`RANDOM}};
  s1_update__bits_pc = _RAND_4[39:0];
  _RAND_5 = {1{`RANDOM}};
  s1_update__bits_br_mask = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  s1_update__bits_cfi_idx_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s1_update__bits_cfi_idx_bits = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  s1_update__bits_cfi_taken = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  s1_update__bits_cfi_mispredicted = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  s1_update__bits_ghist = _RAND_10[15:0];
  _RAND_11 = {2{`RANDOM}};
  s1_update__bits_meta = _RAND_11[44:0];
  _RAND_12 = {1{`RANDOM}};
  REG = _RAND_12[0:0];
  _RAND_13 = {2{`RANDOM}};
  REG_1 = _RAND_13[39:0];
  _RAND_14 = {1{`RANDOM}};
  REG_2 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  REG_3 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  REG_4 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  REG_5 = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  REG_6 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  REG_7 = _RAND_19[1:0];
  _RAND_20 = {1{`RANDOM}};
  REG_8 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  REG_9 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  REG_10 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  REG_11 = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  REG_12 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  REG_13 = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  REG_14 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  REG_15 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  REG_16 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  REG_17 = _RAND_29[2:0];
  _RAND_30 = {1{`RANDOM}};
  REG_18 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  REG_19 = _RAND_31[1:0];
  _RAND_32 = {1{`RANDOM}};
  REG_20 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  REG_21 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  REG_22 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  REG_23 = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  REG_24 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  REG_25 = _RAND_37[1:0];
  _RAND_38 = {2{`RANDOM}};
  REG_26 = _RAND_38[39:0];
  _RAND_39 = {1{`RANDOM}};
  REG_27 = _RAND_39[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
