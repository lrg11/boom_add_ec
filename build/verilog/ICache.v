module ICache(
  input         clock,
  input         reset,
  input         auto_master_out_a_ready,
  output        auto_master_out_a_valid,
  output [2:0]  auto_master_out_a_bits_opcode,
  output [2:0]  auto_master_out_a_bits_param,
  output [3:0]  auto_master_out_a_bits_size,
  output        auto_master_out_a_bits_source,
  output [31:0] auto_master_out_a_bits_address,
  output [7:0]  auto_master_out_a_bits_mask,
  output [63:0] auto_master_out_a_bits_data,
  output        auto_master_out_a_bits_corrupt,
  output        auto_master_out_d_ready,
  input         auto_master_out_d_valid,
  input  [2:0]  auto_master_out_d_bits_opcode,
  input  [1:0]  auto_master_out_d_bits_param,
  input  [3:0]  auto_master_out_d_bits_size,
  input         auto_master_out_d_bits_source,
  input  [1:0]  auto_master_out_d_bits_sink,
  input         auto_master_out_d_bits_denied,
  input  [63:0] auto_master_out_d_bits_data,
  input         auto_master_out_d_bits_corrupt,
  output        io_req_ready,
  input         io_req_valid,
  input  [38:0] io_req_bits_addr,
  input  [31:0] io_s1_paddr,
  input         io_s1_kill,
  input         io_s2_kill,
  input         io_s2_prefetch,
  output        io_resp_valid,
  output [63:0] io_resp_bits_data,
  output        io_resp_bits_replay,
  output        io_resp_bits_ae,
  input         io_invalidate,
  output        io_perf_acquire
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
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
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg [19:0] tag_array_0 [0:63]; // @[icache.scala 180:30]
  wire [19:0] tag_array_0_tag_rdata_data; // @[icache.scala 180:30]
  wire [5:0] tag_array_0_tag_rdata_addr; // @[icache.scala 180:30]
  wire [19:0] tag_array_0_MPORT_data; // @[icache.scala 180:30]
  wire [5:0] tag_array_0_MPORT_addr; // @[icache.scala 180:30]
  wire  tag_array_0_MPORT_mask; // @[icache.scala 180:30]
  wire  tag_array_0_MPORT_en; // @[icache.scala 180:30]
  reg  tag_array_0_tag_rdata_en_pipe_0;
  reg [5:0] tag_array_0_tag_rdata_addr_pipe_0;
  reg [63:0] dataArrayWay_0 [0:511]; // @[DescribedSRAM.scala 19:26]
  wire [63:0] dataArrayWay_0_MPORT_2_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] dataArrayWay_0_MPORT_2_addr; // @[DescribedSRAM.scala 19:26]
  wire [63:0] dataArrayWay_0_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
  wire [8:0] dataArrayWay_0_MPORT_1_addr; // @[DescribedSRAM.scala 19:26]
  wire  dataArrayWay_0_MPORT_1_mask; // @[DescribedSRAM.scala 19:26]
  wire  dataArrayWay_0_MPORT_1_en; // @[DescribedSRAM.scala 19:26]
  reg  dataArrayWay_0_MPORT_2_en_pipe_0;
  reg [8:0] dataArrayWay_0_MPORT_2_addr_pipe_0;
  wire  s0_valid = io_req_ready & io_req_valid; // @[Decoupled.scala 40:37]
  reg  s1_valid; // @[icache.scala 155:25]
  reg  s2_valid; // @[icache.scala 158:25]
  reg  s2_hit; // @[icache.scala 159:23]
  reg  invalidated; // @[icache.scala 162:24]
  reg  refill_valid; // @[icache.scala 163:29]
  reg  REG; // @[icache.scala 165:48]
  wire  s2_miss = s2_valid & ~s2_hit & ~REG; // @[icache.scala 165:37]
  wire  _bundleOut_0_a_valid_T = ~refill_valid; // @[icache.scala 351:32]
  wire  tl_out_a_valid = s2_miss & ~refill_valid & ~io_s2_kill; // @[icache.scala 351:46]
  wire  refill_fire = auto_master_out_a_ready & tl_out_a_valid; // @[Decoupled.scala 40:37]
  wire  _T_7 = s1_valid & ~(refill_valid | s2_miss); // @[icache.scala 166:54]
  reg [31:0] refill_paddr; // @[Reg.scala 15:16]
  wire [5:0] refill_idx = refill_paddr[11:6]; // @[icache.scala 168:32]
  wire  opdata = auto_master_out_d_bits_opcode[0]; // @[Edges.scala 105:36]
  wire  refill_one_beat = auto_master_out_d_valid & opdata; // @[icache.scala 169:41]
  wire [26:0] _beats1_decode_T_1 = 27'hfff << auto_master_out_d_bits_size; // @[package.scala 234:77]
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] beats1_decode = _beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire [8:0] beats1 = opdata ? beats1_decode : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] counter; // @[Edges.scala 228:27]
  wire [8:0] counter1 = counter - 9'h1; // @[Edges.scala 229:28]
  wire  first = counter == 9'h0; // @[Edges.scala 230:25]
  wire  last = counter == 9'h1 | beats1 == 9'h0; // @[Edges.scala 231:37]
  wire  d_done = last & auto_master_out_d_valid; // @[Edges.scala 232:22]
  wire [8:0] _count_T = ~counter1; // @[Edges.scala 233:27]
  wire [8:0] refill_cnt = beats1 & _count_T; // @[Edges.scala 233:25]
  wire  refill_done = refill_one_beat & d_done; // @[icache.scala 174:37]
  wire  _T_12 = ~refill_done; // @[icache.scala 181:71]
  reg [63:0] vb_array; // @[icache.scala 186:25]
  wire [6:0] _T_17 = {1'h0,refill_idx}; // @[Cat.scala 30:58]
  wire  _T_18 = ~invalidated; // @[icache.scala 188:75]
  wire [127:0] _T_20 = 128'h1 << _T_17; // @[icache.scala 188:32]
  wire [127:0] _GEN_28 = {{64'd0}, vb_array}; // @[icache.scala 188:32]
  wire [127:0] _T_21 = _GEN_28 | _T_20; // @[icache.scala 188:32]
  wire [63:0] _T_22 = ~vb_array; // @[icache.scala 188:32]
  wire [127:0] _GEN_29 = {{64'd0}, _T_22}; // @[icache.scala 188:32]
  wire [127:0] _T_23 = _GEN_29 | _T_20; // @[icache.scala 188:32]
  wire [127:0] _T_24 = ~_T_23; // @[icache.scala 188:32]
  wire [127:0] _T_25 = refill_done & ~invalidated ? _T_21 : _T_24; // @[icache.scala 188:32]
  wire [127:0] _GEN_13 = refill_one_beat ? _T_25 : {{64'd0}, vb_array}; // @[icache.scala 187:26 icache.scala 188:14 icache.scala 186:25]
  wire [127:0] _GEN_14 = io_invalidate ? 128'h0 : _GEN_13; // @[icache.scala 191:24 icache.scala 192:14]
  wire  _GEN_15 = io_invalidate | invalidated; // @[icache.scala 191:24 icache.scala 193:17 icache.scala 162:24]
  wire [5:0] s1_idx = io_s1_paddr[11:6]; // @[icache.scala 200:29]
  wire [19:0] s1_tag = io_s1_paddr[31:12]; // @[icache.scala 201:29]
  wire [6:0] _T_26 = {1'h0,s1_idx}; // @[Cat.scala 30:58]
  wire [63:0] _T_27 = vb_array >> _T_26; // @[icache.scala 202:25]
  wire  s1_vb = _T_27[0]; // @[icache.scala 202:25]
  wire  wen = refill_one_beat & _T_18; // @[icache.scala 248:34]
  wire [8:0] _T_39 = {refill_idx, 3'h0}; // @[icache.scala 250:54]
  wire [8:0] _T_40 = _T_39 | refill_cnt; // @[icache.scala 250:81]
  wire  _T_42 = ~wen; // @[icache.scala 258:55]
  reg [63:0] REG_1; // @[icache.scala 258:30]
  wire  _GEN_26 = refill_fire | refill_valid; // @[icache.scala 363:22 icache.scala 363:37 icache.scala 163:29]
  assign tag_array_0_tag_rdata_addr = tag_array_0_tag_rdata_addr_pipe_0;
  assign tag_array_0_tag_rdata_data = tag_array_0[tag_array_0_tag_rdata_addr]; // @[icache.scala 180:30]
  assign tag_array_0_MPORT_data = refill_paddr[31:12];
  assign tag_array_0_MPORT_addr = refill_paddr[11:6];
  assign tag_array_0_MPORT_mask = 1'h1;
  assign tag_array_0_MPORT_en = refill_one_beat & d_done;
  assign dataArrayWay_0_MPORT_2_addr = dataArrayWay_0_MPORT_2_addr_pipe_0;
  assign dataArrayWay_0_MPORT_2_data = dataArrayWay_0[dataArrayWay_0_MPORT_2_addr]; // @[DescribedSRAM.scala 19:26]
  assign dataArrayWay_0_MPORT_1_data = auto_master_out_d_bits_data;
  assign dataArrayWay_0_MPORT_1_addr = refill_one_beat ? _T_40 : io_req_bits_addr[11:3];
  assign dataArrayWay_0_MPORT_1_mask = 1'h1;
  assign dataArrayWay_0_MPORT_1_en = refill_one_beat & _T_18;
  assign auto_master_out_a_valid = s2_miss & ~refill_valid & ~io_s2_kill; // @[icache.scala 351:46]
  assign auto_master_out_a_bits_opcode = 3'h4; // @[Edges.scala 447:17 Edges.scala 448:15]
  assign auto_master_out_a_bits_param = 3'h0; // @[Edges.scala 447:17 Edges.scala 449:15]
  assign auto_master_out_a_bits_size = 4'h6; // @[Edges.scala 447:17 Edges.scala 450:15]
  assign auto_master_out_a_bits_source = 1'h0; // @[Edges.scala 447:17 Edges.scala 451:15]
  assign auto_master_out_a_bits_address = {refill_paddr[31:6], 6'h0}; // @[icache.scala 354:48]
  assign auto_master_out_a_bits_mask = 8'hff; // @[Cat.scala 30:58]
  assign auto_master_out_a_bits_data = 64'h0; // @[Edges.scala 447:17 Edges.scala 454:15]
  assign auto_master_out_a_bits_corrupt = 1'h0; // @[Edges.scala 447:17 Edges.scala 455:15]
  assign auto_master_out_d_ready = 1'h1; // @[Nodes.scala 1207:84 icache.scala 175:18]
  assign io_req_ready = ~refill_one_beat; // @[icache.scala 171:19]
  assign io_resp_valid = s2_valid & s2_hit; // @[icache.scala 349:29]
  assign io_resp_bits_data = REG_1; // @[icache.scala 196:23 icache.scala 258:20]
  assign io_resp_bits_replay = 1'h0;
  assign io_resp_bits_ae = 1'h0;
  assign io_perf_acquire = auto_master_out_a_ready & tl_out_a_valid; // @[Decoupled.scala 40:37]
  always @(posedge clock) begin
    if(tag_array_0_MPORT_en & tag_array_0_MPORT_mask) begin
      tag_array_0[tag_array_0_MPORT_addr] <= tag_array_0_MPORT_data; // @[icache.scala 180:30]
    end
    tag_array_0_tag_rdata_en_pipe_0 <= _T_12 & s0_valid;
    if (_T_12 & s0_valid) begin
      tag_array_0_tag_rdata_addr_pipe_0 <= io_req_bits_addr[11:6];
    end
    if(dataArrayWay_0_MPORT_1_en & dataArrayWay_0_MPORT_1_mask) begin
      dataArrayWay_0[dataArrayWay_0_MPORT_1_addr] <= dataArrayWay_0_MPORT_1_data; // @[DescribedSRAM.scala 19:26]
    end
    dataArrayWay_0_MPORT_2_en_pipe_0 <= _T_42 & s0_valid;
    if (_T_42 & s0_valid) begin
      if (refill_one_beat) begin
        dataArrayWay_0_MPORT_2_addr_pipe_0 <= _T_40;
      end else begin
        dataArrayWay_0_MPORT_2_addr_pipe_0 <= io_req_bits_addr[11:3];
      end
    end
    s1_valid <= io_req_ready & io_req_valid; // @[Decoupled.scala 40:37]
    s2_valid <= s1_valid & ~io_s1_kill; // @[icache.scala 158:35]
    s2_hit <= s1_vb & tag_array_0_tag_rdata_data == s1_tag; // @[icache.scala 204:28]
    if (_bundleOut_0_a_valid_T) begin // @[icache.scala 362:24]
      invalidated <= 1'h0; // @[icache.scala 362:38]
    end else begin
      invalidated <= _GEN_15;
    end
    if (reset) begin // @[icache.scala 163:29]
      refill_valid <= 1'h0; // @[icache.scala 163:29]
    end else if (refill_done) begin // @[icache.scala 364:22]
      refill_valid <= 1'h0; // @[icache.scala 364:37]
    end else begin
      refill_valid <= _GEN_26;
    end
    REG <= refill_valid; // @[icache.scala 165:48]
    if (_T_7) begin // @[Reg.scala 16:19]
      refill_paddr <= io_s1_paddr; // @[Reg.scala 16:23]
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (auto_master_out_d_valid) begin // @[Edges.scala 234:17]
      if (first) begin // @[Edges.scala 235:21]
        if (opdata) begin // @[Edges.scala 220:14]
          counter <= beats1_decode;
        end else begin
          counter <= 9'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
    if (reset) begin // @[icache.scala 186:25]
      vb_array <= 64'h0; // @[icache.scala 186:25]
    end else begin
      vb_array <= _GEN_14[63:0];
    end
    REG_1 <= dataArrayWay_0_MPORT_2_data; // @[icache.scala 258:30]
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
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_0[initvar] = _RAND_0[19:0];
  _RAND_3 = {2{`RANDOM}};
  for (initvar = 0; initvar < 512; initvar = initvar+1)
    dataArrayWay_0[initvar] = _RAND_3[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  tag_array_0_tag_rdata_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  tag_array_0_tag_rdata_addr_pipe_0 = _RAND_2[5:0];
  _RAND_4 = {1{`RANDOM}};
  dataArrayWay_0_MPORT_2_en_pipe_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  dataArrayWay_0_MPORT_2_addr_pipe_0 = _RAND_5[8:0];
  _RAND_6 = {1{`RANDOM}};
  s1_valid = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_valid = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s2_hit = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  invalidated = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  refill_valid = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  REG = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  refill_paddr = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  counter = _RAND_13[8:0];
  _RAND_14 = {2{`RANDOM}};
  vb_array = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  REG_1 = _RAND_15[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
