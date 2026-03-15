#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${IMAGE_NAME:-switchbot-python-host:ubuntu-lts}"

docker build --pull -t "$IMAGE_NAME" .

