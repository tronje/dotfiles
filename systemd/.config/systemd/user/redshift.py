#!/usr/bin/env python3

import datetime
import subprocess


def redshift(kelvin):
    subprocess.call(['redshift', '-O', str(kelvin) + 'K'])


def reset():
    subprocess.call(['redshift', '-x'])


def main():
    reset()

    hour = datetime.datetime.now().time().hour

    if hour >= 20 and hour < 21:
        redshift(4500)
    elif hour > 21 or hour < 7:
        redshift(3500)


if __name__ == "__main__":
    main()
