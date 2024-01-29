#!/bin/bash
# TO DO AT THE END

# make zsh default
chsh -s $(which zsh)

# ZSH theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# leaving sh to refresh zsh
sh

# launch zsh to get the configurator of p10k
zsh
p10k configure

# auto-suggestion
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh