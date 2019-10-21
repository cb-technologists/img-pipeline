#!/usr/bin/env bash

gcloud beta container clusters create melgin-alpha \
  --cluster-version 1.14.6-gke.2 \
  --enable-kubernetes-alpha \
  --enable-pod-security-policy \
  --identity-namespace=melgin.svc.id.goog \
  --machine-type=n1-standard-2 \
  --image-type=cos_containerd