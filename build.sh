#!bash
#
rm -f ~/sqlc-gen-crud/*.wasm
docker run -it --rm -w /src -v ~/sqlc-gen-crud:/src tinygo/tinygo:0.27.0 tinygo build -o sqlc-gen-crud_1.0.0.wasm -target wasi plugin/main.go
