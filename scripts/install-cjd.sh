#!/usr/bin/env bash

# install NGINX ingress
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/docs/examples/psp/psp.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud-generic.yaml

# add CloudBees Helm repo
helm repo add cloudbees https://charts.cloudbees.com/public/cloudbees 
helm repo update

# install CJD
kubectl create namespace cjd

helm fetch cloudbees/cloudbees-jenkins-distribution
helm template cloudbees-jenkins-distribution-2.176.203.tgz \
  --name cjd \
  --namespace cjd \
  | kubectl -n cjd apply -f -
  