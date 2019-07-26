FROM alpine:3.10

RUN apk add --no-cache build-base python2 python3 py2-pip python2-dev python3-dev ruby ruby-dev libxml2-dev nodejs yarn neovim git

RUN pip2 install neovim && \
    pip3 install neovim && \
    pip install python-language-server && \
    pip install pyflakes && \
    yarn global add neovim flow-language-server eslint && \
    gem install solargraph --no-document

VOLUME ['/root/.config/nvim']


ENV NEOVIM_PYTHON_HOST_PROG="/usr/bin/python2" \
    NEOVIM_PYTHON3_HOST_PROG="/usr/bin/python3" \
    TERM="screen-256color"
