FROM ruby:2.7.0-alpine as builder

WORKDIR /opt/app

RUN apk add build-base mariadb-connector-c-dev

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install --deployment --jobs 4
RUN ls /opt/app

FROM ruby:2.7.0-alpine

RUN apk add --no-cache mariadb-connector-c

WORKDIR /opt/app
ENTRYPOINT [ "/bin/sh", "-c" ]

RUN bundle config set deployment 'true'
RUN bundle config set path 'vendor/bundle'

COPY . /opt/app
COPY --from=builder /opt/app/vendor/bundle /opt/app/vendor/bundle