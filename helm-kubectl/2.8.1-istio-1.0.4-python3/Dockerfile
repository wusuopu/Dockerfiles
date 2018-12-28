FROM dtzar/helm-kubectl:2.8.1

RUN apk add --no-cache gettext curl python3

# Install istioctl
RUN wget https://github.com/istio/istio/releases/download/1.0.4/istio-1.0.4-linux.tar.gz && \
    tar xf istio-1.0.4-linux.tar.gz && \
    mv istio-1.0.4/bin/istioctl /usr/local/bin/ && \
    rm -rf istio-1.0.4-linux.tar.gz istio-1.0.4

