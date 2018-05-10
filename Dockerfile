FROM ruby:2.3.3

RUN apt-get -y update

RUN apt-get install -y sqlite3 libsqlite3-dev imagemagick

WORKDIR /usr/src/app

# things that should be done in DEPLOYMENT but not development:
  # throw errors if Gemfile has been modified since Gemfile.lock
  # RUN bundle config --global frozen 1
  # COPY . .

# things that should be done in development:
COPY ./Gemfile ./Gemfile.lock ./

# note: --no-deployment flag is necessary to tell Ruby we want "development" mode
# where we can make changes to the Gemfile
RUN bundle install --no-deployment

# when running this container, mount the code at /usr/src/app

CMD ["./bin/rails", "server"]
