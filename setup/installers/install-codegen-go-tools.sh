#!/bin/bash
set -eux -o pipefail

SRCROOT="$( CDPATH='' cd -- "$(dirname "$0")/../.." && pwd -P )"

# All binaries are compiled into the argo-cd/dist directory, which is added to the PATH during codegen
export GOBIN="${SRCROOT}/dist"
mkdir -p $GOBIN

# protoc-gen-go* is used to generate <service>.pb.go from .proto files
# go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28.0
#go_mod_install github.com/gogo/protobuf/protoc-gen-gogo
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# protoc-gen-grpc-gateway is used to build <service>.pb.gw.go files from from .proto files
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest

# # protoc-gen-swagger is used to build swagger.json
go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger@latest

go install github.com/go-swagger/go-swagger/cmd/swagger@v0.28.0