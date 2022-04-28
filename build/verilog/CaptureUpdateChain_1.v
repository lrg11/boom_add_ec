module CaptureUpdateChain_1(
  input         clock,
  input         reset,
  input         io_chainIn_shift,
  input         io_chainIn_data,
  input         io_chainIn_capture,
  input         io_chainIn_update,
  output        io_chainOut_shift,
  output        io_chainOut_data,
  output        io_chainOut_capture,
  output        io_chainOut_update,
  input  [6:0]  io_capture_bits_addr,
  input  [31:0] io_capture_bits_data,
  input  [1:0]  io_capture_bits_resp,
  output        io_capture_capture,
  output        io_update_valid,
  output [6:0]  io_update_bits_addr,
  output [31:0] io_update_bits_data,
  output [1:0]  io_update_bits_op
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
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
`endif // RANDOMIZE_REG_INIT
  reg  regs_0; // @[JtagShifter.scala 155:39]
  reg  regs_1; // @[JtagShifter.scala 155:39]
  reg  regs_2; // @[JtagShifter.scala 155:39]
  reg  regs_3; // @[JtagShifter.scala 155:39]
  reg  regs_4; // @[JtagShifter.scala 155:39]
  reg  regs_5; // @[JtagShifter.scala 155:39]
  reg  regs_6; // @[JtagShifter.scala 155:39]
  reg  regs_7; // @[JtagShifter.scala 155:39]
  reg  regs_8; // @[JtagShifter.scala 155:39]
  reg  regs_9; // @[JtagShifter.scala 155:39]
  reg  regs_10; // @[JtagShifter.scala 155:39]
  reg  regs_11; // @[JtagShifter.scala 155:39]
  reg  regs_12; // @[JtagShifter.scala 155:39]
  reg  regs_13; // @[JtagShifter.scala 155:39]
  reg  regs_14; // @[JtagShifter.scala 155:39]
  reg  regs_15; // @[JtagShifter.scala 155:39]
  reg  regs_16; // @[JtagShifter.scala 155:39]
  reg  regs_17; // @[JtagShifter.scala 155:39]
  reg  regs_18; // @[JtagShifter.scala 155:39]
  reg  regs_19; // @[JtagShifter.scala 155:39]
  reg  regs_20; // @[JtagShifter.scala 155:39]
  reg  regs_21; // @[JtagShifter.scala 155:39]
  reg  regs_22; // @[JtagShifter.scala 155:39]
  reg  regs_23; // @[JtagShifter.scala 155:39]
  reg  regs_24; // @[JtagShifter.scala 155:39]
  reg  regs_25; // @[JtagShifter.scala 155:39]
  reg  regs_26; // @[JtagShifter.scala 155:39]
  reg  regs_27; // @[JtagShifter.scala 155:39]
  reg  regs_28; // @[JtagShifter.scala 155:39]
  reg  regs_29; // @[JtagShifter.scala 155:39]
  reg  regs_30; // @[JtagShifter.scala 155:39]
  reg  regs_31; // @[JtagShifter.scala 155:39]
  reg  regs_32; // @[JtagShifter.scala 155:39]
  reg  regs_33; // @[JtagShifter.scala 155:39]
  reg  regs_34; // @[JtagShifter.scala 155:39]
  reg  regs_35; // @[JtagShifter.scala 155:39]
  reg  regs_36; // @[JtagShifter.scala 155:39]
  reg  regs_37; // @[JtagShifter.scala 155:39]
  reg  regs_38; // @[JtagShifter.scala 155:39]
  reg  regs_39; // @[JtagShifter.scala 155:39]
  reg  regs_40; // @[JtagShifter.scala 155:39]
  wire [9:0] updateBits_lo_lo = {regs_9,regs_8,regs_7,regs_6,regs_5,regs_4,regs_3,regs_2,regs_1,regs_0}; // @[Cat.scala 30:58]
  wire [9:0] updateBits_lo_hi = {regs_19,regs_18,regs_17,regs_16,regs_15,regs_14,regs_13,regs_12,regs_11,regs_10}; // @[Cat.scala 30:58]
  wire [9:0] updateBits_hi_lo = {regs_29,regs_28,regs_27,regs_26,regs_25,regs_24,regs_23,regs_22,regs_21,regs_20}; // @[Cat.scala 30:58]
  wire [4:0] updateBits_hi_hi_lo = {regs_34,regs_33,regs_32,regs_31,regs_30}; // @[Cat.scala 30:58]
  wire [40:0] updateBits = {regs_40,regs_39,regs_38,regs_37,regs_36,regs_35,updateBits_hi_hi_lo,updateBits_hi_lo,
    updateBits_lo_hi,updateBits_lo_lo}; // @[Cat.scala 30:58]
  wire [40:0] captureBits = {io_capture_bits_addr,io_capture_bits_data,io_capture_bits_resp}; // @[JtagShifter.scala 162:43]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 184:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 185:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 186:7]
  assign io_chainOut_shift = io_chainIn_shift; // @[JtagShifter.scala 25:11]
  assign io_chainOut_data = regs_0; // @[JtagShifter.scala 157:20]
  assign io_chainOut_capture = io_chainIn_capture; // @[JtagShifter.scala 26:13]
  assign io_chainOut_update = io_chainIn_update; // @[JtagShifter.scala 27:12]
  assign io_capture_capture = io_chainIn_capture; // @[JtagShifter.scala 167:29 JtagShifter.scala 170:24]
  assign io_update_valid = io_chainIn_capture ? 1'h0 : io_chainIn_update; // @[JtagShifter.scala 167:29 JtagShifter.scala 171:21]
  assign io_update_bits_addr = updateBits[40:34]; // @[JtagShifter.scala 160:40]
  assign io_update_bits_data = updateBits[33:2]; // @[JtagShifter.scala 160:40]
  assign io_update_bits_op = updateBits[1:0]; // @[JtagShifter.scala 160:40]
  always @(posedge clock) begin
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_0 <= captureBits[0]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_0 <= regs_1; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_1 <= captureBits[1]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_1 <= regs_2; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_2 <= captureBits[2]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_2 <= regs_3; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_3 <= captureBits[3]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_3 <= regs_4; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_4 <= captureBits[4]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_4 <= regs_5; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_5 <= captureBits[5]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_5 <= regs_6; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_6 <= captureBits[6]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_6 <= regs_7; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_7 <= captureBits[7]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_7 <= regs_8; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_8 <= captureBits[8]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_8 <= regs_9; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_9 <= captureBits[9]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_9 <= regs_10; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_10 <= captureBits[10]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_10 <= regs_11; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_11 <= captureBits[11]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_11 <= regs_12; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_12 <= captureBits[12]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_12 <= regs_13; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_13 <= captureBits[13]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_13 <= regs_14; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_14 <= captureBits[14]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_14 <= regs_15; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_15 <= captureBits[15]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_15 <= regs_16; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_16 <= captureBits[16]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_16 <= regs_17; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_17 <= captureBits[17]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_17 <= regs_18; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_18 <= captureBits[18]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_18 <= regs_19; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_19 <= captureBits[19]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_19 <= regs_20; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_20 <= captureBits[20]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_20 <= regs_21; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_21 <= captureBits[21]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_21 <= regs_22; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_22 <= captureBits[22]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_22 <= regs_23; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_23 <= captureBits[23]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_23 <= regs_24; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_24 <= captureBits[24]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_24 <= regs_25; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_25 <= captureBits[25]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_25 <= regs_26; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_26 <= captureBits[26]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_26 <= regs_27; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_27 <= captureBits[27]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_27 <= regs_28; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_28 <= captureBits[28]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_28 <= regs_29; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_29 <= captureBits[29]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_29 <= regs_30; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_30 <= captureBits[30]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_30 <= regs_31; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_31 <= captureBits[31]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_31 <= regs_32; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_32 <= captureBits[32]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_32 <= regs_33; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_33 <= captureBits[33]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_33 <= regs_34; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_34 <= captureBits[34]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_34 <= regs_35; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_35 <= captureBits[35]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_35 <= regs_36; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_36 <= captureBits[36]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_36 <= regs_37; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_37 <= captureBits[37]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_37 <= regs_38; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_38 <= captureBits[38]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_38 <= regs_39; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_39 <= captureBits[39]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_39 <= regs_40; // @[JtagShifter.scala 177:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 167:29]
      regs_40 <= captureBits[40]; // @[JtagShifter.scala 168:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 172:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 175:34]
        regs_40 <= io_chainIn_data; // @[JtagShifter.scala 176:15]
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
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  regs_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  regs_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  regs_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  regs_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  regs_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  regs_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  regs_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  regs_16 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  regs_17 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  regs_18 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  regs_19 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  regs_20 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  regs_21 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  regs_22 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  regs_23 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  regs_24 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  regs_25 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  regs_26 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  regs_27 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  regs_28 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  regs_29 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  regs_30 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  regs_31 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  regs_32 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  regs_33 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  regs_34 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  regs_35 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  regs_36 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  regs_37 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  regs_38 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  regs_39 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  regs_40 = _RAND_40[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
