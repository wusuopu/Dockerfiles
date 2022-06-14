ARG MYSQL_VERSION=5.7.24
FROM mysql:${MYSQL_VERSION}

ADD https://gosspublic.alicdn.com/ossutil/1.7.13/ossutil64 /usr/bin/
RUN chmod +x /usr/bin/ossutil64 && \
    apt-get update && apt-get install -y python3

WORKDIR /app/
COPY ./cron.py ./backup.py /app/

ENV MYSQL_HOST="" \
    MYSQL_PORT="3306" \
    MYSQL_USER="" \
    MYSQL_PASSWORD="" \
    MYSQL_DB="" \
    ALI_ACCESS_KEY_ID="" \
    ALI_ACCESS_KEY_SECRET="" \
    ALI_REGION="" \
    ALI_BUCKET="" \
    CRON="0 10 * * *"

CMD ["python3", "backup.py"]
