#!/bin/bash

sudo apt-get update
sudo apt-get -y install salt-minion vagrant virtualbox
sudo echo -e "master: 104.248.45.82\nid: MinionH" | sudo tee /etc/salt/minion
sudo systemctl restart salt-minion

