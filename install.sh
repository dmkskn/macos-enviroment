#!/usr/bin/env bash

set -e

[ -z $(xcode-select --print-path) ] && xcode-select --install
[ -z $(which brew) ] && curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash
[ -n $(brew tap | grep "homebrew/cask") ] && brew tap homebrew/cask

while read p; do
  [ -z $(which $p) ] && brew install $p
done <packages/homebrew.txt

while read p; do
  [ -z $(which $p) ] && brew cask install $p
done <packages/homebrew-cask.txt

while read p; do
  mas install $p
done <packages/mas.txt
