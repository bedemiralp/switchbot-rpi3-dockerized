FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    bluez \
    dbus \
    gcc \
    g++ \
    libglib2.0-dev \
    make \
    python3 \
    python3-pip \
    python3-bluez \
    python3-pexpect \
    && python3 -m pip install --no-cache-dir bluepy \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

CMD ["python3", "switchbot_py3.py", "--help"]
