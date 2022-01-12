#!/bin/bash

# from https://docs.fluentbit.io/manual/installation/kubernetes#installation

# Add the repository which contains the Elastissearch Helm chart
helm repo remove fluent
helm repo add fluent https://fluent.github.io/helm-charts

helm --kubeconfig $KUBECONFIG install \
    fluent-bit \
    --namespace $EFK_NS \
    --version 0.19.17 \
    --values values.fluentbit.yml \
    fluent/fluent-bit
