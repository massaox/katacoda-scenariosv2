There are a few Pods running on the cluster now, take a quick look at them:

`kubectl get pods -o wide`{{ execute HOST1 }}

The "-o wide" flag gives you more information which includes the node the Pods are running on.

>> Based on the pods running what will happens if we apply the following taint to "node01"? <<

Key=special
Value=true
Effect=NoExecute

( ) All Pods will be evicted
( ) No Pods will be evicted
( ) Only the blue Pod will remain
(*) Only the red Pod will remain
( ) Nothing will happen

If you want to confirm your suspicious you can go ahead and apply the taint yourself:

`kubectl taint node node01 special=true:NoExecute`{{ execute HOST1 }}

After a couple of seconds list the pods in the default namespace to see what happened:

`kubectl get pods`{{ execute HOST1 }}

