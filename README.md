# linux-environment

This repo started out with just my dotfiles, but someday I changed to
include configuration scripts of my development environment (packages,
libs, editor, etc).

I created a Makefile to define configuration targets and dependencies
beteween them.

I also created a Dockerfile to test them always in a clean
environment.

## Usage

### In a local machine

To install/configure all from scratch

	make install

To install/configure specific targets

    make git
    make ruby
	make emacs
	# ...

### In a Docker container

    make build
    make run
