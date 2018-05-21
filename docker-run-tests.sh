#!/bin/sh

# reset test database and run all tests
./docker-cmd.sh bundle exec rake db:test:prepare RAILS_ENV=test
./docker-cmd.sh bundle exec rspec
