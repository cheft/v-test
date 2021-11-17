FROM alpine:latest

RUN apk add mariadb-connector-c-dev

WORKDIR /app
COPY orm.linux /app/orm
RUN chmod 755 /app/orm

ENTRYPOINT ["/app/orm"]

# docker build -t v-test . 