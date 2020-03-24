#!/bin/bash -e

setup-international-keyboard() {
    setxkbmap \
	-rules evdev \
	-model evdev \
	-layout us \
	-variant intl \
	-option ctrl:nocaps
}
