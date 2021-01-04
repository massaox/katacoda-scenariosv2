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

You will notice that even though the STATUS shows the Pod as running the READY section will show 0/1. Check the logs from the metrics-server pod with the "logs" option:

kubectl -n kube-system logs METRICS-SERVER-POD

You will see a error message about the metric-server not being able to to verify the certificate provided by the Kubelet, that is because how Kubernetes was setup on this environment. Since we are only testing we can add the an option to skip the TLS verification. If you see the Github repo under the "Configuration" section we need to add the option "--kubelet-insecure-tls" to our deployment manifests.

For testing purposes only we can use the "kubectl edit" command to apply the change on the fly:

`kubectl edit -n kube-system deployments.apps metrics-server`{{ execute HOST1 }}

The command above will take you to a vim editor with our metrics-server deployment manifest open. You need to go to deployment.spec.template.spec.containers.args and add our option there. 

This is what the manifest would look like before the change:
```
    spec:
      containers:
      - args:
        - --cert-dir=/tmp
        - --secure-port=4443
        - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
        - --kubelet-use-node-status-port
```

Just add the option on the bottom like so:
```    spec:
      containers:
      - args:
        - --cert-dir=/tmp
        - --secure-port=4443
        - --kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname
        - --kubelet-use-node-status-port
        - --kubelet-insecure-tls
```

Close the file by hitting the ESC key, followed by colon key ":" and the letters "qw". The changes should apply automatically once the file is closed.

A new metrics-server pod will be created. If everything was done correct the READY column should show 1/1. If so move to the next step.