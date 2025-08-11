FROM ruby:${RUBY_VERSION}-slim as base
WORKDIR /rails
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"
FROM base as build
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
        apt-transport-https \
        ca-certificates \
        build-essential \
        git \
        pkg-config \
        libpq-dev \
        libyaml-dev && \
    rm -rf /var/lib/apt/lists/*
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile











