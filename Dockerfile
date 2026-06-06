FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    procps \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY monitor.sh .
RUN chmod +x monitor.sh

CMD ["./monitor.sh"]