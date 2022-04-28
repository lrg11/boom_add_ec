# BOOM Split

如有需要, 你可以查看 [BOOM 原始的 README](README.BOOM.md).

## 说明

该项目的核心部分位于 `scr/main/scala` 目录, 你需要在此基础上完成开发工作.

同时, 该项目的外围部分旨在使得各类 Scala IDE (如 IDEA) 正确解析项目的结构, 并启用代码的智能提示功能, 提升你的开发效率.

该项目的结构基于 [Chipyard (b5d01319)](https://github.com/ucb-bar/chipyard/tree/b5d013190d637e634113cb5179f8c8885df1945a) 中的 [BOOM Generator (e1a70afe)](https://github.com/riscv-boom/riscv-boom/tree/e1a70afed7de77f6ba9f6e501de71f7f41afc47c) 重构, 修改了少量项目配置, 同时删除了可能导致编译失败的单元测试.

该项目将启用持续集成 (CI), 以便更好地确保你所提交代码的行为.

## 构建 BOOM 仿真程序

你可以在服务器上运行:

```sh
make
```

来构建仿真程序, 程序将被生成到 `build` 目录.

初次构建时时间较长, 因为 SBT 和 Frenda 会分别建立增量编译缓存 (并分别存储于 `cache` 目录和 `build/verilog` 目录).

默认情况下, 生成的仿真程序将会开启 8 个线程. 你可以通过设置 `THREADS=n` 来设置线程数, 例如只使用单线程进行仿真:

```sh
make THREADS=1
```

如果你需要生成能够输出波形的仿真程序, 你可以执行:

```sh
make debug
```

之后, 为生成的仿真程序添加 `-v 波形文件` 选项来输出波形, 例如:

```sh
build/simulator-UniCoreSmallBoomConfig-debug -v waveform.fst unitester
```

之后你可以使用 GTKWave 等工具加载 `waveform.fst` 文件查看波形.

`debug` 模式下仿真程序将生成 FST 格式波形, 你也可以选择生成 VCD 格式的波形:

```sh
make FST_MODE=0 debug
build/simulator-UniCoreSmallBoomConfig-debug -v waveform.vcd unitester
```

需要注意的是, 生成波形的操作将大幅降低仿真速度. 经测试仿真小型程序时速度降为原来的 1/5, 仿真更大的程序则会更低. 我们建议你在 MaxXing 开发出合适的工具之前谨慎使用这一选项.

## 输出调试日志

为了统一大家所输出的调试日志格式, 进而方便大家高效调试, 该仓库中添加了一个统一的, 用于替换 `printf` 的调试日志输出工具: `dbg`.

我们建议你在任何需要用到 `printf` 输出调试日志的地方, 都使用 `dbg` 来取而代之.

### 基本使用方法

如需使用 `dbg` 输出调试日志, 请先在导入相关 package:

```scala
import boom.util.logging._
```

`dbg` 将按照键值对 (key-value pair) 的方式输出 JSON 格式的调试日志, 而它的使用方式也十分直观. 假设你想输出信号 `a`, `b` 和 `c`, 你只需要:

```scala
dbg(
  "a" -> a,
  "b" -> b,
  "c" -> c,
)
```

太简单了, 甚至不需要我做过多解释, 你也知道这种写法的含义, 以及其最终所输出的结果. 需要注意的是: 键值对中的键 (key), 也就是 `->` 之前的部分, 必须是一个字符串.

`dbg` 除了会输出括号中指定的内容外, 还会输出其他三项固定的内容:

* `module`: 调用 `dbg` 的 Chisel `Module` 名称.
* `source`: `dbg` 所处源文件的文件名及行号.
* `cycle`: 当前仿真周期.

如果你需要输出上述内容, 请直接省略, 因为 `dbg` 已经帮你做好了.

大多数信号本身就是有名字的, 比如 `a`, `b` 和 `c` 的定义都形如 `val a = ...`. 所以, 当我们希望使用信号名称作为键的时候, 可以直接省略键的部分, 只写信号:

```scala
dbg(a, b, c)
```

默认情况下, 所有信号的值都按照 10 进制输出. 如果你希望使用 16 进制或者 2 进制, 可以:

```scala
dbg(
  "dec" -> a,       // 10 进制
  "hex" -> a.toHex, // 16 进制
  "bin" -> a.toBin, // 2 进制
)
```

整数 (`Int`) 和字符串 (`String`) 也可以作为值. 但需要注意的是, 这种情况下你不能将键省略:

```scala
dbg(
  "message" -> "a string",
  "count" -> 100,
)
```

除了普通的信号可以作为值输出, 一些信号的聚合 (aggregate), 比如 `Vec[T <: Bits]` 和 `Seq[T <: Bits]` 也可以作为值:

```scala
val vec = Reg(Vec(length, UInt(width.W)))
val seq = Seq.fill(length) { 123.U(width.W) }
// ...
dbg(
  "vector" -> vec,
  "sequence" -> seq,
  vec,      // `Vec` 本身是 Chisel 的一种信号, 所以可以省略键
  // seq,   // 编译错误, `Seq` 不是 Chisel 信号, 必须显式指定键
)
```

所以, 当你遇到这种情况时:

```scala
val decodeInfo = Vec(length, Bundle {
  val inst = UInt(INST_LEN.W)
  // ...
})
```

你应该灵活运用 Scala 提供的工具, 使用尽可能少的 `dbg`, 将你想要输出的内容一并输出:

```scala
dbg(
  "insts" -> decodeInfo.map(_.inst).toHex,
)
```

尽量避免写 `for` 循环, 然后依次输出对应元素, 这会导致调试日志显著变多.

### 键的命名约定

为了方便我们后期使用程序从调试日志中提取信息, 我们规定, 在输出某些具有特殊含义的信号时, 信号的键的命名必须遵守如下约定:

* **模块名, 源文件位置和仿真周期**: 键名为 `module`, `source` 和 `cycle`, `dbg` 已经内置.
* **指令**: 键名为 `inst`, 值输出格式为 16 进制.
* **程序计数器**: 键名为 `pc`, 值输出格式为 16 进制.

## 你可能会遇到的问题

### IDEA 提示 `Package name 'boom. ...' does not correspond to the file path '...'`

这并不影响编译, 你可以在 IDEA 的设置中找到 Editor | Inspections | Scala | General | Wrong package statement, 然后取消该项的勾选, 以关闭这个提示.

### IDEA 提示 Chisel 的 `Bits` 和 `UInt` 的类型不太兼容

IDEA 将对下列 Chisel 代码报错 (详见 Chisel3 的 issue [#1125](https://github.com/chipsalliance/chisel3/issues/1125)):

```scala
val a = 1.U << 1
val b = 3.U
println(a, b)

// IntelliJ editor complains on 'a': Type mismatch, expected UInt, actual: Bits
when(b >= a) {
  io.data := 1.U
}
```

但这并不会导致编译失败.

这个问题在最新版本的 Chisel 中依然存在. 简而言之, 为了更灵活且自然的语法, Chisel 允许混用 `Bits` 和 `UInt`, 且它会借助 Scala 强大的宏能力对代码进行二次处理, 保证类型的正确性. 然而由于动态展开 Scala 宏的代价太大, 或是太过复杂, IDEA 无法正确解析这些内容, 所以会报错.

目前暂时不存在该问题的解决方法, 而且令人蚌埠住的是, BOOM 本身的代码里会大量出现这一组合, 导致 IDEA 在编辑这些文件时报出大量的错误.

你只能暂时忽略这个问题.

当然, 在自己写代码的时候, 我强烈建议你使用 `.asUInt` 方法将 `Bits` 转换为 `UInt` 来避免这个问题.

## 特别注意

**该项目的可用部分仅限于 `scr/main/scala` 目录, 当你需要使用 Chipyard 工具链仿真该项目时, 请确保只有上述目录被挂载到了容器中.**

**再次重申, 请不要将本项目直接挂在到容器的 `chipyard/generators/boom` 目录!**
