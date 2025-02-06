.PHONY: build
build:
	ENVOY_DOCKER_PLATFORM="arm64" ./ci/run_envoy_docker.sh 'BAZEL_BUILD_EXTRA_OPTIONS="--define tcmalloc=gperftools" ./ci/do_ci.sh bazel.release.server_only'

.PHONY: build-image
build-image:
	docker build -t envoyproxy/envoy-pi:latest -f Dockerfile .

.PHONY: push-image
push-image:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "Usage: make push-image <repository>"; \
		exit 1; \
	fi
	$(eval REPO := $(filter-out $@,$(MAKECMDGOALS)))
	docker tag envoyproxy/envoy-pi:latest $(REPO)/envoy-pi:latest
	docker push $(REPO)/envoy-pi:latest

%:
	@: