#!/bin/zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "detected macOS"
    export XDG_CONFIG_HOME=~/Library/Preferences/

    echo "apply vscode configuration"
    ln -s ${PWD}/code/settings.json ./settings.json
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "detected linux"
    export XDG_CONFIG_HOME=~/.config/
    echo "apply vscode configuration"
    ln -s ${PWD}/code/settings.json ${XDG_CONFIG_HOME}/code/settings.json
fi

echo "apply atuin configuration"
ln -s ${PWD}/atuin ${XDG_CONFIG_HOME}/atuin

echo "apply alacritty configuration"
ln -s ${PWD}/alacritty ${XDG_CONFIG_HOME}/alacritty

echo "apply zsh configuration"
ln -s ${PWD}/zsh ${XDG_CONFIG_HOME}/zsh
echo "source ${XDG_CONFIG_HOME}/zsh/source.zsh" >> ~/.zshrc

echo "apply docker configuration"
ln -s ${PWD}/docker ${XDG_CONFIG_HOME}/docker

echo "apply tmux configuration"
ln -s ${PWD}/tmux ${XDG_CONFIG_HOME}/tmux

echo "apply eza configuration"
ln -s ${PWD}/eza ${XDG_CONFIG_HOME}/eza
