#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${IMAGE_NAME:-yema-dsw:0228}"
CONTAINER_NAME="${CONTAINER_NAME:-dsw-dev}"
WORKDIR_IN_CONTAINER="${WORKDIR_IN_CONTAINER:-/workspace}"
MOUNT_DIR="${MOUNT_DIR:-$PWD}"
SHM_SIZE="${SHM_SIZE:-16g}"

docker run --rm -it \
  --gpus all \
  --name "${CONTAINER_NAME}" \
  --shm-size "${SHM_SIZE}" \
  -v "${MOUNT_DIR}:${WORKDIR_IN_CONTAINER}" \
  -w "${WORKDIR_IN_CONTAINER}" \
  "${IMAGE_NAME}" \
  bash
