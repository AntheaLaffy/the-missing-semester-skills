# 练习：远程机器（SSH）

对应课程第 2 讲的练习（节选，按主题归入本 skill），复习用。完成这些练习需要一台 Linux 虚拟机（或现成的机器）。

1. **密钥检查**。进入 `~/.ssh/`，检查是否已有一对 SSH 密钥；没有就用 `ssh-keygen -a 100 -t ed25519` 生成一对。建议给密钥设置密码，并配合 ssh-agent 使用。
2. **config 别名**。编辑 `.ssh/config`，加入类似下面的配置：

   ```
   Host vm
       User username_goes_here
       HostName ip_goes_here
       IdentityFile ~/.ssh/id_ed25519
       LocalForward 9999 localhost:8888
   ```

3. **ssh-copy-id**。用 `ssh-copy-id vm` 把 SSH 公钥复制到服务器上。
4. **端口转发验证**。在虚拟机里执行 `python -m http.server 8888` 启动 Web 服务器，然后在自己的机器上访问 http://localhost:9999，确认能访问虚拟机里的服务。
5. **服务端加固**。运行 `sudo vim /etc/ssh/sshd_config` 编辑 SSH 服务端配置：禁用 PasswordAuthentication、禁用 PermitRootLogin；`sudo service sshd restart` 重启后重新登录验证。
6. **mosh**（挑战）。在虚拟机里安装 mosh 并建立连接，然后断开服务器/虚拟机的网卡。mosh 能不能正确恢复连接？
7. **-N 与 -f**（挑战）。查一下 ssh 的 `-N` 和 `-f` 参数分别是什么意思，然后写出一条能实现后台端口转发的命令。

> 改编自 MIT The Missing Semester 课程 Lecture 2: Command-line Environment（讲义 + 口播稿，CC BY-NC-SA 4.0）：https://creativecommons.org/licenses/by-nc-sa/4.0/ · 课程站点：https://missing.csail.mit.edu/ · 讲座视频：https://www.youtube.com/watch?v=ccBGsPedE9Q
