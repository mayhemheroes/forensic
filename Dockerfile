FROM golang:1.21 AS builder

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential

ADD . /forensic
WORKDIR /forensic

RUN go build -mod=vendor

# Package Stage
FROM debian:bookworm-slim
COPY --from=builder /forensic/forensic /
