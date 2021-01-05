Kubernetes already comes with the HPA controller built-in to the controller manager so all we need to do now is create a HPA object that will watch over our hpa-test deployment.

Again we can take advantage of the "kubectl" documentation to help us generate a HPA manifests:

https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#autoscale

This time I will let you write the command. You can use the example section in the documentation to use as starting point. We will need to following:

* Maximum of 5 pods.
* Minimum of 1 pod.
* Average CPU utilization of 50%
* dry-run option 
* Manifest in YAML format
* Output to be sent to file "/root/manifests/hpa-test.yaml

Once the manifest is created, let's apply it:

`kubectl apply -f /root/manifests/hpa-test.yaml`{{ execute HOST1 }}

After a minute or so our new HPA object should report some information:

`kubectl describe hpa hpa-test`{{ execute HOST1 }}

If the HPA object has been successfully created it is time to move to the next step.
