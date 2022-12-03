#!/bin/sh

version="0.1.0"
docker build . --tag "conchoid/fuzz:${version}" && docker push "conchoid/fuzz:${version}"
