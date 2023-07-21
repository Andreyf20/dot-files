# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

# Using choco
# List of packages, move to var maybe?
choco install googlechrome firefox python3 7zip vlc git vscode steam obs-studio neovim -y;

# Using winget
winget install Microsoft.PowerToys --source winget;
