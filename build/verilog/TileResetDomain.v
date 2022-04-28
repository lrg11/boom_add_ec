module TileResetDomain(
  output        auto_boom_tile_trace_out_0_valid,
  output [39:0] auto_boom_tile_trace_out_0_iaddr,
  output [31:0] auto_boom_tile_trace_out_0_insn,
  output [2:0]  auto_boom_tile_trace_out_0_priv,
  output        auto_boom_tile_trace_out_0_exception,
  output        auto_boom_tile_trace_out_0_interrupt,
  output [63:0] auto_boom_tile_trace_out_0_cause,
  output [39:0] auto_boom_tile_trace_out_0_tval,
  output [63:0] auto_boom_tile_trace_out_0_wdata,
  output        auto_boom_tile_trace_out_1_valid,
  output [39:0] auto_boom_tile_trace_out_1_iaddr,
  output [31:0] auto_boom_tile_trace_out_1_insn,
  output [2:0]  auto_boom_tile_trace_out_1_priv,
  output        auto_boom_tile_trace_out_1_exception,
  output        auto_boom_tile_trace_out_1_interrupt,
  output [63:0] auto_boom_tile_trace_out_1_cause,
  output [39:0] auto_boom_tile_trace_out_1_tval,
  output [63:0] auto_boom_tile_trace_out_1_wdata,
  output        auto_boom_tile_broadcast_out_0_valid,
  output [39:0] auto_boom_tile_broadcast_out_0_iaddr,
  output [31:0] auto_boom_tile_broadcast_out_0_insn,
  output [2:0]  auto_boom_tile_broadcast_out_0_priv,
  output        auto_boom_tile_broadcast_out_0_exception,
  output        auto_boom_tile_broadcast_out_0_interrupt,
  output [63:0] auto_boom_tile_broadcast_out_0_cause,
  output [39:0] auto_boom_tile_broadcast_out_0_tval,
  output        auto_boom_tile_broadcast_out_1_valid,
  output [39:0] auto_boom_tile_broadcast_out_1_iaddr,
  output [31:0] auto_boom_tile_broadcast_out_1_insn,
  output [2:0]  auto_boom_tile_broadcast_out_1_priv,
  output        auto_boom_tile_broadcast_out_1_exception,
  output        auto_boom_tile_broadcast_out_1_interrupt,
  output [63:0] auto_boom_tile_broadcast_out_1_cause,
  output [39:0] auto_boom_tile_broadcast_out_1_tval,
  output        auto_boom_tile_wfi_out_0,
  output        auto_boom_tile_cease_out_0,
  output        auto_boom_tile_halt_out_0,
  input         auto_boom_tile_int_local_in_3_0,
  input         auto_boom_tile_int_local_in_2_0,
  input         auto_boom_tile_int_local_in_1_0,
  input         auto_boom_tile_int_local_in_1_1,
  input         auto_boom_tile_int_local_in_0_0,
  output        auto_boom_tile_trace_core_source_out_group_0_iretire,
  output [31:0] auto_boom_tile_trace_core_source_out_group_0_iaddr,
  output [3:0]  auto_boom_tile_trace_core_source_out_group_0_itype,
  output        auto_boom_tile_trace_core_source_out_group_0_ilastsize,
  output [3:0]  auto_boom_tile_trace_core_source_out_priv,
  output [31:0] auto_boom_tile_trace_core_source_out_tval,
  output [31:0] auto_boom_tile_trace_core_source_out_cause,
  input         auto_boom_tile_nmi_in_rnmi,
  input  [31:0] auto_boom_tile_nmi_in_rnmi_interrupt_vector,
  input  [31:0] auto_boom_tile_nmi_in_rnmi_exception_vector,
  input         auto_boom_tile_nmi_in_unmi,
  input  [31:0] auto_boom_tile_nmi_in_unmi_interrupt_vector,
  input  [31:0] auto_boom_tile_nmi_in_unmi_exception_vector,
  input  [31:0] auto_boom_tile_reset_vector_in,
  input         auto_boom_tile_hartid_in,
  input         auto_boom_tile_tl_other_masters_out_a_ready,
  output        auto_boom_tile_tl_other_masters_out_a_valid,
  output [2:0]  auto_boom_tile_tl_other_masters_out_a_bits_opcode,
  output [2:0]  auto_boom_tile_tl_other_masters_out_a_bits_param,
  output [3:0]  auto_boom_tile_tl_other_masters_out_a_bits_size,
  output [2:0]  auto_boom_tile_tl_other_masters_out_a_bits_source,
  output [31:0] auto_boom_tile_tl_other_masters_out_a_bits_address,
  output [7:0]  auto_boom_tile_tl_other_masters_out_a_bits_mask,
  output [63:0] auto_boom_tile_tl_other_masters_out_a_bits_data,
  output        auto_boom_tile_tl_other_masters_out_a_bits_corrupt,
  output        auto_boom_tile_tl_other_masters_out_b_ready,
  input         auto_boom_tile_tl_other_masters_out_b_valid,
  input  [2:0]  auto_boom_tile_tl_other_masters_out_b_bits_opcode,
  input  [1:0]  auto_boom_tile_tl_other_masters_out_b_bits_param,
  input  [3:0]  auto_boom_tile_tl_other_masters_out_b_bits_size,
  input  [2:0]  auto_boom_tile_tl_other_masters_out_b_bits_source,
  input  [31:0] auto_boom_tile_tl_other_masters_out_b_bits_address,
  input  [7:0]  auto_boom_tile_tl_other_masters_out_b_bits_mask,
  input  [63:0] auto_boom_tile_tl_other_masters_out_b_bits_data,
  input         auto_boom_tile_tl_other_masters_out_b_bits_corrupt,
  input         auto_boom_tile_tl_other_masters_out_c_ready,
  output        auto_boom_tile_tl_other_masters_out_c_valid,
  output [2:0]  auto_boom_tile_tl_other_masters_out_c_bits_opcode,
  output [2:0]  auto_boom_tile_tl_other_masters_out_c_bits_param,
  output [3:0]  auto_boom_tile_tl_other_masters_out_c_bits_size,
  output [2:0]  auto_boom_tile_tl_other_masters_out_c_bits_source,
  output [31:0] auto_boom_tile_tl_other_masters_out_c_bits_address,
  output [63:0] auto_boom_tile_tl_other_masters_out_c_bits_data,
  output        auto_boom_tile_tl_other_masters_out_c_bits_corrupt,
  output        auto_boom_tile_tl_other_masters_out_d_ready,
  input         auto_boom_tile_tl_other_masters_out_d_valid,
  input  [2:0]  auto_boom_tile_tl_other_masters_out_d_bits_opcode,
  input  [1:0]  auto_boom_tile_tl_other_masters_out_d_bits_param,
  input  [3:0]  auto_boom_tile_tl_other_masters_out_d_bits_size,
  input  [2:0]  auto_boom_tile_tl_other_masters_out_d_bits_source,
  input  [1:0]  auto_boom_tile_tl_other_masters_out_d_bits_sink,
  input         auto_boom_tile_tl_other_masters_out_d_bits_denied,
  input  [63:0] auto_boom_tile_tl_other_masters_out_d_bits_data,
  input         auto_boom_tile_tl_other_masters_out_d_bits_corrupt,
  input         auto_boom_tile_tl_other_masters_out_e_ready,
  output        auto_boom_tile_tl_other_masters_out_e_valid,
  output [1:0]  auto_boom_tile_tl_other_masters_out_e_bits_sink,
  input         auto_clock_in_clock,
  input         auto_clock_in_reset,
  output        clock,
  output        reset
);
  wire  boom_tile_clock; // @[HasTiles.scala 253:53]
  wire  boom_tile_reset; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_trace_out_0_valid; // @[HasTiles.scala 253:53]
  wire [39:0] boom_tile_auto_trace_out_0_iaddr; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_trace_out_0_insn; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_trace_out_0_priv; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_trace_out_0_exception; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_trace_out_0_interrupt; // @[HasTiles.scala 253:53]
  wire [63:0] boom_tile_auto_trace_out_0_cause; // @[HasTiles.scala 253:53]
  wire [39:0] boom_tile_auto_trace_out_0_tval; // @[HasTiles.scala 253:53]
  wire [63:0] boom_tile_auto_trace_out_0_wdata; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_trace_out_1_valid; // @[HasTiles.scala 253:53]
  wire [39:0] boom_tile_auto_trace_out_1_iaddr; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_trace_out_1_insn; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_trace_out_1_priv; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_trace_out_1_exception; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_trace_out_1_interrupt; // @[HasTiles.scala 253:53]
  wire [63:0] boom_tile_auto_trace_out_1_cause; // @[HasTiles.scala 253:53]
  wire [39:0] boom_tile_auto_trace_out_1_tval; // @[HasTiles.scala 253:53]
  wire [63:0] boom_tile_auto_trace_out_1_wdata; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_broadcast_out_0_valid; // @[HasTiles.scala 253:53]
  wire [39:0] boom_tile_auto_broadcast_out_0_iaddr; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_broadcast_out_0_insn; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_broadcast_out_0_priv; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_broadcast_out_0_exception; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_broadcast_out_0_interrupt; // @[HasTiles.scala 253:53]
  wire [63:0] boom_tile_auto_broadcast_out_0_cause; // @[HasTiles.scala 253:53]
  wire [39:0] boom_tile_auto_broadcast_out_0_tval; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_broadcast_out_1_valid; // @[HasTiles.scala 253:53]
  wire [39:0] boom_tile_auto_broadcast_out_1_iaddr; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_broadcast_out_1_insn; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_broadcast_out_1_priv; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_broadcast_out_1_exception; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_broadcast_out_1_interrupt; // @[HasTiles.scala 253:53]
  wire [63:0] boom_tile_auto_broadcast_out_1_cause; // @[HasTiles.scala 253:53]
  wire [39:0] boom_tile_auto_broadcast_out_1_tval; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_wfi_out_0; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_cease_out_0; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_halt_out_0; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_int_local_in_3_0; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_int_local_in_2_0; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_int_local_in_1_0; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_int_local_in_1_1; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_int_local_in_0_0; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_trace_core_source_out_group_0_iretire; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_trace_core_source_out_group_0_iaddr; // @[HasTiles.scala 253:53]
  wire [3:0] boom_tile_auto_trace_core_source_out_group_0_itype; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_trace_core_source_out_group_0_ilastsize; // @[HasTiles.scala 253:53]
  wire [3:0] boom_tile_auto_trace_core_source_out_priv; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_trace_core_source_out_tval; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_trace_core_source_out_cause; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_nmi_in_rnmi; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_nmi_in_rnmi_interrupt_vector; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_nmi_in_rnmi_exception_vector; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_nmi_in_unmi; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_nmi_in_unmi_interrupt_vector; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_nmi_in_unmi_exception_vector; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_reset_vector_in; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_hartid_in; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_a_ready; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_a_valid; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_tl_other_masters_out_a_bits_opcode; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_tl_other_masters_out_a_bits_param; // @[HasTiles.scala 253:53]
  wire [3:0] boom_tile_auto_tl_other_masters_out_a_bits_size; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_tl_other_masters_out_a_bits_source; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_tl_other_masters_out_a_bits_address; // @[HasTiles.scala 253:53]
  wire [7:0] boom_tile_auto_tl_other_masters_out_a_bits_mask; // @[HasTiles.scala 253:53]
  wire [63:0] boom_tile_auto_tl_other_masters_out_a_bits_data; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_a_bits_corrupt; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_b_ready; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_b_valid; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_tl_other_masters_out_b_bits_opcode; // @[HasTiles.scala 253:53]
  wire [1:0] boom_tile_auto_tl_other_masters_out_b_bits_param; // @[HasTiles.scala 253:53]
  wire [3:0] boom_tile_auto_tl_other_masters_out_b_bits_size; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_tl_other_masters_out_b_bits_source; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_tl_other_masters_out_b_bits_address; // @[HasTiles.scala 253:53]
  wire [7:0] boom_tile_auto_tl_other_masters_out_b_bits_mask; // @[HasTiles.scala 253:53]
  wire [63:0] boom_tile_auto_tl_other_masters_out_b_bits_data; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_b_bits_corrupt; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_c_ready; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_c_valid; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_tl_other_masters_out_c_bits_opcode; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_tl_other_masters_out_c_bits_param; // @[HasTiles.scala 253:53]
  wire [3:0] boom_tile_auto_tl_other_masters_out_c_bits_size; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_tl_other_masters_out_c_bits_source; // @[HasTiles.scala 253:53]
  wire [31:0] boom_tile_auto_tl_other_masters_out_c_bits_address; // @[HasTiles.scala 253:53]
  wire [63:0] boom_tile_auto_tl_other_masters_out_c_bits_data; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_c_bits_corrupt; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_d_ready; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_d_valid; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_tl_other_masters_out_d_bits_opcode; // @[HasTiles.scala 253:53]
  wire [1:0] boom_tile_auto_tl_other_masters_out_d_bits_param; // @[HasTiles.scala 253:53]
  wire [3:0] boom_tile_auto_tl_other_masters_out_d_bits_size; // @[HasTiles.scala 253:53]
  wire [2:0] boom_tile_auto_tl_other_masters_out_d_bits_source; // @[HasTiles.scala 253:53]
  wire [1:0] boom_tile_auto_tl_other_masters_out_d_bits_sink; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_d_bits_denied; // @[HasTiles.scala 253:53]
  wire [63:0] boom_tile_auto_tl_other_masters_out_d_bits_data; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_d_bits_corrupt; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_e_ready; // @[HasTiles.scala 253:53]
  wire  boom_tile_auto_tl_other_masters_out_e_valid; // @[HasTiles.scala 253:53]
  wire [1:0] boom_tile_auto_tl_other_masters_out_e_bits_sink; // @[HasTiles.scala 253:53]
  BoomTile boom_tile ( // @[HasTiles.scala 253:53]
    .clock(boom_tile_clock),
    .reset(boom_tile_reset),
    .auto_trace_out_0_valid(boom_tile_auto_trace_out_0_valid),
    .auto_trace_out_0_iaddr(boom_tile_auto_trace_out_0_iaddr),
    .auto_trace_out_0_insn(boom_tile_auto_trace_out_0_insn),
    .auto_trace_out_0_priv(boom_tile_auto_trace_out_0_priv),
    .auto_trace_out_0_exception(boom_tile_auto_trace_out_0_exception),
    .auto_trace_out_0_interrupt(boom_tile_auto_trace_out_0_interrupt),
    .auto_trace_out_0_cause(boom_tile_auto_trace_out_0_cause),
    .auto_trace_out_0_tval(boom_tile_auto_trace_out_0_tval),
    .auto_trace_out_0_wdata(boom_tile_auto_trace_out_0_wdata),
    .auto_trace_out_1_valid(boom_tile_auto_trace_out_1_valid),
    .auto_trace_out_1_iaddr(boom_tile_auto_trace_out_1_iaddr),
    .auto_trace_out_1_insn(boom_tile_auto_trace_out_1_insn),
    .auto_trace_out_1_priv(boom_tile_auto_trace_out_1_priv),
    .auto_trace_out_1_exception(boom_tile_auto_trace_out_1_exception),
    .auto_trace_out_1_interrupt(boom_tile_auto_trace_out_1_interrupt),
    .auto_trace_out_1_cause(boom_tile_auto_trace_out_1_cause),
    .auto_trace_out_1_tval(boom_tile_auto_trace_out_1_tval),
    .auto_trace_out_1_wdata(boom_tile_auto_trace_out_1_wdata),
    .auto_broadcast_out_0_valid(boom_tile_auto_broadcast_out_0_valid),
    .auto_broadcast_out_0_iaddr(boom_tile_auto_broadcast_out_0_iaddr),
    .auto_broadcast_out_0_insn(boom_tile_auto_broadcast_out_0_insn),
    .auto_broadcast_out_0_priv(boom_tile_auto_broadcast_out_0_priv),
    .auto_broadcast_out_0_exception(boom_tile_auto_broadcast_out_0_exception),
    .auto_broadcast_out_0_interrupt(boom_tile_auto_broadcast_out_0_interrupt),
    .auto_broadcast_out_0_cause(boom_tile_auto_broadcast_out_0_cause),
    .auto_broadcast_out_0_tval(boom_tile_auto_broadcast_out_0_tval),
    .auto_broadcast_out_1_valid(boom_tile_auto_broadcast_out_1_valid),
    .auto_broadcast_out_1_iaddr(boom_tile_auto_broadcast_out_1_iaddr),
    .auto_broadcast_out_1_insn(boom_tile_auto_broadcast_out_1_insn),
    .auto_broadcast_out_1_priv(boom_tile_auto_broadcast_out_1_priv),
    .auto_broadcast_out_1_exception(boom_tile_auto_broadcast_out_1_exception),
    .auto_broadcast_out_1_interrupt(boom_tile_auto_broadcast_out_1_interrupt),
    .auto_broadcast_out_1_cause(boom_tile_auto_broadcast_out_1_cause),
    .auto_broadcast_out_1_tval(boom_tile_auto_broadcast_out_1_tval),
    .auto_wfi_out_0(boom_tile_auto_wfi_out_0),
    .auto_cease_out_0(boom_tile_auto_cease_out_0),
    .auto_halt_out_0(boom_tile_auto_halt_out_0),
    .auto_int_local_in_3_0(boom_tile_auto_int_local_in_3_0),
    .auto_int_local_in_2_0(boom_tile_auto_int_local_in_2_0),
    .auto_int_local_in_1_0(boom_tile_auto_int_local_in_1_0),
    .auto_int_local_in_1_1(boom_tile_auto_int_local_in_1_1),
    .auto_int_local_in_0_0(boom_tile_auto_int_local_in_0_0),
    .auto_trace_core_source_out_group_0_iretire(boom_tile_auto_trace_core_source_out_group_0_iretire),
    .auto_trace_core_source_out_group_0_iaddr(boom_tile_auto_trace_core_source_out_group_0_iaddr),
    .auto_trace_core_source_out_group_0_itype(boom_tile_auto_trace_core_source_out_group_0_itype),
    .auto_trace_core_source_out_group_0_ilastsize(boom_tile_auto_trace_core_source_out_group_0_ilastsize),
    .auto_trace_core_source_out_priv(boom_tile_auto_trace_core_source_out_priv),
    .auto_trace_core_source_out_tval(boom_tile_auto_trace_core_source_out_tval),
    .auto_trace_core_source_out_cause(boom_tile_auto_trace_core_source_out_cause),
    .auto_nmi_in_rnmi(boom_tile_auto_nmi_in_rnmi),
    .auto_nmi_in_rnmi_interrupt_vector(boom_tile_auto_nmi_in_rnmi_interrupt_vector),
    .auto_nmi_in_rnmi_exception_vector(boom_tile_auto_nmi_in_rnmi_exception_vector),
    .auto_nmi_in_unmi(boom_tile_auto_nmi_in_unmi),
    .auto_nmi_in_unmi_interrupt_vector(boom_tile_auto_nmi_in_unmi_interrupt_vector),
    .auto_nmi_in_unmi_exception_vector(boom_tile_auto_nmi_in_unmi_exception_vector),
    .auto_reset_vector_in(boom_tile_auto_reset_vector_in),
    .auto_hartid_in(boom_tile_auto_hartid_in),
    .auto_tl_other_masters_out_a_ready(boom_tile_auto_tl_other_masters_out_a_ready),
    .auto_tl_other_masters_out_a_valid(boom_tile_auto_tl_other_masters_out_a_valid),
    .auto_tl_other_masters_out_a_bits_opcode(boom_tile_auto_tl_other_masters_out_a_bits_opcode),
    .auto_tl_other_masters_out_a_bits_param(boom_tile_auto_tl_other_masters_out_a_bits_param),
    .auto_tl_other_masters_out_a_bits_size(boom_tile_auto_tl_other_masters_out_a_bits_size),
    .auto_tl_other_masters_out_a_bits_source(boom_tile_auto_tl_other_masters_out_a_bits_source),
    .auto_tl_other_masters_out_a_bits_address(boom_tile_auto_tl_other_masters_out_a_bits_address),
    .auto_tl_other_masters_out_a_bits_mask(boom_tile_auto_tl_other_masters_out_a_bits_mask),
    .auto_tl_other_masters_out_a_bits_data(boom_tile_auto_tl_other_masters_out_a_bits_data),
    .auto_tl_other_masters_out_a_bits_corrupt(boom_tile_auto_tl_other_masters_out_a_bits_corrupt),
    .auto_tl_other_masters_out_b_ready(boom_tile_auto_tl_other_masters_out_b_ready),
    .auto_tl_other_masters_out_b_valid(boom_tile_auto_tl_other_masters_out_b_valid),
    .auto_tl_other_masters_out_b_bits_opcode(boom_tile_auto_tl_other_masters_out_b_bits_opcode),
    .auto_tl_other_masters_out_b_bits_param(boom_tile_auto_tl_other_masters_out_b_bits_param),
    .auto_tl_other_masters_out_b_bits_size(boom_tile_auto_tl_other_masters_out_b_bits_size),
    .auto_tl_other_masters_out_b_bits_source(boom_tile_auto_tl_other_masters_out_b_bits_source),
    .auto_tl_other_masters_out_b_bits_address(boom_tile_auto_tl_other_masters_out_b_bits_address),
    .auto_tl_other_masters_out_b_bits_mask(boom_tile_auto_tl_other_masters_out_b_bits_mask),
    .auto_tl_other_masters_out_b_bits_data(boom_tile_auto_tl_other_masters_out_b_bits_data),
    .auto_tl_other_masters_out_b_bits_corrupt(boom_tile_auto_tl_other_masters_out_b_bits_corrupt),
    .auto_tl_other_masters_out_c_ready(boom_tile_auto_tl_other_masters_out_c_ready),
    .auto_tl_other_masters_out_c_valid(boom_tile_auto_tl_other_masters_out_c_valid),
    .auto_tl_other_masters_out_c_bits_opcode(boom_tile_auto_tl_other_masters_out_c_bits_opcode),
    .auto_tl_other_masters_out_c_bits_param(boom_tile_auto_tl_other_masters_out_c_bits_param),
    .auto_tl_other_masters_out_c_bits_size(boom_tile_auto_tl_other_masters_out_c_bits_size),
    .auto_tl_other_masters_out_c_bits_source(boom_tile_auto_tl_other_masters_out_c_bits_source),
    .auto_tl_other_masters_out_c_bits_address(boom_tile_auto_tl_other_masters_out_c_bits_address),
    .auto_tl_other_masters_out_c_bits_data(boom_tile_auto_tl_other_masters_out_c_bits_data),
    .auto_tl_other_masters_out_c_bits_corrupt(boom_tile_auto_tl_other_masters_out_c_bits_corrupt),
    .auto_tl_other_masters_out_d_ready(boom_tile_auto_tl_other_masters_out_d_ready),
    .auto_tl_other_masters_out_d_valid(boom_tile_auto_tl_other_masters_out_d_valid),
    .auto_tl_other_masters_out_d_bits_opcode(boom_tile_auto_tl_other_masters_out_d_bits_opcode),
    .auto_tl_other_masters_out_d_bits_param(boom_tile_auto_tl_other_masters_out_d_bits_param),
    .auto_tl_other_masters_out_d_bits_size(boom_tile_auto_tl_other_masters_out_d_bits_size),
    .auto_tl_other_masters_out_d_bits_source(boom_tile_auto_tl_other_masters_out_d_bits_source),
    .auto_tl_other_masters_out_d_bits_sink(boom_tile_auto_tl_other_masters_out_d_bits_sink),
    .auto_tl_other_masters_out_d_bits_denied(boom_tile_auto_tl_other_masters_out_d_bits_denied),
    .auto_tl_other_masters_out_d_bits_data(boom_tile_auto_tl_other_masters_out_d_bits_data),
    .auto_tl_other_masters_out_d_bits_corrupt(boom_tile_auto_tl_other_masters_out_d_bits_corrupt),
    .auto_tl_other_masters_out_e_ready(boom_tile_auto_tl_other_masters_out_e_ready),
    .auto_tl_other_masters_out_e_valid(boom_tile_auto_tl_other_masters_out_e_valid),
    .auto_tl_other_masters_out_e_bits_sink(boom_tile_auto_tl_other_masters_out_e_bits_sink)
  );
  assign auto_boom_tile_trace_out_0_valid = boom_tile_auto_trace_out_0_valid; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_0_iaddr = boom_tile_auto_trace_out_0_iaddr; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_0_insn = boom_tile_auto_trace_out_0_insn; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_0_priv = boom_tile_auto_trace_out_0_priv; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_0_exception = boom_tile_auto_trace_out_0_exception; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_0_interrupt = boom_tile_auto_trace_out_0_interrupt; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_0_cause = boom_tile_auto_trace_out_0_cause; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_0_tval = boom_tile_auto_trace_out_0_tval; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_0_wdata = boom_tile_auto_trace_out_0_wdata; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_1_valid = boom_tile_auto_trace_out_1_valid; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_1_iaddr = boom_tile_auto_trace_out_1_iaddr; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_1_insn = boom_tile_auto_trace_out_1_insn; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_1_priv = boom_tile_auto_trace_out_1_priv; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_1_exception = boom_tile_auto_trace_out_1_exception; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_1_interrupt = boom_tile_auto_trace_out_1_interrupt; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_1_cause = boom_tile_auto_trace_out_1_cause; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_1_tval = boom_tile_auto_trace_out_1_tval; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_out_1_wdata = boom_tile_auto_trace_out_1_wdata; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_0_valid = boom_tile_auto_broadcast_out_0_valid; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_0_iaddr = boom_tile_auto_broadcast_out_0_iaddr; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_0_insn = boom_tile_auto_broadcast_out_0_insn; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_0_priv = boom_tile_auto_broadcast_out_0_priv; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_0_exception = boom_tile_auto_broadcast_out_0_exception; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_0_interrupt = boom_tile_auto_broadcast_out_0_interrupt; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_0_cause = boom_tile_auto_broadcast_out_0_cause; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_0_tval = boom_tile_auto_broadcast_out_0_tval; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_1_valid = boom_tile_auto_broadcast_out_1_valid; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_1_iaddr = boom_tile_auto_broadcast_out_1_iaddr; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_1_insn = boom_tile_auto_broadcast_out_1_insn; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_1_priv = boom_tile_auto_broadcast_out_1_priv; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_1_exception = boom_tile_auto_broadcast_out_1_exception; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_1_interrupt = boom_tile_auto_broadcast_out_1_interrupt; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_1_cause = boom_tile_auto_broadcast_out_1_cause; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_broadcast_out_1_tval = boom_tile_auto_broadcast_out_1_tval; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_wfi_out_0 = boom_tile_auto_wfi_out_0; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_cease_out_0 = boom_tile_auto_cease_out_0; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_halt_out_0 = boom_tile_auto_halt_out_0; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_core_source_out_group_0_iretire = boom_tile_auto_trace_core_source_out_group_0_iretire; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_core_source_out_group_0_iaddr = boom_tile_auto_trace_core_source_out_group_0_iaddr; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_core_source_out_group_0_itype = boom_tile_auto_trace_core_source_out_group_0_itype; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_core_source_out_group_0_ilastsize = boom_tile_auto_trace_core_source_out_group_0_ilastsize
    ; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_core_source_out_priv = boom_tile_auto_trace_core_source_out_priv; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_core_source_out_tval = boom_tile_auto_trace_core_source_out_tval; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_trace_core_source_out_cause = boom_tile_auto_trace_core_source_out_cause; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_a_valid = boom_tile_auto_tl_other_masters_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_a_bits_opcode = boom_tile_auto_tl_other_masters_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_a_bits_param = boom_tile_auto_tl_other_masters_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_a_bits_size = boom_tile_auto_tl_other_masters_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_a_bits_source = boom_tile_auto_tl_other_masters_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_a_bits_address = boom_tile_auto_tl_other_masters_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_a_bits_mask = boom_tile_auto_tl_other_masters_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_a_bits_data = boom_tile_auto_tl_other_masters_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_a_bits_corrupt = boom_tile_auto_tl_other_masters_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_b_ready = boom_tile_auto_tl_other_masters_out_b_ready; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_c_valid = boom_tile_auto_tl_other_masters_out_c_valid; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_c_bits_opcode = boom_tile_auto_tl_other_masters_out_c_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_c_bits_param = boom_tile_auto_tl_other_masters_out_c_bits_param; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_c_bits_size = boom_tile_auto_tl_other_masters_out_c_bits_size; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_c_bits_source = boom_tile_auto_tl_other_masters_out_c_bits_source; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_c_bits_address = boom_tile_auto_tl_other_masters_out_c_bits_address; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_c_bits_data = boom_tile_auto_tl_other_masters_out_c_bits_data; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_c_bits_corrupt = boom_tile_auto_tl_other_masters_out_c_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_d_ready = boom_tile_auto_tl_other_masters_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_e_valid = boom_tile_auto_tl_other_masters_out_e_valid; // @[LazyModule.scala 311:12]
  assign auto_boom_tile_tl_other_masters_out_e_bits_sink = boom_tile_auto_tl_other_masters_out_e_bits_sink; // @[LazyModule.scala 311:12]
  assign clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign boom_tile_clock = auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign boom_tile_reset = auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign boom_tile_auto_int_local_in_3_0 = auto_boom_tile_int_local_in_3_0; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_int_local_in_2_0 = auto_boom_tile_int_local_in_2_0; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_int_local_in_1_0 = auto_boom_tile_int_local_in_1_0; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_int_local_in_1_1 = auto_boom_tile_int_local_in_1_1; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_int_local_in_0_0 = auto_boom_tile_int_local_in_0_0; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_nmi_in_rnmi = auto_boom_tile_nmi_in_rnmi; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_nmi_in_rnmi_interrupt_vector = auto_boom_tile_nmi_in_rnmi_interrupt_vector; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_nmi_in_rnmi_exception_vector = auto_boom_tile_nmi_in_rnmi_exception_vector; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_nmi_in_unmi = auto_boom_tile_nmi_in_unmi; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_nmi_in_unmi_interrupt_vector = auto_boom_tile_nmi_in_unmi_interrupt_vector; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_nmi_in_unmi_exception_vector = auto_boom_tile_nmi_in_unmi_exception_vector; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_reset_vector_in = auto_boom_tile_reset_vector_in; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_hartid_in = auto_boom_tile_hartid_in; // @[LazyModule.scala 309:16]
  assign boom_tile_auto_tl_other_masters_out_a_ready = auto_boom_tile_tl_other_masters_out_a_ready; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_b_valid = auto_boom_tile_tl_other_masters_out_b_valid; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_b_bits_opcode = auto_boom_tile_tl_other_masters_out_b_bits_opcode; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_b_bits_param = auto_boom_tile_tl_other_masters_out_b_bits_param; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_b_bits_size = auto_boom_tile_tl_other_masters_out_b_bits_size; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_b_bits_source = auto_boom_tile_tl_other_masters_out_b_bits_source; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_b_bits_address = auto_boom_tile_tl_other_masters_out_b_bits_address; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_b_bits_mask = auto_boom_tile_tl_other_masters_out_b_bits_mask; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_b_bits_data = auto_boom_tile_tl_other_masters_out_b_bits_data; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_b_bits_corrupt = auto_boom_tile_tl_other_masters_out_b_bits_corrupt; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_c_ready = auto_boom_tile_tl_other_masters_out_c_ready; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_d_valid = auto_boom_tile_tl_other_masters_out_d_valid; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_d_bits_opcode = auto_boom_tile_tl_other_masters_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_d_bits_param = auto_boom_tile_tl_other_masters_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_d_bits_size = auto_boom_tile_tl_other_masters_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_d_bits_source = auto_boom_tile_tl_other_masters_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_d_bits_sink = auto_boom_tile_tl_other_masters_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_d_bits_denied = auto_boom_tile_tl_other_masters_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_d_bits_data = auto_boom_tile_tl_other_masters_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_d_bits_corrupt = auto_boom_tile_tl_other_masters_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign boom_tile_auto_tl_other_masters_out_e_ready = auto_boom_tile_tl_other_masters_out_e_ready; // @[LazyModule.scala 311:12]
endmodule
