#
# ~/.bashrc
#

### Import common aliases and exports between zsh and bash

common_rc=$HOME/.shellrc

if [ -f $common_rc  ]; then
	. $common_rc
fi

###

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
