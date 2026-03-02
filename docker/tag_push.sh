#!/usr/bin/env bash
set -euo pipefail

LOCAL_IMAGE="${LOCAL_IMAGE:-yema-dsw:0302v2}"
REMOTE_IMAGE_REF="${REMOTE_IMAGE_REF:-yema-dsw:0302v2}"
REMOTE_IMAGE="docker-qb.sii.edu.cn/inspire-studio/${REMOTE_IMAGE_REF}"

echo "Tagging image:"
echo "  ${LOCAL_IMAGE} -> ${REMOTE_IMAGE}"
docker tag "${LOCAL_IMAGE}" "${REMOTE_IMAGE}"

echo "Pushing image:"
echo "  ${REMOTE_IMAGE}"
docker push "${REMOTE_IMAGE}"

echo "Done."
