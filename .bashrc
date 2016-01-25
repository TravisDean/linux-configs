alias canhaz='sudo aptitude install'
alias ls='ls --color --group-directories-first'
alias la='ls -A'
alias ll='ls -h -lv --group-directories-first'
alias lll='ls -A -h -lv --group-directories-first'
alias df='df -kTh'
alias du='du -hk'
alias h='history'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias so=source
alias tree='tree -Csuh' # You'll need to get tree for this one
alias ..='cd ..'
alias home='cd ~'
alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias oci='rlwrap ocaml'

# Bookmarks are cool, but normally I forget to use them
#source ~/.local/bin/bashmarks.sh 

#~/configs/cowscript.sh | lolcat -F 0.004
# fortune | cowsay -f dragon-and-cow;echo  # Also requires fortune and cowsay

function ff() { find . -type f -iname '*'"$*"'*' ; }
function cdfunct() {    cd "$1";  ls; }
alias cd=cdfunct


# added by Anaconda3 2.1.0 installer
#export PATH="/home/travis/anaconda3/bin:$PATH"

#export PATH=$PATH:~/apps/MatlabInstall/bin


