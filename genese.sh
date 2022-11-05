# https://getfedora.org/fr/workstation/download/

# Fedora plymouth
sudo dnf install plymouth-theme-charge.x86_64
plymouth-set-default-theme -l # vérification de l’installation du thème
plymouth-set-default-theme charge

# GRUB theme
sudo sh ~/Downloads/Tela-1080p/install.sh

# Installation de ZSH

# ZSH theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# auto-suggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# terminator
sudo dnf install terminator

# Brave
sudo dnf install brave-browser

# FileZilla
(software)

# anki
# Telegram Desktop
# discord
# git
# gnome tweaks
# gnome extensions
# gparted

# Gnome extensions
# https://extensions.gnome.org/extension/3193/blur-my-shell/
# https://extensions.gnome.org/extension/2983/ip-finder/
# https://extensions.gnome.org/extension/1762/lan-ip-address/
# https://extensions.gnome.org/extension/600/launch-new-instance/
# https://extensions.gnome.org/extension/5237/rounded-window-corners/
# https://extensions.gnome.org/extension/5219/tophat/
# https://extensions.gnome.org/extension/19/user-themes/

# Soft
sudo dnf install code
sudo dnf install @virtualization
obsidian (software)
spotify (software)