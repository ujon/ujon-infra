# UJON Infra

## Project structure

```shell
ujon-infra
├ bin
├ config
├ db
├ ├ init
├ ├ migration
├ command.sh
├ docker-compose.yaml
├ README.md
```

- `bin`: Contains shell scripts.
- `config`: Contains the Flyway's configuration.
- `db/init`: Contains the initial SQL scripts. When adding database utilities, please use this folder.
- `db/migration`:  Contains versioned SQL scripts used by Flyway for database migrations. Each script should follow
  Flyway's naming conventions.
- `command.sh`: Assists in executing shell scripts.

## How to

### Command

You can use `command.sh` to handle your local infrastructure.

```bash
# start docker container
sh ./command.sh start
# stop docker container
sh ./command.sh stop
# validate current version of sql with flyway
sh ./command.sh validate
# migrate current version of sql with flyway
sh ./command.sh migrate
# delete all local data
sh ./command.sh clean
# generate production environment secret key for github action
# !! before execute this command value should be modified for production
sh ./command.sh secret
```

## Flyway

### Versioning

Follow the structure below for naming Flyway migration scripts:

```shell
v0.0.1__user.sql
v0.0.2__user_insert.sql
v0.0.3__user_delete.sql
```

- prefix: `v`
- version: `0.0.1` (MAJOR.MINOR.PATCH)
- separator: `__` (double underscore)
- description:
    - `user`: Indicates that 'user'-related tables (e.g., user, user_email) are created or updated.
    - `user_insert`: Indicates that data is inserted using INSERT queries.
    - `user_delete`: Indicates that the 'user' table is deleted. 

