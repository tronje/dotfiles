#!/usr/bin/env python3
from subprocess import check_output, call

if not call(['ponymix', 'is-muted']):
    print("0")
else:
    print(str(int(check_output(['ponymix', 'get-volume']))))
