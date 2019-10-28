stty -ixon -ixoff

shopt -s checkwinsize
shopt -s histappend

PROMPT_COMMAND=prompt_command

HISTSIZE=100000
HISTCONTROL=ignoreboth

export VISUAL=vim
export PAGER=less

if [[ -x /usr/bin/lesspipe ]]; then
  eval "$(SHELL=/bin/sh lesspipe)"
fi

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='ls --color=auto'
alias ll='ls -Fhl'
alias la='ls -AFhl'

if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

if [[ -z "$BASH_COMPLETION_VERSINFO" ]] && ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
  fi
fi

prompt_command() {
  local exit_status=$?
  local branch
  local status_color
  local prompt_char=$'\u00b7'

  PS1="\[\e[1;32m\]\u@\h\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\] "

  if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]] ||
     [[ "$(git rev-parse --is-inside-git-dir 2>/dev/null)" = "true" ]]; then
    branch=$(git symbolic-ref -q --short HEAD)
    [[ -n "$branch" ]] && PS1+="\[\e[1;32m\][$branch]\[\e[0m\] "
  fi

  if [[ "$exit_status" -eq 0 ]]; then
    status_color="\e[1;90m"
  else
    status_color="\e[1;31m"
  fi

  PS1+="\[$status_color\]$prompt_char\[\e[0m\] "

  if [[ "$TERM" = xterm* ]] || [[ -n "$TMUX" ]]; then
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
  fi

  history -a && history -c && history -r
}
