FROM ubuntu:latest

LABEL maintainer="Fabio Tea <iam@f4b.io>"
LABEL version="0.0.1"

# https://github.com/moby/moby/issues/4032#issuecomment-192327844
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update --quiet --yes
RUN apt-get install --quiet --yes apt-utils
RUN apt-get install --quiet --yes locales curl icu-devtools
RUN rm -rf /var/lib/apt/lists/*
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG=en_US.utf8
ENV RUNNER_ALLOW_RUNASROOT=1

WORKDIR /app
RUN curl --silent -o actions-runner-linux-x64-2.279.0.tar.gz \
	-L https://github.com/actions/runner/releases/download/v2.279.0/actions-runner-linux-x64-2.279.0.tar.gz
RUN echo "50d21db4831afe4998332113b9facc3a31188f2d0c7ed258abf6a0b67674413a  actions-runner-linux-x64-2.279.0.tar.gz" > actions-runner-linux-x64-2.279.0.tar.gz.sha256
RUN sha256sum --check actions-runner-linux-x64-2.279.0.tar.gz.sha256
RUN tar xzf ./actions-runner-linux-x64-2.279.0.tar.gz

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
