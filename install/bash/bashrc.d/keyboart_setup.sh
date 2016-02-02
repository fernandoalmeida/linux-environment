#!/bin/bash -e

keyboard_setup() {
    setxkbmap \
	-rules evdev \
	-model evdev \
	-layout us \
	-variant altgr-intl \
	-option ctrl:nocaps
}

keyboard_setup
