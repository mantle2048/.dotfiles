#Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'


# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# other alias
alias cht=cht.sh
alias gs='git status'
