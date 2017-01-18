#export SHELL="/usr/local/Cellar/bash/4.4/bin/bash"
#[[ $- = *i* ]] && bind TAB:menu-complet#e
#export JUNIT_HOME="$HOME/.java"
#export PATH="/usr/bin:$PATH:$JUNIT_HOME:/usr/local/bin"
#export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit-4.12.jar:$JUNIT_HOME/hamcrest-core-1.3.jar"
#alias vim="mvim -v -p"
#alias vimdiff="mvim -d -v"
#alias javat="java org.junit.runner.JUnitCore"
##export PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ '
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad
#export MANPAGER="col -bx | mvim -v -c 'set ft=man nolist fdm=indent fdn=1'  -c 'nmap q :q<cr>' -MR -"
#alias ls='ls -GFh'
#alias ll="ls -l"
#alias la="ls -a"
#alias cpdir="cd ~/Documents/Cal\ Poly/CPE\ 102/"
#alias cpmosh="mosh --server=\"LD_LIBRARY_PATH=//home/smalik01/lib //home/smalik01/bin/mosh-server\" smalik01@unix2.csc.calpoly.edu -- //home/smalik01/local/bin/tmux"
#alias cptmuxssh="ssh smalik01@unix2.csc.calpoly.edu -t //home/smalik01/local/bin/tmux a"
#alias cpssh="ssh smalik01@unix2.csc.calpoly.edu"
#alias cptmuxssh64="ssh smalik01@unix12.csc.calpoly.edu -t //home/smalik01/local/bin/tmux a"
#alias cpssh64="ssh smalik01@unix12.csc.calpoly.edu"
#export INPUTRC="$HOME/.inputrc"
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/local/lib/python2.7/site-packages//powerline/bindings/bash/powerline.sh


#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
if [ -z $BASHRC_SOURCED ] ; then
   source ~/.bashrc
fi
