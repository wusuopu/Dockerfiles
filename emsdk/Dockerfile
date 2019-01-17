FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y build-essential cmake python2.7 python nodejs-legacy default-jre git-core curl && \
    apt-get clean

RUN git clone https://github.com/juj/emsdk.git /app && \
    cd /app && \
    ./emsdk install latest && \
    ./emsdk activate latest && \
    bash ./emsdk_env.sh && \
    cp emsdk_set_env.sh ~/.bashrc

WORKDIR /app
