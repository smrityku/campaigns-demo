FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /seedrs-demo
WORKDIR /seedrs-demo

COPY Gemfile /seedrs-demo/Gemfile
COPY Gemfile.lock /seedrs-demo/Gemfile.lock

RUN bundle install

COPY . /seedrs-demo
