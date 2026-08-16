---
name: dotfiles
description: >
  环境定制：dotfiles 仓库与符号链接安装、alias 与 shell 函数、PATH/export、包管理器与
  rg/fd/tldr、Ctrl-R 历史搜索、oh-my-zsh 类框架的取舍、终端模拟器选择。Use when the user
  asks to set up or organize dotfiles, write aliases or shell functions, or customize their
  shell environment. 触发于「整理 dotfiles/写 alias/配置 shell 环境」。
---

# 环境定制与 dotfiles

主线：Shell 和多数命令行工具都用「点开头的纯文本文件」配置（ls 默认隐藏，纯属约定）。dotfiles 要进版本控制、用符号链接装到实际位置，才有新机器一分钟就绪、变更可追踪、终身可维护的好处。

## 操作契约

- **dotfiles 仓库**：单独目录 + git 管理 + 脚本 `ln -s` 到 `~`；换机器 clone 后跑安装脚本即可。先建仓库再逐步迁移，别追求一次搬空。参考资源：[dotfiles.github.io](https://dotfiles.github.io/)。
- **常用配置位置**：bash `~/.bashrc`/`~/.bash_profile`、git `~/.gitconfig`、vim `~/.vimrc`、ssh `~/.ssh/config`、tmux `~/.tmux.conf`。
- **PATH 追加**：`export PATH="$PATH:path/to/append"`——让子进程能找到新装的可执行文件。
- **装工具用包管理器**：macOS Homebrew、Ubuntu/Debian apt、Fedora dnf、Arch pacman；`rg`（ripgrep）替 grep、`fd` 替 find、`tldr` 给示例化 man page。不知道命令装哪个包？查 command-not-found.com。
- **alias 规则**：等号两边不能有空格（alias 是命令，接收单个参数）；不能接收命令中间位置的参数——复杂一点就写函数；`\ls` 临时忽略别名，`unalias la` 删除，`alias ll` 查看定义。常见：`alias ll="ls -lh"`、`alias gs="git status"`、`alias mv="mv -i"`、`alias mkdir="mkdir -p"`。
- **历史搜索**：Ctrl-R 反向搜索历史命令；配置 fzf 的 shell 集成后变成交互式模糊搜索。
- **框架与插件宁缺毋滥**：oh-my-zsh/prezto 类大框架明显拖慢启动，只装真正会用的单点插件（zsh-syntax-highlighting、zsh-autosuggestions、zsh-completions 等）；fish 这类 shell 内置了大部分。
- **终端模拟器也值得选**：字体、配色、快捷键、回滚缓冲、性能（Alacritty/Ghostty 支持 GPU 加速）——你会在这里面待上几百上千小时。

## 练习

学习材料在 `exercises.md`。

> 改编自 MIT The Missing Semester 课程 Lecture 2: Command-line Environment（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=ccBGsPedE9Q
