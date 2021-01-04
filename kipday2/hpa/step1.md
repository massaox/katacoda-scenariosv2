Click on the script below to start the Kubernetes Cluster

`launch.sh`{{ execute HOST1 }}

Our Kubernetes cluster should be up and running in a few seconds or a couple of minutes at worse.

If you list all the pods running in the kube-system namespace you will see that metrics-server is not deployed yet

`kubectl get pods -n kube-system`{{ execute HOST1 }}

The metrics-server can be found on the following Github repository:

https://github.com/kubernetes-sigs/metrics-server

Feel free to have a look around in the repository. To install the metric-server as per repo instruction you can execute the following command to get the latest version:

`kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml`{{ execute HOST1}}

You can should see a "metrics-server-<HASH>" being deployed at the kube-system namespace, once the STATUS goes to running you can quit out of the command below:

`watch kubectl -n kube-system get pods`{{ execute HOST1 }}