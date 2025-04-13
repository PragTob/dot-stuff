#!/usr/bin/env bash

set -x
set -e

# configure mirrors, upgrade, install new kernel
# setup super + Tab short cut to open terminal
# sign into Firefox sync
# deactivate the annoying sounds
# get  & install vscode: https://code.visualstudio.com/
# set mode to dark and green in themes

sudo apt -y install steam-installer spotify-client chromium dropbox curl git zeal

# GET ME SIGNAL
# 1. Install our official public software signing key:
# wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
# cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# 2. Add our repository to your list of repositories:
# echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
#   sudo tee /etc/apt/sources.list.d/signal-xenial.list

# 3. Update your package database and install Signal:
# sudo apt update && sudo apt install signal-desktop


# ASDFFFFFF

# Deps of asdf plugins
# erlang deps https://github.com/asdf-vm/asdf-erlang?tab=readme-ov-file#ubuntu-2404-lts
sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.2-dev libwxgtk-webview3.2-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk
# elixir
sudo apt-get -y install unzip
# ruby deps  https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
sudo apt-get -y install autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
# node deps https://github.com/nodejs/node/blob/main/BUILDING.md#building-nodejs-on-supported-platforms
sudo apt-get -y install python3 g++ make python3-pip
# postgres deps https://github.com/smashedtoatoms/asdf-postgres#ubuntu
sudo apt-get -y install linux-headers-$(uname -r) build-essential libssl-dev libreadline-dev zlib1g-dev libcurl4-openssl-dev uuid-dev icu-devtools libicu-dev

# needed for phoenix live reload and maybe/partially ex_guard
sudo apt-get -y install inotify-tools
# I NEED ASDF
# double check branch/version number
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0

# maybe put my bashrc somewhere and get that in there instead?
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc

# asdf needs a new tab/shell, so new tab and run asdf_all.sh



# SET STUFF IN GIT
git config --global user.name "Tobias Pfeiffer"
git config --global user.email pragtob@gmail.com
git config --global init.defaultBranch main
git config --global mergetool.keepBackup false

sudo apt-get install meld
git config --global merge.tool meld

# global gitignore
git config --global core.excludesFile '~/.gitignore'
echo ".vscode/" > ~/.gitignore

sudo apt -y install keepassx

# ssh
ssh-keygen -t ed25519 -C "pragtob@gmail.com"

# Fonts
sudo apt-get -y install fonts-firacode


wget https://github.com/mozilla/Fira/archive/refs/tags/4.202.tar.gz
mkdir fira
tar -xvzf 4.202.tar.gz -C fira
sudo cp -r fira/Fira-4.202/ttf/ /usr/share/fonts/truetype/fira/

# Uncomment for laptop
# sudo apt -y install laptop-mode-tools powertop

echo "donezoeess"

# Finish the install and linking/login:
#
# launch zeal and download relevant docsets
# steam
# dropbox
# signal
# spotify
# log into the vscode sync
# turn off bluetooth by default
# Flathub
# get and setup authy
# get and setup slack
# check the drivers needed
# configure compose key
# RUN asdf_all.sh in new tab
