#!/bin/bash

if [[ ${KUBECONFIG} == "" ]]
then
    echo "Please export KUBECONFIG env variable before running script!!!"
    exit 1
else
    echo "Current value of KUBECONFIG --> [${KUBECONFIG}]"
fi

export $(xargs <.env)

cd "02-1-pvc"
helm dependency update
helm upgrade -i init-pvc . -f values-${ENV}.yaml -n pvc-demo --create-namespace
cd ..
