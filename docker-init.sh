#!/bin/sh

apt update
apt install wget bzip2 -y

cd /scripts || exit 1
ls
sh download

PGPASSWORD=postgres psql -h omdb -U postgres -d omdb -v ON_ERROR_STOP=1 \
  -c "CREATE EXTENSION IF NOT EXISTS tsm_system_rows;" \
  -f omdb.sql
