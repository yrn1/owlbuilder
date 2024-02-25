FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y \
      build-essential \
      git \
      curl \
      pkg-config \
      make \
      cmake \
      gcc-arm-none-eabi \
 && rm -rf /var/lib/apt/lists/*

RUN git clone --recurse-submodules https://github.com/RebelTechnology/OwlProgram.git \
 && cd OwlProgram \
 && git checkout release/v21.1

RUN curl -LO https://github.com/grame-cncm/faust/releases/download/2.30.5/faust-2.30.5.tar.gz \
 && tar xfz faust-2.30.5.tar.gz \
 && cd faust-2.30.5 \
 && make \
 && make install