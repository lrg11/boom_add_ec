module CaptureUpdateChain_2(
  input        clock,
  input        reset,
  input        io_chainIn_shift,
  input        io_chainIn_data,
  input        io_chainIn_capture,
  input        io_chainIn_update,
  output       io_chainOut_shift,
  output       io_chainOut_data,
  output       io_chainOut_capture,
  output       io_chainOut_update,
  input  [4:0] io_capture_bits,
  output       io_capture_capture,
  output       io_update_valid,
  output [4:0] io_update_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  regs_0; // @[JtagShifter.scala 155:39]
  reg  regs_1; // @[JtagShifter.scala 155:39]
  reg  regs_2; // @[JtagShifter.scala 155:39]
  reg  regs_3; // @[JtagShifter.scala 155:39]
  reg  regs_4; // @[JtagShifter.scala 155:39]
  wire [1:0] updateBits_lo = {regs_1,regs_0}; // @[Cat.scala 30:58]
  wire [2:0] updateBits_hi = {regs_4,regs_3,regs_2}; // @[Cat.scala 30:58]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 184:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 185:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 186:7]
  assign io_chainOut_shift = io_chainIn_shift; // @[JtagShifter.scala 25:11]
  assign io_chainOut_data = regs_0; // @[JtagShifter.scala 157:20]
  assign io_chainOut_capture = io_chainIn_capture; // @[JtagShifter.scala 26:13]
  assign io_chainOut_update = io_chainIn_update; // @[JtagShifter.scala 27:12]
  assign io_capture_capture = io_chainIn_capture; // @[JtagShifter.scala 167:29 JtagShifter.scala 170:24]
  assign io_update_valid = io_chainIn_capture ? 1'h0 : io_chainIn_update; // @[JtagShifter.scala 167:29 JtagShifter.scala 171:21]
  assign io_update_bits = {updateBits_hi,updateBits_lo}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_0 <= io_capture_bits[0]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_0 <= regs_1; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_1 <= io_capture_bits[1]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_1 <= regs_2; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_2 <= io_capture_bits[2]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_2 <= regs_3; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_3 <= io_capture_bits[3]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_3 <= regs_4; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_4 <= io_capture_bits[4]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_4 <= io_chainIn_data; // @[JtagShifter.scala 176:15]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_7 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at JtagShifter.scala:184 assert(!(io.chainIn.capture && io.chainIn.update)\n"); // @[JtagShifter.scala 184:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_7 | reset)) begin
          $fatal; // @[JtagShifter.scala 184:9]
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
  regs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
