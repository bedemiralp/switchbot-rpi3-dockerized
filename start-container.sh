#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${IMAGE_NAME:-switchbot-python-host:ubuntu-lts}"
CONTAINER_NAME="${CONTAINER_NAME:-switchbot-python-host}"

docker run --rm -it \
    --name "$CONTAINER_NAME" \
    --network host \
    --cap-add NET_ADMIN \
    --cap-add NET_RAW \
    -v /var/run/dbus:/var/run/dbus \
    "$IMAGE_NAME" \
    python3 switchbot_py3.py "$@"
