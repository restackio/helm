
# Contribute

## Local minikube setup


Insecure registry allows to use Docker desktop images in minikube.

```
minikube start --insecure-registry='10.0.0.0/24' --extra-config=kubelet.max-pods=1000
```

To enable pushing local Docker images to minikube, enable the registry addon

```
minikube addons enable registry
```

See more info at https://minikube.sigs.k8s.io/docs/handbook/registry/

Open K8s dashboard

```
minikube dashboard
```

start minikube tunnel to enable ingresses to resolve locally

```
sudo minikube tunnel
```

### Temporal setup

```
helm install \
    --repo https://go.temporal.io/helm-charts \
    --set server.replicaCount=1 \
    --set cassandra.config.cluster_size=1 \
    --set elasticsearch.replicas=1 \
    --set prometheus.enabled=false \
    --set grafana.enabled=false \
    temporal temporal \
    --timeout 15m
```

ssh to admin-setup container

Make sure namespace default exists

```
temporal operator namespace create -n default
```

Create search attribute

```
temporal operator search-attribute create --name="engineId" --type="Keyword"`
```

### Push local image to minikube

In your backend directory, build the image and make it available for minikube

https://minikube.sigs.k8s.io/docs/handbook/pushing/

```
eval $(minikube docker-env)
```

```
docker build -t my-image .
```

### Restack setup

In /restack directory

```
helm install restack-1 restack/restack-helm -f ./values-minikube.yaml
```

Get Restack engine Developer UI address from:

```
minikube service restack-1-restack-helm --url
```

