#!/bin/bash

set -e


setup() {
  libpath="$1"

  (
    export DEBIAN_FRONTEND=noninteractive
    apt update
    yes '' | apt -y -o DPkg::options::="--force-confdef" \
                 -o DPkg::options::="--force-confold" \
                 install curl cmake gcc git g++ m4 clang-11 lldb-11 libc++-11-dev libc++abi-11-dev clang-format-11 \
                 jq maven openjdk-8-jdk \
                 python3-pip python3.8-venv python3-dev pkg-config

    curl -L "https://golang.org/dl/go1.20.1.linux-amd64.tar.gz" -O
    tar xf go1.20.1.linux-amd64.tar.gz -C "${libpath}"

    CSMITH_VERSION="2.3.0"
    git clone --depth 1 --branch csmith-${CSMITH_VERSION} https://github.com/csmith-project/csmith.git
    cd csmith
    cmake -DCMAKE_INSTALL_PREFIX="${libpath}/csmith" .
    make
    make install

    curl -fsSL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
    bash nodesource_setup.sh
    apt-get install -y nodejs
  )
}

setup "$@"
