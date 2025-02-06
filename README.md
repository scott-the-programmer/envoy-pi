# Envoy PI

A fork of https://github.com/envoyproxy/envoy with support for ARM64 based the workaround discussed [here](https://github.com/envoyproxy/envoy/issues/23339#issuecomment-1987368190)

## Building Envoy

```bash
make
```

## Building and pushing the Envoy image

```bash
make build-image
```

```bash
make push-image IMAGE=ghcr.io/your-namespace/envoy:latest
```
