#!/usr/bin/env bash

#######################################################################
### environment variables
#######################################################################

set +x

if [[ -z "$AWS_ACCESS_KEY_ID" ]]; then
    echo "... please provide AWS_ACCESS_KEY_ID in environment" 1>&2
    exit 1
fi

if [[ -z "$AWS_SECRET_ACCESS_KEY" ]]; then
    echo "... please provide AWS_SECRET_ACCESS_KEY in environment" 1>&2
    exit 1
fi

if [[ -z "$AWS_DEFAULT_REGION" ]]; then
    echo "... please provide AWS_DEFAULT_REGION in environment" 1>&2
    exit 1
fi

set -x

#######################################################################
### constants / settings
#######################################################################

export PREFIX=EKSCTL

export CLUSTER_NAME=${PREFIX}
export STACK_NAME=eksctl-${CLUSTER_NAME}-cluster 

set +x
echo "################################################################################"
echo "### create cluster"
echo "################################################################################"
set -x

eksctl create cluster \
    --name ${CLUSTER_NAME} \
    --nodes 3 \
    --region ${AWS_DEFAULT_REGION}

sleep 20

cat ~/.kube/config | \
    cut -b 1-80

sleep 20

set +x
echo "################################################################################"
echo "### cloudformation describe stack"
echo "################################################################################"
set -x

aws cloudformation describe-stacks \
    --stack-name ${STACK_NAME} \
    --no-cli-pager

sleep 20

aws cloudformation describe-stack-resources \
    --stack-name ${STACK_NAME} \
    --no-cli-pager

sleep 20

set +x
echo "################################################################################"
echo "### get nodes and pods"
echo "################################################################################"
set -x

kubectl get nodes -o wide

kubectl get pods --all-namespaces -o wide

sleep 20

set +x
echo "################################################################################"
echo "### clean up"
echo "################################################################################"
set -x

eksctl delete cluster \
    --name ${CLUSTER_NAME} \
    --region ${AWS_DEFAULT_REGION}

sleep 20
