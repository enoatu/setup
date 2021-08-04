#!/usr/bin/env bash

<< COMMENTOUT
sudo apt update -y && sudo apt install -y git && rm -rf ./setup && git clone https://github.com/enoatu/setup && ./setup/debian_setup.sh
COMMENTOUT

sudo apt-get install -y \
    unzip \
    tree \
    vim \
    tmux \
    wget \
    build-essential \
    zsh \
    && sudo chsh -s /bin/zsh $USER
sudo apt upgrade -y

# サイズをへらす
sudo apt clean

# タイムゾーン設定
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

# 設定
cd
git clone https://github.com/enoatu/dotfiles
./dotfiles/install.sh

# マカレル導入
# https://mackerel.io/orgs/enoatu/dashboard

# zshで入りなおす
<< COMMENTOUT
exec $SHELL -l
COMMENTOUT

# ON GCE
<< COMMENTOUT
# chsh 失敗するのでデフォルトシェル設定できない
zsh
# perl -v 等の perl: warning: Please check that your locale settings エラー対応
echo "LC_ALL=C" >> ~/.zshrc.local
# スワップ追加
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo echo "/swapfile none swap sw 0 0 0" >> /etc/fstab
COMMENTOUT
