#!/bin/sh

docker run -it --rm \
--network bhlogin_default \
-e PGPASSWORD=bhlogin \
postgres:9.6 \
psql -h db -U bhlogin
