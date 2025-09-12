#!/bin/sh

# Note: Do not forget to provide executable permissions for the shell script

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/baremetal/deploy.yaml
