FROM ruby:2.7.0-alpine

WORKDIR /opt/app

COPY Gemfile .
COPY Gemfile.lock .

RUN apk add --no-cache build-base mariadb-connector-c-dev && \
    bundle install --deployment --jobs 4 && \
    apk del --purge build-base mariadb-connector-c-dev

RUN apk add --no-cache bash mariadb-connector-c

COPY . /opt/app
