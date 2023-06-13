FROM ruby:3.2.2-alpine

ENV BUNDLER_VERSION=2.4.14
ENV TZ=Europe/Moscow

RUN apk add --update --no-cache \
    binutils-gold \
    build-base \
    curl \
    file \
    g++ \
    gcc \
    git \
    less \
    libstdc++ \
    libffi-dev \
    libc-dev \
    linux-headers \
    libxml2-dev \
    libxslt-dev \
    libpq-dev \
    libgcrypt-dev \
    make \
    postgresql-client \
    git \
    tzdata \
    curl

RUN gem install bundler -v 2.4.14

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]