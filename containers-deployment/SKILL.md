---
name: containers-deployment
description: >
  容器与部署：VM vs 容器、Dockerfile 最佳实践与镜像分层、builder pattern、Docker Compose、
  systemd 自启、K8s 适用边界、配置与 secrets、DNS/反代/GitHub Pages。Use when the user asks
  to write a Dockerfile or docker-compose, containerize an app, or deploy a service.
  触发于「写 Dockerfile/compose/容器化/部署服务」。
---

# 容器与部署

主线：包管理器管不到的依赖（GPU 驱动、特定编译器版本、OpenSSL 这类系统库）用容器解决——把应用连同依赖、库、文件系统打包成镜像。VM 虚拟整台机器（隔离强、重）；容器共享宿主内核（轻、快、隔离弱）。配置必须在运行期提供：同一份代码只靠改配置就能换环境，才是对的。

## Docker 基础

- Docker = 标准化的构建/分发/运行容器平台；底层用 containerd 运行时（Kubernetes 也用）。
- `docker run -it python:3.12 python` 在容器里跑解释器：`-it` 交互终端，退出容器即停。
- 镜像 vs 容器：镜像 = 打包好的模板（制品），容器 = 镜像的运行实例；一个镜像可跑多个容器。
- 镜像分层：Dockerfile 每条指令（FROM/RUN/COPY）一层，层被缓存——改一行只重建它和之后的层（把常变的内容放靠后）。
- Dockerfile 反例 → 正例：整版 python 镜像 → slim 变体；多个独立 RUN → 合并一条 `&&`；不锁版本；不清理 apt 缓存（`rm -rf /var/lib/apt/lists/*`）；以 root 运行；把 secret 打进层。正例：`FROM python:3.12-slim`、`apt-get install -y --no-install-recommends`、按 uv.lock 安装、最后 `COPY . /app`。
- builder pattern：`COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv`——从构建镜像里拷预编译二进制，只带运行需要的最终产物，不带编译工具链。
- 三个局限：镜像平台相关（linux/amd64 镜像在 Apple Silicon 上要模拟、慢）；macOS/Windows 上 Docker 底层跑轻量 Linux VM、有开销；容器共享内核、隔离弱于 VM（多租户环境是安全顾虑）。

## 配置

- 配置不进代码，运行期提供：环境变量（`os.environ.get("DATABASE_URL", 默认值)` 带默认；必需项直接 `os.environ["API_KEY"]`，缺了即报错）或配置文件（yaml）。
- 好习惯判据：同一份代码只靠改配置就能部署到 dev/staging/prod——要改代码才能换环境就错了。
- secrets（API key 等）不进版本控制，避免意外暴露。

## 多服务与编排

- 现代应用 = 多个独立服务（数据库、缓存、消息队列），各自开发/部署/扩容——微服务架构，服务间走 HTTP API（调用 LLM 厂商 API 本质就是发 HTTP 请求并解析响应）。
- 别把 Redis 编进自己容器——两边依赖对不齐；各跑各的容器，交给 Compose 编排。
- Docker Compose：一个 YAML 声明全部服务（build/ports/environment/depends_on/volumes），`docker compose up` 一起启动；内部 DNS 自动解析服务名（web 用 hostname `cache` 连 Redis）；共享卷持久化。
- 生产自启：systemd 管 compose（`Type=oneshot`、`ExecStart=docker compose up -d`、`WantedBy=multi-user.target`）——开机即起，`systemctl start/stop/status` 标准控制。
- Kubernetes：要跨多机扩容、故障转移、高可用时再上；学习曲线陡、运维开销大——小项目是过度设计。

## 部署与发布

- 部署 Web 服务：域名注册、DNS 指向你的服务器、nginx 反代处理 HTTPS 与路由。
- 简单场景：文档/静态站用 GitHub Pages——仓库直接免费托管。

## 练习

学习材料在 `exercises.md`。

> 改编自 MIT The Missing Semester 课程 Lecture 6: Packaging and Shipping Code（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=KBMiB-8P4Ns
