# pylint: disable=C0111,R0903

"""Test module
"""

import bumblebee.engine

#class Module(bumblebee.engine.Module):
#    def __init__(self, engine, config):
#        super(Module, self).__init__(engine, config, bumblebee.output.Widget(full_text="test"))

# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
import datetime

class Module(bumblebee.engine.Module):
    def __init__(self, engine, config):
        super(Module, self).__init__(engine, config, bumblebee.output.Widget(full_text=self.content))

    def content(self, widget):
        _t = datetime.datetime.now() + datetime.timedelta(hours=1)
        content = _t.strftime('%Y-%m-%d %H:%M:%S') 
        return str('韩国时间 ' + content)


