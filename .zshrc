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

export PATH=$PATH:/usr/local/go/bin

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH

export PATH=$PATH:$GOPATH/bin

export PATH=$PATH:$GOROOT/bin
