source app.properties

/opt/confluent/bin/kafka-topics \
  --zookeeper ${ZOOKEEPER} \
  --list


