#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"

docker build -t "belaboros/kafka-pt-producer-pepper-box" .

