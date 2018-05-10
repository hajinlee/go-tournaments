#!/bin/sh

# restores contents of the development.sqlite3 database from a file
./docker-cmd.sh sqlite3 /usr/src/app/db/development.sqlite3 < ${HOME}/Documents/tournamentdata.sql
