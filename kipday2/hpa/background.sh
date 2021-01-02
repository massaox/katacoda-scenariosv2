#!/bin/bash

while [ `kubectl get nodes | grep " Ready" |  wc -l` -ne 2 ]
do
  sleep 1
done

echo "Kubernetes started" > /opt/.startingk8s
 
kubectl apply -f /root/setup/metrics-server_0.4.1.yaml
