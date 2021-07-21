#!/usr/bin/env bash
# sudo apt-get update && sudo apt-get install -y git
sudo apt-get install -y \
    zsh \
    unzip \
    tree \
    vim \
    && apt-get clean

# タイムゾーン設定
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata
