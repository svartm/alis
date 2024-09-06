export EDITOR=vim

# export MANPAGER='nvim +Man!'

# History
export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.history
# export INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt NO_HIST_BEEP
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE

alias la='ls -A'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
# alias ..='cd ..'
setopt autocd
alias mv='mv -i'
alias rm='rm -i'
alias ping="ping -c 3"

# avoids bugs when using ssh in kitty
# [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Starship prompt. Keep this at the bottom of the file.
# eval "$(starship init zsh)"

