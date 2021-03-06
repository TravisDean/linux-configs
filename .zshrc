# Path to your oh-my-zsh installation.
  export ZSH=/home/travis/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

  export PATH="/home/travis/.opam/system/bin:/home/travis/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias canhaz='sudo aptitude install'
alias ls='ls --color --group-directories-first'
alias la='ls -A'
alias ll='ls -h -lv --group-directories-first'
alias lll='ls -A -h -lv --group-directories-first'
alias df='df -kTh'
#alias du='du -hk'
#alias h='history'
alias path='echo -e ${PATH//:/\\n}'
#alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
#alias so=source
alias tree='tree -Csuh' # You'll need to get tree for this one
alias ..='cd ..'
alias home='cd ~'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias zash='vim ~/.zshrc'
alias oci='rlwrap ocaml'
alias historysum='history | cut -c 8-100 | cut -d " " -f 1-1 | sort | uniq -c | sort -n'

function ff() { find . -type f -iname '*'"$*"'*' ; }

function cdnolsfunc() { cd "$1" }
alias cdnl=cdnolsfunc

function cdfunct() {    cd "$1";  ls; }
alias cd=cdfunct


setopt AUTO_CD

function locx() { locate -b "\\$1" }
#alias locx=exactlocate

alias pkgfind='pkg-config --list-all | grep'
alias aptfind='apt-cache search'


fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# OPAM configuration
. /home/travis/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export TERM=xterm-256color
