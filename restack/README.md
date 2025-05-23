# Restack Helm Chart

This directory contains the Helm chart for deploying Restack components.

## Usage

You can use this chart directly from our public GitHub Pages Helm repository.

### Add the Helm Repository

```
helm repo add restack https://restackio.github.io/helm
helm repo update
```

### Install the Chart

```
helm install restack-1 restack/restack-helm --values https://raw.githubusercontent.com/restackio/helm/main/restack/values.yaml
```

Or, to use your own custom values:

```
helm install restack-1 restack/restack-helm -f ./values.yaml
```

## Configuration

See [`values.yaml`](./values.yaml) for all available configuration options.

## Chart Source

- Chart YAML: [`Chart.yaml`](./Chart.yaml)
- Default values: [`values.yaml`](./values.yaml)
- Example values: [`values-custom.yaml`](./values-custom.yaml)
