---
name: ssh-remote
description: >
  远程机器：SSH 免密密钥（ssh-keygen/ssh-copy-id/authorized_keys）、非交互执行与本地/远程管道、
  scp/rsync 传输、~/.ssh/config 主机别名与端口转发、mosh。Use when the user asks to connect to
  a remote server, set up SSH keys, copy files to/from a server, or write ssh config.
  触发于「连服务器/配 SSH 密钥/传文件到服务器/写 ssh config」。
---

# 远程机器与 SSH

主线：SSH 不只是「登录到远程敲命令」——它能非交互执行命令、把 stdout 接进本地管道、走密钥免密认证、按主机别名声明配置参数；scp、rsync、mosh 都吃同一份 `~/.ssh/config`。

## 操作契约

- **非交互执行**：`ssh user@host cmd` 在远程跑单条命令并带回 stdout。引号决定在哪边跑：`ssh host ls | wc -l` 是 ls 在远程、wc 在本地；`ssh host 'ls | wc -l'` 两边都在远程。
- **优先密钥认证**：`ssh-keygen -a 100 -t ed25519 -f ~/.ssh/id_ed25519` 生成密钥对；私钥本质上等同于密码，绝不要泄露。**务必给私钥设 passphrase**——不设的话，任何能读你文件系统的程序都能原样拿走私钥；passphrase 把密钥加密，配合 ssh-agent 免去重复输入。`ssh-keygen -y -f /path/to/key` 检查是否设了口令；`ssh-copy-id -i .ssh/id_ed25519.pub user@host` 把公钥装进服务器的 authorized_keys（它只干这一件事：拷一行公钥字符串）。
- **传输**：`scp path/to/local_file remote_host:path/to/remote_file`（反向同理）；rsync 增量同步——跳过两端一致的文件、`--partial` 断点续传，对符号链接/权限控制更细，常备优先。
- **~/.ssh/config 声明别名**：`Host vm` + `User`/`HostName`/`Port`/`IdentityFile`/`LocalForward`，ssh、scp、rsync、mosh 共用；支持 `Host *.mit.edu` 通配。
- **端口转发**：`LocalForward 9999 localhost:8888` 把远程服务映射到本地端口；`-N` 不执行命令、`-f` 放后台，合起来做后台隧道。
- **断线场景换 mosh**：网络切换、休眠恢复、高延迟时比 ssh 稳。
- **服务端加固**（练习场景）：sshd_config 里关 PasswordAuthentication、关 PermitRootLogin，重启 sshd 后重新登录验证。

## 练习

学习材料在 `exercises.md`。

> 改编自 MIT The Missing Semester 课程 Lecture 2: Command-line Environment（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=ccBGsPedE9Q
