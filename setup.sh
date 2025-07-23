#!/usr/bin/env bash
set -euo pipefail
export DEBIAN_FRONTEND=noninteractive   # quiet non‑interactive installs

# 1. Refresh APT index and install tool‑chain + Python
apt-get update -y
apt-get install -y --no-install-recommends \
    python3 python3-dev python3-venv python3-pip \
    build-essential pkg-config git curl ca-certificates

# 2. Native libs required by your wheels
apt-get install -y --no-install-recommends \
    libgirepository1.0-dev \
    gir1.2-gtk-3.0 \
    libcairo2-dev \
    gstreamer1.0-libav \
    gstreamer1.0-tools \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    libgl1 \
    libglib2.0-dev

# 3. Upgrade pip and lock your Python deps
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install \
    gstreamer-player==1.1.2 \
    opencv-python==4.10.0.84 \
    pycairo==1.27.0 \
    pygi==1.0.3 \
    PyGObject==3.50.0 \
    python-Levenshtein==0.26.1 \
    PyYAML==6.0

# 4. Windows‑only helper wheel intentionally omitted
echo "✅ Codex environment ready."
