#!/bin/bash
set -e

# Wait for Cassandra to be up
until cqlsh -e "describe keyspaces"; do
  echo "Waiting for Cassandra to start..."
  sleep 5
done

# Seed the database
cqlsh -f /docker-entrypoint-initdb.d/create-demo-db.sql
