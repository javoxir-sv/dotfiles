if status is-interactive


	# some aliases
	direnv hook fish | source
	alias ls="eza -l --color --icons --git --group-directories-first"
	alias la="eza -la --color --icons --git --group-directories-first"
	alias grep="grep --color=auto"

end


