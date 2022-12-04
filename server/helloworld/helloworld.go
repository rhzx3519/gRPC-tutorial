/**
@author ZhengHao Lou
Date    2022/12/04
*/
package helloworld

import (
	"context"
	helloworldpb "github.com/myuser/myrepo/pkg/apiclient/helloworld"
)

type server struct {
	helloworldpb.UnimplementedGreeterServer
}

func NewServer() *server {
	return &server{}
}

func (s *server) SayHello(ctx context.Context, in *helloworldpb.HelloRequest) (*helloworldpb.HelloReply, error) {
	return &helloworldpb.HelloReply{Message: in.Name + " world"}, nil
}
