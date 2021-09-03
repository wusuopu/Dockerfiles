FROM ruby:2.4.1-stretch

# install chrome and tini
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable && \
    wget https://github.com/krallin/tini/releases/download/v0.19.0/tini -O /tini && chmod +x /tini

ENTRYPOINT ["/tini", "--"]
