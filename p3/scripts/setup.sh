set -euo pipefail

CLUSTER=cluster-p3

if ! k3d cluster list | grep -q "^${CLUSTER}"; then
    k3s cluster create "$CLUSTER" -p "8080:80@loadbalancer" -- wait
fi

kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl create namespace dev    --dry-run=client -o yaml | kubectl apply -f -

kubectl apply -n argocd --server-side -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl wait --for=condition=available deployment/argocd-server -n argocd --timeout=600s

echo "argocd is ready"

echo "argocd Admin password:"


# https://stackoverflow.com/questions/68297354/what-is-the-default-password-of-argocd
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo