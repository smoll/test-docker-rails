FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs # rails skeleton craps out without a JS runtime
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
RUN NOKOGIRI_USE_SYSTEM_LIBRARIES=1 bundle install
ADD . /myapp
