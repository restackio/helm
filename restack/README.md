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

### Logs Configuration

The chart supports shipping application logs to cloud storage via a sidecar container. Configure based on your cloud provider:

#### GCP (Google Cloud Storage)
```yaml
logs:
  enabled: true
  bucket: "your-gcs-bucket-name"
cloudProvider: "gcp"
```

#### Azure (Blob Storage)
```yaml
logs:
  enabled: true
  azure:
    container: "your-container-name"
    storageAccount: "yourstorageaccount"
cloudProvider: "azure"
```

#### AWS (S3)
```yaml
logs:
  enabled: true
  bucket: "your-s3-bucket-name"
cloudProvider: "aws"
```

| Cloud Provider | Required Configuration |
|----------------|------------------------|
| GCP | `logs.bucket` |
| AWS | `logs.bucket` |
| Azure | `logs.azure.container`, `logs.azure.storageAccount` |

**Note:** Authentication is handled via cloud-native mechanisms:
- **GCP**: Workload Identity (ServiceAccount annotation)
- **Azure**: Workload Identity (Pod label `azure.workload.identity/use: "true"` added automatically)
- **AWS**: IAM Roles for Service Accounts

## Chart Source

- Chart YAML: [`Chart.yaml`](./Chart.yaml)
- Default values: [`values.yaml`](./values.yaml)
- Example values: [`values-custom.yaml`](./values-custom.yaml)
