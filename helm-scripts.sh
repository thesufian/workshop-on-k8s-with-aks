# add official Helm stable charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update

#helm install stable/nginx-ingress --set controller.replicaCount=2 --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux --set controller.service.loadBalancerIP="13.95.111.82" --namespace kube-system --generate-name