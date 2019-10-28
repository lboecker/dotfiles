if [ -z "$LANG" ] && locale -a | grep -q '^en_US\.UTF-8$'; then
  export LANG=en_US.UTF-8
fi

export GOPATH=$HOME/src/gopath
export VAGRANT_DEFAULT_PROVIDER=libvirt

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

pathmunge "$GOPATH/bin"
pathmunge ~/.local/bin

pathmunge ~/bin

unset -f pathmunge

if [ -n "$BASH_VERSION" ] && [ -n "$PS1" ]; then
  . ~/.bashrc
fi
