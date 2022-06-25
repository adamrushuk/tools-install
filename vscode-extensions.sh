#!/usr/bin/env bash

# installs vscode extensions
# code --list-extensions

# vars
extensions=(
    'aaron-bond.better-comments'
    'alefragnani.Bookmarks'
    'AzurePolicy.azurepolicyextension'
    'bencoleman.armview'
    'bierner.markdown-preview-github-styles'
    'bungcip.better-toml'
    'DavidAnson.vscode-markdownlint'
    'eamodio.gitlens'
    'esbenp.prettier-vscode'
    'foxundermoon.shell-format'
    'hashicorp.terraform'
    'humao.rest-client'
    'janisdd.vscode-edit-csv'
    'ms-azuretools.vscode-azurefunctions'
    'ms-azuretools.vscode-azureresourcegroups'
    'ms-azuretools.vscode-bicep'
    'ms-azuretools.vscode-docker'
    'ms-dotnettools.vscode-dotnet-runtime'
    'ms-kubernetes-tools.vscode-kubernetes-tools'
    'ms-vscode.azure-account'
    'ms-vscode.azurecli'
    'ms-vscode.powershell'
    'ms-vsliveshare.vsliveshare'
    'ms-vsliveshare.vsliveshare-audio'
    'ms-vsliveshare.vsliveshare-pack'
    'msazurermtools.azurerm-vscode-tools'
    'oderwat.indent-rainbow'
    'pspester.pester-test'
    'qcz.text-power-tools'
    'redhat.vscode-commons'
    'redhat.vscode-yaml'
    'Remisa.shellman'
    'richie5um2.vscode-sort-json'
    'rogalmic.bash-debug'
    'rosshamish.kuskus-kusto-syntax-highlighting'
    'streetsidesoftware.code-spell-checker'
    'timonwong.shellcheck'
    'Tyriar.shell-launcher'
    'vscode-icons-team.vscode-icons'
    'wengerk.highlight-bad-chars'
    'yzhang.markdown-all-in-one'
    'ziyasal.vscode-open-in-github'
)

# install vscode extensions
for extension in "${extensions[@]}"; do
    echo "Installing ${extension}..."
    code --install-extension "${extension}"
done
