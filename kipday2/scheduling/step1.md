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

>> Based on the Pod manifest above, in which node the would say the Pod can be scheduled on? <<
( ) The "controplane"  only
( ) The "node01" only
(*) Both

It would be used to use "kubectl describe" on the nodes to take a look at any taints the nodes might have.