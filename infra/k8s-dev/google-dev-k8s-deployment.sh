######################### update existing k8s-deployment.sh ######################### 
#!/bin/bash

#k8s-deployment.sh

sed -i "s#replace#${imageName}#g" google-depl-dev.yaml

kubectl -n dev apply -f google-depl-dev.yaml

######################### update existing k8s-deployment.sh #########################