#!/usr/bin/env bash

################################################################
# Copyright 2023 - IBM Corporation. All rights reserved
# SPDX-License-Identifier: Apache-2.0
################################################################

# Var: ${self.triggers.vpc_support_server_ip}
PROXY_SERVER="${1}"

echo "Worker Status is: "
oc get nodes -o jsonpath='{range .items[*]}{.metadata.name}{","}{.status.conditions[?(@.type=="Ready")].status}{"\n"}{end}'
echo "Cluster Operator is: "
oc get co

echo "$(date -u --rfc-3339=seconds) - Waiting for clusteroperators to complete"

oc wait clusteroperator.config.openshift.io \
    --for=condition=Available=True \
    --for=condition=Progressing=False \
    --for=condition=Degraded=False \
    --timeout=15m \
    --all

echo "Get Cluster Operators"
oc get co

echo "Check for any missing csrs"
oc get csr

echo "Final Worker Status is: "
oc get nodes -o jsonpath='{range .items[*]}{.metadata.name}{","}{.status.conditions[?(@.type=="Ready")].status}{"\n"}{end}'

echo "Cluster Operator is: "
oc get co

FAL_COUNT=$(oc get co -o jsonpath='{range .items[*]}{.metadata.name}{","}{.status.conditions[?(@.type=="Available")].status}{"\n"}{end}' | grep False | wc -l)
if [ "${FAL_COUNT}" == "0" ]
then
  echo "Cluster Operators are not ready after 15 minutes"
  exit 1
fi