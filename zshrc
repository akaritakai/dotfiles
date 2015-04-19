# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gentoo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	gitfast rails ruby git-extras catimg rvm
	sprunge dirhistory docker encode64
	gem pip python tmux tmuxinator 
)
#bash_source() {
#	alias shopt=':'
#	alias _expand=_bash_expand
#	alias _complete=_bash_comp
#	emulate -L sh
#	setopt kshglob noshglob braceexpand
#
#	source "$@"
#}
#
#for file in /etc/bash_completion.d/*; do
#	bash_source $file;
#done

source $ZSH/oh-my-zsh.sh

# User configuration

PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"

if [[ -e "$HOME/bin" ]] ; then
	PATH="$HOME/bin:$PATH";
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/code/coverity/bin" ] ; then
	PATH="$PATH:$HOME/code/coverity/bin"
fi

for file in ~/.zsh/*; do source $file; done

EDITOR=vim
VISUAL=$EDITOR
SELECTED_EDITOR=$EDITOR
export EDITOR VISUAL SELECTED_EDITOR
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:/usr/lib/go/bin:$GOPATH/bin

export LANG=en_US.UTF-8

# Time on the right side of the prompt
RPROMPT=[%D{%H:%M:%S}]

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
alias gpom="git push origin master"
ddg() { lynx ddg.gg; }
eval `keychain --eval --quiet --quick ~/.ssh/id_rsa ~/.ssh/id_rsa.old`
rand_name_for_mp3() { local name=$1; name=${name%.mp3}-$(openssl rand -hex 6).mp3; echo $name }

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
alias new_shell='exec $SHELL'

ddg() { lynx ddg.gg; } 

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
