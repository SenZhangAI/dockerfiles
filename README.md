## 简介

自用的Dockerfile，包括自用的zsh vim 配置等，用于快速开启一个测试环境，执行简单的测试任务

## Tips

修改国内镜像源:

```bash
# vi /etc/docker/daemon.json
{
    "registry-mirrors": ["http://hub-mirror.c.163.com"]
}
systemctl restart docker.service
```
