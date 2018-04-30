#!/usr/bin/env python3

import sys

from subprocess import check_output

PATH = "/sys/class/power_supply/BAT"
POWER = "/power_now"
ENERGY = "/energy_now"
CAP = "/capacity"
STAT = "/status"

GREEN = "#89e066"
YELLOW = "#eddf72"
ORANGE = "#cb4b16"
RED = "#ef5455"
CYAN = "#85d6d7"


def main():
    battery = int(sys.argv[1])

    acpi = check_output(["acpi"]).decode().splitlines()
    info = acpi[battery]
    info = list(map(lambda s: s.strip(), info.split(',')))

    percentage = int(info[1].replace('%', ''))

    # try:
    #     time = info[2].split()[0]
    #
    #     if time[0] == '0':
    #         time = time[1:]
    #
    #     time = time[:time.rfind(':')]
    # except IndexError:
    #     time = None

    color = get_color(percentage)

    string = get_drawing(percentage, color)

    # if time is not None:
    #     string += f" {time}"

    print(string)
    print(string)


def get_color(percentage):
    # the ranges are skewed a bit because my batteries never
    # charge beyond 85%.

    if percentage < 10:
        return RED
    elif percentage < 35:
        return ORANGE
    elif percentage <= 50:
        return YELLOW
    elif percentage > 65:
        return GREEN
    else:
        # fallback - should never be necessary, but better to have it
        return CYAN


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
    main()
