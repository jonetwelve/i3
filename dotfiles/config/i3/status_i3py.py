from i3pystatus import Status

status = Status()

status.register("alsa",
        format="♪: {volume}",
        color_muted="#ff0000")

status.register("battery",
    format="{status} {percentage:.0f}%",
    alert=True,
    full_color="#ffffff",
    alert_percentage=15,
    status={
        "DIS": "↯",
        "CHR": "ϟ",
        "FULL": "♨",
    },)

status.register("clock",
        format="%Y-%m-%d %w %H:%M:%S",)

status.register("cpu_usage_bar",
        format="CPU: {usage_bar}",
        start_color="#ffffff")

status.register("mem_bar",
        format="MEM: {used_mem_bar}",
        color="#ffffff")

status.register("network",
        format_up="{essid} {bytes_recv}KB/s {bytes_sent}KB/s",
        color_up="#FFFFFF",
        dynamic_color=True,
        start_color="#FFFFFF",
        separate_color=True,
        format_down="{interface} DOWN",
        interface="wlp2s0")

'''
status.register("window_title",
        format="{title}")
'''

status.run()
