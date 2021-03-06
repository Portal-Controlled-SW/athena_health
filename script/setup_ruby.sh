#!/usr/bin/env bash

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable

source $HOME/.rvm/scripts/rvm
rvm use --default --install 2.2.3
shift
rvm cleanup all

gem install bundler

cd /vagrant
bundle install
