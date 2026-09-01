#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '

[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

. "$HOME/.cargo/env"

# use eza instead of ls
alias ls="eza -l --color --icons --git --group-directories-first"
alias la="eza -la --color --icons --git --group-directories-first"
alias grep="grep --color=auto"
