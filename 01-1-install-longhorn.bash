#!/bin/bash

if [[ ${KUBECONFIG} == "" ]]
then
    echo "Please export KUBECONFIG env variable before running script!!!"
    exit 1
else
    echo "Current value of KUBECONFIG --> [${KUBECONFIG}]"
fi

export $(xargs <.env)

cd "01-1-longhorn"
helm dependency update
helm upgrade -i init-longhorn . -f values-${ENV}.yaml -n longhorn-system --create-namespace
cd ..
