# gRPC-tutorial

https://grpc-ecosystem.github.io/grpc-gateway/docs/tutorials/introduction/

## Environment setup
```shell
1. bash setup/install.sh protoc
2. brew install bufbuild/buf/buf
```

## Generate proto.go
```shell
buf generate
```

## Run server
```shell
run main.go
```

## Run client

```shell
curl -X POST -k http://localhost:8090/v1/example/echo -d '{"name": " hello"}'
# {"message":" hello world"}

go run client/main.go --name hello
# 2022/11/21 14:48:17 Greeting: hello world
```

