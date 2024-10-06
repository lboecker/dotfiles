export LANG=en_US.UTF-8

export VISUAL=vim
export PAGER=less

# Ensure path arrays do not contain duplicates.
typeset -gU fpath path

path=(
  ~/bin
  ~/.bun/bin
  ~/.cargo/bin
  $path
)
