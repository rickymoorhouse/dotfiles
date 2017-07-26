# ~/.bash_profile: executed by bash(1) for login shells.

# Source common non-bash specific items
if [ -f ~/dotfiles/profile ]; then
  source ~/dotfiles/profile
fi
# Source common items that I want for both login and non-login shells
if [ -f ~/dotfiles/bashrc ]; then
  source ~/dotfiles/bashrc
fi

# Set up keychain
eval `~/dotfiles/keychain --eval --agents ssh --inherit any id_ed25519 id_rsa_2011-07-26`
# iTerm integration
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
if [ -x /usr/bin/byobu ]; then
   _byobu_sourced=1 . /usr/bin/byobu-launch
fi
