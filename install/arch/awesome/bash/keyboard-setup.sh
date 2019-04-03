#!/bin/bash -e

keyboard-setup() {
    setxkbmap \
	-rules evdev \
	-model abnt2 \
	-layout br \
	-variant abnt2 \
	-option ctrl:nocaps
}

keyboard-setup
