#!/bin/zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "apply vscode macOS configuration"
    ln -s ${PWD}/code/settings.json ./settings.json
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "apply vscode linux configuration"
    mkdir -p ~/.config/code
    ln -s ${PWD}/code/settings.json ~/.config/code/settings.json
fi

echo "apply alacritty configuration"
mkdir -p ~/.config/alacritty
ln -s ${PWD}/alacritty ~/.config/alacritty

echo "apply zsh configuration"
mkdir -p ~/.config/zsh
ln -s ${PWD}/zsh ~/.config/zsh
echo "source ~/.config/zsh/zshrc" >> ~/.zshrc

echo "apply docker configuration"
mkdir -p ~/.config/zsh
ln -s ${PWD}/docker ~/.docker
