#!/bin/bash

echo "Starting Kubernetes cluster"

while [ `kubectl get nodes | grep " Ready" |  wc -l` -ne 2 ]
do
  sleep 1
done

echo "Kubernetes started"
