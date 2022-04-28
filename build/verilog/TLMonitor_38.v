module TLMonitor_38(
  input         clock,
  input         reset,
  input         io_in_a_ready,
  input         io_in_a_valid,
  input  [2:0]  io_in_a_bits_opcode,
  input  [2:0]  io_in_a_bits_param,
  input  [3:0]  io_in_a_bits_size,
  input  [2:0]  io_in_a_bits_source,
  input  [31:0] io_in_a_bits_address,
  input  [7:0]  io_in_a_bits_mask,
  input  [63:0] io_in_a_bits_data,
  input         io_in_a_bits_corrupt,
  input         io_in_b_ready,
  input         io_in_b_valid,
  input  [2:0]  io_in_b_bits_opcode,
  input  [1:0]  io_in_b_bits_param,
  input  [3:0]  io_in_b_bits_size,
  input  [2:0]  io_in_b_bits_source,
  input  [31:0] io_in_b_bits_address,
  input  [7:0]  io_in_b_bits_mask,
  input  [63:0] io_in_b_bits_data,
  input         io_in_b_bits_corrupt,
  input         io_in_c_ready,
  input         io_in_c_valid,
  input  [2:0]  io_in_c_bits_opcode,
  input  [2:0]  io_in_c_bits_param,
  input  [3:0]  io_in_c_bits_size,
  input  [2:0]  io_in_c_bits_source,
  input  [31:0] io_in_c_bits_address,
  input  [63:0] io_in_c_bits_data,
  input         io_in_c_bits_corrupt,
  input         io_in_d_ready,
  input         io_in_d_valid,
  input  [2:0]  io_in_d_bits_opcode,
  input  [1:0]  io_in_d_bits_param,
  input  [3:0]  io_in_d_bits_size,
  input  [2:0]  io_in_d_bits_source,
  input  [1:0]  io_in_d_bits_sink,
  input         io_in_d_bits_denied,
  input  [63:0] io_in_d_bits_data,
  input         io_in_d_bits_corrupt,
  input         io_in_e_ready,
  input         io_in_e_valid,
  input  [1:0]  io_in_e_bits_sink
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
  reg [63:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] plusarg_reader_out; // @[PlusArg.scala 80:11]
  wire [31:0] plusarg_reader_1_out; // @[PlusArg.scala 80:11]
  wire [1:0] source_ok_uncommonBits = io_in_a_bits_source[1:0]; // @[Parameters.scala 52:64]
  wire  _source_ok_T_1 = ~io_in_a_bits_source[2]; // @[Parameters.scala 54:32]
  wire  _source_ok_T_4 = source_ok_uncommonBits <= 2'h2; // @[Parameters.scala 57:20]
  wire  _source_ok_T_5 = _source_ok_T_1 & _source_ok_T_4; // @[Parameters.scala 56:50]
  wire  _source_ok_T_6 = io_in_a_bits_source == 3'h3; // @[Parameters.scala 46:9]
  wire  _source_ok_T_7 = io_in_a_bits_source == 3'h4; // @[Parameters.scala 46:9]
  wire  source_ok = _source_ok_T_5 | _source_ok_T_6 | _source_ok_T_7; // @[Parameters.scala 1125:46]
  wire [26:0] _is_aligned_mask_T_1 = 27'hfff << io_in_a_bits_size; // @[package.scala 234:77]
  wire [11:0] is_aligned_mask = ~_is_aligned_mask_T_1[11:0]; // @[package.scala 234:46]
  wire [31:0] _GEN_86 = {{20'd0}, is_aligned_mask}; // @[Edges.scala 20:16]
  wire [31:0] _is_aligned_T = io_in_a_bits_address & _GEN_86; // @[Edges.scala 20:16]
  wire  is_aligned = _is_aligned_T == 32'h0; // @[Edges.scala 20:24]
  wire [1:0] mask_sizeOH_shiftAmount = io_in_a_bits_size[1:0]; // @[OneHot.scala 64:49]
  wire [3:0] _mask_sizeOH_T_1 = 4'h1 << mask_sizeOH_shiftAmount; // @[OneHot.scala 65:12]
  wire [2:0] mask_sizeOH = _mask_sizeOH_T_1[2:0] | 3'h1; // @[Misc.scala 201:81]
  wire  _mask_T = io_in_a_bits_size >= 4'h3; // @[Misc.scala 205:21]
  wire  mask_size = mask_sizeOH[2]; // @[Misc.scala 208:26]
  wire  mask_bit = io_in_a_bits_address[2]; // @[Misc.scala 209:26]
  wire  mask_nbit = ~mask_bit; // @[Misc.scala 210:20]
  wire  mask_acc = _mask_T | mask_size & mask_nbit; // @[Misc.scala 214:29]
  wire  mask_acc_1 = _mask_T | mask_size & mask_bit; // @[Misc.scala 214:29]
  wire  mask_size_1 = mask_sizeOH[1]; // @[Misc.scala 208:26]
  wire  mask_bit_1 = io_in_a_bits_address[1]; // @[Misc.scala 209:26]
  wire  mask_nbit_1 = ~mask_bit_1; // @[Misc.scala 210:20]
  wire  mask_eq_2 = mask_nbit & mask_nbit_1; // @[Misc.scala 213:27]
  wire  mask_acc_2 = mask_acc | mask_size_1 & mask_eq_2; // @[Misc.scala 214:29]
  wire  mask_eq_3 = mask_nbit & mask_bit_1; // @[Misc.scala 213:27]
  wire  mask_acc_3 = mask_acc | mask_size_1 & mask_eq_3; // @[Misc.scala 214:29]
  wire  mask_eq_4 = mask_bit & mask_nbit_1; // @[Misc.scala 213:27]
  wire  mask_acc_4 = mask_acc_1 | mask_size_1 & mask_eq_4; // @[Misc.scala 214:29]
  wire  mask_eq_5 = mask_bit & mask_bit_1; // @[Misc.scala 213:27]
  wire  mask_acc_5 = mask_acc_1 | mask_size_1 & mask_eq_5; // @[Misc.scala 214:29]
  wire  mask_size_2 = mask_sizeOH[0]; // @[Misc.scala 208:26]
  wire  mask_bit_2 = io_in_a_bits_address[0]; // @[Misc.scala 209:26]
  wire  mask_nbit_2 = ~mask_bit_2; // @[Misc.scala 210:20]
  wire  mask_eq_6 = mask_eq_2 & mask_nbit_2; // @[Misc.scala 213:27]
  wire  mask_lo_lo_lo = mask_acc_2 | mask_size_2 & mask_eq_6; // @[Misc.scala 214:29]
  wire  mask_eq_7 = mask_eq_2 & mask_bit_2; // @[Misc.scala 213:27]
  wire  mask_lo_lo_hi = mask_acc_2 | mask_size_2 & mask_eq_7; // @[Misc.scala 214:29]
  wire  mask_eq_8 = mask_eq_3 & mask_nbit_2; // @[Misc.scala 213:27]
  wire  mask_lo_hi_lo = mask_acc_3 | mask_size_2 & mask_eq_8; // @[Misc.scala 214:29]
  wire  mask_eq_9 = mask_eq_3 & mask_bit_2; // @[Misc.scala 213:27]
  wire  mask_lo_hi_hi = mask_acc_3 | mask_size_2 & mask_eq_9; // @[Misc.scala 214:29]
  wire  mask_eq_10 = mask_eq_4 & mask_nbit_2; // @[Misc.scala 213:27]
  wire  mask_hi_lo_lo = mask_acc_4 | mask_size_2 & mask_eq_10; // @[Misc.scala 214:29]
  wire  mask_eq_11 = mask_eq_4 & mask_bit_2; // @[Misc.scala 213:27]
  wire  mask_hi_lo_hi = mask_acc_4 | mask_size_2 & mask_eq_11; // @[Misc.scala 214:29]
  wire  mask_eq_12 = mask_eq_5 & mask_nbit_2; // @[Misc.scala 213:27]
  wire  mask_hi_hi_lo = mask_acc_5 | mask_size_2 & mask_eq_12; // @[Misc.scala 214:29]
  wire  mask_eq_13 = mask_eq_5 & mask_bit_2; // @[Misc.scala 213:27]
  wire  mask_hi_hi_hi = mask_acc_5 | mask_size_2 & mask_eq_13; // @[Misc.scala 214:29]
  wire [7:0] mask = {mask_hi_hi_hi,mask_hi_hi_lo,mask_hi_lo_hi,mask_hi_lo_lo,mask_lo_hi_hi,mask_lo_hi_lo,mask_lo_lo_hi,
    mask_lo_lo_lo}; // @[Cat.scala 30:58]
  wire [32:0] _T_12 = {1'b0,$signed(io_in_a_bits_address)}; // @[Parameters.scala 137:49]
  wire  _T_38 = io_in_a_bits_opcode == 3'h6; // @[Monitor.scala 81:25]
  wire  _T_40 = io_in_a_bits_size <= 4'hc; // @[Parameters.scala 92:42]
  wire  _T_52 = _T_40 & source_ok; // @[Parameters.scala 1160:30]
  wire [32:0] _T_58 = $signed(_T_12) & -33'sh5000; // @[Parameters.scala 137:52]
  wire  _T_59 = $signed(_T_58) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _T_60 = io_in_a_bits_address ^ 32'h3000; // @[Parameters.scala 137:31]
  wire [32:0] _T_61 = {1'b0,$signed(_T_60)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_63 = $signed(_T_61) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _T_64 = $signed(_T_63) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _T_65 = io_in_a_bits_address ^ 32'h10000; // @[Parameters.scala 137:31]
  wire [32:0] _T_66 = {1'b0,$signed(_T_65)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_68 = $signed(_T_66) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _T_69 = $signed(_T_68) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _T_70 = io_in_a_bits_address ^ 32'h100000; // @[Parameters.scala 137:31]
  wire [32:0] _T_71 = {1'b0,$signed(_T_70)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_73 = $signed(_T_71) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _T_74 = $signed(_T_73) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _T_75 = io_in_a_bits_address ^ 32'h2000000; // @[Parameters.scala 137:31]
  wire [32:0] _T_76 = {1'b0,$signed(_T_75)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_78 = $signed(_T_76) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _T_79 = $signed(_T_78) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _T_80 = io_in_a_bits_address ^ 32'hc000000; // @[Parameters.scala 137:31]
  wire [32:0] _T_81 = {1'b0,$signed(_T_80)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_83 = $signed(_T_81) & -33'sh4000000; // @[Parameters.scala 137:52]
  wire  _T_84 = $signed(_T_83) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _T_85 = io_in_a_bits_address ^ 32'h54000000; // @[Parameters.scala 137:31]
  wire [32:0] _T_86 = {1'b0,$signed(_T_85)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_88 = $signed(_T_86) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _T_89 = $signed(_T_88) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _T_98 = io_in_a_bits_size <= 4'h6; // @[Parameters.scala 92:42]
  wire [31:0] _T_101 = io_in_a_bits_address ^ 32'h20000; // @[Parameters.scala 137:31]
  wire [32:0] _T_102 = {1'b0,$signed(_T_101)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_104 = $signed(_T_102) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _T_105 = $signed(_T_104) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _T_106 = io_in_a_bits_address ^ 32'h10000000; // @[Parameters.scala 137:31]
  wire [32:0] _T_107 = {1'b0,$signed(_T_106)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_109 = $signed(_T_107) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _T_110 = $signed(_T_109) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _T_111 = io_in_a_bits_address ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _T_112 = {1'b0,$signed(_T_111)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_114 = $signed(_T_112) & -33'sh10000000; // @[Parameters.scala 137:52]
  wire  _T_115 = $signed(_T_114) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _T_117 = _T_105 | _T_110 | _T_115; // @[Parameters.scala 671:42]
  wire  _T_118 = _T_98 & _T_117; // @[Parameters.scala 670:56]
  wire  _T_121 = _T_52 & _T_118; // @[Monitor.scala 82:72]
  wire  _T_133 = 4'h6 == io_in_a_bits_size; // @[Parameters.scala 91:48]
  wire  _T_134 = _source_ok_T_5 & _T_133; // @[Mux.scala 27:72]
  wire  _T_201 = _T_59 | _T_64 | _T_69 | _T_105 | _T_74 | _T_79 | _T_84 | _T_110 | _T_89 | _T_115; // @[Parameters.scala 671:42]
  wire  _T_202 = _T_40 & _T_201; // @[Parameters.scala 670:56]
  wire  _T_204 = _T_134 & _T_202; // @[Monitor.scala 83:78]
  wire  _T_218 = io_in_a_bits_param <= 3'h2; // @[Bundles.scala 108:27]
  wire [7:0] _T_222 = ~io_in_a_bits_mask; // @[Monitor.scala 88:18]
  wire  _T_223 = _T_222 == 8'h0; // @[Monitor.scala 88:31]
  wire  _T_227 = ~io_in_a_bits_corrupt; // @[Monitor.scala 89:18]
  wire  _T_231 = io_in_a_bits_opcode == 3'h7; // @[Monitor.scala 92:25]
  wire  _T_415 = io_in_a_bits_param != 3'h0; // @[Monitor.scala 99:31]
  wire  _T_428 = io_in_a_bits_opcode == 3'h4; // @[Monitor.scala 104:25]
  wire  _T_456 = _T_40 & _T_64; // @[Parameters.scala 670:56]
  wire  _T_513 = _T_59 | _T_69 | _T_105 | _T_74 | _T_79 | _T_84 | _T_110 | _T_89 | _T_115; // @[Parameters.scala 671:42]
  wire  _T_514 = _T_98 & _T_513; // @[Parameters.scala 670:56]
  wire  _T_516 = _T_456 | _T_514; // @[Parameters.scala 672:30]
  wire  _T_526 = io_in_a_bits_param == 3'h0; // @[Monitor.scala 109:31]
  wire  _T_530 = io_in_a_bits_mask == mask; // @[Monitor.scala 110:30]
  wire  _T_538 = io_in_a_bits_opcode == 3'h0; // @[Monitor.scala 114:25]
  wire  _T_608 = _T_59 | _T_74 | _T_79 | _T_84 | _T_110 | _T_89 | _T_115; // @[Parameters.scala 671:42]
  wire  _T_609 = _T_98 & _T_608; // @[Parameters.scala 670:56]
  wire  _T_624 = _T_456 | _T_609; // @[Parameters.scala 672:30]
  wire  _T_626 = _T_52 & _T_624; // @[Monitor.scala 115:71]
  wire  _T_644 = io_in_a_bits_opcode == 3'h1; // @[Monitor.scala 122:25]
  wire [7:0] _T_746 = ~mask; // @[Monitor.scala 127:33]
  wire [7:0] _T_747 = io_in_a_bits_mask & _T_746; // @[Monitor.scala 127:31]
  wire  _T_748 = _T_747 == 8'h0; // @[Monitor.scala 127:40]
  wire  _T_752 = io_in_a_bits_opcode == 3'h2; // @[Monitor.scala 130:25]
  wire  _T_769 = io_in_a_bits_size <= 4'h3; // @[Parameters.scala 92:42]
  wire  _T_806 = _T_59 | _T_64 | _T_74 | _T_79 | _T_84 | _T_89; // @[Parameters.scala 671:42]
  wire  _T_807 = _T_769 & _T_806; // @[Parameters.scala 670:56]
  wire  _T_835 = _T_52 & _T_807; // @[Monitor.scala 131:74]
  wire  _T_845 = io_in_a_bits_param <= 3'h4; // @[Bundles.scala 138:33]
  wire  _T_853 = io_in_a_bits_opcode == 3'h3; // @[Monitor.scala 138:25]
  wire  _T_946 = io_in_a_bits_param <= 3'h3; // @[Bundles.scala 145:30]
  wire  _T_954 = io_in_a_bits_opcode == 3'h5; // @[Monitor.scala 146:25]
  wire  _T_1037 = _T_52 & _T_456; // @[Monitor.scala 147:68]
  wire  _T_1047 = io_in_a_bits_param <= 3'h1; // @[Bundles.scala 158:28]
  wire  _T_1059 = io_in_d_bits_opcode <= 3'h6; // @[Bundles.scala 42:24]
  wire [1:0] source_ok_uncommonBits_1 = io_in_d_bits_source[1:0]; // @[Parameters.scala 52:64]
  wire  _source_ok_T_10 = ~io_in_d_bits_source[2]; // @[Parameters.scala 54:32]
  wire  _source_ok_T_13 = source_ok_uncommonBits_1 <= 2'h2; // @[Parameters.scala 57:20]
  wire  _source_ok_T_14 = _source_ok_T_10 & _source_ok_T_13; // @[Parameters.scala 56:50]
  wire  _source_ok_T_15 = io_in_d_bits_source == 3'h3; // @[Parameters.scala 46:9]
  wire  _source_ok_T_16 = io_in_d_bits_source == 3'h4; // @[Parameters.scala 46:9]
  wire  source_ok_1 = _source_ok_T_14 | _source_ok_T_15 | _source_ok_T_16; // @[Parameters.scala 1125:46]
  wire  _T_1063 = io_in_d_bits_opcode == 3'h6; // @[Monitor.scala 310:25]
  wire  _T_1067 = io_in_d_bits_size >= 4'h3; // @[Monitor.scala 312:27]
  wire  _T_1071 = io_in_d_bits_param == 2'h0; // @[Monitor.scala 313:28]
  wire  _T_1075 = ~io_in_d_bits_corrupt; // @[Monitor.scala 314:15]
  wire  _T_1079 = ~io_in_d_bits_denied; // @[Monitor.scala 315:15]
  wire  _T_1083 = io_in_d_bits_opcode == 3'h4; // @[Monitor.scala 318:25]
  wire  _T_1094 = io_in_d_bits_param <= 2'h2; // @[Bundles.scala 102:26]
  wire  _T_1098 = io_in_d_bits_param != 2'h2; // @[Monitor.scala 323:28]
  wire  _T_1111 = io_in_d_bits_opcode == 3'h5; // @[Monitor.scala 328:25]
  wire  _T_1131 = _T_1079 | io_in_d_bits_corrupt; // @[Monitor.scala 334:30]
  wire  _T_1140 = io_in_d_bits_opcode == 3'h0; // @[Monitor.scala 338:25]
  wire  _T_1157 = io_in_d_bits_opcode == 3'h1; // @[Monitor.scala 346:25]
  wire  _T_1175 = io_in_d_bits_opcode == 3'h2; // @[Monitor.scala 354:25]
  wire  _T_1192 = io_in_b_bits_opcode <= 3'h6; // @[Bundles.scala 40:24]
  wire [1:0] uncommonBits_11 = io_in_b_bits_source[1:0]; // @[Parameters.scala 52:64]
  wire  _T_1197 = ~io_in_b_bits_source[2]; // @[Parameters.scala 54:32]
  wire  _T_1200 = uncommonBits_11 <= 2'h2; // @[Parameters.scala 57:20]
  wire  _T_1201 = _T_1197 & _T_1200; // @[Parameters.scala 56:50]
  wire [32:0] _T_1204 = {1'b0,$signed(io_in_b_bits_address)}; // @[Parameters.scala 137:49]
  wire  _T_1209 = io_in_b_bits_source == 3'h3; // @[Parameters.scala 46:9]
  wire  _T_1217 = io_in_b_bits_source == 3'h4; // @[Parameters.scala 46:9]
  wire [31:0] _address_ok_T = io_in_b_bits_address ^ 32'h3000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_1 = {1'b0,$signed(_address_ok_T)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_3 = $signed(_address_ok_T_1) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_4 = $signed(_address_ok_T_3) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_5 = io_in_b_bits_address ^ 32'h4000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_6 = {1'b0,$signed(_address_ok_T_5)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_8 = $signed(_address_ok_T_6) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_9 = $signed(_address_ok_T_8) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_10 = io_in_b_bits_address ^ 32'h54000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_11 = {1'b0,$signed(_address_ok_T_10)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_13 = $signed(_address_ok_T_11) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_14 = $signed(_address_ok_T_13) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_15 = io_in_b_bits_address ^ 32'h100000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_16 = {1'b0,$signed(_address_ok_T_15)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_18 = $signed(_address_ok_T_16) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_19 = $signed(_address_ok_T_18) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_20 = io_in_b_bits_address ^ 32'hc000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_21 = {1'b0,$signed(_address_ok_T_20)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_23 = $signed(_address_ok_T_21) & -33'sh4000000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_24 = $signed(_address_ok_T_23) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_25 = io_in_b_bits_address ^ 32'h2000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_26 = {1'b0,$signed(_address_ok_T_25)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_28 = $signed(_address_ok_T_26) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_29 = $signed(_address_ok_T_28) == 33'sh0; // @[Parameters.scala 137:67]
  wire [32:0] _address_ok_T_33 = $signed(_T_1204) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_34 = $signed(_address_ok_T_33) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_35 = io_in_b_bits_address ^ 32'h10000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_36 = {1'b0,$signed(_address_ok_T_35)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_38 = $signed(_address_ok_T_36) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_39 = $signed(_address_ok_T_38) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_40 = io_in_b_bits_address ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_41 = {1'b0,$signed(_address_ok_T_40)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_43 = $signed(_address_ok_T_41) & -33'sh10000000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_44 = $signed(_address_ok_T_43) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_45 = io_in_b_bits_address ^ 32'h10000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_46 = {1'b0,$signed(_address_ok_T_45)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_48 = $signed(_address_ok_T_46) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_49 = $signed(_address_ok_T_48) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_50 = io_in_b_bits_address ^ 32'h20000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_51 = {1'b0,$signed(_address_ok_T_50)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_53 = $signed(_address_ok_T_51) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_54 = $signed(_address_ok_T_53) == 33'sh0; // @[Parameters.scala 137:67]
  wire  address_ok = _address_ok_T_4 | _address_ok_T_9 | _address_ok_T_14 | _address_ok_T_19 | _address_ok_T_24 |
    _address_ok_T_29 | _address_ok_T_34 | _address_ok_T_39 | _address_ok_T_44 | _address_ok_T_49 | _address_ok_T_54; // @[Parameters.scala 622:64]
  wire [26:0] _is_aligned_mask_T_4 = 27'hfff << io_in_b_bits_size; // @[package.scala 234:77]
  wire [11:0] is_aligned_mask_1 = ~_is_aligned_mask_T_4[11:0]; // @[package.scala 234:46]
  wire [31:0] _GEN_87 = {{20'd0}, is_aligned_mask_1}; // @[Edges.scala 20:16]
  wire [31:0] _is_aligned_T_1 = io_in_b_bits_address & _GEN_87; // @[Edges.scala 20:16]
  wire  is_aligned_1 = _is_aligned_T_1 == 32'h0; // @[Edges.scala 20:24]
  wire [1:0] mask_sizeOH_shiftAmount_1 = io_in_b_bits_size[1:0]; // @[OneHot.scala 64:49]
  wire [3:0] _mask_sizeOH_T_4 = 4'h1 << mask_sizeOH_shiftAmount_1; // @[OneHot.scala 65:12]
  wire [2:0] mask_sizeOH_1 = _mask_sizeOH_T_4[2:0] | 3'h1; // @[Misc.scala 201:81]
  wire  _mask_T_1 = io_in_b_bits_size >= 4'h3; // @[Misc.scala 205:21]
  wire  mask_size_3 = mask_sizeOH_1[2]; // @[Misc.scala 208:26]
  wire  mask_bit_3 = io_in_b_bits_address[2]; // @[Misc.scala 209:26]
  wire  mask_nbit_3 = ~mask_bit_3; // @[Misc.scala 210:20]
  wire  mask_acc_6 = _mask_T_1 | mask_size_3 & mask_nbit_3; // @[Misc.scala 214:29]
  wire  mask_acc_7 = _mask_T_1 | mask_size_3 & mask_bit_3; // @[Misc.scala 214:29]
  wire  mask_size_4 = mask_sizeOH_1[1]; // @[Misc.scala 208:26]
  wire  mask_bit_4 = io_in_b_bits_address[1]; // @[Misc.scala 209:26]
  wire  mask_nbit_4 = ~mask_bit_4; // @[Misc.scala 210:20]
  wire  mask_eq_16 = mask_nbit_3 & mask_nbit_4; // @[Misc.scala 213:27]
  wire  mask_acc_8 = mask_acc_6 | mask_size_4 & mask_eq_16; // @[Misc.scala 214:29]
  wire  mask_eq_17 = mask_nbit_3 & mask_bit_4; // @[Misc.scala 213:27]
  wire  mask_acc_9 = mask_acc_6 | mask_size_4 & mask_eq_17; // @[Misc.scala 214:29]
  wire  mask_eq_18 = mask_bit_3 & mask_nbit_4; // @[Misc.scala 213:27]
  wire  mask_acc_10 = mask_acc_7 | mask_size_4 & mask_eq_18; // @[Misc.scala 214:29]
  wire  mask_eq_19 = mask_bit_3 & mask_bit_4; // @[Misc.scala 213:27]
  wire  mask_acc_11 = mask_acc_7 | mask_size_4 & mask_eq_19; // @[Misc.scala 214:29]
  wire  mask_size_5 = mask_sizeOH_1[0]; // @[Misc.scala 208:26]
  wire  mask_bit_5 = io_in_b_bits_address[0]; // @[Misc.scala 209:26]
  wire  mask_nbit_5 = ~mask_bit_5; // @[Misc.scala 210:20]
  wire  mask_eq_20 = mask_eq_16 & mask_nbit_5; // @[Misc.scala 213:27]
  wire  mask_lo_lo_lo_1 = mask_acc_8 | mask_size_5 & mask_eq_20; // @[Misc.scala 214:29]
  wire  mask_eq_21 = mask_eq_16 & mask_bit_5; // @[Misc.scala 213:27]
  wire  mask_lo_lo_hi_1 = mask_acc_8 | mask_size_5 & mask_eq_21; // @[Misc.scala 214:29]
  wire  mask_eq_22 = mask_eq_17 & mask_nbit_5; // @[Misc.scala 213:27]
  wire  mask_lo_hi_lo_1 = mask_acc_9 | mask_size_5 & mask_eq_22; // @[Misc.scala 214:29]
  wire  mask_eq_23 = mask_eq_17 & mask_bit_5; // @[Misc.scala 213:27]
  wire  mask_lo_hi_hi_1 = mask_acc_9 | mask_size_5 & mask_eq_23; // @[Misc.scala 214:29]
  wire  mask_eq_24 = mask_eq_18 & mask_nbit_5; // @[Misc.scala 213:27]
  wire  mask_hi_lo_lo_1 = mask_acc_10 | mask_size_5 & mask_eq_24; // @[Misc.scala 214:29]
  wire  mask_eq_25 = mask_eq_18 & mask_bit_5; // @[Misc.scala 213:27]
  wire  mask_hi_lo_hi_1 = mask_acc_10 | mask_size_5 & mask_eq_25; // @[Misc.scala 214:29]
  wire  mask_eq_26 = mask_eq_19 & mask_nbit_5; // @[Misc.scala 213:27]
  wire  mask_hi_hi_lo_1 = mask_acc_11 | mask_size_5 & mask_eq_26; // @[Misc.scala 214:29]
  wire  mask_eq_27 = mask_eq_19 & mask_bit_5; // @[Misc.scala 213:27]
  wire  mask_hi_hi_hi_1 = mask_acc_11 | mask_size_5 & mask_eq_27; // @[Misc.scala 214:29]
  wire [7:0] mask_1 = {mask_hi_hi_hi_1,mask_hi_hi_lo_1,mask_hi_lo_hi_1,mask_hi_lo_lo_1,mask_lo_hi_hi_1,mask_lo_hi_lo_1,
    mask_lo_lo_hi_1,mask_lo_lo_lo_1}; // @[Cat.scala 30:58]
  wire [1:0] _legal_source_T_9 = _T_1209 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _legal_source_T_10 = _T_1217 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _GEN_88 = {{1'd0}, _legal_source_T_9}; // @[Mux.scala 27:72]
  wire [2:0] _legal_source_T_12 = _GEN_88 | _legal_source_T_10; // @[Mux.scala 27:72]
  wire  legal_source = _legal_source_T_12 == io_in_b_bits_source; // @[Monitor.scala 165:113]
  wire  _T_1230 = io_in_b_bits_opcode == 3'h6; // @[Monitor.scala 167:25]
  wire  _T_1239 = 4'h6 == io_in_b_bits_size; // @[Parameters.scala 91:48]
  wire  _T_1240 = _T_1201 & _T_1239; // @[Mux.scala 27:72]
  wire  _T_1246 = io_in_b_bits_size <= 4'hc; // @[Parameters.scala 92:42]
  wire [32:0] _T_1252 = $signed(_T_1204) & -33'sh5000; // @[Parameters.scala 137:52]
  wire  _T_1253 = $signed(_T_1252) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _T_1307 = _T_1253 | _address_ok_T_4 | _address_ok_T_39 | _address_ok_T_54 | _address_ok_T_19 | _address_ok_T_29
     | _address_ok_T_24 | _address_ok_T_49 | _address_ok_T_14 | _address_ok_T_44; // @[Parameters.scala 671:42]
  wire  _T_1308 = _T_1246 & _T_1307; // @[Parameters.scala 670:56]
  wire  _T_1310 = _T_1240 & _T_1308; // @[Monitor.scala 168:75]
  wire  _T_1316 = ~(address_ok | reset); // @[Monitor.scala 49:11]
  wire  _T_1319 = ~(legal_source | reset); // @[Monitor.scala 49:11]
  wire  _T_1322 = ~(is_aligned_1 | reset); // @[Monitor.scala 49:11]
  wire  _T_1323 = io_in_b_bits_param <= 2'h2; // @[Bundles.scala 102:26]
  wire  _T_1327 = io_in_b_bits_mask == mask_1; // @[Monitor.scala 173:27]
  wire  _T_1330 = ~(_T_1327 | reset); // @[Monitor.scala 49:11]
  wire  _T_1331 = ~io_in_b_bits_corrupt; // @[Monitor.scala 174:15]
  wire  _T_1334 = ~(_T_1331 | reset); // @[Monitor.scala 49:11]
  wire  _T_1335 = io_in_b_bits_opcode == 3'h4; // @[Monitor.scala 177:25]
  wire  _T_1414 = io_in_b_bits_param == 2'h0; // @[Monitor.scala 182:31]
  wire  _T_1426 = io_in_b_bits_opcode == 3'h0; // @[Monitor.scala 187:25]
  wire  _T_1513 = io_in_b_bits_opcode == 3'h1; // @[Monitor.scala 196:25]
  wire [7:0] _T_1596 = ~mask_1; // @[Monitor.scala 202:33]
  wire [7:0] _T_1597 = io_in_b_bits_mask & _T_1596; // @[Monitor.scala 202:31]
  wire  _T_1598 = _T_1597 == 8'h0; // @[Monitor.scala 202:40]
  wire  _T_1602 = io_in_b_bits_opcode == 3'h2; // @[Monitor.scala 205:25]
  wire  _T_1689 = io_in_b_bits_opcode == 3'h3; // @[Monitor.scala 214:25]
  wire  _T_1776 = io_in_b_bits_opcode == 3'h5; // @[Monitor.scala 223:25]
  wire [1:0] source_ok_uncommonBits_2 = io_in_c_bits_source[1:0]; // @[Parameters.scala 52:64]
  wire  _source_ok_T_19 = ~io_in_c_bits_source[2]; // @[Parameters.scala 54:32]
  wire  _source_ok_T_22 = source_ok_uncommonBits_2 <= 2'h2; // @[Parameters.scala 57:20]
  wire  _source_ok_T_23 = _source_ok_T_19 & _source_ok_T_22; // @[Parameters.scala 56:50]
  wire  _source_ok_T_24 = io_in_c_bits_source == 3'h3; // @[Parameters.scala 46:9]
  wire  _source_ok_T_25 = io_in_c_bits_source == 3'h4; // @[Parameters.scala 46:9]
  wire  source_ok_2 = _source_ok_T_23 | _source_ok_T_24 | _source_ok_T_25; // @[Parameters.scala 1125:46]
  wire [26:0] _is_aligned_mask_T_7 = 27'hfff << io_in_c_bits_size; // @[package.scala 234:77]
  wire [11:0] is_aligned_mask_2 = ~_is_aligned_mask_T_7[11:0]; // @[package.scala 234:46]
  wire [31:0] _GEN_89 = {{20'd0}, is_aligned_mask_2}; // @[Edges.scala 20:16]
  wire [31:0] _is_aligned_T_2 = io_in_c_bits_address & _GEN_89; // @[Edges.scala 20:16]
  wire  is_aligned_2 = _is_aligned_T_2 == 32'h0; // @[Edges.scala 20:24]
  wire [31:0] _address_ok_T_64 = io_in_c_bits_address ^ 32'h3000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_65 = {1'b0,$signed(_address_ok_T_64)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_67 = $signed(_address_ok_T_65) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_68 = $signed(_address_ok_T_67) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_69 = io_in_c_bits_address ^ 32'h4000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_70 = {1'b0,$signed(_address_ok_T_69)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_72 = $signed(_address_ok_T_70) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_73 = $signed(_address_ok_T_72) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_74 = io_in_c_bits_address ^ 32'h54000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_75 = {1'b0,$signed(_address_ok_T_74)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_77 = $signed(_address_ok_T_75) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_78 = $signed(_address_ok_T_77) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_79 = io_in_c_bits_address ^ 32'h100000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_80 = {1'b0,$signed(_address_ok_T_79)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_82 = $signed(_address_ok_T_80) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_83 = $signed(_address_ok_T_82) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_84 = io_in_c_bits_address ^ 32'hc000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_85 = {1'b0,$signed(_address_ok_T_84)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_87 = $signed(_address_ok_T_85) & -33'sh4000000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_88 = $signed(_address_ok_T_87) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_89 = io_in_c_bits_address ^ 32'h2000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_90 = {1'b0,$signed(_address_ok_T_89)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_92 = $signed(_address_ok_T_90) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_93 = $signed(_address_ok_T_92) == 33'sh0; // @[Parameters.scala 137:67]
  wire [32:0] _address_ok_T_95 = {1'b0,$signed(io_in_c_bits_address)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_97 = $signed(_address_ok_T_95) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_98 = $signed(_address_ok_T_97) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_99 = io_in_c_bits_address ^ 32'h10000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_100 = {1'b0,$signed(_address_ok_T_99)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_102 = $signed(_address_ok_T_100) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_103 = $signed(_address_ok_T_102) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_104 = io_in_c_bits_address ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_105 = {1'b0,$signed(_address_ok_T_104)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_107 = $signed(_address_ok_T_105) & -33'sh10000000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_108 = $signed(_address_ok_T_107) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_109 = io_in_c_bits_address ^ 32'h10000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_110 = {1'b0,$signed(_address_ok_T_109)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_112 = $signed(_address_ok_T_110) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_113 = $signed(_address_ok_T_112) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_114 = io_in_c_bits_address ^ 32'h20000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_115 = {1'b0,$signed(_address_ok_T_114)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_117 = $signed(_address_ok_T_115) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_118 = $signed(_address_ok_T_117) == 33'sh0; // @[Parameters.scala 137:67]
  wire  address_ok_1 = _address_ok_T_68 | _address_ok_T_73 | _address_ok_T_78 | _address_ok_T_83 | _address_ok_T_88 |
    _address_ok_T_93 | _address_ok_T_98 | _address_ok_T_103 | _address_ok_T_108 | _address_ok_T_113 | _address_ok_T_118; // @[Parameters.scala 622:64]
  wire  _T_1901 = io_in_c_bits_opcode == 3'h4; // @[Monitor.scala 242:25]
  wire  _T_1908 = io_in_c_bits_size >= 4'h3; // @[Monitor.scala 245:30]
  wire  _T_1915 = io_in_c_bits_param <= 3'h5; // @[Bundles.scala 120:29]
  wire  _T_1919 = ~io_in_c_bits_corrupt; // @[Monitor.scala 248:18]
  wire  _T_1923 = io_in_c_bits_opcode == 3'h5; // @[Monitor.scala 251:25]
  wire  _T_1941 = io_in_c_bits_opcode == 3'h6; // @[Monitor.scala 259:25]
  wire  _T_1943 = io_in_c_bits_size <= 4'hc; // @[Parameters.scala 92:42]
  wire  _T_1955 = _T_1943 & source_ok_2; // @[Parameters.scala 1160:30]
  wire [32:0] _T_1961 = $signed(_address_ok_T_95) & -33'sh5000; // @[Parameters.scala 137:52]
  wire  _T_1962 = $signed(_T_1961) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _T_2001 = io_in_c_bits_size <= 4'h6; // @[Parameters.scala 92:42]
  wire  _T_2020 = _address_ok_T_118 | _address_ok_T_113 | _address_ok_T_108; // @[Parameters.scala 671:42]
  wire  _T_2021 = _T_2001 & _T_2020; // @[Parameters.scala 670:56]
  wire  _T_2024 = _T_1955 & _T_2021; // @[Monitor.scala 260:78]
  wire  _T_2036 = 4'h6 == io_in_c_bits_size; // @[Parameters.scala 91:48]
  wire  _T_2037 = _source_ok_T_23 & _T_2036; // @[Mux.scala 27:72]
  wire  _T_2104 = _T_1962 | _address_ok_T_68 | _address_ok_T_103 | _address_ok_T_118 | _address_ok_T_83 |
    _address_ok_T_93 | _address_ok_T_88 | _address_ok_T_113 | _address_ok_T_78 | _address_ok_T_108; // @[Parameters.scala 671:42]
  wire  _T_2105 = _T_1943 & _T_2104; // @[Parameters.scala 670:56]
  wire  _T_2107 = _T_2037 & _T_2105; // @[Monitor.scala 261:78]
  wire  _T_2129 = io_in_c_bits_opcode == 3'h7; // @[Monitor.scala 269:25]
  wire  _T_2313 = io_in_c_bits_opcode == 3'h0; // @[Monitor.scala 278:25]
  wire  _T_2323 = io_in_c_bits_param == 3'h0; // @[Monitor.scala 282:31]
  wire  _T_2331 = io_in_c_bits_opcode == 3'h1; // @[Monitor.scala 286:25]
  wire  _T_2345 = io_in_c_bits_opcode == 3'h2; // @[Monitor.scala 293:25]
  wire  _a_first_T = io_in_a_ready & io_in_a_valid; // @[Decoupled.scala 40:37]
  wire [8:0] a_first_beats1_decode = is_aligned_mask[11:3]; // @[Edges.scala 219:59]
  wire  a_first_beats1_opdata = ~io_in_a_bits_opcode[2]; // @[Edges.scala 91:28]
  reg [8:0] a_first_counter; // @[Edges.scala 228:27]
  wire [8:0] a_first_counter1 = a_first_counter - 9'h1; // @[Edges.scala 229:28]
  wire  a_first = a_first_counter == 9'h0; // @[Edges.scala 230:25]
  reg [2:0] opcode; // @[Monitor.scala 384:22]
  reg [2:0] param; // @[Monitor.scala 385:22]
  reg [3:0] size; // @[Monitor.scala 386:22]
  reg [2:0] source; // @[Monitor.scala 387:22]
  reg [31:0] address; // @[Monitor.scala 388:22]
  wire  _T_2367 = io_in_a_valid & ~a_first; // @[Monitor.scala 389:19]
  wire  _T_2368 = io_in_a_bits_opcode == opcode; // @[Monitor.scala 390:32]
  wire  _T_2372 = io_in_a_bits_param == param; // @[Monitor.scala 391:32]
  wire  _T_2376 = io_in_a_bits_size == size; // @[Monitor.scala 392:32]
  wire  _T_2380 = io_in_a_bits_source == source; // @[Monitor.scala 393:32]
  wire  _T_2384 = io_in_a_bits_address == address; // @[Monitor.scala 394:32]
  wire  _d_first_T = io_in_d_ready & io_in_d_valid; // @[Decoupled.scala 40:37]
  wire [26:0] _d_first_beats1_decode_T_1 = 27'hfff << io_in_d_bits_size; // @[package.scala 234:77]
  wire [11:0] _d_first_beats1_decode_T_3 = ~_d_first_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] d_first_beats1_decode = _d_first_beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  d_first_beats1_opdata = io_in_d_bits_opcode[0]; // @[Edges.scala 105:36]
  reg [8:0] d_first_counter; // @[Edges.scala 228:27]
  wire [8:0] d_first_counter1 = d_first_counter - 9'h1; // @[Edges.scala 229:28]
  wire  d_first = d_first_counter == 9'h0; // @[Edges.scala 230:25]
  reg [2:0] opcode_1; // @[Monitor.scala 535:22]
  reg [1:0] param_1; // @[Monitor.scala 536:22]
  reg [3:0] size_1; // @[Monitor.scala 537:22]
  reg [2:0] source_1; // @[Monitor.scala 538:22]
  reg [1:0] sink; // @[Monitor.scala 539:22]
  reg  denied; // @[Monitor.scala 540:22]
  wire  _T_2391 = io_in_d_valid & ~d_first; // @[Monitor.scala 541:19]
  wire  _T_2392 = io_in_d_bits_opcode == opcode_1; // @[Monitor.scala 542:29]
  wire  _T_2396 = io_in_d_bits_param == param_1; // @[Monitor.scala 543:29]
  wire  _T_2400 = io_in_d_bits_size == size_1; // @[Monitor.scala 544:29]
  wire  _T_2404 = io_in_d_bits_source == source_1; // @[Monitor.scala 545:29]
  wire  _T_2408 = io_in_d_bits_sink == sink; // @[Monitor.scala 546:29]
  wire  _T_2412 = io_in_d_bits_denied == denied; // @[Monitor.scala 547:29]
  wire  b_first_done = io_in_b_ready & io_in_b_valid; // @[Decoupled.scala 40:37]
  reg [8:0] b_first_counter; // @[Edges.scala 228:27]
  wire [8:0] b_first_counter1 = b_first_counter - 9'h1; // @[Edges.scala 229:28]
  wire  b_first = b_first_counter == 9'h0; // @[Edges.scala 230:25]
  reg [2:0] opcode_2; // @[Monitor.scala 407:22]
  reg [1:0] param_2; // @[Monitor.scala 408:22]
  reg [3:0] size_2; // @[Monitor.scala 409:22]
  reg [2:0] source_2; // @[Monitor.scala 410:22]
  reg [31:0] address_1; // @[Monitor.scala 411:22]
  wire  _T_2419 = io_in_b_valid & ~b_first; // @[Monitor.scala 412:19]
  wire  _T_2420 = io_in_b_bits_opcode == opcode_2; // @[Monitor.scala 413:32]
  wire  _T_2424 = io_in_b_bits_param == param_2; // @[Monitor.scala 414:32]
  wire  _T_2428 = io_in_b_bits_size == size_2; // @[Monitor.scala 415:32]
  wire  _T_2432 = io_in_b_bits_source == source_2; // @[Monitor.scala 416:32]
  wire  _T_2436 = io_in_b_bits_address == address_1; // @[Monitor.scala 417:32]
  wire  _c_first_T = io_in_c_ready & io_in_c_valid; // @[Decoupled.scala 40:37]
  wire [8:0] c_first_beats1_decode = is_aligned_mask_2[11:3]; // @[Edges.scala 219:59]
  wire  c_first_beats1_opdata = io_in_c_bits_opcode[0]; // @[Edges.scala 101:36]
  reg [8:0] c_first_counter; // @[Edges.scala 228:27]
  wire [8:0] c_first_counter1 = c_first_counter - 9'h1; // @[Edges.scala 229:28]
  wire  c_first = c_first_counter == 9'h0; // @[Edges.scala 230:25]
  reg [2:0] opcode_3; // @[Monitor.scala 512:22]
  reg [2:0] param_3; // @[Monitor.scala 513:22]
  reg [3:0] size_3; // @[Monitor.scala 514:22]
  reg [2:0] source_3; // @[Monitor.scala 515:22]
  reg [31:0] address_2; // @[Monitor.scala 516:22]
  wire  _T_2443 = io_in_c_valid & ~c_first; // @[Monitor.scala 517:19]
  wire  _T_2444 = io_in_c_bits_opcode == opcode_3; // @[Monitor.scala 518:32]
  wire  _T_2448 = io_in_c_bits_param == param_3; // @[Monitor.scala 519:32]
  wire  _T_2452 = io_in_c_bits_size == size_3; // @[Monitor.scala 520:32]
  wire  _T_2456 = io_in_c_bits_source == source_3; // @[Monitor.scala 521:32]
  wire  _T_2460 = io_in_c_bits_address == address_2; // @[Monitor.scala 522:32]
  reg [4:0] inflight; // @[Monitor.scala 611:27]
  reg [19:0] inflight_opcodes; // @[Monitor.scala 613:35]
  reg [39:0] inflight_sizes; // @[Monitor.scala 615:33]
  reg [8:0] a_first_counter_1; // @[Edges.scala 228:27]
  wire [8:0] a_first_counter1_1 = a_first_counter_1 - 9'h1; // @[Edges.scala 229:28]
  wire  a_first_1 = a_first_counter_1 == 9'h0; // @[Edges.scala 230:25]
  reg [8:0] d_first_counter_1; // @[Edges.scala 228:27]
  wire [8:0] d_first_counter1_1 = d_first_counter_1 - 9'h1; // @[Edges.scala 229:28]
  wire  d_first_1 = d_first_counter_1 == 9'h0; // @[Edges.scala 230:25]
  wire [4:0] _GEN_90 = {io_in_d_bits_source, 2'h0}; // @[Monitor.scala 634:69]
  wire [5:0] _a_opcode_lookup_T = {{1'd0}, _GEN_90}; // @[Monitor.scala 634:69]
  wire [19:0] _a_opcode_lookup_T_1 = inflight_opcodes >> _a_opcode_lookup_T; // @[Monitor.scala 634:44]
  wire [15:0] _a_opcode_lookup_T_5 = 16'h10 - 16'h1; // @[Monitor.scala 609:57]
  wire [19:0] _GEN_91 = {{4'd0}, _a_opcode_lookup_T_5}; // @[Monitor.scala 634:97]
  wire [19:0] _a_opcode_lookup_T_6 = _a_opcode_lookup_T_1 & _GEN_91; // @[Monitor.scala 634:97]
  wire [19:0] _a_opcode_lookup_T_7 = {{1'd0}, _a_opcode_lookup_T_6[19:1]}; // @[Monitor.scala 634:152]
  wire [5:0] _a_size_lookup_T = {io_in_d_bits_source, 3'h0}; // @[Monitor.scala 638:65]
  wire [39:0] _a_size_lookup_T_1 = inflight_sizes >> _a_size_lookup_T; // @[Monitor.scala 638:40]
  wire [15:0] _a_size_lookup_T_5 = 16'h100 - 16'h1; // @[Monitor.scala 609:57]
  wire [39:0] _GEN_93 = {{24'd0}, _a_size_lookup_T_5}; // @[Monitor.scala 638:91]
  wire [39:0] _a_size_lookup_T_6 = _a_size_lookup_T_1 & _GEN_93; // @[Monitor.scala 638:91]
  wire [39:0] _a_size_lookup_T_7 = {{1'd0}, _a_size_lookup_T_6[39:1]}; // @[Monitor.scala 638:144]
  wire  _T_2466 = io_in_a_valid & a_first_1; // @[Monitor.scala 648:26]
  wire [7:0] _a_set_wo_ready_T = 8'h1 << io_in_a_bits_source; // @[OneHot.scala 58:35]
  wire [7:0] _GEN_27 = io_in_a_valid & a_first_1 ? _a_set_wo_ready_T : 8'h0; // @[Monitor.scala 648:71 Monitor.scala 649:22]
  wire  _T_2469 = _a_first_T & a_first_1; // @[Monitor.scala 652:27]
  wire [3:0] _a_opcodes_set_interm_T = {io_in_a_bits_opcode, 1'h0}; // @[Monitor.scala 654:53]
  wire [3:0] _a_opcodes_set_interm_T_1 = _a_opcodes_set_interm_T | 4'h1; // @[Monitor.scala 654:61]
  wire [4:0] _a_sizes_set_interm_T = {io_in_a_bits_size, 1'h0}; // @[Monitor.scala 655:51]
  wire [4:0] _a_sizes_set_interm_T_1 = _a_sizes_set_interm_T | 5'h1; // @[Monitor.scala 655:59]
  wire [4:0] _GEN_95 = {io_in_a_bits_source, 2'h0}; // @[Monitor.scala 656:79]
  wire [5:0] _a_opcodes_set_T = {{1'd0}, _GEN_95}; // @[Monitor.scala 656:79]
  wire [3:0] a_opcodes_set_interm = _a_first_T & a_first_1 ? _a_opcodes_set_interm_T_1 : 4'h0; // @[Monitor.scala 652:72 Monitor.scala 654:28]
  wire [66:0] _GEN_96 = {{63'd0}, a_opcodes_set_interm}; // @[Monitor.scala 656:54]
  wire [66:0] _a_opcodes_set_T_1 = _GEN_96 << _a_opcodes_set_T; // @[Monitor.scala 656:54]
  wire [5:0] _a_sizes_set_T = {io_in_a_bits_source, 3'h0}; // @[Monitor.scala 657:77]
  wire [4:0] a_sizes_set_interm = _a_first_T & a_first_1 ? _a_sizes_set_interm_T_1 : 5'h0; // @[Monitor.scala 652:72 Monitor.scala 655:28]
  wire [67:0] _GEN_97 = {{63'd0}, a_sizes_set_interm}; // @[Monitor.scala 657:52]
  wire [67:0] _a_sizes_set_T_1 = _GEN_97 << _a_sizes_set_T; // @[Monitor.scala 657:52]
  wire [4:0] _T_2471 = inflight >> io_in_a_bits_source; // @[Monitor.scala 658:26]
  wire  _T_2473 = ~_T_2471[0]; // @[Monitor.scala 658:17]
  wire [7:0] _GEN_28 = _a_first_T & a_first_1 ? _a_set_wo_ready_T : 8'h0; // @[Monitor.scala 652:72 Monitor.scala 653:28]
  wire [66:0] _GEN_31 = _a_first_T & a_first_1 ? _a_opcodes_set_T_1 : 67'h0; // @[Monitor.scala 652:72 Monitor.scala 656:28]
  wire [67:0] _GEN_32 = _a_first_T & a_first_1 ? _a_sizes_set_T_1 : 68'h0; // @[Monitor.scala 652:72 Monitor.scala 657:28]
  wire  _T_2477 = io_in_d_valid & d_first_1; // @[Monitor.scala 671:26]
  wire  _T_2479 = ~_T_1063; // @[Monitor.scala 671:74]
  wire  _T_2480 = io_in_d_valid & d_first_1 & ~_T_1063; // @[Monitor.scala 671:71]
  wire [7:0] _d_clr_wo_ready_T = 8'h1 << io_in_d_bits_source; // @[OneHot.scala 58:35]
  wire [7:0] _GEN_33 = io_in_d_valid & d_first_1 & ~_T_1063 ? _d_clr_wo_ready_T : 8'h0; // @[Monitor.scala 671:90 Monitor.scala 672:22]
  wire [78:0] _GEN_99 = {{63'd0}, _a_opcode_lookup_T_5}; // @[Monitor.scala 677:76]
  wire [78:0] _d_opcodes_clr_T_5 = _GEN_99 << _a_opcode_lookup_T; // @[Monitor.scala 677:76]
  wire [78:0] _GEN_100 = {{63'd0}, _a_size_lookup_T_5}; // @[Monitor.scala 678:74]
  wire [78:0] _d_sizes_clr_T_5 = _GEN_100 << _a_size_lookup_T; // @[Monitor.scala 678:74]
  wire [7:0] _GEN_34 = _d_first_T & d_first_1 & _T_2479 ? _d_clr_wo_ready_T : 8'h0; // @[Monitor.scala 675:91 Monitor.scala 676:21]
  wire [78:0] _GEN_35 = _d_first_T & d_first_1 & _T_2479 ? _d_opcodes_clr_T_5 : 79'h0; // @[Monitor.scala 675:91 Monitor.scala 677:21]
  wire [78:0] _GEN_36 = _d_first_T & d_first_1 & _T_2479 ? _d_sizes_clr_T_5 : 79'h0; // @[Monitor.scala 675:91 Monitor.scala 678:21]
  wire  _same_cycle_resp_T_2 = io_in_a_bits_source == io_in_d_bits_source; // @[Monitor.scala 681:113]
  wire  same_cycle_resp = _T_2466 & io_in_a_bits_source == io_in_d_bits_source; // @[Monitor.scala 681:88]
  wire [4:0] _T_2490 = inflight >> io_in_d_bits_source; // @[Monitor.scala 682:25]
  wire  _T_2492 = _T_2490[0] | same_cycle_resp; // @[Monitor.scala 682:49]
  wire [2:0] _GEN_39 = 3'h2 == io_in_a_bits_opcode ? 3'h1 : 3'h0; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_40 = 3'h3 == io_in_a_bits_opcode ? 3'h1 : _GEN_39; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_41 = 3'h4 == io_in_a_bits_opcode ? 3'h1 : _GEN_40; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_42 = 3'h5 == io_in_a_bits_opcode ? 3'h2 : _GEN_41; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_43 = 3'h6 == io_in_a_bits_opcode ? 3'h4 : _GEN_42; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_44 = 3'h7 == io_in_a_bits_opcode ? 3'h4 : _GEN_43; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_51 = 3'h6 == io_in_a_bits_opcode ? 3'h5 : _GEN_42; // @[Monitor.scala 686:39 Monitor.scala 686:39]
  wire [2:0] _GEN_52 = 3'h7 == io_in_a_bits_opcode ? 3'h4 : _GEN_51; // @[Monitor.scala 686:39 Monitor.scala 686:39]
  wire  _T_2497 = io_in_d_bits_opcode == _GEN_52; // @[Monitor.scala 686:39]
  wire  _T_2498 = io_in_d_bits_opcode == _GEN_44 | _T_2497; // @[Monitor.scala 685:77]
  wire  _T_2502 = io_in_a_bits_size == io_in_d_bits_size; // @[Monitor.scala 687:36]
  wire [3:0] a_opcode_lookup = _a_opcode_lookup_T_7[3:0];
  wire [2:0] _GEN_55 = 3'h2 == a_opcode_lookup[2:0] ? 3'h1 : 3'h0; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_56 = 3'h3 == a_opcode_lookup[2:0] ? 3'h1 : _GEN_55; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_57 = 3'h4 == a_opcode_lookup[2:0] ? 3'h1 : _GEN_56; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_58 = 3'h5 == a_opcode_lookup[2:0] ? 3'h2 : _GEN_57; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_59 = 3'h6 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_58; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_60 = 3'h7 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_59; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_67 = 3'h6 == a_opcode_lookup[2:0] ? 3'h5 : _GEN_58; // @[Monitor.scala 690:38 Monitor.scala 690:38]
  wire [2:0] _GEN_68 = 3'h7 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_67; // @[Monitor.scala 690:38 Monitor.scala 690:38]
  wire  _T_2509 = io_in_d_bits_opcode == _GEN_68; // @[Monitor.scala 690:38]
  wire  _T_2510 = io_in_d_bits_opcode == _GEN_60 | _T_2509; // @[Monitor.scala 689:72]
  wire [7:0] a_size_lookup = _a_size_lookup_T_7[7:0];
  wire [7:0] _GEN_101 = {{4'd0}, io_in_d_bits_size}; // @[Monitor.scala 691:36]
  wire  _T_2514 = _GEN_101 == a_size_lookup; // @[Monitor.scala 691:36]
  wire  _T_2524 = _T_2477 & a_first_1 & io_in_a_valid & _same_cycle_resp_T_2 & _T_2479; // @[Monitor.scala 694:116]
  wire  _T_2525 = ~io_in_d_ready; // @[Monitor.scala 695:15]
  wire  _T_2526 = ~io_in_d_ready | io_in_a_ready; // @[Monitor.scala 695:32]
  wire [4:0] a_set_wo_ready = _GEN_27[4:0];
  wire [4:0] d_clr_wo_ready = _GEN_33[4:0];
  wire  _T_2533 = a_set_wo_ready != d_clr_wo_ready | ~(|a_set_wo_ready); // @[Monitor.scala 699:48]
  wire [4:0] a_set = _GEN_28[4:0];
  wire [4:0] _inflight_T = inflight | a_set; // @[Monitor.scala 702:27]
  wire [4:0] d_clr = _GEN_34[4:0];
  wire [4:0] _inflight_T_1 = ~d_clr; // @[Monitor.scala 702:38]
  wire [4:0] _inflight_T_2 = _inflight_T & _inflight_T_1; // @[Monitor.scala 702:36]
  wire [19:0] a_opcodes_set = _GEN_31[19:0];
  wire [19:0] _inflight_opcodes_T = inflight_opcodes | a_opcodes_set; // @[Monitor.scala 703:43]
  wire [19:0] d_opcodes_clr = _GEN_35[19:0];
  wire [19:0] _inflight_opcodes_T_1 = ~d_opcodes_clr; // @[Monitor.scala 703:62]
  wire [19:0] _inflight_opcodes_T_2 = _inflight_opcodes_T & _inflight_opcodes_T_1; // @[Monitor.scala 703:60]
  wire [39:0] a_sizes_set = _GEN_32[39:0];
  wire [39:0] _inflight_sizes_T = inflight_sizes | a_sizes_set; // @[Monitor.scala 704:39]
  wire [39:0] d_sizes_clr = _GEN_36[39:0];
  wire [39:0] _inflight_sizes_T_1 = ~d_sizes_clr; // @[Monitor.scala 704:56]
  wire [39:0] _inflight_sizes_T_2 = _inflight_sizes_T & _inflight_sizes_T_1; // @[Monitor.scala 704:54]
  reg [31:0] watchdog; // @[Monitor.scala 706:27]
  wire  _T_2542 = ~(|inflight) | plusarg_reader_out == 32'h0 | watchdog < plusarg_reader_out; // @[Monitor.scala 709:47]
  wire [31:0] _watchdog_T_1 = watchdog + 32'h1; // @[Monitor.scala 711:26]
  reg [4:0] inflight_1; // @[Monitor.scala 723:35]
  reg [39:0] inflight_sizes_1; // @[Monitor.scala 725:35]
  reg [8:0] c_first_counter_1; // @[Edges.scala 228:27]
  wire [8:0] c_first_counter1_1 = c_first_counter_1 - 9'h1; // @[Edges.scala 229:28]
  wire  c_first_1 = c_first_counter_1 == 9'h0; // @[Edges.scala 230:25]
  reg [8:0] d_first_counter_2; // @[Edges.scala 228:27]
  wire [8:0] d_first_counter1_2 = d_first_counter_2 - 9'h1; // @[Edges.scala 229:28]
  wire  d_first_2 = d_first_counter_2 == 9'h0; // @[Edges.scala 230:25]
  wire [39:0] _c_size_lookup_T_1 = inflight_sizes_1 >> _a_size_lookup_T; // @[Monitor.scala 747:42]
  wire [39:0] _c_size_lookup_T_6 = _c_size_lookup_T_1 & _GEN_93; // @[Monitor.scala 747:93]
  wire [39:0] _c_size_lookup_T_7 = {{1'd0}, _c_size_lookup_T_6[39:1]}; // @[Monitor.scala 747:146]
  wire  _T_2552 = io_in_c_bits_opcode[2] & io_in_c_bits_opcode[1]; // @[Edges.scala 67:40]
  wire  _T_2553 = io_in_c_valid & c_first_1 & _T_2552; // @[Monitor.scala 756:37]
  wire [7:0] _c_set_wo_ready_T = 8'h1 << io_in_c_bits_source; // @[OneHot.scala 58:35]
  wire [7:0] _GEN_72 = io_in_c_valid & c_first_1 & _T_2552 ? _c_set_wo_ready_T : 8'h0; // @[Monitor.scala 756:71 Monitor.scala 757:22]
  wire  _T_2559 = _c_first_T & c_first_1 & _T_2552; // @[Monitor.scala 760:38]
  wire [4:0] _c_sizes_set_interm_T = {io_in_c_bits_size, 1'h0}; // @[Monitor.scala 763:51]
  wire [4:0] _c_sizes_set_interm_T_1 = _c_sizes_set_interm_T | 5'h1; // @[Monitor.scala 763:59]
  wire [5:0] _c_sizes_set_T = {io_in_c_bits_source, 3'h0}; // @[Monitor.scala 765:77]
  wire [4:0] c_sizes_set_interm = _c_first_T & c_first_1 & _T_2552 ? _c_sizes_set_interm_T_1 : 5'h0; // @[Monitor.scala 760:72 Monitor.scala 763:28]
  wire [67:0] _GEN_109 = {{63'd0}, c_sizes_set_interm}; // @[Monitor.scala 765:52]
  wire [67:0] _c_sizes_set_T_1 = _GEN_109 << _c_sizes_set_T; // @[Monitor.scala 765:52]
  wire [4:0] _T_2560 = inflight_1 >> io_in_c_bits_source; // @[Monitor.scala 766:26]
  wire  _T_2562 = ~_T_2560[0]; // @[Monitor.scala 766:17]
  wire [7:0] _GEN_73 = _c_first_T & c_first_1 & _T_2552 ? _c_set_wo_ready_T : 8'h0; // @[Monitor.scala 760:72 Monitor.scala 761:28]
  wire [67:0] _GEN_77 = _c_first_T & c_first_1 & _T_2552 ? _c_sizes_set_T_1 : 68'h0; // @[Monitor.scala 760:72 Monitor.scala 765:28]
  wire  _T_2566 = io_in_d_valid & d_first_2; // @[Monitor.scala 779:26]
  wire  _T_2568 = io_in_d_valid & d_first_2 & _T_1063; // @[Monitor.scala 779:71]
  wire [7:0] _GEN_78 = io_in_d_valid & d_first_2 & _T_1063 ? _d_clr_wo_ready_T : 8'h0; // @[Monitor.scala 779:89 Monitor.scala 780:22]
  wire [7:0] _GEN_79 = _d_first_T & d_first_2 & _T_1063 ? _d_clr_wo_ready_T : 8'h0; // @[Monitor.scala 783:90 Monitor.scala 784:21]
  wire [78:0] _GEN_81 = _d_first_T & d_first_2 & _T_1063 ? _d_sizes_clr_T_5 : 79'h0; // @[Monitor.scala 783:90 Monitor.scala 786:21]
  wire  _same_cycle_resp_T_8 = io_in_c_bits_source == io_in_d_bits_source; // @[Monitor.scala 790:113]
  wire  same_cycle_resp_1 = _T_2553 & io_in_c_bits_source == io_in_d_bits_source; // @[Monitor.scala 790:88]
  wire [4:0] _T_2576 = inflight_1 >> io_in_d_bits_source; // @[Monitor.scala 791:25]
  wire  _T_2578 = _T_2576[0] | same_cycle_resp_1; // @[Monitor.scala 791:49]
  wire  _T_2582 = io_in_d_bits_size == io_in_c_bits_size; // @[Monitor.scala 793:36]
  wire [7:0] c_size_lookup = _c_size_lookup_T_7[7:0];
  wire  _T_2586 = _GEN_101 == c_size_lookup; // @[Monitor.scala 795:36]
  wire  _T_2595 = _T_2566 & c_first_1 & io_in_c_valid & _same_cycle_resp_T_8 & _T_1063; // @[Monitor.scala 799:116]
  wire  _T_2597 = _T_2525 | io_in_c_ready; // @[Monitor.scala 800:32]
  wire [4:0] c_set_wo_ready = _GEN_72[4:0];
  wire  _T_2601 = |c_set_wo_ready; // @[Monitor.scala 804:28]
  wire [4:0] d_clr_wo_ready_1 = _GEN_78[4:0];
  wire  _T_2602 = c_set_wo_ready != d_clr_wo_ready_1; // @[Monitor.scala 805:31]
  wire [4:0] c_set = _GEN_73[4:0];
  wire [4:0] _inflight_T_3 = inflight_1 | c_set; // @[Monitor.scala 809:35]
  wire [4:0] d_clr_1 = _GEN_79[4:0];
  wire [4:0] _inflight_T_4 = ~d_clr_1; // @[Monitor.scala 809:46]
  wire [4:0] _inflight_T_5 = _inflight_T_3 & _inflight_T_4; // @[Monitor.scala 809:44]
  wire [39:0] c_sizes_set = _GEN_77[39:0];
  wire [39:0] _inflight_sizes_T_3 = inflight_sizes_1 | c_sizes_set; // @[Monitor.scala 811:41]
  wire [39:0] d_sizes_clr_1 = _GEN_81[39:0];
  wire [39:0] _inflight_sizes_T_4 = ~d_sizes_clr_1; // @[Monitor.scala 811:58]
  wire [39:0] _inflight_sizes_T_5 = _inflight_sizes_T_3 & _inflight_sizes_T_4; // @[Monitor.scala 811:56]
  reg [31:0] watchdog_1; // @[Monitor.scala 813:27]
  wire  _T_2611 = ~(|inflight_1) | plusarg_reader_1_out == 32'h0 | watchdog_1 < plusarg_reader_1_out; // @[Monitor.scala 816:47]
  wire [31:0] _watchdog_T_3 = watchdog_1 + 32'h1; // @[Monitor.scala 818:26]
  reg [3:0] inflight_2; // @[Monitor.scala 823:27]
  reg [8:0] d_first_counter_3; // @[Edges.scala 228:27]
  wire [8:0] d_first_counter1_3 = d_first_counter_3 - 9'h1; // @[Edges.scala 229:28]
  wire  d_first_3 = d_first_counter_3 == 9'h0; // @[Edges.scala 230:25]
  wire  _T_2623 = io_in_d_bits_opcode[2] & ~io_in_d_bits_opcode[1]; // @[Edges.scala 70:40]
  wire  _T_2624 = _d_first_T & d_first_3 & _T_2623; // @[Monitor.scala 829:38]
  wire [3:0] _d_set_T = 4'h1 << io_in_d_bits_sink; // @[OneHot.scala 58:35]
  wire [3:0] _T_2625 = inflight_2 >> io_in_d_bits_sink; // @[Monitor.scala 831:23]
  wire  _T_2627 = ~_T_2625[0]; // @[Monitor.scala 831:14]
  wire [3:0] d_set = _d_first_T & d_first_3 & _T_2623 ? _d_set_T : 4'h0; // @[Monitor.scala 829:72 Monitor.scala 830:13]
  wire  _T_2631 = io_in_e_ready & io_in_e_valid; // @[Decoupled.scala 40:37]
  wire [3:0] _e_clr_T = 4'h1 << io_in_e_bits_sink; // @[OneHot.scala 58:35]
  wire [3:0] _T_2634 = d_set | inflight_2; // @[Monitor.scala 837:24]
  wire [3:0] _T_2635 = _T_2634 >> io_in_e_bits_sink; // @[Monitor.scala 837:35]
  wire [3:0] e_clr = _T_2631 ? _e_clr_T : 4'h0; // @[Monitor.scala 835:73 Monitor.scala 836:13]
  wire [3:0] _inflight_T_6 = inflight_2 | d_set; // @[Monitor.scala 842:27]
  wire [3:0] _inflight_T_7 = ~e_clr; // @[Monitor.scala 842:38]
  wire [3:0] _inflight_T_8 = _inflight_T_6 & _inflight_T_7; // @[Monitor.scala 842:36]
  plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0), .WIDTH(32)) plusarg_reader ( // @[PlusArg.scala 80:11]
    .out(plusarg_reader_out)
  );
  plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0), .WIDTH(32)) plusarg_reader_1 ( // @[PlusArg.scala 80:11]
    .out(plusarg_reader_1_out)
  );
  always @(posedge clock) begin
    if (reset) begin // @[Edges.scala 228:27]
      a_first_counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_a_first_T) begin // @[Edges.scala 234:17]
      if (a_first) begin // @[Edges.scala 235:21]
        if (a_first_beats1_opdata) begin // @[Edges.scala 220:14]
          a_first_counter <= a_first_beats1_decode;
        end else begin
          a_first_counter <= 9'h0;
        end
      end else begin
        a_first_counter <= a_first_counter1;
      end
    end
    if (_a_first_T & a_first) begin // @[Monitor.scala 396:32]
      opcode <= io_in_a_bits_opcode; // @[Monitor.scala 397:15]
    end
    if (_a_first_T & a_first) begin // @[Monitor.scala 396:32]
      param <= io_in_a_bits_param; // @[Monitor.scala 398:15]
    end
    if (_a_first_T & a_first) begin // @[Monitor.scala 396:32]
      size <= io_in_a_bits_size; // @[Monitor.scala 399:15]
    end
    if (_a_first_T & a_first) begin // @[Monitor.scala 396:32]
      source <= io_in_a_bits_source; // @[Monitor.scala 400:15]
    end
    if (_a_first_T & a_first) begin // @[Monitor.scala 396:32]
      address <= io_in_a_bits_address; // @[Monitor.scala 401:15]
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_first_counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_d_first_T) begin // @[Edges.scala 234:17]
      if (d_first) begin // @[Edges.scala 235:21]
        if (d_first_beats1_opdata) begin // @[Edges.scala 220:14]
          d_first_counter <= d_first_beats1_decode;
        end else begin
          d_first_counter <= 9'h0;
        end
      end else begin
        d_first_counter <= d_first_counter1;
      end
    end
    if (_d_first_T & d_first) begin // @[Monitor.scala 549:32]
      opcode_1 <= io_in_d_bits_opcode; // @[Monitor.scala 550:15]
    end
    if (_d_first_T & d_first) begin // @[Monitor.scala 549:32]
      param_1 <= io_in_d_bits_param; // @[Monitor.scala 551:15]
    end
    if (_d_first_T & d_first) begin // @[Monitor.scala 549:32]
      size_1 <= io_in_d_bits_size; // @[Monitor.scala 552:15]
    end
    if (_d_first_T & d_first) begin // @[Monitor.scala 549:32]
      source_1 <= io_in_d_bits_source; // @[Monitor.scala 553:15]
    end
    if (_d_first_T & d_first) begin // @[Monitor.scala 549:32]
      sink <= io_in_d_bits_sink; // @[Monitor.scala 554:15]
    end
    if (_d_first_T & d_first) begin // @[Monitor.scala 549:32]
      denied <= io_in_d_bits_denied; // @[Monitor.scala 555:15]
    end
    if (reset) begin // @[Edges.scala 228:27]
      b_first_counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (b_first_done) begin // @[Edges.scala 234:17]
      if (b_first) begin // @[Edges.scala 235:21]
        b_first_counter <= 9'h0;
      end else begin
        b_first_counter <= b_first_counter1;
      end
    end
    if (b_first_done & b_first) begin // @[Monitor.scala 419:32]
      opcode_2 <= io_in_b_bits_opcode; // @[Monitor.scala 420:15]
    end
    if (b_first_done & b_first) begin // @[Monitor.scala 419:32]
      param_2 <= io_in_b_bits_param; // @[Monitor.scala 421:15]
    end
    if (b_first_done & b_first) begin // @[Monitor.scala 419:32]
      size_2 <= io_in_b_bits_size; // @[Monitor.scala 422:15]
    end
    if (b_first_done & b_first) begin // @[Monitor.scala 419:32]
      source_2 <= io_in_b_bits_source; // @[Monitor.scala 423:15]
    end
    if (b_first_done & b_first) begin // @[Monitor.scala 419:32]
      address_1 <= io_in_b_bits_address; // @[Monitor.scala 424:15]
    end
    if (reset) begin // @[Edges.scala 228:27]
      c_first_counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_c_first_T) begin // @[Edges.scala 234:17]
      if (c_first) begin // @[Edges.scala 235:21]
        if (c_first_beats1_opdata) begin // @[Edges.scala 220:14]
          c_first_counter <= c_first_beats1_decode;
        end else begin
          c_first_counter <= 9'h0;
        end
      end else begin
        c_first_counter <= c_first_counter1;
      end
    end
    if (_c_first_T & c_first) begin // @[Monitor.scala 524:32]
      opcode_3 <= io_in_c_bits_opcode; // @[Monitor.scala 525:15]
    end
    if (_c_first_T & c_first) begin // @[Monitor.scala 524:32]
      param_3 <= io_in_c_bits_param; // @[Monitor.scala 526:15]
    end
    if (_c_first_T & c_first) begin // @[Monitor.scala 524:32]
      size_3 <= io_in_c_bits_size; // @[Monitor.scala 527:15]
    end
    if (_c_first_T & c_first) begin // @[Monitor.scala 524:32]
      source_3 <= io_in_c_bits_source; // @[Monitor.scala 528:15]
    end
    if (_c_first_T & c_first) begin // @[Monitor.scala 524:32]
      address_2 <= io_in_c_bits_address; // @[Monitor.scala 529:15]
    end
    if (reset) begin // @[Monitor.scala 611:27]
      inflight <= 5'h0; // @[Monitor.scala 611:27]
    end else begin
      inflight <= _inflight_T_2; // @[Monitor.scala 702:14]
    end
    if (reset) begin // @[Monitor.scala 613:35]
      inflight_opcodes <= 20'h0; // @[Monitor.scala 613:35]
    end else begin
      inflight_opcodes <= _inflight_opcodes_T_2; // @[Monitor.scala 703:22]
    end
    if (reset) begin // @[Monitor.scala 615:33]
      inflight_sizes <= 40'h0; // @[Monitor.scala 615:33]
    end else begin
      inflight_sizes <= _inflight_sizes_T_2; // @[Monitor.scala 704:20]
    end
    if (reset) begin // @[Edges.scala 228:27]
      a_first_counter_1 <= 9'h0; // @[Edges.scala 228:27]
    end else if (_a_first_T) begin // @[Edges.scala 234:17]
      if (a_first_1) begin // @[Edges.scala 235:21]
        if (a_first_beats1_opdata) begin // @[Edges.scala 220:14]
          a_first_counter_1 <= a_first_beats1_decode;
        end else begin
          a_first_counter_1 <= 9'h0;
        end
      end else begin
        a_first_counter_1 <= a_first_counter1_1;
      end
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_first_counter_1 <= 9'h0; // @[Edges.scala 228:27]
    end else if (_d_first_T) begin // @[Edges.scala 234:17]
      if (d_first_1) begin // @[Edges.scala 235:21]
        if (d_first_beats1_opdata) begin // @[Edges.scala 220:14]
          d_first_counter_1 <= d_first_beats1_decode;
        end else begin
          d_first_counter_1 <= 9'h0;
        end
      end else begin
        d_first_counter_1 <= d_first_counter1_1;
      end
    end
    if (reset) begin // @[Monitor.scala 706:27]
      watchdog <= 32'h0; // @[Monitor.scala 706:27]
    end else if (_a_first_T | _d_first_T) begin // @[Monitor.scala 712:47]
      watchdog <= 32'h0; // @[Monitor.scala 712:58]
    end else begin
      watchdog <= _watchdog_T_1; // @[Monitor.scala 711:14]
    end
    if (reset) begin // @[Monitor.scala 723:35]
      inflight_1 <= 5'h0; // @[Monitor.scala 723:35]
    end else begin
      inflight_1 <= _inflight_T_5; // @[Monitor.scala 809:22]
    end
    if (reset) begin // @[Monitor.scala 725:35]
      inflight_sizes_1 <= 40'h0; // @[Monitor.scala 725:35]
    end else begin
      inflight_sizes_1 <= _inflight_sizes_T_5; // @[Monitor.scala 811:22]
    end
    if (reset) begin // @[Edges.scala 228:27]
      c_first_counter_1 <= 9'h0; // @[Edges.scala 228:27]
    end else if (_c_first_T) begin // @[Edges.scala 234:17]
      if (c_first_1) begin // @[Edges.scala 235:21]
        if (c_first_beats1_opdata) begin // @[Edges.scala 220:14]
          c_first_counter_1 <= c_first_beats1_decode;
        end else begin
          c_first_counter_1 <= 9'h0;
        end
      end else begin
        c_first_counter_1 <= c_first_counter1_1;
      end
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_first_counter_2 <= 9'h0; // @[Edges.scala 228:27]
    end else if (_d_first_T) begin // @[Edges.scala 234:17]
      if (d_first_2) begin // @[Edges.scala 235:21]
        if (d_first_beats1_opdata) begin // @[Edges.scala 220:14]
          d_first_counter_2 <= d_first_beats1_decode;
        end else begin
          d_first_counter_2 <= 9'h0;
        end
      end else begin
        d_first_counter_2 <= d_first_counter1_2;
      end
    end
    if (reset) begin // @[Monitor.scala 813:27]
      watchdog_1 <= 32'h0; // @[Monitor.scala 813:27]
    end else if (_c_first_T | _d_first_T) begin // @[Monitor.scala 819:47]
      watchdog_1 <= 32'h0; // @[Monitor.scala 819:58]
    end else begin
      watchdog_1 <= _watchdog_T_3; // @[Monitor.scala 818:14]
    end
    if (reset) begin // @[Monitor.scala 823:27]
      inflight_2 <= 4'h0; // @[Monitor.scala 823:27]
    end else begin
      inflight_2 <= _inflight_T_8; // @[Monitor.scala 842:14]
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_first_counter_3 <= 9'h0; // @[Edges.scala 228:27]
    end else if (_d_first_T) begin // @[Edges.scala 234:17]
      if (d_first_3) begin // @[Edges.scala 235:21]
        if (d_first_beats1_opdata) begin // @[Edges.scala 220:14]
          d_first_counter_3 <= d_first_beats1_decode;
        end else begin
          d_first_counter_3 <= 9'h0;
        end
      end else begin
        d_first_counter_3 <= d_first_counter1_3;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_T_121 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquireBlock type which is unexpected using diplomatic parameters (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_T_121 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_T_204 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_T_204 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(source_ok | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_mask_T | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_mask_T | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_T_218 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_T_218 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_T_223 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_T_223 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_T_227 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_38 & ~(_T_227 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_121 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquirePerm type which is unexpected using diplomatic parameters (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_121 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_204 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_204 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(source_ok | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_mask_T | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_mask_T | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_218 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_218 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_415 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_415 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_223 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_223 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_227 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_231 & ~(_T_227 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(_T_52 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Get type which master claims it can't emit (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(_T_52 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(_T_516 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(_T_516 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(source_ok | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(_T_526 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(_T_526 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(_T_530 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(_T_530 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(_T_227 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_428 & ~(_T_227 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_538 & ~(_T_626 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries PutFull type which is unexpected using diplomatic parameters (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_538 & ~(_T_626 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_538 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_538 & ~(source_ok | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_538 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_538 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_538 & ~(_T_526 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_538 & ~(_T_526 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_538 & ~(_T_530 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_538 & ~(_T_530 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_644 & ~(_T_626 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_644 & ~(_T_626 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_644 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_644 & ~(source_ok | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_644 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_644 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_644 & ~(_T_526 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_644 & ~(_T_526 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_644 & ~(_T_748 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_644 & ~(_T_748 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_752 & ~(_T_835 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Arithmetic type which is unexpected using diplomatic parameters (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_752 & ~(_T_835 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_752 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_752 & ~(source_ok | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_752 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_752 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_752 & ~(_T_845 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_752 & ~(_T_845 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_752 & ~(_T_530 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_752 & ~(_T_530 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_853 & ~(_T_835 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Logical type which is unexpected using diplomatic parameters (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_853 & ~(_T_835 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_853 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_853 & ~(source_ok | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_853 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_853 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_853 & ~(_T_946 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical carries invalid opcode param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_853 & ~(_T_946 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_853 & ~(_T_530 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_853 & ~(_T_530 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(_T_1037 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Hint type which is unexpected using diplomatic parameters (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(_T_1037 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(source_ok | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(_T_1047 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint carries invalid opcode param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(_T_1047 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(_T_530 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(_T_530 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(_T_227 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_954 & ~(_T_227 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & ~(_T_1059 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel has invalid opcode (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & ~(_T_1059 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1063 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1063 & ~(source_ok_1 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1063 & ~(_T_1067 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1063 & ~(_T_1067 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1063 & ~(_T_1071 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1063 & ~(_T_1071 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1063 & ~(_T_1075 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1063 & ~(_T_1075 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1063 & ~(_T_1079 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck is denied (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1063 & ~(_T_1079 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1083 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1083 & ~(source_ok_1 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1083 & ~(_T_1067 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant smaller than a beat (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1083 & ~(_T_1067 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1083 & ~(_T_1094 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries invalid cap param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1083 & ~(_T_1094 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1083 & ~(_T_1098 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries toN param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1083 & ~(_T_1098 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1083 & ~(_T_1075 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1083 & ~(_T_1075 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1111 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1111 & ~(source_ok_1 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1111 & ~(_T_1067 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData smaller than a beat (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1111 & ~(_T_1067 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1111 & ~(_T_1094 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries invalid cap param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1111 & ~(_T_1094 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1111 & ~(_T_1098 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries toN param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1111 & ~(_T_1098 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1111 & ~(_T_1131 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1111 & ~(_T_1131 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1140 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1140 & ~(source_ok_1 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1140 & ~(_T_1071 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1140 & ~(_T_1071 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1140 & ~(_T_1075 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1140 & ~(_T_1075 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1157 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1157 & ~(source_ok_1 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1157 & ~(_T_1071 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1157 & ~(_T_1071 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1157 & ~(_T_1131 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1157 & ~(_T_1131 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1175 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1175 & ~(source_ok_1 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1175 & ~(_T_1071 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1175 & ~(_T_1071 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_1175 & ~(_T_1075 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_1175 & ~(_T_1075 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & ~(_T_1192 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel has invalid opcode (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & ~(_T_1192 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(_T_1310 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries Probe type which is unexpected using diplomatic parameters (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(_T_1310 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(address_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(address_ok | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(legal_source | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe carries source that is not first source (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(legal_source | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(is_aligned_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(is_aligned_1 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(_T_1323 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe carries invalid cap param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(_T_1323 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(_T_1327 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(_T_1327 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(_T_1331 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1230 & ~(_T_1331 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries Get type which is unexpected using diplomatic parameters (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & _T_1316) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & _T_1316) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & _T_1319) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get carries source that is not first source (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & _T_1319) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & _T_1322) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & _T_1322) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & ~(_T_1414 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & ~(_T_1414 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & _T_1330) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & _T_1330) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & _T_1334) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1335 & _T_1334) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries PutFull type which is unexpected using diplomatic parameters (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & _T_1316) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutFull carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & _T_1316) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & _T_1319) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutFull carries source that is not first source (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & _T_1319) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & _T_1322) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutFull address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & _T_1322) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & ~(_T_1414 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutFull carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & ~(_T_1414 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & _T_1330) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutFull contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1426 & _T_1330) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & _T_1316) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutPartial carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & _T_1316) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & _T_1319) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutPartial carries source that is not first source (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & _T_1319) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & _T_1322) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutPartial address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & _T_1322) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & ~(_T_1414 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutPartial carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & ~(_T_1414 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & ~(_T_1598 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutPartial contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1513 & ~(_T_1598 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1602 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries Arithmetic type unsupported by master (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1602 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1602 & _T_1316) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Arithmetic carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1602 & _T_1316) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1602 & _T_1319) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Arithmetic carries source that is not first source (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1602 & _T_1319) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1602 & _T_1322) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Arithmetic address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1602 & _T_1322) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1602 & _T_1330) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Arithmetic contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1602 & _T_1330) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1689 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries Logical type unsupported by client (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1689 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1689 & _T_1316) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Logical carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1689 & _T_1316) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1689 & _T_1319) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Logical carries source that is not first source (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1689 & _T_1319) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1689 & _T_1322) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Logical address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1689 & _T_1322) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1689 & _T_1330) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Logical contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1689 & _T_1330) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries Hint type unsupported by client (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & _T_1316) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Hint carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & _T_1316) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & _T_1319) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Hint carries source that is not first source (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & _T_1319) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & _T_1322) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Hint address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & _T_1322) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & _T_1330) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Hint contains invalid mask (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & _T_1330) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & _T_1334) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Hint is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1776 & _T_1334) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(address_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(address_ok_1 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(source_ok_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(_T_1908 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck smaller than a beat (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(_T_1908 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(is_aligned_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(_T_1915 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck carries invalid report param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(_T_1915 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(_T_1919 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1901 & ~(_T_1919 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1923 & ~(address_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAckData carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1923 & ~(address_ok_1 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1923 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAckData carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1923 & ~(source_ok_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1923 & ~(_T_1908 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAckData smaller than a beat (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1923 & ~(_T_1908 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1923 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAckData address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1923 & ~(is_aligned_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1923 & ~(_T_1915 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAckData carries invalid report param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1923 & ~(_T_1915 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(_T_2024 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel carries Release type unsupported by manager (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(_T_2024 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(_T_2107 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(_T_2107 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel Release carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(source_ok_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(_T_1908 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel Release smaller than a beat (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(_T_1908 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel Release address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(is_aligned_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(_T_1915 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel Release carries invalid report param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(_T_1915 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(_T_1919 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel Release is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_1941 & ~(_T_1919 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(_T_2024 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel carries ReleaseData type unsupported by manager (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(_T_2024 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(_T_2107 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(_T_2107 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ReleaseData carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(source_ok_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(_T_1908 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ReleaseData smaller than a beat (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(_T_1908 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ReleaseData address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(is_aligned_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(_T_1915 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ReleaseData carries invalid report param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2129 & ~(_T_1915 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2313 & ~(address_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAck carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2313 & ~(address_ok_1 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2313 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAck carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2313 & ~(source_ok_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2313 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAck address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2313 & ~(is_aligned_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2313 & ~(_T_2323 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAck carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2313 & ~(_T_2323 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2313 & ~(_T_1919 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAck is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2313 & ~(_T_1919 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2331 & ~(address_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAckData carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2331 & ~(address_ok_1 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2331 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAckData carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2331 & ~(source_ok_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2331 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAckData address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2331 & ~(is_aligned_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2331 & ~(_T_2323 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAckData carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2331 & ~(_T_2323 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2345 & ~(address_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel HintAck carries unmanaged address (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2345 & ~(address_ok_1 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2345 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel HintAck carries invalid source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2345 & ~(source_ok_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2345 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel HintAck address not aligned to size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2345 & ~(is_aligned_2 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2345 & ~(_T_2323 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel HintAck carries invalid param (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2345 & ~(_T_2323 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_c_valid & _T_2345 & ~(_T_1919 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel HintAck is corrupt (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_c_valid & _T_2345 & ~(_T_1919 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2367 & ~(_T_2368 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel opcode changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2367 & ~(_T_2368 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2367 & ~(_T_2372 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel param changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2367 & ~(_T_2372 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2367 & ~(_T_2376 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel size changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2367 & ~(_T_2376 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2367 & ~(_T_2380 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel source changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2367 & ~(_T_2380 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2367 & ~(_T_2384 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel address changed with multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2367 & ~(_T_2384 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2391 & ~(_T_2392 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel opcode changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2391 & ~(_T_2392 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2391 & ~(_T_2396 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel param changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2391 & ~(_T_2396 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2391 & ~(_T_2400 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel size changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2391 & ~(_T_2400 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2391 & ~(_T_2404 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel source changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2391 & ~(_T_2404 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2391 & ~(_T_2408 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel sink changed with multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2391 & ~(_T_2408 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2391 & ~(_T_2412 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel denied changed with multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2391 & ~(_T_2412 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2419 & ~(_T_2420 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel opcode changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2419 & ~(_T_2420 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2419 & ~(_T_2424 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel param changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2419 & ~(_T_2424 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2419 & ~(_T_2428 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel size changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2419 & ~(_T_2428 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2419 & ~(_T_2432 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel source changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2419 & ~(_T_2432 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2419 & ~(_T_2436 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel addresss changed with multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2419 & ~(_T_2436 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2443 & ~(_T_2444 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel opcode changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2443 & ~(_T_2444 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2443 & ~(_T_2448 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel param changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2443 & ~(_T_2448 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2443 & ~(_T_2452 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel size changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2443 & ~(_T_2452 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2443 & ~(_T_2456 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel source changed within multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2443 & ~(_T_2456 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2443 & ~(_T_2460 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel address changed with multibeat operation (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2443 & ~(_T_2460 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2469 & ~(_T_2473 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel re-used a source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2469 & ~(_T_2473 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2480 & ~(_T_2492 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel acknowledged for nothing inflight (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2480 & ~(_T_2492 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2480 & same_cycle_resp & ~(_T_2498 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper opcode response (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2480 & same_cycle_resp & ~(_T_2498 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2480 & same_cycle_resp & ~(_T_2502 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2480 & same_cycle_resp & ~(_T_2502 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2480 & ~same_cycle_resp & ~(_T_2510 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper opcode response (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2480 & ~same_cycle_resp & ~(_T_2510 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2480 & ~same_cycle_resp & ~(_T_2514 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2480 & ~same_cycle_resp & ~(_T_2514 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2524 & ~(_T_2526 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n"); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2524 & ~(_T_2526 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_2533 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' and 'D' concurrent, despite minlatency 3 (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_2533 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_2542 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: TileLink timeout expired (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_2542 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2559 & ~(_T_2562 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel re-used a source ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2559 & ~(_T_2562 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2568 & ~(_T_2578 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel acknowledged for nothing inflight (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2568 & ~(_T_2578 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2568 & same_cycle_resp_1 & ~(_T_2582 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2568 & same_cycle_resp_1 & ~(_T_2582 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2568 & ~same_cycle_resp_1 & ~(_T_2586 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2568 & ~same_cycle_resp_1 & ~(_T_2586 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2595 & ~(_T_2597 | reset)) begin
          $fwrite(32'h80000002,"Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n"); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2595 & ~(_T_2597 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2601 & ~(_T_2602 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' and 'D' concurrent, despite minlatency 3 (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2601 & ~(_T_2602 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_2611 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: TileLink timeout expired (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_2611 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2624 & ~(_T_2627 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel re-used a sink ID (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2624 & ~(_T_2627 | reset)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2631 & ~(_T_2635[0] | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'E' channel acknowledged for nothing inflight (connected at CrossingHelper.scala:61:80)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2631 & ~(_T_2635[0] | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
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
  a_first_counter = _RAND_0[8:0];
  _RAND_1 = {1{`RANDOM}};
  opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  param = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  size = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  source = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  address = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  d_first_counter = _RAND_6[8:0];
  _RAND_7 = {1{`RANDOM}};
  opcode_1 = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  param_1 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  size_1 = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  source_1 = _RAND_10[2:0];
  _RAND_11 = {1{`RANDOM}};
  sink = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  denied = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  b_first_counter = _RAND_13[8:0];
  _RAND_14 = {1{`RANDOM}};
  opcode_2 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  param_2 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  size_2 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  source_2 = _RAND_17[2:0];
  _RAND_18 = {1{`RANDOM}};
  address_1 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  c_first_counter = _RAND_19[8:0];
  _RAND_20 = {1{`RANDOM}};
  opcode_3 = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  param_3 = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  size_3 = _RAND_22[3:0];
  _RAND_23 = {1{`RANDOM}};
  source_3 = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  address_2 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  inflight = _RAND_25[4:0];
  _RAND_26 = {1{`RANDOM}};
  inflight_opcodes = _RAND_26[19:0];
  _RAND_27 = {2{`RANDOM}};
  inflight_sizes = _RAND_27[39:0];
  _RAND_28 = {1{`RANDOM}};
  a_first_counter_1 = _RAND_28[8:0];
  _RAND_29 = {1{`RANDOM}};
  d_first_counter_1 = _RAND_29[8:0];
  _RAND_30 = {1{`RANDOM}};
  watchdog = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  inflight_1 = _RAND_31[4:0];
  _RAND_32 = {2{`RANDOM}};
  inflight_sizes_1 = _RAND_32[39:0];
  _RAND_33 = {1{`RANDOM}};
  c_first_counter_1 = _RAND_33[8:0];
  _RAND_34 = {1{`RANDOM}};
  d_first_counter_2 = _RAND_34[8:0];
  _RAND_35 = {1{`RANDOM}};
  watchdog_1 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  inflight_2 = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  d_first_counter_3 = _RAND_37[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
