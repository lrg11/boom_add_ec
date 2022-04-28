module JtagTapController(
  input        clock,
  input        reset,
  input        io_jtag_TCK,
  input        io_jtag_TMS,
  input        io_jtag_TDI,
  output       io_jtag_TDO_data,
  output       io_jtag_TDO_driven,
  input        io_control_jtag_reset,
  output [3:0] io_output_state,
  output [4:0] io_output_instruction,
  output       io_output_tapIsInTestLogicReset,
  output       io_dataChainOut_shift,
  output       io_dataChainOut_data,
  output       io_dataChainOut_capture,
  output       io_dataChainOut_update,
  input        io_dataChainIn_shift,
  input        io_dataChainIn_data,
  input        io_dataChainIn_capture,
  input        io_dataChainIn_update
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  stateMachine_clock; // @[JtagTap.scala 86:30]
  wire  stateMachine_reset; // @[JtagTap.scala 86:30]
  wire  stateMachine_io_tms; // @[JtagTap.scala 86:30]
  wire [3:0] stateMachine_io_currState; // @[JtagTap.scala 86:30]
  wire  irChain_clock; // @[JtagTap.scala 106:23]
  wire  irChain_reset; // @[JtagTap.scala 106:23]
  wire  irChain_io_chainIn_shift; // @[JtagTap.scala 106:23]
  wire  irChain_io_chainIn_data; // @[JtagTap.scala 106:23]
  wire  irChain_io_chainIn_capture; // @[JtagTap.scala 106:23]
  wire  irChain_io_chainIn_update; // @[JtagTap.scala 106:23]
  wire  irChain_io_chainOut_shift; // @[JtagTap.scala 106:23]
  wire  irChain_io_chainOut_data; // @[JtagTap.scala 106:23]
  wire  irChain_io_chainOut_capture; // @[JtagTap.scala 106:23]
  wire  irChain_io_chainOut_update; // @[JtagTap.scala 106:23]
  wire [4:0] irChain_io_capture_bits; // @[JtagTap.scala 106:23]
  wire  irChain_io_capture_capture; // @[JtagTap.scala 106:23]
  wire  irChain_io_update_valid; // @[JtagTap.scala 106:23]
  wire [4:0] irChain_io_update_bits; // @[JtagTap.scala 106:23]
  wire  clock_falling = ~clock; // @[JtagTap.scala 71:48]
  reg  tdoReg; // @[JtagTap.scala 93:30]
  reg  tdoeReg; // @[JtagTap.scala 94:30]
  wire [3:0] currState = stateMachine_io_currState; // @[JtagTap.scala 79:23 JtagTap.scala 89:15]
  wire  _irChain_io_chainIn_shift_T = currState == 4'ha; // @[JtagTap.scala 108:41]
  wire  _irChain_io_chainIn_update_T = currState == 4'hd; // @[JtagTap.scala 111:42]
  reg [4:0] activeInstruction; // @[JtagTap.scala 115:36]
  wire  tapIsInTestLogicReset = currState == 4'hf; // @[JtagTap.scala 124:38]
  wire  _io_dataChainOut_shift_T = currState == 4'h2; // @[JtagTap.scala 130:38]
  wire  _GEN_2 = irChain_io_chainOut_data; // @[JtagTap.scala 141:51 JtagTap.scala 142:9]
  JtagStateMachine stateMachine ( // @[JtagTap.scala 86:30]
    .clock(stateMachine_clock),
    .reset(stateMachine_reset),
    .io_tms(stateMachine_io_tms),
    .io_currState(stateMachine_io_currState)
  );
  CaptureUpdateChain_2 irChain ( // @[JtagTap.scala 106:23]
    .clock(irChain_clock),
    .reset(irChain_reset),
    .io_chainIn_shift(irChain_io_chainIn_shift),
    .io_chainIn_data(irChain_io_chainIn_data),
    .io_chainIn_capture(irChain_io_chainIn_capture),
    .io_chainIn_update(irChain_io_chainIn_update),
    .io_chainOut_shift(irChain_io_chainOut_shift),
    .io_chainOut_data(irChain_io_chainOut_data),
    .io_chainOut_capture(irChain_io_chainOut_capture),
    .io_chainOut_update(irChain_io_chainOut_update),
    .io_capture_bits(irChain_io_capture_bits),
    .io_capture_capture(irChain_io_capture_capture),
    .io_update_valid(irChain_io_update_valid),
    .io_update_bits(irChain_io_update_bits)
  );
  assign io_jtag_TDO_data = tdoReg; // @[JtagTap.scala 95:26]
  assign io_jtag_TDO_driven = tdoeReg; // @[JtagTap.scala 96:26]
  assign io_output_state = stateMachine_io_currState; // @[JtagTap.scala 90:21]
  assign io_output_instruction = activeInstruction; // @[JtagTap.scala 121:27]
  assign io_output_tapIsInTestLogicReset = currState == 4'hf; // @[JtagTap.scala 124:38]
  assign io_dataChainOut_shift = currState == 4'h2; // @[JtagTap.scala 130:38]
  assign io_dataChainOut_data = io_jtag_TDI; // @[JtagTap.scala 131:24]
  assign io_dataChainOut_capture = currState == 4'h6; // @[JtagTap.scala 132:40]
  assign io_dataChainOut_update = currState == 4'h5; // @[JtagTap.scala 133:39]
  assign stateMachine_clock = clock;
  assign stateMachine_reset = io_control_jtag_reset;
  assign stateMachine_io_tms = io_jtag_TMS; // @[JtagTap.scala 88:25]
  assign irChain_clock = clock;
  assign irChain_reset = reset;
  assign irChain_io_chainIn_shift = currState == 4'ha; // @[JtagTap.scala 108:41]
  assign irChain_io_chainIn_data = io_jtag_TDI; // @[JtagTap.scala 109:27]
  assign irChain_io_chainIn_capture = currState == 4'he; // @[JtagTap.scala 110:43]
  assign irChain_io_chainIn_update = currState == 4'hd; // @[JtagTap.scala 111:42]
  assign irChain_io_capture_bits = 5'h1; // @[JtagTap.scala 112:27]
  always @(posedge clock_falling or posedge io_control_jtag_reset) begin
    if (io_control_jtag_reset) begin
      tdoReg <= 1'h0;
    end else if (_io_dataChainOut_shift_T) begin
      tdoReg <= io_dataChainIn_data;
    end else begin
      tdoReg <= _GEN_2;
    end
  end
  always @(posedge clock_falling or posedge io_control_jtag_reset) begin
    if (io_control_jtag_reset) begin
      tdoeReg <= 1'h0;
    end else begin
      tdoeReg <= _io_dataChainOut_shift_T | _irChain_io_chainIn_shift_T;
    end
  end
  always @(posedge clock_falling or posedge io_control_jtag_reset) begin
    if (io_control_jtag_reset) begin
      activeInstruction <= 5'h1;
    end else if (tapIsInTestLogicReset) begin
      activeInstruction <= 5'h1;
    end else if (_irChain_io_chainIn_update_T) begin
      activeInstruction <= irChain_io_update_bits;
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
  tdoReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  tdoeReg = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  activeInstruction = _RAND_2[4:0];
`endif // RANDOMIZE_REG_INIT
  if (io_control_jtag_reset) begin
    tdoReg = 1'h0;
  end
  if (io_control_jtag_reset) begin
    tdoeReg = 1'h0;
  end
  if (io_control_jtag_reset) begin
    activeInstruction = 5'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
