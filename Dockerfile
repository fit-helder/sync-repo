FROM alpine:latest

RUN apk update && \
    apk upgrade

RUN apk add git

WORKDIR /workdir

COPY / .

ENTRYPOINT [ "./azure-pipelines/sync-repos.sh" ]