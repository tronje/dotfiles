from subprocess import check_output, call
import time
import sys

"""

ABOUT:
This is a relatively simple python script intended to be piped into
bar-aint-recursive in order to display helpful information.
You probably want to read through this script and understand it,
in order to fix any errors that have to do with the fact that
you're running this on your system, as I wrote this without
portability in mind. You'll also probably want to change some
colors and some formatting or whatever. The unicode characters
throughout this script are intended to be use with the stlarch font.

USAGE:
Run the following from your bspwmrc:
    python /path/to/bar.py | bar -p -f "$FONTS" &
where $FONTS are at least two fonts, stlarch and your preferred
font to display text. Alternatively, remove/replace all unicode
characters used in the script and use whatever font you like,
or don't specify a font to use the default.

"""

# Update-interval in seconds
## float or integer
interval = 0.25

# Some colors
## the first two values are alpha values, which is
## why these color codes are 8 digits long instead of 6
color_white = '#FFFFFFFF'
color_red = '#FFFF0000'
color_green = '#FF00FF00'
color_yellow = '#FFFFFF00'
color_teal = '#FF00F0F0'
color_orange = '#FFFFA500'
color_background = '#E62A2A2A'

# the delimiter between elements of the bar
dlm = '%{F-} :: '
#dlm = ' :: '

# Battery
def getBattery():
    """ Returns a conveniently formatted string with battery information """

    # fetch battery's status
    with open('/sys/class/power_supply/BAT0/capacity', 'r') as f:
        bat_now = int(f.read())
    with open('/sys/class/power_supply/AC/online', 'r') as f:
        bat_charging = int(f.read())

    # set color and icon depending on energy level
    if bat_now < 10:
        bat_color = color_red
        bat_icon = '\ue034'
    elif bat_now < 30:
        bat_color = color_orange
        bat_icon = '\ue035'
    elif bat_now < 65:
        bat_color = color_yellow
        bat_icon = '\ue036'
    else:
        bat_color = color_teal
        bat_icon = '\ue037'

    # Check if the battery is charging and if so,
    # use a different icon. Not working right now, don't know why
    if bat_charging:
        bat_icon = '\ue042'

    # return a nicely formatted string
    return "%{F" + bat_color + "}" + bat_icon + " " + str(bat_now) + "%%"

# Time and date
def getTime():
    """ Returns the time as a pretty string """
    return "\ue018 " + time.strftime("%H:%M")

def getDate():
    """ Returns the date as a pretty string """
    return time.strftime("%a, %d.%m.%Y")

# Temperature
def getTemperature():
    with open('/sys/class/thermal/thermal_zone0/temp', 'r') as f:
        temp = f.read()
    return "\ue01d " + "%{F" + color_yellow + "}" + temp[:2]

# Fetching bspc information
def getWMInfo():
    """ Returns information about bspwm's state """
    ret = "%{F" + color_orange + "}"
    curr_desktop =\
            int(check_output(['bspc','query','--desktops','--desktop']))
    for i in range(1,7):
        if i == curr_desktop:
            ret += "<" + str(i) + ">"
        else:
            ret += " " + str(i) + " "
    return ret

# Sound levels
# TODO
def getSound():
    volume = int(check_output(['ponymix','get-volume']))
    if call(['ponymix','is-muted']):
        return "\ue050 " + str(volume)
    else:
        return "\ue04F " + str(volume)


# Loop that prints everything
while(True):
    print("%{l}"\
            + "%{F" + color_teal + "}" + ' \ue00e' + " " + getWMInfo() \
            + "%{c}"\
            + "%{F" + color_white + "}" + getTime() \
            + "%{r}"\
            + getSound() + dlm + getTemperature() + dlm + getBattery() + dlm + getDate() + " ")

    sys.stdout.flush()
    time.sleep(interval)
