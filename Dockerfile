FROM ruby:3.1.2-alpine

RUN apk add build-base --no-cache postgresql-client libpq-dev

WORKDIR /app

ENV RAILS_ENV=production \
    PGUSER=postgres \
    SECRET_KEY_BASE=eb118d99d71bd9d417ac3794f4e2c749fc63dc076db593ae64f84bd9505230d96d96c2bcba1d9c2c2fc6c6ecbd34e1ae50b5061af7c05c4ae42b34f7f87be489

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

COPY . .

EXPOSE 3000