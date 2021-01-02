#!/bin/bash

echo "Starting Kubernetes cluster" >&2

while [ `kubectl get nodes | grep " Ready" |  wc -l` -ne 2 ]
do
  sleep 1
done

echo "Kubernetes started" >&2
 
kubectl apply -f /root/setup/metrics-server_0.4.1.yaml
