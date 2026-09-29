#!/bin/bash

TOPIC_NAME="my-topic"
PARTITIONS=3
REPLICATION_FACTOR=1
CONTAINER_NAME="kafka-producer-demo-kafka-1"   # container name from docker ps

echo "Creating Kafka topic: $TOPIC_NAME ..."
docker exec $CONTAINER_NAME kafka-topics --create \
  --topic $TOPIC_NAME \
  --bootstrap-server localhost:9092 \
  --partitions $PARTITIONS \
  --replication-factor $REPLICATION_FACTOR

echo "Verifying topic creation..."
docker exec $CONTAINER_NAME kafka-topics --describe \
  --topic $TOPIC_NAME \
  --bootstrap-server localhost:9092
