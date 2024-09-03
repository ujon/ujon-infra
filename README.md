# UJON Infra

## Start

```bash
# start docker container
sh ./command.sh --local start
# generate db data with flyway
sh ./command.sh --local migration
# stop docker container
sh ./command.sh --local stop
# delete all generated data
sh ./command.sh --local clean
```

## Phase

In the future, a `dev` and `staging` phase could be added. 

- local
- prod