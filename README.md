# ~/.dotfiles

This is my ~/.dotfiles repository. I push settings of of some of my tools into this space.
If you like some of them, feel free to reuse.

#### Requirements
- macOS (Linux WIP)
- ansible

### Installation
Just run the ansible playbook:
```sh
ansible-playbook ${PWD}/playbook.yml
```
or the `install.sh` script.

### Let's showcase! 📽️

#### Terminal

![terminal](https://raw.githubusercontent.com/chirpcel/dotfiles/refs/heads/main/.github/media/terminal.png)

##### Required dependencies
- alcritty
- zellij
- zsh
- starship
- zsh-autosuggestions
- zsh-completions
- zsh-history-substring-search
- zsh-syntax-highlighting

##### Optional dependencies
- atuin
- bat
- eza
- gh (GitHub CLI)
- pfetch-rs
- helix

##### Features
*Ask AI*

With an installed Github cli and an active GitHub Copilot subscripion you ca ask question directly in terinal.

General questions:
```sh
?? How can I find all files with the suffix .searched
```
Git related questions:
```sh
git? How can I list all my commits from yesterday
```

GitHub related questions:
```sh
gh? How can I create a new repository
```

GitHub Copilot will answer with the specific scope.

