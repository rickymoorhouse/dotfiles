
# Add colour to grep and exclude .git directories
alias grep='grep --color=auto --exclude-dir=\.git'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias k='kubectl'
alias ic='ibmcloud'
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# dotfile repo
alias cfg='/usr/bin/git --git-dir=$HOME/.rjm-cfg/ --work-tree=$HOME'

alias kubens='kubectl config set-context $(kubectl config current-context) --namespace '
alias kupd="kubectl config current-context | awk -F/ '{print $1}' | xargs ic cs cluster config --cluster"
alias grawlix="kubectl config current-context | awk -F/ '{print $1}' | xargs python3 $HOME/git/grawlix/run_stack_check.py --cluster"
# APIC in k8s
alias apiclogs-mgm='kubectl -n apic-management logs --follow'
alias kdetach="ps -ef | grep \"kubectl attach\" | grep -v grep | awk '{print \$2}' | xargs kill"

alias kgw0="kubectl attach -it r6d0b871026-dynamic-gateway-service-0 -n apic-gateway"
alias kgw1="kubectl attach -it r6d0b871026-dynamic-gateway-service-1 -n apic-gateway"
alias kgw2="kubectl attach -it r6d0b871026-dynamic-gateway-service-2 -n apic-gateway"
alias prometheus="kubectl get pods -n ibm-services-system | grep prometheus-server | awk '{print \$1}' | xargs -I {} kubectl -n ibm-services-system port-forward {} 9090:9090"
