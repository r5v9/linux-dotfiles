#!/bin/bash

set -eux

sudo cp psmouse /lib/systemd/system-sleep/psmouse
chmod a+x /lib/systemd/system-sleep/psmouse