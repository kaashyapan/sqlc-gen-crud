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
          "url": "https://github.com/kaashyapan/sqlc-gen-crud/releases/download/latest/sqlc-gen-crud_1.0.1.wasm",
          "sha256": "1a8146b30585882a8104d2ddcbfef0438b953fff08e74e7b90a9bf3d7bb2764c"
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

- Produces 6 Sql statements select, insert, update, delete, list & count.

See the example folder for a sample setup.

