
export PATH="$HOME/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git zsh-autosuggestions fasd colored-man-pages colorize k)

# May require rm -f ~/.zcompdump; compinit
#fpath=($HOME/homebrew/share/zsh/site-functions/ $fpath)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
  alias vim="nvim"
  alias vi="nvim"
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[030]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH=""
ZSH_THEME_GIT_PROMPT_STAGED="•"
ZSH_THEME_GIT_PROMPT_CONFLICTS="x"
ZSH_THEME_GIT_PROMPT_CHANGED="+"
ZSH_THEME_GIT_PROMPT_BEHIND=" ↓"
ZSH_THEME_GIT_PROMPT_AHEAD=" ↑"
ZSH_THEME_GIT_PROMPT_UNTRACKED=".."
ZSH_THEME_GIT_PROMPT_DIRTY=" ±"
ZSH_THEME_GIT_PROMPT_CLEAN="✓"

export TERM=xterm-256color
function colors {
  for i in {0..255} ; do 
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then printf "\n"; fi
  done
}

function py { python37 -c "import sys, os, re, time; print(eval('''$1'''))" }

export VIRTUAL_ENV_DISABLE_PROMPT='1'
source $HOME/.virtualenvs/python3/bin/activate
function virtualenv_info { [ $VIRTUAL_ENV ] && echo "%{$FG[242]%}"$(basename $VIRTUAL_ENV)"%{$reset_color%}" } 
function venv { source $HOME/.virtualenvs/$1/bin/activate }
function upgrade-python {
  pip install -U $(pip list -o | tail -n +3 | cut -d' ' -f 1)
}

function sep {
  printf "%0.s─" {1..$(tput cols)}
}

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

PROMPT='%{$fg[blue]%}${(%):-%~}%{$reset_color%} '
RPROMPT='$(virtualenv_info)$(git_prompt_info)'

export GOPATH="$HOME/projects/go"
export PATH="$PATH:$GOPATH/bin"

[ -f "$HOME/.cargo/env" ] && source $HOME/.cargo/env

export PATH="$HOME/google-cloud-sdk/bin:$PATH"

[ -s "/home/user/.scm_breeze/scm_breeze.sh" ] && source "/home/user/.scm_breeze/scm_breeze.sh"
