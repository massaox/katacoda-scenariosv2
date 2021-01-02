#!/bin/bash

echo "Starting Kubernetes cluster" > /dev/stdout

while [ `kubectl get nodes | grep " Ready" |  wc -l` -ne 2 ]
do
  sleep 1
done

echo "Kubernetes started" > /dev/stdout
 
kubectl apply -f /root/setup/metrics-server_0.4.1.yaml
