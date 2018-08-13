#!/bin/bash

set -eux

sudo cp psmouse /lib/systemd/system-sleep/psmouse
sudo chmod a+x /lib/systemd/system-sleep/psmouse