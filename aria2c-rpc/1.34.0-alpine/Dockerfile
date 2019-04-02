FROM alpine:3.8

RUN apk add --no-cache aria2

EXPOSE 6800

VOLUME /Downloads

CMD [
  "aria2c",
  "--enable-rpc=true",
  "--rpc-listen-port=6800",
  "--rpc-allow-origin-all=true",
  "--rpc-listen-all=true",
  "--max-concurrent-downloads=3",
  "--continue=true",
  "--max-connection-per-server=5",
  "--min-split-size=10M",
  "--split=5",
  "--max-overall-download-limit=0",
  "--max-download-limit=0",
  "--max-overall-upload-limit=0",
  "--max-upload-limit=0",
  "--dir=/Downloads",
  "--file-allocation=prealloc"
]
