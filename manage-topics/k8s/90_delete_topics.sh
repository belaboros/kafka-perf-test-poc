source app.properties



for REPLICATIONS in 1 3
do
  echo -e "\n\nReplications: ${REPLICATIONS}"

  for PARTITIONS in 1 3 6 12
  do
    echo -e "\n\nPartitions: ${PARTITIONS}"
    TOPIC=pt-${PARTITIONS}p-${REPLICATIONS}r
    echo -e "Deleting topic: ${TOPIC}"

    kubectl exec -ti ${CLUSTER_NAME}-kafka-0 --container=kafka  --  /opt/kafka/bin/kafka-topics.sh --delete --topic ${TOPIC} --bootstrap-server=${BOOTSTRAP_SERVER}

    #/opt/confluent/bin/kafka-topics \
    #  --zookeeper ${ZOOKEEPER} \
    #  --delete \
    #  --topic ${TOPIC}
  done
done


