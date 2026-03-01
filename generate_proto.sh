#!/bin/bash
# Generate Go protobuf files

set -e

PROTO_DIR="./proto"
OUT_DIR="./proto"

if [ ! -f "$PROTO_DIR/listentogether.proto" ]; then
    echo "Missing proto file at $PROTO_DIR/listentogether.proto"
    echo "Did you initialize submodules? Try: git submodule update --init --recursive"
    exit 1
fi

# Generate Go code
protoc --go_out="$OUT_DIR" --go_opt=paths=source_relative \
    -I="$PROTO_DIR" \
    "$PROTO_DIR/listentogether.proto"

echo "Protobuf files generated successfully in $OUT_DIR"
