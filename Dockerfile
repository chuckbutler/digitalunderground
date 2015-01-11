# Dockerfile for rails app

FROM lazypower/rbenv-ruby:v1
MAINTAINER lazypower "https://github.com/chuckbutler"

run bash -l -c 'gem install foreman'
COPY Gemfile /srv/rails/Gemfile
COPY Gemfile.lock /srv/rails/Gemfile.lock
RUN bash -l -c 'cd /srv/rails && bundle install'
ADD . /srv/rails
# RUN bash -l -c 'cd /srv/rails && bundle install'

ENV RAILS_ENV=production
ENV SECRET_KEY_BASE=96008779718ad55599bbb0f777cb660be222d03e24dfe77b1e10479de0a38f2650889ba2707ea2fae13de4085173bd701160a50f2b8a9c05a44b8f1d3ac3d8f6
ENV MONGODB_HOST=db
ENV MONGODB_PORT=27017

EXPOSE 3000
WORKDIR /srv/rails
RUN bash -l -c 'RAILS_ENV=production rake assets:precompile'
ENTRYPOINT bash -l -c 'bundle exec rails s'
