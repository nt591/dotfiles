# make neovim initialize rbenv and pyenv if they are not
# no idea if this a good solution, but it works
# https://superuser.com/questions/270214/how-can-i-change-the-colors-of-my-xterm-using-ansi-escape-sequences
vim() {
  if [ -z ${RBENV_INIT+x} ]; then
    printf "\e[38;5;16mrbenv init... "
    eval "$(command rbenv init -)"
    export RBENV_INIT=1
    printf "\e[38;5;00m\e[48;5;16m done\e[38;5;16m\e[48;5;00m█▓░\e[0m\n";
  fi
  if [ -z ${PYENV_INIT+x} ]; then
    printf "\e[38;5;2mpyenv init... "
    eval "$(command pyenv init -)"
    printf "\e[38;5;00m\e[48;5;2m done\e[38;5;2m\e[48;5;00m█▓░";
    printf "\e[38;5;4m pyenv virtualenv init... "
    eval "$(command pyenv virtualenv-init -)"
    export PYENV_INIT=1
    printf "\e[38;5;00m\e[48;5;4m done\e[38;5;4m\e[48;5;00m█▓░\e[0m\n";
  fi
  nvim "$@"
}