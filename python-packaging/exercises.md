# 练习：Python 打包与发布

对应课程第 6 讲的练习（节选，按主题归入本 skill），复习用。

1. **环境激活到底改了什么**。把当前环境用 `printenv` 存到文件，创建 venv、激活它、再 `printenv` 到另一个文件，diff 前后两个文件——环境变量变在哪？为什么 shell 会优先用 venv？（提示：看激活前后的 `$PATH`。）运行 `which deactivate`，想想这个 bash 函数在做什么。
2. **造一个包**。写一个带 pyproject.toml 的 Python 包，把它装进虚拟环境；生成锁文件（`uv lock`）并检查里面的内容。
3. **发布到 TestPyPI**。把一个 Python 包发布到 TestPyPI（别发真 PyPI，除非值得分享！）；然后把它做成 Docker 镜像并推到 ghcr.io。

> 改编自 MIT The Missing Semester 课程 Lecture 6: Packaging and Shipping Code（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=KBMiB-8P4Ns
