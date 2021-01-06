As you have seen the correct answer now was "None of them". It is best practice to not scheduled any Pods on the master node, apart from those essential to run the cluster. Our cluster was provisioned using a popular tool called [kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/) which by default adds the taint "node-role.kubernetes.io/master:NoSchedule" to prevent Pods from being scheduled on the master (controplane) node. And taint "tier=special:NoSchedule" was added to "node01" and since our "green" Pod did not have any toleration for both taints it would never be scheduled.

You can try for yourself by applying the manifest:

`kubectl apply -f /root/manifests/green-pod.yaml`{{ execute HOST1 }}

Now run a describe on the Pod and check the "Events" section:

`kubectl describe pod green`{{ execute HOST1 }}

Luckily the scheduler throws out a straightforward message.

Let's delete the manifest before proceeding to the next step:

`kubectl delete -f /root/manifests/green-pod.yaml`{{ execute HOST1 }}

