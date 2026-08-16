# The Missing Semester · Skills

[en](README_en.md) | [zh](README.md)

> Being a good software engineer isn't just about writing code that works — it's about writing code that others (including future you) can understand, maintain, and build upon.

This skill collection distills lectures from MIT's [*The Missing Semester of Your CS Education*](https://missing.csail.mit.edu/) (2026 edition) into reusable Claude Code skills, organized by lecture. Covered so far: Lecture 1, [*Course overview + the shell*](https://missing.csail.mit.edu/2026/course-shell/); Lecture 2, [*Command-line Environment*](https://missing.csail.mit.edu/2026/command-line-environment/); Lecture 3, [*Development Environment*](https://missing.csail.mit.edu/2026/development-environment/); Lecture 4, [*Debugging and Profiling*](https://missing.csail.mit.edu/2026/debugging-profiling/); Lecture 5, [*Version Control and Git*](https://missing.csail.mit.edu/2026/version-control/); Lecture 6, [*Packaging and Shipping Code*](https://missing.csail.mit.edu/2026/shipping-code/); Lecture 7, [*Agentic Coding*](https://missing.csail.mit.edu/2026/agentic-coding/); and Lecture 8, [*Beyond the Code*](https://missing.csail.mit.edu/2026/beyond-code/).

## Lecture 1 · Course overview + the shell

- **`shell-basics`** — Navigation, `man`/`--help`/`tldr` lookups, `$PATH` and `which`, quoting and escaping, core command cheatsheet. *User-invoked*
- **`shell-data-wrangling`** — Pipes `|`, redirection, and cat/sort/uniq/grep/sed/find/awk/xargs/tee/jq combos for one-command log analysis. *Model-invoked* ("help me write a command to process logs / text / CSV")
- **`shell-scripting`** — The bash language: shebang, `set -euo pipefail`, conditionals and loops, command substitution; pair with shellcheck, port to Python past ~100 lines. *Model-invoked* ("help me write a shell script")

> The lecture's course overview (instructors, purpose, structure) is meta information and is not distilled into a skill.

## Lecture 2 · Command-line Environment

- **`shell-conventions`** — Deep-dive conventions for arguments (`--` terminator / globbing), streams and redirection, environment variables (process substitution / `export`), return codes and `&&`/`||`; plus AI in the shell (`llm`). *User-invoked*
- **`shell-job-control`** — Signals (SIGINT/SIGTERM/SIGKILL), `&`/jobs/fg/bg, nohup/disown, `trap` cleanup, wait/pgrep/pkill. *Model-invoked* ("run this in the background / kill a process / write a cleanup script")
- **`ssh-remote`** — SSH keys and authorized_keys, non-interactive commands, scp/rsync, `~/.ssh/config` aliases and port forwarding, mosh. *Model-invoked* ("connect to a server / set up SSH keys / copy files")
- **`dotfiles`** — Dotfiles repo with symlinks, aliases/functions, PATH, package managers, Ctrl-R history search, terminal emulator choice. *Model-invoked* ("organize dotfiles / write an alias")
- **`tmux`** — Sessions/windows/panes hierarchy and `<C-b>` keybinding cheatsheet. *User-invoked*

## Lecture 3 · Development Environment

- **`vim-editing`** — The Vim interface language: modal editing, nouns (movement) / verbs (editing), counts and modifiers; Vim mode everywhere (VSCodeVim / Zsh / Claude Code). *User-invoked*
- **`dev-environment`** — IDE vs terminal workflow tradeoffs, language servers and LSP, the three forms of AI-driven development, extensions / remote / collaboration; notes DeepSeek Harness (dsh) for users in mainland China. *Model-invoked* ("set up my IDE / language server / AI autocomplete / extension")

## Lecture 4 · Debugging and Profiling

- **`debugging`** — The debugging tool ladder: print/logging, gdb, rr reverse debugging, strace/bpftrace, network capture, sanitizers/Valgrind, AI assistance. *Model-invoked* ("debug a crash / segfault / memory error")
- **`profiling`** — Performance analysis: the three `time` values, resource monitoring, tidy data and plotting, perf/flame graphs/callgrind, massif, hyperfine. *Model-invoked* ("analyze performance / find bottlenecks / benchmark")

> These two skills cover only the science side of the MIT lecture (principles and concrete tools); for the version mixed with engineering strategy (the art side), see dsh's built-in `debugging-and-profiling` and `diagnosing-bugs`.

## Lecture 5 · Version Control and Git

