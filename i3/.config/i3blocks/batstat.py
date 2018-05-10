#!/usr/bin/env python3

import os
import sys

from subprocess import call, check_output


def get_info():
    battery = int(sys.argv[1])

    acpi = check_output(["acpi"]).decode().splitlines()
    info = acpi[battery]
    info = list(map(lambda s: s.strip(), info.split(',')))

    charging = True if "Charging" in info[0] else False

    percentage = int(info[1].replace('%', ''))

    try:
        time = info[2].split()[0]

        time = time[:time.rfind(':')]
        time = time.split(':')

        hours = time[0]
        minutes = time[1]

        time = f"{hours}h {minutes}m"
    except IndexError:
        time = None

    return charging, battery, percentage, time


def send_notification(info):
    _, battery, percentage, time = info

    title = f"Battery {battery}"

    if time is not None:
        msg = f"{percentage}% ({time})"
    else:
        msg = f"{percentage}%"

    call(["notify-send", title, msg, "-t", "1500"])


def print_drawing(info):
    charging = info[0]
    percentage = info[2]

    color = get_color(percentage)

    string = get_drawing(charging, percentage, color)

    # gotta print it twice because of i3blocks /shrug
    print(string)
    print(string)


def get_color(percentage):
    green = "#89e066"
    yellow = "#eddf72"
    orange = "#ff9966"
    red = "#ef5455"
    cyan = "#85d6d7"

    # the ranges are skewed a bit because my batteries never
    # charge beyond 85%.

    if percentage < 21:
        return red
    elif percentage < 42:
        return orange
    elif percentage < 63:
        return yellow
    elif percentage >= 63:
        return green
    else:
        # fallback - should never be necessary, but better to have it
        return cyan


def get_drawing(charging, percentage, color):
    span = f'<span foreground="{color}">'

    # the ranges are skewed a bit because my batteries never
    # charge beyond 85%.

    if percentage <= 5:
        ret = "[     ]"
    elif percentage <= 17:
        ret = "[{}#</span>    ]"
    elif percentage <= 34:
        ret = "[{}##</span>   ]"
    elif percentage <= 51:
        ret = "[{}###</span>  ]"
    elif percentage <= 68:
        ret = "[{}####</span> ]"
    else:
        ret = "[{}#####</span>]"

    if charging:
        ret = ret.replace(' ', '+')

    return ret.format(span)


if __name__ == "__main__":
    button_pressed = os.environ['BLOCK_BUTTON']
    info = get_info()

    if button_pressed == '1':
        send_notification(info)

    print_drawing(info)
