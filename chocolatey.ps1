# List of Chocolatey packages to install
$packages = @(
    "7zip.install",
    # "cascadiacodepl",
    # "docker",
    # "docker-cli",
    # "docker-compose",
    # "rancher-desktop",
    "Firefox",
    "foxitreader",
    "git.install",
    "k9s",
    # "microsoftazurestorageexplorer",
    "mRemoteNG",
    # "notepadplusplus.install",
    # "openssl",
    # "openvpn",
    # "packer",
    # "postman",
    # "PowerShell", # use Windows Store instead
    "powertoys",
    # "putty.install",
    # "rufus",
    # "speccy",
    "sysinternals",
    # "terraform",
    # "treesizefree",
    "velero",
    "vlc.install"
)

# Install each package using Chocolatey
foreach ($package in $packages) {
    choco install $package -y
}

# Pin versions of Chocolatey packages as they auto-update themselves outside of chocolatey
# choco pin add -n=$package
choco pin add -n=powertoys
choco pin add -n=Firefox
