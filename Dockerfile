FROM ruby:2.3.3

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY ./Gemfile ./Gemfile.lock ./
RUN bundle install

# to build a self-contained image
#COPY . .

# to run from the local filesystem, mount the code at /usr/src/app

CMD ["./bin/rails", "server"]
