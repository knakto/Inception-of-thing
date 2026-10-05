#! /bin/bash

# get .kube/config for use kubectl outside cluseter
mkdir -p /home/vagrant/.kube && k3d kubeconfig get knakto > /home/vagrant/.kube/config

# set context to argocd to easy to use "argocd --core"
kubectl config set-context --current --namespace=argocd

argocd app list --core
