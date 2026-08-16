# The Missing Semester · Skills

[en](README_en.md) | [zh](README.md)

> 好的软件工程师不只是写出能跑的代码——还要写出别人（包括未来的你）能看懂、能维护、能继续构建的代码。

本组 skills 整理自 MIT [*The Missing Semester of Your CS Education*](https://missing.csail.mit.edu/)（2026 版），把「代码之外的另一半工程能力」固化为可随时调用的 Claude Code skills，按课程章节组织。目前已覆盖第 1 讲 [*Course overview + the shell*](https://missing.csail.mit.edu/2026/course-shell/)、第 2 讲 [*Command-line Environment*](https://missing.csail.mit.edu/2026/command-line-environment/)、第 3 讲 [*Development Environment*](https://missing.csail.mit.edu/2026/development-environment/)、第 4 讲 [*Debugging and Profiling*](https://missing.csail.mit.edu/2026/debugging-profiling/)、第 5 讲 [*Version Control and Git*](https://missing.csail.mit.edu/2026/version-control/)、第 6 讲 [*Packaging and Shipping Code*](https://missing.csail.mit.edu/2026/shipping-code/)、第 7 讲 [*Agentic Coding*](https://missing.csail.mit.edu/2026/agentic-coding/)、第 8 讲 [*Beyond the Code*](https://missing.csail.mit.edu/2026/beyond-code/) 与第 9 讲 [*Code Quality*](https://missing.csail.mit.edu/2026/code-quality/)。

## 第 1 讲 · Course overview + the shell

- **`shell-basics`** — 导航、`man`/`--help`/`tldr` 查手册、`$PATH` 与 `which`、引号与转义、核心命令速查。*手动点名使用*
- **`shell-data-wrangling`** — `|` 管道、重定向与 cat/sort/uniq/grep/sed/find/awk/xargs/tee/jq 组合，一条命令完成日志分析。*自动触发*（「帮我写条命令处理日志/文本/CSV」）
- **`shell-scripting`** — bash 脚本语言：shebang、`set -euo pipefail`、条件循环、命令替换；配 shellcheck，超百行迁 Python。*自动触发*（「帮我写 shell 脚本」）

> 第 1 讲的课程概览（讲师、课程目的与结构）是元信息，未固化为 skill。

## 第 2 讲 · Command-line Environment

- **`shell-conventions`** — 参数（`--` 终止选项/glob）、流与重定向、环境变量（进程替换/export）、返回码与 `&&`/`||` 的深层约定；附 AI in Shell（`llm`）。*手动点名使用*
- **`shell-job-control`** — 信号（SIGINT/SIGTERM/SIGKILL）、`&`/jobs/fg/bg、nohup/disown、trap 清理、wait/pgrep/pkill。*自动触发*（「放后台跑/杀掉进程/写清理脚本」）
- **`ssh-remote`** — SSH 密钥与 authorized_keys、非交互执行、scp/rsync、`~/.ssh/config` 别名与端口转发、mosh。*自动触发*（「连服务器/配 SSH 密钥/传文件」）
- **`dotfiles`** — dotfiles 仓库与符号链接、alias/函数、PATH、包管理器、Ctrl-R 历史搜索、终端模拟器选择。*自动触发*（「整理 dotfiles/写 alias」）
- **`tmux`** — sessions/windows/panes 层级与 `<C-b>` 快捷键速查。*手动点名使用*

## 第 3 讲 · Development Environment

- **`vim-editing`** — Vim 界面语言：模态编辑、名词（移动）/动词（编辑）、计数与修饰符；Vim mode 处处可用（VSCodeVim/Zsh/Claude Code）。*手动点名使用*
- **`dev-environment`** — IDE vs 终端工作流取舍、语言服务器与 LSP、AI 驱动开发三种形态、扩展/远程/协作；附国内可用 DeepSeek Harness（dsh）注记。*自动触发*（「帮我配 IDE/语言服务器/AI 补全/装扩展」）

## 第 4 讲 · Debugging and Profiling

- **`debugging`** — 调试工具阶梯：print/logging、gdb、rr 反向调试、strace/bpftrace、网络抓包、sanitizers/Valgrind、AI 辅助。*自动触发*（「帮我调试/排查崩溃/段错误/内存错误」）
- **`profiling`** — 性能分析：time 三值、资源监控、tidy 数据与绘图、perf/火焰图/callgrind、massif、hyperfine。*自动触发*（「帮我分析性能/找瓶颈/benchmark」）

> 本讲这两个 skill 只做 MIT 讲义的科学面（原理与具体工具）；与工程策略（艺术面）混合的版本见 dsh 内置的 `debugging-and-profiling` 与 `diagnosing-bugs`。

## 第 5 讲 · Version Control and Git

- **`git-data-model`** — blob/tree/commit、提交 DAG、内容寻址、引用与 HEAD、暂存区；每条命令都是对模型的操作。*手动点名使用*
- **`git-cli`** — 命令地图：日常/分支合并/远程/撤销/进阶/gitignore/config；提交信息与 PR 分别指向 `writing-for-readers` 与 `contributing-upstream`。*自动触发*（「帮我 git 提交/合并/解冲突/推送/撤销」）

## 第 6 讲 · Packaging and Shipping Code

- **`python-packaging`** — pip/uv、venv、依赖地狱、pyproject.toml、wheel/sdist、锁文件、PyPI/TestPyPI 发布。*自动触发*（「建 venv/写 pyproject/打包发布/依赖冲突」）
- **`versioning-reproducibility`** — SemVer/CalVer、版本约束、库 vs 应用的锁定策略、hermetic builds、升级与回滚。*手动点名使用*
- **`containers-deployment`** — Dockerfile 最佳实践与镜像分层、Compose、systemd、K8s 边界、配置与 secrets、部署发布。*自动触发*（「写 Dockerfile/compose/容器化/部署服务」）

## 第 7 讲 · Agentic Coding

- **`agentic-coding`** — 实习生心智模型、LLM 原理与隐私、七类应用场景（实现/修复/重构/审查/理解/Shell/氛围编程）、注意事项；附 dsh 注记。*自动触发*（「用智能体实现/修复/重构/审查/理解代码」）
- **`agent-context-management`** — 上下文六件套（清空/回退/压缩/llms.txt/AGENTS.md/Skills）、子智能体、并行智能体与 worktrees、MCP；本仓库本身就是 Skills 机制的实践。*自动触发*（「写 AGENTS.md/建 skill/子智能体/管上下文/MCP」）

> 这两个 skill 均附 dsh（DeepSeek Harness）专属实操练习 `exercises-dsh.md`——把讲义里的 Claude Code 机制（Skills/子智能体/上下文压缩/确认提示）一一映射到 dsh，快速上手 dsh 用。官方文档：<https://www.deepseek.com/harness/>

## 第 8 讲 · Beyond the Code

### One-way communication（单向沟通）

- **`writing-for-readers`** — 注释、README、提交信息：只记录「为什么」，不复述「做了什么」。*自动触发*（「帮我写提交信息/注释/README/PR 描述」）

### Collaboration（协作）

#### Contributing（贡献）

- **`contributing-upstream`** — bug 报告、最小可复现、issue、PR、许可证与安全披露：维护者时间极稀缺，贡献要信噪比高。*自动触发*（「我要报个 bug/提个 PR/贡献开源/写个复现」）

#### Reviewing（评审）

- **`code-review`** — 评审代码，不评审人：可操作建议、提问而非命令、`nit:` 标记、肯定好做法、知道何时收手。*自动触发*（「帮我评审这段代码/这个 PR」）

### Education（教学互助）

- **`asking-good-questions`** — 提问与求助技巧：先陈述理解、多问是/否问题、承认不懂、追问到底。*手动点名使用*

### AI etiquette（AI 礼仪）

- **`ai-etiquette`** — 实质性贡献要披露、遵循团队政策、评估场景先确认是否允许、学习阶段别让 AI 代劳。*手动点名使用*

## 第 9 讲 · Code Quality

- **`code-quality-tooling`** — 格式化器（Prettier/Black/gofmt/EditorConfig）、linter（规则/预设/自动修复）、semgrep 语义 grep。*自动触发*（「配格式化/linter/修 lint 错误」）
- **`testing`** — 测试类型（单元/集成/功能/回归/性质测试）、mock、行覆盖率与 Codecov；TDD 纪律另见 dsh 的 `tdd` skill。*自动触发*（「写测试/提覆盖率」）
- **`ci-cd`** — pre-commit 钩子、GitHub Actions（push/PR/定时、矩阵、只检查模式、徽章）、持续部署、just/npm scripts 命令运行器。*自动触发*（「配 pre-commit/CI/CD/just」）
- **`regex`** — 语法速查、捕获组与引用、贪婪陷阱、局限性。*手动点名使用*

## 安装

一键安装（软链接方式，仓库更新后各 agent 立即可用）：

```bash
# 推荐：先下载、看一眼，再执行
curl -fsSL https://raw.githubusercontent.com/AntheaLaffy/the-missing-semester-skills/main/install.sh -o install.sh
less install.sh
bash install.sh            # 交互选择 claude / agents / opencode / all

# 或者一步到位（dsh 用户）
curl -fsSL https://raw.githubusercontent.com/AntheaLaffy/the-missing-semester-skills/main/install.sh | bash -s -- agents --yes
```

- 主目标可选：`~/.claude/skills`（Claude Code）、`~/.agents/skills`（dsh / DeepSeek Harness）、`~/.config/opencode/skills`（OpenCode）、`~/.codex/skills`（Codex CLI）
- 其他 agent 的 skills 目录已存在 → 可选同步安装；不存在 → 可选建成指向主目标的软链接
- opencode 原生读取 `.claude/skills` 与 `.agents/skills`，装给前两者即自动覆盖
- 卸载：`bash install.sh --uninstall`

老办法同样可行：把本目录复制进 skills 文件夹，或 `git clone` 本仓库到 `~/.claude/skills/`。

十九个标注「自动触发」的 skill 由模型按需加载，九个「手动点名」的 skill 零上下文成本、需要时点名使用。每个 skill 目录下附有课程练习题 `exercises.md`，供复习。

## 来源与署名

改编自 *The Missing Semester of Your CS Education*（2026 版）各讲讲义与讲座口播稿。

- 第 1 讲 Course overview + the shell：<https://missing.csail.mit.edu/2026/course-shell/> · 视频：<https://www.youtube.com/watch?v=MSgoeuMqUmU>
- 第 2 讲 Command-line Environment：<https://missing.csail.mit.edu/2026/command-line-environment/> · 视频：<https://www.youtube.com/watch?v=ccBGsPedE9Q>
- 第 3 讲 Development Environment：<https://missing.csail.mit.edu/2026/development-environment/> · 视频：<https://www.youtube.com/watch?v=QnM1nVzrkx8>
- 第 4 讲 Debugging and Profiling：<https://missing.csail.mit.edu/2026/debugging-profiling/> · 视频：<https://www.youtube.com/watch?v=8VYT9TcUmKs>
- 第 5 讲 Version Control and Git：<https://missing.csail.mit.edu/2026/version-control/> · 视频：<https://www.youtube.com/watch?v=9K8lB61dl3Y>
- 第 6 讲 Packaging and Shipping Code：<https://missing.csail.mit.edu/2026/shipping-code/> · 视频：<https://www.youtube.com/watch?v=KBMiB-8P4Ns>
- 第 7 讲 Agentic Coding：<https://missing.csail.mit.edu/2026/agentic-coding/> · 视频：<https://www.youtube.com/watch?v=sTdz6PZoAnw>
- 第 8 讲 Beyond the Code：<https://missing.csail.mit.edu/2026/beyond-code/> · 视频：<https://www.youtube.com/watch?v=2DOEATfXT8k>
- 第 9 讲 Code Quality：<https://missing.csail.mit.edu/2026/code-quality/> · 视频：<https://www.youtube.com/watch?v=XBiLUNx84CQ>
- 课程内容以 [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 许可发布，本组 skills 遵循同一许可。
