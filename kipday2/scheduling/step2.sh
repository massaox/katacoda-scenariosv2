#!/bin/bash
kubectl taint node node01 tier=special:NoSchedule
