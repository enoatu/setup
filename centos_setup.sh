#!/usr/bin/env bash

<< COMMENTOUT
sudo yum update -y && sudo yum install -y git && rm -rf setup && git clone https://github.com/enoatu/setup && ./setup/centos_setup.sh
COMMENTOUT

# util-linux-user はchshを入れるため
sudo yum -y install \
    unzip \
    tree \
    vim \
    zsh \
    util-linux-user \
    && chsh -s /bin/zsh `whoami`

# vimビルドのためbuild系
sudo yum -y groupinstall "Development tools"

# サイズをへらす
sudo yum clean all


#タイムゾーン
sudo timedatectl set-timezone Asia/Tokyo

# 文字コードをUTF-8
sudo localectl set-locale LANG=ja_JP.utf8

# 設定
cd
git clone https://github.com/enoatu/dotfiles
./dotfiles/install.sh

# zshで入りなおす
<< COMMENTOUT
exec $SHELL -l
COMMENTOUT
