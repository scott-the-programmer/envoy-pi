.PHONY: build
build:
	ENVOY_DOCKER_PLATFORM="arm64" ./ci/run_envoy_docker.sh 'BAZEL_BUILD_EXTRA_OPTIONS="--define tcmalloc=gperftools" ./ci/do_ci.sh bazel.release.server_only'

.PHONY: build-image
build-image:
	docker build -t envoyproxy/envoy-build-ubuntu:latest -f Dockerfile .
