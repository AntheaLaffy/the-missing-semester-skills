# 练习：Shell 导航与基础

对应课程第 1 讲的练习（节选，按主题归入本 skill），复习用。

1. **确认环境**。课程要求类 Unix Shell（Bash/ZSH）。运行 `echo $SHELL`，输出类似 `/bin/bash` 或 `/usr/bin/zsh` 就没问题；Windows 用 WSL 或 Linux 虚拟机。
2. **读懂 ls -l**。`ls -l /` 每行最前面的 10 个字符分别代表什么？（提示：`man ls`）
3. **glob 模式**。`find ~/Downloads -type f -name "*.zip" -mtime +30` 里的 `*.zip` 是什么？建个测试目录，试试 `ls *.txt`、`ls file?.txt`、`ls {a,b,c}.txt`。（参见 Bash 手册 Pattern Matching）
4. **三种引号**。'单引号'、"双引号"、$'ANSI 引号' 有什么区别？写一条命令，输出同时含字面量 `$`、`!` 和换行符的字符串。（参见 Quoting）
5. **cd 为什么是内建命令**？想想子进程能影响和不能影响父进程的哪些状态。

> 改编自 MIT The Missing Semester 课程 Lecture 1: Course overview + the shell（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=MSgoeuMqUmU
