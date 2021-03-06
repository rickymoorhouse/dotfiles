# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=3000
HISTFILESIZE=6000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Look up OS type so we can branch
OS_TYPE=`uname -s`

case $OS_TYPE in

  Darwin*)
        export HOMEBREW_NO_ANALYTICS=1
        export CLICOLOR=1
        export LSCOLORS=ExgxcxdxCxDaDahbabacec
        # OSX: Enable bash_completion (Install by: brew install bash-completion)
        #       Homebrew's own bash completion script: /usr/local/etc/bash_completion.d
        if [ -f $(brew --prefix)/etc/bash_completion ]; then
            . $(brew --prefix)/etc/bash_completion
        fi
        export PYTHONPATH=$(brew --prefix)/lib/python3.7/site-packages
        PATH=~/Library/Python/3.7/bin:/usr/local/opt/python/libexec/bin:$PATH
    ;;

    Linux*)
        if [ -x /usr/bin/dircolors ]; then
            test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
            alias ls='ls --color=auto'
        fi
        # set variable identifying the chroot you work in (used in the prompt below)
        if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
            debian_chroot=$(cat /etc/debian_chroot)
        fi
        # enable programmable completion features (you don't need to enable
        # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
        # sources /etc/bash.bashrc).
        if ! shopt -oq posix; then
          if [ -f /usr/share/bash-completion/bash_completion ]; then
            . /usr/share/bash-completion/bash_completion
          elif [ -f /etc/bash_completion ]; then
            . /etc/bash_completion
          fi
        fi
        # Add an "alert" alias for long running commands.  Use like so:
        #   sleep 10; alert
        alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
    ;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# Add ~/bin to path if exists
if [ -d ~/bin ]; then
    export PATH=$PATH:~/bin
fi

if [ -f ~/bin/git-completion.bash ]; then
  . ~/bin/git-completion.bash
fi
if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi

ktx() {  
  NEW_CONTEXT=$(grep name ~/.kube/config | grep $1 | head -1 | awk '{print $2}')
  kubectl config use-context $NEW_CONTEXT
  if [[ $? -ne 0 ]];
  then
    ibmcloud cs cluster config -c ri-prod-$1 
  fi
}

export IKS_BETA_VERSION=1

export EDITOR=vim
. ~/.bash_prompt
