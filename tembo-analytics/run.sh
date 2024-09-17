#!/bin/bash

TRIES=3

cat queries.sql | while read query; do
  sync
  # echo 3 | sudo tee /proc/sys/vm/drop_caches

  echo "$query";
  for i in $(seq 1 $TRIES); do
  psql -X 'postgresql://postgres:91ldCXvLGih5YHWy@usefully-innate-sheep.data-1.use1.tembo.io:5432/postgres' -c '\timing' -c "$query" | grep 'Time'
  done;
done;
