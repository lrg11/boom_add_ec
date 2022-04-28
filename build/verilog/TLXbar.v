module TLXbar(
  input         clock,
  input         reset,
  output        auto_in_1_a_ready,
  input         auto_in_1_a_valid,
  input  [2:0]  auto_in_1_a_bits_opcode,
  input  [2:0]  auto_in_1_a_bits_param,
  input  [3:0]  auto_in_1_a_bits_size,
  input  [2:0]  auto_in_1_a_bits_source,
  input  [31:0] auto_in_1_a_bits_address,
  input  [7:0]  auto_in_1_a_bits_mask,
  input  [63:0] auto_in_1_a_bits_data,
  input         auto_in_1_a_bits_corrupt,
  input         auto_in_1_b_ready,
  output        auto_in_1_b_valid,
  output [2:0]  auto_in_1_b_bits_opcode,
  output [1:0]  auto_in_1_b_bits_param,
  output [3:0]  auto_in_1_b_bits_size,
  output [2:0]  auto_in_1_b_bits_source,
  output [31:0] auto_in_1_b_bits_address,
  output [7:0]  auto_in_1_b_bits_mask,
  output [63:0] auto_in_1_b_bits_data,
  output        auto_in_1_b_bits_corrupt,
  output        auto_in_1_c_ready,
  input         auto_in_1_c_valid,
  input  [2:0]  auto_in_1_c_bits_opcode,
  input  [2:0]  auto_in_1_c_bits_param,
  input  [3:0]  auto_in_1_c_bits_size,
  input  [2:0]  auto_in_1_c_bits_source,
  input  [31:0] auto_in_1_c_bits_address,
  input  [63:0] auto_in_1_c_bits_data,
  input         auto_in_1_c_bits_corrupt,
  input         auto_in_1_d_ready,
  output        auto_in_1_d_valid,
  output [2:0]  auto_in_1_d_bits_opcode,
  output [1:0]  auto_in_1_d_bits_param,
  output [3:0]  auto_in_1_d_bits_size,
  output [2:0]  auto_in_1_d_bits_source,
  output [1:0]  auto_in_1_d_bits_sink,
  output        auto_in_1_d_bits_denied,
  output [63:0] auto_in_1_d_bits_data,
  output        auto_in_1_d_bits_corrupt,
  output        auto_in_1_e_ready,
  input         auto_in_1_e_valid,
  input  [1:0]  auto_in_1_e_bits_sink,
  output        auto_in_0_a_ready,
  input         auto_in_0_a_valid,
  input  [2:0]  auto_in_0_a_bits_opcode,
  input  [2:0]  auto_in_0_a_bits_param,
  input  [3:0]  auto_in_0_a_bits_size,
  input         auto_in_0_a_bits_source,
  input  [31:0] auto_in_0_a_bits_address,
  input  [7:0]  auto_in_0_a_bits_mask,
  input  [63:0] auto_in_0_a_bits_data,
  input         auto_in_0_a_bits_corrupt,
  input         auto_in_0_d_ready,
  output        auto_in_0_d_valid,
  output [2:0]  auto_in_0_d_bits_opcode,
  output [1:0]  auto_in_0_d_bits_param,
  output [3:0]  auto_in_0_d_bits_size,
  output        auto_in_0_d_bits_source,
  output [1:0]  auto_in_0_d_bits_sink,
  output        auto_in_0_d_bits_denied,
  output [63:0] auto_in_0_d_bits_data,
  output        auto_in_0_d_bits_corrupt,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
  output [2:0]  auto_out_1_a_bits_param,
  output [2:0]  auto_out_1_a_bits_size,
  output [3:0]  auto_out_1_a_bits_source,
  output [31:0] auto_out_1_a_bits_address,
  output [7:0]  auto_out_1_a_bits_mask,
  output [63:0] auto_out_1_a_bits_data,
  output        auto_out_1_a_bits_corrupt,
  output        auto_out_1_b_ready,
  input         auto_out_1_b_valid,
  input  [2:0]  auto_out_1_b_bits_opcode,
  input  [1:0]  auto_out_1_b_bits_param,
  input  [2:0]  auto_out_1_b_bits_size,
  input  [3:0]  auto_out_1_b_bits_source,
  input  [31:0] auto_out_1_b_bits_address,
  input  [7:0]  auto_out_1_b_bits_mask,
  input  [63:0] auto_out_1_b_bits_data,
  input         auto_out_1_b_bits_corrupt,
  input         auto_out_1_c_ready,
  output        auto_out_1_c_valid,
  output [2:0]  auto_out_1_c_bits_opcode,
  output [2:0]  auto_out_1_c_bits_param,
  output [2:0]  auto_out_1_c_bits_size,
  output [3:0]  auto_out_1_c_bits_source,
  output [31:0] auto_out_1_c_bits_address,
  output [63:0] auto_out_1_c_bits_data,
  output        auto_out_1_c_bits_corrupt,
  output        auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
  input  [1:0]  auto_out_1_d_bits_param,
  input  [2:0]  auto_out_1_d_bits_size,
  input  [3:0]  auto_out_1_d_bits_source,
  input  [1:0]  auto_out_1_d_bits_sink,
  input         auto_out_1_d_bits_denied,
  input  [63:0] auto_out_1_d_bits_data,
  input         auto_out_1_d_bits_corrupt,
  input         auto_out_1_e_ready,
  output        auto_out_1_e_valid,
  output [1:0]  auto_out_1_e_bits_sink,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
  output [2:0]  auto_out_0_a_bits_param,
  output [3:0]  auto_out_0_a_bits_size,
  output [3:0]  auto_out_0_a_bits_source,
  output [30:0] auto_out_0_a_bits_address,
  output [7:0]  auto_out_0_a_bits_mask,
  output [63:0] auto_out_0_a_bits_data,
  output        auto_out_0_a_bits_corrupt,
  output        auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
  input  [1:0]  auto_out_0_d_bits_param,
  input  [3:0]  auto_out_0_d_bits_size,
  input  [3:0]  auto_out_0_d_bits_source,
  input         auto_out_0_d_bits_sink,
  input         auto_out_0_d_bits_denied,
  input  [63:0] auto_out_0_d_bits_data,
  input         auto_out_0_d_bits_corrupt
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
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_1_clock; // @[Nodes.scala 24:25]
  wire  monitor_1_reset; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_1_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_1_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_1_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_1_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_b_ready; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_b_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_b_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_b_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_1_io_in_b_bits_size; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_b_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_1_io_in_b_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_1_io_in_b_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_1_io_in_b_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_b_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_c_ready; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_c_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_c_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_c_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_1_io_in_c_bits_size; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_c_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_1_io_in_c_bits_address; // @[Nodes.scala 24:25]
  wire [63:0] monitor_1_io_in_c_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_c_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_1_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_1_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_e_ready; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_e_valid; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_e_bits_sink; // @[Nodes.scala 24:25]
  wire [3:0] _GEN_4 = {{3'd0}, auto_in_0_a_bits_source}; // @[Xbar.scala 237:55]
  wire [3:0] in_0_a_bits_source = _GEN_4 | 4'h8; // @[Xbar.scala 237:55]
  reg [8:0] beatsLeft_3; // @[Arbiter.scala 87:30]
  wire  idle_3 = beatsLeft_3 == 9'h0; // @[Arbiter.scala 88:28]
  wire  requestDOI_1_1 = ~auto_out_1_d_bits_source[3]; // @[Parameters.scala 54:32]
  wire  portsDIO_filtered_1_1_valid = auto_out_1_d_valid & requestDOI_1_1; // @[Xbar.scala 179:40]
  wire  requestDOI_0_1 = ~auto_out_0_d_bits_source[3]; // @[Parameters.scala 54:32]
  wire  portsDIO_filtered__1_valid = auto_out_0_d_valid & requestDOI_0_1; // @[Xbar.scala 179:40]
  wire [1:0] readys_filter_lo_3 = {portsDIO_filtered_1_1_valid,portsDIO_filtered__1_valid}; // @[Cat.scala 30:58]
  reg [1:0] readys_mask_3; // @[Arbiter.scala 23:23]
  wire [1:0] _readys_filter_T_3 = ~readys_mask_3; // @[Arbiter.scala 24:30]
  wire [1:0] readys_filter_hi_3 = readys_filter_lo_3 & _readys_filter_T_3; // @[Arbiter.scala 24:28]
  wire [3:0] readys_filter_3 = {readys_filter_hi_3,portsDIO_filtered_1_1_valid,portsDIO_filtered__1_valid}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_5 = {{1'd0}, readys_filter_3[3:1]}; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_16 = readys_filter_3 | _GEN_5; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_19 = {readys_mask_3, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_6 = {{1'd0}, _readys_unready_T_16[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] readys_unready_3 = _GEN_6 | _readys_unready_T_19; // @[Arbiter.scala 25:58]
  wire [1:0] _readys_readys_T_11 = readys_unready_3[3:2] & readys_unready_3[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] readys_readys_3 = ~_readys_readys_T_11; // @[Arbiter.scala 26:18]
  wire  readys_3_0 = readys_readys_3[0]; // @[Arbiter.scala 95:86]
  wire  earlyWinner_3_0 = readys_3_0 & portsDIO_filtered__1_valid; // @[Arbiter.scala 97:79]
  reg  state_3_0; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_3_0 = idle_3 ? earlyWinner_3_0 : state_3_0; // @[Arbiter.scala 117:30]
  wire [3:0] _T_181 = muxStateEarly_3_0 ? auto_out_0_d_bits_source : 4'h0; // @[Mux.scala 27:72]
  wire  readys_3_1 = readys_readys_3[1]; // @[Arbiter.scala 95:86]
  wire  earlyWinner_3_1 = readys_3_1 & portsDIO_filtered_1_1_valid; // @[Arbiter.scala 97:79]
  reg  state_3_1; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_3_1 = idle_3 ? earlyWinner_3_1 : state_3_1; // @[Arbiter.scala 117:30]
  wire [3:0] _T_182 = muxStateEarly_3_1 ? auto_out_1_d_bits_source : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] sink_ACancel_7_bits_source = _T_181 | _T_182; // @[Mux.scala 27:72]
  wire [32:0] _requestAIO_T_1 = {1'b0,$signed(auto_in_0_a_bits_address)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_3 = $signed(_requestAIO_T_1) & 33'sh96120000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_4 = $signed(_requestAIO_T_3) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_5 = auto_in_0_a_bits_address ^ 32'h100000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_6 = {1'b0,$signed(_requestAIO_T_5)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_8 = $signed(_requestAIO_T_6) & 33'sh96130000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_9 = $signed(_requestAIO_T_8) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_10 = auto_in_0_a_bits_address ^ 32'h2000000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_11 = {1'b0,$signed(_requestAIO_T_10)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_13 = $signed(_requestAIO_T_11) & 33'sh96130000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_14 = $signed(_requestAIO_T_13) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_15 = auto_in_0_a_bits_address ^ 32'h4000000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_16 = {1'b0,$signed(_requestAIO_T_15)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_18 = $signed(_requestAIO_T_16) & 33'sh94000000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_19 = $signed(_requestAIO_T_18) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_20 = auto_in_0_a_bits_address ^ 32'h14000000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_21 = {1'b0,$signed(_requestAIO_T_20)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_23 = $signed(_requestAIO_T_21) & 33'sh96130000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_24 = $signed(_requestAIO_T_23) == 33'sh0; // @[Parameters.scala 137:67]
  wire  requestAIO_0_0 = _requestAIO_T_4 | _requestAIO_T_9 | _requestAIO_T_14 | _requestAIO_T_19 | _requestAIO_T_24; // @[Xbar.scala 363:92]
  wire [31:0] _requestAIO_T_29 = auto_in_0_a_bits_address ^ 32'h20000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_30 = {1'b0,$signed(_requestAIO_T_29)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_32 = $signed(_requestAIO_T_30) & 33'sh96130000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_33 = $signed(_requestAIO_T_32) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_34 = auto_in_0_a_bits_address ^ 32'h10000000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_35 = {1'b0,$signed(_requestAIO_T_34)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_37 = $signed(_requestAIO_T_35) & 33'sh96130000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_38 = $signed(_requestAIO_T_37) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_39 = auto_in_0_a_bits_address ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_40 = {1'b0,$signed(_requestAIO_T_39)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_42 = $signed(_requestAIO_T_40) & 33'sh90000000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_43 = $signed(_requestAIO_T_42) == 33'sh0; // @[Parameters.scala 137:67]
  wire  requestAIO_0_1 = _requestAIO_T_33 | _requestAIO_T_38 | _requestAIO_T_43; // @[Xbar.scala 363:92]
  wire [32:0] _requestAIO_T_47 = {1'b0,$signed(auto_in_1_a_bits_address)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_49 = $signed(_requestAIO_T_47) & 33'sh96120000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_50 = $signed(_requestAIO_T_49) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_51 = auto_in_1_a_bits_address ^ 32'h100000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_52 = {1'b0,$signed(_requestAIO_T_51)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_54 = $signed(_requestAIO_T_52) & 33'sh96130000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_55 = $signed(_requestAIO_T_54) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_56 = auto_in_1_a_bits_address ^ 32'h2000000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_57 = {1'b0,$signed(_requestAIO_T_56)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_59 = $signed(_requestAIO_T_57) & 33'sh96130000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_60 = $signed(_requestAIO_T_59) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_61 = auto_in_1_a_bits_address ^ 32'h4000000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_62 = {1'b0,$signed(_requestAIO_T_61)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_64 = $signed(_requestAIO_T_62) & 33'sh94000000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_65 = $signed(_requestAIO_T_64) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_66 = auto_in_1_a_bits_address ^ 32'h14000000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_67 = {1'b0,$signed(_requestAIO_T_66)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_69 = $signed(_requestAIO_T_67) & 33'sh96130000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_70 = $signed(_requestAIO_T_69) == 33'sh0; // @[Parameters.scala 137:67]
  wire  requestAIO_1_0 = _requestAIO_T_50 | _requestAIO_T_55 | _requestAIO_T_60 | _requestAIO_T_65 | _requestAIO_T_70; // @[Xbar.scala 363:92]
  wire [31:0] _requestAIO_T_75 = auto_in_1_a_bits_address ^ 32'h20000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_76 = {1'b0,$signed(_requestAIO_T_75)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_78 = $signed(_requestAIO_T_76) & 33'sh96130000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_79 = $signed(_requestAIO_T_78) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_80 = auto_in_1_a_bits_address ^ 32'h10000000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_81 = {1'b0,$signed(_requestAIO_T_80)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_83 = $signed(_requestAIO_T_81) & 33'sh96130000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_84 = $signed(_requestAIO_T_83) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _requestAIO_T_85 = auto_in_1_a_bits_address ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _requestAIO_T_86 = {1'b0,$signed(_requestAIO_T_85)}; // @[Parameters.scala 137:49]
  wire [32:0] _requestAIO_T_88 = $signed(_requestAIO_T_86) & 33'sh90000000; // @[Parameters.scala 137:52]
  wire  _requestAIO_T_89 = $signed(_requestAIO_T_88) == 33'sh0; // @[Parameters.scala 137:67]
  wire  requestAIO_1_1 = _requestAIO_T_79 | _requestAIO_T_84 | _requestAIO_T_89; // @[Xbar.scala 363:92]
  wire  requestBOI_1_1 = ~auto_out_1_b_bits_source[3]; // @[Parameters.scala 54:32]
  wire  requestDOI_0_0 = auto_out_0_d_bits_source == 4'h8; // @[Parameters.scala 46:9]
  wire  requestDOI_1_0 = auto_out_1_d_bits_source == 4'h8; // @[Parameters.scala 46:9]
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
  wire [26:0] _beatsDO_decode_T_1 = 27'hfff << auto_out_0_d_bits_size; // @[package.scala 234:77]
  wire [11:0] _beatsDO_decode_T_3 = ~_beatsDO_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] beatsDO_decode = _beatsDO_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  beatsDO_opdata = auto_out_0_d_bits_opcode[0]; // @[Edges.scala 105:36]
  wire [8:0] beatsDO_0 = beatsDO_opdata ? beatsDO_decode : 9'h0; // @[Edges.scala 220:14]
  wire [3:0] out_2_1_d_bits_size = {{1'd0}, auto_out_1_d_bits_size}; // @[Xbar.scala 288:19 BundleMap.scala 247:19]
  wire [20:0] _beatsDO_decode_T_5 = 21'h3f << out_2_1_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _beatsDO_decode_T_7 = ~_beatsDO_decode_T_5[5:0]; // @[package.scala 234:46]
  wire [2:0] beatsDO_decode_1 = _beatsDO_decode_T_7[5:3]; // @[Edges.scala 219:59]
  wire  beatsDO_opdata_1 = auto_out_1_d_bits_opcode[0]; // @[Edges.scala 105:36]
  wire [2:0] beatsDO_1 = beatsDO_opdata_1 ? beatsDO_decode_1 : 3'h0; // @[Edges.scala 220:14]
  wire  portsAOI_filtered__0_earlyValid = auto_in_0_a_valid & requestAIO_0_0; // @[Xbar.scala 428:50]
  wire  portsAOI_filtered__1_earlyValid = auto_in_0_a_valid & requestAIO_0_1; // @[Xbar.scala 428:50]
  reg [8:0] beatsLeft; // @[Arbiter.scala 87:30]
  wire  idle = beatsLeft == 9'h0; // @[Arbiter.scala 88:28]
  wire  portsAOI_filtered_1_0_earlyValid = auto_in_1_a_valid & requestAIO_1_0; // @[Xbar.scala 428:50]
  wire [1:0] readys_filter_lo = {portsAOI_filtered_1_0_earlyValid,portsAOI_filtered__0_earlyValid}; // @[Cat.scala 30:58]
  reg [1:0] readys_mask; // @[Arbiter.scala 23:23]
  wire [1:0] _readys_filter_T = ~readys_mask; // @[Arbiter.scala 24:30]
  wire [1:0] readys_filter_hi = readys_filter_lo & _readys_filter_T; // @[Arbiter.scala 24:28]
  wire [3:0] readys_filter = {readys_filter_hi,portsAOI_filtered_1_0_earlyValid,portsAOI_filtered__0_earlyValid}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_7 = {{1'd0}, readys_filter[3:1]}; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_1 = readys_filter | _GEN_7; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_4 = {readys_mask, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_8 = {{1'd0}, _readys_unready_T_1[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] readys_unready = _GEN_8 | _readys_unready_T_4; // @[Arbiter.scala 25:58]
  wire [1:0] _readys_readys_T_2 = readys_unready[3:2] & readys_unready[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] readys_readys = ~_readys_readys_T_2; // @[Arbiter.scala 26:18]
  wire  readys__0 = readys_readys[0]; // @[Arbiter.scala 95:86]
  reg  state__0; // @[Arbiter.scala 116:26]
  wire  allowed__0 = idle ? readys__0 : state__0; // @[Arbiter.scala 121:24]
  wire  portsAOI_filtered__0_ready = auto_out_0_a_ready & allowed__0; // @[Arbiter.scala 123:31]
  reg [8:0] beatsLeft_1; // @[Arbiter.scala 87:30]
  wire  idle_1 = beatsLeft_1 == 9'h0; // @[Arbiter.scala 88:28]
  wire  portsAOI_filtered_1_1_earlyValid = auto_in_1_a_valid & requestAIO_1_1; // @[Xbar.scala 428:50]
  wire [1:0] readys_filter_lo_1 = {portsAOI_filtered_1_1_earlyValid,portsAOI_filtered__1_earlyValid}; // @[Cat.scala 30:58]
  reg [1:0] readys_mask_1; // @[Arbiter.scala 23:23]
  wire [1:0] _readys_filter_T_1 = ~readys_mask_1; // @[Arbiter.scala 24:30]
  wire [1:0] readys_filter_hi_1 = readys_filter_lo_1 & _readys_filter_T_1; // @[Arbiter.scala 24:28]
  wire [3:0] readys_filter_1 = {readys_filter_hi_1,portsAOI_filtered_1_1_earlyValid,portsAOI_filtered__1_earlyValid}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_9 = {{1'd0}, readys_filter_1[3:1]}; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_6 = readys_filter_1 | _GEN_9; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_9 = {readys_mask_1, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_10 = {{1'd0}, _readys_unready_T_6[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] readys_unready_1 = _GEN_10 | _readys_unready_T_9; // @[Arbiter.scala 25:58]
  wire [1:0] _readys_readys_T_5 = readys_unready_1[3:2] & readys_unready_1[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] readys_readys_1 = ~_readys_readys_T_5; // @[Arbiter.scala 26:18]
  wire  readys_1_0 = readys_readys_1[0]; // @[Arbiter.scala 95:86]
  reg  state_1_0; // @[Arbiter.scala 116:26]
  wire  allowed_1_0 = idle_1 ? readys_1_0 : state_1_0; // @[Arbiter.scala 121:24]
  wire  portsAOI_filtered__1_ready = auto_out_1_a_ready & allowed_1_0; // @[Arbiter.scala 123:31]
  wire  readys__1 = readys_readys[1]; // @[Arbiter.scala 95:86]
  reg  state__1; // @[Arbiter.scala 116:26]
  wire  allowed__1 = idle ? readys__1 : state__1; // @[Arbiter.scala 121:24]
  wire  portsAOI_filtered_1_0_ready = auto_out_0_a_ready & allowed__1; // @[Arbiter.scala 123:31]
  wire  readys_1_1 = readys_readys_1[1]; // @[Arbiter.scala 95:86]
  reg  state_1_1; // @[Arbiter.scala 116:26]
  wire  allowed_1_1 = idle_1 ? readys_1_1 : state_1_1; // @[Arbiter.scala 121:24]
  wire  portsAOI_filtered_1_1_ready = auto_out_1_a_ready & allowed_1_1; // @[Arbiter.scala 123:31]
  wire  portsDIO_filtered__0_valid = auto_out_0_d_valid & requestDOI_0_0; // @[Xbar.scala 179:40]
  reg [8:0] beatsLeft_2; // @[Arbiter.scala 87:30]
  wire  idle_2 = beatsLeft_2 == 9'h0; // @[Arbiter.scala 88:28]
  wire  portsDIO_filtered_1_0_valid = auto_out_1_d_valid & requestDOI_1_0; // @[Xbar.scala 179:40]
  wire [1:0] readys_filter_lo_2 = {portsDIO_filtered_1_0_valid,portsDIO_filtered__0_valid}; // @[Cat.scala 30:58]
  reg [1:0] readys_mask_2; // @[Arbiter.scala 23:23]
  wire [1:0] _readys_filter_T_2 = ~readys_mask_2; // @[Arbiter.scala 24:30]
  wire [1:0] readys_filter_hi_2 = readys_filter_lo_2 & _readys_filter_T_2; // @[Arbiter.scala 24:28]
  wire [3:0] readys_filter_2 = {readys_filter_hi_2,portsDIO_filtered_1_0_valid,portsDIO_filtered__0_valid}; // @[Cat.scala 30:58]
  wire [3:0] _GEN_11 = {{1'd0}, readys_filter_2[3:1]}; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_11 = readys_filter_2 | _GEN_11; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_14 = {readys_mask_2, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_12 = {{1'd0}, _readys_unready_T_11[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] readys_unready_2 = _GEN_12 | _readys_unready_T_14; // @[Arbiter.scala 25:58]
  wire [1:0] _readys_readys_T_8 = readys_unready_2[3:2] & readys_unready_2[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] readys_readys_2 = ~_readys_readys_T_8; // @[Arbiter.scala 26:18]
  wire  readys_2_0 = readys_readys_2[0]; // @[Arbiter.scala 95:86]
  reg  state_2_0; // @[Arbiter.scala 116:26]
  wire  allowed_2_0 = idle_2 ? readys_2_0 : state_2_0; // @[Arbiter.scala 121:24]
  wire  out_10_ready = auto_in_0_d_ready & allowed_2_0; // @[Arbiter.scala 123:31]
  wire  allowed_3_0 = idle_3 ? readys_3_0 : state_3_0; // @[Arbiter.scala 121:24]
  wire  out_15_ready = auto_in_1_d_ready & allowed_3_0; // @[Arbiter.scala 123:31]
  wire  readys_2_1 = readys_readys_2[1]; // @[Arbiter.scala 95:86]
  reg  state_2_1; // @[Arbiter.scala 116:26]
  wire  allowed_2_1 = idle_2 ? readys_2_1 : state_2_1; // @[Arbiter.scala 121:24]
  wire  out_11_ready = auto_in_0_d_ready & allowed_2_1; // @[Arbiter.scala 123:31]
  wire  allowed_3_1 = idle_3 ? readys_3_1 : state_3_1; // @[Arbiter.scala 121:24]
  wire  out_16_ready = auto_in_1_d_ready & allowed_3_1; // @[Arbiter.scala 123:31]
  wire  latch = idle & auto_out_0_a_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _readys_mask_T = readys_readys & readys_filter_lo; // @[Arbiter.scala 28:29]
  wire [2:0] _readys_mask_T_1 = {_readys_mask_T, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_mask_T_3 = _readys_mask_T | _readys_mask_T_1[1:0]; // @[package.scala 244:43]
  wire  earlyWinner__0 = readys__0 & portsAOI_filtered__0_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner__1 = readys__1 & portsAOI_filtered_1_0_earlyValid; // @[Arbiter.scala 97:79]
  wire  _prefixOR_T = earlyWinner__0 | earlyWinner__1; // @[Arbiter.scala 104:53]
  wire  _T_11 = portsAOI_filtered__0_earlyValid | portsAOI_filtered_1_0_earlyValid; // @[Arbiter.scala 107:36]
  wire  _T_12 = ~(portsAOI_filtered__0_earlyValid | portsAOI_filtered_1_0_earlyValid); // @[Arbiter.scala 107:15]
  wire [8:0] maskedBeats_0 = earlyWinner__0 ? beatsAI_0 : 9'h0; // @[Arbiter.scala 111:73]
  wire [8:0] maskedBeats_1 = earlyWinner__1 ? beatsAI_1 : 9'h0; // @[Arbiter.scala 111:73]
  wire [8:0] initBeats = maskedBeats_0 | maskedBeats_1; // @[Arbiter.scala 112:44]
  wire  muxStateEarly__0 = idle ? earlyWinner__0 : state__0; // @[Arbiter.scala 117:30]
  wire  muxStateEarly__1 = idle ? earlyWinner__1 : state__1; // @[Arbiter.scala 117:30]
  wire  _out_0_a_earlyValid_T_3 = state__0 & portsAOI_filtered__0_earlyValid | state__1 &
    portsAOI_filtered_1_0_earlyValid; // @[Mux.scala 27:72]
  wire  out_2_0_a_earlyValid = idle ? _T_11 : _out_0_a_earlyValid_T_3; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_2 = auto_out_0_a_ready & out_2_0_a_earlyValid; // @[ReadyValidCancel.scala 50:33]
  wire [8:0] _GEN_13 = {{8'd0}, _beatsLeft_T_2}; // @[Arbiter.scala 113:52]
  wire [8:0] _beatsLeft_T_4 = beatsLeft - _GEN_13; // @[Arbiter.scala 113:52]
  wire [63:0] _T_28 = muxStateEarly__0 ? auto_in_0_a_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_29 = muxStateEarly__1 ? auto_in_1_a_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_31 = muxStateEarly__0 ? auto_in_0_a_bits_mask : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_32 = muxStateEarly__1 ? auto_in_1_a_bits_mask : 8'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_34 = muxStateEarly__0 ? auto_in_0_a_bits_address : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_35 = muxStateEarly__1 ? auto_in_1_a_bits_address : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] out_2_0_a_bits_address = _T_34 | _T_35; // @[Mux.scala 27:72]
  wire [3:0] _T_37 = muxStateEarly__0 ? in_0_a_bits_source : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] in_1_a_bits_source = {{1'd0}, auto_in_1_a_bits_source}; // @[Xbar.scala 231:18 Xbar.scala 237:29]
  wire [3:0] _T_38 = muxStateEarly__1 ? in_1_a_bits_source : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_40 = muxStateEarly__0 ? auto_in_0_a_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_41 = muxStateEarly__1 ? auto_in_1_a_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_43 = muxStateEarly__0 ? auto_in_0_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_44 = muxStateEarly__1 ? auto_in_1_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_46 = muxStateEarly__0 ? auto_in_0_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_47 = muxStateEarly__1 ? auto_in_1_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire  latch_1 = idle_1 & auto_out_1_a_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _readys_mask_T_5 = readys_readys_1 & readys_filter_lo_1; // @[Arbiter.scala 28:29]
  wire [2:0] _readys_mask_T_6 = {_readys_mask_T_5, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_mask_T_8 = _readys_mask_T_5 | _readys_mask_T_6[1:0]; // @[package.scala 244:43]
  wire  earlyWinner_1_0 = readys_1_0 & portsAOI_filtered__1_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1_1 = readys_1_1 & portsAOI_filtered_1_1_earlyValid; // @[Arbiter.scala 97:79]
  wire  _prefixOR_T_1 = earlyWinner_1_0 | earlyWinner_1_1; // @[Arbiter.scala 104:53]
  wire  _T_59 = portsAOI_filtered__1_earlyValid | portsAOI_filtered_1_1_earlyValid; // @[Arbiter.scala 107:36]
  wire  _T_60 = ~(portsAOI_filtered__1_earlyValid | portsAOI_filtered_1_1_earlyValid); // @[Arbiter.scala 107:15]
  wire [8:0] maskedBeats_0_1 = earlyWinner_1_0 ? beatsAI_0 : 9'h0; // @[Arbiter.scala 111:73]
  wire [8:0] maskedBeats_1_1 = earlyWinner_1_1 ? beatsAI_1 : 9'h0; // @[Arbiter.scala 111:73]
  wire [8:0] initBeats_1 = maskedBeats_0_1 | maskedBeats_1_1; // @[Arbiter.scala 112:44]
  wire  muxStateEarly_1_0 = idle_1 ? earlyWinner_1_0 : state_1_0; // @[Arbiter.scala 117:30]
  wire  muxStateEarly_1_1 = idle_1 ? earlyWinner_1_1 : state_1_1; // @[Arbiter.scala 117:30]
  wire  _out_1_a_earlyValid_T_3 = state_1_0 & portsAOI_filtered__1_earlyValid | state_1_1 &
    portsAOI_filtered_1_1_earlyValid; // @[Mux.scala 27:72]
  wire  out_2_1_a_earlyValid = idle_1 ? _T_59 : _out_1_a_earlyValid_T_3; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_8 = auto_out_1_a_ready & out_2_1_a_earlyValid; // @[ReadyValidCancel.scala 50:33]
  wire [8:0] _GEN_14 = {{8'd0}, _beatsLeft_T_8}; // @[Arbiter.scala 113:52]
  wire [8:0] _beatsLeft_T_10 = beatsLeft_1 - _GEN_14; // @[Arbiter.scala 113:52]
  wire [63:0] _T_76 = muxStateEarly_1_0 ? auto_in_0_a_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_77 = muxStateEarly_1_1 ? auto_in_1_a_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_79 = muxStateEarly_1_0 ? auto_in_0_a_bits_mask : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_80 = muxStateEarly_1_1 ? auto_in_1_a_bits_mask : 8'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_82 = muxStateEarly_1_0 ? auto_in_0_a_bits_address : 32'h0; // @[Mux.scala 27:72]
  wire [31:0] _T_83 = muxStateEarly_1_1 ? auto_in_1_a_bits_address : 32'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_85 = muxStateEarly_1_0 ? in_0_a_bits_source : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_86 = muxStateEarly_1_1 ? in_1_a_bits_source : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_88 = muxStateEarly_1_0 ? auto_in_0_a_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_89 = muxStateEarly_1_1 ? auto_in_1_a_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] out_2_1_a_bits_size = _T_88 | _T_89; // @[Mux.scala 27:72]
  wire [2:0] _T_91 = muxStateEarly_1_0 ? auto_in_0_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_92 = muxStateEarly_1_1 ? auto_in_1_a_bits_param : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_94 = muxStateEarly_1_0 ? auto_in_0_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_95 = muxStateEarly_1_1 ? auto_in_1_a_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire  latch_2 = idle_2 & auto_in_0_d_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _readys_mask_T_10 = readys_readys_2 & readys_filter_lo_2; // @[Arbiter.scala 28:29]
  wire [2:0] _readys_mask_T_11 = {_readys_mask_T_10, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_mask_T_13 = _readys_mask_T_10 | _readys_mask_T_11[1:0]; // @[package.scala 244:43]
  wire  earlyWinner_2_0 = readys_2_0 & portsDIO_filtered__0_valid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_2_1 = readys_2_1 & portsDIO_filtered_1_0_valid; // @[Arbiter.scala 97:79]
  wire  _prefixOR_T_2 = earlyWinner_2_0 | earlyWinner_2_1; // @[Arbiter.scala 104:53]
  wire  _T_107 = portsDIO_filtered__0_valid | portsDIO_filtered_1_0_valid; // @[Arbiter.scala 107:36]
  wire  _T_108 = ~(portsDIO_filtered__0_valid | portsDIO_filtered_1_0_valid); // @[Arbiter.scala 107:15]
  wire [8:0] maskedBeats_0_2 = earlyWinner_2_0 ? beatsDO_0 : 9'h0; // @[Arbiter.scala 111:73]
  wire [2:0] maskedBeats_1_2 = earlyWinner_2_1 ? beatsDO_1 : 3'h0; // @[Arbiter.scala 111:73]
  wire [8:0] _GEN_15 = {{6'd0}, maskedBeats_1_2}; // @[Arbiter.scala 112:44]
  wire [8:0] initBeats_2 = maskedBeats_0_2 | _GEN_15; // @[Arbiter.scala 112:44]
  wire  muxStateEarly_2_0 = idle_2 ? earlyWinner_2_0 : state_2_0; // @[Arbiter.scala 117:30]
  wire  muxStateEarly_2_1 = idle_2 ? earlyWinner_2_1 : state_2_1; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_3 = state_2_0 & portsDIO_filtered__0_valid | state_2_1 & portsDIO_filtered_1_0_valid; // @[Mux.scala 27:72]
  wire  sink_ACancel_5_earlyValid = idle_2 ? _T_107 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_14 = auto_in_0_d_ready & sink_ACancel_5_earlyValid; // @[ReadyValidCancel.scala 50:33]
  wire [8:0] _GEN_16 = {{8'd0}, _beatsLeft_T_14}; // @[Arbiter.scala 113:52]
  wire [8:0] _beatsLeft_T_16 = beatsLeft_2 - _GEN_16; // @[Arbiter.scala 113:52]
  wire [63:0] _T_124 = muxStateEarly_2_0 ? auto_out_0_d_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_125 = muxStateEarly_2_1 ? auto_out_1_d_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [1:0] out_2_0_d_bits_sink = {{1'd0}, auto_out_0_d_bits_sink}; // @[Xbar.scala 288:19 Xbar.scala 323:28]
  wire [1:0] _T_130 = muxStateEarly_2_0 ? out_2_0_d_bits_sink : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_131 = muxStateEarly_2_1 ? auto_out_1_d_bits_sink : 2'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_136 = muxStateEarly_2_0 ? auto_out_0_d_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_137 = muxStateEarly_2_1 ? out_2_1_d_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_139 = muxStateEarly_2_0 ? auto_out_0_d_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_140 = muxStateEarly_2_1 ? auto_out_1_d_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_142 = muxStateEarly_2_0 ? auto_out_0_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_143 = muxStateEarly_2_1 ? auto_out_1_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire  latch_3 = idle_3 & auto_in_1_d_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _readys_mask_T_15 = readys_readys_3 & readys_filter_lo_3; // @[Arbiter.scala 28:29]
  wire [2:0] _readys_mask_T_16 = {_readys_mask_T_15, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_mask_T_18 = _readys_mask_T_15 | _readys_mask_T_16[1:0]; // @[package.scala 244:43]
  wire  _prefixOR_T_3 = earlyWinner_3_0 | earlyWinner_3_1; // @[Arbiter.scala 104:53]
  wire  _T_155 = portsDIO_filtered__1_valid | portsDIO_filtered_1_1_valid; // @[Arbiter.scala 107:36]
  wire  _T_156 = ~(portsDIO_filtered__1_valid | portsDIO_filtered_1_1_valid); // @[Arbiter.scala 107:15]
  wire [8:0] maskedBeats_0_3 = earlyWinner_3_0 ? beatsDO_0 : 9'h0; // @[Arbiter.scala 111:73]
  wire [2:0] maskedBeats_1_3 = earlyWinner_3_1 ? beatsDO_1 : 3'h0; // @[Arbiter.scala 111:73]
  wire [8:0] _GEN_17 = {{6'd0}, maskedBeats_1_3}; // @[Arbiter.scala 112:44]
  wire [8:0] initBeats_3 = maskedBeats_0_3 | _GEN_17; // @[Arbiter.scala 112:44]
  wire  _sink_ACancel_earlyValid_T_8 = state_3_0 & portsDIO_filtered__1_valid | state_3_1 & portsDIO_filtered_1_1_valid; // @[Mux.scala 27:72]
  wire  sink_ACancel_7_earlyValid = idle_3 ? _T_155 : _sink_ACancel_earlyValid_T_8; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_20 = auto_in_1_d_ready & sink_ACancel_7_earlyValid; // @[ReadyValidCancel.scala 50:33]
  wire [8:0] _GEN_18 = {{8'd0}, _beatsLeft_T_20}; // @[Arbiter.scala 113:52]
  wire [8:0] _beatsLeft_T_22 = beatsLeft_3 - _GEN_18; // @[Arbiter.scala 113:52]
  wire [63:0] _T_172 = muxStateEarly_3_0 ? auto_out_0_d_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [63:0] _T_173 = muxStateEarly_3_1 ? auto_out_1_d_bits_data : 64'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_178 = muxStateEarly_3_0 ? out_2_0_d_bits_sink : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_179 = muxStateEarly_3_1 ? auto_out_1_d_bits_sink : 2'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_184 = muxStateEarly_3_0 ? auto_out_0_d_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_185 = muxStateEarly_3_1 ? out_2_1_d_bits_size : 4'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_187 = muxStateEarly_3_0 ? auto_out_0_d_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [1:0] _T_188 = muxStateEarly_3_1 ? auto_out_1_d_bits_param : 2'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_190 = muxStateEarly_3_0 ? auto_out_0_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  wire [2:0] _T_191 = muxStateEarly_3_1 ? auto_out_1_d_bits_opcode : 3'h0; // @[Mux.scala 27:72]
  TLMonitor monitor ( // @[Nodes.scala 24:25]
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
  TLMonitor_1 monitor_1 ( // @[Nodes.scala 24:25]
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
    .io_in_b_ready(monitor_1_io_in_b_ready),
    .io_in_b_valid(monitor_1_io_in_b_valid),
    .io_in_b_bits_opcode(monitor_1_io_in_b_bits_opcode),
    .io_in_b_bits_param(monitor_1_io_in_b_bits_param),
    .io_in_b_bits_size(monitor_1_io_in_b_bits_size),
    .io_in_b_bits_source(monitor_1_io_in_b_bits_source),
    .io_in_b_bits_address(monitor_1_io_in_b_bits_address),
    .io_in_b_bits_mask(monitor_1_io_in_b_bits_mask),
    .io_in_b_bits_data(monitor_1_io_in_b_bits_data),
    .io_in_b_bits_corrupt(monitor_1_io_in_b_bits_corrupt),
    .io_in_c_ready(monitor_1_io_in_c_ready),
    .io_in_c_valid(monitor_1_io_in_c_valid),
    .io_in_c_bits_opcode(monitor_1_io_in_c_bits_opcode),
    .io_in_c_bits_param(monitor_1_io_in_c_bits_param),
    .io_in_c_bits_size(monitor_1_io_in_c_bits_size),
    .io_in_c_bits_source(monitor_1_io_in_c_bits_source),
    .io_in_c_bits_address(monitor_1_io_in_c_bits_address),
    .io_in_c_bits_data(monitor_1_io_in_c_bits_data),
    .io_in_c_bits_corrupt(monitor_1_io_in_c_bits_corrupt),
    .io_in_d_ready(monitor_1_io_in_d_ready),
    .io_in_d_valid(monitor_1_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_1_io_in_d_bits_opcode),
    .io_in_d_bits_param(monitor_1_io_in_d_bits_param),
    .io_in_d_bits_size(monitor_1_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_1_io_in_d_bits_source),
    .io_in_d_bits_sink(monitor_1_io_in_d_bits_sink),
    .io_in_d_bits_denied(monitor_1_io_in_d_bits_denied),
    .io_in_d_bits_data(monitor_1_io_in_d_bits_data),
    .io_in_d_bits_corrupt(monitor_1_io_in_d_bits_corrupt),
    .io_in_e_ready(monitor_1_io_in_e_ready),
    .io_in_e_valid(monitor_1_io_in_e_valid),
    .io_in_e_bits_sink(monitor_1_io_in_e_bits_sink)
  );
  assign auto_in_1_a_ready = requestAIO_1_0 & portsAOI_filtered_1_0_ready | requestAIO_1_1 & portsAOI_filtered_1_1_ready
    ; // @[Mux.scala 27:72]
  assign auto_in_1_b_valid = auto_out_1_b_valid & requestBOI_1_1; // @[Xbar.scala 179:40]
  assign auto_in_1_b_bits_opcode = auto_out_1_b_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_b_bits_param = auto_out_1_b_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_b_bits_size = {{1'd0}, auto_out_1_b_bits_size}; // @[Xbar.scala 288:19 BundleMap.scala 247:19]
  assign auto_in_1_b_bits_source = auto_out_1_b_bits_source[2:0]; // @[Xbar.scala 228:69]
  assign auto_in_1_b_bits_address = auto_out_1_b_bits_address; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_b_bits_mask = auto_out_1_b_bits_mask; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_b_bits_data = auto_out_1_b_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_b_bits_corrupt = auto_out_1_b_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_c_ready = auto_out_1_c_ready; // @[Mux.scala 27:72]
  assign auto_in_1_d_valid = idle_3 ? _T_155 : _sink_ACancel_earlyValid_T_8; // @[Arbiter.scala 125:29]
  assign auto_in_1_d_bits_opcode = _T_190 | _T_191; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_param = _T_187 | _T_188; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_size = _T_184 | _T_185; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_source = sink_ACancel_7_bits_source[2:0]; // @[Xbar.scala 228:69]
  assign auto_in_1_d_bits_sink = _T_178 | _T_179; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_denied = muxStateEarly_3_0 & auto_out_0_d_bits_denied | muxStateEarly_3_1 &
    auto_out_1_d_bits_denied; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_data = _T_172 | _T_173; // @[Mux.scala 27:72]
  assign auto_in_1_d_bits_corrupt = muxStateEarly_3_0 & auto_out_0_d_bits_corrupt | muxStateEarly_3_1 &
    auto_out_1_d_bits_corrupt; // @[Mux.scala 27:72]
  assign auto_in_1_e_ready = auto_out_1_e_ready; // @[Mux.scala 27:72]
  assign auto_in_0_a_ready = requestAIO_0_0 & portsAOI_filtered__0_ready | requestAIO_0_1 & portsAOI_filtered__1_ready; // @[Mux.scala 27:72]
  assign auto_in_0_d_valid = idle_2 ? _T_107 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  assign auto_in_0_d_bits_opcode = _T_142 | _T_143; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_param = _T_139 | _T_140; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_size = _T_136 | _T_137; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_source = 1'h0; // @[Bundle_ACancel.scala 53:19 Xbar.scala 269:32]
  assign auto_in_0_d_bits_sink = _T_130 | _T_131; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_denied = muxStateEarly_2_0 & auto_out_0_d_bits_denied | muxStateEarly_2_1 &
    auto_out_1_d_bits_denied; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_data = _T_124 | _T_125; // @[Mux.scala 27:72]
  assign auto_in_0_d_bits_corrupt = muxStateEarly_2_0 & auto_out_0_d_bits_corrupt | muxStateEarly_2_1 &
    auto_out_1_d_bits_corrupt; // @[Mux.scala 27:72]
  assign auto_out_1_a_valid = idle_1 ? _T_59 : _out_1_a_earlyValid_T_3; // @[Arbiter.scala 125:29]
  assign auto_out_1_a_bits_opcode = _T_94 | _T_95; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_param = _T_91 | _T_92; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_size = out_2_1_a_bits_size[2:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_1_a_bits_source = _T_85 | _T_86; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_address = _T_82 | _T_83; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_mask = _T_79 | _T_80; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_data = _T_76 | _T_77; // @[Mux.scala 27:72]
  assign auto_out_1_a_bits_corrupt = muxStateEarly_1_0 & auto_in_0_a_bits_corrupt | muxStateEarly_1_1 &
    auto_in_1_a_bits_corrupt; // @[Mux.scala 27:72]
  assign auto_out_1_b_ready = requestBOI_1_1 & auto_in_1_b_ready; // @[Mux.scala 27:72]
  assign auto_out_1_c_valid = auto_in_1_c_valid; // @[ReadyValidCancel.scala 21:38]
  assign auto_out_1_c_bits_opcode = auto_in_1_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_bits_param = auto_in_1_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_bits_size = auto_in_1_c_bits_size[2:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_1_c_bits_source = {{1'd0}, auto_in_1_c_bits_source}; // @[Xbar.scala 231:18 Xbar.scala 259:29]
  assign auto_out_1_c_bits_address = auto_in_1_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_bits_data = auto_in_1_c_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_bits_corrupt = auto_in_1_c_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_d_ready = requestDOI_1_0 & out_11_ready | requestDOI_1_1 & out_16_ready; // @[Mux.scala 27:72]
  assign auto_out_1_e_valid = auto_in_1_e_valid; // @[ReadyValidCancel.scala 21:38]
  assign auto_out_1_e_bits_sink = auto_in_1_e_bits_sink; // @[Xbar.scala 228:69]
  assign auto_out_0_a_valid = idle ? _T_11 : _out_0_a_earlyValid_T_3; // @[Arbiter.scala 125:29]
  assign auto_out_0_a_bits_opcode = _T_46 | _T_47; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_param = _T_43 | _T_44; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_size = _T_40 | _T_41; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_source = _T_37 | _T_38; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_address = out_2_0_a_bits_address[30:0]; // @[Xbar.scala 132:50 BundleMap.scala 247:19]
  assign auto_out_0_a_bits_mask = _T_31 | _T_32; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_data = _T_28 | _T_29; // @[Mux.scala 27:72]
  assign auto_out_0_a_bits_corrupt = muxStateEarly__0 & auto_in_0_a_bits_corrupt | muxStateEarly__1 &
    auto_in_1_a_bits_corrupt; // @[Mux.scala 27:72]
  assign auto_out_0_d_ready = requestDOI_0_0 & out_10_ready | requestDOI_0_1 & out_15_ready; // @[Mux.scala 27:72]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = requestAIO_0_0 & portsAOI_filtered__0_ready | requestAIO_0_1 &
    portsAOI_filtered__1_ready; // @[Mux.scala 27:72]
  assign monitor_io_in_a_valid = auto_in_0_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_0_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_0_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_0_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_0_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_0_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_0_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_data = auto_in_0_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_in_0_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_0_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = idle_2 ? _T_107 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  assign monitor_io_in_d_bits_opcode = _T_142 | _T_143; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_param = _T_139 | _T_140; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_size = _T_136 | _T_137; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_source = 1'h0; // @[Bundle_ACancel.scala 53:19 Xbar.scala 269:32]
  assign monitor_io_in_d_bits_sink = _T_130 | _T_131; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_denied = muxStateEarly_2_0 & auto_out_0_d_bits_denied | muxStateEarly_2_1 &
    auto_out_1_d_bits_denied; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_data = _T_124 | _T_125; // @[Mux.scala 27:72]
  assign monitor_io_in_d_bits_corrupt = muxStateEarly_2_0 & auto_out_0_d_bits_corrupt | muxStateEarly_2_1 &
    auto_out_1_d_bits_corrupt; // @[Mux.scala 27:72]
  assign monitor_1_clock = clock;
  assign monitor_1_reset = reset;
  assign monitor_1_io_in_a_ready = requestAIO_1_0 & portsAOI_filtered_1_0_ready | requestAIO_1_1 &
    portsAOI_filtered_1_1_ready; // @[Mux.scala 27:72]
  assign monitor_1_io_in_a_valid = auto_in_1_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_opcode = auto_in_1_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_param = auto_in_1_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_size = auto_in_1_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_source = auto_in_1_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_address = auto_in_1_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_mask = auto_in_1_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_data = auto_in_1_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_corrupt = auto_in_1_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_b_ready = auto_in_1_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_b_valid = auto_out_1_b_valid & requestBOI_1_1; // @[Xbar.scala 179:40]
  assign monitor_1_io_in_b_bits_opcode = auto_out_1_b_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_b_bits_param = auto_out_1_b_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_b_bits_size = {{1'd0}, auto_out_1_b_bits_size}; // @[Xbar.scala 288:19 BundleMap.scala 247:19]
  assign monitor_1_io_in_b_bits_source = auto_out_1_b_bits_source[2:0]; // @[Xbar.scala 228:69]
  assign monitor_1_io_in_b_bits_address = auto_out_1_b_bits_address; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_b_bits_mask = auto_out_1_b_bits_mask; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_b_bits_data = auto_out_1_b_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_b_bits_corrupt = auto_out_1_b_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_c_ready = auto_out_1_c_ready; // @[Mux.scala 27:72]
  assign monitor_1_io_in_c_valid = auto_in_1_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_opcode = auto_in_1_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_param = auto_in_1_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_size = auto_in_1_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_source = auto_in_1_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_address = auto_in_1_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_data = auto_in_1_c_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_corrupt = auto_in_1_c_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_d_ready = auto_in_1_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_d_valid = idle_3 ? _T_155 : _sink_ACancel_earlyValid_T_8; // @[Arbiter.scala 125:29]
  assign monitor_1_io_in_d_bits_opcode = _T_190 | _T_191; // @[Mux.scala 27:72]
  assign monitor_1_io_in_d_bits_param = _T_187 | _T_188; // @[Mux.scala 27:72]
  assign monitor_1_io_in_d_bits_size = _T_184 | _T_185; // @[Mux.scala 27:72]
  assign monitor_1_io_in_d_bits_source = sink_ACancel_7_bits_source[2:0]; // @[Xbar.scala 228:69]
  assign monitor_1_io_in_d_bits_sink = _T_178 | _T_179; // @[Mux.scala 27:72]
  assign monitor_1_io_in_d_bits_denied = muxStateEarly_3_0 & auto_out_0_d_bits_denied | muxStateEarly_3_1 &
    auto_out_1_d_bits_denied; // @[Mux.scala 27:72]
  assign monitor_1_io_in_d_bits_data = _T_172 | _T_173; // @[Mux.scala 27:72]
  assign monitor_1_io_in_d_bits_corrupt = muxStateEarly_3_0 & auto_out_0_d_bits_corrupt | muxStateEarly_3_1 &
    auto_out_1_d_bits_corrupt; // @[Mux.scala 27:72]
  assign monitor_1_io_in_e_ready = auto_out_1_e_ready; // @[Mux.scala 27:72]
  assign monitor_1_io_in_e_valid = auto_in_1_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_e_bits_sink = auto_in_1_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft_3 <= 9'h0; // @[Arbiter.scala 87:30]
    end else if (latch_3) begin // @[Arbiter.scala 113:23]
      beatsLeft_3 <= initBeats_3;
    end else begin
      beatsLeft_3 <= _beatsLeft_T_22;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      readys_mask_3 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (latch_3 & |readys_filter_lo_3) begin // @[Arbiter.scala 27:32]
      readys_mask_3 <= _readys_mask_T_18; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_3_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_3) begin // @[Arbiter.scala 117:30]
      state_3_0 <= earlyWinner_3_0;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_3_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_3) begin // @[Arbiter.scala 117:30]
      state_3_1 <= earlyWinner_3_1;
    end
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
      state__0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state__0 <= earlyWinner__0;
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft_1 <= 9'h0; // @[Arbiter.scala 87:30]
    end else if (latch_1) begin // @[Arbiter.scala 113:23]
      beatsLeft_1 <= initBeats_1;
    end else begin
      beatsLeft_1 <= _beatsLeft_T_10;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      readys_mask_1 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (latch_1 & |readys_filter_lo_1) begin // @[Arbiter.scala 27:32]
      readys_mask_1 <= _readys_mask_T_8; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_1) begin // @[Arbiter.scala 117:30]
      state_1_0 <= earlyWinner_1_0;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state__1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state__1 <= earlyWinner__1;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_1) begin // @[Arbiter.scala 117:30]
      state_1_1 <= earlyWinner_1_1;
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft_2 <= 9'h0; // @[Arbiter.scala 87:30]
    end else if (latch_2) begin // @[Arbiter.scala 113:23]
      beatsLeft_2 <= initBeats_2;
    end else begin
      beatsLeft_2 <= _beatsLeft_T_16;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      readys_mask_2 <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (latch_2 & |readys_filter_lo_2) begin // @[Arbiter.scala 27:32]
      readys_mask_2 <= _readys_mask_T_13; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_2_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_2) begin // @[Arbiter.scala 117:30]
      state_2_0 <= earlyWinner_2_0;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_2_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_2) begin // @[Arbiter.scala 117:30]
      state_2_1 <= earlyWinner_2_1;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~earlyWinner__0 | ~earlyWinner__1 | reset)) begin
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
        if (~(~earlyWinner__0 | ~earlyWinner__1 | reset)) begin
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
        if (~(~(portsAOI_filtered__0_earlyValid | portsAOI_filtered_1_0_earlyValid) | _prefixOR_T | reset)) begin
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
        if (~(~(portsAOI_filtered__0_earlyValid | portsAOI_filtered_1_0_earlyValid) | _prefixOR_T | reset)) begin
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
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~earlyWinner_1_0 | ~earlyWinner_1_1 | reset)) begin
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
        if (~(~earlyWinner_1_0 | ~earlyWinner_1_1 | reset)) begin
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
        if (~(~(portsAOI_filtered__1_earlyValid | portsAOI_filtered_1_1_earlyValid) | _prefixOR_T_1 | reset)) begin
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
        if (~(~(portsAOI_filtered__1_earlyValid | portsAOI_filtered_1_1_earlyValid) | _prefixOR_T_1 | reset)) begin
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
        if (~(_T_60 | _T_59 | reset)) begin
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
        if (~(_T_60 | _T_59 | reset)) begin
          $fatal; // @[Arbiter.scala 108:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~earlyWinner_2_0 | ~earlyWinner_2_1 | reset)) begin
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
        if (~(~earlyWinner_2_0 | ~earlyWinner_2_1 | reset)) begin
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
        if (~(~(portsDIO_filtered__0_valid | portsDIO_filtered_1_0_valid) | _prefixOR_T_2 | reset)) begin
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
        if (~(~(portsDIO_filtered__0_valid | portsDIO_filtered_1_0_valid) | _prefixOR_T_2 | reset)) begin
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
        if (~(_T_108 | _T_107 | reset)) begin
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
        if (~(_T_108 | _T_107 | reset)) begin
          $fatal; // @[Arbiter.scala 108:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~earlyWinner_3_0 | ~earlyWinner_3_1 | reset)) begin
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
        if (~(~earlyWinner_3_0 | ~earlyWinner_3_1 | reset)) begin
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
        if (~(~(portsDIO_filtered__1_valid | portsDIO_filtered_1_1_valid) | _prefixOR_T_3 | reset)) begin
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
        if (~(~(portsDIO_filtered__1_valid | portsDIO_filtered_1_1_valid) | _prefixOR_T_3 | reset)) begin
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
        if (~(_T_156 | _T_155 | reset)) begin
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
        if (~(_T_156 | _T_155 | reset)) begin
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
  beatsLeft_3 = _RAND_0[8:0];
  _RAND_1 = {1{`RANDOM}};
  readys_mask_3 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  state_3_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_3_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  beatsLeft = _RAND_4[8:0];
  _RAND_5 = {1{`RANDOM}};
  readys_mask = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  state__0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  beatsLeft_1 = _RAND_7[8:0];
  _RAND_8 = {1{`RANDOM}};
  readys_mask_1 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  state_1_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  state__1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  state_1_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  beatsLeft_2 = _RAND_12[8:0];
  _RAND_13 = {1{`RANDOM}};
  readys_mask_2 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  state_2_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  state_2_1 = _RAND_15[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
