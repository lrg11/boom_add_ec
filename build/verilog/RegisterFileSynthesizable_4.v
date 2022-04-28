module RegisterFileSynthesizable_4(
  input        clock,
  input        reset,
  input  [6:0] io_read_ports_0_addr,
  output [3:0] io_read_ports_0_data,
  input  [6:0] io_read_ports_1_addr,
  output [3:0] io_read_ports_1_data,
  input  [6:0] io_read_ports_2_addr,
  output [3:0] io_read_ports_2_data,
  input        io_write_ports_0_valid,
  input  [6:0] io_write_ports_0_bits_addr,
  input  [3:0] io_write_ports_0_bits_data,
  input        io_write_ports_1_valid,
  input  [6:0] io_write_ports_1_bits_addr,
  input  [3:0] io_write_ports_1_bits_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] regfile [0:15]; // @[regfile.scala 118:20]
  wire [3:0] regfile_MPORT_data; // @[regfile.scala 118:20]
  wire [3:0] regfile_MPORT_addr; // @[regfile.scala 118:20]
  wire [3:0] regfile_MPORT_1_data; // @[regfile.scala 118:20]
  wire [3:0] regfile_MPORT_1_addr; // @[regfile.scala 118:20]
  wire [3:0] regfile_MPORT_2_data; // @[regfile.scala 118:20]
  wire [3:0] regfile_MPORT_2_addr; // @[regfile.scala 118:20]
  wire [3:0] regfile_MPORT_3_data; // @[regfile.scala 118:20]
  wire [3:0] regfile_MPORT_3_addr; // @[regfile.scala 118:20]
  wire  regfile_MPORT_3_mask; // @[regfile.scala 118:20]
  wire  regfile_MPORT_3_en; // @[regfile.scala 118:20]
  wire [3:0] regfile_MPORT_4_data; // @[regfile.scala 118:20]
  wire [3:0] regfile_MPORT_4_addr; // @[regfile.scala 118:20]
  wire  regfile_MPORT_4_mask; // @[regfile.scala 118:20]
  wire  regfile_MPORT_4_en; // @[regfile.scala 118:20]
  reg [6:0] read_addrs_0; // @[regfile.scala 126:50]
  reg [6:0] read_addrs_1; // @[regfile.scala 126:50]
  reg [6:0] read_addrs_2; // @[regfile.scala 126:50]
  wire  _T_6 = io_write_ports_0_bits_addr == read_addrs_0; // @[regfile.scala 147:21]
  wire  _T_7 = io_write_ports_0_valid & _T_6; // @[regfile.scala 146:59]
  wire  _T_8 = io_write_ports_1_bits_addr == read_addrs_0; // @[regfile.scala 147:21]
  wire  _T_9 = io_write_ports_1_valid & _T_8; // @[regfile.scala 146:59]
  wire [3:0] _T_10 = _T_7 ? io_write_ports_0_bits_data : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_11 = _T_9 ? io_write_ports_1_bits_data : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_12 = _T_10 | _T_11; // @[Mux.scala 27:72]
  wire [3:0] read_data_0 = regfile_MPORT_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_15 = io_write_ports_0_bits_addr == read_addrs_1; // @[regfile.scala 147:21]
  wire  _T_16 = io_write_ports_0_valid & _T_15; // @[regfile.scala 146:59]
  wire  _T_17 = io_write_ports_1_bits_addr == read_addrs_1; // @[regfile.scala 147:21]
  wire  _T_18 = io_write_ports_1_valid & _T_17; // @[regfile.scala 146:59]
  wire [3:0] _T_19 = _T_16 ? io_write_ports_0_bits_data : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_20 = _T_18 ? io_write_ports_1_bits_data : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_21 = _T_19 | _T_20; // @[Mux.scala 27:72]
  wire [3:0] read_data_1 = regfile_MPORT_1_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_24 = io_write_ports_0_bits_addr == read_addrs_2; // @[regfile.scala 147:21]
  wire  _T_25 = io_write_ports_0_valid & _T_24; // @[regfile.scala 146:59]
  wire  _T_26 = io_write_ports_1_bits_addr == read_addrs_2; // @[regfile.scala 147:21]
  wire  _T_27 = io_write_ports_1_valid & _T_26; // @[regfile.scala 146:59]
  wire [3:0] _T_28 = _T_25 ? io_write_ports_0_bits_data : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_29 = _T_27 ? io_write_ports_1_bits_data : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_30 = _T_28 | _T_29; // @[Mux.scala 27:72]
  wire [3:0] read_data_2 = regfile_MPORT_2_data; // @[regfile.scala 123:23 regfile.scala 129:18]
  wire  _T_36 = ~io_write_ports_1_valid; // @[regfile.scala 173:16]
  wire  _T_37 = ~io_write_ports_0_valid | _T_36; // @[regfile.scala 172:41]
  wire  _T_38 = io_write_ports_0_bits_addr != io_write_ports_1_bits_addr; // @[regfile.scala 174:45]
  wire  _T_39 = _T_37 | _T_38; // @[regfile.scala 173:41]
  wire  _T_40 = io_write_ports_0_bits_addr == 7'h0; // @[regfile.scala 175:45]
  wire  _T_41 = _T_39 | _T_40; // @[regfile.scala 174:78]
  assign regfile_MPORT_addr = read_addrs_0[3:0];
  assign regfile_MPORT_data = regfile[regfile_MPORT_addr]; // @[regfile.scala 118:20]
  assign regfile_MPORT_1_addr = read_addrs_1[3:0];
  assign regfile_MPORT_1_data = regfile[regfile_MPORT_1_addr]; // @[regfile.scala 118:20]
  assign regfile_MPORT_2_addr = read_addrs_2[3:0];
  assign regfile_MPORT_2_data = regfile[regfile_MPORT_2_addr]; // @[regfile.scala 118:20]
  assign regfile_MPORT_3_data = io_write_ports_0_bits_data;
  assign regfile_MPORT_3_addr = io_write_ports_0_bits_addr[3:0];
  assign regfile_MPORT_3_mask = 1'h1;
  assign regfile_MPORT_3_en = io_write_ports_0_valid;
  assign regfile_MPORT_4_data = io_write_ports_1_bits_data;
  assign regfile_MPORT_4_addr = io_write_ports_1_bits_addr[3:0];
  assign regfile_MPORT_4_mask = 1'h1;
  assign regfile_MPORT_4_en = io_write_ports_1_valid;
  assign io_read_ports_0_data = _T_7 | _T_9 ? _T_12 : read_data_0; // @[regfile.scala 151:35]
  assign io_read_ports_1_data = _T_16 | _T_18 ? _T_21 : read_data_1; // @[regfile.scala 151:35]
  assign io_read_ports_2_data = _T_25 | _T_27 ? _T_30 : read_data_2; // @[regfile.scala 151:35]
  always @(posedge clock) begin
    if(regfile_MPORT_3_en & regfile_MPORT_3_mask) begin
      regfile[regfile_MPORT_3_addr] <= regfile_MPORT_3_data; // @[regfile.scala 118:20]
    end
    if(regfile_MPORT_4_en & regfile_MPORT_4_mask) begin
      regfile[regfile_MPORT_4_addr] <= regfile_MPORT_4_data; // @[regfile.scala 118:20]
    end
    read_addrs_0 <= io_read_ports_0_addr; // @[regfile.scala 126:50]
    read_addrs_1 <= io_read_ports_1_addr; // @[regfile.scala 126:50]
    read_addrs_2 <= io_read_ports_2_addr; // @[regfile.scala 126:50]
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(_T_41 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: [regfile] too many writers a register\n    at regfile.scala:172 assert(!io.write_ports(i).valid ||\n"
            ); // @[regfile.scala 172:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_41 | reset)) begin
          $fatal; // @[regfile.scala 172:15]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    regfile[initvar] = _RAND_0[3:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  read_addrs_0 = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  read_addrs_1 = _RAND_2[6:0];
  _RAND_3 = {1{`RANDOM}};
  read_addrs_2 = _RAND_3[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
