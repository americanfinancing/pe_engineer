ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION

ARG BUNDLER_VERSION

ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1

# Common depencies
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# Setup timezone
ENV TZ=America/Denver
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Application dependencies
# Note: add any additional image specific packages to ./.dockerdev/Aptfile
COPY ./Aptfile /tmp/Aptfile
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    $(cat /tmp/Aptfile | xargs) \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

# Upgrade RubyGems and install Bundler
RUN gem update --system --silent \
  && gem install bundler:$BUNDLER_VERSION --silent --no-document

# Create directory for application
RUN mkdir -p /opt/app
COPY . /opt/app
WORKDIR /opt/app

RUN bundle install --no-binstubs --jobs $(nproc) --retry 3
