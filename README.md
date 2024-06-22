# MacOS : Setup
This is the way I setup all Mac computers when I do a fresh install. Feel free to follow along and take what you like from it.
## Things to do while other stuff installs

 - Settings :
	 - General :
		 - Theme > *Auto*
	 - Desktop & Dock :
		 - Click wallpaper to reveal desktop > *Only in Stage Manager*
		 - Double click a window's title bar to > *Minimize*
		 - Show items > off *(no icons on desktop)*
		 - Hot corners > *⌘ Desktop* in bottom left
		 - Group windows by application > on *(windows grouped in Mission Control)*
		 - Show suggested and recent apps in Dock > off
		 - Position on screen > *right* or *left*
		 - Automatically hide and show the Dock > on
	 - Notifications : disable all you can
 - Clear dock of unwanted apps and make it smaller by dragging
 - Utility terminal commands:
	 - So that the delay needed fot the dock to start unhiding is reduced : `defaults write com.apple.dock autohide-delay -float 0; killall Dock` 
	 - So that the dock unhiding animation in reduced : `defaults write com.apple.dock autohide-time-modifier -float 0.15; killall Dock`
	 - So that the dock stops doing the goofy windows animations :  `defaults write com.apple.dock "mineffect" -string "scale" && killall Dock`
	 - Scroll to Exposé on an app in the dock : `defaults write com.apple.dock "scroll-to-open" -bool "true" && killall Dock`
	 - To disable the accents menu on key long press : `defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"`
	 
## Raycast
Hotkeys to open apps with ⌥ + first letter of app

 - Plugins :
	 - Brew
	 - 
For a quick install of al lthese settings, you can use this settings file config. (link to file)

## Homebrew

First install [Homebrew](https://brew.sh/) : 

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Here are a few usefull **taps** I recommend :

## Terminal
First install [iTerm2](https://iterm2.com/) (using brew is recommanded). Then type in these settings :
 - Profiles:
	 - Keys > Key mappings > *Natural Text Editing* (Presets dropdown, then remove all existing keymaps when asked)
	 - General > *reuse previous session's directory*
	 - Text > Font > *Anonymous Pro* (must be installed)
Then install this color scheme. (to link or to file)

Setup your GitHub SSH Key on your profile, you can follow this tutorial : [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=mac). This facilitates git commands to GitHub

Install [oh-my-zsh](https://ohmyz.sh/). Use the config (link) script to enable the settings, or copy the contents of the .zshrc ans other config files to you own config. (link to files) https://github.com/w3cj/dotfiles

Install [nvm](https://github.com/nvm-sh/nvm). Then proceed with the download of the latest Node version.

## Development
Install Visual Studio Code. You can do it from Brew. Then, use [this link](https://github.com/404mat/setup-vscode) to setup VSCode the way I would do it.

Create a ***dev*** folder in the home directory. This is where all projects will live.

## Finder
 - Advanced :
	 - When performing a search > *Search the current folder*
	 - Show all filename extensions > on
	 - Show warning before changing extension > off
 - General :
	 - New Fidner window show > select root folder
	 - Open folders in tabs instead of new window > on
 - Remove unused items from sidebar
- Rightclick > activate snap to grid
- ⌥ + ⌘ + P to activate the breadcrumbs on the bottom
- Keep folders at the top when sorting : `defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" && killall Finder`
- Default to home directory when saving a document instead of iCloud : `defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"`
- Icons at the top of title bar : `defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true" && killall Finder`


## General use apps
Arc
Bitwarden
Discord
Spotify
VLC (or alternative)

## Utilities
[Loop](https://github.com/MrKai77/Loop)
Hidden Bar
Time since login in menuabr
Linear mouse
App Cleaner
amphetamine
Latest
Dropzone 4
AltTab (swap ⌘Tab with Alt+Tab)
Stats
Itsycal

## Appearence
Icons : https://macosicons.com/#/ make an icon pack


## References
https://macos-defaults.com/