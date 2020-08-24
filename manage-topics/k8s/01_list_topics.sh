source app.properties



kubectl exec -ti ${CLUSTER_NAME}-kafka-0 --container=kafka  --  /opt/kafka/bin/kafka-topics.sh --list --bootstrap-server=localhost:9092


