# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

alias mpc="mpc -f '[[%artist% - ]%title%][ (on %album%)]|[%file%]'"
shopt -s globstar                                                  
alias memusage="ps -o comm,rss,vsz | grep $1"
alias :q=exit                                                      
alias fucking=sudo
set completion-prefix-display-length 2
function spider4chan() { wget -P pics -H -nd -r -Dimages.4chan.org -A '.jpg,.jpeg,.png,.gif,.html,.mhtml' -erobots=off "$1"; }
function mirror4chan() { wget -r -l 1 -A jpg,png,gif,css,html,js -np -k -p -e robots=off -E -H -D boards.4chan.org,static.4chan.org,thumbs.4chan.org,images.4chan.org,static.4chan-ads.org,ajax.cloudflare.com,edge.quantcast.com,google.com,google-analytics.com,quantserve.com -nc "$1"; }

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

#if [ "$color_prompt" = yes ]; then
#    PS1='\[$(tput bold)\]\[$(tput setaf 1)\][VPS] \[$(tput sgr0)\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/home/rylai/perl5";
export PERL_MB_OPT="--install_base /home/rylai/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/rylai/perl5";
export PERL5LIB="/home/rylai/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/rylai/perl5/bin:$PATH";

# added by travis gem
[ -f /home/rylai/.travis/travis.sh ] && source /home/rylai/.travis/travis.sh

# I love you Rylee <3
alias fuck="python /home/rylee/code/fuck_you.py"
source ~/.bin/tmuxinator.bash
