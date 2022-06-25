#!/bin/bash
set -e
DIR=$(cd "$(dirname "$0")" && pwd)
source "$DIR/.lib.sh"

start "kubens & kubectx"

mkdir -p "$HOME/.local/bin"

# install krew
(
    set -x
    cd "$(mktemp -d)" &&
        curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz" &&
        tar zxvf krew-linux_amd64.tar.gz &&
        KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_$(uname -m | sed -e 's/x86_64/amd64/' -e 's/arm.*$/arm/')" &&
        "$KREW" install krew
)

kubectl krew list
kubectl krew install ctx
kubectl krew install ns

curl -s https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens >~/.local/bin/kubens
chmod u+x ~/.local/bin/kubens

curl -s https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx >~/.local/bin/kubectx
chmod u+x ~/.local/bin/kubectx
