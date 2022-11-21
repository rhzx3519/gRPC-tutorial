#! /usr/bin/env bash

# This script auto-generates protobuf related files. It is intended to be run manually when either
# API types are added/modified, or server gRPC calls are added. The generated files should then
# be checked into source control.

set -x
set -o errexit
set -o nounset
set -o pipefail

PROJECT_ROOT=$(cd $(dirname ${BASH_SOURCE})/..; pwd)
PROTO_DIR=proto
GOPATH=$(go env GOPATH)

# output tool versions
go version
protoc --version
buf --version

cd $PROJECT_ROOT/$PROTO_DIR
buf mod update
buf generate
