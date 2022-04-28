module BoomWritebackUnit(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [19:0] io_req_bits_tag,
  input  [5:0]  io_req_bits_idx,
  input  [1:0]  io_req_bits_source,
  input  [2:0]  io_req_bits_param,
  input         io_req_bits_way_en,
  input         io_req_bits_voluntary,
  input         io_meta_read_ready,
  output        io_meta_read_valid,
  output [5:0]  io_meta_read_bits_idx,
  output        io_meta_read_bits_way_en,
  output [19:0] io_meta_read_bits_tag,
  output        io_resp,
  output        io_idx_valid,
  output [5:0]  io_idx_bits,
  input         io_data_req_ready,
  output        io_data_req_valid,
  output        io_data_req_bits_way_en,
  output [11:0] io_data_req_bits_addr,
  input  [63:0] io_data_resp,
  input         io_mem_grant,
  input         io_release_ready,
  output        io_release_valid,
  output [2:0]  io_release_bits_opcode,
  output [2:0]  io_release_bits_param,
  output [3:0]  io_release_bits_size,
  output [1:0]  io_release_bits_source,
  output [31:0] io_release_bits_address,
  output [63:0] io_release_bits_data,
  output        io_release_bits_corrupt,
  input         io_lsu_release_ready,
  output        io_lsu_release_valid,
  output [2:0]  io_lsu_release_bits_opcode,
  output [2:0]  io_lsu_release_bits_param,
  output [3:0]  io_lsu_release_bits_size,
  output [1:0]  io_lsu_release_bits_source,
  output [31:0] io_lsu_release_bits_address,
  output [63:0] io_lsu_release_bits_data,
  output        io_lsu_release_bits_corrupt
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
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  reg [19:0] req_tag; // @[dcache.scala 37:16]
  reg [5:0] req_idx; // @[dcache.scala 37:16]
  reg [2:0] req_param; // @[dcache.scala 37:16]
  reg  req_way_en; // @[dcache.scala 37:16]
  reg  req_voluntary; // @[dcache.scala 37:16]
  reg [2:0] state; // @[dcache.scala 39:22]
  reg  r1_data_req_fired; // @[dcache.scala 40:34]
  reg  r2_data_req_fired; // @[dcache.scala 41:34]
  reg [3:0] r1_data_req_cnt; // @[dcache.scala 42:28]
  reg [3:0] r2_data_req_cnt; // @[dcache.scala 43:28]
  reg [3:0] data_req_cnt; // @[dcache.scala 44:29]
  wire  _T = io_release_ready & io_release_valid; // @[Decoupled.scala 40:37]
  reg [63:0] wb_buffer_0; // @[dcache.scala 46:22]
  reg [63:0] wb_buffer_1; // @[dcache.scala 46:22]
  reg [63:0] wb_buffer_2; // @[dcache.scala 46:22]
  reg [63:0] wb_buffer_3; // @[dcache.scala 46:22]
  reg [63:0] wb_buffer_4; // @[dcache.scala 46:22]
  reg [63:0] wb_buffer_5; // @[dcache.scala 46:22]
  reg [63:0] wb_buffer_6; // @[dcache.scala 46:22]
  reg [63:0] wb_buffer_7; // @[dcache.scala 46:22]
  reg  acked; // @[dcache.scala 47:22]
  wire [25:0] _T_2 = {req_tag,req_idx}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_2 = 3'h1 == data_req_cnt[2:0] ? wb_buffer_1 : wb_buffer_0; // @[Edges.scala 428:15 Edges.scala 428:15]
  wire [63:0] _GEN_3 = 3'h2 == data_req_cnt[2:0] ? wb_buffer_2 : _GEN_2; // @[Edges.scala 428:15 Edges.scala 428:15]
  wire [63:0] _GEN_4 = 3'h3 == data_req_cnt[2:0] ? wb_buffer_3 : _GEN_3; // @[Edges.scala 428:15 Edges.scala 428:15]
  wire [63:0] _GEN_5 = 3'h4 == data_req_cnt[2:0] ? wb_buffer_4 : _GEN_4; // @[Edges.scala 428:15 Edges.scala 428:15]
  wire [63:0] _GEN_6 = 3'h5 == data_req_cnt[2:0] ? wb_buffer_5 : _GEN_5; // @[Edges.scala 428:15 Edges.scala 428:15]
  wire [63:0] _GEN_7 = 3'h6 == data_req_cnt[2:0] ? wb_buffer_6 : _GEN_6; // @[Edges.scala 428:15 Edges.scala 428:15]
  wire [63:0] probeResponse_data = 3'h7 == data_req_cnt[2:0] ? wb_buffer_7 : _GEN_7; // @[Edges.scala 428:15 Edges.scala 428:15]
  wire  _T_6 = io_req_ready & io_req_valid; // @[Decoupled.scala 40:37]
  wire  _T_8 = data_req_cnt < 4'h8; // @[dcache.scala 89:40]
  wire [8:0] _T_10 = {req_idx,data_req_cnt[2:0]}; // @[Cat.scala 30:58]
  wire  _T_12 = io_data_req_ready & io_data_req_valid; // @[Decoupled.scala 40:37]
  wire  _T_13 = io_meta_read_ready & io_meta_read_valid; // @[Decoupled.scala 40:37]
  wire  _T_14 = _T_12 & _T_13; // @[dcache.scala 103:30]
  wire [3:0] _T_16 = data_req_cnt + 4'h1; // @[dcache.scala 106:36]
  wire [3:0] _GEN_28 = _T_12 & _T_13 ? _T_16 : data_req_cnt; // @[dcache.scala 103:54 dcache.scala 106:20 dcache.scala 44:29]
  wire  _T_18 = r2_data_req_cnt == 4'h7; // @[dcache.scala 110:29]
  wire [2:0] _GEN_38 = r2_data_req_cnt == 4'h7 ? 3'h2 : state; // @[dcache.scala 110:53 dcache.scala 112:15 dcache.scala 39:22]
  wire [3:0] _GEN_39 = r2_data_req_cnt == 4'h7 ? 4'h0 : _GEN_28; // @[dcache.scala 110:53 dcache.scala 113:22]
  wire  _GEN_48 = r2_data_req_fired & _T_18; // @[dcache.scala 108:30 dcache.scala 58:22]
  wire  _T_19 = state == 3'h2; // @[dcache.scala 116:22]
  wire  _T_20 = io_lsu_release_ready & io_lsu_release_valid; // @[Decoupled.scala 40:37]
  wire [2:0] _GEN_51 = _T_20 ? 3'h3 : state; // @[dcache.scala 119:34 dcache.scala 120:12 dcache.scala 39:22]
  wire  _GEN_52 = io_mem_grant | acked; // @[dcache.scala 126:25 dcache.scala 127:13 dcache.scala 47:22]
  wire [3:0] _GEN_53 = _T ? _T_16 : data_req_cnt; // @[dcache.scala 129:30 dcache.scala 130:20 dcache.scala 44:29]
  wire [2:0] _T_30 = req_voluntary ? 3'h4 : 3'h0; // @[dcache.scala 133:19]
  wire [2:0] _GEN_54 = data_req_cnt == 4'h7 & _T ? _T_30 : state; // @[dcache.scala 132:71 dcache.scala 133:13 dcache.scala 39:22]
  wire [2:0] _GEN_55 = acked ? 3'h0 : state; // @[dcache.scala 139:18 dcache.scala 140:13 dcache.scala 39:22]
  wire  _GEN_56 = state == 3'h4 ? _GEN_52 : acked; // @[dcache.scala 135:35 dcache.scala 47:22]
  wire [2:0] _GEN_57 = state == 3'h4 ? _GEN_55 : state; // @[dcache.scala 135:35 dcache.scala 39:22]
  wire  _GEN_58 = state == 3'h3 & _T_8; // @[dcache.scala 122:36 dcache.scala 123:22 dcache.scala 51:22]
  wire  _GEN_66 = state == 3'h3 ? _GEN_52 : _GEN_56; // @[dcache.scala 122:36]
  wire [3:0] _GEN_67 = state == 3'h3 ? _GEN_53 : data_req_cnt; // @[dcache.scala 122:36 dcache.scala 44:29]
  wire [2:0] _GEN_68 = state == 3'h3 ? _GEN_54 : _GEN_57; // @[dcache.scala 122:36]
  wire  _GEN_78 = state == 3'h2 ? 1'h0 : _GEN_58; // @[dcache.scala 116:41 dcache.scala 51:22]
  wire  _GEN_88 = state == 3'h1 & data_req_cnt < 4'h8; // @[dcache.scala 88:41 dcache.scala 89:24 dcache.scala 54:22]
  wire  _GEN_107 = state == 3'h1 & _GEN_48; // @[dcache.scala 88:41 dcache.scala 58:22]
  wire  _GEN_109 = state == 3'h1 ? 1'h0 : _T_19; // @[dcache.scala 88:41 dcache.scala 59:24]
  wire  _GEN_117 = state == 3'h1 ? 1'h0 : _GEN_78; // @[dcache.scala 88:41 dcache.scala 51:22]
  assign io_req_ready = state == 3'h0; // @[dcache.scala 80:15]
  assign io_meta_read_valid = state == 3'h0 ? 1'h0 : _GEN_88; // @[dcache.scala 80:30 dcache.scala 54:22]
  assign io_meta_read_bits_idx = req_idx; // @[dcache.scala 88:41 dcache.scala 90:27]
  assign io_meta_read_bits_way_en = 1'h0;
  assign io_meta_read_bits_tag = req_tag; // @[dcache.scala 88:41 dcache.scala 91:27]
  assign io_resp = state == 3'h0 ? 1'h0 : _GEN_107; // @[dcache.scala 80:30 dcache.scala 58:22]
  assign io_idx_valid = state != 3'h0; // @[dcache.scala 49:31]
  assign io_idx_bits = req_idx; // @[dcache.scala 50:22]
  assign io_data_req_valid = state == 3'h0 ? 1'h0 : _GEN_88; // @[dcache.scala 80:30 dcache.scala 56:22]
  assign io_data_req_bits_way_en = req_way_en; // @[dcache.scala 88:41 dcache.scala 94:29]
  assign io_data_req_bits_addr = {_T_10, 3'h0}; // @[dcache.scala 97:43]
  assign io_release_valid = state == 3'h0 ? 1'h0 : _GEN_117; // @[dcache.scala 80:30 dcache.scala 51:22]
  assign io_release_bits_opcode = req_voluntary ? 3'h7 : 3'h5; // @[dcache.scala 124:27]
  assign io_release_bits_param = req_param; // @[dcache.scala 124:27]
  assign io_release_bits_size = 4'h6; // @[dcache.scala 124:27]
  assign io_release_bits_source = 2'h2; // @[dcache.scala 124:27]
  assign io_release_bits_address = {_T_2, 6'h0}; // @[dcache.scala 63:41]
  assign io_release_bits_data = req_voluntary ? probeResponse_data : probeResponse_data; // @[dcache.scala 124:27]
  assign io_release_bits_corrupt = 1'h0; // @[dcache.scala 124:27]
  assign io_lsu_release_valid = state == 3'h0 ? 1'h0 : _GEN_109; // @[dcache.scala 80:30 dcache.scala 59:24]
  assign io_lsu_release_bits_opcode = 3'h5; // @[Edges.scala 422:17 Edges.scala 423:15]
  assign io_lsu_release_bits_param = req_param; // @[Edges.scala 422:17 Edges.scala 424:15]
  assign io_lsu_release_bits_size = 4'h6; // @[Edges.scala 422:17 Edges.scala 425:15]
  assign io_lsu_release_bits_source = 2'h2; // @[Edges.scala 422:17 Edges.scala 426:15]
  assign io_lsu_release_bits_address = {_T_2, 6'h0}; // @[dcache.scala 63:41]
  assign io_lsu_release_bits_data = 3'h7 == data_req_cnt[2:0] ? wb_buffer_7 : _GEN_7; // @[Edges.scala 428:15 Edges.scala 428:15]
  assign io_lsu_release_bits_corrupt = 1'h0; // @[Edges.scala 422:17 Edges.scala 429:15]
  always @(posedge clock) begin
    if (state == 3'h0) begin // @[dcache.scala 80:30]
      if (_T_6) begin // @[dcache.scala 82:26]
        req_tag <= io_req_bits_tag; // @[dcache.scala 85:11]
      end
    end
    if (state == 3'h0) begin // @[dcache.scala 80:30]
      if (_T_6) begin // @[dcache.scala 82:26]
        req_idx <= io_req_bits_idx; // @[dcache.scala 85:11]
      end
    end
    if (state == 3'h0) begin // @[dcache.scala 80:30]
      if (_T_6) begin // @[dcache.scala 82:26]
        req_param <= io_req_bits_param; // @[dcache.scala 85:11]
      end
    end
    if (state == 3'h0) begin // @[dcache.scala 80:30]
      if (_T_6) begin // @[dcache.scala 82:26]
        req_way_en <= io_req_bits_way_en; // @[dcache.scala 85:11]
      end
    end
    if (state == 3'h0) begin // @[dcache.scala 80:30]
      if (_T_6) begin // @[dcache.scala 82:26]
        req_voluntary <= io_req_bits_voluntary; // @[dcache.scala 85:11]
      end
    end
    if (reset) begin // @[dcache.scala 39:22]
      state <= 3'h0; // @[dcache.scala 39:22]
    end else if (state == 3'h0) begin // @[dcache.scala 80:30]
      if (_T_6) begin // @[dcache.scala 82:26]
        state <= 3'h1; // @[dcache.scala 83:13]
      end
    end else if (state == 3'h1) begin // @[dcache.scala 88:41]
      if (r2_data_req_fired) begin // @[dcache.scala 108:30]
        state <= _GEN_38;
      end
    end else if (state == 3'h2) begin // @[dcache.scala 116:41]
      state <= _GEN_51;
    end else begin
      state <= _GEN_68;
    end
    if (reset) begin // @[dcache.scala 40:34]
      r1_data_req_fired <= 1'h0; // @[dcache.scala 40:34]
    end else if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        r1_data_req_fired <= _T_14;
      end
    end
    if (reset) begin // @[dcache.scala 41:34]
      r2_data_req_fired <= 1'h0; // @[dcache.scala 41:34]
    end else if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        r2_data_req_fired <= r1_data_req_fired; // @[dcache.scala 101:23]
      end
    end
    if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        if (_T_12 & _T_13) begin // @[dcache.scala 103:54]
          r1_data_req_cnt <= data_req_cnt; // @[dcache.scala 105:25]
        end else begin
          r1_data_req_cnt <= 4'h0; // @[dcache.scala 100:23]
        end
      end
    end
    if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        r2_data_req_cnt <= r1_data_req_cnt; // @[dcache.scala 102:23]
      end
    end
    if (reset) begin // @[dcache.scala 44:29]
      data_req_cnt <= 4'h0; // @[dcache.scala 44:29]
    end else if (state == 3'h0) begin // @[dcache.scala 80:30]
      if (_T_6) begin // @[dcache.scala 82:26]
        data_req_cnt <= 4'h0; // @[dcache.scala 84:20]
      end
    end else if (state == 3'h1) begin // @[dcache.scala 88:41]
      if (r2_data_req_fired) begin // @[dcache.scala 108:30]
        data_req_cnt <= _GEN_39;
      end else begin
        data_req_cnt <= _GEN_28;
      end
    end else if (!(state == 3'h2)) begin // @[dcache.scala 116:41]
      data_req_cnt <= _GEN_67;
    end
    if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        if (r2_data_req_fired) begin // @[dcache.scala 108:30]
          if (3'h0 == r2_data_req_cnt[2:0]) begin // @[dcache.scala 109:34]
            wb_buffer_0 <= io_data_resp; // @[dcache.scala 109:34]
          end
        end
      end
    end
    if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        if (r2_data_req_fired) begin // @[dcache.scala 108:30]
          if (3'h1 == r2_data_req_cnt[2:0]) begin // @[dcache.scala 109:34]
            wb_buffer_1 <= io_data_resp; // @[dcache.scala 109:34]
          end
        end
      end
    end
    if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        if (r2_data_req_fired) begin // @[dcache.scala 108:30]
          if (3'h2 == r2_data_req_cnt[2:0]) begin // @[dcache.scala 109:34]
            wb_buffer_2 <= io_data_resp; // @[dcache.scala 109:34]
          end
        end
      end
    end
    if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        if (r2_data_req_fired) begin // @[dcache.scala 108:30]
          if (3'h3 == r2_data_req_cnt[2:0]) begin // @[dcache.scala 109:34]
            wb_buffer_3 <= io_data_resp; // @[dcache.scala 109:34]
          end
        end
      end
    end
    if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        if (r2_data_req_fired) begin // @[dcache.scala 108:30]
          if (3'h4 == r2_data_req_cnt[2:0]) begin // @[dcache.scala 109:34]
            wb_buffer_4 <= io_data_resp; // @[dcache.scala 109:34]
          end
        end
      end
    end
    if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        if (r2_data_req_fired) begin // @[dcache.scala 108:30]
          if (3'h5 == r2_data_req_cnt[2:0]) begin // @[dcache.scala 109:34]
            wb_buffer_5 <= io_data_resp; // @[dcache.scala 109:34]
          end
        end
      end
    end
    if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        if (r2_data_req_fired) begin // @[dcache.scala 108:30]
          if (3'h6 == r2_data_req_cnt[2:0]) begin // @[dcache.scala 109:34]
            wb_buffer_6 <= io_data_resp; // @[dcache.scala 109:34]
          end
        end
      end
    end
    if (!(state == 3'h0)) begin // @[dcache.scala 80:30]
      if (state == 3'h1) begin // @[dcache.scala 88:41]
        if (r2_data_req_fired) begin // @[dcache.scala 108:30]
          if (3'h7 == r2_data_req_cnt[2:0]) begin // @[dcache.scala 109:34]
            wb_buffer_7 <= io_data_resp; // @[dcache.scala 109:34]
          end
        end
      end
    end
    if (reset) begin // @[dcache.scala 47:22]
      acked <= 1'h0; // @[dcache.scala 47:22]
    end else if (state == 3'h0) begin // @[dcache.scala 80:30]
      if (_T_6) begin // @[dcache.scala 82:26]
        acked <= 1'h0; // @[dcache.scala 86:13]
      end
    end else if (!(state == 3'h1)) begin // @[dcache.scala 88:41]
      if (!(state == 3'h2)) begin // @[dcache.scala 116:41]
        acked <= _GEN_66;
      end
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  req_tag = _RAND_0[19:0];
  _RAND_1 = {1{`RANDOM}};
  req_idx = _RAND_1[5:0];
  _RAND_2 = {1{`RANDOM}};
  req_param = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  req_way_en = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  req_voluntary = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  state = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  r1_data_req_fired = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  r2_data_req_fired = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  r1_data_req_cnt = _RAND_8[3:0];
  _RAND_9 = {1{`RANDOM}};
  r2_data_req_cnt = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  data_req_cnt = _RAND_10[3:0];
  _RAND_11 = {2{`RANDOM}};
  wb_buffer_0 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  wb_buffer_1 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  wb_buffer_2 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  wb_buffer_3 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  wb_buffer_4 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  wb_buffer_5 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  wb_buffer_6 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  wb_buffer_7 = _RAND_18[63:0];
  _RAND_19 = {1{`RANDOM}};
  acked = _RAND_19[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
