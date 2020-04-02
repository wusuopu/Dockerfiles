FROM docker:dind

# install k3s
RUN apk add --no-cache cni-plugins k3s --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    apk add --no-cache iptables openssh-server sudo

# add the vagrant insecure public key
RUN adduser -h /home/vagrant -s /bin/sh -D vagrant && \
    echo vagrant:vagrant | chpasswd && \
    echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    mkdir -p /etc/sudoers.d && \
    echo 'vagrant ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/vagrant && \
    chmod 0440 /etc/sudoers.d/vagrant && \
    mkdir -p /home/vagrant/.ssh && \
    chmod 0700 /home/vagrant/.ssh && \
    wget --no-check-certificate https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub -O /home/vagrant/.ssh/authorized_keys && \
    chmod 0600 /home/vagrant/.ssh/authorized_keys && \
    chown -R vagrant /home/vagrant/.ssh && \
    ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N "" && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ""

RUN cp -v /usr/local/bin/dockerd-entrypoint.sh /usr/local/bin/dockerd-entrypoint.sh~ && \
    sed -i '$ i\/usr/sbin/sshd -o PasswordAuthentication=yes' /usr/local/bin/dockerd-entrypoint.sh

ENV PATH=/usr/share/cni-plugins/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
