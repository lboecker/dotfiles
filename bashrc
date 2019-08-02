shopt -s checkwinsize
shopt -s histappend

stty -ixon -ixoff

export VISUAL=vim
export PAGER=less

if [[ -x /usr/bin/lesspipe ]]; then
  eval "$(SHELL=/bin/sh lesspipe)"
fi

HISTSIZE=100000
HISTCONTROL=ignoreboth

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -Fhl'
alias la='ls -AFhl'

if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '

if [[ "$TERM" = xterm* ]] || [[ -n "$TMUX" ]]; then
  PS1="\[\e]0;\u@\h: \w\a\]$PS1"
fi

if [[ -z "$BASH_COMPLETION_VERSINFO" ]] && ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
  fi
fi
