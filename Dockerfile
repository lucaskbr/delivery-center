FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /delivery-center
WORKDIR /delivery-center
COPY Gemfile /delivery-center/Gemfile
COPY Gemfile.lock /delivery-center/Gemfile.lock
RUN bundle install
COPY . /delivery-center

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["ruby", "-v"]
CMD ["rails", "server", "-b", "0.0.0.0"]