# Sqlc plugin for generating crud SQL


  ```json
  {
    "version": "2",
    "plugins": [
      {
        "name": "gen-crud",
        "wasm": {
          "url": "https://github.com/kaashyapan/sqlc-gen-crud/releases/download/latest/sqlc-gen-crud_1.0.0.wasm",
          "sha256": "85a42e4f3d70feb8eb725d7406593114723ab474ecd4c74d1f9edb4867515ea4"
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
- `sqlc` doesnt let you run without an sql file. Make a dummy.sql file as below 
```sql
-- dummy :one
select current_timestamp;
```
- Make a config file `crud.json` as shown above
Run `sqlc -f crud.json generate`

- Produces 5 Sql statements select, insert, update, delete & list.

See the example folder for a sample setup.

