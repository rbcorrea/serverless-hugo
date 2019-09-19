FROM golang:1.13.0-alpine3.10
MAINTAINER Rodrigo Correa <rodrigoxcorrea@gmail.com>
#
# Install packages needed to build
RUN apk add --update --no-cache \
    bash \
    ca-certificates \
    curl \
    wget \
    python3 \
    python3-dev \
    build-base \
    nodejs \
    npm \
  && pip3 install --upgrade pip \
  && pip3 install -U awscli
#
RUN curl -Ls https://github.com/gohugoio/hugo/releases/download/v0.58.3/hugo_0.58.3_Linux-64bit.tar.gz -o /tmp/hugo.tar.gz \
  && tar xf /tmp/hugo.tar.gz -C /tmp \
  && mv /tmp/hugo /usr/bin/hugo \
  && rm -rf /tmp/hugo*
#
RUN npm i -g serverless