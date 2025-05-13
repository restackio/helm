
# Restack with Helm

Find restack helm chart at /restack

See below some common setup for Kubernetes and Temporal

## Kubernetes version

Run k8s at version 1.32 minimum.

## Temporal dependency

Use Temporal Cloud at https://cloud.temporal.io/
or deploy yourself with helm chart https://github.com/temporalio/helm-charts

### Temporal connection

As referred in Restack docs:

And Restack docs on how to connect to Temporal

https://docs.restack.io/enterprise/custom-temporal

Make sure the Temporal nampespace needs a custom attribute "engineId".

Create it in Temporal Cloud or with Temporal admin setup if deployed yourself.