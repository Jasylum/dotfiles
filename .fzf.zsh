# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jibesh/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jibesh/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jibesh/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jibesh/.fzf/shell/key-bindings.zsh"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--border 
--color=dark
--color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#282c34,hl+:#d858fe
--color=info:#98c379,prompt:#61afef,pointer:#ffffff,marker:#e5c07b,spinner:#61afef,header:#61afef
'
