module DebugTransportModuleJTAG(
  input         io_jtag_clock,
  input         io_jtag_reset,
  input         io_dmi_req_ready,
  output        io_dmi_req_valid,
  output [6:0]  io_dmi_req_bits_addr,
  output [31:0] io_dmi_req_bits_data,
  output [1:0]  io_dmi_req_bits_op,
  output        io_dmi_resp_ready,
  input         io_dmi_resp_valid,
  input  [31:0] io_dmi_resp_bits_data,
  input  [1:0]  io_dmi_resp_bits_resp,
  input         io_jtag_TCK,
  input         io_jtag_TMS,
  input         io_jtag_TDI,
  output        io_jtag_TDO_data,
  output        io_jtag_TDO_driven,
  input  [10:0] io_jtag_mfr_id,
  input  [15:0] io_jtag_part_number,
  input  [3:0]  io_jtag_version,
  input         rf_reset
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
  wire  dtmInfoChain_clock; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_reset; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_chainIn_shift; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_chainIn_data; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_chainIn_capture; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_chainIn_update; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_chainOut_shift; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_chainOut_data; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_chainOut_capture; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_chainOut_update; // @[DebugTransport.scala 130:29]
  wire [14:0] dtmInfoChain_io_capture_bits_reserved1; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_capture_bits_dmireset; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_capture_bits_reserved0; // @[DebugTransport.scala 130:29]
  wire [2:0] dtmInfoChain_io_capture_bits_dmiIdleCycles; // @[DebugTransport.scala 130:29]
  wire [1:0] dtmInfoChain_io_capture_bits_dmiStatus; // @[DebugTransport.scala 130:29]
  wire [5:0] dtmInfoChain_io_capture_bits_debugAddrBits; // @[DebugTransport.scala 130:29]
  wire [3:0] dtmInfoChain_io_capture_bits_debugVersion; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_capture_capture; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_update_valid; // @[DebugTransport.scala 130:29]
  wire [14:0] dtmInfoChain_io_update_bits_reserved1; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_update_bits_dmireset; // @[DebugTransport.scala 130:29]
  wire  dtmInfoChain_io_update_bits_reserved0; // @[DebugTransport.scala 130:29]
  wire [2:0] dtmInfoChain_io_update_bits_dmiIdleCycles; // @[DebugTransport.scala 130:29]
  wire [1:0] dtmInfoChain_io_update_bits_dmiStatus; // @[DebugTransport.scala 130:29]
  wire [5:0] dtmInfoChain_io_update_bits_debugAddrBits; // @[DebugTransport.scala 130:29]
  wire [3:0] dtmInfoChain_io_update_bits_debugVersion; // @[DebugTransport.scala 130:29]
  wire  dmiAccessChain_clock; // @[DebugTransport.scala 136:31]
  wire  dmiAccessChain_reset; // @[DebugTransport.scala 136:31]
  wire  dmiAccessChain_io_chainIn_shift; // @[DebugTransport.scala 136:31]
  wire  dmiAccessChain_io_chainIn_data; // @[DebugTransport.scala 136:31]
  wire  dmiAccessChain_io_chainIn_capture; // @[DebugTransport.scala 136:31]
  wire  dmiAccessChain_io_chainIn_update; // @[DebugTransport.scala 136:31]
  wire  dmiAccessChain_io_chainOut_shift; // @[DebugTransport.scala 136:31]
  wire  dmiAccessChain_io_chainOut_data; // @[DebugTransport.scala 136:31]
  wire  dmiAccessChain_io_chainOut_capture; // @[DebugTransport.scala 136:31]
  wire  dmiAccessChain_io_chainOut_update; // @[DebugTransport.scala 136:31]
  wire [6:0] dmiAccessChain_io_capture_bits_addr; // @[DebugTransport.scala 136:31]
  wire [31:0] dmiAccessChain_io_capture_bits_data; // @[DebugTransport.scala 136:31]
  wire [1:0] dmiAccessChain_io_capture_bits_resp; // @[DebugTransport.scala 136:31]
  wire  dmiAccessChain_io_capture_capture; // @[DebugTransport.scala 136:31]
  wire  dmiAccessChain_io_update_valid; // @[DebugTransport.scala 136:31]
  wire [6:0] dmiAccessChain_io_update_bits_addr; // @[DebugTransport.scala 136:31]
  wire [31:0] dmiAccessChain_io_update_bits_data; // @[DebugTransport.scala 136:31]
  wire [1:0] dmiAccessChain_io_update_bits_op; // @[DebugTransport.scala 136:31]
  wire  tapIO_idcodeChain_clock; // @[JtagTap.scala 185:33]
  wire  tapIO_idcodeChain_reset; // @[JtagTap.scala 185:33]
  wire  tapIO_idcodeChain_io_chainIn_shift; // @[JtagTap.scala 185:33]
  wire  tapIO_idcodeChain_io_chainIn_data; // @[JtagTap.scala 185:33]
  wire  tapIO_idcodeChain_io_chainIn_capture; // @[JtagTap.scala 185:33]
  wire  tapIO_idcodeChain_io_chainIn_update; // @[JtagTap.scala 185:33]
  wire  tapIO_idcodeChain_io_chainOut_shift; // @[JtagTap.scala 185:33]
  wire  tapIO_idcodeChain_io_chainOut_data; // @[JtagTap.scala 185:33]
  wire  tapIO_idcodeChain_io_chainOut_capture; // @[JtagTap.scala 185:33]
  wire  tapIO_idcodeChain_io_chainOut_update; // @[JtagTap.scala 185:33]
  wire [3:0] tapIO_idcodeChain_io_capture_bits_version; // @[JtagTap.scala 185:33]
  wire [15:0] tapIO_idcodeChain_io_capture_bits_partNumber; // @[JtagTap.scala 185:33]
  wire [10:0] tapIO_idcodeChain_io_capture_bits_mfrId; // @[JtagTap.scala 185:33]
  wire  tapIO_idcodeChain_io_capture_bits_always1; // @[JtagTap.scala 185:33]
  wire  tapIO_idcodeChain_io_capture_capture; // @[JtagTap.scala 185:33]
  wire  tapIO_controllerInternal_clock; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_reset; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_jtag_TCK; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_jtag_TMS; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_jtag_TDI; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_jtag_TDO_data; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_jtag_TDO_driven; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_control_jtag_reset; // @[JtagTap.scala 203:36]
  wire [3:0] tapIO_controllerInternal_io_output_state; // @[JtagTap.scala 203:36]
  wire [4:0] tapIO_controllerInternal_io_output_instruction; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_output_tapIsInTestLogicReset; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_dataChainIn_shift; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_dataChainIn_data; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_dataChainIn_capture; // @[JtagTap.scala 203:36]
  wire  tapIO_controllerInternal_io_dataChainIn_update; // @[JtagTap.scala 203:36]
  wire  tapIO_bypassChain_clock; // @[JtagTap.scala 211:29]
  wire  tapIO_bypassChain_reset; // @[JtagTap.scala 211:29]
  wire  tapIO_bypassChain_io_chainIn_shift; // @[JtagTap.scala 211:29]
  wire  tapIO_bypassChain_io_chainIn_data; // @[JtagTap.scala 211:29]
  wire  tapIO_bypassChain_io_chainIn_capture; // @[JtagTap.scala 211:29]
  wire  tapIO_bypassChain_io_chainIn_update; // @[JtagTap.scala 211:29]
  wire  tapIO_bypassChain_io_chainOut_shift; // @[JtagTap.scala 211:29]
  wire  tapIO_bypassChain_io_chainOut_data; // @[JtagTap.scala 211:29]
  wire  tapIO_bypassChain_io_chainOut_capture; // @[JtagTap.scala 211:29]
  wire  tapIO_bypassChain_io_chainOut_update; // @[JtagTap.scala 211:29]
  reg  busyReg; // @[DebugTransport.scala 98:24]
  reg  stickyBusyReg; // @[DebugTransport.scala 99:30]
  reg  dmiStatus_hi; // @[DebugTransport.scala 100:37]
  reg  downgradeOpReg; // @[DebugTransport.scala 102:31]
  reg [6:0] dmiReqReg_addr; // @[DebugTransport.scala 112:23]
  reg [31:0] dmiReqReg_data; // @[DebugTransport.scala 112:23]
  reg [1:0] dmiReqReg_op; // @[DebugTransport.scala 112:23]
  reg  dmiReqValidReg; // @[DebugTransport.scala 113:31]
  wire  dmiStatus_lo = dmiStatus_hi | stickyBusyReg; // @[DebugTransport.scala 120:63]
  wire  _GEN_0 = io_dmi_req_valid | busyReg; // @[DebugTransport.scala 145:27 DebugTransport.scala 146:13 DebugTransport.scala 98:24]
  wire  _T_1 = io_dmi_resp_ready & io_dmi_resp_valid; // @[Decoupled.scala 40:37]
  wire  busy = busyReg & ~io_dmi_resp_valid | stickyBusyReg; // @[DebugTransport.scala 157:42]
  wire  _downgradeOpReg_T = ~busy; // @[DebugTransport.scala 166:24]
  wire  nonzeroResp = dmiStatus_hi | io_dmi_resp_valid & io_dmi_resp_bits_resp != 2'h0; // @[DebugTransport.scala 180:39]
  wire  _GEN_4 = dmiAccessChain_io_capture_capture ? busy : stickyBusyReg; // @[DebugTransport.scala 165:44 DebugTransport.scala 167:19 DebugTransport.scala 99:30]
  wire  _GEN_5 = dmiAccessChain_io_capture_capture ? nonzeroResp : dmiStatus_hi; // @[DebugTransport.scala 165:44 DebugTransport.scala 168:26 DebugTransport.scala 100:37]
  wire [6:0] _dmiAccessChain_io_capture_bits_T_addr = io_dmi_resp_valid ? dmiReqReg_addr : 7'h0; // @[DebugTransport.scala 199:60]
  wire [31:0] _dmiAccessChain_io_capture_bits_T_data = io_dmi_resp_valid ? io_dmi_resp_bits_data : 32'h0; // @[DebugTransport.scala 199:60]
  wire [1:0] _dmiAccessChain_io_capture_bits_T_resp = io_dmi_resp_valid ? io_dmi_resp_bits_resp : 2'h0; // @[DebugTransport.scala 199:60]
  wire  _T_4 = io_dmi_req_ready & io_dmi_req_valid; // @[Decoupled.scala 40:37]
  wire  _GEN_14 = downgradeOpReg | dmiAccessChain_io_update_bits_op == 2'h0 ? 1'h0 : 1'h1; // @[DebugTransport.scala 210:97 DebugTransport.scala 218:24]
  wire  _GEN_19 = stickyBusyReg ? 1'h0 : _GEN_14; // @[DebugTransport.scala 208:26]
  wire  dmiReqValidCheck = dmiAccessChain_io_update_valid & _GEN_19; // @[DebugTransport.scala 207:41]
  wire  _GEN_13 = downgradeOpReg | dmiAccessChain_io_update_bits_op == 2'h0 ? dmiReqValidReg : 1'h1; // @[DebugTransport.scala 210:97 DebugTransport.scala 113:31 DebugTransport.scala 217:22]
  wire  _io_dmi_resp_ready_T = dmiReqReg_op == 2'h2; // @[DebugTransport.scala 227:18]
  wire  _io_dmi_resp_ready_T_2 = dmiAccessChain_io_capture_capture & _downgradeOpReg_T; // @[DebugTransport.scala 231:41]
  wire [31:0] tapIO_i = {io_jtag_version,io_jtag_part_number,io_jtag_mfr_id,1'h1}; // @[JtagTap.scala 187:45]
  wire [31:0] _GEN_1 = tapIO_i % 32'h2; // @[JtagTap.scala 188:18]
  wire [1:0] _tapIO_T = _GEN_1[1:0]; // @[JtagTap.scala 188:18]
  wire [11:0] _tapIO_T_8 = 12'h800 - 12'h1; // @[JtagTap.scala 189:41]
  wire [30:0] _GEN_59 = {{19'd0}, _tapIO_T_8}; // @[JtagTap.scala 189:26]
  wire [30:0] _tapIO_T_9 = tapIO_i[31:1] & _GEN_59; // @[JtagTap.scala 189:26]
  wire  tapIO_icodeSelects_0 = tapIO_controllerInternal_io_output_instruction == 5'h1; // @[JtagTap.scala 227:82]
  wire  tapIO_icodeSelects_0_1 = tapIO_controllerInternal_io_output_instruction == 5'h10; // @[JtagTap.scala 227:82]
  wire  tapIO_icodeSelects_0_2 = tapIO_controllerInternal_io_output_instruction == 5'h11; // @[JtagTap.scala 227:82]
  wire  _GEN_26 = tapIO_icodeSelects_0_2 ? dmiAccessChain_io_chainOut_update : tapIO_bypassChain_io_chainOut_update; // @[JtagTap.scala 237:28 JtagTap.scala 238:43 JtagTap.scala 244:41]
  wire  _GEN_27 = tapIO_icodeSelects_0_2 ? dmiAccessChain_io_chainOut_capture : tapIO_bypassChain_io_chainOut_capture; // @[JtagTap.scala 237:28 JtagTap.scala 238:43 JtagTap.scala 244:41]
  wire  _GEN_28 = tapIO_icodeSelects_0_2 ? dmiAccessChain_io_chainOut_data : tapIO_bypassChain_io_chainOut_data; // @[JtagTap.scala 237:28 JtagTap.scala 238:43 JtagTap.scala 244:41]
  wire  _GEN_29 = tapIO_icodeSelects_0_2 ? dmiAccessChain_io_chainOut_shift : tapIO_bypassChain_io_chainOut_shift; // @[JtagTap.scala 237:28 JtagTap.scala 238:43 JtagTap.scala 244:41]
  wire  _GEN_30 = tapIO_icodeSelects_0_1 ? dtmInfoChain_io_chainOut_update : _GEN_26; // @[JtagTap.scala 237:28 JtagTap.scala 238:43]
  wire  _GEN_31 = tapIO_icodeSelects_0_1 ? dtmInfoChain_io_chainOut_capture : _GEN_27; // @[JtagTap.scala 237:28 JtagTap.scala 238:43]
  wire  _GEN_32 = tapIO_icodeSelects_0_1 ? dtmInfoChain_io_chainOut_data : _GEN_28; // @[JtagTap.scala 237:28 JtagTap.scala 238:43]
  wire  _GEN_33 = tapIO_icodeSelects_0_1 ? dtmInfoChain_io_chainOut_shift : _GEN_29; // @[JtagTap.scala 237:28 JtagTap.scala 238:43]
  wire  tapIO_output_tapIsInTestLogicReset = tapIO_controllerInternal_io_output_tapIsInTestLogicReset; // @[JtagTap.scala 178:26 JtagTap.scala 260:23]
  CaptureUpdateChain dtmInfoChain ( // @[DebugTransport.scala 130:29]
    .clock(dtmInfoChain_clock),
    .reset(dtmInfoChain_reset),
    .io_chainIn_shift(dtmInfoChain_io_chainIn_shift),
    .io_chainIn_data(dtmInfoChain_io_chainIn_data),
    .io_chainIn_capture(dtmInfoChain_io_chainIn_capture),
    .io_chainIn_update(dtmInfoChain_io_chainIn_update),
    .io_chainOut_shift(dtmInfoChain_io_chainOut_shift),
    .io_chainOut_data(dtmInfoChain_io_chainOut_data),
    .io_chainOut_capture(dtmInfoChain_io_chainOut_capture),
    .io_chainOut_update(dtmInfoChain_io_chainOut_update),
    .io_capture_bits_reserved1(dtmInfoChain_io_capture_bits_reserved1),
    .io_capture_bits_dmireset(dtmInfoChain_io_capture_bits_dmireset),
    .io_capture_bits_reserved0(dtmInfoChain_io_capture_bits_reserved0),
    .io_capture_bits_dmiIdleCycles(dtmInfoChain_io_capture_bits_dmiIdleCycles),
    .io_capture_bits_dmiStatus(dtmInfoChain_io_capture_bits_dmiStatus),
    .io_capture_bits_debugAddrBits(dtmInfoChain_io_capture_bits_debugAddrBits),
    .io_capture_bits_debugVersion(dtmInfoChain_io_capture_bits_debugVersion),
    .io_capture_capture(dtmInfoChain_io_capture_capture),
    .io_update_valid(dtmInfoChain_io_update_valid),
    .io_update_bits_reserved1(dtmInfoChain_io_update_bits_reserved1),
    .io_update_bits_dmireset(dtmInfoChain_io_update_bits_dmireset),
    .io_update_bits_reserved0(dtmInfoChain_io_update_bits_reserved0),
    .io_update_bits_dmiIdleCycles(dtmInfoChain_io_update_bits_dmiIdleCycles),
    .io_update_bits_dmiStatus(dtmInfoChain_io_update_bits_dmiStatus),
    .io_update_bits_debugAddrBits(dtmInfoChain_io_update_bits_debugAddrBits),
    .io_update_bits_debugVersion(dtmInfoChain_io_update_bits_debugVersion)
  );
  CaptureUpdateChain_1 dmiAccessChain ( // @[DebugTransport.scala 136:31]
    .clock(dmiAccessChain_clock),
    .reset(dmiAccessChain_reset),
    .io_chainIn_shift(dmiAccessChain_io_chainIn_shift),
    .io_chainIn_data(dmiAccessChain_io_chainIn_data),
    .io_chainIn_capture(dmiAccessChain_io_chainIn_capture),
    .io_chainIn_update(dmiAccessChain_io_chainIn_update),
    .io_chainOut_shift(dmiAccessChain_io_chainOut_shift),
    .io_chainOut_data(dmiAccessChain_io_chainOut_data),
    .io_chainOut_capture(dmiAccessChain_io_chainOut_capture),
    .io_chainOut_update(dmiAccessChain_io_chainOut_update),
    .io_capture_bits_addr(dmiAccessChain_io_capture_bits_addr),
    .io_capture_bits_data(dmiAccessChain_io_capture_bits_data),
    .io_capture_bits_resp(dmiAccessChain_io_capture_bits_resp),
    .io_capture_capture(dmiAccessChain_io_capture_capture),
    .io_update_valid(dmiAccessChain_io_update_valid),
    .io_update_bits_addr(dmiAccessChain_io_update_bits_addr),
    .io_update_bits_data(dmiAccessChain_io_update_bits_data),
    .io_update_bits_op(dmiAccessChain_io_update_bits_op)
  );
  CaptureChain tapIO_idcodeChain ( // @[JtagTap.scala 185:33]
    .clock(tapIO_idcodeChain_clock),
    .reset(tapIO_idcodeChain_reset),
    .io_chainIn_shift(tapIO_idcodeChain_io_chainIn_shift),
    .io_chainIn_data(tapIO_idcodeChain_io_chainIn_data),
    .io_chainIn_capture(tapIO_idcodeChain_io_chainIn_capture),
    .io_chainIn_update(tapIO_idcodeChain_io_chainIn_update),
    .io_chainOut_shift(tapIO_idcodeChain_io_chainOut_shift),
    .io_chainOut_data(tapIO_idcodeChain_io_chainOut_data),
    .io_chainOut_capture(tapIO_idcodeChain_io_chainOut_capture),
    .io_chainOut_update(tapIO_idcodeChain_io_chainOut_update),
    .io_capture_bits_version(tapIO_idcodeChain_io_capture_bits_version),
    .io_capture_bits_partNumber(tapIO_idcodeChain_io_capture_bits_partNumber),
    .io_capture_bits_mfrId(tapIO_idcodeChain_io_capture_bits_mfrId),
    .io_capture_bits_always1(tapIO_idcodeChain_io_capture_bits_always1),
    .io_capture_capture(tapIO_idcodeChain_io_capture_capture)
  );
  JtagTapController tapIO_controllerInternal ( // @[JtagTap.scala 203:36]
    .clock(tapIO_controllerInternal_clock),
    .reset(tapIO_controllerInternal_reset),
    .io_jtag_TCK(tapIO_controllerInternal_io_jtag_TCK),
    .io_jtag_TMS(tapIO_controllerInternal_io_jtag_TMS),
    .io_jtag_TDI(tapIO_controllerInternal_io_jtag_TDI),
    .io_jtag_TDO_data(tapIO_controllerInternal_io_jtag_TDO_data),
    .io_jtag_TDO_driven(tapIO_controllerInternal_io_jtag_TDO_driven),
    .io_control_jtag_reset(tapIO_controllerInternal_io_control_jtag_reset),
    .io_output_state(tapIO_controllerInternal_io_output_state),
    .io_output_instruction(tapIO_controllerInternal_io_output_instruction),
    .io_output_tapIsInTestLogicReset(tapIO_controllerInternal_io_output_tapIsInTestLogicReset),
    .io_dataChainOut_shift(tapIO_controllerInternal_io_dataChainOut_shift),
    .io_dataChainOut_data(tapIO_controllerInternal_io_dataChainOut_data),
    .io_dataChainOut_capture(tapIO_controllerInternal_io_dataChainOut_capture),
    .io_dataChainOut_update(tapIO_controllerInternal_io_dataChainOut_update),
    .io_dataChainIn_shift(tapIO_controllerInternal_io_dataChainIn_shift),
    .io_dataChainIn_data(tapIO_controllerInternal_io_dataChainIn_data),
    .io_dataChainIn_capture(tapIO_controllerInternal_io_dataChainIn_capture),
    .io_dataChainIn_update(tapIO_controllerInternal_io_dataChainIn_update)
  );
  JtagBypassChain tapIO_bypassChain ( // @[JtagTap.scala 211:29]
    .clock(tapIO_bypassChain_clock),
    .reset(tapIO_bypassChain_reset),
    .io_chainIn_shift(tapIO_bypassChain_io_chainIn_shift),
    .io_chainIn_data(tapIO_bypassChain_io_chainIn_data),
    .io_chainIn_capture(tapIO_bypassChain_io_chainIn_capture),
    .io_chainIn_update(tapIO_bypassChain_io_chainIn_update),
    .io_chainOut_shift(tapIO_bypassChain_io_chainOut_shift),
    .io_chainOut_data(tapIO_bypassChain_io_chainOut_data),
    .io_chainOut_capture(tapIO_bypassChain_io_chainOut_capture),
    .io_chainOut_update(tapIO_bypassChain_io_chainOut_update)
  );
  assign io_dmi_req_valid = dmiReqValidReg; // @[DebugTransport.scala 243:20]
  assign io_dmi_req_bits_addr = dmiReqReg_addr; // @[DebugTransport.scala 246:19]
  assign io_dmi_req_bits_data = dmiReqReg_data; // @[DebugTransport.scala 246:19]
  assign io_dmi_req_bits_op = dmiReqReg_op; // @[DebugTransport.scala 246:19]
  assign io_dmi_resp_ready = _io_dmi_resp_ready_T ? io_dmi_resp_valid : _io_dmi_resp_ready_T_2; // @[DebugTransport.scala 226:27]
  assign io_jtag_TDO_data = tapIO_controllerInternal_io_jtag_TDO_data; // @[JtagTap.scala 178:26 JtagTap.scala 258:21]
  assign io_jtag_TDO_driven = tapIO_controllerInternal_io_jtag_TDO_driven; // @[JtagTap.scala 178:26 JtagTap.scala 258:21]
  assign dtmInfoChain_clock = io_jtag_clock;
  assign dtmInfoChain_reset = io_jtag_reset; // @[DebugTransport.scala 91:50]
  assign dtmInfoChain_io_chainIn_shift = tapIO_icodeSelects_0_1 & tapIO_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign dtmInfoChain_io_chainIn_data = tapIO_icodeSelects_0_1 & tapIO_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign dtmInfoChain_io_chainIn_capture = tapIO_icodeSelects_0_1 & tapIO_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign dtmInfoChain_io_chainIn_update = tapIO_icodeSelects_0_1 & tapIO_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign dtmInfoChain_io_capture_bits_reserved1 = 15'h0; // @[DebugTransport.scala 96:21 DebugTransport.scala 128:25]
  assign dtmInfoChain_io_capture_bits_dmireset = 1'h0; // @[DebugTransport.scala 96:21 DebugTransport.scala 127:25]
  assign dtmInfoChain_io_capture_bits_reserved0 = 1'h0; // @[DebugTransport.scala 96:21 DebugTransport.scala 126:25]
  assign dtmInfoChain_io_capture_bits_dmiIdleCycles = 3'h5; // @[DebugTransport.scala 96:21 DebugTransport.scala 125:25]
  assign dtmInfoChain_io_capture_bits_dmiStatus = {dmiStatus_hi,dmiStatus_lo}; // @[Cat.scala 30:58]
  assign dtmInfoChain_io_capture_bits_debugAddrBits = 6'h7; // @[DebugTransport.scala 96:21 DebugTransport.scala 123:25]
  assign dtmInfoChain_io_capture_bits_debugVersion = 4'h1; // @[DebugTransport.scala 96:21 DebugTransport.scala 122:25]
  assign dmiAccessChain_clock = io_jtag_clock;
  assign dmiAccessChain_reset = io_jtag_reset; // @[DebugTransport.scala 91:50]
  assign dmiAccessChain_io_chainIn_shift = tapIO_icodeSelects_0_2 & tapIO_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign dmiAccessChain_io_chainIn_data = tapIO_icodeSelects_0_2 & tapIO_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign dmiAccessChain_io_chainIn_capture = tapIO_icodeSelects_0_2 & tapIO_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign dmiAccessChain_io_chainIn_update = tapIO_icodeSelects_0_2 & tapIO_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign dmiAccessChain_io_capture_bits_addr = busy ? 7'h0 : _dmiAccessChain_io_capture_bits_T_addr; // @[DebugTransport.scala 199:40]
  assign dmiAccessChain_io_capture_bits_data = busy ? 32'h0 : _dmiAccessChain_io_capture_bits_T_data; // @[DebugTransport.scala 199:40]
  assign dmiAccessChain_io_capture_bits_resp = busy ? 2'h3 : _dmiAccessChain_io_capture_bits_T_resp; // @[DebugTransport.scala 199:40]
  assign tapIO_idcodeChain_clock = io_jtag_clock;
  assign tapIO_idcodeChain_reset = io_jtag_reset; // @[DebugTransport.scala 91:50]
  assign tapIO_idcodeChain_io_chainIn_shift = tapIO_icodeSelects_0 & tapIO_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign tapIO_idcodeChain_io_chainIn_data = tapIO_icodeSelects_0 & tapIO_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign tapIO_idcodeChain_io_chainIn_capture = tapIO_icodeSelects_0 & tapIO_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign tapIO_idcodeChain_io_chainIn_update = tapIO_icodeSelects_0 & tapIO_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 249:21 JtagTap.scala 250:26 JtagTap.scala 252:26]
  assign tapIO_idcodeChain_io_capture_bits_version = io_jtag_version; // @[JtagTap.scala 178:26 DebugTransport.scala 263:20]
  assign tapIO_idcodeChain_io_capture_bits_partNumber = io_jtag_part_number; // @[JtagTap.scala 178:26 DebugTransport.scala 263:20]
  assign tapIO_idcodeChain_io_capture_bits_mfrId = io_jtag_mfr_id; // @[JtagTap.scala 178:26 DebugTransport.scala 263:20]
  assign tapIO_idcodeChain_io_capture_bits_always1 = 1'h1; // @[JtagTap.scala 178:26 DebugTransport.scala 263:20]
  assign tapIO_controllerInternal_clock = io_jtag_clock;
  assign tapIO_controllerInternal_reset = io_jtag_reset; // @[DebugTransport.scala 91:50]
  assign tapIO_controllerInternal_io_jtag_TCK = io_jtag_TCK; // @[JtagTap.scala 178:26 DebugTransport.scala 264:14]
  assign tapIO_controllerInternal_io_jtag_TMS = io_jtag_TMS; // @[JtagTap.scala 178:26 DebugTransport.scala 264:14]
  assign tapIO_controllerInternal_io_jtag_TDI = io_jtag_TDI; // @[JtagTap.scala 178:26 DebugTransport.scala 264:14]
  assign tapIO_controllerInternal_io_control_jtag_reset = io_jtag_reset; // @[DebugTransport.scala 266:45]
  assign tapIO_controllerInternal_io_dataChainIn_shift = tapIO_icodeSelects_0 ? tapIO_idcodeChain_io_chainOut_shift :
    _GEN_33; // @[JtagTap.scala 237:28 JtagTap.scala 238:43]
  assign tapIO_controllerInternal_io_dataChainIn_data = tapIO_icodeSelects_0 ? tapIO_idcodeChain_io_chainOut_data :
    _GEN_32; // @[JtagTap.scala 237:28 JtagTap.scala 238:43]
  assign tapIO_controllerInternal_io_dataChainIn_capture = tapIO_icodeSelects_0 ? tapIO_idcodeChain_io_chainOut_capture
     : _GEN_31; // @[JtagTap.scala 237:28 JtagTap.scala 238:43]
  assign tapIO_controllerInternal_io_dataChainIn_update = tapIO_icodeSelects_0 ? tapIO_idcodeChain_io_chainOut_update :
    _GEN_30; // @[JtagTap.scala 237:28 JtagTap.scala 238:43]
  assign tapIO_bypassChain_clock = io_jtag_clock;
  assign tapIO_bypassChain_reset = io_jtag_reset; // @[DebugTransport.scala 91:50]
  assign tapIO_bypassChain_io_chainIn_shift = tapIO_controllerInternal_io_dataChainOut_shift; // @[JtagTap.scala 214:28]
  assign tapIO_bypassChain_io_chainIn_data = tapIO_controllerInternal_io_dataChainOut_data; // @[JtagTap.scala 214:28]
  assign tapIO_bypassChain_io_chainIn_capture = tapIO_controllerInternal_io_dataChainOut_capture; // @[JtagTap.scala 214:28]
  assign tapIO_bypassChain_io_chainIn_update = tapIO_controllerInternal_io_dataChainOut_update; // @[JtagTap.scala 214:28]
  always @(posedge io_jtag_clock) begin
    if (dmiAccessChain_io_update_valid) begin // @[DebugTransport.scala 207:41]
      if (!(stickyBusyReg)) begin // @[DebugTransport.scala 208:26]
        if (downgradeOpReg | dmiAccessChain_io_update_bits_op == 2'h0) begin // @[DebugTransport.scala 210:97]
          dmiReqReg_addr <= 7'h0; // @[DebugTransport.scala 212:22]
        end else begin
          dmiReqReg_addr <= dmiAccessChain_io_update_bits_addr; // @[DebugTransport.scala 216:17]
        end
      end
    end
    if (dmiAccessChain_io_update_valid) begin // @[DebugTransport.scala 207:41]
      if (!(stickyBusyReg)) begin // @[DebugTransport.scala 208:26]
        if (downgradeOpReg | dmiAccessChain_io_update_bits_op == 2'h0) begin // @[DebugTransport.scala 210:97]
          dmiReqReg_data <= 32'h0; // @[DebugTransport.scala 213:22]
        end else begin
          dmiReqReg_data <= dmiAccessChain_io_update_bits_data; // @[DebugTransport.scala 216:17]
        end
      end
    end
    if (dmiAccessChain_io_update_valid) begin // @[DebugTransport.scala 207:41]
      if (!(stickyBusyReg)) begin // @[DebugTransport.scala 208:26]
        if (downgradeOpReg | dmiAccessChain_io_update_bits_op == 2'h0) begin // @[DebugTransport.scala 210:97]
          dmiReqReg_op <= 2'h0; // @[DebugTransport.scala 214:22]
        end else begin
          dmiReqReg_op <= dmiAccessChain_io_update_bits_op; // @[DebugTransport.scala 216:17]
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(dmiReqValidCheck & _T_4) | io_jtag_reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: Conflicting updates for dmiReqValidReg, should not happen.\n    at DebugTransport.scala:205 assert(!(dmiReqValidCheck && io.dmi.req.fire()), \"Conflicting updates for dmiReqValidReg, should not happen.\");\n"
            ); // @[DebugTransport.scala 205:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(dmiReqValidCheck & _T_4) | io_jtag_reset)) begin
          $fatal; // @[DebugTransport.scala 205:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_tapIO_T == 2'h1 | io_jtag_reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: LSB must be set in IDCODE, see 12.1.1d\n    at JtagTap.scala:188 assert(i %% 2.U === 1.U, \"LSB must be set in IDCODE, see 12.1.1d\")\n"
            ); // @[JtagTap.scala 188:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_tapIO_T == 2'h1 | io_jtag_reset)) begin
          $fatal; // @[JtagTap.scala 188:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_tapIO_T_9 != 31'h7f | io_jtag_reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: IDCODE must not have 0b00001111111 as manufacturer identity, see 12.2.1b\n    at JtagTap.scala:189 assert(((i >> 1) & ((1.U << 11) - 1.U)) =/= JtagIdcode.dummyMfrId.U,\n"
            ); // @[JtagTap.scala 189:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_tapIO_T_9 != 31'h7f | io_jtag_reset)) begin
          $fatal; // @[JtagTap.scala 189:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge io_jtag_clock or posedge io_jtag_reset) begin
    if (io_jtag_reset) begin
      busyReg <= 1'h0;
    end else if (tapIO_output_tapIsInTestLogicReset) begin
      busyReg <= 1'h0;
    end else if (_T_1) begin
      busyReg <= 1'h0;
    end else begin
      busyReg <= _GEN_0;
    end
  end
  always @(posedge io_jtag_clock or posedge io_jtag_reset) begin
    if (io_jtag_reset) begin
      stickyBusyReg <= 1'h0;
    end else if (tapIO_output_tapIsInTestLogicReset) begin
      stickyBusyReg <= 1'h0;
    end else if (dtmInfoChain_io_update_valid) begin
      if (dtmInfoChain_io_update_bits_dmireset) begin
        stickyBusyReg <= 1'h0;
      end else begin
        stickyBusyReg <= _GEN_4;
      end
    end else begin
      stickyBusyReg <= _GEN_4;
    end
  end
  always @(posedge io_jtag_clock or posedge io_jtag_reset) begin
    if (io_jtag_reset) begin
      dmiStatus_hi <= 1'h0;
    end else if (tapIO_output_tapIsInTestLogicReset) begin
      dmiStatus_hi <= 1'h0;
    end else if (dtmInfoChain_io_update_valid) begin
      if (dtmInfoChain_io_update_bits_dmireset) begin
        dmiStatus_hi <= 1'h0;
      end else begin
        dmiStatus_hi <= _GEN_5;
      end
    end else begin
      dmiStatus_hi <= _GEN_5;
    end
  end
  always @(posedge io_jtag_clock or posedge io_jtag_reset) begin
    if (io_jtag_reset) begin
      downgradeOpReg <= 1'h0;
    end else if (tapIO_output_tapIsInTestLogicReset) begin
      downgradeOpReg <= 1'h0;
    end else if (dmiAccessChain_io_capture_capture) begin
      downgradeOpReg <= ~busy & nonzeroResp;
    end else if (dmiAccessChain_io_update_valid) begin
      downgradeOpReg <= 1'h0;
    end
  end
  always @(posedge io_jtag_clock or posedge io_jtag_reset) begin
    if (io_jtag_reset) begin
      dmiReqValidReg <= 1'h0;
    end else if (tapIO_output_tapIsInTestLogicReset) begin
      dmiReqValidReg <= 1'h0;
    end else if (_T_4) begin
      dmiReqValidReg <= 1'h0;
    end else if (dmiAccessChain_io_update_valid) begin
      if (!(stickyBusyReg)) begin
        dmiReqValidReg <= _GEN_13;
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
  busyReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  stickyBusyReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  dmiStatus_hi = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  downgradeOpReg = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  dmiReqReg_addr = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  dmiReqReg_data = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  dmiReqReg_op = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  dmiReqValidReg = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  if (io_jtag_reset) begin
    busyReg = 1'h0;
  end
  if (io_jtag_reset) begin
    stickyBusyReg = 1'h0;
  end
  if (io_jtag_reset) begin
    dmiStatus_hi = 1'h0;
  end
  if (io_jtag_reset) begin
    downgradeOpReg = 1'h0;
  end
  if (io_jtag_reset) begin
    dmiReqValidReg = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
