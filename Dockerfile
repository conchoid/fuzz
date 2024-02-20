FROM ubuntu:20.04

COPY setup.sh /opt/setup.sh

RUN /opt/setup.sh /usr/local/src

ENV CC /usr/bin/clang-11
ENV CXX /usr/bin/clang++-11
ENV LIB_PATH /usr/local/src
ENV PATH $PATH:/usr/lib/llvm-11/bin
ENV PATH $PATH:${LIB_PATH}/csmith/bin
ENV PATH $PATH:${LIB_PATH}/go/bin