- **`git-data-model`** — blobs/trees/commits, the commit DAG, content addressing, references and HEAD, the staging area; every command is an operation on the model. *User-invoked*
- **`git-cli`** — Command map: daily use / branching & merging / remotes / undo / advanced / gitignore & config; commit messages and PRs point to `writing-for-readers` and `contributing-upstream`. *Model-invoked* ("commit / merge / resolve a conflict / push / undo in git")

## Lecture 6 · Packaging and Shipping Code

- **`python-packaging`** — pip/uv, venvs, dependency hell, pyproject.toml, wheels/sdists, lock files, publishing to PyPI/TestPyPI. *Model-invoked* ("create a venv / write pyproject.toml / build or publish / dependency conflicts")
- **`versioning-reproducibility`** — SemVer/CalVer, version specifiers, library-vs-application pinning strategy, hermetic builds, upgrades and rollback. *User-invoked*
- **`containers-deployment`** — Dockerfile best practices and image layers, Compose, systemd, when Kubernetes is worth it, configuration and secrets, deployment. *Model-invoked* ("write a Dockerfile / compose / containerize / deploy")

## Lecture 7 · Agentic Coding

- **`agentic-coding`** — The intern mental model, LLM mechanics and privacy, seven task types (implement / fix / refactor / review / understand / shell / vibe coding), caveats; notes dsh. *Model-invoked* ("implement / fix / refactor / review / understand with an agent")
- **`agent-context-management`** — The context toolkit (clear / rewind / compact / llms.txt / AGENTS.md / Skills), subagents, parallel agents with worktrees, MCP; this repo is itself a Skills practice. *Model-invoked* ("write an AGENTS.md / create a skill or subagent / manage context / MCP")

## Lecture 8 · Beyond the Code

### One-way communication

- **`writing-for-readers`** — Comments, READMEs, commit messages: capture the *why*, not just the *what*. *Model-invoked* ("help me write a commit message / comment / README / PR description")

### Collaboration

#### Contributing

- **`contributing-upstream`** — Bug reports, minimal repros, issues, PRs, licenses and security disclosure: maintainer time is scarce, keep the signal-to-noise ratio high. *Model-invoked* ("I want to report a bug / open a PR / contribute to open source / write a repro")

#### Reviewing

- **`code-review`** — Review the code, not the person: actionable suggestions, questions over demands, `nit:` markers, call out the good parts, know when to stop. *Model-invoked* ("help me review this code / this PR")

### Education

- **`asking-good-questions`** — Asking for help: state your understanding first, prefer yes/no questions, admit what you don't understand, don't accept incomplete answers. *User-invoked*

### AI etiquette

- **`ai-etiquette`** — Disclose substantive AI contributions, follow team policies, confirm the rules in assessment settings, don't let AI do the learning for you. *User-invoked*

## Installation

Copy this directory into Claude Code's skills folder (or `git clone` this repo to `~/.claude/skills/`). The sixteen *model-invoked* skills load automatically when relevant; the eight *user-invoked* skills carry zero context cost and are triggered by name. Each skill folder includes the lecture's exercises in `exercises.md` for review.

## Source & attribution

Adapted from the lecture notes and transcripts of *The Missing Semester of Your CS Education* (2026 edition).

- Lecture 1, Course overview + the shell: <https://missing.csail.mit.edu/2026/course-shell/> · video: <https://www.youtube.com/watch?v=MSgoeuMqUmU>
- Lecture 2, Command-line Environment: <https://missing.csail.mit.edu/2026/command-line-environment/> · video: <https://www.youtube.com/watch?v=ccBGsPedE9Q>
- Lecture 3, Development Environment: <https://missing.csail.mit.edu/2026/development-environment/> · video: <https://www.youtube.com/watch?v=QnM1nVzrkx8>
- Lecture 4, Debugging and Profiling: <https://missing.csail.mit.edu/2026/debugging-profiling/> · video: <https://www.youtube.com/watch?v=8VYT9TcUmKs>
- Lecture 5, Version Control and Git: <https://missing.csail.mit.edu/2026/version-control/> · video: <https://www.youtube.com/watch?v=9K8lB61dl3Y>
- Lecture 6, Packaging and Shipping Code: <https://missing.csail.mit.edu/2026/shipping-code/> · video: <https://www.youtube.com/watch?v=KBMiB-8P4Ns>
- Lecture 7, Agentic Coding: <https://missing.csail.mit.edu/2026/agentic-coding/> · video: <https://www.youtube.com/watch?v=sTdz6PZoAnw>
- Lecture 8, Beyond the Code: <https://missing.csail.mit.edu/2026/beyond-code/> · video: <https://www.youtube.com/watch?v=2DOEATfXT8k>
- Course materials are licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/); these skills follow the same license.
