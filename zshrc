# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/saamehmalik/.oh-my-zsh
export EVENT_NOKQUEUE=1


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='awesome-fontconfig'
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(git zsh-autosuggestions tumult vi-mode osx battery bd)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#!/bin/bash
#[[ $- = *i* ]] && bind TAB:menu-complete
export SHELL="/bin/zsh"
export JUNIT_HOME="$HOME/.java"
export GOPATH="$HOME/.go"
export PATH="$PATH:$JUNIT_HOME:/usr/local/bin:$HOME/.lc3:$GOPATH/bin:$HOME/.iterm2:."
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
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python2.7/site-packages//powerline/bindings/zsh/powerline.zsh
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
      cd ~/Documents/Cal\ Poly/CPE\ 357/
   else
      cd ~/Documents/Cal\ Poly/CPE\ $@
 
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
show() {
   command defaults write com.apple.finder AppleShowAllFiles TRUE
   command killall Finder
}
hide() {
   command defaults write com.apple.finder AppleShowAllFiles FALSE
   command killall Finder
}
export BASHRC_SOURCED="YES"
#source ~/.bash_profile
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zsh-bd
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode root_indicator context dir rbenv vcs background_jobs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery load time)
function zle-line-init {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-keymap-select {
  powerlevel9k_prepare_prompts
  zle reset-prompt
  zle -R
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# Set the colours you can use
black='\033[0;30m'
white='\033[0;37m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

# Resets the style
reset=`tput sgr0`

# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}
. $HOME/.zsh/plugins/bd/bd.zsh
