#!/usr/bin/env bash

# connect to cluster
gcloud container clusters get-credentials melgin-alpha

# create GSA (if not already created)
gcloud iam service-accounts create img-gcr

# grant Storage Admin permissions to GSA
gcloud projects add-iam-policy-binding melgin \
  --member serviceAccount:img-gcr@melgin.iam.gserviceaccount.com \
  --role roles/storage.admin

# create namespace
kubectl create namespace img

# create KSA
kubectl create serviceaccount --namespace img img

# bind GSA to KSA
gcloud iam service-accounts add-iam-policy-binding \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:melgin.svc.id.goog[img/img]" \
  img-gcr@melgin.iam.gserviceaccount.com