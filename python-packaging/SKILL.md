---
name: python-packaging
description: >
  Python 打包与发布：pip/uv、venv 虚拟环境、依赖地狱、pyproject.toml、wheel 与 sdist、
  锁文件 uv.lock、PyPI/TestPyPI 发布。Use when the user asks to create a virtual environment,
  write a pyproject.toml, build or publish a Python package, or fix dependency conflicts.
  触发于「建 venv/写 pyproject/打包发布/依赖冲突」。
---

# Python 打包与发布

主线：能跑 ≠ 能交付——shipping 是把代码变成「别人不用你的电脑环境也能装」的制品（artifact）。本讲以 Python 为介质讲通用概念：依赖、环境、制品、版本、发布。其他语言工具不同、概念一致：Rust 用 cargo 统一构建/测试/依赖/发布；Python 在规范层统一（PEP 517/621 定义打包接口与 pyproject.toml 元数据，pip/uv、setuptools/hatch/poetry 多工具竞争）；LaTeX 发行版（TeX Live/MacTeX）自带几千个包。

## 依赖与环境

- 安装流程（pip/uv）：查索引（PyPI）→ 选平台匹配的制品 → 解析传递依赖 → 下载解包落盘。requests 依赖 urllib3/idna/certifi/charset-normalizer——装它之前必须先装这些。
- 依赖冲突 = 依赖地狱：多个包要求同一依赖的互斥版本区间（tensorflow 要 numpy<1.19，另一个包要 >=1.19）→ 无解。解法：每个项目一个虚拟环境，各自隔离。
- venv：`python -m venv venv && source venv/bin/activate`——环境 = 独立的运行时副本 + 自己的包集合。激活后 PATH 指向 venv/bin，`which python`/`which pip` 都变了；`deactivate` 退出。
- uv 优先：与 pip 同接口但快一个量级（`pip install uv` 装上）；`uv venv --python 3.12` 还能管理多版本运行时（多版本测试、项目锁版本用）。
- 别改系统自带的 Python 安装——OS 自己的功能可能依赖它；用独立环境。

## 制品与打包

- 源码 vs 制品：开发者读写源码；制品是打包好的可分发产物。Python 只在特定位置找模块（当前目录、已装包、PYTHONPATH）——换个目录 import 就失败，打包 = 把代码装进已知位置。
- pyproject.toml 是清单（manifest）：名字、版本、依赖、`[project.scripts]` 声明 CLI 入口、build-system。现代首选；requirements.txt/setup.py 是旧法，兼容但别新建。
- `uv build` 产出两种制品：.whl（wheel，特定结构的 zip：代码 + METADATA/WHEEL/RECORD）与 .tar.gz（sdist 源码发行版，给需要从源码构建的系统）。wheel 文件名编码平台：`py3-none-any` 通用；`cp312-macosx_14_0_arm64` 平台专用（含编译代码的包如 numpy 分平台）。
- 平台相关依赖（CUDA、GPU 驱动等）超出包管理器范围：要分平台分别构建，或依赖系统级安装（见 `containers-deployment`）。
- 安装方式二分：从源码装（要编译器、慢、大项目可能极久）vs 预编译二进制（快，但必须匹配平台/架构，如 ripgrep 的 releases 页）。

## 发布

- 最简发布 = 把制品放上网让人下载（Ubuntu 的包存档本质就是 HTTP 目录下的 .deb 列表）。
- GitHub 是事实平台：Releases 给打 tag 的版本附预编译制品；pip 可直接从 GitHub 装（`git+https://github.com/psf/requests.git@v2.32.3` 从源码/tag，或 release 里的 wheel 直链）。
- Go 是去中心化：模块路径即仓库地址（github.com/gorilla/mux），`go get` 直接拉。多数生态（pip/cargo/brew）用中央索引。
- 让别人找得到 → 发布到 registry：Python 是 PyPI；Rust crates.io、JS npm、Ruby RubyGems、容器镜像 Docker Hub；私有包用自建或云托管私有仓库。
- 发布练习先上 TestPyPI（独立测试 registry，不污染真 PyPI）：`uv publish --publish-url https://test.pypi.org/legacy/`；装回用 `--index-url https://test.pypi.org/simple/`。
- 信任：registry 用校验和验证完整性；部分生态支持包签名，对作者身份做密码学证明。

## 练习

学习材料在 `exercises.md`。

> 改编自 MIT The Missing Semester 课程 Lecture 6: Packaging and Shipping Code（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=KBMiB-8P4Ns
