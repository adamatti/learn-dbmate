Pet project play with [dbmate](https://github.com/amacneil/dbmate)

TL/DR: great alternative to [flyway](https://flywaydb.org/) / [liquibase](https://www.liquibase.org/) to copy db structure to local box, work with db migrations, etc

# How to run

- optional: have `DATABASE_URL` available on host
- `make docker-sh`
- inside the container use the `db` alias, e.g. `db status`