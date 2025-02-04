module TLDebugModuleInnerAsync(
  input  [2:0]  auto_dmiXing_in_a_mem_0_opcode,
  input  [2:0]  auto_dmiXing_in_a_mem_0_param,
  input  [1:0]  auto_dmiXing_in_a_mem_0_size,
  input         auto_dmiXing_in_a_mem_0_source,
  input  [8:0]  auto_dmiXing_in_a_mem_0_address,
  input  [3:0]  auto_dmiXing_in_a_mem_0_mask,
  input  [31:0] auto_dmiXing_in_a_mem_0_data,
  input         auto_dmiXing_in_a_mem_0_corrupt,
  output        auto_dmiXing_in_a_ridx,
  input         auto_dmiXing_in_a_widx,
  output        auto_dmiXing_in_a_safe_ridx_valid,
  input         auto_dmiXing_in_a_safe_widx_valid,
  input         auto_dmiXing_in_a_safe_source_reset_n,
  output        auto_dmiXing_in_a_safe_sink_reset_n,
  output [2:0]  auto_dmiXing_in_b_mem_0_opcode,
  output [1:0]  auto_dmiXing_in_b_mem_0_param,
  output [1:0]  auto_dmiXing_in_b_mem_0_size,
  output        auto_dmiXing_in_b_mem_0_source,
  output [8:0]  auto_dmiXing_in_b_mem_0_address,
  output [3:0]  auto_dmiXing_in_b_mem_0_mask,
  output [31:0] auto_dmiXing_in_b_mem_0_data,
  output        auto_dmiXing_in_b_mem_0_corrupt,
  input         auto_dmiXing_in_b_ridx,
  output        auto_dmiXing_in_b_widx,
  input         auto_dmiXing_in_b_safe_ridx_valid,
  output        auto_dmiXing_in_b_safe_widx_valid,
  output        auto_dmiXing_in_b_safe_source_reset_n,
  input         auto_dmiXing_in_b_safe_sink_reset_n,
  input  [2:0]  auto_dmiXing_in_c_mem_0_opcode,
  input  [2:0]  auto_dmiXing_in_c_mem_0_param,
  input  [1:0]  auto_dmiXing_in_c_mem_0_size,
  input         auto_dmiXing_in_c_mem_0_source,
  input  [8:0]  auto_dmiXing_in_c_mem_0_address,
  input  [31:0] auto_dmiXing_in_c_mem_0_data,
  input         auto_dmiXing_in_c_mem_0_corrupt,
  output        auto_dmiXing_in_c_ridx,
  input         auto_dmiXing_in_c_widx,
  output        auto_dmiXing_in_c_safe_ridx_valid,
  input         auto_dmiXing_in_c_safe_widx_valid,
  input         auto_dmiXing_in_c_safe_source_reset_n,
  output        auto_dmiXing_in_c_safe_sink_reset_n,
  output [2:0]  auto_dmiXing_in_d_mem_0_opcode,
  output [1:0]  auto_dmiXing_in_d_mem_0_param,
  output [1:0]  auto_dmiXing_in_d_mem_0_size,
  output        auto_dmiXing_in_d_mem_0_source,
  output        auto_dmiXing_in_d_mem_0_sink,
  output        auto_dmiXing_in_d_mem_0_denied,
  output [31:0] auto_dmiXing_in_d_mem_0_data,
  output        auto_dmiXing_in_d_mem_0_corrupt,
  input         auto_dmiXing_in_d_ridx,
  output        auto_dmiXing_in_d_widx,
  input         auto_dmiXing_in_d_safe_ridx_valid,
  output        auto_dmiXing_in_d_safe_widx_valid,
  output        auto_dmiXing_in_d_safe_source_reset_n,
  input         auto_dmiXing_in_d_safe_sink_reset_n,
  input         auto_dmiXing_in_e_mem_0_sink,
  output        auto_dmiXing_in_e_ridx,
  input         auto_dmiXing_in_e_widx,
  output        auto_dmiXing_in_e_safe_ridx_valid,
  input         auto_dmiXing_in_e_safe_widx_valid,
  input         auto_dmiXing_in_e_safe_source_reset_n,
  output        auto_dmiXing_in_e_safe_sink_reset_n,
  output        auto_dmInner_custom_in_addr,
  input         auto_dmInner_custom_in_ready,
  output        auto_dmInner_custom_in_valid,
  output        auto_dmInner_tl_in_a_ready,
  input         auto_dmInner_tl_in_a_valid,
  input  [2:0]  auto_dmInner_tl_in_a_bits_opcode,
  input  [2:0]  auto_dmInner_tl_in_a_bits_param,
  input  [1:0]  auto_dmInner_tl_in_a_bits_size,
  input  [8:0]  auto_dmInner_tl_in_a_bits_source,
  input  [11:0] auto_dmInner_tl_in_a_bits_address,
  input  [7:0]  auto_dmInner_tl_in_a_bits_mask,
  input  [63:0] auto_dmInner_tl_in_a_bits_data,
  input         auto_dmInner_tl_in_a_bits_corrupt,
  input         auto_dmInner_tl_in_d_ready,
  output        auto_dmInner_tl_in_d_valid,
  output [2:0]  auto_dmInner_tl_in_d_bits_opcode,
  output [1:0]  auto_dmInner_tl_in_d_bits_param,
  output [1:0]  auto_dmInner_tl_in_d_bits_size,
  output [8:0]  auto_dmInner_tl_in_d_bits_source,
  output        auto_dmInner_tl_in_d_bits_sink,
  output        auto_dmInner_tl_in_d_bits_denied,
  output [63:0] auto_dmInner_tl_in_d_bits_data,
  output        auto_dmInner_tl_in_d_bits_corrupt,
  input         io_debug_clock,
  input         io_debug_reset,
  input         io_tl_clock,
  input         io_tl_reset,
  input         io_dmactive,
  input         io_innerCtrl_mem_0_resumereq,
  input  [9:0]  io_innerCtrl_mem_0_hartsel,
  input         io_innerCtrl_mem_0_ackhavereset,
  input         io_innerCtrl_mem_0_hasel,
  input         io_innerCtrl_mem_0_hamask_0,
  input         io_innerCtrl_mem_0_hrmask_0,
  output        io_innerCtrl_ridx,
  input         io_innerCtrl_widx,
  output        io_innerCtrl_safe_ridx_valid,
  input         io_innerCtrl_safe_widx_valid,
  input         io_innerCtrl_safe_source_reset_n,
  output        io_innerCtrl_safe_sink_reset_n,
  input         io_debugUnavail_0,
  output        io_hgDebugInt_0,
  input         io_hartIsInReset_0,
  input         rf_reset
);
  wire  dmInner_clock; // @[Debug.scala 1741:27]
  wire  dmInner_reset; // @[Debug.scala 1741:27]
  wire  dmInner_auto_custom_in_addr; // @[Debug.scala 1741:27]
  wire  dmInner_auto_custom_in_ready; // @[Debug.scala 1741:27]
  wire  dmInner_auto_custom_in_valid; // @[Debug.scala 1741:27]
  wire  dmInner_auto_tl_in_a_ready; // @[Debug.scala 1741:27]
  wire  dmInner_auto_tl_in_a_valid; // @[Debug.scala 1741:27]
  wire [2:0] dmInner_auto_tl_in_a_bits_opcode; // @[Debug.scala 1741:27]
  wire [2:0] dmInner_auto_tl_in_a_bits_param; // @[Debug.scala 1741:27]
  wire [1:0] dmInner_auto_tl_in_a_bits_size; // @[Debug.scala 1741:27]
  wire [8:0] dmInner_auto_tl_in_a_bits_source; // @[Debug.scala 1741:27]
  wire [11:0] dmInner_auto_tl_in_a_bits_address; // @[Debug.scala 1741:27]
  wire [7:0] dmInner_auto_tl_in_a_bits_mask; // @[Debug.scala 1741:27]
  wire [63:0] dmInner_auto_tl_in_a_bits_data; // @[Debug.scala 1741:27]
  wire  dmInner_auto_tl_in_a_bits_corrupt; // @[Debug.scala 1741:27]
  wire  dmInner_auto_tl_in_d_ready; // @[Debug.scala 1741:27]
  wire  dmInner_auto_tl_in_d_valid; // @[Debug.scala 1741:27]
  wire [2:0] dmInner_auto_tl_in_d_bits_opcode; // @[Debug.scala 1741:27]
  wire [1:0] dmInner_auto_tl_in_d_bits_param; // @[Debug.scala 1741:27]
  wire [1:0] dmInner_auto_tl_in_d_bits_size; // @[Debug.scala 1741:27]
  wire [8:0] dmInner_auto_tl_in_d_bits_source; // @[Debug.scala 1741:27]
  wire  dmInner_auto_tl_in_d_bits_sink; // @[Debug.scala 1741:27]
  wire  dmInner_auto_tl_in_d_bits_denied; // @[Debug.scala 1741:27]
  wire [63:0] dmInner_auto_tl_in_d_bits_data; // @[Debug.scala 1741:27]
  wire  dmInner_auto_tl_in_d_bits_corrupt; // @[Debug.scala 1741:27]
  wire  dmInner_auto_dmi_in_a_ready; // @[Debug.scala 1741:27]
  wire  dmInner_auto_dmi_in_a_valid; // @[Debug.scala 1741:27]
  wire [2:0] dmInner_auto_dmi_in_a_bits_opcode; // @[Debug.scala 1741:27]
  wire [2:0] dmInner_auto_dmi_in_a_bits_param; // @[Debug.scala 1741:27]
  wire [1:0] dmInner_auto_dmi_in_a_bits_size; // @[Debug.scala 1741:27]
  wire  dmInner_auto_dmi_in_a_bits_source; // @[Debug.scala 1741:27]
  wire [8:0] dmInner_auto_dmi_in_a_bits_address; // @[Debug.scala 1741:27]
  wire [3:0] dmInner_auto_dmi_in_a_bits_mask; // @[Debug.scala 1741:27]
  wire [31:0] dmInner_auto_dmi_in_a_bits_data; // @[Debug.scala 1741:27]
  wire  dmInner_auto_dmi_in_a_bits_corrupt; // @[Debug.scala 1741:27]
  wire  dmInner_auto_dmi_in_d_ready; // @[Debug.scala 1741:27]
  wire  dmInner_auto_dmi_in_d_valid; // @[Debug.scala 1741:27]
  wire [2:0] dmInner_auto_dmi_in_d_bits_opcode; // @[Debug.scala 1741:27]
  wire [1:0] dmInner_auto_dmi_in_d_bits_param; // @[Debug.scala 1741:27]
  wire [1:0] dmInner_auto_dmi_in_d_bits_size; // @[Debug.scala 1741:27]
  wire  dmInner_auto_dmi_in_d_bits_source; // @[Debug.scala 1741:27]
  wire  dmInner_auto_dmi_in_d_bits_sink; // @[Debug.scala 1741:27]
  wire  dmInner_auto_dmi_in_d_bits_denied; // @[Debug.scala 1741:27]
  wire [31:0] dmInner_auto_dmi_in_d_bits_data; // @[Debug.scala 1741:27]
  wire  dmInner_auto_dmi_in_d_bits_corrupt; // @[Debug.scala 1741:27]
  wire  dmInner_io_dmactive; // @[Debug.scala 1741:27]
  wire  dmInner_io_innerCtrl_ready; // @[Debug.scala 1741:27]
  wire  dmInner_io_innerCtrl_valid; // @[Debug.scala 1741:27]
  wire  dmInner_io_innerCtrl_bits_resumereq; // @[Debug.scala 1741:27]
  wire [9:0] dmInner_io_innerCtrl_bits_hartsel; // @[Debug.scala 1741:27]
  wire  dmInner_io_innerCtrl_bits_ackhavereset; // @[Debug.scala 1741:27]
  wire  dmInner_io_innerCtrl_bits_hasel; // @[Debug.scala 1741:27]
  wire  dmInner_io_innerCtrl_bits_hamask_0; // @[Debug.scala 1741:27]
  wire  dmInner_io_innerCtrl_bits_hrmask_0; // @[Debug.scala 1741:27]
  wire  dmInner_io_debugUnavail_0; // @[Debug.scala 1741:27]
  wire  dmInner_io_hgDebugInt_0; // @[Debug.scala 1741:27]
  wire  dmInner_io_hartIsInReset_0; // @[Debug.scala 1741:27]
  wire  dmInner_io_tl_clock; // @[Debug.scala 1741:27]
  wire  dmInner_io_tl_reset; // @[Debug.scala 1741:27]
  wire  dmiXing_clock; // @[Debug.scala 1742:27]
  wire  dmiXing_reset; // @[Debug.scala 1742:27]
  wire [2:0] dmiXing_auto_in_a_mem_0_opcode; // @[Debug.scala 1742:27]
  wire [2:0] dmiXing_auto_in_a_mem_0_param; // @[Debug.scala 1742:27]
  wire [1:0] dmiXing_auto_in_a_mem_0_size; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_a_mem_0_source; // @[Debug.scala 1742:27]
  wire [8:0] dmiXing_auto_in_a_mem_0_address; // @[Debug.scala 1742:27]
  wire [3:0] dmiXing_auto_in_a_mem_0_mask; // @[Debug.scala 1742:27]
  wire [31:0] dmiXing_auto_in_a_mem_0_data; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_a_mem_0_corrupt; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_a_ridx; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_a_widx; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_a_safe_ridx_valid; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_a_safe_widx_valid; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_a_safe_source_reset_n; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_a_safe_sink_reset_n; // @[Debug.scala 1742:27]
  wire [2:0] dmiXing_auto_in_b_mem_0_opcode; // @[Debug.scala 1742:27]
  wire [1:0] dmiXing_auto_in_b_mem_0_param; // @[Debug.scala 1742:27]
  wire [1:0] dmiXing_auto_in_b_mem_0_size; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_b_mem_0_source; // @[Debug.scala 1742:27]
  wire [8:0] dmiXing_auto_in_b_mem_0_address; // @[Debug.scala 1742:27]
  wire [3:0] dmiXing_auto_in_b_mem_0_mask; // @[Debug.scala 1742:27]
  wire [31:0] dmiXing_auto_in_b_mem_0_data; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_b_mem_0_corrupt; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_b_ridx; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_b_widx; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_b_safe_ridx_valid; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_b_safe_widx_valid; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_b_safe_source_reset_n; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_b_safe_sink_reset_n; // @[Debug.scala 1742:27]
  wire [2:0] dmiXing_auto_in_c_mem_0_opcode; // @[Debug.scala 1742:27]
  wire [2:0] dmiXing_auto_in_c_mem_0_param; // @[Debug.scala 1742:27]
  wire [1:0] dmiXing_auto_in_c_mem_0_size; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_c_mem_0_source; // @[Debug.scala 1742:27]
  wire [8:0] dmiXing_auto_in_c_mem_0_address; // @[Debug.scala 1742:27]
  wire [31:0] dmiXing_auto_in_c_mem_0_data; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_c_mem_0_corrupt; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_c_ridx; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_c_widx; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_c_safe_ridx_valid; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_c_safe_widx_valid; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_c_safe_source_reset_n; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_c_safe_sink_reset_n; // @[Debug.scala 1742:27]
  wire [2:0] dmiXing_auto_in_d_mem_0_opcode; // @[Debug.scala 1742:27]
  wire [1:0] dmiXing_auto_in_d_mem_0_param; // @[Debug.scala 1742:27]
  wire [1:0] dmiXing_auto_in_d_mem_0_size; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_d_mem_0_source; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_d_mem_0_sink; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_d_mem_0_denied; // @[Debug.scala 1742:27]
  wire [31:0] dmiXing_auto_in_d_mem_0_data; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_d_mem_0_corrupt; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_d_ridx; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_d_widx; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_d_safe_ridx_valid; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_d_safe_widx_valid; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_d_safe_source_reset_n; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_d_safe_sink_reset_n; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_e_mem_0_sink; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_e_ridx; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_e_widx; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_e_safe_ridx_valid; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_e_safe_widx_valid; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_e_safe_source_reset_n; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_in_e_safe_sink_reset_n; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_out_a_ready; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_out_a_valid; // @[Debug.scala 1742:27]
  wire [2:0] dmiXing_auto_out_a_bits_opcode; // @[Debug.scala 1742:27]
  wire [2:0] dmiXing_auto_out_a_bits_param; // @[Debug.scala 1742:27]
  wire [1:0] dmiXing_auto_out_a_bits_size; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_out_a_bits_source; // @[Debug.scala 1742:27]
  wire [8:0] dmiXing_auto_out_a_bits_address; // @[Debug.scala 1742:27]
  wire [3:0] dmiXing_auto_out_a_bits_mask; // @[Debug.scala 1742:27]
  wire [31:0] dmiXing_auto_out_a_bits_data; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_out_a_bits_corrupt; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_out_d_ready; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_out_d_valid; // @[Debug.scala 1742:27]
  wire [2:0] dmiXing_auto_out_d_bits_opcode; // @[Debug.scala 1742:27]
  wire [1:0] dmiXing_auto_out_d_bits_param; // @[Debug.scala 1742:27]
  wire [1:0] dmiXing_auto_out_d_bits_size; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_out_d_bits_source; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_out_d_bits_sink; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_out_d_bits_denied; // @[Debug.scala 1742:27]
  wire [31:0] dmiXing_auto_out_d_bits_data; // @[Debug.scala 1742:27]
  wire  dmiXing_auto_out_d_bits_corrupt; // @[Debug.scala 1742:27]
  wire  dmactive_synced_dmactive_synced_dmactiveSync_clock; // @[ShiftReg.scala 45:23]
  wire  dmactive_synced_dmactive_synced_dmactiveSync_reset; // @[ShiftReg.scala 45:23]
  wire  dmactive_synced_dmactive_synced_dmactiveSync_io_d; // @[ShiftReg.scala 45:23]
  wire  dmactive_synced_dmactive_synced_dmactiveSync_io_q; // @[ShiftReg.scala 45:23]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_clock; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_reset; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_ready; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq; // @[AsyncQueue.scala 207:22]
  wire [9:0] dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hasel; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hamask_0; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_resumereq; // @[AsyncQueue.scala 207:22]
  wire [9:0] dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hartsel; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_ackhavereset; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hasel; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hamask_0; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hrmask_0; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_ridx; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_widx; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_ridx_valid; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_widx_valid; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_source_reset_n; // @[AsyncQueue.scala 207:22]
  wire  dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_sink_reset_n; // @[AsyncQueue.scala 207:22]
  TLDebugModuleInner dmInner ( // @[Debug.scala 1741:27]
    .clock(dmInner_clock),
    .reset(dmInner_reset),
    .auto_custom_in_addr(dmInner_auto_custom_in_addr),
    .auto_custom_in_ready(dmInner_auto_custom_in_ready),
    .auto_custom_in_valid(dmInner_auto_custom_in_valid),
    .auto_tl_in_a_ready(dmInner_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(dmInner_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(dmInner_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(dmInner_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(dmInner_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(dmInner_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(dmInner_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(dmInner_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(dmInner_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(dmInner_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(dmInner_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(dmInner_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(dmInner_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param(dmInner_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size(dmInner_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(dmInner_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_sink(dmInner_auto_tl_in_d_bits_sink),
    .auto_tl_in_d_bits_denied(dmInner_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data(dmInner_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt(dmInner_auto_tl_in_d_bits_corrupt),
    .auto_dmi_in_a_ready(dmInner_auto_dmi_in_a_ready),
    .auto_dmi_in_a_valid(dmInner_auto_dmi_in_a_valid),
    .auto_dmi_in_a_bits_opcode(dmInner_auto_dmi_in_a_bits_opcode),
    .auto_dmi_in_a_bits_param(dmInner_auto_dmi_in_a_bits_param),
    .auto_dmi_in_a_bits_size(dmInner_auto_dmi_in_a_bits_size),
    .auto_dmi_in_a_bits_source(dmInner_auto_dmi_in_a_bits_source),
    .auto_dmi_in_a_bits_address(dmInner_auto_dmi_in_a_bits_address),
    .auto_dmi_in_a_bits_mask(dmInner_auto_dmi_in_a_bits_mask),
    .auto_dmi_in_a_bits_data(dmInner_auto_dmi_in_a_bits_data),
    .auto_dmi_in_a_bits_corrupt(dmInner_auto_dmi_in_a_bits_corrupt),
    .auto_dmi_in_d_ready(dmInner_auto_dmi_in_d_ready),
    .auto_dmi_in_d_valid(dmInner_auto_dmi_in_d_valid),
    .auto_dmi_in_d_bits_opcode(dmInner_auto_dmi_in_d_bits_opcode),
    .auto_dmi_in_d_bits_param(dmInner_auto_dmi_in_d_bits_param),
    .auto_dmi_in_d_bits_size(dmInner_auto_dmi_in_d_bits_size),
    .auto_dmi_in_d_bits_source(dmInner_auto_dmi_in_d_bits_source),
    .auto_dmi_in_d_bits_sink(dmInner_auto_dmi_in_d_bits_sink),
    .auto_dmi_in_d_bits_denied(dmInner_auto_dmi_in_d_bits_denied),
    .auto_dmi_in_d_bits_data(dmInner_auto_dmi_in_d_bits_data),
    .auto_dmi_in_d_bits_corrupt(dmInner_auto_dmi_in_d_bits_corrupt),
    .io_dmactive(dmInner_io_dmactive),
    .io_innerCtrl_ready(dmInner_io_innerCtrl_ready),
    .io_innerCtrl_valid(dmInner_io_innerCtrl_valid),
    .io_innerCtrl_bits_resumereq(dmInner_io_innerCtrl_bits_resumereq),
    .io_innerCtrl_bits_hartsel(dmInner_io_innerCtrl_bits_hartsel),
    .io_innerCtrl_bits_ackhavereset(dmInner_io_innerCtrl_bits_ackhavereset),
    .io_innerCtrl_bits_hasel(dmInner_io_innerCtrl_bits_hasel),
    .io_innerCtrl_bits_hamask_0(dmInner_io_innerCtrl_bits_hamask_0),
    .io_innerCtrl_bits_hrmask_0(dmInner_io_innerCtrl_bits_hrmask_0),
    .io_debugUnavail_0(dmInner_io_debugUnavail_0),
    .io_hgDebugInt_0(dmInner_io_hgDebugInt_0),
    .io_hartIsInReset_0(dmInner_io_hartIsInReset_0),
    .io_tl_clock(dmInner_io_tl_clock),
    .io_tl_reset(dmInner_io_tl_reset)
  );
  TLAsyncCrossingSink dmiXing ( // @[Debug.scala 1742:27]
    .clock(dmiXing_clock),
    .reset(dmiXing_reset),
    .auto_in_a_mem_0_opcode(dmiXing_auto_in_a_mem_0_opcode),
    .auto_in_a_mem_0_param(dmiXing_auto_in_a_mem_0_param),
    .auto_in_a_mem_0_size(dmiXing_auto_in_a_mem_0_size),
    .auto_in_a_mem_0_source(dmiXing_auto_in_a_mem_0_source),
    .auto_in_a_mem_0_address(dmiXing_auto_in_a_mem_0_address),
    .auto_in_a_mem_0_mask(dmiXing_auto_in_a_mem_0_mask),
    .auto_in_a_mem_0_data(dmiXing_auto_in_a_mem_0_data),
    .auto_in_a_mem_0_corrupt(dmiXing_auto_in_a_mem_0_corrupt),
    .auto_in_a_ridx(dmiXing_auto_in_a_ridx),
    .auto_in_a_widx(dmiXing_auto_in_a_widx),
    .auto_in_a_safe_ridx_valid(dmiXing_auto_in_a_safe_ridx_valid),
    .auto_in_a_safe_widx_valid(dmiXing_auto_in_a_safe_widx_valid),
    .auto_in_a_safe_source_reset_n(dmiXing_auto_in_a_safe_source_reset_n),
    .auto_in_a_safe_sink_reset_n(dmiXing_auto_in_a_safe_sink_reset_n),
    .auto_in_b_mem_0_opcode(dmiXing_auto_in_b_mem_0_opcode),
    .auto_in_b_mem_0_param(dmiXing_auto_in_b_mem_0_param),
    .auto_in_b_mem_0_size(dmiXing_auto_in_b_mem_0_size),
    .auto_in_b_mem_0_source(dmiXing_auto_in_b_mem_0_source),
    .auto_in_b_mem_0_address(dmiXing_auto_in_b_mem_0_address),
    .auto_in_b_mem_0_mask(dmiXing_auto_in_b_mem_0_mask),
    .auto_in_b_mem_0_data(dmiXing_auto_in_b_mem_0_data),
    .auto_in_b_mem_0_corrupt(dmiXing_auto_in_b_mem_0_corrupt),
    .auto_in_b_ridx(dmiXing_auto_in_b_ridx),
    .auto_in_b_widx(dmiXing_auto_in_b_widx),
    .auto_in_b_safe_ridx_valid(dmiXing_auto_in_b_safe_ridx_valid),
    .auto_in_b_safe_widx_valid(dmiXing_auto_in_b_safe_widx_valid),
    .auto_in_b_safe_source_reset_n(dmiXing_auto_in_b_safe_source_reset_n),
    .auto_in_b_safe_sink_reset_n(dmiXing_auto_in_b_safe_sink_reset_n),
    .auto_in_c_mem_0_opcode(dmiXing_auto_in_c_mem_0_opcode),
    .auto_in_c_mem_0_param(dmiXing_auto_in_c_mem_0_param),
    .auto_in_c_mem_0_size(dmiXing_auto_in_c_mem_0_size),
    .auto_in_c_mem_0_source(dmiXing_auto_in_c_mem_0_source),
    .auto_in_c_mem_0_address(dmiXing_auto_in_c_mem_0_address),
    .auto_in_c_mem_0_data(dmiXing_auto_in_c_mem_0_data),
    .auto_in_c_mem_0_corrupt(dmiXing_auto_in_c_mem_0_corrupt),
    .auto_in_c_ridx(dmiXing_auto_in_c_ridx),
    .auto_in_c_widx(dmiXing_auto_in_c_widx),
    .auto_in_c_safe_ridx_valid(dmiXing_auto_in_c_safe_ridx_valid),
    .auto_in_c_safe_widx_valid(dmiXing_auto_in_c_safe_widx_valid),
    .auto_in_c_safe_source_reset_n(dmiXing_auto_in_c_safe_source_reset_n),
    .auto_in_c_safe_sink_reset_n(dmiXing_auto_in_c_safe_sink_reset_n),
    .auto_in_d_mem_0_opcode(dmiXing_auto_in_d_mem_0_opcode),
    .auto_in_d_mem_0_param(dmiXing_auto_in_d_mem_0_param),
    .auto_in_d_mem_0_size(dmiXing_auto_in_d_mem_0_size),
    .auto_in_d_mem_0_source(dmiXing_auto_in_d_mem_0_source),
    .auto_in_d_mem_0_sink(dmiXing_auto_in_d_mem_0_sink),
    .auto_in_d_mem_0_denied(dmiXing_auto_in_d_mem_0_denied),
    .auto_in_d_mem_0_data(dmiXing_auto_in_d_mem_0_data),
    .auto_in_d_mem_0_corrupt(dmiXing_auto_in_d_mem_0_corrupt),
    .auto_in_d_ridx(dmiXing_auto_in_d_ridx),
    .auto_in_d_widx(dmiXing_auto_in_d_widx),
    .auto_in_d_safe_ridx_valid(dmiXing_auto_in_d_safe_ridx_valid),
    .auto_in_d_safe_widx_valid(dmiXing_auto_in_d_safe_widx_valid),
    .auto_in_d_safe_source_reset_n(dmiXing_auto_in_d_safe_source_reset_n),
    .auto_in_d_safe_sink_reset_n(dmiXing_auto_in_d_safe_sink_reset_n),
    .auto_in_e_mem_0_sink(dmiXing_auto_in_e_mem_0_sink),
    .auto_in_e_ridx(dmiXing_auto_in_e_ridx),
    .auto_in_e_widx(dmiXing_auto_in_e_widx),
    .auto_in_e_safe_ridx_valid(dmiXing_auto_in_e_safe_ridx_valid),
    .auto_in_e_safe_widx_valid(dmiXing_auto_in_e_safe_widx_valid),
    .auto_in_e_safe_source_reset_n(dmiXing_auto_in_e_safe_source_reset_n),
    .auto_in_e_safe_sink_reset_n(dmiXing_auto_in_e_safe_sink_reset_n),
    .auto_out_a_ready(dmiXing_auto_out_a_ready),
    .auto_out_a_valid(dmiXing_auto_out_a_valid),
    .auto_out_a_bits_opcode(dmiXing_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(dmiXing_auto_out_a_bits_param),
    .auto_out_a_bits_size(dmiXing_auto_out_a_bits_size),
    .auto_out_a_bits_source(dmiXing_auto_out_a_bits_source),
    .auto_out_a_bits_address(dmiXing_auto_out_a_bits_address),
    .auto_out_a_bits_mask(dmiXing_auto_out_a_bits_mask),
    .auto_out_a_bits_data(dmiXing_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(dmiXing_auto_out_a_bits_corrupt),
    .auto_out_d_ready(dmiXing_auto_out_d_ready),
    .auto_out_d_valid(dmiXing_auto_out_d_valid),
    .auto_out_d_bits_opcode(dmiXing_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(dmiXing_auto_out_d_bits_param),
    .auto_out_d_bits_size(dmiXing_auto_out_d_bits_size),
    .auto_out_d_bits_source(dmiXing_auto_out_d_bits_source),
    .auto_out_d_bits_sink(dmiXing_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(dmiXing_auto_out_d_bits_denied),
    .auto_out_d_bits_data(dmiXing_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(dmiXing_auto_out_d_bits_corrupt)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 dmactive_synced_dmactive_synced_dmactiveSync ( // @[ShiftReg.scala 45:23]
    .clock(dmactive_synced_dmactive_synced_dmactiveSync_clock),
    .reset(dmactive_synced_dmactive_synced_dmactiveSync_reset),
    .io_d(dmactive_synced_dmactive_synced_dmactiveSync_io_d),
    .io_q(dmactive_synced_dmactive_synced_dmactiveSync_io_q)
  );
  AsyncQueueSink_2 dmactive_synced_dmInner_io_innerCtrl_sink ( // @[AsyncQueue.scala 207:22]
    .clock(dmactive_synced_dmInner_io_innerCtrl_sink_clock),
    .reset(dmactive_synced_dmInner_io_innerCtrl_sink_reset),
    .io_deq_ready(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_ready),
    .io_deq_valid(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid),
    .io_deq_bits_resumereq(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq),
    .io_deq_bits_hartsel(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel),
    .io_deq_bits_ackhavereset(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset),
    .io_deq_bits_hasel(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hasel),
    .io_deq_bits_hamask_0(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hamask_0),
    .io_deq_bits_hrmask_0(dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0),
    .io_async_mem_0_resumereq(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_resumereq),
    .io_async_mem_0_hartsel(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hartsel),
    .io_async_mem_0_ackhavereset(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_ackhavereset),
    .io_async_mem_0_hasel(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hasel),
    .io_async_mem_0_hamask_0(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hamask_0),
    .io_async_mem_0_hrmask_0(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hrmask_0),
    .io_async_ridx(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_ridx),
    .io_async_widx(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_widx),
    .io_async_safe_ridx_valid(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_sink_reset_n)
  );
  assign auto_dmiXing_in_a_ridx = dmiXing_auto_in_a_ridx; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_a_safe_ridx_valid = dmiXing_auto_in_a_safe_ridx_valid; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_a_safe_sink_reset_n = dmiXing_auto_in_a_safe_sink_reset_n; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_b_mem_0_opcode = dmiXing_auto_in_b_mem_0_opcode; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_b_mem_0_param = dmiXing_auto_in_b_mem_0_param; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_b_mem_0_size = dmiXing_auto_in_b_mem_0_size; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_b_mem_0_source = dmiXing_auto_in_b_mem_0_source; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_b_mem_0_address = dmiXing_auto_in_b_mem_0_address; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_b_mem_0_mask = dmiXing_auto_in_b_mem_0_mask; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_b_mem_0_data = dmiXing_auto_in_b_mem_0_data; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_b_mem_0_corrupt = dmiXing_auto_in_b_mem_0_corrupt; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_b_widx = dmiXing_auto_in_b_widx; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_b_safe_widx_valid = dmiXing_auto_in_b_safe_widx_valid; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_b_safe_source_reset_n = dmiXing_auto_in_b_safe_source_reset_n; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_c_ridx = dmiXing_auto_in_c_ridx; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_c_safe_ridx_valid = dmiXing_auto_in_c_safe_ridx_valid; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_c_safe_sink_reset_n = dmiXing_auto_in_c_safe_sink_reset_n; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_d_mem_0_opcode = dmiXing_auto_in_d_mem_0_opcode; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_d_mem_0_param = dmiXing_auto_in_d_mem_0_param; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_d_mem_0_size = dmiXing_auto_in_d_mem_0_size; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_d_mem_0_source = dmiXing_auto_in_d_mem_0_source; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_d_mem_0_sink = dmiXing_auto_in_d_mem_0_sink; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_d_mem_0_denied = dmiXing_auto_in_d_mem_0_denied; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_d_mem_0_data = dmiXing_auto_in_d_mem_0_data; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_d_mem_0_corrupt = dmiXing_auto_in_d_mem_0_corrupt; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_d_widx = dmiXing_auto_in_d_widx; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_d_safe_widx_valid = dmiXing_auto_in_d_safe_widx_valid; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_d_safe_source_reset_n = dmiXing_auto_in_d_safe_source_reset_n; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_e_ridx = dmiXing_auto_in_e_ridx; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_e_safe_ridx_valid = dmiXing_auto_in_e_safe_ridx_valid; // @[LazyModule.scala 309:16]
  assign auto_dmiXing_in_e_safe_sink_reset_n = dmiXing_auto_in_e_safe_sink_reset_n; // @[LazyModule.scala 309:16]
  assign auto_dmInner_custom_in_addr = dmInner_auto_custom_in_addr; // @[LazyModule.scala 309:16]
  assign auto_dmInner_custom_in_valid = dmInner_auto_custom_in_valid; // @[LazyModule.scala 309:16]
  assign auto_dmInner_tl_in_a_ready = dmInner_auto_tl_in_a_ready; // @[LazyModule.scala 309:16]
  assign auto_dmInner_tl_in_d_valid = dmInner_auto_tl_in_d_valid; // @[LazyModule.scala 309:16]
  assign auto_dmInner_tl_in_d_bits_opcode = dmInner_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 309:16]
  assign auto_dmInner_tl_in_d_bits_param = dmInner_auto_tl_in_d_bits_param; // @[LazyModule.scala 309:16]
  assign auto_dmInner_tl_in_d_bits_size = dmInner_auto_tl_in_d_bits_size; // @[LazyModule.scala 309:16]
  assign auto_dmInner_tl_in_d_bits_source = dmInner_auto_tl_in_d_bits_source; // @[LazyModule.scala 309:16]
  assign auto_dmInner_tl_in_d_bits_sink = dmInner_auto_tl_in_d_bits_sink; // @[LazyModule.scala 309:16]
  assign auto_dmInner_tl_in_d_bits_denied = dmInner_auto_tl_in_d_bits_denied; // @[LazyModule.scala 309:16]
  assign auto_dmInner_tl_in_d_bits_data = dmInner_auto_tl_in_d_bits_data; // @[LazyModule.scala 309:16]
  assign auto_dmInner_tl_in_d_bits_corrupt = dmInner_auto_tl_in_d_bits_corrupt; // @[LazyModule.scala 309:16]
  assign io_innerCtrl_ridx = dmactive_synced_dmInner_io_innerCtrl_sink_io_async_ridx; // @[AsyncQueue.scala 208:19]
  assign io_innerCtrl_safe_ridx_valid = dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_ridx_valid; // @[AsyncQueue.scala 208:19]
  assign io_innerCtrl_safe_sink_reset_n = dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_sink_reset_n; // @[AsyncQueue.scala 208:19]
  assign io_hgDebugInt_0 = dmInner_io_hgDebugInt_0; // @[Debug.scala 1789:21]
  assign dmInner_clock = io_debug_clock; // @[Debug.scala 1782:28]
  assign dmInner_reset = io_debug_reset; // @[Debug.scala 1783:28]
  assign dmInner_auto_custom_in_ready = auto_dmInner_custom_in_ready; // @[LazyModule.scala 309:16]
  assign dmInner_auto_tl_in_a_valid = auto_dmInner_tl_in_a_valid; // @[LazyModule.scala 309:16]
  assign dmInner_auto_tl_in_a_bits_opcode = auto_dmInner_tl_in_a_bits_opcode; // @[LazyModule.scala 309:16]
  assign dmInner_auto_tl_in_a_bits_param = auto_dmInner_tl_in_a_bits_param; // @[LazyModule.scala 309:16]
  assign dmInner_auto_tl_in_a_bits_size = auto_dmInner_tl_in_a_bits_size; // @[LazyModule.scala 309:16]
  assign dmInner_auto_tl_in_a_bits_source = auto_dmInner_tl_in_a_bits_source; // @[LazyModule.scala 309:16]
  assign dmInner_auto_tl_in_a_bits_address = auto_dmInner_tl_in_a_bits_address; // @[LazyModule.scala 309:16]
  assign dmInner_auto_tl_in_a_bits_mask = auto_dmInner_tl_in_a_bits_mask; // @[LazyModule.scala 309:16]
  assign dmInner_auto_tl_in_a_bits_data = auto_dmInner_tl_in_a_bits_data; // @[LazyModule.scala 309:16]
  assign dmInner_auto_tl_in_a_bits_corrupt = auto_dmInner_tl_in_a_bits_corrupt; // @[LazyModule.scala 309:16]
  assign dmInner_auto_tl_in_d_ready = auto_dmInner_tl_in_d_ready; // @[LazyModule.scala 309:16]
  assign dmInner_auto_dmi_in_a_valid = dmiXing_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign dmInner_auto_dmi_in_a_bits_opcode = dmiXing_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign dmInner_auto_dmi_in_a_bits_param = dmiXing_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign dmInner_auto_dmi_in_a_bits_size = dmiXing_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign dmInner_auto_dmi_in_a_bits_source = dmiXing_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign dmInner_auto_dmi_in_a_bits_address = dmiXing_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign dmInner_auto_dmi_in_a_bits_mask = dmiXing_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign dmInner_auto_dmi_in_a_bits_data = dmiXing_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign dmInner_auto_dmi_in_a_bits_corrupt = dmiXing_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign dmInner_auto_dmi_in_d_ready = dmiXing_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign dmInner_io_dmactive = dmactive_synced_dmactive_synced_dmactiveSync_io_q; // @[ShiftReg.scala 48:24 ShiftReg.scala 48:24]
  assign dmInner_io_innerCtrl_valid = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_valid; // @[Debug.scala 1787:35]
  assign dmInner_io_innerCtrl_bits_resumereq = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_resumereq; // @[Debug.scala 1787:35]
  assign dmInner_io_innerCtrl_bits_hartsel = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hartsel; // @[Debug.scala 1787:35]
  assign dmInner_io_innerCtrl_bits_ackhavereset = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_ackhavereset; // @[Debug.scala 1787:35]
  assign dmInner_io_innerCtrl_bits_hasel = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hasel; // @[Debug.scala 1787:35]
  assign dmInner_io_innerCtrl_bits_hamask_0 = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hamask_0; // @[Debug.scala 1787:35]
  assign dmInner_io_innerCtrl_bits_hrmask_0 = dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_bits_hrmask_0; // @[Debug.scala 1787:35]
  assign dmInner_io_debugUnavail_0 = io_debugUnavail_0; // @[Debug.scala 1788:38]
  assign dmInner_io_hartIsInReset_0 = io_hartIsInReset_0; // @[Debug.scala 1791:39]
  assign dmInner_io_tl_clock = io_tl_clock; // @[Debug.scala 1784:34]
  assign dmInner_io_tl_reset = io_tl_reset; // @[Debug.scala 1785:34]
  assign dmiXing_clock = io_debug_clock; // @[LazyModule.scala 350:31 Debug.scala 1777:16]
  assign dmiXing_reset = io_debug_reset; // @[LazyModule.scala 352:31 Debug.scala 1778:16]
  assign dmiXing_auto_in_a_mem_0_opcode = auto_dmiXing_in_a_mem_0_opcode; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_a_mem_0_param = auto_dmiXing_in_a_mem_0_param; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_a_mem_0_size = auto_dmiXing_in_a_mem_0_size; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_a_mem_0_source = auto_dmiXing_in_a_mem_0_source; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_a_mem_0_address = auto_dmiXing_in_a_mem_0_address; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_a_mem_0_mask = auto_dmiXing_in_a_mem_0_mask; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_a_mem_0_data = auto_dmiXing_in_a_mem_0_data; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_a_mem_0_corrupt = auto_dmiXing_in_a_mem_0_corrupt; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_a_widx = auto_dmiXing_in_a_widx; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_a_safe_widx_valid = auto_dmiXing_in_a_safe_widx_valid; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_a_safe_source_reset_n = auto_dmiXing_in_a_safe_source_reset_n; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_b_ridx = auto_dmiXing_in_b_ridx; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_b_safe_ridx_valid = auto_dmiXing_in_b_safe_ridx_valid; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_b_safe_sink_reset_n = auto_dmiXing_in_b_safe_sink_reset_n; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_c_mem_0_opcode = auto_dmiXing_in_c_mem_0_opcode; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_c_mem_0_param = auto_dmiXing_in_c_mem_0_param; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_c_mem_0_size = auto_dmiXing_in_c_mem_0_size; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_c_mem_0_source = auto_dmiXing_in_c_mem_0_source; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_c_mem_0_address = auto_dmiXing_in_c_mem_0_address; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_c_mem_0_data = auto_dmiXing_in_c_mem_0_data; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_c_mem_0_corrupt = auto_dmiXing_in_c_mem_0_corrupt; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_c_widx = auto_dmiXing_in_c_widx; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_c_safe_widx_valid = auto_dmiXing_in_c_safe_widx_valid; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_c_safe_source_reset_n = auto_dmiXing_in_c_safe_source_reset_n; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_d_ridx = auto_dmiXing_in_d_ridx; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_d_safe_ridx_valid = auto_dmiXing_in_d_safe_ridx_valid; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_d_safe_sink_reset_n = auto_dmiXing_in_d_safe_sink_reset_n; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_e_mem_0_sink = auto_dmiXing_in_e_mem_0_sink; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_e_widx = auto_dmiXing_in_e_widx; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_e_safe_widx_valid = auto_dmiXing_in_e_safe_widx_valid; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_in_e_safe_source_reset_n = auto_dmiXing_in_e_safe_source_reset_n; // @[LazyModule.scala 309:16]
  assign dmiXing_auto_out_a_ready = dmInner_auto_dmi_in_a_ready; // @[LazyModule.scala 296:16]
  assign dmiXing_auto_out_d_valid = dmInner_auto_dmi_in_d_valid; // @[LazyModule.scala 296:16]
  assign dmiXing_auto_out_d_bits_opcode = dmInner_auto_dmi_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign dmiXing_auto_out_d_bits_param = dmInner_auto_dmi_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign dmiXing_auto_out_d_bits_size = dmInner_auto_dmi_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign dmiXing_auto_out_d_bits_source = dmInner_auto_dmi_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign dmiXing_auto_out_d_bits_sink = dmInner_auto_dmi_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign dmiXing_auto_out_d_bits_denied = dmInner_auto_dmi_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign dmiXing_auto_out_d_bits_data = dmInner_auto_dmi_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign dmiXing_auto_out_d_bits_corrupt = dmInner_auto_dmi_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign dmactive_synced_dmactive_synced_dmactiveSync_clock = io_debug_clock; // @[LazyModule.scala 350:31 Debug.scala 1777:16]
  assign dmactive_synced_dmactive_synced_dmactiveSync_reset = io_debug_reset; // @[LazyModule.scala 352:31 Debug.scala 1778:16]
  assign dmactive_synced_dmactive_synced_dmactiveSync_io_d = io_dmactive; // @[ShiftReg.scala 47:16]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_clock = io_debug_clock; // @[LazyModule.scala 350:31 Debug.scala 1777:16]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_reset = io_debug_reset; // @[LazyModule.scala 352:31 Debug.scala 1778:16]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_deq_ready = dmInner_io_innerCtrl_ready; // @[Debug.scala 1787:35]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_resumereq = io_innerCtrl_mem_0_resumereq; // @[AsyncQueue.scala 208:19]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hartsel = io_innerCtrl_mem_0_hartsel; // @[AsyncQueue.scala 208:19]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_ackhavereset = io_innerCtrl_mem_0_ackhavereset; // @[AsyncQueue.scala 208:19]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hasel = io_innerCtrl_mem_0_hasel; // @[AsyncQueue.scala 208:19]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hamask_0 = io_innerCtrl_mem_0_hamask_0; // @[AsyncQueue.scala 208:19]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_mem_0_hrmask_0 = io_innerCtrl_mem_0_hrmask_0; // @[AsyncQueue.scala 208:19]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_widx = io_innerCtrl_widx; // @[AsyncQueue.scala 208:19]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_widx_valid = io_innerCtrl_safe_widx_valid; // @[AsyncQueue.scala 208:19]
  assign dmactive_synced_dmInner_io_innerCtrl_sink_io_async_safe_source_reset_n = io_innerCtrl_safe_source_reset_n; // @[AsyncQueue.scala 208:19]
endmodule
