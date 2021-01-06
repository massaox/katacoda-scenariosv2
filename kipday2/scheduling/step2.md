Well done. The correct answer was "Both". That is because taints and toleration are methods to prevent Pods from being scheduled on a particular node and not to "attract" Pods to the nodes. So our "blue" Pod was set to tolerate the "controlplane" so it might or might not end up being scheduled there.

Time for another one:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: green
  labels:
    color: green
spec:
  containers:
  - name: green
    image: busybox:1.33.0
```

>> Based on the Pod manifest above, in which node the would say the Pod can be scheduled on? <<
( ) The "controlplane"  only
( ) The "node01" only
( ) Both
(*) None of them

By the way, some changes might have happened in the background from step 1 to step 2 so you might want to re-assess the nodes again.