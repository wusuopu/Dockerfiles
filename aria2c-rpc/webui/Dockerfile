FROM nginx:1.15-alpine

WORKDIR /
RUN wget https://codeload.github.com/binux/yaaw/zip/master && \
    unzip master && \
    sed -i "s@(location.host.split.*6800\"@location.host@" yaaw-master/js/yaaw.js && \
    cp -r yaaw-master/* /usr/share/nginx/html && \
    rm -rf yaaw-master/

COPY ./run.sh /run.sh

EXPOSE 80

ENV RPC_URL=http://aria2c-rpc

CMD ["sh", "./run.sh"]
