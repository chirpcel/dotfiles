#!/usr/bin/env just --justfile

# default recipe to display help information
default:
  @just --list

# install hombrew
brew:
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# apply xdg env vars to macOS user
xdg:
    echo "Setting xdg env"
    mkdir ~/Library/Scripts
    cp ${PWD}/launchd/LauncgAgents/net.mkersten.xdg.sh ~/Library/Scripts
    chmod +x ~/Library/Scripts/net.mkersten.xdg.sh
    cp ${PWD}/launchd/LauncgAgents/net.mkersten.xdg.plist ~/Library/LaunchAgents

# install atuin and apply configuration
atuin:
    echo "Installing Atuin"
    brew install atuin
    echo "Applying Atuin configuration"
    ln -sf ${PWD}/atuin ${XDG_CONFIG_HOME}/atuin

# install eza and apply configuration
eza:
    echo "Installing Eza"
    brew install eza
    echo "Applying Eza configuration"
    ln -sf ${PWD}/eza ${XDG_CONFIG_HOME}/eza

# install helix and apply configuration
helix:
    echo "Installing Helix"
    brew install helix
    echo "Applying Helix configuration"
    ln -sf ${PWD}/helix ${XDG_CONFIG_HOME}/helix

# install starship and apply configuration
starship:
    echo "Installing Starship"
    brew install starship
    echo "Applying Starship configuration"
    ln -sf ${PWD}/starship ${XDG_CONFIG_HOME}/starship

# install zed and apply configuration
zed:
    echo "Installing Zed"
    brew install --cask zed
    echo "Applying Zed configuration"
    ln -sf ${PWD}/zed ${XDG_CONFIG_HOME}/zed

# install zellij and apply configuration
zellij:
    echo "Installing Zellij"
    brew install zellij
    echo "Applying Zed configuration"
    ln -sf ${PWD}/zellij ${XDG_CONFIG_HOME}/zellij

# apply zsh configuration
zsh:
    echo "Applying Zsh configuration"
    ln -sf ${PWD}/zsh ${XDG_CONFIG_HOME}/zsh
    echo ${XDG_CONFIG_HOME}/zsh/source.zsh >> ~/.zshrc
