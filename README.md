# DockerPostgresBackup
Backup a Postgres database running inside a docker container to a volume.

To make use of this you need to:
* Pass in a --link to some postgres docker container with it RENAMED TO 'db'.
* Pass in a volume to save the backup into.
* Specify the OUTDIR environment variable(inside the container).

For example to backup the postgres running in container 'primary-database' to host directory '/var/log/backups':
```
docker run -i -v /var/log/backups:/tmp/backup --link=primary-database:db -e OUTDIR=/tmp/backup postgres-backup"
```
# On success the script should print 'Backing up Postgres.'
