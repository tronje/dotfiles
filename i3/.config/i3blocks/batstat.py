#!/usr/bin/env python3

import os
import sys

from subprocess import call, check_output

PATH = "/sys/class/power_supply/BAT"
POWER = "/power_now"
ENERGY = "/energy_now"
CAP = "/capacity"
STAT = "/status"


def get_info():
    battery = int(sys.argv[1])

    acpi = check_output(["acpi"]).decode().splitlines()
    info = acpi[battery]
    info = list(map(lambda s: s.strip(), info.split(',')))

    percentage = int(info[1].replace('%', ''))

    try:
        time = info[2].split()[0]

        time = time[:time.rfind(':')]
        time = time.split(':')

        hours = time[0].strip('0')
        minutes = time[1].strip('0')

        time = f"{hours}h {minutes}m"
    except IndexError:
        time = None

    return battery, percentage, time


def send_notification(info):
    battery, percentage, time = info

    title = f"Battery {battery}"

    if time is not None:
        msg = f"{percentage}% ({time})"
    else:
        msg = f"{percentage}%"

    call(["notify-send", title, msg, "-t", "1500"])


def print_drawing(info):
    percentage = info[1]

    color = get_color(percentage)

    string = get_drawing(percentage, color)

    # if time is not None:
    #     string += f" {time}"

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

    if percentage < 10:
        return red
    elif percentage < 35:
        return orange
    elif percentage <= 50:
        return yellow
    elif percentage > 65:
        return green
    else:
        # fallback - should never be necessary, but better to have it
        return cyan


def get_drawing(percentage, color):
    span = f'<span foreground="{color}">'

    # the ranges are skewed a bit because my batteries never
    # charge beyond 85%.

    if percentage <= 5:
        return "[     ]"
    elif percentage <= 17:
        return f"[{span}#</span>    ]"
    elif percentage <= 34:
        return f"[{span}##</span>   ]"
    elif percentage <= 51:
        return f"[{span}###</span>  ]"
    elif percentage <= 68:
        return f"[{span}####</span> ]"
    else:
        return f"[{span}#####</span>]"


if __name__ == "__main__":
    button_pressed = os.environ['BLOCK_BUTTON']
    info = get_info()

    if button_pressed == '1':
        send_notification(info)

    print_drawing(info)
