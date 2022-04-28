module TLSourceShrinker_1(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [2:0]  auto_in_a_bits_size,
  input  [5:0]  auto_in_a_bits_source,
  input  [28:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [2:0]  auto_in_d_bits_size,
  output [5:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [2:0]  auto_out_a_bits_size,
  output [3:0]  auto_out_a_bits_source,
  output [28:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [2:0]  auto_out_d_bits_size,
  input  [3:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
  wire [5:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [28:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [5:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  reg [5:0] sourceIdMap [0:15]; // @[SourceShrinker.scala 51:30]
  wire [5:0] sourceIdMap_bundleIn_0_d_bits_source_MPORT_data; // @[SourceShrinker.scala 51:30]
  wire [3:0] sourceIdMap_bundleIn_0_d_bits_source_MPORT_addr; // @[SourceShrinker.scala 51:30]
  wire [5:0] sourceIdMap_MPORT_data; // @[SourceShrinker.scala 51:30]
  wire [3:0] sourceIdMap_MPORT_addr; // @[SourceShrinker.scala 51:30]
  wire  sourceIdMap_MPORT_mask; // @[SourceShrinker.scala 51:30]
  wire  sourceIdMap_MPORT_en; // @[SourceShrinker.scala 51:30]
  reg [15:0] allocated; // @[SourceShrinker.scala 52:32]
  wire [15:0] _nextFreeOH_T = ~allocated; // @[SourceShrinker.scala 53:35]
  wire [16:0] _nextFreeOH_T_1 = {_nextFreeOH_T, 1'h0}; // @[package.scala 244:48]
  wire [15:0] _nextFreeOH_T_3 = _nextFreeOH_T | _nextFreeOH_T_1[15:0]; // @[package.scala 244:43]
  wire [17:0] _nextFreeOH_T_4 = {_nextFreeOH_T_3, 2'h0}; // @[package.scala 244:48]
  wire [15:0] _nextFreeOH_T_6 = _nextFreeOH_T_3 | _nextFreeOH_T_4[15:0]; // @[package.scala 244:43]
  wire [19:0] _nextFreeOH_T_7 = {_nextFreeOH_T_6, 4'h0}; // @[package.scala 244:48]
  wire [15:0] _nextFreeOH_T_9 = _nextFreeOH_T_6 | _nextFreeOH_T_7[15:0]; // @[package.scala 244:43]
  wire [23:0] _nextFreeOH_T_10 = {_nextFreeOH_T_9, 8'h0}; // @[package.scala 244:48]
  wire [15:0] _nextFreeOH_T_12 = _nextFreeOH_T_9 | _nextFreeOH_T_10[15:0]; // @[package.scala 244:43]
  wire [16:0] _nextFreeOH_T_14 = {_nextFreeOH_T_12, 1'h0}; // @[SourceShrinker.scala 53:47]
  wire [16:0] _nextFreeOH_T_15 = ~_nextFreeOH_T_14; // @[SourceShrinker.scala 53:26]
  wire [16:0] _GEN_8 = {{1'd0}, _nextFreeOH_T}; // @[SourceShrinker.scala 53:53]
  wire [16:0] nextFreeOH = _nextFreeOH_T_15 & _GEN_8; // @[SourceShrinker.scala 53:53]
  wire  nextFree_hi = nextFreeOH[16]; // @[OneHot.scala 30:18]
  wire [15:0] nextFree_lo = nextFreeOH[15:0]; // @[OneHot.scala 31:18]
  wire  nextFree_hi_1 = |nextFree_hi; // @[OneHot.scala 32:14]
  wire [15:0] _GEN_9 = {{15'd0}, nextFree_hi}; // @[OneHot.scala 32:28]
  wire [15:0] _nextFree_T = _GEN_9 | nextFree_lo; // @[OneHot.scala 32:28]
  wire [7:0] nextFree_hi_2 = _nextFree_T[15:8]; // @[OneHot.scala 30:18]
  wire [7:0] nextFree_lo_1 = _nextFree_T[7:0]; // @[OneHot.scala 31:18]
  wire  nextFree_hi_3 = |nextFree_hi_2; // @[OneHot.scala 32:14]
  wire [7:0] _nextFree_T_1 = nextFree_hi_2 | nextFree_lo_1; // @[OneHot.scala 32:28]
  wire [3:0] nextFree_hi_4 = _nextFree_T_1[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] nextFree_lo_2 = _nextFree_T_1[3:0]; // @[OneHot.scala 31:18]
  wire  nextFree_hi_5 = |nextFree_hi_4; // @[OneHot.scala 32:14]
  wire [3:0] _nextFree_T_2 = nextFree_hi_4 | nextFree_lo_2; // @[OneHot.scala 32:28]
  wire [1:0] nextFree_hi_6 = _nextFree_T_2[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] nextFree_lo_3 = _nextFree_T_2[1:0]; // @[OneHot.scala 31:18]
  wire  nextFree_hi_7 = |nextFree_hi_6; // @[OneHot.scala 32:14]
  wire [1:0] _nextFree_T_3 = nextFree_hi_6 | nextFree_lo_3; // @[OneHot.scala 32:28]
  wire  nextFree_lo_4 = _nextFree_T_3[1]; // @[CircuitMath.scala 30:8]
  wire [4:0] nextFree = {nextFree_hi_1,nextFree_hi_3,nextFree_hi_5,nextFree_hi_7,nextFree_lo_4}; // @[Cat.scala 30:58]
  wire  full = &allocated; // @[SourceShrinker.scala 55:34]
  reg [2:0] a_first_counter; // @[Edges.scala 228:27]
  wire  a_first = a_first_counter == 3'h0; // @[Edges.scala 230:25]
  wire  block = a_first & full; // @[SourceShrinker.scala 60:29]
  wire  _bundleIn_0_a_ready_T = ~block; // @[SourceShrinker.scala 61:38]
  wire  bundleIn_0_a_ready = auto_out_a_ready & ~block; // @[SourceShrinker.scala 61:35]
  wire  _a_first_T = bundleIn_0_a_ready & auto_in_a_valid; // @[Decoupled.scala 40:37]
  wire [12:0] _a_first_beats1_decode_T_1 = 13'h3f << auto_in_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _a_first_beats1_decode_T_3 = ~_a_first_beats1_decode_T_1[5:0]; // @[package.scala 234:46]
  wire [2:0] a_first_beats1_decode = _a_first_beats1_decode_T_3[5:3]; // @[Edges.scala 219:59]
  wire  a_first_beats1_opdata = ~auto_in_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [2:0] a_first_counter1 = a_first_counter - 3'h1; // @[Edges.scala 229:28]
  wire  _d_last_T = auto_in_d_ready & auto_out_d_valid; // @[Decoupled.scala 40:37]
  wire [12:0] _d_last_beats1_decode_T_1 = 13'h3f << auto_out_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _d_last_beats1_decode_T_3 = ~_d_last_beats1_decode_T_1[5:0]; // @[package.scala 234:46]
  wire [2:0] d_last_beats1_decode = _d_last_beats1_decode_T_3[5:3]; // @[Edges.scala 219:59]
  wire  d_last_beats1_opdata = auto_out_d_bits_opcode[0]; // @[Edges.scala 105:36]
  wire [2:0] d_last_beats1 = d_last_beats1_opdata ? d_last_beats1_decode : 3'h0; // @[Edges.scala 220:14]
  reg [2:0] d_last_counter; // @[Edges.scala 228:27]
  wire [2:0] d_last_counter1 = d_last_counter - 3'h1; // @[Edges.scala 229:28]
  wire  d_last_first = d_last_counter == 3'h0; // @[Edges.scala 230:25]
  wire  d_last = d_last_counter == 3'h1 | d_last_beats1 == 3'h0; // @[Edges.scala 231:37]
  wire  d_last_done = d_last & _d_last_T; // @[Edges.scala 232:22]
  reg [4:0] bundleOut_0_a_bits_source_r; // @[Reg.scala 15:16]
  wire [4:0] _GEN_2 = a_first ? nextFree : bundleOut_0_a_bits_source_r; // @[Reg.scala 16:19 Reg.scala 16:23 Reg.scala 15:16]
  wire  _T_1 = a_first & _a_first_T; // @[SourceShrinker.scala 70:23]
  wire [16:0] alloc_id = _T_1 ? nextFreeOH : 17'h0; // @[SourceShrinker.scala 76:27]
  wire [15:0] _free_id_T = 16'h1 << auto_out_d_bits_source; // @[OneHot.scala 58:35]
  wire [15:0] free_id = d_last_done ? _free_id_T : 16'h0; // @[SourceShrinker.scala 77:26]
  wire [16:0] _GEN_11 = {{1'd0}, allocated}; // @[SourceShrinker.scala 78:33]
  wire [16:0] _allocated_T = _GEN_11 | alloc_id; // @[SourceShrinker.scala 78:33]
  wire [15:0] _allocated_T_1 = ~free_id; // @[SourceShrinker.scala 78:47]
  wire [16:0] _GEN_12 = {{1'd0}, _allocated_T_1}; // @[SourceShrinker.scala 78:45]
  wire [16:0] _allocated_T_2 = _allocated_T & _GEN_12; // @[SourceShrinker.scala 78:45]
  TLMonitor_33 monitor ( // @[Nodes.scala 24:25]
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
  assign sourceIdMap_bundleIn_0_d_bits_source_MPORT_addr = auto_out_d_bits_source;
  assign sourceIdMap_bundleIn_0_d_bits_source_MPORT_data = sourceIdMap[sourceIdMap_bundleIn_0_d_bits_source_MPORT_addr]; // @[SourceShrinker.scala 51:30]
  assign sourceIdMap_MPORT_data = auto_in_a_bits_source;
  assign sourceIdMap_MPORT_addr = nextFree[3:0];
  assign sourceIdMap_MPORT_mask = 1'h1;
  assign sourceIdMap_MPORT_en = a_first & _a_first_T;
  assign auto_in_a_ready = auto_out_a_ready & ~block; // @[SourceShrinker.scala 61:35]
  assign auto_in_d_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_source = sourceIdMap_bundleIn_0_d_bits_source_MPORT_data; // @[SourceShrinker.scala 68:32]
  assign auto_in_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_out_a_valid = auto_in_a_valid & _bundleIn_0_a_ready_T; // @[SourceShrinker.scala 62:35]
  assign auto_out_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_source = _GEN_2[3:0]; // @[Nodes.scala 1207:84 SourceShrinker.scala 64:27]
  assign auto_out_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_out_a_ready & ~block; // @[SourceShrinker.scala 61:35]
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
  assign monitor_io_in_d_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_source = sourceIdMap_bundleIn_0_d_bits_source_MPORT_data; // @[SourceShrinker.scala 68:32]
  assign monitor_io_in_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  always @(posedge clock) begin
    if(sourceIdMap_MPORT_en & sourceIdMap_MPORT_mask) begin
      sourceIdMap[sourceIdMap_MPORT_addr] <= sourceIdMap_MPORT_data; // @[SourceShrinker.scala 51:30]
    end
    if (reset) begin // @[SourceShrinker.scala 52:32]
      allocated <= 16'h0; // @[SourceShrinker.scala 52:32]
    end else begin
      allocated <= _allocated_T_2[15:0]; // @[SourceShrinker.scala 78:19]
    end
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
    if (reset) begin // @[Edges.scala 228:27]
      d_last_counter <= 3'h0; // @[Edges.scala 228:27]
    end else if (_d_last_T) begin // @[Edges.scala 234:17]
      if (d_last_first) begin // @[Edges.scala 235:21]
        if (d_last_beats1_opdata) begin // @[Edges.scala 220:14]
          d_last_counter <= d_last_beats1_decode;
        end else begin
          d_last_counter <= 3'h0;
        end
      end else begin
        d_last_counter <= d_last_counter1;
      end
    end
    if (a_first) begin // @[Reg.scala 16:19]
      bundleOut_0_a_bits_source_r <= nextFree; // @[Reg.scala 16:23]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    sourceIdMap[initvar] = _RAND_0[5:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  allocated = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  a_first_counter = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  d_last_counter = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  bundleOut_0_a_bits_source_r = _RAND_4[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
