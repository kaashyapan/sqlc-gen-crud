package core

type Config struct {
	Package                     string   `json:"package"`
	EmitExactTableNames         bool     `json:"emit_exact_table_names"`
	EmitClasses                 bool     `json:"emit_classes"`
	InflectionExcludeTableNames []string `json:"inflection_exclude_table_names"`
}
