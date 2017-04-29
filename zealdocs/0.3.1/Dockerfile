FROM ubuntu:14.04

RUN apt-get update \
  && apt-get install -y oftware-properties-common \
  &&  add-apt-repository -y -u ppa:zeal-developers/ppa \
  && apt-get install -y zeal

CMD ["zeal"]
