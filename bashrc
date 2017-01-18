#!/bin/bash
#[[ $- = *i* ]] && bind TAB:menu-complete
export SHELL="/usr/local/Cellar/bash/4.3.42/bin/bash"
export JUNIT_HOME="$HOME/.java"
export GOPATH="$HOME/.go"
export PATH="$PATH:$JUNIT_HOME:/usr/local/bin:$HOME/.lc3:$GOPATH/bin"
export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit-4.12.jar:$JUNIT_HOME/hamcrest-core-1.3.jar:$JUNIT_HOME/vimdoclet-1.2.jar:."
alias vim="mvim -v -p"
alias vimdiff="mvim -d -v"
alias javat="java org.junit.runner.JUnitCore"
export PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ '
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export MANPAGER="col -bx | mvim -v -c 'set ft=man nolist fdm=indent fdn=1'  -c 'nmap q :q<cr>' -MR -"
alias ls='ls -GFh'
alias ll="ls -l"
alias la="ls -a"
export vim="mvim -v -p"
#alias cpmosh="mosh --server=\"LD_LIBRARY_PATH=//home/smalik01/lib //home/smalik01/bin/mosh-server\" smalik01@unix2.csc.calpoly.edu -- //home/smalik01/local/bin/tmux"
#alias cptmuxssh="ssh smalik01@unix2.csc.calpoly.edu -t \"//home/smalik01/local/bin/tmux a || //home/smalik01/local/bin/tmux new\""
#alias cptmuxssh64="ssh smalik01@unix12.csc.calpoly.edu -t //home/smalik01/local/bin/tmux"
alias cpssh64="cpssh 12 || cpssh 13"
export INPUTRC="$HOME/.inputrc"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python2.7/site-packages//powerline/bindings/bash/powerline.sh
. /Users/saamehmalik/.misc/z.sh
tmux() {
   if (( $# != 0 ))
   then
      command tmux "$@"
   else
      command open -a iTerm ~/.tmux.command
   fi
}
cpsshunix() {
   command ssh "smalik01@unix${1}.csc.calpoly.edu" -t "export SMALIK_COMPUTER=1; bash"
}
cpssh() {
   if (( $# == 0 ))
   then
      cpsshunix 2 || cpsshunix 3 || cpsshunix 4 || cpsshunix 1 || command echo "No servers online! Check your internet connection"
   else
      cpsshunix $1
   fi
}
cpdir() {
   if (( $# != 1 ))
   then
      command cd ~/Documents/Cal\ Poly/CPE\ 103/
   else
      command cd ~/Documents/Cal\ Poly/CPE\ $@
 
   fi
}
cpunmount() {
   cpdir $@
   command ./Unmount_Folder.command &> /dev/null || true
}
cploc() {
   cpunmount $@ 
   command ./Mount_Folder.command && cd Server
}
export BASHRC_SOURCED="YES"
source ~/.bash_profile
