ARG NODE_VERSION=18.20.8
FROM node:$NODE_VERSION-alpine

ARG PYTHON_VERSION=3.10.18

RUN apk update && apk upgrade && \
    # install dependencies package for build python
    apk add --no-cache build-base openssl-dev bzip2-dev zlib-dev readline-dev sqlite-dev ncurses-dev xz-dev && \
    # download python
    wget -O Python.tar.xz https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tar.xz && \
    # extract file
    tar xf Python.tar.xz && \
    mv Python-$PYTHON_VERSION Python && \
    # install python
    cd Python && \
    ./configure --enable-optimizations && \
    make install && \
    cd .. && \
    # clean up
    rm -rf Python Python.tar.xz && \
    apk del build-base openssl-dev bzip2-dev zlib-dev readline-dev sqlite-dev ncurses-dev xz-dev && \
    rm -rf /var/cache/apk/*

RUN apk add make g++
