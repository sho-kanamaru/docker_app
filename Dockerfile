FROM ruby:2.4.1

RUN apt-get update
RUN apt-get install -y build-essential libpq-dev nodejs
RUN gem install bundler

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app
ADD Gemfile.lock /app

RUN bundle install

ADD . /app

EXPOSE 3000

CMD ["rails", "s", "-b", "0.0.0.0"]
