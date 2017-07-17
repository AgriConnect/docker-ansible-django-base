#!/bin/sh

mkdir -p "$PGDATA"
chown -R postgres "$PGDATA"

su-exec postgres initdb
