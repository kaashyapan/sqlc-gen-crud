# Sqlc plugin for generating crud SQL
`sqlc` is a command line program that generates type-safe database access code from SQL.\
Sqlc documentation - https://sqlc.dev

This plugin reads a schema file and generates basic CRUD Sql statements for all the tables.\
It can be run before any language specific codegen steps to bootstrap a project.

  ```json
  {
    "version": "2",
    "plugins": [
      {
        "name": "gen-crud",
        "wasm": {
          "url": "https://github.com/kaashyapan/sqlc-gen-crud/releases/download/latest/sqlc-gen-crud_1.0.0.wasm",
          "sha256": "73917dcfb520e974e3f2eb21564109431caecdb000d30b0361398c2ca6460fb5"
        }
      }
    ],
    "sql": [
      {
        "engine": "postgresql",
        "schema": "schema.sql",
        "queries": "dummy.sql",
        "codegen": [
          {
            "out": <..target_folder...>,
            "plugin": "gen-crud",
            "options": {
            }
          }
        ]
      }
    ]
  }
  ```
- ```sqlc generate```

## How to use
- Put your schema in schema.sql
- `sqlc` doesnt let you run without an sql file. So make a dummy.sql file as below 
```sql
-- dummy :one
select current_timestamp;
```
- Make a config file `crud.json` as shown above
Run `sqlc -f crud.json generate`

- Produces 5 Sql statements select, insert, update, delete & list.

See the example folder for a sample setup.

