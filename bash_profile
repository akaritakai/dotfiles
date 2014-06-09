[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.gem/ruby/2.2.0/bin" ] ; then
        PATH="$HOME/.gem/ruby/2.2.0/bin:$PATH"
fi
if [ -d "$HOME/code/coverity/bin" ] ; then
	PATH="$PATH:$HOME/code/coverity/bin"
fi
EDITOR=vim
VISUAL=$EDITOR
export EDITOR VISUAL
alias gpom="git push origin master"
ddg() { lynx ddg.gg; }

# OPAM configuration
. /home/rylai/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
source ~/perl5/perlbrew/etc/bashrc

eval "$(hub alias -s)"
if [ -f /home/rylai/code/hub/etc/hub.bash_completion.sh ]; then
	. /home/rylai/code/hub/etc/hub.bash_completion.sh
fi

eval `keychain --eval --quiet --quick --agents ssh id_rsa`
