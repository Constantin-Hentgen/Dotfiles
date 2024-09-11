source ~/powerlevel10k/powerlevel10k.zsh-theme
source /home/constantin/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export LANG="en_US.utf8"
export PATH="$HOME/.poetry/bin:$PATH"

alias history="history 1"
alias t='sh -c "vi \$(fzf)"'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
