FROM nginx:1.25.4-alpine

RUN apk add --no-cache nginx-mod-http-geoip

# download geoip database
# https://www.miyuru.lk/geoiplegacy
RUN cd /tmp && wget https://dl.miyuru.lk/geoip/maxmind/country/maxmind.dat.gz && \
    gunzip maxmind.dat.gz && \
    mkdir /etc/nginx/geoip/ && \
    mv maxmind.dat /etc/nginx/geoip/country.dat && \
    wget https://dl.miyuru.lk/geoip/maxmind/city/maxmind.dat.gz && \
    gunzip maxmind.dat.gz && \
    mv maxmind.dat /etc/nginx/geoip/city.dat
