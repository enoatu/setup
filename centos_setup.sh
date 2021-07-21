#!/usr/bin/env bash

<< COMMENTOUT
sudo yum update -y && sudo yum install -y git && rm -rf setup && git clone https://github.com/enoatu/setup && ./setup/centos_setup.sh
COMMENTOUT

sudo yum -y install \
    zsh \
    git \
    unzip \
    tree \
    vim \
# サイズをへらす
    && yum clean all

#タイムゾーン
sudo timedatectl set-timezone Asia/Tokyo

# 文字コードをUTF-8
sudo localectl set-locale LANG=ja_JP.utf8

# 設定
cd
git clone https://github.com/enoatu/dotfiles
./dotfiles/install.sh
