# Zemer Server

A high performance Go WebSocket server for Zemer's "Listen Together" feature.
Utilizes protobuf and gzip compression for fast and efficient communication between clients.

# Quickstart

## Locally
You need to install go, protobuf, and protoc-gen-go

```bash
git clone https://github.com/ZemerTeam/zemer-server
cd zemer-server

# Generate protobuf files (required first time)
chmod +x generate_proto.sh
./generate_proto.sh

# Download dependencies
go mod download

# Build the server
go build -o main .

# Run on default port 8080
./main

# Run on custom port
PORT=9000 ./main
```

## Docker

```bash
# Clone the repository
git clone https://github.com/ZemerTeam/zemer-server
cd zemer-server

# Build locally
docker build -t zemer-server:latest .

# Run on port 8080
docker run -d \
  -p 8080:8080 \
  -e PORT=8080 \
  --name zemer-server \
  zemer-server:latest

# Run on custom port
docker run -d \
  -p 9000:9000 \
  -e PORT=9000 \
  --name zemer-server \
  zemer-server:latest
```

## Docker Compose

```yaml
---
services:
  zemer-server:
    image: ghcr.io/ZemerTeam/zemer-server:latest
    ports:
      - "8080:8080"
    environment:
      - PORT=8080
    healthcheck:
      test:
        [
          "CMD",
          "wget",
          "--no-verbose",
          "--tries=1",
          "--spider",
          "http://localhost:8080/health",
        ]
      interval: 30s
      timeout: 3s
      retries: 3
      start_period: 5s
    restart: unless-stopped
```
