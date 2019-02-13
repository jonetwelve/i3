#!/usr/bin/env python

import os
import psutil


battery = psutil.sensors_battery()
if battery.percent < 20:
    comm = "i3-nagbar -m 'Battery is lower'"
    os.system(comm)
