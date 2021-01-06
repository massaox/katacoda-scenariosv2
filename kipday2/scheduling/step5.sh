#!/bin/bash
kubectl taint node node01 special=true:NoExecute- 
kubectl apply -f /root/manifests/blue-deployment.yaml
kubectl apply -f /root/manifests/green-deployment.yaml
kubectl apply -f /root/manifests/red-pod.yaml
