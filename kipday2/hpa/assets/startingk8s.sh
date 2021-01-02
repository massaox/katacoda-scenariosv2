#!/bin/bash

echo "Starting Kubernetes"
while [ ! -f /opt/.startingk8s ] ; do sleep 2; done;
echo "Kubernetes started"
