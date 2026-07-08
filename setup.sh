#!/bin/bash

set -e


setup() {
  libpath="$1"
  install_req_txt="$2"

  (
    export DEBIAN_FRONTEND=noninteractive
    apt update
    yes '' | apt -y -o DPkg::options::="--force-confdef" \
                 -o DPkg::options::="--force-confold" \
                 install curl cmake gcc git g++ m4 clang-14 lldb-14 libc++-14-dev libc++abi-14-dev clang-format-14 \
                 jq maven openjdk-8-jdk \
                 python3-pip python3.11-venv python3.11-dev pkg-config redis zip sudo

    GO_VERSION="1.25.11"
    curl -L "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz" -O
    tar xf "go${GO_VERSION}.linux-amd64.tar.gz" -C "${libpath}"

    CSMITH_VERSION="2.3.0"
    git clone --depth 1 --branch csmith-${CSMITH_VERSION} https://github.com/csmith-project/csmith.git
    cd csmith
    cmake -DCMAKE_INSTALL_PREFIX="${libpath}/csmith" .
    make
    make install

    curl -fsSL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
    bash nodesource_setup.sh
    apt install -y nodejs

    apt install -y tesseract-ocr libtesseract-dev

    if [ "${install_req_txt}" = "yes" ]; then
      mkdir -p ~/.config/pip/
      python3 -m pip install -r /opt/requirements.txt
    fi
  )
}

setup "$@"
