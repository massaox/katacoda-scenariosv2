#!/bin/bash
kubectl taint node node01 special=true:NoExecute-
kubectl taint node node01 gpu=true:NoSchedule
