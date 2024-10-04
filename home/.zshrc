# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tmls/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
alias hiddify='dbus-launch hiddify'
alias py='python'
alias ls='ls -l --color=auto'
alias ll='ls -AhG'
alias llg='ls -Ah'
alias grep='grep --color=auto'
export PATH="$PATH:/opt/nvim-linux64/bin"
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/zen.toml)"
eval "$(zoxide init zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
