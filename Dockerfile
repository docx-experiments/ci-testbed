FROM ruby:2.7.0-alpine

WORKDIR /opt/app

RUN apk add --no-cache mariadb-connector-c

COPY Gemfile .
COPY Gemfile.lock .

RUN apk add --no-cache build-base mariadb-connector-c-dev && \
    bundle install --deployment --jobs 4 && \
    apk del --purge build-base mariadb-connector-c-dev

COPY . /opt/app
