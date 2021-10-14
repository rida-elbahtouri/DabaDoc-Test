FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /Dabadoc
COPY Gemfile /Dabadoc/Gemfile
COPY Gemfile.lock /Dabadoc/Gemfile.lock
RUN bundle install


# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
