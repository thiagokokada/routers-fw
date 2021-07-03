FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
   && apt-get install -qy apt-utils
RUN apt-get -qy install locales
RUN sed -i "s/^# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen \
   && locale-gen \
   && update-locale LANG=en_US.UTF-8

RUN apt-get install -qy \
  autoconf \
  automake \
  autopoint \
  bc \
  bison \
  build-essential \
  ca-certificates \
  cmake \
  curl \
  flex \
  gawk \
  gettext \
  git \
  gperf \
  help2man \
  libgmp3-dev \
  libid3tag0-dev \
  libltdl-dev \
  libmpc-dev \
  libmpfr-dev \
  libncurses5-dev \
  libtool-bin \
  mc \
  module-init-tools \
  nano \
  openssh-client \
  pkg-config \
  python-docutils \
  telnet \
  texinfo \
  tftpd-hpa \
  vim \
  wget \
  zip \
  zlib1g-dev

RUN git clone https://gitlab.com/dm38/padavan-ng.git/ /opt/padavan-ng
RUN cd /opt/padavan-ng/toolchain \
   && ./clean_sources.sh \
   && ./build_toolchain.sh
ADD config /opt/padavan-ng/trunk/.config
# Workaround so we can access the resulting firmware later on
# We will mount a Docker volume inside this directory
RUN mkdir -p /opt/padavan-ng/trunk/images

WORKDIR /opt/padavan-ng/trunk
