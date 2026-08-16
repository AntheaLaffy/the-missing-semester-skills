---
name: vim-editing
description: >
  Vim 界面语言：模态编辑、名词（移动）与动词（编辑）、计数与修饰符、Vim mode 处处可用
  （VSCodeVim/Zsh/Claude Code）、学习资源。手动点名使用。
disable-model-invocation: true
---

# Vim 编辑

主线：Vim 的界面本身是一门用于导航和编辑文本的编程语言——按键（带助记名）是命令，命令可组合。编程时多数时间花在「代码间导航、读片段、改片段」，而不是连续输入；Vim 正是为这种任务分布优化——鼠标太慢，方向键手部移动太多。你不需要用 Vim 本体：VS Code 有 [VSCodeVim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)，Zsh 内建 Vim 模拟，[Claude Code 也内建 Vim 编辑模式](https://code.claude.com/docs/en/interactive-mode#vim-editor-mode)——几乎所有文本编辑工具都有某种 Vim mode。

## 模态编辑

- 模式决定按键含义：`x` 在插入模式插入字母 x，在正常模式删除光标下字符，在可视化模式删除选区。
- 五种模式：正常（默认，导航+编辑）、插入（`i`）、替换（`R`）、可视化（`v` 字符 / `V` 行 / `<C-v>` 块）、命令（`:`）。`<ESC>` 随时回正常模式。
- `<ESC>` 是最高频按键：[macOS 把 Caps Lock 重映射为 Escape](https://vim.fandom.com/wiki/Map_caps_lock_to_escape_in_macOS)，或配一个[由简单按键序列触发的 `<ESC>` 映射](https://vim.fandom.com/wiki/Avoid_the_escape_key#Mappings)。

## 名词：移动

- 基础 `hjkl`（左/下/上/右）；单词 `w`/`b`/`e`；行 `0`/`^`/`$`；屏幕 `H`/`M`/`L`；滚动 `Ctrl-u`/`Ctrl-d`；文件 `gg`/`G`；行号 `:{n}<CR>` 或 `{n}G`；括号匹配 `%`；行内查找 `f{char}`/`t{char}`（`,`/`;` 在匹配间导航）；搜索 `/{regex}`（`n`/`N` 导航）。

## 动词：编辑

- `i` 进入插入；`o`/`O` 下方/上方开新行；`d{motion}` 删除（`dw` 删词、`d$` 删到行尾、`d0` 删到行首）；`c{motion}` 修改（= `d{motion}` 后接 `i`）；`x` 删字符（= `dl`）、`s` 替换字符（= `cl`）；可视化选中后 `d`/`c`；`u` 撤销、`<C-r>` 重做；`y` 复制（`d` 等也会复制）、`p` 粘贴；`~` 切换大小写、`J` 连接多行。

## 组合：计数与修饰符

- 计数前缀：`3w` 前进三个词、`5j` 下移五行、`7dw` 删七个词（小次数实际更常连按，肌肉记忆后如打字）。
- 修饰符：`i` = inner/inside、`a` = around——`ci(` 改圆括号内、`ci[` 改方括号内、`ci"` 改引号内、`da'` 连单引号一起删。
- 例如把 `print("fizz")` 改成 `print("buzz")`：`:6<CR>` 到第 6 行 → `ci"` → 输入 buzz → `<ESC>`。

## 学习路径

- 掌握基础后：所有软件都启用 Vim mode，实际用一个月，别碰鼠标和方向键（可解绑强迫习惯）；觉得低效就搜「肯定有更好的办法」。
- 资源：`vimtutor`（随 Vim 安装）、[Vim Adventures](https://vim-adventures.com/)（游戏）、[Vim Tips Wiki](https://vim.fandom.com/wiki/Vim_Tips_Wiki)、[VimGolf](https://www.vimgolf.com/)（以 Vim 界面为「编程语言」的 code golf）、[Practical Vim](https://pragprog.com/titles/dnvim2/)（书）。

## 练习

学习材料在 `exercises.md`。

> 改编自 MIT The Missing Semester 课程 Lecture 3: Development Environment（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=QnM1nVzrkx8
