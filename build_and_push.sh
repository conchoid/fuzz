#!/bin/sh

version="0.1.2"
docker build . --tag "conchoid/fuzz:${version}" && docker push "conchoid/fuzz:${version}"
