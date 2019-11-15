## 构建基础的 docker 镜像
先将达梦安装包放到 pkg 目录下，然后执行 `docker build -f Dockerfile.base . -t dameng:dm8-base`
该镜像仅安装了数据库，并没有执行初始化操作。
