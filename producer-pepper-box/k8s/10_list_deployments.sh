#!/bin/bash



echo "kubectl get deployments"
kubectl get deployments



echo -e "\n\n\nkubectl describe deployment kafka-pt-producer-pb"
kubectl describe deployment kafka-pt-producer-pb