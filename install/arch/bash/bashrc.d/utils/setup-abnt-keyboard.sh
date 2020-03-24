#!/bin/bash -e

setup-abnt-keyboard() {
    setxkbmap \
	-rules evdev \
	-model abnt2 \
	-layout br \
	-variant abnt2 \
	-option ctrl:nocaps
}
