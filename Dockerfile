# Make sure it matches the Ruby version in .ruby-version and Gemfile
FROM ruby:3.1.2

# Install PostgreSQL client libraries and headers
RUN apt-get update && \
    apt-get install -y postgresql-client libpq-dev

# Rails app lives here
WORKDIR /app

ENV PGUSER myuser

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile --gemfile app/ lib/

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD RAILS_ENV=production bundle exec rails db:migrate && export SECRET_KEY_BASE="eb118d99d71bd9d417ac3794f4e2c749fc63dc076db593ae64f84bd9505230d96d96c2bcba1d9c2c2fc6c6ecbd34e1ae50b5061af7c05c4ae42b34f7f87be489" && bundle exec RAILS_ENV=production rails s