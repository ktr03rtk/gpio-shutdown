# build stage
FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends \
  wget \
  ca-certificates \
  g++ \
  gcc \
  libc6-dev \
  make \
  pkg-config \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://golang.org/dl/go1.16.2.linux-armv6l.tar.gz \
  && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.2.linux-armv6l.tar.gz

ENV PATH /usr/local/go/bin:$PATH

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

ENTRYPOINT [ "/bin/sh" ]
