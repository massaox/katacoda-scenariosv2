# Loop to wait for both nodes to be in the Ready state before proceeding.
while [ `kubectl get nodes | grep " Ready" |  wc -l` -ne 2 ]
do
  sleep 1
done

# Loop to wait for Katacoda to upload the assets files
while [ `/root/manifests/ | wc -l` -ne 12 ]
do
  sleep 2
done

kubectl apply -f /root/manifests --record


