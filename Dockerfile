# Tool to backup a postgres database that is running inside a docker container. 
# To make use of this you need to:
# 1) Pass in a --link to some postgres docker container with it RENAMED TO 'db'.
# 2) Pass in a volume to save the backup into.
# 3) Specify the OUTDIR environment variable(inside the container).
# For example to backup the postgres running in container 'primary-database' to host directory '/var/log/backups':
# docker run -i -v /var/log/backups:/tmp/backup --link=primary-database:db -e OUTDIR=/tmp/backup backupdb"

# On success the script should print 'Backing up Postgres.'

FROM postgres:latest
ADD backup_my_database.sh /bin/backup_my_database.sh
RUN chmod 777 /bin/backup_my_database.sh
CMD /bin/backup_my_database.sh
