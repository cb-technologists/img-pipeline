#!/usr/bin/env bash

gcloud beta container clusters create melgin-alpha \
  --enable-kubernetes-alpha \
  --enable-pod-security-policy \
  --identity-namespace=melgin.svc.id.goog
  --machine-type=n1-standard-2
  --image-type=cos_containerd