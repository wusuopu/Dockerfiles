FROM ekazakov/python-opencv:py3.5

RUN apt-get -y update
RUN apt-get -y install python3-dev libboost-python-dev

RUN pip install dlib==19.1.0
RUN rm -rf /root/.cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root
# Define default command.
CMD ["bash"]
