Only the red Pod remained again however you noticed that as soon as the blue and green Pods were evicted new ones were created, that is because this there is a deployment object looking after them (via a replicaSet object) so as soon they were kicked out the "desired" state of 1 replication changed to 0 so our replicaSet controller kicked in to rectify the state, however there were no places to scheduled the Pods so they will remained in "Pending" status until there is a node available free from any taints.

Now let's move to a tricky question. Take a look at the manifest below:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: orange
  labels:
    color: orange
spec:
  containers:
  - name: orange
    image: raftx/sample-web:v1
  tolerations:
  - operator: "Exists"
```

>> Based on the Pod manifest above, in which node the would say the Pod can be scheduled on? <<

( ) The "controlplane"  only
( ) The "node01" only
(*) Both
( ) None of them

Take a look again at the taints on both nodes before answering the question.