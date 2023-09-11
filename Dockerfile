FROM alpine:latest

RUN apk update && \
    apk upgrade

RUN apk add git

WORKDIR /workdir

COPY sync-repos.sh .

ENTRYPOINT [ "./sync-repos.sh" ]