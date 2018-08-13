#!/bin/bash

set -eux

sudo rm -rf /etc/openvpn/ovpn* /tmp/ovpn.zip

sudo apt-get install openvpn
wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip -O /tmp/ovpn.zip
(
    cd /etc/openvpn
    sudo unzip /tmp/ovpn.zip
)

set +x
for d in ovpn_udp ovpn_tcp; do
    for i in $(ls /etc/openvpn/$d/); do
        sudo sed -i 's|^auth-user-pass$|auth-user-pass /etc/openvpn/auth.txt|g' /etc/openvpn/$d/$i
    done
done

sudo cp nordvpn /usr/local/bin

echo "*************************************"
echo "create /etc/openvpn/auth.txt manually"
echo "*************************************"