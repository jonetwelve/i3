# -- coding: UTF-8 --
# File Name: toggle_compton.py

import os

status_file = os.path.join(os.path.expanduser('~'), '.cache/compton_status')

if os.path.exists(status_file):
    status = "off"
    cmd = "rm -rf " + status_file
    os.system(cmd)
else:
    status = "on"
    cmd = "touch " + status_file
    os.system(cmd)


if status == 'on':
    cmd = "pkill compton "
    os.system(cmd)
    cmd = "compton --config ~/.config/compton.conf >/dev/null 2>&1 &"
    os.system(cmd)
else:
    cmd = "pkill compton >/dev/null 2>&1 &"
    os.system(cmd)

