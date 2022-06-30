HISTSIZE=1048576
HISTFILE="$HOME/.bash_history"
SAVEHIST=$HISTSIZE
shopt -s histappend # append to history file

export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export TMUXP_CONFIGDIR=$HOME/.tmux/tmuxp
export DISABLE_AUTO_TITLE='true'
