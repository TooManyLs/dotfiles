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
alias ls='ls --color=auto'
alias grep='grep --color=auto'
export PATH="$PATH:/opt/nvim-linux64/bin"
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/zen.toml)"
