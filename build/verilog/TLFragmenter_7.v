module TLFragmenter_7(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [2:0]  auto_in_a_bits_size,
  input  [3:0]  auto_in_a_bits_source,
  input  [28:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [2:0]  auto_in_d_bits_size,
  output [3:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [1:0]  auto_out_a_bits_size,
  output [7:0]  auto_out_a_bits_source,
  output [28:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [1:0]  auto_out_d_bits_size,
  input  [7:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [28:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  repeater_clock; // @[Fragmenter.scala 262:30]
  wire  repeater_reset; // @[Fragmenter.scala 262:30]
  wire  repeater_io_repeat; // @[Fragmenter.scala 262:30]
  wire  repeater_io_full; // @[Fragmenter.scala 262:30]
  wire  repeater_io_enq_ready; // @[Fragmenter.scala 262:30]
  wire  repeater_io_enq_valid; // @[Fragmenter.scala 262:30]
  wire [2:0] repeater_io_enq_bits_opcode; // @[Fragmenter.scala 262:30]
  wire [2:0] repeater_io_enq_bits_param; // @[Fragmenter.scala 262:30]
  wire [2:0] repeater_io_enq_bits_size; // @[Fragmenter.scala 262:30]
  wire [3:0] repeater_io_enq_bits_source; // @[Fragmenter.scala 262:30]
  wire [28:0] repeater_io_enq_bits_address; // @[Fragmenter.scala 262:30]
  wire [7:0] repeater_io_enq_bits_mask; // @[Fragmenter.scala 262:30]
  wire [63:0] repeater_io_enq_bits_data; // @[Fragmenter.scala 262:30]
  wire  repeater_io_enq_bits_corrupt; // @[Fragmenter.scala 262:30]
  wire  repeater_io_deq_ready; // @[Fragmenter.scala 262:30]
  wire  repeater_io_deq_valid; // @[Fragmenter.scala 262:30]
  wire [2:0] repeater_io_deq_bits_opcode; // @[Fragmenter.scala 262:30]
  wire [2:0] repeater_io_deq_bits_param; // @[Fragmenter.scala 262:30]
  wire [2:0] repeater_io_deq_bits_size; // @[Fragmenter.scala 262:30]
  wire [3:0] repeater_io_deq_bits_source; // @[Fragmenter.scala 262:30]
  wire [28:0] repeater_io_deq_bits_address; // @[Fragmenter.scala 262:30]
  wire [7:0] repeater_io_deq_bits_mask; // @[Fragmenter.scala 262:30]
  wire [63:0] repeater_io_deq_bits_data; // @[Fragmenter.scala 262:30]
  wire  repeater_io_deq_bits_corrupt; // @[Fragmenter.scala 262:30]
  reg [2:0] acknum; // @[Fragmenter.scala 189:29]
  reg [2:0] dOrig; // @[Fragmenter.scala 190:24]
  reg  dToggle; // @[Fragmenter.scala 191:30]
  wire [2:0] dFragnum = auto_out_d_bits_source[2:0]; // @[Fragmenter.scala 192:41]
  wire  dFirst = acknum == 3'h0; // @[Fragmenter.scala 193:29]
  wire  dLast = dFragnum == 3'h0; // @[Fragmenter.scala 194:30]
  wire [3:0] dsizeOH = 4'h1 << auto_out_d_bits_size; // @[OneHot.scala 65:12]
  wire [5:0] _dsizeOH1_T_1 = 6'h7 << auto_out_d_bits_size; // @[package.scala 234:77]
  wire [2:0] dsizeOH1 = ~_dsizeOH1_T_1[2:0]; // @[package.scala 234:46]
  wire  dHasData = auto_out_d_bits_opcode[0]; // @[Edges.scala 105:36]
  wire  ack_decrement = dHasData | dsizeOH[3]; // @[Fragmenter.scala 204:32]
  wire [5:0] _dFirst_size_T = {dFragnum, 3'h0}; // @[Fragmenter.scala 206:47]
  wire [5:0] _GEN_7 = {{3'd0}, dsizeOH1}; // @[Fragmenter.scala 206:69]
  wire [5:0] dFirst_size_lo = _dFirst_size_T | _GEN_7; // @[Fragmenter.scala 206:69]
  wire [6:0] _dFirst_size_T_1 = {dFirst_size_lo, 1'h0}; // @[package.scala 232:35]
  wire [6:0] _dFirst_size_T_2 = _dFirst_size_T_1 | 7'h1; // @[package.scala 232:40]
  wire [6:0] _dFirst_size_T_3 = {1'h0,dFirst_size_lo}; // @[Cat.scala 30:58]
  wire [6:0] _dFirst_size_T_4 = ~_dFirst_size_T_3; // @[package.scala 232:53]
  wire [6:0] _dFirst_size_T_5 = _dFirst_size_T_2 & _dFirst_size_T_4; // @[package.scala 232:51]
  wire [2:0] dFirst_size_hi = _dFirst_size_T_5[6:4]; // @[OneHot.scala 30:18]
  wire [3:0] dFirst_size_lo_1 = _dFirst_size_T_5[3:0]; // @[OneHot.scala 31:18]
  wire  dFirst_size_hi_1 = |dFirst_size_hi; // @[OneHot.scala 32:14]
  wire [3:0] _GEN_8 = {{1'd0}, dFirst_size_hi}; // @[OneHot.scala 32:28]
  wire [3:0] _dFirst_size_T_6 = _GEN_8 | dFirst_size_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] dFirst_size_hi_2 = _dFirst_size_T_6[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] dFirst_size_lo_2 = _dFirst_size_T_6[1:0]; // @[OneHot.scala 31:18]
  wire  dFirst_size_hi_3 = |dFirst_size_hi_2; // @[OneHot.scala 32:14]
  wire [1:0] _dFirst_size_T_7 = dFirst_size_hi_2 | dFirst_size_lo_2; // @[OneHot.scala 32:28]
  wire  dFirst_size_lo_3 = _dFirst_size_T_7[1]; // @[CircuitMath.scala 30:8]
  wire [2:0] dFirst_size = {dFirst_size_hi_1,dFirst_size_hi_3,dFirst_size_lo_3}; // @[Cat.scala 30:58]
  wire  drop = ~dHasData & ~dLast; // @[Fragmenter.scala 222:30]
  wire  bundleOut_0_d_ready = auto_in_d_ready | drop; // @[Fragmenter.scala 223:35]
  wire  _T_7 = bundleOut_0_d_ready & auto_out_d_valid; // @[Decoupled.scala 40:37]
  wire [2:0] _GEN_9 = {{2'd0}, ack_decrement}; // @[Fragmenter.scala 209:55]
  wire [2:0] _acknum_T_1 = acknum - _GEN_9; // @[Fragmenter.scala 209:55]
  wire [2:0] aFrag = repeater_io_deq_bits_size > 3'h3 ? 3'h3 : repeater_io_deq_bits_size; // @[Fragmenter.scala 285:24]
  wire [12:0] _aOrigOH1_T_1 = 13'h3f << repeater_io_deq_bits_size; // @[package.scala 234:77]
  wire [5:0] aOrigOH1 = ~_aOrigOH1_T_1[5:0]; // @[package.scala 234:46]
  wire [9:0] _aFragOH1_T_1 = 10'h7 << aFrag; // @[package.scala 234:77]
  wire [2:0] aFragOH1 = ~_aFragOH1_T_1[2:0]; // @[package.scala 234:46]
  wire  aHasData = ~repeater_io_deq_bits_opcode[2]; // @[Edges.scala 91:28]
  reg [2:0] gennum; // @[Fragmenter.scala 291:29]
  wire  aFirst = gennum == 3'h0; // @[Fragmenter.scala 292:29]
  wire [2:0] _old_gennum1_T_2 = gennum - 3'h1; // @[Fragmenter.scala 293:79]
  wire [2:0] old_gennum1 = aFirst ? aOrigOH1[5:3] : _old_gennum1_T_2; // @[Fragmenter.scala 293:30]
  wire [2:0] _new_gennum_T = ~old_gennum1; // @[Fragmenter.scala 294:28]
  wire [2:0] new_gennum = ~_new_gennum_T; // @[Fragmenter.scala 294:26]
  reg  aToggle_r; // @[Reg.scala 15:16]
  wire  _GEN_5 = aFirst ? dToggle : aToggle_r; // @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
  wire  bundleOut_0_a_bits_source_hi_lo = ~_GEN_5; // @[Fragmenter.scala 297:23]
  wire  bundleOut_0_a_valid = repeater_io_deq_valid; // @[Nodes.scala 1207:84 Fragmenter.scala 303:15]
  wire  _T_8 = auto_out_a_ready & bundleOut_0_a_valid; // @[Decoupled.scala 40:37]
  wire  _repeater_io_repeat_T = ~aHasData; // @[Fragmenter.scala 302:31]
  wire [5:0] _bundleOut_0_a_bits_address_T = {old_gennum1, 3'h0}; // @[Fragmenter.scala 304:65]
  wire [5:0] _bundleOut_0_a_bits_address_T_1 = ~aOrigOH1; // @[Fragmenter.scala 304:90]
  wire [5:0] _bundleOut_0_a_bits_address_T_2 = _bundleOut_0_a_bits_address_T | _bundleOut_0_a_bits_address_T_1; // @[Fragmenter.scala 304:88]
  wire [5:0] _GEN_10 = {{3'd0}, aFragOH1}; // @[Fragmenter.scala 304:100]
  wire [5:0] _bundleOut_0_a_bits_address_T_3 = _bundleOut_0_a_bits_address_T_2 | _GEN_10; // @[Fragmenter.scala 304:100]
  wire [5:0] _bundleOut_0_a_bits_address_T_4 = _bundleOut_0_a_bits_address_T_3 | 6'h7; // @[Fragmenter.scala 304:111]
  wire [5:0] _bundleOut_0_a_bits_address_T_5 = ~_bundleOut_0_a_bits_address_T_4; // @[Fragmenter.scala 304:51]
  wire [28:0] _GEN_11 = {{23'd0}, _bundleOut_0_a_bits_address_T_5}; // @[Fragmenter.scala 304:49]
  wire [4:0] bundleOut_0_a_bits_source_hi = {repeater_io_deq_bits_source,bundleOut_0_a_bits_source_hi_lo}; // @[Cat.scala 30:58]
  wire  _T_9 = ~repeater_io_full; // @[Fragmenter.scala 309:17]
  TLMonitor_58 monitor ( // @[Nodes.scala 24:25]
    .clock(monitor_clock),
    .reset(monitor_reset),
    .io_in_a_ready(monitor_io_in_a_ready),
    .io_in_a_valid(monitor_io_in_a_valid),
    .io_in_a_bits_opcode(monitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(monitor_io_in_a_bits_param),
    .io_in_a_bits_size(monitor_io_in_a_bits_size),
    .io_in_a_bits_source(monitor_io_in_a_bits_source),
    .io_in_a_bits_address(monitor_io_in_a_bits_address),
    .io_in_a_bits_mask(monitor_io_in_a_bits_mask),
    .io_in_a_bits_data(monitor_io_in_a_bits_data),
    .io_in_a_bits_corrupt(monitor_io_in_a_bits_corrupt),
    .io_in_d_ready(monitor_io_in_d_ready),
    .io_in_d_valid(monitor_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(monitor_io_in_d_bits_param),
    .io_in_d_bits_size(monitor_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_io_in_d_bits_source),
    .io_in_d_bits_sink(monitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(monitor_io_in_d_bits_denied),
    .io_in_d_bits_data(monitor_io_in_d_bits_data),
    .io_in_d_bits_corrupt(monitor_io_in_d_bits_corrupt)
  );
  Repeater_7 repeater ( // @[Fragmenter.scala 262:30]
    .clock(repeater_clock),
    .reset(repeater_reset),
    .io_repeat(repeater_io_repeat),
    .io_full(repeater_io_full),
    .io_enq_ready(repeater_io_enq_ready),
    .io_enq_valid(repeater_io_enq_valid),
    .io_enq_bits_opcode(repeater_io_enq_bits_opcode),
    .io_enq_bits_param(repeater_io_enq_bits_param),
    .io_enq_bits_size(repeater_io_enq_bits_size),
    .io_enq_bits_source(repeater_io_enq_bits_source),
    .io_enq_bits_address(repeater_io_enq_bits_address),
    .io_enq_bits_mask(repeater_io_enq_bits_mask),
    .io_enq_bits_data(repeater_io_enq_bits_data),
    .io_enq_bits_corrupt(repeater_io_enq_bits_corrupt),
    .io_deq_ready(repeater_io_deq_ready),
    .io_deq_valid(repeater_io_deq_valid),
    .io_deq_bits_opcode(repeater_io_deq_bits_opcode),
    .io_deq_bits_param(repeater_io_deq_bits_param),
    .io_deq_bits_size(repeater_io_deq_bits_size),
    .io_deq_bits_source(repeater_io_deq_bits_source),
    .io_deq_bits_address(repeater_io_deq_bits_address),
    .io_deq_bits_mask(repeater_io_deq_bits_mask),
    .io_deq_bits_data(repeater_io_deq_bits_data),
    .io_deq_bits_corrupt(repeater_io_deq_bits_corrupt)
  );
  assign auto_in_a_ready = repeater_io_enq_ready; // @[Nodes.scala 1210:84 Fragmenter.scala 263:25]
  assign auto_in_d_valid = auto_out_d_valid & ~drop; // @[Fragmenter.scala 224:36]
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_size = dFirst ? dFirst_size : dOrig; // @[Fragmenter.scala 227:32]
  assign auto_in_d_bits_source = auto_out_d_bits_source[7:4]; // @[Fragmenter.scala 226:47]
  assign auto_in_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_out_a_valid = repeater_io_deq_valid; // @[Nodes.scala 1207:84 Fragmenter.scala 303:15]
  assign auto_out_a_bits_opcode = repeater_io_deq_bits_opcode; // @[Nodes.scala 1207:84 Fragmenter.scala 303:15]
  assign auto_out_a_bits_param = repeater_io_deq_bits_param; // @[Nodes.scala 1207:84 Fragmenter.scala 303:15]
  assign auto_out_a_bits_size = aFrag[1:0]; // @[Nodes.scala 1207:84 Fragmenter.scala 306:25]
  assign auto_out_a_bits_source = {bundleOut_0_a_bits_source_hi,new_gennum}; // @[Cat.scala 30:58]
  assign auto_out_a_bits_address = repeater_io_deq_bits_address | _GEN_11; // @[Fragmenter.scala 304:49]
  assign auto_out_a_bits_mask = repeater_io_full ? 8'hff : auto_in_a_bits_mask; // @[Fragmenter.scala 313:31]
  assign auto_out_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_corrupt = repeater_io_deq_bits_corrupt; // @[Nodes.scala 1207:84 Fragmenter.scala 303:15]
  assign auto_out_d_ready = auto_in_d_ready | drop; // @[Fragmenter.scala 223:35]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = repeater_io_enq_ready; // @[Nodes.scala 1210:84 Fragmenter.scala 263:25]
  assign monitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = auto_out_d_valid & ~drop; // @[Fragmenter.scala 224:36]
  assign monitor_io_in_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_size = dFirst ? dFirst_size : dOrig; // @[Fragmenter.scala 227:32]
  assign monitor_io_in_d_bits_source = auto_out_d_bits_source[7:4]; // @[Fragmenter.scala 226:47]
  assign monitor_io_in_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign repeater_clock = clock;
  assign repeater_reset = reset;
  assign repeater_io_repeat = ~aHasData & new_gennum != 3'h0; // @[Fragmenter.scala 302:41]
  assign repeater_io_enq_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign repeater_io_enq_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign repeater_io_enq_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign repeater_io_enq_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign repeater_io_enq_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign repeater_io_enq_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign repeater_io_enq_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign repeater_io_enq_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign repeater_io_enq_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign repeater_io_deq_ready = auto_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  always @(posedge clock) begin
    if (reset) begin // @[Fragmenter.scala 189:29]
      acknum <= 3'h0; // @[Fragmenter.scala 189:29]
    end else if (_T_7) begin // @[Fragmenter.scala 208:29]
      if (dFirst) begin // @[Fragmenter.scala 209:24]
        acknum <= dFragnum;
      end else begin
        acknum <= _acknum_T_1;
      end
    end
    if (_T_7) begin // @[Fragmenter.scala 208:29]
      if (dFirst) begin // @[Fragmenter.scala 210:25]
        dOrig <= dFirst_size; // @[Fragmenter.scala 211:19]
      end
    end
    if (reset) begin // @[Fragmenter.scala 191:30]
      dToggle <= 1'h0; // @[Fragmenter.scala 191:30]
    end else if (_T_7) begin // @[Fragmenter.scala 208:29]
      if (dFirst) begin // @[Fragmenter.scala 210:25]
        dToggle <= auto_out_d_bits_source[3]; // @[Fragmenter.scala 212:21]
      end
    end
    if (reset) begin // @[Fragmenter.scala 291:29]
      gennum <= 3'h0; // @[Fragmenter.scala 291:29]
    end else if (_T_8) begin // @[Fragmenter.scala 300:29]
      gennum <= new_gennum; // @[Fragmenter.scala 300:38]
    end
    if (aFirst) begin // @[Reg.scala 16:19]
      aToggle_r <= dToggle; // @[Reg.scala 16:23]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~repeater_io_full | _repeater_io_repeat_T | reset)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Fragmenter.scala:309 assert (!repeater.io.full || !aHasData)\n"
            ); // @[Fragmenter.scala 309:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~repeater_io_full | _repeater_io_repeat_T | reset)) begin
          $fatal; // @[Fragmenter.scala 309:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_9 | repeater_io_deq_bits_mask == 8'hff | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Fragmenter.scala:312 assert (!repeater.io.full || in_a.bits.mask === fullMask)\n"
            ); // @[Fragmenter.scala 312:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_9 | repeater_io_deq_bits_mask == 8'hff | reset)) begin
          $fatal; // @[Fragmenter.scala 312:16]
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
  acknum = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  dOrig = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  dToggle = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  gennum = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  aToggle_r = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
