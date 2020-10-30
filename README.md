# Notejam Infrastructure provisioning

## Cloud Infrastructure

## Application Infrastructure

```bash
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml
helm upgrade --install -n demo --create-namespace --wait -f ./environments/postgres.yaml postgres ./helm/postgres --dry-run --debug
helm upgrade --install -n demo --create-namespace --wait redis ./helm/redis
helm upgrade --install -n demo --create-namespace --wait -f ./environments/notejam.yaml notejam ./helm/notejam
```
