FROM alpine:3.7

WORKDIR /app
RUN apk --no-cache add --virtual .build-deps build-base automake autoconf gtk-doc rust cargo git && \
    apk --no-cache add --virtual .build-libs freetype-dev libxml2-dev libart-lgpl-dev pango-dev gdk-pixbuf-dev libcroco-dev gobject-introspection-dev glib-dev

RUN git clone --depth 1 -n -b 1.15.12 git://anongit.freedesktop.org/git/cairo && \
    cd cairo && \
    git reset HEAD . && \
    git checkout -- . && \
    ./autogen.sh && \
    make && \
    make install
RUN wget https://codeload.github.com/GNOME/librsvg/zip/2.45.5 -O librsvg-2.45.5.zip && \
    unzip librsvg-2.45.5.zip && \
    cd librsvg-2.45.5 && \
    ./autogen.sh && \
    make && \
    make install

WORKDIR /
RUN rm -rf /app/

RUN apk del .build-deps
