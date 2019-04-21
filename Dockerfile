FROM ruby:2.5

ADD Gemfile /tmp/Gemfile
ADD Gemfile.lock /tmp/Gemfile.lock
RUN gem install bundler
RUN cd /tmp/ && bundle install --jobs 4

RUN apt-get update && apt-get install -y python-pip unzip && apt-get clean

RUN wget https://github.com/getgauge/gauge/releases/download/v1.0.4/gauge-1.0.4-linux.x86_64.zip -O /tmp/gauge-1.0.4-linux.x86_64.zip \
    && cd /tmp \
    && unzip gauge-1.0.4-linux.x86_64.zip \
	&& cp /tmp/gauge /usr/local/bin/ \
	&& cp -rv /tmp /usr/local/share \
    && gauge install ruby \
    && gauge install html-report

ADD . /app
WORKDIR /app

ENV ENVIRONMENT default