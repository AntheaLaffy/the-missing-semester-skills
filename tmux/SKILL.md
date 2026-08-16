---
name: tmux
description: >
  tmux 终端复用器速查：sessions/windows/panes 层级、detach/attach、常用快捷键（<C-b> d/c/%/"/z/[）。
  手动点名使用。
disable-model-invocation: true
---

# tmux 终端复用器

主线：tmux 把「多窗格、多窗口、断线不丢」做进终端里——窗格并排、会话分离再附着，远程机器上基本告别 nohup 技巧。

## 对象层级

- **Session（会话）**：独立工作区，可含多个 window。`tmux` 新建、`tmux new -s NAME` 命名、`tmux ls` 列出、`tmux a` 附着最近一个（`-t` 指定具体会话）、`<C-b> d` 分离。
- **Window（窗口）**：会话里的 tab。`<C-b> c` 新建（shell 里 `<C-d>` 退出即关闭）、`<C-b> N` 跳到第 N 个、`<C-b> p`/`<C-b> n` 前/后一个、`<C-b> ,` 重命名、`<C-b> w` 列出。
- **Pane（窗格）**：vim 式分栏。`<C-b> "` 水平拆分、`<C-b> %` 垂直拆分、`<C-b> <方向键>` 切换、`<C-b> z` 缩放、`<C-b> <space>` 轮换布局。

## 操作契约

- **快捷键形式 `<C-b> x`**：先按 Ctrl+b 并松开，再按 x。
- **回看与复制**：`<C-b> [` 进入滚动回看模式，`<space>` 开始选择，`<enter>` 复制选中内容。
- **远程场景**：ssh 到服务器后先开 tmux 再跑长任务——断网重连后 `tmux a` 原样接回，替代 nohup/disown。机制：断开连接时 Shell 会发 SIGHUP 杀掉会话里的进程，tmux 捕获 SIGHUP 不往下传，进程因此存活。

## 练习

学习材料在 `exercises.md`。

> 改编自 MIT The Missing Semester 课程 Lecture 2: Command-line Environment（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=ccBGsPedE9Q
