eval "$(starship init zsh)"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jibesh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -Uz promptinit
promptinit

setopt COMPLETE_ALIASES
zstyle ':completion:*' menu select

export HISTCONTROL=ignoreboth
export EDITOR=nvim
export READER=zathura
export TERMINAL=kitty
export BROWSER="firefox"
export VIDEO="mpv"
export IMAGE="sxiv"
export WM="bspwm"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"

alias ls='ls --color=auto'
alias ls='lsd'
alias v='nvim'
alias sudo v='nvim'
alias n='ncmpcpp'
alias lg='lazygit'
alias fetch='rxfetch'
alias ..='cd ..'
alias rm='rm -rfi'
alias vi='vim'
alias mkdir='mkdir -p'
alias configg='/usr/bin/git --git-dir=/home/jibesh/dotfiles --work-tree=/home/jibesh'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##### Prompt #####
alias config='/usr/bin/git --git-dir=/home/jibesh/config --work-tree=/home/jibesh'
