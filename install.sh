#!/bin/zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "apply vscode macOS configuration"
    ln -s ${PWD}/code/settings.json ./settings.json

    echo "apply atuin macOS configuration"
    ln -s ${PWD}/atuin ~/Library/Preferences/atuin
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "apply vscode linux configuration"
    mkdir -p ~/.config/code
    ln -s ${PWD}/code/settings.json ~/.config/code/settings.json

    echo "apply atuin linux configuration"
    ln -s ${PWD}/atuin ~/.config/atuin
fi

echo "apply alacritty configuration"
mkdir -p ~/.config
ln -s ${PWD}/alacritty ~/.config/alacritty

echo "apply zsh configuration"
mkdir -p ~/.config
ln -s ${PWD}/zsh ~/.config/zsh
echo "source ~/.config/zsh/zshrc" >> ~/.zshrc

echo "apply docker configuration"
ln -s ${PWD}/docker ~/.docker
