source app.properties



for REPLICATIONS in 1 3
do
  echo -e "\n\nReplications: ${REPLICATIONS}"

  for PARTITIONS in 1 3 6 12
  do
    echo -e "\n\nPartitions: ${PARTITIONS}"
    TOPIC=pt-${PARTITIONS}p-${REPLICATIONS}r
    echo -e "Creating topic: ${TOPIC}"

    kubectl exec -ti ${CLUSTER_NAME}-kafka-0 --container=kafka  --  /opt/kafka/bin/kafka-topics.sh --create --topic ${TOPIC} --partitions ${PARTITIONS} --replication-factor ${REPLICATIONS} --bootstrap-server=localhost:9092

    #/opt/confluent/bin/kafka-topics \
    #  --zookeeper ${ZOOKEEPER} \
    #  --create \
    #  --topic ${TOPIC} \
    #  --partitions ${PARTITIONS} \
    #  --replication-factor ${REPLICATIONS}
  done
done


