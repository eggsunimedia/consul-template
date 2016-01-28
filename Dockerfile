# consul-template

FROM ubuntu
MAINTAINER Andriy Tarasenko <at@eggs.de>

ENV consul_template_version=0.12.2
ENV consul_template_url=https://releases.hashicorp.com/consul-template/${consul_template_version}/consul-template_${consul_template_version}_linux_amd64.zip

ADD $consul_template_url /tmp/consul-template.zip

RUN apt-get update && apt-get install unzip && \
    cd /tmp && \
    unzip consul-template.zip && \
    chmod +x consul-template && \
    mv consul-template /usr/local/bin/ && \
    rm -rf /tmp/*

ENTRYPOINT ["consul-template"]
