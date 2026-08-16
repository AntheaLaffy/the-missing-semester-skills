#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# The Missing Semester · Skills 一键安装脚本
#
# 用法:
#   bash install.sh [claude|agents|opencode|codex|all] [--yes]
#   bash install.sh --uninstall [target...]
#
# 行为:
#   - 把本仓库每个含 SKILL.md 的 skill 目录软链接到所选 agent 的 skills 目录
#   - 对其他 agent 的 skills 目录:
#       已存在 -> 可选同步安装
#       不存在 -> 可选把它建成指向主目标的软链接
#   - opencode 原生读取 ~/.claude/skills 与 ~/.agents/skills,自动覆盖,无需单独装
# ============================================================

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ---- 小工具 ----
c_green=$'\033[32m'; c_yellow=$'\033[33m'; c_red=$'\033[31m'; c_off=$'\033[0m'
info()  { printf '%s\n' "$*"; }
ok()    { printf '%s[OK]%s %s\n' "$c_green" "$c_off" "$*"; }
warn()  { printf '%s[跳过]%s %s\n' "$c_yellow" "$c_off" "$*"; }
err()   { printf '%s[错误]%s %s\n' "$c_red" "$c_off" "$*" >&2; }

# agent 标识 -> skills 目录(相对 $HOME)
dir_for() {
  case "$1" in
    claude)   printf '%s' '.claude/skills' ;;
    agents)   printf '%s' '.agents/skills' ;;
    opencode) printf '%s' '.config/opencode/skills' ;;
    codex)    printf '%s' '.codex/skills' ;;
    *) return 1 ;;
  esac
}

label_for() {
  case "$1" in
    claude)   printf '%s' 'Claude Code' ;;
    agents)   printf '%s' 'dsh / DeepSeek Harness' ;;
    opencode) printf '%s' 'OpenCode' ;;
    codex)    printf '%s' 'Codex CLI' ;;
    *) return 1 ;;
  esac
}

confirm() { # confirm <提示>  -> 0 同意 / 1 拒绝
  if [ "$ASSUME_YES" = 1 ]; then return 0; fi
  local ans
  printf '%s [y/N] ' "$1" >&2
  read -r ans
  case "$ans" in y|Y|yes|YES) return 0 ;; *) return 1 ;; esac
}

# 把仓库里所有 skill 软链接进 <target> 目录
link_skills() {
  local target="$1" name link n=0
  mkdir -p "$target"
  for d in "$REPO_DIR"/*/; do
    name="$(basename "$d")"
    [ -f "$d/SKILL.md" ] || continue
    link="$target/$name"
    if [ -L "$link" ]; then
      rm -f "$link" && ln -s "$d" "$link" && n=$((n + 1))
    elif [ -e "$link" ]; then
      warn "$link 已存在且不是软链接,不动它"
    else
      ln -s "$d" "$link" && n=$((n + 1))
    fi
  done
  ok "已安装 $n 个 skill -> $target"
}

# 卸载:移除各目标目录里指向本仓库的软链接
uninstall_from() {
  local target="$1" link dest removed=0
  [ -d "$target" ] || return 0
  for link in "$target"/*/; do
    [ -L "${link%/}" ] || continue
    dest="$(readlink "${link%/}" || true)"
    case "$dest" in
      "$REPO_DIR"/*)
        rm -f "${link%/}" && removed=$((removed + 1)) ;;
    esac
  done
  if [ "$removed" -gt 0 ]; then ok "从 $target 移除了 $removed 个软链接"; fi
  # 若整个目录是我们建的文件夹级软链接,也一并移除
  if [ -L "$target" ]; then
    rm -f "$target" && ok "移除了文件夹级软链接 $target"
  fi
}

# ---- 参数解析 ----
ASSUME_YES=0; UNINSTALL=0; PRIMARY=""
for arg in "$@"; do
  case "$arg" in
    --yes)       ASSUME_YES=1 ;;
    --uninstall) UNINSTALL=1 ;;
    claude|agents|opencode|codex|all) PRIMARY="$arg" ;;
    *) err "无法识别的参数: $arg"; exit 2 ;;
  esac
done

# ---- 卸载模式 ----
if [ "$UNINSTALL" = 1 ]; then
  targets="${PRIMARY:-claude agents opencode codex}"
  for t in $targets; do
    rel="$(dir_for "$t" 2>/dev/null || true)"
    [ -n "$rel" ] || continue
    uninstall_from "$HOME/$rel"
  done
  info "卸载完成。仓库本身没有改动,可以放心删除。"
  exit 0
fi

# ---- 选主目标 ----
if [ -z "$PRIMARY" ]; then
  if [ "$ASSUME_YES" = 1 ]; then
    PRIMARY=agents
  else
    info "选择安装到哪个 agent 的 skills 目录:"
    info "  1) claude   -> ~/.claude/skills            (Claude Code)"
    info "  2) agents   -> ~/.agents/skills            (dsh / DeepSeek Harness)"
    info "  3) opencode -> ~/.config/opencode/skills   (OpenCode)"
    info "  4) codex    -> ~/.codex/skills             (Codex CLI)"
    info "  5) all      -> 全部"
    printf '请输入 1-5 [2]: ' >&2
    read -r choice
    case "${choice:-2}" in
      1) PRIMARY=claude ;;
      3) PRIMARY=opencode ;;
      4) PRIMARY=codex ;;
      5) PRIMARY=all ;;
      *) PRIMARY=agents ;;
    esac
  fi
fi

info "仓库: $REPO_DIR"

install_to() {
  local t="$1" rel dir
  rel="$(dir_for "$t")"; dir="$HOME/$rel"
  link_skills "$dir"
}

if [ "$PRIMARY" = all ]; then
  for t in claude agents opencode codex; do install_to "$t"; done
else
  install_to "$PRIMARY"
  info "检查其他 agent 的 skills 目录:"
  for t in claude agents opencode codex; do
    [ "$t" = "$PRIMARY" ] && continue
    rel="$(dir_for "$t")"; dir="$HOME/$rel"
    # opencode 原生读 .claude 与 .agents,主目标已覆盖它
    if [ "$t" = opencode ] && { [ "$PRIMARY" = claude ] || [ "$PRIMARY" = agents ]; }; then
      info "  - opencode: 原生读取 ~/.claude/skills 与 ~/.agents/skills,已被覆盖,无需单独安装"
      continue
    fi
    if [ -d "$dir" ] || [ -L "$dir" ]; then
      if confirm "  - 检测到 $(label_for "$t") 的目录 $rel 已存在,也把 skills 安装进去?"; then
        link_skills "$dir"
      else
        info "  - 保持不动: $rel"
      fi
    else
      if confirm "  - $rel 不存在,把它建成指向 ~/$(dir_for "$PRIMARY") 的软链接?"; then
        mkdir -p "$(dirname "$dir")"
        ln -s "$HOME/$(dir_for "$PRIMARY")" "$dir"
        ok "已创建软链接 $rel -> $(dir_for "$PRIMARY")"
      fi
    fi
  done
fi

info ""
info "完成。卸载: bash install.sh --uninstall"
if [ "$PRIMARY" = all ]; then
  info "验证: ls ~/.claude/skills ~/.agents/skills ~/.config/opencode/skills ~/.codex/skills"
else
  info "验证: ls ~/$(dir_for "$PRIMARY")"
fi
