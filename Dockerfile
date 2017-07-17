FROM node:slim

RUN apt-get update && apt-get install -y git --no-install-recommends

RUN mkdir -p /solid/certs /solid/data /solid/run/ \
 && cd /solid \ 
#
# Branches (git clone -b parameter) to choose from:
# - master
# - fix-single-user-signup
# - dz_oidc
# - rv/patch/n3
# - rv/node8
#
 && git -b 'dz_oidc' clone https://github.com/solid/node-solid-server run \
 && cd /solid/run \
 && npm update

WORKDIR /solid/run/

VOLUME /solid/certs /solid/data
CMD ["/solid/run/bin/solid.js", "start", "--verbose"]
