# 练习：Aliases 与 Dotfiles

对应课程第 2 讲的练习（节选，按主题归入本 skill），复习用。

1. **dc 别名**。创建一个 alias `dc`，让你把 `cd` 打错时也能正常工作。
2. **最常用的 10 条命令**。运行 `history | awk '{$1="";print substr($0,2)}' | sort | uniq -c | sort -n | tail -n 10`，找出你最常用的 10 条命令，考虑给它们写更短的 alias。（注意：这条命令适用于 Bash；ZSH 用户把 history 换成 `history 1`）
3. **dotfiles 入版本控制**。为你的 dotfiles 建一个目录，并把它纳入版本控制。
4. **第一个配置**。至少为一个程序加入配置（比如你的 shell），并做一些定制——刚开始哪怕只是通过设置 `$PS1` 调整 shell prompt 也可以。
5. **自动安装**。配置一种能在新机器上快速、自动安装 dotfiles 的方法：简单到写一个对每个文件执行 `ln -s` 的 shell 脚本，或者使用专门的工具。
6. **虚拟机验证**。在一台全新的虚拟机上测试你的安装脚本。
7. **全量迁移**。把你当前所有工具的配置都迁移到 dotfiles 仓库里。
8. **发布**。把你的 dotfiles 发布到 GitHub。

> 改编自 MIT The Missing Semester 课程 Lecture 2: Command-line Environment（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=ccBGsPedE9Q
