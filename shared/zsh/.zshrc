# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# direnv for direnv of course (esp-idf) 
eval "$(direnv hook zsh)"


# use eza instead of ls

alias ls="eza -l --color --icons --git --group-directories-first"
alias la="eza -la --color --icons --git --group-directories-first"
alias grep="grep --color=auto"
