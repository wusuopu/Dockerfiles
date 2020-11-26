FROM node:10-alpine

RUN apk add --no-cache chromium git

ARG RENDERTRON_VERSION=3.1.0

RUN cd /opt && \
    git clone https://github.com/GoogleChrome/rendertron.git && \
    cd rendertron && \
    git checkout $RENDERTRON_VERSION && \
    yarn && \
    yarn build && \
    rm -rf .git

WORKDIR /opt/rendertron

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

EXPOSE 3000
CMD ["yarn", "start"]
