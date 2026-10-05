#! /bin/bash

# create cluster name knakto
k3d cluster create knakto -p "80:80@loadbalancer"
k3d image import /tmp/p3/web/app.tar -c knakto

# setup argocd
kubectl create namespace argocd
kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl wait --for=condition=available deployment/argocd-server -n argocd --timeout=300s
kubectl wait --for=condition=established --timeout=60s crd/applications.argoproj.io

# apply my app into argocd
kubectl apply -f https://raw.githubusercontent.com/knakto/Inception-of-thing/main/src/p3/kubeconfig/argoconfig/config.yml
