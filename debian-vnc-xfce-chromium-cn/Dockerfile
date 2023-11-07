FROM accetto/debian-vnc-xfce-chromium-g3:latest

USER root

RUN apt-get update && \
    apt-get install -y locales fonts-wqy-zenhei && \
    localedef -c -f UTF-8 -i zh_CN zh_CN.utf8

ENV LANG zh_CN.UTF-8

USER 1000
