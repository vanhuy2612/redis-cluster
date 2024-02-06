#!/bin/sh

# Using the redis-cli tool available as default in the Redis base image
# we need to create the cluster so they can coordinate with each other
# which key slots they need to hold per shard

# wait a little so we give some time for the Redis containers
# to spin up and be available on the network
set -e
sleep 5
# redis-cli doesn't support hostnames, we must match the
# container IP addresses from our docker-compose configuration.
# `--cluster-replicas 1` Will make sure that every master node will have its replica node
echo "yes" | redis-cli --cluster create \
    192.168.0.11:6379 \
    192.168.0.12:6379 \
    192.168.0.13:6379 \
    192.168.0.14:6379 \
    192.168.0.15:6379 \
    192.168.0.16:6379 \
  --cluster-replicas 1
echo "🚀 Redis cluster ready."