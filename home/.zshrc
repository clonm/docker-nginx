#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Modules
autoload -Uz compinit colors promptinit
colors
compinit
promptinit

# Set prompt
prompt adam2 magenta blue green black red
# source prompt_kir.zsh

# Add commands to history as they are entered, don't wait for shell to exit
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Enable autocompletion
zstyle ':completion:*' completer _complete _correct _approximate

# Customize to your needs...

# ls colors: don't use unreadable blue-on-green
export LS_COLORS=$LS_COLORS:'ow=1;34'
# PS1='[\033[1;36m]\u[\033[1;31m]@[\033[1;32m]\h:[\033[1;35m]\w[\033[1;31m]$[\033[0m]'

