FROM python:2.7-alpine

RUN cd /tmp && \
    wget https://releases.rancher.com/cli/v0.6.14/rancher-linux-amd64-v0.6.14.tar.gz && \
    tar xf rancher-linux-amd64-v0.6.14.tar.gz && \
    mv rancher-v0.6.14/rancher /usr/bin/ && \
    rm -rf rancher-linux-amd64-v0.6.14.tar.gz rancher-v0.6.14/ && \
    wget https://gist.githubusercontent.com/wusuopu/5fe22b309028ca2ad08c3242254f607b/raw/5db9e81803e866c7a3241d3115c0a1a5acde4642/rancher-service-upgrade.py && \
    mv rancher-service-upgrade.py /root/
