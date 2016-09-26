FROM ubuntu:16.04

MAINTAINER ytyng

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-dev \
    python3-setuptools \
    libjpeg-dev \
    nginx \
    supervisor \
  && rm -rf /var/lib/apt/lists/*

# ipython, gnureadline が必要なら
# lib32ncurses5-dev

RUN ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib/libjpeg.so

# RUN easy_install3 pip  # aptで入れた方が安定

COPY requirements/base.txt /tmp/requirements/base.txt
RUN pip3 install -r /tmp/requirements/base.txt

# setup all the configfiles
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx-app.conf /etc/nginx/sites-available/default
COPY supervisor-app.conf /etc/supervisor/conf.d/

RUN mkdir -p /etc/nginx/certs
# COPY certs /etc/nginx/certs/

# set locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

EXPOSE 80
#EXPOSE 443
