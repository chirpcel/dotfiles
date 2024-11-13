eval "$(/opt/homebrew/bin/brew shellenv)"

export DOCKER_CONFIG=${XDG_CONFIG_HOME}/docker

# pfetch
export PF_INFO="ascii host cpu os kernel memory shell editor"
export PF_COL1=3
export PF_COL2=8
export PF_PAD1=2
export PF_PAD2=3
export PF_PAD3=5
if [[ "$ATTY" == "true"* ]]; then
  alias clear="clear && pfetch"
fi
clear

# instant prompt
export POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

dir_path=$(dirname "$0")
for script in $(ls $dir_path/source.d/*.zsh | sort); do
  source $script
done
