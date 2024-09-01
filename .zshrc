export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="headline"

# CASE_SENSITIVE="true"



plugins=(
	git
	golang
	node
	python
	
)

source $ZSH/oh-my-zsh.sh

export GOROOT=/usr/local/go
export GOPATH=$HOME/.local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOBIN

# Term configs
source "$HOME/.config/term_configs/wayland_configs.sh"

export PATH=$PATH:/home/ezequiel/.config/term_configs
