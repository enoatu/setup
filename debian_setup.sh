#!/usr/bin/env bash
# sudo apt-get update -y && sudo apt-get install -y git

git clone https://github.com/enoatu/setup
git clone https://github.com/enoatu/dotfiles

sudo apt-get install -y \
    zsh \
    unzip \
    tree \
    vim \
    && apt-get clean

# タイムゾーン設定
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata
