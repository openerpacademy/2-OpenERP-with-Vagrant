#!/usr/bin/env bash
 
echo ">>> Starting Install Script"
 
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo dpkg-reconfigure locales

# Add openerp repository
echo "deb http://nightly.openerp.com/7.0/nightly/deb/ ./" | sudo tee -a /etc/apt/sources.list

# update the sources list
sudo apt-get update

# Install openerp
sudo apt-get -y --force-yes install openerp

# Add the postgres user
sudo -u postgres createuser --createdb --no-createrole --no-superuser -w openerp

echo ">>> Complete Install Script"
