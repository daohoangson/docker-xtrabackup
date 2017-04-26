#!/bin/sh

DOCKER_HUB_IMAGE="xfrocks/xtrabackup"
DOCKER_HUB_TAG="2.4"

docker build \
	-t "$DOCKER_HUB_IMAGE" \
	-t "$DOCKER_HUB_IMAGE:$DOCKER_HUB_TAG" \
	.

docker push "$DOCKER_HUB_IMAGE"
docker push "$DOCKER_HUB_IMAGE:$DOCKER_HUB_TAG"
