# create container regitry
az acr create --resource-group <group> --name <name> --sku Basic

# create service principal
az ad sp create-for-rbac --skip-assignment

az acr show --resource-group <group> --name <name> --query "id" --output tsv

az role assignment create --assignee <spId> --scope <acrId> --role acrpull

az aks create --resource-group <group> --name <name> --dns-name-prefix <dns prefix> --node-count 2 --service-principal <spId> --client-secret <client secret> --generate-ssh-keys --enable-rbac --enable-addons monitoring --location eastus --node-vm-size Standard_DS1_v2 --workspace-resource-id <subscription id>

# walk through link: https://docs.microsoft.com/en-us/azure/aks/ingress-tls
helm install stable/nginx-ingress --namespace kube-system --set controller.replicaCount=2
# add official Helm stable charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update

#helm install stable/nginx-ingress --set controller.replicaCount=2 --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux --set controller.service.loadBalancerIP="13.95.111.82" --namespace kube-system --generate-name


#link: https://docs.cert-manager.io/en/latest/getting-started/install/kubernetes.html

#https://docs.cert-manager.io/en/latest/getting-started/install/kubernetes.html
# Create a namespace to run cert-manager in
kubectl create namespace cert-manager

kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v0.11.0/cert-manager.yaml --validate=false

#setup issuer, https://docs.cert-manager.io/en/latest/tasks/issuers/setup-acme/index.html



