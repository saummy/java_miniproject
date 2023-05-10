# Java Mini Project - Jobspot

## Setup
The project uses a dockerized database (Postgresql) and needs to be configured with some data.

```bash
# Windows OS
# Make sure docker is running in background and opean a terminal in intellij
# in project root (where pox.xml is located)

docker compose up
```

Now to add data to the database, open another terminal
```bash
docker cp ./dump.sql jobspot-postgres:/
docker exec -it jobspot-postgres sh
psql -U postgres -d jobspot < ./dump.sql
```

Once this is done, start the app from intellij.
