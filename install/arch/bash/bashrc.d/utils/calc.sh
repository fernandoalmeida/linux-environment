#!/bin/bash -e

# Execute math calculations in bash prompt
#
# Example
#
#   $ calc "(5 + 2) / 2"
#   => 3.50
calc() {
    echo $(($@))
}
