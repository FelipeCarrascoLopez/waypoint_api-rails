FROM ruby:3.3.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN gem install bundler && bundle install

COPY . /app/

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
