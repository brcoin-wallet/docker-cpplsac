FROM ubuntu:18.04 as builer

WORKDIR /root

RUN apt-get update && apt-get install -y unzip git cmake libboost1.65-all-dev libssl-dev libsnappy-dev libleveldb-dev libgmp-dev libscrypt-dev libjsoncpp-dev libargtable2-dev libcurl4-openssl-dev libhiredis-dev doxygen libmicrohttpd-dev libgflags-dev
RUN cd /root && git clone git://github.com/cinemast/libjson-rpc-cpp.git && cd libjson-rpc-cpp && git checkout v1.1.1 && mkdir build && cd build && cmake .. && make -j4 make install && ldconfig

RUN cd /root && git clone https://github.com/facebook/rocksdb.git
RUN cd /root/rocksdb && git checkout 6.1.fb && mkdir build && cd build && cmake .. && make -j4 && cp librocksdb.* /usr/local/lib/ && cd .. && cp -r include/rocksdb /usr/local/include/

RUN rm -rf /var/lib/apt/lists/*
