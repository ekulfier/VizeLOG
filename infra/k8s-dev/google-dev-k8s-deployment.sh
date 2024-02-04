######################### update existing k8s-deployment.sh ######################### 
#!/bin/bash

#k8s-deployment.sh

curl -LO "https://storage.googleapis.com/kubernetes-release/release/v1.20.5/bin/linux/amd64/kubectl"

sleep 20s

# Make it executable
chmod +x ./kubectl

sed -i "s#replace#${imageName}#g" google-depl-dev.yaml

./kubectl -n dev apply -f google-depl-dev.yaml
######################### update existing k8s-deployment.sh #########################