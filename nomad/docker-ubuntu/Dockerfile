FROM ubuntu:jammy

# install docker-cli
RUN apt-get update && \
    apt-get install -y ca-certificates curl gnupg unzip && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    apt-get update && \
    apt-get install -y docker-ce-cli

RUN cd /tmp && \
    curl https://releases.hashicorp.com/nomad/1.7.3/nomad_1.7.3_linux_amd64.zip -o nomad.zip && \
    unzip nomad.zip && \
    mv -v nomad /usr/local/bin && \
    rm -v nomad.zip
