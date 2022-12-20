FROM ubuntu:20.04
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV http_proxy http://proxy-iil.intel.com:911
ENV https_proxy http://proxy-iil.intel.com:912
ENV no_proxy .intel.com,ubit-artifactory-il.intel.com

ENV HTTP_PROXY http://proxy-iil.intel.com:911
ENV HTTPS_PROXY http://proxy-iil.intel.com:912


RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive \
 apt-get install -y \
 build-essential=12.8ubuntu1.1 \
 cmake=3.16.3-1ubuntu1.20.04.1

COPY . /opt/manifold

RUN mkdir -p /opt/manifold/build && \
    cd /opt/manifold/build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make
