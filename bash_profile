# ~/.bash_profile: executed by bash(1) for login shells.

# Source common items that I want for both login and non-login shells
if [ -f ~/dotfiles/bash_common ]; then
  source ~/dotfiles/bash_common
fi

# Set up keychain
eval `keychain --eval --agents ssh --inherit any id_ed25519`
# iTerm integration
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
