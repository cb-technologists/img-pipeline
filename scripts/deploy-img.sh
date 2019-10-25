#!/usr/bin/env bash

kubectl apply -f imgPSP.yaml
kubectl apply -f imgSA.yaml
kubectl --as=system:serviceaccount:img:img apply -f imgPod.yaml 