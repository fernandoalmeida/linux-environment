# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# [ -z "$PS1" ] && return
if [[ -n "$PS1" ]]; then

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace


# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l='ls -CF'
alias emacss='emacs &'
alias b='bundle'
alias bi='bundle install'
alias bu='bundle update'
alias bo='bundle open'
alias be='bundle exec'
alias beg='bundle exec guard'
alias berdm='bundle exec rake db:migrate'
alias berdmv0='bundle exec rake db:migrate VERSION=0'
alias berdr='bundle exec rake db:rollback'
alias rs='rails server'
alias rg='rails generate'
alias rgm='rails generate migration'
alias rgs='rails generate scaffold'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# show the username and hostname (green)
# the current working directory (blue)
# and the current GIT repository branch (yellow)
# in the prompt 
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=auto
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

export AUTOFEATURE=true

if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi

fi

JAVA_HOME=$HOME/trabalho/programas/linux/java/jdk1.6.0_35
ANDROID_SDK_HOME=$HOME/trabalho/programas/linux/android-sdk/android-sdk-linux
ANDROID_NDK_HOME=$HOME/trabalho/programas/linux/android-sdk/android-ndk-r8b
ANDROID_HOME=$ANDROID_SDK_HOME:$ANDROID_NDK_HOME
ECLIPSE_HOME=$HOME/trabalho/programas/linux/eclipse/eclipse
PATH=$JAVA_HOME/bin:$ANDROID_SDK_HOME/tools:$ANDROID_SDK_HOME/platform-tools:$PATH:$HOME/.rvm/bin:$ECLIPSE_HOME
export JAVA_HOME ANDROID_SDK_HOME ANDROID_NDK_HOME ANDROID_HOME ECLIPSE_HOME PATH

export PERL_LOCAL_LIB_ROOT="/home/fernando/perl5";
export PERL_MB_OPT="--install_base /home/fernando/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/fernando/perl5";
export PERL5LIB="/home/fernando/perl5/lib/perl5/i686-linux-gnu-thread-multi-64int:/home/fernando/perl5/lib/perl5";
export PATH="/home/fernando/perl5/bin:$PATH";

export BUNDLER_EDITOR="nautilus"
