FROM hashicorp/nomad:1.7.2

RUN cd /tmp && \
    wget https://download.docker.com/linux/static/stable/x86_64/docker-24.0.7.tgz && \
    tar xf docker-24.0.7.tgz && \
    mv -v docker/docker /bin && \
    rm -rf docker/ docker-24.0.7.tgz
