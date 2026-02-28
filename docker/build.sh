#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

IMAGE_NAME="${IMAGE_NAME:-dsw:latest}"
DOCKERFILE="${DOCKERFILE:-${SCRIPT_DIR}/Dockerfile.dsw}"
CONTEXT_DIR="${CONTEXT_DIR:-${SCRIPT_DIR}}"

TZ="${TZ:-Asia/Shanghai}"
MAX_JOBS="${MAX_JOBS:-16}"
# PIP_INDEX_URL="http://nexus.sii.shaipower.online/repository/pypi/simple"
# PIP_TRUSTED_HOST="nexus.sii.shaipower.online"
PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
PIP_TRUSTED_HOST="pypi.tuna.tsinghua.edu.cn"
APT_MIRROR="http://nexus.sii.shaipower.online/repository/ubuntu/"
APT_CODENAME="jammy"
SSH_PUBKEYS="${SSH_PUBKEYS:-ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHu6GjPBeXF1f9VidcLazoZ3JW6zbgA7qqptINN0jHUL 871432122@qq.com}"

echo "Building image: ${IMAGE_NAME}"
echo "Dockerfile: ${DOCKERFILE}"
echo "Context: ${CONTEXT_DIR}"

docker build \
  -f "${DOCKERFILE}" \
  -t "${IMAGE_NAME}" \
  --build-arg TZ="${TZ}" \
  --build-arg MAX_JOBS="${MAX_JOBS}" \
  --build-arg PIP_INDEX_URL="${PIP_INDEX_URL}" \
  --build-arg PIP_TRUSTED_HOST="${PIP_TRUSTED_HOST}" \
  --build-arg APT_MIRROR="${APT_MIRROR}" \
  --build-arg APT_CODENAME="${APT_CODENAME}" \
  --build-arg SSH_PUBKEYS="${SSH_PUBKEYS}" \
  "${CONTEXT_DIR}"
