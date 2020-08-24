#!/bin/bash
# Query the latest 10-10 logs records of log-generator PODs running in K8S



mkdir -p logs
rm logs/*.log


PODS=$(kubectl get pods -o custom-columns=POD_NAME:.metadata.name | grep kafka-pt-producer-pb)
#echo -e "kafka-pt-producer-pb PODs:\n${PODS}"

for POD in ${PODS}; do
    echo -e "\n\nPOD:${POD}" | tee -a logs/kafka-pt-producer-pb-PODs.log
    echo "$(kubectl get pods | grep ${POD})" | tee -a logs/kafka-pt-producer-pb-PODs.log
    echo -e "..." | tee -a logs/kafka-pt-producer-pb-PODs.log
    kubectl logs --tail=5 ${POD} | tee -a logs/kafka-pt-producer-pb-PODs.log
    kubectl logs ${POD} | tee -a logs/kafka-pt-producer-pb-${POD}.log
done

