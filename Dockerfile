# Build stage
FROM ruby:3.1.2-alpine AS build
RUN apk add build-base --no-cache postgresql-client libpq-dev
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install
COPY . .

#Final stage
FROM ruby:3.1.2-alpine
RUN apk add build-base --no-cache postgresql-client libpq-dev
WORKDIR /app
COPY --from=build /app /app
ENV RAILS_ENV=production \
    PGUSER=myuser \
    DATABASE_URL=postgres://myuser:pass@db:5432/huzurevi_backend_production \
    SECRET_KEY_BASE=eb118d99d71bd9d417ac3794f4e2c749fc63dc076db593ae64f84bd9505230d96d96c2bcba1d9c2c2fc6c6ecbd34e1ae50b5061af7c05c4ae42b34f7f87be489

RUN gem install bundler && bundle install
EXPOSE 3000
CMD bundle exec rails db:migrate && bundle exec rails s -p 3000 -b 0.0.0.0