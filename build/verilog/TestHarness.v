module TestHarness(
  input   clock,
  input   reset,
  output  io_success
);
  wire  chiptop_jtag_TCK; // @[TestHarness.scala 89:19]
  wire  chiptop_jtag_TMS; // @[TestHarness.scala 89:19]
  wire  chiptop_jtag_TDI; // @[TestHarness.scala 89:19]
  wire  chiptop_jtag_TDO; // @[TestHarness.scala 89:19]
  wire  chiptop_serial_tl_clock; // @[TestHarness.scala 89:19]
  wire  chiptop_serial_tl_bits_in_ready; // @[TestHarness.scala 89:19]
  wire  chiptop_serial_tl_bits_in_valid; // @[TestHarness.scala 89:19]
  wire [3:0] chiptop_serial_tl_bits_in_bits; // @[TestHarness.scala 89:19]
  wire  chiptop_serial_tl_bits_out_ready; // @[TestHarness.scala 89:19]
  wire  chiptop_serial_tl_bits_out_valid; // @[TestHarness.scala 89:19]
  wire [3:0] chiptop_serial_tl_bits_out_bits; // @[TestHarness.scala 89:19]
  wire  chiptop_custom_boot; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_clock; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_reset; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_aw_ready; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_aw_valid; // @[TestHarness.scala 89:19]
  wire [3:0] chiptop_axi4_mem_0_bits_aw_bits_id; // @[TestHarness.scala 89:19]
  wire [31:0] chiptop_axi4_mem_0_bits_aw_bits_addr; // @[TestHarness.scala 89:19]
  wire [7:0] chiptop_axi4_mem_0_bits_aw_bits_len; // @[TestHarness.scala 89:19]
  wire [2:0] chiptop_axi4_mem_0_bits_aw_bits_size; // @[TestHarness.scala 89:19]
  wire [1:0] chiptop_axi4_mem_0_bits_aw_bits_burst; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_aw_bits_lock; // @[TestHarness.scala 89:19]
  wire [3:0] chiptop_axi4_mem_0_bits_aw_bits_cache; // @[TestHarness.scala 89:19]
  wire [2:0] chiptop_axi4_mem_0_bits_aw_bits_prot; // @[TestHarness.scala 89:19]
  wire [3:0] chiptop_axi4_mem_0_bits_aw_bits_qos; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_w_ready; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_w_valid; // @[TestHarness.scala 89:19]
  wire [63:0] chiptop_axi4_mem_0_bits_w_bits_data; // @[TestHarness.scala 89:19]
  wire [7:0] chiptop_axi4_mem_0_bits_w_bits_strb; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_w_bits_last; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_b_ready; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_b_valid; // @[TestHarness.scala 89:19]
  wire [3:0] chiptop_axi4_mem_0_bits_b_bits_id; // @[TestHarness.scala 89:19]
  wire [1:0] chiptop_axi4_mem_0_bits_b_bits_resp; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_ar_ready; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_ar_valid; // @[TestHarness.scala 89:19]
  wire [3:0] chiptop_axi4_mem_0_bits_ar_bits_id; // @[TestHarness.scala 89:19]
  wire [31:0] chiptop_axi4_mem_0_bits_ar_bits_addr; // @[TestHarness.scala 89:19]
  wire [7:0] chiptop_axi4_mem_0_bits_ar_bits_len; // @[TestHarness.scala 89:19]
  wire [2:0] chiptop_axi4_mem_0_bits_ar_bits_size; // @[TestHarness.scala 89:19]
  wire [1:0] chiptop_axi4_mem_0_bits_ar_bits_burst; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_ar_bits_lock; // @[TestHarness.scala 89:19]
  wire [3:0] chiptop_axi4_mem_0_bits_ar_bits_cache; // @[TestHarness.scala 89:19]
  wire [2:0] chiptop_axi4_mem_0_bits_ar_bits_prot; // @[TestHarness.scala 89:19]
  wire [3:0] chiptop_axi4_mem_0_bits_ar_bits_qos; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_r_ready; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_r_valid; // @[TestHarness.scala 89:19]
  wire [3:0] chiptop_axi4_mem_0_bits_r_bits_id; // @[TestHarness.scala 89:19]
  wire [63:0] chiptop_axi4_mem_0_bits_r_bits_data; // @[TestHarness.scala 89:19]
  wire [1:0] chiptop_axi4_mem_0_bits_r_bits_resp; // @[TestHarness.scala 89:19]
  wire  chiptop_axi4_mem_0_bits_r_bits_last; // @[TestHarness.scala 89:19]
  wire  chiptop_uart_0_txd; // @[TestHarness.scala 89:19]
  wire  chiptop_uart_0_rxd; // @[TestHarness.scala 89:19]
  wire  chiptop_reset; // @[TestHarness.scala 89:19]
  wire  chiptop_clock; // @[TestHarness.scala 89:19]
  wire  SimJTAG_clock; // @[HarnessBinders.scala 236:26]
  wire  SimJTAG_reset; // @[HarnessBinders.scala 236:26]
  wire  SimJTAG_jtag_TRSTn; // @[HarnessBinders.scala 236:26]
  wire  SimJTAG_jtag_TCK; // @[HarnessBinders.scala 236:26]
  wire  SimJTAG_jtag_TMS; // @[HarnessBinders.scala 236:26]
  wire  SimJTAG_jtag_TDI; // @[HarnessBinders.scala 236:26]
  wire  SimJTAG_jtag_TDO_data; // @[HarnessBinders.scala 236:26]
  wire  SimJTAG_jtag_TDO_driven; // @[HarnessBinders.scala 236:26]
  wire  SimJTAG_enable; // @[HarnessBinders.scala 236:26]
  wire  SimJTAG_init_done; // @[HarnessBinders.scala 236:26]
  wire [31:0] SimJTAG_exit; // @[HarnessBinders.scala 236:26]
  wire [31:0] plusarg_reader_out; // @[PlusArg.scala 80:11]
  wire  AsyncQueue_clock; // @[SerialAdapter.scala 27:29]
  wire  AsyncQueue_reset; // @[SerialAdapter.scala 27:29]
  wire  AsyncQueue_io_enq_clock; // @[SerialAdapter.scala 27:29]
  wire  AsyncQueue_io_enq_reset; // @[SerialAdapter.scala 27:29]
  wire  AsyncQueue_io_enq_ready; // @[SerialAdapter.scala 27:29]
  wire  AsyncQueue_io_enq_valid; // @[SerialAdapter.scala 27:29]
  wire [3:0] AsyncQueue_io_enq_bits; // @[SerialAdapter.scala 27:29]
  wire  AsyncQueue_io_deq_clock; // @[SerialAdapter.scala 27:29]
  wire  AsyncQueue_io_deq_reset; // @[SerialAdapter.scala 27:29]
  wire  AsyncQueue_io_deq_ready; // @[SerialAdapter.scala 27:29]
  wire  AsyncQueue_io_deq_valid; // @[SerialAdapter.scala 27:29]
  wire [3:0] AsyncQueue_io_deq_bits; // @[SerialAdapter.scala 27:29]
  wire  AsyncQueue_1_clock; // @[SerialAdapter.scala 33:28]
  wire  AsyncQueue_1_reset; // @[SerialAdapter.scala 33:28]
  wire  AsyncQueue_1_io_enq_clock; // @[SerialAdapter.scala 33:28]
  wire  AsyncQueue_1_io_enq_reset; // @[SerialAdapter.scala 33:28]
  wire  AsyncQueue_1_io_enq_ready; // @[SerialAdapter.scala 33:28]
  wire  AsyncQueue_1_io_enq_valid; // @[SerialAdapter.scala 33:28]
  wire [3:0] AsyncQueue_1_io_enq_bits; // @[SerialAdapter.scala 33:28]
  wire  AsyncQueue_1_io_deq_clock; // @[SerialAdapter.scala 33:28]
  wire  AsyncQueue_1_io_deq_reset; // @[SerialAdapter.scala 33:28]
  wire  AsyncQueue_1_io_deq_ready; // @[SerialAdapter.scala 33:28]
  wire  AsyncQueue_1_io_deq_valid; // @[SerialAdapter.scala 33:28]
  wire [3:0] AsyncQueue_1_io_deq_bits; // @[SerialAdapter.scala 33:28]
  wire  ram_clock; // @[SerialAdapter.scala 64:24]
  wire  ram_reset; // @[SerialAdapter.scala 64:24]
  wire  ram_io_ser_in_ready; // @[SerialAdapter.scala 64:24]
  wire  ram_io_ser_in_valid; // @[SerialAdapter.scala 64:24]
  wire [3:0] ram_io_ser_in_bits; // @[SerialAdapter.scala 64:24]
  wire  ram_io_ser_out_ready; // @[SerialAdapter.scala 64:24]
  wire  ram_io_ser_out_valid; // @[SerialAdapter.scala 64:24]
  wire [3:0] ram_io_ser_out_bits; // @[SerialAdapter.scala 64:24]
  wire  ram_io_tsi_ser_in_ready; // @[SerialAdapter.scala 64:24]
  wire  ram_io_tsi_ser_in_valid; // @[SerialAdapter.scala 64:24]
  wire [31:0] ram_io_tsi_ser_in_bits; // @[SerialAdapter.scala 64:24]
  wire  ram_io_tsi_ser_out_ready; // @[SerialAdapter.scala 64:24]
  wire  ram_io_tsi_ser_out_valid; // @[SerialAdapter.scala 64:24]
  wire [31:0] ram_io_tsi_ser_out_bits; // @[SerialAdapter.scala 64:24]
  wire  SimSerial_clock; // @[SerialAdapter.scala 101:23]
  wire  SimSerial_reset; // @[SerialAdapter.scala 101:23]
  wire  SimSerial_serial_in_ready; // @[SerialAdapter.scala 101:23]
  wire  SimSerial_serial_in_valid; // @[SerialAdapter.scala 101:23]
  wire [31:0] SimSerial_serial_in_bits; // @[SerialAdapter.scala 101:23]
  wire  SimSerial_serial_out_ready; // @[SerialAdapter.scala 101:23]
  wire  SimSerial_serial_out_valid; // @[SerialAdapter.scala 101:23]
  wire [31:0] SimSerial_serial_out_bits; // @[SerialAdapter.scala 101:23]
  wire  SimSerial_exit; // @[SerialAdapter.scala 101:23]
  wire  simdram_clock; // @[HarnessBinders.scala 168:23]
  wire  simdram_reset; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_aw_ready; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_aw_valid; // @[HarnessBinders.scala 168:23]
  wire [3:0] simdram_axi_aw_bits_id; // @[HarnessBinders.scala 168:23]
  wire [31:0] simdram_axi_aw_bits_addr; // @[HarnessBinders.scala 168:23]
  wire [7:0] simdram_axi_aw_bits_len; // @[HarnessBinders.scala 168:23]
  wire [2:0] simdram_axi_aw_bits_size; // @[HarnessBinders.scala 168:23]
  wire [1:0] simdram_axi_aw_bits_burst; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_aw_bits_lock; // @[HarnessBinders.scala 168:23]
  wire [3:0] simdram_axi_aw_bits_cache; // @[HarnessBinders.scala 168:23]
  wire [2:0] simdram_axi_aw_bits_prot; // @[HarnessBinders.scala 168:23]
  wire [3:0] simdram_axi_aw_bits_qos; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_w_ready; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_w_valid; // @[HarnessBinders.scala 168:23]
  wire [63:0] simdram_axi_w_bits_data; // @[HarnessBinders.scala 168:23]
  wire [7:0] simdram_axi_w_bits_strb; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_w_bits_last; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_b_ready; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_b_valid; // @[HarnessBinders.scala 168:23]
  wire [3:0] simdram_axi_b_bits_id; // @[HarnessBinders.scala 168:23]
  wire [1:0] simdram_axi_b_bits_resp; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_ar_ready; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_ar_valid; // @[HarnessBinders.scala 168:23]
  wire [3:0] simdram_axi_ar_bits_id; // @[HarnessBinders.scala 168:23]
  wire [31:0] simdram_axi_ar_bits_addr; // @[HarnessBinders.scala 168:23]
  wire [7:0] simdram_axi_ar_bits_len; // @[HarnessBinders.scala 168:23]
  wire [2:0] simdram_axi_ar_bits_size; // @[HarnessBinders.scala 168:23]
  wire [1:0] simdram_axi_ar_bits_burst; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_ar_bits_lock; // @[HarnessBinders.scala 168:23]
  wire [3:0] simdram_axi_ar_bits_cache; // @[HarnessBinders.scala 168:23]
  wire [2:0] simdram_axi_ar_bits_prot; // @[HarnessBinders.scala 168:23]
  wire [3:0] simdram_axi_ar_bits_qos; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_r_ready; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_r_valid; // @[HarnessBinders.scala 168:23]
  wire [3:0] simdram_axi_r_bits_id; // @[HarnessBinders.scala 168:23]
  wire [63:0] simdram_axi_r_bits_data; // @[HarnessBinders.scala 168:23]
  wire [1:0] simdram_axi_r_bits_resp; // @[HarnessBinders.scala 168:23]
  wire  simdram_axi_r_bits_last; // @[HarnessBinders.scala 168:23]
  wire  uart_sim_0_clock; // @[UARTAdapter.scala 132:28]
  wire  uart_sim_0_reset; // @[UARTAdapter.scala 132:28]
  wire  uart_sim_0_io_uart_txd; // @[UARTAdapter.scala 132:28]
  wire  uart_sim_0_io_uart_rxd; // @[UARTAdapter.scala 132:28]
  wire  _T_3 = SimJTAG_exit == 32'h1; // @[Periphery.scala 233:26]
  wire  _T_2 = ~reset; // @[HarnessBinders.scala 236:115]
  wire  _T_4 = SimJTAG_exit >= 32'h2; // @[Periphery.scala 234:19]
  ChipTop chiptop ( // @[TestHarness.scala 89:19]
    .jtag_TCK(chiptop_jtag_TCK),
    .jtag_TMS(chiptop_jtag_TMS),
    .jtag_TDI(chiptop_jtag_TDI),
    .jtag_TDO(chiptop_jtag_TDO),
    .serial_tl_clock(chiptop_serial_tl_clock),
    .serial_tl_bits_in_ready(chiptop_serial_tl_bits_in_ready),
    .serial_tl_bits_in_valid(chiptop_serial_tl_bits_in_valid),
    .serial_tl_bits_in_bits(chiptop_serial_tl_bits_in_bits),
    .serial_tl_bits_out_ready(chiptop_serial_tl_bits_out_ready),
    .serial_tl_bits_out_valid(chiptop_serial_tl_bits_out_valid),
    .serial_tl_bits_out_bits(chiptop_serial_tl_bits_out_bits),
    .custom_boot(chiptop_custom_boot),
    .axi4_mem_0_clock(chiptop_axi4_mem_0_clock),
    .axi4_mem_0_reset(chiptop_axi4_mem_0_reset),
    .axi4_mem_0_bits_aw_ready(chiptop_axi4_mem_0_bits_aw_ready),
    .axi4_mem_0_bits_aw_valid(chiptop_axi4_mem_0_bits_aw_valid),
    .axi4_mem_0_bits_aw_bits_id(chiptop_axi4_mem_0_bits_aw_bits_id),
    .axi4_mem_0_bits_aw_bits_addr(chiptop_axi4_mem_0_bits_aw_bits_addr),
    .axi4_mem_0_bits_aw_bits_len(chiptop_axi4_mem_0_bits_aw_bits_len),
    .axi4_mem_0_bits_aw_bits_size(chiptop_axi4_mem_0_bits_aw_bits_size),
    .axi4_mem_0_bits_aw_bits_burst(chiptop_axi4_mem_0_bits_aw_bits_burst),
    .axi4_mem_0_bits_aw_bits_lock(chiptop_axi4_mem_0_bits_aw_bits_lock),
    .axi4_mem_0_bits_aw_bits_cache(chiptop_axi4_mem_0_bits_aw_bits_cache),
    .axi4_mem_0_bits_aw_bits_prot(chiptop_axi4_mem_0_bits_aw_bits_prot),
    .axi4_mem_0_bits_aw_bits_qos(chiptop_axi4_mem_0_bits_aw_bits_qos),
    .axi4_mem_0_bits_w_ready(chiptop_axi4_mem_0_bits_w_ready),
    .axi4_mem_0_bits_w_valid(chiptop_axi4_mem_0_bits_w_valid),
    .axi4_mem_0_bits_w_bits_data(chiptop_axi4_mem_0_bits_w_bits_data),
    .axi4_mem_0_bits_w_bits_strb(chiptop_axi4_mem_0_bits_w_bits_strb),
    .axi4_mem_0_bits_w_bits_last(chiptop_axi4_mem_0_bits_w_bits_last),
    .axi4_mem_0_bits_b_ready(chiptop_axi4_mem_0_bits_b_ready),
    .axi4_mem_0_bits_b_valid(chiptop_axi4_mem_0_bits_b_valid),
    .axi4_mem_0_bits_b_bits_id(chiptop_axi4_mem_0_bits_b_bits_id),
    .axi4_mem_0_bits_b_bits_resp(chiptop_axi4_mem_0_bits_b_bits_resp),
    .axi4_mem_0_bits_ar_ready(chiptop_axi4_mem_0_bits_ar_ready),
    .axi4_mem_0_bits_ar_valid(chiptop_axi4_mem_0_bits_ar_valid),
    .axi4_mem_0_bits_ar_bits_id(chiptop_axi4_mem_0_bits_ar_bits_id),
    .axi4_mem_0_bits_ar_bits_addr(chiptop_axi4_mem_0_bits_ar_bits_addr),
    .axi4_mem_0_bits_ar_bits_len(chiptop_axi4_mem_0_bits_ar_bits_len),
    .axi4_mem_0_bits_ar_bits_size(chiptop_axi4_mem_0_bits_ar_bits_size),
    .axi4_mem_0_bits_ar_bits_burst(chiptop_axi4_mem_0_bits_ar_bits_burst),
    .axi4_mem_0_bits_ar_bits_lock(chiptop_axi4_mem_0_bits_ar_bits_lock),
    .axi4_mem_0_bits_ar_bits_cache(chiptop_axi4_mem_0_bits_ar_bits_cache),
    .axi4_mem_0_bits_ar_bits_prot(chiptop_axi4_mem_0_bits_ar_bits_prot),
    .axi4_mem_0_bits_ar_bits_qos(chiptop_axi4_mem_0_bits_ar_bits_qos),
    .axi4_mem_0_bits_r_ready(chiptop_axi4_mem_0_bits_r_ready),
    .axi4_mem_0_bits_r_valid(chiptop_axi4_mem_0_bits_r_valid),
    .axi4_mem_0_bits_r_bits_id(chiptop_axi4_mem_0_bits_r_bits_id),
    .axi4_mem_0_bits_r_bits_data(chiptop_axi4_mem_0_bits_r_bits_data),
    .axi4_mem_0_bits_r_bits_resp(chiptop_axi4_mem_0_bits_r_bits_resp),
    .axi4_mem_0_bits_r_bits_last(chiptop_axi4_mem_0_bits_r_bits_last),
    .uart_0_txd(chiptop_uart_0_txd),
    .uart_0_rxd(chiptop_uart_0_rxd),
    .reset(chiptop_reset),
    .clock(chiptop_clock)
  );
  SimJTAG #(.TICK_DELAY(3)) SimJTAG ( // @[HarnessBinders.scala 236:26]
    .clock(SimJTAG_clock),
    .reset(SimJTAG_reset),
    .jtag_TRSTn(SimJTAG_jtag_TRSTn),
    .jtag_TCK(SimJTAG_jtag_TCK),
    .jtag_TMS(SimJTAG_jtag_TMS),
    .jtag_TDI(SimJTAG_jtag_TDI),
    .jtag_TDO_data(SimJTAG_jtag_TDO_data),
    .jtag_TDO_driven(SimJTAG_jtag_TDO_driven),
    .enable(SimJTAG_enable),
    .init_done(SimJTAG_init_done),
    .exit(SimJTAG_exit)
  );
  plusarg_reader #(.FORMAT("jtag_rbb_enable=%d"), .DEFAULT(0), .WIDTH(32)) plusarg_reader ( // @[PlusArg.scala 80:11]
    .out(plusarg_reader_out)
  );
  AsyncQueue AsyncQueue ( // @[SerialAdapter.scala 27:29]
    .clock(AsyncQueue_clock),
    .reset(AsyncQueue_reset),
    .io_enq_clock(AsyncQueue_io_enq_clock),
    .io_enq_reset(AsyncQueue_io_enq_reset),
    .io_enq_ready(AsyncQueue_io_enq_ready),
    .io_enq_valid(AsyncQueue_io_enq_valid),
    .io_enq_bits(AsyncQueue_io_enq_bits),
    .io_deq_clock(AsyncQueue_io_deq_clock),
    .io_deq_reset(AsyncQueue_io_deq_reset),
    .io_deq_ready(AsyncQueue_io_deq_ready),
    .io_deq_valid(AsyncQueue_io_deq_valid),
    .io_deq_bits(AsyncQueue_io_deq_bits)
  );
  AsyncQueue AsyncQueue_1 ( // @[SerialAdapter.scala 33:28]
    .clock(AsyncQueue_1_clock),
    .reset(AsyncQueue_1_reset),
    .io_enq_clock(AsyncQueue_1_io_enq_clock),
    .io_enq_reset(AsyncQueue_1_io_enq_reset),
    .io_enq_ready(AsyncQueue_1_io_enq_ready),
    .io_enq_valid(AsyncQueue_1_io_enq_valid),
    .io_enq_bits(AsyncQueue_1_io_enq_bits),
    .io_deq_clock(AsyncQueue_1_io_deq_clock),
    .io_deq_reset(AsyncQueue_1_io_deq_reset),
    .io_deq_ready(AsyncQueue_1_io_deq_ready),
    .io_deq_valid(AsyncQueue_1_io_deq_valid),
    .io_deq_bits(AsyncQueue_1_io_deq_bits)
  );
  SerialRAM ram ( // @[SerialAdapter.scala 64:24]
    .clock(ram_clock),
    .reset(ram_reset),
    .io_ser_in_ready(ram_io_ser_in_ready),
    .io_ser_in_valid(ram_io_ser_in_valid),
    .io_ser_in_bits(ram_io_ser_in_bits),
    .io_ser_out_ready(ram_io_ser_out_ready),
    .io_ser_out_valid(ram_io_ser_out_valid),
    .io_ser_out_bits(ram_io_ser_out_bits),
    .io_tsi_ser_in_ready(ram_io_tsi_ser_in_ready),
    .io_tsi_ser_in_valid(ram_io_tsi_ser_in_valid),
    .io_tsi_ser_in_bits(ram_io_tsi_ser_in_bits),
    .io_tsi_ser_out_ready(ram_io_tsi_ser_out_ready),
    .io_tsi_ser_out_valid(ram_io_tsi_ser_out_valid),
    .io_tsi_ser_out_bits(ram_io_tsi_ser_out_bits)
  );
  SimSerial SimSerial ( // @[SerialAdapter.scala 101:23]
    .clock(SimSerial_clock),
    .reset(SimSerial_reset),
    .serial_in_ready(SimSerial_serial_in_ready),
    .serial_in_valid(SimSerial_serial_in_valid),
    .serial_in_bits(SimSerial_serial_in_bits),
    .serial_out_ready(SimSerial_serial_out_ready),
    .serial_out_valid(SimSerial_serial_out_valid),
    .serial_out_bits(SimSerial_serial_out_bits),
    .exit(SimSerial_exit)
  );
  SimDRAM #(.LINE_SIZE(64), .CLOCK_HZ(100000000), .ID_BITS(4), .ADDR_BITS(32), .MEM_SIZE(268435456), .DATA_BITS(64))
    simdram ( // @[HarnessBinders.scala 168:23]
    .clock(simdram_clock),
    .reset(simdram_reset),
    .axi_aw_ready(simdram_axi_aw_ready),
    .axi_aw_valid(simdram_axi_aw_valid),
    .axi_aw_bits_id(simdram_axi_aw_bits_id),
    .axi_aw_bits_addr(simdram_axi_aw_bits_addr),
    .axi_aw_bits_len(simdram_axi_aw_bits_len),
    .axi_aw_bits_size(simdram_axi_aw_bits_size),
    .axi_aw_bits_burst(simdram_axi_aw_bits_burst),
    .axi_aw_bits_lock(simdram_axi_aw_bits_lock),
    .axi_aw_bits_cache(simdram_axi_aw_bits_cache),
    .axi_aw_bits_prot(simdram_axi_aw_bits_prot),
    .axi_aw_bits_qos(simdram_axi_aw_bits_qos),
    .axi_w_ready(simdram_axi_w_ready),
    .axi_w_valid(simdram_axi_w_valid),
    .axi_w_bits_data(simdram_axi_w_bits_data),
    .axi_w_bits_strb(simdram_axi_w_bits_strb),
    .axi_w_bits_last(simdram_axi_w_bits_last),
    .axi_b_ready(simdram_axi_b_ready),
    .axi_b_valid(simdram_axi_b_valid),
    .axi_b_bits_id(simdram_axi_b_bits_id),
    .axi_b_bits_resp(simdram_axi_b_bits_resp),
    .axi_ar_ready(simdram_axi_ar_ready),
    .axi_ar_valid(simdram_axi_ar_valid),
    .axi_ar_bits_id(simdram_axi_ar_bits_id),
    .axi_ar_bits_addr(simdram_axi_ar_bits_addr),
    .axi_ar_bits_len(simdram_axi_ar_bits_len),
    .axi_ar_bits_size(simdram_axi_ar_bits_size),
    .axi_ar_bits_burst(simdram_axi_ar_bits_burst),
    .axi_ar_bits_lock(simdram_axi_ar_bits_lock),
    .axi_ar_bits_cache(simdram_axi_ar_bits_cache),
    .axi_ar_bits_prot(simdram_axi_ar_bits_prot),
    .axi_ar_bits_qos(simdram_axi_ar_bits_qos),
    .axi_r_ready(simdram_axi_r_ready),
    .axi_r_valid(simdram_axi_r_valid),
    .axi_r_bits_id(simdram_axi_r_bits_id),
    .axi_r_bits_data(simdram_axi_r_bits_data),
    .axi_r_bits_resp(simdram_axi_r_bits_resp),
    .axi_r_bits_last(simdram_axi_r_bits_last)
  );
  UARTAdapter uart_sim_0 ( // @[UARTAdapter.scala 132:28]
    .clock(uart_sim_0_clock),
    .reset(uart_sim_0_reset),
    .io_uart_txd(uart_sim_0_io_uart_txd),
    .io_uart_rxd(uart_sim_0_io_uart_rxd)
  );
  assign io_success = SimSerial_exit | _T_3; // @[HarnessBinders.scala 286:24 HarnessBinders.scala 286:37]
  assign chiptop_jtag_TCK = SimJTAG_jtag_TCK; // @[HarnessBinders.scala 230:29 Periphery.scala 220:15]
  assign chiptop_jtag_TMS = SimJTAG_jtag_TMS; // @[HarnessBinders.scala 230:29 Periphery.scala 221:15]
  assign chiptop_jtag_TDI = SimJTAG_jtag_TDI; // @[HarnessBinders.scala 230:29 Periphery.scala 222:15]
  assign chiptop_serial_tl_bits_in_valid = AsyncQueue_1_io_deq_valid; // @[SerialAdapter.scala 34:20]
  assign chiptop_serial_tl_bits_in_bits = AsyncQueue_1_io_deq_bits; // @[SerialAdapter.scala 34:20]
  assign chiptop_serial_tl_bits_out_ready = AsyncQueue_io_enq_ready; // @[SerialAdapter.scala 28:24]
  assign chiptop_custom_boot = 1'h0; // @[HarnessBinders.scala 294:21]
  assign chiptop_axi4_mem_0_bits_aw_ready = simdram_axi_aw_ready; // @[HarnessBinders.scala 169:18]
  assign chiptop_axi4_mem_0_bits_w_ready = simdram_axi_w_ready; // @[HarnessBinders.scala 169:18]
  assign chiptop_axi4_mem_0_bits_b_valid = simdram_axi_b_valid; // @[HarnessBinders.scala 169:18]
  assign chiptop_axi4_mem_0_bits_b_bits_id = simdram_axi_b_bits_id; // @[HarnessBinders.scala 169:18]
  assign chiptop_axi4_mem_0_bits_b_bits_resp = simdram_axi_b_bits_resp; // @[HarnessBinders.scala 169:18]
  assign chiptop_axi4_mem_0_bits_ar_ready = simdram_axi_ar_ready; // @[HarnessBinders.scala 169:18]
  assign chiptop_axi4_mem_0_bits_r_valid = simdram_axi_r_valid; // @[HarnessBinders.scala 169:18]
  assign chiptop_axi4_mem_0_bits_r_bits_id = simdram_axi_r_bits_id; // @[HarnessBinders.scala 169:18]
  assign chiptop_axi4_mem_0_bits_r_bits_data = simdram_axi_r_bits_data; // @[HarnessBinders.scala 169:18]
  assign chiptop_axi4_mem_0_bits_r_bits_resp = simdram_axi_r_bits_resp; // @[HarnessBinders.scala 169:18]
  assign chiptop_axi4_mem_0_bits_r_bits_last = simdram_axi_r_bits_last; // @[HarnessBinders.scala 169:18]
  assign chiptop_uart_0_rxd = uart_sim_0_io_uart_rxd; // @[UARTAdapter.scala 135:18]
  assign chiptop_reset = reset; // @[TestHarness.scala 101:37]
  assign chiptop_clock = clock; // @[TestHarness.scala 112:40 TestHarness.scala 113:36]
  assign SimJTAG_clock = clock; // @[TestHarness.scala 112:40 TestHarness.scala 113:36]
  assign SimJTAG_reset = reset; // @[HarnessBinders.scala 236:107]
  assign SimJTAG_jtag_TDO_data = chiptop_jtag_TDO; // @[HarnessBinders.scala 230:29 HarnessBinders.scala 231:28]
  assign SimJTAG_jtag_TDO_driven = 1'h1; // @[HarnessBinders.scala 230:29 HarnessBinders.scala 232:30]
  assign SimJTAG_enable = plusarg_reader_out[0]; // @[Periphery.scala 228:18]
  assign SimJTAG_init_done = ~reset; // @[HarnessBinders.scala 236:115]
  assign AsyncQueue_clock = 1'h0; // @[SerialAdapter.scala 26:32]
  assign AsyncQueue_reset = 1'h0;
  assign AsyncQueue_io_enq_clock = chiptop_serial_tl_clock; // @[SerialAdapter.scala 29:30]
  assign AsyncQueue_io_enq_reset = reset; // @[SerialAdapter.scala 30:39]
  assign AsyncQueue_io_enq_valid = chiptop_serial_tl_bits_out_valid; // @[SerialAdapter.scala 28:24]
  assign AsyncQueue_io_enq_bits = chiptop_serial_tl_bits_out_bits; // @[SerialAdapter.scala 28:24]
  assign AsyncQueue_io_deq_clock = clock; // @[TestHarness.scala 112:40 TestHarness.scala 113:36]
  assign AsyncQueue_io_deq_reset = reset; // @[SerialAdapter.scala 32:39]
  assign AsyncQueue_io_deq_ready = ram_io_ser_out_ready; // @[SerialAdapter.scala 39:25 SerialAdapter.scala 65:19]
  assign AsyncQueue_1_clock = 1'h0; // @[SerialAdapter.scala 26:32]
  assign AsyncQueue_1_reset = 1'h0;
  assign AsyncQueue_1_io_enq_clock = clock; // @[TestHarness.scala 112:40 TestHarness.scala 113:36]
  assign AsyncQueue_1_io_enq_reset = reset; // @[SerialAdapter.scala 38:38]
  assign AsyncQueue_1_io_enq_valid = ram_io_ser_in_valid; // @[SerialAdapter.scala 39:25 SerialAdapter.scala 65:19]
  assign AsyncQueue_1_io_enq_bits = ram_io_ser_in_bits; // @[SerialAdapter.scala 39:25 SerialAdapter.scala 65:19]
  assign AsyncQueue_1_io_deq_clock = chiptop_serial_tl_clock; // @[SerialAdapter.scala 35:29]
  assign AsyncQueue_1_io_deq_reset = reset; // @[SerialAdapter.scala 36:38]
  assign AsyncQueue_1_io_deq_ready = chiptop_serial_tl_bits_in_ready; // @[SerialAdapter.scala 34:20]
  assign ram_clock = clock; // @[TestHarness.scala 112:40 TestHarness.scala 113:36]
  assign ram_reset = reset; // @[TestHarness.scala 112:40 TestHarness.scala 114:36]
  assign ram_io_ser_in_ready = AsyncQueue_1_io_enq_ready; // @[SerialAdapter.scala 39:25 SerialAdapter.scala 40:23]
  assign ram_io_ser_out_valid = AsyncQueue_io_deq_valid; // @[SerialAdapter.scala 39:25 SerialAdapter.scala 41:19]
  assign ram_io_ser_out_bits = AsyncQueue_io_deq_bits; // @[SerialAdapter.scala 39:25 SerialAdapter.scala 41:19]
  assign ram_io_tsi_ser_in_valid = SimSerial_serial_in_valid; // @[SerialAdapter.scala 104:21]
  assign ram_io_tsi_ser_in_bits = SimSerial_serial_in_bits; // @[SerialAdapter.scala 104:21]
  assign ram_io_tsi_ser_out_ready = SimSerial_serial_out_ready; // @[SerialAdapter.scala 104:21]
  assign SimSerial_clock = clock; // @[TestHarness.scala 112:40 TestHarness.scala 113:36]
  assign SimSerial_reset = reset; // @[HarnessBinders.scala 285:112]
  assign SimSerial_serial_in_ready = ram_io_tsi_ser_in_ready; // @[SerialAdapter.scala 104:21]
  assign SimSerial_serial_out_valid = ram_io_tsi_ser_out_valid; // @[SerialAdapter.scala 104:21]
  assign SimSerial_serial_out_bits = ram_io_tsi_ser_out_bits; // @[SerialAdapter.scala 104:21]
  assign simdram_clock = chiptop_axi4_mem_0_clock; // @[HarnessBinders.scala 188:20]
  assign simdram_reset = chiptop_axi4_mem_0_reset; // @[HarnessBinders.scala 189:20]
  assign simdram_axi_aw_valid = chiptop_axi4_mem_0_bits_aw_valid; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_aw_bits_id = chiptop_axi4_mem_0_bits_aw_bits_id; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_aw_bits_addr = chiptop_axi4_mem_0_bits_aw_bits_addr; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_aw_bits_len = chiptop_axi4_mem_0_bits_aw_bits_len; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_aw_bits_size = chiptop_axi4_mem_0_bits_aw_bits_size; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_aw_bits_burst = chiptop_axi4_mem_0_bits_aw_bits_burst; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_aw_bits_lock = chiptop_axi4_mem_0_bits_aw_bits_lock; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_aw_bits_cache = chiptop_axi4_mem_0_bits_aw_bits_cache; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_aw_bits_prot = chiptop_axi4_mem_0_bits_aw_bits_prot; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_aw_bits_qos = chiptop_axi4_mem_0_bits_aw_bits_qos; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_w_valid = chiptop_axi4_mem_0_bits_w_valid; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_w_bits_data = chiptop_axi4_mem_0_bits_w_bits_data; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_w_bits_strb = chiptop_axi4_mem_0_bits_w_bits_strb; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_w_bits_last = chiptop_axi4_mem_0_bits_w_bits_last; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_b_ready = chiptop_axi4_mem_0_bits_b_ready; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_ar_valid = chiptop_axi4_mem_0_bits_ar_valid; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_ar_bits_id = chiptop_axi4_mem_0_bits_ar_bits_id; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_ar_bits_addr = chiptop_axi4_mem_0_bits_ar_bits_addr; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_ar_bits_len = chiptop_axi4_mem_0_bits_ar_bits_len; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_ar_bits_size = chiptop_axi4_mem_0_bits_ar_bits_size; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_ar_bits_burst = chiptop_axi4_mem_0_bits_ar_bits_burst; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_ar_bits_lock = chiptop_axi4_mem_0_bits_ar_bits_lock; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_ar_bits_cache = chiptop_axi4_mem_0_bits_ar_bits_cache; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_ar_bits_prot = chiptop_axi4_mem_0_bits_ar_bits_prot; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_ar_bits_qos = chiptop_axi4_mem_0_bits_ar_bits_qos; // @[HarnessBinders.scala 169:18]
  assign simdram_axi_r_ready = chiptop_axi4_mem_0_bits_r_ready; // @[HarnessBinders.scala 169:18]
  assign uart_sim_0_clock = clock;
  assign uart_sim_0_reset = reset;
  assign uart_sim_0_io_uart_txd = chiptop_uart_0_txd; // @[UARTAdapter.scala 134:28]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4 & _T_2) begin
          $fwrite(32'h80000002,"*** FAILED *** (exit code = %d)\n",{{1'd0}, SimJTAG_exit[31:1]}); // @[Periphery.scala 235:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_4 & _T_2) begin
          $fatal; // @[Periphery.scala 236:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
