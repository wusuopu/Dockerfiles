FROM alpine:3.7

WORKDIR /app
RUN apk --no-cache add --virtual .build-deps build-base automake autoconf gtk-doc rust cargo && \
    apk --no-cache add freetype-dev libxml2-dev libart-lgpl-dev pango-dev gdk-pixbuf-dev libcroco-dev gobject-introspection-dev glib-dev gi
t
RUN git clone --depth 1 -n -b 1.15.10 git://anongit.freedesktop.org/git/cairo && \
    cd cairo && \
    git reset HEAD . && \
    git checkout -- . && \
    ./autogen.sh && \
    make && \
    make install
RUN wget https://codeload.github.com/GNOME/librsvg/zip/2.42.3 -O librsvg-2.42.3.zip && \
    unzip librsvg-2.42.3.zip && \
    cd librsvg-2.42.3 && \
    ./autogen.sh && \
    make && \
    make install

RUN apk del .build-deps
