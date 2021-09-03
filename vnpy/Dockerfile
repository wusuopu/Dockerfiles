FROM python:3.8.8-buster

RUN apt-get update && apt-get install -y build-essential locales && apt-get clean

ARG VNPY_VERSION=2.2.0
ARG GIT_MIRROR=github.com

RUN cd /root && \
    wget https://${GIT_MIRROR}/vnpy/vnpy/archive/refs/tags/${VNPY_VERSION}.tar.gz && \
    tar xf ${VNPY_VERSION}.tar.gz && \
    mv vnpy-${VNPY_VERSION} vnpy && \
    rm ${VNPY_VERSION}.tar.gz && \
    cd /root/vnpy && \
    bash ./install.sh && \
    rm -rf /tmp/ta-lib*

WORKDIR /root/vnpy

EXPOSE 80
