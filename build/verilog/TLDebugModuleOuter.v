module TLDebugModuleOuter(
  input         clock,
  input         reset,
  output        auto_dmi_in_a_ready,
  input         auto_dmi_in_a_valid,
  input  [2:0]  auto_dmi_in_a_bits_opcode,
  input  [2:0]  auto_dmi_in_a_bits_param,
  input  [1:0]  auto_dmi_in_a_bits_size,
  input         auto_dmi_in_a_bits_source,
  input  [6:0]  auto_dmi_in_a_bits_address,
  input  [3:0]  auto_dmi_in_a_bits_mask,
  input  [31:0] auto_dmi_in_a_bits_data,
  input         auto_dmi_in_a_bits_corrupt,
  input         auto_dmi_in_d_ready,
  output        auto_dmi_in_d_valid,
  output [2:0]  auto_dmi_in_d_bits_opcode,
  output [1:0]  auto_dmi_in_d_bits_param,
  output [1:0]  auto_dmi_in_d_bits_size,
  output        auto_dmi_in_d_bits_source,
  output        auto_dmi_in_d_bits_sink,
  output        auto_dmi_in_d_bits_denied,
  output [31:0] auto_dmi_in_d_bits_data,
  output        auto_dmi_in_d_bits_corrupt,
  output        auto_int_out_0,
  input         io_ctrl_debugUnavail_0,
  output        io_ctrl_ndreset,
  output        io_ctrl_dmactive,
  input         io_ctrl_dmactiveAck,
  input         io_innerCtrl_ready,
  output        io_innerCtrl_valid,
  output        io_innerCtrl_bits_resumereq,
  output [9:0]  io_innerCtrl_bits_hartsel,
  output        io_innerCtrl_bits_ackhavereset,
  output        io_innerCtrl_bits_hasel,
  output        io_innerCtrl_bits_hamask_0,
  output        io_innerCtrl_bits_hrmask_0,
  input         io_hgDebugInt_0
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
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [6:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_a_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_d_bits_data; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  reg  DMCONTROLReg_haltreq; // @[Debug.scala 336:31]
  reg  DMCONTROLReg_ndmreset; // @[Debug.scala 336:31]
  reg  DMCONTROLReg_dmactive; // @[Debug.scala 336:31]
  wire  _T_1 = ~DMCONTROLReg_dmactive; // @[Debug.scala 354:11]
  wire  in_bits_read = auto_dmi_in_a_bits_opcode == 3'h4; // @[RegisterRouter.scala 68:36]
  wire [2:0] in_bits_index = auto_dmi_in_a_bits_address[4:2]; // @[RegisterRouter.scala 67:18 RegisterRouter.scala 69:19]
  wire  out_iindex = in_bits_index[1]; // @[RegisterRouter.scala 79:24]
  wire [2:0] out_findex = in_bits_index & 3'h5; // @[RegisterRouter.scala 79:24]
  wire  _out_T = out_findex == 3'h0; // @[RegisterRouter.scala 79:24]
  wire [1:0] _out_backSel_T = 2'h1 << out_iindex; // @[OneHot.scala 58:35]
  wire  out_backSel_0 = _out_backSel_T[0]; // @[RegisterRouter.scala 79:24]
  wire  out_woready_6 = auto_dmi_in_a_valid & auto_dmi_in_d_ready & ~in_bits_read & out_backSel_0 & out_findex == 3'h0; // @[RegisterRouter.scala 79:24]
  wire [7:0] out_backMask_hi_hi = auto_dmi_in_a_bits_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_hi_lo = auto_dmi_in_a_bits_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_lo_hi = auto_dmi_in_a_bits_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] out_backMask_lo_lo = auto_dmi_in_a_bits_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [31:0] out_backMask = {out_backMask_hi_hi,out_backMask_hi_lo,out_backMask_lo_hi,out_backMask_lo_lo}; // @[Cat.scala 30:58]
  wire  out_womask_6 = &out_backMask[1]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_6 = out_woready_6 & out_womask_6; // @[RegisterRouter.scala 79:24]
  wire  DMCONTROLWrData_ndmreset = auto_dmi_in_a_bits_data[1]; // @[RegisterRouter.scala 79:24]
  wire  out_womask_17 = &out_backMask[31]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_17 = out_woready_6 & out_womask_17; // @[RegisterRouter.scala 79:24]
  wire  DMCONTROLWrData_haltreq = auto_dmi_in_a_bits_data[31]; // @[RegisterRouter.scala 79:24]
  wire  out_womask_5 = &out_backMask[0]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_5 = out_woready_6 & out_womask_5; // @[RegisterRouter.scala 79:24]
  wire  DMCONTROLWrData_dmactive = auto_dmi_in_a_bits_data[0]; // @[RegisterRouter.scala 79:24]
  reg  hrmaskReg_0; // @[Debug.scala 471:28]
  wire  out_womask_7 = &out_backMask[2]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_7 = out_woready_6 & out_womask_7; // @[RegisterRouter.scala 79:24]
  wire  DMCONTROLWrData_clrresethaltreq = auto_dmi_in_a_bits_data[2]; // @[RegisterRouter.scala 79:24]
  wire  _T_11 = io_innerCtrl_bits_hartsel == 10'h0; // @[Debug.scala 400:35]
  wire  out_womask_8 = &out_backMask[3]; // @[RegisterRouter.scala 79:24]
  wire  out_f_woready_8 = out_woready_6 & out_womask_8; // @[RegisterRouter.scala 79:24]
  wire  DMCONTROLWrData_setresethaltreq = auto_dmi_in_a_bits_data[3]; // @[RegisterRouter.scala 79:24]
  wire  _GEN_23 = out_f_woready_8 & DMCONTROLWrData_setresethaltreq & _T_11 | hrmaskReg_0; // @[Debug.scala 479:102 Debug.scala 480:30 Debug.scala 473:15]
  wire  _GEN_24 = out_f_woready_7 & DMCONTROLWrData_clrresethaltreq & _T_11 ? 1'h0 : _GEN_23; // @[Debug.scala 477:102 Debug.scala 478:30]
  wire  out_prepend_lo_4 = DMCONTROLReg_dmactive & io_ctrl_dmactiveAck; // @[Debug.scala 487:43]
  wire [4:0] out_prepend_7 = {1'h0,1'h0,1'h0,DMCONTROLReg_ndmreset,out_prepend_lo_4}; // @[Cat.scala 30:58]
  wire [15:0] out_prepend_lo_8 = {{11'd0}, out_prepend_7}; // @[RegisterRouter.scala 79:24]
  wire [17:0] out_prepend_9 = {1'h0,1'h0,out_prepend_lo_8}; // @[Cat.scala 30:58]
  wire [25:0] out_prepend_lo_10 = {{8'd0}, out_prepend_9}; // @[RegisterRouter.scala 79:24]
  wire  out_wimask_14 = &out_backMask[28]; // @[RegisterRouter.scala 79:24]
  wire  out_f_wivalid_14 = out_woready_6 & out_wimask_14; // @[RegisterRouter.scala 79:24]
  wire  DMCONTROLWrData_ackhavereset = auto_dmi_in_a_bits_data[28]; // @[RegisterRouter.scala 79:24]
  wire  out_wimask_16 = &out_backMask[30]; // @[RegisterRouter.scala 79:24]
  wire  out_f_wivalid_16 = out_woready_6 & out_wimask_16; // @[RegisterRouter.scala 79:24]
  wire  DMCONTROLWrData_resumereq = auto_dmi_in_a_bits_data[30]; // @[RegisterRouter.scala 79:24]
  wire [31:0] out_prepend_15 = {DMCONTROLReg_haltreq,1'h0,1'h0,1'h0,1'h0,1'h0,out_prepend_lo_10}; // @[Cat.scala 30:58]
  wire  _GEN_35 = out_iindex ? _out_T : _out_T; // @[MuxLiteral.scala 48:10 MuxLiteral.scala 48:10]
  wire [31:0] _GEN_37 = out_iindex ? 32'h112380 : out_prepend_15; // @[MuxLiteral.scala 48:10 MuxLiteral.scala 48:10]
  reg  debugIntRegs_0; // @[Debug.scala 552:31]
  reg  innerCtrlValidReg; // @[Debug.scala 583:36]
  reg  innerCtrlResumeReqReg; // @[Debug.scala 584:40]
  reg  innerCtrlAckHaveResetReg; // @[Debug.scala 585:43]
  wire  innerCtrlValid = out_f_wivalid_16 | out_f_wivalid_14 | out_f_woready_8 | out_f_woready_7; // @[Debug.scala 587:94]
  wire  _innerCtrlValidReg_T = ~io_innerCtrl_ready; // @[Debug.scala 590:54]
  TLMonitor_42 monitor ( // @[Nodes.scala 24:25]
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
  assign auto_dmi_in_a_ready = auto_dmi_in_d_ready; // @[RegisterRouter.scala 79:24]
  assign auto_dmi_in_d_valid = auto_dmi_in_a_valid; // @[RegisterRouter.scala 79:24]
  assign auto_dmi_in_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 94:19]
  assign auto_dmi_in_d_bits_param = 2'h0; // @[Edges.scala 755:17 Edges.scala 757:15]
  assign auto_dmi_in_d_bits_size = auto_dmi_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_dmi_in_d_bits_source = auto_dmi_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_dmi_in_d_bits_sink = 1'h0; // @[Edges.scala 755:17 Edges.scala 760:15]
  assign auto_dmi_in_d_bits_denied = 1'h0; // @[Edges.scala 755:17 Edges.scala 761:15]
  assign auto_dmi_in_d_bits_data = _GEN_35 ? _GEN_37 : 32'h0; // @[RegisterRouter.scala 79:24]
  assign auto_dmi_in_d_bits_corrupt = 1'h0; // @[Edges.scala 755:17 Edges.scala 763:15]
  assign auto_int_out_0 = debugIntRegs_0 | io_hgDebugInt_0; // @[Debug.scala 558:60]
  assign io_ctrl_ndreset = DMCONTROLReg_ndmreset; // @[Debug.scala 604:21]
  assign io_ctrl_dmactive = DMCONTROLReg_dmactive; // @[Debug.scala 605:22]
  assign io_innerCtrl_valid = innerCtrlValid | innerCtrlValidReg; // @[Debug.scala 594:54]
  assign io_innerCtrl_bits_resumereq = out_f_wivalid_16 & DMCONTROLWrData_resumereq | innerCtrlResumeReqReg; // @[Debug.scala 596:83]
  assign io_innerCtrl_bits_hartsel = 10'h0; // @[Debug.scala 595:42]
  assign io_innerCtrl_bits_ackhavereset = out_f_wivalid_14 & DMCONTROLWrData_ackhavereset | innerCtrlAckHaveResetReg; // @[Debug.scala 597:89]
  assign io_innerCtrl_bits_hasel = 1'h0;
  assign io_innerCtrl_bits_hamask_0 = 1'h0;
  assign io_innerCtrl_bits_hrmask_0 = _T_1 ? 1'h0 : _GEN_24; // @[Debug.scala 475:44 Debug.scala 476:30]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_dmi_in_d_ready; // @[RegisterRouter.scala 79:24]
  assign monitor_io_in_a_valid = auto_dmi_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_dmi_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_dmi_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_dmi_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_dmi_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_dmi_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_dmi_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_data = auto_dmi_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_dmi_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_dmi_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = auto_dmi_in_a_valid; // @[RegisterRouter.scala 79:24]
  assign monitor_io_in_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 94:19]
  assign monitor_io_in_d_bits_param = 2'h0; // @[Edges.scala 755:17 Edges.scala 757:15]
  assign monitor_io_in_d_bits_size = auto_dmi_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_bits_source = auto_dmi_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_bits_sink = 1'h0; // @[Edges.scala 755:17 Edges.scala 760:15]
  assign monitor_io_in_d_bits_denied = 1'h0; // @[Edges.scala 755:17 Edges.scala 761:15]
  assign monitor_io_in_d_bits_data = _GEN_35 ? _GEN_37 : 32'h0; // @[RegisterRouter.scala 79:24]
  assign monitor_io_in_d_bits_corrupt = 1'h0; // @[Edges.scala 755:17 Edges.scala 763:15]
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      DMCONTROLReg_haltreq <= 1'h0;
    end else if (~DMCONTROLReg_dmactive) begin
      DMCONTROLReg_haltreq <= 1'h0;
    end else if (out_f_woready_17) begin
      DMCONTROLReg_haltreq <= DMCONTROLWrData_haltreq;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      DMCONTROLReg_ndmreset <= 1'h0;
    end else if (~DMCONTROLReg_dmactive) begin
      DMCONTROLReg_ndmreset <= 1'h0;
    end else if (out_f_woready_6) begin
      DMCONTROLReg_ndmreset <= DMCONTROLWrData_ndmreset;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      DMCONTROLReg_dmactive <= 1'h0;
    end else if (out_f_woready_5) begin
      DMCONTROLReg_dmactive <= DMCONTROLWrData_dmactive;
    end else if (~DMCONTROLReg_dmactive) begin
      DMCONTROLReg_dmactive <= 1'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      hrmaskReg_0 <= 1'h0;
    end else if (_T_1) begin
      hrmaskReg_0 <= 1'h0;
    end else if (out_f_woready_7 & DMCONTROLWrData_clrresethaltreq & _T_11) begin
      hrmaskReg_0 <= 1'h0;
    end else begin
      hrmaskReg_0 <= _GEN_23;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      debugIntRegs_0 <= 1'h0;
    end else if (_T_1) begin
      debugIntRegs_0 <= 1'h0;
    end else if (out_f_woready_17) begin
      debugIntRegs_0 <= DMCONTROLWrData_haltreq;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      innerCtrlValidReg <= 1'h0;
    end else begin
      innerCtrlValidReg <= io_innerCtrl_valid & ~io_innerCtrl_ready;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      innerCtrlResumeReqReg <= 1'h0;
    end else begin
      innerCtrlResumeReqReg <= io_innerCtrl_bits_resumereq & _innerCtrlValidReg_T;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      innerCtrlAckHaveResetReg <= 1'h0;
    end else begin
      innerCtrlAckHaveResetReg <= io_innerCtrl_bits_ackhavereset & _innerCtrlValidReg_T;
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
  DMCONTROLReg_haltreq = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  DMCONTROLReg_ndmreset = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  DMCONTROLReg_dmactive = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  hrmaskReg_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  debugIntRegs_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  innerCtrlValidReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  innerCtrlResumeReqReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  innerCtrlAckHaveResetReg = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    DMCONTROLReg_haltreq = 1'h0;
  end
  if (reset) begin
    DMCONTROLReg_ndmreset = 1'h0;
  end
  if (reset) begin
    DMCONTROLReg_dmactive = 1'h0;
  end
  if (reset) begin
    hrmaskReg_0 = 1'h0;
  end
  if (reset) begin
    debugIntRegs_0 = 1'h0;
  end
  if (reset) begin
    innerCtrlValidReg = 1'h0;
  end
  if (reset) begin
    innerCtrlResumeReqReg = 1'h0;
  end
  if (reset) begin
    innerCtrlAckHaveResetReg = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
