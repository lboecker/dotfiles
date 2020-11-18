#!/bin/sh

if [ -z "$LANG" ] && locale -a | grep -q '^en_US\.utf8$'; then
  export LANG=en_US.UTF-8
fi

prepend_path() {
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      PATH=$1${PATH:+:$PATH}
  esac
}

prepend_path ~/.local/bin
prepend_path ~/.cargo/bin
prepend_path ~/bin

unset -f prepend_path

if [ -n "$BASH_VERSION" ] && [ -n "$PS1" ]; then
  . ~/.bashrc
fi
