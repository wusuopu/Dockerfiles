## 构建基础的 docker 镜像

先将达梦安装包放到 pkg 目录下，然后执行 `docker build -f Dockerfile.base . -t wusuopu/dameng:dm8-base`

该镜像仅安装了数据库，并没有执行初始化操作。


## 构建数据库服务镜像

执行 `docker build . -t wusuopu/dameng:dm8`

### 使用方法

```
docker run -v $PWD/data:/data \
    --expose 5236 \
    --env DM_KEY_PATH=<key_path>
    -d wusuopu/dameng:dm8
```
