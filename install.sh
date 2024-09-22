#!/bin/zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    ln -s ${PWD}/code/settings.json ./settings.json
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    mkdir -p ~/.config/code
    ln -s ${PWD}/code/settings.json ~/.config/code/settings.json
fi

mkdir -p ~/.config/alacritty
ln -s ${PWD}/alacritty ~/.config/alacritty

mkdir -p ~/.config/zsh
ln -s ${PWD}/zsh ~/.config/zsh
echo "source ~/.config/zsh/zshrc" >> ~/.zshrc
