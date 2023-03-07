#!/bin/bash
cd "$(dirname "$0")"

# bootstrap acm, gitops opearators
oc apply -k .

# wait for CRD
while [ true ]; do 
  oc get crd argocds.argoproj.io applicationsets.argoproj.io multiclusterhubs.operator.open-cluster-management.io
  if [ $? -eq 0 ]; 
    then break; 
  fi;
  sleep 5s;
done

# wait for project
while [ true ]; do
  oc get project open-cluster-management
  if [ $? -eq 0 ]; 
    then break; 
  fi;
  sleep 5s;
done

# wait for operator to spin-up
oc -n open-cluster-management wait pod -l name=multiclusterhub-operator --for=condition=Ready --timeout=180s
if [ $? != 0 ]; then
  echo "🛑 timed out waiting for multiclusterhub operator pod, exiting 🛑";
  exit 1;
fi

# wait for operator to spin-up
oc -n openshift-storage wait pod -l app.kubernetes.io/name=lvms-operator --for=condition=Ready --timeout=180s
if [ $? != 0 ]; then
  echo "🛑 timed out waiting for lvms-operator operator pod, exiting 🛑";
  exit 1;
fi

# configure
oc apply -f setup.yaml
