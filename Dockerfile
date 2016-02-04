FROM ubuntu:14.04

MAINTAINER Nicola Jordan <nic@hixi.ch>

# Essential stuffs
RUN apt-get update && apt-get -qq install --yes \
  ttf-dejavu \
  fonts-droid \
  ttf-unifont \
  fonts-sipa-arundina \
  fonts-sil-padauk \
  fonts-khmeros \
  ttf-indic-fonts-core \
  fonts-taml-tscu \
  ttf-kannada-fonts \
  build-essential openssh-server software-properties-common curl \
  libboost-dev libboost-filesystem-dev libboost-program-options-dev libboost-python-dev libboost-regex-dev libboost-system-dev libboost-thread-dev \
  libicu-dev libtiff4-dev libfreetype6-dev libpng12-dev libxml2-dev libproj-dev libsqlite3-dev libgdal-dev libcairo-dev python-cairo-dev postgresql-contrib libharfbuzz-dev \
  libicu-dev \
  python-dev libxml2 libxml2-dev \
  libfreetype6 libfreetype6-dev \
  libjpeg-dev \
  libpng-dev \
  libproj-dev \
  libtiff-dev \
  libcairo2 libcairo2-dev python-cairo python-cairo-dev \
  libcairomm-1.0-1 libcairomm-1.0-dev \
  ttf-unifont ttf-dejavu ttf-dejavu-core ttf-dejavu-extra \
  git build-essential python-nose \
  libgdal1-dev python-gdal \
  libsqlite3-dev \
  python-pip \
  git-core

# Install more recent Node
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get update && apt-get install -y nodejs

RUN pip install -U pip

ENV HOME /home/mapnik

WORKDIR $HOME

COPY ./mapnik $HOME/mapnik

WORKDIR $HOME/mapnik

RUN ./configure && JOBS=4 make && make install

RUN pip install mapnik
RUN npm install -g carto millstone

WORKDIR $HOME
CMD ["/bin/bash"]
