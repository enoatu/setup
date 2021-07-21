#!/usr/bin/env bash

# sudo yum update -y && sudo yum install -y git

git clone https://github.com/enoatu/setup
git clone https://github.com/enoatu/dotfiles

sudo yum -y install
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
