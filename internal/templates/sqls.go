package templates

import (
	"io"
	"strconv"

	"github.com/kaashyapan/sqlc-gen-crud/internal/core"
)

func Sqls(w io.Writer, dot core.TmplCtx) (err error) {
	defer func() {
		if recovered := recover(); recovered != nil {
			var ok bool
			if err, ok = recovered.(error); !ok {
				panic(recovered)
			}
		}
	}()

	//return fsModelsTmpl(w, dot)
	if dot.Settings.Engine == "mysql" {
		WriteMysql(w, dot)
	} else {
		WritePg(w, dot)
	}
	return nil

}

func fsModelsTmpl(w io.Writer, dot core.TmplCtx) error {

	if eval := dot.DataClasses; len(eval) != 0 {
		for _, dot := range eval {
			_ = dot
			_, _ = io.WriteString(w, "\n")

			_, _ = io.WriteString(w, "\nselect * from ")
			_, _ = io.WriteString(w, dot.Table.Name)
			_, _ = io.WriteString(w, ";")
			if eval := dot.Fields; len(eval) != 0 {
				for _Vari, _Vare := range eval {
					_ = _Vari
					dot := _Vare
					_ = dot

					_, _ = io.WriteString(w, "\n  ")
					_, _ = io.WriteString(w, dot.Name)
					_, _ = io.WriteString(w, "\n  ")
					_, _ = io.WriteString(w, dot.Type.DataType)
					_, _ = io.WriteString(w, "Libtype - "+dot.Type.LibTyp)
					_, _ = io.WriteString(w, "\n  ")
					_, _ = io.WriteString(w, "Is null - "+strconv.FormatBool(dot.Type.IsNull))
					_, _ = io.WriteString(w, "\n  ")
					_, _ = io.WriteString(w, "Is uuid - "+strconv.FormatBool(dot.Type.IsUUID()))

					_, _ = io.WriteString(w, ", ")
				}
			}
			_, _ = io.WriteString(w, "\n")
		}
	}

	_, _ = io.WriteString(w, "\n\n")
	return nil
}
