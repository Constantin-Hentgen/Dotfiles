# https://getfedora.org/fr/workstation/download/

# Fedora plymouth
sudo dnf install plymouth-theme-charge.x86_64
plymouth-set-default-theme -l # vérification de l’installation du thème
plymouth-set-default-theme charge

# Installation de ZSH

# ZSH theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# auto-suggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install and enable flathub
sudo dnf install -y flatpack
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf install -y flatpak nvim tmux brave-browser git logseq

#  install spotify
flatpak install flathub com.spotify.Client

# VmWare
sudo dnf install @virtualization