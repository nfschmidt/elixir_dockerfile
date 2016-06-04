FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y wget
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y esl-erlang elixir

RUN locale-gen en_US.UTF-8 && \
    dpkg-reconfigure -f noninteractive tzdata && \
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"' >/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales

ENV LANG "en_US.UTF-8"

RUN mkdir /app
WORKDIR /app
