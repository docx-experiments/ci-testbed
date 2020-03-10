FROM ruby:2.7.0-alpine as builder

WORKDIR /opt/app

RUN apk add --no-cache build-base mariadb-connector-c-dev

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install --deployment --jobs 4

FROM ruby:2.7.0-alpine

RUN apk add --no-cache bash mariadb-connector-c

COPY . /opt/app
COPY --from=builder /opt/app/vendor/bundle /opt/app/vendor/bundle