module PMPChecker_1(
  input         clock,
  input         reset,
  input  [1:0]  io_prv,
  input         io_pmp_0_cfg_l,
  input  [1:0]  io_pmp_0_cfg_res,
  input  [1:0]  io_pmp_0_cfg_a,
  input         io_pmp_0_cfg_x,
  input         io_pmp_0_cfg_w,
  input         io_pmp_0_cfg_r,
  input  [29:0] io_pmp_0_addr,
  input  [31:0] io_pmp_0_mask,
  input         io_pmp_1_cfg_l,
  input  [1:0]  io_pmp_1_cfg_res,
  input  [1:0]  io_pmp_1_cfg_a,
  input         io_pmp_1_cfg_x,
  input         io_pmp_1_cfg_w,
  input         io_pmp_1_cfg_r,
  input  [29:0] io_pmp_1_addr,
  input  [31:0] io_pmp_1_mask,
  input         io_pmp_2_cfg_l,
  input  [1:0]  io_pmp_2_cfg_res,
  input  [1:0]  io_pmp_2_cfg_a,
  input         io_pmp_2_cfg_x,
  input         io_pmp_2_cfg_w,
  input         io_pmp_2_cfg_r,
  input  [29:0] io_pmp_2_addr,
  input  [31:0] io_pmp_2_mask,
  input         io_pmp_3_cfg_l,
  input  [1:0]  io_pmp_3_cfg_res,
  input  [1:0]  io_pmp_3_cfg_a,
  input         io_pmp_3_cfg_x,
  input         io_pmp_3_cfg_w,
  input         io_pmp_3_cfg_r,
  input  [29:0] io_pmp_3_addr,
  input  [31:0] io_pmp_3_mask,
  input         io_pmp_4_cfg_l,
  input  [1:0]  io_pmp_4_cfg_res,
  input  [1:0]  io_pmp_4_cfg_a,
  input         io_pmp_4_cfg_x,
  input         io_pmp_4_cfg_w,
  input         io_pmp_4_cfg_r,
  input  [29:0] io_pmp_4_addr,
  input  [31:0] io_pmp_4_mask,
  input         io_pmp_5_cfg_l,
  input  [1:0]  io_pmp_5_cfg_res,
  input  [1:0]  io_pmp_5_cfg_a,
  input         io_pmp_5_cfg_x,
  input         io_pmp_5_cfg_w,
  input         io_pmp_5_cfg_r,
  input  [29:0] io_pmp_5_addr,
  input  [31:0] io_pmp_5_mask,
  input         io_pmp_6_cfg_l,
  input  [1:0]  io_pmp_6_cfg_res,
  input  [1:0]  io_pmp_6_cfg_a,
  input         io_pmp_6_cfg_x,
  input         io_pmp_6_cfg_w,
  input         io_pmp_6_cfg_r,
  input  [29:0] io_pmp_6_addr,
  input  [31:0] io_pmp_6_mask,
  input         io_pmp_7_cfg_l,
  input  [1:0]  io_pmp_7_cfg_res,
  input  [1:0]  io_pmp_7_cfg_a,
  input         io_pmp_7_cfg_x,
  input         io_pmp_7_cfg_w,
  input         io_pmp_7_cfg_r,
  input  [29:0] io_pmp_7_addr,
  input  [31:0] io_pmp_7_mask,
  input  [31:0] io_addr,
  input  [1:0]  io_size,
  output        io_r,
  output        io_w,
  output        io_x
);
  wire  default_ = io_prv > 2'h1; // @[PMP.scala 157:56]
  wire [5:0] _res_hit_lsbMask_T_1 = 6'h7 << io_size; // @[package.scala 234:77]
  wire [2:0] _res_hit_lsbMask_T_3 = ~_res_hit_lsbMask_T_1[2:0]; // @[package.scala 234:46]
  wire [31:0] _GEN_0 = {{29'd0}, _res_hit_lsbMask_T_3}; // @[PMP.scala 70:26]
  wire [31:0] res_hit_lsbMask = io_pmp_7_mask | _GEN_0; // @[PMP.scala 70:26]
  wire [31:0] _res_hit_msbMatch_T_1 = {io_pmp_7_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _res_hit_msbMatch_T_2 = ~_res_hit_msbMatch_T_1; // @[PMP.scala 62:29]
  wire [31:0] _res_hit_msbMatch_T_3 = _res_hit_msbMatch_T_2 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _res_hit_msbMatch_T_4 = ~_res_hit_msbMatch_T_3; // @[PMP.scala 62:27]
  wire [28:0] _res_hit_msbMatch_T_7 = io_addr[31:3] ^ _res_hit_msbMatch_T_4[31:3]; // @[PMP.scala 65:47]
  wire [28:0] _res_hit_msbMatch_T_8 = ~io_pmp_7_mask[31:3]; // @[PMP.scala 65:54]
  wire [28:0] _res_hit_msbMatch_T_9 = _res_hit_msbMatch_T_7 & _res_hit_msbMatch_T_8; // @[PMP.scala 65:52]
  wire  res_hit_msbMatch = _res_hit_msbMatch_T_9 == 29'h0; // @[PMP.scala 65:58]
  wire [2:0] _res_hit_lsbMatch_T_7 = io_addr[2:0] ^ _res_hit_msbMatch_T_4[2:0]; // @[PMP.scala 65:47]
  wire [2:0] _res_hit_lsbMatch_T_8 = ~res_hit_lsbMask[2:0]; // @[PMP.scala 65:54]
  wire [2:0] _res_hit_lsbMatch_T_9 = _res_hit_lsbMatch_T_7 & _res_hit_lsbMatch_T_8; // @[PMP.scala 65:52]
  wire  res_hit_lsbMatch = _res_hit_lsbMatch_T_9 == 3'h0; // @[PMP.scala 65:58]
  wire  _res_hit_T_1 = res_hit_msbMatch & res_hit_lsbMatch; // @[PMP.scala 73:16]
  wire [31:0] _res_hit_msbsLess_T_1 = {io_pmp_6_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _res_hit_msbsLess_T_2 = ~_res_hit_msbsLess_T_1; // @[PMP.scala 62:29]
  wire [31:0] _res_hit_msbsLess_T_3 = _res_hit_msbsLess_T_2 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _res_hit_msbsLess_T_4 = ~_res_hit_msbsLess_T_3; // @[PMP.scala 62:27]
  wire  res_hit_msbsLess = io_addr[31:3] < _res_hit_msbsLess_T_4[31:3]; // @[PMP.scala 82:39]
  wire [28:0] _res_hit_msbsEqual_T_6 = io_addr[31:3] ^ _res_hit_msbsLess_T_4[31:3]; // @[PMP.scala 83:41]
  wire  res_hit_msbsEqual = _res_hit_msbsEqual_T_6 == 29'h0; // @[PMP.scala 83:69]
  wire [2:0] _res_hit_lsbsLess_T_1 = io_addr[2:0] | _res_hit_lsbMask_T_3; // @[PMP.scala 84:42]
  wire  res_hit_lsbsLess = _res_hit_lsbsLess_T_1 < _res_hit_msbsLess_T_4[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_8 = res_hit_msbsLess | res_hit_msbsEqual & res_hit_lsbsLess; // @[PMP.scala 85:16]
  wire  _res_hit_T_9 = ~_res_hit_T_8; // @[PMP.scala 90:5]
  wire  res_hit_msbsLess_1 = io_addr[31:3] < _res_hit_msbMatch_T_4[31:3]; // @[PMP.scala 82:39]
  wire  res_hit_msbsEqual_1 = _res_hit_msbMatch_T_7 == 29'h0; // @[PMP.scala 83:69]
  wire  res_hit_lsbsLess_1 = io_addr[2:0] < _res_hit_msbMatch_T_4[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_11 = res_hit_msbsLess_1 | res_hit_msbsEqual_1 & res_hit_lsbsLess_1; // @[PMP.scala 85:16]
  wire  _res_hit_T_12 = _res_hit_T_9 & _res_hit_T_11; // @[PMP.scala 96:48]
  wire  res_hit = io_pmp_7_cfg_a[1] ? _res_hit_T_1 : io_pmp_7_cfg_a[0] & _res_hit_T_12; // @[PMP.scala 134:8]
  wire  res_ignore = default_ & ~io_pmp_7_cfg_l; // @[PMP.scala 165:26]
  wire [2:0] _res_aligned_straddlesLowerBound_T_14 = ~io_addr[2:0]; // @[PMP.scala 125:125]
  wire [2:0] _res_aligned_straddlesLowerBound_T_15 = _res_hit_msbsLess_T_4[2:0] & _res_aligned_straddlesLowerBound_T_14; // @[PMP.scala 125:123]
  wire  res_aligned_straddlesLowerBound = res_hit_msbsEqual & _res_aligned_straddlesLowerBound_T_15 != 3'h0; // @[PMP.scala 125:88]
  wire [2:0] _res_aligned_straddlesUpperBound_T_15 = _res_hit_msbMatch_T_4[2:0] & _res_hit_lsbsLess_T_1; // @[PMP.scala 126:113]
  wire  res_aligned_straddlesUpperBound = res_hit_msbsEqual_1 & _res_aligned_straddlesUpperBound_T_15 != 3'h0; // @[PMP.scala 126:83]
  wire  res_aligned_rangeAligned = ~(res_aligned_straddlesLowerBound | res_aligned_straddlesUpperBound); // @[PMP.scala 127:24]
  wire [2:0] _res_aligned_pow2Aligned_T_1 = ~io_pmp_7_mask[2:0]; // @[PMP.scala 128:34]
  wire [2:0] _res_aligned_pow2Aligned_T_2 = _res_hit_lsbMask_T_3 & _res_aligned_pow2Aligned_T_1; // @[PMP.scala 128:32]
  wire  res_aligned_pow2Aligned = _res_aligned_pow2Aligned_T_2 == 3'h0; // @[PMP.scala 128:57]
  wire  res_aligned = io_pmp_7_cfg_a[1] ? res_aligned_pow2Aligned : res_aligned_rangeAligned; // @[PMP.scala 129:8]
  wire  res_cur_cfg_r = res_aligned & (io_pmp_7_cfg_r | res_ignore); // @[PMP.scala 183:26]
  wire  res_cur_cfg_w = res_aligned & (io_pmp_7_cfg_w | res_ignore); // @[PMP.scala 184:26]
  wire  res_cur_cfg_x = res_aligned & (io_pmp_7_cfg_x | res_ignore); // @[PMP.scala 185:26]
  wire  _res_T_44_cfg_x = res_hit ? res_cur_cfg_x : default_; // @[PMP.scala 186:8]
  wire  _res_T_44_cfg_w = res_hit ? res_cur_cfg_w : default_; // @[PMP.scala 186:8]
  wire  _res_T_44_cfg_r = res_hit ? res_cur_cfg_r : default_; // @[PMP.scala 186:8]
  wire [31:0] res_hit_lsbMask_1 = io_pmp_6_mask | _GEN_0; // @[PMP.scala 70:26]
  wire [28:0] _res_hit_msbMatch_T_18 = ~io_pmp_6_mask[31:3]; // @[PMP.scala 65:54]
  wire [28:0] _res_hit_msbMatch_T_19 = _res_hit_msbsEqual_T_6 & _res_hit_msbMatch_T_18; // @[PMP.scala 65:52]
  wire  res_hit_msbMatch_1 = _res_hit_msbMatch_T_19 == 29'h0; // @[PMP.scala 65:58]
  wire [2:0] _res_hit_lsbMatch_T_17 = io_addr[2:0] ^ _res_hit_msbsLess_T_4[2:0]; // @[PMP.scala 65:47]
  wire [2:0] _res_hit_lsbMatch_T_18 = ~res_hit_lsbMask_1[2:0]; // @[PMP.scala 65:54]
  wire [2:0] _res_hit_lsbMatch_T_19 = _res_hit_lsbMatch_T_17 & _res_hit_lsbMatch_T_18; // @[PMP.scala 65:52]
  wire  res_hit_lsbMatch_1 = _res_hit_lsbMatch_T_19 == 3'h0; // @[PMP.scala 65:58]
  wire  _res_hit_T_15 = res_hit_msbMatch_1 & res_hit_lsbMatch_1; // @[PMP.scala 73:16]
  wire [31:0] _res_hit_msbsLess_T_13 = {io_pmp_5_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _res_hit_msbsLess_T_14 = ~_res_hit_msbsLess_T_13; // @[PMP.scala 62:29]
  wire [31:0] _res_hit_msbsLess_T_15 = _res_hit_msbsLess_T_14 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _res_hit_msbsLess_T_16 = ~_res_hit_msbsLess_T_15; // @[PMP.scala 62:27]
  wire  res_hit_msbsLess_2 = io_addr[31:3] < _res_hit_msbsLess_T_16[31:3]; // @[PMP.scala 82:39]
  wire [28:0] _res_hit_msbsEqual_T_20 = io_addr[31:3] ^ _res_hit_msbsLess_T_16[31:3]; // @[PMP.scala 83:41]
  wire  res_hit_msbsEqual_2 = _res_hit_msbsEqual_T_20 == 29'h0; // @[PMP.scala 83:69]
  wire  res_hit_lsbsLess_2 = _res_hit_lsbsLess_T_1 < _res_hit_msbsLess_T_16[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_22 = res_hit_msbsLess_2 | res_hit_msbsEqual_2 & res_hit_lsbsLess_2; // @[PMP.scala 85:16]
  wire  _res_hit_T_23 = ~_res_hit_T_22; // @[PMP.scala 90:5]
  wire  res_hit_lsbsLess_3 = io_addr[2:0] < _res_hit_msbsLess_T_4[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_25 = res_hit_msbsLess | res_hit_msbsEqual & res_hit_lsbsLess_3; // @[PMP.scala 85:16]
  wire  _res_hit_T_26 = _res_hit_T_23 & _res_hit_T_25; // @[PMP.scala 96:48]
  wire  res_hit_1 = io_pmp_6_cfg_a[1] ? _res_hit_T_15 : io_pmp_6_cfg_a[0] & _res_hit_T_26; // @[PMP.scala 134:8]
  wire  res_ignore_1 = default_ & ~io_pmp_6_cfg_l; // @[PMP.scala 165:26]
  wire [2:0] _res_aligned_straddlesLowerBound_T_32 = _res_hit_msbsLess_T_16[2:0] & _res_aligned_straddlesLowerBound_T_14
    ; // @[PMP.scala 125:123]
  wire  res_aligned_straddlesLowerBound_1 = res_hit_msbsEqual_2 & _res_aligned_straddlesLowerBound_T_32 != 3'h0; // @[PMP.scala 125:88]
  wire [2:0] _res_aligned_straddlesUpperBound_T_32 = _res_hit_msbsLess_T_4[2:0] & _res_hit_lsbsLess_T_1; // @[PMP.scala 126:113]
  wire  res_aligned_straddlesUpperBound_1 = res_hit_msbsEqual & _res_aligned_straddlesUpperBound_T_32 != 3'h0; // @[PMP.scala 126:83]
  wire  res_aligned_rangeAligned_1 = ~(res_aligned_straddlesLowerBound_1 | res_aligned_straddlesUpperBound_1); // @[PMP.scala 127:24]
  wire [2:0] _res_aligned_pow2Aligned_T_4 = ~io_pmp_6_mask[2:0]; // @[PMP.scala 128:34]
  wire [2:0] _res_aligned_pow2Aligned_T_5 = _res_hit_lsbMask_T_3 & _res_aligned_pow2Aligned_T_4; // @[PMP.scala 128:32]
  wire  res_aligned_pow2Aligned_1 = _res_aligned_pow2Aligned_T_5 == 3'h0; // @[PMP.scala 128:57]
  wire  res_aligned_1 = io_pmp_6_cfg_a[1] ? res_aligned_pow2Aligned_1 : res_aligned_rangeAligned_1; // @[PMP.scala 129:8]
  wire  res_cur_1_cfg_r = res_aligned_1 & (io_pmp_6_cfg_r | res_ignore_1); // @[PMP.scala 183:26]
  wire  res_cur_1_cfg_w = res_aligned_1 & (io_pmp_6_cfg_w | res_ignore_1); // @[PMP.scala 184:26]
  wire  res_cur_1_cfg_x = res_aligned_1 & (io_pmp_6_cfg_x | res_ignore_1); // @[PMP.scala 185:26]
  wire  _res_T_89_cfg_x = res_hit_1 ? res_cur_1_cfg_x : _res_T_44_cfg_x; // @[PMP.scala 186:8]
  wire  _res_T_89_cfg_w = res_hit_1 ? res_cur_1_cfg_w : _res_T_44_cfg_w; // @[PMP.scala 186:8]
  wire  _res_T_89_cfg_r = res_hit_1 ? res_cur_1_cfg_r : _res_T_44_cfg_r; // @[PMP.scala 186:8]
  wire [31:0] res_hit_lsbMask_2 = io_pmp_5_mask | _GEN_0; // @[PMP.scala 70:26]
  wire [28:0] _res_hit_msbMatch_T_28 = ~io_pmp_5_mask[31:3]; // @[PMP.scala 65:54]
  wire [28:0] _res_hit_msbMatch_T_29 = _res_hit_msbsEqual_T_20 & _res_hit_msbMatch_T_28; // @[PMP.scala 65:52]
  wire  res_hit_msbMatch_2 = _res_hit_msbMatch_T_29 == 29'h0; // @[PMP.scala 65:58]
  wire [2:0] _res_hit_lsbMatch_T_27 = io_addr[2:0] ^ _res_hit_msbsLess_T_16[2:0]; // @[PMP.scala 65:47]
  wire [2:0] _res_hit_lsbMatch_T_28 = ~res_hit_lsbMask_2[2:0]; // @[PMP.scala 65:54]
  wire [2:0] _res_hit_lsbMatch_T_29 = _res_hit_lsbMatch_T_27 & _res_hit_lsbMatch_T_28; // @[PMP.scala 65:52]
  wire  res_hit_lsbMatch_2 = _res_hit_lsbMatch_T_29 == 3'h0; // @[PMP.scala 65:58]
  wire  _res_hit_T_29 = res_hit_msbMatch_2 & res_hit_lsbMatch_2; // @[PMP.scala 73:16]
  wire [31:0] _res_hit_msbsLess_T_25 = {io_pmp_4_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _res_hit_msbsLess_T_26 = ~_res_hit_msbsLess_T_25; // @[PMP.scala 62:29]
  wire [31:0] _res_hit_msbsLess_T_27 = _res_hit_msbsLess_T_26 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _res_hit_msbsLess_T_28 = ~_res_hit_msbsLess_T_27; // @[PMP.scala 62:27]
  wire  res_hit_msbsLess_4 = io_addr[31:3] < _res_hit_msbsLess_T_28[31:3]; // @[PMP.scala 82:39]
  wire [28:0] _res_hit_msbsEqual_T_34 = io_addr[31:3] ^ _res_hit_msbsLess_T_28[31:3]; // @[PMP.scala 83:41]
  wire  res_hit_msbsEqual_4 = _res_hit_msbsEqual_T_34 == 29'h0; // @[PMP.scala 83:69]
  wire  res_hit_lsbsLess_4 = _res_hit_lsbsLess_T_1 < _res_hit_msbsLess_T_28[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_36 = res_hit_msbsLess_4 | res_hit_msbsEqual_4 & res_hit_lsbsLess_4; // @[PMP.scala 85:16]
  wire  _res_hit_T_37 = ~_res_hit_T_36; // @[PMP.scala 90:5]
  wire  res_hit_lsbsLess_5 = io_addr[2:0] < _res_hit_msbsLess_T_16[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_39 = res_hit_msbsLess_2 | res_hit_msbsEqual_2 & res_hit_lsbsLess_5; // @[PMP.scala 85:16]
  wire  _res_hit_T_40 = _res_hit_T_37 & _res_hit_T_39; // @[PMP.scala 96:48]
  wire  res_hit_2 = io_pmp_5_cfg_a[1] ? _res_hit_T_29 : io_pmp_5_cfg_a[0] & _res_hit_T_40; // @[PMP.scala 134:8]
  wire  res_ignore_2 = default_ & ~io_pmp_5_cfg_l; // @[PMP.scala 165:26]
  wire [2:0] _res_aligned_straddlesLowerBound_T_49 = _res_hit_msbsLess_T_28[2:0] & _res_aligned_straddlesLowerBound_T_14
    ; // @[PMP.scala 125:123]
  wire  res_aligned_straddlesLowerBound_2 = res_hit_msbsEqual_4 & _res_aligned_straddlesLowerBound_T_49 != 3'h0; // @[PMP.scala 125:88]
  wire [2:0] _res_aligned_straddlesUpperBound_T_49 = _res_hit_msbsLess_T_16[2:0] & _res_hit_lsbsLess_T_1; // @[PMP.scala 126:113]
  wire  res_aligned_straddlesUpperBound_2 = res_hit_msbsEqual_2 & _res_aligned_straddlesUpperBound_T_49 != 3'h0; // @[PMP.scala 126:83]
  wire  res_aligned_rangeAligned_2 = ~(res_aligned_straddlesLowerBound_2 | res_aligned_straddlesUpperBound_2); // @[PMP.scala 127:24]
  wire [2:0] _res_aligned_pow2Aligned_T_7 = ~io_pmp_5_mask[2:0]; // @[PMP.scala 128:34]
  wire [2:0] _res_aligned_pow2Aligned_T_8 = _res_hit_lsbMask_T_3 & _res_aligned_pow2Aligned_T_7; // @[PMP.scala 128:32]
  wire  res_aligned_pow2Aligned_2 = _res_aligned_pow2Aligned_T_8 == 3'h0; // @[PMP.scala 128:57]
  wire  res_aligned_2 = io_pmp_5_cfg_a[1] ? res_aligned_pow2Aligned_2 : res_aligned_rangeAligned_2; // @[PMP.scala 129:8]
  wire  res_cur_2_cfg_r = res_aligned_2 & (io_pmp_5_cfg_r | res_ignore_2); // @[PMP.scala 183:26]
  wire  res_cur_2_cfg_w = res_aligned_2 & (io_pmp_5_cfg_w | res_ignore_2); // @[PMP.scala 184:26]
  wire  res_cur_2_cfg_x = res_aligned_2 & (io_pmp_5_cfg_x | res_ignore_2); // @[PMP.scala 185:26]
  wire  _res_T_134_cfg_x = res_hit_2 ? res_cur_2_cfg_x : _res_T_89_cfg_x; // @[PMP.scala 186:8]
  wire  _res_T_134_cfg_w = res_hit_2 ? res_cur_2_cfg_w : _res_T_89_cfg_w; // @[PMP.scala 186:8]
  wire  _res_T_134_cfg_r = res_hit_2 ? res_cur_2_cfg_r : _res_T_89_cfg_r; // @[PMP.scala 186:8]
  wire [31:0] res_hit_lsbMask_3 = io_pmp_4_mask | _GEN_0; // @[PMP.scala 70:26]
  wire [28:0] _res_hit_msbMatch_T_38 = ~io_pmp_4_mask[31:3]; // @[PMP.scala 65:54]
  wire [28:0] _res_hit_msbMatch_T_39 = _res_hit_msbsEqual_T_34 & _res_hit_msbMatch_T_38; // @[PMP.scala 65:52]
  wire  res_hit_msbMatch_3 = _res_hit_msbMatch_T_39 == 29'h0; // @[PMP.scala 65:58]
  wire [2:0] _res_hit_lsbMatch_T_37 = io_addr[2:0] ^ _res_hit_msbsLess_T_28[2:0]; // @[PMP.scala 65:47]
  wire [2:0] _res_hit_lsbMatch_T_38 = ~res_hit_lsbMask_3[2:0]; // @[PMP.scala 65:54]
  wire [2:0] _res_hit_lsbMatch_T_39 = _res_hit_lsbMatch_T_37 & _res_hit_lsbMatch_T_38; // @[PMP.scala 65:52]
  wire  res_hit_lsbMatch_3 = _res_hit_lsbMatch_T_39 == 3'h0; // @[PMP.scala 65:58]
  wire  _res_hit_T_43 = res_hit_msbMatch_3 & res_hit_lsbMatch_3; // @[PMP.scala 73:16]
  wire [31:0] _res_hit_msbsLess_T_37 = {io_pmp_3_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _res_hit_msbsLess_T_38 = ~_res_hit_msbsLess_T_37; // @[PMP.scala 62:29]
  wire [31:0] _res_hit_msbsLess_T_39 = _res_hit_msbsLess_T_38 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _res_hit_msbsLess_T_40 = ~_res_hit_msbsLess_T_39; // @[PMP.scala 62:27]
  wire  res_hit_msbsLess_6 = io_addr[31:3] < _res_hit_msbsLess_T_40[31:3]; // @[PMP.scala 82:39]
  wire [28:0] _res_hit_msbsEqual_T_48 = io_addr[31:3] ^ _res_hit_msbsLess_T_40[31:3]; // @[PMP.scala 83:41]
  wire  res_hit_msbsEqual_6 = _res_hit_msbsEqual_T_48 == 29'h0; // @[PMP.scala 83:69]
  wire  res_hit_lsbsLess_6 = _res_hit_lsbsLess_T_1 < _res_hit_msbsLess_T_40[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_50 = res_hit_msbsLess_6 | res_hit_msbsEqual_6 & res_hit_lsbsLess_6; // @[PMP.scala 85:16]
  wire  _res_hit_T_51 = ~_res_hit_T_50; // @[PMP.scala 90:5]
  wire  res_hit_lsbsLess_7 = io_addr[2:0] < _res_hit_msbsLess_T_28[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_53 = res_hit_msbsLess_4 | res_hit_msbsEqual_4 & res_hit_lsbsLess_7; // @[PMP.scala 85:16]
  wire  _res_hit_T_54 = _res_hit_T_51 & _res_hit_T_53; // @[PMP.scala 96:48]
  wire  res_hit_3 = io_pmp_4_cfg_a[1] ? _res_hit_T_43 : io_pmp_4_cfg_a[0] & _res_hit_T_54; // @[PMP.scala 134:8]
  wire  res_ignore_3 = default_ & ~io_pmp_4_cfg_l; // @[PMP.scala 165:26]
  wire [2:0] _res_aligned_straddlesLowerBound_T_66 = _res_hit_msbsLess_T_40[2:0] & _res_aligned_straddlesLowerBound_T_14
    ; // @[PMP.scala 125:123]
  wire  res_aligned_straddlesLowerBound_3 = res_hit_msbsEqual_6 & _res_aligned_straddlesLowerBound_T_66 != 3'h0; // @[PMP.scala 125:88]
  wire [2:0] _res_aligned_straddlesUpperBound_T_66 = _res_hit_msbsLess_T_28[2:0] & _res_hit_lsbsLess_T_1; // @[PMP.scala 126:113]
  wire  res_aligned_straddlesUpperBound_3 = res_hit_msbsEqual_4 & _res_aligned_straddlesUpperBound_T_66 != 3'h0; // @[PMP.scala 126:83]
  wire  res_aligned_rangeAligned_3 = ~(res_aligned_straddlesLowerBound_3 | res_aligned_straddlesUpperBound_3); // @[PMP.scala 127:24]
  wire [2:0] _res_aligned_pow2Aligned_T_10 = ~io_pmp_4_mask[2:0]; // @[PMP.scala 128:34]
  wire [2:0] _res_aligned_pow2Aligned_T_11 = _res_hit_lsbMask_T_3 & _res_aligned_pow2Aligned_T_10; // @[PMP.scala 128:32]
  wire  res_aligned_pow2Aligned_3 = _res_aligned_pow2Aligned_T_11 == 3'h0; // @[PMP.scala 128:57]
  wire  res_aligned_3 = io_pmp_4_cfg_a[1] ? res_aligned_pow2Aligned_3 : res_aligned_rangeAligned_3; // @[PMP.scala 129:8]
  wire  res_cur_3_cfg_r = res_aligned_3 & (io_pmp_4_cfg_r | res_ignore_3); // @[PMP.scala 183:26]
  wire  res_cur_3_cfg_w = res_aligned_3 & (io_pmp_4_cfg_w | res_ignore_3); // @[PMP.scala 184:26]
  wire  res_cur_3_cfg_x = res_aligned_3 & (io_pmp_4_cfg_x | res_ignore_3); // @[PMP.scala 185:26]
  wire  _res_T_179_cfg_x = res_hit_3 ? res_cur_3_cfg_x : _res_T_134_cfg_x; // @[PMP.scala 186:8]
  wire  _res_T_179_cfg_w = res_hit_3 ? res_cur_3_cfg_w : _res_T_134_cfg_w; // @[PMP.scala 186:8]
  wire  _res_T_179_cfg_r = res_hit_3 ? res_cur_3_cfg_r : _res_T_134_cfg_r; // @[PMP.scala 186:8]
  wire [31:0] res_hit_lsbMask_4 = io_pmp_3_mask | _GEN_0; // @[PMP.scala 70:26]
  wire [28:0] _res_hit_msbMatch_T_48 = ~io_pmp_3_mask[31:3]; // @[PMP.scala 65:54]
  wire [28:0] _res_hit_msbMatch_T_49 = _res_hit_msbsEqual_T_48 & _res_hit_msbMatch_T_48; // @[PMP.scala 65:52]
  wire  res_hit_msbMatch_4 = _res_hit_msbMatch_T_49 == 29'h0; // @[PMP.scala 65:58]
  wire [2:0] _res_hit_lsbMatch_T_47 = io_addr[2:0] ^ _res_hit_msbsLess_T_40[2:0]; // @[PMP.scala 65:47]
  wire [2:0] _res_hit_lsbMatch_T_48 = ~res_hit_lsbMask_4[2:0]; // @[PMP.scala 65:54]
  wire [2:0] _res_hit_lsbMatch_T_49 = _res_hit_lsbMatch_T_47 & _res_hit_lsbMatch_T_48; // @[PMP.scala 65:52]
  wire  res_hit_lsbMatch_4 = _res_hit_lsbMatch_T_49 == 3'h0; // @[PMP.scala 65:58]
  wire  _res_hit_T_57 = res_hit_msbMatch_4 & res_hit_lsbMatch_4; // @[PMP.scala 73:16]
  wire [31:0] _res_hit_msbsLess_T_49 = {io_pmp_2_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _res_hit_msbsLess_T_50 = ~_res_hit_msbsLess_T_49; // @[PMP.scala 62:29]
  wire [31:0] _res_hit_msbsLess_T_51 = _res_hit_msbsLess_T_50 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _res_hit_msbsLess_T_52 = ~_res_hit_msbsLess_T_51; // @[PMP.scala 62:27]
  wire  res_hit_msbsLess_8 = io_addr[31:3] < _res_hit_msbsLess_T_52[31:3]; // @[PMP.scala 82:39]
  wire [28:0] _res_hit_msbsEqual_T_62 = io_addr[31:3] ^ _res_hit_msbsLess_T_52[31:3]; // @[PMP.scala 83:41]
  wire  res_hit_msbsEqual_8 = _res_hit_msbsEqual_T_62 == 29'h0; // @[PMP.scala 83:69]
  wire  res_hit_lsbsLess_8 = _res_hit_lsbsLess_T_1 < _res_hit_msbsLess_T_52[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_64 = res_hit_msbsLess_8 | res_hit_msbsEqual_8 & res_hit_lsbsLess_8; // @[PMP.scala 85:16]
  wire  _res_hit_T_65 = ~_res_hit_T_64; // @[PMP.scala 90:5]
  wire  res_hit_lsbsLess_9 = io_addr[2:0] < _res_hit_msbsLess_T_40[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_67 = res_hit_msbsLess_6 | res_hit_msbsEqual_6 & res_hit_lsbsLess_9; // @[PMP.scala 85:16]
  wire  _res_hit_T_68 = _res_hit_T_65 & _res_hit_T_67; // @[PMP.scala 96:48]
  wire  res_hit_4 = io_pmp_3_cfg_a[1] ? _res_hit_T_57 : io_pmp_3_cfg_a[0] & _res_hit_T_68; // @[PMP.scala 134:8]
  wire  res_ignore_4 = default_ & ~io_pmp_3_cfg_l; // @[PMP.scala 165:26]
  wire [2:0] _res_aligned_straddlesLowerBound_T_83 = _res_hit_msbsLess_T_52[2:0] & _res_aligned_straddlesLowerBound_T_14
    ; // @[PMP.scala 125:123]
  wire  res_aligned_straddlesLowerBound_4 = res_hit_msbsEqual_8 & _res_aligned_straddlesLowerBound_T_83 != 3'h0; // @[PMP.scala 125:88]
  wire [2:0] _res_aligned_straddlesUpperBound_T_83 = _res_hit_msbsLess_T_40[2:0] & _res_hit_lsbsLess_T_1; // @[PMP.scala 126:113]
  wire  res_aligned_straddlesUpperBound_4 = res_hit_msbsEqual_6 & _res_aligned_straddlesUpperBound_T_83 != 3'h0; // @[PMP.scala 126:83]
  wire  res_aligned_rangeAligned_4 = ~(res_aligned_straddlesLowerBound_4 | res_aligned_straddlesUpperBound_4); // @[PMP.scala 127:24]
  wire [2:0] _res_aligned_pow2Aligned_T_13 = ~io_pmp_3_mask[2:0]; // @[PMP.scala 128:34]
  wire [2:0] _res_aligned_pow2Aligned_T_14 = _res_hit_lsbMask_T_3 & _res_aligned_pow2Aligned_T_13; // @[PMP.scala 128:32]
  wire  res_aligned_pow2Aligned_4 = _res_aligned_pow2Aligned_T_14 == 3'h0; // @[PMP.scala 128:57]
  wire  res_aligned_4 = io_pmp_3_cfg_a[1] ? res_aligned_pow2Aligned_4 : res_aligned_rangeAligned_4; // @[PMP.scala 129:8]
  wire  res_cur_4_cfg_r = res_aligned_4 & (io_pmp_3_cfg_r | res_ignore_4); // @[PMP.scala 183:26]
  wire  res_cur_4_cfg_w = res_aligned_4 & (io_pmp_3_cfg_w | res_ignore_4); // @[PMP.scala 184:26]
  wire  res_cur_4_cfg_x = res_aligned_4 & (io_pmp_3_cfg_x | res_ignore_4); // @[PMP.scala 185:26]
  wire  _res_T_224_cfg_x = res_hit_4 ? res_cur_4_cfg_x : _res_T_179_cfg_x; // @[PMP.scala 186:8]
  wire  _res_T_224_cfg_w = res_hit_4 ? res_cur_4_cfg_w : _res_T_179_cfg_w; // @[PMP.scala 186:8]
  wire  _res_T_224_cfg_r = res_hit_4 ? res_cur_4_cfg_r : _res_T_179_cfg_r; // @[PMP.scala 186:8]
  wire [31:0] res_hit_lsbMask_5 = io_pmp_2_mask | _GEN_0; // @[PMP.scala 70:26]
  wire [28:0] _res_hit_msbMatch_T_58 = ~io_pmp_2_mask[31:3]; // @[PMP.scala 65:54]
  wire [28:0] _res_hit_msbMatch_T_59 = _res_hit_msbsEqual_T_62 & _res_hit_msbMatch_T_58; // @[PMP.scala 65:52]
  wire  res_hit_msbMatch_5 = _res_hit_msbMatch_T_59 == 29'h0; // @[PMP.scala 65:58]
  wire [2:0] _res_hit_lsbMatch_T_57 = io_addr[2:0] ^ _res_hit_msbsLess_T_52[2:0]; // @[PMP.scala 65:47]
  wire [2:0] _res_hit_lsbMatch_T_58 = ~res_hit_lsbMask_5[2:0]; // @[PMP.scala 65:54]
  wire [2:0] _res_hit_lsbMatch_T_59 = _res_hit_lsbMatch_T_57 & _res_hit_lsbMatch_T_58; // @[PMP.scala 65:52]
  wire  res_hit_lsbMatch_5 = _res_hit_lsbMatch_T_59 == 3'h0; // @[PMP.scala 65:58]
  wire  _res_hit_T_71 = res_hit_msbMatch_5 & res_hit_lsbMatch_5; // @[PMP.scala 73:16]
  wire [31:0] _res_hit_msbsLess_T_61 = {io_pmp_1_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _res_hit_msbsLess_T_62 = ~_res_hit_msbsLess_T_61; // @[PMP.scala 62:29]
  wire [31:0] _res_hit_msbsLess_T_63 = _res_hit_msbsLess_T_62 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _res_hit_msbsLess_T_64 = ~_res_hit_msbsLess_T_63; // @[PMP.scala 62:27]
  wire  res_hit_msbsLess_10 = io_addr[31:3] < _res_hit_msbsLess_T_64[31:3]; // @[PMP.scala 82:39]
  wire [28:0] _res_hit_msbsEqual_T_76 = io_addr[31:3] ^ _res_hit_msbsLess_T_64[31:3]; // @[PMP.scala 83:41]
  wire  res_hit_msbsEqual_10 = _res_hit_msbsEqual_T_76 == 29'h0; // @[PMP.scala 83:69]
  wire  res_hit_lsbsLess_10 = _res_hit_lsbsLess_T_1 < _res_hit_msbsLess_T_64[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_78 = res_hit_msbsLess_10 | res_hit_msbsEqual_10 & res_hit_lsbsLess_10; // @[PMP.scala 85:16]
  wire  _res_hit_T_79 = ~_res_hit_T_78; // @[PMP.scala 90:5]
  wire  res_hit_lsbsLess_11 = io_addr[2:0] < _res_hit_msbsLess_T_52[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_81 = res_hit_msbsLess_8 | res_hit_msbsEqual_8 & res_hit_lsbsLess_11; // @[PMP.scala 85:16]
  wire  _res_hit_T_82 = _res_hit_T_79 & _res_hit_T_81; // @[PMP.scala 96:48]
  wire  res_hit_5 = io_pmp_2_cfg_a[1] ? _res_hit_T_71 : io_pmp_2_cfg_a[0] & _res_hit_T_82; // @[PMP.scala 134:8]
  wire  res_ignore_5 = default_ & ~io_pmp_2_cfg_l; // @[PMP.scala 165:26]
  wire [2:0] _res_aligned_straddlesLowerBound_T_100 = _res_hit_msbsLess_T_64[2:0] &
    _res_aligned_straddlesLowerBound_T_14; // @[PMP.scala 125:123]
  wire  res_aligned_straddlesLowerBound_5 = res_hit_msbsEqual_10 & _res_aligned_straddlesLowerBound_T_100 != 3'h0; // @[PMP.scala 125:88]
  wire [2:0] _res_aligned_straddlesUpperBound_T_100 = _res_hit_msbsLess_T_52[2:0] & _res_hit_lsbsLess_T_1; // @[PMP.scala 126:113]
  wire  res_aligned_straddlesUpperBound_5 = res_hit_msbsEqual_8 & _res_aligned_straddlesUpperBound_T_100 != 3'h0; // @[PMP.scala 126:83]
  wire  res_aligned_rangeAligned_5 = ~(res_aligned_straddlesLowerBound_5 | res_aligned_straddlesUpperBound_5); // @[PMP.scala 127:24]
  wire [2:0] _res_aligned_pow2Aligned_T_16 = ~io_pmp_2_mask[2:0]; // @[PMP.scala 128:34]
  wire [2:0] _res_aligned_pow2Aligned_T_17 = _res_hit_lsbMask_T_3 & _res_aligned_pow2Aligned_T_16; // @[PMP.scala 128:32]
  wire  res_aligned_pow2Aligned_5 = _res_aligned_pow2Aligned_T_17 == 3'h0; // @[PMP.scala 128:57]
  wire  res_aligned_5 = io_pmp_2_cfg_a[1] ? res_aligned_pow2Aligned_5 : res_aligned_rangeAligned_5; // @[PMP.scala 129:8]
  wire  res_cur_5_cfg_r = res_aligned_5 & (io_pmp_2_cfg_r | res_ignore_5); // @[PMP.scala 183:26]
  wire  res_cur_5_cfg_w = res_aligned_5 & (io_pmp_2_cfg_w | res_ignore_5); // @[PMP.scala 184:26]
  wire  res_cur_5_cfg_x = res_aligned_5 & (io_pmp_2_cfg_x | res_ignore_5); // @[PMP.scala 185:26]
  wire  _res_T_269_cfg_x = res_hit_5 ? res_cur_5_cfg_x : _res_T_224_cfg_x; // @[PMP.scala 186:8]
  wire  _res_T_269_cfg_w = res_hit_5 ? res_cur_5_cfg_w : _res_T_224_cfg_w; // @[PMP.scala 186:8]
  wire  _res_T_269_cfg_r = res_hit_5 ? res_cur_5_cfg_r : _res_T_224_cfg_r; // @[PMP.scala 186:8]
  wire [31:0] res_hit_lsbMask_6 = io_pmp_1_mask | _GEN_0; // @[PMP.scala 70:26]
  wire [28:0] _res_hit_msbMatch_T_68 = ~io_pmp_1_mask[31:3]; // @[PMP.scala 65:54]
  wire [28:0] _res_hit_msbMatch_T_69 = _res_hit_msbsEqual_T_76 & _res_hit_msbMatch_T_68; // @[PMP.scala 65:52]
  wire  res_hit_msbMatch_6 = _res_hit_msbMatch_T_69 == 29'h0; // @[PMP.scala 65:58]
  wire [2:0] _res_hit_lsbMatch_T_67 = io_addr[2:0] ^ _res_hit_msbsLess_T_64[2:0]; // @[PMP.scala 65:47]
  wire [2:0] _res_hit_lsbMatch_T_68 = ~res_hit_lsbMask_6[2:0]; // @[PMP.scala 65:54]
  wire [2:0] _res_hit_lsbMatch_T_69 = _res_hit_lsbMatch_T_67 & _res_hit_lsbMatch_T_68; // @[PMP.scala 65:52]
  wire  res_hit_lsbMatch_6 = _res_hit_lsbMatch_T_69 == 3'h0; // @[PMP.scala 65:58]
  wire  _res_hit_T_85 = res_hit_msbMatch_6 & res_hit_lsbMatch_6; // @[PMP.scala 73:16]
  wire [31:0] _res_hit_msbsLess_T_73 = {io_pmp_0_addr, 2'h0}; // @[PMP.scala 62:36]
  wire [31:0] _res_hit_msbsLess_T_74 = ~_res_hit_msbsLess_T_73; // @[PMP.scala 62:29]
  wire [31:0] _res_hit_msbsLess_T_75 = _res_hit_msbsLess_T_74 | 32'h3; // @[PMP.scala 62:48]
  wire [31:0] _res_hit_msbsLess_T_76 = ~_res_hit_msbsLess_T_75; // @[PMP.scala 62:27]
  wire  res_hit_msbsLess_12 = io_addr[31:3] < _res_hit_msbsLess_T_76[31:3]; // @[PMP.scala 82:39]
  wire [28:0] _res_hit_msbsEqual_T_90 = io_addr[31:3] ^ _res_hit_msbsLess_T_76[31:3]; // @[PMP.scala 83:41]
  wire  res_hit_msbsEqual_12 = _res_hit_msbsEqual_T_90 == 29'h0; // @[PMP.scala 83:69]
  wire  res_hit_lsbsLess_12 = _res_hit_lsbsLess_T_1 < _res_hit_msbsLess_T_76[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_92 = res_hit_msbsLess_12 | res_hit_msbsEqual_12 & res_hit_lsbsLess_12; // @[PMP.scala 85:16]
  wire  _res_hit_T_93 = ~_res_hit_T_92; // @[PMP.scala 90:5]
  wire  res_hit_lsbsLess_13 = io_addr[2:0] < _res_hit_msbsLess_T_64[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_95 = res_hit_msbsLess_10 | res_hit_msbsEqual_10 & res_hit_lsbsLess_13; // @[PMP.scala 85:16]
  wire  _res_hit_T_96 = _res_hit_T_93 & _res_hit_T_95; // @[PMP.scala 96:48]
  wire  res_hit_6 = io_pmp_1_cfg_a[1] ? _res_hit_T_85 : io_pmp_1_cfg_a[0] & _res_hit_T_96; // @[PMP.scala 134:8]
  wire  res_ignore_6 = default_ & ~io_pmp_1_cfg_l; // @[PMP.scala 165:26]
  wire [2:0] _res_aligned_straddlesLowerBound_T_117 = _res_hit_msbsLess_T_76[2:0] &
    _res_aligned_straddlesLowerBound_T_14; // @[PMP.scala 125:123]
  wire  res_aligned_straddlesLowerBound_6 = res_hit_msbsEqual_12 & _res_aligned_straddlesLowerBound_T_117 != 3'h0; // @[PMP.scala 125:88]
  wire [2:0] _res_aligned_straddlesUpperBound_T_117 = _res_hit_msbsLess_T_64[2:0] & _res_hit_lsbsLess_T_1; // @[PMP.scala 126:113]
  wire  res_aligned_straddlesUpperBound_6 = res_hit_msbsEqual_10 & _res_aligned_straddlesUpperBound_T_117 != 3'h0; // @[PMP.scala 126:83]
  wire  res_aligned_rangeAligned_6 = ~(res_aligned_straddlesLowerBound_6 | res_aligned_straddlesUpperBound_6); // @[PMP.scala 127:24]
  wire [2:0] _res_aligned_pow2Aligned_T_19 = ~io_pmp_1_mask[2:0]; // @[PMP.scala 128:34]
  wire [2:0] _res_aligned_pow2Aligned_T_20 = _res_hit_lsbMask_T_3 & _res_aligned_pow2Aligned_T_19; // @[PMP.scala 128:32]
  wire  res_aligned_pow2Aligned_6 = _res_aligned_pow2Aligned_T_20 == 3'h0; // @[PMP.scala 128:57]
  wire  res_aligned_6 = io_pmp_1_cfg_a[1] ? res_aligned_pow2Aligned_6 : res_aligned_rangeAligned_6; // @[PMP.scala 129:8]
  wire  res_cur_6_cfg_r = res_aligned_6 & (io_pmp_1_cfg_r | res_ignore_6); // @[PMP.scala 183:26]
  wire  res_cur_6_cfg_w = res_aligned_6 & (io_pmp_1_cfg_w | res_ignore_6); // @[PMP.scala 184:26]
  wire  res_cur_6_cfg_x = res_aligned_6 & (io_pmp_1_cfg_x | res_ignore_6); // @[PMP.scala 185:26]
  wire  _res_T_314_cfg_x = res_hit_6 ? res_cur_6_cfg_x : _res_T_269_cfg_x; // @[PMP.scala 186:8]
  wire  _res_T_314_cfg_w = res_hit_6 ? res_cur_6_cfg_w : _res_T_269_cfg_w; // @[PMP.scala 186:8]
  wire  _res_T_314_cfg_r = res_hit_6 ? res_cur_6_cfg_r : _res_T_269_cfg_r; // @[PMP.scala 186:8]
  wire [31:0] res_hit_lsbMask_7 = io_pmp_0_mask | _GEN_0; // @[PMP.scala 70:26]
  wire [28:0] _res_hit_msbMatch_T_78 = ~io_pmp_0_mask[31:3]; // @[PMP.scala 65:54]
  wire [28:0] _res_hit_msbMatch_T_79 = _res_hit_msbsEqual_T_90 & _res_hit_msbMatch_T_78; // @[PMP.scala 65:52]
  wire  res_hit_msbMatch_7 = _res_hit_msbMatch_T_79 == 29'h0; // @[PMP.scala 65:58]
  wire [2:0] _res_hit_lsbMatch_T_77 = io_addr[2:0] ^ _res_hit_msbsLess_T_76[2:0]; // @[PMP.scala 65:47]
  wire [2:0] _res_hit_lsbMatch_T_78 = ~res_hit_lsbMask_7[2:0]; // @[PMP.scala 65:54]
  wire [2:0] _res_hit_lsbMatch_T_79 = _res_hit_lsbMatch_T_77 & _res_hit_lsbMatch_T_78; // @[PMP.scala 65:52]
  wire  res_hit_lsbMatch_7 = _res_hit_lsbMatch_T_79 == 3'h0; // @[PMP.scala 65:58]
  wire  _res_hit_T_99 = res_hit_msbMatch_7 & res_hit_lsbMatch_7; // @[PMP.scala 73:16]
  wire  res_hit_lsbsLess_15 = io_addr[2:0] < _res_hit_msbsLess_T_76[2:0]; // @[PMP.scala 84:53]
  wire  _res_hit_T_109 = res_hit_msbsLess_12 | res_hit_msbsEqual_12 & res_hit_lsbsLess_15; // @[PMP.scala 85:16]
  wire  res_hit_7 = io_pmp_0_cfg_a[1] ? _res_hit_T_99 : io_pmp_0_cfg_a[0] & _res_hit_T_109; // @[PMP.scala 134:8]
  wire  res_ignore_7 = default_ & ~io_pmp_0_cfg_l; // @[PMP.scala 165:26]
  wire [2:0] _res_aligned_straddlesUpperBound_T_134 = _res_hit_msbsLess_T_76[2:0] & _res_hit_lsbsLess_T_1; // @[PMP.scala 126:113]
  wire  res_aligned_straddlesUpperBound_7 = res_hit_msbsEqual_12 & _res_aligned_straddlesUpperBound_T_134 != 3'h0; // @[PMP.scala 126:83]
  wire  res_aligned_rangeAligned_7 = ~res_aligned_straddlesUpperBound_7; // @[PMP.scala 127:24]
  wire [2:0] _res_aligned_pow2Aligned_T_22 = ~io_pmp_0_mask[2:0]; // @[PMP.scala 128:34]
  wire [2:0] _res_aligned_pow2Aligned_T_23 = _res_hit_lsbMask_T_3 & _res_aligned_pow2Aligned_T_22; // @[PMP.scala 128:32]
  wire  res_aligned_pow2Aligned_7 = _res_aligned_pow2Aligned_T_23 == 3'h0; // @[PMP.scala 128:57]
  wire  res_aligned_7 = io_pmp_0_cfg_a[1] ? res_aligned_pow2Aligned_7 : res_aligned_rangeAligned_7; // @[PMP.scala 129:8]
  wire  res_cur_7_cfg_r = res_aligned_7 & (io_pmp_0_cfg_r | res_ignore_7); // @[PMP.scala 183:26]
  wire  res_cur_7_cfg_w = res_aligned_7 & (io_pmp_0_cfg_w | res_ignore_7); // @[PMP.scala 184:26]
  wire  res_cur_7_cfg_x = res_aligned_7 & (io_pmp_0_cfg_x | res_ignore_7); // @[PMP.scala 185:26]
  assign io_r = res_hit_7 ? res_cur_7_cfg_r : _res_T_314_cfg_r; // @[PMP.scala 186:8]
  assign io_w = res_hit_7 ? res_cur_7_cfg_w : _res_T_314_cfg_w; // @[PMP.scala 186:8]
  assign io_x = res_hit_7 ? res_cur_7_cfg_x : _res_T_314_cfg_x; // @[PMP.scala 186:8]
endmodule
