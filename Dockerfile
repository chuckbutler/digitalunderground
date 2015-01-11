# Dockerfile for rails app

FROM lazypower/rbenv-ruby:v1
MAINTAINER lazypower "https://github.com/chuckbutler"

run bash -l -c 'gem install foreman'
COPY Gemfile /srv/rails/Gemfile
COPY Gemfile.lock /srv/rails/Gemfile.lock
RUN bash -l -c 'cd /srv/rails && bundle install'
ADD . /srv/rails

EXPOSE 3000
WORKDIR /srv/rails
RUN bash -l -c 'RAILS_ENV=production rake assets:precompile'
ENTRYPOINT bash -l -c 'bundle exec rails s'
