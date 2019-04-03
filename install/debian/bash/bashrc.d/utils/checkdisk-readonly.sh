#!/bin/bash -e

checkdisk_readonly() {
    touch afile && { rm afile; echo "read-write"; } || echo "read-only"
}
