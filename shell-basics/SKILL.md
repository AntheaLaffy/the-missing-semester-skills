---
name: shell-basics
description: >
  Shell 导航与基础：man/--help/tldr 查手册、cd/pwd 与相对绝对路径、$PATH 与 which、单双引号与转义、
  核心命令速查（cat/sort/uniq/head/tail/grep/sed/find/awk）及讲义推荐的现代替代
  （zoxide/eza/bat/ripgrep/fd）。手动点名使用。
disable-model-invocation: true
---

# Shell 导航与基础

主线：图形界面只能点已存在的按钮，Shell 能运行任何程序、把它们组合起来自动化任务——GUI 覆盖 80% 场景，剩下 20% 必须回到命令行。

## 心智模型

- Shell 解析一行命令：按空白分词，第一个词是要执行的程序，其余是参数。
- 路径分两种：以 `/` 开头的是绝对路径；相对路径从当前工作目录（`pwd` / `$PWD`）逐级解析。`.` 是当前目录，`..` 是父目录。
- 找程序：Shell 按 `$PATH`（冒号分隔的目录列表）搜索命令名；`which cmd` 看解析到哪个文件，`/bin/echo` 这类全路径可绕过 `$PATH`。`cd` 是 Shell 内建命令，所以 `which cd` 找不到它。

## 操作契约

- **先查手册再试**：`man cmd` 看完整手册，`cmd --help` 看摘要，装了 `tldr` 用 `tldr cmd` 看常见示例——从「魔法咒语」升级为「知道参数含义」。
- **路径含空格或特殊字符要引号**：`"My Photos"` 或 `My\ Photos`。单引号 `'...'` 内全是字面量，双引号 `"..."` 内允许 `$` 等展开。
- **核心命令速查**：`cat` 打印全文；`sort` 按行排序；`uniq` 去连续重复行；`head`/`tail` 看头尾几行；`grep pattern file` 搜正则匹配行（`-r` 递归搜目录）；`sed -i 's/a/b/g'` 原地替换；`find` 按条件找文件；`awk '{print $2}'` 按列取值。
- **Tab 补全**：补路径、补命令，比手打快且不易错。
- **现代替代按场景用**：讲义推荐 zoxide 的 `z`（记常用路径）、eza（替代 `ls`）、bat（替代 `cat`）、ripgrep（替代 `grep`）、fd（替代 `find`）——本地交互更顺手，但可移植性弱；写给别人看的命令、脚本和教程仍用标准工具。

## 练习

学习材料在 `exercises.md`。

> 改编自 MIT The Missing Semester 课程 Lecture 1: Course overview + the shell（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=MSgoeuMqUmU
