all: sqlc-gen-crud sqlc-gen-crud.wasm

sqlc-gen-crud:
	cd plugin && go build -o ~/bin/sqlc-gen-crud ./main.go

sqlc-gen-crud.wasm:
	cd plugin && tinygo build -o sqlc-gen-crud.wasm -gc=leaking -scheduler=none -wasm-abi=generic -target=wasi main.go
	openssl sha256 plugin/sqlc-gen-crud.wasm

