FROM brcd:builder

ARG gitversion

WORKDIR /root
RUN git clone --recursive https://github.com/BaerChain/cpp-lsac.git
RUN cd cpp-lsac && git pull && git checkout "$gitversion" && mkdir build && cd build && cmake .. && make -j4 brcd

EXPOSE 30320
