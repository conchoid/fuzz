#!/bin/sh

version="0.1.9"

# not install requirements.txt (lightweight)
tag="conchoid/fuzz:${version}"
docker build . --tag "${tag}" && docker push "${tag}"

# install requirements.txt (heavy)
tag="conchoid/fuzz:${version}-ui-unittest"
docker build . --tag "${tag}" --build-arg INSTALL_REQ_TXT=yes && docker push "${tag}"
