# Helper to check if OSX or WSL
platform="uknown"
unamestr=$(uname)
if [[ $unamestr == "Linux" ]]; then
  platform="Linux"
elif [[ $unamestr == "Darwin" ]]; then
  platform='macOS'
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in $HOME/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME=p1xelHer0

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

if [[ $platform == "macOS" ]]; then
  plugins=(osx zsh-syntax-highlighting)
else
  plugins=(zsh-syntax-high)
fi


# Use Neovim
export EDITOR=nvim


# base16-shell {
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
source $HOME/dotfiles/conf/osx/base16/.colors
# } base16-shell


## nvm {{

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

NODE_VERSION=$(node --version | grep -v -)

## }} nvm


## $PATH {{

# React Native {

# React Native (nvm)
if [[ $platform == "macOS" ]]; then
  export REACT_NATIVE=$HOME/.nvm/versions/node/$NODE_VERSION/bin/react-native
fi

# xcode simctl is needed for react-native emulator
if [[ $platform == "macOS" ]]; then
  export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer/
fi

# } React native


# Rust {
if [[ $platform == "macOS" ]]; then
  export CARGO_HOME=$HOME/.cargo/bin
fi
# } Rust


# Haskell {
if [[ $platform == "macOS" ]]; then
  export STACK_PACKAGES=$HOME/.local/bin
fi
# } Haskell


# Java {
if [[ $platform == "macOS" ]]; then
  export JENV=$HOME/.jenv/bin
fi
# } Java


# Python {
if [[ $platform == "macOS" ]]; then
  export PYENV_ROOT=$HOME/.pyenv
fi
# } Python


# Android {
if [[ $platform == "macOS" ]]; then
  export ANT_HOME=/usr/local/opt/ant
  export MAVEN_HOME=/usr/local/opt/maven
  export GRADLE_HOME=/usr/local/opt/gradle
  export ANDROID_HOME=/usr/local/opt/android-sdk
  export ANDROID_NDK_HOME=/usr/local/opt/android-ndk
fi
# } Android


# Set $PATH {
if [[ $platform == "macOS" ]]; then
  export PATH=$REACT_NATIVE_HOME:$PATH
fi

if [[ $platform == "macOS" ]]; then
  export PATH=$CARGO_HOME:$PATH
fi

if [[ $platform == "macOS" ]]; then
  export PATH=$STACK_PACKAGES:$PATH
fi

if [[ $platform == "macOS" ]]; then
  export PATH=$JENV:$PATH
fi

if [[ $platform == "macOS" ]]; then
  export PATH=$PYENV_ROOT/bin:$PATH
fi

if [[ $platform == "macOS" ]]; then
  export PATH=$ANT_HOME/bin:$PATH
  export PATH=$MAVEN_HOME/bin:$PATH
  export PATH=$GRADLE_HOME/bin:$PATH
  export PATH=$ANDROID_HOME/tools:$PATH
  export PATH=$ANDROID_HOME/platform-tools:$PATH
  export PATH=$ANDROID_HOME/build-tools/23.0.1:$PATH
fi
# } Set $PATH

## }} $PATH


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="$HOME/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate $HOME/.zshrc"
# alias ohmyzsh="mate $HOME/.oh-my-zsh"


## Source and init all helpers {{

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh


# load aliases
source $HOME/dotfiles/conf/osx/alias/.alias


# load fasd
if which fasd > /dev/null; then eval "$(fasd --init auto)"; fi


# fzf, fzf settings and git helpers {
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# fzf settings and git helpers
source $HOME/dotfiles/conf/osx/zsh/.fzf
# } fzf, fzf settings and git helpers


# load jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi


# load pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv virtualenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi


# load stack (does not work...?)
# if which stack > /dev/null; then eval "$(stack --bash-completion-script stack)"; fi


# load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


# npm tab completion
. <(npm completion)

## }} Source and init all helpers
