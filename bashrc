# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source common items that I want for both login and non-login shells
if [ -f ~/dotfiles/bash_common ]; then
  source ~/dotfiles/bash_common
fi

