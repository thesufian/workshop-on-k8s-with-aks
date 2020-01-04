#link: https://docs.cert-manager.io/en/latest/getting-started/install/kubernetes.html

# Create a namespace to run cert-manager in
kubectl create namespace cert-manager

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v0.11.0/cert-manager.yaml --validate=false

#setup issuer, https://docs.cert-manager.io/en/latest/tasks/issuers/setup-acme/index.html
