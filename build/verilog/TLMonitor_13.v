module TLMonitor_13(
  input         clock,
  input         reset,
  input         io_in_a_ready,
  input         io_in_a_valid,
  input  [2:0]  io_in_a_bits_opcode,
  input  [2:0]  io_in_a_bits_param,
  input  [1:0]  io_in_a_bits_size,
  input  [8:0]  io_in_a_bits_source,
  input  [14:0] io_in_a_bits_address,
  input  [7:0]  io_in_a_bits_mask,
  input  [63:0] io_in_a_bits_data,
  input         io_in_a_bits_corrupt,
  input         io_in_d_ready,
  input         io_in_d_valid,
  input  [2:0]  io_in_d_bits_opcode,
  input  [1:0]  io_in_d_bits_param,
  input  [1:0]  io_in_d_bits_size,
  input  [8:0]  io_in_d_bits_source,
  input         io_in_d_bits_sink,
  input         io_in_d_bits_denied,
  input  [63:0] io_in_d_bits_data,
  input         io_in_d_bits_corrupt
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
  reg [287:0] _RAND_13;
  reg [1087:0] _RAND_14;
  reg [1087:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [287:0] _RAND_19;
  reg [1087:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] plusarg_reader_out; // @[PlusArg.scala 80:11]
  wire [31:0] plusarg_reader_1_out; // @[PlusArg.scala 80:11]
  wire  _source_ok_T_4 = io_in_a_bits_source <= 9'h10f; // @[Parameters.scala 57:20]
  wire [5:0] _is_aligned_mask_T_1 = 6'h7 << io_in_a_bits_size; // @[package.scala 234:77]
  wire [2:0] is_aligned_mask = ~_is_aligned_mask_T_1[2:0]; // @[package.scala 234:46]
  wire [14:0] _GEN_71 = {{12'd0}, is_aligned_mask}; // @[Edges.scala 20:16]
  wire [14:0] _is_aligned_T = io_in_a_bits_address & _GEN_71; // @[Edges.scala 20:16]
  wire  is_aligned = _is_aligned_T == 15'h0; // @[Edges.scala 20:24]
  wire [2:0] _mask_sizeOH_T = {{1'd0}, io_in_a_bits_size}; // @[Misc.scala 201:34]
  wire [1:0] mask_sizeOH_shiftAmount = _mask_sizeOH_T[1:0]; // @[OneHot.scala 64:49]
  wire [3:0] _mask_sizeOH_T_1 = 4'h1 << mask_sizeOH_shiftAmount; // @[OneHot.scala 65:12]
  wire [2:0] mask_sizeOH = _mask_sizeOH_T_1[2:0] | 3'h1; // @[Misc.scala 201:81]
  wire  _mask_T = io_in_a_bits_size >= 2'h3; // @[Misc.scala 205:21]
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
  wire  _T_20 = io_in_a_bits_opcode == 3'h6; // @[Monitor.scala 81:25]
  wire [14:0] _T_33 = io_in_a_bits_address ^ 15'h4000; // @[Parameters.scala 137:31]
  wire [15:0] _T_34 = {1'b0,$signed(_T_33)}; // @[Parameters.scala 137:49]
  wire [15:0] _T_36 = $signed(_T_34) & -16'sh1000; // @[Parameters.scala 137:52]
  wire  _T_37 = $signed(_T_36) == 16'sh0; // @[Parameters.scala 137:67]
  wire  _T_43 = ~reset; // @[Monitor.scala 42:11]
  wire  _T_69 = io_in_a_bits_param <= 3'h2; // @[Bundles.scala 108:27]
  wire [7:0] _T_73 = ~io_in_a_bits_mask; // @[Monitor.scala 88:18]
  wire  _T_74 = _T_73 == 8'h0; // @[Monitor.scala 88:31]
  wire  _T_78 = ~io_in_a_bits_corrupt; // @[Monitor.scala 89:18]
  wire  _T_82 = io_in_a_bits_opcode == 3'h7; // @[Monitor.scala 92:25]
  wire  _T_135 = io_in_a_bits_param != 3'h0; // @[Monitor.scala 99:31]
  wire  _T_148 = io_in_a_bits_opcode == 3'h4; // @[Monitor.scala 104:25]
  wire  _T_183 = io_in_a_bits_param == 3'h0; // @[Monitor.scala 109:31]
  wire  _T_187 = io_in_a_bits_mask == mask; // @[Monitor.scala 110:30]
  wire  _T_195 = io_in_a_bits_opcode == 3'h0; // @[Monitor.scala 114:25]
  wire  _T_218 = _source_ok_T_4 & _T_37; // @[Monitor.scala 115:71]
  wire  _T_236 = io_in_a_bits_opcode == 3'h1; // @[Monitor.scala 122:25]
  wire [7:0] _T_273 = ~mask; // @[Monitor.scala 127:33]
  wire [7:0] _T_274 = io_in_a_bits_mask & _T_273; // @[Monitor.scala 127:31]
  wire  _T_275 = _T_274 == 8'h0; // @[Monitor.scala 127:40]
  wire  _T_279 = io_in_a_bits_opcode == 3'h2; // @[Monitor.scala 130:25]
  wire  _T_309 = io_in_a_bits_param <= 3'h4; // @[Bundles.scala 138:33]
  wire  _T_317 = io_in_a_bits_opcode == 3'h3; // @[Monitor.scala 138:25]
  wire  _T_347 = io_in_a_bits_param <= 3'h3; // @[Bundles.scala 145:30]
  wire  _T_355 = io_in_a_bits_opcode == 3'h5; // @[Monitor.scala 146:25]
  wire  _T_385 = io_in_a_bits_param <= 3'h1; // @[Bundles.scala 158:28]
  wire  _T_397 = io_in_d_bits_opcode <= 3'h6; // @[Bundles.scala 42:24]
  wire  _source_ok_T_10 = io_in_d_bits_source <= 9'h10f; // @[Parameters.scala 57:20]
  wire  _T_401 = io_in_d_bits_opcode == 3'h6; // @[Monitor.scala 310:25]
  wire  _T_405 = io_in_d_bits_size >= 2'h3; // @[Monitor.scala 312:27]
  wire  _T_409 = io_in_d_bits_param == 2'h0; // @[Monitor.scala 313:28]
  wire  _T_413 = ~io_in_d_bits_corrupt; // @[Monitor.scala 314:15]
  wire  _T_417 = ~io_in_d_bits_denied; // @[Monitor.scala 315:15]
  wire  _T_421 = io_in_d_bits_opcode == 3'h4; // @[Monitor.scala 318:25]
  wire  _T_432 = io_in_d_bits_param <= 2'h2; // @[Bundles.scala 102:26]
  wire  _T_436 = io_in_d_bits_param != 2'h2; // @[Monitor.scala 323:28]
  wire  _T_449 = io_in_d_bits_opcode == 3'h5; // @[Monitor.scala 328:25]
  wire  _T_469 = _T_417 | io_in_d_bits_corrupt; // @[Monitor.scala 334:30]
  wire  _T_478 = io_in_d_bits_opcode == 3'h0; // @[Monitor.scala 338:25]
  wire  _T_495 = io_in_d_bits_opcode == 3'h1; // @[Monitor.scala 346:25]
  wire  _T_513 = io_in_d_bits_opcode == 3'h2; // @[Monitor.scala 354:25]
  wire  a_first_done = io_in_a_ready & io_in_a_valid; // @[Decoupled.scala 40:37]
  reg  a_first_counter; // @[Edges.scala 228:27]
  wire  a_first_counter1 = a_first_counter - 1'h1; // @[Edges.scala 229:28]
  wire  a_first = ~a_first_counter; // @[Edges.scala 230:25]
  reg [2:0] opcode; // @[Monitor.scala 384:22]
  reg [2:0] param; // @[Monitor.scala 385:22]
  reg [1:0] size; // @[Monitor.scala 386:22]
  reg [8:0] source; // @[Monitor.scala 387:22]
  reg [14:0] address; // @[Monitor.scala 388:22]
  wire  _T_543 = io_in_a_valid & ~a_first; // @[Monitor.scala 389:19]
  wire  _T_544 = io_in_a_bits_opcode == opcode; // @[Monitor.scala 390:32]
  wire  _T_548 = io_in_a_bits_param == param; // @[Monitor.scala 391:32]
  wire  _T_552 = io_in_a_bits_size == size; // @[Monitor.scala 392:32]
  wire  _T_556 = io_in_a_bits_source == source; // @[Monitor.scala 393:32]
  wire  _T_560 = io_in_a_bits_address == address; // @[Monitor.scala 394:32]
  wire  d_first_done = io_in_d_ready & io_in_d_valid; // @[Decoupled.scala 40:37]
  reg  d_first_counter; // @[Edges.scala 228:27]
  wire  d_first_counter1 = d_first_counter - 1'h1; // @[Edges.scala 229:28]
  wire  d_first = ~d_first_counter; // @[Edges.scala 230:25]
  reg [2:0] opcode_1; // @[Monitor.scala 535:22]
  reg [1:0] param_1; // @[Monitor.scala 536:22]
  reg [1:0] size_1; // @[Monitor.scala 537:22]
  reg [8:0] source_1; // @[Monitor.scala 538:22]
  reg  sink; // @[Monitor.scala 539:22]
  reg  denied; // @[Monitor.scala 540:22]
  wire  _T_567 = io_in_d_valid & ~d_first; // @[Monitor.scala 541:19]
  wire  _T_568 = io_in_d_bits_opcode == opcode_1; // @[Monitor.scala 542:29]
  wire  _T_572 = io_in_d_bits_param == param_1; // @[Monitor.scala 543:29]
  wire  _T_576 = io_in_d_bits_size == size_1; // @[Monitor.scala 544:29]
  wire  _T_580 = io_in_d_bits_source == source_1; // @[Monitor.scala 545:29]
  wire  _T_584 = io_in_d_bits_sink == sink; // @[Monitor.scala 546:29]
  wire  _T_588 = io_in_d_bits_denied == denied; // @[Monitor.scala 547:29]
  reg [271:0] inflight; // @[Monitor.scala 611:27]
  reg [1087:0] inflight_opcodes; // @[Monitor.scala 613:35]
  reg [1087:0] inflight_sizes; // @[Monitor.scala 615:33]
  reg  a_first_counter_1; // @[Edges.scala 228:27]
  wire  a_first_counter1_1 = a_first_counter_1 - 1'h1; // @[Edges.scala 229:28]
  wire  a_first_1 = ~a_first_counter_1; // @[Edges.scala 230:25]
  reg  d_first_counter_1; // @[Edges.scala 228:27]
  wire  d_first_counter1_1 = d_first_counter_1 - 1'h1; // @[Edges.scala 229:28]
  wire  d_first_1 = ~d_first_counter_1; // @[Edges.scala 230:25]
  wire [10:0] _GEN_72 = {io_in_d_bits_source, 2'h0}; // @[Monitor.scala 634:69]
  wire [11:0] _a_opcode_lookup_T = {{1'd0}, _GEN_72}; // @[Monitor.scala 634:69]
  wire [1087:0] _a_opcode_lookup_T_1 = inflight_opcodes >> _a_opcode_lookup_T; // @[Monitor.scala 634:44]
  wire [15:0] _a_opcode_lookup_T_5 = 16'h10 - 16'h1; // @[Monitor.scala 609:57]
  wire [1087:0] _GEN_73 = {{1072'd0}, _a_opcode_lookup_T_5}; // @[Monitor.scala 634:97]
  wire [1087:0] _a_opcode_lookup_T_6 = _a_opcode_lookup_T_1 & _GEN_73; // @[Monitor.scala 634:97]
  wire [1087:0] _a_opcode_lookup_T_7 = {{1'd0}, _a_opcode_lookup_T_6[1087:1]}; // @[Monitor.scala 634:152]
  wire [1087:0] _a_size_lookup_T_1 = inflight_sizes >> _a_opcode_lookup_T; // @[Monitor.scala 638:40]
  wire [1087:0] _a_size_lookup_T_6 = _a_size_lookup_T_1 & _GEN_73; // @[Monitor.scala 638:91]
  wire [1087:0] _a_size_lookup_T_7 = {{1'd0}, _a_size_lookup_T_6[1087:1]}; // @[Monitor.scala 638:144]
  wire  _T_594 = io_in_a_valid & a_first_1; // @[Monitor.scala 648:26]
  wire [511:0] _a_set_wo_ready_T = 512'h1 << io_in_a_bits_source; // @[OneHot.scala 58:35]
  wire  _T_597 = a_first_done & a_first_1; // @[Monitor.scala 652:27]
  wire [3:0] _a_opcodes_set_interm_T = {io_in_a_bits_opcode, 1'h0}; // @[Monitor.scala 654:53]
  wire [3:0] _a_opcodes_set_interm_T_1 = _a_opcodes_set_interm_T | 4'h1; // @[Monitor.scala 654:61]
  wire [2:0] _a_sizes_set_interm_T = {io_in_a_bits_size, 1'h0}; // @[Monitor.scala 655:51]
  wire [2:0] _a_sizes_set_interm_T_1 = _a_sizes_set_interm_T | 3'h1; // @[Monitor.scala 655:59]
  wire [10:0] _GEN_78 = {io_in_a_bits_source, 2'h0}; // @[Monitor.scala 656:79]
  wire [11:0] _a_opcodes_set_T = {{1'd0}, _GEN_78}; // @[Monitor.scala 656:79]
  wire [3:0] a_opcodes_set_interm = a_first_done & a_first_1 ? _a_opcodes_set_interm_T_1 : 4'h0; // @[Monitor.scala 652:72 Monitor.scala 654:28]
  wire [4098:0] _GEN_79 = {{4095'd0}, a_opcodes_set_interm}; // @[Monitor.scala 656:54]
  wire [4098:0] _a_opcodes_set_T_1 = _GEN_79 << _a_opcodes_set_T; // @[Monitor.scala 656:54]
  wire [2:0] a_sizes_set_interm = a_first_done & a_first_1 ? _a_sizes_set_interm_T_1 : 3'h0; // @[Monitor.scala 652:72 Monitor.scala 655:28]
  wire [4097:0] _GEN_81 = {{4095'd0}, a_sizes_set_interm}; // @[Monitor.scala 657:52]
  wire [4097:0] _a_sizes_set_T_1 = _GEN_81 << _a_opcodes_set_T; // @[Monitor.scala 657:52]
  wire [271:0] _T_599 = inflight >> io_in_a_bits_source; // @[Monitor.scala 658:26]
  wire  _T_601 = ~_T_599[0]; // @[Monitor.scala 658:17]
  wire [511:0] _GEN_16 = a_first_done & a_first_1 ? _a_set_wo_ready_T : 512'h0; // @[Monitor.scala 652:72 Monitor.scala 653:28]
  wire [4098:0] _GEN_19 = a_first_done & a_first_1 ? _a_opcodes_set_T_1 : 4099'h0; // @[Monitor.scala 652:72 Monitor.scala 656:28]
  wire [4097:0] _GEN_20 = a_first_done & a_first_1 ? _a_sizes_set_T_1 : 4098'h0; // @[Monitor.scala 652:72 Monitor.scala 657:28]
  wire  _T_605 = io_in_d_valid & d_first_1; // @[Monitor.scala 671:26]
  wire  _T_607 = ~_T_401; // @[Monitor.scala 671:74]
  wire  _T_608 = io_in_d_valid & d_first_1 & ~_T_401; // @[Monitor.scala 671:71]
  wire [511:0] _d_clr_wo_ready_T = 512'h1 << io_in_d_bits_source; // @[OneHot.scala 58:35]
  wire [4110:0] _GEN_83 = {{4095'd0}, _a_opcode_lookup_T_5}; // @[Monitor.scala 677:76]
  wire [4110:0] _d_opcodes_clr_T_5 = _GEN_83 << _a_opcode_lookup_T; // @[Monitor.scala 677:76]
  wire [511:0] _GEN_22 = d_first_done & d_first_1 & _T_607 ? _d_clr_wo_ready_T : 512'h0; // @[Monitor.scala 675:91 Monitor.scala 676:21]
  wire [4110:0] _GEN_23 = d_first_done & d_first_1 & _T_607 ? _d_opcodes_clr_T_5 : 4111'h0; // @[Monitor.scala 675:91 Monitor.scala 677:21]
  wire  _same_cycle_resp_T_2 = io_in_a_bits_source == io_in_d_bits_source; // @[Monitor.scala 681:113]
  wire  same_cycle_resp = _T_594 & io_in_a_bits_source == io_in_d_bits_source; // @[Monitor.scala 681:88]
  wire [271:0] _T_618 = inflight >> io_in_d_bits_source; // @[Monitor.scala 682:25]
  wire  _T_620 = _T_618[0] | same_cycle_resp; // @[Monitor.scala 682:49]
  wire [2:0] _GEN_27 = 3'h2 == io_in_a_bits_opcode ? 3'h1 : 3'h0; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_28 = 3'h3 == io_in_a_bits_opcode ? 3'h1 : _GEN_27; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_29 = 3'h4 == io_in_a_bits_opcode ? 3'h1 : _GEN_28; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_30 = 3'h5 == io_in_a_bits_opcode ? 3'h2 : _GEN_29; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_31 = 3'h6 == io_in_a_bits_opcode ? 3'h4 : _GEN_30; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_32 = 3'h7 == io_in_a_bits_opcode ? 3'h4 : _GEN_31; // @[Monitor.scala 685:38 Monitor.scala 685:38]
  wire [2:0] _GEN_39 = 3'h6 == io_in_a_bits_opcode ? 3'h5 : _GEN_30; // @[Monitor.scala 686:39 Monitor.scala 686:39]
  wire [2:0] _GEN_40 = 3'h7 == io_in_a_bits_opcode ? 3'h4 : _GEN_39; // @[Monitor.scala 686:39 Monitor.scala 686:39]
  wire  _T_625 = io_in_d_bits_opcode == _GEN_40; // @[Monitor.scala 686:39]
  wire  _T_626 = io_in_d_bits_opcode == _GEN_32 | _T_625; // @[Monitor.scala 685:77]
  wire  _T_630 = io_in_a_bits_size == io_in_d_bits_size; // @[Monitor.scala 687:36]
  wire [3:0] a_opcode_lookup = _a_opcode_lookup_T_7[3:0];
  wire [2:0] _GEN_43 = 3'h2 == a_opcode_lookup[2:0] ? 3'h1 : 3'h0; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_44 = 3'h3 == a_opcode_lookup[2:0] ? 3'h1 : _GEN_43; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_45 = 3'h4 == a_opcode_lookup[2:0] ? 3'h1 : _GEN_44; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_46 = 3'h5 == a_opcode_lookup[2:0] ? 3'h2 : _GEN_45; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_47 = 3'h6 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_46; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_48 = 3'h7 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_47; // @[Monitor.scala 689:38 Monitor.scala 689:38]
  wire [2:0] _GEN_55 = 3'h6 == a_opcode_lookup[2:0] ? 3'h5 : _GEN_46; // @[Monitor.scala 690:38 Monitor.scala 690:38]
  wire [2:0] _GEN_56 = 3'h7 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_55; // @[Monitor.scala 690:38 Monitor.scala 690:38]
  wire  _T_637 = io_in_d_bits_opcode == _GEN_56; // @[Monitor.scala 690:38]
  wire  _T_638 = io_in_d_bits_opcode == _GEN_48 | _T_637; // @[Monitor.scala 689:72]
  wire [3:0] a_size_lookup = _a_size_lookup_T_7[3:0];
  wire [3:0] _GEN_86 = {{2'd0}, io_in_d_bits_size}; // @[Monitor.scala 691:36]
  wire  _T_642 = _GEN_86 == a_size_lookup; // @[Monitor.scala 691:36]
  wire  _T_652 = _T_605 & a_first_1 & io_in_a_valid & _same_cycle_resp_T_2 & _T_607; // @[Monitor.scala 694:116]
  wire  _T_654 = ~io_in_d_ready | io_in_a_ready; // @[Monitor.scala 695:32]
  wire [271:0] a_set = _GEN_16[271:0];
  wire [271:0] _inflight_T = inflight | a_set; // @[Monitor.scala 702:27]
  wire [271:0] d_clr = _GEN_22[271:0];
  wire [271:0] _inflight_T_1 = ~d_clr; // @[Monitor.scala 702:38]
  wire [271:0] _inflight_T_2 = _inflight_T & _inflight_T_1; // @[Monitor.scala 702:36]
  wire [1087:0] a_opcodes_set = _GEN_19[1087:0];
  wire [1087:0] _inflight_opcodes_T = inflight_opcodes | a_opcodes_set; // @[Monitor.scala 703:43]
  wire [1087:0] d_opcodes_clr = _GEN_23[1087:0];
  wire [1087:0] _inflight_opcodes_T_1 = ~d_opcodes_clr; // @[Monitor.scala 703:62]
  wire [1087:0] _inflight_opcodes_T_2 = _inflight_opcodes_T & _inflight_opcodes_T_1; // @[Monitor.scala 703:60]
  wire [1087:0] a_sizes_set = _GEN_20[1087:0];
  wire [1087:0] _inflight_sizes_T = inflight_sizes | a_sizes_set; // @[Monitor.scala 704:39]
  wire [1087:0] _inflight_sizes_T_2 = _inflight_sizes_T & _inflight_opcodes_T_1; // @[Monitor.scala 704:54]
  reg [31:0] watchdog; // @[Monitor.scala 706:27]
  wire  _T_663 = ~(|inflight) | plusarg_reader_out == 32'h0 | watchdog < plusarg_reader_out; // @[Monitor.scala 709:47]
  wire [31:0] _watchdog_T_1 = watchdog + 32'h1; // @[Monitor.scala 711:26]
  reg [271:0] inflight_1; // @[Monitor.scala 723:35]
  reg [1087:0] inflight_sizes_1; // @[Monitor.scala 725:35]
  reg  d_first_counter_2; // @[Edges.scala 228:27]
  wire  d_first_counter1_2 = d_first_counter_2 - 1'h1; // @[Edges.scala 229:28]
  wire  d_first_2 = ~d_first_counter_2; // @[Edges.scala 230:25]
  wire [1087:0] _c_size_lookup_T_1 = inflight_sizes_1 >> _a_opcode_lookup_T; // @[Monitor.scala 747:42]
  wire [1087:0] _c_size_lookup_T_6 = _c_size_lookup_T_1 & _GEN_73; // @[Monitor.scala 747:93]
  wire [1087:0] _c_size_lookup_T_7 = {{1'd0}, _c_size_lookup_T_6[1087:1]}; // @[Monitor.scala 747:146]
  wire  _T_689 = io_in_d_valid & d_first_2 & _T_401; // @[Monitor.scala 779:71]
  wire [511:0] _GEN_67 = d_first_done & d_first_2 & _T_401 ? _d_clr_wo_ready_T : 512'h0; // @[Monitor.scala 783:90 Monitor.scala 784:21]
  wire [4110:0] _GEN_68 = d_first_done & d_first_2 & _T_401 ? _d_opcodes_clr_T_5 : 4111'h0; // @[Monitor.scala 783:90 Monitor.scala 785:21]
  wire [271:0] _T_697 = inflight_1 >> io_in_d_bits_source; // @[Monitor.scala 791:25]
  wire [3:0] c_size_lookup = _c_size_lookup_T_7[3:0];
  wire  _T_707 = _GEN_86 == c_size_lookup; // @[Monitor.scala 795:36]
  wire [271:0] d_clr_1 = _GEN_67[271:0];
  wire [271:0] _inflight_T_4 = ~d_clr_1; // @[Monitor.scala 809:46]
  wire [271:0] _inflight_T_5 = inflight_1 & _inflight_T_4; // @[Monitor.scala 809:44]
  wire [1087:0] d_opcodes_clr_1 = _GEN_68[1087:0];
  wire [1087:0] _inflight_opcodes_T_4 = ~d_opcodes_clr_1; // @[Monitor.scala 810:62]
  wire [1087:0] _inflight_sizes_T_5 = inflight_sizes_1 & _inflight_opcodes_T_4; // @[Monitor.scala 811:56]
  reg [31:0] watchdog_1; // @[Monitor.scala 813:27]
  wire  _T_727 = ~(|inflight_1) | plusarg_reader_1_out == 32'h0 | watchdog_1 < plusarg_reader_1_out; // @[Monitor.scala 816:47]
  wire [31:0] _watchdog_T_3 = watchdog_1 + 32'h1; // @[Monitor.scala 818:26]
  plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0), .WIDTH(32)) plusarg_reader ( // @[PlusArg.scala 80:11]
    .out(plusarg_reader_out)
  );
  plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0), .WIDTH(32)) plusarg_reader_1 ( // @[PlusArg.scala 80:11]
    .out(plusarg_reader_1_out)
  );
  always @(posedge clock) begin
    if (reset) begin // @[Edges.scala 228:27]
      a_first_counter <= 1'h0; // @[Edges.scala 228:27]
    end else if (a_first_done) begin // @[Edges.scala 234:17]
      if (a_first) begin // @[Edges.scala 235:21]
        a_first_counter <= 1'h0;
      end else begin
        a_first_counter <= a_first_counter1;
      end
    end
    if (a_first_done & a_first) begin // @[Monitor.scala 396:32]
      opcode <= io_in_a_bits_opcode; // @[Monitor.scala 397:15]
    end
    if (a_first_done & a_first) begin // @[Monitor.scala 396:32]
      param <= io_in_a_bits_param; // @[Monitor.scala 398:15]
    end
    if (a_first_done & a_first) begin // @[Monitor.scala 396:32]
      size <= io_in_a_bits_size; // @[Monitor.scala 399:15]
    end
    if (a_first_done & a_first) begin // @[Monitor.scala 396:32]
      source <= io_in_a_bits_source; // @[Monitor.scala 400:15]
    end
    if (a_first_done & a_first) begin // @[Monitor.scala 396:32]
      address <= io_in_a_bits_address; // @[Monitor.scala 401:15]
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_first_counter <= 1'h0; // @[Edges.scala 228:27]
    end else if (d_first_done) begin // @[Edges.scala 234:17]
      if (d_first) begin // @[Edges.scala 235:21]
        d_first_counter <= 1'h0;
      end else begin
        d_first_counter <= d_first_counter1;
      end
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      opcode_1 <= io_in_d_bits_opcode; // @[Monitor.scala 550:15]
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      param_1 <= io_in_d_bits_param; // @[Monitor.scala 551:15]
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      size_1 <= io_in_d_bits_size; // @[Monitor.scala 552:15]
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      source_1 <= io_in_d_bits_source; // @[Monitor.scala 553:15]
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      sink <= io_in_d_bits_sink; // @[Monitor.scala 554:15]
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      denied <= io_in_d_bits_denied; // @[Monitor.scala 555:15]
    end
    if (reset) begin // @[Monitor.scala 611:27]
      inflight <= 272'h0; // @[Monitor.scala 611:27]
    end else begin
      inflight <= _inflight_T_2; // @[Monitor.scala 702:14]
    end
    if (reset) begin // @[Monitor.scala 613:35]
      inflight_opcodes <= 1088'h0; // @[Monitor.scala 613:35]
    end else begin
      inflight_opcodes <= _inflight_opcodes_T_2; // @[Monitor.scala 703:22]
    end
    if (reset) begin // @[Monitor.scala 615:33]
      inflight_sizes <= 1088'h0; // @[Monitor.scala 615:33]
    end else begin
      inflight_sizes <= _inflight_sizes_T_2; // @[Monitor.scala 704:20]
    end
    if (reset) begin // @[Edges.scala 228:27]
      a_first_counter_1 <= 1'h0; // @[Edges.scala 228:27]
    end else if (a_first_done) begin // @[Edges.scala 234:17]
      if (a_first_1) begin // @[Edges.scala 235:21]
        a_first_counter_1 <= 1'h0;
      end else begin
        a_first_counter_1 <= a_first_counter1_1;
      end
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_first_counter_1 <= 1'h0; // @[Edges.scala 228:27]
    end else if (d_first_done) begin // @[Edges.scala 234:17]
      if (d_first_1) begin // @[Edges.scala 235:21]
        d_first_counter_1 <= 1'h0;
      end else begin
        d_first_counter_1 <= d_first_counter1_1;
      end
    end
    if (reset) begin // @[Monitor.scala 706:27]
      watchdog <= 32'h0; // @[Monitor.scala 706:27]
    end else if (a_first_done | d_first_done) begin // @[Monitor.scala 712:47]
      watchdog <= 32'h0; // @[Monitor.scala 712:58]
    end else begin
      watchdog <= _watchdog_T_1; // @[Monitor.scala 711:14]
    end
    if (reset) begin // @[Monitor.scala 723:35]
      inflight_1 <= 272'h0; // @[Monitor.scala 723:35]
    end else begin
      inflight_1 <= _inflight_T_5; // @[Monitor.scala 809:22]
    end
    if (reset) begin // @[Monitor.scala 725:35]
      inflight_sizes_1 <= 1088'h0; // @[Monitor.scala 725:35]
    end else begin
      inflight_sizes_1 <= _inflight_sizes_T_5; // @[Monitor.scala 811:22]
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_first_counter_2 <= 1'h0; // @[Edges.scala 228:27]
    end else if (d_first_done) begin // @[Edges.scala 234:17]
      if (d_first_2) begin // @[Edges.scala 235:21]
        d_first_counter_2 <= 1'h0;
      end else begin
        d_first_counter_2 <= d_first_counter1_2;
      end
    end
    if (reset) begin // @[Monitor.scala 813:27]
      watchdog_1 <= 32'h0; // @[Monitor.scala 813:27]
    end else if (d_first_done) begin // @[Monitor.scala 819:47]
      watchdog_1 <= 32'h0; // @[Monitor.scala 819:58]
    end else begin
      watchdog_1 <= _watchdog_T_3; // @[Monitor.scala 818:14]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquireBlock type which is unexpected using diplomatic parameters (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(_source_ok_T_4 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(_source_ok_T_4 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(_mask_T | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(_mask_T | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(_T_69 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(_T_69 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(_T_74 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(_T_74 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(_T_78 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock is corrupt (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_20 & ~(_T_78 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquirePerm type which is unexpected using diplomatic parameters (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_source_ok_T_4 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_source_ok_T_4 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_mask_T | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_mask_T | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_T_69 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_T_69 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_T_135 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_T_135 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_T_74 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_T_74 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_T_78 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm is corrupt (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_82 & ~(_T_78 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_source_ok_T_4 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Get type which master claims it can't emit (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_source_ok_T_4 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_T_37 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_T_37 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_source_ok_T_4 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_source_ok_T_4 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get address not aligned to size (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_T_183 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get carries invalid param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_T_183 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_T_187 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get contains invalid mask (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_T_187 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_T_78 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get is corrupt (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_148 & ~(_T_78 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_195 & ~(_T_218 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries PutFull type which is unexpected using diplomatic parameters (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_195 & ~(_T_218 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_195 & ~(_source_ok_T_4 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_195 & ~(_source_ok_T_4 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_195 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull address not aligned to size (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_195 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_195 & ~(_T_183 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull carries invalid param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_195 & ~(_T_183 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_195 & ~(_T_187 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull contains invalid mask (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_195 & ~(_T_187 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_236 & ~(_T_218 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_236 & ~(_T_218 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_236 & ~(_source_ok_T_4 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_236 & ~(_source_ok_T_4 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_236 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial address not aligned to size (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_236 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_236 & ~(_T_183 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial carries invalid param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_236 & ~(_T_183 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_236 & ~(_T_275 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial contains invalid mask (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_236 & ~(_T_275 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_279 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Arithmetic type which is unexpected using diplomatic parameters (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_279 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_279 & ~(_source_ok_T_4 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_279 & ~(_source_ok_T_4 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_279 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_279 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_279 & ~(_T_309 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_279 & ~(_T_309 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_279 & ~(_T_187 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_279 & ~(_T_187 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Logical type which is unexpected using diplomatic parameters (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~(_source_ok_T_4 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~(_source_ok_T_4 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical address not aligned to size (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~(_T_347 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical carries invalid opcode param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~(_T_347 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~(_T_187 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical contains invalid mask (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~(_T_187 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Hint type which is unexpected using diplomatic parameters (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~(_source_ok_T_4 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~(_source_ok_T_4 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~(is_aligned | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint address not aligned to size (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~(is_aligned | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~(_T_385 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint carries invalid opcode param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~(_T_385 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~(_T_187 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint contains invalid mask (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~(_T_187 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~(_T_78 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint is corrupt (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_355 & ~(_T_78 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & ~(_T_397 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel has invalid opcode (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & ~(_T_397 | reset)) begin
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
        if (io_in_d_valid & _T_401 & ~(_source_ok_T_10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_401 & ~(_source_ok_T_10 | reset)) begin
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
        if (io_in_d_valid & _T_401 & ~(_T_405 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_401 & ~(_T_405 | reset)) begin
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
        if (io_in_d_valid & _T_401 & ~(_T_409 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_401 & ~(_T_409 | reset)) begin
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
        if (io_in_d_valid & _T_401 & ~(_T_413 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck is corrupt (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_401 & ~(_T_413 | reset)) begin
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
        if (io_in_d_valid & _T_401 & ~(_T_417 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck is denied (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_401 & ~(_T_417 | reset)) begin
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
        if (io_in_d_valid & _T_421 & ~(_source_ok_T_10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_421 & ~(_source_ok_T_10 | reset)) begin
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
        if (io_in_d_valid & _T_421 & _T_43) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries invalid sink ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_421 & _T_43) begin
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
        if (io_in_d_valid & _T_421 & ~(_T_405 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant smaller than a beat (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_421 & ~(_T_405 | reset)) begin
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
        if (io_in_d_valid & _T_421 & ~(_T_432 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries invalid cap param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_421 & ~(_T_432 | reset)) begin
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
        if (io_in_d_valid & _T_421 & ~(_T_436 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries toN param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_421 & ~(_T_436 | reset)) begin
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
        if (io_in_d_valid & _T_421 & ~(_T_413 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant is corrupt (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_421 & ~(_T_413 | reset)) begin
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
        if (io_in_d_valid & _T_421 & ~(_T_417 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant is denied (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_421 & ~(_T_417 | reset)) begin
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
        if (io_in_d_valid & _T_449 & ~(_source_ok_T_10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_449 & ~(_source_ok_T_10 | reset)) begin
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
        if (io_in_d_valid & _T_449 & _T_43) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_449 & _T_43) begin
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
        if (io_in_d_valid & _T_449 & ~(_T_405 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData smaller than a beat (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_449 & ~(_T_405 | reset)) begin
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
        if (io_in_d_valid & _T_449 & ~(_T_432 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries invalid cap param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_449 & ~(_T_432 | reset)) begin
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
        if (io_in_d_valid & _T_449 & ~(_T_436 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries toN param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_449 & ~(_T_436 | reset)) begin
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
        if (io_in_d_valid & _T_449 & ~(_T_469 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_449 & ~(_T_469 | reset)) begin
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
        if (io_in_d_valid & _T_449 & ~(_T_417 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData is denied (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_449 & ~(_T_417 | reset)) begin
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
        if (io_in_d_valid & _T_478 & ~(_source_ok_T_10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_478 & ~(_source_ok_T_10 | reset)) begin
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
        if (io_in_d_valid & _T_478 & ~(_T_409 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck carries invalid param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_478 & ~(_T_409 | reset)) begin
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
        if (io_in_d_valid & _T_478 & ~(_T_413 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck is corrupt (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_478 & ~(_T_413 | reset)) begin
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
        if (io_in_d_valid & _T_478 & ~(_T_417 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck is denied (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_478 & ~(_T_417 | reset)) begin
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
        if (io_in_d_valid & _T_495 & ~(_source_ok_T_10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_495 & ~(_source_ok_T_10 | reset)) begin
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
        if (io_in_d_valid & _T_495 & ~(_T_409 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData carries invalid param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_495 & ~(_T_409 | reset)) begin
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
        if (io_in_d_valid & _T_495 & ~(_T_469 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_495 & ~(_T_469 | reset)) begin
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
        if (io_in_d_valid & _T_495 & ~(_T_417 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData is denied (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_495 & ~(_T_417 | reset)) begin
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
        if (io_in_d_valid & _T_513 & ~(_source_ok_T_10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck carries invalid source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_513 & ~(_source_ok_T_10 | reset)) begin
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
        if (io_in_d_valid & _T_513 & ~(_T_409 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck carries invalid param (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_513 & ~(_T_409 | reset)) begin
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
        if (io_in_d_valid & _T_513 & ~(_T_413 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck is corrupt (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_513 & ~(_T_413 | reset)) begin
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
        if (io_in_d_valid & _T_513 & ~(_T_417 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck is denied (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (io_in_d_valid & _T_513 & ~(_T_417 | reset)) begin
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
        if (_T_543 & ~(_T_544 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel opcode changed within multibeat operation (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_543 & ~(_T_544 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_543 & ~(_T_548 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel param changed within multibeat operation (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_543 & ~(_T_548 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_543 & ~(_T_552 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel size changed within multibeat operation (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_543 & ~(_T_552 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_543 & ~(_T_556 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel source changed within multibeat operation (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_543 & ~(_T_556 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_543 & ~(_T_560 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel address changed with multibeat operation (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_543 & ~(_T_560 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_567 & ~(_T_568 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel opcode changed within multibeat operation (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_567 & ~(_T_568 | reset)) begin
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
        if (_T_567 & ~(_T_572 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel param changed within multibeat operation (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_567 & ~(_T_572 | reset)) begin
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
        if (_T_567 & ~(_T_576 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel size changed within multibeat operation (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_567 & ~(_T_576 | reset)) begin
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
        if (_T_567 & ~(_T_580 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel source changed within multibeat operation (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_567 & ~(_T_580 | reset)) begin
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
        if (_T_567 & ~(_T_584 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel sink changed with multibeat operation (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_567 & ~(_T_584 | reset)) begin
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
        if (_T_567 & ~(_T_588 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel denied changed with multibeat operation (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_567 & ~(_T_588 | reset)) begin
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
        if (_T_597 & ~(_T_601 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel re-used a source ID (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_597 & ~(_T_601 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_608 & ~(_T_620 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel acknowledged for nothing inflight (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_608 & ~(_T_620 | reset)) begin
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
        if (_T_608 & same_cycle_resp & ~(_T_626 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper opcode response (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_608 & same_cycle_resp & ~(_T_626 | reset)) begin
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
        if (_T_608 & same_cycle_resp & ~(_T_630 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_608 & same_cycle_resp & ~(_T_630 | reset)) begin
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
        if (_T_608 & ~same_cycle_resp & ~(_T_638 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper opcode response (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_608 & ~same_cycle_resp & ~(_T_638 | reset)) begin
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
        if (_T_608 & ~same_cycle_resp & ~(_T_642 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_608 & ~same_cycle_resp & ~(_T_642 | reset)) begin
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
        if (_T_652 & ~(_T_654 | reset)) begin
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
        if (_T_652 & ~(_T_654 | reset)) begin
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
        if (~(_T_663 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: TileLink timeout expired (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_663 | reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_689 & ~(_T_697[0] | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel acknowledged for nothing inflight (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_689 & ~(_T_697[0] | reset)) begin
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
        if (_T_689 & ~(_T_707 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:49 assert(cond, message)\n"
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
        if (_T_689 & ~(_T_707 | reset)) begin
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
        if (~(_T_727 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: TileLink timeout expired (connected at BusWrapper.scala:260:11)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_727 | reset)) begin
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
  a_first_counter = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  param = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  size = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  source = _RAND_4[8:0];
  _RAND_5 = {1{`RANDOM}};
  address = _RAND_5[14:0];
  _RAND_6 = {1{`RANDOM}};
  d_first_counter = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  opcode_1 = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  param_1 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  size_1 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  source_1 = _RAND_10[8:0];
  _RAND_11 = {1{`RANDOM}};
  sink = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  denied = _RAND_12[0:0];
  _RAND_13 = {9{`RANDOM}};
  inflight = _RAND_13[271:0];
  _RAND_14 = {34{`RANDOM}};
  inflight_opcodes = _RAND_14[1087:0];
  _RAND_15 = {34{`RANDOM}};
  inflight_sizes = _RAND_15[1087:0];
  _RAND_16 = {1{`RANDOM}};
  a_first_counter_1 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  d_first_counter_1 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  watchdog = _RAND_18[31:0];
  _RAND_19 = {9{`RANDOM}};
  inflight_1 = _RAND_19[271:0];
  _RAND_20 = {34{`RANDOM}};
  inflight_sizes_1 = _RAND_20[1087:0];
  _RAND_21 = {1{`RANDOM}};
  d_first_counter_2 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  watchdog_1 = _RAND_22[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
