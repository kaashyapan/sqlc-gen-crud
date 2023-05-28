#!bash
#
docker run -it --rm -w /src -v ~/sqlc-gen-crud:/src tinygo/tinygo:0.27.0 tinygo build -o sqlc-gen-crud.wasm -target wasi plugin/main.go
