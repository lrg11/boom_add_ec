module TLMonitor_34(
  input         clock,
  input         reset,
  input         io_in_a_ready,
  input         io_in_a_valid,
  input  [2:0]  io_in_a_bits_opcode,
  input  [2:0]  io_in_a_bits_param,
  input  [2:0]  io_in_a_bits_size,
  input  [3:0]  io_in_a_bits_source,
  input  [31:0] io_in_a_bits_address,
  input  [7:0]  io_in_a_bits_mask,
  input  [63:0] io_in_a_bits_data,
  input         io_in_a_bits_corrupt,
  input         io_in_b_ready,
  input         io_in_b_valid,
  input  [2:0]  io_in_b_bits_opcode,
  input  [1:0]  io_in_b_bits_param,
  input  [2:0]  io_in_b_bits_size,
  input  [3:0]  io_in_b_bits_source,
  input  [31:0] io_in_b_bits_address,
  input  [7:0]  io_in_b_bits_mask,
  input  [63:0] io_in_b_bits_data,
  input         io_in_b_bits_corrupt,
  input         io_in_c_ready,
  input         io_in_c_valid,
  input  [2:0]  io_in_c_bits_opcode,
  input  [2:0]  io_in_c_bits_param,
  input  [2:0]  io_in_c_bits_size,
  input  [3:0]  io_in_c_bits_source,
  input  [31:0] io_in_c_bits_address,
  input  [63:0] io_in_c_bits_data,
  input         io_in_c_bits_corrupt,
  input         io_in_d_ready,
  input         io_in_d_valid,
  input  [2:0]  io_in_d_bits_opcode,
  input  [1:0]  io_in_d_bits_param,
  input  [2:0]  io_in_d_bits_size,
  input  [3:0]  io_in_d_bits_source,
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
  reg [63:0] _RAND_26;
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
  wire  _source_ok_T = io_in_a_bits_source == 4'h8; // @[Parameters.scala 46:9]
  wire [1:0] source_ok_uncommonBits = io_in_a_bits_source[1:0]; // @[Parameters.scala 52:64]
  wire  _source_ok_T_2 = io_in_a_bits_source[3:2] == 2'h0; // @[Parameters.scala 54:32]
  wire  _source_ok_T_5 = source_ok_uncommonBits <= 2'h2; // @[Parameters.scala 57:20]
  wire  _source_ok_T_6 = _source_ok_T_2 & _source_ok_T_5; // @[Parameters.scala 56:50]
  wire  _source_ok_T_7 = io_in_a_bits_source == 4'h3; // @[Parameters.scala 46:9]
  wire  _source_ok_T_8 = io_in_a_bits_source == 4'h4; // @[Parameters.scala 46:9]
  wire  source_ok = _source_ok_T | _source_ok_T_6 | _source_ok_T_7 | _source_ok_T_8; // @[Parameters.scala 1125:46]
  wire [12:0] _is_aligned_mask_T_1 = 13'h3f << io_in_a_bits_size; // @[package.scala 234:77]
  wire [5:0] is_aligned_mask = ~_is_aligned_mask_T_1[5:0]; // @[package.scala 234:46]
  wire [31:0] _GEN_86 = {{26'd0}, is_aligned_mask}; // @[Edges.scala 20:16]
  wire [31:0] _is_aligned_T = io_in_a_bits_address & _GEN_86; // @[Edges.scala 20:16]
  wire  is_aligned = _is_aligned_T == 32'h0; // @[Edges.scala 20:24]
  wire [1:0] mask_sizeOH_shiftAmount = io_in_a_bits_size[1:0]; // @[OneHot.scala 64:49]
  wire [3:0] _mask_sizeOH_T_1 = 4'h1 << mask_sizeOH_shiftAmount; // @[OneHot.scala 65:12]
  wire [2:0] mask_sizeOH = _mask_sizeOH_T_1[2:0] | 3'h1; // @[Misc.scala 201:81]
  wire  _mask_T = io_in_a_bits_size >= 3'h3; // @[Misc.scala 205:21]
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
  wire  _T_47 = io_in_a_bits_opcode == 3'h6; // @[Monitor.scala 81:25]
  wire  _T_66 = io_in_a_bits_size <= 3'h6; // @[Parameters.scala 92:42]
  wire [31:0] _T_69 = io_in_a_bits_address ^ 32'h20000; // @[Parameters.scala 137:31]
  wire [32:0] _T_70 = {1'b0,$signed(_T_69)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_72 = $signed(_T_70) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _T_73 = $signed(_T_72) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _T_74 = io_in_a_bits_address ^ 32'h10000000; // @[Parameters.scala 137:31]
  wire [32:0] _T_75 = {1'b0,$signed(_T_74)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_77 = $signed(_T_75) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _T_78 = $signed(_T_77) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _T_79 = io_in_a_bits_address ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _T_80 = {1'b0,$signed(_T_79)}; // @[Parameters.scala 137:49]
  wire [32:0] _T_82 = $signed(_T_80) & -33'sh10000000; // @[Parameters.scala 137:52]
  wire  _T_83 = $signed(_T_82) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _T_85 = _T_73 | _T_78 | _T_83; // @[Parameters.scala 671:42]
  wire  _T_86 = _T_66 & _T_85; // @[Parameters.scala 670:56]
  wire  _T_88 = source_ok & _T_86; // @[Monitor.scala 82:72]
  wire  _T_101 = 3'h6 == io_in_a_bits_size; // @[Parameters.scala 91:48]
  wire  _T_103 = _source_ok_T_6 & _T_101; // @[Mux.scala 27:72]
  wire  _T_132 = _T_103 & _T_85; // @[Monitor.scala 83:78]
  wire  _T_146 = io_in_a_bits_param <= 3'h2; // @[Bundles.scala 108:27]
  wire [7:0] _T_150 = ~io_in_a_bits_mask; // @[Monitor.scala 88:18]
  wire  _T_151 = _T_150 == 8'h0; // @[Monitor.scala 88:31]
  wire  _T_155 = ~io_in_a_bits_corrupt; // @[Monitor.scala 89:18]
  wire  _T_159 = io_in_a_bits_opcode == 3'h7; // @[Monitor.scala 92:25]
  wire  _T_262 = io_in_a_bits_param != 3'h0; // @[Monitor.scala 99:31]
  wire  _T_275 = io_in_a_bits_opcode == 3'h4; // @[Monitor.scala 104:25]
  wire  _T_328 = io_in_a_bits_param == 3'h0; // @[Monitor.scala 109:31]
  wire  _T_332 = io_in_a_bits_mask == mask; // @[Monitor.scala 110:30]
  wire  _T_340 = io_in_a_bits_opcode == 3'h0; // @[Monitor.scala 114:25]
  wire  _T_372 = _T_78 | _T_83; // @[Parameters.scala 671:42]
  wire  _T_373 = _T_66 & _T_372; // @[Parameters.scala 670:56]
  wire  _T_383 = source_ok & _T_373; // @[Monitor.scala 115:71]
  wire  _T_401 = io_in_a_bits_opcode == 3'h1; // @[Monitor.scala 122:25]
  wire [7:0] _T_458 = ~mask; // @[Monitor.scala 127:33]
  wire [7:0] _T_459 = io_in_a_bits_mask & _T_458; // @[Monitor.scala 127:31]
  wire  _T_460 = _T_459 == 8'h0; // @[Monitor.scala 127:40]
  wire  _T_464 = io_in_a_bits_opcode == 3'h2; // @[Monitor.scala 130:25]
  wire  _T_512 = io_in_a_bits_param <= 3'h4; // @[Bundles.scala 138:33]
  wire  _T_520 = io_in_a_bits_opcode == 3'h3; // @[Monitor.scala 138:25]
  wire  _T_568 = io_in_a_bits_param <= 3'h3; // @[Bundles.scala 145:30]
  wire  _T_576 = io_in_a_bits_opcode == 3'h5; // @[Monitor.scala 146:25]
  wire  _T_624 = io_in_a_bits_param <= 3'h1; // @[Bundles.scala 158:28]
  wire  _T_636 = io_in_d_bits_opcode <= 3'h6; // @[Bundles.scala 42:24]
  wire  _source_ok_T_11 = io_in_d_bits_source == 4'h8; // @[Parameters.scala 46:9]
  wire [1:0] source_ok_uncommonBits_1 = io_in_d_bits_source[1:0]; // @[Parameters.scala 52:64]
  wire  _source_ok_T_13 = io_in_d_bits_source[3:2] == 2'h0; // @[Parameters.scala 54:32]
  wire  _source_ok_T_16 = source_ok_uncommonBits_1 <= 2'h2; // @[Parameters.scala 57:20]
  wire  _source_ok_T_17 = _source_ok_T_13 & _source_ok_T_16; // @[Parameters.scala 56:50]
  wire  _source_ok_T_18 = io_in_d_bits_source == 4'h3; // @[Parameters.scala 46:9]
  wire  _source_ok_T_19 = io_in_d_bits_source == 4'h4; // @[Parameters.scala 46:9]
  wire  source_ok_1 = _source_ok_T_11 | _source_ok_T_17 | _source_ok_T_18 | _source_ok_T_19; // @[Parameters.scala 1125:46]
  wire  _T_640 = io_in_d_bits_opcode == 3'h6; // @[Monitor.scala 310:25]
  wire  _T_644 = io_in_d_bits_size >= 3'h3; // @[Monitor.scala 312:27]
  wire  _T_648 = io_in_d_bits_param == 2'h0; // @[Monitor.scala 313:28]
  wire  _T_652 = ~io_in_d_bits_corrupt; // @[Monitor.scala 314:15]
  wire  _T_656 = ~io_in_d_bits_denied; // @[Monitor.scala 315:15]
  wire  _T_660 = io_in_d_bits_opcode == 3'h4; // @[Monitor.scala 318:25]
  wire  _T_671 = io_in_d_bits_param <= 2'h2; // @[Bundles.scala 102:26]
  wire  _T_675 = io_in_d_bits_param != 2'h2; // @[Monitor.scala 323:28]
  wire  _T_688 = io_in_d_bits_opcode == 3'h5; // @[Monitor.scala 328:25]
  wire  _T_708 = _T_656 | io_in_d_bits_corrupt; // @[Monitor.scala 334:30]
  wire  _T_717 = io_in_d_bits_opcode == 3'h0; // @[Monitor.scala 338:25]
  wire  _T_734 = io_in_d_bits_opcode == 3'h1; // @[Monitor.scala 346:25]
  wire  _T_752 = io_in_d_bits_opcode == 3'h2; // @[Monitor.scala 354:25]
  wire  _T_769 = io_in_b_bits_opcode <= 3'h6; // @[Bundles.scala 40:24]
  wire  _T_773 = io_in_b_bits_source == 4'h8; // @[Parameters.scala 46:9]
  wire [1:0] uncommonBits_11 = io_in_b_bits_source[1:0]; // @[Parameters.scala 52:64]
  wire  _T_782 = io_in_b_bits_source[3:2] == 2'h0; // @[Parameters.scala 54:32]
  wire  _T_785 = uncommonBits_11 <= 2'h2; // @[Parameters.scala 57:20]
  wire  _T_786 = _T_782 & _T_785; // @[Parameters.scala 56:50]
  wire  _T_794 = io_in_b_bits_source == 4'h3; // @[Parameters.scala 46:9]
  wire  _T_802 = io_in_b_bits_source == 4'h4; // @[Parameters.scala 46:9]
  wire [31:0] _address_ok_T = io_in_b_bits_address ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_1 = {1'b0,$signed(_address_ok_T)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_3 = $signed(_address_ok_T_1) & -33'sh10000000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_4 = $signed(_address_ok_T_3) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_5 = io_in_b_bits_address ^ 32'h10000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_6 = {1'b0,$signed(_address_ok_T_5)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_8 = $signed(_address_ok_T_6) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_9 = $signed(_address_ok_T_8) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_10 = io_in_b_bits_address ^ 32'h20000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_11 = {1'b0,$signed(_address_ok_T_10)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_13 = $signed(_address_ok_T_11) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_14 = $signed(_address_ok_T_13) == 33'sh0; // @[Parameters.scala 137:67]
  wire  address_ok = _address_ok_T_4 | _address_ok_T_9 | _address_ok_T_14; // @[Parameters.scala 622:64]
  wire [12:0] _is_aligned_mask_T_4 = 13'h3f << io_in_b_bits_size; // @[package.scala 234:77]
  wire [5:0] is_aligned_mask_1 = ~_is_aligned_mask_T_4[5:0]; // @[package.scala 234:46]
  wire [31:0] _GEN_87 = {{26'd0}, is_aligned_mask_1}; // @[Edges.scala 20:16]
  wire [31:0] _is_aligned_T_1 = io_in_b_bits_address & _GEN_87; // @[Edges.scala 20:16]
  wire  is_aligned_1 = _is_aligned_T_1 == 32'h0; // @[Edges.scala 20:24]
  wire [1:0] mask_sizeOH_shiftAmount_1 = io_in_b_bits_size[1:0]; // @[OneHot.scala 64:49]
  wire [3:0] _mask_sizeOH_T_4 = 4'h1 << mask_sizeOH_shiftAmount_1; // @[OneHot.scala 65:12]
  wire [2:0] mask_sizeOH_1 = _mask_sizeOH_T_4[2:0] | 3'h1; // @[Misc.scala 201:81]
  wire  _mask_T_1 = io_in_b_bits_size >= 3'h3; // @[Misc.scala 205:21]
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
  wire [3:0] _legal_source_T_9 = _T_773 ? 4'h8 : 4'h0; // @[Mux.scala 27:72]
  wire [1:0] _legal_source_T_11 = _T_794 ? 2'h3 : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _legal_source_T_12 = _T_802 ? 3'h4 : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _GEN_88 = {{2'd0}, _legal_source_T_11}; // @[Mux.scala 27:72]
  wire [3:0] _legal_source_T_14 = _legal_source_T_9 | _GEN_88; // @[Mux.scala 27:72]
  wire [3:0] _GEN_89 = {{1'd0}, _legal_source_T_12}; // @[Mux.scala 27:72]
  wire [3:0] _legal_source_T_15 = _legal_source_T_14 | _GEN_89; // @[Mux.scala 27:72]
  wire  legal_source = _legal_source_T_15 == io_in_b_bits_source; // @[Monitor.scala 165:113]
  wire  _T_816 = io_in_b_bits_opcode == 3'h6; // @[Monitor.scala 167:25]
  wire  _T_826 = 3'h6 == io_in_b_bits_size; // @[Parameters.scala 91:48]
  wire  _T_828 = _T_786 & _T_826; // @[Mux.scala 27:72]
  wire  _T_854 = _address_ok_T_14 | _address_ok_T_9 | _address_ok_T_4; // @[Parameters.scala 671:42]
  wire  _T_857 = _T_828 & _T_854; // @[Monitor.scala 168:75]
  wire  _T_863 = ~(address_ok | reset); // @[Monitor.scala 49:11]
  wire  _T_866 = ~(legal_source | reset); // @[Monitor.scala 49:11]
  wire  _T_869 = ~(is_aligned_1 | reset); // @[Monitor.scala 49:11]
  wire  _T_870 = io_in_b_bits_param <= 2'h2; // @[Bundles.scala 102:26]
  wire  _T_874 = io_in_b_bits_mask == mask_1; // @[Monitor.scala 173:27]
  wire  _T_877 = ~(_T_874 | reset); // @[Monitor.scala 49:11]
  wire  _T_878 = ~io_in_b_bits_corrupt; // @[Monitor.scala 174:15]
  wire  _T_881 = ~(_T_878 | reset); // @[Monitor.scala 49:11]
  wire  _T_882 = io_in_b_bits_opcode == 3'h4; // @[Monitor.scala 177:25]
  wire  _T_919 = io_in_b_bits_param == 2'h0; // @[Monitor.scala 182:31]
  wire  _T_931 = io_in_b_bits_opcode == 3'h0; // @[Monitor.scala 187:25]
  wire  _T_976 = io_in_b_bits_opcode == 3'h1; // @[Monitor.scala 196:25]
  wire [7:0] _T_1017 = ~mask_1; // @[Monitor.scala 202:33]
  wire [7:0] _T_1018 = io_in_b_bits_mask & _T_1017; // @[Monitor.scala 202:31]
  wire  _T_1019 = _T_1018 == 8'h0; // @[Monitor.scala 202:40]
  wire  _T_1023 = io_in_b_bits_opcode == 3'h2; // @[Monitor.scala 205:25]
  wire  _T_1068 = io_in_b_bits_opcode == 3'h3; // @[Monitor.scala 214:25]
  wire  _T_1113 = io_in_b_bits_opcode == 3'h5; // @[Monitor.scala 223:25]
  wire  _source_ok_T_22 = io_in_c_bits_source == 4'h8; // @[Parameters.scala 46:9]
  wire [1:0] source_ok_uncommonBits_2 = io_in_c_bits_source[1:0]; // @[Parameters.scala 52:64]
  wire  _source_ok_T_24 = io_in_c_bits_source[3:2] == 2'h0; // @[Parameters.scala 54:32]
  wire  _source_ok_T_27 = source_ok_uncommonBits_2 <= 2'h2; // @[Parameters.scala 57:20]
  wire  _source_ok_T_28 = _source_ok_T_24 & _source_ok_T_27; // @[Parameters.scala 56:50]
  wire  _source_ok_T_29 = io_in_c_bits_source == 4'h3; // @[Parameters.scala 46:9]
  wire  _source_ok_T_30 = io_in_c_bits_source == 4'h4; // @[Parameters.scala 46:9]
  wire  source_ok_2 = _source_ok_T_22 | _source_ok_T_28 | _source_ok_T_29 | _source_ok_T_30; // @[Parameters.scala 1125:46]
  wire [12:0] _is_aligned_mask_T_7 = 13'h3f << io_in_c_bits_size; // @[package.scala 234:77]
  wire [5:0] is_aligned_mask_2 = ~_is_aligned_mask_T_7[5:0]; // @[package.scala 234:46]
  wire [31:0] _GEN_90 = {{26'd0}, is_aligned_mask_2}; // @[Edges.scala 20:16]
  wire [31:0] _is_aligned_T_2 = io_in_c_bits_address & _GEN_90; // @[Edges.scala 20:16]
  wire  is_aligned_2 = _is_aligned_T_2 == 32'h0; // @[Edges.scala 20:24]
  wire [31:0] _address_ok_T_16 = io_in_c_bits_address ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_17 = {1'b0,$signed(_address_ok_T_16)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_19 = $signed(_address_ok_T_17) & -33'sh10000000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_20 = $signed(_address_ok_T_19) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_21 = io_in_c_bits_address ^ 32'h10000000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_22 = {1'b0,$signed(_address_ok_T_21)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_24 = $signed(_address_ok_T_22) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_25 = $signed(_address_ok_T_24) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _address_ok_T_26 = io_in_c_bits_address ^ 32'h20000; // @[Parameters.scala 137:31]
  wire [32:0] _address_ok_T_27 = {1'b0,$signed(_address_ok_T_26)}; // @[Parameters.scala 137:49]
  wire [32:0] _address_ok_T_29 = $signed(_address_ok_T_27) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _address_ok_T_30 = $signed(_address_ok_T_29) == 33'sh0; // @[Parameters.scala 137:67]
  wire  address_ok_1 = _address_ok_T_20 | _address_ok_T_25 | _address_ok_T_30; // @[Parameters.scala 622:64]
  wire  _T_1205 = io_in_c_bits_opcode == 3'h4; // @[Monitor.scala 242:25]
  wire  _T_1212 = io_in_c_bits_size >= 3'h3; // @[Monitor.scala 245:30]
  wire  _T_1219 = io_in_c_bits_param <= 3'h5; // @[Bundles.scala 120:29]
  wire  _T_1223 = ~io_in_c_bits_corrupt; // @[Monitor.scala 248:18]
  wire  _T_1227 = io_in_c_bits_opcode == 3'h5; // @[Monitor.scala 251:25]
  wire  _T_1245 = io_in_c_bits_opcode == 3'h6; // @[Monitor.scala 259:25]
  wire  _T_1264 = io_in_c_bits_size <= 3'h6; // @[Parameters.scala 92:42]
  wire  _T_1283 = _address_ok_T_30 | _address_ok_T_25 | _address_ok_T_20; // @[Parameters.scala 671:42]
  wire  _T_1284 = _T_1264 & _T_1283; // @[Parameters.scala 670:56]
  wire  _T_1286 = source_ok_2 & _T_1284; // @[Monitor.scala 260:78]
  wire  _T_1299 = 3'h6 == io_in_c_bits_size; // @[Parameters.scala 91:48]
  wire  _T_1301 = _source_ok_T_28 & _T_1299; // @[Mux.scala 27:72]
  wire  _T_1330 = _T_1301 & _T_1283; // @[Monitor.scala 261:78]
  wire  _T_1352 = io_in_c_bits_opcode == 3'h7; // @[Monitor.scala 269:25]
  wire  _T_1455 = io_in_c_bits_opcode == 3'h0; // @[Monitor.scala 278:25]
  wire  _T_1465 = io_in_c_bits_param == 3'h0; // @[Monitor.scala 282:31]
  wire  _T_1473 = io_in_c_bits_opcode == 3'h1; // @[Monitor.scala 286:25]
  wire  _T_1487 = io_in_c_bits_opcode == 3'h2; // @[Monitor.scala 293:25]
  wire  _a_first_T = io_in_a_ready & io_in_a_valid; // @[Decoupled.scala 40:37]
  wire [2:0] a_first_beats1_decode = is_aligned_mask[5:3]; // @[Edges.scala 219:59]
  wire  a_first_beats1_opdata = ~io_in_a_bits_opcode[2]; // @[Edges.scala 91:28]
  reg [2:0] a_first_counter; // @[Edges.scala 228:27]
  wire [2:0] a_first_counter1 = a_first_counter - 3'h1; // @[Edges.scala 229:28]
  wire  a_first = a_first_counter == 3'h0; // @[Edges.scala 230:25]
  reg [2:0] opcode; // @[Monitor.scala 384:22]
  reg [2:0] param; // @[Monitor.scala 385:22]
  reg [2:0] size; // @[Monitor.scala 386:22]
  reg [3:0] source; // @[Monitor.scala 387:22]
  reg [31:0] address; // @[Monitor.scala 388:22]
  wire  _T_1509 = io_in_a_valid & ~a_first; // @[Monitor.scala 389:19]
  wire  _T_1510 = io_in_a_bits_opcode == opcode; // @[Monitor.scala 390:32]
  wire  _T_1514 = io_in_a_bits_param == param; // @[Monitor.scala 391:32]
  wire  _T_1518 = io_in_a_bits_size == size; // @[Monitor.scala 392:32]
  wire  _T_1522 = io_in_a_bits_source == source; // @[Monitor.scala 393:32]
  wire  _T_1526 = io_in_a_bits_address == address; // @[Monitor.scala 394:32]
  wire  _d_first_T = io_in_d_ready & io_in_d_valid; // @[Decoupled.scala 40:37]
  wire [12:0] _d_first_beats1_decode_T_1 = 13'h3f << io_in_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _d_first_beats1_decode_T_3 = ~_d_first_beats1_decode_T_1[5:0]; // @[package.scala 234:46]
  wire [2:0] d_first_beats1_decode = _d_first_beats1_decode_T_3[5:3]; // @[Edges.scala 219:59]
  wire  d_first_beats1_opdata = io_in_d_bits_opcode[0]; // @[Edges.scala 105:36]
  reg [2:0] d_first_counter; // @[Edges.scala 228:27]
  wire [2:0] d_first_counter1 = d_first_counter - 3'h1; // @[Edges.scala 229:28]
  wire  d_first = d_first_counter == 3'h0; // @[Edges.scala 230:25]
  reg [2:0] opcode_1; // @[Monitor.scala 535:22]
  reg [1:0] param_1; // @[Monitor.scala 536:22]
  reg [2:0] size_1; // @[Monitor.scala 537:22]
  reg [3:0] source_1; // @[Monitor.scala 538:22]
  reg [1:0] sink; // @[Monitor.scala 539:22]
  reg  denied; // @[Monitor.scala 540:22]
  wire  _T_1533 = io_in_d_valid & ~d_first; // @[Monitor.scala 541:19]
  wire  _T_1534 = io_in_d_bits_opcode == opcode_1; // @[Monitor.scala 542:29]
  wire  _T_1538 = io_in_d_bits_param == param_1; // @[Monitor.scala 543:29]
  wire  _T_1542 = io_in_d_bits_size == size_1; // @[Monitor.scala 544:29]
  wire  _T_1546 = io_in_d_bits_source == source_1; // @[Monitor.scala 545:29]
  wire  _T_1550 = io_in_d_bits_sink == sink; // @[Monitor.scala 546:29]
  wire  _T_1554 = io_in_d_bits_denied == denied; // @[Monitor.scala 547:29]
  wire  b_first_done = io_in_b_ready & io_in_b_valid; // @[Decoupled.scala 40:37]
  reg [2:0] b_first_counter; // @[Edges.scala 228:27]
  wire [2:0] b_first_counter1 = b_first_counter - 3'h1; // @[Edges.scala 229:28]
  wire  b_first = b_first_counter == 3'h0; // @[Edges.scala 230:25]
  reg [2:0] opcode_2; // @[Monitor.scala 407:22]
  reg [1:0] param_2; // @[Monitor.scala 408:22]
  reg [2:0] size_2; // @[Monitor.scala 409:22]
  reg [3:0] source_2; // @[Monitor.scala 410:22]
  reg [31:0] address_1; // @[Monitor.scala 411:22]
  wire  _T_1561 = io_in_b_valid & ~b_first; // @[Monitor.scala 412:19]
  wire  _T_1562 = io_in_b_bits_opcode == opcode_2; // @[Monitor.scala 413:32]
  wire  _T_1566 = io_in_b_bits_param == param_2; // @[Monitor.scala 414:32]
  wire  _T_1570 = io_in_b_bits_size == size_2; // @[Monitor.scala 415:32]
  wire  _T_1574 = io_in_b_bits_source == source_2; // @[Monitor.scala 416:32]
  wire  _T_1578 = io_in_b_bits_address == address_1; // @[Monitor.scala 417:32]
  wire  _c_first_T = io_in_c_ready & io_in_c_valid; // @[Decoupled.scala 40:37]
  wire [2:0] c_first_beats1_decode = is_aligned_mask_2[5:3]; // @[Edges.scala 219:59]
  wire  c_first_beats1_opdata = io_in_c_bits_opcode[0]; // @[Edges.scala 101:36]
  reg [2:0] c_first_counter; // @[Edges.scala 228:27]
  wire [2:0] c_first_counter1 = c_first_counter - 3'h1; // @[Edges.scala 229:28]
  wire  c_first = c_first_counter == 3'h0; // @[Edges.scala 230:25]
  reg [2:0] opcode_3; // @[Monitor.scala 512:22]
  reg [2:0] param_3; // @[Monitor.scala 513:22]
  reg [2:0] size_3; // @[Monitor.scala 514:22]
  reg [3:0] source_3; // @[Monitor.scala 515:22]
  reg [31:0] address_2; // @[Monitor.scala 516:22]
  wire  _T_1585 = io_in_c_valid & ~c_first; // @[Monitor.scala 517:19]
  wire  _T_1586 = io_in_c_bits_opcode == opcode_3; // @[Monitor.scala 518:32]
  wire  _T_1590 = io_in_c_bits_param == param_3; // @[Monitor.scala 519:32]
  wire  _T_1594 = io_in_c_bits_size == size_3; // @[Monitor.scala 520:32]
  wire  _T_1598 = io_in_c_bits_source == source_3; // @[Monitor.scala 521:32]
  wire  _T_1602 = io_in_c_bits_address == address_2; // @[Monitor.scala 522:32]
  reg [8:0] inflight; // @[Monitor.scala 611:27]
  reg [35:0] inflight_opcodes; // @[Monitor.scala 613:35]
  reg [35:0] inflight_sizes; // @[Monitor.scala 615:33]
  reg [2:0] a_first_counter_1; // @[Edges.scala 228:27]
  wire [2:0] a_first_counter1_1 = a_first_counter_1 - 3'h1; // @[Edges.scala 229:28]
  wire  a_first_1 = a_first_counter_1 == 3'h0; // @[Edges.scala 230:25]
  reg [2:0] d_first_counter_1; // @[Edges.scala 228:27]
  wire [2:0] d_first_counter1_1 = d_first_counter_1 - 3'h1; // @[Edges.scala 229:28]
  wire  d_first_1 = d_first_counter_1 == 3'h0; // @[Edges.scala 230:25]
  wire [5:0] _GEN_91 = {io_in_d_bits_source, 2'h0}; // @[Monitor.scala 634:69]
  wire [6:0] _a_opcode_lookup_T = {{1'd0}, _GEN_91}; // @[Monitor.scala 634:69]
  wire [35:0] _a_opcode_lookup_T_1 = inflight_opcodes >> _a_opcode_lookup_T; // @[Monitor.scala 634:44]
  wire [15:0] _a_opcode_lookup_T_5 = 16'h10 - 16'h1; // @[Monitor.scala 609:57]
  wire [35:0] _GEN_92 = {{20'd0}, _a_opcode_lookup_T_5}; // @[Monitor.scala 634:97]
  wire [35:0] _a_opcode_lookup_T_6 = _a_opcode_lookup_T_1 & _GEN_92; // @[Monitor.scala 634:97]
  wire [35:0] _a_opcode_lookup_T_7 = {{1'd0}, _a_opcode_lookup_T_6[35:1]}; // @[Monitor.scala 634:152]
  wire [35:0] _a_size_lookup_T_1 = inflight_sizes >> _a_opcode_lookup_T; // @[Monitor.scala 638:40]
  wire [35:0] _a_size_lookup_T_6 = _a_size_lookup_T_1 & _GEN_92; // @[Monitor.scala 638:91]
  wire [35:0] _a_size_lookup_T_7 = {{1'd0}, _a_size_lookup_T_6[35:1]}; // @[Monitor.scala 638:144]
  wire  _T_1608 = io_in_a_valid & a_first_1; // @[Monitor.scala 648:26]
  wire [15:0] _a_set_wo_ready_T = 16'h1 << io_in_a_bits_source; // @[OneHot.scala 58:35]
  wire [15:0] _GEN_27 = io_in_a_valid & a_first_1 ? _a_set_wo_ready_T : 16'h0; // @[Monitor.scala 648:71 Monitor.scala 649:22]
  wire  _T_1611 = _a_first_T & a_first_1; // @[Monitor.scala 652:27]
  wire [3:0] _a_opcodes_set_interm_T = {io_in_a_bits_opcode, 1'h0}; // @[Monitor.scala 654:53]
  wire [3:0] _a_opcodes_set_interm_T_1 = _a_opcodes_set_interm_T | 4'h1; // @[Monitor.scala 654:61]
  wire [3:0] _a_sizes_set_interm_T = {io_in_a_bits_size, 1'h0}; // @[Monitor.scala 655:51]
  wire [3:0] _a_sizes_set_interm_T_1 = _a_sizes_set_interm_T | 4'h1; // @[Monitor.scala 655:59]
  wire [5:0] _GEN_97 = {io_in_a_bits_source, 2'h0}; // @[Monitor.scala 656:79]
  wire [6:0] _a_opcodes_set_T = {{1'd0}, _GEN_97}; // @[Monitor.scala 656:79]
  wire [3:0] a_opcodes_set_interm = _a_first_T & a_first_1 ? _a_opcodes_set_interm_T_1 : 4'h0; // @[Monitor.scala 652:72 Monitor.scala 654:28]
  wire [130:0] _GEN_98 = {{127'd0}, a_opcodes_set_interm}; // @[Monitor.scala 656:54]
  wire [130:0] _a_opcodes_set_T_1 = _GEN_98 << _a_opcodes_set_T; // @[Monitor.scala 656:54]
  wire [3:0] a_sizes_set_interm = _a_first_T & a_first_1 ? _a_sizes_set_interm_T_1 : 4'h0; // @[Monitor.scala 652:72 Monitor.scala 655:28]
  wire [130:0] _GEN_100 = {{127'd0}, a_sizes_set_interm}; // @[Monitor.scala 657:52]
  wire [130:0] _a_sizes_set_T_1 = _GEN_100 << _a_opcodes_set_T; // @[Monitor.scala 657:52]
  wire [8:0] _T_1613 = inflight >> io_in_a_bits_source; // @[Monitor.scala 658:26]
  wire  _T_1615 = ~_T_1613[0]; // @[Monitor.scala 658:17]
  wire [15:0] _GEN_28 = _a_first_T & a_first_1 ? _a_set_wo_ready_T : 16'h0; // @[Monitor.scala 652:72 Monitor.scala 653:28]
  wire [130:0] _GEN_31 = _a_first_T & a_first_1 ? _a_opcodes_set_T_1 : 131'h0; // @[Monitor.scala 652:72 Monitor.scala 656:28]
  wire [130:0] _GEN_32 = _a_first_T & a_first_1 ? _a_sizes_set_T_1 : 131'h0; // @[Monitor.scala 652:72 Monitor.scala 657:28]
  wire  _T_1619 = io_in_d_valid & d_first_1; // @[Monitor.scala 671:26]
  wire  _T_1621 = ~_T_640; // @[Monitor.scala 671:74]
  wire  _T_1622 = io_in_d_valid & d_first_1 & ~_T_640; // @[Monitor.scala 671:71]
  wire [15:0] _d_clr_wo_ready_T = 16'h1 << io_in_d_bits_source; // @[OneHot.scala 58:35]
  wire [15:0] _GEN_33 = io_in_d_valid & d_first_1 & ~_T_640 ? _d_clr_wo_ready_T : 16'h0; // @[Monitor.scala 671:90 Monitor.scala 672:22]
  wire [142:0] _GEN_102 = {{127'd0}, _a_opcode_lookup_T_5}; // @[Monitor.scala 677:76]
  wire [142:0] _d_opcodes_clr_T_5 = _GEN_102 << _a_opcode_lookup_T; // @[Monitor.scala 677:76]
  wire [15:0] _GEN_34 = _d_first_T & d_first_1 & _T_1621 ? _d_clr_wo_ready_T : 16'h0; // @[Monitor.scala 675:91 Monitor.scala 676:21]
  wire [142:0] _GEN_35 = _d_first_T & d_first_1 & _T_1621 ? _d_opcodes_clr_T_5 : 143'h0; // @[Monitor.scala 675:91 Monitor.scala 677:21]
  wire  _same_cycle_resp_T_2 = io_in_a_bits_source == io_in_d_bits_source; // @[Monitor.scala 681:113]
  wire  same_cycle_resp = _T_1608 & io_in_a_bits_source == io_in_d_bits_source; // @[Monitor.scala 681:88]
  wire [8:0] _T_1632 = inflight >> io_in_d_bits_source; // @[Monitor.scala 682:25]
  wire  _T_1634 = _T_1632[0] | same_cycle_resp; // @[Monitor.scala 682:49]
  wire [2:0] _GEN_39 = 3'h2 == io_in_a_bits_opcode ? 3'h1 : 3'h0; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_40 = 3'h3 == io_in_a_bits_opcode ? 3'h1 : _GEN_39; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_41 = 3'h4 == io_in_a_bits_opcode ? 3'h1 : _GEN_40; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_42 = 3'h5 == io_in_a_bits_opcode ? 3'h2 : _GEN_41; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_43 = 3'h6 == io_in_a_bits_opcode ? 3'h4 : _GEN_42; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_44 = 3'h7 == io_in_a_bits_opcode ? 3'h4 : _GEN_43; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_51 = 3'h6 == io_in_a_bits_opcode ? 3'h5 : _GEN_42; // @[Monitor.scala 686:39 Monitor.scala 686:39]
  wire [2:0] _GEN_52 = 3'h7 == io_in_a_bits_opcode ? 3'h4 : _GEN_51; // @[Monitor.scala 686:39 Monitor.scala 686:39]
  wire  _T_1639 = io_in_d_bits_opcode == _GEN_52; // @[Monitor.scala 686:39]
  wire  _T_1640 = io_in_d_bits_opcode == _GEN_44 | _T_1639; // @[Monitor.scala 685:77]
  wire  _T_1644 = io_in_a_bits_size == io_in_d_bits_size; // @[Monitor.scala 687:36]
  wire [3:0] a_opcode_lookup = _a_opcode_lookup_T_7[3:0];
  wire [2:0] _GEN_55 = 3'h2 == a_opcode_lookup[2:0] ? 3'h1 : 3'h0; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_56 = 3'h3 == a_opcode_lookup[2:0] ? 3'h1 : _GEN_55; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_57 = 3'h4 == a_opcode_lookup[2:0] ? 3'h1 : _GEN_56; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_58 = 3'h5 == a_opcode_lookup[2:0] ? 3'h2 : _GEN_57; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_59 = 3'h6 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_58; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_60 = 3'h7 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_59; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_67 = 3'h6 == a_opcode_lookup[2:0] ? 3'h5 : _GEN_58; // @[Monitor.scala 690:38 Monitor.scala 690:38]
  wire [2:0] _GEN_68 = 3'h7 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_67; // @[Monitor.scala 690:38 Monitor.scala 690:38]
  wire  _T_1651 = io_in_d_bits_opcode == _GEN_68; // @[Monitor.scala 690:38]
  wire  _T_1652 = io_in_d_bits_opcode == _GEN_60 | _T_1651; // @[Monitor.scala 689:72]
  wire [3:0] a_size_lookup = _a_size_lookup_T_7[3:0];
  wire [3:0] _GEN_105 = {{1'd0}, io_in_d_bits_size}; // @[Monitor.scala 691:36]
  wire  _T_1656 = _GEN_105 == a_size_lookup; // @[Monitor.scala 691:36]
  wire  _T_1666 = _T_1619 & a_first_1 & io_in_a_valid & _same_cycle_resp_T_2 & _T_1621; // @[Monitor.scala 694:116]
  wire  _T_1667 = ~io_in_d_ready; // @[Monitor.scala 695:15]
  wire  _T_1668 = ~io_in_d_ready | io_in_a_ready; // @[Monitor.scala 695:32]
  wire [8:0] a_set_wo_ready = _GEN_27[8:0];
  wire [8:0] d_clr_wo_ready = _GEN_33[8:0];
  wire  _T_1675 = a_set_wo_ready != d_clr_wo_ready | ~(|a_set_wo_ready); // @[Monitor.scala 699:48]
  wire [8:0] a_set = _GEN_28[8:0];
  wire [8:0] _inflight_T = inflight | a_set; // @[Monitor.scala 702:27]
  wire [8:0] d_clr = _GEN_34[8:0];
  wire [8:0] _inflight_T_1 = ~d_clr; // @[Monitor.scala 702:38]
  wire [8:0] _inflight_T_2 = _inflight_T & _inflight_T_1; // @[Monitor.scala 702:36]
  wire [35:0] a_opcodes_set = _GEN_31[35:0];
  wire [35:0] _inflight_opcodes_T = inflight_opcodes | a_opcodes_set; // @[Monitor.scala 703:43]
  wire [35:0] d_opcodes_clr = _GEN_35[35:0];
  wire [35:0] _inflight_opcodes_T_1 = ~d_opcodes_clr; // @[Monitor.scala 703:62]
  wire [35:0] _inflight_opcodes_T_2 = _inflight_opcodes_T & _inflight_opcodes_T_1; // @[Monitor.scala 703:60]
  wire [35:0] a_sizes_set = _GEN_32[35:0];
  wire [35:0] _inflight_sizes_T = inflight_sizes | a_sizes_set; // @[Monitor.scala 704:39]
  wire [35:0] _inflight_sizes_T_2 = _inflight_sizes_T & _inflight_opcodes_T_1; // @[Monitor.scala 704:54]
  reg [31:0] watchdog; // @[Monitor.scala 706:27]
  wire  _T_1684 = ~(|inflight) | plusarg_reader_out == 32'h0 | watchdog < plusarg_reader_out; // @[Monitor.scala 709:47]
  wire [31:0] _watchdog_T_1 = watchdog + 32'h1; // @[Monitor.scala 711:26]
  reg [8:0] inflight_1; // @[Monitor.scala 723:35]
  reg [35:0] inflight_sizes_1; // @[Monitor.scala 725:35]
  reg [2:0] c_first_counter_1; // @[Edges.scala 228:27]
  wire [2:0] c_first_counter1_1 = c_first_counter_1 - 3'h1; // @[Edges.scala 229:28]
  wire  c_first_1 = c_first_counter_1 == 3'h0; // @[Edges.scala 230:25]
  reg [2:0] d_first_counter_2; // @[Edges.scala 228:27]
  wire [2:0] d_first_counter1_2 = d_first_counter_2 - 3'h1; // @[Edges.scala 229:28]
  wire  d_first_2 = d_first_counter_2 == 3'h0; // @[Edges.scala 230:25]
  wire [35:0] _c_size_lookup_T_1 = inflight_sizes_1 >> _a_opcode_lookup_T; // @[Monitor.scala 747:42]
  wire [35:0] _c_size_lookup_T_6 = _c_size_lookup_T_1 & _GEN_92; // @[Monitor.scala 747:93]
  wire [35:0] _c_size_lookup_T_7 = {{1'd0}, _c_size_lookup_T_6[35:1]}; // @[Monitor.scala 747:146]
  wire  _T_1694 = io_in_c_bits_opcode[2] & io_in_c_bits_opcode[1]; // @[Edges.scala 67:40]
  wire  _T_1695 = io_in_c_valid & c_first_1 & _T_1694; // @[Monitor.scala 756:37]
  wire [15:0] _c_set_wo_ready_T = 16'h1 << io_in_c_bits_source; // @[OneHot.scala 58:35]
  wire [15:0] _GEN_72 = io_in_c_valid & c_first_1 & _T_1694 ? _c_set_wo_ready_T : 16'h0; // @[Monitor.scala 756:71 Monitor.scala 757:22]
  wire  _T_1701 = _c_first_T & c_first_1 & _T_1694; // @[Monitor.scala 760:38]
  wire [3:0] _c_sizes_set_interm_T = {io_in_c_bits_size, 1'h0}; // @[Monitor.scala 763:51]
  wire [3:0] _c_sizes_set_interm_T_1 = _c_sizes_set_interm_T | 4'h1; // @[Monitor.scala 763:59]
  wire [5:0] _GEN_112 = {io_in_c_bits_source, 2'h0}; // @[Monitor.scala 764:79]
  wire [6:0] _c_opcodes_set_T = {{1'd0}, _GEN_112}; // @[Monitor.scala 764:79]
  wire [3:0] c_sizes_set_interm = _c_first_T & c_first_1 & _T_1694 ? _c_sizes_set_interm_T_1 : 4'h0; // @[Monitor.scala 760:72 Monitor.scala 763:28]
  wire [130:0] _GEN_115 = {{127'd0}, c_sizes_set_interm}; // @[Monitor.scala 765:52]
  wire [130:0] _c_sizes_set_T_1 = _GEN_115 << _c_opcodes_set_T; // @[Monitor.scala 765:52]
  wire [8:0] _T_1702 = inflight_1 >> io_in_c_bits_source; // @[Monitor.scala 766:26]
  wire  _T_1704 = ~_T_1702[0]; // @[Monitor.scala 766:17]
  wire [15:0] _GEN_73 = _c_first_T & c_first_1 & _T_1694 ? _c_set_wo_ready_T : 16'h0; // @[Monitor.scala 760:72 Monitor.scala 761:28]
  wire [130:0] _GEN_77 = _c_first_T & c_first_1 & _T_1694 ? _c_sizes_set_T_1 : 131'h0; // @[Monitor.scala 760:72 Monitor.scala 765:28]
  wire  _T_1708 = io_in_d_valid & d_first_2; // @[Monitor.scala 779:26]
  wire  _T_1710 = io_in_d_valid & d_first_2 & _T_640; // @[Monitor.scala 779:71]
  wire [15:0] _GEN_78 = io_in_d_valid & d_first_2 & _T_640 ? _d_clr_wo_ready_T : 16'h0; // @[Monitor.scala 779:89 Monitor.scala 780:22]
  wire [15:0] _GEN_79 = _d_first_T & d_first_2 & _T_640 ? _d_clr_wo_ready_T : 16'h0; // @[Monitor.scala 783:90 Monitor.scala 784:21]
  wire [142:0] _GEN_80 = _d_first_T & d_first_2 & _T_640 ? _d_opcodes_clr_T_5 : 143'h0; // @[Monitor.scala 783:90 Monitor.scala 785:21]
  wire  _same_cycle_resp_T_8 = io_in_c_bits_source == io_in_d_bits_source; // @[Monitor.scala 790:113]
  wire  same_cycle_resp_1 = _T_1695 & io_in_c_bits_source == io_in_d_bits_source; // @[Monitor.scala 790:88]
  wire [8:0] _T_1718 = inflight_1 >> io_in_d_bits_source; // @[Monitor.scala 791:25]
  wire  _T_1720 = _T_1718[0] | same_cycle_resp_1; // @[Monitor.scala 791:49]
  wire  _T_1724 = io_in_d_bits_size == io_in_c_bits_size; // @[Monitor.scala 793:36]
  wire [3:0] c_size_lookup = _c_size_lookup_T_7[3:0];
  wire  _T_1728 = _GEN_105 == c_size_lookup; // @[Monitor.scala 795:36]
  wire  _T_1737 = _T_1708 & c_first_1 & io_in_c_valid & _same_cycle_resp_T_8 & _T_640; // @[Monitor.scala 799:116]
  wire  _T_1739 = _T_1667 | io_in_c_ready; // @[Monitor.scala 800:32]
  wire [8:0] c_set_wo_ready = _GEN_72[8:0];
  wire  _T_1743 = |c_set_wo_ready; // @[Monitor.scala 804:28]
  wire [8:0] d_clr_wo_ready_1 = _GEN_78[8:0];
  wire  _T_1744 = c_set_wo_ready != d_clr_wo_ready_1; // @[Monitor.scala 805:31]
  wire [8:0] c_set = _GEN_73[8:0];
  wire [8:0] _inflight_T_3 = inflight_1 | c_set; // @[Monitor.scala 809:35]
  wire [8:0] d_clr_1 = _GEN_79[8:0];
  wire [8:0] _inflight_T_4 = ~d_clr_1; // @[Monitor.scala 809:46]
  wire [8:0] _inflight_T_5 = _inflight_T_3 & _inflight_T_4; // @[Monitor.scala 809:44]
  wire [35:0] d_opcodes_clr_1 = _GEN_80[35:0];
  wire [35:0] _inflight_opcodes_T_4 = ~d_opcodes_clr_1; // @[Monitor.scala 810:62]
  wire [35:0] c_sizes_set = _GEN_77[35:0];
  wire [35:0] _inflight_sizes_T_3 = inflight_sizes_1 | c_sizes_set; // @[Monitor.scala 811:41]
  wire [35:0] _inflight_sizes_T_5 = _inflight_sizes_T_3 & _inflight_opcodes_T_4; // @[Monitor.scala 811:56]
  reg [31:0] watchdog_1; // @[Monitor.scala 813:27]
  wire  _T_1753 = ~(|inflight_1) | plusarg_reader_1_out == 32'h0 | watchdog_1 < plusarg_reader_1_out; // @[Monitor.scala 816:47]
  wire [31:0] _watchdog_T_3 = watchdog_1 + 32'h1; // @[Monitor.scala 818:26]
  reg [3:0] inflight_2; // @[Monitor.scala 823:27]
  reg [2:0] d_first_counter_3; // @[Edges.scala 228:27]
  wire [2:0] d_first_counter1_3 = d_first_counter_3 - 3'h1; // @[Edges.scala 229:28]
  wire  d_first_3 = d_first_counter_3 == 3'h0; // @[Edges.scala 230:25]
  wire  _T_1765 = io_in_d_bits_opcode[2] & ~io_in_d_bits_opcode[1]; // @[Edges.scala 70:40]
  wire  _T_1766 = _d_first_T & d_first_3 & _T_1765; // @[Monitor.scala 829:38]
  wire [3:0] _d_set_T = 4'h1 << io_in_d_bits_sink; // @[OneHot.scala 58:35]
  wire [3:0] _T_1767 = inflight_2 >> io_in_d_bits_sink; // @[Monitor.scala 831:23]
  wire  _T_1769 = ~_T_1767[0]; // @[Monitor.scala 831:14]
  wire [3:0] d_set = _d_first_T & d_first_3 & _T_1765 ? _d_set_T : 4'h0; // @[Monitor.scala 829:72 Monitor.scala 830:13]
  wire  _T_1773 = io_in_e_ready & io_in_e_valid; // @[Decoupled.scala 40:37]
  wire [3:0] _e_clr_T = 4'h1 << io_in_e_bits_sink; // @[OneHot.scala 58:35]
  wire [3:0] _T_1776 = d_set | inflight_2; // @[Monitor.scala 837:24]
  wire [3:0] _T_1777 = _T_1776 >> io_in_e_bits_sink; // @[Monitor.scala 837:35]
  wire [3:0] e_clr = _T_1773 ? _e_clr_T : 4'h0; // @[Monitor.scala 835:73 Monitor.scala 836:13]
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
      a_first_counter <= 3'h0; // @[Edges.scala 228:27]
    end else if (_a_first_T) begin // @[Edges.scala 234:17]
      if (a_first) begin // @[Edges.scala 235:21]
        if (a_first_beats1_opdata) begin // @[Edges.scala 220:14]
          a_first_counter <= a_first_beats1_decode;
        end else begin
          a_first_counter <= 3'h0;
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
      d_first_counter <= 3'h0; // @[Edges.scala 228:27]
    end else if (_d_first_T) begin // @[Edges.scala 234:17]
      if (d_first) begin // @[Edges.scala 235:21]
        if (d_first_beats1_opdata) begin // @[Edges.scala 220:14]
          d_first_counter <= d_first_beats1_decode;
        end else begin
          d_first_counter <= 3'h0;
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
      b_first_counter <= 3'h0; // @[Edges.scala 228:27]
    end else if (b_first_done) begin // @[Edges.scala 234:17]
      if (b_first) begin // @[Edges.scala 235:21]
        b_first_counter <= 3'h0;
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
      c_first_counter <= 3'h0; // @[Edges.scala 228:27]
    end else if (_c_first_T) begin // @[Edges.scala 234:17]
      if (c_first) begin // @[Edges.scala 235:21]
        if (c_first_beats1_opdata) begin // @[Edges.scala 220:14]
          c_first_counter <= c_first_beats1_decode;
        end else begin
          c_first_counter <= 3'h0;
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
      inflight <= 9'h0; // @[Monitor.scala 611:27]
    end else begin
      inflight <= _inflight_T_2; // @[Monitor.scala 702:14]
    end
    if (reset) begin // @[Monitor.scala 613:35]
      inflight_opcodes <= 36'h0; // @[Monitor.scala 613:35]
    end else begin
      inflight_opcodes <= _inflight_opcodes_T_2; // @[Monitor.scala 703:22]
    end
    if (reset) begin // @[Monitor.scala 615:33]
      inflight_sizes <= 36'h0; // @[Monitor.scala 615:33]
    end else begin
      inflight_sizes <= _inflight_sizes_T_2; // @[Monitor.scala 704:20]
    end
    if (reset) begin // @[Edges.scala 228:27]
      a_first_counter_1 <= 3'h0; // @[Edges.scala 228:27]
    end else if (_a_first_T) begin // @[Edges.scala 234:17]
      if (a_first_1) begin // @[Edges.scala 235:21]
        if (a_first_beats1_opdata) begin // @[Edges.scala 220:14]
          a_first_counter_1 <= a_first_beats1_decode;
        end else begin
          a_first_counter_1 <= 3'h0;
        end
      end else begin
        a_first_counter_1 <= a_first_counter1_1;
      end
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_first_counter_1 <= 3'h0; // @[Edges.scala 228:27]
    end else if (_d_first_T) begin // @[Edges.scala 234:17]
      if (d_first_1) begin // @[Edges.scala 235:21]
        if (d_first_beats1_opdata) begin // @[Edges.scala 220:14]
          d_first_counter_1 <= d_first_beats1_decode;
        end else begin
          d_first_counter_1 <= 3'h0;
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
      inflight_1 <= 9'h0; // @[Monitor.scala 723:35]
    end else begin
      inflight_1 <= _inflight_T_5; // @[Monitor.scala 809:22]
    end
    if (reset) begin // @[Monitor.scala 725:35]
      inflight_sizes_1 <= 36'h0; // @[Monitor.scala 725:35]
    end else begin
      inflight_sizes_1 <= _inflight_sizes_T_5; // @[Monitor.scala 811:22]
    end
    if (reset) begin // @[Edges.scala 228:27]
      c_first_counter_1 <= 3'h0; // @[Edges.scala 228:27]
    end else if (_c_first_T) begin // @[Edges.scala 234:17]
      if (c_first_1) begin // @[Edges.scala 235:21]
        if (c_first_beats1_opdata) begin // @[Edges.scala 220:14]
          c_first_counter_1 <= c_first_beats1_decode;
        end else begin
          c_first_counter_1 <= 3'h0;
        end
      end else begin
        c_first_counter_1 <= c_first_counter1_1;
      end
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_first_counter_2 <= 3'h0; // @[Edges.scala 228:27]
    end else if (_d_first_T) begin // @[Edges.scala 234:17]
      if (d_first_2) begin // @[Edges.scala 235:21]
        if (d_first_beats1_opdata) begin // @[Edges.scala 220:14]
          d_first_counter_2 <= d_first_beats1_decode;
        end else begin
          d_first_counter_2 <= 3'h0;
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
      d_first_counter_3 <= 3'h0; // @[Edges.scala 228:27]
    end else if (_d_first_T) begin // @[Edges.scala 234:17]
      if (d_first_3) begin // @[Edges.scala 235:21]
        if (d_first_beats1_opdata) begin // @[Edges.scala 220:14]
          d_first_counter_3 <= d_first_beats1_decode;
        end else begin
          d_first_counter_3 <= 3'h0;
        end
      end else begin
        d_first_counter_3 <= d_first_counter1_3;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_47 & ~(_T_88 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquireBlock type which is unexpected using diplomatic parameters (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_47 & ~(_T_88 | reset)) begin
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
        if (io_in_a_valid & _T_47 & ~(_T_132 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_47 & ~(_T_132 | reset)) begin
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
        if (io_in_a_valid & _T_47 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_47 & ~(source_ok | reset)) begin
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
        if (io_in_a_valid & _T_47 & ~(_mask_T | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_47 & ~(_mask_T | reset)) begin
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
        if (io_in_a_valid & _T_47 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_47 & ~(is_aligned | reset)) begin
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
        if (io_in_a_valid & _T_47 & ~(_T_146 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_47 & ~(_T_146 | reset)) begin
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
        if (io_in_a_valid & _T_47 & ~(_T_151 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_47 & ~(_T_151 | reset)) begin
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
        if (io_in_a_valid & _T_47 & ~(_T_155 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_47 & ~(_T_155 | reset)) begin
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
        if (io_in_a_valid & _T_159 & ~(_T_88 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquirePerm type which is unexpected using diplomatic parameters (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_159 & ~(_T_88 | reset)) begin
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
        if (io_in_a_valid & _T_159 & ~(_T_132 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_159 & ~(_T_132 | reset)) begin
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
        if (io_in_a_valid & _T_159 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_159 & ~(source_ok | reset)) begin
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
        if (io_in_a_valid & _T_159 & ~(_mask_T | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_159 & ~(_mask_T | reset)) begin
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
        if (io_in_a_valid & _T_159 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_159 & ~(is_aligned | reset)) begin
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
        if (io_in_a_valid & _T_159 & ~(_T_146 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_159 & ~(_T_146 | reset)) begin
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
        if (io_in_a_valid & _T_159 & ~(_T_262 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_159 & ~(_T_262 | reset)) begin
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
        if (io_in_a_valid & _T_159 & ~(_T_151 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_159 & ~(_T_151 | reset)) begin
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
        if (io_in_a_valid & _T_159 & ~(_T_155 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_159 & ~(_T_155 | reset)) begin
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
        if (io_in_a_valid & _T_275 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Get type which master claims it can't emit (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_275 & ~(source_ok | reset)) begin
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
        if (io_in_a_valid & _T_275 & ~(_T_86 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_275 & ~(_T_86 | reset)) begin
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
        if (io_in_a_valid & _T_275 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_275 & ~(source_ok | reset)) begin
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
        if (io_in_a_valid & _T_275 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_275 & ~(is_aligned | reset)) begin
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
        if (io_in_a_valid & _T_275 & ~(_T_328 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_275 & ~(_T_328 | reset)) begin
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
        if (io_in_a_valid & _T_275 & ~(_T_332 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_275 & ~(_T_332 | reset)) begin
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
        if (io_in_a_valid & _T_275 & ~(_T_155 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_275 & ~(_T_155 | reset)) begin
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
        if (io_in_a_valid & _T_340 & ~(_T_383 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries PutFull type which is unexpected using diplomatic parameters (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_340 & ~(_T_383 | reset)) begin
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
        if (io_in_a_valid & _T_340 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_340 & ~(source_ok | reset)) begin
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
        if (io_in_a_valid & _T_340 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_340 & ~(is_aligned | reset)) begin
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
        if (io_in_a_valid & _T_340 & ~(_T_328 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_340 & ~(_T_328 | reset)) begin
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
        if (io_in_a_valid & _T_340 & ~(_T_332 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_340 & ~(_T_332 | reset)) begin
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
        if (io_in_a_valid & _T_401 & ~(_T_383 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_401 & ~(_T_383 | reset)) begin
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
        if (io_in_a_valid & _T_401 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_401 & ~(source_ok | reset)) begin
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
        if (io_in_a_valid & _T_401 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_401 & ~(is_aligned | reset)) begin
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
        if (io_in_a_valid & _T_401 & ~(_T_328 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_401 & ~(_T_328 | reset)) begin
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
        if (io_in_a_valid & _T_401 & ~(_T_460 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_401 & ~(_T_460 | reset)) begin
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
        if (io_in_a_valid & _T_464 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Arithmetic type which is unexpected using diplomatic parameters (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_464 & ~reset) begin
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
        if (io_in_a_valid & _T_464 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_464 & ~(source_ok | reset)) begin
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
        if (io_in_a_valid & _T_464 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_464 & ~(is_aligned | reset)) begin
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
        if (io_in_a_valid & _T_464 & ~(_T_512 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_464 & ~(_T_512 | reset)) begin
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
        if (io_in_a_valid & _T_464 & ~(_T_332 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_464 & ~(_T_332 | reset)) begin
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
        if (io_in_a_valid & _T_520 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Logical type which is unexpected using diplomatic parameters (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_520 & ~reset) begin
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
        if (io_in_a_valid & _T_520 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_520 & ~(source_ok | reset)) begin
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
        if (io_in_a_valid & _T_520 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_520 & ~(is_aligned | reset)) begin
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
        if (io_in_a_valid & _T_520 & ~(_T_568 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical carries invalid opcode param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_520 & ~(_T_568 | reset)) begin
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
        if (io_in_a_valid & _T_520 & ~(_T_332 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_520 & ~(_T_332 | reset)) begin
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
        if (io_in_a_valid & _T_576 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Hint type which is unexpected using diplomatic parameters (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_576 & ~reset) begin
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
        if (io_in_a_valid & _T_576 & ~(source_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_576 & ~(source_ok | reset)) begin
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
        if (io_in_a_valid & _T_576 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_576 & ~(is_aligned | reset)) begin
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
        if (io_in_a_valid & _T_576 & ~(_T_624 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint carries invalid opcode param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_576 & ~(_T_624 | reset)) begin
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
        if (io_in_a_valid & _T_576 & ~(_T_332 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_576 & ~(_T_332 | reset)) begin
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
        if (io_in_a_valid & _T_576 & ~(_T_155 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_a_valid & _T_576 & ~(_T_155 | reset)) begin
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
        if (io_in_d_valid & ~(_T_636 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel has invalid opcode (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & ~(_T_636 | reset)) begin
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
        if (io_in_d_valid & _T_640 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_640 & ~(source_ok_1 | reset)) begin
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
        if (io_in_d_valid & _T_640 & ~(_T_644 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_640 & ~(_T_644 | reset)) begin
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
        if (io_in_d_valid & _T_640 & ~(_T_648 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_640 & ~(_T_648 | reset)) begin
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
        if (io_in_d_valid & _T_640 & ~(_T_652 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_640 & ~(_T_652 | reset)) begin
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
        if (io_in_d_valid & _T_640 & ~(_T_656 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck is denied (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_640 & ~(_T_656 | reset)) begin
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
        if (io_in_d_valid & _T_660 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_660 & ~(source_ok_1 | reset)) begin
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
        if (io_in_d_valid & _T_660 & ~(_T_644 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant smaller than a beat (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_660 & ~(_T_644 | reset)) begin
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
        if (io_in_d_valid & _T_660 & ~(_T_671 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries invalid cap param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_660 & ~(_T_671 | reset)) begin
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
        if (io_in_d_valid & _T_660 & ~(_T_675 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries toN param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_660 & ~(_T_675 | reset)) begin
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
        if (io_in_d_valid & _T_660 & ~(_T_652 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_660 & ~(_T_652 | reset)) begin
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
        if (io_in_d_valid & _T_688 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_688 & ~(source_ok_1 | reset)) begin
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
        if (io_in_d_valid & _T_688 & ~(_T_644 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData smaller than a beat (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_688 & ~(_T_644 | reset)) begin
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
        if (io_in_d_valid & _T_688 & ~(_T_671 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries invalid cap param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_688 & ~(_T_671 | reset)) begin
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
        if (io_in_d_valid & _T_688 & ~(_T_675 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries toN param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_688 & ~(_T_675 | reset)) begin
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
        if (io_in_d_valid & _T_688 & ~(_T_708 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_688 & ~(_T_708 | reset)) begin
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
        if (io_in_d_valid & _T_717 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_717 & ~(source_ok_1 | reset)) begin
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
        if (io_in_d_valid & _T_717 & ~(_T_648 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_717 & ~(_T_648 | reset)) begin
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
        if (io_in_d_valid & _T_717 & ~(_T_652 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_717 & ~(_T_652 | reset)) begin
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
        if (io_in_d_valid & _T_734 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_734 & ~(source_ok_1 | reset)) begin
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
        if (io_in_d_valid & _T_734 & ~(_T_648 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_734 & ~(_T_648 | reset)) begin
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
        if (io_in_d_valid & _T_734 & ~(_T_708 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_734 & ~(_T_708 | reset)) begin
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
        if (io_in_d_valid & _T_752 & ~(source_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_752 & ~(source_ok_1 | reset)) begin
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
        if (io_in_d_valid & _T_752 & ~(_T_648 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_752 & ~(_T_648 | reset)) begin
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
        if (io_in_d_valid & _T_752 & ~(_T_652 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_752 & ~(_T_652 | reset)) begin
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
        if (io_in_b_valid & ~(_T_769 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel has invalid opcode (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & ~(_T_769 | reset)) begin
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
        if (io_in_b_valid & _T_816 & ~(_T_857 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries Probe type which is unexpected using diplomatic parameters (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_816 & ~(_T_857 | reset)) begin
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
        if (io_in_b_valid & _T_816 & ~(address_ok | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_816 & ~(address_ok | reset)) begin
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
        if (io_in_b_valid & _T_816 & ~(legal_source | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe carries source that is not first source (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_816 & ~(legal_source | reset)) begin
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
        if (io_in_b_valid & _T_816 & ~(is_aligned_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_816 & ~(is_aligned_1 | reset)) begin
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
        if (io_in_b_valid & _T_816 & ~(_T_870 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe carries invalid cap param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_816 & ~(_T_870 | reset)) begin
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
        if (io_in_b_valid & _T_816 & ~(_T_874 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_816 & ~(_T_874 | reset)) begin
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
        if (io_in_b_valid & _T_816 & ~(_T_878 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Probe is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_816 & ~(_T_878 | reset)) begin
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
        if (io_in_b_valid & _T_882 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries Get type which is unexpected using diplomatic parameters (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_882 & ~reset) begin
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
        if (io_in_b_valid & _T_882 & _T_863) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_882 & _T_863) begin
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
        if (io_in_b_valid & _T_882 & _T_866) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get carries source that is not first source (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_882 & _T_866) begin
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
        if (io_in_b_valid & _T_882 & _T_869) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_882 & _T_869) begin
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
        if (io_in_b_valid & _T_882 & ~(_T_919 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_882 & ~(_T_919 | reset)) begin
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
        if (io_in_b_valid & _T_882 & _T_877) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_882 & _T_877) begin
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
        if (io_in_b_valid & _T_882 & _T_881) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Get is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_882 & _T_881) begin
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
        if (io_in_b_valid & _T_931 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries PutFull type which is unexpected using diplomatic parameters (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_931 & ~reset) begin
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
        if (io_in_b_valid & _T_931 & _T_863) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutFull carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_931 & _T_863) begin
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
        if (io_in_b_valid & _T_931 & _T_866) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutFull carries source that is not first source (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_931 & _T_866) begin
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
        if (io_in_b_valid & _T_931 & _T_869) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutFull address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_931 & _T_869) begin
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
        if (io_in_b_valid & _T_931 & ~(_T_919 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutFull carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_931 & ~(_T_919 | reset)) begin
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
        if (io_in_b_valid & _T_931 & _T_877) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutFull contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_931 & _T_877) begin
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
        if (io_in_b_valid & _T_976 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_976 & ~reset) begin
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
        if (io_in_b_valid & _T_976 & _T_863) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutPartial carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_976 & _T_863) begin
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
        if (io_in_b_valid & _T_976 & _T_866) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutPartial carries source that is not first source (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_976 & _T_866) begin
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
        if (io_in_b_valid & _T_976 & _T_869) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutPartial address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_976 & _T_869) begin
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
        if (io_in_b_valid & _T_976 & ~(_T_919 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutPartial carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_976 & ~(_T_919 | reset)) begin
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
        if (io_in_b_valid & _T_976 & ~(_T_1019 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel PutPartial contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_976 & ~(_T_1019 | reset)) begin
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
        if (io_in_b_valid & _T_1023 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries Arithmetic type unsupported by master (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1023 & ~reset) begin
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
        if (io_in_b_valid & _T_1023 & _T_863) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Arithmetic carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1023 & _T_863) begin
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
        if (io_in_b_valid & _T_1023 & _T_866) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Arithmetic carries source that is not first source (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1023 & _T_866) begin
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
        if (io_in_b_valid & _T_1023 & _T_869) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Arithmetic address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1023 & _T_869) begin
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
        if (io_in_b_valid & _T_1023 & _T_877) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Arithmetic contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1023 & _T_877) begin
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
        if (io_in_b_valid & _T_1068 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries Logical type unsupported by client (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1068 & ~reset) begin
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
        if (io_in_b_valid & _T_1068 & _T_863) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Logical carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1068 & _T_863) begin
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
        if (io_in_b_valid & _T_1068 & _T_866) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Logical carries source that is not first source (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1068 & _T_866) begin
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
        if (io_in_b_valid & _T_1068 & _T_869) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Logical address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1068 & _T_869) begin
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
        if (io_in_b_valid & _T_1068 & _T_877) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Logical contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1068 & _T_877) begin
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
        if (io_in_b_valid & _T_1113 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel carries Hint type unsupported by client (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1113 & ~reset) begin
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
        if (io_in_b_valid & _T_1113 & _T_863) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Hint carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1113 & _T_863) begin
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
        if (io_in_b_valid & _T_1113 & _T_866) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Hint carries source that is not first source (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1113 & _T_866) begin
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
        if (io_in_b_valid & _T_1113 & _T_869) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Hint address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1113 & _T_869) begin
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
        if (io_in_b_valid & _T_1113 & _T_877) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Hint contains invalid mask (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1113 & _T_877) begin
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
        if (io_in_b_valid & _T_1113 & _T_881) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel Hint is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_b_valid & _T_1113 & _T_881) begin
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
        if (io_in_c_valid & _T_1205 & ~(address_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1205 & ~(address_ok_1 | reset)) begin
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
        if (io_in_c_valid & _T_1205 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1205 & ~(source_ok_2 | reset)) begin
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
        if (io_in_c_valid & _T_1205 & ~(_T_1212 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck smaller than a beat (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1205 & ~(_T_1212 | reset)) begin
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
        if (io_in_c_valid & _T_1205 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1205 & ~(is_aligned_2 | reset)) begin
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
        if (io_in_c_valid & _T_1205 & ~(_T_1219 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck carries invalid report param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1205 & ~(_T_1219 | reset)) begin
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
        if (io_in_c_valid & _T_1205 & ~(_T_1223 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAck is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1205 & ~(_T_1223 | reset)) begin
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
        if (io_in_c_valid & _T_1227 & ~(address_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAckData carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1227 & ~(address_ok_1 | reset)) begin
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
        if (io_in_c_valid & _T_1227 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAckData carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1227 & ~(source_ok_2 | reset)) begin
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
        if (io_in_c_valid & _T_1227 & ~(_T_1212 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAckData smaller than a beat (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1227 & ~(_T_1212 | reset)) begin
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
        if (io_in_c_valid & _T_1227 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAckData address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1227 & ~(is_aligned_2 | reset)) begin
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
        if (io_in_c_valid & _T_1227 & ~(_T_1219 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ProbeAckData carries invalid report param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1227 & ~(_T_1219 | reset)) begin
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
        if (io_in_c_valid & _T_1245 & ~(_T_1286 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel carries Release type unsupported by manager (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1245 & ~(_T_1286 | reset)) begin
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
        if (io_in_c_valid & _T_1245 & ~(_T_1330 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1245 & ~(_T_1330 | reset)) begin
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
        if (io_in_c_valid & _T_1245 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel Release carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1245 & ~(source_ok_2 | reset)) begin
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
        if (io_in_c_valid & _T_1245 & ~(_T_1212 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel Release smaller than a beat (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1245 & ~(_T_1212 | reset)) begin
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
        if (io_in_c_valid & _T_1245 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel Release address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1245 & ~(is_aligned_2 | reset)) begin
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
        if (io_in_c_valid & _T_1245 & ~(_T_1219 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel Release carries invalid report param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1245 & ~(_T_1219 | reset)) begin
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
        if (io_in_c_valid & _T_1245 & ~(_T_1223 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel Release is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1245 & ~(_T_1223 | reset)) begin
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
        if (io_in_c_valid & _T_1352 & ~(_T_1286 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel carries ReleaseData type unsupported by manager (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1352 & ~(_T_1286 | reset)) begin
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
        if (io_in_c_valid & _T_1352 & ~(_T_1330 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1352 & ~(_T_1330 | reset)) begin
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
        if (io_in_c_valid & _T_1352 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ReleaseData carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1352 & ~(source_ok_2 | reset)) begin
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
        if (io_in_c_valid & _T_1352 & ~(_T_1212 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ReleaseData smaller than a beat (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1352 & ~(_T_1212 | reset)) begin
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
        if (io_in_c_valid & _T_1352 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ReleaseData address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1352 & ~(is_aligned_2 | reset)) begin
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
        if (io_in_c_valid & _T_1352 & ~(_T_1219 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel ReleaseData carries invalid report param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1352 & ~(_T_1219 | reset)) begin
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
        if (io_in_c_valid & _T_1455 & ~(address_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAck carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1455 & ~(address_ok_1 | reset)) begin
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
        if (io_in_c_valid & _T_1455 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAck carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1455 & ~(source_ok_2 | reset)) begin
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
        if (io_in_c_valid & _T_1455 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAck address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1455 & ~(is_aligned_2 | reset)) begin
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
        if (io_in_c_valid & _T_1455 & ~(_T_1465 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAck carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1455 & ~(_T_1465 | reset)) begin
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
        if (io_in_c_valid & _T_1455 & ~(_T_1223 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAck is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1455 & ~(_T_1223 | reset)) begin
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
        if (io_in_c_valid & _T_1473 & ~(address_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAckData carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1473 & ~(address_ok_1 | reset)) begin
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
        if (io_in_c_valid & _T_1473 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAckData carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1473 & ~(source_ok_2 | reset)) begin
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
        if (io_in_c_valid & _T_1473 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAckData address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1473 & ~(is_aligned_2 | reset)) begin
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
        if (io_in_c_valid & _T_1473 & ~(_T_1465 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel AccessAckData carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1473 & ~(_T_1465 | reset)) begin
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
        if (io_in_c_valid & _T_1487 & ~(address_ok_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel HintAck carries unmanaged address (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1487 & ~(address_ok_1 | reset)) begin
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
        if (io_in_c_valid & _T_1487 & ~(source_ok_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel HintAck carries invalid source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1487 & ~(source_ok_2 | reset)) begin
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
        if (io_in_c_valid & _T_1487 & ~(is_aligned_2 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel HintAck address not aligned to size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1487 & ~(is_aligned_2 | reset)) begin
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
        if (io_in_c_valid & _T_1487 & ~(_T_1465 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel HintAck carries invalid param (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1487 & ~(_T_1465 | reset)) begin
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
        if (io_in_c_valid & _T_1487 & ~(_T_1223 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel HintAck is corrupt (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (io_in_c_valid & _T_1487 & ~(_T_1223 | reset)) begin
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
        if (_T_1509 & ~(_T_1510 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel opcode changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1509 & ~(_T_1510 | reset)) begin
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
        if (_T_1509 & ~(_T_1514 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel param changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1509 & ~(_T_1514 | reset)) begin
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
        if (_T_1509 & ~(_T_1518 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel size changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1509 & ~(_T_1518 | reset)) begin
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
        if (_T_1509 & ~(_T_1522 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel source changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1509 & ~(_T_1522 | reset)) begin
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
        if (_T_1509 & ~(_T_1526 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel address changed with multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1509 & ~(_T_1526 | reset)) begin
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
        if (_T_1533 & ~(_T_1534 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel opcode changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1533 & ~(_T_1534 | reset)) begin
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
        if (_T_1533 & ~(_T_1538 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel param changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1533 & ~(_T_1538 | reset)) begin
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
        if (_T_1533 & ~(_T_1542 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel size changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1533 & ~(_T_1542 | reset)) begin
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
        if (_T_1533 & ~(_T_1546 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel source changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1533 & ~(_T_1546 | reset)) begin
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
        if (_T_1533 & ~(_T_1550 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel sink changed with multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1533 & ~(_T_1550 | reset)) begin
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
        if (_T_1533 & ~(_T_1554 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel denied changed with multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1533 & ~(_T_1554 | reset)) begin
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
        if (_T_1561 & ~(_T_1562 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel opcode changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1561 & ~(_T_1562 | reset)) begin
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
        if (_T_1561 & ~(_T_1566 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel param changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1561 & ~(_T_1566 | reset)) begin
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
        if (_T_1561 & ~(_T_1570 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel size changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1561 & ~(_T_1570 | reset)) begin
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
        if (_T_1561 & ~(_T_1574 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel source changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1561 & ~(_T_1574 | reset)) begin
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
        if (_T_1561 & ~(_T_1578 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'B' channel addresss changed with multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1561 & ~(_T_1578 | reset)) begin
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
        if (_T_1585 & ~(_T_1586 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel opcode changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1585 & ~(_T_1586 | reset)) begin
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
        if (_T_1585 & ~(_T_1590 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel param changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1585 & ~(_T_1590 | reset)) begin
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
        if (_T_1585 & ~(_T_1594 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel size changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1585 & ~(_T_1594 | reset)) begin
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
        if (_T_1585 & ~(_T_1598 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel source changed within multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1585 & ~(_T_1598 | reset)) begin
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
        if (_T_1585 & ~(_T_1602 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel address changed with multibeat operation (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1585 & ~(_T_1602 | reset)) begin
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
        if (_T_1611 & ~(_T_1615 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel re-used a source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1611 & ~(_T_1615 | reset)) begin
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
        if (_T_1622 & ~(_T_1634 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel acknowledged for nothing inflight (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1622 & ~(_T_1634 | reset)) begin
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
        if (_T_1622 & same_cycle_resp & ~(_T_1640 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper opcode response (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1622 & same_cycle_resp & ~(_T_1640 | reset)) begin
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
        if (_T_1622 & same_cycle_resp & ~(_T_1644 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1622 & same_cycle_resp & ~(_T_1644 | reset)) begin
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
        if (_T_1622 & ~same_cycle_resp & ~(_T_1652 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper opcode response (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1622 & ~same_cycle_resp & ~(_T_1652 | reset)) begin
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
        if (_T_1622 & ~same_cycle_resp & ~(_T_1656 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1622 & ~same_cycle_resp & ~(_T_1656 | reset)) begin
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
        if (_T_1666 & ~(_T_1668 | reset)) begin
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
        if (_T_1666 & ~(_T_1668 | reset)) begin
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
        if (~(_T_1675 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' and 'D' concurrent, despite minlatency 1 (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (~(_T_1675 | reset)) begin
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
        if (~(_T_1684 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: TileLink timeout expired (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (~(_T_1684 | reset)) begin
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
        if (_T_1701 & ~(_T_1704 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' channel re-used a source ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1701 & ~(_T_1704 | reset)) begin
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
        if (_T_1710 & ~(_T_1720 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel acknowledged for nothing inflight (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1710 & ~(_T_1720 | reset)) begin
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
        if (_T_1710 & same_cycle_resp_1 & ~(_T_1724 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1710 & same_cycle_resp_1 & ~(_T_1724 | reset)) begin
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
        if (_T_1710 & ~same_cycle_resp_1 & ~(_T_1728 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1710 & ~same_cycle_resp_1 & ~(_T_1728 | reset)) begin
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
        if (_T_1737 & ~(_T_1739 | reset)) begin
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
        if (_T_1737 & ~(_T_1739 | reset)) begin
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
        if (_T_1743 & ~(_T_1744 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'C' and 'D' concurrent, despite minlatency 1 (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1743 & ~(_T_1744 | reset)) begin
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
        if (~(_T_1753 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: TileLink timeout expired (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (~(_T_1753 | reset)) begin
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
        if (_T_1766 & ~(_T_1769 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel re-used a sink ID (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_1766 & ~(_T_1769 | reset)) begin
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
        if (_T_1773 & ~(_T_1777[0] | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'E' channel acknowledged for nothing inflight (connected at BankedL2Params.scala:60:27)\n    at Monitor.scala:42 assert(cond, message)\n"
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
        if (_T_1773 & ~(_T_1777[0] | reset)) begin
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
  a_first_counter = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  param = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  size = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  source = _RAND_4[3:0];
  _RAND_5 = {1{`RANDOM}};
  address = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  d_first_counter = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  opcode_1 = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  param_1 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  size_1 = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  source_1 = _RAND_10[3:0];
  _RAND_11 = {1{`RANDOM}};
  sink = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  denied = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  b_first_counter = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  opcode_2 = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  param_2 = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  size_2 = _RAND_16[2:0];
  _RAND_17 = {1{`RANDOM}};
  source_2 = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  address_1 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  c_first_counter = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  opcode_3 = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  param_3 = _RAND_21[2:0];
  _RAND_22 = {1{`RANDOM}};
  size_3 = _RAND_22[2:0];
  _RAND_23 = {1{`RANDOM}};
  source_3 = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  address_2 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  inflight = _RAND_25[8:0];
  _RAND_26 = {2{`RANDOM}};
  inflight_opcodes = _RAND_26[35:0];
  _RAND_27 = {2{`RANDOM}};
  inflight_sizes = _RAND_27[35:0];
  _RAND_28 = {1{`RANDOM}};
  a_first_counter_1 = _RAND_28[2:0];
  _RAND_29 = {1{`RANDOM}};
  d_first_counter_1 = _RAND_29[2:0];
  _RAND_30 = {1{`RANDOM}};
  watchdog = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  inflight_1 = _RAND_31[8:0];
  _RAND_32 = {2{`RANDOM}};
  inflight_sizes_1 = _RAND_32[35:0];
  _RAND_33 = {1{`RANDOM}};
  c_first_counter_1 = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  d_first_counter_2 = _RAND_34[2:0];
  _RAND_35 = {1{`RANDOM}};
  watchdog_1 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  inflight_2 = _RAND_36[3:0];
  _RAND_37 = {1{`RANDOM}};
  d_first_counter_3 = _RAND_37[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
