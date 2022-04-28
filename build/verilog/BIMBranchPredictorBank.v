module BIMBranchPredictorBank(
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
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
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
`endif // RANDOMIZE_REG_INIT
  reg [1:0] data_0 [0:1023]; // @[bim.scala 50:26]
  wire [1:0] data_0_MPORT_data; // @[bim.scala 50:26]
  wire [9:0] data_0_MPORT_addr; // @[bim.scala 50:26]
  wire [1:0] data_0_MPORT_1_data; // @[bim.scala 50:26]
  wire [9:0] data_0_MPORT_1_addr; // @[bim.scala 50:26]
  wire  data_0_MPORT_1_mask; // @[bim.scala 50:26]
  wire  data_0_MPORT_1_en; // @[bim.scala 50:26]
  reg  data_0_MPORT_en_pipe_0;
  reg [9:0] data_0_MPORT_addr_pipe_0;
  reg [1:0] data_1 [0:1023]; // @[bim.scala 50:26]
  wire [1:0] data_1_MPORT_data; // @[bim.scala 50:26]
  wire [9:0] data_1_MPORT_addr; // @[bim.scala 50:26]
  wire [1:0] data_1_MPORT_1_data; // @[bim.scala 50:26]
  wire [9:0] data_1_MPORT_1_addr; // @[bim.scala 50:26]
  wire  data_1_MPORT_1_mask; // @[bim.scala 50:26]
  wire  data_1_MPORT_1_en; // @[bim.scala 50:26]
  reg  data_1_MPORT_en_pipe_0;
  reg [9:0] data_1_MPORT_addr_pipe_0;
  reg [1:0] data_2 [0:1023]; // @[bim.scala 50:26]
  wire [1:0] data_2_MPORT_data; // @[bim.scala 50:26]
  wire [9:0] data_2_MPORT_addr; // @[bim.scala 50:26]
  wire [1:0] data_2_MPORT_1_data; // @[bim.scala 50:26]
  wire [9:0] data_2_MPORT_1_addr; // @[bim.scala 50:26]
  wire  data_2_MPORT_1_mask; // @[bim.scala 50:26]
  wire  data_2_MPORT_1_en; // @[bim.scala 50:26]
  reg  data_2_MPORT_en_pipe_0;
  reg [9:0] data_2_MPORT_addr_pipe_0;
  reg [1:0] data_3 [0:1023]; // @[bim.scala 50:26]
  wire [1:0] data_3_MPORT_data; // @[bim.scala 50:26]
  wire [9:0] data_3_MPORT_addr; // @[bim.scala 50:26]
  wire [1:0] data_3_MPORT_1_data; // @[bim.scala 50:26]
  wire [9:0] data_3_MPORT_1_addr; // @[bim.scala 50:26]
  wire  data_3_MPORT_1_mask; // @[bim.scala 50:26]
  wire  data_3_MPORT_1_en; // @[bim.scala 50:26]
  reg  data_3_MPORT_en_pipe_0;
  reg [9:0] data_3_MPORT_addr_pipe_0;
  wire [36:0] s0_idx = io_f0_pc[39:3]; // @[frontend.scala 163:35]
  reg  s1_valid; // @[predictor.scala 168:25]
  reg  s2_valid; // @[predictor.scala 169:25]
  reg  s1_update__valid; // @[predictor.scala 184:30]
  reg  s1_update__bits_is_mispredict_update; // @[predictor.scala 184:30]
  reg  s1_update__bits_is_repair_update; // @[predictor.scala 184:30]
  reg [3:0] s1_update__bits_btb_mispredicts; // @[predictor.scala 184:30]
  reg [3:0] s1_update__bits_br_mask; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_idx_valid; // @[predictor.scala 184:30]
  reg [1:0] s1_update__bits_cfi_idx_bits; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_taken; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_is_br; // @[predictor.scala 184:30]
  reg  s1_update__bits_cfi_is_jal; // @[predictor.scala 184:30]
  reg [44:0] s1_update__bits_meta; // @[predictor.scala 184:30]
  reg [36:0] s1_update_idx; // @[predictor.scala 185:30]
  reg [1:0] s2_req_rdata_1; // @[bim.scala 54:32]
  reg [1:0] s2_req_rdata_0; // @[bim.scala 54:32]
  wire [3:0] lo = {s2_req_rdata_1,s2_req_rdata_0}; // @[bim.scala 42:35]
  reg [1:0] s2_req_rdata_3; // @[bim.scala 54:32]
  reg [1:0] s2_req_rdata_2; // @[bim.scala 54:32]
  wire [3:0] hi = {s2_req_rdata_3,s2_req_rdata_2}; // @[bim.scala 42:35]
  reg  doing_reset; // @[bim.scala 44:28]
  reg [9:0] reset_idx; // @[bim.scala 45:26]
  wire [9:0] _GEN_80 = {{9'd0}, doing_reset}; // @[bim.scala 46:26]
  wire [9:0] _T_2 = reset_idx + _GEN_80; // @[bim.scala 46:26]
  wire  _GEN_0 = reset_idx == 10'h3ff ? 1'h0 : doing_reset; // @[bim.scala 47:36 bim.scala 47:50 bim.scala 44:28]
  wire  _T_8 = ~doing_reset; // @[bim.scala 60:60]
  wire [1:0] s1_update_meta_bims_0 = s1_update__bits_meta[1:0]; // @[bim.scala 67:55]
  wire [1:0] s1_update_meta_bims_1 = s1_update__bits_meta[3:2]; // @[bim.scala 67:55]
  wire [1:0] s1_update_meta_bims_2 = s1_update__bits_meta[5:4]; // @[bim.scala 67:55]
  wire [1:0] s1_update_meta_bims_3 = s1_update__bits_meta[7:6]; // @[bim.scala 67:55]
  reg [9:0] wrbypass_idxs_0; // @[bim.scala 70:26]
  reg [9:0] wrbypass_idxs_1; // @[bim.scala 70:26]
  reg [1:0] wrbypass_0_0; // @[bim.scala 71:26]
  reg [1:0] wrbypass_0_1; // @[bim.scala 71:26]
  reg [1:0] wrbypass_0_2; // @[bim.scala 71:26]
  reg [1:0] wrbypass_0_3; // @[bim.scala 71:26]
  reg [1:0] wrbypass_1_0; // @[bim.scala 71:26]
  reg [1:0] wrbypass_1_1; // @[bim.scala 71:26]
  reg [1:0] wrbypass_1_2; // @[bim.scala 71:26]
  reg [1:0] wrbypass_1_3; // @[bim.scala 71:26]
  reg  wrbypass_enq_idx; // @[bim.scala 72:33]
  wire  _T_28 = wrbypass_idxs_0 == s1_update_idx[9:0]; // @[bim.scala 76:22]
  wire  wrbypass_hits_0 = _T_8 & _T_28; // @[bim.scala 75:18]
  wire  _T_32 = wrbypass_idxs_1 == s1_update_idx[9:0]; // @[bim.scala 76:22]
  wire  wrbypass_hits_1 = _T_8 & _T_32; // @[bim.scala 75:18]
  wire  wrbypass_hit = wrbypass_hits_0 | wrbypass_hits_1; // @[bim.scala 78:44]
  wire  wrbypass_hit_idx = wrbypass_hits_0 ? 1'h0 : 1'h1; // @[Mux.scala 47:69]
  wire  _T_38 = s1_update__bits_cfi_idx_valid & s1_update__bits_cfi_idx_bits == 2'h0; // @[bim.scala 90:37]
  wire  s1_update_wmask_0 = s1_update__bits_br_mask[0] | _T_38; // @[bim.scala 89:37]
  wire  _T_45 = s1_update__bits_cfi_is_br & s1_update__bits_br_mask[0] & s1_update__bits_cfi_taken |
    s1_update__bits_cfi_is_jal; // @[bim.scala 95:95]
  wire  _T_46 = _T_38 & _T_45; // @[bim.scala 93:47]
  wire [1:0] _GEN_6 = wrbypass_hit_idx ? wrbypass_1_0 : wrbypass_0_0; // @[bim.scala 99:30 bim.scala 99:30]
  wire [1:0] _T_47 = wrbypass_hit ? _GEN_6 : s1_update_meta_bims_0; // @[bim.scala 99:30]
  wire  _T_48 = _T_47 == 2'h3; // @[bim.scala 35:32]
  wire  _T_49 = _T_47 == 2'h0; // @[bim.scala 36:32]
  wire [1:0] _T_54 = _T_47 + 2'h1; // @[bim.scala 39:20]
  wire [1:0] _T_56 = _T_47 - 2'h1; // @[bim.scala 39:29]
  wire [1:0] _T_57 = _T_46 ? _T_54 : _T_56; // @[bim.scala 39:10]
  wire [1:0] _T_58 = _T_49 & ~_T_46 ? 2'h0 : _T_57; // @[bim.scala 38:10]
  wire [1:0] s1_update_wdata_0 = _T_48 & _T_46 ? 2'h3 : _T_58; // @[bim.scala 37:8]
  wire  _T_64 = s1_update__bits_cfi_idx_valid & s1_update__bits_cfi_idx_bits == 2'h1; // @[bim.scala 90:37]
  wire  s1_update_wmask_1 = s1_update__bits_br_mask[1] | _T_64; // @[bim.scala 89:37]
  wire  _T_71 = s1_update__bits_cfi_is_br & s1_update__bits_br_mask[1] & s1_update__bits_cfi_taken |
    s1_update__bits_cfi_is_jal; // @[bim.scala 95:95]
  wire  _T_72 = _T_64 & _T_71; // @[bim.scala 93:47]
  wire [1:0] _GEN_10 = wrbypass_hit_idx ? wrbypass_1_1 : wrbypass_0_1; // @[bim.scala 99:30 bim.scala 99:30]
  wire [1:0] _T_73 = wrbypass_hit ? _GEN_10 : s1_update_meta_bims_1; // @[bim.scala 99:30]
  wire  _T_74 = _T_73 == 2'h3; // @[bim.scala 35:32]
  wire  _T_75 = _T_73 == 2'h0; // @[bim.scala 36:32]
  wire [1:0] _T_80 = _T_73 + 2'h1; // @[bim.scala 39:20]
  wire [1:0] _T_82 = _T_73 - 2'h1; // @[bim.scala 39:29]
  wire [1:0] _T_83 = _T_72 ? _T_80 : _T_82; // @[bim.scala 39:10]
  wire [1:0] _T_84 = _T_75 & ~_T_72 ? 2'h0 : _T_83; // @[bim.scala 38:10]
  wire [1:0] s1_update_wdata_1 = _T_74 & _T_72 ? 2'h3 : _T_84; // @[bim.scala 37:8]
  wire  _T_90 = s1_update__bits_cfi_idx_valid & s1_update__bits_cfi_idx_bits == 2'h2; // @[bim.scala 90:37]
  wire  s1_update_wmask_2 = s1_update__bits_br_mask[2] | _T_90; // @[bim.scala 89:37]
  wire  _T_97 = s1_update__bits_cfi_is_br & s1_update__bits_br_mask[2] & s1_update__bits_cfi_taken |
    s1_update__bits_cfi_is_jal; // @[bim.scala 95:95]
  wire  _T_98 = _T_90 & _T_97; // @[bim.scala 93:47]
  wire [1:0] _GEN_14 = wrbypass_hit_idx ? wrbypass_1_2 : wrbypass_0_2; // @[bim.scala 99:30 bim.scala 99:30]
  wire [1:0] _T_99 = wrbypass_hit ? _GEN_14 : s1_update_meta_bims_2; // @[bim.scala 99:30]
  wire  _T_100 = _T_99 == 2'h3; // @[bim.scala 35:32]
  wire  _T_101 = _T_99 == 2'h0; // @[bim.scala 36:32]
  wire [1:0] _T_106 = _T_99 + 2'h1; // @[bim.scala 39:20]
  wire [1:0] _T_108 = _T_99 - 2'h1; // @[bim.scala 39:29]
  wire [1:0] _T_109 = _T_98 ? _T_106 : _T_108; // @[bim.scala 39:10]
  wire [1:0] _T_110 = _T_101 & ~_T_98 ? 2'h0 : _T_109; // @[bim.scala 38:10]
  wire [1:0] s1_update_wdata_2 = _T_100 & _T_98 ? 2'h3 : _T_110; // @[bim.scala 37:8]
  wire  _T_116 = s1_update__bits_cfi_idx_valid & s1_update__bits_cfi_idx_bits == 2'h3; // @[bim.scala 90:37]
  wire  s1_update_wmask_3 = s1_update__bits_br_mask[3] | _T_116; // @[bim.scala 89:37]
  wire  _T_123 = s1_update__bits_cfi_is_br & s1_update__bits_br_mask[3] & s1_update__bits_cfi_taken |
    s1_update__bits_cfi_is_jal; // @[bim.scala 95:95]
  wire  _T_124 = _T_116 & _T_123; // @[bim.scala 93:47]
  wire [1:0] _GEN_18 = wrbypass_hit_idx ? wrbypass_1_3 : wrbypass_0_3; // @[bim.scala 99:30 bim.scala 99:30]
  wire [1:0] _T_125 = wrbypass_hit ? _GEN_18 : s1_update_meta_bims_3; // @[bim.scala 99:30]
  wire  _T_126 = _T_125 == 2'h3; // @[bim.scala 35:32]
  wire  _T_127 = _T_125 == 2'h0; // @[bim.scala 36:32]
  wire [1:0] _T_132 = _T_125 + 2'h1; // @[bim.scala 39:20]
  wire [1:0] _T_134 = _T_125 - 2'h1; // @[bim.scala 39:29]
  wire [1:0] _T_135 = _T_124 ? _T_132 : _T_134; // @[bim.scala 39:10]
  wire [1:0] _T_136 = _T_127 & ~_T_124 ? 2'h0 : _T_135; // @[bim.scala 38:10]
  wire [1:0] s1_update_wdata_3 = _T_126 & _T_124 ? 2'h3 : _T_136; // @[bim.scala 37:8]
  wire  _T_139 = s1_update__bits_btb_mispredicts != 4'h0; // @[predictor.scala 94:50]
  wire  _T_141 = ~(s1_update__bits_is_mispredict_update | s1_update__bits_is_repair_update | _T_139); // @[predictor.scala 96:26]
  wire  _T_142 = s1_update__valid & _T_141; // @[bim.scala 109:41]
  wire [36:0] _T_144 = doing_reset ? {{27'd0}, reset_idx} : s1_update_idx; // @[bim.scala 111:10]
  wire [3:0] _T_147 = {s1_update_wmask_3,s1_update_wmask_2,s1_update_wmask_1,s1_update_wmask_0}; // @[bim.scala 113:63]
  wire [3:0] _T_148 = doing_reset ? 4'hf : _T_147; // @[bim.scala 113:10]
  wire  _T_165 = wrbypass_enq_idx + 1'h1; // @[util.scala 260:14]
  reg  REG; // @[bim.scala 128:35]
  reg  REG_1; // @[bim.scala 128:35]
  reg  REG_2; // @[bim.scala 128:35]
  reg  REG_3; // @[bim.scala 128:35]
  reg [7:0] REG_4; // @[bim.scala 130:24]
  assign data_0_MPORT_addr = data_0_MPORT_addr_pipe_0;
  assign data_0_MPORT_data = data_0[data_0_MPORT_addr]; // @[bim.scala 50:26]
  assign data_0_MPORT_1_data = doing_reset ? 2'h2 : s1_update_wdata_0;
  assign data_0_MPORT_1_addr = _T_144[9:0];
  assign data_0_MPORT_1_mask = _T_148[0];
  assign data_0_MPORT_1_en = doing_reset | _T_142;
  assign data_1_MPORT_addr = data_1_MPORT_addr_pipe_0;
  assign data_1_MPORT_data = data_1[data_1_MPORT_addr]; // @[bim.scala 50:26]
  assign data_1_MPORT_1_data = doing_reset ? 2'h2 : s1_update_wdata_1;
  assign data_1_MPORT_1_addr = _T_144[9:0];
  assign data_1_MPORT_1_mask = _T_148[1];
  assign data_1_MPORT_1_en = doing_reset | _T_142;
  assign data_2_MPORT_addr = data_2_MPORT_addr_pipe_0;
  assign data_2_MPORT_data = data_2[data_2_MPORT_addr]; // @[bim.scala 50:26]
  assign data_2_MPORT_1_data = doing_reset ? 2'h2 : s1_update_wdata_2;
  assign data_2_MPORT_1_addr = _T_144[9:0];
  assign data_2_MPORT_1_mask = _T_148[2];
  assign data_2_MPORT_1_en = doing_reset | _T_142;
  assign data_3_MPORT_addr = data_3_MPORT_addr_pipe_0;
  assign data_3_MPORT_data = data_3[data_3_MPORT_addr]; // @[bim.scala 50:26]
  assign data_3_MPORT_1_data = doing_reset ? 2'h2 : s1_update_wdata_3;
  assign data_3_MPORT_1_addr = _T_144[9:0];
  assign data_3_MPORT_1_mask = _T_148[3];
  assign data_3_MPORT_1_en = doing_reset | _T_142;
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
  assign io_resp_f2_0_taken = s2_valid & s2_req_rdata_0[1] & ~doing_reset; // @[bim.scala 60:57]
  assign io_resp_f2_0_is_br = io_resp_in_0_f2_0_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_0_is_jal = io_resp_in_0_f2_0_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_0_predicted_pc_valid = io_resp_in_0_f2_0_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_0_predicted_pc_bits = io_resp_in_0_f2_0_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f2_1_taken = s2_valid & s2_req_rdata_1[1] & ~doing_reset; // @[bim.scala 60:57]
  assign io_resp_f2_1_is_br = io_resp_in_0_f2_1_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_1_is_jal = io_resp_in_0_f2_1_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_1_predicted_pc_valid = io_resp_in_0_f2_1_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_1_predicted_pc_bits = io_resp_in_0_f2_1_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f2_2_taken = s2_valid & s2_req_rdata_2[1] & ~doing_reset; // @[bim.scala 60:57]
  assign io_resp_f2_2_is_br = io_resp_in_0_f2_2_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_2_is_jal = io_resp_in_0_f2_2_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_2_predicted_pc_valid = io_resp_in_0_f2_2_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_2_predicted_pc_bits = io_resp_in_0_f2_2_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f2_3_taken = s2_valid & s2_req_rdata_3[1] & ~doing_reset; // @[bim.scala 60:57]
  assign io_resp_f2_3_is_br = io_resp_in_0_f2_3_is_br; // @[predictor.scala 158:11]
  assign io_resp_f2_3_is_jal = io_resp_in_0_f2_3_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f2_3_predicted_pc_valid = io_resp_in_0_f2_3_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f2_3_predicted_pc_bits = io_resp_in_0_f2_3_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_0_taken = REG; // @[bim.scala 128:25]
  assign io_resp_f3_0_is_br = io_resp_in_0_f3_0_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_0_is_jal = io_resp_in_0_f3_0_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_0_predicted_pc_valid = io_resp_in_0_f3_0_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_0_predicted_pc_bits = io_resp_in_0_f3_0_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_1_taken = REG_1; // @[bim.scala 128:25]
  assign io_resp_f3_1_is_br = io_resp_in_0_f3_1_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_1_is_jal = io_resp_in_0_f3_1_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_1_predicted_pc_valid = io_resp_in_0_f3_1_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_1_predicted_pc_bits = io_resp_in_0_f3_1_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_2_taken = REG_2; // @[bim.scala 128:25]
  assign io_resp_f3_2_is_br = io_resp_in_0_f3_2_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_2_is_jal = io_resp_in_0_f3_2_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_2_predicted_pc_valid = io_resp_in_0_f3_2_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_2_predicted_pc_bits = io_resp_in_0_f3_2_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_resp_f3_3_taken = REG_3; // @[bim.scala 128:25]
  assign io_resp_f3_3_is_br = io_resp_in_0_f3_3_is_br; // @[predictor.scala 158:11]
  assign io_resp_f3_3_is_jal = io_resp_in_0_f3_3_is_jal; // @[predictor.scala 158:11]
  assign io_resp_f3_3_predicted_pc_valid = io_resp_in_0_f3_3_predicted_pc_valid; // @[predictor.scala 158:11]
  assign io_resp_f3_3_predicted_pc_bits = io_resp_in_0_f3_3_predicted_pc_bits; // @[predictor.scala 158:11]
  assign io_f3_meta = {{37'd0}, REG_4}; // @[bim.scala 130:14]
  always @(posedge clock) begin
    if(data_0_MPORT_1_en & data_0_MPORT_1_mask) begin
      data_0[data_0_MPORT_1_addr] <= data_0_MPORT_1_data; // @[bim.scala 50:26]
    end
    data_0_MPORT_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      data_0_MPORT_addr_pipe_0 <= s0_idx[9:0];
    end
    if(data_1_MPORT_1_en & data_1_MPORT_1_mask) begin
      data_1[data_1_MPORT_1_addr] <= data_1_MPORT_1_data; // @[bim.scala 50:26]
    end
    data_1_MPORT_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      data_1_MPORT_addr_pipe_0 <= s0_idx[9:0];
    end
    if(data_2_MPORT_1_en & data_2_MPORT_1_mask) begin
      data_2[data_2_MPORT_1_addr] <= data_2_MPORT_1_data; // @[bim.scala 50:26]
    end
    data_2_MPORT_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      data_2_MPORT_addr_pipe_0 <= s0_idx[9:0];
    end
    if(data_3_MPORT_1_en & data_3_MPORT_1_mask) begin
      data_3[data_3_MPORT_1_addr] <= data_3_MPORT_1_data; // @[bim.scala 50:26]
    end
    data_3_MPORT_en_pipe_0 <= io_f0_valid;
    if (io_f0_valid) begin
      data_3_MPORT_addr_pipe_0 <= s0_idx[9:0];
    end
    s1_valid <= io_f0_valid; // @[predictor.scala 168:25]
    s2_valid <= s1_valid; // @[predictor.scala 169:25]
    s1_update__valid <= io_update_valid; // @[predictor.scala 184:30]
    s1_update__bits_is_mispredict_update <= io_update_bits_is_mispredict_update; // @[predictor.scala 184:30]
    s1_update__bits_is_repair_update <= io_update_bits_is_repair_update; // @[predictor.scala 184:30]
    s1_update__bits_btb_mispredicts <= io_update_bits_btb_mispredicts; // @[predictor.scala 184:30]
    s1_update__bits_br_mask <= io_update_bits_br_mask; // @[predictor.scala 184:30]
    s1_update__bits_cfi_idx_valid <= io_update_bits_cfi_idx_valid; // @[predictor.scala 184:30]
    s1_update__bits_cfi_idx_bits <= io_update_bits_cfi_idx_bits; // @[predictor.scala 184:30]
    s1_update__bits_cfi_taken <= io_update_bits_cfi_taken; // @[predictor.scala 184:30]
    s1_update__bits_cfi_is_br <= io_update_bits_cfi_is_br; // @[predictor.scala 184:30]
    s1_update__bits_cfi_is_jal <= io_update_bits_cfi_is_jal; // @[predictor.scala 184:30]
    s1_update__bits_meta <= io_update_bits_meta; // @[predictor.scala 184:30]
    s1_update_idx <= io_update_bits_pc[39:3]; // @[frontend.scala 163:35]
    s2_req_rdata_1 <= data_1_MPORT_data; // @[bim.scala 54:32]
    s2_req_rdata_0 <= data_0_MPORT_data; // @[bim.scala 54:32]
    s2_req_rdata_3 <= data_3_MPORT_data; // @[bim.scala 54:32]
    s2_req_rdata_2 <= data_2_MPORT_data; // @[bim.scala 54:32]
    doing_reset <= reset | _GEN_0; // @[bim.scala 44:28 bim.scala 44:28]
    if (reset) begin // @[bim.scala 45:26]
      reset_idx <= 10'h0; // @[bim.scala 45:26]
    end else begin
      reset_idx <= _T_2; // @[bim.scala 46:13]
    end
    if ((s1_update_wmask_0 | s1_update_wmask_1 | s1_update_wmask_2 | s1_update_wmask_3) & s1_update__valid & _T_141
      ) begin // @[bim.scala 116:93]
      if (!(wrbypass_hit)) begin // @[bim.scala 117:25]
        if (~wrbypass_enq_idx) begin // @[bim.scala 121:39]
          wrbypass_idxs_0 <= s1_update_idx[9:0]; // @[bim.scala 121:39]
        end
      end
    end
    if ((s1_update_wmask_0 | s1_update_wmask_1 | s1_update_wmask_2 | s1_update_wmask_3) & s1_update__valid & _T_141
      ) begin // @[bim.scala 116:93]
      if (!(wrbypass_hit)) begin // @[bim.scala 117:25]
        if (wrbypass_enq_idx) begin // @[bim.scala 121:39]
          wrbypass_idxs_1 <= s1_update_idx[9:0]; // @[bim.scala 121:39]
        end
      end
    end
    if ((s1_update_wmask_0 | s1_update_wmask_1 | s1_update_wmask_2 | s1_update_wmask_3) & s1_update__valid & _T_141
      ) begin // @[bim.scala 116:93]
      if (wrbypass_hit) begin // @[bim.scala 117:25]
        if (~wrbypass_hit_idx) begin // @[bim.scala 118:34]
          wrbypass_0_0 <= s1_update_wdata_0; // @[bim.scala 118:34]
        end
      end else if (~wrbypass_enq_idx) begin // @[bim.scala 120:39]
        wrbypass_0_0 <= s1_update_wdata_0; // @[bim.scala 120:39]
      end
    end
    if ((s1_update_wmask_0 | s1_update_wmask_1 | s1_update_wmask_2 | s1_update_wmask_3) & s1_update__valid & _T_141
      ) begin // @[bim.scala 116:93]
      if (wrbypass_hit) begin // @[bim.scala 117:25]
        if (~wrbypass_hit_idx) begin // @[bim.scala 118:34]
          wrbypass_0_1 <= s1_update_wdata_1; // @[bim.scala 118:34]
        end
      end else if (~wrbypass_enq_idx) begin // @[bim.scala 120:39]
        wrbypass_0_1 <= s1_update_wdata_1; // @[bim.scala 120:39]
      end
    end
    if ((s1_update_wmask_0 | s1_update_wmask_1 | s1_update_wmask_2 | s1_update_wmask_3) & s1_update__valid & _T_141
      ) begin // @[bim.scala 116:93]
      if (wrbypass_hit) begin // @[bim.scala 117:25]
        if (~wrbypass_hit_idx) begin // @[bim.scala 118:34]
          wrbypass_0_2 <= s1_update_wdata_2; // @[bim.scala 118:34]
        end
      end else if (~wrbypass_enq_idx) begin // @[bim.scala 120:39]
        wrbypass_0_2 <= s1_update_wdata_2; // @[bim.scala 120:39]
      end
    end
    if ((s1_update_wmask_0 | s1_update_wmask_1 | s1_update_wmask_2 | s1_update_wmask_3) & s1_update__valid & _T_141
      ) begin // @[bim.scala 116:93]
      if (wrbypass_hit) begin // @[bim.scala 117:25]
        if (~wrbypass_hit_idx) begin // @[bim.scala 118:34]
          wrbypass_0_3 <= s1_update_wdata_3; // @[bim.scala 118:34]
        end
      end else if (~wrbypass_enq_idx) begin // @[bim.scala 120:39]
        wrbypass_0_3 <= s1_update_wdata_3; // @[bim.scala 120:39]
      end
    end
    if ((s1_update_wmask_0 | s1_update_wmask_1 | s1_update_wmask_2 | s1_update_wmask_3) & s1_update__valid & _T_141
      ) begin // @[bim.scala 116:93]
      if (wrbypass_hit) begin // @[bim.scala 117:25]
        if (wrbypass_hit_idx) begin // @[bim.scala 118:34]
          wrbypass_1_0 <= s1_update_wdata_0; // @[bim.scala 118:34]
        end
      end else if (wrbypass_enq_idx) begin // @[bim.scala 120:39]
        wrbypass_1_0 <= s1_update_wdata_0; // @[bim.scala 120:39]
      end
    end
    if ((s1_update_wmask_0 | s1_update_wmask_1 | s1_update_wmask_2 | s1_update_wmask_3) & s1_update__valid & _T_141
      ) begin // @[bim.scala 116:93]
      if (wrbypass_hit) begin // @[bim.scala 117:25]
        if (wrbypass_hit_idx) begin // @[bim.scala 118:34]
          wrbypass_1_1 <= s1_update_wdata_1; // @[bim.scala 118:34]
        end
      end else if (wrbypass_enq_idx) begin // @[bim.scala 120:39]
        wrbypass_1_1 <= s1_update_wdata_1; // @[bim.scala 120:39]
      end
    end
    if ((s1_update_wmask_0 | s1_update_wmask_1 | s1_update_wmask_2 | s1_update_wmask_3) & s1_update__valid & _T_141
      ) begin // @[bim.scala 116:93]
      if (wrbypass_hit) begin // @[bim.scala 117:25]
        if (wrbypass_hit_idx) begin // @[bim.scala 118:34]
          wrbypass_1_2 <= s1_update_wdata_2; // @[bim.scala 118:34]
        end
      end else if (wrbypass_enq_idx) begin // @[bim.scala 120:39]
        wrbypass_1_2 <= s1_update_wdata_2; // @[bim.scala 120:39]
      end
    end
    if ((s1_update_wmask_0 | s1_update_wmask_1 | s1_update_wmask_2 | s1_update_wmask_3) & s1_update__valid & _T_141
      ) begin // @[bim.scala 116:93]
      if (wrbypass_hit) begin // @[bim.scala 117:25]
        if (wrbypass_hit_idx) begin // @[bim.scala 118:34]
          wrbypass_1_3 <= s1_update_wdata_3; // @[bim.scala 118:34]
        end
      end else if (wrbypass_enq_idx) begin // @[bim.scala 120:39]
        wrbypass_1_3 <= s1_update_wdata_3; // @[bim.scala 120:39]
      end
    end
    if (reset) begin // @[bim.scala 72:33]
      wrbypass_enq_idx <= 1'h0; // @[bim.scala 72:33]
    end else if ((s1_update_wmask_0 | s1_update_wmask_1 | s1_update_wmask_2 | s1_update_wmask_3) & s1_update__valid &
      _T_141) begin // @[bim.scala 116:93]
      if (!(wrbypass_hit)) begin // @[bim.scala 117:25]
        wrbypass_enq_idx <= _T_165; // @[bim.scala 122:24]
      end
    end
    REG <= io_resp_f2_0_taken; // @[bim.scala 128:35]
    REG_1 <= io_resp_f2_1_taken; // @[bim.scala 128:35]
    REG_2 <= io_resp_f2_2_taken; // @[bim.scala 128:35]
    REG_3 <= io_resp_f2_3_taken; // @[bim.scala 128:35]
    REG_4 <= {hi,lo}; // @[bim.scala 130:33]
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
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    data_0[initvar] = _RAND_0[1:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    data_1[initvar] = _RAND_3[1:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    data_2[initvar] = _RAND_6[1:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    data_3[initvar] = _RAND_9[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  data_0_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  data_0_MPORT_addr_pipe_0 = _RAND_2[9:0];
  _RAND_4 = {1{`RANDOM}};
  data_1_MPORT_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  data_1_MPORT_addr_pipe_0 = _RAND_5[9:0];
  _RAND_7 = {1{`RANDOM}};
  data_2_MPORT_en_pipe_0 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  data_2_MPORT_addr_pipe_0 = _RAND_8[9:0];
  _RAND_10 = {1{`RANDOM}};
  data_3_MPORT_en_pipe_0 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  data_3_MPORT_addr_pipe_0 = _RAND_11[9:0];
  _RAND_12 = {1{`RANDOM}};
  s1_valid = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s2_valid = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  s1_update__valid = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s1_update__bits_is_mispredict_update = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  s1_update__bits_is_repair_update = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  s1_update__bits_btb_mispredicts = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  s1_update__bits_br_mask = _RAND_18[3:0];
  _RAND_19 = {1{`RANDOM}};
  s1_update__bits_cfi_idx_valid = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  s1_update__bits_cfi_idx_bits = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  s1_update__bits_cfi_taken = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  s1_update__bits_cfi_is_br = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  s1_update__bits_cfi_is_jal = _RAND_23[0:0];
  _RAND_24 = {2{`RANDOM}};
  s1_update__bits_meta = _RAND_24[44:0];
  _RAND_25 = {2{`RANDOM}};
  s1_update_idx = _RAND_25[36:0];
  _RAND_26 = {1{`RANDOM}};
  s2_req_rdata_1 = _RAND_26[1:0];
  _RAND_27 = {1{`RANDOM}};
  s2_req_rdata_0 = _RAND_27[1:0];
  _RAND_28 = {1{`RANDOM}};
  s2_req_rdata_3 = _RAND_28[1:0];
  _RAND_29 = {1{`RANDOM}};
  s2_req_rdata_2 = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  doing_reset = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  reset_idx = _RAND_31[9:0];
  _RAND_32 = {1{`RANDOM}};
  wrbypass_idxs_0 = _RAND_32[9:0];
  _RAND_33 = {1{`RANDOM}};
  wrbypass_idxs_1 = _RAND_33[9:0];
  _RAND_34 = {1{`RANDOM}};
  wrbypass_0_0 = _RAND_34[1:0];
  _RAND_35 = {1{`RANDOM}};
  wrbypass_0_1 = _RAND_35[1:0];
  _RAND_36 = {1{`RANDOM}};
  wrbypass_0_2 = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  wrbypass_0_3 = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  wrbypass_1_0 = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  wrbypass_1_1 = _RAND_39[1:0];
  _RAND_40 = {1{`RANDOM}};
  wrbypass_1_2 = _RAND_40[1:0];
  _RAND_41 = {1{`RANDOM}};
  wrbypass_1_3 = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  wrbypass_enq_idx = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  REG = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  REG_1 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  REG_2 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  REG_3 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  REG_4 = _RAND_47[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
