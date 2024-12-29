eval "$(/opt/homebrew/bin/brew shellenv)"
export ZELLIJ_CONFIG_DIR=~/Library/Preferences/zellij
export ZELLIJ_AUTO_EXIT=true
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
  eval "$(zellij setup --generate-auto-start zsh)"
  alias clear="clear && pfetch"
fi

export STARSHIP_CONFIG=~/Library/Preferences/starship/starship.toml
eval "$(starship init zsh)"

export DOCKER_CONFIG=${XDG_CONFIG_HOME}/docker

# pfetch
export PF_INFO="ascii host cpu os kernel memory shell editor"
export PF_COL1=3
export PF_COL2=8
export PF_PAD1=2
export PF_PAD2=3
export PF_PAD3=5

clear
dir_path=$(dirname "$0")
for script in $(ls $dir_path/source.d/*.zsh | sort); do
  source $script
done
