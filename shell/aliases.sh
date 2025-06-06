#Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -lahtr'
alias la='ls -A'
alias l='ls'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

#Jupyter notebook

#Anaconda
alias sc='source activate'
alias sd='source deactivate'

# other alias
alias cht=cht.sh
alias gs='git status'
alias nnn='nnn -de'
alias hg='cd ~'

# alias vim2nvim
alias vim='nvim'

# easier to access dotfiles
alias cfg='cd ~/.config/nvim/lua/user'
alias dot='cd ~/.dotfiles'

# Create a directory and cd into it
mcd() {
	mkdir "${1}" && cd "${1}"
}

# Jump to directory containing file
jump() {
	cd "$(dirname ${1})"
}

# Go up [n] directories
up() {
	local cdir="$(pwd)"
	if [[ "${1}" == "" ]]; then
		cdir="$(dirname "${cdir}")"
	elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
		echo "Error: argument must be a number"
	elif ! [[ "${1}" -gt "0" ]]; then
		echo "Error: argument must be positive"
	else
		for ((i = 0; i < ${1}; i++)); do
			local ncdir="$(dirname "${cdir}")"
			if [[ "${cdir}" == "${ncdir}" ]]; then
				break
			else
				cdir="${ncdir}"
			fi
		done
	fi
	cd "${cdir}"
}

# Execute a command in a specific directory
xin() {
	(
		cd "${1}" && shift && "${@}"
	)
}
