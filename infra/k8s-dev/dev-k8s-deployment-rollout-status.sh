############### k8s-deployment-rollout-status.sh ###############
#!/bin/bash

#k8s-deployment-rollout-status.sh

curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"
chmod u+x ./kubectl

sleep 60s

if [[ $(./kubectl -n dev rollout status deploy ${deploymentName} --timeout 5s) != *"successfully rolled out"* ]]; 
then     
	echo "Deployment ${deploymentName} Rollout has Failed"
    ./kubectl -n dev rollout undo deploy ${deploymentName}
    exit 1;
else
	echo "Deployment ${deploymentName} Rollout is Success"
fi
############### k8s-deployment-rollout-status.sh ###############