package core

import (
	"fmt"
	"regexp"
	"sort"
	"strings"

	easyjson "github.com/mailru/easyjson"
	plugin "github.com/tabbed/sqlc-go/codegen"
	"github.com/tabbed/sqlc-go/sdk"

	"github.com/kaashyapan/sqlc-gen-crud/internal/inflection"
)

var fsIdentPattern = regexp.MustCompile("[^a-zA-Z0-9_]+")

type Constant struct {
	Name  string
	Type  string
	Value string
}

type Enum struct {
	Name      string
	Comment   string
	Constants []Constant
}

type Field struct {
	ID      int
	Name    string
	Type    fsType
	Comment string
}

type Struct struct {
	Table   plugin.Identifier
	Name    string
	Fields  []Field
	Comment string
}

type QueryValue struct {
	Emit   bool
	Name   string
	Struct *Struct
	Typ    fsType
}

func (v QueryValue) EmitStruct() bool {
	return v.Emit
}

func (v QueryValue) IsStruct() bool {
	return v.Struct != nil
}

func (v QueryValue) isEmpty() bool {
	return v.Typ == (fsType{}) && v.Name == "" && v.Struct == nil
}

func (v QueryValue) Type() string {
	if v.Typ != (fsType{}) {
		return v.Typ.String()
	}
	if v.Struct != nil {
		return v.Struct.Name
	}
	panic("no type for QueryValue: " + v.Name)
}

func fsEnumValueName(value string) string {
	id := strings.Replace(value, "-", "_", -1)
	id = strings.Replace(id, ":", "_", -1)
	id = strings.Replace(id, "/", "_", -1)
	id = fsIdentPattern.ReplaceAllString(id, "")
	return strings.ToUpper(id)
}

func BuildEnums(req *plugin.CodeGenRequest) []Enum {
	var enums []Enum
	for _, schema := range req.Catalog.Schemas {
		if schema.Name == "pg_catalog" || schema.Name == "information_schema" {
			continue
		}
		for _, enum := range schema.Enums {
			var enumName string
			if schema.Name == req.Catalog.DefaultSchema {
				enumName = enum.Name
			} else {
				enumName = schema.Name + "_" + enum.Name
			}
			e := Enum{
				Name:    dataClassName(enumName, req.Settings),
				Comment: enum.Comment,
			}
			for _, v := range enum.Vals {
				e.Constants = append(e.Constants, Constant{
					Name:  fsEnumValueName(v),
					Value: v,
					Type:  e.Name,
				})
			}
			enums = append(enums, e)
		}
	}
	if len(enums) > 0 {
		sort.Slice(enums, func(i, j int) bool { return enums[i].Name < enums[j].Name })
	}
	return enums
}

func dataClassName(name string, settings *plugin.Settings) string {
	if rename := settings.Rename[name]; rename != "" {
		return rename
	}
	out := ""
	for _, p := range strings.Split(name, "_") {
		out += sdk.Title(p)
	}
	return out
}

func BuildDataClasses(conf Config, req *plugin.CodeGenRequest) []Struct {
	var structs []Struct
	for _, schema := range req.Catalog.Schemas {
		if schema.Name == "pg_catalog" || schema.Name == "information_schema" {
			continue
		}
		for _, table := range schema.Tables {
			var tableName string
			if schema.Name == req.Catalog.DefaultSchema {
				tableName = table.Rel.Name
			} else {
				tableName = schema.Name + "_" + table.Rel.Name
			}
			structName := dataClassName(tableName, req.Settings)
			if !conf.EmitExactTableNames {
				structName = inflection.Singular(inflection.SingularParams{
					Name:       structName,
					Exclusions: conf.InflectionExcludeTableNames,
				})
			}

			s := Struct{
				Table:   plugin.Identifier{Schema: schema.Name, Name: table.Rel.Name},
				Name:    structName,
				Comment: table.Comment,
			}
			for _, column := range table.Columns {
				s.Fields = append(s.Fields, Field{
					Name:    column.Name,
					Type:    makeType(req, column),
					Comment: column.Comment,
				})
			}
			structs = append(structs, s)
		}
	}
	return structs
}

type fsType struct {
	Name      string
	LibTyp    string
	ReaderTyp string
	DbName    string
	IsEnum    bool
	IsArray   bool
	IsNull    bool
	DataType  string
	Engine    string
}

func (t fsType) String() string {
	v := t.Name
	if t.IsArray {
		v = fmt.Sprintf("List<%s>", v)
	}
	return v
}

func (t fsType) IsUUID() bool {
	return strings.ToLower(t.DataType) == "uuid"
}

func makeType(req *plugin.CodeGenRequest, col *plugin.Column) fsType {
	fstyp, readerTyp, libTyp, isEnum := fsInnerType(req, col)
	return fsType{
		Name:      fstyp,
		LibTyp:    libTyp,
		ReaderTyp: readerTyp,
		DbName:    col.Name,
		IsEnum:    isEnum,
		IsArray:   col.IsArray,
		IsNull:    !col.NotNull,
		DataType:  sdk.DataType(col.Type),
		Engine:    req.Settings.Engine,
	}
}

func fsInnerType(req *plugin.CodeGenRequest, col *plugin.Column) (string, string, string, bool) {
	// TODO: Extend the engine interface to handle types
	switch req.Settings.Engine {
	case "mysql":
		return mysqlType(req, col)
	case "postgresql":
		return postgresType(req, col)
	case "sqlite":
		return sqliteType(req, col)
	default:
		return "any", "any", "any", false
	}
}

type TmplCtx struct {
	Q           string
	Package     string
	Enums       []Enum
	DataClasses []Struct
	Settings    *plugin.Settings
	SqlcVersion string
	// TODO: Race conditions
	SourceName string

	Configuration       Config
	EmitJSONTags        bool
	EmitPreparedQueries bool
	EmitInterface       bool
}

func Offset(v int) int {
	return v + 1
}

func MakeConfig(req *plugin.Request) (Config, error) {

	var conf Config
	if len(req.PluginOptions) > 0 {
		if err := easyjson.Unmarshal(req.PluginOptions, &conf); err != nil {
			return conf, err
		}
	}
	return conf, nil
}

func Format(s string) string {
	// TODO: do more than just skip multiple blank lines, like maybe run fslint to format
	skipNextSpace := false
	var lines []string
	for _, l := range strings.Split(s, "\n") {
		isSpace := len(strings.TrimSpace(l)) == 0
		if !isSpace || !skipNextSpace {
			lines = append(lines, l)
		}
		skipNextSpace = isSpace
	}
	o := strings.Join(lines, "\n")
	o += "\n"
	return o
}
