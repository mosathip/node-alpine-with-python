ARG NODE_VERSION=18.20.8
ARG PYTHON_VERSION=3.10.18
FROM node:${NODE_VERSION}-alpine

RUN apk update
RUN apk upgrade

# install dependencies package for build python
RUN apk add build-base openssl-dev bzip2-dev zlib-dev readline-dev sqlite-dev ncurses-dev xz-dev
# download python
RUN wget -O Python.tar.xz https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tar.xz
# extract file
RUN tar xf Python.tar.xz
# install python
RUN cd /Python
RUN ./configure --enable-optimizations
RUN make install
#  clean up
RUN cd /
RUN rm -rf /Python
RUN rm -f /Python.tar.xz
RUN apk cache clean




