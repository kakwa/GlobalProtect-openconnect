#!/bin/bash -e

sudo apt-get update
sudo apt-get install -y \
    build-essential \
    qt6-base-dev \
    libqt6websockets6-dev \
    qt6-webengine-dev \
    qtkeychain-qt6-dev \
    openconnect

./scripts/install.sh
