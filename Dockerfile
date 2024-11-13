FROM ubuntu:20.04

ARG INSTALL_REQ_TXT=no

COPY setup.sh /opt/setup.sh
COPY requirements.txt /opt/requirements.txt

RUN /opt/setup.sh /usr/local/src ${INSTALL_REQ_TXT}

ENV CC /usr/bin/clang-11
ENV CXX /usr/bin/clang++-11
ENV LIB_PATH /usr/local/src
ENV PATH $PATH:/usr/lib/llvm-11/bin
ENV PATH $PATH:${LIB_PATH}/csmith/bin
ENV PATH $PATH:${LIB_PATH}/go/bin
