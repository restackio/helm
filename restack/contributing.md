
## Linting helm

```
helm lint .
```

## Debugging values

```
helm template . --debug > debug.yaml
```

## Publishing

This chart is automatically published to GitHub Pages using [helm/chart-releaser-action](https://github.com/marketplace/actions/helm-chart-releaser). 
