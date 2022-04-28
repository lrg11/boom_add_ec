module SerialAdapter(
  input         clock,
  input         reset,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output        auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input         auto_out_d_bits_source,
  input  [1:0]  auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt,
  output        io_serial_in_ready,
  input         io_serial_in_valid,
  input  [31:0] io_serial_in_bits,
  input         io_serial_out_ready,
  output        io_serial_out_valid,
  output [31:0] io_serial_out_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] cmd; // @[SerialAdapter.scala 150:16]
  reg [63:0] addr; // @[SerialAdapter.scala 151:17]
  reg [63:0] len; // @[SerialAdapter.scala 152:16]
  reg [31:0] body_0; // @[SerialAdapter.scala 153:17]
  reg [31:0] body_1; // @[SerialAdapter.scala 153:17]
  reg [1:0] bodyValid; // @[SerialAdapter.scala 154:22]
  reg  idx; // @[SerialAdapter.scala 155:16]
  reg [3:0] state; // @[SerialAdapter.scala 161:22]
  wire  _T = state == 4'h0; // @[package.scala 15:47]
  wire  _T_1 = state == 4'h1; // @[package.scala 15:47]
  wire  _T_2 = state == 4'h2; // @[package.scala 15:47]
  wire  _T_3 = state == 4'h6; // @[package.scala 15:47]
  wire  _T_7 = state == 4'h5; // @[SerialAdapter.scala 164:32]
  wire [28:0] beatAddr = addr[31:3]; // @[SerialAdapter.scala 167:22]
  wire [28:0] hi = beatAddr + 29'h1; // @[SerialAdapter.scala 168:31]
  wire [31:0] nextAddr = {hi,3'h0}; // @[Cat.scala 30:58]
  wire [3:0] lo = bodyValid[0] ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [3:0] hi_1 = bodyValid[1] ? 4'hf : 4'h0; // @[Bitwise.scala 72:12]
  wire [7:0] wmask = {hi_1,lo}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_55 = {{32'd0}, nextAddr}; // @[SerialAdapter.scala 171:28]
  wire [63:0] addr_size = _GEN_55 - addr; // @[SerialAdapter.scala 171:28]
  wire [63:0] hi_2 = len + 64'h1; // @[SerialAdapter.scala 172:26]
  wire [65:0] len_size = {hi_2,2'h0}; // @[Cat.scala 30:58]
  wire [65:0] _GEN_56 = {{2'd0}, addr_size}; // @[SerialAdapter.scala 173:31]
  wire [65:0] raw_size = len_size < _GEN_56 ? len_size : {{2'd0}, addr_size}; // @[SerialAdapter.scala 173:21]
  wire [1:0] _T_17 = 66'h1 == raw_size ? 2'h0 : 2'h3; // @[Mux.scala 80:57]
  wire [1:0] _T_19 = 66'h2 == raw_size ? 2'h1 : _T_17; // @[Mux.scala 80:57]
  wire [1:0] rsize = 66'h4 == raw_size ? 2'h2 : _T_19; // @[Mux.scala 80:57]
  wire [1:0] _T_87 = raw_size[0] + raw_size[1]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_89 = raw_size[2] + raw_size[3]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_91 = _T_87 + _T_89; // @[Bitwise.scala 47:55]
  wire [1:0] _T_93 = raw_size[4] + raw_size[5]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_95 = raw_size[6] + raw_size[7]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_97 = _T_93 + _T_95; // @[Bitwise.scala 47:55]
  wire [3:0] _T_99 = _T_91 + _T_97; // @[Bitwise.scala 47:55]
  wire [1:0] _T_101 = raw_size[8] + raw_size[9]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_103 = raw_size[10] + raw_size[11]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_105 = _T_101 + _T_103; // @[Bitwise.scala 47:55]
  wire [1:0] _T_107 = raw_size[12] + raw_size[13]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_109 = raw_size[14] + raw_size[15]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_111 = _T_107 + _T_109; // @[Bitwise.scala 47:55]
  wire [3:0] _T_113 = _T_105 + _T_111; // @[Bitwise.scala 47:55]
  wire [4:0] _T_115 = _T_99 + _T_113; // @[Bitwise.scala 47:55]
  wire [1:0] _T_117 = raw_size[16] + raw_size[17]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_119 = raw_size[18] + raw_size[19]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_121 = _T_117 + _T_119; // @[Bitwise.scala 47:55]
  wire [1:0] _T_123 = raw_size[20] + raw_size[21]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_125 = raw_size[22] + raw_size[23]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_127 = _T_123 + _T_125; // @[Bitwise.scala 47:55]
  wire [3:0] _T_129 = _T_121 + _T_127; // @[Bitwise.scala 47:55]
  wire [1:0] _T_131 = raw_size[24] + raw_size[25]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_133 = raw_size[26] + raw_size[27]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_135 = _T_131 + _T_133; // @[Bitwise.scala 47:55]
  wire [1:0] _T_137 = raw_size[28] + raw_size[29]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_139 = raw_size[31] + raw_size[32]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_57 = {{1'd0}, raw_size[30]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_141 = _GEN_57 + _T_139; // @[Bitwise.scala 47:55]
  wire [2:0] _T_143 = _T_137 + _T_141[1:0]; // @[Bitwise.scala 47:55]
  wire [3:0] _T_145 = _T_135 + _T_143; // @[Bitwise.scala 47:55]
  wire [4:0] _T_147 = _T_129 + _T_145; // @[Bitwise.scala 47:55]
  wire [5:0] _T_149 = _T_115 + _T_147; // @[Bitwise.scala 47:55]
  wire [1:0] _T_151 = raw_size[33] + raw_size[34]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_153 = raw_size[35] + raw_size[36]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_155 = _T_151 + _T_153; // @[Bitwise.scala 47:55]
  wire [1:0] _T_157 = raw_size[37] + raw_size[38]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_159 = raw_size[39] + raw_size[40]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_161 = _T_157 + _T_159; // @[Bitwise.scala 47:55]
  wire [3:0] _T_163 = _T_155 + _T_161; // @[Bitwise.scala 47:55]
  wire [1:0] _T_165 = raw_size[41] + raw_size[42]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_167 = raw_size[43] + raw_size[44]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_169 = _T_165 + _T_167; // @[Bitwise.scala 47:55]
  wire [1:0] _T_171 = raw_size[45] + raw_size[46]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_173 = raw_size[47] + raw_size[48]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_175 = _T_171 + _T_173; // @[Bitwise.scala 47:55]
  wire [3:0] _T_177 = _T_169 + _T_175; // @[Bitwise.scala 47:55]
  wire [4:0] _T_179 = _T_163 + _T_177; // @[Bitwise.scala 47:55]
  wire [1:0] _T_181 = raw_size[49] + raw_size[50]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_183 = raw_size[51] + raw_size[52]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_185 = _T_181 + _T_183; // @[Bitwise.scala 47:55]
  wire [1:0] _T_187 = raw_size[53] + raw_size[54]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_189 = raw_size[55] + raw_size[56]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_191 = _T_187 + _T_189; // @[Bitwise.scala 47:55]
  wire [3:0] _T_193 = _T_185 + _T_191; // @[Bitwise.scala 47:55]
  wire [1:0] _T_195 = raw_size[57] + raw_size[58]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_197 = raw_size[59] + raw_size[60]; // @[Bitwise.scala 47:55]
  wire [2:0] _T_199 = _T_195 + _T_197; // @[Bitwise.scala 47:55]
  wire [1:0] _T_201 = raw_size[61] + raw_size[62]; // @[Bitwise.scala 47:55]
  wire [1:0] _T_203 = raw_size[64] + raw_size[65]; // @[Bitwise.scala 47:55]
  wire [1:0] _GEN_58 = {{1'd0}, raw_size[63]}; // @[Bitwise.scala 47:55]
  wire [2:0] _T_205 = _GEN_58 + _T_203; // @[Bitwise.scala 47:55]
  wire [2:0] _T_207 = _T_201 + _T_205[1:0]; // @[Bitwise.scala 47:55]
  wire [3:0] _T_209 = _T_199 + _T_207; // @[Bitwise.scala 47:55]
  wire [4:0] _T_211 = _T_193 + _T_209; // @[Bitwise.scala 47:55]
  wire [5:0] _T_213 = _T_179 + _T_211; // @[Bitwise.scala 47:55]
  wire [6:0] _T_215 = _T_149 + _T_213; // @[Bitwise.scala 47:55]
  wire  pow2size = _T_215 == 7'h1; // @[SerialAdapter.scala 177:37]
  wire [2:0] byteAddr = pow2size ? addr[2:0] : 3'h0; // @[SerialAdapter.scala 178:21]
  wire [31:0] put_acquire_address = {beatAddr, 3'h0}; // @[SerialAdapter.scala 181:19]
  wire [63:0] put_acquire_data = {body_1,body_0}; // @[SerialAdapter.scala 182:10]
  wire [31:0] get_acquire_address = {beatAddr,byteAddr}; // @[Cat.scala 30:58]
  wire [2:0] _a_mask_sizeOH_T = {{1'd0}, rsize}; // @[Misc.scala 201:34]
  wire [1:0] a_mask_sizeOH_shiftAmount = _a_mask_sizeOH_T[1:0]; // @[OneHot.scala 64:49]
  wire [3:0] _a_mask_sizeOH_T_1 = 4'h1 << a_mask_sizeOH_shiftAmount; // @[OneHot.scala 65:12]
  wire [2:0] a_mask_sizeOH = _a_mask_sizeOH_T_1[2:0] | 3'h1; // @[Misc.scala 201:81]
  wire  _a_mask_T = rsize >= 2'h3; // @[Misc.scala 205:21]
  wire  a_mask_size = a_mask_sizeOH[2]; // @[Misc.scala 208:26]
  wire  a_mask_bit = get_acquire_address[2]; // @[Misc.scala 209:26]
  wire  a_mask_nbit = ~a_mask_bit; // @[Misc.scala 210:20]
  wire  a_mask_acc = _a_mask_T | a_mask_size & a_mask_nbit; // @[Misc.scala 214:29]
  wire  a_mask_acc_1 = _a_mask_T | a_mask_size & a_mask_bit; // @[Misc.scala 214:29]
  wire  a_mask_size_1 = a_mask_sizeOH[1]; // @[Misc.scala 208:26]
  wire  a_mask_bit_1 = get_acquire_address[1]; // @[Misc.scala 209:26]
  wire  a_mask_nbit_1 = ~a_mask_bit_1; // @[Misc.scala 210:20]
  wire  a_mask_eq_2 = a_mask_nbit & a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_2 = a_mask_acc | a_mask_size_1 & a_mask_eq_2; // @[Misc.scala 214:29]
  wire  a_mask_eq_3 = a_mask_nbit & a_mask_bit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_3 = a_mask_acc | a_mask_size_1 & a_mask_eq_3; // @[Misc.scala 214:29]
  wire  a_mask_eq_4 = a_mask_bit & a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_4 = a_mask_acc_1 | a_mask_size_1 & a_mask_eq_4; // @[Misc.scala 214:29]
  wire  a_mask_eq_5 = a_mask_bit & a_mask_bit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_5 = a_mask_acc_1 | a_mask_size_1 & a_mask_eq_5; // @[Misc.scala 214:29]
  wire  a_mask_size_2 = a_mask_sizeOH[0]; // @[Misc.scala 208:26]
  wire  a_mask_bit_2 = get_acquire_address[0]; // @[Misc.scala 209:26]
  wire  a_mask_nbit_2 = ~a_mask_bit_2; // @[Misc.scala 210:20]
  wire  a_mask_eq_6 = a_mask_eq_2 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_lo_lo_lo = a_mask_acc_2 | a_mask_size_2 & a_mask_eq_6; // @[Misc.scala 214:29]
  wire  a_mask_eq_7 = a_mask_eq_2 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_lo_lo_hi = a_mask_acc_2 | a_mask_size_2 & a_mask_eq_7; // @[Misc.scala 214:29]
  wire  a_mask_eq_8 = a_mask_eq_3 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_lo_hi_lo = a_mask_acc_3 | a_mask_size_2 & a_mask_eq_8; // @[Misc.scala 214:29]
  wire  a_mask_eq_9 = a_mask_eq_3 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_lo_hi_hi = a_mask_acc_3 | a_mask_size_2 & a_mask_eq_9; // @[Misc.scala 214:29]
  wire  a_mask_eq_10 = a_mask_eq_4 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_hi_lo_lo = a_mask_acc_4 | a_mask_size_2 & a_mask_eq_10; // @[Misc.scala 214:29]
  wire  a_mask_eq_11 = a_mask_eq_4 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_hi_lo_hi = a_mask_acc_4 | a_mask_size_2 & a_mask_eq_11; // @[Misc.scala 214:29]
  wire  a_mask_eq_12 = a_mask_eq_5 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_hi_hi_lo = a_mask_acc_5 | a_mask_size_2 & a_mask_eq_12; // @[Misc.scala 214:29]
  wire  a_mask_eq_13 = a_mask_eq_5 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_hi_hi_hi = a_mask_acc_5 | a_mask_size_2 & a_mask_eq_13; // @[Misc.scala 214:29]
  wire [7:0] get_acquire_mask = {a_mask_hi_hi_hi,a_mask_hi_hi_lo,a_mask_hi_lo_hi,a_mask_hi_lo_lo,a_mask_lo_hi_hi,
    a_mask_lo_hi_lo,a_mask_lo_lo_hi,a_mask_lo_lo_lo}; // @[Cat.scala 30:58]
  wire  _bundleOut_0_a_valid_T = state == 4'h7; // @[package.scala 15:47]
  wire  _bundleOut_0_a_valid_T_1 = state == 4'h3; // @[package.scala 15:47]
  wire [3:0] get_acquire_size = {{2'd0}, rsize}; // @[Edges.scala 447:17 Edges.scala 450:15]
  wire  _bundleOut_0_d_ready_T = state == 4'h8; // @[package.scala 15:47]
  wire  _bundleOut_0_d_ready_T_1 = state == 4'h4; // @[package.scala 15:47]
  wire  _GEN_3 = _T & io_serial_in_valid ? 1'h0 : idx; // @[SerialAdapter.scala 202:48 SerialAdapter.scala 204:9 SerialAdapter.scala 155:16]
  wire [63:0] _GEN_4 = _T & io_serial_in_valid ? 64'h0 : addr; // @[SerialAdapter.scala 202:48 SerialAdapter.scala 205:10 SerialAdapter.scala 151:17]
  wire [63:0] _GEN_5 = _T & io_serial_in_valid ? 64'h0 : len; // @[SerialAdapter.scala 202:48 SerialAdapter.scala 206:9 SerialAdapter.scala 152:16]
  wire [3:0] _GEN_6 = _T & io_serial_in_valid ? 4'h1 : state; // @[SerialAdapter.scala 202:48 SerialAdapter.scala 207:11 SerialAdapter.scala 161:22]
  wire [5:0] _T_225 = {idx,5'h0}; // @[Cat.scala 30:58]
  wire [94:0] _GEN_59 = {{63'd0}, io_serial_in_bits}; // @[SerialAdapter.scala 196:12]
  wire [94:0] _T_226 = _GEN_59 << _T_225; // @[SerialAdapter.scala 196:12]
  wire [94:0] _GEN_60 = {{31'd0}, addr}; // @[SerialAdapter.scala 211:18]
  wire [94:0] _T_227 = _GEN_60 | _T_226; // @[SerialAdapter.scala 211:18]
  wire  _T_229 = idx + 1'h1; // @[SerialAdapter.scala 212:16]
  wire  _GEN_7 = idx ? 1'h0 : idx + 1'h1; // @[SerialAdapter.scala 213:43 SerialAdapter.scala 214:11 SerialAdapter.scala 212:9]
  wire [3:0] _GEN_8 = idx ? 4'h2 : _GEN_6; // @[SerialAdapter.scala 213:43 SerialAdapter.scala 215:13]
  wire [94:0] _GEN_9 = _T_1 & io_serial_in_valid ? _T_227 : {{31'd0}, _GEN_4}; // @[SerialAdapter.scala 210:49 SerialAdapter.scala 211:10]
  wire  _GEN_10 = _T_1 & io_serial_in_valid ? _GEN_7 : _GEN_3; // @[SerialAdapter.scala 210:49]
  wire [3:0] _GEN_11 = _T_1 & io_serial_in_valid ? _GEN_8 : _GEN_6; // @[SerialAdapter.scala 210:49]
  wire  _T_232 = _T_2 & io_serial_in_valid; // @[SerialAdapter.scala 219:25]
  wire [94:0] _GEN_62 = {{31'd0}, len}; // @[SerialAdapter.scala 220:16]
  wire [94:0] _T_235 = _GEN_62 | _T_226; // @[SerialAdapter.scala 220:16]
  wire  _T_240 = cmd == 32'h1; // @[SerialAdapter.scala 224:17]
  wire  _T_241 = cmd == 32'h0; // @[SerialAdapter.scala 227:24]
  wire [3:0] _GEN_12 = cmd == 32'h0 ? 4'h3 : _GEN_11; // @[SerialAdapter.scala 227:38 SerialAdapter.scala 228:15]
  wire [1:0] _GEN_13 = cmd == 32'h1 ? 2'h0 : bodyValid; // @[SerialAdapter.scala 224:32 SerialAdapter.scala 225:19 SerialAdapter.scala 154:22]
  wire [3:0] _GEN_14 = cmd == 32'h1 ? 4'h6 : _GEN_12; // @[SerialAdapter.scala 224:32 SerialAdapter.scala 226:15]
  wire  _GEN_15 = idx ? addr[2] : _T_229; // @[SerialAdapter.scala 222:43 SerialAdapter.scala 223:11 SerialAdapter.scala 221:9]
  wire [1:0] _GEN_16 = idx ? _GEN_13 : bodyValid; // @[SerialAdapter.scala 222:43 SerialAdapter.scala 154:22]
  wire [3:0] _GEN_17 = idx ? _GEN_14 : _GEN_11; // @[SerialAdapter.scala 222:43]
  wire [94:0] _GEN_18 = _T_2 & io_serial_in_valid ? _T_235 : {{31'd0}, _GEN_5}; // @[SerialAdapter.scala 219:48 SerialAdapter.scala 220:9]
  wire  _GEN_19 = _T_2 & io_serial_in_valid ? _GEN_15 : _GEN_10; // @[SerialAdapter.scala 219:48]
  wire [1:0] _GEN_20 = _T_2 & io_serial_in_valid ? _GEN_16 : bodyValid; // @[SerialAdapter.scala 219:48 SerialAdapter.scala 154:22]
  wire [3:0] _GEN_21 = _T_2 & io_serial_in_valid ? _GEN_17 : _GEN_11; // @[SerialAdapter.scala 219:48]
  wire [3:0] _GEN_22 = _bundleOut_0_a_valid_T_1 & auto_out_a_ready ? 4'h4 : _GEN_21; // @[SerialAdapter.scala 235:46 SerialAdapter.scala 236:11]
  wire [31:0] _GEN_23 = _bundleOut_0_d_ready_T_1 & auto_out_d_valid ? auto_out_d_bits_data[31:0] : body_0; // @[SerialAdapter.scala 239:47 SerialAdapter.scala 240:10 SerialAdapter.scala 153:17]
  wire [31:0] _GEN_24 = _bundleOut_0_d_ready_T_1 & auto_out_d_valid ? auto_out_d_bits_data[63:32] : body_1; // @[SerialAdapter.scala 239:47 SerialAdapter.scala 240:10 SerialAdapter.scala 153:17]
  wire  _GEN_25 = _bundleOut_0_d_ready_T_1 & auto_out_d_valid ? addr[2] : _GEN_19; // @[SerialAdapter.scala 239:47 SerialAdapter.scala 241:9]
  wire [94:0] _GEN_26 = _bundleOut_0_d_ready_T_1 & auto_out_d_valid ? {{63'd0}, nextAddr} : _GEN_9; // @[SerialAdapter.scala 239:47 SerialAdapter.scala 242:10]
  wire [3:0] _GEN_27 = _bundleOut_0_d_ready_T_1 & auto_out_d_valid ? 4'h5 : _GEN_22; // @[SerialAdapter.scala 239:47 SerialAdapter.scala 243:11]
  wire [63:0] _T_257 = len - 64'h1; // @[SerialAdapter.scala 248:16]
  wire  _T_258 = len == 64'h0; // @[SerialAdapter.scala 249:15]
  wire [3:0] _GEN_28 = idx ? 4'h3 : _GEN_27; // @[SerialAdapter.scala 250:48 SerialAdapter.scala 250:56]
  wire [3:0] _GEN_29 = len == 64'h0 ? 4'h0 : _GEN_28; // @[SerialAdapter.scala 249:24 SerialAdapter.scala 249:32]
  wire  _GEN_30 = _T_7 & io_serial_out_ready ? _T_229 : _GEN_25; // @[SerialAdapter.scala 246:55 SerialAdapter.scala 247:9]
  wire [94:0] _GEN_31 = _T_7 & io_serial_out_ready ? {{31'd0}, _T_257} : _GEN_18; // @[SerialAdapter.scala 246:55 SerialAdapter.scala 248:9]
  wire [3:0] _GEN_32 = _T_7 & io_serial_out_ready ? _GEN_29 : _GEN_27; // @[SerialAdapter.scala 246:55]
  wire [1:0] _T_262 = 2'h1 << idx; // @[OneHot.scala 58:35]
  wire [1:0] _T_263 = bodyValid | _T_262; // @[SerialAdapter.scala 255:28]
  wire [3:0] _GEN_35 = idx | _T_258 ? 4'h7 : _GEN_32; // @[SerialAdapter.scala 256:58 SerialAdapter.scala 257:13]
  wire  _GEN_36 = idx | _T_258 ? _GEN_30 : _T_229; // @[SerialAdapter.scala 256:58 SerialAdapter.scala 259:11]
  wire [94:0] _GEN_37 = idx | _T_258 ? _GEN_31 : {{31'd0}, _T_257}; // @[SerialAdapter.scala 256:58 SerialAdapter.scala 260:11]
  wire [1:0] _GEN_40 = _T_3 & io_serial_in_valid ? _T_263 : _GEN_20; // @[SerialAdapter.scala 253:55 SerialAdapter.scala 255:15]
  wire  _GEN_42 = _T_3 & io_serial_in_valid ? _GEN_36 : _GEN_30; // @[SerialAdapter.scala 253:55]
  wire [94:0] _GEN_43 = _T_3 & io_serial_in_valid ? _GEN_37 : _GEN_31; // @[SerialAdapter.scala 253:55]
  wire [94:0] _GEN_46 = _T_258 ? _GEN_26 : {{63'd0}, nextAddr}; // @[SerialAdapter.scala 269:24 SerialAdapter.scala 272:12]
  wire [94:0] _GEN_47 = _T_258 ? _GEN_43 : {{31'd0}, _T_257}; // @[SerialAdapter.scala 269:24 SerialAdapter.scala 273:11]
  wire  _GEN_48 = _T_258 & _GEN_42; // @[SerialAdapter.scala 269:24 SerialAdapter.scala 274:11]
  wire [94:0] _GEN_51 = _bundleOut_0_d_ready_T & auto_out_d_valid ? _GEN_46 : _GEN_26; // @[SerialAdapter.scala 268:47]
  wire [94:0] _GEN_52 = _bundleOut_0_d_ready_T & auto_out_d_valid ? _GEN_47 : _GEN_43; // @[SerialAdapter.scala 268:47]
  assign auto_out_a_valid = _bundleOut_0_a_valid_T | _bundleOut_0_a_valid_T_1; // @[package.scala 72:59]
  assign auto_out_a_bits_opcode = _bundleOut_0_a_valid_T ? 3'h1 : 3'h4; // @[SerialAdapter.scala 188:20]
  assign auto_out_a_bits_param = 3'h0; // @[SerialAdapter.scala 188:20]
  assign auto_out_a_bits_size = _bundleOut_0_a_valid_T ? 4'h3 : get_acquire_size; // @[SerialAdapter.scala 188:20]
  assign auto_out_a_bits_source = 1'h0; // @[SerialAdapter.scala 188:20]
  assign auto_out_a_bits_address = _bundleOut_0_a_valid_T ? put_acquire_address : get_acquire_address; // @[SerialAdapter.scala 188:20]
  assign auto_out_a_bits_mask = _bundleOut_0_a_valid_T ? wmask : get_acquire_mask; // @[SerialAdapter.scala 188:20]
  assign auto_out_a_bits_data = _bundleOut_0_a_valid_T ? put_acquire_data : 64'h0; // @[SerialAdapter.scala 188:20]
  assign auto_out_a_bits_corrupt = 1'h0; // @[SerialAdapter.scala 188:20]
  assign auto_out_d_ready = _bundleOut_0_d_ready_T | _bundleOut_0_d_ready_T_1; // @[package.scala 72:59]
  assign io_serial_in_ready = _T | _T_1 | _T_2 | _T_3; // @[package.scala 72:59]
  assign io_serial_out_valid = state == 4'h5; // @[SerialAdapter.scala 164:32]
  assign io_serial_out_bits = idx ? body_1 : body_0; // @[SerialAdapter.scala 165:22 SerialAdapter.scala 165:22]
  always @(posedge clock) begin
    if (_T & io_serial_in_valid) begin // @[SerialAdapter.scala 202:48]
      cmd <= io_serial_in_bits; // @[SerialAdapter.scala 203:9]
    end
    addr <= _GEN_51[63:0];
    len <= _GEN_52[63:0];
    if (_T_3 & io_serial_in_valid) begin // @[SerialAdapter.scala 253:55]
      if (~idx) begin // @[SerialAdapter.scala 254:15]
        body_0 <= io_serial_in_bits; // @[SerialAdapter.scala 254:15]
      end else begin
        body_0 <= _GEN_23;
      end
    end else begin
      body_0 <= _GEN_23;
    end
    if (_T_3 & io_serial_in_valid) begin // @[SerialAdapter.scala 253:55]
      if (idx) begin // @[SerialAdapter.scala 254:15]
        body_1 <= io_serial_in_bits; // @[SerialAdapter.scala 254:15]
      end else begin
        body_1 <= _GEN_24;
      end
    end else begin
      body_1 <= _GEN_24;
    end
    if (_bundleOut_0_d_ready_T & auto_out_d_valid) begin // @[SerialAdapter.scala 268:47]
      if (_T_258) begin // @[SerialAdapter.scala 269:24]
        bodyValid <= _GEN_40;
      end else begin
        bodyValid <= 2'h0; // @[SerialAdapter.scala 275:17]
      end
    end else begin
      bodyValid <= _GEN_40;
    end
    if (_bundleOut_0_d_ready_T & auto_out_d_valid) begin // @[SerialAdapter.scala 268:47]
      idx <= _GEN_48;
    end else if (_T_3 & io_serial_in_valid) begin // @[SerialAdapter.scala 253:55]
      if (idx | _T_258) begin // @[SerialAdapter.scala 256:58]
        idx <= _GEN_30;
      end else begin
        idx <= _T_229; // @[SerialAdapter.scala 259:11]
      end
    end else begin
      idx <= _GEN_30;
    end
    if (reset) begin // @[SerialAdapter.scala 161:22]
      state <= 4'h0; // @[SerialAdapter.scala 161:22]
    end else if (_bundleOut_0_d_ready_T & auto_out_d_valid) begin // @[SerialAdapter.scala 268:47]
      if (_T_258) begin // @[SerialAdapter.scala 269:24]
        state <= 4'h0; // @[SerialAdapter.scala 270:13]
      end else begin
        state <= 4'h6; // @[SerialAdapter.scala 276:13]
      end
    end else if (_bundleOut_0_a_valid_T & auto_out_a_ready) begin // @[SerialAdapter.scala 264:48]
      state <= 4'h8; // @[SerialAdapter.scala 265:11]
    end else if (_T_3 & io_serial_in_valid) begin // @[SerialAdapter.scala 253:55]
      state <= _GEN_35;
    end else begin
      state <= _GEN_32;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_232 & idx & ~_T_240 & ~_T_241 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: Bad TSI command\n    at SerialAdapter.scala:230 assert(false.B, \"Bad TSI command\")\n"); // @[SerialAdapter.scala 230:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_232 & idx & ~_T_240 & ~_T_241 & ~reset) begin
          $fatal; // @[SerialAdapter.scala 230:15]
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
  cmd = _RAND_0[31:0];
  _RAND_1 = {2{`RANDOM}};
  addr = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  len = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  body_0 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  body_1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  bodyValid = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  idx = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  state = _RAND_7[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
