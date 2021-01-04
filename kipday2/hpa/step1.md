Click on the script below to start the Kubernetes Cluster

`launch.sh`{{ execute HOST1 }}

Our Kubernetes cluster should be up and running in a few seconds or a couple of minutes at worse.

If you list all the pods running in the kube-system namespace you will see that metrics-server is not deployed yet

`kubectl get pods -n kube-system`{{ execute HOST1 }}

The metrics-server can be found on the following Github repository:

https://github.com/kubernetes-sigs/metrics-server