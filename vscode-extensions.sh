#!/usr/bin/env bash

# installs vscode extensions
# code --list-extensions

# vars
extensions=(
    'aaron-bond.better-comments'
    'alefragnani.Bookmarks'
    # 'azapi-vscode.azapi'
    'bierner.markdown-preview-github-styles'
    'DavidAnson.vscode-markdownlint'
    'eamodio.gitlens'
    'foxundermoon.shell-format'
    'github.vscode-github-actions'
    # 'GitLab.gitlab-workflow'
    'Gruntfuggly.todo-tree'
    'hashicorp.terraform'
    'humao.rest-client'
    # 'mark-wiemer.vscode-autohotkey-plus-plus'
    'mechatroner.rainbow-csv'
    'mhutchie.git-graph'
    # 'ms-azuretools.vscode-azurefunctions'
    # 'ms-azuretools.vscode-azureresourcegroups'
    # 'ms-azuretools.vscode-bicep'
    # 'ms-azuretools.vscode-docker'
    # 'ms-dotnettools.vscode-dotnet-runtime'
    # 'ms-kubernetes-tools.vscode-aks-tools'
    # 'ms-kubernetes-tools.vscode-kubernetes-tools'
    # 'ms-python.black-formatter'
    # 'ms-python.python'
    # 'ms-python.vscode-pylance'
    # 'ms-toolsai.jupyter'
    # 'ms-toolsai.jupyter-keymap'
    # 'ms-toolsai.jupyter-renderers'
    # 'ms-toolsai.vscode-jupyter-cell-tags'
    # 'ms-toolsai.vscode-jupyter-slideshow'
    'ms-vscode.azure-account'
    'ms-vscode.powershell'
    'msazurermtools.azurerm-vscode-tools'
    'oderwat.indent-rainbow'
    'PascalReitermann93.vscode-yaml-sort'
    'qcz.text-power-tools'
    'redhat.ansible'
    'redhat.vscode-commons'
    'redhat.vscode-yaml'
    'Remisa.shellman'
    # 'rogalmic.bash-debug'
    'streetsidesoftware.code-spell-checker'
    'szTheory.vscode-packer-powertools'
    # 'tamasfe.even-better-toml'
    'timonwong.shellcheck'
    'Tyriar.shell-launcher'
    'vscode-icons-team.vscode-icons'
    'yzhang.markdown-all-in-one'
    'ziyasal.vscode-open-in-github'
)

# install vscode extensions
for extension in "${extensions[@]}"; do
    echo "Installing ${extension}..."
    code --install-extension "${extension}"
done
