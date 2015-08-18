#!/usr/bin/env bash
 
echo ">>> Starting Install Script"
 
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo dpkg-reconfigure locales

# Add odoo (originaly openerp) repository
echo "deb http://nightly.openerp.com/8.0/nightly/deb/ ./" | sudo tee -a /etc/apt/sources.list

# update the sources list
sudo apt-get update

# Install odoo
sudo apt-get -y --force-yes install odoo

# Add the postgres user
sudo -u postgres createuser --createdb --no-createrole --no-superuser -w odoo

echo ">>> Complete Install Script"
