# To set up a new system

    git clone --bare git@github.com:rickymoorhouse/dotfiles.git $HOME/.rjm-cfg
    alias cfg='/usr/bin/git --git-dir=$HOME/.rjm-cfg/ --work-tree=$HOME'
    cd $HOME
    cfg checkout

## Additional pre-reqs

### Brew packages
 - keychain
 - bash-completion

### Python packages
 - powerline-shell

### Other CLI tools
 - ibmcloud `curl -sL https://ibm.biz/idt-installer | bash`
