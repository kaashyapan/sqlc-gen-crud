package fsharp

import (
	"bufio"
	"bytes"
	"context"
	"io"
	"strings"

	plugin "github.com/tabbed/sqlc-go/codegen"

	"github.com/kaashyapan/sqlc-gen-crud/internal/core"
	"github.com/kaashyapan/sqlc-gen-crud/internal/templates"
)

func Generate(ctx context.Context, req *plugin.Request) (*plugin.Response, error) {
	conf, err := core.MakeConfig(req)
	if err != nil {
		return nil, err
	}
	enums := core.BuildEnums(req)
	structs := core.BuildDataClasses(conf, req)
	if err != nil {
		return nil, err
	}

	tctx := core.TmplCtx{
		Settings:      req.Settings,
		Q:             `"""`,
		Package:       conf.Package,
		Enums:         enums,
		DataClasses:   structs,
		SqlcVersion:   req.SqlcVersion,
		Configuration: conf,
	}

	output := map[string]string{}

	execute := func(name string, f func(io.Writer, core.TmplCtx) error) error {
		var b bytes.Buffer
		w := bufio.NewWriter(&b)
		tctx.SourceName = name
		err := f(w, tctx)
		w.Flush()
		if err != nil {
			return err
		}
		if !strings.HasSuffix(name, ".sql") {
			name += ".sql"
		}
		output[name] = core.Format(b.String())
		return nil
	}

	if err := execute("query.sql", templates.Sqls); err != nil {
		return nil, err
	}

	resp := plugin.CodeGenResponse{}

	for filename, code := range output {
		resp.Files = append(resp.Files, &plugin.File{
			Name:     filename,
			Contents: []byte(code),
		})
	}

	return &resp, nil
}
