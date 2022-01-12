#!/bin/bash

# Add the repository which contains the Elastissearch Helm chart
helm repo remove elastic
helm repo add elastic https://helm.elastic.co

helm --kubeconfig $KUBECONFIG install \
    elasticsearch \
    --namespace $EFK_NS \
    --version 7.16.1 \
    --values values.elastic.yml \
    elastic/elasticsearch