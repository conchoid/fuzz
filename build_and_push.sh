#!/bin/sh

version="0.1.4"
docker build . --tag "conchoid/fuzz:${version}" && docker push "conchoid/fuzz:${version}"
