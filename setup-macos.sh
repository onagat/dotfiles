#!/bin/sh

echo "Setting up $USER's Mac..."

# Ask for the administrator password upfront
sudo -v

# Update macOS and install Xcode Command Line Tools
echo "Updating macOS"
sudo softwareupdate -lia
xcode-select --install

# Check for Homebrew and install if not installed
echo "Checking for Homebrew and installing if not found"
if test ! $(which brew); then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
echo "Updating and upgrading Brew"
brew update
brew upgrade

# Install all Homebrew packages
echo "Installing Homebrew packages"
source "$PWD/packages/homebrew-install.sh"

# Install Node and Yarn through NVM
echo "Installing Node through nvm package manager and Yarn"
mkdir ~/.nvm
## Install latest node version from nvm
nvm install node
## Install yarn globally
npm install --global yarn

# Install packages
echo "Installing npm packages"
source "$PWD/packages/npm.sh"

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Symbolic link dotfiles to ~/
echo "Symbolic linking dotfiles..."
echo "Symbolic linking git"
ln -sf "$PWD/git/.gitattributes" ~
ln -sf "$PWD/git/.gitconfig" ~
ln -sf "$PWD/git/.gitignore_global" ~

echo "Symbolic linking hyper terminal"
ln -sf "$PWD/hyper/.hyper.js" ~

echo "Symbolic linking zsh files"
# ln -sf "$PWD/shell/zsh/.zshrc" ~
# ln -sf "$PWD/shell/zsh/aliases.zsh" ~/.oh-my-zsh/custom/
# ln -sf "$PWD/shell/zsh/exports.zsh" ~/.oh-my-zsh/custom/
# ln -sf "$PWD/shell/zsh/functions.zsh" ~/.oh-my-zsh/custom/
# ln -sf "$PWD/shell/zsh/path.zsh" ~/.oh-my-zsh/custom/
ln -sf "$PWD/shell/zsh/zsh-plugins/zsh-autosuggestions" ~/.oh-my-zsh/custom/plugins
ln -sf "$PWD/shell/zsh/zsh-plugins/zsh-syntax-highlighting" ~/.oh-my-zsh/custom/plugins

# echo "Symbolic linking extras"
# ln -sf "$PWD/shell/.alacritty.yml" ~
# ln -sf "$PWD/shell/.editorconfig" ~
# ln -sf "$PWD/shell/.hushlogin" ~
# ln -sf "$PWD/shell/.inputrc" ~
# ln -sf "$PWD/shell/.prettierrc" ~
# ln -sf "$PWD/shell/.screenrc" ~
# ln -sf "$PWD/shell/.wgetrc" ~

# Update macOS
echo "Updating all Mac Store Apps"
mas upgrade
echo "Updating all Brew Cask Apps"
brew cu --all --force --no-quarantine --cleanup --yes

echo "."
echo ".."
echo "..."
echo "Your Mac has been setup $USER :)"