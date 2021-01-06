#!/bin/bash
kubectl taint node node01 tier=special:NoSchedule-
kubectl apply -f /root/manifests/blue-pod.yaml
kubectl apply -f /root/manifests/green-pod.yaml
kubectl apply -f /root/manifests/red-pod.yaml
