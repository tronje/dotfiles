#!/bin/python
# Adapted from https://github.com/jarvick257/rice/blob/master/scripts/focus.py

import i3


# screen width divided by golden ratio
WIDTH = 1582

HEIGHT = 1300


def create_tmp(current_id):
    """Create a temporary window"""

    i3.focus(con_id=current_id, title="tmp_window")
    i3.split('vertical')

    # we don't want the tmp window to have a border
    opts = ["border none"]

    i3.open(*opts)


def find_tmp():
    """Find the temporary window"""

    tmps = i3.filter(nodes=[], window=None, name=None)

    if len(tmps) != 1:
        return None
    else:
        return tmps[0]['id']


def destroy_tmp(tmp_id):
    """Kill the window with the given id.

    We only use it to kill the tmp window.
    """

    i3.kill(con_id=tmp_id)


def make_focused(current_id):
    """Make the focused window floating, set its dimensions
    and position.
    """

    i3.focus(con_id=current_id)
    i3.floating('enable')
    i3.resize(f'set {WIDTH} {HEIGHT}')
    i3.move('position center')


def make_unfocused(current_id):
    """Reset the window's property to non-floating.

    This automatically resets size and position as well.
    """

    i3.focus(con_id=current_id)
    i3.floating('disable')


def main():
    """Grab the current window, and, if it's not floating,
    replace it with an empty window and make it floating,
    thus giving it focus among the other windows.
    """

    current = i3.filter(nodes=[], focused=True)[0]
    current_id = current['id']

    if "on" in current['floating']:
        tmp_id = find_tmp()

        if tmp_id is not None:
            i3.focus(con_id=tmp_id)
            make_unfocused(current_id)
            destroy_tmp(tmp_id)
        else:
            make_unfocused(current_id)
    else:
        # only focus a window if no other is already focused
        if find_tmp() is None:
            create_tmp(current_id)
            make_focused(current_id)


if __name__ == "__main__":
    main()
