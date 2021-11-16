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
export SUDO_EDITOR="vim"

alias mux='pgrep -vx tmux > /dev/null && \
		tmux new -d -s delete-me && \
		tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
		tmux kill-session -t delete-me && \
		tmux attach || tmux attach'
alias lv='nvim'
alias ls='logo-ls'
alias lg='lazygit'
alias ..='cd ..'
alias rm='rm -rfi'
alias lla='exa -la'
alias vi='vim'



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

##### Prompt #####
alias config='/usr/bin/git --git-dir=/home/jibesh/config --work-tree=/home/jibesh'

alias luamake=/home/jibesh/lua-language-server/3rd/luamake/luamake
