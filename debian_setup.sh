#!/usr/bin/env bash

<< COMMENTOUT
sudo apt-get update -y && sudo apt-get install -y git && rm -rf setup && git clone https://github.com/enoatu/setup && ./setup/debian_setup.sh
COMMENTOUT

sudo apt-get install -y \
    unzip \
    tree \
    vim \
    build-essential \
    zsh \
    && sudo chsh -s /bin/zsh `whoami`

# サイズをへらす
sudo apt-get clean

# タイムゾーン設定
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

# 設定
cd
git clone https://github.com/enoatu/dotfiles
./dotfiles/install.sh

# zshで入りなおす
<< COMMENTOUT
exec $SHELL -l
COMMENTOUT
