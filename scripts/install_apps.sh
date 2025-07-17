#! /usr/bin/env zsh

# Install Homebrew formulae and casks listed in Brewfile

echo "Installing Homebrew formulae..."

# utils
brew install git
brew install mackup
brew install mailsy
brew install imagemagick
brew install fastfetch
brew install tree
brew install mas
brew install ffmpeg
brew install asitop

# dev tools
brew install watchman
brew install gh
brew install gitui
brew install vsce
brew install pnpm
brew install ollama

# terminal utilities
brew install zsh-completions
brew install bitwarden-cli

# environments
brew install uv
brew install openjdk
brew install node
brew install fnm

echo "Installing Homebrew casks..."

# macos quicklook utils
brew install --cask qlcolorcode
brew install --cask qlstephen
brew install --cask qlmarkdown
brew install --cask quicklook-json
brew install --cask qlprettypatch
brew install --cask quicklook-csv
brew install --cask webpquicklook
brew install --cask suspicious-package

# dev apps
brew install --cask visual-studio-code
brew install --cask docker
brew install --cask yaak
brew install --cask ghostty
brew install --cask ollama-app

# browsers
brew install --cask google-chrome
brew install --cask thebrowsercompany-dia
brew install --cask zen

# design
brew install --cask figma
brew install --cask ogdesign-eagle

# apps
brew install --cask raycast
brew install --cask keka
brew install --cask superduper
brew install --cask qbittorrent@lt20
brew install --cask bitwarden
brew install --cask notion
brew install --cask notion-calendar
brew install --cask notion-mail
brew install --cask cyberduck
brew install --cask anydesk
brew install --cask linear-linear

# entertainment
brew install --cask plex
brew install --cask iina
brew install --cask spotify
brew install --cask discord
brew install --cask stremio

# utilities apps
brew install --cask linearmouse
brew install --cask middleclick
brew install --cask tabtab
brew install --cask google-drive
brew install --cask stats
brew install --cask appcleaner
brew install --cask batfi
brew install --cask altserver

echo "Brewfile installation complete."
