# The Missing Semester · Skills

[en](README_en.md) | [zh](README.md)

> 好的软件工程师不只是写出能跑的代码——还要写出别人（包括未来的你）能看懂、能维护、能继续构建的代码。

本组 skills 整理自 MIT [*The Missing Semester of Your CS Education*](https://missing.csail.mit.edu/)（2026 版），把「代码之外的另一半工程能力」固化为可随时调用的 Claude Code skills，按课程章节组织。目前已覆盖第 1 讲 [*Course overview + the shell*](https://missing.csail.mit.edu/2026/course-shell/) 与第 8 讲 [*Beyond the Code*](https://missing.csail.mit.edu/2026/beyond-code/)。

## 第 1 讲 · Course overview + the shell

- **`shell-basics`** — 导航、`man`/`--help`/`tldr` 查手册、`$PATH` 与 `which`、引号与转义、核心命令速查。*手动点名使用*
- **`shell-data-wrangling`** — `|` 管道、重定向与 cat/sort/uniq/grep/sed/find/awk/xargs/tee/jq 组合，一条命令完成日志分析。*自动触发*（「帮我写条命令处理日志/文本/CSV」）
- **`shell-scripting`** — bash 脚本语言：shebang、`set -euo pipefail`、条件循环、命令替换；配 shellcheck，超百行迁 Python。*自动触发*（「帮我写 shell 脚本」）

> 第 1 讲的课程概览（讲师、课程目的与结构）是元信息，未固化为 skill。

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

## 安装

把本目录复制到 Claude Code 的 skills 文件夹（或 `git clone` 本仓库到 `~/.claude/skills/`）即可：五个标注「自动触发」的 skill 由模型按需加载，三个「手动点名」的 skill 零上下文成本、需要时点名使用。每个 skill 目录下附有课程练习题 `exercises.md`，供复习。

## 来源与署名

改编自 *The Missing Semester of Your CS Education*（2026 版）各讲讲义与讲座口播稿。

- 第 1 讲 Course overview + the shell：<https://missing.csail.mit.edu/2026/course-shell/> · 视频：<https://www.youtube.com/watch?v=MSgoeuMqUmU>
- 第 8 讲 Beyond the Code：<https://missing.csail.mit.edu/2026/beyond-code/> · 视频：<https://www.youtube.com/watch?v=2DOEATfXT8k>
- 课程内容以 [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 许可发布，本组 skills 遵循同一许可。
