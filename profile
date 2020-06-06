#!/bin/sh

if [ -z "$LANG" ] && locale -a | grep -q '^en_US\.utf8$'; then
  export LANG=en_US.UTF-8
fi

export GOPATH=~/src/gopath

pathmunge() {
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      if [ "$2" = "after" ]; then
        PATH=$PATH:$1
      else
        PATH=$1:$PATH
      fi
  esac
}

pathmunge ~/.local/bin
pathmunge "$GOPATH/bin"
command -v yarn >/dev/null 2>&1 && pathmunge "$(yarn global bin)"

pathmunge ~/bin

unset -f pathmunge

if [ -n "$BASH_VERSION" ] && [ -n "$PS1" ]; then
  # shellcheck disable=SC1090
  . ~/.bashrc
fi
