#!/bin/sh

version="0.1.8"
docker build . --tag "conchoid/fuzz:${version}" && docker push "conchoid/fuzz:${version}"
