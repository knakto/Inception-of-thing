#! /bin/bash

# install kubectl bin
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# install docker and set user group to use without sudo
curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
sudo sh /tmp/get-docker.sh
sudo adduser vagrant docker

# install k3d bin
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# install helm bin
curl -fsSL -o /tmp/get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 /tmp/get_helm.sh
/tmp/get_helm.sh

# install argocd bin
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v3.5.3/argocd-linux-amd64 && chmod +x /usr/local/bin/argocd
