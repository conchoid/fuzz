#!/bin/sh

version="0.1.6"
docker build . --tag "conchoid/fuzz:${version}" && docker push "conchoid/fuzz:${version}"
