FROM alpine:latest

RUN apk add mariadb-connector-c-dev

WORKDIR /app
COPY main /app/main
RUN chmod 755 /app/main

ENTRYPOINT ["/app/main"]

# docker build -t v-test . 