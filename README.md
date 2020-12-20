# docker-cpplsac
Image packaging for Cpp-Baerchain

# How to build
# build the builder
docker build -t brcd:builder -f Dockerfile.builder
# build the client
docker build -t brcd:v1.3.0 -f Dockerfile --build-arg gitversion=v1.3.0

# How to use
```
version: '2'
services:
  node:
    image: brcd:v1.3.0
    stop_signal: SIGTERM
    stop_grace_period: 5s
    restart: unless-stopped
    container_name: brc_main
    ports:
      - "8080:8080"
      - "30320:30320"
    volumes:
      - ./data:/root/.brcdChain
      - .:/data
      - /etc/localtime:/etc/localtime:ro
    working_dir: /data
    command: /root/cpp-lsac/build/brcd/brcd -v 2 --db rocksdb --http_port 8080 --listen 30320 --accountJson /data/config.json
```
