module TLSerdesser(
  input         clock,
  input         reset,
  output        auto_manager_in_a_ready,
  input         auto_manager_in_a_valid,
  input  [2:0]  auto_manager_in_a_bits_opcode,
  input  [2:0]  auto_manager_in_a_bits_param,
  input  [2:0]  auto_manager_in_a_bits_size,
  input  [3:0]  auto_manager_in_a_bits_source,
  input  [28:0] auto_manager_in_a_bits_address,
  input  [7:0]  auto_manager_in_a_bits_mask,
  input  [63:0] auto_manager_in_a_bits_data,
  input         auto_manager_in_a_bits_corrupt,
  input         auto_manager_in_d_ready,
  output        auto_manager_in_d_valid,
  output [2:0]  auto_manager_in_d_bits_opcode,
  output [1:0]  auto_manager_in_d_bits_param,
  output [2:0]  auto_manager_in_d_bits_size,
  output [3:0]  auto_manager_in_d_bits_source,
  output        auto_manager_in_d_bits_sink,
  output        auto_manager_in_d_bits_denied,
  output [63:0] auto_manager_in_d_bits_data,
  output        auto_manager_in_d_bits_corrupt,
  input         auto_client_out_a_ready,
  output        auto_client_out_a_valid,
  output [2:0]  auto_client_out_a_bits_opcode,
  output [2:0]  auto_client_out_a_bits_param,
  output [3:0]  auto_client_out_a_bits_size,
  output        auto_client_out_a_bits_source,
  output [31:0] auto_client_out_a_bits_address,
  output [7:0]  auto_client_out_a_bits_mask,
  output [63:0] auto_client_out_a_bits_data,
  output        auto_client_out_a_bits_corrupt,
  output        auto_client_out_d_ready,
  input         auto_client_out_d_valid,
  input  [2:0]  auto_client_out_d_bits_opcode,
  input  [1:0]  auto_client_out_d_bits_param,
  input  [3:0]  auto_client_out_d_bits_size,
  input         auto_client_out_d_bits_source,
  input  [1:0]  auto_client_out_d_bits_sink,
  input         auto_client_out_d_bits_denied,
  input  [63:0] auto_client_out_d_bits_data,
  input         auto_client_out_d_bits_corrupt,
  output        io_ser_in_ready,
  input         io_ser_in_valid,
  input  [3:0]  io_ser_in_bits,
  input         io_ser_out_ready,
  output        io_ser_out_valid,
  output [3:0]  io_ser_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
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
  wire  outArb_clock; // @[Serdes.scala 622:24]
  wire  outArb_reset; // @[Serdes.scala 622:24]
  wire  outArb_io_in_0_ready; // @[Serdes.scala 622:24]
  wire  outArb_io_in_0_valid; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_0_bits_chanId; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_0_bits_opcode; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_0_bits_param; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_in_0_bits_size; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_in_0_bits_source; // @[Serdes.scala 622:24]
  wire [31:0] outArb_io_in_0_bits_address; // @[Serdes.scala 622:24]
  wire [63:0] outArb_io_in_0_bits_data; // @[Serdes.scala 622:24]
  wire  outArb_io_in_0_bits_corrupt; // @[Serdes.scala 622:24]
  wire [7:0] outArb_io_in_0_bits_union; // @[Serdes.scala 622:24]
  wire  outArb_io_in_0_bits_last; // @[Serdes.scala 622:24]
  wire  outArb_io_in_1_ready; // @[Serdes.scala 622:24]
  wire  outArb_io_in_1_valid; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_1_bits_chanId; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_1_bits_opcode; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_1_bits_param; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_in_1_bits_size; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_in_1_bits_source; // @[Serdes.scala 622:24]
  wire [31:0] outArb_io_in_1_bits_address; // @[Serdes.scala 622:24]
  wire [63:0] outArb_io_in_1_bits_data; // @[Serdes.scala 622:24]
  wire  outArb_io_in_1_bits_corrupt; // @[Serdes.scala 622:24]
  wire [7:0] outArb_io_in_1_bits_union; // @[Serdes.scala 622:24]
  wire  outArb_io_in_1_bits_last; // @[Serdes.scala 622:24]
  wire  outArb_io_in_2_ready; // @[Serdes.scala 622:24]
  wire  outArb_io_in_2_valid; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_2_bits_chanId; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_2_bits_opcode; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_2_bits_param; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_in_2_bits_size; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_in_2_bits_source; // @[Serdes.scala 622:24]
  wire [31:0] outArb_io_in_2_bits_address; // @[Serdes.scala 622:24]
  wire [63:0] outArb_io_in_2_bits_data; // @[Serdes.scala 622:24]
  wire  outArb_io_in_2_bits_corrupt; // @[Serdes.scala 622:24]
  wire [7:0] outArb_io_in_2_bits_union; // @[Serdes.scala 622:24]
  wire  outArb_io_in_2_bits_last; // @[Serdes.scala 622:24]
  wire  outArb_io_in_3_ready; // @[Serdes.scala 622:24]
  wire  outArb_io_in_3_valid; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_3_bits_chanId; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_3_bits_opcode; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_3_bits_param; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_in_3_bits_size; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_in_3_bits_source; // @[Serdes.scala 622:24]
  wire [31:0] outArb_io_in_3_bits_address; // @[Serdes.scala 622:24]
  wire [63:0] outArb_io_in_3_bits_data; // @[Serdes.scala 622:24]
  wire  outArb_io_in_3_bits_corrupt; // @[Serdes.scala 622:24]
  wire [7:0] outArb_io_in_3_bits_union; // @[Serdes.scala 622:24]
  wire  outArb_io_in_3_bits_last; // @[Serdes.scala 622:24]
  wire  outArb_io_in_4_ready; // @[Serdes.scala 622:24]
  wire  outArb_io_in_4_valid; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_4_bits_chanId; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_4_bits_opcode; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_in_4_bits_param; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_in_4_bits_size; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_in_4_bits_source; // @[Serdes.scala 622:24]
  wire [31:0] outArb_io_in_4_bits_address; // @[Serdes.scala 622:24]
  wire [63:0] outArb_io_in_4_bits_data; // @[Serdes.scala 622:24]
  wire  outArb_io_in_4_bits_corrupt; // @[Serdes.scala 622:24]
  wire [7:0] outArb_io_in_4_bits_union; // @[Serdes.scala 622:24]
  wire  outArb_io_in_4_bits_last; // @[Serdes.scala 622:24]
  wire  outArb_io_out_ready; // @[Serdes.scala 622:24]
  wire  outArb_io_out_valid; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_out_bits_chanId; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_out_bits_opcode; // @[Serdes.scala 622:24]
  wire [2:0] outArb_io_out_bits_param; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_out_bits_size; // @[Serdes.scala 622:24]
  wire [3:0] outArb_io_out_bits_source; // @[Serdes.scala 622:24]
  wire [31:0] outArb_io_out_bits_address; // @[Serdes.scala 622:24]
  wire [63:0] outArb_io_out_bits_data; // @[Serdes.scala 622:24]
  wire  outArb_io_out_bits_corrupt; // @[Serdes.scala 622:24]
  wire [7:0] outArb_io_out_bits_union; // @[Serdes.scala 622:24]
  wire  outArb_io_out_bits_last; // @[Serdes.scala 622:24]
  wire  outSer_clock; // @[Serdes.scala 624:24]
  wire  outSer_reset; // @[Serdes.scala 624:24]
  wire  outSer_io_in_ready; // @[Serdes.scala 624:24]
  wire  outSer_io_in_valid; // @[Serdes.scala 624:24]
  wire [2:0] outSer_io_in_bits_chanId; // @[Serdes.scala 624:24]
  wire [2:0] outSer_io_in_bits_opcode; // @[Serdes.scala 624:24]
  wire [2:0] outSer_io_in_bits_param; // @[Serdes.scala 624:24]
  wire [3:0] outSer_io_in_bits_size; // @[Serdes.scala 624:24]
  wire [3:0] outSer_io_in_bits_source; // @[Serdes.scala 624:24]
  wire [31:0] outSer_io_in_bits_address; // @[Serdes.scala 624:24]
  wire [63:0] outSer_io_in_bits_data; // @[Serdes.scala 624:24]
  wire  outSer_io_in_bits_corrupt; // @[Serdes.scala 624:24]
  wire [7:0] outSer_io_in_bits_union; // @[Serdes.scala 624:24]
  wire  outSer_io_in_bits_last; // @[Serdes.scala 624:24]
  wire  outSer_io_out_ready; // @[Serdes.scala 624:24]
  wire  outSer_io_out_valid; // @[Serdes.scala 624:24]
  wire [3:0] outSer_io_out_bits; // @[Serdes.scala 624:24]
  wire  inDes_clock; // @[Serdes.scala 629:23]
  wire  inDes_reset; // @[Serdes.scala 629:23]
  wire  inDes_io_in_ready; // @[Serdes.scala 629:23]
  wire  inDes_io_in_valid; // @[Serdes.scala 629:23]
  wire [3:0] inDes_io_in_bits; // @[Serdes.scala 629:23]
  wire  inDes_io_out_ready; // @[Serdes.scala 629:23]
  wire  inDes_io_out_valid; // @[Serdes.scala 629:23]
  wire [2:0] inDes_io_out_bits_chanId; // @[Serdes.scala 629:23]
  wire [2:0] inDes_io_out_bits_opcode; // @[Serdes.scala 629:23]
  wire [2:0] inDes_io_out_bits_param; // @[Serdes.scala 629:23]
  wire [3:0] inDes_io_out_bits_size; // @[Serdes.scala 629:23]
  wire [3:0] inDes_io_out_bits_source; // @[Serdes.scala 629:23]
  wire [31:0] inDes_io_out_bits_address; // @[Serdes.scala 629:23]
  wire [63:0] inDes_io_out_bits_data; // @[Serdes.scala 629:23]
  wire  inDes_io_out_bits_corrupt; // @[Serdes.scala 629:23]
  wire [7:0] inDes_io_out_bits_union; // @[Serdes.scala 629:23]
  wire  inDes_io_out_bits_last; // @[Serdes.scala 629:23]
  wire [2:0] _T_2 = {auto_client_out_d_bits_sink,auto_client_out_d_bits_denied}; // @[Cat.scala 30:58]
  wire  client_tl_d_ready = outArb_io_in_1_ready; // @[Serdes.scala 357:22 Serdes.scala 625:18]
  wire  _T_3 = client_tl_d_ready & auto_client_out_d_valid; // @[Decoupled.scala 40:37]
  wire [26:0] _beats1_decode_T_1 = 27'hfff << auto_client_out_d_bits_size; // @[package.scala 234:77]
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] beats1_decode = _beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  beats1_opdata = auto_client_out_d_bits_opcode[0]; // @[Edges.scala 105:36]
  wire [8:0] beats1 = beats1_opdata ? beats1_decode : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] counter_1; // @[Edges.scala 228:27]
  wire [8:0] counter1_1 = counter_1 - 9'h1; // @[Edges.scala 229:28]
  wire  first_1 = counter_1 == 9'h0; // @[Edges.scala 230:25]
  wire  manager_tl_a_ready = outArb_io_in_4_ready; // @[Serdes.scala 357:22 Serdes.scala 625:18]
  wire  _T_6 = manager_tl_a_ready & auto_manager_in_a_valid; // @[Decoupled.scala 40:37]
  wire [18:0] _beats1_decode_T_13 = 19'hfff << auto_manager_in_a_bits_size; // @[package.scala 234:77]
  wire [11:0] _beats1_decode_T_15 = ~_beats1_decode_T_13[11:0]; // @[package.scala 234:46]
  wire [8:0] beats1_decode_3 = _beats1_decode_T_15[11:3]; // @[Edges.scala 219:59]
  wire  beats1_opdata_3 = ~auto_manager_in_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [8:0] beats1_3 = beats1_opdata_3 ? beats1_decode_3 : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] counter_4; // @[Edges.scala 228:27]
  wire [8:0] counter1_4 = counter_4 - 9'h1; // @[Edges.scala 229:28]
  wire  first_4 = counter_4 == 9'h0; // @[Edges.scala 230:25]
  wire  _bundleOut_0_a_valid_T = inDes_io_out_bits_chanId == 3'h0; // @[Serdes.scala 236:37]
  wire  _bundleIn_0_d_valid_T = inDes_io_out_bits_chanId == 3'h3; // @[Serdes.scala 239:37]
  wire [7:0] _bundleIn_0_d_bits_T = {{1'd0}, inDes_io_out_bits_union[7:1]}; // @[Serdes.scala 468:31]
  wire  _T_17 = 3'h1 == inDes_io_out_bits_chanId ? 1'h0 : 3'h0 == inDes_io_out_bits_chanId & auto_client_out_a_ready; // @[Mux.scala 80:57]
  wire  _T_19 = 3'h2 == inDes_io_out_bits_chanId ? 1'h0 : _T_17; // @[Mux.scala 80:57]
  wire  _T_21 = 3'h3 == inDes_io_out_bits_chanId ? auto_manager_in_d_ready : _T_19; // @[Mux.scala 80:57]
  TLMonitor_49 monitor ( // @[Nodes.scala 24:25]
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
  HellaPeekingArbiter outArb ( // @[Serdes.scala 622:24]
    .clock(outArb_clock),
    .reset(outArb_reset),
    .io_in_0_ready(outArb_io_in_0_ready),
    .io_in_0_valid(outArb_io_in_0_valid),
    .io_in_0_bits_chanId(outArb_io_in_0_bits_chanId),
    .io_in_0_bits_opcode(outArb_io_in_0_bits_opcode),
    .io_in_0_bits_param(outArb_io_in_0_bits_param),
    .io_in_0_bits_size(outArb_io_in_0_bits_size),
    .io_in_0_bits_source(outArb_io_in_0_bits_source),
    .io_in_0_bits_address(outArb_io_in_0_bits_address),
    .io_in_0_bits_data(outArb_io_in_0_bits_data),
    .io_in_0_bits_corrupt(outArb_io_in_0_bits_corrupt),
    .io_in_0_bits_union(outArb_io_in_0_bits_union),
    .io_in_0_bits_last(outArb_io_in_0_bits_last),
    .io_in_1_ready(outArb_io_in_1_ready),
    .io_in_1_valid(outArb_io_in_1_valid),
    .io_in_1_bits_chanId(outArb_io_in_1_bits_chanId),
    .io_in_1_bits_opcode(outArb_io_in_1_bits_opcode),
    .io_in_1_bits_param(outArb_io_in_1_bits_param),
    .io_in_1_bits_size(outArb_io_in_1_bits_size),
    .io_in_1_bits_source(outArb_io_in_1_bits_source),
    .io_in_1_bits_address(outArb_io_in_1_bits_address),
    .io_in_1_bits_data(outArb_io_in_1_bits_data),
    .io_in_1_bits_corrupt(outArb_io_in_1_bits_corrupt),
    .io_in_1_bits_union(outArb_io_in_1_bits_union),
    .io_in_1_bits_last(outArb_io_in_1_bits_last),
    .io_in_2_ready(outArb_io_in_2_ready),
    .io_in_2_valid(outArb_io_in_2_valid),
    .io_in_2_bits_chanId(outArb_io_in_2_bits_chanId),
    .io_in_2_bits_opcode(outArb_io_in_2_bits_opcode),
    .io_in_2_bits_param(outArb_io_in_2_bits_param),
    .io_in_2_bits_size(outArb_io_in_2_bits_size),
    .io_in_2_bits_source(outArb_io_in_2_bits_source),
    .io_in_2_bits_address(outArb_io_in_2_bits_address),
    .io_in_2_bits_data(outArb_io_in_2_bits_data),
    .io_in_2_bits_corrupt(outArb_io_in_2_bits_corrupt),
    .io_in_2_bits_union(outArb_io_in_2_bits_union),
    .io_in_2_bits_last(outArb_io_in_2_bits_last),
    .io_in_3_ready(outArb_io_in_3_ready),
    .io_in_3_valid(outArb_io_in_3_valid),
    .io_in_3_bits_chanId(outArb_io_in_3_bits_chanId),
    .io_in_3_bits_opcode(outArb_io_in_3_bits_opcode),
    .io_in_3_bits_param(outArb_io_in_3_bits_param),
    .io_in_3_bits_size(outArb_io_in_3_bits_size),
    .io_in_3_bits_source(outArb_io_in_3_bits_source),
    .io_in_3_bits_address(outArb_io_in_3_bits_address),
    .io_in_3_bits_data(outArb_io_in_3_bits_data),
    .io_in_3_bits_corrupt(outArb_io_in_3_bits_corrupt),
    .io_in_3_bits_union(outArb_io_in_3_bits_union),
    .io_in_3_bits_last(outArb_io_in_3_bits_last),
    .io_in_4_ready(outArb_io_in_4_ready),
    .io_in_4_valid(outArb_io_in_4_valid),
    .io_in_4_bits_chanId(outArb_io_in_4_bits_chanId),
    .io_in_4_bits_opcode(outArb_io_in_4_bits_opcode),
    .io_in_4_bits_param(outArb_io_in_4_bits_param),
    .io_in_4_bits_size(outArb_io_in_4_bits_size),
    .io_in_4_bits_source(outArb_io_in_4_bits_source),
    .io_in_4_bits_address(outArb_io_in_4_bits_address),
    .io_in_4_bits_data(outArb_io_in_4_bits_data),
    .io_in_4_bits_corrupt(outArb_io_in_4_bits_corrupt),
    .io_in_4_bits_union(outArb_io_in_4_bits_union),
    .io_in_4_bits_last(outArb_io_in_4_bits_last),
    .io_out_ready(outArb_io_out_ready),
    .io_out_valid(outArb_io_out_valid),
    .io_out_bits_chanId(outArb_io_out_bits_chanId),
    .io_out_bits_opcode(outArb_io_out_bits_opcode),
    .io_out_bits_param(outArb_io_out_bits_param),
    .io_out_bits_size(outArb_io_out_bits_size),
    .io_out_bits_source(outArb_io_out_bits_source),
    .io_out_bits_address(outArb_io_out_bits_address),
    .io_out_bits_data(outArb_io_out_bits_data),
    .io_out_bits_corrupt(outArb_io_out_bits_corrupt),
    .io_out_bits_union(outArb_io_out_bits_union),
    .io_out_bits_last(outArb_io_out_bits_last)
  );
  GenericSerializer outSer ( // @[Serdes.scala 624:24]
    .clock(outSer_clock),
    .reset(outSer_reset),
    .io_in_ready(outSer_io_in_ready),
    .io_in_valid(outSer_io_in_valid),
    .io_in_bits_chanId(outSer_io_in_bits_chanId),
    .io_in_bits_opcode(outSer_io_in_bits_opcode),
    .io_in_bits_param(outSer_io_in_bits_param),
    .io_in_bits_size(outSer_io_in_bits_size),
    .io_in_bits_source(outSer_io_in_bits_source),
    .io_in_bits_address(outSer_io_in_bits_address),
    .io_in_bits_data(outSer_io_in_bits_data),
    .io_in_bits_corrupt(outSer_io_in_bits_corrupt),
    .io_in_bits_union(outSer_io_in_bits_union),
    .io_in_bits_last(outSer_io_in_bits_last),
    .io_out_ready(outSer_io_out_ready),
    .io_out_valid(outSer_io_out_valid),
    .io_out_bits(outSer_io_out_bits)
  );
  GenericDeserializer inDes ( // @[Serdes.scala 629:23]
    .clock(inDes_clock),
    .reset(inDes_reset),
    .io_in_ready(inDes_io_in_ready),
    .io_in_valid(inDes_io_in_valid),
    .io_in_bits(inDes_io_in_bits),
    .io_out_ready(inDes_io_out_ready),
    .io_out_valid(inDes_io_out_valid),
    .io_out_bits_chanId(inDes_io_out_bits_chanId),
    .io_out_bits_opcode(inDes_io_out_bits_opcode),
    .io_out_bits_param(inDes_io_out_bits_param),
    .io_out_bits_size(inDes_io_out_bits_size),
    .io_out_bits_source(inDes_io_out_bits_source),
    .io_out_bits_address(inDes_io_out_bits_address),
    .io_out_bits_data(inDes_io_out_bits_data),
    .io_out_bits_corrupt(inDes_io_out_bits_corrupt),
    .io_out_bits_union(inDes_io_out_bits_union),
    .io_out_bits_last(inDes_io_out_bits_last)
  );
  assign auto_manager_in_a_ready = outArb_io_in_4_ready; // @[Serdes.scala 357:22 Serdes.scala 625:18]
  assign auto_manager_in_d_valid = inDes_io_out_valid & _bundleIn_0_d_valid_T; // @[Serdes.scala 637:46]
  assign auto_manager_in_d_bits_opcode = inDes_io_out_bits_opcode; // @[Serdes.scala 460:17 Serdes.scala 461:15]
  assign auto_manager_in_d_bits_param = inDes_io_out_bits_param[1:0]; // @[Serdes.scala 460:17 Serdes.scala 462:15]
  assign auto_manager_in_d_bits_size = inDes_io_out_bits_size[2:0]; // @[Serdes.scala 460:17 Serdes.scala 463:15]
  assign auto_manager_in_d_bits_source = inDes_io_out_bits_source; // @[Serdes.scala 460:17 Serdes.scala 464:15]
  assign auto_manager_in_d_bits_sink = _bundleIn_0_d_bits_T[0]; // @[Serdes.scala 460:17 Serdes.scala 468:17]
  assign auto_manager_in_d_bits_denied = inDes_io_out_bits_union[0]; // @[Serdes.scala 469:30]
  assign auto_manager_in_d_bits_data = inDes_io_out_bits_data; // @[Serdes.scala 460:17 Serdes.scala 465:15]
  assign auto_manager_in_d_bits_corrupt = inDes_io_out_bits_corrupt; // @[Serdes.scala 460:17 Serdes.scala 467:17]
  assign auto_client_out_a_valid = inDes_io_out_valid & _bundleOut_0_a_valid_T; // @[Serdes.scala 631:45]
  assign auto_client_out_a_bits_opcode = inDes_io_out_bits_opcode; // @[Serdes.scala 374:17 Serdes.scala 375:15]
  assign auto_client_out_a_bits_param = inDes_io_out_bits_param; // @[Serdes.scala 374:17 Serdes.scala 376:15]
  assign auto_client_out_a_bits_size = inDes_io_out_bits_size; // @[Serdes.scala 374:17 Serdes.scala 377:15]
  assign auto_client_out_a_bits_source = inDes_io_out_bits_source[0]; // @[Serdes.scala 374:17 Serdes.scala 378:15]
  assign auto_client_out_a_bits_address = inDes_io_out_bits_address; // @[Serdes.scala 374:17 Serdes.scala 379:15]
  assign auto_client_out_a_bits_mask = inDes_io_out_bits_union; // @[Serdes.scala 374:17 Serdes.scala 385:15]
  assign auto_client_out_a_bits_data = inDes_io_out_bits_data; // @[Serdes.scala 374:17 Serdes.scala 380:15]
  assign auto_client_out_a_bits_corrupt = inDes_io_out_bits_corrupt; // @[Serdes.scala 374:17 Serdes.scala 382:17]
  assign auto_client_out_d_ready = outArb_io_in_1_ready; // @[Serdes.scala 357:22 Serdes.scala 625:18]
  assign io_ser_in_ready = inDes_io_in_ready; // @[Serdes.scala 630:17]
  assign io_ser_out_valid = outSer_io_out_valid; // @[Serdes.scala 627:16]
  assign io_ser_out_bits = outSer_io_out_bits; // @[Serdes.scala 627:16]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = outArb_io_in_4_ready; // @[Serdes.scala 357:22 Serdes.scala 625:18]
  assign monitor_io_in_a_valid = auto_manager_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_manager_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_manager_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_manager_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_manager_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_manager_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_manager_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_data = auto_manager_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_manager_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_manager_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = inDes_io_out_valid & _bundleIn_0_d_valid_T; // @[Serdes.scala 637:46]
  assign monitor_io_in_d_bits_opcode = inDes_io_out_bits_opcode; // @[Serdes.scala 460:17 Serdes.scala 461:15]
  assign monitor_io_in_d_bits_param = inDes_io_out_bits_param[1:0]; // @[Serdes.scala 460:17 Serdes.scala 462:15]
  assign monitor_io_in_d_bits_size = inDes_io_out_bits_size[2:0]; // @[Serdes.scala 460:17 Serdes.scala 463:15]
  assign monitor_io_in_d_bits_source = inDes_io_out_bits_source; // @[Serdes.scala 460:17 Serdes.scala 464:15]
  assign monitor_io_in_d_bits_sink = _bundleIn_0_d_bits_T[0]; // @[Serdes.scala 460:17 Serdes.scala 468:17]
  assign monitor_io_in_d_bits_denied = inDes_io_out_bits_union[0]; // @[Serdes.scala 469:30]
  assign monitor_io_in_d_bits_data = inDes_io_out_bits_data; // @[Serdes.scala 460:17 Serdes.scala 465:15]
  assign monitor_io_in_d_bits_corrupt = inDes_io_out_bits_corrupt; // @[Serdes.scala 460:17 Serdes.scala 467:17]
  assign outArb_clock = clock;
  assign outArb_reset = reset;
  assign outArb_io_in_0_valid = 1'h0; // @[Serdes.scala 357:22 Serdes.scala 358:18]
  assign outArb_io_in_0_bits_chanId = 3'h4; // @[Serdes.scala 333:22 Serdes.scala 334:20]
  assign outArb_io_in_0_bits_opcode = 3'h0; // @[Serdes.scala 333:22 Serdes.scala 335:20]
  assign outArb_io_in_0_bits_param = 3'h0; // @[Serdes.scala 333:22 Serdes.scala 336:20]
  assign outArb_io_in_0_bits_size = 4'h0; // @[Serdes.scala 333:22 Serdes.scala 337:20]
  assign outArb_io_in_0_bits_source = 4'h0; // @[Serdes.scala 333:22 Serdes.scala 338:20]
  assign outArb_io_in_0_bits_address = 32'h0; // @[Serdes.scala 333:22 Serdes.scala 339:20]
  assign outArb_io_in_0_bits_data = 64'h0; // @[Serdes.scala 333:22 Serdes.scala 340:20]
  assign outArb_io_in_0_bits_corrupt = 1'h0; // @[Serdes.scala 357:22 Serdes.scala 359:17]
  assign outArb_io_in_0_bits_union = 8'h0; // @[Serdes.scala 333:22 Serdes.scala 343:22]
  assign outArb_io_in_0_bits_last = 1'h1; // @[Edges.scala 231:37]
  assign outArb_io_in_1_valid = auto_client_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign outArb_io_in_1_bits_chanId = 3'h3; // @[Serdes.scala 312:22 Serdes.scala 313:20]
  assign outArb_io_in_1_bits_opcode = auto_client_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign outArb_io_in_1_bits_param = {{1'd0}, auto_client_out_d_bits_param}; // @[Serdes.scala 312:22 Serdes.scala 315:20]
  assign outArb_io_in_1_bits_size = auto_client_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign outArb_io_in_1_bits_source = {{3'd0}, auto_client_out_d_bits_source}; // @[Serdes.scala 312:22 Serdes.scala 317:20]
  assign outArb_io_in_1_bits_address = 32'h0; // @[Serdes.scala 357:22 Serdes.scala 359:17]
  assign outArb_io_in_1_bits_data = auto_client_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign outArb_io_in_1_bits_corrupt = auto_client_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign outArb_io_in_1_bits_union = {{5'd0}, _T_2}; // @[Serdes.scala 312:22 Serdes.scala 322:22]
  assign outArb_io_in_1_bits_last = counter_1 == 9'h1 | beats1 == 9'h0; // @[Edges.scala 231:37]
  assign outArb_io_in_2_valid = 1'h0; // @[Serdes.scala 357:22 Serdes.scala 358:18]
  assign outArb_io_in_2_bits_chanId = 3'h2; // @[Serdes.scala 291:22 Serdes.scala 292:20]
  assign outArb_io_in_2_bits_opcode = 3'h0; // @[Serdes.scala 291:22 Serdes.scala 293:20]
  assign outArb_io_in_2_bits_param = 3'h0; // @[Serdes.scala 291:22 Serdes.scala 294:20]
  assign outArb_io_in_2_bits_size = 4'h0; // @[Serdes.scala 291:22 Serdes.scala 295:20]
  assign outArb_io_in_2_bits_source = 4'h0; // @[Serdes.scala 291:22 Serdes.scala 296:20]
  assign outArb_io_in_2_bits_address = 32'h0; // @[Serdes.scala 291:22 Serdes.scala 297:20]
  assign outArb_io_in_2_bits_data = 64'h0; // @[Serdes.scala 291:22 Serdes.scala 298:20]
  assign outArb_io_in_2_bits_corrupt = 1'h0; // @[Serdes.scala 291:22 Serdes.scala 300:26]
  assign outArb_io_in_2_bits_union = 8'h0; // @[Serdes.scala 357:22 Serdes.scala 359:17]
  assign outArb_io_in_2_bits_last = 1'h1; // @[Edges.scala 231:37]
  assign outArb_io_in_3_valid = 1'h0; // @[Serdes.scala 357:22 Serdes.scala 358:18]
  assign outArb_io_in_3_bits_chanId = 3'h1; // @[Serdes.scala 273:22 Serdes.scala 274:20]
  assign outArb_io_in_3_bits_opcode = 3'h0; // @[Serdes.scala 273:22 Serdes.scala 275:20]
  assign outArb_io_in_3_bits_param = 3'h0; // @[Serdes.scala 273:22 Serdes.scala 276:20]
  assign outArb_io_in_3_bits_size = 4'h0; // @[Serdes.scala 273:22 Serdes.scala 277:20]
  assign outArb_io_in_3_bits_source = 4'h0; // @[Serdes.scala 273:22 Serdes.scala 278:20]
  assign outArb_io_in_3_bits_address = 32'h0; // @[Serdes.scala 273:22 Serdes.scala 279:20]
  assign outArb_io_in_3_bits_data = 64'h0; // @[Serdes.scala 273:22 Serdes.scala 280:20]
  assign outArb_io_in_3_bits_corrupt = 1'h0; // @[Serdes.scala 273:22 Serdes.scala 282:26]
  assign outArb_io_in_3_bits_union = 8'h0; // @[Serdes.scala 273:22 Serdes.scala 283:20]
  assign outArb_io_in_3_bits_last = 1'h1; // @[Edges.scala 231:37]
  assign outArb_io_in_4_valid = auto_manager_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign outArb_io_in_4_bits_chanId = 3'h0; // @[Serdes.scala 255:22 Serdes.scala 256:20]
  assign outArb_io_in_4_bits_opcode = auto_manager_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign outArb_io_in_4_bits_param = auto_manager_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign outArb_io_in_4_bits_size = {{1'd0}, auto_manager_in_a_bits_size}; // @[Serdes.scala 255:22 Serdes.scala 259:20]
  assign outArb_io_in_4_bits_source = auto_manager_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign outArb_io_in_4_bits_address = {{3'd0}, auto_manager_in_a_bits_address}; // @[Serdes.scala 255:22 Serdes.scala 261:20]
  assign outArb_io_in_4_bits_data = auto_manager_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign outArb_io_in_4_bits_corrupt = auto_manager_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign outArb_io_in_4_bits_union = auto_manager_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign outArb_io_in_4_bits_last = counter_4 == 9'h1 | beats1_3 == 9'h0; // @[Edges.scala 231:37]
  assign outArb_io_out_ready = outSer_io_in_ready; // @[Serdes.scala 626:18]
  assign outSer_clock = clock;
  assign outSer_reset = reset;
  assign outSer_io_in_valid = outArb_io_out_valid; // @[Serdes.scala 626:18]
  assign outSer_io_in_bits_chanId = outArb_io_out_bits_chanId; // @[Serdes.scala 626:18]
  assign outSer_io_in_bits_opcode = outArb_io_out_bits_opcode; // @[Serdes.scala 626:18]
  assign outSer_io_in_bits_param = outArb_io_out_bits_param; // @[Serdes.scala 626:18]
  assign outSer_io_in_bits_size = outArb_io_out_bits_size; // @[Serdes.scala 626:18]
  assign outSer_io_in_bits_source = outArb_io_out_bits_source; // @[Serdes.scala 626:18]
  assign outSer_io_in_bits_address = outArb_io_out_bits_address; // @[Serdes.scala 626:18]
  assign outSer_io_in_bits_data = outArb_io_out_bits_data; // @[Serdes.scala 626:18]
  assign outSer_io_in_bits_corrupt = outArb_io_out_bits_corrupt; // @[Serdes.scala 626:18]
  assign outSer_io_in_bits_union = outArb_io_out_bits_union; // @[Serdes.scala 626:18]
  assign outSer_io_in_bits_last = outArb_io_out_bits_last; // @[Serdes.scala 626:18]
  assign outSer_io_out_ready = io_ser_out_ready; // @[Serdes.scala 627:16]
  assign inDes_clock = clock;
  assign inDes_reset = reset;
  assign inDes_io_in_valid = io_ser_in_valid; // @[Serdes.scala 630:17]
  assign inDes_io_in_bits = io_ser_in_bits; // @[Serdes.scala 630:17]
  assign inDes_io_out_ready = 3'h4 == inDes_io_out_bits_chanId ? 1'h0 : _T_21; // @[Mux.scala 80:57]
  always @(posedge clock) begin
    if (reset) begin // @[Edges.scala 228:27]
      counter_1 <= 9'h0; // @[Edges.scala 228:27]
    end else if (_T_3) begin // @[Edges.scala 234:17]
      if (first_1) begin // @[Edges.scala 235:21]
        if (beats1_opdata) begin // @[Edges.scala 220:14]
          counter_1 <= beats1_decode;
        end else begin
          counter_1 <= 9'h0;
        end
      end else begin
        counter_1 <= counter1_1;
      end
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter_4 <= 9'h0; // @[Edges.scala 228:27]
    end else if (_T_6) begin // @[Edges.scala 234:17]
      if (first_4) begin // @[Edges.scala 235:21]
        if (beats1_opdata_3) begin // @[Edges.scala 220:14]
          counter_4 <= beats1_decode_3;
        end else begin
          counter_4 <= 9'h0;
        end
      end else begin
        counter_4 <= counter1_4;
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
  counter_1 = _RAND_0[8:0];
  _RAND_1 = {1{`RANDOM}};
  counter_4 = _RAND_1[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
