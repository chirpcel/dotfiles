# alias
command -v eza > /dev/null && alias ls='eza --icons=auto --group-directories-first'
command -v bat > /dev/null && alias cat='bat --pager=never'
command -v bat > /dev/null && alias catp='/bin/cat'
command -v bat > /dev/null && alias less='bat'
command -v op > /dev/null && alias op-compose='op run --env-file="./op.env" -- docker compose'
command -v gh > /dev/null && noglob alias ??='gh copilot suggest -t shell' 
command -v gh > /dev/null && noglob alias git?='gh copilot suggest -t git' 
command -v gh > /dev/null && noglob alias gh?='gh copilot suggest -t gh' 
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias grep='grep --color=auto'
alias fgrep='fgrep --colod=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias gpg='gpg --expert'
alias python='python3'
alias espinit='cargo generate esp-rs/esp-idf-template cargo'
alias espbuild='docker run -v ${PWD}:/project -w /project espressif/idf-rust:esp32_latest cargo build'
alias libressl='/usr/bin/openssl'
alias psc='docker run -it --rm rustscan/rustscan'

# completions
if type brew &>/dev/null
then
  FPATH="${FPATH}:$(brew --prefix)/share/zsh/site-functions"
fi

# options
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# general
export EDITOR=vim
export PATH=$PATH:~/.bin

# homebrew
export HOMEBREW_NO_ENV_HINTS=1

# bat
export BAT_THEME="ansi"

# java
export JAVA_VERSION=21
