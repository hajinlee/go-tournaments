#!/bin/sh

# dumps contents of the development.sqlite3 database to a file
./docker-cmd.sh sqlite3 /usr/src/app/db/development.sqlite3 .dump > ${HOME}/Documents/tournamentdata.sql
