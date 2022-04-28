module TLUART(
  input         clock,
  input         reset,
  output        auto_int_xing_out_sync_0,
  output        auto_control_xing_in_a_ready,
  input         auto_control_xing_in_a_valid,
  input  [2:0]  auto_control_xing_in_a_bits_opcode,
  input  [2:0]  auto_control_xing_in_a_bits_param,
  input  [1:0]  auto_control_xing_in_a_bits_size,
  input  [8:0]  auto_control_xing_in_a_bits_source,
  input  [30:0] auto_control_xing_in_a_bits_address,
  input  [7:0]  auto_control_xing_in_a_bits_mask,
  input  [63:0] auto_control_xing_in_a_bits_data,
  input         auto_control_xing_in_a_bits_corrupt,
  input         auto_control_xing_in_d_ready,
  output        auto_control_xing_in_d_valid,
  output [2:0]  auto_control_xing_in_d_bits_opcode,
  output [1:0]  auto_control_xing_in_d_bits_param,
  output [1:0]  auto_control_xing_in_d_bits_size,
  output [8:0]  auto_control_xing_in_d_bits_source,
  output        auto_control_xing_in_d_bits_sink,
  output        auto_control_xing_in_d_bits_denied,
  output [63:0] auto_control_xing_in_d_bits_data,
  output        auto_control_xing_in_d_bits_corrupt,
  output        auto_io_out_txd,
  input         auto_io_out_rxd
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
`endif // RANDOMIZE_REG_INIT
  wire  buffer_clock; // @[Buffer.scala 68:28]
  wire  buffer_reset; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [8:0] buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [30:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [8:0] buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [8:0] buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [30:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [8:0] buffer_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  intsource_clock; // @[Crossing.scala 26:31]
  wire  intsource_reset; // @[Crossing.scala 26:31]
  wire  intsource_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [30:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [63:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  txm_clock; // @[UART.scala 79:19]
  wire  txm_reset; // @[UART.scala 79:19]
  wire  txm_io_en; // @[UART.scala 79:19]
  wire  txm_io_in_ready; // @[UART.scala 79:19]
  wire  txm_io_in_valid; // @[UART.scala 79:19]
  wire [7:0] txm_io_in_bits; // @[UART.scala 79:19]
  wire  txm_io_out; // @[UART.scala 79:19]
  wire [15:0] txm_io_div; // @[UART.scala 79:19]
  wire  txm_io_nstop; // @[UART.scala 79:19]
  wire  txm_io_tx_busy; // @[UART.scala 79:19]
  wire  txq_clock; // @[UART.scala 80:19]
  wire  txq_reset; // @[UART.scala 80:19]
  wire  txq_io_enq_ready; // @[UART.scala 80:19]
  wire  txq_io_enq_valid; // @[UART.scala 80:19]
  wire [7:0] txq_io_enq_bits; // @[UART.scala 80:19]
  wire  txq_io_deq_ready; // @[UART.scala 80:19]
  wire  txq_io_deq_valid; // @[UART.scala 80:19]
  wire [7:0] txq_io_deq_bits; // @[UART.scala 80:19]
  wire [8:0] txq_io_count; // @[UART.scala 80:19]
  wire  rxm_clock; // @[UART.scala 82:19]
  wire  rxm_reset; // @[UART.scala 82:19]
  wire  rxm_io_en; // @[UART.scala 82:19]
  wire  rxm_io_in; // @[UART.scala 82:19]
  wire  rxm_io_out_valid; // @[UART.scala 82:19]
  wire [7:0] rxm_io_out_bits; // @[UART.scala 82:19]
  wire [15:0] rxm_io_div; // @[UART.scala 82:19]
  wire  rxq_clock; // @[UART.scala 83:19]
  wire  rxq_reset; // @[UART.scala 83:19]
  wire  rxq_io_enq_ready; // @[UART.scala 83:19]
  wire  rxq_io_enq_valid; // @[UART.scala 83:19]
  wire [7:0] rxq_io_enq_bits; // @[UART.scala 83:19]
  wire  rxq_io_deq_ready; // @[UART.scala 83:19]
  wire  rxq_io_deq_valid; // @[UART.scala 83:19]
  wire [7:0] rxq_io_deq_bits; // @[UART.scala 83:19]
  wire [8:0] rxq_io_count; // @[UART.scala 83:19]
  reg [15:0] div; // @[UART.scala 85:16]
  reg  txen; // @[UART.scala 91:17]
  reg  rxen; // @[UART.scala 92:17]
  reg [8:0] txwm; // @[UART.scala 99:17]
  reg [8:0] rxwm; // @[UART.scala 100:17]
  reg  nstop; // @[UART.scala 101:18]
  reg  ie_rxwm; // @[UART.scala 135:15]
  reg  ie_txwm; // @[UART.scala 135:15]
  wire  ip_txwm = txq_io_count < txwm; // @[UART.scala 138:28]
  wire  ip_rxwm = rxq_io_count > rxwm; // @[UART.scala 139:28]
  wire  out_prepend_hi = ~txq_io_enq_ready; // @[RegMapFIFO.scala 25:9]
  wire  out_prepend_hi_1 = ~rxq_io_deq_valid; // @[RegMapFIFO.scala 46:21]
  wire [2:0] bundleIn_0_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire  in_bits_read = bundleIn_0_a_bits_opcode == 3'h4; // @[RegisterRouter.scala 68:36]
  wire [30:0] bundleIn_0_a_bits_address = buffer_auto_out_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire [8:0] in_bits_index = bundleIn_0_a_bits_address[11:3]; // @[RegisterRouter.scala 67:18 RegisterRouter.scala 69:19]
  wire [8:0] out_findex = in_bits_index & 9'h1fc; // @[RegisterRouter.scala 79:24]
  wire  _out_T = out_findex == 9'h0; // @[RegisterRouter.scala 79:24]
  wire [7:0] bundleIn_0_a_bits_mask = buffer_auto_out_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire [7:0] out_frontMask_lo_lo_lo = bundleIn_0_a_bits_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_lo_lo_hi = bundleIn_0_a_bits_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_lo_hi_lo = bundleIn_0_a_bits_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_lo_hi_hi = bundleIn_0_a_bits_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_hi_lo_lo = bundleIn_0_a_bits_mask[4] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_hi_lo_hi = bundleIn_0_a_bits_mask[5] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_hi_hi_lo = bundleIn_0_a_bits_mask[6] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_frontMask_hi_hi_hi = bundleIn_0_a_bits_mask[7] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [63:0] out_frontMask = {out_frontMask_hi_hi_hi,out_frontMask_hi_hi_lo,out_frontMask_hi_lo_hi,
    out_frontMask_hi_lo_lo,out_frontMask_lo_hi_hi,out_frontMask_lo_hi_lo,out_frontMask_lo_lo_hi,out_frontMask_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  out_wimask = &out_frontMask[0]; // @[RegisterRouter.scala 79:24]
  wire  bundleIn_0_a_valid = buffer_auto_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire  bundleIn_0_d_ready = buffer_auto_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire  out_oindex_hi = in_bits_index[1]; // @[RegisterRouter.scala 79:24]
  wire  out_oindex_lo = in_bits_index[0]; // @[RegisterRouter.scala 79:24]
  wire [1:0] out_oindex = {out_oindex_hi,out_oindex_lo}; // @[Cat.scala 30:58]
  wire [3:0] _out_frontSel_T = 4'h1 << out_oindex; // @[OneHot.scala 58:35]
  wire  out_frontSel_2 = _out_frontSel_T[2]; // @[RegisterRouter.scala 79:24]
  wire  out_wivalid_0 = bundleIn_0_a_valid & bundleIn_0_d_ready & ~in_bits_read & out_frontSel_2 & out_findex == 9'h0; // @[RegisterRouter.scala 79:24]
  wire  out_f_wivalid = out_wivalid_0 & out_wimask; // @[RegisterRouter.scala 79:24]
  wire [63:0] bundleIn_0_a_bits_data = buffer_auto_out_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  wire  out_wimask_1 = &out_frontMask[1]; // @[RegisterRouter.scala 79:24]
  wire  out_f_wivalid_1 = out_wivalid_0 & out_wimask_1; // @[RegisterRouter.scala 79:24]
  wire [1:0] out_prepend = {ie_rxwm,ie_txwm}; // @[Cat.scala 30:58]
  wire  out_wimask_2 = &out_frontMask[32]; // @[RegisterRouter.scala 79:24]
  wire [31:0] out_prepend_lo_1 = {{30'd0}, out_prepend}; // @[RegisterRouter.scala 79:24]
  wire [33:0] out_prepend_2 = {ip_rxwm,ip_txwm,out_prepend_lo_1}; // @[Cat.scala 30:58]
  wire  out_frontSel_1 = _out_frontSel_T[1]; // @[RegisterRouter.scala 79:24]
  wire  out_wivalid_4 = bundleIn_0_a_valid & bundleIn_0_d_ready & ~in_bits_read & out_frontSel_1 & out_findex == 9'h0; // @[RegisterRouter.scala 79:24]
  wire  out_f_wivalid_4 = out_wivalid_4 & out_wimask; // @[RegisterRouter.scala 79:24]
  wire  out_f_wivalid_5 = out_wivalid_4 & out_wimask_1; // @[RegisterRouter.scala 79:24]
  wire [1:0] out_prepend_3 = {nstop,txen}; // @[Cat.scala 30:58]
  wire  out_wimask_6 = &out_frontMask[24:16]; // @[RegisterRouter.scala 79:24]
  wire  out_f_wivalid_6 = out_wivalid_4 & out_wimask_6; // @[RegisterRouter.scala 79:24]
  wire [15:0] out_prepend_lo_4 = {{14'd0}, out_prepend_3}; // @[RegisterRouter.scala 79:24]
  wire [24:0] out_prepend_4 = {txwm,out_prepend_lo_4}; // @[Cat.scala 30:58]
  wire  out_f_wivalid_7 = out_wivalid_4 & out_wimask_2; // @[RegisterRouter.scala 79:24]
  wire [31:0] out_prepend_lo_5 = {{7'd0}, out_prepend_4}; // @[RegisterRouter.scala 79:24]
  wire [32:0] out_prepend_5 = {rxen,out_prepend_lo_5}; // @[Cat.scala 30:58]
  wire  out_wimask_8 = &out_frontMask[56:48]; // @[RegisterRouter.scala 79:24]
  wire  out_f_wivalid_8 = out_wivalid_4 & out_wimask_8; // @[RegisterRouter.scala 79:24]
  wire [47:0] out_prepend_lo_6 = {{15'd0}, out_prepend_5}; // @[RegisterRouter.scala 79:24]
  wire [56:0] out_prepend_6 = {rxwm,out_prepend_lo_6}; // @[Cat.scala 30:58]
  wire  out_wimask_9 = &out_frontMask[15:0]; // @[RegisterRouter.scala 79:24]
  wire  out_frontSel_3 = _out_frontSel_T[3]; // @[RegisterRouter.scala 79:24]
  wire  out_wivalid_9 = bundleIn_0_a_valid & bundleIn_0_d_ready & ~in_bits_read & out_frontSel_3 & out_findex == 9'h0; // @[RegisterRouter.scala 79:24]
  wire  out_f_wivalid_9 = out_wivalid_9 & out_wimask_9; // @[RegisterRouter.scala 79:24]
  wire  out_wimask_10 = &out_frontMask[7:0]; // @[RegisterRouter.scala 79:24]
  wire  out_frontSel_0 = _out_frontSel_T[0]; // @[RegisterRouter.scala 79:24]
  wire  out_rivalid_10 = bundleIn_0_a_valid & bundleIn_0_d_ready & in_bits_read & out_frontSel_0 & out_findex == 9'h0; // @[RegisterRouter.scala 79:24]
  wire  out_wivalid_10 = bundleIn_0_a_valid & bundleIn_0_d_ready & ~in_bits_read & out_frontSel_0 & out_findex == 9'h0; // @[RegisterRouter.scala 79:24]
  wire  out_f_wivalid_10 = out_wivalid_10 & out_wimask_10; // @[RegisterRouter.scala 79:24]
  wire  out_womask_12 = &out_frontMask[31]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_12 = out_wivalid_10 & out_womask_12; // @[RegisterRouter.scala 79:24]
  wire  _out_T_136 = out_f_woready_12 & bundleIn_0_a_bits_data[31]; // @[RegMapFIFO.scala 27:26]
  wire  out_rimask_13 = |out_frontMask[39:32]; // @[RegisterRouter.scala 79:24]
  wire [40:0] out_prepend_10 = {1'h0,rxq_io_deq_bits,out_prepend_hi,31'h0}; // @[Cat.scala 30:58]
  wire [62:0] out_prepend_lo_11 = {{22'd0}, out_prepend_10}; // @[RegisterRouter.scala 79:24]
  wire [63:0] out_prepend_11 = {out_prepend_hi_1,out_prepend_lo_11}; // @[Cat.scala 30:58]
  wire  _GEN_25 = 2'h1 == out_oindex ? _out_T : _out_T; // @[MuxLiteral.scala 48:10 MuxLiteral.scala 48:10]
  wire  _GEN_26 = 2'h2 == out_oindex ? _out_T : _GEN_25; // @[MuxLiteral.scala 48:10 MuxLiteral.scala 48:10]
  wire  _GEN_27 = 2'h3 == out_oindex ? _out_T : _GEN_26; // @[MuxLiteral.scala 48:10 MuxLiteral.scala 48:10]
  wire [63:0] _out_out_bits_data_WIRE_1_1 = {{7'd0}, out_prepend_6}; // @[MuxLiteral.scala 48:48 MuxLiteral.scala 48:48]
  wire [63:0] _GEN_29 = 2'h1 == out_oindex ? _out_out_bits_data_WIRE_1_1 : out_prepend_11; // @[MuxLiteral.scala 48:10 MuxLiteral.scala 48:10]
  wire [63:0] _out_out_bits_data_WIRE_1_2 = {{30'd0}, out_prepend_2}; // @[MuxLiteral.scala 48:48 MuxLiteral.scala 48:48]
  wire [63:0] _GEN_30 = 2'h2 == out_oindex ? _out_out_bits_data_WIRE_1_2 : _GEN_29; // @[MuxLiteral.scala 48:10 MuxLiteral.scala 48:10]
  wire [63:0] _out_out_bits_data_WIRE_1_3 = {{48'd0}, div}; // @[MuxLiteral.scala 48:48 MuxLiteral.scala 48:48]
  wire [63:0] _GEN_31 = 2'h3 == out_oindex ? _out_out_bits_data_WIRE_1_3 : _GEN_30; // @[MuxLiteral.scala 48:10 MuxLiteral.scala 48:10]
  TLBuffer_17 buffer ( // @[Buffer.scala 68:28]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt)
  );
  IntSyncCrossingSource_1 intsource ( // @[Crossing.scala 26:31]
    .clock(intsource_clock),
    .reset(intsource_reset),
    .auto_in_0(intsource_auto_in_0),
    .auto_out_sync_0(intsource_auto_out_sync_0)
  );
  TLMonitor_51 monitor ( // @[Nodes.scala 24:25]
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
  UARTTx txm ( // @[UART.scala 79:19]
    .clock(txm_clock),
    .reset(txm_reset),
    .io_en(txm_io_en),
    .io_in_ready(txm_io_in_ready),
    .io_in_valid(txm_io_in_valid),
    .io_in_bits(txm_io_in_bits),
    .io_out(txm_io_out),
    .io_div(txm_io_div),
    .io_nstop(txm_io_nstop),
    .io_tx_busy(txm_io_tx_busy)
  );
  QueueCompatibility_32 txq ( // @[UART.scala 80:19]
    .clock(txq_clock),
    .reset(txq_reset),
    .io_enq_ready(txq_io_enq_ready),
    .io_enq_valid(txq_io_enq_valid),
    .io_enq_bits(txq_io_enq_bits),
    .io_deq_ready(txq_io_deq_ready),
    .io_deq_valid(txq_io_deq_valid),
    .io_deq_bits(txq_io_deq_bits),
    .io_count(txq_io_count)
  );
  UARTRx rxm ( // @[UART.scala 82:19]
    .clock(rxm_clock),
    .reset(rxm_reset),
    .io_en(rxm_io_en),
    .io_in(rxm_io_in),
    .io_out_valid(rxm_io_out_valid),
    .io_out_bits(rxm_io_out_bits),
    .io_div(rxm_io_div)
  );
  QueueCompatibility_32 rxq ( // @[UART.scala 83:19]
    .clock(rxq_clock),
    .reset(rxq_reset),
    .io_enq_ready(rxq_io_enq_ready),
    .io_enq_valid(rxq_io_enq_valid),
    .io_enq_bits(rxq_io_enq_bits),
    .io_deq_ready(rxq_io_deq_ready),
    .io_deq_valid(rxq_io_deq_valid),
    .io_deq_bits(rxq_io_deq_bits),
    .io_count(rxq_io_count)
  );
  assign auto_int_xing_out_sync_0 = intsource_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_control_xing_in_a_ready = buffer_auto_in_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_control_xing_in_d_valid = buffer_auto_in_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_control_xing_in_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_control_xing_in_d_bits_param = buffer_auto_in_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_control_xing_in_d_bits_size = buffer_auto_in_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_control_xing_in_d_bits_source = buffer_auto_in_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_control_xing_in_d_bits_sink = buffer_auto_in_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_control_xing_in_d_bits_denied = buffer_auto_in_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_control_xing_in_d_bits_data = buffer_auto_in_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_control_xing_in_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_io_out_txd = txm_io_out; // @[Nodes.scala 1207:84 UART.scala 113:12]
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_auto_in_a_valid = auto_control_xing_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_opcode = auto_control_xing_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_param = auto_control_xing_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_size = auto_control_xing_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_source = auto_control_xing_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_address = auto_control_xing_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_mask = auto_control_xing_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_data = auto_control_xing_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_bits_corrupt = auto_control_xing_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_d_ready = auto_control_xing_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_a_ready = buffer_auto_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_auto_out_d_valid = buffer_auto_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 94:19]
  assign buffer_auto_out_d_bits_param = 2'h0; // @[Edges.scala 755:17 Edges.scala 757:15]
  assign buffer_auto_out_d_bits_size = buffer_auto_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_source = buffer_auto_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_sink = 1'h0; // @[Edges.scala 755:17 Edges.scala 760:15]
  assign buffer_auto_out_d_bits_denied = 1'h0; // @[Edges.scala 755:17 Edges.scala 761:15]
  assign buffer_auto_out_d_bits_data = _GEN_27 ? _GEN_31 : 64'h0; // @[RegisterRouter.scala 79:24]
  assign buffer_auto_out_d_bits_corrupt = 1'h0; // @[Edges.scala 755:17 Edges.scala 763:15]
  assign intsource_clock = clock;
  assign intsource_reset = reset;
  assign intsource_auto_in_0 = ip_txwm & ie_txwm | ip_rxwm & ie_rxwm; // @[UART.scala 140:41]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = buffer_auto_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_valid = buffer_auto_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_param = buffer_auto_out_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_size = buffer_auto_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_source = buffer_auto_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_address = buffer_auto_out_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_mask = buffer_auto_out_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_data = buffer_auto_out_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_d_ready = buffer_auto_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_d_valid = buffer_auto_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 94:19]
  assign monitor_io_in_d_bits_param = 2'h0; // @[Edges.scala 755:17 Edges.scala 757:15]
  assign monitor_io_in_d_bits_size = buffer_auto_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_d_bits_source = buffer_auto_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign monitor_io_in_d_bits_sink = 1'h0; // @[Edges.scala 755:17 Edges.scala 760:15]
  assign monitor_io_in_d_bits_denied = 1'h0; // @[Edges.scala 755:17 Edges.scala 761:15]
  assign monitor_io_in_d_bits_data = _GEN_27 ? _GEN_31 : 64'h0; // @[RegisterRouter.scala 79:24]
  assign monitor_io_in_d_bits_corrupt = 1'h0; // @[Edges.scala 755:17 Edges.scala 763:15]
  assign txm_clock = clock;
  assign txm_reset = reset;
  assign txm_io_en = txen; // @[UART.scala 109:15]
  assign txm_io_in_valid = txq_io_deq_valid; // @[UART.scala 110:13]
  assign txm_io_in_bits = txq_io_deq_bits; // @[UART.scala 110:13]
  assign txm_io_div = div; // @[UART.scala 111:14]
  assign txm_io_nstop = nstop; // @[UART.scala 112:16]
  assign txq_clock = clock;
  assign txq_reset = reset;
  assign txq_io_enq_valid = out_f_wivalid_10 & ~_out_T_136; // @[RegMapFIFO.scala 19:30]
  assign txq_io_enq_bits = bundleIn_0_a_bits_data[7:0]; // @[RegisterRouter.scala 79:24]
  assign txq_io_deq_ready = txm_io_in_ready; // @[UART.scala 110:13]
  assign rxm_clock = clock;
  assign rxm_reset = reset;
  assign rxm_io_en = rxen; // @[UART.scala 120:13]
  assign rxm_io_in = auto_io_out_rxd; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign rxm_io_div = div; // @[UART.scala 123:14]
  assign rxq_clock = clock;
  assign rxq_reset = reset;
  assign rxq_io_enq_valid = rxm_io_out_valid; // @[UART.scala 122:14]
  assign rxq_io_enq_bits = rxm_io_out_bits; // @[UART.scala 122:14]
  assign rxq_io_deq_ready = out_rivalid_10 & out_rimask_13; // @[RegisterRouter.scala 79:24]
  always @(posedge clock) begin
    if (reset) begin // @[UART.scala 85:16]
      div <= 16'h364; // @[UART.scala 85:16]
    end else if (out_f_wivalid_9) begin // @[RegField.scala 74:88]
      div <= bundleIn_0_a_bits_data[15:0]; // @[RegField.scala 74:92]
    end
    if (reset) begin // @[UART.scala 91:17]
      txen <= 1'h0; // @[UART.scala 91:17]
    end else if (out_f_wivalid_4) begin // @[RegField.scala 74:88]
      txen <= bundleIn_0_a_bits_data[0]; // @[RegField.scala 74:92]
    end
    if (reset) begin // @[UART.scala 92:17]
      rxen <= 1'h0; // @[UART.scala 92:17]
    end else if (out_f_wivalid_7) begin // @[RegField.scala 74:88]
      rxen <= bundleIn_0_a_bits_data[32]; // @[RegField.scala 74:92]
    end
    if (reset) begin // @[UART.scala 99:17]
      txwm <= 9'h0; // @[UART.scala 99:17]
    end else if (out_f_wivalid_6) begin // @[RegField.scala 74:88]
      txwm <= bundleIn_0_a_bits_data[24:16]; // @[RegField.scala 74:92]
    end
    if (reset) begin // @[UART.scala 100:17]
      rxwm <= 9'h0; // @[UART.scala 100:17]
    end else if (out_f_wivalid_8) begin // @[RegField.scala 74:88]
      rxwm <= bundleIn_0_a_bits_data[56:48]; // @[RegField.scala 74:92]
    end
    if (reset) begin // @[UART.scala 101:18]
      nstop <= 1'h0; // @[UART.scala 101:18]
    end else if (out_f_wivalid_5) begin // @[RegField.scala 74:88]
      nstop <= bundleIn_0_a_bits_data[1]; // @[RegField.scala 74:92]
    end
    if (reset) begin // @[UART.scala 135:15]
      ie_rxwm <= 1'h0; // @[UART.scala 135:15]
    end else if (out_f_wivalid_1) begin // @[RegField.scala 74:88]
      ie_rxwm <= bundleIn_0_a_bits_data[1]; // @[RegField.scala 74:92]
    end
    if (reset) begin // @[UART.scala 135:15]
      ie_txwm <= 1'h0; // @[UART.scala 135:15]
    end else if (out_f_wivalid) begin // @[RegField.scala 74:88]
      ie_txwm <= bundleIn_0_a_bits_data[0]; // @[RegField.scala 74:92]
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
  div = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  txen = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  rxen = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  txwm = _RAND_3[8:0];
  _RAND_4 = {1{`RANDOM}};
  rxwm = _RAND_4[8:0];
  _RAND_5 = {1{`RANDOM}};
  nstop = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ie_rxwm = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  ie_txwm = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
