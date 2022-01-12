#!/bin/bash

# Add the repository which contains the Elastissearch Helm chart
helm repo remove elastic
helm repo add elastic https://helm.elastic.co

helm --kubeconfig $KUBECONFIG install \
    kibana \
    --namespace $EFK_NS \
    --version 7.16.1 \
    --values values.kibana.yml \
    elastic/kibana