source $HOME/.bash_aliases

function ktx() {  
  export KUBECONFIG=`echo ~/.bluemix/plugins/container-service/clusters/ri-prod-$1*/kube-config*yml`; 
}

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/rickymoorhouse/bin/kustomize kustomize
