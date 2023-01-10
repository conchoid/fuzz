#!/bin/sh

version="0.1.1"
docker build . --tag "conchoid/fuzz:${version}" && docker push "conchoid/fuzz:${version}"
