We can the "kubectl top" command to check if the metrics-server is working correct:

`kubectl top nodes`{{ execute HOST1 }}

The command above will report CPU and Memory usage from all the nodes in the cluster. You can also see Pod's resource usage as well.  For example let's see all pods in the kube-system namespace:

`kubectl top pods -n kube-system`{{ execute HOST1 }}
