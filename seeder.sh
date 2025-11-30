#!/bin/bash
set -e

# Wait for Cassandra to be ready
until cqlsh cassandra -e "DESCRIBE KEYSPACES"; do
  echo "Waiting for Cassandra to start..."
  sleep 5
done

# Seed the database
cqlsh cassandra -f /docker-entrypoint-initdb.d/create-demo-db.sql