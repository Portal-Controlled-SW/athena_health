#!/usr/bin/env bash

apt-get -y update
echo "Installing dependencies"
apt-get -y install curl git-core zlib1g-dev build-essential \
  libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
  libxml2-dev libxslt1-dev libcurl4-openssl-dev libgmp-dev \
  python-software-properties libffi-dev libgdbm-dev libncurses5-dev \
  automake libtool bison nodejs imagemagick unzip redis-server
apt-get -y autoremove

echo "Installing postgresql 9.4"
bash -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
apt-get update
apt-get install -y postgresql-9.4 libpq-dev
su postgres - -c 'createuser portal -s -w'
su postgres - -c 'createuser vagrant -s -w'
su postgres - -c 'createuser ubuntu -s -w' # for CircleCI

cp /vagrant/script/pg_hba.conf /etc/postgresql/9.4/main/pg_hba.conf
/etc/init.d/postgresql restart

wget https://dl.ngrok.com/ngrok_2.0.19_linux_amd64.zip
unzip ngrok_2.0.19_linux_amd64.zip

sudo ln -s /vagrant/script/sync_date.sh /etc/cron.hourly/sync_date.sh
