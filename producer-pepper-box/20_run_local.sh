#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"

#java -cp pepper-box-1.0.jar  com.gslab.pepper.PepperBoxLoadGenerator --schema-file <schema file absolute path> --producer-config-file <producer properties absoulte path>  --throughput-per-producer <throughput rate per producer> --test-duration <test duration in seconds> --num-producers <number of producers>

java \
    -Dlog4j.configuration=file:${SCRIPT_DIR}/log4j.properties \
    -cp ${SCRIPT_DIR}/pepper-box/target/pepper-box-1.0.jar \
    com.gslab.pepper.PepperBoxLoadGenerator \
    --schema-file ${SCRIPT_DIR}/schema.json \
    --producer-config-file ${SCRIPT_DIR}/producer-local.properties \
    --throughput-per-producer 30 \
    --test-duration 20 \
    --num-producers 1





