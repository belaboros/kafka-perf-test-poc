# See also
# https://gist.github.com/ueokande/b96eadd798fff852551b80962862bfb3


# exit immediately if a command exits with a non-zero status
set -e


source test.properties



for REPLICATIONS in 1 3
do
  echo -e "\n\nReplications: ${REPLICATIONS}"

  for PARTITIONS in 1 3 6 12
  do
    echo -e "\n\n\nProducer: ${PARTITIONS} partitions, single thread, no replication"
    TOPIC="pt-${PARTITIONS}p-${REPLICATIONS}r"
    echo "Writing to topic: ${TOPIC}"

    time ${KAFKA_PATH}/bin/kafka-producer-perf-test \
      --topic ${TOPIC} \
      --num-records 5000000 \
      --record-size 100 \
      --throughput -1 \
      --producer-props acks=1 \
      bootstrap.servers=${BOOTSTRAP_SERVERS} \
      buffer.memory=67108864 \
      batch.size=8196
  done
done



