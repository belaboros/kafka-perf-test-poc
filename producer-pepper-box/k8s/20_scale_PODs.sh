#!/bin/bash
# Change the number of PODs (replicas) of log-generator


REPLICA_COUNT=${1:-1}
echo "Setting the number of PODs (replicas) to ${REPLICA_COUNT}"


kubectl scale --replicas=${REPLICA_COUNT} deployment/kafka-pt-producer-pb
kubectl describe deployment kafka-pt-producer-pb


