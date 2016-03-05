#!/bin/bash -e

toggle-touchscreen() {
    name='Atmel Atmel maXTouch Digitizer'

    if [[ $(xinput list --long "$name" | grep disabled) ]]; then
	action='enable'
    else
	action='disable'
    fi

    xinput $action "$name"
}
