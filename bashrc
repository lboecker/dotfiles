#!/bin/bash

stty -ixon -ixoff

shopt -s checkwinsize
shopt -s histappend

PROMPT_COMMAND=prompt_command

HISTSIZE=100000
HISTCONTROL=ignoreboth

export VISUAL=vim
export PAGER=less

alias grep='grep --color=auto'

if ls --group-directories-first /dev/null > /dev/null 2>&1; then
  alias ls='LC_COLLATE=C ls --color=auto --group-directories-first'
else
  alias ls='LC_COLLATE=C ls --color=auto'
fi

alias ll='ls -Fhl'
alias la='ls -AFhl'

if [[ -f ~/.bash_aliases ]]; then
  . ~/.bash_aliases
fi

if [[ -f ~/miniconda3/etc/profile.d/conda.sh ]]; then
  . ~/miniconda3/etc/profile.d/conda.sh
elif [[ -f ~/anaconda3/etc/profile.d/conda.sh ]]; then
  . ~/anaconda3/etc/profile.d/conda.sh
fi

if command -v lesspipe > /dev/null 2>&1; then
  eval "$(lesspipe)"
fi

if command -v dircolors > /dev/null 2>&1; then
  if [[ -r ~/.dircolors ]]; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
fi

if [[ -z "$BASH_COMPLETION_VERSINFO" ]] &&
   [[ -f /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

prompt_command() {
  local exit_status=$?
  local branch
  local status_color
  local prompt_char=$'\u00b7'

  PS1="\[\e[1;34m\]$CONDA_PROMPT_MODIFIER\[\e[0m\]"

  PS1+="\[\e[1;32m\]\u@\h\[\e[0m\] \[\e[1;34m\]\w\[\e[0m\] "

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
