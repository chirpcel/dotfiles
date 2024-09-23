#!/bin/zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "detected macOS"

    echo "apply vscode configuration"
    ln -s ${PWD}/code/settings.json ./settings.json

    echo "apply atuin configuration"
    ln -s ${PWD}/atuin ~/Library/Preferences/atuin

    echo "apply alacritty configuration"
    ln -s ${PWD}/alacritty ~/Library/Preferences/alacritty

    echo "apply zsh configuration"
    ln -s ${PWD}/zsh ~/Library/Preferences/zsh
    echo "source ~/Library/Preferences/zsh/source.zsh" >> ~/.zshrc
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "detected linux"

    echo "apply vscode configuration"
    mkdir -p ~/.config/code
    ln -s ${PWD}/code/settings.json ~/.config/code/settings.json

    echo "apply atuin configuration"
    ln -s ${PWD}/atuin ~/.config/atuin

    echo "apply alacritty configuration"
    ln -s ${PWD}/alacritty ~/.config/alacritty

    echo "apply zsh configuration"
    ln -s ${PWD}/zsh ~/.config/zsh
    echo "source ~/.config/zsh/source.zsh" >> ~/.zshrc
fi

echo "apply docker configuration"
ln -s ${PWD}/docker ~/.docker
