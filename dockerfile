FROM jc21/nginx-proxy-manager:latest

#install ruby programming language
RUN apt install build-essential ruby-dev

#install fluentd
RUN gem install fluentd --no-doc

RUN gem install yajl-ruby -v 1.4.1
RUN gem install bundler -v 2.3.26

#install fluent plugin prometheus
RUN gem install fluent-plugin-prometheus
# Install Fluentd
RUN curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-focal-td-agent4.sh | sh

# Add Fluentd configuration file
COPY fluentd.conf /etc/td-agent/td-agent.conf

# Expose Fluentd port (if nedoccessary)
EXPOSE 24224