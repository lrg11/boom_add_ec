module TLXbar_7(
  input         clock,
  input         reset,
  output        auto_in_1_a_ready,
  input         auto_in_1_a_valid,
  input  [2:0]  auto_in_1_a_bits_opcode,
  input  [2:0]  auto_in_1_a_bits_param,
  input  [3:0]  auto_in_1_a_bits_size,
  input         auto_in_1_a_bits_source,
  input  [31:0] auto_in_1_a_bits_address,
  input  [7:0]  auto_in_1_a_bits_mask,
  input  [63:0] auto_in_1_a_bits_data,
  input         auto_in_1_a_bits_corrupt,
  input         auto_in_1_d_ready,
  output        auto_in_1_d_valid,
  output [2:0]  auto_in_1_d_bits_opcode,
  output [1:0]  auto_in_1_d_bits_param,
  output [3:0]  auto_in_1_d_bits_size,
  output        auto_in_1_d_bits_source,
  output [1:0]  auto_in_1_d_bits_sink,
  output        auto_in_1_d_bits_denied,
  output [63:0] auto_in_1_d_bits_data,
  output        auto_in_1_d_bits_corrupt,
  output        auto_in_0_a_ready,
  input         auto_in_0_a_valid,
  input  [2:0]  auto_in_0_a_bits_opcode,
  input  [2:0]  auto_in_0_a_bits_param,
  input  [3:0]  auto_in_0_a_bits_size,
  input  [1:0]  auto_in_0_a_bits_source,
  input  [31:0] auto_in_0_a_bits_address,
  input  [7:0]  auto_in_0_a_bits_mask,
  input  [63:0] auto_in_0_a_bits_data,
  input         auto_in_0_a_bits_corrupt,
  input         auto_in_0_b_ready,
  output        auto_in_0_b_valid,
  output [2:0]  auto_in_0_b_bits_opcode,
  output [1:0]  auto_in_0_b_bits_param,
  output [3:0]  auto_in_0_b_bits_size,
  output [1:0]  auto_in_0_b_bits_source,
  output [31:0] auto_in_0_b_bits_address,
  output [7:0]  auto_in_0_b_bits_mask,
  output [63:0] auto_in_0_b_bits_data,
  output        auto_in_0_b_bits_corrupt,
  output        auto_in_0_c_ready,
  input         auto_in_0_c_valid,
  input  [2:0]  auto_in_0_c_bits_opcode,
  input  [2:0]  auto_in_0_c_bits_param,
  input  [3:0]  auto_in_0_c_bits_size,
  input  [1:0]  auto_in_0_c_bits_source,
  input  [31:0] auto_in_0_c_bits_address,
  input  [63:0] auto_in_0_c_bits_data,
  input         auto_in_0_c_bits_corrupt,
  input         auto_in_0_d_ready,
  output        auto_in_0_d_valid,
  output [2:0]  auto_in_0_d_bits_opcode,
  output [1:0]  auto_in_0_d_bits_param,
  output [3:0]  auto_in_0_d_bits_size,
  output [1:0]  auto_in_0_d_bits_source,
  output [1:0]  auto_in_0_d_bits_sink,
  output        auto_in_0_d_bits_denied,
  output [63:0] auto_in_0_d_bits_data,
  output        auto_in_0_d_bits_corrupt,
  output        auto_in_0_e_ready,
  input         auto_in_0_e_valid,
  input  [1:0]  auto_in_0_e_bits_sink,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output [2:0]  auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [2:0]  auto_out_b_bits_opcode,
  input  [1:0]  auto_out_b_bits_param,
  input  [3:0]  auto_out_b_bits_size,
  input  [2:0]  auto_out_b_bits_source,
  input  [31:0] auto_out_b_bits_address,
  input  [7:0]  auto_out_b_bits_mask,
  input  [63:0] auto_out_b_bits_data,
  input         auto_out_b_bits_corrupt,
  input         auto_out_c_ready,
  output        auto_out_c_valid,
  output [2:0]  auto_out_c_bits_opcode,
  output [2:0]  auto_out_c_bits_param,
  output [3:0]  auto_out_c_bits_size,
  output [2:0]  auto_out_c_bits_source,
  output [31:0] auto_out_c_bits_address,
  output [63:0] auto_out_c_bits_data,
  output        auto_out_c_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input  [2:0]  auto_out_d_bits_source,
  input  [1:0]  auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt,
  input         auto_out_e_ready,
  output        auto_out_e_valid,
  output [1:0]  auto_out_e_bits_sink
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_b_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_b_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_b_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_b_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_b_bits_size; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_b_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_b_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_b_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_b_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_b_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_c_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_c_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_c_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_c_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_c_bits_size; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_c_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_c_bits_address; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_c_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_c_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_e_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_e_valid; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_e_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_1_clock; // @[Nodes.scala 24:25]
  wire  monitor_1_reset; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_1_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_1_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_1_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_1_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_1_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_1_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire [2:0] _GEN_1 = {{2'd0}, auto_in_1_a_bits_source}; // @[Xbar.scala 237:55]
  wire [2:0] in_1_a_bits_source = _GEN_1 | 3'h4; // @[Xbar.scala 237:55]
  wire  requestBOI_0_0 = ~auto_out_b_bits_source[2]; // @[Parameters.scala 54:32]
  wire  requestDOI_0_0 = ~auto_out_d_bits_source[2]; // @[Parameters.scala 54:32]
  wire  requestDOI_0_1 = auto_out_d_bits_source == 3'h4; // @[Parameters.scala 46:9]
  wire [26:0] _beatsAI_decode_T_1 = 27'hfff << auto_in_0_a_bits_size; // @[package.scala 234:77]
  wire [11:0] _beatsAI_decode_T_3 = ~_beatsAI_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] beatsAI_decode = _beatsAI_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  beatsAI_opdata = ~auto_in_0_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [8:0] beatsAI_0 = beatsAI_opdata ? beatsAI_decode : 9'h0; // @[Edges.scala 220:14]
  wire [26:0] _beatsAI_decode_T_5 = 27'hfff << auto_in_1_a_bits_size; // @[package.scala 234:77]
  wire [11:0] _beatsAI_decode_T_7 = ~_beatsAI_decode_T_5[11:0]; // @[package.scala 234:46]
  wire [8:0] beatsAI_decode_1 = _beatsAI_decode_T_7[11:3]; // @[Edges.scala 219:59]
  wire  beatsAI_opdata_1 = ~auto_in_1_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [8:0] beatsAI_1 = beatsAI_opdata_1 ? beatsAI_decode_1 : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] beatsLeft; // @[Arbiter.scala 87:30]
  wire  idle = beatsLeft == 9'h0; // @[Arbiter.scala 88:28]
  wire  latch = idle & auto_out_a_ready; // @[Arbiter.scala 89:24]
  wire [1:0] readys_filter_lo = {auto_in_1_a_valid,auto_in_0_a_valid}; // @[Cat.scala 30:58]
  reg [1:0] readys_mask; // @[Arbiter.scala 23:23]
  wire [1:0] _readys_filter_T = ~readys_mask; // @[Arbiter.scala 24:30]
  wire [1:0] readys_filter_hi = readys_filter_lo & _readys_filter_T; // @[Arbiter.scala 24:28]
  wire [3:0] readys_filter = {readys_filter_hi,auto_in_1_a_valid,auto_in_0_a_valid}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_2 = {{1'd0}, readys_filter[3:1]}; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_1 = readys_filter | _GEN_2; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_4 = {readys_mask, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_3 = {{1'd0}, _readys_unready_T_1[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] readys_unready = _GEN_3 | _readys_unready_T_4; // @[Arbiter.scala 25:58]
  wire [1:0] _readys_readys_T_2 = readys_unready[3:2] & readys_unready[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] readys_readys = ~_readys_readys_T_2; // @[Arbiter.scala 26:18]
  wire [1:0] _readys_mask_T = readys_readys & readys_filter_lo; // @[Arbiter.scala 28:29]
  wire [2:0] _readys_mask_T_1 = {_readys_mask_T, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_mask_T_3 = _readys_mask_T | _readys_mask_T_1[1:0]; // @[package.scala 244:43]
  wire  readys_0 = readys_readys[0]; // @[Arbiter.scala 95:86]
  wire  readys_1 = readys_readys[1]; // @[Arbiter.scala 95:86]
  wire  earlyWinner_0 = readys_0 & auto_in_0_a_valid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1 = readys_1 & auto_in_1_a_valid; // @[Arbiter.scala 97:79]
  wire  _prefixOR_T = earlyWinner_0 | earlyWinner_1; // @[Arbiter.scala 104:53]
  wire  _T_11 = auto_in_0_a_valid | auto_in_1_a_valid; // @[Arbiter.scala 107:36]
  wire  _T_12 = ~(auto_in_0_a_valid | auto_in_1_a_valid); // @[Arbiter.scala 107:15]
  wire [8:0] maskedBeats_0 = earlyWinner_0 ? beatsAI_0 : 9'h0; // @[Arbiter.scala 111:73]
  wire [8:0] maskedBeats_1 = earlyWinner_1 ? beatsAI_1 : 9'h0; // @[Arbiter.scala 111:73]
  wire [8:0] initBeats = maskedBeats_0 | maskedBeats_1; // @[Arbiter.scala 112:44]
  reg  state_0; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_0 = idle ? earlyWinner_0 : state_0; // @[Arbiter.scala 117:30]
  reg  state_1; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1 = idle ? earlyWinner_1 : state_1; // @[Arbiter.scala 117:30]
  wire  _out_0_a_earlyValid_T_3 = state_0 & auto_in_0_a_valid | state_1 & auto_in_1_a_valid; // @[Mux.scala 27:72]
  wire  out_2_0_a_earlyValid = idle ? _T_11 : _out_0_a_earlyValid_T_3; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_2 = auto_out_a_ready & out_2_0_a_earlyValid; // @[ReadyValidCancel.scala 50:33]
  wire [8:0] _GEN_4 = {{8'd0}, _beatsLeft_T_2}; // @[Arbiter.scala 113:52]
  wire [8:0] _beatsLeft_T_4 = beatsLeft - _GEN_4; // @[Arbiter.scala 113:52]
  wire  allowed_0 = idle ? readys_0 : state_0; // @[Arbiter.scala 121:24]
  wire  allowed_1 = idle ? readys_1 : state_1; // @[Arbiter.scala 121:24]
  wire [63:0] _T_28 = muxStateEarly_0 ? auto_in_0_a_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_29 = muxStateEarly_1 ? auto_in_1_a_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_31 = muxStateEarly_0 ? auto_in_0_a_bits_mask : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_32 = muxStateEarly_1 ? auto_in_1_a_bits_mask : 8'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_34 = muxStateEarly_0 ? auto_in_0_a_bits_address : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_35 = muxStateEarly_1 ? auto_in_1_a_bits_address : 32'h0; // @[Mux.scala 27:72]
  wire [2:0] in_0_a_bits_source = {{1'd0}, auto_in_0_a_bits_source}; // @[Xbar.scala 231:18 Xbar.scala 237:29]
  wire [2:0] _T_37 = muxStateEarly_0 ? in_0_a_bits_source : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_38 = muxStateEarly_1 ? in_1_a_bits_source : 3'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_40 = muxStateEarly_0 ? auto_in_0_a_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_41 = muxStateEarly_1 ? auto_in_1_a_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_43 = muxStateEarly_0 ? auto_in_0_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_44 = muxStateEarly_1 ? auto_in_1_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_46 = muxStateEarly_0 ? auto_in_0_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_47 = muxStateEarly_1 ? auto_in_1_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  TLMonitor_36 monitor ( // @[Nodes.scala 24:25]
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
    .io_in_b_ready(monitor_io_in_b_ready),
    .io_in_b_valid(monitor_io_in_b_valid),
    .io_in_b_bits_opcode(monitor_io_in_b_bits_opcode),
    .io_in_b_bits_param(monitor_io_in_b_bits_param),
    .io_in_b_bits_size(monitor_io_in_b_bits_size),
    .io_in_b_bits_source(monitor_io_in_b_bits_source),
    .io_in_b_bits_address(monitor_io_in_b_bits_address),
    .io_in_b_bits_mask(monitor_io_in_b_bits_mask),
    .io_in_b_bits_data(monitor_io_in_b_bits_data),
    .io_in_b_bits_corrupt(monitor_io_in_b_bits_corrupt),
    .io_in_c_ready(monitor_io_in_c_ready),
    .io_in_c_valid(monitor_io_in_c_valid),
    .io_in_c_bits_opcode(monitor_io_in_c_bits_opcode),
    .io_in_c_bits_param(monitor_io_in_c_bits_param),
    .io_in_c_bits_size(monitor_io_in_c_bits_size),
    .io_in_c_bits_source(monitor_io_in_c_bits_source),
    .io_in_c_bits_address(monitor_io_in_c_bits_address),
    .io_in_c_bits_data(monitor_io_in_c_bits_data),
    .io_in_c_bits_corrupt(monitor_io_in_c_bits_corrupt),
    .io_in_d_ready(monitor_io_in_d_ready),
    .io_in_d_valid(monitor_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(monitor_io_in_d_bits_param),
    .io_in_d_bits_size(monitor_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_io_in_d_bits_source),
    .io_in_d_bits_sink(monitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(monitor_io_in_d_bits_denied),
    .io_in_d_bits_data(monitor_io_in_d_bits_data),
    .io_in_d_bits_corrupt(monitor_io_in_d_bits_corrupt),
    .io_in_e_ready(monitor_io_in_e_ready),
    .io_in_e_valid(monitor_io_in_e_valid),
    .io_in_e_bits_sink(monitor_io_in_e_bits_sink)
  );
  TLMonitor_37 monitor_1 ( // @[Nodes.scala 24:25]
    .clock(monitor_1_clock),
    .reset(monitor_1_reset),
    .io_in_a_ready(monitor_1_io_in_a_ready),
    .io_in_a_valid(monitor_1_io_in_a_valid),
    .io_in_a_bits_opcode(monitor_1_io_in_a_bits_opcode),
    .io_in_a_bits_param(monitor_1_io_in_a_bits_param),
    .io_in_a_bits_size(monitor_1_io_in_a_bits_size),
    .io_in_a_bits_source(monitor_1_io_in_a_bits_source),
    .io_in_a_bits_address(monitor_1_io_in_a_bits_address),
    .io_in_a_bits_mask(monitor_1_io_in_a_bits_mask),
    .io_in_a_bits_data(monitor_1_io_in_a_bits_data),
    .io_in_a_bits_corrupt(monitor_1_io_in_a_bits_corrupt),
    .io_in_d_ready(monitor_1_io_in_d_ready),
    .io_in_d_valid(monitor_1_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_1_io_in_d_bits_opcode),
    .io_in_d_bits_param(monitor_1_io_in_d_bits_param),
    .io_in_d_bits_size(monitor_1_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_1_io_in_d_bits_source),
    .io_in_d_bits_sink(monitor_1_io_in_d_bits_sink),
    .io_in_d_bits_denied(monitor_1_io_in_d_bits_denied),
    .io_in_d_bits_data(monitor_1_io_in_d_bits_data),
    .io_in_d_bits_corrupt(monitor_1_io_in_d_bits_corrupt)
  );
  assign auto_in_1_a_ready = auto_out_a_ready & allowed_1; // @[Arbiter.scala 123:31]
  assign auto_in_1_d_valid = auto_out_d_valid & requestDOI_0_1; // @[Xbar.scala 179:40]
  assign auto_in_1_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_source = 1'h0; // @[Bundle_ACancel.scala 53:19 Xbar.scala 269:32]
  assign auto_in_1_d_bits_sink = auto_out_d_bits_sink; // @[Xbar.scala 323:53]
  assign auto_in_1_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_a_ready = auto_out_a_ready & allowed_0; // @[Arbiter.scala 123:31]
  assign auto_in_0_b_valid = auto_out_b_valid & requestBOI_0_0; // @[Xbar.scala 179:40]
  assign auto_in_0_b_bits_opcode = auto_out_b_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_b_bits_param = auto_out_b_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_b_bits_size = auto_out_b_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_b_bits_source = auto_out_b_bits_source[1:0]; // @[Xbar.scala 228:69]
  assign auto_in_0_b_bits_address = auto_out_b_bits_address; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_b_bits_mask = auto_out_b_bits_mask; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_b_bits_data = auto_out_b_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_b_bits_corrupt = auto_out_b_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_c_ready = auto_out_c_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_valid = auto_out_d_valid & requestDOI_0_0; // @[Xbar.scala 179:40]
  assign auto_in_0_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_source = auto_out_d_bits_source[1:0]; // @[Xbar.scala 228:69]
  assign auto_in_0_d_bits_sink = auto_out_d_bits_sink; // @[Xbar.scala 323:53]
  assign auto_in_0_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_e_ready = auto_out_e_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_out_a_valid = idle ? _T_11 : _out_0_a_earlyValid_T_3; // @[Arbiter.scala 125:29]
  assign auto_out_a_bits_opcode = _T_46 | _T_47; // @[Mux.scala 27:72]
  assign auto_out_a_bits_param = _T_43 | _T_44; // @[Mux.scala 27:72]
  assign auto_out_a_bits_size = _T_40 | _T_41; // @[Mux.scala 27:72]
  assign auto_out_a_bits_source = _T_37 | _T_38; // @[Mux.scala 27:72]
  assign auto_out_a_bits_address = _T_34 | _T_35; // @[Mux.scala 27:72]
  assign auto_out_a_bits_mask = _T_31 | _T_32; // @[Mux.scala 27:72]
  assign auto_out_a_bits_data = _T_28 | _T_29; // @[Mux.scala 27:72]
  assign auto_out_a_bits_corrupt = muxStateEarly_0 & auto_in_0_a_bits_corrupt | muxStateEarly_1 &
    auto_in_1_a_bits_corrupt; // @[Mux.scala 27:72]
  assign auto_out_b_ready = requestBOI_0_0 & auto_in_0_b_ready; // @[Mux.scala 27:72]
  assign auto_out_c_valid = auto_in_0_c_valid; // @[ReadyValidCancel.scala 21:38]
  assign auto_out_c_bits_opcode = auto_in_0_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_c_bits_param = auto_in_0_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_c_bits_size = auto_in_0_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_c_bits_source = {{1'd0}, auto_in_0_c_bits_source}; // @[Xbar.scala 231:18 Xbar.scala 259:29]
  assign auto_out_c_bits_address = auto_in_0_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_c_bits_data = auto_in_0_c_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_c_bits_corrupt = auto_in_0_c_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_d_ready = requestDOI_0_0 & auto_in_0_d_ready | requestDOI_0_1 & auto_in_1_d_ready; // @[Mux.scala 27:72]
  assign auto_out_e_valid = auto_in_0_e_valid; // @[ReadyValidCancel.scala 21:38]
  assign auto_out_e_bits_sink = auto_in_0_e_bits_sink; // @[Xbar.scala 228:69]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_out_a_ready & allowed_0; // @[Arbiter.scala 123:31]
  assign monitor_io_in_a_valid = auto_in_0_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_0_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_0_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_0_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_0_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_0_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_0_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_data = auto_in_0_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_in_0_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_b_ready = auto_in_0_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_b_valid = auto_out_b_valid & requestBOI_0_0; // @[Xbar.scala 179:40]
  assign monitor_io_in_b_bits_opcode = auto_out_b_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_b_bits_param = auto_out_b_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_b_bits_size = auto_out_b_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_b_bits_source = auto_out_b_bits_source[1:0]; // @[Xbar.scala 228:69]
  assign monitor_io_in_b_bits_address = auto_out_b_bits_address; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_b_bits_mask = auto_out_b_bits_mask; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_b_bits_data = auto_out_b_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_b_bits_corrupt = auto_out_b_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_c_ready = auto_out_c_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_c_valid = auto_in_0_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_opcode = auto_in_0_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_param = auto_in_0_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_size = auto_in_0_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_source = auto_in_0_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_address = auto_in_0_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_data = auto_in_0_c_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_corrupt = auto_in_0_c_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_0_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = auto_out_d_valid & requestDOI_0_0; // @[Xbar.scala 179:40]
  assign monitor_io_in_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_source = auto_out_d_bits_source[1:0]; // @[Xbar.scala 228:69]
  assign monitor_io_in_d_bits_sink = auto_out_d_bits_sink; // @[Xbar.scala 323:53]
  assign monitor_io_in_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_e_ready = auto_out_e_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_e_valid = auto_in_0_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_e_bits_sink = auto_in_0_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_clock = clock;
  assign monitor_1_reset = reset;
  assign monitor_1_io_in_a_ready = auto_out_a_ready & allowed_1; // @[Arbiter.scala 123:31]
  assign monitor_1_io_in_a_valid = auto_in_1_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_opcode = auto_in_1_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_param = auto_in_1_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_size = auto_in_1_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_source = auto_in_1_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_address = auto_in_1_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_mask = auto_in_1_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_data = auto_in_1_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_corrupt = auto_in_1_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_d_ready = auto_in_1_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_d_valid = auto_out_d_valid & requestDOI_0_1; // @[Xbar.scala 179:40]
  assign monitor_1_io_in_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_source = 1'h0; // @[Bundle_ACancel.scala 53:19 Xbar.scala 269:32]
  assign monitor_1_io_in_d_bits_sink = auto_out_d_bits_sink; // @[Xbar.scala 323:53]
  assign monitor_1_io_in_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft <= 9'h0; // @[Arbiter.scala 87:30]
    end else if (latch) begin // @[Arbiter.scala 113:23]
      beatsLeft <= initBeats;
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      readys_mask <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (latch & |readys_filter_lo) begin // @[Arbiter.scala 27:32]
      readys_mask <= _readys_mask_T_3; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state_0 <= earlyWinner_0;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state_1 <= earlyWinner_1;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~earlyWinner_0 | ~earlyWinner_1 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
            ); // @[Arbiter.scala 105:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~earlyWinner_0 | ~earlyWinner_1 | reset)) begin
          $fatal; // @[Arbiter.scala 105:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(auto_in_0_a_valid | auto_in_1_a_valid) | _prefixOR_T | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            ); // @[Arbiter.scala 107:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(auto_in_0_a_valid | auto_in_1_a_valid) | _prefixOR_T | reset)) begin
          $fatal; // @[Arbiter.scala 107:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_12 | _T_11 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            ); // @[Arbiter.scala 108:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_12 | _T_11 | reset)) begin
          $fatal; // @[Arbiter.scala 108:14]
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
  beatsLeft = _RAND_0[8:0];
  _RAND_1 = {1{`RANDOM}};
  readys_mask = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  state_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_1 = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
