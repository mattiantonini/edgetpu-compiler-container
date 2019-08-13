FROM debian:stretch-slim
LABEL maintainer="mattia@mattiantonini.com"

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl \
    ca-certificates \
    gnupg \
    apt-utils \
    apt-transport-https \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | tee /etc/apt/sources.list.d/coral-edgetpu.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y edgetpu \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /home/edgetpu-compiler
