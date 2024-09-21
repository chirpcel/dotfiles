# xdg
export XDG_CONFIG_HOME=$HOME/Library/Preferences/
export XDG_CACHE_HOME=$HOME/Library/Caches/
export XDG_DATA_HOME=$HOME/Library/Application\ Support/
export XDG_STATE_HOME=$HOME/Library/Saved\ Application\ State/

# pfetch
export PF_INFO="ascii os host kernel memory shell editor palette"
export PF_COL2=9

# instant prompt
export POWERLEVEL9K_INSTANT_PROMPT=quiet
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

dir_path=$(dirname "$0")
for script in $(ls $dir_path/source.d/*.zsh | sort); do
  source $script
done

alias clear="clear && pfetch"
clear
