#!/usr/bin/env bash

# Create a secret to be mounted in the img pod. 
# The JSON key file is downloaded from a GCP Service Account that has the Storage Admin role.
kubectl create secret generic img-secret --from-file=key.json=PATH_TO_KEY_FILE