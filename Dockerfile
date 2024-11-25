FROM ruby:3.3.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs netcat-openbsd

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN gem install bundler && bundle install

COPY . /app/

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
