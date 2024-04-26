#
# ~/.zshrc
#

### Import common aliases and exports between zsh and bash

common_rc=$HOME/.shellrc
if [ -f $common_rc  ]; then
	. $common_rc
fi

###

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jcat/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

autoload -Uz promptinit
promptinit
prompt suse
