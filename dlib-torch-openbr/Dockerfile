FROM bamos/ubuntu-opencv-dlib-torch:ubuntu_14.04-opencv_2.4.11-dlib_19.0-torch_2016.07.12
MAINTAINER wusuopu <admin@longchangjin.cn>

RUN ln -s /root/torch/install/bin/* /usr/local/bin

RUN apt-get update
RUN apt-get install -y \
    curl \
    git \
    graphicsmagick \
    python-dev \
    python-pip \
    python-numpy \
    python-nose \
    python-scipy \
    python-pandas \
    python-protobuf\
    wget \
    zip \
    qt5-default \
    libqt5svg5-dev \
    qtcreator && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/biometrics/openbr.git && \
      cd openbr && \
      git checkout v1.1.0 && \
      git submodule init && \
      git submodule update

RUN cd openbr && mkdir build && \
      cd build && \
      cmake -DCMAKE_BUILD_TYPE=Release .. && \
      make && \
      make install && \
      cd ../.. && \
      rm -rf openbr
