# build stage
FROM golang:latest

WORKDIR /go/src/app

COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

ENTRYPOINT [ "/bin/sh", "/go/src/app/scripts/entrypoint.sh" ]
