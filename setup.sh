#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "Please run with:  sudo $0" >&2
  exit 1
fi

##### 1.  —  Refresh package index & base tool‑chain ###########################
apt-get update -y
apt-get install -y --no-install-recommends \
  python3 python3-pip python3-venv python3-dev \
  build-essential pkg-config git curl ca-certificates

##### 2.  —  Native libraries required ##########################
# GStreamer, GTK + PyGObject, Cairo, OpenCV’s runtime deps, etc.
apt-get install -y --no-install-recommends \
  libgirepository1.0-dev gir1.2-gtk-3.0       \  # PyGObject headers
  libcairo2-dev                                \  # Cairo for pycairo
  gstreamer1.0-libav gstreamer1.0-tools        \
  gstreamer1.0-plugins-{base,good,bad,ugly}    \
  libgl1 libglib2.0-dev                        # OpenCV, GI “GLib” helpers

##### 3.  —  Upgrade pip/setuptools & lock the Python deps #####################
python3 -m pip install -U pip setuptools wheel

python3 -m pip install \
  gstreamer-player==1.1.2 \
  opencv-python==4.10.0.84 \
  pycairo==1.27.0 \
  pygi==1.0.3 \
  PyGObject==3.50.0 \
  python-Levenshtein==0.26.1 \
  PyYAML==6.0


echo "✔ Environment ready."
