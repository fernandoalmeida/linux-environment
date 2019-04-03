#!/bin/bash -e

keyboard-setup() {
    setxkbmap \
	-rules evdev \
	-model evdev \
	-layout us \
	-variant intl \
	-option ctrl:nocaps
}

keyboard-setup
