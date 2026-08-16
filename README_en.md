# The Missing Semester · Skills

[en](README_en.md) | [zh](README.md)

> Being a good software engineer isn't just about writing code that works — it's about writing code that others (including future you) can understand, maintain, and build upon.

This skill collection distills lectures from MIT's [*The Missing Semester of Your CS Education*](https://missing.csail.mit.edu/) (2026 edition) into reusable Claude Code skills, organized by lecture. Covered so far: Lecture 1, [*Course overview + the shell*](https://missing.csail.mit.edu/2026/course-shell/), and Lecture 8, [*Beyond the Code*](https://missing.csail.mit.edu/2026/beyond-code/).

## Lecture 1 · Course overview + the shell

- **`shell-basics`** — Navigation, `man`/`--help`/`tldr` lookups, `$PATH` and `which`, quoting and escaping, core command cheatsheet. *User-invoked*
- **`shell-data-wrangling`** — Pipes `|`, redirection, and cat/sort/uniq/grep/sed/find/awk/xargs/tee/jq combos for one-command log analysis. *Model-invoked* ("help me write a command to process logs / text / CSV")
- **`shell-scripting`** — The bash language: shebang, `set -euo pipefail`, conditionals and loops, command substitution; pair with shellcheck, port to Python past ~100 lines. *Model-invoked* ("help me write a shell script")

> The lecture's course overview (instructors, purpose, structure) is meta information and is not distilled into a skill.

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

Copy this directory into Claude Code's skills folder (or `git clone` this repo to `~/.claude/skills/`). The five *model-invoked* skills load automatically when relevant; the three *user-invoked* skills carry zero context cost and are triggered by name. Each skill folder includes the lecture's exercises in `exercises.md` for review.

## Source & attribution

Adapted from the lecture notes and transcripts of *The Missing Semester of Your CS Education* (2026 edition).

- Lecture 1, Course overview + the shell: <https://missing.csail.mit.edu/2026/course-shell/> · video: <https://www.youtube.com/watch?v=MSgoeuMqUmU>
- Lecture 8, Beyond the Code: <https://missing.csail.mit.edu/2026/beyond-code/> · video: <https://www.youtube.com/watch?v=2DOEATfXT8k>
- Course materials are licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/); these skills follow the same license.
