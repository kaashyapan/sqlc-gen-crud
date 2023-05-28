package main

import (
	"github.com/tabbed/sqlc-go/codegen"

	fsharp "github.com/kaashyapan/sqlc-gen-crud/internal"
)

func main() {
	codegen.Run(fsharp.Generate)
}
