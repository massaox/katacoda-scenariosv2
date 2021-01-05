We can the "kubectl top" command to check if the metrics-server is working correct:

`kubectl top nodes`{{ execute HOST1 }}

The command above will report CPU and Memory usage from all the nodes in the cluster. You can also see Pod's resource usage as well.  For example let's see all pods in the kube-system namespace:

`kubectl top pods -n kube-system`{{ execute HOST1 }}

Now that we have the "metrics-server" up and running and collecting metrics for us let's create a deployment to use for our test.

Instead of writing the deployment manifest from scratch we can take advantage of the "kubectl create" command to generate a template manifest for us then we just fill it with some additional information. You can read more about the kubectl documentation here:

https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#-em-deployment-em-

The idea is to run the command on "dry-run" mode and output the content to a yaml file so we can apply to the cluster and keep on our version control to keep in line with the "infrastructure as code" philosophy.

We will use a busybox image version 1.33.0 for our test, we need to pass a command to our image to make sure it stays running otherwise it will crash on startup. For that we can use the sleep. The command below should be enough to get us started:

`kubectl create deployment hpa-test --image=busybox:1.33.0 --dry-run=client -o yaml  > /root/manifests/deployment.yaml`{{ execute HOST1 }}

What we just did was create a yaml deployment manifests on the location "/root/manifests/deployment.yaml" of the name "hpa-test" using the image busybox version 1.33.0.

We are not done with a manifest yet, we still need to fill out the "resources" part, in order to scale based on CPU usage, HPA needs to know how much the Pod requires which is done so by adding the CPU request on the Pod template and also pass the sleep command for the Pod to execute.

You can use the explain command if you need assistance filling out the CPU request, make sure the CPU request is set to "50m".

`kubectl explain pod.spec.containers.resources`{{ execute HOST1 }}

For the sleep command you can add all parameters in a single line using the square brackets, the command below should be added in line with all the "containers" options like name,image and resources:

```
command: ["/bin/sh", "-c", "sleep 6000"]
```

Once once done you can apply the manifest:

`kubectl apply -f /root/manifests/deployment.yaml`{{ execute HOST1 }}

Wait a few seconds and you should a "hpa-test" pod running:

`kubectl get pods`{{ execute HOST1 }}

If it is not running try checking the logs or running a describe on the pod. Otherwise move to the next step.