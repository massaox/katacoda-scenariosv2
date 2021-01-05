Now we have our metrics-server reporting resource usage from the pod in our deployment and a HPA object looking after our deployment to make sure CPU utilization is under 50%, if it goes over the HPA is allowed to spin 4 more pods to bring the average CPU utilization of our deployment under 50%.

However nothing is going to happen now since our only pod is just running a "sleep" command which requires barely any CPU.

To test if our HPA solution will work as intended we need a way to increase CPU utilization on our pod to over 50% to see what happens.

We can do show by logging to our only pod in our deployment and sending a bunch of "yes" to /dev/null, that should be enough to generate enough CPU usage to trigger a response for the HPA, just run the command below replacing the name of our pod:

kubectl exec -it POD-NAME -- sh -c 'yes > /dev/null'

Once you ran the command above open a new Terminal by clicking on the plus tab "+" and selectiing "Open New Terminal"

If you run the command below a few times you will see the CPU on our pod spiking:

`kubectl top pod`{{ execute HOST1 }}

You will see the number of replicas in our deployment increasing as well:

`kubectl get deployments.apps hpa-test`{{ execute HOST1 }}

After a minute or so you should see 5 pods running from our deployment"

`kubectl get pods`{{ execute HOST1 }}

By describing our HPA object you will see all the events relating to our pods and the actions being taken by the HPA controller:

`kubectl get hpa hpa-test`{{ execute HOST1 }}

Now go back to the first Terminal and hit a "CTRL + C" to quit out of our "kubectl exec" command. That should bring the CPU utilization down straight away which is going to be picked up by our HPA object which in turn will lower the number of replicas down to 1.