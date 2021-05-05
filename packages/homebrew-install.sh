#!/bin/sh

#Taps
brew tap github/gh
brew tap buo/cask-upgrade
brew tap adoptopenjdk/openjdk
brew tap homebrew/cask-versions

#Binaries
brew install speedtest-cli
brew install git
brew install gh
brew install mas
brew install awscli
brew install python
brew install nvm
brew install nano

#Java
brew install adoptopenjdk
brew install adoptopenjdk8

#Casks
brew install gpg-suite-no-mail --no-quarantine
brew install alacritty --no-quarantine
brew install adobe-creative-cloud --no-quarantine
brew install docker --cask --no-quarantine
brew install google-chrome --no-quarantine
brew install github --no-quarantine
brew install visual-studio-code --no-quarantine
brew install jetbrains-toolbox --no-quarantine
brew install keka --no-quarantine
brew install transmit --no-quarantine
brew install whatsapp --no-quarantine
brew install tower --no-quarantine
brew install google-backup-and-sync --no-quarantine
brew install hyper --no-quarantine
brew install microsoft-teams --no-quarantine
brew install zoom --no-quarantine
brew install visual-studio --no-quarantine
brew install notion --no-quarantine
brew install amazon-workspaces --no-quarantine
brew install amazon-chime --no-quarantine
brew install onedrive --no-quarantine



#Mas

#Magnet
mas install 441258766
#XCode
mas install 497799835

brew cleanup