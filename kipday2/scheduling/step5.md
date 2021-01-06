Only the red Pod remained since the NoExecute effect has the power to evict any Pods from the node that it does not have the correct toleration as soon as the taint is applied. This is a powerful option heavily utilized by Kubernetes internal when perform action such as Node updates.

Time for the next question. Take a look again at the cluster, the scenario is very similar to the previous step but with one major difference, let's see if you can spot it.

Given again the taint below:

Key=special
Value=true
Effect=NoExecute

>> Based on the pods running what will happens if we apply the above taint to "node01"? <<

( ) All Pods will be evicted
( ) No Pods will be evicted
( ) Only the blue Pod will remain
(*) Only the red Pod will remain
( ) Nothing will happen