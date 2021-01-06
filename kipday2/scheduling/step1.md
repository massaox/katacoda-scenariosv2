Click on the script below to start the Kubernetes Cluster

`launch.sh`{{ execute HOST1 }}

Our Kubernetes cluster should be up and running in a few seconds or a couple of minutes at worse. You can see all Pods in the kube-system namespace being initialized, just wait for all of them to be at the "Running" STATUS before proceeding, once done just hit "CTRL + C" to quit out of the watch command:

`watch kubectl -n kube-system get pods`{{ execute HOST1 }}

Have a look at the manifest below than answer the question:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: blue
  labels:
    color: blue
spec:
  containers:
  - name: blue
    image: raftx/sample-web:v1
  tolerations:
  - key: "node-role.kubernetes.io/master"
    operator: "Exists"
    effect: "NoSchedule"
```

>> In which node would say the Pod can be scheduled on? <<

( ) The "controplane"  only
( ) The "node01" only
(*) Both
( ) None of them

It would be used to use "kubectl describe" on the nodes to take a look at any taints the nodes might have.