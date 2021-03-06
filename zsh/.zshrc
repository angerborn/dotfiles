[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=30

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh_reload vi-mode fancy-ctrl-z\
    colored-man-pages)

source $ZSH/oh-my-zsh.sh

# ============================================================================
# Angerborn custom stuff
# ============================================================================

# source my custom zsh-theme
[ -f ~/.angerborn.zsh-theme ] && source ~/.angerborn.zsh-theme

export PATH=/usr/local/bin:$PATH

# color support terminal
export TERM=xterm-256color

alias vim='nvim'

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Go
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin

autoload -Uz compinit compinit

# vi mode
bindkey -v
bindkey jj vi-cmd-mode

# activate keychain to avoid ssh-add for each session
eval `keychain --quiet --eval --agents ssh id_rsa`

source ~/.local/bin/virtualenvwrapper.sh

# source zshrc.local for the machine-local stuff if the file exists
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
