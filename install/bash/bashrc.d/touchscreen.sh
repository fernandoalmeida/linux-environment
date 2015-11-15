#!/bin/bash -ex

touchscreen() {
    action=${1:-disable}
    xinput \
	| grep 'maXTouch Digitizer' \
	| awk '{print $7}' \
	| tr -d 'id=' \
	| xargs xinput --$action
}
