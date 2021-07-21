#!/usr/bin/env bash

# sudo yum update && sudo yum install -y git
sudo yum install -y
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
