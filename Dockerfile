# Dockerfile for rails app

FROM lazypower/rbenv-ruby:v1
MAINTAINER lazypower "https://github.com/chuckbutler"

run bash -l -c 'gem install foreman'
COPY Gemfile /srv/rails/Gemfile
COPY Gemfile.lock /srv/rails/Gemfile.lock
RUN bash -l -c 'cd /srv/rails && bundle install'
ADD . /srv/rails

ENV SECRET_KEY_BASE=256b9a58a50cf9337ad9d7199d2111246b95f6c160121cb6b6fdf950a73fb4282e883dd3cbd7d48a257a9053bc0e8a44a2b1980231abe46fc7af99f1f444c987

EXPOSE 3000
WORKDIR /srv/rails
RUN bash -l -c 'RAILS_ENV=production rake assets:precompile'
ENTRYPOINT bash -l -c 'bundle exec rails s'
