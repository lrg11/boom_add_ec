module BoomProbeUnit(
  input         clock,
  input         reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [2:0]  io_req_bits_opcode,
  input  [1:0]  io_req_bits_param,
  input  [3:0]  io_req_bits_size,
  input  [1:0]  io_req_bits_source,
  input  [31:0] io_req_bits_address,
  input  [7:0]  io_req_bits_mask,
  input  [63:0] io_req_bits_data,
  input         io_req_bits_corrupt,
  input         io_rep_ready,
  output        io_rep_valid,
  output [2:0]  io_rep_bits_opcode,
  output [2:0]  io_rep_bits_param,
  output [3:0]  io_rep_bits_size,
  output [1:0]  io_rep_bits_source,
  output [31:0] io_rep_bits_address,
  output [63:0] io_rep_bits_data,
  output        io_rep_bits_corrupt,
  input         io_meta_read_ready,
  output        io_meta_read_valid,
  output [5:0]  io_meta_read_bits_idx,
  output [3:0]  io_meta_read_bits_way_en,
  output [19:0] io_meta_read_bits_tag,
  input         io_meta_write_ready,
  output        io_meta_write_valid,
  output [5:0]  io_meta_write_bits_idx,
  output [3:0]  io_meta_write_bits_way_en,
  output [19:0] io_meta_write_bits_tag,
  output [1:0]  io_meta_write_bits_data_coh_state,
  output [19:0] io_meta_write_bits_data_tag,
  input         io_wb_req_ready,
  output        io_wb_req_valid,
  output [19:0] io_wb_req_bits_tag,
  output [5:0]  io_wb_req_bits_idx,
  output [1:0]  io_wb_req_bits_source,
  output [2:0]  io_wb_req_bits_param,
  output [3:0]  io_wb_req_bits_way_en,
  output        io_wb_req_bits_voluntary,
  input  [3:0]  io_way_en,
  input         io_wb_rdy,
  input         io_mshr_rdy,
  output        io_mshr_wb_rdy,
  input  [1:0]  io_block_state_state,
  input         io_lsu_release_ready,
  output        io_lsu_release_valid,
  output [2:0]  io_lsu_release_bits_opcode,
  output [2:0]  io_lsu_release_bits_param,
  output [3:0]  io_lsu_release_bits_size,
  output [1:0]  io_lsu_release_bits_source,
  output [31:0] io_lsu_release_bits_address,
  output [63:0] io_lsu_release_bits_data,
  output        io_lsu_release_bits_corrupt,
  output        io_state_valid,
  output [39:0] io_state_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] state; // @[dcache.scala 165:22]
  reg [1:0] req_param; // @[dcache.scala 167:16]
  reg [3:0] req_size; // @[dcache.scala 167:16]
  reg [1:0] req_source; // @[dcache.scala 167:16]
  reg [31:0] req_address; // @[dcache.scala 167:16]
  reg [3:0] way_en; // @[dcache.scala 171:19]
  wire  tag_matches = |way_en; // @[dcache.scala 172:28]
  reg [1:0] old_coh_state; // @[dcache.scala 173:20]
  wire [1:0] reply_coh_state = tag_matches ? old_coh_state : 2'h0; // @[dcache.scala 175:22]
  wire [3:0] _T = {req_param,reply_coh_state}; // @[Cat.scala 30:58]
  wire  _T_13 = 4'h8 == _T; // @[Misc.scala 55:20]
  wire [2:0] _T_15 = _T_13 ? 3'h5 : 3'h0; // @[Misc.scala 37:36]
  wire  _T_17 = 4'h9 == _T; // @[Misc.scala 55:20]
  wire [2:0] _T_19 = _T_17 ? 3'h2 : _T_15; // @[Misc.scala 37:36]
  wire  _T_21 = 4'ha == _T; // @[Misc.scala 55:20]
  wire [2:0] _T_23 = _T_21 ? 3'h1 : _T_19; // @[Misc.scala 37:36]
  wire  _T_25 = 4'hb == _T; // @[Misc.scala 55:20]
  wire [2:0] _T_27 = _T_25 ? 3'h1 : _T_23; // @[Misc.scala 37:36]
  wire  _T_29 = 4'h4 == _T; // @[Misc.scala 55:20]
  wire  _T_30 = _T_29 ? 1'h0 : _T_25; // @[Misc.scala 37:9]
  wire [2:0] _T_31 = _T_29 ? 3'h5 : _T_27; // @[Misc.scala 37:36]
  wire  _T_33 = 4'h5 == _T; // @[Misc.scala 55:20]
  wire  _T_34 = _T_33 ? 1'h0 : _T_30; // @[Misc.scala 37:9]
  wire [2:0] _T_35 = _T_33 ? 3'h4 : _T_31; // @[Misc.scala 37:36]
  wire [1:0] _T_36 = _T_33 ? 2'h1 : 2'h0; // @[Misc.scala 37:63]
  wire  _T_37 = 4'h6 == _T; // @[Misc.scala 55:20]
  wire  _T_38 = _T_37 ? 1'h0 : _T_34; // @[Misc.scala 37:9]
  wire [2:0] _T_39 = _T_37 ? 3'h0 : _T_35; // @[Misc.scala 37:36]
  wire [1:0] _T_40 = _T_37 ? 2'h1 : _T_36; // @[Misc.scala 37:63]
  wire  _T_41 = 4'h7 == _T; // @[Misc.scala 55:20]
  wire [2:0] _T_43 = _T_41 ? 3'h0 : _T_39; // @[Misc.scala 37:36]
  wire [1:0] _T_44 = _T_41 ? 2'h1 : _T_40; // @[Misc.scala 37:63]
  wire  _T_45 = 4'h0 == _T; // @[Misc.scala 55:20]
  wire  _T_46 = _T_45 ? 1'h0 : _T_41 | _T_38; // @[Misc.scala 37:9]
  wire [2:0] _T_47 = _T_45 ? 3'h5 : _T_43; // @[Misc.scala 37:36]
  wire [1:0] _T_48 = _T_45 ? 2'h0 : _T_44; // @[Misc.scala 37:63]
  wire  _T_49 = 4'h1 == _T; // @[Misc.scala 55:20]
  wire  _T_50 = _T_49 ? 1'h0 : _T_46; // @[Misc.scala 37:9]
  wire [2:0] _T_51 = _T_49 ? 3'h4 : _T_47; // @[Misc.scala 37:36]
  wire [1:0] _T_52 = _T_49 ? 2'h1 : _T_48; // @[Misc.scala 37:63]
  wire  _T_53 = 4'h2 == _T; // @[Misc.scala 55:20]
  wire  _T_54 = _T_53 ? 1'h0 : _T_50; // @[Misc.scala 37:9]
  wire [2:0] _T_55 = _T_53 ? 3'h3 : _T_51; // @[Misc.scala 37:36]
  wire [1:0] _T_56 = _T_53 ? 2'h2 : _T_52; // @[Misc.scala 37:63]
  wire  _T_57 = 4'h3 == _T; // @[Misc.scala 55:20]
  wire  is_dirty = _T_57 | _T_54; // @[Misc.scala 37:9]
  wire  _T_60 = state == 4'h0; // @[dcache.scala 181:25]
  wire  _T_61 = state == 4'h6; // @[dcache.scala 182:25]
  wire  opdata = io_rep_bits_opcode[0]; // @[Edges.scala 101:36]
  wire  _T_68 = state == 4'h1; // @[dcache.scala 188:31]
  wire  _T_69 = state == 4'h9; // @[dcache.scala 192:32]
  wire  _T_70 = state == 4'h7; // @[dcache.scala 198:28]
  wire  _T_73 = state == 4'h8; // @[package.scala 15:47]
  wire  _T_75 = state == 4'ha; // @[package.scala 15:47]
  wire  _T_79 = _T_61 | _T_70 | _T_73 | _T_69 | _T_75; // @[package.scala 72:59]
  wire  _T_81 = state == 4'h5; // @[dcache.scala 209:33]
  wire  _T_83 = io_req_ready & io_req_valid; // @[Decoupled.scala 40:37]
  wire  _T_85 = io_meta_read_ready & io_meta_read_valid; // @[Decoupled.scala 40:37]
  wire [3:0] _T_89 = io_mshr_rdy & io_wb_rdy ? 4'h4 : 4'h1; // @[dcache.scala 229:17]
  wire [3:0] _T_92 = tag_matches & is_dirty ? 4'h7 : 4'h5; // @[dcache.scala 231:17]
  wire  _T_94 = io_lsu_release_ready & io_lsu_release_valid; // @[Decoupled.scala 40:37]
  wire [3:0] _GEN_10 = _T_94 ? 4'h6 : state; // @[dcache.scala 233:34 dcache.scala 234:13 dcache.scala 165:22]
  wire [3:0] _T_96 = tag_matches ? 4'h9 : 4'h0; // @[dcache.scala 238:19]
  wire [3:0] _GEN_11 = io_rep_ready ? _T_96 : state; // @[dcache.scala 237:25 dcache.scala 238:13 dcache.scala 165:22]
  wire  _T_98 = io_wb_req_ready & io_wb_req_valid; // @[Decoupled.scala 40:37]
  wire [3:0] _GEN_12 = _T_98 ? 4'h8 : state; // @[dcache.scala 241:29 dcache.scala 242:13 dcache.scala 165:22]
  wire [3:0] _GEN_13 = io_wb_req_ready ? 4'h9 : state; // @[dcache.scala 246:28 dcache.scala 247:13 dcache.scala 165:22]
  wire  _T_101 = io_meta_write_ready & io_meta_write_valid; // @[Decoupled.scala 40:37]
  wire [3:0] _GEN_14 = _T_101 ? 4'ha : state; // @[dcache.scala 250:33 dcache.scala 251:13 dcache.scala 165:22]
  wire [3:0] _GEN_15 = _T_75 ? 4'h0 : state; // @[dcache.scala 253:45 dcache.scala 254:11 dcache.scala 165:22]
  wire [3:0] _GEN_16 = _T_69 ? _GEN_14 : _GEN_15; // @[dcache.scala 249:40]
  wire [3:0] _GEN_17 = _T_73 ? _GEN_13 : _GEN_16; // @[dcache.scala 244:44]
  wire [3:0] _GEN_18 = _T_70 ? _GEN_12 : _GEN_17; // @[dcache.scala 240:43]
  wire [3:0] _GEN_19 = _T_61 ? _GEN_11 : _GEN_18; // @[dcache.scala 236:37]
  wire [3:0] _GEN_20 = _T_81 ? _GEN_10 : _GEN_19; // @[dcache.scala 232:41]
  wire [3:0] _GEN_21 = state == 4'h4 ? _T_92 : _GEN_20; // @[dcache.scala 230:39 dcache.scala 231:11]
  wire [3:0] _GEN_24 = state == 4'h3 ? _T_89 : _GEN_21; // @[dcache.scala 225:38 dcache.scala 229:11]
  assign io_req_ready = state == 4'h0; // @[dcache.scala 181:25]
  assign io_rep_valid = state == 4'h6; // @[dcache.scala 182:25]
  assign io_rep_bits_opcode = 3'h4; // @[Edges.scala 407:17 Edges.scala 408:15]
  assign io_rep_bits_param = _T_57 ? 3'h3 : _T_55; // @[Misc.scala 37:36]
  assign io_rep_bits_size = req_size; // @[Edges.scala 407:17 Edges.scala 410:15]
  assign io_rep_bits_source = req_source; // @[Edges.scala 407:17 Edges.scala 411:15]
  assign io_rep_bits_address = req_address; // @[Edges.scala 407:17 Edges.scala 412:15]
  assign io_rep_bits_data = 64'h0; // @[Edges.scala 407:17 Edges.scala 413:15]
  assign io_rep_bits_corrupt = 1'h0; // @[Edges.scala 407:17 Edges.scala 414:15]
  assign io_meta_read_valid = state == 4'h1; // @[dcache.scala 188:31]
  assign io_meta_read_bits_idx = req_address[11:6]; // @[dcache.scala 168:28]
  assign io_meta_read_bits_way_en = 4'h0;
  assign io_meta_read_bits_tag = req_address[31:12]; // @[dcache.scala 169:29]
  assign io_meta_write_valid = state == 4'h9; // @[dcache.scala 192:32]
  assign io_meta_write_bits_idx = req_address[11:6]; // @[dcache.scala 168:28]
  assign io_meta_write_bits_way_en = way_en; // @[dcache.scala 193:29]
  assign io_meta_write_bits_tag = 20'h0;
  assign io_meta_write_bits_data_coh_state = _T_57 ? 2'h2 : _T_56; // @[Misc.scala 37:63]
  assign io_meta_write_bits_data_tag = req_address[31:12]; // @[dcache.scala 169:29]
  assign io_wb_req_valid = state == 4'h7; // @[dcache.scala 198:28]
  assign io_wb_req_bits_tag = req_address[31:12]; // @[dcache.scala 169:29]
  assign io_wb_req_bits_idx = req_address[11:6]; // @[dcache.scala 168:28]
  assign io_wb_req_bits_source = req_source; // @[dcache.scala 199:25]
  assign io_wb_req_bits_param = _T_57 ? 3'h3 : _T_55; // @[Misc.scala 37:36]
  assign io_wb_req_bits_way_en = way_en; // @[dcache.scala 203:25]
  assign io_wb_req_bits_voluntary = 1'h0; // @[dcache.scala 204:28]
  assign io_mshr_wb_rdy = ~_T_79; // @[dcache.scala 207:21]
  assign io_lsu_release_valid = state == 4'h5; // @[dcache.scala 209:33]
  assign io_lsu_release_bits_opcode = 3'h4; // @[Edges.scala 407:17 Edges.scala 408:15]
  assign io_lsu_release_bits_param = _T_57 ? 3'h3 : _T_55; // @[Misc.scala 37:36]
  assign io_lsu_release_bits_size = req_size; // @[Edges.scala 407:17 Edges.scala 410:15]
  assign io_lsu_release_bits_source = req_source; // @[Edges.scala 407:17 Edges.scala 411:15]
  assign io_lsu_release_bits_address = req_address; // @[Edges.scala 407:17 Edges.scala 412:15]
  assign io_lsu_release_bits_data = 64'h0; // @[Edges.scala 407:17 Edges.scala 413:15]
  assign io_lsu_release_bits_corrupt = 1'h0; // @[Edges.scala 407:17 Edges.scala 414:15]
  assign io_state_valid = state != 4'h0; // @[dcache.scala 178:27]
  assign io_state_bits = {{8'd0}, req_address}; // @[dcache.scala 179:18]
  always @(posedge clock) begin
    if (reset) begin // @[dcache.scala 165:22]
      state <= 4'h0; // @[dcache.scala 165:22]
    end else if (_T_60) begin // @[dcache.scala 213:30]
      if (_T_83) begin // @[dcache.scala 214:26]
        state <= 4'h1; // @[dcache.scala 215:13]
      end
    end else if (_T_68) begin // @[dcache.scala 218:39]
      if (_T_85) begin // @[dcache.scala 219:32]
        state <= 4'h2; // @[dcache.scala 220:13]
      end
    end else if (state == 4'h2) begin // @[dcache.scala 222:39]
      state <= 4'h3; // @[dcache.scala 224:11]
    end else begin
      state <= _GEN_24;
    end
    if (_T_60) begin // @[dcache.scala 213:30]
      if (_T_83) begin // @[dcache.scala 214:26]
        req_param <= io_req_bits_param; // @[dcache.scala 216:11]
      end
    end
    if (_T_60) begin // @[dcache.scala 213:30]
      if (_T_83) begin // @[dcache.scala 214:26]
        req_size <= io_req_bits_size; // @[dcache.scala 216:11]
      end
    end
    if (_T_60) begin // @[dcache.scala 213:30]
      if (_T_83) begin // @[dcache.scala 214:26]
        req_source <= io_req_bits_source; // @[dcache.scala 216:11]
      end
    end
    if (_T_60) begin // @[dcache.scala 213:30]
      if (_T_83) begin // @[dcache.scala 214:26]
        req_address <= io_req_bits_address; // @[dcache.scala 216:11]
      end
    end
    if (!(_T_60)) begin // @[dcache.scala 213:30]
      if (!(_T_68)) begin // @[dcache.scala 218:39]
        if (!(state == 4'h2)) begin // @[dcache.scala 222:39]
          if (state == 4'h3) begin // @[dcache.scala 225:38]
            way_en <= io_way_en; // @[dcache.scala 227:12]
          end
        end
      end
    end
    if (!(_T_60)) begin // @[dcache.scala 213:30]
      if (!(_T_68)) begin // @[dcache.scala 218:39]
        if (!(state == 4'h2)) begin // @[dcache.scala 222:39]
          if (state == 4'h3) begin // @[dcache.scala 225:38]
            old_coh_state <= io_block_state_state; // @[dcache.scala 226:13]
          end
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~io_rep_valid | ~opdata | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: ProbeUnit should not send ProbeAcks with data, WritebackUnit should handle it\n    at dcache.scala:185 assert(!io.rep.valid || !edge.hasData(io.rep.bits),\n"
            ); // @[dcache.scala 185:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~io_rep_valid | ~opdata | reset)) begin
          $fatal; // @[dcache.scala 185:9]
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
  state = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  req_param = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  req_size = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  req_source = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  req_address = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  way_en = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  old_coh_state = _RAND_6[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
