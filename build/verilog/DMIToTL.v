module DMIToTL(
  input         clock,
  input         reset,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [1:0]  auto_out_a_bits_size,
  output        auto_out_a_bits_source,
  output [8:0]  auto_out_a_bits_address,
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [1:0]  auto_out_d_bits_size,
  input         auto_out_d_bits_source,
  input         auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [31:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt,
  output        io_dmi_req_ready,
  input         io_dmi_req_valid,
  input  [6:0]  io_dmi_req_bits_addr,
  input  [31:0] io_dmi_req_bits_data,
  input  [1:0]  io_dmi_req_bits_op,
  input         io_dmi_resp_ready,
  output        io_dmi_resp_valid,
  output [31:0] io_dmi_resp_bits_data,
  output [1:0]  io_dmi_resp_bits_resp
);
  wire [8:0] addr = {io_dmi_req_bits_addr, 2'h0}; // @[DMI.scala 95:46]
  wire [8:0] _GEN_3 = io_dmi_req_bits_op == 2'h1 ? addr : 9'h48; // @[DMI.scala 110:64 DMI.scala 110:76 DMI.scala 111:76]
  wire [2:0] _GEN_7 = io_dmi_req_bits_op == 2'h1 ? 3'h4 : 3'h0; // @[DMI.scala 110:64 DMI.scala 110:76 DMI.scala 111:76]
  wire  _io_dmi_resp_bits_resp_T = auto_out_d_bits_corrupt | auto_out_d_bits_denied; // @[DMI.scala 119:53]
  assign auto_out_a_valid = io_dmi_req_valid; // @[Nodes.scala 1207:84 DMI.scala 114:22]
  assign auto_out_a_bits_opcode = io_dmi_req_bits_op == 2'h2 ? 3'h0 : _GEN_7; // @[DMI.scala 109:64 DMI.scala 109:76]
  assign auto_out_a_bits_param = 3'h0; // @[DMI.scala 109:64 DMI.scala 109:76]
  assign auto_out_a_bits_size = 2'h2; // @[DMI.scala 109:64 DMI.scala 109:76]
  assign auto_out_a_bits_source = 1'h0; // @[DMI.scala 109:64 DMI.scala 109:76]
  assign auto_out_a_bits_address = io_dmi_req_bits_op == 2'h2 ? addr : _GEN_3; // @[DMI.scala 109:64 DMI.scala 109:76]
  assign auto_out_a_bits_mask = 4'hf; // @[DMI.scala 109:64 DMI.scala 109:76]
  assign auto_out_a_bits_data = io_dmi_req_bits_op == 2'h2 ? io_dmi_req_bits_data : 32'h0; // @[DMI.scala 109:64 DMI.scala 109:76]
  assign auto_out_a_bits_corrupt = 1'h0; // @[DMI.scala 109:64 DMI.scala 109:76]
  assign auto_out_d_ready = io_dmi_resp_ready; // @[Nodes.scala 1207:84 DMI.scala 118:28]
  assign io_dmi_req_ready = auto_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign io_dmi_resp_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign io_dmi_resp_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign io_dmi_resp_bits_resp = {{1'd0}, _io_dmi_resp_bits_resp_T}; // @[DMI.scala 119:53]
endmodule
