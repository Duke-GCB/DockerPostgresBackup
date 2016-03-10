#backup postgres based on docker environment variables

if [ -d "$OUTDIR" ]
then
  echo "Backing up Postgres".

  #setup pgpass so pg_dumpall can log in
  PGPASS_LINE="$DB_PORT_5432_TCP_ADDR:$DB_PORT_5432_TCP_PORT:*:postgres:$DB_ENV_POSTGRES_PASSWORD"
  echo $PGPASS_LINE > ~/.pgpass
  chmod 0600 ~/.pgpass

  #dump the database
  TIMESTAMP=`date +%Y-%m-%d.%H.%M.%S`
  pg_dumpall -U postgres -h $DB_PORT_5432_TCP_ADDR > $OUTDIR/PostgresBackup.$TIMESTAMP
else
  echo "You must pass the OUTDIR env variable."
  echo "You must use a volume to create the OUTDIR directory."
  echo "Example: docker run -i -v /home/jpb67/db_backups:/tmp/backup --link=some-postgres:db -e OUTDIR=/tmp/backup backupdb"
fi
